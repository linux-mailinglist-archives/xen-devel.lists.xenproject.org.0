Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB87B88168E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 18:25:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696063.1086639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzhA-00039q-G1; Wed, 20 Mar 2024 17:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696063.1086639; Wed, 20 Mar 2024 17:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzhA-00038J-DN; Wed, 20 Mar 2024 17:25:44 +0000
Received: by outflank-mailman (input) for mailman id 696063;
 Wed, 20 Mar 2024 17:25:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmzh9-00037z-Cg
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 17:25:43 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd8bbb44-e6de-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 18:25:37 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4146e9e45c8so4173315e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 10:25:37 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c199100b004146e58cc32sm1911117wmq.12.2024.03.20.10.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 10:25:36 -0700 (PDT)
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
X-Inumbo-ID: dd8bbb44-e6de-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710955536; x=1711560336; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/W91Cw2Z2fkYDLMg00evVnqcafw1of2POz2rXlgwAX4=;
        b=O4rWVsy35kmhYaLxmNJkq4cyuWSFYZiO65GrgNVtVL4kwXQKZ4gEKfrAKO7KFSC6LT
         xYszoLlQ3GeNssfnjbocFF8W1JIFPFWplhA/NPeyl06thLV1zRPK6mS23ILgKpW6PxwP
         Vtxuj3syQfK3w99TM39neDhjjtXXQI8d9zYCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710955536; x=1711560336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W91Cw2Z2fkYDLMg00evVnqcafw1of2POz2rXlgwAX4=;
        b=DZ/1O0pCGOiK9+OV9r7sQxG1KeAZWnc3CGyF4rjt5fpXSFPHVhonqSRp4Nk39Eb2L2
         h/Kk8KMURg1T/BwEPSdtFNMjpDbPqRusGosahW5KRzADbC9ggVRHkjBvQapnfKoe/a77
         j+7Ol9iqfVZVYPxlVfki6ZPx1T9N0fc+E48wt5C7k83MpMWLqxsNuVjbzOU7gBT8DEtp
         i+R1UGC3igXwqYcXri9kxu/KBkRKpOOcgHbGrtjeQohOvnCrREzptX00vpdzMX/6MZCI
         l4YtNMgC8AxM1nC4Fu1XAWPYPc1WeDg+wzcrBzM7huY93bUz1QgzPlXJKZ1y8fWWL/5q
         ct3g==
X-Gm-Message-State: AOJu0Yysz0zoAB6xOhylc3PFlrb0BkRXP3Ddhmwa5QWasc8UxAOHPisD
	ewl9Dk5xEZrJBr76gLUJvsm7OTP9f1jExJtVO1GsbPrQ9SqeLRL8Pm6U3xx2KwmhA/moHuf/yKv
	8
X-Google-Smtp-Source: AGHT+IFCenay4mVnklWkkQuoCbC4rGNxWIib9ryue8HZZ722Oqn9axQvatfND+xgcsyRie6vbQcl8w==
X-Received: by 2002:a05:600c:4e04:b0:414:ea1:451 with SMTP id b4-20020a05600c4e0400b004140ea10451mr308217wmq.2.1710955536470;
        Wed, 20 Mar 2024 10:25:36 -0700 (PDT)
Date: Wed, 20 Mar 2024 18:25:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 34/36] Temporally switch "qemu-mainline" branch
 to Bookworm
Message-ID: <ZfscD497p91dcPx4@macbook>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <20240318165545.3898-35-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318165545.3898-35-anthony.perard@citrix.com>

On Mon, Mar 18, 2024 at 04:55:43PM +0000, Anthony PERARD wrote:
> QEMU doesn't build on buster anymore.
> 
> This should be remove once bookworm is the default suite.

Is this change required anymore, patch 35 makes bookworm the default,
hence it seems pointless to switch QEMU just one patch ahead.

Thanks, Roger.

