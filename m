Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1616E7380
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 08:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523153.812940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1cQ-0006FA-Bl; Wed, 19 Apr 2023 06:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523153.812940; Wed, 19 Apr 2023 06:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1cQ-0006DH-8G; Wed, 19 Apr 2023 06:48:42 +0000
Received: by outflank-mailman (input) for mailman id 523153;
 Wed, 19 Apr 2023 06:48:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp1cP-0006CL-0u
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 06:48:41 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe13::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36cb806d-de7e-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 08:48:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9438.eurprd04.prod.outlook.com (2603:10a6:102:2aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 19 Apr
 2023 06:48:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 06:48:36 +0000
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
X-Inumbo-ID: 36cb806d-de7e-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5YILYFj1DL8dUfzDPmSCGcNCSaOiToDpQ+75iBEqGPHbpKuR+ASVAAJc/pMRcw5yYLJ/kvU2x3/kxcALTdzY8b0eYf92tzbrr/t4PNSMERNRDcGxMxkN10SIQn9drIDNNWqIcqyVv7ni1Zi/2FMTqBQmuqPIMm2UZP1bTsnxHR3yaK2ktktkkto8UCdGPrdRbyh4yPeR//CWUtaxbzXTbe+Iys+vmH/SpOc2WPqUb1GGgQ1tMS6BrSZmTqtmSh+6PPo2XZ2DWxmVwrTdZ2nl8zCh9E1zsCqmr4RamieCiYpJxZ8EGGSwvJJM/k+NYSqEI+3NyYzTCVFwVYosAPjnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqrjDSwPQOrjrHSRm9JHv6bLRODWdsufHkgQLID8ljk=;
 b=YH1rY/iPgOOA3AxGbLrMsSvfdEONSBbw66B0bkgowUaWr+v3kSp+HqEn9535V1LZVhASinJuUwYbXwe28YsQb5jDXljgk9tmzgSuRU7nD3POdUXJvhzvK83gI5MAdKsNM0WjVWRdkugo8EVnkBOTn8QQpZaESynQ/I0wNWV+EeapO+7n9V+Ft2t330A2F61qXsudgZkm1qKcShyTHU71HzDSYIldnD4+xbtzZ+xzky/A3F6OtkLD7k9jLTwcgWfIxjS7l8B4A6VBB0jPpGN9MxhDNwEXKRm7tH0uFZOFUW8J7XZVrAEnEJVLCNgIXw9WOB2NRRrmw/p8JBW6BSwsKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqrjDSwPQOrjrHSRm9JHv6bLRODWdsufHkgQLID8ljk=;
 b=swshyBo5B+J6F/a4BQGUlF7wIdv6FmI/vef4cJ8skeTKvW71sNi5+Mo8cIXJlqivKRkZI8BFF8xLfT+zwrOOv+pJNulytEGqykZfpWdpcmxMa4SymQlRLNaqRbCY3DRw61v5CMjvn0nDB2ioP2/WAWdH544bG7+fkyX0eP95qib7gD+Zg3tmwpmjg2vuerGTF3PJIzCUGWuUwiU3K7XHO+OVxVcv5D2cHrSBQ1ZuK44IbKRKqQP/lLdBP8MIo49k8oKwRwInlH+TlixqzlYGfE2NPhu+APsiC8fzQQ/6QJdbZixcxjAigBMhB7yKV/3SnLyaulfDgpJFaZCO13Ot2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af739920-4ef5-4762-7931-3479f688ab43@suse.com>
Date: Wed, 19 Apr 2023 08:48:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [xen-unstable test] 180296: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-180296-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-180296-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9438:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e19ee83-630f-4e95-fba7-08db40a21987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FSP+3Q5A83B7yYIduAY2orMWQi2Xoke1++mv7AOrYbwyohLZL/02ZF4iJ3bO1U7STfcUi6ktYP9b/VNibAir3LZ0GYth0MPbPFTcdd+z1IyO8kXMliLB8NavHtHhwJWtAIPZtE+oXiHBK6dfQoYhoVSaNxWG2aWx61PJLeINNrK29Cs/2xMsOL6f4WJuaS/zMJ4QwOFuIh8OvSCn7ZbBtjDtL4aY2hzBXFfNPuwXEl/h+t6PyrzOGTa2co7mn/fMn0xSLAZGwH/0uZzhVkCkWNGgZoZNnZiEmFR6cvzSR9HT2wtSQjB74II8G0LSxoYGCjyk0x8oKBIiTGG4c1D0hv9e4coKvfoYamlXt7/DDlqsQOad7afhg5X3em8fiXH8RIAW6oLuhAvxJxJlhoehwV9NnH2jUvQmgxm/NmT1wqtWNAaU7qSCcUJrv2xqv1GOedPJ6awdjqshOyWYSHTlgd5vZYY65bMAx94AId9xk2CIGsWBOzRg6u14Tox4Xa3nWpENndV7fVuwHGh+hAONaLXZjXD5J0y/9NiooMQqbnnReKYwnv1ZUXuq153TJlETrqiWFsNfkdQwQAGWiOJulGbPFg4gQdSwzSfdn+hw5WQSt0FRh51VyP0qoUCczI9Z8q8s5v8YW9BU3/u6tOoJBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(376002)(396003)(39860400002)(451199021)(2616005)(53546011)(6512007)(2906002)(6506007)(186003)(26005)(38100700002)(8936002)(83380400001)(4744005)(66946007)(86362001)(66556008)(66476007)(31686004)(478600001)(6486002)(966005)(36756003)(5660300002)(316002)(8676002)(41300700001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME4yaW00bFM3ZkFIeXZNN1NabGdZb0FFY1pQUFFRenAwbHA0a0tPTkU2b3I1?=
 =?utf-8?B?SEJQRGl3Zk1vdWpZZjdJRmxGd0k5dnpuQXNyYm9lUyt5SEZmdGxMNENiODhQ?=
 =?utf-8?B?Mkl0ZlgrUkkzeFFCeGN2UVE5bWZyanJLTlE4M01lVkxZV20wZkJJSGtSNlFx?=
 =?utf-8?B?bndaV0pUeXVxcmVMeDNxWS9YK3h2QUIxTFBwVFRiU2FrK3ZEN1E2TkNwMExr?=
 =?utf-8?B?MEw1S0NBaEI0djNKYXZhZE1wMHJwb0c4SCtpa2hVVlhQdmxLRlVoanpsV0F3?=
 =?utf-8?B?T3h2SE10VEhmaXVqbkhFalRIb3NDYmFxV2lNSGxlbEEyS1o1dnpEVHJzQURn?=
 =?utf-8?B?aWxzWFNuR3B6YnNFMGVKdXdtSG96NG9LeFpMUy9IK3lzUThveHlkRUtMMHNx?=
 =?utf-8?B?WHc0NE5sNjJ2MWN6Z0VHNjgvNldWOTJCdWZTMGg1aEZJcS94Skd6b0ErNHlG?=
 =?utf-8?B?cVlITmliblhkZS9uSFlJOEdsclk4MnBqTEppK0hDMVFLTHBnWmhIV3hjbG1L?=
 =?utf-8?B?cTR6SjN6OHFBU1hYbnJBVWYvdUs2bzRyM3BYMDdBTXVoWFJqSVVXemJTR2dp?=
 =?utf-8?B?ZktsVElBM1ltNHhyN2I2TXhzc2l4SUpuQncvM3FWaGpBRDA4ZURKZXM4VXVS?=
 =?utf-8?B?eCtZbFBpUVZaeVFFTVlVRnI3MkNLVDBEMTZEaWw0dnVoT2x0dDhkUjlXcHVB?=
 =?utf-8?B?dU1Va29aK29wTmkrY1IwSzRBYyt5bS9NaVJSZVYxdzlpcFRDbDhDSGRRd0Rr?=
 =?utf-8?B?YUpVaW9RN1prdlMrY2FYNitSYTA5TWlFNE9oVHdpdGtvQkYxekpSTmNsRy9a?=
 =?utf-8?B?RCtKSGw1SGF5bndQdERSdjVkUGxiOFg0bW5LREVKRS9IT2xxYlBkWTJhM2hP?=
 =?utf-8?B?Nkw1UVd4WmUyS1I1ZFVtbjZ6bGtYaVYwR09LdzRoblZHaUhvSVdCLzhHUFN4?=
 =?utf-8?B?anVMT1VNUDFjcjZJMlR0eC8yY2w1MDZKbUZtU3dqeHZoSmdtZk9jS0Vxb1dU?=
 =?utf-8?B?b210MGtRaGNkK0Y2dkdFNTR5UkxFMDA1NVM0dHFRV01MRFRNUkdObzNacjRB?=
 =?utf-8?B?RytwMEh4NW8rWVBQeUtHS2lEbVE0TWY1NVpYcUE1clFmdUVydCt2bzFyL21D?=
 =?utf-8?B?RURtSGNpMnRjVGU4bEczemtSSHlzUkFoWnRpdHZ6ZUhaVmhtdnhmaXhKK0FP?=
 =?utf-8?B?cFlUd0NjT1RBaGtBMVlMT2tIUXVSeEg5ZEt4eEdWcTYzdFQzbG1lYlR3bU5G?=
 =?utf-8?B?NGk5NGNrTVVOWm9GNVZmcHV0Q1pmRDZndHR2c1g1eDZPcWlRT0pMM2JnbTF1?=
 =?utf-8?B?WW1mczQxcE1ybVN5bHByV2hyQWRzOU8zOWltdzQyWWQ0Vk8vWDd4WlhLMFN5?=
 =?utf-8?B?TEFDaVZsYlMzem85WndXc0dVdW8rV0d0UVp1c3NSelBJZXRvang4bUQrVVV0?=
 =?utf-8?B?b3BRRlBHSnoyOTlkcTZ2OGZ1bVJsOXpXaEZiUDA2QXVlTXprUmxPWlpNOWc2?=
 =?utf-8?B?NWNhbFA2WVp3cEhvaWFtUkNmbkNpZnNpS3pKdnZZTy8xSU4rK2dvVVhoVzFS?=
 =?utf-8?B?SnZxWlJVVkI0L2FKbkdHM1NtZXgyNUdnV3lBNGF1MlZ2dmhaRDBrQ1dHWkwz?=
 =?utf-8?B?QmRJS0FiVnlsSnRaT0hhY0Q1Znk0MVVUZUNTd0ZDWGljNVdGSk53ajV1S0Vp?=
 =?utf-8?B?SFhSQ3RFMW5sdDZjdUkwSmpPWFhvNGtZMVJzL01UbWNiU2FSYWUzUHB6OVNh?=
 =?utf-8?B?SHoxRXJUVWVYMzFyaXBlc1VDeVpMN0FIUDJTTWt4YWpocXVSdzlkUXJydnVK?=
 =?utf-8?B?T1FOSzIyM1BJQjlQVHN1Sy9hL05VQXlRMlE2Y2hFdC9YSEFPMWVrZVg1cU1m?=
 =?utf-8?B?bEFpZTNYVEZHUkpRRElGT3dXTURGYmpFOHY1RDdxc0hBRkRPamhyb0RaR1Y1?=
 =?utf-8?B?OHBOUVl3Y1VMemdQemVIYTc2TTdoY0trbnJKTDN6YWlMY21GcUoxZjRTaVFX?=
 =?utf-8?B?TDBxeTAzM2Vua1g4b01nZXk1d2pwVnJ1S0xkckhzSVduRVZ3MDhIRVFMdXJ0?=
 =?utf-8?B?Mlh5N3pkOTNkOE5TRS9JU1p3WUxscTB1eERSQ1lJbEFHbDlsRzc1WnR4Rm9z?=
 =?utf-8?Q?i0M5Y8CZ5LGv2SjZ2DMzFaGpT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e19ee83-630f-4e95-fba7-08db40a21987
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 06:48:36.2620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13m2ylsFy3mD8QxUEu6pKqHG5n7Qm+0nUbq4uwrmRm5u7ZqTj7RiLg/NUgCxBGRFaAJnp9CfZcPqNzbzMldQJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9438

On 18.04.2023 19:53, osstest service owner wrote:
> flight 180296 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/180296/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-armhf-armhf-examine    11 examine-serial/bootloader fail REGR. vs. 180287
>  test-armhf-armhf-examine     12 examine-serial/kernel    fail REGR. vs. 180287

I'm afraid I don't even know where to look for hints towards reasons
for this failure. The places I did look at left me without any clue.

>  test-amd64-amd64-xl-qcow2   21 guest-start/debian.repeat fail REGR. vs. 180287

This one looks to have been transient (yet still such transient failures
are a little worrying, too).

linux-linus flights also have an issue:

Volume group "arndale-lakeside-vg" not found
Cannot process volume group arndale-lakeside-vg

Jan

