Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D016650DBA1
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:50:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312607.529942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuPf-0000WI-F5; Mon, 25 Apr 2022 08:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312607.529942; Mon, 25 Apr 2022 08:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuPf-0000Tn-BR; Mon, 25 Apr 2022 08:49:43 +0000
Received: by outflank-mailman (input) for mailman id 312607;
 Mon, 25 Apr 2022 08:49:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuPd-0000Th-OC
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:49:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4ceb4c1-c474-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 10:49:40 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-q9CrLb4vPLGPfUr5BBNyIQ-2; Mon, 25 Apr 2022 10:49:39 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0401MB2254.eurprd04.prod.outlook.com (2603:10a6:800:28::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:49:34 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:49:34 +0000
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
X-Inumbo-ID: a4ceb4c1-c474-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=chFDKHBsC5izimoPwLLKxQUCJ/4iaPH++rRNrnlfBkA=;
	b=IBFrcdsVLtgP314ygb5clewl3Z9tEQhYOmaixuhnix43LFwxhsyd3OJTujKuFrLrYGklsA
	PlukhmrYH00WHBHZUXops1wWKjOTaVIFhQlEiKG5Lq1KnWfDz3Tnm4AOcc0BM+114kDVNI
	yDTr9Q9X+TMNoytm00Qh9Nyx93pB4bU=
X-MC-Unique: q9CrLb4vPLGPfUr5BBNyIQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXnyC8+xqObSXjfAQLg+rllX4qZdTM+WjhnNZodE0ngGBrMaMHEr2wQbHft8gNOwllYTzxRlrCmXQbTWIrBkQRaKNCtfYtUX6F4mIsjapgpbWw0mPt5xtC7vFWK8oPTDBxdhjouefTXv2aIGRQKKqGgA6KJTsJjKQNR4GKhfL590Bsz/mqdKW5MDoPzZlmKYYcvjYKifAJunLVLvKMv0GHL1RW6+IaTFul5dohpwcffJHIYVH+x0/M06dQQjXqHTsQgpWGow74lG4a7Vymvfvh1qT890uCwKqXCJG3+/iVripwytO+E6tlWOAFmBFrtwA1SRCi300OKk5dqi5zbJjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chFDKHBsC5izimoPwLLKxQUCJ/4iaPH++rRNrnlfBkA=;
 b=Nzl+CQg5lhgXm7MNpFLSadkRK/iy3mh1aPeg1raluAxOS+qhyDuC65amkxeKCjXq5QYcKr1InAwT2en6bM/e7lP/yu0C/33lXGW2vtKYXFCtVHvY+dX24YboD1eWhWG9pBsoVYns3FkwGts9olJjV26IcWl1F5Kr/mKcDSSWjhcJMRZxLeAE7F5+T4CC+tOFXwMMxjQ/kzLjLGNQ20O8/c31jixqA+M7ycwr5WY9ugqdjVbMh2zKahCoekR5+SkYDDL2gJmFa1TvIXI3BNcnCsUHTUb12TFn6RbOLKJEGnVVePt0A4YxwlujW93Y7JZZiLt5P7WogofRIfqyPoujhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <368e2d54-09f2-2081-349e-571bfeab13af@suse.com>
Date: Mon, 25 Apr 2022 10:49:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86+libxl: correct p2m (shadow) memory pool size
 calculation
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0087.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::9) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5867052d-78a8-4c79-ff84-08da26988557
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2254:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB22547F0D5A22D80BED7DACBAB3F89@VI1PR0401MB2254.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iv4cMiK6boozBaPtvN/7PfCXLWEWa9/p617pC6o65i+JsKCOOGm1KxrCjv0EMgoYdbgt81Vq6RyddNLRNxP0l6bmSifOOqIJkvBnox4aVRqq0njSqhE5+LJJvJjpCL67497O1UQblPY/miwI461Xx3KytUWkQUyYLeaci7GvP1750fT7hQENDkiOFw0lMb7a5ohuQAml8LIp8vqy6rtbtqdaJ5QiNbWPOKlNIAHKdLK0SM+JCpNtihfA6evL76Uwlh4NWi9g6IfwLQ2iQYMWnyICjm9+wCl/usRu7kbIDW948f9oDVXtB8L8/pf6H4TFnScNbQ4bTElZqm8GXo3N8cgo3pk6IDBLNb4h2qBF3mGiBwl/APbfcHi0yRc1VMTKd/qrqWJAsNFKdXlz3yo0u9phQwO4UYulSFbNXYYksMCGZuO7CGKQitDEM1/wlyK0bZ8VBLlHS3QLt+hyA5/xKwY0RvzHgZa5q7PSqwVNNFAdcdBhBuPUGA4y7wTNCZjHGzF+FrH0YAxTQnE06Wat5LUyZJEICJPNGh8i+3OEm4Ij4bTIgzTGfIvi0pR2Uk3Gs4W6bqe5h492bTe3xeLAgx0j6w8hw9SgCVcxe4mtqaQz8NpyW7W9Agmd4SLq7gLr79qRmKVoIPhBgsnHDom/QpYuSixV/PlyqtnpoKhFZasKUCz3yj7KpYayXr5SBbF7OhDWo0k7OmwxgsLQjtlIHKVaC1wVHITrRrxjwrjx3Uo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(508600001)(186003)(6486002)(66476007)(8676002)(4326008)(6506007)(6916009)(2906002)(107886003)(66946007)(86362001)(26005)(8936002)(38100700002)(54906003)(6512007)(5660300002)(31696002)(36756003)(2616005)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFN5cENEUFd4RGZqbkxRUERFZWxaZ05PdnhyOFRIRUMydnVESzVuVHkxT0ly?=
 =?utf-8?B?TkFnT0FYVlBVNThGMDJjb1g5Yk10aHRxc21oUG1IM2hxQkxlZHZnUzlVamc4?=
 =?utf-8?B?a2oyWWI0UFZCRFIzbEdQbDVMR2RDamRhNE9QVlhuS1FaRFZXQy9zK2xDWjFF?=
 =?utf-8?B?N2MxLzBxTDJXcE5ka0FveEVkdDZSL1ZHK1JzQ2hQT1Z1M3lYTUxXNWpGMzdX?=
 =?utf-8?B?SE5rVWVraTJ4NXN0M05kdWd2RXN1blVaeHFqZ0dnblpoRGJ5T2hrVGQ1Wncx?=
 =?utf-8?B?SE04bE41UWNaQXBBVFM3ZVZlSGdLcWt5aWJDOHozKzgrQjl6b2lNWXlaU3c2?=
 =?utf-8?B?WlVUUndhYVAyeFNKTUlPdDlDSmpxYzJ4SVAwelV5b2NiSHh3bi9vL2NmTkxB?=
 =?utf-8?B?OVQ3aHJScE9EUVNpTCs3WHRKbTluQlZHYi9tYXRCc0UxR3c5dWFMNUlacTJm?=
 =?utf-8?B?UmZ1NE92SldycEZLbHJ4SExhd2paa3FiZk85RUd0eXZCWjlWcWpXUTYzWW9o?=
 =?utf-8?B?T3pCOTZ1QUNiSzlnRGRMaDRKOExaMGRIc2VBM0NUejZFckhNV3VQMHRMOXht?=
 =?utf-8?B?bEFGK2NLZE9uaGJVRjJHM0tYelFLL3VTbEM4azdsVkI2N2FybFU1OVBaU2xW?=
 =?utf-8?B?WTUraVFrTHZCTWpIM1hvSG5Cb0RDWDcvT1NIMDM1YUpuREVpMldzUHN0cyty?=
 =?utf-8?B?NjNMV0h1c1p3MTZYY0FnQTdtTkFIMzFMZWRteWFwVkdHTDY0dCtxT252TzN5?=
 =?utf-8?B?WUlhMzZrTWdONjBHL0JadVo4SExpS3A3MUl1WVdkbEtOS3J1aEN5Mm9KMzJI?=
 =?utf-8?B?bVZkZkpjS0xGRU5ncUp5SnVPQUtQRmx4bGh5VnJhR0R5N0dGTlVCZHVUZkt1?=
 =?utf-8?B?akpmNllUd21rRElYT1g5ZUtadWZoTS9hWGd6UnUvbnVTeUxqelhtbWU0WWpt?=
 =?utf-8?B?eUs5dnJTNG1mYzF2Y29YK1g3TVpoWFc4VmNFTElJRTcyM3BGYVF1YnhDeWlm?=
 =?utf-8?B?VVdSeWI1UHNBM3BhQUFpZGVzb1lYbnNYdzFqcVhaVGRmdk80OGJ3Y3pSUG11?=
 =?utf-8?B?bXpDZVcvUzJTY2swRisyNmRNVWx3UVl5azJzeGVDVU8wZjAvMUpoV1E4MDlr?=
 =?utf-8?B?bzllVXlLL3czYnNIZkRLS0UwbDdnTnRuTDE4N094QVhnd0ZUVzl2dTFMdzFp?=
 =?utf-8?B?TG5QSE13dnV2eG1jUkFvK2NtQjBFU0pZVGlVd1hGaXlYSGNFbEFHeWxSOHMz?=
 =?utf-8?B?Q1ozZUpWRXN2dW9UOExmbW01TmlGdktGWEdwUmJUUmphcklBZDlVQ1pralJQ?=
 =?utf-8?B?cTkrWEJuTm02c0M4RE1MajdpMjVnNkFsNnV1UzhNSko0UldhbVIwTlJaemdz?=
 =?utf-8?B?S0NZUTllMEJFeUlBaHhaQllmUk1jWVVXMmljc3RvajQ5TUQ3bHo4VW9RelBK?=
 =?utf-8?B?MWFEUVVlQzhUc1VPNXZNQnBDN3lDOUNtbHhSMGxUZWZvaDlxZXp0d2JuZEpI?=
 =?utf-8?B?VHEyaTFiaGZYaVJybHUyZE9MbHFZeEtaVVE3QUJJZE5MRG9vY1JkNkhzbk9i?=
 =?utf-8?B?bGZzN3hkWTVhSHVPUU1HWHd2ZU9Vb0ZidDFYVkUrdFQ1VFpNQ3FBSG5WUC9N?=
 =?utf-8?B?cWpiNlR4WjFJUEJnZW5kSnpEMThDZkg0NUhGQ2s4MFB1TGpEVUFFa0t6OTBM?=
 =?utf-8?B?UmM0emRHZmkzRWxHTi9LV3pqbUQ5Zm55NDlqMDFPSElaaHAxWGhKYmxGakov?=
 =?utf-8?B?OHRka2Z5T3NlbWIxNU5rSFJzYkREVHpDaWlIN0ZreVlvQ1pBclhoR2haTmtl?=
 =?utf-8?B?NmNIR1pEVHg0blRRakQ4Q0E4SkpnYkFLN05yVFZkZHdad1FTbmR2U1lDcENP?=
 =?utf-8?B?cHFkclRNK1pFeG1vUDVRZ0F1REo5VWtvQTdvejY0OUpnQ0VZZzdKWWx4ZXJH?=
 =?utf-8?B?VGpwOEdRaTVueTZHaDdoTDBCVWNRQ3c0TEVvWnIybENWWHJsdi9kdForUUdL?=
 =?utf-8?B?QUlCcStqMmNZRi9IZ2NJMk5RNDBhR0VSaHJpek1TQUJQckxBcW1HY2I2R0lD?=
 =?utf-8?B?VExBZTNKOEFkS0FBU09RTDY1VUM2SGdZekh6UFdaTzN5VjM3ZHIrYThEa0M2?=
 =?utf-8?B?NU8wYStEbVcweHlGUEZMOERlMGNpTU9YZm5lQ2oxWVRrVlVWYkpFS0x4cHFQ?=
 =?utf-8?B?em54MGdoZ2Z0NlczZHIzN2drRzZwa1FraWVuNWRrUFFNNzRRTklMblpuNEN0?=
 =?utf-8?B?VzJUYjJSSHkwbU5VQWE3anZsSUlHbk5OMTA3Q21CWWRFenRIdnN4NjJFbCtO?=
 =?utf-8?B?YVFGUzNTS0c2cjlUWUhEc2NLK1BlenduWnltREJ4YUw3Z1dKaW5lQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5867052d-78a8-4c79-ff84-08da26988557
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:49:34.1148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGbaCPizxzDZ0HEp1BKjm5QzQljYq/gwrPCjq8NG2pZ9KG0A44SOz2Ng8VYO0szfx9sh20G7gIISGPDRqdw7zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2254

The reference "to shadow the resident processes" is applicable to
domains (potentially) running in shadow mode only. Adjust the
calculations accordingly. This, however, requires further parameters.
Since the original function is deprecated anyway, and since it can't be
changed (for being part of a stable ABI), introduce a new (internal
only) function, with the deprecated one simply becoming a wrapper.

In dom0_paging_pages() also take the opportunity and stop open-coding
DIV_ROUND_UP().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Introduce libxl__get_required_paging_memory().

--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1017,7 +1017,7 @@ static bool ok_to_default_memkb_in_creat
      * The result is that the behaviour with old callers is the same
      * as in 4.13: no additional memory is allocated for shadow and
      * iommu (unless the caller set shadow_memkb, eg from a call to
-     * libxl_get_required_shadow_memory).
+     * libxl__get_required_paging_memory).
      */
     return !CTX->libxl_domain_need_memory_0x041200_called ||
             CTX->libxl_domain_need_memory_called;
@@ -1027,6 +1027,24 @@ static bool ok_to_default_memkb_in_creat
      */
 }
 
+unsigned long libxl__get_required_paging_memory(unsigned long maxmem_kb,
+                                                unsigned int smp_cpus,
+                                                libxl_domain_type type,
+                                                bool hap)
+{
+    /*
+     * 256 pages (1MB) per vcpu,
+     * plus 1 page per MiB of RAM for the P2M map (for non-PV guests),
+     * plus 1 page per MiB of RAM to shadow the resident processes (for shadow
+     * mode guests).
+     * This is higher than the minimum that Xen would allocate if no value
+     * were given (but the Xen minimum is for safety, not performance).
+     */
+    return 4 * (256 * smp_cpus +
+                ((type != LIBXL_DOMAIN_TYPE_PV) + !hap) *
+                (maxmem_kb / 1024));
+}
+
 static unsigned long libxl__get_required_iommu_memory(unsigned long maxmem_kb)
 {
     unsigned long iommu_pages = 0, mem_pages = maxmem_kb / 4;
@@ -1194,10 +1212,16 @@ int libxl__domain_config_setdefault(libx
     }
 
     if (d_config->b_info.shadow_memkb == LIBXL_MEMKB_DEFAULT
-        && ok_to_default_memkb_in_create(gc))
+        && ok_to_default_memkb_in_create(gc)) {
+        bool hap = d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
+                   libxl_defbool_val(d_config->c_info.hap);
+
         d_config->b_info.shadow_memkb =
-            libxl_get_required_shadow_memory(d_config->b_info.max_memkb,
-                                             d_config->b_info.max_vcpus);
+            libxl__get_required_paging_memory(d_config->b_info.max_memkb,
+                                              d_config->b_info.max_vcpus,
+                                              d_config->c_info.type,
+                                              hap);
+    }
 
     /* No IOMMU reservation is needed if passthrough mode is not 'sync_pt' */
     if (d_config->b_info.iommu_memkb == LIBXL_MEMKB_DEFAULT
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -1569,6 +1569,11 @@ _hidden int libxl__domain_need_memory_ca
                                       libxl_domain_build_info *b_info,
                                       uint64_t *need_memkb);
 
+_hidden unsigned long libxl__get_required_paging_memory(unsigned long maxmem_kb,
+                                                        unsigned int smp_cpus,
+                                                        libxl_domain_type type,
+                                                        bool hap);
+
 _hidden const char *libxl__device_nic_devname(libxl__gc *gc,
                                               uint32_t domid,
                                               uint32_t devid,
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -38,13 +38,8 @@ char *libxl_basename(const char *name)
 
 unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb, unsigned int smp_cpus)
 {
-    /* 256 pages (1MB) per vcpu,
-       plus 1 page per MiB of RAM for the P2M map,
-       plus 1 page per MiB of RAM to shadow the resident processes.
-       This is higher than the minimum that Xen would allocate if no value
-       were given (but the Xen minimum is for safety, not performance).
-     */
-    return 4 * (256 * smp_cpus + 2 * (maxmem_kb / 1024));
+    return libxl__get_required_paging_memory(maxmem_kb, smp_cpus,
+                                             LIBXL_DOMAIN_TYPE_INVALID, false);
 }
 
 char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -317,9 +317,12 @@ unsigned long __init dom0_paging_pages(c
     /* Copied from: libxl_get_required_shadow_memory() */
     unsigned long memkb = nr_pages * (PAGE_SIZE / 1024);
 
-    memkb = 4 * (256 * d->max_vcpus + 2 * (memkb / 1024));
+    memkb = 4 * (256 * d->max_vcpus +
+                 (paging_mode_enabled(d) +
+                  (opt_dom0_shadow || opt_pv_l1tf_hwdom)) *
+                 (memkb / 1024));
 
-    return ((memkb + 1023) / 1024) << (20 - PAGE_SHIFT);
+    return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
 }
 
 


