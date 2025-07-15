Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15090B0547A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 10:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043736.1413757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaoz-0000X7-0v; Tue, 15 Jul 2025 08:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043736.1413757; Tue, 15 Jul 2025 08:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaoy-0000US-Ub; Tue, 15 Jul 2025 08:15:28 +0000
Received: by outflank-mailman (input) for mailman id 1043736;
 Tue, 15 Jul 2025 08:15:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubaox-0000UM-7f
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 08:15:27 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc63cf35-6153-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 10:15:25 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4560cdf235cso14429665e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 01:15:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4359a86sm108456865ad.210.2025.07.15.01.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 01:15:24 -0700 (PDT)
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
X-Inumbo-ID: dc63cf35-6153-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752567325; x=1753172125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R+8v4/nlYzBbGG5MipQ/BocygZwvmIk+592f37Q08Wc=;
        b=Rxr7d2MHDnrymajfOJwDCD8Hz0LpqB3wdsfp1txaLVkiULeJZ52cfV6ANlP2pFRApa
         ph6NEPFZiyjp4zW3XlXMYD1YuL2/qy+23yABWcnDRN3q/eZenukCkW7iSlHJ+/mlIDYy
         cnndiSngwGvs8ZILedZbPdKRLiugBA4s4FGd/UQe398ScA3kn88EFE0OiUmCZBx0jsJp
         TXSgAhFDg3oP5dYNrZwFoVlrkFJYbEy+ljsWYJ56n74l7nq3dPM8HTwHzaLqY5PRzGHM
         lnY7/DmkycEZC5orRLif6uTbQglvo4xlL1c0H5o79Wqu25zp4bIdqJ/Q/ccoFXX91P1Q
         fZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752567325; x=1753172125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+8v4/nlYzBbGG5MipQ/BocygZwvmIk+592f37Q08Wc=;
        b=n7cyZfdJBGNzEgX7zytaG5Of34/mHMiUHELL95YnjJWRzzoFllhr5mItcio7AvgioV
         YWeBN1xarQgmFDcHhHS5g9levcjFkxRYdvkaSKcXUl4jaoCnFVKAeaDjT9RwZ2hMFAvi
         r2FENMrgjVHkJYtpH6MDRFbahxQeOqbPZQiIiiFc/oVtjsr0h9+3Dgl6MgEiMhvJ0Q2T
         phz5K9HwodSaZsZBGRjEFt+3lJbJLltk8xd6DiMR++8ZZdsLI+RK1zLfnW6/IiMp0odS
         GAYDiXsOVcTeiQP1Tve2R2nbHynjWjY9Unkfgm2HTQdIThsEHA95USFBuI6BuUddW+3w
         FrbA==
X-Forwarded-Encrypted: i=1; AJvYcCWGoXYJq928tFSUxFSadCUKr+hr9xucdgf0JdItkdAQ4bNDyLa5Lf+blOU9LMWT+NhKpHyejmElHVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YywA0+ZkythpptBk48tf6lajxlAyyuAMPngss3sJMNtKYqauFY5
	I88x5uWsPX3S10donTHlw0eE+/v2Gv1vXeCpkJykZl9JAx2a75b4MOhpf3QCBym9Tw==
X-Gm-Gg: ASbGncs5YsQy6k4Jd+WQLTidI7fJA9tkUcIkjaoFRIXp6Yk5YLZNecY1Gp+It3QFFsh
	pEns1ugpAzfdJia4S5NE94tKUZ9a0gjkZH4aTE5bibM2glciT6Obxl5KfjCT5d6NdpHcYgnXFSd
	1IUSwze8yNzvoENhovDho/kaK2UnoE0mgH65MdkkowPc5R2fV/wQSfovmY5S4fwVaq6QNdIPvTM
	FsL/nBHnp3SdH6g99r80bPoXVgGvRznX2qtv6o0XvDB8buPLcIK63Vkm1uQ2PgAsT2/HMdUzaPi
	HBeynpU9KFfb8bRVKKwkYyy1Wr2PrGO2kHzCFXL2iQtjK5WZ2PxF8CsC89TQ/LFTXYWCmMYqZxI
	aVxNL/krDVLOApLtDuZiad7eZjCB9khOnEP4BXOIhv8AdfejreI+nFUfs/rx1Z69B/q6sc+NeIc
	y9VoOe+1Q=
X-Google-Smtp-Source: AGHT+IHmTRk7fazzXeL4LKLk2+rEsRZGbK8zFPKiEdnJfQzf1dRmTd8ojLbj36LBB5HR6qo7v2u2wg==
X-Received: by 2002:a05:6000:2dc2:b0:3a4:f50b:ca2 with SMTP id ffacd0b85a97d-3b5f187591bmr12370259f8f.8.1752567324943;
        Tue, 15 Jul 2025 01:15:24 -0700 (PDT)
Message-ID: <0e11fb74-444f-4288-99b4-9ccb29f1353b@suse.com>
Date: Tue, 15 Jul 2025 10:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] x86: Make MAX_ALTP2M configurable
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1752531797.git.w1benny@gmail.com>
 <85729f0c-e924-4e8d-9f57-faaeee9465bb@suse.com>
 <CAKBKdXi+WCbaOw9rrPmor1Y8_Y68STU9jdvNy+7eJjA3qcp6aA@mail.gmail.com>
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
In-Reply-To: <CAKBKdXi+WCbaOw9rrPmor1Y8_Y68STU9jdvNy+7eJjA3qcp6aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.07.2025 10:06, Petr Beneš wrote:
> On Tue, Jul 15, 2025 at 9:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.07.2025 00:48, Petr Beneš wrote:
>>> Petr Beneš (7):
>>>   xen: Refactor altp2m options into a structured format
>>>   tools/xl: Add altp2m_count parameter
>>>   docs/man: Add altp2m_count parameter to the xl.cfg manual
>>>   xen: Make the maximum number of altp2m views configurable for x86
>>>   tools/libxl: Activate the altp2m_count feature
>>>   xen/x86: Disallow creating domains with altp2m enabled and altp2m.nr
>>>     == 0
>>>   tools/ocaml: Add altp2m_count parameter
>>
>> Please can you post new versions as applicable to present staging? The first
>> three of these patches were committed a week ago.
> 
> Not sure I understand. They were reverted. What does it mean to "post
> new versions"? I've rebased my branch to current staging before
> submitting this patch series.

Hmm, sorry, two of them were indeed reverted. I simply didn't remember, and
checked only for patches authored by you. Patch 1 wasn't reverted, though?

And then, as to patch 2 (which was the problematic one): Why did you retain
Anthony's R-b? In the v7 discussion I see no indication of him to keep the
tag with the change in place. Which (generally) is taken to mean the person
wants to take another look before possible re-offering the tag. With a bug
fixed, all R-b covering that area become invalid (unless explicitly
indicated otherwise).

Jan

