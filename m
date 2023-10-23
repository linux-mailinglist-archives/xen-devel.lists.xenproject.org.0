Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019C87D390E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 16:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621501.968030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvi7-0007Ax-Ee; Mon, 23 Oct 2023 14:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621501.968030; Mon, 23 Oct 2023 14:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvi7-00078M-C1; Mon, 23 Oct 2023 14:15:15 +0000
Received: by outflank-mailman (input) for mailman id 621501;
 Mon, 23 Oct 2023 14:15:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quvi6-0006wI-8j
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 14:15:14 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe13::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 951fb7c2-71ae-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 16:15:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8830.eurprd04.prod.outlook.com (2603:10a6:102:20d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Mon, 23 Oct
 2023 14:15:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 14:15:12 +0000
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
X-Inumbo-ID: 951fb7c2-71ae-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPJNluHGt+Alvn/CkKHonS/DKNJ6DJprH+IuKMXCKu2koYCy7ThnVCw6goDFyF7CA+WjXhBHpEcff4PUA6WaBSUrdo7iHvEf1OGp3xIgCInztDJ+WPzmU8tXKIxEb2RBoej0tAXoQiIX3WM8njksHJRbiYzA0TOpRkZc7ekT/dQQf0NYp+28EWmaiKn1aIgj29T/L65xC1PUGboUCsMvHniAfSSvGvpFkNZkIl4giyWIhWYa/kXr6sq7zijU19ugCYUqJPmtbZdG0EOX9ySiC2nEc052S7OtlIb2DhNboZHDYunptSMpt5nsZ3b/k9dfUYy1T3Xe4sLdZUphdkTjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKkrasVKTla8K2noSDagJeQ4zBLt3sPyI9dO5Gg/sUI=;
 b=PeavTUKXPzx1ZXwWQNl1DOs8CTTz3KApoICTCkqMkyqCL7hfKwklZ1kI16HqyRSlIiWVJBXZYlNxz/IYpsqa+0bsCFWzHLJy7Qo5t7c6ep1halxsyOzdDPAwvOQhrpV9fKLS3UhNOE6D2YsP2MPVbWNfUxt+MFvFWQDgrTyHlJzhanC9b0+RlYOYDES84lL0M7iQjxY8fX01LUZZkobjvi/qNIQTyTW7MPYKM2PeXmBnNV/eq2ZqHhy6hL7gSV/7+tdt1J7SwGLt7YZvLbTjDSnuDC7kYu1EJ6byF1WpLSxC5f1Ay+iqRS5Cmd1KjymUFErxRnKps1rpFONAJ71MPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKkrasVKTla8K2noSDagJeQ4zBLt3sPyI9dO5Gg/sUI=;
 b=qnqBEoCsEsv8+azb45vcuhWDlymh4uCFWSe268pVwg0591gOtimPJWGoYaUrIZNe/189tBE/Uxyb/wqgKejsMJyekI80JiVMaHegmxYbTTjGqumjiQ+X9EDGISk5ne9LaGyNPY/fX+Az7mW5BmgUN/D/G1CPimoL7ujWh8PXagXg2ewPFpKpg6/YPbTEwnY0PL7R9xTVNCNP9scxvn4ESywzqka9WEEqfH19Js+JEI0XJnGeASdU1YIrLaTg5JTzQMelkD1BfocKd/rnQrUvGAyBXY7KsYe7ze4CYs5xUlg9gzv/0qtdkua9kUOk3Uyh5rTUG3hVD4Pr5U9RiS+CIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7bafc6ab-3826-946b-e5f0-894930278309@suse.com>
Date: Mon, 23 Oct 2023 16:15:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 4/7] x86/cpuidle: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638486.git.federico.serafini@bugseng.com>
 <2ce963d3d7c8d14f2ddc80600454ea990599e0e6.1697638486.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2ce963d3d7c8d14f2ddc80600454ea990599e0e6.1697638486.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f9f5a5-ed03-4676-2e0c-08dbd3d27868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MHe+A+IbetvDdcv6slKffmSKdAwIp8rO2xOjW0pQbedEN89jofNC7PXn1nozDpNf45FV8b5obs/3lN5RAPEG+1CTMYBN9x2TKCF91WBYs4rbuU1xVp1/Ig8cXzOWEmXex88MQSTrudznyAbS9eIgII23Pyp/NnTyZctirHKpBTIvlOMQRwL+Dgfo90kg9mSDtu0F4H1Y+7+d7k0p9kXMMTShLITsgM4n3V0YyWuD25v9HqVg9t4yrX0F8wVTENIVnh2FY7GoxzzeEeL78H156Un44nUTsFNZ3V3JfZakAgK58AJK4V4oFZhIgTTLN+kU6CXJOkSPr1hN9+VkN0YC1WJ85x1kBBqhrI9G3TtYq+bg6QiSs25q+YRAu9eD4CPgApPVER0sY7/2Zqu+HtcRvuSTqS/QDaoklWsTdRW1l5D3riTEv7mDjR3e2LlnnoZ+ETmZXk3rzwu4oZdZTqsFetjwK3un9Prjfx7RyNWI71hdq2fdRQd8wIW/skxlun9LPoItMzD2hHdt/lYdNJdwanZ+V9gsYmjpqxKqU0jbYM08OsdPKwtstNoX/dY9paPgrX0gCKn/43iEq13EGTGvhoN2SvX9UTByL1gF7djV5F3KWTi1IIMKYa1ajabnzE0TScohYH+XjHs2tQ6KN4ZawA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(4326008)(8676002)(8936002)(41300700001)(2906002)(5660300002)(53546011)(6512007)(6506007)(2616005)(558084003)(31686004)(86362001)(31696002)(36756003)(38100700002)(26005)(6486002)(478600001)(316002)(66476007)(66556008)(66946007)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K283SEpxSWRKbmptVCtHeVc0b1BoOTF1YmoranV3NVliNFJVck96ODhYdFJi?=
 =?utf-8?B?Y1JlRGVUTERUbUJ6d1YrZ0RWWkhEUG9jaG51aGg2d0VLZDVxUElkMnhZNWZR?=
 =?utf-8?B?dFRRZTNrZGZEWEhEU2JQYmFwczV5clJYUWl3Sm1pTERSTlo2cWI4NStvSDhO?=
 =?utf-8?B?K3dZZ2gwdXBVUHFqSnQ3aEF1TlJFVFArbzZuTjExd3ZjS0hWd3YvQzhXWmpI?=
 =?utf-8?B?Q1VOa1RyS3V0cnk0WG51SDNvVzhWeVluZHNxSXVqakp0Zm9jK0tBSG0zVmkw?=
 =?utf-8?B?TmU2cGM1MDNwK3VlR05yVHpMZXpKb1RrWnVpRjl2ckxkaFh3TGxtUUo0WkJz?=
 =?utf-8?B?N0FpOFhMaS9aTURETCtFZWhWWDMwZDFJYmVhYTh6Z3RyaGdHTmlSTndHN2Ry?=
 =?utf-8?B?Uk1ZZlVoQm1URjlaQy80UmZCNUg3WHZTcVU0MVlGTUJOMjBUSCtCQS9sN3lQ?=
 =?utf-8?B?Tm9Gc2JLNndoYnIzMVY3Z3g3MWxCWkFvUy9TUTQrQVArOVg0eEhxUE83Yk9z?=
 =?utf-8?B?R1BEZ0tXMlFWQm1hRG0vT2c2SHpNZkoyZjZZRkduUDlOMEdUNGdhT1lpM1Jj?=
 =?utf-8?B?WEtkNXJVZng2Vm9iSG1JNTJXNGQzK1lhTzlBclR2am8yd01QTU85TnRwRjg2?=
 =?utf-8?B?UnAxOUd6bGJUbEhISFVxaS9aYzNJNDFJbDVSRm9MQytzS1hxMHl0N1QwKzVN?=
 =?utf-8?B?bkN5OWJDQUc5dGNqU2FFTUIzbFlFcHd5Wmhud05IOW43YUlRZ3VFRjhUak9t?=
 =?utf-8?B?MDRSQWpyYXZROGZlYTFvQmNxOFM5R3dXbDNRdmVlemkwMzlWd2JrS0l6akRM?=
 =?utf-8?B?a05DYXNidWNZbWwvRWNWeEZXTUtBaXlMdmVMZ2ZJYXBzRlM1TlVoWUFsd2FW?=
 =?utf-8?B?RFYwQjBJOE0yWmZNTmdRcnZxQmpRWXBRRHhwRHFlREYyR3E4Y2JLQ05vakMy?=
 =?utf-8?B?RjYwNjg5THdVRGNERzB1cXAzdXVnTWJpb3pVQU5UM2pJR3BmQm9WMm1lT3JZ?=
 =?utf-8?B?bk9OVzJvSGV0ZDltV3pkREFkLzVZbUl2bGNJZDRISUx6UVl3UGNER0h6dmlj?=
 =?utf-8?B?U3FTYTFYaGlNODFhVlRweFQxc0lHc0JZRUY4Rm9zRlBSV2Q5elMreFJKYnkr?=
 =?utf-8?B?MlZ3T1MyeUxPS1FBZ2hIeVhRMUFURVczbUNCMzRvdnM4MmtOWHZkb3h4SUdQ?=
 =?utf-8?B?ZE5seGpaRE40SWVwdXVVQVNNdEUvVGtzbGZuSU5GOVZKV3VaVTRraUhsSGhj?=
 =?utf-8?B?U1cvRS9zRjFOcWtoY2p3ZmNWTTY1K2Jid2R0ZVpES3laKzlQWjk2NktUR1Zz?=
 =?utf-8?B?cE9xSTVGTHJSV2VwUVhTb3lXN1ppTFBYTW85Z0lobS9HYUpiMUppY2o0SkY3?=
 =?utf-8?B?K3NnQW9NWStvNlhrL256S3hQM2dScExVcFF3aCtvc1RYZmxENkRZeEw3cytD?=
 =?utf-8?B?bWhhaHhMaXhPRXlDSHd5Q245cDZmeTVSbVozNVEvcm9NMjJZaXdqZ3c4RDJO?=
 =?utf-8?B?bDJzWlB3ajFQUGMrMVliMTRuUXhOcFNZOGxsbXdzdFM3M1krWlIvT2lnbHkw?=
 =?utf-8?B?eE5Cb3JvalR1eVROS2xDb2dTYXUxdm13dlE0QTVnay9tTEQydHVVRE9sWUlB?=
 =?utf-8?B?NnB5UDhTTmdtTTIyR09QdW5oYWttd0tNc29ZYzk4OXFJT21SMlJUM0tHUHJX?=
 =?utf-8?B?MHdVck9XOFZHTTk3dm9MU2NIM0k1WXBVOGxWSzRyRnU4SklaWkxJWmhPZWtR?=
 =?utf-8?B?UDlqclZEMkloVTJISzdLT0JyK0ZyUEk1TkVUQVZjNlgyS3pGU2FxZVlzci9l?=
 =?utf-8?B?QXc0QmVYZEZkOWt2MXQyUHFtR3hXWk9JY25GTVBnZUplMmVvRjVNTW1qQUJY?=
 =?utf-8?B?Sm81bUdBYUFPTkxadU5JS2wyVnVTZmNhT0pDTDMvSyt5bWVJWDUxU1gvbHFJ?=
 =?utf-8?B?dFc2MkEwUHA0N3Y2dVhLREZtRGJFVEVOOVA3UVh6M1RLNWxrVWdrbHZlTGNy?=
 =?utf-8?B?Si9pZjJUR25NbG8rTjZEUVNkanhaVzlTbUZ1NUJ5WVBLK1IwRE9ETlczdm9h?=
 =?utf-8?B?RGxEOERFKytxL1dHK0tNWm1pbGxtUmRLN09lcWZxb3IwZHFZTWljWlZ6VGxw?=
 =?utf-8?Q?Tbhnav5axF981/a8Nt5R97v+r?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f9f5a5-ed03-4676-2e0c-08dbd3d27868
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 14:15:12.1091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRaiUru3R1JY2+QXQDyfFQC7vFJp9ONi6fOTfQNZ7x0tOtSSTumVkCBgpoRLR4vrPjMa2md0q22HgoCNjVCZ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8830

On 18.10.2023 16:25, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



