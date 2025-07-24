Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB16B10E12
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 16:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056206.1424408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexIk-0002bD-Jm; Thu, 24 Jul 2025 14:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056206.1424408; Thu, 24 Jul 2025 14:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexIk-0002ZL-GQ; Thu, 24 Jul 2025 14:52:06 +0000
Received: by outflank-mailman (input) for mailman id 1056206;
 Thu, 24 Jul 2025 14:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=98ak=2F=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uexIj-0002ZD-7r
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:52:05 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c28b110a-689d-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 16:52:03 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4561ed868b5so7886605e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 07:52:03 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b76fcad219sm2395186f8f.39.2025.07.24.07.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 07:52:02 -0700 (PDT)
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
X-Inumbo-ID: c28b110a-689d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753368722; x=1753973522; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqFBGRr4fOoMxhS+P+Do8kLQYaYx6l/Suo2Wx4RjsFo=;
        b=TJRYjxBIZBy/b0w0uiPnSLTnB2brgPBk+uwxQg/PPCfFviQHxo7clFUeEK5f7XbKnP
         Uvm51/7w0WnEg5wDotwWWjVKBoPdzYSNUXXuyej+pNSHRFcPvpkUTvXcs8kfR11vJJsa
         tKLcquQlLm8bm3q9pbzxokZ8ZsK1XQdzFqQWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753368722; x=1753973522;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqFBGRr4fOoMxhS+P+Do8kLQYaYx6l/Suo2Wx4RjsFo=;
        b=P8RZjxZ1jFnfj/Qy7S58zU1SYtIILj0hmycEHaTaD11qvE24EtKPI2VL3jSZrYIeed
         3PTuX/wdT5w9AFRz71bsbo1aoCQ4LNLzdh3akc0OMTbdJyVaw2gbOzGST3c6G1Q61thS
         sFaSfk3S7919Wt77AklMK/96EZe6mjFipxQGrjgGFvUS/EFiRs3979oJFT+QCHfBQGot
         U3u2E1qmGIzbKbvD6+ZKNXSDgvNk61BnEjhj4cuwh2QJy2dJgsgfs05J54y8BOb3vKHj
         87qYgOlySiDNBQCLjnXb8HQznPI4JQY1kndLQxhcCBO9+DSmfeOgoWFHg/rjjnfJhyA2
         Cy4w==
X-Gm-Message-State: AOJu0YyYeSxHI7aywwuo1pXJP6u+SOj3cBS6qC6ND3XUH3qOXGLIKoLe
	lSRp6tZU/zdBEYJRAGt5fOBvHrOF53XlpaXnrhMsg+di9iSg0yKVvmflxClXIDEvwMo=
X-Gm-Gg: ASbGncuf+ZvtJvE4DXZlG5P1L0MB3gNByOadSYZRJ0vvsNWrLU172xPHmhMZ8WUen5m
	5bPnZx9LnOQ6BpZyyVKf2Cpbwv0Tu3n2x9GfGWCnfJMzwnue2ZuxZiZyeAitJI5QhPMnu1JF9LX
	Rnd5Qd70cktHXizR3gK/0wDWRY4mNQ9e5t+CDvwHn4fw/FqbM3vVLbA21LAZNnKHUvHacCHlDPT
	knAefjP9cX7B5eAE6ydhWReJdvLtXoLUCR6o0K3GwUQK4QQKqZ3N5sdmxiMZTLvUtX9Du8Ytw20
	gQfB0uS1yNUXZ6hBzOkZD0P/Uk2Rc7RP4Ay3w2P1PdYxHYBWyAqXaw7fsu/HjwrC3+QFXuGPIOh
	5px8hg7bzJeSBoVhvAzbxuMmXry7jRpgxwdYr0PDPqy0A2WokjaWKwDtKhjQPOq4gEw==
X-Google-Smtp-Source: AGHT+IE62SLoBgX3Jj//gAyEms1y2nPrUCy8Zen3PkCScbGcLb9qGo7+y/yD3XJC1nIhbZprH8F03w==
X-Received: by 2002:a5d:5f86:0:b0:3a5:8934:493a with SMTP id ffacd0b85a97d-3b768f04518mr5750969f8f.44.1753368722432;
        Thu, 24 Jul 2025 07:52:02 -0700 (PDT)
Date: Thu, 24 Jul 2025 16:52:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v8 7/8] vpci/msi: Free MSI resources when init_msi() fails
Message-ID: <aIJIkZ6KKY37utNE@macbook.local>
References: <20250724055006.29843-1-Jiqian.Chen@amd.com>
 <20250724055006.29843-8-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724055006.29843-8-Jiqian.Chen@amd.com>

On Thu, Jul 24, 2025 at 01:50:05PM +0800, Jiqian Chen wrote:
> When init_msi() fails, current logic return fail and free MSI-related
> resources in vpci_deassign_device(). But the previous new changes will
> hide MSI capability and return success, it can't reach
> vpci_deassign_device() to remove resources if hiding success, so those
> resources must be removed in cleanup function of MSI.
> 
> To do that, implement cleanup function for MSI.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

