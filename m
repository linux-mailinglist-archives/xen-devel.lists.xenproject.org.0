Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0503B561A2
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 16:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123325.1466433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxRUU-0000H5-Ef; Sat, 13 Sep 2025 14:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123325.1466433; Sat, 13 Sep 2025 14:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxRUU-0000Dv-BO; Sat, 13 Sep 2025 14:44:38 +0000
Received: by outflank-mailman (input) for mailman id 1123325;
 Sat, 13 Sep 2025 14:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oBHe=3Y=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uxRUS-0000Dm-IR
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 14:44:36 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 254b1c47-90b0-11f0-9809-7dc792cee155;
 Sat, 13 Sep 2025 16:44:26 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3e7636aa65fso2194148f8f.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Sep 2025 07:44:26 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e01578272sm109003395e9.9.2025.09.13.07.44.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Sep 2025 07:44:25 -0700 (PDT)
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
X-Inumbo-ID: 254b1c47-90b0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757774666; x=1758379466; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w0fR/zVOW7BvlafCNVW2z+aApS6CRvAACmRmwWLbDX0=;
        b=GvzmJRHn9WgQriuIeYLb+eQeMDiGkKnvBFym7/rHakDdCI5qiFRTbDmXP2DkaLnFQ3
         W6m0IjYh9CPKomp2qguEHIMwJSNc0Bl8hv9NxsNk21ghjlk78/vw9cvDbeyrIHTSdq0y
         ocs0AnQJ9MBAm3+kK531BYsYdATq6JrjNNlPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757774666; x=1758379466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0fR/zVOW7BvlafCNVW2z+aApS6CRvAACmRmwWLbDX0=;
        b=UQ5t0atMJnrGJ1p3SZuvQbeqWGd1Jrz8x2twTUa4wWV9Bgpuy4DHKk/5k35bK7favr
         qzQca5qWxPyFQ6SMSwViU9mhj0EpH7tH8as2OtNSs17aj7yvlHuQcjdgcVfz2h4R/h5W
         a5I6k97CgFXYd0ibjP/sbwL7xL7bc4cF1sLqBEdVq79HK7t+U37SYDnT7TpoEbClhuxI
         g64IhMlCGLBMOvEuN1b3CtQw4C8OWW+D7S7R1uZ0pLxT10Uda0u0bKRSx458dF6eli1h
         ML5gG3mg02XpQdDUJ4VmHKlvKqxVl7XOpEGbbjigXduEr0R5zD4exnQMsW20NM4/1hRY
         XNZg==
X-Gm-Message-State: AOJu0Yyf6cHPdkngl6G2rXPc2buDYu0o7O1arUyLHVQgiF9JJCcAaLdc
	/eMf2hfPa4Nfuw7gFuzX6j4H5gcNoUN9Q5Z75LpYM/ykX5XaevHAePMGSa7E42y1NPs=
X-Gm-Gg: ASbGncsebRSWaq4WzSXzAsNnUQy+KgL/+7rwrVZG+bW5iqT9Wbe1wLOyhQ4248Dnv/g
	jWX9UtwP0ZMFdCiQb3gXKNfbqEfZ6aw+P3on9fncW34AgB5gzNGzwrT051VudoIPrlnA5oSxM2C
	wr7LpLdf9H74QU+quM2b0m5/yQ4xOImkUdLlimsTOPfZ4Z2VXty0CynEROS3A5mDNrGSb43P78Z
	iu6zNYph/IPRonAubMdkkCP+LH6svsio0cr9zZF5xTVbtmBgSdGhuP17993A56NO1nrfJTN6mkK
	70dWaDti4sR8HZqzP2GHRGsZWzd1gnO9U+wFmQeE3oj3CMenVvQyaU8Ed9mlAuiyX0lKehy9ePr
	eRowBupo+DIt2sYRYhzwNuh3liMnK8mrO/LNHjAf4gJ9/6XtjMQFTJMx4kAiL6Hk1wXBZlnbHZU
	fH4Qw=
X-Google-Smtp-Source: AGHT+IFKXTqhzWrdcaKtUFPfyePQTP4SRBVmpQ+6MevEtR/qPjd0hgaAXMwFjj9SH1y557/w5jnHrg==
X-Received: by 2002:a05:6000:22c3:b0:3e2:fcba:915b with SMTP id ffacd0b85a97d-3e765a2e03fmr5376909f8f.32.1757774665627;
        Sat, 13 Sep 2025 07:44:25 -0700 (PDT)
Message-ID: <bf9199e3-820a-4326-9ef2-66719bf33e48@citrix.com>
Date: Sat, 13 Sep 2025 15:44:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][for-4.21] xen/arm: Reorder SCI resource cleanup in domain
 destruction
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <164651d0662e674002ed17399300c3a25e6dcbfc.1757757602.git.oleksii_moisieiev@epam.com>
 <CAPD2p-no-PzREaQNnH6XWmM6qE+MNUW7aErGq8N_FeSfswoXSQ@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAPD2p-no-PzREaQNnH6XWmM6qE+MNUW7aErGq8N_FeSfswoXSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/09/2025 3:07 pm, Oleksandr Tyshchenko wrote:
>
>
> On Sat, Sep 13, 2025 at 1:31 PM Oleksii Moisieiev
> <Oleksii_Moisieiev@epam.com> wrote:
>
> Hello Oleksii
>
>     Move the SCI (System Control and Management Interface) resource
>     cleanup
>     earlier in the domain_relinquish_resources() sequence to ensure proper
>     cleanup ordering during domain destruction.
>
>     The SCI cleanup is now performed before TEE (Trusted Execution
>     Environment)
>     cleanup rather than after P2M mapping cleanup. This reordering
>     ensures that
>     SCI resources are properly released before other subsystems that might
>     depend on them are torn down.
>
>     This change addresses potential resource cleanup dependencies
>     where SCI
>     resources need to be released before P2M mappings are cleaned up,
>     preventing
>     potential issues during domain destruction on ARM platforms with
>     SCI support.
>
>     Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>     ---
>
>      xen/arch/arm/domain.c | 9 +++++----
>      1 file changed, 5 insertions(+), 4 deletions(-)
>
>     diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>     index 1a8585d02b..0ac381a5a5 100644
>     --- a/xen/arch/arm/domain.c
>     +++ b/xen/arch/arm/domain.c
>     @@ -1090,6 +1090,11 @@ int domain_relinquish_resources(struct
>     domain *d)
>                  return ret;
>      #endif
>
>
> There is an enum above (not visible in context)
>
> enum {
>      PROG_pci = 1,
>      PROG_tee,
>      PROG_xen,
>      PROG_page,
>      PROG_mapping,
>      PROG_p2m_root,
>      PROG_p2m,
>      PROG_p2m_pool,
>      PROG_sci,
>      PROG_done,
> };
>
> I am sorry, but shouldn't PROG_sci location there reflect to where you
> now put PROGRESS(sci)
> (I mean above PROG_tee)?

The enumeration can be in any order.  All they're actually doing is
encoding which case label to use next time.

But, for people's sanity following the logic, they ought to be kept in
order.

~Andrew

