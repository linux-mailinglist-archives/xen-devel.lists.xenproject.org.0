Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95C76B0585
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 12:11:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508003.782252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZrgz-0001bl-5D; Wed, 08 Mar 2023 11:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508003.782252; Wed, 08 Mar 2023 11:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZrgz-0001Yy-0w; Wed, 08 Mar 2023 11:10:45 +0000
Received: by outflank-mailman (input) for mailman id 508003;
 Wed, 08 Mar 2023 11:10:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZrgw-0001Ys-PB
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 11:10:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcd706c7-bda1-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 12:10:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8175.eurprd04.prod.outlook.com (2603:10a6:102:1bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 11:10:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 11:10:37 +0000
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
X-Inumbo-ID: dcd706c7-bda1-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daSbMCFt3/O2wuYAa0C/rz+cROKxdry+hx6ZKBQt1ide0WSD3eJ8s7SNONrulHNF2nZfTrfI/0rXTPPpZlypac29YTgUlU2Me+poXsjbdgB2Fb52woxI+tEMo6/O38yEt+Jtezms2ordNRRNf4mBWX5gSq12PUoiYtvmy0n5W5z2Zfs2KFVcVnh3XrgNwtE5Qw5k1FUIoN9pnQIyK12o35zRoyRxh8cPeI0/iPfaD+98Abgh1KpW2hmRIBwWaZDCgbRrHtf6EVFqbNLtZceiNLXTALkHGTEhsxb0XJ6nYKgFe227I7L4CuV6EdpKsjvoz+RgtAFIJvtKb2NXf4lmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NR463oiHKqzcT7wbiZYWcVQzzob4Lnx9iW3z9sgm2c=;
 b=N8z0VhV15t/yjRqf1E+41CZdsIXYcIRL8VCD50bHBfCcHT0DRQJMYjkWq3FEAsyCNH+GvOGpqt7C1E/8q6dkFlpbFHNv81o8Ol7kHiJYtCTC81b1S3RbtB43A9DL/Z2DUDUnye+AcJ82XO5KrP2xQIVVlnu6fKUJi7sSSZgoKbLk0tPK8eIG7zzM41t4qDiEgAfyKGETECBRqZI33N9IjiQMvFgqyTn+pGM7AJelNy7BSM/gqhAI0J5kg13hwKcV0XfB1ifqcko07OkgUR08ad5RDKFSgAz0s8x7vUbwjJjtx9Q3f+o94bGFnw6yGYeleh+DVBvJHX5eDIbyguxJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NR463oiHKqzcT7wbiZYWcVQzzob4Lnx9iW3z9sgm2c=;
 b=2HjGee3iYnYhkp+duzrZyHYvFkGzY5Kn2OueVxVWAaLXQ/vI6JOYA0/9pdEr1zyCr69HVjRpEjtzkY2qJpNP2bCDNQHNWPw7iwGoMwrVhN0ZUdSB7cdGK4uYCytziKoWFYF+pn7t1phW5nc6r05rsfzuO4T3J3JBC4K2fdhzfQSaT/qEoFRCuRecG4U75mIp0noOK0xBFrEyiYryOG8wijYlHoRR40oK/nxLa2wIC7SHDOBQJMxLUR5ORK30oGAvB0RoiX4EsZqqs4hcfD+HjWfNlhWH3b1oyFgPxMZoXivumsKThFSzIpTv6Lg82vvbpb48IsgfxOuZ+eMgaohjbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9ee1eabe-b0b1-e5e9-728b-7eae2521db7e@suse.com>
Date: Wed, 8 Mar 2023 12:10:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] build: run targets cscope,tags,... using tree-wide
 approach
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230308104927.18078-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230308104927.18078-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0099e0-c3ca-4e10-63ed-08db1fc5bf0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NAObcc7lw7HvB1xqWtrzkR6keMjkQhkDyUvwODNZljYigLL85pfM8rBoK0XPNlYE+LU/TNcjbAncL7uTXxrhheabzThNLjaL90wT2tChlhKboic1+CDHD0a/8F/sO3KFZSElbbyeXbzcPrn8qWcbYd/G7U4HeHUzyttAIG/0zkZ76E8bjcLJKU45AxIjC8bEuj0SDuxoBTtBzq7B1B8y9HHcoYG2uk37sV//y84WsoKph+fZP2peLJ7L/mFr5ZXjyOpmF3cJ/zn7+N1gz5rgW5f2HZMReAUodiMUeYlU94nO9zZIuuXPMj+72WskHFBAfz9dzXfX8Yd1rbv+8HCvKQJKd/0Pz5InCBNFU1CVQLv10kl9gxEg4Vk7MXakWyMpmfyHZWKQht0FU6xRLRmHgMobrOJiGQ6Zpi8hDsUIM6F2jPAjUmDiYSpezM6s+Zz9duYI1kzazH33vUfkvIR42XXuXqQ36JEbQkFQwp0kds616Pk7oHxVBikw7rlXdY/WGGFy3FuhenAvJuEQncBRwA8xFwu8BcDJNqbrz4Vkz35UEIvGF2hQAIHhko5imgYpTX0tC0J6pmUTC9u6f2f+RzSvW7OKGPcmGymo7+R0dujtA9Pc4cuLaxwKnkJe18SSs5B7PDA+9Cr/J+en1Z1uU+BZfXnUwpmHuK6dVNItf1UIqAIreWJLZ1n6PUJpJjCvAgx4SFVSlVuWc8498dPJhSLYqHcWZg6E3TgV2LSkTuc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199018)(5660300002)(8936002)(6916009)(4326008)(66946007)(8676002)(66556008)(66476007)(86362001)(83380400001)(36756003)(54906003)(478600001)(316002)(41300700001)(6486002)(31696002)(2906002)(186003)(38100700002)(53546011)(31686004)(66899018)(6512007)(26005)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE9UaGRXVjFEUHBTOTFZZXVMTWdpTGlpVnhQVGZ4VFJJMDhxSXJrL0NsczRh?=
 =?utf-8?B?ZFBmY0tBa3JPeUdrK2ZHbGJkOHNLL2lsU0N2R245VS9kdllRcjEyUWREeURl?=
 =?utf-8?B?Y0tnVDVzbEpaeUdBWEJkdjNZYjUrVXl4RjFYc0xEelRycHllRVNLU0hUMytB?=
 =?utf-8?B?cnFyM3g3UFl6WFpOb1VqSDlSMVppVThnL2Y0V1NyN2dWMERORnlmZFBlejlz?=
 =?utf-8?B?KzJCanZ0ejUrZlp6bm9WSGJQOS9BYzg5dDJVaGUvNmRtbjNGcnpQYlc3WUp1?=
 =?utf-8?B?TjRtUmZBYk5NQmVSdEorOTN3MTFlbTlZdHdlcCtEL29NRks2b0gzZERZdkRZ?=
 =?utf-8?B?VjBmb2d2Zmg5akpJcFBnTC9JZ3ovS3ZKeFVsL3dLUDIrMWdjQnFQak9aenBO?=
 =?utf-8?B?d3Y2eE5XaldnMUhkQnJDeko5NEN4R3prVHhiejdER243UHJ6WFFvMkUyajJS?=
 =?utf-8?B?ejRzUlExbFVzUi9zVlNrbmFGMmpaR2QraW9OWDl5RjREUFc1dmJlZ1k0RktV?=
 =?utf-8?B?c2VyVWNnQlM5R3RwY08vakkvSWpHVzFKSW1NV2RoVFE0N0gvbjN2bnQyK1Rx?=
 =?utf-8?B?VzRyMU5hMkR2TXdFRXMyNkFTS0ZtRFIzeWpkUEFKbG4rQjA5ckpFTlF2a1pj?=
 =?utf-8?B?djQvVVhpempzMUNNZnRYL1BhZUpkTzUxZXlRMTMrNTBDekJxdSttSHIrd1Jv?=
 =?utf-8?B?SGtnL2hjNW9TT2VPcEwvS2pISnVZVUorSjJ0VWNFWXVuTUt3c3hJaVp2NlZv?=
 =?utf-8?B?UGIyZmxMMjFmenRoeDV2TkdEREN6MGhqdUtVbGhEaXF5WGdHRFVXN2RqazVC?=
 =?utf-8?B?N1VDVHFNd3BmRUg1bVp6ZFhyUmdBY0NmWVVtQWg4NGFHMTFRNkRYWlVuWkFv?=
 =?utf-8?B?MDlnRnVlOTdlK3ZJV1ZidXN1Vi9qa2hkckZkVUdCSzRNTnltdXhRMEVjbVNU?=
 =?utf-8?B?eXZTTEhBLzNwd1FZUExDZzc4enFLUW5ndTVqeUhkUHU5cGNmOHdLTVdQNTda?=
 =?utf-8?B?MHZxSmlGT3VYTlV4RnlxcnV0bHcwWlVnYUdPVmhBOUJxdU52TXFqY2djTzNa?=
 =?utf-8?B?bnRaRUV0SkJEOHBzMlRuWkluSmw4cWdYVFY4eTRvOU0wVEE0aHMwaFhHeWRy?=
 =?utf-8?B?REpoOHpidlMwTEk2U2ZubE1RVDJtUzRBM0E0MjhWVzR6QUs0eUZNRXkyTFlN?=
 =?utf-8?B?UXNGZy81UC82OHd0OWYrejdRVitvUHY2UjFTV2RlclRBSllQbGE2UCtsTjJt?=
 =?utf-8?B?cE14b0E0RysrOUNjS3lHYnlFc1JURTBuUHk3RHRGczhUMzJ6WDhUYkk5ODFY?=
 =?utf-8?B?b3NXMVJQVzVrMVp6RjhVQ0cxNXFFckFKTmtwQnJaVXd0a3d5SXhic3R0NUJR?=
 =?utf-8?B?enVSK0hOUVA2eHREa2dFVUFJUnRVMDJCcURUNVpERTI4ZXVDNlBkK1FWcDI5?=
 =?utf-8?B?eEhxdXlLdEd0Y2dvN0p1cGRGNDNaY1hIN2NoaStqWHQ5Y3RkUklUOVdyK0lR?=
 =?utf-8?B?Tlg5TElkK1pabnQwRm5EaDVzdVdVUzBHcTJrMGtId0dFTWszd3lvcDJGN1pW?=
 =?utf-8?B?elVUeHlseVVlYWcySi85dkk0SDlmNFl4MmR2U3BTMytoMERUT3Urd2ljV0Fi?=
 =?utf-8?B?bEk0a0FSZXFSYkcxWmhiYUw5ZWR4SjJuV1RxZnl4emlJa255Qk1EUUxkdE12?=
 =?utf-8?B?VUJuK3hqQXlOZXEwbTN2Z3ptbjRmV08yNFM5a0JCanFOR0ZtWW5kdGQrd2xk?=
 =?utf-8?B?dVI0WE9UdWFUSGFtRGQ4bThMcklmRTlxSUZoR0NDUFphR0ZGc25wd2VmZEo4?=
 =?utf-8?B?eDFjWU9rbVJQeXV5ekNrTnNLMTkrU1pRTEFCYVU3Y01Wbmd6THpieWFtc2dP?=
 =?utf-8?B?K0FhRG9XVDI2RkxHUkR5M09yL2FoNXlsMEhWdWxVNzREVkdzSCtGV2hySUdB?=
 =?utf-8?B?MjNoYU53ZzFEOGJNQTgxbmhibmI0ZzMwakp0b1g0d3MwNS8zVXVJUXRjQWc5?=
 =?utf-8?B?MTZYZjJIMFVWZXV1N1lpVUNnWU1aOEprWlcxSnBVc0o2MUlYV2Y5Z3hZUzZt?=
 =?utf-8?B?bmhaRHZhTFdkbEhHVGJHSnZRTjRzcFZ6T3J4Wm9aNDB6NkNLNUhzUXVPU3NU?=
 =?utf-8?Q?IjjbxApP9e+/z69sv+sWF8ctW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0099e0-c3ca-4e10-63ed-08db1fc5bf0e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 11:10:37.8716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMVbkh7SPQsDJp9FlgdcsdTspCU2GNTQn9nAR3QvF+u/rNelUO/F9aeBPfadXvDm78/iN88FWGU1YDHZualJng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8175

On 08.03.2023 11:49, Michal Orzel wrote:
> Despite being a matter of taste, in general, there are two main approaches
> when dealing with code tagging: tree-wide, where all the sources are taken
> into account or config-wide, when considering Kconfig options and actually
> built files. At the moment, all_sources variable is defined using SUBDIRS,
> which lists all the directories except arch/, where only $(TARGET_ARCH)
> is taken into account. This makes it difficult to reason about and creates
> fuzzy boundaries being a blocker when considering new directories that
> might be config-dependent (like crypto/ which is missing in SUBDIRS).
> 
> For now, switch to the intermediate solution to list all the directories
> in SUBDIRS without exceptions (also include crypto/). This way, the
> approach taken is clear allowing new directories to be listed right away
> without waiting to fix the infrastructure first. In the future, we can
> then add support for config-wide approach.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



