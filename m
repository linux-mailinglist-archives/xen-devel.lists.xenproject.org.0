Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7F2C416EF
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 20:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157862.1486481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHS3y-0002aW-Nf; Fri, 07 Nov 2025 19:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157862.1486481; Fri, 07 Nov 2025 19:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHS3y-0002YP-KK; Fri, 07 Nov 2025 19:23:58 +0000
Received: by outflank-mailman (input) for mailman id 1157862;
 Fri, 07 Nov 2025 19:23:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mrvs=5P=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1vHS3w-0002YJ-Nr
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 19:23:56 +0000
Received: from smarthost01a.sbp.mail.zen.net.uk
 (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bca03c5-bc0f-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 20:23:53 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01a.sbp.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1vHS3t-00DAvl-2j
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 19:23:52 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 6D86CDA9D97
 for <xen-devel@lists.xenproject.org>; Fri,  7 Nov 2025 19:23:52 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([IPv6:::1])
 by localhost (mail0.xen.dingwall.me.uk [IPv6:::1]) (amavis, port 10024)
 with ESMTP id G9XRg2WmnLTn for <xen-devel@lists.xenproject.org>;
 Fri,  7 Nov 2025 19:23:52 +0000 (GMT)
Received: from ghoul.dingwall.me.uk (ghoul.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:1c8])
 by dingwall.me.uk (Postfix) with ESMTP id 35E72DA9D92
 for <xen-devel@lists.xenproject.org>; Fri,  7 Nov 2025 19:23:52 +0000 (GMT)
Received: by ghoul.dingwall.me.uk (Postfix, from userid 1000)
 id 17BBA7F4; Fri,  7 Nov 2025 19:23:51 +0000 (GMT)
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
X-Inumbo-ID: 4bca03c5-bc0f-11f0-9d17-b5c5bf9af7f9
X-Virus-Scanned: Debian amavis at dingwall.me.uk
Date: Fri, 7 Nov 2025 19:23:51 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] fix xl.cfg docs to correct viridian defaults list
Message-ID: <aQ5HR2eEQ9awKtpC@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UBzguPwngLXLn4Ib"
Content-Disposition: inline
X-Originating-smarthost01a-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189


--UBzguPwngLXLn4Ib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I was trying to work out why this would cause my Windows 10 guest to hang
when it should have been equivalent to ['defaults'] or 1.

viridian = ['base', 'freq', 'apic_assist', 'crash_ctl', 'no_vp_limit', 'cpu_hotplug', 'time_ref_count', 'stimer']

Checking the libxl sources show that in fact the defaults are:

    if (libxl_defbool_val(info->u.hvm.viridian)) {
        /* Enable defaults */
        libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_BASE);
        libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_FREQ);
        libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_TIME_REF_COUNT);
        libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_APIC_ASSIST);
        libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CRASH_CTL);
        libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_NO_VP_LIMIT);
        libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CPU_HOTPLUG);
    }

LIBXL_VIRIDIAN_ENLIGHTENMENT_STIMER was removed as a default enlightement in
e83077a3d11072708a5c38fa09fa9d011914e2a1 but the docs were not kept aligned.

Thanks,
James

--UBzguPwngLXLn4Ib
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="af3b374637bae4b30091f731f2bfeea4460478da.diff"

commit af3b374637bae4b30091f731f2bfeea4460478da
Author: James Dingwall <james@dingwall.me.uk>
Date:   Fri Nov 7 19:09:56 2025 +0000

    doc/man: align list of viridian default enlightenments with libxl
    
    The stimer enlightment was removed from the defaults list in
    e83077a3d11072708a5c38fa09fa9d011914e2a1 but the corresponding docs
    change was not made.  Removing from docs as enabling the enlightenment
    will hang Windows 10 guests.
    
    Signed-off-by: James Dingwall <james@dingwall.me.uk>

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index ad1553c5e9..27c455210b 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -2503,7 +2503,7 @@ guests effectively allowing vCPU hotplug.
 
 This is a special value that enables the default set of groups, which
 is currently the B<base>, B<freq>, B<time_ref_count>, B<apic_assist>,
-B<crash_ctl>, B<stimer>, B<no_vp_limit> and B<cpu_hotplug> groups.
+B<crash_ctl>, B<no_vp_limit> and B<cpu_hotplug> groups.
 
 =item B<all>
 

--UBzguPwngLXLn4Ib--

