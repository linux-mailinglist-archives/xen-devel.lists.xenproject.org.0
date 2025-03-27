Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9787A72B4E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:22:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928615.1331304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiUu-0000nR-UC; Thu, 27 Mar 2025 08:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928615.1331304; Thu, 27 Mar 2025 08:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txiUu-0000kI-QR; Thu, 27 Mar 2025 08:21:56 +0000
Received: by outflank-mailman (input) for mailman id 928615;
 Thu, 27 Mar 2025 08:21:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txiUt-0000iR-Mc
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:21:55 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a7c2c1b-0ae4-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 09:21:55 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-223f4c06e9fso12963945ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 01:21:54 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7390611c945sm13613107b3a.88.2025.03.27.01.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 01:21:52 -0700 (PDT)
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
X-Inumbo-ID: 8a7c2c1b-0ae4-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743063713; x=1743668513; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U5i/Mcx68PlazOgSRpwDyE0szi2aJd5Bd7xB7vmAT0A=;
        b=LsufoFwZ8OCjYbBOJRyOHbZTDENyE2Ypnsl809c4kQMR2lopwJ50C7wBoOJ8IWNgsy
         ljShKq4/OYj8F6RFV8Vdhh1y4LY5rcKCsQO9Zq+BXcOut4pKJncyv4aiYVZwE+B/2DG6
         b3xK+LA4dM+LNyUjY86FioUPf5a9bKYYXEHPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743063713; x=1743668513;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5i/Mcx68PlazOgSRpwDyE0szi2aJd5Bd7xB7vmAT0A=;
        b=C7YpUC+RYJ6ek11gND4UYbo/KBGqxY2+WOhbbQ9gVQ7bYa7AB4yz3jXJOqwDavJQsV
         /xKKpQCP0u7OyUi6cwXO1ge1iVUYbbEbdR2au3bg/obNmy+oG4dDMlV5atvyKkHog7fL
         Iz8kCOArGVGaWMEqJQZ3bLyDtgKpHZckqAsO8SOWHlYfCaHme8JIJpLksylB/On3PG8J
         7FXnF/6IHdQqBum++2fWOUggnF/zdOfAkh06A21El74S+AgO3s6KYJoA50sw+TIq1RIW
         N+HSy+y85dKERkL/BUByrMkK7l6EnKN8xJqr8PdyP9dxrYNJ9Ij/lc/0n+fg+TyHbHIa
         MaRw==
X-Gm-Message-State: AOJu0YyzsVuY8TTe5C9OPAdp9QiNGpFAGuNjZA7dAqTKadyU/8QZ5TSa
	nliOU2DpMUAINv4fRRvlTZ4d+RiowjicyaCpvO2AiBIUig1cQar++T5cPuzf/gg=
X-Gm-Gg: ASbGncssfT2p5rE9VikhgU8VHOwpiLIxgDhAh9yRXV7UdNm72mWgt2h2ONjMGIRbfmb
	wLsvhrPuPvfSslmx/SBauyLZUHJEzNdrdrY59oVUzRRdLAKt6VC5sHv4aLu42ZKJABJ7C3a6nWq
	rTxGrkHDfW13BMiLUNRd6riSTN72ePwY70IV0Nzt6oUgk4EZindwTqgaEUvGt0chT/wDK4hFdX1
	LCofG3CeX1HRRwoIhptrh3Pf8PC8srmpiQNI5SHvyx3LWXvottJN6e4Gt2Uw4HTwMIwPGjc7WCD
	wP0M759Gwq6BnRyHun2M0qnjY/APn3a8J90JixLjhjwAsNlWOc0w6yB/ZndG
X-Google-Smtp-Source: AGHT+IHdQ7h9Ziykt2O4Hs/wLs18dQLAj9GORRbFMeE7UsE8ytaO3FPx0XGFSKb1CpMe2HbXF4lipQ==
X-Received: by 2002:a17:903:2452:b0:223:fbbe:599c with SMTP id d9443c01a7336-227efb66734mr100300845ad.19.1743063713213;
        Thu, 27 Mar 2025 01:21:53 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:21:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/CPU: don't hard-code MTRR availability
Message-ID: <Z-UKm6D9pmAEaE_9@macbook.local>
References: <edecdda9-4728-4c65-9f31-76c912a433d7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <edecdda9-4728-4c65-9f31-76c912a433d7@suse.com>

On Tue, Mar 25, 2025 at 08:18:11AM +0100, Jan Beulich wrote:
> In particular if we're running virtualized, the underlying hypervisor
> (which may be another Xen) may not surface MTRRs, and offer PAT only.

At least for Xen, I think we offer MTRR uniformly, even on PVH
guests?

> Fixes: 5a281883cdc3 ("Hardcode many cpu features for x86/64 -- we know 64-bit")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

My main concern is whether the !mtrr path is still functional.  Have
you tried booting the resulting hypervisor with MTRR masked on CPUID?

(or alternatively short-circuiting cpu_has_mtrr == 0?)

Thanks, Roger.

