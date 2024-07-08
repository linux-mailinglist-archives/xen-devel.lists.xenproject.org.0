Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F234092A02B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 12:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755277.1163593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQlbn-0001IS-6s; Mon, 08 Jul 2024 10:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755277.1163593; Mon, 08 Jul 2024 10:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQlbn-0001Fm-3L; Mon, 08 Jul 2024 10:28:35 +0000
Received: by outflank-mailman (input) for mailman id 755277;
 Mon, 08 Jul 2024 10:28:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=suqh=OI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sQlbl-0001Fg-PT
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 10:28:33 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2f3c326-3d14-11ef-bbfb-fd08da9f4363;
 Mon, 08 Jul 2024 12:28:32 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ebe40673e8so49193241fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 03:28:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b0f767d16sm6149148b3a.18.2024.07.08.03.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 03:28:31 -0700 (PDT)
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
X-Inumbo-ID: d2f3c326-3d14-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720434511; x=1721039311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GM8Kjv51LyNdCHE/SMM2H3/IBlbCugblQnGSKwa1WQ0=;
        b=FIA0gXIOVv6oFc+xQwftd3s2/h1KFhPN4DFdZ1r1f2A5VujnyKfn98oTmW6R8Iy1KG
         lbbCGIOfWB4+IMcrySA6UW9p7iHcBlqaRbJzEI+oCFnnaMC6MT7AQutQC5Vyqb2+PZJM
         BiXT3iGBw9rOMhdstN3EOI6sYzzL0n30yiyVc7ZuLxCZsxiYJADIVtIbLoeo2Ol6uyLB
         mbq2Nr76y8g6G88lp18hEqQeDwKBpwvQvR4t2YTXqFRrTk2ZSYPuv5KoTI9XrwpD9cgo
         V3oHW9FRv5UvYi0GKqfYlCKYVBWfKBopouYAXhWPCRjj0eG72b2na7HXYY5M63yRzjOa
         +6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720434511; x=1721039311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GM8Kjv51LyNdCHE/SMM2H3/IBlbCugblQnGSKwa1WQ0=;
        b=IKiocJF2q7JqILnD+Q4lXvFjiSjk79DPlsGjnhQchWcRKy+Mz1gjdr3iUgvt9Dh1DK
         jMu5j0D4Tb7FFshMnRLhbz0aj28zFsQBLVAh4vRmMqYhvcPeS29Cz9jXo/E3aTPSFJ2J
         jJtYSbZN1YyF8JB8Ug+WOGtNhB3qidCyLBNxW6RdT89NawkgZF75LeOksxIfkBt7O46h
         X7+Se7EFPTrzRIFzAy+7Vc5XdsyXnoDG+MBVFa9Fwu+YNOZSiPNyqQZzz5Ds5HSKA6ae
         tzdbJ+Pf5OAzMcn+iiNcp58yINclG9O7gmitOPiM048ic7nQZEuw13kIFYxm98yJ4pel
         kgng==
X-Forwarded-Encrypted: i=1; AJvYcCXJ7Y4lDI28BSZEvXopGjY513/jzdNT0Fx5f2WvKlW3F+RZDpEAUX5hI2TXxP1ROhQxoOdKqZKk8dGRopHnNENe3zH+sAs8Kfd6YPhN3dE=
X-Gm-Message-State: AOJu0YyscH/22w1hBqaHzsonJl43Ue+wu+sbIb8HCxppa4A9LU25ai1v
	SQXeSM1oVO0FyH0Cy2Lfb43kxrozHX29n9rPmBMI7a+J4A7wmRi4LImtGwhCQg==
X-Google-Smtp-Source: AGHT+IFhBB575zKwsVLrCjg9vWX4DXUU+Lgl8d7dDgc+ckpN3sUrZwsOwpB9WtSUi9GLkdCMXAXqgQ==
X-Received: by 2002:a2e:8889:0:b0:2ee:7590:7ce5 with SMTP id 38308e7fff4ca-2ee8ed66ea8mr69008281fa.3.1720434511522;
        Mon, 08 Jul 2024 03:28:31 -0700 (PDT)
Message-ID: <0a3b4e6b-3d7b-4fff-ab42-d3bab7410246@suse.com>
Date: Mon, 8 Jul 2024 12:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 6/6] build: Drop xorg-x11 as a build dependency
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
 <20240705152037.1920276-7-andrew.cooper3@citrix.com>
 <afec5c5c-8de8-4795-b470-ec78339f982e@suse.com>
 <431e9e51-6cbb-42ec-b6c5-f1f35d5d85bc@citrix.com>
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
In-Reply-To: <431e9e51-6cbb-42ec-b6c5-f1f35d5d85bc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.07.2024 12:21, Andrew Cooper wrote:
> On 08/07/2024 7:49 am, Jan Beulich wrote:
>> On 05.07.2024 17:20, Andrew Cooper wrote:
>>> The history on this one is complicated.  The note to README was added in
>>> commit 1f95747a4f16 ("Add openssl-dev and xorg-x11-dev to README") in 2007.
>>>
>>> At the time, there was a vendered version of Qemu in xen.git with a local
>>> modification using <X11/keysymdef.h> to access the monitor console over VNC.
>>>
>>> The final reference to keysymdef.h was dropped in commit 85896a7c4dc7 ("build:
>>> add autoconf to replace custom checks in tools/check") in 2012.  The next
>>> prior mention was in 2009 with commit a8ccb671c377 ("tools: fix x11 check")
>>> noting that x11 was not a direct dependcy of Xen; it was transitive through
>>> SDL for Qemu for source-based distros.
>>>
>>> These days its only the Debian based dockerfiles which install xorg-x11, and
>>> Qemu builds fine in these and others without x11.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> There may be one more past dependency, but I'm not sure since I don't know
>> the package split in the distros you touch files for. In unmodified_drivers/
>> (removed in 4.14) there was a use of the lndir utility coming (on SUSE
>> distros) in xorg-x11-util-devel. Then again unmodified_drivers/ may never
>> have been of any interest to gitlab-CI.
> 
> Huh.  I've not come across lndir before, but we've got an opencoded
> forms of it in several places.  (tools/include, and
> tools/firmware/xen-dir, maybe others.)
> 
> Still - as a build dependency, it should be the main xorg package, not
> the *-dev{el} package.  Whether a dev{el} package pulls in the main
> package is distro-dependent.

Just to mention it: It is the -devel package where this script lives (for
our distros at least), not the main one. I don't expect any -devel would
be pulled in by any main package?

> 4.15 is the oldest tree we test in Gitlab CI, and I don't believe we
> built unmodified_drivers/ in prior versions either.

Oh, sure, I didn't mean to indicate any change would be necessary, except ...

> Either way - I don't think this alters the outcome of the patch.  I can
> add a paragraph to the commit message noting that there might have been
> another unspecified dependency on xorg ?

... perhaps mention of this (yet later removed) dependency we had.

Jan

