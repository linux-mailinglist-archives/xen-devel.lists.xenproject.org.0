Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B464E4FB812
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302815.516606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqeK-0004Ue-Ik; Mon, 11 Apr 2022 09:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302815.516606; Mon, 11 Apr 2022 09:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqeK-0004S0-EX; Mon, 11 Apr 2022 09:47:56 +0000
Received: by outflank-mailman (input) for mailman id 302815;
 Mon, 11 Apr 2022 09:47:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqeI-0004Ru-VN
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:47:55 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74f37bfb-b97c-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 11:47:53 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-IN5cOqAmMjy2Q-dFv1vueg-1; Mon, 11 Apr 2022 11:47:49 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4344.eurprd04.prod.outlook.com (2603:10a6:209:3f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:47:48 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:47:48 +0000
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
X-Inumbo-ID: 74f37bfb-b97c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649670473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zQjR5DK4NpJpp9HOOVnWEC0s4IqMWdnpI2ohv4rQYY=;
	b=DS96yOLmxW6xDwPwIEWEN8VV9srOCXp3q3MXGCfwzmvSYG2TBxQeiujrnebRz2BGrpmm9F
	Npr2YDydt+H649KLNZicflMH98tqbhEZocQJY7yXPMkINuatEA233yBbSqwUUpbcpucyGF
	YrzQ//ZMXISoL7jaL67JfdSXY4Jgff4=
X-MC-Unique: IN5cOqAmMjy2Q-dFv1vueg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdfv6GjlGmen2kmkcl1a8eLdAju90s5TIJjCc1dVeTJzQoJMqI4T9465hUqOrsuUgPcyDuigiNyNo3o3D8XeEE/V2UkWIYb1nDpobJ73j66ej75ZnRB46kXPUDtVaY+RqU0Z+aRQmKVAQKMNTapN9QA9sM/z98yiuYGA6ewDQlud1mEQGU4UkCQDIadwiVK/x5XcH1XIFOjsvAge7Jf9pvgWYrOQ/Q/SbMxwYV3v91VTbd8JDLLEHDnPyXv/ykFjvh1RIxplHW6CPVgVmKiJjEUmBV7X0RGO98wC5LJ6SopuMaNddYKphGzjjaove8PGg84BGc+rgCOKqPgLs4bWRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zQjR5DK4NpJpp9HOOVnWEC0s4IqMWdnpI2ohv4rQYY=;
 b=g3Y9Cyvi9fPZatHO6l/TmxaZ9olv2u3YUpNdeEQi15HKA6MSv/B2LSMUaWqZt18J7OHu9yY8Lgrc9yZjKzSG19dikT2cBpfXbYhA5ZybVUbpVgNdOV9NCVCcrqUwKiLPpO1VFe3g5RIzHOp8ZowDy/6DkslYLK1GEGycG1FapqAD3u5xO1xQbLwqLiGXyGRM5M4aw3MWTp+wP6nnfJt/7heJYyB7dOIa9J32Zxgsqv4czCvySPf9T3dlhlNAp30Fv7XOr6ZuHnHXJf82cKMhHkq4o0CPZQOnP3BbAupOR3/Lp5BsYOOqEXhBQwATfEmUN/t4U9jbf02u5PsbMVtthw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <db695753-718d-7bc9-3b1a-efd75b0166f9@suse.com>
Date: Mon, 11 Apr 2022 11:47:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] IOMMU/x86: disallow device assignment to PoD guests
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
Content-Language: en-US
In-Reply-To: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::30) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4562962-5dc6-4466-6ad0-08da1ba0561b
X-MS-TrafficTypeDiagnostic: AM6PR04MB4344:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB4344A6F33E6AD706EAF63342B3EA9@AM6PR04MB4344.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	slBClve9IgrCZBX+LHNx9ZB0J2uFnYYzh5yJ1OC2XGmhNdUAQXqGpwCdZ1SsOmoCbVYrKM24/0qmyKkPDcvbQnan5NwY19uHJm+xGIbd0AnR5Y1ohHydWRyNdRWnd/gK2RQCXg780mjaS23bu2cUFr+nJeZQwYMsYqqoZ3D69wrceC4CgiTbjOZBLrSKu3J8mFaSK+U8ec6M2WaocrY1tEOQjEDetHnDyemNJTcHNSSzBzpij69LJgvdbLE7sDcQN9Sl3A8Yi9RydE2vjmtyy2QTyFkhFceTjensS7c1ZTJZBKKPMWQ8kxGqQaqiTALKo4C/Lsb6+BYvedPxTztfLMO5oiS10PbEIJmwrU1qidjmcj1044cbJzMEFoh4iO3UpTopbCxWDvt/vBW5QXXnRmzFn6bDpFLm+lYPpIEi+1A7hETMjQNNk64xf+FhxZecY7xyx377yZ1AxucHYkjoqFeBPLwwLf1DAbmknhyJ75vj/0Zt6/FzaWBnJylzpyboDL3ARCcFiNIGP3X+Zh/gpx7+kqPKQFho+77i8y+Te072GRchSJW6o2oewkC6FFcI0hJQCBoikM7T0XGyqgNtKURuLH0Kil8eJ63vFnSIReke2+02XCTQtj+EyThG+LubZtMJ/F9WkkT5lZvbaePx6Tmv9JVtbNwaQddAibiVNW06RKUuA2NV+bq16SYvKmCvS5GORzwJ1KNCdNl6Te9Fh802cpK+Tvii5EiK4G0/HPrDJrzxBhP4XX6AeI5hWu8T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(5660300002)(8676002)(66946007)(83380400001)(54906003)(6916009)(316002)(6486002)(31686004)(36756003)(8936002)(4326008)(508600001)(86362001)(31696002)(2906002)(38100700002)(6512007)(6506007)(26005)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RG8zaVFEQ2YwOENsdmRWbVp5UHhjWlNZamhqL2tGNUlDMURHNjlkNnNQRFhj?=
 =?utf-8?B?Y005QVErbFZndWpSOHNUY3UvU0F4OXFDNkdheHA2dDFUUXh6ZFppQnRpeUVh?=
 =?utf-8?B?T21YUDRaQVliVnQwVkNScXZ1aW9zOWpYQXVta2l2VmlOL0JjaGxEZTBqR25S?=
 =?utf-8?B?UDBnU2QrOFJUbzYrc3FncjNzeWNoZTA4dVhtRjlqcmpCdkRkZktKVDRHbk16?=
 =?utf-8?B?YlBPSForNGxBVHNxaVpoenhWNlB6bTZXOHBsYzUyN01ac3NkVS94RmFza2xo?=
 =?utf-8?B?dWFLVDVvbVdSbHVWQVR0TnFNVWJlMnlndVFCOTM4UGRpVzBGSktGN0xMOTM3?=
 =?utf-8?B?bys2NFYvMnphVkxzRFFXUnNCa2ZBZlhvbGcwZUUwZEpHZW1DY2lBS3libGVo?=
 =?utf-8?B?bng2R3JObUU5RnRIODJYYkxxZkRiUXZkOXFnYm4veXdkaWo1cy9CTkxLbjY3?=
 =?utf-8?B?cjZLTng4NUNFZWcxUW9zcGNSM2JDdTlHb3VQbnZaZGE0Wll0UWQwRlVKN2xE?=
 =?utf-8?B?MGNYcXUvQlpCcWUvYnJBT1VXMDlNNFE4UlYyS2FRRSswWHlQQTkzZ3JPRUNw?=
 =?utf-8?B?TGtJaldKU3NKWG9zU0MzU1d6cnNiemE2SFk3OStxSkYyc0RHcWR1ZGE5eDFx?=
 =?utf-8?B?b2FjeFYyd2VuN29UaWtCMXpSbHhXcFZqdmZwQ0wyZWprZ0ZTVWZzYlBmaTRy?=
 =?utf-8?B?aCsrNGRkajlVWWdVWm1Db05Xd25QMEJINWR2ZG9hdGFwSWhmRngzU0tZSlVk?=
 =?utf-8?B?eWpKT2JCZzRlNmhzRUdhNlVOWkxVbnNKZ3BMZUdzTXlweGpNWnlKWUZlRE5x?=
 =?utf-8?B?ZWhZdVJMZUlUVG91OFZYVVNzMVpUYmQ1RUJmdHNCcFV4MkZLM1E0a2p2dXZD?=
 =?utf-8?B?MWc2ek5xS3FJWDZHZDhiS2JnN21WeU56cUlBZEZDVnNXQXEwS1hlQ2tkYkgw?=
 =?utf-8?B?cmlicnU2OFQ0ZDJsVHYwT2M2c0c4Q2s2THRnV3pJbElzOVpqUlA1aS9YUUgy?=
 =?utf-8?B?K2s5cTlGSUlTdVhESFdybEpzYzdHMnVHWk5CYjJpcHVwZHFBQkhIMGxtWHd4?=
 =?utf-8?B?Rk5OMEpVMWxWMi9YQWtVUjNUdEhlWHdqRVlBNmhlQm9kNjJSQUk0WkJ0VWFG?=
 =?utf-8?B?UklhVlI3MEVTMGo2dkwrZVROeW52UnhHNHkveThzcVUrazZXd0RkQW9aVEJU?=
 =?utf-8?B?bHZnWXdwbmhEc0FUekF1bDhsa2Q2WjMra08zSEpLWWdyekplTVV4R1NvcGRk?=
 =?utf-8?B?dWVzKzJhSlFqbTRSREd0MFplVWNkL2Q3SmgzR01WdEtLMHNjUUdjQ2QxR01W?=
 =?utf-8?B?UUdPZDd6UGk5TFdhQzRadmdhZ0tLdHFvcTVDV1ZnTTl5cVNWQklYQ2NUTUFO?=
 =?utf-8?B?VWlJQW5rRzRNcEFKdG5yK0pWTUpOdjk3Q0tUMXFCS2NBM1MzZFk4ZjFZelNO?=
 =?utf-8?B?KzJ0VWJsS3BEaEVXWlJlNTlFbU94UkVEVkdlMUhmUThxUlJxcVJ6akI5dUJs?=
 =?utf-8?B?SFFtTWNia0lUdlZYWHVpOGc3d0FDZ216cHhWZUdtdlczWXp6MDc5T0JzQzNi?=
 =?utf-8?B?YVFKbERDUVFiRnZRVDg4cFRDUGpHY3RwbDFiQkJBdG1RalNtYWpRcjhsZGd5?=
 =?utf-8?B?Mi90SlpGaEllOXlhTC9qQm5samRqZXZiWnZDcDN4UVRGMzJHN3QwMHBqdmNV?=
 =?utf-8?B?N2w1S3VqNFc5emQwcHRsUjh3V3poUFlLeExoNHNKSVZCbm56TnhDZlVaOXZI?=
 =?utf-8?B?ai9CYTZMYkFPY2VIVjVydlhtbk10Wi8yMHhhQVdydzlpdGU4UllvQTViYnlG?=
 =?utf-8?B?QWxra1FLYWRoa0dMdUtTMktBbmg3L2hFLytnd1JUUTRIWkViN2t0SXJCaWg2?=
 =?utf-8?B?c1pzVlN5aXFISWRCY0lqeHgwdUZYbDJOYURIM1k2U3IvME9qN3UzVlVUbk9I?=
 =?utf-8?B?elloY2xnbGxtdDE4emJLWmN4MjNEdm8rMUhQMjI5OW9sZzNvQnhaZ3IyQTFN?=
 =?utf-8?B?bFR4ZDFEenVoM2Y1UXRrS2NuV2lpWk1hQkJZYldmbWh5OG9WUFp6amJIUER5?=
 =?utf-8?B?MjVLNlpSbEVuajhqSzNZa2dPd1p4VHkrbnZ4N2lVdXRwR1RVZlFxS3pDUlB1?=
 =?utf-8?B?aEFtb3pBVitHcmluTXBWckJFMkVCTjBwcFN3MWhyVE5JN3dJOUVoalBNMFVH?=
 =?utf-8?B?b2RReVVFU1k4Y1loUlBYTU5ST3phS2RQaTFlNk1ubjQ1UTZwWVBoV3pvZTQ2?=
 =?utf-8?B?NGlCYURzakJIM25DWlFnLy9aVFFIMHZSWXRRazlxemdwNjVLbmk2QnR3MFRu?=
 =?utf-8?B?RENJUVl1N3k2dFROb0s1ZVVBb1ZCbms3M1Rzc3c4N3R1Nks0dzZQUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4562962-5dc6-4466-6ad0-08da1ba0561b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:47:48.1107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/kJ9tvtbjfaN3OP1n+92fTlo8bSccdVqw1/ZJvTVHjJ8c8yu9yZD2L1lwqVlTSFghgWH8PY9mNpP5KS8Bu/kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4344

While it is okay for IOMMU page tables to be set up for guests starting
in PoD mode, actual device assignment may only occur once all PoD
entries have been removed from the P2M. So far this was enforced only
for boot-time assignment, and only in the tool stack.

Also use the new function to replace p2m_pod_entry_count(): Its unlocked
access to p2m->pod.entry_count wasn't really okay (irrespective of the
result being stale by the time the caller gets to see it). Nor was the
use of that function in line with the immediately preceding comment: A
PoD guest isn't just one with a non-zero entry count, but also one with
a non-empty cache (e.g. prior to actually launching the guest).

To allow the tool stack to see a consistent snapshot of PoD state, move
the tail of XENMEM_{get,set}_pod_target handling into a function, adding
proper locking there.

In libxl take the liberty to use the new local variable r also for a
pre-existing call into libxc.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If p2m->pod.entry_count == p2m->pod.count it is in principle possible to
permit device assignment by actively resolving all remaining PoD entries.

Initially I thought this was introduced by f89f555827a6 ("remove late
(on-demand) construction of IOMMU page tables"), but without
arch_iommu_use_permitted() checking for PoD I think the issue has been
there before that.
---
v4: Drop tool stack side change (superseded by 07449ecfa425). Extend VM
    event related paragraph of description.
v3: In p2m_pod_set_mem_target() move check down.
v2: New.

--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/event.h>
+#include <xen/iocap.h>
 #include <xen/ioreq.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
@@ -360,7 +361,10 @@ p2m_pod_set_mem_target(struct domain *d,
 
     ASSERT( pod_target >= p2m->pod.count );
 
-    ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
+    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
+        ret = -ENOTEMPTY;
+    else
+        ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
 
 out:
     pod_unlock(p2m);
@@ -368,6 +372,23 @@ out:
     return ret;
 }
 
+void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    ASSERT(is_hvm_domain(d));
+
+    pod_lock(p2m);
+    lock_page_alloc(p2m);
+
+    target->tot_pages       = domain_tot_pages(d);
+    target->pod_cache_pages = p2m->pod.count;
+    target->pod_entries     = p2m->pod.entry_count;
+
+    unlock_page_alloc(p2m);
+    pod_unlock(p2m);
+}
+
 int p2m_pod_empty_cache(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -1391,6 +1412,9 @@ guest_physmap_mark_populate_on_demand(st
     if ( !paging_mode_translate(d) )
         return -EINVAL;
 
+    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
+        return -ENOTEMPTY;
+
     do {
         rc = mark_populate_on_demand(d, gfn, chunk_order);
 
@@ -1412,3 +1436,20 @@ void p2m_pod_init(struct p2m_domain *p2m
     for ( i = 0; i < ARRAY_SIZE(p2m->pod.mrp.list); ++i )
         p2m->pod.mrp.list[i] = gfn_x(INVALID_GFN);
 }
+
+bool p2m_pod_active(const struct domain *d)
+{
+    struct p2m_domain *p2m;
+    bool res;
+
+    if ( !is_hvm_domain(d) )
+        return false;
+
+    p2m = p2m_get_hostp2m(d);
+
+    pod_lock(p2m);
+    res = p2m->pod.entry_count | p2m->pod.count;
+    pod_unlock(p2m);
+
+    return res;
+}
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4804,7 +4804,6 @@ long arch_memory_op(unsigned long cmd, X
     {
         xen_pod_target_t target;
         struct domain *d;
-        struct p2m_domain *p2m;
 
         if ( copy_from_guest(&target, arg, 1) )
             return -EFAULT;
@@ -4835,10 +4834,7 @@ long arch_memory_op(unsigned long cmd, X
         }
         else if ( rc >= 0 )
         {
-            p2m = p2m_get_hostp2m(d);
-            target.tot_pages       = domain_tot_pages(d);
-            target.pod_cache_pages = p2m->pod.count;
-            target.pod_entries     = p2m->pod.entry_count;
+            p2m_pod_get_mem_target(d, &target);
 
             if ( __copy_to_guest(arg, &target, 1) )
                 rc = -EFAULT;
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -639,7 +639,7 @@ int vm_event_domctl(struct domain *d, st
 
             rc = -EXDEV;
             /* Disallow paging in a PoD guest */
-            if ( p2m_pod_entry_count(p2m_get_hostp2m(d)) )
+            if ( p2m_pod_active(d) )
                 break;
 
             /* domain_pause() not required here, see XSA-99 */
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -513,11 +513,12 @@ bool arch_iommu_use_permitted(const stru
 {
     /*
      * Prevent device assign if mem paging, mem sharing or log-dirty
-     * have been enabled for this domain.
+     * have been enabled for this domain, or if PoD is still in active use.
      */
     return d == dom_io ||
            (likely(!mem_sharing_enabled(d)) &&
             likely(!mem_paging_enabled(d)) &&
+            likely(!p2m_pod_active(d)) &&
             likely(!p2m_is_global_logdirty(d)));
 }
 
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -701,6 +701,12 @@ int p2m_pod_empty_cache(struct domain *d
  * domain matches target */
 int p2m_pod_set_mem_target(struct domain *d, unsigned long target);
 
+/* Obtain a consistent snapshot of PoD related domain state. */
+void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target);
+
+/* Check whether PoD is (still) active in a domain. */
+bool p2m_pod_active(const struct domain *d);
+
 /* Scan pod cache when offline/broken page triggered */
 int
 p2m_pod_offline_or_broken_hit(struct page_info *p);
@@ -709,11 +715,6 @@ p2m_pod_offline_or_broken_hit(struct pag
 void
 p2m_pod_offline_or_broken_replace(struct page_info *p);
 
-static inline long p2m_pod_entry_count(const struct p2m_domain *p2m)
-{
-    return p2m->pod.entry_count;
-}
-
 #else
 
 static inline bool
@@ -727,6 +728,11 @@ static inline int p2m_pod_empty_cache(st
     return 0;
 }
 
+static inline bool p2m_pod_active(const struct domain *d)
+{
+    return false;
+}
+
 static inline int p2m_pod_offline_or_broken_hit(struct page_info *p)
 {
     return 0;
@@ -737,11 +743,6 @@ static inline void p2m_pod_offline_or_br
     ASSERT_UNREACHABLE();
 }
 
-static inline long p2m_pod_entry_count(const struct p2m_domain *p2m)
-{
-    return 0;
-}
-
 #endif
 
 


