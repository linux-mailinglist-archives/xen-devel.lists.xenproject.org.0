Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB0B4C3FF3
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:21:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278794.476172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVqH-0000PN-8Q; Fri, 25 Feb 2022 08:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278794.476172; Fri, 25 Feb 2022 08:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVqH-0000NX-5C; Fri, 25 Feb 2022 08:20:45 +0000
Received: by outflank-mailman (input) for mailman id 278794;
 Fri, 25 Feb 2022 08:20:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfiy=TI=citrix.com=prvs=0484f4aa7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nNVqF-0000NR-J0
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:20:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0e759d2-9613-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 09:20:41 +0100 (CET)
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
X-Inumbo-ID: d0e759d2-9613-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645777241;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=n9QJyCVLG8Ho/ORYM9gRdxWQ7f3hr1iV625024GGrjA=;
  b=cToaSeA7UH3MXzUYegPgDKs+lqcrT9aAMXZVH8IX2O4vyhUOrhz0gm2G
   aBLu5APd6RQ972y+djb7YEtrk5Bx9+h8BPOsNcMqqT0woTZSwvhT2NDPu
   P4TdhGEsJEbmfR1z9TOT0cwfHCWTLio43yHb2IQP6KsioIHCRAX6Fkd26
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64975463
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Q3N5mqvwZjDFdxdQXHaJGT+8refnVJFeMUV32f8akzHdYApBsoF/q
 tZmKWrXa/aPYDb2eoxyPI22/B8OscSEyNVmSlNkrn8xEihE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1nX5
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi80DqKPodsPTyJ6UABFB/Ya26DeCHGW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 5tGNGYxN3wsZTVFK2UUOs46ptyv2D7vaDt2pnDIuIEOtj27IAtZj+G2bYu9lsaxbcdfk1ucp
 2nG13/kGRxcP9uaoRKa9lq8i+mJmjn0MKoYGaek7PdsjBuWz3YKFRwNfVKhpL+yjUvWc8hWK
 1EQvDEvq6cy3EWxS5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6cLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aJBgablY9dzM/b0gk2OO4/KIslzvGZ4M2eEKqteHdFTb1y
 jGMiSExgbQPkMIGv5mGEUD7byGE/caQEFNsjunDdif8t14iOtb5D2C9wQWDtZ59wJClok5tV
 ZTus+yX96gwAJ6Ej0Rhq81dTejyt55p3NAx6GOD/qXNFRzxqhZPnqgKuVmSwXuF1O5eKFcFh
 2eJ5GtsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon0zOhLJgz21yBB0+U3aB
 Xt9WZz9ZZr9If46pAdaus9HieN7rszA7Tm7qW/HI+SPjuPFOS/9pUYtO1qSdOEphJ5oUy2Om
 +uzw/Cikk0FOMWnO3G/2ddKcTgicChqbbir+pc/XrPSfWJb9JQJVqa5LUUJINc+wcy4V47go
 xmAZ6Ov4AGn1C2fdF7TMSgLhXGGdc8XkE/X9BcEZD6A83MifZyu/OEYcZ42dqMg7+tt0bh/S
 PxtRilKKq4npujvk9jFUaTAkQ==
IronPort-HdrOrdr: A9a23:qY3l5qkJgDKlF/FEttAgBRvdcFHpDfPCimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPhICK0qTMqftWjdyRGVxeRZjLcKrAeQfhEWmtQtsZ
 uINpIOdOEYbmIK/PoSgjPIa+rIqePvmMvD6Ja8vhVQpENRGtpdBm9Ce3im+yZNNXB77PQCZf
 2hDp0tnUveRZ1bVLXyOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mOryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idgrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amGazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCR2B9vSyLaU5nlhBgu/DT1NU5DXStuA3Jy9/B96gIm0kyQlCAjtY4idnRpzuNId3AL3Z
 WADk1SrsA8ciYnV9MMOA4/e7rENoXse2O7DIvAGyWvKEk4U0i93qIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64975463"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlHJm6PrQmzOzLS2lcJIzT8FCA42BZ1e20hF30AkwqOLPkTXoLnY/m0XKLx7HnEGWAfF5cX3nHj7RKzJrrhHNQ22tLBmF1QPE+hxTrfLJfSk2rDOlG2N3bF27vlYuSRF9wh0DRUs9GoxOXSxmksGSFT/LZLd82K+bWlInm3TSC736UWSP8cLpOBmycTZnXMu9M2KdOiC5hmoDxn4COhKJgd/0W4bFHQvriKM5ku6tG6HzGVEjzFs0c+7q9L1KQpGzs448ZO/UTot1rnrvB51lg/OWsxEz1Y9OdjaMXEIX4Sck+WB61gfAL6R908vkgkMj/ltnPH5NpXUd61Lb4aNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUtxugdevG2Vz087BTXIdqD2zU1rmzcIyP5uJoil3Lc=;
 b=JCCPnr9wgP8eOmZE5NFLU1+IW3mjTmT7bUoU1Fg6BqunH+XS2/k9fJb0j/SxOOMW7xrVvGgg+udOPFmMLCbEndVH0aDE47y5UkKkWC/W0L6BFFQMaEo7GlcXYaoA/gDydsQZ0akPLDojutX6OMpuFUSvuOC3w/AnQ6VY+eEFbmpD0C/YlK7cAYDK5uqzIJYaxZK3vyAJdhJnKxGDCbTMh6g3ldeZtvnl5iTKVY8GMNeVZkTSSoR4BG9YRbWVd5n+jNIbDJEy21cHn/xE6cHlT6k8DSb/RmOiKmh+6TAFKNuKneF0ysJVhmZ8pCAQtrNUoJmqNEj7sljOF9QAxbNA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUtxugdevG2Vz087BTXIdqD2zU1rmzcIyP5uJoil3Lc=;
 b=VBJeMU0HeITW6IpBqp4duZ0MeWfk+kaQPIWwvJWKfxgzoo0XfIKKfqt5DpBp8aZ17b5zRoAYaWNSviGmYEmf87UJovU89q14QjwUm+vwk2MAGDfl9WdACnHZd7uLxdvrt5DBxr5MD5l/eBy5ktqNYdSurG1sBIULZAiOURvbvmY=
Date: Fri, 25 Feb 2022 09:20:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 3/3] xen/vpci: msix: move read/write call to MSI-X PBA
 entry to arch file
Message-ID: <YhiRS11TlQjuefHR@Air-de-Roger>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <3e47316052dce3c85bde04ab6b72ba4f48fa0bb8.1644937405.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e47316052dce3c85bde04ab6b72ba4f48fa0bb8.1644937405.git.rahul.singh@arm.com>
X-ClientProxiedBy: MRXP264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be0909cb-8eac-4c6e-9df6-08d9f837b16e
X-MS-TrafficTypeDiagnostic: MN2PR03MB5264:EE_
X-Microsoft-Antispam-PRVS: <MN2PR03MB5264D4BEF943AFF071B94C568F3E9@MN2PR03MB5264.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHMtiebEHs/lF7Xfn0ZDfImfvOnyFbgZ9Xm3FmRCG0E/lAAnJT+Ik8F4XMyzpOXJnM4vvSKhU8lJoiRliHMozfKiwmV1z3x66BrUU3MKUkZmblDM7Mydcpf6cV6mabqQp5iStmcjP4F0bMU2JbNkxNg6R13l8xu+7DZvbOTTCDK75gKidRiPFZW0GHioBNO6pkpc0uU0mILhMNlhugT4LGQpTutWfBs6pUpGQ604C/Ig96ba1DFZygZi6qEdlJ7Ql59uOy9Qaq1jS5mXyJ0v4ybAoaLkymmkSly8GFKUYXddgL1xi5gL6ZbPZHNiZ/pZP6Ta+sxgX6TxeqfwNn+IZnbEeD+tub0GhjlmhldKLEgXcVjswZ0D89DPedful+Cp2ukz76mWS8iF24L925oFKiDDaAhZgXfVniM8GPdNYJwGlARObIY6JgeAxJbemXSer5fZTBmVHe8RREhVgUy8R4yyJz0D2RGlSGg6nC0wghYKCxjq00BrHcDqYzSOzX4JH9bda480TebJq/vJu/vyDy9iZi1wL7uQQwgpyM/plY8btHiphqnA5c3xmkg9vsXpycqKhSvyK/2vh11kARaBETP5kh6oGZF1YsJbjfHGTsonNsplgCYo/LZDG0z8jMGP+WhWeEt0yfg8oWchjLsIIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(2906002)(8676002)(4326008)(66476007)(66556008)(66946007)(508600001)(6486002)(316002)(54906003)(6916009)(82960400001)(38100700002)(9686003)(6666004)(6512007)(6506007)(83380400001)(8936002)(4744005)(5660300002)(33716001)(26005)(186003)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDVGTjhLZEtFenF2R3EzbEk1UUlmLzNIazFTNVREMDF2bFlXUDVzSWNRRjJG?=
 =?utf-8?B?WDhsbHFPSGpLZFkyY1A5TWhEUGJ4TVd1V2pKSEFxaERqSWZzWGZiZkVLTHRx?=
 =?utf-8?B?bnJaNTlzSFBqVi9CemsrV0RES0E0MTFrc3R6SWFQTldPQk1XUFJralc4WXNW?=
 =?utf-8?B?ZTcyMndPL3VWRklRTkJvbTRyNkpUYUowNU9ObmhwZXBGWE1UY2QxbHlUZ2xC?=
 =?utf-8?B?MFVPTnZHYnlzamc2MmY1TVpzbU9FcDJFa2hQMThPRW5SUnN4NXpJeTY4Z2RZ?=
 =?utf-8?B?dHBabjhENGc4M0REdm5CYUJBeWh0OXJGaU1oU0lLd1NMUkJQcXFnTTFwRnJM?=
 =?utf-8?B?ZHAwaVRmVGxLSkhCTzdrMjNPdE9XM05kdzEwbUJsUjdEOW4xbytVaFdtMHNZ?=
 =?utf-8?B?ajdwV2VDWHpEaEVRcGFqYzdYdDYzdUVkWlB4ZzRtc1lyb0d4KyszYTB0Vnd3?=
 =?utf-8?B?SWthazd4bmZGN0tMcDJZenlmZTZrdkZob1llTitUMm9ueWlvZHp4cmpINkhE?=
 =?utf-8?B?Y3piL3RZTkI4aGdlL0hSQk9wQldvc0xMWGU4LzhpeEg1NDZzYW5IQmxCdSt5?=
 =?utf-8?B?STlWOFd5TDJlS0ZhNkRGMWxmZk5WMWJpNUZrQ0RVSERYa3EyTlBEajlMWktU?=
 =?utf-8?B?Y1llQ1kxVk5qMG1nVTRZb1RNbHlzdVQyNy9XajllRkVXaGJDckdXKzQ2Mld6?=
 =?utf-8?B?R2wrWEhLKzdSaG9mV0c4YXJFTjZGcDYxQUdMV0NrOStPMytIYnJQbWF4SGpN?=
 =?utf-8?B?RnArNEZpWHk4ZHE0L2VleXMyamJCZnh6VGY4ZmFiWjdiL1FibGZyKzlDNDNM?=
 =?utf-8?B?cG9RSDE2NzlhMHhyYnRBN1N4R0lJYWtqT3E3Rlc5UU40Q2M0ODlMYzJMMVpJ?=
 =?utf-8?B?THpEczk4WnFkdFZtdkhqSjcyRjF0NnJNWms4bjlLZ09Qc2tHYVU1Y1JabTJp?=
 =?utf-8?B?eTNHemtjdURCUmZWMDV5eWVuWmt6U3pnSXFTTXVreXlPMU5NVlhZUUg2U1E1?=
 =?utf-8?B?STVwVVlLWGJtWVEwb1BvMmF3NVRBZkl6ZWdxSjFTWnMrL2ZUTDNzUU9yeDJN?=
 =?utf-8?B?eTNOSm9iS3k1eEVPaHZYajFKUk9IZStIcEtIMThvM0lSMXRCdDdUVUFMNHNl?=
 =?utf-8?B?cjhIMmZuY2VKY2dqVklJWVZpbzYrTFhYU1d2MEFxUzFCSU9LNnlMRmVZallU?=
 =?utf-8?B?VWs5TysrRjNJR1NmZ0FXenVpNmZMYmdBL2lxQ1VGc0VXQlV4MmRQcG9TN1Yz?=
 =?utf-8?B?cnBTL1RMaWRQaUpnV0JoWndJaDVUN3pLNEI0eWI1S3hkWWpIS1dMa0xHMnRw?=
 =?utf-8?B?R3k2SjhHTkhsMmdURW5HUWNGYXBabEdaeERIU0NkdGpmL1g2OGlCdFl4YTJ2?=
 =?utf-8?B?TnA3UVVoMnJNQ3AvR0lkK2s5d2xYVUFHUXgydXdWOHZmcFEyNnpzL2JXRlJz?=
 =?utf-8?B?L3ltRWdWSVVIbkhiczJYRUh1SmtCcmt4Tjg4N08xNDFxOEZ3eEY3YVRqTC9a?=
 =?utf-8?B?Zzh0WUppZDk1VE5GS2RZQVZpVm1kRXZxQ0tTV3JwVy9USCtCbGlZU2RnTmRu?=
 =?utf-8?B?Ly90NFNUK0IyV2pVSkYvTUVVUnBsT3FyUEtJOUhEdGp4SEhZWm4vaXFtRlhG?=
 =?utf-8?B?ZmJqRDJkZ0FhS3N6ZWNpckU2ZC9UNGt0RVV3S2NYYVM3bEtGdFhEMmh3eC9x?=
 =?utf-8?B?ZDRsZ0VBOFE0UTVKNEpibXBNbzNoWU1KMFpHTVZBOEFOaFlkNHovSXpsKzBV?=
 =?utf-8?B?NlNpYlZ5QVZzMjFVaWxCeTBFUngxQWRlNGZhVnZ6VGxwakxTMnRiK2FRL2lH?=
 =?utf-8?B?bkxFdlBXZlNUWjE5dkE4UkdQL21BK3NtMXEzK2h2TElITUJMSlgzS1Bxd3lX?=
 =?utf-8?B?NGlaaktCYXlMdWQ4WkRSbSt5V0xaMmwwcmdXRVdzU29QWlFlanljZHpUQmEv?=
 =?utf-8?B?NTN1YXdHNS9QWGJ3UTZnZWVDNC9mMlR6VVM4ZDFnQXpNaExGNXdqK1lGR0lJ?=
 =?utf-8?B?cVJ2RXBMN2RmWldIYVNrbU1tbUVPbVhHMlBWNDlZQlhTS0I3eXlGMDJtQTR2?=
 =?utf-8?B?YVY2aVJ4MzRWMkNnay82RnlKUXNtZm5DcWYwQXFKSHBKUXFsM1NwYUFhKy9r?=
 =?utf-8?B?VnBnemVJQmdITmVUNDUwYitQemp6WHBMOXVTRFhKdG5CRUFJdlVRVDRJbTFa?=
 =?utf-8?Q?NaPeM3NKzq70Y7imXRxWP3k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be0909cb-8eac-4c6e-9df6-08d9f837b16e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:20:33.7247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X47VHzDRXMtvygpGnRoNGiwYacDpmJXnv2IQjjQ67uDtF0ek7gCI2Q9yUVThODXlFc1niSso2Angks2SA5pquA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5264
X-OriginatorOrg: citrix.com

On Tue, Feb 15, 2022 at 03:25:18PM +0000, Rahul Singh wrote:
> {read,write}{l,q} function argument is different for ARM and x86.
> ARM {read,wrie}(l,q} function argument is pointer whereas X86
> {read,wrie}(l,q} function argument is address itself.
> 
> {read,write}{l,q} is only used in common file to access the MSI-X PBA
> structure. To avoid impacting other x86 code and to make the code common
> move the read/write call to MSI-X PBA to arch specific file.

I think we agreed where going to unify {read,write}{l,q} so they could
be used in arch-agnostic code?

Thanks, Roger.

