Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A942997E99
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 09:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815627.1229615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syo0y-000417-Ng; Thu, 10 Oct 2024 07:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815627.1229615; Thu, 10 Oct 2024 07:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syo0y-0003yX-KQ; Thu, 10 Oct 2024 07:55:16 +0000
Received: by outflank-mailman (input) for mailman id 815627;
 Thu, 10 Oct 2024 07:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syo0x-0003Ur-B7
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 07:55:15 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbc5bf5f-86dc-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 09:55:14 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c91d0eadbfso785898a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Oct 2024 00:55:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80de0cesm49868666b.182.2024.10.10.00.55.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 00:55:13 -0700 (PDT)
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
X-Inumbo-ID: fbc5bf5f-86dc-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728546914; x=1729151714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l2YC2BxolA0sbglPQx8KzhGWtwxdyMdSWKHmLTWIhaY=;
        b=DWsECW2KPqgP7ETkS/jZlx/f/0YgMT1e9w8tQlfBfsKVOMxKHlbwyKfr0AF6/xXM7H
         voG2CGnNyJTPQFPYR/pOKS0YbQVuAlRFUuws7niG7uIb/Wg0jXR8mMi5d7IQN7h9DlXa
         v/pfKON4VvIjGhEMiVbOG0zOLWinKQOLID47vk+Mkg1e6Ue9BW6XQWNhGid/QJIcIO4X
         +vZdEJhVDEW2wXBInRbPZwPHcpuRPx1rjSbkG2ov9MBNEyQpBKQwuqkFs7LlI5Sh43PT
         PC2aoJuvGR/osoIuVrbCtX4h5pnpJrlTs8T3j3tNODVmfbFzTFdb+04nS01jf4pleGQg
         +J8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728546914; x=1729151714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2YC2BxolA0sbglPQx8KzhGWtwxdyMdSWKHmLTWIhaY=;
        b=ae6IZ6kl9OahDNOnS34rF3oPrfsknMnp47zZPI0gNd3JrsPrsTsK4cO9sWwOmTI6NC
         9f+L/Lck0Oc1sZxjZ5ErRMt2dG/D2tYr1DZrh587ydQ70pyxLWOWeuuRWb+SHaW9djIZ
         DKUTWdviMp93KwLCDAaAdLIs1X79n3KlX4U7yENT0m9UA5gtGFeGq1FCvfN18yvtm6p5
         HSYduWzU/SryZONHw40+m8jfg//3x175yTPl3Ky7OjBjSnSSP042p/g6Fyw94zHIJrDx
         rMPfmaxVGiKnMYDzajp9df0QKYIOKcU5/qunedL50RsxsMaC6b++N8j8VUKl5oGfLdZl
         QRaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA2N1kNNO1/WXU9gKDHhs7syCQChKtdtafeE6k2zbhLO09CDKtwx74osoXxGrv8aoHhuOGQTcGAnE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAzKyy+/Z+fV4hv3mkdgFz+2AZ/mcEVEOX4bhJ3FgHQR7fsT1E
	CZmy9buEGTld0DRhjOGum24OqJmrZBvhC6INTWiXYKm0ay/jyvKBk62VDrhVuQ==
X-Google-Smtp-Source: AGHT+IEjnB9eFXnrvmRqdOMk01CvgZgpZqC3Tyt6MDF1UHe0WWLvw80Xy9kPTC9egSZZ70uitOUO9A==
X-Received: by 2002:a17:907:7d94:b0:a99:541d:8c0f with SMTP id a640c23a62f3a-a998d32b373mr484832466b.40.1728546914099;
        Thu, 10 Oct 2024 00:55:14 -0700 (PDT)
Message-ID: <dbae585c-fc5d-40bc-9c05-46de10e5ac5d@suse.com>
Date: Thu, 10 Oct 2024 09:55:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/11] xen/x86: Derive topologically correct x2APIC IDs
 from the policy
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-10-alejandro.vallejo@cloud.com>
 <56fc2b5e-54c6-46df-a044-de6efcc427d4@suse.com>
 <D4RGC7XGA2NU.A2M108CWPB1O@cloud.com>
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
In-Reply-To: <D4RGC7XGA2NU.A2M108CWPB1O@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 19:29, Alejandro Vallejo wrote:
> On Wed Oct 9, 2024 at 3:53 PM BST, Jan Beulich wrote:
>> On 01.10.2024 14:38, Alejandro Vallejo wrote:
>>> Implements the helper for mapping vcpu_id to x2apic_id given a valid
>>> topology in a policy. The algo is written with the intention of
>>> extending it to leaves 0x1f and extended 0x26 in the future.
>>>
>>> Toolstack doesn't set leaf 0xb and the HVM default policy has it
>>> cleared, so the leaf is not implemented. In that case, the new helper
>>> just returns the legacy mapping.
>>
>> Is the first sentence of this latter paragraph missing an "If" or "When"
>> at the beginning? As written I'm afraid I can't really make sense of it.
> 
> It's a statement of current affairs. Could be rewritten as...
> 
>    The helper returns the legacy mapping when leaf 0xb is not implemented (as
>    is the case at the moment).
> 
> Does that look better?

Yes.

Jan


