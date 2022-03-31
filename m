Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E3F4ED742
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296851.505442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrQJ-00063i-OB; Thu, 31 Mar 2022 09:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296851.505442; Thu, 31 Mar 2022 09:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrQJ-00061G-Kw; Thu, 31 Mar 2022 09:48:59 +0000
Received: by outflank-mailman (input) for mailman id 296851;
 Thu, 31 Mar 2022 09:48:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZrQI-00061A-Am
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:48:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8b1afa1-b0d7-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 11:48:57 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-vT_QhzW5OQ6fFsj6KKT39g-1; Thu, 31 Mar 2022 11:48:55 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB5658.eurprd04.prod.outlook.com (2603:10a6:10:b2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 09:48:53 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:48:53 +0000
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
X-Inumbo-ID: c8b1afa1-b0d7-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648720137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+iOZotKkLcJY4CXebIky0sg+x0ejVE7dgfMqo24AelE=;
	b=mSZ+pWlHMapCjOv8Z5jMUFOZ31LDjO8M+c1k1sGz5DM3c6l1URMMLAM4OaGm/lZYDXL/sx
	RlaVeNxrerz1JdNARauPanNZ6nGM73MD/0+Mxzz7iHepvnUeuyOUK8hhnRKkd0UQQ8PMB0
	k/paZDVLiuQIlGTax664qcdGw+BlYhs=
X-MC-Unique: vT_QhzW5OQ6fFsj6KKT39g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqsBu+6ePMeKPUKtlK+T6vluiV064gyg20OE+23C8O/tqo2sMVI2JTaqiCxoLzZ7uZHHl0khz5kobi+VWWpJzZphHspnbXlhudXNLwltSa8wp4axIPSj3sgMaapjs2Tsvk9qxbwRX4VE/6AZGVaBYjAuM+lsWUDFTtvTdBkpinlUl6aJVl0YIiBYWhCVGyU0i1X1QleG1aX3LgqYT+7uY7iV3x5P2DDfMBs4d/1Zwm3UOVRzBG1612bVGtTDPBjfHrilA7kZ5hmIgk7yN5jaSUuvozkb/RFh8ZXA7aLIklwxbGdTwxm7ieBs+Zfd65WBIM8m2wFsCOrsAdrYoh/g/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iOZotKkLcJY4CXebIky0sg+x0ejVE7dgfMqo24AelE=;
 b=M0BjXn32/8ZRyQH0wWtsIVi6N28EeS6yHYI32DM239fiGn0cXprZqge/BE/aufuRvaX3B0aGYDSIsz3rM/Ot5pgOk34n4l08scdq8bxOXzjkKrVKRLZsfFjgm7rl4q7fNA8l6SxYJiomSqkPnY/ZC9ji3oxbhISSHiFrjCSFz/Nul2YuCdoxGCi/SyOgLsNRM0iD9b5G4ObEEi54OulC9uEh/mCEo5S/yPviqHBtGYGfceDp/nJYlYe6Oepa7EGtG34SuQzjmanJ6MqgVgDg6/N2Om7mpbDLpbqD1p4tHxdo7Km0Ng/GzCLNulnNSotyk9sK67UbEa2ENbLfKwRckQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b2ddf830-e507-9d1d-2638-cd34d3391596@suse.com>
Date: Thu, 31 Mar 2022 11:48:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 4/8] x86/boot: simplify mode_table
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
In-Reply-To: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0066.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3ebcdac-364f-435a-3742-08da12fbaa48
X-MS-TrafficTypeDiagnostic: DB8PR04MB5658:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB56586FB658BD6F19EB145573B3E19@DB8PR04MB5658.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qUfHIdCNJkTPD82OeCwJKceR7ekoUcB7WoLUsRDPY2fskgk8Akw4gOXK8iRF9LPzUlZfLMVv4fR4qYVaUUJwaw7WmLeY3tELTzIj4hPIYM1G/pFHRH/X81MYj0zMRRMrDKFBI13zOsNIi6w4pu20V2uCwTHJkMjeaz2AtNFaIL2rsqKf5bKbUmZXR2BcbvSmG54Q9xLiVoz2PCiFFAfg14m2A/6o8SY05J6lfsxDhr6x9uIs1nrHV6nNEOLF5od9oRl4iQreRGIQsSLxRcbyGpxKHmt5TBFuVkDZGpruGrvJHoZDy+RfHBKcrHCsmFl4uzIoVRiV674nF1cUfJRNuJGBv/dzquJ/fOkP5dRXlgrizXieqgTlsNjUFQjEVf1GDxoIIuIaMyjLQLFCoItWxA+UMVu2/+1bMs/ATnjt72+jIN3blxmX1glBM70rEsEtC+gXof89exBzIG3porE1jXY9Ww5h79hmPPgOr6SjoE7/MHeRJZWZTYby/1yzBbLYU9/Zb1ooQroCTv4SP9jjnoI6wvVKavHNPIpj13ueNxw2PkWR3UzUfOS7aG2DD/FgW8CdiXLebqk/7cpBoHmi4zhG7v7uP3VTUZJbRnRCJVInRrcUDBBOMQ521Ax7pF4EhS6/0f/KBjeDAJWB/ECBjMQPwiZ3ByHqZYzddJNGnpatgvg3e4SqG+gsPKV0sfVUdxw8WuGTfHy9NN5N8XJeqst1gkW2NLyLi5tAT3YdgJF9zYDsJz0LFYvKeZLyjFiF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(54906003)(316002)(66476007)(8676002)(6512007)(6506007)(66946007)(31696002)(86362001)(508600001)(6486002)(66556008)(38100700002)(2616005)(4326008)(5660300002)(26005)(186003)(8936002)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXB6bHQwdHZqaDFCSkVMNi9vZHB3SW8raGRaMkgwalhyNTJZUmIvdnBPa0k4?=
 =?utf-8?B?YlNzV1Jpbk5hL0hvSE1ycmhCY2dOV01mYktkRGFVQk5welZKM2I5WFJkOHo0?=
 =?utf-8?B?a1N0ZTV1dzJMckZ4RThqY082dm1kZm5zN3h3RmUvSFlXOWhmZFdjYThlRnMw?=
 =?utf-8?B?YXQ5TU0zVzNJdDd1Zkk4SE5Fa2pJSFdOMFFOdlRBME53S2JTNGlLMWJOZGFn?=
 =?utf-8?B?K3llS3lBQWVRK0Q2eUoySFVvWFgwelY4VTI5TjRpMnZPOEp4Zm5aU25zVUFn?=
 =?utf-8?B?L2wzR0ExcHRSQzREOHhGZmNXMS9hTS9BcERjWGloc3JTSkRqQ2x0NVcwd25V?=
 =?utf-8?B?OS95SXJSSVhxZjdQMTZlM082TlJWQVZCc1RwM2JQWEdnTUR2TzdWcHBXTFpv?=
 =?utf-8?B?bWZhRFFHOGJhYWRBMUphekIxNE4wVVJob3BwZU8rYTh1ZXNWNTl1eXRVVXZS?=
 =?utf-8?B?bngram9GdCtJQ3hyN09NQ1RuUzFjNXlUNTNTeEx5ekV2eWJKTmtXdlVUY2Vn?=
 =?utf-8?B?YjZnOWZjNEtLNWs2NGFiTFBBdzRyMjA4Y1Nwc1c2OWJjNExQV24rcExHeXNS?=
 =?utf-8?B?c05NWm04SGVtWVFYWFdRcll1ZHdXZzJhbThlVE05TTJMRmwwY2Z5Q0hyYUxa?=
 =?utf-8?B?MmV5MGVPc09iRFdDOXl5dkdSMWRWMC9nYjhnSGd5b2lwRjQya1JJWnpsVXZ5?=
 =?utf-8?B?ZUVKZjlFNnhEVWtYZkhHZXkwbGhJNHp1bnFCU0p1cGFSRmZhL245TGxMRFlx?=
 =?utf-8?B?RURsQWQwMDlISTUwWm5UNHBqTGExbFpUVEFrMm5Na3dXQ1cyRVRMVWdCS2tv?=
 =?utf-8?B?cmZXUDRmQWN1MEJGY0pXQ1pEQS9xUDNqREtCU3JyVVA2R1dwT1JtUXVlT3k2?=
 =?utf-8?B?TWJMbmUwakQxSEZ2UmlzSW9zZ3FOVDk2c3FZcGxLRm9JYWQ0ZlF0cXI5aTcr?=
 =?utf-8?B?SThsN1dqbFVQd25QZUZDK09pSk1jSmxrRVdkRU5zQ0xGRFRXS2FIS0NIcE1U?=
 =?utf-8?B?TEtCSzdTM2crWG91dlZKWm95V1k4ZTRBVzBtOGVGV3J3d01JdzA3UlFJNi9x?=
 =?utf-8?B?ZXRyKzJOUW5mOGlVV1ZLUlJvVS9CRmR5N0pnWldKZnB0clU3Mm51RVVkOS84?=
 =?utf-8?B?dEEwdm5Ka1RCNWpqRlVYaENMSFJxVllDUzFZbTNXRkVETmZKWXZIaVhkU21E?=
 =?utf-8?B?Q0lLNGsyVzJlc0ljVjRnMjAycVZ6TkNwRW1sNVVxVCsvUmlESmszWVorR3pj?=
 =?utf-8?B?a1I2Y2ZBYXdpTzJzOGd0ejcxREV4STNhSEhqR2hWVUVBUFdtemdhdWw2ZXAw?=
 =?utf-8?B?Z295VjNrc1huYVAyV2JxWFYxeFYvdHR5dnVnaDZuOEREUS8xOXM0SWpzRFo3?=
 =?utf-8?B?alJpUzNKSlVOTmlHRG1GZENFM3ZPQXZacFZqSDhaeVYra25VMVBIMnR6UkZp?=
 =?utf-8?B?MlpyQndCQ2k5eG5pY0JweUNjdlJEaVRUODhDdEpSNkM5WjhOUGRJeHBEeVYv?=
 =?utf-8?B?M0Rpc2hsMW9QbjBBRWJmYlpDaXBVQzJOVFdxRGJES1N5YmN6TlZHSzYzWit6?=
 =?utf-8?B?YWZrV3lzNVluU1lhUDVBdWFYQTRzNklZMDVRL1EwR0ZDYXJRYjR1TzQ5Tkp0?=
 =?utf-8?B?VkV0QmdheGdmbFFJV3A5TGdicVhLOEVQV2pPNCtyQzNvQjhubEFaSzdCakVp?=
 =?utf-8?B?Z2srSlNrTVJSR0ROd1NWdjVBQ3JYZkNYbEZweXFFVWkxNTlVUDZDWnJvM1Fz?=
 =?utf-8?B?K0Y1TEVwN2ovTDdLT2tXWW5kWUdBRzNiQ2JsK3J1ZzRSWi9FTTNRbzJJaGpC?=
 =?utf-8?B?U0t1UDUvbUJNb0hHZDNqdi9scHV2OGhKb0I2RTExRm5VZm1aN1RhaGpVWG1x?=
 =?utf-8?B?RmU1Q1p3NjJJZXRyUzJlQW0vZ3o1dXpyRXBFL3JsWXVwSGlDbnkvM01rcXJ0?=
 =?utf-8?B?bXRLSVkrODg1ZXpzYURzQzBTV21pVUdoeHB6RzM4dTdWb0JlYjUxbkdtRGl1?=
 =?utf-8?B?L05ORGFodlcxS0ozbk9EbXpEOG83Y1Q1SjAvNCsyZHV4aE1hOHFiancvRkhp?=
 =?utf-8?B?b3ZPNWpyZGY1T09BRi9Mc0hFcjBSZ0NLYnJCT3RtVFVjdlloQXVTZjZ3Zzkz?=
 =?utf-8?B?VFBrWnFTQ3JYOEJEYnRmWThleEw0SVQwRzNkZGRHOXNRZnVORTRTeHA2cWR1?=
 =?utf-8?B?ZEs3Vkk0Ri9DQ1dFZ3B0c2QzTFNydk5mQ3Jvd3JDR3ZTc2pmZFhsR1dZcWxT?=
 =?utf-8?B?WkZ2cjV2QnhUMTU2cEpKOVBncFo0Zldza0xuZks5YUwwR3ozeHIvTHRheEw3?=
 =?utf-8?B?L2F4clBtSEFKR3JrR2lHbGdqMFhBNURxV3VkT2xpcklwZXhZazFSZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ebcdac-364f-435a-3742-08da12fbaa48
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:48:53.3840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zI9RqP+WY0dJJvIj1GogcqYMv9v7jimkfSPI8TNIF1/EU7r3de2T2f97UsYvPx8AtHOwcdHlLXBrI/TKFjRrGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5658

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


