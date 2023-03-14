Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F6A6B893D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 05:02:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509442.785196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbvqu-0003Lt-4L; Tue, 14 Mar 2023 04:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509442.785196; Tue, 14 Mar 2023 04:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbvqt-0003He-TZ; Tue, 14 Mar 2023 04:01:31 +0000
Received: by outflank-mailman (input) for mailman id 509442;
 Tue, 14 Mar 2023 04:01:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LtO=7G=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pbvqr-0003Fb-TX
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 04:01:30 +0000
Received: from sonic312-25.consmr.mail.gq1.yahoo.com
 (sonic312-25.consmr.mail.gq1.yahoo.com [98.137.69.206])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e26db9a7-c21c-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 05:01:25 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Tue, 14 Mar 2023 04:01:22 +0000
Received: by hermes--production-ne1-759c9b8c64-fztnz (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 76100b2c878269fd1c2471a41328eeeb; 
 Tue, 14 Mar 2023 04:01:17 +0000 (UTC)
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
X-Inumbo-ID: e26db9a7-c21c-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1678766482; bh=1+u0lRMKY06Q3afqGvjIRM93Hh6BLtsy7Va/1C/NuCg=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=S8YdMeALJ0dtBBv8ugZdhLn6w794VU3vXP+pU0a2hfm3rdYFMUrEWdLx6+vDeRJNfxCRs02Y5EAy/e9selVnsazOBoPrKhbhaA39wc20/wWyc1insCa4JU7T+lMooPVuG+ilT01v2iuOmYJB2Oi5e130xV7l4Ia7B2AaqeA52zOmoUVW+LfN7W1qwQTH0Xbd4TuviIWTaDXhUXVTIetAChifpjBhKXxIRvgAhC61u4mD3EjdHdWScRiyLf37GdxSgz/280eEj9A/krKJJRX50qaJjYLt4/t6+Yxr/xTAYWZaTHgZz8C+kmZD9usIzjqb2J3tXeMWumxhVRgeftcW3Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1678766482; bh=TSfXtiVDxZZ55hu83CwP8B5UBxaCuyvpUCRxBKpo5Lq=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=i1qgpHoND6l3VGC1VnwL0d5pIr/2Zbc/4bioad8ltFM7+vm9mHzTFojbqKM0UdoGGdcqMnic2WyttvdeqMPtqLDpbmlfQtbyPazQUAyjCmwDdbtTi1XjCh4B5veQWzHdSFegTMl4fsyH3axHT1PH+o81fZxBtGKEkL3Q0kcy5HPAWcVScb7QJvsolLQJH+JgYWYWfAg0i609j9k3OjzRaO2gVZ8lTHFj0xTZLDuxgMMR7csKYTr0hzs5GHtKEuIjgzJn69doSZ3+PFr9wB3lpneet+goi7XjgYiEuk3YbvpdNaFERrDa26pWnt/YMnqFqSUT56yyz4Mf7DWCt22ucQ==
X-YMail-OSG: a9C.w0gVM1lCDMl2JTdGNzo_5tnf2l2.bZk3cMSDLidExWCAWJUzIDAfsoRcOyz
 ZsvAaR8kDu_lQGVNpARz_PuOYiYf1v.MzlbT7lby7UrRmKETZE_T6HyjO4obxUnb5P1Hkd7zC0ZJ
 AsxFAZ2QDErf6VK3y.vkWEB4OQNiHy9R4U8w_K50IWFP9ZmOmBXwyMEnZ1KxDyOrRi58FU.DZ0y_
 t4bC2eH.FpjsTzsQyLheBU6pkxMjqkH3KA6zX0ODG6gg_DNmgHjsg8vdTt8tEO9Rw3IXANTr9QtB
 en3oo8G.JoFofQwd_0ACBSVtUrCvb.xJHcq3O8HowgwNHglkQLj9BLlLBelQQajZWCv7e1w1CMJE
 Sm5rwNnCpk.61YNLkvVMEnBBUyeA5uL7MQ83HrjfPiCEXJPC.eiOwF9prahphnpK9RVGR56Dfu3L
 E4i5ULlZL0rBy.RpfN0epvHsaHRUkT9o1cJ1VSx_rSuNYhtUnB3nTQCoYN1GRnesodS09mfJqf8J
 6eZIPUtWclYdTEztcRpO2sZYj5iVc46sw12MzG7fuiZ4ld1_oCI8Lj_gJ1O0L6n14QranDBhOOG_
 PmrEPi79.kS3zs0jO2pDaVT1KCLJCbQ8LfMEN8GayUzM1k1.kIwFvCVNlHKI4WelUyxwCfTYJelD
 M2uCHMRDuzmRTANtMvpiOFdmz6zzefGwggrAiKuohRMQb0rs0SSFUL3eRdOse4u_.KNtXMIWe5Hr
 Q8fitnoe0hHimSU3LfzHVhNRy.9V6n_tw96MaregJfgHkBufaM1N05BjSsie5WWyZhEeasWLMTYz
 fOGyPfJrMefExgYpqqINOE2yXkVz.2GL7pd8uTRHxXrkHpDboU0D2xIa4s0ln9y3UqoIj_h_UoLy
 X6BiGzhi0bw78HKlSZYn4Ht3n5MkPlbq11cn3I7Bwciib9.rd2V1m7Os4AACnH.SS4yoLCO4vQM2
 TECbQ4BoWL2MxVHghS0pXzjSTcaQKUB92JT6wnUVMnrHCXjAO4BtmfAfrAAk8D0xmfeJz9MMg.tm
 RNrSOpRcB5jGYPuj5DA1VEVRh5saGeTmFQR_aGV.8WYneawEDtsNHK68UETAPKEpAcwD5Cp4R7ua
 VG0dOa3aIaB6UZtv9kJDK7tq40XvfHZs0Qp2cj6DwrAVs2WchW6Ey11V2nuaINHvb.LW9dKWf7mS
 2.aVBSoWXmNrEfe5YVJlXBExRSzxaYtuTQ4LAuDVxMEjHBAzafHr_KQlpJWPcr7gP1uAQz0_BWu5
 sPbAYF1xmbVetLtUmHvoU9PtrwnX9MXw2jtg6bdOmw.czA1rGuSgbsBsr.m1k84aIJWKEtacZ0cB
 2kxkOCXMRvhkpGuIjVtyRqNEoBjIJocr6fZ3nftyDS_WWtKlMKg3e54MZ_Vd.MdyCIx6UqfGMidn
 gwz7jP6hUom0h3Wssfq6nD_LZoyh5uqY6GX2m8.G_iZpgZfZkaOAGNRDTVlWn1C6li4ti_LlZiFL
 DKfTYGhbmQkjkek1CBhuR.D9rYUEcgWlyXkS1ESnHDVLpEp.8MGKl.fIFdUeyWp2r74a4.MnPiV_
 oQEBlvLRSnE_0qUXaGOr5Eixx.tbxGMk.nXAMC_4d.kgkSQq3Libsugjj8qC48i412fWtibV2tYa
 Ukl.LqjhC643MlqfDSv4INAMFMWp3.p26a2vB396ndt9AgduHLuSLuJ4q0ZzBKnyaqppSgzDkxU4
 J9hohQnpR3mLcF5d5IGM0tIyEx1z0MGLp6j_p1aqDeiQqwr9LOF12tocZKC2Fb98YGHECp0ZY3yZ
 6ZjSR6ZeQIEoLLeEIwGaClOIcd_EeMF9Ou.eufsJE28ZRiUyp2_pus3d.4pmjk8Q6DCyHQe0Idx4
 4.b7gF5SVZL7kZ7kwir2ai5lBmZtB8Ks7aK3P0t.rXYEeelApXVI9lfmFKp7zOoWtcswJbUADb_j
 M5I4_s0qHk9U2Jt5m.R6uDx.guntRMbo3QV8J080pVHHZIwRXDJYgOvwZbSM.XSieWPr1YCalOQA
 y_VVw2psXi8jckCncFugbmSyfxodP3z7__A3tLCe6XtOyPr_t4ypE3qLPeIkxpPEx0Vqgl5Egwml
 DBRCEibyJsEzvtPYwsvRhfRsm_pCCXMRp35tjIMw37fu7HI_PLtsx1Y45SPkxX7Uj0l5YufWXx7f
 Ed2D2HPptILnPlEyCxnDtNAaJIMdJG_ubC2zB.ZcHexoy.yRGaEwJu8dnWLVxgiEPIIccNdmO4h5
 4Zd3u9hE-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: d1a5d7b0-8caa-4204-ada0-a818a27dc087
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/2] pci: slot_reserved_mask improvements
Date: Tue, 14 Mar 2023 00:01:07 -0400
Message-Id: <cover.1678763217.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1678763217.git.brchuckz.ref@aol.com>

This patch series consists of two patches. The first provides accessor
functions in pci.h to avoid direct access of slot_reserved_mask
according to the comment at the top of include/hw/pci/pci_bus.h. No
functional change is intended with this patch.

The second patch allows a pci bus to be configured so slot_reserved_mask
will only be enforced when the device to be added to the bus is
configured for automatic slot assignment. The second patch also uses the
new capability in the case of the pc/i440fx/xenfv machine types so
the current behavior of reserving slot 2 for the Intel IGD for the
xenfv machine will be ignored if an administrator manually configures
another device to use the reserved slot.

The current behavior of always reserving slots in the sun4u machine is
preserved by this patch series; the patch series only changes how
slot_reserved_mask works in the xenfv machine. Although the patch
series can affect xenfv machines configured for igd-passthru if an
administrator assigns some of the pci slot addresses manually, it
does not affect the libxl default configuration for igd-passthru because
libxl uses automatic slot assignment by default.

Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/

Chuck Zmudzinski (2):
  pci: avoid accessing slot_reserved_mask directly outside of pci.c
  pci: allow slot_reserved_mask to be ignored with manual slot
    assignment

Changelog

v2: Add first patch and cover letter to make this a 2-patch series
    Make changes to the second patch (see second patch for changelog)

 hw/pci-host/i440fx.c     |  1 +
 hw/pci/pci.c             | 29 ++++++++++++++++++++++++++++-
 hw/sparc64/sun4u.c       |  7 +++----
 hw/xen/xen_pt.c          |  7 +++----
 include/hw/pci/pci.h     |  4 ++++
 include/hw/pci/pci_bus.h |  1 +
 6 files changed, 40 insertions(+), 9 deletions(-)

-- 
2.39.2


