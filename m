Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C587D490D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 09:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621730.968490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvCF4-0000gH-Lf; Tue, 24 Oct 2023 07:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621730.968490; Tue, 24 Oct 2023 07:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvCF4-0000ea-IZ; Tue, 24 Oct 2023 07:54:22 +0000
Received: by outflank-mailman (input) for mailman id 621730;
 Tue, 24 Oct 2023 07:54:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvCF2-0000eU-RT
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 07:54:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 898c4052-7242-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 09:54:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 07:54:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 07:54:17 +0000
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
X-Inumbo-ID: 898c4052-7242-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TD900+7PdXMR9S0J7YXcah+e8GHHwsv8Iero+YL10olHUVQQ7UVL6uK9nYqq/n7ccJ1wB1PV9ZYVPqUUZ92UrXK3bb2EdGb/p6fU7DuoCTpZdjFfq8fMMw36ipodNyA9+wwFEl/nxeX1E8D1LojLyvwEFdbzKksOeK0z89KbECWPq5Xv4psroVkQCeOTAOFBysEp8sQpIUlb6rtciN10ROvKcnxJQBr++MtwzGn0ZlDwpcWUxEyIBd1gsCLqgeLEJ3aLMfabZxXyxdGeTah9Ij5+QYhxL0fSdFIpyN+Zf/kWQhCb6UVCLtV37J78RrR5d6lJdhNI471WWoLajBYy3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3mr1wKzBi484MR/l+vDyljgW1wMvMCsUxiIuPFQIGY=;
 b=H+DICoHAukpGfV5TeMU9kdadDdHFref829sew2jQMGG0JtNdsp3KP6Hn4T74Ha+dFShUKlkHiPw3pyuUKI/cOiqooDPqGRbZI5UpQwFLScox0aBJDpeOt1bu2whBF2OS7pYtvt4jx6t8+kAxdwenvf0+Iu8GpE1taeUOet7TzlDCqBNT4zPHk5wJDegHChznPvS9/XGJff7E3yP6Y3+cQzSGquFGqr3oiR55Wv2FOYpzcX1Xm+AX9rwqDqwJA/ctnIlQis8BloXVAHwprXdyO83zqFLVSqisbN7lzTzYHKAGFCgWUtCE23BV95N4Tzzwf6dQjtN0HDwoFL0hf9e5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3mr1wKzBi484MR/l+vDyljgW1wMvMCsUxiIuPFQIGY=;
 b=4+4K3/yLmZQpH/6nywKlnqW4VI14LCRrCQDnekambaVZ2BIXk0q6EynQ6aMc3z1iEQKUxy2iq7GSILj7kNMDjjuv8obry6l08b257JWHxORZ6uAdLsw7d3dnSeH6okz0PnaHZoeIV0Ls0HuvQfXNE4Ch3vx1esRC6WDcs2U+kGE8C11x/itJjyyXphvG42mDahoqElTEPBJTwGOF8DJpU+W7HzZlXF/surRm0qIeZkBl7ozDcTEs7EYow6YptGv8zIdb827SZPXxyuv2agRgai7CEwlAEuNZydmLZSxal341qujsa7Mk2K/zzLVKwEn6ftzY1I7KCXV5dJJvRzyWog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <433d28c0-29e9-9ee5-fea5-8917d1805f6c@suse.com>
Date: Tue, 24 Oct 2023 09:54:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 4/8] x86/grant: switch included header to
 make declarations visible
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <65f0b6ff751f76590b81c7ad2ba4dbb98e8b6e0c.1698053876.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <65f0b6ff751f76590b81c7ad2ba4dbb98e8b6e0c.1698053876.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 471dca84-dfaf-43d3-0b83-08dbd4666c4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ecxoEnUwe5N6yvhHROJumrwOUhqNFTwAsGyxNTMeG7B9KJXR2urUWDjKzjKwaBOoEktlN/UyHG7W98xKAdTFP4D7VHT+JYnewOwuJR6/O87ercN1HtM3aQZoAP2fQoawFuJgxCgGKMkBmkQRLubwsbVn+DoH7MDdkc0gR4QNFC6pllzUG2jp90yQEzl2YFLF4BUIDfFmIgyWJVm8L4bS15qpkyNnTZFmyN/FMXRy0QBKg6udg2E6MOyN1b+/m1iDJAgjwgra2pb1+24kkpqeEcurL8YjHSErmLNF9NI/8sCGOOZaitsnbpPiQHQwtnPBjpaI8Pre/WzaCbz4yyIxlvFq5bM1r5ksgCnyzs4TEVErLj9UdnWlH6NjfsQ7IdG7RNc30DorbRwKPWsjqslUHnGebHIxfg3cfAHV9Z4NU3cKkaxkgzbzPtn6WLNG3xyYRhznxSkHBHUuVvHqLbHZLepgiRT6wFMVMU5A06RtgtbvPBD4WU8uoE8J4TQLPZUUDnTsMN9jihEpK/ScC6aNPRXVGIfZSosJrjFgEhplyWRA2U+rp8+bWj0pvOhgu0cn+CvysY3gsR0RbM25pFpLEkZ4WjR24m66SOAEJgOZ6KhAoZTXZm1QjsN+7suQpapA0f/piCSe4kec4OeNMXNQmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(39860400002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(26005)(31686004)(38100700002)(2906002)(4744005)(41300700001)(86362001)(31696002)(5660300002)(36756003)(7416002)(8676002)(8936002)(4326008)(6506007)(2616005)(478600001)(6916009)(66556008)(66476007)(316002)(66946007)(6486002)(53546011)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE9IKzVFZ0hWYVpLKzJTaWhHd3RsR2lwdTNBcE44aGFwRnppYkVsSGxybjFI?=
 =?utf-8?B?VnRURTRaZklVaTBXM0ZCbDBaR1VUWUg1bFEyNGt3c1d2bk5yUDdja0RmaFFl?=
 =?utf-8?B?ekw0WFFaMGIyMGc0WUFieXVvcmN2SmlzREtHMWMwNVhkS2RYelRZdWw0UHU5?=
 =?utf-8?B?Z05hd1BlRjBSQ0dCaTBIdHdnTUlSakNwNlZIa1J5bjcxWGl0eUpLYk9VZ2xs?=
 =?utf-8?B?b3RVczlRYTZNakVVL2pKMTZYdmJ4M3VlU3RhMjhMWGJpemlWbUNoWEZaYlpK?=
 =?utf-8?B?a1d4VkFTU3FsV2F6TlhzOWE3c1RkRUgzTFdLcVFxcDZuNVR1ZXJBZER4elFN?=
 =?utf-8?B?WERONkplYWFHamNLMnUyYlhxZEMyc2kzWUdFdnMvV0tLK2FhZVNWbEhMU2Zv?=
 =?utf-8?B?VVlIaFVqVmpjb01tQUVyVUFWZmNWL3JlQTZlSEF1Q2NKUFYxQlJQTVA0UTVh?=
 =?utf-8?B?VjMrdldRUDAxc3FycUF5VzlGUnBMRmtHYm5Hdk8rNmQ0cHpTb1RLc0J3aUV0?=
 =?utf-8?B?bE0rckliSmlFTytJc3FTdTVvdUVjOEFHU1QvTFJWcExpT3dGZWhPeTJjRXU1?=
 =?utf-8?B?VTZSUUd1dkVJUTdldG9rRi81RFk1SVRleTkrdkswUm5pWGhQakF3OElRWDV1?=
 =?utf-8?B?YWZ3aG5NaVBHUVZReEhCMVRWd29ENjJmcld6ZkVPRW9VdmlkUHUzS0Fha2ZI?=
 =?utf-8?B?aTJkS0Z6Ynl6aHhvUU5LbHI1c3BmWG5rVVlTYzZ3R1YxVHk1U1F6TDYyUHZX?=
 =?utf-8?B?NlY5MlcrK3kvV3VtdHFVekN0eUFzTldXWktSYkZ0S0JxSGppWHJudHJzOFdN?=
 =?utf-8?B?WXBPSVlzcUJxWGF0T2Joc1MxcVJzcXdoMW1OSU9mMEVkaEpOVDkrRXRsUEJK?=
 =?utf-8?B?WWs4R3JseDlzL292b3BVcWZBY1phRHk3UmEwRmdVUTd2cUxVblJlcHJFdkkz?=
 =?utf-8?B?NXkvOHhReEIzZEp3WEZLTXNaZitsK2VveTNjdC9RTmpqZTZFUjNXeVJOMGV1?=
 =?utf-8?B?UEpaTGZvRS9aZ2tsK2RISUVicGpOc3J5ZXBwZVA2c296S0pYYVh0eStJY0dV?=
 =?utf-8?B?Q01WUWxadzdzc2ErL0ZCVTdMajk3MzBPbVJNb2ZHSXV1cy9yenZlNEtienRZ?=
 =?utf-8?B?TzVTRE1yQ1dPV2M0RGlYMXBJaWJVZURtMGhyUE5VQlNoWHFnTHczYWpBU25I?=
 =?utf-8?B?bWcvYWpDRDVXcDJVM21RY3R0NkJDUzJaa2xPSFB3V1VqaVdwZU9sb3lNZ0o4?=
 =?utf-8?B?WFlTWFVhMlVybzFTWGFwQWQ2NTJtNXJNQXh5NTZyWG9GUUx5NDhrRmJWbG5s?=
 =?utf-8?B?QWxuY0dENGtjck1icXVyV2xFK1lLdUU0Y2sxU2JTSVlnS2R6ZFljOUVnRXVm?=
 =?utf-8?B?dVREWVc5UlpCL0FhQXltOFpuaGtIVTRHTHE4SmxqWTd0d2JqNjVzUEpvNld6?=
 =?utf-8?B?T2FQWXVLZkdWeEgwVXExNGgzNzJwNEloTjBHY2wvVzFXQkhRcjJ5b2JqcnZy?=
 =?utf-8?B?bFc4czl6REc4N2J1ZkZaTDlSL2ljKzRhZHRuN1poZURzUGRzdU9WeDk0R2hZ?=
 =?utf-8?B?UXI1VHBkZVN6TkZvNFdWYlY2M3V3ZW1HWjNaYlNWeWNTTlBPQ0g2UzBiQWdF?=
 =?utf-8?B?ZEp4RTBzbHVtUHYzeTl4RmlYRDZsTDJ5YlkvMGJyS2dwTUExMEE2cHNNYi9U?=
 =?utf-8?B?RDRrTCs3OXVianp1UTYyd2VmeHFEWjJtK3lHM1MyWis4UlBxbEtxM0NuUnpX?=
 =?utf-8?B?U1lFZms5Y29mT0IwUWNMWXF6NmM3RHpMRnRLdEVTTzVlK255K3ozeHlVd1Z0?=
 =?utf-8?B?cTFZZDZUWlhwbkt4QTdraWpFc1Jodnk0NVpsM2tYc2ovS1MyZFdlazR3U3lB?=
 =?utf-8?B?dm4xcUtWbUFCbEZJOUR0aE1oVnQycXc3bVcydTMzTFdGbHhvYUIvS3licEtv?=
 =?utf-8?B?a2J4U0xFMzFBekNGemhScGJQQkRLaWpSSWhQRTVnemQ1dHZJNlg4Zm5qWVZ1?=
 =?utf-8?B?N3FFWEpseVN4cFlhc3FMNlcrS1BxT1hqOWkzZlp6QVl1WVk2STZqaWFQUFEv?=
 =?utf-8?B?a0l2MFFSb3VRUkprZ2hXbDJaeXJ1TWJKc0ZhYzkyUlFjYTI0Y1FpNTJVUjVI?=
 =?utf-8?Q?O3jYe8mD0eo0/qcaDJeHg+tjJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471dca84-dfaf-43d3-0b83-08dbd4666c4e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 07:54:17.3258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAixp4Ul2gWmk4B0bEn3WzGNyFcgGW9p42TfRquexXaQSAHObIQ63+hGaQrgcBP/T7N2wdKBx1nRSyWuNXKObA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051

On 23.10.2023 11:56, Nicola Vetrini wrote:
> The declarations for {create,replace}_grant_p2m_mapping are
> not visible when these functions are defined, therefore the right
> header needs to be included to allow them to be visible.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



