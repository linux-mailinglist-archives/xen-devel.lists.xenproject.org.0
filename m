Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0212D82D595
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 10:12:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667235.1038292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJ0v-0006e5-0y; Mon, 15 Jan 2024 09:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667235.1038292; Mon, 15 Jan 2024 09:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPJ0u-0006bg-UW; Mon, 15 Jan 2024 09:12:12 +0000
Received: by outflank-mailman (input) for mailman id 667235;
 Mon, 15 Jan 2024 09:12:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPJ0t-0006bY-FC
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 09:12:11 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 299b1df8-b386-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 10:12:10 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e80046264so727315e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 01:12:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k9-20020a05600c1c8900b0040d772030c2sm15067359wms.44.2024.01.15.01.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 01:12:09 -0800 (PST)
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
X-Inumbo-ID: 299b1df8-b386-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705309929; x=1705914729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CUIdAHMbyBcA5TI/c11EvN3FbqEVX14Ws80LcvSbcds=;
        b=P8lIrR+PP5e7O/0kQ3IaDI6XsxLik3EGgpGR32dP2ngZiQ1r0JfZR5h3Yko+tyY32k
         iBDhipqbhwZnPqOy4BR8gR551T/OhZK7hjBhlRcjchksSGIZlB84Rq/M9dTFHsBBNOZD
         UEsMvwaI7YW3dJNppMWMNOZn/wls1+NIFpCigFwzy3+uJanU5IL7l3tDZZiLJWCcZbPo
         2Aslz9KThs94tmbxNbwVVJzvfeuXCneKnKNaHkwCSg3FSPvPabNxyxExYxN89K2uk7YN
         +x4vJtH4NM8M6qlRI+zdjT16or4znRPMaHw87qpfuMjniLM1/DPmK+fiHxLmssrY6hbK
         xzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705309929; x=1705914729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CUIdAHMbyBcA5TI/c11EvN3FbqEVX14Ws80LcvSbcds=;
        b=mCl27UMAToNHj7928YlVXMnILKOZjxkLHS4sWYJan/C1i6N260y2revPYnkJ+Y6PcG
         0fem9Oz0O08j7AZiPwHnPRnhonAUbMjWDXbU+pj/J/YEr2lMi2SwbH+JQCix0vf8LB1Z
         1NX1Q0GRbCglIGR/KyTUWN+43hxlOh/HeMBe5s5PdCgYJZ0Zln20seUlYklDCCV7IUgp
         sMJLuucaqaejiYLxvzHAz6C6lp0Fj9z66JP2upgSfjyx2K3LcMv3RbuTVsSarOi6or42
         kMcwMgHYnA3EAeQ7s7UXRywdQ4B1UF5KksDBNzBI/BxPsokhyCpJLfr+88SAL/lsI0AS
         SlZw==
X-Gm-Message-State: AOJu0YwfkwU3Do3h088gwXyfs2f/WARxvpUE3kR4bCj22l54A0wPwCOq
	QaKtFbWJxYGcnl7/wSRWInelnH4YxxT2E+tJcILpJFcpKw==
X-Google-Smtp-Source: AGHT+IFB9CehI+j208HVGlwOGQTTQxOaWyKHEwJXFaa/jF5WTe8IQ+NGn5OJmeEsFiwZ5pttjEM0bA==
X-Received: by 2002:a05:600c:4686:b0:40e:3511:2c39 with SMTP id p6-20020a05600c468600b0040e35112c39mr3219720wmo.172.1705309929552;
        Mon, 15 Jan 2024 01:12:09 -0800 (PST)
Message-ID: <b6b92c4e-6331-4f32-8c98-312847537e26@suse.com>
Date: Mon, 15 Jan 2024 10:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-linus test] 184346: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-184346-mainreport@xen.org>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <osstest-184346-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2024 09:39, osstest service owner wrote:
> flight 184346 linux-linus real [real]
> flight 184349 linux-linus real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/184346/
> http://logs.test-lab.xenproject.org/osstest/logs/184349/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-xl-credit1  12 debian-install           fail REGR. vs. 184270
>  test-arm64-arm64-xl-xsm      12 debian-install           fail REGR. vs. 184270
>  test-arm64-arm64-xl          12 debian-install           fail REGR. vs. 184270

Taking this as example:

gzip: stdout: No space left on device

No idea whether we've been running very close to the edge, or whether
something caused a drastic increase of disk space requirements.

Jan

>  test-arm64-arm64-xl-thunderx 12 debian-install           fail REGR. vs. 184270
>  test-arm64-arm64-xl-credit2  12 debian-install           fail REGR. vs. 184270
>  test-arm64-arm64-libvirt-xsm 12 debian-install           fail REGR. vs. 184270
> 
> Tests which did not succeed, but are not blocking:
>  test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 184270
>  test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 184270
>  test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 184270
>  test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 184270
>  test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 184270
>  test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 184270
>  test-armhf-armhf-libvirt-qcow2 15 saverestore-support-check   fail like 184270
>  test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 184270
>  test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
>  test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
>  test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
>  test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
>  test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
>  test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
>  test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
>  test-amd64-amd64-libvirt-raw 14 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
>  test-arm64-arm64-libvirt-raw 14 migrate-support-check        fail   never pass
>  test-arm64-arm64-libvirt-raw 15 saverestore-support-check    fail   never pass
>  test-arm64-arm64-xl-vhd      14 migrate-support-check        fail   never pass
>  test-arm64-arm64-xl-vhd      15 saverestore-support-check    fail   never pass
>  test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
>  test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
>  test-amd64-amd64-libvirt-qcow2 14 migrate-support-check        fail never pass
>  test-armhf-armhf-libvirt-qcow2 14 migrate-support-check        fail never pass
> 
> version targeted for testing:
>  linux                052d534373b7ed33712a63d5e17b2b6cdbce84fd
> baseline version:
>  linux                0dd3ee31125508cd67f7e7172247f05b7fd1753a
> 
> Last test of basis   184270  2024-01-07 20:42:19 Z    7 days
> Failing since        184283  2024-01-08 20:10:43 Z    6 days   11 attempts
> Testing same since   184338  2024-01-13 05:40:28 Z    2 days    4 attempts
> 
> ------------------------------------------------------------
> 1701 people touched revisions under test,
> not listing them all
> 
> jobs:
>  build-amd64-xsm                                              pass    
>  build-arm64-xsm                                              pass    
>  build-i386-xsm                                               pass    
>  build-amd64                                                  pass    
>  build-arm64                                                  pass    
>  build-armhf                                                  pass    
>  build-i386                                                   pass    
>  build-amd64-libvirt                                          pass    
>  build-arm64-libvirt                                          pass    
>  build-armhf-libvirt                                          pass    
>  build-i386-libvirt                                           pass    
>  build-amd64-pvops                                            pass    
>  build-arm64-pvops                                            pass    
>  build-armhf-pvops                                            pass    
>  build-i386-pvops                                             pass    
>  test-amd64-amd64-xl                                          pass    
>  test-amd64-coresched-amd64-xl                                pass    
>  test-arm64-arm64-xl                                          fail    
>  test-armhf-armhf-xl                                          pass    
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
>  test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
>  test-amd64-amd64-libvirt-xsm                                 pass    
>  test-arm64-arm64-libvirt-xsm                                 fail    
>  test-amd64-amd64-xl-xsm                                      pass    
>  test-arm64-arm64-xl-xsm                                      fail    
>  test-amd64-amd64-qemuu-nested-amd                            fail    
>  test-amd64-amd64-xl-pvhv2-amd                                pass    
>  test-amd64-amd64-dom0pvh-xl-amd                              pass    
>  test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
>  test-amd64-amd64-freebsd11-amd64                             pass    
>  test-amd64-amd64-freebsd12-amd64                             pass    
>  test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
>  test-amd64-amd64-xl-qemut-win7-amd64                         fail    
>  test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
>  test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
>  test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
>  test-armhf-armhf-xl-arndale                                  pass    
>  test-amd64-amd64-examine-bios                                pass    
>  test-amd64-amd64-xl-credit1                                  pass    
>  test-arm64-arm64-xl-credit1                                  fail    
>  test-armhf-armhf-xl-credit1                                  pass    
>  test-amd64-amd64-xl-credit2                                  pass    
>  test-arm64-arm64-xl-credit2                                  fail    
>  test-armhf-armhf-xl-credit2                                  pass    
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
>  test-amd64-amd64-examine                                     pass    
>  test-arm64-arm64-examine                                     pass    
>  test-armhf-armhf-examine                                     pass    
>  test-amd64-amd64-qemuu-nested-intel                          pass    
>  test-amd64-amd64-xl-pvhv2-intel                              pass    
>  test-amd64-amd64-dom0pvh-xl-intel                            pass    
>  test-amd64-amd64-libvirt                                     pass    
>  test-armhf-armhf-libvirt                                     pass    
>  test-amd64-amd64-xl-multivcpu                                pass    
>  test-armhf-armhf-xl-multivcpu                                pass    
>  test-amd64-amd64-pair                                        pass    
>  test-amd64-amd64-libvirt-pair                                pass    
>  test-amd64-amd64-xl-pvshim                                   pass    
>  test-amd64-amd64-pygrub                                      pass    
>  test-amd64-amd64-libvirt-qcow2                               pass    
>  test-armhf-armhf-libvirt-qcow2                               pass    
>  test-amd64-amd64-libvirt-raw                                 pass    
>  test-arm64-arm64-libvirt-raw                                 pass    
>  test-armhf-armhf-libvirt-raw                                 pass    
>  test-amd64-amd64-xl-rtds                                     pass    
>  test-armhf-armhf-xl-rtds                                     pass    
>  test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
>  test-amd64-amd64-xl-shadow                                   pass    
>  test-arm64-arm64-xl-thunderx                                 fail    
>  test-amd64-amd64-examine-uefi                                pass    
>  test-amd64-amd64-xl-vhd                                      pass    
>  test-arm64-arm64-xl-vhd                                      pass    
>  test-armhf-armhf-xl-vhd                                      pass    
> 
> 
> ------------------------------------------------------------
> sg-report-flight on osstest.test-lab.xenproject.org
> logs: /home/logs/logs
> images: /home/logs/images
> 
> Logs, config files, etc. are available at
>     http://logs.test-lab.xenproject.org/osstest/logs
> 
> Explanation of these reports, and of osstest in general, is at
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
>     http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master
> 
> Test harness code can be found at
>     http://xenbits.xen.org/gitweb?p=osstest.git;a=summary
> 
> 
> Not pushing.
> 
> (No revision log; it would be 204832 lines long.)
> 


