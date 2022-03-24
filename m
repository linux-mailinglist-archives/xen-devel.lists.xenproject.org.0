Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3914E65A9
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 15:51:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294428.500651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXOnX-0000cY-IP; Thu, 24 Mar 2022 14:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294428.500651; Thu, 24 Mar 2022 14:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXOnX-0000Za-Eo; Thu, 24 Mar 2022 14:50:47 +0000
Received: by outflank-mailman (input) for mailman id 294428;
 Thu, 24 Mar 2022 14:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7/3=UD=citrix.com=prvs=07544547a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXOnV-0000ZU-9b
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 14:50:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c700d531-ab81-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 15:50:43 +0100 (CET)
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
X-Inumbo-ID: c700d531-ab81-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648133443;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vV7ysaSoj13so5mRnwxQmwAteMsysTFyUQ7QlMtKr0k=;
  b=ElEN9CWrrOYapCKrqcTFbeDKbnppru2Dt9oCQw1/zNY42q6iixFiZPwd
   mwEG2L6qsrDZVu/v10EmUPNuslhB1geTsUXKaJHghDIHBxFuzP36bjggO
   lBb1NAcRuvJvl7JkRSoP0jAxABIu287DpXZh3ZDlRXpqTQJALp3BfGWm2
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67081931
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:smqeaa5OqscnTsH7pEDvrAxRtNrHchMFZxGqfqrLsTDasY5as4F+v
 jAZDWDTPv2OZmTwf9AiPovlo0NT6pbWzYBiHAJk/HhkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPjX1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurS5FygVY/DCk98QeABeDT9QeodIu7LudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQq6OP
 ptCMFKDajzvREcIFA0TLKgSs9Wwm0feaCNUthGa8P9fD2/7k1UqjemF3MDuUt6XQcRYmG6Iq
 2SA+H72ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZ2iVia3UQPCxkbU1SqrP3/gUm7M/pAL
 2QE9yxoqrI9nGS3R9z0RFu8rXiLrxMYc9tWD+A+rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf/LqJqTK5OQAOMHQPIyQDSGM4D8LL+d9pyEiVF5A6TfDz3oad9SzML
 y6ipXYRu+hOg8Uw2o6i+07ZrXWGqNvEZ1tgjunIZV6N4gR8bY+jQoWn71nH8PpNRLqkokm9U
 GsswJbHsr1XZX2ZvGnUGbhWQun1jxqQGGeE6WODCaXN4NhEF5SLWYlLqA9zK05yWirvUW+4O
 RSD0e+9CXI6AZdLUUOVS9/pYyjJ5fK5fTgAahwyRoARCnSWXFXblByCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1mnBmmzuDHs6jkkTPPV+iiJi9E+dt3LymNL1R0U95iF+Nr
 4Y32zWilX2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/SwJwClEOJY3VMNeImelJU9U8x8x9z76Ul
 lngCh4w4Aeu3hXvdFTVAk2PnZuyBP6TW1pgZndyVbtpslB+CbuSAFA3K8RmJ+V2pbY/pRO2J
 tFcE/i97j10Ym2v0xwWbIXnrZwkcxKuhAmUODGibiR5dJllLzElMPe9Fucz3EHi1haKiPY=
IronPort-HdrOrdr: A9a23:AA4zDK0TNJ39AcdYN8gNyAqjBV5yeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YcT0EcMqyPMbEZt7eC3ODQKb9Jq7PmgcOVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvoRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIF/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF8nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KNoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFrLA
 BXNrCT2B9qSyLaU5iA1VMfgOBEH05DVCtue3Jy9fB8iFNt7TNEJ0hx/r1rop5PzuN+d3B+3Z
 W1Dk1ZrsA+ciYoV9MPOA4ge7rBNoWfe2O7DIqtSW6XZp3vfUi97qLK3A==
X-IronPort-AV: E=Sophos;i="5.90,207,1643691600"; 
   d="scan'208";a="67081931"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PfFM4NMrhSWNAv9I/bGO7CIDLk5Q5AWwO9VRvj0zwnJwALvAI6dakggM+XkMHFECiyDzts+0+phAdFYIIz7eHvrQmxYwXCY1oDzoWf8tTe7/9ZV8QbfrPOzyeHSVkukrOr7d6J7k2MXeTGKaOgxlDrIDbIs7Tq5Bqqn8EU08XoasFP8Dow9qKEr1zw9Z9kgRDSDP1l3HY0s0w2/s+M21R9AE1HsH/6yQFQrTQ3YIWxHCkVJttF/RIFxL/Sue2oU0a2/Zn/Ay1ymEfoPfFSrf7DHNRhiAhe3VDwJHGdSrviMBGPcL3zCWl5MqyxWFo13mdcAjRC1WyiYPSQf6kSIJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2U8iZLqCEtxFsMpBC75M2ipq4mgeareS1zCb6P8IDGE=;
 b=VzOrcW3KCWQMq2ZCtREz4tQTYzQEaKjv/YJ7sDzAmF8iK/wffpSPvM0p7EQLGEqUAJkTGng1nrD0VdmSKrWOBbnaGaIcwoUUEtHNTetc6I06YfCv040UajyRy46EnjwNvDByV8ZYZhqXKKqXvpnn8xn7Fhh658s6lOH9oYBKTTVJvAYOB96ijCxVKd8Y/h+aoApnGF4d33VbzCC3WjHuRyNRXGMwUvy9nrxd1LiNbyYNQuY7QHEvSgn7T0kzXwIqrmFuqKrMiTN69dOyvvHBRqBGfwBp+Wqhh/FKfh5DVdRmvdV5Ppdk2gpPX826hiEwYXS+N2zxGE7hMiaEGY/QZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2U8iZLqCEtxFsMpBC75M2ipq4mgeareS1zCb6P8IDGE=;
 b=YEC16cO1Dw1QG906gzFKLxX+ghU426GGUa8uxmoQYHyka1YSG7mFyEzWwmya9aZ8vzZwJtfk4+XnYhKM6G/chMtaZinTjF4xPnnBh6TX042+1zVQcpjDXgp69X68+kgVhUseGWv9B5hqmqA2HdQ4diIINmwcv4aZJAN/spf7tsQ=
Date: Thu, 24 Mar 2022 15:50:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 1/3] x86/mem_sharing: option to skip populating special
 pages during fork
Message-ID: <YjyFODl7VFJLaj0c@Air-de-Roger>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: LO2P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f2c1fc8-61f8-4644-4a63-08da0da5a87b
X-MS-TrafficTypeDiagnostic: PH0PR03MB5845:EE_
X-Microsoft-Antispam-PRVS: <PH0PR03MB5845343C803AF140B4D5A6DD8F199@PH0PR03MB5845.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SyKOw3LdBgpGL3jAjitlotipSO2jl5UFYvnfyHTwYowrHggbWV/L3QlzwtVUlB6LjJxZXnuPJCFxgIvafwSnh4/c/M+J2+OoGItCYyk/BpDRB+GVPPTCSke7bcE7hfxgU4LyUch2uXLYzB3Q8kuLqJ1BB7KgBo/P8Kbf0Nm5M4EqkHNE3VkePvI5+tCgHgprL+cW7lZPCvdJP+DA9+Q9iRIwvj+yytszoK+lInRSbCN2DWvI+l9oDbiOtzXPOFcYzc2w4Rz6n4Ed+lSz/rkNnr+MI9zCGJnxaQgaa81RmYLZn0fXCY3FKpzCkZ6MnfUgxKlNmQj7/cN06kqjeXvo8H3GEi8rcJEl7byB2W2TmmD+FGfZXb1X7QpRyGssjfhiJoGIZyGfve2gv8XWIhpJC7VMmUr4u0mdqQK/1meXNuOvB2MZng9shj/rlk6TVak+FcGddOaP7Ek07V/7drUyZMfsX1oDJ5qLhoDFBrO66D06HdNU/PQGXDN/di85MaB/TBVnYWIkqluaVj5o55AzNkDNzby/eitX2iuBAT08H9P6jmvLPNAogItL6y3H887A+gZUMBE0GHNHrzyRobgS0IqJuRt8gB8erNHn8F2vzughFpStUCQh6ngBgBxNRtDIhyYYZitmAKus/ZvAaLy2jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(2906002)(33716001)(6666004)(6506007)(83380400001)(186003)(26005)(6512007)(9686003)(316002)(4326008)(8676002)(85182001)(6486002)(508600001)(66476007)(66556008)(54906003)(6916009)(86362001)(66946007)(82960400001)(8936002)(5660300002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlVtMXFyVmFYYWhxbXpOdnFDd2VOdFZmUDFnZWRUdlBkbWoxeStEcFlRek8v?=
 =?utf-8?B?SlQ3VnVPQ1NpSVo3YVZFb0VzZElUOHFHT0xNUGtxOUowTldmY0wwMStnc2l4?=
 =?utf-8?B?dUZmMHhXbzk0cC9XMndwZjZ5UVQyM2tGRkltQzBQakJSRk0yRzlBbzlicUgv?=
 =?utf-8?B?SUd1UU8yaFJleEpWZ0VrOEhQbDhkMW9xU1VvWSt3TFhJVjhPeXZhekdUZlpz?=
 =?utf-8?B?dkNvTjBWU2RiSzk0QXY5L3RjSUlqcDVJbEMwS1hZN1pMTm5hVnJ2QVZZbWNk?=
 =?utf-8?B?dDZKbG1vekl2bHFlZ0ZDYTMwblkzVnJGMDNhUDgyWkRMeUdjQ0pDemlMOW0y?=
 =?utf-8?B?WEQ1ZGdvNmRNSjAvYncvUTY0cWR1eXo0dVk5UGV3U1IrUVplQTV6bjFCekNY?=
 =?utf-8?B?REtCR3VoNkxSRFp0WXVURG1HNWN0MGIyekx4azNMcHVFRnlWSm84dkVOQllH?=
 =?utf-8?B?ZGdYYVNGY1MrejU4RTB2NGd3SUt6V2Q3d2h0d1RXWXAwMXE3TG04b3ovUFR3?=
 =?utf-8?B?RDVHVW9XMXBQL2JaSnJTeERZTHJ0MEttYXYyMWpSN2FlOHAyVVIwcTF1ZDJP?=
 =?utf-8?B?OHIraDJ1SUQvTGViT3FRL3NEVHJVYm50VnJoN3I0RkZFNUp5N2xRbm1ZZ2lx?=
 =?utf-8?B?SjhmM2dmZ25qN2h0cUlwdzNseU9LMVkvM3A4WGVzUjJtK0RsaXBtZmVpUW0v?=
 =?utf-8?B?WVFHSWNORlpqTGozdlFzUUUvRDNqM0FsZTdRZWpzdzJnODl0NHg3SE9ORFNI?=
 =?utf-8?B?Y1ptb3UyY2lwc2ZNdEo2MUNRald2aEVGL3dtY3Z0NHp3K0xhb1JXbHpBWStG?=
 =?utf-8?B?enBuSUljcWl2WXp5VVI5eStmNEYxMTNZSW43K3AvZzZ6QXpXNXRDQThBUnF2?=
 =?utf-8?B?Ni9RaGxMQXFtUjJpVG9wcFR1TzYrRk1ZNWFVTkJ1VnljdyszTXEyYlJYQnhh?=
 =?utf-8?B?SFd4eWJ2Wm1jWUVOSHFtRlZFb2wrNDF0ZFFkM0M5UERxRWtHU25mMWFZUmtR?=
 =?utf-8?B?b253eS90dml4ZDZYVjRTb3cyZDhzd1JYeWtIcG1yZC9qMXcwVVRNbW5DaGcy?=
 =?utf-8?B?S1BsZFYxTmloNEdiWTNKV1dHZlAwMGlCeThMc29Ea0VVek1RcThmblJTSVlz?=
 =?utf-8?B?UXRGYVZnVzJFWXlhd0hwRHFEVldmaEI4RXJIRFVPNGgxc0NRTFVWdTdtWkxB?=
 =?utf-8?B?VnNJUHBFek9sbVh4ZWdUbXJkRS9HQUI3U2NHN090VTdPQWhRUEVDb3BNZDVN?=
 =?utf-8?B?Yk42SWgraWlrcDErcGlKamFWSWttVGhaVXBwcFltWEhML2FEZjd3Wm5iSGhp?=
 =?utf-8?B?MkF1b3RXd3dBNTdNRkVocmhyYlhFTXlaTDJicWUrWk50U25wZHZ6bFUxbUw4?=
 =?utf-8?B?VXEvYVg4akdIZ3I4QVhMMHI0bDBvRXR5SGdVeUd4c2ZlTjNXK281eWZqQWxW?=
 =?utf-8?B?aGV0MEN3K1UvaVdBTWFnYWZSbkRaZ1pmUUltenV3R2d6R3lseFdJS3MrZ0hl?=
 =?utf-8?B?ckFVZ01kbWNZSkZyVFdqL2wyV0krb1h1cCt4MHFzU0lCOUdRSERTT0t0dFRp?=
 =?utf-8?B?bzl4NFA2K1JaV2VRM3E5QTh3Ujl1emZMZlpzVjBXWTBLSFZFcndvTjZuSzJ1?=
 =?utf-8?B?L2YxZkpTZHNlcFZpNGtrbzFVdDBTMTMrT1hDQmpoQ2JPdmllcHp1dlRRZTg0?=
 =?utf-8?B?Z25NVmRRYTNKREpLNUEzMjRPV3dPbEFkclVKUGt0VStPSlNLaU9ubGpiOGJR?=
 =?utf-8?B?MThsRmgxY2V5bGJGZk5WdWRjM2dhUXlOUVFaVlVWMGkvcXFSRVVvMXk4YVN2?=
 =?utf-8?B?TGZ0T2MzdzhjaVdOMlFYVmxsSnFsTUd5eWMyYTZ4d3UxUFdKWVlpZGwrR2JF?=
 =?utf-8?B?TGJ2RjFvdFh2RzhJVDBORW1GOTdvUkpobFZqeUtYTVdNNXg3N0hxVE5nQU84?=
 =?utf-8?B?clJoTHFiK09NZGpGNzFNWVlCNlBMOUFsamlzNm5sbE1JaDREcjNKQ3BQTlZ2?=
 =?utf-8?B?a1JCclZuYnFBVk55RWNQdlB1Vmdhb1U0TjIwR2JoTGVCblBlclgzRWtGb21v?=
 =?utf-8?B?MFFLdTlhM1ZFTXYyRkEyai8rbm5ZM1RjYWhxeWZrWjdPbWJDYUdUeGNSQTN0?=
 =?utf-8?B?VzZJU0ZTSHVWdXRvL2kvZW11cEhvUW5maStXTmhvTXo0UzhxcDJSMUVHMzY2?=
 =?utf-8?B?b1B5cXo5cXgrNWNINTlZZ3ptWEV1UUtZdWFvbklRSXI3Q0phNDEwaGRSQ3hn?=
 =?utf-8?B?aExzekwvNjFqNHpvS0tHT2hxRTVxWE1hZ3ZxVWlIZnlsMU9hS25LVE9IWGRP?=
 =?utf-8?B?TnZRMG9Va3FMb1JLUzB1MnplM3puWU5DTlVsZHE4dEh4d2RoN0UzTmUzRm9r?=
 =?utf-8?Q?OY1UlmY0p0SflzgI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2c1fc8-61f8-4644-4a63-08da0da5a87b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 14:50:37.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/F8hGWzC2bnPdzM5wwAkOAHIx+HzeZ6fA8PW1Ns4gvmyqkKt5pjPb2KU/2S3ce9mZsSgNRaZ/FDw6NewMdDXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5845
X-OriginatorOrg: citrix.com

On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:
> Add option to the fork memop to skip populating the fork with special pages.
> These special pages are only necessary when setting up forks to be fully
> functional with a toolstack. For short-lived forks where no toolstack is active
> these pages are uneccesary.

I'm not sure those are strictly related to having a toolstack. For
example the vcpu_info has nothing to do with having a toolstack, and
is only used by the guest in order to receive events or fetch time
related data. So while a short-lived fork might not make use of those,
that has nothing to do with having a toolstack or not.

> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
>  xen/arch/x86/include/asm/hvm/domain.h |  4 +++-
>  xen/arch/x86/mm/mem_sharing.c         | 33 +++++++++++++++++----------
>  xen/include/public/memory.h           |  4 ++--
>  3 files changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/hvm/domain.h b/xen/arch/x86/include/asm/hvm/domain.h
> index 698455444e..446cd06411 100644
> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -31,7 +31,9 @@
>  #ifdef CONFIG_MEM_SHARING
>  struct mem_sharing_domain
>  {
> -    bool enabled, block_interrupts;
> +    bool enabled;
> +    bool block_interrupts;
> +    bool skip_special_pages;
>  
>      /*
>       * When releasing shared gfn's in a preemptible manner, recall where
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 15e6a7ed81..84c04ddfa3 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1643,7 +1643,8 @@ static int bring_up_vcpus(struct domain *cd, struct domain *d)
>      return 0;
>  }
>  
> -static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
> +static int copy_vcpu_settings(struct domain *cd, const struct domain *d,
> +                              bool skip_special_pages)
>  {
>      unsigned int i;
>      struct p2m_domain *p2m = p2m_get_hostp2m(cd);
> @@ -1660,7 +1661,7 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
>  
>          /* Copy & map in the vcpu_info page if the guest uses one */
>          vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
> -        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
> +        if ( !skip_special_pages && !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
>          {
>              mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
>  
> @@ -1807,17 +1808,18 @@ static int copy_special_pages(struct domain *cd, struct domain *d)
>      return 0;
>  }
>  
> -static int copy_settings(struct domain *cd, struct domain *d)
> +static int copy_settings(struct domain *cd, struct domain *d,
> +                         bool skip_special_pages)
>  {
>      int rc;
>  
> -    if ( (rc = copy_vcpu_settings(cd, d)) )
> +    if ( (rc = copy_vcpu_settings(cd, d, skip_special_pages)) )
>          return rc;
>  
>      if ( (rc = hvm_copy_context_and_params(cd, d)) )
>          return rc;
>  
> -    if ( (rc = copy_special_pages(cd, d)) )
> +    if ( !skip_special_pages && (rc = copy_special_pages(cd, d)) )
>          return rc;
>  
>      copy_tsc(cd, d);
> @@ -1826,9 +1828,11 @@ static int copy_settings(struct domain *cd, struct domain *d)
>      return rc;
>  }
>  
> -static int fork(struct domain *cd, struct domain *d)
> +static int fork(struct domain *cd, struct domain *d, uint16_t flags)
>  {
>      int rc = -EBUSY;
> +    bool block_interrupts = flags & XENMEM_FORK_BLOCK_INTERRUPTS;
> +    bool skip_special_pages = flags & XENMEM_FORK_SKIP_SPECIAL_PAGES;
>  
>      if ( !cd->controller_pause_count )
>          return rc;
> @@ -1856,7 +1860,13 @@ static int fork(struct domain *cd, struct domain *d)
>      if ( (rc = bring_up_vcpus(cd, d)) )
>          goto done;
>  
> -    rc = copy_settings(cd, d);
> +    if ( !(rc = copy_settings(cd, d, skip_special_pages)) )

Can you set
cd->arch.hvm.mem_sharing.{block_interrupts,skip_special_pages} earlier
so that you don't need to pass the options around to copy_settings and
copy_vcpu_settings?

> +    {
> +        cd->arch.hvm.mem_sharing.block_interrupts = block_interrupts;
> +        cd->arch.hvm.mem_sharing.skip_special_pages = skip_special_pages;
> +        /* skip mapping the vAPIC page on unpause if skipping special pages */
> +        cd->creation_finished = skip_special_pages;

I think this is dangerous. While it might be true at the moment that
the arch_domain_creation_finished only maps the vAPIC page, there's no
guarantee it couldn't do other stuff in the future that could be
required for the VM to be started.

Does it add much overhead to map the vAPIC page?

Thanks, Roger.

