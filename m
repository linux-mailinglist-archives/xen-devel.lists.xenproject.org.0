Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F526F5B9C
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529335.823651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEqa-000468-Cq; Wed, 03 May 2023 15:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529335.823651; Wed, 03 May 2023 15:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEqa-000430-9d; Wed, 03 May 2023 15:56:52 +0000
Received: by outflank-mailman (input) for mailman id 529335;
 Wed, 03 May 2023 15:56:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puEqY-00042q-Nk
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:56:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d1b9cdb-e9cb-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 17:56:49 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM9PR04MB8290.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 15:56:48 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:56:48 +0000
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
X-Inumbo-ID: 1d1b9cdb-e9cb-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgjoTUN6CbxKasVTNMIxaD8XwmSLIRV+DyqK6OYqLjQbNQHofyE4bQ5PqpvLrDrmPcPX6VrLYQwxIUnED8nZJxZ9Z7fIbdmu9HIAe18oVsv2laqUU3gMrcdeusKrWJmebtzqIF4tJ4PktucSPMOMCUitQHHQfIp3neMghZmIkPuVSCza29qEu52s52WUBqsNP0uGy0na+lk2GyNyrckDpEvYaYAiLCvbRABagoCa1O2zZXDBmUAsPtQG3j//Z4DslV0k3x5eui+9KwrMofN4raU5LM4Jvl7Upwy+XeGVPgYNyARikWEMxc/uiXHRB5PohhEeSc7ngDQg/Qpw8rr+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+yAFYV7AlsDjWOjH7N7vMb8CphBeaTJd50l2bpX5dg=;
 b=Z+yC1slpCuamfXNjHaPWV1NAMO6BU1z3EQja1Fs9ngsGSUxe4pelq1WuMqKJQJBtj8vYkpWV3tBMvzYKjS/82Jz+4eudTx8jgXAT7WEKB8BcPPXFoM94d4LG3NkDxwlgj9ip3igFL9t8naOpAMxAhyRP9yNoTFpeTeuTtHM5vvWSPgktKQOuf14qjsH/nwR414u9oBT9+xpsTCy8nkV+VH1Jo6lJlkE3z+pRHmGyGLHD3TUWMysvKycxckf4zcm6acG9pLESb77B/lxtTnqfqVLEUFMZhS8fVK3cxYymhdxzf/5w0GTMUPKasOJ/sCihsHBJHd7gkhuT1udU3LnPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+yAFYV7AlsDjWOjH7N7vMb8CphBeaTJd50l2bpX5dg=;
 b=vrgIQX9XaVWdZVcA4/SlZpstpXpAJmmoQL76lByw/wEQJs07/XjrzPos0G0YyOm0ilx7uFhERhhM2T35+56bNxisQdnW1Qf92hlw1BY47GpjnEFAsvNVwlCphNuwFEOfxaXAmg7cRojrvToJ4Ysd8v37YENn5Burjyp3O2YTAxNTBNDvt7GTVrW3Ndf/5How766lcpzswxfYWw9CBsy/eDDxiAdiELX5kUl0ILQGoFCSTsmfW4rbmC9H3i64CyduLMdfOYgnkWnFl0lnmJ5DG9X+P8lUjf0n7co3R30vGdvxeWBqB8Dsovy7piESniTxZtNjpTU36Ih6cUGA803JKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
Date: Wed, 3 May 2023 17:56:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 4/8] x86/mem-sharing: copy GADDR based shared guest areas
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
In-Reply-To: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::7) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM9PR04MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: b1bb34b2-2845-498c-2856-08db4bef00a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	281ssijAfKKP6qCPeODgn5xmJm5AZl5edljNsSZgwqj34uMmnMoIkfFxz4QZlheV+Bm6gEuQmO1LfzTtHCGXY9R56jlawoU1bgb5UdMZ/4VGZdDCu3qZxY63Eyq56uANVn6uTMmCWyQ/++fLoqAPaeMmT5nXH8HmizOynZgdp9avkfJOV2lSWzVEIKxfcDDVCEOMzhHV3Ptk5h5ng2E++VjWcOX+gTQzlhzUynyZZJrYlnCRMHujW/oiIU6LYiICpRrmkerdH1iBlzAkafokwUFBWckQDIVl2EakBPCxNxUtKPJabmS44pVodSZnVWaoHAgdnuJuGMh0s1QN34HmCh4AMdS5mcq8APBAkDFTdCU9GZWOxOZEe/w9IJdA2Rf1qyPjiWBv+1TlDiIsNpqg5SH795pxJzrKhYBGzyDr/GKcHvUrUhvDYgmPBPgwzT6m5dTKejIc3tVgI7+4wxCfBT/R/ayudPrbUixg6uCl1ESVB5hGk3ebDezEy4Dnu+a6/BiZrIYptOEDrRPp53ybqnT3MFwIt4Kh1uTVVyKo6e9BODrULxuXzAuLFtxhKnIrHqtr9Z5B4P/LqAwyBIkV4l7XWzuM4/IbmXs1IEfDXgra9vEcRLAZZ2x4Txg7R7c4KRIiMJKpImsdpwmGZDLBTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199021)(2906002)(38100700002)(8936002)(8676002)(5660300002)(31696002)(36756003)(86362001)(6486002)(478600001)(54906003)(186003)(6512007)(26005)(6506007)(31686004)(2616005)(83380400001)(41300700001)(66556008)(66946007)(66476007)(6916009)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2RsanIwWDdvUVhBd0J4YXRmTk1wTnNOc0g0K25JejNZa0J4ZEFZOUtUN0g4?=
 =?utf-8?B?eFVHL1ptZDNDZjNkM1lhNE9wb3g5cGwxcjFlUzZ6NTFMQWJTcXRuN0JzZk1h?=
 =?utf-8?B?V2dkZjlab05laHhGaGU5cC80N0RUWWtPTXNvcElGRURpUWlESDJ1NnRaUm93?=
 =?utf-8?B?MkdWbkFZZ0N0RUdMK1dwK2JmbWZxUTNYc0V3QmRBekd1L1ovbmdFNjZCRzFE?=
 =?utf-8?B?d21XZEYzL05DanRBZHhpLzdpWlgxZVMwRlBEa2tyWWkreGVic3pOQURkays4?=
 =?utf-8?B?V3h0MW5SbElsUk1YeXIwczFqK1l6aFlQUDRaM3NuOEo3Ly9OenF2MHpwQ0cr?=
 =?utf-8?B?U1BLcFZiQXMxTndGTzZIQmNvSDFZS1Rtd3RkZ3pSSHBFTlVIajF1YndNU29E?=
 =?utf-8?B?WXBiL0ZBSHRHbG1tZmN3YjVtTzJCanhXK25GWWRyVVdmWThkVDAvV21EQTVB?=
 =?utf-8?B?ZDFmNGh0L3o4NFdiQTZSMHp1cDlXdXp5V0w3WW84eTlkWHVoQmk5MTRnOFZ3?=
 =?utf-8?B?MmlqakFQMlo3cjRScTJmWWdhRTRJVnJxZkJDaEdOcE1yZUNYRGlGMllVRGpJ?=
 =?utf-8?B?dGVVUjIvUXBRM1FRZU5xTk1nNnV5M3gybW1jVmErc2tMWnhKdTBlQXdNZXFo?=
 =?utf-8?B?d0wyWmlaNGduQ09KcEdJUmNIRXRENmZzTGlrZlUzelhxZGVTOVc3ZEkySTBX?=
 =?utf-8?B?aGliYk41ZXBROVg1cnBlbTc3WFIyOUR6NW9sMkNhV0lNUEVzVXR3TmNpVmdS?=
 =?utf-8?B?a3QzTDZYYkt6QmZ4UkMyVyszd2lVRUNFTG00ZXRFL21PRE9Xdzl4MmRUbmM4?=
 =?utf-8?B?UFE2WWl6eFFUc216K0RUZXpHQmRUYU9YK09CcXNNQU01ZFg0RVhBVXdZSWt3?=
 =?utf-8?B?U3JHa3dEbHl4S1BFL3VOMitmNXBGWnFKOW8zaTNWbXFrU3hXUmhyUnZOZm1X?=
 =?utf-8?B?Y25ORGo5TmZlQ255aGNHRkduUGVJTkZVNnpoZVQvajJCeGRLMmxtd2JtdEpp?=
 =?utf-8?B?SjF1UmZjVWVwM25Xbk8ybk1TRWFOcGxORVRCMlpNTnBIczcxbXh5V2NRR25G?=
 =?utf-8?B?UFlZOTZucGIwUlpETzkzSmFwc1p3K2xOUTJ1ZmVPV0VsRnZuMTVWbEo3M2hx?=
 =?utf-8?B?eXBOYTUwejhXTkRsUEU2eW80YUJkVWRuWkluNDZZNDdqTkJidGpaRi85eklL?=
 =?utf-8?B?c0ZSbzlWdkFwSHc3S3k2azJMekpxWTh0WEttSFZoZDFBVy9ydGFpd205bHYz?=
 =?utf-8?B?M2lDdW9jTS93cXVaakw5SmQ2d0U3NnFVRW15eXRSc1cvVzNyc0V0MnFqM29y?=
 =?utf-8?B?bXpzVXNvcW5TZm1XVmdoeXJHczFBTTBYZFAxVlNlOWlqZkczeG1ZWHUvOXdM?=
 =?utf-8?B?Umpub3JNVFN5VnJDVE5CODYzNUtWdGczK1JPdG5lRy9ZNGhtdEdvWnNxVUNR?=
 =?utf-8?B?U2hHQjRBbmE5UlRQVGVnUWxhVG16alNQdzVWUi9zT3dPSWk5bCtBdUYwYk1j?=
 =?utf-8?B?NTJoRkVkQ2lxVkVLcmFPSnZnOVFNaGpqVzdoZlZJM3UvaURjUnFGMnpiTjEv?=
 =?utf-8?B?ZW5KcjZGQzA1ZHdqc05jODAyZXBKNVJhNmFiS21zM2ZpK1RpYUhob1BEd1pX?=
 =?utf-8?B?VGtSRkMwUWZJRi9lOFBjSURReWQ0U2gySXlmOTI3VkJDcTViQitaaGJjQ2or?=
 =?utf-8?B?YnZhSmYxZWZ4d2R2MWg2UjU2NHJQRGI5NlUyVjJiT2dnY0Fya0RSUFVuRDNF?=
 =?utf-8?B?SmEyVTVhV2RHYUZzZlBNaXlXZFdKbjkwNXB3UmVTYlpkS3FtUlVLM2tvRFhW?=
 =?utf-8?B?eXBUWUMyK0RIYXRXNWRZNllmbzk3RHhBZUhsYU0zL0FqWVRPOUxMWVVnMU9S?=
 =?utf-8?B?bUNYU0FnaWJiZ0xiR1hVT1BQdTlYeXp0cm9BWUZ5eTFpUmNaTUhOM0UrYTlr?=
 =?utf-8?B?bWs4eTBWSHoyVTMwZUhMaXVpcHpDTXBROEs4NlgvaFVrYmh2bUVSbDBBR29H?=
 =?utf-8?B?aExucXQxMC92b3pBeGNZWXZkcFRIOWl3Y1FxZnhTMFVvNGp6TmxZdnZtMVpV?=
 =?utf-8?B?NERNNkVlUU83WVY5a2IxTThYM1BPWVV4UGJ6TWJOUjdLWnhseHlYcU1VcUh1?=
 =?utf-8?Q?uYXiPlATYodlWJnF0llVq2vBM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bb34b2-2845-498c-2856-08db4bef00a7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:56:48.4224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbQ2fpMW8jWUj8uN6cZSiyEIXjZxhuReTi0qZoTODu897SIIU59hWq+bDj6+BU7IiSU/fZn6ycP+pd1pnaxOCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8290

In preparation of the introduction of new vCPU operations allowing to
register the respective areas (one of the two is x86-specific) by
guest-physical address, add the necessary fork handling (with the
backing function yet to be filled in).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Extend comment.

--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
     hvm_set_nonreg_state(cd_vcpu, &nrs);
 }
 
+static int copy_guest_area(struct guest_area *cd_area,
+                           const struct guest_area *d_area,
+                           struct vcpu *cd_vcpu,
+                           const struct domain *d)
+{
+    mfn_t d_mfn, cd_mfn;
+
+    if ( !d_area->pg )
+        return 0;
+
+    d_mfn = page_to_mfn(d_area->pg);
+
+    /* Allocate & map a page for the area if it hasn't been already. */
+    if ( !cd_area->pg )
+    {
+        gfn_t gfn = mfn_to_gfn(d, d_mfn);
+        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
+        p2m_type_t p2mt;
+        p2m_access_t p2ma;
+        unsigned int offset;
+        int ret;
+
+        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
+        if ( mfn_eq(cd_mfn, INVALID_MFN) )
+        {
+            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
+
+            if ( !pg )
+                return -ENOMEM;
+
+            cd_mfn = page_to_mfn(pg);
+            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
+
+            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
+                                 p2m->default_access, -1);
+            if ( ret )
+                return ret;
+        }
+        else if ( p2mt != p2m_ram_rw )
+            return -EBUSY;
+
+        /*
+         * Map the into the guest. For simplicity specify the entire range up
+         * to the end of the page: All the function uses it for is to check
+         * that the range doesn't cross page boundaries. Having the area mapped
+         * in the original domain implies that it fits there and therefore will
+         * also fit in the clone.
+         */
+        offset = PAGE_OFFSET(d_area->map);
+        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
+                             PAGE_SIZE - offset, cd_area, NULL);
+        if ( ret )
+            return ret;
+    }
+    else
+        cd_mfn = page_to_mfn(cd_area->pg);
+
+    copy_domain_page(cd_mfn, d_mfn);
+
+    return 0;
+}
+
 static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
 {
     struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
@@ -1733,6 +1795,16 @@ static int copy_vcpu_settings(struct dom
             copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
         }
 
+        /* Same for the (physically registered) runstate and time info areas. */
+        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
+                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
+        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
+                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
+
         ret = copy_vpmu(d_vcpu, cd_vcpu);
         if ( ret )
             return ret;
@@ -1974,7 +2046,10 @@ int mem_sharing_fork_reset(struct domain
 
  state:
     if ( reset_state )
+    {
         rc = copy_settings(d, pd);
+        /* TBD: What to do here with -ERESTART? */
+    }
 
     domain_unpause(d);
 
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1572,6 +1572,13 @@ void unmap_vcpu_info(struct vcpu *v)
     put_page_and_type(mfn_to_page(mfn));
 }
 
+int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
+                   struct guest_area *area,
+                   void (*populate)(void *dst, struct vcpu *v))
+{
+    return -EOPNOTSUPP;
+}
+
 /*
  * This is only intended to be used for domain cleanup (or more generally only
  * with at least the respective vCPU, if it's not the current one, reliably


