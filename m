Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF823F9A20
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 15:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173661.316832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJbvm-0001b2-5I; Fri, 27 Aug 2021 13:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173661.316832; Fri, 27 Aug 2021 13:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJbvm-0001Vy-1a; Fri, 27 Aug 2021 13:30:02 +0000
Received: by outflank-mailman (input) for mailman id 173661;
 Fri, 27 Aug 2021 13:30:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVCk=NS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJbvk-0001Of-KE
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 13:30:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 472d1857-56bb-4d33-8041-3dd8680df122;
 Fri, 27 Aug 2021 13:29:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-A85E12jrOC20ynR1JY8aYA-1; Fri, 27 Aug 2021 15:29:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Fri, 27 Aug
 2021 13:29:55 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 13:29:55 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0137.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.19 via Frontend Transport; Fri, 27 Aug 2021 13:29:55 +0000
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
X-Inumbo-ID: 472d1857-56bb-4d33-8041-3dd8680df122
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630070998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IOlB61o+BYIQDaXxoJ+QZGDcmYkubFUPBmNhexBdjwg=;
	b=MVnvy6D/DzCu5mA2YyRf8eqM9wxp/WBvEnbP0pkJXothkNcYNG05AZDoC07IzxIZu84FNn
	EwFaliY5Rzcl2zFUxr4U5w1lDMGuhPXCjVwog9q1ZUqjo8fkn2YzC/pKhzRZX21f8llrBg
	zcN4XkrHIUCAeq8fmaIqyTxxwl+V3yY=
X-MC-Unique: A85E12jrOC20ynR1JY8aYA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGDV30WX8RClxm27kp9LbKynHm3rn8ppkHTW50c5D8DlGQr34+N2trhDHdxOL0uqzO+P70yYnJtl/JNpBITR8QahG1J1I8GERTWPbQ+4Yi/xuIVMGmmglq4CsgN7Cu19XIv8SYhdPpGD0HEE5CoyDgTaWSnRCYc4NWcMs6UIEy1srurvZXj3ywI1VEquMLUTcjVE13Vb5DcCuI+LBdocn57UvyCszk0tsuuFYR6ECwLnX/wWSGau0yNbJ6rJFDfu2/8YFGXpFF2XzmoRxvug3pMafaVMwuw8V4O2f3C4+BionHLTHb5prKGFm6dE6fLxzg9RJz98PRTdz1DjaGii+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOlB61o+BYIQDaXxoJ+QZGDcmYkubFUPBmNhexBdjwg=;
 b=Z/nnlmdWbTe0MrL0FcRToG3WTea670H27D5mrjPc6jNghp4csAP18zj1n3M8dTQIN1IO93n8fx5ry2J/7+LvtfFcPzCjoe6FS1jlWjEQXh/l3ZBC29pKSBKt/fjGy+7a0iuD75XYz6OFbaJQVrwZAcOCXWN1boPG+TagFvwH4E8U3f7I8Ik1ff2V+Rz1URgYDeWGZwAiWwLGrxtkiR1M/N7cfPfdmiBejCggM0jnO89mL8g/mezl9BTb5qqAntwNDcv5hVGVBNu6mcQRJc08OPzWhXRBzOUHy44eCAQPXDo5UG48w5qXeXcajb8mqrrLlyoX9P+hnyytk0DOmN//Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: XSA-378 fixes breaking PVH Dom0 (was: [xen-4.15-testing test] 164495:
 regressions - FAIL)
To: xen-devel@lists.xenproject.org
References: <osstest-164495-mainreport@xen.org>
Cc: osstest service owner <osstest-admin@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6bf7f023-a00f-4853-fbe8-83d9d2aff370@suse.com>
Date: Fri, 27 Aug 2021 15:29:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <osstest-164495-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0137.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40d951b8-c103-4b84-11f3-08d9695ec22c
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7038A693D4BDEDC3CCDD0621B3C89@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bQIwq5jK8LytQsjHqf0BVQNjAJiTbvCa6LW1Il5AOdihn156u0/6PO/GTDOBig0kTYrdyl2VL4io0KfK0RbMxviN1r7IX2PJy/UjtZjucqgvxDbxMfts5VDaEwBMvjORuAGLrZ+dOZg/AbC3gM/yFn8JNZzmfm6m2nIQDUZQx1K5BshkfhSL5H/cvmnPLBmR5i3Ie02ketyMblVq0YtWd/+00O/NGMHp1Oo4on97pC1D4CMBmm34JlMoZDBjZdsE1K56bqQvb1sSAhDApRG/zSaqKMZ6m4HBn/mqwnQV93jqtynkbXYYNIiSn9FIJXSmFub2Jf/ymUqnlZZKn/S7SKp7yMJq/XTI+ZMuVfHjjbsL8wyfsuo6R/W5YScSjtsZkOKqDUdVKtvqNVDjBZhIPO1AcHAo9lRZEqA7zFnjw0uGr6aMGgRqm6w475xAE0iZrQ2T40Ekz+JTgI+lmKclYyii2N3nw9Z7/oFn7xKrybfZA4iujxQ2WMXaKpr7hMidNZV/WTsCyV3xScRmL9tUIJXGQL+Ic5CVPcZxTtyGtk1jkLdmQeNwb7+tzKoUibJ3kZeJbecStj7qnLxQGRALcJ8F5xkYXCFXstpXYkFFxsYqoS+0CtgeV7sg5Ao2gOS3jK1ap3SSgN7vZ7OWcRYEYO9NQMSL0TgO3pzthzJ+furjQHXzVZQ/G0rhYY6IwdjGMJta0936OYK4e9I/oFyO+8rXu6q56/PVwXHMiUFL9NVy+1+rUNzX1nNop8oLoCLB+DbfE0ActglIedNVmAHi+V5JYIBhhKYY4rZl2VYa8F8nP6cFDcyRYx60pd+QzlxU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39860400002)(346002)(136003)(366004)(66946007)(66476007)(36756003)(8936002)(83380400001)(8676002)(478600001)(38100700002)(956004)(2906002)(53546011)(316002)(66556008)(966005)(6916009)(26005)(186003)(6486002)(16576012)(5660300002)(31696002)(6666004)(4326008)(31686004)(86362001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUROeEp6RUVuazZFRVNFWDJrL25BbHhqMy8zY0x1KzFPVXdhcFpwVk8vbXF1?=
 =?utf-8?B?ZVpZRTZtTlJ6OWpITlVvYkR3bXZtT3FEZWxWQldEeFhWQkVJNlNsL2tGd1FX?=
 =?utf-8?B?WkdRR3ExTFdUYTNSS3ozcThaREh4SVNMWVE5aGVMcDZ2YnpscGRPSmZtUG1R?=
 =?utf-8?B?UDVTZUFQN1RhWVRvQkJCMUVhWVF0bE1YZWhrUHNrV0tjSStXZiswRHplTE1h?=
 =?utf-8?B?QjQzZ3JuUllYV1ByOFpNTktTTm1qUGxoNTU2d3lyeStrOXEvU000SXA0WlJG?=
 =?utf-8?B?YTZ6NnRRUFpJNTdhT3AwYUlrN0FTc20xQ2ZmeDNoZUxtMGRYSmtNNys1bjVW?=
 =?utf-8?B?M0V5UWY2NjhOMlRoR3Vad3EvcWNQaTk0NWNzRUdtTU5ZRVZIbVFWSWtYa1JX?=
 =?utf-8?B?K0NsNi8vUHhtSEo1VGdSMjdrRVkweHNMODBQRXlRMmVUS2l1dVRLWXZzYXJE?=
 =?utf-8?B?elA4QldjOEt4SFVjaTAyMFU1a0U5Y1JzcFlNTzFzK1VsK3VjVW9rbHpYOGt5?=
 =?utf-8?B?Zll6SjFnaDhIVi9wMDFGRVIxTmNVaEF4eG8vQTZMM2hHNXB2aWtzL09waWxE?=
 =?utf-8?B?aGd5MlFlWGdFUHZiZmdFb2RvUTV1YlNEekpiNU42TjU5bndnMVZlK2h3STg0?=
 =?utf-8?B?Q3k1WHRiSmJ2VUNZSUlpTk9WOUZXQ2VFVGpFYTZJSlk1MWFVNUxVVElEbG9W?=
 =?utf-8?B?cllDU0tRSlNQS3pTbFVrQmVhSXh6dGEydHg4K2NxSEVrbkkzbFVjSDZYSXRC?=
 =?utf-8?B?RU14eklIL3g4TDRGYzdUeHl0SlViS013YVJRU2tFRzZCc0dBVHl5WkIrcENi?=
 =?utf-8?B?QTAraGpBQlZUdzZ1bGVkb2M0dnlvL3FkWTg3Zk9lU0xicUgwR1laelBpQ1lC?=
 =?utf-8?B?MmRaemNkRmg0akJSUTR4S1J3TStoeTREL2M5ZHdQL1l6MHErUVdTZUljTUsz?=
 =?utf-8?B?UzlxQ08xUVcxOWZYeE4vOFBjVnNKUk5NZFpQSXlIdnYxQ0R3MGhUSEYxc05j?=
 =?utf-8?B?eXgrZFl3UERQQzE1dkdSQjd6MEJibWJGZ0ZSRThETGxNbGZpSEJqdkNZQVBE?=
 =?utf-8?B?cUVPbDlsRVBZcjFjV0RIZUs4STB1b296bkpWS3p2MlFhWjZybmdKRmNRbjF5?=
 =?utf-8?B?NkE2TE00UG9oUG9lVUlKNGg4Tmg4Q2tBMG9EaklNOW05bVlJb0NKVlN5V3lk?=
 =?utf-8?B?dFI4Y2thWEtxNElrUkg0cU5UelVCSVYyK3hmNTI3QUZKcXVQeGVoWWdvZEJj?=
 =?utf-8?B?NGt3MFM5MGZ6NGU0Lyt6cFkzMnRWbWVCa2MxWTNka2hobngwRXlwcFIvdmd5?=
 =?utf-8?B?SWJ0NE1kQmxUS0U1K3A1T0RrZVpPTWxrK1hmb1lzVmhVckIzcmh5VkxMSVQv?=
 =?utf-8?B?TGUrZXowcXJCY21KMHpBamtLMEtTYURNN1F1RDZBU0JNZVV2dkMwbHh3UjI4?=
 =?utf-8?B?MHczNEV5Y3kxRlhVcEpGWXRkWDl2bU00bktmYU1zVmFwZFdxc1BqZlQrQ1hz?=
 =?utf-8?B?Vm1nWjN0R3JmVkdUcEk4UXFKZ2g2ZGlQUTdnRGVScHFkN1lLYUxtT3B4Nmlz?=
 =?utf-8?B?TkdGMm9XR1ZQcWJ4MFhOSkFScmdDODBoTXkwYTVKSHZYODA5WEhweUNBMlJx?=
 =?utf-8?B?NFFXcWxTWnZDcDBtbUdKNkEzZy9JNExQcnZNVURsSWR2Z3J6bzdad3hpZ1hB?=
 =?utf-8?B?bzZHazFOVCtya1JXZ1gxSFBDbnVyWENtTzNzVGVkVjhlZ3lxd29QaUxRZ0ow?=
 =?utf-8?Q?MX+f1XT57yP1tUP3Tm1G7XPFh58O8QfY1tpWqzG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d951b8-c103-4b84-11f3-08d9695ec22c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 13:29:55.6455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32p1z/3WbdrJkBwsLzhviUWi/VEhu1Gblgmw8wHvTBJnSBZd/03ltpVHFBLT06cXAuNXOtSpwddJO2TQr73dhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 27.08.2021 08:52, osstest service owner wrote:
> flight 164495 xen-4.15-testing real [real]
> flight 164509 xen-4.15-testing real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/164495/
> http://logs.test-lab.xenproject.org/osstest/logs/164509/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-dom0pvh-xl-amd  8 xen-boot              fail REGR. vs. 163759
>  test-amd64-amd64-dom0pvh-xl-intel  8 xen-boot            fail REGR. vs. 163759

This is fallout from XSA-378. During Dom0 setup we first call
iommu_hwdom_init(), which maps reserved regions (p2m_access_rw).
Later map_mmio_regions() gets used to identity-map the low first
Mb. This, using set_mmio_p2m_entry(), establishes default-access
mappings (p2m_access_rwx).

Hence even if relaxing the logic in set_typed_p2m_entry() to

    if ( p2m_is_special(ot) )
    {
        gfn_unlock(p2m, gfn, order);
        if ( mfn_eq(mfn, omfn) && gfn_p2mt == ot && access == a )
            return 0;
        domain_crash(d);
        return -EPERM;
    }

we're still in trouble (because the two access types don't match)
when there is any reserved region below 1Mb.

One approach would be to avoid blindly mapping the low first Mb,
and to instead honor mappings which are already there. Or the
opposite - avoid mapping anything from arch_iommu_hwdom_init()
which is below 1Mb. (Other mappings down the call tree from
pvh_setup_acpi() imo would then also need adjusting, to avoid
redundant mapping attempts of space below 1Mb. At least RSDP is
known to possibly live there on various systems.)

Another approach could be to stop passing ->default_access from
set_mmio_p2m_entry() to set_typed_p2m_entry(). (And I think the
same should go for set_foreign_p2m_entry()). At the very least
right now it makes no sense at all to make RWX mappings there,
except when mapping PCI device ROMs. But of course reducing
permissions always comes with a (however large or small) risk of
regressions.

While I think the latter aspect wants improving in any event,
right now I'm leaning towards the "opposite" variant of the
former. I'll draft a patch along these lines at least to see if
it helps, or if there is yet more fallout.

Jan


