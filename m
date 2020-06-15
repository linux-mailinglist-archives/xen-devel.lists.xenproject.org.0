Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C771F9ACD
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:49:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkqPw-0003BH-GM; Mon, 15 Jun 2020 14:48:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkqPv-0003BC-5k
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:48:55 +0000
X-Inumbo-ID: 553512ce-af17-11ea-b803-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 553512ce-af17-11ea-b803-12813bfff9fa;
 Mon, 15 Jun 2020 14:48:54 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: nv3msrCV/3R+lRdCS9IwrDpR1FfYf6iFAp+/8txCAc3V4Uc9H7cWJ+cE69CP0pqrFFyDQDW3QU
 J6rHz38DSTPCKPkg+4Lt6F1+LUfTzeIbL4/UpgjsUJugzqSWkymvVV8yALgCwNJ2qsYZe7Fxg7
 GhvCsbpMpzw/r1xg+qUZsj+2UsyTD9i5uknjqPh03gMyJ8CfeN0wibg6bHwNXArrLoP7Sd3Chu
 Z4Hvhziqev/AT7vtdwBpyLspjdP0xCGkJlg+KQufptDA9AZczqlRHtrU7wnKt9Z8pucbXz4Sek
 Eds=
X-SBRS: 2.7
X-MesageID: 20082872
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20082872"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.35408.178162.309295@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 15:48:48 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.13] tools/libxl: Fix memory leak in libxl_cpuid_set()
In-Reply-To: <20200612173227.4103-1-andrew.cooper3@citrix.com>
References: <20200612173227.4103-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH for-4.13] tools/libxl: Fix memory leak in libxl_cpuid_set()"):
> xc_cpuid_set() returns allocated memory via cpuid_res, which libxl needs to
> free() seeing as it discards the results.
> 
> This is logically a backport of c/s b91825f628 "tools/libxc: Drop
> config_transformed parameter from xc_cpuid_set()" but rewritten as one caller
> of xc_cpuid_set() does use returned values.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <Ian.Jackson@citrix.com>
> 
> Applicable for 4.13 and older.

Thanks.  I have committed this to 4.13 and 4.12.
4.12 is no longer supported for bugfixes like this one.

> I'm not going to touch the Ocaml bindings - they're wrong in multiple ways
> including this memory leak, and we deleted them in 4.14 because they were
> totally unused.

That makes sense to me.

Ian.

