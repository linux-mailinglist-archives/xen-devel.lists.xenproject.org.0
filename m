Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15DE7499A5
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 12:46:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559836.875197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMUd-0000Oo-Lz; Thu, 06 Jul 2023 10:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559836.875197; Thu, 06 Jul 2023 10:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMUd-0000Mt-JG; Thu, 06 Jul 2023 10:45:47 +0000
Received: by outflank-mailman (input) for mailman id 559836;
 Thu, 06 Jul 2023 10:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHMUc-0000Mm-OD
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 10:45:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e3a4cf-1bea-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 12:45:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7218.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 10:45:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 10:45:43 +0000
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
X-Inumbo-ID: 42e3a4cf-1bea-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUQ6jlEK+XqSfQNpIInl4N4uwLR6eaqP2ywb6LhtW2VGVlcaNSFqIatIEWH6ywau7R0fOF5ws1Oh5dsH6hq4Zr11rJ4qYtZnOeha5Bv4b3vG+XzFytK8J86d4dGBowRLUPRfreFCK0u8YrpSZLk8eAQ2YZ6/GBoesvC32y71MwnadLLoeUX3xw0f8VNdCEe5w7RmvayWipQpIEKdxTDvIsCTFb+EyjhfB9tyxYJ2EbFQkAiC5TobTCdn7ELXNmTxfKtcUFzzWCGPfzQFmEEhwiR8/BG1pU9hqU49GzLmaE/aZrNckmd2UDTiYDhcZxefkhwQzhfvip9cb3V3uiLYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bp026+l+SXvaxUzxwK97199lQP8K0Mm67wbPdTQF5rg=;
 b=IbBEuePPWEFQ3SvBQrHapW5Ug3ub21ugFQe+mBeFc2oc69VRSoEdgWJ9iH0epOdMiN3TSX17c0i/PuSdx18kdl7XasgkYe86IAf5sUIxxGWxRYuaF7aq6KzEOh3jUUvxf1kcEZkN8cVCK0VFEvJa6S4fvd/8zvVFpdrbaY3lFC0KhoIHGwjnXJkVinnhCOtVvQYytCjXcCyoni2fVmRiRP2U+g7wyLUgzS4tTCnr2IXJG2TjVfzAEgCI77EPQPv505LJNsRhJzm5eBVPxlw4T+MQaQ2aovrh3MwHmFIqyYv6TjpFtpxu3JUSXBejVU5Xq6WJx+hj9F34Fdyqnb4vjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bp026+l+SXvaxUzxwK97199lQP8K0Mm67wbPdTQF5rg=;
 b=URLGkKBdJKNRkIcfy8HCZqWpXazaWEY7XMNi0ESA0OtrW4WW2ZG+UeS+ypZGw/veNOahDYP171nRvsqvv/PQhgO87JT3xPmWHB8gPqLyQjPK0t4sHlEulIHdFLNpVymD0s029FVfzaCxl5RPTjSQju85+48/Lej9sGZdCx46MdV67LoGo+jVReMjudPt7fJjiAGrqQSy/UMuMgd+GLZTJ9U6Y4Ca1JTIri9ceVZlWdWRMKeomt/zSBW7iQBcNBnyfDL9Xq9rl7oORKSQNzRq6O4x55NuunhFVALUxcSa8VvPjzhDDq/wv/LJr7se2bmgw9nOywiomm1ihkWVuAVF6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <111078b3-399a-40d8-b8ed-db80dbea3bc7@suse.com>
Date: Thu, 6 Jul 2023 12:45:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/3] cmdline: parse multiple instances of the vga
 option
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230705114741.11449-1-roger.pau@citrix.com>
 <20230705114741.11449-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230705114741.11449-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: b05661b9-bc09-40b3-dbc8-08db7e0e25fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g/EZ+3pQC8YhBkSfwl7uuq8VlHOvhh8JDIsUks9exX7aw+7raYpxTrWmKCWm4Ig+B1HNy14mxmVCFJ22Cf1kWZxM464IPh7cziKgrdU24f3ddQ0L3n2xgzKjGLa+r/DSPI5n7YFKwhGyI3HiXwjOvu480RGcH8kAFZdoboWcoEV4FrPD8KTZ1oQot/kZ1xmGv/BgxdHIAglX5g15AE583mUK8jMszMAK+SkIjtjSBdpsDdDhhnxHI+yzFrec0+tF6sfiQrrUpguftSM/bPbA1oyfruNicYUneiKA2YJjVUYg1GI8x0U6YI2mn6fr8RSibddK5dukujS73FEvYJ+MqISOBsMwdk0FkwbB5wf1N+ZiPb42DH06xkgdkYDYgNlhihegN7o3LXCSyGc0OCw2Gxr9LnMyHpp8mVOyvqFM/RTP/mIRDEebw4FoBX6+o8u7QHbx1su72tJ1mdaX/ZhYawbVFinpRfwrN9jOy9nz0zzwNnQPFT2DUAInUxR5nx8LyfxbZr3EPAgPGgFD6eMj++UK0l26LZyVrrhq9o457GJSNclojnGA0I0HExBVI1fEyDgp+uLhMgRabDZ1UZh+UqNgB51iwPEbXhi0jrlUu2Ex3D1R8Co9wTN5nDHr5cEFdw5cyWGd8dhs/5cPO09PJA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(31686004)(2906002)(5660300002)(53546011)(2616005)(86362001)(31696002)(66556008)(66946007)(8676002)(8936002)(6506007)(6486002)(54906003)(26005)(478600001)(186003)(6512007)(4744005)(38100700002)(83380400001)(66476007)(4326008)(316002)(36756003)(6916009)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUwxVGllRmsrVC96QktjUDlYZ0hSMVB0QXZCZXRXL25YUTIwVXlaV3U4ZGYr?=
 =?utf-8?B?Y05JN2Z4MzNtZldsbDJDQ1pDUVZ2WStpbTZEbHJpT1BGTWFLSDdqcGpZZi9E?=
 =?utf-8?B?OVY5UnBqYzNSc1BxYVV3N0FQNEsrY3NvRmwvS3RiYjU0N2kvUGYrVmh5OGJw?=
 =?utf-8?B?UUl2OXVEejV0NVpmZnNpS3hqd1NNLzUyOWp2UEJaRXFYMTZtTmVwclZ1aHho?=
 =?utf-8?B?OHZOdld2ZjR5cnY5aDNSc1BsaTkyR0Q4NWY3R0VkTDNRSG1hSmlvQk55Qlli?=
 =?utf-8?B?SThoR2VSMiszN0E3Z21MTkU2MlJ3eDZzM0hpWXYwdVljcE9Oa0NQb25CcUtT?=
 =?utf-8?B?ZFZ5alhBaSttRWFFSW5OY0dCN3NLdmpGQndicElteWQ5RXo2RTljekMxWlIr?=
 =?utf-8?B?VHpiNVUvaDFHSlByUVIvekNrVVpJdWgrYlJ1bXg5TmFiYjNxMEoxQUJTY3Q4?=
 =?utf-8?B?cG0yU0hsYWV1RVRiWHdab0F3SFZucTRNNHozdG1Hb1pQS2xrdS85bXdmU2li?=
 =?utf-8?B?cCt5Y09GM0tDMTE1VzRzK0FjVXlkTFBNUy9sNENNTkp2aWovWTRYUjNoWmVw?=
 =?utf-8?B?YnJCZDB0V1R4cHI3Q2tBQUYya09maWhkK2tVWkZ4R1diN01IZTBBV0puekVm?=
 =?utf-8?B?akhORzgxd0x5aFNzTnVCZk15dk1Vem1Zd2pOZU9IbDZqVWREMWtSTStYTmFK?=
 =?utf-8?B?YmFTa29Odk9OaFBZM3h0TllzdVFRd1ZIcUVvOFN6UFZxa2tNald4a2JkQ1p3?=
 =?utf-8?B?QkZsWFQ2OWFIS2x4a2x1MUlTb1F2Rmkra3JJTm1PSmlSTnJGUDBtcHNobnZK?=
 =?utf-8?B?ZmpJaG94dlVIMVNGM1I3QStRQVROVzRpelA0T1lKMTAvRVdhMXRjYm1FK3Uw?=
 =?utf-8?B?UWoxWFNyaTF6Rzdtc1hDelBCaFNZbFA4azVQenp2enlXMVNQZG5TeTNaSkZX?=
 =?utf-8?B?TFFWZDRjQjU0RDFWVmhZcHhacFhHcTl6WjA3cTVaWHRsZ2JNQmxMM3ZPNVha?=
 =?utf-8?B?REw5UEN4VjdhdFErTWlybzdydWR6L2V5RXZVdTk3b1prRVd0a2NBcHVDWnNQ?=
 =?utf-8?B?LzIwdWhJYm54OWVHU0FZbXlhclB5K2d0cC9tTjFSbTdoelRtVVlHSkVnMDdo?=
 =?utf-8?B?bXRCV200dUJEdlNnZU91aDhpQVI0REhSUlJXRElxZHhmZzJQVFFzL0Ywb0Ir?=
 =?utf-8?B?T3ZjdUhMM1hIVFlyeVpJcm0xRzhheEZxbXlnaldtdUsveTZKaXpkQ1BOaTBZ?=
 =?utf-8?B?SXN6RWMvS0UrcnY2RFlzMDI3MU13OGdHa0xxaE1rdXFGaDRRSEt4WUVwcktN?=
 =?utf-8?B?VTY3YWdFZ2Z2dWgxWVh0TENuYktuVkJUclpqNnVYSW12b3pCb2xNZmZUeUNy?=
 =?utf-8?B?NVJEVWlZVzl5WEhwQVZvSWtnbUNqbHdKRnNTMVJ2bGtpQlNOa0VVazA0SUsx?=
 =?utf-8?B?MENZK1hhdDFCbTk0VE1PQWkva3RhaG1yRUdob2Q2THdQQjZzS05lT0hKelRa?=
 =?utf-8?B?K1RpNUtoRmZjOGQwRmlJMzlZbEtSTHlMQjFoekJrbHNueHdYcEVraHhMV3hS?=
 =?utf-8?B?ZjhETlozWEN4dTlCWk9NcUNCMWppeHBMLzkyTkVpenRlWVd2UkRRYW9xMHcx?=
 =?utf-8?B?ekpRcG1WYXVUaDhhaU8yalU2dStxcHNNTDJSOHlkZDJ2SlFXS3Ixekt1Yk9Y?=
 =?utf-8?B?RHV5aFZZa0FOVmdBVU93VnA0REh4eFd5Z0orZldlM0t3dTJNcHhUdHZhMC8z?=
 =?utf-8?B?S296cjJOWnlEZDRIdDRWazhYQWZOSVhFZVB3NWdBV0F0S2pxTi9JOGtTVVFZ?=
 =?utf-8?B?clpjand2WUY0cGNBQ2ZlaGVjTmFqQ0doWWZiRFozUHFWNVFiNTFCT1JCTlVL?=
 =?utf-8?B?Nm5xemNHT0p5ak4zcnZaZWt0SStSaUJMZFpJck9HSVRKc09ZUmgxK2FOYjY4?=
 =?utf-8?B?aWQ0ZERnMUcyN2hkZ2E1dXlVa2xHS0ZFdG1vaDBqUXgwM1Yrandpb3R3OVly?=
 =?utf-8?B?dGRaTXVEajFkMCs5SzlucTFKUktMVkVvRk1HRkMyOEZlK3dzL0hTOC92N0Nz?=
 =?utf-8?B?L05BRjFQWVpvRDRsV1pOVkR5Q3B2MUIwYW11YS9PdFR4SXlicGRzSDJQQ0Ux?=
 =?utf-8?Q?5Ze1XZMII5qDq2TI/TkkoKFJQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05661b9-bc09-40b3-dbc8-08db7e0e25fa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 10:45:43.6083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5QeHXl5wy42bwoeGiIa3pUglgHXE0bfAltpOtcyXihntqdQrzi4tIiRj3gauU519XDuVnGjKyA+qLhhNVWoqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7218

On 05.07.2023 13:47, Roger Pau Monne wrote:
> Parse all instances of the vga= option on the command line, in order
> to always enforce the last selection on the command line.
> 
> Note that it's not safe to parse just the last occurrence of the vga=
> option, as then a command line with `vga=current vga=keep` would
> result in current being ignored.
> 
> Adjust the command line documentation to describe the new behavior.

This was likely meant to be dropped along with ...

> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v3:
>  - Remove xen-command-line doc addition.

... this? Beyond that (easy to adjust while committing)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

