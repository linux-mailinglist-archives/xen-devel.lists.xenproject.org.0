Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F99E625E
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 01:43:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849391.1263987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJMQw-0001pg-5Q; Fri, 06 Dec 2024 00:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849391.1263987; Fri, 06 Dec 2024 00:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJMQw-0001nw-2n; Fri, 06 Dec 2024 00:43:02 +0000
Received: by outflank-mailman (input) for mailman id 849391;
 Fri, 06 Dec 2024 00:43:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x44n=S7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tJMQv-0001nq-1H
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 00:43:01 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ab69cb9-b36b-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 01:42:59 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434a8640763so11082825e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2024 16:42:59 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386219095desm3235088f8f.64.2024.12.05.16.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 16:42:58 -0800 (PST)
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
X-Inumbo-ID: 0ab69cb9-b36b-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733445779; x=1734050579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ANN8Pw2RISl9iiMi3wsdHQnT40gHOJrWkb6RYxQgKE=;
        b=WpSWNSCO1aeollDl24PBE2yPBx7uR0XMtEd9i8Y5NDwlp7Vi47YjZ+OJgjvHLoxggq
         fl1oOIgdUiISaB0St1Meas64pjhzxKoLs7cWJaUmrE4zneX4xmlR6j8lR6C4Ploxx/Sk
         As2IAcFrtAl3j7KQ5/8iYYlTz/iIwC54K65kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733445779; x=1734050579;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ANN8Pw2RISl9iiMi3wsdHQnT40gHOJrWkb6RYxQgKE=;
        b=CyYk0xkKNOeWUV2A+trJWVI1ZB65Nz6mShqJPwZzCGG5f8w25Hd3FziFODB+SHS3RH
         LmNWi9/YuZk3RwBVoECVpEjFaCG6iV4HrBqO6TRx1b0LSH7MiGs5r01e3ZAEZZ/DJ8CL
         Mw9asXUlF+s5hkWGIMVlU9BI8jJYOe5dtduMHb+IMk4AJp6e8nEcnIInAeLGRuQurXvH
         TnMwKC3ilWroZR1d1R7ELlXZFRJEnx7FKGsaAJHQIJOp9GWLbLuAwaRSFUfIT09FdZcP
         aKTNyah6FYU/F4CMM2KRE2ao0Rqg7+g6hYSs0CuAKW88y35GiNfsflUlgEjvgG+hlj3I
         IS+A==
X-Forwarded-Encrypted: i=1; AJvYcCUw0hgsQna4b0EQlcC7g8DFW3BXwZkaIdFnxyjfQj6yq3s1CJAqiscDQ/xdcQeyt7T05GawbD9+Zo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJBnIBxGjaS9O8NzHI5wSH49TBO2roRRalSGjlc9asI0USZJ10
	9ubtb9savldtbu1xMQ0117QPE/OzpoM3NdYeWoCDqGCHh43DanLu+oAxOaZxOL4=
X-Gm-Gg: ASbGnctPoVc7JSVU9/yql6cBH/xdoROf1KLu8h/7cDZHHwP0FG5Jel7oc7NCV+CDcI1
	VgF3+svMpNS3n7bXarHvHxrNCvdsfihAAuoV+GSUKfMHrNeJTK/Bz9gVfHICYcAk2uEqptgp+MO
	rxBqgKh8rlkYkGd8q44chEaWCoBWxpjJMpBEiwYIxT2hqCnpmY9vyMx8qZidqqSIaAY9ca3tMJk
	PFZ6mJULMEWeCnXjzhzBzsC5DPlNB/fo9l7n96o4w8paBW4t9Faa4NKUIrpJykgtRp2UqlbIUN9
	UiINXkDFZGb9rA==
X-Google-Smtp-Source: AGHT+IG1RCXWmNI8XB0drt9LgJjsGVaAxFUw2k4AzkrVNKQ9lkQBsgRJEteWdOu4G0ojL7Z24BUVSA==
X-Received: by 2002:a05:600c:190a:b0:434:9936:c823 with SMTP id 5b1f17b1804b1-434ddeba3aamr9921335e9.18.1733445779004;
        Thu, 05 Dec 2024 16:42:59 -0800 (PST)
Message-ID: <ed248424-00a2-44ab-a7cf-3f2197d589a1@citrix.com>
Date: Fri, 6 Dec 2024 00:42:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tools/libacpi: clear out compilation warnings
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Jan Beulich <jbeulich@suse.com>, Ariel Otilibili <otilibil@eurecom.fr>
References: <20241206000422.331015-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241206000422.331015-2-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241206000422.331015-2-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2024 12:00 am, Ariel Otilibili wrote:
> From: Ariel Otilibili <otilibil@eurecom.fr>
>
> * While compiling ASLs, iasl puts out deprecation warnings
>
> ```
> tools/libs/light/mk_dsdt --debug=y --maxcpu any --dm-version none >> tools/libs/light/dsdt_pvh.asl
> /usr/bin/iasl -vs -p tools/libs/light/dsdt_pvh.tmp -tc tools/libs/light/dsdt_pvh.asl
>
> tools/libs/light/dsdt_pvh.asl     40:         Processor ( PR00, 0, 0x0000b010, 0x06 ) {
> Warning  3168 -                                                                   ^ Legacy Processor() keyword detected. Use Device() keyword instead.
>
> tools/libs/light/dsdt_pvh.asl     64:         Processor ( PR01, 1, 0x0000b010, 0x06 ) {
> Warning  3168 -                                                                   ^ Legacy Processor() keyword detected. Use Device() keyword instead.
> ```
>
> * since 6.0, the ACPI specs have deprecated the keyword Processor
> * the deprecation is mentioned in Rev. History, Issue 1232
> * instead, ACPI advices to use the keyword Device
> * after the fix, the warnings are cleared out.
>
> ```
> tools/libs/light/mk_dsdt --debug=y --maxcpu any --dm-version none >> tools/libs/light/dsdt_pvh.asl
> /usr/bin/iasl -vs -p tools/libs/light/dsdt_pvh.tmp -tc tools/libs/light/dsdt_pvh.asl
>
> ASL Input:     tools/libs/light/dsdt_pvh.asl -  167025 bytes   3763 keywords      0 source lines
> AML Output:    tools/libs/light/dsdt_pvh.aml -   27035 bytes   2599 opcodes    1164 named objects
> Hex Dump:      tools/libs/light/dsdt_pvh.hex -  253913 bytes
>
> Compilation successful. 0 Errors, 0 Warnings, 0 Remarks, 1915 Optimizations
> ```
>
> Link: https://uefi.org/specs/ACPI/6.5_A/Frontmatter/Revision_History.html#revision-history
> Link: https://uefi.org/specs/ACPI/6.5_A/08_Processor_Configuration_and_Control.html#declaring-processors
> Link: https://uefi.org/specs/ACPI/6.5_A/19_ASL_Reference.html#device-declare-device-package
> Signed-off-by: Ariel Otilibili <otilibil@eurecom.fr>
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
> ---
>  tools/libacpi/mk_dsdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/libacpi/mk_dsdt.c b/tools/libacpi/mk_dsdt.c
> index 34f6753f61..5729b4238c 100644
> --- a/tools/libacpi/mk_dsdt.c
> +++ b/tools/libacpi/mk_dsdt.c
> @@ -186,7 +186,7 @@ int main(int argc, char **argv)
>      /* Define processor objects and control methods. */
>      for ( cpu = 0; cpu < max_cpus; cpu++)
>      {
> -        push_block("Processor", "PR%02X, %d, 0x0000b010, 0x06", cpu, cpu);
> +        push_block("Device", "PR%02X", cpu);
>  
>          stmt("Name", "_HID, \"ACPI0007\"");
>  

Hello,

Thankyou for your patch.

Unfortunately, it's not quite this simple.  While there is a warning out
of IASL, older OSes coded to prior versions of the ACPI spec still
depend on "Processor".

It may be time to start thinking about removing support for the likes of
WinXP, but that needs more consideration than simply fixing a warning.

~Andrew

