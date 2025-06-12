Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FABAD6D09
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 12:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012744.1391246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPep8-0003qg-Bb; Thu, 12 Jun 2025 10:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012744.1391246; Thu, 12 Jun 2025 10:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPep8-0003oY-90; Thu, 12 Jun 2025 10:06:18 +0000
Received: by outflank-mailman (input) for mailman id 1012744;
 Thu, 12 Jun 2025 10:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRIX=Y3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPep6-0003oS-VP
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 10:06:16 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da8d255c-4774-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 12:06:05 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so7748955e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 03:06:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1c5fd7esm1050475a91.37.2025.06.12.03.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jun 2025 03:06:12 -0700 (PDT)
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
X-Inumbo-ID: da8d255c-4774-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749722774; x=1750327574; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4DyTLW2TAd5MFMWJ1jXtSh6zGkLFxgctzrhtPNP6aOw=;
        b=TSiEFrN/wXm0OaMp3qPrDyuLl6R2KUJI59kZOr4WBpvKNEV7PPopNHw4a9QPmb+X7d
         rA69JBJvPzidNv+kjHzI5ytRZoxAbYajoJ0IU05Xj/wdKYWS9PT2F+8yvzhg8tLpZmgP
         2C4hf7pmGt0/QbIas+YLU6hYtCFN5ZZX+MNVERxeI+Yczqnk63YWfdvBgtrIWzJjgXEm
         ADKV2EDqOAm037d4Zcoc0JRTcCVM+x21mCOGQ27nPp+ZmwDfg+ovQf2npEOxuD6KkGta
         RmEvlH5SBBXX05i51tcQVXVUNLxRVTBLSdH+qxsZI7RROLLeTj6Nhclml9DjX9Uom30h
         1fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749722774; x=1750327574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DyTLW2TAd5MFMWJ1jXtSh6zGkLFxgctzrhtPNP6aOw=;
        b=r/SMApwZLCJdcZVwq5f5SvfRKUq3FOTPAp49wc38xhBOfuP5S6vHueVa+lXKR5Ph5P
         yhFdUte+/i6bhu6MUAPwjQzClqQM9KdNcjdj7ESGl1QhFbNNVmiNxhLV3uExRms8xT5c
         zjqBS4Ef+cEX+iT99d0MDZKBOnA/mCjIokyoNrrODbRHu1n3RWQlzRos/6d7ToTLCRRw
         g7wp1lmroERVOk2WL+Gy7vPHrm6QMkMr4RzeBdPjwhKbFShANC9gMWsqxmoIuU2ZgSBe
         jbnu+H/XcgIrmFC3GQ52pk6UpE8b2sM2uOsEPZae2X1C5aOSpZA7mgKH/pblgnNpxCxT
         du9g==
X-Forwarded-Encrypted: i=1; AJvYcCWSdWVd5I36iwdiHdxW9mr/8DbAVZyET2jzn+H18YCQiZdlsOlCN9pDxl7sOuYzH8vfBlJuz4VtnKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRJpr3zAp9Js7fZvF+zPXb/oPVq1+7ryTspGM7l+y9y0pLX2N5
	dLkJs8XUg2qPhV7j3/9Ak0uEPM92vg7OQCij/L60TJFifQe9bsqSA72Eklulsbmuqw==
X-Gm-Gg: ASbGncsKOm+omqndIPceE7hkkW1t78y5QNmV65jM/d8MPPtDE+yjDmYAg6hWCOaix9R
	+Ata394catABO+3grcbb3FImpnC/99vQgXpgdG7fBdvogSr8kO9KRy8DAPMx5RYj/4bIQv14Lgx
	s9Kv95/jR+wUL+SChIdn0YmkUG831Tu5UL5KHTe8v6TozHQtTmEZsmDDWJ62StHqCLzhwdegvLV
	BYSI6czbixifkhFnyGKF8QKshkaXiqgArKRIGiXro9pur0KlbV+vvjiocq71qxYOvW42WInaSLl
	1D32IcD8r4M+lDM6kE0WqPgrcmWoB91XZB+C8QoP4gHUfkoyAJN1Uc2GzUgX0BlM7vU67q3HQl4
	HqFkkB/hSFaJrXLNFx7GW1Kjve9OV1nxTExUe58atM13H27g=
X-Google-Smtp-Source: AGHT+IGpodWvKnVXUDs0/XXkjLihdGLd8F2E7N+fA6LekM59CPgXhB/fEvPtQllGPCpWM7YcwsvlRg==
X-Received: by 2002:a05:6000:2313:b0:3a4:ee51:8144 with SMTP id ffacd0b85a97d-3a5586f21d8mr5934651f8f.13.1749722773690;
        Thu, 12 Jun 2025 03:06:13 -0700 (PDT)
Message-ID: <5aad2d39-31e1-44c6-b167-a3275dc6b747@suse.com>
Date: Thu, 12 Jun 2025 12:06:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Trammell Hudson <hudson@trmm.net>,
 Ross Lagerwall <ross.lagerwall@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 Kevin Lampis <kevin.lampis@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250611235851.167385-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2025 01:58, Andrew Cooper wrote:
> Obviously RFC at this point.  It's worth saying that XenServer is intending to
> use Shim and get a signature from Microsoft, retaining all exiting features
> such as Livepatching and Kexec crash reporting.
> 
> This trails off into more TODOs towards the end.  Individual tasks should
> expand on the start made and resulting conversation from this thread.  As a
> reminder, the target audience for this doc is an administrator running a Xen
> deployment, but who is not necesserily a developer.
> 
> Several things are hard to express and want further discussion.  Suggestions
> welcome:
> 
> 1) Content of CONFIG_CMDLINE and the various CONFIG_*_DEFAULT options.  Xen is
> not going to be issuing XSAs for "downstream chose an unsafe configuration,
> then signed and deployed the result", yet Xen probably should be on the hook
> for bad "default ..." settings in Kconfig.

Imo it simply needs stating largely like this. As indicated by Marek, some
annotations are going to be needed to help people realize what is or is not
safe to use. If we wrongly marked a command line option (or Kconfig setting,
if applicable there) as safe to use, I think we'd be on the hook to issue an
XSN or XSA.

> 2) Pre-boot DMA Protection.  Microsoft consider this a platform feature
> requiring OEM enablement, and do not consider its absence to be a Secure Boot
> vulnerability.  But, it is less clear what the policy ought to be for Xen
> booting on a capable system and failing to do a correct live-handover of the
> IOMMU across ExitBootServices().

Shouldn't this be another TODO item at the bottom? We don't support yet taking
over when the IOMMUs are already enabled, do we?

> 3) The AMD microcode signature vulnerability.  While it's not Xen's bug per
> say, it's clearly a Secure Boot bypass because we do offer microcode loading
> capabilties to userspace, and malicious userspace can load an unauthorised
> microcode which allows them to read/write physical memory and bypass further
> signature checks.

While in general I continue to think that people ought to be paying attention
to advisories from HW vendors, we can certainly continue to issue at least
XSNs in such events.

> 4) Userspace Hypercalls.  To anyone who isn't already aware, /dev/xen/privcmd
> in the various Unicies is a giant priv-esc hole, as root userspace can
> e.g. issue direct memory hypercalls behind the back of an (intentionally)
> oblivious kernel, and cannot be handwaved away as "it's fine because it's
> root" under Secure Boot.  It's not a Xen vuln (Xen *does* audit pointers in
> guest hypercalls), but it is a guest kernel vuln because of failing to
> correctly audit hypercall parameters.  However, it does require substantial
> changes in Xen in order to allow guest kernels to do something half-way safe.

I'm having trouble seeing what's "hard to express" here. Auditing needs to be
added in kernels wanting to act as hwdom or ctldom. Flaws there would
require advisories (and revocation) by respective parties; for Linux that
would still be the Xen Security Team.

IOW imo this wording could just move down to the respective sub-item of the
TODO section.

> +Principles
> +^^^^^^^^^^
> +
> + * Privileged code shall include Xen and the kernel(s) of the control and
> +   hardware domain (both, if they're split).  While there is a privilege split
> +   here in Xen's regular security model, they are equal from Secure Boot's
> +   point of view.

In this context, may I direct your attention to Jason's plans for Xenstore
domain? It, in the SILO model, being permitted interaction with the other
two special types might end up being a problem here.

See https://lists.xen.org/archives/html/xen-devel/2025-06/msg00703.html.

> +In Progress
> +-----------
> +
> +.. warning::
> +
> +   The following work is still in progress.  It is provisional, and not
> +   security supported yet.

Isn't this an overstatement? None of the below had even parts thereof go
in so far.

> +Secure Boot Advanced Targeting
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +SBAT is a recovation scheme for Secure Boot enabled components, using a
> +generation based scheme.  See `Shim SBAT.md
> +<https://github.com/rhboot/shim/blob/main/SBAT.md>`_ for full details.
> +
> +Upstream Xen provides the infrastructure to embed SBAT metadata in
> +``xen.efi``, but does not maintain a generation number itself.  Downstreams
> +are expected to maintain their own generation numbers.
> +
> +
> +Lockdown Mode
> +^^^^^^^^^^^^^
> +
> +A mode which causes the enforcement of the properties necessary to conform to
> +the Secure Boot specification.  Lockdown Mode is forced active when Secure
> +Boot is active in the platform, but may be activated independently too for
> +development purposes with the ``lockdown`` command line option.
> +
> +TODO
> +^^^^
> +
> + * Command Line
> + * Livepatching
> + * Kexec
> + * Userspace hypercalls

What about Dom0 being able to access almost(?) all memory, including all MMIO?
In this context, isn't iommu=dom0-strict a requirement for SB (while that's
still not the default mode of operation for PV Dom0, despite me keeping to
suggest that we ought to change that default)?

As a general remark (no good place to put it): In the eventual final patch I
expect a reference to this new doc is going to be inserted in the respective
section in SUPPORT.md.

Jan

