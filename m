Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8110440C661
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 15:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187638.336581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUvq-0000nL-36; Wed, 15 Sep 2021 13:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187638.336581; Wed, 15 Sep 2021 13:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQUvp-0000kH-UW; Wed, 15 Sep 2021 13:26:33 +0000
Received: by outflank-mailman (input) for mailman id 187638;
 Wed, 15 Sep 2021 13:26:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQUvn-0000hM-Rr
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 13:26:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c64716c6-913d-4a17-9d25-b71c7f5df692;
 Wed, 15 Sep 2021 13:26:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-20-Te282JS8P-ipjAZzefVUmA-1; Wed, 15 Sep 2021 15:26:26 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 13:26:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 13:26:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Wed, 15 Sep 2021 13:26:22 +0000
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
X-Inumbo-ID: c64716c6-913d-4a17-9d25-b71c7f5df692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631712389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=juBJGq4ZapzX50bKGD151YensGcEVFSl2L4HTOV0500=;
	b=EoaUIVEMT1u5h5U6RUBEN0CRLlh/2tpTGZIiAtCpP2XfFOC7VDyPGXk4Cv+w/tJneER/4Z
	GO7SwA7N5JjMLxniwDpJpwugVbmOd0a2L0SJpfvqj2NQWaUDX7ZHMjJ+lzmmuz1YZFB8cn
	lqXqZeJEkHlBdHk+QmBwAWFdAets7Vk=
X-MC-Unique: Te282JS8P-ipjAZzefVUmA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRf6l3iHjaqWdxP6tpBPUBUjDy1cAfswlfIgtIO+WAYxoRsUHmktuHfG6zO4bxb7W5WzcAiW4wR256JzD6bHoOrPv7/lUtTHWv/EzoKKoU8lhNkRqVAU8oZr9854R7IFRBTWyCI/BbXJ8zjksXn7NzmvRMiv2iFLQkyMD4lKChHathqBXezEpVaNEGg2uChGJiY3HvEnuGvlZFf+hvNcgM3nCQcORDIfLIKhpW2pTlceck7kezy3YasKHt0IMWlVSUcil8oPKOrEMUmCAev/MnV4gGUKnbEhNRE8pi95845SIMrAyjfq+LKdO1gGxjS0y1+qVYlE1jtUQyH/Oe2umg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=juBJGq4ZapzX50bKGD151YensGcEVFSl2L4HTOV0500=;
 b=dgQpvmqmrjMVrlsuiOlGbGA6Y7dYwHyGPqy+277Cq9hmHisjAiSfQhmOSEJyRDtzGX/eQDoONargnk7eY21Zi/XPVxAocUD7Hdebu1fZXLNP9D4PkzcXsOIhgf+zboyzdaB+GOBwMGqaNSBvVEfHA5SVNuFww41TBAE2AO10/0GzJu2YEvqDhiSAMgXfEpSAdraTBNbC9KazT1GeYp9hhcM8wL4ugj7lbo9L9Kd/DHIliukC0YrMlJ5He5Ecv7zHNbhiezglrecYwb5a7O6xKRWHjzWCoLG8XxEO9d0Ck0EK8p5/aI/pyjLylo3qAQAzyr8P4WgUv+gvOJwKwGd8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 6/7] x86/boot: fold/replace moves in video handling code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Message-ID: <60ce3c64-53c2-9042-18d9-ff9e569fd4a2@suse.com>
Date: Wed, 15 Sep 2021 15:26:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2dbcc7e4-58c5-5724-6434-51be8acfde35@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67564867-f239-4245-38d9-08d9784c68f0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5327D0D6A4CCFF38741E8350B3DB9@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S5Ht2TRwz5P/eoFQfOSYAHcKk2ekUsJX5xFkUHbWoSPtYJHYSDSncBmQXpGhQDwR2jr9IZBbNhqSqyYEPahGMuulN7jeZXULDpM824XEK0pJkd85oTrCUFyE8TzKmZ/hAPCa8v7rW0FtDcekOO6pwHVntVZ4EHxTwaO8ghQ//vnfPCFYU2xMZo1SXCB9Crv9MG9yPyMrF/if2L7mmwg1xvdrZsGKeGJGplaVR7oR6L1It3d28sDgmohxBVJpiuVUrf2Dy69v2qZzyyEw6CXRJ0O6PX2GPxaEJELHMbmP5lHasC/E6Ld4H64o0ELabJ+QFve+XuooRAudPGE+i+4bPeeDdqEiUkbcMKlEg5PnU3+f74AmhWROIjk5pZvKozJt9wDIcC0GKYUrP4L3D88FWqXq7mZWyrZl6IqYYeJ1AIxfkbi3duk2cv/+UZpWsQGo8El52wqVK81qqpjm8cIWp4dCa2lXNSFu3rf2o2F0QeV7xjXlGI4kQ94jzJ7zjghd+W+9R+5RiaSM8V8ucb2dSqeqvEl1y9y8qmCmc4KDAWwCqVGGUv3ERE54LSd6/aEsx+JP7fpei0PD8zLy8yXpnLUoNAA7V7zKdTvs5SOHYKP8kMlXXNrxYc/l+tReSrMhawCsyRQghAJdRoaTBvH+eg+zS6MxE8tP2O6BuYm4JAP0E33KG1qH/AqJ6N8nhVL9v93bPlini/phF3zucvaKxGHUQlnHpyXU2V4VUWMujEY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(39860400002)(136003)(396003)(6486002)(316002)(66946007)(8676002)(2906002)(54906003)(478600001)(6916009)(8936002)(66476007)(66556008)(5660300002)(956004)(4326008)(86362001)(38100700002)(36756003)(31686004)(26005)(31696002)(186003)(16576012)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW51cks4NE03bXlRbitwcmJ6QWtrUS9XYW9oeUZ3UytUZ212RjJzNkUyKzRL?=
 =?utf-8?B?eGVOMFE4bnpybUc4ZmlKNDJsWmpQa284RUJSNFcxSGl4dEpBR1FKYU5pYTRj?=
 =?utf-8?B?ZXlPWHVpcjY4RDR3eXV3QmcyZ3VqdGRFc0pUbGxhckNKQkR3L1NRT0Zqd0hj?=
 =?utf-8?B?Yys4WURuVXR0WjNBT3pjTkdhZVdkZlBWdlVLQU8rMStjWEFScnZZZmc3cHhZ?=
 =?utf-8?B?QXlJb1VwVzJOMUFpK0hsSmR6eUxGaVZJL0poOGxtSkVUUWVVeEtlOWlUWCtV?=
 =?utf-8?B?TGJyT0NGazlpd2loQXRaRTdYUVA4RkRSUVRiSDRtN2c3TlpvT3lPaTZaZGUy?=
 =?utf-8?B?OHA3NC9XaHVZSm1Kdld4MEpBeGI1RnRGRURCeU1xSXVtTGF1dnlRTG1FS01w?=
 =?utf-8?B?UUZ0T2taNFFHdlZSckVaYkh0U25aU1g0bFFMejk4aW5hMUdXbkM1eGJRRmFO?=
 =?utf-8?B?MzQ2aGR6bTg3U0N6NG5mU1oxQUF4THpMV3p2bWx2YnBPZ0E5VE1heXdBTXRi?=
 =?utf-8?B?TTVKKzMzYkpVZnpvY0RJbzZSazdOZ1JpOU15bDhWZlZvSGh6UUFMZWRhY3dG?=
 =?utf-8?B?OHdvQkZZOGhFaG84S3JrOGlkWjhJVTRHL2xOMDhjbG1qczJWbE5rMng1RnQ2?=
 =?utf-8?B?RWhQbTY1SGV4Vm9mNWxmdmhTL25rWW5PMFI2a0gvalFxQ2xVNmg4R2RiNGho?=
 =?utf-8?B?SExUNTNxdk8vTTdlUkx4SlJpK3J5VDk0cXRuKzlBU1RSMDNwaHNOQURhSnc2?=
 =?utf-8?B?Q1lxWDhoMkpXUjBxTVJXVW1NelVsRFR2K0VSZi9vMi9NTG1HUlg3RVZoeGRE?=
 =?utf-8?B?WTRtalJ6c0lsYkROQkZhQTF5dFY4d3QyNkZDem14aFd0a0dvVm4rbldaTmYw?=
 =?utf-8?B?ME9OaW44OFJCS2M5YnJYT3A5dzNoWUNuU05RSk5YQmZsREhZTzZUZU5mL2dj?=
 =?utf-8?B?ck81SHd4UGQxTlpRZ1hmemdJRkY1RndlYlFWMGVSeDZvbWJrT3o0YlhpYksr?=
 =?utf-8?B?eFVLZFVNaVpPeG8vOGh2bTY1L2JzZC80NWpOcXMrS0VKM0E0SDBCb0JQenZo?=
 =?utf-8?B?Ym9CNTVreGRZSy9lS01aWEZoNDFpZjlsZEo0NzJYdUljY1JsdGlIUjFIcmhO?=
 =?utf-8?B?Y1I0L1dIcUI1V3MwTXZYakQ1TVNFRDV6K0ZBNHBieVlGSEZLWXp2VVRCNU1H?=
 =?utf-8?B?VGdmK284UitObnd2MHdwaHNnbVN3SnZqYkpwMXg1REJ1Y1VlS3BZSTdXYUl0?=
 =?utf-8?B?STVCQlowUzh2V3hpM2dRSjBKbUE2enU1NU8wckk2RVVTbSsrM044T2RkZlZD?=
 =?utf-8?B?TGxELzBkdWJrSGNhNlZhck45bCtCSGdSV2hwZS9zYWY0SjFqTmVvRmdqYkU2?=
 =?utf-8?B?YW9DRC9zcm1nWTN1L3l2c1RTbStDWHlPdkU5Qll0ZlVBcFNoVWNKZWwwNlAy?=
 =?utf-8?B?dzlsdkZTTmMxNGg3aklQRHpVbHQxZjFsazkranFyOWIzNEN4Ymt1QnUvT0Qx?=
 =?utf-8?B?cUEwbVA1QU1UUUlKTjhLSXgyam51aVNVakQxMXp3UnBiRmwwVDBKcUV0VExx?=
 =?utf-8?B?L3dhSVRZZGtXaEY5UkhwbVZSbEUrWmpuV2xXMXI5MEVUTW4wOExKaEVNU0s0?=
 =?utf-8?B?dFVlSzFVaUNKZzJqaU5JeDFjMTBrM0VFYlFhNW8waVd2VkJ2ZXhHZXYvWTVi?=
 =?utf-8?B?ZmZ2S0dNc3NSSWVWZXhOMXFpYlRrZkhMNHZ4VUxMYVYxLzd6ZmlJRUNOcEpr?=
 =?utf-8?Q?XDw55ozUhL8DTJSrp4xRbn8R+ipg9s+wWaBp5ZJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67564867-f239-4245-38d9-08d9784c68f0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 13:26:22.3706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SKC6uvzrGlXiwAwkpBGKsLb5EKv5Q2+lkOn9SInE94k4wAjqFikqs4rrrsRBR/RnCTuR21fC9/uUp9A8TNaTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

Replace (mainly) MOV forms with shorter insns (or sequences thereof).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course there's more room for improvement. For example there look to
be a number of LEAs which really could be MOVs.

--- a/xen/arch/x86/boot/video.S
+++ b/xen/arch/x86/boot/video.S
@@ -121,8 +121,7 @@ mopar_gr:
         movw    %ax, _param(PARAM_LFB_WIDTH)
         movw    20(%di), %ax
         movw    %ax, _param(PARAM_LFB_HEIGHT)
-        movb    25(%di), %al
-        movb    $0, %ah
+        movzbw  25(%di), %ax
         movw    %ax, _param(PARAM_LFB_DEPTH)
         movl    40(%di), %eax
         movl    %eax, _param(PARAM_LFB_BASE)
@@ -135,8 +134,7 @@ mopar_gr:
 
 # get video mem size
         leaw    vesa_glob_info, %di
-        xorl    %eax, %eax
-        movw    18(%di), %ax
+        movzwl  18(%di), %eax
         movl    %eax, _param(PARAM_LFB_SIZE)
 
 # store mode capabilities
@@ -144,14 +142,11 @@ mopar_gr:
         movl    %eax, _param(PARAM_CAPABILITIES)
 
 # switching the DAC to 8-bit is for <= 8 bpp only
-        movw    _param(PARAM_LFB_DEPTH), %ax
-        cmpw    $8, %ax
+        cmpw    $8, _param(PARAM_LFB_DEPTH)
         jg      dac_done
 
 # get DAC switching capability
-        xorl    %eax, %eax
-        movb    10(%di), %al
-        testb   $1, %al
+        testb   $1, 10(%di)
         jz      dac_set
 
 # attempt to switch DAC to 8-bit
@@ -164,17 +159,17 @@ mopar_gr:
 
 dac_set:
 # set color size to DAC size
-        movb    bootsym(dac_size), %al
+        movzbw  bootsym(dac_size), %ax
         movb    %al, _param(PARAM_LFB_COLORS+0)
         movb    %al, _param(PARAM_LFB_COLORS+2)
         movb    %al, _param(PARAM_LFB_COLORS+4)
         movb    %al, _param(PARAM_LFB_COLORS+6)
 
 # set color offsets to 0
-        movb    $0, _param(PARAM_LFB_COLORS+1)
-        movb    $0, _param(PARAM_LFB_COLORS+3)
-        movb    $0, _param(PARAM_LFB_COLORS+5)
-        movb    $0, _param(PARAM_LFB_COLORS+7)
+        movb    %ah, _param(PARAM_LFB_COLORS+1)
+        movb    %ah, _param(PARAM_LFB_COLORS+3)
+        movb    %ah, _param(PARAM_LFB_COLORS+5)
+        movb    %ah, _param(PARAM_LFB_COLORS+7)
 
 dac_done:
 # get protected mode interface information
@@ -504,7 +499,8 @@ setvesabysize:
         call    mode_table
         leaw    modelist,%si
 1:      add     $8,%si
-        cmpw    $ASK_VGA,-8(%si)        # End?
+        movw    -8(%si),%bx
+        cmpw    $ASK_VGA,%bx            # End?
         je      setbad
         movw    -6(%si),%ax
         cmpw    %ax,bootsym(vesa_size)+0
@@ -515,9 +511,7 @@ setvesabysize:
         movw    -2(%si),%ax
         cmpw    %ax,bootsym(vesa_size)+4
         jne     1b
-        movw    -8(%si),%ax
-        movw    %ax,%bx
-        movw    %ax,bootsym(boot_vid_mode)
+        movw    %bx,bootsym(boot_vid_mode)
         jmp     check_vesa
 
 # Table of routines for setting of the special modes.
@@ -773,8 +767,7 @@ vesa2:  pushw   %cx
         movw    %bx, 2(%di)
         movw    0x14(%di), %bx          # Height
         movw    %bx, 4(%di)
-        xorw    %bx, %bx
-        movb    0x19(%di), %bl          # Depth
+        movzbw  0x19(%di), %bx          # Depth
         movw    %bx, 6(%di)
 
         addw    $8, %di                 # The mode is valid. Store it.
@@ -901,8 +894,7 @@ gettime:
         movb    %dh, %al                # %dh contains the seconds
         andb    $0x0f, %al
         movb    %dh, %ah
-        movb    $0x04, %cl
-        shrb    %cl, %ah
+        shrb    $4, %ah
         aad
         popw    %cx
         ret
@@ -959,8 +951,8 @@ store_edid:
 .Lforce_edid:
         movw    $0x4f15, %ax            # do VBE/DDC
         movw    $0x01, %bx
-        movw    $0x00, %cx
-        movw    $0x00, %dx
+        xorw    %cx, %cx
+        xorw    %dx, %dx
         movw    $bootsym(boot_edid_info), %di
         int     $0x10
 


