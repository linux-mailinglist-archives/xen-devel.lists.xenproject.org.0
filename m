Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B14C180D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277518.474050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu6z-0006Na-TT; Wed, 23 Feb 2022 16:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277518.474050; Wed, 23 Feb 2022 16:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu6z-0006Kn-Pz; Wed, 23 Feb 2022 16:03:29 +0000
Received: by outflank-mailman (input) for mailman id 277518;
 Wed, 23 Feb 2022 16:03:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu6y-00064O-AZ
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:03:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22e118cd-94c2-11ec-8eb8-a37418f5ba1a;
 Wed, 23 Feb 2022 17:03:27 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-MZVb_loDP-adKvBNPFmRnA-1; Wed, 23 Feb 2022 17:03:26 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6335.eurprd04.prod.outlook.com (2603:10a6:803:f9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Wed, 23 Feb
 2022 16:03:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:03:23 +0000
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
X-Inumbo-ID: 22e118cd-94c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldFCmhVgf2hohYtDOIo5qnNRmC9eRJje8GLGX9RkTuY=;
	b=Y8yGCLBwNj02hEid5RUUJ2DraOdirHDFEt3emNUBautuNIDO3RsA4QiQUPKKgBQGyrD8Tv
	g8bZPosCPJVO0ADjdbjVxR1MqkBsDsqJHNyw3hMVInfxHpqYAEXYxHAcKN+Lxm73ZY9Zec
	Tb86FWYjIcVPFwvLLL+wwssypxV7iu8=
X-MC-Unique: MZVb_loDP-adKvBNPFmRnA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPkIcQVyhHbPH9XYk++KieGKiHzaI2VGt7PWwB0Xo2sOQp0Vg2MW0O48bJAHGRDq0W8UnTOOkFSk+4xOek0aFYHymD47Qq0WpGD1MCjoHXfmzvP+v/g51Mv+X/DWh3O2gPCrgR7uhc9l88onX8Qon7D4/BSDdHAXce78qCyTjuCgbLqiSYbGwcFF5e8TkEtA96qXqIin1dtq40+jjp/Xv8q91xMJa/4cw4XGkjYuMGEJyL04c7spmZBSbnDEgvGDk8fxADP3n6FjdNYu16hc3JSkQb6k39L0Ojc2YK1Ccv/vxrwb9o7BexjdNVuqNaioiuT5Lwscokkz4RUWRm7+oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldFCmhVgf2hohYtDOIo5qnNRmC9eRJje8GLGX9RkTuY=;
 b=CDotKA3uMoCbkamW6h1Yzkv8IV94uw3fORH99R18nQA1tSr8a1c7aljXSZGrgp0HGsJVcVdp6QCczQuVVQvjy4LkS/MeakY2sbQJtT2XF/9A9TPV/hytrtKEhHCFbmBox/e6EKiVDIcGuHIjKj3xCcRvdH5jPPqhSlLvn25YRQuuDzXq1jp4Gcj0B5j5D/tOyqmFg7Vc9x/7tASqPteHDu8tpOoKzPdJIZKRGXER//UYn1/InhERQtLDfiHuyfShr7CNcEWXuptNK6HI17xkZvONgllu4azhhcCVRsTsFsbdosZE/nKwqefkcGtTB8dx4hMdhC2bhhawXEZ4wu5tew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12673497-72ca-3b24-f35f-0d93c645e11b@suse.com>
Date: Wed, 23 Feb 2022 17:03:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 09/14] x86/P2M: derive HVM-only variant from
 __get_gfn_type_access()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0107.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27f82c7a-3633-4bfd-e1e7-08d9f6e60513
X-MS-TrafficTypeDiagnostic: VI1PR04MB6335:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63353367D6A330C7B5A0A7D1B33C9@VI1PR04MB6335.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1xXFtTr9vmZ42FxJeDi5QwVUnyn3nWp2oGd7DqdzoRAOJoZ/cj9c1gvEPHZFsQqE5K0It6OB42FjY7n/ABaxtvNnF1OudbR5aMhODuvt2rlOMNw3J1AM9bQprViy2ItxEh1GzSnMy+HmjmDcqFteJ3NvQsAbCRSiysiekxSBMqac2fU0q8Rmj1FiLXDYEaF7WEfY118S7YyhPwh4XE9esW4bbYfM3H4xxyn8cbW16Oe8mpg/w6cqmiYvPguQS+rYpjkNyby0LYF78mYbfB95gJMMYC8WsRmMdYFk0y+LFnvhK0GkHHhUu8L5vWku6DhtnejFYzaf0WZWO/gef6X+O/CMwf40oa8bZqR11xYMTkrxlGpLUi/ZSreu7mF58S/U7k7tW07k6Fq7EyYonVkBFMU/8jtKEPZuhTT1fKUQMwOHzOyl6oF43mosteTBLY/YiMQpZIoAj/A8IzZRLn2iqsjMoh4nIR2i+ghjNd+8DOJ7jI9j5XAgiSVloTYiteX3dxS42FXujGU5V0rBPGblozjGCyLiyThpypuY1kvDrXa+F03J92L6JcYbiQ2Cr4bSLYF6qmqZ1pGB+HCkfSgm3qAPo9MMns+FRnPxTZ9W6aNBOcxGBYmhiJD2nigmE4FYNdnVNuDtVPBCU1kWRlKsmEnWw1ctfyGkk5zBEF9peDdvxRBrF98atSdaAVVWWUAUPp8QJt4Mnz+0uobY7rEu0RGWUy9Yg750tFa/SIXHh8EHpyfDGgskp6rwHhsMMKOw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31686004)(66476007)(54906003)(6916009)(66556008)(66946007)(83380400001)(4326008)(36756003)(8676002)(508600001)(6486002)(6506007)(86362001)(186003)(31696002)(26005)(5660300002)(2906002)(8936002)(316002)(2616005)(6512007)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG1VTGpWRG9FSC9aWWtUb3dMKzl2ZjJDYUZKZkJLelVFQXFQaUl4UjZ1blg5?=
 =?utf-8?B?RVNteUtiTXhScU0ySE4zRktKeXNPZVMrdXovQ3lrUSsraG5UWFFpVmoxOTN0?=
 =?utf-8?B?S2hMVER0WksvcFkwQndGWFczMFV4NGVoNkJMRWRNNDkyWDlTUXpHeVlSeDNt?=
 =?utf-8?B?SzFzdEN6NHBQNzJ6cGJKUURqVlBkVDFYSjZkWHVzenNDS3NYMFEySXF0NmRU?=
 =?utf-8?B?VjhTd1ZEd1JROTg1Sm1BV2NKaXN3TkgwQmh1bHNWcnVYclhTdUhOdUl5aFEw?=
 =?utf-8?B?Y0ZqcjgxUHQ1WFhNc3dGaGh0NDhicUdFM3MrUC9Cb1ZDeHN0TnY2UjFlMkF4?=
 =?utf-8?B?WG1kUElqdjlQbzVsNncwOGVvT0w1UVM1WTljZm1aZHFrNHVMVTNHUURURHB5?=
 =?utf-8?B?RmE3aUQ3eUg4a1A2NDdlbUwxeXdBK3pkdDZFQnUwVTJPNVVhbnVKVjA3UzlD?=
 =?utf-8?B?NGJqdit5TlMrRVpKSWYrcWMxQTU1dk5zZlI1c1JKbDlYUzhWdnF0bk50cm9k?=
 =?utf-8?B?QVF4WGRXSEZlVytMMWxUTjkyN296Vy9GVHlYOWhiZXpFNzN2N3RnVnE2T21Z?=
 =?utf-8?B?dW15Mmkyd3JrR2dKVU5EcmtFRDRWaC9vU1VyMkNMcDRLaDNKQkRSWEJBaUta?=
 =?utf-8?B?QzYyWEk0TVVXTmtZOGUwTmxEWjhUNXVuMEZqSnA2V1RVUmVlQjhNZmw4anhz?=
 =?utf-8?B?VlVheXd6ZERMdEwvbkJRbXFUWE8xL0xvalVkUDQ4ek44Nm1NUHdjL1BTcEFH?=
 =?utf-8?B?R3RqU1o2RVdwKzNwOWp2TDFBbmpaN3JPSmJHV2JwMGFqQ3cvQVcwK01pWFNv?=
 =?utf-8?B?eVRJZUozUk9rZWxJdDdpZXRCcUIvbE9UeVlxUmlWL0lhZEcyQjRGazczc1BU?=
 =?utf-8?B?THN0dW9LeUtnTi8xR3dSaXVXKzYyNDZtQU43NnltNHN6Ly9WcVY5ZVNuemF3?=
 =?utf-8?B?UUIxQmVjRjdQamcza01BUDU4N2VaTStvREYvOVZKRnMxSXVQWDR4MjNhZW5y?=
 =?utf-8?B?Z1orK2RSaHhYWHZYME1nZGx0TXRIdnBNWXZkMXNRS3NONzVOQ1ZXd2F3TTAx?=
 =?utf-8?B?dTRkY09QZHoydms4VFRua3JqeTRES04ybEcvQUgzZlZsWFRlV2FlZkdhSmFD?=
 =?utf-8?B?QnpveHM3Y0JGSU5kMEpPK1BFdyt1blVVWU81dXNTN21sb0NCbkovWnB5NFhh?=
 =?utf-8?B?M3NVbDVHNmwrYllJcDdFdjFmWFh6d0JMQitxb0JFSXNlVTRBbDhxWkdxRmRN?=
 =?utf-8?B?UldBQmFoQVgzQUJnQ2x0RXgwZmdlK1pVMTJlK1JZWDhnWnlzY2JRVTJHcjlX?=
 =?utf-8?B?QU1heitpSDljdlRNK210SU9zOTVuaTNmcDZoekhydXVCaG84MTlYUmRaYjNO?=
 =?utf-8?B?VHBOeWJvV09haHZTWkZ3Ym1sb2daUTV4V2Z3aXk1Y2E5UFNUNng1Y3BOZENm?=
 =?utf-8?B?UGRONDQ4K09UTVE4V2l6aGxNTHJVVGttMTF3ZDN1VGJiWDFCMTN1YnpYcWRN?=
 =?utf-8?B?T0FSSkNNOTFkMVgwNjlCVHZsMzMzRHJlNHZtODl1TnVLM0xYVkxiT3N6cFlx?=
 =?utf-8?B?bmZIRFZ3bGxZTkRJSHVSU0treStlNTRFWGNScUtyNlViSVhyTWxqVUF1OUxr?=
 =?utf-8?B?Q0h0OWFOTFlzQVFCajlTa29mTy94RitMSjdnaFNyRTczMnZUM0ExNm1MakVT?=
 =?utf-8?B?RGZoNFNlRWdPblNkbHF3VnBrUVdLT3YrbGNjSkZuaVJ3SzhnNUU0dDNDNHU4?=
 =?utf-8?B?eUhobGViVi8vbmRTaGdhRndPZktOYWVDS2V3Q3lSOHhJZ2pQSko4NUpTZUU0?=
 =?utf-8?B?Mmllc1BsblFjOEowaWZYRGdERGtKQ2FaWXlWdlRKWjd4YWk5dXNLdTNXczJV?=
 =?utf-8?B?WHIxZzR5UGJoY0VVSWFFRS9qR1NKbjVPeWpqOEQ1Mzl1YnBPT0prNnBmZGpE?=
 =?utf-8?B?bG4vLytacnNoSmVpcXIvTVpvaFI4Q1JTL05XS3h6VFlQekJjcTFEdUJra0Q3?=
 =?utf-8?B?TnB6Z3BJRkM1dVdjb05BeStVMzI0ZlVFWEVzWEJDeW94NW5hSEZJQ2d0RzJZ?=
 =?utf-8?B?ckJsWDFCNHVYZ09MNGdsZ0gwOGhKWVE2ZjVDTUVzUnFXakl3SFhvQkFhMDA0?=
 =?utf-8?B?M2RUd2N1Mm9ueFZQM1ZDb3ppd3B1QjlZU3hyY2tzdTZnMkV2N2xNeGdKS29z?=
 =?utf-8?Q?IScFz/HNM80EJn0KwyNhO5o=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f82c7a-3633-4bfd-e1e7-08d9f6e60513
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:03:23.8985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bv0YSkwOPcVrPb5WpNy1OlcqjHLeK6v8WJwM/IfCXUCm7tL9tL4Tf/F9FD5SjEfkxHDuJ2DIvnX1bhCCaebNLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6335

Introduce an inline wrapper dealing with the non-translated-domain case,
while stripping that logic from the main function, which gets renamed to
p2m_get_gfn_type_access(). HVM-only callers can then directly use the
main function.

Along with renaming the main function also make its and the new inline
helper's GFN parameters type-safe.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>

--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1716,7 +1716,7 @@ static void svm_do_nested_pgfault(struct
         } _d;
 
         p2m = p2m_get_p2m(v);
-        mfn = __get_gfn_type_access(p2m, gfn, &p2mt, &p2ma, 0, NULL, 0);
+        mfn = p2m_get_gfn_type_access(p2m, _gfn(gfn), &p2mt, &p2ma, 0, NULL, 0);
 
         _d.gpa = gpa;
         _d.qualification = 0;
@@ -1741,7 +1741,7 @@ static void svm_do_nested_pgfault(struct
     if ( p2m == NULL )
     {
         p2m = p2m_get_p2m(v);
-        mfn = __get_gfn_type_access(p2m, gfn, &p2mt, &p2ma, 0, NULL, 0);
+        mfn = p2m_get_gfn_type_access(p2m, _gfn(gfn), &p2mt, &p2ma, 0, NULL, 0);
     }
     gdprintk(XENLOG_ERR,
          "SVM violation gpa %#"PRIpaddr", mfn %#lx, type %i\n",
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -459,10 +459,27 @@ void p2m_unlock_and_tlb_flush(struct p2m
  * After calling any of the variants below, caller needs to use
  * put_gfn. ****/
 
-mfn_t __nonnull(3, 4) __get_gfn_type_access(
-    struct p2m_domain *p2m, unsigned long gfn, p2m_type_t *t,
+mfn_t __nonnull(3, 4) p2m_get_gfn_type_access(
+    struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
     p2m_access_t *a, p2m_query_t q, unsigned int *page_order, bool_t locked);
 
+static inline mfn_t __nonnull(3, 4) _get_gfn_type_access(
+    struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
+    p2m_access_t *a, p2m_query_t q, unsigned int *page_order, bool_t locked)
+{
+    if ( !p2m || !paging_mode_translate(p2m->domain) )
+    {
+        /*
+         * Not necessarily true, but for non-translated guests we claim
+         * it's the most generic kind of memory.
+         */
+        *t = p2m_ram_rw;
+        return _mfn(gfn_x(gfn));
+    }
+
+    return p2m_get_gfn_type_access(p2m, gfn, t, a, q, page_order, locked);
+}
+
 /* Read a particular P2M table, mapping pages as we go.  Most callers
  * should _not_ call this directly; use the other get_gfn* functions
  * below unless you know you want to walk a p2m that isn't a domain's
@@ -474,7 +491,7 @@ static inline mfn_t __nonnull(3, 4) get_
     struct p2m_domain *p2m, unsigned long gfn, p2m_type_t *t,
     p2m_access_t *a, p2m_query_t q, unsigned int *page_order)
 {
-    return __get_gfn_type_access(p2m, gfn, t, a, q, page_order, true);
+    return _get_gfn_type_access(p2m, _gfn(gfn), t, a, q, page_order, true);
 }
 
 /* General conversion function from gfn to mfn */
@@ -515,7 +532,8 @@ static inline mfn_t get_gfn_query_unlock
                                            p2m_type_t *t)
 {
     p2m_access_t a;
-    return __get_gfn_type_access(p2m_get_hostp2m(d), gfn, t, &a, 0, NULL, 0);
+    return _get_gfn_type_access(p2m_get_hostp2m(d), _gfn(gfn), t, &a, 0,
+                                NULL, 0);
 }
 
 /* Atomically look up a GFN and take a reference count on the backing page.
--- a/xen/arch/x86/mm/mem_access.c
+++ b/xen/arch/x86/mm/mem_access.c
@@ -299,8 +299,9 @@ static int set_mem_access(struct domain
     {
         p2m_access_t _a;
         p2m_type_t t;
-        mfn_t mfn = __get_gfn_type_access(p2m, gfn_x(gfn), &t, &_a,
-                                          P2M_ALLOC, NULL, false);
+        mfn_t mfn = p2m_get_gfn_type_access(p2m, gfn, &t, &_a,
+                                            P2M_ALLOC, NULL, false);
+
         rc = p2m->set_entry(p2m, gfn, mfn, PAGE_ORDER_4K, t, a, -1);
     }
 
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -478,12 +478,12 @@ do {
 #undef assign_pointers
 
     /* Now do the gets. */
-    *first_mfn  = __get_gfn_type_access(p2m_get_hostp2m(rval->first_domain),
-                                        gfn_x(rval->first_gfn), first_t,
-                                        first_a, q, NULL, lock);
-    *second_mfn = __get_gfn_type_access(p2m_get_hostp2m(rval->second_domain),
-                                        gfn_x(rval->second_gfn), second_t,
-                                        second_a, q, NULL, lock);
+    *first_mfn  = p2m_get_gfn_type_access(p2m_get_hostp2m(rval->first_domain),
+                                          rval->first_gfn, first_t,
+                                          first_a, q, NULL, lock);
+    *second_mfn = p2m_get_gfn_type_access(p2m_get_hostp2m(rval->second_domain),
+                                          rval->second_gfn, second_t,
+                                          second_a, q, NULL, lock);
 }
 
 static void put_two_gfns(const struct two_gfns *arg)
@@ -936,8 +936,8 @@ static int nominate_page(struct domain *
             if ( !ap2m )
                 continue;
 
-            amfn = __get_gfn_type_access(ap2m, gfn_x(gfn), &ap2mt, &ap2ma,
-                                         0, NULL, false);
+            amfn = p2m_get_gfn_type_access(ap2m, gfn, &ap2mt, &ap2ma,
+                                           0, NULL, false);
             if ( mfn_valid(amfn) && (!mfn_eq(amfn, mfn) || ap2ma != p2ma) )
             {
                 altp2m_list_unlock(d);
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -286,25 +286,13 @@ void p2m_unlock_and_tlb_flush(struct p2m
         mm_write_unlock(&p2m->lock);
 }
 
-mfn_t __get_gfn_type_access(struct p2m_domain *p2m, unsigned long gfn_l,
-                    p2m_type_t *t, p2m_access_t *a, p2m_query_t q,
-                    unsigned int *page_order, bool_t locked)
-{
 #ifdef CONFIG_HVM
-    mfn_t mfn;
-    gfn_t gfn = _gfn(gfn_l);
 
-    if ( !p2m || !paging_mode_translate(p2m->domain) )
-    {
-#endif
-        /*
-         * Not necessarily true, but for non-translated guests we claim
-         * it's the most generic kind of memory.
-         */
-        *t = p2m_ram_rw;
-        return _mfn(gfn_l);
-#ifdef CONFIG_HVM
-    }
+mfn_t p2m_get_gfn_type_access(struct p2m_domain *p2m, gfn_t gfn,
+                              p2m_type_t *t, p2m_access_t *a, p2m_query_t q,
+                              unsigned int *page_order, bool_t locked)
+{
+    mfn_t mfn;
 
     /* Unshare makes no sense without populate. */
     if ( q & P2M_UNSHARE )
@@ -329,8 +317,8 @@ mfn_t __get_gfn_type_access(struct p2m_d
          * Try to unshare. If we fail, communicate ENOMEM without
          * sleeping.
          */
-        if ( mem_sharing_unshare_page(p2m->domain, gfn_l) < 0 )
-            mem_sharing_notify_enomem(p2m->domain, gfn_l, false);
+        if ( mem_sharing_unshare_page(p2m->domain, gfn_x(gfn)) < 0 )
+            mem_sharing_notify_enomem(p2m->domain, gfn_x(gfn), false);
         mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
     }
 
@@ -343,9 +331,10 @@ mfn_t __get_gfn_type_access(struct p2m_d
     }
 
     return mfn;
-#endif
 }
 
+#endif /* CONFIG_HVM */
+
 void __put_gfn(struct p2m_domain *p2m, unsigned long gfn)
 {
     if ( !p2m || !paging_mode_translate(p2m->domain) )
@@ -377,7 +366,7 @@ struct page_info *p2m_get_page_from_gfn(
     {
         /* Fast path: look up and get out */
         p2m_read_lock(p2m);
-        mfn = __get_gfn_type_access(p2m, gfn_x(gfn), t, a, 0, NULL, 0);
+        mfn = p2m_get_gfn_type_access(p2m, gfn, t, a, 0, NULL, 0);
         if ( p2m_is_any_ram(*t) && mfn_valid(mfn)
              && !((q & P2M_UNSHARE) && p2m_is_shared(*t)) )
         {
@@ -1775,8 +1764,8 @@ int altp2m_get_effective_entry(struct p2
         unsigned int page_order;
         int rc;
 
-        *mfn = __get_gfn_type_access(hp2m, gfn_x(gfn), t, a,
-                                     P2M_ALLOC | P2M_UNSHARE, &page_order, 0);
+        *mfn = p2m_get_gfn_type_access(hp2m, gfn, t, a, P2M_ALLOC | P2M_UNSHARE,
+                                       &page_order, 0);
 
         rc = -ESRCH;
         if ( !mfn_valid(*mfn) || *t != p2m_ram_rw )


