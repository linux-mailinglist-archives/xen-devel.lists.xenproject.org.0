Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E00695AE7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 08:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494993.765225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRq3P-0002NU-Vt; Tue, 14 Feb 2023 07:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494993.765225; Tue, 14 Feb 2023 07:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRq3P-0002KE-Sx; Tue, 14 Feb 2023 07:48:43 +0000
Received: by outflank-mailman (input) for mailman id 494993;
 Tue, 14 Feb 2023 07:48:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jX19=6K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRq3O-0002K8-9V
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 07:48:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe935086-ac3b-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 08:48:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6855.eurprd04.prod.outlook.com (2603:10a6:20b:dc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 07:48:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 07:48:10 +0000
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
X-Inumbo-ID: fe935086-ac3b-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+4p066Guek49K9MYPxzeN6rb87fId9rKYc64gQ1TeWrGh2NOMtjU6UL+BH7XXeGGI9bIromLINUkhgUdvCa0I8y9G833mTQHQPRdiTxI0Aytr8qM41Mo/WMvuWQIZGQwnusCtWuGbEKGCdcyEHXywma2Tmcn90zfdNiNruVYW/PuSlZ9oBAOs4tZ9cJ+UldkcKMDStpi54ijlGJp1w5AcavLeon4Nov9qjDyVEnq7/y1m92O+yD6daz8c2fKBl4NeM4z+H9Y5jSEmkdgcwKdatEJAkQnIBkrrAzIf6b4+P3hsvwR9go6Kll56VHK2aI8rH0ouhzyXVFj2Y5OucQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbyW7g/n2hz4XkVGlKoGQ7/VCjoSFDzdx34OPekR/zk=;
 b=GYsQC1iajxG9Y9HiKOJtsS1SFzXz08VmkSiUr6D6S98ggF+jNiQN7Mon7nV3WZ+OZ9e/fUFFQXKnb9gi8KOtZ1JihJzlzOzQIDDhAJjUQh+ujpHzXBh6dgVGgpUMWqlJy2sDa0RFJVpdNUB3JC44qkULWL0wQcBUyGHVpFLzk6IpNNML5oDqf8IirEPvn+rkCn0TLxKz/AbXLZ6oktdwc5zQ9Pw0tjQn5rSTPCDYgyzJpUu+rJTAy5U7JSW2DnzEq4/qE0mvSLkgwcWa3O5RfgiQFAA9cEYUymFuYjLNZU2AU/WmQUrIHGc3fqzwykADIk4HdpAtLRPDFqe1wSH92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbyW7g/n2hz4XkVGlKoGQ7/VCjoSFDzdx34OPekR/zk=;
 b=wD9znG4POiAwOYllHpUCaazEi4w+qubNRgOgGDsTESGxOk8TDvSyB9vC9ehq1baQAKE0xfqbi19cDoop4dQLaAOS2l85Pk0MtlQvWjQdivg6QFbQLAqTS+EosKmTX/X0BIbv1h4zyqTI8jrY57in6ZlnEgeBhmOZ4zuS8QoaqX2UA76uvu3NMzGubdY5MQRoEf+Ox0GrRkPHvHFeEfeDWeZD3FoU8yT+QWvRAu6cb7/wNOhGcdhw4wdOAf2Vo211yu1dZ/BLPF05Wk5NKyo/FxKr7Ebhmp0qiEDcSsSXiQdswjR4aGVw72bmtwBDE8Kb0EYE78GAsaHLf8/IRiOIVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <342bb651-b0f8-8cbe-53ef-e4a292446224@suse.com>
Date: Tue, 14 Feb 2023 08:48:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 01/10] x86: introduce AMD-V and Intel VT-x Kconfig options
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-2-burzalodowa@gmail.com>
 <e29e375f-3d30-0eb1-7e28-b93f2d831b43@suse.com>
 <5c3eb593-b63f-303f-dcd8-f5c319152635@gmail.com>
 <3cdfde6f-5af6-4044-f786-259c70e0ba69@suse.com>
 <5892e7d6-bd08-0f2f-4dcb-fa5b9123a2eb@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5892e7d6-bd08-0f2f-4dcb-fa5b9123a2eb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c13cd3-8292-45e3-996e-08db0e5fd14f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o5umqH8R1DyhdXfFjIjiEYIcvKKwSWF9vvLRd/VlI1NtMbrzG6jrOpd97YkWrhJ8XkBSO5HmKiOe2M0Ia9Gc/3B2n8PKk1H2QvtXA+tYavHFk1QZ1aKc9TwY/e7PIDDaqc+9K+LfQ+nGilxX4KMeEwYHFZPRUs7PKdSjf1guWFtlsegK7XQlZwnJhc7DiCnbnYsGmfgSFx9EZQgRgKFUvBD80fJPfFocqW8hRp58kSWzrutNjXp3uEmp/q34lbjEhkp9w3yfC2AaXi2Pfbz+NZlAzC5ZScS3Wh0XJ05wVgeG2evtcslOLoA0e/UulvxgB9XoYR7i/yyUdv/BnGHUc+4Z3d3DAWhTbXVb4ZqUDQlROw/aT/+We2r7ACGcInr8FanAVvwZmwn3p/qeXAySfekHyBtUGf+QR97W4xqvcuC89zJ8MPWngjlZCRIN7isqPy+tZ/VNyBrgmP8ub9bgjjnNVKx5UAmMeCp5PJ9+JLcNsi6YUYPy7VGK/O43T3+oaBerjssLskRYFmEl7F5ybHdXAK1wg3pdBfpDfVBNZiyFavaR6FUiVDaFm+JO/kfPnp6FpyeEdRtM0gE0f2hRi7EzQjTMKaUh92MIyZjzuw3oXApdHrcYqZmdpgp5SHQceh6eeCeO8fGr5SGrhJt9wR/psJk8emf5fOKuWLjgV6wgZMCOFm3rJ/PB2jcjaXWkrNlhkx/VSTtTMg5n1kbJddbbshJgNVJeawsK4pfr7JQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(376002)(396003)(346002)(39850400004)(136003)(451199018)(31686004)(53546011)(26005)(6486002)(2906002)(36756003)(6506007)(186003)(38100700002)(54906003)(6666004)(66556008)(66946007)(6916009)(66476007)(478600001)(8676002)(4326008)(2616005)(6512007)(8936002)(41300700001)(5660300002)(86362001)(316002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUU2cGgwWkt1SXR6R2QwcFhsWjJGZHBmdkJkWU9YWU1KanI2aktGYVR1T3FM?=
 =?utf-8?B?WmhJcGpCUlFJaWVpT3I5YmhCV1NPekpTWU43dmJMdWFkQmV3SWpzaStVaHdL?=
 =?utf-8?B?aG1FeU1XZDlRdVJ0MzNpVUt5TDdCZVV6WXREOEt6cHZiaEhmTzNNT2RxK25n?=
 =?utf-8?B?ZW5YWWVJR25IV2tlWFJVUWdFSHY4NDFZYnN5Sll3R3RxWmZJRTkwNXdCL2Vh?=
 =?utf-8?B?T3NCQ0FwaEp3c0xnakZ5alY1SVlvUW9LUE1iM2pSQy8vWGZsUnlEdCt4MXdy?=
 =?utf-8?B?a0JlL216c0xqRXQxQjBabEo3aFV4STZBWTBCK3B2MittSTV6ZlJhempvT3Bl?=
 =?utf-8?B?UEdyb3Brei9zZ2RDejNrM2NuMTZkVmtYQ1pXZWFXZjlkNGljSGh4d2I0SG9I?=
 =?utf-8?B?YmR4N2hkUTVoSXJIZXlOZzIyZEZtUG5adDZ1d3hoNGxwZVNVTWhVeWZ4elpQ?=
 =?utf-8?B?UFlRdHlUZzZXY3lCeWhDWWFUQWd6NjZhNjNZZERCUEhXblAzVjQzNHoxVllE?=
 =?utf-8?B?OEFidTg0RENYd1B0OS9EZTBTMkhva3c1OU5QTjczRG9mYkpMK0E5TzhrQUN2?=
 =?utf-8?B?dzNhUDlhWnNoZ0YyTDB6U0RVdkJtTEFQOUduRThpZVVnc1JQVkx3Ukk4cUlJ?=
 =?utf-8?B?SFJyTG90bGpQVWN6TDRpQndYb1V4OVBWSGtVNHVjQ1FGUUxJZHU5MTZNOXM1?=
 =?utf-8?B?TGw2RUVDN1cyaHdFbE16cldWanFBVjhYcVNiLy9icUhTbk5CQ3pMbmM3RmVu?=
 =?utf-8?B?YWxEQmg5eEtqQzRuQnNLc2tYQk5JYTRGUVA3WUFocmZheVlkTmNBNTJqSzZZ?=
 =?utf-8?B?T3ZhUFB4akhlMy9wMlNqQk1obC9JNDFlZ0ZtOGo3eWVsTG1WMVA5K1BWSDRa?=
 =?utf-8?B?cEZnTmpjRi9vaHUweTBydlpNMXdVN04yRmFhZCtVM0dvMm9Qb3VMZ1YxZUc0?=
 =?utf-8?B?alZ0T2ZBaEd1SEp2a2Npc1o4SjdOSFduamh3KzVHK1V6S0drUGR0WkdlNkhC?=
 =?utf-8?B?QzV1OUYxdjRicHJYM3Y4ZTJTdDhuczFHamNhKytFMUZGM2dXMjNGYlZkU0lK?=
 =?utf-8?B?YVpXd3NJYnlmeFNmSC8wbllZeGhUT3g2MkZ6VmNpcHlXWDJEdHJOUjl5MUJW?=
 =?utf-8?B?blNJWXROZTR3OGRNZUZaQnhhVTFOL3o0bkZObC9UdjZmb1BUQVdFMU9LQmpR?=
 =?utf-8?B?WTNGK3h0cTRyclJjd2VLTmFMZGN1TVhjKzhQSlZSanJFRGxiWGY3bGlnVDVw?=
 =?utf-8?B?T1U4VEZBaktRZ1lOVHZTMVJNcVAzdVJtOFlzdGpaeW1uQXo0V25tL3FBZ3Rw?=
 =?utf-8?B?NTdFNFptMnRLaU9oTU5Kdi8yeFNWQXY1SE9ncUJwV3daU0ZNeFR2QWd3VVdK?=
 =?utf-8?B?eUxBSE5sNUxUc25RdVloWjhhUFdwMUtFTlZpY056c2pKS2pWYjAvL0dKd0Nl?=
 =?utf-8?B?YW44QWNhYjJ4dzY2QjJxa05vcDlhbkNRQ0tTazNibXh6MTNGalBhQXZzanRX?=
 =?utf-8?B?TEZtcHBhZUs5TGVMMlphNjRMMFl6YVNrbGVjMzhVeHZsbkhXb1dabGR5Ymhm?=
 =?utf-8?B?NTFhV21RQ3hXdEJHd1ZIQUx4bUhkOWJGUTVlOFpRSWlJdGZEMk5naE5LSWxz?=
 =?utf-8?B?eElHZUQ5eThEcTNVU3hxY0FkVTZpYlpzcFYvUWxOUjdndDlEWXRZV0crdXBX?=
 =?utf-8?B?NTdqa1RNQ0REdk1uV0JHaXZQcXNCbU04Um5waHVZV003aHRZV0lnTmwrSTFj?=
 =?utf-8?B?U2ZObnJsWXNLa3pKeTRHL2J1dG9yQ1ZtVzNmSUxUTDNKdG8yNG12SGVSL3dH?=
 =?utf-8?B?czgxS3RRV2Q3Vkw2ZjBhY1BVbzlNaUFEa3Q1cUM0dzZiZUZPSm94TXo2TjUz?=
 =?utf-8?B?Wkl4UEc1RG90M2wzVnY0bFpVZ3dqQm16Z0NycmhiTGZrQ2JvM0cyZzdSRlBo?=
 =?utf-8?B?MWlCeGt1R01YYmdPTlJsMlpvc0xjZ2MySzJ6L3pGYWNBMFhMTGFtMjZDaTNr?=
 =?utf-8?B?YXlxZVlQWHNQNjBJd0RtcjROUHdWNXFNeS92eTBFL3o3ZlRoVkR2dzF4MEsv?=
 =?utf-8?B?WlR0UUI5OXpxTnpTaEM2Ui9qUzVKalNucnpkSktrYkY3VWZZdU8wOC9pWWRY?=
 =?utf-8?Q?sLo5wjRJ24vdvF6thMcVt8I6i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c13cd3-8292-45e3-996e-08db0e5fd14f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 07:48:10.1425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaDwGwwNw1h5J31UOEYaLMWB4Z5TiXZU6Spy/3ydXHTdNlp9I+HvK2UK7tg3ZkiwzG9X8AyY5shMF9tFcR3fRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6855

On 13.02.2023 21:53, Boris Ostrovsky wrote:
> 
> On 2/13/23 11:41 AM, Jan Beulich wrote:
>> On 13.02.2023 17:30, Xenia Ragiadakou wrote:
>>> On 2/13/23 17:11, Jan Beulich wrote:
>>>> On 13.02.2023 15:57, Xenia Ragiadakou wrote:
>>>>> --- a/xen/arch/x86/cpu/Makefile
>>>>> +++ b/xen/arch/x86/cpu/Makefile
>>>>> @@ -10,4 +10,6 @@ obj-y += intel.o
>>>>>    obj-y += intel_cacheinfo.o
>>>>>    obj-y += mwait-idle.o
>>>>>    obj-y += shanghai.o
>>>>> -obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
>>>>> +obj-y += vpmu.o
>>>>> +obj-$(CONFIG_AMD_SVM) += vpmu_amd.o
>>>>> +obj-$(CONFIG_INTEL_VMX) += vpmu_intel.o
>>>> This code was moved from hvm/ to cpu/ for the specific reason of also
>>>> being used by PV guests. (Sadly the comments at the top weren't
>>>> corrected at that time.)
>>> Hmm, the init functions are prefixed with svm/vmx.
>>> Does vpmu depend on svm/vmx support?
>> There are interactions, but I don't think there's a dependency. You
>> may want to ask Boris (whom I have now added to Cc).
> 
> MSR intercept bits need to be manipulated, which is SVM/VMX-specific.

But that's "interaction", not "dependency" aiui: The intercept bits aren't
relevant for PV guests, are they?

Jan

