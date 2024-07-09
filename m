Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A222792BD8C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 16:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756324.1164903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCG3-00004s-Tj; Tue, 09 Jul 2024 14:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756324.1164903; Tue, 09 Jul 2024 14:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRCG3-0008V4-R3; Tue, 09 Jul 2024 14:55:55 +0000
Received: by outflank-mailman (input) for mailman id 756324;
 Tue, 09 Jul 2024 14:55:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRCG2-0008Uy-1m
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 14:55:54 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 564f9f22-3e03-11ef-bbfb-fd08da9f4363;
 Tue, 09 Jul 2024 16:55:52 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52ea7d2a039so4340901e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jul 2024 07:55:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b4397c50csm1961803b3a.147.2024.07.09.07.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jul 2024 07:55:51 -0700 (PDT)
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
X-Inumbo-ID: 564f9f22-3e03-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720536952; x=1721141752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bJVlmY3QXAVZb+OHdpSbD1fn+L+agF0mvGcD2maAxSs=;
        b=fYBjW8tYhdrnyefymsU/5piRw/Yb5BQQ21fahjujKSbHiD4M/q1oXh0db9Dfnrtn9B
         eC/GaC5VOvUy2rNDEjkw0Hsav4efedUmEVrP90hOu55dvb5stPmVmPjp15PYgqY0/qnJ
         46W7KP3NLWcovGlwTVx3/Yo7UiNi1wjDEkx5ihPIrRJLMvR+3sOZK26AdWctIm1ZauNL
         c9OCGAcHM3QRkipbC4anBrO8d9uN2n4qNzK3YuJDCAykHZ49peRtwyxeTSiMPv/uVXvD
         e2yyzmFTA/DLVojcNue5VKBluv+Y0QBZ5JQ0itdcBJxti+LXSpwicbFPwu5qBqetlgPQ
         l1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720536952; x=1721141752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJVlmY3QXAVZb+OHdpSbD1fn+L+agF0mvGcD2maAxSs=;
        b=icbBTvWNJMd+5JQR5L9AlR2uGRr8Wm4aenMWIkel6pzoRaQs5D3g3CLJj0Ji2emimh
         d/eQRbQ7U3kKR7Xl7GXOmzFeAUGv6SYl7aWhC+2iv6YclJGY16TQi6sfSpWpc8h7Onwb
         0cz+fuppKT+irXkJm9Q3tcaxpqy2qJIXtEGSGIiCCJKmvgBPuXft2/g7FdsUdsarY169
         TEQeSop3ExQ13M0ooUGnsjeuEiWlUfeTUzcU7hkFMBu3eoNbCeeWYUfPBKpYsNnPD89M
         gZWCBeJk+pTGeZMioNZIHvz6ERke74wSjV7BQis4uEq2FRnDsg/oqmGHJbzxtjt94XMo
         X3/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEyCRG/X9NjqPD8uelAo2MKKDRkCpu9qS3Hex3eiels4Xif1hAJDPHRjdz3r1MclVaCdT5mjRjucaOVUfD/1pPY2jA1n948CV3zDE4J5c=
X-Gm-Message-State: AOJu0YyHQjxBthxnUjoM7REqqfDs62TZinyNKlf3ZhMSkEJe+Mht6Slp
	MFx062Hie6AzlyB+ilQvuXJjg62fhw1RN7SgKuow2F38IPk+CJGwJSMAnV04LQ==
X-Google-Smtp-Source: AGHT+IFVm4SGTNTAy+cfjMQYHiiXRGvvdHWbRgFouHq9N1TWBJjdCcWVqDRNae1DS9Sx6Q28ZnKjPg==
X-Received: by 2002:a05:6512:3e0a:b0:52c:e012:efad with SMTP id 2adb3069b0e04-52eb9991242mr2143937e87.12.1720536952011;
        Tue, 09 Jul 2024 07:55:52 -0700 (PDT)
Message-ID: <ad9b8dab-3f1c-4f26-845b-af88f96ee1ee@suse.com>
Date: Tue, 9 Jul 2024 16:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build system mess in stubdom
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony@xenproject.org>, Charles Arnold <CARNOLD@suse.com>
References: <44679adf-e657-4d38-b1e3-2bebb34f57a0@citrix.com>
Content-Language: en-US
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
In-Reply-To: <44679adf-e657-4d38-b1e3-2bebb34f57a0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.07.2024 15:49, Andrew Cooper wrote:
> I'm trying to investigate why stubdom/ is fatally failing now with a
> rebuilt ArchLinux container (GCC 14).
> 
> It is ultimately:
> 
>> ../../../../../newlib-1.16.0/newlib/libc/reent/signalr.c:61:14: error:
>> implicit declaration of function ‘kill’; did you mean ‘_kill’?
>> [-Wimplicit-function-declaration]
>>    61 |   if ((ret = _kill (pid, sig)) == -1 && errno != 0)
>>       |              ^~~~~
>> make[7]: *** [Makefile:483: lib_a-signalr.o] Error 1
> 
> which doesn't make sense, but is a consequence of the ifdefary in
> newlib/libc/include/_syslist.h

Charles, who is looking after our Xen packages, had run into exactly this.
His workaround patch (added to the list of patches applied on top of
newlib by stubdom/Makefile) is below, but in the given form I didn't expect
it would be upstreamable. The diagnostics by the compiler may be a little
misleading ...

Jan

--- newlib-1.16.0/newlib/libc/stdlib/wcstoull.c
+++ newlib-1.16.0/newlib/libc/stdlib/wcstoull.c
@@ -127,6 +127,10 @@ PORTABILITY

 #ifndef _REENT_ONLY

+#if __GNUC__ >= 14
+#pragma GCC diagnostic ignored "-Wimplicit-function-declaration"
+#endif
+
 unsigned long long
 _DEFUN (wcstoull, (s, ptr, base),
 	_CONST wchar_t *s _AND
--- newlib-1.16.0/newlib/libc/reent/signalr.c
+++ newlib-1.16.0/newlib/libc/reent/signalr.c
@@ -49,6 +49,10 @@ DESCRIPTION
 	<<errno>>.
 */

+#if __GNUC__ >= 14
+#pragma GCC diagnostic ignored "-Wimplicit-function-declaration"
+#endif
+
 int
 _DEFUN (_kill_r, (ptr, pid, sig),
      struct _reent *ptr _AND
--- newlib-1.16.0/newlib/doc/makedoc.c
+++ newlib-1.16.0/newlib/doc/makedoc.c
@@ -798,6 +798,7 @@ DEFUN( iscommand,(ptr, idx),
 }


+static unsigned int
 DEFUN(copy_past_newline,(ptr, idx, dst),
       string_type *ptr AND
       unsigned int idx AND


