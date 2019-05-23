Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2309427DE8
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 15:18:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTnZa-0002sy-O5; Thu, 23 May 2019 13:15:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lac+=TX=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hTnZY-0002so-I3
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 13:15:52 +0000
X-Inumbo-ID: e117f588-7d5c-11e9-8f76-570f9b3cb37c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e117f588-7d5c-11e9-8f76-570f9b3cb37c;
 Thu, 23 May 2019 13:15:48 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hTnZT-0006mD-FL; Thu, 23 May 2019 13:15:47 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hTnZT-0006b9-9R; Thu, 23 May 2019 13:15:47 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hTnZT-0000YQ-8u; Thu, 23 May 2019 13:15:47 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-Id: <E1hTnZT-0000YQ-8u@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 23 May 2019 13:15:47 +0000
Subject: [Xen-devel] [xen-unstable bisection] complete
 test-amd64-amd64-xl-qcow2
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
Content-Type: multipart/mixed; boundary="===============2691221888446432462=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2691221888446432462==
Content-Type: text/plain

branch xen-unstable
xenbranch xen-unstable
job test-amd64-amd64-xl-qcow2
testid debian-di-install

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
  Bug not present: 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136848/


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
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-unstable/test-amd64-amd64-xl-qcow2.debian-di-install.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qcow2.debian-di-install --summary-out=tmp/136848.bisection-summary --basis-template=136156 --blessings=real,real-bisect xen-unstable test-amd64-amd64-xl-qcow2 debian-di-install
Searching for failure / basis pass:
 136592 fail [host=baroque0] / 136273 [host=albana0] 136156 [host=godello1] 136034 [host=elbling1] 135931 [host=pinot0] 135816 [host=pinot0] 135680 [host=pinot0] 135481 [host=pinot0] 135425 [host=elbling1] 135106 [host=elbling1] 135003 [host=elbling1] 134923 [host=elbling1] 134763 [host=elbling1] 134007 [host=godello0] 133984 [host=albana0] 133957 ok.
Failure / basis pass flights: 136592 / 133957
(tree with no url: minios)
(tree with no url: ovmf)
(tree with no url: seabios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: xen git://xenbits.xen.org/xen.git
Latest d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 ae0e5f204cb42440e244419e6a92f7fd90eb25bb
Basis pass d9896164529697fade02aafc65a06722f7191d68 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 59e9783ddf18e650622e0573cad4f08db65592e4
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#d9896164529697fade02aafc65a06722f7191d68-d929572d7da91169d3a22dfb75ede8bdced541c2 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#de5b678ca4dcdfa83e322491d478d66\
 df56c1986-9cca02d8ffc23e9688a971d858e4ffdff5389b11 git://xenbits.xen.org/xen.git#59e9783ddf18e650622e0573cad4f08db65592e4-ae0e5f204cb42440e244419e6a92f7fd90eb25bb
adhoc-revtuple-generator: tree discontiguous: qemu-xen
From git://cache:9419/git://xenbits.xen.org/xen
   aa6978c268..ac516e8940  stable-4.10 -> origin/stable-4.10
Loaded 2002 nodes in revision graph
Searching for test results:
 133984 [host=albana0]
 133957 pass d9896164529697fade02aafc65a06722f7191d68 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 59e9783ddf18e650622e0573cad4f08db65592e4
 134007 [host=godello0]
 134763 [host=elbling1]
 135003 [host=elbling1]
 134923 [host=elbling1]
 135106 [host=elbling1]
 135425 [host=elbling1]
 135481 [host=pinot0]
 135680 [host=pinot0]
 135816 [host=pinot0]
 135931 [host=pinot0]
 136034 [host=elbling1]
 136156 [host=godello1]
 136273 [host=albana0]
 136440 fail d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 5945b57b055abcab803d23974e95c3657ef597fb
 136593 pass d9896164529697fade02aafc65a06722f7191d68 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 59e9783ddf18e650622e0573cad4f08db65592e4
 136592 fail d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 ae0e5f204cb42440e244419e6a92f7fd90eb25bb
 136749 fail d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 ae0e5f204cb42440e244419e6a92f7fd90eb25bb
 136756 pass e1c70389a518337bd7e6965269b2ce8a501e019e c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 e83077a3d11072708a5c38fa09fa9d011914e2a1
 136734 fail d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 5945b57b055abcab803d23974e95c3657ef597fb
 136738 pass 80bf6c64d5cca26b4d2a94e38cbd89c2615a25c3 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 9b8b3f300f1f8aa93d7d4590d92bc746ce6412cb
 136765 pass d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 a2ad3e771b459c80cbfec23723290a611a4cd76c
 136743 pass 1ec8f1f0bffe34ebdf95dbe0fd4a6635a84612a8 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 a41feccdb6c03f12bddb4fb650a0465f0ed6eeca
 136747 pass 261eff5dd5b67d9424f2ac5f1f95e89fbdc50b3b c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 de5b678ca4dcdfa83e322491d478d66df56c1986 dc497635d93f6672f82727ad97a55205177be2aa
 136758 pass d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 29fa88969cfa0591b1606206bf79613a9e11c222
 136822 blocked d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 548a932ac786d6bf3584e4b54f2ab993e1117710
 136826 fail d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 bdd0f3c9b06f932d5bae2a277ae2efb233b48f04
 136829 pass d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 738faba9d74736dc8e5d7c5d3be53776097f6af1
 136830 blocked d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 cf7de5d9543bba1076fe8ede57b0d314394c943a
 136831 fail d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 899433f149d0cc48a5254c797d9e5a8c9dc3b0fb
 136836 pass d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 99bb45e684283b3bc621dbc99b1b93c856b4dd1c
 136835 blocked d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 14e122fcc45d8a86e27be9663cbd7bcea1602b25
 136838 pass d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
 136840 fail d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
 136842 pass d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
 136844 fail d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
 136846 pass d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
 136848 fail d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
Searching for interesting versions
 Result found: flight 133957 (pass), for basis pass
 Result found: flight 136592 (fail), for basis failure
 Repro found: flight 136593 (pass), for basis pass
 Repro found: flight 136749 (fail), for basis failure
 0 revisions at d929572d7da91169d3a22dfb75ede8bdced541c2 c530a75c1e6a472b0eb9558310b518f0dfcd8860 d0d8ad39ecb51cd7497cd524484fe09f50876798 9cca02d8ffc23e9688a971d858e4ffdff5389b11 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
No revisions left to test, checking graph state.
 Result found: flight 136838 (pass), for last pass
 Result found: flight 136840 (fail), for first failure
 Repro found: flight 136842 (pass), for last pass
 Repro found: flight 136844 (fail), for first failure
 Repro found: flight 136846 (pass), for last pass
 Repro found: flight 136848 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  3802ecbaa9eb36cbadce39ab03a4f6d36f29ae5c
  Bug not present: 2520a7f33836616077a2ca3bd96d0b8bdd7f9404
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/136848/


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

dot: graph is too large for cairo-renderer bitmaps. Scaling by 0.471936 to fit
pnmtopng: 40 colors found
Revision graph left in /home/logs/results/bisect/xen-unstable/test-amd64-amd64-xl-qcow2.debian-di-install.{dot,ps,png,html,svg}.
----------------------------------------
136848: tolerable ALL FAIL

flight 136848 xen-unstable real-bisect [real]
http://logs.test-lab.xenproject.org/osstest/logs/136848/

Failures :-/ but no regressions.

Tests which did not succeed,
including tests which could not be run:
 test-amd64-amd64-xl-qcow2    10 debian-di-install       fail baseline untested


jobs:
 test-amd64-amd64-xl-qcow2                                    fail    


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



--===============2691221888446432462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2691221888446432462==--
