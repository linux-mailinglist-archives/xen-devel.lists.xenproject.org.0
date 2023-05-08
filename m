Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311EC6FB0B2
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531547.827308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw0S6-0002bR-Gl; Mon, 08 May 2023 12:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531547.827308; Mon, 08 May 2023 12:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw0S6-0002aT-CQ; Mon, 08 May 2023 12:58:54 +0000
Received: by outflank-mailman (input) for mailman id 531547;
 Mon, 08 May 2023 12:58:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pw0S5-0002aJ-4r
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:58:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1437805a-eda0-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 14:58:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8674.eurprd04.prod.outlook.com (2603:10a6:20b:429::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 12:58:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 12:58:49 +0000
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
X-Inumbo-ID: 1437805a-eda0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqWCsZ3wiHEq++gmGNGyHg3Vhmx0W7jmgW0yyPO2i7+uf/UQT2O4dQo4YpsDZ5hVNpexIYKY780zIAsjXcr9qRO2F6Z4XCcRHLWbcuwAjPwfm2KPp8RdaPKAsIxWn4oEtR7K1qRgXqEfYxaAoAo463xk8N2+2QEUg1eQ8REoRnO2uMV0sOzUdl6StiBy1mGtHPnvpw9+UmHaNOVWV//Vthj4I15tng3G5/SE7zuYEYVOk9cVYRGdTF9CqahG9cIuX/2BjRBnhcX3njR4RyvYo8IRKbrlfFo+OBq5qktAFtrh6yXeNOnxrZgwo36tI8u38yo6kfev/5ok8XD4CiU7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHHkwJRRJgd96xEOMAOZhq2iePtG+6G1NYpCQL/zg1U=;
 b=kIpnEUTTqWCEgkJZWBta46WAgUEk2hAXj78hfhnn/Rs0fCeLY5kyiIfEwqNx0FQcaEudWIGI6b26Y9Nef/y8KZ47rKIL23kFa+mDY6ypTXU4m84bVrSzXNPJcihmFwSdasDL0YdP3Krw5VribuoyfChU/+7G/X0Yz0pUarWt3ny/lI69MSDBtPWJ9yMruo3+VSDzKj59grs97voQeEM9qV2IuKNh0ADHcmwKV55+XHJqcm8UY2gcKt+jVfdKT6p2ZAcBU4Y2iKqL13qmFGbMl3Xu53gqTKlh8a9WYiM5B5zSOMyU69IPVcYiB2BqVttoUptpld1d88qz3Xpk8V9dlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHHkwJRRJgd96xEOMAOZhq2iePtG+6G1NYpCQL/zg1U=;
 b=5zgk+P+vClAQrjKkL+zGFmZMjg+N0Y87gBYJ4nEBNLPKD/W/m3F7t683lncQVOw/z5h7rcJLACtUe6WkXQeQvEt9utJ8DHBCncQx6jBSYrrxMaiCSOL8xKi4JkfCVEEfu9zY+NYDtX52YMUDw0Gp3ei3tHjj2lXOTe0XObNSTdAb4V+Pvpj5+AIHONHSxWPkjsL/3nOHzskr0S2+EvorLpfJpKKlW1iynUSQTqFT/ReFc4sKqOpj+cTeLgd0I/BGSoj1Kdqb1a4H8F/MJfOxHzwHexXBY8uMr0/aBk1a/JpAJ6Gt3BU8hixmSr1OET1WdyDgKqX0EONnwRsseueJIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bc7544b-659f-4c09-f54d-647641483605@suse.com>
Date: Mon, 8 May 2023 14:58:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 2/2] build: use $(dot-target)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <a261b10b-25e4-3374-d6c4-05b307619d81@suse.com>
In-Reply-To: <a261b10b-25e4-3374-d6c4-05b307619d81@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8674:EE_
X-MS-Office365-Filtering-Correlation-Id: cb520c61-304b-4e10-e692-08db4fc3f796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+qcLVVbR2tPQvT/Hwjz1Tf79eKVRjPm75hAUbw2M9KbIVeViFSRSuL2kj3xsGGAesHdxJurjZd/rItXUqgB2FBrxy6/LcaY4unMxwEjVqCAaGDa+2L5UXOOZGkyoBfFVlHcEHl1WauJLBA9ZTXYsQUMRGBrmcQqA73j2nlc2RZSfuhlJ8o4dkCm64Hadv2MQdvGZ65dUEl5QaRIPSfBVhyKYJVE4IvqY8GOSqgHOxn/HFFUHsRa/lunvp1kh8BSWkN25O0XOpSReZMdlXua0LaMELicgYjnHPosDj/UEghmk0eEWuUB9ARH4N+Vs121KRgrsbNzdIQFdv2u1dGq9mbC23K43b/yFdtz+ewmjQiLsHwIMVB1cqfoFpIUYYz46LKZuB7R11RvtNmodIsHgQm/0fG7AdwUv4Ee/DHcuDJAPyEV27wgvz9EZkrOmPPvTwnQ2mWMygw38TyQJGxmK+TW/8ZIvM9UMv4V+g+YBQyF40b4KkI5NRObQmAsGt5lBryy4Vxoy4zRoYYcVF8GRBwd+W9vVtvZMGbN0NBtJUz4ytyGV8NTAFFpWpjHiz2vYDrxhNwuXO+Ufmzdo3uDkqW/h0llGFzkTUhoO2m+11btDg/NEX75sWpiAuTzJic0IUAr9Gy5d3lP6KWUPdjQ1oQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(31686004)(54906003)(2906002)(8936002)(8676002)(316002)(478600001)(6916009)(4326008)(66476007)(5660300002)(66556008)(41300700001)(66946007)(6486002)(6512007)(26005)(6506007)(186003)(36756003)(2616005)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjQvOUVCWVNpVmZrVHFobDlFNHlpMmJBYUgyL20vRUxvUTlIUmRjTC92MDkv?=
 =?utf-8?B?OGM4Z3JiV1BQT09PLzhTcFBMSXdxbkw1SUFSTWx3RHJyZGtXTHg0OGsydGJj?=
 =?utf-8?B?WjlqMkF5SlhJaHk4THRCb3NvcVpSWXpzMjJmc3NRLzZrTHk3dnhKMmlYUjQv?=
 =?utf-8?B?YXpNZm9Wd09HNnZ1T1BoeHRxWXVxWERvMlZjMjltNmxyTW1YZjBhWE5FV2Zw?=
 =?utf-8?B?SWI1M3VZTVQ1QUFvZUxXdlJEK1NtYUJyNVF1bElwSUxnd3AyNDVMdW1KQnlC?=
 =?utf-8?B?Rm4vZmdFRzNhUytGaDVhS1lDSWFWcWMrNzlRcVFvcUVmekFPaE9BcmdjdEZT?=
 =?utf-8?B?ZnN0eG5jKytCRlNHZkhQTGl2Q3NiSWMwcUlPMWxMd1Vra0s3RzVFQ2s0M1Z6?=
 =?utf-8?B?UzY5TmVzaEtBY0ViZkdOekkybGdmeFFCejRVSWxHU2RjaFRzc1hobWJGaloy?=
 =?utf-8?B?MXVYRzFObHE4ZDdNbGNMTUtyeW9RckF6dFFwWlhKenR3S1p5T1dQa0RTem5P?=
 =?utf-8?B?Unc3Zm4yOFlSN0Y5VjFGUjN5MkhFSXgzM0Y1T2V6c0doU0s1UExpbjZ2SGsv?=
 =?utf-8?B?b3hiSmZFV0xwV3NqSlBGR211Y1V3d1ZYYTVGdmdHMkRaOHJxSDQ5cHhWbkJr?=
 =?utf-8?B?M0ZlTVBaWFl2dzdDMmNjUTBmT3BvaEZFdEdxWUFuWEc5d2Q2cWp0dDQxclFN?=
 =?utf-8?B?RHg3UzN4bkQ2TGdBRGhjaVFsZlJnMGNzN0t1bmpZSzhROUYvZjlwelF0VXU4?=
 =?utf-8?B?cVVBaGNVdDI1MWY5VE1xYWF4Y3hDdnU5ZkZHdXMvMUxCVmh2b0grNk8zUHVm?=
 =?utf-8?B?SVd2ekRYRkZhZmRaeFZQcEg0RTFtd1FQbXA0VUFGSzByaE1pSXJsa2VjVGJP?=
 =?utf-8?B?YVVQcHBqSEhCQ3JwMWVwT2NJS2FOTUlJbVNlT2dDRnpnS2wrcDJ6Zmk1WlZV?=
 =?utf-8?B?eUpwNG9OemFIK09NMHY1OTVqd1R4OE1HcUQyWHRlYkV1cUQwYmFGWG5EeEZM?=
 =?utf-8?B?ZlJDY2xpWUdaR0pqaGxkY05wcFU0K2R1RUhpdTkwa083TkhzenRoOHN4RXFX?=
 =?utf-8?B?aUF2Nk5VUlRqblNsSWRyVWhBZTllbi9LU0o5WVNjSmN4OVhsWUNObGNLRTRr?=
 =?utf-8?B?Qll5VkpybHFSVjFVNFlLRVl6TzNzai9VSWgra0dmVklmSlIwVVUyZkx5MDB6?=
 =?utf-8?B?Q3Y3NVo2d0h3dkIrVmpwYmY4cW1JV1lCU1R1bThOZ1paWjZDZ09GaGxGeHFp?=
 =?utf-8?B?STZlcHp0SVJEeU85V0VPVHFVMG1aTmRqTWdUQ2Y0OVB1VEswU1ZBZDBXQlhm?=
 =?utf-8?B?QVJTMXpxMGo2em5QWDZzeW8wSUNqNk5PYzFXMEFyMjlWOVBSYmMyWDJGdWlX?=
 =?utf-8?B?eW5CZ3RWdjJTcmpxdnF4UUtXUUsraXduNUR4ekZCV00wSk95SmYrcEFNbnhM?=
 =?utf-8?B?M1pFZmJUczhZS0RNakNpZlZ5U3RHR1BWaVo3RkdJbm5ITldTZW1qN2c4YkRH?=
 =?utf-8?B?MUdlS0d0T1JIdkc5cE5xTHBWMDhnT25oRzcxdXNUaUpmQ2lwR2ZTR1pocFJv?=
 =?utf-8?B?MUFETHBsSlh1NkVvVnp2eng5cjI4MW5pd2lKYTZzTVRsYmN2VmVxd081QU5I?=
 =?utf-8?B?TlFMTWpVR1JxT1FvZDhFaEtFWnNTUzRLaEdoYm9GdlFEMkpDamJOYkxBaE8z?=
 =?utf-8?B?OEwwR3NoakZaVDlMNk9QYWhRdWVGTFVDU2hhb1IrYW8yVDdVZUlFNEJ4akhY?=
 =?utf-8?B?N3ZJZEE3cWdKNkdWMklSS3NXR1UzS2srbHhHQllJVDR4SkU0U2MwNjZUWHE2?=
 =?utf-8?B?RmlKSjNwOGJiYVRVN1k1TnVmUUl5SkRiNXZOd1BUeGQyL0pPNTgrNjlpaEVl?=
 =?utf-8?B?NUhHdnpVOUpMaENJaCtYcldJK0JXR3BXNlRWWTF1dGVKTlJWd0VqN2NtTnFF?=
 =?utf-8?B?cFFTT3ZCaTA0Nk9mdU04MEk4MGgzaUxET2NxY0tVZE9BRFdVSE1nSVRrVTlG?=
 =?utf-8?B?TUFMUkxId1pCUm05ZXhDWUx1bTgxVHBxSmM1Qno3eVE1SStGM1dEOENLVmh0?=
 =?utf-8?B?bkU1RlFUdUY0S1pnbzhjV2ZWWENOOWxQMlkxSDh0emxXQW1ndENkaTAzSlFV?=
 =?utf-8?Q?5F+2T5miaiaDt/hVFXK6/oBnS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb520c61-304b-4e10-e692-08db4fc3f796
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:58:49.5245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wjonmp//N/rTjPMR8ZsH+G6Ut/Uy+D2Kkb0m4ymSAXwbMdK1KYaEEHTFQquZG0OrYCOhle7zwkYwDD5nc0FLgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8674

While slightly longer, I agree with Andrew that using it helps
readability. Where touching them anyway, also wrap some overly long
lines.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -93,17 +93,19 @@ endif
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
-	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
-	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
-		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
-	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
+	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	$(NM) -pa --format=sysv $(dot-target).0 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).0.S
+	$(MAKE) $(build)=$(@D) $(dot-target).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
-	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
-	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
-		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
-	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
+	    $(dot-target).0.o -o $(dot-target).1
+	$(NM) -pa --format=sysv $(dot-target).1 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).1.S
+	$(MAKE) $(build)=$(@D) $(dot-target).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-	    $(@D)/.$(@F).1.o -o $@
+	    $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -123,7 +123,7 @@ syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SY
 
 orphan-handling-$(call ld-option,--orphan-handling=warn) += --orphan-handling=warn
 
-$(TARGET): TMP = $(@D)/.$(@F).elf32
+$(TARGET): TMP = $(dot-target).elf32
 $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
 	               `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
@@ -137,23 +137,23 @@ CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_E
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-	    $(objtree)/common/symbols-dummy.o -o $(@D)/.$(@F).0
-	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
+	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
+	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		>$(@D)/.$(@F).0.S
-	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
+		> $(dot-target).0.S
+	$(MAKE) $(build)=$(@D) $(dot-target).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
-	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
+	    $(dot-target).0.o -o $(dot-target).1
+	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
-		>$(@D)/.$(@F).1.S
-	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
+		> $(dot-target).1.S
+	$(MAKE) $(build)=$(@D) $(dot-target).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-	    $(orphan-handling-y) $(@D)/.$(@F).1.o -o $@
+	    $(orphan-handling-y) $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
-	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
+	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
 	$(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif
@@ -210,27 +210,34 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
 endif
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< $(relocs-dummy) \
-	                $(objtree)/common/symbols-dummy.o $(note_file_option) -o $(@D)/.$(@F).$(base).0 &&) :
-	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
-	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).0 \
-		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
+	                $(objtree)/common/symbols-dummy.o $(note_file_option) \
+	                -o $(dot-target).$(base).0 &&) :
+	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).0) \
+		> $(dot-target).0r.S
+	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).0 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).0s.S
 	$(MAKE) $(build)=$(@D) .$(@F).0r.o .$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
-	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
-	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
-	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
-		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
+	                $(dot-target).0r.o $(dot-target).0s.o $(note_file_option) \
+	                -o $(dot-target).$(base).1 &&) :
+	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).1) \
+		> $(dot-target).1r.S
+	$(NM) -pa --format=sysv $(dot-target).$(VIRT_BASE).1 \
+		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
+		> $(dot-target).1s.S
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
-	      $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(orphan-handling-y) $(note_file_option) -o $@
+	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
+	      $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
 endif
-	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
+	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
 	$(SHELL) $(srctree)/tools/check-endbr.sh $@
 endif


