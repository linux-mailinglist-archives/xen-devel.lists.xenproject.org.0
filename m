Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC5B45DB88
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231284.400244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF68-0004vl-0f; Thu, 25 Nov 2021 13:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231284.400244; Thu, 25 Nov 2021 13:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF67-0004fy-Em; Thu, 25 Nov 2021 13:47:35 +0000
Received: by outflank-mailman (input) for mailman id 231284;
 Thu, 25 Nov 2021 13:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzw-0007NX-I9
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5662e8e8-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:06 +0100 (CET)
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
X-Inumbo-ID: 5662e8e8-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sxCVIENXL7U4uJ6PAJaPF/nE5SLDBzALYwkN0k1BGWI=;
  b=Ep9XIVirbsQWcyJ24uWe3/3faAB5XVRNqkw8zX3xGfRt8c70mAiGwL75
   CctvCSPhYFRrN8bEoYyvx1bIml+zQJw0kiNKaDnRBd2pgX9ezAcocJoAh
   cVP75lvsu7oU4whfBz7DGAePwuEcOVKO1ieFK406Ss8V8ri64nfqZeSVr
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ah9LABVBcQ5ud4W8ehu1CUiyw3Vl4ew/y08mOCVWO2lPvIqSL3OQ3EGb70j6tFaVSOPU/cRzHh
 tqh8TLO0UdGid2HR3kLnb1/7anr5fV2QTh0DU3ddJb7Im96NmJAcfQMJ0wzVYRtsCwLngSXSD8
 Eg9BoRFQmgg1kqGf2oNv5a/YfMxVUYTwaSF3xvPE9CXirnjvo09UYnQmuTxnZUbtn0xIXNaa9x
 RTiMJBonkUXVy6VGsCuS1v0Ou7M8gPCw2cGgscy5b7X+ZukZ/INtGGtosSG6vFSEwi+cnM7oWZ
 kGdG0DfCduhr+OovybpiIHxU
X-SBRS: 5.1
X-MesageID: 60634139
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8piItqp4+FnnBj/uGEqKOyQLSaFeBmLlYhIvgKrLsJaIsI4StFCzt
 garIBmAa/yCNGL1eNxzPN/kpEMHupLUn99jQQY+rC0xRC0Q+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2ILkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZ+TVQsGPrDjobsmcDhkEyQ9Peoc97CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ZJHMmY2N0WojxtnK3saT78cru2T3njETxtgp0OYhpVw7D2GpOB2+Oe0a4eEEjCQfu1Xg0KZq
 2Tu72n/RBYAO7S30iGZ+3ihguvOmyLTW48IErC8sPlwjzW72Wg7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1ZpacMknN87QyQw0
 V2ElM+vAiZg2IB5UlrEqO3S92nrf3FIcylSPkfoUDfp/fHgg50/oRLSYe88K42Ust3wWjG3m
 T+F+X1Wa6ooseYH0KCy/Fbiij2qp4TUQgNd2jg7Tl5J/SsiOtf7OtXABUzzqK8Zcd3HFgXpU
 G0swpDGtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5YJlcFg
 2eJ4Gu9AaO/21PwMMdKj3qZUZhC8EQZPY2NugroRtRPeINtUwSM4TtjY0Wdt0i0zhNzzv5ua
 cfKK5j9ZZr/NUiA5GDoL9rxLJdxnnxurY8tbcyTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4EX/ZmPy53CbWkCgGOqNZ7BQlTcRATWMCnw+QKJ7XrClc3Rwkc5wr5nOpJl3pNxP8OyI8lP
 xiVBydl9bYIrSGddFjRNCk8MOiHsFQWhStTABHA9G2AgxALCbtDJo9FH3fuVbV4puFl09BuS
 PwJJ5eJDvhVE2yV8DUBd5jt6odlcU3z1w6JOiOkZhk5foJhGFOVqoO1IFO3+XlcFDezuOs/v
 6akilHRT60cSlkwF83Rcv+ukQ+85CBPhOJoUkLUCdBPY0GwopNyIin8g6ZvccEBIBnO3BWA0
 AOSDUtKrOXBudZtotLImbqFv8GiFO4nRhhWGGzS7LCXMyjG/zX8nd8cAbjQJT2EDTH64qSvY
 +lR3srQCvxfkQYYqZd4HpZq0bk6u4nlqYhFw1k2B37MdVmqVO9teyHUwclVu6RR7bZFog/qC
 FmX89xXNLjVasPoFFkdeFgsYuiZjKxGnzDT6bI+IVng5T8x972CCB0AMx6JgS1bDb10LIJ6n
 rtx5J9Is1Sy2kgwL9KLriFI7GDdfHUPXpIuuoweHIK22BEgzUtPYMCEByL7iH1Vhw6g7qX+z
 ueouZf/
IronPort-HdrOrdr: A9a23:4gWV6Ko+2+AKFz+8j3UshbgaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60634139"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 17/47] build: remove KBUILD_ specific from Makefile.host
Date: Thu, 25 Nov 2021 13:39:36 +0000
Message-ID: <20211125134006.1076646-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will allow $(HOSTCFLAGS) to actually be used when building
programmes for the build-host.

The other variable don't exist in our build system.

Also remove $(KBUILD_EXTMOD) since it should always be empty.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/scripts/Makefile.host | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/xen/scripts/Makefile.host b/xen/scripts/Makefile.host
index 8a85f94316bc..d6c358095ee8 100644
--- a/xen/scripts/Makefile.host
+++ b/xen/scripts/Makefile.host
@@ -82,18 +82,16 @@ host-cxxshobjs	:= $(addprefix $(obj)/,$(host-cxxshobjs))
 #####
 # Handle options to gcc. Support building with separate output directory
 
-_hostc_flags   = $(KBUILD_HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
+_hostc_flags   = $(HOSTCFLAGS)   $(HOST_EXTRACFLAGS)   \
                  $(HOSTCFLAGS_$(target-stem).o)
-_hostcxx_flags = $(KBUILD_HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
+_hostcxx_flags = $(HOSTCXXFLAGS) $(HOST_EXTRACXXFLAGS) \
                  $(HOSTCXXFLAGS_$(target-stem).o)
 
 # $(objtree)/$(obj) for including generated headers from checkin source files
-ifeq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
 _hostc_flags   += -I $(objtree)/$(obj)
 _hostcxx_flags += -I $(objtree)/$(obj)
 endif
-endif
 
 hostc_flags    = -Wp,-MD,$(depfile) $(_hostc_flags)
 hostcxx_flags  = -Wp,-MD,$(depfile) $(_hostcxx_flags)
@@ -104,17 +102,17 @@ hostcxx_flags  = -Wp,-MD,$(depfile) $(_hostcxx_flags)
 # Create executable from a single .c file
 # host-csingle -> Executable
 quiet_cmd_host-csingle 	= HOSTCC  $@
-      cmd_host-csingle	= $(HOSTCC) $(hostc_flags) $(KBUILD_HOSTLDFLAGS) -o $@ $< \
-		$(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
+      cmd_host-csingle	= $(HOSTCC) $(hostc_flags) $(HOSTLDFLAGS) -o $@ $< \
+		$(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
 $(host-csingle): $(obj)/%: $(src)/%.c FORCE
 	$(call if_changed_dep,host-csingle)
 
 # Link an executable based on list of .o files, all plain c
 # host-cmulti -> executable
 quiet_cmd_host-cmulti	= HOSTLD  $@
-      cmd_host-cmulti	= $(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ \
+      cmd_host-cmulti	= $(HOSTCC) $(HOSTLDFLAGS) -o $@ \
 			  $(addprefix $(obj)/, $($(target-stem)-objs)) \
-			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
+			  $(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
 $(host-cmulti): FORCE
 	$(call if_changed,host-cmulti)
 $(call multi-depend, $(host-cmulti), , -objs)
@@ -129,10 +127,10 @@ $(host-cobjs): $(obj)/%.o: $(src)/%.c FORCE
 # Link an executable based on list of .o files, a mixture of .c and .cc
 # host-cxxmulti -> executable
 quiet_cmd_host-cxxmulti	= HOSTLD  $@
-      cmd_host-cxxmulti	= $(HOSTCXX) $(KBUILD_HOSTLDFLAGS) -o $@ \
+      cmd_host-cxxmulti	= $(HOSTCXX) $(HOSTLDFLAGS) -o $@ \
 			  $(foreach o,objs cxxobjs,\
 			  $(addprefix $(obj)/, $($(target-stem)-$(o)))) \
-			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
+			  $(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
 $(host-cxxmulti): FORCE
 	$(call if_changed,host-cxxmulti)
 $(call multi-depend, $(host-cxxmulti), , -objs -cxxobjs)
@@ -163,9 +161,9 @@ $(host-cxxshobjs): $(obj)/%.o: $(src)/%.c FORCE
 # Link a shared library, based on position independent .o files
 # *.o -> .so shared library (host-cshlib)
 quiet_cmd_host-cshlib	= HOSTLLD -shared $@
-      cmd_host-cshlib	= $(HOSTCC) $(KBUILD_HOSTLDFLAGS) -shared -o $@ \
+      cmd_host-cshlib	= $(HOSTCC) $(HOSTLDFLAGS) -shared -o $@ \
 			  $(addprefix $(obj)/, $($(target-stem)-objs)) \
-			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
+			  $(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
 $(host-cshlib): FORCE
 	$(call if_changed,host-cshlib)
 $(call multi-depend, $(host-cshlib), .so, -objs)
@@ -173,9 +171,9 @@ $(call multi-depend, $(host-cshlib), .so, -objs)
 # Link a shared library, based on position independent .o files
 # *.o -> .so shared library (host-cxxshlib)
 quiet_cmd_host-cxxshlib	= HOSTLLD -shared $@
-      cmd_host-cxxshlib	= $(HOSTCXX) $(KBUILD_HOSTLDFLAGS) -shared -o $@ \
+      cmd_host-cxxshlib	= $(HOSTCXX) $(HOSTLDFLAGS) -shared -o $@ \
 			  $(addprefix $(obj)/, $($(target-stem)-objs)) \
-			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
+			  $(HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
 $(host-cxxshlib): FORCE
 	$(call if_changed,host-cxxshlib)
 $(call multi-depend, $(host-cxxshlib), .so, -objs)
-- 
Anthony PERARD


