Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E76F65E98C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 12:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471799.731802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDO80-0006lV-5c; Thu, 05 Jan 2023 11:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471799.731802; Thu, 05 Jan 2023 11:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDO80-0006jB-0e; Thu, 05 Jan 2023 11:09:44 +0000
Received: by outflank-mailman (input) for mailman id 471799;
 Thu, 05 Jan 2023 11:09:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDO7z-0006j4-1t
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 11:09:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2063.outbound.protection.outlook.com [40.107.6.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72874b91-8ce9-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 12:09:39 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8423.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 11:09:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 11:09:39 +0000
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
X-Inumbo-ID: 72874b91-8ce9-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPrUxtfFQq/gUda+YtL0dXlEP1j6oELrH4y/nr07aqQInol4goKcFbqRc4MxsOuYSzAFQT6g/dczZBll9U1Y8+QxoKRC6Y7YHHMkdfkIlrpDNVGk3vHuIQbqJ7Rggd8D1NkkNFmdSDRx2pjrM06+AoTjuIqoOm6nTkMrGU4hH/RpjrSVs6pMa41pJ9nXUm+yNnn5tZsXi/3ugSYATzAhDHr5vflkOrQZLBbRiz8buJ2E6/59OPVzbsG6sGphj2Z0KZJHEzSxVyDhCGbwCFfLv2EXUKb8yPyJO1b7X1Y7OepDIp8AqG1zQz3ZRFdYVxnA/qfXt1TCB5CaNDEul3ORew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtJ2tMl3hWQX0ZOOqnHW05T+xWUWp8nD3ypTcC84mxA=;
 b=Z8bPzqLT7Tpl9Hu3kX2IH5Nf7UxqJpTlDW4MOPMurW7x7HyBW1NtQAZ17z771Dd5jDophr63DpdseZ6Cf083tF5+irVRi9FPo39x0TlyQTyoBQvAsP7yUQnkYaXDTX34HeG1gBZbIEKHKa+XZvzGeq1o4bcsVN5BoSpvGBx140Ru1nv/7xsvjBUMkhHybPhYf8MFI/cThQYFHBoRNowRy6/NRVFevKaUP8XIrW0FTsJ3alQwR4qo1UBZOeKNG6nimpd0htNr13FKjL7FXDc+s74emyMchScSpoEc25nfzVuKeCT823slpNRq1M/3TFW8CwJHRZZKx6zCq+jNhzpWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtJ2tMl3hWQX0ZOOqnHW05T+xWUWp8nD3ypTcC84mxA=;
 b=lSlMtiULll5Z8uf0ZXNU86IRDBE4Mwb7KuKW3+0Es8lIM24UK6Y1TRo3QmvK942G0gmgWclNus4uhQOPHO9l0/Knd77deKJysoGAv7MsJjEenwI1c9PCX4clqmAweWbesfXAsWZ4GY6lbAUyFzcN/wChf5Ttl48uGIEqFFo4c9mWJWx85REUMtwRjyP9v0+L1wcPx76Q3kfXUsoEhm02ZZ/J8RTZ4m21wHbJ8goH3hAyFDpkA4QmiLq7eI5ay65M9uSO6V0U5IHifTBkYvcvLyeBo3oHrj7TLypHqGGjjAkmwh0CQj2ZiWwEAwyZtwWwPDvlwcsuc8j5ddhzXqOBGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <139bab3a-fd3e-fec2-b7b4-f63dd9f9439a@suse.com>
Date: Thu, 5 Jan 2023 12:09:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: idle domains don't have a domain-page mapcache
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb5b746-b21c-46b8-54d3-08daef0d565f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FFo7UhOL9DWFY9GcW7DpNCrrsgZQKCFii4/qLpT5bMhIs3UTzhIhkNSO0LQ2IJIFQ9m/p4l0j9RZCT9jbvFLEUdcqcRAryhNnomXXx8wBJWePM0mFtKmLGIj3Vcf4IPl8ueWYdwiVEzCGdTGnrJPfoUyq/iwMGEUX7m0lY79dMll8FyfuuKUnX5h6VvHjUBYqivbYj1AY4GlB6CD0GzR7XkiV2KOFOuiRwDSJSaQXK0ScUXDYBls+MchJEMgAopqgdXH+by0DGP5C5bWuNJ3ASEcaWwCqM9s1xCztbNxOhFTrWdu6Qu26Zjdku6iLG5aBLDzWUOUzCqR/9Z0qDMGCJvXAZLAALC1+nEAyJZfCpyh+LbfxSJzdUxRaOxmWaWRsyj2to673+Z2WTJKYnJyeuqVsyVjTn+msHCspgB7V8RgQnxPlXyg+8qpcfDNvsWzoF512VdW6jr72H5N1G+ckDJQb9Ac/5s84m3+5ZL3t/55Q33jFWTFyvBDRy8VVbsSbnOmdH8IqTuXXiME7L/ja6IxcBVPakrKI53vsOemWXM+XS0L9dvCVik3cBvW37poNM1OCQlUECiZOxdWega7QdTyQI3IDn2ugQdAlZ9o/jCW7dgi5+2/HhnY+uNwljoioaTEE73wSkZ58voaZ7g6h+Qgrei+QQJARI2dvYkad0V5S6LJKwZZwH1udGFWHtT3AEyCa6q6V1vzJ91LsmNaLzZENZHUuMHCCX+ktMpeCu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(2616005)(2906002)(86362001)(31696002)(36756003)(38100700002)(316002)(54906003)(6916009)(8676002)(66946007)(66556008)(8936002)(5660300002)(41300700001)(66476007)(4326008)(31686004)(6486002)(26005)(186003)(6512007)(478600001)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0xCdU5LenJUTlVDNUN3RjVIU3pweE0vUFo1c0xwU01ZV0lvWUo3ZHc3Rk5D?=
 =?utf-8?B?QUJQK25LWEkvaERhdUVGaXJYTFNiQ3BNVXlmamUzSSsrcEJVR005VHZSOUFq?=
 =?utf-8?B?MW9OQkV4aDBCb2tHY010bFFOUGtNdjZmNHhmaWxvQVczdnZ6dVhTNVBpUlVP?=
 =?utf-8?B?K3JFSUtjS1pKcitJdVNPM2dCSDlTRHI4S1NldmpXaGttTlgxMW1jVVBoTm9r?=
 =?utf-8?B?eTdEc2ZmVjFqZWpTemp5NDVnWlY2QVdLK2tMNm55WDYwWWZqR0ZjRXZMVEJ3?=
 =?utf-8?B?WUE0NmpHbHJOOGQ5REk5SXlZcGNQdzlSbXp6OERiU09VeSt4ZkljbG4wR2Ju?=
 =?utf-8?B?Q2pDSitSY1IzQjNidjBsdUtIOUZST05MUkRuNHRkbWQ2cEQwTFM5TTNtc2Jw?=
 =?utf-8?B?UGZrS3cwbC9kTmxzWEZ6bXJJenE0L21KVDhNQ0oxLzhVMWJ4TlMzcXE4TDkz?=
 =?utf-8?B?ankxeTYvWlYySFQzSXpkeEFwV08vSm96Q3hTcDRzUE0xc1Y4L0Y1ZGk5Y2RW?=
 =?utf-8?B?S0FRYWN1b1N0QVBHQlo4aFNWR0NiLzhHYm4zVE1ndUYxV1YxUzVqRUxrQWZq?=
 =?utf-8?B?MEJ3OVlTMHhieEZVNTNzT1pSKzhGN1FLUDUvSEJVMzhvYVdJamUwR2RuM2lG?=
 =?utf-8?B?VVNvTXgwV0hNZEwvdGdaVTE4SUtiWVdLT1EyNVFlNWtyTm5XdzczbVJxM1JW?=
 =?utf-8?B?bzI4NExwOUN1NzY0SGxZNUdWcjNGZCsvWC82SHk3b2VMSHpLdVluQmREVnFR?=
 =?utf-8?B?VEdtNlBrOWZHSDVHSmVVeTBIV1k2bFc5UHZXcTYyakM2ZDVmL2xLRWEwVnZJ?=
 =?utf-8?B?c3BBWVBSdEhmTmtRMHptVjNHY0RzUjZ3Y3J5QUIvMW1JRXl3VUZKTXpxOXhG?=
 =?utf-8?B?RXNzVXQwSlF2NVdIYnJ6aEQ3VmlPSUQyS0hWRTk4SmVuV25IQVpQTTE5bmZh?=
 =?utf-8?B?WlM1UHNVSE9MSkJ4RnAxeXBSdnRaLzJ5N2ZydjhQK0FneXFqMHJ5UmJzbWdX?=
 =?utf-8?B?MzZ4Mk5PRmJheE9HT3JzWVNqZlk0UDRERERaTWo4WmVNSWNhODBDWTF3Q01j?=
 =?utf-8?B?L2xOTGM0bk1SejNwK3FrVlZSME1BbjRmenF4ZnlNeWNEKzVENEdmMEF6cWVJ?=
 =?utf-8?B?bWtMSGxFaGRzM1I5bzhha0JaOHB2Z3N4NkxBRDNmL3JDZGJEQ3BZd0l3N2I2?=
 =?utf-8?B?blJLY0hvOUxjaUY5NmE1enFzRlIvME9tM0Jid0NDNTI0bkdzRDFZS0ZPNElY?=
 =?utf-8?B?RFZ1bFBncU52S3VlSEJUYktvbm5reHRHS1hJY0lrRmpoUVlDZVFrVVN4Ulli?=
 =?utf-8?B?ckFwWW1MV3ErS1FTZklhRFVyN2pRVExKemlrUkZlUzZIYzJTZUtlRVUvSVRH?=
 =?utf-8?B?TEVySmpjQ2RIR29wbWFnWmtYZUdiZnF3VTh5Z25hbm50ZTRkS29lZEM2NElS?=
 =?utf-8?B?VmZjM2MxUDBRelNVUGpiZzA4QlFnV0N4WHd2Q3NVNGJkNms1MUQwNE5yUWtq?=
 =?utf-8?B?cFRWdG5vb1BsaFRDQmZTV3BNQWdqQnhtdDlxdytTV21VdGhZMlhHSy9FQ3p5?=
 =?utf-8?B?SkJKY0o1cTJGMmpsVU5HUHVQTlNYdEdCekVMTk9XTk8xMkRJTW5YRW9wdWd5?=
 =?utf-8?B?UzRHS3hEOHNiRjdGdFFKUGxJU01GVDRiQW5RUnU2VVA2bW1oV0hHZG9WbzAx?=
 =?utf-8?B?bFhDL1F2Z0FyNlRVNEZPUERralh1T3ZqRlkrTTM4RVQ4QUY4ai9RSEw0TnBh?=
 =?utf-8?B?dTh5QVBSODByQks1Uk43ZDhqVlQwZDhaKzJkU3ozdDJHZS8zblpDMG5Ld3dN?=
 =?utf-8?B?V2gxMEl2dE5OcjVvZys1ZmI2OVBmTHpDOE1RTUlyby9vcnVSYlNWbkFWenFR?=
 =?utf-8?B?YlNXcVA5Qmd1WnlrYUlETHRYS01Nc3VmWUhuMVZWVjB2OG0vUjRwc1REa3Rq?=
 =?utf-8?B?RDhQajRVWTVNbUVCRlY1R0V5V0NHWWJzemROdm9CK0Zaa29HeTF3QXlvYW5D?=
 =?utf-8?B?RVk4Qmd2bGxybXMwa1lzQTllNkl3VytMSmR1SVB2Ykhua0VFQnZXQVl3WnJI?=
 =?utf-8?B?OC9aQWw2SkU3RzErbkJMdFMyaHBaaUxZN21vSDdnejFiSlhCZW0vSkVKMytH?=
 =?utf-8?Q?Y1b+NIVB/+0TVfymagLHGxcSA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb5b746-b21c-46b8-54d3-08daef0d565f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 11:09:39.1235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +B+wBs2iRsoReeE210tsipcmTXN7ZbomIyk/FJWtmIpVSsWip4tYaO2w/V1w6rh8W/SYQ7rV1K8sRXEZkjxI2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8423

First and foremost correct a comment implying the opposite. Then, to
make things more clear PV-vs-HVM-wise, move the PV check earlier in the
function, making it unnecessary for both callers to perform the check
individually. Finally return NULL from the function when using the idle
domain's page tables, allowing a dcache->inuse check to also become an
assertion.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -28,8 +28,11 @@ static inline struct vcpu *mapcache_curr
     /*
      * When current isn't properly set up yet, this is equivalent to
      * running in an idle vCPU (callers must check for NULL).
+     *
+     * Non-PV domains don't have any mapcache.  For idle domains (which
+     * appear to be PV but also have no mapcache) see below.
      */
-    if ( !v )
+    if ( !v || !is_pv_vcpu(v) )
         return NULL;
 
     /*
@@ -41,19 +44,22 @@ static inline struct vcpu *mapcache_curr
         return NULL;
 
     /*
-     * If guest_table is NULL, and we are running a paravirtualised guest,
-     * then it means we are running on the idle domain's page table and must
-     * therefore use its mapcache.
+     * If guest_table is NULL for a PV domain (which includes IDLE), then it
+     * means we are running on the idle domain's page tables and therefore
+     * must not use any mapcache.
      */
-    if ( unlikely(pagetable_is_null(v->arch.guest_table)) && is_pv_vcpu(v) )
+    if ( unlikely(pagetable_is_null(v->arch.guest_table)) )
     {
         /* If we really are idling, perform lazy context switch now. */
-        if ( (v = idle_vcpu[smp_processor_id()]) == current )
+        if ( idle_vcpu[smp_processor_id()] == current )
             sync_local_execstate();
         /* We must now be running on the idle page table. */
         ASSERT(cr3_pa(read_cr3()) == __pa(idle_pg_table));
+        return NULL;
     }
 
+    ASSERT(!is_idle_vcpu(v));
+
     return v;
 }
 
@@ -82,13 +88,12 @@ void *map_domain_page(mfn_t mfn)
 #endif
 
     v = mapcache_current_vcpu();
-    if ( !v || !is_pv_vcpu(v) )
+    if ( !v )
         return mfn_to_virt(mfn_x(mfn));
 
     dcache = &v->domain->arch.pv.mapcache;
     vcache = &v->arch.pv.mapcache;
-    if ( !dcache->inuse )
-        return mfn_to_virt(mfn_x(mfn));
+    ASSERT(dcache->inuse);
 
     perfc_incr(map_domain_page_count);
 
@@ -187,7 +192,7 @@ void unmap_domain_page(const void *ptr)
     ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
 
     v = mapcache_current_vcpu();
-    ASSERT(v && is_pv_vcpu(v));
+    ASSERT(v);
 
     dcache = &v->domain->arch.pv.mapcache;
     ASSERT(dcache->inuse);

