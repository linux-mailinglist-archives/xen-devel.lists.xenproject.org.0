Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECB150DB47
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312515.529789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuBV-0007ga-3s; Mon, 25 Apr 2022 08:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312515.529789; Mon, 25 Apr 2022 08:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuBU-0007dh-W6; Mon, 25 Apr 2022 08:35:04 +0000
Received: by outflank-mailman (input) for mailman id 312515;
 Mon, 25 Apr 2022 08:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuBT-0007dM-6k
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:35:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98f17de4-c472-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:35:01 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-TGjtCKQ_OQKiRzHTUvBcNw-1; Mon, 25 Apr 2022 10:35:00 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8472.eurprd04.prod.outlook.com (2603:10a6:20b:417::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:34:58 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:34:58 +0000
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
X-Inumbo-ID: 98f17de4-c472-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650875701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1iCV10YdTuovGxw8Kec93Mw/xo3l/7mx9DOj2uTyh8=;
	b=J7zjSz9JwdWhrxjiuTlsMbfBpTRXnf19Nm7ir1jB3cpewXdL63uUo3LiTB+vGFY8xugr+U
	cjp9xF1xSKCvTrUSIob2FvWn93bnhb68qVdp9WxEcRtAkfxwAWl2rP0qyeVuL1fz9VQ4Ug
	DmWx1uXTpgz6ugHrR600ldp9M0bcaQs=
X-MC-Unique: TGjtCKQ_OQKiRzHTUvBcNw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3Sa5bfKpgTCEOpPcMYwB0jq3E04t72ZZsem0OFXfZei7itp8aMTXq5rXuMwQc+jEKq9WSLOLzjUR6roY1GI0w3ZxMwZaduDy9l/6jl3zyWzSGaGyYW4bU8JggF6zo7s0vKonKNQQDJiMdbg/mUXEdM9+kUIt5YRq3t4nb8978d1cTrSQ1eGlxK6U2vquSQMfVHkxUCekn0egr2daUbdR1mtUx3Gp5ze+y6Bz53jIS213pgRNPy3GPRc2l1ySoe+aMmbbKXWSb4lzGFRAqQhVl1dKDHQIbFFwDJkfAu5iCb5e4GjACjiVsT/B8awzgGXbA3ILGiunhMsk6hyBe5V0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1iCV10YdTuovGxw8Kec93Mw/xo3l/7mx9DOj2uTyh8=;
 b=UDxChBSa4v1D2I3/anjHuuemSccXKvAS00E+p73TmjN6Yj7DWIkDsT6zTE/SyvZM5YO0gyUT5u5LqC3RLk5zdzvm9tTf+/k96Aimwci5d0QJQqMddK9Jt9Ta8Np/51Qid/jgkOW0AifSeN9Mv0HWTb1H1pJcX81WIrb3Pj8SrRBWbXElrZh0fbtJ6R1itGrzjC52LIUK5w3X69uctAYFD8p9D73FHQi86sb5HQSUIGDxCYm1nRvanmTKCqbbEbjaAYDAfUM8R6A+SAFiw041S4OgnjjX4v7Py8tC2AkFp2xVJZjQq9LihGhzCgO8rIbfHbQ4O/g4HrFIGL8ps/YFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f85a5557-3483-8135-ff47-a15474aaebb4@suse.com>
Date: Mon, 25 Apr 2022 10:34:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 06/21] IOMMU/x86: perform PV Dom0 mappings in batches
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0028.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::24) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bedd4c9-2a8f-46dd-9946-08da26967b77
X-MS-TrafficTypeDiagnostic: AM9PR04MB8472:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8472EA63662CE9297E85B1B5B3F89@AM9PR04MB8472.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	74HVRLekGw92SypuC8yRZY8jqZ4WwKoKix1F8N/GccxYasZ6XN0oyMfbaW4dLYH8GNzqA9//ldCIVixNYeEZIiswQzyH4GtrFwYznUuphI+MQB0aEFly7RBdcDI+TV8K2xPe3Ao5ICmYKr7keq77xBxvqU4cyzW2EPsKGeJRc4VTCmk4V+nGTG0pifxsKSmxA8G4R7bJFrQeygD56OOoZkfRQoOwPv5OAZk39oDbogEKpirGcL8Zd/xcnOaYYbwjq7tUZEbk+WnOPpXZD3tBQmQPmszCL+tlx4HG5fjLDi/xFbhN1qZtUno2r0cVxMsQGOUiJeqnRWL/WIN5inArNDvxKX75DbQGw9gegOCztIJiYUuMrxncdpE8yRN7TH2yId6SjO8ULtsT49XCliGsVZgAmV7KIPF9nYR6nFAYF8KHr4OZNPyXOOUuvGGaxNjBqcCyo1gfo0YOApkvPQNKdu6lKDAjUcVlawQDhOBz0jDluAxjFE05/GdnAjTRgl2ktAINS03Ykw5eAHo9gOZPKXy3wS/Wm9WXnar1NQuqOWlyi/79OC8RYgS3B+Xd/LFNBbIMtDULwAmJxDZu2RA4ZQbxKJgFT2OZEIbE9R+qfuc3VRh8n9uH9Vb5qgGL+vXo31giNoGEa8ECAOYGLKeI9mtKE5Zo7eo0Yb+AKT72nxzH9W6fHwyscq3IssvJ5HtTRB8bO/2p8weZkcGYgfWrJ8QCre4kbX7j6meiiyZCfz4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(38100700002)(508600001)(31696002)(66476007)(6486002)(66556008)(26005)(36756003)(83380400001)(6506007)(31686004)(2616005)(6512007)(186003)(66946007)(2906002)(5660300002)(8936002)(8676002)(6916009)(30864003)(316002)(4326008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG1hL1Z5cXczeTZIRXM4amZBU29TK3RiSld4bFNIVEpZQS9iSTBmZFNxcVBl?=
 =?utf-8?B?aFI1blNZQ3YrUmc2TnUyRnpkcmlmMzhRbXdGRTVpcFNXTHFBb1dxaWMyWGtj?=
 =?utf-8?B?TXFGTmZlWWtoUUlZcjlCVmgzcnhKSy8zVDNWUHA2TnA3dHNwTWFKT1ZjcTRP?=
 =?utf-8?B?NldwcFdLdXBzZ1N3ZFJyMlZyVDdUcC9TaEx2eWFhOXBxNVZZRlJSYUw3K2VH?=
 =?utf-8?B?ZFg0WnZIOWJyR2hXdWp1ZHFRZ1Foa0RtYnVnYTZ2bWtvT3hCbUYzSHVKT3B2?=
 =?utf-8?B?U1RwSlppVkRGQmtJdHdsMnZibEkyZkU1ZUFCVi9wNXNyK245aGRybVpTUSsx?=
 =?utf-8?B?Mm1DTnMvVFdCQTc5V0REQXRQMXk2dXBudUpyT0w0YlE5bjlZbjBRMERPenpN?=
 =?utf-8?B?dDJkMlRsNm9SVmlKdXYzMnZDeTM3NUhTRjZQWnFGK1RaeDZDaCt1dGdBTC9N?=
 =?utf-8?B?T2dNQUxtclNXQzZmY0lGNnRKSS9yTzNQbHY4Zk1JcmhMZ3hXa1FFeS9ib0Ju?=
 =?utf-8?B?dzIydVVvUjB6ZzMwU05zeTFKSnZBdzZNV2Nrb3M1WEtBY3R1aS9ZeFN1Z3ow?=
 =?utf-8?B?d1FLM3N3a1hEU1FLQzd1MHAxMGNMWlEyam00dm5XSGJ4cDBjbWRsc1lyTG9X?=
 =?utf-8?B?SkhGQmlRUlpnSWNsc1pLcWRuRTYxN2hqd3JVZjhGYktTbzlPZ1BlYVJKeFJu?=
 =?utf-8?B?ODk2WnhlRCtHZ1NYQnVZSWlReCsxZnZ4Zm1oaFlEWFd1UXNaeFRrVHVxNWR6?=
 =?utf-8?B?dS94bmF2TC9mSHdBd2lST1J3d3d4Sy85ajFPWUZSbE1NUVhyQitoMVRvVXRF?=
 =?utf-8?B?eXFDeU1FbG42aXV5dUhXYXdiUDE2aVppdThVajBzZHJrTzdlYmtLcFNxbGx3?=
 =?utf-8?B?bWZQSEpiUTM3YTZscFJvVVJRaDNLTjlnbTYvWXF0NG9RMmJCTEh0TVl0T1Zl?=
 =?utf-8?B?Rm5SUW41aTg5ay8xR2w5Q01oUTBHV2pZVEg1Qm9wczcrdHdiUGFOZ0VpWGpl?=
 =?utf-8?B?SE1GUzVYWU1uMUtmWGJFNDRiaVVUZXdEYWdZL2k1ZVU2SnkwaW5oR1c4L093?=
 =?utf-8?B?QklXSnpwYzV0b0pvVVhtRGJjR1k4dFg4QnVOVGxZbkd1MWg1aERiWDZzOVJi?=
 =?utf-8?B?TFY0MDQ2SGloYXFYNDl4VFQyYjlPdmk4R1pOSmJwa3djR2pQOWVoMkJXVTdk?=
 =?utf-8?B?NXp0RzNNY0tkNStRVzBrT1BtRGJ5S2RrYittQis1RFdlY2xQclVwTE5HZndS?=
 =?utf-8?B?WGNSN1hoeTZtSzhiQlRQdURwcWptOGsvKzJYVXFDNEQ2K3pJZmkrMXVkblJJ?=
 =?utf-8?B?Q3VZR0RyeHpnT3FyRDYxOVRUK0tCSVN3YXhHZXhINXU1MytuN3Jyclgwb2d3?=
 =?utf-8?B?RkY3ekxZU1ozYThwTUlTS0h3UDh6em1sWFJUREo5VEpVblFtZnBDajFKaEE1?=
 =?utf-8?B?YTFRaUNHd09sOHFrdTVtRGk2K0dUdUtWSlBWTXB3ODd2MjFKNVZtdUVxbEo5?=
 =?utf-8?B?dFFzaklXWjZJZXJ2aWhpVUVSZS9UTG0zdnR1SEJFVG5GY0d4VjJxb3FLSUhO?=
 =?utf-8?B?VitEYXpsZFhkWGl3YWphNkdWTDNxOEs2Vm9LTDFqSmNVR0MvQzNXZmI3Ujgy?=
 =?utf-8?B?YVB1azBDQk5BSS80b2kzZytMdnpzZG42MDJ2S1ZiTzVhNUt6aEtRKzR2T05V?=
 =?utf-8?B?V0NUbWQ5OFlPT0VTSkF0UFczcnJqazBRa2tDcFRHUkdNSHZRK2R4a1NiT1Yz?=
 =?utf-8?B?VVczcCtnWFU1MFpVT1E4NDlNYlhJUUljWEpEVEdGQyt4MmZwbnNOZlR2dlZp?=
 =?utf-8?B?QXNNSzdyOWRwa1BTMTNSK3RpN2wrUmF1U1ZkUVhPUjFNV3F0S3FKMk1saHJj?=
 =?utf-8?B?MmxwY0tXZnlHMlBJN2FPOVhXUElUdWpMakdoRkhxYWZyM3pjZGhLQTk4Z1RJ?=
 =?utf-8?B?WStTdVFtZzY2dEt1S3cxdFJqZ1h1dG1CdWJ1anpUQWJGRVdYOGVxdnJWQzBo?=
 =?utf-8?B?cnVtQnM5R1g4MktSVzMyUjl0WE1OeUprRUFWRkFQcFF6N09aTG5NRVJLckNr?=
 =?utf-8?B?UFBBNTU2MFVBci9EdkFJNHYraDcyaHM2a3FNOEtaNHlQcXFTSkh3THV2aFJY?=
 =?utf-8?B?SE5DZ3M2TnNuNm1scDAxZG5GOWRTMkpWMjdpanRRSmZuTitaTzJ0Tzg5OEFx?=
 =?utf-8?B?RHBaeFFBVXoyNGhjcysrRVZVVmdySHkreDhHZDhmbDNlb0J3cWVmaUROc0dj?=
 =?utf-8?B?UWFSWElKdnl3ZnhxTGpBdEZ4RE4xTnpzSllzWUxLNy9JMHJiaXJDTW9mTDlU?=
 =?utf-8?B?UGYrS2JWRkhRMk1xRktDRUlBVEJJSHp1SXpxdTNmVkpMNHRManRhQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bedd4c9-2a8f-46dd-9946-08da26967b77
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:34:58.5668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZQLsqdP5cYEGBq8qweGyDUC+SBI2TSXgW1IzH5GDRx1Q9cf3Rryfhkyu+zONrqe/1tEG2+mbXV4UKPliCAoQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8472

For large page mappings to be easily usable (i.e. in particular without
un-shattering of smaller page mappings) and for mapping operations to
then also be more efficient, pass batches of Dom0 memory to iommu_map().
In dom0_construct_pv() and its helpers (covering strict mode) this
additionally requires establishing the type of those pages (albeit with
zero type references).

The earlier establishing of PGT_writable_page | PGT_validated requires
the existing places where this gets done (through get_page_and_type())
to be updated: For pages which actually have a mapping, the type
refcount needs to be 1.

There is actually a related bug that gets fixed here as a side effect:
Typically the last L1 table would get marked as such only after
get_page_and_type(..., PGT_writable_page). While this is fine as far as
refcounting goes, the page did remain mapped in the IOMMU in this case
(when "iommu=dom0-strict").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Subsequently p2m_add_identity_entry() may want to also gain an order
parameter, for arch_iommu_hwdom_init() to use. While this only affects
non-RAM regions, systems typically have 2-16Mb of reserved space
immediately below 4Gb, which hence could be mapped more efficiently.

The installing of zero-ref writable types has in fact shown (observed
while putting together the change) that despite the intention by the
XSA-288 changes (affecting DomU-s only) for Dom0 a number of
sufficiently ordinary pages (at the very least initrd and P2M ones as
well as pages that are part of the initial allocation but not part of
the initial mapping) still have been starting out as PGT_none, meaning
that they would have gained IOMMU mappings only the first time these
pages would get mapped writably. Consequently an open question is
whether iommu_memory_setup() should set the pages to PGT_writable_page
independent of need_iommu_pt_sync().

I didn't think I need to address the bug mentioned in the description in
a separate (prereq) patch, but if others disagree I could certainly
break out that part (needing to first use iommu_legacy_unmap() then).

Note that 4k P2M pages don't get (pre-)mapped in setup_pv_physmap():
They'll end up mapped via the later get_page_and_type().

As to the way these refs get installed: I've chosen to avoid the more
expensive {get,put}_page_and_type(), favoring to put in place the
intended type directly. I guess I could be convinced to avoid this
bypassing of the actual logic; I merely think it's unnecessarily
expensive.

Note also that strictly speaking the iommu_iotlb_flush_all() here (as
well as the pre-existing one in arch_iommu_hwdom_init()) shouldn't be
needed: Actual hooking up (AMD) or enabling of translation (VT-d)
occurs only afterwards anyway, so nothing can have made it into TLBs
just yet.
---
v3: Fold iommu_map() into (the now renamed) iommu_memory_setup(). Move
    iommu_unmap() into mark_pv_pt_pages_rdonly(). Adjust (split) log
    message in arch_iommu_hwdom_init().

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -46,7 +46,8 @@ void __init dom0_update_physmap(bool com
 static __init void mark_pv_pt_pages_rdonly(struct domain *d,
                                            l4_pgentry_t *l4start,
                                            unsigned long vpt_start,
-                                           unsigned long nr_pt_pages)
+                                           unsigned long nr_pt_pages,
+                                           unsigned int *flush_flags)
 {
     unsigned long count;
     struct page_info *page;
@@ -71,6 +72,14 @@ static __init void mark_pv_pt_pages_rdon
         ASSERT((page->u.inuse.type_info & PGT_type_mask) <= PGT_root_page_table);
         ASSERT(!(page->u.inuse.type_info & ~(PGT_type_mask | PGT_pae_xen_l2)));
 
+        /*
+         * Page table pages need to be removed from the IOMMU again in case
+         * iommu_memory_setup() ended up mapping them.
+         */
+        if ( need_iommu_pt_sync(d) &&
+             iommu_unmap(d, _dfn(mfn_x(page_to_mfn(page))), 1, flush_flags) )
+            BUG();
+
         /* Read-only mapping + PGC_allocated + page-table page. */
         page->count_info         = PGC_allocated | 3;
         page->u.inuse.type_info |= PGT_validated | 1;
@@ -107,11 +116,43 @@ static __init void mark_pv_pt_pages_rdon
     unmap_domain_page(pl3e);
 }
 
+static void __init iommu_memory_setup(struct domain *d, const char *what,
+                                      struct page_info *page, unsigned long nr,
+                                      unsigned int *flush_flags)
+{
+    int rc;
+    mfn_t mfn = page_to_mfn(page);
+
+    if ( !need_iommu_pt_sync(d) )
+        return;
+
+    rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, nr,
+                   IOMMUF_readable | IOMMUF_writable, flush_flags);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "pre-mapping %s MFN [%lx,%lx) into IOMMU failed: %d\n",
+               what, mfn_x(mfn), mfn_x(mfn) + nr, rc);
+        return;
+    }
+
+    /*
+     * For successfully established IOMMU mappings the type of the page(s)
+     * needs to match (for _get_page_type() to unmap upon type change). Set
+     * the page(s) to writable with no type ref.
+     */
+    for ( ; nr--; ++page )
+    {
+        ASSERT(!page->u.inuse.type_info);
+        page->u.inuse.type_info = PGT_writable_page | PGT_validated;
+    }
+}
+
 static __init void setup_pv_physmap(struct domain *d, unsigned long pgtbl_pfn,
                                     unsigned long v_start, unsigned long v_end,
                                     unsigned long vphysmap_start,
                                     unsigned long vphysmap_end,
-                                    unsigned long nr_pages)
+                                    unsigned long nr_pages,
+                                    unsigned int *flush_flags)
 {
     struct page_info *page = NULL;
     l4_pgentry_t *pl4e, *l4start = map_domain_page(_mfn(pgtbl_pfn));
@@ -177,6 +218,10 @@ static __init void setup_pv_physmap(stru
                                              L3_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
+                iommu_memory_setup(d, "P2M 1G", page,
+                                   SUPERPAGE_PAGES * SUPERPAGE_PAGES,
+                                   flush_flags);
+
                 *pl3e = l3e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L3_PAGETABLE_SHIFT;
                 continue;
@@ -203,6 +248,9 @@ static __init void setup_pv_physmap(stru
                                              L2_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
+                iommu_memory_setup(d, "P2M 2M", page, SUPERPAGE_PAGES,
+                                   flush_flags);
+
                 *pl2e = l2e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L2_PAGETABLE_SHIFT;
                 continue;
@@ -311,6 +359,7 @@ int __init dom0_construct_pv(struct doma
     unsigned long initrd_pfn = -1, initrd_mfn = 0;
     unsigned long count;
     struct page_info *page = NULL;
+    unsigned int flush_flags = 0;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
     void *image_base = bootstrap_map(image);
@@ -573,6 +622,9 @@ int __init dom0_construct_pv(struct doma
                     BUG();
         }
         initrd->mod_end = 0;
+
+        iommu_memory_setup(d, "initrd", mfn_to_page(_mfn(initrd_mfn)),
+                           PFN_UP(initrd_len), &flush_flags);
     }
 
     printk("PHYSICAL MEMORY ARRANGEMENT:\n"
@@ -606,6 +658,13 @@ int __init dom0_construct_pv(struct doma
 
     process_pending_softirqs();
 
+    /*
+     * Map the full range here and then punch holes for page tables
+     * alongside marking them as such in mark_pv_pt_pages_rdonly().
+     */
+    iommu_memory_setup(d, "init-alloc", mfn_to_page(_mfn(alloc_spfn)),
+                       alloc_epfn - alloc_spfn, &flush_flags);
+
     mpt_alloc = (vpt_start - v_start) + pfn_to_paddr(alloc_spfn);
     if ( vinitrd_start )
         mpt_alloc -= PAGE_ALIGN(initrd_len);
@@ -690,7 +749,8 @@ int __init dom0_construct_pv(struct doma
         l1tab++;
 
         page = mfn_to_page(_mfn(mfn));
-        if ( !page->u.inuse.type_info &&
+        if ( (!page->u.inuse.type_info ||
+              page->u.inuse.type_info == (PGT_writable_page | PGT_validated)) &&
              !get_page_and_type(page, d, PGT_writable_page) )
             BUG();
     }
@@ -719,7 +779,7 @@ int __init dom0_construct_pv(struct doma
     }
 
     /* Pages that are part of page tables must be read only. */
-    mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
+    mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages, &flush_flags);
 
     /* Mask all upcalls... */
     for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
@@ -794,7 +854,7 @@ int __init dom0_construct_pv(struct doma
     {
         pfn = pagetable_get_pfn(v->arch.guest_table);
         setup_pv_physmap(d, pfn, v_start, v_end, vphysmap_start, vphysmap_end,
-                         nr_pages);
+                         nr_pages, &flush_flags);
     }
 
     /* Write the phys->machine and machine->phys table entries. */
@@ -825,7 +885,9 @@ int __init dom0_construct_pv(struct doma
         if ( get_gpfn_from_mfn(mfn) >= count )
         {
             BUG_ON(compat);
-            if ( !page->u.inuse.type_info &&
+            if ( (!page->u.inuse.type_info ||
+                  page->u.inuse.type_info == (PGT_writable_page |
+                                              PGT_validated)) &&
                  !get_page_and_type(page, d, PGT_writable_page) )
                 BUG();
 
@@ -841,8 +903,12 @@ int __init dom0_construct_pv(struct doma
 #endif
     while ( pfn < nr_pages )
     {
-        if ( (page = alloc_chunk(d, nr_pages - domain_tot_pages(d))) == NULL )
+        count = domain_tot_pages(d);
+        if ( (page = alloc_chunk(d, nr_pages - count)) == NULL )
             panic("Not enough RAM for DOM0 reservation\n");
+
+        iommu_memory_setup(d, "chunk", page, domain_tot_pages(d) - count,
+                           &flush_flags);
         while ( pfn < domain_tot_pages(d) )
         {
             mfn = mfn_x(page_to_mfn(page));
@@ -857,6 +923,10 @@ int __init dom0_construct_pv(struct doma
         }
     }
 
+    /* Use while() to avoid compiler warning. */
+    while ( iommu_iotlb_flush_all(d, flush_flags) )
+        break;
+
     if ( initrd_len != 0 )
     {
         si->mod_start = vinitrd_start ?: initrd_pfn;
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -347,8 +347,8 @@ static unsigned int __hwdom_init hwdom_i
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
-    unsigned long i, top, max_pfn;
-    unsigned int flush_flags = 0;
+    unsigned long i, top, max_pfn, start, count;
+    unsigned int flush_flags = 0, start_perms = 0;
 
     BUG_ON(!is_hardware_domain(d));
 
@@ -379,9 +379,9 @@ void __hwdom_init arch_iommu_hwdom_init(
      * First Mb will get mapped in one go by pvh_populate_p2m(). Avoid
      * setting up potentially conflicting mappings here.
      */
-    i = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
+    start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
 
-    for ( ; i < top; i++ )
+    for ( i = start, count = 0; i < top; )
     {
         unsigned long pfn = pdx_to_pfn(i);
         unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
@@ -390,20 +390,41 @@ void __hwdom_init arch_iommu_hwdom_init(
         if ( !perms )
             rc = 0;
         else if ( paging_mode_translate(d) )
+        {
             rc = p2m_add_identity_entry(d, pfn,
                                         perms & IOMMUF_writable ? p2m_access_rw
                                                                 : p2m_access_r,
                                         0);
+            if ( rc )
+                printk(XENLOG_WARNING
+                       "%pd: identity mapping of %lx failed: %d\n",
+                       d, pfn, rc);
+        }
+        else if ( pfn != start + count || perms != start_perms )
+        {
+        commit:
+            rc = iommu_map(d, _dfn(start), _mfn(start), count, start_perms,
+                           &flush_flags);
+            if ( rc )
+                printk(XENLOG_WARNING
+                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %d\n",
+                       d, pfn, pfn + count, rc);
+            SWAP(start, pfn);
+            start_perms = perms;
+            count = 1;
+        }
         else
-            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
-                           perms, &flush_flags);
+        {
+            ++count;
+            rc = 0;
+        }
 
-        if ( rc )
-            printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
-                   d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);
 
-        if (!(i & 0xfffff))
+        if ( !(++i & 0xfffff) )
             process_pending_softirqs();
+
+        if ( i == top && count )
+            goto commit;
     }
 
     /* Use if to avoid compiler warning */


