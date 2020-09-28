Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26C42FB124
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 07:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70123.125803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1kLp-00071M-QO; Tue, 19 Jan 2021 06:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70123.125803; Tue, 19 Jan 2021 06:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1kLp-00070x-N9; Tue, 19 Jan 2021 06:18:49 +0000
Received: by outflank-mailman (input) for mailman id 70123;
 Tue, 19 Jan 2021 06:18:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g+CZ=GW=devnote=mhiramat@srs-us1.protection.inumbo.net>)
 id 1l1kLo-00070s-6r
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 06:18:48 +0000
Received: from devnote (unknown [210.141.244.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e697e9ba-ff21-4863-9a6c-e2d8c6195030;
 Tue, 19 Jan 2021 06:18:45 +0000 (UTC)
Received: from devnote (localhost [127.0.0.1])
 by devnote (8.15.2/8.15.2/Debian-18) with ESMTPS id 10J5uVpR001015
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 14:57:10 +0900
Received: (from mhiramat@localhost)
 by devnote (8.15.2/8.15.2/Submit) id 08SCgdk3004558;
 Mon, 28 Sep 2020 21:42:39 +0900
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
X-Inumbo-ID: e697e9ba-ff21-4863-9a6c-e2d8c6195030
From: Masami Hiramatsu <masami.hiramatsu@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: alex.bennee@linaro.org, masami.hiramatsu@linaro.org, ehem+xen@m5p.com,
        bertrand.marquis@arm.com, andre.przywara@arm.com,
        Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Wei Liu <wl@xen.org>,
        =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen: acpi: Hide UART address only if SPCR exists
Date: Mon, 28 Sep 2020 21:41:39 +0900
Message-Id: <160129689861.4486.15700361505030965554.stgit@localhost>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
References: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
In-Reply-To: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
References: <CAA93ih3-gTAEzV=yYS-9cHGyN9rfAC28Xeyk8Gsmi7D2BS_OWQ@mail.gmail.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi,

With Julien's ACPI fix, I found my DeveloperBox (
https://www.96boards.org/product/developerbox/ ) still failed
to boot bcause of SPCR issue. According to the UEFI EDK2
implementation, the SCPR table will not be made if user
chooses graphical console instead of serial.
In such case, we should ignore the SPCR missing error.

Compared with Linux kernel implementation, this doesn't check
the STAO (status override) table, becaue it seems STAO (or XENV)
will be provided by Xen itself.
Or, should we check STAO too?

Thank you,

---

Masami Hiramatsu (1):
      xen: acpi: Hide UART address only if SPCR exists


 xen/arch/arm/acpi/domain_build.c |   19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

--
Masami Hiramatsu (Linaro) <masami.hiramatsu@linaro.org>

