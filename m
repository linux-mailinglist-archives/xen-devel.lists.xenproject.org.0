Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCD4B9DDF
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 12:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274658.470215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeXF-0006jB-Qt; Thu, 17 Feb 2022 11:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274658.470215; Thu, 17 Feb 2022 11:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKeXF-0006gL-Mn; Thu, 17 Feb 2022 11:01:17 +0000
Received: by outflank-mailman (input) for mailman id 274658;
 Thu, 17 Feb 2022 11:01:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKeXE-0006fR-45
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 11:01:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec5e39c7-8fe0-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 12:01:14 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-HJYdhSgqOM-rhwrN7qPJqA-1; Thu, 17 Feb 2022 12:01:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB9PR04MB8393.eurprd04.prod.outlook.com (2603:10a6:10:25f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 11:01:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 11:01:10 +0000
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
X-Inumbo-ID: ec5e39c7-8fe0-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645095674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zM5O0NIegQlxsb91H6RIMRG/er+065jMoSojdzl6S6Q=;
	b=TYPY4PDZj0qd1jgBfGHocq6yjire/7ThufXSXY/WjuTGtPcBhwk2W3MACD4rro8x2+lSVp
	eg5zz4pocbRh0EEr3UsEtBKW4VnGEVl9EjADeKJ9glK+tW4cEdv617inBJ+YsP3lzmVW+4
	lVwFd7P3232yapMK9stnqJ2sTz8ZUE4=
X-MC-Unique: HJYdhSgqOM-rhwrN7qPJqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQR5tHm0FmEeH94C5RKwgbdaFuYzGqU32M072OB2hO5fVYIj6kyT4sO28JOfTd/h2f45hoKBwYnVMevw/sBdPTFuNf9CL29QT/ITB5HwoInbnzYt2GtOf0wMD32Sju4RCQYGb47KSAuFi2KsHzJBm31O64+hIQ9wX0eiw+XnL2yzcmZ8MYkquLINNvDXAmYGr0kB9fkpPzedWGuBx5cZgrabYECJBFwUpj0pTOLUTEm3Db+dbyx7RzK75tm+Zakmh9PtPbBZAvkosFZZIECoHDeuqSRycyG+p1emromuqJI1gAXe9q6Q6mEderr1X6+lA9sHN1VMrmoyiCl4UCoICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zM5O0NIegQlxsb91H6RIMRG/er+065jMoSojdzl6S6Q=;
 b=K8bV+/t4COAsnTQP+HuaoJvkgYU9T4M93o0s1fU3jAwmBKq+p7PC1x7X1tMf5K2UYIH5d6QhdP6BP+J+6m9TiDyhQ5P/4RuabNdnw8LUmkDrNXcTXAxG5OC1W621n5HDmuQ5AH2A7OaXzrZTKxJVVPTPsKmgDacwVJnedMtaoFELZlp9QjO3G0Ugwtd+dlm2ixlj4HLfUkRce8NbR6Pje+9SgKqtpNuk93noQ/znU3b/y5yRgg+8EkwcxfW/4h27hSlKr0x2BMV17cNVcaIjyOcDojzqI+gZL4X5GqTQ9oCR2PBeLm3vRF1GtzAcr81fB3t2kPb+B2dBXd7FMrcOUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c56aadc8-e568-4625-5d6f-bd2b8981f3ae@suse.com>
Date: Thu, 17 Feb 2022 12:01:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RESEND v2] x86: introduce ioremap_wc()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Language: en-US
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0056.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9238906f-8bb4-4832-752c-08d9f204ce45
X-MS-TrafficTypeDiagnostic: DB9PR04MB8393:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8393BB63DC70ED7D7F62E52EB3369@DB9PR04MB8393.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5AL8La9bJwtxDuvrq8SCQfmpPoKj9GHkadxfxGpYoS20pKJXKjzb6x+wn3wQbTHXHdiSM8wCCZ6APTDCQeFRfFBler7jOtlHiJB76E90AS8r7wbBZo02kEdeNx7y4nGy883rnvyRHCtpZeyzEvsKte6jxeDo0qRRAxVNaYjmXVoZE49dJlVAOlaZclaZKQWzv9W7noxDNkPyy5xUMExYqhGyP6ghs4oCdHPrLfBEZaT5c3Tjlmz/fmNlDXBBZRvSkvFsRgmELkoQIDntXABUNyfxBqvTXsGdDJEUPQloMvaWTebS6D7pEy6RAIPnUF0aFQ9yOHRS/vqr8Lo35ciGbUeIEs42f0Ygu8QN7fw+OdJMF6cfP+QdiTwWdXlya1CHmXi0AqtPnR76CCmYVBe2SkvG+M/1/XrGxa98t1EvtKENuJjN/vloKRgRFqW15b9CXRkQUDSqJku/yaL+679GyCecNSMUdBYlwUzE9SXPwi4Hh12ct0cCzNCGGX+52jhPDKC0Ru3rwC4dTGdte4YAco5OuEfUYRg9jtWPfUnT98d19fvKkoPHVKNiYl7/8f+cZ2/JZ62stylQ8lT+u1VprqoRQ5v9CqnAFD5w9Wk7Ok/g+3o9hQaUFXX/NE+DvbbKBQz5uvq+wozjJ+hgsYVFlgJO0QxEqNTB83uuKvdb36ZYaFB3QCMTf0h2K2Uhy4VK4/W81ZC2ODEFXR4FaD+Ve3C8CTk5jfGNppE8D580Ddu7UQFhKxXwS8Ze8voc/AGZgby1RboRlwcjM/x4iOU91w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(54906003)(6506007)(66556008)(31696002)(66476007)(6512007)(2616005)(86362001)(8936002)(38100700002)(6916009)(8676002)(316002)(6486002)(508600001)(4326008)(26005)(83380400001)(31686004)(5660300002)(36756003)(186003)(2906002)(43740500002)(45980500001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STVoamphVFliNGx2cmhuRzRoVm5oazNxTnllYTBYSUhESFMvQjc3T3BaV3Iz?=
 =?utf-8?B?aDA2UjEzdVZJQzZtaEpMQTFIajVQWVJQdHdoTnp6VjRWZkdSNlZtUHlyWHVp?=
 =?utf-8?B?RXlsMGxBaklKcitxVnBKamk1RCtYVjN0KzBzcll2ZTFqZWNZbHJiTDJtZ3Zm?=
 =?utf-8?B?bmR0QzFDMy8xcmxqRWUrS2tGamwzWUtmbnNua0wrdm4zNHJZQWlFbkRzWUZT?=
 =?utf-8?B?M2VZNWUxaUVLSmlBQUxsbERNemowU1htaURaN0ZIWmxPblN4Um1SUitXOW9G?=
 =?utf-8?B?TXJBUXdUNGFCbkR6WExYam10dkRqdnY0ckl0NjlwUzFPT2Y1MmpUenRqWEtq?=
 =?utf-8?B?K054czJXZE5CbHlwd1JlVEI2Tk9rK3huS3BvQ3hDTWFYSDM0Z2pWNzF6Q1Ay?=
 =?utf-8?B?RGVEaFh6Y1RRNnVHald0OWlycEk1R1JRWXhKR24xVWhBNlNuZ1RodS9aYzc0?=
 =?utf-8?B?blBWRFR0cEpoS3JKWGxMeGVUalFTYlh6MWR4MXlKSVBmVDhEZUE0c3FCOVRT?=
 =?utf-8?B?M3FneUMxTk1tVEVST1VVU0lSRThxQlllYms2SnFYNmEybmRPVjlqVUtvZ3cx?=
 =?utf-8?B?emRPUDY1ZmRNdk9tU0dMUHMycWNyQ1ExVnR1dUUwYUdyK2hyR2tzcDJid0hv?=
 =?utf-8?B?Tk5zRmdYaEt1QnowK3JaWjNya0tZaFBISGtYazhML3h6Z082Sm5WaVNkOHA5?=
 =?utf-8?B?L0Y2T01Qc2pNb0FxRUVMZVZLaDBwbUtmdE5xV2RJVjFiSmk1R0dhbkJLemM1?=
 =?utf-8?B?NURqTjdUTFR1VVVuVWJLRjBNWkF3d1hhQ1JMTU12LzU4RmZiaEdoZ1F3QXhX?=
 =?utf-8?B?eTZTV1FOWThRZXVHd0I5eGlVZ1kxMGJHcVVTRnlCdWJwM3JWSjRZN1o2QkJ4?=
 =?utf-8?B?aStoSVNVejFWb2VFemJ1R0pDeHZINFNQN3B5SlgvZ2ZSY0hid0lxRk80WFNF?=
 =?utf-8?B?MmQ3QU1CM1NFWjVpbDNkYWl5QWlWcnFLczJxN1ZYeThNZUFOYTFubDlET2Ew?=
 =?utf-8?B?VVU0bXRjQkI3a2xHY1hNV0R3ZVBCVHorcUoyTlJ4OHlNQldZYkpyN2hKNlNx?=
 =?utf-8?B?ZFpFQUtzV1BKTkszVzV3L1hHMzZIUE9VWmNlMS82ZU9EaHI5TTI2akVrQndM?=
 =?utf-8?B?T0k4SC84K3NQQ2ZHN2dEeHFEcDRzK2RJSDZuL0lhYlZvcm84bi9WamxWMElj?=
 =?utf-8?B?OWY3TUc4SnhqaVNXTk1OMU9Ub3NPUnUxc1dhem85cHdyMkhZZ0dHRnlmUjl3?=
 =?utf-8?B?OEFkOHc0eG9xY1pzWUxQOVlhYkxPSVhRSVRqVytYQXNYZzNINmlReURUNGpR?=
 =?utf-8?B?SnRrZUFIT2twUHBwbnRCSnFiOEVQT05MTmVTVjI2eGhIdnZPTGhMazZEVFpt?=
 =?utf-8?B?c2U4UGltZ3hOODVSOUlTQklqRzhpUFZKaE14ODJycE1RS3dqdlpQd29MRXVq?=
 =?utf-8?B?TEV6S3VoQlVBaUV1cm9NU3NaNFBndE13UGkzTE80N29rMlBpaGR6czNic2Vh?=
 =?utf-8?B?Z0RJWjZUTFdBMEUxa09NcmErZ0Y3OGNXaW1VeWR0dTlRVEVYZy9pdVUrbXpq?=
 =?utf-8?B?Wm9uRUE4aFhwZzUyNUd2NHRYRGhqT01pQ2VxM0wxNkpGZXc3RTNBQUoyOUFL?=
 =?utf-8?B?bGphYUszR3JmRGMxc3BnZTM5UWVlOTVpRVZVMGJkZ3hhOVhzRkRsZGtyeEFJ?=
 =?utf-8?B?SGQwZzk3eVVXRXNhdi9qRFJvSzlkdUt3Q3JhSFJlUnFjSFRNUFZ0TmpSQUJX?=
 =?utf-8?B?S05sZWhpSUhyRWxVTEhReW5FWjRuaCtDZGxMQVY2Qlg0aWpucG9wMkZqa21u?=
 =?utf-8?B?ZVdlbTE3ZnhDNjdZT3VCWUErNTdnejVJOFhhOVJSc2l6T05uVWY0NkliN3N2?=
 =?utf-8?B?dzhxcEtuNFl6VWFJeWRiNjB1aTFDTjdKSndHRElOVmVLa1FpTXY3eW05Sm9o?=
 =?utf-8?B?akUzRStrcUk2SXNSTnh5RDJ0Y1FURkp5cTZpeDl3dHg1b1BjT0RXSFd6VHlr?=
 =?utf-8?B?T0ZVRDB3b0RWR1NXZzJscmxva3M3bzBtR1pLdXVnRTUycFF6cmZURDlxMUU4?=
 =?utf-8?B?MGtlWXVhZnFMOVVVUlNoTWJseG9zOHRhOGlMV2hUT0ZBaWJSQlNZejk5MFU2?=
 =?utf-8?B?VGhOa1BJQlR5UDFnN2FsMFRwRnEzcUpzSHAvNkZlNHpwcUUyTm9uc0lEa01m?=
 =?utf-8?Q?7Dwxkysy3I/nLXV1eI3P3fk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9238906f-8bb4-4832-752c-08d9f204ce45
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 11:01:10.5491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfMaBLa+D64+yGhqZ8+OL+tbQfUacDFStusHZCaJYJHPWTZoNr84icy6MJN8ecgYXS+jR0QIre990AdbqnIq6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8393

In order for a to-be-introduced ERMS form of memcpy() to not regress
boot performance on certain systems when video output is active, we
first need to arrange for avoiding further dependency on firmware
setting up MTRRs in a way we can actually further modify. On many
systems, due to the continuously growing amounts of installed memory,
MTRRs get configured with at least one huge WB range, and with MMIO
ranges below 4Gb then forced to UC via overlapping MTRRs. mtrr_add(), as
it is today, can't deal with such a setup. Hence on such systems we
presently leave the frame buffer mapped UC, leading to significantly
reduced performance when using REP STOSB / REP MOVSB.

On post-PentiumII hardware (i.e. any that's capable of running 64-bit
code), an effective memory type of WC can be achieved without MTRRs, by
simply referencing the respective PAT entry from the PTEs. While this
will leave the switch to ERMS forms of memset() and memcpy() with
largely unchanged performance, the change here on its own improves
performance on affected systems quite significantly: Measuring just the
individual affected memcpy() invocations yielded a speedup by a factor
of over 250 on my initial (Skylake) test system. memset() isn't getting
improved by as much there, but still by a factor of about 20.

While adding {__,}PAGE_HYPERVISOR_WC, also add {__,}PAGE_HYPERVISOR_WT
to, at the very least, make clear what PTE flags this memory type uses.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
REPOST (in isolation) upon Roger's request. The header location change I
don't really consider a "re-base".

v2: Mark ioremap_wc() __init.
---
TBD: If the VGA range is WC in the fixed range MTRRs, reusing the low
     1st Mb mapping (like ioremap() does) would be an option.

--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -602,6 +602,8 @@ void destroy_perdomain_mapping(struct do
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *);
 
+void __iomem *ioremap_wc(paddr_t, size_t);
+
 extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
 
 void domain_set_alloc_bitsize(struct domain *d);
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -349,8 +349,10 @@ void efi_update_l4_pgtable(unsigned int
 #define __PAGE_HYPERVISOR_RX      (_PAGE_PRESENT | _PAGE_ACCESSED)
 #define __PAGE_HYPERVISOR         (__PAGE_HYPERVISOR_RX | \
                                    _PAGE_DIRTY | _PAGE_RW)
+#define __PAGE_HYPERVISOR_WT      (__PAGE_HYPERVISOR | _PAGE_PWT)
 #define __PAGE_HYPERVISOR_UCMINUS (__PAGE_HYPERVISOR | _PAGE_PCD)
 #define __PAGE_HYPERVISOR_UC      (__PAGE_HYPERVISOR | _PAGE_PCD | _PAGE_PWT)
+#define __PAGE_HYPERVISOR_WC      (__PAGE_HYPERVISOR | _PAGE_PAT)
 #define __PAGE_HYPERVISOR_SHSTK   (__PAGE_HYPERVISOR_RO | _PAGE_DIRTY)
 
 #define MAP_SMALL_PAGES _PAGE_AVAIL0 /* don't use superpages mappings */
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -152,6 +152,10 @@ static inline intpte_t put_pte_flags(uns
                                  _PAGE_GLOBAL | _PAGE_NX)
 #define PAGE_HYPERVISOR_UC      (__PAGE_HYPERVISOR_UC | \
                                  _PAGE_GLOBAL | _PAGE_NX)
+#define PAGE_HYPERVISOR_WC      (__PAGE_HYPERVISOR_WC | \
+                                 _PAGE_GLOBAL | _PAGE_NX)
+#define PAGE_HYPERVISOR_WT      (__PAGE_HYPERVISOR_WT | \
+                                 _PAGE_GLOBAL | _PAGE_NX)
 
 #endif /* __X86_64_PAGE_H__ */
 
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5895,6 +5895,20 @@ void __iomem *ioremap(paddr_t pa, size_t
     return (void __force __iomem *)va;
 }
 
+void __iomem *__init ioremap_wc(paddr_t pa, size_t len)
+{
+    mfn_t mfn = _mfn(PFN_DOWN(pa));
+    unsigned int offs = pa & (PAGE_SIZE - 1);
+    unsigned int nr = PFN_UP(offs + len);
+    void *va;
+
+    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
+
+    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
+
+    return (void __force __iomem *)(va + offs);
+}
+
 int create_perdomain_mapping(struct domain *d, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg)
--- a/xen/drivers/video/vesa.c
+++ b/xen/drivers/video/vesa.c
@@ -9,9 +9,9 @@
 #include <xen/param.h>
 #include <xen/xmalloc.h>
 #include <xen/kernel.h>
+#include <xen/mm.h>
 #include <xen/vga.h>
 #include <asm/io.h>
-#include <asm/page.h>
 #include "font.h"
 #include "lfb.h"
 
@@ -103,7 +103,7 @@ void __init vesa_init(void)
     lfbp.text_columns = vlfb_info.width / font->width;
     lfbp.text_rows = vlfb_info.height / font->height;
 
-    lfbp.lfb = lfb = ioremap(lfb_base(), vram_remap);
+    lfbp.lfb = lfb = ioremap_wc(lfb_base(), vram_remap);
     if ( !lfb )
         return;
 
@@ -179,8 +179,7 @@ void __init vesa_mtrr_init(void)
 
 static void lfb_flush(void)
 {
-    if ( vesa_mtrr == 3 )
-        __asm__ __volatile__ ("sfence" : : : "memory");
+    __asm__ __volatile__ ("sfence" : : : "memory");
 }
 
 void __init vesa_endboot(bool_t keep)
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -79,7 +79,7 @@ void __init video_init(void)
     {
     case XEN_VGATYPE_TEXT_MODE_3:
         if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
-             ((video = ioremap(0xB8000, 0x8000)) == NULL) )
+             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
             return;
         outw(0x200a, 0x3d4); /* disable cursor */
         columns = vga_console_info.u.text_mode_3.columns;
@@ -164,7 +164,11 @@ void __init video_endboot(void)
     {
     case XEN_VGATYPE_TEXT_MODE_3:
         if ( !vgacon_keep )
+        {
             memset(video, 0, columns * lines * 2);
+            iounmap(video);
+            video = ZERO_BLOCK_PTR;
+        }
         break;
     case XEN_VGATYPE_VESA_LFB:
     case XEN_VGATYPE_EFI_LFB:


