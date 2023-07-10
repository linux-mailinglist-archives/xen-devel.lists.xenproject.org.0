Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C9274D40A
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 12:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561177.877558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIoZG-00012b-Up; Mon, 10 Jul 2023 10:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561177.877558; Mon, 10 Jul 2023 10:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIoZG-0000zy-Rc; Mon, 10 Jul 2023 10:56:34 +0000
Received: by outflank-mailman (input) for mailman id 561177;
 Mon, 10 Jul 2023 10:56:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIoZF-0000zs-BT
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 10:56:33 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d81f9b0-1f10-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 12:56:31 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAWPR04MB9862.eurprd04.prod.outlook.com (2603:10a6:102:391::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 10:56:29 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 10:56:28 +0000
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
X-Inumbo-ID: 6d81f9b0-1f10-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTdWwhYKxUi7Kt2PSn9XSuulNe8g+yRwlnJIRK/CsKdNs0b+wLzS514TH2u7zYfZbNYthdND1j6Gkc3lyezka2af+2f7YlFm/Hx5Tv99IhV5HMs8Y558yHmbB8gO45SoeRKFGzoHaXpgd28EVLYHyewiCH9lR9yjgISJiZzRed5eokF4Qc8Nqzqx2n3ntsFYyBv/1u6O8SMosG5pFQGLYzyTxGv7TFbqA+WiRbxZcaKEMEJFC4g1J/zNlnc9YLCt6XC4yVg/ztegrPT1wuuqDcD1RKAdm0Wt4hoLUUkddfCLH7mZHFEBBGtCySND3Wd+ndbTJNCSXu3cLsvdYtjJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQvb+1kLVWdEgkiCAJ3I7xIPXIljQ4Ub1kVaTTH+OFA=;
 b=ZP4YLxdWQ3qwBn8/C04OpSVSeNRaS1PIPNehOyq7ByVcGaslGkqgmUzjKRIkVWMlfaIUh1rQC2DrELSF/2PcoVXpxAeEkuBYB/LOLLEZokbMGAwCBI9hT2ncCpnh5qxCk+RKMVBPEv33XhAtTMSfGOZdBa+Ibv7MSvS4oZQwtbdmZAwIJv/93L58rayZ+bRIsh1GMxdE3VkpyIaXmshNcrm2zaTFOGX69Di9zJ90rVqY9JU9ZTFyqATwB5Q60iRKWbKMLiPhrI6LoOcW+rva3DYAmMJp6Jy1Y8oecCmnhMrmJRRukYfPtvX0oSWnCeN9t06r3yXMVKgUvoRtD7RhDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQvb+1kLVWdEgkiCAJ3I7xIPXIljQ4Ub1kVaTTH+OFA=;
 b=Np7W4cdg41H0JjKylhNqx+XpPJh5JWvLtROspEpWB52HJfTcw4BfEZ3o+RJ1etsMYhTQSIPnz+jMAekvPILuG+joVxh+MyjCjxBZLTrXWRK26WxN5OGQvADHGQWoNmHWtGbLC+sQA5iPt/QEzYIOJRIrQQfJj4wnn788cv4lPmGoR4K1VhOKac/MNG0FuOMvdlS6VCAlOP+T/KlDRyaq/vma8UcPki+a/OTHOqFuHF/67raHXLXH9LnF2VCA6uHuMM0vfek771PnjcXKgqI4cRJqe6t6BuL7/NoBBAOrWZPgheJ5OtTmdUMlWVckvCiVN6/udZ3jqu2cFqoSxyBPlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <92d16012-ff9f-693b-07c6-d45fe07a00a0@suse.com>
Date: Mon, 10 Jul 2023 12:56:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] x86/ioapic: sanitize IO-APIC pins before enabling the
 local APIC
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230707095338.44244-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230707095338.44244-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAWPR04MB9862:EE_
X-MS-Office365-Filtering-Correlation-Id: 562f8d13-4a25-4a23-8053-08db8134501a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	px4w/gLpu33SQW1oq4Qs04BVaKx+FnhzkFF6lcY/6WpQhLdgTGeoGzibHSKN2chnbqLPymti7sD9sLSRWalLvNdwgofzsJmOerYHgXeR73DixbLtj8oqcXIph27TweIAfKXBvf0E20lAKJ/CMdfwOsfpxXBmjxQNAlQao4xBpxZn/1r9AKSC7RGF3mpxqC4ehAl6WYpjx5jBMUm8Vqyc5b23I1bkhBigumWIMESiO3wkgqwAoqgOcUBhnCxyBqlHXOQfddWM1/MkYyWfuFbeKOf7wQOXfxqtV5thN8ErjJJyTLmub79QZWGQvgfctS/EpUejAtiT7MUhJTL0vPhnLLfB7oXxbltHlgHhMV3tWwmijOILFzHTsBqszXaXboe77S+vJOdGPydGZlrkbbLIRv0cvlQQCcq9tgEc2uJ1Od+Ti9Mcb8Xg0DPsiFTBHqbzN2lmjEcDdA8k8vnX995P6MbuNEFe2plGbdHAU26gBq/+eQ9cf82/oWOijA6zJ7M1zXXTZeu3DIbcTGc7CpC0rYjgkp381OmrikqZSYF3snLiM59cS1d5QUiXHoE78pXgHaqLHRcBVIKwOZdru+DCh6XTcxVBxw5Gnuu4HKH0I0veuxjZfM7nB/ujVGx8do5TnK2DbdfwdKuzUEk7Bhv1yA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(6486002)(478600001)(54906003)(6506007)(26005)(53546011)(186003)(6512007)(66946007)(2906002)(66476007)(41300700001)(6916009)(4326008)(316002)(5660300002)(66556008)(8936002)(8676002)(38100700002)(2616005)(86362001)(31696002)(36756003)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bi9SQVVSbmRLNWJBWmMzYzRPZFJ0dTRVRXJqSWlCRk93dlQwcjkva2UyZ0V1?=
 =?utf-8?B?bjRrcGtiT1FpTUlrU3BXZ0lzeXlVTTM5S3J5VnpWKzZnaVdGZWphU09ZT2wr?=
 =?utf-8?B?eXczeFNxNFY3KzRDSTdtSDkwcDJwamZQM2lBYlJrOGpxM2tWamZqM1R0cXpT?=
 =?utf-8?B?OGREbytLZ3d2anM5T0ZqQ0tseWVYNkdGSC9teEFUU05KQzJ2bVNETmt2K0ZB?=
 =?utf-8?B?T08vZ25CTVFGWFVvcGU4cnYrWWJnOXp4NXVmN2RmU0poaGlISE0yeTRyb0s0?=
 =?utf-8?B?NXFJcWF3RlRPdzhUcnMzZ0lRcXNFcmE1SllZVFdnejFsMFkrMHdyMW1NZ0JZ?=
 =?utf-8?B?S0loVU5mZ2ZhanowK0ZadmI3cXdzTko4cno3bmlmc0FYekhNU0o5QXFYbTNR?=
 =?utf-8?B?U2xtY2gzdi9SZDBlMkR0SFRxM0RwSlRmMWg1amJ3NnJyVS9xQXZEODd0cE9Y?=
 =?utf-8?B?WEM3c1VGRnZFbE00cWNYUjd1ZktrWGQ1azVQTVJVQUNNRzlid3hGN0RCUEpm?=
 =?utf-8?B?R3lOQ2s2UWk5R0hDazRPb1AvcXBxcjRGVlBUNXo1cVAxOFdwR3R4M2g0ZmhT?=
 =?utf-8?B?c2xpMzN0Z1FKVHowbmw3OFFWT3B0SzdVbGIxdmJ1c2lLQThCREZ1T0hKcHlV?=
 =?utf-8?B?N1hJRzNOa0E1UFhYc2JUTGxtM01TNi9zNG5qZzZueURyOTArZ2g2aWN0R3lI?=
 =?utf-8?B?ZTB0SnpjMWRLWG1SaUc2V2xEem5OZEdTRytYbG9jSUZlbWtOTE1JQ09NQktm?=
 =?utf-8?B?V0ZpMi83MXBYMWRoTTJsYVFkWW1VMTczcGJCZ0VIYUZtQW9hYXdxQTV2Mllo?=
 =?utf-8?B?MndFNVFJa3JXcmk1YjNMZlNyR0JkTFJMdUhoOUZXWURpemlMK3EycHNZQ0hn?=
 =?utf-8?B?dXBCUU5UQnBvZXI1Zm4rNzY1TXY4NTA5ZEU4eGk4UzBhWVFiMldqVkJXcXpB?=
 =?utf-8?B?N2l5bzBvS0tVVXc5ZU5pSUhscmZiWlh6WEFYMUw0TXlNRnU4SHFNVTJBRWZD?=
 =?utf-8?B?L0JqTGEramJ1cDROV1dpYTR5YVBPMEhTbndmRUwvVXFPczFvNUcvVi9vWGhP?=
 =?utf-8?B?U3lMWHhSUnJRc0NObkc1eEVaK09Lb05TQUROT3pxVHFVQnNlUUJlSU5ET2o2?=
 =?utf-8?B?M094UldSMDlBSWJzQjVGV3VGclo4NXJ5eFhQaFBmL05GV3JDTXJWK2NiN3Bk?=
 =?utf-8?B?SDJxS0hJTUdSRlJ2NFlLVDRyNlBGYVVKTjd2UFhWRmlMRzMxYUZ4S3pRbG03?=
 =?utf-8?B?RjR3Nlh6eEJIVEJ2OGxzU3A5K0UrNjlVanhZUmRocXE3MFdvR05CTFVvaFpY?=
 =?utf-8?B?M3Z6M1A5S2ZUc0Vpa2tDSG9EMXNJaS9DZHB6OXQ0UFNWNXh6dytncFhwTlpK?=
 =?utf-8?B?Q2xyUCt2Uitkc2QyM1AvcWw3MlNJY0tGTjhxa2lZQnJqdFl6VEJtZVRMWlV1?=
 =?utf-8?B?ZlYzaWhEeDRsNU5kWHA4SUZvWVpuc1VrZ2QrNHF3cWJlTkdDajlMWjlFZG1B?=
 =?utf-8?B?dkNxN1B2OFI5T3NrekxMQ3pPbTRmZm1kTE5FRnJaV2ZZbFZ6ZGdqQXZvMkZF?=
 =?utf-8?B?RTN3U3o3NVFUREZXcWw3QWwzQVhMbWlZaXAwOTFsWHl6bFl6TWZxeVJpZmxZ?=
 =?utf-8?B?Qk8vcGRiMWM4ZDFTSUg0RGdJTUxZa1FacEhtWXFiQUhBeVhTVFJ2YitpOTZw?=
 =?utf-8?B?dHlCcU1OZ0xSbFA3ZkJRRWQ0ZlQzL3pxdTJYcDlYWVZnMVRUcHJxcFN6TU11?=
 =?utf-8?B?R0RHWHlxcGMyRVBiOWFtZ0xWL0poWG1uYVJ0UEd3YWFHSCtRZ1g5NXgxUC9o?=
 =?utf-8?B?WitmRHZoaDlBTVN0am82UzIxQ1BOakJLbm9nV3M3SWhnTGpkMXVhSU9EOTl6?=
 =?utf-8?B?T1lCSTFJTENETGZoNTR6M3lSeTJPcmRXOHJzK1BqVXJld1R0ZnNiOCtSZ0tw?=
 =?utf-8?B?UGt2SmZ2aTBpYjg5NUN3Z3prTjBNTmhRd28yR0FFT09qcVh0Nm1maGtpa0M3?=
 =?utf-8?B?dkNLbCtseG9UUFoxV3NyREZjZjhFd2NubUNtelRqYjVtbk5IUWR3MTJUS2NC?=
 =?utf-8?B?WkRxM2UvNWx2SkF4TUZBZVFycDRHbXduaFpLMjZucW4yWjYreEk3NHg0RGd4?=
 =?utf-8?Q?SEIlPKAZmr5MUeGM0x6xKNyW1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562f8d13-4a25-4a23-8053-08db8134501a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 10:56:28.6526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfqD06iCljxoN/gR60etM/ihj+zppE9ayit5khO+Xr+I34ELvTvcGYKDdt4TlwnPCPSi2yqYqueNHqXlkg7pyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9862

On 07.07.2023 11:53, Roger Pau Monne wrote:
> The current logic to init the local APIC and the IO-APIC does init the
> former first before doing any kind of sanitation on the IO-APIC pin
> configuration.  It's already noted on enable_IO_APIC() that Xen
> shouldn't trust the IO-APIC being empty at bootup.
> 
> At XenServer we have a system where the IO-APIC 0 is handed to Xen
> with pin 0 unmasked, set to Fixed delivery mode, edge triggered and
> with a vector of 0 (all fields of the RTE are zeroed).  Once the local
> APIC is enabled periodic injections from such pin cause a storm of
> errors:
> 
> APIC error on CPU0: 00(40), Received illegal vector
> APIC error on CPU0: 40(40), Received illegal vector
> APIC error on CPU0: 40(40), Received illegal vector
> APIC error on CPU0: 40(40), Received illegal vector
> APIC error on CPU0: 40(40), Received illegal vector
> APIC error on CPU0: 40(40), Received illegal vector
> 
> That prevents Xen from booting.

And I expect no RTE is in ExtInt mode, so one might conclude that
firmware meant to set up RTE 0 that way. Mainly as a remark, albeit
of course there's then the question whether to change the RTE
rather than masking it. What do ACPI tables say?

> Fix this by moving the masking of IO-APIC pins ahead of the enabling
> of the local APIC.  Note that before doing such masking Xen attempts
> to detect the pin where the legacy i8259 is connected, and that logic
> relies on the pin being unmasked, hence the logic is also moved ahead
> of enabling the local APIC.

A comma after "masking" might help readers here.

> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1476,6 +1476,10 @@ int __init APIC_init_uniprocessor (void)
>          return -1;
>      }
>  
> +    if ( smp_found_config && !skip_ioapic_setup && nr_ioapics )
> +        /* Sanitize the IO-APIC pins before enabling the local APIC. */
> +        sanitize_IO_APIC();

I'm a little puzzled by the smp_found_config part of the check here,
but not in smp_prepare_cpus(). What's the reason for (a) the check
and (b) the difference? Isn't checking nr_ioapics sufficient in this
regard? (b) probably could be addressed by moving the code to the
beginning of verify_local_APIC(), immediately ahead of which you
insert both call sites. (At which point the function may want naming
verify_IO_APIC() for consistency, but that's surely minor.)

As to also checking skip_ioapic_setup - wouldn't the unmasked pin be
similarly troublesome in that case? Aiui it would not hurt only if
the LAPIC also isn't (going to be) set up. Then again the flag,
among other things, signals a zero base address found in the ACPI or
MP tables, so I guess this is a (largely) separate issue anyway.

Jan

