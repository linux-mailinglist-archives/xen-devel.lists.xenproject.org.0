Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gISsElTdeGnbtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:44:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5A496F93
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 16:44:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214988.1525238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklEZ-0001C2-A7; Tue, 27 Jan 2026 15:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214988.1525238; Tue, 27 Jan 2026 15:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vklEZ-00018z-6z; Tue, 27 Jan 2026 15:44:03 +0000
Received: by outflank-mailman (input) for mailman id 1214988;
 Tue, 27 Jan 2026 15:44:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CSJb=AA=zytor.com=hpa@srs-se1.protection.inumbo.net>)
 id 1vklEX-00018t-In
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 15:44:01 +0000
Received: from mail.zytor.com (terminus.zytor.com [2607:7c80:54:3::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe687e20-fb96-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 16:43:59 +0100 (CET)
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60RFhKjv3682492
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Tue, 27 Jan 2026 07:43:20 -0800
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
X-Inumbo-ID: fe687e20-fb96-11f0-b15f-2bf370ae4941
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60RFhKjv3682492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026012301; t=1769528602;
	bh=5qBENNuWOqGpe79fFGXK8jFG5DwPngcXBIqkvHrIX6w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=RbS9+E7hGn142ybu+NiHBttsuc4cfbL+38yev9p//9S/bLLnfJfEOR1Cy3fwhwpyU
	 qQtX8hdWqxiRQp20ZFVrtvA/x2QA3+SyQvS01WwxapJiBaHqlaCbgK2G+y+lzG9B5/
	 tMIUtToi12b7gQ8gMMH1NUnUzOCKOGa80jzXUyfP3MtL09G3CRFeLl01hJirMZKbBd
	 pz3Q6mWmsa3YszhzbGQ4rQfHlcAfuzwMb7fWykXPbw4q8RKKSG/3+XId3DOXP+FM2Z
	 4UYnc31Kzm5ufdJtruWOiRb9ygoym7KavPFdUxiF0ag6/xNOlQgOIpUuW9jHQAUabo
	 e6dLvMu9/nqLg==
Date: Tue, 27 Jan 2026 07:43:14 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
CC: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshan.ljs@antgroup.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        =?UTF-8?Q?Thomas_Wei=EF=BF=BDschuh?= <linux@weissschuh.net>,
        Brian Gerst <brgerst@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexander Graf <graf@amazon.com>,
        Joel Granados <joel.granados@kernel.org>,
        Thomas Huth <thuth@redhat.com>, Uros Bizjak <ubizjak@gmail.com>,
        Kiryl Shutsemau <kas@kernel.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>, "Xin Li (Intel)" <xin@zytor.com>,
        =?UTF-8?Q?Ilpo_J=EF=BF=BDrvinen?= <ilpo.jarvinen@linux.intel.com>,
        xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_0/5=5D_x86/boot=3A_Allow_to_perfor?=
 =?US-ASCII?Q?m_randomization_for_uncompressed_kernel_image?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260127120307.GA20714@k08j02272.eu95sqa>
References: <cover.1769434279.git.houwenlong.hwl@antgroup.com> <7716B334-004D-4CBB-9237-E8AE5CE696CE@zytor.com> <20260127120307.GA20714@k08j02272.eu95sqa>
Message-ID: <EA5590DD-F7A8-46C5-AE93-0570ABABB399@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.01 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026012301];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,antgroup.com,kernel.org,redhat.com,alien8.de,linux.intel.com,suse.com,oracle.com,weissschuh.net,gmail.com,linux-foundation.org,amazon.com,roeck-us.net,zytor.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hpa@zytor.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:houwenlong.hwl@antgroup.com,m:linux-kernel@vger.kernel.org,m:jiangshan.ljs@antgroup.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:ardb@kernel.org,m:nathan@kernel.org,m:masahiroy@kernel.org,m:vkuznets@redhat.com,m:linux@weissschuh.net,m:brgerst@gmail.com,m:jpoimboe@kernel.org,m:akpm@linux-foundation.org,m:graf@amazon.com,m:joel.granados@kernel.org,m:thuth@redhat.com,m:ubizjak@gmail.com,m:kas@kernel.org,m:pawan.kumar.gupta@linux.intel.com,m:linux@roeck-us.net,m:xin@zytor.com,m:ilpo.jarvinen@linux.intel.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[zytor.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[raw.githubusercontent.com:url,acm.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,antgroup.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA5A496F93
X-Rspamd-Action: no action

On January 27, 2026 4:03:07 AM PST, Hou Wenlong <houwenlong=2Ehwl@antgroup=
=2Ecom> wrote:
>On Mon, Jan 26, 2026 at 11:30:28AM -0800, H=2E Peter Anvin wrote:
>> On January 26, 2026 5:33:50 AM PST, Hou Wenlong <houwenlong=2Ehwl@antgr=
oup=2Ecom> wrote:
>> >Hi all,
>> >
>> >This RFC patch series introduces relocatable uncompressed kernel image=
,
>> >which is allowed to perform kerenl image virtual address randomization
>> >in 64-bit booting entry instead of decompression phase=2E
>> >
>> >- Background
>> >
>> >Currently, kernel image virtual address randomization is only performe=
d
>> >during the decompression phase=2E However, in certain scenarios, such =
as
>> >secure container environments (e=2Eg=2E, Kata Containers), to speed up=
 the
>> >boot process, the system may boot directly from an uncompressed kernel
>> >image=2E In such cases, virtual address randomization cannot be execut=
ed=2E
>> >Although the security enhancement provided by KASLR is limited, there =
is
>> >still a potential demand to allow uncompressed kernel images to perfor=
m
>> >virtual address randomization (for example, future support for x86 PIE=
)=2E
>> >
>> >- Approaches
>> >
>> >Currently, the x86 kernel uses static compilation, but it retains
>> >relocation information through the '--emit-relocs' option, which is th=
en
>> >simplified into a relocation table using 'relocs' tool=2E To enable
>> >virtual address randomization for uncompressed kernel images, relocati=
on
>> >information is required, and there are several possible approaches:
>> >
>> >1) Who will perform the randomization:
>> >
>> >VMM: The VMM reads vmlinux=2Erelocs after loading vmlinux to perform
>> >randomization=2E This would require additional modifications to the VM=
M,
>> >and vmlinux=2Erelocs needs to be packaged when shipping=2E
>> >
>> >Kernel: The kernel performs randomization itself at the kernel
>> >entry point, requiring no modifications to the VMM=2E
>> >
>> >2) relocation information format:
>> >
>> >vmlinux=2Erelocs: It only contains the necessary relocation entries an=
d is
>> >simplified, making it small enough=2E However, it is a format defined
>> >within the kernel that was previously used only internally and is not
>> >part of the ABI=2E
>> >
>> >rela=2E* sections: It is the standard ELF ABI, but
>> >it contains RIP-relative relocation entries, which are more common in
>> >kernel, causing the kernel image to be larger=2E
>> >
>> >- Implementation
>> >
>> >The final implementation of this plan extends the 'relocs' tool to all=
ow
>> >the insertion of relocation information into a reserved section of the
>> >kernel (referencing the MIPS implementation)=2E This enables the readi=
ng
>> >of that information and subsequent execution of relocations when booti=
ng
>> >directly from an uncompressed kernel=2E Currently, this implementation=
 is
>> >only available for 64-bit and has been tested with both PVH entry
>> >booting and standard 64-bit Linux entry=2E And the default reserve siz=
e is
>> >1MB for now, which is enough for defconfig=2E
>> >
>> >- TODO
>> >
>> >Clean up the decompression KASLR code to allow it to be shared with th=
e
>> >booting phase=2E
>> >
>> >
>> >Thanks!
>> >
>> >Hou Wenlong (5):
>> >  x86/relocs: Cleanup cmdline options
>> >  x86/relocs: Insert relocations into input file
>> >  x86: Allow to build relocatable uncompressed kernel binary
>> >  x86/boot: Perform virtual address relocation in kernel entry
>> >  x86/boot: Use '=2Edata=2Erelocs' section for performing relocations =
during
>> >    decompression
>> >
>> > arch/x86/Kconfig                  |  20 ++++++
>> > arch/x86/Makefile=2Epostlink        |  33 +++++++++
>> > arch/x86/boot/compressed/Makefile |   6 +-
>> > arch/x86/boot/compressed/misc=2Ec   |   8 +++
>> > arch/x86/boot/startup/Makefile    |   1 +
>> > arch/x86/boot/startup/kaslr=2Ec     | 116 +++++++++++++++++++++++++++=
+++
>> > arch/x86/include/asm/setup=2Eh      |   1 +
>> > arch/x86/kernel/head_64=2ES         |   7 ++
>> > arch/x86/kernel/vmlinux=2Elds=2ES     |  20 ++++++
>> > arch/x86/lib/cmdline=2Ec            |   6 ++
>> > arch/x86/lib/kaslr=2Ec              |   5 ++
>> > arch/x86/platform/pvh/head=2ES      |  15 +++-
>> > arch/x86/tools/relocs=2Ec           |  64 ++++++++++++++---
>> > arch/x86/tools/relocs=2Eh           |  15 ++--
>> > arch/x86/tools/relocs_common=2Ec    |  24 ++++---
>> > 15 files changed, 309 insertions(+), 32 deletions(-)
>> > create mode 100644 arch/x86/Makefile=2Epostlink
>> > create mode 100644 arch/x86/boot/startup/kaslr=2Ec
>> >
>> >--
>> >2=2E31=2E1
>> >
>>=20
>> Hi!
>>=20
>> At a very quick glance this seems like a very reasonable thing to me, b=
ut since the intent is reduced boot latency (a very worthwhile goal!) do yo=
u perhaps have any measurements to show how much improvement we are talking=
 about? That would be really useful=2E=20
>>
>=20
>Hi!
>
>Uh, sorry that it may not meet your needs=2E In fact, it will slow down
>when booting directly from an uncompressed kernel=2E The improvement
>described in the patchset compares booting directly from vmlinux versus
>booting from bzImage when we want to enable KASLR for guests in MicroVM
>scenarios=2E There is a similar idea in [0], where KASLR randomization is
>implemented on the VMM side=2E Now we want to implement it directly in th=
e
>guest kernel to reduce modifications to the VMMs=2E There are some
>measurements in [0]; however, the comparison is between vmlinux and
>bzImage=2E
>
>In my test environment, compared to the original direct kernel booting,
>it would add 2ms for my test configuration [1] based on the Kata
>Containers repository due to the self-relocation phase=2E Booting from
>bzImage does not affect the boot time, as it simply inserts
>'vmlinux=2Erelocs' into vmlinux, resulting in no change to the total size=
=2E
>The decompression time should also not be affected; I didn't notice any
>difference when measuring the decompression()=2E
>
>[0]: https://dl=2Eacm=2Eorg/doi/epdf/10=2E1145/3492321=2E3519578
>[1]: https://raw=2Egithubusercontent=2Ecom/virt-pvm/misc/refs/heads/main/=
pvm-guest-6=2E12=2E33=2Econfig
>
>Thanks!
>
>> Thanks!=20

Didn't you say that that was the reason for this? I'm confused now=2E

