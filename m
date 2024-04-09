Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2573D89DC2B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 16:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702469.1097507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCQ6-0005jQ-FT; Tue, 09 Apr 2024 14:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702469.1097507; Tue, 09 Apr 2024 14:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCQ6-0005h0-Ca; Tue, 09 Apr 2024 14:25:54 +0000
Received: by outflank-mailman (input) for mailman id 702469;
 Tue, 09 Apr 2024 14:25:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SUYQ=LO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ruCQ5-0005g2-Qn
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 14:25:53 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 116900b9-f67d-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 16:25:52 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d8a2cbe1baso10649471fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 07:25:52 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b00416b8da33e6sm909364wmo.37.2024.04.09.07.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 07:25:51 -0700 (PDT)
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
X-Inumbo-ID: 116900b9-f67d-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712672751; x=1713277551; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CioAqJ1gxh4c09XZ8q69ctIP0mj1slIgm+tSMRVePcM=;
        b=O9zNz4WpVxCVFpGMlQ3HiLeBSr9iLuXHyjJiM7DcCmgGUdV5ULEb9hFTs9Y1SFK7o+
         pOyhQkwwYWEFS720dVNRRmHAp0q4ZB+KsJYtSwmIuq6PBFK5C/NLCWhJ2Qq+01CovEnj
         bFccjaTj76hA6BRWBfq0jp+baVAO69v4E5KeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672751; x=1713277551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CioAqJ1gxh4c09XZ8q69ctIP0mj1slIgm+tSMRVePcM=;
        b=skJJv46XL/9Ol+29imJyGZVoejac9fO4sjI1IIwXKmGLq5jizJgkZTxEt6b7AJnzI9
         hrCd1KWmHglOCve7HU751sWDVZyVoXMwEv129tkeqRX7Za80Z/uKpr8EO+vEkxxJjgLp
         VpCFB+Lehp+Dfm/lPKIVZRBavo+2ZkUrQMibeghQZi1l7S7Pip/W0REfLTUkAUTBEUJa
         EuHB8Tp2Ad1PcxkSHQZAQTEZqrWCPD6nekQFwuFoJKT84+4N8SX7BFM4jTvlhS1yZFx3
         vFo/RQjXV18vwTx3EzZHh2zI30Wtg23d4vePKNHewRQ/O/qO4s7O60tsOBhH32YoyOS8
         OOIw==
X-Gm-Message-State: AOJu0YymDmE+DlhAPUGGUvkgndhFK2cthIdWQlQRKrWHL73dVSsWclso
	KQ8HeGCQLbqfVs2OyVMxz8RdA/evSh+B2GcEBVn4DNE71X59OOfofYzvIEUoBPnukp7oeDYMP1S
	S
X-Google-Smtp-Source: AGHT+IEBGgQTEHvzA2RqTeEvJslz7fQ7BhX0U+9W746yvHVR7ZdBROkLTGZ0G+nYTM2bXu6v5LB2Sw==
X-Received: by 2002:a2e:7204:0:b0:2d5:9bd4:4496 with SMTP id n4-20020a2e7204000000b002d59bd44496mr9251364ljc.50.1712672751400;
        Tue, 09 Apr 2024 07:25:51 -0700 (PDT)
Date: Tue, 9 Apr 2024 16:25:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/cpuid: Don't expose {IPRED,RRSBA,BHI}_CTRL to PV
 guests
Message-ID: <ZhVP7iTFg9-HB_tv@macbook>
References: <20240409141105.125969-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409141105.125969-1-andrew.cooper3@citrix.com>

On Tue, Apr 09, 2024 at 03:11:05PM +0100, Andrew Cooper wrote:
> All of these are prediction-mode (i.e. CPL) based.  They don't operate as
> expected in PV context, and need emulating to have the intended behaviour.
> 
> Fixes: 4dd676070684 ("x86/spec-ctrl: Expose IPRED_CTRL to guests")
> Fixes: 478e4787fa64 ("x86/spec-ctrl: Expose RRSBA_CTRL to guests")
> Fixes: 583f1d095052 ("x86/spec-ctrl: Expose BHI_CTRL to guests")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

