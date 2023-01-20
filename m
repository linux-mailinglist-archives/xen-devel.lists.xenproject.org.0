Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEB1674FA1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 09:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481505.746440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIn0Y-00055b-Ot; Fri, 20 Jan 2023 08:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481505.746440; Fri, 20 Jan 2023 08:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIn0Y-00053Q-M8; Fri, 20 Jan 2023 08:44:22 +0000
Received: by outflank-mailman (input) for mailman id 481505;
 Fri, 20 Jan 2023 08:44:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1qDs=5R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pIn0X-00053I-RE
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 08:44:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1124ba0-989e-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 09:44:19 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9461.eurprd04.prod.outlook.com (2603:10a6:102:2a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Fri, 20 Jan
 2023 08:44:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 08:44:16 +0000
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
X-Inumbo-ID: a1124ba0-989e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWWYu3YSxEXreRcQ7betFzgVeToS1eJtLqLh7CRITfmWF6L7ICUS6L+Yq1i9uBZBfm/vu7t1lOqtURqoop/rXdqkF3Sc4Ty+zFZLp+qmitECZMfL8RyKvIfh5WNrlobWRXL7WQzIu22y6tAYW8BJN5wNDZutpGQC6o8Y5eqAGVKFMLzaDTb+Mw8PRQhRPYbfEkut+9oZ6+RT+A0r3ltMNH4a5MfoOKTyqPEnVOScC90x7e8BIlR11nOgnOVixfNr8KYYmtZfTAoEZ72/T0LWdPYrAkUpyRNurvcjow1sCbstObcbHmp+eZ3TvqlDs0dqX3qg0HbB+KuEk+AG6En4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bRI3BAsyFGxjaRbNTheSbeJUycSg7Ftm+tyenZvACc=;
 b=loE7Rk20YHUOJibDgea1aZMjsXN2kXGNsQByh92h0OKyL63sNu+6WEKynVNqA/fWlS5U6hS1X4+Oj80ODMlGSOChpLYOC/eLm25PgWANoCmNd4y5Aa8qHg/a83Lxn7CmrNERuGRafoRghwKERHGUA9xuQo+weIFP/Em5FHWa6mC/pLcv7G6i9YcU9ZwdYjBBaUFYqroiGAPTOcsVNCuLRB70b3GTB+6r1oP9r1ZE/Ok8D7/Is9SNnI+C18OkrNPoWtpdDOBxvYGv6JGCK++NlyQGb6TyY1n0FQoH3ev0zGuPwK3MPLswIUf1T16NTcC4nXv+Bz7eIPBvhOQzPQXMkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bRI3BAsyFGxjaRbNTheSbeJUycSg7Ftm+tyenZvACc=;
 b=MFtAqWC+bVmlvj7KiyWdhryK/ORI8mRSeOAue/IK0khIf0X4s1WjsWUlXJsD4/m5muPjinjdn8HeXDVrsX5t67fcWVWoGpEyO33kZc/b6N8V062jnpz20pl5sD8Tf4IkXyDOAMAJVKnkNSH+r4PBqTidEQR8Z9+ltyFUqX0UtbBVEBDKF3GJGUU5F8Pw+1J4Bp8jhsKnJ9ONxU50M/1BR/YgQpIhSQ77LMQK4p//S4DhrJveocEKck7X3/6nR2QzavnisQvZSqhzu7tPIP8K511yUtRuwkKWg4lsPimoOfbx3XumBxCCR0ryjizGbeqfRF5sa1+LotI8GU5cR8Qdqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d41b8ca-decb-e175-c77a-1c8f91fd2046@suse.com>
Date: Fri, 20 Jan 2023 09:44:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/shadow: make iommu_snoop usage consistent with HAP's
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b017b4-7493-4428-7883-08dafac28385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BB7TlQfGLUWQ8FNvX6yI3/V3KmhBJyqRihq7lYp8Q3CQvrwPV4DQHUliWgHqiRFPaa90HtFaGUkr75OW54KJbHztLM5gccageTsG+qtuhdmatzneLEsHvC0ev8o8x41gSFHsRdP+RotUsVmFLHXTkH1HYHV2xF4i7dUzm7/tSgGA0eIceV1o+tmskgL/FYIsnoOG6dVNkZxdXriRGgUTHpzB+A5wHfuSJG6pP8pG1AzbmFwPUUaatOQeC2x/kCKBp9kiYMtt3WggYbgXAPSK1Z4C/Ksd53ioGyzinISQeEUIV4fgTNONvLUevWiWozJEOq6uRBLiz3hkamUlryabzA5lziSOVMK1OxfquPHl1FCS+1ThJ3TkIDYkwekuQCugm+u3k6mdmknPTqWDaaFoJXQWxIAdFQbDlzl1lYJXGIud4s2MkYiAmEvTUljADUhAxim7tv96RNt1zYh06dDZgspCyoM/UlQsN83qmqzHt/KmMI0SjPU9kB9HMC/9hpzh74XKcDW26AGTM3xBnf1PSnMoidc+LH2SZWDDA8YJorQhVtSc6q/+inbWIUkcHRHPjKAa0OXffvOfaZ24NJgwPVidWyK0903UfPxe1Q5ME2JdsSIa+ZFiOejxf81dvhitCwH2rCWfXs5csMBmDoOK8nf72lFFiYMG3M3t9ZkWe2D0Alfc5YDXpZco30lgPfIdbb0QgDG4cHGWYSbYpT5QPMzyJ6pG4wPmSROTTC4U0BeSUbYzksL6mHMn/9EHqIdY6eQfZNeGXVi/t+/1Avc8wA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199015)(31686004)(36756003)(86362001)(8676002)(2906002)(66556008)(54906003)(66946007)(31696002)(6916009)(38100700002)(83380400001)(66476007)(478600001)(966005)(6486002)(316002)(8936002)(41300700001)(4326008)(5660300002)(6506007)(186003)(6512007)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjdtTWJrL3pOUTBidWVoUFVPV3loc3dhMkFSb0p5Q0UyV3BSNDN1VnVRVnNK?=
 =?utf-8?B?K2FKSnhwWjd0VnpNVENLQnBvV3BZcWlwQ0VuU3VmY1lHLzNQODgrdFYvbW9J?=
 =?utf-8?B?M0p3OS8yZmVPWWNVbmU1WWdRaGZjWDRmakpTRHY5TVFBd2ttWW9LYmcwbHlV?=
 =?utf-8?B?SnUyYlp5dExmTFd2Y0x2SmZuemZveWkyU2x5dUdNamZqU3hLQ0lhOXIvbDYw?=
 =?utf-8?B?MXJKTmhoSUE3ekpodzNPUDdiVlkzNTlOcUVYNGNYN0t6eVhKMHFrL0EzUkM4?=
 =?utf-8?B?b1prY2hVeDJpVlU5bUdRSkFKTmwrN1BwbktjaGU3bERQTXZGY2tBSFFjMWly?=
 =?utf-8?B?UURYWkp5UWhqRUJRRU5oS09wTWE1b1VmTWZPMG5EazVKejZ6czFRWGdrVkR6?=
 =?utf-8?B?Mkpzdy9LZk1TR09KV0wyVXRVWm1aTXFtU1VIRiszOE5rTFNaNC9aeDJ6MGlF?=
 =?utf-8?B?S2hvYVlueVV2S09UNnF2ZG9NWUVDMGVLRllyc3IwRzVQVExGVkFXbjJoWjdT?=
 =?utf-8?B?NncwV2xZcTN3MExOS1E3blRxaVJYWDlkOGFEQTZhcTk1VjBuTWtOQWo2MTY1?=
 =?utf-8?B?RmJUSUtnNzY0NUFGNTYvUGlOMzBpK3B0MW4zSTVzVkVJb05uRllKVnN0NXlz?=
 =?utf-8?B?bHdZRHdUVDVLb2xmU3RmWDBkS0Yvc0Zta2NBLy9UZCtHakZ5UFl1aGpQczNV?=
 =?utf-8?B?OENrSCs5bmUzTXduUlNJWGdxWXhIK1ZXMnpTb0d3Si8yZGowcEVyaDNVL3Zi?=
 =?utf-8?B?UkVjM0IxeVNSUDZLa1RUa1ZGUmtTZkZtdENCOWdzUkxMRUtvS1NNZFlKam51?=
 =?utf-8?B?cHdnNjRod1lMdjEwNnM3MzJsb3hNdDBicUZ4ZlI5alNNMzdNYVNKVSs1RFAr?=
 =?utf-8?B?TnUyQ2pWTDRzOStOM2xqa3kwTzhsUlFvOFJoUlZuSlJ4cTlBM3VZSTJsMWVv?=
 =?utf-8?B?b2wrVGkyVVQybk1nbDBnaWIwOTVtQXZzenlRWDloczlLTG9BcXpRbFJQSE1B?=
 =?utf-8?B?RGkxcmlZeUI4NDhrWk95b2lNS3U1YjF6dHJGUm5TQ25JZnBncGpUbHoxRFF2?=
 =?utf-8?B?V3JHSFVwWmVqSy9kSDhmcW9nQXFKUEJPWFVzckgrVEdUN0E3NUZMSE1hYm5w?=
 =?utf-8?B?UldVemRsb1JwY0ZpZXZnekorRmZ6V016UVpCN3BWeTAyM2RKdmtzQkcwVjNw?=
 =?utf-8?B?YWJIM1RMVE9TNUQrQW5Xa01tcVZFWDY1dVRJYTlLeTlmVDQ1NytkeTlOL1M1?=
 =?utf-8?B?TEVZcDVxamlnYWpic3BFcXFpWGtnclFuZnB1UWxNckJUOUZodnNTZUxqcVln?=
 =?utf-8?B?a2VmcVJBRjdNQXZQZVlsUGlkKzBTUHFMSGtwRkQ2WEk3K1hPTEh2MjhOanBU?=
 =?utf-8?B?eXVyeU52NVdSMmkrbERKWC9ZNi9IcENFOWoxdjZyMHkwV0crM0VtNTVRL2ND?=
 =?utf-8?B?NmY0NStjM2hkU3VrRFFJTXlCTzhRaHRRWm5zVzlPTmliU2pGVG1JblB3bU9P?=
 =?utf-8?B?U0g4MjRMUjFzSEhoZDlzaEFYY0tUU0ltWVhNR3VNeVhyQnU0aFV6c09teTl1?=
 =?utf-8?B?MlhDYzVLY2NHUXlQWmhhMVFqR0hEc1BDa2MrbFptSGtobHFaQzF6cmVMSkd3?=
 =?utf-8?B?bU5vSHRjZzlwMnlmd25nK2t0U2VuSEFCdGMwelVTWEdZQWg0d0JoSmhtOWQ0?=
 =?utf-8?B?TGhzdWM4K0N6WTJIWnVlUElaYW05TGVPdE9TVTVURGhKa2JxWGdKc3JoOGVR?=
 =?utf-8?B?TXNKc0JxblNsWmp1Wnl4N1ZYZFlMZEw4Q3RxZlpML21iRjNJaTVWRjVRaUpS?=
 =?utf-8?B?b2JSdUN5UzllQmN2UUV1R2ZYd3lvZ0VKYmVjMDlkRnMveWZLbzlSaDdHZ1Vz?=
 =?utf-8?B?RVFPWlhLSW90VVVTbmNxL3hBNVhMaElsUEhRR2FrMkhUM2lRVUlyMjFCN25a?=
 =?utf-8?B?MTBrTU90Rll6OThCTjJjd2ZrL1JRRTdNVDhUYWExNjJrM0I5Mk1UbGs0d25C?=
 =?utf-8?B?amtRektSd1ArVEM2aWZDQ0hXK3RwNU1OKzIwbE1hMUNGWHpJSm10cWd5RVNz?=
 =?utf-8?B?VEdVcW1wZWNseWZCTHd0NktNOFdXTzJ0UDdzM0c4YjgwS3pvZ2s2eXpwOFNs?=
 =?utf-8?Q?SwzOFiJpA3QfqCCLZsgX1ztsH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b017b4-7493-4428-7883-08dafac28385
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 08:44:16.4758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNwr8tGrToeoQtkkMll+2VJDNghd0rqU27fj4uGv4g7W1osOxeQf1KLnRCprneopRcX3k2VQ6cMz/dZmlhIGhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9461

First of all the variable is meaningful only when an IOMMU is in use for
a guest. Qualify the check accordingly, like done elsewhere. Furthermore
the controlling command line option is supposed to take effect on VT-d
only. Since command line parsing happens before we know whether we're
going to use VT-d, force the variable back to set when instead running
with AMD IOMMU(s).

Since it may end up misleading, also remove the clearing of the flag in
iommu_setup() and vtd_setup()'s error path. The variable simply is
meaningless with IOMMU(s) disabled, so there's no point touching it
there.

Finally also correct a relevant nearby comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was first considering to add the extra check to the outermost
enclosing if(), but I guess that would break the (questionable) case of
assigning MMIO ranges directly by address. The way it's done now also
better fits the existing checks, in particular the ones in p2m-ept.c.

Note that the #ifndef is put there in anticipation of iommu_snoop
becoming a #define when !IOMMU_INTEL (see
https://lists.xen.org/archives/html/xen-devel/2023-01/msg00103.html
and replies).

In _sh_propagate() I'm further puzzled: The iomem_access_permitted()
certainly suggests very bad things could happen if it returned false
(i.e. in the implicit "else" case). The assumption looks to be that no
bad "target_mfn" can make it there. But overall things might end up
looking more sane (and being cheaper) when simply using "mmio_mfn"
instead.
---
v2: Change title. Extend comment in acpi_iommu_init(). Purge clearing
    of the variable from iommu_setup() and vtd_setup()'s error path.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -556,8 +556,8 @@ _sh_propagate(struct vcpu *v,
 
         ASSERT(!(sflags & PAGE_CACHE_ATTRS));
 
-        /* compute the PAT index for shadow page entry when VT-d is enabled
-         * and device assigned.
+        /*
+         * Compute the PAT index for shadow page entry when IOMMU is enabled.
          * 1) direct MMIO: compute the PAT index with gMTRR=UC and gPAT.
          * 2) if enables snoop control, compute the PAT index as WB.
          * 3) if disables snoop control, compute the PAT index with
@@ -577,7 +577,7 @@ _sh_propagate(struct vcpu *v,
                             gfn_to_paddr(target_gfn),
                             mfn_to_maddr(target_mfn),
                             X86_MT_UC);
-                else if ( iommu_snoop )
+                else if ( is_iommu_enabled(d) && iommu_snoop )
                     sflags |= pat_type_2_pte_flags(X86_MT_WB);
                 else
                     sflags |= get_pat_flags(v,
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -587,9 +587,6 @@ int __init iommu_setup(void)
     printk("I/O virtualisation %sabled\n", iommu_enabled ? "en" : "dis");
     if ( !iommu_enabled )
     {
-#ifndef iommu_snoop
-        iommu_snoop = false;
-#endif
         iommu_hwdom_passthrough = false;
         iommu_hwdom_strict = false;
     }
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2746,9 +2746,6 @@ static int __init cf_check vtd_setup(voi
 
  error:
     iommu_enabled = 0;
-#ifndef iommu_snoop
-    iommu_snoop = false;
-#endif
     iommu_hwdom_passthrough = false;
     iommu_qinval = 0;
     iommu_intremap = iommu_intremap_off;
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -56,6 +56,17 @@ void __init acpi_iommu_init(void)
     if ( !acpi_disabled )
     {
         ret = acpi_dmar_init();
+
+#ifndef iommu_snoop
+        /*
+         * As long as there's no per-domain snoop control, and as long as on
+         * AMD we uniformly force coherent accesses, a possible command line
+         * override should affect VT-d only.
+         */
+        if ( ret )
+            iommu_snoop = true;
+#endif
+
         if ( ret == -ENODEV )
             ret = acpi_ivrs_init();
     }

