Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D34694D85
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 17:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494764.764920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRc7n-0008JP-7i; Mon, 13 Feb 2023 16:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494764.764920; Mon, 13 Feb 2023 16:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRc7n-0008Gl-3g; Mon, 13 Feb 2023 16:56:19 +0000
Received: by outflank-mailman (input) for mailman id 494764;
 Mon, 13 Feb 2023 16:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRc7l-0008Ge-0u
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 16:56:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 535fba3c-abbf-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 17:56:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8904.eurprd04.prod.outlook.com (2603:10a6:10:2e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 16:55:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 16:55:44 +0000
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
X-Inumbo-ID: 535fba3c-abbf-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhJmU64giZB+grtDF7976FgwtAz3wTSji4EJpNGKsQ8F+YldGlqO0EMy3O0HT3LX16D8EOOdR3SHRagOhnrH7ylgUExEbBHX7Tunh6V3A/9pg7Oxwd/5dUUNG/si60mkHsaeyUfA//W621kkFxD3Q0WsecuKE9porWG696nLn8czwID4n7QnSeMFBH5JuNGgFD31lCi+jhzUidMrUC4GFQuFJTLgIXF/labljp4BJETkz44UmtyEgoZ388dR1EVxDeRz2sD6+jAH+XMCLnx5d8U4cxBnbUbL0Nz95D7CUzchZDsls1zYbKz7h3HkrLCQNIaa6d+E0Sng65KCVOOY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqhLLib1GKLw/+3JPpyq4zDc/2kFdwRU9iO3aoWRA6E=;
 b=O9nKIsiQqfVUJZELSI7qSEXQr+TfVgqymyviUESHyQDDUqN1uHQwc6rjwvNCji47pSVlcdPhaOIW234zWoYhUVFoHENeiOa4bPTN1A6FYdGG5qNibm/uvYZn6iHN0MbDcC9j8v/gWfFjYtG/oqgCNE/KD2kyldPSq5A9mR2kTzaSUwlR/bjIlAOftplWpFTViPbbZDB2YflhIDrZlaivQpWuBnPOGBfr8QLlLUp112db3RTMGzoDvFUOXt305BSsC4XTTI/j8AYmHXoPOKYhIP/frU9L2Krjamkai8SZlyF0IqD58OM9/G0C1HP8kgfUMyYSdKStogxu0RK/bERbxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqhLLib1GKLw/+3JPpyq4zDc/2kFdwRU9iO3aoWRA6E=;
 b=oE7qcF/7OJ8IqnIpXUJTbSrappygbsiWppktitEx3W1CJ/J+uyfPGaEvLNatLYcznKfcQkUXd9idTRwl4/kZiHLd8KWEWxN2wTX7WUFU7UNIAm8CR4ZCbeol/A7JcUw/8O6DTTzlgx/HMotykBVyXHxYPlwzh8A6TBFmvZsgtjtGoMh5/J0yrampuBlwj5MK9A89VJde2xXMAcYf2ZG29x2kaVgsVAv7hlSZXUlabmiiTJySmykbmjo7Ea7s6CMXT7TrfDqm+EstrQevkmTmBK9jdG/v4hiSiC3IgHtp7bCd9gUQqrET7PL+v44mt6gEnTcN2q/wBUiUw52psHE7IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a46aff0c-87cd-6964-d93d-5cf16a2d1b7e@suse.com>
Date: Mon, 13 Feb 2023 17:55:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC 03/10] x86/p2m: guard vmx specific ept functions with
 INTEL_VMX
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
 <20230213145751.1047236-4-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230213145751.1047236-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb29f34-38d4-4611-4f13-08db0de3255a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	31h1V3cW9ns7RPZIW1HDWlGNTWn3n8h6m0MfM2gmXWiFX8to6GM5/dnFP/Bv8atrnr2A5baijDU+/K09nUVSUJK1Z/lA0TeDAK99ZHyuKcJUEHyRUqZWUuQSYCeFa1AvQ4gEH2rc48WJWYKFQJh3HaTXlk/AZV0wImcv2EHxxsNnd5aPI7eIiGb5D5i56KckM76KimHRP0jJrVIL6iAtgF2/AgGIBlekWD9kHLlzXycAVZ8eBgxSIv9498ed473f/XXhMYCUIgmQzxGh9OiH0+u4BXKpMlrz2vUfsZHlcPtLhzK7z8VMgX9RnGlS/33/KU6DDOvxG+kTpfDRKD7jgFTJx5pGUFp721PZ34DkP8R2h0T5n2zoU+Ffm6i+Jx44bI9zRh1RvTo1be6yAa+ragl3/vW7h1qEfOC1QzNLz9u3dYicDcOn1YGcqvuqDKJpR6AJTJukNtrYPUI52eXh+J0FR2HVRY7qm+q8KDyJ4jeAmKDCV0q2SArQSwWg3woj1VSu3cYs/P0S5jblwClS82p87G1aLozWUSSdDHm86M27qkz5dF2MqTrXeIqF3R19kfU9CRljm6YcypdigTZSOSn6BN6Af2ZXl+gnLYr/HF+sJU1yhfZRa/D44nkKaXdTakXxk06s3MvPNAQYdIivBdI1PT7rPLqx11HXIVBhrQWKsjomfJSuSMs8W2ACS2nSE4AdUpOGp1sxZ/qsK4VOjaMXXf45D9r9ROtFd8Xm7qo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199018)(31686004)(2906002)(5660300002)(8936002)(4744005)(41300700001)(6916009)(4326008)(6486002)(36756003)(6666004)(186003)(66946007)(6512007)(53546011)(2616005)(6506007)(26005)(86362001)(31696002)(66556008)(478600001)(66476007)(8676002)(54906003)(38100700002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVBNOUxoaCtoVlhpeGI0a1FRWXYvaWRqR2hpMjJrYkE5cVdLWkRYTGMrR0dB?=
 =?utf-8?B?ckhiekFYUmlQcFYzNVlJY21mODdHYzJIc1B3aUsrVm5WWFI5UGp0NjFIMkNO?=
 =?utf-8?B?MG1YK2E5YVRhZG9EcXMwWW5pOTFQNDhiUDdNT1RCdVJ5UExvRW5nT2hQbU4w?=
 =?utf-8?B?V2I3SDRQRnZsWERid0IwZFR0d1ZHNlhsR0M4TW1zTC9BbUNld0Y4c0FJYWJJ?=
 =?utf-8?B?RmFIV0tGTHUzc1NQK2w4ck9kOW1QaURCRU9rbjdqcDJhbnhsOUIrc2paaXhw?=
 =?utf-8?B?T055VXFkc1RyRE9MS29MdzRYUkN0TEtrK0lnTXhPL3N1UUdkTW1IeFFYUzJi?=
 =?utf-8?B?VU5pZEczNWxxeEtQYk1IQlF6cFl0N3FzZHJ2cldUTjY4M3VINjBxb1RVYWJZ?=
 =?utf-8?B?UHNmN0FlMU1QVU9XLzhTSUpLd0t3bHhyOGxzM3BvUHVFU2ovU2duY05JUEZS?=
 =?utf-8?B?Uk1rcWFQWmVuS240UVpHeWJQaythUzdsZUxyTDVvYy9WeXFnZ2dKRVRLN0Ir?=
 =?utf-8?B?R1k1MHd2VnJWTm94U1d4QUJ0ODcwOE5WK1VKNW1TSGFscllOemMzazFYdTR3?=
 =?utf-8?B?cy9aNUlVZjUwYVUzayt5UVVVeS9aVlR3V0huU0krQ2tKS290dUhOTk95YU1S?=
 =?utf-8?B?MWlqV2hDUS83Q0RuT1RYTWkwd2xCdVhKUnBLMi9nYmlmVWNsQ2NVaFRNV05w?=
 =?utf-8?B?dlR6eWZOY05mT1QrMmZ1MVdQTGlSV2FSbVFUclJhbFkwMGZwWnNNZmhBT0Na?=
 =?utf-8?B?RWx0MFVJVmlpS1FaNEJVWEdieExpOWpwYzVadEZRNnN6ZkYwazN1cHFrTFg0?=
 =?utf-8?B?QmVIallMbG0xMDNoUDE0NHlFK2RPSDk4WlF5dkRHbWJkeGlDM0hmRjNVTktE?=
 =?utf-8?B?VUZqN0FzSGl1M3VqbDlZakpPbjhyV0FCZDJiT1paY00vSzQ1bG15UE9Nckd2?=
 =?utf-8?B?WnVRM0ZZNncxWU5senZVZ04rK0QvYm9MVFFjeVI5bXhxb1FUUzBvQTZOSksy?=
 =?utf-8?B?b0MzN2lKU29MNUpBUjZzOVYxeTBOQzhQMGtNeGliUXhWU0drbWgzUHdzbEdI?=
 =?utf-8?B?aGsyQmkzUHdVNHpzNnRHd0YyV291ZVp0QVkwT01KZlF4aDBzenhsdE55Qyto?=
 =?utf-8?B?cC9IMldmQS9rUElCYzZhUjZIaWI1cDdKTm41UHk4UE1tYjJRVkZwS2JPT1lB?=
 =?utf-8?B?dDRHS1kwR0pzUWNMUC9scFFKUnRHK0F2OFVmY1lsUjM1ZEJscFVhTC9GZFdU?=
 =?utf-8?B?QWVUcjY5alJLK1UwZmtZUXZnTHdNazFTa25rL2lOcjcyaXNrSldSWlROKzN6?=
 =?utf-8?B?dVhXVDRXZ2E5Y0c3TExtbFh4NGcxbHRaQnhWS3RyY2k5cDhkQVlXYVM1UzEz?=
 =?utf-8?B?MHpXNWc3RTRMSVdmS1QvZjhFdE14QllldGpjcUV4dk5kM1BWelI2dmVtUWdi?=
 =?utf-8?B?czBOTlUrQlR0TWZwZTFhbW4vY20vV3h1cnN5bHdCMS9hZnBOdysyMjNyT0VS?=
 =?utf-8?B?c1ZWeFZnN3hUT0hvVnZkN3Q0NDBOWENCNGJVNzErTktqUlpoMUM0K2pHYWVq?=
 =?utf-8?B?WkI5aFlaZWFXeTJ2ajl1V3VkSUY0Y2NyNlhtUFRjT05DOFA5RzEvRkplOVRH?=
 =?utf-8?B?TGdBT1EwRWdwaWNvYnFUdTU1TDhldW54T1JJZ2lFdGpyZnlSMURhUE1yaUlO?=
 =?utf-8?B?eGlwVXE5Smh3VUhGbVlYUGRjUFQ2Y0pXTlA0Q3Y3MVJSa25adnpQTncxQWEv?=
 =?utf-8?B?aTR0dW5BbFl2YWVCS2g4ZWlzTHRqQkZZcVlGbVV0dUQyWFkvbzlQQ0M3SFBo?=
 =?utf-8?B?TytCS3RZbXo1cmwvbXNHcmVhWHQyNWZzQTdZRElRUVVBUkd5TnNhbTNBeXlU?=
 =?utf-8?B?Mml5cXNPbVZoSjJvbnNjbWFiMEtjeklKZ1VwczEwWlRCWmRDSDdFTnZQekRW?=
 =?utf-8?B?SXJqZ1EzeXoxSVVIak5OV0N0S0lXcFUxaXNSZllrM3B6MDU3RC9QWGtkeVRx?=
 =?utf-8?B?OXVGbWlZV3lyRXpFTkFuV1RtQ0tEUW5QMlJpZ3dCR0VrNW9lc2FQWEo2dDRJ?=
 =?utf-8?B?enI4K010dTdBbnRqUlNsdEp3SHZFc0FtbkkvU2xUSnRndFNTbk5MRDVtbnlW?=
 =?utf-8?Q?H4SiUtB8lV4+yDqZHOCU3A80M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb29f34-38d4-4611-4f13-08db0de3255a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 16:55:44.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iu2fenuSyA/JlkzDRce+r72ibFWUG5FkfsogeD/qd1IztXGkhwG/iHHpC8Ml0Ol3/GWArnkIklOA2VVhP+fiaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8904

On 13.02.2023 15:57, Xenia Ragiadakou wrote:
> --- a/xen/arch/x86/mm/p2m.h
> +++ b/xen/arch/x86/mm/p2m.h
> @@ -35,9 +35,25 @@ void p2m_nestedp2m_init(struct p2m_domain *p2m);
>  int p2m_init_nestedp2m(struct domain *d);
>  void p2m_teardown_nestedp2m(struct domain *d);
>  
> +#ifdef CONFIG_INTEL_VMX
>  int ept_p2m_init(struct p2m_domain *p2m);
>  void ept_p2m_uninit(struct p2m_domain *p2m);

For the calls from p2m_initialise() and p2m_free_one() see my reply
to patch 2. For the calls from altp2m functions, including ...

>  void p2m_init_altp2m_ept(struct domain *d, unsigned int i);

... to this one, I think you want to be more rigorous and hide much
(most?) of altp2m altogether when !VMX. (It is perhaps high time
for more of that code to move from p2m.c to altp2m.c, and altp2m.c
then, if it doesn't already, to become dependent on VMX somewhere
in the Makefile in your series.)

Jan

