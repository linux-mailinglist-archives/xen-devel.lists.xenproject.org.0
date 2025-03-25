Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70E8A6EB24
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 09:11:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926111.1328965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twzNQ-00038p-UU; Tue, 25 Mar 2025 08:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926111.1328965; Tue, 25 Mar 2025 08:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twzNQ-00037N-RO; Tue, 25 Mar 2025 08:11:12 +0000
Received: by outflank-mailman (input) for mailman id 926111;
 Tue, 25 Mar 2025 08:11:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Gn6=WM=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1twzNP-00037H-Ff
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 08:11:11 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5cca12c-0950-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 09:11:10 +0100 (CET)
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
X-Inumbo-ID: b5cca12c-0950-11f0-9ea3-5ba50f476ded
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742890269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gBlYuYPxuiW4f/YH3m2JiPO9h8/st5bDHO18kaoaxWU=;
	b=xuu9Wv6psqJzPFfn8nMntVCSCH9iODJd96EJ94rTd8BA3tpxSRI7FC+Z8px+3BfOtKWwz4
	EQNAYMOijbgOFFS7+rH/VfTxOn3FxTl5i4udS+twC9fl5AXSJ702DONji18Nfzufxt3P8k
	hAJMo9n336BIMnf84oX/JXqSA0j0lKk6zhJuprnlWpwoGcrlYJRF1G/qysdW9NOceQ8IWz
	AxC3zXeAMYHxivQJvG3CSp+tbm0DA65C8MoZL07GOeZp7AaIlLeLgXZ217wNE9p4f98eNQ
	FWWjzyRHu5AOK9111zSqok0p+97KrvNlYKC5GAOPqqYwJuqrraND0jAhG6UZfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742890269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gBlYuYPxuiW4f/YH3m2JiPO9h8/st5bDHO18kaoaxWU=;
	b=zawn//iFOlyQCFAWgDgHOmxcNuu0Ak6JkpKA/7TZ4dwphNSIIW3fFEFxxZVI3iFGgo16uU
	kGLzpS+oUoMNZnBg==
To: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Daniel Gomez
 <da.gomez@kernel.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Bjorn Helgaas
 <helgaas@kernel.org>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH v3 3/3] PCI/MSI: Convert pci_msi_ignore_mask to per MSI
 domain flag
In-Reply-To: <Z-Gv6TG9dwKI-fvz@macbook.local>
References: <20250320210741.GA1099701@bhelgaas>
 <846c80f8-b80f-49fd-8a50-3fe8a473b8ec@suse.com>
 <qn7fzggcj6qe6r6gdbwcz23pzdz2jx64aldccmsuheabhmjgrt@tawf5nfwuvw7>
 <Z-GbuiIYEdqVRsHj@macbook.local>
 <kp372led6jcryd4ubpyglc4h7b3erramgzsjl2slahxdk7w575@jganskuwkfvb>
 <Z-Gv6TG9dwKI-fvz@macbook.local>
Date: Tue, 25 Mar 2025 09:11:08 +0100
Message-ID: <87y0wtzg0z.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24 2025 at 20:18, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 24, 2025 at 07:58:14PM +0100, Daniel Gomez wrote:
>> The issue is that info appears to be uninitialized. So, this worked for =
me:
>
> Indeed, irq_domain->host_data is NULL, there's no msi_domain_info.  As
> this is x86, I was expecting x86 ot always use
> x86_init_dev_msi_info(), but that doesn't seem to be the case.  I
> would like to better understand this.

Indeed. On x86 this should not happen at all. On architectures, which do
not use (hierarchical) interrupt domains, it will return NULL.

So I really want to understand why this happens on x86 before such a
"fix" is deployed.

Thanks,

        tglx

