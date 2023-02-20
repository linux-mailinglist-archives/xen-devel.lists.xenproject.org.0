Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249669D62E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 23:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498406.769266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUEOQ-00077R-Vd; Mon, 20 Feb 2023 22:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498406.769266; Mon, 20 Feb 2023 22:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUEOQ-00075L-Rr; Mon, 20 Feb 2023 22:12:18 +0000
Received: by outflank-mailman (input) for mailman id 498406;
 Mon, 20 Feb 2023 22:12:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUEOP-000753-EC
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 22:12:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0bea1c1-b16b-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 23:12:15 +0100 (CET)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Feb 2023 17:12:08 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6121.namprd03.prod.outlook.com (2603:10b6:408:11a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 22:12:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Mon, 20 Feb 2023
 22:12:06 +0000
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
X-Inumbo-ID: a0bea1c1-b16b-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676931135;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0yTJzDsMslstLixdZonO67454OOLovjj86hvtJJqeEo=;
  b=Im2HkCl2U8XmFYervE+Zw/GBxULpIXZclh08iNO334wZF2xD3GI9H8qE
   vRKzUFqAU1szxWZ2n+2W67EKoewOQhX++xfqfGbGNxrmkveDxmbYvK5aY
   VJ9q5q/g/CFE8Gc8b2xNUvXUO9rKaX4N2bhbkLA/lnlH1u7MU5n1ntohY
   M=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 100222667
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3pTfq60J9Plgl4VLHfbD5elwkn2cJEfYwER7XKvMYLTBsI5bpzVRy
 mROWW7TOazeYzfzfdF0adu29EICucPSzIRgHFBvpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gZkPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfB1xnr
 dc7Ciw0Tk6Hp72U/o2LdeVHr5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFYZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjANhITuPmqZaGhnWM+V4YGA87WWGxpMCI2kiAAvB0F
 xwLr39GQa8asRbDosPGdxelumyNuhkQXMVZO+I/4QCJjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+Wpz6vPSkeLUcZeDQJCwAC5rHLv4Ubnh/JCNF5H8aIYsbdHDjxx
 3WAqnc4jrBK1coTjfzjpxbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzkRhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:9WzPLKE2WzsC9iXDpLqE+ceALOsnbusQ8zAXPiFKJCC9F/by/f
 xG885rtiMc9wxhOk3I9ervBEDiex/hHPxOgbX5VI3KNDUO01HGEGgN1+rfKjTbakjDytI=
X-IronPort-AV: E=Sophos;i="5.97,313,1669093200"; 
   d="scan'208";a="100222667"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeTbhuJo0ZwfJFjTlNSXz5XcL+diBkaUS0eSC3HUCVydJlVNbp5iTa2Q/BiBJOwsLGTkcl3byYH7KIffsIM+jh7cMffeGrW3g3vvwi4prcx+QvihC2JRUZwjFwrMabcLh6QyLGySDJtGL5htTDUtCg3GGLr1l6L25Q5Vno0SAUO3knCtBDuUNJfkaUH6hntWY93BBgjLKXtLE3U4V5dK40YYeEAD5wZH+Vo3lw0xYMdOksECMbHaQrptNATe4R54WUZzX4CMl+mCIzuZ+Wlx0eIO4hr8fwAXtJNumCHqwQOU/A5UUnxehpCAgcPfTWCwYyYlLFxNh1LYvgvfmbF9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CZ9xh4uPgpeeBH6akqmJ0HUOpbOWuDJAv/CjYdHLhU=;
 b=L1dSQQqLo/P71lc35dsosRrElOLhornx7SD66d2PGpT2o8sg9EGHrAUBGnBzDkgN/aRcY9YISjHgMQM1S4ZeFIbH6e5TVSlz1dDoJRp9c2PF5qYGeNfBgmUXONmJ8WEqsiGPm5mwpxe9PUocflz4cMEtVv//tCYWbX1iXYJtY5bfDfGf/YIXOGpsFcijiBKE2mQy+59Ydz6XznWVu6WohZgc8MKwwi/Xzf7cQzZxZlx5SK7KZsTT29hNCu6mx3TgOfVW5kxLh2TDOLgtx+moJ1nTJu495kBWrPXWzrq2ke/XHqriQesELRQQ9UuFoG7kkaKFQispUsV5f7dn5JjE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CZ9xh4uPgpeeBH6akqmJ0HUOpbOWuDJAv/CjYdHLhU=;
 b=V+6V/iCpck9mXDGXnmtR0K74SaBR45BzTGTF9uOkvSo9g/R+pU9CpqxmjQzRV03P6BfG1n+2BnJTVDL7VKX4RizHLtCWQ7Czf6B1Awd+q0nKVQMFvegFJQQy1vR6GCl/pNeOLGMnEYT5Agwex0Rl4+JhAIYECl9ujUbjJScX1Xs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0f35ee23-c6f2-9015-4328-266baf287156@citrix.com>
Date: Mon, 20 Feb 2023 22:12:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x86/svm: cleanup svm.c
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-2-burzalodowa@gmail.com>
In-Reply-To: <20230217184814.1243046-2-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0150.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: 172468eb-3e8f-4f59-027b-08db138f8099
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jmCX/RE8fQzBgITAr7/E606bYgtriBRyC1zPd5OwkjScaaWIquavG/V3bp07OY9E2Bdwah0DtHry9TpwrDHQU2BfdfjTev2KCeWK87VdhFqZQkyIDaVB5j6IpIXitCxdGMoP2D6BxtfxumbSl1I2ZRklFklzNLZ2YpGHeu0fCXfbx+262bJQSSp4Gi4TmSvzjEqeOZ3SdF/3MizQ84pnNGdgCBz0oslqOgZoLgV+gQOd/w1DSMm3zqW1MKIC0sSK0OfydYXQjEHXuMcLj3HXjDJkFIvCb9wJhmh16d2kwq/6+zoW3HPLv/0PTC0+HzPIT51420wZuSQuhtXcUafu2mxKBnl9BH7EL9/fvQKkR0p+LZmew53fL67cjnSYhnsxc2BFRrxVLoU5JbH+XBjK4jIYwhJP6WhmO2/+IuPL9Fl+Rl9Senn9opbimSLN0OaFkHDtigI12KPl2CktHkfpmoSt8E00CdxgrRrBs/X/fZoT/SVmRMZi60grg1n4ud+yKs/AIHQYTPnRdZsmUKNE9KEcGYTpj70FVeYMjkSQDQOLOCeO6ellLyXktIs0jfkQrNlmweJp9bEGLF2vdHLO8c8GX5x/kx8asPOgCGsg80EJQvLAqVZchCLQMV6D7qM5N1bXGxpGIU+5l/WZ5BGWfvpC7k7AenajfhneukBHdc0qusf60SZK+9W2I81FP/mUID1huIqCHxmikKdBDy3jgasOSJtAtM0tpICzAbSoHTc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199018)(2906002)(86362001)(31686004)(82960400001)(38100700002)(6486002)(41300700001)(53546011)(6506007)(186003)(6512007)(478600001)(26005)(36756003)(31696002)(66946007)(66556008)(66476007)(83380400001)(54906003)(8676002)(316002)(2616005)(8936002)(4326008)(6666004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDl2d0NxNjI0b1U3d3JWU211YVhOMjRReW1DSXI0cnRBNWpBMDVPQUdvV1p6?=
 =?utf-8?B?dEdwOSttdDZRRHBDYWtJa1lHQ2RsQTExQ2I4eW5UN3pZWldQcXJ1SW9GWkR1?=
 =?utf-8?B?eHFYa2kyNHpCdFZrL0NSVEJoaE9TdmJSWlVDZW1UQXlnQ0g5OHRuNjRnWU55?=
 =?utf-8?B?Y0F4ZGczNEtyRDVJK0FDR1RlWEd2U2hTV1BDemo0YW0zMlJJSUtYZGdwV3NO?=
 =?utf-8?B?Y0hxUTRJWkFVMzB6VjhXbk1melRJMmJOMmRiWHovczI3TW9HM3UxZlJsVnpo?=
 =?utf-8?B?aTlSbzJkQlBrRkhXN0MwWVYzR1QzaWpwejZySWthNW1MZmh3Vk1UckgwQ0hY?=
 =?utf-8?B?dnVsWGE5YW1iQ0xPb1FaK2FKdnZvV1JjNTFJYXl0WVpQZ2dWV2ZVQm0xODdH?=
 =?utf-8?B?dzM3dEdTN0NRbDRuVzI2SzNXYTJiZGgyTTdObno3MXlUbzhuN3dBaE5ydENS?=
 =?utf-8?B?dnM2Y1h5aTUxRkRiMncxUTRBQ1dKR28wYTdieU9hU3dxbjNEQ0R4anlmYnBk?=
 =?utf-8?B?SDhEUGZuRTJvUzJJeXYwWllwNklBcUdKN295K1dtdFY0QXFFU1hjWkJ6a1Vv?=
 =?utf-8?B?dncvMklxR29vdnN5T3g0Y0RQKzZibkwvWnB3TDg3OEprSEoyM3hTTXBld0pn?=
 =?utf-8?B?NkVxOUIxVnBZUmhwVVVPcnpZdXFUQnRJSFhKaFAvcHFkeHNQaEtUWDZ6Vmph?=
 =?utf-8?B?SXRTWElwVUxBYXVmMjZ2SWd4Vkd6V1RxeHJUTlBMSm16dWxFYVhCQ2RsZUti?=
 =?utf-8?B?eEM5NGpJTS8rYUNDNkVvOFI0a016VDM2UmtueUhYYUg1UWl1cThXWFB4bHk5?=
 =?utf-8?B?VTh6S1BzZ01GNTYrTzJyaVpCYm5zVnJPenRBS2xJbnZjVW9wS25ZdEYzSnpj?=
 =?utf-8?B?MUdFY1lFaDY2S1k0RmRkMTFDNVh3bzFUNXhObE45NUsvV2d2cHdCaFlrWFM3?=
 =?utf-8?B?UnJtakFneldoY3N5eENuWmZaUW5CeWdLQVUvRkFuQ2dZbE0rdkZtRVFnRldW?=
 =?utf-8?B?Z0VXYU1ZS0dWc0xySWoxSWplSThQTUxrUkJlT2R0K2x1MmF1akdVUzE4bkh4?=
 =?utf-8?B?bE5ycVgxajRIYzRPemdRdElPVEdIK25zUmZCRnBzMXcyS2xXTWtZd0hDTGFr?=
 =?utf-8?B?SExIK3I1ZWV3Y0tEZ3lQVlpiL1NvS2kyRkJrOVBMV1JmYk56V29oY2U5T3Ba?=
 =?utf-8?B?SmQ1U0tEQmFXNlJmcEhEeXorK3lFVEx2OGJDS0tKbi9wb010ZFdWVXhZWHJD?=
 =?utf-8?B?Y1IzcXVGWkREYXE4Ym90ZWNvNHR3SCt4b0FtSnA3elBHWmxSeWZzSGJacTdP?=
 =?utf-8?B?MGk1SE8wK2pOb1JLRDNDWnVqWWJQUjBsd1NxMXkrbW9WbHFGWG1YTmM5Q2w4?=
 =?utf-8?B?MzEwelRwc1RxUlkwTktibTRHV3IwL0o2NG4vOE1ORkRKSE9WYmo5U1FEY0Ny?=
 =?utf-8?B?YW1XZG1ONk12dnZTbjB4Vm9lUm5Uc0dQOC9yQUZxa3RRRkhTc0VGYVE0aEJY?=
 =?utf-8?B?L2F0SGdreXpDVWRkSFlXV29XS25KMjRjT1l4OCs2MkM5dXNFdXkyczJ2cjNL?=
 =?utf-8?B?RWQxSFkwN1FUTEU2MVdraHRZdUdPUDVTaEd4MFYyOFJ0eU9Eem81RGJiTFB0?=
 =?utf-8?B?V3UwTXppQnJ1RkxqOE1kbmxDcGt4NVZRdEs3QnRGWXFwcm1BUGF1UnA0R1do?=
 =?utf-8?B?THNSUmxaanRFcmY0RHU5R0ZwVkQybldzdlR0L1JrVUZ0bFEzdkxpNHRSTzlm?=
 =?utf-8?B?amFFdThwVHFkVS9iakJmS2l5cTFhK05qc0loMDZ4eWRzSWZXN0RlVk1FY2RR?=
 =?utf-8?B?U1NpeFhiOStQSis5d2JLQVhDcUU2Ukd6Zmc1QU1UV3FuWGR3aGphYU5kMmVT?=
 =?utf-8?B?RmQrYUlEUGFzNzZIVkpHaW8xandrMjltSnQvUjluaysvWTg2U0pXVFlDd2c4?=
 =?utf-8?B?eUdnY3VlZVlTYnJkK2h6dm9MU2xpczB0bFNnODU5dWhUeXk2UEhjNUN6QnZH?=
 =?utf-8?B?Q2ozL0FBYTZPQlJERDAvSDAxUW1nQjhhTG9tUXFxNWx1bHR6RjNuWkcxWnRa?=
 =?utf-8?B?RURQK1FXMDBPM2MwcVFnWFRYU3BOOHdVKytQUCs1aW1meWkyczNSWGhrR3Rx?=
 =?utf-8?B?MXlMN2dCWm55dDN2VS95WFcxeHp5UnlHU3poVVlrcnlKNExTTTVVcFM1THlu?=
 =?utf-8?B?NWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3GDDJBeDkvO5IxTHt7Orldgpqz1sxGDqIflPqeRgF2dd3TEKsoYl/gkykVG3ZU7DZnlB+qnDmognJUHvuKonyr8jXGlmN0yKqhVsqwzCpwEYdK3wOjYxQxj0cvfD751IbFsgC9v9u3te9uq2sMzL2oSm1SDsEk1sc6mwmDil/cHHRRplrsn2DjulycPD9ZvLTwJYamMgm8w5dHlb7H6onxL9VggW1PIRImS5Wy7DsrulTgE1QCaXW+98mfo40FiZsp20Ea28FI9ReIIcj1RTWUrEw7RQBQg7Al1QfGofA+lA9a9u6wfjzzjd4ZL8FuOOoueHnKrHkm6cq64JlhJbm5QmTezATkToi5AyR4ZoHuyOIuWuKVR5wfhbu/bzlnxadMyfuOcQXGcIBWsnEoZ7W4mCSjz+wpGv8x+10aqoBiXm2dCqGZgSmROWUYFJf7jWLWX08EEx2xVPP2QC3j7I3iVJv+XM/o3hC3SKdxoWFHZ8MFCHgjVFXJRglwFU30AJnTU1JmbMYEKnT/jNvQr/5D7l/m7o2+8V42Eq99Zfhruld+1aAFR6TnET68GTtzBvub2hRzkFxKSmbl2CDUjIvYTOlYMltzmaAJPsMT6+xbEwxcQUcM5O5KO7v8Bnj00oD1Q0H6iZFqE4sGG0Y776ELgTSo8PR1djzSGiwHUOhE4qoOKYPouDu7pYKNDMquEHAsxxNrKcF8zgs8KR8JieANhxhX7gWD4vnKZs7IEjNp90BkIGR5Us8cBN7I5uOi9pvwv8DWt3VW4JaJKXVGpSzCOswNZ7mXv/E/9H5N0vUT+I7DctIfUo2/DjuHb8f5RVk5gG3Vgj/feBxpsthNyawOVXuZ5itH4kjFJtko9JGWg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172468eb-3e8f-4f59-027b-08db138f8099
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 22:12:06.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdxZlWUFj8LRAZv/yiQGIeYCwsIsVwf8SpCwlbYeQslwJ+sXCY7sKT2jW+hRu3UEoW4i/mmBe1XzRzrUVxmAPP2E9qxZCIxVZC0x1mkR84w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6121

On 17/02/2023 6:48 pm, Xenia Ragiadakou wrote:
> Do not include the headers:
>   xen/irq.h
>   asm/hvm/svm/intr.h
>   asm/io.h
>   asm/mem_sharing.h
>   asm/regs.h

Out of interest, how are you calculating these?  They're accurate as far
as I can tell.

Looking at asm/hvm/svm/*, intr.h itself can be straight deleted,
svmdebug.h can be merged into vmcb.h, and all the others can move into
xen/arch/x86/hvm/svm/ as local headers.  None of them have any business
being included elsewhere in Xen.

> because none of the declarations and macro definitions in them is used.
> Sort alphabetically the rest of the headers.

Minor grammar point. "Sort the rest of the headers alphabetically" would
be a more normal way of phrasing this.

>
> Remove the forward declaration of svm_function_table and place start_svm()
> after the svm_function_table's definition.
>
> Replace double new lines with one.
>
> No functional change intended.
>
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

