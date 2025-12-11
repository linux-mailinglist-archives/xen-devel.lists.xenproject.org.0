Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A250CB55C0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 10:30:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183733.1506329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTd07-0006mu-Mw; Thu, 11 Dec 2025 09:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183733.1506329; Thu, 11 Dec 2025 09:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTd07-0006kR-Jo; Thu, 11 Dec 2025 09:30:19 +0000
Received: by outflank-mailman (input) for mailman id 1183733;
 Thu, 11 Dec 2025 09:30:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTd05-0006kL-VX
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 09:30:17 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00abe5e1-d674-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 10:30:16 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42b47f662a0so926199f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 01:30:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a702a1sm4955260f8f.13.2025.12.11.01.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 01:30:15 -0800 (PST)
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
X-Inumbo-ID: 00abe5e1-d674-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765445416; x=1766050216; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7zIy/YADuu1IFfXeyMuJC85jg6UCkUQ3c9lyuWQPy8A=;
        b=O9LlUnl0Use4K55V4BhP7Z9pCtZUeuF4W8KnyQ90UYZdrpKZCvUBwg3GZIkj2+5n2/
         bdf1vFDTXgjpHNW7R3YeQUVr7GYRCJvIRTnIlglCbF2RZUZVVm+x0JQoG8vXYtuoSDBK
         36lCV7RazMxDSAjFZxjsQMNZrnM0KBHzVi5DXgDvepybhKNLJkTT6QcaDIWpVndR/s0J
         d7GLsM4LWax50jWZta/xP3inqFMlxcaR6kZRXnlShKeczSdywwbKmh0QlH+ZMRlcCgV6
         YhLCWAVp5OEC+wKtXQd2RQXu0CA6FXPDcW+RskTz+5tz0JMvcizw9eK0TgpVKVXdlN5/
         HrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765445416; x=1766050216;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zIy/YADuu1IFfXeyMuJC85jg6UCkUQ3c9lyuWQPy8A=;
        b=rbH/bpwmtRhyKJJ3KS4L1/jb7hgP83OQDlqr/4uPYxPw0zn/E6ikylOCYdYVe3ThJ4
         /LZUne3rfmJcWTJvJS2etnhcoFToWSZ1QIhRFHrQxlsTF1fMmyNASIw25mNcM98V8gPf
         e2riUQKlSUz5XplnhogJaCpFEUot+XNWxOSYH46NmztL0tdj6bQC6gglWp/Z2YFUSgJG
         Qqr4YEzNl3tWu6st0kCZnzxRc4/gDTDzTWeiWJCOX1dw2Ponsa/tFzN2ob9wvSTxD4Dt
         7ASkx7FNRUBCE7fVf8sD6S4/rG7JwFjelIq+y4gLzTBkC/FJf8trBs3elh+fNJznFl51
         9lxw==
X-Forwarded-Encrypted: i=1; AJvYcCVNuGHTqnMlaitvzfIbiQrNxlkhIdobqA2wH/SZaLumKS1DIacQoGjn/CRONQsQUKsjbj6v7UZz7Eg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVdiBSgrdqHX78h+w0Fi9O4lpmuBtAO0FN1cKO8cJFAG2AU4+k
	z1287WfErhH+O8ZzymZxfaKU0JNtSRFKWYGR61P12ZqRe29WJphZdx1T4cgxRy7CmA==
X-Gm-Gg: AY/fxX6GR2Nefo639cyUtxeftd8j1bj6E/RSI3lDg1/B3F57P4un+grWDGlOnL//TSe
	mskkXu7iK0escJ99wGQFDQldeyT+ypeWZdUDDmJZtO+1KN1QxxvYHF2IOQcg/RtEKhlkz/Ojwxb
	5LlDapOy6dtWQFnoluYJox9ixg+vNnvhA6H4oi8HID95Ulu4BjqP1fmiVY1VVGF6XnDRlj6zY+U
	f9u02le9zguVV7a1Y2A1lozeLFFuqggwajUVuIuqLNSkeVZcS2FqKxYq6o/XNGw6cWGxi27fT5F
	rd/kqNjpmwaAjxUsEwk/nqoDpaXFWS6cp18sQLBwPZFFqywgNttSTfDqUGTX+IG8ToUcJbGxIUR
	xzW91dP+g5CQYvF2nkJDNmf6HPaIAgjfVMy2y6JRaA7NXtVNmwGAPrgcbcCHYV9lMUpg0wooPq7
	P39Enihy8zUk/wlmOYRvwpNQilBlTqADs0rTpfa/L7Gmw96JEMxgNi/I2hTd8gN282fQe+xZp8D
	/r3Mt2IDBiKBg==
X-Google-Smtp-Source: AGHT+IHoCeunng9GxsZskFoAYVHXoNXbreKVjlFa92kC0g4hmI5N0HidPVKo27XBlioSzZtN5AgdXg==
X-Received: by 2002:a05:6000:2510:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-42fab31c8eemr1557832f8f.21.1765445415955;
        Thu, 11 Dec 2025 01:30:15 -0800 (PST)
Message-ID: <d2988b31-66e0-4a6b-8f77-4ae2cf2c4bd4@suse.com>
Date: Thu, 11 Dec 2025 10:30:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86: Fix missing brackets in macros
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-6-andrew.cooper3@citrix.com>
 <5a4695fa-1520-4d52-adc3-72c159892e33@suse.com>
 <fdf95d1d02274a6442d4eb4c6b7284b8@bugseng.com>
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
In-Reply-To: <fdf95d1d02274a6442d4eb4c6b7284b8@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.12.2025 10:15, Nicola Vetrini wrote:
> On 2025-12-11 09:36, Jan Beulich wrote:
>> On 10.12.2025 19:30, Andrew Cooper wrote:
>>> With the wider testing, some more violations have been spotted.  This
>>> addresses violations of Rule 20.7 which requires macro parameters to 
>>> be
>>> bracketed.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: consulting@bugseng.com <consulting@bugseng.com>
>>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>>  xen/arch/x86/mm/shadow/multi.c     | 2 +-
>>>  xen/arch/x86/mm/shadow/private.h   | 6 +++---
>>>  xen/drivers/passthrough/vtd/dmar.h | 2 +-
>>>  xen/include/xen/kexec.h            | 4 ++--
>>>  4 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/mm/shadow/multi.c 
>>> b/xen/arch/x86/mm/shadow/multi.c
>>> index 03be61e225c0..36ee6554b4c4 100644
>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>> @@ -781,7 +781,7 @@ do {                                               
>>>                      \
>>>          (_sl1e) = _sp + _i;                                           
>>>   \
>>>          if ( shadow_l1e_get_flags(*(_sl1e)) & _PAGE_PRESENT )         
>>>   \
>>>              {_code}                                                   
>>>   \
>>> -        if ( _done ) break;                                           
>>>   \
>>> +        if ( (_done) ) break;                                         
>>>   \
>>
>> I don't understand this: There are parentheses already from if() 
>> itself.
> 
> Yeah, syntactically there are, but those are parsed as part of the if, 
> rather than its condition; the AST node contained within does not have 
> parentheses around it.

I fear I don't follow. Besides us not using parentheses elsewhere when
if() is used like this macros, the point of requiring parentheses is (aiui)
to make precedence explicit. There already is no ambiguity here due to the
syntactically require parentheses in if(). Why would a rule and/or the
tool require redundant ones?

Jan

