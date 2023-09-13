Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40ECD79E23F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 10:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601072.936977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgLLK-00009p-MS; Wed, 13 Sep 2023 08:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601072.936977; Wed, 13 Sep 2023 08:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgLLK-00007U-Ik; Wed, 13 Sep 2023 08:35:26 +0000
Received: by outflank-mailman (input) for mailman id 601072;
 Wed, 13 Sep 2023 08:35:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgLLI-000073-F1
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 08:35:24 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a65d793-5210-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 10:35:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7624.eurprd04.prod.outlook.com (2603:10a6:20b:291::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 08:35:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 08:35:19 +0000
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
X-Inumbo-ID: 7a65d793-5210-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvEaghUNuCUNf6scBtcxAbkj2yNhyxUJ0DeO3D1VH++/QDGZnO1taoA3uZr5KY6Gay4Sobv8EcGA7/VXc0vV5NNUTMxNLyYPwFZN/Mpa4GGRYQgPE7+3nRvxKYqObIaFgbfY/x6+kIqp9GMxJ8HRuHFnNR7VALCu/xgRlGiQ7M7iMc5Se9I/7Pr/Acgd3Fu/EtK5OWlTuzhOZHOl+GT1kDKyEZ39UrttvNfTNN1Gwabwurd/j2Wtx+JvIqcLBFg0tmdKHcU+wKG8sESy2bon40AbJc6XUBZqypQYa0gW7Nailhjy3Wt43xHB1L+84h9Fubfps4HYpfxpsn4Wzlpv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1bQXTDcRQIo49K1nvAhUTynBFFpslOn+50ptg0j/eo=;
 b=D42LbD4HLObhUCXsVPXKWyUuK35XhUiaqmITFfZBWtoUXihzDvGyw4IJr6OWhK08KQtrfBshmKGQKGhsbfW2+0z4vo5JmnF5w230e06edga5E28nLs6pj47VOMas+c/XfejNIxrGvIWopq2lCdSTz6FgyNNEesphzaJSlV0goWb0ZEqTU4IgPrhFK5ddAfHeRfQFPckvBsvd0cliUqi2rHJYjgm8AQ4nPhuFVOFE9HZagwxAxrW1DkeGFmxMS1ma35/+IK0yE2vcql4JktpSyu1XeHAdCS+mX8HIUse0TNVfgmzZkDqpL7nV97IntRVTxk5+YFWFyi1GSoc9zXaQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1bQXTDcRQIo49K1nvAhUTynBFFpslOn+50ptg0j/eo=;
 b=V3FwXqhdn9u7EwEEETfczgdFCBDxGXGRCCHC9TZ7Ro+/K3TbNq9+tPVAcUpdT/VDtk/1GOqA1gmYgxlEQBcenb3xfSzs3TUtuUKgmnrIkQePIHzgVxr4tW4iJUbGIzm70I+TkN+kEut3wxQ6ijJbT3KHLvwcELvi+xZzHCVPOdtDlh4swHdbdFOV6LNwoR63twjna7j0PAs/kcag7amiLHvS1JB5UsdZHebUlbcZUmBkllpcDyCgZPVFaq1VbczbXMSSznznctC1IhRpoXsdVoT7Z3P/5eeTuBLPGSEypPYU23IAaZbO3Cedb0FP5UfriBQbJ59IMAwQmegmvcLnsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99bae9ae-1711-28ca-c464-e638f0edd7a6@suse.com>
Date: Wed, 13 Sep 2023 10:35:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <809ef122-7060-c033-e50d-6e372ab89de9@suse.com>
 <ZQFwyG3FwCzpezTR@MacBook-MacBook-Pro-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZQFwyG3FwCzpezTR@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 79240f45-0127-435b-5131-08dbb4345ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wophKMwVIVndbkgkM8tbzQ0ruslGRczRwJ9akkNM/8sPibM61C4zF5TN3rf2lBX9/w7blzwjfUAqS1NYxT8popBVP6v51newHq5tnlFgtoUZSb9b+YeoU2ubL2u/7RyzVZZnR3b+VEPpqsagnRhmB6HxRiKIQhEQbnoFT5oRM85mA1XSmqe3aZvOdRqQesLBopu9tet2pXFzQ0HnB9V19W739+gsziVo1kGK0YOXSq30Z0OwgfUKI59xlTnYoGlDmoAaVRTSTktfP8wqUikTtJXmbxgbU8xwbllrsnKi8cKZDqs/pwdtBYZUOLdLx8wXK9kdJ7Xn2LBcuTrLylEraN7SkhM8kjE0lXouskzggvrKjKH3GyqmGnBya/j7Bjr/BELhc/FkvOjsPc8GZfKkymTwzZ/VpQvZMkIoNKfW7DaLxmPr8G+u4Q/Aa2+zpaZ7Osb143PBTN2IyUwmhx/PyHxfREZVE0QHhp9lwXWca7EJfpPDIxmpBeevD2pFWX5LLpgLHQBe9XqqPhW2HSK8uxNmFdFthdLVJMFaN7CzhFB1IEQxHvbIL3DL5NZMq1k213Yf5kquOSCOrX0wKiKPO4nlrl3+dYmTq9I6amPyqMzg5YZb7fSA37MSTWNRVp3vOoYmW9j1qRuR3AO9D2ECKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(186009)(451199024)(1800799009)(31686004)(6486002)(6506007)(53546011)(36756003)(31696002)(86362001)(38100700002)(2616005)(26005)(2906002)(6512007)(478600001)(83380400001)(5660300002)(4326008)(6916009)(316002)(8676002)(8936002)(41300700001)(66556008)(66476007)(66946007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3JwU3BBOWhZejBuY2E1TzhDL2QzWXRpcklieGdqQVdLQzRJQllvZFdSdE5x?=
 =?utf-8?B?eXRTNklVYk5LME55bGdaNFBTZjZlZ2ovQkdjUlE0Ny96UVhKQ2o3OFFPS3hP?=
 =?utf-8?B?L0RVVWZGcTFaVDVqakw0dHF5VUpyV2lKL3A1ZysvWCtkUWtLczZ6dFJLZk0y?=
 =?utf-8?B?M1VUeEsxNkdSa25ZVktlTnpDRDE3MmxnT3h5TkN2TzdvNVMxak1sNUJtM2Rm?=
 =?utf-8?B?LytpUXJHY3NmZWlwSTZ5ZkdkZFFreFg3MENFNU1DY25HN1QrcDBKMmV3YVNM?=
 =?utf-8?B?UGdhTUtrM3JaSHpnUFNDQjlPREI5UzM4eWVlUnZWNHNOSnVCNDVIOGMrVjl2?=
 =?utf-8?B?WFQ2Z0lWQ2pOcFpYNEZwazBRMExUT1dveEM0WTJ5dFYySktKMVQyZUJ0dXp5?=
 =?utf-8?B?NEg3VUFaaWo0YVgyNjhwZnVESlVRU3ZhQzZPUFhkYW54b0E4WGVnNVM1WEdP?=
 =?utf-8?B?emhhUEY3SEROVkl0NlppOVhSczRMK1pMekh6OGFyTkRMcDNhUGI1NlFvTTBt?=
 =?utf-8?B?bHpkclIyR3NsdGc5Rmc4N3pQNElVYUJRYzFuZFhpWTg1c2NHamtpQkpPL1ZY?=
 =?utf-8?B?YnRHMVFva29Ld1lDTm9xUUNSd2VEdXdVQW5NdmE5WTdlMFhDQnhrd1RwUVB0?=
 =?utf-8?B?Z1lRcThLamtDRER2eHYvdVpiNXhPb3B4a0lOdE51THBEVUgzWFZQNmV4c0Jj?=
 =?utf-8?B?dEJqNUtjenU5ZGMraXVSWWxRT3Jpbm9veG4wN3VzSFpFQi9WcGlzNGxOb3ZX?=
 =?utf-8?B?dVFUOExzNmYxdm1GQTEyZk0vNUxsbEZpbHNwUVNuR2V3QUlCWEVmTmludUJB?=
 =?utf-8?B?UlNjOWxaQlZTWVQxUFRpWlhGNytUOUdiQy9GcHUrYzM4SE5rMThYcFV6UjZZ?=
 =?utf-8?B?dW54VExTRzBMV1Jodm9RRlg3SzEvYU1vcjVQWHZFbEs5cXNPTzF4OUVTdUZy?=
 =?utf-8?B?S3pDZjhmZ1BQdWMzUGE1cGNyK25YdUFpeGpETC9UajVRNjZJbGY4SEhkekI2?=
 =?utf-8?B?RE12UWtIbytxRDRsQmpnWHpVTmZHODcrNzhKYzVjdnd6S294TkRybW9Kd2Nr?=
 =?utf-8?B?Z3Z0UWRFN2FTR3RFQjArMStkWjdEc1BCbFBXbWczNmc5U1dpMEppL0VrSXI3?=
 =?utf-8?B?UllDTC81U1RsMUZld2IwYlBqSENidnZtOGhsUVNtK1NPdFowTS9PeTYrdEhM?=
 =?utf-8?B?ME41SXNBZ1NqcHJTRkhVUzVIU2RVZ2xvbE1zRDhHQXJLa1hVMTNVcHEwU1d5?=
 =?utf-8?B?YVc5MzVrRGFJeStVWlQ0ejFEQmZKa1B6c001YlpISC9lcGsvWGhHVjkxL3Iy?=
 =?utf-8?B?RFhqZGNyU25RTnQwSTg5dVN6NWV0anJ1T0E4eVR2RUR1SVhPYlNuekd6STNH?=
 =?utf-8?B?L3cvTk5PaFRpZXFBYkI5TmRWS2Ywdy9QUzdjWm1RcUljdDBTalUxS2ZLREIz?=
 =?utf-8?B?RU9FbHdBandCdWpqYnFJaFh1MEpUVm1tU2huUFU3TXJkdmxOMnd5M2lldkt2?=
 =?utf-8?B?YkU2M1MrTGphS3RtWHlkdGRUVExzaWROTS9DNERTVjZVcFd5NUVSREVPMWcy?=
 =?utf-8?B?MWNiUEI4M25hTnFiRTYrejZBSlZmY04xMXVOWFVGMzhnVDJUMlZZYmJrVWFV?=
 =?utf-8?B?WnZFb0RNNzhlZVNJcXJPU0svOFhYaGFGZkhyS3lxbUNYdmRGSGJzbGZ3SXhV?=
 =?utf-8?B?WlVxK3NVazBpZDVBZHB5MHlQSWp5azZtQVhwYzhHR0FTcE42NUJoeHdvYi9D?=
 =?utf-8?B?WVpnaThIa29PVm04dmNXZnoyS3MvOG0zL3pEV1NQVXZXT1haazFJL1BMN01u?=
 =?utf-8?B?bVYzSkhvMUp3d0ZMZ09uUGMxdXhHRWc5SGR6cXU2L1ZtNVFOL04zRFIxK3BD?=
 =?utf-8?B?WTl6MG92Z0NLV3VKck8vWG9BQjRtODJUZW1jektldFR1cDJWREZOblM3L1Vn?=
 =?utf-8?B?WWYrVlF1TEZmTzk0V3B1a3FmQ2tXVG9takFCVENHc0syMFhNaHZEZXF2TFVL?=
 =?utf-8?B?VERFdHZJbDJoQWladUpjV0ZLSXgxbkloTFM1b1FnamNacWRLUXZ0TnVXMUs2?=
 =?utf-8?B?RjN3cHJLdGpVcVRwZU1LSUVyRG1WblV3SUtUUDhKcEVIbi9mZVBjNW9Ld0Iy?=
 =?utf-8?Q?jdCNuCd37yR2c5pyaBUZFuUVI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79240f45-0127-435b-5131-08dbb4345ce4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 08:35:19.4112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQmy0WcK9AVsMF8d3Ls1cX4wmdOxxODIhpx6pHIdOuqLxgN2ex8mHMTqCcUFllO7DD0n8zHaAEqyT7XEuNVIDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7624

On 13.09.2023 10:20, Roger Pau Monné wrote:
> On Wed, Sep 13, 2023 at 08:14:46AM +0200, Jan Beulich wrote:
>> On 12.09.2023 18:23, Roger Pau Monne wrote:
>>> OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
>>> set, and will also attempt to unconditionally access HWCR if the TSC is
>>> reported as Invariant.
>>>
>>> The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
>>> (bogus) warning message, but doing so at the cost of OpenBSD not booting is not
>>> a suitable solution.
>>
>> Why is the warning bogus? The PPR doesn't even state what the bit being
>> clear means; it's a r/o one. On respective families it cannot possibly
>> be correct to expose it clear.
> 
> There are other bits in the same MSR that only state the meaning of
> one value and are not r/o, so my take is that being clear means "The
> TSC doesn't increment at the P0 frequency".
> 
> Since it's model specific, it should be possible for some models to
> have the bit clear.

The code that's in there right now already has a family >= 0x10 check.
The Fam10 BKDG says (among other things) "BIOS should program this bit
to 1." That, imo, doesn't leave much room for the bit being clear once
an OS (or hypervisor) gains control from firmware.

>>> In order to fix expose an empty HWCR.
>>>
>>> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> Not sure whether we want to expose something when is_cpufreq_controller() is
>>> true, seeing as there's a special wrmsr handler for the same MSR in that case.
>>> Likely should be done for PV only, but also likely quite bogus.
>>
>> Well, keying to is_cpufreq_controller() is indeed questionable, but is
>> there any reason to not minimally expose the bit correctly when a
>> domain cannot migrate?
> 
> We would then also need to expose PSTATE0 at least to make OpenBSD
> happy (and any otehr guest that makes the connection between
> TscFreqSel and getting the P0 frequency from PSTATE0.

If any such OSes can be used as Dom0, yes. And as said before, I view
exposing PSTATE0 (with zero value) as a viable alternative to your
partial revert anyway. What varies across families is how many PSTATEn
there are, but at least starting from Fam10 PSTATE0 looks to always be
there, with the top bit indicating validity of the other defined bits.

Jan

