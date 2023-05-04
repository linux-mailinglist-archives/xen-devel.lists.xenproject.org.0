Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B806C6F6CE1
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:24:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529753.824503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYwO-0000wg-D7; Thu, 04 May 2023 13:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529753.824503; Thu, 04 May 2023 13:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYwO-0000sF-A8; Thu, 04 May 2023 13:24:12 +0000
Received: by outflank-mailman (input) for mailman id 529753;
 Thu, 04 May 2023 13:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XYMk=AZ=citrix.com=prvs=481980579=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1puYwM-0000qi-Ju
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:24:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f20e8753-ea7e-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 15:24:08 +0200 (CEST)
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
X-Inumbo-ID: f20e8753-ea7e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683206648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJ+UqEziv1wa7BwSqkCSSHwlAp/FpZLFP6MYajFVB/U=;
  b=AMlxQBXlGmCqAI2N1U+aukLbyufSWTVSqGYpfe3zbd0JJe9HwnItIUqZ
   qzhbSAwGXoH80vzKwjTrfngmWJzSStTduzxPQ9LgHOZh8x4o0mbr+RBuS
   S4mbCbfESrrtqWq4PCyGz8gvuLrpRsXdvFdE/VvuoCyvfV4HsHOUPQHfH
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110304925
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:AhfKpqK6077jzOtTFE+Rp5UlxSXFcZb7ZxGr2PjKsXjdYENS0WAHm
 2UYXzuGbveCYDCgKNB/Oo+z9kpQvpOGy98xQAJlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wRiPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5QW21zp
 aQdOAs9USCDvPCVkPGiSsVz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJ0OxhrJ/
 D+uE2LRIz1DbcC08CK+o3epj9eImA/GALA4G+jtnhJtqALKnTFCYPEMbnOyufSjg1Syc85eI
 UcTvCEpqMAa60iDXtT7GRqirxasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9CjUOWH9cSBs+0+bToLohrUKMV9ZPD/vg5jHqIg0c0
 wxmvQBn2eVI1ZdRh/rklbzUq2ny/8aUF2bZ8i2SBzv4tV0hOeZJcqTysTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/LF7rVxBA1b5IehtDMhWfS+FyPosdz7ze
 1P0sghM/pJVN3bCRfYpM9noV5xzlfC/RImNuhXoUzazSsIpKF/vEN9GPCZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8Qdas9w1iOdxrghnnDO7eHwO50j/uVZoTCLPGOht3ZrnRrxR0Z5oVy2Pr
 44Fb5XQkEo3vS+XSnC/zLP/5GsidRATba0aYeQNHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:bwKk9qNLCF2gIcBcTu+jsMiBIKoaSvp037BL7S9MoHluGfBw+P
 re+8jzuSWUtN9pYgBEpTniAse9qA3nhPpICNIqTNSftWDd0QPDQe1fBO3Zslvd8kbFltK1u5
 0QCJSWIeeAb2RSvILX5xS5DsZl4PTvytHTuQ4G9QYVcei9UdAZ0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3A4lplDmjVifv3C8rTFuI+T2+qFjJuVSfR8SeIJl+?=
 =?us-ascii?q?DOVlZSIaHag/T4aNIjJ87?=
X-Talos-MUID: 9a23:9INY5Qmj0qYYlB0P91OUdnpDGJ4x/4+XEHtclJAPg46BGREoCR2S2WE=
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="110304925"
Date: Thu, 4 May 2023 14:23:59 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@cloud.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@cloud.com>
Subject: Re: [PATCH 2/2] xenalyze: Basic TRC_HVM_EMUL handling
Message-ID: <a3fc0719-7972-448b-afa7-175822eadac1@perard>
References: <20230327161326.48851-1-george.dunlap@cloud.com>
 <20230327161326.48851-2-george.dunlap@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230327161326.48851-2-george.dunlap@cloud.com>

On Mon, Mar 27, 2023 at 05:13:26PM +0100, George Dunlap wrote:
> For now, mainly just do volume analysis and get rid of the warnings.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

