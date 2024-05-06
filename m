Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084618BCA8B
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717372.1119504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uYh-0000kl-4G; Mon, 06 May 2024 09:22:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717372.1119504; Mon, 06 May 2024 09:22:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uYh-0000hu-16; Mon, 06 May 2024 09:22:55 +0000
Received: by outflank-mailman (input) for mailman id 717372;
 Mon, 06 May 2024 09:22:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VpOg=MJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s3uYf-0000hm-Ms
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:22:53 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36b26a17-0b8a-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 11:22:52 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-34e0d8b737eso2310837f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:22:52 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 k3-20020adff5c3000000b00349a5b8eba6sm10162622wrp.34.2024.05.06.02.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 02:22:51 -0700 (PDT)
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
X-Inumbo-ID: 36b26a17-0b8a-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714987372; x=1715592172; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CAbwoPt6z9g2WCw1vc/+Qz8gKP4dT1K/gzliHd+2JA4=;
        b=qxiH5DG2FI5e05fIZS8fOgBi+jbzsVbXTv1cENPkwYFLu5wNWCxb/ZbQmkb3uJz9fy
         anjmcTum0M+f/n7/D/B54tPYfuEo1m/m9oKxqx/bc/5P1i7cuuKgZ+TAiU2FVPgPAFet
         HFeYOfVAP2V2Im0/fZxwbOWUKkmh19xlaBpA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714987372; x=1715592172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAbwoPt6z9g2WCw1vc/+Qz8gKP4dT1K/gzliHd+2JA4=;
        b=wuw0yiQCq/AXms/qIn0EYY7J/RcKAd4fsb75LyAIa6EP4ZArKwWra56E30+t7Po1Wm
         TUnsvBkMm3YuSn8dFMmTp1CfZok4WkItWxo5HCSno4lZ6boKw9zTVvmycwHEUAqoGiij
         RoOikpsxA/sfxyWb8H9Uw825mpYbGdp6NGFYA6ImPD7jQKeawM2fcVwEIRqbaDiai3ar
         aF/B5k+1iiqH5WMa/+gtVi8fVbCkSS+ch/ME+1S7x0F9JYGpHfEdUEcwhmzz35SeoJ1+
         P/r2a3YqV8bR6JAqQdQVyjkvJ/GAhhqWlOoNsAAyi+2DCKsFLSi20L7WrZh2/ipsY4GH
         oTxQ==
X-Gm-Message-State: AOJu0Yyz1T6jg3wBEnTpH7xSKy4aFFIdJsaJ2w/8OggkT7JJ7/PmREO4
	sMTm3Zy//Izd20huOw+Ly4TKdlc6xZiVI8razjtlPsvyiXWxPcoB1JQqKKnpzHY=
X-Google-Smtp-Source: AGHT+IGGbH+kH+AgnANIy4TqQOu4BUSKZYt1MR07KgA5vAcZ2pV6NrVdC+cY3Xd7aRUEUjJUzH7MtQ==
X-Received: by 2002:a5d:6d82:0:b0:346:47a6:e77e with SMTP id l2-20020a5d6d82000000b0034647a6e77emr13786818wrs.27.1714987371927;
        Mon, 06 May 2024 02:22:51 -0700 (PDT)
Date: Mon, 6 May 2024 11:22:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/platform: correct #undef in compat checking
Message-ID: <Zjihaq9OIprv9EfN@macbook>
References: <92e5df23-0bdf-42d4-9ab0-c668110174f0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92e5df23-0bdf-42d4-9ab0-c668110174f0@suse.com>

On Mon, May 06, 2024 at 11:06:07AM +0200, Jan Beulich wrote:
> A stray 'p' was there, rendering the #undef ineffectual.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

No Fixes tag?

Thanks, Roger.

