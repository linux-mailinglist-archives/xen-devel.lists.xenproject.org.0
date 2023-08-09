Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8931776249
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 16:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581173.909751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTk5C-0006vp-Ig; Wed, 09 Aug 2023 14:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581173.909751; Wed, 09 Aug 2023 14:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTk5C-0006tT-FX; Wed, 09 Aug 2023 14:22:42 +0000
Received: by outflank-mailman (input) for mailman id 581173;
 Wed, 09 Aug 2023 14:22:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTk5A-0006tN-MR
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 14:22:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 319862e4-36c0-11ee-b281-6b7b168915f2;
 Wed, 09 Aug 2023 16:22:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB8012.eurprd04.prod.outlook.com (2603:10a6:10:1e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 14:22:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 14:22:36 +0000
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
X-Inumbo-ID: 319862e4-36c0-11ee-b281-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5QLnH2jERA6yEMwuOCkT514wN5yq2V+N0N3v9/RFjnoHoPQk/0h59u+gU5f2nraOTFxa4b5QKIyYfQh9yNvIj8ToMuYxw6S26t/21Wf+p/FfKSrDQKM7VYWnbxMOkaTK8fZ35mweb7XZ89ysnv/A+wsNIIgQ1wFJdRJwauDxU+IwthYi2/GraKeMocCZWGck/HbUhf3d1uj9ctOJ9MSYCiC/hHPdXgVsVGprOy9Q6eK3N9GKRSZUvqakQRrDfr0dabUcWHdOY0xjxc6hBxJ/7Ec+bVDwtYcpKFxNgUizHy03H35gR+HwatoFO4BO1RYhyrgfODYKWftiT2wqzJ+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgM5Mt6ivU6EM9j1oL3VKfq3p/kvqxSG+6Cr5YWWDJk=;
 b=XE99X53Np0lt/vCvvvbCT2VElFi4XSnyJS1cLrJiE0z7emc4Z0j59ULYvtNuujstKu5+PO5Cp/NScc4RqfjmGvodnri/bV9LtXb5vm8liquypSwtewBIqlFMyLLnZ1dtcXzdekWOk2SsRbig1aAHKjvNy6gyEUCwxBZlR6XjyGYLE+j4FvV2YL8rANmoyE4XG4MWY7NRDXE16vdQf0e00WQncbpUK22wDGy1OMIYwmlNwak3ePpP2oveVdW47MY5tyExgFxNSDExLNtKUqdxGtlhzUMDO5SKyDih7z00Yvu9ub21YEVMOUIo+6TFZCJYAAKOWHgWlD0zdcH25+4INw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgM5Mt6ivU6EM9j1oL3VKfq3p/kvqxSG+6Cr5YWWDJk=;
 b=vTFolcHrBc/beWwYJqSGzSzt9+8XqgM5dFvgin9qs+6G9NPJKafJQKs/JfY41CTL55ZN627/B5DVV5+Y0l7AkmB8WqcoDvU1vw+v869EWnnD8DfhnrDVdVkaajr4DyyKN3kDbPXNrzuuUBgjShNHZT/n3hCpTAc2CPvWix48X6rczSZHX3xR29Y2MsRVllPU8fWUbnp59JtObwJgRcn5d99QUrO5cAQ4Danev/V2Rjzh4a9ppSMqqNXhUk9vtCrOSsQg1ZubhzYdc6tNmvEamnAo+1qMyLB3gFZe1UZc/F/gWezgGVNdFzdzYldYtMvWKAP/V02+BqKKwfpkuyUHDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <30cd1bdb-be77-a192-eca7-6fcd60eca610@suse.com>
Date: Wed, 9 Aug 2023 16:22:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 7/8] x86/i8259: address MISRA C:2012 Rule 8.4
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <41edfbbbc8fae317ebee791633259d7b5c88a2c6.1691575243.git.nicola.vetrini@bugseng.com>
 <d752a7b5-4b8b-8394-8e72-bcdffce1fb82@suse.com>
 <1cfa92d52d89b2013218cef1c518ab4d@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1cfa92d52d89b2013218cef1c518ab4d@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aabeb02-852c-4fbc-7346-08db98e413f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mMz5HWvqXr6OxD4YMZmuj4/9OEHTOx4Z9gy/S7Ah6HYyqn0G0vpsKEjZ6QAn1dSOAus1qYKXDaTrrs6RB7vsycgO5jrY0PVnMsF9kjE83AYos4vLGinsRTypRy9SfF/kvDCmhMTRNpjecE+lAMSbv22M8Y1XBrFzR2DKZvW7g1kDnkrBFEfkMoEnt5bSJE1SFpYAl+SPjr7mmGZ6Ip+FeJ2PEWBNaifae6PJYwdRqd1zG21zwZeCcRtuisWM4hdXdiLTIHhV4/0Cg8tzH/itlXErDWatQWV/rX/Yh+8Njkx5w+X1cueIB6IRRd0FyETxk9gJ/i+LR7BnSaveNomkKIQ74xhorfLCCi3Gq/Op4OyvmUp+GmZLK7SmwfwpxcSADeRlvM+2IyxxJ8LuCb7cg6Mrzsy41EZwiuQG32qN/6PlIchaBmdoSi/MaurDbVKMekH6g4BBH6hhXRMG2QFrFJzGRrxpYxVni/4QL/f2HifTxQrM45drNCppkFZpqmUCorcvWJKx4ffiUb7XHeX+9f8ftqNYOMl326Autsq9DvMHyftMGT3ohbxaHxvSlH9fGxLBy///fuHkc2iYAfnJy1ATjdArqOTNT5XSx2QUxa+azPkA/WJGeeu/vtq3OEpM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(376002)(136003)(396003)(1800799006)(186006)(451199021)(31686004)(2906002)(7416002)(5660300002)(8676002)(8936002)(41300700001)(316002)(66556008)(66946007)(66476007)(6916009)(4326008)(36756003)(6506007)(6486002)(6666004)(6512007)(54906003)(966005)(478600001)(26005)(31696002)(86362001)(2616005)(53546011)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHJ6M1hKWnEvRmk5YkVIMXJDVXRIeWNMZU1RK1QxaUFYOFRoWGtvSXBhUE4w?=
 =?utf-8?B?WEZTMWFJWFNPWGx0clhlMTU3R2JiNVVMRkNiSEtPMXRYT1dXMHJBdUtKdlVM?=
 =?utf-8?B?RlpMUWRYSXlVbXpmaVpNcjFHelpTUFZaS21BL2RMcWVpYjRJNWhSdXluWFVQ?=
 =?utf-8?B?aXhsZk1xRmNwRm9adTlZOUxXb25nQ1czOVdBdkU5ZCsrcExzNDhWQzYwRUIz?=
 =?utf-8?B?WDExb012b2MyTDBNSE1naUltVStBRkxoVEtwdkFhWkdGU0ZIT1RqMWJUSHVq?=
 =?utf-8?B?RWJqN0hDUG8reVpLUC94TzlGSHc0TVdSd2pUbTMvc0ZEQWw2QmpJajNkWXN1?=
 =?utf-8?B?UmYyOXdQK2dFOG5jajRFcW9aMVVWN1Q2Skx1cDhSY29SMHI5bTBNaHJuNFJw?=
 =?utf-8?B?alFieTBRZ0xzWXpxM0tZcFFRQ3d1dHBxQW9xUWo0WFFaY0lyeTd5WlFLanVE?=
 =?utf-8?B?NGtUd0w3YWloRGptR2dwMkU4TlBxM1I4enFVTVNsaU91b2tONUZDSUVPbU43?=
 =?utf-8?B?aUMyNXNXTTNpU003aVM3TnNzZkUxL1B1cUVTVTREdnFibmlWcGRma0hmK2VU?=
 =?utf-8?B?cTR1L1k4UVJKZEpuOVNjV2haZmVoQ21ZT3lTSktrMm9hUHdZUE85WXgyYWs3?=
 =?utf-8?B?OWIxWDVpclZsVHQxVWVEelRzM1dxRi83ZlRHUGt4c1RidHBUYjlsamlRekxj?=
 =?utf-8?B?bU8zR1hneWo1MERQUTB4MGcvc3F5a3RnQXhTWUFUaDVvQ3AyL0JQQ0gzbzh3?=
 =?utf-8?B?K2F4ZlEvTk5NTGpwc1hFRzJZbTJaZktJbFVDTjR0ZExnM043YnZOaTNDcGg3?=
 =?utf-8?B?cUJMUUJZQllLeW03RU82QnNubllhNW11VTdtcng3OVpNaEgxdEVjSlB1Y1Nx?=
 =?utf-8?B?WHFDSEhYT0ppQUhtdjdxcHkrVU9kVlBxQ2tBeU1sdkR5bmFhekszUldYMCsy?=
 =?utf-8?B?Q1I4WVdaZmg1cWZzL3RQZmtmMjRQbGh4Uk4yTFdudnNhdjNXTnRad0VKVWpo?=
 =?utf-8?B?cHI5bHozamlWQkJySkxLdWtpeVJRUTBYa2FncVc3SVJlVkxicGpHTUo3L3VZ?=
 =?utf-8?B?aWVFWjBSVUpjUUNRcy9aUUcwYkY3NnRXWWcyNEVlV3pRMThpQlhvaTRVRVV4?=
 =?utf-8?B?azUxdmIrQ2liSTlwVURzN25yclNSL1M4TEdneDlsNk5nam0zNkh1UzZTTVdS?=
 =?utf-8?B?RGs2WVJ6cXJ3a1VjalhXWExvRG9DSjFkeVJjMkJ2eXhKZjQ3V2dnUEdTaW1w?=
 =?utf-8?B?VElMU214anhwNUt0YSsyS3RxWmpueXFxd28vUU1NOGRkRlo1RVhETmdNL1Qz?=
 =?utf-8?B?UEtqUklYOCt3Mkhxb0owNnBweVZ5c28zNFVGRnp3N3VuakhSME9CNGlHMlBt?=
 =?utf-8?B?blpEWEh6eVQwa0tNc1ZMZ2NDUTF2WXpHSy91aEpTWERvQkJwOWtwQ0JielVY?=
 =?utf-8?B?RlYvaC95b1R6bW1KajBPNnNBTHB1K3NMZ2U1ZWFTdjR4dWxSek9hQzY1WlBv?=
 =?utf-8?B?cWxtZTVWQkcrajEvMWVPYjdmRjJSN3U3UXZYRGgyRFg2Vm8wUXpld1hBWS94?=
 =?utf-8?B?NGJ3VmxCVklRWlc1K2VrQWFUK3B0ckpzSXZTR3ZmdGtFMzZPS2V3SUtEN2tF?=
 =?utf-8?B?M1R5SVVwZ1hNRWF6S3Y5WGNhclJnSkcrdXlqTWRGK2hzRHZndURsdjMzL0R5?=
 =?utf-8?B?azNNcWozZmpwaGVUemJHcEZNcEhnQnNWU05qR0tEMlo1V3lzVGpZd2JLSEhJ?=
 =?utf-8?B?T0VpTFBPUFhORTBmNWpGTjFHZFNacjhTNC9temNPTjBURDBpU3R2OEhmQnFj?=
 =?utf-8?B?OHNZRk9QOGR3UVdiaWVNR1hCYy9Ha3hXOUZGb0lGaEJzaExsTEthN3ZPR3Zv?=
 =?utf-8?B?RkpJODlLeHdiNGZoKzVmaGN1dGY4UGQzU1VOSzBCRzNCcnZGZVdFMGtZUU9V?=
 =?utf-8?B?Z2RRZFFRdTNRVWhSN2hJRE1rM3dRZUZkYnhWNm5IcHBXWE5mY045UnRwZ0Zq?=
 =?utf-8?B?OE9LVXJNUUxEZ1Bkc2I4OTNzMTNYSHUrbzhrQkhVMmRDUlh5NjlraVk3NTFv?=
 =?utf-8?B?eTJaYjR0VFZROUc1Sm1yR0NkcDhvRWZHRk1HaU1mOUtGVFRHSjZQcDIrK1Bl?=
 =?utf-8?Q?fBLI2u0/j9sEdzL0sAjlsQyd4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aabeb02-852c-4fbc-7346-08db98e413f6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 14:22:35.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjoJndRK12XdcoTw1YhIHdsaLXFWbNRgrEitLzlOQK7yqaeJZ/I/YmOXVs5e3nyng/I6Ccm9ekCCMVy+pOxq8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8012

On 09.08.2023 16:17, Nicola Vetrini wrote:
> On 09/08/2023 14:52, Jan Beulich wrote:
>> On 09.08.2023 13:02, Nicola Vetrini wrote:
>>> The additional header file makes the declaration for the function
>>> 'init_IRQ', defined in this file visible, thereby resolving the
>>> violation of Rule 8.4.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>>  xen/arch/x86/i8259.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
>>> index 6b35be10f0..9b02a3a0ae 100644
>>> --- a/xen/arch/x86/i8259.c
>>> +++ b/xen/arch/x86/i8259.c
>>> @@ -19,6 +19,7 @@
>>>  #include <xen/delay.h>
>>>  #include <asm/apic.h>
>>>  #include <asm/asm_defns.h>
>>> +#include <asm/setup.h>
>>>  #include <io_ports.h>
>>>  #include <irq_vectors.h>
>>
>> A patch adding this #include has been pending for almost 3 months:
>> https://lists.xen.org/archives/html/xen-devel/2023-05/msg00896.html
> 
> So do you prefer going forward with that patch or this one (mentioning 
> it
> in the additional commit context of course)?

I would prefer using the much older patch, but of course this requires
someone providing R-b or A-b.

Jan

