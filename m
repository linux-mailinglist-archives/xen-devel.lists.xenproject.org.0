Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B54BA25EDE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 16:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880709.1290791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teySf-0002K4-Mw; Mon, 03 Feb 2025 15:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880709.1290791; Mon, 03 Feb 2025 15:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teySf-0002Ib-KF; Mon, 03 Feb 2025 15:34:09 +0000
Received: by outflank-mailman (input) for mailman id 880709;
 Mon, 03 Feb 2025 15:34:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1teySe-0002IV-8q
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 15:34:08 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d97b498-e244-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 16:34:06 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso47045015e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 07:34:06 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e244ef41sm161861495e9.32.2025.02.03.07.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 07:34:05 -0800 (PST)
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
X-Inumbo-ID: 4d97b498-e244-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738596845; x=1739201645; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV64afMfnSedzj8dLy7b7iosTxbmBQh4WuTDt+ykCag=;
        b=HpTs4D0JHjyjenZZCA+wsq216lcVDb3UhhWYdHBp4b7G+jEUJR0n0QVt/L80B50Mwe
         oohP4yjubWytcg6nqKa0q7sCi5ceiWHU715jOKcYv+qdQjnydPqcikyu2k+B5YG9/9hI
         yiCYpQhF6r4arqyBk6tOWFU/+ccgARezR3BzkRh3ofOaw4llqnXF36uOaNdDU5FM3cht
         GHbqUkmDTTziiYnf3Owfjj1zqsvA9+S2ClAeTHGGZf8l6whNmXUTQAiRFlT2CH2OxShK
         ATAznwYT6cKQS21EjO1VyWo+P1Pw3F9Dp+eSYYstyOxEGrJR4o1KvFucP4ot73ZeSgTj
         JcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596845; x=1739201645;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qV64afMfnSedzj8dLy7b7iosTxbmBQh4WuTDt+ykCag=;
        b=TmUKh3Gqna0zE/JGyCRxBocDJZ7xh2b7679YHpdxEIEba5qbvkBtgKOPhTXas9s/GQ
         nXv0WYz4bb5egYjM0fEFYIaBuzsjVnazVMLaAk6AhvOemp03LzrdI1ckcwCKB844A8iz
         SC3kqfgd9+klrm2f6CO6VAvmAQJhRyRSI4SpnopcT/6b2xNW3ZTiYFO8hEhghRjY5Ocw
         lKrqxRBtAX0vEHME3wWw7Y3X8lOWQCimT8O3L0acwYDTilOm31LAZvfqkY/78ZsoOAuU
         8ML4XYykkpd8e382BWd5/f+8Q/D36MIYi6Efw9h+0IrugGfU1n4Fk7D/fYUFUgwaprXD
         H9vg==
X-Forwarded-Encrypted: i=1; AJvYcCWfPTp6S3AbciOEJpu/GqlYRf8hVRu6LsNuBtP7SmgrjItYPKS8TFiflaXo149TXlwchjMzMBa7EVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOO5PIMdTyK/tFak2L8AcQbmiTnxnA1VacPxghr4jKeWiu+QBn
	BwqHPffcrjyxoDWCbLIrjQjneR9mUC5UUhCueyOohSveRd20hYZI
X-Gm-Gg: ASbGnctvtcjAnJ0VKunQDiyn+hLMGx4cKszPGP+e0Ucmsbk6PRV02GJww0c3GfOdjZg
	0xQGiqxES9n6zbKaOMNDcZSRJgxRrrJ4g1LaJm2eTmHYyxDFZVS7JKt0vI+0lH0McO2FYLNaIm2
	bAkkHfig85Xd0g/zXUxxHHUUO0xDTfK5iRZ5sbGiyJNdqVT2pA8OVe1o2MZBVWdHXCVqVrjWdcE
	TUdMmBgQnOWJcr4pOnp2eLopEwi36CC8DwkrAdg2BRyTdNk4rxns/3BDE8mka37n+5QR/Txpc+1
	RrA6DUVhZrHhz5JHP0iXqrR8LrE9X3+4rrxS8sKEg/VcyOWKuBy/mcV4D3aStUnNNUIXGJVVWAK
	u0cU=
X-Google-Smtp-Source: AGHT+IFLFyGakpB35oU27IBMTZd13qFfgieCXABXUVXZxW8ADg5vx+oplk4XSZMsyNZq1e+BCpl/yw==
X-Received: by 2002:a05:600c:35c3:b0:436:9227:915 with SMTP id 5b1f17b1804b1-438dc3c22ebmr177026815e9.9.1738596845317;
        Mon, 03 Feb 2025 07:34:05 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------hOiyqsoQ0RbpOIt0Tk51ZvYc"
Message-ID: <a2e07db1-ce5b-4999-9dbd-e7e097061d2a@gmail.com>
Date: Mon, 3 Feb 2025 16:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/9] asm-generic: move parts of Arm's asm/kernel.h to
 asm-generic
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
 <6404cb5ae077909cbfdf3860d38c701c65547b56.1736334615.git.oleksii.kurochko@gmail.com>
 <2f14762e-d302-483c-8adb-3223e6290de0@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2f14762e-d302-483c-8adb-3223e6290de0@suse.com>

This is a multi-part message in MIME format.
--------------hOiyqsoQ0RbpOIt0Tk51ZvYc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 12:15 PM, Jan Beulich wrote:
> On 08.01.2025 12:13, Oleksii Kurochko wrote:
>> Move the following parts to asm-generic with the following changes:
>> - struct kernel_info:
>>    - Create arch_kernel_info for arch specific kernel information.
>>      At the moment, it contains domain_type for Arm.
>>    - Rename vpl011 to vuart to have more generic name suitable for other archs.
>>    - s/phandle_gic/phandle_intc to have more generic name suitable for other
>>      archs.
>>    - Make text_offset of zimage structure available for RISCV_64.
>> - Wrap by `#ifdef KERNEL_INFO_SHM_MEM_INIT` definition of KERNEL_SHM_MEM_INIT
>>    and wrap by `#ifndef KERNEL_INFO_INIT` definition of KERNEL_INFO_INIT to have
>>    ability to override KERNEL_INFO_SHM_MEM_INIT for arch in case it doesn't
>>    want to use generic one.
>> - All other parts are left as is from Arm's asm/kernel.h
>>
>> Because of the changes in struct kernel_info the correspondent parts of Arm's
>> code are updated.
>>
>> As part of this patch the following clean up happens:
>> - Drop asm/setup.h from asm/kernel.h as nothing depends from it.
>>    Add inclusion of asm/setup.h for a code which uses device_tree_get_reg() to
>>    avoid compilation issues for CONFIG_STATIC_MEMORY and CONFIG_STATIC_SHM.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> I question that what is being moved qualifies for asm-generic, an in particular
> for a header named kernel.h. Some of what you move may make sense to move to
> dom0less-build.h instead. But everything that doesn't fit there needs to find
> a different home, imo.

It doesn't clear what then should be in kernel.h, I did in this way to not have a problem with header inclusion
during the build of Arm.

Definitions DOM0LESSS_* could be moved to dom0less-build.h, all other doesn't really connected only to dom0less feature
and could be re-used for dom0 so it seems like it should leave in a separate header ( if kernel.h isn't good for it ).

Probably kernel.h shouldn't leave in asm-generic as nothing architecture specific is in it, but on the other hand, will it
be okay to have something in xen/include if it isn't supported by all architectures?

~ Oleksii

--------------hOiyqsoQ0RbpOIt0Tk51ZvYc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/27/25 12:15 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2f14762e-d302-483c-8adb-3223e6290de0@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.01.2025 12:13, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Move the following parts to asm-generic with the following changes:
- struct kernel_info:
  - Create arch_kernel_info for arch specific kernel information.
    At the moment, it contains domain_type for Arm.
  - Rename vpl011 to vuart to have more generic name suitable for other archs.
  - s/phandle_gic/phandle_intc to have more generic name suitable for other
    archs.
  - Make text_offset of zimage structure available for RISCV_64.
- Wrap by `#ifdef KERNEL_INFO_SHM_MEM_INIT` definition of KERNEL_SHM_MEM_INIT
  and wrap by `#ifndef KERNEL_INFO_INIT` definition of KERNEL_INFO_INIT to have
  ability to override KERNEL_INFO_SHM_MEM_INIT for arch in case it doesn't
  want to use generic one.
- All other parts are left as is from Arm's asm/kernel.h

Because of the changes in struct kernel_info the correspondent parts of Arm's
code are updated.

As part of this patch the following clean up happens:
- Drop asm/setup.h from asm/kernel.h as nothing depends from it.
  Add inclusion of asm/setup.h for a code which uses device_tree_get_reg() to
  avoid compilation issues for CONFIG_STATIC_MEMORY and CONFIG_STATIC_SHM.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I question that what is being moved qualifies for asm-generic, an in particular
for a header named kernel.h. Some of what you move may make sense to move to
dom0less-build.h instead. But everything that doesn't fit there needs to find
a different home, imo.</pre>
    </blockquote>
    <pre>It doesn't clear what then should be in kernel.h, I did in this way to not have a problem with header inclusion
during the build of Arm.

Definitions DOM0LESSS_* could be moved to dom0less-build.h, all other doesn't really connected only to dom0less feature
and could be re-used for dom0 so it seems like it should leave in a separate header ( if kernel.h isn't good for it ).

Probably kernel.h shouldn't leave in asm-generic as nothing architecture specific is in it, but on the other hand, will it
be okay to have something in xen/include if it isn't supported by all architectures?

~ Oleksii
</pre>
  </body>
</html>

--------------hOiyqsoQ0RbpOIt0Tk51ZvYc--

