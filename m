Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDF1C76162
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 20:33:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167941.1494111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAPD-0001kf-V1; Thu, 20 Nov 2025 19:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167941.1494111; Thu, 20 Nov 2025 19:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAPD-0001jD-QQ; Thu, 20 Nov 2025 19:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1167941;
 Thu, 20 Nov 2025 19:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zJ8u=54=gmail.com=nicola.vetrini@bugseng.com>)
 id 1vMAPC-0001hr-DB
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 19:33:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c54610f4-c647-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 20:33:20 +0100 (CET)
Received: from nico-ideapad (93-44-185-120.ip98.fastwebnet.it [93.44.185.120])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 24AF14EEBF03;
 Thu, 20 Nov 2025 20:33:18 +0100 (CET)
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
X-Inumbo-ID: c54610f4-c647-11f0-9d18-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.44.185.120
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1763667199;
	b=eZGyJfNrjotM20Ekmp2e5goKn2B+BUe6bDXMYAzVvlpC6xO5yNhu2+R/QDf8RngAO847
	 BeHf8ZTOUMrqOIwQcFGkaLQIL1teKzd0hzIYT3aiEBB3P1j3FIQ/tSjzoLMhqfAl3zXg9
	 waOy0eH6jLGJZ6ZePKzV1/2e8PuLGKC/Hp45USCuygCyElDBrES/3IpEn/qqjgrKwQH0H
	 UEAo2K7biJkPwxtqKTfrD4gsu41d6Jh7ltZtbZdO0UmoHt1G9pSFtbdlKH0r0wYAZVZgY
	 X/uz+DajDKy6osNg0TTPL84lH3UJVp9SDGO/9RDIo3Nteg5QpnX8doGeNgLbM7XdQ+WNw
	 rHG0Mdl/MEu5KJl2/pZJXvPbqbgi3yVQ+KW+/YcqffD8HwKqkluv2PYtTxewBuHZtXXG/
	 FO5B+ZX2zg52Gl2JEsTvzV/pwQjzQ5rnilDUflpO9bUxkXxAfNcrnwra2LOE1bSKKzinw
	 gLirCcIb/RscrfhY2rNyX1k8FD9yXlDNnBCZbKoziGQULPgfu+Q+MQxKilB0W9RP9Iu8x
	 bNkD4u2/WiksxJHIYzRqeQZ6yvo0ZlSU6o+Jzkc1jJr9GRMiYAkp5gZTuDSth3LrVxFuh
	 CO4i+xM8VQtp+2lTi+sISnlJIBKxDEovjnbWJ3r74ucoTS4ZJPK9dy0a6xaCaxA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1763667199;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tul1PLLv4bxQXVkoHXhHpDiMgJ42zNl+zsNCk3BcmZY=;
	b=gjGKQA+jy1CDP7bwrbEcmEWEY/ZZofe7tkhLrjAcvr4INPw8sGRGGABDCKJhfrVY+fjO
	 B2DSIvL4sgs3xfg51C7fi76Q6IRp4e/H/n8sbrXh2LjVDCDvRQ3sAOe2YWNXjH0u4olCa
	 1QtUE5BWTVnjABKplSRovk0dG5EcNmMe+XjgL1wDPiqvIBdepiEWkDRCzl5vsoCHybavq
	 qe13ALtV+hR43Ady14NGdp77CnfIr8mSuiW9gknhE5YxNooHhrUsxKw/Sl/da+iX2gtkd
	 +VDYedwlYQb39jfh3Jzy1ppsGiLtRNYpL4YVdvMRRgl26sOOuhCASeUQKA8XM2fqqEYJD
	 7tWUN+G36RJxrdV9sYTURbAVMN98fg88wq6UdoOQoEoEMpALuJFKY5B5tkKNdSYKOhzLj
	 SY3+74KxmxV7IsuKLgF9N0ux7bKOZmhjv0QopxaJJTmiM4VTCPriTAkuZQ8QQ9zChnc0D
	 8Gtt7g1XFTIjnjIxC6LIR4SnaxrM3Y6IsocnKDvs2fEuBV2wJ4CNQgZQDJbtQLdbrWMJZ
	 1+5j7qAuDrNcTiU0aWrr5pIgOFoWRHnYCSplsiBD1i/b7cV/HGmETiZAeUhH4WizPe6T/
	 PRQ3W+TIOz22i21/aDJJlDgpAauvwn5p3ypNeQ2G0XXxzzxeN2RgEfMBGrlz06Q=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.44.185.120
From: Nicola Vetrini <nicola.vetrini@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	sstabellini@kernel.org,
	Nicola Vetrini <nicola.vetrini@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/4] Misc MISRA fixes for default Xen build configurations
Date: Thu, 20 Nov 2025 20:32:52 +0100
Message-ID: <cover.1763642993.git.nicola.vetrini@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses some of the violations found by widening the scope of
application of MISRA checking to default builds of Xen for both ARM64 and x86_64.

While it has been tested on top of a patch yet to be applied (but with
the necessary R-by [1]) these fixes can go in independently of that.

As evidenced by the CI pipeline below, there are a number of regressions on
guidelines that were clean on the restricted scope but are not in the wider one;
the patches in this series address a subset of those.

CI pipeline: https://gitlab.com/xen-project/people/bugseng/xen/-/pipelines/2156782159

[1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2511031448530.495094@ubuntu-linux-20-04-desktop/

Nicola Vetrini (4):
  xen/xsm: address violations of MISRA C rules 8.3 and 7.2
  xen/sched: address violation of MISRA C Rule 16.3
  xen/param: address violation of MISRA C Rule 20.7
  xen/param: address violation of MISRA C Rule 8.2

 xen/common/sched/credit.c | 2 +-
 xen/include/xen/param.h   | 6 +++---
 xen/include/xsm/xsm.h     | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.51.2


