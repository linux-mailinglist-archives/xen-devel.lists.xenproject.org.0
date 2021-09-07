Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65164026EE
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 12:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180800.327613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY5p-0008Ms-TO; Tue, 07 Sep 2021 10:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180800.327613; Tue, 07 Sep 2021 10:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNY5p-0008K3-Q7; Tue, 07 Sep 2021 10:12:41 +0000
Received: by outflank-mailman (input) for mailman id 180800;
 Tue, 07 Sep 2021 10:12:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNY5o-0008Jt-3Z
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 10:12:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20fda39a-0fc4-11ec-b0e1-12813bfff9fa;
 Tue, 07 Sep 2021 10:12:39 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2051.outbound.protection.outlook.com [104.47.6.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32--O8Ql131P1-FXDx8m-4q6A-1; Tue, 07 Sep 2021 12:12:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 10:12:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 10:12:33 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0016.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 10:12:33 +0000
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
X-Inumbo-ID: 20fda39a-0fc4-11ec-b0e1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631009558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NoqsE6RzeJ63b2XMCTslouLkpUVTdP62+7GdGZP4LU0=;
	b=i3CHbROn0nt1byhiqZugM7lG3rh7L2nDA/NFS7+5A1HuvYTBClaMvaAd+eKj9yx6sMO1wn
	qWIhKx7rqORLqf+Evvgm5EGS1Q3DaxzS8xhHePMR+JfuQOrNkr5+N1zY481k2/RQThZiUb
	pJ3MtXavHgUfjvoVxJAI1Fe9/81r+HY=
X-MC-Unique: -O8Ql131P1-FXDx8m-4q6A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnMaN/3OzsXcZ3gXFpzLWzvagDaAfbNrTLv5rFJH+hLkrJJjjTQzG4yzs65RgVJUs0Kw8ZpDQkFKsf0y1Vej/7fcgXASh0HgxKWMOh0dF0kx3MyW2C72peug4iX1OJTNoH3d11gHh899NlWXzmDJm4O2aibvvc27dnTNRYfBhI0sYArEEmT+UgOsbY6+IObrrGuTuQFLrYf55n9kr5L+/P++lSxmrxdMYcfuY99z0O/iXUpDRIQCUHZUsbPLe5Vmkim61pWAeqMRiPFJ+R9dZzXu4VJwFdp490rzp0GmwXpszSskNweay3xsXYuPsIWio28a/6MdnzwY7C2BX4JE5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NoqsE6RzeJ63b2XMCTslouLkpUVTdP62+7GdGZP4LU0=;
 b=kge3izk4Fd0bUQuG8G+Snz+9pyivcl9ZW/sw4nSkHSnmV88faIA2+UglbW2bhYyrNQIvQ77m1b39Gckw1myUAZAk68xNRT+7ge/TRVeN8WUYOsL4PrMp9wzzM2bhA1VYQV6t055HNu8YwKv5jQSdMtxUZBnZ9Zdm5mUJgzziC7WdanslfaG5JGoPNoU3WEW04T7nEQmBXChqlxAUSuvHd0CsfO3DWhlw/UdDu2ffORiLfpJKKmW4coqxiCh0NV4+IrPnihyMTYvYeiI87zcG9K9/7u2IdrY32k2k94Z9xyyfe9UgmLDa1egWNyu/x6i0pACDjz/dipv7QLZ/WEBlJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 8/9] x86/PVH: adjust function/data placement
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Message-ID: <cf3fd833-0379-aba5-421d-7f2588d2d881@suse.com>
Date: Tue, 7 Sep 2021 12:12:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0016.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68249380-d5a4-4ca9-8f0e-08d971e8026e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27031AB253D6EB13DD2CA58BB3D39@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fG3g44J0l6hwlac5jI3G0mfTy/DXJoU+bFuTnoRWmaEf0fUH+NouvKFRCJqleNM3Yb3gjMsn/BozIZAbIZK/3cLVsMMewJC4KlWCjIXWX6IYo7xbUgU7yj9Z7AQFEhtlG3bmJUsr0aLhLj3BK913X/AnehzXCPL50ADvGhxuJCGFj9wj2UJcaMy7ToverXo3VP/SXjRwYjAn4gwFjvo6hrKEu6e4IP3XkRahrn/hzlUSaSf2DhNK2N0hL3FnMHXTQ0WqZ3/yUQES+MY7d9+ymH/rB0fhenJMEeiUnUWKnyt7k34hhJa7W60qg1sWDeiOY40GiktubBvGPNtJjzXR+EkDzeHQFsEuxE3NQxfKkFApH2F/ji2XjnRrzn7PJJl8kAA8qSvpi9gtbfZiFNzz38tYNfBUUG4hhB+7281pXeztqvnPAxe2B7PpYqfy8rLJAgf9I2N3KsjN98u33Aw7mgnLgAnZ1nvHs0P274ITf5K+lc+EGFTMZwIlkUJTVGmueHy5tkAtxibFWUEVYSqnIy4lztJyYnW4QLmufrh1B8n3rVSXI67DBW8ucjrkGvncANLYqpfIh0jZleiD4XotAGmph46ZUGqdgwfMZhlmaaCMW1I50HPPA+p1JgOS7TpdgaMnzYy5SrgV2iU0QrKafPx/P+t95+UBIrnGb1lKJnADd5dEFoXY776y4Xk+yPODEIBtYoQ7ws9EhuuzBp2356BXRhIsdsHtQ1SmdFa2BxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(39860400002)(366004)(376002)(136003)(4326008)(186003)(86362001)(316002)(16576012)(8936002)(31696002)(478600001)(8676002)(36756003)(2616005)(956004)(31686004)(38100700002)(2906002)(26005)(66476007)(54906003)(66556008)(6486002)(5660300002)(110136005)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXRxamZQT3A4WnRGMkRhVDlQYVlqVjFIdjNZUmVXMlQzTFdwRHBIOU5saGJW?=
 =?utf-8?B?cHprTnNybEVhRXFyY21PVXZOd3duRmJGTDJiUFQvLzErSzFiZ2d0VUJsRUNh?=
 =?utf-8?B?eGJNaDgrTkpDdnFaMlhBRmNwcVI1aXhCbWJTZlJPNzJRVWt2REl3QkVIK1BX?=
 =?utf-8?B?SWZPYTl5RUdlWW43TTlHL3Z6Mm5BYWphVVRkMkNsNDJWRmNKZXlWNDNPZGI5?=
 =?utf-8?B?TGl6dHcwV3ErSm93NDc5cjhQYzZPTklpSWdaeDBOUWZua2FSRlVGdUFCaHla?=
 =?utf-8?B?aG4zMGxmV2VSalpWOVRzQ013VDZMd0cyVXJHRERFejJ4L1U4Lyt6eitRTUcv?=
 =?utf-8?B?Wk9HZnBnZ1ZuaUlDUm0yNGJSMFZBNDhNQUtxN3RVTHh5RWlRZWxxTXVRdXFX?=
 =?utf-8?B?bWYyektmYWhXc3JQNE00TVQ5MjFpdzJiampaeERHM1krcUtKRVl0RlphTng1?=
 =?utf-8?B?OWtHRW5CYW0ySWJNRHBHVUZIZ21DcXNUV01ZaG1HTWFma0x5NHkrNWpuemJR?=
 =?utf-8?B?ZU13S2E5SDNSWTYwckVXdkNVaFd6MjJaUkQ0anp1UEFOQ0VzbVkvcjhMSjBp?=
 =?utf-8?B?VjlmaEFLb2s2V1dyQWs4cGFmcm5HdHJpb1hRL1hOcm1BWHBKMVZ5azRmemlU?=
 =?utf-8?B?NVd1SU5MVkpnbGl6VTFSMmRCQWFMb3RBZlY0TVkrd0lRSlFxSUl3USs2bndl?=
 =?utf-8?B?SlZ2U0VqMXNaS05CUFlrbnNtOTZUSXprb1pMbmdRNzVtMmhHZk5neS9HTFI0?=
 =?utf-8?B?U1N4QlhhTk1KT0pOb1ZqVVRWb0NBODdxZUdOelA4eG5jWXVXZ0pxWGNpSTdW?=
 =?utf-8?B?RWhrY1V6UlU1angxZWZJNmFNdU9zTmpldjZnSzRVcW14N1hiV2ZWZ3phVWhm?=
 =?utf-8?B?cEpScVo0M0Z4R01xTGxSS2t2eldJTC9Pb3ZrZGk0Wm8xbFQveko3Zk1Qb25L?=
 =?utf-8?B?dEs0SXJSODdQUWRES0VpcVdGQ2ZsU0tuT2FqaTQ3T3Bhb2NpTzZPTm02Ky83?=
 =?utf-8?B?TDB2eHppT1JzZGJ2eHM1YUJmTHplK0RudGIxdnNsWVAzc3Y3c1dleFYwOCtD?=
 =?utf-8?B?RFdoNk5pQkY1c2FjanRmY2VJUzUrbmpPdWVaeXlnTjd0aDQrNXUyWnFMOFhG?=
 =?utf-8?B?anpaYk9aRVhtaE80T3NUUnEybVVzYTFzMUFwSjJ5Y3MxZ1VDK0xvSktDcjZl?=
 =?utf-8?B?RnEyU1d1KzdvUWhRekx5d1RPRW13R25UMTZiOVR4RVNxRWxNUmFHaHg5MXlJ?=
 =?utf-8?B?cXRDOUs1cXBPMy9LWFE5RjluWWs0V0NwbnpSTFBGbVRadnFBV0k2YWVQS3dS?=
 =?utf-8?B?V2FESmMxMU9FSlBCTmdGODYwbkpia0c5MHdjWkRjeFZlYjdnZHZ5bVlBYjlx?=
 =?utf-8?B?aWdKaVkvbG1SYmJheTZxeTZWNUgzdVRrOHpXSzlXZ1hXMHVPK2tzYzBxRmcr?=
 =?utf-8?B?d09uYXdqamZQRXVOZmFIL0JiZTJkanZVTzhsWkVEZlh4VVladkY2MzlybFhW?=
 =?utf-8?B?bXhRd05pSUNxeEtnRjZzVVY2Y21jZDJ3aUUrVzN5OFY5bkFSMjU1Lzh3S2h6?=
 =?utf-8?B?NS90dUEzUkZPT0lRVGhXb3pqeHpHYk8xdGdMbEo3R3RlU2gzSGtnUmZIOFZC?=
 =?utf-8?B?cjVJNURqWEcvNGRISWlNTHFLVzFvQWVEdUtsZGR2VjFDUjRyVy9IZEx0RjNQ?=
 =?utf-8?B?aUVRSEo4by9uUjJObFpwRzYzUUlycXJHSjU3czMweWM1ZWhOS2VTc1ExRGZw?=
 =?utf-8?Q?+y4oKiIhmNMgYHsIJNYXUUj34aPo4GubsUT43LK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68249380-d5a4-4ca9-8f0e-08d971e8026e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 10:12:33.8016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYL9YPnNvYfATx1Ct6kT41TdXHkvilXZ+D11gSzDaxvwQ2EmUjX48GJ5ylrJcqA/67UTDyKYc5b+KiXV+Fy+/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

Two of the variables can live in .init.data, allowing the open-coded
placing in .data to go away. Another "variable" is used to communicate a
size value only to very early assembly code, which hence can be both
const and live in .init.*. Additionally two functions were lacking
__init annotations.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -16,15 +16,15 @@
 /*
  * PVH variables.
  *
- * pvh_bootparams and pvh_start_info need to live in the data segment since
+ * pvh_bootparams and pvh_start_info need to live in a data segment since
  * they are used after startup_{32|64}, which clear .bss, are invoked.
  */
-struct boot_params pvh_bootparams __section(".data");
-struct hvm_start_info pvh_start_info __section(".data");
+struct boot_params __initdata pvh_bootparams;
+struct hvm_start_info __initdata pvh_start_info;
 
-unsigned int pvh_start_info_sz = sizeof(pvh_start_info);
+const unsigned int __initconst pvh_start_info_sz = sizeof(pvh_start_info);
 
-static u64 pvh_get_root_pointer(void)
+static u64 __init pvh_get_root_pointer(void)
 {
 	return pvh_start_info.rsdp_paddr;
 }
@@ -107,7 +107,7 @@ void __init __weak xen_pvh_init(struct b
 	BUG();
 }
 
-static void hypervisor_specific_init(bool xen_guest)
+static void __init hypervisor_specific_init(bool xen_guest)
 {
 	if (xen_guest)
 		xen_pvh_init(&pvh_bootparams);


