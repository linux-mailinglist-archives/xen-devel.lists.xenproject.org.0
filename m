Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A6989E52F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 23:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702843.1098461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruJLU-0008Q3-Rs; Tue, 09 Apr 2024 21:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702843.1098461; Tue, 09 Apr 2024 21:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruJLU-0008NC-Op; Tue, 09 Apr 2024 21:49:36 +0000
Received: by outflank-mailman (input) for mailman id 702843;
 Tue, 09 Apr 2024 21:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Fcd=LO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ruJLT-00082a-G7
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 21:49:35 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ce64057-f6bb-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 23:49:33 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-78d61a716ddso214512385a.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 14:49:33 -0700 (PDT)
Received: from ?IPV6:2a05:87c6:1ccf:2:6740:ba01:927e:a522?
 ([2a05:87c6:1ccf:2:6740:ba01:927e:a522])
 by smtp.gmail.com with ESMTPSA id
 a8-20020ad441c8000000b0069b1f86f754sm1820974qvq.28.2024.04.09.14.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 14:49:32 -0700 (PDT)
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
X-Inumbo-ID: 0ce64057-f6bb-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712699372; x=1713304172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L4uyCYQDFkE7GExI6Jd0kvHjyswAt9S8ciEET657++I=;
        b=rEs13gISWncTm1/EEFpEcB5gd2VOmv1MvV0Xb9+uTOXK8ZUFCIkgGv0jWhDc7Bryby
         LrZ4l6RkLZlhKnAadbGaYNVHXvgtshvJ8PtYGMLw56Y5FDLfTLiBmNx12GQo4n5ToUXq
         SJby1d8UVvWIub3nMeHPpSnbWztAiwIXNC5nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712699372; x=1713304172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4uyCYQDFkE7GExI6Jd0kvHjyswAt9S8ciEET657++I=;
        b=KqrRrsi8jP5/Yzks0B1IMIqQZALhyeGJ9V5fuuRjLK1rBn2jWQ7Zu9SFsIbdaXRuF2
         dtPllNs2MY7U1ftZ56U3RWtxAyYcbZXGTTdKHm8SHrrwvtDR+ql1dTZ8g9Dyq/DSzUG1
         7ArGuLVC9yFfNUMI8ycK0jGBiQBE5jlutkg40rfFlRleFdM2KlbUK/ay0VYGmjGqYJNp
         ViLP1eSNj7mhSnSu3gRf7wfebe7OzVeVO/PVt6wpZBGOvMhgiAbdTi17kiWJ0r6HP0Jz
         7+NskWoxULdCCicvEd7Al8QCXOSRynLNZ32siruJh0bzin8es6ZtiTO+wHGYq2fiTBEy
         Mfog==
X-Gm-Message-State: AOJu0YwdK9C80irmDhlbg6ZXhuuw5n6k7obxhJxU9Z15oorpc7Z0UW3n
	fX0+tHXsflN/k05AMbc9nUN0q9vZH7fld0b3rf+1NaJK8gQIjTKMtotysybKyQo=
X-Google-Smtp-Source: AGHT+IGnHj+mxEKrSCE+1h/0mz5J5+T/u4Tmitpq7xMNkrJowpmsiF78oTwn5ssM4J4L5qSBUVCv7w==
X-Received: by 2002:a0c:c489:0:b0:69b:23eb:3d3a with SMTP id u9-20020a0cc489000000b0069b23eb3d3amr717826qvi.35.1712699372565;
        Tue, 09 Apr 2024 14:49:32 -0700 (PDT)
Message-ID: <8dec3edb-973a-481c-899b-b30c970ea928@citrix.com>
Date: Tue, 9 Apr 2024 22:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.5 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and
 conditionalise ucode
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>
References: <ZTu_WxdWTrthCs4m@macbook>
 <20231027191926.3283871-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2404091435170.2245130@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2404091435170.2245130@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/04/2024 10:42 pm, Stefano Stabellini wrote:
> On Fri, 27 Oct 2023, Andrew Cooper wrote:
>> We eventually want to be able to build a stripped down Xen for a single
>> platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
>> available to randconfig), and adjust the microcode logic.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I read the discussion here:
> https://marc.info/?l=xen-devel&m=169865507432363
> https://lore.kernel.org/xen-devel/ZT9yNrdoCKZs3_uY@macbook/
>
> I think we want two top-level simple CONFIG_AMD and CONFIG_INTEL
> options. Do we also want finer granular sub-options such as
> CONFIG_AMD_CPU and CONFIG_INTEL_CPU, which would be controlled by the
> top-level options CONFIG_AMD and CONFIG_INTEL? I think we could go
> either way. CONFIG_{AMD,INTEL} could be sufficient, but also having
> them control CONFIG_{AMD,INTEL}_CPU and CONFIG_{AMD,INTEL}_IOMMU is
> fine too.
>
> We already have CONFIG_{AMD,INTEL}_IOMMU. At the time I wondered if we
> could have just used CONFIG_{AMD,INTEL} for evertything. But given we
> have CONFIG_{AMD,INTEL}_IOMMU, I can see why the reviewers suggested to
> use CONFIG_{AMD,INTEL}_CPU.
>
> I would have introduced CONFIG_{AMD,INTEL} only, given that it is not
> possible to have an AMD CPU with an INTEL IOMMU and vice versa. 
>
> Anyway, I don't really have a strong opinion either way but we need this
> patch to move forward one way or another so:
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

FWIW, I have a very strong preference for the v2 of this patch (which is
just simply CONFIG_{AMD,INTEL}), rather than this instance of it.

Subdividing it is a mistake IMO, as it draws boundaries that doesn't
exist in reality.

There's nothing CONFIG_{AMD,INTEL} can reasonably be used for which
isn't this purpose.

Having IOMMU separate makes sense at least in principle.  There are
(well - were) some systems without an IOMMU, and you could be targetting
one of those.

However, there's nothing you can reasonably to to pick and choose
between microcode loading vs the other large number of
$foo/{intel,amd}.c splits we have through the codebase.

~Andrew

