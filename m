Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905EC60DCC4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 10:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430375.681984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onbQx-0002iz-VZ; Wed, 26 Oct 2022 08:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430375.681984; Wed, 26 Oct 2022 08:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onbQx-0002gU-SO; Wed, 26 Oct 2022 08:06:43 +0000
Received: by outflank-mailman (input) for mailman id 430375;
 Wed, 26 Oct 2022 08:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gdy=23=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1onbQv-0002gM-V7
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 08:06:42 +0000
Received: from sonic316-8.consmr.mail.gq1.yahoo.com
 (sonic316-8.consmr.mail.gq1.yahoo.com [98.137.69.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e610dba-5505-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 10:06:40 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 08:06:38 +0000
Received: by hermes--production-ne1-c47ffd5f5-kmjmv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 23da40615be2c6ee6a989747ca28211e; 
 Wed, 26 Oct 2022 08:06:34 +0000 (UTC)
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
X-Inumbo-ID: 1e610dba-5505-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1666771598; bh=5xrh+eQj0TKCY48VtCs3LUP/5HjMlN7+sNXMihoT/w0=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=dD3jTe85+Gt8zE8J2Xk/kHaixt0a/QgA4WJsG9ecjZ53Vb/vSuOA3GN7Rwdlk6HnuEZ8ZKr5hy4Ng4mfSolih2Vcrm1qSTHZf2DULvmp+ix6VRgSF7ToAOUoswFPHqi2+lmFgkDjGNhPyqVdlYIP0+LkV0FOjnloaf9y670fkqI2ZrJ6T0jimsa9lghxEOsIkPhXy/4tgAsXSgYThSSNSFBR78m29ote5j4SL4J28SomeJ9gaMip14vtCj79MHtv36/w8bYzeIPB+W517ZRVlQLslq3M0QDzPh33Er/fWi55B0dkcF555jlA33GVZePcCWxMsta4KmyDicvHKruTOA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666771598; bh=FaQauBinFig4hAkIRNDMa9WSUGN23QRygcriy/AUKko=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=fYzRwzq/C5a2R8A3Dfss4kOdXI3KiROrwgxv1fIXZC2/EDgfOzIvVcmsf4+bKcRtDRQYsaoq9TxK3YH3ocdhq16fTa2X04mLobM7KZ2I2rmpmlxP0FqhVVofIIL6YhKaRjq+LVjFN6cB0DnICxL2MEUSmUbixYSqQ8zOVwcXcXXPyWlBHrMDw8vHhd7TCiN+yzsAvJBLz/aIwnkOK5coYtqBdq2MlXaPQPQ5zmxlDTac2TqKC8MRVaGXlH6fXgdeSnnHJ+vVoRdEYjgwWMH9TalbpDoe6h0y6QCykWrc4r4U81/75EkOlNyjJvWx4IwXgwvfuhhap4LSzDI7BVR7cA==
X-YMail-OSG: e4cAigwVM1kM3mVmsNS0gTFsZkouFLMQzxq8n0Eko6doVBqcrB.VFSkEl6rRxwO
 OEhjl5emjL9g.6ktVvYlT2qv4byzkF9HML4xEjxUtz_t_ZHEtm1uVXY8GlSPqJJM8QMndklhYZSo
 _qMkQqUEAEtDoPs8S7KOZJLYdJyhAS4IbZpGmGY8UVopGYHRtyDgMO7wqB_Nskc6BCMNrg2ljIw7
 paG2ZbMG5vHeQ46_GwGMkzXQF6CIeeDgog4XCKxZgG6TgXxhG0YaFpC1HidS_VXZjSJjsZDOIoC0
 mPBdLA41pHKxNA9r.ugWFcQf1.63_q5Fb.G5r6zNVbuH1xgC0mPP3N7vRAciv7V2O63SZgd6H5X.
 7OWvxNG5_t.tLBbn29wuy8b0Ygfr5jtCbNE88nKI7kAxU61pK.LK539jLM1.DGD.wn7Mw5flOIKA
 UOSmdMjswCujluRZJHTd3DSUBA18k3O3dDanOEx68Y6_kQSkJS1Rw68LUJ0wS3GJTxk.Ys2lSzWs
 1kc8w0czHgpMSqSQkmhRSoGrUoG553yjmbND1uXbV.HHtxt2axqKk_iWnwEwxFezvU3PHt_Yc31A
 53LPRzZnk_gQqIC6nR.q2kj9tZqOb6y0wxz3JOIZ5grMp9sb8ZPmxbPufrRJw4DRQNRVYttFKXus
 chPhlLF1d7lmv133XD6IKmyBU5qUkjglqWv4AHLLM4aB_axScexsFcclbETTrHioXE8gTanyAaaa
 hk6PSHLxDy043fe5p_omrS9fsMfbUqt8vNj4o9N0VWMkgBmsBqfW8eZ6zRcJgJgfvpk89bUtr6Th
 jd9r9uPmhYDJUedFb.QyS39IlFy_NKe9KSKgXBkvjQmUWwR_UJPvXNIcdxBeHe308mT4PqEXwn7x
 pJqgftz8YEu25CiKnybbvbiGBhrZc.OV_oQJufg32YHlykxnGvh_N5r7aenyvvee0DhOe04a11DF
 Nk.EauYr2nO9HJEvPSpyxYh4drTKtjL76W9Hl7Y1.5Nmlpii24ya.rvEHgXWufzfGVZgJpYpJeSP
 fXsa1Tk.4yY4nhu3jNzdSCsrGim9Vfbzd57VTeuDDuZ.YX3rlbWr_VC8b_2I4rm2AGCyEB3VHgsJ
 ucd2UPIgDfhKvdNxt1CBzI4Zex5p1m.IuFUuJfayJj_KCI8Oa2kyLuRNGLxluASz9bQNgXb1E57_
 KZKoGkdFuXnkSxX7mNGr2ofdMWqlJlSQEKP92OKHP6ADz29vDOx45zKxtyluzNCl2jBGg9Sgi6SE
 f7dBHWWfNfThgt_xZneDsdVubpyinTu8YZnkNDDXL2_F1XyyhPMAZc.3pfZQcvMdxysZJFsThyiw
 s62yfKEZ6eKn35O.mBV89Dkxa6YrXTaq3rhqPXi4I4ID3t3F4NtOVpxn.BL7zsYcl94oV30Fb72J
 GeCatqsAWM.BP2fGqJpXaqjhG_YtQyAJ6EfQc3IjpMNqqhunak.5r5jdtMdfHYHWjWyw9HkmLxAf
 k4le7xeRj4KJQZof97ZrAZq5b.zeL8Hgtb84DyBX0ocH9gucniLT6ML2DursxthVUq6D9Voa27G7
 LM1gNJHBA7MYUQVnBRw4nYjbl.xSUs7rvuSyDC4o1eoF6Up.XfKNf5mJgjpGqvp0ibRcxz5Z3Tix
 G.rwuxzFsnpdUVKWE1Tf1fzvVmyCJaPPUhdvx0BXupUqxi1P_TVVVz_29UNanAlKyz8WJdLq6orq
 z1_ghhjMaHHmRnGupHmtWY89NLgXhlgaCQsydM4tg3u1Xgqr8g2ENV9eDXNz3ZN0QMyYiJFh9wEL
 eVcfcLMFZRwibOY5X9c5yOM0KvOJx2DLE4NQIlsq7DPlLdWmdDZBBgQk2UiwvFSOZ2ERHYyesfdU
 tRAbgqG14tcPUFaUbQfoP05nHYHDmC1uNuBmO9VyNqxkP.43c1jk8XrY8iHD0tclFpgi0B_nMf9g
 oB0wVIPK904CaScQpybjQR73LHFhLZH0tpxEjtpjB2EKzZSuO2DFsnEwp7kJkwcK1UexGzuDxYhR
 gkwn9wXyv5LqYhEAKMibxpCFLO9rc100iYKE8XaeLARdpLKVRtZx_SqguR4P5pAYs3Q86CM_Y2m8
 0hGfq6qqiwNczxuvdjfQtX7XDCj1Ho1XrpASS3IP1JAncJhJ3mjbhShzSHZHdMIEDv4GmgQmSvEI
 _AIldVjYjxrmYQegW1OsqPllM7bz9O5cLTwnjyqZCIyoK5VKDgfOCleCeRazS0nW7xeoFov_OhyO
 fhYY-
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/2] xen/pt: fix FTBFS and reserve PCI slot 2 for the Intel IGD
Date: Wed, 26 Oct 2022 04:06:04 -0400
Message-Id: <cover.1666770887.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1666770887.git.brchuckz.ref@aol.com>

This is a series of two patches:

The first fixes FTBFS when --enable-xen and --disable-xen-pci-passthrough
configure options are set with when building for the linux target os.

The second fixes a regression that was introduced many years ago with the
upgrade from the Qemu traditional device model that is still available
from xenbits.xen.org and based on very old Qemu version 0.10.2.

The regression is that the Qemu traditional device model reserves slot 2
for the Intel IGD on the PCI bus when the Intel IGD is passed through
to a Xen HVM domain, but the current Qemu upsream device model does not
and in fact results in a different slot assigned to the Intel IGD.

This behavior does not conform to the requirement that the Intel IGD must
be assigned to slot 2, as noted in docs/igd-assign.txt in the Qemu source
code: "IGD must be given address 02.0 on the PCI root bus in the VM."

I have used the second patch of the series for the past two years with
no problems. Without the patch, the reliability of PCI passthrough of the
Intel IGD to a Xen HVM guest is very poor, and in some cases the guest
fails to start without the patch.

v2: Remove From: <email address> tag at top of message

Chuck Zmudzinski (2):
  xen/pt: fix syntax error that causes FTBFS in some configurations
  xen/pt: reserve PCI slot 2 for Intel igd-passthru

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/meson.build   |  2 +-
 hw/xen/xen_pt.c      | 25 +++++++++++++++++++++++++
 hw/xen/xen_pt.h      | 16 ++++++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 5 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.37.2


