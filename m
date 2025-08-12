Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBAB21E9E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 08:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078286.1439269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulirv-000319-K1; Tue, 12 Aug 2025 06:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078286.1439269; Tue, 12 Aug 2025 06:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulirv-0002yw-Gd; Tue, 12 Aug 2025 06:52:23 +0000
Received: by outflank-mailman (input) for mailman id 1078286;
 Tue, 12 Aug 2025 06:52:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uliru-0002yq-Fl
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 06:52:22 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4cc83de-7748-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 08:52:21 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-605b9488c28so9097865a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 23:52:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a91141e9sm19551845a12.58.2025.08.11.23.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:52:19 -0700 (PDT)
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
X-Inumbo-ID: e4cc83de-7748-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754981540; x=1755586340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CU6l/YxR38H56kfp+AvQsVaRCIYqsznCnye+9vNlqXc=;
        b=gLt/ChTkBps9pzkyZGTpZopgcFTgMflNApWnyxxVhWSWMfGY/C8WoeYc8EaWI2shQS
         8cgm9vBhDhnF/s8VwK4ez8LR2vQ8WKmRzBfLT227iY6gKfCNa0bzK0FFnZC0xpCai/Hv
         JJ9xzg2UTDVDobFTl6I+plLFrUCukyP0q+dPbmri8vkYq3PPLvXFajB6tFrg5XX9x8LN
         qwJ7nlRcaIhJX815oJbhGKxTBYUW0EqPhWYvNIhsmCUa/ZmU/ixKE/gzGzq0rH+K9S5y
         keHEBmST+255jadDiEopMP/nGIXJBJew1rcoFEPpwFzAjFF7Dc5u0LDqM3FBYX9ynfcw
         PQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754981540; x=1755586340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU6l/YxR38H56kfp+AvQsVaRCIYqsznCnye+9vNlqXc=;
        b=CzBYUZv1P4Pmm/vcIC3nZpnVWwu5m4+3bt+t66fVEbCkT1w/WNfbNGWBohfGUOWm4N
         tZItqZ5uo4o+vu4p9ges1HGN2BQMKJAodp6gPS5zdopOndrSyIyiBoe7Fh2lfhhtTzh5
         fTYvXrlDlKpSX5c8b7FF0/3Iho2uTtc2sO3PhhCH8QmCjXuxVb10hqzGgQJbYREHwEyZ
         ioFwvRhzX7uvqU/y4NdGJjc68dB5Q5L1LNfr2Ii9l0RV0GLrIHFLGnkPAQsf0p5DKGE4
         arUBdk2yfJUpC6QcMc5v3DRXYPbKXKX/jT64hnv8B5iSH41nLfQxscjNQMue2S8Twu4A
         vKlg==
X-Forwarded-Encrypted: i=1; AJvYcCWkBpWnz9pCVivbkGwTSBgsYbI6KHtyBYfgymWLObKUFRhjDlhdet3W9nCShvilrzQ6ba/QVyDqaAw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzydDkRysbKVQYpywoiVvmyOPcEB7s9QjL+CVuY/FeV610Eim2L
	DdG52X6BQH62evb+a1KG9hlDVsOBMnaHReFJZG1FWmXM7Mk8mLxTIzY5MjpVhad2pA==
X-Gm-Gg: ASbGncvRg5EZRMvHHJrxzJGa63EkAvMoK3uDqHt0fMXrf8yrCCu+zXMGkYUxVMiIUA2
	o9bCR+7CSP8YUBY18ntG2pQiOV/VX0RzceaX4/R4L1UytNL9qUQJaQU8OE6na74lRS9b4o5v78G
	AokNdOWW8r3qw02+HnnSvGsZktpmA6Df3N7YW1ym800/B4hEOwPl2m1v7oEt7RcbUkDnCLr5FfQ
	eFmmj31vEYSTbzsX+HCmn04eK5yL/vyDO8XrtPbehcpKz9vVNptJIllKTEzmdCyMN0bgGi5QDEs
	ZDGefpGbmM0ZB3+JXF6yQzZ4c1PxnNtwC/xZ4kDAhPEvQ0EG79DZpKCFPhawztSJxoDMUpz1/5/
	DnEGReb/WDvtibwloNa5LIlEIJG5knWvDZrL5b14GRKYUG71IF6pcN8Bz5TPR+h733EiwgB9zaV
	lMZMfx65g=
X-Google-Smtp-Source: AGHT+IGIHo3ItpHf9LP6uFZElkGgRV++/2iHH18r9OKCr0sWzB7swAfosvGvyqb4KUtvA/zDoPGepA==
X-Received: by 2002:a05:6402:280e:b0:617:b6fe:b6a5 with SMTP id 4fb4d7f45d1cf-6184ecf27b1mr1679161a12.27.1754981540228;
        Mon, 11 Aug 2025 23:52:20 -0700 (PDT)
Message-ID: <61aeb2a2-dc53-4f52-ab65-a9a8143a3307@suse.com>
Date: Tue, 12 Aug 2025 08:52:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] emul/vuart: introduce framework for UART emulators
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-3-dmukhin@ford.com>
 <a416cc08-5970-433a-8015-5d2aa961a000@suse.com> <aJeZpiM35gOtB+4Z@starscream>
 <6953603b-8c3f-4f12-9f5e-45cb553fe8cc@suse.com> <aJqDCJp19/iMIfDq@kraken>
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
In-Reply-To: <aJqDCJp19/iMIfDq@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2025 01:55, dmkhn@proton.me wrote:
> On Mon, Aug 11, 2025 at 09:34:58AM +0200, Jan Beulich wrote:
>> On 09.08.2025 20:55, dmkhn@proton.me wrote:
>>> On Mon, Aug 04, 2025 at 12:11:03PM +0200, Jan Beulich wrote:
>>>> On 31.07.2025 21:21, dmkhn@proton.me wrote:
>>>>> @@ -354,6 +355,8 @@ static void cf_check dump_domains(unsigned char key)
>>>>>                             v->periodic_period / 1000000);
>>>>>              }
>>>>>          }
>>>>> +
>>>>> +        vuart_dump_state(d);
>>>>
>>>> How verbose is this going to get?
>>>
>>> Looks something like this:
>>> ```
>>> (XEN) [   88.334893] 'q' pressed -> dumping domain info (now = 88334828303)
>>> [..]
>>> (XEN) [   88.335673] Virtual ns16550 (COM2) I/O port 0x02f8 IRQ#3 owner d0
>>> (XEN) [   88.335681]   RX FIFO size 1024 in_prod 258 in_cons 258 used 0
>>> (XEN) [   88.335689]   TX FIFO size 2048 out_prod 15 out_cons 0 used 15
>>> (XEN) [   88.335696]   00 RBR 02 THR 6f DLL 01 DLM 00
>>> (XEN) [   88.335703]   01 IER 05
>>> (XEN) [   88.335709]   02 FCR 81 IIR c1
>>> (XEN) [   88.335715]   03 LCR 13
>>> (XEN) [   88.335720]   04 MCR 0b
>>> (XEN) [   88.335726]   05 LSR 60
>>> (XEN) [   88.335731]   06 MSR b0
>>> (XEN) [   88.335736]   07 SCR 00
>>>
>>> ```
>>
>> Definitely too much (for my taste) to put under 'q'.
> 
> I'll try to limit the number of printed lines; register dump can be made
> compact for sure.

Yet even then I'm inclined to say that device specific data simply doesn't
belong here.

Jan

