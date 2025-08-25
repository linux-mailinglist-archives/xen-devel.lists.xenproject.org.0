Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D5B34633
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093552.1449024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZNx-0006FZ-7r; Mon, 25 Aug 2025 15:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093552.1449024; Mon, 25 Aug 2025 15:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZNx-0006Dl-55; Mon, 25 Aug 2025 15:45:29 +0000
Received: by outflank-mailman (input) for mailman id 1093552;
 Mon, 25 Aug 2025 15:45:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqZNv-0005ey-Dr
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:45:27 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85321995-81ca-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 17:45:26 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb7a3ee3cso656922566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:45:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe77f33f83sm293609466b.31.2025.08.25.08.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:45:25 -0700 (PDT)
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
X-Inumbo-ID: 85321995-81ca-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756136726; x=1756741526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V7N9foytvmAwBPKi8iFEul3qI2Vi8oHIjCnXMfoWvo0=;
        b=demr1P/wrxZxEYXd+kpfoeoLHy2ilfmaUTu+kcAUMXHorzYagPHkjwjQyiPdgw05wY
         hheFEQFCUwlkM2lZfK3UKPdjYHS5Z8+x8m2tnTklv4X+UMjrm/UJEi3+x6CC/H8si6EF
         4Adzdr5hUdO6n06mA82JRh79KTEurgfwuucMKUrJhzTnOGPhUrunQ8kN6t4aZk5OFh+0
         c7THBDTa8K5ipPZHtVNLPrUZ+vrrDMK9/Ektrcn0NBEfT/PwvhsGasza/SHKCPodZAIa
         YtEKR7ITQaGFP4m/eaJfj5Def+C2pgTKRUHLLW5/L792ISNJSen/7gUiHfAptu/maSUK
         z7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756136726; x=1756741526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7N9foytvmAwBPKi8iFEul3qI2Vi8oHIjCnXMfoWvo0=;
        b=GCcP3Cnm4OFbBzjNFxhXURw4qdOC24fAm0/dogmgE2vJrFu6kXg4VSBf7jM8DqDVwS
         NOYTnRxd4V0JAxYMTaXpGRLF+WKX5LkmFFZ9fTNp1baV5ShuVabzLYSAvXsEDYGlqUR0
         dX0P9jp9zEcoQVAHJhfq3btYitn3ummAq3s/Tbrg0G4m+IZ3USnDtAN9mjWRk2p678nM
         bu8hPB0ADjRgEB802epcDLJa/1paVNCncjHu+u12B6/lXveety08d1q+cmYoLcui655r
         va3WkbUHlUpbzTp4mwlaUyXuM/TJNDM5zqvy+G9TSpaOSvzn2hRsxZVXLoeyVZM/0ClT
         MkEA==
X-Forwarded-Encrypted: i=1; AJvYcCU0AUxe9hfNRqB1ToX5eiWs/tE6yvHYx7TmLbATOW2w2Ei5StRleAkwVJLabuMtgrk4omH8vlhoqfc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxt1IbbPMcB3SbgCy4jr8yfoWINtTl7iRTZc+Uf/WO+dVZJNu2K
	E1XQ4fd28a5NMwzBr/KBxMl1Y63BTT03ragj56ECQ5J2ZPdvaqIF2OhuPNPHzd+BaQ==
X-Gm-Gg: ASbGncvhxU997Vh41WYI5rJqvenaK/l0R0xZ0y/0gIZ9CETBYAcijYOXunI8/aea0jc
	SXqezU/54XEvOZ0M0hyVbqqhzERXItOKG36SRMtUH9Uu7fyXUBSQjXtvWKdMvCjHrLD0424HZCP
	vqjU29gC+bP+btCJKhtIzAX3klLzqSwytZns3vcj0+qKKoRMY3yr+TxoUurOb0Yf7ewL2V3n1rG
	/6H/aYTT7VA0rNvIGLZZDx+uERIXlPBEBhp3N8IXfPd+WENsX6OQql/4qLc7el8RrWQf1s4J4IV
	qB7D4SoqLkl4ZjLd58iQaYB+TOaeYF0up3rZ70kDYE32OdzsbQrmm2oivuzETwpSN3chnZ0hHEW
	pog+PQypwDmiJCuAU/liF9kVKDr20QtTr3x7jwqG5MCP0I8dCawHQQxntYK4G+SQJNNEbdM7Ase
	H56ZT53mA=
X-Google-Smtp-Source: AGHT+IG7stXwLWKHD8l30pszf+96RR8ZlAFagfiw95h6g5bLkl12fazdhFE7F6VXeuneevnSGQBktA==
X-Received: by 2002:a17:907:c1c:b0:af9:a5f8:2f0c with SMTP id a640c23a62f3a-afe29054033mr1062679166b.28.1756136726089;
        Mon, 25 Aug 2025 08:45:26 -0700 (PDT)
Message-ID: <47daf787-5fda-4333-b456-64dabec10cd1@suse.com>
Date: Mon, 25 Aug 2025 17:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] tools/xl: enable NS16550-compatible UART emulator
 for HVM (x86)
To: Anthony PERARD <anthony@xenproject.org>
Cc: dmkhn@proton.me, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-7-dmukhin@ford.com> <aKx4FtlhAbXxtZlB@l14>
 <844bb7f7-2e56-41e0-b304-77e9e9650eb1@suse.com> <aKx9ihn4i0LCq0Bn@l14>
 <48f72997-ba07-4a9c-998e-76b02f2863f0@suse.com> <aKyDmsiYxC0kvvGw@l14>
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
In-Reply-To: <aKyDmsiYxC0kvvGw@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2025 17:39, Anthony PERARD wrote:
> On Mon, Aug 25, 2025 at 05:27:41PM +0200, Jan Beulich wrote:
>> On 25.08.2025 17:13, Anthony PERARD wrote:
>>> On Mon, Aug 25, 2025 at 05:03:40PM +0200, Jan Beulich wrote:
>>>> On 25.08.2025 16:49, Anthony PERARD wrote:
>>>>> On Thu, Jul 31, 2025 at 07:22:12PM +0000, dmkhn@proton.me wrote:
>>>>>> -=item B<vuart="uart">
>>>>>> +=item B<vuart=[ "sbsa_uart", "ns16550" ]>
>>>>>
>>>>> This syntax here would inditace that `vuart` takes a list of items. You
>>>>> could write instead:
>>>>>
>>>>>     vuart="UART"
>>>>>
>>>>> which seems more in line with the rest of the man page. Then you can add
>>>>> some thing like "with UART been one of "sbsa_uart" or "ns16550". It's
>>>>> possible to also have a sublist, like the `tee` option have.
>>>>
>>>> But shouldn't the syntax already now allow for multiple items? Possibly
>>>> even multiple ones of the same kind?
>>>
>>> How does `vuart="uart"` allow for multiple items?
>>
>> Precisely. I would have expected it to be e.g.
>>
>> vuart = [ "ns16550", "ns16550", "sbsa-uart" ]
> 
> This is not an option.
> 
> Having mutliple ns16550 would do exactly the same thing as having a
> single one. It's not possible to have both ns16550 and sbsa_uart at the
> same time, one is for x86, one is for Arm. I don't know if it's possible
> to have several sbsa_uart but the code in libxl doesn't have the
> capability.
> 
> So overall, I don't think having a list in the xl.cfg syntax is useful
> right now. It's easy to change later, I think.

Well, never mind then.

Jan

