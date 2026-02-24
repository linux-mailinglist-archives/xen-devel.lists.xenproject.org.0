Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH0zGmmQnWlKQgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:50:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C330B186969
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:50:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239945.1541345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqv9-0002RF-Qx; Tue, 24 Feb 2026 11:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239945.1541345; Tue, 24 Feb 2026 11:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqv9-0002PS-NY; Tue, 24 Feb 2026 11:49:43 +0000
Received: by outflank-mailman (input) for mailman id 1239945;
 Tue, 24 Feb 2026 11:49:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuqv8-0002PM-CX
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 11:49:42 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7476321-1176-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 12:49:41 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso61404365e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 03:49:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b88ead80sm38078665e9.2.2026.02.24.03.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 03:49:40 -0800 (PST)
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
X-Inumbo-ID: e7476321-1176-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771933780; x=1772538580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qhe7hTMJVxJK6ttJDSkdxn9dn7WGw/zc+csxb9Sz8Ys=;
        b=Q5joespUySUV5MMr6RKB9SUk7Gc40YRCcwFG7mBVulndM2uGSzu2mIL7HxwdGd1LCV
         4rw7YOJU/qHRjpjAJaljGazvip/s2WronwSEBuyZc1Vn0PMfE+3NfVtLF/WLjoi4TP1q
         kfJ1RInQDNap6vLVzNQQeuyj5QvoJmvKzO9yMRn849aLRLLIznGenMgND5BBnLFhNEI+
         5QmIOgjROdip+wz7jvDpdNzZxyAxgheCQtUnFq6/AOiczJTt1RU0YsceZSiggWHsv7hY
         0szVfZOZb2RxzrBynBMU7Ra82MyNi8HAfW84tJ0ighXeggp+z3ektEm2ZC21XaB57Dzi
         OKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933780; x=1772538580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qhe7hTMJVxJK6ttJDSkdxn9dn7WGw/zc+csxb9Sz8Ys=;
        b=CWUXPCnx8Eej8tpvAmlWirtwMlJWndroasCfWbDntsIr5goeoZpIT5TewTy/nl8lXY
         uRDUsrbUoSahem74VDF0tLQv5uoAiqi3lnaXquwu26iSWG2dSOIZikuDarmXiulsSqHL
         dnR0gcr45M9JbtVSYWVQRc4iKUdstE9t+ILCrhCh4EYDDmsMoVq1yByf3sVz0kJQejSu
         wL6zVLSmC3+1hLr5PA1rUn3KgcGRGjpIx3L++92ct9tanGYqfe4RklpO2ecmlq4Iz0Qp
         0M3v2cDjGdcuuQSwSP27OGsDkDwmNZMrRlOkwrJ67DPT8Ymznojt1jNiAzAKilIfzpkQ
         oyGg==
X-Forwarded-Encrypted: i=1; AJvYcCVchBkyoJvDvKCZyxzmQg1G6pYgb7QkYubh486v+mwwJghtgRVnv02nr7VBrz55JNDOV5s9bEommE4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGNlZeQe288D7ABmlFECYZK0j4wwNRKpvx3E0yMdsRR3vSUiFk
	IGGiAfFfybvGumh5KpatCe1b4WjnRXlYMIMiOsfh1evDRZBPFGJ3XOC4U5Koo2gr5A==
X-Gm-Gg: AZuq6aJs9U712uRpxQi/1V8zVXO6sBfBB0OH92Zy/HH4U0psgOqC0sLD9DPKcCGEvwv
	3JUI6vS7NbGLYv0rXb+h0I+8OqMUyUI65enR4hemB6yO9eIgbu3Ixwh1dP9T13rDWICEJobAQPz
	gvkJqcMKntBs6wa5XftSmrelkZlVpAMEiGN1Roan/OWV81IvRl8muRG1JD+XW1u5W6ggmFZpaoG
	5JhRcBPT+xrldhSP2iT8dAZfVJxTRO9u14bMoSZDlB2HfDif69/kGvvER7smSqAmqydvEDbxxUI
	mSwPlOr9P0VC83TI3VkfDCSGO32CPfFJoB0QQyktUFyf5X75o9Vj5xnCUNQ/x6aK4VR1d1DmYw7
	N0IsH9gnqzcNiC5mBCLvDn0SATIPf5rPcFPt85BcPDBppPUgq6AQ1bCnBbWbw4MAzkEKa5psCSJ
	AT3V2dkauUMYJK5acwHEE3SG4lYJ7iOpTWBbEtowkmJJgOo3O+js+vA8kShJ70g8Vv0Ap1S3Hjj
	cCwApdXYNrCvttDfii/fNwQgQ==
X-Received: by 2002:a05:600c:530f:b0:483:bcff:7948 with SMTP id 5b1f17b1804b1-483bcff7bd8mr4212805e9.10.1771933780324;
        Tue, 24 Feb 2026 03:49:40 -0800 (PST)
Message-ID: <a5ff71e6-5c9c-41c8-bc28-e9b9bab7a0f1@suse.com>
Date: Tue, 24 Feb 2026 12:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] tools/tests/tsx: move guest creation to common area
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <78e4cef251a188713e4b2e13fd6185cc2f1d856b.1771840831.git.edwin.torok@citrix.com>
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
In-Reply-To: <78e4cef251a188713e4b2e13fd6185cc2f1d856b.1771840831.git.edwin.torok@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C330B186969
X-Rspamd-Action: no action

On 23.02.2026 11:14, Edwin Török wrote:
> --- /dev/null
> +++ b/tools/tests/common/guests.c

Everything in the file uses singular, si I'd suggest to use singular also for
the file name.

> @@ -0,0 +1,87 @@
> +#define _GNU_SOURCE
> +#include "guests.h"
> +#include "tests.h"
> +
> +#include <err.h>
> +#include <errno.h>
> +#include <string.h>
> +
> +xc_interface *xch;
> +xc_physinfo_t physinfo;
> +bool xen_has_pv = true, xen_has_hvm = true;

static for at least some of these?

> +void test_guest_init(void)
> +{
> +    int rc;
> +    xch = xc_interface_open(NULL, NULL, 0);
> +
> +    if ( !xch )
> +        err(1, "xc_interface_open");
> +
> +    rc = xc_physinfo(xch, &physinfo);
> +    if ( rc )
> +        err(1, "Failed to obtain physinfo");
> +
> +    xen_has_hvm = physinfo.capabilities & XEN_SYSCTL_PHYSCAP_hvm;
> +    xen_has_pv = physinfo.capabilities & XEN_SYSCTL_PHYSCAP_pv;
> +}
> +
> +void test_guest(struct xen_domctl_createdomain *c)

static?

> +{
> +    uint32_t domid = 0;
> +    int rc;
> +
> +    if (!xch)

Everything else uses Xen style, so this wants to, too.

> +        return fail("test_guest_init() not called");
> +
> +    rc = xc_domain_create(xch, &domid, c);
> +    if ( rc )
> +        return fail("  Domain create failure: %d - %s\n",
> +                    errno, strerror(errno));
> +
> +    printf("  Created d%u\n", domid);
> +
> +    test_guest_domid(domid);

This might better be passed as a function pointer, so harnesses can have
multiple functions dealing with different aspects of the testing.

> +    rc = xc_domain_destroy(xch, domid);
> +    if ( rc )
> +        fail("  Failed to destroy domain: %d - %s\n",
> +             errno, strerror(errno));
> +}
> +
> +void test_guests(void)
> +{
> +    if ( xen_has_pv )
> +    {
> +        struct xen_domctl_createdomain c = {
> +            .max_vcpus = 1,
> +            .max_grant_frames = 1,
> +            .grant_opts = XEN_DOMCTL_GRANT_version(1),
> +        };
> +
> +        printf("Testing PV guest\n");

To easily distinguish things in the output of a harness creating multiple
guests, some disambuating string may want passing in.

> +        test_guest(&c);
> +    }
> +
> +    if ( xen_has_hvm )
> +    {
> +        struct xen_domctl_createdomain c = {
> +            .flags = XEN_DOMCTL_CDF_hvm,
> +            .max_vcpus = 1,
> +            .max_grant_frames = 1,
> +            .grant_opts = XEN_DOMCTL_GRANT_version(1),
> +            .arch = {
> +                .emulation_flags = XEN_X86_EMU_LAPIC,
> +            },
> +        };

For starters this may work, but longer term we may need ways to specify certain
propertied of the to be created guest(s).

> --- /dev/null
> +++ b/tools/tests/common/guests.h
> @@ -0,0 +1,11 @@
> +#include <xenctrl.h>
> +#include <xen/domctl.h>
> +
> +extern void test_guest_domid(domid_t domid);

Nit: If this was to stay, no need for "extern", just like ...

> +extern xc_interface *xch;
> +extern xc_physinfo_t physinfo;
> +extern bool xen_has_pv, xen_has_hvm;
> +
> +void test_guest_init(void);
> +void test_guest(struct xen_domctl_createdomain *c);
> +void test_guests(void);

... you have none here.

> --- a/tools/tests/tsx/Makefile
> +++ b/tools/tests/tsx/Makefile
> @@ -11,4 +11,6 @@ CFLAGS += $(CFLAGS_libxenguest)
>  LDFLAGS += $(LDLIBS_libxenctrl)
>  LDFLAGS += $(LDLIBS_libxenguest)
>  
> +$(TARGET): ../common/guests.o

Does this work properly with parallel builds, once more than one test would
use it?

> --- a/tools/tests/tsx/test-tsx.c
> +++ b/tools/tests/tsx/test-tsx.c
> @@ -31,6 +31,7 @@
>  #include <xen-tools/common-macros.h>
>  
>  #include "tests.h"
> +#include "guests.h"

Isn't this ../common/guests.h ? Plus perhaps common stuff could go straight
in the parent directory anyway?

Jan

