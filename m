Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352DEB345BE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 17:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093474.1448974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZ6n-0000UC-RU; Mon, 25 Aug 2025 15:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093474.1448974; Mon, 25 Aug 2025 15:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZ6n-0000SH-Nv; Mon, 25 Aug 2025 15:27:45 +0000
Received: by outflank-mailman (input) for mailman id 1093474;
 Mon, 25 Aug 2025 15:27:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqZ6m-0008VJ-P1
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 15:27:44 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b42f6dd-81c8-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 17:27:43 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb7acfde3so669387166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 08:27:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe895baff6sm156706166b.52.2025.08.25.08.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 08:27:42 -0700 (PDT)
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
X-Inumbo-ID: 0b42f6dd-81c8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756135663; x=1756740463; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fryvEF3CETd5NA4lGbhpvLDHtuds2z4oYB2agZ4677Q=;
        b=Dryo0laGc9Es2m7B/AivcPWDP6iEUgZMtpdClIt/6oJ4No5kcHgoI/MysMRTAHWaj8
         Jtrkft5QNs4gE1bEIzPbrb1PWyzJXb4oNvNYXn3BbpPwvKxrKXLFx2GiDEkWndJG5B2X
         kwC3UX5lChgoNk5ncgIdxjI3x4S9GMyJBQvxiJM0qBfM3aqXEW7x+o5UGHaGxvAch80S
         xCrKy2Y6dQ9NUkaDGVbYp3jax2WsmhWIg7USVj3QbN9OCWaGV2dxhLRjO6QHPpWvv9Nj
         URiF+wRF8m5nUinmr9FhK7PrifAlWVtFNFRmXvwH2CgptCxW9wPWSwUe+MUkBjYyxPXm
         mVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756135663; x=1756740463;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fryvEF3CETd5NA4lGbhpvLDHtuds2z4oYB2agZ4677Q=;
        b=H/r66EP1QAAGIYS1209sZiRP8tnJwX3kSDQvnWfHj0OGPSJqAy68yOrwBhCz+iOJJ2
         jiBbfBsT31iEzrEOjkfqnZvSY/yLUmLZ4d5bGWDpVbxzfEgiWeRvWdsIp8cPSE0c4lVj
         3qWD2/l9BWXaPLRgnco932GQDelh9zSnvRqGTiS3X+jovYksMmnNLsaXuM/HUwZN4iEq
         C504LKMNjh4Wz7MwbjPswq4W03BfXYKzaPjEPqbtbgHDOTKLRT7yTE8Hl7bG5BhrK/Bg
         MQGmOhh2SGJHOjkkyH1ejumU2EUxHQ55jckDlAjd8xPVSwjgoRMSExuYBrLg3Y5zGwMa
         ZhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqs4uv8A1OlzZYu4xXnkzqY2/ziU6Gg4ePY2pnKwYNhhUOh+RTVkWZHB61EkFFJ/l34O7xAJJjTfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiQoS27S/Z82ECrsiOEVXDe5wJ3LhexGliU6eqfS8qb/qy12Mk
	awAqrHN21CP0Kk0EpV0HDmLFJMeS1jBCjjU9Hmh3NPvJN4c2rr5eBXh0m7udFKZcjg==
X-Gm-Gg: ASbGncuFaXgy6N9M+YmmFY0eVWgLyEJuvKVyZ/bOq8Di+/emP4b+UPR0GkkP7erc3NM
	gDm1RubSZpno7wTl0zlA90/nkyFWeWKFj5A7X1MSnyF9Vto9jTeKvcE3HoFIJ6RjlYfOA8pT3F5
	6YFzQRqTMyMiY5RQtaJlXIcf5Tb+ebow0w0eNY22NlHSxlEy/vIYRdsgtNs5tExgkrtExuGKGmP
	W6yViJTkiEA1+EVWvKdU5TvDZcQdiQcLbxguW5BFa3KkRbpJ4VLZPKoaJNUEwJ/vWXp40Rin6kh
	tR75bfJlINcB93gPNkgeXn/4NL5Sed6+sUE4wMNNikVAGBVszCfu4NllE6pVKtldjmm8vT68VrN
	8go/f8F6jRAK/d3VghLh6SpnfCOQIj36gd6a2ZGFYi/hZeMsI/FH8GdVXTE2fo6XhzZbveK+UOe
	3+9qBCaPY=
X-Google-Smtp-Source: AGHT+IH8pEj+OuSESXbMFWaXYXibKeGkTf/6TLT5rU9TOC/YQt4vqh1F7OzvbXYBYg1WScKbL9eBkQ==
X-Received: by 2002:a17:907:1b29:b0:af9:611d:8d06 with SMTP id a640c23a62f3a-afe2965b625mr1254418066b.54.1756135662602;
        Mon, 25 Aug 2025 08:27:42 -0700 (PDT)
Message-ID: <48f72997-ba07-4a9c-998e-76b02f2863f0@suse.com>
Date: Mon, 25 Aug 2025 17:27:41 +0200
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
In-Reply-To: <aKx9ihn4i0LCq0Bn@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2025 17:13, Anthony PERARD wrote:
> On Mon, Aug 25, 2025 at 05:03:40PM +0200, Jan Beulich wrote:
>> On 25.08.2025 16:49, Anthony PERARD wrote:
>>> On Thu, Jul 31, 2025 at 07:22:12PM +0000, dmkhn@proton.me wrote:
>>>> -=item B<vuart="uart">
>>>> +=item B<vuart=[ "sbsa_uart", "ns16550" ]>
>>>
>>> This syntax here would inditace that `vuart` takes a list of items. You
>>> could write instead:
>>>
>>>     vuart="UART"
>>>
>>> which seems more in line with the rest of the man page. Then you can add
>>> some thing like "with UART been one of "sbsa_uart" or "ns16550". It's
>>> possible to also have a sublist, like the `tee` option have.
>>
>> But shouldn't the syntax already now allow for multiple items? Possibly
>> even multiple ones of the same kind?
> 
> How does `vuart="uart"` allow for multiple items?

Precisely. I would have expected it to be e.g.

vuart = [ "ns16550", "ns16550", "sbsa-uart" ]

(i.e. the square brackets are part of the necessary syntax).

Jan

