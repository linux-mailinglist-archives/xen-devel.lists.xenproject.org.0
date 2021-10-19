Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5922432EF4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 09:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212788.370805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjCQ-000541-UE; Tue, 19 Oct 2021 07:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212788.370805; Tue, 19 Oct 2021 07:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcjCQ-00051A-Q4; Tue, 19 Oct 2021 07:06:14 +0000
Received: by outflank-mailman (input) for mailman id 212788;
 Tue, 19 Oct 2021 07:06:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcjCP-000514-P5
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 07:06:13 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 803f1130-0449-409b-a9cd-da52609ab954;
 Tue, 19 Oct 2021 07:06:12 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-VVf3VEfGMQ-tkX_0Ck1kwA-1; Tue, 19 Oct 2021 09:06:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Tue, 19 Oct
 2021 07:06:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 07:06:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0069.eurprd05.prod.outlook.com (2603:10a6:20b:56::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Tue, 19 Oct 2021 07:06:08 +0000
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
X-Inumbo-ID: 803f1130-0449-409b-a9cd-da52609ab954
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634627171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5JBayWtv2/ASpal+RNSqikTv9+fbklV1NnqhvXk652E=;
	b=lKeraY7cBfz76VnBP9yTaceVbnLr4aFhERUJ/aCJA17oD8YxTI5dEGpZyRYaCqCXpY86bb
	0Wlr/ptL5skK4h0j69YDrn6qGpswiGGrV4BRQfnoZBv2p0ML5V9L1wzB4ZNrMSmv0KDTrC
	4SKmGqdEztbM34YgbUutjh42r6UJ5Wg=
X-MC-Unique: VVf3VEfGMQ-tkX_0Ck1kwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/wGoJJwCCUfDujWNWB3CRIsso7hRue493859cqI+DPYtJLskdnxextDFgrtUSnb2c4lD5mYiKR0zEh7mLwrlR0WbeNHZvXkla0yZNgoCvHcqrMobEd1tLZZv6EZXrjmifHpk4Ux0Ew+H6l6V+Oovb7OO11mx4RAaoOVN9QQu832feJRIp7JpVqwblEIqPHiB0vaUmszxUz2nlEC2ZuCKVRf1MeNPNM83vw+/rt2IJ9v6ADJUziGOFzpeSf8111s0KEBImMl5ND2m+KmNS7HVDY7TeajrXTeYb8Ce++2OF1ApMDQn5vxp0ZevChfZaVctPbbBxm5LdZSBOHbbnZaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JBayWtv2/ASpal+RNSqikTv9+fbklV1NnqhvXk652E=;
 b=PfyMzThPohCtNatloUyrVDFwj4wjjwpjJg7C3z+IlqiMiaDmnmkZxwVd76NqVzI6iZFwWjKD2W3Wx7rF+R6ZeRLlL7RB6qUsQHNR18nSYc90/cEKQgVQkz2VqQ/2BbBM3JLT1UYlmsFGT6igQqxot1y6kXvWvvj6/ED4aK+mm4wHL9Upc2KqYnsKaG2vBuOizgQEJIyLa0vhV2CbwNXK2FPBhnLxfIJ5r3p3ylQrKJTLGicuu0SunFzO50Gq8BdiMLoweNSfJq3gDt6Ry7FAqNCUACEokq545ZCJt4ffK6oFMmBhbvLH0JJnfjoB4WgQeENXyqdeQyTH0MsfiGl0Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: HPET PC10 quirk workaround and some cleanup
Message-ID: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
Date: Tue, 19 Oct 2021 09:06:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0069.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0cf5188-b259-4d2c-e4b0-08d992ceecf1
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686182A11B877244F5F23779B3BD9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	54TP4K1XR1sMAY5kN8cMeGMx2DQH4StTfyn4sohHrQCXjgpMeYgO3xxrHxZonbYiSDXYF3y+FqMl/XMkJbNCn5WriUavDCRI67/Zew1obhNl+cTi0mSu3yo3VX3wXXTJNJir0fIURa9cj+taXTzFXWAiptO7Wbwd7C8btP+tx8iuigeJYopEow0iGsrbROFi5IsfNCLzV9f1WJg8HSJPmzfSo/Jp81AdU9BB+8voBJniEjDDI3FPQkcP90qWL3WR1pL0jB6zp1pHRpW2GRq00Ue73ER13nrFVRcCK0BCZ5DcjCQyj17LEABCShiaeD7Mx5dGe35832KpdkPClWDkZXXehRiIGT1U4AjTxdtFcFwLlK3ttrhofpkf3AE+dgZb3cyjnY+RFoIUGqBkWS3Saw8X6gb3dB256zGQmRMGpRfaBnA3ucVXoQWo7GHMBuqi8L0yv51N0+HUOj4juK/hH3n89Qiou5G2lv2no88Q0BsBAaMgOCtP1YnD3LR8cwZHxSsOBUy5w3yX9QfP9H25uHAuJPxiPG+ASmdAuwaThZoQmwzeJ3XA2us61KI5WBXkA6WweCj0qhYxKUuF92iRUn2DohKDa9xNp4kqGijJ5q28zdHSnv6P2swvdxfgA9LLBbJtzR3ZD4OcjAjrduaScEK3EVDQ2UxJiCwCNow7Rmax/XDEybpLAyvzFVGdGkDC0TknLXiAmnKzL30CieRNAtkc8HpK5oSRrosU7c7LXnM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(86362001)(4744005)(8936002)(66476007)(16576012)(36756003)(66946007)(66556008)(38100700002)(956004)(31686004)(2906002)(26005)(83380400001)(316002)(186003)(31696002)(6916009)(6486002)(2616005)(54906003)(8676002)(4326008)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUdVTWFQeHppcEtrL0t2V3FZUy9KL2VPSTdOTnY1Tms1dk5WZWdvRENjNXBJ?=
 =?utf-8?B?WVdYbmt1Yks4amhwNUUrOWd1WCtiZ3ZiaHZZTHp2eElGaEZTcU52ZnZOUkpW?=
 =?utf-8?B?RXRwN2VEeEdaL3krY1lZRjg4c1FJZWZjM3hCZnRVL1NtU09tOW5sTzBZc0JK?=
 =?utf-8?B?UU5CQWdkSFAvZjZuRFhIR0pHZU1uZjM2VU5CL2lxcVUvbG1RMktKRFNkZkdK?=
 =?utf-8?B?V1dBckdPL2EwMHM1cnJPT2hXUTJSRERDNTN0Zk5QQkduNjNLWEROUXBQazAz?=
 =?utf-8?B?eW1oUUJrOG9yNHVYUTVUbGcyQ1Z5enJvcmJpU1J1aC8rSnE4K1JhWTZQTHBG?=
 =?utf-8?B?K0R2L25yRXBsbmpPUGUxOWpFZkp4NlpxamJSYkMwSVI2cFIyNGtsamFIZHI0?=
 =?utf-8?B?RUszSm1BMTV1TG9MNExqRURRcjg0NjJwNzlLOFV5eS9Ea2lzME1LRkxCNVBl?=
 =?utf-8?B?aHFEY2VoVVRvVi9WUi84UGpPbm1ld0pYRFh1YmpST3pzblMvVThSS3ovbnl6?=
 =?utf-8?B?K0QxZDlveEwyRXlxNStta01Edm1Fd1lIYjlETHNZYXBsdkNSREdBRGkyWWVN?=
 =?utf-8?B?bTVtdmd3YlBrS0JPbXhMSmw0YnlXTUVCeDVxS05zRWNMTndrUlBqUXRBRnR1?=
 =?utf-8?B?K1k5UmU2UUZITHZlcVZtb1RFT2orWVB5SXNBaHQyTHcrajdqVjZzOFdmMmtD?=
 =?utf-8?B?WktQVVI5a3hxckdwdzV3a2JuU1JLd3REeWZoTTkzbEh6dnhVUVZlWU5IWXZl?=
 =?utf-8?B?MGpjVlBSaUh6V2dKVyttK3JYUzRiT2xDcFcvSDdkdmhMOGxGeTJhMGVNR21u?=
 =?utf-8?B?dHk1aUR1L3V4QXVBeldOWDIvVS9hY3Y3Qnh4dmxrTE4wK1dPSnZCNG5Wc3J2?=
 =?utf-8?B?d25ZVXJtMGFucWtWOW1Ma1FzRHhaS3VqN2JOajE4WDJrYmVzcnU0cmpQQldE?=
 =?utf-8?B?VFpoNS9jQWlkOEVoUVh5OUxwSEt0b3pBNzkwbHZJRWlVWERnWG1BVGFzN2pw?=
 =?utf-8?B?NVRkQnl3VEd6SWNhUndZRy9ZZktJRjUrT0ttcjgwelJTRWdXRS9kK2k2eTM1?=
 =?utf-8?B?aHBCMFpjSk83UzNZamp6eE90YzdvL2dWdi9sayszcitPeHhzZkpqSGNGTGx5?=
 =?utf-8?B?VnV1dGNBWUdieDJZbmo0VkcvWldLbVloSFRSMnZLK1lYUDR5M2JhK2hqNk1s?=
 =?utf-8?B?MHVYRlE2K0I3d1UvR09NNEhLYUFEd2J5MGREelV2amVPNm4rclVSWmZSajJZ?=
 =?utf-8?B?NjRzRFU0NWZpTnc3NGhGSHBSK0pzMFBXRWkybXU3OUo5VmRNWmhtbGRMbjZs?=
 =?utf-8?B?eWNxRkZHcHp0YThPcHRkTHgxVDNOa1B6R1ZBaUlUQ3pXa3M1L0p6Y0RjZnJO?=
 =?utf-8?B?djBadm45Snp6NWlwdEc0MFRPbDNCeXRINVdCU0JTRFNrNHJlSkw3aUpFOUdC?=
 =?utf-8?B?bC8razhBVDgzaU5vZUVaOXc2Qkc5R1dlTXpPNnVWdVpEK0l6ajNZVWVhU0kr?=
 =?utf-8?B?ZzBscWVXR2pNcVlmSU5obXNtL3pWR3JFajdETCsrRnJoY3VFeG1YR2svYWRN?=
 =?utf-8?B?VDBJS0pJanNVRXNpczhHaUo3dDd6dEgxemRkOUd4T2g1OG9lVndkMVlCLzRp?=
 =?utf-8?B?YjRSblB1b3BSQ1pUUjh6dGVRMmllUlU2NHhIampMdFJwT1B6R3FPUE9SVnFO?=
 =?utf-8?B?M1luNklUUGlIWXczM0JxQTd6ekpCT0FBd3lXTE1veWlHTnRXbFFuMGtRRCtV?=
 =?utf-8?Q?IgEPPIz1OQB1P78zKCPkdswcNlvs60AZvMb3ZtD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0cf5188-b259-4d2c-e4b0-08d992ceecf1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 07:06:08.6859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mepTyH9NenuJ6sxYkIgCbygl83LbuB0FuajnG3X7mp+ebJbJrDQ22PC4crYas+l8uohWM7/zn46/8ZAgtC7tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

The workaround is a port of a recent Linux change, replacing earlier,
never accepted attempts to follow Linux in their PCI ID based working
around of the issue. The other patch is long due cleanup that I
happened to notice along the way.

1: x86/hpet: Use another crystalball to evaluate HPET usability
2: x86: de-duplicate MONITOR/MWAIT CPUID-related definitions

Jan


