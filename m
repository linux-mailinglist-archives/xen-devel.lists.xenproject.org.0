Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F6BD953C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 14:26:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142751.1476695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8e5M-0000tr-7E; Tue, 14 Oct 2025 12:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142751.1476695; Tue, 14 Oct 2025 12:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8e5M-0000rB-4Q; Tue, 14 Oct 2025 12:25:00 +0000
Received: by outflank-mailman (input) for mailman id 1142751;
 Tue, 14 Oct 2025 12:24:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uGvW=4X=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v8e5L-0000r5-5E
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 12:24:59 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c89c94a0-a8f8-11f0-980a-7dc792cee155;
 Tue, 14 Oct 2025 14:24:53 +0200 (CEST)
Received: from SN6PR01CA0012.prod.exchangelabs.com (2603:10b6:805:b6::25) by
 DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Tue, 14 Oct 2025 12:24:45 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::b0) by SN6PR01CA0012.outlook.office365.com
 (2603:10b6:805:b6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.10 via Frontend Transport; Tue,
 14 Oct 2025 12:23:28 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 12:24:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 14 Oct
 2025 05:24:44 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Oct
 2025 07:24:44 -0500
Received: from [172.18.10.234] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 14 Oct 2025 05:24:43 -0700
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
X-Inumbo-ID: c89c94a0-a8f8-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i24+U+EQhslDEOuSWviYg4GCegp68DlSAaE25nXnemxr5Bv1xbPz5kMhwWZ+ve9NeYqFKum7qq/wQ2OqshMgwEMMJ1WuaHbK87x+bUMwW+eFv5p+6vxWmUcEGNZPvVEdXFS6MLK4gJ0QsJdAQmzWcgynK4eS2rc2V4GZun/nD8apyY3hZAyYq6GMTt1W4NKDIBZMKf8A2WvV7oZp08SX62wR0YME42kYrZ24bH7xe9QydoINYeT9MRA4m+uFPMIoQ08dBlWUXHrYUyKeXaCdSf3MNE0PrYTsomjjf3rmrZlj5MHjZOw1w3w03TUzswl4TDSLAJl2+1eH3cWQfJHp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpc+bz3p67kLMc0zFi4sTqbc9eciCbNZG1ZmbGL+7Rs=;
 b=c9lpWb+hqXy2bW9/81ZsoFSuuNIjKsunZBXiwVS3K0Lmtz2IJygWoWu/ip0H03IUDOTtDsSkLRreQO4+I6cyWe+aC79IDi13BlDTK6TOzRas4nubKoeFBQHlRcIyiB4hE79C2/5zHGWHEzz5Z3SzsrqnV2zdcYOL6z/aGY43hFBtKtl7WYIwXAXmI9eOS70A/MnGyjQ0rO6goKHVGR6s9EAxdWVHyLI6M3d++zGJL55RAANLcH4rT1wjYxShkjTCRDAAeWt1/RUsZhJpvccXvcPcAzpcoh/wMYzLC/HtSaRcum9NfsUAvrCbr5fVgidfCMGSZCnyWCPbAOJ+OZwpQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpc+bz3p67kLMc0zFi4sTqbc9eciCbNZG1ZmbGL+7Rs=;
 b=e4vjbKO4HQNbnEBTPUY13I0gVJzLIPy5LxtK5dOMhxB0MmbssAnD93E91AfEHx1NnW4iLOtzQgtWSaCWKCcHoGcOJNu2LVGXHBifzH//xXhApGLtBOSAdN9AJLMX+3hHUV9EAfvizyf+78HVI3z+uvUufb64cPOpI+JioZZ2O3s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <8636d707-cce8-4102-82d0-ef52941f4c68@amd.com>
Date: Tue, 14 Oct 2025 08:24:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
References: <20251013211106.8720-1-jason.andryuk@amd.com>
 <aO39pb3L42ktBol_@Mac.lan>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <aO39pb3L42ktBol_@Mac.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 3447179c-e3c5-4327-f78f-08de0b1ca903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDRLK3JTRW1EcUJxSGt4RkFITVpIMzVvUlVycUk0OWVUb2syZVl4VklXenht?=
 =?utf-8?B?UnoyZmh5Nng3aFFZMWRjWkt1OXRYblpFQVl5N3RnYnIyeFhwbTV3citUenVp?=
 =?utf-8?B?VHVoSC94SXR5SStSR2Vwc0lqYUJHbmVvcmxpUEszU3ZFdzkyOXJYcXFFMFM3?=
 =?utf-8?B?Nk5jb0dCakhORkpRNG5jYXh0ekYwcXRJRkZ2SEZGWURuUG1yeTEzZlpFTWVV?=
 =?utf-8?B?NlVNcmNSTzVlTzZKSHBUK2lDdElSVFhpVnZVejdDcDlNYm8zYXZ1djFuT292?=
 =?utf-8?B?UisvUGt6d1p0WkpSaUNJYkMyOXFpUXNIK3luWUVUOVFhZVE1SXZMa1Axa21S?=
 =?utf-8?B?LzUwbjlWblZhZFRCQmNjUjg4N015WlhINmRoWGRoL1p5S0V6dy9LUjJoMFNi?=
 =?utf-8?B?SGt3QVpTdXh5VG1VUEpKdnJDWHNySlpGZ284K0s0MkNDUWdGWGovdENyL2g1?=
 =?utf-8?B?amJTMnplb0NhNzg3dGdtZzNoRkNXQzNZdTArZml6SHlxcXh0THc3N1huQlVX?=
 =?utf-8?B?VnRoTjRNRFR2T2IwMDhOc0FiSFJyU0lzLzNYN2RacHk1M25oQ1NmNHVzcngz?=
 =?utf-8?B?UTFkM0d2bGI4d0Nqd2pMbktvaFM2YlVPVmp3VmY0YWR3Y0trS0RkeVBpbG9Y?=
 =?utf-8?B?c1FrQk5DWXltRUU4YThyRWFFcGorS1FBbWxaUlpCSmpKU3UycDF5MFhkL2cw?=
 =?utf-8?B?S3NldXQ1MnFKckVTOERSTWRMRzh0bFh2Um9iaExMcEF2ck5KQ3J1dVBxbTE0?=
 =?utf-8?B?VmRWdjc0b1Nvd1pYbEdnNHF0eWNYUmRxS25ZM0Y4bkdDOVZGMStxeDIxSVNY?=
 =?utf-8?B?S1NZWjRBdGVWdWRIU2d2QXd0K3RKclJBQUgwQzErcWdiekkzSFNBMTVnSEcw?=
 =?utf-8?B?dVZ1S2oyUjl2TEVxeCs0Tnh2cXgvbHlLV2luSm1mUm9jTmg3VklkUnNwMzQ3?=
 =?utf-8?B?cFc1YzlzcEphdS83K0h2ZDRUcHZ6Nms2bDhWR3F2SDZjNjVNa0pmeEZSWU9Q?=
 =?utf-8?B?NktVRnRONzQ4QWNJUTRDcjRnclgrL2hzcFE3Z0poZytkWGpRcFhVM0RsVm5N?=
 =?utf-8?B?cnZOZkkyZGorMU5Qdy9UZzBjSlhlc1FYcGppL3VPRlR5ZHlyMU5lZW0vcWdt?=
 =?utf-8?B?SFhMbFNxUTh4cnVEeE9iYnM3TVU3ZnoxMWdpcU5zUVY0N0w3Qlh3NmVDci9j?=
 =?utf-8?B?YmJYamtMTUdvS3lLZEZpWHlkRVVhRzBlNWFsVHFPNU03R0d3NVJSaTlWd0lD?=
 =?utf-8?B?cndNUU92TDZQTWRKRnVFeUdKZmFwS1hKeUdOU3pHWjh6VWlsOGtpOHJNRjc0?=
 =?utf-8?B?ZFJ3NElTYVFTR0dOZ2FLbXVvZW9BSUxvUXJ6RnhTdHQ3eTc3bDh6YjYvdE9k?=
 =?utf-8?B?Z3k2NlRoamRNVU55M2JqWnlCNDB5QTNGUTN3Skd1K0tyRDRWL1ZHQ1NaYU1a?=
 =?utf-8?B?NkMxb2w4aHhjVUZ3aFFlY3pRNzd6am5oWU9neHJSbXBnZm8rRGx1YVU3OWpW?=
 =?utf-8?B?WVFLaDBmT3RGaS9DTkYzbk5KakNvWFcwT25hNVl5eVlDR0NjK0kxU3BhOUFE?=
 =?utf-8?B?Zi9hcUM0OE5lZmluWE1BU0Yyb1pzcDRUNGpPM0pUVGpEN3F3anBrdTJFSi9W?=
 =?utf-8?B?ZHRtQUdEU2NTWVJrcFBOVlJ0TVQ2Q0hUaFh1dmN0TmcyOXdUcHlGNFdNekto?=
 =?utf-8?B?dnRXWVdiMWlDeitYRnlrS0htUGdReWxBaTg2OVhCTkxoc1hnMExicU9yVVp6?=
 =?utf-8?B?dm9xT3lSenZHcFRKWTJOY0p4Z3h5UTQvVVN5K2wyNDlYMGhYd0w0aHZvQXEz?=
 =?utf-8?B?R2V1THZkSmZCRE85WVN3SEFraVJPeWY5WjVSQmlacDJGcm5TbnlXVkdhMjZ1?=
 =?utf-8?B?RDFyZ1M2YVZ2WU9NL1VTbXAxS0wrSlhvdmFJOFBJY0tvUTBsVkJ1OFh3Q1ZR?=
 =?utf-8?B?QjlMUzg5ZndWMkdJSXVDcHBmdU9LVGlLdFl2cTlDNmg4OVdKYjZLMENCQVcv?=
 =?utf-8?B?dVpYRGYyMjZnbElpWm5uL3FBUGRhdWhhWFU2b2lHMVdRR3dQTWx1N0VZT0hm?=
 =?utf-8?B?b0xlT1J1cXRhK3VPRUNqQVJJcEVIMWpBM2RhMkExa29EbmRjbjRTcUhUVmlz?=
 =?utf-8?Q?Tavo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 12:24:45.5149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3447179c-e3c5-4327-f78f-08de0b1ca903
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229

Hi Roger,

On 2025-10-14 03:37, Roger Pau Monné wrote:
> On Mon, Oct 13, 2025 at 05:11:06PM -0400, Jason Andryuk wrote:
>> io_apic_level_ack_pending() will end up in an infinite loop if
>> entry->pin == -1.  entry does not change, so it will keep reading -1.
> 
> Do you know how you end up with an entry with pin == -1 on the
> irq_pin_list? Are there systems with gaps in the GSI space between
> IO-APICs?  So far everything I saw had the IO-APIC in contiguous GSI
> space.

I only noticed this potential infinite loop during code inspection.  I 
mentioned that in a v1 post commit comment, but I forgot it in v2.

>> Convert to a proper for loop so that continue works.  Add a new helper,
>> next_entry(), to handle advancing to the next irq_pin_list entry.
>>
>> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> v2:
>> continue (not break) for pin == -1.
>>
>> I added the next_entry() helper since putting the expression in the for
>> loop is a little cluttered.  The helper can also be re-used for other
>> instances within the file.
>> ---
>>   xen/arch/x86/io_apic.c | 14 +++++++++-----
>>   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>> index c384f10c1b..7b58345c96 100644
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -1586,14 +1586,21 @@ static int __init cf_check setup_ioapic_ack(const char *s)
>>   }
>>   custom_param("ioapic_ack", setup_ioapic_ack);
>>   
>> +static struct irq_pin_list *next_entry(struct irq_pin_list *entry)
> 
> I think you can make the entry parameter const?

Ok.

>> +{
>> +    if ( !entry->next )
>> +        return NULL;
>> +
>> +    return irq_2_pin + entry->next;
>> +}
>> +
>>   static bool io_apic_level_ack_pending(unsigned int irq)
>>   {
>>       struct irq_pin_list *entry;
>>       unsigned long flags;
>>   
>>       spin_lock_irqsave(&ioapic_lock, flags);
>> -    entry = &irq_2_pin[irq];
>> -    for (;;) {
>> +    for ( entry = &irq_2_pin[irq]; entry ; entry = next_entry(entry) ) {
> 
> I'm not sure where we stand regarding coding style here, but it looks
> you either want to remove the space between parentheses (my
> preference), or place the opening for braces on a newline.  I would
> possibly do:
> 
> for (entry = &irq_2_pin[irq]; entry; entry = next_entry(entry)) {
> ...
> 
> As I think it fits better given the small change and the surrounding
> coding style.

That works for me.

> 
>>           unsigned int reg;
>>           int pin;
> 
> Below here you can remove the:
> 
>          if (!entry)
>              break;
> 
> Chunk, as the for loop already checks for this condition.

Yes, thanks for catching that.

Regards,
Jason

