Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D958477CE0D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 16:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583966.914329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVv02-000871-UZ; Tue, 15 Aug 2023 14:26:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583966.914329; Tue, 15 Aug 2023 14:26:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVv02-00084j-Rv; Tue, 15 Aug 2023 14:26:22 +0000
Received: by outflank-mailman (input) for mailman id 583966;
 Tue, 15 Aug 2023 14:26:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQSb=EA=citrix.com=prvs=584405d4c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qVv01-00084d-Fl
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 14:26:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b22f6a5d-3b77-11ee-8775-cb3800f73035;
 Tue, 15 Aug 2023 16:26:18 +0200 (CEST)
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
X-Inumbo-ID: b22f6a5d-3b77-11ee-8775-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692109578;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cpDbKbV3QYB/k+PY8GYGfqM/Ti0mS3BvGjqZDjNvud4=;
  b=OyD0ZcpqnPrxL0Hfa6ZTI0UyYZQ1k0bUJUhuv+yKy9OYIcVu7h6le8La
   jLy0YmzDneEs/auQqi0EyBRxEhoyJse9gm589gamRXXfSFQ+Eu0791ERl
   ZDC5EXEYzojODhEVp1dDCwub6S+R2toLWnuLZWw1rhLTY298UIvFFCVNg
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 122207508
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:IHLJmKgdLzjyrt7ECnRYl0vDX161XRAKZh0ujC45NGQN5FlHY01je
 htvDDjSa6yCNDOjL48iPt6w9EwG7cTVzYJiSlA4rCo2RHgb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT7AaDzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQCMW8gVyDcl96t++uBG+U8msU9Hu70adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27B/
 DicpzukWkFy2Nq38TSszDX0gOr2xD70eIZJLOWFrdFMqQjGroAUIEJPDgbqyRWjsWa8Ud9CL
 00f+gI1sLM/skesS7HVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQ5sOcmSDps0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaESENIHULfyMsUQoP6N6lq4Y25i8jVf46TvTz1IesX2itn
 XbT9nNWa6gvYdAjzbzk0Gn33CKQvaOQdF85thnWQFCC8VYsDGK6XLCA5V/e5PdGCY+WSFido
 XQJ8/SjAPAy4YKlz3LUHrhUdF29z7PcaWCH3wYzd3U03271k0NPa7y8992XyK1BFs8fMQHkb
 0bI0e+6zM8CZSD6BUObjm/YNijL8UQCPY64Phw3RoAUCnSUSONg1Hg3DXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlglDmLHsCjnk3+iOH2iJuppVAtagfmUwzExPnc/FW9H
 yh3ZqNmNCmzoMWhO3KKoOb/3HgBLGQhBICeliCkXrfrH+aSI0l4U6W56ep4K+RYc1F9yr+gE
 oeVBhUJlzISRBTvdW23V5yUQOq2Askg8yxqZn1E0JTB8yFLXLtDJZw3L/MfFYTLPsQ6pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:riXpBqzVe1m8G8R+t0+5KrPw1r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726RtN91YhsdcL+7V5VoLUmzyXcX2/h1AV7BZniEhILAFugLgbcKqweKJ8SUzJ8+6U
 4PSclD4N2bNykGsS75ijPIb+rJFrO8gd+VbeS19QYScelzAZsQiDuQkmygYzZLrA8tP+teKL
 OsovBpihCHYnotYsGyFhA+LpL+T42iruOeXfYebSRXkDWzsQ==
X-Talos-CUID: 9a23:r+/C32MLC9mJ8e5DQjA42XckRdAZaUaE9ibcc1O5F1ROV+jA
X-Talos-MUID: 9a23:MQSgXQkUzK9PsYYuVVLodnpaOu5WpPyoDXlUjJomv5K8bRErFBG02WE=
X-IronPort-AV: E=Sophos;i="6.01,174,1684814400"; 
   d="scan'208";a="122207508"
Date: Tue, 15 Aug 2023 15:26:02 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] libxl: slightly correct JSON generation of CPU policy
Message-ID: <ec211f2b-7952-4944-89b5-302d9775cb4c@perard>
References: <c3fee3c8-c808-e2ae-b885-d24e785989f6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c3fee3c8-c808-e2ae-b885-d24e785989f6@suse.com>

On Tue, Aug 15, 2023 at 02:35:55PM +0200, Jan Beulich wrote:
> The "cpuid_empty" label is also (in principle; maybe only for rubbish
> input) reachable in the "cpuid_only" case. Hence the label needs to live
> ahead of the check of the variable.
> 
> Fixes: 5b80cecb747b ("libxl: introduce MSR data in libxl_cpuid_policy")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

