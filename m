Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF3D677626
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 09:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482650.748265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJrws-0005vZ-7g; Mon, 23 Jan 2023 08:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482650.748265; Mon, 23 Jan 2023 08:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJrws-0005tX-4e; Mon, 23 Jan 2023 08:13:02 +0000
Received: by outflank-mailman (input) for mailman id 482650;
 Mon, 23 Jan 2023 08:13:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJrwq-0005tR-Hz
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 08:13:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2061.outbound.protection.outlook.com [40.107.6.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bebb3e22-9af5-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 09:12:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7817.eurprd04.prod.outlook.com (2603:10a6:10:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 08:12:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 08:12:54 +0000
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
X-Inumbo-ID: bebb3e22-9af5-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Urj9IZp8efoUe0LDLudnnkCyLxYTNVKHOQo1QzDZImH7WLaYiomHuEbt8huKMrT/KiAsbsn4VArgBzp1vXjZlp5GgOBMDfMY1ovBlupzm8oLWG6vpE9UBnh58aZm1JSqEWafJOTENcL/ptrUSiNGYE79moNoZ+Xm6Bm9QPtWdk4/SQJpi8kwLxUrRNo3kyp/p3Y2cZo+brJTRDSOf5N6IIJ67ErzobC/XainSARwse2p6bjULFMydy/FmW7Je8q3m49ZFWDxJi/c4oXY9h+1HgIkY3EfxsQLnk2KoY0GL8ctlyPqWvImo5wxZ0G8RfQlEWV3xyJjpSQe+MKZ6n2AWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwnSNtbVgtH/Q1KGLqJiOs0k3oDNWbq9OOtJzqQmaMA=;
 b=Ruhc4ai4waJrLGQnsA/N8JZnE1rzLaoE7QMBDvr9zhBBekJ6phAkqVGUwoBiUZ8rShIK5J9y6S+ROOoYfhRQ+rt5uVw7CmbwGjU6v3XSDoSardRd2HWNjfOu/rfgp9Sq4clgPz9BGdZManSMMVAuxpYgR0oee1BfI0PTBCBiiIe/ZsWcuuHxCEnu19yb+TNtGiMy1rF13z/uOxbQ3MN99svym/22rsOYcYkzQzeThvhAyPh12ySyKi05durZI3f7y9JRsPvUxCyMONfFRwHD9/T/Rf8hbuitVPdbIEJa0pNRqnfWNng4dfq31KhKwsKYj8FAMmnecdA4Mh3nB/Nyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwnSNtbVgtH/Q1KGLqJiOs0k3oDNWbq9OOtJzqQmaMA=;
 b=vKF0K6UGPetpP4WLwbftiEf2m49LCjypM9zGNT3BjVzaBotlhuRxsWpnWG+rimGCONyY2sUT/GghOItfrx7lOGNNW2O9ROXVWI9KJVCfGJtl7FgImY5XNqdr7AqlTxKqjVz794bi7wm6DvkjVLagPltTFQ5MWAX38qDmNQxs22vzTxqOw2fpCLnI42tSroU6OIIPpRl0ja4OmO8Q3rflyTW2/9u0F7tLZG9bfMkIRzZ0g5orgBCZrIGD0YYxj3pjFUj6y+gn7PZgWn4XTQVRR3ru7NRVJRPDKi4XfGs2teGbci7xjPWiqtrtr7Jzqi/wu62DV0DMl0O342iNbNgAww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <942e1164-5ed0-bdda-424f-90134b0e22c5@suse.com>
Date: Mon, 23 Jan 2023 09:12:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/shadow: sh_type_to_size[] needs L2H entry when HVM+PV32
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: 7480f1cc-ee76-46aa-acf5-08dafd19a0df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BuOqWvvn86iOBaZebz9NVgMDfkglZGmSWuwhK8+v7ASAjelVuR1OxD8W/MiAaVa+f+n/E8pnd8a8IP44m96Ui0H/lZSJCt8FQ3aFSk8ZUbEUcKwLI5yICOUOJTEbEB4k/pwoN3wiap55Rb0CYqi353KaALKrLRMcI+nAbyGDoHLVbss1pxYb5gUkM9t0FAKMGsXYof7QtEdQ7Z+E/PZ2h1TQYErtJAXEbb9xcXnb99x7ZWoEp3nIOExfSvB5zOnOemW+z//24fipytVUle8xGgX3MjEKE3EMG3fQ3q55PylAcqSwFLLtberbmP80wFd4T+T9P3w2PoJhWV0PyzpQ58TukzocuGZxbz+GyuXx47Y/nzWGyG3VqxcvABN2iKA1/OGw0p/Ct+Mqk5pcx6Sf2AwvHiUq0Tr6Hvablyhx9l43CH88dpyimtx0urBjHQhTo3tCpu1wwPZJjpvPGdM+mNnGLTSMTJfm87YHeANtkZgh2TR23fpPH9R3Bc+91b8gFZ0q47GUBf82MpuPYmUTrvRjP17Fqjg5DZV9wj9kqubGv3kQbzB+9rGJkJ2su0gDewaw1Pq4KfsTKU7p0fbctfARWUShrwJ7OVmWhIXyax9S5X7ixtXHva3VmqsmfNg819/e6w+ZMe8m+XtiAUCtXdbh68L3WnxVQM/sjEIShqgoj7zHyzkeFPnrl4hjw9RRUBkJtXJ5zB6OZDohb5Vg90DXhIyQdaEiokXUClETRk0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199015)(31696002)(38100700002)(2906002)(4744005)(41300700001)(5660300002)(8936002)(4326008)(6916009)(8676002)(26005)(6506007)(186003)(6512007)(316002)(66556008)(2616005)(54906003)(66946007)(478600001)(6486002)(66476007)(86362001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXNHL3hLMnBrYk1wWFRoTTJrUmRTaXFQaVN5K3lEZDY0bGY3dG04Q3VOSTNu?=
 =?utf-8?B?NS9memJvTnFZSlhsZlA2c1hwUmlpWEthaUd3OCtYMkRiZWtER2RBcG5tb3JS?=
 =?utf-8?B?dlJ1SVoybFMvblJReUNXZFltZ0wyRnlpSE4xMm8wekc2Ty85YnlXTHBmYTZV?=
 =?utf-8?B?UmkyV0JXdGVnWnV4YkI5ajhlaWd2akpWMEFqaHRkemRsMGF4OHZSTTU1dmJq?=
 =?utf-8?B?RXg2cThiUytVNC9ONjJKeDBJeG02NHc3R2pxOVo0Qk1KMWNaVlo4ZzNXRVM3?=
 =?utf-8?B?T2lZUEU3by9ucXhXNlZMZTE0UEtwbGI0cUY2QmdCL0VPQVdTVnpjWkwxbEFV?=
 =?utf-8?B?S0dzV3oweUgwNGcyazU2d3gwNFFNY2pWNDVtWjlsYThxM1RHUG9zdkQzeXJu?=
 =?utf-8?B?c2F5Sk1UZnVqQURydXFhczQ4Ym1aQ2o4ellTL3N5a0FlMkFNNjJNaTR2eGl0?=
 =?utf-8?B?UElmYkhqN0JmQjY1NmlqV0FXZG8rZEVoUGVUczdQNjJEcXNhMjdLc3dheWtN?=
 =?utf-8?B?clgwa2xKalVYQlNwbXBVZGJMWlNvN1hhcmFGR3JEMjlIQ2c5NXRLVHR1eCtE?=
 =?utf-8?B?NlFhMTdRWHRlZ2ZYYi90M29SVitJMFJPU2o5Q3gvQ2NzZlpnMGRSQ3JxQTB1?=
 =?utf-8?B?VEx1bHdsK0VqUkVQNkNELzNrZDdxc3UvS2gzL1hyUVAzYWNrZXZxM0t2bk14?=
 =?utf-8?B?ZUk2MGE1eVdnM3ZaTldMZWkrZVFHV3BZZU80N1ViVW5VTGcwZUdmYWlHU3pP?=
 =?utf-8?B?TGVrbHAxZ29wQWxtNndYbHlhVGVmazRHRjBYYkpEcUxoUEtSbGZseFJXUDZh?=
 =?utf-8?B?Q0dPR3lQUHhyVVZGcjhIVUtNTzlSNG85NDJzRjJ2eEFmMTNBSzNCZm9hZTN2?=
 =?utf-8?B?bytjR3YraW5MSWVueTVBc3JNdFVKWmhqc00vejJaTjZYZ1hITTVUbmFUVW5l?=
 =?utf-8?B?Y2pscDFMdWZCSjhWY1AzWWlBUEJKTTBIcVBiRjZqbjc3ZmpBd0pncDZPMzFo?=
 =?utf-8?B?eDF1QW95QjR4RStyT2FJb2hncTJzR2lncnFjcFVlVFFuQzBNTVcwWmRBOEx5?=
 =?utf-8?B?TjJPUnNLVkhGbjA4OEV1ckdHSDBQcm5YS0R1Z1NBOUthQ256Z3JNQzM5cnZZ?=
 =?utf-8?B?UlhWTEU2N2VYZ1F1YUJobVdVQXBkZHZudDZpUkFvYmRMQUk3OGM3N2J2Y0NR?=
 =?utf-8?B?T0I3SzgvSlMvUlRYaEUzRHh4bktvNFdoMzhmaFRHd0xzdFJrYTNOYkgwMDNO?=
 =?utf-8?B?UjVRWERLY2FvVW9hZUxseTg0a1p5bjlvZ3VuZmpUWHBtOExZOERWTFhLSDEy?=
 =?utf-8?B?ejUwaGQyWUxhL200SVRRa0s2OHIrc25CQUpZelR1K2hTUkg4NHhHamhVYmJx?=
 =?utf-8?B?VFFLL2Nyb2dPNDJ2N1puK1ROV2FNK1d0UmJoeFg1ZUF4QW4vbnd3bUpBQlB5?=
 =?utf-8?B?M3NORDRvWjNCUkErQTZEL2pudWxSbTczeUhuejh3UytVMlNkd0hsS3o1MEVC?=
 =?utf-8?B?MitWcmo1bDdvR1J5OXd3NE44QkFWRUZIaXlHS2tlVXo5Z0xWV0ZHRk5uemJL?=
 =?utf-8?B?cWRhWHhzSDN1WDU3d0RvYjQ4SThVbnNtdWUwVTk5TktxVUNwN2xQaEJKUHdj?=
 =?utf-8?B?RmhBZVZheFluZFlxTDRCejFUcExxdzN4K2dIMURlcncrck95YU9TejFQV1Nu?=
 =?utf-8?B?eE5idjNOZ0FRN1FyN2U5cU05bVRGUE1XSGNOZFh2SWt1NW40RzRnbTRwYUVm?=
 =?utf-8?B?SGlFKy9rZW1WZHIwa0hpY09YWGxVeHc5MitYalJhRm80emJYUnVyREo5bm0r?=
 =?utf-8?B?bHRnTGxHUkEvWFJYYTc1czJGZ0EvN3ExRE1XU0Q4R2hweVlMTzdPcllnekQ3?=
 =?utf-8?B?NEZwOTRVNWNXNHRSblJ1d2JGcnQvc2J3bmh3aDNCQ3czemtlWEQ4NTltWUl6?=
 =?utf-8?B?K2QrZlB6NTkrQjc2RUVHZGV3M3lCMm1hdFdacjNqTi82YUY1SzlhTWZreXU1?=
 =?utf-8?B?Q3ArajdvNHp0RFpFV0djT1dOVUNZQVpQM3RBeUptbk5BWEE0dzFPd3ljWVcy?=
 =?utf-8?B?STZ1S1F6VENWL0JEQ2RSR0Y4MGR6dHVNcHRVRkJTaFVEN29YWE5yNzJsVmhD?=
 =?utf-8?Q?soOYKg/lEwT8R60RMHYkoW5U2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7480f1cc-ee76-46aa-acf5-08dafd19a0df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 08:12:54.3088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAB9JiycWTxm3XpXHNyrzlj+TfYxIYpWQKa3NOXTOj1He6NUMk1/gX/OfisuvKaqrHVs2u6odjgbZHr9yu9C5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7817

While the table is used only when HVM=y, the table entry of course needs
to be properly populated when also PV32=y. Fully removing the table
entry we therefore wrong.

Fixes: 1894049fa283 ("x86/shadow: L2H shadow type is PV32-only")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -56,7 +56,9 @@ const uint8_t sh_type_to_size[] = {
     [SH_type_l1_64_shadow]   = 1,
     [SH_type_fl1_64_shadow]  = 1,
     [SH_type_l2_64_shadow]   = 1,
-/*  [SH_type_l2h_64_shadow]  = 1,  PV32-only */
+#ifdef CONFIG_PV32
+    [SH_type_l2h_64_shadow]  = 1,
+#endif
     [SH_type_l3_64_shadow]   = 1,
     [SH_type_l4_64_shadow]   = 1,
     [SH_type_p2m_table]      = 1,

