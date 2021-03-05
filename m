Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370DF32E64F
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 11:27:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93598.176546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI7fT-0004NV-Iq; Fri, 05 Mar 2021 10:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93598.176546; Fri, 05 Mar 2021 10:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI7fT-0004N7-Fr; Fri, 05 Mar 2021 10:26:47 +0000
Received: by outflank-mailman (input) for mailman id 93598;
 Fri, 05 Mar 2021 10:26:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lI7fR-0004N2-8X
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 10:26:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53cbc71e-dcfc-441e-af64-5c50e148d4ef;
 Fri, 05 Mar 2021 10:26:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DF96AE6E;
 Fri,  5 Mar 2021 10:26:43 +0000 (UTC)
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
X-Inumbo-ID: 53cbc71e-dcfc-441e-af64-5c50e148d4ef
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614940003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n+mlQsaxEZwAIkPVkyrnBX0ue2JX7Y/gWQgsNuZQEVc=;
	b=djpaAAFCHn0MArDpsA9URP1QFap4al8dObjCkNyob4AmsW3V7hKW9mSHLxO1oqIIdBuG76
	LKIB3k/cP6ElFFfCDWOXNQmRODP16AQdwt9ZlYb/UzRJqz+JGsxhqVvVo/7opqj5wKQsAo
	JRe/49AVrVe1Ln7ekY3YlSFBzJjLiVY=
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ian Jackson <iwj@xenproject.org>
References: <20210304144755.35891-1-roger.pau@citrix.com>
 <24640.62938.427877.757656@mariner.uk.xensource.com>
 <YED5Czp+v2xFSCOG@Air-de-Roger>
 <24640.64194.445736.52546@mariner.uk.xensource.com>
 <YEERBL4AO371ZxmP@Air-de-Roger>
 <24641.5419.379341.215528@mariner.uk.xensource.com>
 <YEEcR/Jb5TgI31rY@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d26997f-6ec6-00f2-3224-b079c1a2b9f4@suse.com>
Date: Fri, 5 Mar 2021 11:26:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEEcR/Jb5TgI31rY@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.03.2021 18:43, Roger Pau Monné wrote:
> One option we could go for is making this behavior depend on Kconfig:
> enable strict MSR policy for debug builds and fallback to the
> 'relaxed' one for non-debug builds. That might get us some more data,
> but again I fear most people out there will run non-debug builds
> anyway.

Plus of course we'd almost never test the "relaxed" code path(s).

Jan

