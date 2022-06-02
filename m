Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADAA53B71B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 12:29:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341056.566235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi4W-0007Fo-PN; Thu, 02 Jun 2022 10:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341056.566235; Thu, 02 Jun 2022 10:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi4W-0007De-LJ; Thu, 02 Jun 2022 10:28:56 +0000
Received: by outflank-mailman (input) for mailman id 341056;
 Thu, 02 Jun 2022 10:28:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwi4U-0007DW-Od
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 10:28:54 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd06c6c1-e25e-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 12:28:53 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-46-XIEcMbQTP2Wt-rXXIsmKGg-1; Thu, 02 Jun 2022 12:28:52 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4177.eurprd04.prod.outlook.com (2603:10a6:208:5b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 10:28:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 10:28:50 +0000
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
X-Inumbo-ID: cd06c6c1-e25e-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654165733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h+1PVOQ+hil5P5y2+bKR8TqRq2XSQidRzzSytWExdRk=;
	b=k4olpxN2tUkvhL4Ohq1c7aZ28PfzyAxpYvHLzb/nkkKRLnDNgK4RKakPYYFCxXThP23Z4I
	bPp+KpPdzpgxKy5C3jTK+ZOWPR4IYzySQ9qp4/inhLeiUdgm+thkZL848YucFeQ4zt+fTa
	Rbx+kEX4OC0mDcyuBn6qOWs8t+nZ7pQ=
X-MC-Unique: XIEcMbQTP2Wt-rXXIsmKGg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8GZkWK9MB6p5lsHhqzSrDcyq4X8C0Rilt6M623W7Dz/xqMPqU8HuyYHOEUmodrrpXkq+x8FZEgd+HX3sLpdbB8RdSAJwm6zqyN2AUbjVgC98r4QyOpI0nkCdpgoR394NVKDPkShkZIYxhZcD7Uw63Ts+k5r39Xs0VO5wRIFFRgg5JuByxZkL5hXiZG5QjTDvYGctpZ8qEUOv3k5YXYThvXqYWiLoOV/KY9gbcKHgVEpoEb9XkLubOYVXbVNp3ldAjdc4xFX/a9FsedqWUxY1GCkuimVa0S8pG8LzuxK6RdOmhBfHz4wiSKnU29i5GZ/jp8ZDQg2Q6Tp285jwHQaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+1PVOQ+hil5P5y2+bKR8TqRq2XSQidRzzSytWExdRk=;
 b=BfJFkYzuZaLO3vfXnECYVzifeSfAG+cu3aV18RJr0/04r+N8ECEojiE9Pt6/DPHBMSlwl9rMVWdPJMfj0en88BvjOiB3jHMBOGALbCXXB9SItN4NIKr8RjfKKouR/1AYL+hVFWv/g6UxzUpHbPbje70Ft18uHFthYb1+A5FXG8ESQsqGu/QWfM9HZev8ILesCbEOu0mTio905eWs+4i/Nik1HeKgJLGWXWfTIDia0BivFJPH4yI0eimNr78Okd0ntCofzgbD4/pYsUwMnZKWEaebbXupjtUV/uVfjy+ichor5+gboFx5D1jxzvqFewItCoVr+bEJJ7XbOovr7m7Mmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5301950-8cff-108c-3364-baad978c5707@suse.com>
Date: Thu, 2 Jun 2022 12:28:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: encourage compiler to use more embedded
 broadcast
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0019.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8da3ffc9-e0a5-43b7-5a83-08da4482af82
X-MS-TrafficTypeDiagnostic: AM0PR04MB4177:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4177BA790B9F249EE9494AFFB3DE9@AM0PR04MB4177.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QIPnPJHtFZCeULf/pNFIgUM9dgQiZZAFRxCtuLfSuKvcULWaaSLiWHU8tlXLfhxIrPZqtu0tzhlLtRzgwxaIKfQ3NEDUluT8TtEsn0hxBTvYUCw4plqHl8ffMbRuVZOJlKbZ2fy4q+A4AdOvlFxDJJNCzUL0tlY1uVcT5BxWmslknsaPd0ocB2f2/BoGRtpm/mnB/lwQuvfd6Dy34Y1BPoWPykix4TzhoOpfhVRCcMBDVzxLp9eM2TY61n4Gl3+Zzi/Y4qtKxp2D7YQoz4Tw3hHIggB8sGLnmfPX8nHeNeZwqcuj/eKOu1MTI+iGrxYJDMdR1Hy+jfou31F6FdK4RPhILxpFxtaeVl8YkBfB7wicnPrLAnXWkpStKDQlNGiNAqxZOklFCz4mrRaDaJdp2zTqxHqJdLOYT0p5T/BIotb9q6MZsliB3AgMt4dDAYyv70tUVZgjx0mu4Z0q8nXeMrxm8l8VqUy3L9tZZwNy7KRzY5KINWB6txHw1vEi2Hh2wOKk5h9fhW+dNqkqCjADQypTht1CpHSrKmFgJFAcCDrxRLic8s+KDcS5O6e41jezG5KiASzE3y3R0YaIW2Z1bUR3z9/2xbMTtMhM+DDmgSeLdtycPAm0k8wgyfTr3MR35WUaKOOCqpHrrB8XozYiRZ2yY7XbtYlkRgahxwl3J03U4LIPdYXIHatFVdKhMx5TU8+r8RnXORICkirCNVbMiPtOrRcynKtL9e5jFNIOusYDSrU40e7OdGZY58FV0yBw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(38100700002)(31686004)(8936002)(36756003)(5660300002)(2906002)(6486002)(186003)(26005)(31696002)(2616005)(6506007)(508600001)(316002)(4326008)(66946007)(66476007)(66556008)(8676002)(6916009)(54906003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YktRUWJ0Z25KZTdMcFdka294Q0lCWDUyMVNKUVdCcTNmZFZpNFFydDFaN2lz?=
 =?utf-8?B?QVVmOHhYdEVMaWZjYk1YVm1QQXVrTU8rVDBraCtpSG5xVFdJMkV6ZE5JZVhm?=
 =?utf-8?B?WHUwaDZncjZGREwvWDRLcURsVktZNmo4SjBvTEJyYVJJMTJhTUZuQVh4ekQr?=
 =?utf-8?B?TnNkS0RyZFh1MlI5NDFYK3k4RHlKeUdCMHRMdElUSTdrTG82OG5XUzR2NTlu?=
 =?utf-8?B?RVpyRGhrWS9ISDBwQ2drZ3VNZmVna1YzVDlhK2VpM1ZZY1lYR21GZDR4VTdR?=
 =?utf-8?B?TE9vSTBXS0VJN1FCc3BwZkNnOXdjL3BmSGxGRkRyNFpoRlBPZzliYVdUSFZJ?=
 =?utf-8?B?amhNaHhsdFVvUEt6NVN4cTVVMS8xb3lKeUJSUjZ3d0lpNE1GZ1lYa01ROHJV?=
 =?utf-8?B?enc2V1U4UjI2Qk5qZStGUnlQWnROQWZiZFBTVXlrWVUwa1ZoWVZHRUM3Y2Rr?=
 =?utf-8?B?SHZaUHdDSkZhS0M1QnBSblBsNSs5K0xVVXdGR1FVeVNNYnE1azVwUzNUR3p6?=
 =?utf-8?B?czJHdUtqTm9JU0tQTVJDK2pPb0RqWGwvTENyZnIyNHh6ZTNVZFYwL0J6amFx?=
 =?utf-8?B?RWJtWTB1b3BYY2xuZlhONWJzUTV3aEp1NGJ2bUNjVVRSaUFMNlJuTzdTZWJH?=
 =?utf-8?B?S2gwOWVUTkNaRWlXNFNtOUR1cThHMStwN244S3FwUEJGWmdpNUUwWmxGblI2?=
 =?utf-8?B?THg1aVV1OWcwM09yQW9LVDRBUmZaVWRWM1l1cGpSL2FvcjgyVVpGV3Q2dGNL?=
 =?utf-8?B?VlBkZlFNQTdQODdNMGhOVElnajA1ZGE3QUVtcFN6dEcxWDNtR3VJZFpuVGZ3?=
 =?utf-8?B?QXU3OW56ZWovbDFSekFTOENJSllFemQ3U09KUUpvSHZzbk9FRDRtSy9oajZ0?=
 =?utf-8?B?SzRENUZCYzJmSTh2eldIcXFqa0phZTArME44aDZjcFhhWDBGS0FXVVdmb2sz?=
 =?utf-8?B?UDFTTXRneTRDNElOc0piQkhTRHQyQTcyNnF1UFRkNFQvNEVmRitTVEg3MS80?=
 =?utf-8?B?UWkwQVVMYSt6TDJFVURnT0F5Rm40VmtueVhIYmUrd0VNSUhRWmZCR1B2Vzdv?=
 =?utf-8?B?Nm5aamVPYmt6NXN1RTRSWkdGTnA4b214Z2NwaVlvYitqa0syT1BJc09oSEww?=
 =?utf-8?B?R01HQXNUWkYxSXFLT1p0S29WR1h5TjBrdmJVOE50cFIxSGdpN1YvUksrTUZG?=
 =?utf-8?B?Y1BZMUVML2lmWlh4S29GallGcVpjeWIvRHV1NWxRK28xZ1hRbjNHQWRNUFJo?=
 =?utf-8?B?NGdpV1RuYlptZmpVOUExd054ZzJvT3psdnNqNE5DWk85Q0NJSGFrcXZ4cnpS?=
 =?utf-8?B?c1kxTG5zdjdZejJqQnlqWHF3UWdycmwrdC9PVFE0QkxFNGUvZDZoMlNMMVRZ?=
 =?utf-8?B?eUZ3bTY0Rk13Tlc4UXVyRVNEeWRPQU9Ec0E3MUNPM3NWVm9Wazk3V0Rja0Zt?=
 =?utf-8?B?MWt6R0E3WWJ5ZktyL0h4a2ZQVHFYUHdvVG0rSzJNaTMxRWdSVXVOYnVaUEVi?=
 =?utf-8?B?cytEOWcwT1JJTFAvZGxTeWZvUE9wSWRjK3M1RjY1RDhDWWdLaTZVVCtiOWVO?=
 =?utf-8?B?cmhLRGRNQmVsMjhKaG1NclkvNXNxR2hFWmh0MWx1Y1Rqdkc0ZWRPbUFHSHpz?=
 =?utf-8?B?RkZSUUhhckNLOVlkb0RJanNjSVVHRUxzSnlhRTRNdG51bGFUdy9MakpLMWF3?=
 =?utf-8?B?V3VWMmJOMWFFdUFySmdKUWVLOTZMeWMxb3paVHQ3aVpCS2ZtYjVLY0tvdVAr?=
 =?utf-8?B?Y1I3Um00OE1EQWxGYmVlZTZoTUtURE1UczFMUUZWdzFTaElIdFpKUngwRkhH?=
 =?utf-8?B?OEU1eVhleEJHcnBNRGNGbXNZNzRBMjl2aFZSd1dSYzQ1VVdkc1dQZStiSUNi?=
 =?utf-8?B?d0tvdnZ4dENLUDBudUdSUkkwaEowNTBrNlNRQXkxWGF1L1J1WEZPSkgvVlBL?=
 =?utf-8?B?dkNQWHI2ZjZkaWprMVVObjBUd2FVUkN4T1hTOWRZS0hlZ0RvK244SUhpUzNp?=
 =?utf-8?B?RDRXZzBsb2x0Q3hwNjZsUUtMbXBKWmFoeTRzMEZyZnlLNmxtWEF1YXByZDBB?=
 =?utf-8?B?L1FwYUlnZEdlUzJJMkg5N0tCU21BdW5UL3FHK0tMZUlnbldCdExZQ2NDMTBY?=
 =?utf-8?B?QjFTYzk1VWxyTUphRFpEZzYxc3JobFBQb0tWSWcyWUMwc0lHWFk1QmRpb3I1?=
 =?utf-8?B?UFEwdSs3SUhESzVrcDMxVXIvVjZKejhqQ2lYRktPWit4K0pmdk84Rmt6MGgw?=
 =?utf-8?B?ZC9EQTFNZjJibWpmdUk1V3U3RisrQXJZcDl5T2dsendqdityZ21GVTF6MGlk?=
 =?utf-8?B?Vmx3MUw4WHpReGx0R3Y5S0o2bU1ZSFVwaEFySVRZclloMVJlREJDZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da3ffc9-e0a5-43b7-5a83-08da4482af82
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 10:28:50.8745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukIuvNDGOmFrH9wsyqXEEZzoT0VPnJEZ7k++9UbluhlqK8KNv3dhPMhJKHwU+MIHTt73np/ed41lzFYLwMxvqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4177

For one it was an oversight to leave dup_{hi,lo}() undefined for 512-bit
vector size. And then in FMA testing we can also arrange for the
compiler to (hopefully) recognize broadcasting potential.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/simd.c
+++ b/tools/tests/x86_emulator/simd.c
@@ -912,6 +912,13 @@ static inline vec_t movlhps(vec_t x, vec
 })
 #  endif
 # endif
+#elif VEC_SIZE == 64
+# if FLOAT_SIZE == 4
+#  define dup_hi(x) B(movshdup, _mask, x, undef(), ~0)
+#  define dup_lo(x) B(movsldup, _mask, x, undef(), ~0)
+# elif FLOAT_SIZE == 8
+#  define dup_lo(x) B(movddup, _mask, x, undef(), ~0)
+# endif
 #endif
 #if VEC_SIZE == 16 && defined(__SSSE3__) && !defined(__AVX512VL__)
 # if INT_SIZE == 1
--- a/tools/tests/x86_emulator/simd-fma.c
+++ b/tools/tests/x86_emulator/simd-fma.c
@@ -63,6 +63,9 @@ int fma_test(void)
 {
     unsigned int i;
     vec_t x, y, z, src, inv, one;
+#ifdef __AVX512F__
+    typeof(one[0]) one_ = 1;
+#endif
 
     for ( i = 0; i < ELEM_COUNT; ++i )
     {
@@ -71,6 +74,10 @@ int fma_test(void)
         one[i] = 1;
     }
 
+#ifdef __AVX512F__
+# define one one_
+#endif
+
     x = (src + one) * inv;
     y = (src - one) * inv;
     touch(src);
@@ -93,22 +100,28 @@ int fma_test(void)
     x = src + inv;
     y = src - inv;
     touch(inv);
+    touch(one);
     z = src * one + inv;
     if ( !eq(x, z) ) return __LINE__;
 
     touch(inv);
+    touch(one);
     z = -src * one - inv;
     if ( !eq(-x, z) ) return __LINE__;
 
     touch(inv);
+    touch(one);
     z = src * one - inv;
     if ( !eq(y, z) ) return __LINE__;
 
     touch(inv);
+    touch(one);
     z = -src * one + inv;
     if ( !eq(-y, z) ) return __LINE__;
     touch(inv);
 
+#undef one
+
 #if defined(addsub) && defined(fmaddsub)
     x = addsub(src * inv, one);
     y = addsub(src * inv, -one);


