Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D34B3B825
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 12:07:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101045.1454263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urw14-0000sG-Gr; Fri, 29 Aug 2025 10:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101045.1454263; Fri, 29 Aug 2025 10:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urw14-0000p3-Cd; Fri, 29 Aug 2025 10:07:30 +0000
Received: by outflank-mailman (input) for mailman id 1101045;
 Fri, 29 Aug 2025 10:07:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urw12-0000ox-Tz
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 10:07:28 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7dfce3d-84bf-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 12:07:28 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ceb9c3d98cso655407f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 03:07:28 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3d1007c0dc8sm942461f8f.53.2025.08.29.03.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 03:07:26 -0700 (PDT)
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
X-Inumbo-ID: f7dfce3d-84bf-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756462047; x=1757066847; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cja5uepLUr685RliZg40g4SHqLYWV+HJIgOEWNIsO1k=;
        b=k60DmLVGfLeVdx/AQK95tlMbPcCvZem+j3xgjqBmTNi9VpL5u/kF8nrbvpwXY6AjZY
         7aykDuk8FOfuNQQUrrw+AMioeetUEaRqbLgEdV/4OnDjRsRMkhSf4O7BVCnoWrpwaWwh
         GwD3ZrlIwHYvRMQPzBK4E08bO53S6WnT3Byo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462047; x=1757066847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cja5uepLUr685RliZg40g4SHqLYWV+HJIgOEWNIsO1k=;
        b=ojFonWrovewdtsBeyzelC5E18wRWViGfvrvinVcGGWvl13qStD88gbYtEcsS7j9PbA
         ET2rcz+OUVlNHcKzjB3snItiHZoLQF3+0Eab94RW0UlCPJu57YOIocPthzh2k+85oZ/U
         7hVTCpFELIYhpnz3Te9VTlVgK7DLOtyMGbMiFVfSp6DfCK2ebygGqJ3pKMvNUBetpz3O
         wkOtCao/vXcrkoVywjEBOc7/l2rf9BpcLizXBsKMlok8b0yFYiOXTTGq/NN6cM6AJ8VS
         G53YBW+HD8uBESEPVzlY9u7XaPDpt2H93ATXENyIn1lqj5PUUDGcNVoSAbe91k6cPW7n
         /L2A==
X-Gm-Message-State: AOJu0YzgBxhDy7GrZfEwDuAS8Dw2F+1BEsbFeQvQMBD+DFs99GZLNAaJ
	GtApx7dSlsFMdmuL2W+OBOv6PzU/CMPufLVfLg5M1mbg9kS8/QfwptNtAFnuMRJNWos=
X-Gm-Gg: ASbGncsnX6QbJgm4vYLM04QoajEG93/BMpNu2zHAvGuQ/Fn6EtXStdQFbiWmYPmOltx
	cwCSLOj+DzEiDOxQSCd3KH6+sR3zV2HYaDa5GVGz2nDlW9tQpyT30cbLdVhFRj6bPnT2P3RFc40
	cQa1ZcDJvgLzBVG4d8QYT8jyCbme2pkn2nXhmEJ5QhQAriABuzocBkUeSAxIhWSIUQn5VKq+HjI
	EcEUEf8QG8LGfv2Bj/7lWwPAUTuSQ7rV8zgtn/bxjF55/ICvM+5NVLUxH7nLjmuQCwivKeZe78q
	RenXX7ENHNX+JR62FErcR60xTrvIPAnKE087E0xlDB8ZouiULTSoAoiHdE6B43R3sBVshBi7h9X
	80O3GnSnkBCnZ5LB4B5HpT2NlJXOSokAoih8lUxd0a9giryXx0/uev5c5Hc/+SWhkBCpC0VQFLM
	x+
X-Google-Smtp-Source: AGHT+IGOFlKXLgCK8yuJP4J4NoTXDovIT3bczXPFkv891lY1TUhg6w+F+EJcIUjz31SL16SoERoxug==
X-Received: by 2002:a05:6000:21c8:b0:3c9:39f3:7af9 with SMTP id ffacd0b85a97d-3c939f37eadmr7562307f8f.9.1756462047440;
        Fri, 29 Aug 2025 03:07:27 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:07:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v11 1/5] vpci: Use cleanup to free capability resource
 during deassign
Message-ID: <aLF73jSo3IUUGFJ_@Mac.lan>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808080337.28609-2-Jiqian.Chen@amd.com>

On Fri, Aug 08, 2025 at 04:03:33PM +0800, Jiqian Chen wrote:
> As cleanup hook of all supported capabilities will be implemented in
> follow-on changes, so to pre-call hook in vpci_deassign_device(), and
> the capability specific clean open-code in there will be removed by
> follow-on corresponding capability changes.
> 
> Since vpci_deassign_device() and vpci_init_capabilities() require
> different cleanup actions, add a boolean parameter to cleanup hook
> to distinguish them.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

I think it's missing:

Requested-by: Jan Beulich <jbeulich@suse.com>

With the newline below added:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I can do it on commit.

Thanks, Roger.

