Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E81705150
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 16:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535265.832977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3q-0007O7-C0; Tue, 16 May 2023 14:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535265.832977; Tue, 16 May 2023 14:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyw3q-0007KM-5y; Tue, 16 May 2023 14:53:58 +0000
Received: by outflank-mailman (input) for mailman id 535265;
 Tue, 16 May 2023 14:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyw3o-00067V-6o
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 14:53:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a37d56f-f3f9-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 16:53:54 +0200 (CEST)
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
X-Inumbo-ID: 7a37d56f-f3f9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684248834;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NrkVJ16nwirBobiHdjNkj0CWXhNZMNORuoJHCIkmXkg=;
  b=EwUOwEBmBRDji5a/S1nG3XAqsTaw8ZThUkg1jqG7lJwgVBxGtqg5umoQ
   l/e9Gyi7cAXiuK2BNWgTp7L4hWol9qbLyT35WromwYVrIzeyIG821a3H7
   hC94Ljy6ywIPtr0R1jwg6Scg5k07qCp6SYIKmM7KU6xJL6i1zpSJjtmUt
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111689031
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:e6frZ6j6634L5DHhqveKffZcX161XxAKZh0ujC45NGQN5FlHY01je
 htvWjyHOfnZMWH3fox/bYvnoxsOucTcm9JmTlRkri9nH3wb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QaAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ1IQkGRwCMv9uanq6aG8hGtt8mDsX0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 zuYrzWhWUhy2Nq3igS/+3D8pb70uGDDXJ09S6yWtdhrqQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9/vrGDoptrSWQHCc8768rDWuNCxTJmgHDQcHQBUE5Z//oYg1phPJUttnVqWyi7XI9SrYm
 m7Q6nJk3vNK0JBNjv/glbzav96yjrXAdwUc9grvZ0778iIoRaSVfImK5UeOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RkkfC9U3tA4lSgFi
 aM5kSdY/9dtMXSjdsebiKrhWp1xncAM+TkIP804j+aigLArLGdrHwk0PyZ8OlwBd2By+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035gebHOyPLGO5ZbwHmggUFAESs8W3oH
 yt3bZPWm32zrsWkCsUozWLjBQ9TdiVqbXwHg8dWavSCMmJbJY3VMNeImelJU9U8z8xoehLgo
 inVtrlwlACu2hUq6GyiNhheVV8Ydcgv8i9rYXN1Zj5FGRELOO6S0UvWTLNvFZFPyQCp5aQco
 yUtEylYPslydw==
IronPort-HdrOrdr: A9a23:2WYuQ6AnCTSgUlvlHeiksseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+VAssQIb6Km90ci7MDrhHPtOjbX5Uo3SODUO1FHIEGgA1/qr/9SDIVyYygc178
 4JHMZD4bbLfDtHZLPBkWyF+qEbsbu6Gc6T5dv2/jNId0VHeqtg5wB2BkKyFVB3fhBPAd4UBY
 eR/c1OohunYDAyYt6gDncIcuDfr5mT/aiWKyIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMP4H
 XIiAvw44SkqrWexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+cwTqAVcBEYfmvrTo1qOag5BIBi9
 /XuSotOMx19jf4Yny1iQGF4Xit7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBH1r
 5R1W7xjesZMfqAplWy2zH7bWArqqOGmwtgrQfVtQ0cbWIqUs4RkWXYxjIRLH5PJlO/1GltKp
 gXMCiV3ocsTbrdVQGVgoAn+q3QYpw+cy32OHQqq4ib1SNbk2t+yFZdzMsDnm0Y/JZ4UJVc4f
 /YW54Y4I2mY/VmH56VPt1xNPefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEw6PuxcJIFwZMukN
 CZOWkow1IaagbrE4mDzZdL+hfCTCG0Wins0NhX49x8tqfnTLTmPCWfQBQlktemof8YHsrHMs
 zDT65+ErvmNy/jCIxJ1wrxV91bLmQfStQcvpIhV1eHsqvwW/7XXyzgAYbuzZbWYEgZsznEcw
 c+tRDIVbp9x1HuXGPkix7MXH6oclDj/PtLYdnnw9Q=
X-Talos-CUID: 9a23:zH4a9myBzekH9GOmnTi5BgU5E/kuW23S9E78fVOZWEdDeKaQa1OPrfY=
X-Talos-MUID: 9a23:I5z2UAsh93sNdK4KEc2nxw9YPcU4wPWVLQM1lYop5NiqdgpxEmLI
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="111689031"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/4] x86: Feature check cleanup
Date: Tue, 16 May 2023 15:53:30 +0100
Message-ID: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This builds on the work from "[PATCH 0/6] x86: Introduce MSR_ARCH_CAPS into
featuresets" and is just cleanup to feature handling.

No functional change.

Andrew Cooper (4):
  x86/cpufeature: Rework {boot_,}cpu_has()
  x86/vtx: Remove opencoded MSR_ARCH_CAPS check
  x86/tsx: Remove opencoded MSR_ARCH_CAPS check
  x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check

 xen/arch/x86/hvm/vmx/vmx.c            |  8 +---
 xen/arch/x86/include/asm/cpufeature.h | 24 ++++++++++--
 xen/arch/x86/include/asm/processor.h  |  2 +-
 xen/arch/x86/spec_ctrl.c              | 56 +++++++++++++--------------
 xen/arch/x86/tsx.c                    | 13 ++++---
 5 files changed, 58 insertions(+), 45 deletions(-)


base-commit: 8f9c8274a4e3e860bd777269cb2c91971e9fa69e
prerequisite-patch-id: ceeba7d5ab9498cb188e5012953c7e8c9a86347d
prerequisite-patch-id: c0957b9e1157ae6eb8de973c96716fd02587c486
prerequisite-patch-id: d2574bba15748cd021e5b33fa50e6cadc38863b6
prerequisite-patch-id: 0f66cd4287ffdc06f24dc01c7d26fb428f3e8c09
prerequisite-patch-id: a585f61b546ff96be3624ff253f8100b2f465de6
prerequisite-patch-id: 54551cdefaca083b4a4b97528d27d0f3dc9753ee
prerequisite-patch-id: 051423463e4a34728ab524f03e801e7103777684
-- 
2.30.2


