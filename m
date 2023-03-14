Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91D36B9AD1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 17:15:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509734.786087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7IU-0003eR-TT; Tue, 14 Mar 2023 16:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509734.786087; Tue, 14 Mar 2023 16:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc7IU-0003bB-Qe; Tue, 14 Mar 2023 16:14:46 +0000
Received: by outflank-mailman (input) for mailman id 509734;
 Tue, 14 Mar 2023 16:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc7IT-0003b5-Jt
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 16:14:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 547c3407-c283-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 17:14:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8694.eurprd04.prod.outlook.com (2603:10a6:10:2dd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.27; Tue, 14 Mar
 2023 16:14:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 16:14:41 +0000
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
X-Inumbo-ID: 547c3407-c283-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqkUTKKW6gTNo73FeWZhV0X2IT64gmPzh8TIlKMh+okFJzTM0b0ZSmZ8d65al3cdA+nNRFU0jiSFSX/hNA+1kv9cUuLlKDoWR7PJh4K/OELI95S8ZryBWaA3f1hJVA/hURfJ4u72SfN6oRtF6D8Z5bTt2pt+hXDDCRbxpFVSEMVEkxp68sAQiq3RVOiqfVrKIhP12cGpy7dOgre7sCHs6ACG5tUt9a+2k4lpOeQJOQ12k4dOuwoQeehoWvckYDOxqFXVmXVLc0zH1I8SdVtnX+8a5mMt1i+t+CkvlurIw5570W57xcKkOhDbvhR8QFvmPbYL5Dmp/SWmvCBxfBcbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkGa8rGejTBaq41zh7od/rRL5wk5hKeyevZMVuf3I70=;
 b=ElS122t1UhzOJ3/YNtSQhdym9LLLp+3IJox9NoWGXyrVgTxuu0INOPoDCzGC0pS7pACtw3rqYE4MFY9JKb2+92k9u2z4Nxcm+VVQdt9mksriHw6T7oD9PxnGB5x/j9c58KLu0yMJ749DtLnutSmciVb0t1RZLiRffN4EgEnlJkCnY/b6BqBTD8ljJkzz+5j6nQCSCHgXvNBvkxK1UafnYZMoRhy7Xe/9bzJOydnhvijFtpYePWrf9mD4bXaADhU+pWWYceA7TrmK0hC3feTUkg4qgpO1iwUMUvjU/A51J7Vs0ZW0ElhcfwfedwVftFZ9c4vJ/C5IxPdYq68paWhdug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkGa8rGejTBaq41zh7od/rRL5wk5hKeyevZMVuf3I70=;
 b=gKwBATP0hn22aqabknbO4XQXfBFQaW8L0iIZpZul3r8EYw/TRg+pgzzEHXhLcyDLVOASpBQrBUYKrwY9UvVEeem6zsm0MDeJmA2eSAKuwo/MpIandt/vi2YVDw2ZsRHlBJ/3sdvqBzRtRF4XBleB+bU13Og37ZgjoRiAi8VMVw132uWTPTVWNjjvbeM30Q9bi9xxQKvbDtCQ6tgbRFWx/nk/jGT1Xc/ce7y+PwB5JmMmsaAyqbxia9MJ0FDGrndNYA2qeOmk8UMiTRsbeSzluAXw5coxXNXlZwG0bGLQ+bSIGoPR8L1fH/Aag2Z2zl6j8lD5DMdVCaJH1OK08GVJwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3c5e3c0b-1f0b-4bf4-0c8f-1149040208e2@suse.com>
Date: Tue, 14 Mar 2023 17:14:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8694:EE_
X-MS-Office365-Filtering-Correlation-Id: b87e0490-b7d2-4b6f-e547-08db24a73774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LgsquEac2OK89FVRUskzIppqSlDrog3711GDwcRERHL1Ce/Yh6jJ9dORPE9q4GhIs4CYjTNaUXxSQsxkgsHvZ3MTwVnue6o1d1tfraFhGuODvDWUAIUmLkrHJe88EGgrM0PQzyKl2n/CTt8iH549GOE8etQOCZREQK0f2gSt0SqgE8jvS+CccbiSfjpdNQZg4hAtx+u94Oa2qAFCzbLgSO4TaR0JmDQD0gIDSXuYaM5qsdKOGDCjysH23vwFBLJ6JNlJjT2OW9Xj1bAot/n8BQi8K1vmdYBd8BMaki2c9y2ZZawaFYX21j/etfYAdYKSLBsgtx4OAopO6/VqnL6yMsKZEBus/6P6NzTtXzYJ1fNGsR0ChTsS0NBbDNzWgV9pPYXEAwIaafF2FQeTDXooc0bTOlAk20syW3KwYbSb8/JiaN6sd6SaQnEQ8m+Fn3WJ8HCXtohn2lYyv9243tOBh/qPsoBd/6sVZ7jzLVWoMoy6q6nwOpvoIP3F80n3vo4lslHJphgeMfLTP+5pJvYX/zvozDqghcqx7VXJs6vwb0SoKb7cwYBjkcy45BMvupWjPkMBiiLzmb3XGqusc9d2hBkEWz6XuMfTkF6B2uUtUtNUPQCAedXOT1UJQg7Wwn+JHpbxQ57SIaaaDxeoXWJlhFB5MAvpqarxCxXNxp3cwfuy/1RaLImzs7Cx/rj4W9aBMfCS0ny6CKl2+Nbsl0zl+459lu7ZT1OtlBxu/BMlc/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(86362001)(31686004)(54906003)(316002)(36756003)(31696002)(38100700002)(186003)(83380400001)(53546011)(6506007)(6512007)(26005)(2616005)(5660300002)(478600001)(6486002)(8936002)(41300700001)(4326008)(6916009)(8676002)(2906002)(66476007)(66556008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVlra0I3TkdUNjRnMzc3Z251dnh6UUEzcEdqQ2ZDMldDL2d1cGpyQVR2UzVW?=
 =?utf-8?B?MG1DY2E4S0hvMGViN0l2cEtoSzBGbTZKdi96UFhCayt4UXNTWlZCYnlJM0Fq?=
 =?utf-8?B?eDNibTFCL0tua2NyQXpqRW0vVEZOMWIzYlEyYUZIOHV1ZUZ2OTFoVmdWaitE?=
 =?utf-8?B?eGNsWUJIQ1hwNExhZGxtMU1HeGM1aGhtazljdWhYYWM5L1IycjU5bWdCaXVV?=
 =?utf-8?B?a0FraWhONnlLTmpkRklHZ1lUNnVrRUF5L2NRUVJrOEIyNnkyL1R5ak1VOStX?=
 =?utf-8?B?MTBWQWxoSlQ5L3k1K051WTBveVdzL3hzR2JTc1NJYlFBYUVWYTZhSzl3bFZW?=
 =?utf-8?B?NlovVHk4dVg4QTdHZHpGcHBBZ1hvYjFQZVRIVkZpWFYzSG1FU0hxNHBoQ1d5?=
 =?utf-8?B?Qm9WWFhvSFlSWnpLMWpHUWN1REo1SFJtVi9LcThNQzl0bXFzRE9xZFJSUGhB?=
 =?utf-8?B?ZTZsZTNPQkJIQlowcklZRkNFZzJVY09iTVpxQVF5ay83c1g5NVRROUNBNjk4?=
 =?utf-8?B?VHoxdnBwMjhoUytGdUlnZGhhbFlIdkZLQ24rZm5NdzBJL2s1N1prZnNqWHQ3?=
 =?utf-8?B?TVNLbXJNTzFycDJwTXBiUU5wL3FlM3d5Q3ZCQmcxSWRJU3RkKzMzN1VSYS8z?=
 =?utf-8?B?dUFPM1VzczZ5S1VXb3hOQWN2bXBRMkNPYUlwSDZVVmVWc2xHdGR6LzQ4YUth?=
 =?utf-8?B?SU5PNXh5WjlmZFEzOVNiUTh1Y0J0TGNzZlNwenJ6Yjk4TU5PRHhJU1Bpdm16?=
 =?utf-8?B?emhiZkhXK1YxS2dHMnFZVnpiQm1HeVIwS2l4UldoMklnQTg4K0dhek1QTXZC?=
 =?utf-8?B?cW04VEFsalY0bjhDMTNSK3hrNHFFUVJMS0FXdW90Zi83T1NuYjVMWmt0VE1j?=
 =?utf-8?B?MWhXeFloMXN1d2UwRXYreW9LNUpHOU0rV0F6T3cwK28va2FuMVhNTTBOTmNt?=
 =?utf-8?B?OHZTc2dyWDRzOC9SU3BsT0QrM1FsbEVmdXVnc3MvMjI2QUJEa3pHaGpMTXNh?=
 =?utf-8?B?VmJVKzZ4dEhGMHNYRlg4SkhCWFJSVG1YSWIzY3U3dUJTTXUxM2dwNmYyb1ls?=
 =?utf-8?B?VnAwTmN4MUMwajdCdXlJN3Z6L2MvNWZkUENwdkRSNWp5bzZ1OEUwMW81TnZ6?=
 =?utf-8?B?cWVLNlhlZTZ5UnVIemQvOWQrV3VFdVBnaVlKMTlHZmRnZEFVeUFlMmc3aEFR?=
 =?utf-8?B?Y1BmTW80Q21QL0p5NFAvWlhvVGx1OEgvOEJUakU3NGZaMFlRczBzMDNDdlNo?=
 =?utf-8?B?M0hIM3FTVm0wQ0tMVk83K3QvNVNobnJ4dWxnOWh2dHFIMHV6UlRsVDkrVVV5?=
 =?utf-8?B?bnYwY2J6c1BZUmkyejNISjBhcjdxbjlyZWxIbEFNR1haYWRWa0VoandWUldF?=
 =?utf-8?B?a21tZnRjeWFMcWlKMHNmTkRpWmR1ditMUGpEZ1VqWDFDQWlzOU9FTkxuZFdL?=
 =?utf-8?B?NXZ1UytIRlluOHRWMWlCNzFvOVAvamJIdDI3S2pDMTQzMkFyMTByR3pmSDFy?=
 =?utf-8?B?WkVaOFZSSjZwN29FMkZST3Y5S2N4Z0dZUWhzMUlpY0ZlbjVwSHorMURYSCt2?=
 =?utf-8?B?UzE3UCtRNStSblhkcVd5MjA2c1ZnN0lHZ1h6Wi9XMitWdDI0VGdHdGk1eUh0?=
 =?utf-8?B?eEVrTkg3RlVKdVM1c2h5Ky9jMG1kSGhKbVVuM2JuZFU5UUVkNUk4ZnZQN3Zi?=
 =?utf-8?B?RU1YbEg5RTZTY3JlOEdqdzlDUldJK3FFZzZITTlyK1dBSG1qeXhQWmNZb0lZ?=
 =?utf-8?B?cjFiNWJjR2JDMk1XaUZGT055dC9pVXhwcWp1cElKT2I5WDM0aENGKzRSNzht?=
 =?utf-8?B?bE44ZGJNa3JFaW5VRWV3MFl6U0NwQ3MvY1NtS2ZPWXRrNkxIQ2Z3elpveVJu?=
 =?utf-8?B?VnkzcjhLUSt6NG9SN3MrdndTNzI1SU16SXZCMzBpQTB1dEpwZ1MxTCtjZWdh?=
 =?utf-8?B?ME43bnhMVlo1ODIxc0t4TlpnQ25IQkNDNHdwZjVMMXQyVmVZRGxKOHcrVVdZ?=
 =?utf-8?B?Y2JGWDZvNTFEVGFGTHlWUG14TWp6ODlQeCs0WXZpc0I1dnVMTHFBNjZrNmVK?=
 =?utf-8?B?NU5kUnNTSVdmNzNsTjVmMjYxRExZL0NDS0t0eElaMjFiN1ZuN2RLUHluNHJV?=
 =?utf-8?Q?Xeq+or/QurOUc8W/gx6hlBBUH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87e0490-b7d2-4b6f-e547-08db24a73774
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 16:14:41.3946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfoszh8FCau36qcsCONofvaQQywcT0ewuf9uLVPpdLwqNmIvlbHXipaVcBYvMkmu4uzpNRf/SErydruVSoXPZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8694

On 14.03.2023 17:00, Oleksii Kurochko wrote:
> The patch is needed to keep all addresses PC-relative.
> 
> Pseudoinstruction 'la' can be transformed to 'auipc/addi' or
> 'auipc/l{w|d}'. It depends on the .option directive: nopic and pic.
> 
> Right now, 'la' transforms to 'auipc/l{w|d}',

I'm afraid I cannot confirm this. Is it possible that your and my gas
are configured differently (i.e. can the default of nopic vs pic vary)?

> which in case of
> cpu0_boot_stack[] will lead to the usage of _GLOBAL_OFFSET_TABLE_
> where all addresses will be without counting that it might happen
> that linker address != load address.
> 
> To be sure that SP is loaded always PC-relative address
> 'la' should be changed to 'lla', which always transforms to
> 'auipc/addi'.

While I agree with the adjustment in principle, I'd like to raise the
question of the suitablity of such macro insns for purposes like the
one here. In principle I would assume it would be better if sp was
written only once, with the final value. That would then also remove
the dependency on a possibly differing default gas may be using.

Jan

