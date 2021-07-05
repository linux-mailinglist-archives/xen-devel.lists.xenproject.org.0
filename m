Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 413773BBE5A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 16:40:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150287.277894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Pln-0006cP-8v; Mon, 05 Jul 2021 14:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150287.277894; Mon, 05 Jul 2021 14:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Pln-0006Zz-51; Mon, 05 Jul 2021 14:40:23 +0000
Received: by outflank-mailman (input) for mailman id 150287;
 Mon, 05 Jul 2021 14:40:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0Pll-0006Zt-Ss
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 14:40:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 355f227d-13ad-4d17-b126-c92b1cbbfdc3;
 Mon, 05 Jul 2021 14:40:21 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-W1IniUwVMl6UIUm5OdrQwg-1; Mon, 05 Jul 2021 16:40:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Mon, 5 Jul
 2021 14:40:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 14:40:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0057.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Mon, 5 Jul 2021 14:40:16 +0000
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
X-Inumbo-ID: 355f227d-13ad-4d17-b126-c92b1cbbfdc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625496020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=203FE0NQ52LlSVCSKTMDtBwPSKT4SfWfRpQHyfgn/fw=;
	b=H6RCPJJbhbnhP5SMqZV4nqyd8ub9AOjFYUB1PLpY4ks3IaRzjfPzmbm1zc5l3ySCDsI7tQ
	KBzRgf6T79mB6/iwXPUjVoLaalogxrWQTYtf/J7fIqyRom1KRmGbjj6+Ch5CnUKjjGS/Ep
	60xPZgr/mVjUvU1s1sAgUzRuA6eafEA=
X-MC-Unique: W1IniUwVMl6UIUm5OdrQwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR6+QsFIv6lDs49tIa6OtoqfZRbHa3reF+NjYKGKp+4eN7QHH1iL4VL8/EgonlxE2qxoSK/ovhq1qrrZL5XdoJY2lAVaTnpsVIy3+qndmq0eji3uY/5f4MMyMKz9kPDvOT+XQYsRrzNkc9+YYLJ2FCNVgbXw+DqM3yI+I9gT4XDoYVmVNoA2yAO0xOQGAGP7wN1RvGvJm4nLFFwHB+SAVzu84iSsF9gqnKVtZBJ8GLsZ4Oy35saPc1AmN0nFR7GbfhHGdUcuPF3ZzaF17KyFgDkuRyTilx+XqjpcFLuSkn49wN5a4O+tMfETmLPOCJx82JjzwAnTsxd3QGwtAqThDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=203FE0NQ52LlSVCSKTMDtBwPSKT4SfWfRpQHyfgn/fw=;
 b=VpgPLhQO9NCOHfaNYJy+6upFhTM3nVCoh5nYAOjvfbIuYRnqozJrNn1asNW3JF/49AaJj0kcaMBtSpe7IkAiTxLzI9dft2TLL+/3HdK2KpUACzmVOyDybphauNoCIINCBAbq8SFwC9RrZzhNDUdJVpFGRpUDOapt6ab+8doXFsebe6Cm5BQtcWve6eGLvmLPbaHK1Q6u5gEM/13siDqh+H6CVDUDLV3zU9wmrK8dt6H/ENrRUEx7M3gvIIn/j2ib5A5cR2radYEgMUTVMgAnmpUkXxZUAW7xAq0L+SXNvLaEjXyPEAIq6EqmSZQuX4u+PL7NIVmbktAG2V5rNeD7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 01/31] build: fix %.s: %.S rule
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90d965d1-40a7-5277-5477-4b5c5a858b33@suse.com>
Date: Mon, 5 Jul 2021 16:40:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701141011.785641-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0057.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bad715c-c6ba-4216-9b58-08d93fc2ce79
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4349B0B778FE2963556C23EFB31C9@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MbX+sB7phdoenE9gFU+l3x4x5cm+7dwrrXPZGLmyEnmFV3/G3pRmRgalLbZD+3F1kgFky3WsOECsUNXv93zCdgfh+zupg3xP3BJpWaNdqSFPsfSPbFJBis2rH20BNilBe1kSY4CG0UFDbxILv9+rN2NwPL+BvIdhiMXSwBkawaCkFH/iDi8H6fqXCVyKB9HXOWD53as/VedNgS+kHFi6zvlDpzzBbJXJbbl7B/44xZXcYHOYDmWypFcRqXKbiwYhH7nqWXWW+4hSCiFSGdUwN5oNGEH82xHn/3GUfI7jZuBtgJWhDb06dtewlxOSx3e0ZwQuZVJKs0i8BxHxr0x19G51q7ju9X4FBXXRs+FDhv6fLVs1h0y788EAgnHlfGeH5nOyP7HhNQOiSITxdYfCLNIqb/J7VmeRxMt8uudEtKdklEy3ut7XJaiHKP2LVJiCdD7Juf+Lv8QIIfXEzBkj/F0l+AxWh52r044Um920lyH6NTFF6gL4QJqOlHw1NYJQWkmBJ80Mb3LI9mfUGGIMgScF/em0gPdt7CPfRYw/GymzyHKtncJGQAlYOD++et7ajmnhnAqyKxgmZ9k6g0/74NSG/L/7gYfduMh8WZ8S4YHacUmw/cz7h3tUBT6PK04tJY+oongvlvciFlV+VrjL5TFkiIGT9upcS/I6h2ZnDXwlVClSavnAwjjPFbvZPmGK1hO77mzhj05q0b9symwoRjwRYBH6ygNIqXnWZijeScg6ZP2OmX9l2lEdrts8TdTn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(39860400002)(396003)(136003)(2616005)(6916009)(478600001)(186003)(8936002)(53546011)(16576012)(956004)(26005)(54906003)(6486002)(5660300002)(316002)(66946007)(16526019)(31696002)(38100700002)(36756003)(8676002)(31686004)(4326008)(86362001)(2906002)(558084003)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlhucU1BVXNuL1Zybkt3aVMwUVBTVU1mVWhBZXQ1MU80RC92NkN1Unk3Yk9M?=
 =?utf-8?B?b2FxYkNRMUhvckttUGdLeEFwcVJ5NFBMYUc2bDlXbkYzQ0xhU05ISTBkclZj?=
 =?utf-8?B?QkpZSDJWa1diTGJXZ3krdXlnbm0zWVdtN1dvVWtkT0dOSTg4QmtSUUZDTnYx?=
 =?utf-8?B?SkFFdDZBTlFIL2lVZDZJbTE0eXo4WkpYTEhFdGJId05KNmh2QjNkVlBqNldG?=
 =?utf-8?B?amxXNWJ6RkcraVRVZnhmSW9yVHhacFpFZTZTeUVUY2xkRGZSSzdlUnBSUEg1?=
 =?utf-8?B?c3VUT2UxYkFWOVN6Mmc4RUJVS0JDaFY5Rjg2RDB2WjhKR052OFJtTnFoVXVZ?=
 =?utf-8?B?Sm9VcnRQOW8rR1JnckhQc1h4UU1iK2NEVS82MlZPZnFjVkhvZXVNV0daZHZ3?=
 =?utf-8?B?RkRJOWdaUXhsQjdQZXdWVjRGdmphTlp2WGtTVXBvUGN3a1VoNVltSk1HR3ZP?=
 =?utf-8?B?WGttQ0FWRGhzR3hKQmxsc01NbVhMM2RRRXdSQUpXSFFaUGdjdGYwUmp3MXov?=
 =?utf-8?B?L0grTUVEcElqZlR0VzVtMmtaRlBCZXRVUXFWRnE5ZCtGc1hjdzZBR3YrYkky?=
 =?utf-8?B?VHZ2NXNndllkdlQwR1NNeTI0TDgwVnpPTkRDMm1DNkN5M1R1UEYzUWVVR05z?=
 =?utf-8?B?TGl2dENxZTcrZnd2bXlQcTJkbGpXUHF4ZVlMUCt3SzdtRnYwRjBBRGp1TzFi?=
 =?utf-8?B?TTRkUkVXWXFFZHg5elJ0TVBLdC9PZXgxSHR2VVAxS20yTEFwbDZkTUNUSWYz?=
 =?utf-8?B?K3U5M1kxZm9PZUF6VXJGNVBybjM5YmNZb3ZRMjEyN1hQWEZYU055WjNtMWwy?=
 =?utf-8?B?TnNISzk3WjRualZmZHBRbnV2T052aG5KV1J5QlYzdDZ6S21na2pJOWdCM2VQ?=
 =?utf-8?B?bnI2Vm81SitIQ0xKZGV2bHFiVU1nQm1zUFF4ZDRGOGRZZkNJbER6N3lLclUx?=
 =?utf-8?B?RzBTUTlEb2NYY0FQeU9waHJ1VklXRW96NmZKZ3ZQU0xZYUp2MmJsVCtubnRS?=
 =?utf-8?B?TXZWODNjNE9nRXR1V29RNy9uakdFbkZHZy92UjlMcDdTOUNQalJ5TEpOTU9r?=
 =?utf-8?B?b3IxWGMrakJCdXNWTzlmTis4VDVrNUxuYnBjUHNoRVczcmc4OU9rQ1BxNHNi?=
 =?utf-8?B?WXdNa0dxbTA1ZU8vbXFvVHNlQmdLc1dxNktibmZlN1ZscHpycURhVy9ocm1s?=
 =?utf-8?B?c05pQ2JiMDMrQTVGOFJYTTRkUWE4SmFkelFVRnNtTm9OdmdzS0lEaHIvdzI5?=
 =?utf-8?B?QXVlazJseUIreGlzczduTDBGMHR5Y3R2VENKQTF6OENqZEp6ZWlBMDR0Zno4?=
 =?utf-8?B?MFhyanEwQ3VsTFNGc2JGY0w1OFNlOGdJYXdDY0xmRVhLUnNlOXVyTzUvVks2?=
 =?utf-8?B?eFpaekQzY3FyRWNvRVhkQ01QcGM1aHBBV0Z3dFB6bXY4NDFzTkRQcHN4UnNL?=
 =?utf-8?B?TG56UjlyQ0xTd0tLY3NBNXBhV2RvQWpia2pnVDlSdi9UYVZVeEp1SDUySDl6?=
 =?utf-8?B?UExRaW9XbGpkSFpaVzlxeGd1VjFMTFhFWGpkaXA3SVVSMEYrdWcxUUJGd25F?=
 =?utf-8?B?QVNLS2JUQjFCN0ZmblB2QnJzcFd0VFFlR2Z3RldtSG9vU2dMbGZaY0hhWG0x?=
 =?utf-8?B?Rjgvd3ZGR2w1QkNlZGZzZm1KWll5Q3NqT2dhcGM0R1RkQno3dTBnSjQ1VkhQ?=
 =?utf-8?B?cm4xeTBKd0VxOHB1ZklhQ0s4a3YxcjdvZVhLelg1Mzk2ZFJwRVliT3hwN0JU?=
 =?utf-8?Q?SFSESQQmpfK0txuanTq48VD3dXtVNLkARtV720b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bad715c-c6ba-4216-9b58-08d93fc2ce79
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 14:40:17.0696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJ54eg4r7bN8dk894zsH2ENUaGMVNaYDMHp88iLvKR4lXJzJ9ti99zQBpILVVPI7ZdI0nEBtpBZTKKOBYI8vOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 01.07.2021 16:09, Anthony PERARD wrote:
> Fixes: e321576f4047 ("xen/build: start using if_changed")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


