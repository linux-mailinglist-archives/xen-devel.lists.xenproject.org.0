Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A995394F4
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 18:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339888.564803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw4h0-0002kk-EH; Tue, 31 May 2022 16:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339888.564803; Tue, 31 May 2022 16:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw4h0-0002iy-9R; Tue, 31 May 2022 16:26:02 +0000
Received: by outflank-mailman (input) for mailman id 339888;
 Tue, 31 May 2022 16:26:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8THd=WH=citrix.com=prvs=14366b804=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nw4gy-0002is-J4
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 16:26:00 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59829579-e0fe-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 18:25:58 +0200 (CEST)
Received: from mail-dm6nam08lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 May 2022 12:25:55 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2498.namprd03.prod.outlook.com (2603:10b6:404:15::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 16:25:53 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 16:25:53 +0000
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
X-Inumbo-ID: 59829579-e0fe-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654014358;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8Xo1VWN3y0gketalO3c/EWQZ16/ncwxFjsYGosKpl4o=;
  b=bbFP7mtXPKkbk6UYrxHc6KszhTSqRrdbAM7g/azfbCGRXxG1TKwU0/dL
   +aAxDm0JX2G4LJN8N0wDKRua84KztIDHZUwjubhJqJlJBBKVmRHG7xysm
   X8xdb1LpcSTZAyInr3j5osYFS3knZq/KxiqYFw1zDvG6eatg6yZlGNaWA
   U=;
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 72537546
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zFmOga7QtKAWKnaPHMpCrAxRtE/GchMFZxGqfqrLsTDasY5as4F+v
 jFOUWGBaPaCYmXwe4p/PIux8RtVu5PUmINlSwBt+CA3Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXiWlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSxbFwCYKH1hd1edDB8DxAiYpFEofjYdC3XXcy7lyUqclPK6tA2UAQaGNNd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfqRo4MJtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGcF8w3I+fRfD277nCtx9aryOtXuPcXRX8kSu32en
 EjI8DGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHlVgC8iG6JuFgbQdU4LgEhwASEy66R7wPHAGEBFm5FcIZ+6J5wQiE23
 FiUmd+vHSZorLCeVXOa8PGTsC+2Pi8Wa2QFYEfoUDc43jUqm6lr5jqnczqpOPTdYgHdcd0o/
 w23kQ==
IronPort-HdrOrdr: A9a23:zYBax6kbUjzWdYgFWpx/Z97oGhvpDfOwimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtND4b7LfCRHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaFp2IhD0JbjpzfHcGJjWvUvECZe
 ChD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 r525RT5c5zp/AtHNNA7cc6ML+K4z/2MGXx2Fz7GyWWKIg3f1TwlrXQ3JIZoMmXRb1g9upApH
 2GaiISiVIP
X-IronPort-AV: E=Sophos;i="5.91,265,1647316800"; 
   d="scan'208";a="72537546"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UywujExXW2Bu9/UdeXRRU0W8D0rrAeeqn6U+kJXRr+oeki4hITmUSDs4HKMcBYOPC299q8/v4YqyIS9M26whsibgGDf/5wIxrGrqE31a15+qdoqKT1743GihW/WFPGiz5sv7Olm/bSj0X5pKcSpfgLwytO9mPUdVVD+qfekR2hXOQ2WyXSe9lmPBB8Zn85bPi/bAY/+ncGfeE6UuzOCGkK1Adnk0vuK8mmJSNQj6vzEcms3FQRh4ypyTamuxE7fzpGraV9RYzrY5synsw1BaA6QcB8jHenN0MxiCZwVqmwpcGqNCRLtrhPqnT7/6xt3qcME9uiYOYvgFSyS35v9Jhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVAW9MHPBvthcSE5X9oVg97dafPQVum65wpdyBvxjw8=;
 b=U0WIQMbI/Gs6EO98mpZlxCrMCRwXoxJV62+YTXtw4YzGtXwvzGuwvg/CR6I2Fto0VKxMP+ZWS1oomUurV8gAOQgjeZ6MrCj6VeDxUWLV9aQK+6v/NrAx1tPOC3JjAmRJSLkYrz2BQIa2giz18E6mkd6nBNVZlS4tncTo89KhvID4Y1Oo2/kYyxgspDtBKzfN9vPGuWiOjxrgBsY3PbUEoWefXNMLwNPmiIS8pVBKvwiOUltZgHfxR60AIWzPAa9elqEgGYYvC0ws6pSOcaWfeZSKzo7kwUaRO8jnhm2J9tNTgl+GEW3RPr+rI36WMthKhSz5TjOCDwu0lPWQLak/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVAW9MHPBvthcSE5X9oVg97dafPQVum65wpdyBvxjw8=;
 b=mvi1wGZvniTOrSWqSBAzDYluHiTq+US0BOihpRaXOoXkCBDPkbg+FM1VCcrghnERSByfjpYBHaNG0Hx0dyWhLWvTPIyg6fr5X879qBPAhmhiZGpmy3g93YBGnKk61xcYktubggFS0GORugYFiVdO4gw0K7CK6QV9rsGThlO1wDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 31 May 2022 18:25:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 03/15] IOMMU/x86: support freeing of pagetables
Message-ID: <YpZBjVxRdJOzJzZx@Air-de-Roger>
References: <80448822-bc1c-9f7d-ade5-fdf7c46421fe@suse.com>
 <614413d8-5043-f0e3-929b-f161fa89bb35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <614413d8-5043-f0e3-929b-f161fa89bb35@suse.com>
X-ClientProxiedBy: LO2P265CA0168.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 497d8be2-e013-4034-0dd7-08da43223ba6
X-MS-TrafficTypeDiagnostic: BN6PR03MB2498:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB24981122B46BEC3C6ABF1C3F8FDC9@BN6PR03MB2498.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JXd1p3nNlK1Hrd164soth1c1hWBxryACsxNmT3/MSdeVn3T9A/po5/1RQQrT4ATfzPBcIyVXFbqyL4An4aeR9G46C0LrWEIrb+gcMYUCe+5MLBr3V4S4v4srMVqtei60JOWcwdYnUYQgAlP7dGikVam92iZ3orjBcLwl0qvAu7ElsuvzqsMP4xWUFQiAED0WruroQP0EallGeNmfP/njo5TMeONSEq7x6hG/qo6hJupujPwfsmFNUZKlp5cDx+4r1FJ+ptRFy5WAUV1JdmduS+hIMV2XqAPYnBAlLjJ2Xs3GQyW1z9+2SULd8mkf4E9vZEldn7bk/T66YpzJVq07Ht7ignzQkgvl5rLweFaYi7w2IZyZeS1HIqzcyn+HN/v+ADevfNDAF5lDRg41Kh676XUuE6y3ZMZS29N68CEoC/NhaejsSLA4pC4oleJInuFSW/yBaF9K0VfDdqenYLIIzHEQx/9uZxm/oYiH58xxBP9HhCcr98YztDJMES4W5isibdcGiXRmOcp1vm2RUmuaGULPl6ko0+wEWziqCrasqPvjVAr17Nm0g+IUPxfFgI2POr+hIC7rvfwWiyC2ZYSN9M6jP8eoWJuzBL+Gjikf3HTKDHt53+e4VXK+NAan1gr6PDtQmGzDPWD+gIsXo4Y6k57EwJAW/f6j/YuiIopQJFx9yQdCQ+sdNkMWJf4E7Jf9LKU1HgFsBiiLKgED+1yOu0aNxWoVu3fg8he/ZtVT20U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(54906003)(9686003)(316002)(2906002)(33716001)(26005)(6506007)(6512007)(6916009)(83380400001)(85182001)(82960400001)(8936002)(4326008)(66946007)(5660300002)(38100700002)(86362001)(66556008)(8676002)(66476007)(508600001)(6486002)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGJNZ2VXQzBsNFBlaUJiNUM2WE1sb29NSHdQNjVOQjJYZmhuQnFWQTVFS1JG?=
 =?utf-8?B?dER3bWtKSG9FQ3F3OFJTazNSc2xhL01OYWt1NEVzanB6NHpoa0tuamxMaGhV?=
 =?utf-8?B?SDRTblBlOE1qcUNmRldjdUFQTHZURUtyRjVDdFBnUmREeklDcGxteXZxbXZR?=
 =?utf-8?B?bW1EdS9rbU1vMEFOTkJ2NW9nZHJ1WlprQWpYT3BFMzJ3YzYwRER2NU1JOTVw?=
 =?utf-8?B?YTZ2ODh2QXVDRjdkS09IS3JaditUMkt6RXdxU3l3UDZWK2Q5L2lhM0JvcUdr?=
 =?utf-8?B?c2FPK3ZiTlY3aWNRQ2t5YStKS0ZaR09IRm5zN1BGVlV6N0pGOUEvU01TSkR6?=
 =?utf-8?B?YlIxV0ZiMC9lMWYxeDFxOCttQ3VCZ2RDdmxoSTlHcDVTazRtU1NaNGNCMmgz?=
 =?utf-8?B?YVdBdTFIaWxzUWIzSzE2YWVvQklJNzVBYk9sOTU5cEpXOVFBQ0ZEam1WOEJh?=
 =?utf-8?B?RTJHL0dSek0vYW12dGl4WmlweitSVHhUSGZvTWFxSUt1NXJuL1k2Q0VFVDFC?=
 =?utf-8?B?dG94WklSYWYwWURwUW9wdWM3QnpyazF5WHg1SkVwbk1VQ1NPVXd1cGpiT29R?=
 =?utf-8?B?VkMxVFZrT3RiVGdMYkNvL0xxN1JjSEQxbGlBc1crYkQ0dG5CY2tWUllqV2Ix?=
 =?utf-8?B?ckNONDl4cXJ4ZWYxVkxaL1MrNGcyODBidTJlNDZjNGlFQ1AzNVc4bnR4RCtD?=
 =?utf-8?B?M0ZsbVcwQVhPNFNDbGxiTWpwRVl2Smt0c1NVQlhrYlVKOVRuTURLY0lWdjZK?=
 =?utf-8?B?YTBIZmZORlFHYTRBa0kyb29lRHdITHp5TXVFT1dHaHVKY2FnUk9qTTlSN1c4?=
 =?utf-8?B?Zng0NDEyV091Uks2RG5LVXBDLzE5Y3NnKzlEWHI3ZTVNSUNOazZ5WXNPYVlw?=
 =?utf-8?B?bWFsUWZKRG1yNTZtekJmellKZDlacjVKZ2xEZFlSbkZSUUY0eHdJZis4MjJh?=
 =?utf-8?B?MWZRU1RDY0dRMXlNS2ZrT0tjWUxwdk91YWV2NW9oZEozS2pMWDBLa1N4VkRD?=
 =?utf-8?B?dlFxVEtibVNMU2prSlJyMU1yQXFQU1JCYVpWaEpGSGVkazI1S25aa1VSLzRC?=
 =?utf-8?B?dUMyWnJyK3Q3SjE3dGVBeG8zS1BPWk1xR2NLODd2TDUzaWM3TWloTEhMN1F6?=
 =?utf-8?B?eHdNQlhMTG9NMW5NUmNMTzU1Um42QUdwVzhoWG1aQzNJNEVVS2prYVh6dXNT?=
 =?utf-8?B?UnM2QWsweFRrUWNFYjNMQnJJaGNSclFyREVSQlB4R1IvSjRIZHVnZTVGL0Fi?=
 =?utf-8?B?dWRTWElCKzFDS253MjBiWlFBczJCN3h3R3hHcEVRN1Zta1I5S05RR0dKVkFO?=
 =?utf-8?B?NWxuaVRFRDZrTzBlQ1pNVnF3bC9xeENkNWt6VzEyWG1sNjhsemxQR29LaWFF?=
 =?utf-8?B?SmhXMkdTZEc2N2lFYS9NTW9LVHI0VlBnYTBUamZQdEM0TUlhVnJKQUdEcEVW?=
 =?utf-8?B?cTVXWTllMHVPNkpXU1hPRDdrWFlPaEl3MmtXdkwrOU8yQ1YyS2dEQTc4MzEx?=
 =?utf-8?B?a3pNT1ZLRDhyWlpVcWJOUUpOUlV5clRCcE1OK3dGTWxLNTN6TWxtUmlaUXRi?=
 =?utf-8?B?eTFqZlJjUDE3YkJjMWJicStlOGNKWWxSckZuZHA5aTRqRFpESkN5d1BjSjhw?=
 =?utf-8?B?bVpxdFVUU251RUFFemtaODdDUUt6eFE5bmM0Q3o5Yi9XKzVidnR2WjRXYzR5?=
 =?utf-8?B?ZnZhUGFhSzVwTmJBUmtSckFNc0tON1ZSYnE5Nzh6UDZJdHk5NzdEZHhMRktl?=
 =?utf-8?B?KzZlWFQ3dnFmL3BLU3FrcjFDM0xHME9uQWkreTg3VHAxL3FpQVI2ajNueDY2?=
 =?utf-8?B?WENpZ2NUQnpBd2xSWGpQZTlUdzFybENhYzVlRUd5di93MU9DZUVWNlpMazJ5?=
 =?utf-8?B?L1d3Q1pMSWYreDZtTHRCbDBuNHlmMGJ3clg5RkxjQ000Wm9mV3dNVFIxckFz?=
 =?utf-8?B?a1dYNzFSVklhYlNWTGhMUDJkMkUwWThoVEUxSlZTQUp1Qm9vazQ3ZDF4eWl3?=
 =?utf-8?B?eThuODRqMUxON09JU2gyM1lRc0JDQVlOeE9LTGtxa3c5dEhuQmtBV1g0YUU1?=
 =?utf-8?B?YmpMdWxaZmVPSHZDa0ZZMVZRU1duQkcyMk9OS0ZkUlNmSUlNMjN2WUlnOXJi?=
 =?utf-8?B?UkY1TmwyUk9uc3ZTS1AzVlh6b3o4Y3hOaVE3ZnhsdHJiL040VWxWQjVXRmdQ?=
 =?utf-8?B?VGpSTXl1eVBiZ3FiUGc1cFBjUUdLWHU2VDBHU1BlU0hGWFdnM2luRkx2K1VN?=
 =?utf-8?B?MWF5OHVvUXhmNFcrSjlyOC9qZG82MEpOWk5PZkVXNGZVblp4UGRFdW4wVEhF?=
 =?utf-8?B?VWkzLzlKQll5RDcxejV6WnpNbW9nWHhlalhsZjIxYnBrWUlKcHBOZzhRN1Ax?=
 =?utf-8?Q?YYydc6S6+jnJc+Jw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497d8be2-e013-4034-0dd7-08da43223ba6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 16:25:53.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFobUGDRhk3IXilUaC0Xp1NQ05/I0VYANZjYvdXvwi+b9lMaqLFrDrG1oPHXZfOC4xyKlBRhdtXfeKmNikr4zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2498

On Fri, May 27, 2022 at 01:13:09PM +0200, Jan Beulich wrote:
> For vendor specific code to support superpages we need to be able to
> deal with a superpage mapping replacing an intermediate page table (or
> hierarchy thereof). Consequently an iommu_alloc_pgtable() counterpart is
> needed to free individual page tables while a domain is still alive.
> Since the freeing needs to be deferred until after a suitable IOTLB
> flush was performed, released page tables get queued for processing by a
> tasklet.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I was considering whether to use a softirq-tasklet instead. This would
> have the benefit of avoiding extra scheduling operations, but come with
> the risk of the freeing happening prematurely because of a
> process_pending_softirqs() somewhere.
> ---
> v5: Fix CPU_UP_PREPARE for BIGMEM. Schedule tasklet in CPU_DOWN_FAILED
>     when list is not empty. Skip all processing in CPU_DEAD when list is
>     empty.
> v4: Change type of iommu_queue_free_pgtable()'s 1st parameter. Re-base.
> v3: Call process_pending_softirqs() from free_queued_pgtables().
> 
> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -147,6 +147,7 @@ void iommu_free_domid(domid_t domid, uns
>  int __must_check iommu_free_pgtables(struct domain *d);
>  struct domain_iommu;
>  struct page_info *__must_check iommu_alloc_pgtable(struct domain_iommu *hd);
> +void iommu_queue_free_pgtable(struct domain_iommu *hd, struct page_info *pg);
>  
>  #endif /* !__ARCH_X86_IOMMU_H__ */
>  /*
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -12,6 +12,7 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/cpu.h>
>  #include <xen/sched.h>
>  #include <xen/iocap.h>
>  #include <xen/iommu.h>
> @@ -566,6 +567,98 @@ struct page_info *iommu_alloc_pgtable(st
>      return pg;
>  }
>  
> +/*
> + * Intermediate page tables which get replaced by large pages may only be
> + * freed after a suitable IOTLB flush. Hence such pages get queued on a
> + * per-CPU list, with a per-CPU tasklet processing the list on the assumption
> + * that the necessary IOTLB flush will have occurred by the time tasklets get
> + * to run. (List and tasklet being per-CPU has the benefit of accesses not
> + * requiring any locking.)
> + */
> +static DEFINE_PER_CPU(struct page_list_head, free_pgt_list);
> +static DEFINE_PER_CPU(struct tasklet, free_pgt_tasklet);
> +
> +static void free_queued_pgtables(void *arg)
> +{
> +    struct page_list_head *list = arg;
> +    struct page_info *pg;
> +    unsigned int done = 0;
> +
> +    while ( (pg = page_list_remove_head(list)) )
> +    {
> +        free_domheap_page(pg);
> +
> +        /* Granularity of checking somewhat arbitrary. */
> +        if ( !(++done & 0x1ff) )
> +             process_pending_softirqs();

Hm, I'm wondering whether we really want to process pending softirqs
here.

Such processing will prevent the watchdog from triggering, which we
likely want in production builds.  OTOH in debug builds we should make
sure that free_queued_pgtables() doesn't take longer than a watchdog
window, or else it's likely to cause issues to guests scheduled on
this same pCPU (and calling process_pending_softirqs() will just mask
it).

Thanks, Roger.

