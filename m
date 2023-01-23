Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC371677D72
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:01:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482879.748645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxOB-0001Kw-Sk; Mon, 23 Jan 2023 14:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482879.748645; Mon, 23 Jan 2023 14:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxOB-0001IJ-Px; Mon, 23 Jan 2023 14:01:35 +0000
Received: by outflank-mailman (input) for mailman id 482879;
 Mon, 23 Jan 2023 14:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJxOA-0001ID-H1
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:01:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2077.outbound.protection.outlook.com [40.107.8.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70c2b671-9b26-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 15:01:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7397.eurprd04.prod.outlook.com (2603:10a6:10:1a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 14:01:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 14:01:28 +0000
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
X-Inumbo-ID: 70c2b671-9b26-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmkEABVz5v2yH9EU+0uKHsdqxlyxeIjF+Zlj+ScVyVW/R6xbIzgvUIftIJPPwPxSjlKvpLxZs7RRAnSB7DA+k0TpyE35Nd/6solph9v1Eh8l6lH7M/QiaUZUWTDMoXTYSdT2PsWaKP0UeuPJUWmTzkxK/34D/k8yPhRVszr++3kydBBtVuXdvGdCgz9cPrekegFSCVzTdBQJso7gIZanjYhcRt+DUPsi7dkOJzYoMsDLtiZID9AfgKkWkJTsKH70rCyGvKoO6rJbg3TNM75A9DsDpem0t2363Fof6McCyYWnAk4H+UfUA6jVZ2dCzUMRv+JNiVkCdmq5p9bOLNxaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zg3tA51WWHVgY5PJgKh3Scq4U5zGBLMhgrhmUUHFOTM=;
 b=BzB/xT0hPUFD/GZ2lCAySFzohTQekAkndkW0hGBKaHUgJlLyZmeAOX0y2QO6B6Cwo1bsWmjcbbsQPXTsm1IoDTpeovk29XGLSvkILNZGmw+3H/OKbeE95Vr5PyJjlzfS2IbUY7Y7M+dyoJpyTnxjNOgrPgUJpXRT69WTro92GrHfXSZu0cL8rs6fKzfN9R4wU7X1TpW81a6mj94UQ0f025zkUxEmvmc4Dc7YeJ0P0y/dYrsZSo8AooyG39QAvvsiuajsxaJ1E8M9W04VX9TUVN3Jh1q7SC9Mt9a8ML0mHZ9s6u01/spd4N5owxGXeMMIqCQO6fqYUb75k1t0zgNksQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zg3tA51WWHVgY5PJgKh3Scq4U5zGBLMhgrhmUUHFOTM=;
 b=O31LdaY6/HnXa+uJ5OrBgo/JxGEyy4Cut6E+1NwLBavymWILF/Db/6onpT2uk+D4ypgF6SCRZM0GqbHR5MO5tbNkh339lt1mPQq4C4GbJ/0epKKsxOH4/b+4f0XFmdQGUGzgCfsdnhQo6+MHHEnqq4/cBLIZCdRUkGAAeJZWcieG4ZE9A8Jp8wo2S+q54H73RWU4cGPjf4qQyROac26NGv3EkxsRovqHkVAwFM4EqLJrCpGAWQvVIlM5uRNvpjrZn8Ai2/mjORJfcfQsIiV4bd1WDlK5WmW8EGojNTxOZimtV+UbvxWzl2JcjIdIlJFnof15XGBtZm5PH5vzA3IUYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b24040f3-4dbc-dd91-3d7e-97bc614679e3@suse.com>
Date: Mon, 23 Jan 2023 15:01:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN v3 2/3] xen/drivers: ns16550: Fix the use of
 simple_strtoul() for extracting u64
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 xuwei5@hisilicon.com, xen-devel@lists.xenproject.org
References: <20230123134451.47185-1-ayan.kumar.halder@amd.com>
 <20230123134451.47185-3-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230123134451.47185-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7397:EE_
X-MS-Office365-Filtering-Correlation-Id: c65db9c0-e0bf-4203-50f8-08dafd4a52b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hDBmWhqc+9Ptsmq8JcaQTSVp+sIwlb2ZlThOZlr0obPilnm0AhC4EU2HQF9z+QB4o5tFrM/iRSXCULn3WHK0A5Jy9tL8NmCqUVOPcx6lvkHUhVnmCqbQ+QT1tE5ebF3EmtJTxPn4Db2vm24D5BvoFlOXlBwRPh+eNuSZVgNmnws6sr4oDlFbRfhZvE9bMXshWWrl91TY5j2pjzmdiwb+QKoRKPCpKip9MDQ84WpXurVrz5qJLpKaBt4CnSkBMmCh+K5lw/CAqnCczEE2umVaUWVsB1ZX8dIPQTix0Tyxa25e30+e49J3lsyz6WWFzt7QN7NmOhtMjX4DmzH6YkYFYwK5iTidtONOqd6raqwYw6dh+n457FNucJBpuF5pid9kShaWun6rVurOII6DiPy+uIAZNWjPMeF/YaeM6bvFPmOMxCeCxK2zvXV+QvQRQ6yEE0PK7L2jPbPW7S0I1oquyOfSG4YXCG8GtL0wnzMiD/c6JVZ20Yb61y+lqN3RwpuFuA+uOVre7c9/wcN1UbWbV5mJfutplJPBQNqmddrNeGo4gZcr0MnE4x/brDa4ob93Do6QjeWjSZ9t6W4UjSC/MpMGT6wgXCV7JrPiaFYU58HeKTbZg1tpkPYb8BpbXeKHTVZtfj7QQLHKEx8f5dIfnVv4a6Ah3RV09PKX5tWLHBOrsi7L7ibWDRlN987PE9aB2nXsMf/djeFHWAQ86kmCebR0qo+WXii+WDAoqlpn/Zo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(366004)(39850400004)(451199015)(31686004)(53546011)(4326008)(8676002)(66556008)(66946007)(66476007)(6916009)(6486002)(2616005)(83380400001)(6512007)(41300700001)(26005)(4744005)(8936002)(7416002)(5660300002)(186003)(6506007)(2906002)(38100700002)(31696002)(478600001)(316002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1pyZkdkYTBnNWxCVjBwc09ZSXJ6disyMEZqR2ZodWNMQmZkYXd3dWdVUDBO?=
 =?utf-8?B?cFNOcFdnWGRPcCszNHVNemFEUlZ5aWhGeXIyaFZKZ0JJZEtRNUlkSW1hYVF0?=
 =?utf-8?B?ZjVNcjR4ekNNNFZyM3o3VEpaTmlOQlhXaWgyVUhuNHZOcytDOVRDN3hYQUtK?=
 =?utf-8?B?TGJ5Z2dsaWdmeXNaVHJjT21NbnpXMTVuNnR1MkIrNlYybi9Fb1FPZElYODVx?=
 =?utf-8?B?dWhReHYwejNwKzZYTVV5V0tRbGk4WW02Ym15TUhXRmErSGU1blNyQWxhT0gy?=
 =?utf-8?B?RGxRVU9Ecm9CTzMzOVVYOWRtZWRmaXYrQ0l6VW1lc0I3cUsyS1Y0WEtrbktC?=
 =?utf-8?B?L1FLRDNRaGdnUmpvYmdOZFZ4SFdLSlFoaVp1RW5UK2tXRVkzVkkyRkNUVFdS?=
 =?utf-8?B?N0hTNHpvdElxVUhFMWpMYWQ1b2JMZk54bHBuaG8wMitUczNOdms1R1l2dTFh?=
 =?utf-8?B?NnFJUTdJdGQ0SUU5d0UzcTFrYVROalNBZnY2d0VBa0grcUJoR3Exdk1GWk92?=
 =?utf-8?B?RVZ4c1hhazJQeFFqOGNyallCWndHdXJjNUI4VTRSeE9MdnhleWU2OEppWm1T?=
 =?utf-8?B?bVp3ODE5WnJkUWRRdllhTFFuRkFJQVNBbTU5RTFoRnliT2VmMExCVjJEREw2?=
 =?utf-8?B?WWViMlhIaENab201RUFSV3ZQTkNBQXZpbUJBTUk5WFhLZ1czUGFYNms5MUd4?=
 =?utf-8?B?Vk5kakdXY0V2L2ZTYlEvRi9oVmVOZHpRMVNhN0NxUWxWYTBnbzRaUStGY2w3?=
 =?utf-8?B?eGNlK2FBTFMxY3U2UDBicU5KclZNQkRaWjBxZ1dCWWhXeDVocnRTM2NsUkc3?=
 =?utf-8?B?MzFPUzZDMk92NSs4ZWFaSENwbWNKZXBFcjJLRFZZdmxKdnlJUGd4S2xNbFdx?=
 =?utf-8?B?RDdZQWtENlJWU1kzL0c3S1NBQ05xMXpVQURpd0RYNVIvYkdqQ2JIVmlLYjVn?=
 =?utf-8?B?dkEzSmd3QkYzNmlhaSt1U04yQjF1dU9jcXNsUnFsdGh6SjFtVGVhT0ZVdlRw?=
 =?utf-8?B?SEMxUzZjOWphWHpuVHVWVCtSLzVwTlpaek9kWk5VcDhYMDFHeExwOXdVRUlT?=
 =?utf-8?B?ZjREdEFXWStlVnpLQURTU1J6MHJaUWxlNmZWZ3dESTB0Tzd2dGFQOHVLS0hh?=
 =?utf-8?B?US9PUEVvRmZFRUIwKzA5Wk83YXNseS9YTzVoTzFGcWNZdDFBSEFMQ3YzYWsx?=
 =?utf-8?B?QTFXeUtxQitoZ25yV1JzZWUyY25VUmxTWWlRai94MzFlSC9TdkFGYUdaaE9O?=
 =?utf-8?B?dS91NjRqRzFsSHRkbUt1S2NYekE4NXEvc3lUaHEzdFQ4WGliaDUwR1JpbU5R?=
 =?utf-8?B?dDdOeWpLbEF2OFFqSkI2VGd0ZVRWSG1kcWF3VHk3SS9PZEU3U3djZVhJa2Ji?=
 =?utf-8?B?TUFoci8rMEM5MnNKVi91alh1ZVB1Tm9zRnJ1SzRvVHVPUzExZGg5ZzBVUm5M?=
 =?utf-8?B?WWxwVWRyZzZFL2xTOGpiSG54Zit5SmlnNUpmdlZTQ3FxTzhvaW1qd1lodnlh?=
 =?utf-8?B?MCs5S0s2Z2Q2anduVHQyOWY4Q3lsYzhqVmhYMTN2cUI0L2RKNEYxc2YzbHQv?=
 =?utf-8?B?ejRBWG9MV3ZNajQwS1BIWW5QTFU5Mkl3cGlRSWtCV3FtL0Y5Mnl5c3hYU0dZ?=
 =?utf-8?B?TmNseVkwYWtDWUZBMU0yYzB1VUtZSG9MZ1VYcUxsWXBET2dOREpoN3VtT2k0?=
 =?utf-8?B?REZpMXhJTVVzdTd6TW90NlFoZWFHckY4Yy9vczF5YmlkWWhoc3lQcDhnWHNB?=
 =?utf-8?B?aEZGSVNyTFhJTXhBUGx1UTRTVFdZOWlPNFZ6NmNjeXIzQjN5ejZtaDA4MjZx?=
 =?utf-8?B?ZkFydkt5MmVkcWhjOUpWS1l6eWh4d3pua0F2WEhDUk0xcnFJak11NEUwalZp?=
 =?utf-8?B?Y0NzcDFmWDh1bEl5YXBiY1ZVWVJyTXFYQTk0a05lS05GdWNQUElxMGdWeCtN?=
 =?utf-8?B?QlJTSm9PZ0QzNk1MM3ByRXhWcjFQaWVORFllWlIzMXF6M3AzYlMvQmQyWVly?=
 =?utf-8?B?SmwrTmRScGtWQVd2RHhVNGVQK0ttSFdvTDhpOStISzBQcUE1WFpKdUIwM1ha?=
 =?utf-8?B?ZVN2eFhheHAyZjB1Nks1SUU4WWZWWnFDc3kwR3ZKQjEvMWJZalkwZVFhaUoz?=
 =?utf-8?Q?oUgXchGLrmgi+mI7NJzRw4JqN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65db9c0-e0bf-4203-50f8-08dafd4a52b9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 14:01:28.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JkL7gTDkxnpTOURUgKlUUbP3xKxmX9dy2s5JnryvDrpjTQ8HXt8m6nUW1tgRk3yUlMNBQPBkjCJmRA2JYJcOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7397

On 23.01.2023 14:44, Ayan Kumar Halder wrote:
> One should be using simple_strtoull() ( instead of simple_strtoul() )
> to assign value to 'u64' variable. The reason being u64 can be
> represented by 'unsigned long long' on all the platforms (ie Arm32,
> Arm64 and x86).

Suggested-by: Jan Beulich <jbeulich@suse.com>
(or Reported-by or Requested-by, to your liking)

> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

