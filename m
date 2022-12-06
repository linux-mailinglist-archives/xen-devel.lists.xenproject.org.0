Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656B644511
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 14:56:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454890.712462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YQc-0005yl-R7; Tue, 06 Dec 2022 13:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454890.712462; Tue, 06 Dec 2022 13:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YQc-0005wN-OA; Tue, 06 Dec 2022 13:56:10 +0000
Received: by outflank-mailman (input) for mailman id 454890;
 Tue, 06 Dec 2022 13:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2YQb-0005wD-AD
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 13:56:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbc92098-756d-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 14:56:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8670.eurprd04.prod.outlook.com (2603:10a6:102:21d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 13:56:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 13:56:04 +0000
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
X-Inumbo-ID: bbc92098-756d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyPlGV8dX/tnNGnoMmJYL9xDZbKyE4moXoTdRMWBfihBxXtIYJAxdltot3faedhjh62SOII5LvpYYThvWm5HyKxRy59K2eygNUaQZ4wM0Dc492RMvNzHYcXejeWkCkBkedwDkHsYucuXekZrciHWTih5tFlL7tlBg/7I81xCy4IibOuy5ngsCQ+ot11emGolqAyov/qSZGOleyVq75j75ymFBpTU5v+I8wMoUQ3CZO4QITrSi2TyDSX5ZXXfCWZ2JPyCpMIkKPsICujygDQ7HZMmAFGgiImBURALvoc+VBAgpIwXu2j5go6gqvyeTqkx+G2LViv4kmBgi/z5TCRoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8k9Cg9eVliAtip8iorn3Xux77iG61ZlTqy6/GtyMv9o=;
 b=YJG0Qxd5BfLvxYyhoUZosTVrQVtFoLqstzghpboucA1i9PQC7mqygASANApNw2TKXpnuXQPERR65Zpxcz+HbPpFpmyfWWqlObERgsoILvPYuzKzmo9NVjT5CpESq+ZWGPg94Ac87gyczLI4kl3rdV/xzTAMkZAodIEDL3ljUgy4zIkPlvb8mS5pRmcq8RLwrfujiDZP6u1KaWqKzdMgaqd6R3+aenH/ip2iE7aCP2/ZikIC/FySmYtWRpw/ImJGlsvQK5plA/X4kB8mvlnK2z6U+2MPQUvRPgdAerkd+F3975HXd2aBOKDEr5pVPFIUlhjzfEjQNV/g7vD1XpXmNMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8k9Cg9eVliAtip8iorn3Xux77iG61ZlTqy6/GtyMv9o=;
 b=pOSPqAKsBakrtZ/uHI2lTyLBAH1Hwvkx52/12HwstX0bbu2PyuiYS5EOfwhSBNQkLVa5JrXVpuBmBOx0nCKXIppl7gEKGq+Cy9HAYm0asBnLslDuW3AcL8yCOJDC2FH2o3zTUD6RlwPlQCHNfmXu7K9Lt+7flNb8QUZpfZZ+dmzHfd4q0z7nAvV6021PPGoTnhGcGSCMlxAFLkoNiFyUymov/XMVgxOEwUcnwPBmiyC2r1Ur5F+aAmjJCzGc+OLhafwOx1kPBMsMSfPMlbC0THJIP1RDcYvi9b7PwvaLC9AZWF5qNCKwVRYIBKajIsz7lJK6Cn0dFUp8sxVmQM2Zmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bae74b9b-eeb6-76d9-b4d4-55c9a4fb2835@suse.com>
Date: Tue, 6 Dec 2022 14:56:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: [PATCH 4/5] x86/tboot: correct IOMMU (VT-d) interaction
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
In-Reply-To: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ead8991-e37a-43c5-c6fe-08dad7919dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zF2NeH2QFHYGf1V0dqa3VfRfDDg2pYkxWxIxF6emNFx8jETssaFVDhYz8fbKonNS7ofOLN0tmNP+Q92Jqm+gWx6G3GiEVMMCx3fERwpohfoA8Y7yMcPPbGlOyDsAty3t23fta2qLX5Pt3LwbtjUNVCUnvWETz3065jcwu/VHyFLy9+aNE7rDOIMcwoJnPuONTq8YTVd6pYhelGNQ3jg8Ek/AuA+7ykK4OV891m8RiFzb7v9WIsnhx+cOJ7IJRhfVrcGp4VMTUloq1Bn1ZMR0aD4J/hnipobqaqc71lIZi0ThCIQiij11Crd7vcxuST75KkNo9wg+ENdlUv/aRkoUC6nIzsMlxWwCuSTgv1//nA5QsnExMcOfor4sDr6LUaJ1ESIHbNTtIrdVnG+PG3ZiNK7eFXjh8AyNUqf6suPfd2h2/nq4u8+6RxsmQthJb7nObnQkFhYa2SKHCmDc/Bw4nTAQcoqmQH7Sn5NmByt/LARhScCxHnLK0B36JJQdXcrv66fDw7LE0lxIu6/PpLa6SVQLRNIN7g6Wdm39IQ9rkraL0qn1o9alE8hvr7v2bK1cqvMnM+CyNjHYTzF9yjpW6y99P6robqxzAw0L6Mscr2pjzo94FMUfZZyZ07vnNTSQpR96vvXx8RpP0vi7XnPIPL939usalooPJ5X2PzmFK1Q2qo2mNXBP+aauTWC06mKY/Gt7+mRi1s45cQwdBiPKhwghbyWxo/Yi7vM6PCYXod4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199015)(36756003)(31686004)(38100700002)(5660300002)(86362001)(31696002)(8936002)(2906002)(4326008)(41300700001)(83380400001)(478600001)(66556008)(54906003)(6486002)(66476007)(6916009)(2616005)(316002)(66946007)(8676002)(186003)(26005)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cU1heWxya3JuUkhXK09sWDZodHNCUmx5aHo5TTR6SFlmbVZ1SWp5UzVsZnQw?=
 =?utf-8?B?dFpUTXJ1L3JLM3RubnhQclFyK1BXOUhZQytyR0RSUi9vOTVuQTFabmhlMzJG?=
 =?utf-8?B?NUQwSUJXRXloVTlKTWhFVFdtZWpiT0tOUHI1Sm9CYXNJeHhQQjRqdkZ4SXZ6?=
 =?utf-8?B?QldGOWFJdVlZYkNhSlNiZHZPN2RkbnVsK2NxR3BJM3hqYUxoS3hXL0FueFh3?=
 =?utf-8?B?WCtGU2pESDhLMFZ4WDRRMDA2UGJhcjF1WVdhckFneHU1UCtrR0NMeWVTak90?=
 =?utf-8?B?Tkc2WUd5dGN4UHJKU3pzNkJXblpsWCtEcHNCL2xxNTVYSldmcWR6amo0bi9o?=
 =?utf-8?B?RURGR1AyTUZmMDJqNGpBenlaeHZwUFcrckpmUW41VDlqYkJKVk10cGVIdU93?=
 =?utf-8?B?TEk1bGVnZ2ZYbmd5eldCT0NhUDdHMjd6WXFsSVJ5L3lVZmE5dFl3UERwQVVi?=
 =?utf-8?B?cUlOdEJlU3B4YnRGdzZiQXFqZ3lUQ0tkQUpseTQvVnI0dUQ0SzdYeVNFZk9y?=
 =?utf-8?B?cE81T3V3SE9lQVozR1BOcVh1bHBUZUVMeVN2L2pWbTVQVlJtK3VkL29jUWcz?=
 =?utf-8?B?NnVCODcvcDhVV0QzNXhXdFpIV3BxcDJsT21ueE9xdUNxSmRtMllxajJXNUdT?=
 =?utf-8?B?VlpVU1lrN3pLVUVPYVZkYi9SejRPS3l0YzZQVzZRNkVyNEh3Y0FGRFJiRUpR?=
 =?utf-8?B?aVNMcmtHbmxXMzFyOC92V1FXZXhaR3Z4YWZwYXNsbUMrOE5qbHA4Ulpzdys2?=
 =?utf-8?B?UnYwZGVDMHhuUkNYbllxVWdwZGRVSXN2WHFDcmpmSTZjSVVHNDVHVHk1Rkly?=
 =?utf-8?B?b0lxYldQZmxvQURxelZBQ2w3cjl0Zys1WmF1NnUyRWlnUGZxeVpGYmVXSDhH?=
 =?utf-8?B?Sk43dTBzZ3RSVzhkNFJ5NENRVFdhc3F4bzlCSEk1ZUpZUDZmbUNOWFJxT2th?=
 =?utf-8?B?MTJWSkMxTFhNWFo1OFIvY2s0NE8zWWFTWWlub1daaTZyLzVjUlQ3N3VTaFJN?=
 =?utf-8?B?YkVCd0x3OEFkY1drdERlY3ZRUWhXNHhtazlZV20yaUVUR24yRWtWdkUvZU5p?=
 =?utf-8?B?M0NxZzZYL0JtN0FLMGZxOGxpRy94YkpKMEc2ZmJHSzNKcTNaTzlvUjRkWmV5?=
 =?utf-8?B?WmdsTFFGT3lYRk5nVUxEekc3Y1crSytvQjdqeUVHeXAvN2lVMUVZV3BYbmdD?=
 =?utf-8?B?dVhobHh6SUsvWmRBbVpxYWdWKzQrL2xZSUViTnRETUl1TVdpR3ZqQmZ3ZXF1?=
 =?utf-8?B?TEFSLzdiMUJXZk4vN3gvTFk5QU0yeTZMRmJMK1VqVGFjQWQ4TXpQV2ovNk9n?=
 =?utf-8?B?ZU9ITkpwTnRSck9kK1kzSU8yVUM2K0pEWlVhQVNwZHBMejVoRk4xZ0VhVWpZ?=
 =?utf-8?B?NXJVOUZBOE52RUVnRCtFbDRVSVc1a1JxeCs0VkdTWE1qOHhEdlMvbkVSYTNV?=
 =?utf-8?B?Nm5aR0YwdTFnWER1YS9kaXY5d3VNT2p6RGwzeS9TYml5S0YrZFVEQUtibUxx?=
 =?utf-8?B?MTRWcVVyVWh4SGRML2FIc1k1bktEYzE0cEFUMVdCZVFpd3FINWROR2I3RHRH?=
 =?utf-8?B?bzh0OVRrTFZvUUttU1g2RFlMSHYrTXFsSmVXZG1vc1lhSGJ1SEFDcEFUcFF6?=
 =?utf-8?B?am5LWlpUK1BncW1kUEVBMHZLZE5oaFVTNlQ4cnhheXg3Vkp4aHVlTmhocnp1?=
 =?utf-8?B?WjI5MXNURHd2SkJLQ3ZGTm12TTd1MUVPc3Blbk8vMGtHT0dOZ3A2UjdPRlNq?=
 =?utf-8?B?R2JEZnpBbEMvVlBJM1FnL0J0UEE4d0hnNEE0SDNISGVmL3lPWmtoTlpPUita?=
 =?utf-8?B?TTlxS0VHOVJQSVk3VmtIdlpCckhwaDZrbjdNM3ZZT0hybTBPOTRuU29hSDBo?=
 =?utf-8?B?a3pmYkNmeW01Y1FBN096NUJyYnVwYmtISCthUjZSUDdOZUF1VlNvdUVqOUQ4?=
 =?utf-8?B?YnR4UjZzMkxld0hZQm9VZEtsM2UrYnVYZWdkWDdZWlJ0eDJUQWd3NDR4YUtE?=
 =?utf-8?B?VVdQYTJVaHJHNmh5T1FnUUxTVitaeGdFTGhBc3VHV2FsMkV6Y2V1M1NKbllF?=
 =?utf-8?B?YlRCU3JmS2JTWDJZcGd3UWJ4Q3Mwb2pZaHNmalFIaUUzZXYrSElFRDdwVnk4?=
 =?utf-8?Q?DzFnFf+oimaE4pqwCueWK8RmP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ead8991-e37a-43c5-c6fe-08dad7919dcc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:56:04.5269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyiK2i1GuH3pNeD1f0Ma6VfNt/q+GKnxC3L2g+fUXAY1NZQ57ITGvmvqGF4W2kEjOxFJO0+lYY57HNo6Wo039Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8670

First of all using is_idle_domain() on the subject domain in the body of
for_each_domain() is pointless. Replace that conditional by one checking
that a domain actually has IOMMU support enabled for it, and that we're
actually on a VT-d system (both are largely cosmetic / documentary with
how things work elsewhere, but still).

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -31,6 +31,8 @@ static vmac_t frametable_mac; /* MAC for
 static uint64_t __initdata txt_heap_base, __initdata txt_heap_size;
 static uint64_t __initdata sinit_base, __initdata sinit_size;
 
+static bool __ro_after_init is_vtd;
+
 /*
  * TXT configuration registers (offsets from TXT_{PUB, PRIV}_CONFIG_REGS_BASE)
  */
@@ -201,7 +203,7 @@ static void tboot_gen_domain_integrity(c
         }
         spin_unlock(&d->page_alloc_lock);
 
-        if ( !is_idle_domain(d) )
+        if ( is_iommu_enabled(d) && is_vtd )
         {
             const struct domain_iommu *dio = dom_iommu(d);
 
@@ -444,6 +446,8 @@ int __init cf_check tboot_parse_dmar_tab
     if ( txt_heap_base == 0 )
         return 1;
 
+    is_vtd = true;
+
     /* walk heap to SinitMleData */
     pa = txt_heap_base;
     /* skip BiosData */


