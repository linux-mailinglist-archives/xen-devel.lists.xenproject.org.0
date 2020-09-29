Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE6427BCA5
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 07:57:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kN8cm-0002V7-Mz; Tue, 29 Sep 2020 05:56:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kN8cl-0002V2-AE
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 05:56:27 +0000
X-Inumbo-ID: 0b93cfe6-2680-4d24-87c1-9cc4608f729a
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b93cfe6-2680-4d24-87c1-9cc4608f729a;
 Tue, 29 Sep 2020 05:56:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601358984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3ED4mqarxqfFJ1ah9UG3ctgrf/zpstN0mXDeP983Nc=;
 b=DbT3hQh7MGavGIiXF92XaQ1pAzkBSYiSLroo7jSp9WH9BRtYWFFzSjd6GEnfIToQqF4iwq
 3fwrWyygCMPopgIGPJC+yQpFA/dLxMY3fgmiJa9QgvDs28fsB9LR1HYj/RUfgEhoa75lwE
 pEwVvgY1J4gJObI++UaUWY3aDvR8bJ8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E442AB3E;
 Tue, 29 Sep 2020 05:56:24 +0000 (UTC)
Subject: Re: [RESEND] [PATCH] tools/python: Pass linker to Python build process
To: Pry Mar <pryorm09@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, ehem+xen <ehem+xen@m5p.com>,
 ijackson <ijackson@chiark.greenend.org.uk>
References: <CAHnBbQ_makue63BgbimKhwuTuu_8stAL7kE_qjhrPav=emeiTA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e61a7f70-2888-8dad-7168-1b0e69d60323@suse.com>
Date: Tue, 29 Sep 2020 07:56:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHnBbQ_makue63BgbimKhwuTuu_8stAL7kE_qjhrPav=emeiTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.09.2020 04:27, Pry Mar wrote:
>> Unexpectedly the environment variable which needs to be passed is
>> $LDSHARED and not $LD.  Otherwise Python may find the build `ld` instead
>> of the host `ld`.
>>
>> Replace $(LDFLAGS) with $(SHLIB_LDFLAGS) as Python needs shared objects
>> it can load at runtime, not executables.
>>
>> This uses $(CC) instead of $(LD) since Python distutils appends $CFLAGS
>> to $LDFLAGS which breaks many linkers.
>>
>> Signed-off-by: Elliott Mitchell <ehem+xen@xxxxxxx>
> 
> Tested-by: Mark Pryor <pryorm09@xxxxxxxx>

Just fyi: With this zapping of the domain that looks to have appeared
on your side (list archive has the same), I'm afraid such a tag is
unusable. While one might infer it from From: of the mail, there's no
guarantee that what's intended.

Jan

