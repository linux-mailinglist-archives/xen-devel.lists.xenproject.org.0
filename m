Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7345103AF
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 18:38:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314064.531953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njOCB-0003bx-KK; Tue, 26 Apr 2022 16:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314064.531953; Tue, 26 Apr 2022 16:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njOCB-0003Zj-H2; Tue, 26 Apr 2022 16:37:47 +0000
Received: by outflank-mailman (input) for mailman id 314064;
 Tue, 26 Apr 2022 16:37:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQU5=VE=citrix.com=prvs=10866150f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njOCA-0003Zd-Gg
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 16:37:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30d1c43e-c57f-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 18:37:42 +0200 (CEST)
Received: from mail-bn1nam07lp2042.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2022 12:37:39 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6453.namprd03.prod.outlook.com (2603:10b6:a03:398::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 16:37:36 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:37:36 +0000
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
X-Inumbo-ID: 30d1c43e-c57f-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650991062;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oRGEQ/a3qRcufvp+NQRpZn/g6XWsiVDMi/nMRlk52jM=;
  b=HZfdxcGWLmOTcMIEPy150zwG9jCbp6M2m63kuU1kMIL4AHa+kaDTrTXb
   +LTBEaO2p+5stGUYjJGtXqTq9fNkRWl+sx5fOxnhGcFWW8Ns94GB+Nc4C
   a5j5vu16la3wfRIfmsI0KGZmKd3Qt6D69/+xEqLkuOitF94/lR1gbsj/F
   Y=;
X-IronPort-RemoteIP: 104.47.51.42
X-IronPort-MID: 69367535
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1O65KKy0/lXvy+shR4d6t+dWxyrEfRIJ4+MujC+fZmUNrF6WrkUCm
 DZLXm/XbqyON2WnKN9wa4vi905UvZLTnIVqQVBrriAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY024bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpliIa6WA0XEJD3vN8GYzt6TSBzYfRE9+qSSZS/mZT7I0zuVVLJm68rJmdveIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeGuOWv7e03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrieuKGMH9QnIzUYxy3rqlQ9Pj//uC/PqZNiIe8xOo0WIn
 1uTqgwVBTlfbrRz0wGt/3OqnevCtTv7QJ4IFa3++vMCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySWosLVWhS5pDuOuEcaUt8ITOkislnRkOzT/hqTAXUCQnhZcts6ucQqRDssk
 FiUg9fuAj8pu7qQIZ6AyoqpQfqJEXB9BQc/ieUsFGPpP/GLTFkPsy/y
IronPort-HdrOrdr: A9a23:QTtTXqAzILuF7n/lHegwsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80lKQFmLX5WI3PYOCIgguVxe1ZnOjfKnjbalbDH41mpN
 tdmspFebrN5DFB5K6VgTVQUexQpuVvmJrY+Ns2pE0dKT2CBZsQjTuQXW2gYzdLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 529lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ5o+a87bWzHAb0cYa
 hT5Jm23ocXTbraVQGSgoBX+q3iYpxpdS32AXTruaSuokprdT5CvgklLfck7wk9HaIGOuZ5Dt
 v/Q9VVfZF1P7srhPFGdZA8qfXeMB28fTv8dESvHH/AKIYrf1rwlr+f2sRH2AjtQu1C8KcP
X-IronPort-AV: E=Sophos;i="5.90,291,1643691600"; 
   d="scan'208";a="69367535"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr+QLAheRvgXf0+hWQPfi0ac2M+1hC8/RFNZ9ZHNm0ka6jcsepO3Y4/94EKEh9aM6azSz/EpD2swTZ/CIGVeyUurvZC9XmIX1yRXOtmLUOhu9FS/zf+iayNRMMoiNGBcTzxF4XLbj4qhsm6b02AdwMtGCoGFRixb54leJd2VEmgC8insZVFF74NcJSV0lVP/KkbDlJ8ARfRkc1CLpUyydeHguu0lPSqe/tKaethEx6A2rYMLdxH6r0KDiwyMiQ+TJRIDl83hL1cVzp/BJf7SR3AQ2uDVxOCM2S32XlQFqd5WmnX8xBekGTI4kiU3j9uVdFF8CXErWldmQl8ACkmWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDw+djdBhuaVxWhxTwQI6KRWuP2cyo9PZ6Zor841pD0=;
 b=WOXvbgVvAd8QjouVxwkVA1CmSOmV4A1/Ul1xcHX8EpqzilFJgXW2FBRTi5aIRl2w4njLkEryz/uK82JQ53EcUxWcGMdeLgP61VFKtYIfuwk4LbKgaTJC3EhllgPnbEHL5L7TEfeKcyaJfY3UeDESd0YMZc3/9kpH3YvVHKyiKEjysVCYZu5yF85vivpjSErba7t5rHFC+Qehyq2ArPdHrPDoDdALsKXHjDi//2l/yFwWqXtOyg+N3rAxwX/XwXBZs8Ywwt5WRaf3Zb+AuM7WqPemR4SmV9Ynkya8qoWdGhoqo8DON3iQCgo7oSBCyNNTFyzeKyO14W3szqW8ExHeMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDw+djdBhuaVxWhxTwQI6KRWuP2cyo9PZ6Zor841pD0=;
 b=q0wXy4DIvH1mtgfech3x+9U4hFeGXdBpNu1tj9NyuSbJP5MgDYu+HgY274FZ2Vr9qSl+5SPKV419gALGNIV0ghPWmuis7LK64go/EhfFNJbxuld8A/mNlI6iMr+1URyM8tsEyGdareIqZBi14rnRO04R7/5LenXl91jpQ9UiRko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 26 Apr 2022 18:37:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Steffen Einsle <einsle@phptrix.de>
Cc: xen-devel@lists.xenproject.org
Subject: Re: DomU Windows Server Essentials crashes with xen 4.16 but works
 with xen 4.14
Message-ID: <YmgfyXXke4RYpXPm@Air-de-Roger>
References: <18bd542a-a649-c78b-b575-c62b4d533e44@phptrix.de>
 <YmeZ/8wtKJy7zzmS@Air-de-Roger>
 <8ec2423f-d968-54d4-4bc4-fd8ded3d1fa0@phptrix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8ec2423f-d968-54d4-4bc4-fd8ded3d1fa0@phptrix.de>
X-ClientProxiedBy: LO4P123CA0220.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f39361c-9491-4292-eea1-08da27a3121a
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6453:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB6453608F5FFAEBC55EA9FDC08FFB9@SJ0PR03MB6453.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yCK5dUR0r0KL6c20stm3lV+abQe2T5KOVAdrkYp59q8qFNWBDsL6iC5Qbe/IGYahI/WPyZOVaXzE6spyGLwEWAP2tHV2P8QVKUMdfozVQsgvEyyFct4BqoSI4sVS7sL0euiq9cQBtB8tjZQ478otSWaDyFyKrcV+tswYpvZivvSZCnrIU6emlDzzMawQalY/ku7dOY5L/+YtIm/zM6b1S5mPPuNOCOEJWuAi1Plv8wn8nRAaHFtaCfx4L5OZQWKSHr4FWg77u8NVAjoW0cspKt6DpTM8u7/F4BhN874vEth0G7ga7bgHhSFa8H1oA5Z/M3ZWdd8i0fOlXDAFVZ+a4LGd2uSVLvb8drBqV0ll4rUmRUWTCAprsAIXYtVDqddWswNcIaPF/od4RUsfQy1nzF4MSg605zF6AWvsYBJ1MDLSj2GBQRUBFJf1tx9LL0llHiXoGEz6HYluOTtt4KlkdFPXQYA4ZEMmzaBlNJtv+uzsuzUtdm2ceGu5sdM/gle1p6OL9NkPtZEmu+gNvpj8Hm/Rj81YiEIhd/WL/9sPLnjTv5rDoIgGmNdodgVU5NAB4TNUG8zsNQfzGT7BeFui+RmYqQ+pEJRA9v5JqI5kv06RU8Sh1ubjpo4VW771HncTIWPOpJGLPQrPLMgrekBF5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6512007)(5660300002)(86362001)(558084003)(8936002)(66476007)(66556008)(9686003)(6666004)(4326008)(66946007)(33716001)(85182001)(2906002)(316002)(6486002)(508600001)(8676002)(82960400001)(83380400001)(38100700002)(6916009)(186003)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU8wRzBYbnlGalNERGtEakdpWnEvK3I4VFF4RjdMeGc0RWZRT1JXd3ZjQ3A3?=
 =?utf-8?B?SHZ5S1huL2R3a2UyekRJZldvUUJNSEwrRXR5Wnp2YlEvUFcyK0FleitrVEUr?=
 =?utf-8?B?OXN3cmJYM1ZnaURCbjZGemhpb2wxSWM5YnBWU2hVNVQxblN2aXpBK0JEVmRm?=
 =?utf-8?B?bEtvMGZSSWg1Si81T25YcnVEdVpiK1BUTGRJY1RHSG0yUDNwSlhKUEtUUk9h?=
 =?utf-8?B?UUhQaUNOcy96ZndzY1BtaUZZN3BYMXFGaVhVd1lZRE8vZGdGQ0cxTEhOUWRW?=
 =?utf-8?B?RSsvYUZoR05WTWo2ZjV2U3NFdTFMNnI3NFFpY3JwVldvV2FSQ1dIamIyMXhB?=
 =?utf-8?B?L3dweHI1RlB2eFpYNExuUEwrWFk5eStvdFl3OE01RzFIdzQ5YzZUSGpHcFFY?=
 =?utf-8?B?b1hSay9JdkdUWkxLWEptL1JhQmpNQ2Z1bG5aRmRiU1NEWVRrR2pyTGJyOHBm?=
 =?utf-8?B?ODdYaG5nZ01NRkRSd1ZuK01FVlBRQTNFNktHRkJDb1ZpOXhhSU9TZGIrZmx2?=
 =?utf-8?B?QnlMSWFrQkxKVEJFQ1lsTXJHaHFnbnoySUgzR0tUK2NhOWtxYjA1V08weG1y?=
 =?utf-8?B?TXdqT2REa1ZGbzkwNjYrL0lZTGdLRFZVQ1M3OFVRdDFFYzU2L3U0MUNhZG52?=
 =?utf-8?B?ZFhwbXFSRGlyWDMzT2NiVjROTktqWXZXaUt4NEVLYlZGdFZFS3Z0V2RsUFg5?=
 =?utf-8?B?WDBkMGlaSWFVRHFwdU1LSUJQZm1NUjNweXB1ZzV4WTVEN204VDBYdy9vWnE0?=
 =?utf-8?B?TjFwbnZjeng1VkFjK1NQZysvcmF1RTRTaGRka1dyNGp1SWFTTnlQd1dUdGJS?=
 =?utf-8?B?YWtiNGdpUmx1M0l2N3FsNTl5Vi9zL1JYeitqS3BDOTdPVGE4emprSStvWHAx?=
 =?utf-8?B?ZDRCNjNPU0pyMWVOOEEycmRXZUV6bnZGVUsydHRaY1U1akdsenFtVWFUeFZN?=
 =?utf-8?B?bU5hbTlnV2dwd1BidWQ4Vnl1cVNqT1BSNUtuR0k4ZjBOb1BEa1luV3l2WklR?=
 =?utf-8?B?T3hWSlJBOFdaUnNYcEZzYUx5QmZad0UzalRPU1psSm82YVlsbTF2L3IyWDZT?=
 =?utf-8?B?Z1NHTU8zdWFWL0QrRFgrYTlVc2Zhbkhrclcxb0ZhVGIvVnFoZGdYdmtMZmlx?=
 =?utf-8?B?aC9mRFJkZWR1a2xJTWE2czd1MGJaUzhCeDFTekJYeFA3dlFlYmVGODRQQlFU?=
 =?utf-8?B?UHhjQnVlWTYxbG92RVQ2UC9UYStXVXBSRXJxdGplTWg0MlJRTk9QWlBEalF0?=
 =?utf-8?B?S1UwRUdiZVNQS3NjMGpLWHN6c1FiWTBLc2lEa2lZZnp0dUNZM1IrVC84VTky?=
 =?utf-8?B?aVJZSUpGNUZYbjRiWHZHTVh1bUVIRmxSeVUwKzBWZWxnNU9GMzZFUGcvSjJk?=
 =?utf-8?B?OEl1L1RaOEZibGJpcVR5Q3Znc3JiQzZ3UEdxSFl2RHZIWm81MjlESzQ1Y2FC?=
 =?utf-8?B?OGE3THpkTGlJWkxJckNOV3Exa0QwbjY3U3lXWUY3eENVVFh4b1VSL2plMnN1?=
 =?utf-8?B?cUZTUU4rQ1ZRTjhzL2xoSXR4MVVCT05VNjY1WDdUY2dSY0U0U01VcG0rTjc4?=
 =?utf-8?B?anM2d0JWb0ozU1IzcmRaVGJ4TERHYVAxWUVxTmZUN1NqazFpLytVL2RSWjRr?=
 =?utf-8?B?NlZvdnN5NjBBTXZDSTM3ZmhNcmNkY25zRWU5WGZHTS9rNjZaRmRxSXZCZDVV?=
 =?utf-8?B?dmtiV1ExTWk0dWdvd0JsYXVTcDBPVTcrM20wc2paWVAybHdpOWZQRG1CVlZt?=
 =?utf-8?B?SUtDa3lOMG0yZVlPMHA0KzNNdXpTTW5WaGNMVGxNK0xJVWNPWCtldndLZU0y?=
 =?utf-8?B?S2RPK1V3MHBiamQ4SVkrZURDdVhMcFZwU0dTS3FXeGdCbVBGelJYelJKcE1E?=
 =?utf-8?B?Zk1ndXRydU5hRHkrN2lSNzRmQWg1aU5SS3VvY1FNWkUxZ1NSMUlmTzdLTEFv?=
 =?utf-8?B?U1daUGUzUnRlR3I0cTFLZXcyYlR5ay85NDQvc3pDS202Q21MT1NwSFVvTWx0?=
 =?utf-8?B?Y1N1MzZCSVgzVHVrQnphVmVuR0hVOU9vTVBFbjZDbU1ENGJnak1ZbC9xTVU4?=
 =?utf-8?B?cTFoOVRJZVllS0JvY2NiZUJEUk5kQVJQME5Nb1J2RUExRW9kYWZXeTh1dEVl?=
 =?utf-8?B?eXZPUFdVUDFqUkY4YlFNTVh3U3NiVTk3OG5IZHkwSEkrSmpNbW1odEsycjc3?=
 =?utf-8?B?Tk95ZXI2ZlpPa0ZNTUI1YjBac3F0NnV4MTdhNEpaeC9yKytGRHRxa1UrL0ZR?=
 =?utf-8?B?QjRUQksvanVSYi9wc25Eb1NXbGFpZGx2TUN1NjMvQWZBVWNsQWdJMWNGNWYw?=
 =?utf-8?B?cVMydEJ4OW9xM09GWWFhak5sMEs2enZHZFN5dTJUUWNvbjM3Y0JWUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f39361c-9491-4292-eea1-08da27a3121a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:37:36.4972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtHG0zhPu/R+hw5eJhUVj6XBw6R0cf1IeXntiwoTi1eakJ1cplvAMPiDSOgfBcdf0rVYVUvFBM88ImM9yhim9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6453

On Tue, Apr 26, 2022 at 10:10:37AM +0200, Steffen Einsle wrote:
> Hello,
> 
> I can confirm that "msr_relaxed = 1" solves the problem with Server 2019
> Essentials crashing.

Can you post which CPU model are you using?

A dump of the first CPU entry in /proc/cpuinfo will do.

Thanks, Roger.

