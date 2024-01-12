Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FEE82C28A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 16:08:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666919.1037862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOJ8w-0005PN-Ts; Fri, 12 Jan 2024 15:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666919.1037862; Fri, 12 Jan 2024 15:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOJ8w-0005Ni-Q1; Fri, 12 Jan 2024 15:08:22 +0000
Received: by outflank-mailman (input) for mailman id 666919;
 Fri, 12 Jan 2024 15:08:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvc=IW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rOJ8v-0005Ls-EQ
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 15:08:21 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b72e393-b15c-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 16:08:19 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e55c885d7so34529385e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jan 2024 07:08:19 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c4fc800b0040e549c77a1sm10019671wmq.32.2024.01.12.07.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 07:08:18 -0800 (PST)
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
X-Inumbo-ID: 6b72e393-b15c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705072099; x=1705676899; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3kmJcdzTxEKxmAR5qr7Tx/n1jmkpfBBlDiFIzZ4PYYI=;
        b=GIxcbEAIrquso8GDDiBX/LKa8ydcPhQOy4jSMiKFMlkUKExpdljF7zJNNzmJmJShH/
         ncLyEacD+xt4GKsS3plOEQWazOZyiBAMbnWUEYI7kxCUqr9mwwUuXY9+VTVfK4yzr/DB
         4wKyQitIKXEzQY6mOu1NwugBWAzu1Ub8N4jjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705072099; x=1705676899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kmJcdzTxEKxmAR5qr7Tx/n1jmkpfBBlDiFIzZ4PYYI=;
        b=CIM4tT6LhcH43FKPgMAIkERUkDvkZn7Qf+Tg1hcg5lA6u8D6WtT3+IarspeE5JeAq/
         b4BnDpnm8nr3SE12/0FCMOQI1FfjB8sEfHmBRdSmClq/yMP/0opQwhsWChzRU6X9l/uX
         p7awQixTmPsYLRXHMTYFrjojlHROcsg9XUSkavyL3mvOSGWBWiAVhnykDFP4CZSie+1T
         4cdgtyTMos3JcUWbA0mJLetSD6UjXfhXI2/I0s/35rLfSewoHlEuJOg6qCg7L3OIRA5+
         h9irBH1q6wAM2lIQPmdG9rTBEN99xXPGHYjvaE0tpTCUrkpHmOlcff8Sg4lG3pLoDqgi
         RrKQ==
X-Gm-Message-State: AOJu0YzPZU+oecj8+Pk/yn7f72IjQ4tXSolBAur8PeuGpScxi978Y7Uh
	phX50Vz5WT53rkbG33Is2lzfnJSFdWJICXIOAWECPfCDVas=
X-Google-Smtp-Source: AGHT+IHr2h5OkzPC7fmc+zvDXBweqosROPDHkucTut4qxfJTFuKh5exYAGu7lIGAp11FBgwmiHSoAg==
X-Received: by 2002:a7b:c7c5:0:b0:40e:5fa7:db4d with SMTP id z5-20020a7bc7c5000000b0040e5fa7db4dmr823107wmk.154.1705072098901;
        Fri, 12 Jan 2024 07:08:18 -0800 (PST)
Date: Fri, 12 Jan 2024 16:08:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: don't expose XENFEAT_hvm_pirqs by default
Message-ID: <ZaFV4TY0oLTDNV_J@macbook>
References: <20240110124202.62843-1-roger.pau@citrix.com>
 <7e325111-5b36-4b31-aed8-f5f11390b504@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e325111-5b36-4b31-aed8-f5f11390b504@perard>

On Fri, Jan 12, 2024 at 02:40:35PM +0000, Anthony PERARD wrote:
> On Wed, Jan 10, 2024 at 01:42:02PM +0100, Roger Pau Monne wrote:
> > The HVM pirq feature allows routing interrupts from both physical and emulated
> > devices over event channels, this was done a performance improvement.  However
> > its usage is fully undocumented, and the only reference implementation is in
> > Linux.  It defeats the purpose of local APIC hardware virtualization, because
> > when using it interrupts avoid the usage of the local APIC altogether.
> > 
> > It has also been reported to not work properly with certain devices, at least
> > when using some AMD GPUs Linux attempts to route interrupts over event
> > channels, but Xen doesn't correctly detect such routing, which leads to the
> > hypervisor complaining with:
> > 
> > (XEN) d15v0: Unsupported MSI delivery mode 7 for Dom15
> > 
> > When MSIs are attempted to be routed over event channels the entry delivery
> > mode is set to ExtINT, but Xen doesn't detect such routing and attempts to
> > inject the interrupt following the native MSI path, and the ExtINT delivery
> > mode is not supported.
> > 
> > Disable HVM PIRQs by default and provide a per-domain option in xl.cfg to
> > enable such feature.  Also for backwards compatibility keep the feature enabled
> > for any resumed domains that don't have an explicit selection.
> > 
> > Note that the only user of the feature (Linux) is also able to handle native
> > interrupts fine, as the feature was already not used if Xen reported local APIC
> > hardware virtualization active.
> > 
> > Link: https://github.com/QubesOS/qubes-issues/issues/7971
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Should we have an entry in the changelog about this patch?

Yes, indeed.  I always forget.  Will send v3 on Monday with you RB and
the changelog.

> With the patch, we will need to regenerate the golang binding, at least
> on commit.
> 
> Otherwise, patch looks fine:
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks!

