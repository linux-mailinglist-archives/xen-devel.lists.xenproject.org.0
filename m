Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F234A6EDA9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 11:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926271.1329141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1Vj-0005u1-SZ; Tue, 25 Mar 2025 10:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926271.1329141; Tue, 25 Mar 2025 10:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx1Vj-0005sX-Oo; Tue, 25 Mar 2025 10:27:55 +0000
Received: by outflank-mailman (input) for mailman id 926271;
 Tue, 25 Mar 2025 10:27:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Gn6=WM=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1tx1Vi-0005sR-80
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 10:27:54 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cede4a6a-0963-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 11:27:52 +0100 (CET)
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
X-Inumbo-ID: cede4a6a-0963-11f0-9ea3-5ba50f476ded
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742898471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bvl32OvnPLRYSLXsLJD3K8ubXhDmR8NyKqSawYdGMGU=;
	b=GlB1XmtBcJzrR/EujG1DcxuA7GSuw8ztFlhOAfHTpW18x4tuITiexuxuxWMRjViF59p7Ts
	Q0WJKTzWxNhFOWCGCfvFG8bywkIZyKvEulLAE4j8J+UHdULxVLa+DgAfELJ6iueGaVLEtY
	eHPixsxZ+WEuc4blT5gxAkNd7Pz5prQImkJcqCrdNVZ706TR/Xy4N4/VaG+xf+9Ipqd5xI
	JECGdEvNBe33JEoKh3Femg0RcO6k076a8OfUXFfkKWZXxGXzty9Q1dOGC/kNQL5cI4bzMh
	K9qKiyVv++xK59IaoDxbQbk589UwE0EJ9N3ensrAQAwcRvmBusSLx2kj3Oa9Kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742898471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bvl32OvnPLRYSLXsLJD3K8ubXhDmR8NyKqSawYdGMGU=;
	b=IQtOMNjvK2eZQPfrHHpxBU1R9ZHHsOc49/SwQ6rT6QsZ59ArWrRfX08DcAm7emFuXfy01b
	shG3B2ECVR92IsBA==
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Bjorn
 Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
In-Reply-To: <Z-KDyCzeovpFGiVu@macbook.local>
References: <20250320210741.GA1099701@bhelgaas>
 <846c80f8-b80f-49fd-8a50-3fe8a473b8ec@suse.com>
 <qn7fzggcj6qe6r6gdbwcz23pzdz2jx64aldccmsuheabhmjgrt@tawf5nfwuvw7>
 <Z-GbuiIYEdqVRsHj@macbook.local>
 <kp372led6jcryd4ubpyglc4h7b3erramgzsjl2slahxdk7w575@jganskuwkfvb>
 <Z-Gv6TG9dwKI-fvz@macbook.local> <87y0wtzg0z.ffs@tglx>
 <87v7rxzct0.ffs@tglx> <Z-KDyCzeovpFGiVu@macbook.local>
Date: Tue, 25 Mar 2025 11:27:51 +0100
Message-ID: <87sen1z9p4.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25 2025 at 11:22, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 25, 2025 at 10:20:43AM +0100, Thomas Gleixner wrote:
> I'm a bit confused by what msi_create_device_irq_domain() does, as it
> does allocate an irq_domain with an associated msi_domain_info
> structure, however that irq_domain is set in
> dev->msi.data->__domains[domid].domain rather than dev->msi.domain,
> and doesn't override the default irq_domain set by
> pcibios_device_add().

The default irq domain is a parent domain in that case on top of which
the per device domains are built. And those are private to the device.

The XEN variant uses the original global PCI/MSI domain concept with
this outrageous domain wrapper hack. A crime committed by some tglx
dude.

> And the default x86 irq_domain (set by pcibios_device_add()) doesn't
> have an associated msi_domain_info.

It does not need one.

Thanks,

        tglx

