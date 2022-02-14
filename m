Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56464B458E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 10:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271272.465667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXZV-0002vd-Ux; Mon, 14 Feb 2022 09:23:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271272.465667; Mon, 14 Feb 2022 09:23:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJXZV-0002rV-Ql; Mon, 14 Feb 2022 09:23:01 +0000
Received: by outflank-mailman (input) for mailman id 271272;
 Mon, 14 Feb 2022 09:22:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJXZT-0002qw-Mg
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 09:22:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0c01e55-8d77-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 10:22:54 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-3pz0AI1ON-S8xnDz9ARIJw-1; Mon, 14 Feb 2022 10:22:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB7688.eurprd04.prod.outlook.com (2603:10a6:20b:29d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 09:22:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 09:22:56 +0000
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
X-Inumbo-ID: b0c01e55-8d77-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644830578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wGx4FH1iZaavxWV8ixKSZfSy2uLtsBdwLhDIdoatfZc=;
	b=VO/zDXFpesQrB2gXDaghhIpuyFh8vawP6shAVd2RvtpaF4TV3czwxgY8ts1T7c5YavkMJU
	cuXM2RMWCzt8fH7xsw24L0ajLdnOvna7XF39xqI2/odhpKrlsk6lUnq5nqCaEJ9NM+9pxZ
	NIiNXFxwDbdEWzx2W/Aql5r7XuTOCaQ=
X-MC-Unique: 3pz0AI1ON-S8xnDz9ARIJw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZXLkE9Ee5KM3PsRaPpDvfQ4ZWxdvUd52gWdRIOE0/4I3pgeQCL+uASQsOIquiFmyNLk4yW2ShUU0x4+pLr66kW2ilb5y+jE6Mo97kt4UcCET99DH+EdVWdmKUeKKV5D73CEhsg5oIDnrFgBfJzSp/WmONTvm54MQPqF5pzKnXRh306KS0kPvHLmddynF8h35u4YG9Pprj2bSIYqaAWO5s+qhY1AxCEnJH7IJjJ2ZcMZ8uei4hJfVX/Lm7Fd66UuAR8VbAFYxYpL1xw5qdp4CDt2GtG3XV/rCTzcvGk300hOM/W+9Sxr89gagHrTmU5hkGPQzT2/3+Rd39+fP4xTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGx4FH1iZaavxWV8ixKSZfSy2uLtsBdwLhDIdoatfZc=;
 b=DQaqEPIyr6v+P9fDN6M8eGWpGupZrHo1SydxdH/uCoOnAMCkwqfvXC6N5hHVvo15t5ngL3yI3xztgPdgnB4ek8A9bVBzhANx3z80u07r6pM2yZeEQZIea7Qx/nYFCsQelP4xcdM4+makz9hdfVHJZiF0NBxAYaG6ugPWPB5xlugLYW5E2hH7CbEd0kcg9KANYD08uW2gngT0fVq6Gww5Z2K/ZKFxzeCoEqStB0b7iltV08sbEv5rr3mwZBmH2g/Yq6/2ssI8oCPOOMaFadHaCbhF5jdXgR2ez9YpPaV4SStgODh6bh3puhvPzVT2ia4cdAjmDpqVlTMwdpSUVHL4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
Date: Mon, 14 Feb 2022 10:22:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/4] x86: further improve timer freq calibration accuracy
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f15b2fa-49b8-4a53-20aa-08d9ef9b957d
X-MS-TrafficTypeDiagnostic: AS8PR04MB7688:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB768847E0EEDD04E9D7C52A2BB3339@AS8PR04MB7688.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dgP4EJQ9RqlChFzA30RiArtIKyTWRUA4eTcpEQ1mCP5mk+3Ml9b8uuGmP/3mWm+kDYukqmPfg3D54VI20JNG3RvEWeGAJs1097B5oM4W7lC+jAnXMbJN9mqRqt5aNE9pbp/zfBSawk2jP+e+JNssrv1PuvFyoSOwNn7stqWuR8M4Fu+7IDGHtJgupEDAQZZbt+l2fLC1Sy2XTfDet8ULknYupGXZhnNq3kE/P8ZU6r9+tWDjPQGBXat98PC4h4d8iaPHT+fu+BvwR01yPz7+xxT4l1BrarWPpKmHrW2Gbdl814lprY4VzqwINzCSWJP4lnFRfJDRLP6PwFxslFvvYrdtFIU6sbeeb6T48vtvWGXfJjNM92Z8t+rCWUZubONep7xl65vk3qwY0z1+Cq3rL0n4EScg5/bsgMQGBKSHwnK5eNM72sZL7OrNDCmTSsxMq5CqKu9VtkywJCV9XgB9Mfx02R7Rok+7XjlrTvZX24i99aprdEZsWN92/XFVVAbzBVH0mQ2Lif8RlP8l1pPDu9vXLlxrKeCGlJMNAy9XRvFSPu1fYL7fKxvjba8LyjW4hbHhKVbC//wz8yzsTPa4ExLc0PQY+hCTzQTrq1QxfduTSIa6tnEJ6HRGwJH4igAQhQUqxA6C7dekxrq74KQ1Cci5aVrvIkhqyShQ+CvtlQtFZXZlD4cr1KniEzUG3qAb/G/lr3kmRXvJSc+aYaAg6jGMxj7YCa+yLZSWvMV4fb4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(6916009)(38100700002)(26005)(6486002)(508600001)(54906003)(6512007)(6506007)(316002)(2616005)(86362001)(66946007)(4326008)(31686004)(5660300002)(66556008)(66476007)(8936002)(31696002)(4744005)(8676002)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmlZQzE3WWp3bUFqRkdMSmNjU1VtU2o4a29BVzVFRTJ2emtKTzZjam9KSUww?=
 =?utf-8?B?U041SmxaMTlRYzlUOHIvVitqODlReGNsSnU5djZMNVdaVS9McUpBQmt6UGJh?=
 =?utf-8?B?YzQzTTZjYS9Dam4xV0V2UklzWHpmLytRMGY2Tjc3eFZyaTdEMUEwOG0veUdn?=
 =?utf-8?B?M1NmL3JiODhJc3M1UXduVEd3cnJlSTJuM1dyc2V2VW1Qc3pvS3FwcngzaEMy?=
 =?utf-8?B?TXNUUTdrbWtkYzJ4Q3FSQ2dwdG9WSzJkZ0ZXRjhKNUJoZTBkZDNsQ0dKV1Vn?=
 =?utf-8?B?VFVpLzB3Y2poczRhQzIzdy9SSFZvS1dkOXZzSHZ1T0Z4VHNnK3FsRTJ6aXZm?=
 =?utf-8?B?UWs0QlludjdFcEF4QW9GQ25yM2hpdWdIVlo0U3RWb1pYYlhNc1NCaWNrNkIr?=
 =?utf-8?B?K1U1cVpxUlYyVVUxbktaNUo5Z2xUTmNoNmhXSDRTa1huTXRwdDlqOHdQUHg4?=
 =?utf-8?B?SjkzSU9RUXlPbHRHZzRQdTRsODlua2pUbzlsTnljdUwvT2x3REIxZTlCNFFR?=
 =?utf-8?B?NmFkdEUyUXdqbnE0WENkbGNQSVVuQ2I1TzllK1gySHhkTHZ6bWFnd1E1cEhP?=
 =?utf-8?B?aGo4RFdyY29YRjlqYStEa1Rzams1WURINS81THNuWThZUkwxNTRvREZFYkxE?=
 =?utf-8?B?dTRaVE5KT0hOS2Z0TVNubDYwQTc4Y2JoaUtEaW80NWQvMkJTRTRUdjVFd3hh?=
 =?utf-8?B?Q1ZjdVduMHpzRmVYenF0RU5malZnRmhWbEorT1QxZ0dVdE12Yy9nNnQ2ci9y?=
 =?utf-8?B?TUdsNE4yTnFIRWxSa0wxd3pxQ2VTOGlPMEIxV2tNOVB6NkVycWMwQ3Bqa1ZJ?=
 =?utf-8?B?M0RzTVo3WDFFQzk4czhwVy9Ld0tUSmY3bEdMTGJGempBeDRLcXF6bjlaSXY5?=
 =?utf-8?B?aFFPLzcraWxBYzZENStXVUhDNXlaVFVhZnF6ODZQalZsRVBFQ2VmZzdoOU5T?=
 =?utf-8?B?MkNQWU1RMG9OT0JGV01hR1NmcXE0V1dPU2llc0g3OHVNNGdpWGpuM1krYS9B?=
 =?utf-8?B?eEhOVFdPczl3TkFpYTlZeUtSMEkvYWIyRTFRcWZxdi9LUUdROXNtcGtPZENj?=
 =?utf-8?B?WHBzZ3hDSkJHM0FPTXM0L0dPQlpBalorYXo3SkNKRElrTFNWUkE4Z2lHYW9p?=
 =?utf-8?B?WHJKOHl1Nk5RcVR4TTZuWnNDRTJ1U0NzRng3R0o3Y2VQUWgrU2NPUlMySWZX?=
 =?utf-8?B?L2RKOGp6cE8rQzFyN3paWGY5QVJkd3EzYXp5T3M1c29WRk82bFRqZmVrMzBB?=
 =?utf-8?B?bDJIYXVlNXdENi96a0JVMjk1ZVdQNTBhZzJWZ00wcjlWY1FiZ0lDdkUvL2xx?=
 =?utf-8?B?RzVMTi9oWHNMWFMxcDBNZnJSVlpTWnloeTMxWEhzUGQzTEt4ZEFFNHBSbC9T?=
 =?utf-8?B?Z0cxcytBZDRCUi9GSjZ3VmN4RjMxcUh5NUI3TTBaMWxSNGQ1ZldyRjlmZlRz?=
 =?utf-8?B?WjJoY2swaGNjZWFHZTBmaDBSS0pOR1kxbHFnL2o5a2h1NUVhUU92bGJCK1RC?=
 =?utf-8?B?Mk1aS01FelpjWS9tbFEwNU84bTg2ZVFlVUdHdWpNL2x4OTBZLzRIbjUrenlT?=
 =?utf-8?B?b0RxRXk2WHVWWDFIamxuR0FOaFZsb3E1MFRlbWo4OFpsQUtvQXNjSnhvdlFs?=
 =?utf-8?B?OEJrK1pYc3NxUnc4aisyejZIR3BRVFRBWGZyQkpoWDRlTHUrL01jUzA5SVoy?=
 =?utf-8?B?MGdyci9oa0FTN0k5WXQrcG03U0F0eDFPTVNXNHhDTHNtaVJwTHVqelZtQm9m?=
 =?utf-8?B?THVFbDRPd0hQU3ZZM3NVN2tkcUZybFA3N3NxbzVvb2ZLeWNtcVVrUnBsdUVL?=
 =?utf-8?B?YVh1UnBZZitUQ0wwLzFVcW9ISzZhZHE0dkdORjM1NCtmNjFuUmtla2xKNkFB?=
 =?utf-8?B?OTNaS2tYUUVkWHhTa3Q1Lzk2QVlXWU1rWWFjdUVWUHlnQ3RCR1REcmhLVXVh?=
 =?utf-8?B?YWpKWUhOL1JsK3JycTcvMzVocUpZb1lXQm5DNmJWM0tmZUpFNmVlRVlzbTJY?=
 =?utf-8?B?WjBVMWMveTN3Y1M1QmpwWHh0aHpnMmFJcS92cHUvRzlYek1rdjQ1WFZ3Rll2?=
 =?utf-8?B?S3ZyeDM2WjBya0Vva3l0TU11aG56ZW83dEhVWFQzY3I4c3VUb1lQSUZtTXRz?=
 =?utf-8?B?Uzd3STNzQzZieUtHdk4rYXNtS1c5UDB2ajR3cnZoZU1XQW9sWFJEc0hPOEll?=
 =?utf-8?Q?WUBDnTOWyDomcudH1y6Vv80=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f15b2fa-49b8-4a53-20aa-08d9ef9b957d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 09:22:55.8485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuDa+60kZX5tXGY9fB6bw0lhQcAy0DOIdAoVu08gQz02c6oUTEUAX/MUdvVcx3UkIEH1UNkOrvrJpm3vA6TyCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7688

... plus some tidying (or so I hope). Only the 1st patch changed compared
to v2.

1: time: further improve TSC / CPU freq calibration accuracy
2: APIC: calibrate against platform timer when possible
3: APIC: skip unnecessary parts of __setup_APIC_LVTT()
4: APIC: make connections between seemingly arbitrary numbers

Jan


