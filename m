Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA5866F7C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 10:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685406.1066056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXjl-0006YA-I9; Mon, 26 Feb 2024 09:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685406.1066056; Mon, 26 Feb 2024 09:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reXjl-0006WY-E9; Mon, 26 Feb 2024 09:57:29 +0000
Received: by outflank-mailman (input) for mailman id 685406;
 Mon, 26 Feb 2024 09:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CwqN=KD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reXjj-0006WP-8R
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 09:57:27 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71720a62-d48d-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 10:57:25 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33da51fd636so1766413f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 01:57:25 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 bj20-20020a0560001e1400b0033db0c866f7sm7819401wrb.11.2024.02.26.01.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 01:57:24 -0800 (PST)
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
X-Inumbo-ID: 71720a62-d48d-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708941445; x=1709546245; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GoqpB2A1QWrYgNxFfnAU2BSKKVcn6++TCAwgRtuKPFI=;
        b=ZWjqtQSQYdjI8BFlgZhIzn9LcbBaJcHbPYF0aXizJPpidV3jV2IWuix0fn8Nbv1htt
         cXXrAmZsF510X5WCmrNTlwcRg5goK94uPLj02jmooksJarWAEk3fXAUBWGSeuSeflIVb
         RRgwXT19KQDBGY6nRPU+IFfiKVZUcwsq8HOUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708941445; x=1709546245;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoqpB2A1QWrYgNxFfnAU2BSKKVcn6++TCAwgRtuKPFI=;
        b=dwzn4D2QZ0sv58vz3oyjZM7ahP7mhuzvMIFeuPCpgCKWKjxIENySpNqWD45SHaW348
         4YjmDVu6nX329YY8jLuMx83t9o5PiiG6Ez75fnl+ZSXOH/OkE8VZtTwYSl6PXXWwOvn4
         NzGH/+8qB2ClxpuhTl7PJhLjvlR+v7xRrqJRxXwOmJ8AEw4sWaG4cLKi1q9JnzRo5z7F
         pD1oytkYo3Do56V24z+1V2cBdNDyhXycLnf03KnqZYocgoULoA5vpCoj0rguGbHvGmkS
         wxBTTFCrf2OpHR8t+ZA38GKtJruZUfTJyi73uU1FcG7Lx+xgpXEuJGK+4n6vyVC1pxMF
         C6hA==
X-Forwarded-Encrypted: i=1; AJvYcCX5pI/l7kVAj52lyQHHzf+EsQd/bTROyXpO/3FEliVT8jLC3tY4GnXU6TZ4T2fkWD9K4BUpqa11xXZ0Ns1i80KUoS4MX24Ukhafw+4pG8A=
X-Gm-Message-State: AOJu0Yx+k0r62+hqion+AdUZbuBi8toWaFDloQC3NSt9wvIdz6zRu64P
	Y11Ujtkpxzs80TKdOrp5S2za2RQqMVDZYCr0OA8kdee6LW982OKZ/fp0T3OTRl4=
X-Google-Smtp-Source: AGHT+IEAXzD5v4SkZEtkdjU7xi6+CmPDp60BpErAFzdVl6kmYMbh6JL70Mf2KEVA24q5ufBcP6j6tQ==
X-Received: by 2002:adf:fcc6:0:b0:33d:9283:93b with SMTP id f6-20020adffcc6000000b0033d9283093bmr4348396wrs.47.1708941445001;
        Mon, 26 Feb 2024 01:57:25 -0800 (PST)
Date: Mon, 26 Feb 2024 10:57:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/3] x86/spec: fix BRANCH_HARDEN option to only be set
 when build-enabled
Message-ID: <Zdxgf-1BvPQsnTVb@macbook>
References: <20240223120616.73503-1-roger.pau@citrix.com>
 <20240223120616.73503-3-roger.pau@citrix.com>
 <3dcb9afe-7f3f-495c-b182-b4242b4cb337@suse.com>
 <ZdxVQRMRyQOEc581@macbook>
 <076cac3e-097a-4994-b68f-888b491c82a7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <076cac3e-097a-4994-b68f-888b491c82a7@suse.com>

On Mon, Feb 26, 2024 at 10:33:14AM +0100, Jan Beulich wrote:
> On 26.02.2024 10:09, Roger Pau Monné wrote:
> > On Mon, Feb 26, 2024 at 09:42:58AM +0100, Jan Beulich wrote:
> >> On 23.02.2024 13:06, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/spec_ctrl.c
> >>> +++ b/xen/arch/x86/spec_ctrl.c
> >>> @@ -50,7 +50,8 @@ static int8_t __initdata opt_psfd = -1;
> >>>  int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
> >>>  int8_t __read_mostly opt_eager_fpu = -1;
> >>>  int8_t __read_mostly opt_l1d_flush = -1;
> >>> -static bool __initdata opt_branch_harden = true;
> >>> +static bool __initdata opt_branch_harden =
> >>> +    IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
> >>>  
> >>>  bool __initdata bsp_delay_spec_ctrl;
> >>>  uint8_t __read_mostly default_xen_spec_ctrl;
> >>> @@ -268,7 +269,14 @@ static int __init cf_check parse_spec_ctrl(const char *s)
> >>>          else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
> >>>              opt_l1d_flush = val;
> >>>          else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
> >>> +        {
> >>> +#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
> >>>              opt_branch_harden = val;
> >>> +#else
> >>> +            no_config_param("SPECULATIVE_HARDEN_BRANCH", "spec-ctrl", s, ss);
> >>> +            rc = -EINVAL;
> >>> +#endif
> >>> +        }
> >>>          else if ( (val = parse_boolean("srb-lock", s, ss)) >= 0 )
> >>>              opt_srb_lock = val;
> >>>          else if ( (val = parse_boolean("unpriv-mmio", s, ss)) >= 0 )
> >>
> >> While looking at patch 3 I noticed another inconsistency: Wouldn't
> >> "Compiled-in support:" better also enumerate HARDEN_BRANCH then, just
> >> like for thunks both CONFIG_* state and actual runtime choice are
> >> logged?
> > 
> > Yes, I guess we would also need to expand "Compiled-in support:" to
> > include HARDEN_ARRAY and HARDEN_GUEST_ACCESS.
> > 
> >> Or alternatively, should logging of thunk runtime choice be
> >> suppressed when the Kconfig setting is off?
> > 
> > Hm, I think printing "BTI-Thunk N/A" is good enough when the thunk has
> > been built time disabled.
> 
> Good enough - yes. But redundant with the other log line. And since all
> of this output is getting longer and longer anyway, omitting whatever
> can sensibly be omitted might be at least worth considering.

I can add yet another patch to remove that when not built-in, this
cleanup is turning into a never-ending exercise I'm afraid.

Thanks, Roger.

