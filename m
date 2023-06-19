Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E56C735B7A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 17:47:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551178.860563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBH6J-0005XO-A4; Mon, 19 Jun 2023 15:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551178.860563; Mon, 19 Jun 2023 15:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBH6J-0005UA-7K; Mon, 19 Jun 2023 15:47:31 +0000
Received: by outflank-mailman (input) for mailman id 551178;
 Mon, 19 Jun 2023 15:47:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBH6H-0005U2-Mz
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 15:47:29 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe12::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 982b6789-0eb8-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 17:47:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9264.eurprd04.prod.outlook.com (2603:10a6:20b:4c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 15:47:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 15:47:25 +0000
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
X-Inumbo-ID: 982b6789-0eb8-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSXvLla6adPwU4x+1CFswYLSukOqMy7XwOtLOnwzXyfoHuQ5vRFrAEDlevUT64mxlfYToMClJI4+BpOrUZ2WeFxDQq01H7t0Xd/MkhKiK3BFX91Pa7ieAvrL65PMljf+45OG6QlRjSlhK0Tqjo7kQWwzAQtKXo/crZJQlb1pTFzOw1IjVyT0g3/rhklq+ZgevOKmdS9vU/N4j3y2sLBy3Sbkah5urJ55ohNiZkYWXezF9Ir0E9nS7ecN5ThCi0ZC9Mzk+8otin1Qb5GtCHf3i4J2enTkJy3aCL6aa/7x3TwDtCoXqXNgNA4PQOegX2YqfX0U44c2u43iE7gTiI/YJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdv3rfclFxehgQtWUtu6Fa6CdghijGOiRQobN0fprjQ=;
 b=WtL17/AhoOtoTlCMX9ArcGNrSoTKV/XIDSH31KQNqKvbUxGYfEVyjc8X9oYi8vUbOJLqPgpmuPMyXPLjGxU9E8R5STl+qEEYa4mGaxiUfLY0fxTdSF57i0LICkzWVndoKdqL044IgT5q/RO1erAZf4fYEI69OM7PsueH0NfRlp+U7DmFaBLlt9GAwkmYSWTva7gzFS+FgGRwKgmLJXJ4xK24Qx11SKcqr4UD66DyTZej2JXQORILNdHYBS2OmVlkj31aNzoLxqsy2tt08XKgPksU8+WxVG6Jbp8JdBI4iZjZ2lCb+vknu7320BnjQLrC8kq4lZ2rBDuWzk4lYLk2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdv3rfclFxehgQtWUtu6Fa6CdghijGOiRQobN0fprjQ=;
 b=LOvChPrTSCeCpffvN1GBFFpMe4Q5OKwo0yWHkoVw/Mt0rvVtbYzySMU189eSgFquSvrE4pNxwl/RBTpn29M9KqhTfBpENs0/U8vspGhZKnMEFeAmSX98E2Y7PG4qk3Mh/ebd14wMNAt+xQ8XGwdgI0EvIhXrz2g6iFFNuTtqxj+g1kXYHjWRb2Dw58WMpkQL2PuGlsbolKYabMbvb/JodFglff+YhD0R9imW443DSpzJJCenrQeuklWhpuy4cXROq91REvbHt5t2CTpkH0WLkhhLz91+letWR1N/RAPaY7VuNYk4zM86D7WJnPla/8N25PPyLQGuWFvUSgNVWRVwSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af26b410-8d0b-469a-6002-a9ce549f1ffe@suse.com>
Date: Mon, 19 Jun 2023 17:47:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 3/5] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-4-alejandro.vallejo@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230615154834.959-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a933c9a-53ce-4f3d-609c-08db70dc7ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wFKlUNM86HOlbj6sNa/laTdcdUL6PK3rYo76TOmjJQZSOsaop59B5oT+YCVcAhRgHpIdUKhewK372veOc63K7OOIy7Ri5k+ywnFaMh06sEC92DFpfz6T4daxCC2mq70FFWuZYwXD+eqG/CSrfzqummtBX+gqGktLVv0Fh5kwYveX967eW4GG/NWX6ESf9Bquw8SFm6oOjSEJeZ+EmjZ2WGTnoIT44ljUHdCDlC1cMhRav/BNcPkFfqQuNZOuu4NiS9//6F0NT05nvUFaw6LjmqCwOpI9+ZROyPQ9k/IikDVVGRkWKDiy7Awevdw0BC5Q64JEZevPOmwiAgLaEZrHbcyuHdWhFc7etzmlRldUpOCAC2k7uE51XIRelaCY5xGa1gTNIdF54LxV4nkeCXFuTrh4sl2L8Rfr2+faaB7sCzs6IaqIj3V394Xmj9TyO3rmBGj3jPXJAjQb4TizGrZU29B3noPJKJIvqnCoHQLpTMhTHM/XFWePAp3R77vH4N3NnsximGED+x0L2g+KN0flf8YoNxXZv5qmfIeIbAoS67nud+/tOk+CG/aY/E8r2QWILpudnIWRlhI5QSulwaupMliaNm/X9LH2Z8cfeMTYYyDaBkuCysxQN4FkwqAlWEkWdMpQZyyRLiIe9lC9J8bCuQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(186003)(6512007)(26005)(53546011)(6506007)(2616005)(83380400001)(38100700002)(478600001)(4326008)(41300700001)(66556008)(66476007)(6916009)(31686004)(66946007)(36756003)(8676002)(316002)(54906003)(8936002)(4744005)(6486002)(31696002)(86362001)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmozaitlNDd1S085MlRQWGt1UjdKWlBsU2dTbU9TWXBSR3VkRWRTRmhxLzFm?=
 =?utf-8?B?WCt4OUFHcE9aL2d1WUphTzFjNzR6cGUwS092Ky81OTJWU25xTjRCQVY1S3pM?=
 =?utf-8?B?VkJXSng0Z1MvQ0xhalMycW0wcnkyeTVaRlY4Uk9rQzFCNEY3VlV2THRIQ1VW?=
 =?utf-8?B?c3o4djVFeGt3bGw1SDFWdEJ6cm45NENWdkxEc05lT01tNEcwZEY5QktJekZh?=
 =?utf-8?B?b0l2NElSQ3hOUndLNFpDRVlSZVlnNlNWVGdXK0xPOXJ6eUg4OGo1YXJyUXFL?=
 =?utf-8?B?TmhsVGlHRXFZelVlRVpGM3BTZEk5UVNGckxZQng3N0RkOWJUNWRJVjFDeldR?=
 =?utf-8?B?dGNiTytkN1VNUklyOVNmYnZQZnM4VXdGQjU1MFoyaEo3RDR3OTUrUFI1SHNI?=
 =?utf-8?B?T3VRSUdEazF2L1Q2Y1o1b0Y1YXJOLzZKRmwrczd4TjN0M1hDTjlodmxrSnNU?=
 =?utf-8?B?MzB1NWkwMHNIZzQ5VVBOcU8wZE1JMnY2MktoeGZ4K2JreDN5NEw0YkZKdzFi?=
 =?utf-8?B?VVMxVU9VZVRIbFc2dVJTdEMyV0NtU0tjKzZIVXFiZ2NiU2xVeEgzOXNiMWI3?=
 =?utf-8?B?VDJjUkJyaDMyR1RHYy90aGFDVGFuRHlxVzh3UGI2d3lhVlB6b05DTjN3NDV2?=
 =?utf-8?B?TERiNWdnYlhFLzN2ZW9UckhIeXEwa0Ewazh2aWJKWHhQUzB3M0NVNHd6WWdm?=
 =?utf-8?B?dWhVMTJuUzM1RFFROS9NdkVWc0Znajh4NmRURWJibUVQWmEwOS8vRzgzeVdZ?=
 =?utf-8?B?STNHMjhIWXhhaVVnUzhCUExiL3JXRDcrdjMrTS8ycXhUMnhGRVNIU04xS2FH?=
 =?utf-8?B?NW1Tc09leWoyblhxMENCNmlRbXpjNVVXMDVkMlFtK1prUW9iZmJNVE9wL3Bu?=
 =?utf-8?B?aXBsR0pSdkxhRGNNbGkyZlkxT2UyNHNYTzJveVlYZHBPNVE5OGVuS05RS0dF?=
 =?utf-8?B?MHFrV2c4NFNWSzJZQmc3TlY5Vng0N21NZFpFQWlFZGtIUjRHZ3J3Nlh6QWxR?=
 =?utf-8?B?ZGZXVzh1bEhOVnlMdlpsZzF3ZHQ2T05WdENYMXgxTG9QS0Vic3FDK3Q2TDZr?=
 =?utf-8?B?cVdHdmRBRXovYnNPRnVjYmlGTUxZQWhVdVd1aW9JRkRnckd4NmNRSmh4Sy9Y?=
 =?utf-8?B?bWlQQTYrVWF6L2J6TUhPZ1hTZmg5L2NnQWZMVy8vTmhlaTZlTTJOMkpVaFAy?=
 =?utf-8?B?ZlNXaE1BU3llYUtSNnBoNDdDMTBhQ3dCb1FKZ0tHeFZWZDhkakw5NzJFaWZZ?=
 =?utf-8?B?N2hsYjhGUDkzcVh3ZERnR0FMQ2NrelpTeG9TdWk0NCtBa1lDRWhIU2xkaG55?=
 =?utf-8?B?Y09USDRhOGJvZjh4WkExeUFGSGZqdHNHckhITVU5Ukw2RUhWQnN4TUFocDNM?=
 =?utf-8?B?VU9FNzJ2bGdrTEIxWWpmNG5GZEpDZmFRMStrSnRDRjdVQ1B3bDBaTVk3dFZO?=
 =?utf-8?B?SFZaVWF2ZzFaeHYyU1NVWUM3MnRWZVJITEluZi9rV3pkbDl2UWVYbi92azEv?=
 =?utf-8?B?TDV6OUpqaFQ4QkszQ3JHdW9xdWdXQ2dkTGpKVU9XRTNZZGVvdmNhakRPaXli?=
 =?utf-8?B?VzBvTDBpUHBpaVZJZzRBSTNkdFpnK1lBV3hpS1V5OTVzd0M5WmxRZHlDdnA5?=
 =?utf-8?B?aGxlbDcwZnpYK1IycDFXNjZxdk9vV2R0MmdiOElpelNvK3hMeGtDdnhyTDll?=
 =?utf-8?B?R2kwd1lpTmFpd1pRUGV2WWFTNTJXblIwcXdSSUZ5ekJiQUIwZmNPZEE5d1dX?=
 =?utf-8?B?QVBadzZWZ01SRFNrNUJrNnJoSzE3NmRBcUpqdHd3NGNlNTViMFVwYlFwNExq?=
 =?utf-8?B?ZHBEQmxuTTkwR2V3ZG4rZEVsNHBINmJsZ2tqNGJZMU5FT0lmQVJ1L1pFcGZu?=
 =?utf-8?B?elZROEVTQy9pYkQ3M2VuZnoxSkdSNS9MTnJTMU92MkVsUGIwY2VSUlJtZGdT?=
 =?utf-8?B?OHdmNll6SlB5ajBNcU5KTlFReUlTUGlSdmVSR1hnZW9KUkhwYmM4L0dWQXVu?=
 =?utf-8?B?TjBkZWEwMmt5OTlhcnZLSEVBb2p4bzBmVHV1Tk5YSmEyMkYvLzJTbFRpdG9L?=
 =?utf-8?B?ZnAzL1c3RlVjUk1yN1pnQTBTV2VKem84cjg0Z3A1azRCK3ZQRWFmM2NGdEFm?=
 =?utf-8?Q?D5EuBMVgHSqJ6SF5uFfS7MgAA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a933c9a-53ce-4f3d-609c-08db70dc7ab7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 15:47:25.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNvtBL18zWh4cQH9ZjTdnpkVJff4Enzf9bhQJCD/9ALsSkqZYWjdQIkSS+4VaafOBefCMi5lbVRzHted9ihxeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9264

On 15.06.2023 17:48, Alejandro Vallejo wrote:
> Some hypervisors report ~0 as the microcode revision to mean "don't issue
> microcode updates". Ignore the microcode loading interface in that case.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Aiui this is independent of patch 2, and hence could go in ahead of it?

Jan

