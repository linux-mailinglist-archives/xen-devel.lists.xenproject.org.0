Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09C346987F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:19:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239068.414378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEpi-0007Pf-D5; Mon, 06 Dec 2021 14:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239068.414378; Mon, 06 Dec 2021 14:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEpi-0007Mr-9G; Mon, 06 Dec 2021 14:19:10 +0000
Received: by outflank-mailman (input) for mailman id 239068;
 Mon, 06 Dec 2021 14:19:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEpg-0004et-9t
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:19:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79240bcd-569f-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:19:07 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-1-QjLZ0HWqOW6ixsfJSOfAYw-1; Mon, 06 Dec 2021 15:19:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 14:19:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:19:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0068.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Mon, 6 Dec 2021 14:19:04 +0000
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
X-Inumbo-ID: 79240bcd-569f-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638800347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+iOZotKkLcJY4CXebIky0sg+x0ejVE7dgfMqo24AelE=;
	b=kJFFmyp1d0jPmdqiqV5MGZn6gpiukgIaRfqSwyojnh/qBa7NjlWJWh3rtlmIiK8LTONLEr
	+ZHWokoMIo6gdOWBsa6Fr/xl+UWgLJFjGSWOQ1isIsX64pg6PNZKt/Loc0HiBZckxbSsUx
	0elHbl7SjyZYMy1lks5eTfi4erKRgRU=
X-MC-Unique: QjLZ0HWqOW6ixsfJSOfAYw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TndpcjUim0B/L9qCrAJ48B8VadykP/+F0CNnzTy1YS4zh5TVaVEejxDKtjog6Mh6DiCUt86Qkqhyw1kPH08M81adXeTHbVdKGzEBZxpgoYzcOMF7lo7S1WxP7MxnDfTtLr2qdTs6ZU7dSwfoEB9I7mnzlxdt7m8zhdFMa2hRTiBgrRwb5BrEjs39dupf+57sll4JMQ4FEL0/ulD+iQePA7FYJ0hKuOgV0E7VvFCLTuKxwNagQHC51QVTlZoW1O3GtRtKTna7dr6D6bd5BD9YvagJdcaUgbxqgKrp9U9LNd+6wWyrssqhEEdJT4tJ+1/VbjzhzGDnoGNrQUxlSI74Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iOZotKkLcJY4CXebIky0sg+x0ejVE7dgfMqo24AelE=;
 b=hH6d3D2rVc9iMKqj3WBlFQB5e96X8BvlK0GE+XgVXaBSXKTuIRbcSVWXVh64USv8gF0g3OxLFJXXvZ3EZaCIYBQyUhnQyf9CfVmlgVPDnzKqQub4w7yG9+PgJNfvjYiALtdLcqdvGRqlO54i6QDnSOmOZYraeaeDzuv2BvbOWRYFW3nuEZWPo7JKE+ek3CpPjPbik08HlMlLtqYapbHiR9U6xh3I/RVnC60xciPNTXvZE2ZnXVqLSAFAj1v5+xvAfI8KWrcP7oiXiaN7gv8uiwtkeZup67XzzWqBa784JcPRG/9+8qzF1FUV795GGwUuliQ//FqRRVEbqpRPIOWk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d0aaae21-c8dc-72b6-4097-73c7f6f93ee2@suse.com>
Date: Mon, 6 Dec 2021 15:19:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v3 4/7] x86/boot: simplify mode_table
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
In-Reply-To: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0068.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f7b90e7-5f06-4178-a377-08d9b8c35be6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233368085E363B20101777ACB36D9@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/QR0unRc3FOhYq+SK7gZJGKwM3qPBOxKEzyqezdaAZld+U4A4I1P0i380BYcB4l/URUAQbJh91jI9yf3BnuM1RPZt5d6xse3vbMndbp2h/dfL/oHdulT31pYcAGBhMQPFQld3xd17k810PSo8VVQQmvewA7V6U6bS2+LUBZFJo7CVqSid/nTitKd6PrWhMzhBfrOUbY5NQS/rsdOiaba/3xplHM/f1b0kk74vTqQHAg/od1Fq9eiyJNd5EjxEb66BNwhdlSYngkHRG7RLNiRFgbmvZ/Cq7WkBFK1WC8BUqIWzzG38XzGaZha+CUXDj3I9tiesdc4jkQDdK9rbOwnx6npYWTsHH2ORnB8bJZG4X4sWQEC266CvqTQM0UUCzUXTADWDzb/4WjA6NJHi8x5ofsJH/za+p0KqYMbEbCMloBuE0wk8xFEvZm8sLIxZilZ4YFW8Co+GbWtql/ofNbmxPNZJNlM0eDyLYpjYuG73Q9wubq+NhggmDsuEg7L/8jg++uFJXQ80/WE1ZJF/grwAbZSKw3Wazv7fP4ujWT+TT/ZuMJJeS4g6YrIZ78rK30sBerYTJnBEk+W7uQi0WaDJiPcEmrDPMofw0+860E/973cJu0hk9GprF09Q1zz3o2o4xopw82tawkHHHPdIDEcRo4688XglRarCYGpsVKXGA90z2bmI2eLbyHrULQwyubSrl2LrdeLb0CXxSTQLmB9722rUzTEB6SchR1n24eXcoY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(54906003)(316002)(16576012)(86362001)(31696002)(66476007)(66556008)(66946007)(5660300002)(2906002)(508600001)(8936002)(4326008)(8676002)(186003)(6486002)(2616005)(956004)(38100700002)(6916009)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YyszWUNyV3F0VUdubENkSUxSQmN2c3VRWHhYaEJKbnVkVnBuRWJjZHhGQ2d3?=
 =?utf-8?B?TFZvWC9oRUtvczliSGRLazVPbm81MmZCSHV2WEd5cFpybDhuaUdYVmRnakp2?=
 =?utf-8?B?a2tWRndmUFVrUHlDTTFlSTB1RU9PRVpFU2RwbjNFcE1nc3FEY0dSVC82ajll?=
 =?utf-8?B?em8yR3FVYm1JL2xSa0ZJQ1BRbmg3VnJ6VlpJM3o0dTJ6T1UrM2J6NElHRlVl?=
 =?utf-8?B?SWdKcWZTWVlua0NDcUcwQzdMUjhjOHBUOFNSbk9PSWI3YjhkNElIbk9SRzE2?=
 =?utf-8?B?UEc5RnNQVDlESTdlclJIaTFXN29lbXhoR0JLcGNOZ09XUmx0bUF1TEtYcTk1?=
 =?utf-8?B?UENNK2tzNkc1MjFmSit0YWV2NFNjOFVaMmRaSGUyQkpjQTJLSUhabVdzRlFn?=
 =?utf-8?B?dzlkOHNxUlVWQWZOUHgvOEN3SERDUXBZNEpidkpWV2h0eWZIQUlLbUxES3Bm?=
 =?utf-8?B?d3dLV1laQ0dwcGlOeURLcFNYTDFmWTd6aE1iOTdPM3VpRVJNR2RxMmhmMmU5?=
 =?utf-8?B?M3hJbHdjR2N0UnRDdStNc1lHQy9TektYY1ZyckFWRFdsWEsvZmVuYThKaHQz?=
 =?utf-8?B?MEo2blBKVU1vQkxxQktobTk0Y2tVYXArWW5jODcxTkM1ejlXbE9CWGhZeGU3?=
 =?utf-8?B?SlFtV0NDaW9wUVBsWFdUZFJ6Z3FxaXgwUUJhdUduWWt6TWlTZXBNQjVrdGtk?=
 =?utf-8?B?YXdSM0RWRENzOWsrcnpVRDlSN21YOGhnNDA0M1A1Qmo0R1ExTkl3RFhSRms5?=
 =?utf-8?B?OUJpaDlRcnU3VzYzdElLYjkxUVpHdEhWMCtmQTI5V1Uxa0FDOFJwMjVhY3pj?=
 =?utf-8?B?dTN4SmhRRm4rRXZlSEtIWHJxOGk1bllrekFTM3hHeFp2MTRkVTV0RXFOVFF2?=
 =?utf-8?B?dVVHVlhuc0xKc3F4NTJkSTlwQUdQTWU5ellQRmZBSjdNaTQzbXU3bk9LOXhh?=
 =?utf-8?B?dFkwN2xOQmNHT0hXRy9TYytYb3NaREJiRGZueStrbnVVY3lQYzRDTlFQTExq?=
 =?utf-8?B?TUNMTVowaHB3Q2paY2ptV0hxTllaOHhEVFpWVFVIclZsVG5BdUZ3d2QvVFpk?=
 =?utf-8?B?clNlWXFrODcxSGc1WHgwdVJ0RXd6MEFWV2J2U1I2Z0pvMFZnbzVsazdoMTFC?=
 =?utf-8?B?OHF1Mm91cHM0bTZGN0xGa0luRUZDNXlHdTM4ek1ob0ZyWGt3RWViRjVIRjBH?=
 =?utf-8?B?d09UWDJjemtKWFVCUFRLVDBLNFJVYWlLYm04SlM2dFNzYWhTV3FUeFZPY29E?=
 =?utf-8?B?VG43cjJDZS9lOGVVSmp4c3FmOXM4K2ZZSWY5TnNOdTZOZS9IS2pzcU5Ud1BR?=
 =?utf-8?B?c0FEWUJkcmVxbVlkT203V0dCUktVaDBKemVreDRWK3NJNDVRSStlcmJ2bmU3?=
 =?utf-8?B?OGtNcG9LWUpaTjhYTDRHdnJKaG4wOFBQaVJVRVdRaDJCcVowc0N6NzVPSjNx?=
 =?utf-8?B?VERla2RlbkZkVXBIWnI0WG12Z0FhTHh3ei8xN2hBZTdnTEZUL0NONEpsOGZW?=
 =?utf-8?B?ZFNNekI5OE1yenJUVFUrcktud0hBRURGcUE4ajl2SVNPaHI0Q0YzTVZnMGd2?=
 =?utf-8?B?RDdDN3ZZbnZCYXNDakxNOUNPdWZjYVVWUytBQ1o5MW15YjRxWk1BQzJ3RmU1?=
 =?utf-8?B?WWNFdkFmZmR4TTd4N2ZPQ0N2ZVZQaTJyRVpZMVhhckNvRW16VWRobjVyZnU1?=
 =?utf-8?B?OXloRlV5dU9BTTZBay9VemM5VGlPVUhXNkxKcHJITVdXbS9YZUZWdkd5Rjl0?=
 =?utf-8?B?ekUxY1FtVThxdmxJWXpYSVZCWFVCaWpzMjlSZGdJQzlPUVdxa3lqNkt5TDJ0?=
 =?utf-8?B?VExuTHZQVFZ5amhDTWR6WVJrT3dQazhNYkJwa1ovblBFY3kvNkQ5VDBpbW9D?=
 =?utf-8?B?bTVtR2NqemNmZzNlNW5OSXFkbk45TnZZekI0dWpNSWFaOXN2cEdVaWtVVk02?=
 =?utf-8?B?cTVOVmxZS0ErRCtYU2VtUFFvbytJQ0RLb29Uczh3SDQ0QU10b2lZQS9XTUF0?=
 =?utf-8?B?aW40czVpdEtXb0lGYmp0STV5cEVVY3lMMU1HZnFmSDRPWjk5cHlQdUE5aHQv?=
 =?utf-8?B?RERGNVR5WktLL0xwMHZSTGJMd0tLVHhPbGQ2R2h6VzgxRmgzYmI1UjgvajNH?=
 =?utf-8?B?aXhHMUNsc0YvKzNZOHIvcFBqMUMybmw4ZzhaelVoZ0VsRkhxajZKbUhEcXBU?=
 =?utf-8?Q?4gQxmll76vNAma3s9IWM2F4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7b90e7-5f06-4178-a377-08d9b8c35be6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:19:05.0850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FVAcr2PiWIYpbDUyk5Kt3SBVP2TJN/hMeu46pzjVJmnfXYY7NGDyuv0KjHnhueRpYv8AkQM80UgZPKKNOWJmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

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


