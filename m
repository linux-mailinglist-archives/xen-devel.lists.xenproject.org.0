Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD96840C65A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187609.336549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUui-0007Gm-3q; Wed, 15 Sep 2021 13:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187609.336549; Wed, 15 Sep 2021 13:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUuh-0007Cc-Vg; Wed, 15 Sep 2021 13:25:23 +0000
Received: by outflank-mailman (input) for mailman id 187609;
 Wed, 15 Sep 2021 13:25:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQUug-0007CB-Ma
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:25:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e84f385-7855-48db-bf06-9ed834f07ee0;
 Wed, 15 Sep 2021 13:25:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-3-SdYf92MjM0uvDqMip3mpRg-1; Wed, 15 Sep 2021 15:25:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 13:25:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 13:25:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0029.eurprd09.prod.outlook.com (2603:10a6:102:b7::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 13:25:17 +0000
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
X-Inumbo-ID: 0e84f385-7855-48db-bf06-9ed834f07ee0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631712320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VDoYITGSl1EhuEmr7q/46YlB0q7RVPdBu0DpYzl+Hk=;
	b=BRplxwogbz8hyMhlkztT6U6Vtp5q56JxWNRD+F81jGAxRtqF7dzYDEv4DDEjUFDzkJARw9
	dqzu/ghqtH4uJsh4XPJ5nufc+QziurWKN0O244UbvbLKdw1VIJ6lGR2DlbCuKh9hl1ejSg
	kRcpXteednMemq3RqBAeOQid9fA5C1w=
X-MC-Unique: SdYf92MjM0uvDqMip3mpRg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XknlVbhfh2oaVramCtNzdgetx9vQx5mr7+VHnvEFWOg3xAxu77DZOPY0QmQ3AbKgsvns850zjEKDLYBdGCibc8/IYgi1ugarE6osReFers+qyAmR1MkPhBniY+133UEn6200fvCG7F/o6TICM79M4mXOvbWokoJjy3HztRTtE/3j+s+O3f5rDfJ8+MydYSXQASeoBYADz9Y4gNcBgDvqRvb8wfOCPQIcMIRGyvWjmzauYlsvm25vLqmO+fhsKpQv12SZ9RPoXFLo2RfPUOKhGZTSdT6ZuVBuw5B1hbRk117KLP3rCzfUNZqvdhvEVSO8mrk10pw4CC2T+WTASPC0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/VDoYITGSl1EhuEmr7q/46YlB0q7RVPdBu0DpYzl+Hk=;
 b=TISPcPUTZLaz8b5ZBEqpSU/i//CcYiJQgvtQ7wadY2eoke2IJQftnznnmOj446+srLm0Lq7zoUqtlnfY24Jjll9L0Y3wAnsOLstB8dDjWUz+933oVfHFtuMVdqci8gW08f3+NFqJw/Weu1r7udpfJ1Gqsy+461Sc3VRWy4QoA2p3F0h99TlCGq1Vcet8T8SHm81iOZJFuGa5QmBspon9t4yCku3AGweGXEq5ODNeY05EdyVC+IOzgz29CyyQ5OQ/yP5lkk18Wysp4yGr88P3lIpqe1PMaRDIOsRHb4FTvkcdke1SAIurOGLMgtej0VPT2fDMKlHN+KEd9zA/Df3Wzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 3/7] x86/EFI: retrieve EDID
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Message-ID: <7c06c5e8-324a-e402-680d-131693a37ce3@suse.com>
Date: Wed, 15 Sep 2021 15:25:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0029.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8aa65c14-25b9-41c6-6a3e-08d9784c42a2
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB435242FA3D549E4754CE998AB3DB9@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T+wOxeSo8FIw3phuKg+zNSc8SQUVUAVUrMjuF1SPl0IIbYB/gFpRuevISorZqnVN++HU4MMRyewpucicxLhsm7IuiydCmAxvVcUFRxDNXkS2VPBsyA40vcWcd63QOEC7eoDvIPV+rjjumMprsoI9eX3O3UDaoVqwNpDAWuoWaDnUsOTexST8F5aXFJGKxnQYRnwAd2nKL49M3XnQznQrOn6x2UGDJn+xRZleBZttyhZzm1weEwsOtXoaQTNtXdSDa2BEYPMFNSpH35KsUngPI8WVOn3nodplHlOFQQDx+jbAHiGXaiM4VRaa+Rm7ornJVQUbByFrZNYTk+1S/YqRKTkGfJKkn2vvR8KDR0atjiHMtLYK2uUgH1tb02joA4i31tfW4R6+tqi6vPCg2mLr0G9GWhuBiU3cATwg1mkiKpXVv1NqDxpnywkXsb3yqqGIUyNU9St7FECKJw0lIEbjrurE3PrwPlurIykHZ0Hp5t2r60oNECuPcF5Uegeq/FduxGkToq0sRQAVVo+62J0qYQMoMFXYrzX2dAtf9PbOJRGmwvv4Kv/RGERq/N4Y4IVJqzp4M3lvfZNmGX2SAMJwZoSPvBsqN/QBdZLqYq2CSjZyzMqQvQnyq7AM+4RFDslRjv8GJGPl17YRZaofhgQxfvcm4ZGfozcYhUpAE6r0o5nImc5lHlqhdJhvC3Isn0OUi9U2zpDJLe4TGkYqjiclLVpYkQMiwhwega3jfsUo+e4zQGEB7OMcebLq7xbM4+fkRlCdMOCqSLA25I/qcWOsFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(366004)(396003)(376002)(31696002)(316002)(4326008)(16576012)(26005)(6486002)(38100700002)(8936002)(36756003)(956004)(66946007)(54906003)(66476007)(66556008)(5660300002)(2616005)(6916009)(8676002)(2906002)(186003)(86362001)(478600001)(83380400001)(31686004)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHBaeHorRFVaM1JYZCtHbzVJQ2xTaGN4V29lYVpEZFVhN2hQQnBGK2JUK1BI?=
 =?utf-8?B?bFkzNi9yRnBlTlhLelVDV1dvSXRGSEYvYWRham1ZazdSd3JGVW00eVMrcWJB?=
 =?utf-8?B?UEVzRDc2bTRpVVhCSnk5OUtaRnN2WXMxODQ2UGU3YXJ1M1JnME5wWFErSkdQ?=
 =?utf-8?B?VnJDcUt3RzJMVE1DaE9RTzQrb091YjRId29WdVRXeVA2ZzZqWlNxMXRyN0Iy?=
 =?utf-8?B?Q3RnZFhoWnVBMGt3RDQ0aHBSM0RsWEdoZVdiZHlUMnk5Mzh3Q2lqcVdOM0Zq?=
 =?utf-8?B?SW5XYnRDUHYvcGRzQm1VeXl2bE1rWVo0N2UxUmxkRWZmeXJLQkFSRCt5Y2t3?=
 =?utf-8?B?Q0R6RXNUdGtDQmdjWmdjNHYvL0Myb1RpUmJVbjQ1SGsyLy9UakVRQlNuLzBD?=
 =?utf-8?B?aFZGQko3RFJrVzV6cHZQcDFmMXBBU1k5ZjBvNy9tSzZDUWltWFpHMnpGNkx3?=
 =?utf-8?B?Z082a3hQQVJzYWtzUm1jTnlvdFJNN2dxRFFkTm54aElzbEd0UGFJd0JwemxY?=
 =?utf-8?B?QkdXbnYrUUd0a01LOFBlYTloY09tWmc3aUkyb0tlekVPTlZQYSs2ZlFQMWdn?=
 =?utf-8?B?anFUMDBCWDdLaVhEVmNHa2JWcXlPOHdnQm5lUjRUTXkveUMwSVQ2Tm9GS25r?=
 =?utf-8?B?YUxuYTF6OEJjeXZSS2xNK2lIaUpLNElDK0xIcHFmZjhDVXIwbFgwVnlXY2py?=
 =?utf-8?B?ZjM2Vk9KNlJsWDNmTHdRV0ExbXU0cTRML0o3dUxpaTkzNkZIUWhHZzlIazBo?=
 =?utf-8?B?YTBRYjR0TERmdlRzaThhUHRTS0ZNa2NUdlhObWcrT3lmN1dmSmIxb1E5SXM2?=
 =?utf-8?B?VW9nYTgwYmVZbGZpQ0F3Q0hQM3BqL2VNZXdqVGFOZTBFVVlvUkxkVTNMNXVQ?=
 =?utf-8?B?U1ZvVkl0c1RBZDlGSlhJZnI5VVRWa1QxLzhFc3NMZnBJaUlpWElWN2NiVE9k?=
 =?utf-8?B?Y1FyamtITXB4UDhmVHlyUEY2dEJxZ09WQy9IdURjQUxLYUR3eUdlZnN2VHhH?=
 =?utf-8?B?LytFUkJoQ2FrRzkvMmt2R1NicjlJL01zaVBJQ1crR2drRjVucGlOcEZzdkNt?=
 =?utf-8?B?VjhGSEZ3c3kxMHFqNjZ5UXRXMi9SK0J6ZGkzK2xmZlZoUlVPcG53UURvLyt0?=
 =?utf-8?B?Tjk3NVA4bU5sRlVhVjRDa2phME02UlVoWHZyR1VsVzJQZTZuZ1ZQZnQ2d28v?=
 =?utf-8?B?MnZWcnFoNUEwSk5rVHY2UGlWcmpXQmtPcEI0ekpzZXFpWXZFOGZybHNXK2ly?=
 =?utf-8?B?ZkVURzVYaExDQWNSNUIvVGpocU9aYnhIVHVvNStTT2F4WEdaVUx4QTIydE41?=
 =?utf-8?B?WFVJMUJpeGMxbTErcWVqMzNscVh5OHE5YjlJUElCRmJxUUpiUWpKNCtZVzBD?=
 =?utf-8?B?d2ZJc3dvcmV2Q2JvVWxESTVXZzBab1dHc2RzZmp6NkxyT1c3K2lBYXpmeUtJ?=
 =?utf-8?B?TEMzZ29TN1lSb1diM1dQWVFqRmRlK2swREY2MEtMaWdYR2tiZmpBMm5hWFFT?=
 =?utf-8?B?VEx5OVRLVkhyazNsbHFEY1huOTh4Q1F4d0UvZ3BKTS9jdUlScTA2UVVlVmdF?=
 =?utf-8?B?am8raGtxYTQvRktpNjJDMUs1R0Z1Rnl5WWRZaG53b3UvOVVXVnZ6QW1UcElu?=
 =?utf-8?B?bEJUT0VIVm1HYXNKM2pUN1hnK0VyLzljb1E4OFlsM3dudXBLSXV2aHlhcnJH?=
 =?utf-8?B?MG5ycWc3c2V4TTJWVXNBRTlzYVJkMVVkcXdrZWJ6b3hhbjdmQU9ueTkxb0Zw?=
 =?utf-8?Q?iOr/B06AGBH2HempGW0ISsOvkE67OsvWdzyOcpd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa65c14-25b9-41c6-6a3e-08d9784c42a2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 13:25:18.1323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8YPv2hWZef89OpHv4zLKa90/MBjP/4OXjVZ3N7eOK1MbYK+ZZPVqjWcFMhmvPjmoYsasyqElZyBbFilqZhT5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

When booting directly from EFI, obtaining this information from EFI is
the only possible way. And even when booting with a boot loader
interposed, it's more clean not to use legacy BIOS calls for this
purpose. (The downside being that there are no "capabilities" that we
can retrieve the EFI way.)

To achieve this we need to propagate the handle used to obtain the
EFI_GRAPHICS_OUTPUT_PROTOCOL instance for further obtaining an
EFI_EDID_*_PROTOCOL instance, which has been part of the spec since 2.5.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Setting boot_edid_caps to zero isn't desirable, but arbitrarily setting
one or both of the two low bits also doesn't seem appropriate.

GrUB also checks an "agp-internal-edid" variable. As I haven't been able
to find any related documentation, and as GrUB being happy about the
variable being any size (rather than at least / precisely 128 bytes),
I didn't follow that route.
---
v2: New.

--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -430,6 +430,10 @@ static void __init efi_arch_edd(void)
 {
 }
 
+static void __init efi_arch_edid(EFI_HANDLE gop_handle)
+{
+}
+
 static void __init efi_arch_memory_setup(void)
 {
 }
--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -922,7 +922,14 @@ store_edid:
         pushw   %dx
         pushw   %di
 
-        cmpb    $1, bootsym(opt_edid)   # EDID disabled on cmdline (edid=no)?
+        movb    bootsym(opt_edid), %al
+        cmpw    $0x1313, bootsym(boot_edid_caps) # Data already retrieved?
+        je      .Lcheck_edid
+        cmpb    $2, %al                 # EDID forced on cmdline (edid=force)?
+        jne     .Lno_edid
+
+.Lcheck_edid:
+        cmpb    $1, %al                 # EDID disabled on cmdline (edid=no)?
         je      .Lno_edid
 
         leaw    vesa_glob_info, %di
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -568,6 +568,49 @@ static void __init efi_arch_video_init(E
 #endif
 }
 
+#ifdef CONFIG_VIDEO
+static bool __init copy_edid(const void *buf, unsigned int size)
+{
+    /*
+     * Be conservative - for both undersized and oversized blobs it is unclear
+     * what to actually do with them. The more that unlike the VESA BIOS
+     * interface we also have no associated "capabilities" value (which might
+     * carry a hint as to possible interpretation).
+     */
+    if ( size != ARRAY_SIZE(boot_edid_info) )
+        return false;
+
+    memcpy(boot_edid_info, buf, size);
+    boot_edid_caps = 0;
+
+    return true;
+}
+#endif
+
+static void __init efi_arch_edid(EFI_HANDLE gop_handle)
+{
+#ifdef CONFIG_VIDEO
+    static EFI_GUID __initdata active_guid = EFI_EDID_ACTIVE_PROTOCOL_GUID;
+    static EFI_GUID __initdata discovered_guid = EFI_EDID_DISCOVERED_PROTOCOL_GUID;
+    EFI_EDID_ACTIVE_PROTOCOL *active_edid;
+    EFI_EDID_DISCOVERED_PROTOCOL *discovered_edid;
+    EFI_STATUS status;
+
+    status = efi_bs->OpenProtocol(gop_handle, &active_guid,
+                                  (void **)&active_edid, efi_ih, NULL,
+                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL);
+    if ( status == EFI_SUCCESS &&
+         copy_edid(active_edid->Edid, active_edid->SizeOfEdid) )
+        return;
+
+    status = efi_bs->OpenProtocol(gop_handle, &discovered_guid,
+                                  (void **)&discovered_edid, efi_ih, NULL,
+                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL);
+    if ( status == EFI_SUCCESS )
+        copy_edid(discovered_edid->Edid, discovered_edid->SizeOfEdid);
+#endif
+}
+
 static void __init efi_arch_memory_setup(void)
 {
     unsigned int i;
@@ -729,6 +772,7 @@ static void __init efi_arch_flush_dcache
 void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
 {
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
+    EFI_HANDLE gop_handle;
     UINTN cols, gop_mode = ~0, rows;
 
     __set_bit(EFI_BOOT, &efi_flags);
@@ -742,11 +786,15 @@ void __init efi_multiboot2(EFI_HANDLE Im
                            &cols, &rows) == EFI_SUCCESS )
         efi_arch_console_init(cols, rows);
 
-    gop = efi_get_gop();
+    gop = efi_get_gop(&gop_handle);
 
     if ( gop )
+    {
         gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
 
+        efi_arch_edid(gop_handle);
+    }
+
     efi_arch_edd();
     efi_arch_cpu();
 
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -131,7 +131,7 @@ static bool match_guid(const EFI_GUID *g
 
 static void efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable);
 static void efi_console_set_mode(void);
-static EFI_GRAPHICS_OUTPUT_PROTOCOL *efi_get_gop(void);
+static EFI_GRAPHICS_OUTPUT_PROTOCOL *efi_get_gop(EFI_HANDLE *gop_handle);
 static UINTN efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
                                UINTN cols, UINTN rows, UINTN depth);
 static void efi_tables(void);
@@ -747,7 +747,7 @@ static void __init efi_console_set_mode(
         StdOut->SetMode(StdOut, best);
 }
 
-static EFI_GRAPHICS_OUTPUT_PROTOCOL __init *efi_get_gop(void)
+static EFI_GRAPHICS_OUTPUT_PROTOCOL __init *efi_get_gop(EFI_HANDLE *gop_handle)
 {
     EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
@@ -772,7 +772,10 @@ static EFI_GRAPHICS_OUTPUT_PROTOCOL __in
             continue;
         status = gop->QueryMode(gop, gop->Mode->Mode, &info_size, &mode_info);
         if ( !EFI_ERROR(status) )
+        {
+            *gop_handle = handles[i];
             break;
+        }
     }
     if ( handles )
         efi_bs->FreePool(handles);
@@ -1219,6 +1222,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
     if ( use_cfg_file )
     {
         EFI_FILE_HANDLE dir_handle;
+        EFI_HANDLE gop_handle;
         UINTN depth, cols, rows, size;
 
         size = cols = rows = depth = 0;
@@ -1227,7 +1231,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
                                &cols, &rows) == EFI_SUCCESS )
             efi_arch_console_init(cols, rows);
 
-        gop = efi_get_gop();
+        gop = efi_get_gop(&gop_handle);
 
         /* Get the file system interface. */
         dir_handle = get_parent_handle(loaded_image, &file_name);
@@ -1364,12 +1368,15 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
         dir_handle->Close(dir_handle);
 
         if ( gop && !base_video )
+        {
             gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
+
+            efi_arch_edid(gop_handle);
+        }
     }
 
     efi_arch_edd();
 
-    /* XXX Collect EDID info. */
     efi_arch_cpu();
 
     efi_tables();
--- a/xen/include/efi/efiprot.h
+++ b/xen/include/efi/efiprot.h
@@ -724,5 +724,52 @@ struct _EFI_GRAPHICS_OUTPUT_PROTOCOL {
   EFI_GRAPHICS_OUTPUT_PROTOCOL_BLT         Blt;
   EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE        *Mode;
 };
+
+/*
+ * EFI EDID Discovered Protocol
+ * UEFI Specification Version 2.5 Section 11.9
+ */
+#define EFI_EDID_DISCOVERED_PROTOCOL_GUID \
+    { 0x1C0C34F6, 0xD380, 0x41FA, { 0xA0, 0x49, 0x8a, 0xD0, 0x6C, 0x1A, 0x66, 0xAA} }
+
+typedef struct _EFI_EDID_DISCOVERED_PROTOCOL {
+    UINT32   SizeOfEdid;
+    UINT8   *Edid;
+} EFI_EDID_DISCOVERED_PROTOCOL;
+
+/*
+ * EFI EDID Active Protocol
+ * UEFI Specification Version 2.5 Section 11.9
+ */
+#define EFI_EDID_ACTIVE_PROTOCOL_GUID \
+    { 0xBD8C1056, 0x9F36, 0x44EC, { 0x92, 0xA8, 0xA6, 0x33, 0x7F, 0x81, 0x79, 0x86} }
+
+typedef struct _EFI_EDID_ACTIVE_PROTOCOL {
+    UINT32   SizeOfEdid;
+    UINT8   *Edid;
+} EFI_EDID_ACTIVE_PROTOCOL;
+
+/*
+ * EFI EDID Override Protocol
+ * UEFI Specification Version 2.5 Section 11.9
+ */
+#define EFI_EDID_OVERRIDE_PROTOCOL_GUID \
+    { 0x48ECB431, 0xFB72, 0x45C0, { 0xA9, 0x22, 0xF4, 0x58, 0xFE, 0x04, 0x0B, 0xD5} }
+
+INTERFACE_DECL(_EFI_EDID_OVERRIDE_PROTOCOL);
+
+typedef
+EFI_STATUS
+(EFIAPI *EFI_EDID_OVERRIDE_PROTOCOL_GET_EDID) (
+  IN      struct _EFI_EDID_OVERRIDE_PROTOCOL   *This,
+  IN      EFI_HANDLE                           *ChildHandle,
+  OUT     UINT32                               *Attributes,
+  IN OUT  UINTN                                *EdidSize,
+  IN OUT  UINT8                               **Edid);
+
+typedef struct _EFI_EDID_OVERRIDE_PROTOCOL {
+    EFI_EDID_OVERRIDE_PROTOCOL_GET_EDID  GetEdid;
+} EFI_EDID_OVERRIDE_PROTOCOL;
+
 #endif
 


