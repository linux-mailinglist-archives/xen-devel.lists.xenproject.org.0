Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2216E73A4AE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 17:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553670.864364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCM6s-000844-BO; Thu, 22 Jun 2023 15:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553670.864364; Thu, 22 Jun 2023 15:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCM6s-00082D-8J; Thu, 22 Jun 2023 15:20:34 +0000
Received: by outflank-mailman (input) for mailman id 553670;
 Thu, 22 Jun 2023 15:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCM6r-000827-4O
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 15:20:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5375ec72-1110-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 17:20:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6787.eurprd04.prod.outlook.com (2603:10a6:208:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 15:20:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 15:20:27 +0000
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
X-Inumbo-ID: 5375ec72-1110-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kL02SdWhzS0vuWL9Y6w7aNi3wIF+ZtajDiTyhEl1Poz9c/xPFlLBX8IY8cIg1syLAWl8UJKJqRpkGF6heaMtB4D9JtHiAGPcJ41suNq+mlY1cs0neagd+E8bSRQly3e9+1CjnSxq3Y7HGecGM9+m1DbuHaEDJfFfG9iVCQYSPLt4ivvjOEr5RmqlhjSNIdUF/B0B0w0viD+q568kky9FY3Fa1e5XBhTuFS5EWCYazy7P74iVZQQvgjzJDKIya915uo2OrYLQ6GW7CxGOhKmo4wAAMnc6ONbscICMpVCZFfWdXMoTFSImgyhLZ1GWpuaPuQzb/u0H25kS8HtY/touOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCnTUxcpzelRvQ9J5ayRgVcl2p/zPivpbtNGU/ZjXQM=;
 b=Je35z1iYDrPIDQaGs+u8TOf23NvTPUn+VpkcLczzHhW/AEWUIHk0P/v9/d4nnnvG913vmFZvfV51LbpgivRDxAzbiVkBxvMn+AjbysEkbfjv8KiFWnr/NWvkaytH6fIGqRZ3DDI0zCpfV/U1H2jey36RUxl2S4I8VpbI0g/OUCA+VOI203jewoRCIMBKLwBtSg0y6lzEBViJ0RVDTzgMWilIjrSUZUDh1g+FzlTpP4ENeozK5osdtRq5+aHex6htTsUnabxhOiMySDSYFFh68qN6cVxQPIX4mC+sO9kiTKFa7P8Maw/SiRunNwxoek5eaL9oKxMsaZYwfodWcD3ExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCnTUxcpzelRvQ9J5ayRgVcl2p/zPivpbtNGU/ZjXQM=;
 b=vw6GvuHlTpskHWYlanO+SDv+SxVTaKYo6/SoiHBYDMFVcQK8F8iWI2wMWu+qqEm+1YrdL4PixHucOSvOqg6/n13KesDozjQOnAe/P0Z0rNsHbkvJVyvsOe0oFxmSUNDbPPvcUqD4nOKYcD0Cx92K4S5jiEShm6J1Hy9Xov8zvO1Kna0aDPdOoOx50Z5EKwBBD5Lo5le/l2rTwjCcDCk63CYoZa43t5egtxZCFfl72ZQQntCbKEKNMHOXHTUEIqMm4qMzBsJyXMYW6IK6pITrtVjASeHVC64ZBJQFxxDZGDFg1H09volnKUgGFbTYo1Yd34//W/yJZncPTyeWp/oOsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <edd1f3d4-962f-8f6d-64b2-6d7775d13c12@suse.com>
Date: Thu, 22 Jun 2023 17:20:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 4/5] x86: Read MSR_ARCH_CAPS immediately after
 early_microcode_init()
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615154834.959-1-alejandro.vallejo@cloud.com>
 <20230615154834.959-5-alejandro.vallejo@cloud.com>
 <e0b2bd19-8b77-50f2-2759-065529b89c84@suse.com>
 <649460c6.df0a0220.f4bf6.4717@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <649460c6.df0a0220.f4bf6.4717@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6787:EE_
X-MS-Office365-Filtering-Correlation-Id: 27477917-6b9c-4e91-156e-08db7334355a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y3Do6uJkbQAdlwl1+p/9pzQoh1Wr/R0sNQJOZMOVLD+6fYBIaet1uoC98fnOh4GmPDimHj+Map8gvdW4JcMZOAjslcAFh+zAgNwTRSk1TkROYHPLZT2i7bOTtEKkOzjzgSNiqXBbwToCfOIVydOu8jKgVLMd/FhrRHdfMwvsiBnO2Qb8MlrafhoiiiKeKpaico4g2BhIfLmVZTPZ+rI9fak4KLzWUY4x460WdYVRRmpO4ww7RJMewhE2Q64w4d9ksr5b+nivdF0eCxRgsbJlJiLRFgQWUaPehO1m2LoHnDa16yyQu76TmSFXdPFKvwJvqjj77s185hVaFs9MBDH+HOmnYDtbsb3PF7Ftk83cpSgT2l7jHrIR0UktIf2GBbG3ugcNvOZ6VWFhSOMFQr4DKKBu8y9IETPZ8eGCOP+K5EKMvgdh1Q9agsUsq6QD7Wz5IJ+bN+0/P4EKT/2fSpvB87aCS0Nn4J1ZjoCDinzU5fukijq0HVwXq7GLwaXlIN/lDYF9m6lNTHaKosDNHy72NvVJdBTX/3ZHLZ53aY0gxaZUAnintKtfWjes9uCHnr7e7YRYywrlxEC34Cwp8ag6aT1CExsx33AvPqZ0ibLPzZle5r9U41bAgiLjwz9RvB4xrn+JocV+Q9BW9bv01XvZOJoxWsjgLCcf0Umz+ES3dFE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(39860400002)(346002)(366004)(451199021)(36756003)(6486002)(83380400001)(54906003)(478600001)(2616005)(53546011)(6506007)(4744005)(6512007)(2906002)(186003)(6916009)(66556008)(5660300002)(66946007)(38100700002)(316002)(31696002)(8676002)(8936002)(66476007)(4326008)(86362001)(41300700001)(31686004)(26005)(14773001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDQwZHdNdnNMU1VSS0tLSE5QUXZ0cHpFSm1va0tYQmFSKy9LNjVIOVJWVG9K?=
 =?utf-8?B?SzBOWEsrV1lCTlRPYzY5cGZ6enBoV3FuTDZvcm5rZS9TOHFaa1NzZ1NEQmp1?=
 =?utf-8?B?VDNyNzIwSVord3FmUk9veGh5WDg0aFF5TkVobkZyeTVQWkhlZXFveGJOS0cy?=
 =?utf-8?B?RmQ2UjlQNWEyUXhIUng1TG5WRlNEY09UYzhDQ05rcS8wdGN5enYyZy9DM2VY?=
 =?utf-8?B?cnhNZXBKRXFCNWRESVc3cnNHK1dEc1lRYnluNm9OT25zRDFtVzdQb2Urb1VB?=
 =?utf-8?B?aFJkZXFJWlQ5QXRWQjlBRHQycGJWT0ErMG03MGlBUzFHVnBTY1VEYVZHZkxS?=
 =?utf-8?B?L1Y4NjhKenNJY1hsWDZsTk1BTnEyUE5XQ1NKZk9velVGcDBwcjBrZm9ISnBW?=
 =?utf-8?B?dCtFVUFuc1dxc20vME9qMDQvdnBXQVVmTXJabEtKQnhrYVFDNUt1emhJaDVu?=
 =?utf-8?B?Y0FzUW5KQkNFZG9lcFNxaitxQWMzcmk0Z1FINkU5ZWN1RWNYT01xVlhhaDU1?=
 =?utf-8?B?NjExcnkwMmdiZm9kUmdrSCt1NTRiV0ovM2RzNDFDT29qWXhYVjl5cmlnMkxM?=
 =?utf-8?B?WmhDUGwwcHJ2ci9MK0IwVU9McDQyYmRISXo1T1ZyaEFQbXVDVTNYMzAxd1oy?=
 =?utf-8?B?TmZEZy9pTFFFSUtIRWFFeEhaZW9jTXRTeUszWmxOemNrNEFwYzNvYTJJMUxq?=
 =?utf-8?B?bFZtc3Y2dkhMOUhIVWdVRFNHY2JZK0JvRnlDOCt5bGwwcm5QU3RFekZzVTRv?=
 =?utf-8?B?Z05Ec01jOHVaajBSZDNRQzVOZ1VCMTVDcHpFRkJkMmZmZkFiSGZCNkxCUmVV?=
 =?utf-8?B?RGFMZk5rVG5BajBkeTFrdGtqZEdVWGFyem41bDJQb2N3Wll5cTZqRXJycEFm?=
 =?utf-8?B?OU9rNWMxRTZZRFA1Z01veE83VDVJMGRKNHdMM3JWaEdBMk5mcmhEbEJvckRz?=
 =?utf-8?B?NG9YSmNleUlEZDVnTTZod1ZTZWdSNk9JeXhocVJ5ODNiOU1vdGI3cStHKzFy?=
 =?utf-8?B?R2JhNWI0UTNsQzduY2k5eVdGbjFtQUdKTWkwWXZlR1NiSDhXT2dUeCswUy9x?=
 =?utf-8?B?ZGYydWVibDNhc00xVnNZNkE0b0ZiYi9uVHVRYnpnTTBDK1o0VXdIMWdCMDRJ?=
 =?utf-8?B?S0FIOUJaWFdZTkVRTXkwL3U3TjBVSWtOL0dKNE9QU0J4b0RqRFE3UnY0NHVu?=
 =?utf-8?B?a254NGl2NFFCV3MxYStuMEhBQ0hhaGdXQUpNNGRBc2pQQVgwcWZlYnRRQ2ln?=
 =?utf-8?B?dUlCRGJReWpwcitEWjlxTFJVc0lDcVpDOXNnQkJoNXZrN1BkMXduVmFLTHBI?=
 =?utf-8?B?eUdGOHF5cUxqWEdzeGFOSEF6K2ZWRE5rQk03Tzd2TlAxc3FtZzA3RXZWL24x?=
 =?utf-8?B?aGJKVkowRWJ5TXd2OEV2TEdCZmZZQmZJL1ZUVFhrZWgvTVJxUzVGSWNUQ2VZ?=
 =?utf-8?B?eDNsMFU1VWRiVDNITlJHeFV1TzlCNS9Ra0N6dENXemVZbHhzTVZGSW5pS1ZO?=
 =?utf-8?B?c1ZwZ3Z4NkN1M3hIRzFYb2tZcmpBeXZPWWt3S1dPWXErUWRMSDRzaVRxbE1q?=
 =?utf-8?B?V3pWbGcvR0lDbTE0ODZIT2tvS0ROYmJnUko4WFFRK3hvdzB4UnJla3pSZmla?=
 =?utf-8?B?SkIzd091aEdCTFlJVGJIVGt4Q2JCd2ZBK2RzMEtKbng5N3BQQko4VlNhTHEw?=
 =?utf-8?B?Q0YzZXhhVEZWdzZSS2QwTkZRaSszNHU1NUYwOGMwOUVvdC96aU9SMFJyR2M2?=
 =?utf-8?B?Qm1wS1VCaFRaN0V0MVU5ZXh6S2VwWjlobnVuYnZXR2d1cDZSMnZwU1YwOVY4?=
 =?utf-8?B?U29xSnEzcFozRTdoN2puYXZFTkptZHpNU24zdC9PWit1Q1U2VUxxaTV0Skpk?=
 =?utf-8?B?QnE1ZFJUcXMvb0ZxV2YwcFd0dTRmZ3ZIRWFvZlp6d0tVN05uTWkwZHdJa0Yx?=
 =?utf-8?B?RmtnY2FXSWkzdCsrYmVCY2lkL1Jac0k0WU5VYUxIUVhkNWY5NkN2bUtka052?=
 =?utf-8?B?bldwT282Z3FYQkJmR0YyZTdFSENLbU01Q3IyZ3Jxc1drSkpMQ25hRDRBVUVs?=
 =?utf-8?B?QURKdkZBakhQQ2h1czgvTWU0T2ZZZGFZekVoYlhvVTlkdTZzR1NadXNKUEVn?=
 =?utf-8?Q?kXg5dvaSG/RlTFgz1ifWDQ3rX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27477917-6b9c-4e91-156e-08db7334355a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:20:27.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHYt8fulsv9YG/4WS3dIZ4LGPkohUay3jQ1R+2bN9fqhNIvQRPLiRtIkpYqOAVtzRLVZhWhXmpNswtrpO8rdVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6787

On 22.06.2023 16:55, Alejandro Vallejo wrote:
> On Mon, Jun 19, 2023 at 05:57:14PM +0200, Jan Beulich wrote:
>>> +    if ( boot_cpu_data.cpuid_level >= 7 )
>>> +        boot_cpu_data.x86_capability[FEATURESET_7d0]
>>> +            = cpuid_count_edx(7, 0);
>>
>> I take it we assume the maximum CPUID level won't go from below 7 to 7
>> or higher with the ucode update?
> Do you mean from >=7 to <7 instead? Otherwise it just works and I don't
> undertand the concern.

No, I mean going from <7 to >=7. In such a case the earlier
recorded .cpuid_level will prevent the leaf 7 read, and hence also
the possible discovery of ARCH_CAPS having appeared.

I actually wonder whether it wouldn't be better to re-run the whole
of early_cpu_init() from here again.

Jan

