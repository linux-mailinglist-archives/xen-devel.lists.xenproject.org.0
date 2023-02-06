Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEF568C2A3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 17:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490595.759373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP45s-0003l8-Pl; Mon, 06 Feb 2023 16:11:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490595.759373; Mon, 06 Feb 2023 16:11:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP45s-0003ii-Mv; Mon, 06 Feb 2023 16:11:48 +0000
Received: by outflank-mailman (input) for mailman id 490595;
 Mon, 06 Feb 2023 16:11:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=teK6=6C=citrix.com=prvs=39493946a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pP45q-0003iW-Kf
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 16:11:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f19e89e4-a638-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 17:11:44 +0100 (CET)
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
X-Inumbo-ID: f19e89e4-a638-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675699903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3+4sUGuF9CppcWeyGFZngKG/6LArzgH+qRUpuX7/cNk=;
  b=e0MZ9II+rzctqinTzRdhG8ze/EIEEiSAFzD7Pu6xmbYzSaPC+vGEmtAN
   hjU1P3wJnKb8B4YpO+aYr1IPbC5s+OyvtZDUnuOQ5wyLYPrursl/Jlxs2
   Et3qWp+ebAHu+jsusIyxO2Am2QnLqRw4484EHjN4gy/Ku8zO32TIvqO7X
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98289369
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:VoS456osVIYabB6OnaFjbxJbE81eBmIpZRIvgKrLsJaIsI4StFCzt
 garIBmOParcajbxKoxyatzk9BgGuJPVydcxSlc//ig9Fy0a95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzydNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACAdUSCjl8np/K62UuVMmZ0NfOXBGZxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jOWpTSoWU9LXDCZ4Wqb/3SLhPXBoWD2AZ84G+a6sf1Yu2TGkwT/DzVJDADm8JFVkHWWWdhSN
 kgV8SoGtrUp+QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOq8seVTEsk
 FiTkLvBBzN1t6aOYWmA7brSpjS3UQAcNWIYbDUIZRcE6dLk5oo0i3ryos1LSfDvyIevQHepn
 m7M9XJl71kOsSIV/7WrwmDnkxnzmoTEVgIV+Vz5Dk6PyxwsMeZJeLeUwVTc6P9BKqOQQV+Ao
 GUIlqCi0QweMX2evHfTGbtQRdlF897AaWSB2gA3Q/HN4hz3oxaekZZsDCaSzauDGuINYnfXb
 UDaomu9D7cDbSLxPcebj29cYvnGLJQM9/y/DZg4jfIUOPCdkTNrGwkwDXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmj6NH8mqkE36j+v2iJuppVAtaQvmUwzExPnc/FW9H
 yh3Z6NmNCmzoMWhO3KKoOb/3HgBLGQhBICeliCkXrfrH+aSI0l4U6W56ep4K+RYc1F9yr+gE
 oeVBhUJlzISRBTvdW23V5yUQO62AMsm9CpkVcHuVH7xs0UejU+UxP93X/MKkXMPpISPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:oM2aoKOWsZ7yzcBcT4z255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE+gr5nUtQ7uxpOMG7MA/hHP9OkPAs1NKZMDUO11HYXL2KgbGSuQEIeBeOudK1t5
 0QAJSWYeeYZTcV/KWKgnjBYq0dLcG8kJxA7d2ujkuFJjsaFJ2Imj0JezpzZXcGOjWua6BJaa
 Z00vA35waISDA6f86/DnkAU/PjocfXmJ/dYRAADwM68wWVyRel8qTzHRSgxREVXylUzbpKyx
 mhryXJoomzufSyyhvRzE/W9o9Xn8bIwMZCAsvksLlyFhzcziq4boFoW7mPpxAwufqu70sOmM
 TBpB0xVv4DjE/5TyWYsBHp0wnl3C0W8Hny2XqRnHflq9yRfkNfNyMNv/MeTvMXg3BQ8O1U4e
 Zu5Sa0ppBXBRTPkGDU4MXJbQhjkg6OrX8rgYco/jdiud91Ut5shL1a2HkQPIYLHSr85oxiOv
 JpFtvg6PFfdk7fR2zFv0F0qebcAUgbL1OjeAwvq8aV2z9ZkDRS1E0D3vESmX8G6dYUV4RE3e
 LZKa5l/Ys+EvP+VZgNWtvpfPHHUFAlACi8a156GG6XTJ3v7ki99qIe490OlamXkdIzvdVCya
 goljtjxC0PkgnVeLizNaZwg1nwqL/UZ0Wp9ihv3ek6hlS1fsueDcSiciFrryLymYRZPiUsM8
 zDda6/9JfYXCHT8MByrlTDsrFpWA8jbPE=
X-IronPort-AV: E=Sophos;i="5.97,276,1669093200"; 
   d="scan'208";a="98289369"
Date: Mon, 6 Feb 2023 16:11:19 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] libxl/x86: use public interface TSC mode definitions
Message-ID: <Y+Emp96NtOw0yZ0U@perard.uk.xensource.com>
References: <0d80ade5-dcf2-b0b3-ba4c-010962a6febc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0d80ade5-dcf2-b0b3-ba4c-010962a6febc@suse.com>

On Mon, Feb 06, 2023 at 01:33:03PM +0100, Jan Beulich wrote:
> Now that they're properly represented in the public interface, stop
> using literal numbers.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

