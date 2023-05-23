Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC79E70DA41
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 12:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538392.838287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1P7L-0003cI-8j; Tue, 23 May 2023 10:19:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538392.838287; Tue, 23 May 2023 10:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1P7L-0003aQ-61; Tue, 23 May 2023 10:19:47 +0000
Received: by outflank-mailman (input) for mailman id 538392;
 Tue, 23 May 2023 10:19:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BCIw=BM=kernel.org=broonie@srs-se1.protection.inumbo.net>)
 id 1q1P7J-0003aK-S1
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 10:19:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 551d9682-f953-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 12:19:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E39526299B;
 Tue, 23 May 2023 10:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C28C433EF;
 Tue, 23 May 2023 10:19:33 +0000 (UTC)
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
X-Inumbo-ID: 551d9682-f953-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684837181;
	bh=Hw4JvCY5c+o4xH0G4/ilqKI5AiMs+w7Ev9t6iQW4VSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oF2yAr9oIBfEhw1WDj0+q079mjfRIQXD6lWaXj8yNXAn1n4z5I3T3WlcM2TNAp7BF
	 3+mepvSeWgLSFPGRpuTo+CmYRAec4PvQfzIorMGn6yyibuLZ+uMHnKEPKbGU/cqsEL
	 HIGrssrbPot9AwfgDePO4CWvJXLEo2uEycOdlIOPtFLlMGIpRPahL70lwHpFEa+/X0
	 VMbLgxkGmQ2R6F7FOqgy2ab4kG5KRr2d+OOQm9hFDt2oSgWdT83u8H5GBi+RujDc0e
	 O4ePjS+L2NzuJecudp/Eshc86kg5/RUvBP1TJO5lUtLG1gH6E0FDVmMY2aqUv7Oz66
	 lyfVOGhf/Vr2A==
Date: Tue, 23 May 2023 11:19:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch V4 33/37] cpu/hotplug: Allow "parallel" bringup up to
 CPUHP_BP_KICK_AP_STATE
Message-ID: <7377ca00-cb66-430f-9c97-55c60bf5d40e@sirena.org.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.240231377@linutronix.de>
 <4ca39e58-055f-432c-8124-7c747fa4e85b@sirena.org.uk>
 <87bkicw01a.ffs@tglx>
 <2ed3ff77-c973-4e23-9e2f-f10776e432b7@sirena.org.uk>
 <87wn10ufj9.ffs@tglx>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Folw/pFEu4pCxXPv"
Content-Disposition: inline
In-Reply-To: <87wn10ufj9.ffs@tglx>
X-Cookie: Beware of low-flying butterflies.


--Folw/pFEu4pCxXPv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 23, 2023 at 01:12:26AM +0200, Thomas Gleixner wrote:

> Let me find a brown paperbag and go to sleep before I even try to
> compile the obvious fix.

That fixes the problem on TX2 - thanks!

Tested-by: Mark Brown <broonie@kernel.org>

--Folw/pFEu4pCxXPv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRskzEACgkQJNaLcl1U
h9BsgAf9GF4VsHf+jkaRuKOvlac1rE2bFEpVYeMuNf6KbqeD4odFEYIAUQA+YDLK
cQfMclu7qJPPej3ztYBbyVR+3mXH9m+tx5c784FHFJnEyG4Fz5bbVGEBLlcT+PCQ
AIM3pioDp3hHXcHZFKw8MyT/3VII4gf4yGIsw/rtWZZgPOvk0a1G3nctOClgwrqm
asYtDEGLWUnXYKNWNv5dqfCq7olIGl+y4R3mn9KobyW13YvPEmn9uhHz7WuOGHrI
XeXeNgg92QVhmIrSrSbLU+lUrxTqdNNE1CBav+R6fS0nmwNoKdMqgdlZok0toOUw
PoCHQ6x7O7dUMlMoIsrUsIcDOSqrdw==
=lXgK
-----END PGP SIGNATURE-----

--Folw/pFEu4pCxXPv--

