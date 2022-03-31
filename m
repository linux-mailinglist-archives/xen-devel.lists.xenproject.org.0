Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064C64ED750
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 11:50:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296860.505475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrRm-0008Sf-Os; Thu, 31 Mar 2022 09:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296860.505475; Thu, 31 Mar 2022 09:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZrRm-0008PI-Le; Thu, 31 Mar 2022 09:50:30 +0000
Received: by outflank-mailman (input) for mailman id 296860;
 Thu, 31 Mar 2022 09:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZrRk-0006u5-Kp
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 09:50:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe6241e3-b0d7-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 11:50:27 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-JmfEzXE7Nzqk5lDZDet1DA-1; Thu, 31 Mar 2022 11:50:25 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS4PR04MB9650.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Thu, 31 Mar
 2022 09:50:23 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 09:50:23 +0000
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
X-Inumbo-ID: fe6241e3-b0d7-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648720227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fb7K4sY64D9J9sN6DhUdaWAIhUcQkX9yK1qzj7M9L8g=;
	b=Tfdlg0NRhiQKRxaNrdJu3fmKdo3DFNunPxHF+DXkmEZA3mqyT88CSZkmx+38KjaAtHLzIk
	4gEVv6CZQ4EO+ZmP4qrAp2eK8hqpKSw+FoGmtG1VAb5Cdelz9LfXqpYjJxu5WgCjLz5qJC
	5Si2ja8RG0zEo9vEZsuLHRvW5Jf8prU=
X-MC-Unique: JmfEzXE7Nzqk5lDZDet1DA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g39uerfTZViCOSLz6tP14DhRz5jlE+hdNkDMHBhcy2xDEcPB8KlnE/XzL8PseLGBkGpLv3Bg3Zqya2a3v+P29RqJcJBbQ5gNkfnlGM5ks4bmSU/Q27N2f9P/8NuB2394ItYeCRq5GnySBQstpel+z4xjoEHaXKvyuCgQCx/OO2Kz2mguB09zgD31CWIZbfFhoXnG0laf6jCvgXivum4Qj3MK5gKIkVpVUZfmkt+CnbhjqVJ89knpauLDiTqrCUU6DBuQAHVrAJtUy8Mka9YUcQ2VBvrOIHmQ9zBK2J9zKF8oGlLvshD1eqKLF/w62lLbPvTV/FFj/In9Knjk6SptPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fb7K4sY64D9J9sN6DhUdaWAIhUcQkX9yK1qzj7M9L8g=;
 b=I8cWiW3JEmt2My8XkAJA4YPPxrN6+Du4gDpW7e/vQT1yUMJBNl8qQLjxs4Rja2KJLn6Grc/BIVHbHpo77roMGSB0llbxjsaEW0usn5PumubPJhk5xu/YXFWKqpp7wCIh6EEcCPwGlrAqAX2L3ly7Rb/j2Nyx3K7W1w87L1vAT7hnRANWMSe6iegl3EGODvLqICDVoLn9fNHTM42Smj9aH7T+gnYmfuiFfFfqGbHORGEsRh1JQ6EflzzXWZQUnuaHedtbb+eXLTDQGloRXaTTEIni1faW/LgdCzGZh202MSB5aLtxRXEdEDHIenTFO2vTa9THXOGh5e2hWJRdZPj1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48666252-a448-9c17-cacf-2788fe1a3c17@suse.com>
Date: Thu, 31 Mar 2022 11:50:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v4 7/8] x86/boot: LEA -> MOV in video handling code
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
In-Reply-To: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0070.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::47) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4a382e7-2e40-463a-81d4-08da12fbe067
X-MS-TrafficTypeDiagnostic: AS4PR04MB9650:EE_
X-Microsoft-Antispam-PRVS:
	<AS4PR04MB96503446F2955DC2C93D31C7B3E19@AS4PR04MB9650.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ndXqZvFoKFEKXFZVnCZfF31/dxoR1W/8g1Br4T34gEMr0vran/2qE61Gfm9dRzQa9BQw/L3bSMzWoJANlaZoszQOVN9YcYkLYcvuTIKZfvJAf/pLeVkieLTO1l1mtTvrQlWMr0ofkjiqTUqtLSHexGNRmcFWmeUwpLroTHEkfUsayUdMy+FtYSkl6zRDWl9IcvjH3t6JYv8d9DKuCXEFlAlvM+mbrlM4gPLvS2maAGtdQXMqiHo3btaQPeJIOnaE6uZU9KEqK+w9JuLL+j1Pr/LbeBdqSFhFNZC6bSqEMkwL09QRE0jOdp6WbZBQs8KuW05j1TsNTRI0nx1S6eHiqpA8ZsdNHQV229dM//Xa2F+RPCBoib924xI0rZv4i7t7FGOnu3PZX8PT9jneUJpx68kO9WzdPCH+8Zlf+Vb0IoFrPOeaTY0Bn99tsSPOG6x5jkjimcZF/MLGEDQH/EKgEhiB6WTLwpV0+VcDIkyZa2Jj+rojFP4NeU4mVa0tDtVtZAdMwJSL+NuujNk29WKOOBKkQvIdzkOOF4H3G6+g00X7bZPb1bNWPTabqJcIbtnc89QfqqApXz/w9IgWLi6VH43BzfDLPnjQy8bgOACjMKxy1jhrNvnuR5PWQcS5MXLrP0Xm30vIlrr7InFnrJsj9w70ayC8WDmL83mc7iUqc+Y4M2/PmLtq5Y25JixQsrfDwFEJjC94p4x62SZr/HhbloY/N7QaEN/lrvnFYdcF8VE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(508600001)(66476007)(6916009)(26005)(36756003)(2616005)(66946007)(186003)(54906003)(316002)(8676002)(31696002)(86362001)(66556008)(8936002)(6486002)(4326008)(2906002)(6512007)(6506007)(31686004)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFBRQmpDZTdyQlZkZjVwK09Zaks5U20vYUFuUVhZbFhxcVpnZEI2SVlsUTg5?=
 =?utf-8?B?S2d0ZFpBd25jMXZrNTJ2b2lqUGtzallkV09BTmhhcTNXdUlIK2REMGtHS1Rk?=
 =?utf-8?B?M01VU0VHVnFmcjZjdTVCRk5uaXVOSVdqRzA5bFNETWJYODYzVU1CdEVyZUQw?=
 =?utf-8?B?dmk3SlVxNmNoTmlFKzhBTVAwZWxNSjYwb2p1c2dGR1ZMYVFjY0h0cGRCWWFZ?=
 =?utf-8?B?OFJQZzFjcDBlNEp0RXJXekpsUTBnL0M4eGg5WHV5VTYrdzEyamhpVEFkY1Y1?=
 =?utf-8?B?bWVKb2RnV3V3dlVZc0t2Umo4UG5mWDAySmZnRXdraVdJeVpEQ3YreHp3dUhM?=
 =?utf-8?B?QkJmSkdXUy9vbXhtZ01XdWNaa2NwWlQ1VFI5cUVpS2Q5THNMaTFpeU0vUEF1?=
 =?utf-8?B?am12TjZUOGZYejNMcHdFNUhCNHBxUXJjV3h2dE1PYlZjdnRJQStXb2lEOGhv?=
 =?utf-8?B?VDR2cXErUnBEdzNVcEJmL1A2d0lpRTB6VXJzOUg4Z1k2VlVHSE1hNnptQ2FU?=
 =?utf-8?B?Z01MS205VXMySUxOWFVCeDMxOGV3d1NsTXhwcUxISVhBRTVsTjNMZWY1OHBU?=
 =?utf-8?B?QjUwZkRVYTczdlRndlE2WlNHSkZnanlnMlFEbDk0YmoycW41dEtRWjB4bDVw?=
 =?utf-8?B?WUVPZ2NYV0tTbHh6NzhIZ201aUU5bmc0NFRGZVpyL1JkTFFhNTdBckFIZFFh?=
 =?utf-8?B?bEd0SlRyZ01ZMGprcFdENnhsNC9TV2ViMmtNa0xMcGxHcnpBWHRqOTNRWkNq?=
 =?utf-8?B?OTk3VVIwZjZmb3RPTWpVL29TZndkNjRCRlBnejAvMkhTL3RuZGFnRjV6WWM4?=
 =?utf-8?B?TU5FeGNCelNHcWZyM3RQUnQySXhza3lyR0F6TEYxSUhiZDdJdlF4VG1lbVBo?=
 =?utf-8?B?UGhnVEUzUW14Sk9WalFHS2tQSlFEM2x1SXJnamNRN0NscmlVaHRsODFmVmVD?=
 =?utf-8?B?dnZ0ZW9ORU5va0dnUzFLdmlyTzBBcS94TFZMR0Z4QzNSNFR3K2Z4RG02NTJY?=
 =?utf-8?B?QXR3YkVPcG9MNnhmMldFdTcwZzJ2eStCbXhFckI1TE9rc0swcm4wYzBXVFZZ?=
 =?utf-8?B?UWRjcEFLaTJ0b3hpWFVmclpnQ3FIbkhNM1JydDZhVWU3RHJLNTArQi9nTC9r?=
 =?utf-8?B?QXZwRUJBVTFvUGVKZ3lHVzhEa1BPanFKVml2a1M4YndEclBXN1JFK2EyMmh5?=
 =?utf-8?B?YStIbnZLQkcwTG9rdHBHWnNwN1VjNVNseEtCWkFFYVUwMmk1L2I3cUwrTmFm?=
 =?utf-8?B?R0Q2RVhNQVgvSUl2TXNHdUlNY2l1bVY3eU83ZTNnTjR0U05vQnlDWlAzak1m?=
 =?utf-8?B?bG53Wlp3djIyY3pxYnI3WWsvQWhPendZaUlWVitQdWJDVFJCR2JQTXFDMG9s?=
 =?utf-8?B?SFRoYmd1Z2FWMTNpaWpLc0FWczVXbXhRdUllMFBvT2NzVVJKdkJLRms4blB4?=
 =?utf-8?B?Uy9DQVpJemxNdE9vSk1JNHBUbUw0SHR5T0RreDRXcmsrajZxdllxbnR5NXdB?=
 =?utf-8?B?MTl0Y1B1VUhFZ0xxWWZIQ1JWblFuT2F2MDF1d1llY1RMWHYrSUY5Ym1pMVJ4?=
 =?utf-8?B?WXNqbGtNZlJKQmpLMnJmVUdhNW5uN2dpWFVVbGNOQ3ZIb1dGMU9tWUtlM1FT?=
 =?utf-8?B?aExNMzZGM3FqdS9UR2R5NHpXck5PVmFDZ21lS1lmbTh2VHJMdFVtK3RFbC96?=
 =?utf-8?B?dEpiUmxwMVZldFlIUlFTVXRZc2d0NUNCSFMrc3IxMm8wbEp5YlpqZWxkUmpI?=
 =?utf-8?B?Szc1Y2NjQzc3TlVJNzZNQVJUcy8rdU92WmQ5NWJaN3FCekZxZjdXdG1qWWdw?=
 =?utf-8?B?RmtmeGtFL0NVR0FYWk5LWmt3ZWFHd2R6V3BmVnUvUG8rQUJqdHh2OURWYWNL?=
 =?utf-8?B?YUdhQkFwbFlTMnlPSEE5ako2Y0tsWk1UNWRkZHVrUGtWbW5nR05WUHJhQ2Jp?=
 =?utf-8?B?Y0xJdllHNCtjdVpka1dqd1JyM25nM0dQZTRjUWJkd1FhMklKeEplanRqMzN1?=
 =?utf-8?B?cUUxbitPSi9yOTlBL1RoWXJrcU1PMHRsUld2cVowWEpBSitudmg1UnRmenhX?=
 =?utf-8?B?QjRJVWtVYVZxOEJNbEJGVzdCTzVOU3NYZXc2cjgvdk9LZFFSZ21hS29BWEtT?=
 =?utf-8?B?Y0s4QmhZNGRPKzlleUQ2OVdqZVFuQWF0UE9hYlZXckV5Vi9adkZFcVpSbm1J?=
 =?utf-8?B?UkQwN2ljZHlVVTk0T1RzalJkcjZBdFp3Z0dkY284RWYwa2FxVFR3WkgvSS9w?=
 =?utf-8?B?VjVnYVFrS0pCRUlyTGhzdDlqN0pSdXhiQ0MyMHorQ05qdjIwNGRvOUoyUk5y?=
 =?utf-8?B?eDNrb2VHL3hHZnRwUkNMZkxrOTNuUmtoYzJrVjNYdG93ZitIUmdxdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a382e7-2e40-463a-81d4-08da12fbe067
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 09:50:23.8411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iBpu9gf0yvNU54SvTOiJRfWsZvFHcPeiQF36/CvmmGhWaGf/+B0jWOKtleyVf6bCRSc4CICPq8BclmkpGG7OpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9650

Replace most LEA instances with (one byte shorter) MOV.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -60,7 +60,7 @@ video:  xorw    %ax, %ax
         call    mode_set                        # Set the mode
         jc      vid1
 
-        leaw    bootsym(badmdt), %si            # Invalid mode ID
+        movw    $bootsym(badmdt), %si           # Invalid mode ID
         call    prtstr
 vid2:   call    mode_menu
 vid1:   call    store_edid
@@ -113,7 +113,7 @@ mopar2: movb    %al, _param(PARAM_VIDEO_
 
 # Fetching of VESA frame buffer parameters
 mopar_gr:
-        leaw    vesa_mode_info, %di
+        movw    $vesa_mode_info, %di
         movb    $0x23, _param(PARAM_HAVE_VGA)
         movw    16(%di), %ax
         movw    %ax, _param(PARAM_LFB_LINELENGTH)
@@ -133,7 +133,7 @@ mopar_gr:
         movw    %ax, _param(PARAM_VESA_ATTRIB)
 
 # get video mem size
-        leaw    vesa_glob_info, %di
+        movw    $vesa_glob_info, %di
         movzwl  18(%di), %eax
         movl    %eax, _param(PARAM_LFB_SIZE)
 
@@ -189,7 +189,7 @@ no_pm:  pushw   %ds
 
 # The video mode menu
 mode_menu:
-        leaw    bootsym(keymsg), %si    # "Return/Space/Timeout" message
+        movw    $bootsym(keymsg), %si   # "Return/Space/Timeout" message
         call    prtstr
         call    flush
 nokey:  call    getkt
@@ -206,22 +206,22 @@ nokey:  call    getkt
 defmd1: ret                             # No mode chosen? Default 80x25
 
 listm:  call    mode_table              # List mode table
-listm0: leaw    bootsym(name_bann), %si # Print adapter name
+listm0: movw    $bootsym(name_bann), %si # Print adapter name
         call    prtstr
         movw    bootsym(card_name), %si
         orw     %si, %si
         jnz     an2
 
-        leaw    bootsym(vga_name), %si
+        movw    $bootsym(vga_name), %si
         jmp     an1
 
 an2:    call    prtstr
-        leaw    bootsym(svga_name), %si
+        movw    $bootsym(svga_name), %si
 an1:    call    prtstr
-        leaw    bootsym(listhdr), %si   # Table header
+        movw    $bootsym(listhdr), %si  # Table header
         call    prtstr
         movb    $0x30, %dl              # DL holds mode number
-        leaw    modelist, %si
+        movw    $modelist, %si
 lm1:    cmpw    $ASK_VGA, (%si)         # End?
         jz      lm2
 
@@ -240,7 +240,7 @@ lm1:    cmpw    $ASK_VGA, (%si)
         testb   $0xff,(%si)
         jnz     1f
         push    %si
-        leaw    bootsym(textmode), %si
+        movw    $bootsym(textmode), %si
         call    prtstr
         pop     %si
         lodsw
@@ -257,7 +257,7 @@ lm1:    cmpw    $ASK_VGA, (%si)
 
         cmpb    $'z'+1, %dl
         jnz     skip_bail
-        leaw    bootsym(menu_bail_msg), %si
+        movw    $bootsym(menu_bail_msg), %si
         call    prtstr
         jmp     lm2
 
@@ -266,13 +266,13 @@ skip_bail:
         jnz     skip_pause
         push    %si
         push    %dx
-        leaw    bootsym(menu_more_msg), %si  # '<press space>'
+        movw    $bootsym(menu_more_msg), %si # '<press space>'
         call    prtstr
         call    flush
 1:      call    getkey
         cmpb    $0x20, %al              # SPACE ?
         jne     1b                      # yes - manual mode selection
-        leaw    bootsym(crlft), %si
+        movw    $bootsym(crlft), %si
         call    prtstr
         pop     %dx
         pop     %si
@@ -283,9 +283,9 @@ skip_pause:
         movb    $'a', %dl
         jmp     lm1
 
-lm2:    leaw    bootsym(prompt), %si    # Mode prompt
+lm2:    movw    $bootsym(prompt), %si   # Mode prompt
         call    prtstr
-        leaw    bootsym(edit_buf), %di  # Editor buffer
+        movw    $bootsym(edit_buf), %di # Editor buffer
 lm3:    call    getkey
         cmpb    $0x0d, %al              # Enter?
         jz      lment
@@ -315,9 +315,9 @@ lmbs:   cmpw    $bootsym(edit_buf), %di
         jmp     lm3
         
 lment:  movb    $0, (%di)
-        leaw    bootsym(crlft), %si
+        movw    $bootsym(crlft), %si
         call    prtstr
-        leaw    bootsym(edit_buf), %si
+        movw    $bootsym(edit_buf), %si
         cmpb    $0, (%si)               # Empty string = default mode
         jz      lmdef
 
@@ -373,7 +373,7 @@ mnusel: lodsb
 lmuse:  call    mode_set
         jc      lmdef
 
-lmbad:  leaw    bootsym(unknt), %si
+lmbad:  movw    $bootsym(unknt), %si
         call    prtstr
         jmp     mode_menu
 lmdef:  ret
@@ -424,13 +424,13 @@ setmenu:
         jmp     mode_set
 
 check_vesa:
-        leaw    vesa_glob_info, %di
+        movw    $vesa_glob_info, %di
         movw    $0x4f00, %ax
         int     $0x10
         cmpw    $0x004f, %ax
         jnz     setbad
 
-        leaw    vesa_mode_info, %di     # Get mode information structure
+        movw    $vesa_mode_info, %di    # Get mode information structure
         leaw    -VIDEO_FIRST_VESA(%bx), %cx
         movw    $0x4f01, %ax
         int     $0x10
@@ -497,7 +497,7 @@ inidx:  outb    %al, %dx
 
 setvesabysize:
         call    mode_table
-        leaw    modelist,%si
+        movw    $modelist,%si
 1:      add     $8,%si
         movw    -8(%si),%bx
         cmpw    $ASK_VGA,%bx            # End?
@@ -656,8 +656,8 @@ mode_table:
         orw     %di, %di
         jnz     mtab1
 
-        leaw    modelist, %di           # Store standard modes:
-        leaw    bootsym(vga_modes), %si # All modes for std VGA
+        movw    $modelist, %di          # Store standard modes:
+        movw    $bootsym(vga_modes), %si # All modes for std VGA
         movw    $vga_modes_end-vga_modes, %cx
         rep     movsb
 
@@ -665,7 +665,7 @@ mode_table:
 
         movw    $ASK_VGA, (%di)         # End marker
         movw    %di, bootsym(mt_end)
-mtab1:  leaw    modelist, %si           # SI=mode list, DI=list end
+mtab1:  movw    $modelist, %si          # SI=mode list, DI=list end
 ret0:   ret
 
 # Modes usable on all standard VGAs
@@ -681,7 +681,7 @@ vga_modes_end:
 
 # If the current mode is a VESA graphics one, obtain its parameters.
 set_current:
-        leaw    vesa_glob_info, %di
+        movw    $vesa_glob_info, %di
         movw    $0x4f00, %ax
         int     $0x10
         cmpw    $0x004f, %ax
@@ -692,7 +692,7 @@ set_current:
         cmpw    $0x004f, %ax
         jne     .Lsetc_done
 
-        leaw    vesa_mode_info, %di     # Get mode information structure
+        movw    $vesa_mode_info, %di    # Get mode information structure
         movw    %bx, %cx
         movw    $0x4f01, %ax
         int     $0x10
@@ -715,7 +715,7 @@ set_current:
 # Detect VESA modes.
 vesa_modes:
         movw    %di, %bp                # BP=original mode table end
-        leaw    vesa_glob_info, %di
+        movw    $vesa_glob_info, %di
         movw    $0x4f00, %ax            # VESA Get card info call
         int     $0x10
         movw    %di, %si
@@ -772,7 +772,7 @@ vesa2:  pushw   %cx
 
         addw    $8, %di                 # The mode is valid. Store it.
 vesan:  loop    vesa1                   # Next mode. Limit exceeded => error
-vesae:  leaw    bootsym(vesaer), %si
+vesae:  movw    $bootsym(vesaer), %si
         call    prtstr
         movw    %bp, %di                # Discard already found modes.
 vesar:  popw    %gs
@@ -917,7 +917,7 @@ store_edid:
         cmpb    $1, %al                 # EDID disabled on cmdline (edid=no)?
         je      .Lno_edid
 
-        leaw    vesa_glob_info, %di
+        movw    $vesa_glob_info, %di
         movw    $0x4f00, %ax
         int     $0x10
         cmpw    $0x004f, %ax


