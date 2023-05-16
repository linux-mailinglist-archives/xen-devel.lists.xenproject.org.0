Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B840E7053C3
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 18:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535424.833131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyxXZ-0001OL-4Z; Tue, 16 May 2023 16:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535424.833131; Tue, 16 May 2023 16:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyxXZ-0001LR-1O; Tue, 16 May 2023 16:28:45 +0000
Received: by outflank-mailman (input) for mailman id 535424;
 Tue, 16 May 2023 16:28:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0wm=BF=citrix.com=prvs=4936e02c6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pyxXX-0001LJ-2H
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 16:28:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6cf12c8-f406-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 18:28:41 +0200 (CEST)
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
X-Inumbo-ID: b6cf12c8-f406-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684254520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ekbf1hsSNWvboaNh50ECw+KQwFQtwXZLH+LZ8zLNlXg=;
  b=BGa3jdSShWnoSc47cRK3EfwI9S2svD1bPiZdO3PPxV1BytRLSekkt9/l
   TNPXOG6UN+egPhoqOVGz7zykhEjQN6OehBP5wfr89vD/b7JZq72yop76l
   3BIji+q/E1ejf8REAWZ6br3hUS+DzIlkMdtsdVxMUumiSBf1xIoeAv30o
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109647125
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jPNdCagAfAbqyOj545dUcI0CX161SxAKZh0ujC45NGQN5FlHY01je
 htvXzzQa/qMZjD1fYp/Od+w9U4AusTVyYJkT1A6riowECMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QaAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQxeDUCcjCunt6S+46ncPEwwe0JDtfCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 jOYozugWExy2Nq39muor0i0h7D0uS7GVthDGo2hxOczqQjGroAUIEJPDgbqyRWjsWa5X9tRA
 0UZ4iQqoO4++SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8hTqqNDIcN2MqeS4ORgxD6N7myLzflTqWEIwlSvTsyISoR3epm
 WviQDUCa6s7pJ4O2Lmb0En7pwmQuqLREkkczCfJdzfwhu9mX7KNa4ut4FndyP9PKoeFU1WM1
 EQ5d9iiAPMmVs/UynHUKAkZNPTwvqvebmWA6bJ6N8N5nwlB7UJPamy5DNtWAE5yevgJdjbyC
 KM4kVMAvcQDVJdGgEIeXm5QNyjI5fK4fTgGfqqOBjarXnSWXFHvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF7mnlhmD2CHMyklXxLNIZyg1bEIYrpzXPUNrxphE96iF+9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUUG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X3CaXeFnSNSsyNNsCn/9X9BoGAMDlBn7ws1BLXGplxP53m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:VqipeKMj0QzZ5cBcTsGjsMiBIKoaSvp037BL7TEWdfUxSKalfq
 +V7ZYmPHzP6Ar5OktQ/OxoUZPoKRi8yXcf2/h0AV7NZniAhIJqFu1fBEnZrgEI1xeQygeV78
 ldmw4SMqySMWRH
X-Talos-CUID: 9a23:RcWcTmFVxWkoelFGqmJOpEsbBuAIa0H590vMGVfkTk9DaqO8HAo=
X-Talos-MUID: 9a23:e4ZZfQvqmKo+LxVsR82nu2BPaf1w4vuVLE0wn89XtfmdBzUpEmLI
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="109647125"
Date: Tue, 16 May 2023 17:28:34 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2] tools: drop bogus and obsolete ptyfuncs.m4
Message-ID: <2ef56f76-f75b-47f7-aef9-bef0c5b52883@perard>
References: <20230512122614.3724-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230512122614.3724-1-olaf@aepfle.de>

On Fri, May 12, 2023 at 12:26:14PM +0000, Olaf Hering wrote:
> According to openpty(3) it is required to include <pty.h> to get the
> prototypes for openpty() and login_tty(). But this is not what the
> function AX_CHECK_PTYFUNCS actually does. It makes no attempt to include
> the required header.
> 
> The two source files which call openpty() and login_tty() already contain
> the conditionals to include the required header.
> 
> Remove the bogus m4 file to fix build with clang, which complains about
> calls to undeclared functions.
> 
> Remove usage of INCLUDE_LIBUTIL_H in libxl_bootloader.c, it is already
> covered by inclusion of libxl_osdep.h.
> 
> Remove usage of PTYFUNCS_LIBS in libxl/Makefile, it is already covered
> by UTIL_LIBS from config/StdGNU.mk.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Obviously, the committer will have to run ./autogen.sh before
committing.

Thanks,

-- 
Anthony PERARD

