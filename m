Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2AC681859
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 19:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487128.754630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYZw-0008O3-JM; Mon, 30 Jan 2023 18:08:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487128.754630; Mon, 30 Jan 2023 18:08:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMYZw-0008M2-GP; Mon, 30 Jan 2023 18:08:28 +0000
Received: by outflank-mailman (input) for mailman id 487128;
 Mon, 30 Jan 2023 18:08:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpD8=53=citrix.com=prvs=3879b2cf9=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pMYZv-0008Lc-EH
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 18:08:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16bff37a-a0c9-11ed-93eb-7b0ecb3c1525;
 Mon, 30 Jan 2023 19:08:26 +0100 (CET)
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
X-Inumbo-ID: 16bff37a-a0c9-11ed-93eb-7b0ecb3c1525
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675102106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hY8ZpsY3akN3Q7iBsmMh+rNm83298kWao+j2lsTm8yo=;
  b=JWOLbV0JKuRQMyUhZQIGxaOk2RZ4WRYu/a5BziF9Oit6ni48j5V0YXGh
   bOQE48jcYJn0VVXghEiwAsSjHo5PBM8xtNegEWmUKs9QbaOyo7pIvTqGS
   j8xbgbWfdk5lTrBym8aPamOmg/ewV2ONFnberzV7yor3ewPK5/nywIMFM
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97314179
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:R68ImKjk6n6H4DZyh4bZyNRaX161RxAKZh0ujC45NGQN5FlHY01je
 htvWmGPbPncYGehfoskYY6w9E0BsZ6HzYdnQFNt+yk1QiMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5QSGzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQfCi4vZDfSptuN2bGSceM22u8jFcDSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27J+
 Tmfoz2mU3n2MvSgzxul3lKCg9Tm3huiXtoZK+ye5PpT1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4DOkS+AyLjK3O7G6xBGceSSVaQMc7r8JwTjsvv
 neAh97zDCZjmKGUQ3masLyTqFuP1TM9dDFYI3VeFE1cvoel+dto5v7Scjp9OKmXkP//PmDR+
 guTrwEFje9Pps4y3pzuqDgrnAmQjpTOSwc04CDeUWSk8h51aeaZWmC41bTIxa0eddjEFzFtq
 FBBwpHDt75WUflhgQTXGI0w8KeVC+Fp2dE2qXpmBNEf+juk4BZPlqgAsWgldC+F3ivpEAIFg
 XM/WysLv/e/31PwN8ebhr5d7Ox3pZUM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLpv0VClDWfg/nWXeqwIhPVgDn3BW+I8ubcqjk0TPPUS2OxZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLSWX8UjyqZKdQpiBSFiVfjLRzl/KrbrzvxORDtwVJc8ANoJJ+RYokiivryRp
 SnkAR4FkTISRxTvcG23V5yqU5u3Nb4XkJ7xFXVE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:XgSVhaEfgLxr+IXrpLqE+ceALOsnbusQ8zAXPiFKJCC9F/by/f
 xG885rtiMc9wxhOk3I9ervBEDiex/hHPxOgbX5VI3KNDUO01HGEGgN1+rfKjTbakjDytI=
X-IronPort-AV: E=Sophos;i="5.97,258,1669093200"; 
   d="scan'208";a="97314179"
Date: Mon, 30 Jan 2023 18:08:15 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH 5/6] tools: Introduce a non-truncating xc_xenver_cmdline()
Message-ID: <Y9gHj4jtzRmJYsRN@perard.uk.xensource.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
 <20230117135336.11662-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230117135336.11662-6-andrew.cooper3@citrix.com>

On Tue, Jan 17, 2023 at 01:53:35PM +0000, Andrew Cooper wrote:
> Update libxl to match.  No API/ABI change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

