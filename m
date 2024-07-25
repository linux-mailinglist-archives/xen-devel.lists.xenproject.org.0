Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FF993BCA1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 08:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764676.1175171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWs84-0000jH-LC; Thu, 25 Jul 2024 06:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764676.1175171; Thu, 25 Jul 2024 06:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWs84-0000gn-IF; Thu, 25 Jul 2024 06:39:08 +0000
Received: by outflank-mailman (input) for mailman id 764676;
 Thu, 25 Jul 2024 06:39:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1nn=OZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWs83-0000ge-2t
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 06:39:07 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9670dbfa-4a50-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 08:39:05 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a94478a4eso36052066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 23:39:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acac60369sm37746466b.90.2024.07.24.23.39.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 23:39:04 -0700 (PDT)
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
X-Inumbo-ID: 9670dbfa-4a50-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721889545; x=1722494345; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=427Rs21Ah7mgrEF0QTzXMrltScXbNCl/tT6CWILqlpc=;
        b=I76jYFunxM1Zhq+Q5EnLRAvNc+pzED/WfzxFST3DlAcrhTeRKaPyO9buGjiiMFoakF
         oHsU2AoXO0mrz4eK5U0nQjoy8UyMQ+UU7u+WY3/ZqnW8fYeC6cEtHZitjLWVmHO/KZgG
         1NY2vJ1/M4+Ih6N9fwIJzrDAl6eQTvDablPmO4dPfuNEAlW6GPYwmSpyDyoFP6qiCbp/
         eEA1scQP+c2WvxEPkXhpzR779KZKqQHDJ7df5VNWXRinVAHYRTEa6Xc6TgKc1xVX4mcy
         +ZjxXHITT1KnnzDSx8rPRrnkYxDj52Mr/eWvvGMTE8qCD6CXBjMSCrRuMDDsmYMBBvyN
         OX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721889545; x=1722494345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=427Rs21Ah7mgrEF0QTzXMrltScXbNCl/tT6CWILqlpc=;
        b=Y2vFJdpUJUhwYoT6MxGSPbKUslOFxWusfDoyTfsKgyXaxONoHn/y3H5Ahru+o0utQc
         o7WNUde7y3P/n0yocwcc6T0Cc0hyURaPCIM/S0ODw3twi/F+DwLG1gTNL/AuwmOAlMfw
         lVlboZoHraqy5q07NgDjEeEuX2IXlfszl2ZmYhIpRDLNr+5ZSrMoJC51eXGKHm5poWTx
         tFZE2kqGfuxoVmZ8TQAmjp/FcA3keksalY1FaONL27uMg0ZhRcZetS8Dr22zKT3/nYIF
         2hCqHRdfZn8+mahRKtkG7kBbYdtcyoMD6TI1F6gOaUz9GMsWfg58Jmc/GNjhut/8DlzO
         x8gg==
X-Forwarded-Encrypted: i=1; AJvYcCWSPrmrA3duxDmzb46VSsFjly5BqV2svy5/TCqwrbnMvBxra7ierFvcAYfMCZRrIERw0RhyqjnzUapoDWTGKYDPS6BXILU4utIuC+exx5Y=
X-Gm-Message-State: AOJu0YzJl+3xjbd2/0YLXXNUwyAA6Q7VRBq4P4VdN/jm2WAGp/+DyzUf
	dEHwAW99qZjvpu8rLILz3wkDU++JxTKTWd4k7LIBsmjh5GfD8WWhvKk+29Kkxw==
X-Google-Smtp-Source: AGHT+IGN7900JHAICfY88OgVm3rbAcYtjCyXEqOnk4rVtODjtNZeBLSpkG3JX3gE2+/z0QJHDL/GdQ==
X-Received: by 2002:a17:907:9718:b0:a6f:5609:954f with SMTP id a640c23a62f3a-a7ac44e1aaamr211791666b.12.1721889544851;
        Wed, 24 Jul 2024 23:39:04 -0700 (PDT)
Message-ID: <115612cd-92c8-4494-a4c4-c996543d43b5@suse.com>
Date: Thu, 25 Jul 2024 08:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] automation: add linker symbol name script
To: victorm.lira@amd.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com,
 consulting@bugseng.com, simone.ballarin@bugseng.com,
 xen-devel@lists.xenproject.org
References: <5b2862d6d036248e8cdd76e9884f173c6b7ff325.1721842334.git.victorm.lira@amd.com>
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
In-Reply-To: <5b2862d6d036248e8cdd76e9884f173c6b7ff325.1721842334.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 19:52, victorm.lira@amd.com wrote:
> From: Victor Lira <victorm.lira@amd.com>
> 
> Signed-off-by: Victor Lira <victorm.lira@amd.com>
> Requested-by: Stefano Stabellini <sstabellini@kernel.org>

Note: Tags in chronological order, please. Stefano isn't likely to have requested
that after you signed off on the change. As an aside, aiui Stefano requested this
in response to me having requested it on the call earlier this week.

> --- /dev/null
> +++ b/automation/eclair_analysis/linker-symbols.sh
> @@ -0,0 +1,34 @@
> +# Stop immediately if any executed command has exit status different from 0.
> +set -e
> +
> +# Extract linker symbol names (except those starting with ".") from assignments.
> +
> +script_name=$(basename "$0")
> +script_dir="$(
> +  cd "$(dirname "$0")"
> +  echo "${PWD}"
> +)"
> +src_dir="${script_dir}/../.."
> +
> +usage() {
> +  echo "Usage: ${script_name} <arm|x86>"
> +}
> +
> +if [ $# -ne 1 ]; then
> +  usage
> +  exit 1
> +fi
> +
> +if [ "$1" != "arm" ] && [ "$1" != "x86" ]; then
> +    usage
> +    exit 1
> +fi

This isn't really needed when you ...

> +filepath="${src_dir}/xen/arch/${1}/xen.lds"
> +
> +if [ ! -f "$filepath" ]; then
> +    echo "Must be run after build."
> +    exit 2
> +fi

... check existence first here. Perhaps worth mentioning $1 in the error
message, as having done just some build may not be sufficient.

Plus, for all error messages: The better want re-directing via >&2.

Jan

