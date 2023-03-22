Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE256C51F2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 18:10:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513551.794713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf1yq-00051f-2U; Wed, 22 Mar 2023 17:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513551.794713; Wed, 22 Mar 2023 17:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf1yp-0004yq-Va; Wed, 22 Mar 2023 17:10:31 +0000
Received: by outflank-mailman (input) for mailman id 513551;
 Wed, 22 Mar 2023 17:10:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0iBq=7O=citrix.com=prvs=4381ba85d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pf1yo-0004yk-K1
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 17:10:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dcff3ee-c8d4-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 18:10:24 +0100 (CET)
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
X-Inumbo-ID: 6dcff3ee-c8d4-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679505024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2OVDhuaSvnsxayDbqni5LmfVS+Xxsui+7Pnc1id8VsA=;
  b=ge6ECLBZ0HCqHsNQJparDt2jXQp0Fx3huT9puv86ajtIR2rZ6Y1LkVci
   kbVykrykWBbW3PNj8/I6KL+LoAnRKNlkWs3V3pmo1bhXt1J4quHoEjky6
   rMnm5KWYg5KjDZ9zYKpFj7UIZA5RxXVA2sVVrdiXNDfKjTRiOsf8AbZdi
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 101264108
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:izwCnaqsRwkgagtbhT5KWFucJIheBmIWZRIvgKrLsJaIsI4StFCzt
 garIBnSOPiMZjCmKdh0bIWz9k4DsJ/RydNhTVdurX88RXsb8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzSNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADktZRynh/Dq+42EEMQzguA6LcfQBapK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 juepj6nXkhCZLRzzxK43yyTn+rtnxreSd1MDpal891IuH2Mkzl75Bo+CgLg/KjRZlSFc9BQM
 UsP4QI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9/vgHTF1uaeZYW6c/LyT6zi1PEAowXQqPHFeC1Ffup+6/d9110iUJjp+LEKrptTVEj3Uw
 yLWlxcB3ZhMieoS1quAxHmS1lpAuaP1oh4JChT/Bzz6v1gnOd78PORE+nCAs68ecd/xok2p+
 SFdxpPAtL1m4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 Kz741k5CGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon4/ORTMjj2wyxh1+U3aB
 ap3jO72VSpKYUiZ5GPeqxghPU8DmXllmDK7qWHTxBW7y7uODEOopUM+GALWNIgRtfrcyC2Mq
 oY3Cid/40gGOAEISnKMqtB7wJFjBSVTOK0aXOQMLLfdf1c8RTBwYxITqJt4E7FYc21uvr+g1
 hmAtoVwkgSXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:WBAXs6i9TAtlLWZzDmAdQ/cQDXBQXmEji2hC6mlwRA09TyVXra
 GTdZMgpHnJYVcqKRYdcLW7UpVoLkmwyXcY2+Us1PKZLWrbUIXBFvAf0WKg+UycJ8XGntQtqp
 uICpIOduEYb2IbsS+K2njdLz96+qj/zEnAv463pEuFDzsaCZ2IiT0XNu/xKDwSeOApP/QE/b
 Onl7t6jgvlV3QLT9ixQkIIV/LEoLTw5ejbSC9DKR47yRWEyQil4r7iExSew34lIkhy6IZn32
 jZshDzop6uufGjyhPayiv64plMlMH6o+EzdPCku4w6KijMlg3tXohnVrGY1QpF2N2S1A==
X-IronPort-AV: E=Sophos;i="5.98,282,1673931600"; 
   d="scan'208";a="101264108"
Date: Wed, 22 Mar 2023 17:10:11 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools: use libxenlight for writing xenstore-stubdom
 console nodes
Message-ID: <9782f62d-5132-40b9-b59b-a85df72f0dd7@perard>
References: <20230322072939.7413-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230322072939.7413-1-jgross@suse.com>

On Wed, Mar 22, 2023 at 08:29:39AM +0100, Juergen Gross wrote:
> Instead of duplicating libxl__device_console_add() work in
> init-xenstore-domain.c, just use libxenlight.
> 
> This requires to add a small wrapper function to libxenlight, as
> libxl__device_console_add() is an internal function.
> 
> This at once removes a theoretical race between starting xenconsoled
> and xenstore-stubdom, as the old code wasn't using a single
> transaction for writing all the entries, leading to the possibility
> that xenconsoled would see only some of the entries being written.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

