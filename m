Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBEF3BBEAF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:11:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150305.277928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QG4-000274-6f; Mon, 05 Jul 2021 15:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150305.277928; Mon, 05 Jul 2021 15:11:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QG4-00025F-32; Mon, 05 Jul 2021 15:11:40 +0000
Received: by outflank-mailman (input) for mailman id 150305;
 Mon, 05 Jul 2021 15:11:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QG2-000257-LG
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:11:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4aa2fea0-dda3-11eb-844b-12813bfff9fa;
 Mon, 05 Jul 2021 15:11:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-0QQlHkl5MuelEz4g36NN0Q-1; Mon, 05 Jul 2021 17:11:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Mon, 5 Jul
 2021 15:11:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:11:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:208:14::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 15:11:33 +0000
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
X-Inumbo-ID: 4aa2fea0-dda3-11eb-844b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625497896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AcLhpKAZnmoAxFsMXWPBvUtE43UW7eAar8znGWUZKyw=;
	b=h2PNj40u9CVZdI6sQ3nSpOL66MYx1VTQPzmRmQtdIvUuzWhtycH/mpB3CvdBZ99kRHeF4h
	0I+LBUe9vRBNvMxypuieM4kyysAIRJi5eB6PFN5Oby8AVUEuKcUHeIPewu0oYc0/Lus5CS
	fZKBnpfkn9c4FW1Zoeh/hokpZtmRBeA=
X-MC-Unique: 0QQlHkl5MuelEz4g36NN0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlvKvdqYLYu7h/KlKE3pgNssHdz0OXu/LBVV8aYbKrWZq4LTZ7y5SJ2RiuvBFsddmFWUFqtWXVfMS73GOnH8+Bh3gGV6MpimR2Ezq+JxgZiSkwj+dm+4HpAUmAkMUaU+AkIv6EQTztmsa0z2ioKoa2GD7VtcPj/HQIiD10ZdjLtv7MZ4Fau9EwqcxI+Une5mleSM7VFLSz1xFqiQjRYy2t/RDEgupqNXunlWLyW8vD0S9KkL9r6I0by5DtOeiCxWjV8ZZg+4dnsl68DL4PkYPXrRTn0zyV0vETS59D24hwi7kzN/qbkiyPGKgWvuOizMzFNqYj8I4HNaNEJoDbU/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcLhpKAZnmoAxFsMXWPBvUtE43UW7eAar8znGWUZKyw=;
 b=ON+KynClQBccv0jFvPU81/NGcVK8MLpotaL6Ayq+ZYjBfNXSki9B/UU56Q3fd3HPt3AAtN2S/kYqmWAQ/eDlxmiEd3kgbBjiAbt8SuhPalfI/cBU50E3p8EMPJkUypDdTBtBiKLf9r7OsaqpiLJVAGoi7HEkrnLUVfumBNCR59tFrhLLeA36dDVQto40L5MkJaUu3Anv4kKBNEdxAYBj92dmixfJ3l+n5FQ/WseF3blyRVMxclN7hqRoGVj3um9Z4sIymIcnOv4+J4QcPYrnlKRpfFEw6kH9pfbxd65bVZt2Pp7Gr6dbyfCqIExJoGv8hoWkCzcBa4dz3QELKoYiSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 01/13] libxl/x86: check return value of
 SHADOW_OP_SET_ALLOCATION domctl
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Anthony Perard <anthony.perard@citrix.com>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <4d1e5a4d-05cf-964a-bc4b-9eecf26e58bb@suse.com>
Date: Mon, 5 Jul 2021 17:11:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:208:14::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 442c4d2b-6579-446a-749c-08d93fc72d0a
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040B50488DC5276E613A4FCB31C9@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SfbgCr67Afsa+5XOZd00sSTSJbCANVFNbzkAeq/kCiB+BqFS7YFicASfd6iYIstbNserlVfN3dKA+fuWsI6d7dPR7vw/mlr1N1TjqXf9O7nY4odBhTmE3bkBJkhKiB7WUlzVRrG7zBePqelMCnvCa+CEuP9BoNSu/PV07qh46UA/rz7JaLGn2pdvCJr/+yCkdFncpoVDyw85gVFFgtD6GyaXXDEUDpe0GjuZO3w/ettHlOClt4k9mzuOXlM/KyVynF6l2X7c15AqSDOPQ0ODZi5qft/Vqc1vYg2QFgWXqIRxfMZLIr8gw48Jx++3yklUWQcETpc4RBv9J3wvSSLTx8gYiYwbpQbQKINnizFE6sqpn1CqwbOkKMEH14VotZAvnIXgLTwl2d23vNEEIGS0U9bNLRyKdqHtSVqY2ck08ePK+b98EZFj/IVI5l2U3mfso3YdWGGimuv4TD2tQmUil5W1HcDEujzpgMkjEs/gycXvAOoc5l4bRTeL1NG4A9Lx8z12z7vj3+w/ANpZuzccCt9AMwtMxiNfmhBQ0FuPlluSOT1ezZm1FuTs6VEpPnhlaJcXFTMU2K+GiHFO29tOg1ArywQP9Y5SfkMw+PCRJLfdezKeJR2y0po3MQ19hjgnHDgjBsBQpXtEgS4RzxZITYainJoC/33qbdWEdiKCreGko459tsYEP9fhzf0Zh6qWBkgbYuEHtOPcWYncVui4HpY0KjxIruMfHIoq25gb3M1tWHJxTAem5ZGiAdxSN3zM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(66476007)(6916009)(2906002)(66946007)(8676002)(16526019)(66556008)(31696002)(316002)(26005)(31686004)(83380400001)(2616005)(54906003)(478600001)(956004)(16576012)(4326008)(38100700002)(36756003)(6486002)(86362001)(8936002)(186003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3FqSXNZa282UXRoVitDYXJnakd1VW14ckVqMHRMRUxWQ0J6OGJacFNQdS9m?=
 =?utf-8?B?bjVxYWZYeitpRGVMSDBqazhHUldYMldaUW14bE0zTnNwRkNTQWp0OHR1VTZx?=
 =?utf-8?B?bTNsaGFVWDhRSkszYjFQRHRnclJaUERZT0p0UlVrbmdQUnUvbWlBODJvazZj?=
 =?utf-8?B?ODRTL3FsNS9XZ0E4SjhWWVdxczUyQklodk1KRjA3cDJvODdUaExTbzVpNFpk?=
 =?utf-8?B?aW9uTWZ5ejBWV1NkbVI5Qkl1NzdBNmY4Qmc2N3BXb2dWc0V6c0tOZlM0dlA0?=
 =?utf-8?B?ekczYUZ3QmtROVcvWURjRkdpcmxIK29jdERGazg1TGdCc3gwVi9vSXhCS0RI?=
 =?utf-8?B?VWUyYTA5clZIQ1FrNXlHOHIwcXF2V0tIc2VjaElLTmtmV1U1U25MZ3BHY1Vq?=
 =?utf-8?B?K1Z6QTJEQ3Z2RjNQOUhvMzQ0bUM0bGRFL2VobWhaKzhPV0owSlVyK09mckVO?=
 =?utf-8?B?eVlnNEcvR1B1d1ZXeS9wUVpDRnBzT2FOd3NCMk0rWUNPQW9PTStDMWozT3ZF?=
 =?utf-8?B?TG1jS0xxeHp0Ym5BS2ZWVmwwSUhrNUlsVEJwWUo3cENWSjBiOWxiTjhTbUw4?=
 =?utf-8?B?SkUySk5sZzdOOGszUmZBcXJhRlJQME9iU09DbEo2UVBiUVA2MzdWQm1Kdnpn?=
 =?utf-8?B?dDkxOUpVOGszWXpZYTZQb2VmaUlpRWJMOVUrZW1LRk9kOFBOL0JvUDZvQi9H?=
 =?utf-8?B?VEZJVmFjSlQ0QVRiU0FwOWU3a09hYmZNSko2Q2NPZEUyUVVNQ3o1bDhvNTRr?=
 =?utf-8?B?WTNMYnl6MFhydCtGb0N1NmdOUG9GSGw0ZUYrcHZheENMZUNUTG03STN4OHJr?=
 =?utf-8?B?V1ROeU04V2ZQdW8rQ2s5SWx6ZEhra3ROaFhpckQvQ1BDRVZiZUx2MXpmS0Zy?=
 =?utf-8?B?WXcwWDkzdGxHcVBrMDBDNE01Vzg4RlpFZzBWNnh1cU1ZOHJUNi9Oei9rU0Vm?=
 =?utf-8?B?UVNZeFI5UVNGUC9jVlRaRG9XK0ErbjNpdnROcVNxcXhRVkZTd3dTcWtDY2ti?=
 =?utf-8?B?TWphaFRJd0xMd21ZY0M2R25pbzA2YWpzL3RKSG1xRVd4TkJVUjNESWIxelpw?=
 =?utf-8?B?OXdtS01udDBucytTVGR3OTRNWlNkeTJIdkl4cE91SkZsMjJVNi9XNVVRVjk1?=
 =?utf-8?B?dHZKbDZQKzNTbW1LMTE2dDNFRTFwc0RHWmRvTXdoQ2VGVGxqZHozaG12M2J2?=
 =?utf-8?B?cVV0Mm1xRzhQSGhneWY5LzNEek1lWC9GdUplNVNUK2k1c2NseFEyVzQ1Q3BS?=
 =?utf-8?B?MUFWU1o0djZ4aGlqeW02UENRTmFrZHplV3luOWZ6M2YwbFdzNHJwQUpoOHdO?=
 =?utf-8?B?Q1NxNEdIVWkrWHA2ek5wSzNPYTZ4TC91aCtFR0dqdEF5SngxdmwySVQ3cVJI?=
 =?utf-8?B?eUhGWVZXcTNaU2lIYUJIREkwZm9FWmExKzFxTEt6TkxVRzQzWWgrZHE0Uzlk?=
 =?utf-8?B?OEF1Ulg1QWJUYmRjcXlyVE9FSHU5cENnUnhWTjVOWStXdGlJMUdRbjZsODBl?=
 =?utf-8?B?OTBjcXlwaUdiUEY0YWNBTGEyN3ExaXpJOVI0OWJCLzA3MWg3Szc3NVpBQmJk?=
 =?utf-8?B?eDU1T05odGlPNlBvSkQ0SlBmQ3ZNMHFEQmJSNHZRYnZ0Uk9ML2c4V05pUGJo?=
 =?utf-8?B?S2dHalQyb1Y5aEYzM0J6T0JDd2h1S3p5RFpWY0ljR1ByMHoxTzhVbGlmeUZ1?=
 =?utf-8?B?S0RGWEFiRDZLY0RMWFBDcUcwTkVhei9PcjIxYjNieXYrYjNmV0pyMHpzRG9O?=
 =?utf-8?Q?ZKlselcOf2mQmvzVbxkmJAc6D9G/tZGhj5FrOW1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442c4d2b-6579-446a-749c-08d93fc72d0a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:11:33.7406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m3n2xBuPFyp/hKn9REGuD7w12w+nnnk+1K+EBAUwF5AeAhox9eGxN9jqzCV8MKfpoERxMPf3E/12F8Q10b8lpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

The hypervisor may not have enough memory to satisfy the request. While
there, make the unit of the value clear by renaming the local variable.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2: Rename local variables. Also log requested value. Don't log errno
    explicitly in LOGED() (nor function return value). Integrate into
    series.
---
Especially if the request was mostly fulfilled, guests may have done
fine despite the failure, so there is a risk of perceived regressions
here. But not checking the error at all was certainly wrong.

--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -529,10 +529,20 @@ int libxl__arch_domain_create(libxl__gc
         xc_domain_set_time_offset(ctx->xch, domid, rtc_timeoffset);
 
     if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
-        unsigned long shadow = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
-                                           1024);
-        xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-                          NULL, 0, &shadow, 0, NULL);
+        unsigned long shadow_mb = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
+                                              1024);
+        int r = xc_shadow_control(ctx->xch, domid,
+                                  XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
+                                  NULL, 0, &shadow_mb, 0, NULL);
+
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to set %lu MiB %s allocation",
+                  shadow_mb,
+                  libxl_defbool_val(d_config->c_info.hap) ? "HAP" : "shadow");
+            ret = ERROR_FAIL;
+            goto out;
+        }
     }
 
     if (d_config->c_info.type == LIBXL_DOMAIN_TYPE_PV &&


