Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1598363C338
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449459.706216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p021X-0001ee-5s; Tue, 29 Nov 2022 14:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449459.706216; Tue, 29 Nov 2022 14:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p021X-0001br-2v; Tue, 29 Nov 2022 14:55:51 +0000
Received: by outflank-mailman (input) for mailman id 449459;
 Tue, 29 Nov 2022 14:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p021W-0001bl-5r
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:55:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e90591ef-6ff5-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 15:55:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8152.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Tue, 29 Nov
 2022 14:55:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:55:47 +0000
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
X-Inumbo-ID: e90591ef-6ff5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqTH/2VgeLFnirpIYIBQQG2ejIvxnwcmW0jTf1Jc1dqBMVmbXJPsznBxmHGhYlx5Q5UZnhZ59sdeN763+Hrn57Sy4ZbzB2+W8PWBIsCMRPgJzUES7XuzG1BOwCI3eJONMaP+yhX4X1O6STYqoY9HYqS95f9BYlND+2uGRCNeV6GAiXPEuwPu/UJru6BgnSgB6ljI/1GECYHNmy1T/BVcYTNQYwMfHGfeXfXX1E0mhuN93IpLEtEMk8aCS6BRSjYb+3NUwKDZT2zzsavX105lW4aiXydmnrTXTXmED1CTiXUlm+bacidgvzXkwPVbdrBmIP5tNiihNKt3wTNEXl29jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9e/K2ZxeIJXak06Lk356njAefBtPZNeUDKX9joG6ao=;
 b=fTdJ5dYRJeks4W+SiIXlAcQJHT0D72jyktfmjE+TJijZWsjsPiE9ny/tZo/vcbxBN07pXafu5rhiABDbimSp7+VBtMjg9qauF43iuaoUOClCQtmgnMCvQYM/FmvtxC/uDpRARAbEwYpx5xIhfYc0BqIayNrLbT55Qb+73S3AiF/r4RJ8dL5YDPCZt7gfujv2/R1vsUKhVCJZ4lSMX67qgwLwPfGtJVipnaFMhvv2yWb9QcTAkSjMnejbWThzLmdWGunuIadPzTqhNItpWITXD0QtZwgRLpH/af0xBCDkKTkfvWMow2rwtM6Ns6fYvOiUXyhjSMWoWUfhdXEyxJXrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9e/K2ZxeIJXak06Lk356njAefBtPZNeUDKX9joG6ao=;
 b=IFQ6LfOB4P2a+I/pRoGNdmr/DNyrunY73fO+bAu4R/X91yJKkxE+qv0P9e1lzFkoHHeP8yTMA8xGjmc4yjZ0xl0wWXk4vWITKN9+6XURKHQNYpJH5aYMayhu8zVVXIuKWVHGoXFT3Otiam2UNXpXOyd79EWyQKa8R6vz6835rprjnGwW4D0iyoBCkWLN3O3+iN2yctMxXyypKAbcljLyKC4MplROH7NG/0jMVbOXAMa5GMCG03s8/EcPwLlNR2/j+207/FUIWH7fYLUJlDNR5wsgD79XO6LocFCh0dVi/N9rC3+OFl4RCWE4TP+AzMOuVFffDLGNnphzIniIR+mUig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df240766-7a57-d9ce-f0a9-697fc470e1f5@suse.com>
Date: Tue, 29 Nov 2022 15:55:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: PGC_page_table is used by shadow code only
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e53daca-9469-48b2-8ed3-08dad219cc3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qUCenrb+ghLEICUPhv4Gz9vmizLaGG2UEUa7aG46YDavR4KRh+NwDk5YNnHfK8x5PVKD2yQBsLQLLvzOXkU/Wfo2ckohi4P3tpZBRkqOv656feA50eHGM+D7NdhDNm1uH9rGbmtaoxpNyNwIY2IFeM18oqYsECwsng/rNMieeLvozMy+X/LMP/YkL2y7VZhOVL3lVIDa3y47+Q5nskVLO0rlmRs1KloHNYBDgzCVnGtOdFswbAcWdhEatFZclipMjYKTsDNhDWnS9AZZlppJxuaLi5nwN+/kr9CbZ0mlt4rfekYNp24gkZoITaMWsHChszzaEB2mjiXMTUgvGjzpbBa3SIWb0rUnJlPqjfVs+EtBxgvEOlMScpIJEsqIWjiPCbq3yHq1tyuBDNWWLA4+nCIhMWWK2GYUT/7Xzw0ColBuC/Pl0geLte4O047kn3+ctku59OGnqN+M2i+FxNEACn6zdUzFdqM9sYQAzo1GJNhIh/f02yutfar7GHkyND2uz4QjvKJsXopsRxv4c2SMRpZU53eJbHUl4Ii11syIjKlHIeDbykqH1XDeA3J4mePvOQ4MINmjc1Ogv4IyKt7EImL13C9Yuk4132/rb2V8FXTxudHK+R6bt5FkbKVZClprbgnhCG4y5oC+aCMeY1Sn1Gs7ZZyNLTKlPLV0c1zHto6tF7jwPiT293FAt67Yrs5mEZ9KFeGDArahPBoPFdo9FRsL/RaN7Sy66db/sKbQT60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199015)(66899015)(2906002)(31686004)(54906003)(5660300002)(41300700001)(8936002)(66556008)(316002)(6916009)(66476007)(66946007)(4326008)(8676002)(478600001)(6486002)(36756003)(26005)(6512007)(2616005)(186003)(6506007)(38100700002)(86362001)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzVHd0JieUlQQ0doSnM3cHdVZnVCTmsvQlhrYlBsUTJuZjk5aEpXSmQ2a3pw?=
 =?utf-8?B?a1BmaUhDWmpJK0lmYTVNRnA3UXJHbkJqVU9NZnBITXR2MFNERy9ZR1c2VFlo?=
 =?utf-8?B?V0VlaEczNnFVbmcwYm5zbFRPK2dvdllLR29PbXFXV2RkQnlSaEthSUtWMk9t?=
 =?utf-8?B?VDk1U2RrMEhFTURjUkxGZTJseWVJRktZcUdnZ3Yxc2pRQTJhNm5UMGExOTVi?=
 =?utf-8?B?NHRMVWhLWjlqTzYvRnU5SjZSSnBuNGFqV3RQL0Z2azFFZndpK3p3NzI3cDVo?=
 =?utf-8?B?OS9UNW9yRWFHK3A0OENuSnlxSFVjSXVnajVMVjUwUHZTeWhHRWs1M1Fod0dF?=
 =?utf-8?B?KzJYV2dOcVdlWjkzcnFqeDVYZmxxalZLNVhZbnFjUTI0aVRxNmp3Nk0rMkk5?=
 =?utf-8?B?aXNDR29GODlCK0EwdTlROTNWVzFZSllVWlJGRVJDV2JKZ3hCSjlFMzBSVmtP?=
 =?utf-8?B?UGpyUFdyRFErbFFRaTBMcFo0dW5qSUU0SDlpdGR5QXpxOU9IalNIZDVKR0Ur?=
 =?utf-8?B?TVFxSk9IRU9jSjJrWms5OTl5a2lzdVA5MnV6bWlxMVhXdUlxckxKYzhHWWNM?=
 =?utf-8?B?Y09qLzZNakRYc1IrOW1tT2c4TklBclZ5QUxldm5tTk1nVHU3M29BbVhXd0Na?=
 =?utf-8?B?RTVXZnMyQUNYU0FZNGo3TnErTFBIVzl4S2R2bHc3T1N5eDdNaklER1RFZEts?=
 =?utf-8?B?VjdRTDJGb0plaVRxMjc4SjZIdVJJMnh4cTEyMUN3dG82WUo0V01EWmxINHM0?=
 =?utf-8?B?NW90a1VuUzlHTnhIbzh5ZGw1dEJnZUhqWmFDNzRreUVXZndaU3lETkw1Um8v?=
 =?utf-8?B?cGlHSnZQNTl5WG1vSnM1WSs2dUhJWFZaRUwyU2l3TlNmenhWejZCS2hKQmMv?=
 =?utf-8?B?UjI3ZG1reTJFTWxUZWRsTytZeHVIWUZCWG1zQmxDeFRGTVdZWDBzZE14UDg2?=
 =?utf-8?B?UTU2ODJoMW42S3VXNUNEdHBBb3dmRTVxcElDanMzaHJXQVQwUWZaZUVQekdP?=
 =?utf-8?B?R0NwQ3pYVDVoaWlVS3liSUFIUHJIZlgzajVRbzkyTlVyMFNBeTBJd2RMTHl5?=
 =?utf-8?B?TE9PalNycUxHVWdxQ2hnY1JuY25DeEVhY0dybXRkYVZZeWdIdFV2bmw0WU5Y?=
 =?utf-8?B?bERLdGtyZElXL3NLSFpaY3BiV3VYSHJDMXVYY3lkbFdYQmxwb0dWWDhBbW1T?=
 =?utf-8?B?UzhJeVR1KzZMeHhLMllhblYrdjVuS0hWd1ZtREVWMVlKZmJqaHhyM1dYT0RF?=
 =?utf-8?B?WXgxM1Izd2FzYlNRN0trcUVsa2dOQ2wxUDBnaGI3MEhoRFNFbzRLZElOOFhD?=
 =?utf-8?B?UGkyZ09lMlp2SUlRcloxeFE3SVB1WkZRWDdaUGs2cm9aK2EvaHJCMTRJdnA0?=
 =?utf-8?B?YlprZjRrSU5rQWxsTU56MWVhbzdxTGRuOWozODZpYklwRVZKS2xsd25kMkN6?=
 =?utf-8?B?Sk5FWjlUazdOS1J5UXpjOThlRlJ6R2pWMFhhSEoxM1FGSW9Bek1kNkhiRndq?=
 =?utf-8?B?K2FtTlJhcEJHb2JQb2k1QmttYUtUenF4d242aStuRTR4M3pac2ZxSkUvY3pY?=
 =?utf-8?B?bnBNWFMvQ1NPZEJDYTFQdnJYcDBYa2RjR0xMZm9BaFE4QjB6T01Vd1l6blpG?=
 =?utf-8?B?NVIvUi9Ha1F5Qm4wbGs3a09iUmRJejVlU2c5QlNQTEpPZEhqQ2ZFRlpRT096?=
 =?utf-8?B?NmkrUEViM3IrSzQ5eEowZ0sycUp6cmVxdlh0NEE0TkEweFNzbEFHbFhnbnVv?=
 =?utf-8?B?QjBCeEhYOGVnS083TENtRjJ6N1I1TUpaTG9GVkhTOVB5QzVnQ2UwZmRFaXdv?=
 =?utf-8?B?T1krM2UzR0I5VHU2MUQwdERaVTJ2TmRxc1pOYUZmSllLZlJTdW5IZ255blpw?=
 =?utf-8?B?aUVJV0lNL3FxMjI3ZCs3SGQzdjVKV0MvSzg3dlBJYzdUUk5PNm1QV0RZTjZD?=
 =?utf-8?B?NXQvTThoa3NyMGZ3b1YxdWRuNElGN3A1R3IxRnY2aWFiV1hKK0hpSnh0ZTB3?=
 =?utf-8?B?R1FtUityTlFrSzNLdjZEQWQ3UTArMUg2ZDNlcVB0WXlBcU8yMjlzTVIrckxm?=
 =?utf-8?B?TWUzOGdRWE13YXpzMWVnRWtndldFQ2ZUaitYYnJ4Qlg5VTQzME5ialEyUUhO?=
 =?utf-8?Q?vhmp1SyvplYkOrDVqyFcO1XS1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e53daca-9469-48b2-8ed3-08dad219cc3c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:55:47.0288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6584UM81BzdeddfXSdLrcu5W+mXOVQ9sd/giixj0qR2S7iyeLeW1G6zZSXMXFIx6lh+Qc/aVmttBNBoJMWZD5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8152

By defining the constant to zero when !SHADOW_PAGING we give compilers
the chance to eliminate a little more dead code elsewhere in the tree.
Plus, as a minor benefit, the general reference count can be one bit
wider. (To simplify things, have PGC_page_table change places with
PGC_extra.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
tboot.c's update_pagetable_mac() is suspicious: It effectively is a
no-op even prior to this change when !SHADOW_PAGING, which can't be
quite right. If (guest) page tables are relevant to include in the
verification, shouldn't this look for PGT_l<N>_page_table as well? How
to deal with HAP guests there is entirely unclear.

--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -70,9 +70,9 @@
  /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
- /* Set when is using a page as a page table */
-#define _PGC_page_table   PG_shift(3)
-#define PGC_page_table    PG_mask(1, 3)
+ /* Page is not reference counted */
+#define _PGC_extra        PG_shift(3)
+#define PGC_extra         PG_mask(1, 3)
  /* Page is broken? */
 #define _PGC_broken       PG_shift(4)
 #define PGC_broken        PG_mask(1, 4)
@@ -83,12 +83,20 @@
 #define PGC_state_offlined  PG_mask(2, 6)
 #define PGC_state_free      PG_mask(3, 6)
 #define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
-/* Page is not reference counted */
-#define _PGC_extra        PG_shift(7)
-#define PGC_extra         PG_mask(1, 7)
+#ifdef CONFIG_SHADOW_PAGING
+ /* Set when is using a page as a page table */
+#define _PGC_page_table   PG_shift(7)
+#define PGC_page_table    PG_mask(1, 7)
+#else
+#define PGC_page_table    0
+#endif
 
 /* Count of references to this frame. */
+#if PGC_page_table
 #define PGC_count_width   PG_shift(7)
+#else
+#define PGC_count_width   PG_shift(6)
+#endif
 #define PGC_count_mask    ((1UL<<PGC_count_width)-1)
 
 /*

