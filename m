Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC93AD7169
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 15:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013069.1391601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhm6-0004qn-My; Thu, 12 Jun 2025 13:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013069.1391601; Thu, 12 Jun 2025 13:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPhm6-0004pJ-Jp; Thu, 12 Jun 2025 13:15:22 +0000
Received: by outflank-mailman (input) for mailman id 1013069;
 Thu, 12 Jun 2025 13:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8FXR=Y3=bounce.vates.tech=bounce-md_30504962.684ad2e4.v1-1357c5a2135143eda47e3443c19241c0@srs-se1.protection.inumbo.net>)
 id 1uPhm4-0004pC-Dg
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 13:15:20 +0000
Received: from mail187-14.suw11.mandrillapp.com
 (mail187-14.suw11.mandrillapp.com [198.2.187.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48531097-478f-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 15:15:17 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4bJ3100Wjzz8XS0sm
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 13:15:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1357c5a2135143eda47e3443c19241c0; Thu, 12 Jun 2025 13:15:16 +0000
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
X-Inumbo-ID: 48531097-478f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749734116; x=1750004116;
	bh=XhBW5+34ZHlZU2Gf5ZCw5PdSvV9dL4CCEo630zBvK5I=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=e44HPHv49jMWBZxxGAx09z5XC9EhzrxuKf0lVeX/rvGQmrOhK8bjUpwMZw7Ywk8JE
	 VxCQFUwnjztAGcwc8EOOzFT0LwnVQBnWwZX4mTERqfpYgF3NFKY1hJyN6hv8AMKEZI
	 4hMmZv+3DWddtRwU7XcMyUVAm7gyHFY59JXZaZghwGLRLsepGUA9tvAZoRwaHPtAcH
	 Gbdj53KWIWVKNvn1K0Et2ovoDVycndojMiBj8GFXggS/NdAKHup2pm7P8x4ZNdIhs7
	 bjFpGOCAWVq26Cv0aqh6GRaM+2u/TlP6N6rhlovcreMH7tmCPg/xYosLYQjNC7m3oC
	 cOgHPQHNZz7RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749734116; x=1749994616; i=ngoc-tu.dinh@vates.tech;
	bh=XhBW5+34ZHlZU2Gf5ZCw5PdSvV9dL4CCEo630zBvK5I=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=srFByjPT/QleJdEDuiCB9kCvyE4ngAdcyFSaN3VuVx1FKeisvCOlAqQlYZr0qTJoU
	 YkJPGMAmm5gpNTTEdG1jcWwt+3c9a+ELqN0EbsCyM/C8soRPaaay2GM07pU7NC9mUU
	 gvV3KXhFPuBkIt8VgRqLB82qyCG/V9FGJeV40pkl1AeOmQhOazwTnwIBrFslummiM8
	 eNlSZ0o/wxZGweDL13j6I+D0EEJB1KQWLqkpVyqskjDPezwf7OvqypOPlAjZEHPfdD
	 05LXJRcvr2frTO/f0vpCoOJ0fve/EYQNjc8RYIXoPAZP61pYC843xDT6ySipglZhUW
	 F2rNN+nD5p4lA==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20docs:=20UEFI=20Secure=20Boot=20security=20policy?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749734113337
Message-Id: <4226d6ef-a1eb-4210-8cae-2b9b2d906d1c@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, security@xen.org, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Trammell Hudson" <hudson@trmm.net>, "Ross Lagerwall" <ross.lagerwall@cloud.com>, "Frediano Ziglio" <frediano.ziglio@cloud.com>, "Gerald Elder-Vass" <gerald.elder-vass@cloud.com>, "Kevin Lampis" <kevin.lampis@cloud.com>
References: <20250611235851.167385-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250611235851.167385-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1357c5a2135143eda47e3443c19241c0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250612:md
Date: Thu, 12 Jun 2025 13:15:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/06/2025 02:03, Andrew Cooper wrote:
> Written to be solution and deployment neutral in order to focus on the
> technology itself.  This policy is intended to work as well for UKI as fo=
r the
> "classic server setup" approach.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: security@xen.org
> CC: Juergen Gross <jgross@suse.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Trammell Hudson <hudson@trmm.net>
> CC: Ross Lagerwall <ross.lagerwall@cloud.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> CC: Kevin Lampis <kevin.lampis@cloud.com>
> 
> A rendered version is available at:
>    https://andrewcoop-xen.readthedocs.io/en/docs-secureboot/admin-guide/u=
efi-secure-boot.html
> 
> Obviously RFC at this point.  It's worth saying that XenServer is intendi=
ng to
> use Shim and get a signature from Microsoft, retaining all exiting featur=
es
> such as Livepatching and Kexec crash reporting.
> 
> This trails off into more TODOs towards the end.  Individual tasks should
> expand on the start made and resulting conversation from this thread.  As=
 a
> reminder, the target audience for this doc is an administrator running a =
Xen
> deployment, but who is not necesserily a developer.
> 
> Several things are hard to express and want further discussion.  Suggesti=
ons
> welcome:
> 
> 1) Content of CONFIG_CMDLINE and the various CONFIG_*_DEFAULT options.  X=
en is
> not going to be issuing XSAs for "downstream chose an unsafe configuratio=
n,
> then signed and deployed the result", yet Xen probably should be on the h=
ook
> for bad "default ..." settings in Kconfig.
> 
> 2) Pre-boot DMA Protection.  Microsoft consider this a platform feature
> requiring OEM enablement, and do not consider its absence to be a Secure =
Boot
> vulnerability.  But, it is less clear what the policy ought to be for Xen
> booting on a capable system and failing to do a correct live-handover of =
the
> IOMMU across ExitBootServices().
> 

As I understand it, hardware attacks currently don't count in the Secure 
Boot security model, and it would only depend on whether userspace code 
can use the vulnerability to run privileged code right?

> 3) The AMD microcode signature vulnerability.  While it's not Xen's bug p=
er
> say, it's clearly a Secure Boot bypass because we do offer microcode load=
ing
> capabilties to userspace, and malicious userspace can load an unauthorise=
d
> microcode which allows them to read/write physical memory and bypass furt=
her
> signature checks.
> 
> 4) Userspace Hypercalls.  To anyone who isn't already aware, /dev/xen/pri=
vcmd
> in the various Unicies is a giant priv-esc hole, as root userspace can
> e.g. issue direct memory hypercalls behind the back of an (intentionally)
> oblivious kernel, and cannot be handwaved away as "it's fine because it's
> root" under Secure Boot.  It's not a Xen vuln (Xen *does* audit pointers =
in
> guest hypercalls), but it is a guest kernel vuln because of failing to
> correctly audit hypercall parameters.  However, it does require substanti=
al
> changes in Xen in order to allow guest kernels to do something half-way s=
afe.
> ---
>   docs/admin-guide/index.rst            |   1 +
>   docs/admin-guide/uefi-secure-boot.rst | 134 ++++++++++++++++++++++++++
>   2 files changed, 135 insertions(+)
>   create mode 100644 docs/admin-guide/uefi-secure-boot.rst
> 
> diff --git a/docs/admin-guide/index.rst b/docs/admin-guide/index.rst
> index 54e6f65de347..e7895ee95001 100644
> --- a/docs/admin-guide/index.rst
> +++ b/docs/admin-guide/index.rst
> @@ -5,4 +5,5 @@ Admin Guide
>   
>   .. toctree::
>      introduction
> +   uefi-secure-boot
>      microcode-loading
> diff --git a/docs/admin-guide/uefi-secure-boot.rst b/docs/admin-guide/uef=
i-secure-boot.rst
> new file mode 100644
> index 000000000000..0e0f50143892
> --- /dev/null
> +++ b/docs/admin-guide/uefi-secure-boot.rst
> @@ -0,0 +1,134 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +UEFI Secure Boot
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +UEFI Secure Boot is a verification mechanism, intended to ensure that on=
ly
> +code trusted by the platform can run.  This is to prevent malicious code=
 from
> +hijacking the system.  Secure Boot requires that all privileged code be
> +signed, and that there is a trust relationship with the platform; i.e. c=
ode
> +which is not signed by a key enrolled in platform must not run privilege=
d.
> +
> +Within the Xen architecture, Xen, the :term:`control domain` and
> +:term:`hardware domain` share responsibility for running and administeri=
ng the
> +platform.  This makes their kernels privileged as far as Secure Boot is
> +concerned.
> +
> +When Secure Boot is active in the platform, privileged code is required =
to not
> +run any untrusted code (i.e. not run any code for which there is not a g=
ood
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
> +On one end of the spectrum is the Unified Kernel Image.  e.g. Xen is bun=
dled
> +with the dom0 kernel and init-ramdisk, with an embedded command line, an=
d with
> +livepatching and kexec compiled out, and suitably signed.  The signature=
 is
> +checked by the bootloader and, as this covers all the privileged code, X=
en
> +doesn't need to perform further checks itself.
> +
> +On the other end of the spectrum is maintaining the features of existing
> +deployments.  e.g. Xen needs signature checking capabilities for the dom=
0
> +kernel, livepatches and kexec kernels, and needs to allow the use of saf=
e
> +command line options while disallowing unsafe ones.
> +
> +It is important to remember that Xen is one piece of the larger platform=
,
> +where every piece depends on the correct functioning of all earlier piec=
es.  A
> +product supporting Secure Boot requires a holistic approach involving al=
l
> +components in the system.  It is not sufficient to consider Xen in isola=
tion.
> +
> +.. TODO: Move "In Progress" tasks here as they become ready
> +
> +Security Scope
> +--------------
> +
> +Vulnerabilities impacting Secure Boot require a fixed component to be pr=
oduced
> +and distributed, the vulnerable component to be revoked, and the revocat=
ion
> +distributed to platforms.
> +
> +The following principles and guidelines indicate where Secure Boot diffe=
rs
> +from more traditional security models, and the situations in which extra
> +remediation may be necessary.
> +
> +Principles
> +^^^^^^^^^^
> +
> + * Privileged code shall include Xen and the kernel(s) of the control an=
d
> +   hardware domain (both, if they're split).  While there is a privilege=
 split
> +   here in Xen's regular security model, they are equal from Secure Boot=
's
> +   point of view.
> +
> + * Root or ADMIN in userspace is unprivileged from Secure Boot's point o=
f
> +   view, and must not be able to alter the enforcement policy or load un=
signed
> +   code even by e.g. editing a configuration file and rebooting.
> +
> +Within Scope
> +^^^^^^^^^^^^
> +
> +The following types of issue require remediation and revocation of vulne=
rable
> +binaries.
> +
> + * Any failure to apply enforcements even against traditionally-privileg=
ed
> +   userspace, including failure to authenticate new code to run and fail=
ure to
> +   handle revocations properly.
> +
> + * Any Out-of-Bounds write capable of altering the enforcement policy, o=
r
> +   capable of bypassing enforcement, e.g. by corrupting the running code=
.
> +
> +Out of Scope
> +^^^^^^^^^^^^
> +
> +While typically a security issue in their own rights, these issues do no=
t
> +constitute a Secure Boot vulnerability, and do not require special
> +remediation.
> +
> + * Denial of Service vulnerabilities.
> +
> + * Out-of-Bounds reads.
> +
> +The Xen Security Team will endeavour to produce XSAs for all violations =
of
> +this security policy, including identifying them specifically as requiri=
ng
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
> +``xen.efi``, but does not maintain a generation number itself.  Downstre=
ams
> +are expected to maintain their own generation numbers.
> +

Why would Xen not maintain its own SBAT generation? An upstream SBAT 
incremented for every Secure Boot bypass XSA would make it far easier to 
block vulnerable variants and help downstreams coordinate fixes.

> +
> +Lockdown Mode
> +^^^^^^^^^^^^^
> +
> +A mode which causes the enforcement of the properties necessary to confo=
rm to
> +the Secure Boot specification.  Lockdown Mode is forced active when Secu=
re
> +Boot is active in the platform, but may be activated independently too f=
or
> +development purposes with the ``lockdown`` command line option.
> +
> +TODO
> +^^^^
> +
> + * Command Line
> + * Livepatching
> + * Kexec
> + * Userspace hypercalls

IMO key management, signing and revocation should be another topic for a 
TODO element.

Best regards,



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



