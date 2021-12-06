Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617E546987E
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:19:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239065.414366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEpN-0006tY-Ud; Mon, 06 Dec 2021 14:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239065.414366; Mon, 06 Dec 2021 14:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEpN-0006r6-Qv; Mon, 06 Dec 2021 14:18:49 +0000
Received: by outflank-mailman (input) for mailman id 239065;
 Mon, 06 Dec 2021 14:18:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEpM-0004et-GJ
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:18:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d26117a-569f-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:18:47 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-d0_4mdOCNhGb3VwROfVe9g-1; Mon, 06 Dec 2021 15:18:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 14:18:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:18:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0040.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Mon, 6 Dec 2021 14:18:43 +0000
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
X-Inumbo-ID: 6d26117a-569f-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638800327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EUZmArQIIQmbBqFpDtIyWDFCexGoWWvsGI0iICXtIpk=;
	b=NEOoqzDVdLBcFShl3f3b86XclGBMqTVisffNRFPgJHDPxjBs6i1Q4yPdxwBN5SBZUagbBv
	DInkDNMqnnO5yTqw9CcRDjD69FLoSakPtJJQ3zd7Ih9TLsiPobrAOHME6DCfUcyJ/+DspS
	XiIGXsygN6sPR07myONRrlrwMmgD/yI=
X-MC-Unique: d0_4mdOCNhGb3VwROfVe9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m5ekcXEZMaAJPtHRN8ZmvFY1+ZSsJcDxTyOs4Vm0ukkrzPmxnXA5WViPw8sO992hPVS0bJ6m6ghSIg3J0tumDxO17M222No93K6ITJevNJwo+UW/jIWNusC/aiZpiX0AMsmMHtQfk5uqW8jfu7CyllXO3+fzugI+xWXFux7HGGY85Y1X04oB3R1CafS/PgTH86EZHBUZctyIsD3XvgI5TIHphqB/htkWcvFfToX4jO39ENgoPjbxyDWZlCpCQgkyR6EQmwMQ+l7aE/UEVwSiCP0X/S8wyAoPQ6P0d1V7HJJlYElW2fJ8/AN2RyuXdgC4OBssmoBAxwpNyPxWSIsvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUZmArQIIQmbBqFpDtIyWDFCexGoWWvsGI0iICXtIpk=;
 b=clqfn6WVdhoqMsRS01FC6buM0UkJb5Hj+ozOyQRFcy76k9p4agpYcFlLfylaEfdILU8skhVM6L2HMUaBgZx18o53gP63O4ym9OkdHCY2kG4UHWWhP1FKkKRtYGHQxo7X2c+Hbg7JVqUs634XBdF4Ni9Vp6EvzRQcpPhIBxv9CTLgKFasCNS67PaoulhH8t5+uOlRHEeYVjMBYrdiy5qR6pEl7OCjGa4Kwuk5zG3/Zx6d0uQyACpxIQOWTRuBWzbaQhiVycjV9rCfZhNZ7vPw28pU5GFHmgEhUzCOzLPrQ55AQ9RYn1OGS5dDzI1QjrJVwuyhTxXdAV7yB2Bi1lmhmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa60f944-5164-977c-94e1-8b81a57d1feb@suse.com>
Date: Mon, 6 Dec 2021 15:18:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v3 3/7] x86/EFI: retrieve EDID
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
In-Reply-To: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0040.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8080d6ca-4ac1-4a91-c166-08d9b8c34f67
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23337B4F54C6996C7126DBCAB36D9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2/if1WGU39mV9KB/HN+Rq7oGgjng2MyLWQs9czmiezqWDZo5pcEySYragH3zJHGt1DkYzc2loF2Uy6PX4Gxtvg6TJTOE9gog+atVztIPTTp6nwWQCd7VcFRKRTV6V97stGnFcwgfX3QJQrfW3F4iLN6CCWt9zKeke36M05XGvROK17emJUvQvzbzMkviRkLLodnvOUCMNY1BcavsV+Zg6gT/JntBqkXb6GaffBu0OhVq2JKUA4iUifGseELTGFBNEYp5Ac8ajrpYMpY76ujSSPQM9Z4qg7dtOSSD3nzElxTEmhmSbnxTq7bPOHxMXeBMBcqGziRgO9goSW9yRqjmWnnAB7G0OIYXsCQ4NqryIUkLcG/4D8tF/l1eOvqhsvIUNkzcsiEg0mIFQUl8qRf1XeVF8JO+Sv1NLLyNMdqeyJsdRfFHkU7mON1YJ/eXYsi2tGmO/HLS/G66YWo9rM7PeAS8Mn4caMquntx5y2O7qTbNzjp1Av4mn5uJtSgDLMgb8lG/AJnO7PqY+KQ1xzWgDm156vvYGCGA2albsfLX+0wzka6nV0WRTPzwwJ6Ba4lTACZ6jsTQYMpItWRuy8x5j5czgzReeH51xJeYnsJdHIR6SyO1WALwLDpfpWfKe6kYXt0PGONXtJwMy4QHTP6X0WUndY+RhcVzUBBIm0eQ7tG8Uj0YjjUSkG0beY8z7jSURGdSnpmf49cjhLQIi9pgmYWpl6aUlMCpemycCWzTmGCwtKW1dLhYeO4/yOmkrN4N/lKJZeM3m5PgW4XuV3Drqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(54906003)(316002)(16576012)(86362001)(31696002)(66476007)(66556008)(66946007)(5660300002)(2906002)(508600001)(8936002)(4326008)(8676002)(186003)(6486002)(2616005)(956004)(83380400001)(38100700002)(6916009)(26005)(36756003)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGwrZGRWK0V4Y1NCV0xBalpBMG1vcXF1bFZjNEdkZ0JpcnNkL2dKd21YK1BK?=
 =?utf-8?B?WVZnc3VuWDJpM0t4RTlYYUpjWitMSE16cW1YYjVERERpUFFTYnlGb2RyZFdp?=
 =?utf-8?B?Z3k0RE9oWk5wYUQ1c2VheStJdnJOL1Y3cTI3V2VlQVlrVGRVUG1SNnVmc0Jo?=
 =?utf-8?B?Y3R6L2xOUEpndVhYUjArd043bGY2amJjOUI5bUM3Vk56cXdvV1FHbDFGYUI1?=
 =?utf-8?B?MGtlMk5Fa0ovbzRyTGlKTFphVWhkUm93QTlwcWp5TWxVM1MrVmc0ckFjNUFo?=
 =?utf-8?B?ZHFWUmhyZXdyQzJSK1hDUEVlcGVLdUcwYmtLYkZNN0Y0NVdHVGJpY3YvRWZx?=
 =?utf-8?B?eW1WTzNTZ1NiaWxPTWRHZFpSWGFScVRwWk1qdHpDelNOR245TWxiQzVHQ2pk?=
 =?utf-8?B?b2NRdEtEb0kvNjBWQThKd2p4elBxRUFhTkRVTk1Ubm15Vzk5ZzI5aXVWbnZ2?=
 =?utf-8?B?eFNKVGVVSTBIWEZINkp3MG9jWUtkQzU4R1pUY1NBeEtwU0hJOSt6dHdCTHd5?=
 =?utf-8?B?TitwK1AwcWh5TjhEUUlpSWRnT1VEU0ZOQmxNSWVrU2dMYTlZK2VJMU1GVDhI?=
 =?utf-8?B?WTVZbjNpeDlKb2pqNWlDSkVCRFhoTm1IUnYycGgyRmFNdjl4WE9tVDJXWi9n?=
 =?utf-8?B?UnpwYXFWeFdlVm1lazFJeDR2WDNBbWFGRndZN3ByZ3RpeVhRcWJsdmt0bVNH?=
 =?utf-8?B?b3U4dnBYQWpSdFg5UUlhU3hnakV2a2ZyRkJMWHhDTXduOVhWcUM5R1B2NldX?=
 =?utf-8?B?Z2ZaYWNXb1hDdyt0alZYZy8rM0NiOFN3Z3ZSNmtzK1dxNHBabmlFK0ZjbG9h?=
 =?utf-8?B?ckI5ZUd1bTc4QlhPZXZibzFTZ1JiODBBZDNyMFhNZkh5Y2FjYXVhYnQyQ0dB?=
 =?utf-8?B?Nmw4d01LTjcxbkpWNmJkL3l1cFpXOHEyT2xNUzdHR1ovU29mU0taeW9qNWpr?=
 =?utf-8?B?dytiSUJ3Vk5MWFJnNm1CTEhKM21YdWtyOEI5MWRNSEFNMFVSK2lEQVVBVlRW?=
 =?utf-8?B?K2g4a1dzbElUOFQ0d1l5TWhMd3F6ZFJybmhjM0hDL3M5TDdMK3JaR3lxM2Q5?=
 =?utf-8?B?dmNRV1VWc3JnVGJnRVdzS0VUSTcrSjhGMkJScGdhbXpDbHZ6SHdaUUFYQTdP?=
 =?utf-8?B?RXpQUkxkeUFDWjNRekZIb1NHMzFSS0tWdlZZb1BoT1FKUThVQzg1WDZaNldV?=
 =?utf-8?B?aDVOTmd5QXFHTEJlaXpGV2dCeTRMeWpBMDZyN3FFT21rcUg0Qm1sdGVDWGJ0?=
 =?utf-8?B?RDBNZXpmTXhIa0d1djRRdEtTdTJpWkVMczVwYk8wTC9KZ2pNTWJDUHRaUjQ4?=
 =?utf-8?B?MzVLZllha2YrR3FhL053aUthL1R0Wm92QjVUanQwS0NuVDlscDNwT0daUVFN?=
 =?utf-8?B?QkZ6MWl5dEJyL3BrUFRSTFhSSUxWUGM5QlBoSnJuek1GRFV6blRNN0t3VTFw?=
 =?utf-8?B?Skp1VlJMcXBTNTJyR1RnNDM2S2lFVHdRbjNpMHVkR2x2aEhrM1lYK1lUUUhK?=
 =?utf-8?B?RzBRcnhhVElIRGtsVVg5a0ZwUC80dFZOL3JNdkpodE14QUE5TlkyWmNvaWlt?=
 =?utf-8?B?RUcrdEpwYi9HeXhkZ0x5KzMxT2JRaDJpT3dQY3V6NFVHUUtXTFpqWjFyS3ND?=
 =?utf-8?B?MGYwdnRoVTZid2lSdHdxWFpsTGZxZ3BHWmJFQVFjOVZ0VVg5cFJBYlM3RFUy?=
 =?utf-8?B?SXZ2bFYxSVQ3NGV1RDdhNnVyQkFSZnAvaXoyUUFDMURKWkEyTlJMaFhJQXo4?=
 =?utf-8?B?MnNoaGFPY0l1Z1E1dHE5LzRwUnhwVWQyalpvZTFEWDdRc2V2MHM4aVB1ZUhG?=
 =?utf-8?B?MVNtemREVnZzb1N5ektucDVUdWNiQXE3anM2cFhjTk1USjk5cGRRL1YrQkR5?=
 =?utf-8?B?NDc1UGZ6WVhoT1pyaWVNKzFjMldrN1NMMzBtclM1aHBkdUV6NjlRT2o5a2da?=
 =?utf-8?B?UEJpYWNpUnhPcTY3MUxnUytpVnFGeUM3VGt5QzZnNFpudWNiVkIwbWttVUps?=
 =?utf-8?B?c2VVSDBXSWwzZkZWVjZ5d09PQ05Da0IwdExkcDJib0FUekkySFhtRHpIVWpU?=
 =?utf-8?B?QTZuTVpLVGR0dWZHanJ4bUo3TjJNSi9HRDlHdURLekpvR3JIbERaN3Z6K2Vy?=
 =?utf-8?B?SDUrUUFzREpWU203bTNsSDlTR3N0NHFrY0ZEK1hWTi9QYWlFZTE1SXljZUhV?=
 =?utf-8?Q?9JHfACcxi4oL5AlfMLSf/VI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8080d6ca-4ac1-4a91-c166-08d9b8c34f67
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:18:44.1308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAcS2Zfq+1VztLiy0O2oaOz4xK+s022MuyrojzchNeS6+SMvnkNKcfeL8RJNO7eRRwv5VnGVcWeJkHGdigmKTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

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
@@ -478,6 +478,10 @@ static void __init efi_arch_edd(void)
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
@@ -1216,6 +1219,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
     if ( use_cfg_file )
     {
         EFI_FILE_HANDLE dir_handle;
+        EFI_HANDLE gop_handle;
         UINTN depth, cols, rows, size;
 
         size = cols = rows = depth = 0;
@@ -1224,7 +1228,7 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
                                &cols, &rows) == EFI_SUCCESS )
             efi_arch_console_init(cols, rows);
 
-        gop = efi_get_gop();
+        gop = efi_get_gop(&gop_handle);
 
         /* Get the file system interface. */
         dir_handle = get_parent_handle(loaded_image, &file_name);
@@ -1354,7 +1358,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
         dir_handle->Close(dir_handle);
 
         if ( gop && !base_video )
+        {
             gop_mode = efi_find_gop_mode(gop, cols, rows, depth);
+
+            efi_arch_edid(gop_handle);
+        }
     }
 
     /* Get the number of boot modules specified on the DT or an error (<0) */
@@ -1381,7 +1389,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SY
 
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
 


