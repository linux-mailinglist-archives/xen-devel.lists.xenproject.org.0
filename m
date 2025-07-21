Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 221C6B0C3FB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 14:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051482.1419813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udpVD-0004zE-FB; Mon, 21 Jul 2025 12:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051482.1419813; Mon, 21 Jul 2025 12:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udpVD-0004xA-CA; Mon, 21 Jul 2025 12:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1051482;
 Mon, 21 Jul 2025 12:20:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cu2o=2C=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1udpVC-0004x2-BR
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 12:20:18 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2405::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0eba4f09-662d-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 14:20:17 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 12:20:12 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Mon, 21 Jul 2025
 12:20:11 +0000
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
X-Inumbo-ID: 0eba4f09-662d-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5FlLqXtQNZ95PPk6BwomHvPX4s438AV86WFhBCqFP9NFY+6Ac3DZIuOOWLJ+lZqsGgKd+MizGtcBkwAcqusz3QscaSVs2IJVww6PsF8HUSO9k69oq8CrsbrNDg2ySiIt8QQgQn6S5gg979txYvu5z7fCmKowT+hwXcI9m//jMbkK/onezJ0u1s1i/R7VXcFcrGFTyMnLDK0j+8E3R05sehckU7+6/ZoarV5fIxzN9Z5L0SywXacdEXSKKRtQcLyuRqu5uTwEnnmI2BAkL3pI9TPcFziy43NH3llrhv4aFoot/iUEnrZmyvx8oJboDax9wGdPRX3nfIzbR+EasPLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3A9joN7rrNCzWqh39Ehg557gxwyVD0sWfXzScVcEx4=;
 b=Dyd4irL45QrcFS0YNd0ZT0AnbOQvfXph49C/tBzMKDSlhs1+b3ShtUhxtHg9gHiBztopFZltuuZ2GOVheZBthir2BSOJZA3W8UPwY9PvGaTFAeGEfgb4RCI9/NL3so9Y1cTB0aUoAOnQVplp75PUme/2wJkjLDw/jaXzp2+sC1mNJvucUjtoYJU0zNE+eEYNK77aHKUSVuA56Kv4vvaMhe8VO13OJhfFajuqtxB1B5aqGrC+mh71Zjsd9cpb/AEd22CWE/OAoisj7rWLdf6CpL8doD8wdUyR3C+W6BKGk9Nnns6o7ggngDKg3+EK6SBiL6ocD1kHIcwA4vrUNSlm0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3A9joN7rrNCzWqh39Ehg557gxwyVD0sWfXzScVcEx4=;
 b=ZAfYzWWdZFAd1rwy5IbWNimjmDGjb04B3sHuHa9WDSQTPhLXR0NZwWIH73Qr+Mpv7uwPr1xbeprdr3NJ0RqNCtzR9O+IXOgmJIDWlqwUqJksJFafXr0LsOCY8N7O9PFXhIorap9hBsqrPiv61bbWJC4Y31Somz3i4V429Otb+KQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4578fcf0-735c-4622-8f4c-731c404da569@amd.com>
Date: Mon, 21 Jul 2025 14:20:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/arm: remove unused dump_p2m_lookup()
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250718101535.3109001-1-grygorii_strashko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250718101535.3109001-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH0PR12MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 143f777e-14c4-4687-0f74-08ddc850f091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmJnRExXdmViMW1iV2JpQmlsejVSMHUwSnIzcGthSndXbm5lMU9RQkhEOVdJ?=
 =?utf-8?B?OUV3L0FldnM5aWZWU2trYTFnUDNyNjVGUnovVWdvUzFqcUdBa051aXFpU1Vh?=
 =?utf-8?B?YVFVZmg0Sk4xR0E3MStYWTZBVzI1aG5WUGFmQStxRVJ3RldmMnUyTDJRZFE0?=
 =?utf-8?B?VmlKK25sTXZ0UmJlNmluM1lzMEdKVEtmNEdFOTZKMW1vZFM5TUt3bFp2MDJV?=
 =?utf-8?B?eHlDbUJEZXZrQ2xxR3BkZktSRmppTi9ZWCttTzVkU0RlZUlGT21vL0pqbHNM?=
 =?utf-8?B?SmtPY0xzYm5xc0tOMEd6SzRDZXdzTGVDUmphamlOT00yaDhMdm50eVZUbnBY?=
 =?utf-8?B?RDc2ZWhvSUlXRk1GSVY5SDRNbmRFdytiTzNDL0YrbHV1RlpPNXhheEJFT3ha?=
 =?utf-8?B?ZVdiaUVodUZtWnpEUXFOdUdYQmhlQW1FcVNoRFBkQkxQa1o3bzFHcyszMjZ5?=
 =?utf-8?B?MFQ1dFh4USs3VlBsd3pySVltQU8vRGhsNytQN212bkxOOXp0OHF4eFd4RFNI?=
 =?utf-8?B?NnY3V2I2MVg2alNEYXl5Wm9DZmc2VEx6eEc5aHFlanRRdjRBRGhMUTF3VDBx?=
 =?utf-8?B?SlRHSnBZbnA2U2VqOWNFWUF2ZkdlT2dBTm9Na1p4VmxkZFRDS3JtVUxrN3R1?=
 =?utf-8?B?eVo2OGlGb2VrdXpra2N6V0cvV0JCV2RSMVgrRjFML1Nia25qaWdrRW9ZWHNr?=
 =?utf-8?B?bDcydHFVdXNGejREQk5lZzAyTDVZSlY3cWpZNUc0cjZwcWNoL01zSFN6eWx2?=
 =?utf-8?B?aGpDZnpRMWJkdTI5K1hrQWYxMzZ0ZUxYWWFzTkdTRVRpWDdFTk5CUEV3YkxC?=
 =?utf-8?B?RURHY3l1RTExMzZsWlF0aXJYREFnUStkTVEvZFd5ck9PK282VzlmMjlMZjlG?=
 =?utf-8?B?TEJuMTZFajdiR1VkS3RSeWROVHNkT1lhZi93b1dIOEVML2FIVlBsbEpqZHNB?=
 =?utf-8?B?MnQxVFFVVkw1V3hTbng5UzlRVWM2ZFdNMmtjMllTRUNwQXhQaUNOTERteVJ1?=
 =?utf-8?B?QkRna1BXNnFjSVRwTHhweDI4UjJMcmJnL0thZ2JKQWZnNytoNFFRTmZ2OE9i?=
 =?utf-8?B?c1Y5V0c2bnlwWUFEWkxDUGtKT0JsUS9ldFpLSlpJWFB0NCtmS0dxdFo3QlpF?=
 =?utf-8?B?Y2NWd2EzNnFxRHVtT3dvUVhQcStNN1FlSlNSNUFqbjFyL3dXUVd6ZmdCak9N?=
 =?utf-8?B?TGpwaDBRRG5nbmlEOUdvZkhLSGR3RkFWeDlzcTRuLzVsb2VkeGJhRko4T3Ba?=
 =?utf-8?B?UVlTSlNSSEFIZkswMWpRUlZ4TDQxK0hkVzFzUnZQQlpNOFZsVXl0bmlsTXlw?=
 =?utf-8?B?cWhPZmhQWGhtSDE3bkF2TU1TWk5JN3ZNazBDWUlCQmYrc1NFZ2FGQzBqVmtI?=
 =?utf-8?B?bFhRU0JLTmVBNUIxWEgxd3FXSUMrejZUM3hMM3pHUmVMcDQ1L3UvaHZLQXhC?=
 =?utf-8?B?dTRxdmE2eXpTbENaQ3BOaFozSktWN09CdTFhMzN4cXZNbzF3SUgrOFZhMHcz?=
 =?utf-8?B?cDBDbWozRXFhQ01LWHZqd1IvUWwrTzJsOGlPNUQzbHoxOTE4Nm5PNjhpQzhZ?=
 =?utf-8?B?dVhqYVNEZWVMQkFrTThINTl4UGpRMTRDcnl0TEl2RS9Lc1ZDR1ptUjNIUDc4?=
 =?utf-8?B?bnVNVDNENnQ5VE9XQWdzSHdmdDlTcHd3YzZKRmdyUU9oU3Q2aWtSYUZEKzZE?=
 =?utf-8?B?eXJjS29tWTJjUUJXT3RReWl5MmRUU1NJR2t5Uml5OWhXdG53aGJNYWd5aG1T?=
 =?utf-8?B?eFBRYXlSWlNTdmRsaTFPMFgvdkhaV0Y1M3E2MUtPcFoxQVdMUUVPY1hvQzU5?=
 =?utf-8?B?dEpNK2hRVmJDbHNiSUlpNlpZQVpsME1yNEpYVDVhUkRIc3MrbW9tcG05NWVN?=
 =?utf-8?B?M21KdDdsZXhYUDJIRW5ZeUcxQ282NEdTVkFNalhJVHpzVkVnYXpkajFjaFp5?=
 =?utf-8?Q?n8zhd5CD8LE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejZQREN3anJhR2UzNFNpaHF4UXhid3pTVlZmSzVvMEk4bGxhZXJhaXFSQTVP?=
 =?utf-8?B?QUF1SDBPRkJ2aFVnOE01aktuMWxJSW1ZTGZEQW1XNmwwSCtZWUt2ckpNZm1h?=
 =?utf-8?B?bjdyWVY5UWhmKzRqOWlEbDFPREhrYjFudUs3V3lqY2kvVHZBaFlyMk9TalFo?=
 =?utf-8?B?MTk2akQrMXVVVFAvbngvNzJQdHBtZWZnNUlqT0RPN0Nsb0Z5YW9jWTJQUkJB?=
 =?utf-8?B?UWVzWEJ3OHFVeVF2MVNUaERFbFNQOG1STW9kNFJkWm9RTUNHZ1dZZ2J1czhB?=
 =?utf-8?B?YlNoVWI3bWVlQ1hkOVhzNVFSWFFQYnZrTTQ2aW9WZDdzcFQ5VUF5SnhBU0ZK?=
 =?utf-8?B?dFV5aTRzVTZYRzJTWTlmL1R0U0VSWENoTDl5cFYzSFNBRkI0QUo1c3RmZkZS?=
 =?utf-8?B?dzg0Tjh4cWdqQ1hCeDlwcGIzendwZ2pBcEIzK3FEcVFZTXhHR3dUSnpXSnFJ?=
 =?utf-8?B?aWU0aVI0cVE4MFRBY1hRbUcyL3A1dHJPbDNPVk1PS2YzR0ZORkZJOGVnQUFY?=
 =?utf-8?B?TXY3cHk1cVZkb1pSdFpxNjUvd0NxYTAwUnpNVFdHeFdGNzNpNHJwK2NvL3hw?=
 =?utf-8?B?UkUvcGM1a3FIaUZmYmNDOXFNU25yaEpoZU5IS2ZJc0VIMS93cXhHRDNPTVNW?=
 =?utf-8?B?eDZRS0FNZEdiNUk4Mk42aURrYU5FOHFyYkpOako5TG1idVB1UmZkSWhEMXNQ?=
 =?utf-8?B?U0ZrbUdFZUVwTnBXSE1HWjNOS295NS9nMFJzdDBRdnIxMUNZcEw2N3RXK2w5?=
 =?utf-8?B?aFR3cmJDSnc5endjN0xLZXNwbmo4RlY0aVVYQWNzWVg2Y3ZxM1VFZDFHSW91?=
 =?utf-8?B?V0I0N1NHdG5SczJqdXprZkJLUUF5aS8xVS83clNpVWx0Q0wvOEREeDFwV2RJ?=
 =?utf-8?B?U1dMVjI5VGZpMWlqOGhYekF1TjZxYVNzK2V0ZGgxclZZRTc2QThNd0RmUFBh?=
 =?utf-8?B?bWNHZS9Tc0J5cy81TS95a2dvenhtM0JpalhEK3dEaGZBamJManRDYjlHc1JF?=
 =?utf-8?B?U05ZN0xHUXc2VWxHQ3pDQ0xrUzYwS1dQaENPejFTS2F5KzRiVzNRekFRd3F0?=
 =?utf-8?B?YUVpMGY1M2R0YTB5K0JrZWdIK1pmdDFrYllORVhZalo2WkY2b0pkVFQ2aVNu?=
 =?utf-8?B?ZHRVd2VMY0tycFhnMXExZi9Hck5Uc2swbXNIZ2pnVlFldEJzWGJBSHZkWUhz?=
 =?utf-8?B?bmdReitVZXVuRjhrTlhId0ZWK3B1aCtaVDFOa0RicU9jVlVDVVBkZS9naWlx?=
 =?utf-8?B?VTNocEs1eGJOMTRERkNadi9KYmtXeGFIYi85L2tiaXdUdTdDcU1yYi9jZlVK?=
 =?utf-8?B?dzF2UmY3aEp3QXAvWXJZdGRST2R1NFMvV1Q1b2hNNGV1Vk01a2RNUDdtQWc1?=
 =?utf-8?B?WkpNMVhrdENpWS9EWTZIWUFFRWZHOHNhZU1TajAzSWtEaWlZTnl4d0kyZUNh?=
 =?utf-8?B?bE5KMTJXRExMa1kzWktCRnh4V21pbDQzS3d6RWVjUFJYUTMvOXBBMGwzcmJR?=
 =?utf-8?B?d3JvQlJFbmhsSC9Pa0Eyc3MxM1VQczlXR0NIN3JiV0g5MWc2ZnM0dXN3Y0tM?=
 =?utf-8?B?YVJRakhaelQ5Wk5kU3N4SWNDMUFoU3N1czFYM0Y3QWt5S3ZMSnVMQUlEZGJT?=
 =?utf-8?B?ZWJEYjBaY25YaFcxd0Evd2NCNCtSSlE3VHlONDQ2bSttblhiSkJIT1dWSnRu?=
 =?utf-8?B?TCtNRXU5VDMvallTRXIwNEpHZDFpN1NEZGJsT3NUTlE1NGNWRjlVV0FmaGdB?=
 =?utf-8?B?aGN3bXhGeHRpTGRES0N1M1pLWDlYd2dnRFdtcGUwZnBuUEpxMHlyTkJLNFBq?=
 =?utf-8?B?TGV2UVJyM203bzVqVUhnWkphWjViekg4NkdNS1QvN213Zk1TUFlMT0UvcU1n?=
 =?utf-8?B?TUp3cHVWUk5peTBZYnJwUTREVk5mQjVKNnYzVlBOQW1LNVBuazdza0hpZjJ3?=
 =?utf-8?B?a1ROY2tWdDJZYVN0R0pOVVlKMEk3Wk5BNm8rS2VNRG9OVTdKclNrUGxrRFJv?=
 =?utf-8?B?L1NYSHRkK3dqTlZLTEpiZmtrdmlvZUNSWno2Sit5dFZ5MGh2WUM1Q2owcEQw?=
 =?utf-8?B?MUp5by94TzlHWEhEelZSL0VwK2VURnBHdlBYNW1hZUVqRmZzaUErTWlBbnh5?=
 =?utf-8?Q?10nI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143f777e-14c4-4687-0f74-08ddc850f091
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 12:20:11.8975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6hrDKjDHvfAmw+Mb1FLoj+kGSW7vmbANkl/eGHHFZNvQLW0swwb1iEUH9OrAkIx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7486



On 18/07/2025 12:15, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The dump_p2m_lookup() is not used, so remove it.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


