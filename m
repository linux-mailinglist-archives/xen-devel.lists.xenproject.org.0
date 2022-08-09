Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7978C58DCAA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 19:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383095.618213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLSb9-00046V-8f; Tue, 09 Aug 2022 17:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383095.618213; Tue, 09 Aug 2022 17:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLSb9-00042Y-5u; Tue, 09 Aug 2022 17:00:55 +0000
Received: by outflank-mailman (input) for mailman id 383095;
 Tue, 09 Aug 2022 17:00:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flEI=YN=citrix.com=prvs=213c446d4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLSb8-0003x4-1d
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 17:00:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2b37ace-1804-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 19:00:53 +0200 (CEST)
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
X-Inumbo-ID: d2b37ace-1804-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660064452;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2bdCLaN+uBCS21iweS7oRTWqNsYNq+ooB0klsI5LdSI=;
  b=aL9qBU/xHNlhaNhM7MgKmfFIlijAxBvIxlq37BGpsyoaFbEo6RpW9KOu
   /GRbGKJhYAFtMAH2qJlgqKQOcJuemVKEZdeWcbDY+qldWQ+NAItAUnF/7
   vTvYGquSl6IlbJjevndanzUvQR6w2UCcCC0ITG+lmkTU0kztlBgObOcvj
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77711806
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N8t+T61N0zwxsInjcPbD5Z1xkn2cJEfYwER7XKvMYLTBsI5bpz0Fn
 GVJWT3TO/uPMGDyfd90YIXkpB5XscLRnN5iSgs4pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQTNNwJcaDpOsfrT8EI35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6+gwA1MfFq8dwd0tXEJXx
 aUyLxYvKTnW0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRD3GbwdCJRE8D5Umkf3zrnL+bydZuBSeoq9fD237k1MuieG9aIS9ltqiSp4PnWTCh
 ED/oUfLITg2HY2mxhi+yyf57gPItXyiA99DfFGizdZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4reK7BSwLUoBdQUbNf8/hJYcQhoIk
 XbcyrsFGgdTXK2ppWO1r+nK9WvrYXVLdAfudgdfE1JbvoCLTJUby0uWE409SPPdYsjdQ2mY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi2+AswGzAQ5odtrxc7V4l
 CFsdzKixO4PF4qRsyeGXf8AGrqkj97cbmCN0A40T8B+pmr1k5JGQWy3yGAWGauUGpxcJW+Bj
 LH74Gu9G6O/zFP1NPQqMupd+uwhzLT6FMSNa804muFmO8EpHCfarX4GWKJl9zqy+KTauf1gZ
 MzznAfFJSpyNJmLOxLvHLhDjOF3nn1WKKG6bcmT8ilLGIG2PBa9IYrp+nPXBgzlxMtoeDnoz
 us=
IronPort-HdrOrdr: A9a23:22BZ9a7jjKNZbMoEmwPXwMTXdLJyesId70hD6qhwISY6TiX+rb
 HIoB17726RtN9/YhEdcLy7VJVoIkmskKKdg7NhXotKNTOO0ADDQb2KhbGSpQEIcBeeygcy78
 hdmtBFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.93,225,1654574400"; 
   d="scan'208";a="77711806"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/2] x86/spec-ctrl: Reduce HVM RSB overhead
Date: Tue, 9 Aug 2022 18:00:14 +0100
Message-ID: <20220809170016.25148-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Xen happens to be not vulnerable to PBRSB, but it turns out we can improve the
performance on all eIBRS systems.

Andrew Cooper (2):
  x86/spec-ctrl: Enumeration for PBRSB_NO
  x86/spec-ctrl: Reduce HVM RSB overhead where possible

 xen/arch/x86/hvm/vmx/entry.S           |   1 +
 xen/arch/x86/hvm/vmx/vmx.c             |  20 ++++++-
 xen/arch/x86/include/asm/cpufeatures.h |   1 +
 xen/arch/x86/include/asm/msr-index.h   |   1 +
 xen/arch/x86/msr.c                     |   5 +-
 xen/arch/x86/spec_ctrl.c               | 106 +++++++++++++++++++++++++++++++--
 6 files changed, 126 insertions(+), 8 deletions(-)

-- 
2.11.0


