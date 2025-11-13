Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB2BC56200
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 08:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160696.1488753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJS9v-0002iN-4p; Thu, 13 Nov 2025 07:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160696.1488753; Thu, 13 Nov 2025 07:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJS9v-0002gv-1X; Thu, 13 Nov 2025 07:54:23 +0000
Received: by outflank-mailman (input) for mailman id 1160696;
 Thu, 13 Nov 2025 07:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJS9t-0002gj-FD
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 07:54:21 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f580f623-c065-11f0-9d18-b5c5bf9af7f9;
 Thu, 13 Nov 2025 08:54:20 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6431b0a1948so878843a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 23:54:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd809d2sm108231866b.42.2025.11.12.23.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 23:54:18 -0800 (PST)
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
X-Inumbo-ID: f580f623-c065-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763020459; x=1763625259; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nh4jlbd2A4PXp9wNRBxx115wquv3uJxgOyL4oNtHSsw=;
        b=IvRnObvofDhosEXq5k+ny9eX7wfQacOwp5jIu5nEPWUajYD2mmoS4uDxT6OIZU+dw6
         9ZmPoLgpaQE20qDZzoDzSDTiHJLT12ivmV5ZlET0/Az49zeoBHtpDjAHc5Hvd7pCM9d2
         +00MGi5Ll3BtQgJdIEvWCyh367FfhjDRQ6zveiIjrUp8MkMDqlG/29nhkkUUtxQWlMTo
         brOSsi0RwCotYOaPM3BPum2B3nyZ7agvhKOeAHSqoXSIebeWwHN5ekic34wRDy12G8hc
         0aatEJUePvvuv+HN4YOe1xDm3o4B8+piZ6SmwBnI6Ct7S/ySc/OyD5qkIqMCO1LfMuVz
         Q+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763020459; x=1763625259;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh4jlbd2A4PXp9wNRBxx115wquv3uJxgOyL4oNtHSsw=;
        b=DlBokLESd2Emz2l5J2HeXivl/6vzDz+DornHT0x3kqqN4/o8tqOnLfyfQWphEZBoQv
         JM2Kmw/ypqrh2EMbyP9eTE+yrmHyOVEGslEo7d4nUA4ZBYfg/L4tEbXXgVg+q/JjZt1G
         4m0pBO2ulnpkq+eo+9CSEVezwBFj6vfmcoHCjCDH08fzGvbCescFRJ6xMCAp7NUTE+sf
         F2PnxZlvjHEds2fSrjW3y12hy2dGAZJa+J/1p6sc8FxDuOszTYf5VaURG3U9WPXaQdTo
         R1SavK0u36i3YKv02Bgng/oGE66AEX4l3QsH0hH9dNJpf2/PT8deYSUVfjHURwXqT/US
         RxPw==
X-Forwarded-Encrypted: i=1; AJvYcCX81b+th+8ufpvPkmXcDZmq6eAO8LuYIRa1NilX2o26WHnHMLw9ju+XOhnrxlyY9h/jDznO8rHCGis=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvMuP2BNvn2vkcLC+3kNPJjU615OYAPbfnOHqV4C19yuhT4Epb
	F+OZ6i16hXIXzwVyajYkfIYxhI73A+frot8cSjEMcb5CCoIDER7WwhhraI/eGdYMxg==
X-Gm-Gg: ASbGncvlU/+5JYaAF8jCBNvzCI52WiugLN7Tw656TfOJhuaveUu2crUlsT5W7r2iI19
	AGs7raZz6klZziI+rpqiYGAI7p6kA0SLZI069d3JnUj9PNLOn1Rd3TzBdnG/3MVzQ3J9NeGwM28
	XPtR9di3RpA+ziidTU/s5KmmVQ3G/hNFmz6cltzHAOws83yxG+ceNy0G+ALZnA5BTKPCYpdO9x2
	pn7tsgVTuKmv7SmyMoWPphQEKw1zHp5fWvvmRDyYvgxjPgd8D+kricMj2MxqwaRSSlNII+TpwAg
	HLsgxG9/sZk1BN6Vx06aU8OBp6FmKk/QY7+kmZycl/UCBau7Pg2pncGBsctL9nA4ulaCx7aGhiF
	Z4zBO33Xpb57riGN6UCO7FhB+VKCoGt3782kWw5rBpqYVFZroBF6Q1oc9lSaN5BYClnPaJf6b6Y
	3/qjPyJW3VAm358w/6n5TrjYMJSmnzLIvetY2eSmI2Jop1F0ol3jFrYueDcucphh1Hv77128n2g
	5PsPHdgGesGjg==
X-Google-Smtp-Source: AGHT+IFSwq15YQZ/wO4fG/rpyghnnBXdfdoiegmJ0I70VOwv2TmX9bxD72WhYOmk1yvjsixy2VUm5w==
X-Received: by 2002:a17:907:2d2c:b0:b70:b71a:a5ae with SMTP id a640c23a62f3a-b7331aa3be1mr641438866b.44.1763020458664;
        Wed, 12 Nov 2025 23:54:18 -0800 (PST)
Message-ID: <9a949edb-8eb8-4984-adf0-4ab8b82e64db@suse.com>
Date: Thu, 13 Nov 2025 08:54:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Rewrite the Tagging and Branching checklist
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251112185402.209485-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251112185402.209485-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 19:54, Andrew Cooper wrote:
> There's a lot of stale information in the current checklists.  Merge the
> documents and present the information in chronological order.  Provide real
> examples from the tree rather than trying to be too prescriptive.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Hardly anything is being said about stable releases - is this intentional?

A few comments below, but ultimately I think it will need to be Julien to
ack.

> --- /dev/null
> +++ b/docs/process/tagging-branching.rst
> @@ -0,0 +1,194 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +===============================
> +Tagging and Branching Checklist
> +===============================
> +
> +Before starting
> +===============
> +
> + * Review this checklist for changes during the development window.
> + * Access to the following necessary:
> +
> +   * The 'xen tree' signing key.
> +   * The xen and xendocs users on xenbits.xen.org
> +   * The downloads-cvs user on mail.xenproject.org
> +   * A checkout of the xen.org CVS repository
> +
> +::
> +
> +  cvs -d downloads-cvs@mail.xenproject.org:/home/downloads-cvs/cvs-repos checkout xen.org
> +
> +
> +For RC1
> +=======
> +
> + * Pin ``QEMU_UPSTREAM_REVISION`` to an exact SHA.  Commit.
> +
> + * Update ``XEN_EXTRAVERSION`` from ``-unstable`` to ``.0-rc1``.  For
> +   ``README`` and ``SUPPORT.md``, use the slightly more generic ``-rc`` so
> +   they doesn't need to change during subsequent RCs.  Commit.

Nit: don't

> + * Tag.  Produce tarballs.
> +
> +e.g. from Xen 4.21, ``ffd25d717a74^..d1478321eacb``::
> +
> +  * d1478321eacb - (tag: 4.21.0-rc1) Update Xen version to 4.21.0-rc1
> +  * ffd25d717a74 - Config.mk: Pin QEMU_UPSTREAM_REVISION
> +
> +
> +For subsequent RCs
> +==================
> +
> + * Update ``XEN_EXTRAVERSION`` to the next RC number.  Commit.  Tag.
> +
> +e.g. from Xen 4.21, ``eff32008be0d`` and ``9632ce6fe5b2``::
> +
> +  * 9632ce6fe5b2 - (tag: 4.21.0-rc3) Update Xen version to 4.21.0-rc3
> +  * eff32008be0d - (tag: 4.21.0-rc2) Update Xen version to 4.21.0-rc2
> +
> +
> +Branching
> +=========
> +
> +On xenbits:
> +
> + * Create new staging and stable branches in xen.git.
> +
> + * Add the new branches to patchbot.  In ``~xen/HG/patchbot`` copy the exsting
> +   master and staging reported heads, update the ``versions`` file, and commit
> +   the result.
> +
> + * Add the new stable branch to the docs cronjob.  In ``~xendocs/cronjobs``
> +   edit ``xenbits-docs-all.sh`` and commit the result.  e.g.:
> +
> +::
> +
> +  ssh xenbits.xen.org
> +
> +  cd ~xen/git/xen.git
> +  git branch staging-$v staging
> +  git branch stable-$v master
> +
> +  cd ~xen/HG/patchbot
> +  cp xen--master.patchbot-reported-heads xen--stable-$v.patchbot-reported-heads
> +  cp xen--staging.patchbot-reported-heads xen--staging-$v.patchbot-reported-heads
> +  $EDITOR versions
> +  git commit -am "Branch for $v"
> +
> +  cd ~xendocs/cronjobs
> +  $EDITOR xenbits-docs-all.sh
> +  git commit -am "Branch for $v"
> +
> +
> +On the new branch:
> +
> + * Switch to release builds by default.  Commit.
> +
> +On staging:
> +
> + * Update ``XEN_SUBVERSION`` to the next version.  Update
> +   ``XEN_EXTRAVERSION``, ``README`` and ``SUPPORT.md`` back to ``-unstable``.
> +   Commit.  Tag the start of the new development window.
> +
> + * Rerun ``./autogen.sh`` to refresh the configure scripts.  Commit.
> +
> + * Switch ``QEMU_UPSTREAM_REVISION`` back to ``master``.  Commit.
> +
> + * Create a new section in ``CHANGELOG.md``.  Commit.

Should this really be four separate commits?

> +e.g. from Xen 4.21, ``d510f9c1430c^..62d0a92057ca`` and ``d510f9c1430c^..b0255656d121``::
> +
> +  * 62d0a92057ca - CHANGELOG.md: Start a new 4.22 section
> +  * 7b88e463f999 - Config.mk: Switch QEMU back to master
> +  * d954e8c5c8de - Rerun ./autogen.sh for 4.22
> +  * 85768c28b705 - (tag: 4.22-dev) Update Xen to 4.22
> +  | * b0255656d121 - (staging-4.21) Switch to release builds by default
> +  |/
> +  * d510f9c1430c - doc/man: Align list of viridian default enlightenments with libxl
> +
> +
> +Releasing
> +=========
> +
> + * Finalise the release dates in ``CHANGELOG.md`` (backported from staging)
> +   and ``SUPPORT.md`` (only in the release branch).
> +
> + * Tag the release in relevant external repos, and update ``Config.mk`` to
> +   refer to the tag.
> +
> + * Update ``XEN_EXTRAVERSION`` to drop the ``-rc`` suffix, and update

Since further up it's now rc<N>, imo it would be better to also say it that way
here.

> +   ``README`` to match.  Commit.

The latest here QEMU_UPSTREAM_REVISION and MINIOS_UPSTREAM_REVISION also need
adjusting to reference version tags, aiui. Taking tag creation in the respective
leaf trees as prereq.

> + * Tag.  Produce tarballs.

Link to the respective section further down?

> +e.g. from Xen 4.20, ``5cd830509d38^..3ad5d648cda5``::
> +
> +  * 3ad5d648cda5 - (tag: RELEASE-4.20.0) Update to Xen 4.20
> +  * 89fd1ba88403 - Config.mk: Bump tags to final
> +  * 6bf05e086765 - SUPPORT.md: Define support lifetime
> +  * 5cd830509d38 - CHANGELOG.md: Set release date for 4.20
> +
> +
> +Tagging
> +=======

Likewise this section may want linking to from respective places above?

Jan

