Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B47C750F1D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 18:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562706.879465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJdAE-0006FA-Fd; Wed, 12 Jul 2023 16:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562706.879465; Wed, 12 Jul 2023 16:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJdAE-0006Cx-CQ; Wed, 12 Jul 2023 16:58:06 +0000
Received: by outflank-mailman (input) for mailman id 562706;
 Wed, 12 Jul 2023 16:58:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8Q3=C6=citrix.com=prvs=550b2c143=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qJdAC-0006Cr-Ee
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 16:58:04 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42009120-20d5-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 18:58:01 +0200 (CEST)
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
X-Inumbo-ID: 42009120-20d5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689181081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z/YEa944EpbIWQAR6Y1H9k5PiGhMvb5I+/cKEtZxC5I=;
  b=Oh8y+cqN0fKDIxe/uIP4KAOXY4gzhuWGSsWycwlDAAgsdgRYLbMksS7j
   ovKjxdaPPBla4IV9N72EzPop75Jx+9PoryI+0G3gUGFul72Z1lkJqCZAk
   Tri9g+nskJmeSitfZeXSJvi8vXscqKBbqCuOdhhcxwjFQrjNar9vMoOj9
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118579462
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ilyFO6znVf1TcC+4R7Z6t+cixirEfRIJ4+MujC+fZmUNrF6WrkUFn
 WYcDWmEPPaPZzaje40lYIqwp0oG7MDXn4NkTQc4ryAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPKoT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTtBx
 foXMg8NUh2kq/npkLvhavhopst2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMzhvH9
 z6YpQwVBDkabd/PyAGd4EuRl8DSmSykao4CS62no6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0RN54A+A8rgaXxcL84QmDAXMfZiVcc9Fgv8gzLRQjz
 lKTlsnlLSBuuraSD3ma89+pQSiaYHZPazVYPGldEFVDuoO4yG0usv7RZoxsIKi6lOL1JTzX7
 yvV/CFkp6QXrcFegs1X4mv7byKQSonhF1Blt1yLATP5vmuVd6b+OdX2tAGzAeJoad/AEwLf5
 CVsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iUsI2WBj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMggLVffoXkwORTAt4wIrKTLufhvU
 ap3jO72VSpKYUiZ5GfeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9cWGZimtsRtfveyC2Mq
 oY3Cid/40kHOAEISnWNoNF7wJFjBSRTOK0aXOQNLrTYfVc5RD5+YxITqJt4E7FYc21uvr+g1
 hmAtoVwkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:8WPYT6hV66NFJUg5u4Zx+zAh63BQX/p23DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwRZVpQRvnhPtICPoqTMuftWjdySCVxeRZg7cKrAeQYhEWmtQttp
 uINpIOcuEYbmIKx/oSgjPIa+rIqePvmMvD5IfjJjVWPHpXgspbnmNE43OgYytLrX59dP0E/f
 Snl6h6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kDEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyyIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8u1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh7LD3vXklUKvoLhiKqrzPI9
 MeSf00I8wmNW9yWkqp/VWHBubcGUjbUC32BHTq8fblrAS+1EoJsXfwgvZv0UsoxdYFUJ9D6P
 3DMqN00J9zbuJ+V9MlOM4xBfKtDGrDWBTNN3/XB2/GOuUoB1LhwqSHuIkd9aWkfocFw4A1n4
 mEWFREtXQqc0arEsGW2oZXmyq9NllVcA6dvv223aIJzYHUVf7uK2mOWVoum8yvr7EWBdDaQe
 +6PNZTD+X4JWXjFI5V10mmMqMiYUU2QYkQoJI2SliOqsXEJsnjsfHaau/aIP7oHSw/Um3yD3
 MfVHz4JdlG7EqsRnjk6SKhEk/Fawj659Z9AaLa9+8cxMwEMZBNqBEcjRCj6sSCOVR5w9kLlY
 tFUcHae4+A1BqLFDzznhRU0zJmfzZo3Ik=
X-Talos-CUID: =?us-ascii?q?9a23=3Alzy/nmkDS4e5I4/QBtdNoYyURnzXOSfS/HHfOXC?=
 =?us-ascii?q?4NWtOZKbKGVbK2LJgs8U7zg=3D=3D?=
X-Talos-MUID: 9a23:iEcS9gW6KLlJKk3q/D+1h2FjD9962pm/J10Jnso0t9nbJTMlbg==
X-IronPort-AV: E=Sophos;i="6.01,200,1684814400"; 
   d="scan'208";a="118579462"
Date: Wed, 12 Jul 2023 17:57:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2 4/6] libxl: split logic to parse user provided CPUID
 features
Message-ID: <478e0509-033a-4442-af93-7085ee1effaf@perard>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-5-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711092230.15408-5-roger.pau@citrix.com>

On Tue, Jul 11, 2023 at 11:22:28AM +0200, Roger Pau Monne wrote:
> Move the CPUID value parsers out of libxl_cpuid_parse_config() into a
> newly created cpuid_add() local helper.  This is in preparation for
> also adding MSR feature parsing support.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

