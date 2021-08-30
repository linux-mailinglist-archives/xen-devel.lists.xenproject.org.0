Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4CF3FB707
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 15:35:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175099.319077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKhR4-0007kC-VT; Mon, 30 Aug 2021 13:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175099.319077; Mon, 30 Aug 2021 13:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKhR4-0007iG-S4; Mon, 30 Aug 2021 13:34:50 +0000
Received: by outflank-mailman (input) for mailman id 175099;
 Mon, 30 Aug 2021 13:34:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mKhR3-0007iA-52
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 13:34:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a57d58fc-4d50-4af8-88f3-4969fe03bd48;
 Mon, 30 Aug 2021 13:34:47 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-mZiRyILsNwWGqJMBHeZD_Q-1; Mon, 30 Aug 2021 15:34:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 13:34:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:34:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0086.eurprd05.prod.outlook.com (2603:10a6:207:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 13:34:42 +0000
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
X-Inumbo-ID: a57d58fc-4d50-4af8-88f3-4969fe03bd48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630330486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OydfQp5+YXHTSznbrPHkkqn3D7DR6PRQpVd4MLB/D6Y=;
	b=Utj8gGZZLXjp6VtwMNw0PwscysDHn0pwcP/rpXPLsQVDzKV259pcoPeh2qPRkKhODlGSHZ
	HCsbMDD+DmKDZui+ci0pa/wwDdGPZl8VeoG8BMRI9wR/nDiWNC8ad3+WHAtLCG8/u36/4N
	nlMFqXhnxY7c1qTLAH2VSS3VXv+/iWw=
X-MC-Unique: mZiRyILsNwWGqJMBHeZD_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIFWHAIylqMf6VFuBLrcN8QHCMdefUwBy5G/h9wTYCOu8smVO6zPHzk+u3S3Vu1E2AIBAVHHR1fOXMxIzfdimenQrkcpBa42FfgYMyCWZjILMm0Z1BmllvCcmO97TFZu+X7rVMhShcfgQhIm4rSeMnNlzlin4lKRJIWKByzUQOFBd4MwSdkuakPGGm207Nj8x5/T3fqx5FFv51XSv0WWUEteZlkIOsIO6php4O/nIeqSRFZ2e4qGWZY8OlwJycBkXCwmaH3ew1GGJCjeI+9a2628/eeULVQXR0ddmRsNc3QgvNGBjTmAOuIZogYMfwqxYE9AfDSEWPQqFWl0aBR/RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OydfQp5+YXHTSznbrPHkkqn3D7DR6PRQpVd4MLB/D6Y=;
 b=Fq9lK7yxF2jK8ewDMc1aqA+f47tHG5jFMu/bBOgfCfhxoOZ+6H8By0kIiFGKbVqyPqUGOLxvGUcBWFRkMs0b0eJp3Vb0MKpajAQKWHKZp2Xb79hZj0aSWhzSDNmwUw+Lvi0MzVJyVIyHsaOoXqGSX1K/dKz4lp/dpHvoOAfW99c6kXwsFvvPXlMmH5K6lcSz+dVzd/e3vcTN9x6/x9eTTW4beQrrDdQKHb6PbM2/hOsWLRdqMptfgswehyYVVJPYM17GCJ8HMyon1n933Tw9ympJKzPjpWZOKwVyjRV6CahOv1h9N3DMfjl+S1PU21Vx/tswABtblCO3w74nMG+RoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 7/7] xsm: removing facade that XSM can be
 enabled/disabled
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20210805140644.357-1-dpsmith@apertussolutions.com>
 <20210805140644.357-8-dpsmith@apertussolutions.com>
 <bf13f9a0-dff6-033e-3632-8fc4f0533a20@suse.com>
 <94d6914c-57d4-e63b-1abe-88ef14186344@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb8bc2d1-caa1-3cbf-0796-5578faec41bd@suse.com>
Date: Mon, 30 Aug 2021 15:34:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <94d6914c-57d4-e63b-1abe-88ef14186344@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0086.eurprd05.prod.outlook.com
 (2603:10a6:207:1::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d78b3de2-d46f-466e-520b-08d96bbaecac
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2605FB7FAE7420EEB3C96FD1B3CB9@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	imRDZquLQwmqJL2uTG8/u1FmjPMuTFZMtwgAWg+j482/OQcwtvaaE1lkcz4BPq4v6t9xZ0iDg76MV9zfSOQdiGe8xIFqBBMnlT5rOF+Z+yOVA61kolBwEP91sdOdwGKxqhzDd+q8/hxrJvJIdr4Rq+52I+NPdn9y+XVuCS6bJOuonGskXHzbORNS/dcy1gael+mZF3jBJfeVeCyix0EZ699bILVVYsEm6HFN/CP88dyaHlCjxxo+lmOy5hwc64ZLHZY/cszsvHm6SRDco8oAEpbzlvKe8jN/E/LMyNMwl0AaOPMdpM75bcvGQA2n9RcnhkBPn7CXq1yuZU2prO5z0ebtbU3iTgd8RGA79/OCO0pNy/+k2H9UarBdBiBNiQiE08BT5vo/OSjPrIc7RGl175BasOhdUlp6AlBiZgGSv+W/Q5sYK0cbgIO+k1q2q6SA08PQMDcNbldwbCbjeOYoqKgJlalJMJm0Q838zW40wmrafqVLbaXp/0lccdw7fPlTbQrzYRVSmd5ZXceZ+bOdlYrTVbpPGMOcnT0rgHuXMth8HbR+D2XduV6buuOtcntrU6f+0gVO5Pn+3CaxgGoHUmArSj0am83QTHrCfUl6se1Y1CxkBUunacbojvJ8d9OmHBhdvl4WIMfG/DawnPbCgkDpyp0TvZsNPj8qFztfWti5Z7j4aBx5VHgoTmbkkw1gSdEGmyNT8b3C5oMmhCmPJ10fXb5arNo1OFTApAjJda4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(8676002)(6916009)(186003)(83380400001)(26005)(38100700002)(54906003)(86362001)(31696002)(6486002)(2906002)(53546011)(16576012)(956004)(31686004)(4326008)(8936002)(478600001)(36756003)(66556008)(66476007)(5660300002)(66946007)(2616005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzFKVytLZG5MNEZEOUMyeUl5Z3ZjanRYcFY3clZxODZxVVEvdnZpb3ZGNkMw?=
 =?utf-8?B?cUs0Q2pqR1dZelFpYkFjdlFhTDg3VEIyeXpuS1ZGejkyWERRclJKVWtMdzdM?=
 =?utf-8?B?Y292c05YcmNEcXBkakpmM21DejNzUEQ2MlNuN2pWcmFBdEFvMGh3S1pDK3BJ?=
 =?utf-8?B?dzYvUkN5WEhTNXMveVhrVnBOVE9uK00xaElxaWpPbnQzU0hxZGxpU0UzVzRZ?=
 =?utf-8?B?NXNLMVVYZ3BsbHlGclJudm5tMUpzck05SDcyR3lBRVNkblhJQUVqUk9RaktD?=
 =?utf-8?B?QnQ4a3Q0TGtXcmlZME1ZbGxNMnZLdzRwV0tqWjNOc0dhSFIrMThVZ2FSQlp3?=
 =?utf-8?B?czJhRXVrMFl3aEF3bU9FYWR5SWZCSGVzRGlSQzhsR3AzeHdNRSs5RXE4d0w4?=
 =?utf-8?B?ckNUSENMTXVIdENXYVFBakJyYTBaR0NtTFhJZFR5d0NDVVNzZ3NvTElYaWhl?=
 =?utf-8?B?RE5kYXJBc2FuQVBSNGM2RlFFTHZWRXZiYThGc3hQV1RYcXN3WjNuLzd6elhS?=
 =?utf-8?B?UzEwTm1jQVArN1lvdzlZZDVtQW5PVTQ1Y05rUnNsUEFjeVdqT1k0Nm14ZE5Q?=
 =?utf-8?B?S2dYSlpRNjRiRVhreFo2dTl1dThINXlsZTlhaHUxNldXR2E5YlRIY3VTcGk3?=
 =?utf-8?B?dUVsbjZTNGtGY2E2WHFianJqemtxWG5VeDFyZ1VRc2tHRXZuU295VFhLQm5G?=
 =?utf-8?B?bzRtdXliVGRZZ2ZHckxuaHh6KzBxbWNYcFdiT1JpK0krUmxtczFDeTJva1dO?=
 =?utf-8?B?TnMrM25JNGlBMHpNMVFhbk5iOVlLV1BTZVZWYWo1SDdpL2tiNnNVd2ZIbW4w?=
 =?utf-8?B?UWltMEk5b2lud2s3clpSS1FuT0FqQ0J6cHAvQTlkL1l4VFQyMnIrUS9JRHYx?=
 =?utf-8?B?UFVBcGl1R3hUN25tNlJZQ2ZBWW5lQmNJSGRnSGZ6Q29paHc2NXVaeEJKbjh3?=
 =?utf-8?B?WWd1RVl5WVNxTVF0T1U1ZG9OeWJJbEx3STlTc1Z5N0FEQU1YRC9mN3NVc2tS?=
 =?utf-8?B?TG1iT2s2YjhaNjAxQmhWR3NnM0hRdzNPK0RhUmt5UFViWTJyVStLeDltU0Rv?=
 =?utf-8?B?ZFF3aFN0cE55RU5QRFk2cWJwQ2pQdkx3a0VuR05GZjd1cVZEekJrMWZVazM0?=
 =?utf-8?B?OGtBRVlRU3J2RG84V2FDMmVteXhUY3dINllZWGVPK2dKbDhleWRHYU5yaitT?=
 =?utf-8?B?VFhWcjFTN3BoOTZ3T3o1UlUycU5BVHI5VXZteTNCRDVqanI5L0F5STB2ZlVT?=
 =?utf-8?B?TVkzdlo5TW9IVkNPTmF2Nkc2bGRzNkNyckY2OERpMjhsK2xYYm56SHV4TktU?=
 =?utf-8?B?Nk1JS2VvR3h6eUNVbUh2cWk1aC9EanAzVW5iamVPVXdrMjREcUI1Sk1NMi85?=
 =?utf-8?B?aUxXVmVqWXBxNlQxRC9peEhRLzZVZ04xVnlUOVNWejJWSVpTdithaHBCWnNk?=
 =?utf-8?B?cU5sT3ZoQitKcU04QkZjSk9PcFY1UTZTZ1FEZTk1WnJUVnY5OHdMQVVUM1p1?=
 =?utf-8?B?MkF0ZmFkaVhVU0xybDFnNVc4MUFVN0FSbFlxOWtvMEViMTFIdWZpZzZ0L0lM?=
 =?utf-8?B?ZUg4YzJRTHVRL3N5U2t3dEVrSjgvSm1lQ2hrQ3d3U1RFODFPbWVsb3hKRkho?=
 =?utf-8?B?a2h0QUs1SktKNU85MVBCUVhteWFXR293MTZSNkZiSDc4WlFYSmZrcVJXNWRr?=
 =?utf-8?B?OUFvc0Nqa28wemRwU2MxcVZNa3pLN1VHZWcwd1BGSGRIUWlEa1V6REt3TTVF?=
 =?utf-8?Q?YL4caVPHSCbogv+iTZP0kTgwkqWGQy0VmCLfbWp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78b3de2-d46f-466e-520b-08d96bbaecac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:34:42.9980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n15ENJcvrJQd0uIGdlPKV+hWVcI4ltM2Hrx+XwgBVB6UQAeiICXjQYgyqtXCPEcWLdwBcF23IW9moHk9AZXnSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 30.08.2021 14:11, Daniel P. Smith wrote:
> On 8/26/21 5:37 AM, Jan Beulich wrote:
>> On 05.08.2021 16:06, Daniel P. Smith wrote:
>>>  config XSM_FLASK
>>> -	def_bool y
>>> -	prompt "FLux Advanced Security Kernel support"
>>> -	depends on XSM
>>> -	---help---
>>> +	bool "FLux Advanced Security Kernel support"
>>> +	default n
>>
>> I don't understand this change in default (and as an aside, a default
>> of "n" doesn't need spelling out): In the description you say "adjusted
>> CONFIG_XSM_SILO, CONFIG_XSM_FLASK, and the default module selection to
>> sensible defaults". If that's to describe this change, then I'm afraid
>> I don't see why defaulting to "n" is more sensible once the person
>> configuring Xen has chosen the configure XSM's (or XSM_CONFIGURABLE's)
>> sub-options. If that's unrelated to the change here, then I'm afraid
>> I'm missing justification altogether. (Same for SILO then.)
> 
> When an individual selects to be able to be to configure/select
> alternative policy modules, they should be the ones to decide which
> one(s) should be enabled and not have presumptuous selections provided
> to them. IOW, the sensible default is to have no modules selected and
> allow the user to enable the one(s) they want.

Just FTR - I disagree. Defaults should be such that a majority would
not need to alter the respective settings.

>>> @@ -282,7 +275,7 @@ endchoice
>>>  config LATE_HWDOM
>>>  	bool "Dedicated hardware domain"
>>>  	default n
>>> -	depends on XSM && X86
>>> +	depends on XSM_FLASK && X86
>>
>> This change is not mentioned or justified in the description. In fact
>> I think it is unrelated to the change here and hence would want breaking
>> out.
> 
> Actually, if you read the help just below it specifically says to use
> this feature requires having an XSM policy (legacy wording for XSM Flask
> policy) to be able to do the proper fine grained delegation of the
> permissions/accesses necessary for a hardware domain to work. This
> should have been made XSM_FLASK when that KConfig option was added.
> Dropping the XSM KConfig option just exposed this oversight. Ack that I
> should have mentioned this in the commit message.

I'm getting the impression that you mistook "breaking out" for "dropping".
I can see the point of the change; it merely shouldn't be hidden in this
otherwise unrelated much larger change.

>>> -static inline int xsm_set_target (xsm_default_t def, struct domain *d, struct domain *e)
>>> +static inline int xsm_set_target(xsm_default_t action, struct domain *d,
>>> +                                 struct domain *e)
>>>  {
>>> -    return alternative_call(xsm_ops.set_target, d, e);
>>> +    if ( xsm_ops.set_target )
>>> +        return alternative_call(xsm_ops.set_target, d, e);
>>> +
>>> +    XSM_ASSERT_ACTION(XSM_HOOK);
>>> +    return xsm_default_action(action, current->domain, NULL);
>>>  }
>>
>> While benign because xsm_default_action() does nothing for XSM_HOOK, I
>> think there's an inconsistency here which rather wants correcting (in
>> a prereq patch): The default hook should have been passed consistent
>> arguments, no matter whether used because of !XSM or because of the
>> module in use left the hook unset.
>>
>> Of course such anomalies are much easier to notice (outside of review
>> of patches introducing such) with you now placing both invocations
>> next to each other.
> 
> This series assumes the logic is correct and is only focused on trying
> to make XSM more maintainable. I would be glad to consider looking at
> what the right security decisions should be in a subsequent patch set
> but will be consider out of scope for this patch set.

Well, I came to make these comments because these anomalies look to
stand in the way of producing a sufficiently small set of wrapper /
helper macros. But since you want to go back to an older version's
approach, the need to correct these as a (series of) prereq(s) may
indeed vanish.

Jan


