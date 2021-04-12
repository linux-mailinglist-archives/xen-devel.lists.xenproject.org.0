Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6CE35C920
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109253.208551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxri-0001Vk-9L; Mon, 12 Apr 2021 14:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109253.208551; Mon, 12 Apr 2021 14:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxri-0001VN-5p; Mon, 12 Apr 2021 14:48:38 +0000
Received: by outflank-mailman (input) for mailman id 109253;
 Mon, 12 Apr 2021 14:48:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1kd=JJ=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1lVxrg-0001VI-3m
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:48:36 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.99]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e4368f6-e15b-4114-a4f2-f4e221b53a4c;
 Mon, 12 Apr 2021 14:48:34 +0000 (UTC)
Received: from AM0PR02MB4419.eurprd02.prod.outlook.com (2603:10a6:208:ea::27)
 by AM4PR0202MB2881.eurprd02.prod.outlook.com (2603:10a6:200:8c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Mon, 12 Apr
 2021 14:48:32 +0000
Received: from AM0PR02MB4419.eurprd02.prod.outlook.com
 ([fe80::ec4d:d9b4:af06:3958]) by AM0PR02MB4419.eurprd02.prod.outlook.com
 ([fe80::ec4d:d9b4:af06:3958%5]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 14:48:32 +0000
Received: from [192.168.1.109] (86.122.210.79) by
 VI1P189CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:802:2a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Mon, 12 Apr 2021 14:48:31 +0000
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
X-Inumbo-ID: 9e4368f6-e15b-4114-a4f2-f4e221b53a4c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clAMQOiLib3bpJQU9zmuLxDyMs7m7FiF/8tsHQvH+bqYOp76kvODnsxzQc7oKfIm9qAY+mfQx92pFzMk9DqTKUEWsDZAPE8aKbJX9cr8xzYtld6YgwyxbHsv53VskgaflXi8B94UDaCN4PjbjoLh+SkXeWnNgJvYoh6lu577P5P7ezXTEOMZl4zqcPpjYFTcOr5gWr15y6vwD9WQU9nLD1lE+9/8Zjk4atjQT5Y2brTZafw6CqnoZv25YAF5cegkBdDMitKFayu1jVP6Qb5CZsk5fg+fYTf7vKd+GN1kFE0d43iaNactNmLX85zoz8ezakMhlqgyiLiCR2NlUg59vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBTAJuMU5XdxnXVF6vC8NY6/ncwOlAiPeSKXDTR37N8=;
 b=i2mipoMtmqR/nS+0PQ913zXJh82mmZVuWpN2uIvI+LJpgY7M9hYUNqR4H9GjWaVDMY8ZhKEZ4Z8jTnwWhZuDD6cN8Mn5wuFFjMRNZ18f2nIK8mpK71uruIg4d/ANirgZEmxxdkEcS2dVfQ1YWJN4N/HIusYlNGDx6z+hiUGHIEkrTfIzF/rfRd/4l546cHf6EFcf6O/90GiqRmcDj5exNpkV1+PMeGlOp3QN42MPFgJOg4NoDHdwQSr2YmrbiRyeSZJumVDZbIopXQqF7zdy6MqN2Sp9C0s1ztLsoNp/uk9wYLWpKom6bTL5XiiCXpYUsY+8ruDR3VyVXT63YRHPrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBTAJuMU5XdxnXVF6vC8NY6/ncwOlAiPeSKXDTR37N8=;
 b=tx1Otkl7T2byWLbbiMp5LWWBSLe5Kg19VgUL00LYA1ez9mpcovW2yZJu+kWLrnV1k5pHt2aVUt53qoN0s1Z77DJIyNYPqIld3mcaYj76wciOA2K5nDh/5SV6uBgo7+6ZsIm/8ibL2OMJo+iA8ORZfy3jhgL5z66JTJ/dIr+IJtM=
Authentication-Results: bitdefender.com; dkim=none (message not signed)
 header.d=none;bitdefender.com; dmarc=none action=none
 header.from=bitdefender.com;
Subject: Re: [PATCH v2 08/12] x86: mem-access is HVM-only
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <91921cd4-902e-3341-10b7-718550658c8d@suse.com>
From: Isaila Alexandru <aisaila@bitdefender.com>
Organization: BD
Message-ID: <1d253246-d799-fead-6663-a4dc700299d0@bitdefender.com>
Date: Mon, 12 Apr 2021 17:48:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <91921cd4-902e-3341-10b7-718550658c8d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [86.122.210.79]
X-ClientProxiedBy: VI1P189CA0003.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::16) To AM0PR02MB4419.eurprd02.prod.outlook.com
 (2603:10a6:208:ea::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45de828f-27dd-41f1-b93e-08d8fdc20ab0
X-MS-TrafficTypeDiagnostic: AM4PR0202MB2881:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
 <AM4PR0202MB2881F4C55DC9B65C2DFF5BBEAB709@AM4PR0202MB2881.eurprd02.prod.outlook.com>
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KtmBZsSWufyux+YL1f7mrqKXQ0zmePkY3/XA8R/lFEGlp4UAGmOUKvH1cpON5dRXC7q+EoFjyxub+wkPxR7YQd+CJcO4WI3l5Qkv4uFZK2MKK2x+aI4dbgEOn8QQlQyKXN3LEsfn2tkrukTx2vpNypaRns80PQX5NFT8Snhe2UfFS27kIU5vMxHrcPG9JYSHu5E60reTQTr4uB5RYSvrSSdmm6Ibn84MSEuL/v2J3HzxCuDrB3F6HysE0SnO1ANyltWCfNEo46vd1EiMX/DvMEo5jdAgR6UpqrLy8y1hTPIzScoc7UZQbmuDutu45qZmvA5bzKW02pfrMqnqR4lOg6DoGwnavw9QTl1jkitzkj1l3DimsDXU28NCgzLRRaYIhMzep+VsZMHsjRFSCrvziB81r3VkWwA1cDY8ryJ737ABIFXYjX9rzKriu0EaHV3Qbs6U8hWiSvJCn94fWljMLO+ClU36UJ/UUKGsI1x5IZDO+tLGlOC8ro+vPOCwcImqpXQh8M5BxJGqRVKEm5nrZDJnGK2WNK76AmBSr3995Xox178Gi1jDWEPeihCyJ9Bu9VGFgmHRJwlN1/vA+44I3346xbXDdHGi0GGNwODr+mVG6HVV8VTz5VosMgWQDSOS2hj6HzoQO+So9xArrwFyrkQ+B1vT5ANnG5A8fK+9Qg77c6dfC3sw0nNmpc7cF0K7myc9WOJcKwkJVESTsoohpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4419.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(39850400004)(376002)(366004)(26005)(478600001)(4326008)(31696002)(316002)(2906002)(110136005)(186003)(86362001)(54906003)(107886003)(66946007)(8676002)(16526019)(4744005)(53546011)(36756003)(38350700002)(38100700002)(36916002)(956004)(52116002)(31686004)(2616005)(66476007)(66556008)(5660300002)(16576012)(8936002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?am5HZS8xNkw3OFc3aHZkZUttTTVGdm1sTDFpYzMrRE5mNFZpR3I5QStlY3dq?=
 =?utf-8?B?Ny9XOFRxanVKU25EVHdsUEFrOVJOTEltTmE2cG9OMjBFeDRqdUpWbXpSS3N3?=
 =?utf-8?B?dXhja295TGZsdjJNY3BsWEwyQVBxaGtRcGZ0RnJoazRnZU9KbkNTS2VSSHda?=
 =?utf-8?B?WEd4Wlh1ekFZNlYwZlBBTlhIMHJUd3AwdmRvSlMvYUpvbGxnOU50b01VRW1v?=
 =?utf-8?B?czlLemVvWUhabzRibk9DZlU1S0pOM1BTYi9RQlZJclN5czl4TjkyRFBXcTVP?=
 =?utf-8?B?NVIrSmhyZ3ZDazRHeDU3U2JzbmE2bS93cGVOb3JSL2UrMkxpdkdvVU92S0c3?=
 =?utf-8?B?YmlqR2JyeEU1TDZMZEdJdUZ0cEUrNk1KQjdFOFRDYjh0Z0QzNmUwRllHS3VQ?=
 =?utf-8?B?NFFQdWNGVEljalE1ekxtaXZOcjJvRGRvYnRhMzhOcFUwWnFDcWNiU0o3TklT?=
 =?utf-8?B?TTZSS3ZUV1d5aU50dml6ZXo2a1VNbEx3a1pOUytXNzNpTlhZNWNyd3RhcDlX?=
 =?utf-8?B?U01hSGhJaDJUZUlLbjdnaC9zbUdEYTRFMUgrVHRrNFlPOU9YNFF2OWs4MjFx?=
 =?utf-8?B?RENIOXdvbUZPNklrZ0k1M3RXZGREZGN3bGNEb0doS2c5REtGQlYrNUIwQmY3?=
 =?utf-8?B?UG5xYW9FRXRjcDk1eklZdllsS1Q2ZThGUlRaWFFCTG9EcUVLZnJqWE9vK3BU?=
 =?utf-8?B?aHZJQXI3Zlk4ZzF4NU9QUnJSNUxZKzFSS0d3RUZOeldyNTViU2FxZlNOSkhs?=
 =?utf-8?B?MXNYZUREOG92S3hvTDBoQnYzV3JBRnc3RVBMMHFwaGZGRkRXOGs5QStaVnlY?=
 =?utf-8?B?TUNDUXZZbXl2emhQdVRKTVlLbHpSU01RN2NuRmxFNmlCbUpJeFBnVTMrajhs?=
 =?utf-8?B?b1huZWRtQkhXZk1WVUI5d0pOVlRSYjdrY1p6UVdNU3A0Vy9ia0NPZ1ltWTJr?=
 =?utf-8?B?aGpreWJUc21ER1hNVHdEbWJtdlZkV1ZGajNQRTJFcW9jdXdLMENndWwrYjZI?=
 =?utf-8?B?dVY2c1hiLzBraDZEVWpyZ3hva0JwWnFNeCsrOWI5b2hmcnA1Y1pIQVByOURJ?=
 =?utf-8?B?OTQ0L1ZvVUtDeVdYcU1EWHJYQ2pUdElnL3EvV1NETWtjU01ENFpEcFQrclNp?=
 =?utf-8?B?T0NubWNiV1owNFJVUkFCQ01aQW5NajlZUUhoMTYyNDQ5OWg0cUptR1BQRnM3?=
 =?utf-8?B?K0pyWk5DOVp4TkhRWlVaSk9UM3R1L0JyNW5hVUNZckhtS21ScnJydkVJOE9K?=
 =?utf-8?B?S3dMY1J4ZmZ3eHFUV2JSYjVtRTBidVNSMTdLdnZYK3c0TlBvUmhaU1p5Y1VH?=
 =?utf-8?B?UXFkOHQvUGtDRHVzWVVqd0Zzdk9iR3Q2REZwbyswUUM5VHhBeEg5US9PdFFF?=
 =?utf-8?B?VDFKWm5YenphZk81TU9oUmJwSExHQVlUb3RISVlCYTJLTi9yL1RNZmRjb2E3?=
 =?utf-8?B?UHp6cGRvVTUxempWWXpXNS9ZWldDNFNWVWhtNGRrTEhlTmloaDRyWXhDNkxD?=
 =?utf-8?B?a1pXTm0zVnM0eHFZS2FIQlRmd1FiMmx3cU5ydkZ0c1VjNXg2OG5vbjd3SCtw?=
 =?utf-8?B?RXRPVmhERGJSSjJZRkZWbXBqRXNqekI3eEhteDdvZWFLazNueE9KWTNpb0Jj?=
 =?utf-8?B?UGEyQTFhYmJaUGZvNnZYWVloYm43bWl0cXlqQjZIQ29JRnpyZGk2Y1plT0tY?=
 =?utf-8?B?MEt3anZoRTg3NEJad3RWTFQxYWZLa05DeFI1elppSWl5dUQyL2xYb2tVNFMv?=
 =?utf-8?Q?hNGI7Ma+1hnImSGJKj7FEQbHPzj7D1aotFwBcVO?=
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45de828f-27dd-41f1-b93e-08d8fdc20ab0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4419.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 14:48:31.8841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+Wsl95BrvI5mXaEhBT/V24d4Od3FznG/lDlTi/Z5X1fq+Z6brnM+5tIYAVyrkFk4PymwDCrGOOUY0lLxeBOZ4wP4MSLHmC2m2WsOFYXWd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0202MB2881



On 12.04.2021 17:10, Jan Beulich wrote:
> CAUTION: This email originated from outside of our organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> By excluding the file from being built for !HVM, #ifdef-ary can be
> removed from it.
> 
> The new HVM dependency on the Kconfig option is benign for Arm.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Alexandru Isaila <aisaila@bitdefender.com>

