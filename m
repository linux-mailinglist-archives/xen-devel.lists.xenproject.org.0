Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78853A58DDF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 09:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906161.1313611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYL5-0006gn-2o; Mon, 10 Mar 2025 08:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906161.1313611; Mon, 10 Mar 2025 08:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYL4-0006e6-Vt; Mon, 10 Mar 2025 08:18:18 +0000
Received: by outflank-mailman (input) for mailman id 906161;
 Mon, 10 Mar 2025 08:18:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trYL3-0006T0-JU
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 08:18:17 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37c68a50-fd88-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 09:18:16 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso350935e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 01:18:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ceb78e18dsm67836545e9.34.2025.03.10.01.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 01:18:15 -0700 (PDT)
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
X-Inumbo-ID: 37c68a50-fd88-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741594696; x=1742199496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=baGOcXj9eWIBk+LWddRrRITqMC/cRu6SYDbce1iUhrk=;
        b=SfxqN+6hOnrQjXiZE/KOsz6320uT/mf7QAl929v09Sza4UARBlpbAbrum12lh4j8k5
         ir5XsEAjKiBB+pGRG9micsoHwa2TZmTwY5nPxa76jSyAHQ7jDKTpj3Gr62kbAJ/WOglM
         wZcblntBD1AlTSjKMKRNoNG87j/rCy1TV/rbJ1+RrzRgIXN3IUpAM63goqaCKiQMW7ZA
         QA6IXxOIA+YXSUogULh+OfFwmUi+RcZbs6lyObTLogEOAI5asfBpThrDMCxp2m2JM56O
         UP9YDvOehsiNeDfTThWG8RnMK8n7EZCmeHI3fZMq/qWBT5k0d7jRf5I9GNa0DrElf4gd
         2/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741594696; x=1742199496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baGOcXj9eWIBk+LWddRrRITqMC/cRu6SYDbce1iUhrk=;
        b=lBFSapcE+3IgrEWRwIj1Gip2+EQCfFlzF3r1UDhDW2V1FRJWXz/pUMvJdsvVUB+1wd
         nYTd6BzXPli6cBejXUpzLkcVXJ3lcVtig0IzPnjrLz0PQCWpsNCZTjdTNTK63KOnu/sE
         oEi4GNkYfYMTYaN39KSmzqAuE3PW77Y5eoaQ4OXUkBy5aVpQb5dOMtJsi2u6IjdhuzW5
         0f+RJTzwbT1Zl5pHH3TVLEfaPbnMUTTOpIUXG7OtoGLZS8Lh31/GPjDtc1vdKogSBqfv
         06o++ohyTmQAY6AJfA90i61SfrfVAai1fFAWT7Cc5EE80AV9oE47ngCh8yUrDJKOocOt
         hf9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPrmpsDt/Kc3bCd2XX+NZ5xOqrVK3qyinEkXHfkFwdauaydYLTBu+pstjMwG4NmAtiumUp3+48v9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJIHe8PZhAv2DS/jrRLy2kyiOx3vDQpkFNCiNUa49qjGaA6Id6
	Rri3IG+SIJbr+zHRkyfrQZyNTbljrEILf8GNuKqSUFS+6+xvj78EPO4SvoijNg==
X-Gm-Gg: ASbGncu8wWg7PubFxs0Ug9SyhgmT6pMrKrycM9A2/QuF2zURUIZRQkzqq+Yxty9Duhd
	wOltZZA6vSWtKPG58QTy38pg4dzegqMnSSmUkJenJs74seglZK3y6A6ztV6o4323ehww3I3Qp4W
	Jw7BdY8YdpN/IF7avHOxPQw+qSD4q22XkxiImGId9Ip1kxWCWU4ZFF2i6Pk7xvgD4juDTG8YcFF
	JXdw1xbvJQj/h5xBuEfGyTxdbJUgtHIxZVeLYbVQ0//iCgi+WZ6IbxAlF8CJnOdtzX6gki2TS49
	qk6QqHRQ/hYfRxvVR7FIRa72She1fQGS/NDbmghrn2XOzz9Lzg9uKZGrBIubHjZx/Yw18o3xNZL
	2hiCPkWSsYVqnDobvbTraLr15eTYoJg==
X-Google-Smtp-Source: AGHT+IH+P/Yphs+vDrJE3qIfHHNpFa2QsBdFkq38Nz39n8LsEjEDoHTzjaG8nvOKa7SCUhME4FLBaQ==
X-Received: by 2002:a05:600c:4448:b0:439:a155:549d with SMTP id 5b1f17b1804b1-43c5a5ffffdmr73447525e9.12.1741594696109;
        Mon, 10 Mar 2025 01:18:16 -0700 (PDT)
Message-ID: <05057b1c-cca1-4495-b037-47a896ab9f6f@suse.com>
Date: Mon, 10 Mar 2025 09:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Update minimum toolchain requirements
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250307175435.3089686-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.03.2025 18:54, Andrew Cooper wrote:
> GCC 4.1.2 is from 2007, and Binutils 2.16 is a similar vintage.  Clang 3.5 is
> from 2014.  Supporting toolchains this old is a massive development and
> testing burden.
> 
> Set a minimum baseline of GCC 5.1 across the board, along with Binutils 2.25
> which is the same age.  These were chosen *3 years ago* as Linux's minimum
> requirements because even back then, they were ubiquitous in distros.

I'm certainly fine with this bump, but my main earlier request remains: I'd
like it to be clear up front what the criteria are going to be for future
bumps. Imo what Linux does is at best a data point; we don't need to follow
what they do.

>  Choose
> Clang/LLVM 11 as a baseline for similar reasons; the Linux commit making this
> change two years ago cites a laudry list of code generation bugs.

I'm less happy about this one. It'll mean I now also need to arrange for
building Clang on my own, which so far I was quite happy to be able to avoid.

Tangentially, as also mentioned during earlier discussions, it would also be
nice to have an understanding what other basic platform components (e.g.
coreutils) are required to fulfill certain minimal requirements. While
putting in place a custom toolchain is (to me at least) relatively easy,
doing the same for other base platform software isn't. For some of the very
old systems I try to keep testing Xen on, extra requirements there may mean
that building Xen there isn't going to be possible anymore. Which in turn
may mean running the toolstack (built on a newer distro) there may also not
be possible anymore. Which would, perhaps severely, limit the usefulness of
such testing attempts.

Jan

