Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED614A5F544
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912120.1318446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiFj-0004ma-LG; Thu, 13 Mar 2025 13:05:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912120.1318446; Thu, 13 Mar 2025 13:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiFj-0004js-I0; Thu, 13 Mar 2025 13:05:35 +0000
Received: by outflank-mailman (input) for mailman id 912120;
 Thu, 13 Mar 2025 13:05:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsiFi-0004jk-77
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:05:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8438239-000b-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 14:05:32 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso8291875e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:05:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c82c258bsm2027930f8f.24.2025.03.13.06.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:05:31 -0700 (PDT)
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
X-Inumbo-ID: d8438239-000b-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741871132; x=1742475932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jM45XkxNyBQjNkMLZBsVHXbkMf4SzfY6mn/uxfZVz9k=;
        b=a5UH+i9zVjB471nCyjR3SH+W/YvkSHBPFphRwbBf4TVZLxuWTIlsVTOYX5+pDbhybg
         IKN41lbB0jeGa9OhMsHKZW4yChPDJckhxL+d6n0oNj0MdOc+jD9A441cOJz6I8rW2Frg
         8+aeL/hPF1Gx+LH2S+Uzey2i+/pLUXA2iGzWf39zDRCQjr2qRzJ5ds8VdYK4GGUzBj20
         pZRAW20JAGtwjPXwmQo3Q3q/9F8I67lbcpOwUWmIopVnNfwNhFZ2HKuWcKVI7o4P5PWc
         rNlJaA8c2EhVlnY418xax6bgCyazQkOFPUDnuoEFuzrAZslkD1a9a9MY9DJ/sTxU/56c
         sXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871132; x=1742475932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jM45XkxNyBQjNkMLZBsVHXbkMf4SzfY6mn/uxfZVz9k=;
        b=vyy7KDLa96LaF69j7RgemCJOBtx5vYtogpmsE5r3x6c4/kVUQfgbJSfbZbdjnC32xY
         GJX7LMlrQV8fpwh2yyejZuz5OXI23AZ36kwLVAz5Mn9mGMeXTVd0V2+/yplvrJ40Ua/F
         5rKS65YcDxC/Doeigk8BDuVmnjPZLSsiJEKfhNRDqIs6ywROMuiHLi600LwbZ7OGqD+2
         /wPtJlYzKb8lVrXO8LOqGFj3K+8ibV8/b7f7y4AZzRRCl6KSkJSYuORf3qXmIAPUEYkC
         ypo1Athat7WlBUe5AYPbKp0F50RXjBKeS0bHySASzXrSVgyfD7YetjC+/E57fqzK/FFB
         M8tg==
X-Forwarded-Encrypted: i=1; AJvYcCVPCz6JHz/RxsI55LYqACXBoZ2RMIx6t3IgfY1Ts9g7QthZmnJ6ZXVbW0yooK8gr0zQElf8bz3LVsg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdKGiEIVKWn1H4EMEyOI7y2x7rEUSXZCfV9sHS7s1v73pwLnmx
	TD/v6FJGJUMFh5VKaAk9BVzkmBJ9509f4ejR0AYjpUTNkAyVgxrk63IPWqimhQ==
X-Gm-Gg: ASbGnctPdJ3Tu2zFJd+naEURe2dZJDRB7YWew2W58P7YtiIBCoVikwT7DL5x3lKNKvZ
	acQrMvum6NOhlZ8gvnfz5pDbMU0JEJworeVZMFTg/K00m4keuhFx3AfUNV9s1HAFSsjSjgW2kSm
	cVD+E3EV4iIq3vFyKRnd3LQR0QzJIGmykQqF5abMr6DwrfW66GaS24EpEPjg5rI3pNX0DJk5+ez
	6FnITE15omr1XICtOmMjbgFi60BBz11MSIcaL9kK6/svRKzqdih2wgGnCUTOCahuPEN86Lo8JQE
	/2oF+K9LN4H/rchuZCtAN3IhW48RD2sax7yp/cD0oSR04ELzrt4LwybVPKX8JNF5eBc5SIiF7w7
	37i/SwfvjEP5wG8Z+17+6ffovDS40ag==
X-Google-Smtp-Source: AGHT+IE1LWuUc3IwZwS99hBeWjS+AOjAUUv5wIAg1O78kdyDfQ3k1AsrcCGga65D5UuEOyRSnSeGbQ==
X-Received: by 2002:a5d:5f94:0:b0:38f:4d20:4a17 with SMTP id ffacd0b85a97d-392641bcf76mr12741627f8f.13.1741871131636;
        Thu, 13 Mar 2025 06:05:31 -0700 (PDT)
Message-ID: <c3890a8a-afe5-44ef-9c67-2ef0d73346a6@suse.com>
Date: Thu, 13 Mar 2025 14:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] xen/arch: Strip out tlb-clock stubs for
 non-implementors
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
 <20250312174513.4075066-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250312174513.4075066-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2025 18:45, Andrew Cooper wrote:
> Now that there's a common stub implementation TLB clocks, there's no need for
> architectures to provide their own.
> 
> Repeatedly zeroing page->tlbflush_timestamp is no use, so provide an even more
> empty common stub for page_set_tlbflush_timestamp().

At which point the field itself could in principle go away. There are three
printk()s (accompanying BUG()s) which use it; surely we can find a way to
abstract that out. This may then still be enough of a reason to introduce
HAS_TLB_CLOCK.

Jan

