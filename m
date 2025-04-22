Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B48D0A96EC5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 16:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962672.1353831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Eee-0000kb-Uk; Tue, 22 Apr 2025 14:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962672.1353831; Tue, 22 Apr 2025 14:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Eee-0000iV-Ry; Tue, 22 Apr 2025 14:31:20 +0000
Received: by outflank-mailman (input) for mailman id 962672;
 Tue, 22 Apr 2025 14:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NnGu=XI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u7Eee-0000iP-3Q
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 14:31:20 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73af3365-1f86-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 16:31:17 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso3213093f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 07:31:17 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43315esm15227413f8f.26.2025.04.22.07.31.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 07:31:16 -0700 (PDT)
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
X-Inumbo-ID: 73af3365-1f86-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745332277; x=1745937077; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzhz5Z4svm9Ipol0ctPoC9x+X53KTEygxDK4TbkpdtY=;
        b=Fh+9D8l3jVMApC7RTsNkGk6Yhnrfa9VOzEE+BLkvTFtNEQLvju4Nutn0Rfb4u+8XKU
         201gk3O0yyv23wbzLTI+Wt84CYHhfoQTRYtTeLwWOPPZU9lBmCqjcZfEi8Fd38m5vChQ
         rXYbvG1WI/WcS4R9L3UBDlUCHas90YfzKF5v5vV3u94Ww9pdyPMKbvNxY7j8/J6x2fmc
         A8dAZY5deiHqXHp7YeYBF2Js+QE9zccs3q+nO+emSyW/5z04/+muDQT2NcUmmWEMEkrR
         nCQFU54vIzc5Y3gzvuEx+RN8z/D6Tzy866kaRZnyoPzt6hEam+sHrB/Aj6kBBp+NJKxa
         iF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745332277; x=1745937077;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pzhz5Z4svm9Ipol0ctPoC9x+X53KTEygxDK4TbkpdtY=;
        b=F0sbpzvFphLRoYwwciS+lpCMPhwiDIsZHtma5I2VUm8GUE5P7rWnfWuLA+KKxCIkOt
         pCP0lGqw5ovsKp0b5qzxnmZ/9g0JR296JExzroyogvbdb5UPNGRFEzBnszVe+Zy8cGfi
         aiVQK2+AtXc4EfAIBMeqy3TDzIB79iYZxdFywB+5ehUYSORGVlK24bNhHQh9jg6ByvYW
         VDv+JEPbn3oSPXpvQ2cBc/4y2mB1w+rfRMX7c2H5vZToEf1Mixr5zLabo6saLV0Vz+8D
         5Q1ZfSExPmQufunJTvym8tXgnsB82TBVfJn5fgJVTN2lwjQOZTH0qKGdmakA5vueM7mv
         VkEg==
X-Forwarded-Encrypted: i=1; AJvYcCXZRO0tQLYXgj0qJZEp+4q9CQi4A4m2uH+q7wHK3Y/mXA+yeOepJm/4c/ju4FE/EnOH+7Jm0Cu7vFk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJdP2SBEOWH/u3at5ax56+bxw7aloBbO/sH6uQXYwoTRQtS1LC
	R3zvdPvsg95XU2Wlo5SiD4QRMk0k0kJ6uyRvXlqMTGGtB9kOrFlS
X-Gm-Gg: ASbGncv/PXHzYd+dqnpRIxxCRlUDeKNdr7bwDkuSBaMUFJPv3DUYCp2m2uCnSg/sjWB
	i6SdtB/1PcoBNQvo8j8TcigrssjCyxY+E8/c92Y7gFoX/Mqedtc7syWgQzNyV79vSRblhok9UXD
	ansoeieAPIKWow9dslvPd2x62Fv8oaVZJNMizNevVEXAeAAL8Cszzz+Kb6QGLDdP1B6lJ9XzGoP
	OMBuzLLgrjTUVHxQ4O6+0GF/wE+yf5p8VcMWNnOv5jusTVSP7Jr7tcYoh0jgfjlY6k2LDPIZtWu
	Yjtx5YITMfdE02K0xKC2mzgNa5uvv1KJi2mSX93QqjbqoKm84f+it8i+r0UR20OmzXmUXsjs1LR
	XP1Y7UMhYv1ChDyDW
X-Google-Smtp-Source: AGHT+IEvNHEcZQdlImYphmVebZ6XhYAyC4/lahzIDqH+Y2XPhIdceAv3tlXN+plebE3USH7GZ0SR3w==
X-Received: by 2002:a05:6000:400d:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-39efbacdcbdmr12255022f8f.36.1745332276617;
        Tue, 22 Apr 2025 07:31:16 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------VFPEvqbyl7lOVLOcFbd0TO8o"
Message-ID: <7856ff9f-3cd8-4591-930e-9c9d43cedcd7@gmail.com>
Date: Tue, 22 Apr 2025 16:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] xen/arm: drop declaration of
 handle_device_interrupts()
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
 <ec1bfe540b4588c749fcdc932bd93da96db1d8a2.1744626032.git.oleksii.kurochko@gmail.com>
 <b6bb9905-befd-4ebd-a50d-a5a1c82f53bc@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b6bb9905-befd-4ebd-a50d-a5a1c82f53bc@amd.com>

This is a multi-part message in MIME format.
--------------VFPEvqbyl7lOVLOcFbd0TO8o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/17/25 9:38 AM, Orzel, Michal wrote:
>
> On 14/04/2025 17:56, Oleksii Kurochko wrote:
>> There is no any users of handle_device_interrupts() thereby it
>> could be dropped.
> It reads as if you were dropping a definition. There is no definition, therefore
> no users. Prototype was added by accident in:
> 8d2c3ab18cc1fce46945bd3aa1819a7aea0c564e

I will reword it to:
  There is no definition of handle_device_interrupts() thereby it could be dropped.

Should I add Fixes tag to mention that it was added by accident in
8d2c3ab18cc1fce46945bd3aa1819a7aea0c564e? Or it will be enough just to mention that
in the commit message?

>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> With the commit msg updated to be more meaningful:
> Reviewed-by: Michal Orzel<michal.orzel@amd.com>

Thanks.

~ Oleksii

--------------VFPEvqbyl7lOVLOcFbd0TO8o
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
    <div class="moz-cite-prefix">On 4/17/25 9:38 AM, Orzel, Michal
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b6bb9905-befd-4ebd-a50d-a5a1c82f53bc@amd.com">
      <pre wrap="" class="moz-quote-pre">

On 14/04/2025 17:56, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">There is no any users of handle_device_interrupts() thereby it
could be dropped.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">It reads as if you were dropping a definition. There is no definition, therefore
no users. Prototype was added by accident in:
8d2c3ab18cc1fce46945bd3aa1819a7aea0c564e</pre>
    </blockquote>
    <pre>I will reword it to:
 There is no definition of handle_device_interrupts() thereby it could be dropped.

Should I add Fixes tag to mention that it was added by accident in 
8d2c3ab18cc1fce46945bd3aa1819a7aea0c564e? Or it will be enough just to mention that
in the commit message?

</pre>
    <blockquote type="cite"
      cite="mid:b6bb9905-befd-4ebd-a50d-a5a1c82f53bc@amd.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With the commit msg updated to be more meaningful:
Reviewed-by: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------VFPEvqbyl7lOVLOcFbd0TO8o--

