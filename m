Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3191819CCF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 11:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657606.1026565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFtrb-0001pi-C0; Wed, 20 Dec 2023 10:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657606.1026565; Wed, 20 Dec 2023 10:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFtrb-0001nH-8P; Wed, 20 Dec 2023 10:31:43 +0000
Received: by outflank-mailman (input) for mailman id 657606;
 Wed, 20 Dec 2023 10:31:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFtra-0001nB-1l
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 10:31:42 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f65f4fe3-9f22-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 11:31:40 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33668163949so3385499f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 02:31:40 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 n9-20020a5d4009000000b0033677a4e0d6sm2224452wrp.13.2023.12.20.02.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 02:31:40 -0800 (PST)
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
X-Inumbo-ID: f65f4fe3-9f22-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703068300; x=1703673100; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DPHMfyIt0TH+QSHrLGV+1sxdHdwwCDHNWgRy3zDmDXs=;
        b=OztBI36u+mLBQcUxdH0TgDsVrvzO/SBnzQCLVN9oN1RR8e22gs0YEn4fzQfbB7FRwK
         cqdzPPCqg+6/UIBjJ8tR2RXAIDwTPVeumJX2RoycpUv2dwcpIFDh2kJc43iG6HHzv8VL
         5XX4vb7qbvH463mioEDlT2VL17ajKt62KvmY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703068300; x=1703673100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPHMfyIt0TH+QSHrLGV+1sxdHdwwCDHNWgRy3zDmDXs=;
        b=xQue3Om5EZmSiZd9THOFZKXmBVgCOCW/kuflhkZuMCmJBxss7YTrCA4NU1DqbV51Ic
         PJoUVl1JyHy1f6HFakkSzPnDpcwMT8H4doJjocdcJA407NCO1ZwNk3I68w1QL8/0vlGs
         VYa2dSPt4zg5+FVBHRXR071v/VWHQWPs8dZ5cI767tctwTyHJXP3lki0/yGUxJRrd4AE
         /aEtnWgDqRRXv4AKG1yBEE7/90VOANiOLiTnWZBbRefUYY8NpOc+bhstx1MsSPdgcjMh
         sGNfqmLzCp32SLDkD8vO8PdVTdSss3NBYcDsF20OaOkHK/kPtNdtnDPtyNd4zc2jtBPr
         Hjbw==
X-Gm-Message-State: AOJu0YyXSDmOs+cAqxDAeaZFAryjH0XSgXu//pXj1ysmwJzJKSK/wkcR
	gEl74KZ82WIgxdDLtus+Z3M/hw==
X-Google-Smtp-Source: AGHT+IEJPtlkpRfvXhGS3sEv9n2x4+sQVuayzSF5T5yiisTTntSGMU9J66O1FsG+atdDNxI1inyxZA==
X-Received: by 2002:adf:ef81:0:b0:336:7296:d8d0 with SMTP id d1-20020adfef81000000b003367296d8d0mr651870wro.66.1703068300248;
        Wed, 20 Dec 2023 02:31:40 -0800 (PST)
Date: Wed, 20 Dec 2023 11:31:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 7/7] x86/iommu: cleanup unused functions
Message-ID: <ZYLCiq2XLgSP7ZMo@macbook>
References: <20231215141832.9492-1-roger.pau@citrix.com>
 <20231215141832.9492-8-roger.pau@citrix.com>
 <02a8e90e-dc4b-4fda-a2a7-50c12d356c63@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02a8e90e-dc4b-4fda-a2a7-50c12d356c63@suse.com>

On Tue, Dec 19, 2023 at 05:23:57PM +0100, Jan Beulich wrote:
> On 15.12.2023 15:18, Roger Pau Monne wrote:
> > Remove xen_in_range() and vpci_is_mmcfg_address() now that hey are unused.
> > 
> > Adjust comments to point to the new functions that replace the existing ones.
> 
> And because of this affecting what was done earlier in the series, perhaps
> best if patches 5-7 would be committed together.

By committed together do you mean squashed?

I agree that it would be best if the series is committed in one go,
otherwise the comments in the tree can be inconsistent.

> > No functional change.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

