Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF0945D765
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 10:39:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230792.398965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBDO-0003dQ-NT; Thu, 25 Nov 2021 09:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230792.398965; Thu, 25 Nov 2021 09:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqBDO-0003bQ-Iw; Thu, 25 Nov 2021 09:38:50 +0000
Received: by outflank-mailman (input) for mailman id 230792;
 Thu, 25 Nov 2021 09:38:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mqBDN-0003bK-B7
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 09:38:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d5b5ec7-4dd3-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 10:38:48 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-JA_TTEdLMYudLVrSZ9EUSQ-1; Thu, 25 Nov 2021 10:38:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3120.eurprd04.prod.outlook.com (2603:10a6:802:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 25 Nov
 2021 09:38:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.027; Thu, 25 Nov 2021
 09:38:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0274.eurprd06.prod.outlook.com (2603:10a6:20b:45a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Thu, 25 Nov 2021 09:38:42 +0000
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
X-Inumbo-ID: 7d5b5ec7-4dd3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637833127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWUsxoyMaoylYk7n/ZmtPRb32D9xpyOF1V6P0u5DQHY=;
	b=FBhAIsVtbMxEsOL84G0QD3edUBiXUcYj8DIxKGprAKr+OlpW89TejyC7X2z26lfdKDBrxE
	/Xz5LUeK9lqo5r6JetW5vvVw+wFOLJore6fPRDmoclLGKeHSVSfSBKEkj+OCaMDxHtHZPF
	eU/FICmQ5v4T7PWDO6kZE4m1Ura13zQ=
X-MC-Unique: JA_TTEdLMYudLVrSZ9EUSQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhYzu/MVH+02F+6I9Rz7tp8LkNU+ums2fKz4OYQzV3LDzdTATBtWe6BKZvb/FoGHJvNVX5swtroKBui+qespBZfmEYz3htfPWygKPLGp0filOvPFpcTfuW/kstV5JzRG2lr7gLc3A8SrRDcA39gddBLF0PScFHcf3F6xceJ8Bvr7sShy2MIl44nVKXCSxNyWACOueuaAm/wHKlmhkIa0KKpCTfAuuZYZFkbj7X3n6gcmcKl/mNe7GX6LvcN3DtJxKNM141RRGXxE3kgJ6qJkEF5IsQC/SP9sVJyo4g5Y6wwLmkFKN+fASeX7r1kyR5/XlaIcHD48D2kWVbaUAKxBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWUsxoyMaoylYk7n/ZmtPRb32D9xpyOF1V6P0u5DQHY=;
 b=m2JcTGyTv7sjOYOSA1uJAVt/nBgVERCAdQ5na2TueTNT0GH5xFBx8lpw0IYFND0xw1ku4cHF2juHXwJPElS77fT5CHIV9KNR2del0Z34489q0PFbGMtw2LkB8VLYqRFVS+ph70poK55FkTDJeLtTuu1Sh7B8ybYQECcQ1EhtMwgggkEK8ceeTovl8DVIYZc6zeOrQ5fMxHaQo/iHKT2ATtmWgKgYlSb1gAiJ2wMZ4Zv5pTisC3BYOvaUMFHx/pMZx11URyInFpMW4Krr5zM5j5QbvNzbFA7P+o4pVYiewY4VZ4PQOMkUWZSRnGMbEYb4IUgMriLtq3pFS1Ct8XOreg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e64c22c7-992b-9fdf-a276-263e9173a313@suse.com>
Date: Thu, 25 Nov 2021 10:38:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH RFC 3/4] xen: add new stable control hypercall
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-4-jgross@suse.com>
 <b1599a82-052f-9369-3774-69c5c570370c@suse.com>
 <5ea7400b-448b-039b-6d95-2552c9ae7cd4@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5ea7400b-448b-039b-6d95-2552c9ae7cd4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0274.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff05e61e-ca92-4591-365d-08d9aff75edf
X-MS-TrafficTypeDiagnostic: VI1PR04MB3120:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3120067C86AFBE9DC072F026B3629@VI1PR04MB3120.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JpqvCb08iDnzOOYF2u2gmQ8ExxWXvz4R22anzcvRtwfm+S9ynDLnkukU62Z/Wxt4/0t4RVZiPI+GFNVhoiN+LPfkAFjmlecIPU4H28fjxjwz2VL5sk2EoVNic4zmYxoyWPIGoaDLv5N4kiFiYGCvudlaHzRpMaEiTSDLUTT1GLlj9onkkDGHKAwAYCceWXkysbgetYOX7JPSQDYj5uNOl6vODRsoRgtl/E2SvlW22oMkzvfsJ2temZAaZOcagiteYV5/OPgsZkf6Sb+IVjqMvlrp5NY1H9HjZUJZhkxaySmiWUyGTDzqVYDWMK2VTucXLJffEfsLAwbZ38UiGR0cSs359tb8iZ/lmNmZo5kqvY7PUT/dnzEBbL1nkdoU3y+wZhC2ZqmOiyhXTOb0+Zj77+TwcwuZTqQXVPwPxsilXg/ziyKNv7j8omqqxkTI8LoLAXBg/S5slw+U4DWlV8XUFJeGQMTKbdOyFyHe6Wn0VjxNA2A3YRdUMWXuFGas5GqUWKXZOLZalWi8OsxFphqZ/M8wBgtd+ojYNRGYwM3vv9zbY+EHR/lIsNvrLh0A8axftrMMOwvGd2NhJoUCjPJDOzUQkVyT8DCbGsOk4RJ/IJdc3Un28aEpMN3JYgeu9Xc5XXn/2khYadOvZeps1nwqCfaKKhWETP+d5hVwe5quuhMLWqePCdBIiRvYRYX+Xnx5vm5CSD94GuRRywXb/cKR1KAY+r98LTZa6Odu1CVi9o/WD7QBi/eIyrcKorVIyvha
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(83380400001)(6486002)(86362001)(38100700002)(6862004)(2616005)(956004)(8936002)(8676002)(186003)(508600001)(66556008)(66476007)(66946007)(37006003)(5660300002)(36756003)(16576012)(7416002)(54906003)(53546011)(4326008)(31696002)(26005)(2906002)(6636002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THI2cVV6WDhMMkdMSVV3V2JWdmRtVFZmejltU21nRW80YUhhUFBxZWM4eXRY?=
 =?utf-8?B?dEVPMSt1VFpWU1VaMjRrWlpCRVhvRStrRVAvUEJxUllMSWsyTFAyWmVySmU0?=
 =?utf-8?B?VkhkMEZtTEl0WFFhcmNlRlRnSEM3ZG5hNXFkUXdHUkJkSTgrZ3JDZ21vd0tF?=
 =?utf-8?B?U3M1azloUm11Z3ZGc00xR0RHVDBEaW9aRUhSY0FrV0tCN0NzSllrOGlPYnp2?=
 =?utf-8?B?cnpuRmhGR3BwYXg5d1NBcDVleStnamVPMTMwVCtxZzVVekhuazByQkVXdVVz?=
 =?utf-8?B?ektIczJRMms5YW1DT2U1UHAvUXR4TEN0MWp6d1FMMEl0T2xNM0w2ei9hM3lR?=
 =?utf-8?B?U0huR1FVblAzcFhIdlRybUd3Z1RYUVlWa2I5TzZDUysxTFpTd2g3aUxHbG40?=
 =?utf-8?B?NDhoRVhSTjV6Z01DclF3TVpiWUpDbHlxaGFpSkNoL3h3RkkvVTYybkNtMHZF?=
 =?utf-8?B?ZjVxVWczQ0dTNHFGVjRycU4zM2hCWkhBV2U3RUNCdU1KMGxUbzVNdzdNY0N1?=
 =?utf-8?B?UEplQXhWSUxVS2RIUlJvMWpZOURmMjlJb2pDdnQ5QWM5UkhqVXh0Z0wrOVhS?=
 =?utf-8?B?emUveEZNeG5OVHNXRWtxYlJ0bTNqdmkwbHIyZVR0NExDcjRLeS9jaHBORlRD?=
 =?utf-8?B?K2F2MXE4VHRlb2x2akdHR1U5cnhVT3YrYzFCQWc0MlFOM0VzaWN4ZmJhdW4w?=
 =?utf-8?B?cUFSbHlJd1dFQ2tlUm1jUUgvVFpQU1ZmT1pjaXdLdmZLZklzY0lya0I5N2ZP?=
 =?utf-8?B?d2dSZEI2cWdRZ1dLajdsTXptdWpaOEw3K0dPb0d6OHBZaXpWTjUrbTd3aDBa?=
 =?utf-8?B?cmY5S3ZJZThDeVJybjJzSUtOd0Q1LzczVGdNNHM4SHFaYjVTN0xseDk4cWww?=
 =?utf-8?B?cmR0dDh2TzZETWNOb0FZMmh2T2VEVGpTcmRVOFhCeVErcDhKMWg1UnpsV2Y0?=
 =?utf-8?B?Q3VOb1ZPWE9mMXJ1c010b25XZG9DVkZPU0RBd1N2TDNTMTFSc0xpaytlQkdI?=
 =?utf-8?B?Y2toMUp6VTdCanZDd3hPOERndGV5RzlVNGt0eWhacE9iUlBYdjllUlQ4TnI2?=
 =?utf-8?B?d0trK1hlSGE5UWo3S0JkNm9oM3hubUNtTlZNVHBsMUR3endjbXJIVjA0OHpC?=
 =?utf-8?B?dmxyZ1pVNWNQcFRDaER3ZFpNK0d1b1RiQjhybnBTN1BXbjdyZFRqTFJMOXds?=
 =?utf-8?B?U0dVelJkZFJGbE15ZG8zVi9PV2x4WEFXdmozOFAzTFZRcjBiK29iVUVqVVlu?=
 =?utf-8?B?WlJPdGRuSDRVR1J2eGE2aFJuclFMME9KWEh0SXdLN0JsdEROU3NyTzFzYnVM?=
 =?utf-8?B?c3lONVo2MHZwcmpXZldubWpPbmpOZ0xGOWs1L0lmR3R1dXlWbkJGclI1c0Yw?=
 =?utf-8?B?UkN5azduT2JNSUd5eGpXaVFhOXB6dVBTamR3RE1TUzZYeVUrMzFEdEx4ZExG?=
 =?utf-8?B?bDQ2cXdBZmJUSW4xT2NXR2g2bzA0Y3M2aldubW9HLzg1VFJqb2ZxQ0U4T0dy?=
 =?utf-8?B?aUlpaXIxVlRxN0loQ3k5eEJWc3dHR2Mxdk1kZ083d0MwdUNRMnArK1BPdmFZ?=
 =?utf-8?B?dEltTXRSeThhSnNCR3ZvRU1UK0dGWnIrQ1JuRnU4ek1neisybSs5SlVRbkxL?=
 =?utf-8?B?aW1hNy9neGpvckFWMXJSYWZKSW5jRGlXWFI3QjBMV3VpaUl4VzJlUHVkNHY0?=
 =?utf-8?B?RGExK1VnOUVmT3NsUUkydFdRRU84SFVBSWlLNW5WVk5zdnc0VEluMkVDd0dI?=
 =?utf-8?B?TjJNQzVjMlFnZzdFQUNRdDZ2V0dwUVBacFVpZzdiQ2pFSUhMSTIvRHZXa0Ex?=
 =?utf-8?B?a08xQ2ViUVgrejhWUjdEK215cFB3VjFtNHYyYlhmdHZnVmkyUDhoUHRDVWRG?=
 =?utf-8?B?Y0ErSVlOZkIvRE43VjJ5YWlsSTB0Y2Vkd2lLNVgrVlQ5QTJJOUtWeDNWNmxQ?=
 =?utf-8?B?Rzg2WWdia3h4T01yV2VtRWpoZGZRaGU1VU5ObmJIdng4dTBZRHVEQmtaZ2hG?=
 =?utf-8?B?V2lDQXF2UjkzVi9oV0tqWmFjbGxPbG5lWThaKzl5TzQ0Z3RjakY4UlVzNHFp?=
 =?utf-8?B?SnJ0N0hzUFovdi9QMVlKZktsVW54Y1hFZXVTT0RUMXc5SmE3b3BseFNIOExP?=
 =?utf-8?B?d1E2cW9rVnRvZ0FVVU9PbWhucUVXVTlWMllwZUxxL0ZNaU9SM1dIa2ErQ3Vm?=
 =?utf-8?Q?wai/UTO1LrOQ2oQl4jGUVj0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff05e61e-ca92-4591-365d-08d9aff75edf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 09:38:43.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RA+BSyVQhJoNlEwCExfU7Ii0uhXpuA3XkapI8sC7j4R7elMcRVWHggciUBjuhCTWn8UcU1xmHmn+eovGJGPVKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3120

On 25.11.2021 07:55, Juergen Gross wrote:
> On 22.11.21 16:39, Jan Beulich wrote:
>> On 14.09.2021 14:35, Juergen Gross wrote:
>>> @@ -103,6 +104,43 @@ void domain_reset_states(void)
>>>       rcu_read_unlock(&domlist_read_lock);
>>>   }
>>>   
>>> +int domain_get_dom_state_changed(struct xen_control_changed_domain *info)
>>> +{
>>> +    unsigned int dom;
>>> +    struct domain *d;
>>> +
>>> +    while ( (dom = find_first_bit(dom_state_changed, DOMID_MASK + 1)) <
>>> +            DOMID_FIRST_RESERVED )
>>
>> As per my comment on the earlier patch - the use of DOMID_MASK + 1 vs
>> is quite puzzling here.
> 
> Okay, will change that.
> 
>>
>>> +    {
>>> +        d = rcu_lock_domain_by_id(dom);
>>> +
>>> +        if ( test_and_clear_bit(dom, dom_state_changed) )
>>> +        {
>>> +            info->domid = dom;
>>> +            if ( d )
>>> +            {
>>> +                info->state = XEN_CONTROL_CHANGEDDOM_STATE_EXIST;
>>> +                if ( d->is_shut_down )
>>> +                    info->state |= XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN;
>>> +                if ( d->is_dying == DOMDYING_dead )
>>> +                    info->state |= XEN_CONTROL_CHANGEDDOM_STATE_DYING;
>>> +                info->unique_id = d->unique_id;
>>> +
>>> +                rcu_unlock_domain(d);
>>> +            }
>>> +
>>> +            return 0;
>>
>> With rapid creation of short lived domains, will the caller ever get to
>> see information on higher numbered domains (if, say, it gets "suitably"
>> preempted within its own environment)? IOW shouldn't there be a way for
>> the caller to specify a domid to start from?
> 
> I'd rather have a local variable for the last reported domid and start
> from that.

Well, it probably doesn't matter much to have yet one more aspect making
this a single-consumer-only interface.

>>> +/*
>>> + * XEN_CONTROL_OP_get_state_changed_domain
>>> + *
>>> + * Get information about a domain having changed state and reset the state
>>> + * change indicator for that domain. This function is usable only by a domain
>>> + * having registered the VIRQ_DOM_EXC event (normally Xenstore).
>>> + *
>>> + * arg: XEN_GUEST_HANDLE(struct xen_control_changed_domain)
>>> + *
>>> + * Possible return values:
>>> + * 0: success
>>> + * <0 : negative Xen errno value
>>> + */
>>> +#define XEN_CONTROL_OP_get_state_changed_domain     1
>>> +struct xen_control_changed_domain {
>>> +    domid_t domid;
>>> +    uint16_t state;
>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_EXIST     0x0001  /* Domain is existing. */
>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
>>> +#define XEN_CONTROL_CHANGEDDOM_STATE_DYING     0x0004  /* Domain dying. */
>>> +    uint32_t pad1;           /* Returned as 0. */
>>> +    uint64_t unique_id;      /* Unique domain identifier. */
>>> +    uint64_t pad2[6];        /* Returned as 0. */
>>
>> I think the padding fields have to be zero on input, not just on return.
> 
> I don't see why this would be needed, as this structure is only ever
> copied to the caller, so "on input" just doesn't apply here.
> 
>> Unless you mean to mandate them to be OUT only now and forever. I also
> 
> The whole struct is OUT only.

Right now, yes. I wouldn't exclude "pad1" to become a flags field,
controlling some future behavioral aspect of the operation.

>> wonder how the trailing padding plays up with the version sub-op: Do we
>> really need such double precaution?
> 
> I can remove it.
> 
>> Also - should we use uint64_aligned_t here?
> 
> Yes.

But you realize this isn't straightforward, for the type not being
available in plain C89 (nor C99)? That's why it's presently used in
tools-only interfaces only, and the respective header are excluded
from the "is ANSI compatible" checking (memory.h and hvm/dm_op.h
have special but imo crude "precautions").

Jan


