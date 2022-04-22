Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAF050B484
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 11:59:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310790.527712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhq4A-0002fn-Gd; Fri, 22 Apr 2022 09:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310790.527712; Fri, 22 Apr 2022 09:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhq4A-0002d9-Cg; Fri, 22 Apr 2022 09:59:06 +0000
Received: by outflank-mailman (input) for mailman id 310790;
 Fri, 22 Apr 2022 09:59:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhq49-0002d3-1n
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 09:59:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d71023c4-c222-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 11:59:03 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-N0Rj8CfzO1WhK7WeZIcLRA-1; Fri, 22 Apr 2022 11:59:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by GV1PR04MB9103.eurprd04.prod.outlook.com (2603:10a6:150:22::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 09:58:59 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 09:58:59 +0000
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
X-Inumbo-ID: d71023c4-c222-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650621543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gfLEJWB8dYg/5ByFirWLKx4TpYb2Ys2tqREAkfOhScg=;
	b=XEGTzxG0yZaCSYfViYmTaeRzhE12JfQ/6URGl7oe8zwDTM55hTFEz/dDZ7GUdo0tmHPUSP
	qs84j8Inv7B2IRdQ4OmabYNyOKJnemELZ41B3zhH8hVhI/i2aLFIL7KJuPPxfEWpnzOcNe
	RHgm7WchiIMZ7kCWGNj8NGL8usTECeQ=
X-MC-Unique: N0Rj8CfzO1WhK7WeZIcLRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVUu5E7UQ+vfn6de5xu7ZJ2A/f5xDXBY31el1rzdzJ2oq1iuSkt1JX/9bqEkdlhVWMJz9QX8s02d9WWNLeYzrK0Nv70PZHGt9MO+uLHmugPJsHbobyT8/Q0KhUGNrr2y92cA/CMLKjtvUaWaOmXg/555I+tsw3uSK0XeqSK6HYH6RNuZHVddAGJ8Mh/ekKmlBvlFfo5yyPrKg6GKGTgsvbTLm962U3vPcBReSj4TfNF8R8+2wOeyqIGKcxfvWJv4VPrLq+bY4DGEzlvXNFmbpe6lRC/6bnYSfJP0J6V1+76xoFe15bilrU/u+7sHA3F+b5PS9q9JMRwqtNwffHpSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfLEJWB8dYg/5ByFirWLKx4TpYb2Ys2tqREAkfOhScg=;
 b=ev3zs7mr4fLd6PG4QVP2/dTS3yW182p09URhVzEbiF2cJRrhwXKrqfXe7zkebxQ8JT8C3dsi8xb5t5IoIaEnoQoExEn/edIcHnl228E15GlP6FfkWjV+3nROqbHp9eokP1GufoC8GgFPJg6QudpbefE7iyguozYeUBqloVDfI8kt4y7Y9cwEy7U22L0z8PfWL2jE8/9yOPoSJTAXvBkdx3zRd+CQXgVoRAUnlPj/FnNXNBCQMYkuIu01sqXYbttxrsNCLjR7GWBW3rhPVnbxUb53lwXpU6ocVfJBw+voecwWA9BqCOWFt0mDSQxxiQSOo73mLH+w6hhMTMDTFIKy8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <431d4212-07b8-63d5-1a4d-7e8c7a9108ea@suse.com>
Date: Fri, 22 Apr 2022 11:58:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] VT-d: fix !HVM build
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0353.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::30) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4bce51a-70b4-42a1-6c0a-08da2446b8c9
X-MS-TrafficTypeDiagnostic: GV1PR04MB9103:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR04MB910316E4BB022F3B5EFC938AB3F79@GV1PR04MB9103.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MGr8SJ3NfntPCNW2x0bbttrBvzBh2PRBSbEhDmxMtPE9dR68sN0Pz9yzLlchc6GO6tfiIUdwzpRtNelnHN2rfbAADRpUgtPH1HzqvMPuPk5iUi1RILeSW5UmRRtLsxC/6Az/8gj7Z79E0ezfzxEPdGsC4FghX75QJC5nKqLqNiADOtcaeWHnMTiFC/gqc6rFEoMQwQbj76Wom48F3E2O5Hxy5KCTDDN4cckMAa9al1N5IRuwBo5JoxYeOV1mAlMMLN/RbZOES2Ywxsar7gDGgcVj5OHf3zg2l3r6qXwSPYKMQoGQSi4OEFqliUvWlldeAvJoX52+1J/ThX5V/w+fVHRXsdYcuJ3oNXeMiDBb6hDk1fac5tAX/rr8hZ9H5vk7lkhwOEjSpsTEtS0tFi7kz1+EA3LUeG0wQf1shUXY0NyNUf/b8IhGfArAP8xGcZMtMEqFJUbjX1r7oKoA7VaJWKkyRggSntbfj3jOv8rnKT5F3ikeWBBFZ3HrVuIbRVfe1YpsvByzNqjD/Xc2rHw7chSP0EVqHhlwmTmvwMIXmVnPQ/8j6O9+b54R2uk+I185dL3vEQh/rxnd/sDLBl6T0BPAwchNctIkVrCRWue0r5WFO9etuvvP6a0iX/YfegkbxMaoZt1mIs/Ht08oiNHLRgfCSqB5rVF+IghvsxH9yUZ30CuIHii5WRxSxxlB243eu5imjF7o4jK7MCsjwUIE8594+u3g0HPESX92R7ZdhHk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(5660300002)(38100700002)(316002)(8936002)(66556008)(66946007)(8676002)(6916009)(4326008)(54906003)(6512007)(66476007)(6506007)(6486002)(186003)(508600001)(2616005)(26005)(83380400001)(31686004)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG5mOExuY093azUvbjFVL0JYRE1XY0VXVGRuSGlJb2UxTldFMFlBU1R1WExz?=
 =?utf-8?B?OGpBWUNTWTd3VjVtRlB1Q3Z4TjB5aTlNcXFWenlSRlpUVkc1NTB3SDlFNFdQ?=
 =?utf-8?B?MFREamxyZ2pVUHhMY09BV244aHNQYzRRN1dIdTNJY2dvS28vQkdkUmZ5MW4v?=
 =?utf-8?B?YVg2NC8rd3NEMloweFZLV3FBajRIbXFQVlpXL1FCS3pMcFk0MkM4eHpDSE1r?=
 =?utf-8?B?OVQ3YWR5WXVlMlViMXo0b0hmNXF3WFVCZEMzcnI3dmJRV1dYTWg2c21uNk1E?=
 =?utf-8?B?bWpveFVLOU5GQjBxeHJoOXVzVFh5YkF0T2RrWHo1WmlEVzFnVS9XaEF5Nlhk?=
 =?utf-8?B?U0V1bFVIUzZLLzhVY2pidTdFNjY3UDBwbXlMdk0wMXRwWHBjbmluZGFGSUlu?=
 =?utf-8?B?SGdNdmJ2ZE9FbG5RdXFhUG5FWjI1eXRqRVpDbUhqYmZIeCsyM25MUlJXN0hY?=
 =?utf-8?B?QnVXOGFSbTFFUE5MSWgyY2tDWE92ZlVOQTRockIyUlZQc3JoTGxzSnBNMVdE?=
 =?utf-8?B?cnUyYm14SlNodDRWcjBxSlNPL0RyUWVUb09tTUw1WGRPTmF1MCsva2FCc3lp?=
 =?utf-8?B?QjlheWR0SHRvK0lKMkd0MFR0b20ydWkyekJic3Z4TTZHMThaZ0xiM1pxdzdP?=
 =?utf-8?B?WFlLTklqUG1HTk5NYjBFNkRIV2s0MHdzYVMxWEZhMzMrU2dCYmtoMWRiTEk4?=
 =?utf-8?B?MFkrcEVNbGZoZ2h0Tm1FbTgwZ2dOblRLcnBxQ3hicXQzYTZsNjN2V2hBdUhQ?=
 =?utf-8?B?TURPL2Z4OVQvUjhIaVc2V0k0cjNqaVR3cUhGd1c0eDdvT3dPVE5pcU5xeDBW?=
 =?utf-8?B?NUVod3RjSEtjWW5DK2NQZFlUWU5SMEl2cTJSQ05oWCtXSWhKUWhZemh2dENk?=
 =?utf-8?B?dHpLd3pybkhJTEl5VGVNblJXTU40eDQyTkh0V1lsMHBOODliTXdhaHl1c25Y?=
 =?utf-8?B?akJSaEZHR1FzMUNYR0x0NGR4Sy9FZ3VPVEE1WjZ5S3dHcEdaL1p2WWpGZGVY?=
 =?utf-8?B?UllnaHBYTTVjVFQwbkw5T3dTbUVqcXI0cnBOT0Y3NllBRDBTaWlFVTZGR2Jn?=
 =?utf-8?B?d1dGa3g0M1psOUo0aWhOWmFOVkpkSXd4QU5HRkk0ZjU4dzBBbkpncDd2OTJ3?=
 =?utf-8?B?M096eGsxcjFkRStoUi9vRnNlYTJZR21wNzkwdUlQMFNyNGFWWWZQejIzRUY1?=
 =?utf-8?B?Mzc4SjIrVlVCbXdQTXJJVzErdzd1ZzhEaGNZYlBVWlAvWDNvWGZmaC9BLy9C?=
 =?utf-8?B?dTZ4WWVpRklvTHhaQ3hGZDhqM1NzTmpXUUZrWmVuRHZhb0UxV0hQODYzQU9N?=
 =?utf-8?B?ck0ydDJXVi8xS3dXSzlQYUdHTEFCVzZRM053TllpdnlDVk5CRXB3R2N2MVRM?=
 =?utf-8?B?SmVWVElYVExBUG1qelhEQ2dORXVmOXFIdVZUS0F3UmpUeStFU21tVlhrZ1h6?=
 =?utf-8?B?c3pDbEY3OGo0T3AvSDZMU0RHWnZibGNtR0pCWnd0ZnNMSjIwYTNwR1QwUG9a?=
 =?utf-8?B?b0F1K3BucVQxYURXNEI4TTBIRWZWUmdyMzNmNUF3dUZVOFNPWkxHaGlPbTBu?=
 =?utf-8?B?VHBZZ25qaFZXOTBSUURNaytZWHRzRGsvUjJZajVLdmNIeU0yUWd6bnY1b3Bt?=
 =?utf-8?B?Ny90N3IzMGcxK2gvUEFrRGszMzMzdndlNVdkcHlpcm5qbWIxQUVNditLcEFV?=
 =?utf-8?B?ZWduV3lJUnlOT0dNdUM5YWtadUxuYWZtYWpMY2xmQjRTL1pzU2dBWWNLaUFl?=
 =?utf-8?B?aStXMkpwQnFKM3gwYk5kSko5endrejEwT1lrQUJzcndXRnNnaWw2dW5maFhy?=
 =?utf-8?B?R2o0N3dBOTh4UjJSQ1RCQTNBL3gyUU4wLzFnMjBoWUJUQTVnQTcwUVdtaVR1?=
 =?utf-8?B?R0Q3RzZ3U082MmhMK1drT29UZ3l0TDhEUUlXQTBhWDBKQXZKc2lDSzQ1WGVT?=
 =?utf-8?B?YlUwQkllRHZuNjluY1FrVWNnYk1SdWcyMWVTeWhxOERuQW1DVEZTQ0xkZnFZ?=
 =?utf-8?B?WXdMUTRsSjh5U3lZektUL0NMalNOaEY0aTVSY3ZmN21mSXQrUFdRVjltenR1?=
 =?utf-8?B?TzhUVndzamNINUJzQUNZNCtZNWkrd2p1aEw2V2JqTzFhdWw2ZFZOWGgrekdE?=
 =?utf-8?B?SFZrYTF0aDJScERYenY0WFc1dkE0WkxMWEZYaE1KNkJpSktJTTFZVG9KNDBi?=
 =?utf-8?B?MjVYWmZvTXE0MzFHUHhIVkJOd05MVnZvWUVZbmNDRE5DbmxWNzFxTFVyTE1n?=
 =?utf-8?B?UWsxYXVydHVSeWVJN0ZwVzVTaDcwWExjVXF2by9mODZTVUJlT3FyWUhWc0dy?=
 =?utf-8?B?eGRZeXZoU2lYeFRoUDY3ZE41TnRxM0JVemJkSURVREErUjAwMzJDdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bce51a-70b4-42a1-6c0a-08da2446b8c9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 09:58:59.4427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dniJGgykPiU3XtJYj0H/GGIJK9AMVUKrSF/WweAGEI+5inWQIgqJw5S4C6CEsjNtJiPahlgZvjAX2A3jQf4jXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9103

EPT is of no interest when !HVM. While I'm observing gcc11 to fully
eliminate the function, older gcc's DCE looks to not be as good. Aid the
compiler in eliminating the accesses of opt_hap_{2mb,1gb}, which
otherwise cause undefined symbol errors when linking.

While there adjust types.

Fixes: c479415610f0 ("x86/P2M: p2m.c is HVM-only")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2155,14 +2155,17 @@ static int cf_check intel_iommu_lookup_p
     return 0;
 }
 
-static int __init vtd_ept_page_compatible(struct vtd_iommu *iommu)
+static bool __init vtd_ept_page_compatible(const struct vtd_iommu *iommu)
 {
-    u64 ept_cap, vtd_cap = iommu->cap;
+    uint64_t ept_cap, vtd_cap = iommu->cap;
+
+    if ( !IS_ENABLED(CONFIG_HVM) )
+        return false;
 
     /* EPT is not initialised yet, so we must check the capability in
      * the MSR explicitly rather than use cpu_has_vmx_ept_*() */
     if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
-        return 0;
+        return false;
 
     return (ept_has_2mb(ept_cap) && opt_hap_2mb) <= cap_sps_2mb(vtd_cap) &&
            (ept_has_1gb(ept_cap) && opt_hap_1gb) <= cap_sps_1gb(vtd_cap);


