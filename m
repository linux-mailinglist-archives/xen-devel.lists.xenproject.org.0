Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920939EE9FC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 16:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856130.1268856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkmK-0000SS-EW; Thu, 12 Dec 2024 15:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856130.1268856; Thu, 12 Dec 2024 15:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkmK-0000PJ-Br; Thu, 12 Dec 2024 15:07:00 +0000
Received: by outflank-mailman (input) for mailman id 856130;
 Thu, 12 Dec 2024 15:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kKfJ=TF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tLkmI-0000PD-NU
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 15:06:58 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba0a44b1-b89a-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 16:06:55 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3e829ff44so3527182a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 07:06:55 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3f3cf8c6esm6481333a12.85.2024.12.12.07.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 07:06:54 -0800 (PST)
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
X-Inumbo-ID: ba0a44b1-b89a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734016015; x=1734620815; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e0ufwB2b4FW4nolJ5aBbeFkKaQFRCaq1nBYehTHUsPQ=;
        b=ncVFZamjXhGS2hcRUr6CcPbRVZUnleaaukNcRo0DGYuccSauKomL0p3lubvZ2743xk
         Pe0F5DFDOEABJUyQKgF+Oswj5/DRrUReskBtov3qzt+zTGelfwFSH/BzrVvxWL5JwpLn
         1sYjkfo4elx3HGlJwjOsliLagRtHhyQU3BCvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016015; x=1734620815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0ufwB2b4FW4nolJ5aBbeFkKaQFRCaq1nBYehTHUsPQ=;
        b=E/X0q/tcLUhX/aNTvd9fLGtxxuHSxgoUIQbpSWyUwz99e4LvjD6QrA1sRnbS2Nc0xL
         6GmowWEmEHxr9WebJJ6vVZbcuq4tJRnxl7NVTqAxlsE2EU4JjU9giSjvF+QDFJaW9Lck
         bakbmhXBG8UJsZK/2Xl4/3Rrhx4ELupOSokpbSQhfo5mKUU3Y+dAVh2tboycrT3XYRM3
         3KL3M4iLm6SpBO9DD4JNuRVawwG9ER2KlODpthWQapMSFPtviQwnsp7gubLM9EQE+Oan
         SNCvNX4sFxLged1jvVt+0898YmX2VR4uv+7xGkavcX2eZkobDocOtMSMn4RWk7H/14lY
         tvIQ==
X-Gm-Message-State: AOJu0YxWi3j9YCjgvAEtU+8EI1+BbC7dVDZqvairhepMVLXkzyNsOFTB
	0kQSQKxZh0gMs6Kae45m//ajL8kCLW2iDQQx/VQrlVL6Fg1U7KX/jY44Bg8PQ1s=
X-Gm-Gg: ASbGncsyLnHjkp/VAZvlHg2u7n0cfuCuGg4yi/+Gjg8x5CbD4JK/j44Ane90p6Dz0XC
	0iI0hn/9zPLB25GkfX6TRttQPghP4qSYqqs1AApTWipGzbRXBU4iStiYm/ME7/qXv+er78OP9Ur
	IJclWWOtqJjtt0SUYj6O05Hb0amYf1A17FM4h4yDDBOjMQikQAZf6cyBaHt5/czYH5E20Q28Ijd
	hloWmrRJOxx4WeReFIOROJGhirLMW/xioexUyIOwbyJBGhpz2HzhAGZQ1KSSnEUaA==
X-Google-Smtp-Source: AGHT+IGGyNLNR1RClM55xrjfdfWVD2LgIWLTKhIXrbKkA3UKKSknIdcAM6iFD4rA8RiO5kZp/JvnfQ==
X-Received: by 2002:a05:6402:5206:b0:5d0:b61a:89c9 with SMTP id 4fb4d7f45d1cf-5d63579198fmr631834a12.5.1734016014800;
        Thu, 12 Dec 2024 07:06:54 -0800 (PST)
Date: Thu, 12 Dec 2024 16:06:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 29/35] x86/hvm: add HVM-specific Kconfig
Message-ID: <Z1r8DWGh6sujHZss@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-29-e9aa923127eb@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-vuart-ns8250-v1-29-e9aa923127eb@ford.com>

On Thu, Dec 05, 2024 at 08:41:59PM -0800, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add separate menu for configuring HVM build-time settings.
> That will help organizing HVM-specific options under a separate menu.

Instead of being a separate menu, which feels a bit odd under default
settings because there's just an "HVM support" option inside, could
you make it look like the PV support menu, that indents PV specific
options:

[*] PV support
[ ]   Support for 32bit PV guests
[*]   Support for PV linear pagetables

Thanks, Roger.

