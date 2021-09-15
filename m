Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1E40C656
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:24:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187598.336527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUtk-0006Bl-Bk; Wed, 15 Sep 2021 13:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187598.336527; Wed, 15 Sep 2021 13:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUtk-00068G-7k; Wed, 15 Sep 2021 13:24:24 +0000
Received: by outflank-mailman (input) for mailman id 187598;
 Wed, 15 Sep 2021 13:24:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQUti-000684-Fg
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:24:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a26eb15-bc4d-4ce0-9cc3-917bcdf9bc33;
 Wed, 15 Sep 2021 13:24:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-_7mfDszgOBmVqh1jW8B5GA-1; Wed, 15 Sep 2021 15:24:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4352.eurprd04.prod.outlook.com (2603:10a6:803:4a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Wed, 15 Sep
 2021 13:24:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 13:24:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0208.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 13:24:18 +0000
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
X-Inumbo-ID: 7a26eb15-bc4d-4ce0-9cc3-917bcdf9bc33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631712260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vmvh23AF/QYwECie+A4cxpmvY3OAqvVGprF/crpbyog=;
	b=DFrZWHNZtWLHQmtRtbEfKw+tHB3oXI0npL0gKD1OFwttXWyD6JyY7gNG6IZYlhKcppFj3c
	OvO9Eyh4Zpr8Ud1LYk71p2O3dBMYUoh0Bo4sSa3ejxwav6TMx6drNv7qR7bGI1r4c7f9jd
	DzOu1wVs5EgJEjPsiMM6oOiWt3A+Dqk=
X-MC-Unique: _7mfDszgOBmVqh1jW8B5GA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ih1x9nB/MQE09L7Z/FeVoxuOL969/1TEiGBcgGI2OWNqRZ9c4dGf/3UiIcLbms+tddWrio5VnVwFy65g58h481xcvfBgQcBHdConT6PbSH9rN8hrtp/sbLCTthw1lZdk36IDto8Bqfw71JAg+lnKFzff1fRgCQF+XZ2Qp+c5JzMa1ZGwh8VhFN26m4TCfbUlg5O/ic0ZakuGkeQ+2ChZLde0MofFtJEo+/CCybtVIjCg9wzC+E8RoMhKBPUws9g8204aOVdQEXb1g/LYBASEUe9gnVk/yI06YuglsuO6Y7fG5mR9kS+C8B2ZOdUc6uZGrE1OHUzK3aWpGI8VcJYdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=vmvh23AF/QYwECie+A4cxpmvY3OAqvVGprF/crpbyog=;
 b=fAD8aYqNM8+WWnZWDcW9ZCBnDgwjUcCpvwP9m2wCkxswEABZJWgLHaoh/UjCuRzbyaYg0/rDBFlAXIVK/Fak1+t1Npdkb62LsGbsfg9Gyb7TZoYQnc53/OUid8Qa9Ea2q3+GAHFKDyoKJKYLjGH7TGT6dqXK25DEAwmtZteWYZKkD5bcJlCF8XL5fxJwBd6IGTmJEuZOFnCtUfe6jnPjNMTkCZQZkBPlZam5mn/1fkN/W6LyxOJ8e4emdvT5R1/JKNteA9mcgrqo70gL0Z45amJg1pM8kllhe2oNyWPfDvRaL0lDChJFFkt3oJMOGjmelEhlemvoR/raJkt3w8c/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 1/7] x86/boot: make "vga=current" work with graphics modes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Message-ID: <126bf1d2-64dc-ba0d-8133-27f29c942b0b@suse.com>
Date: Wed, 15 Sep 2021 15:24:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0208.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6496a335-2fe3-4390-ebd3-08d9784c1f06
X-MS-TrafficTypeDiagnostic: VI1PR04MB4352:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB435273B9F400A83BEDC02BCEB3DB9@VI1PR04MB4352.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L7U4ZEBb903AOkmC2oHkfqAmh2jS2FaoxJPsRsnnxN4tKvPol1vmUm7LlZ+JGP9nA5SfBROBakKxU1dWxWnLrllx6t+gyjw36Cr2n2QGP8D2l9TT/o+8LjMV73Tqtd7cNbzxpsVhG/2mrjUQmnKlOWsbcqTjJ2EH5fp9py6qUMEEL75oaHk9GuSMYr3IEJlfL/13OXJR12RCLvraHS3xVbU4gf3I6sCB/zuhnVJZk8ZlPVj5DCZ9iUD0ZlnSEeAFo1TcPOYQI2KBt2dXzCZybYg+OIE3zARqKz7pVu7klefOyCqwNQ6xPnhdwHpzh38bSIVPIefWnVYB8ARFvXS0JCeTox6y9p/Ujgq2nNP6Y48VCDTaMnWiNzMmp5I5/FEB0EX7Ucm1Vxf+N/B4kRaWwxT3ctehVbas6lhdTZVQXbKyJw7kGLbntXxrrx2AUMhgFKZydviCIy+aJ+htvbXzb1t7tNipp9yrEMZveLdL9r2N+plTDK6bOCtJSfEbSWbz9fKTW+svHavNKb2JuS7iWMQXbniZnpQ9bOwKRsnu0OsZzPcxSXOlMYNHjItP1qEa35fLb1qph40CB8vvp1W4OMaaYxTfqiw3UoOfES/8XeXZd4hCd+kDpooP2Of8lUouU/8EnjdopUK5ehNDQAnf5qdD7+MW0Zqw3j6VFKZrHucRX46L1yEvrRH1nBMIVc3rhq1tERhyT/8HY68lBPhKD+MY1Hkexnt9bgso1CqS3c8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(366004)(396003)(376002)(31696002)(316002)(4326008)(16576012)(26005)(6486002)(38100700002)(8936002)(36756003)(956004)(66946007)(54906003)(66476007)(66556008)(5660300002)(2616005)(6916009)(8676002)(2906002)(186003)(86362001)(478600001)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUpYSlBYSXlMWGRXRUJGUjFJSjdZeEJJMERmNVhHL3BVUTVjWm02VGdEN21n?=
 =?utf-8?B?WFBqK201TXdLamtrOURyNVBaZVBwdXdTcXVpOWZXTzlPS3hEVCtSSWhJdE1h?=
 =?utf-8?B?Q0ErOTdtQ3FyTW0xK0J2RUc1dHJGRk5oYmI3ZDJlcHdNRFFUVmdnSG9zNktS?=
 =?utf-8?B?TDFrb0tkUTM0RmpWelZsQ3d3NDRIV05PaHhtOXMzeHpUdlVBWS9FSndyZTBS?=
 =?utf-8?B?aWFKRmlZNlRKYWFjeHdkV1NkZHNKdVZ3c0QzTHhYbWpFUWc2MFN1ZGZtcDJ2?=
 =?utf-8?B?SGdlWkEwQ1Yveks4TTc1a1Z3WTdDQUVDQ1JYSHRkMkFCdm5nMzJiVnBROWNy?=
 =?utf-8?B?TWFuMWN1UFpvc2lRMzN1c05Nb1Q3ZVowclZtdWNCRTU0ajAvVHhxb21UdDJi?=
 =?utf-8?B?WndxOS9hUUVldW9zczhDY0xwVTZ6TmM3dmE3U1ppUy9aNXZzK0RPSVZWTUxE?=
 =?utf-8?B?U1hwKzIvbEFSVFJOY3NOL0M5Q29DYk9lWElxSWxHNlkrbmg1MlFSQmVpbjl5?=
 =?utf-8?B?S2JESkJlVU0rdFBoT2FoU29UMnYxNDBtOUJpdlRhTERrQUVibEtRUm94bG5I?=
 =?utf-8?B?QnFhblBFUTAxcE92dXFjaUFJWWJpOStJcGVzUDg3eGh6d3oxeENqdHl0MXVi?=
 =?utf-8?B?cVBIbWpBdDF3dndzSzJXNUxmRFA5VXVnVG5iYzJkb3Q5TVZFcStsYmJYN2o3?=
 =?utf-8?B?dXVpM2ErSmdlajNUNTV3NWVYSkEyRm1CZlJRZndhZHpnRFFKTTNJaHd1c1Q1?=
 =?utf-8?B?SVk0ZVlWVlFMVTNYZk9Od2ZQWWdoK2JwN0xaaCtMZW5zd2FMaktkVDZpcGtC?=
 =?utf-8?B?UEM5QjFodjk5VnNVRUxSMXZhVXFTSTVGQVNBZnhCT0h6R2ZUVVdjVllUOEYz?=
 =?utf-8?B?R09iZlhwWTBLZWZYUkZCalhiN3RFNDdZQ09SajQ2clduL0pKcmF5bWd4dkhG?=
 =?utf-8?B?ZXptL2NHZmdocktNR09oZUJ2VUZCMys1elRPcWphZWJwT01QRlZlQTVrK2JC?=
 =?utf-8?B?VHlFSUNQUXpWM2U3a05IREFMMmtVVllKZ0VveGY1Ylk2LzFWTDdVSG41dmdQ?=
 =?utf-8?B?d2ZZSTJwN1dSOWhwMERuS3hDcC9KTFFOT1ZOQTFaWndZVjVURXZzQVZXOGxv?=
 =?utf-8?B?MjU0c2tEYnJjM2tsTlpoMk9IRmEza2h1OURIVmdkNm9uejdHemV0WTJlenNs?=
 =?utf-8?B?cFdpbUZUdURHcmZsUit5SE5TSFFBZXRIQytkRDNYeWVnMnd5WDJGd21SS04w?=
 =?utf-8?B?Q0RKSGlnTStGYjJLZUN6bHJkT0k0N2RTaU1JTDQ3Z3k1SHUvbHQrRW1ScmNn?=
 =?utf-8?B?K2ZZRVZJZlRVNjN6elo4MThjaHdIcTlnYkhBallHdnZ1Y1kvSzU4aGZ0VzZX?=
 =?utf-8?B?RC96NXpxVDZUQkFCZlVvb2dFQmZIYUYrcS8zZS9ha2hXNHdyRWEzZFdHM0U0?=
 =?utf-8?B?dm4xM0J5Y1FuSk1YTkVVZFdEVnlLcjlSdW9VSWVTRWxWWXNMaURlZnhZNjNU?=
 =?utf-8?B?TU9WN2d3cFd1Vmx6MmpKWVVhTWZXODZubWZiQzlrMTNDWllOSTlkV3l5R0dp?=
 =?utf-8?B?T1dEa3J1Nk5OOGhSSk16U0s2Y3lDT2ZEYzROd1RjNXEyN2dXVkFrTHJUdWVL?=
 =?utf-8?B?MmZXZ0FoOG4wQXlTTjlPVGE0cDg2Q29ibEh0azZLTHBMVmJYMElTLzlWb0kv?=
 =?utf-8?B?dmgzTExadXptd0ZCY1kwamVGUlFiOTB4bnFFNFBDNkpCclZvV2R6bGlXZFBa?=
 =?utf-8?Q?YYrzSaE8SYoQzAprelGnOSfJ/4RuzXQy3mVzHYc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6496a335-2fe3-4390-ebd3-08d9784c1f06
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 13:24:18.3870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YigxjAvzhojjwbvS7sTcgbNWWxCK6ftLBN7YUr7N1CEc2ofdEufzH6ka6A0Z8mnO2EvxKjnSw2QzIsf330ouiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4352

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
- I'd like to limit the amount of code added to the realmode trampoline.

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
---
v2: Use 0x9b instead of 0x99 for attributes check: I think the value
    used by check_vesa also wants to be converted, to match vesa2's.
    (Perhaps the value wants to become a #define, albeit before doing so
    I'd question the requirement of the mode being a color one.)

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
+        andb    $0x9b, %al
+        cmpb    $0x9b, %al
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


