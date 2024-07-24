Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2CA93B10E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 14:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764184.1174531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbSo-0003gF-0d; Wed, 24 Jul 2024 12:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764184.1174531; Wed, 24 Jul 2024 12:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWbSn-0003el-Ti; Wed, 24 Jul 2024 12:51:25 +0000
Received: by outflank-mailman (input) for mailman id 764184;
 Wed, 24 Jul 2024 12:51:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMDA=OY=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1sWbSm-0003ed-CC
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 12:51:24 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dc9c837-49bb-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 14:51:22 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5a3458bf858so5278827a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 05:51:22 -0700 (PDT)
Received: from EMEAENGAAD91498. ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5aa1f02c9fesm1919210a12.67.2024.07.24.05.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 05:51:21 -0700 (PDT)
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
X-Inumbo-ID: 6dc9c837-49bb-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721825482; x=1722430282; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bStCLYTus3sUb8LHZDmlK5qUszEkzPQbeQ+3+ABNKZ4=;
        b=JfsIHeDfzmGoFI7j1XWdQwW/bIeiKHeNi/+KtXcyRCCBb8gnuG5wk6HSm9LiC6n9LI
         toOmCD1BXVQHFTmhyu1yAzjF79zLwxhdyx2CmoGmPLHic4kAXzLHAUvJ3rjQbOQ+9BSA
         q0aUBI8Lh0YGu8fvpCnC0Z28VStFShw4z8RsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721825482; x=1722430282;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bStCLYTus3sUb8LHZDmlK5qUszEkzPQbeQ+3+ABNKZ4=;
        b=XNVOSkE4nctbdLgBhH8qv1bxgnUOVRt/XSjguTxwG7nQF9Qxjivh253BOAEnM43+Ce
         V02YKegSFrPFX2rBKHgvUqRosAmLt2IJPBxmvDoujiZ1gGxpWJRMEDSzh49Bc5gJ3RYP
         Pnm9pzDvsbLm2NF3K0AGFi5wv8tC0u2fa9GzCwi/2Rh8VVN2CMnELRp4Nx+8RvHoKjRM
         e3bFRjo9ZrhbJjcQVYh7am0UpO2nA9cawc7fBYqbT+oq4SRUULNGqO/8o5xKiz2IEzA6
         KfVE8NoZdyPyyKMslKyFL/KceD4rS8LVhUgQcRxl7pRUGoDdGg58330TWKxkTv2dJ2YT
         IBXw==
X-Gm-Message-State: AOJu0Yw57KQme1GVqopfRDWPzsW1sp30Qr0wOFAp5qQeJ3mg89hol4ah
	2589K3TmwHtVcWA1etYpsvLCmZi1WCaOX6dqPluMFo4xGhuUz5DBnhZhnqUw7xQ=
X-Google-Smtp-Source: AGHT+IHYvbTsUIUTFRNPZwhYznq/YATReREQ3mKomTsPJ2xymzkceu2CXOmFnBjeQSHEgQ7hyBuUCA==
X-Received: by 2002:a50:bb02:0:b0:5a2:2ecc:2f0 with SMTP id 4fb4d7f45d1cf-5aaa38a6297mr1903881a12.1.1721825481432;
        Wed, 24 Jul 2024 05:51:21 -0700 (PDT)
Message-ID: <66a0f8c9.050a0220.879ba.9673@mx.google.com>
X-Google-Original-Message-ID: <20240724125116.xjjycidsgt7vvcnc@EMEAENGAAD91498.>
Date: Wed, 24 Jul 2024 13:51:16 +0100
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: Re: [RFC XEN PATCH v2] x86/cpuid: Expose max_vcpus field in HVM
 hypervisor leaf
References: <fa24cd3b232e8865eb6451e5f7af9cd203ce52ab.1721224079.git.matthew.barnes@cloud.com>
 <12e2c7b2-6d0b-4427-ac30-257bfea2aeab@suse.com>
 <669fa8ad.170a0220.843bc.3a17@mx.google.com>
 <a08d0d27-1d7b-4453-807c-3670cb4f05aa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a08d0d27-1d7b-4453-807c-3670cb4f05aa@suse.com>

On Wed, Jul 24, 2024 at 07:42:19AM +0200, Jan Beulich wrote:
> (re-adding xen-devel@)
> 
> On 23.07.2024 14:57, Matthew Barnes wrote:
> > On Mon, Jul 22, 2024 at 01:37:11PM +0200, Jan Beulich wrote:
> >> On 19.07.2024 16:21, Matthew Barnes wrote:
> >>> Currently, OVMF is hard-coded to set up a maximum of 64 vCPUs on
> >>> startup.
> >>>
> >>> There are efforts to support a maximum of 128 vCPUs, which would involve
> >>> bumping the OVMF constant from 64 to 128.
> >>>
> >>> However, it would be more future-proof for OVMF to access the maximum
> >>> number of vCPUs for a domain and set itself up appropriately at
> >>> run-time.
> >>>
> >>> GitLab ticket: https://gitlab.com/xen-project/xen/-/issues/191
> >>>
> >>> For OVMF to access the maximum vCPU count, this patch has Xen expose
> >>> the maximum vCPU ID via cpuid on the HVM hypervisor leaf in edx.
> >>>
> >>> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
> >>> ---
> >>> Changes in v2:
> >>> - Tweak value from "maximum vcpu count" to "maximum vcpu id"
> >>> - Reword commit message to avoid "have to" wording
> >>> - Fix vpcus -> vcpus typo
> >>> ---
> >>
> >> Yet still HVM-only?
> > 
> > This field is only used when the guest is HVM, so I decided it should
> > only be present to HVM guests.
> > 
> > If not, where else would you suggest to put this field?
> 
> In a presently unused leaf? Or one of the unused registers of leaf x01
> (with the gating flag in leaf x02 ECX)?

I could establish leaf x06 as a 'domain info' leaf for both HVM and PV,
have EAX as a features bitmap, and EBX as the max_vcpu_id field.

Is this satisfactory?

Matt

