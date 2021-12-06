Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC0646986C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239050.414329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEnQ-0004hf-Qg; Mon, 06 Dec 2021 14:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239050.414329; Mon, 06 Dec 2021 14:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEnQ-0004f3-Ml; Mon, 06 Dec 2021 14:16:48 +0000
Received: by outflank-mailman (input) for mailman id 239050;
 Mon, 06 Dec 2021 14:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1muEnO-00043L-HU
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:16:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2499bfd7-569f-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:16:45 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-S5doW1pBNbOVUk1ADMe3mg-1; Mon, 06 Dec 2021 15:16:44 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3774.eurprd04.prod.outlook.com (2603:10a6:803:1f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 14:16:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:16:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:20b:92::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Mon, 6 Dec 2021 14:16:42 +0000
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
X-Inumbo-ID: 2499bfd7-569f-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638800205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CCXIWoro/Z07Cad4JvCje2Mc2lnFKaod9gLVxAbT61s=;
	b=VK4wlbeg3uq4fs9BscC0rchGvYuCq1nSGaNbUcpu8TDiEVBTsNmPWLE1gYsl+oDs1uMA+f
	dXh92Pwr3ou5QoFE2txYrUj5TQBa+BZ3CD0A8PmiIlZp8slOHc4l1zPMKfJK+xorW9r48Q
	zbUrUUSG0KazhuR0Nc+APIrbMqz9gok=
X-MC-Unique: S5doW1pBNbOVUk1ADMe3mg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vedn7eq2GorbbUlO/9kDE3arJPck3DHKOvcVftHLeirJhXpMSp84dR4i6eb6gWnRheFDGqunfoMAsFprtMzey3uC0dQcQvUosVWZd68+CWnHQMx+3xCAeRhaXjpzvDf+KIkPngQaeEDi92yk0MnduT6VLmU7rOaTd5v2AqUrNxqAX995x4y49adyoizd3wkb31BpD957ol+7jJ+2PddPFHomgdJCiI5DGW61twBrlGYgaxKyt1xeJOjyYteWs3dqKxEq/URSPLtSqm1+UdvK5ktaQq0QbFtiGeYo+mlMsiDeot3jwZFfnudr9oBZIdpmbz52uzDMNWwleMCaB3y5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCXIWoro/Z07Cad4JvCje2Mc2lnFKaod9gLVxAbT61s=;
 b=GurcxUDor/UPoY3EAlHXMuYTGVV9H+CVHicPVl1Lfbswkec0h5PtMr25r15Ua+JLfe3l50IXso8OXJh/qaqrgsjxszYCPiRSuK1zu6zPGFc5BY86vSotvRFf1ukvuqxhTY1HosHmv3yczDO19zIdueIb0z5yO4c+ouVvf5+jdAiBTsonH3byMfEtWaBLYLXUUbNFz3Y/O155byjhpMuEYv2v1NMjPyP7fCGLlNwJju6fzSTdP89fAEaBscdfWl9linvK0P8vl9+oV94EtObf2ooGrQZRNlhZx62QXJQUEH8ZEeL8NA5KYO6+2eNluulZAtBHX3DkDdlB6t6CWqbC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66a73afe-6d32-9c1a-0346-9344877690a4@suse.com>
Date: Mon, 6 Dec 2021 15:16:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v3 1/7] x86/boot: make "vga=current" work with graphics modes
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
In-Reply-To: <4af7ce92-8f4b-0be2-2439-a1bfaff59be6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0031.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::44) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64f7dbdc-3ad2-490d-72e6-08d9b8c30759
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3774:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3774372C6571D2819AAD0F27B36D9@VI1PR0402MB3774.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O+PpJ/kzbGUCkLn7q3co/3/n+Qu87W5Hj1UYS87FNos4pBnYRzQcImNmdzUUuGIdBWaD937PnniEREZJbIO4pXx8vgrdBTNSrOvNrjNzmHm8ltv0UZcNpEBFrKY4c1J7+T35G0xhC0++MiUVt3ZECgz9aD9py4jy22UW6nWEJHog6PGjsKKllO0u2TO0AzISasMT51VkLVbBTo+x9s4Aur8lWz5MLJ6G1ehn6tp2vPjKN1TW6bcl4hHqfmKMFAaGMjTbSBmpiC/Ly2Zp2X059NNN2bKjLjYgVLXjT/buxhCKKWzyo4i/i3027sychJgmJ8/U07JJJofBS8ss7gTv5rNrK5xFuC2ZqB/3TQIipRpLG3P1Ymq6pHxe//1jYPwHocqDc7zD0LE/jeH8CRmEp8C/TjysogKkQxwGM6AWLFuZFAQ+D8Z6hN0nXVHhwGU4eKLFparjoWoYb6rGAIBZJgAED5lENd0YUH95+5toTsEmfZKkVl9yoFTU7q5xkcTPRthPRMt0uVk7IG/nm3De9RNPSrKmikY5HHP9Gvs4VKWPceUfSP+AC5pSJJ6IVY9x2ElwcvSfiRBpcX2eFYFAbpgt1t5xPAptWXPbBKJKIjpzN20UlczGNsFW/DVg1MSnt/zJKeRuMSDY08aNt0I/kWiLss6ysu7p6VoCcMp+SUeBEtLaOe8CYV0iwGYMXvGosjXUA6BQrXWqxHsVopFxnem3QVDNwdwyNoNJ+SAo9IY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(4326008)(66476007)(66556008)(66946007)(8936002)(31696002)(508600001)(31686004)(6486002)(8676002)(6916009)(956004)(5660300002)(186003)(54906003)(83380400001)(2906002)(36756003)(16576012)(316002)(2616005)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFp5ZTlvNnFWRjQ4bkhmSWRoNnFrdkFoR0JUd3J5eE8vcjRJdkl4MEJUcmpp?=
 =?utf-8?B?anFhcXZKbzRHdlZFbEs5Z3J0bUdIcXhVWGdaMndBbjZVL1JEcDR1K1BPbkF6?=
 =?utf-8?B?bVN0VGVyL2h2d1BoZzV3ZUp4QTdhTmFyTUtQQlRRcmZmRWoxQlg5QnlhZWxN?=
 =?utf-8?B?RHBmQXBOdUZiODRIRTBleDBEVy9ZWkxLdFFnL1Y4citvbEV2RlBtMkNmZmJh?=
 =?utf-8?B?a3pyQkduOFVHakIvaG9UTHdQZk44WlplcVNJSkZlaXdxN25Nei9wZDZTellF?=
 =?utf-8?B?QzBkaFN2Zk9XcWVHNVFub1YyUytyT0xYMWk1WERNdHhublJ1MU1rUmhibFNn?=
 =?utf-8?B?dUpQd1pkYlc2NkF3d2IrbHE2bGw0eVBUVTB0Qm5JQ2dmclJlYmIvMkxjdE92?=
 =?utf-8?B?ZEd5Z0JWK0FtSW1WRUxHQVRjRDMrTlZZalZYTi82M3BjTnlMK0Y3RS9vVW1i?=
 =?utf-8?B?Z1VCRnR5b2Y1TEUxNk5hSTNEQmxXa3hwT3ppVHF0M0NqUDJxRzlRZ1RoLzho?=
 =?utf-8?B?dFZBUUhZZTViVHB3WUNRTWFSNnE0Z05ObDlHVDEzVGkya01xaHhKS2U0NXdw?=
 =?utf-8?B?WlFmTmQ2V2ZsempMOTZGbEExVDRkZEt4L2xDSWRJaHJvaEF4SEhOVlJVQ0NU?=
 =?utf-8?B?WG5QRmJhTE5pV2JpQU5hQ1ZPUGxNNnZDV3Fqd2NoT01lbE12Vk1COFJiSjNl?=
 =?utf-8?B?M0piTWF2MkRMSWRUTXQ0QTcxVFhQeVN5ZEJwSkxGS0hod3M3UXJTNm5nK1VQ?=
 =?utf-8?B?Z01RTVY2QVdmOTY2MzlLdFl5TEJXUnQrM2ZUS1JvbDhacVYrNHJzQ3JjZUFQ?=
 =?utf-8?B?TlRhRjhwRjRKdjVvWHBwZ3pqYW1CNDE4R2tRWE5ITGdGQ21pK1VFRElFcXp5?=
 =?utf-8?B?dDhQRU55OHorYjdpNkxPQk1JMm83NjdTcFNWMXZlNUc1WHpFVEZ2S1FmVWp3?=
 =?utf-8?B?N3Q5Sk9aemVqaFB2YmVPWVNGc0Qxb3hCNW9YcUF0ZW54VFBEZm9SbU84NGJE?=
 =?utf-8?B?bXJsWXBlUkJ3a28wS2g2aHFkLzB0enp3TmZWU0lCRFVQT1I0K0RsTjNZVktU?=
 =?utf-8?B?WXZkY1ZXUFhqaElnZVExTTY0MEUxNXlDMDBVYm0zMmNTOXNhaUoxS1N3M3RJ?=
 =?utf-8?B?dG1ncXZwbXhCcHRDekJUU0trYzZNYmZBbHZYVW5MMnZIY2FLYkJCcnAvRDRD?=
 =?utf-8?B?M0tsMjBUbjROdGtMOXp2dHdMcDRsSmgxUFNxSDZYY3FzQ0duRFA3WjVNT2lY?=
 =?utf-8?B?OXFsNzl4ZXBIUmRPNndkK1JCUWp4S1ZETStublpSbEdDeUhEY1loenhZaW1Q?=
 =?utf-8?B?a3ZZclNOaTlxeEFSU3F5UFRMNDQycGt6TEJaTkhyaEcveUZqeG9PeXFoL3hZ?=
 =?utf-8?B?QWwzeE51bjVYZjVySTNaeDlHNm5RUEEzRGljbmlOWG1ZOXFKRVhxdmtnSUNw?=
 =?utf-8?B?WkloZjE3cUtWMGlzMmNQYnU2RlRMQ2I2RDFQc29aaGJXOE1IbVYwNmRBL0tZ?=
 =?utf-8?B?K1lVajFxbGExOFdaU3Z3ZUlYd2hBNnhxNjFRZExPT3dLNDRBOFZZU1o3MHg5?=
 =?utf-8?B?bVMvQlYyYVBxbDFUSVB2NlRONndpWWVRSDBZb2xMN29wVlFhaG1vNjhzR2dX?=
 =?utf-8?B?a2liNzJlVzVVTzZuYlNIQWhFRUZFOWRkd2R5QXM0dmpiQnVhQXlsVCtrQW1w?=
 =?utf-8?B?YzB6NjNkdXUwYlF1TUI2TXE3US9wcVVublFDOHRNNjhnaXQrZEdKdmlXUWll?=
 =?utf-8?B?YVVPQWJxZE0yVGRTT1gxWU5MVURTL0FSbXNhY1RjZElpVmwyek96SFJsYksr?=
 =?utf-8?B?STUwQnFneG5XVFJLY2dUdGthd1dSR2NURjEzMk9GdGtjRUgrdmxWYUtqZ0Va?=
 =?utf-8?B?NWIzc3ZscHhvaUNGOUlvNFVROUZscUFhQ0huaFZWMmt5N2tsOFhwWk5oU2hE?=
 =?utf-8?B?THhUS3VjUTZtdXpyM0F6ZU9WZHNIa0YvTTJ6WmxhanFBYUV3VUUvYlI1SFpt?=
 =?utf-8?B?eWsrSjBvOXpXM3B3dzBHRVpWT0lqalRqNmFzMjJVOFRZbXJHV29mV2NPaDlQ?=
 =?utf-8?B?OWF4aU50aGJXRko3Zm5zblJrYzBaZXVxWVJXcUs4aHNzblJxbHZYUVpxQkxS?=
 =?utf-8?B?UVF3WmRBZEx3SkJiK0FtUlhtOTFyZW5NUE10T25iNU5vODZyS3JCKzdWcVNR?=
 =?utf-8?Q?P81LI/kd1zCpz+m2hnlz3uo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f7dbdc-3ad2-490d-72e6-08d9b8c30759
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:16:43.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91NTFtDtz5KSApjkElcJEUVVqVV0INb7tnpA353mZXvpOGTdeLujSVf6eFaYI88vcmbYXGD1Flg4S3vAeTLyFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3774

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
    I'd question the requirement of the mode to be a color one.)

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


