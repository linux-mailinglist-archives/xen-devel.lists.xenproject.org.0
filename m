Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6D5CF2C
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 14:12:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiHbJ-00038s-1f; Tue, 02 Jul 2019 12:09:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SKLB=U7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hiHbI-00038n-1T
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 12:09:32 +0000
X-Inumbo-ID: 3e0a30f6-9cc2-11e9-a8ed-4b0a977706c4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e0a30f6-9cc2-11e9-a8ed-4b0a977706c4;
 Tue, 02 Jul 2019 12:09:29 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TKPPbisAXMaFxkKOGpTAhyIqnDa3UGj6ee6N8LLHtvSzqiD71Yla52sSaxfWjEL6hZ1r0vgQux
 zIaY09xDIOzCW9zWGLmEevPz45jKKNmICgrSC2qbPeQfASmhzW9ErYbiIGXqjHxmgg9GlWuOQG
 pLJN340XHxbLf2s/QY7o4NJVLXvmHNuq/gOnsshF/ECRSqVBOZGfGwQVQybxQDMazVe0ZoIMFo
 AmHQLUeqcC09cMe+TohBad9vctMc+AJuR/eRMd0J1b+C10pkCSTDQ91RoGnPaeK63dM43irW/V
 63A=
X-SBRS: 2.7
X-MesageID: 2539780
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,443,1557201600"; d="scan'208,217";a="2539780"
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D14DDA6020000780023B96E@prv1-mh.provo.novell.com>
 <5D14DE87020000780023B97E@prv1-mh.provo.novell.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <3d3ea9db-b6b9-67ec-e69b-676baeae7dde@citrix.com>
Date: Tue, 2 Jul 2019 13:09:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <5D14DE87020000780023B97E@prv1-mh.provo.novell.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 02/10] AMD/IOMMU: use bit field for
 extended feature register
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
Cc: Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: multipart/mixed; boundary="===============9050852243201947566=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============9050852243201947566==
Content-Type: multipart/alternative;
	boundary="------------8482BD796D9A4B214EE42079"
Content-Language: en-GB

--------------8482BD796D9A4B214EE42079
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 27/06/2019 16:19, Jan Beulich wrote:
>      printk("AMD-Vi: IOMMU Extended Features:\n");
>  
> -    while ( feature_str[i] )
> +#define MASK(fld) ((union amd_iommu_ext_features){ .flds.fld = ~0 }).raw
> +#define FEAT(fld, str) do { \
> +    if ( MASK(fld) & (MASK(fld) - 1) ) \
> +        printk( "- " str ": %#x\n", iommu->features.flds.fld); \
> +    else if ( iommu->features.raw & MASK(fld) ) \
> +        printk( "- " str "\n"); \
> +} while ( false )

Sadly, Clang dislikes this construct.

https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/243795095 
(Click on the "Complete Raw" button)

iommu_detect.c:90:5: error: implicit truncation from 'int' to bitfield changes value from -1 to 1 [-Werror,-Wbitfield-constant-conversion]
    FEAT(pref_sup,           "Prefetch Pages Command");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
iommu_detect.c:84:10: note: expanded from macro 'FEAT'
    if ( MASK(fld) & (MASK(fld) - 1) ) \
         ^~~~~~~~~
iommu_detect.c:82:64: note: expanded from macro 'MASK'
#define MASK(fld) ((union amd_iommu_ext_features){ .flds.fld = ~0 }).raw
                                                               ^~


which is a shame.  Furthermore, switching to ~(0u) won't work either,
because that will then get a truncation warning.

Clever as this trick is, this is write-once code and isn't going to
change moving forward.  I'd do away with the compile-time cleverness and
have simple FEAT() and MASK() macros, and use the correct one below.

> --- a/xen/include/asm-x86/hvm/svm/amd-iommu-defs.h
> +++ b/xen/include/asm-x86/hvm/svm/amd-iommu-defs.h
> @@ -346,26 +346,57 @@ struct amd_iommu_dte {
> +union amd_iommu_ext_features {
> +    uint64_t raw;
> +    struct {
> +        unsigned int pref_sup:1;
> +        unsigned int ppr_sup:1;
> +        unsigned int xt_sup:1;
> +        unsigned int nx_sup:1;
> +        unsigned int gt_sup:1;
> +        unsigned int gappi_sup:1;
> +        unsigned int ia_sup:1;
> +        unsigned int ga_sup:1;
> +        unsigned int he_sup:1;
> +        unsigned int pc_sup:1;
> +        unsigned int hats:2;
> +        unsigned int gats:2;
> +        unsigned int glx_sup:2;
> +        unsigned int smif_sup:2;
> +        unsigned int smif_rc:3;
> +        unsigned int gam_sup:3;
> +        unsigned int dual_ppr_log_sup:2;
> +        unsigned int :2;
> +        unsigned int dual_event_log_sup:2;
> +        unsigned int :1;
> +        unsigned int sats_sup:1;
> +        unsigned int pas_max:5;
> +        unsigned int us_sup:1;
> +        unsigned int dev_tbl_seg_sup:2;
> +        unsigned int ppr_early_of_sup:1;
> +        unsigned int ppr_auto_rsp_sup:1;
> +        unsigned int marc_sup:2;
> +        unsigned int blk_stop_mrk_sup:1;
> +        unsigned int perf_opt_sup:1;
> +        unsigned int msi_cap_mmio_sup:1;
> +        unsigned int :1;
> +        unsigned int gio_sup:1;
> +        unsigned int ha_sup:1;
> +        unsigned int eph_sup:1;
> +        unsigned int attr_fw_sup:1;
> +        unsigned int hd_sup:1;
> +        unsigned int :1;
> +        unsigned int inv_iotlb_type_sup:1;
> +        unsigned int viommu_sup:1;
> +        unsigned int vm_guard_io_sup:1;
> +        unsigned int vm_table_size:4;
> +        unsigned int ga_update_dis_sup:1;
> +        unsigned int :2;
> +    } flds;

Why the .flds name?  What is wrong with this becoming anonymous?

~Andrew

--------------8482BD796D9A4B214EE42079
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 27/06/2019 16:19, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5D14DE87020000780023B97E@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">     printk("AMD-Vi: IOMMU Extended Features:\n");
 
-    while ( feature_str[i] )
+#define MASK(fld) ((union amd_iommu_ext_features){ .flds.fld = ~0 }).raw
+#define FEAT(fld, str) do { \
+    if ( MASK(fld) &amp; (MASK(fld) - 1) ) \
+        printk( "- " str ": %#x\n", iommu-&gt;features.flds.fld); \
+    else if ( iommu-&gt;features.raw &amp; MASK(fld) ) \
+        printk( "- " str "\n"); \
+} while ( false )</pre>
    </blockquote>
    <br>
    Sadly, Clang dislikes this construct.<br>
    <br>
    <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/243795095">https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/243795095</a> 
    (Click on the "Complete Raw" button)<br>
    <br>
    <pre>iommu_detect.c:90:5: error: implicit truncation from 'int' to bitfield changes value from -1 to 1 [-Werror,-Wbitfield-constant-conversion]
    FEAT(pref_sup,           "Prefetch Pages Command");
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
iommu_detect.c:84:10: note: expanded from macro 'FEAT'
    if ( MASK(fld) &amp; (MASK(fld) - 1) ) \
         ^~~~~~~~~
iommu_detect.c:82:64: note: expanded from macro 'MASK'
#define MASK(fld) ((union amd_iommu_ext_features){ .flds.fld = ~0 }).raw
                                                               ^~</pre>
    <br>
    which is a shame.  Furthermore, switching to ~(0u) won't work
    either, because that will then get a truncation warning.<br>
    <br>
    Clever as this trick is, this is write-once code and isn't going to
    change moving forward.  I'd do away with the compile-time cleverness
    and have simple FEAT() and MASK() macros, and use the correct one
    below.<br>
    <br>
    <blockquote type="cite"
      cite="mid:5D14DE87020000780023B97E@prv1-mh.provo.novell.com">
      <pre class="moz-quote-pre" wrap="">--- a/xen/include/asm-x86/hvm/svm/amd-iommu-defs.h
+++ b/xen/include/asm-x86/hvm/svm/amd-iommu-defs.h
@@ -346,26 +346,57 @@ struct amd_iommu_dte {
+union amd_iommu_ext_features {
+    uint64_t raw;
+    struct {
+        unsigned int pref_sup:1;
+        unsigned int ppr_sup:1;
+        unsigned int xt_sup:1;
+        unsigned int nx_sup:1;
+        unsigned int gt_sup:1;
+        unsigned int gappi_sup:1;
+        unsigned int ia_sup:1;
+        unsigned int ga_sup:1;
+        unsigned int he_sup:1;
+        unsigned int pc_sup:1;
+        unsigned int hats:2;
+        unsigned int gats:2;
+        unsigned int glx_sup:2;
+        unsigned int smif_sup:2;
+        unsigned int smif_rc:3;
+        unsigned int gam_sup:3;
+        unsigned int dual_ppr_log_sup:2;
+        unsigned int :2;
+        unsigned int dual_event_log_sup:2;
+        unsigned int :1;
+        unsigned int sats_sup:1;
+        unsigned int pas_max:5;
+        unsigned int us_sup:1;
+        unsigned int dev_tbl_seg_sup:2;
+        unsigned int ppr_early_of_sup:1;
+        unsigned int ppr_auto_rsp_sup:1;
+        unsigned int marc_sup:2;
+        unsigned int blk_stop_mrk_sup:1;
+        unsigned int perf_opt_sup:1;
+        unsigned int msi_cap_mmio_sup:1;
+        unsigned int :1;
+        unsigned int gio_sup:1;
+        unsigned int ha_sup:1;
+        unsigned int eph_sup:1;
+        unsigned int attr_fw_sup:1;
+        unsigned int hd_sup:1;
+        unsigned int :1;
+        unsigned int inv_iotlb_type_sup:1;
+        unsigned int viommu_sup:1;
+        unsigned int vm_guard_io_sup:1;
+        unsigned int vm_table_size:4;
+        unsigned int ga_update_dis_sup:1;
+        unsigned int :2;
+    } flds;</pre>
    </blockquote>
    <br>
    Why the .flds name?  What is wrong with this becoming anonymous?<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------8482BD796D9A4B214EE42079--


--===============9050852243201947566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9050852243201947566==--

