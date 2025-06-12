Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AFAD7D9F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 23:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013594.1391967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPpX8-0005KS-EX; Thu, 12 Jun 2025 21:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013594.1391967; Thu, 12 Jun 2025 21:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPpX8-0005Hu-Aq; Thu, 12 Jun 2025 21:32:26 +0000
Received: by outflank-mailman (input) for mailman id 1013594;
 Thu, 12 Jun 2025 21:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjr1=Y3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uPpX6-0005Ho-TU
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 21:32:24 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8b45efd-47d4-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 23:32:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AD395629DD;
 Thu, 12 Jun 2025 21:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CD5C4CEEA;
 Thu, 12 Jun 2025 21:32:16 +0000 (UTC)
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
X-Inumbo-ID: b8b45efd-47d4-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749763939;
	bh=kByoiT9i27+DTvNqzTv5Xwx4LR398i6qsIvDKcvL724=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DSaP7C1rPdGYTMCdlWrqG3yUs5EGSBJEszr7LC7sbuCprAMQciFfDmfPO5eDl4tcG
	 BSVeyczIN/sL8jPnl24OoQprUIzKvUSMdtQndKfFgxdJ4lvndDD/DxFqnk/kviuqtZ
	 0DPc0TstB9AiQasRyPXBZx6V+QFA40A5uYD9nP6x+7a+tR5Q33NZUVlTsh1noFZPS8
	 8CLw6vGDnPNlsUzv7vUzLsReHQK6XNxnuyNP8kBS1K+fCks7K9JR71G76VjV65/09o
	 o4TwsChsMDD3eXDPCpyO1AumlXIENYHGRssRXmDuNaPAOuV4/p8VPZ1C0upDCC1xBo
	 mL1kwIevMjyVg==
Date: Thu, 12 Jun 2025 14:32:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, security@xen.org, 
    Juergen Gross <jgross@suse.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Trammell Hudson <hudson@trmm.net>, 
    Ross Lagerwall <ross.lagerwall@cloud.com>, 
    Frediano Ziglio <frediano.ziglio@cloud.com>, 
    Gerald Elder-Vass <gerald.elder-vass@cloud.com>, 
    Kevin Lampis <kevin.lampis@cloud.com>
Subject: Re: [PATCH] docs: UEFI Secure Boot security policy
In-Reply-To: <20250611235851.167385-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2506121426520.8480@ubuntu-linux-20-04-desktop>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-788649695-1749763939=:8480"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-788649695-1749763939=:8480
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 12 Jun 2025, Andrew Cooper wrote:
> Written to be solution and deployment neutral in order to focus on the
> technology itself.  This policy is intended to work as well for UKI as for the
> "classic server setup" approach.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: security@xen.org
> CC: Juergen Gross <jgross@suse.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Trammell Hudson <hudson@trmm.net>
> CC: Ross Lagerwall <ross.lagerwall@cloud.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> CC: Kevin Lampis <kevin.lampis@cloud.com>
> 
> A rendered version is available at:
>   https://andrewcoop-xen.readthedocs.io/en/docs-secureboot/admin-guide/uefi-secure-boot.html
> 
> Obviously RFC at this point.  It's worth saying that XenServer is intending to
> use Shim and get a signature from Microsoft, retaining all exiting features
> such as Livepatching and Kexec crash reporting.
> 
> This trails off into more TODOs towards the end.  Individual tasks should
> expand on the start made and resulting conversation from this thread.  As a
> reminder, the target audience for this doc is an administrator running a Xen
> deployment, but who is not necesserily a developer.
> 
> Several things are hard to express and want further discussion.  Suggestions
> welcome:
> 
> 1) Content of CONFIG_CMDLINE and the various CONFIG_*_DEFAULT options.  Xen is
> not going to be issuing XSAs for "downstream chose an unsafe configuration,
> then signed and deployed the result", yet Xen probably should be on the hook
> for bad "default ..." settings in Kconfig.
> 
> 2) Pre-boot DMA Protection.  Microsoft consider this a platform feature
> requiring OEM enablement, and do not consider its absence to be a Secure Boot
> vulnerability.  But, it is less clear what the policy ought to be for Xen
> booting on a capable system and failing to do a correct live-handover of the
> IOMMU across ExitBootServices().
> 
> 3) The AMD microcode signature vulnerability.  While it's not Xen's bug per
> say, it's clearly a Secure Boot bypass because we do offer microcode loading
> capabilties to userspace, and malicious userspace can load an unauthorised
> microcode which allows them to read/write physical memory and bypass further
> signature checks.
> 
> 4) Userspace Hypercalls.  To anyone who isn't already aware, /dev/xen/privcmd
> in the various Unicies is a giant priv-esc hole, as root userspace can
> e.g. issue direct memory hypercalls behind the back of an (intentionally)
> oblivious kernel, and cannot be handwaved away as "it's fine because it's
> root" under Secure Boot.  It's not a Xen vuln (Xen *does* audit pointers in
> guest hypercalls), but it is a guest kernel vuln because of failing to
> correctly audit hypercall parameters.  However, it does require substantial
> changes in Xen in order to allow guest kernels to do something half-way safe.

One small suggestion for improvement is that Secure Boot is not an
x86-specific specification so we should keep the document arch-neutral.


> ---
>  docs/admin-guide/index.rst            |   1 +
>  docs/admin-guide/uefi-secure-boot.rst | 134 ++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+)
>  create mode 100644 docs/admin-guide/uefi-secure-boot.rst
> 
> diff --git a/docs/admin-guide/index.rst b/docs/admin-guide/index.rst
> index 54e6f65de347..e7895ee95001 100644
> --- a/docs/admin-guide/index.rst
> +++ b/docs/admin-guide/index.rst
> @@ -5,4 +5,5 @@ Admin Guide
>  
>  .. toctree::
>     introduction
> +   uefi-secure-boot
>     microcode-loading
> diff --git a/docs/admin-guide/uefi-secure-boot.rst b/docs/admin-guide/uefi-secure-boot.rst
> new file mode 100644
> index 000000000000..0e0f50143892
> --- /dev/null
> +++ b/docs/admin-guide/uefi-secure-boot.rst
> @@ -0,0 +1,134 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +UEFI Secure Boot
> +================
> +
> +UEFI Secure Boot is a verification mechanism, intended to ensure that only
> +code trusted by the platform can run.  This is to prevent malicious code from
> +hijacking the system.  Secure Boot requires that all privileged code be
> +signed, and that there is a trust relationship with the platform; i.e. code
> +which is not signed by a key enrolled in platform must not run privileged.
> +
> +Within the Xen architecture, Xen, the :term:`control domain` and
> +:term:`hardware domain` share responsibility for running and administering the
> +platform.  This makes their kernels privileged as far as Secure Boot is
> +concerned.
> +
> +When Secure Boot is active in the platform, privileged code is required to not
> +run any untrusted code (i.e. not run any code for which there is not a good
> +signature), and is required not to allow this restriction to be bypassed
> +(e.g. by command line request).
> +
> +
> +Support in Xen
> +--------------
> +
> +There are multiple ways to achieve this security goal, with differing
> +tradeoffs for the eventual system.
> +
> +On one end of the spectrum is the Unified Kernel Image.  e.g. Xen is bundled
> +with the dom0 kernel and init-ramdisk, with an embedded command line, and with
> +livepatching and kexec compiled out, and suitably signed.  The signature is
> +checked by the bootloader and, as this covers all the privileged code, Xen
> +doesn't need to perform further checks itself.
> +
> +On the other end of the spectrum is maintaining the features of existing
> +deployments.  e.g. Xen needs signature checking capabilities for the dom0
> +kernel, livepatches and kexec kernels, and needs to allow the use of safe
> +command line options while disallowing unsafe ones.

I just wanted to mention that there is one more option which I used in
the past: the firmware/bootloader loads Xen, the Dom0 kernel, and other
binaries, check their signatures, then boot Xen.

This is similar to the "Unified Kernel Image" approach in the sense that
Xen doesn't need to do any signature checking for the dom0 kernel, but
it doesn't require all the binaries to be glued together.

Assuming that the firmware/bootloader is capable of loading multiple
binaries and checking the signature of multiple binaries before booting
the next element, it works fine.



> +It is important to remember that Xen is one piece of the larger platform,
> +where every piece depends on the correct functioning of all earlier pieces.  A
> +product supporting Secure Boot requires a holistic approach involving all
> +components in the system.  It is not sufficient to consider Xen in isolation.
> +
> +.. TODO: Move "In Progress" tasks here as they become ready
> +
> +Security Scope
> +--------------
> +
> +Vulnerabilities impacting Secure Boot require a fixed component to be produced
> +and distributed, the vulnerable component to be revoked, and the revocation
> +distributed to platforms.
> +
> +The following principles and guidelines indicate where Secure Boot differs
> +from more traditional security models, and the situations in which extra
> +remediation may be necessary.
> +
> +Principles
> +^^^^^^^^^^
> +
> + * Privileged code shall include Xen and the kernel(s) of the control and
> +   hardware domain (both, if they're split).  While there is a privilege split
> +   here in Xen's regular security model, they are equal from Secure Boot's
> +   point of view.
> +
> + * Root or ADMIN in userspace is unprivileged from Secure Boot's point of
> +   view, and must not be able to alter the enforcement policy or load unsigned
> +   code even by e.g. editing a configuration file and rebooting.
> +
> +Within Scope
> +^^^^^^^^^^^^
> +
> +The following types of issue require remediation and revocation of vulnerable
> +binaries.
> +
> + * Any failure to apply enforcements even against traditionally-privileged
> +   userspace, including failure to authenticate new code to run and failure to
> +   handle revocations properly.
> +
> + * Any Out-of-Bounds write capable of altering the enforcement policy, or
> +   capable of bypassing enforcement, e.g. by corrupting the running code.
> +
> +Out of Scope
> +^^^^^^^^^^^^
> +
> +While typically a security issue in their own rights, these issues do not
> +constitute a Secure Boot vulnerability, and do not require special
> +remediation.
> +
> + * Denial of Service vulnerabilities.
> +
> + * Out-of-Bounds reads.
> +
> +The Xen Security Team will endeavour to produce XSAs for all violations of
> +this security policy, including identifying them specifically as requiring
> +further remediation by downstreams.
> +
> +
> +In Progress
> +-----------
> +
> +.. warning::
> +
> +   The following work is still in progress.  It is provisional, and not
> +   security supported yet.
> +
> +
> +Secure Boot Advanced Targeting
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +SBAT is a recovation scheme for Secure Boot enabled components, using a
> +generation based scheme.  See `Shim SBAT.md
> +<https://github.com/rhboot/shim/blob/main/SBAT.md>`_ for full details.
> +
> +Upstream Xen provides the infrastructure to embed SBAT metadata in
> +``xen.efi``, but does not maintain a generation number itself.  Downstreams
> +are expected to maintain their own generation numbers.
> +
> +
> +Lockdown Mode
> +^^^^^^^^^^^^^
> +
> +A mode which causes the enforcement of the properties necessary to conform to
> +the Secure Boot specification.  Lockdown Mode is forced active when Secure
> +Boot is active in the platform, but may be activated independently too for
> +development purposes with the ``lockdown`` command line option.
> +
> +TODO
> +^^^^
> +
> + * Command Line
> + * Livepatching
> + * Kexec
> + * Userspace hypercalls
> -- 
> 2.39.5
> 
--8323329-788649695-1749763939=:8480--

