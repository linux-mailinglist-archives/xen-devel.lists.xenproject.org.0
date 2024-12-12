Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CF29EE20D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 09:59:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855573.1268434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLf1o-0006aL-NU; Thu, 12 Dec 2024 08:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855573.1268434; Thu, 12 Dec 2024 08:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLf1o-0006Xi-Kz; Thu, 12 Dec 2024 08:58:36 +0000
Received: by outflank-mailman (input) for mailman id 855573;
 Thu, 12 Dec 2024 08:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLf1n-0006Xc-Sb
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 08:58:35 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4401a1ff-b867-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 09:58:33 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3dce16a3dso653302a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 00:58:33 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3dbf898e7sm7483135a12.16.2024.12.12.00.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 00:58:32 -0800 (PST)
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
X-Inumbo-ID: 4401a1ff-b867-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733993913; x=1734598713; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S7Qp3j63K5B0ohX3jwMaAjsqeWmkAwPi4LarI1Jro5Q=;
        b=dq31ooNvDl7ksHJ1k1lOv8+5/MtrXEeglZuIh1bel0354XsHMHwbonMVY6Cj89TjWU
         i46nWIt5yr8LVKbS0lSHH0O6M85VsbcCjL/wj8rrKjK07STnUKYeUawGfEuhsKxL/J7Y
         aKzG5XwNaR9NhJGwQH7JEoozvAWkTnrkUsW5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733993913; x=1734598713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7Qp3j63K5B0ohX3jwMaAjsqeWmkAwPi4LarI1Jro5Q=;
        b=DzcfI8uN35Z5t5tQvnFT9wOwKz9APK8lagrR9SF7afNECHlEmuxbnTXY9fRvMTZ37l
         BHuBAyaQgyUfvV7X3Sj05YANeTUCH9Z3TutQAHNFII5XNyc5vpLz7GH2ztMOPdqgfjRO
         rW6l0ZwdjaKcgClPn618G3TzPbT3w6HvPl9y2369gEqGYEV2rT3sNmz3Nex6xnj10xnc
         0zAH+EXDBJOLy43GNcYudduNtjaijIswk3SN4TooAvZiUiZ+Fdc+ndTjbX2G4EGItiqz
         qf0lL6sLlU5smwjiKo0faBG86b/LhPoF4vyD2wzTHNR+6IO0HHoS92eVNjS6Svw8GbuH
         wm0A==
X-Gm-Message-State: AOJu0YwY/YCfiYQb9uP5154xbjH29sDqnnnqqmqkE2MYM9k9RtP7RsIP
	2lln+YqBcOxE1UytaSoAzZS2/lBEmwQzwhBqeqOVB3BDJdhuQbZuLtrAXKwiozxHEHG052mrGHW
	F
X-Gm-Gg: ASbGncto+OIXCtg6WEDfAd8ZG4zdvPp/Z2Nm4bo1EBmdtjE+lw+qq81hFKmpqcjrOpY
	J1+rIZ+McKs/IKdsK62LQavQ6tNr5Qb4hWfADHw91KF7lnFZD0EsheZq3k96UBzHm7O3j38oOcD
	6rGB7iRPVCq8wHcQTM0t+TWtwrkaDNp0RuXllBe+/HUYxqPybw2KXFcjqzuDw5TZ3nfsVCaOCaF
	ck4aPIGbVl7Z+JoEdV3ks0BS8uWP4NJrqKZtc7bQamyqLuL1MfLDgJs1XC7CPo0ww==
X-Google-Smtp-Source: AGHT+IHOGTiCd4EOWpyI981EJYs5SCLgQglJbMyA92C3O4PGBltiPosW4TDUDuY1VIW/QAXcTkjU/g==
X-Received: by 2002:a05:6402:2811:b0:5d0:e9a8:4c96 with SMTP id 4fb4d7f45d1cf-5d54763b71dmr24351a12.9.1733993912863;
        Thu, 12 Dec 2024 00:58:32 -0800 (PST)
Date: Thu, 12 Dec 2024 09:58:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 15/35] xen/console: rename console_rx to console_owner
Message-ID: <Z1qlt5YLzxwawXq_@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-15-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-15-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:45PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Preparation for the follow on change to switch console_owner to
> domid_t address space.

I'm a bit confused, is the plan to assign the console (so both RX and
TX) exclusively to a domain?

Otherwise this would better be named console_input_target or similar,
if you think console_rx is not clear enough (FWIW, I'm OK with the
name given the current usage).

Thanks, Roger.

