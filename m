Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F079C8CF
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 09:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600073.935665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfyGX-0004AI-2O; Tue, 12 Sep 2023 07:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600073.935665; Tue, 12 Sep 2023 07:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfyGW-000480-VK; Tue, 12 Sep 2023 07:56:56 +0000
Received: by outflank-mailman (input) for mailman id 600073;
 Tue, 12 Sep 2023 07:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujIf=E4=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qfyGV-00047u-Nv
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 07:56:55 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc37ed2-5141-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 09:56:53 +0200 (CEST)
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
X-Inumbo-ID: efc37ed2-5141-11ee-9b0d-b553b5be7939
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694505411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZzsYmunWoWHA/NB9KeL0vau4Ff6jwKnSaJSTsEsMFI=;
	b=S7QWiDE9Krb1twjTFimpubo5KJV71t+/H/lLh9a9//CJv1Pk5E2zPAzOSNwCExA+jO4Ze/
	FksO8K2WD7EcQKmu/+vaiTiZzuZoGugNZdpoB8ltocPzt4Iabf/qrpijTdLibt6+h4EPkH
	eQieygqQSrV4JURUoRBr2DYAw/L5xKBTR5ZjthDgWdABOg0kXW52Neg2y2uQL2VbDV4bvF
	JVrqB5gbGmwbMeLbBOHwlNRaSYqo61vkt39fABbshk0i+WnrgOE/byavgrWdtp48wz2dG7
	mMm9hYHGp+/OPtikzCuxVVzK0RJm5tLb0U5XF6PKmOm4+65J7IyMOqPkhD2xBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694505411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZzsYmunWoWHA/NB9KeL0vau4Ff6jwKnSaJSTsEsMFI=;
	b=sHcLMxiNyH2zbR2CciNb39UpzU7j/5dbeWCZwKx1Rz6VPmaS6eD6WCjFnFH61uPt3BLHXJ
	O/6KOwEm0XOF7iBg==
To: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, "committers@xenproject.org"
 <committers@xenproject.org>, Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
In-Reply-To: <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
 <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
 <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com>
Date: Tue, 12 Sep 2023 09:56:51 +0200
Message-ID: <874jjz3juk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11 2023 at 19:24, Andrew Cooper wrote:
> Furthermore, cursory testing that Thomas did for the Linux topology work
> demonstrates that it is broken anyway for reasons unrelated to ACPI parsi=
ng.
>
> Even furthermore, it's an area of the Xen / dom0 boundary which is
> fundamentally broken for non-PV cases, and undocumented for the PV case,
> hence why it's broken in Linux.
>
> Physical CPU Hotplug does not pass the bar for being anything more than
> experimental.=C2=A0 It's absolutely not tech-preview level because the on=
ly
> demo it has had in an environment (admittedly virtual) which does
> implement the spec in a usable way demonstrates that it doesn't function.
>
> The fact no-one has noticed until now shows that the feature isn't used,
> which comes back around full circle to the fact that Intel never made it
> work and never shipped it.

OTOH it _is_ used in virtualization. KVM supports it and it just
works. That's how I found out that XEN explodes in colourful ways :)

Thanks,

        tglx


