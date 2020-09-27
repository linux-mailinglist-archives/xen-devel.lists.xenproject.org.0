Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A7C279E1B
	for <lists+xen-devel@lfdr.de>; Sun, 27 Sep 2020 06:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMOXG-0002NS-Kd; Sun, 27 Sep 2020 04:43:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mno3=DE=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kMOXF-0002Mw-0k
 for xen-devel@lists.xenproject.org; Sun, 27 Sep 2020 04:43:41 +0000
X-Inumbo-ID: 8454b0f5-cf40-4705-9e27-01b1e8fb92ad
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8454b0f5-cf40-4705-9e27-01b1e8fb92ad;
 Sun, 27 Sep 2020 04:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=Date:From:Message-Id:Subject:To;
 bh=E00kS0nKCIQHurSuxHo9y9d7gH4n9E1yD9XMlrRZ3Cw=; b=H+odHq+05lBXi11f65ube1VPoP
 LMF0ogXSu4nhFQ2CVL/X4BAGllko5J5aTo3lr2O+KBXTt1U6wKFB4eIWC6jSj2xO8YvvizIFSHUrN
 /HJYdLVu/AvBui3nCknyoOdtN2ylmSCNfF1MqyLxdhZSja33wPjQvCSMU5jHLHcjYiEk=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMOX5-0000fF-RQ; Sun, 27 Sep 2020 04:43:31 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kMOX5-0005OX-KA; Sun, 27 Sep 2020 04:43:31 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kMOX5-0004Ms-Ji; Sun, 27 Sep 2020 04:43:31 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Subject: [xen-4.13-testing bisection] complete test-xtf-amd64-amd64-4
Message-Id: <E1kMOX5-0004Ms-Ji@osstest.test-lab.xenproject.org>
From: osstest service owner <osstest-admin@xenproject.org>
Date: Sun, 27 Sep 2020 04:43:31 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

branch xen-4.13-testing
xenbranch xen-4.13-testing
job test-xtf-amd64-amd64-4
testid xtf/test-pv64-xsa-221

Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e1364e05f92d6c2f12cc77f100cea584354c66cb
  Bug not present: 5867a14ac1747d7411066d7fb2cf238658346ab0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154848/


  commit e1364e05f92d6c2f12cc77f100cea584354c66cb
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:24:29 2020 +0200
  
      evtchn/x86: enforce correct upper limit for 32-bit guests
      
      The recording of d->max_evtchns in evtchn_2l_init(), in particular with
      the limited set of callers of the function, is insufficient. Neither for
      PV nor for HVM guests the bitness is known at domain_create() time, yet
      the upper bound in 2-level mode depends upon guest bitness. Recording
      too high a limit "allows" x86 32-bit domains to open not properly usable
      event channels, management of which (inside Xen) would then result in
      corruption of the shared info and vCPU info structures.
      
      Keep the upper limit dynamic for the 2-level case, introducing a helper
      function to retrieve the effective limit. This helper is now supposed to
      be private to the event channel code. The used in do_poll() and
      domain_dump_evtchn_info() weren't consistent with port uses elsewhere
      and hence get switched to port_is_valid().
      
      Furthermore FIFO mode's setup_ports() gets adjusted to loop only up to
      the prior ABI limit, rather than all the way up to the new one.
      
      Finally a word on the change to do_poll(): Accessing ->max_evtchns
      without holding a suitable lock was never safe, as it as well as
      ->evtchn_port_ops may change behind do_poll()'s back. Using
      port_is_valid() instead widens some the window for potential abuse,
      until we've dealt with the race altogether (see XSA-343).
      
      This is XSA-342.
      
      Reported-by: Julien Grall <jgrall@amazon.com>
      Fixes: 48974e6ce52e ("evtchn: use a per-domain variable for the max number of event channels")
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      Reviewed-by: Julien Grall <jgrall@amazon.com>


For bisection revision-tuple graph see:
   http://logs.test-lab.xenproject.org/osstest/results/bisect/xen-4.13-testing/test-xtf-amd64-amd64-4.xtf--test-pv64-xsa-221.html
Revision IDs in each graph node refer, respectively, to the Trees above.

----------------------------------------
Running cs-bisection-step --graph-out=/home/logs/results/bisect/xen-4.13-testing/test-xtf-amd64-amd64-4.xtf--test-pv64-xsa-221 --summary-out=tmp/154938.bisection-summary --basis-template=154358 --blessings=real,real-bisect --flight=154938 xen-4.13-testing test-xtf-amd64-amd64-4 xtf/test-pv64-xsa-221
Searching for failure / basis pass:
 154667 fail [host=huxelrebe1] / 154602 [host=albana0] 154358 [host=godello0] 152528 [host=godello0] 151712 [host=elbling1] 151337 [host=albana0] 151153 [host=godello1] 151048 [host=pinot0] 150944 ok.
Failure / basis pass flights: 154667 / 150944
(tree with no url: minios)
Tree: linux git://xenbits.xen.org/linux-pvops.git
Tree: linuxfirmware git://xenbits.xen.org/osstest/linux-firmware.git
Tree: ovmf git://xenbits.xen.org/osstest/ovmf.git
Tree: qemu git://xenbits.xen.org/qemu-xen-traditional.git
Tree: qemuu git://xenbits.xen.org/qemu-xen.git
Tree: seabios git://xenbits.xen.org/osstest/seabios.git
Tree: xen git://xenbits.xen.org/xen.git
Tree: xtf git://xenbits.xen.org/xtf.git
Latest c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 88f5b414ac0f8008c1e2b26f93c3d980120941f7 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Basis pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 2e3de6253422112ae43e608661ba94ea6b345694 67958a166f6b019e5ad8dcd60a96dcd262669092 2a8859e87761a0efc119778e094f203dc2ea487a
Generating revisions with ./adhoc-revtuple-generator  git://xenbits.xen.org/linux-pvops.git#c3038e718a19fc596f7b1baba0f83d5146dc7784-c3038e718a19fc596f7b1baba0f83d5146dc7784 git://xenbits.xen.org/osstest/linux-firmware.git#c530a75c1e6a472b0eb9558310b518f0dfcd8860-c530a75c1e6a472b0eb9558310b518f0dfcd8860 git://xenbits.xen.org/osstest/ovmf.git#6ff7c838d09224dd4e4c9b5b93152d8db1b19740-fb97626fe04747ec89599dce0992def9a36e2f6b git://xenbits.xen.org/qemu-xen-traditional.git#d0d8ad39ecb51cd7497cd524484\
 fe09f50876798-d0d8ad39ecb51cd7497cd524484fe09f50876798 git://xenbits.xen.org/qemu-xen.git#730e2b1927e7d911bbd5350714054ddd5912f4ed-730e2b1927e7d911bbd5350714054ddd5912f4ed git://xenbits.xen.org/osstest/seabios.git#2e3de6253422112ae43e608661ba94ea6b345694-155821a1990b6de78dde5f98fa5ab90e802021e0 git://xenbits.xen.org/xen.git#67958a166f6b019e5ad8dcd60a96dcd262669092-88f5b414ac0f8008c1e2b26f93c3d980120941f7 git://xenbits.xen.org/xtf.git#2a8859e87761a0efc119778e094f203dc2ea487a-17d372b763cb0b2e2e6b5\
 a637c11f3997d2533fa
Loaded 10501 nodes in revision graph
Searching for test results:
 150944 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 2e3de6253422112ae43e608661ba94ea6b345694 67958a166f6b019e5ad8dcd60a96dcd262669092 2a8859e87761a0efc119778e094f203dc2ea487a
 151048 [host=pinot0]
 151153 [host=godello1]
 151337 [host=albana0]
 151712 [host=elbling1]
 152528 [host=godello0]
 154358 [host=godello0]
 154602 [host=albana0]
 154625 [host=pinot0]
 154690 [host=pinot0]
 154752 [host=pinot0]
 154763 [host=pinot0]
 154766 [host=pinot0]
 154772 [host=pinot0]
 154667 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 88f5b414ac0f8008c1e2b26f93c3d980120941f7 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154775 [host=pinot0]
 154779 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 2e3de6253422112ae43e608661ba94ea6b345694 67958a166f6b019e5ad8dcd60a96dcd262669092 2a8859e87761a0efc119778e094f203dc2ea487a
 154782 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 88f5b414ac0f8008c1e2b26f93c3d980120941f7 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154786 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 548c9669df410334363aa8aa1c90182bbefe4285 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed d9c812dda519a1a73e8370e1b81ddf46eb22ed16 378321bb1fd5272653ae64f0306827614a3bd196 ba5923110c2f562170b82f955d9ace70f6a4a8e2
 154791 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8a2732186a53e294085a0ea87234c4f07ed2badd d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154794 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a7632e913c1c106f436aefd5e76c394249c383a8 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154799 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 32b0a492d505434c6f5e6c3578cd34fee39cd25e d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 aa1d9a7dbfe07905f0b7218bcd433a513f762eb9 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154808 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 aa1d9a7dbfe07905f0b7218bcd433a513f762eb9 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154812 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 5867a14ac1747d7411066d7fb2cf238658346ab0 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154818 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 43572a4cd97902ba0155b922a4d2e99fb945ec2b 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154824 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 a8122e991da70ac1ee9f88e34e003d2169a5b114 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154828 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 e1364e05f92d6c2f12cc77f100cea584354c66cb 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154834 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 5867a14ac1747d7411066d7fb2cf238658346ab0 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154840 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 e1364e05f92d6c2f12cc77f100cea584354c66cb 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154845 pass c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 5867a14ac1747d7411066d7fb2cf238658346ab0 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
 154848 fail c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 e1364e05f92d6c2f12cc77f100cea584354c66cb 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
Searching for interesting versions
 Result found: flight 150944 (pass), for basis pass
 For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 5867a14ac1747d7411066d7fb2cf238658346ab0 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x5620119f71f0) HASH(0x5620119f6ef0) HASH(0x562011a06178) For basis failure, parent search stopping at c3038e718\
 a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 aa1d9a7dbfe07905f0b7218bcd433a513f762eb9 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x562011a04470) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 32b0a492d505434c6f5e6c35\
 78cd34fee39cd25e d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 aa1d9a7dbfe07905f0b7218bcd433a513f762eb9 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x5620119da0c0) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 a7632e913c1c106f436aefd5e76c394249c383a8 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4e\
 d 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f 17d372b763cb0b2e2e6b5a637c11f3997d2533fa, results HASH(0x5620119cf770) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 8a2732186a53e294085a0ea87234c4f07ed2badd d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 9b367b2b0b714f3ffb69ed6be0a118e8d3eac07f 17d372b763cb0\
 b2e2e6b5a637c11f3997d2533fa, results HASH(0x5620119e1928) For basis failure, parent search stopping at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 548c9669df410334363aa8aa1c90182bbefe4285 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed d9c812dda519a1a73e8370e1b81ddf46eb22ed16 378321bb1fd5272653ae64f0306827614a3bd196 ba5923110c2f562170b82f955d9ace70f6a4a8e2, results HASH(0x5620119d89b8) For basis failure, parent search stoppi\
 ng at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 6ff7c838d09224dd4e4c9b5b93152d8db1b19740 d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 2e3de6253422112ae43e608661ba94ea6b345694 67958a166f6b019e5ad8dcd60a96dcd262669092 2a8859e87761a0efc119778e094f203dc2ea487a, results HASH(0x5620119e0700) HASH(0x5620119d43a8) Result found: flight 154667 (fail), for basis failure (at ancestor ~1837)
 Repro found: flight 154779 (pass), for basis pass
 Repro found: flight 154782 (fail), for basis failure
 0 revisions at c3038e718a19fc596f7b1baba0f83d5146dc7784 c530a75c1e6a472b0eb9558310b518f0dfcd8860 fb97626fe04747ec89599dce0992def9a36e2f6b d0d8ad39ecb51cd7497cd524484fe09f50876798 730e2b1927e7d911bbd5350714054ddd5912f4ed 155821a1990b6de78dde5f98fa5ab90e802021e0 5867a14ac1747d7411066d7fb2cf238658346ab0 17d372b763cb0b2e2e6b5a637c11f3997d2533fa
No revisions left to test, checking graph state.
 Result found: flight 154812 (pass), for last pass
 Result found: flight 154828 (fail), for first failure
 Repro found: flight 154834 (pass), for last pass
 Repro found: flight 154840 (fail), for first failure
 Repro found: flight 154845 (pass), for last pass
 Repro found: flight 154848 (fail), for first failure

*** Found and reproduced problem changeset ***

  Bug is in tree:  xen git://xenbits.xen.org/xen.git
  Bug introduced:  e1364e05f92d6c2f12cc77f100cea584354c66cb
  Bug not present: 5867a14ac1747d7411066d7fb2cf238658346ab0
  Last fail repro: http://logs.test-lab.xenproject.org/osstest/logs/154848/


  commit e1364e05f92d6c2f12cc77f100cea584354c66cb
  Author: Jan Beulich <jbeulich@suse.com>
  Date:   Tue Sep 22 16:24:29 2020 +0200
  
      evtchn/x86: enforce correct upper limit for 32-bit guests
      
      The recording of d->max_evtchns in evtchn_2l_init(), in particular with
      the limited set of callers of the function, is insufficient. Neither for
      PV nor for HVM guests the bitness is known at domain_create() time, yet
      the upper bound in 2-level mode depends upon guest bitness. Recording
      too high a limit "allows" x86 32-bit domains to open not properly usable
      event channels, management of which (inside Xen) would then result in
      corruption of the shared info and vCPU info structures.
      
      Keep the upper limit dynamic for the 2-level case, introducing a helper
      function to retrieve the effective limit. This helper is now supposed to
      be private to the event channel code. The used in do_poll() and
      domain_dump_evtchn_info() weren't consistent with port uses elsewhere
      and hence get switched to port_is_valid().
      
      Furthermore FIFO mode's setup_ports() gets adjusted to loop only up to
      the prior ABI limit, rather than all the way up to the new one.
      
      Finally a word on the change to do_poll(): Accessing ->max_evtchns
      without holding a suitable lock was never safe, as it as well as
      ->evtchn_port_ops may change behind do_poll()'s back. Using
      port_is_valid() instead widens some the window for potential abuse,
      until we've dealt with the race altogether (see XSA-343).
      
      This is XSA-342.
      
      Reported-by: Julien Grall <jgrall@amazon.com>
      Fixes: 48974e6ce52e ("evtchn: use a per-domain variable for the max number of event channels")
      Signed-off-by: Jan Beulich <jbeulich@suse.com>
      Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
      Reviewed-by: Julien Grall <jgrall@amazon.com>

pnmtopng: 93 colors found
Revision graph left in /home/logs/results/bisect/xen-4.13-testing/test-xtf-amd64-amd64-4.xtf--test-pv64-xsa-221.{dot,ps,png,html,svg}.
No revision to test.

