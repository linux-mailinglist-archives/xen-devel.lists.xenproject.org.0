Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41B77F0E1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 09:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585172.916211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWX5e-0002GG-BT; Thu, 17 Aug 2023 07:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585172.916211; Thu, 17 Aug 2023 07:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWX5e-0002D3-8f; Thu, 17 Aug 2023 07:06:42 +0000
Received: by outflank-mailman (input) for mailman id 585172;
 Thu, 17 Aug 2023 07:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWX5d-0001GS-5i
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 07:06:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d159a22-3ccc-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 09:06:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6980.eurprd04.prod.outlook.com (2603:10a6:208:17e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 07:06:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 07:06:39 +0000
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
X-Inumbo-ID: 9d159a22-3ccc-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JrVyS7wvDcS3XlctSe2E9BJN6+/xhsKW+LLgla4r/9ojKmaRL700qztqWyOJ95NcQ1vbT/FHRfF3ZUMn+vA3XNpeq43Ykl/z+EF59a3f/575uP/srsWRi79U4kbLARDhcVsB3GUu1yTUzXNuoJHOxzoRX8KKvPJunGDx2xnjzzwAxV1bcIbfeflApHq95kdCb7nS7JRz4D2DKScs1Yg/A/mhwfowKfXj9RUhHvzErSoZAVFR261GYcNdkAsfwVYqP5Znsxl8innphU1UXcKxT7rnb1nd2UI25jYJbw5pgqEfJmKOLNTBcatXiTIAzanpB+E70LLgfPvEgbDBeM9DPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDcmFwDZoriHIs0w8FQwS96ienJJldTzepe7VXCVWvk=;
 b=Qoi/H4glWddMJj74B359ptngqwPj5GYdt5sl95kM/Bi6xdLGNIyIjKOS2EeHjWEi7pgpFWyJfbS95MgsrPd571ReEWDGx2ZKrd8h5RHs6LYUAIQckPfURtbSZ9X4l2AjdsVeiX1ki4VyUVDl7YZewY/BbYH8Ff32bc20cBk4ZeqbV4ZaqUo7prQb0k2TUr6WH/vZG7QSMnEk2Oqv10S4No9Qwv4ovIPUw/X+tI9R9Fb2WQuAIyhRtXkcSVvN5lJMNXStjcSRqfD5d/U7FaZGbTfrl5uUA82fhmO3Nuoz+RYNxkFK+Yf86RtAwrLollcovpZJPtNoJ3WOvwFAJ6Szlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDcmFwDZoriHIs0w8FQwS96ienJJldTzepe7VXCVWvk=;
 b=Du4aBe9y3Wqum40agUwqDrNvrtfSFxs/b8ISIvnluozmLnf5BCopLwdkSBgyYSPLFRk8Io59vY/Rb10vE0JRIskgFGt2iQw02Yi5JllErqNuGxIIHRdRSSebU387kUk+PCnLJwZwDHswpcWzFwXJhLn9LJGeP08bcLg4+o+oy4kXmBVhCdycoV5VZr6IVm1/YaYqLfHLb1uAjTw2xSMMcw16qEQh1CN4jwRdalnM3a1VKtVkMHF2gNX+TyWfW8K0HmP6Uy1eDbYDmQ4xkI2XLMwkaJxlGhRbrkIujWBQrXhawXQeVaGaO2GMOUYLtZVMPH+YLPTrNU6wIunbcmxBBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a9009e4-91f6-40e9-8928-7e1c32c9c7d9@suse.com>
Date: Thu, 17 Aug 2023 09:06:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v8 11/19] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: michal.orzel@amd.com, sstabellini@kernel.org,
 Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
 <20230817003947.3849-12-vikram.garhwal@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230817003947.3849-12-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6d392d-8502-42d7-bd59-08db9ef08081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jlgraQrV8UpwgbxjHu2z0Yxe8AowEjARnveIDbYkGBsYSReYDWxrNnrAgg1ZWYEV5maNiD9LfcJyDkiJn02b3HLY7FplIF9gOF4aWJCkAlaJYjvskvUq6ZVvPEnNGT1OLQjKVYrUPqmCN5Ny1BUWH/LW1Xdn5uXufSZqyShLZJlA79hEk9tUgYVDVp06MRpKeMeLXTLAo+9I0ERCvRqeSYAqBVIhUZCzutX2N7BoV7nfezy+Z/HvWPrGAZnXLnekHNjo0qJBVagz9qb0tF9nM3pMmK5M//vp7m94WlbImeBcPb0/nSAbgRwhBurE3xC+7ujMDXCRd6xPPDmau/Rwye8Klg4f/Q1MQF9ZDgbNpcw80I/TrNSvycAL3KEhXJW3n/eKJPZ8I239nNPvJvUlI8clW7DPEL37HPMS+3OOXJPRVXRHPX9uWuvO5p+X1w8jaNsU+YvBGySk6ljKO+wMB41QGV3l5HiuXJjkjYkaAssRtZGGjAV0RlPGK4S7bzz4LB7YOA+RuE3VEF7zdK/Soa7Q1sN/TDjtr1f/zK8HTaPBDul97BMPbE/FHc1ec+URw9t3SlR3kuH3YEUzi2i6P1c+M1/JAe8Xl5e/7HUHNBhVFvgq1NqRssqhXB5dJZnZDgeCwTBgmUiAKon5jGJhxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(1800799009)(451199024)(186009)(2906002)(4744005)(26005)(86362001)(478600001)(36756003)(6506007)(2616005)(6666004)(6486002)(6512007)(53546011)(31696002)(5660300002)(41300700001)(54906003)(316002)(66476007)(66556008)(66946007)(6916009)(31686004)(4326008)(8676002)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm5ESkRNdXBtYXAzbTA2ZDNCb1lLcFU1NmdCV3Z6TmQyRWRMQmJKdDA0OUlE?=
 =?utf-8?B?M0ZHdUVieHhUeFQrZzBkT2pNT1lHZVpicDBFZkczakN6V0JYUUg4VnJtNEpN?=
 =?utf-8?B?VGtCYXk4U2twQkRuRGRNaEpFNlRnbFFvc25wdFFod0kxaHJMVm5EZXdWa05D?=
 =?utf-8?B?dUVocDZxaURURkZZSlFhQkF2bm13bnk5UU8wbk1UNi9BYlVWUzU1dDlPcWRn?=
 =?utf-8?B?SFdISW53eWUxY3B0bW5HN1pmZ1djMlNCWWZDaFFRUkUzL1BpaXpITTRIdCtL?=
 =?utf-8?B?ZzE2c3VlbUdzbWc2LzZnZmtST2w4eU9GNUtvalhjTEFoY3RKMk5QZVVyQ3pt?=
 =?utf-8?B?eG1lL1JDNDEvUVVlQS9odFFFMlNxOUdZY2dXak5WajBqTkIrQm9oaVFpRFVr?=
 =?utf-8?B?T2NoemJTQnVONDRuY0pGdlFFcTlLdUhBK2NVUU91c0pzL1NlT2tQYU8rY3Ev?=
 =?utf-8?B?TVRpa3dvOFVqcklVNmRESitVNmxhNGtpWHR2QUV0Q0Yzb0gySGR3aCt0V3Rq?=
 =?utf-8?B?cmNwZndYNmFwVm8wUjB0ZXlQeE56L1M5OHBEZmU2b2VXWUxLZjBGSHZoZ2VO?=
 =?utf-8?B?cndpbmlpdDJHTG9RNWI4ODVaVVZNdmtIYnlBODhPZm5oeUd4QVJaVVFGSjcy?=
 =?utf-8?B?UmFnTzloSXhIaENMekk5NGlNYlc4aUlRYlp3dS80MU5md1UyN2ovU2hnOERV?=
 =?utf-8?B?dFR4SHJLTkhLc1hBUzZVOEsyMHJ3WUFlWEUrTWdobEYya1VhQ3NyU2d6QnhF?=
 =?utf-8?B?K0I4anlnQmFKeTJwc2kwY0xtMkEzQ25KWXZPK2RmUWRFNnlQaEJPUnNoRXBv?=
 =?utf-8?B?azhCbGNWV1pqVzdiMlJQZFFYR016dThnS1Vpd1NINzFoa0RKTFpFVDhRWlR1?=
 =?utf-8?B?U3RjQzE3eURmSThFT04yTWhiZFNiaHdrK1FibzN2bVlNSFhVYkxFRHBRMVJX?=
 =?utf-8?B?NHcyUmlNRjVKdHVueVA1dWZnSmdaR3lxNndrVFhWeDU4UDZQOG04dnF5djFX?=
 =?utf-8?B?WksxTUVscnBLcWtZSHUvNXdwL1dKYVJERG5HMm04ajA5MmxuMnZ6SkhQY2hk?=
 =?utf-8?B?MWtsNEp6Ui9UOU9qelRzcEhIdHJZTFRYWDk3ajZUVElUajFOMFdRblI4WHJl?=
 =?utf-8?B?SjVJRitHNkYrZFkxbTA3aVRmMmFJNEtsdEIxYzBlaWRkd0pTRHVhdFJFdmdy?=
 =?utf-8?B?dkVQNllCRklJQlRvWlpPZ0M2R3l2cGRpVGdtOTBqenJtSDg4TjlPbmRvNmpW?=
 =?utf-8?B?RGdzaW9WZDdYc01ncDVnZDRSL1B5VUtJZjhGYkJBMldENmxwTGcxVGdRTHEv?=
 =?utf-8?B?Y28xd2JVaXh4blhhenA2Mk5zYjduZEE2MnRVRndsK1hpTW5nR203VG80TVo4?=
 =?utf-8?B?N1NGOVhReHhGVXRDTVBsTVdQUm1UNkVxbUtUc1hlZklIeGdOZ0RSUU4rR2ZP?=
 =?utf-8?B?bmVCMFIvVDN4bE9lZWE2RFlRNVdIWkF4SHNaTVJJbG9DY1ArMElDSCtCVURY?=
 =?utf-8?B?OFFmMmV2dFJGcXF1M2l6NEZHVTh0dzV2SUlTdmVqYVNNRGR3c1Q5Tjc3SUY4?=
 =?utf-8?B?RWY5Smg0VjI5SHJhUGdSckV4Tk4xcjdhcEhiMkNTdTdwMjVmU0JxbGNKQTZa?=
 =?utf-8?B?c0dyNzhYNlRNSWJ1aU1EeFNlQ1JUeXd0S2hZQTFJWnBzTGFwSUx4U2RYd3A3?=
 =?utf-8?B?a3pPZ1JJVXk1OVhLWnNjVEVzVmR3TDIzZzByMUFDVkhrdkhiTlE0M00wOVJs?=
 =?utf-8?B?aHYrbE9iRWcxWjFueVBQKy8vcU41aGVSelhtRXdQTnRvUHF4T3RndGV4eFB4?=
 =?utf-8?B?bVBSNTFzUDBNY2FQVzRQVjZGL1A5aVhXRHBkeTVHMmdjNzdsbjFKdHIzRlk5?=
 =?utf-8?B?MnBRQmJ5Z3duTTk5SGh4VjVvUk85YVdMalJEWXp2aHN0OCtMSEFxd0tXdXpp?=
 =?utf-8?B?c2JhOGxEVXVzR2RXQkdMaW95ZDRJOFhXOE8rRy9NQkRKTENBY0h6Rkt0SlZh?=
 =?utf-8?B?dE1oamZ6UTB4M2ZPY1lIZS9rTWs3ajZOUklZNkU2NTVsdjcyS2VjcGVkUGpL?=
 =?utf-8?B?azZsTU8rYlBmYjVZUHVhemIrTTRxZDA5Tk9EeHFlTHVqTzQ5SjUxSWlISlVM?=
 =?utf-8?Q?RDnA8JZAfOvpmiejg5bDAY8OJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6d392d-8502-42d7-bd59-08db9ef08081
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 07:06:38.9991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ls2UQECMwdUjmvigZyUmknokZEeyhP/A5uulsxZEs4yoxbvIf4tlNxYkCHY6H/fWMnM+0JuOcNAAuPU+s5czDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6980

On 17.08.2023 02:39, Vikram Garhwal wrote:
> Remove master device from the IOMMU. This will be helpful when removing the
> overlay nodes using dynamic programming during run time.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Since formally required:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

