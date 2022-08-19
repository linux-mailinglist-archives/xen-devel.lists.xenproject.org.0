Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D0599DFC
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 17:19:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390376.627767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP3lT-0000oL-6x; Fri, 19 Aug 2022 15:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390376.627767; Fri, 19 Aug 2022 15:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oP3lT-0000lq-3v; Fri, 19 Aug 2022 15:18:27 +0000
Received: by outflank-mailman (input) for mailman id 390376;
 Fri, 19 Aug 2022 15:18:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wa9Z=YX=citrix.com=prvs=223f339b3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oP3lR-0000lk-1G
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 15:18:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2803a847-1fd2-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 17:18:21 +0200 (CEST)
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
X-Inumbo-ID: 2803a847-1fd2-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660922301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iBBWMwRF8q08EAUIMMgBgnZc3g2uJUcY8e4SugDIg/U=;
  b=Flv2TFJP05cRbx7GGgKeuWjTIWDu830dyISP2R1OY/Gy7LuJgJxrSaQf
   AdvYipyNkKaceiROX4NaQ7XBn73bYZjnoQUvghRs7iTYozZmYRN6i2KYq
   8e84UmtHWvCMLuByYh68U21YMw8/rgy7DHLTIze6Yy8D0o6aXhDR8Sz+4
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78490267
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A8m4zIqNXyL+ppfXvrXNrnJbIbIKmJRDYMRhce?=
 =?us-ascii?q?5OJyBtyWh8l9cMBqid6VyMwfmlZvMLLBZE3UfSHwPsujdAVUTlwFH3m635yO?=
 =?us-ascii?q?EZHiPVa88cfUxWKKZ9PGrW5lZRoOwET0eqFU7lr67yeCl3X8EA/Wt43cgLJS?=
 =?us-ascii?q?eAzgdQqqwLhLK51OP3VLS2Xdthp/Xh4pM3IkVIQ8m6ocMDV95skdfv59tMm9?=
 =?us-ascii?q?lphuIhSZMDSmtVW40+J20p5gv8V/uS/QfPfuYA9kS3gR2Zyrev5lD0WBlh1V?=
 =?us-ascii?q?28kjE67hYE8xldH8KcPXWQJn1Rtat5ZRyZPu03CkH0CsPig9H/4GVeAnjhUJ?=
 =?us-ascii?q?VsrMit4rZ1p+uUvfd4ym6VhSsGdEgJ1ZJKG1kmyhrO3z17fn4rEfegpubMbL?=
 =?us-ascii?q?pRLXNhSG5nG/9x9w94uaQd3+UCFYt9jcpPGIIs5IHWK8jN0WrdvC8f4t1eku?=
 =?us-ascii?q?sQYnqKKn+phJbCectqpzBqs5WDgFPF87ORQsUjrpD3HoEh0/Zbh+JbDKztNg?=
 =?us-ascii?q?gKkhlb4xRJTPR1nOcKeZhCtxLT6snATzivPa8Ux62EbiBHFQe6hKGWchRFQ8?=
 =?us-ascii?q?+qbJf5VpFAybi2pYqcMTV9x9ckoto2O6NYotor4KHPlX8mCHB0F6JsaafDVa?=
 =?us-ascii?q?f8baerzaAKKqb0MsUypLco3aATyPKgKmxQfVmsTUCGW6Lg6lslww5/aroitR?=
 =?us-ascii?q?KLhRDnQuf1iRzcd2U5y8KztCn8PLZAnujvdkoD1k01yWnCm7kTx9bcmGHZ5o?=
 =?us-ascii?q?6xQrbaORTVt3YCQb6tKUJpGOBoxKh6JhDjtFjVqElqtqrHGsvREh3sMo4Wnr?=
 =?us-ascii?q?NBUZZX+O4bqFesF+HOYZWYhK5SAEgli8ksyYQ9VWlNwrI8wFHmNFtDf5cVxW?=
 =?us-ascii?q?WrqlknksnIwx6DkLfNIIyfNKifusFYQwwC0qzpFB+VSQTMAhIRqHjUS8N36c?=
 =?us-ascii?q?VShJxscgf/mU26JLs/tXE14b3/Ok76cpq/l2NgGxuZYh4nCAuYAlLyJxpNgS?=
 =?us-ascii?q?uYvdIO40+ly+bmO0F1E4bcqXV2N+I/6edAG8mGI76Or+JA2ZOdZsfFNljop3?=
 =?us-ascii?q?Jo6MEPArhkrC2XyfrE0Q54Nv0diaAU80jakXEbTi7IYfcA4AKbhSrL0kKdPb?=
 =?us-ascii?q?b3k1olXkL3Vm1c7RR02id317/U7w9Iz12uaDpPU4fRqEgWtaql18J1iLtmxY?=
 =?us-ascii?q?XQ1W4nzn5crATf5eWnwqhwQlPglIg9Xw12viuNDObwm0J8bVn5Qg5vKRn0cf?=
 =?us-ascii?q?Qcw05E5RWSn8JEW39OdvLr32HmRm5+3mfgVsmJzPe40R01ikDncQWXmI7Cdl?=
 =?us-ascii?q?yDDGbe9oMaUT0mdaNmHuq5/THtMlxklhLhyFWmNqnSB2i9YdRdtXXdpFiHnI?=
 =?us-ascii?q?BAqZ/Ysns8hQgYkzKK2x5UwGTDRgeO0i6obxipWCcNUsSZXGxBxtscBZJR2U?=
 =?us-ascii?q?ftokHWaAOEP0YrogTHeTjp8mxVFRWmW2Dpg9ECdb1plv5w01nCk+dv5+cArU?=
 =?us-ascii?q?mw6JuTewoTHEeim+tQeaDFKbC/UrIQz6wufHO065oHMxi7jn493jNNmkZboL?=
 =?us-ascii?q?xFGuG7GxsrRXQjF1wWESq3PcjAlQ3UgEnEe/x9QHDjzdROWO0tjKcMGSetE9?=
 =?us-ascii?q?bOuKVeLH5kynY2/mYe6Bgz/ba+JRwzs6TjZ4EBZjtw92+dqlDHMW37Vuwy8A?=
 =?us-ascii?q?UDGMl3QVrqYOflBqMnNNcBzfdBqkmBx63RHWcu0udGOaUrnxHiSr47cBNECo?=
 =?us-ascii?q?UxxLypOr9c1v6Mjp6YdHIQPDVt5tCfYqvmIYh6m6uE+fzv8ssn6MtbRw6XlC?=
 =?us-ascii?q?a5HCi8jWasgAMOF4OYbRa+iId0aNzhopo+1KWxQ33V0hGN2uyjRNv5a0rho8?=
 =?us-ascii?q?7PWa4z79/YXw+hwPCbptxBr/Tr0ArhBVip1Fp1G00HB3UATpLPpmAfAvfWYD?=
 =?us-ascii?q?rVabDaKfrcTRBeK7/eqk3kFalSrjkibobfp+Khp+zIIun01AfTzFKj+++4dc?=
 =?us-ascii?q?sVE7QYy0pSIIy4NLk1992VKnbl1iTSEnIkjgAKKmiZslY+dIGgmNgRmrXZyR?=
 =?us-ascii?q?y7tCUxtds+bPhV1MYfGTzqAX+XExxvw99PzwPuiE6LympZ5xHc849VLs/l6T?=
 =?us-ascii?q?JJ3eiafJB0HV1PXy3ktEsNkOXMJgrBFGdMZemB4urUC69FnOOPSnPCHLiBbo?=
 =?us-ascii?q?qpFMVpu0GoLQwGd+1ml+PLBJl429UAc0g4VvmO63Jft7QnnCMyngGxvLJHkC?=
 =?us-ascii?q?7DK1e1c0kkPeh8RgbhcBpljtLwNbV2pIsrXKYTs658z8I1L99mK2vw4nE39C?=
 =?us-ascii?q?V/UCoDbn1m583os//uh/7GMVJ4bfHui6ENZ0EweX+cFGyUzBfx1UDQI6saGp?=
 =?us-ascii?q?jxC6JGl1+dj8Zwk7OxSSSIoQMzMVG37JH5VZBpwbKWMX+fVu+H3OOsyvvNS7?=
 =?us-ascii?q?ViwbMINozBYLjnGWg2cu63CWYNki/ggUFRza6jbLFY0VjtSLgHvp8vg0E6+C?=
 =?us-ascii?q?lzTsGgb3wlWgtTFEQ9oNEUcq6yTn6KRCqHQFZG0VcxD7YAKhKrjjD6BM+C26?=
 =?us-ascii?q?3DE87HWh5bQTZgK9a8vJYeHC4OTRTvv6aK7p0dIDB7QN8t8s3YUYAUhb2Mq+?=
 =?us-ascii?q?fw7ajRs4v9Y5Gt81f0aBwNKaSoXU+lt9C+8TZP5L8DxTLJiULMHYjl3/8YKf?=
 =?us-ascii?q?6xsxEtXg24quiM0d34qgvDrYrfrViHTZ+51gL1lsslIiup7RLqYcaN7ciJny?=
 =?us-ascii?q?PrrVTOD0rOrDWPiWXOoK0NOF16evIbdcRqGiRycqGWXaRIWBy/c5m9JEJcXI?=
 =?us-ascii?q?1gibk+k+3YD08oy8Em2RJE2HwsilV7AOcFHljQp8epwozr8wUzj1MWv6qvPQ?=
 =?us-ascii?q?g55y2bDy3yp1DF7P5DlmesKJwtfeXcRzbtKX1ReW1u12yRdIdBgJ2QY36jQY?=
 =?us-ascii?q?1gLfk/83GaUedek5ajs8DnGE/5hJDASnSn+bwtowXATHjDWpeCP/TTpirXR/?=
 =?us-ascii?q?7dzW9kF5wuO9hvswf3GQ8CVXSra/nU+4yT5/LByiLeOjNzQ?=
X-IronPort-AV: E=Sophos;i="5.93,248,1654574400"; 
   d="scan'208";a="78490267"
Date: Fri, 19 Aug 2022 16:18:07 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wl@xen.org>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Tim Deegan <tim@xen.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, David Scott <dave@recoil.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v4 21/32] tools: Remove -Werror everywhere else
Message-ID: <Yv+pr9JEidwlTw8X@perard.uk.xensource.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
 <20220811164845.38083-22-anthony.perard@citrix.com>
 <dcc16cc0-4bc1-d6c1-53c5-92a0c1dde9eb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dcc16cc0-4bc1-d6c1-53c5-92a0c1dde9eb@suse.com>

On Fri, Aug 19, 2022 at 04:56:05PM +0200, Jan Beulich wrote:
> On 11.08.2022 18:48, Anthony PERARD wrote:
> >  tools/console/client/Makefile   | 1 -
> >  tools/console/daemon/Makefile   | 1 -
> >  tools/debugger/kdd/Makefile     | 1 -
> >  tools/flask/utils/Makefile      | 1 -
> >  tools/fuzz/cpu-policy/Makefile  | 2 +-
> >  tools/misc/Makefile             | 1 -
> >  tools/tests/cpu-policy/Makefile | 2 +-
> >  tools/tests/depriv/Makefile     | 2 +-
> >  tools/tests/resource/Makefile   | 1 -
> >  tools/tests/tsx/Makefile        | 1 -
> >  tools/tests/xenstore/Makefile   | 1 -
> >  tools/xcutils/Makefile          | 2 --
> >  tools/xenmon/Makefile           | 1 -
> >  tools/xenpaging/Makefile        | 1 -
> >  tools/xenpmd/Makefile           | 1 -
> >  tools/xentop/Makefile           | 2 +-
> >  tools/xentrace/Makefile         | 2 --
> >  tools/xl/Makefile               | 2 +-
> >  tools/debugger/gdbsx/Rules.mk   | 2 +-
> >  tools/firmware/Rules.mk         | 2 --
> >  tools/libfsimage/common.mk      | 2 +-
> >  tools/libs/libs.mk              | 2 +-
> >  tools/ocaml/common.make         | 2 +-
> >  tools/xenstore/Makefile.common  | 1 -
> >  24 files changed, 9 insertions(+), 27 deletions(-)
> 
> Normally these are sorted (as are the actual patch hunks), helping
> the quick spotting of individual files of interest. Was there
> anything unusual you did to prevent the (full) sorting?

Yes, I'm using "git config diff.orderfile" to try to put headers first
or regroup makefile changes before anything else, mostly for myself. I
didn't though it would have an impact in `git format-patch`, as it's
often doesn't matter.

-- 
Anthony PERARD

