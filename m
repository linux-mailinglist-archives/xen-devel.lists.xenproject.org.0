Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4208E5E7C6A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 15:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410779.653931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1objAY-00075S-2R; Fri, 23 Sep 2022 13:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410779.653931; Fri, 23 Sep 2022 13:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1objAX-00071z-Vw; Fri, 23 Sep 2022 13:56:41 +0000
Received: by outflank-mailman (input) for mailman id 410779;
 Fri, 23 Sep 2022 13:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONtI=Z2=citrix.com=prvs=25885536a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1objAW-00071t-B9
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 13:56:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89dcbcc4-3b47-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 15:56:38 +0200 (CEST)
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
X-Inumbo-ID: 89dcbcc4-3b47-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663941398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dkzt/96Dvt7NoHWsx4TQSh2RpTZK8WHZ5IawgFJDZFk=;
  b=b/WJ7zNjmbXjP24NKTK1E1idM0S2A5YkPWYzf3p/8PfGCWpFBTnYb6Qg
   SU91M0QEBzHdz+MmUgQOxOtvUaXTa6XGHN+Zj+qMdDyYHVq9l2xequlHA
   ZjJSXiSX2IntcSANnHx90GyNM24vfv4x0Ust2dqZJrQ6puWXDis2pxnhD
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81223703
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A8KOx7K5KiIMDKvAA3qJQgQxR2vbMJQDmSyYv2?=
 =?us-ascii?q?9bI7kJr3hzvcnyo9D/mcekdWBpeNJDhPy5nfkyN4CH03zbIScnTgcgFr2mXj?=
 =?us-ascii?q?YNR34oRyMGovQ3zzpCkE4M3NKU6iubEXqXl6WyUbWMFX1baI4wvZ3+S/ub5n?=
 =?us-ascii?q?98x+0Lafm8/6RU6zp/A1hntKSXYcerdyAcpTd9gunxOPcF+ugIuiA/38FGri?=
 =?us-ascii?q?uE9dUcNnTB7FEL/0hFxmAQ+Ao4elIf39/jCkfio76MZTReCBisJZVtA9o3G6?=
 =?us-ascii?q?0Ks1uIbSW1xAQHueHxggzOTDo+it1ljv/z49qCrKz4jEdQ6PNucDZKNMeGsb?=
 =?us-ascii?q?U2fRe9QvrsMzUVQY2nPriEw+hMVw20QI2jl3AD3AnX29yp8ORbedvHY3Yit/?=
 =?us-ascii?q?5y6c/j6HiZyOEgKMrop/hZXlxROwgKjOpGO6cfqathKwT9Vvl1Zl8sQ1ffmU?=
 =?us-ascii?q?qSHyaiNwFdHKCU42VaPhSiNRf+agO5Npe1RXhNzeajvDtfJ8T5nDRRNpIX8n?=
 =?us-ascii?q?dm5QNyzohJFNeaTJAbJFTBr5G6LCP6MAjG95H3v7YDtNVYCBtQes5y8kLx6S?=
 =?us-ascii?q?Vzl9+1SN5QlwwZZq4m+JCUP0eyvTNZ8m1ldjDWiLfXl1gvKri3A1kg4TSS/E?=
 =?us-ascii?q?qrJyab2QRlDMrOpPd3/z2w7IN0nLJ2Z0rMNp+kBlFGPWnmVxQSIRP2m083DQ?=
 =?us-ascii?q?YWIA78aIhRvdpA/wVAUrTTN6mFYsIGQH8eju8h3cmyCfJOO/chQbA2MG+cya?=
 =?us-ascii?q?hGkKbHzH++L+JdJ6yC0aEO0TkpyQC/63GTVHFSFkkKESRLdhg45ymorpAu8w?=
 =?us-ascii?q?OiYgYgHdWkWR4qe/UEAJ1gvcgGZ6FwvVSuYBMumTwcWN90IzR+ufXgVkcXbs?=
 =?us-ascii?q?sVjADP3ihWgIeD8rziW9KTeEYNaV9jeoUWHgPAqHOSeFq9PUAmrgLEn/+0Mh?=
 =?us-ascii?q?4kzdna32zUCFAGHQEfig7PngTAS7+CCYDP1F5v/6tTID+/ruiKuPyTNxuMX8?=
 =?us-ascii?q?u7LG8UwVMl4QDyMlx0Ws2UjV2kSyHOmDj/6tjGUTSh35Lj/cyrL7Xx0++OPF?=
 =?us-ascii?q?0hB1Rn4mEoc9ApkfBHhdoS0x2LkFCmyzXYF/5+kdYXwHJQSC3XfAMK04B3f2?=
 =?us-ascii?q?tD71rMGMqtc4HYOg9jjlCbU2cz2akg7JjCuMRU3miKAzfWMmyU8p+xMPIpKv?=
 =?us-ascii?q?ZlUHX/aYN76RRU4Um+FFkBVzTppt1rpEeIGQmQE0oMehqyNq5cmFIb01WNzg?=
 =?us-ascii?q?+tJ2hTGmoCnhOH4SCO3YiAFiQpxglSqEe5MImZgVXReDlxLyqfLTf9lOrxWd?=
 =?us-ascii?q?xNI+8nVLTJnFdufUKCv9UE04DI9B42TXLaWqG64XFKooaBuBR/XDC5jihbjs?=
 =?us-ascii?q?h3CLk5DyXBc5T3tedPjZLfKUxvlBhDb5lXBN+EE33NIVcTQ25MKSqjC2GObt?=
 =?us-ascii?q?Tsxcz0oiGJui+bToWE9WDncPgzUfhMR94VyjWjSyRKAHM3SGM3rswrCC+1G9?=
 =?us-ascii?q?9yn6RljhZJ8rvIRJNeg71faJlW5sZ1EY7Mn0YjGGh6J02VJWq6E22muydfWq?=
 =?us-ascii?q?pnOXK6ZutUUvoAeKClTrqzFxR6CUYEUNNXVRFNMoSSCoLMxCo7YRH4wQeo41?=
 =?us-ascii?q?H3DiPg/EpsSC32vof0iHI8rYXj44uyb9CLn5L79skoKGh5mOGUToNBge4228?=
 =?us-ascii?q?G9B5rKmgiM5XgETPNDPjriZGqtLI7AkXILBSQOzIREDNrLas6to2Pkoz+rEE?=
 =?us-ascii?q?ntl6KszrF4F3T0bhJQdmbQNCrr6fYf4i82JfN2ozsBNU2fi9neim8S5Y2G56?=
 =?us-ascii?q?UjAAz2WXh9uVqJHP8xXOXWpwmuyB0iTXiHBWPM6H1s/JnB1DkKecLOr1RiDM?=
 =?us-ascii?q?lexIFr/N0eJUCrH4k4UDGFb2Fq0tYWnHT2VHYoeRqQGKWE4qT/0kqMEaULaK?=
 =?us-ascii?q?aD79mYOPqeIZNppbBcee/gXSTh7Hr/dvfuTBTDp6iodUncFnLRcRV0lCl/Mt?=
 =?us-ascii?q?ZWCjyh7PfWeba6PyzymS3Utpyf4x1lyxFL19VPPPLs8bPhsbX9ENoXgjLcHY?=
 =?us-ascii?q?cTyIcnf48cUYvsDZ7V4RjkMTYn2/UXYLn7bEhK9vWoZHYyEeyPGLohTc5uiA?=
 =?us-ascii?q?EnokoHdDO5iU6DKzOxzbBgxxTGS7hklTULhIhNKeyROhHGabMS3DPgvIIcNi?=
 =?us-ascii?q?PEu1sUri0EL23ZBYQ+Vzr3BT9vAPs3oVeaqherOqV5Im0JS2TYpUgZEwJekP?=
 =?us-ascii?q?qDa4PKZwssgabNz6muXod1qgUEqoloo6GT4xk5dMag4XkyT+DoBtp8NMqCtd?=
 =?us-ascii?q?sgXbwH8uQTkLTlBzG1aMCDurlqtuph7+OYi28X9UFWd1bGhNqW932ddgzJMZ?=
 =?us-ascii?q?FlEYh7sGDoTM6AKjNj3/gE4WU9qol73quB4flNoP4nophMZsF3GRFzoANh5e?=
 =?us-ascii?q?9nYhloHGMyyl/CMGL0DwMPKmCNPpEus0eBPjoYMl0Z+a/aANXqbOhV4bjON6?=
 =?us-ascii?q?AZ5vFWkjDtoIsLcTGgBbvbYQoRX16UeH01TqKK93Tr0LEKIE81xdooKAkmvC?=
 =?us-ascii?q?h6HH7zaookBoOw4OMxJJHY4+cI/Sjo+OSCMJX02/g2I8fyOUaajaK3iz1gFR?=
 =?us-ascii?q?RoglfrhYPBwMYKHJCtcXZqgbt/XrUkVExf3AxyElmMFMe+3SR5XaLG/dtwCA?=
 =?us-ascii?q?Sfjig9HpRQOuF50twQS6UvA2sK6Pjtlk54bYkqtSOF+Gg52n/U+5b0QK0rJh?=
 =?us-ascii?q?2hHgFAAHSFpvKQLtapIY52WM3IIcJB0pxAPDUEngHNXxHY2fSoIcJIsTOhNk?=
 =?us-ascii?q?1Gw7MIBYXko5hSsJZjxvAaOW2tZGSVI6UxHhBUFJvsYTxWrUcYPhTe/jUFiZ?=
 =?us-ascii?q?LvRVMWLu3888I+n0roRYjLrWG8bN0hA?=
X-IronPort-AV: E=Sophos;i="5.93,339,1654574400"; 
   d="scan'208";a="81223703"
Date: Fri, 23 Sep 2022 14:56:31 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 4/9] automation: Add Arm containers to containerize script
Message-ID: <Yy27D62mvY3nQENI@perard.uk.xensource.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
 <20220922134058.1410-5-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220922134058.1410-5-michal.orzel@amd.com>

On Thu, Sep 22, 2022 at 03:40:53PM +0200, Michal Orzel wrote:
> Script automation/scripts/containerize makes it easy to build Xen within
> predefined containers from gitlab container registry. However, it is
> currently not possible to use it with Arm containers because they are not
> listed in the script. Populate the necessary entries.

FYI, those entry are just helper/shortcut/aliases, you can use any
arbitrary container with the script, it just more annoying.

Your patch here allows to write:
    CONTAINER=unstable-arm64v8 automation/scripts/containerize
but you could write the following instead, for the same result:
    CONTAINER=registry.gitlab.com/xen-project/xen/debian:unstable-arm64v8 automation/scripts/containerize

I wonder if the script could select the right container base on the
architecture of the host, because "alpine" and "alpine-arm64v8" will not
both work on the same machine. It might be nice to just choose "alpine"
and the script would select the x86 or arm container automagically. Just
an idea, no need to do anything about it.

(patch is fine otherwise, just the patch description is a bit
misleading)

Cheers,

-- 
Anthony PERARD

