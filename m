Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F41AA25E5D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 16:19:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880690.1290770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teyDu-0007MY-67; Mon, 03 Feb 2025 15:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880690.1290770; Mon, 03 Feb 2025 15:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teyDu-0007Jl-2e; Mon, 03 Feb 2025 15:18:54 +0000
Received: by outflank-mailman (input) for mailman id 880690;
 Mon, 03 Feb 2025 15:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1teyDs-0007Jf-KV
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 15:18:52 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c8e7425-e242-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 16:18:51 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso33620225e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 07:18:51 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81589sm192689165e9.33.2025.02.03.07.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 07:18:50 -0800 (PST)
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
X-Inumbo-ID: 2c8e7425-e242-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738595931; x=1739200731; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JVWa2VsHIsK1SvV2Z1Gq1yEijStDEYYnWhJUWkbON0=;
        b=N4By9nl1ia3CWeVr27b/WakARuZ7PrcIc8g3bo1RN6wOM9UgU8/R6BbnSsKzlOPUux
         tLjT30AIeXKUAbsEg1mMYjoD4yQC+KsKpcpTJaPDKHErEbf3Xf8W8Gn0mlyGnW4GiFE4
         7s/6CLe/8E554NVBKRc7kjduLCjEY88bjQ6yOqd6Z3cRlTI875E9DNbvRAfLPdbO9Z1r
         Zi7w9OCk2rJHTpgt7JHuAi9uLHAVfQskOOFCUr4ZHqCgbnIpyIIlRdcxIO5I2jRbbjZ1
         tZWAkl0OSKAmx56hsk/lAN6aZkUuG9P23JEwW8C1HE3JvxUvAlrfVuq61i/H14JrL39y
         befA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595931; x=1739200731;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6JVWa2VsHIsK1SvV2Z1Gq1yEijStDEYYnWhJUWkbON0=;
        b=F2VRln2YUpWbfJ7b1YTYXqkcfw/dQep6TmiY7BZsiC8RcmDOOg4edRHonyEMO+QvV1
         0CLJgOyWb689UKyyN2ZigLvOFTWpOK/pr6TgRiYZWWhXfvrpGi+xATWmDcaUIpG/BxEL
         xjmktuOkrFy9uzMaWUkI5oYDl0U0+zveYZYld5CInZ8GN7CCsIC1G7OhYiNtAzeJcbOa
         PQ905ddBj8sjlR3Ay5YYuBb2aoWnbdgW3+qCRIFu7f0UUQtMvcUjUH12EwLJWpmxRMde
         xSJlGCaTVzGH2SFbvJfNY55kHwW3DMTV1NfWP6xvfpTfQabIfxxN4EoWRhmKu3NOdIB7
         +7Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVgQLbKJ1QDsYZR6KAHgaCXAQMb+lA9g9Xvr2e4GEsD2BMnAU/iIQMzXHOx/vfKSAKqhjT66Rg+/vs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn0oWY0VD/m2GOCpl281s+6vUa5DCiZcMClazYYCQ26jvTCECp
	evKXxmJrA2Drl6G/d8xsQ21sxM20DHYBkAnCzQUiGf5WwkbrWUFr
X-Gm-Gg: ASbGncvvpuNsAWjELZIKXKF8NFg2cLGJVHBEkeDWwNPlZW4iR9Tj3oHqdwAGwLjKaPF
	8rDYmoREntsqh/8llWnCpTXpZKmiB/3Z8BFuyOLCF+pVfcX6PurHebuR7Xf3KnVDhDzXe2oLKA8
	xiLyiNCywfKCy0KcffCiK+Nz+477H+7cDzWCNZpd0bj3i/M/4HVD88DjX3RjH38OJ+r7N3aoETf
	JFffH0gpWudDHxf0jCtCG51HrW9dh+cqco3O6yZGRt6feIGObFUm+SZdUQ+q9rWElPu0OkJa66w
	k9zVcb9bjZwms0wXx0PoLFY58fLPMX/MKBoUaaima+htcMi6SXblCsOgEFYPndm1An2J5mvpXr9
	0MT8=
X-Google-Smtp-Source: AGHT+IHMGNnp0lN6TTZa9aawMXE8t+PLe2m7E79SUPTXMKVdR1rdyFGd+vnAclpW88Ia+aaeekpa7A==
X-Received: by 2002:a05:600c:154a:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-438dc42bd08mr210668635e9.30.1738595930716;
        Mon, 03 Feb 2025 07:18:50 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------j0LU4RA6Ag5ZYwX69bHipYEi"
Message-ID: <0c2aabce-75b2-48ea-87de-2e961cdf0f4f@gmail.com>
Date: Mon, 3 Feb 2025 16:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/9] xen/common: dom0less: make some parts of Arm's
 CONFIG_DOM0LESS common
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
 <396a60496844c8a86667f4ee57c5bedc9899f5ad.1736334615.git.oleksii.kurochko@gmail.com>
 <f8d4a1d4-a332-4dad-ba6e-5a127ae2187e@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f8d4a1d4-a332-4dad-ba6e-5a127ae2187e@suse.com>

This is a multi-part message in MIME format.
--------------j0LU4RA6Ag5ZYwX69bHipYEi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 12:12 PM, Jan Beulich wrote:
> On 08.01.2025 12:13, Oleksii Kurochko wrote:
>> Unify the API for creating DomUs and checking for Dom0less mode across
>> architectures, including Arm and RISC-V, with potential applicability
>> for PPC.
> That is you mean to re-use it for RISC-V?

Yes, I will re-use it.

>
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -12,6 +12,15 @@ config CORE_PARKING
>>   	bool
>>   	depends on NR_CPUS > 1
>>   
>> +config DOM0LESS_BOOT
>> +	bool "Dom0less boot support" if EXPERT
>> +	depends on ARM
>> +	default ARM
> This then would better be converted to "depends on HAVE_DOM0LESS", which
> for now only Arm would select. With a dependency on XYZ the default also
> doesn't need to name XYZ again, i.e. can simply be "default y".

"depends on HAVE_DOM0LESS" would be better. I will update correspondingly.

Thanks.

~ Oleksii


--------------j0LU4RA6Ag5ZYwX69bHipYEi
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
    <div class="moz-cite-prefix">On 1/27/25 12:12 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f8d4a1d4-a332-4dad-ba6e-5a127ae2187e@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.01.2025 12:13, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Unify the API for creating DomUs and checking for Dom0less mode across
architectures, including Arm and RISC-V, with potential applicability
for PPC.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That is you mean to re-use it for RISC-V?</pre>
    </blockquote>
    <pre>Yes, I will re-use it.

</pre>
    <blockquote type="cite"
      cite="mid:f8d4a1d4-a332-4dad-ba6e-5a127ae2187e@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -12,6 +12,15 @@ config CORE_PARKING
 	bool
 	depends on NR_CPUS &gt; 1
 
+config DOM0LESS_BOOT
+	bool "Dom0less boot support" if EXPERT
+	depends on ARM
+	default ARM
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This then would better be converted to "depends on HAVE_DOM0LESS", which
for now only Arm would select. With a dependency on XYZ the default also
doesn't need to name XYZ again, i.e. can simply be "default y".</pre>
    </blockquote>
    <pre>"depends on HAVE_DOM0LESS" would be better. I will update correspondingly.

Thanks.

~ Oleksii
</pre>
    <p><br>
    </p>
  </body>
</html>

--------------j0LU4RA6Ag5ZYwX69bHipYEi--

