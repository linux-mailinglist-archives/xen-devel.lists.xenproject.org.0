Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFE16B7A01
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 15:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509308.784825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbisl-000636-Eg; Mon, 13 Mar 2023 14:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509308.784825; Mon, 13 Mar 2023 14:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbisl-000609-B5; Mon, 13 Mar 2023 14:10:35 +0000
Received: by outflank-mailman (input) for mailman id 509308;
 Mon, 13 Mar 2023 14:10:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbisj-000603-Ji
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 14:10:33 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfc66eed-c1a8-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 15:10:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 14:10:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 14:10:27 +0000
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
X-Inumbo-ID: cfc66eed-c1a8-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkyY1VJtrgh/406jok2tZIKwvZUFuqt41LOoVnPoj3xnrrvoyh7i+btDN83pu0aie1hVKwSjTXpLc4tM8CUmYgOOyiIeT4gmODiYij2FhZSa9MhrXVMJf2XnI+f3AliZHgy4DUxQaKv10K0n9nSJVl4TPsBU6AwVHGUt4LRN0H0Dsojvgh4WbGAGYF5f1SGjkKdVNL/NYtr8bww5ekOIWYy+2HfJpwc3mEH1bLr555C0FZRFubWCUfitC2Gmg2RvVlJby81IOKbhflaOKA950F/DsGhqgGgN2rtyQ4GTycOo+izNzjKlagnx477fTOW7D/LE8mNvAKXLPhyAgtamZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8ZfVvF/xyDxSOUC9NMxxnc9ml2ayEDDK2L8jfWTChE=;
 b=iZr/w9pMPxbXM+W1mbL96Zb4d8Tnxy8FbTX0mlcwLVpn57FmPbEG0kiYWDWFkX9YE6SO4/i1VLciWtv1ZhGMSOmJlMxehC9Aywc3m7X1BZ1FXWi9EumGv6ntRiRawXxRCNZ4hzgWUGUC8Icuqik8oj2GKr2zgNADMM5o2xlZqq0opw4fk4i1KSKohiHOd3XnEqq7dVSS7KlbMktRnm7cTUdcdMTEVtCS5a6OXWVz2ihCzh+ZiJG3vivoWYb15enxBp2Eu6wVugIwBikzTDeAEk31vcXwh4Ovsr7sAW+4nfFJlO5l8Px4ni6CDL/44D4ufwnmwddEv0ve0fXY55MXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8ZfVvF/xyDxSOUC9NMxxnc9ml2ayEDDK2L8jfWTChE=;
 b=payrv5uZURcIDGo/haWLTqP8FO/x0KZBiRmmb4EV8g7DWUHu2PLy9O8Z1Qe9It4Pp/DD/k9obEVE60wK1KJKc4YeXdu8X2AWslUY/zdbMvnX+mWQ3mcoHSAqwQ6MktcbMRcw0qhFONRWhVF8SzD0kY4IneeNfVLF7UZ5AgQtEFIhOXuF4z3LEzkFiKhLyHjUZR/6Why84NY2Yy65S5cz1g/O+0OYOLa9t7c6E1qwEPITodL3kLZCgGMqZQclS33KOSELtVUNg7/1YnAVHPFjw13TZ1OenYGHlfj3axXXBky/vCyU4/uV7VeN6P01glOJikdxeQgwJjKlNbyCDLBP4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eecec806-1728-2efb-ad69-862fcca5ba75@suse.com>
Date: Mon, 13 Mar 2023 15:10:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] bunzip: work around gcc13 warning
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 3888adcd-a6d0-4030-d988-08db23ccb221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QiygXfswLAvfQcN8shlf9JXUO/lYQauANM66IpKKRIQQ2EGei8EUl/UlQbcwmpdVbgd7epaEGgGsO+Hvz7cqGZH5jHzQI2djhKxr4kOxzir36pTULLU+3ykj1YVTAN7qGMRXXtuOobrPYaCCkHEtzEzxy+lZoZP8yPYIvqaKykVRDo4Ylous1Os+SU+uQkt3rCw5KzDCMzmsiZA6XOTRiDmHooBJtOJvbWpWo9/UQ+duY/MKLFhzncuw7maqxiB91nttFRz/jOWjlgw9ygtlm88PkFKvIn/794vQvzSF8VWt2XILoxxEANqxRpcr9GkSMKDHb1/yBF2vFZT6Mj7metWdMLfCrqoaUOVlsSPqm6jotVTOJJ15Q+isvRbW5kVUnzpZ2OC+u+qWfTMGZCoadyAnVafXM3Un+13KiuflgiUX3fHmTrwnssatCmMCZ3I9WRrPmBikNKz98aew7LBfbHkunQ7lEXXLUDNhKxw7EDjsCzhCANbKbim45nsZZM7YyXeN6LUG0hp16OEjThED6BRFOyxWcS5SuYOqWS2J3+Qnn6F5Fq2X0XlR7xs7glSTFWewYHgWzwHVj6GUUJpRRkAL0OZ9/q6fNAuhhuZA7z4w9xbtbfYDllEnJFSVoB0K7A3u/TPgFtzvFBlUh0T1VUG+rLxsloigUDUjysFJZL0A9an1mmqKHrFSuMuHArco/DnEwW7ZRInoXxd0hjTV8dMwgX4cUeMw0iL83cB/H+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(366004)(39850400004)(346002)(136003)(451199018)(2906002)(41300700001)(8676002)(66556008)(66476007)(4326008)(478600001)(316002)(36756003)(66946007)(54906003)(86362001)(6916009)(31696002)(38100700002)(966005)(6486002)(5660300002)(66574015)(26005)(6512007)(6506007)(2616005)(31686004)(186003)(6666004)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qmp1Y1dobVdYTjRVWjJ5OGdMVTgzK2crNW5Tei9SQWVEMFpWQWt1d21WbVhX?=
 =?utf-8?B?NmgzZmd0RzU1Nzh0cmdsMk9zM204OXp0TXhyaUNBTEs2M2ZEMlRCQUF1UTJP?=
 =?utf-8?B?Nk1Scy95c09YY0cwdVFLd0RmUDNVQVBsbVo3VkFuRHlpbWhPM2tiQWFYMEVR?=
 =?utf-8?B?eGVidjhnTktSVERpam0yTVdOMWw2YTZZNVZsbHd4Q2xMSk41MER3Z2pzWWlh?=
 =?utf-8?B?NXJoSVc3MHgwZHIwN281M1NFVkNxNU52dFRLU21rWTZYQ0xWRkltV1NDMTVM?=
 =?utf-8?B?TW9CaW9uQUJ3KzVzNEZJcWFJaVB1bjBicWtabVBpRldkMS9wVGV2WmljTW5Y?=
 =?utf-8?B?RExaUFdVamVIQ0lwbVZDdGs0UGQzWWZUQW82YWlycVBIQjNOS0pEZTZqdlpi?=
 =?utf-8?B?UUs5RnErVXNobGM4ajlGVmtjcGpCWGtyTWhqSFBLZ240ZlZwWHI0UERvME5I?=
 =?utf-8?B?YjZGQ0NDRGwrQVVONWVJUkp2SVk4MkFseW56cGR4allCWFphbzNVWU43VDZq?=
 =?utf-8?B?ODJKQ2F6cWxsTHBjOU94dVVyQVgxZnFkQmRBeDc5NmVCQ1RxZ2x2MDFkV0U1?=
 =?utf-8?B?aHdreVZJTDJPajJnQ0tSc1RaMTRZY1NLWm5KdU8zYytEbk5oclhpMmdPV1Yr?=
 =?utf-8?B?NmxRS09Zd1cxUnFUZzNSdUNUWlkwYm1lRHNEeG54T1BoYzNoaFZSc1hLeE9N?=
 =?utf-8?B?anJLbGdKZDB0ZmNQc0JPcklBVlFtMXpjcWtkSzN4dzM0dnlUcVF4UkltbVJt?=
 =?utf-8?B?YzNXSFJmNW8xdDlONVpKNXp5b1JjTVJGWkRCMWhKd0Z3RERsaEVBQTVxK0pV?=
 =?utf-8?B?RStobjR6RFo2UEdiRENicEl6aTgwLytramdPMlFqcjNCK3JwSzVBOUxPU2ds?=
 =?utf-8?B?bXIyeXBPNUpqT3VNN3RFa29DOEphcnhZNEtmRHZnMDY3NUdwRHRvQXRqdUlx?=
 =?utf-8?B?amt2QnJSOWloOGhOM0FyVVZ6cTVDc2NYbFAzL0FkZTc3VExKVnBFb2VwaGp5?=
 =?utf-8?B?TGt3cW1iemxZRVFvcWVsVDNENlMzSjQyVzF3UUhpcE93czUxeE5yd0dRWUw1?=
 =?utf-8?B?bE9iWVlBZnpwN2xsWEp0N21ZN2tzSFFRbU9kVC9MZlB2TVRmRlFpelhoN3FW?=
 =?utf-8?B?QzlWRUg1VlMraW8xUDY3bU5kZVhXZU1CV0FtczIxUzJZMnBKS2ZGNERvdXhj?=
 =?utf-8?B?ekxvNVNnUWJlVFBEYTB2THFla2JQTG50ZHVmcklybFErbXFwRGZqUjk3ZkVS?=
 =?utf-8?B?TnZPQWVHeUc3ZVV1ejJ3VEJmR292cVN5Vkw4OC9VelVIazM5clhqamNPdjI2?=
 =?utf-8?B?SXRNNXE3V283Q05nTFVuZmZmcmVZZnUzL2VValJIbURuQjVycTlJcjFDYmNa?=
 =?utf-8?B?c3o0aHRIZWcyOHgzR2R4QUQvWUR5SVE1MGJNTklqeUROeFIxdzZJeGdXNndE?=
 =?utf-8?B?VENXdXZPdlBxbEpaYjZMVDFDU3N2RUI1ckwzd2VhSFRSekpaWk40UXpEdVNO?=
 =?utf-8?B?K05vR2g0K0JJdUpDMEpjZlJOZzM3a2ZlTjhEUzBNeEdteE5HQTl2MFluZXBB?=
 =?utf-8?B?NW1iNW9GR3R0ZVZjT2JjcVd3SFhKUjlXZDNNNWQzbFFYMExVM2JlL3hDaGxy?=
 =?utf-8?B?Rkc4ek1JMU45VEpMQTZ2all1T0tkSHBOWnp2VU40cm1yT1BwRGpKQkE2YWt6?=
 =?utf-8?B?YkRGbDdkRGVtTThuNXN5WUp1RE5IZ3NJUmNHeTBPM3J5UHdxakhXV3RMbml0?=
 =?utf-8?B?RjRyVkJHTmoyS2xxemREQ1dRYlhjYUZ5SU8rL003blVrenlDamh3ZFdlTU1O?=
 =?utf-8?B?RkdicFR5N01QZ0EvUGJQWXN1a2ZaeXU2R01sVTVhMWhaU0E4ejZjTUUyY1B0?=
 =?utf-8?B?L1ZYZ2FnUG1YWFJjSFJuSnFsVU1oZjcyTjNUcDgyNFBRT3RVN3RxV05TQ3Zz?=
 =?utf-8?B?QWhRV09nK2FTaTkxa3pjanRNS2ZIdk8zL21PQnJocitaakgvOUtwWVptUHM5?=
 =?utf-8?B?YzVpbGRuKzdUdGlnU3VXRlV2U2RFZXJxSjFsUzFSTjdXelNXNFYwN3AyR1BM?=
 =?utf-8?B?b0pIajU4Q0lqdkJ3Si9xUTFDZ3M1T2VUdVpWMTlKcUNSMmx4ZHhWem0yOGMv?=
 =?utf-8?Q?5lZebsJEtB9ZNu2snnitPVw/x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3888adcd-a6d0-4030-d988-08db23ccb221
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 14:10:27.3795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/Jv+xyXEBqKfeVCl8wAZ2GLOJ7uH5d5fzzeFKeiiWMTqArrQ3FCtIulHNA9ED7kpN+xIBFdGzx2/e/0MBNq3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155

While provable that length[0] is always initialized (because symCount
cannot be zero), upcoming gcc13 fails to recognize this and warns about
the unconditional use of the value immediately following the loop.

See also https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106511.

Reported-by: Martin Liška <martin.liska@suse.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Put new code on a separate line and add comment.
---
RFC: We've cloned this code from Linux and the code is unchanged there.
     Therefore the same issue should exist there, and we may better get
     whatever workaround is going to be applied there. But I'm unaware
     of the issue, so far, having been observed in and reported against
     Linux. This may be because they disable the maybe-uninitialized
     warning by default, and they re-enable it only when building with
     W=2.

--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -233,6 +233,11 @@ static int __init get_next_block(struct
 		   becomes negative, so an unsigned inequality catches
 		   it.) */
 		t = get_bits(bd, 5)-1;
+		/* GCC 13 has apparently improved use-before-set detection, but
+		   it can't figure out that length[0] is always intialized by
+		   virtue of symCount always being positive when making it here.
+		   See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106511. */
+		length[0] = 0;
 		for (i = 0; i < symCount; i++) {
 			for (;;) {
 				if (((unsigned)t) > (MAX_HUFCODE_BITS-1))

