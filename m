Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A27431A4B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 15:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212209.369996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSGP-0006EQ-J9; Mon, 18 Oct 2021 13:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212209.369996; Mon, 18 Oct 2021 13:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcSGP-0006BD-FD; Mon, 18 Oct 2021 13:01:13 +0000
Received: by outflank-mailman (input) for mailman id 212209;
 Mon, 18 Oct 2021 13:01:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcSGO-0006B7-Ip
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 13:01:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a0439f3-0e1d-4092-9c21-8954fdccec50;
 Mon, 18 Oct 2021 13:01:11 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-5IzyxzpCPOCQE1Violo-hQ-1; Mon, 18 Oct 2021 15:01:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 13:01:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 13:01:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0049.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Mon, 18 Oct 2021 13:01:07 +0000
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
X-Inumbo-ID: 7a0439f3-0e1d-4092-9c21-8954fdccec50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634562070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tq06J2k3+KFuTHISds6GwpWQGm1xmJsVhQO8laYnjas=;
	b=hk06HbVAASA42HT/6aiGzs8YCiEKWMy4mil99x09Gw1AiYEWC3wSHMHLGf6DNqcPN4kpDX
	Gk09+kYxXOj/L5slz932OvreNeTcJX4x+7XnPKTHrJDxIFeu1xM9OnyjV2wQxLPDwlDrap
	72aZ/Y3iYQtaIb0jsqmsoHjpsZQKsCQ=
X-MC-Unique: 5IzyxzpCPOCQE1Violo-hQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QsUvfZ8qBo3WfSZqAdMxebiADuPnkHCToWgluRckOPhVMoSP/8fMqm88mjJjJWJqOjH4yL8Py2gwSvY6Ea0nOJE8sgZzE1twO2hOoP/qHcnbixhq+/d36awCKuSLmF4Q1f+YxTvqe0G9FsVNOGGzKJHtDg3SM5pvEdZ7Zm61znChVPv8Z6I2sTtZfT8+c3HXZNHlgTb3BIjEKLVCS2XzffzgjbFvs6JRlLcAi/6sEd5d7HnECqLuVDWgF/m9kqR4bWI+9h9tD5wqhwwJdr6t7WiJnqG5fuTPlqeo7iOv8mSi5GyYLUDnTX4AGeLaGamBmZNaUrOoPyk6l5JRPf9L3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tq06J2k3+KFuTHISds6GwpWQGm1xmJsVhQO8laYnjas=;
 b=GubqrYWaK0oxw6QIxkiToEE9cvcmKrZiFlBRVQ+ya8hmQfoMRH9v8VOQkJCuTlDVAmYHVeV6RDJ8CZaQ1SQbdL4dDkmZ/vojG9sIOzFYYBN0ArJ6Fyk9NeADwaCKNAsVydFzWLbht8TxV38tqT9yYaISaVUEf+F7esF8vnidl6843IqpUycVLEHsmBHQUMwYHohW91SIkv/wx3T26Tu/MuaGYW+oaZiSqocqXj9Kez8s0RkZbu4hRjrfA6RDuLi/QLhpyzYzC50yntqxcyw3xCgUEzm33BGZ2ASUyIqLvbiLqPEB4e5cLFNWoZggqQEAenUVpKtVH2JRSVcR1edT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 07/12] xen: use generated prototypes for hypercall
 handlers
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-8-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc30a8a8-9c05-6886-c2cb-fafb05b16573@suse.com>
Date: Mon, 18 Oct 2021 15:01:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211015125152.25198-8-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0049.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a39a6fa3-9e5d-4501-70e6-08d992375a14
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6480C348AD8D12C515138FC8B3BC9@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ru7+mYUh1H0UgXvcXA6O3spHpSvc5DPOceCm8uHcFDn1cwGpQGbitBGj2Mu3GC/+ztZnB0/LrM5sbRkOHYZcW97ig/BTEdYCoqtvYg0cTnPYtjzvjbq1UDNqB173MEWt8hqH1wBSNwTRiLoWUyP41qHXDRJaOOYeOJFCRYxZNbQtWvw0Y6aj1M8HpE/mhgM0PQjyeed/SV/SbA0K2aZafb96tBqCmfqCoMvHS8Fv979NVvOR8ByVmwBfpJmEovY2kNizaDinXQuaGCcA7hOc0OM7vnJrISZxxI9oKE8YIb/zUNZrK4G/GPdKb4/8Y3pNgNgwercxtBtbh9o+4dzNLTCQmCX5F7hsA928Ct8TAq8DlsaEg0Vz8ujVoyreSIXZQxRNOLVM/beWkbBUU2GpBZ9BCRfctcSuJGrWiWZfsz8Gwg8U3sz6bKZg2HRrHuNdF1WLgkSEuemYcZUJvZQFNLvAa4V9sjrlQO7yIg6BQ7FXk86wrr6tm5aMxtWPI/Mq0asPLHUdPqOskuu4oA7w/Cip1FDHdlB4hPHUdj3Llc7vfDMHrlmX+TUcjCmaN8G6LS1zD+Z3j6Yg/TTu9RCdR17riopneY3up38eJt++EqaBl7Lswlz+dp1I1NhVkSdBzoVkM2dDQxvZFIghFa05oVHgEB6QtTXK/urP0oGq1AJThh+fKn0fshoAKBrgeClpuPhriD85Nhe+CxWzmN0WIwszE6s4bQ9FtZNvjoLxoUp+RL19RJHorAExbJ0RWmvf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(316002)(16576012)(37006003)(54906003)(186003)(8936002)(2616005)(6636002)(4744005)(36756003)(31696002)(31686004)(26005)(86362001)(2906002)(66946007)(4326008)(53546011)(5660300002)(8676002)(66556008)(66476007)(38100700002)(6486002)(508600001)(6862004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEI5KzJtTzFzQmpPb3JrT3hEQVBVRHYvbUNhbTJ3NFQ3dytCaFdiZzRUUlB0?=
 =?utf-8?B?RjI0c0tQbzFvS0tZTlJ4TnVIcVlNQXpjd1FJVjF2Y2xSWjh1NElWdkczTVZ6?=
 =?utf-8?B?dGVOc05ndTI3VFZ1T3o5ZkRjR2JmZU9HN3dhRjBlQ05MMUlkeVB5NjVxNHZo?=
 =?utf-8?B?elIrWlgzeWE1Ykdra0lxZk5aOE9iM0VmT20zeTI5YkZCSEgvTmUzYkxiQldL?=
 =?utf-8?B?U0RnS2Q3RmVuYWNQUG9XaGRoVDJjZEoyaVVqeTVrOW9CNU5oY3FoVVp1cCtp?=
 =?utf-8?B?YUF4Qk5TRGwvUlRwMGlmOFA3YzcvRWxOK01YNE5rWHNWYkwvK214cllzTHZC?=
 =?utf-8?B?MjJJRUo2bVpKMzJrSUswZUNIL0M0cGovUHR2YlBqa2piRUt6R0dnTDMyOFdj?=
 =?utf-8?B?VWRWcllQQnIxY2xWMHFFdzJKTWViNkt6UitJRjkyV2hGMjBDb1V0VGd5UTZr?=
 =?utf-8?B?ZlE1MFJTVFBza09qL1dxTEhqV0JWcGVOWFduaFl4Tm5Ka2RpRXNrcENpQWRP?=
 =?utf-8?B?aUVDczVLVWd0T2d2VG5JSG10eHAwdVBzTTZBRERsTGdERXk5aTRodUJWV1Fv?=
 =?utf-8?B?RkNra1Qxc0NQVFI0TXErMW0zV2JkNG5XVXBMWGhBRDJ0YzJOZkNPOGpWRzBk?=
 =?utf-8?B?Y01NNThGZ1lMdy92amRCek9waEN2OVlBMWxDREMramkydVo2OWpsRmJUNThG?=
 =?utf-8?B?NXdnQlRHbFZEMlhLSnUzTHlvYkljYnM4aUVqc1R2UXlUd3owQkJNUlBGWDND?=
 =?utf-8?B?OUpWcmRjOW1KUURNQW5iUVNGM0Y4MHhsb2xKTVhJbThPcEFVV0tIQ3FheXM0?=
 =?utf-8?B?cTRibENpQldoV0d3Y1c2bmJQYmVPU2JtdFFaSUptM3NwNVpvK0NKdXVhdmJa?=
 =?utf-8?B?UHpyOUlMRklpZXVDZDdCbElkYnpQTTdCUkRvc3R5dElvQy8rR21ML3FTUzdB?=
 =?utf-8?B?dWQ1YVVWRjdYV0oxN0ZjMWtrdFBsSCtacEVRemMzUEVaeG1SM3pNaUtGaEdo?=
 =?utf-8?B?ZUc0d2p5V1RiazVydEN1M2hhZU1Mc0l5anRzVnRWMGhKR2kzQnlSVkJGRVRD?=
 =?utf-8?B?aldtb3lkVmhjOVlDVGd5UUViNmdoRmVWZFdUN1ZvbDd5blZobG5GSzFWeEJK?=
 =?utf-8?B?SC9CWDQzSGNJZ1p1ZW4weWRjOER2WlRkYmNzNm5mRUpxVERVM2FnWDJ4QitQ?=
 =?utf-8?B?VHFoQkQ1aURQNWVpZG4wcUZ3VGNOOXZJQkdZbnROdnUxelBLZEVIcjdWeDlv?=
 =?utf-8?B?UVdLOSs3emFiOHI4Y0hDcm16VEphYWZNclN6bGVJY0s1WWVkQnI5bVVodzQ3?=
 =?utf-8?B?Z0srbkpyaGFiTjVBdUFNaWFPTGs2OGJoVWtlOVk0eWdtNkc1aHBuTXZMT2Nn?=
 =?utf-8?B?L3JOcC8rZlh6T1ZlOFp4cERGRk9MemszSWt2a0FoVFdMY0VwR0xkREZ2bmk3?=
 =?utf-8?B?QzEwUkEvbm1COVg1cHpBSDNoZHRsbjBLTDZxd2t5TFFrc2QrSmF1UHhGeUdJ?=
 =?utf-8?B?ZnNIK3hVd0NyUkgxckpZTjNGdStxUE42VWp1SGpWR0VXc094VXdKM1FIc3FE?=
 =?utf-8?B?NlI3cmVMbWE1bG1hVHBVVG5rUXUzZjg0ZlozSUcvVjFaOEFwc0NoRUNtVWov?=
 =?utf-8?B?VS9OaElPZFpuR2xnWVN2Y2ZaZXEwVjhhQlNCK3lNeGJFWFVuYkFia2FnYzJn?=
 =?utf-8?B?MmdUek9YcWZQR1AyblphVE5YV0VuMnFlL1kwdEswVGFxTXJQQnpFaDVzTFlY?=
 =?utf-8?Q?gcmWtWUa3s5SG90mSgfXuiKHSmeiOsLwbAs6+tO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a39a6fa3-9e5d-4501-70e6-08d992375a14
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 13:01:08.3560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fv2O5TzcJdAaLnRwnaNyoWLj6HAI34XFVsfwXDvf8woJ265yqw2akQWP49IbmWd57j3kPgWJZGGStoJkvryVpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 15.10.2021 14:51, Juergen Gross wrote:
> Remove the hypercall handler's prototypes in the related header files
> and use the generated ones instead.
> 
> Some handlers having been static before need to be made globally
> visible.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


