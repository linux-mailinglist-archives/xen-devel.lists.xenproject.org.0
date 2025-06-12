Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1BAD788D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 18:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013334.1391829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPlE7-0002kM-P6; Thu, 12 Jun 2025 16:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013334.1391829; Thu, 12 Jun 2025 16:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPlE7-0002ho-LR; Thu, 12 Jun 2025 16:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1013334;
 Thu, 12 Jun 2025 16:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQ89=Y3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uPlE6-0002hi-GV
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 16:56:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061a.outbound.protection.outlook.com
 [2a01:111:f403:200a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2dc05c39-47ae-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 18:56:28 +0200 (CEST)
Received: from SN7PR04CA0212.namprd04.prod.outlook.com (2603:10b6:806:127::7)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Thu, 12 Jun
 2025 16:56:24 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::8c) by SN7PR04CA0212.outlook.office365.com
 (2603:10b6:806:127::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 12 Jun 2025 16:56:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 16:56:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 11:56:23 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Jun 2025 11:56:22 -0500
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
X-Inumbo-ID: 2dc05c39-47ae-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnTMNTZIyN8QQxayumQHvzsyuijqU5aJ/NaldaWjzN1+FQ5dHJsy3M7UxjNrecZ9m764xkdJtWbOpyAJf9xdxfYEnDfDYEK2wCioCi4CW4pq+X681rJk7WIUpXIHhSyci9NyyusrtTC4jOufA0m2zuLJJrX/4NtdYgfSsozz55o1CM1kEnrMWKI5nMbzm5R3t28sZh03cM9oselItO6v87c46RjXjgK9Brv8xWcmkCLeoVpMSfj/UJG12TcMKVuIkVsP4wiUgVXwuyYhw28mb55FiC/RBH1S6yV6t8wfkNb74DfywMFxHy3DQsjEteq66joYFNpbS+F+AArudR9GjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=leRWLVjzsKU2O6tCXhkjvpo/hHO6YRZ4WxaHMexTVHc=;
 b=v+EN6DVLj79rRHd0E3GAvHrC07+pObX8TwQjd8P8kStPmOmAqICXWEv+5uiv8j4sx37+hLuo89df9gpJhVVbe40D2VvDAhkvBp+TAt1dfgQ9V7GhSpmBLrBVs5MmFr6tvsYI0hCGcbfBuQpu8GHgYeDHYdNkXMGwdOUeMmNnT3kseCuOP2KHnmveZ7ZhllcuECGQEJ3EohSAo5Rt+deW5SbaOXCqRNJashbW2Am9UvOSyjSc0rrtKKdCiSfaWK1er5G8tvlcfmCsgtWPEGLe4aZMk/19HYybfZlaiamWy68l6kWBTs/1oYt3ZAweKONCc8zIhsWFwbj2dbMTqaS70Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leRWLVjzsKU2O6tCXhkjvpo/hHO6YRZ4WxaHMexTVHc=;
 b=A32fCPcH84tB5uHpgmbEkZIah+Lh2lsDvhCfRWGbzr71eTMkI0RKE13YtY17vm7FiyXeX3Z85QiTusWjjPZojhkLdL8zeX13sPm3wN6L75RWGN1upmlP2yDoN2lTMb4O82c+ydbVR145APXDMIn53RORUy44Fxzh29NO4K7zwEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <fc719213-3ac4-4f3a-ab20-47b2170b2a1f@amd.com>
Date: Thu, 12 Jun 2025 12:56:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xsm/silo: Support hwdom/control domains
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-3-jason.andryuk@amd.com>
 <0f47268e-0674-46e7-bfd4-8a395ee1ddf6@suse.com>
 <6cc69b45-7347-4250-ab32-a1e2857b7d23@amd.com>
 <805abeee-0cad-4cc9-88ae-77e4c1e23fac@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <805abeee-0cad-4cc9-88ae-77e4c1e23fac@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: 76656a4f-f72d-499e-d158-08dda9d21062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUhKNFE2SEV6SDcwMXNBNmF0WTNJSFo2b0gxSTdhRE1xeG9ydmdoNlJGLytL?=
 =?utf-8?B?SHd2L29FYzRBTU1VNDltdDVlSUVLYW9KMFI2VjlVR1lPcXBCQURnWUpubkg4?=
 =?utf-8?B?VjhTZ2F5K3ZabDUzTkE2VGg3TTk0RGlJNWQ4OW0raVUwNXp3Yko5blRRQVBM?=
 =?utf-8?B?N2c3WnYza0VWZ0pNajhFR1huYjJiUHl0dGNyZUtueDMxRnF5ekhMM3YvNTgx?=
 =?utf-8?B?a2hrWXkrTWE1NmhzNi9UaTFMaDVyM0JaWFVLN01VbEgwR1EyY1QxU1BYRXU5?=
 =?utf-8?B?VjZNMWNpaHlXaDg3Ty8zeXlQU0gwV1RUSDU3VmxSVTkxakYzZ3I4ZlA0VU1V?=
 =?utf-8?B?MnZhcGZROUZyaEpOWXNZck1UcWQxMUdrNUh3S3VKNVZ4dHRhOG44cThKMXlv?=
 =?utf-8?B?dDVWVHI1TUVwQlFoV3FmMmtxSTJNTFdGcy82amJLaDdnY09uakhaQmY0dmxY?=
 =?utf-8?B?TXJhd09lbU1DbmNJOEVsdWZ1c3Jjc2VJSlJub1pGc2haRzVsRGJyR2JJc0c2?=
 =?utf-8?B?djRXeXZZdUNFc2V1NHF0UzlkdWYwOW9rc2hMSE5vMFlFRjF6V01pY2ZzK3dR?=
 =?utf-8?B?dm5TWGcrelJjNG1kS1NOMzV4R3ZzcTV1Y3dsSUFZSlUxdXJTMUV5WjJwQ3Zk?=
 =?utf-8?B?SVo4cDFybVFQUlpZcS9TV05oUmViQ2pSejV2ejVWZ3Y4YW1Ta3ZtWEhraEVI?=
 =?utf-8?B?MnBIN0dHVFdzcTFZamJ5RVZwRVhkSmNrTkVpOTlQazRyV2VIMEZKSUQ1OUkw?=
 =?utf-8?B?TXdwcXp0SXIzLzhBa2lIczNLNFlJOGVGd0ZwMWsyNlkrbngyWFN0cUdGQWtL?=
 =?utf-8?B?Qi93LzIwaFBiTmlsNnZDRFc4QXFKd2RwNTVsR3BwYnhPNmk1NlZoNm84Y2NX?=
 =?utf-8?B?N2VpWmI5ZklBcG9aby9odFFKVGtIeU1mZjNQT1Z0b3F1MXZTSGVBZ3FLOWh5?=
 =?utf-8?B?dDFKbmZkbm8zQW54ejREUmsxVXZRcjdaSTVURlg0WmVhYmRUditCeDN0NGFr?=
 =?utf-8?B?T3FLUjk0NmxXNmo5UWhFcEN1TUFwRmRIRkVCWTVQcnozRTJTQmtpem9Udjkz?=
 =?utf-8?B?aG1uRUhtUWluQU1TSGNrWWZnZjlRb3RQdFljMzY1bVZWcmo5di9NZG5UYWNn?=
 =?utf-8?B?MzBLSWxNdTA1dEQ4MjVrY3BJTzRFRmRYTFErUDdqV2p3aWNKVHVYY2xjMjNq?=
 =?utf-8?B?eWg5czRDYUpvclhCenc5akJOb0hnYlpTd0UyMWRaNUs4cVU4S09vQXM0b0Fr?=
 =?utf-8?B?SDlnYkYwa2d5ZzN1dDJESnpESU95ZHdUK05aOWk2YkdSa2dsVHBaWXZtVEVB?=
 =?utf-8?B?WUVtVnBPbEJyTy9QSXFBWEphK2g5V0xwbHFCTExvR1gxVDBHTFdhbFpnZXlX?=
 =?utf-8?B?NVk2VzluMXg3TSsvVHIvRHJTVzlRMmhab2dpMjVzZ1AvWG9uQk1QbzBUZU5n?=
 =?utf-8?B?LzJJU25aL2s3cm94WEF1Z0lTcUVMMmF6aXNZN0xQVW0vd2JILzhSNmhEbE8v?=
 =?utf-8?B?ZFpUeFl6WlU1T2ZLVkVObGxTVEI0eVBvd0xqUmtqaC85VGw0NlBvdFVyWktC?=
 =?utf-8?B?UjJmMDZxckcyazFFTUhMSFYyYWVxVjhablhoNU1saHdJYUF2N3ltS21EaGZD?=
 =?utf-8?B?NFAwajBpbU1McE1Vck9rY0R1b1dkQ2c1MmljaEhiUzBaK3VScGxYUUpOSWt6?=
 =?utf-8?B?T2JHTEtSQVdvOUtGd1FzcmVjZmRDMlAzdWJpZSthVWw4SzdSSjYzTTdZWXpl?=
 =?utf-8?B?bit2aHBMZEhEbG8zWTdmVXJWRU5Nd0lnYzJva3NCV0hVWncxN29iTGUwNEY4?=
 =?utf-8?B?THA4QjdZQys2MVE4bi83YTJTTnFqZjFrUFkyRm9uZlBvdUxHR3ZSYUlDVTRl?=
 =?utf-8?B?UEt2WWw0cHBpT0cxdW1BSnhvMHVXUXQ4MUk4SXJsWmFjZUpVMUEwS0d0V1du?=
 =?utf-8?B?UHBWWnFlWDVsdzZoV1dTZEtGcGVRMU5jaXQyMzFML2k4NnViZGZHZWM5Qzlv?=
 =?utf-8?B?aVFNWDdOZ0I5MXlBL2RKdngzWGtBbVFvSlN1ejNIMXFQZXJHd1FBdHl4VWsr?=
 =?utf-8?Q?HlyZqv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 16:56:23.8946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76656a4f-f72d-499e-d158-08dda9d21062
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247

On 2025-06-12 03:52, Jan Beulich wrote:
> On 11.06.2025 06:20, Jason Andryuk wrote:
>> On 2025-06-11 09:17, Jan Beulich wrote:
>>> On 11.06.2025 00:57, Jason Andryuk wrote:
>>>> In a disaggregated environment, dom0 is split into Control, Hardware,
>>>> and Xenstore domains, along with domUs.  The is_control_domain() check
>>>> is not sufficient to handle all these cases.  Add is_priv_domain() to
>>>> support allowing for the various domains.
>>>>
>>>> The purpose of SILO mode is to prevent domUs from interacting with each
>>>> other.  But dom0 was allowed to communicate with domUs to provide
>>>> services.  As the disaggregation of dom0, Control, Hardware and Xenstore
>>>> are all service domains that need to communicate with other domains.
>>>>
>>>> To provide xenstore connections, the Xenstore domain must be allowed to
>>>> connect via grants and event channels.  Xenstore domain must also be
>>>> allowed to connect to Control and Hardware to provide xenstore to them.
>>>
>>> Are you suggesting that SILO at present is incompatible with a Xenstore
>>> domain? silo_mode_dom_check() in its original form has no special
>>> precautions, after all.
>>
>> Yes, it is incompatible with the current silo_mode_dom_check().  Only
>> Control domain is allowed to use grants and event channels with a domU.
>> A Xenstore domain would be denied.
>>
>> Xenstore stubdom only exists for x86 today.  My limited attempts to run
>> xenstored in an dedicated Xenstore ARM Linux domain have failed.
> 
> This may want sorting independently first. Once sorted, the requirements
> here may become more clear.

HW+XS-> xenstore works
CTL+XS or XS -> the domain's console just stops.  vCPUs are in Linux cpu 
idle.  I haven't figured out more.  This required some Linux changes to 
query the capabilities since XS isn't exposed and ARM assumes initial 
domain implies HW + CTL.  It's orthogonal to my goals, so I haven't 
looked too hard.

>>>> Hardware domain will provide PV devices to domains, so it must be
>>>> allowed to connect to domains.
>>>
>>> As a built-in policy, isn't this already going too far? There could
>>> conceivably be configurations with only pass-through devices in use, in
>>> which case neither grants nor the event channels operations intercepted
>>> by SILO would be required.
>>
>> Such a domain wouldn't have any PV devices configured?
> 
> Indeed, that's my point: Why would Hardware then have a need to be
> allowed to connect to domains.
> 
>>   I don't think this changes anything compared to today.
> 
> I don't think I see what you mean to tell me with this. What we're
> discussing here is the effect of the separation you're suggesting,
> which necessarily is different from what we have today.
>
>> Both sides need to be configured and opt-in.  Hardware is a system
>> domain, so it should be possible to allow grants and event channels.
>> But they won't be used unless configured.
> 
> "Won't be used" isn't enough, imo. Isn't disaggregation about proper
> isolation, i.e. to guarantee that unwanted interactions can't occur?

Disaggregation is the separation of components.  The security policy 
applied is related but distinct.

"Won't be used" is how dummy and SILO (with respect to dom0) devices 
work today

dummy -> cooperating domUs can communicate
SILO  -> domUs cannot communicate
Flask -> configurable, but typically strict limits to explicit 
communication channels

SILO today doesn't deny communication between a domU without PV devices 
and dom0 - they just aren't configured.  I'm saying that would be the 
same with a split hardware domain.  PV devices just aren't configured, 
but there is no mandatory denial.  SILO only enforces mandatory denial 
between domUs today.

If you want mandatory enforcement, Flask is the correct choice. 
Everything would be explicitly configured.  Some domains could 
communicate with hwdom and others could not.

For SILO, a split hardware domain would be allowed communication with a 
domU if configured by the administrator.  I see this as comparable to 
configuring a domU to access dom0 PV backends today.

>>>> That leaves Control.  Xenstore and Hardware would already allow access
>>>> to Control, so it can obtain services that way.  Control should be
>>>> "privileged", which would mean it can make the connections.  But with
>>>> Xenstore and Hardware providing their services to domUs, there may not
>>>> be a reason to allow Control to use grants or event channels with domUs.
>>>> Still, Control is privileged, so it should be allowed to do something if
>>>> it chooses.  Establishing a grant, or event channel requires action on
>>>> both sides, so allow for the possibility.  This does open up an argo
>>>> wildcard ring from domUs, FWIW.
>>>
>>> Along the lines of my reply to patch 1, I think Hardware and Control
>>> need to have a pretty strong boundary between them. It's hard to see,
>>> for example, whether grant map/copy/transfer would indeed make sense
>>> between the two.
>>
>> The Hardware domain might provide a PV device to Control?
>>
>> I've tested removing control:
>> static bool is_priv_domain(const struct domain *d)
>> {
>>       return is_xenstore_domain(d) || is_hardware_domain(d);
>> }
>>
>> And that works in my limited ARM dom0less testing.  The toolstack isn't
>> really exercised in that case.  It seems strange that the privileged
>> control domain is *not* allowed though.
> 
> With the intended separation, there's (imo) not going to be any
> all-mighty domain anymore. Neither Hardware nor Control.
> 
>>> Similarly I'm not convinced a strong boundary isn't also needed
>>> between Xenstore and Hardware.
>>
>> If hardware is providing PV devices to domains, it will need access to
>> Xenstore.  I don't see how you can get around it.
>>
>> I tried to explain this in the first paragraph.  SILO's purpose was to
>> isolate domUs from each other, but allow it to access dom0.  dom0
>> embodies the control, hardware, and xenstore capabilities.  So as a
>> first approximation, each of Control, Hardware, and Xenstore should be
>> allowed to communicate with domUs.
> 
> Yes. Yet what to permit between the three special entities is far less
> clear. Hence why I'm unconvinced this can be expressed by SILO, and
> would rather require Flask.
> 
>> domUs needs to communicate with Xenstore and Hardware for PV devices.
>>
>> Xenstore provides Xenstore access to Hardware.
>>
>> Control would want Xenstore access.
>>
>> I don't know if this helps, but here's a table:
>>
>>       | CTL | HW  | XS  | domU
>> ----------------------------
>> CTL |     |  ?  |  y  |  ?
>> HW  |  ?  |     |  y  |  y
>> XS  |  y  |  y  |     |  y
>> domU|  ?  |  y  |  y  |  x
>>
>> Control and Hardware would be y if we allow PV devices
>>
>> Control and domUs - I don't have an immediate rational for them.  Except
>> that Control is privileged.  I've been running xenconsoled in Hardware.
>> If xenconsoled is in Control, then access would be required.
> 
> Perhaps some clarification is first need about what Control really is
> (and is not). It is sole the domain to create other domains. But beyond
> that things become unclear. E.g. xenconsoled may not belong into either
> Hardware or Control.
> 
>>>> --- a/xen/xsm/silo.c
>>>> +++ b/xen/xsm/silo.c
>>>> @@ -20,6 +20,12 @@
>>>>    #define XSM_NO_WRAPPERS
>>>>    #include <xsm/dummy.h>
>>>>    
>>>> +static bool is_priv_domain(const struct domain *d)
>>>> +{
>>>> +    return is_xenstore_domain(d) || is_hardware_domain(d) ||
>>>> +           is_control_domain(d);
>>>> +}
>>>
>>> This construct expands to two evaluate_nospec(), which likely isn't
>>> wanted. Some open-coding may be pretty much unavoidable here.
>>
>> Thanks, yes, good point.
>>
>>> (I'm
>>> surprised it's not three, i.e. I find it odd that is_xenstore_domain()
>>> doesn't also use that guard.)
>>
>> It looks okay to me.  There were only 2 uses until I added a 3rd in the
>> dom0less code.  The XSM check has evaluate_nospec() and the other 2 uses
>> aren't security critical - Setting a domain info flag, and __init code
>> for dom0less.  Maybe moving the evaluate_nospec() would be safer in case
>> use grows in the future, but it looks okay to me today.
> 
> When some of the hardening was first introduced, actual use sites were
> indeed taken into account. That wasn't quite right though, I think. Any
> such construct ought to be safe to use anywhere. For uses with clearly
> no concerns towards speculative abuse, a 2nd lightweight form of such
> constructs should then exist, imo. As to your use of "security critical":
> I'm not convinced you what mean is covering the potential of speculative
> abuse of involved code paths.

I can't parse this last sentence, and I think it's your main point.

XSM -> don't speculate around permission checks.  That's what I meant by 
"security critical".

The __init code is inaccessible to users, so it doesn't matter.

         if ( is_xenstore_domain(d) )
             continue;

getdomaininfo sets a flag, so I don't see this making a security 
difference.  It's not controlling loads or code paths.

(is_xenstore_domain(d)          ? XEN_DOMINF_xs_domain : 0) |

Regards,
Jason

