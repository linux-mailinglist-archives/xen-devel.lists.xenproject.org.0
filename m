Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B9704218
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 02:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534897.832366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyiHu-0005Mn-5c; Tue, 16 May 2023 00:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534897.832366; Tue, 16 May 2023 00:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyiHu-0005Ko-2n; Tue, 16 May 2023 00:11:34 +0000
Received: by outflank-mailman (input) for mailman id 534897;
 Tue, 16 May 2023 00:11:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pyiHs-0005Kg-JF
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 00:11:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 349bdf62-f37e-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 02:11:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5B1F620F6;
 Tue, 16 May 2023 00:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240B6C433D2;
 Tue, 16 May 2023 00:11:27 +0000 (UTC)
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
X-Inumbo-ID: 349bdf62-f37e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684195888;
	bh=vjBGWia8/pKhY0b/aW+hp1dFzcOtC0TuSqQL5lJkFP0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sK4EM5u7kAGUw798nQB1nLAFSxe1O+RTgfE/YRNgAvmOaAFrxaiFNthqxF4nl3vZU
	 KQFPG4W+ygCZz/pMrix6emivkYhahr+C6331z6Fkzqc+9UuVTKUrwzYtwePMway63w
	 jhk15ktWTa+HYqDJkjSZ43pyTFJuLTx/BhBpFzYMRy/lNprNZR838aYqPp0SYMsWQR
	 V5/djpqUfpChpvAH3O00DWgRPTRljYl6twxSB3hrk+mhj8HOVhHDLgVJyR3shSxkAM
	 wE86xB4AgIwPIzfsOibpVfxFvT7dJGjRIR2jY0GVrUeAYOK6D49s8ywftmNxyd1cBr
	 6/8FRQb5w3rBg==
Date: Mon, 15 May 2023 17:11:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, andrew.cooper3@citrix.com, 
    jbeulich@suse.com, xen-devel@lists.xenproject.org, 
    Xenia.Ragiadakou@amd.com, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
In-Reply-To: <ZGH+5OKqnjTjUr/F@Air-de-Roger>
Message-ID: <alpine.DEB.2.22.394.2305151656500.4125828@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop> <20230513011720.3978354-2-sstabellini@kernel.org> <ZGH+5OKqnjTjUr/F@Air-de-Roger>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1204352746-1684195264=:4125828"
Content-ID: <alpine.DEB.2.22.394.2305151701170.4125828@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1204352746-1684195264=:4125828
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2305151701171.4125828@ubuntu-linux-20-04-desktop>

On Mon, 15 May 2023, Roger Pau Monné wrote:
> On Fri, May 12, 2023 at 06:17:20PM -0700, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> > the tables in the guest. Instead, copy the tables to Dom0.
> > 
> > This is a workaround.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > As mentioned in the cover letter, this is a RFC workaround as I don't
> > know the cause of the underlying problem. I do know that this patch
> > solves what would be otherwise a hang at boot when Dom0 PVH attempts to
> > parse ACPI tables.
> 
> I'm unsure how safe this is for native systems, as it's possible for
> firmware to modify the data in the tables, so copying them would
> break that functionality.
> 
> I think we need to get to the root cause that triggers this behavior
> on QEMU.  Is it the table checksum that fail, or something else?  Is
> there an error from Linux you could reference?

I agree with you but so far I haven't managed to find a way to the root
of the issue. Here is what I know. These are the logs of a successful
boot using this patch:

[   10.437488] ACPI: Early table checksum verification disabled
[   10.439345] ACPI: RSDP 0x000000004005F955 000024 (v02 BOCHS )
[   10.441033] ACPI: RSDT 0x000000004005F979 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
[   10.444045] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
[   10.445984] ACPI: FACP 0x000000004005FA65 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 00000001)
[   10.447170] ACPI BIOS Warning (bug): Incorrect checksum in table [FACP] - 0x67, should be 0x30 (20220331/tbprint-174)
[   10.449522] ACPI: DSDT 0x000000004005FB19 00145D (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
[   10.451258] ACPI: FACS 0x000000004005FAD9 000040
[   10.452245] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
[   10.452389] ACPI: Reserving FACP table memory at [mem 0x4005fa65-0x4005fad8]
[   10.452497] ACPI: Reserving DSDT table memory at [mem 0x4005fb19-0x40060f75]
[   10.452602] ACPI: Reserving FACS table memory at [mem 0x4005fad9-0x4005fb18]


And these are the logs of the same boot (unsuccessful) without this
patch:

[   10.516015] ACPI: Early table checksum verification disabled
[   10.517732] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
[   10.519535] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
[   10.522523] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
[   10.527453] ACPI: ���� 0x000000007FFE149D FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
[   10.528362] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
[   10.528491] ACPI: Reserving ���� table memory at [mem 0x7ffe149d-0x17ffe149b]

It is clearly a memory corruption around FACS but I couldn't find the
reason for it. The mapping code looks correct. I hope you can suggest a
way to narrow down the problem. If I could, I would suggest to apply
this patch just for the QEMU PVH tests but we don't have the
infrastructure for that in gitlab-ci as there is a single Xen build for
all tests.

If it helps to repro on your side, you can just do the following,
assuming your Xen repo is in /local/repos/xen:


cd /local/repos/xen
mkdir binaries
cd binaries
mkdir -p dist/install/

docker run -it -v `pwd`:`pwd` registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
cp /initrd* /local/repos/xen/binaries
exit

docker run -it -v `pwd`:`pwd` registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
cp /bzImage /local/repos/xen/binaries
exit

That's it. Now you have enough pre-built binaries to repro the issue.
Next you can edit automation/scripts/qemu-alpine-x86_64.sh to add

  dom0=pvh dom0_mem=1G dom0-iommu=none

on the Xen command line. I also removed "timeout" and pipe "tee" at the
end for my own convenience:

 # Run the test
-rm -f smoke.serial
-set +e
-timeout -k 1 720 \
 qemu-system-x86_64 \
     -cpu qemu64,+svm \
     -m 2G -smp 2 \
     -monitor none -serial stdio \
     -nographic \
     -device virtio-net-pci,netdev=n0 \
-    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0 |& tee smoke.serial
+    -netdev user,id=n0,tftp=binaries,bootfile=/pxelinux.0
 

make sure to build the Xen hypervisor binary and place the binary under
/local/repos/xen/binaries/

You can finally run the test with the below:

cd ..
docker run -it -v /local/repos/xen:/local/repos/xen registry.gitlab.com/xen-project/xen/debian:unstable
cd /local/repos/xen
bash automation/scripts/qemu-alpine-x86_64.sh

It usually gets stuck halfway through the boot without this patch.
--8323329-1204352746-1684195264=:4125828--

