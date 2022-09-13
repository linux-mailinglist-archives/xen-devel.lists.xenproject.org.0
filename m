Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D55B7616
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 18:06:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406491.648889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY8Pp-00032l-65; Tue, 13 Sep 2022 16:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406491.648889; Tue, 13 Sep 2022 16:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY8Pp-00030T-32; Tue, 13 Sep 2022 16:05:37 +0000
Received: by outflank-mailman (input) for mailman id 406491;
 Tue, 13 Sep 2022 16:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oY8Pn-00030N-FS
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 16:05:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5bd81dd-337d-11ed-a31c-8f8a9ae3403f;
 Tue, 13 Sep 2022 18:05:34 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8016.eurprd04.prod.outlook.com (2603:10a6:102:cb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 16:05:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 16:05:31 +0000
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
X-Inumbo-ID: e5bd81dd-337d-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXHbWun0SNX/d0TasIRlMI209ilhKtKMWOdB8yAoQw3IJaLCbUzBDaSNv2k0hlsNtVBl6StHm7kh1frCDVMbGLUUivc6vNMDCaNmCW2IstBWbQlsylXRbRz9lO49X6gDuYqTvkGMu0ai3QLqQdHhvTP/0pXEX9mvZKQub4G0S5I+P2d2EBlz/cA3W37Ue4GTaeFKxK39TdpoqMrM0JI3AIPdGRzyZHBRLeaM3JE+ZNv0sApbyKFHYropXC31eYr1sAptabs9edoSJO0bpznw/sUj2zCMgN0au3XTb7U4kOSs666oPYKB6zIrEccq4zwyFTamWlKDTlcrU7mUCfcm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj1hov6fb5jl/tl44YCiMk4xrRK/PezhTGj9DusRxbI=;
 b=k/Df3TzgK6QZpGTvCvCiIjVjl5/kWX8uqUFKYQqFULtc+Hh627ORCL6AoMWK3K95wwZ+lhN8X14z01N2CtlDMXy5FAF4vPjmyM/w618QIceorP6+0EOop9VsDS9oZN+O7WcnAYp1KKEqcfGQMJIrEQM3lLWeFQLT0919pOhFzBc7N8qYJcr11gg2a5Tn+6RsfFDqEylJLm07VfPfcxoHeXljiMchBIFoe2L9NdRsFctMJxvohHcpx55yVt5TcJaqzCS6NxxolRQaRnh3EN6W8wSjz/02+yeHOFiJZrbcsouf4LnbTLIFa2LciqN0U+bbu6QTrcFTB5KeI542fE/Sgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj1hov6fb5jl/tl44YCiMk4xrRK/PezhTGj9DusRxbI=;
 b=24+JhpxwPxLy7dJdw8XqqQXAnkuGVs2i8vaev6zC0aoRti0GnfSvxDQZ/NVOYABYPjf5p76wW8Gr8ezO4Fk857t6dUMGpBSvnvqQFQQahf5epLt3Ora5jdl8uXa0fbih0rwhtSluJ/xHSvGp/bAZd2ommOQ9VRrXO7AKON5sRXhWf/0NFFnjmqpp4XYjZI8wodCRo8FMpHW5sPJw3XDy+uXlffhG1zCNO3ibk5SuHvFBIg6R9G/yZDhMSlJ0m8tbd/VQX8VEn3T9yHqv5ZwCzacM1dgNngw61IZzvPsk+HFzQ1vk/Glf9Yg0wbhAsDjuz/pRRUnFTokYX5L3vsgNlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e1bad56-b239-c252-1b45-aae26499cc77@suse.com>
Date: Tue, 13 Sep 2022 18:05:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] x86/PV: issue branch prediction barrier when switching
 64-bit guest to kernel mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <e687a2ef-780d-edb9-938c-7cfa4237dde4@suse.com>
 <YyCkmGq5UQPwqAsX@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyCkmGq5UQPwqAsX@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 15723f8a-98c7-4a7e-3adb-08da95a1c8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8UU7XjAaiDc0n+GaD7LlgIGqxEjoDqClpyxu49U0NufpZk+uLQjdy5k5uZIC1fQUUnlH/cqw+YGKvIAFwDUbX1rjTv3hMsn7foBp+n1635spGfG5pEgDS/aJjPinNo8wzEQAZGC4bbWrUJ53Rh/OS8WNZzl0O9cpq++nKI6c7qJ5a0cvo7OFwVV81DZhelqqusF+BpWv8l8iiA289wGaABh0blzwCcPYKX0ZNADxnVhLGCpL+F18p/EKj+0Y1vx9qNYf7qU6B2/MbDqyUQvLrBRBOdF+fMmOFKU2wUP3yciXiK+pJdaRWBhmxDgNusPUbs3IuV7XU/Z5PEF10WUHvw+b1ctr58TerGbACgZ6L+2IPNcmV4h1OmDcvMNCQOHXCxC+c8LqD/5wM9W31U+HAQ/5v8sLefJHWlieQPKFQFAX29AA+pXEgVdbvgMHpK4VAJLHLYJEAE7yYfRDRcO8pBbVb9qfNJ4A2AhmhEuIMXeMiByntLt3kfN3SPobLaLRMWIotsssSdlbxdl/MX3axrjyYVGXDmn+8fj8tJxVBOo/SDUA8y1lFLRsUlvsHBLUUcz1dsXf82Mmg2CRlz9Kyjf72ixSvbXJY3PQmyQOMs8sdxv/3/Z/C9wIfkLQRRZjDUsOlz2DBWzic5DFwHdGv3FhetGhnOvjauuuyhPD3Jxvu5PmGh6lvn1Who1dIcwXP3C02icnNdEL1qdWxqszuhsLIyIs+j39tzSAjS4n0CGuANdSxWZfffzGBZF/dvBED5+ETHCNbjmo7f3mbwVczggRnyMEm7JU5hC2UetN/Zg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199015)(6486002)(186003)(2616005)(8676002)(54906003)(6916009)(5660300002)(53546011)(4326008)(86362001)(66556008)(66946007)(6506007)(31696002)(66476007)(6512007)(8936002)(38100700002)(478600001)(2906002)(316002)(36756003)(41300700001)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmJETnhoK1hhNkdMN0lHWlBZZUZhY2NNdEVrTzhnak5BZEp4dFIyM3dZNCsy?=
 =?utf-8?B?YkNpck9RWWlIUHdhSmgySUJtNEdpdFZwN0VBYlhvL1BLOGNaVE82cFRPanl6?=
 =?utf-8?B?ZXdXNXF6TzBOa2NQZUx4RUVoclVyeWtuMXgrUXcvZVF6M1hVdC9VNDZxTFpu?=
 =?utf-8?B?MzBiRmUvSzJ5amhTU1Z2WTRzUlBMK244UndoNVdoczhxNUJZQjc0b0xEUzFt?=
 =?utf-8?B?WjBGVncybkVJbE9QeVBpZEtSK3A3WFFXakN1QnhjS3hPS0FKeVlYOWRCVitR?=
 =?utf-8?B?MUVUUE84SzR2Mkk1WlAzQUFyWkdxSFRWRXRyNVAwYWMra0dnVTBuUmQxd3M2?=
 =?utf-8?B?eWpqT2FSeGVDc0tWMm0vTCtMNURhZzRvR2FmQ0pGWGRMckxKdjh4aVVsMHpv?=
 =?utf-8?B?bGM4NzVlMGpmWjFTTXdQdCtKUHVWcDc5VjVCbjRQalpCOVZ2RFNyWVF0TVBa?=
 =?utf-8?B?SWVWeWI4VS9VUURpdzRmbk1xbmdVTk5uRTlWOU5LMVVoU1VQb0tRM1RRT3hm?=
 =?utf-8?B?bXRoV3V2NnFBUm1HbWd0cVc4OGladHdEWENJdmVGYVQweTJvb3NCVUdFd2Ra?=
 =?utf-8?B?T3lZNmNMZTFCelkza2w2UHZTVjNnRWxEYjZuOWMwSmgxVkQxSmFkVXJmdnJR?=
 =?utf-8?B?OUdjcmZLMG92citlalJ5czRSQVFtWEhidlZmTmdueElWQ2tIcTRnZGlZQ1dj?=
 =?utf-8?B?Qmgzb2lOT05kODg5ZytFc01Qd2RYdVBnTC81Y2R4ajBqV0JBeExPaXYxb0tZ?=
 =?utf-8?B?M1FreDZpVGhJM1orYlVjWHhVSmR3VnBOckY3bXpGdFloUitGQ09CbHlFYlM1?=
 =?utf-8?B?akpYVDJ1S01WaUVxSEE5eHcyWEFYWmFEaFZzQTBuNUN3QUJjY1FLTDZSQmhz?=
 =?utf-8?B?dGJYcWowOFlaN3NUdWlaRFBTZld3YWRSZkxnWWZIZ0c0em1mTWdpYkdHa2Iv?=
 =?utf-8?B?QTlmakNLQ1ExU2lubnQycm9KOXM3cno1b0QvSWlscEVQSzZpb29GenNZWWpu?=
 =?utf-8?B?cHo3NEt2a1RZZXh0TTNNcXlLbjVrL0N4amhkcnFMRUMwMnhGTDBHeXo3MURG?=
 =?utf-8?B?ZGFySVk5Nmd2TGtVQVRzSGNMdWZ1M1VRSGZyUVR5WDQyYVNuY0k1OTREYlBK?=
 =?utf-8?B?Y0ZEOXlHeUMvcS9xN1I4VllsOWZWUVl0RjRnMmFENEwwWjJNRnU0dEVTYjVX?=
 =?utf-8?B?blpoZWg2cjZOM1BXOVJTV3JSTU0vMWdaN3NBUm82Y1pTTXFWd0t6YkhBTHVj?=
 =?utf-8?B?VEVaMmVjNlBHWUtWaE5pTjlETmwrMlNCcHRWdDFBU0VXM2dJY0NET3JpQ0FX?=
 =?utf-8?B?VkN3am5RSDByNTVIOUZaL2tkRVJ0Q0dweG9PQkc1cktUSFJwbGJtVGhyL2Rm?=
 =?utf-8?B?SDRGdUhBZTYwZkcvZlVxSlRIM085ZVY3NUUvbi9hajg4S0Z3TSsrL3RmSXBq?=
 =?utf-8?B?UjN6VGdrN0J1UGVZYXlkY1ZMZXZrN1g0ZjE2UDBOMERGb1gvQ2ExM2xMOHJJ?=
 =?utf-8?B?RWxQSGEwQXlhYVkrRzhuRmdGYnlhRXAxM0lkOHcwM0wvcExoQ1ByWXNMcDZP?=
 =?utf-8?B?TTZlOU1DZlErd0NWSG1jd2dSaDNxcXlCSHJCd2R1S1RXNzFvek9aYmJlNFBl?=
 =?utf-8?B?ODBOVURrdkpnWDVoQUpWL1JETTNaQVVsZkU0WW9JMjF4ek50T3g2N1ZQaVZB?=
 =?utf-8?B?K3h6UUQ5emNzZC9QMHJsZHlXNlFCL3NyVmFOQWpSa1RtNzBsUFhqSE13aCtx?=
 =?utf-8?B?Q2N0RnVmVkR0YWh5eXhwZU9vTzVFVVorSDRPK2tmbHdUY2RQaDc5Y3pxaEZV?=
 =?utf-8?B?SFF5ZG5ITTN6V2NFT1hMTFVDczVHUG8vWnVxSnNMY0NzYzBxUS9CcUVjdzdZ?=
 =?utf-8?B?VUorWkdkKzZKbnNjWnRybkhlcFI1cnM5VWhJSjQ1eGZObGNadHJoeVJIdlJl?=
 =?utf-8?B?M1VDbUp4ZU5pL3ZBaHlBT0NCdFR5Nm9tcldPYXUwVHZBOGRWSW80TWlwYVo0?=
 =?utf-8?B?b3BJZFpuNU5GSWtZTjh3a214WDZ0blJjdXlVWXNqbFIxTUxvMXlhUW11dTJ3?=
 =?utf-8?B?U2ZHUVlXK3ZnMjN0NUlucStoVDlhOEMyODhpaXowenZOZURpK21CWktDUGc1?=
 =?utf-8?Q?ljCcwM+DXDhPkOdKpO1A35kYZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15723f8a-98c7-4a7e-3adb-08da95a1c8d4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 16:05:31.8909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcJZQlBTaq9Dm9AZVLHYSM7aLJgWW0SFS8eHj1OvBRWOLXZWjmWCaPS8PwoKMeeubMRh+eXm4KSrT3WsdwBeWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8016

On 13.09.2022 17:41, Roger Pau Monné wrote:
> On Tue, Jul 19, 2022 at 02:55:17PM +0200, Jan Beulich wrote:
>> Since both kernel and user mode run in ring 3, they run in the same
>> "predictor mode". While the kernel could take care of this itself, doing
>> so would be yet another item distinguishing PV from native. Additionally
>> we're in a much better position to issue the barrier command, and we can
>> save a #GP (for privileged instruction emulation) this way.
>>
>> To allow to recover performance, introduce a new VM assist allowing the guest
>> kernel to suppress this barrier.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Leverage entry-IBPB. Add VM assist. Re-base.
>> ---
>> I'm not entirely happy with re-using opt_ibpb_ctxt_switch here (it's a
>> mode switch after all, but v1 used opt_ibpb here), but it also didn't
>> seem very reasonable to introduce yet another command line option. The
>> only feasible alternative I would see is to check the CPUID bits directly.
> 
> Likely needs a mention in xen-command-line.md that the `ibpb` option
> also controls whether a barrier is executed by Xen in PV vCPU context
> switches from user-space to kernel.  The current text only mentions
> vCPU context switches.

Andrew and I actually discussed this perhaps better having a separate
control.

Jan

