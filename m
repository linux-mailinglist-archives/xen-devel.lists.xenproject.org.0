Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFFD5068CD
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 12:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307997.523463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngl8n-0002ar-24; Tue, 19 Apr 2022 10:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307997.523463; Tue, 19 Apr 2022 10:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngl8m-0002Z1-UB; Tue, 19 Apr 2022 10:31:24 +0000
Received: by outflank-mailman (input) for mailman id 307997;
 Tue, 19 Apr 2022 10:31:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngl8m-0002Yv-5Y
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 10:31:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbe47b97-bfcb-11ec-8fbe-03012f2f19d4;
 Tue, 19 Apr 2022 12:31:23 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-uqS0L_JsP_y4lpV4ZG2avA-1; Tue, 19 Apr 2022 12:31:18 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB5706.eurprd04.prod.outlook.com (2603:10a6:10:a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 10:31:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 10:31:15 +0000
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
X-Inumbo-ID: dbe47b97-bfcb-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650364282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23YmRU8g3j7av44iXJcTeB2zyaSXSTHD+Pl6Jf/3atU=;
	b=IoPLqhsxWrZPIx2NfQbCtQ611b1hbG2I1EHDvwHVHjZ/vxE/I1bagfLTUYAD2i//Xl/xIR
	X1o3y2CAeuw3NW2DY04/oKJtUMcflj0ENboYRSJO+F9sgzbxD+15HIdO7zlZ5XM4ZqBTdE
	mDgY3nv3AFyOzEZbH3n1BgVJ7H6SlbU=
X-MC-Unique: uqS0L_JsP_y4lpV4ZG2avA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNpYu8DFucnrdaYgZxpIf6Hjrnw+4XMtdWHWMuxEvXt9F0zfkBIU8eKKg+VBMdnQB8/pMBjBg5CnYwoX2vKyH5dCnfcQoarZDFk68d7a/jFVI7IJDf0Au88N5Gj5jY526Yj5DUnmSmGPOVQafDvOEJQenHuvDYRkS4AyRFpBeSanZoGFR32gx0zppfoQuwqLHek4z1gMjiyQk429T3pyEMiOCbswdhMv8FLiSKbpEeZzDgQPySqbevjSsK+LxxvoHS/hkE09FmdrXnMbt2XbfPdN9kfaU/lLX+QWWmSXmiAeV+2/eDwGScnNy+/js8+hKshHEaFcNXO62rcyvFPb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23YmRU8g3j7av44iXJcTeB2zyaSXSTHD+Pl6Jf/3atU=;
 b=BjZH2AiJPmnS1ZEySRKvZLtGrctBR7ykEnQT8piDGBwm1iSze8SarXhQSnay86xnSxlxFCpoKbNo5SSj8vkrdjsoo/LcdLRYDFp5HFx6jPNUfVNGwQjyBctbzZ7N3WSxhfjaA915BKIScDxpDhfGQbziWMXEb9iWRZP4x8rbmBewvIozSUmQKBZJOj34Cutcf9GbW4c4SqjCBwl56o+mlmlVCIyAFT0ujKuM0BZc85RCfyIUygvrRjjXiKIZGvclJpPbM5ejku27Uf3pJGZLIQIJFU0aoqW5ty3WYQW/i5NEO16WR2KqJGm8uOoIyAmLzeFaAbY1/Jr+7XqD3BZG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c884c16-ab97-f4db-2e8c-c34586fa0e81@suse.com>
Date: Tue, 19 Apr 2022 12:31:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] xen: fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Cheyenne Wills <cheyenne.wills@gmail.com>, xen-devel@lists.xenproject.org
References: <20220419101850.3045-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220419101850.3045-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0116.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::26) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0ac69bd-9c87-4e1c-e830-08da21efbb8a
X-MS-TrafficTypeDiagnostic: DB8PR04MB5706:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB5706C3EBA377ACBCC77B539CB3F29@DB8PR04MB5706.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fAAstkSPyKgbDbaN9nPgxcwCQR6fL+45bRygb7drnT1gU28nzn6XaGXqbcPcEWcPbg6+iVlCPR9Kdd2OxHkrrbbMSnpBWntor8k1iinoM3tMWSG6q05U7PPCkNMAXsEuWjz6Vclg7OFG1IMoxM7+TgxlUsPHF95RDp3+LxvyQatl7R/HFX+66q1xvoqBqjzRclgBBvooqYD4ZLoTFFKBh2rRo/Or2/Zt8TvLbyvIRx9QnK37bwc4uZCFF7+ONUpkxEFrRJFCTZy3jCXG1Mneoj7xdhe8Ff+ZXHGTFPZ13ZgvRL/ts3JON76ZUSTaZ4krq0KvzkyTo7puLpEEbrZa4EwkoiiVdeOqY4Fo97bQGBA62hbejT6I+IjEOLxGz+AfPUi7bLYAam4l7gBATwyHRFQgnk4ZwxNlqc1KmwWl94PpK8g0agQX68XIdukoNc5HSMHKo68XyQBUrgEz2fpTuPwykDBZvJ1mYVnQoqqZ0IFSbKfV5GrdAWzZh3TSoZAWibKkk6F5LNjtRm7BIgkv/qHYFRTxQnl1Lkd6TffaSabfz7Wpl6tebTIHpG+MRGcywKoRzqc2WJXgW8lYPyFD1P4F4KFkaUQEbCT20lSrzcTd+D0MQ1fQjl7ReqFAdoxsVWwe5V1VS+yL0KnlL40uuurBbt6SvkdewFcAM/itLxu0Fs3+tNmiy8fmz/rmsJi/pTZFhQ77t6O6Pu82iS9AiSdkzIvoW8f0U72ahFq7fhEYj6/j5AxApUA2TIePXg+S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(38100700002)(66946007)(31696002)(86362001)(66476007)(6862004)(4326008)(66556008)(8676002)(6636002)(508600001)(83380400001)(54906003)(37006003)(186003)(6512007)(6506007)(26005)(316002)(53546011)(2616005)(5660300002)(2906002)(8936002)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTZPV1F1clhHU3dYVlVXMFF6OVdkSGZOZVlvdmtXTk5rMVZocmprZXpIOElk?=
 =?utf-8?B?M1FYSkN6NnJ3L096bS9CS2l1Q2FDRDMyOXVYa1IzbCs3L2NBeEFZdGw0ZG5u?=
 =?utf-8?B?UFhPMUJlak9BNkh3OENsYjZsWTlFaXBJbmZYK3VQaU1DL2ZQa1FwNnJFdEM1?=
 =?utf-8?B?ZXk1clFaNkRlUlliWENjTStnc1NTOVNGa2I4RnIwRmZ3UCtDL3EwUUVvYjln?=
 =?utf-8?B?YThQMXJJY1VLelI1NnN1Vk42Sm85dFAzSTAwQjl2eFAybUVBaWlKSXpZWlhX?=
 =?utf-8?B?TE9MZ013OW4rRjlSaHVQVm42Z00zSXpNaHZOY2M2Z2M3SjMyVUhieFRvR05j?=
 =?utf-8?B?NFVmTEhVZVZXS3ErM2RHV2c4Wld4eVFaL24xVEpDZjNYQlBqM0ZMRC8wd0x5?=
 =?utf-8?B?RG01bmVFLzEwWW5hWXdHU3REMkV5dnlQYTlTa3VDNlcwTS9LVW5HeTk1K25T?=
 =?utf-8?B?ZmErWlJyVm1rTWRhdC9WWW0wR0p4alZZMnpUYWlSS2k1VmRPWkdHN0ZELzU1?=
 =?utf-8?B?ejQ3V3NudTJlekE2L1VQSFlrc2tmQ21wbWJlQmJQZ1BzSXJLR1d3VnlWK0FY?=
 =?utf-8?B?TWZQeFRQNlpXMlJxSGRuNHNmQk5nRER0azBJM2o4MnhGZEJpbGFhWXJoVFdJ?=
 =?utf-8?B?YnBDUjF0eStRS0JYRmY2QnB3OWt4YmJSVHZqVzJraUhHRzFkTFVTR1k1SmU2?=
 =?utf-8?B?UjJOdnIvUlhBanU5SjlZN0kyRU9JU0toU3NVbEtDOWpnbytqZWxJZ2E1b1o2?=
 =?utf-8?B?L2xiVVU3WjNJenV2QmxHVXVWMHJvNWQyMSt5dGx5aENCbnBaTnoxL0xyakM5?=
 =?utf-8?B?a2o0TFlMaGNXQ1JOdGJtVXRCMVBYZHkvME5BcmxrMDVkaWVrM25LOXpyY3VL?=
 =?utf-8?B?d1RJeVdVOE14Q1ZIbm0zYmVjU1oxMy82bDJRMTdDbmlCK0JCRklheE44ZmxS?=
 =?utf-8?B?VHRLWGVzNm9WcllsSWp2eXdUODFwWTVwRlQ1YzN3dkJjZllEczh4bW92N1BV?=
 =?utf-8?B?QndHV0JkOWF0MmFyeDlyb090eWFPL0FMWk1KTFZJWDR1SnZSUlpCcW9zclJk?=
 =?utf-8?B?OHEzUmRyZWFKbEMvbFRzQzcxZmVNZzVONXNIMlJwSjZhRVpoUjlyTElsaFFR?=
 =?utf-8?B?ZUZNcjdxRmQ5dWNQd2hWaEdrWXgvV2hCQ1JZcFZTa05DVWJwVHdhVzJKUVh5?=
 =?utf-8?B?bTFNM3lyNGZnK090dEJ6R1BJV3BTVGZkZ25wTjIrMWhmeUNtTkpuM1IycmFX?=
 =?utf-8?B?S3IrZG5lWUlNUlVPM0tOWGJjeHJUMHFSa0JQbjY3UnVveVZoTXN1emR2aGxh?=
 =?utf-8?B?VGVlMWpleVI2bG1zUjNZa1FVNTRiVk1iMDVtVWNHQzVYa2c5MGFhZnV1aUVM?=
 =?utf-8?B?TUw0L2lxaThkL1VKTXVyazBKUEllY2ZDZThoallIT3l5bjZsdGdkRmNWQ1hS?=
 =?utf-8?B?ZTFkZVprd0FqSC9Rcjg0ZnprNC9CVGY0ZmlJOVVaYmdQNjl3d0NKb1lGUFZY?=
 =?utf-8?B?VHJ4L0NFbmZOa0Y3aTdNM3BuSHA2VGxLVVY3WDNnOC8yY3c4OWhQeXJ0SUFL?=
 =?utf-8?B?L3R1dTlpZ2FjVnM2YnREUTI4LzlLeEV0Z1JRYmJQOEF1QmdDaFhsb2lyR24z?=
 =?utf-8?B?ckZNQVptOWJjT0tNb29yT0ZRRFBGYXhVei9QRXNhTHpVOVd4Rldzby9GZVNX?=
 =?utf-8?B?UXJBT0d0WE9weFVhWW5sU1pUa01sN1RNZEpKL0JuVy91bjg4bTBQbmxFRkRx?=
 =?utf-8?B?OFpPK1lWQW5ydE5PN0FjSC9XV0FDeE5PMWI2TjBoZjlBR01zMFRpVlY2YVUz?=
 =?utf-8?B?WWloQU9BT3RBRXJ1aUJydkU2VFRYcDFLNmFoODJjUFgwZTF2cDViQ1B4Zmh4?=
 =?utf-8?B?NUxhODR4QzRHOVVUaU5RdThaNmtIc0pDSHhPbUQzRmYvNnltU0pvOXNMZVJR?=
 =?utf-8?B?aXd2MGFKb0FPRmlQRmVXTnByMzRQQ3hyOWRnTUVScTFMcEdIQ1U0U0YrNTZP?=
 =?utf-8?B?SVpyYVNXY3BGTHRaSHBuaFo1bkRic2RoVk5ENGhDWHkwaTRzUC9NaVZuM1dj?=
 =?utf-8?B?T2I0aWNNZlQzaUNqSGc0OGFrQlppTjRhVEdja25ZY2Rqa2hLNjRwVzZObTFk?=
 =?utf-8?B?WFVKbnVpM0lJZGhaR01TbldNUGhJd045bVp2TXVRQUJ5MGwrcWppT29ISC9O?=
 =?utf-8?B?V29LcTBxMlBPWEh3WWVtdkpSKzIwNTZpOWIzS2IwUVMzVDNmT1ZxRzJVbVZK?=
 =?utf-8?B?Zk9uSTJIZjlFMkRaTERzbTBBQVFSbDFHc21pVzM5dTVsU240YzI3R2FRWWZt?=
 =?utf-8?B?QmkwSWpuVnlHbkVFNnpYa1RVNkJyUWpBS1g4MDJUa2lDQzZRbTdoZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ac69bd-9c87-4e1c-e830-08da21efbb8a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 10:31:15.4939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o95JZzPzO1BfgQc8Z5QjwRkJN1zSxVs237OEk+1bUhbtEEeie12kH5HBOgH/Kv2CaZnb+Slx2tE3dwHForcJXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5706

On 19.04.2022 12:18, Juergen Gross wrote:
> A hypervisor built without CONFIG_GDBSX will crash in case the
> XEN_DOMCTL_gdbsx_guestmemio domctl is being called, as the call will
> end up in iommu_do_domctl() with d == NULL:
> 
> (XEN) CPU:    6
> (XEN) RIP:    e008:[<ffff82d040269984>] iommu_do_domctl+0x4/0x30
> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
> (XEN) rax: 00000000000003e8   rbx: ffff830856277ef8   rcx: ffff830856277fff
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040269984>] R iommu_do_domctl+0x4/0x30
> (XEN)    [<ffff82d04035cd5f>] S arch_do_domctl+0x7f/0x2330
> (XEN)    [<ffff82d040239e46>] S do_domctl+0xe56/0x1930
> (XEN)    [<ffff82d040238ff0>] S do_domctl+0/0x1930
> (XEN)    [<ffff82d0402f8c59>] S pv_hypercall+0x99/0x110
> (XEN)    [<ffff82d0402f5161>] S arch/x86/pv/domain.c#_toggle_guest_pt+0x11/0x90
> (XEN)    [<ffff82d040366288>] S lstar_enter+0x128/0x130
> (XEN)
> (XEN) Pagetable walk from 0000000000000144:
> (XEN)  L4[0x000] = 0000000000000000 ffffffffffffffff
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 6:
> (XEN) FATAL PAGE FAULT
> (XEN) [error_code=0000]
> (XEN) Faulting linear address: 0000000000000144
> 
> Fix this issue by modifying the interface of gdbsx_guest_mem_io() to
> take the already known domain pointer instead of the domid.
> 
> Reported-by: Cheyenne Wills <cheyenne.wills@gmail.com>
> Fixes: e726a82ca0dc ("xen: make gdbsx support configurable")
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit (which can be taken care of while committing):

> --- a/xen/arch/x86/debug.c
> +++ b/xen/arch/x86/debug.c
> @@ -159,17 +159,11 @@ static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
>   * Returns: number of bytes remaining to be copied.
>   */
>  unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
> -                        unsigned int len, domid_t domid, bool toaddr,
> +                        unsigned int len, struct domain *d, bool toaddr,
>                          uint64_t pgd3)
>  {
> -    struct domain *d = rcu_lock_domain_by_id(domid);
> -
> -    if ( d )
> -    {
> -        if ( !d->is_dying )
> +    if ( d && !d->is_dying )
>              len = dbg_rw_guest_mem(d, gva, buf, len, toaddr, pgd3);

This line now wants its indentation adjusted.

Jan


