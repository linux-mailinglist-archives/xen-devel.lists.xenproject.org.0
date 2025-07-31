Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A13B16ECC
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:39:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065247.1430644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPlR-0008Tr-RD; Thu, 31 Jul 2025 09:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065247.1430644; Thu, 31 Jul 2025 09:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPlR-0008Qq-OQ; Thu, 31 Jul 2025 09:39:53 +0000
Received: by outflank-mailman (input) for mailman id 1065247;
 Thu, 31 Jul 2025 09:39:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhPlQ-0008Qd-8p
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:39:52 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4dc2f4af-6df2-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:39:50 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so546434f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:39:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6b4sm1157060b3a.1.2025.07.31.02.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 02:39:48 -0700 (PDT)
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
X-Inumbo-ID: 4dc2f4af-6df2-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753954790; x=1754559590; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtgizajH1KIs6XtVH3qBEWwC7Iu0FAm991Uz5UkbD/8=;
        b=NfhNfFqcz+bZXrlPxSHyGn1D6kD24QlZfi63QnxffUZgPEhneKVdbk64HupzQqa0oj
         L0VoBgqJZU4lmiFB1Wi1+YFW8KOpjc2mXfN7/sBYZCIsM/5Jb5+0uprY2aOmAuzIplHd
         6il+9VnLUFB8q7uWAZHCKyyO1vgrU33pKZ3PfGMzJfSGRkGH44VNepg4iRlwE1Q3Cxm7
         H6VuKZSSJ9E+P09g/ol3R0j89gSKyF2jtymSvjQuUFSCOU/S3rznGAP8/AwREkNz9IZc
         s/6Llfix1h/NMR/5Dw9Bee2qjZhHFrW/rBYpJFRW0F/ZGMocGuEr1y6ux/Yt+CTeqpoJ
         S6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753954790; x=1754559590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtgizajH1KIs6XtVH3qBEWwC7Iu0FAm991Uz5UkbD/8=;
        b=Ll9hym4b6UmVqj/x1RjYpy3y7hhkBvnzBg2I68Z7KKitjFevWaVoNcqsY4vl5gw4Z0
         XE1CqAG04to2XfMtL2lc0oFgHIUYLhdMfRmQmWCN8+7CPEjjYn6JPzM6ENGy1KyM4T5E
         KjPxy5VFdc/lxdiRdopYF215g8f2m+Kb3o1CTJAX7q7VNZdU5tGtFVMTxL6RJoXhN97s
         xFZijbH9w5QIXYN5LMu7ciwbyQKqaiOi1Dx25YXAe8U9PWaYQjy/xwdGs120p61ylNDf
         qjwRU8pS++dpWLAZcndjV8W/6IFWqfWtLDmduD86kGfE9tdkW8AqsHt/arqt/GZ+1SOj
         7YTg==
X-Forwarded-Encrypted: i=1; AJvYcCW3u+LdIoX1Er3GFyOJ4tAo+gm3D9HjSUVShOtSr1BlpI8e6p3xjzuFsP3fIazJRwQmarEulQ5WetY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZfwVKnirIU14DMjHD/yx9lBXxc8KdzmdsgFFZzEd0ZQxowaZf
	OGkvN53keMdC0d581yHhb7XQFHKT1lQjgxT9sxo2K/KfnKiSdvTEZkRNSle4cGHdQQ==
X-Gm-Gg: ASbGnctqFST1bvxGUD9drRQbQR/LrnBMYPx8saAVsqBmcA+QH634kCI6dlrBWyrNNtK
	See2NWSEEsEghQQ4KMP5UezQMsQXLDiwthB0yWR4Vsjjcp34TI4jTkXjPAj9O3ir5Z0T8cx3phi
	qXaRg2kDM2VCNRmgi5ajCo9JPsDLQPEvFHYg0N8YsxBk2UE77mChzhxquHrrT7fNropvBQmZULE
	HVNe4cTHAOSxCj7ensxLZ+mXnnXhw9v170V9V9Vs74kwDtPnr413obC641S8nYvt9yk2jX5cPtF
	0zAup4aBHCg0FLlXKaoeifNZoaJ9x9AEd9nEwblDc6GyrhZA2ldR/gYPMHt7sz4vAe8o2eHE1zV
	4cYuNP9+GCFtUDo1rVM/qLCsLw4dKM7ECKXb+KanBi0Oz8jwlBlyC7eUrjXPn5UyNX+n10L8iTf
	yA/dSWiX0=
X-Google-Smtp-Source: AGHT+IGwg5wgvZVMx5jYuS8ca62O3CBnpo0fPPyJmZP/Y9RYH/TrUmlGo7G799Xt6hqNk6Qon7S2JQ==
X-Received: by 2002:a05:6000:25ca:b0:3b4:6577:eed5 with SMTP id ffacd0b85a97d-3b794fc1aa4mr4956227f8f.12.1753954789481;
        Thu, 31 Jul 2025 02:39:49 -0700 (PDT)
Message-ID: <4e426848-cc68-46b8-ae53-ee63ded4099c@suse.com>
Date: Thu, 31 Jul 2025 11:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/6] x86: Make MAX_ALTP2M configurable
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Juergen Gross
 <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, xen-devel@lists.xenproject.org
References: <cover.1753953832.git.w1benny@gmail.com>
 <379b70bc-2e1c-44fb-84ec-d7fd42fda147@suse.com>
 <CAKBKdXjWaKzMj1HtTvos8jcW9jPLn7tH61+hgpDgzMScGdmGdA@mail.gmail.com>
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
In-Reply-To: <CAKBKdXjWaKzMj1HtTvos8jcW9jPLn7tH61+hgpDgzMScGdmGdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2025 11:37, Petr Beneš wrote:
> On Thu, Jul 31, 2025 at 11:31 AM Jan Beulich <jbeulich@suse.com> wrote:
>> As it is still lacking ack-s, as I think I had indicated.
> 
> Sorry if it sounded like complaining - it absolutely wasn't meant that
> way. I was merely explaining why I did it, since I wasn't sure what's
> the "right protocol" - i.e. whether I should let the commit be
> unchanged and let you do it, or - considering I'm resubmitting anyway
> - whether I should make the change (despite me agreeing to let you do
> it).

When you re-submit anyway, you want to carry all changes asked for. Offers
to do on-commit adjustments are merely to (possibly) avoid another re-
submission.

Jan

