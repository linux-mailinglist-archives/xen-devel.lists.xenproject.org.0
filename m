Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B96691E9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 09:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476885.739302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFq1-0007tF-4I; Fri, 13 Jan 2023 08:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476885.739302; Fri, 13 Jan 2023 08:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGFq1-0007qo-0U; Fri, 13 Jan 2023 08:55:01 +0000
Received: by outflank-mailman (input) for mailman id 476885;
 Fri, 13 Jan 2023 08:54:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGFpy-0007qi-N7
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 08:54:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f44c7f60-931f-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 09:54:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7433.eurprd04.prod.outlook.com (2603:10a6:102:86::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 08:54:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 08:54:55 +0000
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
X-Inumbo-ID: f44c7f60-931f-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APgihOLz7d2BIjBiXdfJtdCFov3B2rnJnRuQrud99qxbMhWqdaOGwPSshb4V0PFTc4c75kxXJp7TuhbxAbG3W5mm+jBLp+j/ia8I4oFUPYcypkrVrJgVHILyDndUfPax0D5SN4XxJimxUxW/aJo5X2RkTnVhiLEF+hscu+Iq7r8Fr3q5LKeMCBc7uM1ttofjV9ZoMJ7DqU33znxxbwe9xd9RBca2sJCOfeLXnqXuulace/LzP8MGyfOHAFXGOfPi5HLyFFhs7YgY6S4ErnDhoHeWEtoYY5agZU4oBRWiB0OZLwBFXIGOSzNCL+BzTzNxB5MeZygfUSBtlXzpEZDJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWrPUVjoqMFh0FM2rL79u3+EH1x10mLK40Rea1zlylE=;
 b=f9sd+ew0uC7MtfozG3aW+8z1rPgIbAqEbK+jqs+kO6lpUhaMjV4RMcQj0VIFHgNfUavJwDxBgGHZNOcPqFXitX/vT4obPTGtWvYNrl1ucrrv8yuUCmca8Su+4jw+Fq+QgG9gv4C5S4NYCG2GoqbcBdGXHx0vrExTJ6KYeZ1iyTPAAnQaTzBoxYndLoRCh2jOFgkq9+NN1tNJUUDV8xPLfgtqN7fE3SCdee2m3Rwq7mugtmJEtw3eWcnSrrc1tjr0ojkRV7Q2z97t6mqWFSnO7ccS+O8I/cZq1brfDogKv6tkbHSWqXls5JEVtoSDEw2BEA54lyp4HRX7WuEZ97F6Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWrPUVjoqMFh0FM2rL79u3+EH1x10mLK40Rea1zlylE=;
 b=qglbwcK3FHKx3xYvsxL7LAHo46gjAqIarjqaKBbPUhmGz13HtxedBrw5ELzMWzG8vFQaQdi5MYzkR19RJWsyQbaUculie8NgniHlmDl0wboCt7lKjpVSOhBRb27K2GSCANlPAU+E9sfKwm/Q+z3Hmg3qJeNFeXUKOWxY8Z88UrJTIKSD9sjNfOOLQcqU1zul0k1PS5N7WegUvwd+XbBxghoKs/w3dapYs7rO6yZncwZn7jfQOjNRlsE2L2wXtPqskJlRZwy7zptmLOOxxJvz5YqtjZD0OQgU16IN+QWpIXqDeGF9Ph1gRkl+rhuxjeLej5h7y/87OhBxQja8ToZetw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d88834a2-dde3-5438-e5a2-2bdfb25be4c3@suse.com>
Date: Fri, 13 Jan 2023 09:54:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/41] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd909e6-1c63-4322-7a26-08daf543d760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EG5TDp0nGvN6kBFgl/AUcIqUxsgyQiorzee3O8wornYL4CDFaKxzs6CjFO0evfiI8UKY/rqDksiGNxd04PypI7zug91fboqUXPPNpOomHsx7MkjtOoMz2QHA/XNvFk84RMVX/onpZoHf+Jm2A3kC0tkHDUMyhlHful/Llpgd10bTg+Q+YOSi1LEs7KrL5TIKVgzikQFhYKLTVVE9vIuQ1HG2EQLO29V7T4EGhGp2SdgFDic14OxAj4syHdAVkqSvVsqvLYI8PwWWDbIkJh8pJxFW9u6yWiKX3JvNSE6wFrvL/v+dutYc856l8GGWD4WcWbLpEBLvHo0WrPR5ju+4eVjlZshqSFpKRCOHOUxlFhbGT3FflHUkShpSQJb74QMhKjA/WYDlsyyClbWjyjhPGECOfp7e0UMsSr7wP6NXq8YOgrn+4LreConxxlLpjsXohCDUDMvYQMlabc8wFSrwHBB7bvvLHc2xJlr7YA6+8hSwzjJySzW2PwTIOIe8tTzQqhhl7B2zVSQRIBkVziHXnog0sNIwz3MED65qyUwD+ZZNWfhaWEGqGu7VCfMoCh05hvMnxBc+xmXtS3s8OnonNacq2Tb0xh1rn/0O9mZHjuksxI8SmO4mci1DwuA6baVptbbYBvmn4eFM8y0cD1nDrZ8Bzh3GqK0+BbJDtZmv4vGIjO8wqoYm8nHVgpF1DzJAvN4OadCdUSFBkLaSFiv02Oj/x20uZteK03uVDKlWY1gmioP9XkLAaabixGWFXsQQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(376002)(396003)(366004)(346002)(451199015)(6512007)(6486002)(478600001)(6506007)(31686004)(186003)(26005)(66946007)(66476007)(316002)(66556008)(54906003)(2616005)(6916009)(4326008)(8676002)(53546011)(86362001)(38100700002)(8936002)(7416002)(5660300002)(41300700001)(4744005)(31696002)(36756003)(2906002)(17413003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUY2ODl2Y1p5aXRrWUhRZ0wyMm9QZEpSbGx0bVFWQ3Z3RFdIWjZxYzVSZDVY?=
 =?utf-8?B?NnMzTjFXNElWYTBYeXd2Nkl5SE54cmlSVDllSWhKR0dMZFlqY0NZYkxiK3Zo?=
 =?utf-8?B?MWE1cWlDN29DK3JrZzVBQzMvY3lWaTFEQ3ltbmVkUHExUEpzR3FtRmdwMEJh?=
 =?utf-8?B?V0RlczN5RStQd1ZYSGN6L2JBYkMrU2pUQnBTQTRCaGtKQk1mem1yeEo2RmVy?=
 =?utf-8?B?WlF2MUxMM2dGTTBpaDIxUklwcEcyRzVhS3ppTUFmTmxwT3JjaUQ3VUZodEty?=
 =?utf-8?B?OGhRMUZmYnYwZHBGaE41RGFTRjFIakFuc3JGUkVSMTNNaUx4YkNadndmYTNF?=
 =?utf-8?B?N0prUmZTUEFPRVR4SEJRK0lYdEdTaTJxZmlxeUp4WXlxYm9JYTkrVk9VOTRE?=
 =?utf-8?B?RDR1STRFSHcrR2hHT0tma2I4YzlyZU1zaGxWSkpPczdzQXNvN3k0S2s5UzN2?=
 =?utf-8?B?bENGRlJJWXp6dWVZREFDMy9pa3VPSlUyb0NVRXJ2dkY0Z2dRQmVBYVNCNHE4?=
 =?utf-8?B?VW12QlFnK0VaMHlGMUlDRnhmZWhNdWRTUEJFa3NRaVUxWWxBbkQwTTRxbTht?=
 =?utf-8?B?ZjMvc3RYWTd1SG9UVENiWkt0TTNiM1pUVy9peWh2d3QxVlVlRkd3c0VSTUdL?=
 =?utf-8?B?QTRXb2xHTTErNE1UOElTdjM4clN0ckNUWmxSUXk3bTJCYXhoeVVXelVta1pD?=
 =?utf-8?B?QkNheEU1dG90LzAvdnhKTmpGbHRiTkZ2WEVySlVHNys5Z1lVdk00K3FiWFRD?=
 =?utf-8?B?SDdyNFVkd01LdjVQVnp2RG5CbUdvQXEyVWhkV2p3cEZ2c3VmeklsT1RjY0o0?=
 =?utf-8?B?bm9vcndUSFQ1MnRGYU43YWdmcStIeXRYWXZaUHppa0t1QXBibDFLNlQ2R2xG?=
 =?utf-8?B?Y2NvWmM1YUM1VnkrK2ZyVEJpMVZtYzIrM3l0bUE2VE9yZy9icUdhZ0VhS3pa?=
 =?utf-8?B?NVhxVUZQajNHL1Q2V05uaWtEc25kZTVOM1J5clU0bm9LMEQ2QTJyY3RyOG9x?=
 =?utf-8?B?WElRaUdBZFZwZkVyUkljeGI1Yk5sMHFLQXhmZEdiZHYzWE1CdXdtTHN1UDZW?=
 =?utf-8?B?RmZOWFNYbDNKcVdGRHdoSWRjQVFObjZmNHp1WDZhOTNueC8yQlBHSmtTYXVy?=
 =?utf-8?B?czFIaENXN2dwY3kvMWszSXczYnh5VjFzajhtU0Y1TW1KL1FtRGRWLzdhSVhm?=
 =?utf-8?B?Nnd6V3piMWx0NTJMSC9RZFA3UjlhT1QzbFl3WjF2NGVKYjduVERTQW5QN25F?=
 =?utf-8?B?eXdNaXJVUkNFdzM0QnRzd2t5OXJVekwvOUJyN2h4ZWFJSU1ZWTJ3bTlJVUJX?=
 =?utf-8?B?dXJLaDdqQ0ZlZGkyQ0xpSXh0WXJ1ZVVZYVpzNFA1ZzZnNUhEb0JEeklBc3dN?=
 =?utf-8?B?Z2VTZ1JlOUZqZnZ3bnY5WnlpeHJ4WUFUWFRnNFdXV1dOd1NIdGVFZVQ1akxS?=
 =?utf-8?B?WGdBYUlmT0JVWFArZy92b3lYZW9jOXhvREorcmg4Z0p0WXRkMkhOR2Z5RDZv?=
 =?utf-8?B?cWZPb1RyODRJMC9MQzZNbGovQ1dpenJtUTRHcGd2a0wrUWlBaHJMRmV4dEFB?=
 =?utf-8?B?S1hpTnlrTVY2blRoTUZBV0lZMHZWVk93dVgyM1A1R3JTbTAwSEorS0MrTmhQ?=
 =?utf-8?B?RDFpKzZjM216Z2xuOUozQVFvd1A3MlZlZUFOallBRVBHUm0rdFNJUlo4eGhp?=
 =?utf-8?B?OTBrdlFEVmVxLzNNWVVBSUM5YXdVaTlTSEVXa2MxUWJkdGJ5RW9DTTBtdE5W?=
 =?utf-8?B?WXNHTTZjR0F5bTg5OFozNWJMOGFNZGI1QXRaNXl2M3hhMGd1dWt4V3Vnc0FY?=
 =?utf-8?B?blNSQ1V3MTZONTNlZU56bTE0VDBmNHpzdFlMSEFFZWlhQVZjQmtGVk9xem8x?=
 =?utf-8?B?SDdXK3JZeUx5VWZyM3hWL2ZzRkdEVjRsWDExbDFVaG43bHJvVElETVRNak1P?=
 =?utf-8?B?Y09Na0NKbUJnbFVxUDlxRU1PNnNocG1oWTBwUHNwTzkzOTdQc2tIOXlyaDk2?=
 =?utf-8?B?eW84cDJxbm5yWEIvTTJ2Ry9odklBMGhkR3NkNDVOcDkwQ2ZkL216Vlp2TkRH?=
 =?utf-8?B?NWZrc01oa1EvamF0bkdsUFl3YUprZ3pGSWttY1dzeWpOOFduenM1SWR0bzNR?=
 =?utf-8?Q?YMmjp7GfLUKnTCXaHwKU+iMn3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd909e6-1c63-4322-7a26-08daf543d760
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:54:55.2790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kY7JCtVU3qfWQf4FjUFczKz7JBWIiZCcJZYxYolg5QU6C97pnDCh0JSdij5eQlEn/+Cw2XFn1DuB5DuMFmAKHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7433

On 13.01.2023 06:28, Penny Zheng wrote:
>  xen/arch/x86/Kconfig                      |    1 +
>  xen/common/Kconfig                        |    6 +
>  xen/common/Makefile                       |    2 +-
>  xen/include/xen/vmap.h                    |   93 +-

I would like to take a look at these non-Arm changes, but I view it as not
very reasonable to wade through 40 patches just to find those changes. The
titles don't look to help in that either. For such pretty large series,
could you please help non-Arm folks by pointing out in some way where the
non-Arm changes actually are?

Thanks, Jan

