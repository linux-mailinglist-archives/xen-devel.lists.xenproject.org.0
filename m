Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4AEA9C8FD
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967872.1357593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IFO-0003sj-UG; Fri, 25 Apr 2025 12:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967872.1357593; Fri, 25 Apr 2025 12:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8IFO-0003py-RN; Fri, 25 Apr 2025 12:33:38 +0000
Received: by outflank-mailman (input) for mailman id 967872;
 Fri, 25 Apr 2025 12:33:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y1QO=XL=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1u8IFM-0003pd-Ji
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:33:37 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e0219cc-21d1-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 14:33:35 +0200 (CEST)
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
 id 1u8IF4-0000000C2S5-1fLP; Fri, 25 Apr 2025 12:33:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id DA9983003C4; Fri, 25 Apr 2025 14:33:17 +0200 (CEST)
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
X-Inumbo-ID: 7e0219cc-21d1-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z0kssRXr0Jmr2iLuPqygq8fHDe3P+7Q6+7xMZ7CRFpA=; b=n62i0DvKUkkS19M6Grw/IA6BJM
	6eax7WEzMDhdsLLdBaVpyql0sL3uwAA/S4ABBYyHfp8Tx/iU0ee0EuTw7NJfGf9EI8UsjXrlSl0sS
	02tBYqSgzmjI/Kny3gI739/JKlgl+9wGdEidVTiMFctgk47RLsTlqNTkCUR+iW8cVDyF62mXAMwh5
	XkywTMBNuRYpIwM9+ushQW73ekmtzH4pzyRk9psYN+bzsnJD1auXiTevc+ivI+Y1ZKlYKr7ewsVRG
	jovxOw3NEqLfi+p+LosTspxc/ZhCArckwjJxCRVQhZyFjxgfcqmpAHeIJnZG6UgRJMQ7uJJh6ZqZe
	G7VOYhcg==;
Date: Fri, 25 Apr 2025 14:33:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Xin Li <xin@zytor.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, acme@kernel.org,
	andrew.cooper3@citrix.com, namhyung@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, wei.liu@kernel.org,
	ajay.kaher@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com,
	seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com,
	kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com
Subject: Re: [RFC PATCH v2 21/34] x86/msr: Utilize the alternatives mechanism
 to write MSR
Message-ID: <20250425123317.GB22125@noisy.programming.kicks-ass.net>
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-22-xin@zytor.com>
 <b2624e84-6fab-44a3-affc-ce0847cd3da4@suse.com>
 <f7198308-e8f8-4cc5-b884-24bc5f408a2a@zytor.com>
 <37c88ea3-dd24-4607-9ee1-0f19025aaef3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/MHZas7e8A04P/yf"
Content-Disposition: inline
In-Reply-To: <37c88ea3-dd24-4607-9ee1-0f19025aaef3@suse.com>


--/MHZas7e8A04P/yf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 06:05:19PM +0200, J=FCrgen Gro=DF wrote:

> > It's not a major change, but when it is patched to use the immediate
> > form MSR write instruction, it's straightforwardly streamlined.
>=20
> It should be rather easy to switch the current wrmsr/rdmsr paravirt patch=
ing
> locations to use the rdmsr/wrmsr instructions instead of doing a call to
> native_*msr().

Right, just make the Xen functions asm stubs that expect the instruction
registers instead of C-abi and ALT_NOT_XEN the thing.

Shouldn't be hard at all.

--/MHZas7e8A04P/yf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmgLgQUACgkQdkfhpEvA
5LqJKRAAkGelIfMDPEkg613aLM0RL5GIPigFIL9+IaLhypRMpJMp1rKIwy8kLaRd
NwdJ0yX6iqAzFF/AHn3KvVp7MxNCeDWNTXTcCpxuCSB8NoKfph2JduGzhUylWdg3
AhemoMrgzBgwkVVk2mDD2kvewJ0Axr2isfs+ugJLAo+GvKhnV+qJRvSE/FB0V7XV
LC+r1B6ZXIcUBjvYOW2JbRYPW/UDT/LS9CZDWr2pu+A3jJ8vmlOwAb0Yeh3/2yKB
/LdGM2PIII/0x66JaVvZawFSLjeUT18HxLAAh8MDDLgWCiwp+Uk3RzgrnaSj9oC0
6uV/J7czytoK4haaV70zPcWqzZPIurtpgcG9AynaG05VjJ5ARgEG6EFJd91NnbM+
7dZWXM6y1PI6IFuh1ldUJUD3YnEd3VuXAWaYE4aBr63rXaUYuVpAKRUY0NFZmxHw
KGaVmss4AtUGeDBTPMvYyx+d1BTxPiYVeVbLzodtjl/mQPfpne5vlQomBolxd/0a
fkeL0zUZoVgLfndRNVN+dIa2cPWo+BHNNM8tI92aFQ0YrxaTpdSjrOJ0bobnBUch
deYEsdgKUEpUcFZqcp/ox1cc73kPeJ9365RwavrAN8sZIUSs+vvtu36/WIVI12eK
qw6upySrPM0KLVTItTbNxKmS5uvFrc2fDPMAoru3P2Y5VkKPa2Q=
=6Oyb
-----END PGP SIGNATURE-----

--/MHZas7e8A04P/yf--

