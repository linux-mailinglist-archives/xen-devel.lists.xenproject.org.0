Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BBA4951C0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 16:47:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259116.446992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZe5-00086g-TL; Thu, 20 Jan 2022 15:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259116.446992; Thu, 20 Jan 2022 15:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAZe5-00083m-Pe; Thu, 20 Jan 2022 15:46:41 +0000
Received: by outflank-mailman (input) for mailman id 259116;
 Thu, 20 Jan 2022 15:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nAZe4-00083d-9f
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 15:46:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 275609de-7a08-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 16:46:38 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-J02mcFKhO6OCwIX1JpDcBQ-1; Thu, 20 Jan 2022 16:46:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5647.eurprd04.prod.outlook.com (2603:10a6:803:e3::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 20 Jan
 2022 15:46:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 15:46:34 +0000
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
X-Inumbo-ID: 275609de-7a08-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642693597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2s6acX7Mp4l29hkhStK2aeAbjGMhK198VaeYXNTH34=;
	b=S+TS5Nd7Y1fZ2Xut3EbdvJtuluuZvEkBDDxLJAxMNbd9S6BkXm85Nl53BjseYFsJghRHmJ
	bNqQOMfxGblMHvIUnC8+B1fWZhx9DVN3tIGP6uMKykdUz5geodtyKx/GHu+FwFI5dSvRdd
	i0q8fS3zj8jgcKv5zELtQ+IsWcLvoo4=
X-MC-Unique: J02mcFKhO6OCwIX1JpDcBQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNaJ2z/NHuoefp64bc1HiFqxmjlfIjbwZVST0UWh8DOUZKPwnCUSnK6TJGJLpyv0GYDLiMznj3cCSeLqAlTuRqAC+Yd/lTtAiTTsYaqRWz3NZ4MpbdHzllbGn6paWs+D4P55IF/nudYJVdDtxxCbKXGBXbykTSMyTf4ncX0JKJcVaD+6TgGUf72CrroLdNd9z1t9BslFjaLbQV6IJSMRbwGYZ+MR0CcnOqVdtXcJfOEErosb6ehs5ZS+k6ZUUgLccp+doYTQ9lAMM8pBCEAoCSgrZvBJkKXbT0q/dgvAaMYhGX6cYpajOTmIqqURrA0SwafigVbcAqRFYX8P0u/Rbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2s6acX7Mp4l29hkhStK2aeAbjGMhK198VaeYXNTH34=;
 b=d30Xb0pgYTsxBw18jSJvcWq2D5h4CbnSHzjP6WYDsmqAKFNaDrm7q4rMR5Q3aHh2CVhm4tLSmUvfBpCsRJPaxTX/blwNRnO6pybHnlOw6vYMKml5aZNxeYzNPBgTn3sPYT+2YDly4thwVIEb+SSFOjKu7TRQDKuVnqM3O9lFF88JV/9LqTTVPrL3eR0QFteEyskn0oUZ60+P/EF8w28M2Yk4UBB2m659lFz4+tV5wZCKEQiK17w7rgzsgJVhmG5G0cIxbn5BvKrBiPJ3t4fwgD9XeM7dT4/gAEJScy/YvuxbgHUqjl4FcY5EyiCNp0eHa3oO3iDXTdbL5GjMQ7J0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <321ea3c9-37af-3236-d3df-e3dbbee046cc@suse.com>
Date: Thu, 20 Jan 2022 16:46:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/time: drop pmt_scale_r
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e62b17a-0166-4db0-06f3-08d9dc2c0986
X-MS-TrafficTypeDiagnostic: VI1PR04MB5647:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB56474D58136D0E1906397EE2B35A9@VI1PR04MB5647.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a6zEDHnPu6DcRP+gg4O0qm+zbRVXvXQMeTvx2d1ChfxMLaEJDKdNy1m7J6HFE6wW0Wle8AHW6IqIxfZJ7G1KQYejGysCjbKcRdn6kdI82WlO06KXHvP02W1P9zN4YTY/xb2Aj3Y69XQkAulCN5zxS4QABfPqxx8XrDyN9ETDEyA3+/qFl/yxWPK4DJ1nzRmOK4FMAjWNWXSrDWY6qB8JlW0wo1+GhV6Y8pIESg7GP26dPBHK1moIhpwVLCMoSOkSlr828DSXmuc8z9tSdhQqXzt0R694h5o3+ApFvKa/iO6TmqrxovbIL1zi3tsDOtTOlDquSzjfq79GZ3kCy08b9/reAZK5jUGZRHEgJyMcLeV/WHSVX+Opk7IzAhflqrggJigfSU62FD1Ga27tcWyAhaI4RBwwLFnntnClLQocgG+AZ0axdhcOM6eQe50wG8wCEu1+SDABkYYTtwIw/I/pdYngYgISYnlbBuT5CM3yX0zHDELXuBrQyeDjPjqFyO+ef2VzfiBmgi15//9XWLtsbiR9X8p3tjGCtdc6OgxTV3FRcYpT1fCAXOanApA1KeEvehulgbloJecxtAUeoq9SfoM6dxMfUyYUclnASvX+EHC37ecUhf47x7YKNSORMRZlw8k2rv2jHLDY71BLhKwEkf4gsgbbnsXV7dPFKXtvUcr4WAm/gaUW1/Bv0Y6KJorXF9cS7tS6K3TE6XN0t0gOdhAxEjN6oe4LoXjCbsxrgjAKzgXLVl04/YjRSh4eIeHkB/RtlT1oLNLNpoGUhXa6QDqer3I04mETIcr1ZPO/LqM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(4326008)(66556008)(66476007)(31686004)(66946007)(316002)(6486002)(26005)(508600001)(6512007)(6506007)(86362001)(186003)(54906003)(5660300002)(6916009)(2906002)(8936002)(2616005)(8676002)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk53Q2xtQ3Njam9oS2JFSFFyNXFnZyt0L21sZDA5MGNMVmNVVFlZVUtaaVJC?=
 =?utf-8?B?RlVsZHVtZUgyN0dxU1NOOVBGaGJ0cDFCVEUyS2x3UlBMd1VQVUM1TGU0SDRR?=
 =?utf-8?B?SExoblBKYmcvMEgyN1FEQVg4M0hoTEJRSU10eEtnRzJlSGxRRlhsVmJ0SC82?=
 =?utf-8?B?amUwN0tRc08xck1xNGJYWW03Z2hSOVhLdnphcm9OZkJCZXYvVys0aE9xWEd0?=
 =?utf-8?B?WGRpR29oTDZ2dEFZYWtpcldqZTh2V2lyVThCUEc4bTNUcEVOdjErYm5Vc3VH?=
 =?utf-8?B?Y2R2M1J2SW80QUJFaXRLcFFwNWFnS2J0SXBhR1RqRGlPS3l4MFBEOVdEelJm?=
 =?utf-8?B?b295a05RWnZhY1ZGVGVSNkRHc0xmSy9XdmpTUXVReEsrMldsWmFnUHhhalR4?=
 =?utf-8?B?OWJSbjBNOVQxbk9mQko3a0NudmJtY1RIK2xEYjZ2TUJqZFl6ZERjN1hXMGpB?=
 =?utf-8?B?cU5HV2lYc1Y5TFBaQVFoOUovb3VVeVp4TXdQalNONGttZkNldkRkTzNhMVJj?=
 =?utf-8?B?YzNKVGlGMmpKeERYTDk2Y0toUnMzKzZLMHRLMEpWNXFoYVlPaTlYZkxqYjBq?=
 =?utf-8?B?SmU1N0EweXFnVUNWWkJ2SWVmK085REpiYUhMNjNPcS96V1NyelhKL0FaVVB4?=
 =?utf-8?B?M28xNFVjVWt3a3hlWDdaNUNmTGRvZGFlVmR3WmUrM2p1cnVpN3YyZTdGazk3?=
 =?utf-8?B?S0x5UE5kc243UEdEYkJCdEltdGI4WjdEaUNBNUZka1V4ZndRc0g2NldFQkVY?=
 =?utf-8?B?bFpVSzlnZDlzd280OXAzQ1YrZ2R3R3pWbXYzZVRyYXhxUFc0RFNSZHpPRDh2?=
 =?utf-8?B?QVoyaktSeGx4bXg2YVI0dld2WkEwN3VPWlRpNXpRRWptamI3UHpFL1BSRUt3?=
 =?utf-8?B?WHlUdERIMklLbjBVaEJWWldROGg5NzZxbHlwYXB5TDZvZVgwMTViWlRXbmdU?=
 =?utf-8?B?UVdqaDh3UUFlTmV5VS9oYW9HdFRIN1Fvd3crU213UUVsc25uWHNVOS90enZN?=
 =?utf-8?B?dFZRWVp5eUdNUFFZUzQxb0pacGF3OGxjR3MwcS9SVFUvRHllMmUxNnNiU1pQ?=
 =?utf-8?B?Rkx5ODlDV3dKMHdtb1RGV1BaZWNwNUJ6SlBrTFVqTDNZS0xoVldBcWpsTXlq?=
 =?utf-8?B?bXoxU3RCVVllR093bXhZWTUwZmthd09uMDRBdUFQRXA2K0VoemdqbWZVMUVm?=
 =?utf-8?B?eGsrcTdvOHZwNjJUR1RpOHF5eTBrWTdydDFQL21FTUMxSkxNS200REdvMW1I?=
 =?utf-8?B?Z2gySUp6YUJRSlRRT3l0cVhYcnpabE1lcnBHWjdGbWJrTFdocWxaNC8xZTFk?=
 =?utf-8?B?TnNSbVpaQS9xT3NmOWhNNDhadlJaTnpsK1Fyc3ZPc21aaGF0cjBUL25wZk1I?=
 =?utf-8?B?a2Fyd21IVWVJaGd3NFcrM0tGWjhvTk1US2NIWDhlM2pKOVdheFl4ME5LMVQ5?=
 =?utf-8?B?Sm5aVWV4Y1UyUGhUQ0o4L21ITmtHKzltVGpCOERrVkt4cHo2SHNFVEVtTmJj?=
 =?utf-8?B?QzZSRHZqL05zbXAyMlRSTkN2aWh4UUZCRFhkM001OFVFSFpzNWxMYTB3VW1B?=
 =?utf-8?B?b2NEVjBrcFBYL0JNdFp3NWE2bzZZTUl2dllzK2VEMFNITlZTYk9sbGUvOGZU?=
 =?utf-8?B?M3FiVytwQVVEbXZlbDliN0Fsbjh1UFlxMC9DbTdhRGx2UzFiUFRrazIwQ1J2?=
 =?utf-8?B?U0ZGWGxiY0hXTy9pU2RpRjZVU3R5TDJqSHNnSTdPZlpwUldYb3VsZ2EzMVpi?=
 =?utf-8?B?ZGxsQ1VCTnZ0Ry9RYmhDd2gzUmJlb2MyeTNzSEUyVytkWi9ZQ1pUMmhhUlFr?=
 =?utf-8?B?ZVFuWU9KV2RIRlJ2SVE1ZzNHY0sxTHVMZ0FhN2U1VStZK1h2bGVHS2dra1Iw?=
 =?utf-8?B?S3NROUlMei9FcUl4L1RBbFN1T3VyRjhGQUtjSGZYSFBDZXJqc0VBNi9FYVBN?=
 =?utf-8?B?bU02aE5HYXJ6SkVQRDVsSzZpYWJXS25vOUs1QU44ZEtaOGtobWlkOWtYam5V?=
 =?utf-8?B?bUFEQzg4NEY1eWNFN2FKcGI5dU9qQndXMDljQ2hLQ21GM0NBNkpvQjN6M1p4?=
 =?utf-8?B?SCsyQlpIVTg1d0RDZC9oYnp6bEZ6NUdqMHZKVkE1WVgzeFZ4cSt6L2I5Nm9S?=
 =?utf-8?B?Q3B6ZGFCakNPaVVLTTBDRWgzYkEvR2tJWk1YcXIrVkxMbUJ3VWFlakh4dDdy?=
 =?utf-8?Q?TgbJcIx6M2zF8WjKqezZIEo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e62b17a-0166-4db0-06f3-08d9dc2c0986
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 15:46:34.8264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKOM9+xbYY/2o7KXMdQHHvTMbsi8pRsaa+zfZtVjeIdM51Tj5y6C6NmhHAaM3hLP5kH1quYjer0JWPcFg5O9vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5647

Its only user, ns_to_acpi_pm_tick(), is unused.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -48,7 +48,6 @@ void pit_broadcast_exit(void);
 int pit_broadcast_is_available(void);
 
 uint64_t acpi_pm_tick_to_ns(uint64_t ticks);
-uint64_t ns_to_acpi_pm_tick(uint64_t ns);
 
 uint64_t tsc_ticks2ns(uint64_t ticks);
 
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -535,12 +535,10 @@ static struct platform_timesource __init
 };
 
 static struct time_scale __read_mostly pmt_scale;
-static struct time_scale __read_mostly pmt_scale_r;
 
 static __init int init_pmtmr_scale(void)
 {
     set_time_scale(&pmt_scale, ACPI_PM_FREQUENCY);
-    pmt_scale_r = scale_reciprocal(pmt_scale);
     return 0;
 }
 __initcall(init_pmtmr_scale);
@@ -550,11 +548,6 @@ uint64_t acpi_pm_tick_to_ns(uint64_t tic
     return scale_delta(ticks, &pmt_scale);
 }
 
-uint64_t ns_to_acpi_pm_tick(uint64_t ns)
-{
-    return scale_delta(ns, &pmt_scale_r);
-}
-
 /************************************************************
  * PLATFORM TIMER 4: TSC
  */


