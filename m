Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ol4Dazr+WkLFQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 15:07:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B84CE29C
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 15:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300676.1575197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKFV2-0005Yx-AO; Tue, 05 May 2026 13:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300676.1575197; Tue, 05 May 2026 13:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKFV2-0005Wo-7F; Tue, 05 May 2026 13:07:44 +0000
Received: by outflank-mailman (input) for mailman id 1300676;
 Tue, 05 May 2026 13:07:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <x1917x@gmail.com>) id 1wKFV0-0005Wi-CE
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 13:07:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKFUy-003m9J-7S
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 15:07:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <x1917x@gmail.com>)
 id 69f9eb99-e002-0a2a0a5209dd-0a2a450ae0b2-30
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 15:07:41 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <x1917x@gmail.com>)
 id 69f9eb9d-56b3-0a2a450a0019-d155802bb571-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 15:07:41 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488b150559bso36034755e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 06:07:41 -0700 (PDT)
Received: from LinuxLaptop ([45.157.112.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8ebb2f32sm354717735e9.13.2026.05.05.06.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 06:07:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Organization:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777986461; x=1778591261; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uZyeoOGTVQj6a8td6Tno3xdBfq8sQCcXmrNE1dZcq+o=;
        b=famMYVMzKLraJZ+lZ01ktAza8otxa5xZ/u1RBvKJs557W0ctuBbhxCa9eWNLFfqUo1
         Y56CT9L68sUkebEfrEBAuYzNCwgF/yyBx53RzUHjpzpenUDN+xCHpNTSX3gHnBbkEuAw
         pDRPJfv8O0NqCZCaN0ovIGWyRmepkrkZcq4koWAbRMbszob6+Gqr7WnMwTCSPivHTJY+
         HtrGAUNN8pW7/TB5MmL/U7g6eXr8C72AGh8E3MRdHigRYKaGnSLlgp0KkN5Vn5HvLsYX
         QEoQFmFgco1XzZ7FmvA0vl9ocWOaCwlaXAR1IpGaIHtaUM/Mdyv6NACPrOEhq5mFXPhB
         ZDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986461; x=1778591261;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZyeoOGTVQj6a8td6Tno3xdBfq8sQCcXmrNE1dZcq+o=;
        b=oImurmS08v8faVgG5CC2TGGpSbeoU/2CY5YwvYXSoTIohEOW3ogaw8soz/Ep6qX48I
         uKysvjME7viWrUIMC5KmHb8QHu64Boc/wPQtfkWEKhD3hc5rxs+gDk5GArsw0XNYXMPY
         PKQE30qMYUQ3VyTBqZ67nWToYczyRfa1UvUgbKe7jI1aOJDzhYyY0PUa3e0ynSo4pMUs
         v0gwIaMGmYf7rN4AWfjuqzC4uYpbKfv4WWbLN+JGkL+WBQxImsKJz8ZATcaw0kXjGQgt
         gVf213Ur6627jgnwyn8mOtKqJF9bZ4ZIvhtcFuhhQwiD6hNgugw8vc7osWMMIGY1dnpv
         +izg==
X-Forwarded-Encrypted: i=1; AFNElJ+FSiU5/fvmubTOGaqZgnnroRzirkxBlr1QYddzxbGLBceXz58d5mwY1uQeEViKrcAwjw4FucbB0Ls=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJtvjJpjz43YuNF6/G1nMAWUive565Jcnh8/PsM2ItoxiShhRC
	Kki96icsBEylJVY5lAqX7QZUaQ3/07qCnQT3iLHdWwm6Dn9OCKG/hMCQ
X-Gm-Gg: AeBDiev6M35kpWPytkouYEaQ2i6xygcbZv6Ymntbi5d11yHGaOylqPfsPcQHJInefWy
	nmbC8NfppvIqjij9Rnlmu+YpmIQhONjSFDR2qso0vkdVeDjEOgN2X7otPSSOHBAxB3rETslDNFx
	Jyrt6zlGueRvxSE6ksraNgi9KC5YNkKNdF7/LvVoLdK9xkAgKASQ3eETMOV2zL8dAFVJ4lce+U7
	EA4WSJdwCEhdjeLgmn16mEtNrgY8PI1VFXh5+YtQaF+SjJ3yzTY8NPFzwWruViIYvzWVEN6SO5R
	uonfitZxzy1cDJ3EA4Ss0E3amVTSENOh0+4qebxvCLw1id4FLlyGjRIGBePBxSfvxwQsr1wekN/
	cRjDYH1YXoAAxWIscr5jEFI36llC6j8sHULlph/41Y6QLXlBYtyZQOT7Gc73qVERVuUSJ2zmcEe
	r3EIgP1FhkgwYneW/PiJmpy7MdzTc=
X-Received: by 2002:a05:600c:c119:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-48a9866cdd9mr190548005e9.22.1777986460878;
        Tue, 05 May 2026 06:07:40 -0700 (PDT)
Date: Tue, 5 May 2026 15:07:36 +0200
From: Alexey G <x1917x@gmail.com>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Thierry Escande <thierry.escande@vates.tech>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 00/17] Q35 initial support for HVM guests
Message-ID: <20260505150736.5419a55f@LinuxLaptop>
In-Reply-To: <afBmWSFsyrwy_Ru1@macbook.local>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
	<afBmWSFsyrwy_Ru1@macbook.local>
Organization: none
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1777986461-4415A8B7-F19A85BB/0/0
X-purgate-type: clean
X-purgate-size: 3799
X-Rspamd-Queue-Id: 8D5B84CE29C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[x1917x@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[x1917x@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On Tue, 28 Apr 2026 09:48:41 +0200
Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wrote:

>On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
>> This series introduces initial Q35 chipset support for HVM guests,
>> based on the patchset at [1] by Alexey Gerasimenko.
>>=20
>> Basic support means that this patchset allows to start an HVM guest
>> that emulates a Q35 chipset via Qemu and implements access to PCIe
>> extended configuration space for such devices emulated by Qemu.
>>=20
>> Support for PCIe device passthrough is not implemented yet. This is
>> planned but implies modifications in the hypervisor and the
>> firmwares, mainly for the support of multiple PCI buses.
>
>Why do you need multi bus support to expose PCIe capabilities?  I'm
>not seeing the relation between those two.  You could still expose a
>single bus on the MCFG table.

The problem with the PCIe bus is that it's very "topological" by design
- and it always wants a valid hierarchy.

Each PCIe device manifests itself (via its PCIe Capabilities entry)
as either a chipset-integrated device or a regular PCIe endpoint
device, which is the most common case. There are more types IIRC but
these are what we deal with mostly - both for PT devices and
QEMU-emulated ones.

But, being a PCIe endpoint means that the device must have some parent
device. It can be located below a PCIe switch or, in the simplest and
the most common case, below a PCIe Root Port device.

In both cases the 'parent' is a PCI-PCI bridge technically, with the
PCIe endpoint device being located on its secondary bus.

As the Q35 patch series was done with mostly PCIe device passthrough in
mind, this brings the main complication - in order to properly place a
passed through device on the PCIe bus, we need an emulated/real/hybrid
Root Port device.

A much lengthier description is in this patch message:
https://lists.xenproject.org/archives/html/xen-devel/2018-03/msg01197.html

To summarize, we need this 'valid PCIe topology' nonsense just to make
Windows kernel (pci.sys driver specifically) not to discard our PT
device due to checking PCIe bus hierarchy above it.

This limitation was found/confirmed via debugging - luckily, pci.sys
had symbols and the main bad function which was failing had a very
speaking name - something like pcieCheckTopology or similar.

Emulating the "chipset-integrated device" in PT device's PCIe
Capabilities was a simple hack which allowed to bypass the requirement
to have a valid PCIe hierarchy with multiple buses. But the proper
future direction is implementing emulation of Root Ports or PCIe
switches I guess.

>> The PCIe MMCONFIG area is configured by hvmloader and its base
>> address and size are set in Xen using a new pair of hypercalls
>> HVMOP_get|set_ecam_space.
>
>I guess I will see how that looks like in the series, but the setting
>of the ECAM region would better be done by the toolstack.  Setting it
>in hvmloader is possibly not the best placement, because it doesn't
>run for PVH guests (and we will want ECAM support for PVH at some
>point), and there's also a vague plan/intention to get rid of
>hvmloader even for HVM guests eventually.

This is the situation where the difference between HVM and PVH might be
very problematic I'm afraid. HVM guests assume full freedom over the
IO/MMIO resources setup inside their sandboxed environment.

It's not just Windows reallocating PCI BARs to its liking, but also
spans to the emulated chipset's resources. In worst case we could have
MMCONFIG reinitialization implemented even in Intel's Q35 drivers
installed inside an HVM guest. Fortunately, this is not what I remember
was the case, but in theory Q35 driver could have done things like this.

