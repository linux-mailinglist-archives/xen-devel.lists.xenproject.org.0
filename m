Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE4C310DAE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 17:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81842.151308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83jZ-0004g9-Pv; Fri, 05 Feb 2021 16:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81842.151308; Fri, 05 Feb 2021 16:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l83jZ-0004fn-Mu; Fri, 05 Feb 2021 16:13:25 +0000
Received: by outflank-mailman (input) for mailman id 81842;
 Fri, 05 Feb 2021 16:13:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IalI=HH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l83jY-0004fi-7f
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 16:13:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e263937d-e489-46ef-a3a4-d41fa0f964e1;
 Fri, 05 Feb 2021 16:13:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A21B7AC43;
 Fri,  5 Feb 2021 16:13:22 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e263937d-e489-46ef-a3a4-d41fa0f964e1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612541602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b3kirXJU48dypmJzCOnO80H3HzLlx3BNfZfWBsqH/yU=;
	b=fZUWwOvCT/fDNtuDWTnP1guXCOci10CkdX7b/qwhurFlNALpFAH3VFiQZkbUY3XV1V52Ey
	ok3dA8l6RhswfTxuwU2Ty9KpTdmqrB8ZnvwRUADoary/pw/TpMdURpxl431CHBN+z0YF+O
	w8pB5OPjmKpYa7fnjJeedD6IToAG8b0=
Subject: Re: [PATCH 02/17] x86: split __{get,put}_user() into "guest" and
 "unsafe" variants
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <13d1d621-21db-0e59-6603-2b22b6a9d180@suse.com>
 <YB1nhBeMRVGyO8Fk@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d23dc40c-3b37-ade2-f987-4f79b06901b1@suse.com>
Date: Fri, 5 Feb 2021 17:13:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YB1nhBeMRVGyO8Fk@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.02.2021 16:43, Roger Pau Monné wrote:
> On Thu, Jan 14, 2021 at 04:04:11PM +0100, Jan Beulich wrote:
>> The "guest" variants are intended to work with (potentially) fully guest
>> controlled addresses, while the "unsafe" variants are not.
> 
> Just to clarify, both work against user addresses, but guest variants
> need to be more careful because the guest provided address can also be
> modified?
> 
> I'm trying to understand the difference between "fully guest
> controlled" and "guest controlled".

Not exactly, not. "unsafe" means access to anything which may
fault, guest controlled or not. do_invalid_op()'s reading of
the insn stream is a good example - the faulting insn there
isn't guest controlled at all, but we still want to be careful
when trying to read these bytes, as we don't want to fully
trust %rip there.

Jan

