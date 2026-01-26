Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLYbDUbBd2nKkgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 20:32:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B58C927
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 20:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214005.1524437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkSIy-00018s-3d; Mon, 26 Jan 2026 19:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214005.1524437; Mon, 26 Jan 2026 19:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkSIy-00016X-0V; Mon, 26 Jan 2026 19:31:20 +0000
Received: by outflank-mailman (input) for mailman id 1214005;
 Mon, 26 Jan 2026 19:31:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ejK3=77=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1vkSIv-00016R-Na
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 19:31:17 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93b1ae3f-faed-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 20:31:15 +0100 (CET)
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60QJUX0M3230378
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Mon, 26 Jan 2026 11:30:34 -0800
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
X-Inumbo-ID: 93b1ae3f-faed-11f0-b15f-2bf370ae4941
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60QJUX0M3230378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026012301; t=1769455836;
	bh=F8FFTbCNA0IjhSYw8p1wkH57XCUpK2L9SYc1+fWEBrQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=YqYTbZVJKC/Aw/m2Br3dv5p78b8CchhKHUqaJmxvV9P1lEj6jc6Qw3uSR8WFDmhSl
	 gL98Fl8W2D/XHGdNGF5RyFUOtIdjWU5SAwNTbmi+JzElQeIb6xEayZNU6xYYoxFNbu
	 WaGILQBpkwzRKeveYmOiEB3aBLnZQ2KvKijhAWTZIS+L9PnqmUm5eZrcce50ik3rp8
	 FbnKe9k3RY3h55u6l3zwOB+S6Ql3WYZeJEV4E9XYFTGlafTCPnFA8xJIPDnmE5bgB3
	 fM1OI2FeLoO9sVAtoi4qvcU5WLb/fRDW3qpJRKFGMWOsoTsvgRYmO8DUEltOB5Cag8
	 uMMTU4u5/7+SA==
Date: Mon, 26 Jan 2026 11:30:28 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>, linux-kernel@vger.kernel.org
CC: Lai Jiangshan <jiangshan.ljs@antgroup.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
        Brian Gerst <brgerst@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexander Graf <graf@amazon.com>,
        Joel Granados <joel.granados@kernel.org>,
        Thomas Huth <thuth@redhat.com>, Uros Bizjak <ubizjak@gmail.com>,
        Kiryl Shutsemau <kas@kernel.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>, "Xin Li (Intel)" <xin@zytor.com>,
        =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_0/5=5D_x86/boot=3A_Allow_to_perfor?=
 =?US-ASCII?Q?m_randomization_for_uncompressed_kernel_image?=
User-Agent: K-9 Mail for Android
In-Reply-To: <cover.1769434279.git.houwenlong.hwl@antgroup.com>
References: <cover.1769434279.git.houwenlong.hwl@antgroup.com>
Message-ID: <7716B334-004D-4CBB-9237-E8AE5CE696CE@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.01 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026012301];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[antgroup.com,kernel.org,redhat.com,alien8.de,linux.intel.com,suse.com,oracle.com,weissschuh.net,gmail.com,linux-foundation.org,amazon.com,roeck-us.net,zytor.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hpa@zytor.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:houwenlong.hwl@antgroup.com,m:linux-kernel@vger.kernel.org,m:jiangshan.ljs@antgroup.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:ardb@kernel.org,m:nathan@kernel.org,m:masahiroy@kernel.org,m:vkuznets@redhat.com,m:linux@weissschuh.net,m:brgerst@gmail.com,m:jpoimboe@kernel.org,m:akpm@linux-foundation.org,m:graf@amazon.com,m:joel.granados@kernel.org,m:thuth@redhat.com,m:ubizjak@gmail.com,m:kas@kernel.org,m:pawan.kumar.gupta@linux.intel.com,m:linux@roeck-us.net,m:xin@zytor.com,m:ilpo.jarvinen@linux.intel.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[zytor.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[antgroup.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A6B58C927
X-Rspamd-Action: no action

On January 26, 2026 5:33:50 AM PST, Hou Wenlong <houwenlong=2Ehwl@antgroup=
=2Ecom> wrote:
>Hi all,
>
>This RFC patch series introduces relocatable uncompressed kernel image,
>which is allowed to perform kerenl image virtual address randomization
>in 64-bit booting entry instead of decompression phase=2E
>
>- Background
>
>Currently, kernel image virtual address randomization is only performed
>during the decompression phase=2E However, in certain scenarios, such as
>secure container environments (e=2Eg=2E, Kata Containers), to speed up th=
e
>boot process, the system may boot directly from an uncompressed kernel
>image=2E In such cases, virtual address randomization cannot be executed=
=2E
>Although the security enhancement provided by KASLR is limited, there is
>still a potential demand to allow uncompressed kernel images to perform
>virtual address randomization (for example, future support for x86 PIE)=
=2E
>
>- Approaches
>
>Currently, the x86 kernel uses static compilation, but it retains
>relocation information through the '--emit-relocs' option, which is then
>simplified into a relocation table using 'relocs' tool=2E To enable
>virtual address randomization for uncompressed kernel images, relocation
>information is required, and there are several possible approaches:
>
>1) Who will perform the randomization:
>
>VMM: The VMM reads vmlinux=2Erelocs after loading vmlinux to perform
>randomization=2E This would require additional modifications to the VMM,
>and vmlinux=2Erelocs needs to be packaged when shipping=2E
>
>Kernel: The kernel performs randomization itself at the kernel
>entry point, requiring no modifications to the VMM=2E
>
>2) relocation information format:
>
>vmlinux=2Erelocs: It only contains the necessary relocation entries and i=
s
>simplified, making it small enough=2E However, it is a format defined
>within the kernel that was previously used only internally and is not
>part of the ABI=2E
>
>rela=2E* sections: It is the standard ELF ABI, but
>it contains RIP-relative relocation entries, which are more common in
>kernel, causing the kernel image to be larger=2E
>
>- Implementation
>
>The final implementation of this plan extends the 'relocs' tool to allow
>the insertion of relocation information into a reserved section of the
>kernel (referencing the MIPS implementation)=2E This enables the reading
>of that information and subsequent execution of relocations when booting
>directly from an uncompressed kernel=2E Currently, this implementation is
>only available for 64-bit and has been tested with both PVH entry
>booting and standard 64-bit Linux entry=2E And the default reserve size i=
s
>1MB for now, which is enough for defconfig=2E
>
>- TODO
>
>Clean up the decompression KASLR code to allow it to be shared with the
>booting phase=2E
>
>
>Thanks!
>
>Hou Wenlong (5):
>  x86/relocs: Cleanup cmdline options
>  x86/relocs: Insert relocations into input file
>  x86: Allow to build relocatable uncompressed kernel binary
>  x86/boot: Perform virtual address relocation in kernel entry
>  x86/boot: Use '=2Edata=2Erelocs' section for performing relocations dur=
ing
>    decompression
>
> arch/x86/Kconfig                  |  20 ++++++
> arch/x86/Makefile=2Epostlink        |  33 +++++++++
> arch/x86/boot/compressed/Makefile |   6 +-
> arch/x86/boot/compressed/misc=2Ec   |   8 +++
> arch/x86/boot/startup/Makefile    |   1 +
> arch/x86/boot/startup/kaslr=2Ec     | 116 ++++++++++++++++++++++++++++++
> arch/x86/include/asm/setup=2Eh      |   1 +
> arch/x86/kernel/head_64=2ES         |   7 ++
> arch/x86/kernel/vmlinux=2Elds=2ES     |  20 ++++++
> arch/x86/lib/cmdline=2Ec            |   6 ++
> arch/x86/lib/kaslr=2Ec              |   5 ++
> arch/x86/platform/pvh/head=2ES      |  15 +++-
> arch/x86/tools/relocs=2Ec           |  64 ++++++++++++++---
> arch/x86/tools/relocs=2Eh           |  15 ++--
> arch/x86/tools/relocs_common=2Ec    |  24 ++++---
> 15 files changed, 309 insertions(+), 32 deletions(-)
> create mode 100644 arch/x86/Makefile=2Epostlink
> create mode 100644 arch/x86/boot/startup/kaslr=2Ec
>
>--
>2=2E31=2E1
>

Hi!

At a very quick glance this seems like a very reasonable thing to me, but =
since the intent is reduced boot latency (a very worthwhile goal!) do you p=
erhaps have any measurements to show how much improvement we are talking ab=
out? That would be really useful=2E=20

Thanks!=20

