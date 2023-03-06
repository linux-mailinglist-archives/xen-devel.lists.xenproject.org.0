Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A676AB6B8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 07:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506651.779738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ4mY-0001up-UF; Mon, 06 Mar 2023 06:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506651.779738; Mon, 06 Mar 2023 06:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ4mY-0001si-R0; Mon, 06 Mar 2023 06:57:14 +0000
Received: by outflank-mailman (input) for mailman id 506651;
 Mon, 06 Mar 2023 06:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MPo4=66=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZ4mW-0001sc-FH
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 06:57:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c54d360-bbec-11ed-a550-8520e6686977;
 Mon, 06 Mar 2023 07:57:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7119.eurprd04.prod.outlook.com (2603:10a6:800:12e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 06:57:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 06:57:05 +0000
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
X-Inumbo-ID: 1c54d360-bbec-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWpphCvFmXJASebJ5y2ICztdN5zNQjTqj5dDOoEfnQCsO8t9aseWlyhe5V7dRXcK+ZZk3adYzriLUYZFDmfMYd5KMXT7UeUgIrn1OaLjRRVkFY4Ym7FuvaKEoENOHu1++NWNwzzrp2FyURSszp4YHwbOt6Yv84sOQkePahwhFKNSYL8vyvJCmrtycSrgz35MeYe52Kgv4+lykS5DB1zYe+UuyRIKQwpFe6yTLyr+Bp4fJ/W66qu8UCeaRGeoZVlYH4m/c8qf4IaGQxTCEzmo5kiIQ85o+64yTq4kbToRPHVP0EG4j/ZZ2bIbFxnhHJSr8h1MxM+W6rDi3L226l8+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MR4vmimCzefpM+08QYa+0OsmT/jsoyf304Nr2AOL26o=;
 b=R7tblq1phMNO6/d5EHzsLLSu22wJcOUzbciDuGtLd1Q4DK972tisOmtlv2JIY+MhJq9zGoBgzGezbr+UDjO4cEGor936QxL/GMzouzFrH4JhuuLPadFGmNGBpPc2HCMfNz0ry+/RTPHRWsvXsuYgGNrZzbJezCsV6M0Orsf9SwhIV+7AAPBBzyypoLvmvgkmG0Wr3PtDOiF35WNnG3w/RKog0svY3kjAGw1PV2urnOwSK/pAQ8D4XER8XDpyOdvXi7Z552w1laD0PZGFDJJ+D2ITSsogHbbty4FcPn4WByNbokhImXBjRL0DUW2eWPPPsrlg4lqgLvADaxdWc++75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR4vmimCzefpM+08QYa+0OsmT/jsoyf304Nr2AOL26o=;
 b=Tt1MotSSS/MeVGDIMpb3OpsYehyxs95ol0o8xYQ19SnadrywFLBegulIz5d7g/ueAyM9RN1ZZ9bnAzS2uIMP/SxLS0O69usSxvhZaIRNRLZdm88FksqqL2yWqNsMyzlXEsSOksGXyui/e3BAsKWQzflTwaFHuXSaYC7NJ1IB8CNFpiuKAPuf1Zw4UNjqWdZyTeunfhht3X/yi5gnO4Uz6V5ZYy4+UtAnKLoiaFvfmJPKQ//OBdUCCQnGRBE7YQgPi1eXZUq5yCx/pFC0YxdWfzWf4NBYVzoz+ksAip888B6rSPH64VN8cgM+lQITR/FykfwGm0erd3gJhCY8+q2wMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a282c338-98ab-6c3f-314b-267a5a82bad1@suse.com>
Date: Mon, 6 Mar 2023 07:57:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230104111146.2094-1-andrew.cooper3@citrix.com>
 <20230104111146.2094-2-andrew.cooper3@citrix.com>
 <f62293e3-94f5-005b-dafd-4c9084f5d84b@suse.com>
 <9f47f473-c9e2-5a35-f397-bb6e652354b1@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9f47f473-c9e2-5a35-f397-bb6e652354b1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 717a6283-f37b-4fa4-6af3-08db1e0ffeb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QVhCtOoCwb2PqOzbKY0Iw6DAw00Hlua2cU+Wo0ZcG5z8eEnFHSGq1+E7s5rn51N+fU2L7zuUu93Cf2qbbJ3DCscymPpXkgg+XQUbu56AcSpNO/g9edqQJgxwFgftab8yivqD1yCS2SR+XSH4gUqCb4ded/AwlyTJo6BQyeCA1T2/xtl1HEX/DGHAHkQopLHP4dAixPOMDpKgbG2NHFg4TddpGpuxA0xY2iPFikdWHffalhb8OJKhjn2JB/WTNrb7k+jtwE60hqtXkQFh8030HW58lReHEvOv04a0mKN0ftu4ZSdc8BjLK7EQ33Xh2YMWYVxQ6Z5w89+b0CjrixTLMjvW5aasSoVY2cLPi804cJJStPK0XHk2p3SvxAqOJMoNSKDx0lU0BM317rutk0bNqtLxuhiWtaU287CrZ1w4NahMFEyTmLi63ZDz5b4PRx7BdxQ5N7FOCQTIOHST7YhJ+NN121PDr9k1QuAbq8rojgs+id2m2k53gYjQp1X1o9BIdG0sIEsM4QsXYy7eUswj0sR8Ch9UFE4850kssW9Weu/O3gsdtb0MzZHp7ptWlecK6gJtC0YSrC/nRomU9HWAHk8jeD2u2rfl0Yh6XuCNN2j3PL80M9mCDDpDstTjcULM/gT4UJUhaZn/30StPb6mamhOuPPRi8kbOi2PFykZy3u5U0EqUMCHx1C+APJijz8fmWqwdtCd6aSfqwc6M8Uef6XSE3IU3XbkiNK9a9C3zf8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(136003)(346002)(366004)(396003)(376002)(451199018)(186003)(38100700002)(8936002)(66556008)(4326008)(6916009)(8676002)(66946007)(41300700001)(66476007)(2906002)(5660300002)(478600001)(2616005)(53546011)(6512007)(6506007)(26005)(6486002)(316002)(54906003)(36756003)(86362001)(31696002)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rk96dXU0QzFHU1ZFNklKSkp6Mi96ODNVMmNZa0wzWEN3TWtiWnc0U1ZKeDg1?=
 =?utf-8?B?a1p1ZU4wMWNpU2pXbG1ITlJLeThmZW9rZXlLdGdVZ3lhVk05aHBkNklXcVdr?=
 =?utf-8?B?VUNJTUdrTGNyS1UrUGlMWTQ0ZDBMa3lzRWFZdWt5THpkMFRFeXhObWMydjlZ?=
 =?utf-8?B?RW0xYWFPa1FrZXdzdXJmTHNTVXgvcUJPZzF0SExSWVQ3RVJtSlBzWk1Kemt6?=
 =?utf-8?B?a0RiQmF2VFFRS2R3c1ZaVkdsM1lhYkxwb3ZEajRqamVqbUdSaFN0Vzk2NXIy?=
 =?utf-8?B?cEJSMThXOER6OHNDVk14Q1c2V0hQcmt1WDlEVWVGQU1XckswVy9MWHlsQlR6?=
 =?utf-8?B?R09FeUprMkRWTnRkSHRGU2NqZlFWYkRkc1VRMWd3UGZYTERJSXJQZDN6emlJ?=
 =?utf-8?B?M3NlZjhHbUZJeFBYYUVUbkpKbkVZRE9FUnF5NDcySlArQWhmQk5nMCtuZS9n?=
 =?utf-8?B?WmhuTnRha1FSUnorc1l4bDRoMnRVakxETFBwNzljUGhtaFJVSTlMeHdLSGZC?=
 =?utf-8?B?a2grcXduNmFLOXMzRzNsc0drVUk2dE10S0tTN3hPTCtoaXArOFlQVU9OdHZP?=
 =?utf-8?B?UzlBb2syQ0RpYlR3OW1IL0ZZWkxzTVRnM1pjK3VUSXdscjI0WHJpV1Z4ellF?=
 =?utf-8?B?dGN1M1ZyLzEwK3UxbmxKZnRYU3E2VUpMMnYvK1ArVWRjTjRsTDIwamE2OG5K?=
 =?utf-8?B?MTZBMWFEQ0F5dms2eHJOWGdkZHc1UFdadklHLzZGTEMvNTFPNDE0NFpOb2ZE?=
 =?utf-8?B?QWRiaXV6cDhrT3hWT0JtS3Axa2xQVmc4UEF4emczZjBEOHFZV1pybUIraDI3?=
 =?utf-8?B?MlVKNUFzSE9pTngvajFzQ2tqTFBUZk01R1BwdmUxTng3cUFIeWRQRnlBbk4v?=
 =?utf-8?B?M2VzOUh0UjNxNE95UXFIdEFHZStvWDd0ZjRoTDdJQk5CbVRwamdYRGFGU2lj?=
 =?utf-8?B?c2txeDNDTFVpWUMrcGIxdzZYQy8wRnNMdHp3N1VnSGxmVlZZdzlZeEJzQ2JC?=
 =?utf-8?B?M1U1RnErVlV4UWgvVWtZaDNNRnNMRGt5ZDVTbXpXc2ZlUDBFdUgyc040VzR2?=
 =?utf-8?B?Q002ZUhaTDlVMHN0TUxhUUNzcEZjbWRhUFBDemhaVXQ3WWF5NVdXZkJyRGxx?=
 =?utf-8?B?Z2NtRFdDaDJ4U3lqTVViY3ZOZHg0U2FTOTh5cThGbTVQdmZHc2g4TjB1YXds?=
 =?utf-8?B?RGlwMHArenBDOUxNTmpINFVvUi9PTXdzZHpDM1FiT2ZzUGRjYVU4REVlWVBJ?=
 =?utf-8?B?cmwrbDE1MkM0Z3RPZWFtZUdRaHlzYVVTY255SVQ0NVByYU1sYmJwdlNmWUEz?=
 =?utf-8?B?aGg2TkNGOEk2dnRhOXp3TUk0TTEreW9zYXJEaFl5aFgrRmNvaUFBM0xHaG9O?=
 =?utf-8?B?RVN4NG94NVNHSnlhREo2UGcwaVNYcUpvbm01eWNLallIOEdYY25Rby96alZy?=
 =?utf-8?B?TVJTNXJKOGE5ZXhpNjJZQm16VDU0MFZvc3JMa0FaRThhVHY4TVZlT3VMTmlw?=
 =?utf-8?B?STg0Wll6RG5lNXgybXUwb3JOdFVEL1d1Mnh4Rk1LTmR1anVBeExnQncwQ2xj?=
 =?utf-8?B?Ri9iWDF0cWlxa0loM0dkR1A3WVc1ZFdKaXdkRlNRUEtUallXZnM1OExVSElP?=
 =?utf-8?B?cDJzRXkrY2Q2REhKU0M3ejk3SDcvMC8ra01PMHE3S2pMMmdYSktFYjVxbHZh?=
 =?utf-8?B?SEZqVHhneGNOZDUwVGEydDhtZXp0Vk94cHRaYXUyT3AvaWFuNU16NGZyWmQ1?=
 =?utf-8?B?VjlnL3U4WGRtS3g2Q0lJOHYwZmZQWjl3MXVITENoVlZXZHZrKy8rYUhyazJ4?=
 =?utf-8?B?Q3JQSFAyR0lVTlZ4emJDcDBVWXVDVmJpalU5M3l0M1BLWloxUUtMQTN1Q0ta?=
 =?utf-8?B?WnZXYkN2WTA5cXNnRkxsVUloUVNRTmdrT1pSK1JGOUxpUFl3cVhTVkFQRXFB?=
 =?utf-8?B?ZFRTK3NmRHlLWjJoeDVOTkhuUnFFb21rZlZ2VnBaM1NwQk9YNGFTZ1dmT1BE?=
 =?utf-8?B?N1ZXejRNMlcrOHJLaU9XU2NBdW9rYmEwTzhtZlVMdStjdEFHTDJjNHlzdTR1?=
 =?utf-8?B?cnU1dG00QzNsdnp6WW5tRGpvUDhuTW10NEZJQllmQUtUYWp1eHFOMkRjalNW?=
 =?utf-8?Q?ooCPTWUTu3DWm7ulnBKAYT54B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 717a6283-f37b-4fa4-6af3-08db1e0ffeb9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 06:57:05.3401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM7B1V+nIP/QHnMmiqsWYftrdVEON35GNLi3Q3o0TeTbtqC+va7CZT2TezUCFqGzAgHkcR3AFNiCi3W2fxB4Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7119

On 03.03.2023 19:32, Andrew Cooper wrote:
> On 03/03/2023 7:23 am, Jan Beulich wrote:
>> On 04.01.2023 12:11, Andrew Cooper wrote:
>>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>>> @@ -288,6 +288,9 @@ XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and
>>>  /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
>>>  XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
>>>  
>>> +/* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
>>> +/* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
>> While committing the backports of this (where I normally test-build
>> every commit individually) I came to notice that this introduces a
>> transient (until the next commit) build breakage: FEATURESET_NR_ENTRIES
>> is calculated from the highest entry found; the comments here don't
>> matter at all. Therefore ...
>>
>>> @@ -343,6 +352,8 @@ static inline void cpuid_policy_to_featureset(
>>>      fs[FEATURESET_e21a] = p->extd.e21a;
>>>      fs[FEATURESET_7b1] = p->feat._7b1;
>>>      fs[FEATURESET_7d2] = p->feat._7d2;
>>> +    fs[FEATURESET_7c1] = p->feat._7c1;
>>> +    fs[FEATURESET_7d1] = p->feat._7d1;
>>>  }
>>>  
>>>  /* Fill in a CPUID policy from a featureset bitmap. */
>>> @@ -363,6 +374,8 @@ static inline void cpuid_featureset_to_policy(
>>>      p->extd.e21a  = fs[FEATURESET_e21a];
>>>      p->feat._7b1  = fs[FEATURESET_7b1];
>>>      p->feat._7d2  = fs[FEATURESET_7d2];
>>> +    p->feat._7c1  = fs[FEATURESET_7c1];
>>> +    p->feat._7d1  = fs[FEATURESET_7d1];
>>>  }
>> ... the compiler legitimately complains about out-of-bounds array
>> accesses here. This is just fyi for the future (to arrange patch
>> splitting differently); I've left the backports as they were.
> 
> Hmm.  c/s e3662437eb43 was designed to specifically allow CPUID patches
> to be split like this.
> 
> Which compiler?  I think I agree with your analysis, but I've never seen
> a complaint, hence not noticing.

gcc 12

> I suspect we actually want FEATURESET_NR_ENTRIES defined in C, next to
> the FEATURESET_* defines, and we want to BUILD_BUG_ON() if the autogen
> length is larger than the C length.

Hmm, yes, this may be the best we can do.

Jan

