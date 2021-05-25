Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834B93904D7
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 17:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132246.246742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llYlH-0002TX-6w; Tue, 25 May 2021 15:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132246.246742; Tue, 25 May 2021 15:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llYlH-0002R1-3k; Tue, 25 May 2021 15:14:27 +0000
Received: by outflank-mailman (input) for mailman id 132246;
 Tue, 25 May 2021 15:14:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llYlF-0002Qv-Ih
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 15:14:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43a11048-d434-4ad1-98e9-2687378d547e;
 Tue, 25 May 2021 15:14:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF9B6AEB3;
 Tue, 25 May 2021 15:14:23 +0000 (UTC)
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
X-Inumbo-ID: 43a11048-d434-4ad1-98e9-2687378d547e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621955664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+xX92bmI+b/vVYYZvh4+HNVQN3U8vjaSOXXPhJLctE=;
	b=dwvhv6o6Bv/Len30Q2LGQvC1lCGrIiqOHYN4JDMAy2ql+CaanCpU65yp/GUhwwu8b4NJuR
	7DTdVC3PZPon0E0VYbJbjPOQHBzyiMgbpACpDUJ++Q2rXSbYIv/oYPhC/jQ4/kg3FinQiA
	llW3gQIwaR00zEwyriqifnC1mxzsE7U=
Subject: Re: [PATCH 2/3] firmware/shim: drop XEN_CONFIG_EXPERT uses
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
 <56bb5e87-fe35-75a8-fe18-ecc959b21799@suse.com>
 <YK0GUBthlbzoNIK/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8d03aa9-92b7-01a8-f043-f705ae25c0ea@suse.com>
Date: Tue, 25 May 2021 17:14:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK0GUBthlbzoNIK/@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 25.05.2021 16:14, Roger Pau Monné wrote:
> On Fri, Apr 30, 2021 at 04:44:21PM +0200, Jan Beulich wrote:
>> As of commit d155e4aef35c ("xen: Allow EXPERT mode to be selected from
>> the menuconfig directly") EXPERT is a regular config option.
> 
> Might be worth mentioning that the default pvshim config already have
> EXPERT selected.

That's not really related, as what the patch is removing is stale
regardless of config, but I've added a remark.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <rogerpau@citrix.com>

Thanks.

Jan

