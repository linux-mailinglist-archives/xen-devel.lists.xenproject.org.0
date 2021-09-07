Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA3402ABF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 16:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181128.328148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNc48-0007kV-8p; Tue, 07 Sep 2021 14:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181128.328148; Tue, 07 Sep 2021 14:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNc48-0007if-5c; Tue, 07 Sep 2021 14:27:12 +0000
Received: by outflank-mailman (input) for mailman id 181128;
 Tue, 07 Sep 2021 14:27:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNc47-0007iY-4M
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 14:27:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af340802-0fe7-11ec-b0fa-12813bfff9fa;
 Tue, 07 Sep 2021 14:27:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-Kvl8OVOJPsO3QdgAF5zH2Q-1; Tue, 07 Sep 2021 16:27:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 14:27:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 14:27:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 14:27:05 +0000
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
X-Inumbo-ID: af340802-0fe7-11ec-b0fa-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631024829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/cnaseTopJc0M3gFnFozGKtr9ArBNZkh7NEJ4U8bQHY=;
	b=RZxTwzoK+lW3/WvN1gd/XAzCHSvXMY6ejiJ9FBFrvzz1OTlbXe6hvW1at1MHVrB4W6QQfa
	3ayCvUgOPIOprUkTTmsGeuA+VLem67x337UOlmUUit7eTc437Fjat2hSpJ1IqOskDyPkwa
	c3sxNx5B2vu++pjRDH40QTgUORx5SlE=
X-MC-Unique: Kvl8OVOJPsO3QdgAF5zH2Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD29ztSBhiSO4Zn2b98F5Wm0ibcuYUAJdcXChpqY2WKA8DFeBkdJ6TQIS86QvLSXTEF0eBt3vuvm25LEgxVu8S7f0OrSIvOK8Ztqn/cNvVKSWSXbcAPI3lQEYekm77rUhuD9iE5609dCDHhtPNPBILWQBaejvJGPR5ZIaWfHFkJNOKIXkhKuqEDqe3jyhWLL6Mxa969BVhQPBf95vfedu/uOra2r5Y8UaRLYw6drTQMxArLARVsVHeV/uil+mF8GrN7H4n8pzGPwWGZ0bfpj6sjublabtZGgx7+8Ue8fhkfXGDt/cFszQqkGEKVNy6dEH+sOb+BUu79CNYQG8skaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Q1oeAetJ19oaQfdWFwMctncqRNBSqpmyqIffsfr/z08=;
 b=O7+qhpaaGHOKIpSuxev6l4M+etsTAwpO+rZwaHXkEVgd3V4CEBPjYYuyZu7g8LZdkyN37Sa8GxDhXlTX1bMPkaxQAmGOlB4yvYr9Ul5dxPHfhP6WFPiCNuBlKRqay0b4HTxehQFzLmsSkGatJpGnj29rVquFRyXhCNsHSP9oIoFC3xh3kDNHb1hkbkzDBlCvsgvGI2saRJflbEBaukpgcl2G87zhsxsCJgxNc7mKyJnWJDR98LDURoVB4XZ/Z9mQup1NLAhEi3zKjJpeOVbgcAD8rZCB0Wu/zcCVexZe924WdEYXYQouuftiBOMxRWnJzStd3PxL0uHMM12b29Yvwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v4 04/11] xsm: apply coding style
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-5-dpsmith@apertussolutions.com>
 <01c81885-9ea0-3ecf-66b0-009b9e7ba39b@citrix.com>
 <ef0d627e-cc1f-4b9a-7695-daa646968c42@apertussolutions.com>
 <a3a9207e-7ab9-5eb9-7488-74bc4203e7a3@suse.com>
 <3b3762a7-5034-9094-84f9-cd8ab24e24a0@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e006dc60-7745-43b7-f725-2390e174bfa7@suse.com>
Date: Tue, 7 Sep 2021 16:27:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <3b3762a7-5034-9094-84f9-cd8ab24e24a0@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM8P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 304e346f-66ac-4ce0-d10a-08d9720b917f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB590251198FD0B6555A217027B3D39@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lJ3mye5uRFfqlaCzrlHp+dwV/+/2hR3nJXlrzF93E4wnRhO9amZ713IL+kYU2bYCQg0r6aTjE07BbZoacR0fF4rF+cjlaS4/VoGC6HzR1G9ryXMeKQmzwLG+8s+oJrf/AtyitqgoPA2DZovdB6uU3BGyJYesZSz7pzSuiCrIoC1JQtVU9pPMSI7NbVW+s0rWZj0OrTT0voBfrjJ3BR+zBWO6wWMjLYqfg1OnQUB5sEiXPYko94u8/mbUQ0DirharEEmvCC18HmAijXiEal5JpyzO4Zr+zCTb7TzubkeOrAeHkc3JErltfLQkplGjJ7lmOvM3eRxXuoDm0RA//9G/9WPspko9vwOgcerpjLeUpaex2hfacEhIU32oyEm34q2k6R393NOac4209aJjZizAa5RmlgQYpiDv9gUfN8rEe+DHQN8/7KmFR0ddtNhJEESyULP7IxgeILaHJM46w1zrAU5oGmohlE3HZkP/Lvj2UzX4upl3yfoKCrVGhW/CRI3KaPEAh7KeM2bXY7X2HJFAq+pMs+FFXANXI6vNDrdPA2f4s6WRJaDnOf7j8gTKjGtbkYvfJ4hYD+2VJyj+pmKfG64i8iwii/viWzgCESCTcUcX95UjG7bbtpbQ+DilZ9uiLMbkXlTMv00ZAqFO752tr4IRQAZVFdxuDrMYBL9EbjISjIYTc7jkj2q9MqW5Xq1EijlN3VKGhpS8cNgWgG8Q+nMMJBMiKAnmKZARwZLOwPdUZsEjspRlM5Ivg+bs8QvT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(376002)(396003)(39860400002)(31686004)(66476007)(66556008)(66946007)(54906003)(8936002)(6486002)(956004)(2616005)(16576012)(316002)(478600001)(5660300002)(2906002)(36756003)(31696002)(8676002)(83380400001)(38100700002)(86362001)(4326008)(186003)(53546011)(6916009)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W9/SUaQaResgfhQ45BmHstxWNKBE9V2WKrRh8s79NN5uYCN21ZLqi/9JafwV?=
 =?us-ascii?Q?bBGn9zJjqnOmzrilEhehcQKUAgC5EOj39HOmr2N8wXIMgNISMHJrpvfa54Ck?=
 =?us-ascii?Q?AJl9T99GAOy11UdF3j/aaWAxrEWGH5p0SDgUA6woL4s2nRfRitsJ6RlcftoV?=
 =?us-ascii?Q?lZ6zhRKWAog13VNOo497qSbAbYOB+lKXGF9TPb0slhVVsLpIB9grxrq+d1fP?=
 =?us-ascii?Q?6WzOdGJgqIFH0Nxc0miiuso0+Km/gH/IlWEm3neGqVo0uRKz4iTKsGGqqL4Q?=
 =?us-ascii?Q?wp3wmvPHGHAGotUGkUjmNbJOEmAGBbeM4U8kVCiJ+c8pvN6dCw9mVLjQ6GaO?=
 =?us-ascii?Q?erzDGTXgJT5B7feLAwMoRHuDnH82CMoIvMM0rbA8+S2bnRG+Utr+E69X+zoQ?=
 =?us-ascii?Q?o8dGAR3fdImIycwFBwb4MYcThg+xd4c2gVc7JAwtd9hBNntJDgrahy0hBv5Z?=
 =?us-ascii?Q?7XxOP+tX6WbBluEVR/GhjwctaHPkNYVPLsqXKKHS7lsWiIqCsh8dopHNHaA1?=
 =?us-ascii?Q?QKmX9vbjt5W7qxeIjf4JK5jJxm0p1vB3zmpB5jDaengS8bMyclSSIIRhmEF3?=
 =?us-ascii?Q?3KDQkkA1QeKFjX4tqsONlqRMr2LYaACPQkurGwg5x2Sb4AWD8B7J9Vrnwv1p?=
 =?us-ascii?Q?TXXxzNr4apoMk0UbG35ADBAJI7p79fJhcfOE/0uYh6ThxJMjs6obzTCbxPHq?=
 =?us-ascii?Q?xVmXSzNTB6aqcHrOh0CuOLjEAr6gJBRgPOqK1zhse7+/B0qjssKBSfS7DUIZ?=
 =?us-ascii?Q?gzGCsJyJxLUn/NdHKd0ILXJIFNOYSYlEK1qczFvsIb51h7dvTmUrwFo/gvLM?=
 =?us-ascii?Q?JkPl0r8OwR2rAJjP+SGABEJ+OO6pWqF2MAZg4xzqJmgWMpuMzIkMvdg2URUl?=
 =?us-ascii?Q?Evbf/7bpbzg6c9HW1hoUGXIGJiQpajpmtHBrEIUzZuCPHGNOL4hgjPsvqFMc?=
 =?us-ascii?Q?29zc4aDLi6kQAwRHUJ4TrhlGOLUm3kffrGfVsTC8k8BdVZICBT98tncyHChn?=
 =?us-ascii?Q?i7BiI+W8qJ6RPZIAt4x3hQf1MSjsm3S3SJlfzCeDETfGbBqMYEaImtWp2wwH?=
 =?us-ascii?Q?vfBOHK2egV1lTCS5mOfHTrMWgafFV/5dZevF2861M0UYDuZ/HQkvGOl2ZgUp?=
 =?us-ascii?Q?CZH0m1q7i1xpsnAazrcocT38ST4GT8Pk0L9Eio1KUhQ9CYjIGBWslf3gP4e/?=
 =?us-ascii?Q?16Qt+h8Z19TUzmuP6miaWIHViRVkqINjf+X5BA95SEzLwaySKdY6Jbs3JqrM?=
 =?us-ascii?Q?EgFA7m6hX/iM69WoKkSfq0VJuunBxWEWVpLT9+qWKdoqMqcPcq5Wz75fdKE1?=
 =?us-ascii?Q?jhtbhr6h9OWTEorJuTirx+IJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 304e346f-66ac-4ce0-d10a-08d9720b917f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 14:27:06.1904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: spKIiJ+n5MePkrYN3RMGCDcbAcqeZL/5BvUoFR5XidiCj6OxWZ63qCk1+3Zt8PDH3yWoWD3zC5AnE0MBCIkYIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 07.09.2021 16:09, Daniel P. Smith wrote:
> On 9/7/21 9:50 AM, Jan Beulich wrote:
>> On 07.09.2021 15:41, Daniel P. Smith wrote:
>>> On 9/6/21 2:17 PM, Andrew Cooper wrote:
>>>> On 03/09/2021 20:06, Daniel P. Smith wrote:
>>>>> --- a/xen/include/xsm/dummy.h
>>>>> +++ b/xen/include/xsm/dummy.h
>>>>> @@ -69,8 +69,9 @@ void __xsm_action_mismatch_detected(void);
>>>>>   =20
>>>>>    #endif /* CONFIG_XSM */
>>>>>   =20
>>>>> -static always_inline int xsm_default_action(
>>>>> -    xsm_default_t action, struct domain *src, struct domain *target)
>>>>> +static always_inline int xsm_default_action(xsm_default_t action,
>>>>> +                                            struct domain *src,
>>>>> +                                            struct domain *target)
>>>>
>>>> The old code is correct.=C2=A0 We have plenty of examples of this in X=
en, and
>>>> I have been adding new ones when appropriate.
>>>>
>>>> It avoids squashing everything on the RHS and ballooning the line coun=
t
>>>> to compensate.=C2=A0 (This isn't a particularly bad example, but we've=
 had
>>>> worse cases in the past).
>>>
>>> Based on the past discussions I understood either is acceptable and fin=
d
>>> this version much easier to visually parse myself. With that said, if
>>> the "next line single indent" really is the preferred style by the
>>> maintainers/community, then I can convert all of these over.
>>
>> I guess neither is the "preferred" style; as Andrew says, both are
>> acceptable and both are in active use. I guess the rule of thumb is:
>> The longer what's left of the function name, the more you should
>> consider the style that you change away from.
>>
>> Anyway, in the end I guess the request for style adjustments was
>> mainly to purge bad style, not to convert one acceptable form to
>> another. Converting the entire file to the same style is of course
>> fine (for producing a consistent result), but then - as per above -
>> here it would more likely be the one that in this case was already
>> there.
>=20
> Understood, I will respin with all the function defs to align with the=20
> "next line single indent" style, though it would be helpful for=20
> clarification on this style exactly. Do you always wrap all args if one=20
> extends past 80 col or is there a rule for when some should remain on=20
> the first line (function def line)?

I don't think that aspect has been discussed. I would say

void sufficiently_long_attribute test(unsigned int x, unsigned int y,
                                      unsigned int z, void *p);

is as acceptable as

void sufficiently_long_attribute test(unsigned int x,
                                      unsigned int y,
                                      unsigned int z,
                                      void *p);

with a slight preference to the former.

Jan


