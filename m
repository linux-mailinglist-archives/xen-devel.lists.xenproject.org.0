Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFA9403A87
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 15:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182011.329404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxY1-00087Q-0e; Wed, 08 Sep 2021 13:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182011.329404; Wed, 08 Sep 2021 13:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxY0-00085Z-Rs; Wed, 08 Sep 2021 13:23:28 +0000
Received: by outflank-mailman (input) for mailman id 182011;
 Wed, 08 Sep 2021 13:23:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNxXy-00085T-Lr
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 13:23:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f220a6dc-10a7-11ec-b152-12813bfff9fa;
 Wed, 08 Sep 2021 13:23:25 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-k5LQGFm3N8CDHAhoG7Mksw-1; Wed, 08 Sep 2021 15:23:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4350.eurprd04.prod.outlook.com (2603:10a6:803:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 13:23:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 13:23:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.8 via Frontend Transport; Wed, 8 Sep 2021 13:23:22 +0000
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
X-Inumbo-ID: f220a6dc-10a7-11ec-b152-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631107404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ce7dFYXhAhhqvbLlY4RJBNyNUGpZQ938LDFfj9KUbSw=;
	b=SlkQ5wwGEQBHUVdeQbox1I3K3lrHnow0UrdUWGY5+irl5Z1f5yFC7h3E5XgYl1WdpjjWNv
	5RVwNhHuvvPCesUmwNWWGF6Pp3r+8ec8O/QX/A9JnH+rUtXqI5uv4H1oXKLwzdkNw7eAwL
	8pTlAbSYV5C00ES/DbltK9y4oImjASE=
X-MC-Unique: k5LQGFm3N8CDHAhoG7Mksw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHyy9P5qsEeujhaNHiyaRkY+YNhmJ4Af0vq14OimSn9WyiVMFLrDvYLKMPDYNvXz9N4nqyRdUVSL3GUh3JXQW3WUHBqXENOBtYLtQhWqIN5pJ1DU9/xdItJS4mlscHcyV2IWdoszaUd1DRnjKWyUklbNQ7yS9c2hXoZq6N/QjGkZSqel9XlIoEMt14rvf9ZIIte36zYno0BUQyl4BdQr/rTrrLiqAHhfNj/nZP4nLpbQL67FH6WUsXcuH/nQ1kLDqNnQZBbJm31jczt0kTmXYkavrIXpd5LGn9azOzk3gz2ksngQ64pOkawuYsDUmkd0dCotl6i+VFyiq4qQ4xPVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ce7dFYXhAhhqvbLlY4RJBNyNUGpZQ938LDFfj9KUbSw=;
 b=DJJLNs97/ESU6hTYdrs8w5axNNnvKDleYCSlnJjA5awRfqJOHafhagqzyK3eFqze6xdXLTLWdzmWhp3YU7iJZGcpyjmc5Qy9ONEb7lmrSWtv0MOrJbD7p8yBqMH2ftyB+kxsOZL3sdAi4Y/I+cRLBCgUXCq85cQnPh3PU0PXHAVar4mzQyFChvlYQg1jsXVHL6TRoGbuvLh8Dauo446WjgY3V9dg/+ybrgAptnX+qZNIzoekPSbjKSLQp06HWNgdgAIt23+idMfnbZtWOVCu1QnX7yxky4Y7ueGiYa5Qnwqpvwiz2geFTdG1S425JSBuwGGQ8I3Js//CdbCamQ7hAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 1/3] x86/boot: make "vga=current" work with graphics modes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20bf2b1c-9c4b-bf9e-bf57-d0ba18e6458c@suse.com>
Message-ID: <0603984c-36aa-8964-630d-2afc632738d9@suse.com>
Date: Wed, 8 Sep 2021 15:23:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20bf2b1c-9c4b-bf9e-bf57-d0ba18e6458c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 868a2554-3579-476c-5edd-08d972cbd4b5
X-MS-TrafficTypeDiagnostic: VI1PR04MB4350:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43502A7C0A57417C85E587F3B3D49@VI1PR04MB4350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cHf4GGo4K157HRFscRfs080e9eun85zF1ynp3Sd+H5jGL/scIVROoEqOUZx7o/W709enSkHsHbhSccqmMJKWoyZMh4kWk1PMVdrA753IURDZtTB6yz3vCQinjmy8AMQU3QN1sdpYxCBsnjAvgj/2Ev7hsFCqw4RV6mevvrXhp+c1vLwP4qeIrVPvwHCBLgy86x4WZja8RqJS91g1G3jzU+X6tvcb+Lkq+rkyMn0EID73NW5ABj6MTYfiKN1QvWkcKS1yO6UktNUByj3wBqTh7Gi5PVeIGsRWf2szD8g5aW3t+uo4ZK/TeuvpEfISWOvJzS4682+VBsVGtneF9/zfUWShSTMtpoz86muDlu7e8cmAHYCb71T2uFlv8HYEoOWU4y789RMBf6GfR1uUoT38juXck6KuAfWv+v+XfZGWhL9RF85lRt426L1L5Aw52Zx6wx+Fc1x1uo28vMmW0XeMrtdtktcEhcsipcrUICTTvH009njjzhzQDri+po4cLfG7TzwuS1TVvZ3/mVS/Zr5Sqpaj6PY197tXTiCYTKvTWHP+pS9FQm4dxzjX1zIazjjXi9Ir0Sfiulz5DJoAfuHW+HWi3bqoc8lWOkZAiYIClj5a4atZdw6JfypERBhnR8XLDTvFGp/BkeoZerYnU/7RsRbhGw7tLaPkJgB5TDaGs9l4CiZoirH5GA17avpWPPGZ4SNUlBZf4/H7mPke+BuA3/zIIqg007/VQbuPGPe1swlJSKkGnCPw0SgxKGY0zGim
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(31686004)(66476007)(26005)(66946007)(54906003)(2616005)(8936002)(508600001)(6486002)(956004)(16576012)(316002)(2906002)(36756003)(5660300002)(6666004)(31696002)(86362001)(83380400001)(8676002)(38100700002)(4326008)(186003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmlpbDl1M1M4dE5FVlQ3VklCU1pUNnkxU1RHN09La0xKLzJnTUFNaXRXSmd2?=
 =?utf-8?B?QlcxNHNNekhyc2JlNEdCSnAxTU9pYmcwTHZYMnZyam1rRXQ0VVhSVGRvS1Jt?=
 =?utf-8?B?Q3VUNGFINDNuRlVuekNBelJzbHJyRjRacGVIVnBKckpxSzliOTZlelNuakw1?=
 =?utf-8?B?RW5RMnIzd2o2T2ZKTDFSVndSQ2U3NjFNSGs0UCtaZ3Azc3hxR3J2Sk9IeVhM?=
 =?utf-8?B?VVc5aGtEMkxKN1BVN3pJRXFzOUhCUEttc0laOGlNYVBIVW1zMCtDdnlyTW4w?=
 =?utf-8?B?ZFlvRVE1WkgzSVdSOWdieUNBQkg4VWVWSGdPTmRMZzRvS1FWS2dEM3JqL1hX?=
 =?utf-8?B?bGY3bVEyR2hlM3QrUEpWNXI3UzlodXAzbTFrUGtOQytBMjlqNlhxcmZadW1m?=
 =?utf-8?B?OG85VzFEcEo3RFFOSjJKWDQ3RkE3RG5rTkhhVWlZUlArOVVDYTBObnlXKzFp?=
 =?utf-8?B?d0JqWVpuU256OHZMWkVQbzY0bHl4cmZaalFwOXBxUDduZVNEOFNVc3NXc3VP?=
 =?utf-8?B?ZTFnRWs1QXkxSkJoYVpYTTZEMWtNREtVc1BpaTBjVjF1eVRkZnF2c0t0NVB1?=
 =?utf-8?B?Y1pSanFMUXpsTHBOaGlyNjROSFpYYWNGSDZUL2EzVXhwRHViYTBCSW9pcGtN?=
 =?utf-8?B?OUoxVUFPSDZZWU5uOUdVWW1lNnU2a1R6MkVGTWtQT0ZrVzNWMmxYSk9ybjNR?=
 =?utf-8?B?aS9jWG9aWkY5WlBmMExhcmtLak5JYlA3YWFiU0Y5aXNLY0hyK092SVoza2k4?=
 =?utf-8?B?eE9EeFN6ejY1bnJBZXFaOWphRHJSb1B6ZTR0NXJVTjNIMmVkMlFUdHdKRFJn?=
 =?utf-8?B?YmxVQkM3d0ZCSEMwYUdzMDBWaWFWbjVCMjR2REorejFpMW5QdVE2Tm1MMlNT?=
 =?utf-8?B?UTdqU3N2LzVHQkJyVkp6eVBnY0dmblRLNDdlWU9GN0lDQzhrSlZuaGVJMXRN?=
 =?utf-8?B?OXJ4dTJQazZ4WjJwalE4VzY4Zm5jSkIzSWkyaHgyNGJlZmF5RlM4K2ZWSSsr?=
 =?utf-8?B?K3lTdDZhYUNYelZoU2FMYkhWWkpreUFkVGo0ZUVFSVhSQ01WaFl2TkZTYjBa?=
 =?utf-8?B?T3VjZ0JvRmV2aTdlbHFkUndzeStOYUlxSjEvUXNNR0pjU2NsMHFBTDhxcXpr?=
 =?utf-8?B?L010Ukc1T1g2RTV5K0lrdks2R0hMNzJTejZUN3pMRjBWdDRVeTlHNW1vMVdG?=
 =?utf-8?B?MmRjNEp3S1RSZG16alZoYTl1MTVyZVRsN3c1VEJTL2IvakVXSXVkb214eXMz?=
 =?utf-8?B?SjZOeURibUIrc1hDc2RZanhHSE1QOEZaaDZOSlJwSDU2SGdqcE82QTd3cXRt?=
 =?utf-8?B?ajNtMGVYUnUyMm53T3h4bm05Skg1a0ttdWFJWGpuWk9scnV5YzJFVGhKZGhX?=
 =?utf-8?B?ZE5ZcVc3OUhFaXBCUW85dUl5OHVLdm03NmxWS25IV2RidG5xZjNMeGNRV0Ux?=
 =?utf-8?B?eERnaW1GMWNWdjM0aElTZ3I4c2dmTVRPMllWZ3QxS3EzNUJtWEZYaFVrTHFO?=
 =?utf-8?B?SDc5TDVxSmNnQ0hNL1Bsa3c3b2xnb2lEZGdUY1oxM1lZV1c5Z08xczA0VEt4?=
 =?utf-8?B?bWxVMXcxTkgvYlhzNFFWejJDb2VDdjVzaVhLaURsN3NuQ20vd0FUMTdTTzZv?=
 =?utf-8?B?cGh0TmxFenlXcjBCS0FKdTh3UUJWeGlhYUJqWUMyZXZ4Rkl0RVZ5Tk9nMzNR?=
 =?utf-8?B?SkN3YmxhU3RrSCtMeXN3Vk1tN01Yb0FOZitPeXpXZWZueFFWZmFiTWovRDdP?=
 =?utf-8?Q?Jp2Jg8+6kUlNLqPqp/U/cdZvwg/SrmuW0ypaQGq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 868a2554-3579-476c-5edd-08d972cbd4b5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 13:23:22.3278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smT9nnczqjjekncBFjwGgTqKsUngducdjmoTPiITfSDOqhSg5B2dOgJX5qpC1zC3Y86QyJHHoY3wiWlxfhPzVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350

GrUB2 can be told to leave the screen in the graphics mode it has been
using (or any other one), via "set gfxpayload=keep" (or suitable
variants thereof). In this case we can avoid doing another mode switch
ourselves. This in particular avoids possibly setting the screen to a
less desirable mode: On one of my test systems the set of modes
reported available by the VESA BIOS depends on whether the interposed
KVM switch has that machine set as the active one. If it's not active,
only modes up to 1024x768 get reported, while when active 1280x1024
modes are also included. For things to always work with an explicitly
specified mode (via the "vga=" option), that mode therefore needs be a
1024x768 one.

For some reason this only works for me with "multiboot2" (and
"module2"); "multiboot" (and "module") still forces the screen into text
mode, despite my reading of the sources suggesting otherwise.

For starters I'm limiting this to graphics modes; I do think this ought
to also work for text modes, but
- I can't tell whether GrUB2 can set any text mode other than 80x25
  (I've only found plain "text" to be valid as a "gfxpayload" setting),
- I'm uncertain whether supporting that is worth it, since I'm uncertain
  how many people would be running their systems/screens in text mode,
- we're pretty close to needing a 4th trampoline page, so I'd like to
  limit the amount of added code.

For starters I'm also limiting mode information retrieval to raw BIOS
accesses. This will allow things to work (in principle) also with other
boot environments where a graphics mode can be left in place. The
downside is that this then still is dependent upon switching back to
real mode, so retrieving the needed information from multiboot info is
likely going to be desirable down the road.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not convinced boot_vid_mode really needs setting here; I'm doing so
mainly because setvesabysize also does.

--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -575,7 +575,6 @@ set14:  movw    $0x1111, %ax
         movb    $0x01, %ah              # Define cursor scan lines 11-12
         movw    $0x0b0c, %cx
         int     $0x10
-set_current:
         stc
         ret
 
@@ -693,6 +692,39 @@ vga_modes:
         .word   VIDEO_80x60, 0x50,0x3c,0        # 80x60
 vga_modes_end:
 
+# If the current mode is a VESA graphics one, obtain its parameters.
+set_current:
+        leaw    vesa_glob_info, %di
+        movw    $0x4f00, %ax
+        int     $0x10
+        cmpw    $0x004f, %ax
+        jne     .Lsetc_done
+
+        movw    $0x4f03, %ax
+        int     $0x10
+        cmpw    $0x004f, %ax
+        jne     .Lsetc_done
+
+        leaw    vesa_mode_info, %di     # Get mode information structure
+        movw    %bx, %cx
+        movw    $0x4f01, %ax
+        int     $0x10
+        cmpw    $0x004f, %ax
+        jne     .Lsetc_done
+
+        movb    (%di), %al              # Check mode attributes
+        andb    $0x99, %al
+        cmpb    $0x99, %al
+        jne     .Lsetc_done             # Doh! No linear frame buffer
+
+        movb    $1, bootsym(graphic_mode)
+        movw    %bx, bootsym(boot_vid_mode)
+        movw    %bx, bootsym(video_mode)
+
+.Lsetc_done:
+        stc
+        ret
+
 # Detect VESA modes.
 vesa_modes:
         movw    %di, %bp                # BP=original mode table end


