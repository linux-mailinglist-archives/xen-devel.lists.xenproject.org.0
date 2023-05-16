Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B2704258
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 02:38:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534913.832406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyihq-0001IW-1x; Tue, 16 May 2023 00:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534913.832406; Tue, 16 May 2023 00:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyihp-0001Fj-VZ; Tue, 16 May 2023 00:38:21 +0000
Received: by outflank-mailman (input) for mailman id 534913;
 Tue, 16 May 2023 00:38:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFhh=BF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pyiho-0001Fd-1n
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 00:38:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2c7e491-f381-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 02:38:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A6EB622CE;
 Tue, 16 May 2023 00:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE5E4C433EF;
 Tue, 16 May 2023 00:38:14 +0000 (UTC)
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
X-Inumbo-ID: f2c7e491-f381-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684197495;
	bh=lNemjbpX0e9sENvkLQ4ss+2tvwGTi7UCJWS2TOL3VkU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EoYAnpnt0uVlvXQhrGSTdsE19aqmeyTBBd6qQieddPmcPoA8XZ2SLKMIs4lUnycxH
	 0ojoP7/slzM3VV1qwsK5WOzehwPKMw1DpylMKg00bQ+Mwwvtm3ny54R0bPpBnigfZe
	 vSjPa8dztaeAiIRtaOve8EfoNU+VY4nuB1OX5DsbUUQCL/TKoyTzSsZRyD7UUcjxIh
	 M03HpZ/OH8qGdy0AMaB1379LRH6DO4ncYGGDJxGlpBvpSkV3/my7JQeXP8LCp9ckj+
	 zNZRNYImZmu/sQMA+k9Vnl/E7Z3Ey5484Ee5tFlQgB96sSuRgCPwWIbWHl1tfX0aea
	 HTAJTsKKIMiwg==
Date: Mon, 15 May 2023 17:38:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    andrew.cooper3@citrix.com, jbeulich@suse.com, 
    xen-devel@lists.xenproject.org, Xenia.Ragiadakou@amd.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
In-Reply-To: <alpine.DEB.2.22.394.2305151656500.4125828@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2305151737310.4125828@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop> <20230513011720.3978354-2-sstabellini@kernel.org> <ZGH+5OKqnjTjUr/F@Air-de-Roger> <alpine.DEB.2.22.394.2305151656500.4125828@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1784212664-1684197495=:4125828"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1784212664-1684197495=:4125828
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 15 May 2023, Stefano Stabellini wrote:
> On Mon, 15 May 2023, Roger Pau Monné wrote:
> > On Fri, May 12, 2023 at 06:17:20PM -0700, Stefano Stabellini wrote:
> > > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > 
> > > Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> > > the tables in the guest. Instead, copy the tables to Dom0.
> > > 
> > > This is a workaround.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > ---
> > > As mentioned in the cover letter, this is a RFC workaround as I don't
> > > know the cause of the underlying problem. I do know that this patch
> > > solves what would be otherwise a hang at boot when Dom0 PVH attempts to
> > > parse ACPI tables.
> > 
> > I'm unsure how safe this is for native systems, as it's possible for
> > firmware to modify the data in the tables, so copying them would
> > break that functionality.
> > 
> > I think we need to get to the root cause that triggers this behavior
> > on QEMU.  Is it the table checksum that fail, or something else?  Is
> > there an error from Linux you could reference?
> 
> I agree with you but so far I haven't managed to find a way to the root
> of the issue. Here is what I know. These are the logs of a successful
> boot using this patch:
> 
> [   10.437488] ACPI: Early table checksum verification disabled
> [   10.439345] ACPI: RSDP 0x000000004005F955 000024 (v02 BOCHS )
> [   10.441033] ACPI: RSDT 0x000000004005F979 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> [   10.444045] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> [   10.445984] ACPI: FACP 0x000000004005FA65 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 00000001)
> [   10.447170] ACPI BIOS Warning (bug): Incorrect checksum in table [FACP] - 0x67, should be 0x30 (20220331/tbprint-174)
> [   10.449522] ACPI: DSDT 0x000000004005FB19 00145D (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
> [   10.451258] ACPI: FACS 0x000000004005FAD9 000040
> [   10.452245] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> [   10.452389] ACPI: Reserving FACP table memory at [mem 0x4005fa65-0x4005fad8]
> [   10.452497] ACPI: Reserving DSDT table memory at [mem 0x4005fb19-0x40060f75]
> [   10.452602] ACPI: Reserving FACS table memory at [mem 0x4005fad9-0x4005fb18]
> 
> 
> And these are the logs of the same boot (unsuccessful) without this
> patch:
> 
> [   10.516015] ACPI: Early table checksum verification disabled
> [   10.517732] ACPI: RSDP 0x0000000040060F1E 000024 (v02 BOCHS )
> [   10.519535] ACPI: RSDT 0x0000000040060F42 000034 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
> [   10.522523] ACPI: APIC 0x0000000040060F76 00008A (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
> [   10.527453] ACPI: ���� 0x000000007FFE149D FFFFFFFF (v255 ������ �������� FFFFFFFF ���� FFFFFFFF)
> [   10.528362] ACPI: Reserving APIC table memory at [mem 0x40060f76-0x40060fff]
> [   10.528491] ACPI: Reserving ���� table memory at [mem 0x7ffe149d-0x17ffe149b]
> 
> It is clearly a memory corruption around FACS 

Sorry I meant FACP/FADT
--8323329-1784212664-1684197495=:4125828--

