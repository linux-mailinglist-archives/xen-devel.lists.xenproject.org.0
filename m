Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKKsNCKLnWnBQQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:27:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D69186410
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239897.1541305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqZT-0005Pj-DY; Tue, 24 Feb 2026 11:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239897.1541305; Tue, 24 Feb 2026 11:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqZT-0005Nc-A7; Tue, 24 Feb 2026 11:27:19 +0000
Received: by outflank-mailman (input) for mailman id 1239897;
 Tue, 24 Feb 2026 11:27:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuqZR-0005NU-Dz
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 11:27:17 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4dd8af7-1173-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 12:27:14 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so67076545e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 03:27:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c09897sm26623556f8f.17.2026.02.24.03.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 03:27:14 -0800 (PST)
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
X-Inumbo-ID: c4dd8af7-1173-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771932434; x=1772537234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uQ79wN/4VrDRIlAkX0S+RTfyit9LxGon2DLJs20NY+4=;
        b=M6UYx4ubFMnv7pSVmh6KSHVvasKRElOp8sGuL7sW7JrLsIxqP90K4Fq3IecnqZmh4b
         rDjmDwYQTpv4YFaL2udAmoL7ozeeWlwutvw+/ph/oBX6iljvPH594CLnOn+qVbV1Elvq
         LA+CyjDdf4DAvk0Rg9vJG06j003W4OariLqVf+a830vjmlZtHTzm/6YuEakqNqzuHswW
         VnGndfgDVdxm3Xcp/tkfnq7RwamEgFZPGJ3Guxfiy5RUSVkJILbMZi+NWn0cdV9dyc+5
         C4NWjbA2GNE9FIjEPvXQXioda5CmCF9C+h76VDHG782nSQ+1wqtqGDFaR3PDumc2HgQ/
         YcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771932434; x=1772537234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQ79wN/4VrDRIlAkX0S+RTfyit9LxGon2DLJs20NY+4=;
        b=Rqtbziuc0RMCiewBYcw78Fp6QHMBg96iBss0QBLQ1Gg5JFbO2etkybPRFU2VaiD+ly
         YfeouZlhanriwtX+CSJjvu1tHdL86Vw+anUYvSoLwKvGgmI6ZPTP5MTr5jPBielLIwJP
         ZCqd9wPjmdimBLspDkCdH/XlrY1KKUtg960hC5+7SH69dYx0DsCREFfiXjCk94jF918I
         HjBEtK3yDJMpf/fJegZfjS60F9+g2H+C5L+Bs/8KJ4RiuhGKBfQiIIHd40OSg4H5LND0
         /vZyEvAbf91Qc3UorgtHfFssfcuGFGsOQyAxEay2zziMrOMQWVyF4CtmkrDppVsKKvVc
         b5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXyCBmhvoC/eTkQNUyzU9aRtWEZ0oNP4y/hTlQWOF9dCWt81TKAbiFhS5wbSIqsobPqHJ5W38qOQcQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNzsxomgzORNt2rbN87lAMzf4HrF9whAK8M2m7HbWshYrzmOH0
	MsM9dekc3NUCxfXTaDuP/NtZBE6RbiVP/IRZAyGvYyNO5GiVab+pxegodyCIrRahWg==
X-Gm-Gg: AZuq6aIGyFSFOesSHwQC64rwGMUdGv9cUF5tKHP0bXMkGKk4wlLx1KM1y8fNZG+6BeX
	u7p9fIORZe6qcxiiIEZP/qrahp5moDfwnjvy9osl+d8jlhZhLdxZHoSmJoGgUQL7rj839mApk+p
	j+pbQ5NA5juP+XXw2tBgwTOz1ecaJFh99oiYubM/x8uvHALpu1i2UVS+FTSzWCBzkqoMoPZ/mo0
	8HbVYucpLp/7PcRnlhIiOGqONFdsLw+CP7Pl3l5yRwt24nGIGhlGZrDR0GcFTPvUyGypw2aX0Rk
	8AZ8BNugogak2hTrAuzdS5XPZE04pZt3MVmmHWvbvK23j5y/hXSAg57tqi5StqC5eDitBfcldXT
	CdVjdvhFh0ax7xODj9q+dbQWzch5Chkr+truOSIV75oFdDEeJufKxPS3UsOQ1o4pAyLaBg9iHnS
	l4fVtzIw4IA1JMQCGChSRWjyBRIFw+hrRZq0+HkJFGcnhDzBUJImTOopHVK8gE+iyoyqwp+4lP2
	Eo+YN/ydm2BRWI=
X-Received: by 2002:a05:600c:c8a:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-483a9603d42mr181668395e9.34.1771932434331;
        Tue, 24 Feb 2026 03:27:14 -0800 (PST)
Message-ID: <791af615-c49d-45a8-825e-3ac3a1d31118@suse.com>
Date: Tue, 24 Feb 2026 12:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] tools/tests: factor out common helpers
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <1fc62b8c258f9113c8bfd6401b71c411707fc3f7.1771840831.git.edwin.torok@citrix.com>
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
In-Reply-To: <1fc62b8c258f9113c8bfd6401b71c411707fc3f7.1771840831.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 49D69186410
X-Rspamd-Action: no action

On 23.02.2026 11:14, Edwin Török wrote:
> --- a/tools/tests/Rules.mk
> +++ b/tools/tests/Rules.mk
> @@ -47,11 +47,14 @@ uninstall:
>  
>  CFLAGS += -D__XEN_TOOLS__
>  CFLAGS += $(CFLAGS_xeninclude)
> +CFLAGS += -I../common/
>  
>  %.o: Makefile
>  
>  $(TARGET): $(TARGET).o
>  	$(CC) $^ -o $@ $(LDFLAGS) $(APPEND_LDFLAGS)
>  
> +$(TARGETS): $(XEN_ROOT)/tools/tests/common/tests.o
> +
>  -include $(DEPS_INCLUDE)
>  
> diff --git a/tools/tests/common/tests.c b/tools/tests/common/tests.c
> new file mode 100644
> index 0000000000..43d9ea5442
> --- /dev/null
> +++ b/tools/tests/common/tests.c
> @@ -0,0 +1,15 @@
> +#include "tests.h"
> +
> +unsigned int nr_failures;
> +
> +int main(int argc, char *argv[argc+1])

Nit (style): Blanks around + please.

> +{
> +    int rc = test_main(argc, argv);
> +
> +    if ( nr_failures )
> +        printf("Done: %u failures\n", nr_failures);
> +    else
> +        printf("Done: all ok\n");
> +
> +    return rc ? rc : !!nr_failures;

Nit: No need for the middle operand; we use that extension extensively.

> --- /dev/null
> +++ b/tools/tests/common/tests.h
> @@ -0,0 +1,18 @@
> +#include <stdio.h>
> +#include <sysexits.h>
> +
> +extern unsigned int nr_failures;
> +
> +#define fail(fmt, ...)                          \
> +({                                              \
> +    nr_failures++;                              \
> +    (void)printf(fmt, ##__VA_ARGS__);           \
> +})
> +
> +#define verify(exp, fmt, args...) \
> +while (!(exp)) { \
> +    printf(fmt, ## args); \
> +    exit(EX_SOFTWARE); \
> +}

For both macros, please be consistent in how you want to deal with the variable
number of arguments.

For the latter macro, like the former it wants to be coded such that a semicolon
and the use site is necessary (and doesn't end up as a stray one).

> --- a/tools/tests/cpu-policy/test-cpu-policy.c
> +++ b/tools/tests/cpu-policy/test-cpu-policy.c
> @@ -650,7 +650,7 @@ static void test_is_compatible_failure(void)
>      }
>  }
>  
> -int main(int argc, char **argv)
> +int test_main(int argc, char **argv)

Elsewhere you switch to argv[argc + 1] - why not here?

> --- a/tools/tests/pdx/test-pdx.c
> +++ b/tools/tests/pdx/test-pdx.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2025 Cloud Software Group
>   */
>  
> +#include "tests.h"
>  #include "harness.h"
>  
>  #include "../../xen/common/pdx.c"
> @@ -29,7 +30,7 @@ static void print_ranges(const struct range *r)
>      }
>  }
>  
> -int main(int argc, char **argv)
> +int main(int argc, char *argv[argc+1])
>  {
>      static const struct {
>          struct range ranges[MAX_RANGES];

No renaming to test_main() here?

Jan

