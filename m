Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C69274BEAF
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jul 2023 20:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560713.876817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qICMf-00080m-2p; Sat, 08 Jul 2023 18:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560713.876817; Sat, 08 Jul 2023 18:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qICMe-0007yZ-VZ; Sat, 08 Jul 2023 18:09:00 +0000
Received: by outflank-mailman (input) for mailman id 560713;
 Sat, 08 Jul 2023 18:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfqP=C2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qICMd-0007yT-Uq
 for xen-devel@lists.xenproject.org; Sat, 08 Jul 2023 18:09:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 813f839b-1dba-11ee-b237-6b7b168915f2;
 Sat, 08 Jul 2023 20:08:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F1B0A601D9;
 Sat,  8 Jul 2023 18:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D67C433C7;
 Sat,  8 Jul 2023 18:08:51 +0000 (UTC)
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
X-Inumbo-ID: 813f839b-1dba-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688839735;
	bh=HIy8KMbQOvDbOJR7WWjTx2K8cRdpxvsiNzLUY6jEL/4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XEsuJXmZs8oEwO1MYI6joeDr2hwqFTxRv/0I/WE74P2QT1PiR7Ku5amhXep+DPF9N
	 KTTyysZUHQH2aue0KTfONKNP/NLGt30D6aXLmXT2aUmxbBfgzXeIB+943iZcORlETw
	 e3b58q5jRq9jdYImMwIc6tmgOodLSypmDFbMbLvMMT0RVlAyMlWICFE725ugop4r8A
	 yGckpPEvcPKexupVAieX7vaJEtTpcGHKG8PZoXlqd37kzzF8j20Qmb0WBqX27qj5Ii
	 IlFZ8p4furvHFdpca2KRQfjWWiRTEBkGEPM7A7P4t90zmwJr+b+4MlIEH5HE3IbNz7
	 u7z2QC5OXtWuw==
Date: Sat, 8 Jul 2023 11:08:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rich Persaud <persaur@gmail.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>, 
    George Dunlap <george.dunlap@cloud.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Andrew Cooper <Andrew.Cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Henry Wang <Henry.Wang@arm.com>, 
    Community Manager <community.manager@xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Rian Quinn <rianquinn@gmail.com>, Ian Jackson <iwj@xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Scott Davis <scott.davis@starlab.io>, Adam Fraser <adam@starlab.io>, 
    Paul Durrant <paul@xen.org>, rsmith@riversideresearch.org, 
    m.a.young@durham.ac.uk, Elliott Mitchell <ehem+xen@m5p.com>, 
    openxt <openxt@googlegroups.com>, Jason Andryuk <jandryuk@gmail.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
In-Reply-To: <7C4F691F-1C60-48EF-A1B6-B358DF16B13B@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2307081108440.761183@ubuntu-linux-20-04-desktop>
References: <4CAC8F69-ABE0-47D7-9421-77F0719B9BDE@arm.com> <7C4F691F-1C60-48EF-A1B6-B358DF16B13B@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1385878080-1688838543=:761183"
Content-ID: <alpine.DEB.2.22.394.2307081049060.761183@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1385878080-1688838543=:761183
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2307081049061.761183@ubuntu-linux-20-04-desktop>

On Sat, 8 Jul 2023, Rich Persaud wrote:
> On Jul 8, 2023, at 03:29, Luca Fancellu <luca.fancellu@arm.com> wrote:
> > ﻿
> >>>> 
> >>>> Instead, the use case configurations should themselves be describable.
> >>> 
> >>> Thanks Christopher, Daniel and all!
> >>> 
> >>> So if I understand correctly, you are in favor if renaming Dom0less to
> >>> Hyperlaunch throughout the Xen codebase? And we need a clarification of
> >>> the docs/, especially docs/features/dom0less.pandoc?
> >> 
> >> Christopher wrote:
> >>>> = Community resourcing
> >> 
> >> Note the pre-requisite work items for upstream Xen, listed under "Community Resourcing", to merge code for Hyperlaunch common interfaces and test cases, with docs on configuration of Hyperlaunch to deliver functionality for dom0less use cases.
> > 
> > Are you saying that before renaming the “dom0less” feature, we should wait for it to be ported to the common code?
> 
> Why "wait"? In what timeframe do you expect dom0less to use Hyperlaunch code?
> 
> Can kernel component foo adopt the name of kernel component bar without code change?
> 
> Can dom0less stakeholders derive Hyperlaunch benefits without using Hyperlaunch code?


I think Rich is saying that before using the same name we should make
sure that the interfaces and features are actually comparable and maybe
even "compatible". I think that is very reasonable. Rich, did I
understand correctly?


The Hyperlaunch (x86) code is not yet upstream, but the design document
that describes the device tree interface shows an interface that is very
similar, almost compatible, with today's dom0less (ARM) device tree
interface.

The structure of the device tree information is the same. Going through
it I could only spot only tiny differences:
- top level node is "hypervisor" instead of "chosen"
- "module-addr" instead of "reg"
- "module,kernel" instead of "multiboot,kernel"
- "module,ramdisk" instead of "multiboot,ramdisk" 

The rest is the same. If we sort out these small differences one way or
the other then the resulting interface should actually be fully
compatible and we could reuse the existing Dom0less (ARM) code to parse
an HyperLaunch (x86) configuration.

The top level node is not a problem. We could easily deal with both
"hypervisor" and also "chosen". Or we could pick a third different name
for both: "domains" which is the one used by System Device Tree.

I think we should rename "module-addr" to "reg" in the hyperlaunch
design document. I don't think it would have any effect on the existing
hyperlaunch (x86) code and usage because direct addresses are typically
not used on x86.

"module,kernel" and "module,ramdisk": we could either get rid of them in
favor of "multiboot,kernel" and "multiboot,ramdisk", or we could add
"module,kernel" and "module,ramdisk" as alternative aliases in the
existing dom0less (ARM) code. We already have "xen,linux-zimage" and
"xen,linux-initrd" as aliases so it is not a problem.


Also, I do think that Dom0less stakeholders would benefit from
Hyperlaunch code such as Dom0's reduction of privilege. Things like
"permissions" and "functions" of the Hyperlauch device tree interface
design document.


So, my opinion is that we should go ahead with dom0less->hyperlaunch
rename but we should also try to make the two device tree interfaces
compatible, sorting out the small differences above. That would help a
lot in terms of documentation and tooling. It would be ideal if things
like ImageBuilder worked equally well for Hyperlaunch (x86) and Dom0less
(ARM).


P.S.
Note that I only added (ARM) and (x86) for extra clarity in this
discussion, and I don't want to keep using them going forward.
--8323329-1385878080-1688838543=:761183--

