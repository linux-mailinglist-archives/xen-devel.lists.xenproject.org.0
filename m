Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA9078A00F
	for <lists+xen-devel@lfdr.de>; Sun, 27 Aug 2023 17:46:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591183.923557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaHw5-0004fz-QJ; Sun, 27 Aug 2023 15:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591183.923557; Sun, 27 Aug 2023 15:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaHw5-0004cd-MF; Sun, 27 Aug 2023 15:44:21 +0000
Received: by outflank-mailman (input) for mailman id 591183;
 Sun, 27 Aug 2023 15:44:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zlf5=EM=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1qaHw4-0004cX-Ht
 for xen-devel@lists.xenproject.org; Sun, 27 Aug 2023 15:44:20 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94c937da-44f0-11ee-8783-cb3800f73035;
 Sun, 27 Aug 2023 17:44:18 +0200 (CEST)
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
X-Inumbo-ID: 94c937da-44f0-11ee-8783-cb3800f73035
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1693151056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRQEINcYa2yNYEV4sab13106Suw4qQaydMPfTPHS8R4=;
	b=Q5evRsFkrTRQZkx4xBJCOs1vcqNYweuw1mnmhlR398Is39arbD2EurHpUbLinkq22B7q+d
	r2iV2/fA9u2PnJOZQmw/QYxpWkS3hQmtC4/Z+9AVsGFyrnWLFuVa2u53fjgZjam7h5GYCv
	co79dw4l2mYs2p3VwPnjpnSUU1QD/0wnF6W/rJr0gUuFWSqBiBpf/RhtxF10w3WTCERS+0
	w9wJvCNfUegmJLVPWMLlsfpVs0so7WHwK4OxznQIK/ts61K1rHkWRMyQaN9LtsxfJgOTk3
	tpJQUGRsjtoP0N6HY72Cswgo4o+t54/qtaT6YvLM5wUUfQx5GZUj+wyyBOaZOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1693151056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRQEINcYa2yNYEV4sab13106Suw4qQaydMPfTPHS8R4=;
	b=0TdOoIzfPeWMwI/NJHmRVLSEvZMxgXj+AvA1mxqq3dA7rBQwuOpmqTqAU3LjON8MEm5nDw
	mmRf4xOGjbGkOPCA==
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?utf-8?Q?Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Marek
 =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org, Simon Gaiser
 <simon@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
In-Reply-To: <26c50dc7-adf3-dbf1-253b-ce333d31911c@suse.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
 <298af911-f4f0-165d-c493-90407d649945@citrix.com>
 <cfc853dc-0512-da20-5bf3-968a38d7a759@suse.com>
 <635f0055-7001-f68c-9274-6c078d07a22a@citrix.com>
 <26c50dc7-adf3-dbf1-253b-ce333d31911c@suse.com>
Date: Sun, 27 Aug 2023 17:44:15 +0200
Message-ID: <87jztga3sg.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23 2023 at 14:56, Jan Beulich wrote:
> On 23.08.2023 11:21, Andrew Cooper wrote:
>> In the spec, exactly where you'd expect to find them...
>>=20
>> "OSPM does not expect the information provided in this table to be
>> updated if the processor information changes during the lifespan of an
>> OS boot."
>
> I don't think this tells us anything about the ID not possibly changing.
> It merely tells us that OSPM is not expected to parse this table again
> (IOW firmware updating just this table isn't going to be enough). IDs
> possibly changing is expressed by (a) the "if the processor information
> changes", and (b) the next sentence, forbidding them to change while the
> system is asleep: "While in the sleeping state, logical processors must
> not be added or removed, nor can their ... ID or ... Flags change."
>
>> Which is wordsmithing for "Some firmware was found to be modifying them
>> and this was deemed to be illegal under the spec".
>
> That's your reading of it; I certainly don't infer such from that
> sentence.

The APIC/X2APIC description of MADT specifies flags:

Enabled        	If this bit is set the processor is ready for use. If
		this bit is clear and the Online Capable bit is set,
		system hardware supports enabling this processor during
		OS runtime. If this bit is clear and the Online Capable
		bit is also clear, this processor is unusable, and OSPM
		shall ignore the contents of the Processor Local APIC
		Structure.

Online Capable	The information conveyed by this bit depends on the
		value of the Enabled bit. If the Enabled bit is set,
		this bit is reserved and must be zero. Otherwise, if
		this this bit is set, system hardware supports enabling
		this processor during OS runtime.

This is also related to SRAT which defines the proximity of memory to
processors at boot time with a similar set of flags.

Also 8.4 says:

  Each processor in the system must be declared in the ACPI namespace in
  the \_SB scope. .... A Device definition for a processor is declared
  using the ACPI0007 hardware identifier (HID). Processor configuration
  information is provided exclusively by objects in the processor
  device=E2=80=99s object list.

  When the platform uses the APIC interrupt model, UID object values
  under a processor device are used to associate processor devices with
  entries in the MADT.


MADT is the authoritative table for processor enumeration, whether
present or not. This is required because that's the only way to size
resources, which depend on the possible maximum topology.

Otherwise you'd end up with a CPU hotplugged which is outside of the
resource space allocated during init.

Thanks,

        tglx


