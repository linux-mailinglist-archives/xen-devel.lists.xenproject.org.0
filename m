Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC7085434D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 08:13:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680199.1058132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra9R6-0003jc-B7; Wed, 14 Feb 2024 07:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680199.1058132; Wed, 14 Feb 2024 07:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ra9R6-0003gQ-7r; Wed, 14 Feb 2024 07:12:04 +0000
Received: by outflank-mailman (input) for mailman id 680199;
 Wed, 14 Feb 2024 07:12:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+oD=JX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ra9R5-0003gK-0V
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 07:12:03 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58a13ae7-cb08-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 08:12:00 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so4175656f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 23:12:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m10-20020adff38a000000b0033b0d2ba3a1sm11474149wro.63.2024.02.13.23.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 23:11:59 -0800 (PST)
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
X-Inumbo-ID: 58a13ae7-cb08-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707894720; x=1708499520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mwylvGvro3hpcMcMavYrFkdtc5DTZNEOn4vv4OzDsk=;
        b=PUlb353dmLu0GLar4rVv6l4U5hAUJGDxl8MFzSyDUHyOISjnjQYXFt8UJyD5QwnOlB
         DFZIyckKGsXVeqP5cWbKJ/8Ycpl57SpQH6jVhRrt+sntXgVS95Wg7xg9A77nE7nr4EQv
         4xmj32eXrRqAoHszEjPUc/cPS1ePpvsaawqZYnex2O+0r7SwWgl0vTKtC7iSIu8Zui+6
         ifBv8gf3PHFJ2nyv5lRE84mE9xfq1Vrpd2PERbBdU7uF2pegdjHv90kClYAp/Qo3a8vr
         DZXQBMvhOW/2+YmOFvJhlZA0/iruCXTMCzbmYhSmMhFx6Tr3NE/ssNMPDVD1+9veiuqM
         FKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707894720; x=1708499520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9mwylvGvro3hpcMcMavYrFkdtc5DTZNEOn4vv4OzDsk=;
        b=iqoDGYJchWLl8lrT8TJ8iL4Uscr7aTfptZE63tGstYgkiuNxdZplgq6dGraFKzuXf+
         bvufPOkhsImnBWL5MUB0VhkJ1c7j31uJE/fOdleCF2WYzkKTgGvx1ztkHWzT+IV6MpUc
         hbP8yZgLlxWONmen0AotP8nciq7F9tAUktFzTWFxdgRp4dLJuKWe7PD0CYjnIJlwhIzJ
         ugQJ+LLqccoQy8mR+q8sYH354taJPKShmAkhe5Je8Q9gAy5R8+UTUft7TtDwBp0xtti4
         wqssBEFSAoyo67yPl2Kixu56q7sgDlQMZh50vUONlbCH9+/0bzAu/KmXqzTz342OjAl4
         5hhA==
X-Gm-Message-State: AOJu0Yy3lBlVDV6jwAeTp4t6Lpegsvfl5xTY5h0YLoslaTIj/yvm6dhk
	QDbxm5V8x8ZAaQfpFYgXW//cv2m+LcK8c+sUS4s+QkwY9YX2VixFfQHGiiCuBw==
X-Google-Smtp-Source: AGHT+IE2X3rlRVYl/9IP6r89WArUDBOBhDVerPOYLp1imhyefS+FF/MqnIEmTvIgz6moTAVosg1aKw==
X-Received: by 2002:adf:e783:0:b0:33b:cef:5b1f with SMTP id n3-20020adfe783000000b0033b0cef5b1fmr910838wrm.64.1707894719783;
        Tue, 13 Feb 2024 23:11:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVy8kXndOaQUvnwC8/b+dgZe/boo0v8T+BvvVDCXZ7ZogzkhYICLahOfecEtCzSsQfFRnwg3Ze3EPG2kmzCQXGgBz1/gLTt5UDkvyjzCgoRrkP/Le0zf3FuLZ6gj3nvYeO6gxAs+ceirVE27SF1iFOkFxXXnww9xEnEQ6BtDavVuL5pYnyPD+Dzx/MU88jO3+rPpkn0
Message-ID: <01b0d902-1903-4618-ad43-f625e57b61e1@suse.com>
Date: Wed, 14 Feb 2024 08:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/ocaml: Add missing vmtrace_buf_kb field
Content-Language: en-US
To: Christian Lindig <christian.lindig@cloud.com>,
 =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, David Scott <dave@recoil.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <9b9909c9e93cb540b3488c784935acc2bc9e071e.1707343396.git.w1benny@gmail.com>
 <3A858D7F-C953-4EF0-8919-AE96D6105AB1@cloud.com>
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
In-Reply-To: <3A858D7F-C953-4EF0-8919-AE96D6105AB1@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.02.2024 10:13, Christian Lindig wrote:
>> On 7 Feb 2024, at 22:04, Petr Beneš <w1benny@gmail.com> wrote:
>> Add the missing `vmtrace_buf_kb` field to the OCaml bindings to match the
>> vm.cfg configuration, correcting an oversight from its initial introduction.
>>
>> Signed-off-by: Petr Beneš <w1benny@gmail.com>
> 
> Acked-by: Christian Lindig <christian.lindig@cloud.com>
> 
> This looks correct from an OCaml perspective. Why was the new field added in the middle of the record type domctl_create_config and thus forcing changes to the index of fields coming later in the record versus just appending the new field to the record type?
> 
> The critical bit is using the correct type in "Int32_val(VAL_VMTRACE_BUF_KB)” that matches the type "vmtrace_buf_kb: int32;” - which it does.

Is this then perhaps also lacking a

Fixes: 45ba9a7d7688 ("tools/[lib]xl: Add vmtrace_buf_size parameter")

and hence wanting backporting?

Jan

