Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3F6E4753
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522030.811148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNkS-0000Sm-76; Mon, 17 Apr 2023 12:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522030.811148; Mon, 17 Apr 2023 12:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNkS-0000QO-3i; Mon, 17 Apr 2023 12:14:20 +0000
Received: by outflank-mailman (input) for mailman id 522030;
 Mon, 17 Apr 2023 12:14:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poNkR-0000QE-DV
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:14:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f52fce9-dd19-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 14:14:17 +0200 (CEST)
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
X-Inumbo-ID: 5f52fce9-dd19-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681733657;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NKlnIOh7Hws4lz5whTM0B5pgpEvxTYKB3zR4tROjvGY=;
  b=S7AV7DBGTRAYrI0help1kb93u/THwaYj+CR9T3dH6sTPk8DrsA3yTKa0
   Ctr2Wzfvbj8ES6dKiesaYYF2T9FZpEPTd8dkhPVk8IrwVWeTW4L20uQs/
   pnreHh9oU65W2xqBMIyMQnnG5iEYGhtD79aJLA0OFWXNNtFcwYIPw8k1b
   g=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108238671
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:0oHowa5P7W/Dt0pfnIT+VwxRtM3HchMFZxGqfqrLsTDasY5as4F+v
 mAbX2mDMq7YYTDzf9gjaNnjoRxSvMPQnNQ1SlBvqXszHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPawS4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m/
 sYlKBYISk26m7iy/4qGR7I8gvgsBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7I/
 DmWoTugav0cHNXG8DjY6i6yvf3sgz7yfKQPGpG92uE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JTFOsg4Q3L1avQ4C6eHGEPSjMHY9sj3OctXiAj3
 FKNm9LvBBRsvaeTRHbb8a2bxRuMPiwSIX4HdDUzZwIP6Nn+o6k+lhvKCN1kFcadhNDvBSv5x
 TzMqSEknqgSluYCzaD99lfC6xqOjJXUSg8+5i3MQ3moqAh+YeaNZZGs6FXdxeZNKsCeVFbpl
 GcAs9iT6qYJF57lqcCWaLxTRvfzva/DaWCCxwc1RPHN6ghB5VaoR71QxjRaeX51aMI7QQLkO
 x/XhQx4sco70GSRUUNnX26gI510nfG8ToW4B6y8gslmOcYoKlLelM16TQvJhj22zhBx+U0qE
 c3DGftAG0r2HkiOINCeY+4GmYEmySklrY84bcCqlk/3uVZyiZP8dFvkDLdtRrpjhE98iF+Jm
 +uzzuPTo/mlbMXwYzPM7akYJk0QIH4wCPje8pIHL7DcelI7RT55V5c9JI/NnKQ8xsxoehrgp
 CnhCie0NnKk7ZE4Fel6Qi86M+6+NXqOhXk6ITYtLT6V5pTXWq72tP13X8JuLdEaGBlLkaYco
 w8tJ5/RXZyii13vp1wgUHUKhNY6LE703lreYXPNjfpWV8cIejElM+TMJmPHnBTixALs3Sfii
 9VMDj/mfKc=
IronPort-HdrOrdr: A9a23:EP24ZKrQJ/zpNSOHys0CeIQaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: 9a23:5Ltsfm1wQA3pVO51c1LEabxfEfoYclvY6CrpPxW8Nl5URebFTWOf0fYx
X-Talos-MUID: =?us-ascii?q?9a23=3A674nSAyqSh0xzClZ+/i9VZN2D4GaqK33MUJQick?=
 =?us-ascii?q?YgNunKzF5HxGAghiybpByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="108238671"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 0/3] xen/livepatch: Fix .altinstructions safety checks
Date: Mon, 17 Apr 2023 13:13:54 +0100
Message-ID: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This replaces the previous singleton patch, with several build fixes found by
Gitlab.  I also included some feedback from Jan on patch 3.

Andrew Cooper (3):
  xen/ELF: Fix ELF32 PRI formatters
  arm/alternatives: Rename alt_instr fields which are used in common code
  xen/livepatch: Fix .altinstructions safety checks

 xen/arch/arm/alternative.c             |  6 +--
 xen/arch/arm/include/asm/alternative.h | 12 ++---
 xen/common/livepatch.c                 | 68 +++++++++++++++++++++++---
 xen/common/livepatch_elf.c             |  6 +--
 xen/include/xen/elfstructs.h           |  6 ++-
 5 files changed, 78 insertions(+), 20 deletions(-)

-- 
2.30.2


