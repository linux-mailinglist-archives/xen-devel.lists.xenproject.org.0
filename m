Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C507590CBD
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 09:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385342.620953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPKB-0007sP-8n; Fri, 12 Aug 2022 07:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385342.620953; Fri, 12 Aug 2022 07:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMPKB-0007ph-63; Fri, 12 Aug 2022 07:43:19 +0000
Received: by outflank-mailman (input) for mailman id 385342;
 Fri, 12 Aug 2022 07:43:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oMPK9-0007pY-1f
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 07:43:17 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10080.outbound.protection.outlook.com [40.107.1.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cd31628-1a12-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 09:43:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8646.eurprd04.prod.outlook.com (2603:10a6:10:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Fri, 12 Aug
 2022 07:43:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 12 Aug 2022
 07:43:14 +0000
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
X-Inumbo-ID: 6cd31628-1a12-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uei+Nq4zHgxW0QNVVGqVr9WtmYuG1ofbliBW8WcPFSi0r0AIxVFhyXpDUniXfH2apaPKMpMEL6Ht2iK6nWcmivvB4mWcD7/cGoAoSNp5PsMqluS4KKDVfqRqTaQRdjIm6srIXt0KLBY6IWdaGIdV/S0Aoho+hfgoEgye4ewruFyW4pWuenDY98lZk5gTd/p5NDy20Y8S/21k1aWKv2G/itv8juiKXB4LPXNq9BcljObVxTpKxxppMKq2hB28hkx4YyWLcVhcH4ULK376MqN2c3f4jreM1hrmrxkw7j5Usj3roZDuieotZTzBUmAA7+yRDiciFWG8Vk3eK8hm2MScCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUAzah9w/l5Z6D5t55tUznNm6b5NNsbbbrHqYCcZYGg=;
 b=YChR1GU7pCOG3q1D5q7i/J+ARI7qT6U34TV5lHSetmGSS7wBHBItZE9ch7SaScMA0/8A91y0MLGAaF90lZZDEBt6XUd9PZTCNMLwPvTmDgGH+ID63UzBEhBx8AxdUewYZipCcU9p4OGx74OXuC9itDoVxO2q2Dnku8v6U1QaCLqz5Y/cKOo03Tg9jZ0CE7Ktupom1vKJAGEpKv0aZi8j4Bt+vUlqVfslsG11+L2HSsrN47jOL/PSebY0aOL5bcst2v+xiAbfQ9wvpmqCsX1363aIRCQk2zcqjsGZgTZd+0cxeT4ZvCS6ovSM0NKtzyNfakBGXm61yizGyApA++P3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUAzah9w/l5Z6D5t55tUznNm6b5NNsbbbrHqYCcZYGg=;
 b=Oj8WLLyMkC+9zBnNnVfOWUR0h2iKqd2hgWydgxEeRmytcvSr9VTmavk4ifc1tKhrqpUrasJH/+WYanNtNqIHe/Se/K0dEnUJzKO/A60Hn7Td3BcxYhCgrwU3WvW6AEphT8ZYQlRxJHtSv23C2Gx8LxUQC06hFimaAjGgem8D9lLyksK6JS1v9mmcPx6AmY7Vlg5AItBsJhpTgNEzVxvzPnEsMuDGuThCgQ0/rnUiDyd7HRRrKN8ToV4Ral+VV8Svig4WAdLIc5Pq9TMGp2MDPfDF3vmFRAXSTBIGil1FbYLzxkGG4iXrg4MFwzL6tWBDeoSnOcPG/h65n78m6ZEYhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1522137d-cfa9-22e5-64e8-b1795ddbce21@suse.com>
Date: Fri, 12 Aug 2022 09:43:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/4] x86/P2M: allow 2M superpage use for shadowed guests
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0010.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33d7641a-21ff-4bcb-b6dc-08da7c365019
X-MS-TrafficTypeDiagnostic: DU2PR04MB8646:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yuSMnfq+5pbmAKErTv06EGVBrfwn9oammXd4dpU4U1RPP8q7MOF9w23YB5XSK4oJE3858nZ2V5twSDszeZv11FDg5Jd9mw3+AeYfW33MYfNFvSEN/Gpe9NnbKZyZa4zQrf+68wdhglief5YbMV5rUE3jmYKwopHT9ELr7HsxsZPsDZDOea5GaQuWiubWtXiU7fAILwMPtWuiLQZHJoJgHMyE/43sw9mWqA8puZZ2CPT0yjCcQO+ZEBu3NmaQp2gSbm3s/SKCX9JKZomZ1wflUsfdZ9I/JgeS9yHPi5Q03N/YOxlIDNtTuqFxCOCcVjJnczp92pLsXIV64qGJhIa6KICO9rOGd8oAy5T5s7YLDveAJVhSl70b+qVwpathKuS2ZG2Sk8Ld3S0Ud9aOGU+kjS68OOZNbObJUq5mw4MeiEosyLv0YtJxjMJOVmZGu6Bs4yedrLld3f5MS2ltSQ2Ig1lPizB1K4iSd1PVFXKwn1Kq6Pl942dt51Qb+FeRuFLgqhFqaMXC+BD1DbePdoqzOhZ8fEOJ6uWEX/A/K5rR3/yzsQtGHrC5bPVmIqsfNkBASHgA8GSZFIc0e9jOmYXVY1XXe2MO1+9NtzddbdBlpfM+YR8N22UX+GlcHeWM5JOY7CQGNQh9lQmtncnjU3iw+a7IHDyXv/rirtBwGs29FwWAyDYoxkrmslB+5BY7RMbJXSYYVs7Yikirb60px9EgMvG3BrU9ok1S4Xgcod0VJuRLgAQyT4t3W7F1hd13g7YTe7pfftB/X9REGm0WBrvgY0DOqytTNoQpgb0HHphnH9Mdvg4F6Mav4+H4sTdGPUqtnTwVuQ2sc+eWmLiD9p/lkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(346002)(396003)(366004)(6506007)(8936002)(26005)(6512007)(54906003)(6916009)(2616005)(5660300002)(4744005)(41300700001)(6486002)(86362001)(31686004)(6666004)(36756003)(478600001)(186003)(31696002)(83380400001)(316002)(2906002)(38100700002)(4326008)(66476007)(66946007)(66556008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVJCRitUay8wbXhwS0txY2g3N3pRYkROaTJiTmw3US9udGd2VUtiY29mVEJI?=
 =?utf-8?B?Y1MxUmpYVnZTTEN5MnFiQ1Z6Sm5DVFgzSE84bjBzYmx6N0h2Yk4yYnQzcWM4?=
 =?utf-8?B?NHZzdTdHZnJCb05ld3RpbGl4YkNxREYyMEZ6QmV3TjRUei9hS2x3RlJQdVBD?=
 =?utf-8?B?MCtIcFZZV3BFckhJc1RISWJNZXlrbkpwQjdwY2t1a1I1VVFoYWpYLzZXRk5K?=
 =?utf-8?B?Qk5RSEg5R0p3dFVMbFdpRzYyam5kM0YwYUR5MkJaTmhqdXp2d1k0SlNROUdD?=
 =?utf-8?B?bmhRRFZRWERBT2RVUDl1MzdReFl6Qzd6Q3NZS1B4MHk1cFZhTXRlekpYU0NJ?=
 =?utf-8?B?SmRCa3RaT1BMTVNsOEh1eW0wTlJMOHR0Y3E2ejREVERyL1pUSlgyd1ZSOTRU?=
 =?utf-8?B?MWVQTzgxUlJLajlzRGRvQzZ4cDJMRk1NVUxlOHdHZlplVDFQUWF6Uk1MRkh6?=
 =?utf-8?B?TWc4bW1HZi92YUozdmpjclF6Ums0azJtc0VqWWxkSkt2dkMyK2RIS0R3Kys0?=
 =?utf-8?B?bmxTZ2N3SFFGdXFFY2tDSXA4d0RtTnNNRjZkT1pHL0JBQTdLMFV0aXArUWNs?=
 =?utf-8?B?VHhKZkgwVFVqZjZsSGljSTdJbWlsb3djcUl0a21BUXBHbXVzSFVoakVJQllJ?=
 =?utf-8?B?WWtrQ0JPQkVadkp0RnNBdFdQWkJjRlNCWDRxTnFtNXRRWEFpTmdNR0tVQ3dE?=
 =?utf-8?B?bWcwb3lJRElja0RzUEljYU5iUTZkZHFZdCsrUVVtbU9jcGJLNThOZmh1QU53?=
 =?utf-8?B?b3lLeFRheFNmUFhVWldhaGZqcE13Vi9QMXg5V081cVpBdm52VDM0N3pXWlpt?=
 =?utf-8?B?bVIybytOdndXNzlBeTBSZVBTOXI3ako1akxlOCsxOTZqc0R1d3hxQU02THpK?=
 =?utf-8?B?MjRCUkZYa3NkUDRVcTdUMFROeDBMN0JOY1I1eTgycUo2TDBBMnVaTUdlcTR3?=
 =?utf-8?B?WE5nNkczS3Z0TnN6Rmp4cGtyY2VHc0VSM3V2cHZTUll3Q1JDYTMrWDJzdWhr?=
 =?utf-8?B?VnNVeGo0YUNJVXFVL28zOW9nWVhhb3hGdlVRRGNXdjF4d21tU3hvbGgyVmcz?=
 =?utf-8?B?Z0NmcDVmTk1aUkxTZGQzWnlzQ0NBK21sNkMzN01pOWE5VkgxQURGMXBRQjJv?=
 =?utf-8?B?RUVMRXdSUlZlaFh4YzJLVEJLc3l3NCtLWnJXQnFnVGF4S2M2dFJCU0locTJQ?=
 =?utf-8?B?UDRyelkwSlpDSHpSV3hBV01ZL3N2Zy9GRllQQm8yaEw3QUlSSlhKbmZUUy9r?=
 =?utf-8?B?TUxBcTAxYmw2US9CN0Z5V1AxSWRXQlhlTVlSZHdKWGFtTExCZG1XQnhTUHlT?=
 =?utf-8?B?VERTSzk0SkYzU3F4UFFqTXI4WUZYWkNaeG9ZcnJmQmRFSTNMeGhKWGtPeHpO?=
 =?utf-8?B?dlY4RUg4SFRseERhZ0hFN0puS0hoVkdzMXdTaFk1OXdYZ0NsekRSYWNycExz?=
 =?utf-8?B?SmpoN1Zoc0tRV0RqT1d0S25veTZpSTRHM3U5R2tkTE03ek95M1d3NGxxR3NN?=
 =?utf-8?B?R1BMZ1Zna3h5VjdUNVoyUUlkcDR2UjQ1VkpJSHFOMVkrbzdZMFpPY1poWC85?=
 =?utf-8?B?SlJ2MVhHMktBZkFGQ2sxWGl6ZDB1a0RUZHcvZnJLMThsK1dKV3J3K2NMc3FQ?=
 =?utf-8?B?a0tRalg5bUNWOEJtN1BlZkJIN2hsRkZ4YTFtZ29ycEJnM0xXR05UZjdXQUVh?=
 =?utf-8?B?ZzR1TlRQT0VwTnYwTFJWWFI3VThvZDgvbkJnUWhueVdMSkZ6TmdPbFAzZ0I5?=
 =?utf-8?B?cjVmcENKWlVkM2Y4ajlQRlJOM0cvMGNSb0pHQ0dYWkRSdk9YNFRzTW9JRnRI?=
 =?utf-8?B?T3NoS2RnYno0eDNkSTJhZHpKRTRlQXkxWXc2NWNYeWQ4c2lna0pSRzJ4dklk?=
 =?utf-8?B?RmxVUzBjYVNwNGxnR2Q1ejhiS3AybVBpbm9pRklhUEhkWTZTNU5DSkc0eUha?=
 =?utf-8?B?RHhNd3VEOERrSTVOZEIvTjBEbFladVdmU3l4OG5EUVZDSExMMXhmK1N6SjJT?=
 =?utf-8?B?SHNEM2QzbGdHdkllWnROM0FvNjIraEtFU2ZEcmJDSVlXKy9mUEZ0eTVrQVJQ?=
 =?utf-8?B?UlV2RjNXTldFS1Q2N3BSOEVnNGJEeEtwbXR6cmlVSWk1RFl0djlCeUJ6REI3?=
 =?utf-8?Q?ohOZQlUI1vm43IvHYZm5gu7HI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d7641a-21ff-4bcb-b6dc-08da7c365019
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 07:43:14.2474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VInQEwHi3SO7EgOBnwjl0+QZntcP3gMBER2S5cTb6CNmktIv4RJlvL3ZEb6CvtNzaAHV3++9FwMEID9Giqn3Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8646

I did notice this anomaly in the context of IOMMU side work.

1: shadow: slightly consolidate sh_unshadow_for_p2m_change() (part I)
2: shadow: slightly consolidate sh_unshadow_for_p2m_change() (part II)
3: shadow: slightly consolidate sh_unshadow_for_p2m_change() (part III)
4: P2M: allow 2M superpage use for shadowed guests

Jan

