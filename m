Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA21AA95E6
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 16:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976162.1363385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBwqX-0004DM-Ov; Mon, 05 May 2025 14:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976162.1363385; Mon, 05 May 2025 14:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBwqX-0004AE-Lz; Mon, 05 May 2025 14:31:05 +0000
Received: by outflank-mailman (input) for mailman id 976162;
 Mon, 05 May 2025 14:31:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E8Me=XV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uBwqW-0004A8-1r
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 14:31:04 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91e9432e-29bd-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 16:31:03 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7398d65476eso3556958b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 07:31:03 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7405902144fsm7008388b3a.100.2025.05.05.07.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 07:31:01 -0700 (PDT)
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
X-Inumbo-ID: 91e9432e-29bd-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746455461; x=1747060261; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eMZ3ZgtWdz2WrPotARKXu8189+8YqmclI8t9PsACamo=;
        b=FZpKPeUj/EYRSZPAOk02Ip4iNiTq1O1CLZZYOhiby1EY2sSNORhQmQNvVlnZ0QvvVL
         pFIlN3lQMfF9XRgfrnR86QW1ivt8//WQSMBdrqm8XaSyu00vBo3n24Jhjn/AiW/Nt/1V
         O16G/UWmPRD/KIank/68Sw6DGfXM5tLRLgw0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455461; x=1747060261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMZ3ZgtWdz2WrPotARKXu8189+8YqmclI8t9PsACamo=;
        b=YWkkunXBuvGRArgFB9cvUvSDZbNomu7O3A+gMVU1RFG8Qfvo9cfgHzw4hrgKGkoH4P
         mZmIKsgwT6h4O2+DvMfMwP5I1DcHoG/QmlOomNS9fx58tTPCXchWfDSemH+v2Cf7VguD
         Glmk7uoBdJ1cNvTBitR5IXI2FXGFD0wBam5RMvmXX6EQ/6hRghLnp7NRllXG1Cm2dYvk
         XNJL/knvRdihpKMDN2WwaW/RBKIsq0amk1+a+n4RHMJszCU3EQGduIbrXLPKtQRtyDrQ
         WF3PTQmBuQa4WDR4NP27Ppv6zSO4UhIJHd1+FO8WkvEv6Npd5VTrKgl3XgqpoAWZH8kj
         s96g==
X-Forwarded-Encrypted: i=1; AJvYcCW7wsH4FiAWczO0WDwVUCY1UdTPdgGVnpYImVKrw+IWp5DqOiYXb0CS+zC3Cp1YuwjRuIlcbUvZA6g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzE11h9olTtta58OI2jtnxVbhqYIUsCeErdmbssyBCXr4onAs98
	6bLLJC/0LazsVHgUk73VNNNXHsMcombclioFq8LD8GT73VL32DsW9PK7W0h7C2c=
X-Gm-Gg: ASbGncvKnzRIn2VYKis8DRrXQsMWbOnIK1su3ondRNSh6QqlyhUmQ42lLjGDF928AlG
	sAGs8YciFuj+PcEePh8EV6YOhENMxWQWImiYUFkFOliipM+wWhj5ujbSVFqsoerWlgI1vDvnYdu
	8Zo5PDAUFaJeyqxXcuQhdL71kFMeKCt+igqJ+5harad3wKtXDNBTQvXA9q7eshjSibyCumLWA5j
	pftgBe8gjb/TS/UVIETfpQSMDuhd63Eb5U9kKaPNe9u4w6cMoL8f3gi5ZMU5HVT+aAXQsxLZZxJ
	Qep1oWtG0/Nih2/YbjGCRX3Z99aIams1RbcD0wylqUrDYg==
X-Google-Smtp-Source: AGHT+IGIDRUgZ+dWKY2YUeYkt0lw9lZQGeJK+U9vLSa7M/qWQUNvqcBiyb6BRudVp6jslHjoB6lpmg==
X-Received: by 2002:a05:6a00:2e9d:b0:734:26c6:26d3 with SMTP id d2e1a72fcca58-74049198213mr29870873b3a.5.1746455461503;
        Mon, 05 May 2025 07:31:01 -0700 (PDT)
Date: Mon, 5 May 2025 16:30:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
	agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
Message-ID: <aBjLoM_ttxqftzlp@macbook.lan>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
 <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
 <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <aBiVkw2SXJHxpieh@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBiVkw2SXJHxpieh@mail-itl>

On Mon, May 05, 2025 at 12:40:18PM +0200, Marek Marczykowski-Górecki wrote:
> On Mon, Apr 28, 2025 at 01:00:01PM -0700, Stefano Stabellini wrote:
> > On Mon, 28 Apr 2025, Jan Beulich wrote:
> > > On 25.04.2025 22:19, Stefano Stabellini wrote:
> > > > From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> > > > 
> > > > Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> > > > addresses to firmware or co-processors not behind an IOMMU.
> > > 
> > > I definitely don't understand the firmware part: It's subject to the
> > > same transparent P2M translations as the rest of the VM; it's just
> > > another piece of software running there.
> > > 
> > > "Co-processors not behind an IOMMU" is also interesting; a more
> > > concrete scenario might be nice, yet I realize you may be limited in
> > > what you're allowed to say.
> > 
> > Sure. On AMD x86 platforms there is a co-processor called PSP running
> > TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
> > pass addresses to it.  See drivers/tee/amdtee/ and
> > include/linux/psp-tee.h in Linux.
> 
> We had (have?) similar issue with amdgpu (for integrated graphics) - it
> uses PSP for loading its firmware. With PV dom0 there is a workaround as
> dom0 kinda knows MFN. I haven't tried PVH dom0 on such system yet, but I
> expect troubles (BTW, hw1 aka zen2 gitlab runner has amdgpu, and it's
> the one I used for debugging this issue).

That's ugly, and problematic when used in conjunction with AMD-SEV.

I wonder if Xen could emulate/mediate some parts of the PSP for dom0
to use, while allowing Xen to be the sole owner of the device.  Having
both Xen and dom0 use it (for different purposes) seems like asking
for trouble.  But I also have no idea how complex the PSP interface
is, neither whether it would be feasible to emulate the
interfaces/registers needed for firmware loading.

Regards, Roger.

