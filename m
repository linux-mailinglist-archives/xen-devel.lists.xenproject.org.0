Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D96531A1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 14:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467883.726937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z68-0003rS-32; Wed, 21 Dec 2022 13:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467883.726937; Wed, 21 Dec 2022 13:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7z67-0003pI-Vj; Wed, 21 Dec 2022 13:25:27 +0000
Received: by outflank-mailman (input) for mailman id 467883;
 Wed, 21 Dec 2022 13:25:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GA0H=4T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7z66-0003Di-2u
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 13:25:26 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2089.outbound.protection.outlook.com [40.107.249.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecf178b1-8132-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 14:25:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8610.eurprd04.prod.outlook.com (2603:10a6:20b:425::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 13:25:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 13:25:21 +0000
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
X-Inumbo-ID: ecf178b1-8132-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKS3DpjHRFu7eTVeb1my0sbj8LQjQlJ9u0VLMI0ZWhqQtriYFB6uQjKMDQPbZbvSdNEvN1rHw5M+b7Z1RDNEUS6y/Ku9I2aU/cv0VbnJDD6n16Y7QZgoV0E5pMbgiGgJE26D5gSCkqFBmc5AwHFdev0jwZuA4xSDhi5OGs48nxGV7E7oM7a4FzFSe8Aaihg3Y2pjp5cOtANET0mEnxQrVXUY98JQpvjStKHL1vNE+Mfp0E1U6qXpF3oIWpIilZDwsz7ETLtlR8TiWrBYmYBljosX+x5qgPIrrK7RKfJQRSlvW7RxIu9iK07FWzoBicFmdarIO+9ddW+9zJttXZMwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRn3ptmgQ2T1waA/6n6LdzW2l6WqDKNqZIo99H92QZU=;
 b=Vl/6bAiSq1G0APxADm88/y65y0chLV3lEQCeBpPivgt44AWhIpgnkUEjX1U8YLZSZiWH73LYaLY74bq5TyrZR+0CgrCDsXL1CA6WtMcaK63Mfr98fQaEVY3RaVNRqtATwN/Hx30QEFlDkCJ0ejqnCYlugvhzGdTE7vw526vw5Gx0/Q0EVjopOS/kUGZl9XKDNAs/uibTJAg4sm3/+23cp2SpaDG7ZDQKUoShS7BTsYFZpgkdQZGnhVjsKzag2cahMYlapnGFTEoX4Ym9AFAMee7zjp1MA86u7gff0ZErL89cKdxg49xmhXLHritrOy8j6eMz5uw9pbjZ8/MYuyvQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRn3ptmgQ2T1waA/6n6LdzW2l6WqDKNqZIo99H92QZU=;
 b=HXsirKOkW0PC57tQ7AHFFEZD84QzctJije7da3nhF0vMo0Wmt6/6BpCtD+dzlqPoytwYeS7L8KNBzG9LBrNT/ddI0guphKWmdsqjaAo1WOuVHqvkKuKT6tcDnOn42cOFJ00p5A7nwOMLe/HsdczKc+JSCF7UD8bV9e9TQNqtFW2oS6bqSlhBK+4sS4xcolCzFmhbyAplGeihgFIGMs7xY8sn1s62kvWUFHg7S/aO1R4bDLOYCmARgJUdBhjwG8ql1J1YI5rQwYI4ovpSKnNIUv8laHYMGp0Q6go2Gzq3TsM+w93Y3BMEpkR9/xrdWG4b2jPsrsv5kXNFThi6xyHyeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d519e00-83c6-aee9-e7ba-523aa4265e1e@suse.com>
Date: Wed, 21 Dec 2022 14:25:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: [PATCH 2/8] x86/paging: fold most HAP and shadow final teardown
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
In-Reply-To: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd98313-74f6-44aa-0ea2-08dae356cf9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yUc+bDBZJI2axKq2+y8wY5mDQh4mPnR6FW1wUPRcBGj+Jh3P6yMz1WeKr3uyTJ0y2d4+CqIjNmt3XyH32FR4zyEfKbm52Zdf9dshak2Uw/8/vbtLSt1qFummkt7BpSU71blFDQR6TI8d4qXvm7kIF0UJo5/PnwJ6+751+olpCipVPZzbo4IW476+dKf4b91FNxLMJcZdmhatRPcvYkYsSbQ/5b2NanwfbY1aSPM8iZi8isOxARV8FpvdY4Ek771EfCIErjfGYfLPHDfgOH2GCMWi4T0bl//jaoydrFv8iDKOsJFenrCPnEaHMchq+KYTBvzM/1zZie7Vve7NrXIVXgBM2OVIltnzhKHB2jSpRljfIOa4bzQo7oMuiVEn8PdzpR5SAjgiPiv3bnEY5GsVqUFWJjQ/Xr9j9doO2r8hFws+B2sunSFT8nVSDFoAcBzX3cw6Tdi2aG8V26iShM7qOqQGSuZfnDJr/aY0+O6wEvuCu/NsUfvxomDMaf1mYf3LdAgp1+YO8G4z/OiIjEOVkHwp5OGR8Z/HnDjItdxTHc26yTg6k0v5HuosuMuDe/27/XyGMi1YLGUh9/9ItC0JAywZG2fQ3L81Jovw079M0Ac/oiWzIqDEsksa9RvQsdEWFJ2PEZ5xuPM4OuT4qGnF8SbVT0cqqBn9qvcNG4WSOAuBIZ0M2yuEuNOQkTbvzHCU6kMbKbSkV3wX5DAApkg1w9U3Hx+mF30QQDpiPO1SjIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199015)(31686004)(8936002)(8676002)(66476007)(86362001)(4326008)(66556008)(5660300002)(66946007)(316002)(2906002)(41300700001)(6916009)(54906003)(2616005)(83380400001)(31696002)(6512007)(186003)(6506007)(26005)(38100700002)(6486002)(478600001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHNQcW8vVjhUNnlGWG81YWZ5blplVDFkQnVTMmhFYVZITUJFS2wyRWUraFNx?=
 =?utf-8?B?eW9EM1RaakkrTHcyelJ3blhXYUU4V1lOK24rMnNsbVZyYndaWFNmbGwzZDln?=
 =?utf-8?B?M3R1aGxrRXpSdmlsOEpFNEFYVTFSREwxYkIxQnVaRHduak9jR0ZORmxRRWhx?=
 =?utf-8?B?M0dzbG11bkozS1JpU0VKMklHQWQwK0tmclJjNk5SZ1BiSnJBcUlUNFlib3gx?=
 =?utf-8?B?RjlXemo0REtmbjg5OWdFa0x3N3FsZ01GbzVLWFVFWTk4V2dNaHZweDdhQW43?=
 =?utf-8?B?dnM0akRWRlIwanJwSUpqTnBYQXlYUXFXQi8yMkdEa2RGMUhNc0NwK2dpaUJV?=
 =?utf-8?B?WkswcExwZ1l0Z3RXdHR3NUxocUxrbTdrUUI5MUF4a0pBemZqZDRHTmNGb0l5?=
 =?utf-8?B?ckkwWStwbmZhY1phZlVXdVZDbCtyaHZOSXBxWGVFSm1BVHo0azlRSlpZZjNV?=
 =?utf-8?B?VC9qbzh2dUgrYVlPNFNXbGR5eEZwQlZ1RTlVSCs1U3hXM09jNkZ1WWlmRFZP?=
 =?utf-8?B?Zm1Ba09BK2kzcVZpcjJSdXFNUDBvK0JwYUVwUzYrOWV0eTExZkt1YVhHczg2?=
 =?utf-8?B?UEp4RXNFYWYwU1lQZHZMMXpnUElJK1pDTFpqbUxJUklDZjNneE0xMzlBWGx0?=
 =?utf-8?B?Rko5c0VEWHFjeU9JTm5qNTlqWjVIRmQxVjhuTy9ZdGU0NEI3dTJpeGZmVkFa?=
 =?utf-8?B?Q0dPL3JoVkdxbURSUFlycG1ScFQrUXhUUkwvcmlsR296NWhtQkUwazVLVXU5?=
 =?utf-8?B?Z3E4cWhFNENTUlhCbzlaVFd0dG1vWXU0czQxKzNldU5CWVhielVZVldnK1M2?=
 =?utf-8?B?dlMzM0xPR2YwRyszaDBoYS9UcWZzNWhGMEFDVU1vUHBhc1NvOUluYmdQLzlI?=
 =?utf-8?B?RFo5REkyNHJFVlliYkJLbEFINTFpMnM4TjJVVC81b0tCeUY5b0NHeW1yWWYz?=
 =?utf-8?B?ZUdvbUIrVGl2ZmJxRHliOXpOaStmM3RENXRldHh6b1JKS0hGRTkyWkhiYkpS?=
 =?utf-8?B?d1hpK21sMkI0MHlPemlRQ2p5UTJqNXgxK2hsVE8vcmozcXVLcHVzK1BwMWF6?=
 =?utf-8?B?QU9WUVU3Z1NndGtpemtRMjNtZ1NEUlRVaTZMdFFDTk1jMU51QWJkVVU0a1Ba?=
 =?utf-8?B?Y014MTJpUytBeGxEc1FwYTRjWjFmQU95RkFrSitlOWt1d2Q1SW1BQ3ZSVk9T?=
 =?utf-8?B?MDlZWnFDODJkL1VPdDlXVnN0MmROZDRZU0lWbUhpN0s3RnZCdGJIbEIvcFhS?=
 =?utf-8?B?NGo1Y2JObVhSYkpsQ1d2M3BkUlZZVEtGRUFRYnZWbWhjKzU4OWdrSlpZVk5m?=
 =?utf-8?B?d3MrcEwzaGV1SjJJT21IblRlS1RKUjVpZWFOYlBBYzE1N0wrMFBQTFQzOHBJ?=
 =?utf-8?B?RURyTFl5NE16NlQ4UW1lV2gwb2xCWGVJZUNRYW1tckQ1SXY2bCt6YWl1VCtj?=
 =?utf-8?B?WHRRaU5zMHd5M3VZWXJiTm9nZFl6bUJ3ME9RaEhQUUk3KzN2Um1US0dRR3pC?=
 =?utf-8?B?VGpuVmhKbklTUk94WkppOTNCakJDc3ZVUU5YUzhkU0swYTdBTjJ6azY0bk42?=
 =?utf-8?B?ckMyakExMUhmeUpiclFCSEYvNEE5L21MWWVsOWcwamtrbnNpZnlwVSt2akZa?=
 =?utf-8?B?UzlVbnRmZlpkeTlXRnFXdXUrSTdWTExMRHZpd2JjVjd4UDlvbXlXcVlnSXBk?=
 =?utf-8?B?bmR0L2V0TzkwY3FOTHlIdEorOUlXOWRIR3dDQ0tkY3czR2djRUpkL2E2aXNm?=
 =?utf-8?B?VStHdDVtMW9NelgyenZ1bXk5aDltMmpJdjVhMkt5Zm1lZHdyYzZXaTRyRUZV?=
 =?utf-8?B?bEsyb0N4QU51V0dCR3dSNFc1YmVYL3ViUGFGaFpnbzFSWWVBN0VWMWRRZjlK?=
 =?utf-8?B?Z2I5T0laUktNNmw3aFROK1BQY0RHMUxnQ3gyOWg3d1Q4MDF1aFloQlVRV3BY?=
 =?utf-8?B?TEhYR3grc2xPa21kTjM3cDZULy8ySGtBdjhVRHBWOTlnZjJXSk1uM0luRWNp?=
 =?utf-8?B?VCt1d3dlSlBNL2hvL1hUTU5lSnhOKzRaWDcwcE1WNWpCSWRvTTQ1Y2thcjV4?=
 =?utf-8?B?YUZyQUF4L1hFOFZZcmdnQktSQW5TS3QxNHVQQmpoTUxUb2xQYWdHSG01VnEz?=
 =?utf-8?Q?zZAna+lZWUNSYpiMTU4OLatmU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd98313-74f6-44aa-0ea2-08dae356cf9f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 13:25:21.7440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wf+fYUmmBlmLwlp0Jrg/bEaqydI5Hz3LyjuBo/GD+GrKj25x3GWDY/X8FRY/H+zAFYWp8bcgv8z6IYNXYUwBPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8610

HAP does a few things beyond what's common, which are left there at
least for now. Common operations, however, are moved to
paging_final_teardown(), allowing shadow_final_teardown() to go away.

While moving (and hence generalizing) the respective SHADOW_PRINTK()
drop the logging of total_pages from the 2nd instance - the value is
necessarily zero after {hap,shadow}_set_allocation().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The remaining parts of hap_final_teardown() could be moved as well, at
the price of a CONFIG_HVM conditional. I wasn't sure whether that was
deemed reasonable.

--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -78,9 +78,6 @@ int shadow_domctl(struct domain *d,
 void shadow_vcpu_teardown(struct vcpu *v);
 void shadow_teardown(struct domain *d, bool *preempted);
 
-/* Call once all of the references to the domain have gone away */
-void shadow_final_teardown(struct domain *d);
-
 void sh_remove_shadows(struct domain *d, mfn_t gmfn, int fast, int all);
 
 /* Adjust shadows ready for a guest page to change its type. */
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -268,8 +268,8 @@ static void hap_free(struct domain *d, m
 
     /*
      * For dying domains, actually free the memory here. This way less work is
-     * left to hap_final_teardown(), which cannot easily have preemption checks
-     * added.
+     * left to paging_final_teardown(), which cannot easily have preemption
+     * checks added.
      */
     if ( unlikely(d->is_dying) )
     {
@@ -552,18 +552,6 @@ void hap_final_teardown(struct domain *d
     for (i = 0; i < MAX_NESTEDP2M; i++) {
         p2m_teardown(d->arch.nested_p2m[i], true, NULL);
     }
-
-    if ( d->arch.paging.total_pages != 0 )
-        hap_teardown(d, NULL);
-
-    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
-    /* Free any memory that the p2m teardown released */
-    paging_lock(d);
-    hap_set_allocation(d, 0, NULL);
-    ASSERT(d->arch.paging.p2m_pages == 0);
-    ASSERT(d->arch.paging.free_pages == 0);
-    ASSERT(d->arch.paging.total_pages == 0);
-    paging_unlock(d);
 }
 
 void hap_vcpu_teardown(struct vcpu *v)
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -842,10 +842,46 @@ int paging_teardown(struct domain *d)
 /* Call once all of the references to the domain have gone away */
 void paging_final_teardown(struct domain *d)
 {
-    if ( hap_enabled(d) )
+    bool hap = hap_enabled(d);
+
+    PAGING_PRINTK("%pd final teardown starts.  Pages total = %u, free = %u, p2m = %u\n",
+                  d, d->arch.paging.total_pages,
+                  d->arch.paging.free_pages, d->arch.paging.p2m_pages);
+
+    if ( hap )
         hap_final_teardown(d);
+
+    /*
+     * Double-check that the domain didn't have any paging memory.
+     * It is possible for a domain that never got domain_kill()ed
+     * to get here with its paging allocation intact.
+     */
+    if ( d->arch.paging.total_pages )
+    {
+        if ( hap )
+            hap_teardown(d, NULL);
+        else
+            shadow_teardown(d, NULL);
+    }
+
+    /* It is now safe to pull down the p2m map. */
+    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
+
+    /* Free any paging memory that the p2m teardown released. */
+    paging_lock(d);
+
+    if ( hap )
+        hap_set_allocation(d, 0, NULL);
     else
-        shadow_final_teardown(d);
+        shadow_set_allocation(d, 0, NULL);
+
+    PAGING_PRINTK("%pd final teardown done.  Pages free = %u, p2m = %u\n",
+                  d, d->arch.paging.free_pages, d->arch.paging.p2m_pages);
+    ASSERT(!d->arch.paging.p2m_pages);
+    ASSERT(!d->arch.paging.free_pages);
+    ASSERT(!d->arch.paging.total_pages);
+
+    paging_unlock(d);
 
     p2m_final_teardown(d);
 }
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1232,7 +1232,7 @@ void shadow_free(struct domain *d, mfn_t
 
         /*
          * For dying domains, actually free the memory here. This way less
-         * work is left to shadow_final_teardown(), which cannot easily have
+         * work is left to paging_final_teardown(), which cannot easily have
          * preemption checks added.
          */
         if ( unlikely(dying) )
@@ -2940,35 +2940,6 @@ out:
     }
 }
 
-void shadow_final_teardown(struct domain *d)
-/* Called by arch_domain_destroy(), when it's safe to pull down the p2m map. */
-{
-    SHADOW_PRINTK("dom %u final teardown starts."
-                   "  Shadow pages total = %u, free = %u, p2m=%u\n",
-                   d->domain_id, d->arch.paging.total_pages,
-                   d->arch.paging.free_pages, d->arch.paging.p2m_pages);
-
-    /* Double-check that the domain didn't have any shadow memory.
-     * It is possible for a domain that never got domain_kill()ed
-     * to get here with its shadow allocation intact. */
-    if ( d->arch.paging.total_pages != 0 )
-        shadow_teardown(d, NULL);
-
-    /* It is now safe to pull down the p2m map. */
-    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
-    /* Free any shadow memory that the p2m teardown released */
-    paging_lock(d);
-    shadow_set_allocation(d, 0, NULL);
-    SHADOW_PRINTK("dom %u final teardown done."
-                   "  Shadow pages total = %u, free = %u, p2m=%u\n",
-                   d->domain_id, d->arch.paging.total_pages,
-                   d->arch.paging.free_pages, d->arch.paging.p2m_pages);
-    ASSERT(d->arch.paging.p2m_pages == 0);
-    ASSERT(d->arch.paging.free_pages == 0);
-    ASSERT(d->arch.paging.total_pages == 0);
-    paging_unlock(d);
-}
-
 static int shadow_one_bit_enable(struct domain *d, u32 mode)
 /* Turn on a single shadow mode feature */
 {


