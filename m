Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5727D37AC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 15:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621455.967899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quuqV-0002Di-Dl; Mon, 23 Oct 2023 13:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621455.967899; Mon, 23 Oct 2023 13:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quuqV-0002Al-AM; Mon, 23 Oct 2023 13:19:51 +0000
Received: by outflank-mailman (input) for mailman id 621455;
 Mon, 23 Oct 2023 13:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quuqU-0001tP-25
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 13:19:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe02::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d714cdee-71a6-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 15:19:48 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9577.eurprd04.prod.outlook.com (2603:10a6:10:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 13:19:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 13:19:46 +0000
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
X-Inumbo-ID: d714cdee-71a6-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYW4t6vWKEdlnEk74RwiW0N73XjBDevNta1Xea8E8ZfIu3V4ehVyyLwrisez59gdfJ7sSJcb2E/ojavotijs4saMjzA25+O07zLVR2UYckUuCvgTTBUcqeMaHP7zZ2pDVGhYfoO/vUoUh5hHcur76cVWftupmWQ13bYkhLD6gCjvk8badIin3e7otSEM9wLMR5MH8IDsmJayw2O1k76/h7pAvsEL2WPl67MWXupP8zOAX3p6B682D2p6tjh5LqL+BHj0Pm0l3CMaoZo8Z/RtS80rTpkgHo0qm0nlwB5PvJN8dxZe5JqCpV5+IsPS9e4pkIjQs6LTVGCUnTSQ3U9ocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLHp8BFw08orCv+V15Gwb4kAblQL5A3jgOOtAhSJ21c=;
 b=AS0AzRMBzQAnYYGoy2O/yhGL+4eA9E1QmaSAyCtblooI45QXVcVEDBFLosYoqZgcmOX+DlR49FySlKDImrX9WgLoeWBVgFlnbgi3GUg6eElfNodpwkyLks8Lhrw8Dh1uEPJgkKWHWa1hFQpO94Tv8hDS09xlpCaVVyDT9uS/RR4cqYQ6ZlYkpk8ptQdpBFXoEP5KO88PpGOqoM6LocbdjqGYMGXqIQXkUrc7FzGfE3nRBoEuwr+rMbgQ0X+H87tvU7HP9wrUCMoou1LfNBcLR/I7zZlfvUR5e6d4gg6w7pn7QdBkQv7MKUesUEF0XoQYA4WjWGw+L31pe3afMSY0RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLHp8BFw08orCv+V15Gwb4kAblQL5A3jgOOtAhSJ21c=;
 b=KMs8cXixbDcYGqeNBZE3WQscVQauZ+hcFriE3Xz0BQi5D+PhGMOHaYy2cdWbIkPNz76Usics5T9kxOjBKBJ0art3jmP2VIb1sYFJd0hUySoDHNyPXzY26AedqkctpG5JkIr9MHScpwq14osHn6xhVjt+nj8VGY78a5vCmSNc9asdDlZWg9PyiiWTQWy6JO7f0EePXT7lRL4ttQAVoTvndOP1q+He+u/S0p5aVDWfGzZ1muaL7abwlrL49JUv5drjz20VtiiGzhTcedQGAacEXiKq47NJr9K/iYkwDsshwfh8f04h1sYYyyhCgL90LDr8kISE7uuiFH41tlOtoYASPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a475b70-0110-c249-8faf-1ffb1b3f1f2d@suse.com>
Date: Mon, 23 Oct 2023 15:19:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3 8/8] xen/compat: use BUILD_BUG_ON in
 CHECK_SIZE macros
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <cabd7c61f32b06a577026a92f3231b89c504babb.1697815135.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cabd7c61f32b06a577026a92f3231b89c504babb.1697815135.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: c774af65-b37e-431f-6524-08dbd3cab9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uhZ6bRJZZfy6F1UAadD96yOvc04F2hq8BMk1vksOczHupYIzgHz496Kam2fvvQuIpeidfTIcmNzZJ1ChmWDUkc+n4ROplXiffpKg3uOJBI3aOD4m13OVRil31QI7ZjXmGzLFX+4ccDn89fcXvMC7U5hgSo2WzVwNkm98qZ7IuYPOm/TvXlu1V007hFoHTHrkYtqe+09MF/XBLosS3NkAMjkVp5SpyDVxndbzZf70oJla2U9lBorHnkRFPpFYV4ey90h40/pEp+dU771+hrq2eQVNtXfrWC1yJK1Mc8E0Xa9C7Rrjfr2u88Da7iywywYUzI7FpcqO1M/1pr9m8KQHQDm4df08MuC9RXN7ApfptIS8dv9J7PXUhopqbyakhAcaMtk8/RaB1/WGWnaoUEU8hM+1TNjmyXf+DFozzNH6h3Li7u50WFXRBBD3TXzJOAfVuVkkAMRl6YfYPlMiLftM/MnN1k6oX+w9lfA3ckyK0V5p2HWOS4dmsmADwMcebnTQmapPIsSEkxC9M4S95SE179o2+H/l9wNEY2r2eCI0iKsFJ9C1OWQyz+g1gsp1TjFEsQTMvqKksCT0MIfdFdaZbYjw+Q23xPDcMzUwHn0iG9B0wFHF8ZTUN5nqpSZF3EfmmK1fjeVRiN8rfEaCd4UWqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(346002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(2906002)(8936002)(5660300002)(41300700001)(4326008)(31686004)(8676002)(66946007)(2616005)(6512007)(53546011)(54906003)(316002)(66476007)(66556008)(6916009)(7416002)(6506007)(478600001)(26005)(6486002)(4744005)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlhkbTMxM0Vpd3JybWJvSUJpbUsyVDBuYzdCVWZPK1dFS0xNRWlqYVd1WGN0?=
 =?utf-8?B?eC83dXh5S0g0eHhrazU4aG5pZTJyUHhMSkNKbk5Lais2Q2ZCSGFIekxubHhX?=
 =?utf-8?B?Z1dIQ0NVcTh2YXJ3dGt3Mld6aXN4SlFIeDRvTHhqQThIbTM5dFM4Nmg5dnNR?=
 =?utf-8?B?ZkNMVFNaYXJ5cVozdjZVKzlaQkJVR0N3VDVvcGdnUGdISE9kNjh4WEdObWtv?=
 =?utf-8?B?bWVZVXVGUmpRS3RYb0JKK3VvNzVETzI5RmlOY21oRi9lOTF5N2tRYnhTTXYy?=
 =?utf-8?B?bklzMDJDV1drZCtzdWt1WXpMVXVsaU00ZnNKcGltcnJtb3Z0dlNGbkZJNWtQ?=
 =?utf-8?B?dHhuWXZUZWdmV1FGK3gxcktOemNlR29qdkhPSk8yYVorWUMzTzMxbjlPOW00?=
 =?utf-8?B?dGVZRklHRWgyRU5YSytLTDdMd2M1ZVh4V0U4NEhjWGlzUWxBUGtTRTR5TG9C?=
 =?utf-8?B?RW1jUC9ib2NCVUMyamc2eDdrMHc2VndPNXpnSGYxZFhqYVc4eEFsUnNjTmlz?=
 =?utf-8?B?Mld4L0d6dlp1Q1RCTldjRkZOQUNMKzFtS21qZXZlNStldDZtaWRXZTVXR05I?=
 =?utf-8?B?cE9vSEF5NlhWZHFIdFQ1NjUwN2txNFRRNkNnMlNqRlYxVDZ0NDlsanhtczlw?=
 =?utf-8?B?Y3NJc3hOQ1dkanMyUm85K0l1RTE4R1RiNUw1aEg0elJvQ1hPRGdvUzh4VUxF?=
 =?utf-8?B?b0paVFVHeENtR3N4YlZKczJHcFBjSTQvSFIyMUJGVExPWkc5aHRTQnVsd0o5?=
 =?utf-8?B?dzZHVmc4WlR4NWZtNkg5V3FadkVzMXJqMS9NblFCT3ZEQWpDOVVTd3lhampt?=
 =?utf-8?B?NXR1Y2JxRTY2cHk2ZmNETzYrNGIyci9uMmtzaHg1STRjTVczVjVFMDliWnRT?=
 =?utf-8?B?RGRIaHZ2ZGJNdTJzNXVhb1hNYjRmWlN5Ri9IbWVXcW1jeTNnWTdrSG5HU3RQ?=
 =?utf-8?B?dndlNFJiek9Ea1B4eSs4UUJTRUVLU1NLSm1NeWcwY29jNVNzaEsraEZjOWVz?=
 =?utf-8?B?bDdRT2xHc21Lc3l0cWhtNG0wbWg3cCtNc2NkeUpsdmJ5RHU1NjhvdXFRam1J?=
 =?utf-8?B?eldHMW5YN1h5ZUk3U2cyQXYzV0VtRTMyRXY3c1JYUUtsMmlUb2xiZ2pvZzI3?=
 =?utf-8?B?OURXSGNLWlhuMXkvMXBGc2R2NkhDMklvdlFLVlVLbWpPOE9jUWlHSmJIMm1m?=
 =?utf-8?B?VFRHa3E0MitOejI1WHJSeUMxbHVMbDNXbDA2OG9mZE4xU2VoeGhxSm9nYnlw?=
 =?utf-8?B?TmZHMmJCRXV6ODhhQ3F6ZHk1YllacitPOUgzcHlSMjFGakFyanZIUndhK0JX?=
 =?utf-8?B?d0tjeXNhK3RpSENoS242RFB6SG13Njd2ZGhEZ0FMb3BGN2tvYXFCNDIvcU5D?=
 =?utf-8?B?M21GVWpTM2lueUJNMU52QzBtcFE3Nkpib1lyc1JrQ2JnbStJOUhndkdQdGNN?=
 =?utf-8?B?RXozbVRzN3JaUDYwSGF4bHhVTWJLYmVoV3dMYk1ORGJWNlc0WEVDUUwzRkIr?=
 =?utf-8?B?Syt6Mk1ycmtzYnR2TDFQRlJNNE41ZkVVYUZ3Wm1sTU5RTmZrU1gybjFucVJj?=
 =?utf-8?B?alpCQnVQMkNLQjBmOVdVWkZCd1JhZHdSZy93RFY0WS83dGxrM1F0bjBJQW9y?=
 =?utf-8?B?VFF5YlNld1hpdWxzTjdEYzBuSGFkZytnVkFleUVlU1NqVjZVVWloOGF5dEZT?=
 =?utf-8?B?SDlzUHpCMnBUU1d3bE5RVk1zeXZKUHE4M0c1NzVhWEQrU21pTU8veVJLQ2Qx?=
 =?utf-8?B?NHhVc2l4UnhmMVU0eWVxV2FQbkNGUnlSSnlyWmVMS05MVXpVVkQ0ekNmcmJi?=
 =?utf-8?B?T2hkZjdROERsRFZsdU11Y1Z2aU1oVzd2S0sxYTdYc3hiNGF2dmpCSGN6OFV4?=
 =?utf-8?B?LysyVnRHL28rNjZVNjhibW9FVmlkcXJ1OWRiV1hnL3VQRmtVZllMdmM3VXhS?=
 =?utf-8?B?WmtGQXBHUTJjRUdNeUVERnlsWWUzTXRmTVRSQWVyZ0c1TnZYc1ovL0xmQ0xR?=
 =?utf-8?B?cEFEaTk4U2ZRS3FOcFRqd2RENkw4OVE3RHJZVDg4Z0d5d1JLdDNmWFU0VzFW?=
 =?utf-8?B?Z0Zqem9KWmJTb2t1RTI1UDByUVVSNkFTclBMQ01PUUZNZ3d2bE1ydC9Jdzly?=
 =?utf-8?Q?mW3nEu2eGjNSoUWT7nhOXe4jV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c774af65-b37e-431f-6524-08dbd3cab9fb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 13:19:46.1498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBKUsuEcxlZ+g4eJbfD2vmS0fsRVDrJDRo37o7RDjm5R5rVDzSa+9kOqkNAEh/jT/gimSsVPfD+WcMvn0QF0oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9577

On 20.10.2023 17:28, Nicola Vetrini wrote:
> BUILD_BUG_ON is the preferred way to induce a build error
> upon statically determined incorrect conditions.
> 
> This also fixes a MISRA C:2012 Rule 10.1 violation in the
> previous formulation.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



