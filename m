Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A85284CBB5D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 11:30:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282976.481854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiiQ-000101-LS; Thu, 03 Mar 2022 10:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282976.481854; Thu, 03 Mar 2022 10:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPiiQ-0000xQ-Hq; Thu, 03 Mar 2022 10:29:46 +0000
Received: by outflank-mailman (input) for mailman id 282976;
 Thu, 03 Mar 2022 10:29:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPiiP-0000wq-3u
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 10:29:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d224897b-9adc-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 11:29:35 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-3vD6Q7IiMjKUUupLRfXDHw-1; Thu, 03 Mar 2022 11:29:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB6273.eurprd04.prod.outlook.com (2603:10a6:208:137::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 10:29:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 10:29:40 +0000
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
X-Inumbo-ID: d224897b-9adc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646303383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zxdVnvz+c2SHHYvOs6cmyghwHudMHQTNZOW7jSknUPM=;
	b=hxqWsJKmyRwlUrGUsnTYJhuydhuVp2XoKQUnEMtgNVupNbhNlTfL1Syh9StTude1u1ZbNy
	6gVUOWk4KC35bWm6Bool/mfZPyEdlYoC/dyyhFxIo7HOd/2CMjmsWVnNkMfrX/OYlqjTpb
	2DAYWwAWE2p8e36b1w0KNYDOcPK3c8k=
X-MC-Unique: 3vD6Q7IiMjKUUupLRfXDHw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aotuCZfEtHOKbD+70g3fzEHLJBiBdwnlF9eEKSuZzUFWHd+bp4K78yCTh4LRg5XaGiYLt8q6nilI6b8mxWrRomBxh+EQYiyOmbKNVzytOSCvTygb+/CaRceL4a+Bk/k4QwTovktfIz1KlcIB/7b3Sgvm302iz5bHPmcLxUsFWWNY70G76zi02MZlxpfFszufGw6OQePtf3YRxHQ4tXPcZ0LIVAkLvdocdHIX99FP5V+FkrApjEEn9YpY4S09sGXUg32pDpsftVTo8OJPS36ish4WhBfCHD+oC41oZ/uxLPzry5TwzDdE0jlu3zC/TAyoncsP83/Dkchnw6K50/Xw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxdVnvz+c2SHHYvOs6cmyghwHudMHQTNZOW7jSknUPM=;
 b=KQSmOf1YV0Z7H1h1Sk8uaxI+MISwNwZfJaNkI2dtTaUWfgJlyIXHUrxkn4IQ4ZhNsvbKT7sJLWxpnclis6STw2r4rzHclXi5qQfiBA/595wfG6EPuZ9fSm3X62UusPn+YOQKqE2I+pSBdg2/OMgKNFoxetfPSZ3bRZpSqYLrGmKW18XctB2WHsqgmqOvMkzCS1n/GiiSgvL4Kw/TieK41OIEwWo5m+zTmNaQGBnGb0psu0UgMjFPRnkyyHezWOKnMOqSEwhcKAyK1e3JTbNQ9kHHKj4AMfHv8TYf8KdxCLIgGyBAo5KOT5yC0MeCSEHbjjpZ97qHthsJAqqhNujb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2d0bed19-bf52-e934-0a5a-c424ff6e4db0@suse.com>
Date: Thu, 3 Mar 2022 11:29:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [XEN PATCH v9 23/30] build,x86: remove the need for build32.mk
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
 <20220125110103.3527686-24-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220125110103.3527686-24-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eefa64ba-25d8-4431-d0ce-08d9fd00b959
X-MS-TrafficTypeDiagnostic: AM0PR04MB6273:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6273D6BCD858F930F52C4ADEB3049@AM0PR04MB6273.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	//8PjCTy+PRcT8VNH8XplvJ0UknSdH6YUZvJDvIAQOqkhK0qQXlN1CsHUNaIsqh3CjkN6Kkcyl8QQ0+Rx3rrK/gm/xm2XoUzWNjBJAAJ7aYJFR8PA4ORHaWbJGaUJEKIejzBjyj4hKOaTshJBqS8U3JdH38cdTb6g/hga7sCeR+adCkVZcJAk2WZVhPdiWAz5Iw7dUvGkFDb0CDJJwJo7g2g25o9N0DEQz9V70aVRlzt1TP+sMylM2Y0pe4Sf3Fm2ruo3fNmWxpd2EcWh2zeII47VsYMh9b/bPk2sLWWd7HuMM0rGPnDpKZlHbz4tGsKQXSGofUtBvJlpPWGJKdH0fNMVgUO9MdH+jb05Qhvi0yNEFsXc3wjYzMGr++PjGIYqxeBO4SDAxoqHzwVx0y1GBvYO+F04S5pdGqPYHmsqvGXFj9xk+zVro/9buWkhtzguWQFNhrU0N2SAI8fd655B3dz+S7bjbFxElkYNz9qFskdvnHThnVTLZyJs/EbsE92JA6rESlfyLQrDcGjBR61etntb9Ux33oIZdnB+r5TqFyw7y7nILqdeGAdPE+HStrY8KECRq2hMXE7Otm7lemwU+qFVtBd03V6M1eIaw4cFCsnGNqw5mORKbX0XDI6RojpRnG8DPqamc3fk82RwX25BkTp7gm6ZkXVhN16AGd3zGP1pGlynFoY+Aj1ZznZ5Tni2LCQCTBLWlFgluoQVi2ouJPuYg1LCSi10zqsL/0PESg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(36756003)(26005)(86362001)(186003)(2616005)(6916009)(54906003)(316002)(4326008)(66946007)(66556008)(6506007)(6666004)(6512007)(66476007)(8676002)(53546011)(6486002)(508600001)(31696002)(31686004)(2906002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUQzcTBTZjI0U1BPZUxKakZ1T3BBaXhOd21uQ2ZQc2oxNlVsRnB0TC9TSTFl?=
 =?utf-8?B?aGp4YTFXbUplTmwvK21WQUFlZWJRS0I5aDQxNFZIY2M5b013d2ZMelZ5TjhM?=
 =?utf-8?B?Ry9ib0JHOVRlVUpxTGI0M0VDcW45MndiZDg0MVdmVmFrM2czbkE5NEZjbUMz?=
 =?utf-8?B?VXhJbm1Sak5lU3ZuZzZpZ0EyWmluTGpVaThUY2s1T3dxZ2VUT1NDb1hrZ0lO?=
 =?utf-8?B?MXdNS3pNV2VDWDNpeDY2dUY0K1lnTmV3UGh6U09sbS8wVkZ0bzNCZjlLUVBx?=
 =?utf-8?B?UENXbHlGb254YTZHK215dFo5YllQWVExSGFzdnloWnREM0dHNHpqVnFnQk9u?=
 =?utf-8?B?dHVXb3lGVHBKelVBR0kwS2RtR2ZyTFNVckErR0t3QjlmNXJTdHE5cUZMOXZP?=
 =?utf-8?B?eVpOUkxpYTVJcHJVNVNjTEhTY3NVdFJMYmJadWtvcU1GTU9pa25Va00xZ3Q1?=
 =?utf-8?B?SkZNU1RRS3BZK2VvT0o2a0w4TjFQRlNFTFFoUTBmbHpCNDM3bkVRMkJQSVpo?=
 =?utf-8?B?dHNIQnRiQWlmNDgraTNpY3p6cTBIcHNLTlRUcnM3RFN6Vmx6Qi90Nzh6dFMx?=
 =?utf-8?B?TU5yOHdvb3ZRaGJvVUUzSTlQUGRKYjdrc0YxT3BpcXQvUWlDcTZ1SklqMS9E?=
 =?utf-8?B?dGlZY0w1WVA3V3o4ekdJa09iSHljTXB6MERSRXIwN05jd2tEY2FrRC9jT2Uz?=
 =?utf-8?B?TER6RVpyR3ZLaXpQWkRMOXBqNWVtOXFDWGpCRy82aURWVFEwVVExUm8zYXNh?=
 =?utf-8?B?YVhMNmVmb0hLTzdaRHlyTnlmSEZHSjdNYStUbllSdDhpa0QvWWJLVEtCTkFW?=
 =?utf-8?B?QjBJTk1jeUI0OXZiNzF4WUludXd4ZUd3bzRpbmpvR2lzV3ZqV2tRMURNdzBC?=
 =?utf-8?B?ZFNFQ00yMTM1SUFGQzdZMTd1MVg1c1htMDd4dWN6b1o2YTBlSGxuVUhYVkdm?=
 =?utf-8?B?U1FLUWxGL3EvbFl5VUZBNG1tL2VocmxQcGxEWU1KOUNaWGUzYU13OWJIc3Ju?=
 =?utf-8?B?YTBLaUpISy85R2c4MnJPSlVlTlEwbzFoWk5uUFh5WUxKR1QrZHYxYjZpbEM3?=
 =?utf-8?B?Q1dMVVlmZVVGT1pJSmZ2Vkg4VHAwRmpCNXU1MjNTL0pteEJHaUdXa0tGcHkr?=
 =?utf-8?B?bm9EN2g4Q2pIaTMzMWpseXdJaUxCQm00dWdTOGF2ME4velRCVmdBUHUyekRF?=
 =?utf-8?B?QVBrT1JyZUt6RmdGRzZGZEVra3BJRDNQMDA1VmRDOUloWkdEdVNTcGJXSTBv?=
 =?utf-8?B?QmNiL2dneS90N3ZPVmtiSjRDNEtDOHh2WG90b08zL1g1cHhZT3J1MGRKLytJ?=
 =?utf-8?B?RkpSaEhOM0VHTTAwNVQvUGdBUmZVWmI3YlQraWlYeTl5SU9zejRJLzJoa3Nl?=
 =?utf-8?B?aVQ1ODNiS09uZG00SGJMN09SSzlScndIdWVsOXByd1lBWFEzeUdTLzYxTUk3?=
 =?utf-8?B?ZDc0TTZURUc4RTRDTmlld0hPakJIb0dyZllGaXJCZjNZRlpEUG45VE9LOGp3?=
 =?utf-8?B?R3QzMTRGMzU3RDg0WXRHQm4vNWNObFlPZTVuWVVpRWtteFU4clVYZ2NwTmR5?=
 =?utf-8?B?Z2I5bW5WdE1LaGNOWWJXUEphSmIwN0dEZmlGcEJTTkw2ZUs3eXNMZzM5dCtC?=
 =?utf-8?B?NHd6bTEvek1kWllRTlNCalpkYUx2bTFMc2xhNVliT0lnaWNTMHlGa3R2allG?=
 =?utf-8?B?Q3h5M1hFYVZMNVUycjg2ZDRCbUlrOFA4dkxrTzAzd3JuendyMmlwUHloZStu?=
 =?utf-8?B?NWl0eTZlczJva3FmblUxaDFaVnFZdXRiZEU4SG1mUFVTM3lMMm9nWm1HQ2pu?=
 =?utf-8?B?WU5jWThpekJ5d1dnZ1pXeXpLdnlHN0xQMTBjeU5XWGVGbkpsS1p0VSsvdW56?=
 =?utf-8?B?Zk5VRXMzSW5SYjVaeWZyUEtlK3RoV2FLajBGZ3VIbHlkeXpXMUZTYWlRQXBz?=
 =?utf-8?B?bHNKU2FFRTRUMC9RN1pNbDVxYStKeXhZbGlVNkRYZlA2SmJqNjk0MFMzaGpL?=
 =?utf-8?B?c3lPMSs3QUQvb1Q0c2Q0bGZDeUFFcVVmRldHcjV3SVZhVk9TbWFIR1MrWWM5?=
 =?utf-8?B?YUNsK2JSN1MxQVM0SXhaeCt0aXBWVU5NMmdkTmQvdlNLbkI4WkkzY0srUmRv?=
 =?utf-8?B?TmQ0UU12Z0swQThHT2JsOHc0WlJxZGhocklrSHlsWjI4dXhLWlJ5cDJKeGZi?=
 =?utf-8?Q?hN1kwMSMBT1H/0+lG+Pebes=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefa64ba-25d8-4431-d0ce-08d9fd00b959
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 10:29:40.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VF38fihEMc5MYy9jU3vgDlhrb0wQKgSLhCArNsReESm93cGFmpKA2qIJN96fAwtSQkE3oPsaIXXcW25YNuao+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6273

On 25.01.2022 12:00, Anthony PERARD wrote:
> Rework "arch/x86/boot/Makefile" to allow it to build both file
> "cmdline.S" and "reloc.S" without "build32.mk".
> 
> These will now use the main rules for "%.o: %.c", and thus generate a
> dependency file. (We will not need to track the dependency manually
> anymore.)
> 
> But for that, we need to override the main CFLAGS to do a 32bit build.
> We introduce XEN_TREEWIDE_CFLAGS which can be reused in boot/Makefile,
> and avoid the need to reparse Config.mk with a different value for
> XEN_TARGET_ARCH. From this new $(XEN_TREEWIDE_CFLAGS), we only need to
> change -m64 to have the 32bit flags. Then those are applied only to
> "cmdline.o" and "reloc.o".
> 
> Specifically apply the rule "%.S: %.bin" to both cmdline.S and reloc.S
> to avoid make trying to regenerate other %.S files with it.
> 
> There is no change expected to the resulting "cmdline.S" and
> "reloc.S", only the *.o file changes as their symbol for FILE goes
> from "cmdline.c" to "arch/x86//cmdline.c". (No idea why "boot" is
> missing from the string.) (I've only check with GCC, not clang.)
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one question, just to be sure I understand things right:

> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,25 +1,42 @@
>  obj-bin-y += head.o
> +head-srcs := cmdline.S reloc.S
>  
> -DEFS_H_DEPS = $(abs_srctree)/$(src)/defs.h $(abs_srctree)/include/xen/stdbool.h
> +nocov-y += $(head-srcs:.S=.o)
> +noubsan-y += $(head-srcs:.S=.o)
> +targets += $(head-srcs:.S=.o)
>  
> -CMDLINE_DEPS = $(DEFS_H_DEPS) $(abs_srctree)/$(src)/video.h \
> -	       $(BASEDIR)/include/xen/kconfig.h \
> -	       $(BASEDIR)/include/generated/autoconf.h
> +head-srcs := $(addprefix $(obj)/, $(head-srcs))
>  
> -RELOC_DEPS = $(DEFS_H_DEPS) \
> -	     $(BASEDIR)/include/generated/autoconf.h \
> -	     $(BASEDIR)/include/xen/kconfig.h \
> -	     $(BASEDIR)/include/xen/multiboot.h \
> -	     $(BASEDIR)/include/xen/multiboot2.h \
> -	     $(BASEDIR)/include/xen/const.h \
> -	     $(BASEDIR)/include/public/arch-x86/hvm/start_info.h
> +$(obj)/head.o: $(head-srcs)
>  
> -$(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
> +CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
> +$(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> +CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
> +CFLAGS_x86_32 += -I$(srctree)/include
>  
> -$(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS) $(src)/build32.lds
> -	$(MAKE) -f $(abs_srctree)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
> +# override for 32bit binaries
> +$(head-srcs:.S=.o): CFLAGS_stack_boundary :=

You overriding CFLAGS_stack_boundary but not object_label_flags is
merely because the latter has no (unwanted) effect on the compilation?

Jan


