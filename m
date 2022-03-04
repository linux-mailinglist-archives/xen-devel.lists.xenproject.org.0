Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7DF4CCFC9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 09:17:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284027.483151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ37r-0000m5-9f; Fri, 04 Mar 2022 08:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284027.483151; Fri, 04 Mar 2022 08:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ37r-0000jO-5y; Fri, 04 Mar 2022 08:17:23 +0000
Received: by outflank-mailman (input) for mailman id 284027;
 Fri, 04 Mar 2022 08:17:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nQ37q-0000jI-4K
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 08:17:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82e3303a-9b93-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 09:17:20 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-Zs2aC_GtO0eqjq-8vJituA-1; Fri, 04 Mar 2022 09:17:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8175.eurprd04.prod.outlook.com (2603:10a6:102:1bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 08:17:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 08:17:16 +0000
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
X-Inumbo-ID: 82e3303a-9b93-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646381839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cH6ZmZMoyiJ6DrZp7awSP7q0QTF/KxA1Ot9DRwO044E=;
	b=k5QCoH4/+IcUmINJ3zmYsZpazB1AfLghpKmKuFDYvlTbEs7v2lki2MI7duKyoxUC2tbRS+
	4kSXEX8oahUBSehqY8hBgBX/y0zWVU4C8Ljaq84MCixDEDX0fZHdwz6FHGsGrKAg6cnSbD
	/4rNpzyQlyUBcPQUqF5A+aj5SigoZSM=
X-MC-Unique: Zs2aC_GtO0eqjq-8vJituA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGRnKricJdArfsbj8H0n76WOxRstbxYkAcAG1zIsCjnWLFWC1jmXAjWw5TkhKZt7dtsERwj3xt9zcHrhnV3qCWYhF+20jSsPexuMNU5OGtPotFtK5iBuOUWRA+x8bI1cPyh+bVoZk59h27o3BcwDTDTPckAQOdLLwG/GGsupyUxhBPZmrWCWdT/iLHAdnqwJatVAspltPzCq63cn5nTf6dwQMmONTNzi81xJhdMMrd97TPs4BcGa7WqXeokAnRiCcOrxi1F/micAAh9aJphCOfr13nkODOaySZ1esF9PAvKt9yS4pZdu/OJPE6qH5TPgfhrOW7JE6FR8KaP+ejmBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH6ZmZMoyiJ6DrZp7awSP7q0QTF/KxA1Ot9DRwO044E=;
 b=m+yOK4Z6oHB0Np0RKtwFeS/XrN5Sn6MGql3nwuoZgmk3VhI7rV3AHByISHYEMNavtaT9MSy0T6vI2uOsGGMn1OAunZzm27bMTMELDGpMRouHyIzatltB2YNtI+lxhsB1wcKJDFp5KX9EG2CgfjUoo0U/fpAXB6OlOx5WUAgZFNV8LDKPz3ahTyMSlfUi346S+cgyXFfoVaIZ0NvyO9WD4Dv4lGFkTk7oY/17FF7JoEoxZz9I7p87py+7QPUQsvXBWji8U/PiF9vY0048b3oCWRnczw5XwEKp9guVRY1xItj/GIKREbeQ2nNLjt3qeQ/ysIvzTwBXbw1dgP3nTUFvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa957ce7-07f8-9726-9537-8b05e9b6d76e@suse.com>
Date: Fri, 4 Mar 2022 09:17:14 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <67296830-aa16-4231-69ba-f07d2b1a4b65@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0030.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0062343e-aa78-44cd-da45-08d9fdb764ec
X-MS-TrafficTypeDiagnostic: PAXPR04MB8175:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8175624F9838B434BB1D155EB3059@PAXPR04MB8175.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DmybQaBpq58HP1Vy1pBsm4LmhQaPaWyrQlUm00xsKLYVUJdI4QQDfg5tryv710xLre0ksbunOKucPPd7FnPRP0XMH2UFU2cCy5eDBfQsDW3GRCwNff+frUpVFcb8xDVLeR5raQZxJO4tkfokTCcqfGAgJH0ErReBIC/AR7JW/HCSrZe3ziVgxAs/VyH1sZMsqQjSByn4rkQxHiQp2gRmcgD6yhN2C1a2vytLFcaoh70ab4sjb76Q1BwWlv1BvlboV6W1y30vRd2IORsxhN6+a1/W9Izd+MylGPxoCKB28bEVqbfLebJtAp8ExVSZ0p/f0rxX6NvpK5Mu1HSCQUmh9LB7eKYudnwRLnj+ziuowagMCeN0gbvkn8SaGA20sKPGKYc3EO2ncyg8Kn+BK/N1sBJwjHQ+vCIzpqiIjvrpyzvxXK3UpYMLomVLLAJ0AmBSp0JCealPVedi38slI1gsUMuemK5PPmqU9MUaiqbnyamuTkXkM8/7xX9l9V+CRhRAlimSQOXMGKzx46O9cw4qu6mY5+mLqdXGxmgBvr+ZYYGz2/E4i0aE68s7Ypjs5gxRJlv04HuXFB+kHemPgys8is8bKGjqBamfpoDTbnVVhvRIq14yA4m1jL/O3Sou6DkHMuuhXZfB1KGnV9ZpCc1K/K4tQ12R8pKvcrMHJjzaEe9XVQU3NW8VR3ecrk2+1pb4djHhJR44MasRzrAbpJTTBUKepQ40qwmy1Mw0xe1WQCI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(83380400001)(7416002)(38100700002)(508600001)(8936002)(8676002)(36756003)(66556008)(66946007)(66476007)(316002)(6486002)(4326008)(31686004)(5660300002)(2906002)(6512007)(2616005)(186003)(31696002)(53546011)(6506007)(26005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VktZdGtXbFZEUi9Rb1ZUZjdONVZBRzl0NkRFL2p2RGhEdlVBaUdEWW5wZkts?=
 =?utf-8?B?NUFQSDdFbDFZeWpzQ2pScnc0R084OEp1ZGxjKzFPbXVQUXcxZFpHVk9lNXUz?=
 =?utf-8?B?Q1ZnYklXWGU4ZTJVdHBtVWcvS3F4K3JuTzVWTm9oNjgrYy95YUZMM2VQSlc5?=
 =?utf-8?B?aFdwUUVLaDZJK2xHSmNPSVN6ak0xTXZtN3JjNTBoT2Z2Y3dJMHVSZmNMTlBK?=
 =?utf-8?B?NFZueEdCajA5Q1FFZlRxcTdLam9mamtoNkFOZkxIczEwZjFkNUg0VWpLNU80?=
 =?utf-8?B?UlZiNlJFdW5IYWhQZkVtY2xrOU5Ma1VVUlhnY25nU2Rkd3A3QkU3bHJaTmsv?=
 =?utf-8?B?NXYxMCs4b3BNakZpTmNxaElHT0NTNVI0dFdaQVo1RHErQjNTRUI1S3pGRzJp?=
 =?utf-8?B?Z3ZFMG1WVWMwRUdUZzBVbU5taHUrMVNjWG1BWTRBQmdtU1lTQldZL1plUGgw?=
 =?utf-8?B?R0tDRHYrbkNzSTdMcm1IclRyRFZFZy9TMmMxQXF5L3FtUDYzbmFNUTM0a2ls?=
 =?utf-8?B?L3g0VjhmNFdlMGJEb0JnVWI0a3AzRnNUZW9TM1JoRGdXaEpxY0FvWWswakMz?=
 =?utf-8?B?OFE0VlJvTjJQWUhiMmpTME0rT2JsU0dRaGhMZTBZdXlaL2pvSUcxb2pVMEtE?=
 =?utf-8?B?UGRRaThQRFkrRzhTMzVMQysxU0o3Z1dVQklHWkNOYXovYzZ0NkVkZk1tVnNh?=
 =?utf-8?B?MUhWeTRBM0hCcGNpdldoTFZCVGkwOVJuZ0p2dWNLRHF5Z0VPa2VhV1ppWlk0?=
 =?utf-8?B?NnJpMnlLNDJZNDl0aU44ZkpqQzZiSUNQOVYxQjcveHNuRUV2OGRtaXpRaGpn?=
 =?utf-8?B?dU05NTBRVjhSV080aFVRZUpPTVNWYXMwT004cGNiOCtFUm1xcWo4K1pYL3ho?=
 =?utf-8?B?YWV3U01pZWVSWlA2L2lLQzJyVDZwYnpLZ0Zwa3NzdDJGR056NUVUMjRXK3FD?=
 =?utf-8?B?eVRtWmRBQzVDSUd0NVVlaVZxMXpQK21JbWJSY2JLM0xJQzl3Qk9hM0lWWVVn?=
 =?utf-8?B?SFF1RmwyNll3ZkxzVmNoL3pEL1RkWTlRajFJakRSVzBxdms0akdlZk0zdDQ2?=
 =?utf-8?B?MkxXT1NWNEowNnhkbmRPTXlteU9JSnEwYVIzVDZpbDdYMmpRZHZlM2RFNENm?=
 =?utf-8?B?cDI1SDFDNXd2L0NsOU5LbmVPTElRbWluRldIN0VnbGx0bWU4OXFjdXpwUHF3?=
 =?utf-8?B?OXJ1MDB2alRqam1pdWEwTjRUU0dYRGxLRWhsYitkUDF0M3BnQklyMXlUdWhX?=
 =?utf-8?B?UkRBbWFtMlBacmdLRytLcDVsbDdUdGF4RUVmM3kxd1IxYXpmQnNxT1RHMUFR?=
 =?utf-8?B?MkM5Y0Y4cGRnTjRnSDZOVDZuM1VKTHE1Y0FET01jNHNYVG0vZWM3TkJJUTBY?=
 =?utf-8?B?bTA0UlgyMXd5aVJmcmYrV1JvNVRKOHNTakd5ZUJYam1kbEhIanpFNFF1SGZ0?=
 =?utf-8?B?RzE2MHJyYk9DcDNuT2FES3NYVUpQd00vS3dHeHBMeXZwSE1PQnl0bmxMYktF?=
 =?utf-8?B?NEVsWGxFeDNJNEM3dVJRc1haS05oWFNTOTNRa3VQaWNpU0NhN3FYbEg1NlpN?=
 =?utf-8?B?RjZOalFtR0ZUbHRoQ0s5K1A4aHpPK2Q0M3F4MzFjS21mTDNEUitYWDJQT2Vn?=
 =?utf-8?B?NkVOUGxZY2xuVlJsTFdRQTMwM29JSElTREZwcll6QWJlNFhVSnAvTTBTMHZL?=
 =?utf-8?B?Y2MvS0QxaTR1ZlRKR2ZkMGNIUlhNUDQ1Ykd5M3dUY3g2QVFLNkNOcTVPNXRa?=
 =?utf-8?B?dWtzczdhcmFXdmNnbWx4bGtGL1dKV0xQTk5UM3MzNjRzVTg4L1E2cjRLRXFQ?=
 =?utf-8?B?ckVXamI2YlljVVNkZVVZSlFzSDlLS3Y3ckZ4TllMQk1DRUdSN2RaTHlZVk1T?=
 =?utf-8?B?b29HU1VKWDQ1MnV1bVROclM2M2JTZmdkbENVd3NPbktVQzBjZlpod0ZwVXRj?=
 =?utf-8?B?UHkxd29YZWNvM2p1UDcwRXBTbDEzWVRndklWTzFXc1Y4Tk1TTzQ0SGg5VHpL?=
 =?utf-8?B?TnpWeU1DZWxHQjVYU3VxTkhMUWJGQ1E5aXkrUllyZS80N0tMSVBycjYvZVZD?=
 =?utf-8?B?ZUgvQWpNMEFzR3hnQkRMSGJiWXhDaTR2SGJwWXFqQkpGTFd4NE9OM1RKeEEr?=
 =?utf-8?B?MjBmRFMwTkpEeWIxVzhYMzRKRk1GUm91RE96ekxscDM4QUJ3RU43dVNNZEZS?=
 =?utf-8?Q?h/U8do48YsuHq3PHTd+v7zA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0062343e-aa78-44cd-da45-08d9fdb764ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 08:17:16.5128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oz8LoUbEO9fTjBNi1bkWeeCGGBxUIYdI8g3LvVyGdZIH0Oby1HGfsP4Kq7MK2ADMFiRuW2n5h3Dhj47fLmQXUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8175

On 03.03.2022 17:37, Jane Malalane wrote:
> On 03/03/2022 11:37, Jan Beulich wrote:
>> On 02.03.2022 16:00, Jane Malalane wrote:
>>> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
>>> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
>>> and x2apic, on x86 hardware.
>>> No such features are currently implemented on AMD hardware.
>>>
>>> For that purpose, also add an arch-specific "capabilities" parameter
>>> to struct xen_sysctl_physinfo.
>>>
>>> Note that this interface is intended to be compatible with AMD so that
>>> AVIC support can be introduced in a future patch. Unlike Intel that
>>> has multiple controls for APIC Virtualization, AMD has one global
>>> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
>>> control cannot be done on a common interface. Therefore, for xAPIC HW
>>> assisted virtualization support to be reported, HW must support
>>> virtualize_apic_accesses as well as apic_reg_virt.
>>
>> Okay, here you now describe _what_ is being implemented, but I'm
>> afraid it still lacks justification (beyond making this re-usable for
>> AVIC, which imo can only be a secondary goal). You actually say ...
>>
>>> For x2APIC HW
>>> assisted virtualization reporting, virtualize_x2apic_mode must be
>>> supported alongside apic_reg_virt and virtual_intr_delivery.
>>>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
>>>
>>> v4:
>>>   * Fallback to the original v2/v1 conditions for setting
>>>     assisted_xapic_available and assisted_x2apic_available so that in
>>>     the future APIC virtualization can be exposed on AMD hardware
>>>     since fine-graining of "AVIC" is not supported, i.e., AMD solely
>>>     uses "AVIC Enable". This also means that sysctl mimics what's
>>>     exposed in CPUID.
>>
>> ... more here: You claim similarity with CPUID. That's a possible route,
>> but we need to be clear that these CPUID flags are optimization hints
>> for the guest to use, while the new control is intended to be a functional
>> one. Hence it's not obvious that CPUID wants following, and not instead
>> the conditionals used in vmx_vlapic_msr_changed() (or yet something else).
>>
>> What's worse though: What you say is true for x2APIC, but not for xAPIC.
>> Which effectively is in line with vmx_vlapic_msr_changed() and CPUID
>> handling also agreeing as far as x2APIC is concerned, but disagreeing on
>> the xAPIC side. I can only once again try to express that it may well be
>> that pre-existing code wants adjusting before actually making the changes
>> you're after.
> 
> 
> I've been thinking about this. Considering what you say, I propose:
> 
> - having assisted_x2apic_available = cpu_has_vmx_virtualize_x2apic_mode 
> && (cpu_has_vmx_apic_reg_virt || cpu_has_vmx_virtual_intr_delivery). 
> This would mean that on Intel CPUs has_assisted_x2apic==1 would signify 
> that there is at least "some" assistance*, whereas on AMD it would 
> signify that there is full assistance (assistance here meaning no VM-exits).
> * apic_reg_virt prevents VM exits on execution of RDMSR and 
> virtual_intr_delivery prevents VM exits on execution of RDMSR, from what 
> I've gathered.

I agree with this part of the plan.

> - having assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses 
> && cpu_has_vmx_apic_reg_virt because apic_reg_virt is neccessary for 
> "any" assistance.

Not exactly, aiui: cpu_has_vmx_virtualize_apic_accesses alone is beneficial
because a separate VM exit is then used, simplifying some internal handling.
There might actually be room for improvement in our handling of this, as we
presently use the exit qualification only to accelerate EOI writes.

> - Currently, the code only sets SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE if 
> "some" assistance is guaranteed but sets 
> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES even if no assistance is 
> guaranteed. So the adjustment to the pre-existing code that I propose is
> adding cpu_has_vmx_apic_reg_virt to the initial check in 
> vmx_vlapic_msr_changed():
> 
>   void vmx_vlapic_msr_changed(struct vcpu *v)
>   {
>       int virtualize_x2apic_mode;
>       struct vlapic *vlapic = vcpu_vlapic(v);
>       unsigned int msr;
> 
>       virtualize_x2apic_mode = ((cpu_has_vmx_apic_reg_virt ||
>                                  cpu_has_vmx_virtual_intr_delivery) &&
>                                 cpu_has_vmx_virtualize_x2apic_mode);
> 
>       if ( !cpu_has_vmx_virtualize_apic_accesses &&
> +         !cpu_has_vmx_apic_reg_virt &&
>            !virtualize_x2apic_mode )
>           return;

I'd suggest the opposite for the xAPIC case: Leave the condition here
unchanged, but consider tightening the condition for the CPUID flag.
That'll bring xAPIC handling more in line with x2APIC one.

> which would then eventually just be what I currently have:
> +    if ( !has_assisted_xapic(v->domain) &&
> +         !has_assisted_x2apic(v->domain) )
>           return;

Yes, the eventual form is expected in any event.

Jan

> So, essentially, the only difference from v4 would be 
> assisted_x2apic_available = (cpu_has_vmx_virtualize_x2apic_mode &&
> 	  	             (cpu_has_vmx_apic_reg_virt ||
> 			      cpu_has_vmx_virtual_intr_delivery));	
> 
> sysctl would now coincide with CPUID for xAPIC but not x2APIC (for CPUID 
> the condition is the AND of all features unlike the 
> assisted_x2apic_available proposed). IOW, it would follow the 
> conditionals used in vmx_vlapic_msr_changed(), if we take the change to 
> vmx_vlapic_msr_changed() above.
> 
> Thank you,
> 
> Jane.


