Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C68915EE3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 08:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747212.1154556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzcr-0000Bs-Ev; Tue, 25 Jun 2024 06:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747212.1154556; Tue, 25 Jun 2024 06:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzcr-00009V-CM; Tue, 25 Jun 2024 06:25:57 +0000
Received: by outflank-mailman (input) for mailman id 747212;
 Tue, 25 Jun 2024 06:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLzcp-00009O-7G
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 06:25:55 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5e23c48-32bb-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 08:25:53 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35f2c9e23d3so3762407f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 23:25:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-706511b137csm7265112b3a.86.2024.06.24.23.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 23:25:52 -0700 (PDT)
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
X-Inumbo-ID: c5e23c48-32bb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719296753; x=1719901553; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ds7BUmnZ96D/xuLbWD36rYp/G6iSUvUfatH/VCXhgHo=;
        b=aH2KCo9PnFeHJ2K/iUDfSE8udqWTvP9YlnYCVDuCt3H3QT4gqOQc8tezbq9MJqvNcg
         ZnuvdyLA57NCLU34kHg18rsjjLGBYmFpW4DIRp+C7+7N9MEdrw4F8ek03sOYe4DvQBki
         QF6qotZ6JFtDqygIo5lWWPNyUUVrtw/ajYBP2cTRp+8a7T881j3/D5QifzBf37egilut
         Mb3X+mDqazWWKznVeQdZtliZUW5s4IBNcH5hs7C+3HzjuGeKkaNimvAhL86tbVq10sZW
         uVz1z9i2ZWpOGfpVNOiCj5tAm042/e5gGcL1Ph+gXjKTPubJDHfX7VH8s/JJqUfegvM1
         274g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719296753; x=1719901553;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds7BUmnZ96D/xuLbWD36rYp/G6iSUvUfatH/VCXhgHo=;
        b=LshaznFhPworaGy3ZT7NLKRCEELwxGWo7OYM9jLBufi6boYpeV/gdwpOa/4Hw3iLeN
         GYgE6dK8KD8vJAsoNe8qicngTmg/fbeAPQVH4mag+l1LdrQnIocTFoa/MXyMC3KQU4KL
         WKFExDzZZFIoA21CE0mauFmE2tEfmw5upVuIGjxydMTOMFOVwQbCay14+3CO6KTVIYas
         Q6gpm/M7TCf3k0m9H4pZJ0enXvYqJUX7fjodKWB4KrtgM16Rxt1P/sESZC1gfKLW8bmB
         u0HhqaVqULgduVwV4Ga/qQ2Xe7ebduGwcQTiidCsTHbbf6i3NbuvI2xb7DLByLxfvnCU
         EVhw==
X-Forwarded-Encrypted: i=1; AJvYcCUSXYlFCkE7OjGMkk8WdH0D8w64mUYQu01Q2YNq5LW46HLJKHAq/ktuZFl16Trp7UWECKURwLRkf0LF1H27xn1QEI0L45TKLVvCJ+EVnkg=
X-Gm-Message-State: AOJu0YwwSFfNJbZkLoar7HYNjImCUMduGSIbYuLR/H04TWIlHp1Ep/bB
	qjkFMFghuaGM2TN+DvFcLr7FNHq51XqtP9GyccAurCMJL3k5HYZQ+oANYDnbVw==
X-Google-Smtp-Source: AGHT+IEErUYMI3plik3w1tw6HvNzk6fvZ7VJ1wXcZ0OwS1Vgy+cpjbigsfRBLFzipuBHVK0NZTrSkQ==
X-Received: by 2002:adf:9d89:0:b0:366:f976:598b with SMTP id ffacd0b85a97d-366f97659d1mr3076366f8f.8.1719296752761;
        Mon, 24 Jun 2024 23:25:52 -0700 (PDT)
Message-ID: <fb06a382-d26a-4973-a681-9bf3fb0f7f9b@suse.com>
Date: Tue, 25 Jun 2024 08:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen: add explicit comment to identify notifier
 patterns
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>
References: <d814434bf73e341f5d35836fa7063a728f7b7de4.1718788908.git.federico.serafini@bugseng.com>
 <f7d46c15-ff85-4a6f-afd7-df18649726c8@xen.org>
 <2072bf59-f125-4789-be77-40ed3641aec4@bugseng.com>
 <alpine.DEB.2.22.394.2406201811200.2572888@ubuntu-linux-20-04-desktop>
 <bce5eae2-973d-4d69-bee1-09f9f09dd011@bugseng.com>
 <alpine.DEB.2.22.394.2406211529130.2572888@ubuntu-linux-20-04-desktop>
 <917533b5-b79c-4e97-917d-9684993bf423@xen.org>
 <alpine.DEB.2.22.394.2406241651400.3870429@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2406241651400.3870429@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2024 02:14, Stefano Stabellini wrote:
> I do realize that some of the notifier pattern switches might want to
> handle all parameters but Bugseng or anyone else looking for simple
> improvements are not in the position to tell which ones they are. We
> need to wait for a maintainer or expert in the specific code to spot
> them. It is not a good idea to cause a delay in handling all the
> remaining 16.4 more interesting switches (which is also easy) to better
> handle the notifier pattern (which is hard).
> 
> The notifier pattern can be looked at separately later by the relevant
> maintainer / interested community members by sending case-by-case
> improvements. They cannot be mechanically resolved. My understanding is
> that with this patch series committed we would be close to zero
> violations for 16.4.

In fact yielding a bogus result, suggesting the tree is in a better state
than it really is. Putting myself in an assessor's position, I might be
considering such close to lying at me. IOW the fact that some violations
cannot be mechanically resolved shouldn't lead to us mechanically papering
over them.

Jan

