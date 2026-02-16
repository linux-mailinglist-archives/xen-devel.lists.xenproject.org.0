Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFXHAqYyk2lx2gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:07:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE721451A4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234246.1537550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0Bb-0004Kh-CG; Mon, 16 Feb 2026 15:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234246.1537550; Mon, 16 Feb 2026 15:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0Bb-0004JY-9U; Mon, 16 Feb 2026 15:06:55 +0000
Received: by outflank-mailman (input) for mailman id 1234246;
 Mon, 16 Feb 2026 15:06:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAgz=AU=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vs0BZ-0004JS-3v
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 15:06:53 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f1009d0-0b49-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 16:06:51 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB5688.namprd03.prod.outlook.com (2603:10b6:510:36::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:06:45 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 15:06:45 +0000
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
X-Inumbo-ID: 1f1009d0-0b49-11f1-b163-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FKvEFGKkY8tZYJztgJgJFztz/vYu92/wSTkD29EYMFueOi75q8tSk6l6s+LnLQRoGrQIorOKAByyLD4bhaFI2hyUyeAx2mI7H7H9Nd8VTVzPCJCjNL168cX2d09sSqEQLxH4pfmNOX8FZ1BPjC++T1pwaOaumlJcIRM8e0XDvMfd5ZVdYde6pO/tnzFsEYR6V0gdXKkXY6BkwSNLFaQJNdOlCMLjSbDSzOFMh77Hv+W8jziGkumuv0K8eAkhKgP7qIJltUdEEJ8/531SIz8FBJDAfvBR++ji563z44KoDBP6mpa5ZaIgp4UYrzFnQzKiT6H1nKE2Wp7DOGKU9K8jYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYfNenKyR18WxXZHcpEj8NdKDJuavWDVFgYFxMCy2RU=;
 b=bfCeNi46qQhp7XmtdUkedkgW5ubYLdPUCI1i6jhuSx1bKinzNOem4ZEoe72bOSR4psfL2QUQ8BkBUtoNLyIQiE+REJ7ty7voBD6HuLcIsrH8/tkuB+QOMJqVz92BQ0w2beyrp74tcCfxNR3d2wjPO6it0grq3F2neR23v6NzNMiJdolslrQgdNHt5oNwP190o3BCfqiqw4yR60TK0qzdADDVSp5t+gKtLTeEA7hzqdZPwDjzKixPUJrWIEWNebEPzGqoKt0OMkudA+Sxsxqrkngq6+saphAkCjap7OImF3WWrOzMqUWvSYSD1gq8bwoCydVAj9JwTRBrQWQ/4+LNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYfNenKyR18WxXZHcpEj8NdKDJuavWDVFgYFxMCy2RU=;
 b=OFlYfCDvyU3ulKjWV6RzDyk6YVSVapcW62uQjd9EbcUhoGx5lY+OYIrskgBmT9Sku9zRaOnQVZVurSKvejEWFkR5ps7GMtoCj+VtVFIOFboc99nBZ9PunOBPS9zybjWq2su/ck6ivIoO1JlHbhVE9MpZllomB9SKJjP77DRGg+s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 16 Feb 2026 16:06:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] domain: skip more stuff for idle's vCPU-s in
 vcpu_create()
Message-ID: <aZMygcKLwGQiNZu1@Mac.lan>
References: <b010c8ad-afcf-43f4-b273-fdb43ab641ed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b010c8ad-afcf-43f4-b273-fdb43ab641ed@suse.com>
X-ClientProxiedBy: MR1P264CA0116.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::34) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: f3cf859a-3e2d-42f6-04cc-08de6d6cfffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnloVGZMWGJ1UnVWZU53elhER3lNemZJRytscE5maFYzUXJMWWlxYW9CNGF4?=
 =?utf-8?B?b3FKdGh4RnkrdnMyTTcvUGtZUTMrVll4eEh4bVIvVXVlS1NNNzRYbFZ0dEg5?=
 =?utf-8?B?UnZZek9lZEV0N1BZTjRsL2pwWEs0eUlJeW80TXkrb0ZqdWdEdExVK1BkalNt?=
 =?utf-8?B?cGM4UmFOcmlsbjUxOXQvMEtlK0tmMnd5YkhMdXNETXNoMFJvVGR5c1N6WktJ?=
 =?utf-8?B?ZlhNc0txWTZMR2wzT2krMzFGZnZaU0hSWWRzM1c2OHdkdnhaUzR1UmR0Z3hj?=
 =?utf-8?B?aEswUWZVZFNYT2RDL0xicERWaWZFM1l0V09iNHo5eHBxdFArUGx2aG9aM21P?=
 =?utf-8?B?VHprdDlzNzc1L1FQSjRHK3hxN25LOWxDS3JpbUllQlhNNUFJemtEdytwVVV4?=
 =?utf-8?B?dEc3K3VBS29UMU9jd3g0QndMdXRzNE44alpSYXg1RGdDWDRXVzdrNW9OTm1P?=
 =?utf-8?B?MjNkSCs0VXZFZ082eFdKcmhnUFhvcmFCdWNra3RGMm5hNDQ2SUh0dFBlY2Rt?=
 =?utf-8?B?L0djd3Myc3FhcGJRQjlZUFhNbjhBVDVaZmJFZDJKc1loYlFCR1UvaGhaMHZN?=
 =?utf-8?B?Y1Q4MzAzM1dDa01GQ2JSMnY2Q2g0UDBvb2pFd2xOTXpzeUsreTMycEdDKzBC?=
 =?utf-8?B?Vi9FVWo2SjBwZUpWZzhPOXlhQ3pJcXFoTnNoUU5yVU5TTDVOZGdvSmtLWnpw?=
 =?utf-8?B?MURCalJrY3NZMmRhQ1RscVBXUFBXajZaTEpnZGtMOGxoSUcwbE9YcVhvLzFC?=
 =?utf-8?B?L2YwYXRPdjN0bzNVamV1dENqMk5kTVJweVJkL2ZUbDBkdmtQcG9rRU9jcTdB?=
 =?utf-8?B?THhFZzhXVzBKVG1ocnpvdndvVTBRSld6VmNkdlNVTUJMeVdRLzdmVFhJWUEy?=
 =?utf-8?B?Ris3VDlSRkhhYlFTeEMyQ3VJY2NKM29NQVZPYkRzZ1JITXBhWmVxQkgwQlFN?=
 =?utf-8?B?cVN4V3VvRW9CcnRPNE1TOXdiMTFraUw5RnlrQk4zc1JsSU9SQ1gyUjI5WlVj?=
 =?utf-8?B?ZGlFZEsvb3o4K3pXaFlDZS9KS2orTHhsWUhwTXRvdGJ0TzJQME1iRXBnNU5y?=
 =?utf-8?B?UzNTdDFOVk9NSGZWd2V0RHArZ0lOTWc3ZGVqekJlUHhmeUV6KzZXZnByWmFP?=
 =?utf-8?B?ZWdwOWtXMEFnL1Q0Q29UMTJxd1FEUTJZa21nbFB2M05sclpENVpoR3NWckxm?=
 =?utf-8?B?eDdKQUtjUElvemViTXFySmVGSEVDWU15SzZPSkp1SllHc1ZOVmlHZE9qNTVv?=
 =?utf-8?B?UWVtdVlBa2dreEZYTDJZN2ZLZVlPMXFoSXVKUUIvWnBwbzJWemRWL2tCN0tW?=
 =?utf-8?B?TVBHUnJ1RXZmZXlvaTgvdjV5aG1MNWZYUDgwRzRhVmpZTWM3R1UweU8xOHdI?=
 =?utf-8?B?OWZ1MGlxblZPcDNpdWpmZHBsdzU5WmNiZnd5UnRLNDBQUkZleFBwSEptSy81?=
 =?utf-8?B?K0EvNGpZdXR0emxjODlpYVdoZENaT2hIUjdXRlRZQTJqOWxUanFheVJ0a0tn?=
 =?utf-8?B?blRWWlRHbmxtckt6OWt1VUd6OXFtRjc4enNSUEtFVU4xTXYwSEM1WjJrdGs2?=
 =?utf-8?B?anQ5UGluVjN5K3U1anBrWUh3dGoyNTU1Y0MxYWJrcjFOQkhSZ3FBMTY3RnNH?=
 =?utf-8?B?cmZaUWNuWlN3aVlReGlYTjdIS0ZQNUY5VkRwRnpLK2x4NmFCd29Xd2kwbldZ?=
 =?utf-8?B?akJPUVBtU0FEYTVUaGhscDhmSWdjTi9VN0xXWUxXbGs5SlFKeUkzWkM5VDIy?=
 =?utf-8?B?bGFDNkoxcDd5MjNVdnJOdHh3dFBaSmp5T2VEWVpERXBiTHhiNTJZQ3Nqb1ln?=
 =?utf-8?B?Unp0TjA3d21rbFZYTkY3c3ZvU1FWVWlremlJejJMaFBJV1FiUlZkZzhrdG9H?=
 =?utf-8?B?V3FTQ2dNdGlOYnY4U1JlbEdhNjAvZlJWdEFSUDVDbjZtTklWSWhHYWJlWmJm?=
 =?utf-8?B?NzY3M1Y2eVRMbHhITGJqRzNJeC9wK2FOMnk2a0tKOVpzNWNWaFNtS25KeStl?=
 =?utf-8?B?clc4Y2hjMEczaUM0RTZnR0V6Nk5SZjAyWUNXMUVvUTlweS81bWxheksyd0xq?=
 =?utf-8?B?UU9vOE5ubEVkTTR2ZlIwazdoekVjeTJYMFR0ZVpQWmJHSkx2aU5Wb2NKTHcv?=
 =?utf-8?Q?j50U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnNHdG9hRFRDNnFjL2wyR3NZa0xkZXk5Y25sMys4emZRSDY4STNsc0p5SVFI?=
 =?utf-8?B?cUs4NVBKRm5yOUl3czFvc0lXM2Z2b1lia1JRbWxKQ1lzblBlbDVhZHhVeTFD?=
 =?utf-8?B?T2NHWnVVTG9XU0E2VStaNEZlL0NOSVdaM3pSL2tyTlFERGRhcGIzNFNyNyt5?=
 =?utf-8?B?M1B5YUsxNDRybEo2SzIvTUtRUzJvWDN3US9SR0tsYkxnR0l2KzJFYm5oUDNZ?=
 =?utf-8?B?NGZTRVNadGVlN1M3cTRINS9CSDJ4d21iRFMvRFFZRmFXL2dIUEQ5N2t0bXFn?=
 =?utf-8?B?eUxaU0ZnOFVZZktxU2ZrRERZYWw5UkhDR3V4d1BPdVRTbTR6YjFLSng5czZO?=
 =?utf-8?B?dXZoTWpuNjJEdFlraW9Cdmw1UVFCRWx0amUvK0I4aFlwVVZVaURzazZWYmtX?=
 =?utf-8?B?R3FFbTJZL0lnMEJlOUNkNW05Q3NoRjJ6L3VTZzB6d3UzOXVDaVV3aUJyUGdh?=
 =?utf-8?B?cXpCZEdURkU1a2ovMEcwSllzWWgrbDgwbXlWQms5RTU4cG1jMHIxb1A3d1VF?=
 =?utf-8?B?WGZ5Si9EaTI1VG50ZTJVMDdTSmF3bkptWUdHYzJrSDR4eWZHQm1OWS9yWncv?=
 =?utf-8?B?M2lwZzVQelJqLzVIMEUwY3RmSEFjL08wVDZYMHhXNXJkdExVSjloSFgrWUcx?=
 =?utf-8?B?V29sWXpFZGpVOXdWRkJSM1FvUzdjOC9USkFNbms0UW82Q2NqWlh5dXZ6MHln?=
 =?utf-8?B?MDRJSm90VjJldVMrWXp5NU9maVBnYmpFem5VM1VtUzdqaGlpaTN3RTZTV2Yy?=
 =?utf-8?B?Y29hMDhUS1Y4RVNuVjRMcW8rV0NTc0V1cmVJQkx4WkNpYWJxL2VqRXdSWnhG?=
 =?utf-8?B?TUFocC9UWEJMaGtoKzVFb3FmWkVFMWQvVGdaUmlkaEtyWE5iVkpXUmptQmda?=
 =?utf-8?B?VkQ4RnlBL0JjSnhEQ3Y0WW8xQ0VSVWdtRFpaOC9SYWVmd1ZteXF4d3NKVUJP?=
 =?utf-8?B?cnpnTVkxU1dkTE55SlBpSDlieW9BT1FFR3BVV2dtdGVhcEVZVlJ0M1BMM1ZC?=
 =?utf-8?B?b2xRUTZ1QjZJMFJGdDgyWmZIMjd6U05QVjc5SFVZNWg2ampPQzRQd21qUTZ6?=
 =?utf-8?B?aVhHZmQwTGhLdFFyMkRUMXRwd21DVHZxNzFkZ29GMEo4VDVJa0s2K212cnZt?=
 =?utf-8?B?akhRUGR2N0hQVzFxUU1SYXJHb09INmFRYk1WMFByN1g5ang1MTh4SHNoZTlS?=
 =?utf-8?B?TjRZbGVrb0dPNUNjSkE2RDBxc0RiSzZuYS9HZFJ4cDdhV045ZzdmemM1NW4w?=
 =?utf-8?B?Mk5HL3poSUpubVdaUFdGaVNFTWlzcFlLN1FmWWxaWm9EdTJndWZYdUl3QVlS?=
 =?utf-8?B?K3N1RVhoRkNKd1g1SWRSVEk4QXA2ZG9CZTM3SlRLZk9ucytLN0ZNeWpMcXZk?=
 =?utf-8?B?MmhGTFo3aU1lc1FOb2hqbXAra2hWcVd2T09xTjUyOGRyWk1GQXEzOVMzd2t0?=
 =?utf-8?B?bHU4L1laTFpiWE5YN1F0a3F1ZGlLTFhqMEFXV2g5b1FuSUV3U1NBY21zUXE3?=
 =?utf-8?B?Z1lqdnVNQnBYOFp1bCs1L24xWUlEVUNiKzhkWjIvRm1nNmo5UGlNVzNLZDhK?=
 =?utf-8?B?WVlTcU9ITHZZdlgyMWVKVzlaQWMrSnJHeGlJUHJjQjBJS1YzV1VqSHgybzIz?=
 =?utf-8?B?aGVST0Rtb0cxOG9LYS9ZYndJYmQ3V3ZsR2VNQjFsV3E1UWJlZTIzbG4wTWg1?=
 =?utf-8?B?R3JzV3dCcHQ4UzlxOXFtN1hiSUt2VXE5aHYyNWhtencrL3p5RU9mekNLZ1VO?=
 =?utf-8?B?WjUwMGVBdjRXSlFJWjJxanZ0Q0M0WE16bzlSeW15Y2hiRGxTRi9GT21md2g5?=
 =?utf-8?B?UFJMY3U1cE1BaHZZVm5XTUNqQzUrMmY0Z1BjL3hDOFZrOWpLWXdMcUtQZit3?=
 =?utf-8?B?eEhJVGhlNU5FV0MraXZDWE5TbzY0MWlJaU1rSmxCeVFiVXRQZmZsd1NIVEpF?=
 =?utf-8?B?N0kxWVF6Mm1JNFhaSTRZYXBQdDAvaytORkczdmxhd0p2SWdqMGxHTmtsOVI5?=
 =?utf-8?B?bUl2RDJLZXl6dm9mZWIvakExL0R3UDZGUnVuMlg5QjkvU3VLcG5RYkdQczZU?=
 =?utf-8?B?UGd1ZDFBQ04wR2JBYW45VWdncXJVaUpuZnlKV0N2WDUvWm55OWpua3BZV00z?=
 =?utf-8?B?YzZrUDNvWFFwMmVXU2p3eWUydFZudlAzeEFPU3orRWZRSkdCR3ZSeEN0RnJw?=
 =?utf-8?B?bFh3SXFGVmN5TitnZk13YThJaFZqYXZucFZVSzQ3RHdGeXhMclRadFRUbEhT?=
 =?utf-8?B?RGd3ajhNZ0dKQVdpTDVVZ2hvMEdxckJZVkpOai9QVDVDdEszalNKa255QU9h?=
 =?utf-8?B?ZFp6OGh1MGg4LzlQQ0Nucm9TUU5PQnllRitJa0ZocGQ5NGpESTR5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3cf859a-3e2d-42f6-04cc-08de6d6cfffd
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:06:45.4207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyQkJ16btJ206AB9+pDqP3alft9FP0lL52QDQmotnFMcQb3DGtjEZRBLMefLCDBGf8TDqd7iLRnhUX6i6999mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5688
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,suse.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3FE721451A4
X-Rspamd-Action: no action

On Wed, Nov 26, 2025 at 11:31:46AM +0100, Jan Beulich wrote:
> Nothing hypercall-related needs setting up there. Nor do we need to
> check whether the idle domain is shutting down - it never will.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> For vmtrace_alloc_buffer() adding the conditional may be questionable: The
> function checks d->vmtrace_size first thing, bailing immediately when it's
> zero (which it always will be for the idle domain).

Oh, I notice this now (after having written the comment below).  I
would then add a comment rather than the extra check.  And possibly an
ASSERT(!is_idle_domain(d)); inside of `vmtrace_alloc_buffer()` after
the vmtrace_size check.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -427,12 +427,6 @@ struct vcpu *vcpu_create(struct domain *
>      v->vcpu_id = vcpu_id;
>      v->dirty_cpu = VCPU_CPU_CLEAN;
>  
> -    rwlock_init(&v->virq_lock);
> -
> -    tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
> -
> -    grant_table_init_vcpu(v);
> -
>      if ( is_idle_domain(d) )
>      {
>          v->runstate.state = RUNSTATE_running;
> @@ -440,6 +434,12 @@ struct vcpu *vcpu_create(struct domain *
>      }
>      else
>      {
> +        rwlock_init(&v->virq_lock);
> +
> +        tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
> +
> +        grant_table_init_vcpu(v);
> +
>          v->runstate.state = RUNSTATE_offline;
>          v->runstate.state_entry_time = NOW();
>          set_bit(_VPF_down, &v->pause_flags);
> @@ -450,7 +450,7 @@ struct vcpu *vcpu_create(struct domain *
>      if ( sched_init_vcpu(v) != 0 )
>          goto fail_wq;
>  
> -    if ( vmtrace_alloc_buffer(v) != 0 )
> +    if ( !is_idle_domain(d) && vmtrace_alloc_buffer(v) != 0 )
>          goto fail_wq;

There's an existing issue here, the usage of fail_rq is wrong here.
It should use fail_sched instead.  However I wonder whether we want to
move the `vmtrace_alloc_buffer()` call inside the existing `else {`
branch of the is_idle_domain() condition, as to avoid this extra
is_idle_domain() check here?

Thanks, Roger.

