Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D115C65303B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 12:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467826.726882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7xGI-0006Xe-Em; Wed, 21 Dec 2022 11:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467826.726882; Wed, 21 Dec 2022 11:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7xGI-0006Uy-BP; Wed, 21 Dec 2022 11:27:50 +0000
Received: by outflank-mailman (input) for mailman id 467826;
 Wed, 21 Dec 2022 11:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7xGH-0006T7-0j
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 11:27:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f2d5533-8122-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 12:27:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6874.eurprd04.prod.outlook.com (2603:10a6:10:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 11:27:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 11:27:45 +0000
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
X-Inumbo-ID: 7f2d5533-8122-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUIZtXAUjvMdPjOHV4n/9S7Ovd5gt1PbPbDaogwUgqR8DCtpnTxdNEb0bxpacXdLLQebtXKaBFXbkl8MvXs5EfIicD8LxhlY3mc8JxdPUEromBh2rKQW8W9tNmh3c7KZWVIxk4bgp+mwSSoMgD0uRioZO8BmGru9f1oi/tIQr9x0TItdMqGtCdXLkN2rtlfBGTftSDZZz6mswyD1sAGseFaHlM6wNu9kbT4LvlgnYT9XikmZJzqgQvK16PSKERkia5drqeCy9jXZh4Q/mD5RuaU3eAmsUoRfFNcOQhtqQQZ2THkEk6oQTCsZEh6oshQ7VEVTHuVolbTsp3tkNcX65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6CdcOa0QfwpwAUK/mvGWQ793ReWlVPtgdT65FJCkss=;
 b=aepp4GQg3DM25/nQEWH2mK1M4hlqt1rTfamwo71itu3pKlFSignJJZWoYu6Gwf92ZUJpbGxmr57lVg9+ZxOG8edJ5VdwLPB2uUjhXvJoJZd6Qa8KOCUZ+MSMORA7HhfhAQOfZGDCBqo8hoe3P7c3sCt7b07CVVZLD9tTDonqafF1qaqyRrwYKMYiV2gdAZw9ObL8FV3PaeUpqjtiVqaOV6FPZQ00JD9TfO2JMAB/FbPn/GKJ5GktDG+UOw8LQZSgfuKm2LHF5uJ9ZrfnUNMl40QZ7gGccNMwdiUo9PEkKbb6/Hk+riAr8xadL0dmbpJ8JjC++hg+0iC095pdT8ypWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6CdcOa0QfwpwAUK/mvGWQ793ReWlVPtgdT65FJCkss=;
 b=B3k94ZZDFCKRQi2DlCGatmzyFVzVs8HcFOZMbc5OnTv2kqTQeiZTPwAtCuut1VvlFDIP1oUJ25rrMsjBV83HEY3oMTdzBPMqXo2E3Vpoxfy/qRwTcn11WaGkTPYwIOHNXQEGfYuAL5PoOiU6VvmXzkYaxAmDgCjOGE3uC0jqND4Ud1Csz89DArH7RzeXWVe1Anmo3lsRtaSxU0ITnUoAsNNT8Md/Uv934xalO5BLiQ+fwg56KTR7eQVmhiigep5N1y/z4AYDuJmM6KC3HomrtDK9Fp75RV9WjB6ncNDJHcij90N4ToVOUK+gkiSM0Hov94rfu+vPjoHbvlGHBeYwow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b31138ca-e6ec-33b2-51c1-b831d3f3c962@suse.com>
Date: Wed, 21 Dec 2022 12:27:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC 7/7] x86/dpci: move hvm_dpci_isairq_eoi() to generic HVM
 code
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
 <20221219063456.2017996-8-burzalodowa@gmail.com>
 <f9d36ae1-2363-1276-2747-737823d2f51b@suse.com>
 <e3d3a49a-0ca6-6b99-985f-15511070f251@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e3d3a49a-0ca6-6b99-985f-15511070f251@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: d60a9eff-2064-4a42-80b0-08dae3466196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dant8IMpnIuz2W++5d6PBx3NkyQ68xw8qtaMulW9QOXdQ8+KaoRdAlAs5qbqEi5zpqz+W5NOQaDpE/6Meolb4yG3xbmL47wX1xD8VW57yaMVU0d0/aJHUXCOVL+VRWhNAZa3Syn8bQDPVMLyn0uzK1+c4dq+qCREFOE/F9MmlPjAzG8USB0cY/PCUR7jgETjcbrzkNb7nIM5Z+IOV8bvuwNHehZsgrqQdtRDcxrkkmH1diDKRH9xu++qMJh1/tDq76HRNftcHy9MZAOVIJeCULB6xXQEJfgKW7chiIXVhX16csoxDD9ivttiLH5tw5VT6TAGpt58Ju9KryryRa+yyR53QssCmahe0MwLp/yLEPbUdGXiKL87NCeprgk832JXhdRuBjGXCxfbdi16r/H5jRpgxAQzPgUiHvRJjKq/eZx1Oy1wd2QHAuh+qF2RHpTGU8UaOYQq1SjN2kSJ8bnknp/OMuOtcH6gwyTAzhr5TN+hsshpvCr7pA2KFFs+98LMkhwK3cWR8VIdhnM0vUWW/ktw38xL6+gzsAupDzaX/SBYTAxkWsWnq6pBxUCbg7TJ5iVTTLxmBnxlgf/Ael6vPqS4YA7UB8Uj365XONtOshtK8xT1716wIKoeeZa0BPiTuT0H07uU/hZ9pNOMmR+bTz3k9wacevLPR+ukymfqWpjnwtvUNv65Ztpsjevor+DEFVrSeJJpZipxonONuuFVPVM7w836Lc1VBlGYhSQCYpOCp9AFuwYf3yZ+R8NgRjOC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(316002)(4326008)(2616005)(31686004)(8676002)(26005)(186003)(6512007)(6916009)(5660300002)(66556008)(66476007)(31696002)(66946007)(86362001)(6506007)(53546011)(8936002)(38100700002)(36756003)(6486002)(83380400001)(41300700001)(54906003)(2906002)(478600001)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGp1NkUzMWZQMHVmbjg2QThkQzM5ejRBZTUwWlB5blpURjNNbUhrbHlHcWV6?=
 =?utf-8?B?ZHNOekFGM0RLZWRQaW1TVForU0FFVjdMN1BNR0JzVWFZNWZBWFh5a2VlUVpu?=
 =?utf-8?B?TStZZXRiWDR1bGFLRjNCRFNPM08xYy9HNEhoQ3ZFam1naXZqYWRWUnFWSTNx?=
 =?utf-8?B?bktVYkxMdTRhUWI0WWxIMllFOThPVVlwdDcxenBtVlFlai9MQ0Fwc0sxWUJv?=
 =?utf-8?B?ZDVZcGlycG1VdzBJMXF1UTV5bGRnRUZ1b3BUMC9MbDJxbG1hN2VyS0t3NDdS?=
 =?utf-8?B?WHRPdkVZZVFKYVJHTE4wd3U4VnpQb2lvT0cxeDJWQmFwaGt1VnphZXN5clYr?=
 =?utf-8?B?ank0VWVmTk5TYXpGdXRsbHVMSWhieSswelV6aWZiZWpxWTJjWVNLa3pxcDRN?=
 =?utf-8?B?N1Focnlpb0xPQnYrUWZzcjl6c0hmK3lhUXF4ZnRJa1ZTMkI3RVNqb1gvZUdm?=
 =?utf-8?B?R0c2MEh4TDNndTgwZGVKamp1ck5JdThVRkdTTnFhS2FDazkvQmhRZVhmSU1j?=
 =?utf-8?B?Nmg0SHFmSWFwT2l3b1doQ0xrTWdZbUd0QnZORDc3WFZ0M2VUamtTczVaSklk?=
 =?utf-8?B?SlVpdUNkbnBLRzkzRWt0SWo0eVBYT1lSa1dOV2tOZjlJcjhuajlXZG9lMnBi?=
 =?utf-8?B?TmNyZkNRZUk3UHd5UWhzMnNTeU9vS1hacm40aElhZ2FMM0M5bml2Q29rMDhI?=
 =?utf-8?B?dWN3aVhyN0JvaHE5eFNQQ2ZpM25Id082dDZMcitNVzFwaUdIQ3phWGkrK0dB?=
 =?utf-8?B?ZTJlSE8ybkR4c0wvaXpMMUYzemJyVEtEdlJUc3FZM3hlTFJleHVxRWdZblpK?=
 =?utf-8?B?dzRPY1Z6RXNyZkJOazdhRmo3R08wS25BL2lrb2VINGpvWi8xWTczRnFWSmdG?=
 =?utf-8?B?Wnp3eGUxWThzNFA1ZmdyTk1SUUpRUVhWTTJ4b1ZjTzNkWjM0bk5MemJ0YXJR?=
 =?utf-8?B?OW5SY2VaZUt3YWFyQUVUdHF6ZmlUdCsxK1dSak5NcEVKcE5peThPUGRUcFBR?=
 =?utf-8?B?U3JIbkhVWkJLeU5iTzRmQitFekJWWi9sNWwyK21GdFRNK3dJZUNZN2JyU0NN?=
 =?utf-8?B?T2lVV2ZEYTJkc3hDeVEyelp5cmZ2U0FCampIa092dkRIMTBKMTNZdFA3TlF2?=
 =?utf-8?B?dmpTYnFaU2VLTVlybzNaSXdwR1RXUG1sVmtGVTJ3Z1BjNTdVUXM2dE9KYXVJ?=
 =?utf-8?B?dVdBUHNWd0hpVVh2Y1ppM1ZZWW9ncEoram5Gbm8xMzlWSXpRNkxtTk1MOWx1?=
 =?utf-8?B?T1pBTWtHUW9ZZWw1Y1l3REJJMmNQRG8zS2J1eXpZWlFxWUJJTXc4dG9jVklY?=
 =?utf-8?B?ZGhHVHBabmZDWXdqNGhjRUxVbTI2SGhnTnAwMVRSWnJyaXZjYUg2Y1BHNXd3?=
 =?utf-8?B?djNoelFVWGdkQ3VPTSswOERXNWV6NEtybGM2ZkplMWcyZzZJQlZrSzZ5VnQ0?=
 =?utf-8?B?M2k0Y2FQbzVtbGdPdGdMa3g5NU9wVkZoS0xEMkFoQlhWRThvcWJSbHIzbHZI?=
 =?utf-8?B?NjZLdGZseno3MXRZNzVxeGU1bDgyeVBiTmprOU1mOS9CRHhjVW96S0grN0dS?=
 =?utf-8?B?bkg3RGw2ck0va0k4TEJRY09mcWs5dUhTNGRrdDNqdDc4QVlIcFBld2JuQmtY?=
 =?utf-8?B?RlNhaE80OFM1cDlsdi9td0dwVENVdVAzYWRkYU1NWjlISUp2b0FlcUYxaS9M?=
 =?utf-8?B?RWFyeFZhZFpXbm4yTE9ZK0RtRlNBR3pRUmlsQkdyUWxxTXNOVFJWU1NFUk5T?=
 =?utf-8?B?akZaMXJTdEN0WUxMcjd1bFJRMFZvazRQYVh5M1pkWU95Ny84Z3JRdGl4RE1h?=
 =?utf-8?B?KzFnWEF1M1l4TFE0WmlUbm1ZV1ZFM2Q2T0d1K0s1L0JlUVdVak91VE9BUjJw?=
 =?utf-8?B?OU8zNHJvNjFETFkzeGljajk5VGdHMEcwM24xZHFweXcydGVNaEZhQ0pvdm5y?=
 =?utf-8?B?eS9vbnFMSzkybjB4QWxoeFQ2Wm16RlJadHowR1ljaXdBaExWdWJ5U3VISnRH?=
 =?utf-8?B?VXN5SDh3NFNQa3BZT1dlV1IrOC8zWFl4eDdvdDZMOGtwV3dsOUJCdmg3SCtq?=
 =?utf-8?B?U0pIcUJsa0lOckNjNzVlYWNSYUFSVVZRUzVwRXNFMGxndEMwbjIzWGlOcEhq?=
 =?utf-8?Q?KXGb9yaubT+dJ/FIhwji5C1Ck?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d60a9eff-2064-4a42-80b0-08dae3466196
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 11:27:45.1753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXoxQF2nyQswpMhJH1gfSok3xBd19kees13gGt7SuH8PYQfU/KzRIPcm/YC27uVvL3ZuBlLHk6VAs/iwI367tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6874

On 21.12.2022 12:13, Xenia Ragiadakou wrote:
> 
> On 12/21/22 12:19, Jan Beulich wrote:
>> On 19.12.2022 07:34, Xenia Ragiadakou wrote:
>>> The function hvm_dpci_isairq_eoi() has no dependencies on VT-d driver code
>>> and can be moved from xen/drivers/passthrough/vtd/x86/hvm.c to
>>> xen/drivers/passthrough/x86/hvm.c.
>>>
>>> Remove the now empty xen/drivers/passthrough/vtd/x86/hvm.c.
>>>
>>> Since the funcion is hvm specific, move its declaration from xen/iommu.h
>>> to asm/hvm/io.h.
>>
>> While everything else looks good here, I question this part: The function
>> is both HVM- and IOMMU-specific. However, by moving the definition ...
>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>> ---
>>>
>>> I was not sure how to handle the copyright. I assume that I have to
>>> retain the copyright of Weidong Han <weidong.han@intel.com>, right?
>>>
>>>   xen/arch/x86/include/asm/hvm/io.h        |  1 +
>>>   xen/drivers/passthrough/vtd/x86/Makefile |  1 -
>>>   xen/drivers/passthrough/vtd/x86/hvm.c    | 64 ------------------------
>>>   xen/drivers/passthrough/x86/hvm.c        | 42 ++++++++++++++++
>>
>> ... here, you don't need a declaration anymore anyway - the function can
>> simply become static then, as its only caller lives in this very file.
> 
> I will change it to static.
> 
> Regarding the copyright, shall I add the copyright of Weidong Han 
> <weidong.han@intel.com>, that was in the deleted file?

Strictly speaking you probably ought to, yes.

Jan

