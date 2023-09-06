Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46578793C7D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 14:20:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596549.930480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrWS-0002RV-VV; Wed, 06 Sep 2023 12:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596549.930480; Wed, 06 Sep 2023 12:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdrWS-0002PD-S1; Wed, 06 Sep 2023 12:20:40 +0000
Received: by outflank-mailman (input) for mailman id 596549;
 Wed, 06 Sep 2023 12:20:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0AC=EW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qdrWS-0002P7-3u
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 12:20:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca39ffed-4caf-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 14:20:39 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-402c1407139so37079005e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 05:20:39 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f12-20020adffccc000000b003143c9beeaesm20236502wrs.44.2023.09.06.05.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 05:20:38 -0700 (PDT)
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
X-Inumbo-ID: ca39ffed-4caf-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694002839; x=1694607639; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7r6qLFbuKfuXSK53o2v5XRzXtH2c14K8H3kGtNCpkL4=;
        b=hhjUhB7dXCZntWcXTLjy3M6iOteL3mc6cBegKXOeckyaLApyJxaDLp7wpOqjzu6ZM5
         sEX4VA01QddG9G6/8BKzeMYPmCryz5CIZfKwh3e5Ps5LB2wWovTr14Hi5getxLORemwE
         AI+fcBYsbFLjG6Uk3+SOt405oGdosp0cyX19s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694002839; x=1694607639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r6qLFbuKfuXSK53o2v5XRzXtH2c14K8H3kGtNCpkL4=;
        b=E55cVpgUxS+eEKiy7RyLc++LYFCNMaqVvozjOufax3eqXDA49c/lKKEk6cMxc3N7pg
         +CeYUapJfr13HKTL6MJHL0JnRBtQqbLKp5lYywX5G8J21rDPhUQyyZ8aPIOty/6LEvV3
         y3wB9vxEWibIQjhPgxr0Bgn5YhIYBvySwruMuQz20XpSavnx7UXkwOiXU/bPKNPqKHEM
         74sm3QObZUMYjarqA8Wkxr61ut592TjdOJRcG9ZD+01ghXIwCjYYq7WNWQR4jBM/DizQ
         Wo/DXhoPu83wxquZRiLJwknXZW8viCJEukI5jZDJF9/IeW7biLQ9cBxYSw46cIlYCh73
         v4aw==
X-Gm-Message-State: AOJu0YxqUcMYw7JNIUr1WJqgZxhX+cA0JJyaWZZ4N4oIhPGnRchNkOLd
	8Wp06Azb2/iqJEneHF8AFjd0CQ==
X-Google-Smtp-Source: AGHT+IECYCmsP+8mkPKuydlPccByQeCJJkw+wp53sAR58aPQhMG5ehbgMjBGuknQB/5ci/MaH+jANQ==
X-Received: by 2002:a05:600c:11c1:b0:401:b204:3b84 with SMTP id b1-20020a05600c11c100b00401b2043b84mr2144060wmi.40.1694002838646;
        Wed, 06 Sep 2023 05:20:38 -0700 (PDT)
Date: Wed, 6 Sep 2023 13:20:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, jbeulich@suse.com,
	stefano.stabellini@amd.com, vikram.garhwal@amd.com
Subject: Re: [PATCH] tools/xl: Guard main_dt_overlay() with
 LIBXL_HAVE_DT_OVERLAY
Message-ID: <6097b8cf-d4a3-4b8f-8bdc-e4f69f00f785@perard>
References: <20230906083614.25315-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230906083614.25315-1-michal.orzel@amd.com>

On Wed, Sep 06, 2023 at 10:36:14AM +0200, Michal Orzel wrote:
> main_dt_overlay() makes a call to libxl_dt_overlay() which is for now
> only compiled for Arm. This causes the build failure as reported by
> gitlab CI and OSSTEST. Fix it by guarding the function, prototype and
> entry in cmd_table[] using LIBXL_HAVE_DT_OVERLAY. This has an advantage
> over regular Arm guard so that the code will not need to be modified again
> if other architecture gain support for this feature.
> 
> Fixes: 61765a07e3d8 ("tools/xl: Add new xl command overlay for device tree overlay support")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

