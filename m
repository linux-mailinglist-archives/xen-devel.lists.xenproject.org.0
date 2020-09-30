Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2A27E6D8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543.1799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZY0-0000ij-Dr; Wed, 30 Sep 2020 10:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543.1799; Wed, 30 Sep 2020 10:41:20 +0000
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
	id 1kNZY0-0000iK-AS; Wed, 30 Sep 2020 10:41:20 +0000
Received: by outflank-mailman (input) for mailman id 543;
 Wed, 30 Sep 2020 10:41:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZXz-0000iF-1k
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97fcfa9f-16fc-4777-87fa-17718fae858e;
 Wed, 30 Sep 2020 10:41:16 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZXz-0000iF-1k
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:19 +0000
X-Inumbo-ID: 97fcfa9f-16fc-4777-87fa-17718fae858e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 97fcfa9f-16fc-4777-87fa-17718fae858e;
	Wed, 30 Sep 2020 10:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462477;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ARQDwLdxqhpBevIZ1+zHduPOKGjPBte+ojC3lvnRo6g=;
  b=J+Gs7Q0KNY4+DCZywVd5eK5bAvdY53poEpJdFlpnqVPga6Ybv2FrvZd2
   hVr7xbYp0uQ6nDOGbBUirQOKeCtmI9fBiPX2GRBHBSHmaBO1PE11rNTxE
   uXUrvkF4eh0ut9CiXduP5RY7Mca9drMoxUDyidlmvy/pXPmaRy0N4hca0
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 81ITsIQKE+KHrnaYTfF83sP2GczR/zbCTpaarRd5CHsluYaqAaG4/oU2u0jZ43bZqXcnlCYTsI
 WipO8V6LxU5znMrFnyVGZWymJsoN6xcLihteilzGSeIKquenvZGvE+LXVRwDnZe0zLDTtvei1f
 GuxE2yXbaWco5RjIICleMYIdXX0WLMZbOaOU0rPN69EuAcgc+nLuzNRDTyl8KvoDw0NXmFko8g
 P0r4DQTBReqcPXuNIQo47XBHkINOIVWownR7UOS+t5kotEuE0huP/q9sa+8sl3z+5XuHIHCTHC
 BYc=
X-SBRS: None
X-MesageID: 28283478
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28283478"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH v2 00/11] x86/intr: introduce EOI callbacks and fix vPT
Date: Wed, 30 Sep 2020 12:40:57 +0200
Message-ID: <20200930104108.35969-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hello,

The following series introduces EOI callbacks and switches a number of
subsystems to use them. The first one is vmsi and dpci, which are quite
straight forward to switch since they used to open code hooks in the EOI
handlers.

Finally HVM virtual timers are also switched to a different model where
EOI callbacks are used instead of checking at every return to guest
whether a timer interrupt is being injected. Note that such change also
fixes a bug in virtual periodic timers that prevented injecting to a vCPU
different than the one where the timer is assigned (and that would
currently match the i8259 target).

Those changes are paired together so that practical applications of
having EOI callbacks can be seen in action.

Note that further cleanup can be done, but I think the series is already
big enough and could benefit from some review in order to know whether
the direction taken is acceptable. Not posting as RFC as part of the
series has already been posted before, but some patches could be
considered RFC.

Thanks, Roger.

Roger Pau Monne (11):
  x86/hvm: drop vcpu parameter from vlapic EOI callbacks
  x86/hvm: drop domain parameter from vioapic/vpic EOI callbacks
  x86/vlapic: introduce an EOI callback mechanism
  x86/vmsi: use the newly introduced EOI callbacks
  x86/vioapic: switch to use the EOI callback mechanism
  x86/hvm: allowing registering EOI callbacks for GSIs
  x86/dpci: move code
  x86/dpci: switch to use a GSI EOI callback
  x86/vpt: switch interrupt injection model
  x86/vpt: remove vPT timers per-vCPU lists
  x86/vpt: introduce a per-vPT lock

 xen/arch/x86/domain.c             |   2 +-
 xen/arch/x86/emul-i8254.c         |   1 +
 xen/arch/x86/hvm/hpet.c           |   8 +-
 xen/arch/x86/hvm/hvm.c            |  19 +-
 xen/arch/x86/hvm/irq.c            |  60 ++++
 xen/arch/x86/hvm/rtc.c            |   1 +
 xen/arch/x86/hvm/svm/intr.c       |   3 -
 xen/arch/x86/hvm/vioapic.c        | 139 +++++----
 xen/arch/x86/hvm/vlapic.c         |  66 ++++-
 xen/arch/x86/hvm/vmsi.c           |  36 ++-
 xen/arch/x86/hvm/vmx/intr.c       |  59 ----
 xen/arch/x86/hvm/vpic.c           |   8 +-
 xen/arch/x86/hvm/vpt.c            | 465 +++++++++---------------------
 xen/drivers/passthrough/io.c      | 215 ++++++++------
 xen/include/asm-x86/hvm/io.h      |   4 +-
 xen/include/asm-x86/hvm/irq.h     |  21 ++
 xen/include/asm-x86/hvm/vcpu.h    |   3 +-
 xen/include/asm-x86/hvm/vioapic.h |   2 +-
 xen/include/asm-x86/hvm/vlapic.h  |  18 +-
 xen/include/asm-x86/hvm/vpt.h     |  23 +-
 20 files changed, 574 insertions(+), 579 deletions(-)

-- 
2.28.0


