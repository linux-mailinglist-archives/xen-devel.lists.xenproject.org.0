Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C494676FA
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:03:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237480.411878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7I2-0002Wc-Nt; Fri, 03 Dec 2021 12:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237480.411878; Fri, 03 Dec 2021 12:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt7I2-0002Ug-KI; Fri, 03 Dec 2021 12:03:46 +0000
Received: by outflank-mailman (input) for mailman id 237480;
 Fri, 03 Dec 2021 12:03:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt7I1-0002ST-DU
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:03:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1013ebcd-5431-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 13:03:44 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-Bog92kQBPyaBRnbAxCAPLw-1; Fri, 03 Dec 2021 13:03:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2958.eurprd04.prod.outlook.com (2603:10a6:802:a::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24; Fri, 3 Dec
 2021 12:03:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:03:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:20b:c0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Fri, 3 Dec 2021 12:03:39 +0000
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
X-Inumbo-ID: 1013ebcd-5431-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638533024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuphnGsPrrpPYXSMHIcEABMTB/3qmzYatmHPuIsrm+E=;
	b=AjypZCwIacqcN3CuRRm65uv+u0/0I+iXXJ19sKuftldKJ9BYPiXeOQJiWee2nbqMxBhoEj
	4z8r8lVCem0GmTUahXclFATA5qiCY6TnQokt3ZUzTwYnZDateT1T418eFI/JDYHCnzVFRS
	50rfYFUxuKVeXDixoIdsSHCsVsjSpkY=
X-MC-Unique: Bog92kQBPyaBRnbAxCAPLw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmuV8VC2L4FoV4b/VDdNIFRLt5iFAwkl0kpn+WRgcBxuuzHfVOHH1KDcBO+62MT+f4lFaU07tq/y/U586BobRiBBb3rk4cpuDhWzdxk8dE0JCsH1yVGHKhKequOE+ioI6FLFj2Gm229PBAmXRKuyHLPVeUQmceIaezMYD1wavAndI8xMrBzt+UBmfkgTV2X4LimU1W8M8LNUH/08vnZtXywBbEtFeCzKMLTVu2JPTjn1AWtygOqYYm35S6Ll6GnjlQfFgM74QwVUW6NpjtIkFHjKEOVe4Ax/HoJ+UDNo7nq9YqFxk3QoVguVEvtt3P9Cl7rIq7M0NhDy6GZ1G9HzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuphnGsPrrpPYXSMHIcEABMTB/3qmzYatmHPuIsrm+E=;
 b=GimHJ6/i3ROjsM4Jq/I/QdJOeYqGo8PlPgxZur6QvyNGIY+yszG4fZ2V+eXSTc898cLofLhC4MrF1fvEMFqCK0pJEtSre327TSX4j7TJTvlMqGAm5MC7/HDM0TrAeV7HQKSQ4BVTAExLFvJPhSH6AQWZ20/eKtZmiJaoiVCY/oLho2+tJgPhWjZbSq+wCjFw+FNSq3SPBCD/zky257dZF3rBK5wiAIySsSOT4LUVyzg4eiwoppyU7xcGrVSF9KtOgd8Ig67iUwXErSIanDkL1GW89oljCDgy1LRCBoe1X4RRgWzoKSRNZHXQEN2oW53vcLtzgvjriRm/pdhzzLDGQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22325915-c51c-a091-59e2-e6e214576f80@suse.com>
Date: Fri, 3 Dec 2021 13:03:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 1/5] perfc: conditionalize credit/credit2 counters
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
In-Reply-To: <57038a1c-671b-f0f9-1bf1-0ff9bae6e2dc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0027.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1a81c85-d218-451b-f80d-08d9b654f269
X-MS-TrafficTypeDiagnostic: VI1PR04MB2958:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2958077BCC52361807F3D924B36A9@VI1PR04MB2958.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Dj7w4jnu5FJAQimA1BSCsu/wfRpyTlcUNDvsdLQpqZ1AafJOVTFT86Od7a1wNIg7kXaJ83Hpe0rHRdRuCJlV+yw12bn59+CqwS8ApS+zh0hEhEGlhWV4M1dM8dTT49qx+6zHyBHMyanK1s9fw4ZvH8MBZUU2l67nHopnNfqzlb8wwyLQIA1lM0aMyYp0V5mvU4vMjJM9KJTBB24cE6AkR3bmzIYy9HcsUYT+nejJRYtfwlXHxaevGcX2pVeqZHv+1cOzFRZX3zSS191ycedmMSPGKUgnJPzNBtL1JT4KoZP+C+NxIB4Ac+1FWODNiMGyeLlRK2/GRZwABL0tDCpHPHpV71w4fVgs0qZMpLlpndEt7AXIc8Z4aIR3B4/8JS7MtvJ0gqcVm2yapy9aCkNvn+tqf95sNH+QWjQvsuctqZWWaiJ36WLpItk2Jtt+AM/uNamXOsVHdmKJII6LaZ76q2FpR8wm/gCIDpnsk+0yiSetsuVvmBFObWV7vakqrgGZ6IJNOjNKEL4ssD7tOvaw3hEZz1zXaVJzzyCR/PTonoTpGCmVGcuLvr19WKI5bIHMER/56Qm/oEmN2/ts86sWv5ZUs4IHQrso3jKVc08+rW4SRd6yaITzhG5D6tlaWTHSoHEWjP7UviJRe7UV8Guf2fru3LLqTXhQrR4ArTtTrEgF3gcx9bEXVUicZIZzodJbsSPcm5iBSVaHLCjVYvF4b6GYcFgN0z3pyCbmf1B0DI4B3IZxXdSNqYS2zs3PMRT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(66946007)(8676002)(186003)(66556008)(956004)(36756003)(38100700002)(26005)(4326008)(8936002)(16576012)(31696002)(316002)(6916009)(508600001)(86362001)(31686004)(5660300002)(54906003)(2616005)(2906002)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejFNaXNGSWc3empodHpweVdjS3dLM1ZrU21FT0ZKMVV2Z0ZQRXlDUlhXaUNM?=
 =?utf-8?B?U1dUT1lJZnlBWEM1MHBqSUd0eGZscmhCTnByZk1SOU1wNlpET2Y2b1NjUU1E?=
 =?utf-8?B?MWZ2U0RnaVRJZ3FZZjJzYUdpbFEzcHVuU1NYbHJjWU9meDU4RTFxQmw1S2Uw?=
 =?utf-8?B?TkRGWjUxTXVSTE9GQkhFanBqaXBWR3l5UWtUMzRIcmM5VExZQjVHVGpTQmRY?=
 =?utf-8?B?S1paNXBHU0hVZ1JTYTJ6a0hrMG8vbGRpNGRFRzVnMlEwZ1pTRkp5bHIwb2Uv?=
 =?utf-8?B?SUZHaWpBT2dDWGFWamVIOGphWmlUcGZIRWtvKzZRTWNKbFlqNEpralVKMzRy?=
 =?utf-8?B?UkQ5ZS9QWGFBWkZvT1MwalpEQnpJQ0N4MGcvUDRIQ2c5MFBiS2x3d2VHYmQx?=
 =?utf-8?B?YXpjUzd0Lzd6cFBhWEx5MHJmdW15b2RIM0RoU0RSUytVTXdpTGx0VzJVUXpT?=
 =?utf-8?B?TmZxSTdEbUxvYURoN1VIME5KUlk4YU9DNGpPdmtUT2poRXlrYm5wdnI4dGk4?=
 =?utf-8?B?NGVUNFVvdnJWaUlTd0lIYzN2ZzBnMGg0blZ2cnlhVzRtaVl3TTZyWVNYL1Y1?=
 =?utf-8?B?YkV3TEFLbDM0OGJmdUZxdkwyblRyeWR2OG5JODF4dXByRklsaGpESG93bExB?=
 =?utf-8?B?Z2Zkd1dvVUkrSTZTZ2pWL0p5akhxZGwvVHBFOGp1RmorRXdFSkswOEh4ZmR6?=
 =?utf-8?B?YzJBdE84QXUyRTRBRGdDUEpJajRQOVA0d0FWY0RCZlA0Mm1XWWNud3A1NnlW?=
 =?utf-8?B?L3A2NGd3T1o3aXBwNmpCS3dvbTJqbWlkaG5meXR1bjE5bTZ2Wm4xU0dGNTEz?=
 =?utf-8?B?VWlHaXUwYTQzNytNSGlPQS9aNmY0cXFnaTN4LzdZd0Z0TEdzblEvK2dXcWJQ?=
 =?utf-8?B?eFdadk5xci9nNldZUVlZVHJpN3QwazFNeU5GbDRlSWR0aWlQd2x4U0g1aTlu?=
 =?utf-8?B?T200c2lwM2ZablZPTjVnOTAxZjVZMFdFT1hWd1lUK0x2WnU1eit1ZzBKWmEr?=
 =?utf-8?B?cW5ndVIyRFYxQ2F5cVRkTkVxN05ma29MZlRHVWl4ajRDemdtUlNnS0t5YjZ5?=
 =?utf-8?B?OW9TMzVPUEEwRG9SK2xIc3djdU4wemJGMHhWbGJuZ1IxY1NNMlhuNWxUNFdY?=
 =?utf-8?B?QkZZSDdFY0lLSkNrTDl6SW1IVkpndUFlUUt5eWhoWU40MWx0UWJ2WVpkdnZL?=
 =?utf-8?B?MzVNVkIwOVk1Y3dEOUZYcXZwb1dVdzIwTFMzWlFQR0J3OE1xQ3VGMFdrK2JC?=
 =?utf-8?B?aVhXdXkvUXJ1aHU1TGFqbUNmUkhFQjZudGZmZmJZZXQ1WlJiaHJvZFcrZEtp?=
 =?utf-8?B?ZWE1aGlkUTVhV0puUWRJM1JmSytxV3hlSHNTOGljSUJ3dUwvVlozdjU2cS9s?=
 =?utf-8?B?UmxYYzA3cWhieUs5aXR4THc4b3FMUmNsTzdsS1BGdWdSY2pTa2YxUlRyaVlX?=
 =?utf-8?B?SnBJNDV3NmlvWDZYdExqQUVvbWNhYU5PeXN0Zm1VaDRVWlZNcFY5RHBBeGVL?=
 =?utf-8?B?QlR2YmxNV0krVlZwNkJZWkJscWEyYWtZNWl4ZTJPSGdUQ3NWanBPV0h5b0pz?=
 =?utf-8?B?TTRJWksvVkVuYmlFTFFOejAycWpKd01yNzcxQkYzVElybkJ6V3lZLzdGYlJm?=
 =?utf-8?B?SzdZNkdaZFpZUkIvM3JKVWdLd1Rua0dqZ2dlTFBqenVyYVYzRFBsUXdIK3Zp?=
 =?utf-8?B?NnJ1Mk1UOUd4d0NzYzltelQxa1F5KzJLQ21iYUlWa3hZRDB2UlN2akF5dk9E?=
 =?utf-8?B?R2ZMR1k2UkxKWlptbGtRb25MTWo0VXY0YnNsOU1meGtRY3paeUNOVGorNGZ2?=
 =?utf-8?B?dncxK3ZYaDdvcGRYeGY1c2djcTg0Y2ZadHFCOXRvOUZlRDFmWHVEVDBsbW1m?=
 =?utf-8?B?SnlDSm5tWk5EbUFLUHRhS2V6NG5DMnRsbnlTQXJzTEJPVDJvMFhvbDAvMnB5?=
 =?utf-8?B?aWVCaDRWYXMrMllGQlFMeGQ3R0ttdmxPckxLUmN6RWVaSy95ZW5QWUJxbWtC?=
 =?utf-8?B?R3phZHI5Q3o1c1FWc3BsY0FQN1l0M0FNUThCRnFiM3pHVlJIWEVSWHhOR3pl?=
 =?utf-8?B?dDhEMkFabkcyeTRUczkya1NMaGhqODNwTkZVQ2U1MURzOUZtWVpxOEFtNy82?=
 =?utf-8?B?L1BZQUZpVmRTZ0dURTVFTW1pZ1ZXMEFHa2NFQmtsUndYS2NwSmljSWtwUENM?=
 =?utf-8?Q?PVfm9+5E5HJJF58ndWSzG9U=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a81c85-d218-451b-f80d-08d9b654f269
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:03:41.1124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8hdu8D4Y1s9pcGvio7y3ZwnjyY2/IVqTLlysCORLki+BAfHqUhsint0CRRvm/Xl/D+ogny306MKmChfUR85PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2958

There's no point including them when the respective scheduler isn't
enabled in the build.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/perfc_defn.h
+++ b/xen/include/xen/perfc_defn.h
@@ -37,6 +37,7 @@ PERFCOUNTER(tickled_busy_cpu,       "sch
 PERFCOUNTER(unit_check,             "sched: unit_check")
 
 /* credit specific counters */
+#ifdef CONFIG_SCHED_CREDIT
 PERFCOUNTER(delay_ms,               "csched: delay")
 PERFCOUNTER(acct_run,               "csched: acct_run")
 PERFCOUNTER(acct_no_work,           "csched: acct_no_work")
@@ -58,8 +59,10 @@ PERFCOUNTER(migrate_queued,         "csc
 PERFCOUNTER(migrate_running,        "csched: migrate_running")
 PERFCOUNTER(migrate_kicked_away,    "csched: migrate_kicked_away")
 PERFCOUNTER(unit_hot,               "csched: unit_hot")
+#endif
 
 /* credit2 specific counters */
+#ifdef CONFIG_SCHED_CREDIT2
 PERFCOUNTER(burn_credits_t2c,       "csched2: burn_credits_t2c")
 PERFCOUNTER(acct_load_balance,      "csched2: acct_load_balance")
 PERFCOUNTER(upd_max_weight_quick,   "csched2: update_max_weight_quick")
@@ -77,6 +80,7 @@ PERFCOUNTER(credit_reset,           "csc
 PERFCOUNTER(deferred_to_tickled_cpu,"csched2: deferred_to_tickled_cpu")
 PERFCOUNTER(tickled_cpu_overwritten,"csched2: tickled_cpu_overwritten")
 PERFCOUNTER(tickled_cpu_overridden, "csched2: tickled_cpu_overridden")
+#endif
 
 PERFCOUNTER(need_flush_tlb_flush,   "PG_need_flush tlb flushes")
 


