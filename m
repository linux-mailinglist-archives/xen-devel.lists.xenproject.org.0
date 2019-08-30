Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D112DA2CA9
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 04:08:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3WIC-0000On-LB; Fri, 30 Aug 2019 02:05:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D47i=W2=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i3WIA-0000Oi-JP
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 02:05:34 +0000
X-Inumbo-ID: a54d844f-caca-11e9-ae75-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a54d844f-caca-11e9-ae75-12813bfff9fa;
 Fri, 30 Aug 2019 02:05:33 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 19:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; d="scan'208";a="172091653"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga007.jf.intel.com with ESMTP; 29 Aug 2019 19:05:31 -0700
Date: Fri, 30 Aug 2019 10:09:36 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20190830020934.GA31575@gao-cwp>
References: <e184002b-f1f9-c1a1-4c58-1d4623538bd0@eikelenboom.it>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <e184002b-f1f9-c1a1-4c58-1d4623538bd0@eikelenboom.it>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [Xen-unstable] boot crash while loading AMD
 microcode due to commit "microcode/amd: fix memory leak"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 30, 2019 at 01:04:54AM +0200, Sander Eikelenboom wrote:
>L.S.,
>
>While testing xen-unstable, my AMD system crashes during early boot while loading microcode with an "Early fatal page fault".
>Reverting commit de45e3ff37bb1602796054afabfa626ea5661c45 "microcode/amd: fix memory leak" fixes the boot issue.

Sorry for this inconvenience.

Could you apply the patch attached and try it again?

>
>At present I don't have my serial console stuff at hand, but if needed I can send the stacktrace tomorrow.
>

Yes. That would be helpful.

Thanks
Chao

--zhXaljGHf11kAtnf
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="check_mc_old.patch"

diff --git a/xen/arch/x86/microcode_amd.c b/xen/arch/x86/microcode_amd.c
index 3069784..9b74330 100644
--- a/xen/arch/x86/microcode_amd.c
+++ b/xen/arch/x86/microcode_amd.c
@@ -552,9 +552,12 @@ static int cpu_request_microcode(unsigned int cpu, const void *buf,
         mc_old = mc_amd;
     }
 
-    xfree(mc_old->mpb);
-    xfree(mc_old->equiv_cpu_table);
-    xfree(mc_old);
+    if ( mc_old )
+    {
+        xfree(mc_old->mpb);
+        xfree(mc_old->equiv_cpu_table);
+        xfree(mc_old);
+    }
 
   out:
 #if CONFIG_HVM

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--zhXaljGHf11kAtnf--

