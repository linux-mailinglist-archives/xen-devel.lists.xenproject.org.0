Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42785A7329B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 13:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929237.1331863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmhn-0002aG-Qh; Thu, 27 Mar 2025 12:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929237.1331863; Thu, 27 Mar 2025 12:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmhn-0002Y6-Mq; Thu, 27 Mar 2025 12:51:31 +0000
Received: by outflank-mailman (input) for mailman id 929237;
 Thu, 27 Mar 2025 12:51:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txmhl-0002Y0-VH
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 12:51:29 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3360cbc2-0b0a-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 13:51:28 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso191430466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 05:51:28 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef8d396csm1224162966b.43.2025.03.27.05.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 05:51:27 -0700 (PDT)
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
X-Inumbo-ID: 3360cbc2-0b0a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743079888; x=1743684688; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eogGriwvg0ICNNhjAk59r8XGe3QA/uby5ESqiJ679EQ=;
        b=QG5Y7xh6Q9KesHcpfeca/zJiAKLK7MO9FV4IBK8/zyxAj3YI3un0YJjlryhMk6L7Yz
         iOAKrPa02nO+vmV9D5WaeORLYkn4vXmcDrMgOnMtoSX2/YgfauPZQlyIQzvmSsHT35ax
         VYE7EiR1sHuBnVVzSibmtb/fXY5wT9N9lvG6lq/854vcIAN1GsEj5lf6jLThQCbe6czt
         uDWNdmio6hdyygdFHbmoVcWZC0PJckzJPhb6X9tat4kIId+z0scYCW7ZzTnolNYhc9R5
         +5h/Bu/KVqMs1Twoa7tDkRL5D9J8woh1tITKIvFcRa/nomZE/yOhqKlUabKIu+47mVq5
         sNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079888; x=1743684688;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eogGriwvg0ICNNhjAk59r8XGe3QA/uby5ESqiJ679EQ=;
        b=ZdTvtmLRCv+BG3dkLKEa0nrb0WGHYJ5/8e0op89YJ4z2kCl+qHLBKOpl0O8xy/L3+s
         WHXXmFccvP+LL8Myb1wgAXemfx/vgBDAHdTM4BTKBeRQqbWejAIIigBqq5IFHZWIz884
         bb2Co1KE6O5KC3FE+vzI5qFeBtvIqGrh70stWBt3gmE9bYT3Hu8693uituh3e/HMiU7O
         NdUse3CZnBZKcrfuKFRaDTOdNFEsIW+SsaaQCUmQ7DW9JavSAoRNvuvnWpNIlNREOWP8
         aCRXBBngOT83lODwarDXv2uRqqevRXfuHyYt5O5q03uRAk7LtWEPPtFcl0Yc+kuePK8X
         s7tw==
X-Forwarded-Encrypted: i=1; AJvYcCXo0wCFcdwY0QY+7T+B2LrMiOshR/295xJ7O11Uk+l+RLX9Razo/+w8k+q/8O7n1WEnaleidZ+m2Ec=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAv9l8qEju0FRrfDFZmxPkzOVS4bAvjqFXqMZt/OqgQ9aftqT7
	25fZ8SGcy60+dQRuc6Y0E7B8FGgktBCVssOQFaghFv0Y4+02P9cP
X-Gm-Gg: ASbGncvbsXB1jhfij6wEoULVqAIXleKVVBGgPB+c9F2uirA8fQWfELbEeZq30KNeUoc
	se63kvYJn36HYIug83LS7nEbxkSJ8alzs0kowH0raYwDk8aTjROvxQ5TtNZdN6L/bQAr+UUrLwj
	4LN6sXnGcYUSGOrlyPmA7lnm3aJptJxPalceNlbssh9S+3HlhyvD7163nXroNbvgmvNsEvqC6h9
	2g+n64ydf1XG9geYeot/gDWWv+N2MKNVvv6aFWzby4ePhKkItXVBOzncyZkqtWsOZ/9ib4ntt4H
	ezuqtHwJM47S1bJVJq7J4KtY5OWUFZlxUOjzJgsmUHQEuy2BkJv/UPANCZSfxzhPeFyHASyAtvW
	/T8gzApr6Gs64a3SbdPxt
X-Google-Smtp-Source: AGHT+IEOejEiAd1FE+YNRC6Mba7U6atehsxFrt4jGjsHBFkCu2fg3YUoOm8e2BiNcxpbVqTPQKrzLA==
X-Received: by 2002:a17:907:86ac:b0:ac3:25d7:6950 with SMTP id a640c23a62f3a-ac6faec918amr298040266b.20.1743079888040;
        Thu, 27 Mar 2025 05:51:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------YKVcPGAVMCcDgzVG1EEpd20O"
Message-ID: <34c4ba5e-3d06-45af-9c73-e4f160f6d74e@gmail.com>
Date: Thu, 27 Mar 2025 13:51:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
 <8046d3c4-c00e-4322-b665-81614af89f13@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8046d3c4-c00e-4322-b665-81614af89f13@suse.com>

This is a multi-part message in MIME format.
--------------YKVcPGAVMCcDgzVG1EEpd20O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/27/25 9:18 AM, Jan Beulich wrote:
> On 26.03.2025 18:47, Oleksii Kurochko wrote:
>> --- a/xen/include/xen/config.h
>> +++ b/xen/include/xen/config.h
>> @@ -98,4 +98,13 @@
>>   #define ZERO_BLOCK_PTR ((void *)-1L)
>>   #endif
>>   
>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
>> +
>> +#define BITS_PER_BYTE   __CHAR_BIT__
>> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
>> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
>> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
>> +
>> +#define POINTER_ALIGN   __SIZEOF_POINTER__
> Just one remark here: Imo this needs to come with a comment, as alignment and
> size aren't necessarily tied together. It's merely that we assume that
> sizeof(void *) == __alignof(void *).

I will added the following comment then:
/* it is assumed that sizeof(void *) == __alignof(void *) */

~ Oleksii

--------------YKVcPGAVMCcDgzVG1EEpd20O
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
    <div class="moz-cite-prefix">On 3/27/25 9:18 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8046d3c4-c00e-4322-b665-81614af89f13@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.03.2025 18:47, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -98,4 +98,13 @@
 #define ZERO_BLOCK_PTR ((void *)-1L)
 #endif
 
+#define BYTES_PER_LONG  __SIZEOF_LONG__
+
+#define BITS_PER_BYTE   __CHAR_BIT__
+#define BITS_PER_INT    (__SIZEOF_INT__ &lt;&lt; 3)
+#define BITS_PER_LONG   (BYTES_PER_LONG &lt;&lt; 3)
+#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ &lt;&lt; 3)
+
+#define POINTER_ALIGN   __SIZEOF_POINTER__
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Just one remark here: Imo this needs to come with a comment, as alignment and
size aren't necessarily tied together. It's merely that we assume that
sizeof(void *) == __alignof(void *).</pre>
    </blockquote>
    <pre>I will added the following comment then:
/* it is assumed that sizeof(void *) == __alignof(void *) */

~ Oleksii</pre>
  </body>
</html>

--------------YKVcPGAVMCcDgzVG1EEpd20O--

