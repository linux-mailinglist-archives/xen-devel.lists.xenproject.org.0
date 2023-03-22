Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A5A6C5277
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 18:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513559.794739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf2Hj-0007yh-15; Wed, 22 Mar 2023 17:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513559.794739; Wed, 22 Mar 2023 17:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf2Hi-0007vy-Tf; Wed, 22 Mar 2023 17:30:02 +0000
Received: by outflank-mailman (input) for mailman id 513559;
 Wed, 22 Mar 2023 17:30:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0iBq=7O=citrix.com=prvs=4381ba85d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pf2Hh-0007ik-Kl
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 17:30:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a07d95c-c8d7-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 18:29:59 +0100 (CET)
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
X-Inumbo-ID: 2a07d95c-c8d7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679506199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9stgDSNbdyF9OPIoHPj4y0s4j3RlPqPCvsuMNqtqPLE=;
  b=QtfzKtQNIQyDL+H14W6Y9hXBwWDd3/XYE6VGqn2U26Ae0Kh5umUE0z2K
   A0oP0+REhPI6SKFZpE5qw1T0PPTpNztObjxoqxIR9q6gdF/t4i10ouv7H
   9fh4uqMdg6cL1/pQNm0uf6VpCwACPSEzh+hwT0PRgqYF9Rz7BzyXIJitE
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 102316815
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:9XpFHqo1s++n3yBm2BKxnsJL5/BeBmIDZRIvgKrLsJaIsI4StFCzt
 garIBnXb/+PZGKmKotzPoi/8k0E6pDRy4AxTgdprn9hE34V8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABRKYy2d2Lnt/Ouce+RLg5UiD+bsAYxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 juepT+gXEFDabRzzxKZ6Xv1icXGuR/bBqAdLrOjqeBtoFG6kzl75Bo+CgLg/KjRZlSFc9BWL
 UAO6zcthac3/U2vCNL6WnWQonGeuQUHc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9BWYaaDUNVwct/9jpq4Z1hRXKJuuPC4bs0IezQ2uph
 WnX8m5n3e57YdM3O7uT2RfKvizz/cP1FykE6yLSD2OGwQREa9vwD2C30mQ3/cqsPa7AEAbQ5
 yZZy5HFhAwdJcrTzXLQGY3hCJnsvq/Ya2OE3DaDCrF7r1yQF2ifkZe8Cd2UDGNgKY46dDDge
 yc/UisBtcYIbBNGgUKaCr9d6vjGLoC6T7wJrtiOMrJzjmFZLWdrBh1Ga0+KxHzKm0Mxi6w5M
 przWZ/yUidGU/g2kWftF751PVoX+8zD7TmLGcCTI+qPiNJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3CvZmPy53CbWkCgGOqNZ7BQlTfRAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/8Pz7mVo
 yvgCx4wJZiWrSSvFDhmo0tLMNvHNauTZ1piVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:KTwgjqgPL93IY2myvugMBh5h0XBQXssji2hC6mlwRA09TyX4ra
 2TdZEgvnXJYVkqOE3I5urwWpVoLUmyyXcX2+Us1NWZLWrbUQKTRelfBODZogEIdReRygdV79
 YET5RD
X-IronPort-AV: E=Sophos;i="5.98,282,1673931600"; 
   d="scan'208";a="102316815"
Date: Wed, 22 Mar 2023 17:29:52 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 3/3] tools/xl: rework p9 config parsing
Message-ID: <ff1b3084-e960-4328-a801-13dca04bd2f7@perard>
References: <20230322073453.7853-1-jgross@suse.com>
 <20230322073453.7853-4-jgross@suse.com>
 <CAKf6xpuswTjP2ksn243VHXzv-b50Tq7W7pnoYeS+9ZKtbUPPoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKf6xpuswTjP2ksn243VHXzv-b50Tq7W7pnoYeS+9ZKtbUPPoQ@mail.gmail.com>

On Wed, Mar 22, 2023 at 08:32:48AM -0400, Jason Andryuk wrote:
> On Wed, Mar 22, 2023 at 3:35 AM Juergen Gross <jgross@suse.com> wrote:
> >
> > Rework the config parsing of a p9 device to use the
> > split_string_into_pair() function instead of open coding it.
> >
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

