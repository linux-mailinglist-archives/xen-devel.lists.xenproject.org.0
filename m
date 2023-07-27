Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6AF765839
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 18:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571218.894555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP3TX-0006lI-5W; Thu, 27 Jul 2023 16:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571218.894555; Thu, 27 Jul 2023 16:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP3TX-0006jI-2C; Thu, 27 Jul 2023 16:04:27 +0000
Received: by outflank-mailman (input) for mailman id 571218;
 Thu, 27 Jul 2023 16:04:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5Ij=DN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qP3TV-0006jC-Df
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 16:04:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4097aa4a-2c97-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 18:04:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7411.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 16:04:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 16:04:21 +0000
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
X-Inumbo-ID: 4097aa4a-2c97-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdZMsRFUt/xVHmN1kfruXLy+jK9QzAthJTRj2CqegqI2r/3ag/2wtwyWFw4ui9w9gb9P6gTeTr1gkB+yWR3gqAKF9LLdZDeSU1vPB0s5Hwd6gxu1OSkvD0l6ewtblDv9XOVaVbjAIH139CKP3mANKgwhYaLzZYm6/kFGDWbxveKk4jPpoqe6S2HUXa+GqTR8+IW1GGoGGUxzPaQs1AgsjjVd4LvvOuVBQeeeT5JWZBRPvOAvzG75iJ/iINfhvix+apVoKM1zOH9/VtK1ZnDsQ3SndO3I/j8FWeYB36W4ELveNzJIQn0iz51PAIdyRw5erW76qOzxzVQM0RHptHhEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEF8FQiQ+SO2NIYaQhyQWbriRw5ddlRxpsLEwF3/2wc=;
 b=A1BISJVRzp/4GvSSGqLQelX9fMhySoQLqtxgkeIt7RUAF10gc85J0exow1fxSsrmSQIQXA2COFpioX8obPlro0TyUYrWfr3UTzWcJFZQnSdLvB5wHxqn+os8c5unDeBpAfLMFUhtRwJIQJXEzZgYH6tpkgFmljIv0bLV1Sr6nNRjNUkO9MrJnKDQZl59YpvMFtqAaoMwAz9ZTaNv3gYV/7Yc83Hnca1rAwoFrCH0qiida97YH/3Y5lYWZfMRVfMjzYWq+wtPDG4+0UHvh7dPJI4sfPaZ5YWmJncfo06R+NUNJS3uFxvtRg/WnepmWbvrj5x1vnKcRVv2x8fxA48lAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEF8FQiQ+SO2NIYaQhyQWbriRw5ddlRxpsLEwF3/2wc=;
 b=goNUVHeQXe7wo7YlOPcHL4BQ6b5bS+hai3YPg+STLTy7ZijgeUu1VWv7lrwal4Fwzr2r+YTUgPuUBxr4e74Lhkl8jOcxTsV7piH8zme/CM0tZQmrM447Y836ppH87mw9AalG3v5rMkAJDCgGu0QRszuh09QST6ga0QTSPFpgRhkQUNYQNpLGL+4KzV4VdT3po4p0aDGs04qks35LZYi2huihM29u1tW8oQwMZQwzGq66sSqRJk5DFsIzQljzRaIDkCqEk9DrcVpdpaAF1YmeCMUi8LTXqmqiYNCMYefKGVtUkekI6HkXG3VYq0Uh1q2XjLtwxqjgDxwlW/KLwiPZMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <634aea51-619d-b86a-2a6d-9c2794f4fd55@suse.com>
Date: Thu, 27 Jul 2023 18:04:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH 4/4] x86: avoid shadowing to address MISRA C:2012 Rule
 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690449587.git.nicola.vetrini@bugseng.com>
 <10606d7429239b5a2b7dffcb22eeb1ce5e73e991.1690449587.git.nicola.vetrini@bugseng.com>
 <fdd04423-f38d-1575-62e7-4d452e396c51@suse.com>
 <da8ca9ee-d60b-a765-35ff-944b51f940f7@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <da8ca9ee-d60b-a765-35ff-944b51f940f7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dbe12a8-928e-4849-0e9f-08db8ebb23d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Eujl3P9LmwdKlwGhI4BqvVb+1DF8dzzdBEXoBhXPBQM5VJAwAj+aUXFMg+F7mH6hSv6/1nBDmzKa7/gV8TSZK1yGZckVnejIKy/RvqY0rTI1Dsl5wOY0bBtiJy0eMCCDGNXRuFS/U49Uv23QXlAjmh8tDbnHUX54CADE0bE+rZ2m7pH5yt8L7AOaJsr9C5O0PENdYmxLThAW1FOBuC92sP2IOxltcMqkvDKdCROUME2KG/UAWURWN5Eso695EDEx1EWW5r+eP+CVRQS7/cPOWqUJ2HeqeqLtP00LVlCoVs5Pkac7MLR8vXcujJemA+TbbkqGbd2c3FdgEe2fBZzWbhu6gYCnwL4IbLflAjAJ4H4jC0ncnhWHfBANQ6WXAAsb9BLrMByBTdjD/Ee8l4Gut2ZCjadgGpE/sGHUlDmjsaRP22QUQDh6ZeAesOyBHtRtwMCmL6J6mzTHikVBL/frAUylRpZNLK3YWW6QJINO1be3EXFX1r76aX3EbedHLx2DFgJ1i92tzdQ2T9+/XkOTKS8ANhGeE8E4ak9MbvxZqShLv2pkyFg0KIKdY6x/WF/jci7xGEVFDXbxYO8r+xrrocGc1X14AdIsUEj2vxcW7K/DJD5CcyxLQ/2QwQIHwuB1bZ+NbkGTEqC4FRWOEwXMPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(6486002)(54906003)(478600001)(6512007)(26005)(53546011)(186003)(6506007)(2616005)(66556008)(2906002)(66476007)(4326008)(316002)(8676002)(6916009)(8936002)(41300700001)(7416002)(5660300002)(66946007)(38100700002)(86362001)(31696002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmNxbnc4WTNGUWFXRlR1ZHBTNkR1T1pMTTRkQkhoZ0ZNdmFRNEUxL3Q3VjUr?=
 =?utf-8?B?T1h1Vmp5akIvMmoxTFR5WGY2dTcraGpXRXMwU09Xc21uMmYzUkx1VkZvS3pv?=
 =?utf-8?B?Ni9MS1ZYVDZZeWJTbVFnSjg1cCttTFNSOGR6VkFEYUM1c0FqZmg5K2JXdi80?=
 =?utf-8?B?OFVLdEZQT1ZtVnQ3WUJMajdNR29BQkdkR0kySmhVYU9CbjQwTmJiVzFRekhi?=
 =?utf-8?B?cWJDY3M5Y20rQjZza3F1bFFKTmFXZXVaR1JsK04xUG9wcnovbGFWWmowanNC?=
 =?utf-8?B?Zk5WNzFJaWRKSGZidFREUlYzdEZpc2NTSlFzcnNEOWY5a0loNnJ5aGtCaVQ5?=
 =?utf-8?B?THBWcVNxRmNTQVBteVdQNURnMzB2b3NMV0lpeHJKUDgzamgxdGdWWlNxY2RU?=
 =?utf-8?B?eXlRUWhxN2h3NnRUTkowMUhtcmNFMjB6VUNzTFJHcUgvTXNrWjZtWjYyU1cz?=
 =?utf-8?B?eDVPZ09qQnIwem92S2VVSHYrRTk3bWdydDB4eHlQcjJjL3pIVTJqZFdQODFw?=
 =?utf-8?B?c2xnSDV6NGIrd29yb2FvQXY0M3QxS2RMTHQxMEV3a2h3NDk4OGlYYlg3OUc5?=
 =?utf-8?B?N3BGd1o4TE1rQ1lwSnNnL0puaU00eTc4dHJITENqejVTOXJ4MWUrUm45VStj?=
 =?utf-8?B?T0RMZHZCeEtwVUNYZVBBRCtNeW04ZDc4TzUyVGwyeDR3M3JqV1kvZkVVMDVk?=
 =?utf-8?B?UGxlNmZ3TEhiNTdWS05uQVZ2cUwyK0JKb1YxZzQxMnlZaDM5VXcxUEx3b3lO?=
 =?utf-8?B?OGJTMmxMWmhieEZCemg4dlpzd3lQQ2tvVUJLMDM2bUhNSTMyWlQwb1NIVHFy?=
 =?utf-8?B?RWdUNjVCRmU1b0FzZzZ5LzBXQUMwQUpQa0NqK2RpcldBcDhObmlJMlVjN3VV?=
 =?utf-8?B?bGJQcmpkNWRKd1lFbk5WRGRac01WTDh6cHhsbVZBTHFtci8yakpOakV5T0E0?=
 =?utf-8?B?RmxIMlpHaG1YZ00veVUrYzhBNE1mNThKM1JidDNiMmNWTFhLRHdJdTJmclVm?=
 =?utf-8?B?TVVTNEl2L3Mra3h5WEtGMzk3MDg3VitzTWxvVUZXVGZORyt1b1lVYUpBUEZS?=
 =?utf-8?B?WlRJamg2QjhUc2trYnM2V0ZTWkhLc2ovaG54R2F5dlVxRmJFNU1pZjRNRUtG?=
 =?utf-8?B?RDhNOVlGcE5qcFgvVGxCRWx5M1ptVnlDaEFTWERWcXVJV3p0UFpEMDhGcWxX?=
 =?utf-8?B?cjl2NUNGOWQ0R2I1S2pjOHQ5ckFpeWR3Q0VNbmM4Rm9pMjQ1OXE2V2h5d1Ra?=
 =?utf-8?B?eDdaQlppbTdXa05TQVE1SmZOVnBETW1WMEh1NldTNXBvamE5WFFGdU9sNGQ2?=
 =?utf-8?B?Rm9DeGUzM1h1MHVIT2M3SjMvSjRTUUltZnJ2Skp5cVAyNGdyNVpBNlNDaEpK?=
 =?utf-8?B?T2NKVXd1c0g5aEwveFlWSjVTMzJUeGw3VXVBWUpNVnNaTE9vbXNUczZleEFr?=
 =?utf-8?B?cG4zd3BlRmY2WDhXaHNiZXRHSXdnUHFLTm1nY1NBdkJINjVERXZ2eVlYbXE2?=
 =?utf-8?B?cFBOUUVRL0UzTERod2R0MDM4VGVteUMwQldjTDUxS0htUlBlem8yek5QUXNy?=
 =?utf-8?B?TXp3bEZNRXZ5N0pTVVc5OWZKU1V0ZDFmTG9sOXliY3hrNUxIU0dFVjB1SnFY?=
 =?utf-8?B?RXAvNXNDK0Y1bWtsb0FKZldkYnpESVhoTnlkMk1hNmtoUW1hOEd1c1JFQUZj?=
 =?utf-8?B?eTFEMVJJSi95RnFOaUtQOTBPL01ESVA2eEg3L3duUWUwMENMM2pDT2F4bTNt?=
 =?utf-8?B?cy9XR25GYlhPWlJrNW83VmhzU1U0ZGJKTDh1UUNoTkhvSGRoaDZsOHB5dkc0?=
 =?utf-8?B?UzloOG5QTWNoQnQ4T3FjWmlSRC9mbVQzQzN3MWVSenhWRWg3MUltTk1mQW1m?=
 =?utf-8?B?RTdXUjMzRWErcHZtbStlYUFDMDVaeFVseFVuTGhwdGxQQmJjUHpwVnpTRXN0?=
 =?utf-8?B?SWZDOEhiNWUwcnlTNGRvZHM4cXdRZHQvWDdlQ1ZEWGE5WFplREM4Rmh3dngz?=
 =?utf-8?B?THB1VVBzU3h6Tng3cmtPenRobWxmWlRKTnVCZFQ0RnBNNTJOQ2M3UzdZODhY?=
 =?utf-8?B?UzR5cWJiS1hjMmhkbkhTTlFLak5XY2I0MFkzZ2xvVko0amFZVFhnM056clFG?=
 =?utf-8?Q?LhNZPw2i6c/5ca8YAWaz4QJqR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dbe12a8-928e-4849-0e9f-08db8ebb23d1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 16:04:21.5157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAx7ngLoE9e/86YFw9FKxJdEAYhKU0gT0pcpvTgxO4mPhqBI3ZyeqO00HAbpjxKn/mtDINzzhsYNIQu2GfAk4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7411

On 27.07.2023 17:58, Nicola Vetrini wrote:
> 
> 
> On 27/07/23 17:41, Jan Beulich wrote:
>> On 27.07.2023 12:48, Nicola Vetrini wrote:
>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>> @@ -1483,7 +1483,7 @@ x86_emulate(
>>>       {
>>>           enum x86_segment seg;
>>>           struct segment_register cs, sreg;
>>> -        struct cpuid_leaf cpuid_leaf;
>>> +        struct cpuid_leaf res;
>>
>> This is too generic a name for a variable with a scope of several
>> thousand lines. Perhaps just "leaf"?
> 
> It can also be defined inside the switch clause, since it has no other 
> purpose than store a result.

That would be more code churn, though.

>>> @@ -8408,8 +8408,6 @@ x86_emulate(
>>>           generate_exception(X86_EXC_MF);
>>>       if ( stub_exn.info.fields.trapnr == X86_EXC_XM )
>>>       {
>>> -        unsigned long cr4;
>>> -
>>>           if ( !ops->read_cr || ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
>>>               cr4 = X86_CR4_OSXMMEXCPT;
>>>           generate_exception(cr4 & X86_CR4_OSXMMEXCPT ? X86_EXC_XM : X86_EXC_UD);
>>
>> This change looks okay to me, but I'd like to strongly encourage
>> you to split both changes. They're of different nature, and for
>> the latter it may even be worthwhile pointing out when exactly
>> this duplication of variables was introduced (it clearly would
>> better have been avoided).
>>
> 
> I did it this way because they are the only violations of R5.3 left in 
> this file (among those not subject to deviation). By splitting you mean 
> two patches in this series or a separate patch just for this change?

Separate or within a series doesn't matter. Just preferably not in
the same patch. (And btw, if you split larger patches more, some of
your changes may also go in more quickly. Yet of course this shouldn't
get too fine grained.)

Jan

