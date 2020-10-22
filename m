Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 126072964C2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 20:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10634.28369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVfY2-00041g-Ql; Thu, 22 Oct 2020 18:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10634.28369; Thu, 22 Oct 2020 18:42:50 +0000
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
	id 1kVfY2-00041F-NW; Thu, 22 Oct 2020 18:42:50 +0000
Received: by outflank-mailman (input) for mailman id 10634;
 Thu, 22 Oct 2020 18:42:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A75Z=D5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
 id 1kVfY1-00040b-0w
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 18:42:49 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfe19b88-1c1b-40e5-9df7-191f7f2d6d5c;
 Thu, 22 Oct 2020 18:42:39 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVfXq-0007u8-TE; Thu, 22 Oct 2020 18:42:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1kVfXq-0003TP-JP; Thu, 22 Oct 2020 18:42:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.92) (envelope-from <osstest-admin@xenproject.org>)
 id 1kVfXq-0005QG-It; Thu, 22 Oct 2020 18:42:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=A75Z=D5=xenproject.org=osstest-admin@srs-us1.protection.inumbo.net>)
	id 1kVfY1-00040b-0w
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 18:42:49 +0000
X-Inumbo-ID: cfe19b88-1c1b-40e5-9df7-191f7f2d6d5c
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cfe19b88-1c1b-40e5-9df7-191f7f2d6d5c;
	Thu, 22 Oct 2020 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Date:From:Subject:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:To;
	bh=O2pAJTp5AMNcILOJt7CFsoKqsVKsqqCMcOzQn1eTZN0=; b=e5oLO2BJFE4MXwYR45deV7maV4
	bMbgBGT/Y75jMTkaBhsSFpSkHIMljNiE7Oc8DcuGkgYnnwSrMbqcsEdWiEK2qHecjO/6m89nyUyP2
	OZNaKIiUSSu4OwCdOTVLEHrEN+8ACD1cmZGE7OItBOrAL6t785A/kntjqFTkJ9TZsehA=;
Received: from host146.205.237.98.conversent.net ([205.237.98.146] helo=infra.test-lab.xenproject.org)
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVfXq-0007u8-TE; Thu, 22 Oct 2020 18:42:38 +0000
Received: from [172.16.148.1] (helo=osstest.test-lab.xenproject.org)
	by infra.test-lab.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVfXq-0003TP-JP; Thu, 22 Oct 2020 18:42:38 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim 4.92)
	(envelope-from <osstest-admin@xenproject.org>)
	id 1kVfXq-0005QG-It; Thu, 22 Oct 2020 18:42:38 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-156100-mainreport@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: [qemu-mainline test] 156100: regressions - FAIL
X-Osstest-Failures:
    qemu-mainline:build-amd64-xsm:xen-build:fail:regression
    qemu-mainline:build-amd64:xen-build:fail:regression
    qemu-mainline:build-arm64:xen-build:fail:regression
    qemu-mainline:build-arm64-xsm:xen-build:fail:regression
    qemu-mainline:build-i386:xen-build:fail:regression
    qemu-mainline:build-i386-xsm:xen-build:fail:regression
    qemu-mainline:build-armhf:xen-build:fail:regression
    qemu-mainline:test-armhf-armhf-xl-arndale:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-multivcpu:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-rtds:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-freebsd10-i386:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-freebsd10-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-coresched-i386-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-coresched-amd64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-rtds:build-check(1):blocked:nonblocking
    qemu-mainline:build-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:build-arm64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:build-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:build-i386-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-amd64-pvgrub:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-qcow2:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-dom0pvh-xl-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-i386-pvgrub:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvhv2-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-pvhv2-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-vhd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-multivcpu:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-pair:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-pygrub:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-freebsd11-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-freebsd12-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-qemuu-nested-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-amd64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl-cubietruck:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-amd:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-qemuu-rhel6hvm-intel:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-pvshim:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-debianhvm-i386-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-win7-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-qemuu-ws16-amd64:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-shadow:build-check(1):blocked:nonblocking
    qemu-mainline:test-amd64-i386-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-libvirt-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit1:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-credit2:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-seattle:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-thunderx:build-check(1):blocked:nonblocking
    qemu-mainline:test-arm64-arm64-xl-xsm:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-libvirt-raw:build-check(1):blocked:nonblocking
    qemu-mainline:test-armhf-armhf-xl:build-check(1):blocked:nonblocking
X-Osstest-Versions-This:
    qemuu=4c5b97bfd0dd54dc27717ae8d1cd10e14eef1430
X-Osstest-Versions-That:
    qemuu=1d806cef0e38b5db8347a8e12f214d543204a314
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 22 Oct 2020 18:42:38 +0000

flight 156100 qemu-mainline real [real]
http://logs.test-lab.xenproject.org/osstest/logs/156100/

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64-xsm               6 xen-build                fail REGR. vs. 152631
 build-amd64                   6 xen-build                fail REGR. vs. 152631
 build-arm64                   6 xen-build                fail REGR. vs. 152631
 build-arm64-xsm               6 xen-build                fail REGR. vs. 152631
 build-i386                    6 xen-build                fail REGR. vs. 152631
 build-i386-xsm                6 xen-build                fail REGR. vs. 152631
 build-armhf                   6 xen-build                fail REGR. vs. 152631

Tests which did not succeed, but are not blocking:
 test-armhf-armhf-xl-arndale   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit1   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-rtds      1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-vhd       1 build-check(1)               blocked  n/a
 test-amd64-i386-pair          1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-xsm   1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-i386-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-i386-libvirt       1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-i386  1 build-check(1)               blocked  n/a
 test-amd64-i386-freebsd10-amd64  1 build-check(1)               blocked  n/a
 test-amd64-coresched-i386-xl  1 build-check(1)               blocked  n/a
 test-amd64-coresched-amd64-xl  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-xsm       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-shadow    1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-rtds      1 build-check(1)               blocked  n/a
 build-amd64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ws16-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-win7-amd64  1 build-check(1)             blocked n/a
 build-arm64-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-ovmf-amd64  1 build-check(1)             blocked n/a
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)     blocked n/a
 build-armhf-libvirt           1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1) blocked n/a
 build-i386-libvirt            1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qemuu-debianhvm-amd64  1 build-check(1)        blocked n/a
 test-amd64-amd64-amd64-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-qcow2     1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvshim    1 build-check(1)               blocked  n/a
 test-amd64-amd64-dom0pvh-xl-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-i386-pvgrub  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt      1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-pvhv2-intel  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-pair  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 1 build-check(1) blocked n/a
 test-amd64-amd64-xl-pvhv2-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-vhd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-multivcpu  1 build-check(1)               blocked  n/a
 test-amd64-amd64-pair         1 build-check(1)               blocked  n/a
 test-amd64-amd64-pygrub       1 build-check(1)               blocked  n/a
 test-amd64-amd64-xl-credit2   1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-freebsd11-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-qemuu-freebsd12-amd64  1 build-check(1)           blocked n/a
 test-amd64-amd64-xl-credit1   1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-amd  1 build-check(1)               blocked  n/a
 test-amd64-amd64-qemuu-nested-intel  1 build-check(1)              blocked n/a
 test-amd64-amd64-xl           1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-credit2   1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl-cubietruck  1 build-check(1)               blocked  n/a
 test-amd64-i386-qemuu-rhel6hvm-amd  1 build-check(1)               blocked n/a
 test-amd64-i386-qemuu-rhel6hvm-intel  1 build-check(1)             blocked n/a
 test-amd64-i386-xl            1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-pvshim     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64  1 build-check(1)         blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow  1 build-check(1)  blocked n/a
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm  1 build-check(1)      blocked n/a
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict 1 build-check(1) blocked n/a
 test-amd64-i386-xl-qemuu-ovmf-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-win7-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-qemuu-ws16-amd64  1 build-check(1)              blocked n/a
 test-amd64-i386-xl-raw        1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-shadow     1 build-check(1)               blocked  n/a
 test-amd64-i386-xl-xsm        1 build-check(1)               blocked  n/a
 test-arm64-arm64-libvirt-xsm  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl           1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit1   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-credit2   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-seattle   1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-thunderx  1 build-check(1)               blocked  n/a
 test-arm64-arm64-xl-xsm       1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt      1 build-check(1)               blocked  n/a
 test-armhf-armhf-libvirt-raw  1 build-check(1)               blocked  n/a
 test-armhf-armhf-xl           1 build-check(1)               blocked  n/a

version targeted for testing:
 qemuu                4c5b97bfd0dd54dc27717ae8d1cd10e14eef1430
baseline version:
 qemuu                1d806cef0e38b5db8347a8e12f214d543204a314

Last test of basis   152631  2020-08-20 09:07:46 Z   63 days
Failing since        152659  2020-08-21 14:07:39 Z   62 days  117 attempts
Testing same since   156094  2020-10-22 15:08:36 Z    0 days    2 attempts

------------------------------------------------------------
People who touched revisions under test:
    Aaron Lindsay <aaron@os.amperecomputing.com>
  Alberto Garcia <berto@igalia.com>
  Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
  Alex Bennée <alex.bennee@linaro.org>
  Alexander Bulekov <alxndr@bu.edu>
  Alexey Kirillov <lekiravi@yandex-team.ru>
  Alistair Francis <alistair.francis@wdc.com>
  Alistair Francis <alistair.francis@xilinx.com>
  Amey Narkhede <ameynarkhede03@gmail.com>
  Andrew Jones <drjones@redhat.com>
  Andrey Konovalov <andreyknvl@google.com>
  Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
  Ani Sinha <ani@anisinha.ca>
  Anthony PERARD <anthony.perard@citrix.com>
  Anton Blanchard <anton@ozlabs.org>
  Anup Patel <anup.patel@wdc.com>
  Babu Moger <babu.moger@amd.com>
  BALATON Zoltan <balaton@eik.bme.hu>
  Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
  Ben Widawsky <ben.widawsky@intel.com>
  Bin Meng <bin.meng@windriver.com>
  Bruce Rogers <brogers@suse.com>
  Carlo Marcelo Arenas Belón <carenas@gmail.com>
  Chen Gang <chengang@emindsoft.com.cn>
  Chen Qun <kuhn.chenqun@huawei.com>
  Chih-Min Chao <chihmin.chao@sifive.com>
  Christian Borntraeger <borntraeger@de.ibm.com>
  Christian Schoenebeck <qemu_oss@crudebyte.com>
  Chuan Zheng <zhengchuan@huawei.com>
  Claudio Fontana <cfontana@suse.de>
  Claudio Imbrenda <imbrenda@linux.ibm.com>
  Cleber Rosa <crosa@redhat.com>
  Colin Xu <colin.xu@intel.com>
  Collin Walling <walling@linux.ibm.com>
  Connor Kuehl <ckuehl@redhat.com>
  Corey Minyard <cminyard@mvista.com>
  Cornelia Huck <cohuck@redhat.com>
  Cédric Le Goater <clg@kaod.org>
  César Belley <cesar.belley@lse.epita.fr>
  Daniel Henrique Barboza <danielhb413@gmail.com>
  Daniel P. Berrangé <berrange@redhat.com>
  David Carlier <devnexen@gmail.com>
  David Gibson <david@gibson.dropbear.id.au>
  David Hildenbrand <david@redhat.com>
  Dima Stepanov <dimastep@yandex-team.ru>
  Dmitry Fomichev <dmitry.fomichev@wdc.com>
  Douglas Crosher <dtc-ubuntu@scieneer.com>
  Dov Murik <dovmurik@linux.vnet.ibm.com>
  Dr. David Alan Gilbert <dgilbert@redhat.com>
  Edgar E. Iglesias <edgar.iglesias@xilinx.com>
  Eduardo Habkost <ehabkost@redhat.com>
  Eduardo Otubo <otubo@redhat.com>
  Elena Afanasova <eafanasova@gmail.com>
  Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
  Eric Auger <eric.auger@redhat.com>
  Eric Blake <eblake@redhat.com>
  Erik Kline <ek@google.com>
  Erik Smit <erik.lucas.smit@gmail.com>
  Fabiano Rosas <farosas@linux.ibm.com>
  Fam Zheng <fam@euphon.net>
  Fan Yang <Fan_Yang@sjtu.edu.cn>
  Filip Bozuta <Filip.Bozuta@syrmia.com>
  Finn Thain <fthain@telegraphics.com.au>
  Frank Chang <frank.chang@sifive.com>
  Frediano Ziglio <freddy77@gmail.com>
  Gerd Hoffmann <kraxel@redhat.com>
  Gonglei <arei.gonglei@huawei.com>
  Graeme Gregory <graeme@nuviainc.com>
  Greg Kurz <groug@kaod.org>
  Guoqing Zhang <zhangguoqing.kernel@bytedance.com>
  Gustavo Romero <gromero@linux.ibm.com>
  haibinzhang(张海斌) <haibinzhang@tencent.com>
  Halil Pasic <pasic@linux.ibm.com>
  Han Han <hhan@redhat.com>
  Harry G. Coin <hgcoin@gmail.com>
  Havard Skinnemoen <hskinnemoen@google.com>
  Helge Deller <deller@gmx.de>
  Heyi Guo <guoheyi@huawei.com>
  Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
  Hou Weiying <weiying_hou@outlook.com>
  Huacai Chen <chenhc@lemote.com>
  Huacai Chen <zltjiangshi@gmail.com>
  Igor Kononenko <i.kononenko@yadro.com>
  Igor Mammedov <imammedo@redhat.com>
  Jan Charvat <charvj10@fel.cvut.cz>
  Jan Henrik Weinstock <jan.weinstock@rwth-aachen.de>
  Janosch Frank <frankja@linux.ibm.com>
  Jason Andryuk <jandryuk@gmail.com>
  Jason Wang <jasowang@redhat.com>
  Jens Freimann <jfreimann@redhat.com>
  Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
  Jiaxun Yang <jiaxun.yang@flygoat.com>
  Joel Stanley <joel@jms.id.au>
  John Snow <jsnow@redhat.com>
  Jon Doron <arilou@gmail.com>
  Julia Suvorova <jusual@redhat.com>
  Kashyap Chamarthy <kchamart@redhat.com>
  Keith Busch <kbusch@kernel.org>
  Kele Huang <kele.hwang@gmail.com>
  Kenta Ishiguro <kentaishiguro@slowstart.org>
  Kevin Wolf <kwolf@redhat.com>
  Kito Cheng <kito.cheng@sifive.com>
  Klaus Jensen <k.jensen@samsung.com>
  Klaus Jensen <klaus.jensen@cnexlabs.com>
  Laszlo Ersek <lersek@redhat.com>
  Laurent Vivier <laurent@vivier.eu>
  Laurent Vivier <lvivier@redhat.com>
  Lei YU <yulei.sh@bytedance.com>
  Leif Lindholm <leif@nuviainc.com>
  Li Feng <fengli@smartx.com>
  Li Qiang <liq3ea@163.com>
  Li Zhijian <lizhijian@cn.fujitsu.com>
  Liao Pingfang <liao.pingfang@zte.com.cn>
  Liao Pingfang <liao.pingfang@zte.com.cn>a
  Lijun Pan <ljp@linux.ibm.com>
  LIU Zhiwei <zhiwei_liu@c-sky.com>
  Longpeng(Mike) <longpeng2@huawei.com>
  Luc Michel <luc@lmichel.fr>
  Lukas Straub <lukasstraub2@web.de>
  Marc Hartmayer <mhartmay@linux.ibm.com>
  Marc-André Lureau <marcandre.lureau@redhat.com>
  Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
  Markus Armbruster <armbru@redhat.com>
  Matthieu Bucchianeri <matthieu.bucchianeri@leostella.com>
  Mauro Matteo Cascella <mcascell@redhat.com>
  Max Filippov <jcmvbkbc@gmail.com>
  Max Reitz <mreitz@redhat.com>
  Maxim Levitsky <mlevitsk@redhat.com>
  Michael Roth <mdroth@linux.vnet.ibm.com>
  Michael S. Tsirkin <mst@redhat.com>
  Michael Tokarev <mjt@tls.msk.ru>
  Michael Walle <michael@walle.cc>
  Michal Privoznik <mprivozn@redhat.com>
  Mike Gelfand <mikedld@mikedld.com>
  Myriad-Dreamin <camiyoru@gmail.com>
  Nathan Chancellor <natechancellor@gmail.com>
  Niek Linnenbank <nieklinnenbank@gmail.com>
  Nikola Pavlica <pavlica.nikola@gmail.com>
  Nir Soffer <nirsof@gmail.com>
  Nir Soffer <nsoffer@redhat.com>
  Pan Nengyuan <pannengyuan@huawei.com>
  Pankaj Gupta <pankaj.gupta.linux@gmail.com>
  Paolo Bonzini <pbonzini@redhat.com>
  Paul Burton <paulburton@kernel.org>
  Paul Durrant <paul@xen.org>
  Paul Durrant <pdurrant@amazon.com>
  Paul Zimmerman <pauldzim@gmail.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
  Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
  Pavel Pisa <pisa@cmp.felk.cvut.cz>
  Peng Liang <liangpeng10@huawei.com>
  Peter Lieven <pl@kamp.de>
  Peter Maydell <peter.maydell@linaro.org>
  Peter Xu <peterx@redhat.com>
  Philippe Mathieu-Daude <philmd@redhat.com>
  Philippe Mathieu-Daudé <f4bug@amsat.org>
  Philippe Mathieu-Daudé <philmd@redhat.com>
  Prasad J Pandit <pjp@fedoraproject.org>
  Richard Henderson <richard.henderson@linaro.org>
  Robert Hoo <robert.hu@linux.intel.com>
  Roman Bolshakov <r.bolshakov@yadro.com>
  Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
  Samuel Thibault <samuel.thibault@ens-lyon.org>
  Sergei Trofimovich <slyfox@gentoo.org>
  Sergey Nizovtsev <snizovtsev@gmail.com>
  Sergio Lopez <slp@redhat.com>
  Stefan Berger <stefanb@linux.ibm.com>
  Stefan Hajnoczi <stefanha@redhat.com>
  Stefan Weil <sw@weilnetz.de>
  Stefano Garzarella <sgarzare@redhat.com>
  Stephen Long <steplong@quicinc.com>
  Sunil Muthuswamy <sunilmut@microsoft.com>
  Sven Schnelle <svens@stackframe.org>
  Swapnil Ingle <swapnil.ingle@nutanix.com>
  Thiago Jung Bauermann <bauerman@linux.ibm.com>
  Thomas Huth <huth@tuxfamily.org>
  Thomas Huth <thuth@redhat.com>
  Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  Timothy Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
  Timothy E Baldwin <T.E.Baldwin99@members.leeds.ac.uk>
  Tomáš Golembiovský <tgolembi@redhat.com>
  Vincenzo Frascino <vincenzo.frascino@arm.com>
  Vitaly Cheptsov <vit9696@protonmail.com>
  Vitaly Kuznetsov <vkuznets@redhat.com>
  Vivek Goyal <vgoyal@redhat.com>
  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  Volker Rümelin <vr_qemu@t-online.de>
  Xiaoyao Li <xiaoyao.li@intel.com>
  Xinyu Li <precinct@mail.ustc.edu.cn>
  Xu Zou <iwatchnima@gmail.com>
  Yan Jin <jinyan12@huawei.com>
  YanYing Zhuang <ann.zhuangyanying@huawei.com>
  Yi Li <yili@winhong.com>
  Yi Wang <wang.yi59@zte.com.cn>
  Yifei Jiang <jiangyifei@huawei.com>
  Ying Fang <fangying1@huawei.com>
  Yipeng Yin <yinyipeng1@huawei.com>
  Yonggang Luo <luoyonggang@gmail.com>
  zhaolichang <zhaolichang@huawei.com>
  zhenwei pi <pizhenwei@bytedance.com>
  Zhenyu Wang <zhenyuw@linux.intel.com>
  Zhenyu Ye <yezhenyu2@huawei.com>
  Zong Li <zong.li@sifive.com>

jobs:
 build-amd64-xsm                                              fail    
 build-arm64-xsm                                              fail    
 build-i386-xsm                                               fail    
 build-amd64                                                  fail    
 build-arm64                                                  fail    
 build-armhf                                                  fail    
 build-i386                                                   fail    
 build-amd64-libvirt                                          blocked 
 build-arm64-libvirt                                          blocked 
 build-armhf-libvirt                                          blocked 
 build-i386-libvirt                                           blocked 
 build-amd64-pvops                                            pass    
 build-arm64-pvops                                            pass    
 build-armhf-pvops                                            pass    
 build-i386-pvops                                             pass    
 test-amd64-amd64-xl                                          blocked 
 test-amd64-coresched-amd64-xl                                blocked 
 test-arm64-arm64-xl                                          blocked 
 test-armhf-armhf-xl                                          blocked 
 test-amd64-i386-xl                                           blocked 
 test-amd64-coresched-i386-xl                                 blocked 
 test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm           blocked 
 test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm            blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm                 blocked 
 test-amd64-i386-xl-qemuu-debianhvm-i386-xsm                  blocked 
 test-amd64-amd64-libvirt-xsm                                 blocked 
 test-arm64-arm64-libvirt-xsm                                 blocked 
 test-amd64-i386-libvirt-xsm                                  blocked 
 test-amd64-amd64-xl-xsm                                      blocked 
 test-arm64-arm64-xl-xsm                                      blocked 
 test-amd64-i386-xl-xsm                                       blocked 
 test-amd64-amd64-qemuu-nested-amd                            blocked 
 test-amd64-amd64-xl-pvhv2-amd                                blocked 
 test-amd64-i386-qemuu-rhel6hvm-amd                           blocked 
 test-amd64-amd64-dom0pvh-xl-amd                              blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64                    blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64                     blocked 
 test-amd64-i386-freebsd10-amd64                              blocked 
 test-amd64-amd64-qemuu-freebsd11-amd64                       blocked 
 test-amd64-amd64-qemuu-freebsd12-amd64                       blocked 
 test-amd64-amd64-xl-qemuu-ovmf-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ovmf-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-win7-amd64                         blocked 
 test-amd64-i386-xl-qemuu-win7-amd64                          blocked 
 test-amd64-amd64-xl-qemuu-ws16-amd64                         blocked 
 test-amd64-i386-xl-qemuu-ws16-amd64                          blocked 
 test-armhf-armhf-xl-arndale                                  blocked 
 test-amd64-amd64-xl-credit1                                  blocked 
 test-arm64-arm64-xl-credit1                                  blocked 
 test-armhf-armhf-xl-credit1                                  blocked 
 test-amd64-amd64-xl-credit2                                  blocked 
 test-arm64-arm64-xl-credit2                                  blocked 
 test-armhf-armhf-xl-credit2                                  blocked 
 test-armhf-armhf-xl-cubietruck                               blocked 
 test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict        blocked 
 test-amd64-i386-xl-qemuu-dmrestrict-amd64-dmrestrict         blocked 
 test-amd64-i386-freebsd10-i386                               blocked 
 test-amd64-amd64-qemuu-nested-intel                          blocked 
 test-amd64-amd64-xl-pvhv2-intel                              blocked 
 test-amd64-i386-qemuu-rhel6hvm-intel                         blocked 
 test-amd64-amd64-dom0pvh-xl-intel                            blocked 
 test-amd64-amd64-libvirt                                     blocked 
 test-armhf-armhf-libvirt                                     blocked 
 test-amd64-i386-libvirt                                      blocked 
 test-amd64-amd64-xl-multivcpu                                blocked 
 test-armhf-armhf-xl-multivcpu                                blocked 
 test-amd64-amd64-pair                                        blocked 
 test-amd64-i386-pair                                         blocked 
 test-amd64-amd64-libvirt-pair                                blocked 
 test-amd64-i386-libvirt-pair                                 blocked 
 test-amd64-amd64-amd64-pvgrub                                blocked 
 test-amd64-amd64-i386-pvgrub                                 blocked 
 test-amd64-amd64-xl-pvshim                                   blocked 
 test-amd64-i386-xl-pvshim                                    blocked 
 test-amd64-amd64-pygrub                                      blocked 
 test-amd64-amd64-xl-qcow2                                    blocked 
 test-armhf-armhf-libvirt-raw                                 blocked 
 test-amd64-i386-xl-raw                                       blocked 
 test-amd64-amd64-xl-rtds                                     blocked 
 test-armhf-armhf-xl-rtds                                     blocked 
 test-arm64-arm64-xl-seattle                                  blocked 
 test-amd64-amd64-xl-qemuu-debianhvm-amd64-shadow             blocked 
 test-amd64-i386-xl-qemuu-debianhvm-amd64-shadow              blocked 
 test-amd64-amd64-xl-shadow                                   blocked 
 test-amd64-i386-xl-shadow                                    blocked 
 test-arm64-arm64-xl-thunderx                                 blocked 
 test-amd64-amd64-libvirt-vhd                                 blocked 
 test-armhf-armhf-xl-vhd                                      blocked 


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


Not pushing.

(No revision log; it would be 49957 lines long.)

