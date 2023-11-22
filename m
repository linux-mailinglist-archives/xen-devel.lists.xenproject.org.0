Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 455287F4010
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:28:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638509.995106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iaP-0007Sc-SH; Wed, 22 Nov 2023 08:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638509.995106; Wed, 22 Nov 2023 08:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iaP-0007PR-Oo; Wed, 22 Nov 2023 08:27:53 +0000
Received: by outflank-mailman (input) for mailman id 638509;
 Wed, 22 Nov 2023 08:27:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5iaO-0007PL-9i
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:27:52 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe02::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06358579-8911-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 09:27:51 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7198.eurprd04.prod.outlook.com (2603:10a6:800:126::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 08:27:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 08:27:46 +0000
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
X-Inumbo-ID: 06358579-8911-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EodwYK6x7L2dVYbhy9h157Hb61cpRQJUJ5WiUhh5T+8gLoBLlx8xN7Aj5ofOb0yZA+Bgcs6zz8plzE5zIFbhyXRKDThJOZLcnoKjGplErRzvNgo8QYdIy/JKIgd40vRWU25hkaeuD0u+GHpoSL28hlvJ9koAnTOfMdseNeLgOOIqzMp7AmyqNQGmGmWXcFxTK639w0hDD1kZvUsbafdWornjWs7pmCzmWJw99QnKBEEwtBbK/4Pk05qQes3S3OG0ecaHG7rePpJCj5k0vl49AVofaU73wBVs2CDcu96PrCJ8EedMp8at1RnTePdA8z9UunNS5zXgHuxPILwVS3YOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3pwoEl2bKXKiKu/E6NEdgXX6cggIDZiHIpa0Y4XAaM=;
 b=b+G9rdj69AWLlHoK8E7npbCfJ6lHQhf2Wfz7PHwsIrwPWgmfu9DqbmSP14eRSkEXA2LK6LZ43wbn6LSzBnk9j61rEIO0BqqX4qLbBgdDR4zw49hyWxL/8deH21ECdHEwhMJvOEjdpFIDuQXbgQfSPhkaYQkqdbSUSaHNyaFGtYasig3tWVPEEjk6yeCFQXvcRJQzyWyLbVlWBVmGo+2jUaSa4KXK8mlDaZqnNZK870KKM+J0MOKnDI43id6d+7T+hhvWs23S1kiJwsFeChltI2tlJkdQwm7tAyhBEM0xLMi7vnJWHoQ97X2tmDCHXW+aVAUS7mKU8cGlBHuLPerYFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3pwoEl2bKXKiKu/E6NEdgXX6cggIDZiHIpa0Y4XAaM=;
 b=tW1/AS0nbsTfm64Ga9prswsQ/YzK/TQ2coTKCfX079Wsn4uub/HOaRk/0dD9dT4bx+WrB3/T0BJxq/TlLeSFsfpKakqEV8yU6qQsU9dkMm7haa59S51nFQPrOVd7sn2BhXSp0qHki4IStZJkhD2MXBPq7kqquAXMTU6LtwUA2dhfv6Er2UpCQdP9zoRPNiy+C2K4nWZ7njp5ACgBsNbacgP0LL1sydaOwe972TKe2J6/mecMWRIyByiKgoIwu/dkYfqNz1N6gf7SCxQ5zpnFCx254xQGEOf7QO8pDB3Bu26Mhc38GwMBfXTTASsetH1kAJ9oa26FlMFnyki/Ov/3nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2875c4c-c099-4349-97af-255c6a76c1e2@suse.com>
Date: Wed, 22 Nov 2023 09:27:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] VMX: don't run with CR4.VMXE set when VMX could not
 be enabled
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <d6a8ce0e-fcd9-4391-83c1-d9f709ada3f1@suse.com>
 <ZVzpJ8Ldu3jAH2bu@macbook.local>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ZVzpJ8Ldu3jAH2bu@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0421.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9e1189-bce1-4703-371a-08dbeb34e7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	08r/VwDMc+O9V3EoyrmDztHcRs4Fsl3zHt+Jx/p4q/vj7Wf2X8CspsyDHwzFLrCz7RKo3N3iIjzJLSD3njFSuIyvA1NK90o51l5KFPxtGKvPj6920DVMieyoJ0VuHlIlKVtdA29R8tkqd0Td3ZH33S1x61p0Rg64ADuoOiB+mtQHOHBSoCDQbuB8a509sd6sx3mYXmiq/0Gmna0BWYR7l9+tPYyHka7D8wYuPtcBTSIRhwFwhHnPUzmKlC5ibI8SOGw/aQUZMHf+5SkbD91RGyd4QthAAg9ILoM+OHz0eMOfLKu9qOjgG9RP/vm02+lHWjdvUHEwBRwSiAtZvzWnLZlB5mk+4ehcqiibA1AA54e8+gx4R1tF0eGuly/5LaxKPmlqCzUm1dvg9zqpxJ4/bWtydUzBP7WUVknXZmzDCdRFg0PMTCtggVxb7lNft6kMYOobSEJTtye3LIcKCdhtwuno/6Fm2nPSt9TpFc8ojP0dPQWpwCJXe6eKVnVON1Qc8Jz8PfXAUvEe9YF9/IDM+/LuhO1tv8LNxhmmNf8sCLqu6a5ECqo9sxP+tWAIYtABAPz428NwtS8sGuCxJ1b9ddguwoRieKtX8yEUd6IqTFu12WR3y/jh/SzAqAE0RsGmUC6Xz4jZ33uUNB/Fch2L4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(366004)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(5660300002)(2616005)(478600001)(6506007)(53546011)(8936002)(8676002)(4326008)(54906003)(66476007)(6916009)(66556008)(66946007)(316002)(26005)(38100700002)(31696002)(4744005)(2906002)(6486002)(31686004)(86362001)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzdYSjBRaHBUVHljUEpqYS80dU0yYzcyNVRQNzRjV2RjNnp6YytuaFpNSXBN?=
 =?utf-8?B?czlNbEZtWFVNUHVJalorZjkwMnlSUFg4bUlmRHpaNjJTUTRPQ3JSWURvVHdL?=
 =?utf-8?B?T2dDSGhhL1kwb1JxbG1Ka2YzV3h2WlVEWEpGVFdORk1lNXlBWUQ5ckVua2xS?=
 =?utf-8?B?a1Ftd1h3NUJ6eGh5RHJCYUZYQk9LV3ZVcC9DN0dXalJVQW9HeS85NTZseEx6?=
 =?utf-8?B?SVBiMWRMS2MwbXFEWEhGREt2VUNmNHJXZ3l1cHNRMWUrTXpkbGR0UkpDUGgz?=
 =?utf-8?B?ZHNyL1g1QlVPazNoVDY1SUlNQ1crOEc3SmJzeEJKRkJGaG9vZ25HVUVpZjNM?=
 =?utf-8?B?WEJTci9YSlIza3hjRUk3Q3VtbUFlQmZWbEJjdTQ5dW40dTRZR1RUK2RMOVpS?=
 =?utf-8?B?UGs3cUlkUWNwYUNCSTc1Wmd0MlpyMGVGRnFmem5tVFU3OHhBL2tWcFN5RTVs?=
 =?utf-8?B?bzdZajM2OGpCUlMvZ3dLbStPNGhDNVNGR0lXZlNvcUh3eEowS3VFN2FtcWpS?=
 =?utf-8?B?NnNVT01xa2RwK2M4OGhkMjJiQ3dJcDVGZEJ6OGo1bTNaaEN0QWprYVprZlYw?=
 =?utf-8?B?aVVsajBibzVubnZubWJ3bjR2ayt1TGZGQlk0QmxaUWZVNjI0YlUvQ3pFK1B6?=
 =?utf-8?B?UUdoRXZHU08rSEFMcllPSUZBUXZybnZialVmN3NSeU55Syt4UVJ3UzJ2dCtW?=
 =?utf-8?B?eVUwOS8zTVdmSW1hb0hwMVFETGxRV0ZpcmFmSzE0T2IxYU5xL3J4NU9oUXQz?=
 =?utf-8?B?bWphaFhwRzltb3BxU1QyTFRMQ2ZjbnlyOGNhb25IQzBYbmZGREhVcWwwWEEv?=
 =?utf-8?B?SVR1VmcwZmxOWGMweWhjTUlFUzYxcUM3cDNsZHByMWZKaElReVBKSE03MFF2?=
 =?utf-8?B?N1hLd1lpTGxRYituQXBrN0l4ZlJjZGtjcjZWNjdQWVJnODA5VS9yOW96RjFE?=
 =?utf-8?B?dFJ1aVNwSU1qQ3BNSC9TU1U0SVFnTHNWMVJEN3g3RWhUM0FvY2NRd0NnZlgy?=
 =?utf-8?B?S1dibDdlMWJUdndJVEFaNzRGSFRvOFUvV21xZUg4L29SMVBiakdYV01pOG9v?=
 =?utf-8?B?cE5ZdmNNRWVWK0pOVG1rdVJVazJSTmgvTFNRNUxCMVV2U1VkSGwvR2c3VUlT?=
 =?utf-8?B?bC8vNWdabEE2eDJsK25DYnZBN2JmQWRNOEFOeXQ0K3R0VTFxdGNlZXlkQllm?=
 =?utf-8?B?ZzVNQUd0TGc2TGo2R3JITHdnYjNRazAzcC84aFQxaXJtTS9uNHlSZmVtVFVR?=
 =?utf-8?B?am53cE5DL0s3Uy80bTVvdXlpMDVpaWt6NXBXVCsvdElZV1F0VVp2YU5tMC9F?=
 =?utf-8?B?dWQyMWFueGpEVExhaDRFenB3YU1wT09LVExnbk5xemoyNnpueXhFOTNIbjRv?=
 =?utf-8?B?eGFPdDBJdlg1ZUJ0RHhXNXhzWTAvU2hLNlI0UXIxUzluWFU4TEFxcndZeitJ?=
 =?utf-8?B?cVlJT2hrYzloVTkwcFpwTHZORi9hakRROTR1blZwRURoWEVZV3dTWFpvQm1w?=
 =?utf-8?B?QTdxeWdrU1NQRm4wREZuTkk5TjR6VEMvZ3BUa0txWlk3NTJ5TVEzcVZVMi82?=
 =?utf-8?B?eWFyWkkwakR4YmFJcFJkTVlUQ1hocVF1UzR3VkViVnZaQndFZGZHbUltU2Rt?=
 =?utf-8?B?bVY3K3VZM0lNTXRIemJReDBhYzA3aDdWc3hhdVFCWlY1NXhTSm1pS0dRTGha?=
 =?utf-8?B?a1JRV2xhYzk5aXJ4a2s2b1VKN3NjVzN4RExFUXFIZWxFdnIzcmY4Vzk2SERR?=
 =?utf-8?B?NnRVNUR4QzZWMGdpVUtOZWM1VWZsR21Od1czL0w3ZUx1dUxXMVcwZE52WUU5?=
 =?utf-8?B?aCtBWll0cWszRFp2eXlPNnBLRVdoa0hIM2FodnQ3U2VjS0lUYmp2MDd3ekNY?=
 =?utf-8?B?TGNveWdhaURlaUY2K0VRNnRyM0lTWUtzU0tVOTdLbjVlV01ZRzRGS1dXQ1hB?=
 =?utf-8?B?NWRiT2ozVnV1K3QzUzhPWEtKN3FjTW5zRjMreHZRRk1pSkhyck0zVEJtQnBu?=
 =?utf-8?B?Y28wUTdmdVNralZ4VjE1Zk85VG93NDFEWWVyVFpkdTlLNTFtNHVsZWR2U1pl?=
 =?utf-8?B?UUxFYW9KM09zbnB0RlRjY0JGZjg3cnpJR3dUM2R5ODdPbVdacDZoNjc5QUpy?=
 =?utf-8?Q?sViIPOKfMsqd+9iDCjetgTGrR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9e1189-bce1-4703-371a-08dbeb34e7f4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:27:46.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJCMwU56LzHLsJ7/UKZwdY7K44kEMByxTNqI8niY+UzFxJoZVeKat+nbo+p9u5EavBZISl/TicpSW0KcOYteQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7198

On 21.11.2023 18:30, Roger Pau Monné wrote:
> On Thu, Nov 16, 2023 at 02:32:07PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2959,7 +2959,7 @@ static bool __init has_if_pschange_mc(vo
>>  
>>  const struct hvm_function_table * __init start_vmx(void)
>>  {
>> -    set_in_cr4(X86_CR4_VMXE);
>> +    write_cr4(read_cr4() | X86_CR4_VMXE);
>>  
>>      if ( vmx_vmcs_init() )
>>      {
>> @@ -2967,6 +2967,9 @@ const struct hvm_function_table * __init
>>          return NULL;
> 
> Do we want to also clear VMXE from CR4 here?

Yes, definitely. That was the point of the patch (as far as the BSP is
concerned); I clearly meant to have that there, but then didn't put it
there.

Jan

