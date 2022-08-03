Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D97588CEF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 15:28:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379939.613850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJEPh-00035z-6Q; Wed, 03 Aug 2022 13:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379939.613850; Wed, 03 Aug 2022 13:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJEPh-00034Z-3i; Wed, 03 Aug 2022 13:27:53 +0000
Received: by outflank-mailman (input) for mailman id 379939;
 Wed, 03 Aug 2022 13:27:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+C7S=YH=citrix.com=prvs=207fd374a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oJEPf-00034T-4r
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 13:27:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10c251a9-1330-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 15:27:49 +0200 (CEST)
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
X-Inumbo-ID: 10c251a9-1330-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659533269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fOYrLEKpHirvMQcgzGy4HE9jocjE0I4w58zB6mY7cOA=;
  b=gZoKzKh7lrLUMT4XhBHRukwFfmzc7ieSYx7+bg2r8w0qtmZX0GliLLqx
   TyAaygFDaaT7cEFnbtmJn6zhYoM2pRp4d8tV9KVSuH6PcnG3cGlxQLCPH
   uVnRBiMXzqYn8SOVna9zLM4sqVNUs7zVL4gjbfVQjsRvQASIUW9jSwMte
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77274385
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A/zGHX6l72diptj4W89KG16no5mJPLROOEa9N2?=
 =?us-ascii?q?KgSYm36f7AEGi7AQ0E4bYEwkwOOGx2MN4LxfrTIMZgnwacg/LdXDsLzolLdH?=
 =?us-ascii?q?vP+ukxq7tvdL1A06r1s82kWjEd9aRdn6Ys+0z30HbRw+rWwp/KC+5yskU0JU?=
 =?us-ascii?q?u22Xkn0ehQnDslHnGbQclqUFdhJJH5DEYwl0qi6g/QeleMLGAEB30/DEamn4?=
 =?us-ascii?q?qGZlhSK6JZz6qVMTnlTfNcFwUxtqdNlMnLkTLgb3giAy1itS30SmmPwwW9c/?=
 =?us-ascii?q?tRcsnZBa/1mti1yxeo/7ceS+Eo+lD1kELX3ZyxVjGIUopvutjbxJE7cpBBKj?=
 =?us-ascii?q?idue6pzlMEUAw6ZE+uoTIEajNNW4ltK79OYQZoGRObdgC8MZ1u6V1FLpkNJc?=
 =?us-ascii?q?RqDA5crnK/Rtfg6v8hXclXOsAHCHRcqLDFO9AwyXD8wZeLDdUxKAYJOQcS0c?=
 =?us-ascii?q?tjo+oEiq/99l+EF/n3tzWqOdjBsqdNTdkym+NF6caIQiXEpIg3LgIybUSz/X?=
 =?us-ascii?q?uZVaOLofR60nLQ9y10R6NwzdXAgpU+s7oUh4QlQYO9pucnKxAMp8OWp1cZgA?=
 =?us-ascii?q?pcfqyD3+TpV9ZUWm+yWOy9+8fvFQM3cdZoDzf243UfwbbqZTmH1ql2HQogIS?=
 =?us-ascii?q?a3M48m1Q5rNQPM6dNXUOQgwQc8jEptPMn+Ge4qzNg68mvmfwfhDPgt9SIxX1?=
 =?us-ascii?q?t2TRzlMyzPtsanvZpBxuksuUDdmBr255G0HjI51+PSpdpGUKg6UTjAn/4CI3?=
 =?us-ascii?q?1WxUujyJ44KDXJz9w+K5GJ92d3K+jMh1hodJGw8tyxpsmthoIYjDlnIfCxJP?=
 =?us-ascii?q?ngmlKgrEV7pTCYeSOp3t1+g8FwSBtJNe5D7ISbhbNfkl71yp+07IJDv6K3fq?=
 =?us-ascii?q?+jN6SgtJE1KQSNYTTsDSUaXIlpJ4KSEpJphvnmur7bVWsZM/0obSDxLFPrIH?=
 =?us-ascii?q?E+5f//tdW4v9sfB1d1O9VQER6zWgyCGYSRB4okXXlu3nOORmLC4ajRcotA9k?=
 =?us-ascii?q?LQqxgd5OWw9XNpJZ/m1GhrQk+PZwFAUEk/4EIhSVauPvjS4M23PT5cdNWVS/?=
 =?us-ascii?q?TShIUKccTUlCL642T8wjk7DWo0l4pfWCxh2yGvJZmoDsun43aTHMEDzgGYiC?=
 =?us-ascii?q?2xCFI+KmJq3ISm1G1pS8BATqeQcB8zkRjd3QV5BDecd8JGfUmzwKJER4XDJb?=
 =?us-ascii?q?sD8NaCtbupiOkc4ZKirBzbFGAPa+REYgL4Iw56iWnJNnDB2OYA9HYngrITX4?=
 =?us-ascii?q?jKRl5UexZqaXgzCRKBSOrRwW30QBny3/IderinpEbB/XnlNP43dZjhsjwOkF?=
 =?us-ascii?q?2yEuZhPfxRLGliQgdvOu1Co7i96u2/JXq7aG172tUO5/snTWYpU65eTy7GJe?=
 =?us-ascii?q?SyaYC27XLYMlIQtyB+Ur/4wnxydz89ZwYWBIYEzTOc+nA2PsEnn5QdGG990t?=
 =?us-ascii?q?cAEyvONqvbSplxWK1jGHIApeyGNyt6mXrJ/xyffXr/OorZKIVGxgr6MYKvnJ?=
 =?us-ascii?q?T4p6Lp7gRe+qsNFgCm5dvLHHgqmtEDd1/iGrll0ZoMWxZqiguUNe/Cu7uLqF?=
 =?us-ascii?q?pbBYslSmxxNkYt7TjOdT2Zs2pi9OmGhlrdFzEdp+JmZX1jFYxeGVKfqvvzp/?=
 =?us-ascii?q?dK+h7UNi5DSHUn8Ugby8WKbtkRgWtoBxgzX2F+DFYKQb76bF/oaXnzxZQ9gY?=
 =?us-ascii?q?vhizr/ycXCQOI/oaoijo8CN8FkilvKUmSps+ac85qsFeWvMyHdso1SWhl8Ut?=
 =?us-ascii?q?yg/bqFfGkUECcZzoU5SuDVlD1tSDK5uILrjhV+7AWiKWM4it9POZEWAbfMSD?=
 =?us-ascii?q?6v0+jB4v/nstZnsQ0plFbxMusPCORvzffn0El5V/xY+SXpEyj7fNDU71BuRw?=
 =?us-ascii?q?cWRB0x9stLQcfxyeuX9Z2/Vpt4sHikJFBr94wQ60kvFqKvS+zF/kTY+lSUgi?=
 =?us-ascii?q?+AzU8gFuIf9mPNpBVzypLD/xRg+tWHJtvHoUoM94cH/2cZCvi0cnndLeS5I0?=
 =?us-ascii?q?lOd+xxSWYkwiSEP9w5/HY0K3JxRHPyANDojh9dcy0VDse6lLcoUNmGt+wQYp?=
 =?us-ascii?q?mNFFp2G7ONq9pwsiCZTz1CLyhKyC7xirsHF8ws9IGw60Ilx+fiBgla98Evj/?=
 =?us-ascii?q?PNDaI+VokL3DXZBR2TI/GKO1Ndp4u80DpLiXPRwzjiEV7HBQzmLXw8Ew9p8j?=
 =?us-ascii?q?p2gEZi+04NeJ6uaJH7gh4HLrwk4FK5+QFrXCC7HLGtaGrkdv9kkfBcCNwmuo?=
 =?us-ascii?q?DGqjVb2tHsSoR6PymsrPC4KVWIFZgl4e+vgqCdcs06suzsH5TNrFMYqPDff7?=
 =?us-ascii?q?6rkg6Fs7Ks12/wXHgd+e0K6MDbPRXm8U86uW/BH3miaf+uJ5Zv7NjjVW1Mv0?=
 =?us-ascii?q?oshldbxfHGifPsrXajhBd42VGGosDf581rH6Q7pDS/z5onLg+YSt0l9c+QKS?=
 =?us-ascii?q?wzrqPtPXU2n8kOwLRmK2/Pf7zBSfOr2/13l1w6+lx8K2zKgTVpt1bOY4ACem?=
 =?us-ascii?q?Ad5LDsaZ1AuC9L8QZp8KAHfttJTJH/M0I9azPcC42t+pD8tb0pIXSXHiVeqB?=
 =?us-ascii?q?ZYptyjJ1Wn7Pw1IBxB/yfekhHDqGL4C0qlHUmr0i22o7Wqb36xmcrdiu8TQt?=
 =?us-ascii?q?gSOxq4BwmjTV7h2BgQPcqjxy9fMd4FF9pM+gVYHUpb57kM4GvbMdDAigkWgt?=
 =?us-ascii?q?7ncsrWyPmHdj/i+5zH5RZRxGvoEkvTZQS7vubujAf5ilaamDULyidPGRtsbq?=
 =?us-ascii?q?+73NkaNRr5YH1vta0WNHMR8c+woeN1Y8osA9Ey2qd35bisPAeOORSne9OP/p?=
 =?us-ascii?q?fjgKyHn0F9LKcN4GhVvTb/qqazzQoK2xHg2gxhHyq3jzsCL?=
X-IronPort-AV: E=Sophos;i="5.93,214,1654574400"; 
   d="scan'208";a="77274385"
Date: Wed, 3 Aug 2022 14:27:43 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v2 4/4] build: replace get-fields.sh by a perl script
Message-ID: <Yup3z/e4mMy3SqG2@perard.uk.xensource.com>
References: <20220614162248.40278-1-anthony.perard@citrix.com>
 <20220614162248.40278-5-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220614162248.40278-5-anthony.perard@citrix.com>

On Tue, Jun 14, 2022 at 05:22:48PM +0100, Anthony PERARD wrote:
> The get-fields.sh which generate all the include/compat/.xlat/*.h
> headers is quite slow. It takes for example nearly 3 seconds to
> generate platform.h on a recent machine, or 2.3 seconds for memory.h.
> 
> Since it's only text processing, rewriting the mix of shell/sed/python
> into a single perl script make the generation of those file a lot
> faster.
> 
> I tried to keep a similar look for the code, to keep the code similar
> between the shell and perl, and to ease review. So some code in perl
> might look weird or could be written better.
> 
> No functional change, the headers generated are identical.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Hi,

This patch have been on the mailing list for a little while now, could
it be acked then committed along with the previous one now?

Thanks,

-- 
Anthony PERARD

