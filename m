Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4593C8C4CB8
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:18:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721161.1124335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mPy-0003RA-1w; Tue, 14 May 2024 07:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721161.1124335; Tue, 14 May 2024 07:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mPx-0003PA-Uq; Tue, 14 May 2024 07:17:45 +0000
Received: by outflank-mailman (input) for mailman id 721161;
 Tue, 14 May 2024 07:17:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6mPw-0003P4-Pz
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:17:44 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cba3848-11c2-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 09:17:40 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so1075249966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:17:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17814sm684420766b.206.2024.05.14.00.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 00:17:41 -0700 (PDT)
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
X-Inumbo-ID: 0cba3848-11c2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715671062; x=1716275862; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOIhA9WGutZG1eFFZwMGqwKB0Jm2CMic0qQnHRgCzU8=;
        b=BfHbGSTcw76Mr+JR5tfUT9ZWifYsSQMsdtBYEyC7Sj7/ZvpGoSjhhWAv9wc8ph2tjx
         jrzeSSeF0v55MbF+YkYBaU68ni90FKCeGu8K7pGK378hIwzkDLeRlYAGAq+Tzssv7HgP
         VExA2fxhp8oC+bPnyUZ7KFq4QCWlsAYssSl0vZHTdyAzZep4wlZmJ83DOFlFc9mnJyQe
         M0wNyIDRkiBckHhpzDGmrQwmpzKXOAEkzW4JGDLyBugUFz2bKeHxg4iYpvQmg3Y0ZVuL
         X/IOAxJwqg+fO6Ul0VYgEgIKIVYxw+FXm2pPzXwsCbZUJC42pA/hNMI5yosyo8cxHJWc
         OZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715671062; x=1716275862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOIhA9WGutZG1eFFZwMGqwKB0Jm2CMic0qQnHRgCzU8=;
        b=Vt3m7dtXH4JEJedqhyA3PAXa8ltNQMcN8QWVpjT0qo28K3455GD1orQZSyI1ZktmHo
         EQ56sv/AurUCFjNiVeBp5XlSOilOv9pzn4LHJtEHu1+muBmlO5FXL+zqy5nxu5LzIwyJ
         9nZ+9XWJHn7xaR9yMsvYzpH91GCxFnxuYSWXFYHYl4GfC3TweU3zkJzG+c6gosT+nDDu
         v6HvJFFgmHZb93dRNxW+KIzmpeMYmCoPsQkov9QWOxOydb8bAaZISGAsuOTiI5/4Hle7
         KVC6UcB8CyMyC5fkcw3Nctd8CZbLGRR1UuwJcxCjbURZBY8U5fitsTWwl23XAPwC81OD
         3Pig==
X-Forwarded-Encrypted: i=1; AJvYcCUcJxi4STzmT2t4K64PYR3RxVKNE9oxo0h9C6ej0NEFB0GgjRRpaismjFMp64TqUczwKc8xvdbRFM35OcvgG43NdaQnvxHJRH2wlYtic6Y=
X-Gm-Message-State: AOJu0YyaA9n0Jr2sBEfSk6Rgq/B8Ix9UxDc1jphe88j4yeE17gzWPX9D
	WPXOY/pV1Oxgj8u142BgXDlAHbfes8ky5NGHUuaLzZt8OA2cQnUldj/ZAm9Qbw==
X-Google-Smtp-Source: AGHT+IFl8pOZCFWPsiUEvgSZDJeu1QnF/6e1bh8rRdTq96Wc3qtI3ISvYot+4kD+hWjpVbys3Jo7Fg==
X-Received: by 2002:a17:907:2d13:b0:a59:c577:c5c3 with SMTP id a640c23a62f3a-a5a2d57a48emr1320356366b.29.1715671062189;
        Tue, 14 May 2024 00:17:42 -0700 (PDT)
Message-ID: <5c456b29-f458-4cd2-b92d-edb530de6959@suse.com>
Date: Tue, 14 May 2024 09:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] xen/arm64: bpi: Add missing code symbol
 annotations
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
 edgar.iglesias@amd.com
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
 <20240501035448.964625-7-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2405031656490.1151289@ubuntu-linux-20-04-desktop>
 <CAJy5ezpgXVp838aA_E8vJDARoO5iQOh07D+Gpn0kMCLj_iXyLw@mail.gmail.com>
 <398afdf1-8a11-4584-bb07-cf6fc2373d21@xen.org>
 <CAJy5ezpNQP5q0NVaGdXtt5BbJSzCMfTfFt-0RRgVq3+DqMbKgA@mail.gmail.com>
 <35c8fbfb-8b09-4aae-8c98-402dcd65ca2e@xen.org>
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
In-Reply-To: <35c8fbfb-8b09-4aae-8c98-402dcd65ca2e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.05.2024 19:37, Julien Grall wrote:
> 
> 
> On 07/05/2024 17:55, Edgar E. Iglesias wrote:
>> On Tue, May 7, 2024 at 11:57 AM Julien Grall <julien@xen.org> wrote:
>> Hi Julien,
> 
> Hi Edgar,
> 
>>
>> The reason I choose FUNC for the start of the symbol is because these
>> symbols contain
>> executable code (not only a table of pointers to code somewhere else)
>> and the ELF spec
>> says that STT_FUNC means the symbol contains functions or other executable
>> code (not only callable functions IIUC):
>>
>> "STT_FUNC The symbol is associated with a function or other executable code."
>> https://refspecs.linuxbase.org/elf/elf.pdf
>> (Symbol Table 1-20).
> 
> Thanks for the pointer. I originally did intend to suggest the change, 
> but then I saw the use of LABEL in x86 (such as svm_stgi_label). There 
> are a few others example with LABEL_LOCAL.
> 
> AFAICT, this is also executable code which the only difference that it 
> is not meant to be called by someone else. Furthermore, LABEL is using 
> DO_CODE_ALIGN(...) for the alignment which imply that it is intended to 
> be used by executable code. So I thought the only difference was whether 
> the label was intended to be used as a function.

No. See below.

>> I think using LABEL instead of GLOBAL for the _end labels of these
>> code sequences makes sense.
>> I'm happy to change the _start labels to LABEL too if you guys feel
>> that's better.
> 
> I have to admit I am little confused with the difference between LABEL 
> vs FUNC. I think I will need some guidance from Jan (he introduced 
> linkage.h).

For annotations the question is what is a "unit" of code. That wants to
be enclosed in FUNC() / END(). Any "inner" entry points or markers would
use LABEL(). On x86 I think it's mainly markers (i.e. addresses pointing
into code which we need e.g. for comparison operations on what Arm would
call PC) where we use LABEL().

Jan

