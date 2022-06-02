Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA8853B759
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 12:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341075.566256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi9h-00018A-Pg; Thu, 02 Jun 2022 10:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341075.566256; Thu, 02 Jun 2022 10:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi9h-00015C-Mq; Thu, 02 Jun 2022 10:34:17 +0000
Received: by outflank-mailman (input) for mailman id 341075;
 Thu, 02 Jun 2022 10:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwi9g-000154-8Y
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 10:34:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ca2df9f-e25f-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 12:34:15 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-45-Qv-fb97xO3C81EM38M-ouQ-1; Thu, 02 Jun 2022 12:34:12 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6005.eurprd04.prod.outlook.com (2603:10a6:20b:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 10:34:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 10:34:09 +0000
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
X-Inumbo-ID: 8ca2df9f-e25f-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654166055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKDqeGUoz4In79F0vmCHiH1bU9+pEkaoRqSbHsioEvk=;
	b=eQxky/WT923b7iuo1NCEoYg6aXs0TIJQcj2kuI3DD6DydZtLGASwH/Ls9t8GanlvDG5o1M
	eXYlGvNKqtjygXmswRsI02ShYHBgbC837clOHdUapBFLik2t9tbDQ5XsUFn8OTeNX6VPPT
	UYMbSSDH4oW1rer4XPi81lVWm8TMXGM=
X-MC-Unique: Qv-fb97xO3C81EM38M-ouQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Joa54ufh8X9EQ+AiQIl8TAP9aqOW8rW+8J29XqkZmZTskCdR9JgzTqE+9tmGxOVAAeoHDl+tQCqduURZRVX0PP7womtthDSmDt0TfH35J6mgpDrFgRKa7LtIx+bdqdaWX0GcSSUk2YRNHC4OLWV8YCdLbvCxiSzib/kmZhj/QhG3MbGWme1dGbnhwpXCcmNOGGhFeR7ZL+efNT7Amumoa6ff8sTLu/OjZjFvGQtqRoJHSOoKVJMyE52NhjIfOIv9i0pEKCxQ+haHOQ/SXjCV1STaLDb0yWxOUVbRGzNzrPgkGgWGQAHVXCACF/geq+5ts/eDV7gTgvYU67j1zrWe3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKDqeGUoz4In79F0vmCHiH1bU9+pEkaoRqSbHsioEvk=;
 b=LTU8jc4Xl65+JDxAqL50GWJva1+FaBZ5VBgLaZpdKvxmo0Cws66Kwl/MBfWD+J118oRYTntFhNHWvHHbakgfVAjYtRUKdAmff087+s4xvPxjvq+smVguU1VQ9+0OrC6w6ph0z52Quf/k9VmSI8sO5+BiQwVfhyzSTjIy2eY2kJuGseN5gaO0OdrPF7Dx2jQnRdpZR5AFAuYiWlgOZSlgbuc7DO6Lqw/13iK00xPhUH79f1X1CMz5n0xbQBuhcBoznQGNHgpr07LVoCyoH7I4gZosBbvtm41Qq3sM/eqZFryA3UwjHPDBy4P3pOkMciSR/h7HRnGxhvMF9T6yF5KrpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17bfe5d9-3bd7-88c7-e59c-e309e1668e12@suse.com>
Date: Thu, 2 Jun 2022 12:34:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 6/9] xen/arm: introduce CDF_staticmem
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-7-Penny.Zheng@arm.com>
 <cd7455ab-c26f-8a91-fbf0-acf988d8371f@suse.com>
 <DU2PR08MB7325C5D659A735D1BC3A1214F7DE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325C5D659A735D1BC3A1214F7DE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f7c1359-f8c0-47c9-727e-08da44836d81
X-MS-TrafficTypeDiagnostic: AM6PR04MB6005:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6005DB74DCB1324D81544ED4B3DE9@AM6PR04MB6005.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qcD79H1AU7vkP/KBrXWfuHYos4oEgB6Z+eLF1fx6QDiqFqjnutH1b/13B3htAAUZZ7It5SHkmYAEbuyyFuKWl1h+aDmrQVCXB89OMKK2nFNV9sVu1XZiVchD5U76UxBFfvMbekLRy4mL2IvICksGScGn+IRExOJLvlOYggcNMWFC/EEC2zso0FBCLrq1Ap+nsE86GSBnA3yUG1TVgzR6ujxP6XmPXKamm1LpPmlRZb98mepI+SccIrv42dy8BZQVD8EES0L/tyeAM6bfCgaNgd0BZNTuqdPoxxqm7sVA6YKjhSXXt76z21jnhkLjv5sUa/H+D9urrJHxuqy1K4xzSIhvteioVCLeWW65BSpHluuBl1hlXy+w2gHfESz+Om3aZJAyUmKXKbeDoYoLPQ+EwpQt0/E+vHOK/5f6k6BdyYzRHHEDmz1bjG6F/Euza9RzgL56+HwEpzSaqi/A1fcdZssRigFb+mM4v0JysctjvwXxKgLFLHgHOvUYoftUP293p+3KHcaSrlTrIN0KVD0QbySWm5utoFMm4S+LhvyNVW61Ej9sEkRaeqCzVOfSuRipO6eDYb1PUrmNbj49KxxyUYUnT9xSTrH/TlgrjpsPiCqeqh1mrhp+F9eqesibYkWnvhrxLtYdgndQ8bIIKeHqX3llhNPeUsRoGivElpSmuccmzUFOdM2BbbUMI7F/+fchVIAkeEUDLocydXI1qQMO5dtzq1SQTtjwC1R7n3xbJVrAsonN9Q5Rh3S+G+IbOR6O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(66946007)(6916009)(6512007)(26005)(66476007)(8676002)(53546011)(2616005)(66556008)(6486002)(508600001)(31696002)(86362001)(54906003)(38100700002)(316002)(83380400001)(186003)(8936002)(7416002)(5660300002)(36756003)(31686004)(2906002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFdrL044bXBKc25qZis4bEZrZGl5STFLYWRuc09JRk5TeVRpS1ZyLzlSaXE0?=
 =?utf-8?B?QldtVUt0K3NRQUVTemRrV04rYWxpNWNFV3ZYUmN0NXozejBGUE1JdzR4U0Rk?=
 =?utf-8?B?SUxjSDcrZFNlVXJ5dlNGK25YSHU3UW01WWhOanlHaVYrUmIxem1Pb2dtay9o?=
 =?utf-8?B?MFVOVVVwc1RTNmQybDJEcnhZQXM3dHlsZXM4TUpuTTh0TmdiKzFZMlRWK2Rs?=
 =?utf-8?B?ZXZMVkNmOGpaRVEwcUl2ckxXTlJ2YmxqR3NwQU9VVWlMZGhTVFcrMDdUbFlm?=
 =?utf-8?B?U0MzcTdLV2lYUjlzdUdXK2pYMVltVHB0RVc5S290K3pWdHdwSEo3S1JCOFhR?=
 =?utf-8?B?RC9FcDNENDVhOWs1WHlXdG9OZU5PMS8zdzhKVUMrVU1mS3hKN1FMR0RkZ3ZX?=
 =?utf-8?B?c0xwdVBqZkdXSStlajZwMEFVc1QvOGZ3ZUMzeTNnTGN4MmZmN2lSNm54Rlds?=
 =?utf-8?B?M0tYQ0xnZ2dlTUJ2N1ZGZG00dHZhM0xuamVETC9ReitCYUpaeDNGNllqRG5y?=
 =?utf-8?B?SVc0OVhBMFE5Q3gyUDNrK1RGa2hKM2xEbGpXMUxyMXIxOUlreXZaMmx4Skgr?=
 =?utf-8?B?TEovOGpReW4rcVNkK0lZRDMrZ3h5Z0JiMUlNRy9zZkZ2RTF4MnlYU2xxMkJH?=
 =?utf-8?B?Wm5YcGlQNDg3QThXZno4M1ZHVHpLVWlPNTVJVlpwZmdXY2ZwYVhzbFNyQW1x?=
 =?utf-8?B?eTVjdW85ajdOL2VBYzlFamdRRkZFbXpwSXBBRlpPN2lPcVA0VDNWMXVCamZ1?=
 =?utf-8?B?L3k1U2VLdnBXb3RKeFZzcVB5RUs5RzlJWXNVb0lnVXdOWXBPbzlUQU4zM2Rn?=
 =?utf-8?B?OElTSUFha3l1VFBlUC80NXJWTjVhVTUvUFBjOGlMdktJVzk4dENuaTA1VFAy?=
 =?utf-8?B?RURVRFhYY3RSTi9hd1pjNFVvQXJKMHdpZENyWnlBSDFVVXgzc21QSU5UNmVR?=
 =?utf-8?B?bXJHNDYrUitHWDRkQzdOMmRFTkNIR3pBUWJCaXcwTGUwcStMZ2JGWlk4UkJB?=
 =?utf-8?B?dzBhazBVSVJDOVJDZDVZVktYZFR1NUE4eUUvZXVwZXdxRVdJVzFuQ253QTI4?=
 =?utf-8?B?VjVpRld2MGczVWNRVE9wcUdBZ2U3Q21yZEVNZ29BbGhHbzNEb09KaGFobTNn?=
 =?utf-8?B?YTdUUTNvT0R6MFhrcWNFTFlqTjUvRFNldUZtVU1UV21xQXRlQTJ4U1l4QXd0?=
 =?utf-8?B?cVFQUy9OTXhFZzJwTXg1NmRwSS90ZkJ2Zm10VHU4dUExaXVMbWo1RDJOR2xB?=
 =?utf-8?B?cUtNbTIyZzNDM05INW4wTlFwK3hicGJIUDRmTE5aU2RmZjlJWVE0R2MvL1Rx?=
 =?utf-8?B?VHZZTW0zTXpxS1hDOFZZcVBDL1diNDRwR00vaDZmU0pOQlh3MjM1cE42RE1L?=
 =?utf-8?B?aFg0bjNCV1oxSmZtSmVUSTR4OCszNTVjYlBsZW93QmpjZnNLaGJkb0p0MllF?=
 =?utf-8?B?RzNiZFRFb3M2TUdNOU5McmlsR2R1bm5HY2dVMitYZnE0N0pQc3JDSVV3Ui9T?=
 =?utf-8?B?NXltRmwwb200Wm9iL2tGN0htdEd4bXBpQUpxUHpXOUpzdytXQlBucUV0VjBL?=
 =?utf-8?B?UmJWUnROL1dKdlVlSGZ4QXBCZ3JjekxUVHpFb0NJVnh6VktWVVNuVE9kZDk5?=
 =?utf-8?B?bFBKcVJ4QVptOWl5TGloZU9xSGZTSEZJTHlrd0Z3cEJocHE3T3c1cjdYeHQr?=
 =?utf-8?B?NTVQNXJUMUdsZ29NT1BvS1RXNFlEV1kyUTQ3Tk1MM25GQStDemNKTEZxbVRx?=
 =?utf-8?B?MStnc0o4SkJVbWhKTDJHaUNlaXVLRGhsczBJT0VIaVFrdnp1U1podER2d1lk?=
 =?utf-8?B?amZXN0krUTZEM3MxSmx6cnhMNTVicUpGWTRhWlVHT2QwTmx0a2d5c3RoVmw1?=
 =?utf-8?B?K1ZBaWJWcTlmUzRyMGRBR2dmU1B0eGRRU1VCTS9qMm5RYkhmVXl2ckVQQ1NI?=
 =?utf-8?B?N2M2c0xxTEdzR1dneEhPei9lS3JKWW12VlR5cXQ3ci83UEp0eXlPekZ3RnhI?=
 =?utf-8?B?M3RlUDNCRmhPYmhpU1RiSlFySFQ4OUttbWRkQ3hTSG5nUDU2TThjS1RXdUFQ?=
 =?utf-8?B?cFlDU2pvb0svdTVwVlBOYW11Wm0wa2RoUGhXdDllQ0FEUDhRMEtDNWxHcmN5?=
 =?utf-8?B?WnJKcXZFdE9vQVZPYVUyWWNDWVh1VkVHSXVFdzdwZFgrL0N2R3QrT2dtdVBM?=
 =?utf-8?B?eml0Q2JIL1V5SUpSODlPS25LWGJ4THN3SU5iUksyN2lOV2w0eEFyMUtLNHVr?=
 =?utf-8?B?UVRhK1Vsa0JzemJGRTlWMGpnR0kwUmhRbG8vQUdKODVVNHB3Q3pOZ3NmSWIz?=
 =?utf-8?B?NnhnSVpYejFoRm1KakdxNXlFQUxDdFJ4bE5ESnJWZGlLZTUwemdBZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f7c1359-f8c0-47c9-727e-08da44836d81
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 10:34:09.6357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tn5xch4JYEx4qkx4z1NHmZs+Ux0Bsg66NS3E8jOnJ6N7esXWNqGnrDzlCJ9tZTSTv8Y9cbAia8WKtn2kPJG/Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6005

On 02.06.2022 12:07, Penny Zheng wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, May 31, 2022 4:41 PM
>>
>> On 31.05.2022 05:12, Penny Zheng wrote:
>>> --- a/xen/arch/arm/include/asm/domain.h
>>> +++ b/xen/arch/arm/include/asm/domain.h
>>> @@ -31,6 +31,10 @@ enum domain_type {
>>>
>>>  #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>
>>> +#ifdef CONFIG_STATIC_MEMORY
>>> +#define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>> +#endif
>>
>> Why is this in the Arm header, rather than ...
>>
>>> --- a/xen/include/xen/domain.h
>>> +++ b/xen/include/xen/domain.h
>>> @@ -34,6 +34,12 @@ void arch_get_domain_info(const struct domain *d,
>>> #ifdef CONFIG_ARM
>>>  /* Should domain memory be directly mapped? */
>>>  #define CDF_directmap            (1U << 1)
>>> +/* Is domain memory on static allocation? */
>>> +#define CDF_staticmem            (1U << 2)
>>> +#endif
>>> +
>>> +#ifndef is_domain_using_staticmem
>>> +#define is_domain_using_staticmem(d) ((void)(d), false)
>>>  #endif
>>
>> ... here (with what you have here now simply becoming the #else part)?
>> Once living here, I expect it also can be an inline function rather than a macro,
>> with the #ifdef merely inside its body.
>>
> 
> In order to avoid bring the chicken and egg problem in xen/include/xen/domain.h,
> I may need to move the static inline function to xen/include/xen/sched.h(which
> has already included domain.h header).

Hmm, yes, if made an inline function it would need to move to sched.h.
But as a macro it could live here (without one half needing to live
in the Arm header).

Jan


