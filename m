Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 619FCB48C11
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 13:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115121.1461854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvZzz-0003Oq-J7; Mon, 08 Sep 2025 11:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115121.1461854; Mon, 08 Sep 2025 11:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvZzz-0003MA-GN; Mon, 08 Sep 2025 11:25:27 +0000
Received: by outflank-mailman (input) for mailman id 1115121;
 Mon, 08 Sep 2025 11:25:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uvZzx-0003M3-F5
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 11:25:25 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ff12e24-8ca6-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 13:25:18 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6228de280a4so3932014a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Sep 2025 04:25:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62069b79e1asm8836284a12.26.2025.09.08.04.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 04:25:17 -0700 (PDT)
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
X-Inumbo-ID: 7ff12e24-8ca6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757330718; x=1757935518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OiFr1LYblUUTJ4e+zUF6icTV6yBufld5nKKTUGNHAEQ=;
        b=KMzpK56AfhR2DvdK/wToLoCyVD1+C/gY+kXSzIXyUF9bUgrO/0xwcYK+0BFKqdMVkS
         Id8MqPUTZ1XA+JkU2QUXzV81p5tdCzjlE3jB6KXqKCdAk/9u05En1Uzor9qUPQnUgwVo
         +RIZNbh7Q0UWHTCn8qcjRPmLA3sPV8fCgPVkvBJtQR7eTgJ3yd2Or+CyJcGChsF7DnEI
         oGhAxixBwlh2YRMZXFlC1pZidcsOqhGn1hPa7+vHTuhUGVVJcg9o2c5XJXbQE7ppFujR
         CmklUHRIe0y/dx56a2rSXfu8YLl8AcOEbfcWX6wcPxVIgr0D/LUEtDKV4k75NBg6UHhb
         LmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757330718; x=1757935518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiFr1LYblUUTJ4e+zUF6icTV6yBufld5nKKTUGNHAEQ=;
        b=FCewLIH1AIbIMFti/iMaIEPAElIX1y5+LNjGwpaFynH8Thi0xuRbHHjt0912R18WC+
         1FdC2a/su4hbnlXdG653sIYc+TpcM0afJYv7nsU6xTkR7PFyPZ7lxO1HBSHuZyLcgYHP
         NR7aLfKJuFrnyFDKNOzPZe2Q/nY2J7ZtFr5+SpfY/jgdA/1RcKlEjeOa6v1/T/WLNbng
         cnbjc2ggmQexb3uOguu52lpKS0SvhCKVkEY/rLHfV+yy7N1um2ZxEG3gVSrEsXg1CE0g
         WAmmpxwiQ1x1XcVztIVtBZDlUfEvc2Tbr/oCedf9quyXRKl0mM/tXYAL8MMmYI48jj3e
         UAeA==
X-Gm-Message-State: AOJu0Yza+xgKAdHjkMtbsT48EEtmua8t3LG6SyNATXTE4KL1Y3YnvyaV
	2LFGWiKqwreu1f70g17k5TvTSLDomFtYdQD3w7DTzdZVpbZ3P4fPRV4Jm+Tdyl07UQ==
X-Gm-Gg: ASbGncui/uBfTfvGan3F3K7RNWMIC7AgkWDENxu4KgHEI5NSNHe6Vw57uS5jIVQF8Ty
	rb6hLf1D1Qt8EFYkiZYA7R6fi9DGsf97Or8G2956WYGJQHFgJ7bLm4K3UBu5CiTUKj4b0bWZwMy
	4jiW2d9UsPtf5ViDd16fBYvZVOPw2ua22/HoNq9eaP2LABoPKwqiihB+bZ7bCZZ5mfBzNVLCsTH
	ro3PsqaL2XPkh87TSaXxAJbwDuAUxC2Lw67fRG6E+tbM1GdXBOBkdTCLHIKJggHzUp3spK3JZ+T
	0ZXDSsjlLxnyhIJkA56ZZnV0AZC2UmZ7SeXJ/tuysURDt7aDGzmrzCJhfbT+ET1+7o+b7NF1u2z
	Sk020Q3HkghquHz3O9nv2TpSEFHFbOZlE9Q0FSy44YyfSW10BBp4JEUC0YkaA/JV3jYHsfRs6Bj
	nDazMHuuZyQE9BibjD8A==
X-Google-Smtp-Source: AGHT+IHDE8sjl6WMATI1HbhMNyg5V/ZCXtsQAsmJy6c0l1s3+Tl2sQkeuUNniU6U10JTX1vjWLf6HA==
X-Received: by 2002:a05:6402:27d1:b0:627:9d08:97a6 with SMTP id 4fb4d7f45d1cf-6279d089899mr3680143a12.18.1757330718101;
        Mon, 08 Sep 2025 04:25:18 -0700 (PDT)
Message-ID: <9e474109-7aa1-42b9-9fa6-31c4ef0fb856@suse.com>
Date: Mon, 8 Sep 2025 13:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68bd98b92c2b2_2afba52d9ed55e79908873e@prd-scan-dashboard-0.mail>
 <77361e51-dcb8-40e2-a526-9ff90ba942a2@suse.com>
 <DCNDAW983CUC.C7PT9CRVXUWU@amd.com>
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
In-Reply-To: <DCNDAW983CUC.C7PT9CRVXUWU@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.09.2025 13:04, Alejandro Vallejo wrote:
> On Mon Sep 8, 2025 at 12:19 PM CEST, Jan Beulich wrote:
>> On 07.09.2025 16:37, scan-admin@coverity.com wrote:
>>> ** CID 1665362:       Integer handling issues  (INTEGER_OVERFLOW)
>>> /xen/lib/find-next-bit.c: 104           in find_next_zero_bit()
>>>
>>>
>>> _____________________________________________________________________________________________
>>> *** CID 1665362:         Integer handling issues  (INTEGER_OVERFLOW)
>>> /xen/lib/find-next-bit.c: 104             in find_next_zero_bit()
>>> 98     	}
>>> 99     	if (!size)
>>> 100     		return result;
>>> 101     	tmp = *p;
>>> 102     
>>> 103     found_first:
>>>>>>     CID 1665362:         Integer handling issues  (INTEGER_OVERFLOW)
>>>>>>     Expression "0xffffffffffffffffUL << size", where "size" is known to be equal to 63, overflows the type of "0xffffffffffffffffUL << size", which is type "unsigned long".
>>> 104     	tmp |= ~0UL << size;
>>> 105     	if (tmp == ~0UL)	/* Are any bits zero? */
>>> 106     		return result + size;	/* Nope. */
>>> 107     found_middle:
>>> 108     	return result + ffz(tmp);
>>> 109     }
>>
>> I cannot make sense of their claim. 0xffffffffffffffffUL << 63 is simply
>> 0x8000000000000000UL, isn't it? Where's the overflow there? There also
>> cannot be talk of a 32-bit build, or else ~0UL would have been transformed
>> to 0xffffffffUL.
> 
> The offending line LGTM too.
> 
> The only credible explanation I can think of is Coverity flagging discarded 1s
> on left shifts as loss of precision.
> 
> If so, "~((1 << size) - 1)", or "(~0UL >> size) << size" should make it happy,
> but surely that error would flare up with all uses of GENMASK() too?

And with any other non-zero values of "size" here.

Jan

