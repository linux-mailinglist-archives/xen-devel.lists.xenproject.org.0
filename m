Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7669A45BDB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 11:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896307.1304990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEi6-0003sU-FW; Wed, 26 Feb 2025 10:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896307.1304990; Wed, 26 Feb 2025 10:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEi6-0003qI-CQ; Wed, 26 Feb 2025 10:32:14 +0000
Received: by outflank-mailman (input) for mailman id 896307;
 Wed, 26 Feb 2025 10:32:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRt1=VR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnEi5-0003qC-6l
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 10:32:13 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb7bef20-f42c-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 11:32:03 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ab771575040so130157866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 02:32:03 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed20b288bsm301716266b.165.2025.02.26.02.32.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 02:32:02 -0800 (PST)
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
X-Inumbo-ID: eb7bef20-f42c-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740565923; x=1741170723; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgAtQ24MiroAg5lmOfxJ3bp7MkBK6zWUgwpnLtO8Jic=;
        b=d6sXiCjmU1QD0Y1tSYjAArZhjTh4nW+3dDnRsJx0FE7tRLIebO8t9m8/UASZFq/W+7
         Si+oWP2e7fFxB95k4iFMP6fzEXvpIdlPtvwPVV11yk+vd9r4p3USj5boScYPSlxQ7nXP
         0HRXkRGMykA3R+2jIe0HcozG6xhQycP/jxxSgV7ubiS2Q/XdeZ4YuiSYdc6FkN7cWC/z
         r0bUSB7J+5wGIziTEABgOJqWnESsAnDz81bPho6oRA+Deh6CC119L0uW8ijNzNarSWJs
         L9zjs2CSmFfKvZBN+67MLuukOrl7k0veiwvKDQfSS58xT9Dl32iznGl1tEM2o+YJodu1
         47Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740565923; x=1741170723;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UgAtQ24MiroAg5lmOfxJ3bp7MkBK6zWUgwpnLtO8Jic=;
        b=lZKFr5IkmtrCvOLp6zNFlHEhEnBAZBJqs9KVPfmcsSS8oavVAWR/O3Vc3xvy/mj8cw
         Et/APPF8mZZlP34m6ugglDpmQW7TtS9vGHbwX/ixoz6n/FPLXuajczOctEuRohz7yKIM
         doUIoutrgpghkoANUBkFeTO648I5PktOak0QB0oNgZgP5Zq5j3Q0n/TtqsEZupbadtpE
         hG8sNhe0qGt8pSvTQ1ZmXKHFD3NKQnpiD7QO/HwN/w/TrIK6CO3ROUSimMrzXfZXzMwZ
         njq6y7pBMJxbHF2HzPYEZLTQrxAqOI4hAFQchwwpRgO5rsuXsHmkqurDnELdp/EwT759
         P6kA==
X-Gm-Message-State: AOJu0YzeBF3kkio/ZYhfJGDP5QI+2QEbD/3uX6kV4paihCQ7nuZUL9uv
	sZgqjDZG5CgkXQfwyGhN3SrDY3R67iqr+VVj09Tz9JHQ/MtWYQhH
X-Gm-Gg: ASbGncuGAFOnZvw+eogaM9FmeL2J4U53WlzVEfnb1EI9UhAHUKSN6s4rInY9+AzFbLl
	rRYeB5IU34c8sqUq+kETaoAtpm5az930zAWa2fdEQd38kLblOq3exL41EawWHRbCkEN4pgEH4u2
	bFYxWLNIvE/xS8LLY/okSv0hRL5nUSymIa0AxI6dVr3Aq1FKFFM4FTJqml+S9It0XntKFei7Qd2
	TlrViCLgMpLmyq7Q7/X0tpqpes09NuBeA6zlBtkOJ6jcp1wlyoKrp9WDGT/V8euzFgev6TtiPRa
	lxw4PybdobW0rdOsW/HxbTIN6OfeLL9+36Q=
X-Google-Smtp-Source: AGHT+IFV+2iWcCoVqQ7TCImgqzAHCqQrqO0MO7eJtJngv/M0hVbJ4tALxwAHw0n7DhKDq/E9di4U7Q==
X-Received: by 2002:a17:907:c80f:b0:abe:cfbf:3da6 with SMTP id a640c23a62f3a-abecfbf4065mr518899466b.19.1740565922949;
        Wed, 26 Feb 2025 02:32:02 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------jNVDYG1ClSaG060UiQpYDhFs"
Message-ID: <31db7d34-3338-4d88-8721-f2cd4b68f3b9@gmail.com>
Date: Wed, 26 Feb 2025 11:32:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG.md: Finalize changes in 4.20 release cycle
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>, roger.pau@citrix.com
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
References: <20250224182548.10812-1-oleksii.kurochko@gmail.com>
 <Z77SQ1MRKXzVqJ_z@macbook.local>
 <BL1PR12MB58496C63F977A8D768D6EB08E7C22@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <BL1PR12MB58496C63F977A8D768D6EB08E7C22@BL1PR12MB5849.namprd12.prod.outlook.com>

This is a multi-part message in MIME format.
--------------jNVDYG1ClSaG060UiQpYDhFs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/26/25 10:10 AM, Chen, Jiqian wrote:
> Hi,
>
> On 2025/2/26 16:35, Roger Pau Monné wrote:
>> On Mon, Feb 24, 2025 at 07:25:48PM +0100, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> ---
>>>   CHANGELOG.md | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 1979166820..e6c6144ef1 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -18,6 +18,11 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>    - Fixed blkif protocol specification for sector sizes different than 512b.
>>>    - The dombuilder in libxenguest no longer un-gzips secondary modules, instead
>>>      leaving this to the guest kernel to do in guest context.
>>> + - Reduce xenstore library dependencies.
>>> + - On Arm:
>>> +   - Several FF-A support improvements: add indirect messages support, transmit
>>> +     RXTX buffer to the SPMC, fix version negotication and partition information
>>> +     retrieval.
>>>    - On x86:
>>>      - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
>>>      - Prefer CMOS over EFI_GET_TIME as time source.
>>> @@ -25,6 +30,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>        interrupts instead of logical destination mode.
>>>   
>>>   ### Added
>>> + - Support device passthrough when dom0 is PVH on Xen.
>> I've spoken with Jiqian from AMD and the QEMU side is still pending to
>> be merged, so I'm not sure I would list it here yet.  Also AFAICT the
>> current work just enables passthrough from a PVH dom0 to an HVM domU,
>> but not to PV domUs.  This would need to be clarified.
> Yes, I only added pci passthrough for HVM domUs when dom0 is PVH.
> And the qemu patch isn't merged yet.
> https://lore.kernel.org/xen-devel/BL1PR12MB58491271C360CE4345A915AFE7C02@BL1PR12MB5849.namprd12.prod.outlook.com/
> I think we need to wait qemu patch merged and then you can add an entry like:
> - On x86:
>    - Support pci passthrough for HVM domUs when dom0 is PVH.

Thanks for clarifying. I will drop that for now.

Best regards,

  Oleksii

--------------jNVDYG1ClSaG060UiQpYDhFs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/26/25 10:10 AM, Chen, Jiqian
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BL1PR12MB58496C63F977A8D768D6EB08E7C22@BL1PR12MB5849.namprd12.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">Hi,

On 2025/2/26 16:35, Roger Pau Monné wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Mon, Feb 24, 2025 at 07:25:48PM +0100, Oleksii Kurochko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 CHANGELOG.md | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1979166820..e6c6144ef1 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -18,6 +18,11 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
  - Fixed blkif protocol specification for sector sizes different than 512b.
  - The dombuilder in libxenguest no longer un-gzips secondary modules, instead
    leaving this to the guest kernel to do in guest context.
+ - Reduce xenstore library dependencies.
+ - On Arm:
+   - Several FF-A support improvements: add indirect messages support, transmit
+     RXTX buffer to the SPMC, fix version negotication and partition information
+     retrieval.
  - On x86:
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
    - Prefer CMOS over EFI_GET_TIME as time source.
@@ -25,6 +30,8 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
      interrupts instead of logical destination mode.
 
 ### Added
+ - Support device passthrough when dom0 is PVH on Xen.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I've spoken with Jiqian from AMD and the QEMU side is still pending to
be merged, so I'm not sure I would list it here yet.  Also AFAICT the
current work just enables passthrough from a PVH dom0 to an HVM domU,
but not to PV domUs.  This would need to be clarified.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Yes, I only added pci passthrough for HVM domUs when dom0 is PVH.
And the qemu patch isn't merged yet.
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/BL1PR12MB58491271C360CE4345A915AFE7C02@BL1PR12MB5849.namprd12.prod.outlook.com/">https://lore.kernel.org/xen-devel/BL1PR12MB58491271C360CE4345A915AFE7C02@BL1PR12MB5849.namprd12.prod.outlook.com/</a>
I think we need to wait qemu patch merged and then you can add an entry like:
- On x86:
  - Support pci passthrough for HVM domUs when dom0 is PVH.</pre>
    </blockquote>
    <pre>Thanks for clarifying. I will drop that for now.</pre>
    <pre>Best regards,</pre>
    <pre> Oleksii</pre>
  </body>
</html>

--------------jNVDYG1ClSaG060UiQpYDhFs--

