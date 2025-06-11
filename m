Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B27AD5CC2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011942.1390459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPOnQ-0006m5-Sp; Wed, 11 Jun 2025 16:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011942.1390459; Wed, 11 Jun 2025 16:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPOnQ-0006ji-PW; Wed, 11 Jun 2025 16:59:28 +0000
Received: by outflank-mailman (input) for mailman id 1011942;
 Wed, 11 Jun 2025 16:59:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uPOnO-0006jc-GJ
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 16:59:26 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2416::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cb229f8-46e5-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 18:59:23 +0200 (CEST)
Received: from CH5P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::16)
 by PH0PR12MB8100.namprd12.prod.outlook.com (2603:10b6:510:29b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 16:59:19 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::79) by CH5P221CA0012.outlook.office365.com
 (2603:10b6:610:1f2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 16:59:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 16:59:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 11:59:18 -0500
Received: from [172.27.195.250] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 11:59:18 -0500
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
X-Inumbo-ID: 6cb229f8-46e5-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAet4mpyhMv8ZvNaToqj2QQtkgHDPf/5bahJ5TEA/mz4DA7+oYeHmV7ecbomaBnKq8cqCsukWTN/T5tliN0qD4EkqylY78gNMQmCkEXkNgcI3otFEeHO61HEonxDzT6CcWMLIcHj5U5iQeF2I5ec7dFtilSLLmI7Xi1NYW0tfaMwlKvoBKKLVTLEI5PWTcuenaEQsMRhShawEA9/erqgPWhwyTxZuxiD+LU3AN0VhWG9ZhbWckauBsDd+kUsdrmzFstEqH3b5WGAxZ4sptpYeze4wOWEzBtcPXy823No5yAmFJBxAVKKSh6l4R06bdtUvRBXrmWrNfn8bU3s+Hk5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNAsJZS8YQmk9IWUY3R/H/m7OaIgYl3mYOwfCK6EU4Y=;
 b=EOpNFjYACjWSM8WvMr0ALyHfDfgrAZQ4WqTSOLL0A1mVlO7cOEMjTA7FkpSQWQX5rzHh1ssDo5lzmzPNwc6POxkBqkmkIo5uIFcV+R4jIChuB/Kb257uexEHF/ojWs3oa3EMAjDpcIQldHGNeix83Mc64rBECqiH/uLdQ1HaHioD8071O+vmhE8MA2s5JAySx+GG+3AapMYpf89UvP2ZdeMJVBbNgcptChovoF2feWxnQ/oZeuSNN7g5bFtvFlTYez0wAGUpODBwcynvLgQJPNOcWnyokclyvhbb7IFYHdf7wHBe3XKuPv7frmNWoI7eny4Y2R3n6bPdB8++S59P2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNAsJZS8YQmk9IWUY3R/H/m7OaIgYl3mYOwfCK6EU4Y=;
 b=1FlQx0eIAr1cUpGWFZag1hxx9gtLAG2TImlvY35pkqwa3Y1xG8IXXF4qqVNco+nhXBjyW4Ilmeom0IVRW9UBP6PJMOveFC/UI2H4KBtXW0G9nOc5Y1FbKFKVw90EmciI1lpbVLy969vtv/c0gMHXzfnDCK3HnhEmYWAVNWABdeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <6cc69b45-7347-4250-ab32-a1e2857b7d23@amd.com>
Date: Wed, 11 Jun 2025 00:20:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xsm/silo: Support hwdom/control domains
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-3-jason.andryuk@amd.com>
 <0f47268e-0674-46e7-bfd4-8a395ee1ddf6@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <0f47268e-0674-46e7-bfd4-8a395ee1ddf6@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|PH0PR12MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe967d8-58a8-4916-71cf-08dda9094e45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnlqNlNjZVUzZTFQdSthNmVvb2V6V2NXd1Q1THFyN2R0MzhBelNEZllvNUFT?=
 =?utf-8?B?aW8rSGczK01obmk3OW1tVUkyNjRXZkxLK0pYenFvL21FRFdPUzlCbVlDRnZX?=
 =?utf-8?B?U0cwNnluRHpLS2RyWkRxdHZJbloxRjJub2Y2Q1pPckZoYkM0SkhWWlNiVzBQ?=
 =?utf-8?B?b3FzTWsydFBFbnJ3U1lDZmxMU2g3c1ByWUppdnprQXBsQVJGTTFDYTRJSGFH?=
 =?utf-8?B?VU1LdWVJWGhPVmpNZEJJTXVqUzRFSTF6VEliSjJ2Q2xJc1I5WEJxMkoreUJE?=
 =?utf-8?B?RWZ4dDdPK1duTG9mWlcySEpNMlgrWkp5NDZBV0gxd0g4UnUzWXQ1eERMYVpv?=
 =?utf-8?B?NFBzNlNpSHZrSm8yK0g1VkprTnR5SkpzN2tGNEE5SVVWamxRc0owajQvcUNo?=
 =?utf-8?B?blR5WHFjQXBSNWY2MFZRek9ZQWFJMXpXdCtvL0FXd3hkK3c5Y1J2UnZQRi9l?=
 =?utf-8?B?ZTJTYnVTZFp4VWVlQXBRSU9iVklXK0UrV3NsN3l2UWpPcUk5MnpHOXRmSDdl?=
 =?utf-8?B?U2F2VDgxU0NMcVMxRSs0ZC9SOTk5L3pITEtYanBOZE9UUG5tZEdxam9jYWwz?=
 =?utf-8?B?V3lpaFdnY2wwUjFjV3dCcjZNZkFHVytYMHBmVXgzVElpRVY4dnV3YmRoNXlY?=
 =?utf-8?B?blN0K3FUbmYwR2FJTThzMDlWN0p1NzFNbnc0cGNyR0VqRStMaGhpeUxMTmlO?=
 =?utf-8?B?ekJSaU1lR01HZkk0Mzk0TGN2dHR3TGlzWGZyMW84RFliNmR5YmliVWRwQVV4?=
 =?utf-8?B?dHFOTTQzOGE5b3ZCaU5JYlNRQzRCaTJxaXJzRDFzQzhHNzA2MzVHQWxCbFd0?=
 =?utf-8?B?RTM3MGJJbGd3RlYyVFpIcGgrWE5sT2pWODlabGRwemt4ZElDcnJPUi9XN3N1?=
 =?utf-8?B?WFdDamxnVmUyK0lQcjEwaWUwYk91VkNZK0dWMXM4V1NvNzJPZmR5WmJIczdN?=
 =?utf-8?B?V214dDVzL2ZHYWhsZlNnRlh3S29xWXVTZG1CYWh0bjVxd3E4azBkeUFjQ2pR?=
 =?utf-8?B?aGxaUDNFVUI0d3dtUEdLWmFvSkJvWWY1bzdvK3ZKMlBMM3E2YXBSSjVvcGwr?=
 =?utf-8?B?VUFmS09FbVhjeGpMRzhuN01ST3F0aHVPVnZTQmFwdXg3SVNHUGNiUHkrVHZz?=
 =?utf-8?B?bm9sWXhSWlN3V2VKOVF6WG4zZDkyNndXUXhJRVVQTEpFb3lqa0ZhOWw3RDJx?=
 =?utf-8?B?aEQ0Z0wvc3NkektoaGJ6L2QrcDhscnlUZ1ByK1ZRWXNaSlRHclJBcGNFR0g1?=
 =?utf-8?B?bE5pamZIblBIakFnOW5KM21Tb1liZFUweHQvb3RMbk9DajYxbVdVVmkzRmcz?=
 =?utf-8?B?S1cwcElwL3VQNituc2FRY0hhd2NUMWJtOEQzbkZEWDdXZFY5c3AwdmROd1d4?=
 =?utf-8?B?dCtFbHdoWmNubXFJbW5qclpkRVZ2KzBiRFFOSXdDOEpxaTJNRjk3YytGeUts?=
 =?utf-8?B?SUZPcWZCSW1SUW9BSm5RRjlxMkE4azF3SnV0SWgyenpGcEYyamNGSGRlUUdn?=
 =?utf-8?B?NmNReUUyQkxaQjh0ZDVCSzE5MGIvRk9KZ3V5b0prV3RraGxOMGdOeGNtTVRa?=
 =?utf-8?B?dk9OelVRWkhpclg2UzY0RmxKb253ejRLRXEvNWJBZzc4dTFwUWZVQjZUQ1J2?=
 =?utf-8?B?bk9IZzdudVZqUHoxRVpSbFlRb1doUzU4Sk1LWkJJS1RWa3djMFVWVThuSjN4?=
 =?utf-8?B?MWkvN2FGL0NqbHpSUXdiU3ZPTzBnSTlzS2E5YnhJcGxuMldHMnM3OTBUQUN0?=
 =?utf-8?B?cExlMFBPaUYvdUl2bEE0ejZxZm9JcHNWOXREU2UxdWhIYVBhaUdjOWFjREVp?=
 =?utf-8?B?WnAxMC9zL2pRQVo4ek43KzZ3QlFBWFE0UjluR2p6N0w1bmFyZDlMUFA1dlBM?=
 =?utf-8?B?SnIxS0FVbis1OTdSV3BXdGNNdDRJQ1dpVWtQTm1jT0lma3lEbldhclpML3JD?=
 =?utf-8?B?WGxJallKaVlGRFk3STVTcUdvYkNnM1k5VUlOdjVyaXIxdWduemlrV1VxTUkx?=
 =?utf-8?B?aUtPaTB2QXVMQ0xVWWNpVU5LdGE5SWFXS3hjamswUjRMS2lHU1hqcUlta3pJ?=
 =?utf-8?Q?JZLQly?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 16:59:18.8900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe967d8-58a8-4916-71cf-08dda9094e45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8100

On 2025-06-11 09:17, Jan Beulich wrote:
> On 11.06.2025 00:57, Jason Andryuk wrote:
>> In a disaggregated environment, dom0 is split into Control, Hardware,
>> and Xenstore domains, along with domUs.  The is_control_domain() check
>> is not sufficient to handle all these cases.  Add is_priv_domain() to
>> support allowing for the various domains.
>>
>> The purpose of SILO mode is to prevent domUs from interacting with each
>> other.  But dom0 was allowed to communicate with domUs to provide
>> services.  As the disaggregation of dom0, Control, Hardware and Xenstore
>> are all service domains that need to communicate with other domains.
>>
>> To provide xenstore connections, the Xenstore domain must be allowed to
>> connect via grants and event channels.  Xenstore domain must also be
>> allowed to connect to Control and Hardware to provide xenstore to them.
> 
> Are you suggesting that SILO at present is incompatible with a Xenstore
> domain? silo_mode_dom_check() in its original form has no special
> precautions, after all.

Yes, it is incompatible with the current silo_mode_dom_check().  Only 
Control domain is allowed to use grants and event channels with a domU. 
A Xenstore domain would be denied.

Xenstore stubdom only exists for x86 today.  My limited attempts to run 
xenstored in an dedicated Xenstore ARM Linux domain have failed.

>> Hardware domain will provide PV devices to domains, so it must be
>> allowed to connect to domains.
> 
> As a built-in policy, isn't this already going too far? There could
> conceivably be configurations with only pass-through devices in use, in
> which case neither grants nor the event channels operations intercepted
> by SILO would be required.

Such a domain wouldn't have any PV devices configured?  I don't think 
this changes anything compared to today.

Both sides need to be configured and opt-in.  Hardware is a system 
domain, so it should be possible to allow grants and event channels. 
But they won't be used unless configured.

>> That leaves Control.  Xenstore and Hardware would already allow access
>> to Control, so it can obtain services that way.  Control should be
>> "privileged", which would mean it can make the connections.  But with
>> Xenstore and Hardware providing their services to domUs, there may not
>> be a reason to allow Control to use grants or event channels with domUs.
>> Still, Control is privileged, so it should be allowed to do something if
>> it chooses.  Establishing a grant, or event channel requires action on
>> both sides, so allow for the possibility.  This does open up an argo
>> wildcard ring from domUs, FWIW.
> 
> Along the lines of my reply to patch 1, I think Hardware and Control
> need to have a pretty strong boundary between them. It's hard to see,
> for example, whether grant map/copy/transfer would indeed make sense
> between the two.

The Hardware domain might provide a PV device to Control?

I've tested removing control:
static bool is_priv_domain(const struct domain *d)
{
     return is_xenstore_domain(d) || is_hardware_domain(d);
}

And that works in my limited ARM dom0less testing.  The toolstack isn't 
really exercised in that case.  It seems strange that the privileged 
control domain is *not* allowed though.

> Similarly I'm not convinced a strong boundary isn't also needed
> between Xenstore and Hardware.

If hardware is providing PV devices to domains, it will need access to 
Xenstore.  I don't see how you can get around it.

I tried to explain this in the first paragraph.  SILO's purpose was to 
isolate domUs from each other, but allow it to access dom0.  dom0 
embodies the control, hardware, and xenstore capabilities.  So as a 
first approximation, each of Control, Hardware, and Xenstore should be 
allowed to communicate with domUs.

domUs needs to communicate with Xenstore and Hardware for PV devices.

Xenstore provides Xenstore access to Hardware.

Control would want Xenstore access.

I don't know if this helps, but here's a table:

     | CTL | HW  | XS  | domU
----------------------------
CTL |     |  ?  |  y  |  ?
HW  |  ?  |     |  y  |  y
XS  |  y  |  y  |     |  y
domU|  ?  |  y  |  y  |  x

Control and Hardware would be y if we allow PV devices

Control and domUs - I don't have an immediate rational for them.  Except 
that Control is privileged.  I've been running xenconsoled in Hardware. 
If xenconsoled is in Control, then access would be required.

>> --- a/xen/xsm/silo.c
>> +++ b/xen/xsm/silo.c
>> @@ -20,6 +20,12 @@
>>   #define XSM_NO_WRAPPERS
>>   #include <xsm/dummy.h>
>>   
>> +static bool is_priv_domain(const struct domain *d)
>> +{
>> +    return is_xenstore_domain(d) || is_hardware_domain(d) ||
>> +           is_control_domain(d);
>> +}
> 
> This construct expands to two evaluate_nospec(), which likely isn't
> wanted. Some open-coding may be pretty much unavoidable here.

Thanks, yes, good point.

> (I'm
> surprised it's not three, i.e. I find it odd that is_xenstore_domain()
> doesn't also use that guard.)

It looks okay to me.  There were only 2 uses until I added a 3rd in the 
dom0less code.  The XSM check has evaluate_nospec() and the other 2 uses 
aren't security critical - Setting a domain info flag, and __init code 
for dom0less.  Maybe moving the evaluate_nospec() would be safer in case 
use grows in the future, but it looks okay to me today.

Regards,
Jason

