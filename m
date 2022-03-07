Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D184CFE85
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 13:31:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285971.485271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCWY-00063F-Aa; Mon, 07 Mar 2022 12:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285971.485271; Mon, 07 Mar 2022 12:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRCWY-000610-7J; Mon, 07 Mar 2022 12:31:38 +0000
Received: by outflank-mailman (input) for mailman id 285971;
 Mon, 07 Mar 2022 12:31:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRCWX-0005qx-2x
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 12:31:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86fb9e73-9e12-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 13:31:35 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2052.outbound.protection.outlook.com [104.47.12.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-8V8-EMFpN8Siq06a9EicJg-2; Mon, 07 Mar 2022 13:31:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5298.eurprd04.prod.outlook.com (2603:10a6:208:c3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.23; Mon, 7 Mar
 2022 12:31:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 12:31:23 +0000
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
X-Inumbo-ID: 86fb9e73-9e12-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646656295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OX8+mQGx/S0OPfBxV04yPiNt/DoaGgGSTLZ/OoAajj4=;
	b=WWPMaBwcLqxk7Yxuk2JtSnPsts3TQ4dU4PhMnu9R0vgGrDAlkBrM8M9ybNSmT3Myx4QcKB
	osHN3jcSIORb6qFVymaW5K1pdW1VCfGKSDozQjta64FT0CvgVpeuAf6XW9W8KfcP9m5RE/
	V0VBvjNPM5c1gzfZZEviZK2CxaI5fN0=
X-MC-Unique: 8V8-EMFpN8Siq06a9EicJg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2ORbTD25SHIKuT/RB9wO4GdXCq/p9tSipSO06hpxcRPiIKTdPmYDH6jGIiEEqOASxnaFTgZcGHyGRuAN/9XGAdlHc2Ee1IZv6Cd2l9gE9YGS9EjG1qLQwCPSLTN0tpddFrWBWRFSR9J3VSVAh3awJWN4VvUXfSIvOn7LADjnIDwEgiMn/zljRJxn5LsQlKQdNmVW5F/3Yyj9D05t7wac2tg2QzGNrlp3GSt5HkEEVmORE1X4fPcaRO0wmBwX32f2Wx6Jy/+Uw3GdlG1b/kHlP9H5Hq3CJDSAW6JDl0+66/pzPtFBldtDW+OpLgecbl/UhqEtnVVBWR/neCWbpTSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OX8+mQGx/S0OPfBxV04yPiNt/DoaGgGSTLZ/OoAajj4=;
 b=KL0qWW+QlUsuLJZrN5dq7WBj8Xf2QglDzu/lNP0tagFy/fhY0f0EVhu9UJQMfqAEBJ1qVUkpHEJDdKloEpDHRvk9Hi6lhrmBqhORbECM6LJu8zHiMiR8mNAq0NUBftGxp3msu25nMFcddSDuPmx7x2e3FDuGN4w8RzY0ZLLx5ASS79iksm9nCYhYyqfFfiCqCqBU7RRs5pYFFfUZb/UUi+mgftJLxcohH86lRGUCVHZUnVnYvfH8TdPJCYD7dy6uC1ETppoTzV+IkTcLBQFjVEM6ep0e3pQ3MsupmBWmKlAwcemzmf9iWDvCgnetPUN3wkRJYCAdftnL3qv+NdxIWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <299a0fe4-e7c0-b381-4318-a27f02c96d98@suse.com>
Date: Mon, 7 Mar 2022 13:31:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: Jane Malalane <Jane.Malalane@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220302150056.14381-1-jane.malalane@citrix.com>
 <20220302150056.14381-2-jane.malalane@citrix.com>
 <240602ab-412c-8607-ed6c-916cf37343f7@suse.com>
 <67296830-aa16-4231-69ba-f07d2b1a4b65@citrix.com>
 <fa957ce7-07f8-9726-9537-8b05e9b6d76e@suse.com>
 <ee556d51-bcf7-5749-6e3a-92d1ec3092f9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ee556d51-bcf7-5749-6e3a-92d1ec3092f9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0004.eurprd07.prod.outlook.com
 (2603:10a6:203:51::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 443e85ec-d25d-4043-9d62-08da00366402
X-MS-TrafficTypeDiagnostic: AM0PR04MB5298:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB52987DE3F26EC850D290EAFAB3089@AM0PR04MB5298.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xKxsQfaNKTNyCDuDq0TkbGtUJSuNXao7/5RXvzrq5DR107l/OvOMx0ZXHE5SNnmw5w6icMM2wICokZFgz6++Obwd+puyqNKpxfSedZJDqvKHlYtXzd6rzQOEWVkbdlPr3T3eFe641t/JuIxVYXNdGmkQSP0PIZ6fnIW9ITdYtgf15QzEsE7UwAPGgrgStx8CyX2HeSJRGL9QzGPFdFDuL9wRLnNPSo7GzyxsUyP54MHyNy5subSrosqtdizD4GdrLC915u6R70nfry1aLj8SXM7FjG3nBMWsvsjEafp0QCiJMsTgGk8ZcnA44GhsShVdWZIdgRglFt5NzXoj87Cae/9VcooYmgOnKTDv6+axMhjckAGuOfeVyPlfYA2jF/1AAKXxD96C/6kyOIkw4XsyWrCDEA8/sZak5HK/Rx9sDNNMt9qudMuox3rAnJsAcA2IOjebJoB8PIpX3AFvNmpj6vzkF16Jp3HIW++RYd6k8M3c86fg5mZ7kfUyWv2BqThaAnGUhh1O+0GTM/3nvNRjScCdYalcnG6HtS/f/5OxUOCzvXOAmMw13WFJhdAyJ3UGdhaWC+EvYujFWv7CD1lfY1jWWamTGk9bH2n8W+kVY/Fl5y+WwooROzOzoi41FOwxzm9xjZKCseS2Cdh+Ste+bG8/nYUw4ziUu1IElEXRnTqrdaaDhEvSyWnPKL+wzBhadUb7WpJoJFikLYtbpkIGvNzR7vEj1lZ8Mugb9jwOBx0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(5660300002)(36756003)(7416002)(6486002)(2616005)(8936002)(6506007)(31686004)(6512007)(508600001)(53546011)(54906003)(6916009)(186003)(66946007)(4326008)(316002)(26005)(66556008)(66476007)(38100700002)(86362001)(31696002)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZndUa2d0eWtTME1WOG9Fa2ZHeWFnQXRMZTFlK3BVNUpXWWRGRjhJcVJFdWRz?=
 =?utf-8?B?cllKTTFKRjVVYWxZZGFKQlAxNUFseWczY1JmcUE1NWVTSjBvQmZ6NjJCcjlh?=
 =?utf-8?B?clhNWExLNjVUaXZlVDBScE5lbjl4OExBOG5WRUZQQUxEUk5hVlAvc3JKOGhG?=
 =?utf-8?B?aE83Y1QzR0FrcWlVeTJTaGdmclhyUUxSNmtTTXF1cStUMzhJemxaeENsT3Zj?=
 =?utf-8?B?Q044aitlWnNNYUdKQWV3UHlIbmRRL3dKWVRvTlViMUowd2EyNW5YdmVWWVJk?=
 =?utf-8?B?MUlDRkR4VXYvbDY4QUFtTHJWSDZMem5BTTA0QU5FVS9QZ2NOZWp6U1RvVFBt?=
 =?utf-8?B?WFI5T3IvWVFlMG5uc2srUmQ2S0hQeXY0dXdvckszTlhoS25URTNCV1FRVUtL?=
 =?utf-8?B?b3pSWkZDbmloSnRoaGlRVElCQnNQUzAvbHR2akgvdTB5aTdOV1RRdEIwNzZS?=
 =?utf-8?B?VXBqVC8vYmVWSWZSbk9jT0xESkhkby9SOGkxZ0NmWDdhWFdwMGFYOTdiQjlZ?=
 =?utf-8?B?Yy9ndWVrejlpb250MjBhT1lseEltc21zcUYrUVNJQUQwZVBOSWNDK0pzaUxQ?=
 =?utf-8?B?eTIxY1o2SWdYVXhVVlVvWTYyd3dJQU83eVVVOWJjeS9UcEgydERib29VaGhP?=
 =?utf-8?B?aEF1d1FXOUhtUzRsaGk1RnMwbXJiWkxOZm11TnMvanVOL0NUT1piTjFxY0tr?=
 =?utf-8?B?eDJCZXhHeENheXAyL1JycjZZZ2lFV1R0N3hGanBzQXZBTVZrd0lxbFpaSVlE?=
 =?utf-8?B?dnBOSW9yYUNIRHRMSU1jbTZ2UkVHbzFWbkVQNUs5SFRGQ3ZDdVIwOC82VUZz?=
 =?utf-8?B?N1ZXYUM1anlNTFhvcStwT3B2V1R4NG40UjFGNTRURXJDMUFIZEZ4NUorR0w5?=
 =?utf-8?B?clZqR1hOQ0Nybm5FMlRBN1d0Yk80YlBCM01aMUZ6T3BkRE1IbVA3YUR3NzJF?=
 =?utf-8?B?Rzl0by9hZnpOSFMyNmFIMUJwR1BFZUtOQmJNSE1KNkY3VkEzWHZseDAzZXhD?=
 =?utf-8?B?MlFJZDlxSWkzbnRTaW1IUFZldGxkbis0eE5MYjM1MDFnRWM4Z2duK3dkZDQx?=
 =?utf-8?B?b2gxQWVjMXNobDc3OUEycVN6aDU4NndmQm9RakdJYVU0bHd6SlljMDc0c256?=
 =?utf-8?B?cVN1UnQvRXhyNEEvMHEzVFBtb0ZtQzYxamtOSnMvY0gva1hCbGdvNlVkZG5M?=
 =?utf-8?B?QVhKMm1RU3VJQXZ1MWxxbTZJMXF5WlowaUNrQVZ3RlpNaENFSUhYclNlTS9j?=
 =?utf-8?B?Rk5raTNyQ0EwN1VSQTErWFlhRE5sSisxSi9Hei92RWhNVXBsN1RlWlZiZFlq?=
 =?utf-8?B?T2ZLSTdNVi9JYTRnRTBDaFhuYXlMTWVZK2FJMFJ2Z1lxSElpajRBSDdiSExG?=
 =?utf-8?B?WlRWZjdnYXp5Z0w0T3lHZzlmNXFEa1UxUE44MkNldFRqZ3JGNEJPeE5UZldp?=
 =?utf-8?B?bGVyQzByV1U3SjBlNnhtODZoTjlsVldHRXV0WVBEc29hc0tCNWJvYTdpNmlY?=
 =?utf-8?B?NS9QTDVWNTJ3YzZGU3VEaDdETXpYd25QelAyY0hXOFZac3grd0JQQ3dwQVNG?=
 =?utf-8?B?SFBUK0syNDl2M2lzUnFaYXIyYXF5Y3lqZEpxQWZ3VjczYVZEc2tDdHAxTlA3?=
 =?utf-8?B?SG5qTUNnZnZJdUI1d0ZhMktIWm1NdXVGYjZmWXZhNVladjYvQ0hUVDk4cSti?=
 =?utf-8?B?ajFIVUgwelJudzJ2UmxVaTRTQkkrOFhnMnpmSnVMT1RTd0NsWDRZNlA0RmZp?=
 =?utf-8?B?TERTMHhBZVdJcTYyRmVrUU9JcU1BUG15aWx5YXEzb2Jubm5sWUViOHM0OTRJ?=
 =?utf-8?B?cGRLZU9LbUJYZ3FERDdJQ0RoMjhFdTU0RHduS3VhWGJKTkdxUnVTS3ZsL1J2?=
 =?utf-8?B?K1dIWjhnQTJYaU8zOVR5cnMyRFFpQjJ6WU9zRkc2SDVLVHhmTFBNQmRJajBy?=
 =?utf-8?B?cTBaeStaOGxUVmRtR2hGOUtKQlVUN1JLR1N5YW1sSUlzbndNemFnU0F2N2Nh?=
 =?utf-8?B?SUowWTR4aGpDVXB5T1VqQVIwQzltTVNFejJkbmhqSHlFUzlEN2JUaFEzWXBD?=
 =?utf-8?B?VFJpZlgxUGd1Y1BpTDRVcnN1b202UUJTb0c2aUhURDAxQ2Nmdjdnc2VsdGQ0?=
 =?utf-8?B?UGx2UnN3WWhCUVpXSFZLajhQSjROMlM2SWxxY1VBTkRzSEJUSHA0ZTUvMzND?=
 =?utf-8?Q?G3kaDKg0/HZXFb/atozQmsE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443e85ec-d25d-4043-9d62-08da00366402
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 12:31:23.6691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc8T1KcvBcBXMay5TWlDVJxqIF8fEBmr6/cc+Ps/bpCAk4Mie+51iA0L7R2soGfjZe1CVVn7RdBaHy7A9FNiMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5298

On 07.03.2022 13:17, Jane Malalane wrote:
> On 04/03/2022 08:17, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 03.03.2022 17:37, Jane Malalane wrote:
>>> On 03/03/2022 11:37, Jan Beulich wrote:
>>>> On 02.03.2022 16:00, Jane Malalane wrote:
>>>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
>>>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
>>>>> and x2apic, on x86 hardware.
>>>>> No such features are currently implemented on AMD hardware.
>>>>>
>>>>> For that purpose, also add an arch-specific "capabilities" parameter
>>>>> to struct xen_sysctl_physinfo.
>>>>>
>>>>> Note that this interface is intended to be compatible with AMD so that
>>>>> AVIC support can be introduced in a future patch. Unlike Intel that
>>>>> has multiple controls for APIC Virtualization, AMD has one global
>>>>> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
>>>>> control cannot be done on a common interface. Therefore, for xAPIC HW
>>>>> assisted virtualization support to be reported, HW must support
>>>>> virtualize_apic_accesses as well as apic_reg_virt.
>>>>
>>>> Okay, here you now describe _what_ is being implemented, but I'm
>>>> afraid it still lacks justification (beyond making this re-usable for
>>>> AVIC, which imo can only be a secondary goal). You actually say ...
> Is the following any better...?
> 
> "Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> and x2apic, on x86 hardware.
> No such features are currently implemented on AMD hardware.
> 
> HW assisted xAPIC virtualization will be reported if HW, at the minimum, 
>   supports virtualize_apic_accesses as this feature alone means that an 
> access to the APIC page will cause an APIC-access VM exit. An 
> APIC-access VM exit provides a VMM with information about the access 
> causing the VM exit, unlike a regular EPT fault, thus simplifying some 
> internal handling.
> 
> HW assisted x2APIC virtualization will be reported if HW supports 
> virtualize_x2apic_mode and, at least, either apic_reg_virt or 
> virtual_intr_delivery. This is due to apic_reg_virt and 
> virtual_intr_delivery preventing a VM exit from occuring or at least 
> replacing a regular EPT fault VM-exit with an APIC-access VM-exit on 
> read and write APIC accesses, respectively.
> This also means that sysctl follows the conditionals in 
> vmx_vlapic_msr_changed().
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Note that this interface is intended to be compatible with AMD so that
> AVIC support can be introduced in a future patch. Unlike Intel that
> has multiple controls for APIC Virtualization, AMD has one global
> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
> control cannot be done on a common interface."

Yes, this looks quite a bit better, thanks. Assuming, of course, it's
in sync with the code in v5 ...

Jan


