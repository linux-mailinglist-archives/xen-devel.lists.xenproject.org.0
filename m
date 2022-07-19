Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3057A597
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:43:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370796.602674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFZ-00067c-69; Tue, 19 Jul 2022 17:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370796.602674; Tue, 19 Jul 2022 17:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDrFZ-00065e-2F; Tue, 19 Jul 2022 17:43:13 +0000
Received: by outflank-mailman (input) for mailman id 370796;
 Tue, 19 Jul 2022 17:43:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6sG=XY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oDrFW-00065R-Ke
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:43:10 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40ac0a14-078a-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 19:43:09 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id w12so20591242edd.13
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 10:43:09 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 wj18-20020a170907051200b0072af92fa086sm6903268ejb.32.2022.07.19.10.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:43:07 -0700 (PDT)
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
X-Inumbo-ID: 40ac0a14-078a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iil/+hh1lHYGOFBEfrlSQzLIKhq77Pxuaiko3wYSpsA=;
        b=RPcILN7TxkPOWRwhXV/C22OKCKtG+y7218BmcyLiwGX2gm3tERkvTw3XHbJ5hIghgO
         GoUs3XEZIq880DUGx/5IGkkH9epNDZPpDsFo9Y5CCzdORnY5jBZr5laii2x+Gr0WBy9G
         SZ6hqfjUC1ea5xRL7W8aMqf4aGCZpfxblOwV5yZG9+Dk0jj/iXerrsM56uDq2T0LJPPM
         xr7r9/1ceS36v1zrs18BGSxHD0GbcYVG36KK90geOb5T/HzDyGaLTHEw8fZTWI/8KI3n
         FzZ/XiBWZkSGbzVdrxwPlZf7fRDQHUQSfiw8ZjGYcCPRpiBfE89KbvGZN4S+mZF3XD7O
         gCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iil/+hh1lHYGOFBEfrlSQzLIKhq77Pxuaiko3wYSpsA=;
        b=4ZiXkyU9NNFyDZSeeg0KrR4Bf+75hW5sU/cE4bfzWlkFLQPn4ww9maj4+Reurzznfp
         41NKTQqiZQXt7SbyQjAud3QCQUac8AHVeGvK/2Ilpj1kqTEo/LygexSxwyqVDHVETzVN
         k4t0KMpyfOzzk6kZREWfH4L58LzI5qk36hQly9r+3tvlKt30sadcICNF0y6P+654qns+
         SxGww61+U+G/BROZ6d/0fFHXGK5mGfDYaotHJX79KK7avlpJTKvmP8RS44xYfZwhVO/e
         FKLql2gBSCyCBeu3XVli7i6ZvWA33i2RXXPv4eTkpm/2g3vICi0XbKtYadjZqnp/hpB6
         CyWg==
X-Gm-Message-State: AJIora+pQ7Rq76SOyAOuyEgE3SzwH1oT7/QretXEtQtygxJemh8Fnwss
	y+lh0O2IDat6W92X9KegQq4wPQRngik53g==
X-Google-Smtp-Source: AGRyM1v0XmDpSKmZVABaGFn5fKIsYr/CT0hOc8daUAkuz3OMKftl6Zk1BSBH77tlumb3enDFUXr1Eg==
X-Received: by 2002:a05:6402:2554:b0:43a:902b:d31f with SMTP id l20-20020a056402255400b0043a902bd31fmr45208629edb.416.1658252588202;
        Tue, 19 Jul 2022 10:43:08 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH V7 00/11] PCI devices passthrough on Arm, part 3
Date: Tue, 19 Jul 2022 20:42:42 +0300
Message-Id: <20220719174253.541965-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hi, all!

You can find previous discussion at [1].

1. This patch series is focusing on vPCI and adds support for non-identity
PCI BAR mappings which is required while passing through a PCI device to
a guest. The highlights are:

- Add relevant vpci register handlers when assigning PCI device to a domain
  and remove those when de-assigning. This allows having different
  handlers for different domains, e.g. hwdom and other guests.

- Emulate guest BAR register values based on physical BAR values.
  This allows creating a guest view of the registers and emulates
  size and properties probe as it is done during PCI device enumeration by
  the guest.

- Instead of handling a single range set, that contains all the memory
  regions of all the BARs and ROM, have them per BAR.

- Take into account guest's BAR view and program its p2m accordingly:
  gfn is guest's view of the BAR and mfn is the physical BAR value as set
  up by the host bridge in the hardware domain.
  This way hardware domain sees physical BAR values and guest sees
  emulated ones.

2. The series also adds support for virtual PCI bus topology for guests:
 - We emulate a single host bridge for the guest, so segment is always 0.
 - The implementation is limited to 32 devices which are allowed on
   a single PCI bus.
 - The virtual bus number is set to 0, so virtual devices are seen
   as embedded endpoints behind the root complex.

3. The series has been updated due to the new PCI(vPCI) locking scheme implemented
in the prereq series which is also on the review now [2].

4. For unprivileged guests vpci_{read|write} has been re-worked
to not passthrough accesses to the registers not explicitly handled
by the corresponding vPCI handlers: without that passthrough
to guests is completely unsafe as Xen allows them full access to
the registers. During development this can be reverted for debugging purposes.

!!! OT: please note, Oleksandr Andrushchenko who is the author of all this stuff
has managed to address allmost all review comments given for v6 and pushed the updated
version to the github (23.02.22). 
So after receiving his agreement I just picked it up and did the following before
pushing V7:
- rebased on the recent staging (resolving a few conflicts)
- updated according to the recent changes (added cf_check specifiers where appropriate, etc)
and performed minor adjustments
- made sure that both current and prereq series [2] didn't really break x86 by testing
PVH Dom0 (vPCI) and PV Dom0 + HVM DomU (PCI passthrough to DomU) using Qemu
- my colleague Volodymyr Babchuk (who was involved in the prereq series) rechecked that
both series worked on Arm using real HW

You can also find the series at [3].

[1] https://lore.kernel.org/xen-devel/20220204063459.680961-1-andr2000@gmail.com/
[2] https://lore.kernel.org/xen-devel/20220718211521.664729-1-volodymyr_babchuk@epam.com/
[3] https://github.com/otyshchenko1/xen/commits/vpci7

Oleksandr Andrushchenko (11):
  xen/pci: arm: add stub for is_memory_hole
  vpci: add hooks for PCI device assign/de-assign
  vpci/header: implement guest BAR register handlers
  rangeset: add RANGESETF_no_print flag
  vpci/header: handle p2m range sets per BAR
  vpci/header: program p2m with guest BAR view
  vpci/header: emulate PCI_COMMAND register for guests
  vpci/header: reset the command register when adding devices
  vpci: add initial support for virtual PCI bus topology
  xen/arm: translate virtual PCI bus topology for guests
  xen/arm: account IO handlers for emulated PCI MSI-X

 xen/arch/arm/mm.c             |   6 +
 xen/arch/arm/vpci.c           |  31 ++-
 xen/common/rangeset.c         |   5 +-
 xen/drivers/Kconfig           |   4 +
 xen/drivers/passthrough/pci.c |  11 +
 xen/drivers/vpci/header.c     | 458 ++++++++++++++++++++++++++--------
 xen/drivers/vpci/msi.c        |   4 +
 xen/drivers/vpci/msix.c       |   4 +
 xen/drivers/vpci/vpci.c       | 130 ++++++++++
 xen/include/xen/rangeset.h    |   5 +-
 xen/include/xen/sched.h       |   8 +
 xen/include/xen/vpci.h        |  42 +++-
 12 files changed, 604 insertions(+), 104 deletions(-)

-- 
2.25.1


