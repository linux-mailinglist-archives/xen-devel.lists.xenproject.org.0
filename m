Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE35F5FD9D8
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422027.667882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu8-0003rD-JK; Thu, 13 Oct 2022 13:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422027.667882; Thu, 13 Oct 2022 13:05:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixu8-0003kD-BQ; Thu, 13 Oct 2022 13:05:40 +0000
Received: by outflank-mailman (input) for mailman id 422027;
 Thu, 13 Oct 2022 13:05:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixu5-0002ig-UJ
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9d1c306-4af7-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 15:05:36 +0200 (CEST)
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
X-Inumbo-ID: b9d1c306-4af7-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W6vCbrh65CqtneFRPKerc/tF+uYF6bBQ+treqeycw4E=;
  b=SGWnzbWl795oZfchXHCSe88gPRYftZsJ87Kjp2lJaEvtAdXBscoiDmiq
   5pbtffp1MIx0ZqujnKv93cpJtFWC62C9gjgNSCBVh0H+yK8TPQFXN2vnC
   N2hMxrEb5RxQDGHBpAnI4TokM5Fy3PLsPOOUZJQxd5WUFZKwmVAMuycMV
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 82660726
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AO8z5oa6QIBiWaU9H14PguAxR2vbMJQxQLiYv2?=
 =?us-ascii?q?ybIWGNS2BzvzP5K+TjmH0vNjFa4fxt22/8FxV2p3KMkOC67Ar4lOsC3atGE9?=
 =?us-ascii?q?cPM/RmyDZ4Y+LPjuR6OhGYfSQBBz2fMjOQdUg4vbJtmBOWi4zEqUdqZzZT0i?=
 =?us-ascii?q?zEmbOWWRMqKXEOmWI3X6JvEkroYIpUU1ZfAZJOWzzG+58wvmrF0hrUns2YH2?=
 =?us-ascii?q?3FhWc6Uk73zQNc5mjFzKovuiuDsx9ZLhp5n3+HHlJqYYwvzSPZ/1NgS0foL4?=
 =?us-ascii?q?XD49D6moxF5Bi50IyxgqwRO082RQGfsqZGASANQ0GDzVJt0Yb59mgdSuZYaX?=
 =?us-ascii?q?eMmk5DwvGjS5qFrtyVJiDdjveR6CwAqOaK1Su1DJLTGNiVYkxvheQE7NLfg3?=
 =?us-ascii?q?py667s6287d6QE0OToROgWwpKIhvxouHLR/sRzY5zVLTpxu7TVCcPM0HX3E+?=
 =?us-ascii?q?DMkLWx+8fx/pT7kNReK4BCqOo0SazDT/ee1cqef4DtNM8Qx8iKBG4CaP72OM?=
 =?us-ascii?q?VO6iYBOAqpS1HOrBHx141T+g1yGGReGdTG95OF/kYB53fkvMt6wqJzskExbr?=
 =?us-ascii?q?YeG37O/4zQnw1elE+Rke2T7GNO44DrWGJo9xYWVqIwjKu/+wZcr/kmTyZvPZ?=
 =?us-ascii?q?A2oS0qUkTPgWCVTvw6DbWnle1YbNlcvWQvJudsenMK4UX2W8r/P048NSTXuE?=
 =?us-ascii?q?iP0ZJV0jOqP1kvaL12MEpYaEurg80RxpObq2UEDpfne8ICG2BeOuTbACopoi?=
 =?us-ascii?q?Fc9b9E9e/4j5/8qsVWmoIVYr8HeUPb1R/RFf4Q9tnGbAZHiV1kdlHRuRUYdv?=
 =?us-ascii?q?+JW63Xd0nCuDOYlM6lULHqGfQ5epJg/v+ObSWl68nlQALeimL2w5hLIkhNva?=
 =?us-ascii?q?Ug17tsxmHHuTpO+ICslC7OFkwbJOtmuC18WaCawQkoAEBvwvf7YMKvmSzPDl?=
 =?us-ascii?q?T9bEuD/53veGrMV6CtQwUd/lGEphsNWKpAQAnH3ciK+bKePBBQURSOOwFizO?=
 =?us-ascii?q?jBFljVS383hzmAHSqR1cV0MFOlqQxaQUgTQ9Y5Y6m+UNzukdG3Mq+ygbP0bM?=
 =?us-ascii?q?suUPLfWAE8ETQWOx/suOERanlifw6Oe4CBKQJCDlx6Jew4eZkHLRDJdV0hLQ?=
 =?us-ascii?q?HBjdRcNHEwS6QVv5ESZoYewz3ukQfJVaKHth7YEJXaqxaYhuF/v6V+oIJnLI?=
 =?us-ascii?q?MMpUFKRVwNjflVUTyUjxpvyF6BJnyG1KM01PohfVvC/HHyLhNwUo35SKrfA2?=
 =?us-ascii?q?1cjVJTg+KWSZbcitdvREc/tB2P4zwwNrRRavHBu8xCX0qCqkXbU6DMkV/tEe?=
 =?us-ascii?q?u+Ex0Rxc6kTQ0j55Nt/3KWFqp1kXvSYRMz2HyMMjmOz3mJTmlDtvFAFNxDJd?=
 =?us-ascii?q?0PcLQysodzojsMwI2bXm4xHELv1+/m41wwCCVtVJQ7XfFx674N72O/ZSk6br?=
 =?us-ascii?q?FcRx2mb/7QSIq2NoaBtq7NYAq7J0mnc6l9keH9l899wLzG28sEheCMEnKLXT?=
 =?us-ascii?q?zbk8RpztC+mFOrxZnB+q0msJj2SD4UKBpVeidwV0MtUWypXkhoyKpugSntda?=
 =?us-ascii?q?6zxWQy7ntM0L6mE34NvXWVZpsIKVEtfYw14fVmQ3/rFo3d1hNHt9cyzvmqoB?=
 =?us-ascii?q?I7BgkindB+ywamvVcEw9+tI5LRhbO4Z9iMrJuxPuaIuECpZXEnzkk2WPfZoo?=
 =?us-ascii?q?d9qIW5U0hzN7I+RyJ/NDcDLPo6yqWPDIkvHTbvQx/Miv9BehPZm4++MHBntq?=
 =?us-ascii?q?BqaaPv/YEdMiJTpZ5PMgY4O9+vpfMuTKfbGlYYgFxhDk9LionlUnIdVaP27t?=
 =?us-ascii?q?A7TZyzkCyVuSj78onzzXlwfP6lSluADUqjj2RQESScmjnfigGpk/78z7jjBM?=
 =?us-ascii?q?94vI+pqp3SWbXrwEu1DEnW9+HOhRLZe1j6xVRiGLyDg9dJ4KF+GI8x3Kbltx?=
 =?us-ascii?q?lWp8lHpOqwvHLAa8v0CyHa6FBTjvDGJqgATppO9QKMALL6UmyBF8GmAyLu8k?=
 =?us-ascii?q?fwQ48tsPPkEu26LZFiZjY4TibAdKv9dUFnVYg4tThfOxbn5P9g/TahHT9v2X?=
 =?us-ascii?q?v/aD+9PpzuVu4C4p4anXajCaw3AZhq1ZBOEp8QbHHMM6orWfXBPYoK6rIQSi?=
 =?us-ascii?q?iegWl2IhqT7FDMeSmcDEs7aQ+KqBWwEvTeApQqN9xi9Lz+GLbfU6iFOg8SOJ?=
 =?us-ascii?q?Ks9swdPWb6bvMyXgtRbhimOnLSC+/vmHi3tRC0B5aCsaLPGULRF1lyClSUXq?=
 =?us-ascii?q?euyZiBG3ebSQBBJkxkRM5qgkWXqYX+SBip+5kjJR3OnK9QjLCQuprQObHvoB?=
 =?us-ascii?q?ugZRR9jNUU+cVl++9wuu6ogzgcZV9Dk/1PbVaDpMbBU0Ol3DjajBk7jGSJDx?=
 =?us-ascii?q?8RlF3K5TbB46mNodQO/xFlhSuF7w7vTdlXkqBowG6S5b5mes8rKIR8+fn/22?=
 =?us-ascii?q?z6BeEivkPnW7eBysE4C22RFBaZD7wsdbZCH9p6EuLsQuA4dr2aAN8Rd2v0ij?=
 =?us-ascii?q?EMXNCZQOAsYu6NUvgGYtWlRodOo+nXCl64k+RrKfJG19HeceiLOB4jXZsOCS?=
 =?us-ascii?q?9zs5A9mmP94O2PoThJKA/k4k+MfhKqCquc+Y2xOkjqddi3NaHH2XO2XkE/eC?=
 =?us-ascii?q?c2Pg1EvXGDN6KKffqNs1LNIrCUKbYkmTHnQfbvPsvN3xfGZOKv/fw4UmLI0Q?=
 =?us-ascii?q?Pnpt/yvwnZ2gDKHoyN8SFe9ZlWq3JuuMlpKTz9QIt7M8jcaro01iqd6je9vI?=
 =?us-ascii?q?Xhy8rtgS1H08PimkIH4Kdn7804f/7+7fj6k5F+LirXglTf1fQRr4NP0U0J/u?=
 =?us-ascii?q?cvh/F9HhZd6IwcxHmKHkFmsiYkGiMrAwaU8c6+UhdkdydemQDhYbv8FB4Lqw?=
 =?us-ascii?q?o9h0VOM?=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82660726"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH for-4.17 v5 08/17] git-checkout.sh: handle running git-checkout from a different directory
Date: Thu, 13 Oct 2022 14:05:04 +0100
Message-ID: <20221013130513.52440-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

"$DIR" might not be a full path and it might not have `pwd` as ".."
directory. So use `cd -` to undo the first `cd` command.

Also, use `basename` to make a symbolic link with a relative path.

This doesn't matter yet but it will when for example the commands to
clone OVMF is been run from tools/ rather than tools/firmware/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 scripts/git-checkout.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/git-checkout.sh b/scripts/git-checkout.sh
index 20ae31ff23..fd4425ac4e 100755
--- a/scripts/git-checkout.sh
+++ b/scripts/git-checkout.sh
@@ -19,9 +19,9 @@ if test \! -d $DIR-remote; then
 		cd $DIR-remote.tmp
 		$GIT branch -D dummy >/dev/null 2>&1 ||:
 		$GIT checkout -b dummy $TAG
-		cd ..
+		cd -
 	fi
 	mv $DIR-remote.tmp $DIR-remote
 fi
 rm -f $DIR
-ln -sf $DIR-remote $DIR
+ln -sf $(basename $DIR-remote) $DIR
-- 
Anthony PERARD


