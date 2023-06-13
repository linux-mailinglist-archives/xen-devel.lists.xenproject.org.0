Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BD072DF7A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547992.855699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91HU-0000KW-5V; Tue, 13 Jun 2023 10:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547992.855699; Tue, 13 Jun 2023 10:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91HU-0000IF-2Z; Tue, 13 Jun 2023 10:29:44 +0000
Received: by outflank-mailman (input) for mailman id 547992;
 Tue, 13 Jun 2023 10:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lBMi=CB=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q91HT-0000I9-F5
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:29:43 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3551b9ab-09d5-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:29:42 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f642a24568so6508877e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jun 2023 03:29:42 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h25-20020a1ccc19000000b003f8c5ceeb77sm2051123wmb.21.2023.06.13.03.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 03:29:41 -0700 (PDT)
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
X-Inumbo-ID: 3551b9ab-09d5-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1686652182; x=1689244182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j9BHNDBtHXAqHSngIjRgunHW07Bi8TYuWaRLifEINgs=;
        b=Sjfyc5p2VBzw0ebMsbYPf/oiZThV6ZkNatNJ/1gR5wUK9aj8U9wKXwtEP4QKn6IH8j
         24/xi8tD1vPdJsFeKTDdvWbgh9GDH0VC0CQlvlxUXBfa3Gm/B8SqfEuWLw9dqmU26s2W
         fZQHN+vPU1nrcPKaKAyuIc1pFQggfpWjrA/9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652182; x=1689244182;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j9BHNDBtHXAqHSngIjRgunHW07Bi8TYuWaRLifEINgs=;
        b=VPIdNydGxjr3TyFCP0qZzdgULFvPw3BO4iVE/nU3AEDMSNs8LrQ1RkebWobYg+dT3m
         ns8bYlKP0+I5Wem/jaLGMlcUfMdESwFcaGAJTh7rR6EwOiTrkHnry6Vuzh9Gdvbq9/8N
         QblMcUcEG5OCfwjaweI1uFV06AeVyQHbjeAaTbWYiO9NLZxMKNzaOcAW3usKV0uqAn1G
         4+0GFzwsb5y2T6+tArtQmJ2JgyjaW0LE9ODsijg0LDV5g5dIR9C/E9wmx2mRfRwQlGO9
         g3Nk02Rl4MkSN6L49thYSIE//FPgIIFe9OkBPSeb0lL8kKyLjKM9SDSv50mx/t3Hb8o/
         ilUA==
X-Gm-Message-State: AC+VfDwabimpPddJR9qwuMvfbYntKAr7U1JFiMJlHq9yFMYtiGqs7Zr0
	SOQjauu9RLmPfw/VfUZmHhPLWw==
X-Google-Smtp-Source: ACHHUZ5QHWeJuPOil76/BWYVzZMMY/bNyH/M306kEVk39QVgaAF0kSvDGIArHreuudxxSsqyJ7Vr3g==
X-Received: by 2002:a19:e059:0:b0:4d5:8306:4e9a with SMTP id g25-20020a19e059000000b004d583064e9amr5430153lfj.46.1686652181828;
        Tue, 13 Jun 2023 03:29:41 -0700 (PDT)
Message-ID: <64884515.1c0a0220.3d068.d916@mx.google.com>
X-Google-Original-Message-ID: <ZIhFE0spbPOUkM6p@EMEAENGAAD19049.>
Date: Tue, 13 Jun 2023 11:29:39 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] x86/microcode: Remove Intel's family check on
 early_microcode_init()
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-2-alejandro.vallejo@cloud.com>
 <711f2a44-7e2f-3e79-dd04-34a049210915@suse.com>
 <e8ef6274-1165-cee2-2718-542bd5218a05@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8ef6274-1165-cee2-2718-542bd5218a05@citrix.com>

On Mon, Jun 12, 2023 at 06:31:13PM +0100, Andrew Cooper wrote:
> On 12/06/2023 4:16 pm, Jan Beulich wrote:
> > There are many places where we make such connections / assumptions without
> > long comments. I'd be okay with a brief one, but I'm not convinced we need
> > one at all.
> 
> I agree.  I don't think we need a comment here.
> 
> I'd also tweak the commit message to say "All 64bit-capable Intel CPUs
> are supported as far as microcode loading goes" or similar.  It's subtly
> different IMO.
> 
> The Intel microcode driver already relies on 64bit-ness to exclude and
> early case (on 32bit CPUs only) which lack Platform Flags.
> 
> I'm happy to fix both of these up on commit.
> 
> ~Andrew

Sure, I don't have a strong preference either way. I'll remove that for the
new series.

Alejandro

