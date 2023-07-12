Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05589750F96
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 19:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562727.879504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJdYm-0002v2-6i; Wed, 12 Jul 2023 17:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562727.879504; Wed, 12 Jul 2023 17:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJdYm-0002sL-3z; Wed, 12 Jul 2023 17:23:28 +0000
Received: by outflank-mailman (input) for mailman id 562727;
 Wed, 12 Jul 2023 17:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8Q3=C6=citrix.com=prvs=550b2c143=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qJdYk-0002sF-Rd
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 17:23:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdc54f90-20d8-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 19:23:24 +0200 (CEST)
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
X-Inumbo-ID: cdc54f90-20d8-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689182604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+RQZc0OWIh9IEnCUXPS7aXu/ofA/Ef3cLNXyHevqBq4=;
  b=b1evxeHdRBdIUbDuDd7316Gg0PUmXZ+sktz0T0a5AOMlaLA+SclApBOz
   iWymTBGgX2JRzbik8d8FGhu18e+BX6EMisYE8iKlNZWl5O6gqVs0C6Wx3
   SJDCEaoULKMLUeQGVLNRYs7GVBU5PYy4bBufb2veK2eVWWU6M1k7vuonX
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116427630
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:1T3tAqzwUg4nV+Fiwad6t+cixirEfRIJ4+MujC+fZmUNrF6WrkUAn
 zcWDTqEa/aLZ2L2edolPNjk8E0C757VytNlTlY5qSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPKoT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVxxx
 8EmBAs2V0uk3tuMyY+yU9lCv9t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMwBrC+
 TydpwwVBDkCE9ic9GuXykiWl8HXrSbLZaFRV6y3o6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0RN54A+A8rgaXxcL84QmDAXMfZiVcc9Fgv8gzLRQjz
 lKTlsnlLSBuuraSD3ma89+pQSiaYHZPazVYPGldEFVDuoO4yG0usv7RZutcIpOLoubOIGrXm
 gmwpRU3noU9tNFegs1X4mv7byKQSonhF1Blt1yLATP5vmuVd6b+OdX2tAGzAeJoad/AEwLf5
 CVsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iUsI2WBj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMggLVffoXkwORTAt4wIrKTLufhvU
 ap3jO72VSpKYUiZ5GfeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9cWGZimtsRtfveyC2Mq
 oY3Cid/40kHOAEISnWNoNF7wJFjBSRTOK0aXOQNLrTYfVc5RD5+YxITqJt4E7FYc21uvr+g1
 hmAtoVwkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:MgFRF6MkOw/am8BcTwL255DYdb4zR+YMi2TDj3oBMyC9Afboyv
 xG/c5riSMc7Qx7ZJhOo6HnBEDtewK+yXcx2/hrAV7AZniqhILLFvAa0WKK+VSJcUGQmI886U
 4jSdkHNDSaNykesS+O2njeLz9W+qjizEnHv5a9815dCSttbLxt6Bo8MAySFUp7SWB9dMIE/D
 f23Kd6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kPEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy2IiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8u1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh7LD3vXklUKvoLhiKqrzPI9
 MeSf00I8wmNW9yWkqp/VWHBubcGUjbUC32BHTq8fblrgS+1EoJs3fxQ6ck7y09HEZXcege2w
 2DCNUwqJheCsIZKblwC446MLSKI32ITByJK26cJ1PqfZt3Sk7lutr77vEv6O62Zppg9upDpL
 3RFF5X8XU1YE2GM7zx4LRbth/KW2mzRjLr14VX4IV4oKT1QP7xPTSEU01GqbrpnxwzOLysZx
 +IAuMeP9bzaW/1XYpZ1Qz3XJdfbXEYTc0Oo94+H1aDuNjCJIHmvvHSNK+7HsumLR80HmfkRn
 cTVjn6I8tNqkitR3/jmRDUH3fgYFb28558GLXTu+IT1I8OPItRtRV9syXz2uibbTlZ9qAmdk
 p3J73q1qu9uGmt5G7Nq35kPxJMZ3wll4kIk0k60TPiH3mEBIrr4e/vCly69EH3VCNCcw==
X-Talos-CUID: 9a23:WRHkjm7W5ryWC6JEJ9ssyXEmJ/4JSUbkl1CJGnWxNG9weJOsVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AGx4tcw+AFE+p0k3piKXUhkWQf99P56eTWVI1q68?=
 =?us-ascii?q?XldG0MBxNGHTenTviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,200,1684814400"; 
   d="scan'208";a="116427630"
Date: Wed, 12 Jul 2023 18:23:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH v2 5/6] libxl: use the cpuid feature names from
 cpufeatureset.h
Message-ID: <40a9a687-fae0-4c44-ba83-0c89cf4f8af0@perard>
References: <20230711092230.15408-1-roger.pau@citrix.com>
 <20230711092230.15408-6-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711092230.15408-6-roger.pau@citrix.com>

On Tue, Jul 11, 2023 at 11:22:29AM +0200, Roger Pau Monne wrote:
> The current implementation in libxl_cpuid_parse_config() requires
> keeping a list of cpuid feature bits that should be mostly in sync
> with the contents of cpufeatureset.h.
> 
> Avoid such duplication by using the automatically generated list of
> cpuid features in INIT_FEATURE_NAMES in order to map feature names to
> featureset bits, and then translate from featureset bits into cpuid
> leaf, subleaf, register tuple.
> 
> Note that the full contents of the previous cpuid translation table
> can't be removed.  That's because some feature names allowed by libxl
> are not described in the featuresets, or because naming has diverged
> and the previous nomenclature is preserved for compatibility reasons.
> 
> Should result in no functional change observed by callers, albeit some
> new cpuid features will be available as a result of the change.
> 
> While there constify cpuid_flags name field.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

