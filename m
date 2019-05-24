Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1E429E89
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 20:55:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUFJs-0002Ai-CF; Fri, 24 May 2019 18:53:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oV0n=TY=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1hUFJr-0002AY-KC
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 18:53:31 +0000
X-Inumbo-ID: 35f5bdda-7e55-11e9-b873-db7988225b83
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35f5bdda-7e55-11e9-b873-db7988225b83;
 Fri, 24 May 2019 18:53:25 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hUFJk-00030Y-LA; Fri, 24 May 2019 18:53:24 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hUFJk-0004wl-Bn; Fri, 24 May 2019 18:53:24 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hUFJk-0000Qp-B6; Fri, 24 May 2019 18:53:24 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hUFJk-0000Qp-B6@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 24 May 2019 18:53:24 +0000
Subject: [Xen-devel] [xen-unstable bisection] complete
 test-armhf-armhf-xl-vhd
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5215369300449882854=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5215369300449882854==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-armhf-armhf-xl-vhd
testid debian-di-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
  Bug not present: 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136907/


  commit 3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
  Author: Olaf Hering <olaf@aepfle.de>
  Date:   Tue May 14 09:27:41 2019 +0200
  
      libxl: add helper function to set device_model_version
      
      An upcoming change will set the value of device_model_version properly
      also for the non-HVM case.
      
      Move existing code to new function libxl__domain_set_device_model.
      Move also initialization for device_model_stubdomain to that function.
      Make sure libxl__domain_build_info_setdefault is called with
      device_model_version set.
      
      Update libxl__spawn_stub_dm() and initiate_domain_create() to call the
      new function prior libxl__domain_build_info_setdefault() because
      device_mode_version is expected to be initialzed.
      libxl_domain_need_memory() needs no update because it does not have a
      d_config available anyway, and the callers provide a populated b_info.
      
      The upcoming change needs a full libxl_domain_config, and the existing
      libxl__domain_build_info_setdefault has just a libxl_domain_build_info
      to work with.
      
      Signed-off-by: Olaf Hering <olaf@aepfle.de>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Wei Liu <wei.liu2@citrix.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-armhf-armhf-xl-vhd.debian-di-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-armhf-armhf-xl-vhd.debian-di-install --summary-out=tmp/136907.bisection-summary --basis-template=136156 --blessings=real,real-bisect xen-unstable test-armhf-armhf-xl-vhd debian-di-install
Searching for failure / basis pass:
 136751 fail [host=arndale-metrocentre] / 136273 [host=arndale-westfield] 136156 [host=cubietruck-gleizes] 136034 [host=cubietruck-picasso] 135931 [host=cubietruck-braque] 135816 [host=arndale-lakeside] 135680 [host=arndale-bluewater] 135481 [host=arndale-westfield] 135425 ok.
Failure / basis pass flights: 136751 / 135425
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 4973997f70860c10093ce34294be0c588ddc8cf3
Basis pass e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 dc497635d93f6672f82727ad97a55205177be2aa
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#e64ac26749dc2c0f390caccd04274608ab31c8cf-e64ac26749dc2c0f390caccd04274608ab31c8cf git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen.git#de5b678ca4dcdfa83e322491d478d66df56c1986-9cca02d8ffc23e9688a971d858e4ffdff5389b11 git://xenbits.xen.org/xen.git#dc497635d93f6672f82727ad97a55205177be2aa-4973997\
 f70860c10093ce34294be0c588ddc8cf3
adhoc-revtuple-generator: tree discontiguous: qemu-xen
Loaded 1002 nodes in revision graph
Searching for test results:
 135425 pass e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 dc497635d93f6672f82727ad97a55205177be2aa
 135481 [host=arndale-westfield]
 135680 [host=arndale-bluewater]
 135816 [host=arndale-lakeside]
 135931 [host=cubietruck-braque]
 136034 [host=cubietruck-picasso]
 136156 [host=cubietruck-gleizes]
 136273 [host=arndale-westfield]
 136440 fail e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 5945b57b055abcab803d23974e95c3657ef597fb
 136592 fail e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 ae0e5f204cb42440e244419e6a92f7fd90eb25bb
 136751 fail e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 4973997f70860c10093ce34294be0c588ddc8cf3
 136852 pass e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 de5b678ca4dcdfa83e322491d478d66df56c1986 dc497635d93f6672f82727ad97a55205177be2aa
 136902 pass e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
 136867 fail e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 ae0e5f204cb42440e244419e6a92f7fd90eb25bb
 136903 fail e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
 136873 pass e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 77639c903c97a0a5699686d236967f4c490230a5
 136887 pass e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
 136893 fail e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 4973997f70860c10093ce34294be0c588ddc8cf3
 136875 pass e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 14e122fcc45d8a86e27be9663cbd7bcea1602b25
 136895 fail e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 c5d7f01cb9051a334f1acd5b68b4341c38d6344a
 136904 pass e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
 136881 fail e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 e911b4e26fc451f807dc47dc4c7ad80cebee66d6
 136897 fail e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
 136907 fail e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
Searching for interesting versions
 Result found: flight 135425 (pass), for basis pass
 Result found: flight 136751 (fail), for basis failure
 Repro found: flight 136852 (pass), for basis pass
 Repro found: flight 136893 (fail), for basis failure
 0 revisions at e64ac26749dc2c0f390caccd04274608ab31c8cf c530a75c1e6a472b0eb9558310b518f0dfcd8860 9cca02d8ffc23e9688a971d858e4ffdff5389b11 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
No revisions left to test, checking graph state.
 Result found: flight 136887 (pass), for last pass
 Result found: flight 136897 (fail), for first failure
 Repro found: flight 136902 (pass), for last pass
 Repro found: flight 136903 (fail), for first failure
 Repro found: flight 136904 (pass), for last pass
 Repro found: flight 136907 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
  Bug not present: 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136907/


  commit 3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
  Author: Olaf Hering <olaf@aepfle.de>
  Date:   Tue May 14 09:27:41 2019 +0200
  
      libxl: add helper function to set device_model_version
      
      An upcoming change will set the value of device_model_version properly
      also for the non-HVM case.
      
      Move existing code to new function libxl__domain_set_device_model.
      Move also initialization for device_model_stubdomain to that function.
      Make sure libxl__domain_build_info_setdefault is called with
      device_model_version set.
      
      Update libxl__spawn_stub_dm() and initiate_domain_create() to call the
      new function prior libxl__domain_build_info_setdefault() because
      device_mode_version is expected to be initialzed.
      libxl_domain_need_memory() needs no update because it does not have a
      d_config available anyway, and the callers provide a populated b_info.
      
      The upcoming change needs a full libxl_domain_config, and the existing
      libxl__domain_build_info_setdefault has just a libxl_domain_build_info
      to work with.
      
      Signed-off-by: Olaf Hering <olaf@aepfle.de>
      Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
      Acked-by: Wei Liu <wei.liu2@citrix.com>

pnmtopng: 222 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-armhf-armhf-xl-vhd.debian-di-install.{dot,ps,png,html,svg}.
----------------------------------------
136907: tolerable ALL FAIL

flight 136907 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/136907/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-armhf-armhf-xl-vhd      10 debian-di-install       fail baseline untested


jobs:
 test-armhf-armhf-xl-vhd                                      fail    


------------------------------------------------------------
sg-report-flight on osstest.test-lab.xenproject.org
logs: /home/logs/logs
images: /home/logs/images

Logs, config files, etc. are available at
    http://logs.test-lab.xenproject.org/osstest/logs

Explanation of these reports, and of osstest in general, is at
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README.email;hb=master
    http://xenbits.xen.org/gitweb/?p=osstest.git;a=blob;f=README;hb=master

Test harness code can be found at
    http://xenbits.xen.org/gitweb?p=osstest.git;a=summary



--===============5215369300449882854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5215369300449882854==--
