Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6BA1F52E5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 13:12:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiyeF-0004L4-21; Wed, 10 Jun 2020 11:11:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YKF/=7X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jiyeD-0004Kx-J9
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 11:11:57 +0000
X-Inumbo-ID: 321c1ef0-ab0b-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 321c1ef0-ab0b-11ea-bca7-bc764e2007e4;
 Wed, 10 Jun 2020 11:11:56 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Y/sdrW+C4pt8uxofcg0lqf+kqugqEFJeK56hf4nK3LQEui7kApEcBFShHj6XNSWQVVKg+r61bl
 e8ckbHqc5soMLJxWnhpB56419X2hecWPgPTyottKv+E9eH2y/3nkU4JdiSJPMqVZKQ8uIfv85u
 ckWtCosEHT+mZ1RMcqIuwPVSw8fnzMGtRBK82N3SAaemdRUVneiTUOfp12FfHKVlKIWCGWbt3h
 K6q5pDlQzfKX1bPgSg9tcP01E86/hll7UU/RV/YxOrXYiukCSJirMI88NLTeghChEhZkU9T7dl
 +F4=
X-SBRS: 2.7
X-MesageID: 20020166
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,495,1583211600"; d="scan'208";a="20020166"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24288.49140.163747.998808@mariner.uk.xensource.com>
Date: Wed, 10 Jun 2020 12:11:48 +0100
To: Jan Beulich <jbeulich@suse.com>
Subject: Build fix backports for 4.9 - 4.11 inclusive
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

4.9 to 4.11 don't build on Debian stable, which we are now using in
osstest.  This is because they are missing a number of compile fixes.

Where things are straightforward I intend to backport these and push
them to the relevant Xen stable branches without formally posting
about them each here.  I hope that is OK.


So far I have identified:

For 4.11:

  2b50cdbc444c637575580dcfa6c9525a84d5cc62
  tools/xentop : replace use of deprecated vwprintw

That makes it build.  I will push it shortly.


For 4.10:

That and a large number of fixes from Marek Marczykowski-Górecki and
one from John Thomson.  Additionaly there is a problem with seabios,
which is missing:

  8c3f57ea1217ea0c80a72898bc35baa0e14af0e0
  ssdt: Fix building of legacy acpi tables on current iasl compiler

I think this can probably just be cherry-picked onto upstream seabios
10.2.

Wei, should we do that, or should we try to persuade upstream to make
a 10.4 containing this fix, or what ?

I don't yet know if this is a complete list.


For 4.9 I think probably all of the above.  There is also a build
failure I don't yet understand:

  ld: /home/osstest/build.150951.build-amd64/xen/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
  in function `TPM_TakeOwnership': gdtoa-hexnan.c:(.text+0x829a): undefined reference to `unpack3_TPM_RSA_KEY_PARMS'


Thanks,
Ian.

