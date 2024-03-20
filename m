Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5103A88168D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 18:25:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696060.1086629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzfs-0002bY-5B; Wed, 20 Mar 2024 17:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696060.1086629; Wed, 20 Mar 2024 17:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzfs-0002ZM-1T; Wed, 20 Mar 2024 17:24:24 +0000
Received: by outflank-mailman (input) for mailman id 696060;
 Wed, 20 Mar 2024 17:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmzfq-0002ZG-3E
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 17:24:22 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afe7d836-e6de-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 18:24:20 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4140aadfe2eso435415e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 10:24:20 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c190e00b004146bcdde06sm2768051wmq.6.2024.03.20.10.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 10:24:19 -0700 (PDT)
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
X-Inumbo-ID: afe7d836-e6de-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710955460; x=1711560260; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+GSCW/et+/cuSC+C66lOB512CEMQEN1JIwWBev3CIlU=;
        b=tdV9aNYdPLyYboWWzRAkLCkX0EPnOH9Yx0gcgON93lxOCiuAqRyR41nZ3Monw7zfMk
         GHH3V9Kvn/SWgpZGAkHB2ar8ViYEBIk56tEWUTpoAs5WU+8OF3cb31kIh6lqwgiY8XPA
         Bz1YCSBBVwwnViJBK2amlPswZld6ys2Nkqz+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710955460; x=1711560260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GSCW/et+/cuSC+C66lOB512CEMQEN1JIwWBev3CIlU=;
        b=fD9ltznNlY0avJmnNytsNr+bFLBOI41TSxe6CS911QSfKZkMFY3RuUEmRIRuOEy5wo
         YYMptC8QDUQT2SmpkuQ6ND8iZpapTt7VXHH1uJIxdXKl0lHfVCtOvwHS6PUXaDG6P1zl
         Y9r4KlH5qiOj/XhbCtiAD0XLMkuPgxFI1rnUZf9I2CLSoPYDYir/ZoFdRyY2BDlc8Y+/
         n6oMvPt8mzMoW1enP0GRuZsAnS29Mgd3ViI51JNOqb5cYx4+URNHicTE42wlFFRRKqWb
         Dn5nAjdhAv5R12IhVuP1XlLeu34i9gVEgax6GL+Qgpg9dlC82I2R97KRiUzbaKBoWgHm
         SgFA==
X-Gm-Message-State: AOJu0YyxQ7GB5I8rpR7I549MU063Uxu+nwGaKGUt3KcgOFwCdVi3Kvje
	mRe7iSNEePfRZ0T7EdSQo7iZDoV64ESl7f01y99l6KVBFIHVV9caGtTflOea/ZI=
X-Google-Smtp-Source: AGHT+IFw7+JTWMwVL4XS7qMBohGuGZb734jJDXyLUx14qrZ56OLgJAbm4GT6bGl1ywjGm2yXn5ImkQ==
X-Received: by 2002:a05:600c:4f53:b0:414:ed4:e959 with SMTP id m19-20020a05600c4f5300b004140ed4e959mr8991505wmq.41.1710955459859;
        Wed, 20 Mar 2024 10:24:19 -0700 (PDT)
Date: Wed, 20 Mar 2024 18:24:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH 33/36] make-flight: Keep using buster for L2
 guest in nested tests
Message-ID: <ZfsbwjQkSmToBLKW@macbook>
References: <20240318165545.3898-1-anthony.perard@citrix.com>
 <20240318165545.3898-34-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318165545.3898-34-anthony.perard@citrix.com>

On Mon, Mar 18, 2024 at 04:55:42PM +0000, Anthony PERARD wrote:
> When starting the installation of the L2 guest, L0 kills L1. Switching
> the L2 guest back to Debian Buster works fine, so do that to prevent
> regression in the test.
> 
> Part of the logs from the host L0:
> 
> > domain_crash called from arch/x86/hvm/vmx/vvmx.c:2770
> > Domain 3 (vcpu#0) crashed on cpu#4:
> > d3v0 vmentry failure (reason 0x80000021): Invalid guest state (2)

Hm, I guess we need this as otherwise the changes themselves won't
past the self-push gate, but this is just masking a real issue.  I
would be tempted to (after the switch to bookworm has gone in) revert
this and force-push it into osstest, so that the failure is visible.

Thanks, Roger.

