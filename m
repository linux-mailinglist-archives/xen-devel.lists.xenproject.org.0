Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD0051D50C
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 11:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322838.544275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmuip-0000rr-Ju; Fri, 06 May 2022 09:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322838.544275; Fri, 06 May 2022 09:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmuip-0000oQ-HC; Fri, 06 May 2022 09:58:03 +0000
Received: by outflank-mailman (input) for mailman id 322838;
 Fri, 06 May 2022 09:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmuio-0000oK-Lp
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 09:58:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03a6a6c9-cd23-11ec-a406-831a346695d4;
 Fri, 06 May 2022 11:58:01 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-PS658qyYNjGSZMFx3ufzJw-1; Fri, 06 May 2022 11:57:56 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS1PR04MB9359.eurprd04.prod.outlook.com (2603:10a6:20b:4db::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Fri, 6 May
 2022 09:57:55 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 09:57:55 +0000
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
X-Inumbo-ID: 03a6a6c9-cd23-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651831081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Jcgw0lQ7VK7kWoEy2HNfbVhD4LlU/OJsjypeM2ORk8=;
	b=BlXbqrzgDAFewHZhxb+vXx20toswYx4XcLHW8emyOG9LqBe0//llviDIYMT6byV6m9lNFY
	3x6z7jdkcLYZt1ZCWBpWjo5EZWfNxFCk+S+0UZgIRthADokuTC3Donyd9gzppz3H3Ci3cJ
	IUSfjGKt8ZJ1pl7IfWElbzn71YhagyE=
X-MC-Unique: PS658qyYNjGSZMFx3ufzJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbEPlwQNO2WirrE15tdkFqADNgw8Ssx0mLnLEAU/CjdueeXSdj24Uih74HwvpxAO7AfB+pj0mzQU7FyYEFKHv1GILYv2vNeUihpTU/GyJDJRGxZ7FfkhXIOp4kJ38gykgvLLMxBGRUtgsJCsey0Xt7xqKd+A62kvzyDg1kCFj492cJ/B/4P1va3deWK8Cod1ZGiH7D9hAPgujS1RTwS2uqbBLEYjFAJ0TDeTAxOpbaRuQt2CORsT7vhofZ04IAgVGMOeNIxtexpS0x1FhwqT70SWmfw1Kio34+lKPaYx1qur5twl0VsRMwETBui90U+PbM2HhoXg7LbIPvYYOzGDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Jcgw0lQ7VK7kWoEy2HNfbVhD4LlU/OJsjypeM2ORk8=;
 b=kaU30F2USUy7o8d9bSj9K+sZYIvTYfaXyFNE3aJ2TLQPeyhtqLhQvKPdrmMyU++nqxLtL/wOGKwxyrudnIuTHCrBifoUBdXST/FDWoTgAeIOXHa4kTf+KrBlDLDJZ8UganQHlfE+BEk9Q4fO5K8z/egxAEdQ1rIUQgeduTvknDcLNtZhvHZX1lYBlTaBkCD48B/06+DaR3bz/o69tMENrHCWfuvkLgiWP8925HpYad7Y8jFJGg1xAAfh1WYy6D7l53T7QTJRMDaamCX7NIZ2vfNOSihad8CLEX9R5ouwgEAggXGR6/9KWIb8LtaMNE+fm9C2ri9IjlQl00RGTgwzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <476cab6f-93a1-fa31-567d-4f31c9669cb8@suse.com>
Date: Fri, 6 May 2022 11:57:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] xen/arm: gnttab: use static inlines for
 gnttab_{release_}host_mapping*
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220505103601.322110-1-michal.orzel@arm.com>
 <20220505103601.322110-2-michal.orzel@arm.com>
 <9e759dc2-42f7-01d4-3c3f-17ddfe85018d@suse.com>
 <1be8409a-d550-94d1-bf2e-d53ced5edd0c@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1be8409a-d550-94d1-bf2e-d53ced5edd0c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0372.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88f05131-ae09-47e5-2b5f-08da2f46e488
X-MS-TrafficTypeDiagnostic: AS1PR04MB9359:EE_
X-Microsoft-Antispam-PRVS:
	<AS1PR04MB9359CAECBF0993D8F784F876B3C59@AS1PR04MB9359.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kl5n9NMC2r5EoyAR8ouy9nunQBw1Cltz6jMrUlsnUuEgAb8Qi9llADXX1H+DL8X0cHPevRqLdF7dfV+xetjaWJv3fIqSyL6INymY9vyfIZIjt73lgr0gFxRsiCWdBmiGBxCDZS61GJz5Sc40/OqcJB31W5WShDzD94ZMxxdA2a42MJp4U/8atWCEl5Y3wfafp0VOxQwgndWyvrCMgSIzjmd9IS5MJJrO4MyRRUlbXscPoEoVGf7ERYi/QfY1ofTbZnuTfuNO7l6df4Yb2X4mXn9N1WRGxTYA+1W6jhT66rVoGNmjWQx4w01SgoX84VJkhq2tmW+SCEW9oooC35t7FWMDWZyMR3p8jPCDYfCzvR/bfLXfEWEVzNq113YCb+pMsy/2F2ohQzkiaGX5x6dDMOY9pIcIpl1/rHjrVH/25zTY6zuIOV0l6i8nXTXraCnQZsmdiaEVQ/8Q3AL71hikEXrebBUA9viMd4lQkK0oQHuT30h2b8i54UtJU/UZ6/HIKNJU32VDIngu9tiOReZ20pbibcu3sSvYjHdNGhSAAtkwzWJntAzqxGrdv2Sfiq4JqjB4sy5AuHfiIiDAxpQOZ7C4lrtBCghnBG4DGnUXraqYzX0UJIIrrGvoXRtI9OPWKzEOYvsdGE6M2uap/4Y4kqNvaHvZe+ORmvLRnk3xEEDEFgEv2BDR20dgVRfCWETU8qU6W7UMXwObLuuktbYe3Y11PAaqn2HL2zBgIhoiqcnEvWf6DuD8TTJDBWvDUtVW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6512007)(66946007)(316002)(86362001)(6916009)(2616005)(6486002)(26005)(508600001)(2906002)(5660300002)(66476007)(31686004)(36756003)(53546011)(6506007)(8936002)(66556008)(38100700002)(4326008)(31696002)(186003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1BwQUZBRDZjbWxudXArWU5MODk5eVdRVGd3Vm9QRm0zWGtMM3hRM3AxZFRN?=
 =?utf-8?B?YXBXMFFkcThoV1dkQzVzeG5tYUJyTlpYS2xQOUVlNVE0SXVWbHZjLzlHN3Zn?=
 =?utf-8?B?K0ozK3pTVW42bXJDVy9rR3pOeXZEaXVQMm9PdXBDN3pmT3BzTFZrWVR5RTVU?=
 =?utf-8?B?UXBmSkdiVlZrS0lRamE4dkh3UDFTZjVwK1NhUW1Qd0Q1TmhGOTBOUnMyNndq?=
 =?utf-8?B?bS9IQXNTeHdHbVF1aDRKVWJoR2RPOVp0d0FCVzgyRjc5ekliZjBSU2pwanQ2?=
 =?utf-8?B?Y0tZVEhoeUh5SnZPTHRURElMamg4VWVZWktNS3ZpczhBeW9wTUxQdExTNTRO?=
 =?utf-8?B?ZUxtejlwZkxvMk9id0plOHdselg4OWx0MSt6VHJFOTlBTWFpQWZqTXJ1QldF?=
 =?utf-8?B?bXJvUlJQdlFUYWxOQXl2TUdKOWtoa05VZkRSWVZrL2FvcnpKSHh4VU9JcXBk?=
 =?utf-8?B?ck1JMi81UUR5OXRHc1h5bUh3b0kySXJQUzF2MEozVFpvamx1MFV2WEd6MUR1?=
 =?utf-8?B?OFpDWDNXODZ3Tm5wSFlnYXVrc3BqVm94M0E3Q2UySVpWVFZYUG5saUNRdUZt?=
 =?utf-8?B?ZmVUT2V1Nm9PdDRtVGRCVHRHSGdmYXVML2kyRzVMQVliNStkNllXL0VtaHVK?=
 =?utf-8?B?dUk0M1Nvblh2SGVKY0FWSGtURklJbUxNclpwTFRMRVdwRXA4L3VLc3NWQ0p1?=
 =?utf-8?B?YzB1RzZLdm1vMU92RFFxWFUxejdZNWczNXlZUjcxWHVXUWhEL1JkM0VXRCtz?=
 =?utf-8?B?SjQ2bkRDNWZMb1p5bVVvVG5FYlJ1dlBwVk5LbnI1Y092ZDh2emVKTTJrblZP?=
 =?utf-8?B?ZVVmTmUzd2NxTDl1VnA2WHpiSk5XSXJFWWtsYnE2WFFvTXRCZ3hGOGQyUzFK?=
 =?utf-8?B?Q1ovMWpCdzViNVdDeHZDTVBiNHJwZ0lkSHBoR3N2QkI0UnVnUXZ5VHdhdTV2?=
 =?utf-8?B?UjdqclVsVFBUd25HbXFkaDlOTnRkOGdDWmJicnJ3MlZGUWNBaXFMenVobUhU?=
 =?utf-8?B?UWorU1pyNzl5Ni9ORXRnelpCMVZBZXJOM2orcjJCUGVIbVJmMCsyM280R3Nm?=
 =?utf-8?B?ellZZWVDbVhhUVprWmQ1Zm9OU0QzcThhNkg4azA0cDFHcWhmRzFaZlg3M2tz?=
 =?utf-8?B?TWJJSEoxN0FxVitYSklQdGVCZU5SMjZDcmVJT1RmaTZMclM0NDZWYzI2eFhW?=
 =?utf-8?B?bWVmZloxVXdJY0NaelIzRndySzMyeWgwNFh1T01ueVg0bmc5bk8vcG9kZEtS?=
 =?utf-8?B?UkV4UUJHKzMwR1lLdmtZQkdXNnhpcnl4a3YyVWRzczV6WkpPQVV0blpDd0VU?=
 =?utf-8?B?cHdGS3czTmhsQ3IwOUwyaCt2Zmp0am42NS9UaENLMjY2czZlaVpFWDIzaE14?=
 =?utf-8?B?UG1Fa1R1STg0RndOVDg2ZHlQaXJ3V2ZVS3JxYjRxb0ZtSUM2M3p6TFU3cjdI?=
 =?utf-8?B?OFpiWndKZ3ZwVnhtVDR2RC9JMzYvcjNoNmR2aTgyQWVtUzl2NUVaSndWTjU5?=
 =?utf-8?B?ZFowRXFxSEVET24yMG80QndjTHNRY2tSRERuRlNCWk13QysxdGVDRGNESG5z?=
 =?utf-8?B?MEFDeU54OERjNnBMZXFWUURKVi80YmZuUlRYbWtHZmp5b0hLNUR6NEw0TjVR?=
 =?utf-8?B?Rld1aGdXVngyS1BLc0FCb0RUYTV1R0d4RG14REkzQjZxNm4rQk1FQmhuOXhp?=
 =?utf-8?B?Q0taNW4zRVJwSFlGZ09jQVltQjFIRDhHaWZCelRoY01FRDFQbEMvTG9yYVQz?=
 =?utf-8?B?M3pESStPQUVXRXBzeUhqM0dzNzJwM0VEbXdrc1pOWHVzdmJ5RU12d0U4QWwz?=
 =?utf-8?B?cE9Xc2FzOU5VbmVwa2x4RnpvdklWVGFIU3RoTkEwa1lPdm10c0JSK0xaWmNE?=
 =?utf-8?B?ZmJrVmVTTXo3WmVyTHZNQ3dmRGZaUjRIUFZFWTNPRG95VDZQcFNBRWZVOS8r?=
 =?utf-8?B?cmhsTTFHY0NmaWRPblhmWTcyTkxYWmVSVmV0a1JVblJjamRrN0NIY1JDd3dN?=
 =?utf-8?B?VFg3VEdXK3dzQnNTaFplejNOZkNDT0M5S2w0ZjR6REZvY05VTmtGOTRuR2J0?=
 =?utf-8?B?TkxCUmFoajhEMXRpQU01VFM5b1dyUXJaaStGSkRiQkdQWXEyQUlqejEyUnZh?=
 =?utf-8?B?YUFMamFEMXh2QzhVNi9kMkh4a0pMcHI0NzVya0xBNnJLRkdOM0IxMVVkVWRv?=
 =?utf-8?B?TzBXbHlmbVZEZ3hsdlhMbTFjdmR2M3hNZ0NHYnJPTkpOQWc0bGMxL2pZQnNJ?=
 =?utf-8?B?NHdsNWdKT3hzL0dsMzQyTTdtOFZFT1U3QlRRU3lHNFVkRmVzQzlkOWpqT0Jk?=
 =?utf-8?B?R2VZZXRsVld2SmRIVi95aEY5NWF4VkZQUjNOWUQ1ZlBqeVpTd3pidz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f05131-ae09-47e5-2b5f-08da2f46e488
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 09:57:55.5486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1wzkBOj5ujQn+tpXdZXiedx+8+Uep6x03BUhl9Q8/Np0FBlqiqAlEhFYF2Y59yVDKMAqUzWlLp8FH8bFh+r6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9359

On 06.05.2022 09:27, Michal Orzel wrote:
> 
> 
> On 05.05.2022 13:13, Jan Beulich wrote:
>> On 05.05.2022 12:36, Michal Orzel wrote:
>>> --- a/xen/arch/arm/include/asm/grant_table.h
>>> +++ b/xen/arch/arm/include/asm/grant_table.h
>>> @@ -29,12 +29,21 @@ static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
>>>  #endif
>>>  }
>>>  
>>> +static inline bool gnttab_host_mapping_get_page_type(bool ro, struct domain *ld,
>>> +                                                     struct domain *rd)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>> +static inline bool gnttab_release_host_mappings(struct domain *d)
>>> +{
>>> +    return true;
>>> +}
>>
>> Looking at x86 I think all three instances of struct domain * want to
>> be const struct domain *. Then
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
> Thanks. I think we should mark all parameters as const meaning also const bool ro.

Not really - I did suggest "pointer to const" which is different from the
parameter itself being const. We don't normally do the latter, and I'd
recommend we don't start, or else we'll end up with

static inline bool gnttab_host_mapping_get_page_type(const bool ro,
                                                     const struct domain *const ld,
                                                     const struct domain *const rd)
{ ...

Jan


