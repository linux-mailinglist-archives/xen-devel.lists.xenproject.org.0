Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5F8B0966C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 23:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047533.1417990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucWKC-00009s-RJ; Thu, 17 Jul 2025 21:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047533.1417990; Thu, 17 Jul 2025 21:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucWKC-00006g-NB; Thu, 17 Jul 2025 21:39:32 +0000
Received: by outflank-mailman (input) for mailman id 1047533;
 Thu, 17 Jul 2025 21:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTIS=Z6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ucWKC-00006a-0v
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 21:39:32 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2413::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 819bc87f-6356-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 23:39:25 +0200 (CEST)
Received: from BN9PR03CA0889.namprd03.prod.outlook.com (2603:10b6:408:13c::24)
 by PH8PR12MB7181.namprd12.prod.outlook.com (2603:10b6:510:22a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Thu, 17 Jul
 2025 21:39:18 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:13c:cafe::d3) by BN9PR03CA0889.outlook.office365.com
 (2603:10b6:408:13c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Thu,
 17 Jul 2025 21:39:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.1 via Frontend Transport; Thu, 17 Jul 2025 21:39:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 16:39:17 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 16:39:17 -0500
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
X-Inumbo-ID: 819bc87f-6356-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS3FfKBR1gEcgDxGFsB5z5nJWx3WNlCxRLS0zjDSRFrbBdDR3cIDYVNH0x+LRsX/Yc+ezmkzOVhWRBJIbPa/91LpCYr6JJtZkQduitRHRLz0DDdzWqFvducSHP43qKmSuNK0sqL+SopCW7aA2v4p09G7YYgt2TRPaowemeEt73LuoGJatL69ex+46dgvXEDkRb7a/EKrvaNEx+EQo0qjp2aGGWVg/MUwtu9TtA7SND2k0n5rDoXUv7hlObznRvG4W5pHi1CnzNPq8S72R8LPutXP0NVmRZaFnpSjz+wDtW2vZIT7eg5LuSO+3Z4/BiuH9lHt1Ej58Pdv4vv8WrBHqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQgOBbUWs6HlyoITlfnDUHmOkqAHJHzWYGcEuwetnZM=;
 b=MhfueqMkJyRcPD7uRKmOHS9YXRt8gknCcL0s6co2UdnfVokvNb3CiwGan8n0KznWiB4lXfjdmvTER81Y5p78VV3U1J/VxDUQPE5mADNzljaVJd82SjSwOCHecFAptREXVJ+9rYx6SUQZFe7OBdWvqs310jar9GJNKdJfux1+5xywgz4F2doA2spg4SXqxP6diw1U8/ni8SfUHUEX01z7gB3WfuewyvlVpJnUmNzLjrWfI8pyPjHh8cCTKxVLexktrLNT0i14wSB6gjl6fHUXXAMwd6VswfaGalsRgv3dX5O2TiJne0J3ozff+OV8e4XfzzYvOwlWmW4H0O2DLF288A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQgOBbUWs6HlyoITlfnDUHmOkqAHJHzWYGcEuwetnZM=;
 b=xovbOt9NtS+ILbYLTlgyF42Z7JAitONCh2bP/4K+8K+VwgYpIo/KJdIWwl6sa2Kj4yNQbWfzCq+tNDgUkjg34mZ2W0fbi1JuR6CxfJM8g9LVFNS/XjVDVyTykX4jSpAU7PegHnpa3YXV9QaOodRLtyohmgP3YJK7pW6h4UB/PFg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <16579803-2db0-4d5c-bc03-592b77c61a1b@amd.com>
Date: Thu, 17 Jul 2025 17:39:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] tools/xenstored: Auto-introduce domains
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-15-jason.andryuk@amd.com>
 <5c6cfc84-e1e0-427b-92ec-f01ebda1f4c8@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5c6cfc84-e1e0-427b-92ec-f01ebda1f4c8@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|PH8PR12MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc0d2f6-3a30-4251-7ce6-08ddc57a6266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnZCVDNUaTR2MFlHb0x2RHRiV0VQN0l2ekxVYkorZk13OVljZVVDVm9PYVRD?=
 =?utf-8?B?RnE4ZFU4OGFUVjllcjJsL0RUT2pzZHVMbmpOS0M4RG9FdGR2TFVsWEJ0aDNC?=
 =?utf-8?B?aEdWUTlPemFueFlZZ3NudldXdnhJN1dEdkoxN1ZIVG93WG1oK0lUSERacXVw?=
 =?utf-8?B?S3hHY1MyK1dxNkJSTUsyU29kcytVRllCMlRoRThscHdFTVhpdlQ0RUhERlhj?=
 =?utf-8?B?QlRjSFFhYlFYZzBzdy9mb0w5YUljSUdwQnU2MjRKRVZIcEZsdHpDcGNnakRs?=
 =?utf-8?B?MDFxTVVYeERRSWJUQWVKSWhqdXJwRXJKQWFUV1pFMXRxNDI3V3lnbGliS0lW?=
 =?utf-8?B?RGRibXNzLzBiY2pCUXpLK3RmK0U5M3dOTURNYUtDQ283Q1NkaVkvRG0vclVF?=
 =?utf-8?B?eDZ6b1o4RmFiZlAvNjZGbkVBT0JZR3kxZmxacFEyQ28zd1Vja0tRV3BuK01z?=
 =?utf-8?B?OEM5Z0hsS3NxS09wZzFRZ3VBL2RpT1RUamZEdzU5ZVlQZ2pkNnhuaVMzcjJt?=
 =?utf-8?B?NU1UK01jVFVvZVBNS3NXa1g2ZUdKR1RJMU41cDJCNUZlKzU2MjVHaEsrVFVP?=
 =?utf-8?B?dVJzYUZKMU1XcGhQKzJtZnUwZkpRTGNleHdWYmhGYVd3NlhJVEJKRDhWSkpj?=
 =?utf-8?B?eXFpalQzT3Q4bnBITUJVRmNIK1Q0RlU0d0JVUklOb1FCSE1QU2NLSzVTYVI1?=
 =?utf-8?B?ODBQUWRDL1g3Mmc5SGJTQnYxSDBZcjF3dmFlam1nMkhQTmt4eXhjcThSemg1?=
 =?utf-8?B?V01HZXE5UnU1Q09iNnFoTkNaVjRQT2dMUjNjRXlKZ3hNZ3dTNGkxeEtuQy9l?=
 =?utf-8?B?WnNna1NKNElJQmtmZEd0V3hndU84ZDN3N0huSS90cGpOSVdzUG1pV2RiY0hq?=
 =?utf-8?B?VjJEaU43VWJGQndsdGgwQ2NRaWJyY3l5V2wwMDdlNURSQmNHU09mQ2JtaHAy?=
 =?utf-8?B?SmQ3bXl4M3FCR3dnRzVYZ1JUaHJhRFc1SzJBYUJwa3BrejJERmE2WUZaMWIr?=
 =?utf-8?B?TDM4MFRNOVhnV05nTUI1dnJuUDM0TUpRaE1CWjkxK0ZnNmxOUCt5bXA3ZkRG?=
 =?utf-8?B?LytPMmp5U3ppZ09ZdTVudUtwQzkrWlhhajkzMDlXYU9ZeGtQT09jZHVSckVU?=
 =?utf-8?B?bVJkM1pFK3F2aEp5Y04zT1plMk84TU05R2ZqZFJmdDZ4VU1wZFFyQndVdzg5?=
 =?utf-8?B?OWx6R2ZYZ3hEU2xqUnI4QjhJOVYzemJrRTRsM2thejZaZC9OL0VadEoxZnpC?=
 =?utf-8?B?ZzVpckR1RFp5MW1POTR5T2NBTFE3MjFXNCtBeFJXTCtCUHJkUVVLMkM0Sm9F?=
 =?utf-8?B?NUwvY2FKK1duMkVSUEZvY0ltc3dTbDRUaWMwcEMzclM3Y052VlRVazdDOUdW?=
 =?utf-8?B?QnRhUnlLam82ai8yNkFNb2FjNGJSYk81TDVEU0FXSlZiaFZYcCt6YUxYUUl2?=
 =?utf-8?B?Z0lKMFRueHV4NG1yVzBXL0dJZ1VweWhZUGlwL292L1BLTEI1Z3FWU2RJNEZw?=
 =?utf-8?B?elJPYnUzVW85Y2g0b2E5ZjlaOVNYM3JUeGRkRXlhVHFHKzJTa0JxMGlwenhB?=
 =?utf-8?B?bEhpbHhHWHRHTTFUODF1clRyamJFQWsxUGJDVWZDR29XTmZpVG9JWmNpTkwz?=
 =?utf-8?B?em5wamticDZKdjFjNk1Qay8rM0xiNDF2dDNnNi9vWlRYdTdPbHFLNzc3TXVr?=
 =?utf-8?B?SkplQkRqTkJ2ek9Qak9JTFkwNVkrSENPaUlkZ1AzZVd5cEh1a0V4VmRKa2l3?=
 =?utf-8?B?cGV5NE8rK2xOZWs4OW5mTG1hc3dlSSswbnYweklFdkhCeEhyM2l4dWliYTMz?=
 =?utf-8?B?SWZKRVlzS2NmNXpnT2w3azVzMEZqU0pDZ1FxQTk5RU9HM21aYnpBdnY1RERv?=
 =?utf-8?B?alFwTDBYU0VnVHRNQ2dXQWh3QythQTRkTlJ6T2V1czZWSWlUTHQ1UU0zSjhL?=
 =?utf-8?B?SG5JS0RGc0RCWmtJZnRrVEJqc3RvTDJHWG9wTjhuUW4vUFhNaUQyMjZVcHhN?=
 =?utf-8?B?cGNGRjYydUNPRmo0RUIyRGVkQlJWK0tlUjZHVkY4RlF6YnltdzlSOHNRMUFl?=
 =?utf-8?Q?tAM+z1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 21:39:18.3606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc0d2f6-3a30-4251-7ce6-08ddc57a6266
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7181

On 2025-07-17 04:50, Juergen Gross wrote:
> On 16.07.25 23:15, Jason Andryuk wrote:
>> Replace dom0_init() with init_domains() which uses libxenmanage to
>> iterate through all existing domains and introduce them.
>>
>> dom0_domid is updated with the xenstore domain, since it really
>> indicates the local domain.
> 
> I agree with that explanation, but I wonder whether this explanation
> doesn't indicate that a rename of the dom0_domid variable is wanted,
> e.g. to "store_domid".

I've written a patch using "local_domid", though "store_domid" would be 
fine.  I used "local" since I thought that would be better for 
indicating when we need to use /proc/xen/xsd_* for a "local" access. 
And for xenstore-stubdom, local_domain would use the special case code.

>> priv_domid is set to the control domain.  This makes it limited to a
>> single domain.
> 
> Maybe another candidate for renaming (ctrl_domid?).

I've further experimented with replacing priv_domid checks with a 
per-connection is_priv flag.  Though now that I've written that down, 
maybe we don't want to support multiple domains having Xenstore privilege?

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
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   tools/xenstored/core.c   |  2 +-
>>   tools/xenstored/domain.c | 45 +++++++++++++++++++++++++++++++---------
>>   tools/xenstored/domain.h |  2 +-
>>   3 files changed, 37 insertions(+), 12 deletions(-)
>>
>> diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
>> index 550e879a00..835402af81 100644
>> --- a/tools/xenstored/core.c
>> +++ b/tools/xenstored/core.c
>> @@ -2762,7 +2762,7 @@ int main(int argc, char *argv[])
>>       /* Listen to hypervisor. */
>>       if (!live_update) {
>>           domain_init(-1);
>> -        dom0_init();
>> +        init_domains();
>>       }
>>       /* redirect to /dev/null now we're ready to accept connections */
>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
>> index 5443b4e608..44e997cee4 100644
>> --- a/tools/xenstored/domain.c
>> +++ b/tools/xenstored/domain.c
>> @@ -1257,20 +1257,45 @@ const char *get_implicit_path(const struct 
>> connection *conn)
>>       return conn->domain->path;
>>   }
>> -void dom0_init(void)
>> +void init_domains(void)
>>   {
>> -    evtchn_port_t port;
>> -    struct domain *dom0;
>> +    unsigned int domid;
>> +    unsigned int state;
>> +    unsigned int caps;
>> +    uint64_t unique_id;
>> +
>> +    while (!xenmanage_poll_changed_domain(xm_handle, &domid, &state, 
>> &caps,
>> +                          &unique_id)) {
>> +        evtchn_port_t port = 0;
>> +        struct domain *domain;
>> +
>> +        if (caps & XENMANAGE_GETDOMSTATE_CAP_XENSTORE)
>> +            dom0_domid = domid;
>> +
>> +        if (caps & XENMANAGE_GETDOMSTATE_CAP_CONTROL)
>> +            priv_domid = domid;
>> -    port = get_xenbus_evtchn();
>> -    if (port == -1)
>> -        barf_perror("Failed to initialize dom0 port");
>> +        if (domid == dom0_domid) {
>> +            port = get_xenbus_evtchn();
>> +            if (port == -1)
>> +                barf_perror("Failed to initialize dom%u port",
>> +                        domid);
>> +        }
> 
> I don't think this is correct for a xenstore-stubdom. See stubdom_init().

Yes, you are right.  There is a mismatch where for xenstored, dom0_domid 
means the local domain, but for stubdom, dom0_domid is dom0.  I have 
some further changes I need to revisit that work to address that. 
Basically, make minios.c and posix.c only handle the "local" case. 
Anything that is not local is just a grant map.  With that in place, 
stubdom_init() does not need an introduce_domain() call.

I think I hadn't figured out exactly how to handle the dom0 event 
channel passed on the command line to the stubdom.

>> +
>> +        domain = introduce_domain(NULL, domid, port, false);
>> +        if (!domain) {
>> +            xprintf("Could not initialize dom%u", domid);
>> +            continue;

I need to expand the commit message to mention this change.  Here I made 
failure non-fatal since for ARM there can be domains without xenstore 
access.  They can be identified by an hvm_param, but xenstore doesn't 
have permission to read those.  Here introduce_domain() is called on 
them, and the grant mapping fails.  So we note the error here and 
continue on.

Thanks,
Jason

