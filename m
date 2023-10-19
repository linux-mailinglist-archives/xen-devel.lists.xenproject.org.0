Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA07CFEFF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 18:04:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619505.964683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVVc-0002jQ-QL; Thu, 19 Oct 2023 16:04:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619505.964683; Thu, 19 Oct 2023 16:04:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtVVc-0002hP-NR; Thu, 19 Oct 2023 16:04:28 +0000
Received: by outflank-mailman (input) for mailman id 619505;
 Thu, 19 Oct 2023 16:04:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtVVb-0002hJ-9K
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 16:04:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c7583a6-6e99-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 18:04:25 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB10047.eurprd04.prod.outlook.com (2603:10a6:150:117::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Thu, 19 Oct
 2023 16:04:23 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 16:04:23 +0000
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
X-Inumbo-ID: 2c7583a6-6e99-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMtUUvh0Cv0UbuwSXlO/BSzeIeyrHU8Pe1TJGhgYu4B6L4T+wUWS+jUmpUtli8s5XnAUiADHE1MkD64tYP485lSJX0T9Z7+vt42Dgn7pkm4RMFwoGG0eZtJg/0JeRta4GI8Lt6jRQfUoFerlHeCCQAwzNPgpsTv2K4Xr84a37f4mVjjuMpp37g0J+DY0hZYuezog5Ydp8MPyJcd9qigdAMtLLF5KLMG8h6tIMyztBhMg/z+8JECBlXPdUfduXDTvU8cyAeTSCK/8nzm8lWGrAkKJsd3mp3GqECoPm59f6/BQlA6Gpn0xL9UnBZD4jMWJEQNyGxC+BFOA3Iz0p6CQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDzsckul1S4cNUeSrkIDA9DYg2SxvtrcBdw04tKj2kY=;
 b=KVA3bC18+JIAcZ5h1uqyaBbbRVFPV5/q1clJxE755HbwDFN4cS0JIoogzBpO/CAjWWgK44QrMvMw1I42dB50SXsoOcKQL6B/r7085c+XaJtj3lkxMogskC8XaQ87PGle44OqJUmSZcybUCYIzva/rYjrIuLWAYKRlGnFqgWFoI6MGrtZGSBVJILzqpYnyO+oQCz3mDgRi+bD6bBQe9AQCGL/px6nwdsRY1NVR21nz4ex1iR3era9Z8rMa5b1mzPZ+IhbdrNrXe2Qg5Bjy2F0zQi/PdgQ2tYHjqdumsTXk2hsOZlPWieNx3tsRen9DmlvrwKBkmj+byychwYb5a3odA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDzsckul1S4cNUeSrkIDA9DYg2SxvtrcBdw04tKj2kY=;
 b=I99vkH4Lb8jsd6xL4bzqtccIBTScsPeJYrE33ISfBQMEBUnrnFsTi3UbIKt/kKfY48kRmFA+CGhWV43/nXDeKXkfi4QkRroqRg+rZRy1MNVgxbTO1gGUP2H7NuZwaiQwYdNk3ncOG2IgIFpsCWNH5rLAtym29gBpSxrNjPrASVjK2kqg2r3u4PTb+ND/Ju0YkTtxm4kME1QFDBFSaPK0AzSpjx27qh6XHQqdO529epx0iM/1hm7E5GUuYggtDBn4Y2zehHOXQFWgvtvReIbQB5sgKLrg2wXbA81JmweS2HTGqzqiki7ZNt8tgIVQLyaPQzTtkFlEZUO/VyCxWR8Fww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <148c6dfe-728a-9f3d-73ad-fc7cd7b18277@suse.com>
Date: Thu, 19 Oct 2023 18:04:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v8 3/3] xen/x86: address violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Gianluca Luparini <gianluca.luparini@bugseng.com>
References: <cover.1697720584.git.simone.ballarin@bugseng.com>
 <c76165797b4a6ae92a514e512fcb3dc0cc9b01fc.1697720584.git.simone.ballarin@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c76165797b4a6ae92a514e512fcb3dc0cc9b01fc.1697720584.git.simone.ballarin@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB10047:EE_
X-MS-Office365-Filtering-Correlation-Id: e3893a05-4901-4e24-104b-08dbd0bd0f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QhVtQYZFic8oY5cDUkStrVH/tcZtizY22akrWPvtoupGTWhhWdUyL3JFDTP3AfsKGSNuTgBgXqcjdjRAuFDtHxJ+CYMS7RON8O4i0SU35pWJaDEnn/SDGzzsvFIQhgCkdFWp2d4tluPCmk7o04+N+CWX7hKiNCAIQuqnyDLjrTXB2olKs5wMxltpDrthcLd8EGGGcn9Z8u365/V6yClIp6l0o576cgMrPojI+zc2HDs1dIujqpRyDU9R7hlc+eBYLas0i987OP9/QqhzrqpIj0uOjHk0ZSe9syfDS6gJkq852yWDdk2Y+gP4EAwOsmd8uwaKT9CegcmEmNyywDUXOvZjMltf/L/SXGudbzwMrIYoVBzIDgPwX1SDmTKADJ6BI6N8e6vfQAMVGd18JhoPbXpRlcqM5fWpEFtpzm1kZUk6B1lP67dM31eaCEd+Ie2yFWYnpMewUK7zHWdwAU1p1rksGEaIo5UPZnV940DO8h3+v9IMRpY+2/b12qSHEW2vmmO+Y2MVOmy4lZtWKJ6Or/2J/KJKqo4fb5LWRQHxD4nXGV9ro7aTmnMZpTP5sLgDZkz5j/O/w7jit0CP48a8Q73/4WkYR/XHt79lxfaDPG77wepxYManqiJBybdDzIH2rIfk9H8g8FMTosf3Zyb5qA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6512007)(26005)(6506007)(53546011)(41300700001)(4326008)(5660300002)(8676002)(2906002)(6486002)(4744005)(8936002)(478600001)(316002)(66946007)(54906003)(6916009)(66476007)(66556008)(31696002)(86362001)(38100700002)(2616005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3AycVpKZzdzd2ZDNGNmaExocTV0Vyt1aEpzUlAyYW1rYldCSlA4VWc4M21n?=
 =?utf-8?B?VWlMVk1aakdVNmhocTNqdk4wLzJURitpRlFKODBxSmYvYnNVZ1N0Y0c5Y01B?=
 =?utf-8?B?bitKb3hXdVIxditQbDRFT25CVXl0aXU5UVBMSktPM1pVT2lhME5ReFQ1KzVl?=
 =?utf-8?B?eVNEZ09IZnNkaEx0TWdXY3d0STRTYzFzL1pqQlBzTDF5d0VkVWJnME1UM25G?=
 =?utf-8?B?L3ZrVDl1RG81d1NQQndlNWRyYnpMVGNBaXVKeTR5Q3g4UDgvWU55SnF4UkFV?=
 =?utf-8?B?eTAyY1kzNDhzTitIcVV4THFiREhUaXlLZmF4STQxMEcyVXZ6QkhaTVJkbnV1?=
 =?utf-8?B?cTFBZkxwMzQ2M1lmdThzN2s4YURhdFV4bVk4SkFDaEJEY2NiOTNYWHVSaGZ2?=
 =?utf-8?B?QkdBWnhGNXpTM1lvcDJVV2Zia3A4UnhSeGxxYXczaDlRb1lwUHVTckI5VUFt?=
 =?utf-8?B?V0tUcW5NenAyMUcvODFkcGRXbmFwOElSUnluS0xuRGMxYXVGbjBrcTNzUkRJ?=
 =?utf-8?B?VkVtcjNSYVNxUmlEZlhBMk5nWEJhNll0Sm9ReUEva3UxSi90UGF2L1RJY2Nv?=
 =?utf-8?B?ZlRWRXRSWW41TUp4d1o1REN0SUJSQzBHM1NqWExvWkxydTV4KzRLOHZteFVY?=
 =?utf-8?B?OEdRMEdlVFk4S0t0SkhlZHFtZDVLdEMwVUdyekdIdDU0YUlLNFRXMUNiMjhE?=
 =?utf-8?B?Qm1xWjBJUjgzQTh5dVVQVzFRR0N1UTZKdEFNcm9qRUIyYUNZTTQvdFNxMmdi?=
 =?utf-8?B?b3h3MXNPRDl5QWVZVC9lMjhDNi9PR3FJbjNuQnlGK25iOUVzQ3paQThBN3Jo?=
 =?utf-8?B?U05vZnVlN3ZIMkE5ZXZXOGdTMnJKcVJjZXRlaVhLVFJhOU5WeEtDcnk0dlly?=
 =?utf-8?B?dWZER3piMjVHMjJ6QW41b2psQ2grUWFPUUU5NGU1L0pqbjI4aHZLaG9yNmtk?=
 =?utf-8?B?Z2JjOU9Gb0tGaEJpbllaRUVKQTAvN2I4U296WUM2WFJLUXk5eklKUHB1bFVQ?=
 =?utf-8?B?N0RtSDdkT0hhR3hINzNxL05vWHhrRkdWcElBUGUwRXpiOFRXZ1RWcTRVTHZU?=
 =?utf-8?B?QmFyU1Bxa2JzcS9mVFVuVDNuUi9zVTNzYncvT0I5TEY4dmM1YjIzaDdld2hF?=
 =?utf-8?B?WDFYQ2tIOE9PMG1DMGYwdWlKcVZhTjJ6STU3ZGlpVjdQWjJkYmg1UnBPSFFm?=
 =?utf-8?B?Sjd4QlVta2doajd4ZVk1MHdIRXgvK2VrbzlocWVMM0hCU1hTbG9kN2RYcG84?=
 =?utf-8?B?MXdONzU0WWxXMERmaUw2RUhlWTB3MFZScGhIbG5uNWx0dk1ueEZWVVQxblZo?=
 =?utf-8?B?TkJXU09JeXhFS3dES1JXejM4dmZPNStTOGViZzYrTGxOYjhmb09Wd1Z3RHN2?=
 =?utf-8?B?am9ES2ZXYm9HcHl1UmwyWGxydjAxbEZQd1I5L3VyS0tyZjE0K25tRko0bXlx?=
 =?utf-8?B?V2dzT0ZEbTB3RjZBQzhGakhML3ppYnd3YjdPMXdKZkVEVng5T1VjYzgwdFFy?=
 =?utf-8?B?YnRmWm9pTTF1RUpHMWdOTEVCMGpOak5CWWx5WHdkZ0p1RjJWRDlWc2lDSkpF?=
 =?utf-8?B?Zk00eDJwMVJRWkx0dy9XVUNsWVNKOCtReTlOUHBjWkZwb0VOOUFkdkkxVG1q?=
 =?utf-8?B?S3JqNFVsK0tNWWtrQ3dzeHlXU3VUeVVNUDFrWkF6NEo5TXBIcnRudXhGalJQ?=
 =?utf-8?B?Sk5tbnlma1hIVmtZcjI3WkcrRmlRUVhUTDZHUmNhMzJyQmFoc3lqUlhuU2F0?=
 =?utf-8?B?SDR0YnRGSEwvaG1nbGZlRGwrYXZyYTByeHpaTmMrT1VGUWQ3bk4vTU5mVWIz?=
 =?utf-8?B?bG9NRXlmU29jaXg3YW92RWNRNHpZeTB6ek9weGFGSWVzU21pTDhldm1TVGtE?=
 =?utf-8?B?NXBDM0doak9HK1g3NDkxQW02R21IcE1mdlVKUnRNcTZCN2VjRmhmNE9rQ0xJ?=
 =?utf-8?B?YmxmYktiVThUWjE1Qko1MVUxbmpPUGRaamVjQk0yRjd1UkVaR1BnYm5nMEdq?=
 =?utf-8?B?RDJ1KzYrSWs2ajJ3WlUrUkF5ekZqUDlLdGdHVU02V0NHWDJ0VGswVE1iR2ZZ?=
 =?utf-8?B?UEQ0b2xYOUFjWUo5TlV0dDIzV0U4dVFWQk5abzBUcG95WE9UTVlWcVZUWGhO?=
 =?utf-8?Q?hq34rG1jKtF+bupHgYd+O9xM2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3893a05-4901-4e24-104b-08dbd0bd0f82
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 16:04:23.1489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4Ofh5viZxRAO447qx4oARSkTxIDjSYlBgENIIL4mS+R9YL45c0pd1bIj3PbqIJAn/YfeuELHatZlRMYfhONHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10047

On 19.10.2023 15:11, Simone Ballarin wrote:
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following change is made:
> - add the 'U' suffix to switch cases in 'cpuid.c'
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



