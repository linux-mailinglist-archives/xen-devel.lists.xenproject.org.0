Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46572B127AB
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058700.1426200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSCe-0006Qw-Qd; Fri, 25 Jul 2025 23:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058700.1426200; Fri, 25 Jul 2025 23:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSCe-0006O8-NI; Fri, 25 Jul 2025 23:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1058700;
 Fri, 25 Jul 2025 23:51:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSCd-0006O2-3W
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:51:51 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:200a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5045cb63-69b2-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:51:43 +0200 (CEST)
Received: from BYAPR01CA0010.prod.exchangelabs.com (2603:10b6:a02:80::23) by
 DM4PR12MB5938.namprd12.prod.outlook.com (2603:10b6:8:69::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.28; Fri, 25 Jul 2025 23:51:37 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a02:80:cafe::92) by BYAPR01CA0010.outlook.office365.com
 (2603:10b6:a02:80::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.24 via Frontend Transport; Fri,
 25 Jul 2025 23:52:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:51:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:51:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:51:34 -0500
Received: from [172.18.231.84] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:51:34 -0500
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
X-Inumbo-ID: 5045cb63-69b2-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WO19df5NP84TllLAQTEo+4vXMH1D5hVT/RcqK+fF/D5TPIkdIdbLJJ6W+Mq7fnYI/gzdzmqqqzwNflWtvJxX0ejhT5oP1FOvPYg1Z9hmAH58oM6hT/DeM/PSfGarSbmIDjj75yQ15JtFPlrWzwySwlmXpX08FeyDWL6eX7HQqiYh6Ps6toMRA/IFfSeT/9SrmoQXKKh8OYc+VULRn4UXK+Oy5PJ7MfN2+eOUwG9j8Y4MUdgAUNoCJWMz5kxNPkWwyFodVjF8mhFZ9VtLPEQt9ajKe6+4XDqbTbq7KAXbahGYUo40cXI39tkvEi0l15XlXq8DnQRXCZ1KTBjhwYjBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEIPDw+C14+bDLIH3tzUg4GJ/TyjhEm9/MmnBN/LCXE=;
 b=yAstT/iAMGDpkh1cqFt4JbdEV3UDJ0e86cKRPBNKjz/9/uxXl35Y83se8p2ecmWre3Vk3PYm33vUzbdoCX7wzhe8Tjxirn40NcsabAl5s4wjG2l9n94YOlc0W9WPgNQNe2UAtup9CH85+XwUsgMwAYlNRWAUN/Moi3XfbQau5/OibzH8+FPumbsdZyNfgq2pl3d4tQDmvEspHpAksn/k0qLpKhVBUE2wxQq25MqLLy3NdGGLOYc8vlQdMswjYjl3GjMPuw8/HygZSJpAT80B+lIRi1dveeXe1DHYuKgAVWR3ConNVsndoSoMJJ9vNV6rNQRZIFmXRTF/K0VrckZ88w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEIPDw+C14+bDLIH3tzUg4GJ/TyjhEm9/MmnBN/LCXE=;
 b=ePMxVuqS102ANQ6s/JKUDa+XyvCH0jE5Q79OGOkxiSYgSYWKnwTVBoz0Cuw+VrK3NzWfwrvazkCQN79R16t6JEu0dNAgAltTZUOeLiaxSiWXm0gu+66Elughku4stocH/BmhLY7g5/TlL+JKh4BduOpPSIZBJav0k15HmfKVcRk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <6c95d3d9-d437-47c0-9513-dcb844844707@amd.com>
Date: Fri, 25 Jul 2025 19:51:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] tools/xenstored: Auto-introduce domains
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
 <20250725022812.466897-8-jason.andryuk@amd.com>
 <e762b84b-e7db-4c3a-bd90-f58750a36575@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <e762b84b-e7db-4c3a-bd90-f58750a36575@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|DM4PR12MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d5e8a0-d12b-4fec-4072-08ddcbd6317b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTAwdG5YSGVHSklGUzNIY1FoMlBrZXRVbUYxM3JNdk5TZ2pBNmkwbHJkU3VK?=
 =?utf-8?B?VGxDa1VTVzhpejlNdHk4Y1pxaU1LVVZ3T2lQa1g3V2pUeXo0eGxXTTFwRHBZ?=
 =?utf-8?B?bTFzRGxTbjIxNXNxbDMvbjJXMmZzSFZsZEtyZTg2Y0JBeEdCbUpqVVFHaytz?=
 =?utf-8?B?YWtIWG5xbGdVWkJGMHBiRDhyMm5BV3dIVzNPR1MwbzlHVDZYYW9OSnRvL1Zh?=
 =?utf-8?B?c3oxZTRZZlhWZlMwRVltcjJzQWJVNDRETTV5OGJWWnVYL3ZrZ2NDNkhSK3Rw?=
 =?utf-8?B?YjFOczdjTEt6N0UxK0dlZXQwN2hWNXluLzBDNUFvUjVUUEJSeG1FK3FPMDhP?=
 =?utf-8?B?ZFJ0T3c1REZBTWVwd0N4QlhMdUN6dHNZbldGZ3ppY3ZRZjVXMGI2aVZDU3py?=
 =?utf-8?B?aHAxalZBWWg2TGFQWkxWalJnRndpb2VpUWxxZ0RyaHg5S2s3SmkrdDVtWHBH?=
 =?utf-8?B?dWJIZUFkNVNZbk53UmpyUFBOMzh3ZEY5SUhLM3FwZEJqQm5BWVExZk95UHVv?=
 =?utf-8?B?cDRuVnduQ1o0UGtCaG9FZHZXV01DNVhZSW52Wi9TNGdvTERzM3ZWcTdNT1pE?=
 =?utf-8?B?U2RjRmZWcWh4eE1jcFlZQkorRGhpSEZtZ0phZWRKUkJhUTViVG9EMHNybmhU?=
 =?utf-8?B?VFd1Y1FueVQ2MitTbmlHdzJsS2oxNkEyMlBGK3BLeEpJUEpWMmNkUUhqTDBV?=
 =?utf-8?B?ZCt5R2lSZkcvOEJMUUNXYWRsS1N5U0pxZXFuSkoydEFEMGdXKzhhTWZpblBH?=
 =?utf-8?B?RkFLUzBnTytBbklHWlN3V2xRaXh6cUIyQzY1WlQ1MGIyWmlJNDd0K1ZsbTU2?=
 =?utf-8?B?ZUlwWGV3VUVGRFZLVmVWMS9CMXp6WFJ2MUQxYm5DMFBza0lwM0NyMEdGU2Nt?=
 =?utf-8?B?LzJLc1V0ZkRRbHhyWGwzZ3MvYmdicHVKdEJkWkR1K1N5TU1tT3VzZHZibWlE?=
 =?utf-8?B?aGJXOEpXTDNselZELzdZaWRLaVgvTGU5bTNaa2YzSkRDTjhDdmluNDZQeWVV?=
 =?utf-8?B?RUpoNDBMbTQzREF6Qy9ITUlYR2NRc0dGZFlCYUsvOHlmSnZmZFRKVWwxVHlh?=
 =?utf-8?B?bjR2eVMva2I0d0JCTE5HN2pWVHlpaFB2NHV3YlRIaVVSdlJ1SE03bC9yY0Nh?=
 =?utf-8?B?S2psaE9BZmU5RnZXZ2U2U1BxajBENHZxbW9lak9jdjhXaFNsbjd4YUlMRjhF?=
 =?utf-8?B?UW10cnhhckxNZUxIcksxOXNFblk0dHlTWFJnKzhoZHo1VE1HWjhibFA3MTVI?=
 =?utf-8?B?MkxXdGJCM3Z2Rkg4aElnTkJBeGFSbTdBbTIzY2lZVG5MSXZ3VGx3QWd3cGZ1?=
 =?utf-8?B?ZTRNVWFkWms4ak1VOTRLSW5Hbkdpa1RVTGlSRkxNRXBLWjRYWFA1a29JaUtv?=
 =?utf-8?B?R2Y2clVibW1WdHhaRVVyV2ZhdWZ4cmM4a3lLNGl2bWlqMVFjWGh0NDVKWEdD?=
 =?utf-8?B?TFhBMUV3WkxCSm1welJ3bHlFZUhDdm5hTnhHQW4yRnBucWxHUU1NRGFmRUR3?=
 =?utf-8?B?dzlFdUYvYnkzUFdnVjYvY21oT3puY3N3OEN2M0hKK3RUWUdKSUpyR2lUb3Vy?=
 =?utf-8?B?Mk5aNWlhbUNHUkEyOSsxSjI0OVg0Z2JmQTN0Q0k2enBCTnBrbTE1UFJIbkZl?=
 =?utf-8?B?OU9kMFFMQTQxakJwYSs3bmM4emJoVTAxMndybzBwVUhBd2o1NG1qaGNiL1di?=
 =?utf-8?B?Umh6dVFxQjBJSDFXbTFkOFVOZjY3bDFiV0Y4VXRVYXZVRDFMT3llbUo3TmQw?=
 =?utf-8?B?bVl2TnR3dUVuVWJoVGl3U2Vlb0lxeEExSW13TkZGb1oxQWM4ZnVzZy9xeE5V?=
 =?utf-8?B?THBQbVlvZVlURnJHdE1Wc215Y2NoSUl5eGVzOGMxUXE5U2pibDRDdHVvRmVR?=
 =?utf-8?B?WlJHOVJUdXpFZHZtSUNhTE9uNlFRZ29kMGN2dEdIV1owRHBDYzFxZncyVzFM?=
 =?utf-8?B?U0VVbUdValpLQjJJbzUvcit0REhGRitmOURyN1JFbktRN2s0KzFjTVg3STFn?=
 =?utf-8?B?d0RDZWJUa051NDJIWDlub1FsR2luREM5UTIyQWlvS0crUFBxTWN5NW9UT1hM?=
 =?utf-8?Q?8DoEXU?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:51:36.8732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d5e8a0-d12b-4fec-4072-08ddcbd6317b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938

On 2025-07-25 03:04, Jürgen Groß wrote:
> On 25.07.25 04:28, Jason Andryuk wrote:
>> Replace dom0_init() with init_domains() which uses libxenmanage to
>> iterate through all existing domains, storing them in a list.  The 
>> xenstore
>> domain is introduced first, and then all the other domains are
>> introduced.  The xenstore domain needs to be introduced first to setup
>> structures needed for firing watches.
>>
>> dom0_domid is updated with the xenstore domain, since it really
>> indicates the local domain.
>>
>> priv_domid is set to the control domain.  This makes it limited to a
>> single domain.
>>
>> These features let xenstore automatically connect any existing domains,
>> which means it doesn't need to be done manually from init-dom0less.
>>
>> For a legacy dom0, the result should be unchanged.
>>
>> For a late xenstore stubdom it should also be the same, but priv_domid
>> would be set automatically to control domain (which default to 0
>> normally).
>>
>> Always signal the event channel for initial domains.  This gets dom0 (a
>> local xenstored domain) to connect.
>>
>> Also always write XENSTORE_CONNECTED since we know we are connected at
>> this point.
>>
>> To support ARM dom0less domains with xen,enhanced = "no-xenstore" a
>> failed introduce_domain() becomes non-fatal.  Normally,
>> HVM_PARAM_STORE_EVTHCN is used to identify .
> 
> HVM_PARAM_STORE_EVTCHN

Thanks.

>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> I noticed domain_conn_reset() isn't called for the stubdom, so I added
>> the ifdef to special case it.  I haven't tested with a stubdom yet, and
>> I wanted to be conservative.  Ideally it would be dropped - the issue
>> would be if the stubdom queues requests before xenstore is in service.

>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
>> index 1c52254ba8..e9e45ed8e8 100644
>> --- a/tools/xenstored/domain.c
>> +++ b/tools/xenstored/domain.c
>> @@ -1280,41 +1280,76 @@ evtchn_port_t get_domain_evtchn(domid_t domid)
>>       return 0;
>>   }
>> -void dom0_init(void)
>> +void init_domains(void)
>>   {
>> -    evtchn_port_t port;
>> -    struct domain *dom0;
>> +    unsigned int *domids = NULL;
>> +    unsigned int nr_domids = 0;
>> +    unsigned int domid;
>> +    unsigned int state;
>> +    unsigned int caps;
>> +    uint64_t unique_id;
>> +    int introduce_count = 0;
>> +
>> +    while (!xenmanage_poll_changed_domain(xm_handle, &domid, &state, 
>> &caps,
>> +                          &unique_id)) {
>> +        nr_domids++;
>> +        domids = realloc(domids, nr_domids * sizeof(*domids));
> 
> Please use the talloc framework for memory allocations.

Yes, of course.

>> +        if (!domids)
>> +            barf_perror("Failed to reallocate domids");
>> +
>> +        domids[nr_domids - 1] = domid;
>> +
>> +        if (caps & XENMANAGE_GETDOMSTATE_CAP_XENSTORE) {
>> +            memmove(&domids[1], domids, (nr_domids - 1) * 
>> sizeof(*domids));
>> +            /*
>> +             * Local domid must be first to setup structures for
>> +             * firing the special watches.
>> +             */
>> +            domids[0] = domid;
>> +            dom0_domid = domid;
>> +        }
> 
> You could move the loop body below in a helper function and call that
> for the Xenstore domain just here without adding the domid to domids[].
> This would require to do the XENMANAGE_GETDOMSTATE_CAP_XENSTORE test
> after all other caps tests.

Yes, good idea.  Actually, given the "last set" xenstore domid issue I 
mention below, I'll move it between the two loops.

>> -    port = get_domain_evtchn(xenbus_master_domid());
>> -    if (port == -1)
>> -        barf_perror("Failed to initialize dom0 port");
>> +        if (caps & XENMANAGE_GETDOMSTATE_CAP_CONTROL)
>> +            priv_domid = domid;
>> +    }
> 
> Is it okay to overwrite priv_domid in case multiple domains have
> XENMANAGE_GETDOMSTATE_CAP_CONTROL active?

Probably not, no.  First domain, being domain 0, getting priv_domid is 
probably what we want by default.  And we should respect the command 
line value if set.

if (priv_domid != DOMID_INVALID)
     priv_domid = domid;

> Same question regarding
> XENMANAGE_GETDOMSTATE_CAP_XENSTORE above.

dom0less only allows creating 1 xenstore domain... but the "late" 
stubdom case is different.  dom0 and the stubdom will both have 
XENMANAGE_GETDOMSTATE_CAP_XENSTORE.  Since in that case, we only have 
dom0 and dom1, letting the second one take does what we want.  dom0 
assigning VIRQ_DOM_EXC to another domain could transfer the capability, 
and then there would only be one.  Similarly, passing --master-domid to 
minios would make it explicit.  (I'm not a fan of passing the domain's 
own domid).

A more explicit way to convey the information would be better.  Directly 
exposing the domid and the capabilities to the domain would let 
xenstored know exactly what it should configure.

Until then, the cases we have are either a single xenstore domain, or 
dom0 and dom1.  Selecting the last one will do the right thing.

>> -    dom0 = introduce_domain(NULL, xenbus_master_domid(), port, false);
>> -    if (!dom0)
>> -        barf_perror("Failed to initialize dom0");
>> +    for (unsigned int i = 0; i < nr_domids; i++) {
>> +        evtchn_port_t port;
>> +        struct domain *domain;
>> +        domid = domids[i];
>> -    xenevtchn_notify(xce_handle, dom0->port);
>> -}
>> +        port = get_domain_evtchn(domid);
>> +        if (port == -1)
>> +            barf_perror("Failed to initialize dom%u port", domid);
>> +
>> +        domain = introduce_domain(NULL, domid, port, false);
>> +        if (!domain) {
>> +            xprintf("Could not initialize dom%u", domid);
>> +            continue;
>> +        }
>> +        introduce_count++;
>> -void stubdom_init(void)
>> -{
>>   #ifdef __MINIOS__
>> -    struct domain *stubdom;
>> -    evtchn_port_t port;
>> +        if (domid != stub_domid)
>> +#endif
>> +            domain_conn_reset(domain);
> 
> You definitely don't want to call domain_conn_reset() here.
> 
> It is NOT called for dom0 today and for normal domUs it is called before
> the domain gets started.

Ok, thanks.  I didn't look back far enough, so I didn't realize I added 
it myself.  I did that to make this loop as close as possible to 
do_introduce() for the domUs.  Since there shouldn't be anything to 
reset, I'll drop it.

Thanks,
Jason

