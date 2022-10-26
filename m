Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7860E5FD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 19:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430700.682666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onjlp-0006Cp-B1; Wed, 26 Oct 2022 17:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430700.682666; Wed, 26 Oct 2022 17:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onjlp-0006AY-7V; Wed, 26 Oct 2022 17:00:49 +0000
Received: by outflank-mailman (input) for mailman id 430700;
 Wed, 26 Oct 2022 17:00:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/gdy=23=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1onjln-0006A5-QI
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 17:00:47 +0000
Received: from sonic308-55.consmr.mail.gq1.yahoo.com
 (sonic308-55.consmr.mail.gq1.yahoo.com [98.137.68.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba1a1f97-554f-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 19:00:45 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 17:00:42 +0000
Received: by hermes--production-ne1-c47ffd5f5-8c2cz (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 93f63f5da119448f595de422776c389f; 
 Wed, 26 Oct 2022 17:00:38 +0000 (UTC)
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
X-Inumbo-ID: ba1a1f97-554f-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1666803642; bh=eU7PpBLLODdhmYNTWitUDr6syhPI4x30puQr0AkwZn0=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=JNWP5RxiSEimCPsFJEl5ySrpR8ZaHnJfgcTFBWhbHjxa+DX+yv6qC507mCEFdXj4/5qw9+e+sJD3nJgbF3jvpqbggjXIU6S0u9IzPaTBCIaufbrPLAWwxF6E/MpNiwtbZDFJ9H/N4+hd+V3eRGrbKyLh45olIAZu0D1lFyhzP1zlMoAvrx4m0Wg/f4sXw0yShsnFHWki+lppr6yAe+6P2yqp+/SFiRihd9lYQubx6sEB3q5uJhSk1Vd6rLpHo35abuciG1TlYlhg1e25xb22wMH5HSa1VbUdd9dHc7rpNCLs0UZb4+70twf1G8C3ZPxmvXF5C+crj7/Qj1tnZ0pkQg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1666803642; bh=FXj5u+59eDkG4z/KjVnwtjqV21VAHHrc8/npF8OKk4t=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=HUpTDXsO1/GSukqr3jTqsIL846hT4f4YfXtyBNVwLcjf/31l7VEHy+PZv+ScLGacBqJi5sHrRBCxxR2tDLGVPg3YpTco5SrKJsi1Jww8A+H2nOR/nbF9VSC4hn9ai1yjDxwnAMrqzwUw6ldJAAyx27sfjo5b70LX5aYbkN0e6VcciaoSmwTBc4WVTN0jDRBjelR1++ytOnoOb4EXgTkKuIP/uM2fQ6jgsKl+LKoU7+GDbQf0AaTTKFvVPerg2+ji7bwNIidcXrxUuAZdKtjINqJSkg1XzQdP9KMNeLSvwdzJW3d3Da/HnY+Q8qEj+/KQsmeaDZwrBDyjiPIZ+d7NOQ==
X-YMail-OSG: bzItIX4VM1mi9pZWtTQTBkPiuqurRbhqdnekxPNUMqpuXt._1ZwXAh.j5pzGcHG
 tuG4gfVPZkxPTHgP3RoPQ56NHOFwnm0wZcEJEgRA.qwntNEjJHFacsUahBMO.mGHXWpgF.BBIr6D
 f1Hq5w0_c3JrwIyhbYqeIYxaTdWgjKkFRXG4pr8ySj1d8VFyVZ6ZwGx43bTPd_iWFvr6Ef73e2Nn
 S1pHC_wTyYwGCv3FtMRKsm_nIEG3BhWa541rC0ipTVanydFS2j0D7jzpEYQwTbOoosq1zuSMXCat
 IoUEc5LXejeEQyp5ETHbNina2ycd1OuOnwuK7fQI9JUiH4aYSMnwOdTkUO0P.vHAfZuuMmUAHRyZ
 XyDToY0TRNjaNWEz7QS_2qHQhwp8iNYsbp9AqX9qorX.hWtvnImJkKJ6gr7BTZYS4lAqO9TKb7VK
 rL59ezfk8OMxt3DMqKnXPOxmIJSg1EetWMAtsCf8Y3Wu0Zt_VG0SZ23BsHkddTd9jq1x8WItyvf9
 dm2.7QRoqYFx0XuubQ5QAzR6AGB4mJdr.vEyT3O3ZztkRjVUcwWdHF5SRfYAVGzyuhUI4QvjAWvS
 xcjeksl3OT9Ql.V41tax_qOWohQuNDUC1uWUUd.5gZJN3ybh5LW8Y6A9n7A.n86EYnwr8s7l9QL5
 BjUAKECJlRNcLfj0L8TuzPCDLfH_urW5Itkam2jkdSmmPzH7.fALmmQNcomTqOMkBQb_4B1bWzN3
 1qKPykeQqosAEgSq4y_cmq0_Jik0c3S.Mios_Quoa7zknicejDjNyLoYAn39hAlsQcVQrfedk1YT
 yi0_yBCiIwYEKSt_VvWSOndEi_rB0E.vu7231jUvpdYDUnPSJd5Gz.F8UfZjDhucGKa_uCao.kZ3
 x_8uNdvGF052axxVf8oIhpKrwjtyM38eToCsoDTWBtm15ptWb.KnZuP7aOobSw7ZMJREdI4FbHeT
 PXgAIyiw.RLmZRREF1CioTG5H.d_XRILScBzWf3VQW1OaYPtkiwZn7HVmbzKWrcKybhQJQK6xGA4
 twqWo_voi3Fq10vq2wpMEZMFcJ1iQPU5OlARuSMyWQIhcv4uz1F.mLSqwp7Up4HmQPeNCFJu3Qdo
 pDj9.Y4i3qEazsEp8pyEmPiMFzxELtH9xxZ6I7OBoOfE4CMY4q6leUsy3diQUu7IJDUhuJeXxdrw
 vFhe7m1v5LQMHwPiDeXup.MRTxKmw9I7iud7ID5k_gyNdnUUaDQds0V6W7auum_16N45B8VpaBvD
 f1HGpTFV.XMJecrVXmtK2y2reVe5ImeHcZPkKRIw8.iw46ks21jRrBHOGZATpOW6l6B0Mw_fcy5u
 MIJ.kOWzbONVc3FhvB6DiyKnv05.dcCCXt7lrFUL89EDsrRZ3xVTfzGMZVSGLXFTWKMdyLtt2DPk
 e1t5o7CVWMOxjrqHjfde0WnzAWAn2ecG0QaaN1CnMzxFJKGZNj6j_qAIaOA9O6E_FbiuuqlANMrv
 JUZP2DnB6t3V1yPOLU1vrNpw7RRLSYMVN3EMK.e_5Ndcq3DO2ZNSFphilpmCNRbgShaNdesw5rke
 hac9lp529iMSLPxFWZwIGPtmUMR9M3XDHrQg_NlGGKkvgHhQ7dNSea7CzlhUBXVeqbnzbZA6C20I
 zNVLwTObc8XneKPMn95fiCXIlIKouUE1oDSbP.n3Y47k3tzGGWMMbA1ziW26r8zH8Bn2M_gx0TMW
 WQgmcwmdiUY9HXjCsSsrCDCqNsQ5T4UtSzoyYAxOHMM3nfkh1I_PwLBCjKxTC4xUIOnNnXz_61Ow
 .8I1LcUL6SZDwWXXUa0UslXxoxqlLBL1BaEEaiqIKBvXpdVSFSjhMzT12.a_wiYU.ZQCiB4U9NV0
 63DAezE8sUVytZLw9FowqT.MEg.HNKEvDZfIDf30iJmzYMfutUxoUQZDSVGSet6OvwE5qsqIK7J4
 V4ttTU6aXBStkx7gX_PCMxjyuHPFrF2GFjyo7_EwJ2MNGmMhUp1jGhtNyQisZ_E8nemsXnqnKEEH
 sFiJ25iTG7jeGIUZ.2xOvIJX7t2AVq0VTVXutvW0F._OAmsN.05Qg.XXyEftdjP3fcPh5xzD8nO_
 Zjt_chzcAXyv8MnxCWfxu3edbGnD0..pgiTrpNMAxx2twdHsVqWq6aRa_ssw5ZIDfe5FC7yqs6M7
 nd1yToQ6Tef.1N1BKv4ZPuNKM1Q0WQDeLhRny.Az1xOJge5e0x2wRGilz75AruBcu6NduQsPJAtI
 3jKuupKt6
X-Sonic-MF: <brchuckz@aim.com>
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Chuck Zmudzinski <brchuckz@netscape.net>
Subject: [PATCH v3 1/2] xen/pt: fix syntax error that causes FTBFS in some configurations
Date: Wed, 26 Oct 2022 13:00:26 -0400
Message-Id: <1b63dcf10b2e99c6dba5f0c9b16bac3ac58d3848.1666802059.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1666802059.git.brchuckz@netscape.net>
References: <cover.1666802059.git.brchuckz@netscape.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
and the target os is linux, the build fails with:

meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.

Fixes: 582ea95f5f93 ("meson: convert hw/xen")

Signed-off-by: Chuck Zmudzinski <brchuckz@netscape.net>
---
v2: Remove From: <email address> tag at top of commit message

v3: No change to this patch since v2

 hw/xen/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 08dc1f6857..ae0ace3046 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -18,7 +18,7 @@ if have_xen_pci_passthrough
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add('xen_pt_stub.c')
+  xen_specific_ss.add(files('xen_pt_stub.c'))
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
-- 
2.37.2


