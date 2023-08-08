Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F75773931
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 10:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579468.907454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIW1-0004DX-M4; Tue, 08 Aug 2023 08:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579468.907454; Tue, 08 Aug 2023 08:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIW1-0004Ac-J9; Tue, 08 Aug 2023 08:56:33 +0000
Received: by outflank-mailman (input) for mailman id 579468;
 Tue, 08 Aug 2023 08:56:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lST=DZ=citrix.com=prvs=577b0fef7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qTIW0-0004AW-Ar
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 08:56:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76cd6391-35c9-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 10:56:30 +0200 (CEST)
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
X-Inumbo-ID: 76cd6391-35c9-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691484990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G8sksAySfdqgLV99gZYQwtewml6bcB/hzhA07cdtiU4=;
  b=KIjbINkxdIqvHx+OkNPtE7PGcf3+V9e1adf1aoTMIa8u7dL5A4qFJGVA
   YUcuz1ffn5dhaKYQ27PpqeBrtljvT5mPts8cdvi81KUej5CoDh4jYfEiB
   itulO4NjNaocKB09O77XWCFWm71euBXphrzNLkuIAw/SwOYIEbtTd9B7N
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118703922
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:HZPbHKrncK69rNGWTD8w3q6HI6BeBmInZRIvgKrLsJaIsI4StFCzt
 garIBmFP6neM2f8etwiaom3oUMP6MSBz4QwQVRpqy80FClD85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOzyZNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAsmPwGgm9uO+rS2S/FPif17LfG6O4xK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jufrzuhWUBAbrRzzxLG/0qQr9b+hxnGSaUtS5KCzO9W2wCckzl75Bo+CgLg/KjRZlSFc9BWL
 UAO6zcthac3/U2vCNL6WnWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcpQRQ62
 1nPmMnmbRRturCITXOW9p+PsCi/fyMSKAcqbDcJVwIf7/H/oYs4iVTESdMLLUKupoSrQ3eqm
 WnM9XVgwexJ1qbnyplX43j8qGO9hYTwdjQz6wTPfW2ctgJBNYmqMtnABUfg0d5MK4OQT1+kt
 XcCmtSD4O1mMaxhhBBhU81WQuj3uq/t3Cn0xAc2QsJ/r2jFF2uLJ9g43d1oGKt+3i/okxfNa
 VSbhw5e7YQ70JCCPf4uONLZ5yjHIMHd+TXZuhL8NIImjntZLlXvEMRSiam4gQjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8Gik0/8i+vCNCfFIVvgDLdpRrpghJ5oXS2Pq
 4oPXyd040o3vBLCjtn/rtdIcAFiwYkTDpHqsc1HHtNv0SI/cFzN/8T5mOt7E6Q8xvQ9qws91
 i3lMqOu4Aal1CKvxMTjQiwLVY4Dqr4l8CtqbXZyYwrws5XhCK72hJoim1IMVeFP3IReITRcF
 pHpp+3o7ixzdwn6
IronPort-HdrOrdr: A9a23:sEci+qHTGYGGqOYGpLqE0ceALOsnbusQ8zAXPidKOHlom62j5q
 KTdZEgvnXJYVkqNU3I5urwXpVoLUmxyXcN2+ks1NSZLWrbUQmTQ72KhLGKqwEIcBeOkdK1u5
 0QF5SWcOeQMbEAt6jHCQCDYq8d/OU=
X-Talos-CUID: 9a23:TXE0tmNThfTA5u5DYwI25W0II/gfdHDc1FTfGhe5MTduR+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AgTOYnA76nVhF4GJ1qdxhdTr7xowr7pySIXk8i68?=
 =?us-ascii?q?7qu67agNKASah12m4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,263,1684814400"; 
   d="scan'208";a="118703922"
Date: Tue, 8 Aug 2023 09:56:19 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v8 11/15] xenpm: Print HWP/CPPC parameters
Message-ID: <b8a4778b-896a-481d-9f17-66b1882ebd55@perard>
References: <20230807185119.98333-1-jandryuk@gmail.com>
 <20230807185119.98333-12-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230807185119.98333-12-jandryuk@gmail.com>

On Mon, Aug 07, 2023 at 02:51:15PM -0400, Jason Andryuk wrote:
> Print HWP-specific parameters.  Some are always present, but others
> depend on hardware support.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> v8:
> Switch from "if ( !hwp )" to "if ( hwp )" and re-org code.
> Use %PRIu32 instead of %u - this lengthens some strings past 80 chars

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

