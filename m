Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C6FABDDDB
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990870.1374798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOLN-0004cV-Tx; Tue, 20 May 2025 14:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990870.1374798; Tue, 20 May 2025 14:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOLN-0004ZZ-Qt; Tue, 20 May 2025 14:53:25 +0000
Received: by outflank-mailman (input) for mailman id 990870;
 Tue, 20 May 2025 14:53:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J32h=YE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHOLM-0004ZT-7B
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:53:24 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d7a6875-358a-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 16:53:23 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ad5273c1fd7so930931966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:53:23 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e63a0sm7241276a12.39.2025.05.20.07.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:53:22 -0700 (PDT)
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
X-Inumbo-ID: 2d7a6875-358a-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747752803; x=1748357603; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVy/BBRS4i0Veyi5PZGRDxrv2odRHZ3ji+yjuMVCGNs=;
        b=iW+x4f28hg6He5bauqT7AjMErW4ffaZA73VHhKrE32lvh8y8Vfx91KN+2/nh+h0gN/
         ymNEMZK6NtFQ4fVkR/YOTUo3ji4Yp6BJ51DdqnTmn97HBsWQbwXzo0CPLqA8197uABeN
         YJ9WSnJ/rQsPux8iIa982HYhYGrQZ8FvUW6WS7zlKhyXWmPCqjPWhFfUFnRCAvaCibb1
         hk4WXO47OG7w454xmacxfvxXURylg/kUOut7BcRqxMNU+JJL56NEmeL451pvtMYZ6+g0
         L2u/q5xzdp8u4IXfgwfOQSi5sU0GkHcBDR2FEE7aPGFGvG1pW9DI88z0zJisbAFEtYLU
         HWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752803; x=1748357603;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SVy/BBRS4i0Veyi5PZGRDxrv2odRHZ3ji+yjuMVCGNs=;
        b=apl/fn0o2mskXwBPtuEh+N4PJqe7NL/YTnG+FFhZHK/5YfE5zyFzk7FDIR5XmaeSaX
         SXfGt/X6/s9uy6CBB3irla1MtzBmQN0jLP66nN2pIqwBn1qaV5xOjGk9tDIpur3ndsjR
         z6TAB10P3fUqaGxxmYA2k9K7B4YLtxtQsnDTNciG1jMHwNBMf1JjtDFz5IFtM6BMy6W9
         mI0KmRwPemYwufnOP7+kr4WXLv/aFivmGHWt1MFtTstpyoTRz7c9YMJg8uCeAUJVBWmY
         4HrkGdMS8gSa89DgJ6wMoeJ4t2B4Y9ZzCDCyvu7B2gwNsCr+kNjxIeuqC8aAttekHgBq
         f6ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVsNpsfMHYJHBBZ+PkwHGLtiNVLzHkFZANOjS6W6isRx0e22W4jlE5vM5Zyne1QHnmqazMAjF2H5kU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2jiLlkcDWC7oLbyt1Q2i8iF3jTOFu6KSs3VvU43Dyn/Z4kb2h
	lLBweR9k+aKSQgwzKOqrX1q3Mmbgk+hvwwF/29Ytjkng0801rgKF4o1t
X-Gm-Gg: ASbGnctFRtQq+Pcv0JEyRmtKXKDJNEjDAXhd+cg/lqDwofiK6VGEeunfInX2hpWLiTX
	oVg1+MFnANBaQtbYb7F1pXbePJL8t5K9wSI1cQk6iRwB3tOs8HbIaoP2VJNbn2ItFIhDlM76Bfe
	IGs0j44D+GkSbUTm8OqOY0532Vej+x17Qbvwf3eoirwNh29Rdb+OYa5N2YWlzKlsi3MKWcAo/8w
	AUm0USak66zh1iKyVoef3L77bhQQ8ToW0TvieD2DUEC90YZTD/6K6yTizbt8ikqmm/GSgB7t20o
	awbvH+L0TpXiv5XspdksuXnMC26C4vwR8MRE1HqHoNsInK2/BB/KL439gM2kBn6G5Sv6+BS82sg
	KegIe2d0paii6z2u2S8+dJibf
X-Google-Smtp-Source: AGHT+IH6IfMb6glmYwxgF4hVuemWn7cLDx0SIjtxXKpYDFQsIaece/lmQs2Xgn9gNj8EisP3kWzLTA==
X-Received: by 2002:a17:907:94ce:b0:ad4:f517:ca3 with SMTP id a640c23a62f3a-ad536bde67bmr1563755366b.20.1747752802608;
        Tue, 20 May 2025 07:53:22 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0tJQ91MJTwezolrEhedV7Ugi"
Message-ID: <9e27c4fd-f62a-417f-ac20-0a6301e30498@gmail.com>
Date: Tue, 20 May 2025 16:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] xen/riscv: imsic_init() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <f7588e93d0ddacc29ce5d89b2855624f82d6baa9.1746530883.git.oleksii.kurochko@gmail.com>
 <0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com>
 <4b948489-6fb9-4554-9a4c-4fa75de7345d@gmail.com>
 <2966ad6f-179f-47fe-acf1-7fb568cb4fb8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2966ad6f-179f-47fe-acf1-7fb568cb4fb8@suse.com>

This is a multi-part message in MIME format.
--------------0tJQ91MJTwezolrEhedV7Ugi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/19/25 8:33 PM, Jan Beulich wrote:
> On 19.05.2025 17:26, Oleksii Kurochko wrote:
>> On 5/15/25 10:42 AM, Jan Beulich wrote:
>>>> +                   node->name, imsic_cfg.msi[cpuid].base_addr + reloff);
>>>> +            imsic_cfg.msi[cpuid].offset = 0;
>>>> +            imsic_cfg.msi[cpuid].base_addr = 0;
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        bitmap_set(imsic_cfg.mmios[index].cpus, cpuid, 1);
>>> Depending on clarification on the number space used, this may want to be
>>> cpumask_set_cpu() instead. Else I think this is simply __set_bit().
>> cpumask_set_cpu() requires cpumask_t which uses static definition but we are
>> using dynamic allocation.
> But you're aware of cpumask_var_t (and respective allocation functions)?

Now yes, thanks.

~ Oleksii

--------------0tJQ91MJTwezolrEhedV7Ugi
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
    <div class="moz-cite-prefix">On 5/19/25 8:33 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2966ad6f-179f-47fe-acf1-7fb568cb4fb8@suse.com">
      <pre wrap="" class="moz-quote-pre">On 19.05.2025 17:26, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 5/15/25 10:42 AM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+                   node-&gt;name, imsic_cfg.msi[cpuid].base_addr + reloff);
+            imsic_cfg.msi[cpuid].offset = 0;
+            imsic_cfg.msi[cpuid].base_addr = 0;
+            continue;
+        }
+
+        bitmap_set(imsic_cfg.mmios[index].cpus, cpuid, 1);
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Depending on clarification on the number space used, this may want to be
cpumask_set_cpu() instead. Else I think this is simply __set_bit().
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
cpumask_set_cpu() requires cpumask_t which uses static definition but we are
using dynamic allocation.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
But you're aware of cpumask_var_t (and respective allocation functions)?
</pre>
    </blockquote>
    <pre>Now yes, thanks.

~ Oleksii</pre>
  </body>
</html>

--------------0tJQ91MJTwezolrEhedV7Ugi--

