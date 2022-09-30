Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285035F04C7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 08:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414011.658049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe9UZ-0005AP-Kv; Fri, 30 Sep 2022 06:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414011.658049; Fri, 30 Sep 2022 06:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oe9UZ-00057R-HP; Fri, 30 Sep 2022 06:27:23 +0000
Received: by outflank-mailman (input) for mailman id 414011;
 Fri, 30 Sep 2022 06:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHGM=2B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oe9UX-00057L-DF
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 06:27:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2063.outbound.protection.outlook.com [40.107.22.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc3c131-4088-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 08:27:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6778.eurprd04.prod.outlook.com (2603:10a6:10:111::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:27:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:27:18 +0000
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
X-Inumbo-ID: efc3c131-4088-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2Q9p1sIDILL7OpiEi4w7iNJY9C0tqvvgxr6AEQLzur7INJiO2vA5zAAHjTytlBd8xTBtRF5aJ6rF3fpD9WbpFnjxkwWKH8WyQuAiJ+gFNm1j2IvICNDZCtQBLjUtaWzM8HdOne5yWjRJGfsAR5uooJqzmx7XryXgpVkX7ARrOIEbSYbSfNE0xwoyQ3rOmdhxmMAc190MOl+Pza3HBBG1j3IeyqBN7EWsfbIX3rlpJBDMqLBAp6BMT2UH/0d+vu3fqU9HWPtwioZWnYE72Ew4KMC2bDbqhsM/l5JgG1oXoO84ECMc1NqzBYm9br5pwyNer/zHajsri3pmw3Qdhbc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vSe6zMJQMKQZY0HkfJTH4TFHIMwGZdcGx5JC1qH/AM=;
 b=cBpKfkN602BL/rw+Nwad7afXmSwd8eW54YFXDeB9rcdYsBfHnBk1Fy4Q2+Ni9DX0p+gFH5iWhGKhzw7u+kSzm6w7Nf9dfSlPGIEGz74sVsv5CbtW/ZThI/IIvMFrFrSY1PE38EfZsUm7VxAfUsTr+THb5QVmjsnpZX0thXoR+PjfzPOJ/vZTx67lBSPnE+DDW8wiu/oXXZgMc1x2z3Efkky77z1d3CAuqXaGGPHzwzJ5hC36OzcCn1/w0o4psiizxK+ADn4SbRLBlAyu7603+cs1Q/C0EJeM3M00d9T/sbXLtGYwBRBy2TmssNa6FbSXq/qOYEDMBv8sHmhPpc4pLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vSe6zMJQMKQZY0HkfJTH4TFHIMwGZdcGx5JC1qH/AM=;
 b=O9T662CGC/XmWh3zFIE9/i5Owmz9SssPZYh7MrnQNxvApD/ASQ4LcNjsMGkjoPSW8e7TbDYHA+eD2/5VLt4KC5F6WnjS8ZW4Y+OHnIcbB+xYJX5/GlIqI/bBnfkTYWXqthRloVfsnwQ+lokPKwxQGuliuLH3Nwkhtceh6xgPXtcoNLVSx5CbJy4oh/WWKvtC9JJu/lQT2Htj3wvNqrnszO1ONr/McqqMnqIVVCG/gSbUhMJTxcV0fJ/S5BEf+QYy1FprLjn5sRysGRvFWzgSmbNZTG0xFVncoUgyLsTSir4OLQQUmjsaJ4pVt8LQqUU3gFG5DyN57l8WPfZ5XozC5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d255a6e6-01c6-c1b3-eecb-71898b3a5554@suse.com>
Date: Fri, 30 Sep 2022 08:27:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm/vGIC: adjust gicv3_its_deny_access() to fit other
 gic*_iomem_deny_access(
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: a12b3e58-b036-4186-ee86-08daa2acd2e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JHyYW33sgvpauSVa59/t8GvhZXSMIjjWEe8LIPAhO8lcEAO2ghWA20uChYX5mpLudKfo3PdR12yrysMv5wOSeyToLRwVersAE/neB0whHSqUt9wu/MIbPF+o0+LXEg6GxmNlgIGyR2drT1wXbHCMg5aUgCqjoMlvQ/A972EP2URa/RRUv0Q9Ti5QYh5miXK965KlvA8aVPcmQYV/sfpugX1jmm5Y7fYIaZI3VBoD01k22L4q+OJntm75Qv48WdckyYPpLy0Muc2xulAqguNqe6ZvPdStG+V8r1hBJVvjsjgTwv2RdvlrY0/hudikSfZbh26tfoPU/NVucKa4dzbFx4BMgLyZxgrRSGmCfA5Sg/khe0GviUj31FKx/5lQwGHIH5rDH3weNWguIXg+ZANZiZ/YmsD01UUFxQc3bbiUrjUsxFvUjuG3Fx2ZnPML7zNNBKsupXfaT7c0YQdETtfVxZv1GaRPoic+JHQPu2MUHDI2AmQGAV6EdIlRwZH+PwFdNefqdHUH0hNArcxagz3euhFTKvidiot60GIKV2VhNf6co7RgbItvXG60BGQoyya808poC5MxwP+Ib7P229h7NfF7YpAvSOWL66lRwExalHHTMZ9YPgr9EeSLqlubsIncFlXpaiVX1SJ0ElA03eNYfQMgEprHKARQQpAJSebLCP487Ea7elenij2fc048uzeQSDZ8iqmfkr2W+AQMeVHu0rEH+QAWn7QXc0c7i3OMnsqcXJnzaWhfn9ferj14YfYyeT/Wuzhy3eGAAk6ZToc2Ob/vzOxdPHQQAaCNwfeDRC4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199015)(8676002)(316002)(6916009)(478600001)(86362001)(6486002)(31696002)(4326008)(2906002)(54906003)(41300700001)(38100700002)(8936002)(31686004)(36756003)(6506007)(5660300002)(6512007)(186003)(26005)(66946007)(66556008)(66476007)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGFIaFlkbFNkc0pMUDQydTd0Z2lTaEVRMzRFaEhib0k0WGdCQktYTGMxVmZm?=
 =?utf-8?B?M1orenZNTzA0MjNRUFdUVXAvRk0zNmZQR05hR1lRWjc2aDE0eHZ0VTZiU29k?=
 =?utf-8?B?WjdEU1pYckZleVRXN1Vaa21xTU13eFBtYm1Kckg2UEo4b1djdFJYcnJGRU9p?=
 =?utf-8?B?L0RoR1dLdm05RDk5ZndKRWZEZ3VDU21JZnlrTG45ODNka25aUXViNzR4RnpP?=
 =?utf-8?B?ODk3b2h6RzRNNkVmTERTRDdQR2R3NElObjZuS2lpK3RKdGtMVWs3TGYzV2FQ?=
 =?utf-8?B?dDZUeVNRckxXZGYxMVVJM3FTQklKbStLUzVScEx2VzRMOWF6dDIrRUp0VnRJ?=
 =?utf-8?B?T2FnOG9aemxSZUpwMlJhdVZpQXhTUnR4eGY2U3drcnhIcGRMQmVYM3RoNDF0?=
 =?utf-8?B?dGNRTkoyZ3RaSW03MXIwcWhNdEtHSFp5R0V3MnJwQ2pLNTRwTk9vUE5rWGJV?=
 =?utf-8?B?SWZ0K0h3M2F2MEFIR2xpcWlJY0cwNHRLaW5WdkF5MVJlTDg2YWsyS0g5M2FL?=
 =?utf-8?B?ZjZQbUhnMWZZMkJoTDFjOEphN2I3ZWpoWHFjZXhSSFQrWlViclRNZHA1THNr?=
 =?utf-8?B?WnIycHZnOXAvaFRIRVM4QzZPc1g4bFZVUHliOHNFRmo5OFNuSi9VRFJrZ3Nh?=
 =?utf-8?B?a3ZtSTF4S0tVbkpTQ0s3RS9BZmF5WFRUd0VmZHVZNXI2bVJkR3ZpNFlaSDl1?=
 =?utf-8?B?T2UxU1U0bC9KVGFOeGtnY0JXakN4OVMyWXIzbklUVVBhMVBxcTFpd1RxQnVs?=
 =?utf-8?B?OE1SZ3lET0dqME1NejJYU0ZPWkVQODlTTjlvSVlPNStkSlNXZjIveW1yVk9M?=
 =?utf-8?B?Z2pMZ01oOEJ6MGhmem5mb1NKbmVQaC9PVlBoT3FBRG0yYUpSTENLUEFYdHRv?=
 =?utf-8?B?aGpvN01pNU5ZMXNZSklXUmV4YWZBbzkzeG1WL0Fhc1VaQmxvbjBJZFpKeUpq?=
 =?utf-8?B?eHlCYUpLbFE5TEZJQ0Z0WHMwSFRNVVdlN0syc0tsYTF3b2lCSUZNNy9wdkhs?=
 =?utf-8?B?SERuM1E0R25NaGU4NWZET2JueTBxb05nNklRM1BWWlRzM1JDemkrVGRlR2dh?=
 =?utf-8?B?bFVwcXBsaE5GaXp4VktZbmdTbWQ3bThXVWJOSDZSYnEvbXVkUmNXRWgrOFJM?=
 =?utf-8?B?aWk5akVYSlF3d3pqUmRTcE1BNmdlZUxCdHJEaDRlUnpPWk83anVIRlhQVGlM?=
 =?utf-8?B?bTBGUEtJSmJqVnhCb0JSU0VwdVloR3h6VGtCNnBGUjdNZjJoQmxsT01SWWQ0?=
 =?utf-8?B?SlVSOVk5TUNsS25PYS9kZjB3bVFkdnFncFo2a3RxQjRRWjZKSm9wcGN1VVZk?=
 =?utf-8?B?dWVOQ3o3R29OTlBQdFhRaWdreVlMVHQvcnlBUzdGL0JSUW1Vcmo1ZFZSbTA2?=
 =?utf-8?B?d0kzcENmazlxSkxic2lhTFl3bUVkYjRvOVdvd0hKNXVnWGZOZXFQVTdlcXEx?=
 =?utf-8?B?RXNWcGlXUlVMZVEyZVVBbEpWVmdzdk1OR1BzejdMVmV4M1FtcFBtWFQ0aTdT?=
 =?utf-8?B?bVN0SUZjRldrMHVPN1dhN0VqVjl1c0YzQWlVYnkxbWRreVZsMm5TdXovVnFM?=
 =?utf-8?B?bDZtcGVrQngxN0VPTGdtUXV3NEVvblRGYU9FQ0FKQ0hhRDFQbFQ1R2dYc1Zn?=
 =?utf-8?B?MWdZUlluakFXNGdlenY3MVhaMXc4Z0pMVTU0YnVDS3dvQ2NsM2F3TDBFYzJp?=
 =?utf-8?B?MHBzKzluL1k1MVJaeHRwaGt1UHF4L2Y1QnFuYktsdGgrMW51NDlYb0dlVGV5?=
 =?utf-8?B?UVI2aFdocWZvWUV5ZEYxWHhOSFlUS0kzNzdiVG9UR1ZsUTFDdElST2t1Wndv?=
 =?utf-8?B?UFVGdTRPeDJoYUl0b3RnUG50L0loaVJTeDFtV1lCT24ranFmRUIwVGZBWXpF?=
 =?utf-8?B?WUhWeS9qMzFXSHgvODIwSHhiQlZVaTlTaHlXR3V1NGNvRkpWZTE5U3lHWHp6?=
 =?utf-8?B?MVJGcHZJUFl2UzljOElqdkZsZktEN3RFbUN0MEQvV2dFS2FqR2thOXM2aGhY?=
 =?utf-8?B?c3FOQmdUdVVhL3VGeUE5T3hleWdhbDM4ZTExQUNSWkN4S1UzK1ZJVGovdVdI?=
 =?utf-8?B?b0wrZTZUU0grUzRvLy8wSWFna2wya2J3emk1R2VkSDIzUUFMU2VFekMvZ1hz?=
 =?utf-8?Q?2zE7PvQ/WWpdw+U+OGnUNUEb0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a12b3e58-b036-4186-ee86-08daa2acd2e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:27:18.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5e/YEhhVqjej1cxJWe3oIXWIsHVZi2IaNHlkaIOUroq7vnScr8fKTzsXfsiBiGozQMsBupib+rE57cpiM7so/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6778

While an oversight in 9982fe275ba4 ("arm/vgic: drop const attribute
from gic_iomem_deny_access()"), the issue really became apparent only
when iomem_deny_access() was switched to have a non-const first
parameter.

Fixes: c4e5cc2ccc5b ("x86/ept: limit calls to memory_type_changed()")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -892,7 +892,7 @@ struct pending_irq *gicv3_assign_guest_e
     return pirq;
 }
 
-int gicv3_its_deny_access(const struct domain *d)
+int gicv3_its_deny_access(struct domain *d)
 {
     int rc = 0;
     unsigned long mfn, nr;
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -139,7 +139,7 @@ unsigned long gicv3_its_make_hwdom_madt(
 #endif
 
 /* Deny iomem access for its */
-int gicv3_its_deny_access(const struct domain *d);
+int gicv3_its_deny_access(struct domain *d);
 
 bool gicv3_its_host_has_its(void);
 
@@ -206,7 +206,7 @@ static inline unsigned long gicv3_its_ma
 }
 #endif
 
-static inline int gicv3_its_deny_access(const struct domain *d)
+static inline int gicv3_its_deny_access(struct domain *d)
 {
     return 0;
 }

