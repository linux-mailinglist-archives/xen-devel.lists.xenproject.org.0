Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825663A9300
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 08:46:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142711.263252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltPJp-0000N6-Br; Wed, 16 Jun 2021 06:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142711.263252; Wed, 16 Jun 2021 06:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltPJp-0000Jl-7v; Wed, 16 Jun 2021 06:46:33 +0000
Received: by outflank-mailman (input) for mailman id 142711;
 Wed, 16 Jun 2021 06:46:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ltPJo-0000Jd-Ds
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 06:46:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63406904-ae5b-45be-86ce-149877e04309;
 Wed, 16 Jun 2021 06:46:31 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-Ijwcf9FsMHygkbiuRPma8A-2;
 Wed, 16 Jun 2021 08:46:29 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5166.eurprd04.prod.outlook.com (2603:10a6:803:53::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Wed, 16 Jun
 2021 06:46:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 06:46:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Wed, 16 Jun 2021 06:46:26 +0000
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
X-Inumbo-ID: 63406904-ae5b-45be-86ce-149877e04309
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623825990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jI8GS4dXvPHwc4fa10PkyQkqApx/gKJ7eRbOO1jQzKs=;
	b=JbKoz/RsA0wfn/3WQTG7zk5HdXLs/J1VWhj+LV+2i8p1S/3twq0gG0weNhCADPtdqUVZLR
	W0o3lXOJ/xvQQgqJCE/N/SG5atPsAbOUs2qieJoeEWUuNC7omvqjGfOPaIWSyfPQt3da5T
	3HNqDAIhHiCljHenAaitJK4/E3vt4QI=
X-MC-Unique: Ijwcf9FsMHygkbiuRPma8A-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlGaNqaSqPSiZuJpaPSjaxEvkRn1sDcJwwgjgMNRGP+dm1Pw/FM2q2zGQjWRZdTD18gCFhkn+EYytStpcD3dMJMbJJLLd/F3IFjtg5IWBjVC9fkvkw3w1hno0/mUPHOjaP/qLWhHqm6kf5vs2MY2Y9S5Lq1U/uPJqZ4O9LMgtEDx5ArTlzMqkuAEQqp25Y+f/VIi83u6IW5HtKygmPFdt/UYlvqtWwDW3BHq39ezrZXp/5QhhnrpEKPJouyWb+oIsjpRBC4Zre4xlwbeYYoQ23B2gA4gp2rA6AWeEuNkpliTmhyVC6PO3pIbFMWfPwLstxMp8XlPzvG+BYDuUjW5Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jI8GS4dXvPHwc4fa10PkyQkqApx/gKJ7eRbOO1jQzKs=;
 b=jgpXWquSR8Ikil8yKm6RgxYyEp3nXLCknC5W54YOj9l1mVZH+zgqJ538p4lbAbAFDLBYVTCs0xQcx7QfrKKamj+R+Q6bG5G+WyHy2NUtdKUe9teN8tVef022ngSJIFLu+ehhuXTPdUIlLgzj8YXryKqCOGyWU8Q93xWIZp3/+qksZ31mjClGIXDdJuygbWjfWrsMOoLDYCFEHwE6TnND96U8KIOZRYGJBsaE1oWmgVkJ8tavEmWt4UXi4TxmJA1jlq/ASIepwY5e75pqU7ZKxpZHDcXNqUZe8U4XJxrUuMN5GFGR0NO1bLs+cI/K+GjI4p0QMybXEVmN6zVqsichWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/5] tools/tests: Drop obsolete mce-test infrastructure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210615161905.9831-1-andrew.cooper3@citrix.com>
 <20210615161905.9831-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <04f641e6-04bd-8884-4b08-4c8f9a418b0b@suse.com>
Date: Wed, 16 Jun 2021 08:46:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210615161905.9831-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0009.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6202f005-df73-41a9-83bc-08d9309276b6
X-MS-TrafficTypeDiagnostic: VI1PR04MB5166:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5166CCF8C4D6CD6C05F02F7BB30F9@VI1PR04MB5166.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nv6FrYBvRJ9HntRsmE5xTjEBmc5ynmI287/G2QQdL4x2IhQwxMAYYOxjcE0eQzcGYPwnL7z3dhs7SeYizqovPp0iEFp+Brhlu+EElZq/i6rsGG4URolJFJvj9IdyFkAq/RxAFYSSsqAsimc98X8Ua84mDMB7xSSVP+oTBNRgaF8/QlZ/scXKPBNa6Gxn6XgZKZLChJ6JmbWALfAhf1TZPrPbDykX0BM25Q60TLvQBpE2N3nbVyFKdRQ9kCnrcgJ19qL4+HrQhVxE58KsgenbT2UsoMUGWQgEKABnEceWG5++iy9sjJpEUDsFL0BdT/SoLW44piZsrIlHhKpbiNJUq2i1hJ58d9WBttJvuZuPKv9C06ymhosDNspBvFO3f8al6sQ5TXVrX4ulqpm+FRlgnP9LHNvamKswb8m39RgY94ndwZh3DPTqe+wTvKc4xOMO46wCKqa29euB1/LTWqWqUXNaNuuwu3nUJzcb114ZPTwwwNZ1C1DQeyNqr0wNFNYkmKFlC08o+qIWVx2hyuiaKBWRTVGzmHkjgtju3nBxyBYLwJLLo9sw/+tc1slOepf1Gstu7mrQ7iRKbHG+5WLeJNdGEVkGwkju0cjfE2kyZcvL7NhCuD0TIKAyM3C6BWKcDO4GOO2tPxCL39BbOn5AThCeD/4Wmu0l5kLlqpFI5gD7Bsr8leFTV/WncApr2Ncn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(396003)(136003)(376002)(346002)(38100700002)(6916009)(26005)(316002)(54906003)(66946007)(31686004)(186003)(8676002)(66556008)(16576012)(66476007)(16526019)(2906002)(956004)(86362001)(2616005)(8936002)(36756003)(6486002)(31696002)(53546011)(4326008)(5660300002)(478600001)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajg1Ukp1K0IwcDhEM2huQm16RTk4eG1hZkNONnZTK09KeGFkSzRDbVc1T3Nj?=
 =?utf-8?B?bTd3U1hxaUMzN09UdlloendJdkpKQUhob3BIM3RIRHdVd0JsbzRlaDdXemJM?=
 =?utf-8?B?WEU2N3F3SFFOSFlBU1pkcm5RdlZKZW5uVmFrMU9vL2VzK3dMUkNaR2svSklQ?=
 =?utf-8?B?eDEwdU5yaUpxZ0toeTdpZ21KYmgwTWY1Y29HMGp6WjAxemZqMTBQdUx0dklP?=
 =?utf-8?B?d0R1N1JDTExWKytyWUtGeElFRDZ6K2R0dS8ybXp0R1hqZVVCVnp3d1doZC83?=
 =?utf-8?B?U0dxTG93WVJKQVg1ZVN5aHRGcUNoN25FZEg5YmdZVXFuaXpOZjZuRkV5b2wy?=
 =?utf-8?B?Z3JKNGFXUzJHaXVlbFhkZ0lva05lY3JFMjMxMDdvZzR0RzVTZUltek1Ya0ND?=
 =?utf-8?B?VEQrV1ZFVkJTUVZOVEtBcm5zSUtSeHFpN050akJ4ckxtWWN4N3FaTkM5QTM0?=
 =?utf-8?B?V2RHVDl5eExmaUttYTNyajREUDg1TXloMUU4eCtFVnVwWGFDMkhNNnZFTStN?=
 =?utf-8?B?cGRrV0wvM2FZMXpkOGptTWhwZW1EcFBLdlZjYU02UG1idzZXS0RaL0N6RTlW?=
 =?utf-8?B?V05scEUyUkluVGJmZ3JMU1Y0eVI1bGJvV1VzUGJCZVowVGxrSkJVNmt0dTRw?=
 =?utf-8?B?eDZicTZqNUlxQ1UvWmo5ZzdwdUs1dXR5VFpYaG1ZNm5aTjhPVUNZQnNJckNP?=
 =?utf-8?B?dDI5bkhqMEZwcWpsalkvZXVpMEQzRmZFN1h0RkVpL3hCNit4UXhFRWk2cGJ1?=
 =?utf-8?B?Um14bzNrb1R3YlJxMjNPYTB4OHV3TGx1TVpUT1VaMlFpdXZpY3AxdW52R014?=
 =?utf-8?B?Rmk2MDBJZ3lZd3NLM1R1dkM2YlRmbXZXYzFpOFIvWjJjZHkvbGg2R2VBMzR0?=
 =?utf-8?B?eDRBZkE2UFE5L2pXNy9yZ2d6a0w1LzlaTGM4bFJBdy9wWC9FUTExeDlnUFl6?=
 =?utf-8?B?UnNyVWhPeHdpVVd1blNwOEcybzV3NDQ1NHNzUVBUQk9EUGQ0eHZLd3hERGRY?=
 =?utf-8?B?UFpLMDYxVm9JcHVoSnIrZ0tiOU40eFNZN2hJMGFWWmF5NFJCUHY2bUh5QkdZ?=
 =?utf-8?B?STZaVE0vRjFGWVJVWjRDL2QzbGozSVZzTjljbTdKV1g5Y0hQVk9udXYvSEMx?=
 =?utf-8?B?WU93ZDZuZi9wa0VjYVY2MzdJU1h5TjgrWS84SmlqeGczSGlPMlRnYmVuR05x?=
 =?utf-8?B?S3FJb1BtMGU3aGh0bkdMbTBIR3IrMEF3dVlWakpTczVMSFdJNXg1Qy9SZk9P?=
 =?utf-8?B?Y0ttYndBTm95RjZ0WElDN3pkREJwYWxkWm92eDhRUHJrQllNRzByKzJhR2R4?=
 =?utf-8?B?OWpoR2ZQaUlMZmFQZEpzQkJJbGl0RThGMFNidE9JRkZXS2tiampiK2dFREVo?=
 =?utf-8?B?SER0KzZ3N2J3WG9zVTZURkxaU2pZUFV2bmJ0S1QzZW1rQ01TMmd5WExUbXpj?=
 =?utf-8?B?V0pvamNPd3FEZzN2NzdHRkowWlpRbDREUWdpNDhZLzY5UDloSkY3ODAwMzBa?=
 =?utf-8?B?OGJZNDFNNWxTeFZPZ2R4WTdIbk9RaHpKRHJXazVQbUVyYnhwVlVBOWoxRVJq?=
 =?utf-8?B?c2QwcmFZOFNwaVUxeGNoeDRlZTJWczVQZU1VQVFvSGgvM0FINnBmUDVwSHoy?=
 =?utf-8?B?Y3FuMkl4VFBYN1ZjaElPdkhSWlNXL01Fbmt5blVsSnFzTnZVZHRtVTFHMXFG?=
 =?utf-8?B?UUZlTmRrMmlSMys2RkFLN09NT0tWYTc5aENWOUF1UmRqVDlkeEVINEIxbHBB?=
 =?utf-8?Q?lN2ITeM8MKCtlDzvzf38YPfodPYqOvF0XUpzp8b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6202f005-df73-41a9-83bc-08d9309276b6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 06:46:26.6006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AV95Q6oR/M4UhIOWAyhT6cjBufUaRxH1tE+FtRmHKo0I++9Y7/lQrn/KOCTw4L9TIgonKOLSXHM7F6L/cFBbCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5166

On 15.06.2021 18:19, Andrew Cooper wrote:
> mce-test has a test suite, but it depends on xend, needs to run in-tree, and
> requires manual setup of at least one guest, and manual parameters to pass
> into cases.  Drop the test infrasturcture.
> 
> Move the one useful remaining item, xen-mceinj, into misc/, fixing some minor
> style issues as it goes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

While I'm not generally in favor of dropping testing code, given the
constraints you mention
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


