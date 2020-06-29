Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567720CED8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 15:35:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jptva-0006lH-Ez; Mon, 29 Jun 2020 13:34:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsT6=AK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jptvZ-0006lC-It
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 13:34:29 +0000
X-Inumbo-ID: 411fbbda-ba0d-11ea-bb8b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 411fbbda-ba0d-11ea-bb8b-bc764e2007e4;
 Mon, 29 Jun 2020 13:34:28 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 2mQVr80Hqteu/U4L0F00N2/ZXrAA1kSi7Vfl8ESmr15CM8oJ5WIsJzxs4mF5AluKPB1icZZPNL
 eIswkUW/5mxZ01J3Zso5qQHusmNJX3U6acsUHqCPMqWk7dDLyO+dPu8MJqZG91H9a4gACOANl/
 ENMPsa3xCc/8rimKeIGEeMILi8iXuZ/0kQMghzK6LP+imVcvjUy/Es5Iz5tq0AGo6fKQxNOykq
 YHnOfXeKiTevRW0W2VIX0IIoJ6cF0GHWf1x5V3veMr9wFYAg1iyAS+jNB4r7ujb3dyzzR6GckT
 BwY=
X-SBRS: 2.7
X-MesageID: 21168238
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,294,1589256000"; d="scan'208";a="21168238"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24313.60895.220354.223207@mariner.uk.xensource.com>
Date: Mon, 29 Jun 2020 14:34:23 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] tools/configure: drop BASH configure variable
In-Reply-To: <20200626170038.27650-1-andrew.cooper3@citrix.com>
References: <20200626170038.27650-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Daniel
 De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH] tools/configure: drop BASH configure variable"):
> This is a weird variable to have in the first place.  The only user of it is
> XSM's CONFIG_SHELL, which opencodes a fallback to sh, and the only two scripts
> run with this are shebang sh anyway, so don't need bash in the first place.

Thanks for this cleanup.  I agree with the basic idea.

However, did you run these scripts with dash, or review them, to check
for bashisms ?  It is not unusual to find scripts which need bash but
which mistaken have #!/bin/sh - especially if the usual arrangements
for running them always use bash anyway.  So the presence of the
#!/bin/sh is only rather weak evidence that these scripts will be fine
when run with sh.

> Make the mkflask.sh and mkaccess_vector.sh scripts executable, drop the
> CONFIG_SHELL, and drop the $BASH variable to prevent further use.

Since the build currently uses bash for these, a more neutral change
would be to change to #!/bin/bash at the same time.

> RFC for 4.14.  This is a cleanup to the build system.

I see this already has a release-ack.  However, I would not have
recommended granting one at least on the basis of the description
above.

I agree that this is cleanup.  But the current situation is not buggy.
I'm not sure exactly what the release criteria are but ISTM that this
patch adds risk to the release rather than removing it.

Thanks for your attention.

Ian.

