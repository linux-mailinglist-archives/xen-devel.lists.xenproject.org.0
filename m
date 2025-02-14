Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86658A35D02
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 12:53:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888750.1298059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiuG4-0001jt-4A; Fri, 14 Feb 2025 11:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888750.1298059; Fri, 14 Feb 2025 11:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiuG4-0001hh-1R; Fri, 14 Feb 2025 11:53:24 +0000
Received: by outflank-mailman (input) for mailman id 888750;
 Fri, 14 Feb 2025 11:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wnsV=VF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1tiuG3-0001f2-0t
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 11:53:23 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a035b0b-eaca-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 12:53:22 +0100 (CET)
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
X-Inumbo-ID: 4a035b0b-eaca-11ef-9aa4-95dc52dad729
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739534001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWEz1ZWdWkion5MIyu8qQHqr+FAKdZJBuw4TfNzpQAw=;
	b=N8QhK/y4dwnmr4ugopa5yoykfbkMb8irN7O3zRSTu/OhAxgGch6PkMzgo5jTSnzvPacPST
	v3jPvkpIUXQS3zrDSU3W3BUS/djaZCd4dnn2t2Y3Md/hao3nIhs+R2LB3Vy1/lHaVJuXEs
	FLpI6P5RnGaeBUaQqCTNSD4hLsjWTXfZIKURDbpzH4NN8PgUcWQryMdczRnRbB3pEepWtJ
	DmBDZnV8fvk1jX1KtjWR+ylmkeBIDzaSYufyW4gslApJDYkdL87HhwfwXIjC+qXcCxl0e9
	fr7b0WjrkvdcgA3Qsb94A3uHLxp/2J4H4a3M9ntP9i+e0euRUfxd+Qzmr5SaZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739534001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWEz1ZWdWkion5MIyu8qQHqr+FAKdZJBuw4TfNzpQAw=;
	b=EwcgCNJzpir6XiFKZvbnPTawfCwZpEXo80qK9V1v65lBdmcVUHhzp/u/6wMu7bLxiQYVJ6
	6J0zFKm64ELGmNDQ==
To: Bjorn Helgaas <helgaas@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-pci@vger.kernel.org, Juergen Gross <jgross@suse.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 3/3] pci/msi: remove pci_msi_ignore_mask
In-Reply-To: <20250205151731.GA915292@bhelgaas>
References: <20250205151731.GA915292@bhelgaas>
Date: Fri, 14 Feb 2025 12:53:20 +0100
Message-ID: <87y0y8ivyn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05 2025 at 09:17, Bjorn Helgaas wrote:
>> Albeit Devices behind a VMD bridge are not known to Xen, that doesn't me=
an
>> Linux cannot use them.  By inhibiting the usage of
>> VMD_FEAT_CAN_BYPASS_MSI_REMAP and the removal of the pci_msi_ignore_mask
>> bodge devices behind a VMD bridge do work fine when use from a Linux Xen
>> hardware domain.  That's the whole point of the series.
>>=20
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> Needs an ack from Thomas.

No objections from my side (aside of your change log comments).

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

