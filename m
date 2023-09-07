Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A857972EA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 15:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597401.931637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFV8-0006BV-18; Thu, 07 Sep 2023 13:56:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597401.931637; Thu, 07 Sep 2023 13:56:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeFV7-00068L-UO; Thu, 07 Sep 2023 13:56:53 +0000
Received: by outflank-mailman (input) for mailman id 597401;
 Thu, 07 Sep 2023 13:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qeFV5-00068D-Mu
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 13:56:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63e72665-4d86-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 15:56:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 13:56:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 13:56:47 +0000
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
X-Inumbo-ID: 63e72665-4d86-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqWLCa40NxF+Sjxaj6DI4nDgjSYvMSs7JPsSDtMyFo0kWs2O/f/bEJagzPPmcJW8ZSWBar4G/ciWqLlgLSgv/zhiMnw0UdutBAFwiBzk1CxNopC+Yn+UF+f4Ffsd968MJ+RiaJ73hJOGypkeP+SbqZuwsL6fW2II6dxtFwpp0Tb5wD91/qKvol9KM55gYAMyoOnLiZhDZQbQ9lNa2SkVmDppS33993HrvYkjaiPnNjH5ycyWN+WAK5diRbeTGxE0KpCGsNRx1Q9xpABTBS27L8PVaqtgoAiobj4iWFKrgL1rakg4ogEBP9i1kurRqp35+tvXP2cEFgdTykhE3aoiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ng0HYZOhaSnuIsrP2KuWNHb1S8yZGKsiSfx1z9VpvR0=;
 b=XKs6uv0pMI2cQBCU2QGHTUJX3RYem/r5waQ4O6WxEobDZctomBvz7P4Cwv7W2wxK9P6Jt2jYpdA7y1dNWIE6AbXlNWqf4UHuOUt8qrSRB+6NDvR9Ckg9c1zRZbCkAtHpuFrt7yckW0yH1WlgpHhWAorHsEd3sdLWdm5beOz6Oa/QkiFKGObRn4FDM/HUbk2/29PwSdC2312zSu4/yV3PJiDasIUanLikC846jpb8oRq7QTT0Sd4h4bjcjIa6cCgLpMd1xiEACtauof9YdOdqJrLWCbagdvMx8Y6JCNF+40jJM1VDh/n2ESGea2rGdhs35/i+VGR4aJx69ZfvAEzz7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng0HYZOhaSnuIsrP2KuWNHb1S8yZGKsiSfx1z9VpvR0=;
 b=KMsukIe18gNL9Ylklmy5DAabswDy4jgMD6sr7LTzhNJqkuxzbmrN4PVt3wmuMeNtrlHYllGeekpaOnrWSVyV+ZtNLvAwbWOGuKzxQLHBRuGz3y3pAZWmh1oRiZ0WlcWjzjjTm4y0i15sDkCxtVQlgmvZQJCIKyGG9r5Nw+G91aR81dYKDwFrfJDleKrVyadvKqXW+tvaQ4D0bZ6kedusvw04cnj9MV05Cpb5SXrRQejqwEIn89dkR7E1+TSs7MudItRKpZtX+BFz0+rMGHWK+couP+ksJLlI+hcQUc6lYj97cSzz8iZpFYoQY8JEUTAaS5yEBMndpimaDdIoIVDdeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <151a04b2-57c8-20f7-0bbf-0bd1c7c73e97@suse.com>
Date: Thu, 7 Sep 2023 15:56:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 1/2] xen: asm-generic support
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694078544.git.oleksii.kurochko@gmail.com>
 <cf5f446915bd5c8980beda22718efff32678e16b.1694078544.git.oleksii.kurochko@gmail.com>
 <fbc5ea33-22c1-52a5-dc7d-97ba29e06e9d@suse.com>
 <39d85cdb68d29cc83743da703539f9c536ce7ded.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <39d85cdb68d29cc83743da703539f9c536ce7ded.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d94087-61bb-439a-bb5b-08dbafaa46f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MnoGA24EayKJpviSd8LNPAtMeWYVNRszfpx/Ek+3ZYpPPa4is8RwlQ+s3j+B2wbJOU+VTJJYAIpmyLnCrpT2XOAiPvdBDNVIjo1Endm2wMaidE26qaw3Nwppylh3o6DEUokU/0S+RGZ4FeSPd/yYwiF7eWZkQFaWIjYOUogClPyeqc9lR++J7jQ1gDCxqn0TRFSMFsI6+PPMCHUpQxBTXh5AqDVrdhUHq/2VqheVXSw/SzCc/9iEGUE1vgdQ/0iiC+eTMhr/Z4T1rzPq70M26Hw0atE49r3NBYCjpObIGvcs53NUGWw28KCYYYeV6/M5sLr9d+mH/JGivBkgxVj4mUbmytWE5+KkcdJlKwi3SOK6Da0fWjez6LwVBdbvOoiqw2Mj5hA2Wb0JIoAHQ/Vi1r9WW8MH6+1MEtid/ieRLHjdRXlCcjhCo/xATSv9i0f12sFfmBFx5zTggBET/rAh/L+cRyWuO1mUjVeyoaecBpMFhEr0Vs1pGz4VcFSG1jRv4PCc2YkcusCWTyF4Z7hedxNcjZX0Mctn/zvAzOIP/sl1Wt3fe3xwzic93VAk0LwNMl37JUA1+aWUgAIPw8Q/SvLi2TmElck3KHInVonmgYAzLNXxWclVHjJPmMI7/Hy8CMQlFeUzqq933iH+vOtTfLa/tI87ubsfKk21RFe6iwI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39860400002)(186009)(1800799009)(451199024)(2616005)(38100700002)(26005)(6486002)(6506007)(53546011)(6512007)(36756003)(31696002)(86362001)(5660300002)(41300700001)(66556008)(54906003)(6916009)(316002)(66946007)(66476007)(8676002)(4326008)(8936002)(31686004)(6666004)(2906002)(478600001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzI5c0lweGJ6ZVhkc2U0dVU4dm42d0RUNkZPZkEvdlliSU1HU0FSYVlKM1Vh?=
 =?utf-8?B?NUowVmZ4OFFkSDNzYVN6S2F6T3pLdllIMkZRb3pvK1l6T2srWHJTQlAvZnp0?=
 =?utf-8?B?TTF2cU1XWlRlZjltUFRlelk4TGpnOTZvdUxsN2pzMEZlUDh6ZURqN0RRMDRu?=
 =?utf-8?B?Sy9GVDhUZms3MDlsa0swTFl3dS8waWw0NlB2OTFWS21scGtNUmNXUmZrSG9z?=
 =?utf-8?B?d2xxOHNwc1J1WUs0Z3hGSXJEYVBqZ2U5QkV2RGMvWWtObFhpeTVyQ0Z2ZENP?=
 =?utf-8?B?Q0F2U1BYQkNjOGJVbnlJdkQ0V1NqZzkxSW53NUI1ZDlyQmg4YXNwZFBBUjZu?=
 =?utf-8?B?UVI1NVhvUUN1OFJhNkUzaThBN0RnSTRpTDhlMUxVemo0Nk1jbzgvdUM3bmhx?=
 =?utf-8?B?UmpBeFV1OENrSDgvNWFNWHl2cEJWWmFrc1lDRkpXVFpLeHlQaXZvTXpIc2FV?=
 =?utf-8?B?dzhXYnVZYXlwbXRxcS9UcHdIVCtudVR4QmFucmhjRzd4R2FCbC9lQTFmWjh2?=
 =?utf-8?B?R3lwUnAxODRWQnpkOG92Z2Y3c3RSQ0pZQ3NraDAzM1JTNHczTk84NzU0bnIw?=
 =?utf-8?B?OXB2TElJWHhDT2J2bFBrN1ozZFU2RzFPaVF0TUMxN2xqWDVEektadDhkVTJD?=
 =?utf-8?B?clZnZllFaHBKckp3cFZ2UzNpQmlMa1hNZmZSNnhHalZ0bkFmdG9ndzdENkZ1?=
 =?utf-8?B?dUxNcVIzckhPNnR3THp0aHNjNjkvd3FMOGRxZXVlRE5ISi9YNGdadzhUSFZu?=
 =?utf-8?B?eUc1SXZsVEVkZ1FMQ1VOejhXOUNaMERnS0syNXcvVGEzbWZqOVpIVXhGVmp1?=
 =?utf-8?B?czdLWVdwVXVHbDFya1VVTkthT2N1TnpnZ1ljV1VCSUQvbWtEbUVya2RLbyt0?=
 =?utf-8?B?Q3Nxakdnb2NHZTBzakZxbDE4T210VitwdXFUSmplZkpRMHFwQjJCZnFPYk9m?=
 =?utf-8?B?L3JQZlRTVjY5eTFzd2xNR1MvK3lwa2JhN1krNkpURHlBb0hIMWU0MVRNQWRx?=
 =?utf-8?B?dVVKeFA0Nis2Yll0emdxNWR4bmdvaGE2RHgySllBQVVXbmNYbzN0MnI5TmNJ?=
 =?utf-8?B?czFVREFsdlhBdlB5dDJyWEgzQ3NtcWRhV253S1hkRnIwUS9aaU02ZkdrdDVV?=
 =?utf-8?B?aTh6RlpPMHZIVDNnNjIzN3VCdlJ0WWlHK1RFbXhuWHVQUUJ1L1RnN2NWSkVr?=
 =?utf-8?B?YzlsWnBjZ0wrcUVoWjZDRm5WSTR1TGdpMXR5WWFuOXRERjhaNU5iejJ0R1A1?=
 =?utf-8?B?WENTNnF2NGs3WjY3VXZidHc0WnI5amRhNVB4U3VuM0FTKy83OHlSYU84c2tN?=
 =?utf-8?B?dm00ZGpGQ3RQN3hNQkl0K1BleXJJcW9ndU93TzdhWmtpc2IwMjdXU0x5dWl4?=
 =?utf-8?B?UUp3NDZObThxcysxd2pHVlBINGltUjIxdHVDSjNZTnhUVWtZV2FGdTFXeEZy?=
 =?utf-8?B?UERUeGtGY1ZUM0pnTU40UXV0cGM0MnBEV1h5MVExelFQZXlWL1crWEZKaFU4?=
 =?utf-8?B?K0t2a2pHRXR0M2RtYzFCVGFGaGlvblk1dW1IWkpCdUt6R0VoQXdSVDAwUXBI?=
 =?utf-8?B?emVnVkZjZExIMnRwWkExRGYxa0RDVm10UWNTSWhCU3R1L3lOUWpPYTF0ZUxq?=
 =?utf-8?B?bXFqcnhjZWs0dVpLa2EvTGpCUmEzVk5YaGQ2K1JBRlNNMjBhakZBeWZFZ3dU?=
 =?utf-8?B?K3RVeGZPRm9iSWhNM3lsZkNERDVqZnJQaERLd3BsbFRDSTBFSnFFeEFDUXdt?=
 =?utf-8?B?d3lEdTYxZmp3YkxEemw5dkdhQXhGSTNmUk4razRiUmYwb2s1aUZ1QkZoVXlJ?=
 =?utf-8?B?a3VpUExTc1V3eGsrUm04aEFPQWNER2JrQ1EraVBUMHAyUHpPWnBIbzRXcWln?=
 =?utf-8?B?b3M3Sy9QSGVrZU4veGt1YVN3Z05qTmRVWFhnTkhoSkxUd25aS3FMTkxUWVF0?=
 =?utf-8?B?TmV4OFdoUW96a3hLNFliRDRZZUxtdVZwS3FQS0RMdFFnUCtxR3ZMV0F4dEdL?=
 =?utf-8?B?dmxPSGFQS3RuOTJBMml0UXdJNTg5SUVaYkUzS0Q0NE9xZXdIYkxVWTNFdGpY?=
 =?utf-8?B?MCtHcmMrcEp4LzRDNmY1a0tCUFZaZjNaMlpiMk5YTkY1T1NocEZCTnkvK09r?=
 =?utf-8?Q?41AIQFsOJtOzV3Ki/CF10bkOJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d94087-61bb-439a-bb5b-08dbafaa46f6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 13:56:47.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKkwYVFdh4HDOswopXqacm6ikn7Uc4f9q1K25N2qnjgMf5urBDr9sSEv1zdGiOOWRxAIjiikrMjNxgpy32rqrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8366

On 07.09.2023 15:45, Oleksii wrote:
> On Thu, 2023-09-07 at 12:48 +0200, Jan Beulich wrote:
>> On 07.09.2023 11:32, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/scripts/Makefile.asm-generic
>>> @@ -0,0 +1,53 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +# include/asm-generic contains a lot of files that are used
>>> +# verbatim by several architectures.
>>> +#
>>> +# This Makefile reads the file
>>> arch/$(SRCARCH)/include/asm/Makefile
>>> +# and for each file listed in this file with generic-y creates
>>> +# a small wrapper file in arch/$(SRCARCH)/include/generated/asm.
>>> +
>>> +PHONY := all
>>> +all:
>>> +
>>> +src := $(subst /generated,,$(obj))
>>> +
>>> +include $(srctree)/scripts/Kbuild.include
>>> +-include $(src)/Makefile
>>
>> With the definition of src above, is this correct for out-of-tree
>> builds?
> Logically you are right and I think it would be better to use
> $(srctree)/$src but it works for out-of-tree builds too.
> 
> $ CONTAINER_NO_PULL=1 CONTAINER=riscv64
> ./automation/scripts/containerize make O=xen-build V=2
> XEN_TARGET_ARCH=riscv64 -C xen build
> 
> $ ls -la xen/xen-build/arch/riscv/include/generated/asm/vm_event.h
> -rw-r--r--. 1 ok ok 34 вер  7 16:27 xen/xen-
> build/arch/riscv/include/generated/asm/vm_event.h

Oh, right, aiui because of VPATH being set to $(srctree), and therefore
in the absence of a Makefile in $(objtree)/$(src)/ it'll go look for
one in $(srctree)/$(src)/. Never mind then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


