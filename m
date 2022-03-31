Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD4E4ED736
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296843.505430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrNE-0005Ic-5s; Thu, 31 Mar 2022 09:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296843.505430; Thu, 31 Mar 2022 09:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrNE-0005Gc-2b; Thu, 31 Mar 2022 09:45:48 +0000
Received: by outflank-mailman (input) for mailman id 296843;
 Thu, 31 Mar 2022 09:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZrNB-0005Fx-TD
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:45:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55da7f19-b0d7-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 11:45:44 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25--BRcJu6zMqa_lHsaJYM9qQ-1; Thu, 31 Mar 2022 11:45:41 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB2828.eurprd04.prod.outlook.com (2603:10a6:3:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 09:45:38 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:45:38 +0000
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
X-Inumbo-ID: 55da7f19-b0d7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648719944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m25bQHGvRlZ6OFGo8TfnVKsBCikksi3mWW9OB5EgvG4=;
	b=IdtEel9lxtzZo3Tr3XuOr/kQ9jpt9d8SciuWJ8l9eytaqUV1bVLkx0Q8abI4+YOJxjsc/d
	fAp2nXPebAWmCJ19HzWVH9HFfPFax2Yl3hdtanLgnLq2bzWYBTrE1sLCWsEt0JmU0DkCoa
	OdO2Bl4MnrzVQGmQ/qJGJgMdzMY5UpU=
X-MC-Unique: -BRcJu6zMqa_lHsaJYM9qQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Otxb3qpVgo1DpQ8T9p/IMyIl3QEWoRQ41nbycsk/XjZKqteODX+7MiKiKijsTObT3h/Ir5+bHp6+lhx1Pkg+HAUm1be/dBHobkZ2Bk4zfXgvDrJYz1GCZWanq4wGg8eI0hKea7dSwdCucFMFxeobSFaOZLPLiSUODqCItmPayHcs3brtUzLnDxrnqA5fhyI6GXHCJR0DlOmnraiOK9rjvdExHksLDwl4nuRszzVpeMJ+wKsZjoB4yQu6UEyS1Jf8tyq4u0d4qnK3tnI6mVhRgqsA9RYsYD3YUBdUM1TzGDxQlQWpHDHyo4qAQBguCGSJiCdrPxPXdSXZlEHC+XqJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m25bQHGvRlZ6OFGo8TfnVKsBCikksi3mWW9OB5EgvG4=;
 b=bwSWXy4EPuTbO7Tysuv7vIPL7eSa+6oFiOrZ4S4FsV72g+tZRgp+JRr9k+0OOdGY3yazDcIw8Tgu7lQULslQ2lh7q/j2NCbXXxDWcShRV21fYFmDrkAMEtoGkJGkJFH+naa0vbRNvhEOmLGoVX+8LRzoyQW6ucHDkqtsPgvL5JiJ9nkuQ8Q4PC20TJ244s4awUxNcDaSyHyjPJ84vCGl9r8KwWEh1W4ukDG8Mm5ClVfSl8R2MopLwp5FOyUIqQhBjapxDJQ0etVsTlJtF11VYehF6tUWAsmAPvHVEBcasp2zitHuiYUXTzjy46+MljG63d7w7FevwClCWKn4RT38gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
Date: Thu, 31 Mar 2022 11:45:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 3/8] x86/EFI: retrieve EDID
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
In-Reply-To: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0033.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:8b::46) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b44cde77-0441-4ee7-db06-08da12fb3657
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2828:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2828AA74565E9CE18986D0B0B3E19@HE1PR0402MB2828.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EvMrlE7EOu69WZp2NY76Z7FrCpazd4T0hyEV7p8dPEDBE0weQ5Rpa9r7CscgtMGTLT79+y8qJGRVTuroNjzkY211zlRBT5ksciUM2BlspkJOPYBcQOI3ClTPCyinU5xQ24guKM6OqwUI1bh66Obx6TZfnUrz0q+RcZmB/0z6I95QItw+pLSEmuWQDfqGYb9p7VjKeM+zlBbo6BB9EsoetbXEhhKLujTNGFWgQVp+5JCIsZEgLHr7tQb+7oc+9gu+o9tUMtKFNxKax64QLnxMVLmoDQEof9Qz2kYf490PNe2Dv6tS8I4pNxW1RjPKt6BARIzmh2jEQTp26KtIlKNW7e7XkBbL2e1JDFeoojtPRMlp2kgF3tZcrC9T9M9Toqh3r4EuQGv6cUK251rhitXI88Gd5JRuoTfBvrvmo/36HPMJkh6+TvpEeltgC81KM1J2dq/iR10w78JmCmi5ll570fiM18dT0H2akI5CeXXFYwJcwOKFsi2OW6wabDbONaxyyhh3yV0Z8NC0lc92UUR7M1qLsDUpuNnvBc1kSaZSevCzKi7BZ0EwgGifKMFmeHw/FyMzWDAlT78eGi4rmTh5xgan4aawAmzWhyYrutf0qS8A2/AFEO+/VF74HaDeHYXmybQUR0ZEV77nyYIBZ41lyi85yGcWtcKWbsgTDgD50uDGuIxZjcCfvuRz9rHOmbgfmFLJGbPt5e5hBWqulJRgQXeOfbUJRb8iuHpRTKN0xi2enYsuOQRzpn0RtssWuYbuKLtDHjZIUeNKeqQkwUYcBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(8676002)(66946007)(86362001)(66556008)(4326008)(36756003)(6506007)(31686004)(2906002)(8936002)(66476007)(5660300002)(31696002)(54906003)(6916009)(508600001)(38100700002)(6486002)(186003)(6512007)(26005)(316002)(2616005)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NndLTG9mSmszSVRQQ05GWVcvNFkvK1g1SCtFMTVCVlVvaTByVGo5UDdQUGl2?=
 =?utf-8?B?YkNBbTlDQUs3VXU3N3liWW9scUdhR3g0YWhYa0NZWStuanYxTHRFWCtxdWVH?=
 =?utf-8?B?MXdoZDlBT1E0R0R5VTZWYVhsa2Q3TXR4d09rVTZiYTVsWEdxenhmWVNSYTRL?=
 =?utf-8?B?ck50ODBvU3dITWtkc0d0NERSaFR2NUNHL1lEMENCd1hKd3pWMHk4NnpQZ1pI?=
 =?utf-8?B?ZGhKOHl0Z3F4cTRRdGxWNFl5Qk1DTEVuRlVXMkd5NFpWa3MxYnNZbFFZam1l?=
 =?utf-8?B?MVVYeFZYbm14SVFkSnRnSDNuc09abkM3d3V5WU5LMzcxZzhreVhDOTBWWkt5?=
 =?utf-8?B?bHRnSElqZEtOUm16dURwdlUzdFZRVzBSTzMySWUwVUhTWUZvdUdLNUVoN1pE?=
 =?utf-8?B?T2NVZjhhU0pMTXV2dlYvWEtlZ3B3emQ5SW5aK05sZTh0cVozZWQrM2lxV3lN?=
 =?utf-8?B?dFVLRUlFWlQrb1l3U1o3c2kwL3pDSFlyME9GWkFJM05iSkg0TUdTWnZOVnhF?=
 =?utf-8?B?OU5kMzB6ZzdNMHIzRmJiL2sweUpmSFdIOWRoUERENDM2a2E3VFBLT1NxM3hF?=
 =?utf-8?B?MjlGZ1dLYWtROFY4SnFianowWjlxbjVLOGRxczhHSm83bERSVk9ubjdIcTFQ?=
 =?utf-8?B?eDNEY1MzTEhHRUFDaWh6L0V2VU9LTXk1Zys4ZkxJaCsvaFNoY3ltRGlDSnIw?=
 =?utf-8?B?VWRTeTVHNzd0UTFKK0JRQ2srdnRYZm1tUTdDT3Z6QmszWk5wNWhoUkhpZVRh?=
 =?utf-8?B?bnJ6RC9tN1NGV2lia0FDTjZhVHE1NjFhRVJ3MHVTbjB0TFNhQitoSW5GTDlI?=
 =?utf-8?B?K0RVQUxJMlpTV1JDMktaU2h0cEltTXowWUhjWWJRYm1mQVpMbmVRQ0ZkL1VD?=
 =?utf-8?B?a1RDVDNkM0JENEFhekFLNTRIeENXNkQvTHZ6alVNMWxMUDFFUnpDU3pEY254?=
 =?utf-8?B?S2xCOGF1bXJqVUN0NTYvUEdadnVrYWRqVElKL0Q3eHVsWThjTFY2cG9oNzhn?=
 =?utf-8?B?am0vVG9uZURYZmxuQnVmNkpFSGV5SWhOUktUdVdWZGJ4NCsrRzNnZktaK2Jx?=
 =?utf-8?B?UzEwUnFPRUtEc3RpOHFmZWdISHJpVTI5SWZVL0pRb1NsbXU2RUxER2xTZGJn?=
 =?utf-8?B?VFlkSnN1SW9iRURYN2lBTFJKNjRXRHBtY2NwMzFXTkVpelF2azBvcGdldmtU?=
 =?utf-8?B?b0dYYTdSd3J3em0xbnEvZDNaMFdSazQ3OWtJVUpGNVY1ZXFQUEQzRld4RTZr?=
 =?utf-8?B?SDNBKzZyZVVTblN3OEtyZ1BwWVRDN2t4MVlkbFNsVzhCbjAyNUZlczBhVG5z?=
 =?utf-8?B?Tm5EMmh4NkhNNFdSRHlwVGdDbGVkVW9UaThiK0dvdFEyN0NNaE5oSnVzZ1pD?=
 =?utf-8?B?QzFBbTdTSUZNL0ZKUER3amxLQnZNczBINDZ4cFdsd3BxSnNDVkl5S09iL3U2?=
 =?utf-8?B?YlBtYUYyYk1uTWJsWHdpcjdLMWFkanFqeFBhdU9kdllRRHlYQXpob1FqSjk3?=
 =?utf-8?B?K0VySzJSd3h4TmZ1cUl3T210dG0zeUV0S0dFSXFNTGtZT1VZU0YrN1U2bDdY?=
 =?utf-8?B?ODdESHBDbDhiTGRuLyszNVVhcjBpZldDdk9Dakg5UzhCRnZBdlVJa1RLY04x?=
 =?utf-8?B?eTVkM3dLRG83Mi8ydlNEWkVVQjlkMHA5eHNEdWpKa1F6cTZzZ1BqOTZRcHdN?=
 =?utf-8?B?SWs2by9sSjZRZnNOcDNxcVdaSlJpMk04TmRCcWhKcUFLdVJrTzdScEx6WGxh?=
 =?utf-8?B?R09DdDQvd3JNZGlJUE1jM1NHengxVmhBc0xqbmNMVkNlS1JqUld5RDNLN3VH?=
 =?utf-8?B?YnRMUncrV1kva0RDeDFSYTRjcCs5NysxeHRkemk0SWRkVEZCNk5VZkZTWDZP?=
 =?utf-8?B?amdvYTNSNXpkMVVZZW42akl6VFFYbXFMb0JzTG83aUJsNk4zZWRUNnova0VH?=
 =?utf-8?B?TjJmYVZjWmpscTRJTUozWGpETVJyL0ZpMUpYNE10eHdBSWo1bGlud3RDK0Rw?=
 =?utf-8?B?ZU5Wd0dZNW8wRVVyWG5TWXkrOVdGWWM2cHNVTTgwVkVybWJSQ05SOGlLaytq?=
 =?utf-8?B?Y2ZIYStMV3hKZWFtNEdJb0ExVi8yRTVwZlNjUlZVRFdVRVpmVDUzdWRCLzVV?=
 =?utf-8?B?aUJjS0dhK3Q4ZUtiVUpyUHlOLy8rNTBHSmtvL0ZnblpkNmFGRUdzWUVxQVlO?=
 =?utf-8?B?cUVWVlY4MC9IaFFVeVJzemxaVG1jOWFicTFVWXBiczlsL2VHb3B0MVgzUVpN?=
 =?utf-8?B?OGh4UU9kN0ZDdWFFWm1VblpwdVMyc2xUNDA0bTBDY2tuMG16RDFIcXN2MGNR?=
 =?utf-8?B?OVJmMHQrZDhhS2wzQkFwK25vZ0xXNXJXYkd0K1l3Z3pRNllaTjFtQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44cde77-0441-4ee7-db06-08da12fb3657
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:45:38.5571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2SiAJFyLNHtoHm4FE1+i7FtICm1KO/9nMAKqUb9h4NPnZGpulkggZFloi3TC1Kl8lHck7Av/SCPSxpvZgwtYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2828

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
v3: Re-base.
v2: New.

--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -464,6 +464,10 @@ static void __init efi_arch_edd(void)
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
@@ -118,7 +118,7 @@ static bool read_section(const EFI_LOADE
 
 static void efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable);
 static void efi_console_set_mode(void);
-static EFI_GRAPHICS_OUTPUT_PROTOCOL *efi_get_gop(void);
+static EFI_GRAPHICS_OUTPUT_PROTOCOL *efi_get_gop(EFI_HANDLE *gop_handle);
 static UINTN efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
                                UINTN cols, UINTN rows, UINTN depth);
 static void efi_tables(void);
@@ -758,7 +758,7 @@ static void __init efi_console_set_mode(
         StdOut->SetMode(StdOut, best);
 }
 
-static EFI_GRAPHICS_OUTPUT_PROTOCOL __init *efi_get_gop(void)
+static EFI_GRAPHICS_OUTPUT_PROTOCOL __init *efi_get_gop(EFI_HANDLE *gop_handle)
 {
     EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *mode_info;
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
@@ -783,7 +783,10 @@ static EFI_GRAPHICS_OUTPUT_PROTOCOL __in
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
@@ -1222,6 +1225,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
     if ( use_cfg_file )
     {
         EFI_FILE_HANDLE dir_handle;
+        EFI_HANDLE gop_handle;
         UINTN depth, cols, rows, size;
 
         size = cols = rows = depth = 0;
@@ -1230,7 +1234,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
                                &cols, &rows) == EFI_SUCCESS )
             efi_arch_console_init(cols, rows);
 
-        gop = efi_get_gop();
+        gop = efi_get_gop(&gop_handle);
 
         /* Get the file system interface. */
         dir_handle = get_parent_handle(loaded_image, &file_name);
@@ -1360,7 +1364,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
         dir_handle->Close(dir_handle);
 
         if ( gop && !base_video )
+        {
             gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
+
+            efi_arch_edid(gop_handle);
+        }
     }
 
     /* Get the number of boot modules specified on the DT or an error (<0) */
@@ -1387,7 +1395,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
 
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
 


