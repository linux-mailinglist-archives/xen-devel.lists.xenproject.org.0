Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D71403A89
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 15:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182017.329414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxYP-0000Fp-Cc; Wed, 08 Sep 2021 13:23:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182017.329414; Wed, 08 Sep 2021 13:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNxYP-0000Ch-9R; Wed, 08 Sep 2021 13:23:53 +0000
Received: by outflank-mailman (input) for mailman id 182017;
 Wed, 08 Sep 2021 13:23:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNxYO-00007S-0O
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 13:23:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1861d1b7-16ed-4190-ae91-5a0a250ac00d;
 Wed, 08 Sep 2021 13:23:51 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-I29Mg1gZMG6aBADZ8qyFjg-1;
 Wed, 08 Sep 2021 15:23:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4350.eurprd04.prod.outlook.com (2603:10a6:803:3e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 13:23:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 13:23:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.4 via Frontend Transport; Wed, 8 Sep 2021 13:23:47 +0000
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
X-Inumbo-ID: 1861d1b7-16ed-4190-ae91-5a0a250ac00d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631107430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+iOZotKkLcJY4CXebIky0sg+x0ejVE7dgfMqo24AelE=;
	b=UgG38ulEC2trvHJ2tw1OqAo/VNWjSjeKDIv++qqAFuZpLEg48mnBUWQDsFeP57zkKIMsda
	2QFAN6xLmg/W48HecRHyPZEOh7entoK58R+Hb4ol6lsxlUjEhjXB4PgIsx2esXNJdsJNW1
	ec1EaDybCcAMV2fLJFiOPs3JAuu7fC8=
X-MC-Unique: I29Mg1gZMG6aBADZ8qyFjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBClx6+dHssJUsF+DMg4mZgZ5RgYHpSiSQuQtBJK5aayQtD5cK+iaBxaMMBVznBi9d39YM8aXqYkgewS1yk/4J2FUN7YlFwb9msoxARHp7cqcZuOqQ7xg9FUuYGQjusQpP8qsEQTUv3AoEuKNihoaJYiTTLywEMfeXkw76bkDDOEUyHEHZEzExMyxBwUaNlLyQTIg6h5puGitNfsFEfmD7eGE+xHf4To2UI5eo+Pj2um9OyiSPPij5PWs9FCQfccHAnr5dEk0WCZ9p/9YNAkqN33fPZOE/kNpziyL8cbwXJg1BzjEcChY875IX9fkczMqouzs6ANnaoYdGinSRi6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+iOZotKkLcJY4CXebIky0sg+x0ejVE7dgfMqo24AelE=;
 b=WBYGlDUPGe63F7i17EzUGyVBfTQXoFhDmoqlfhUwiMUq7FF9dxHSSNF1jRDLQXs9Cp7Igv69/y1BHeq/tlFUVifhp34+QbgMr7owlRPEHRoRqfNFAbysc7Qnt+xd0SRRqxg95Liw+BMINDVjxRG/4MRfnGypeb1Ud4QTFNJVVPgUiHL9nr9un13Qw0P0/zdSsRoeZ+PhJ4pdvO8cclXLJhYW2xpjixzQPZJk6BMrJGKPTmJN0jzxVHyUJGvVm5eC43MdVTpX1m/tPWUfiky6Sddss2N4wGWBjGlODXyRDOr6gzpYbPRODhRMB32yyJmUYKjWUtYtROyGv3jcUEJy4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/3] x86/boot: simplify mode_table
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20bf2b1c-9c4b-bf9e-bf57-d0ba18e6458c@suse.com>
Message-ID: <30f0c220-8d19-e8ff-1a8f-dc4e5db890bb@suse.com>
Date: Wed, 8 Sep 2021 15:23:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20bf2b1c-9c4b-bf9e-bf57-d0ba18e6458c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70c691f6-7e6b-44c1-c3d3-08d972cbe3f8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4350:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43507280AEAA842A0A3E12D0B3D49@VI1PR04MB4350.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x33esPvjYEUxqgnmH0K4KiUKgwC5rfIyeAdOahu3nN++PnhoyJ1mmOc+byF6xr2w4Ssx/JnfEhzSTwzWLGWY5BAyBIHvIXrmbJ8kCXsWycg4cRGHAwT9lZGeeZFeWned1deBJJDo1KJw2ODTQg8Z28fMNbXShGsEpQmt5IJqBmO3mPcbYx85LwasppbjlUTppoy9QjQM2SainYdIrH+hTCdwG4wXNM5gqzygSNopU/zUloDkc+oQRtgnV7SCANYuPxlLrWCwiJsVDx7UsU4gB99HWelLeoPRgXY9v0oiqeXVZwoHgCpm7OC9smHw8zW1PZCb90znDbxn0I6yRHFwgpqNulit17tiNOI6Rw5cMX++lG8bt3YTSj4KxRQKR4rrV3yvi2zwKw0ElaVzIiMfNqGe2kzpFOycby3tExhU7cI6Exnm11UXxulKID7QTnXzdJcAskvW1cdSAWtuYa7IR6J4ktAmTQ+MNf0mbk5V8wiDTY0vYVTWopWjvevnr0QhaFJX0o07cFFxTmSEu0yiXJpMKCUO6EIXVT8oxY6BhlUtWcoQFk47W5naSGumU5p5qOFsgHD0KKdYwFnhM7lv6Kwt8f/2p+GLWJbVpb0kFoLhjtFHKbyvmA/wOUDGH1MoPV7oNFHkEH2d+mafs9B6bHO63402Byb3PPohRelhnIVzyRceU+b4gFonjNbfSYGrTV5ziVm4+IuabNhLED03o0m/UwymGxxKhOIME/H//mg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(31686004)(66476007)(26005)(66946007)(54906003)(2616005)(8936002)(508600001)(6486002)(956004)(16576012)(316002)(2906002)(36756003)(5660300002)(31696002)(86362001)(8676002)(38100700002)(4326008)(186003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGk5QnBFT0c1TDFQbVZvQ1hoeHNsQXRScTAvT2JJSXN0andWaGJZR29QRFZj?=
 =?utf-8?B?LzdRTi8vbjk3KzdCZnJyMnNJbVlBTmRBcVROc0JqWVdOV1NSRXZvRVlubHZB?=
 =?utf-8?B?ekJLeFJDUWpYOWF0clducDkxRzhNWTU2UngyOGYvWldSY2p6bG5oN0x1QWw3?=
 =?utf-8?B?bU5TQlplU0JUelhxb0tIb0EvZGVaaGZKZ0R0SHVzbXhab1V1eDU4Z0FzZW5V?=
 =?utf-8?B?cVVuTTZ4dTJJV0VXbWdHUWVpSFAxK2lVUlU3YzhXaWZyWG5kYmpOeVR2Nndm?=
 =?utf-8?B?ZDZ6eFVRdTh4ZXRHMU5OajhLMFNkcDJqMWtiazFDTEcrV0pmZzlPQys4eTY2?=
 =?utf-8?B?dElqMC9KQjgwZHB3Nm0zWlk5L00xVDI0eUgrdnZ5UlFpT0FCcTZ2U1RLdmsx?=
 =?utf-8?B?bkh3QTd6K3lqZ09NMHNKK1dTNmZTbDRIa3RYNUp4RDhUcTlKQjFLQ05neFVz?=
 =?utf-8?B?Y2lwRkhZT3E3MWNhanVkTG1kMWtXZy9WZmEwVVJwdXorSUtGQkhsVlVEMHJH?=
 =?utf-8?B?eG8xVVV2Wmt3OWx4WS9BOG5kRyt0enlVbVlpSUIrd3c4YWpkN1NRMmUwZmw2?=
 =?utf-8?B?RmVyU084TmRvaFUvaElYVFRWM0FDaHk0STN2cHQ3enBBcFlIaVRhR1JmRzJw?=
 =?utf-8?B?SmdxWkQxZytDMmFaY25jUVMrQjdrck9ubjd6T1JvZmpMNUdPRVZydGNxNTZS?=
 =?utf-8?B?RG4rbitWeGF5T2JnZzUweTZnQW5pcUNJSjI3UTRRYzRtNGNwdUR1VUdVSGJp?=
 =?utf-8?B?YU1pNUFETlptZlpPUkVaTCtIdzZNMFpTM1UvNW9XbWZtZlFRUzdkWUM0dVVw?=
 =?utf-8?B?YWVLYlBmQmIwSllYVm1qeHJtZUNTWkpvbnYwS0dnWkFqZDgzbHRrL1doNlQ4?=
 =?utf-8?B?YjQzSEpCK2N4VEVHZzgzWjEzWWVNN0hhL3dZNkx3NitCQVpycVZkZWJzT3Z6?=
 =?utf-8?B?R1QxUjIwTWxLbXJDcE91cm1oS2NNV1hYMDVLQVFWUS9SeDB5MVAzNS92dURj?=
 =?utf-8?B?RmZVYlZyWGk0bWVGczRDdWdzblE1MEdIZUlMNWN1NzdLci95TDVmRExhbHdm?=
 =?utf-8?B?ODZ6S2NTRUMrQTUyeGdkN1FJaFYrbnMrbThQZ1Q4TVBXdmUwVHBuUHhCL09K?=
 =?utf-8?B?QVdvdTlFTlJUSXlUa1hJV1g2Slg4WDBiZUcwRUpJV09McHZJOHljbWN5dXFM?=
 =?utf-8?B?UC9pcXJkUmNsMXJQN2NXSERqUWo2Q1ZMWEx6TWNtVnRxVzNmUEhBak45eFcw?=
 =?utf-8?B?V0l6ZDZPelZlQ0R0MUo3d0JaVm45bjB5S05YRTQxS1dmdGNRN2VxU1BNYlRh?=
 =?utf-8?B?NG9JQngvLytsb2VtYXFLb2VDY1FoYTVDUnpYSGRvUjllOEVhK0V1TVB0ZFli?=
 =?utf-8?B?c0hCSGVFQmlkdVBDbmlPVjBxWnJCS000aUZVR0ZKOWQxV2Z5Sll0cTV2K1dM?=
 =?utf-8?B?bGNkRThXUmg3NkxhdFBxd0owdW5DckVNZ205Ujl0R1M4SnVwQ2RyUHd6RkJI?=
 =?utf-8?B?cDNLVmNsM0Y2dGhoaDFFZ0ozcUxZcUVOeEtDczVCKzdTTnRLbVJiUzlaSmVC?=
 =?utf-8?B?UzBHc3ZRMlB6SmhyVGZYU2EwSU12ZThTdTFJTlIyTnlmVzhxdlJCZHd0ZzVk?=
 =?utf-8?B?M1E2dWVuaXJkMHdzQ2ltdExnTWRtRENPZzZxbkxqL2N6QWZCOUVicjF2U3BR?=
 =?utf-8?B?dnR6cGhkcmdLMStuVFU2ZVJxMXd5MUhmRXpveUxmNDhNcFkveFFYNmJtTDlM?=
 =?utf-8?Q?RL0Zv52yxqjsFzLGyJ1/w7fsYouxuKU8SZeXzD0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c691f6-7e6b-44c1-c3d3-08d972cbe3f8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 13:23:47.9363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLZcz5k95xbQ0WQLZsq2UJp9gcZbkGZx/g8UVPoxo1p5yOuwFGmzK8//hSb5uoccjcWtW0p8DC+XCT1VPMjSWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4350

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


