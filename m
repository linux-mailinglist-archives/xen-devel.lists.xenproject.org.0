Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B28277FB9
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 07:00:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLfpH-0006Yv-NM; Fri, 25 Sep 2020 04:59:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ocWZ=DC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLfpG-0006Yq-PW
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 04:59:18 +0000
X-Inumbo-ID: ef250099-b52e-4c4f-a3da-2fe66a3c0d19
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef250099-b52e-4c4f-a3da-2fe66a3c0d19;
 Fri, 25 Sep 2020 04:59:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601009956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0v/WMlgkfi9TYVGlZa1tHEnF9uCEChA3owDrpuVw0jM=;
 b=pW2PW2oKpdAw+Wh0NONQyrm0N/VLM6lRIaIswITgaK3+CzNmKF5ulKBULbmoY+4pGZqC05
 JLb76gsc/VAQYA45KeeFj7mqwoudhL9tYspT6b+DIyBgl5Ah+4NBmCoJnU45QViRo4DCN1
 idA70Jo3eAkujrnQh8CSQ4khlfWtVQo=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7333AAB0E;
 Fri, 25 Sep 2020 04:59:16 +0000 (UTC)
Subject: Re: [PATCH] tools/libs/guest: fix out of tree builds of libxenguest
 users
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200923052401.24917-1-jgross@suse.com>
 <a99b7ed3-cd1c-a63d-cc9b-66749ac94ce4@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1a17f926-c08b-97db-e5a4-bdfcc36bca03@suse.com>
Date: Fri, 25 Sep 2020 06:59:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a99b7ed3-cd1c-a63d-cc9b-66749ac94ce4@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 24.09.20 22:23, Andrew Cooper wrote:
> On 23/09/2020 06:24, Juergen Gross wrote:
>> xenguest.h includes xenctrl_dom.h, which is including the Xen internal
>> xen/libelf/libelf.h. This results in build failures for components
>> using libxenguest when being built outside the Xen build environment.
>>
>> Fix that by guarding the include of xenctrl_dom.h with
>> "#ifdef __XEN_TOOLS_".
>>
>> Fixes: 7e0165c19387 ("tools/libxc: untangle libxenctrl from libxenguest")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   tools/libs/guest/include/xenguest.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tools/libs/guest/include/xenguest.h b/tools/libs/guest/include/xenguest.h
>> index 4643384790..5cd502f644 100644
>> --- a/tools/libs/guest/include/xenguest.h
>> +++ b/tools/libs/guest/include/xenguest.h
>> @@ -22,7 +22,9 @@
>>   #ifndef XENGUEST_H
>>   #define XENGUEST_H
>>   
>> +#ifdef __XEN_TOOLS__
>>   #include <xenctrl_dom.h>
>> +#endif
> 
> I have to admit that this doesn't feel right to put into a public header.
> 
> Can't we split xenctrl_dom in half and merge the relevant subsets into
> xen{ctrl,guest}.h ?

Yes, but the xenctrl.h half will be empty :-) (see my patch from Sep
9th).

The #ifdef will remain, though.

Another solution would be to make xenctrl_dom.h an internal header
again which has to be included by every user needing the domain loader
stuff. Question then is why all of this is part of libxenguest.

Or we could remove the prototype of xc_dom_register_loader() and the
definition of struct xc_dom_loader from the header and make it private
to libxenguest, and modify struct xc_dom_image to hold an opaque pointer
to struct elf_dom_parms instead of having it as a sub-structure. This
would remove the need to include xen/libelf/libelf.h from xenctrl_dom.h.
The question would then be how usable the whole stuff is for someone not
having the layout of struct elf_dom_parms.

And finally we could split libxenguest and have a libxendomload which
will be usable Xen internal only.

Any preference?


Juergen

