Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1B8ACEE42
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 13:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006629.1385850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8Mv-0007Vg-Hv; Thu, 05 Jun 2025 11:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006629.1385850; Thu, 05 Jun 2025 11:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN8Mv-0007T8-F6; Thu, 05 Jun 2025 11:02:45 +0000
Received: by outflank-mailman (input) for mailman id 1006629;
 Thu, 05 Jun 2025 11:02:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN8Mt-0007T2-QB
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 11:02:43 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99b85cbc-41fc-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 13:02:41 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-450cfb79177so4295775e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 04:02:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506cf53cfsm117677315ad.181.2025.06.05.04.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 04:02:39 -0700 (PDT)
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
X-Inumbo-ID: 99b85cbc-41fc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749121361; x=1749726161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KM0hNDDwYcpOQ+LgXpTyZQeGCMkGJkrCSAa5u4E8qfU=;
        b=bdgexLA49WOz/1C7aCu/FSFR0HD7jyYz/pfFHVHb41k8Y4o4hrnJ5t7kZXMluX3Jaw
         u+iI63vmwhNoesjQTMqt9vZzTMGXvs9GKxaFDq9UdTeouZu9erNN6E/DvMglkWCZkvsZ
         vThGLkwjHA8oetk+t6+zopIXuxG1M5by+cPvwpBMpV9V6k+WSMcFocTU07/wVFBHAVxI
         vo0izKm1aK9oy28CXBZBrvdLe/0LL33ntUU+YV65bjnkMV38LtXk6qGzkQZl4/yfH4MC
         EQXzXSVJMfAndpFww7a/iN/0OmH5OUJkiLwRlxsCX6a6sBMOzl6lQfzYS/MgyuiYGOsX
         SsaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749121361; x=1749726161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KM0hNDDwYcpOQ+LgXpTyZQeGCMkGJkrCSAa5u4E8qfU=;
        b=HTXPzZj3H9S9kyHyfo52RbSWxMTUlqCQFvtJA2K16dOTZ3t91SMZS8sCsctCw09JwQ
         pa7GeEH7Z7fpmr07iuS1Pz581nI//ZRDhhAFjQ7rfdjRs28lFiRbF1lv6VY92CEjAfM4
         SYGKEL3WxBWJ8RTnLnU5V3VFMn/KSSDRthoQQtziXTbK3btHIC0FGHklSf31lq9KOfwg
         G2sNoCnksGs7MrrGUfCWzCzhdz9DiIWKuppaWK82RMn2KQ4n63vHXT8cJDvZII6tmajG
         uND6oUQYJoqhz3cpDC4B0/jP/fBTa6aMV3oH5pEo1pbbHhojV4pnqv/9xMr9vYtg9vDQ
         /fdg==
X-Forwarded-Encrypted: i=1; AJvYcCWNAYS47EtaZZ3jBCZqtBtx/lhAG9+5nPjJ25dNpKpAnZ1d0l1RH5C0Qzl9Yn8X/M/jPFSgDNKILhQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzpU+eOioXPs30b9RkhhNoiy8Q1DnqPFF2U8TC2Mf63EpHlpp7
	0supTc5B3DBM8q6vbGcVXy1inqkQHkOgdyWSGBY4kAzKcWQc/+7ECU+gXIZrrZWJbw==
X-Gm-Gg: ASbGncvmKULA4u+X0hbeKu6dPog1Of/50CK3NAxcTht1sbp9KbWFCQQkwuDzzJ3Yjpf
	lGKre8ceNUavxt4hKwXwV7JfAcbLwakr5WP0B1382h4XFS2nEGosEcYZiPHbah5IgQgTy5dYOKC
	4NkueM2nwk2IfJgOj883ij8A+nz0K1N6U0CzP9BYzDUSIxz9cL2ohW9o3q2UO1SEzSdCxgecTSY
	6sxeJJTJkIlu96DgJQbt/r0fpi6RHfxL74/ipqOd7xQYJ55lNGJTBvtxwbZtmcE9B1/cXXCcE9s
	EDdYUne9jkc2NSpH290TjIRntrd7JejgxSwhnPHBNRcT2f6WC0Nsxgsml63XK11KF3/nXVg9txu
	uBibGtx0dvuLu5ETL5jdmb1KFZ700hgIHoIPW2EmB9hw1OF0=
X-Google-Smtp-Source: AGHT+IHrNL6knImrc8DQjJW43EBtjWy1BTQpYfttegHb8Fq5fcEUM3auMMVuuCPZ+Q0S9prXpN14xQ==
X-Received: by 2002:a05:6000:2204:b0:3a4:d3ff:cef2 with SMTP id ffacd0b85a97d-3a51d961912mr5487660f8f.27.1749121360338;
        Thu, 05 Jun 2025 04:02:40 -0700 (PDT)
Message-ID: <7cf79ee4-5176-4a4f-97bd-c7594e1c8c9b@suse.com>
Date: Thu, 5 Jun 2025 13:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] livepatch: Embed public key in Xen
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
 <20250602133639.2871212-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250602133639.2871212-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.06.2025 15:36, Ross Lagerwall wrote:
> From: Kevin Lampis <kevin.lampis@cloud.com>
> 
> Make it possible to embed a public key in Xen to be used when verifying
> live patch payloads. Inclusion of the public key is optional.
> 
> To avoid needing to include a DER / X.509 parser in the hypervisor, the
> public key is unpacked at build time and included in a form that is
> convenient for the hypervisor to consume. This is different approach
> from that used by Linux which embeds the entire X.509 certificate and
> builds in a parser for it.
> 
> A suitable key can be created using openssl:
> 
> openssl req -x509 -newkey rsa:2048 -keyout priv.pem -out pub.pem \
>     -sha256 -days 3650 -nodes \
>     -subj "/C=XX/ST=StateName/L=CityName/O=CompanyName/OU=CompanySectionName/CN=CommonNameOrHostname"
> openssl x509 -inform PEM -in pub.pem -outform PEM -pubkey -nocert -out verify_key.pem
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
> 
> In v3:
> 
> * Drop unnecessary condition in Makefile
> * Use dashes instead of underscores
> * Drop section placement annotation on declaration
> * Clarify endianness of embedded key
> 
>  xen/common/Kconfig          | 18 +++++++++++++++++
>  xen/crypto/Makefile         | 11 ++++++++++
>  xen/include/xen/livepatch.h |  5 +++++
>  xen/tools/extract-key.py    | 40 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 74 insertions(+)
>  create mode 100755 xen/tools/extract-key.py
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 0951d4c2f286..74673078202a 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -472,6 +472,24 @@ config LIVEPATCH
>  
>  	  If unsure, say Y.
>  
> +config PAYLOAD_VERIFY
> +	bool "Verify signed LivePatch payloads"
> +	depends on LIVEPATCH
> +	select CRYPTO
> +	help
> +	  Verify signed LivePatch payloads using an RSA public key built
> +	  into the Xen hypervisor. Selecting this option requires a
> +	  public key in PEM format to be available for embedding during
> +	  the build.
> +
> +config PAYLOAD_VERIFY_KEY

This identifier to me mean "verify the key of payloads", when really ...

> +	string "File name of public key used to verify payloads"

... you mean the key used for verification. To express this in the name,
how about PAYLOAD_VERIFICATION_KEY?

> +	default "verify_key.pem"

The revlog says you replaced underscores by dashes.

> +	depends on PAYLOAD_VERIFY
> +	help
> +	  The file name of an RSA public key in PEM format to be used for
> +	  verifying signed LivePatch payloads.

Perhaps the fact that it needs to be an RSA key may also want expressing
in the Kconfig identifier?

Should the help text perhaps further clarify where the file is going to be
looked for in case it's a relative path (as in particular the default is)?
Seeing that ...

> --- a/xen/crypto/Makefile
> +++ b/xen/crypto/Makefile
> @@ -1,2 +1,13 @@
>  obj-y += rijndael.o
>  obj-y += vmac.o
> +
> +obj-$(CONFIG_PAYLOAD_VERIFY) += builtin-payload-key.o
> +
> +key-path := $(objtree)/$(patsubst "%",%,$(CONFIG_PAYLOAD_VERIFY_KEY))

... it's in the object tree now (which will break if an absolute path was
specified), how do you intend the key to make it there? In the default
case, for an out-of-tree build the build tree doesn't exist ahead of the
build being invoked.

> +$(obj)/builtin-payload-key.bin: $(key-path) $(srctree)/tools/extract-key.py
> +	$(srctree)/tools/extract-key.py < $< > $@.new
> +	$(call move-if-changed,$@.new,$@)
> +
> +$(obj)/builtin-payload-key.S: BINFILE_FLAGS := -i
> +$(obj)/builtin-payload-key.S: $(srctree)/tools/binfile $(obj)/builtin-payload-key.bin FORCE
> +	$(call if_changed,binfile,$(obj)/builtin-payload-key.bin xen_livepatch_key_data)

Does the builtin- prefix have any real significance here? Anything that's
part of the hypervisor build is "built in", after all.

> --- a/xen/include/xen/livepatch.h
> +++ b/xen/include/xen/livepatch.h
> @@ -143,6 +143,11 @@ struct payload;
>  int revert_payload(struct payload *data);
>  void revert_payload_tail(struct payload *data);
>  
> +#ifdef CONFIG_PAYLOAD_VERIFY
> +/* The public key data contained with Xen used to verify payload signatures. */
> +extern const uint8_t xen_livepatch_key_data[];
> +#endif

What's our position towards such declarations without (C) definition? The
8.6 deviation talks about cases "when the definition is compiled-out or
optimized-out by the compiler". Shouldn't we follow the 8.4 model here and
annotate them asmlinkage as well?

Jan

