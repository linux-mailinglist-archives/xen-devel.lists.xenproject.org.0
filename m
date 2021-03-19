Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B1F341E77
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 14:37:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99257.188622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFIg-0000Mf-9e; Fri, 19 Mar 2021 13:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99257.188622; Fri, 19 Mar 2021 13:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFIg-0000MG-64; Fri, 19 Mar 2021 13:36:26 +0000
Received: by outflank-mailman (input) for mailman id 99257;
 Fri, 19 Mar 2021 13:36:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai2o=IR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lNFIe-0000M8-OG
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:36:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fac01dab-476d-4c3e-b730-20c5ed49577e;
 Fri, 19 Mar 2021 13:36:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF610AC17;
 Fri, 19 Mar 2021 13:36:22 +0000 (UTC)
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
X-Inumbo-ID: fac01dab-476d-4c3e-b730-20c5ed49577e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616160982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kQLG9AatNAgHgO+1lP39jZTeoNoMecd0012Bi/J59j8=;
	b=tZvzLXgfVZ4XhUDGLhK0GxRQ8t2Zwl/snXDZUkVTwgQuxlhGaBEbj4izsbRamuFXLrViRV
	gjj5vaRy83jzLXPE+omC4jDW+w3hjXQOdpG6XoD2L54xnfkgxQL+SvCDRmBBZHFk2Mhtjm
	2bXdv8PKExJVaDig3L9ZR2PH2Tv7d2A=
Subject: Re: Ryzen 4000 (Mobile) Softlocks/Micro-stutters
To: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9lQU_gCfRzGyyNb2j86pxTMi1IET1Iq7iK3994agUZPrTI5Xd-aCJAaRYuJlD3L5LT2WaV4N3-YF4xKl5ukialT0M_YD0ve6gmDFFfatpXw=@protonmail.com>
 <T95F2Mi9RUUZ4w2wdeRqqM4uRyKgOFQNyooqEoTTDByK-0t9hZ1izG68lf90iExeYabEPSEv8puUeg0SEJtOmz8vYbVox2za28DXLd_h-_s=@protonmail.com>
 <eba12ea4-5dda-f112-0e33-714e859b9b03@suse.com>
 <815f3bc3a28a165e8fa41c6954a6d00db656e3c3.camel@suse.com>
 <Y-6A5xIyjtCDwG3tBoyQnWpypF_eebCmuCjyUovcwd-ZD6wgFvNmR8VAdscAiwKp41toxpDxsgeF10FsEBn2Xm14b8bl9cniO_-TRNwm9mI=@protonmail.com>
 <1fc0e850-8a08-760f-c8cb-ad73dda4a37b@suse.com>
 <PGn1fJFla-7vPl7QFdkkBX8ASy2cWw-f2HBW7rWE5KgeFEZ_kNUp8Yq5zMaGyS38wMWofVshR75o1jD1rXZeTWtE8XhKQvEq_Dmgsnu-Uy0=@protonmail.com>
 <4916dec1-1bb9-7e6f-2fe5-577bbab92861@suse.com>
 <d7aaa4e7fa3083ff5bb18e18c5cd8274194109ba.camel@suse.com>
 <qcVhNDiGu6deufXzsHKbjEr4n3JuLC2cFNc1ORb02vl1IaPjm-37uFkXANQ-i7v77zP1GFxbYoTEG713C4EyHYBrE5YPvA5bXdPc4Brxg5U=@protonmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e963858-6834-96de-4bf2-956f905160b4@suse.com>
Date: Fri, 19 Mar 2021 14:36:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <qcVhNDiGu6deufXzsHKbjEr4n3JuLC2cFNc1ORb02vl1IaPjm-37uFkXANQ-i7v77zP1GFxbYoTEG713C4EyHYBrE5YPvA5bXdPc4Brxg5U=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.03.2021 13:45, Dylanger Daly wrote:
> Hi Everyone, I've just confirmed only `tsc=unstable` is required,
> that specific change has fixed the issues I was having on the
> Lenovo X13, I assume this is because Lenovo's Clock isn't correct?

Hard to tell without knowing what actually went wrong. It wasn't
very long ago that we had to fix an issue where iirc a machine
wouldn't even boot because of some strange state firmware put
the TSCs in. We were able to work around this, such that
"tsc=unstable" wouldn't be needed. So while there may indeed be
some oddity with what firmware does, there may also be a way to
work around this. But I guess it would take someone debugging
this on an affected system...

Jan

