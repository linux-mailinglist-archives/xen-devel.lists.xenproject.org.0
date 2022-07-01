Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59C4562B20
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 07:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358873.588276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o79eM-0005dj-Mx; Fri, 01 Jul 2022 05:57:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358873.588276; Fri, 01 Jul 2022 05:57:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o79eM-0005bx-Ir; Fri, 01 Jul 2022 05:57:06 +0000
Received: by outflank-mailman (input) for mailman id 358873;
 Fri, 01 Jul 2022 05:57:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/an7=XG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o79eK-00054g-Pm
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 05:57:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60079.outbound.protection.outlook.com [40.107.6.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a15425f9-f902-11ec-bdce-3d151da133c5;
 Fri, 01 Jul 2022 07:57:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5725.eurprd04.prod.outlook.com (2603:10a6:803:e3::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 05:57:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 05:57:02 +0000
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
X-Inumbo-ID: a15425f9-f902-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UT70/g+7z5qoQZvu+iWZn2LAHQeUh8X6Vz2tMQpSwQx97oH/UN0R9b/gR0OpM2dtLUjh4MfgXpiWBhgI7QEwyJk85jTxGSBNP12Hi5xDfnZcXEOy2NcDE8UY6rLXafqhHnqLpL4ZANt6mfyKcsn28lgtxAo4V+PRCBS9KeZ9BHilYdOuQTcYSRxbprH9/MZOqW+nhKWzCIk5K6j2Hf5blkNmf/VU263sOTMsQC7P75dYLfzLsGVWMycodUI2zmHMG4HKoZDoK/Y8nPK6jCCiRLN5SZ0UwGDFkghM+lyH70ILBRiZD+1LPDePCCKLs11zn4LyeBmtKoZ6CXOsDkI5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0vK/qRqt325EZ3GylagHyiXxlo7b/3gIWQjsC/HXt8=;
 b=aIzLCPt8pfnu55wgpLVkDBh1WkbGclW4+ftLuL44Zxo9b9TS3w+tzdtiaqW8TIo09iZQUYBtGPJxE7JfQsCO9dV7TRC191Hzo9Z5euICx98PNMYFF58wy2SLlqJaPxRFh4O++NX8XK3ONXyKwkLGJQyGVrXQJKcx/AtGDpHB7ufIsP9LULkNl4J0LIWZTZb86AjiskS7nNr11+FgprpnWXDXXCky6+EfIj8sz8i5BaYE+CdyLF9QHS6PGqK6jXJkdYAVjwg8rjjJHJ17bsJqbp1vjhHSdhgr3lryCgCqYBpyZ7G7xlC/EVf1bzOKWh2myaslFPjj/eiXhXUE44rUpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0vK/qRqt325EZ3GylagHyiXxlo7b/3gIWQjsC/HXt8=;
 b=3vu9o1TCUrBwtrSELGRG6hS0HIZikFCbqZytcJg1jGkPFOlFZ8YcCFGPgsjPdzsh217MSf6p3G9Ic6weOkbwm2Ct7LxpLIV6c6z2FseO2fm7jVcMZjbxzWhMPFCSl4lFxtfgFqdJv68K4ecgdQvEq9k/klrsmmVUkTguuNX7ZkJVX8Rr6gToKfSwBSQGN3I52AmYkPeq5aSdqCj3T9O1z4F5HShKOJmmZviAn0jqOXA5cXmdrUPowOjQ+nvd0MOEawygB9rKn7GkeitVMZihe0zb0+/DY5iqTRYbAKGoCeyYgaAl7PX5lgfFYcWZ59/Y6+XtlUxRzqXU0Fqu1wErog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6558cefb-8541-0411-871c-939d6a4e223c@suse.com>
Date: Fri, 1 Jul 2022 07:57:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
 <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
 <bad83568-94c6-6d90-308b-ae9965f54754@suse.com>
 <PAXPR08MB7420AD8092F0FBA43C359DD19EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <1d488f5d-bfd3-a816-dab1-515f49a57f67@suse.com>
In-Reply-To: <1d488f5d-bfd3-a816-dab1-515f49a57f67@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60c4aa78-f9a6-458f-5b47-08da5b2684c2
X-MS-TrafficTypeDiagnostic: VI1PR04MB5725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hcSf2eOajcDbU8XARu0Z+0pWTvnGXaPCe9i1N+5DinMkBdTQHpV3tykU4yZqcm8AINNNsXTY7XUjIx41rexyIXyUPXf4EDrrj7El9rYof2LYpYOn7R5ljIuoaCBKs4trVnuAbaZO2jYU0X1WqDNeRRiKjHKf0LindiD+BDgOyrBluDSzsfiJwShGphBKgMQtijeghLlqIOP68Qm0J1LP1e4Ft+NN434qvtFOrv+gf/8aPaJuscq3xiqWL33p+nlfQICOT/eKebcEg6yeRdIusA59dhqSe0a4aZENhElUFt39oSXRMQqahdMsYbL4x1V/P20DUM08TGWqvOp7ghLbU3AaafjFq+kOHClovvzLVpb3ekyPppMpOcRNaBpjQJlIt6m2Dlki0Rqjdh8gsuP+V030YsOoRnOpFx9K7G/5seIrWw4Uv50XDYlNRvJCrVeKVNt3bqfhABzaCdiiwBYoiHMdEuy66FWhhKlG6erb3o7MMHQMommcgTwxE3eH2li1H2zCh2ajlTJQ0P1VSXLCQaIfUzmWntUtSNsKK9KQP0X25Zqm4xKFMUsSYHlZRKQ5mxP53hELG0+c+Cria4BDyB0bQ6ycPN7bSCqSyRC/lDpETuN6PCZ0hKRft0eWmyoEXQNoq3zACarbfH7JRiKyzpoi/LaweiOSd0jb4eJbwHdqwD4vCa2ZIWCAiY+B6RSpoViscS4bTPwiR79j/q81w48jE3RWM8aGTJKMudaiMAjWAwAh1qFoyYskb9mlHlBQp6NNxVatGH7YtpmuMrd/iX+hHcyKNzm6r5RlEFkilVscucueeQdeBSAgqs1xrAigN14XjjfwcDtycneRb1KT1NqwXfJdxKbxROrErpUUPxc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(346002)(39860400002)(396003)(136003)(31696002)(86362001)(6506007)(38100700002)(316002)(66946007)(4326008)(8676002)(66556008)(66476007)(54906003)(2906002)(6862004)(8936002)(5660300002)(26005)(7416002)(186003)(2616005)(83380400001)(478600001)(6512007)(6486002)(53546011)(31686004)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T09Hb0FhYTc4VzNaOGhYUEx6azlVYXNST000YWZTc295K2ppUGpoSjFsVW14?=
 =?utf-8?B?NUFJdTczMktaMDE5Q3hBeTBZWkd3WW41Y2tkU0x2Zmh5VHB5ekpJZVN6Y0U3?=
 =?utf-8?B?Q3BQdjVxRVhkL1JDejRLKzZZdlQ0ZGlEVWEwQXVUbVNUdEgzZEVCalltQlI4?=
 =?utf-8?B?b3BWUm5YQXYvWUQ4KzRRSTlyb3FJaDB6YjlBNDZQU1NuRHBxZGVHZXZ1d3Bj?=
 =?utf-8?B?aXhVWU9iMGw2U3o4NGU5enVJQ1lITis4cE9FWDhDVU5qSzNUR1R1NHdpMkJH?=
 =?utf-8?B?RlVjamdmUkZTTjV2ZFFoZU9wVEhoY1ZJRXRoUDlWSlpIRHhtcUlTZ0dPSS8y?=
 =?utf-8?B?bzREUE9YZWsxTGp1Mm1lUTIzc29yc0pSZTlOYjJvRmt3S1JyMEhyL3pyYy9L?=
 =?utf-8?B?d056cCtHYThGMmNSVXdnUVFhaythcGYrc2g3NExveEUwckR4eTdUNXZFaEJt?=
 =?utf-8?B?TTZPTlcvM1FLUXArQWxSLy9nbHBlamVxOG1FSTJkcEJrNVhPV2t4UkE1Z1Fi?=
 =?utf-8?B?bkR5WFNBTElmN3RRK1BDNERVQ1hveXI3alc3M1Vja3hQS2krMm56NTdWNnBh?=
 =?utf-8?B?d3JxaXNYY1kzbms3djQrSDZwRmEyREpiV2Jsc01mRzF3cnBSTEpnK1JIYzFx?=
 =?utf-8?B?ZnFlSks3b1V2bjhCS0NGK0hLN0VDN2tiYjhCbW94T0IrVnBYTzdmTmZDL0hW?=
 =?utf-8?B?NkxFL2NHYnhVRWE0UG45VkxtY2lQeFVSNU1uZk4wT29BY21OVTZFRVpiU0pn?=
 =?utf-8?B?OWdsOHY2cFM3ZmJpTVhZSjI1bnFLTEQ2N2R5ZFZXRzdmQjlTMldEc3h3MktR?=
 =?utf-8?B?ejNIWEpnTHRCOXlLOXQ4K0drbEFzVy83ZGRRMDNGSUdWRytKQk5aN2NCTjNw?=
 =?utf-8?B?OWVwMnlQcytLdUZqcDBSR00rZ2pVNzZRT1Z4RHE5Zk90UGgyQlhNSEp5R1FJ?=
 =?utf-8?B?dUF3cnhzUEhaWWZxaEFCMW4zUllzVGQ5K1VpN0VlWWlCWHBFZHZVaTYxcFZL?=
 =?utf-8?B?TEw4REVJbW9TU3pBMTViVnEzVGtCbndXQi9HMHl4enhRcytDKzF0cW9IQ3NI?=
 =?utf-8?B?U0ZpTkdZVHZRYmxjZHFBaU9MOUdqbnBodXk4NVM5Wml0T3ZGQ3F3QXYrb0hI?=
 =?utf-8?B?c0YrMG5vMWMwakFlRTVtTWpJTzBIR2dMRmZmb2YyeXp6bVY3QkVnYi9MYjhH?=
 =?utf-8?B?dGNrRm1aMDg1a1IwbktRbmkyQXo0b0ZqT0Q1SEVVQWZYcjUreFpXZ3hRUmVE?=
 =?utf-8?B?SzdDL0o4NW14N05DeWRGVUNDeEthb0NKeENGZjFNQTNaUTF1S0YxQVpMTWVO?=
 =?utf-8?B?SkRHZmJHRURzMkxFditVZ3FKQ1VJK3pLc21JOUZuUGFWQ1VLRmFwdFdpcmdv?=
 =?utf-8?B?cVRkNEg5MVNMb0JQeWM5TmV0VXlUY0gzUSt4NE1sM1NFUzZOMEphalEyLzAz?=
 =?utf-8?B?enByWS83bnE2VjdXWEdLdXVObXA3a0VPMVlIS1V6VElWM3RhMFpIZjdpTVox?=
 =?utf-8?B?akdrODdINHVIbWd0cVhuZjFOOXE4aVcvNXRJaCtGc1hJdnJCb2drVTNXSzV2?=
 =?utf-8?B?amVOMHRHTzM1bG1xWVE5S1ZYTExvTGUwOWk5QTQzYXRGbG1nVzdXRjlnb0dj?=
 =?utf-8?B?R2hqZlUwMzNYb3ZqcEhST1k1TmxHSnVodGhybUNRWFkxczdHR3EwK1JFc3Zr?=
 =?utf-8?B?cUg5UGZwU3RpT0dwa3B0a1dCbENFbUlBNXFQd2t0cnh2cUd6VmZRYVR5bmc0?=
 =?utf-8?B?VzBJKzhrVmtWYlEvRlJnQlJiWkdvZ2U0RE9BaFo1cHFRZS9aZFQrLzQvS2NW?=
 =?utf-8?B?NFZOQ0w5a3FUZFg0MmVIcTdoMGJjaHlhNmx4Z1I5dUhxL2d1ZzZvZXhZbGJJ?=
 =?utf-8?B?V3VPSE9rSXRkWWtORVhSUHhud1JPVzB2blRERkxlTFJnRit2Z25oL053ejJT?=
 =?utf-8?B?dlAyVXd1MERpRWpBL1M4K1VWWFBreElaSTM3ZnNjNVVuTkpPTzEvTVVWdFFP?=
 =?utf-8?B?b3poNDVDaWZmWUhYcnhaQytmUDRQbis2clRSd1hMeWJNUHVFeVVUWlA0clRC?=
 =?utf-8?B?aWsrMkdpc25CQzdHd00rMnRjVnh3OVlQMWRHTmFMb0dJV0ZXNzhTNTRNd3J4?=
 =?utf-8?Q?WqTmYJOCgnrCJS91vUIkGsgjG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c4aa78-f9a6-458f-5b47-08da5b2684c2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 05:57:02.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9uYYN/AZ1g9+o2OuAsHtbi6oEGb9Dln0nXj1/FOhGZ3pdw3zdlt7pHuBDzICBwhTXHY8PRwCdtairtT0YoSEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5725

On 30.06.2022 14:36, Jan Beulich wrote:
> On 30.06.2022 13:25, Wei Chen wrote:
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 2022年6月24日 18:09
>>>
>>> On 24.06.2022 12:05, Jan Beulich wrote:
>>>> On 24.06.2022 11:49, Julien Grall wrote:
>>>>>>>>>> --- a/xen/arch/arm/efi/Makefile
>>>>>>>>>> +++ b/xen/arch/arm/efi/Makefile
>>>>>>>>>> @@ -1,4 +1,12 @@
>>>>>>>>>>    include $(srctree)/common/efi/efi-common.mk
>>>>>>>>>>
>>>>>>>>>> +ifeq ($(CONFIG_ARM_EFI),y)
>>>>>>>>>>    obj-y += $(EFIOBJ-y)
>>>>>>>>>>    obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>>>>>>>>>> +else
>>>>>>>>>> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
>>>>>>>>>> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
>>>>>>>>>> +# will not be cleaned in "make clean".
>>>>>>>>>> +EFIOBJ-y += stub.o
>>>>>>>>>> +obj-y += stub.o
>>>>>>>>>> +endif
>>>>>>>>>
>>>>>>>>> This has caused
>>>>>>>>>
>>>>>>>>> ld: warning: arch/arm/efi/built_in.o uses 2-byte wchar_t yet the
>>> output is
>>>>>>>>> to use 4-byte wchar_t; use of wchar_t values across objects may
>>> fail
>>>>>>>>>
>>>>>>>>> for the 32-bit Arm build that I keep doing every once in a while,
>>> with
>>>>>>>>> (if it matters) GNU ld 2.38. I guess you will want to consider
>>> building
>>>>>>>>> all of Xen with -fshort-wchar, or to avoid building stub.c with
>>> that
>>>>>>>>> option.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Thanks for pointing this out. I will try to use -fshort-wchar for
>>> Arm32,
>>>>>>>> if Arm maintainers agree.
>>>>>>>
>>>>>>> Looking at the code we don't seem to build Xen arm64 with -fshort-
>>> wchar
>>>>>>> (aside the EFI files). So it is not entirely clear why we would want
>>> to
>>>>>>> use -fshort-wchar for arm32.
>>>>>>
>>>>>> We don't use wchar_t outside of EFI code afaict. Hence to all other
>>> code
>>>>>> it should be benign whether -fshort-wchar is in use. So the suggestion
>>>>>> to use the flag unilaterally on Arm32 is really just to silence the ld
>>>>>> warning;
>>>>>
>>>>> Ok. This is odd. Why would ld warn on arm32 but not other arch?
>>>>
>>>> Arm32 embeds ABI information in a note section in each object file.
>>>
>>> Or a note-like one (just to avoid possible confusion); I think it's
>>> ".ARM.attributes".
>>>
>>> Jan
>>>
>>>> The mismatch of the wchar_t part of this information is what causes
>>>> ld to emit the warning.
>>>>
>>>>>> off the top of my head I can't see anything wrong with using
>>>>>> the option also for Arm64 or even globally. Yet otoh we typically try
>>> to
>>>>>> not make changes for environments where they aren't really needed.
>>>>>
>>>>> I agree. If we need a workaround, then my preference would be to not
>>>>> build stub.c with -fshort-wchar.
>>>>
>>>> This would need to be an Arm-special then, as on x86 it needs to be
>>> built
>>>> this way.
>>
>> I have taken a look into this warning:
>> This is because the "-fshort-wchar" flag causes GCC to generate
>> code that is not binary compatible with code generated without
>> that flag. Why this warning hasn't been triggered in Arm64 is
>> because we don't use any wchar in Arm64 codes.
> 
> I don't think that's quite right - you actually say below that we
> do use it there when interacting with UEFI. There's no warning
> there solely because the information isn't embedded in the object
> files there, from all I can tell.
> 
>> We are also not
>> using wchar in Arm32 codes, but Arm32 will embed ABI information
>> in ".ARM.attributes" section. This section stores some object
>> file attributes, like ABI version, CPU arch and etc. And wchar
>> size is described in this section by "Tag_ABI_PCS_wchar_t" too.
>> Tag_ABI_PCS_wchar_t is 2 for object files with "-fshort-wchar",
>> but for object files without "-fshort-wchar" is 4. Arm32 GCC
>> ld will check this tag, and throw above warning when it finds
>> the object files have different Tag_ABI_PCS_wchar_t values.
>>
>> As gnu-efi-3.0 use the GCC option "-fshort-wchar" to force wchar
>> to use short integers (2 bytes) instead of integers (4 bytes).
>> We can't remove this option from x86 and Arm64, because they need
>> to interact with EFI firmware. So I have to options:
>> 1. Remove "-fshort-wchar" from efi-common.mk and add it back by
>>    x86 and arm64's EFI Makefile
>> 2. Add "-no-wchar-size-warning" to Arm32's linker flags
>>
>> I personally prefer option#1, because Arm32 doesn't need to interact
>> with EFI firmware, all it requires are some stub functions. And
>> "-no-wchar-size-warning" may hide some warnings we should aware in
>> future.
> 
> I don't mind #1, but I think your subsequently proposed #3 would be
> the first thing to try. There may be caveats, so if that doesn't work
> out I'd suggest falling back to #1. Albeit ideally the flag setting
> wouldn't be moved back (it _is_ a common EFI thing, after all), but
> rather Arm32 arranging for its addition to be suppressed.

Or make Arm32 use -fno-short-wchar (looking at gcc code this should
be possible) to override (undo) the earlier option (possibly isolated
to just stub.c). I'd prefer that over #3, really.

Jan

