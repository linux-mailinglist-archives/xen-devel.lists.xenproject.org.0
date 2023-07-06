Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C5E749A0E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 12:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559846.875217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMg1-0002Uj-Vv; Thu, 06 Jul 2023 10:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559846.875217; Thu, 06 Jul 2023 10:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMg1-0002SF-Su; Thu, 06 Jul 2023 10:57:33 +0000
Received: by outflank-mailman (input) for mailman id 559846;
 Thu, 06 Jul 2023 10:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHMg0-0002S9-Us
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 10:57:33 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe12::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e784dd7e-1beb-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 12:57:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8238.eurprd04.prod.outlook.com (2603:10a6:102:1bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 10:57:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 10:57:28 +0000
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
X-Inumbo-ID: e784dd7e-1beb-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnlDXOYKZfqgmqctd4+SVKTTlmfbH/zL8xfZRMi2C34C9QI6LsQz75rzw48pFBQUZA9+11+VlFydGoW1Qj7aKeuR34MufOLioce7G3xlO2QeqFTn6EgZ8AyOOs8EQhQcC5d4o5gh92vaPFZjpuIzaTC7yy9KvupkfY9gAfm65rQqAJrJUAwmJN+JB5njRuW/Fd/3+O/haBBlGrEIHE5quKV2R6K5R/Jha0ooNzHPxZcpf+drdlf2/Xymj2E0JDArVSewXYDZN3CAaOl0tkcO3vC+yabK0+wcPfFSVkOav3Zx98RC1SsfnXaRxJRQ6aaxz7AWWFC7D1YF0LuOk2kKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQOYFUOMHuj7uxPP7uf5chHqnNg/cVk5WHpGtOP6fbQ=;
 b=USFSeYSTwOrHxdM4VvL7MgHv9atqeZrr4JQ2zOJFZxUlN70I5Q4wENwEVa6Vo+DHUdFVBcM382yeJiu+brmAQy01UdzyvkHbSjMKIHM59BnX01QqetwBHx2Sj0IbiAclb6QAPOGHiXuN18tWDGvxykfbisfkQn2eKnlPO5eKj/Z7NzCpks1s3gcp3zL3BlTmlMrEqhc1b9N2Ta0MwQCw6Dm4p3Oc9N4lnHlkpzr3iYNkDOrd6LqjMZmDLX7+r6XpmtMDFxwwU6Wstw8dvP8YWffemuGbPN76xL2Wb5k5fowTDdy7ZCrqJBpmaLmId/KD1cTbTevrPcifo4Dchv2S3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQOYFUOMHuj7uxPP7uf5chHqnNg/cVk5WHpGtOP6fbQ=;
 b=Uxr9/DKI7r3psc3iDuWdEHw9nyX8ZpJl6Qoad2VSvxLyk0jBw6qqH/C44pv7Gp9fhEYKPsOeMQiaNajCeHCe6dd08GL4As+u6MH87Uz6Bo+9p7HhY1R/xkVpPHQHgn/qjYs70QE9TGluJUefytNaQKMOVLrftvmJqSoq8wa0TaVDbDdkVg+42puNLKJvmBmkSkIVeUDjwCSlVZCooEVckFXW6FzrQEmEJuo9k8XUUxIuU+0HPJuxllkpDr+X1ndJoufSJZFpskM4FjqgRKEnWvOWugbXSLtzvXkozFQxQ8UO6oBL5M+uedBNjC2FzuDx4ftutQshW5e9N0cVr+FuEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9e519164-24ff-2362-1ffa-d19649d068c6@suse.com>
Date: Thu, 6 Jul 2023 12:57:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 08/13] libs/guest: introduce support for setting guest
 MSRs
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20230616131019.11476-1-roger.pau@citrix.com>
 <20230616131019.11476-9-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230616131019.11476-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1a5dcf-8e17-45ad-bdb5-08db7e0fc9ad
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lr0yl/gCNi6qSHgsPeXviwYpT/ssr4px6t+4tT07IlczhbZgJezqVoESToTDYoq8U1+O89JAdk3CH/wojoxgBA7/g73hRl87JVj7kwhT/eVW1TmRS4ueT9ufLv/GMFVCwoHRG2Q3Recj4CTlAlVOH/1jR95MoK5C4mjKas127lP9xkAxCL+ApWVYoq6Up1SUB+/gPD13066upz1pgEBnNl8MsEkSCenzDVBhmzC70Ze9WxQyjN5KNFxAiBJMmbh4G8qchhU9aTBpjVnUncdmHDGjrwXvBp0Vm0q4vyxiT5DdBrehOROS7DGNP7VR74tIy0vNyb1h//8C5/Ep5yfiSHyUOCYJVvrKQw82H5rtYn1Fe5pepPLJaSp0GEHtQTsAJRD/l2tR6uqeG0zsYNRQuHISAuRj8fPhXP8z+JBQaKTqPFChIrLF7nWSN1dwFartKYOEFjg6JjQ2eEOT+CjYmtGFgpXz4PREcik2rald5N6G80FmgLH7c8BU8m9NSXcq9a4RJqpFT+KjxkSzigMQep+rLdmHKq7ufM1DD/RkAZwhl2vXsNdfHScUSXHCFHIKJ3RKExWXnC5uwmPXLnXqZd2Nf4mPA4JCvMw9vMKTRioQk3nWoSk1Ivtl/gj+NvEBYyJgI+7cwAD/RsPykBeXxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199021)(31686004)(66556008)(4326008)(6916009)(66946007)(66476007)(54906003)(478600001)(186003)(26005)(31696002)(86362001)(2616005)(6506007)(53546011)(5660300002)(36756003)(8936002)(8676002)(38100700002)(6666004)(316002)(6486002)(2906002)(41300700001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGQzVGRpZ0hQNHFUeXRSU3U1dWk0bFRrRHlOTTVpZ00zWEVRVnFiN2YyNURn?=
 =?utf-8?B?VkdFQUZiUitrTHhld1lUWjJpSFF6RmNTb1k0V01mQkFIa1BGeDY3MUt2d3ho?=
 =?utf-8?B?VDZtYmVFVTdtYXNCS29jbkNWUlNGcS9QZEdOTDhmYUFVQWxpREtOMnZlbFRE?=
 =?utf-8?B?TGUwZ01VWFc0MHZmVFZ4Y2I5TUgvVWJPR2RzZ0p6bmJlbVIzS0pPMXpHWTBy?=
 =?utf-8?B?QjdpRlBKZ0FPQ09ueWNZczErdElQVTFZWktETitCT0dpMWZkNFFzWHhGSkp0?=
 =?utf-8?B?bDMrVWRtUGRDUDI1dFlBbzVqNyt1WFJrUkdRdjYyaDlBT3luL0NOREZOaWo5?=
 =?utf-8?B?UmlUZnlJL1hZVXVWR2RnVHc0VHNHVHlnS2JOSlJ1K0pxQUl4T2dvcGVmVWJW?=
 =?utf-8?B?RWIzTHdFMlVqRlBlUVlUdUtVa29CbVM4WC85bUU0SEtNNjlRYUF4YWF0SWt5?=
 =?utf-8?B?Y0hMUWIvTXNGditNbU03UC9tVFptOWU4RkpZMFV6SDk5RFkvZWhsZG5JeHNR?=
 =?utf-8?B?Z21PSWtibDBKUjNJT3E1cVJoTzBsMmhuczA1REZad2pkbFNlektXYW9penNx?=
 =?utf-8?B?YVVFbVdybTVzQ2htRmhzWEJCYlZOcHJTTUhSbVEwajRKZE8zMUVXZ1Q5bGM3?=
 =?utf-8?B?Y3Z5UnRaeWhibGY2RHhIU0RCYW8zcjdYeVlzaTNKUWNjSi9JMTJJbjQzbnM4?=
 =?utf-8?B?MkhTTjQyOGVRa1F4SGlJQVNIcGNHNzBuNVRQbHRtUkdzMzNFbG5CSEpvTmto?=
 =?utf-8?B?YjMvdk1KNk9IczFRTTd6enI5ZlVUa2ZOR1Y4bWRLY0lQYWx3L3hMSllpQTh0?=
 =?utf-8?B?SlhjcUxCb2JxRlpMNnZSOXU4TUM0M3NNVzJ6dTlXNDVsUjRaRS9qcVp1WTRv?=
 =?utf-8?B?ZTc2aEJWbWRyN2hoTGZqNzVsRnVzdmZtR0lZY1NRT2Z4SUMvMUR3ekdDSzFx?=
 =?utf-8?B?bW4yODM4L1gyM3A0WVdqWTd3S25vNDdodDVuT1Vza1BpRkc1KzBmc0p6dWNz?=
 =?utf-8?B?U3Awak1yTmVOVHAyTmg4TjVVc2VPSGcwdndnandtUXd2UlZaVzdhdGFqQ0FK?=
 =?utf-8?B?TjR0aXd6Wm9RNG83MEo3RW84aFBmelhKUHZFWk9zNzYrNlJHeWZnb0VubVhW?=
 =?utf-8?B?cVl1aEd2S0NHMzBaeCtNWUh5VEVFYndDSU5NQk4rNHhJWGtWSm9ZTzVZT2hS?=
 =?utf-8?B?S29VQjdTQk9VT3dmWHdidTh0Zjc5aXFNSGhFSDVkRHQ5c0ZGUFdlNUdza1hu?=
 =?utf-8?B?cE55VUpieVVYUURONkUzTEJyNUJUejJqNDEvY1ZXMXU5S3poUmlPZHBnbVBO?=
 =?utf-8?B?bEkxR0FaWWRtYUNZOWdsTldkMGdjMTJiRVgwUkFvUmdTOXJZSm4za0UzOHhh?=
 =?utf-8?B?MlEvNmxaTElLWEgvQUpTc0RkN0NCWFB1Zml4T09adlRYbU5XV0h5MmtXaHZV?=
 =?utf-8?B?cjNGYTVCR1AyekhBenFnR05QK3NUbGo2b3grRG13eFM1ajJTWFBXUVo4T1Uy?=
 =?utf-8?B?cHhVOHhRZmlYUWl4cmU2ZFY1bkR5SW1ZdXgxOTY3aWtZZnE2K0NKVytMc1Bn?=
 =?utf-8?B?OHhIVk9MZkxhdXdQanZqc2dTbmdrdmRheUJiWGV3aUdyV0hnQTFxY29SYjhN?=
 =?utf-8?B?RjhVeTRCbzkxZFFlWTZwYXdKWFY4OHJBcjJKNnN4aGR0YWRLbHNtelJWN2do?=
 =?utf-8?B?T3VVc0lUR1BncEozRVF3cjE2WExOeGszdXBteFc1bzUvYXJ0bzJDcUVuS3Jy?=
 =?utf-8?B?NzROeUFvVS8velN1OFd0UGY1VGNDeGRmd0gxdEt4TVQvR0l5TGFXNEpZUGdh?=
 =?utf-8?B?RHRaRGlrelNKOVN1UmtKU21TcncvR2ZSWmJLQjJXWTVHUXVvbXB1L1ZZa1FH?=
 =?utf-8?B?ZUoxckpFOUppOTNyd01KUU1hVTk3VGgrWjVvYVlsTXNjTE9jU21YYVJIWEtt?=
 =?utf-8?B?cmZjSGUvb0tEMnJJN0pPTENxUnl4SlJmYWV0UFFmM1ZTV3lCaHdreTFFaWNr?=
 =?utf-8?B?VVlERUlqcGVITDV5K2ZQSU9Eb3YwKzkxbXg0OFpDU1dHdDIxRE42dWhiTksv?=
 =?utf-8?B?bUVvWXVoM3Nla3U3dGpzeUh4d1RDSHgyWHJpamtIdnpsVlFmb24wK2dYenp2?=
 =?utf-8?Q?6r3nCHUp7VkRA5GcOwTxouUNh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1a5dcf-8e17-45ad-bdb5-08db7e0fc9ad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 10:57:27.9378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xClvzsy1SZu5es7Ys1D9cK6cy0mW78XU1w7Pp8bK8n/J2vyVniwK6bBNw33eV+4k1+XXU95ZIK6g1JiE9cDWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8238

On 16.06.2023 15:10, Roger Pau Monne wrote:
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -331,10 +331,74 @@ int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
>      return 0;
>  }
>  
> +int xc_cpu_policy_apply_msr(xc_interface *xch, xc_cpu_policy_t *policy,
> +                            const struct xc_msr *msr,
> +                            const xc_cpu_policy_t *host)
> +{
> +    for ( ; msr->index != XC_MSR_INPUT_UNUSED; ++msr )
> +    {
> +        xen_msr_entry_t cur_msr, host_msr;
> +        int rc;
> +
> +        rc = xc_cpu_policy_get_msr(xch, policy, msr->index, &cur_msr);
> +        if ( rc )
> +        {
> +            ERROR("Failed to get current MSR %#x", msr->index);
> +            return rc;
> +        }
> +        rc = xc_cpu_policy_get_msr(xch, host, msr->index, &host_msr);
> +        if ( rc )
> +        {
> +            ERROR("Failed to get host policy MSR %#x", msr->index);
> +            return rc;
> +        }
> +
> +        for ( unsigned int i = 0; i < ARRAY_SIZE(msr->policy) - 1; i++ )

While correct, the "- 1" struck me as odd. Could we deviate a little from
the CPUID side and permit an early nul in the string, implying all 'x' in
subsequent slots? Then you could drop the -1 here and simply bail from the
loop when finding a nul char.

Jan

