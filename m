Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD3A709BB3
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 17:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537175.836069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q02PB-0006hH-M3; Fri, 19 May 2023 15:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537175.836069; Fri, 19 May 2023 15:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q02PB-0006en-Ik; Fri, 19 May 2023 15:52:33 +0000
Received: by outflank-mailman (input) for mailman id 537175;
 Fri, 19 May 2023 15:52:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9pCJ=BI=citrix.com=prvs=496ec590c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q02PA-0006ND-VV
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 15:52:32 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28de9f04-f65d-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 17:52:31 +0200 (CEST)
Received: from mail-bn8nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2023 11:52:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6504.namprd03.prod.outlook.com (2603:10b6:a03:394::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Fri, 19 May
 2023 15:52:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 15:52:26 +0000
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
X-Inumbo-ID: 28de9f04-f65d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684511550;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5QAmARQjsMNiLoh8KT3yS2y/MS5Vv47XHq7zU5qmD2g=;
  b=UV2M3qwhmNspeDARQ0CVG8EvEsIf1a3B86hqIyuRVUZj/624djEyK0Xi
   XeSRa21/1Bw9QYBlgtJlZzIo3sueqaZiqQhwImOItgLv8OeIMdzSrk0Kf
   FWy/599dBMRPGJMCwDuOX6u+8c+Xi/xQh0Fp+YmFfDnKzZr4LDI0M2sZc
   Q=;
X-IronPort-RemoteIP: 104.47.74.42
X-IronPort-MID: 109693000
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KdiiAqraSbIZqZhbSQqpztuf+FFeBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBnXbP+CZ2fyftEiO4+wp0xXusXRn9dqGwVvpCkxESlDoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzihNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGwiNxykhcum+5a6EdAvu+cmLdLrLIxK7xmMzRmBZRonabbqZv2WoPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+SrbIC9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgp6A72wXLngT/DjVVdWmkm8a0zXKUUtV7A
 AsspQMph6w9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hBSfSN9mSPKxloetRWu2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:ARFCX6Ned3oXbsBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: 9a23:dORZ82OgJlPB2O5DBAY++GkWM9AeVnyG9TTtAEq5EmZ5R+jA
X-Talos-MUID: 9a23:7X64WwQ65Hpde+2CRXSvpAN9DvhlpJiEAUcputI+5OCDHyh/bmI=
X-IronPort-AV: E=Sophos;i="6.00,177,1681185600"; 
   d="scan'208";a="109693000"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2XyawxI21XHEVcyV/TXjV5eONn45q8OXkpB7RLQiM3Gvr9DlpsRGB/wyPWPnF/792OjuDiF+VAzrCwaBnMmaHpeAWI4YQkcnWZR/axz+ClTmFHvAmrbQtINnTKfbx8AuuEkw2HC/X0UzbzzeADQfDZ41bwUEk9D6pTziUReWolorWEOyKTBSpe4/8Qo7ouwL/HznIb5nbLZAqBqUoCZtCMfIHxeKHXtPrbu5Cty+GZecE20g5NsmhAyq1UQn12zkAe1Cpx0KrSJzwIvrH/eEkIFay6wSURmLAaYPzd7cQ2FU+m+FZJ19gkSqtjQB9xg5XMd5ftkl/MzmuhccYU8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAr9VLcnWtdBGK+4BN5I3SbbD6F0ngyViRpoJsSvtRo=;
 b=j6yh6g3gqZjk+aE59jGXNULYpWuoU/eQi3/vpq9IvJtUcZMAfcs1HzvvaMEgjCHKCzzr2WuG7aEs/YRqfDbKFwEkEXqD49bA68NdsbEAQSM28k0ZNKV9IQJvVO8hIs6xkmWSVxFIyAJcqlXSe+xeKXksl1lgb33Uw06Yo+bqzA/x8PWAe5/02o9JZdtVrc1WsIZLm1J2aklVHlzkUHpVUH0ecxlPCLVNiyTHJofFtFisH0tMs0yO0EhyLsY5RrqtF5HI83Y3iL+VPWHJg7A+F75EpJNuTQFmgaPisFWVf1mFxzZpR0U5VCIMi53FCWvbs4dq9ovAzMhyuv0JBqCSSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAr9VLcnWtdBGK+4BN5I3SbbD6F0ngyViRpoJsSvtRo=;
 b=FQbVaCbUZ9o5yqjiN4a3ZpIPDtbYEKrsHgYJRAC8kKmu8eYjbBTBWiQItezSspzfQybI4uRGl1uOZK6alSb/eTIaPzlOh9EgwW/dYLOLvX5UU8GcbgoPDS9MXVB219pe2lIUgNqIpy9OYiKNJ5sD2VB17/e13pLNemiBvQzxtXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <64e3689f-8b5b-9eea-c756-85261de4c2e1@citrix.com>
Date: Fri, 19 May 2023 16:52:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] x86/boot: Expose MSR_ARCH_CAPS data in guest max
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-7-andrew.cooper3@citrix.com>
 <327eb858-f5f5-bf09-edfb-53c5c23a6c17@suse.com>
In-Reply-To: <327eb858-f5f5-bf09-edfb-53c5c23a6c17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0079.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 91bbf8cc-b8d4-4e04-02cf-08db58810af3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dcu9giU/3qmp7lHQkzIt4NMalxFi+/TEcCCJ2xbofh0aIPe72R+SzlFnMbA3cmY/nbkR82rDNV7qXN3HU/Pmisx6aqpALxuUjAqscRwDk5yr8zFw2kTO5Vqe2SyiQ+FixCJR70rfFuwmTVGa1MKy7Wyq6RA1caa8nFPp3ZT180Z39fBJzZbNa7Fa/hqPMEDkwDCLznsVsWS3kLhDwY+iLeHrgPsAo0T02ShPa/ztFtBeIVcvjmeJTyj/1VS43aTg518/x94gPzoMCZ0ntpGonZv0XRDqTq16GgBpKGpGAAJdPemMpWJIQdSD+BzuE8l7zvw/asOGBWTc1sgii4tgBnSeSAyMSwCy2yHVDFpZeT9A7CSgSnkZBkaKSVIAH+psrXlpnt4dmQlGGxMMWNKqxSkL2BK0Le/ijGh0CcgW0VGCN3fS9DTSgzZA9qmHoXbzcuNHALsdqJ/ZalIsY7hBbP4/w1XmbC9ZQv3/SVg4j51OQVw67oa7A7dYSkBNJnOR0Z2QcNildphPjCHJ4lHMbj7+QxbdC5t3uT1cZk7tzBG2MR1h0/Le0FauBSKcqlVTqTMStiyFSODWSe0iS8hrs7dDTeltlCTv0ZH/rwgJIV1aJ16O8pbenkGxMkl3CBzrjWbgUI0YfDAeFXmO+YVJKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(5660300002)(86362001)(66556008)(8936002)(8676002)(82960400001)(53546011)(26005)(2616005)(83380400001)(31696002)(6512007)(38100700002)(186003)(6506007)(41300700001)(6486002)(316002)(6666004)(478600001)(54906003)(66946007)(66476007)(6916009)(36756003)(31686004)(4326008)(66899021)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2cydXUxWUt4NHZ6bkx3Q0k0VG1Od1dlYVV5MnVneUp3cWdsMEZRTi9sU0VJ?=
 =?utf-8?B?QWhGS0RGTllFS2pTenFSOGkxZkxOM0NhM1FLN1hKVTRJVFRCcE1lblBLUi9C?=
 =?utf-8?B?OHBUTG9obGxPa25pdWk4RnNjc2UxUEUyYzlCMHptNFZGS0E3R1MxaitNWU1G?=
 =?utf-8?B?YW01NTJneUN4VndLa2J2WEFScjNha0VrSDJiOFNFb3Q3QnYxNlJTenR1V2xl?=
 =?utf-8?B?cmo1bmZMNk8vUWRUYUJ5OEFzUUJWV3VhRW1zSUd2WVFpQXBBRURjeVJzSjE1?=
 =?utf-8?B?bzJRN2ZGbHlzQ1QwVDZkNHBnbE5NQlliNCs3czBwb0g2eS8vbmR4WGxhS2xs?=
 =?utf-8?B?aGc2S2svRlNZSnZKOHdxL2Fyb1NMVTNMQmhTbUNRa016dDBlWGlXU1VPbXZv?=
 =?utf-8?B?TWFGWE8zQjh2SkZFdXhHb1NmSHZmWWxrcTROYkc1Ui9MZzlVNmZDVnVVOWNK?=
 =?utf-8?B?K2p6S1d2MDBybTM3SFpRNDBDbjBKSisxdForZkxPMDREV3didW1UQ29jL2xl?=
 =?utf-8?B?eUJJOU5GN1pRM2VIOFgxb3RiaWY5cSs4N29LZXB3NU5HVW9NVFFIUmsxL2Qz?=
 =?utf-8?B?RGdKakI5SVJpSmc1VXcrVXFLcTFuaGhDbWd6amNxMnZEZU45anJDR0g1d1RO?=
 =?utf-8?B?V29vK0YwbTFNK1hlZW4zbzVvSFNEeWZvbzliMHRUcEJIZ0U0c2RKL21zZkZu?=
 =?utf-8?B?Z3JVOS9yMkExdS9uQXdTWDJ2STltajRMZEtLM1pGVjZyVHdLWUpjUVNZWkM4?=
 =?utf-8?B?Uk5uNTBsUjJRZkllTVZiNm1aa00rQWpXVlo5cG5TRXpLYnV1SG81TklZN2Np?=
 =?utf-8?B?WXluTnZ0VXY2UWF3VXk3OXRueXo2N2o4U25rQ1VjR29LcmRSWVBEdENSQUQv?=
 =?utf-8?B?MXJJL2dCb1N3cGcxOU4zSGNoa0IyMXEwZnhMalpwbVlFR0c4U3dUWWlIRCty?=
 =?utf-8?B?Sk9jKy9zeE5Ub21NYmdhY05WZ0orVnZscklGWHVUS2tBWk5rOUpyZFlhaGNk?=
 =?utf-8?B?Vmx0cHlJZGE4TkN4T2NRQTAzK2h3VlVCaStuZ0RKVGRHOUQvUWMrVCt6c2pi?=
 =?utf-8?B?SS9xUG0zcjJSQkZrTHYxUGE1bkg3QStiQmN4R29jU1hvUWV6SngwNEsxY2ZF?=
 =?utf-8?B?MTZ6SFhYSVl2bGo2Ykx1dHJiR1lCREFLZE51OUFHMU1mNzN3SUVmbDI4YjA3?=
 =?utf-8?B?ZzZMUjFMWnRpN2VqR3I0VGUzY0ZteDdBNGlGajcrM21CNWNIbU1DNnV3amZQ?=
 =?utf-8?B?LzQybUF0NkZ1V3NUYnNsM1VMdHlPVS9JbGdWb08vd0NxT2RRTDBVK09WQkZC?=
 =?utf-8?B?cmxFbU1BRHR1UkhEMThUM3UxbjFiSkU1Y0VoVEVoeDkrcVNlVFZLc2VvWjNJ?=
 =?utf-8?B?bjdRRzVyYUx0czY5ZzUwby94a0xNakcyWERRSjJrdVhaUHVVT0E3VGZLcURV?=
 =?utf-8?B?b1BicWZNUUlkeHRRSW9qamZYMzBOOEFKNXVLZ3k2SUJlallPTDk5UHg0TitC?=
 =?utf-8?B?OVlZbU9zRlppVVZuM2pYVENFQ2FYZTVYUUZBRmNwdGFTcmJKQlJ5ZmM3cXRU?=
 =?utf-8?B?ODN0VjZaSExZSkZtajFSOTZMd2czbHNBdjZzVFplYzF6VnRSTEFEcGpyZGV3?=
 =?utf-8?B?b3BoUUtLRlRSU0xEVnhrMm91WmJ1OTJLdjRoM3J6OEVnUHhIM0lXVERydzNr?=
 =?utf-8?B?RVFWSHZXMHBrODZXQ1VpN0oxSlNVTkRkNHBWc2NLRlo3NEUySjY0WFdjTU4x?=
 =?utf-8?B?QmV3THdGZGk5VHVYMDErSWFiTmVxdUFCajVEeDIxNm01YW85QWNlazJUZ1hZ?=
 =?utf-8?B?NGhRVnFmb2dIWEw1MFNhc2hXRjNMMEdiMVN2MHl1VEVHMWoxUWtuRUIxaWlt?=
 =?utf-8?B?MTNxd0Y4c2VlT1RKZG1TQ1hNdzBuVmRXSXl6VTdXYjc5MDJXSlBGOWh4SGVN?=
 =?utf-8?B?cWlCOHN5K1FKTjVHaWlITjZxOVdqVVRsVC8yTDBBY3ZUUTFvSHA1SGdyaXNC?=
 =?utf-8?B?ZisvT3c3VUg2ZURRYXRTd3UxZkNtUEQvT0F1NlJiMTBCSUhzQkU3bG10b28r?=
 =?utf-8?B?U3ZVcW5hTGJtcU4xb1ArNFVHVDFBdlVxcUVzdkNzTmZOWlhSSTBhS2pSSExo?=
 =?utf-8?B?cWp0eFQzSmNqVG9FbjdKS0ZIbVdpbm1GTDhKdkRtZ3FPRGtFbDFoTkJPOE84?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ifTuTToaJtSi6epvlWEC34DnUohLvcTpki8AIurIZyqT5QdGJXfiLqnTHSLdDw76PAsFn4vOzD2/DcfKXdsLTWbDkclepkD7YO/h89yR0n5Ro2XQYq/Ztd5ZbjaD1G8zYjuJrGHeglNErQhV2uXap0Fkk2btJrBUsBfDAwi9IenvSn0/yGQh4m7PDk8JY8YJWvZ1YiHfr9iPNxzKbr4DGDF8f/gduj4XWSg/NUAcGqRCJZTgqUDLV+xBtn4aQBhETy7xinZY4urPGKiXIpQ4w1OhFtxTwhlCToTKxgEwXbmFznjZEyDpw5YyDUhWWf0wljQ7fv0qPK9086cvRQh/7glmL3uX7edie0m1ViO9XUh3o+yTNfA7wjIl0FoFtNaco+EIvhSfkVSqSjp1e8RmqgYculy6zuEiIOoGpVCmtcpxv46KKqNMiKaqKe8Vo1GzCpcO3fGkMV6ZNX/L4w8McIBkh87R3CEp8WTzVMgpnEDAguJiA1x7TXitffznIoedKVN8pz2x5DXFljGihEoshXtqFUlO6Ws23mZ1hh3ukC7ZPihnoincvwlDJ/GjTzfhkJ7pfMRWKlBldu5UEFi48Hz1NiIKJ2WadEQzygSa7sUOxXKGWcAwfSEgI+yhFh+Ql2izZIW3vxwijxOo9YZAFD5tFO4aoRNI2VcJJK5O3aKboe2oL+m2H6jeZOwu/f+UmGpyK8I1QFIUMBh9RysVeFYSWMh4rBK4juqSI4N+6ZCavlzVJrx2ix6C6FmSdG7aSX13p896k+Cg5whWSaMhaolg0I+8oyeISY0MPR5hd/2SxtVihQ/+grpmroW2UGCq
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91bbf8cc-b8d4-4e04-02cf-08db58810af3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 15:52:26.4280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxQfZVdFHF17NvhV9tx+bIQ2cnG1tQC8HPb0zifMoUxLGBl2H/1ltJgQG19aTbVOiwn60drxGj4Z29mKNitVRFgXXAWK9YCcLJHAICa1PfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6504

On 16/05/2023 3:58 pm, Jan Beulich wrote:
> On 15.05.2023 16:42, Andrew Cooper wrote:
>> --- a/xen/arch/x86/cpu-policy.c
>> +++ b/xen/arch/x86/cpu-policy.c
>> @@ -408,6 +408,25 @@ static void __init calculate_host_policy(void)
>>      p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
>>  }
>>  
>> +static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>> +{
>> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
>> +    {
>> +        /*
>> +         * MSR_ARCH_CAPS is just feature data, and we can offer it to guests
>> +         * unconditionally, although limit it to Intel systems as it is highly
>> +         * uarch-specific.
>> +         *
>> +         * In particular, the RSBA and RRSBA bits mean "you might migrate to a
>> +         * system where RSB underflow uses alternative predictors (a.k.a
>> +         * Retpoline not safe)", so these need to be visible to a guest in all
>> +         * cases, even when it's only some other server in the pool which
>> +         * suffers the identified behaviour.
>> +         */
>> +        __set_bit(X86_FEATURE_ARCH_CAPS, fs);
>> +    }
>> +}
> Wouldn't this better be accompanied by marking the bit !a in the public header?

Yes, probably.

~Andrew

