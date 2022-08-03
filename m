Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D054F588A3A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 12:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379739.613462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBQF-0000EC-5S; Wed, 03 Aug 2022 10:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379739.613462; Wed, 03 Aug 2022 10:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJBQF-0000Bd-20; Wed, 03 Aug 2022 10:16:15 +0000
Received: by outflank-mailman (input) for mailman id 379739;
 Wed, 03 Aug 2022 10:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+C7S=YH=citrix.com=prvs=207fd374a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oJBQD-0000BX-Kp
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 10:16:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ac8f7c9-1315-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 12:16:11 +0200 (CEST)
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
X-Inumbo-ID: 4ac8f7c9-1315-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659521771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=auSZmVSZqQSFNeM+8xKTumIAfywUEZGqRb1DNottnuk=;
  b=PKJZe9VFYPtv/0AP77Plr+5wqzTPY/N4ATHWtWq2HTgM/G9CZ20EQyXo
   /O2vy6Q4H2w13vsenCAF11z+N2AKeZ/OX6SxERRMCrxVkHv+zKckTzPj7
   7WG2tZ3Xj7j5XOVwmtdkhNOlb+zpxDGK0hs5g4VKcB5OwZtRTnLAbce5X
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77260666
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Awxb3Bq05GRaQMgrHO/bDix16xZWOz3FdZch4C?=
 =?us-ascii?q?dl9DyJ0cfeTg2ku/ST6PRR+1leKQTQnb2+unZjdzyympCmA/QC4l6PdVM3r+?=
 =?us-ascii?q?rdfYeDmwFIi4XRw0zCbFUJ3UWnZMYFZSOAdAiEtvvxegxE9YjT75l0vp0zZN?=
 =?us-ascii?q?Z2nV00ktU5XsxTuEYGObTdMdz3vyieI0kz8mi8FEJwO/paeswykx4W7fG0p6?=
 =?us-ascii?q?S66iKwemWFTiEuHMmbkTsIpt+/wYw31d7Yr0sEWSv5OLU+IHRKbRF/3WPyQz?=
 =?us-ascii?q?HRBXUuqncgSj8ISyO9vYaEYZDKxAcIjblOhzXjhgPGIeFyjRRcBolaoVLT63?=
 =?us-ascii?q?B3zhxwVMd7PJ8hMOZf1QcB8FSw7oKGshcNFi44mAvCGMfv8Oc7xbQa3xre/S?=
 =?us-ascii?q?a5OMg8IHKVDTj0TtkfMUKEzfLoeofxzJbY2bEkEvmQiidUlQpIcExypzCzvR?=
 =?us-ascii?q?T6CejthcYQG+/MgAp8NN5xondD1mz1brOVamcoaH89Md8X9ahYQ12VUT3M3g?=
 =?us-ascii?q?9MLPbwrPVbci8Vbf0TFwWnubS4/04zjWIACIDp3kn8Yz68tmlEZba1hlv+vq?=
 =?us-ascii?q?97dYnh9OzgfYpmDqkofJjExZY0Pbz+gSNk7IwrORv3aJcEzTplscpAlbBwrT?=
 =?us-ascii?q?obqaigWn3GtmAuUulHaBEKoVL/+yRNM+qgPUhEbxAOoEbpcsn0g/9/tL4oEl?=
 =?us-ascii?q?EObDs0wijCZWve1RQTo5+T6tQKIV8iLaT9VK+UJPDgYXi6CX/w2X26CAInA1?=
 =?us-ascii?q?nAuN6NIDaeQNT1d0Xj8QcUGNWgIyXMWkRaVi5ZOqCr7jmqaALHZNroRCbRT/?=
 =?us-ascii?q?IO3OM+XlA1uY3MQaS/c6S/wGfXdwKqGXNH/3EvZGf0WPhaXERT1xerfAF+uM?=
 =?us-ascii?q?WOjKZnrrCoGbu677wmMcQvPGznsofzivWGPQWAa3DnI7FQhon4qScSVgKcDW?=
 =?us-ascii?q?EUJzVmXtmZ9V0L0RQ14qDW5g1Slx7VITVpbylsuaOSaZmaKOh46pg8Gf11cW?=
 =?us-ascii?q?Sr9qOcxk8lJ1u0y8rKrHZZql+FC/GEJ41FdFYhMo8MPHPD4/PyA9dCPUZL4c?=
 =?us-ascii?q?JEWRYIrMFXdWSRyMWpvgBYD0zgSUCsoTzd8ZmXnc0OOVSVT7UbXguHpi+tYa?=
 =?us-ascii?q?a2xeU31y+VU6re08SrH8XmkD2xFPqdHcj+K4sknOvvZ5/DpoEGBf2UwEDG5p?=
 =?us-ascii?q?0efgqWN7AjV/TsIUEQ01wm+u+CBNHFEbiiQRH7QTlmTwvysOYDNsG4NsCcjB?=
 =?us-ascii?q?oKMvqTpcbdC9Y/cLpqbHb1BwNflDa76hG1oBL8KKWkNIcbRvCsR5LaPGzH5q?=
 =?us-ascii?q?D/rJ7RjYbR4TtFmzwcfyk7zs08PYrB9P+4mWgtwZ3c591f/kNwnhvFInBgVn?=
 =?us-ascii?q?B5da/LSsEmgU1pWaMsYnqbBLzdZDBes9X5oJHTxaxY60ejWEzCmmAbpX3R0l?=
 =?us-ascii?q?5Y7d22iO2o5XutDIgPStBteesHuJEVWUCUo2GFs6ztF6R6MJGgS91T0/qYXR?=
 =?us-ascii?q?ssmoBkY88IcIUHBmHUoHHnl84N8r022plV0sVpNabwTZmoQh4HduWm9J9Yf0?=
 =?us-ascii?q?paXr5ES0vQsItDSrvQ6OkEwBcIvTuaJh2fgrFSI67xngQKCZ8fS9vj12VGcN?=
 =?us-ascii?q?LNYC0aB4xT4+b2xJ0PqVoZw3n/o1inIn+oxAQAdTul1536ZJHNXSSFXI8X4t?=
 =?us-ascii?q?9xHlmLiXg9+34tJlYs8sNTu3N5S3tgB1poygLCmNJECcr6T4rSnlxZ/h9gzU?=
 =?us-ascii?q?jXnCA4N9+8Q0WF09PM/l9QuYT11e+XWvzoEmi5wT/NdNY1KCLDJC94PGzk75?=
 =?us-ascii?q?W1smCWWX0mxb3Oz230c24MVVBffNkZ9PkMe6ODTAcr0+MHzWsFNOLBCBr4dQ?=
 =?us-ascii?q?pcndu6ICljGBmISWnvIjDEPlyrvLzlvJLvtt6TU2msMLYc5HttVFGVzudhW/?=
 =?us-ascii?q?t2P6zKsBeMb/nQ3oEz0azq0Ycwej9nOxkX44LE44viRiameoDIRLiwBgHSIU?=
 =?us-ascii?q?2GfsJsd1lHMq8wjLiAfZ5t3ovrlBLQgVHKYpueFoZBC7yZZXSBEBMn+zVycd?=
 =?us-ascii?q?07mBy7cvTtlykT+m5Z5N9LucD2OKS9Zp0ZgDE29uSrgOteHIh+4YVT88emV+?=
 =?us-ascii?q?LLVg7ul0OahVVaHY/EnuAk9+NsU7tMatO6nPFUYznSmpHa47Y9/lEqRdNOI/?=
 =?us-ascii?q?1HKal9NdkebVIJpY/VwTUrMoiNdmdsXiX7hKrzUWmJZ8D0h/4muTn4OLWGh/?=
 =?us-ascii?q?bBDsckyZSlMf6RNabtHCGwQZtHi6vTN7QO0CW98Icm4XHHnoE2MXv6oTKUSX?=
 =?us-ascii?q?e6pURsQ/Fh/hL/SOQEEXJgKjoVVw8Aw6+Vvt9P19ygrzODZG15wW4Xs+2Pak?=
 =?us-ascii?q?X2jp+3an2t+kscYbDUYkXYrQIyQOCv+vQrXRrBwM+sUmoKehjuCDUw8e0yYU?=
 =?us-ascii?q?pgYDiiqUiMcth/+HrlGtm0g6+fhl6kqKRR0VO3sT6qL4PbrpkFO2H9hTig0V?=
 =?us-ascii?q?XKOiN9YmU/LAqFo+qlYKj+xn0kvNIfpp7xAiha7CRpovKcQCfQJWxwtSRrNp?=
 =?us-ascii?q?qnkXFY6HoVIWCMiasYgkz/PMF0VXbD9EvC2XIaYidO2yVLcql5FXwgyhBPZJ?=
 =?us-ascii?q?iFNlVqzO8quZ4BJh/unO8Ohfn/4MO7l+FAH+Glk/YtFIIPPpYTIuUyN10bBg?=
 =?us-ascii?q?vUwXhe9VkoYEjDDer0R2IUTg0MSvFBl7ke9KoALHAnDZOuJF8yMw6AM9AeYR?=
 =?us-ascii?q?Toqxw+1pKSVgbdJiTgXiK0r6hr6uE1xWmM1mT5bOlsgtF6qGjyuD9FvJjyHD?=
 =?us-ascii?q?U2/Dyo/uoJWdy9ISyjjL/M5FAtcuKAsA5qYkDZ1oeMZPcYkvbv4X1J6BA=3D?=
 =?us-ascii?q?=3D?=
X-IronPort-AV: E=Sophos;i="5.93,213,1654574400"; 
   d="scan'208";a="77260666"
Date: Wed, 3 Aug 2022 11:15:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v3 06/25] tools/fuzz/x86_instruction_emulator: rework
 makefile
Message-ID: <YupK31OG8D7+Tqin@perard.uk.xensource.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-7-anthony.perard@citrix.com>
 <d917d9a6-5ab7-f826-21e0-2c95b4614f9c@suse.com>
 <YulaTPhEf8Mp+p0q@perard.uk.xensource.com>
 <9e8b366b-5ab1-599b-263b-d86f0f111d89@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9e8b366b-5ab1-599b-263b-d86f0f111d89@suse.com>

On Wed, Aug 03, 2022 at 07:56:34AM +0200, Jan Beulich wrote:
> On 02.08.2022 19:09, Anthony PERARD wrote:
> > On Mon, Jul 11, 2022 at 04:08:55PM +0200, Jan Beulich wrote:
> >> Can you confirm things to work when
> >> building locally in just this subdir, e.g. via
> >>
> >> make -sC .../tools/fuzz/x86_instruction_emulator CC=/build/afl/2.52b-base/afl-gcc
> >>
> >> ?
> > 
> > Yes, that still works. But I'm not sure why you would ask since the
> > tools/ build system works this way, execution of make in a subdir
> > doesn't depends on the execution from the parent dir (it doesn't
> > depends on anything in the envvar).
> 
> Oh, I wasn't even aware of this as a general feature in tools/. Is
> this going to survive your rework to use non-recursive makefiles?

Yes. Executing `make` in any subdir will still works. It should be even
better than the current situation, even in a fresh clone, we could
simply run `./configure && make -C subdir` and make will make everything
needed, that is probably the "include/" dir and the "libs/" if they are
needed by anything in that subdir.

At the moment, one can run ./configure then `make -C tools/include` and
`make -C tools/libs` and probably run make in most subdir without having
to wait for a long run of `make build-tools`.

Cheers,

-- 
Anthony PERARD

