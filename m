Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD2464ABD
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:35:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235723.408895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM1a-0008Fy-7K; Wed, 01 Dec 2021 09:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235723.408895; Wed, 01 Dec 2021 09:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msM1a-0008D1-3x; Wed, 01 Dec 2021 09:35:38 +0000
Received: by outflank-mailman (input) for mailman id 235723;
 Wed, 01 Dec 2021 09:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msM1Y-0008Cv-D2
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:35:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0917f212-528a-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 10:35:35 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-ae7S1H3COaqcTECFmoXO0A-1; Wed, 01 Dec 2021 10:35:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 09:35:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:35:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0205.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 1 Dec 2021 09:35:31 +0000
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
X-Inumbo-ID: 0917f212-528a-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638351335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/y6RLca+1pUE+izwcBKQFC3EIrdH3gGzNiT0llCVhvk=;
	b=UvDJsM8KXxxDKnwyQmz8RUgjPdsbfTY3k8ZpR9yWal3gI/Y8dhHZtYUioILG64za87Ac9a
	ofCeSis0Huh0zjjBDydNVoFL025P3aFk9HFLlH08KzSwv7fWAo3pDAxJ3uo2+sq5qPoPLk
	ILfKZ6Yp3MRv9gTXwQoe6of9l6Mb4p4=
X-MC-Unique: ae7S1H3COaqcTECFmoXO0A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBgZjC4gRr7dN4RWLS8coPxSobfqxXkoblr3i0Hoka7W+gYY1bwS9tikgH5DPFrOH2XndG0OQtwEGHuw1xydZuZIhrCae61Zb5QuhNVqJBiZ3MvFXCQiMxwDAbQbpqZVTMud5c9X4Y/vQGxEckUoMPvqGNBZUsC5bU5B/ewnCWNGEvwd/CQD4EGTdvDYojAjfiOv0N8BzA10KQZyFkqGnXW6Sn41Bk1pLXxKIvuHZv0z3XS5LYiDGoxb44v839u3ENjuRlO7WNRw/GftJNlVyJyu79VQE5JwxHri+C5PWhJ04oB+XKRpHRFlIBcpqaVDk8eet+stUFrBVCqBXaEz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/y6RLca+1pUE+izwcBKQFC3EIrdH3gGzNiT0llCVhvk=;
 b=jaCtiXfZqwr3pqqCMjgniHE8DFGw9lccdJXfo6epX/bo4Pj4RnwvX5LXiPWcNz7W8TiHe0hFPDnmddVIvgL5di9wEtFLveUWv4n5Sv+z0bscNpQfKA8JtR0UyvUtN4jZZCzxQTEx/2b/kUqdY6F+8TM5VUYggK6zguOsSXLJlzqJWR+lQOLUy+kXbmFIThHsj/Av9H4OSKAs9d0snmOE5Hq4Q4deQ7zOuZ6itHK+PYF4ruOwVb8A44od4leCk+MDZWkB3Vb8/G+hE/8VLlVdJlTm+SpT/Pjybf7IpXa7Je715C/wIxcZg2hndOs2xcwQzlXmfgPTwN8gf3J/C0CxYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
Date: Wed, 1 Dec 2021 10:35:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] (mainly) IOMMU hook adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0205.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de0d821f-d90a-4f6b-7c7e-08d9b4adeb3b
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43848CA953707D4FF676EFC6B3689@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aXbU16S/pWK6fyZg3JnzL+sDP8dR6QYh2EfVFvOpmUyPM/aFBsROWg0oYnpNU9tnFGVEQXgF6naHEWPans/sJhaCYZDv0m0+VsubL8Vc6VgibYEGCbXp/yxQOBGoy7JbqngRlRSW3o5kD61mTZTchsi9NzUjwv/+g436DV6L704pTpeqFjuxFHDwDvAbdyIZuwE4vReC0zC12DcFZygtazAaDhNWwYZOq2E6iUMj4eFezN4gIQKsArxiIaIsw08XcL647j/Z+8VFNMzLCfHQ7nij2ilj+ywVEwQAS7p/V9Ifx4Rxk9f6Pa/XjJpMNdyLmfOsrM2JBKS3PlQtE6j6Dj41x01tU20duiZHU/ehXxPPxRjFstQGK8ODFMdg0xvy8eYvQHTiVvESSKRiLBznxCumEvYhjcvTASlDMGf23LLr77nDKYLGEH6x7CqmMQTP3awj6QsgwzUJzLHcEaV3FVDOwsxi1csRtmG2RbFVemXf77lTkJPHsx/Asr4fgTyKV1vBwlc0ClbhQFKVjwPRjefogxwifPwxaOK0r+bCfjBxWWS8yoFpJHEXQQzEd6APSDv20z1yajQicBNJK9Hgai+dvAaia+ugC5dAXyaReAEDstGVMR2AlxIp5f0qCBfCBy+X5FU4fZ4JXwejRtyC4nkudfJ8cjkNZgPazI7m6p/gsE9hRBcrVgtuC8GzxWFtF1CGyXse7QVrbRf/hcZc+VUDqlDRPKx7kRFVs6AUBlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(5660300002)(2906002)(956004)(6486002)(2616005)(4326008)(36756003)(8676002)(186003)(8936002)(316002)(26005)(16576012)(31686004)(66556008)(508600001)(4744005)(66476007)(66946007)(6916009)(54906003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWM4eVBocjJqUE9yYkFWSEh1bWd5eURUUTlaUEZmWGxXVGVqY2dOWTAyRGg1?=
 =?utf-8?B?dmxWSUhKK1l6RFBkSlZOMmZVS0o4Zmk3SlRkU1ZpaDhvRURoSU9ReWpxUE1V?=
 =?utf-8?B?aUlrMmpUSnIydC9POFA1R3VwWjBxV0J0ZmFYUGY0WVdiN1k0c2RJNVIrN3Z3?=
 =?utf-8?B?TWtkTGZBNERubjAxVld4Q0Q3TFNaNS91eTZwL2ZRYmVhU2hKeUl4SnhFUTQ0?=
 =?utf-8?B?MzRDa1MzS3Z3QUQ3SVVYT21GM2NaNDFQM0pyKzU1UzRORlk3NjlwRmt0Kzlw?=
 =?utf-8?B?RWtub2FFbE5CSW1ROXBBaDdaeitXb0pTMzFHRkdvdlFPaXdic2FNZkRJZWZN?=
 =?utf-8?B?ekFlKzJIVlh1S01GSXQ3dUt6RjJyNUxueVdkcDUxemx2ZDRTaUlKckpPL3hT?=
 =?utf-8?B?bVhHZ1lQZXFzVDNNOXlkTWNkL3JTekJBSlJZYTF5Ym40Mlg2UnNrVERlU0dN?=
 =?utf-8?B?Y2xpL2tIN3kzdWxpKzVVQk8yZXRuQmE3ZTRsL1ZENTRjOVV3MDhrM0QvUHpY?=
 =?utf-8?B?ZGJZZzhyL1ZNemdSM3ZtNVY4Y3VPWnJqWWFoM2R5REIrQVdMNG8rNkhGV0I3?=
 =?utf-8?B?WnJTVHhzSnBINEJTeHI5TnU0bVRKSnlwdnEyOFBDZ3l2ajI1YXNPU0FjYytz?=
 =?utf-8?B?dGdzQVZFR1BzZzVCcHJtYWJsQUpuV2tLZVhsOUJjamRnbXVmTUFoTzh4M2xR?=
 =?utf-8?B?YXJkWGY2bmY0aTdEZ04yYUtYUHpCb1pXVURHd1R6ZDZmN2ZPa0hPUDEydVFF?=
 =?utf-8?B?QjJZcmFhR09INnF5UjNINlVGSmdCRUlyYVN3S0MvQWpwSEd3VkJ3NEY3NXBr?=
 =?utf-8?B?K0d3Nk1xL0VsOExiTW80TDY4OElMbUdBL1E4Rk9kUXdlY29VdTJLNDlIa0ln?=
 =?utf-8?B?enRRTzVkSUcxNFhkZTB1SzlHQ2IyN3ZLc2Q5VXlRMkFyV3hYS1NzcktzK3Z0?=
 =?utf-8?B?TXQzM28vaU5IeE50UmpDdXNFYzNGa0lqVUZ2NHRsWk1ZazhRUGUwdjJERDJO?=
 =?utf-8?B?RklZV01WWHZZV1JpMTA4ZzlDUklPclZGRENiR0U2MlNFNlNmS2VyYS9XMk5z?=
 =?utf-8?B?UWlDNnZ1TDJmTWJWQVJFM2FQWGYrUDVVc09WSHVDMysrajVRMkgyZDk0Wktx?=
 =?utf-8?B?YXB0RTRoQjB3MVM1UGNBNXg0cFJDTkxtMWVyRFNQbDRiVW5pQUM1UURTUHdD?=
 =?utf-8?B?Qi8yMkZBbEIvTk9wd1FBNkZtbUlRNjdING5IbkZJejU2eXhJcWFLaGZNL2Na?=
 =?utf-8?B?WlJEK094c3hSRGNiQkNwbXAwWmJHT2VkSmRFZWh6aWYyeDh0NUpBQmxmRWJX?=
 =?utf-8?B?WndoQUIxZFJ3N296TE1kaGZWWlI5OUhrMXZNc3MvMDhmbk9XQUlueitJcGNr?=
 =?utf-8?B?elU0UW9wM29wVGtxR1M4SkRRQXdDYkhHWTc1NEhzK0NzbTIrYXZQc2FtRE9p?=
 =?utf-8?B?b1lrcHVrbFBHS3BMb3J2NkdPMlpqNmQ4TzBWNWxDbE1QRlhvNVFocjdCSS9G?=
 =?utf-8?B?Mld2L0FRcWd5ZXVkeVljSE1oT0MrWElUTTBpSEdkbzhic3d4eGsveWlnUzNh?=
 =?utf-8?B?TnVHenpsSFlocnJ6RkhpUXRLTEF3NU5TVWlKWUJFTWJCUC9zS3hpVW1NaWxz?=
 =?utf-8?B?UGxpY0FRWXlSUFpjWmRKREZQNWlsZlljSW5iMHhXK0dJS3pBNzRuNnFmSUc2?=
 =?utf-8?B?Q3JFMzRkRXAvd3g4bGIwWWlrQ1ZIV3JkRmhVb0lVei9ZUlc5UVI2QW1DUWZG?=
 =?utf-8?B?ellydStOYWt0RXljVGluNW5pb3FvMUMvQzRQUWZQVWFNZUdWRVNhTkNsd0Fn?=
 =?utf-8?B?d2plMDU0ZlZIWEJGUSt0TUE3aWlQSHB1ZHRLYmR0eklhdHEvTy9VcEJRckhz?=
 =?utf-8?B?REZ6M1VJc3JlbUtNT3lvY1M3WkNGTnQyMEpuTndLbWVsMEtwR3MyeGRRRmc5?=
 =?utf-8?B?RUx3R0ZQa0xSS0YxWHlZSGN0bXp4ZVlTa3haWkQ4VjdUbTNRZkhlajJhbFFa?=
 =?utf-8?B?cmRIdjRNem90ZVhtUkM2WmVubUNQVTFDbGdqQUNOMmtZSkx0NDV4SXlyRUti?=
 =?utf-8?B?bngrRkJMZlg1aENMZ1pYZHcrQi9nQkJqRThnSDFhRmNwR3pXdDZCTW55Y0hB?=
 =?utf-8?B?L3VTODI4anJDcWtOejlBSXRTRE8ybFdYWHJtaHJ0dGRWcE93Z1M4WDU4UjNy?=
 =?utf-8?Q?RKqQkTkNMzoCYSQbmfxbDk4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0d821f-d90a-4f6b-7c7e-08d9b4adeb3b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:35:32.0201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7O7TZDzASJ88sL3WxzqIlhcTr0AAhl4gtqoKUPoYORy4rQKO+ZA0o8w8E4aslQkqTkTMFeOI/LBN0N8VDuSYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

Besides the altcall conversion, some further adjustments appeared desirable
to do while touching that area.

1: IOMMU/x86: switch to alternatives-call patching in further instances
2: VT-d / x86: re-arrange cache syncing
3: VT-d: replace flush_all_cache()
4: libxc: correct bounce direction in xc_get_device_group()

Jan


