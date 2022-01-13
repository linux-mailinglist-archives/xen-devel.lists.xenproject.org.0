Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EB748D93C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 14:41:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257219.441933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n80MF-00047z-JX; Thu, 13 Jan 2022 13:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257219.441933; Thu, 13 Jan 2022 13:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n80MF-00044v-FX; Thu, 13 Jan 2022 13:41:39 +0000
Received: by outflank-mailman (input) for mailman id 257219;
 Thu, 13 Jan 2022 13:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fwfT=R5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n80MD-00044p-VG
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 13:41:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87534972-7476-11ec-bcf3-e9554a921baa;
 Thu, 13 Jan 2022 14:41:36 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-pVaJxzSqPB6l0r-nqH7K5w-1; Thu, 13 Jan 2022 14:41:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 13:41:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 13:41:33 +0000
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
X-Inumbo-ID: 87534972-7476-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642081296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=thNfMlJdzI98E9imj7jN+m1XRtQXnjAIICQ8w5+ivuU=;
	b=OE5GiKy+wZ+qNsvqyht/2PI4D13lzEBTT8aIK34QcQ/lDauFof9G07wZpu0BoR70fmc+fK
	+lnJEcLHIqGyiJdy8H699aJND3jyAq0gTZpi7cn8VxKRaRm0mCujJBFIv9smtUCz5w7Gcu
	41yoDHv0FJk5xGbGSYU2r4aaIj1cagM=
X-MC-Unique: pVaJxzSqPB6l0r-nqH7K5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fL5sbfF1zhycmj6rRmw1B9zYZsTLGMn5JFRfyH8kdKJ8nfySflMRGJArEE98ugRvVNNYm/9+BCpnx9sx8P70BYTdKQyR6bH+vjBPPtWSSqByCGlejmA6Z6lA19bRlRTNBnM6jK4ZfNFn9UgFIQqlY7Z5LD2N1ly2HwVmusqgcKWFelWtKaZx8LheOpTejoDT4VrHe6v4HH9yO9E5m7HjE+ODiiYOkJhjeTB1eIRJEwDx4tDLuk3XUSEnWaNSMUDjDKvG3jehOk/9o+bDAAgsABdrRmaX678na1y1ZiSCkcK46lz/CJmIwG+DMhkl4XnWGU5Nf6IjO/40/d/+aLIK9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thNfMlJdzI98E9imj7jN+m1XRtQXnjAIICQ8w5+ivuU=;
 b=QzY5Yp/U4pYK8nf/K6LQoUwt/1Av3w0fKePW99b3iyyJyYyXNvD8O9asqXWg20doc3nWP3UAfK04R4r613YRQXiETevlres2oVDnuSvHYV/yxdQX7kEbvv06Xabbz5cQhfBJ564I815vOkXx7uD0tRiBh2ob62pprJwBaPHDF+Dx7XarzBl8DR3q8tA+YJJSZ5r4XaDwZu+TT/u2r7lpiOYxfAjx9zOPFJR994u5QKZy1QFeInUhMzVhkB8I6WGPYBChocB82SC3TKDlpxODONH493Q5DiAEVfKuBIARkI5qQIYx5p3hOVvoPP/dGCJHJ5/Y+yj/xNY7Eh0PDXPmjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c50c7b6-e521-e34f-1808-a4e2961b807e@suse.com>
Date: Thu, 13 Jan 2022 14:41:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/time: further improve TSC / CPU freq calibration accuracy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0072.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1491485-c243-4da6-9dc7-08d9d69a697b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4605CB325DD388CC89B0B5EAB3539@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h9kjA9fg8Ja6zVMDeDgN1y/bL7p9L4n8U657Ji5MVUlzyiVBLaS/5c32UvRJ+wZ8YatBx1OOi/NcJVPICLA3JxfWdauEkaz+fidxXlviE9ifJSWtYl7jc6beBY0VXIEk2lO+WyaDh86LB2ThuQRWC/q/p3CMW1xparvT9OmrqmUgPHvlftX7GfGzl1AALhty6oTz3cOgGHI3nfwkPn5vgsKBYUm1jYtlq2Zu6Rn6I4t6ntxCFPZ3ZFNWuzuQPz6muOvGDtFuDUp5iNFL3UDl2f4A3GYirMwW6wkzWbzknA3aXryAgYjK4P6Vhx4WXXKSHmqsdxvkc8xvA6FjdawcVT+wseoFPneVQUOXKmXLq17IyROJVYPQ/hlg33pjUk6vOzQNFteCdSHwZULttFopistAaduGqvmS6iXKKqVil+DbTZz3FZC/pbBlVGfDXrwM1urUDbn1jJBZaptW5RXTVSE1EmwcwRJjGgUOGPAWGE/xD1HygbVyHqAxNIHKDAEBVpEhXtis+46jVh2tZhuE4c31/bzf+gSozq7ppZnn3wvJP0t9VwwQaCWYdDcGg015Baiw+ahrXv5EO2UUx/orcXxwHIXMpT0JzOUUnzT0bcA7qzg2mXLYsAPFf0vxnT/PhsLY3H++73Y0R3Sx/MbjiapaIIwNTUhDAkjRN8d6HbzEOXHkTZq1OPJQCHW/1DMzuyDMVERSSmCDhZAC2YpnXdi5YsFAIjCyYDM+OggLJ52vCwphWHaWusDGnRwieDpE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(2616005)(4326008)(31686004)(8936002)(31696002)(38100700002)(6916009)(508600001)(8676002)(66556008)(5660300002)(66946007)(6486002)(83380400001)(66476007)(6506007)(186003)(26005)(54906003)(316002)(2906002)(6512007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTNlZ2J2UVVlanFPeWo2TDVsaWF1THdEbm1lQ3NCSWtmYmZhaUh3Wjd5SkpO?=
 =?utf-8?B?K0F1S1ZnYnlZSjg3cHRHY1FzdDBrbTZ2TjZ5U3VJSStrc2daSFZHelZwNHBY?=
 =?utf-8?B?ZnozWk13Q2RiWUgwL0Q0elZheUhLdTZRSmk2SU5xSmRvdjJUR0NTeHlUVDJO?=
 =?utf-8?B?TE5CSWI2TitsME9TaHdGMFZKR2hSL1NRQlNQS0JXQ3ZkUndBdTBBVC9sN1Qw?=
 =?utf-8?B?UFRXeDBHN1d3L0wrcFpGTnA0djYwUm52aVZCak5XR0dFaWg4VVhMeGhPMDBF?=
 =?utf-8?B?QmVuNDlVWVhQK0xTZHhGallXT1ZlT3pwQk16UHZQd2VkVjF2TWpRUmR4cjA3?=
 =?utf-8?B?S3U1eG1lMjdKc2lpREtLS25vMVBLZmQ1OCtnTmR3QmptMzFCek1hVFdQejdi?=
 =?utf-8?B?S0xCOVVlK0Q5ZXNwZ0szNTIzZ0RQdHNCL2hMa01XT1VweDV2VlNGR3lBYkdR?=
 =?utf-8?B?WTdtVlh0Y2FMTGxJVkFlVGhEMXZWK2pmVDREZU1iRW5KV0syUk02RndmQlhR?=
 =?utf-8?B?Q05ibEpuUDNrNWhQMHh4bnZ6YUxSNS9QcmxPWmx2dGFHeHk1WkI3YmhhWlAz?=
 =?utf-8?B?L0M2anpuNHhZaUs5U1hvZWQrZjJRM2hiRlJoOUcvd3A0SkNnRE9SUTJVZUhw?=
 =?utf-8?B?TS82TzQxclJKWm94L2RkNHRua0tuVk83dnlMRkZ3L0dXZFRlWE9qQ1RYd1FC?=
 =?utf-8?B?RUtXK3NwMjVqUWI5K0JqdFc4a29Md0c2Y3hwZnRBeXRXMG04Q0h3bG1yN200?=
 =?utf-8?B?V040cmxpdUVneHhySmtNdUllTkczZjg4SWZhVEp5QStUaWxnTU9KYm16U2Rk?=
 =?utf-8?B?dFpRMFBNRzdGN1pFdXZTcUZFUUFpRlNUeC9Ea1IzRG9ndGgzR3hmSG5QZjNL?=
 =?utf-8?B?Unc5YlNtNkU5ODZudkpLUFpncGF4akpra1pwQWdodWNZZUdzU3RYN2xBekhp?=
 =?utf-8?B?eDEramRZSGRDV205cVphcXZyWlU5Q2tEWXdyKzllY0tvV1lURFRtcHVJL0I1?=
 =?utf-8?B?dzExTzliUTA1ZldubklDV0ZncFRqYXhmdDBNMXZicUlYUnpJL1J1VXdaQml2?=
 =?utf-8?B?czZiQWhkUXlHQzJuVzloWFNFWnR5MiswK0hPZWRJd1dGRmVaekJzRVhQZ2Mx?=
 =?utf-8?B?MlUwSSs4TmFhdHhqS2RqNTU3RkNuSlVXK3V6UTNqNXpBTEZpS29yNytGWVlP?=
 =?utf-8?B?U01BcHdEcUZZWGRHZkZDVStYZ0xRbGtJOFUyTGZ5UkRKSGxUTFp6L0l6alVS?=
 =?utf-8?B?ODlzN1V1Q2VRaENWL09pT01tMEZOK0l0QkRkcnU5VHFjc3E4L2VQMFhLWWoy?=
 =?utf-8?B?SVJ2SlU4eGo3VCs1WFdsV0pidllad0ZZREp4d0JNYkZXeUs4cXN3MG1aOXAv?=
 =?utf-8?B?dForMVJkV0NCRDFJbUdwOXFUamxKeUxvN25BaE1TQ2xHY0JaUWZKS0JDV21S?=
 =?utf-8?B?QjhCaXZMMU5hUEkxUDZIWmRzUkxnelJXcFdQenUrVjFKL0xQRkw0VHBFN2Jz?=
 =?utf-8?B?RzZJTVFnUmdjbXJQNVRJeGJyWEI1Z1hBMEF3bEpDdWV6a21tbDdwL1ZCZUkr?=
 =?utf-8?B?MkZjTklCdVIrelVvMStDK0RaekM0WGkyakhVUFdidENjRSttY1owVFdOL3M0?=
 =?utf-8?B?NlhNOWR5RlIvUWdNQjN5NGwxenp5QmV4Zm52cU90VlhLTGdJVkw1aHJYVjlX?=
 =?utf-8?B?czc5YTBxd2dZZWZqNVJPZUd6eXpLbi8zaXFHOG00N2ZmemZMZ3VnbElrcWlw?=
 =?utf-8?B?TGZVSHFIV3lKZ2tNZGx0Y3NaM003KytTRTlMZXJ0b24yNlpXNmk1RmRXWjlE?=
 =?utf-8?B?QWJCNWIrODlYRUN2ODVuaU5LSDQwWTYvdUljNmJESkVZT3RTcHVKU3BNcjFG?=
 =?utf-8?B?czFNK1dTZjdyQmJIcWduUllsS3JENE5RYlM0UUgyTUVzTWlzVjI1c1JzNHVP?=
 =?utf-8?B?bXAvOEgvVGZ4OXpMcWQ3NFYrRDB2SUJvaHpjQVFaTFBpQmlxcEJxK1Y5eVlR?=
 =?utf-8?B?ZGEyTEVkV29EV0tWUlA1VXk0UXZ6YWNmWUVQdXVxcGdNMW1raGNYdDcydzZU?=
 =?utf-8?B?cFloSkprenFlSUNXbzRQaFpXcnNmYUdJKzNheFJkM0tMUXhldWMvNmprUUlv?=
 =?utf-8?B?WHpvbDA3YzBDcEFCZGwvQm9LVXM1UHFYL0RyY1ZqYm8xSmNLM1FLNmlhMEtU?=
 =?utf-8?Q?TRZiy/HL/tEb7W5mDm7Mhpw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1491485-c243-4da6-9dc7-08d9d69a697b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 13:41:33.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mGJOwjI0tYugDopapfA+jjA614DRNkPcC0DJxnjh38kuraXbnvhZdDDpwLQ2DqQbPLsLqxRlKOCS+L6F9ej9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

Calibration logic assumes that the platform timer (HPET or ACPI PM
timer) and the TSC are read at about the same time. This assumption may
not hold when a long latency event (e.g. SMI or NMI) occurs between the
two reads. Reduce the risk of reading uncorrelated values by doing at
least four pairs of reads, using the tuple where the delta between the
enclosing TSC reads was smallest. From the fourth iteration onwards bail
if the new TSC delta isn't better (smaller) than the best earlier one.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Obviously (I think) instead of having both read_{hpet,pmtmr}_and_tsc()
the calibration logic could be folded between HPET and PMTMR, at the
expense of a couple more indirect calls (which may not be that much of a
problem as this is all boot-time only). Really such folding would have
been possible already before, just that the amount of duplicate code
hasn't been this large so far. IOW if so desired, then perhaps the
folding should be a separate prereq patch.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -392,9 +392,36 @@ static u64 read_hpet_count(void)
     return hpet_read32(HPET_COUNTER);
 }
 
+static uint32_t __init read_hpet_and_tsc(uint64_t *tsc)
+{
+    uint64_t tsc_prev = *tsc = rdtsc_ordered(), tsc_min = ~0;
+    uint32_t best = best;
+    unsigned int i;
+
+    for ( i = 0; ; ++i )
+    {
+        uint32_t hpet = hpet_read32(HPET_COUNTER);
+        uint64_t tsc_cur = rdtsc_ordered();
+        uint64_t tsc_delta = tsc_cur - tsc_prev;
+
+        if ( tsc_delta < tsc_min )
+        {
+            tsc_min = tsc_delta;
+            *tsc = tsc_cur;
+            best = hpet;
+        }
+        else if ( i > 2 )
+            break;
+
+        tsc_prev = tsc_cur;
+    }
+
+    return best;
+}
+
 static int64_t __init init_hpet(struct platform_timesource *pts)
 {
-    uint64_t hpet_rate, start;
+    uint64_t hpet_rate, start, end;
     uint32_t count, target, elapsed;
     /*
      * Allow HPET to be setup, but report a frequency of 0 so it's not selected
@@ -466,13 +493,13 @@ static int64_t __init init_hpet(struct p
 
     pts->frequency = hpet_rate;
 
-    count = hpet_read32(HPET_COUNTER);
-    start = rdtsc_ordered();
+    count = read_hpet_and_tsc(&start);
     target = CALIBRATE_VALUE(hpet_rate);
     while ( (elapsed = hpet_read32(HPET_COUNTER) - count) < target )
         continue;
+    elapsed = read_hpet_and_tsc(&end) - count;
 
-    return adjust_elapsed(rdtsc_ordered() - start, elapsed, target);
+    return adjust_elapsed(end - start, elapsed, target);
 }
 
 static void resume_hpet(struct platform_timesource *pts)
@@ -505,9 +532,36 @@ static u64 read_pmtimer_count(void)
     return inl(pmtmr_ioport);
 }
 
+static uint32_t __init read_pmtmr_and_tsc(uint64_t *tsc)
+{
+    uint64_t tsc_prev = *tsc = rdtsc_ordered(), tsc_min = ~0;
+    uint32_t best = best;
+    unsigned int i;
+
+    for ( i = 0; ; ++i )
+    {
+        uint32_t pmtmr = inl(pmtmr_ioport);
+        uint64_t tsc_cur = rdtsc_ordered();
+        uint64_t tsc_delta = tsc_cur - tsc_prev;
+
+        if ( tsc_delta < tsc_min )
+        {
+            tsc_min = tsc_delta;
+            *tsc = tsc_cur;
+            best = pmtmr;
+        }
+        else if ( i > 2 )
+            break;
+
+        tsc_prev = tsc_cur;
+    }
+
+    return best;
+}
+
 static s64 __init init_pmtimer(struct platform_timesource *pts)
 {
-    uint64_t start;
+    uint64_t start, end;
     uint32_t count, target, mask, elapsed;
 
     if ( !pmtmr_ioport || (pmtmr_width != 24 && pmtmr_width != 32) )
@@ -516,13 +570,13 @@ static s64 __init init_pmtimer(struct pl
     pts->counter_bits = pmtmr_width;
     mask = 0xffffffff >> (32 - pmtmr_width);
 
-    count = inl(pmtmr_ioport);
-    start = rdtsc_ordered();
+    count = read_pmtmr_and_tsc(&start);
     target = CALIBRATE_VALUE(ACPI_PM_FREQUENCY);
-    while ( (elapsed = (inl(pmtmr_ioport) - count) & mask) < target )
+    while ( ((inl(pmtmr_ioport) - count) & mask) < target )
         continue;
+    elapsed = read_pmtmr_and_tsc(&end) - count;
 
-    return adjust_elapsed(rdtsc_ordered() - start, elapsed, target);
+    return adjust_elapsed(end - start, elapsed, target);
 }
 
 static struct platform_timesource __initdata plt_pmtimer =


