Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA948A506A0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 18:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902590.1310583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpsl8-0003YC-2t; Wed, 05 Mar 2025 17:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902590.1310583; Wed, 05 Mar 2025 17:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpsl7-0003Vy-Vf; Wed, 05 Mar 2025 17:42:17 +0000
Received: by outflank-mailman (input) for mailman id 902590;
 Wed, 05 Mar 2025 17:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCKF=VY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tpsl7-0003Vs-CO
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 17:42:17 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d6ebb76-f9e9-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 18:42:15 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-abf5f4e82caso797217466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 09:42:15 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac1eec40e84sm342718966b.23.2025.03.05.09.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 09:42:15 -0800 (PST)
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
X-Inumbo-ID: 2d6ebb76-f9e9-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741196535; x=1741801335; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwDaxoFH2BoMMg8UQH85VxgmfjvGf01JMpmfHHoXsjA=;
        b=dvyEmiARehedRHnqQleNLNUql1N3FIH1ijn1mQj8qceZT8xUyiHSKlZ3xlYAKZELBY
         XjCfg6awpCvpxCzD81uAwdYGLrwutgn1ozq5eH3uX6J1Oc62lTZDZhVYvtuQXcsX6t+r
         GD76G/KjPiMVZny+Z15IMGxMD+vkMsuvRSUoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741196535; x=1741801335;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwDaxoFH2BoMMg8UQH85VxgmfjvGf01JMpmfHHoXsjA=;
        b=K4CsjNefwNmKX+2UL8kV2VdzVRslb6BOH5zk5pJ0kGXTTbQ7yRWDzuTqgVht65bg5m
         8T+bNxRy1qgeRKVoMfk/U+d8vpW3rhxiHIlBW3GWzxIIvjQu0mvBcnltGXoKpqddZC/0
         9y5zsmPYDCUF6FKw2+iEKCKSRtv1SoOeLucwqJvusdEghyiwxyTIXq9e4H7tJZ4IvSbg
         OAZIF7jJUPuuSHhdZUw9a8Bj8oVGl8JUmIByCAhtDGwSjxUbEyi8DXCLFgxb1ufg0ez8
         1k/bG/WoFJjC/JDmr1jUAMJU0VFBAeiabw+ahkRWsNBv/YEdZOPngKib+mzBeHa6urUJ
         hYCA==
X-Forwarded-Encrypted: i=1; AJvYcCU4LqupeTgm5dfMY/V6rlYwFnwvQxN5KCTeW1H4+fvwD6epwKnh9rV67ThmC2E0IzxXLSpnqPDcWyI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxUT9SNgR5vpj6QuIp2tanp5z4HjNWE0Y/4CadXXfCOINcd2EhM
	ssiK8BoVSX2IRM3gmRnrmrVVBk3O04DhT51gvVlx+lp22Z++kvH2wVu3rmR2m1dLpx1WTK4qmTm
	3
X-Gm-Gg: ASbGncvy9/O3QzAhHBqIBhivkFbLs4je3jeISrGkI/PlMTOcjasbQkq9hIqlXfIGXdL
	Fp9CE8675pxW4rAGHSmzlipD6VYDjybFVaqphfO0vbwq+rg0UbVnq1rtPvzL3XS7EtwRzj1Dhkq
	qPQb2Cnj+yeZCbtWx5NQ9vhGu8F7K8bdgIUbL2t+9YE2p/9fsHqHWMctGb8kqTTlUjhAFBzmCVr
	ls8icyviicrWU4wUmVpjm1Tm86fnkN1n3FqaU8gl21vCkiUK2Bf+7ntCm6HKoENyOnHK4Epu2Z3
	8y1NPDygTP9FM4nHOowl0CO3ZJTf1gUJ+kh3bg+lX15F2MK4E1OuQS0=
X-Google-Smtp-Source: AGHT+IGTLUcUNHHwzAI31wxKg4auMapScysR0LuIW8k+3A6hOJ4x282hW2Tzwk8LK37VtU/FShZuhw==
X-Received: by 2002:a17:907:72ca:b0:abf:fb78:6742 with SMTP id a640c23a62f3a-ac20e1db221mr433716566b.44.1741196535299;
        Wed, 05 Mar 2025 09:42:15 -0800 (PST)
Date: Wed, 5 Mar 2025 18:42:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 0/3] x86/dom0: be less restrictive with the Interrupt
 Address Range
Message-ID: <Z8iM9tSD6O2r6RBp@macbook.local>
References: <20250219164840.94803-1-roger.pau@citrix.com>
 <db3113a1-4cae-4d2b-8840-645f56af3c51@suse.com>
 <Z8hhKa-KdTbmp6rE@macbook.local>
 <03dfb2ad-50de-406d-bdd0-41352c21f82b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03dfb2ad-50de-406d-bdd0-41352c21f82b@suse.com>

On Wed, Mar 05, 2025 at 03:54:56PM +0100, Jan Beulich wrote:
> On 05.03.2025 15:35, Roger Pau Monné wrote:
> > On Wed, Mar 05, 2025 at 03:27:18PM +0100, Jan Beulich wrote:
> >> On 19.02.2025 17:48, Roger Pau Monne wrote:
> >>> Hello,
> >>>
> >>> First two patches are preparatory changes to reduce the changes required
> >>> in patch 3.  I would have wanted those to go in 4.20 to fix the issues
> >>> on Lenovo Thinkpads, but it's too late now.
> >>>
> >>> Thanks, Roger.
> >>>
> >>> Roger Pau Monne (3):
> >>>   x86/dom0: correctly set the maximum ->iomem_caps bound for PVH
> >>>   x86/iommu: account for IOMEM caps when populating dom0 IOMMU
> >>>     page-tables
> >>>   x86/dom0: be less restrictive with the Interrupt Address Range
> >>
> >> I'm uncertain whether to take this and "x86/pvh: workaround missing MMIO
> >> regions in dom0 p2m" for backport. The sole Fixes: tag is in patch 1 here.
> >> Thoughts?
> > 
> > At least the ones here would be helpful for the reported Lenovo
> > Thinkpad issue.  The PVH p2m addition would be nice IMO.
> 
> Are the ones here sufficient to deal with that issue? IOW iasn't the other
> 2-patch series also necessary?

For a PV dom0, yes, the patches here are enough.  For a PVH dom0 you
also need "x86/pvh: workaround missing MMIO regions in dom0 p2m".
Given that we now officially support PVH I think we would need to
backport the latter, to have parity between PV and PVH dom0.

Thanks, Roger.

