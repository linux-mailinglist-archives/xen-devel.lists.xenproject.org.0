Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F204C3327
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 18:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278529.475819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHY2-0003zT-2y; Thu, 24 Feb 2022 17:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278529.475819; Thu, 24 Feb 2022 17:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNHY1-0003wK-VM; Thu, 24 Feb 2022 17:04:57 +0000
Received: by outflank-mailman (input) for mailman id 278529;
 Thu, 24 Feb 2022 17:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNHXz-0003wC-UP
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 17:04:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e31d2ac3-9593-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 18:04:54 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-fbm9m3G5M32sL8OnM3eo8w-1; Thu, 24 Feb 2022 18:04:52 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB8PR04MB6905.eurprd04.prod.outlook.com (2603:10a6:10:113::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 17:04:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 17:04:47 +0000
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
X-Inumbo-ID: e31d2ac3-9593-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645722294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=scsAPxl3AoD+EZsEa2mAz7jdIUYdI2bYxnO99MqC5GI=;
	b=amsaA9vK9qVK8UYXHLvQoXzScGq/mK4TbLNeSDjXf5io4T4mKeQ8SBkbGFkBM5OSBSC4/f
	70k1SkIiAf37zHxzE+suVgn6Tmwg9D+xRKcxmL7+XggalwR96Va+LFg3b44Vl+JAMZP72U
	7oGut6H/E6i0DHr/apo8kF80F0Bv/Ds=
X-MC-Unique: fbm9m3G5M32sL8OnM3eo8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxAdLhRuj0O5lzbDnINvzvMvcFCnP+NlyaDwBCeat6R9wAorkHldvIztjy3knSEjnZw/534Hok3DKu9FILiHiaMskO8lAl9HQtmmDQReKq0yT4rS+aJd67SBoysJVbJaMxhQRjH1Yg/CNy5ik8RH75imrBPRzJH0uDmHUknhdK8jFC0/9zCgrOffjm7PJx4MU/LhVCnt3pdPhZv2f/jAZixR1aelqcteKVYBHBg3cKDALK8mD1Cy2LhoMHyhG+JhlBfrldtnLxyVO4uF8eJMqWzEH/QfuKjZEjnOpxKMwr4Z5VTteffnxrN8SSE4Yf0RXLjHDNNiV85LZYqVdselSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scsAPxl3AoD+EZsEa2mAz7jdIUYdI2bYxnO99MqC5GI=;
 b=nA0eLBvP2M6GtW38eH5Kz6o8icuiHtUwN7izWbDEXusP/w861O1eqVgAMN0gzUZ4JBAWaINseAxKJHf1e+4aknzT1FKYY1HTtwaQQrR575DBq8cpQXPnsksBLg9o/6TbugtUNFX+wuSGllpsP+z+s5xhjsaPEYoHkZPcFvkmkmUpsxZ9laVs2ZRBdZwQPllYmh+YcJmghugtEyBwMs2kLzQ0QczDFn1zQtfV9Uw5ao13V2EH/5WLdCiLXGrn7gOcoiFXlw/tNGfcfsbl1o41R00zSrogUIU222L0u6dYphkALLGtgRq8NWlLuSzpnGcjRaQYemuMuOo3H4jQURpMgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7c952bf-ac8a-156f-6015-738ff5eaa138@suse.com>
Date: Thu, 24 Feb 2022 18:04:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-3-jane.malalane@citrix.com>
 <b83773ec-c97a-7aea-e61a-c2e34b270816@suse.com>
 <50854702-490a-521f-c4af-1de57d4abf4b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <50854702-490a-521f-c4af-1de57d4abf4b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0087.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e56c004-ab83-4c20-53c7-08d9f7b7c335
X-MS-TrafficTypeDiagnostic: DB8PR04MB6905:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6905660458439CA307A68756B33D9@DB8PR04MB6905.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aFzHMCPdnsiFgjhW4UZCfFvqCGNC44j9M9b47VWIg4X0OscCRzYkAongRRm0eobL/FIJqg9XBW5Gjpe5P7Rym3KFCxBNBZoA1BgTUF4X7ANSocCZLLhLQ0B2RjwM/Zu/zx5Qmp9QV5mgkOXOb402OBtTvrdLnFBzEOf1fKTSgyGF0eREtMsA5Z40glG5FV3u3LadOWIEaMAS3aq9wmXoPOlk3qiob4awXXmLPvYetCVQqhJjaH4lAoagEPWNiHXVDlS+nBpZ658/xrr2m314Ccx0jJ7B8uVGWLQcMt0MKP0muBEVhWZIKXNfvHnK6dNBWEOIcCLyOX5cqxKT338XTX/Uyc7IVrKQb3EYl+ALfdxYjuCsNOo9R3ye+a5EJ++j0kTiXILjYVXV3KqauJdSJa+e018X/ZSN1XXN3ZSmXQ2ZGinoDM0ga8xTZNyOZvV1VCb5JdPVOEQ9K/o1kT2q7FrFCMhjW0LQCtxhul1nU9vIuzy77FQjeuVOlQe0wleWY/hTL93L3fUu/7GFSvLn/XKg3/lpAD4V3wxHeFojXILMygGPLKIqdNXs1ybejEBYxg51S96nP7oQOZoInsGU5KdI31+W/ygcIQHYlgwZeIVOKylFHUN9ReHCO4BnrYivIfrgXRikkKNaZ1GJDHt3XbmtlI0hq4/EYT5mH7XLf5Df91GohXfJwwNABxA2t3VCNrMtz0wlPlFUv3J/YQXMAZaDe2YE6ygqK9+pDR0nNFw9opssENJI4Wyum8ghlSJa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(31686004)(83380400001)(36756003)(2906002)(6506007)(8676002)(4326008)(66476007)(66556008)(5660300002)(508600001)(6916009)(38100700002)(54906003)(7416002)(8936002)(2616005)(186003)(26005)(316002)(53546011)(6486002)(86362001)(31696002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXdJaHpMSjFZa2xBMDFmM2Q1N0dRZldFTHcwZ3BqMXpySXBJam95cllvNDg1?=
 =?utf-8?B?b0RZeHFHOVFXb21kMy80d1Y0d0tjdW0vaytiMTc0aFF2OENZNmhtblpKL0E2?=
 =?utf-8?B?UjBGeWlwM3g3Wnc5ZWZsbkl4WnZ1SklQa1M5bEx3cS81Q1hSK0RSQ1EwSWVh?=
 =?utf-8?B?SUNNMXRTRjM5MUZPdFFpNjZhSGdjcHUvbU9VbHVHc2FBYWdIOHZPT3ZSZTdo?=
 =?utf-8?B?Qm9VUCt4M0FVS0N0b0tQZGh1enRZWXhDWDJDaG5YRFVlbzVGNE1qcDhKYXYr?=
 =?utf-8?B?SmI5ckFGU1pXSjJZZVAxdCtSZ2lvcXdtMGJHMEg2Y3BLTXhyY3ZpaVlxYW1M?=
 =?utf-8?B?YldKbUhXOVR6bm9JWWdNdWo4ZUFkZlZocWc1cGY4WlRUaW1lay9yMW5DOVgw?=
 =?utf-8?B?cmJzUlczSXdhUi9kVUNOd0pmU3dBcEc0VXhob2RsOFFJRkV0cWRvRFM3WTFz?=
 =?utf-8?B?OHEvK1RrakxSVVR1RFRtRW5wcDlYNE9sRnpTYW5oMmxZVlpLbnZ3TVQyZ050?=
 =?utf-8?B?WEUzQkhGYkNXK1EvaUY0bXdYd29VcytINWNOcEJWUmo2dGxjazlmUCtTUmVY?=
 =?utf-8?B?TzlWaGs3VlUzcGdVL0RtOTRpSVJzVFIrREEwSTNPUkFtd1ZHeXdyemw3NTU5?=
 =?utf-8?B?c2RuOTR6WEcwRmhQVkQxaWVoMDY2Rmp2TE5KL0lRTDJmcXhUUGxkSWRsVFpa?=
 =?utf-8?B?bHcySTU0MHVIWU1wdlI0WFhHRlBhdGVva1JzRUNOT1YvcENEdEEwVlNiLzBR?=
 =?utf-8?B?VHh1Yld4NXhyRnhHUkxIOXhJK2xhOExoWU13U1dkVEhYTlhiaGZKaE54Mncr?=
 =?utf-8?B?QmFCa1hTemQySVNlR3lsL0hERHRVWVhwUXhsbUZyVjVMTnFCUTNtSVQ1UHNo?=
 =?utf-8?B?NWtNOTF5ZmFaU3J1UVV1MVJaU3F6VkUvcXlCMXp5NTNoUllCZTlIcGtsRVBC?=
 =?utf-8?B?VnQ4L0xxRll5bVd4U3REZU9kdEttNDhMNmpidXlWcVhuWk1pdE1sbjNueXUx?=
 =?utf-8?B?eEZWUm1yRjBFM09MN0RCU2lQL2x6TStQTzd2MXV3NXBEYTQvQVU0cTQ4R0Ew?=
 =?utf-8?B?ZTl0Y2h1VWQzNEt6c2RKWEZ2LzIvb1lQZHpFN0owcm0zOEc0dDJ5MytxRWpW?=
 =?utf-8?B?bFM0eXEva1BzakVpN01QVExVT2FFdUwybUZXN0NqZ2JiWWtsWTVuRVBHMTBG?=
 =?utf-8?B?N1BhbzNRTFYxQmZjalJma21PQS9RaVZvYnIwK0ZFVmhCVm5wWmt5Z0E1TXN0?=
 =?utf-8?B?Um4ycmxFd3NPQ3NOWXVrdjZ6MkhDbFN0OC9iMTJRZVEvZEtYdlc2NFpPZDA0?=
 =?utf-8?B?TVlEL3VCTjc5TTFlUFBQTmVDakNtbjMwNDNDbkJhWEx2YWQvSVJ4RGhIZmlC?=
 =?utf-8?B?RXA0c1RyTFFzNjFzWnVrZytVT01DZ0lhQUpxWTkybzVPcWtGZ2NYM2F1WVhK?=
 =?utf-8?B?QjVSTDFuVU43djltTFVCaXE1eUNNTms5OEp4Q2dBNzJxYWFIZjdqNk5GdXU5?=
 =?utf-8?B?Y3JiVzFTU0FWakFnZ1FIWkRuRnJUK1NaK2FISlJQRnJYUk93SU4xbkZXRjM0?=
 =?utf-8?B?T1RwYytISmVWbWV6b0NCRGFSRnNFRWlTRE16Y3d1ZUpjQktmQ2R4TFhXV0hj?=
 =?utf-8?B?MmwxZTRveHBrTnQ1Z2lZZTNVQU9rV0NtMkJYb3RYaGhQMkxaOTJUMEpwdHdC?=
 =?utf-8?B?MXNrNXQ4Q2xEeFJaYmdkaisyeXNkbEhKR3RJOUJER1RpSHM0TnVacGFRRG9W?=
 =?utf-8?B?NXE0aExHeDdoclBDR0w5MU5uN0lReDF1NHJheko3UHdPd1JnbVd5cTdqRWxl?=
 =?utf-8?B?YXp2aGtZVC9vUzZKL3EwQWpIOG1HTmJRejJCTHBmSlZzMlNqS2ljYUdTZFky?=
 =?utf-8?B?WEcrSTBEaENSQlY4TWJnaGxOVVAxczNkblU4bEM0Y0xTY1VlWUxHb1VWYXho?=
 =?utf-8?B?SEQ1WlNqT1VJb05QTGE1YTZDN0NyajRzRFd0Zlg0MFdmUWNQaWc2VXAzV08z?=
 =?utf-8?B?YkVIeW03M3NqMjkyTW1QWENmVWY3UDBEOHgxWTEwaDlrM1FZaGNCa09tRkJu?=
 =?utf-8?B?RVlQcFZiZDdzbElJTmNGeUR1c0cxUkJpVW5sT3BqMmp6UXBmZUkyald2VUFi?=
 =?utf-8?B?THlUdnpVamlkNkN0a3R1a2JZOFhaOGQ4aWJ0NTdNemlWdXByaFNQamtKVzZs?=
 =?utf-8?Q?Mbatm+HYM8O6FlcQWge7THE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e56c004-ab83-4c20-53c7-08d9f7b7c335
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 17:04:47.7326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRLnExaqfHw8lp7qPvvcrhj43+XsSS4Xs6o70RF8sk/iDfvd0y3CVuIXXzs/9+kOgPDQhzkg7q8Y8cmLb0tnlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6905

On 24.02.2022 17:59, Jane Malalane wrote:
> On 24/02/2022 14:16, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 18.02.2022 18:29, Jane Malalane wrote:
>>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>>> @@ -3333,15 +3333,15 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
>>>   
>>>   void vmx_vlapic_msr_changed(struct vcpu *v)
>>>   {
>>> -    int virtualize_x2apic_mode;
>>> +    bool virtualize_x2apic_mode;
>>>       struct vlapic *vlapic = vcpu_vlapic(v);
>>>       unsigned int msr;
>>>   
>>>       virtualize_x2apic_mode = ( (cpu_has_vmx_apic_reg_virt ||
>>>                                   cpu_has_vmx_virtual_intr_delivery) &&
>>> -                               cpu_has_vmx_virtualize_x2apic_mode );
>>> +                               v->domain->arch.hvm.assisted_x2apic );
>>
>> Following from my comment on patch 1, I'd expect this to become a simple
>> assignment of v->domain->arch.hvm.assisted_x2apic (at which point the
>> local variable could go away), just like ...
>>
>>> -    if ( !cpu_has_vmx_virtualize_apic_accesses &&
>>> +    if ( !v->domain->arch.hvm.assisted_xapic &&
>>>            !virtualize_x2apic_mode )
>>>           return;
>>
>> ... here.
> Previosuly we discussed setting v->domain->arch.hvm.assisted_xapic equal 
> to only cpu_has_vmx_virtualize_x2apic_mode, that's why I have those 
> additional checks as at least apic_reg_virt or virtual_intr_delivery are 
> needed for the subsequent parts of this function. I might be 
> misunderstanding your question.

My expectation would have been that assisted_x2apic_available is assigned
what is (in context above) assigned to virtualize_x2apic_mode (in patch 1).
Anything deviating from this needs, I think, explaining there.

> Unless you mean that we should fallback to having 
> v->domain->arch.hvm.assisted_xapic depend on those other features...?

No, xapic is fine afaic.

Jan


