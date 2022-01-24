Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 803AD497A44
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 09:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259728.448216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBudZ-00008j-VX; Mon, 24 Jan 2022 08:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259728.448216; Mon, 24 Jan 2022 08:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nBudZ-000071-Qr; Mon, 24 Jan 2022 08:23:41 +0000
Received: by outflank-mailman (input) for mailman id 259728;
 Mon, 24 Jan 2022 08:23:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=REvy=SI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nBudY-00006f-9d
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 08:23:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ede2b44e-7cee-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 09:23:38 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-jmuenR9-NIyFSgnLViRTSg-1; Mon, 24 Jan 2022 09:23:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3587.eurprd04.prod.outlook.com (2603:10a6:208:26::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.17; Mon, 24 Jan
 2022 08:23:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 08:23:35 +0000
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
X-Inumbo-ID: ede2b44e-7cee-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643012617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jTVc9Cn1qLnFkxNzL0j6MTp9wDoAuSyM/HOPcj/CeNQ=;
	b=HC/nJT5xHd4iIOMbzJlbUslSD92HtWOb+sCoTN9QwALZq45H7gw4cYkgkikrBgEhPUJ/tO
	yEM4iME0IynDsZ1yt2w3i3SqukZcvYbnhiSmNB4vDvqNakaaiaky4kNb4cDHY4s0BV3in/
	+SEAX4Qh9WkBC82rIlosfFVysuOlhW0=
X-MC-Unique: jmuenR9-NIyFSgnLViRTSg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcvQ6jYRUlMWxOUiuqOQiZZz+4WuZ64Xr5zjjCWneMWCM/trc5bIZ0GYwtiU7lAgiiBr2foQCxARdR0AZr0pXvEjxrOArtMq/3m8w/E37fhs+S56w4OKRIKC1lPFagwv/0SeW1Gr7IN0li9Mf0/eUG6njgOT+HBbLdJHkTFnP4Qq48YIbemp8IosDJ7FYHgYKf3UjgDzGd5tBpRCBopxlaodOJY9AZQ6q7Tztr4f9jDBfGFm1W7LS4uNSvOfGF9okCBottitxH7qEXh6Aj6HZ/rYFYAGzipzjeq/CcFW5tf+Gp8d1IX8ym9Jpx3P8cWtIs6um9PoNu/EZLguBhZBlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTVc9Cn1qLnFkxNzL0j6MTp9wDoAuSyM/HOPcj/CeNQ=;
 b=mRNfE5FwGhcrkv0ZAIZfOLZcHX6mBCL8WO/JrnlVofa1sUXUTkmPuis5ISEfLsglNqF3gEnGIZ8NJ5B5lb6QvfQ8nyFxoy48xjiCakXCToM6s3qbkJuqwYlZNR3BJ2hjKAocrThTLidl8IAeERxIy9iWlXEP+CVSDLUc+pPqA2V6GVL5PFAiORfN+hJPJCF75ZsfoiQLd9FF8zgipdZx1jq5lAhTzPNXxdD3a0bNRTTgG0IYXeVU/G4I72Xz0njsWFhBBOVUZP8q3oYQUeCEBPSYLTtgwK83jKq5SnJ/PQdk2WVCyKGGJh+8xxN6dQymbiDFBROL6sMnEWArkl7wEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <879e5b70-bffd-b240-b2c8-c755b09d41a9@suse.com>
Date: Mon, 24 Jan 2022 09:23:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] x86: further improve timer freq calibration accuracy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0021.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1202db5-0656-44fb-e090-08d9df12d003
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3587:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB358738B2BFBB669F9D061EF0B35E9@AM0PR0402MB3587.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xcwkNU9PHvXeuDL4sBURz2oGo/T/arj0iGsKzSxrOvPTcfW1xLqnn45RdoUt5GGhMfDOLdNcuCLeKlZDkh2fZVZrJht8Dz1IJr6T5oB9LZuxS6tpOtetyKlHxX2m5R4VA2KdQfOz//QzWkmRRduiJBhIf39UrhADO4xbTJaBGaXQ3Ey4N9JMwxgn2AdkRtKbsEP185AVeVUPrZ2lzDvUxsUmlJhX4kQyBC17WRFStieof2DGUm18OCpIPTBT70aqewqfD67uHtdEtKrH8P2sdFTGia3P+gvplIordjvPSiSE69ztt0uqDcKblQdn5eof11wYNQijIuaFFFWb9migxuarV+Ig6pLziGL1xgcWtkWmG9p+0NsURtRVG2QlWaEnzxFCNahFp5yj4DDgoGye4f27r9ORboJCEVILw91Ksn2kSO8FgPnS5xuUkk/iLu5sIiSa4nWIZhC4OXTisSyxHGZRE0FGsioJ5PouacDCgTV95N14PtbM8E0aE/5bT8h5ziLcYzf71GtyDpheOoUHgX4CuGXk1N1UlemmRjtcTowamHEPyiCLZ5IQksPu1jXB7E8ZAtArTk5KMeRQlMtTfm19F/9qVXg07JkKRc7UJR4rljcATGYtuxklobS1IV5z+yKX7ZbrSeFOl37yx/nR6opiKeFh75ScqWIKkqXCoOaqhEF7xHXR0Ojy/IJSa4Bzt7xd1knpE+3F5EbLTZHqd64DpkGPO+LPOEVgXGKJPEU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(2616005)(186003)(31686004)(26005)(4326008)(5660300002)(6916009)(8676002)(54906003)(66556008)(66476007)(316002)(8936002)(36756003)(6512007)(6506007)(2906002)(6486002)(31696002)(508600001)(86362001)(38100700002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE9VQ0hldkdERmNIanNIQUhGaE8xUDdrZi80K3loYlBJZmhjejhrc2o1VkR0?=
 =?utf-8?B?c3hFenVpZHNwZDlYWDQ2TmNCQnFUazFrM0liUVp3K3JLb2lPV2c2VmhXUjhF?=
 =?utf-8?B?Ym5TSjJ0N3RBVGltUEdEWFhvUDNSTGF3MXVBM0I4OXc0N0dTckVyZGpHdHJN?=
 =?utf-8?B?ZDdXWFNiamJWajZLd1lKMm9SUVdIRVQ5SUVJclZwTXVZZk5kcGZRRFRBdW5q?=
 =?utf-8?B?RkJHMmJQMG4vRWZNRHc2WlUvMUduUS9UZUgrL3NVTFA5SVZOT0VCU0NvK0Ex?=
 =?utf-8?B?di9mdElKMzFlL3pYZlo1UlVncGNaejE1RXNiQnlwMDhHa0RCS1JLQU5xRHp4?=
 =?utf-8?B?MzhrTXZTYTlUVGJ5dVZaSGd5VWYyaVZTK3VzOEYyNzZFa3J0QTZKSWhtS3FN?=
 =?utf-8?B?SEl2em5GNmRmb0pjaWNvVGkrTkpRYlB2T0l0L2d1L0hMWDlpS0ErdlB1RnVV?=
 =?utf-8?B?SXRDMzRPWHVHUGVzU29oNjFPTFhkQTRPRTFYUXpTKzB6YktZVVBxVFNvRURB?=
 =?utf-8?B?Z1ZVL3pGQllQREx2MVliSmhGR0ZudGRkYVlEQlV5cnAyWC8vam8rYkRRQzRB?=
 =?utf-8?B?WnFnQUh1c1MrNkEwbWtZcDdRZUlTUkljemJiQ3VJYjJQV0lYUE5KT0Zwcnd2?=
 =?utf-8?B?UFllVU9QanZLbk83MTNFMGZBbUZ0amRNNnlrd0dVdjdJMUl2eHI0RFVKcm5U?=
 =?utf-8?B?REVnbzRWWGlTSkRUdjVwdytmN0ZNU0xUZ040WmlMVi9pVEg2bytUUHRWR0xs?=
 =?utf-8?B?anB0eHZXbTZ0ZUpXR2VLckM5Vnc2S0NnYVZVNGpLUmdIQk40QTdTWXBoTlZl?=
 =?utf-8?B?QVptdk5EU3ZLbzZaMlB4NUUwa1RJQzVQM0VxN1Z2cktZZU1lVUw3dmFiU3R0?=
 =?utf-8?B?a21aTTRDTG9nRWNRSFpxNVR0bFdoU2NuQ2lWU3NtUE9NTTdzNXF2UjJSVXUy?=
 =?utf-8?B?bUhFZ0xtRkNhd2JwMnRUcHp5aGdRNjdMQTRWaTcwSGRGTkphNXIyUmljUUlY?=
 =?utf-8?B?d2RCUkxZTkIreXNWem14QVJIYXVSV05XMDNMU1Q4UjNOeFVJUDNRSW5CYm95?=
 =?utf-8?B?Ymdvdnl1RGZDMXFJS09TL3RGdlJzcDJXVkVMVW8xVzl5dTRLR081WnpneEVj?=
 =?utf-8?B?TTNrQzFNNEdpK1B0bVpSSmk4WHlhOURQbERRUHFPWTBVYXBDOVNUYWVjSis4?=
 =?utf-8?B?UTM5Y0ZOODJHVko3eDVNam1NM3gzd0R1OG9Bbk9PbnFudXpFMFlPVEJDUE43?=
 =?utf-8?B?VU1VUjBCZ2dBVmpGNWtjM2tZNmgwZUlGaThob2NsNWlQeml6aXRSZmVvMUdu?=
 =?utf-8?B?UlRvZmt0by8rQkdDRW83c28rZE9mVGhCalZ2UVN6enppZURuSkFKSG54bkM4?=
 =?utf-8?B?ZG9YWkNCSWFlQXA0ZFFpaE5WSDdHWEVkajZ6N1lMZGtGZDVXaUI4SVlVRzJ3?=
 =?utf-8?B?TGxhN1dIM1ZXVkoxQWRpSGViR2k2RUI0M1NjNkRKcS8wbDdNb2hhOUtrTWJx?=
 =?utf-8?B?aWd3L1B2MW1tU1UyZ21XWkdWTU1MUGJzRDFncW1WZlBzZ3pVZW5zVmRzdkhG?=
 =?utf-8?B?TjBnNnpzZEJ2TDdMNVI1TUZnZk5jTkdrd0RTT2R4ckp0czhMSkZnL1EwZHhM?=
 =?utf-8?B?NndicUhWSmN4cUI0elpCTmRraDZ1b2c2azZaR2F3bGVNNzFrRm5qR05hdEVJ?=
 =?utf-8?B?OGFuQ2R6aXRsN2NneGp0b1NvVUcycTRUSE9VRWc3TXJ5RHRMUDVPUllXMlZs?=
 =?utf-8?B?NmhlSVhHbU1EdnRENllMMi9jMVRCeS8wOSthd09peUFnVHBIaTVsY2hoRWFE?=
 =?utf-8?B?UTlMb2FoZ2NnK1B5SFJvS2NnQ2JQMEZ1Y1RRRjRkZW1IZThocUxibWdoMUVV?=
 =?utf-8?B?RTk3OTU5U0hPOFhFeDVkZkFQemJCQSt1MWQzRFpOU2FPNWIzdTdFeEVORVZB?=
 =?utf-8?B?K0ozZnN4NnBaZFJaNGExSkRDTGFnYzJWUkhQS1EvSWVKUVAvaGZxdUR6V09N?=
 =?utf-8?B?SXJuTGpWQkZXMmtpK3ZPZ1pLRTdGSTc5aERSR1RTS1ZzQml1Q0JyLzd0RnAx?=
 =?utf-8?B?eW9LUVVWdWhla0x3T3UxUEhycFVaMDJ1ZklOY2pTZTdFYXpndGlOb0xLOTF6?=
 =?utf-8?B?V1pJdTh1U1lhUHB3RVlzcisxQTNzV0VVRjEzQkpDSzdFMHRpQXVneStzNXFR?=
 =?utf-8?Q?hK91iKUYcVfY7mwJ80SVTR0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1202db5-0656-44fb-e090-08d9df12d003
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 08:23:34.9621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dWODrAZ5EPMcAec04+uj77+iRcIUmYSt9yhF0XsQyyNmdim8PvSxGPFijVSGB5dlS8j9EhkEBmereSIwY6F9Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3587

... plus some tidying (or so I hope). Only the 1st patch was submitted
so far (i.e. as v1), all others are new.

1: time: further improve TSC / CPU freq calibration accuracy
2: APIC: calibrate against platform timer when possible
3: APIC: skip unnecessary parts of __setup_APIC_LVTT()
4: APIC: make connections between seemingly arbitrary numbers

Jan


