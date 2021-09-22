Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7E74143A0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 10:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192237.342580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxVt-0004OA-44; Wed, 22 Sep 2021 08:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192237.342580; Wed, 22 Sep 2021 08:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSxVt-0004MK-0a; Wed, 22 Sep 2021 08:21:57 +0000
Received: by outflank-mailman (input) for mailman id 192237;
 Wed, 22 Sep 2021 08:21:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSxVr-0004ME-4J
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 08:21:55 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3f31747-cd10-4295-a5cf-4c9efeefc486;
 Wed, 22 Sep 2021 08:21:53 +0000 (UTC)
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
X-Inumbo-ID: d3f31747-cd10-4295-a5cf-4c9efeefc486
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632298913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=KvlRs63Cx+Jvx4nNBqIkILrlJjUxHNtbkim4lAXRCe8=;
  b=c+gTB/FRcbo5acUYLMpatTJm5x98BGAYMSy+Q67Te4cqGfiWilAgi1Lz
   kwFHGWGW3G230pWIud+rNwUV6wY7gil6AKSm5TF/gXlTqyib5EQsWtbVz
   +pc3208rajXTXpBpi04c5cqhtrj9amN52kqmAv1xNl6pwA5B6SfoGMQOF
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: IDblU9qmfXikEPp8GctaHMIy18ZtDSb5xCLFEX0CVudyjJix0RqPbadI5AgIvonUTL52uvlhl4
 a6ex4/Vfcv3bwX8e2M5zoMW94MxKbUoMJnrWiuJKSM1aj/eGQlQI5ZPLr4qeukeWTaTVlEcg/b
 2ZxHdkHhiB7nqheC9sesO2Rzmk6w0xqz7sjOWFiVMTuOEulNU46IxK/FAXAjxK0Wx3uxNVrO91
 /FBCzjb3Lzy0eqou1TpJxRy75Gn9fS0b3V5kOWgj2TK96MQsRmHiak8FHiJWJqP4+dPGvBvOXY
 8HU1BWgknW8uGpOpTPBYKEvl
X-SBRS: 5.1
X-MesageID: 53315430
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Uidazq3ONy1j7cfDBPbD5cp2kn2cJEfYwER7XKvMYLTBsI5bpzEPy
 mZKXmDTOPnYZzfyLdgiaYnk/UpXu5XWmNMyS1NtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywbRh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhvdt94
 Y9f7sSMYzwLYaLsveg2cDlHHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIQDhWps3Zgm8fD2Z
 ZAhYyFMK076eSZdZVlJOYMgvriIiSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1UgUSwt
 m/A537+ABwRKJqY0zXt2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQgnWIl0QOAIJsOdYYtw6t76b/wCaGCT1RJtJeU+DKpPPaVBRzi
 ATTxoO3WWQ22FGGYSnCrebP9FteLQBQdDVbNHFeFWPp9vG++Nlbs/7Zcjp0/EdZZPXOEDfsy
 nihqCEkjt3/ZuZaiv3moTgrb9+qz6UlrzLZBC2MBQpJDSsjPeZJgrBEDnCBtp59wH6xFAXpg
 ZT9s5H2ABoy4XSxqcBwaL9VQOHBCwm53M303gc0QshJG8WF0H+/Z4FAiAxDyLNSGp9cI1fBO
 RaL0SsIvcM7FCb6PMdfPtPqY+x3nPeIKDgQfq2NBja4SsMqL1HvEeAHTRP44l0BZ2B2wPljZ
 s/EIZjzZZvYYIw+pAeLqy4m+eZD7gg1xH/JRIC9yBKi0LGEY2WSR6tDO1yLBt3VJovdyOkM2
 9oAZcaM1TtFV+jyPnve/YIJdAhYJnknH5Hm7cdQc7fbcAZhHWggDd7XwK8gJNM5z/gEyL+Q8
 yHvQFJcxXr+mWbDdVeAZEd8Ze69Rp14t386Y3AhZA76x3g5bI+zx64DbJ9rL6I//eluwKcsH
 fkIcsmNGNpVTTHD92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7D5j1HVW5sOQQhmHf36UvP3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiK3Y/YekF+xyQhhTE2XBtOvkMCDb+iyowJNaUfbOdjfYDTum9KKnb
 ORT7vf9LPxYwwoa79siS+5mnfAk+t/ih75G1QA1TnzEYmOiBq5kPnTbj9JEsbdAx+MBtAa7M
 q5VFgK25Vld1BvZLWMs
IronPort-HdrOrdr: A9a23:5pA90KiEJv1Q1kTtcQFfJpbfs3BQX0t13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhQYtKPTOWxVdASbsN0WKM+UyHJ8STzJ8+6U
 4kSdkENDSSNykKsS+Z2njALz9I+rDum8rJ9ISuv0uFDzsaEZ2Ihz0JdDpzeXcGIzWua6BJca
 Z1saF81kWdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L52gkBrsA7ciYsV9MOOA42e7rANoX8e2O+DIusGyWTKEh+AQO0l3fW2sR/2Aj4Qu1D8HMN8K
 6xJ2+w81RCIn7TNQ==
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="53315430"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhLjhOMPDYiYOtBcyO2HEUeAYNvrcM5dhfeIUy+QLs7kaEWe52aTLcv4WaG93gCxtCIQ6StY5BuQArA8SbQ4BhUEyp9QAejSB3M9GcWXiMhwoNcki+culN/MWcxKZCqgKsDDvYuerfuji2/JWJiZXvXyRlXrsUp48JcBCJ1tQNh6AJ+wgZgUk7ONi2o0At/C/2ufiDiARIw1ta796cSd6p2XVple/2gJtiv0LnlkNEL+BowmADNKy8reIDMiRhAgLHZQlQikVmM97+DlxL60lTc16DVXT9R6qOUjhgYPCvEl/NxL3JiKwvyv5CvCMElBy/WNvVx6PGGPT5rAPsAlhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=p6U9+CcoG+mX2fECvTxGB38bv2Hcg2ZxfYzHOKtfzAE=;
 b=W6AD/rIiqS1Wdj9hwk2VvkOfrh4Vf0jCKuByWPSvg0fEhXqbwaTsO2WamWaBWnQUMqdwgX6zqx8mRV3bhfOGoYxACqfYWj13vx2Z2Z+k5QDnR3L/JQ5cMG61MexAq1y9lEpZHXU0OfIDNr5cCqo4wvVdY0yrBK0EsSCTLCBzLsvuswmrt68GS3hLsCT7H3T2vbCafpsaNHwzKSXysPMdJ5flMgO+oj2SA30BkHS2ORFyaGGFrmGJYSojSXbX2ot3nsAv/cTEFUt9xkW5moRVBHR9krxtz3+qF3m86+sX3YSM7WSw4pYsPi9b61F/Joi2ndUhuf3o4eYH+dEx1j4yxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6U9+CcoG+mX2fECvTxGB38bv2Hcg2ZxfYzHOKtfzAE=;
 b=QDWXLIz5g7Bjj82bvzImjkxuV0oXOJZn8vdK7+W3op157Ds2cpG73W/oymE7nh0Ju/5E38Zl5pjajwnZ418hh947+T/z234qYkfjnAbBaAmjx95Ew0UAB8fjWb2asvN0HGxJteFqSHoErU4jCe9y9AB8xN+fioQ5gVS9a4FCCyY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/6] tools/console: use xenforeigmemory to map console ring
Date: Wed, 22 Sep 2021 10:21:18 +0200
Message-ID: <20210922082123.54374-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922082123.54374-1-roger.pau@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::30) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5fcaec7-237b-49fd-71f0-08d97da205ff
X-MS-TrafficTypeDiagnostic: SN6PR03MB4015:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4015C8DF3B853672F2A472448FA29@SN6PR03MB4015.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TqDweZTz9JMoOtoEKoQPx6jqGFJUZJwquY9EgHbXTho4ZHCMjM18dJikjti3MYe8no3nHpDit77I7Ey399vRgY3p5LRQFO3oB0g9sc2lOUqjpF/HEcQ+zir12bkaOXHgvV4h0jqSJHnL4ENldXxWcqX91q4Yg5gIERvlgjs0OF3Oxz/J7nG+wak9plZLQsNAcBgg3ECwr9BSCq7domv1ENabkgHrV9Zth9BDTjYYi+GoywV+jjYLPKFhz6ohPU3bONLxILsjsPzSHZi234zOTiwZeiUu/ywMrNuucmFn6t+3F2TsrW8G7YgOcLEIcJDQXFXIP0psDVJVdrSk8qdhLvCfg6umAzGIkA8LO3A+yjvVydmEyW3pe+hvim8EPuUfqf04uX7RvRv9cHI34VtPUyytqtEiV4z1sR7g3Ez44buEOtpPgK7vIHp7DD0+aukEt5jToGhZ082+Exlz4IsLNjcgTtnKTJr9obHi04sGqn8GKetPY8rcmLHYuZ5aNyofdhy+xv3bxBrDThpogKSFdI001oj2tY7AWF+aOXqacOO0Dp7O+3onS3TkY6OK+bc42/R/yUIrjAwF4JpBTLioFjFI8BzFpBcHT8AKzczaEZKwG7nJVUE2KdJYu1FtpsTNPaU8h6Og5Lve36s08JJ0EQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(66946007)(4326008)(38100700002)(8936002)(186003)(956004)(86362001)(2616005)(8676002)(508600001)(54906003)(83380400001)(6496006)(26005)(6916009)(2906002)(6666004)(5660300002)(1076003)(6486002)(36756003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bElBQStZRGRBSWhZWlVUZTF3NTZZQzlSUklIVmpVRCswSE9KTVlxRmJXaUdh?=
 =?utf-8?B?QjkwWmZHYk1sczYya1MvQjlXWmx2VHkwSlorTTlPaWhJYUJtb1ZXdUZzK3JK?=
 =?utf-8?B?NzNuWEIwRkdyaVBjbEJFaUpVVVB4bWtHVjNsUGg3T1RYWjVab3pPdjVZODdq?=
 =?utf-8?B?MjVhMVk4akpOSUwzQXBKMVMxazNKajdxcVFycmE5bHA3R0FsYnF4aXY4d2FT?=
 =?utf-8?B?RmxZVnM4K3N1aGNtZ2ljZnhEdlVUUXFVOXFMdCtjejY5cGNZb1lUM3RTNDFK?=
 =?utf-8?B?LzB5bUhSL1paa3FJRWFidGhDNXVwcHB4S1kxYk1IdFhBejM4WkNjTzZaUkxq?=
 =?utf-8?B?VDBnMnluU3dDVWpnTXlWTVEwZGdlOUtGREZCSWxpUkhGRFJOb2JIQWJjK1N6?=
 =?utf-8?B?UHA5ZUcwQnFtMlRuckhEOWdNN3RtSndGbGswS0dpVDZPdWhwekM4V3A1emRZ?=
 =?utf-8?B?Wkx4UHNJZ2RnVitsVWpUdG5lcnRYYlVGSFF3WE9YaTZhMDdrR0J4SkFkMGxY?=
 =?utf-8?B?M25pRW9mNXlNUXFnZk5qTm1vSFlYT3h3Q1ZNaytSM3JYRlJwM01YMXZ6dW1r?=
 =?utf-8?B?UFh5VGZTTVlTd1VuMWVFOW9rZ3k0eHpJSXRVeHczeDNra2hlNHVUU1NteUFC?=
 =?utf-8?B?c0xHcy9xdHhqMHorcVZSV25FYkFFMGQ4V2xXelpaM0svZk05OXFyQjV0bEti?=
 =?utf-8?B?bVkxTXhoMWJOU2cwbi9XWjNKc200Z1FzUzRRM3NGbmVLMElxQkRodFl4YW90?=
 =?utf-8?B?eXQvQjViL3lXS0IyRjVEOGFMREJVRjE1UmNwOVdpSTZyZGF2RmxCRVB1RlY1?=
 =?utf-8?B?MlI4YVNQdEpHZE9TWDJlVzJaNHd5UGRIeEs0YTNROFRUVXdVRWtSVmpUcjRW?=
 =?utf-8?B?Rks2bXhSanMyOHZ1Z0RjR0c4NTRoRVRmRnowRlpoKzRqRE5qbldKTGNxY3Vw?=
 =?utf-8?B?WDczaHVFSkZhVWFPVW9Dd1J3V25VbXdNZkRTZU5XODVnU0FYSEU5UjNPUDht?=
 =?utf-8?B?TkhROXdBNEw1UDI1cDVJaCtLWTVDM2M1d01WaXpDb0RoNlNkRXlHQ1FVUk9J?=
 =?utf-8?B?UEhUZUNnVU5PbTZKMjI0bHhqbUZHeGNhS1pRNW5MTHFTUUZmcExzOXFRTStn?=
 =?utf-8?B?WjBLdXB6bSsyelkxcDZqZHdXSVlRaVdjeXBZeGRoQkRKRU1vR0ErNWEzekZN?=
 =?utf-8?B?UUxFV3hCWTFUVys1V1VoM2ZESmY4Rm5JRHFIVnVNZ0pjMG1lckZvQ1huNklr?=
 =?utf-8?B?R3ArM3g2c1FPSzljNUVwclc1OC93ZjVzbTN3L1VoM1FCbTdtSFVaR2F5SklJ?=
 =?utf-8?B?TllHQ3NRZEd1MTdXbTIyRFZFcFBxMGEvZmpiRFVacDBhcmxiYWRtUUNaTm1u?=
 =?utf-8?B?WkdzZlBwUStsT0JhbEZGWVp6RTNHQ28wT0xld0RZZkp6cUkweWRZbHhJeE14?=
 =?utf-8?B?UTQ0SWFTbE0yUDdxMzZmcFlLZy9yNldacFg4dnlQa0R4ekJ4ZVZJb1pUaFNL?=
 =?utf-8?B?NWxBRWlhMklMV0lmUHR5b3A0UTBJZGtiV28vM01NZnB2UFozVm5JbEVTTW1F?=
 =?utf-8?B?UC81S3oxNUFVS3RpOG5JR3lvTEx4SEJMSVNPZlBSclY3N2JwRjhqdG1Wdzhi?=
 =?utf-8?B?QUFVb2cxUUlZRmZwTzBsZElmK0Y4d1pjaVFkODVyYVptQUN5Z3QzczVvUHpo?=
 =?utf-8?B?dXp2bnE5U254V2daU2hvdHBMQkRZeXhmbFQ1bXJqcVhkNDJkY2R0VVVlZVBY?=
 =?utf-8?Q?Xrg4guZefYCRcFiSznnWCSQC9fRHLGu6NDCKDR6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fcaec7-237b-49fd-71f0-08d97da205ff
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 08:21:49.0452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dMTkd1udyg6R+er5SXbtfgoY0j7YbR5kiIxnCiCuvwJaetRkpy0LTNTiNynxyS4HC8hqc/DiE0Y2+N+R1umYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4015
X-OriginatorOrg: citrix.com

This patch replaces the usage of xc_map_foreign_range with
xenforeignmemory_map from the stable xenforeignmemory library. Note
there are still other uses of libxc functions which prevents removing
the dependency.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Ian Jackson <iwj@xenproject.org>
---
 tools/console/Makefile    |  4 ++--
 tools/console/daemon/io.c | 25 ++++++++++++++++++++-----
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/tools/console/Makefile b/tools/console/Makefile
index 84796eac8f..3f4cddab03 100644
--- a/tools/console/Makefile
+++ b/tools/console/Makefile
@@ -29,9 +29,9 @@ clean:
 distclean: clean
 
 daemon/main.o: daemon/_paths.h
-daemon/io.o: CFLAGS += $(CFLAGS_libxenevtchn) $(CFLAGS_libxengnttab) $(CONSOLE_CFLAGS-y)
+daemon/io.o: CFLAGS += $(CFLAGS_libxenevtchn) $(CFLAGS_libxengnttab) $(CFLAGS_libxenforeignmemory) $(CONSOLE_CFLAGS-y)
 xenconsoled: $(patsubst %.c,%.o,$(wildcard daemon/*.c))
-	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_xenconsoled) $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) $^ -o $@ $(LDLIBS) $(LDLIBS_libxenevtchn) $(LDLIBS_libxengnttab) $(LDLIBS_libxenforeignmemory) $(LDLIBS_xenconsoled) $(APPEND_LDFLAGS)
 
 client/main.o: client/_paths.h
 xenconsole: $(patsubst %.c,%.o,$(wildcard client/*.c))
diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index 200b575d76..682c1f4008 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -22,6 +22,7 @@
 #include "utils.h"
 #include "io.h"
 #include <xenevtchn.h>
+#include <xenforeignmemory.h>
 #include <xengnttab.h>
 #include <xenstore.h>
 #include <xen/io/console.h>
@@ -73,6 +74,7 @@ static int log_time_guest_needts = 1;
 static int log_hv_fd = -1;
 
 static xengnttab_handle *xgt_handle = NULL;
+static xenforeignmemory_handle *xfm_handle;
 
 static struct pollfd  *fds;
 static unsigned int current_array_size;
@@ -675,7 +677,7 @@ static void console_unmap_interface(struct console *con)
 	if (xgt_handle && con->ring_ref == -1)
 		xengnttab_unmap(xgt_handle, con->interface, 1);
 	else
-		munmap(con->interface, XC_PAGE_SIZE);
+		xenforeignmemory_unmap(xfm_handle, con->interface, 1);
 	con->interface = NULL;
 	con->ring_ref = -1;
 }
@@ -722,11 +724,12 @@ static int console_create_ring(struct console *con)
 		con->ring_ref = -1;
 	}
 	if (!con->interface) {
+		xen_pfn_t pfn = ring_ref;
+
 		/* Fall back to xc_map_foreign_range */
-		con->interface = xc_map_foreign_range(
-			xc, dom->domid, XC_PAGE_SIZE,
-			PROT_READ|PROT_WRITE,
-			(unsigned long)ring_ref);
+		con->interface = xenforeignmemory_map(
+			xfm_handle, dom->domid,	PROT_READ|PROT_WRITE, 1,
+			&pfn, NULL);
 		if (con->interface == NULL) {
 			err = EINVAL;
 			goto out;
@@ -1341,6 +1344,14 @@ void handle_io(void)
 		      errno, strerror(errno));
 	}
 
+	xfm_handle = xenforeignmemory_open(NULL, 0);
+	if (xfm_handle == NULL) {
+		dolog(LOG_ERR,
+		      "Failed to open xen foreign memory handle: %d (%s)",
+		      errno, strerror(errno));
+		goto out;
+	}
+
 	enum_domains();
 
 	for (;;) {
@@ -1462,6 +1473,10 @@ void handle_io(void)
 		xengnttab_close(xgt_handle);
 		xgt_handle = NULL;
 	}
+	if (xfm_handle != NULL) {
+		xenforeignmemory_close(xfm_handle);
+		xfm_handle = NULL;
+	}
 	log_hv_evtchn = -1;
 }
 
-- 
2.33.0


