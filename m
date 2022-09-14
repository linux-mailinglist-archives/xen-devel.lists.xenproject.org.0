Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B224C5B81A5
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 08:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406794.649169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYMCI-0003ee-TO; Wed, 14 Sep 2022 06:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406794.649169; Wed, 14 Sep 2022 06:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYMCI-0003cr-QN; Wed, 14 Sep 2022 06:48:34 +0000
Received: by outflank-mailman (input) for mailman id 406794;
 Wed, 14 Sep 2022 06:48:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYMCH-0003cl-6E
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 06:48:33 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00075.outbound.protection.outlook.com [40.107.0.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f49f5d9-33f9-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 08:48:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7895.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 06:48:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 06:48:29 +0000
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
X-Inumbo-ID: 3f49f5d9-33f9-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ls87wXN1SGxWypdEX8bMwE7HM4mN/cQgJUTzG9+6q+diMQ1n0O78s/4y47pGMTTX6ZFCFvxMLu2tHpjFPFiEJqlzMJi/uXH10YNo7bp0SJzkm2fdJ5nPLWr+1ufw4BmoYqOdOECiEl93HmJ0Xi4+HNpHdzc863YdI2N3FuJ8z1ZxZ37lncBcVu9vJZIuzcDIRv3EF05k0q+QLKK6PdDVNQGXXB2qoTFmYRetrNGk+4wUfRd0RTxJcgm3AdOJigsHLm00IU0R1LFf0OGAwqvn3uhC2pgxNaLHR17exOxo1cLrxsdF1xRUB65qH2ZCJcxsFfzaxJtHTPzdwTNkRuRH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNPbNEW4AISYA80cv1dDTg7APdR8JQdtJuymlONKBrA=;
 b=bU+3BZ3NoV4KqirBUvIncYj/DqFioZp5Z0LboZiM1aAS3jHr1EDdSz5S+7l56P5W/CTZaUR4GTxsUWS2xIgs1YOCGbvrcZx5D93LTgJbr6ieFQAO9se7tIyXc52GOlWhl2ZefUxFzgvPllEfb72annELnrL8BCEHb+foH1bGPib3Zwi2dZTS7ZIWrYKerCno4gGcNd0YLQgqPK9jgyO3dM64jRHOUCvuiQ0EP/Y7x04yP+774o4aHl0lU6vvSE6mlZSaKvTDlI+bdI2ut4h7OkcUfaE1EHo8kKZqOTzrxUadHZBmohfjBsA89GbEcjwXmPz4lcG2T7goe2GElR/Jlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNPbNEW4AISYA80cv1dDTg7APdR8JQdtJuymlONKBrA=;
 b=wWA2oHM4IAoycgTRRj02G4PrvLdFEfL6nfOIuWEGBmjhug23ISYaQZVPkPhlxE5aa1HP49ZKZEYh+ZOZ67P7UTcbVFxGM7pImX2oO0SlLIaZk45XwUrygkt8HN5IPz5cBOkATEcZF7k4Nj5nJbGm4Ze+QGNChXfSE+BSIuvs3XlvrlFvN0DhGRlp3LpscQtaMVKaMkXO2YIcQFbnkyFpZb4NU/Q1nO7xi7FlAj4NsiusgAtAFH5z5TP6A3sHO2DpVy3BhwaQwSz9S3hEcn034n1H4C8YyGm7ZUaN86IMnJtMIhCCKpha3cQu0LFaOrOEdKb7hTgQytnIJRRh1IDpsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c1eccfe-3ca5-32d8-ee5a-cf8e7b23d587@suse.com>
Date: Wed, 14 Sep 2022 08:48:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Linux pin_user_pages_fast fails on Xen
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 "NK, JESHWANTHKUMAR (JESHWANTH KUMAR)" <JESHWANTHKUMAR.NK@amd.com>
Cc: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
 "Pandeshwara krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>,
 "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
 "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>,
 "jgross@suse.com" <jgross@suse.com>
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
 <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
 <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
 <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop>
 <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <DM6PR12MB4564E946E0E08F71B1CC125CE6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2209131629370.157835@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2209131629370.157835@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0070.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::47) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad500ea-944a-4d26-bf7e-08da961d21ff
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4zEVxgorSq9bxQ2SY+meoG29aV4r5YEailBbMT93qS8g6VsEUWtk+/qykZKdSLyhMCqKNzd8wW3/kNJ4Yi9AxzwREJfKG+7hM8D2hZ1E089frLqza6f4aKywzK78Mkw+FtfvDJPokLGgTO6Juh0C83dUHiBhWvxWhCAMn+bJa4yo+ICU+HVjN6rYt9Iy7zwzFI9b+zbb0Co9SzmDOiAFzthtCiPMBWVz/IiiN18tmes9QeEpS9mazrNOFaAnfUPQoo20CV3aX4s+o5tya88mIO3jMWdVZjzrWeU1/YdzzPCE1czQCsE0jeeb4hUNhm1hkmnL0QXg5Ch0bzWBXdCJJmbQXxpmynCg2m55aM5UYk7HAitY2EgQLq8jwaJJ4PvFcSLNOpoZIWXKMBaKkVp48ttAzggqP1k/dA6GFFzEgvGAyk4Ugzx5tzPB5kUK6nLnPUINN62Cbyp3XMqxxw121jyTQZrYdw8hnmCygOIA3ThDZtvb758rPjF0/iw1LWWigE0xmqpq3dmMANQ52e7MoMk6iR1sHZ7uthQKl/G9IPCGyzjyrPuabJtd6Ew2a3ZaSBy9uv9yTq6q0JwaElLGpwjvNVnoiXZzguXE47E6XVEKGJCCejcWAk1Vrl3qs39EVEHdesiIszYDCNclwZUod1YoPnoJK0G1XodhfZ3Q+sVC5gImiRfyDklWFPyl4p8x3b0051ylnnM9A5jd5NHsNXwPsNbxaNLdIa488mBjsYiEarqVTzXXNtdHsgjToB/BV8KhhSCf2Mh5OjKNh/hMB9WYOdXu0l+EdPQUxhH1g4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(41300700001)(86362001)(478600001)(6506007)(107886003)(8936002)(31686004)(66556008)(110136005)(4744005)(31696002)(316002)(4326008)(66476007)(8676002)(2906002)(54906003)(2616005)(5660300002)(38100700002)(36756003)(66946007)(6486002)(186003)(53546011)(26005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk4wSmlOaFB2UVpFckVNMzcxVVpvUTF2TUIxZHhoTnFaNE9IemNEdEpGbjdu?=
 =?utf-8?B?NmpreWFhdkRjZCtmRklzbTF0c1VXdmhtYytXOHVneG9hc01oVml0TTlvTVFv?=
 =?utf-8?B?WTJhNXBLMVB5WWFoVEtNQnNSamFINmt4RDJkbG9tSmJ3ajd1MHY2aHliMkhz?=
 =?utf-8?B?SVFZZW5mbmtLWGFEUklRUVJaWjJBMlRWVlVkMFQ2YXpXL2dkK1lvMkgvdE9q?=
 =?utf-8?B?UERtWFBQZFk2dWVzNkl3cTMya1Q5YjFHbXM3SlR5QUFzQXFLdlpUOFI0OWph?=
 =?utf-8?B?NlBnWU5ybmlZZDdjMjdOTnJucm9lNEgycHVjeFBwYk5YZ20yam01b2c3VUV6?=
 =?utf-8?B?aWtUd0Zxelg1MjVCc0taY2NCRDE4a05GUjZDM2ZJbHFjRi9yMTBDRGw2RDhF?=
 =?utf-8?B?aTlLNjUzZmtIVlNxUHhJY0V1YVZuMWg1cmZnSUltRXFZR2JLV3N2SE9QUVV2?=
 =?utf-8?B?ZzRSZGN5MDVLRGV4TUZZYXNtOVVzUDNnOFJ0Q0QyZ2NNTXo2NzEvVE1ZS1RR?=
 =?utf-8?B?YWlLQTY3MWNpSEtma0wyT3pwWHJCRzhXZlNEUklEb2o5VDZaTjJOOTZhMDR6?=
 =?utf-8?B?K2ZXTHE5cnhkYkF5MGpaMC9YdHVybk5GVVFtVEphQ2N5Z2d4bVF4aSs4SjI3?=
 =?utf-8?B?Zmk5SEpFWHozSDJ0K3RQQ05EQUlNWlVvUWRvRGI3bG8wMjFzejFFV0dwT2pB?=
 =?utf-8?B?Z0kzTzlzM3gzNXJDRGRTSHB4b1Fpbk1wNkFSejFvUml3bXJ1WWg3QzFCYjBa?=
 =?utf-8?B?YlZrc25UUEl5ZzZjcU1xZHFLUkFhL2xURGwyaVppczlwRVdYbXhobnFZTE1W?=
 =?utf-8?B?R3ZkMkJVVW10WEZXQ0txMFZlc2N2RVNoZ1l2QklLcW1nbUV6eUlWeG1XNGxL?=
 =?utf-8?B?cHFpdG5aQmM5NGx4VVdSckZTMWxRTDg0Y3JlUzAxb2ROOWtaZmljd3J6aG1G?=
 =?utf-8?B?M2w1ZHJFTGlIQ3k0alcyeHk5NnNIZFUxanpnNE9CWXY0SEtkNnFYWU9IRFBH?=
 =?utf-8?B?WmtzWkZJOE5xTVlTTkQvTE1oa2pmeVlVK1ppUThFRC9CM2hmemJxZXRKd0dT?=
 =?utf-8?B?WTRCRFo4ZXowMWRiSVJQTG5TbFpYcHlqL2VCVjMyT0YrNTZoSUxjayt4T2R2?=
 =?utf-8?B?bmhHQlh5eS9pQXBqaUFBd2Z0RlNJcDc4UVpYeVJHNW9BazFiMTd6aDhTT3Uz?=
 =?utf-8?B?UkhOcVVUQVRVV2RuQ1hFM2J1d04zbkM3eVRMWXBhRHhRajQ1T1VaaHlNZTcz?=
 =?utf-8?B?RzdSUFNaNEN3OXRWRDk2bFZ0ZjFNeHJnQ1BjRHBpbmI2L3FUVVNkbUVMVkZB?=
 =?utf-8?B?cngvWkl1Z3FpTkp2YU1pM08yWFdMcUZDT2pBdUl5MXZiQjhRYWRHeTdlUE9o?=
 =?utf-8?B?V01lRTdSQlNoWnBVaDltdnZnQnJBV0pHRTd3bHNlWm5HZlZ5R2JySHN6cnRB?=
 =?utf-8?B?Q0czbkJ2SDA0Tmd5Uk02dXBtNzdzRzlkUThVVDIwSDBQM21MZWgyZVZYYmI0?=
 =?utf-8?B?cENBRWEyS1FTMUYwSmw5MkRhNWxodU1jZmFMSytUaVBBcU9XYnJGVU9aYnF1?=
 =?utf-8?B?TFlrZnBYUHc5RWlmZUNXSnJpMTdwMk1tazJLemJPa2IyUWdRK0dnT3ZIdTVU?=
 =?utf-8?B?eGpPTlJ3VUZDZ0d5YnlYMGVWWTVuanlPZHg2RmF0TFdhcEhSRzkxaktmdUhx?=
 =?utf-8?B?a1BieDNqQVVFdWd6ZkQ4VlBVS2g0SjcvVExzSWhMUWdiOTFtVXZ3dHBFVzVX?=
 =?utf-8?B?bkZRdlRQZUZiUlBnWWR3ekY0Z2lxaTA5RWVmNkkveUFQbEZIYzk1YzdNRmxI?=
 =?utf-8?B?ejN5aVdpTUNxQkh3ekw0ZXVSeWNxd2ROYWNxaTJFQ1VxK2F4Sm53NkxiSGcw?=
 =?utf-8?B?RHA2N0lBYzVtUDJHeFlUUFFIUVNhNW5xRU1ZcVpXdTBQQnh0NTA3YmlDdlFz?=
 =?utf-8?B?TXVhUHFBc2pGMlRaQ3M1RlIxTlMvL2kza1NqWW16emNMUThpSVVpYUo0UGtL?=
 =?utf-8?B?eDBpR1QyQnZYNWMwSWVxdEtjWm9ONS93UXBkeHlzWWJkcE8rRzJNdkptNzds?=
 =?utf-8?B?S1NpcEJBUm04OHpXRXAxTEp3dXRMUjBFejhCR2Q2WEJHSm5lTFBWVHRiZ2Na?=
 =?utf-8?Q?kMbgix88uN1uXs/VXSMVjTXSi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad500ea-944a-4d26-bf7e-08da961d21ff
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 06:48:29.6535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7L+Ls3KD9ScAX4vQWEbms4iwEpkzeRJqKyIuhC9iNP1KGl5UxtAmsa2TgysI638CbTrfU4XbEBkXUgfDDlEtAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7895

On 14.09.2022 01:31, Stefano Stabellini wrote:
> The problem is that drivers/xen/privcmd.c:privcmd_mmap sets VM_IO |
> VM_PFNMAP, and either flag would cause check_vma_flags to return
> -EFAULT.
> 
> Do you know if it works if you remove VM_IO | VM_PFNMAP from
> privcmd_mmap?

My Linux MM knowledge is certainly rusty, but I don't think this can
work, at the very least not without further changes elsewhere. I did
look some at the specific use by the TEE subsystem, and it looks to
me as if their "shared memory" machinery simply isn't meant to be
used with non-local memory.

Jan

