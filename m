Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645DE40C65B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187621.336559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUv6-0007vd-Dm; Wed, 15 Sep 2021 13:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187621.336559; Wed, 15 Sep 2021 13:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUv6-0007th-8l; Wed, 15 Sep 2021 13:25:48 +0000
Received: by outflank-mailman (input) for mailman id 187621;
 Wed, 15 Sep 2021 13:25:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQUv4-0007pg-OY
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:25:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6cafeef0-1628-11ec-b51b-12813bfff9fa;
 Wed, 15 Sep 2021 13:25:42 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-sU1tyMl4PJOKiOQMHaFUPA-1; Wed, 15 Sep 2021 15:25:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 13:25:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 13:25:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0033.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.17 via Frontend Transport; Wed, 15 Sep 2021 13:25:38 +0000
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
X-Inumbo-ID: 6cafeef0-1628-11ec-b51b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631712341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+iOZotKkLcJY4CXebIky0sg+x0ejVE7dgfMqo24AelE=;
	b=J9a0+HBBNNPrmOxXSj9j3e38VTLqJouLFY04BeZ7O0+aGjG45v+LhnbCyz1AlelJMs0Fk5
	zAERE4A1D/rOv2KHj50RNOx40ivA6TviMPb9+4auAD/aHo7bSq1VNMiL82HWAugEYKtihf
	UadfENeMURHD1/QL9Dt7nfpJFbU/P98=
X-MC-Unique: sU1tyMl4PJOKiOQMHaFUPA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjqLmfPJTlcT6Uq40v4YIkdeBsvCXYRr+SNip+0cff+Yj4E9YPoEuWcRjcyLTEEHHsE2l3vVO9Ryh8Nk+XZvyypp9WiJVvoPNyfdYQJDN821qic54FFrm2u+4JuEFMDrx9cLz4M5aIWe4eHNcpyPKotjYQlrV948BztXpv4Se4yGnfwL3YE80s+6AYd8UTPtfV6NLvu6l9R0itcwV/UvpMAUeLZSu2dmwqH8/z7Ru4b+34PpNFQkUG6XHba76THXbgwY6SA9qcYUvjJfeyVxH5NV9wXAFpDfaQvfZk01RCH1PA2U7ICDImb2muWAwfqE/cD/ZFVX+kCWhaAgJMkMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+iOZotKkLcJY4CXebIky0sg+x0ejVE7dgfMqo24AelE=;
 b=mzST7ToNYe6I/VK1pRGOzGsiePTHMT03Q24GTE4axPv3GuXJK8ZCT6Jho2kqArpQMTjw2okltFH3DXg1zEXwjjk628Mvq0+b5L1ht6kYtW6fVb8RdN2NxkzSFUOLbp1uIJYk20RczXclysW5/m+XNSUfJb2fZbgWP3rJKR8XWZj6/6eXsx2qKGg+xyfx4eCfkbL417vgUn17lDLJamH06cDtRhLHLvOtZrOz7z845rcqMucQSP19h5pbMrQgCku/GgClZGEzkKKkh4yRLCvQDCADaMdbTWq90Fcmxf70Y+INRcTGQluG6SKMuxAQwMghnLBjr2pj75jA6uHl+4FXGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 4/7] x86/boot: simplify mode_table
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Message-ID: <855ba31d-45f1-7d98-68be-bb2f7f7d6a8a@suse.com>
Date: Wed, 15 Sep 2021 15:25:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0033.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83b45e39-a3c6-44fb-f1a3-08d9784c4ecf
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43833143D8BE0967F5756460B3DB9@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OBwMWz9MYxasQAwJoxGRFgQgNkFWDlpWP/uqOGDeBWppJ56WFA/PPxjPDbfaZZL1Ot9WxU5Yfs/CbGcf1r60xJqLwsAuyfzBt95rCbzsHf0QGCtoSu7ELdQ0lBwcSXrbUvxFCzUvuRLdGTvRAIBwg+oIJboSPm2/+m62Xbgb5+oJat9FNnAM/JruoXYEkTy+GK7OHdJc3ol4ds2aseMr2WnpB/7c3aYAF0TNbLBycwkCr87bHOi60y5NKQMUeWDyaGvksz6SDYU2I8X6PdG2AZuIqdBCx0v3JCIbh/VqSeDBvvhmS4hwUcE6aYnUnBU+eKm9snLVQf+pWjdr8oJI+fHEd0yG/UBQ9t7EF8KNXqbPL/53/I3b0qeHP0oUoonc1/CudpG/3tkBqtYSWg6j05IZ3s/xuPjHab5dxqOlnEcKsBH3+sE3ApGahz/FfqktP+iy8HojppVPamq36s1W/bwA4J2ab7WaBdJLkYuvMUm11+/kuVkvBAg0c7xc/NJ8MqnbEZEmpTfh6Y8ara7UlQYoftWb5/7zSeLOP6pf1iGupFyOa21Bq45B3UN4A2hLiU5L4bJxpINGEeOi82C0ytXFc3onMLYMm2XQLoGgMcahS6z8WCCOkY4QnRJgAGPgOMgQtycvbrlS4VsATU+7sMn+sAJ0RqXaX7fAa1UNtczIpXkLr/dbudvgk+Y+EUnkpvSdm8klM6CDDMpVfG4GNQGv2yLdotkap8JCvikqZm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(39860400002)(376002)(346002)(396003)(31686004)(36756003)(38100700002)(54906003)(956004)(16576012)(86362001)(4326008)(2616005)(31696002)(2906002)(478600001)(316002)(186003)(5660300002)(26005)(8936002)(66946007)(6486002)(6916009)(66556008)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Skt5MHBYZUl2c3RsYmpKd1JXajdSNGtXNzNGZ0g0SUd1WTVqM1NucW5MNUFZ?=
 =?utf-8?B?NTVqSVRnS0thN3dGdU1Gc05IWXZHWmNKNjNMc3czbE1GMVZnQTVocWhWMHlo?=
 =?utf-8?B?c0tzV0lnNmh1anFOZVBmMWxsb2xBYWdNejlhbUw4L3pydkluMlJ3RFRRbUpC?=
 =?utf-8?B?bG94di9mTFUrK0N5V0RPR3FEb1E1NXVUZytXMTdPT1lEUlg3eVgrcmpSdExJ?=
 =?utf-8?B?RUEyd3RpdThkS3l6WDZJdzlPN3F1QjFONWpYVEJrY2NROGNIcG5PTnhRbVdN?=
 =?utf-8?B?S3RuQnVmWFBiTk9VbDlGaVY3eHlGU0RzVzA2WG5rYVp2SjI1ZmRQTG4wZEpw?=
 =?utf-8?B?NWV5WWFIWXRQZjVoZjB1NDVCNDk1OU95S3dzL3Q2VTFLQ2liWUpSajZFVlE3?=
 =?utf-8?B?c2F6dzBuMG5TWkJvb0RVT3FGeFBRNWl4UUtUQXpVd0ZULzlRcndBd1dIaWRQ?=
 =?utf-8?B?RDcvRDZ5bU8rakdIRWpLU2lxNmlCbmxxM0N4RGxmc0JOUUcxOTlNOURTTEU2?=
 =?utf-8?B?T1g5bXF3RmlGblU0MXpSNTd0R1RVSFp0VVcxZ0dqMFd5enE0SHNRU2tBbVRM?=
 =?utf-8?B?ak1JdTQ0OUxrZmpXWU84Q3VwWW42V0E4dHZiOXVzeVdJVVJoVDV1QzdsdHJD?=
 =?utf-8?B?MGZaOXRxMUpHeEJjVmhCVmtRM1IvZmhFU05VVjBxNG5uODF1eHpJSXphMmlJ?=
 =?utf-8?B?d1R4M1A4Y3JmbUN5ZDlnVFk4azRFWDN6Mzc5T3BRYlYxaW5TaEtLaXk2RGNY?=
 =?utf-8?B?TjY1dkszZTNiWEk0WUFVbmdtR2txZ1RhUlJKQUl6K002MVkwbmcxdnZMdFFO?=
 =?utf-8?B?bUdpWXFlWXZFVFI3MkxEazhaWXZVSTZBeWdVSTJhcDdNMUU0T21PdzlZTlRE?=
 =?utf-8?B?UXBqTTArV0VpMG4yVnFqWVkvV2FYcjlTaWNBa1JFVjJ2dkY0czJVbE9EOGxw?=
 =?utf-8?B?ZjlHNVl0bFJkeWJaZ1JObmhLWXkvUXBzR3FFUFFIRTk0SjZkbE5BOEkvZ3VX?=
 =?utf-8?B?by9xa29xYXBhd0ZaYlhvb3M5cHJhQkFaSFVmYmN6RVB3NjB6cmV0dzRmdzYy?=
 =?utf-8?B?eksvUnFnQ0V2TEtxRUNvUFZXd0NaUFhZQXd4d1BaSjVxK1l2R1ZYaTlYVzhF?=
 =?utf-8?B?cURkSFFnbzUzdjhYckYwZXVNRnY5djFwNElNQnQraGExamV6cW5BTjdTUjRq?=
 =?utf-8?B?V2R2UVBBcVlXbHFiVnVmR1QzT2pHUmF6cG5tRllIL2xmazM3SGVVYmYrQWNi?=
 =?utf-8?B?cUpiUktNQnRpaSt5VjBpUXltK244RlZWZExYU1ppRFFNRk5INndOUlJ3R2pm?=
 =?utf-8?B?V29WOWdIMzhaRDFXNWY5ZVBnQ0x1RUF2YS9XcUFWTGYrbTUwZXFLTHQ1bGhI?=
 =?utf-8?B?d0ExKytKazJIYzZiSTJVRFZEV2ZWVEhQY3lPZVpkbVMydEwxT3VPa2xleTVz?=
 =?utf-8?B?TXMwSHpaelJzVEVYSVJVem5SWDVoazRDK1ZCVTNSRmpLOXB2Z1owZ2J5NW9a?=
 =?utf-8?B?ZUgvYnk1UElIcG53OEVOTzhtL1l0ZERoeE5OYVBNaHBSSC9WUFlBTU5yNUV0?=
 =?utf-8?B?UFdXUk1pVDUyV2JpZHpmekFITEVFcE16Z2p1Wk5iNWNwTm5tYVRyNVhoaTlY?=
 =?utf-8?B?dnE1VXFPa1ZFVjVyTTFjV0Jhc1pmbElVdkZ0VlozR3ZCYk9Jc3l1TUFGYmdk?=
 =?utf-8?B?Y1NwQk05MWFxWFZybFRpczdIb2lSZ1M5NFBjczVjaUtRbHh4eWM0a2JnbHNz?=
 =?utf-8?Q?CRxk03tGnSfNkpu6K4HzrY+Pp/r1c5WiK4fEpgB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b45e39-a3c6-44fb-f1a3-08d9784c4ecf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 13:25:38.5493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEz26FYzzEFc8n3R0otP0Ke9u+Kbeq20Wt+drrsEH+JOMCQZyv58KrGrN0Si6WltoG/qScmJdFPpyMrT6u8JCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

There's no point in writing 80x25 text mode information via multiple
insns all storing immediate values. The data can simply be included
first thing in the vga_modes table, allowing the already present
REP MOVSB to take care of everything in one go.

While touching this also correct a related but stale comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -655,8 +655,9 @@ outidx: outb    %al, %dx
 # Build the table of video modes (stored after the setup.S code at the
 # `modelist' label. Each video mode record looks like:
 #        .word        MODE-ID             (our special mode ID (see above))
-#        .byte        rows                (number of rows)
-#        .byte        columns             (number of columns)
+#        .word        rows                (number of rows)
+#        .word        columns             (number of columns)
+#        .word        0                   (color depth; gfx modes only)
 # Returns address of the end of the table in DI, the end is marked
 # with a ASK_VGA ID.
 mode_table:
@@ -665,12 +666,6 @@ mode_table:
         jnz     mtab1
 
         leaw    modelist, %di           # Store standard modes:
-        movw    $VIDEO_80x25,(%di)      # The 80x25 mode (ALL)
-        movw    $0x50,2(%di)
-        movw    $0x19,4(%di)
-        movw    $0x00,6(%di)
-        addw    $8,%di
-
         leaw    bootsym(vga_modes), %si # All modes for std VGA
         movw    $vga_modes_end-vga_modes, %cx
         rep     movsb
@@ -684,6 +679,7 @@ ret0:   ret
 
 # Modes usable on all standard VGAs
 vga_modes:
+        .word   VIDEO_80x25, 0x50,0x19,0        # 80x25
         .word   VIDEO_80x50, 0x50,0x32,0        # 80x50
         .word   VIDEO_80x43, 0x50,0x2b,0        # 80x43
         .word   VIDEO_80x28, 0x50,0x1c,0        # 80x28


