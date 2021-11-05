Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD4F446365
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 13:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222270.384368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyQG-0001RM-8I; Fri, 05 Nov 2021 12:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222270.384368; Fri, 05 Nov 2021 12:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miyQG-0001P2-59; Fri, 05 Nov 2021 12:34:20 +0000
Received: by outflank-mailman (input) for mailman id 222270;
 Fri, 05 Nov 2021 12:34:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miyQE-0001Ou-NV
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 12:34:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b13866cb-3e34-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 13:34:17 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2052.outbound.protection.outlook.com [104.47.4.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-frPjDaL1OYuAG_gX1lUW4Q-1;
 Fri, 05 Nov 2021 13:34:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 12:34:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.022; Fri, 5 Nov 2021
 12:34:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0072.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 12:34:13 +0000
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
X-Inumbo-ID: b13866cb-3e34-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636115657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IY3+tB01KnV66hCC8nS+KXB316mGWF0nPKRUL2Nl/rc=;
	b=JHZV9vd4QanvznIidaewjTOCLPmkAy0CFKMMKcc8WdrO8ojU0s605YfWu29OK2znO1xubU
	JuztvimRVQ44zRFFI6K8vWuDmj6axQvjTIQyBAsnkU2tE4XqQlZUumKl2APq4jtxx3MXcX
	Ayeoboug37PvS/yv0UawYhmacTAdbPg=
X-MC-Unique: frPjDaL1OYuAG_gX1lUW4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7R0Xv5Ld6OuRQ8hsDlU6coEom2JxV+rXvxmRQyOrn+6sSbPn75u6j+skmdQWmpA+gXr7m9YkaLzIlEAekFgMrgjnHrhNPbgNZy1bWPvK/Qjo4AtbwRd7KAwOoWZq9fiBLeZdw2LoBTHYRuiDqQtNc/LrczF1dNP4piPpc2+YfcChOG1wUtgeTLd9KZA+OZsDUVGCmPRwznOe0x191UZVdEzzPIyl+rF68wqbWjvvTgvtAu0c13E+k6ruvOEgPipFErHMNwpxonsa8XhxKWcEc5H4MljYiF/pDj+6Y5tmzql3goe9XvtRv14K7vOjONIFzLZB+FSSfe4icj+8kBizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IY3+tB01KnV66hCC8nS+KXB316mGWF0nPKRUL2Nl/rc=;
 b=DNn8Xj0XWZDD5nZlAkWwnPQKMx9AdVqYACinAi+XmQ2zQ7dVzHvRx3ogUThBHRo9OVkLDjpeMU4GiB+0NB/QyGTLaViQ6rqTCuXPLBZCRa3xVpZEnqO/bdRvbBSwQRNN3Zde4fFf7esaOpgwry6W7WbOi7d/DDf7h6wycQUlc5Q65En2F6XYcJlkeXns8/5/vneDmEWnLsU/lTmC9G1i+r511V6GSVxqUYzOyNG9SWH3XjA5iqsBBdUBbGYG9tPZJ8OHsDMBzVC6fuV/AVYLZdpReYUqw/8gVdHd3TMd8LU0HNy1IXT0qu20+4TgwJ1RzVRDPMrxRfSDy9mHyk4kxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e2c8dd5-e20d-5678-1fad-1b79fd8e06e4@suse.com>
Date: Fri, 5 Nov 2021 13:34:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH v2 2/6] x86/APIC: drop clustered_apic_check() hook
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
In-Reply-To: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f39bf716-1ebc-4d9e-055a-08d9a0589385
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703758B7F135D3049C9BDE1CB38E9@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BppUMrcG47H8MYWFscXO+Tdf4+NdVnj6bOSBHoZh7tOZMSb8fVXcyA7yqm/4O3U5IwCFnovlFtp886kYt92IixW4fQ1acW8R+6fYiycOUp70+xpScQ1uxZU2u+9oFjbbJ2u0qrnA7wyvQf/dy0g3WTptMl30oM+HFLrHdJxe7jMr7hTgFREkFyGthzlvIHC5Gb10exrwSA+fjhH+VRY6WIWOwVLPll/9yt9mfS6UCjI11Pbh2ybTsnczcbMCGlbORzRUnPKiBjN8EqOYK9oQZDsHLJoFflyQTh1MLn2NYGmZE5q6ClkIIJ3YD5Yi+PLbpTrBXvtaOBy3EetbYKmEvOUuCCeXt2fk5wYdE1f6D2ZFhSz95o6Q5RxKqjWkkNkz7640ZlO6fuwhKc1xJMe+3AGBblhwGQgR1n70awPTeRBdqdB6Weh+Fr7/gkPcMgOgKINBXQBKgqzL4lzDG0sE2LmI94XrGCe/diIbiHM2Sl/G4EZVf92wNnB8HefGim2NHoQxAWeQPm+lCS8w5mmEi8ZNaMjcIT4/rdtfT5AHwArv/Wgwbkwbb71/eGj4+NJUK7UCwhoqGcL64QQwT0sz9AhiOnsZFvRaleFTXcVmJi7MCTcyGCRPSSUN9a6VTb781cG4atRVtF9jmMPt2UfMX2pcrnwgt5kJARg3CIRTHgxJ2MrlyVosis4OrQauhTp9EtEVTWYoWNfSIl4ZG0Iy9GG80aBbBBb1Cl1xWKuNiS9M625cRRu6zPMhRm3hgKN6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(26005)(8676002)(956004)(66476007)(186003)(38100700002)(6916009)(36756003)(86362001)(31696002)(31686004)(83380400001)(4326008)(316002)(2616005)(6486002)(5660300002)(508600001)(54906003)(16576012)(66556008)(66946007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVg5TE56NW1yQ20veHdWbmhYQ2dnL2xiS1RQSFU5M2VKYVdnMjBqMEFHNWI4?=
 =?utf-8?B?V1lUQ0dMaGg1dlZ2YUY5Q1h2TUlTTXNmUFhQSk54cXlSa2ZyaUltKzI5N0Y4?=
 =?utf-8?B?dU83Mys1QVM2RzR6aEkrS002aGlxZjNaQmFuRk9xaUNQY3MzSnFHY3RnWEdi?=
 =?utf-8?B?S2VISVJhemFWS0U1SFJBK2REcEhjQmIwS2tNSSszSFRmalZTdDRXbVBZdklO?=
 =?utf-8?B?T2I5akF1Q3Q3eDVRWGM1YldNUHRUcU5KSTY2N25Fby95THNmK3NzWEZuVWtw?=
 =?utf-8?B?NG1QMDcwMU1ONThYcGhTMVpxMEduYmhIb0RBUVRSTjVJRFBHN3FXRE5xRWV6?=
 =?utf-8?B?TFc2ZFNFS3oxRUZVZzVaeE1QMnpDczBmaUdwYS9YcWVoMDhONDlmMk96RDBT?=
 =?utf-8?B?MUdyVm9mSHhFbUpQN3ZkY3JiSFZIdFdCdzN1MG84SkVpcS9DK3RWSXZMWmJw?=
 =?utf-8?B?cThqdFlJOHM5eHZ6YThLQ3hhanV2RFp3WjN1V1lkVTJRc3FLWXArSkpiVzU4?=
 =?utf-8?B?ZWIrVzlYZ2tEdCtVU2l6SDNxcXZqTm4vRFUveGZ5ekhlR0loZFlIWDEyU1FS?=
 =?utf-8?B?OHRiRXdyUWoxS3ZEUFpiOVh0TW93dC96Z3IrbGhYUTBycy95aUpuZ2tUUFZa?=
 =?utf-8?B?L1RGMEU3TWczRHZzakRjMWRUZVJHbmJWOFlNWEJCZzBNMzVMQUFNUmtJZEcw?=
 =?utf-8?B?czYwUldqMHRZOEIxTzkzeVRUc0JkS2RPcDZCVmRmaDRPdzRWemJ1c3QxekVy?=
 =?utf-8?B?dG1QaE5FSXluUWY5UlZjV1h2N2NTT3FlUVgweUdvQUdzVmZOUnVpTGpkOUtC?=
 =?utf-8?B?cEFBVmI4WTl5RHhQMjlIRDZrVmwzYzJSS1NaM2FOZ2JZMllHL3YzbDkrUU45?=
 =?utf-8?B?eVNLc01BNUFBcFA3TkhQNTZjWmdmMFhnRkZRZWVJMU10a0tQUGhmbm4zSHNP?=
 =?utf-8?B?ajROYmdsUGZoNkZrYkxPdGtlT0VLZjFBTG9UdGNqQVVjY1dRUGYra0VTdXdD?=
 =?utf-8?B?ZGJSM0txUzEvK21vMllOcUhkNmxXL3dNTnVxWkFPUHpCSDF4S3pKbzVRV3J2?=
 =?utf-8?B?a0s4dHZBWnIxbmtwTXVBdWtOblRzRzdyWUJEQ2ZQV3V4VHVuamMrcDdoTWNN?=
 =?utf-8?B?TTZzK082dEgyOHNRZ2ZNUXJJOFExZTJqM05rMUVtV3I3YTNyVG04dUxLM21G?=
 =?utf-8?B?aG5HRmI0SGRnUzhXekhjZUlLcHo4VWN5cHZBbUxTVWtQUGhQbWxJRVF1MWhl?=
 =?utf-8?B?amdNWUozczFhZ29FRzVYMzJsRVdmcUZEMEtvak9UbENPMFlZR3MxZklMbUtG?=
 =?utf-8?B?eTJWcVlGY1hLWXVPOHJzTXpUY1l5bktKd0YzY1F1d3dTYlBHanFLbmp2TDdD?=
 =?utf-8?B?bkp5Ny9WV1R5QnFiMklPQjZydm11RFJOeHh5WjlJdElRc1pFM1RUYlVhL3FK?=
 =?utf-8?B?cXFHR0h5bVQ5b3pmd1p2eW40YVJZTnlVT1VBeFZXMkNMbzhqYU9YRGk0MnRD?=
 =?utf-8?B?UDN1YytHQTA3SVpRVFpDWFlHbDNsS2k0Um5yR0xCSUkrby9TZjJTVnJqVmcr?=
 =?utf-8?B?TFpLS2ZkTklVZUwzQjZBRVZMNCt2dmVRZVY4UG1icDF5ZXdiTmtPNWlmQmZI?=
 =?utf-8?B?M2hka1dtTFhRZjJCVWkreFRiOHlRaEhqQnc2eUZkaC9FRnhOc0ttMllBYzV5?=
 =?utf-8?B?UHVBb2ZPbHI3SjZhRUxFcjU5Nm52S2d5SFRYc2owOG0rQi8xQzNzbjdNVkkw?=
 =?utf-8?B?aEIrRWFFSVFFc2EwQUZDaGZPRzBlWGs5eG92ZktKU3dCNGJtaGFWc0UyVG1q?=
 =?utf-8?B?U0ZtQm9mSVQwUm9wM2tQQlMvbmxjOElraUovUHhTZkRMUVBsZjhTWHVuTFpJ?=
 =?utf-8?B?VkQwSmJuNzJvejcxZzJZN3dnSDh3T0dyRUdxZXh5clgvUWswOG9UdTU4bmdH?=
 =?utf-8?B?M21nQXltbmV6TXRvczJZNVQ5M2VzVEJXRHprY1FWOEhJaW9XQktweGN4aG5K?=
 =?utf-8?B?Z3c1Um5TZHRycGNobVNJZ2w3UFlpNE5GOStaVjN0U2tBUnJMS1NlM3c3VHlD?=
 =?utf-8?B?Vm9mZEJaZi9SbFB3QU5aS0FnWWpicEpDL05wRndqUG9tVDZsZWlud1ZKMmx2?=
 =?utf-8?B?ejBmcXI4ZDVwREl2a1dxdEwwaDBhcm5MOWp0S2kvV0dpWXdCZW9zZDJzVTRL?=
 =?utf-8?Q?yjFErOq//qdgkeHIsfZt9cU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39bf716-1ebc-4d9e-055a-08d9a0589385
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:34:14.3539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oo6VaNffHIC7lPi6AuBdRTjs9KbdJjoIDwPujLA9mGeAKOeNDG/ABRbhC5swhSRXjnuxroQxuFtaqqGc94l/Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

The hook functions have been empty forever (x2APIC) or issuing merely a
printk() for a long time (xAPIC). Since that printk() is (a) generally
useful (i.e. also in the x2APIC case) and (b) would better only be
issued once the final APIC driver to use was determined, move (and
generalize) it into connect_bsp_APIC().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -674,9 +674,7 @@ static void __init acpi_process_madt(voi
 			error = acpi_parse_madt_ioapic_entries();
 			if (!error) {
 				acpi_ioapic = true;
-
 				smp_found_config = true;
-				clustered_apic_check();
 			}
 		}
 		if (error == -EINVAL) {
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -243,6 +243,12 @@ void __init connect_bsp_APIC(void)
         outb(0x70, 0x22);
         outb(0x01, 0x23);
     }
+
+    printk("Enabling APIC mode:  %s.  Using %d I/O APICs\n",
+           !INT_DEST_MODE ? "Physical"
+                          : init_apic_ldr == init_apic_ldr_flat ? "Flat"
+                                                                : "Clustered",
+           nr_ioapics);
     enable_apic_mode();
 }
 
--- a/xen/arch/x86/genapic/delivery.c
+++ b/xen/arch/x86/genapic/delivery.c
@@ -19,11 +19,6 @@ void init_apic_ldr_flat(void)
 	apic_write(APIC_LDR, val);
 }
 
-void __init clustered_apic_check_flat(void)
-{
-	printk("Enabling APIC mode:  Flat.  Using %d I/O APICs\n", nr_ioapics);
-}
-
 const cpumask_t *vector_allocation_cpumask_flat(int cpu)
 {
 	return &cpu_online_map;
@@ -43,11 +38,6 @@ void init_apic_ldr_phys(void)
 	/* We only deliver in phys mode - no setup needed. */
 }
 
-void __init clustered_apic_check_phys(void)
-{
-	printk("Enabling APIC mode:  Phys.  Using %d I/O APICs\n", nr_ioapics);
-}
-
 const cpumask_t *vector_allocation_cpumask_phys(int cpu)
 {
 	return cpumask_of(cpu);
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -75,10 +75,6 @@ static void init_apic_ldr_x2apic_cluster
     cpumask_set_cpu(this_cpu, per_cpu(cluster_cpus, this_cpu));
 }
 
-static void __init clustered_apic_check_x2apic(void)
-{
-}
-
 static const cpumask_t *vector_allocation_cpumask_x2apic_cluster(int cpu)
 {
     return per_cpu(cluster_cpus, cpu);
@@ -175,7 +171,6 @@ static const struct genapic __initconstr
     .int_delivery_mode = dest_Fixed,
     .int_dest_mode = 0 /* physical delivery */,
     .init_apic_ldr = init_apic_ldr_phys,
-    .clustered_apic_check = clustered_apic_check_x2apic,
     .vector_allocation_cpumask = vector_allocation_cpumask_phys,
     .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
     .send_IPI_mask = send_IPI_mask_x2apic_phys,
@@ -187,7 +182,6 @@ static const struct genapic __initconstr
     .int_delivery_mode = dest_LowestPrio,
     .int_dest_mode = 1 /* logical delivery */,
     .init_apic_ldr = init_apic_ldr_x2apic_cluster,
-    .clustered_apic_check = clustered_apic_check_x2apic,
     .vector_allocation_cpumask = vector_allocation_cpumask_x2apic_cluster,
     .cpu_mask_to_apicid = cpu_mask_to_apicid_x2apic_cluster,
     .send_IPI_mask = send_IPI_mask_x2apic_cluster,
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -410,7 +410,6 @@ static int __init smp_read_mpc(struct mp
 			}
 		}
 	}
-	clustered_apic_check();
 	if (!num_processors)
 		printk(KERN_ERR "SMP mptable: no processors registered!\n");
 	return num_processors;
--- a/xen/include/asm-x86/genapic.h
+++ b/xen/include/asm-x86/genapic.h
@@ -32,7 +32,6 @@ struct genapic {
 	int int_delivery_mode;
 	int int_dest_mode;
 	void (*init_apic_ldr)(void);
-	void (*clustered_apic_check)(void);
 	const cpumask_t *(*vector_allocation_cpumask)(int cpu);
 	unsigned int (*cpu_mask_to_apicid)(const cpumask_t *cpumask);
 	void (*send_IPI_mask)(const cpumask_t *mask, int vector);
@@ -54,7 +53,6 @@ extern const struct genapic apic_bigsmp;
 void send_IPI_self_legacy(uint8_t vector);
 
 void init_apic_ldr_flat(void);
-void clustered_apic_check_flat(void);
 unsigned int cpu_mask_to_apicid_flat(const cpumask_t *cpumask);
 void send_IPI_mask_flat(const cpumask_t *mask, int vector);
 const cpumask_t *vector_allocation_cpumask_flat(int cpu);
@@ -62,14 +60,12 @@ const cpumask_t *vector_allocation_cpuma
 	.int_delivery_mode = dest_LowestPrio, \
 	.int_dest_mode = 1 /* logical delivery */, \
 	.init_apic_ldr = init_apic_ldr_flat, \
-	.clustered_apic_check = clustered_apic_check_flat, \
 	.vector_allocation_cpumask = vector_allocation_cpumask_flat, \
 	.cpu_mask_to_apicid = cpu_mask_to_apicid_flat, \
 	.send_IPI_mask = send_IPI_mask_flat, \
 	.send_IPI_self = send_IPI_self_legacy
 
 void init_apic_ldr_phys(void);
-void clustered_apic_check_phys(void);
 unsigned int cpu_mask_to_apicid_phys(const cpumask_t *cpumask);
 void send_IPI_mask_phys(const cpumask_t *mask, int vector);
 const cpumask_t *vector_allocation_cpumask_phys(int cpu);
@@ -77,7 +73,6 @@ const cpumask_t *vector_allocation_cpuma
 	.int_delivery_mode = dest_Fixed, \
 	.int_dest_mode = 0 /* physical delivery */, \
 	.init_apic_ldr = init_apic_ldr_phys, \
-	.clustered_apic_check = clustered_apic_check_phys, \
 	.vector_allocation_cpumask = vector_allocation_cpumask_phys, \
 	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys, \
 	.send_IPI_mask = send_IPI_mask_phys, \
--- a/xen/include/asm-x86/mach-generic/mach_apic.h
+++ b/xen/include/asm-x86/mach-generic/mach_apic.h
@@ -14,7 +14,6 @@
 #define INT_DEST_MODE (genapic.int_dest_mode)
 #define TARGET_CPUS ((const typeof(cpu_online_map) *)&cpu_online_map)
 #define init_apic_ldr (genapic.init_apic_ldr)
-#define clustered_apic_check (genapic.clustered_apic_check)
 #define cpu_mask_to_apicid(mask) ({ \
 	/* \
 	 * There are a number of places where the address of a local variable \


