Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D34277B8DA
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 14:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583610.913863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVWtS-0002UL-Tm; Mon, 14 Aug 2023 12:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583610.913863; Mon, 14 Aug 2023 12:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVWtS-0002RY-Qi; Mon, 14 Aug 2023 12:41:58 +0000
Received: by outflank-mailman (input) for mailman id 583610;
 Mon, 14 Aug 2023 12:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVWtR-0002RO-AC
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 12:41:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f32e2344-3a9f-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 14:41:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9309.eurprd04.prod.outlook.com (2603:10a6:20b:4df::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 12:41:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 12:41:25 +0000
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
X-Inumbo-ID: f32e2344-3a9f-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZZJspEQFigoBgQNidwX5Ls+XAwhmVne99H4v0r7KmPw37fyWxORCNT/5ySUWRMM+4U0p4P19f93oS4c3f9Fy5+0jQb5CBlkVQ6VJRCYnYi6lfytwiJoEQvUdcnl0Iutr2VZogdbB3rBka4z89+DWboP3aXpMMRi86qH8U/gx4UuLLBbP2htlBJAKSVBNNMiDf5uXR/GzcL92W4utIxNJWG+IwAsKyS1ZAFdoHFyHLRx69Xdd0Ol+J33nDepY4k/PO4aQb5HqDzHlZTekPW4ZV7WLHHSzXYsY8YlZbrHRqyBPrPUSea6MsGzHYEE9q15DqkYmOH9eDXPlgRKPUgsvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSmIZuwRTHlQCdkyyuXqjuxfjFrKEd5LDowPqnYjKPk=;
 b=GiJnAY5RqD6SvIizxbmZxr0ZM6I6CMxLJ/nqaUbFzxKUSLmbZ5tH1Yqyi3xLuO3hkAoRJt/iqGeff25fmoFbJQN+eoIs6G4rDgU2GRAPCXou2WEgvpREoxkwsjHtmmAdvI9wn1yjQOMKL88yOXOWNEwiHiqMXBXD37Jo650xVYTOH0nfthQNVy/wcAQ59yLHR76bKrogyT0c3BeHBwxOiOPT0U6yCVQq05IGew8MR0c74Njg56NpA7ECnTuHE5/6N0z/820I+Tf5VQLWBT6DBYYMsVACeKFMABbuz+RAmS+5wVGTW5qprKa1GOys83Tl+gxe/X+2T8ERatjPW0iB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSmIZuwRTHlQCdkyyuXqjuxfjFrKEd5LDowPqnYjKPk=;
 b=0+hgk0cK8kGhnWx+rPBlfxoMOGwbCBPlE4YpYtidIq0mpnSfvBk6jCxii2nR//7PB/koUMsw4TuzKGAaZXU9VYCNJi6btit+ZxZH9CjjdUjfyWiYskuxAlyi4HFM1mcDYNk/HuMs83hSPApIj7ozazn2sAthwK5do8UU+O69u9jmIfRfFAq8H6iFW9STjjfNq8p5tK09sr53q/3JVAbK70kNtiYmHZv3asGFXbsm9S2Zpvj/eiFrLbW7HDLYvz1vCN6/nzt1bULsCNSghcGC/ptJIydZ3XDhny4cwKYch65HurBniCOXF+bfpu7kP9VGI/pgus7PoWaGqY2kV5OubQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d57a2812-154b-bb60-efd5-313eb2048d11@suse.com>
Date: Mon, 14 Aug 2023 14:41:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2] x86: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <c0bb67b18e1ad158a8af059abd1436c36eb8edf6.1692003656.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c0bb67b18e1ad158a8af059abd1436c36eb8edf6.1692003656.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9309:EE_
X-MS-Office365-Filtering-Correlation-Id: 7489f321-c146-45d2-3a95-08db9cc3c5e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z8bl/B+ysczpHHGUhWuYFgWVHlXqhIILVk9vG0CvnJVFC5+LqNkEfRevGjJL9g7eQYxSOAMkZ0inyxfxr/qAG8GfCkksBfrXvght16Ok63mD7VazQvaLp7kXG1BexzabRNqA1WS8z+APm0RoOvmENWwFXh6Zz9ntEnNXnlBoKfizGIfTLK5Uw55igAsPLhVGst7fQb4hudK9SWbHWLaE0CrE5tebdBsq4nSzVfkjoPyFa+xoOv25JYHLfp7gY+6Q3eBlHG/2h0gRg6kX0oBUVVijmRThSQojS2FCR55RW32+jcY9jRN0OU5GTzUmG+shs+bCTXAhe8MvQ8P3yx/73mV+jXM5+VsRjMU2othKlEBb/GbK3Gn6OcVxIjQiPosf7u9VMhzCxE23ji0UmDbsRwS44E4dRLFxSC833ZYsRRjoHkBGQ72XGyUarvEJv5aNvAWwrZaqtitOJdcwbqkR/rALP2L98a7qnqGxtTvo1v87PQNwDQChdHR8JDNNGeRWxuGKV8k/754ZtCLJod4I8BsrVF9rGA3NLzSQmCrznUC7tKxwj5vhzHn2RpXIVJ7usVQsiSJd3SkSFVZzjytsaYAZqmxxTbfXdnrjR1vAbUe8ztnyMJSkYu+dfPfGfjQUULgVhritcZ6ggidRgbkxzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(1800799006)(186006)(38100700002)(54906003)(6486002)(478600001)(7416002)(5660300002)(2906002)(36756003)(4744005)(86362001)(31696002)(6916009)(4326008)(66476007)(66556008)(66946007)(41300700001)(8936002)(8676002)(316002)(6506007)(53546011)(26005)(2616005)(31686004)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHV4UThPNXd0YmVUVVZzTVJXelk0dThkVWlvTUE2RGVUc3Y2M0I0ai9yVFR2?=
 =?utf-8?B?S3N1U2VlOXNaTlhBbnE3aFRIUWovS3pjZGd4OHQyRnRpOUJtVksrUkpDRTI2?=
 =?utf-8?B?bm1WSm9tTDhRSEdrbzhoWUVmVHNPUmIzZ1hJamRXMG9TSzVuak1ZTExoblhq?=
 =?utf-8?B?TVMyWHhoeFV5WHErbHh1V1NRclI0S2RoWjU4RnNFQUZFUFhmbWl3cC9KUWw3?=
 =?utf-8?B?K1dVTXlxZlRsVzBNWlJFV2ZKWUZxbENqaGF6SlZHcENkWVNNWTRKUUgyT0V2?=
 =?utf-8?B?NmJlYWd6OGhLVmdyZGlkVkNjL3Z2VDI5bUI1ZzdjcG9pV2tzRVlKWTdSeVg3?=
 =?utf-8?B?SDVjNGF2c29MNUJWWE5vNnQ3TU41dm1HU0daSXpiZjVBMGVpVGo0NXE5dXVR?=
 =?utf-8?B?bXNIT3ZVOWtvckxyeUJDd2NnSlpHekVSQlphdzh1QUEydzYxMzJaME9Ka1h3?=
 =?utf-8?B?UXovaWhpTFBXSmx4OU5vaTVka1B3ZWVxd3kxRXFJWUFaUXBNYTNERFRTTG10?=
 =?utf-8?B?UXlmZUVGSUd6K25QcWZBRGZuWERyRnFrLzVLZjFWZERXNzEvdkRtcGN4UEtn?=
 =?utf-8?B?cHFPdHh0OE95Y3dNb3FMWXIyVHlkbE92dkVkaG50Z3EyeXZEK2xKaDlXbTh4?=
 =?utf-8?B?T3dUd1hyVFQvUFh4QVcvZG9EUUtxdDA2VkIxQXZ2bm9nNUtJWGxjWStBekRh?=
 =?utf-8?B?Zjg0MTg3OC9QMjlKVk5yaVdQSnN3UFpsRy9LcFdqN1Q3M2FMOCtSL3RFVGlF?=
 =?utf-8?B?U0s4MFhscmk0bGQ5NC8xc1BsUXQ1di9QaE9Gcmg5Mmo4ejRlVUtXYnlMRXBJ?=
 =?utf-8?B?ck9oUkNjUE95K3NacFJKOUlOM0w5bmxzT2hHWXlaenk5a1hwWG8xUDI2OTU1?=
 =?utf-8?B?SnUxSUJRSHlzbmtOVlVyTjEyM1NtNy9ScWJOL2FrQ3hLb1NET0lSUCt5WEN1?=
 =?utf-8?B?UWh2NGU2bkNVS0JzbTdsNGxKdHFPaGFpRS9CWlY1VnZ3SXlQSjh6TlVPelRN?=
 =?utf-8?B?SjhRQlE1bmxDaWF3SWpqNzF2bFVwaFNINU5OQVhsWGZEeTk3dE1aVWVKSXRW?=
 =?utf-8?B?MGNKZWJIeEVBbmoxckd4dHpYYjBXek04VUluem02WDhrTDNFZXhxeWYwRFpj?=
 =?utf-8?B?SHZwU09nbGlZVEljUWEzSEdUV3YyaFl3MkFuNy9kOWxYQ1BPbUxsdEMydkVt?=
 =?utf-8?B?elpDV3hKY0VUai9JMjNJS3FkMXRnbmR1T1VjaGtvUzZpUnhROXdLS3RTanlS?=
 =?utf-8?B?STdXVXZ6cTc2TndSLzRiYzN0OE9aK2h1cWRBM01GZ2ZOaFY2Zi9OSWJNZkJy?=
 =?utf-8?B?UGp4ZHBGQm9yOFlZSS9wbWNkenMxcU56RXZ5c3VjMjBqNEdWQXVqZ0JYb1Qz?=
 =?utf-8?B?RDkvekZvem5PaUZBMFFocFQ2eTAwc2o0ei9SSTFFMzdBK2pLcEZhYk9seWFD?=
 =?utf-8?B?QTdrUGRiT0w0cVdSL0dPVmlvYWF4L2Zxa2RkOHVRVWsvS05Vekk0NktwZ2tC?=
 =?utf-8?B?TW9PbTMzNFZLU2d3cmVmcEdNb1k0Zm1CbVlMVU55aVdXR0Q3dXUrTkF4MTFQ?=
 =?utf-8?B?ZmRpa1U2Ums5U2JtbFVzTmJsSG9wTjljUEVQbksvaVlCUmhMT0NERHBEd2JT?=
 =?utf-8?B?L1E0R01rNExjN1IreCs1akhCQ1R5b2VDc0FvZHdJRWNkVjYvVU5RWGNNdE83?=
 =?utf-8?B?bVRpaHI1Z0djU01McmE2ejhYa1Radi81dEQ2cXBkeW5jUVJMS2hBTVlzYUJq?=
 =?utf-8?B?aTk0VGhNQUNPWE5sZnF1cUV2NDM3WG1aaGtQWWZaOUZGNVlEZzVXR0JwL25i?=
 =?utf-8?B?R0xuMm9WNE9sT0FWeE9jeGp0S24yYWd0SWhiNWM3RC9sTXlQRHh5N21ja2VE?=
 =?utf-8?B?eFZrRmFCNUFyU3N5S2RSOUFzWXJzK0NEU3lrZDl4RlJJWGhteUpETkRJU05D?=
 =?utf-8?B?RWVXdzFZeVRhc1R4ekhwYUNSNW44UjQxTHF2SGw2di9vWWxrRFNteVZ4NFQw?=
 =?utf-8?B?SXVBeERHZjNJUEY5aUI4OE1CZG5FV1dKYzg4ZDROYlplNVowanBmOGhiT29D?=
 =?utf-8?B?Rm0vMEM2L2xYT2FOV0piQ2laNDVQck1mcXBCZ0RxSmJLRHVPT2tiTHl1Y0lq?=
 =?utf-8?Q?XpYkbplGulKeelvXAQl7RG3lK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7489f321-c146-45d2-3a95-08db9cc3c5e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 12:41:25.7674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUn2hZpqg5MKeWpt1njPKQ2MVZbFpA3Li53QrTXnhlyK6AghVmz1NYDz+5VK1ZEETDDJ17G+ZERGL6pXWWzxEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9309

On 14.08.2023 11:05, Nicola Vetrini wrote:
> Address some occurrences of shadowing between the global
> variable 'e820' in 'xen/arch/x86/e820.c' and the function
> parameter name of 'e820_add_range'.
> 
> Since the function is only ever called with the global variable
> as the actual parameter, so there is no need to have it as a parameter
> because both are defined in the same file (mentioned above).
> This in turn causes several other functions to lose their parameter
> 'e820' because they are involved in the call chain that leads to
> 'e820_add_range'.
> 
> Similarly, 'kexec_reserve_area' is only ever called with the static
> variable 'boot_e820' as a parameter, which is defined in the same file
> as the function, thus it does not need that parameter, which is a cause
> of shadowing, as explained above.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



