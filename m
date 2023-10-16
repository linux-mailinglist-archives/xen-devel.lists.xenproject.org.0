Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EA87CA462
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 11:40:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617382.959929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsK5A-0000LA-5v; Mon, 16 Oct 2023 09:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617382.959929; Mon, 16 Oct 2023 09:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsK5A-0000Ht-20; Mon, 16 Oct 2023 09:40:16 +0000
Received: by outflank-mailman (input) for mailman id 617382;
 Mon, 16 Oct 2023 09:40:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsK59-0000Hn-CU
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 09:40:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01a97a14-6c08-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 11:40:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7200.eurprd04.prod.outlook.com (2603:10a6:800:12d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Mon, 16 Oct
 2023 09:40:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 09:40:11 +0000
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
X-Inumbo-ID: 01a97a14-6c08-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2Y9164+N8JUdydPt5trhTcsYrrbBUFCa2ht07HWlddh1XmgGNkbaXQedYnwgPF1GlGRuHLsxi73JtrdDrelDaKSQbJl6kusSV5leLFxSoX0oEmdfbPK3zW10ohPtW4znttcPND46zoRQBI0z9btG2tVxDGQ+sG0wBs515teqs3sES11Iu/VsUgWJ2YW1ML1Gbswwb9WKn/cbYBEwmTbk+qoTLdBgDevLUPoZLay1P0zjvoxD9/mW+lB91Qye0YVOOJsYfu/Hz7Z0INFBiSnmBRPADib5Ld/J33ai3+5tcZzEArKOTHqQqHLQLLR33oFCfSF2OODpwUqvi06JIJxbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wrSTUF5KzmL66Jeo8UYNQi/p5HzfM/PUG9gHINqfHQ=;
 b=cWD956IkAFnkGkuGgHRsS4zQrPRXTUcSAq2CmxsgX8XKi5IoipfblEWea/6wEboNAK8jW23ZCQyktCgatdsQSmX+SLcXZ7QGhbGJUGsM8MKcwrhfO5CQmPMEoAgje0k0R20r5aVyRbyIpBv/rB9H0wojMjcTjx+CVGWFLLhYq5n77d57r8AOhBkKZcYdWmf4uSndY5RPRZ+E05Jrwv1aw45tIrT45/z4J1FsN62yfkcKCQ72XzS2ROuf9Dq34qdb3rODzk7lqKwkWXoPZJKnsRc2MNnUrlWfWcYnbljjlfPUEhNIKq21yXTjIXTA/lIZokl2hlXPCTWWVL+4sqj11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wrSTUF5KzmL66Jeo8UYNQi/p5HzfM/PUG9gHINqfHQ=;
 b=UHa0Dt6mgMdN/4wc4LxBSgTYDkGPhG8dK+GTxez4ruLapj+J8oBv04lkPh6C8v8mVILWl7ZDzPWXdd79RNg4oGRGlcZDHX1EMUZvRfBy/7S7JH8GDauH63Kjucy+Vmr/xGBsPeikd3+YIU0W7WmF0GJgRG2OR9ELixGOKtWAzL7xfDYj4qV5sc9vhQu3FWe5C5Brw01JeqwWHY2xev2yXQCpBP4sG2bZYRMWHev5khw4f/MkJB+wcrCetbYxlvE/cdgtC/DX6nUN3ctcqvkQ3fMp6Y8KKSCmSQgGPb76DePTvmqcCdwdfNpiVZkBkblEd+LSckCvAclJMk1Qvv3WvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55dae9a4-16cb-f252-c2f7-ded611efb78f@suse.com>
Date: Mon, 16 Oct 2023 11:40:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Henry Wang <Henry.Wang@arm.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: 6637c8c8-6332-49d0-0328-08dbce2be470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	97yplnVsKrTsZ4kYpqU7svToBENEF+jnnUl0jl9Ghxda5mtVuE5ZV9Ndb6AqTRll5FFsPdsNN9UTyW2U3dsTf+lF5d/OBUo5mvzO5RDfXcKkTAGI4NO6Yo9lfVgO1KUA8pVsbl2mUIlC3vvy6n6V04vcOiXji9S7PceMnJxFl1187x2DiR3AJltxvACXomp1kDqcqy1dcXwzlG3M/FD0i+iH0dx4xdXMxLlzmmCvBXox4x0DsHXW3jQJ2co2c5kYKB+Zz7Fr8Ft9xup+8KgSoQXpbT501Yl3hDeMI57odTIaWkaBoPqpjFo/nZw6s8V3VEXpV8h7cx2ShJyCQ3xa5VfUlILLX4+5pPSOdN2AbAOobRy6ilKlNCc68bV4Uj0EzNbIjV4R7kGdnq+uoQ5ArlXskRLxydWDuTCIQye/jonpYM72Vp2vSdGwh9in5yWeQGbfI9dHbljO+Ofy0yUIaBqpacoAsdS3sEwwsFCwUhSxjZqdZq6QMGPKyJoD0dQb4hOq+Pyr1+s6pFKpVA/Q2HFhvk6VVdf3NM2EDE+uSnCyYj7bmPf7kSAr4boaAlidZocZTPrn9mRg/a2HjXhe8kc4pXXLR5/Lg/V2BfVMWd6SgckQghL5BcNq4ORnUPZgkXqDKW/9iJcodrDuNXJ15A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39850400004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(7416002)(6916009)(2906002)(316002)(5660300002)(41300700001)(4326008)(8676002)(31696002)(8936002)(36756003)(86362001)(83380400001)(2616005)(26005)(66946007)(31686004)(6486002)(478600001)(6512007)(66476007)(66556008)(54906003)(53546011)(6506007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzgrMlh4MHdIZ3hTNVhVa1l3cTdUeDZ4VlBrSWhVa3VhcFhUYkJjK3hrZ2RH?=
 =?utf-8?B?SjlCMkl1WitDdG1hVUk3dUgzVGJBL002aVROcEJVWG5adWp0RVlBV01mTHZR?=
 =?utf-8?B?QlBvNWRLV2pMTlozWUpxOXlXTlFaYTRnV2hLK1poeFJYaSszdW41VDJ3S012?=
 =?utf-8?B?YjFpQ05oREk5M2tYZXhPWC8xUEk4V3dib0VhNXgwaXVqOEZGMzBhN096a2RV?=
 =?utf-8?B?NVhpaFNWN0ZrSk5yY3hFWmxocFo4SzY1amZKb1BPQklkaU9ENS84VEU1TFhQ?=
 =?utf-8?B?djZmMjVmNkRIUHpXQ3lTUDhPbGxGNWJKT3MvdnJCZ1pIODZvRThBS0srbWxR?=
 =?utf-8?B?VzZYY01pU2ZTMkQ2WW9UK2E1K3ZYTExWWmwzOTdoS2FXUUVacW44aDBpWTd0?=
 =?utf-8?B?TXIrUzBxWWRpdGNTa3VJY0VpNjJvb25scStDbVViMkluTWl2Z2tjdCtWOTVx?=
 =?utf-8?B?NmdOSVdoUGNWZUlNbUxrU2VXcStwUGJBR29idlNhWVg3Rlg3NE83R0FwMHZN?=
 =?utf-8?B?UVhpdWs5SlErcDlQdmhWMWNnYkF3MlNleERFUkMxUW83eU1qNHZaRE9SREtJ?=
 =?utf-8?B?aTFJSDdIcGM0VU1jU3JOSTlaeVVlT2hRc2Q2SmQrK3g1NjJydVdBOU1zd3dD?=
 =?utf-8?B?MkFhUTFVWXdPWnVpRW9qTDcyVCthYVVGcnpJT1VjdkU0VGU2Uk5qQmFwbDNL?=
 =?utf-8?B?bWVRY3lXcWZ6WlZQMFNhUEZoMVVEWkJkRFpSbWg4OUg0S1g1QVJYNGcwWndH?=
 =?utf-8?B?WmVJL2w4TkhVYVRpSUdpVTVHbXpzeDVZZytWTDRYcFRHSWRQdXBLUmpXZC9r?=
 =?utf-8?B?UTRNK1BUeFh0OERHVXZmRnNNQ04xc3p3aGtIQ0Z3WitnRGhLRlJ0UkZjUVVK?=
 =?utf-8?B?Ukx1U3F2VkI4THdOa1NES2FLRXoxaDdvaFBTc1B1WnRIMkRjYkJ0SkVRaXk0?=
 =?utf-8?B?STZ0UE50TGY1cS9zb0U4QndXUThtMlBWcWZ6TVlGaHNVVm9tb1huSW8rTXBk?=
 =?utf-8?B?TFlrajM2eDJpSnlPWVlOdnpuNCtxNE1PZ3pPWkFZRlNLejFwLzA0VjBXNEpN?=
 =?utf-8?B?QUFXTmJGQUowOXRPc0xDdSszQjUwZ2pBQmcxMWkzUDdaU2NNeHpHV01BS3hN?=
 =?utf-8?B?eDZQY21YN1M1L0RtbGZFemFiMGh2WHRnSUxETjlSdjM0aFlxNWw1YzlIZUwz?=
 =?utf-8?B?OFVtQnBBVVpSQWNPcXBFYVBiUEZGRTlOaERMbjM5dW1MNFRxKzRVdFJLdklZ?=
 =?utf-8?B?aVdiVlNCbU9INnVUem02UmV1YmM1QVlFamdOTHpuUGNZNTJ5Rms3Y3VEQnlQ?=
 =?utf-8?B?YzBEUjRFcGgvNkFodVpTUXRDMnlMY2svZUplV05CeUkreTVLYi9SSDFwaFlX?=
 =?utf-8?B?SmNBMmZocThnR1k0bEE2cndzOTZWWXBMak1xUFUyLy9tQWpLVzY1TlY2c3JP?=
 =?utf-8?B?Y3VYZ0V3K1I5ME1IRmRlVkxuLzVRYW50Y1NWQ0laeHRJMHBiOGpXY0pMR0c4?=
 =?utf-8?B?WjhqL3dvK25SdTFFY0NPNlNSbGVIOStmc3E3NTZWREViTktPYmhvYXdoSEdR?=
 =?utf-8?B?eU5rM0oySktzbUFMNy9WMXlWVFA1c0JUZzRBK2wzQ1BxZlpCSk9STWhKcGdZ?=
 =?utf-8?B?NmVIdGxkL2FQVWpuREdzc1FWbHVZckRVejM1aWVwNDcvNWJ5ck5Ubm9ORm1H?=
 =?utf-8?B?SlRlWFNhSE10U1NmMGpBUkk2NzRqRUU1L0VxV1g5ajhTQks2KzNTZVJsdWVH?=
 =?utf-8?B?cGZBOXZhVzlmUTRLakJxUWxNTWhsVTMrU0Zkc21IMGRMWnlBeVEyUkw1THdi?=
 =?utf-8?B?VUdRL2p5N1BNeC85NlF3Wmo4NDl5cHhTZ1FwWGt5YitXaXVvVHlVZG85aFJl?=
 =?utf-8?B?UkF0KzFxWkFVdVlWWVNIV2ZvK1k2QVJOVGFQR1NHbHhBamNYWUY2b2xuNVVE?=
 =?utf-8?B?UU4vQzdYL2JZcmdGVzlGUlgrZDFQbmNoWC9CTEZxN1BWS1E1dVFaS1JGVjlU?=
 =?utf-8?B?cUpNb1I0dUxWdjNZcnFXTGQ5RW5lS2hzeUtrQklUOUdWN0lseGZWNEtqc2dR?=
 =?utf-8?B?RzJKQjN2QVFraVlKeTRPVGlENm9rWWdmRHgzKzNKVnhnSkgxSHp1N2xLbzY2?=
 =?utf-8?Q?rOgy8NDxPEZYLDQrEBaQtUeYB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6637c8c8-6332-49d0-0328-08dbce2be470
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 09:40:11.6970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nLxJ4hshPKE8Hih3K5+0+Ac8wwD5Uq2Rb7+tWCgB9tiEno5ZWjML+/hijPZIMLkMj0ciQ/2EwzOktLL5rThBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7200

On 05.10.2023 01:32, Stefano Stabellini wrote:
> On Wed, 4 Oct 2023, Luca Fancellu wrote:
>>> On 4 Oct 2023, at 11:29, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>> On 04/10/2023 12:06, Luca Fancellu wrote:
>>>> Hi Nicola,
>>>>> On 4 Oct 2023, at 10:56, andrew.cooper3@citrix.com wrote:
>>>>> On 03/10/2023 9:46 pm, Stefano Stabellini wrote:
>>>>>> On Tue, 3 Oct 2023, Nicola Vetrini wrote:
>>>>>>> As specified in rules.rst, these constants can be used
>>>>>>> in the code.
>>>>>>> Their deviation is now accomplished by using a SAF comment,
>>>>>>> rather than an ECLAIR configuration.
>>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>> "SAF" discussion aside that can be resolved elsewhere:
>>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>>> Well no.  "SAF" aside (and SAF does need fixing before reposting this patch, otherwise it's just unnecessary churn), ...
>>>>>>> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
>>>>>>> index d2a781fc3fb5..d0623b72ccfa 100644
>>>>>>> --- a/xen/arch/x86/hvm/svm/svm.h
>>>>>>> +++ b/xen/arch/x86/hvm/svm/svm.h
>>>>>>> @@ -57,14 +57,23 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
>>>>>>> #define INSTR_INT3 INSTR_ENC(X86EMUL_OPC( 0, 0xcc), 0)
>>>>>>> #define INSTR_ICEBP INSTR_ENC(X86EMUL_OPC( 0, 0xf1), 0)
>>>>>>> #define INSTR_HLT INSTR_ENC(X86EMUL_OPC( 0, 0xf4), 0)
>>>>>>> +/* SAF-2-safe */
>>>>>>> #define INSTR_XSETBV INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
>>>>>>> +/* SAF-2-safe */
>>>>>>> #define INSTR_VMRUN INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
>>>>>>> +/* SAF-2-safe */
>>>>>>> #define INSTR_VMCALL INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
>>>>>>> +/* SAF-2-safe */
>>>>>>> #define INSTR_VMLOAD INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
>>>>>>> +/* SAF-2-safe */
>>>>>>> #define INSTR_VMSAVE INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
>>>>>>> +/* SAF-2-safe */
>>>>>>> #define INSTR_STGI INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
>>>>>>> +/* SAF-2-safe */
>>>>>>> #define INSTR_CLGI INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
>>>>>>> +/* SAF-2-safe */
>>>>>>> #define INSTR_INVLPGA INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
>>>>>>> +/* SAF-2-safe */
>>>>>>> #define INSTR_RDTSCP INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)
>>>>>>> #define INSTR_INVD INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
>>>>>>> #define INSTR_WBINVD INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
>>>>> ... this has broken a tabulated structure to have comments ahead of lines with octal numbers, while ...
>>>>>>> diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
>>>>>>> index aa2c61c433b3..c5e3341c6316 100644
>>>>>>> --- a/xen/arch/x86/hvm/svm/emulate.c
>>>>>>> +++ b/xen/arch/x86/hvm/svm/emulate.c
>>>>>>> @@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc)
>>>>>>> if ( !instr_modrm )
>>>>>>> return emul_len;
>>>>>>> - if ( modrm_mod == MASK_EXTR(instr_modrm, 0300) &&
>>>>>>> - (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>>>>>>> - (modrm_rm & 7) == MASK_EXTR(instr_modrm, 0007) )
>>>>>>> + if ( modrm_mod == MASK_EXTR(instr_modrm, 0300) && /* SAF-2-safe */
>>>>>>> + (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* SAF-2-safe */
>>>>>>> + (modrm_rm & 7) == MASK_EXTR(instr_modrm, 0007) ) /* SAF-2-safe */
>>>>>>> return emul_len;
>>>>>>> }
>>>>> ... this has comments at the end of lines with octal numbers.
>>>>> So which is it?
>>>> I agree with Andrew here in this sense: the in-code comment is
>>>> supposed to be on the line *before* the violation,
>>>> not on the same line, so I’m also wondering how it is fixing the very
>>>> first violation.
>>>> Cheers,
>>>> Luca
>>>
>>
>> Hi Nicola,
>>
>>> Actually it justifies what is on either the previous line or the same because it's
>>> translated to /* -E> safe MC3R1.R7.1 1 */, where the last number is how many lines besides
>>> the current one are to be deviated (e.g. you can have 0 deviate only the current line).
>>
>> Just to understand, does this way:
>>
>> <line A>
>> /* -E> safe MC3R1.R7.1 1 */
>> <line B>
>>
>> Justifies only line B? Because I thought so, but now I want to be sure, otherwise it doesn’t act
>> as intended.
>>
>>
>>> Most of the times the current form is what's needed, as you would put the comment on a line
>>> of its own. In the case of the if that would break the formatting. The downside of doing the same thing on the table is that the first entry not to be deviated would actually be deviated.
>>>
>>> #define INSTR_INVD INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
>>>
>>> This may not be problematic, since 0 could be considered an octal constant, but is an
>>> exception explicitly listed in the MISRA rule.
>>> For the same reason the line
>>>
>>> return emul_len;
>>>
>>> is deviated by the above comment, but putting an octal constant there would for sure
>>> be the result of a deliberate choice. There's the alternative of:
>>>
>>>                          /* SAF-2-safe */
>>>   if ( modrm_mod      == MASK_EXTR(instr_modrm, 0300) &&
>>>                          /* SAF-2-safe */
>>>       (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>>>                          /* SAF-2-safe */
>>>       (modrm_rm & 7)  == MASK_EXTR(instr_modrm, 0007) )
>>>
>>> to make it consistent with the table and avoid any "hidden" deviated line or, again,
>>> the modification of the translation script so that it doesn't use a fixed "1" offset, which
>>> is motivated by what you wrote on the thread of the modification of xen_analysis.py.
>>
>> From the documentation:
>>
>>     In the Xen codebase, these tags will be used to document and suppress findings:
>>
>>     - SAF-X-safe: This tag means that the next line of code contains a finding, but
>>       the non compliance to the checker is analysed and demonstrated to be safe.
>>
>> I understand that Eclair is capable of suppressing also the line in which the in-code suppression
>> comment resides, but these generic Xen in-code suppression comment are meant to be used
>> by multiple static analysis tools and many of them suppress only the line next to the comment
>> (Coverity, cppcheck).
> 
> As we see more realistic examples, it turns out that this is limiting.
> 
> Given that the SAF-2-safe comment needs to go through xen-analysis.py
> translations anyway, could we implement something a bit more flexible in
> xen-analysis.py?
> 
> For instance, could we implement a format with the number of lines of
> code like this as we discussed in a previous thread?
> 
> /* SAF-2-safe start */
> if ( modrm_mod      == MASK_EXTR(instr_modrm, 0300) &&
>     (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>     (modrm_rm & 7)  == MASK_EXTR(instr_modrm, 0007) )
> /* SAF-2-safe end */
> 
> Firstly, let ask Andrew, do you prefer this?

The issue with this (or any other multi-line marking) is that it then
covers far more than just the offending piece of code. Yes, this is a
problem already for single lines of code, but the larger the scope,
the higher the risk of unintentionally silencing an analysis tool.

Furthermore what if more than one violation exists (and wants
silencing) within a such annotated block of code?

The case(s) at hand clearly back the original fear I had of such
annotations harming code readability more than acceptable.

Jan

