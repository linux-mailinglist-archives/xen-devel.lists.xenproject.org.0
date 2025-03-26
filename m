Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7E7A716E4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 13:47:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927770.1330510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txQ9c-0001or-Tv; Wed, 26 Mar 2025 12:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927770.1330510; Wed, 26 Mar 2025 12:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txQ9c-0001o8-RC; Wed, 26 Mar 2025 12:46:44 +0000
Received: by outflank-mailman (input) for mailman id 927770;
 Wed, 26 Mar 2025 12:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ly6i=WN=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1txQ9b-0001o2-U9
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 12:46:43 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dbf8e3a-0a40-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 13:46:41 +0100 (CET)
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
X-Inumbo-ID: 5dbf8e3a-0a40-11f0-9ffa-bf95429c2676
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1742993200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dP4pKI9DdiAPAA1Qe115sjRa5UlaNblibaMOzmAshvg=;
	b=n+R1pFPWz9k5ncKoLCDhAwRkDvuwXb/Y1ffN+p/T1xWjVsJ3kdu2IjvnQnkwSqufYpg0DF
	NeBS/zI6LZx5r32u1viZHFL/riinRKvm4CuLI5Tn+9NsF+1OXn2XvpwO8QsRS/+nAMjXaJ
	RPWRI2jP2M6TBQLZ9MrJ+Yygi+e1bsZMS30R3cq0QqIDvtsXXyCwwvHn35CZiVNR+gG4JN
	AO+d19XCP2jp2LBgdalzqdu0TsxQh6Fmg3MxHwaPAqAaKZHSYKmSQbebJpVgu7duIihzKD
	bTv/iWFO8Jyd8ZmyOadTtNmlmY6N4QUCX2JwNdlfVdTaqBdn300MgDjYYim3Xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1742993200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dP4pKI9DdiAPAA1Qe115sjRa5UlaNblibaMOzmAshvg=;
	b=uuFW9Hg6GotTKz4G4HeII+TJyL0F9a12wiePIquBqioqtwID34dHlB3/bSPBp/p8tR7HtD
	XByX1YIPFGJ3MuDQ==
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Roger Pau
 =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>,
 Daniel Gomez <da.gomez@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org, Bjorn Helgaas
 <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] PCI/MSI: Handle the NOMASK flag correctly for all
 PCI/MSI backends
In-Reply-To: <f56cc306-3c80-45ce-9955-f7fd36defa4e@suse.com>
References: <20250320210741.GA1099701@bhelgaas>
 <846c80f8-b80f-49fd-8a50-3fe8a473b8ec@suse.com>
 <qn7fzggcj6qe6r6gdbwcz23pzdz2jx64aldccmsuheabhmjgrt@tawf5nfwuvw7>
 <Z-GbuiIYEdqVRsHj@macbook.local>
 <kp372led6jcryd4ubpyglc4h7b3erramgzsjl2slahxdk7w575@jganskuwkfvb>
 <Z-Gv6TG9dwKI-fvz@macbook.local> <87y0wtzg0z.ffs@tglx>
 <87v7rxzct0.ffs@tglx> <87iknwyp2o.ffs@tglx>
 <f56cc306-3c80-45ce-9955-f7fd36defa4e@suse.com>
Date: Wed, 26 Mar 2025 13:46:40 +0100
Message-ID: <87frj0yn67.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26 2025 at 13:09, J=C3=BCrgen Gro=C3=9F wrote:
> On 26.03.25 13:05, Thomas Gleixner wrote:
>> The conversion of the XEN specific global variable pci_msi_ignore_mask t=
o a
>> MSI domain flag, missed the facts that:
>>=20
>>      1) Legacy architectures do not provide a interrupt domain
>>      2) Parent MSI domains do not necessarily have a domain info attached
>>=20=20=20=20=20
>> Both cases result in an unconditional NULL pointer dereference.
>>=20
>> Cure this by using the existing pci_msi_domain_supports() helper, which
>> handles all possible cases correctly.
>>=20
>> Fixes: c3164d2e0d18 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI do=
main flag")
>> Reported-by: Daniel Gomez <da.gomez@kernel.org>
>> Reported-by: Borislav Petkov <bp@alien8.de>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Borislav Petkov <bp@alien8.de>
>> Tested-by: Daniel Gomez <da.gomez@kernel.org>
>
> As the patch introducing the problem went in via the Xen tree, should
> this fix go in via the Xen tree, too?

I'll queue it up now and send Linus a pull request.

