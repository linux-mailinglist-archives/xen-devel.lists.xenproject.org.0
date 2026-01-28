Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RkVBMzTQeWk0zwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 10:00:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6D9E8CD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 10:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215274.1525483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl1P1-0006LZ-Od; Wed, 28 Jan 2026 08:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215274.1525483; Wed, 28 Jan 2026 08:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl1P1-0006JA-LH; Wed, 28 Jan 2026 08:59:55 +0000
Received: by outflank-mailman (input) for mailman id 1215274;
 Wed, 28 Jan 2026 08:59:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shjv=AB=antgroup.com=houwenlong.hwl@srs-se1.protection.inumbo.net>)
 id 1vl1Oz-0006J4-KD
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 08:59:54 +0000
Received: from out28-148.mail.aliyun.com (out28-148.mail.aliyun.com
 [115.124.28.148]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0469dcb-fc27-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 09:59:45 +0100 (CET)
Received: from localhost(mailfrom:houwenlong.hwl@antgroup.com
 fp:SMTPD_---.gI0YX77_1769590781 cluster:ay29) by smtp.aliyun-inc.com;
 Wed, 28 Jan 2026 16:59:41 +0800
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
X-Inumbo-ID: b0469dcb-fc27-11f0-9ccf-f158ae23cfc8
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1769590783; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=TAk3SdDhStsGRPFOTP4EyAvEPIVH5OE9KkeGx4MAVEQ=;
	b=YS9lqz/Bq4l06gZ/AWDSU2nKfu3BhmLibm/fWiRgd8pkIup8nYfqytBf8j4jhYgIznettRXKvLs2iz7OZpPvKzM2krhCe9U/+7wttyY7VBUzQutJmf8oBAie4ITOlCubV0PncOai39NYNQP+IOz/yJ0jk3aZ+25ZS9Jo5xLhuL0=
Date: Wed, 28 Jan 2026 16:59:41 +0800
From: Hou Wenlong <houwenlong.hwl@antgroup.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshan.ljs@antgroup.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Thomas =?utf-8?B?V2Vp77+9c2NodWg=?= <linux@weissschuh.net>,
	Brian Gerst <brgerst@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Graf <graf@amazon.com>,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Huth <thuth@redhat.com>, Uros Bizjak <ubizjak@gmail.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	"Xin Li (Intel)" <xin@zytor.com>,
	Ilpo =?utf-8?Q?J=EF=BF=BDrvinen?= <ilpo.jarvinen@linux.intel.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 0/5] x86/boot: Allow to perform randomization for
 uncompressed kernel image
Message-ID: <20260128085941.GA68023@k08j02272.eu95sqa>
References: <cover.1769434279.git.houwenlong.hwl@antgroup.com>
 <7716B334-004D-4CBB-9237-E8AE5CE696CE@zytor.com>
 <20260127120307.GA20714@k08j02272.eu95sqa>
 <EA5590DD-F7A8-46C5-AE93-0570ABABB399@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EA5590DD-F7A8-46C5-AE93-0570ABABB399@zytor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[antgroup.com,quarantine];
	R_DKIM_ALLOW(-0.20)[antgroup.com:s=default];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:jiangshan.ljs@antgroup.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:ardb@kernel.org,m:nathan@kernel.org,m:masahiroy@kernel.org,m:vkuznets@redhat.com,m:linux@weissschuh.net,m:brgerst@gmail.com,m:jpoimboe@kernel.org,m:akpm@linux-foundation.org,m:graf@amazon.com,m:joel.granados@kernel.org,m:thuth@redhat.com,m:ubizjak@gmail.com,m:kas@kernel.org,m:pawan.kumar.gupta@linux.intel.com,m:linux@roeck-us.net,m:xin@zytor.com,m:ilpo.jarvinen@linux.intel.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[houwenlong.hwl@antgroup.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,antgroup.com,kernel.org,redhat.com,alien8.de,linux.intel.com,suse.com,oracle.com,weissschuh.net,gmail.com,linux-foundation.org,amazon.com,roeck-us.net,zytor.com,lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[antgroup.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[antgroup.com:email,antgroup.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,raw.githubusercontent.com:url]
X-Rspamd-Queue-Id: E6B6D9E8CD
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:43:14AM -0800, H. Peter Anvin wrote:
> On January 27, 2026 4:03:07 AM PST, Hou Wenlong <houwenlong.hwl@antgroup.com> wrote:
> >On Mon, Jan 26, 2026 at 11:30:28AM -0800, H. Peter Anvin wrote:
> >> On January 26, 2026 5:33:50 AM PST, Hou Wenlong <houwenlong.hwl@antgroup.com> wrote:
> >> >Hi all,
> >> >
> >> >This RFC patch series introduces relocatable uncompressed kernel image,
> >> >which is allowed to perform kerenl image virtual address randomization
> >> >in 64-bit booting entry instead of decompression phase.
> >> >
> >> >- Background
> >> >
> >> >Currently, kernel image virtual address randomization is only performed
> >> >during the decompression phase. However, in certain scenarios, such as
> >> >secure container environments (e.g., Kata Containers), to speed up the
> >> >boot process, the system may boot directly from an uncompressed kernel
> >> >image. In such cases, virtual address randomization cannot be executed.
> >> >Although the security enhancement provided by KASLR is limited, there is
> >> >still a potential demand to allow uncompressed kernel images to perform
> >> >virtual address randomization (for example, future support for x86 PIE).
> >> >
> >> >- Approaches
> >> >
> >> >Currently, the x86 kernel uses static compilation, but it retains
> >> >relocation information through the '--emit-relocs' option, which is then
> >> >simplified into a relocation table using 'relocs' tool. To enable
> >> >virtual address randomization for uncompressed kernel images, relocation
> >> >information is required, and there are several possible approaches:
> >> >
> >> >1) Who will perform the randomization:
> >> >
> >> >VMM: The VMM reads vmlinux.relocs after loading vmlinux to perform
> >> >randomization. This would require additional modifications to the VMM,
> >> >and vmlinux.relocs needs to be packaged when shipping.
> >> >
> >> >Kernel: The kernel performs randomization itself at the kernel
> >> >entry point, requiring no modifications to the VMM.
> >> >
> >> >2) relocation information format:
> >> >
> >> >vmlinux.relocs: It only contains the necessary relocation entries and is
> >> >simplified, making it small enough. However, it is a format defined
> >> >within the kernel that was previously used only internally and is not
> >> >part of the ABI.
> >> >
> >> >rela.* sections: It is the standard ELF ABI, but
> >> >it contains RIP-relative relocation entries, which are more common in
> >> >kernel, causing the kernel image to be larger.
> >> >
> >> >- Implementation
> >> >
> >> >The final implementation of this plan extends the 'relocs' tool to allow
> >> >the insertion of relocation information into a reserved section of the
> >> >kernel (referencing the MIPS implementation). This enables the reading
> >> >of that information and subsequent execution of relocations when booting
> >> >directly from an uncompressed kernel. Currently, this implementation is
> >> >only available for 64-bit and has been tested with both PVH entry
> >> >booting and standard 64-bit Linux entry. And the default reserve size is
> >> >1MB for now, which is enough for defconfig.
> >> >
> >> >- TODO
> >> >
> >> >Clean up the decompression KASLR code to allow it to be shared with the
> >> >booting phase.
> >> >
> >> >
> >> >Thanks!
> >> >
> >> >Hou Wenlong (5):
> >> >  x86/relocs: Cleanup cmdline options
> >> >  x86/relocs: Insert relocations into input file
> >> >  x86: Allow to build relocatable uncompressed kernel binary
> >> >  x86/boot: Perform virtual address relocation in kernel entry
> >> >  x86/boot: Use '.data.relocs' section for performing relocations during
> >> >    decompression
> >> >
> >> > arch/x86/Kconfig                  |  20 ++++++
> >> > arch/x86/Makefile.postlink        |  33 +++++++++
> >> > arch/x86/boot/compressed/Makefile |   6 +-
> >> > arch/x86/boot/compressed/misc.c   |   8 +++
> >> > arch/x86/boot/startup/Makefile    |   1 +
> >> > arch/x86/boot/startup/kaslr.c     | 116 ++++++++++++++++++++++++++++++
> >> > arch/x86/include/asm/setup.h      |   1 +
> >> > arch/x86/kernel/head_64.S         |   7 ++
> >> > arch/x86/kernel/vmlinux.lds.S     |  20 ++++++
> >> > arch/x86/lib/cmdline.c            |   6 ++
> >> > arch/x86/lib/kaslr.c              |   5 ++
> >> > arch/x86/platform/pvh/head.S      |  15 +++-
> >> > arch/x86/tools/relocs.c           |  64 ++++++++++++++---
> >> > arch/x86/tools/relocs.h           |  15 ++--
> >> > arch/x86/tools/relocs_common.c    |  24 ++++---
> >> > 15 files changed, 309 insertions(+), 32 deletions(-)
> >> > create mode 100644 arch/x86/Makefile.postlink
> >> > create mode 100644 arch/x86/boot/startup/kaslr.c
> >> >
> >> >--
> >> >2.31.1
> >> >
> >> 
> >> Hi!
> >> 
> >> At a very quick glance this seems like a very reasonable thing to me, but since the intent is reduced boot latency (a very worthwhile goal!) do you perhaps have any measurements to show how much improvement we are talking about? That would be really useful. 
> >>
> > 
> >Hi!
> >
> >Uh, sorry that it may not meet your needs. In fact, it will slow down
> >when booting directly from an uncompressed kernel. The improvement
> >described in the patchset compares booting directly from vmlinux versus
> >booting from bzImage when we want to enable KASLR for guests in MicroVM
> >scenarios. There is a similar idea in [0], where KASLR randomization is
> >implemented on the VMM side. Now we want to implement it directly in the
> >guest kernel to reduce modifications to the VMMs. There are some
> >measurements in [0]; however, the comparison is between vmlinux and
> >bzImage.
> >
> >In my test environment, compared to the original direct kernel booting,
> >it would add 2ms for my test configuration [1] based on the Kata
> >Containers repository due to the self-relocation phase. Booting from
> >bzImage does not affect the boot time, as it simply inserts
> >'vmlinux.relocs' into vmlinux, resulting in no change to the total size.
> >The decompression time should also not be affected; I didn't notice any
> >difference when measuring the decompression().
> >
> >[0]: https://dl.acm.org/doi/epdf/10.1145/3492321.3519578
> >[1]: https://raw.githubusercontent.com/virt-pvm/misc/refs/heads/main/pvm-guest-6.12.33.config
> >
> >Thanks!
> >
> >> Thanks! 
> 
> Didn't you say that that was the reason for this? I'm confused now.

Maybe my expression is not clear. :(
Let me reorganize my thoughts. If you want to enable KASLR for the
guest, this patch makes booting faster, as the guest is now booting from
vmlinux instead of bzImage. However, if you don¡¯t need KASLR for the
guest, you can continue booting from vmlinux, so the newly added
relocation process may introduce a slight overhead (due to command line
parsing), which is what I meant when I said it slows down the booting
from vmlinux. I'm not sure if you need KASLR in your case.

Thanks!

