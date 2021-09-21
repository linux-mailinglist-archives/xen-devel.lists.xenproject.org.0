Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D47413668
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 17:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191782.341893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mShvt-0004IH-MF; Tue, 21 Sep 2021 15:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191782.341893; Tue, 21 Sep 2021 15:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mShvt-0004Fw-J1; Tue, 21 Sep 2021 15:43:45 +0000
Received: by outflank-mailman (input) for mailman id 191782;
 Tue, 21 Sep 2021 15:43:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mShvs-0004Fq-I9
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 15:43:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efc7d036-5aad-410d-a376-e64eced4ec9c;
 Tue, 21 Sep 2021 15:43:43 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-8w8D57NuOR2LwubjXpPE9w-1; Tue, 21 Sep 2021 17:43:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7037.eurprd04.prod.outlook.com (2603:10a6:800:125::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Tue, 21 Sep
 2021 15:43:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 15:43:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 15:43:39 +0000
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
X-Inumbo-ID: efc7d036-5aad-410d-a376-e64eced4ec9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632239022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hvPZWeko7LkrbiJynVatfRdxwf7pWGqz0z5S7aeVE8c=;
	b=Qza8VjCWzHUbaPCPpVHVT3+8RA65nMlblMu4mEEbYHe+6lyTeCRzdVheWgUreRviahF52T
	X5yaB2y0jWhUFWLuombYggtJaTVDQqmHevIl6BymP8fwFDaxuY/YFVRHtaNc+oYNgF1RUD
	burWC1H1r/cYSjE+QyR2h4OVggVToGE=
X-MC-Unique: 8w8D57NuOR2LwubjXpPE9w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvkQT1rUuI4Eqz7i6WLb341pGMjAvOC1YT+qTcDNZJxNz2lK/gcfqhjUo/HrzLZOu8mv3ZzgyqbuPqrXhpUvug/LEPdDUTkO4rVVl2ksCghG+0XlJ7NQ/18DluRlHZSTB9/mwAbEM632TArkcyw/W2dT96Porvtuj/YBYgPl5mA9bf7iRWHqY5+cIQHCBV3/rVNnH530HSwhgy/a+XyB3x/AVzaVk/KwlpWQOq9g9ubY6N7DEbG9G8m6uE44pUY/p2njd274Z1QDeS4xwnCHikJNi1up0JHclMD5WSBuMOJhALOwuh/SM8xEL0PyS27x6YfBIwuyGn8lBf048VNLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hvPZWeko7LkrbiJynVatfRdxwf7pWGqz0z5S7aeVE8c=;
 b=BrHSRWq/gxetuiDzI4Qkg4sPnjGvP/Rs4Y4c58eV58X+lkXn9Kyktzk+lfDc/GalX7l2kRAyEF89/eGtwz9NHe6pkzzLEveHPpw5SrQtIBvWc9a58LxEyC2KMsgSjYUOya+ij9vUmFoIJUbN2V3uVnZAkApX9Ob3VgpFoITXhYQsx1TdMklSSoGpHPYQCwYcsOEFbOa1NtrmZGD4/veVcRmMwH/yqHQoK7mp20LfNtWephWSrsBo9+kN9aON023SXuVxYykf79gQKFmBzdYwvKrlIBGUbIa2LhPrCazV5bGloM/XsJnwO6DqPbSosEgPTQv/jfJSIFeaqD3vbWHL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/build: suppress EFI-related tool chain checks upon local
 $(MAKE) recursion
Message-ID: <8457d422-4db9-59b9-d0c9-663430dad955@suse.com>
Date: Tue, 21 Sep 2021 17:43:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01547283-45f2-40a3-4f4f-08d97d169520
X-MS-TrafficTypeDiagnostic: VI1PR04MB7037:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70375D88A1FD2D7299745DC6B3A19@VI1PR04MB7037.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YFtrrc658vl/wEeQejojc+DhedhYB/sZU5uZPtGbVTykOQy1SQmKXlgtaVKttbnLZHiwSm9NBrsNZ1yw6NgQNBglTucaTEVYGgbKKMh0A/5nQi325fIVPWM8Y/glLxEGAfUYraF8H2sY8/vMBAmfIcnexceVA9bW1PORhL/KbRVjli8iK7oMhHbZDvkGkJwYsIqvl6kg2vrWOVaq2nFePXQaMIiCKfRBRN4RA4dBdlJPuGotremDKQO9+m6VjRF3+mhlIO7DGfv83RNHnfWEFj4+IcvvE1We9C9XPAsbxp+282dBntRFqEQqJI4PNKr6a3HoNG/EFuYnYNpFjUjOIEX25BzELRhYROZZi28q/JKFOpo+qPribZtOHst7LyUHwuRXy3/Vs1OttBq3/+ujpcLQ2Fkrw2g+whjD3aBzDphdNTrpWH3I7jcR+x7SMvo54K8z++XJ6XQPXp1CP84b01bLzI15V+xvZGrWXcJIf51P9Svn3dlEkIbpCK/KjWq2hDRTbJ0nypELFxHyxNd7yoM50EgzSXD77pBlMTmwns0Y06wHnbo/OAekc9DCQhLRc++PBu+2EYj2mfTSgWzMDAx6DzRFBmkzxGyWUkg/jx4BRdY5AhSJw7BEsUfg0LWXURDpG50WB7STIUcky4vlocW0SVNujdL57D91cwXybmnLWb912X40VO6maaBgMIt6dxwzI4TMiS8e9iyJsJ8GiKP6feqlL0wBQNE8HPgiOlg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(26005)(66946007)(2906002)(86362001)(6486002)(186003)(8676002)(8936002)(66476007)(66556008)(31686004)(5660300002)(36756003)(316002)(2616005)(16576012)(956004)(4326008)(6916009)(54906003)(508600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTVpSVNQdXFrek9USzlya2JZRDVnK2Z3VFZBeTBlZGNzVWlsanExbXhqQW9x?=
 =?utf-8?B?REgvdDlWK1cwZGtxY2pKNWxhYzdVbnV4ODFDT0lXaHJRdUI1N1VqR205L0tJ?=
 =?utf-8?B?Mm05THkxUXZGdVJ4dUNLTTNnTDZOSjRuaTNRMW52WUMwRXB5MVI5NnBBcWdX?=
 =?utf-8?B?SlE4dmpLVnc0TmtlTEEzSk84YW13WjRWM2lFWkNvNWJTU0U0enU5Y0VxSWxZ?=
 =?utf-8?B?azlpWVZnbzZJdm1uWHRlOGl3OHhEREQ4eWg3TXlKRlFSNEhKUUR5RVBPL0pp?=
 =?utf-8?B?OGdvQXN2alhtblErZy9FSTN1VURqalpxWllZVkwzd2k3ZXorTmNxMUwybHg2?=
 =?utf-8?B?ckVnRWRxV0NyM2tuVG5TN3c3WDc0VERQUW9ra085Z0x0eXJrY2tVU3FMaGd4?=
 =?utf-8?B?WDZ4MU9FVUlBbEk4NFN2Y0pQZFY3WTVlTWI5NVpBTzF5c1BJMUMvTVNhbGk2?=
 =?utf-8?B?QXBLWnNFaWRDWnc0Q09LLzJSODQ2eG1iZlFxMDh1cGhNQ0RTSlNwRENOQ04y?=
 =?utf-8?B?ZU1GaW5NN1JTYUF4SFhzeHJkNXBuZzJPTFJLRGg5a1ZQUEtldHorTlV0U0hM?=
 =?utf-8?B?cHlrTk9VWEZDbXhzczlScnM4anV2M2xQQWFmdm5xejhZVlZFcU5QUFd5RnVt?=
 =?utf-8?B?WnkvRGwyTWtaZGR2WG01RHdlbzA5TlpOaHVzKzRONDUzTCsvRjhPOURnak11?=
 =?utf-8?B?a2lZT1YxZ3FHNDlXVFZYNEVCbkNYV3RvbHJCOHlJNEh0cW5STjFWMCtaaWNp?=
 =?utf-8?B?WXN6WGt0cFR4dGxsTzV2QXRTZUVTZ3Y4RjdIckhtUmQ5eWxaWTR5UnhhZ3VB?=
 =?utf-8?B?V3AyYy9XMXBqODIvMUo4Ni9xZUFoNkhsenRFTkhOMVNsZG5ja094MUtqRzBJ?=
 =?utf-8?B?ckk3OEl1dzZHTDR1d0tHNitVcmlsTzJMVEUzWnlDbHNiTlA3RVFRcWtETUFH?=
 =?utf-8?B?SGU4bnNvK3pnNnM1b2NWbXpxUDlJVXNFYTFQVUw1V0pQSTNwaWJ5MjFKSUtG?=
 =?utf-8?B?cE50YndOZHV1NWVWYVFPYi94bmxtaCtaRVphQjZlQVFLTDlpcHpnZFBWdGRX?=
 =?utf-8?B?MXBTdkwvTmdxVjVlaHdFbUk1SGJLUUFVV3A4cldUcTh1dkJiblhGbWNyallF?=
 =?utf-8?B?aVUvdWF1UEtBTEl2cVF1ZU9MT0NDcTlrOVBtTldkUnhyWWd6U0pZK0w4a0NB?=
 =?utf-8?B?RTFFeVhQRW5iazFhL3NYU3dvb1RRS29BcTdNU3U5Z21WWEZJR0Z3MWJ4UFNO?=
 =?utf-8?B?c216YTFwdHFhSHdFNXZKdU1rdEZ2bEs4SC91S0pzWHg4MU04RGF0RkVzREo2?=
 =?utf-8?B?R296c1VHUytKckNGUG1sSjJBNTBLYUhKVXNCZWY0OGFqTDlnNzZlM3lBbjFt?=
 =?utf-8?B?VkF6emJlREtzdjFLTExrZW1oL1pJMW9Idno4TEZBM0ZmQngyeU5sQjlRSzkz?=
 =?utf-8?B?akJ6UTBBRUNhNmt6UHROTWNCcDNWTENaWkc4aXJrVXVLR0ZYZUJCZFdCWkM1?=
 =?utf-8?B?VE1IcjROcldKVE8vTG9yR1d6eXloYmk4YmVEcUo0dXp2MmdjTzdmQmlYNU9j?=
 =?utf-8?B?eFlvUjFIbktjQTRDN2lWVUkvcmpuNGVjN0Nrdk9FeHdoa2NmNUhjQ1hRN2NU?=
 =?utf-8?B?eXJ2TGtkU0VIZ2x0OXRpNDFtVWhYbHNHb3haN2ZZOGdyQ0gxT1F2OTgrNDBp?=
 =?utf-8?B?Y1AzMk5nTStvWG9MVk0rYkNlQ2xmNkcvS0lGRkNDU3NSeHk3dm5HMXFhWnlR?=
 =?utf-8?Q?oqvtHJv58cXhuSdojW6rkfG0vcsxJqgoxyWE+It?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01547283-45f2-40a3-4f4f-08d97d169520
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 15:43:39.5650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpVT0XZQ49gIHeFq7xZCwPgr2DBt0Ll6SwSrtk2h9AFSja1FdJZ5bqNcDLKJo4UgIhIA/qoeDrRtDX0XARZLpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7037

The xen-syms and xen.efi linking steps are serialized only when the
intermediate note.o file is necessary. Otherwise both may run in
parallel. This in turn means that the compiler / linker invocations to
create efi/check.o / efi/check.efi may also happen twice in parallel.
Obviously it's a bad idea to have multiple producers of the same output
race with one another - every once in a while one may e.g. observe

objdump: efi/check.efi: file format not recognized

We don't need this EFI related checking to occur when producing the
intermediate symbol and relocation table objects, and we have an easy
way of suppressing it: Simply pass in "efi-y=", overriding the
assignments done in the Makefile and thus forcing the tool chain checks
to be bypassed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Obviously the real (but more involved) solution would be to do away with
the recursive $(MAKE) invocations, by breaking up the long linking
rules. Representing them instead through multiple smaller rules with
suitable dependencies is certainly possible (and might even reduce
redundancy).

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -182,13 +182,13 @@ $(TARGET)-syms: prelink.o xen.lds
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort \
 		>$(@D)/.$(@F).0.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
+	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).0.o
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
+	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
@@ -249,14 +249,14 @@ endif
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o
+	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T efi.lds -N $< \
 	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o
+	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y= $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T efi.lds -N $< \
 	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \


