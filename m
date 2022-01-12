Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3D348C89D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 17:42:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256745.440750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ggo-0006MJ-Rb; Wed, 12 Jan 2022 16:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256745.440750; Wed, 12 Jan 2022 16:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7ggo-0006JU-Na; Wed, 12 Jan 2022 16:41:34 +0000
Received: by outflank-mailman (input) for mailman id 256745;
 Wed, 12 Jan 2022 16:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytoJ=R4=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1n7ggn-0006JO-Aq
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 16:41:33 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f2d64e2-73c6-11ec-9c70-5536b2d1e4e1;
 Wed, 12 Jan 2022 17:41:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3803D1F39B;
 Wed, 12 Jan 2022 16:41:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD09513BE6;
 Wed, 12 Jan 2022 16:41:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P8h4M7oE32GmTAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Wed, 12 Jan 2022 16:41:30 +0000
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
X-Inumbo-ID: 7f2d64e2-73c6-11ec-9c70-5536b2d1e4e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1642005691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xnkW0qyBAqv0IYt/Ys6pBbBfCTc4R0r4m+OvdFVhX3o=;
	b=AGcJNGNQr8tZXp4bvci2AzrkmrQEVVg+MDL4XB+5QqDkyJpqRzHKE5qYdLHLUhzL2YsyQX
	dmhspyTriFRruOEvSV9ULsIXLOsajOuFj1GK8Xb7Vidf0rwFTDJlvNfoloyWryH6xKvLz4
	37TKCIUbA9WuMbUIKuaSo8gBOeVV5sc=
Subject: [PATCH 0/2] libs/light: fix a race when domain are destroied and
 created concurrently
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, James Fehlig <jfehlig@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, James Fehlig <jfehlig@suse.com>
Date: Wed, 12 Jan 2022 17:41:29 +0100
Message-ID: <164200566223.24755.262723784847161301.stgit@work>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

It is possible to encounter a segfault in libxl during concurrent domain
create and destroy operations.

This is because Placement of existing domains on the host's CPUs is examined
when creating a new domain, but the existing logic does not tolerate well a
domain disappearing during the examination.

The race is quite difficult to trigger. Whan that happens, this is an
example of a backtrace:

#0  libxl_bitmap_dispose (map=map@entry=0x50) at libxl_utils.c:626
#1  0x00007fe72c993a32 in libxl_vcpuinfo_dispose (p=p@entry=0x38) at _libxl_types.c:692
#2  0x00007fe72c94e3c4 in libxl_vcpuinfo_list_free (list=0x0, nr=<optimized out>) at libxl_utils.c:1059
#3  0x00007fe72c9528bf in nr_vcpus_on_nodes (vcpus_on_node=0x7fe71000eb60, suitable_cpumap=0x7fe721df0d38, tinfo_elements=48, tinfo=0x7fe7101b3900, gc=0x7fe7101bbfa0) at libxl_numa.c:258
#4  libxl__get_numa_candidate (gc=gc@entry=0x7fe7100033a0, min_free_memkb=4233216, min_cpus=4, min_nodes=min_nodes@entry=0, max_nodes=max_nodes@entry=0, suitable_cpumap=suitable_cpumap@entry=0x7fe721df0d38, numa_cmpf=0x7fe72c940110 <numa_cmpf>, cndt_out=0x7fe721df0cf0, cndt_found=0x7fe721df0cb4) at libxl_numa.c:394
#5  0x00007fe72c94152b in numa_place_domain (d_config=0x7fe721df11b0, domid=975, gc=0x7fe7100033a0) at libxl_dom.c:209
#6  libxl__build_pre (gc=gc@entry=0x7fe7100033a0, domid=domid@entry=975, d_config=d_config@entry=0x7fe721df11b0, state=state@entry=0x7fe710077700) at libxl_dom.c:436
#7  0x00007fe72c92c4a5 in libxl__domain_build (gc=0x7fe7100033a0, d_config=d_config@entry=0x7fe721df11b0, domid=975, state=0x7fe710077700) at libxl_create.c:444
#8  0x00007fe72c92de8b in domcreate_bootloader_done (egc=0x7fe721df0f60, bl=0x7fe7100778c0, rc=<optimized out>) at libxl_create.c:1222
#9  0x00007fe72c980425 in libxl__bootloader_run (egc=egc@entry=0x7fe721df0f60, bl=bl@entry=0x7fe7100778c0) at libxl_bootloader.c:403
#10 0x00007fe72c92f281 in initiate_domain_create (egc=egc@entry=0x7fe721df0f60, dcs=dcs@entry=0x7fe7100771b0) at libxl_create.c:1159
#11 0x00007fe72c92f456 in do_domain_create (ctx=ctx@entry=0x7fe71001c840, d_config=d_config@entry=0x7fe721df11b0, domid=domid@entry=0x7fe721df10a8, restore_fd=restore_fd@entry=-1, send_back_fd=send_back_fd@entry=-1, params=params@entry=0x0, ao_how=0x0, aop_console_how=0x7fe721df10f0) at libxl_create.c:1856
#12 0x00007fe72c92f776 in libxl_domain_create_new (ctx=0x7fe71001c840, d_config=d_config@entry=0x7fe721df11b0, domid=domid@entry=0x7fe721df10a8, ao_how=ao_how@entry=0x0, aop_console_how=aop_console_how@entry=0x7fe721df10f0) at libxl_create.c:2075

Luckily, it is easy to close the race, by just making sure that
libvxl_list_vcpu() returns 0 as the number of vCPUs of the domain, when
it also returns NULL as the list of them.

Regards
---
Dario Faggioli (2):
      tools/libs/light: numa placement: don't try to free a NULL list of vcpus
      tools/libs/light: don't touch nr_vcpus_out if listing vcpus and returning NULL

 tools/libs/light/libxl_domain.c | 14 ++++++++------
 tools/libs/light/libxl_numa.c   |  4 +++-
 2 files changed, 11 insertions(+), 7 deletions(-)
--
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


