Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8552B1F6A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 17:00:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26730.55199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdbUE-0002Z4-UU; Fri, 13 Nov 2020 15:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26730.55199; Fri, 13 Nov 2020 15:59:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdbUE-0002YR-Pi; Fri, 13 Nov 2020 15:59:42 +0000
Received: by outflank-mailman (input) for mailman id 26730;
 Fri, 13 Nov 2020 15:59:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RH3y=ET=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kdbUD-0002Y4-CW
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:59:41 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dfcc9d10-0f52-431e-a24a-0f35821533c0;
 Fri, 13 Nov 2020 15:59:37 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdbU9-0004c4-3m; Fri, 13 Nov 2020 15:59:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kdbU8-0006bL-PR; Fri, 13 Nov 2020 15:59:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kdbU8-00044S-Oz; Fri, 13 Nov 2020 15:59:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RH3y=ET=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kdbUD-0002Y4-CW
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:59:41 +0000
X-Inumbo-ID: dfcc9d10-0f52-431e-a24a-0f35821533c0
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id dfcc9d10-0f52-431e-a24a-0f35821533c0;
	Fri, 13 Nov 2020 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=74cF1PEfkDxa8DED9YrsmV1THyboqWkfPNncFlFLpLI=; b=ZxUV4XBDV939M5sb0Qn3CFrqf1
	ssUEDKBLp7msYXevHGXKuxiDGWexrx1cqfaWXQ2f3FFNeWXtJLrVbWRUfIRiGkbXOe/vS9iKYJyqn
	ZZls6imnSD2PHv4RvmRFYPycJyJiI4EVZoXshAPReZyXDh1XkzWDTPGHw4RJEfhacJTA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdbU9-0004c4-3m; Fri, 13 Nov 2020 15:59:37 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdbU8-0006bL-PR; Fri, 13 Nov 2020 15:59:36 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kdbU8-00044S-Oz; Fri, 13 Nov 2020 15:59:36 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156722-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [linux-5.4 test] 156722: tolerable FAIL - PUSHED
X-Osstest-Failures:
    linux-5.4:test-amd64-i386-xl-xsm:guest-localmigrate/x10:fail:heisenbug
    linux-5.4:test-amd64-i386-libvirt-xsm:guest-start.2:fail:heisenbug
    linux-5.4:test-amd64-amd64-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-qemuu-nested-amd:debian-hvm-install/l1/l2:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-amd64-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-win7-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemut-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-qemuu-ws16-amd64:guest-stop:fail:nonblocking
    linux-5.4:test-amd64-i386-xl-pvshim:guest-start:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-seattle:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-libvirt-xsm:saverestore-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:migrate-support-check:fail:nonblocking
    linux-5.4:test-arm64-arm64-xl-thunderx:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-arndale:saverestore-support-check:fail:nonblocking
    linux-5.4:test-amd64-amd64-libvirt-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-rtds:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-multivcpu:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit2:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-cubietruck:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-credit1:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:migrate-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-xl-vhd:saverestore-support-check:fail:nonblocking
    linux-5.4:test-armhf-armhf-libvirt-raw:migrate-support-check:fail:nonblocking
X-Osstest-Versions-This:
    linux=2544d06afd8d060f35b159809274e4b7477e63e8
X-Osstest-Versions-That:
    linux=6e97ed6efa701db070da0054b055c085895aba86
From: osstest service owner <osstest-admin@xenproject.org>
Date: Fri, 13 Nov 2020 15:59:36 +0000

flight 156722 linux-5.4 real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156722/

Failures :-/ but no regressions.

Tests which are failing intermittently (not blocking):
 test-amd64-i386-xl-xsm 20 guest-localmigrate/x10 fail in 156677 pass in 156722
 test-amd64-i386-libvirt-xsm  21 guest-start.2              fail pass in 156677

Tests which did not succeed, but are not blocking:
 test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 156412
 test-amd64-i386-xl-qemut-win7-amd64 19 guest-stop             fail like 156412
 test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 156412
 test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 156412
 test-armhf-armhf-libvirt     16 saverestore-support-check    fail  like 156412
 test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 156412
 test-amd64-amd64-xl-qemut-ws16-amd64 19 guest-stop            fail like 156412
 test-amd64-i386-xl-qemuu-win7-amd64 19 guest-stop             fail like 156412
 test-amd64-i386-xl-qemut-ws16-amd64 19 guest-stop             fail like 156412
 test-armhf-armhf-libvirt-raw 15 saverestore-support-check    fail  like 156412
 test-amd64-i386-xl-qemuu-ws16-amd64 19 guest-stop             fail like 156412
 test-amd64-i386-xl-pvshim    14 guest-start                  fail   never pass
 test-amd64-amd64-libvirt     15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-seattle  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-xsm  15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt      15 migrate-support-check        fail   never pass
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 13 migrate-support-check fail never pass
 test-arm64-arm64-xl          15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl          16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-xsm      15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit2  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-xsm      16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit2  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-credit1  15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-credit1  16 saverestore-support-check    fail   never pass
 test-arm64-arm64-libvirt-xsm 15 migrate-support-check        fail   never pass
 test-arm64-arm64-libvirt-xsm 16 saverestore-support-check    fail   never pass
 test-arm64-arm64-xl-thunderx 15 migrate-support-check        fail   never pass
 test-arm64-arm64-xl-thunderx 16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl          15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl          16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-arndale  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-arndale  16 saverestore-support-check    fail   never pass
 test-amd64-amd64-libvirt-vhd 14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-rtds     16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-multivcpu 15 migrate-support-check        fail  never pass
 test-armhf-armhf-xl-multivcpu 16 saverestore-support-check    fail  never pass
 test-armhf-armhf-xl-credit2  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit2  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-xl-cubietruck 15 migrate-support-check        fail never pass
 test-armhf-armhf-xl-cubietruck 16 saverestore-support-check    fail never pass
 test-armhf-armhf-xl-credit1  15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-credit1  16 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt     15 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      14 migrate-support-check        fail   never pass
 test-armhf-armhf-xl-vhd      15 saverestore-support-check    fail   never pass
 test-armhf-armhf-libvirt-raw 14 migrate-support-check        fail   never pass

version targeted for testing:
 linux                2544d06afd8d060f35b159809274e4b7477e63e8
baseline version:
 linux                6e97ed6efa701db070da0054b055c085895aba86

Last test of basis   156412  2020-11-05 11:13:59 Z    8 days
Failing since        156620  2020-11-10 12:10:31 Z    3 days    3 attempts
Testing same since   156677  2020-11-11 07:50:18 Z    2 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
  "kiyin(尹亮)" <kiyin@tencent.com>
  Alan Stern <stern@rowland.harvard.edu>
  Alex Deucher <alexander.deucher@amd.com>
  Alexander Aring <aahringo@redhat.com>
  Alexander Sverdlin <alexander.sverdlin@nokia.com>
  Andreas Gruenbacher <agruenba@redhat.com>
  Andrew Morton <akpm@linux-foundation.org>
  Andy Strohman <astroh@amazon.com>
  Artem Lapkin <art@khadas.com>
  Baurzhan Ismagulov <ibr@radix50.net>
  Ben Skeggs <bskeggs@redhat.com>
  Bjørn Mork <bjorn@mork.no>
  Boris Brezillon <boris.brezillon@collabora.com>
  Borislav Petkov <bp@suse.de>
  Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
  Chris Wilson <chris@chris-wilson.co.uk>
  Christoph Hellwig <hch@lst.de>
  Chunfeng Yun <chunfeng.yun@mediatek.com>
  Claire Chang <tientzu@chromium.org>
  Claudiu Manoil <claudiu.manoil@nxp.com>
  Clément Péron <peron.clem@gmail.com>
  Dan Carpenter <dan.carpenter@oracle.com>
  Daniel Vetter <daniel.vetter@ffwll.ch>
  Daniel Vetter <daniel.vetter@intel.com>
  Daniele Palmas <dnlplm@gmail.com>
  Dany Madden <drt@linux.ibm.com>
  Darrick J. Wong <darrick.wong@oracle.com>
  David S. Miller <davem@davemloft.net>
  Eddy Wu <eddy_wu@trendmicro.com>
  Eddy Wu <itseddy0402@gmail.com>
  Fangrui Song <maskray@google.com>
  Felipe Balbi <balbi@kernel.org>
  Frank Slotta <frank.slotta@posteo.de>
  Gabriel Krisman Bertazi <krisman@collabora.com>
  Geoffrey D. Bennett <g@b4.vu>
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Gregory CLEMENT <gregory.clement@bootlin.com>
  Guenter Roeck <linux@roeck-us.net>
  Harald Freudenberger <freude@linux.ibm.com>
  Heiko Carstens <hca@linux.ibm.com>
  Hoang Huu Le <hoang.h.le@dektech.com.au>
  Hoegeun Kwon <hoegeun.kwon@samsung.com>
  Ingo Molnar <mingo@kernel.org>
  Jakub Kicinski <kuba@kernel.org>
  Jason Gunthorpe <jgg@nvidia.com>
  Jeff Vander Stoep <jeffv@google.com>
  Jens Axboe <axboe@kernel.dk>
  Jernej Skrabec <jernej.skrabec@siol.net>
  Jiri Slaby <jslaby@suse.cz>
  Johan Hovold <johan@kernel.org>
  Jon Hunter <jonathanh@nvidia.com>
  Jon Maloy <jmaloy@redhat.com>
  Kailang Yang <kailang@realtek.com>
  Kairui Song <kasong@redhat.com>
  Karol Herbst <kherbst@redhat.com>
  Keith Winstein <keithw@cs.stanford.edu>
  Kevin Hilman <khilman@baylibre.com>
  kiyin(尹亮) <kiyin@tencent.com>
  Lee Jones <lee.jones@linaro.org>
  Len Brown <len.brown@intel.com>
  Linus Torvalds <torvalds@linux-foundation.org>
  Linux Kernel Functional Testing <lkft@linaro.org>
  Macpaul Lin <macpaul.lin@mediatek.com>
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
  Mark Brown <broonie@kernel.org>
  Mark Deneen <mdeneen@saucontech.com>
  Martin Hundebøll <martin@geanix.com>
  Martin K. Petersen <martin.petersen@oracle.com>
  Mateusz Gorski <mateusz.gorski@linux.intel.com>
  Matija Glavinic Pecotic <matija.glavinic-pecotic.ext@nokia.com>
  Maxime Ripard <maxime@cerno.tech>
  Miaohe Lin <linmiaohe@huawei.com>
  Michael Walle <michael@walle.cc>
  Michal Hocko <mhocko@suse.com>
  Michał Mirosław <mirq-linux@rere.qmqm.pl>
  Mika Kuoppala <mika.kuoppala@linux.intel.com>
  Mike Galbraith <efault@gmx.de>
  Ming Lei <ming.lei@redhat.com>
  Nick Desaulniers <ndesaulniers@google.com>
  Oleg Nesterov <oleg@redhat.com>
  Ondřej Jirman <megous@megous.com>
  Pali Rohár <pali@kernel.org>
  Paul E. McKenney <paulmck@kernel.org>
  Peilin Ye <yepeilin.cs@gmail.com>
  Peter Chen <peter.chen@nxp.com>
  Petr Malat <oss@malat.biz>
  Qian Cai <cai@redhat.com>
  Qinglang Miao <miaoqinglang@huawei.com>
  Qiujun Huang <hqjagain@gmail.com>
  Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Ralph Campbell <rcampbell@nvidia.com>
  Rob Herring <robh@kernel.org>
  Rodrigo Vivi <rodrigo.vivi@intel.com>
  Sami Tolvanen <samitolvanen@google.com>
  Sasha Levin <sashal@kernel.org>
  Scott K Logan <logans@cottsay.net>
  Shannon Nelson <snelson@pensando.io>
  Shijie Luo <luoshijie1@huawei.com>
  Shuah Khan <skhan@linuxfoundation.org>
  Steven Rostedt (VMware) <rostedt@goodmis.org>
  Sukadev Bhattiprolu <sukadev@linux.ibm.com>
  Takashi Iwai <tiwai@suse.de>
  Tejun Heo <tj@kernel.org>
  Thinh Nguyen <Thinh.Nguyen@synopsys.com>
  Thomas Gleixner <tglx@linutronix.de>
  Tianci.Yin <tianci.yin@amd.com>
  Tyrel Datwyler <tyreld@linux.ibm.com>
  Vasily Gorbik <gor@linux.ibm.com>
  Vignesh Raghavendra <vigneshr@ti.com>
  Vinay Kumar Yadav <vinay.yadav@chelsio.com>
  Vincent Whitchurch <vincent.whitchurch@axis.com>
  Vineet Gupta <vgupta@synopsys.com>
  Vladimir Oltean <vladimir.oltean@nxp.com>
  wenxu <wenxu@ucloud.cn>
  Will Deacon <will@kernel.org>
  Xiang Chen <chenxiang66@hisilicon.com>
  YueHaibing <yuehaibing@huawei.com>
  Zhang Qilong <zhangqilong3@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Ziyi Cao <kernel@septs.pw>
  Zqiang <qiang.zhang@windriver.com>

jobs:
 build-amd64-xsm                                              pass    
 build-arm64-xsm                                              pass    
 build-i386-xsm                                               pass    
 build-amd64                                                  pass    
 build-arm64                                                  pass    
 build-armhf                                                  pass    
 build-i386                                                   pass    
 build-amd64-libvirt                                          pass    
 build-arm64-libvirt                                          pass    
 build-armhf-libvirt                                          pass    
 build-i386-libvirt                                           pass    
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          pass    
 test-amd64-coresched-amd64-xl                                pass    
 test-arm64-arm64-xl                                          pass    
 test-armhf-armhf-xl                                          pass    
 test-amd64-i386-xl                                           pass    
 test-amd64-coresched-i386-xl                                 pass    
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           pass    
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            pass    
 test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm        pass    
 test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm         pass    
 test-amd64-amd64-xl-qemut-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemut-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 pass    
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  pass    
 test-amd64-amd64-libvirt-xsm                                 pass    
 test-arm64-arm64-libvirt-xsm                                 pass    
 test-amd64-i386-libvirt-xsm                                  fail    
 test-amd64-amd64-xl-xsm                                      pass    
 test-arm64-arm64-xl-xsm                                      pass    
 test-amd64-i386-xl-xsm                                       pass    
 test-amd64-amd64-qemuu-nested-amd                            fail    
 test-amd64-amd64-xl-pvhv2-amd                                pass    
 test-amd64-i386-qemut-rhel6hvm-amd                           pass    
 test-amd64-i386-qemuu-rhel6hvm-amd                           pass    
 test-amd64-amd64-dom0pvh-xl-amd                              pass    
 test-amd64-amd64-xl-qemut-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemut-debianhvm-amd64                     pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     pass    
 test-amd64-i386-freebsd10-amd64                              pass    
 test-amd64-amd64-qemuu-freebsd11-amd64                       pass    
 test-amd64-amd64-qemuu-freebsd12-amd64                       pass    
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         pass    
 test-amd64-i386-xl-qemuu-ovmf-amd64                          pass    
 test-amd64-amd64-xl-qemut-win7-amd64                         fail    
 test-amd64-i386-xl-qemut-win7-amd64                          fail    
 test-amd64-amd64-xl-qemuu-win7-amd64                         fail    
 test-amd64-i386-xl-qemuu-win7-amd64                          fail    
 test-amd64-amd64-xl-qemut-ws16-amd64                         fail    
 test-amd64-i386-xl-qemut-ws16-amd64                          fail    
 test-amd64-amd64-xl-qemuu-ws16-amd64                         fail    
 test-amd64-i386-xl-qemuu-ws16-amd64                          fail    
 test-armhf-armhf-xl-arndale                                  pass    
 test-amd64-amd64-xl-credit1                                  pass    
 test-arm64-arm64-xl-credit1                                  pass    
 test-armhf-armhf-xl-credit1                                  pass    
 test-amd64-amd64-xl-credit2                                  pass    
 test-arm64-arm64-xl-credit2                                  pass    
 test-armhf-armhf-xl-credit2                                  pass    
 test-armhf-armhf-xl-cubietruck                               pass    
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        pass    
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         pass    
 test-amd64-amd64-examine                                     pass    
 test-arm64-arm64-examine                                     pass    
 test-armhf-armhf-examine                                     pass    
 test-amd64-i386-examine                                      pass    
 test-amd64-i386-freebsd10-i386                               pass    
 test-amd64-amd64-qemuu-nested-intel                          pass    
 test-amd64-amd64-xl-pvhv2-intel                              pass    
 test-amd64-i386-qemut-rhel6hvm-intel                         pass    
 test-amd64-i386-qemuu-rhel6hvm-intel                         pass    
 test-amd64-amd64-dom0pvh-xl-intel                            pass    
 test-amd64-amd64-libvirt                                     pass    
 test-armhf-armhf-libvirt                                     pass    
 test-amd64-i386-libvirt                                      pass    
 test-amd64-amd64-xl-multivcpu                                pass    
 test-armhf-armhf-xl-multivcpu                                pass    
 test-amd64-amd64-pair                                        pass    
 test-amd64-i386-pair                                         pass    
 test-amd64-amd64-libvirt-pair                                pass    
 test-amd64-i386-libvirt-pair                                 pass    
 test-amd64-amd64-amd64-pvgrub                                pass    
 test-amd64-amd64-i386-pvgrub                                 pass    
 test-amd64-amd64-xl-pvshim                                   pass    
 test-amd64-i386-xl-pvshim                                    fail    
 test-amd64-amd64-pygrub                                      pass    
 test-amd64-amd64-xl-qcow2                                    pass    
 test-armhf-armhf-libvirt-raw                                 pass    
 test-amd64-i386-xl-raw                                       pass    
 test-amd64-amd64-xl-rtds                                     pass    
 test-armhf-armhf-xl-rtds                                     pass    
 test-arm64-arm64-xl-seattle                                  pass    
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             pass    
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              pass    
 test-amd64-amd64-xl-shadow                                   pass    
 test-amd64-i386-xl-shadow                                    pass    
 test-arm64-arm64-xl-thunderx                                 pass    
 test-amd64-amd64-libvirt-vhd                                 pass    
 test-armhf-armhf-xl-vhd                                      pass    


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


Pushing revision :

hint: The 'hooks/update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-receive' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
hint: The 'hooks/post-update' hook was ignored because it's not set as executable.
hint: You can disable this warning with `git config advice.ignoredHook false`.
To xenbits.xen.org:/home/xen/git/linux-pvops.git
   6e97ed6efa70..2544d06afd8d  2544d06afd8d060f35b159809274e4b7477e63e8 -> tested/linux-5.4

