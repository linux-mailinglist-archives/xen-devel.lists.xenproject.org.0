Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C535A72230C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 12:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543611.848728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67AU-0000Wu-6W; Mon, 05 Jun 2023 10:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543611.848728; Mon, 05 Jun 2023 10:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67AU-0000TU-2l; Mon, 05 Jun 2023 10:10:30 +0000
Received: by outflank-mailman (input) for mailman id 543611;
 Mon, 05 Jun 2023 10:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q67AS-0000TE-Ht
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 10:10:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30adba9f-0389-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 12:10:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8800.eurprd04.prod.outlook.com (2603:10a6:102:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 10:10:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 10:10:23 +0000
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
X-Inumbo-ID: 30adba9f-0389-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anUNsnvhjE2X5/3/dwGuZAzLfZEocZjSkK1Z9GhuihLLXexhvDW6dNf3/qBmId9Thts327IsrIO54/DNLHXoyyvNvThjaGYppnm7RWmw2s96BJv+ELquLOSNc5ZTwV/5g3icn59iPpiJf2vhM3443HwanhRNbaSMdX5LRPuEemT2VcRX9EXZQVgu6S/BBvQ3OtWK1qIW0MXdkLSSkFlE5+ezbhI5czY/vVVOABTXwb36tswAzgIr4tLsEz5eeLSP42mORaHc0hvj1qL3DO+S9In51ZcFSm6DZJ+Hp9oMg9JSeF4hTGb2It5h3zfpgu1kqpgG3JFM4TONZ1B9SiPhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/kP0UtKA9AYAZnXd08SvLnj5O7FuCMB0eaRBOAxfS8=;
 b=KYLGglGRGbjpf4U3Zb8WWSFiV5KnaQAhUQ5WIR7Db+ARUNk7UnycQuF8Bv7MTzgr0PcJakKATcZhCsFT6mCpHXSt9gkHomTnDXhY9rttKI9033CNZnB8+i+y4yFbhZjuSqaFkd84eDehvibSMelAuyMr1eOGieE+QPj7zX6CJIVVWEva9SrXm/V+Bu/jGCKv2s6rkgJAhbypE/Zx4OD+Fo7lWz1PjPgnYiuHLivIh3xJee6aIOEwv9lLxNa3QitWnmeYNZWuS9QLlA/z3ap6AN8hlOsTC1SfV08mDf9nFlHTyHSr8GeyN6U4zT6gXaoNKU/oT8wA7uIizC/IivilCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/kP0UtKA9AYAZnXd08SvLnj5O7FuCMB0eaRBOAxfS8=;
 b=rgWmWVF9fpYd6kwCnpu0q0CJnpITvZU319dOsuiecesW6FRBfskbsdikjTUK2Vz+2BglSqJH1jkVY+zKAFchrDaLtXr3j7AJu2oqvVdWpe06hLX6RmPH4TRJSg5jlsfa6yciw4AT7CAmxhlNd6IVufRWwPUJV9ZExHKfztvD0WR6LCDz1us/4guliWX1O1HnuNCmBRN2Eu6cfzane7ASQWV5plwOuabSafH8EhWMEuaN9mwMXGbtes5BS9SISaB7I2mJr/iHzmxs+nuMo3Y6/uNYcBgYkKJPZhCloTEsi0mctFKy4Bw/AM5ANtWf68h0lI9R1ZdkrwIT8XLTEhf0Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6ce6c267-7e9d-d63c-c7f0-3bb7554a3f83@suse.com>
Date: Mon, 5 Jun 2023 12:10:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] xen: Fix incorrect taint constant
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230605100512.1748007-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230605100512.1748007-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: a11b1c67-eec0-41b5-3ef2-08db65ad13b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RAFOh1AsftTqZO54OsdxeU8/756FEw+GHyCYmS7Oftnyx8FYU5yE7n3qIQCCi+wOfbZ2U2n2BWSL1K0BlGSsPse3RUJngbuQBN+UU8zgro9o2sToWCQmoOf4GP5iB5f3XR9vzAxRsE88tSMMTa9L0MFbXZ6ypAqofia0gN7vmTWwMjzUjRNG6OY0eN0NVa2RI1+uZkbWJwG6ZlTfznUzxlxUSfPFGr1+EOk2fINVPvaNKX4I3G6Cpc+RDEfnhJ/knu4w+LI6VI36/8i0T5ef+yWEyBdevhMwnSz4SUcAookvvyJ0yqKv6Rug9g84XQIyMaMudV2OpvLHp8AWgqYm1aXEx0xAAGoNsqZW0yFcJGME0GIZE+EPcik2SUaioWoj8GrwORGKnpd0PwNkfmb16nvP/F4WVgo2spZG9PbcYUwkqk916pGlnzNUEH0q4l1PKmIn71ISTU8xWYy+nd8gmJ9pupi+OgJ1dEQN2Q7BoCD7RwbM5x3eyBLXlWy7XlYyYiYQTncuX+fAtl6rvoM5Fsi4on6ZVUAxKVkrgTyImacyxkMLjNQ+21EY1pUVHem5gLpc5EvcmrDsP6ewtVxX2lEuN+S/hq1j4WlWYZzPBieaMP0vu3FlHo6/p6TqaZ8tsGApyRsVcsUJxNbuSnTRpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199021)(83380400001)(4744005)(2906002)(2616005)(36756003)(86362001)(31696002)(38100700002)(6486002)(316002)(41300700001)(5660300002)(8936002)(8676002)(54906003)(478600001)(66556008)(66946007)(66476007)(6916009)(4326008)(31686004)(6506007)(53546011)(6512007)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0EvOFBwR2ZXN0ROdWxSOFlRTGRsbG1JWDJNc1lGRGlURnVBcThQeEhZdFgw?=
 =?utf-8?B?cU03RmkxNlBlL2hxRlFUbzNLVjJQMWZaQ1pLZXlOR0w5aUw0UnAzNzFMOUhK?=
 =?utf-8?B?WkF1ODdSRUZWTjlUeGFHY2hVclRxZGcyM3hiY284NWltRzloakRvbGI0L0Fw?=
 =?utf-8?B?VUJkeXllbytZc1NHbko0bnJaWjB2RGw0ajZ3SmpManU1eEQvT2ZhdDJpY1hW?=
 =?utf-8?B?OTJoYnBvSnVVbjZkZHNmVWxRT2JrZkVpNDA4SlhVMWNFNFJkVm4xc1pTT2FG?=
 =?utf-8?B?Y0lVMUZQWjNkL1dPQS9mVDRnZW84SG5hdEQrMXNraVZUVWRjUXpMczBEM1lG?=
 =?utf-8?B?OVg2a214MGVWbVV4V25pYWRPTllubGRHMkIrT3FtVHRuRVF1R1AxZ3l4c2U4?=
 =?utf-8?B?eEhacmMyb0NIaThVY0krRlpGRHJlQ1dTdU9jRDcvWjVhR2hHL052N2FLS2Vj?=
 =?utf-8?B?ZUJIZzRaUXlTU2g1dXdsZTJHZ1VuL3Y2SnpWL0lRdG5KbHpCMGhoREtKVVFD?=
 =?utf-8?B?TlByR2tXNzQyRGJ0RlZRN1BJNjhHaHdrcVgzMTRMcGkrUjg0RFcrSVQ3aVgz?=
 =?utf-8?B?eHdjRE5rS3VwY1U3Q1JNVTZEUWppU1Z5SlNaeVN0ME1FcVNTOWM0dTZuUHZU?=
 =?utf-8?B?K1JuWFJBcXVLcVpJdmhBTFhsL2tDTkw1OUcxbjFtUko3V0JkT0V0U01nUnpW?=
 =?utf-8?B?eWdhaGt6WGp6SUt5ZzFJZnlSK2VhQzBWY0pwVDVXYTBVeEVXMnh6UWxiUzhY?=
 =?utf-8?B?SURoS2Z4VTdTTmYrQnRGdnlHRG4rYVFWTWZIVkhYWllla3pLeC9KQ1BXODFv?=
 =?utf-8?B?WUxrdmtnbnlWemFxMFc2eHF0REF5bENGRFl5SWJqaFowNG5HVXVTTXAwRXNG?=
 =?utf-8?B?dFhMYTB6QzJ0UlJ6L3lrOXpQNmxsWlZWQ1l1ZndGZUptZnh0WXBaYmo0SHN0?=
 =?utf-8?B?MEk0ZU9pM2ZVakZraUZiZ01mdzM1dG90cEVUMVUybkw3WjlFcmRBeFVHNXRh?=
 =?utf-8?B?Tk9sSlgzUU53bjY2OWdWbkxJbDMxUjFnV2UrQVJ5VWtKaXpzRi9xSFJWY2pF?=
 =?utf-8?B?VDJiUGVHSklwa245b0UzU3daVy9WSVJRQTJhOWgvNWNVWWFHeDJOTlJVNHZN?=
 =?utf-8?B?ZGlkMS90b3YyaXlLWW0raisrQ0t0Q2U0MGxodTZpdy92bFpMMzkrUjdraTMv?=
 =?utf-8?B?eEo5TzMzUElMNTVwSDVtbTM1WENIZnZET1RCQ2FoQlRJV25OUm1UamRlK2ND?=
 =?utf-8?B?bVI1akJwK0xPaUxnNXBzb3Q3ZEhJNEVqSlJSbDJwY3RDZExiaTBBTzczeTdY?=
 =?utf-8?B?YWlvdHhmYWl6Ti9SWmdkc2JjejhpVUZONFZXdDRQMzVKbzlmWmpOVFlZZEtv?=
 =?utf-8?B?d2hRbTc4cm42b3NiR1NpSUViZmJETUU4UmtmaXg1V1h3RkE2dGwrcGtkU0JR?=
 =?utf-8?B?TzNUeVArWDBrckZoZzM5VnAzcG9IUWE0WncyMFFVTWxpWHArNVpSM3JSTk5G?=
 =?utf-8?B?K1o4TTVGM0JXNSt5S0lxWUtlS3JuMmJUMDBNaFBTQ2J3SnRnQ0k1Y3Z4OGNU?=
 =?utf-8?B?ckgyeW9XS3dtUStwTHhjQnM0ZHBwazU0YVV5QWk1Nm84U1Brek1wSGcvVWJs?=
 =?utf-8?B?cVlTUUpHVFBLOGhBR2JYblhuOUQ4ZzlDem9ZUXZuVVhyTitkbzJrclV1dCtI?=
 =?utf-8?B?bkhtajg1YUwvNHNDc2JIK3lUa2cyZXUyRDV0Tzk2b0thTXgweTViNlMvdlJx?=
 =?utf-8?B?NlZmMVd1OFZYelN2aEcxQUpXYjMzK25pdzd1UmVYbVp2Z0F2RVllZG05Tyt0?=
 =?utf-8?B?ZkxTMERoTVZTSG05YjMzSzZSOUFJU2hsQnI4UTdPRzJON2N2ZGw3VlJ3R2Iz?=
 =?utf-8?B?eWI1VTdXelpYcy9uYytaanU2RVhsajhHVmNCb2h4NUVZQ1hUT2dIZk83Vk1P?=
 =?utf-8?B?RkRua2NCZXZCcGszU2JUYlhpS3NtV0lWMDFZZEF2d1FoamFpZCtmSHVRR0tE?=
 =?utf-8?B?a3FCME0vMS8xaENjRHpDRnVDbnF2NmpDM2tHUFFYbld2eDNXM0pTUTFsempU?=
 =?utf-8?B?TnlQaEkyeXNmdWNDeWFaV2ZzZDZMN1drVjIyQU8yRlpTOXMxaVJaWXUrRVUw?=
 =?utf-8?Q?mGE6ezIJqMf2Uu+VkSW540Sjd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11b1c67-eec0-41b5-3ef2-08db65ad13b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 10:10:23.8803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMqqcf1ipSoveOckhtwxpk+xdZG+qZXL6imVeGy2HZ+N3Dzr9ev6kfrJ1aytUx3BNDVl5Gv+Fdlg2Fz5AijDVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8800

On 05.06.2023 12:05, Andrew Cooper wrote:
> Insecure the word being looked for here.  Especially given the nature of the

Nit: Missing "is"?

> sole caller, and the (correct) comment next to it.
> 
> I've left the taint constant as 'U' as it's a rather more user-visible.
> 
> Fixes: 82c0d3d491cc ("xen: Add an unsecure Taint type")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> I'm happy to change 'U' to 'I' if we think that no-one is going to be impacted
> by it.  I just wasn't sure.

I agree with what you have done, i.e. leaving it as is.

Jan

