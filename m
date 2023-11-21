Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235017F37A9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 21:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638235.994582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XZ3-0008Sq-D6; Tue, 21 Nov 2023 20:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638235.994582; Tue, 21 Nov 2023 20:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XZ3-0008Qz-9z; Tue, 21 Nov 2023 20:41:45 +0000
Received: by outflank-mailman (input) for mailman id 638235;
 Tue, 21 Nov 2023 20:41:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qy+O=HC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5XZ2-0008Qt-JN
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 20:41:44 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 607a5620-88ae-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 21:41:42 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-32dff08bbdbso4577681f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 12:41:42 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adff341000000b0032f79e55eb8sm15244004wrp.16.2023.11.21.12.41.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 12:41:41 -0800 (PST)
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
X-Inumbo-ID: 607a5620-88ae-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700599301; x=1701204101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tExk3hsqIuVrnXkevypD4dx5ha5mp95KSrRr8yGJ/Nk=;
        b=EQgKEty6wAmQZQfKnt9mIVyXyyWheFEp2BhSr9VxMdD9lTAKRN80iKIkWbDHRlKojn
         t0ll1FTMwoLb4/Qf/QAQzdqR/80/ZC0rOe4wftjkpaVGIXvdg02TA0C7k1NTUJK8flOG
         XWqk/0GmbWxav/Cl77HXUgsM0IjmrDXq8s+Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700599301; x=1701204101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tExk3hsqIuVrnXkevypD4dx5ha5mp95KSrRr8yGJ/Nk=;
        b=WEczQ8mp8Ndr0gV2JpdQXbiuuIedlymNywJr9Ye+LQu7kZ14QIZ/R81db3mZ+5tJj9
         r3pYR7W8kGMT7cfNZRTB2dAPfmwMmmEiWjOJeqrp7LxTAmxWrmQaM9szdQGL8hTrepus
         Dfp6Btuh5nk/1tSeX4Bn7twZ0b5sHU9sOapN+MVnHcmeprIlW/LUh4WbHG9PFpZPZXKZ
         TWyoRCc+mj5iC93GpompY6TTj8/o2gYKGh+ghOy05mmOjeCGnJhCgdeoC0+/3jYFnszY
         2olomOiZ/U03kdZ9eI9CXWBh82CcP5O5nAzQqBV4ablOkZ47uchfKEcKG4hPesx9SffT
         TuYw==
X-Gm-Message-State: AOJu0Yyo+ycPDYpa2w1D3bR3KyPCYxZpul7l9KyeaNG3mvhbzLt83Gh5
	O4pmjMhZX2a1TkNKd09Da1LQxA==
X-Google-Smtp-Source: AGHT+IEHrOh4c+S9bXHzypH3Pyt8HadP375az/nScvUpYaKZOy6rP4YiRXPyAXDujkcG4bTmECRkGw==
X-Received: by 2002:a5d:4c4c:0:b0:32f:b419:6ec2 with SMTP id n12-20020a5d4c4c000000b0032fb4196ec2mr102313wrt.34.1700599301519;
        Tue, 21 Nov 2023 12:41:41 -0800 (PST)
Message-ID: <03c6aa83-6c8f-4d40-9f36-d89725bd614b@citrix.com>
Date: Tue, 21 Nov 2023 20:41:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm/efi: Simplify efi_arch_handle_cmdline()
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, Henry Wang <Henry.Wang@arm.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
 <20231121201540.1528161-5-andrew.cooper3@citrix.com>
 <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <379DF4D1-8DB9-46AF-9586-861ED78DFF38@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2023 8:33 pm, Luca Fancellu wrote:
> + CC henry
>
>> On 21 Nov 2023, at 20:15, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> -Wwrite-strings is unhappy with assigning "xen" to a mutable pointer, but this
>> logic looks incorrect.  It was inherited from the x86 side, where the logic
>> was redundant and has now been removed.
>>
>> In the ARM case it inserts the image name into "xen,xen-bootargs" and there is
>> no logic at all to strip this before parsing it as the command line.
>>
>> The absence of any logic to strip an image name suggests that it shouldn't
>> exist there, or having a Xen image named e.g. "hmp-unsafe" in the filesystem
>> is going to lead to some unexpected behaviour on boot.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> v2:
>> * New.
>>
>> I'm afraid that all of this reasoning is based on reading the source code.  I
>> don't have any way to try this out in a real ARM UEFI environment.
> I will test this one tomorrow on an arm board

Thanks.  I have a sneaking suspicion that:

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 9b9018574919..8bca5b9a1523 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -46,6 +46,12 @@
 #include <xsm/xsm.h>
 #include <asm/acpi.h>
 
+static int __init parse_ucode(const char *s)
+{
+    panic("Xen image name interpreted as a cmdline parameter\n");
+}
+custom_param("xen.efi", parse_xen);
+
 struct bootinfo __initdata bootinfo;
 
 /*

will trigger.

~Andrew

