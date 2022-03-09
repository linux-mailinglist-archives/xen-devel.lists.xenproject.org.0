Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595AE4D2FA4
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 14:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287841.488082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvyT-0002Lr-2T; Wed, 09 Mar 2022 13:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287841.488082; Wed, 09 Mar 2022 13:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRvyS-0002K1-VX; Wed, 09 Mar 2022 13:03:28 +0000
Received: by outflank-mailman (input) for mailman id 287841;
 Wed, 09 Mar 2022 13:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRvyS-0002Jt-1r
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 13:03:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f20de09-9fa9-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 14:03:27 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-LjZmMdUkND-yU_UQwyAfJQ-1; Wed, 09 Mar 2022 14:03:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB2905.eurprd04.prod.outlook.com (2603:10a6:3:db::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 13:03:23 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 13:03:23 +0000
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
X-Inumbo-ID: 4f20de09-9fa9-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646831006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bTnYUFjMN8oXDhJmKE3Pv8nL6NANXMODzuTXiH20BCE=;
	b=EeXcmXnOpsJ2L5MJgonnH+Y4aBfC2Ytx0YA0RKm6/5vjOkg/xMgT8fsYXfav/lv5qyBRQC
	Sf5JD4G/6L5xBUUYwlfK0lAp3XDh0U898XJLo0SFRFJuWo5d+5FcsnGXOWMlgQyZhT0dfi
	UczM5GBSwPm59tzBCrFB1cbYRTvjCjk=
X-MC-Unique: LjZmMdUkND-yU_UQwyAfJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tmcbl+GoUH4UNw1/0p0BF7ZALDpqIiFTBgi8ecsB3cMIIENLoC8SEYvDaqD7yXqseO86K0XPVWaKm93+zLZreTtKGmyjYQWCKo7hMWA1gVdtWnQEL9/yRKdvIt1ApDEDnxbCsa9T+IIUxkCfeDS7wLYuoG1i9vH4z9GMNewcWByEhkIIvZuVeBGg6Nb8QbsSVFuY2JWVbWruEg+MmAWbuHbB5DAwH+lK1wCzzpzuq4jlgviL2x40x2edYQbDY/8w6lsAJDrXUpSw8TF50/2lqwuXayqRBPjxRP2JFO2ZU3R8YnUhtP7vqyDEdo5OKtHPJre+ypJcHFNF4bQQUEjIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTnYUFjMN8oXDhJmKE3Pv8nL6NANXMODzuTXiH20BCE=;
 b=BfxJZLAbaLgA0nYw4BBVf7JV009FjGZ5KGLoeHFl2/nJx6ZX+nIBObxlwZDOMZ4LlqhZrg86qmereDDcZX3QG2XwYeYA/HMTajDWKvg3zqYlLF/QhG/FFoX5fK7OFeFxtFg6nET+1oY2cllzN2oVWDQrtKF22rssC7LKUXReqT8Skb7ghWS2kw0Z7cCvN1/25VoU33DKWr3BjlKebdqPu/mNHeyMZNcpCrc7U0NE6yzbaO5Zk/O/LVFODLn+XQxRPwW8MqqTXmrszMUgcT2TOw/TtPYrVjxkWVvl1ZZH0ImP2lU48ei0eMebhQZ9jATUzxNUSILXrCfmuTb4YIQ8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5b13e54-8868-3d30-70ee-1d1daa082ec6@suse.com>
Date: Wed, 9 Mar 2022 14:03:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
 <20220309123936.16991-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220309123936.16991-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0020.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f51872a6-2c8d-4f60-69bb-08da01cd314d
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2905:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB2905050638386714DAA179A7B30A9@HE1PR0402MB2905.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KuRTezlCvwuHN+4g62IS2NIZU30qntyl9K6kb4XxgGWnhdhX/bKAqHa/3MXWy6SjJ5o8e+NcJu4zQaLPBhjOMvExfkzDDOTtBSTsDNi7vHnH/rdZrgxyB44RrmeMjQbbDA11eN/1CpjpHw4vBeqTE9ppDKj7njOTh+Kw5YwEzy17TiH2JoIwhR2e0aB+YDxQWguR6SMUpRpyH3ga6klX2l6sOTw8gq/aOksZmiRKqlNJdQIY032kxI9KGdflTIM2NdWCB7p605tR1bhHbfieYsz69Yysqo/OZ38hFf+mXlcqYSS/PPKRPD7RR3xBzJg68dLhvs/43mZqkEfyFVYrGctwac+oCc9k7gz0GEjBDv3yIQBagoWSu95ZuGHx/kp4Nawo9qkZgcmTP7+q2f58a74cXThc9soZ6T2cwKckjeBkefutACNtcJgOD9MQ3eHYo0NOLXuUi7rvGPae0xvezhqU5K1Cc+RNMZ1uLiokcVgII1NTpGSiur98xHoxZvwLgb4BTa2mhLa5Eum7h+GnpJnokdhPW4yKCH6Eiwn1S165SItqDs6XreIZRXnN6Q9knIt8Me9ZzA2SKJUotCjAk54V7xWZwJ/HAEJ9HBb1xJfSVRbrYc41ukcx6EsSg8Az5RQ4YHGd5l5Suo/Fb7HlqdAig3zzcZwrKAe/9lOGq7rWGV3wRziazyGuWA2y0JDRGCnQcZkaTc5Eo0I32zp4pXeJIEHMsvEObbuGYOClXJGRri+Lz6iyIVJToMVTxGRUPtM7WpevZqbsskNsrPdwUmN87BHEUjUEfloT+Hxq0i4gKDofIg8waCQIBGioQChTygYlvHW5pgMT2eXDtgYeq+dZ5ykrr9+hDkwpFli/63YtFC70o1ZcDhBrV/rYtolzNBSftjet7u17fy5iK7kAGTktMQvUtMUt7n0qe/rV/YVFAw+vC/bx+D2LntqcnglV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(66476007)(8676002)(2906002)(66556008)(66946007)(4326008)(8936002)(31696002)(26005)(4744005)(86362001)(186003)(36756003)(38100700002)(508600001)(6486002)(31686004)(6512007)(5660300002)(6506007)(54906003)(53546011)(316002)(6916009)(59356011)(207903002)(219803003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFdtVTk3cXROOTB4UmsxYVNwTmhYc09rZ1ByYms5dDg0aGxPSUtZUjJhMXRD?=
 =?utf-8?B?eXdKMFcvTm5NNEx5cnF3YWNVUVNWZXoyTzNxZnpRUWl1dWNIZ3FUSkJpN0Np?=
 =?utf-8?B?aDl6b28vYWRMQ2lVQmt2Ui9NTHp3TjdueU1ZMzVZY2JiUWJWTVpMSUl6YUxV?=
 =?utf-8?B?TFF2WVR5ZFFLcndCMVhzTUhIbkFvbk8zM0dVQnRuMVhMMFdUREt0NTRTeGpD?=
 =?utf-8?B?M1VreFR1SS9ZSzVkcFBkdmFOSVVQNUJzMW1iYW8ycEF6anIrLy9WQmtKUnpH?=
 =?utf-8?B?UmJVbVpDZlFRZ1lORTJGYkFzTmxZMTlrM00zajNZUnJvMDh0Q0ZPbG8zbS9y?=
 =?utf-8?B?ZnFadHJFOXQzWjhFNWZDbU95V2Q5YnZ3blVWMXpubW5FenJwdXBlTkhFZ251?=
 =?utf-8?B?UTVYOGo5ZzVUZXc4eVcraCt6UWc4YlZEUERDcVVmbVJkVUhrbXM4a0hjRFZr?=
 =?utf-8?B?ajUwQUZlZ0dFNHJEQUlDRlZDTlBvWHFkK0hpemxkZUd3U0V2bzMzVUtmTUtO?=
 =?utf-8?B?Wk1iUjZOUi9DWVRHaENBeWY5WHhGZGdDYlhaQ3lDdVlxUHV3c2F2SzA1cWZl?=
 =?utf-8?B?SnAyaXRQRlhzenhaMFh6eGJIa1BHRnZDNVNFV3p5YVZRZjhqMXVLaEErOUJL?=
 =?utf-8?B?VndkN29TdmhzMDBPUWpjc3E3aWJuM1lJS2RybnV1Rk03ektZdVdaYktrUDFQ?=
 =?utf-8?B?VEtmbVpVUXZDeGZ2MHQwZ3JVMHptN1QvaFJtWjdoeVlTVWZUeW04aW1CQ21M?=
 =?utf-8?B?R1B5TlV6YnA2Qkx3cHRpL0ZQd245UVJnSUx5aUFmNWpEOVFwMGZ1OHp6ZFVG?=
 =?utf-8?B?alpvclhBeXRZRVdOZGYrNHFqM2NmV1ZlME5CT2U1K3FMWkcwWFRYQ3Q4c0lX?=
 =?utf-8?B?aW5MZG9yTXA0WVNSa0QrWGRTT3hHcDdHV2NqRTFjYmJlRmpqR1dPK3U1Z0JQ?=
 =?utf-8?B?dXk4V1JIZW9jNXpjWUJpZ3A5ZkphMkFETXNRRGFIdzRhZEh3WDIrV2JlNHdr?=
 =?utf-8?B?YzBFSTN5ZzlJSzJhY3pyNUttcFUreC9IaHk2Q3BUdWZqWTlYZ00wOWlrMmI0?=
 =?utf-8?B?QUtnY3llYmtUcFFVZ1ptRVlFajhhUEwwcGVoRzlzR0swSkVSeVBqRW4zcCsr?=
 =?utf-8?B?TyswM2JqeWpCRy9hWTRqNlM2ZCtub0dRdGk1RVM4VnhHRHFhYlZYemlKejhY?=
 =?utf-8?B?dTZhMDZMc0lPemU5UGdBRDBBVjBOZnJkL256cXVXK0ppd2hiN3ZZY3p3bzJq?=
 =?utf-8?B?dG1Edjl1YmJGeGkzV0phRXAwRFlQUE5VdzNIUkUrZG5NSk9WSEJaaUQ2MjhP?=
 =?utf-8?B?SWhXZkFVcHZCSGhualpmSjczTkRPLzZhRFNWOHNuNW1SaCs1ZGdtN0ptWVl0?=
 =?utf-8?B?RXh0VUJtOTdBakNIWDhLTkFhTkwvU3RlN2xtbnd4dGdoVVRRSUZpOENGSEs0?=
 =?utf-8?B?S0RlYjhMZ3BnMDFmSEpFS1U1cWxMMy9yNHZ3UGhTQmd2dVFnaWduWElXQzVV?=
 =?utf-8?B?VXNNSVhjRWdpY0RZbHhTdXBOanNqSHVVcmhNOXlmcDFhbzA0cHVyUkRIMWd3?=
 =?utf-8?B?NHNOUWRvY250MGtob1dCUmQ0aVhWT09Zd0FaTENTdnIrbUp1K3JEVFhNLyt1?=
 =?utf-8?B?dFE5d0lnQmVWekh2N29PUjgwR1FFenVFK2VSYWpUUVVoMTRFS3RuTU93THNB?=
 =?utf-8?B?d3ROQ1IzWlpBenhPazYrQTBuamkzckdGN2EwcDdqejNWOEpiUGR2cHVmdWZr?=
 =?utf-8?B?UmJzeVRuc0R0Y3BKZEFKMnhYR1RCYWRqTDZxWklUVG9JK2ZFeDFmQ1VpaGl1?=
 =?utf-8?B?SHo4Umhsdk5CZWFJdUNINXp1MERUaUE1Q0tGMXRzM3lYQVdwOTh6akYrb29o?=
 =?utf-8?B?UG5tdTlQS3NrV2xNZlJ5ckJsYnJuaVNNQjV5TVBWR1N5cGo3dGl6dFc3RWNE?=
 =?utf-8?B?ZFZYT1FXbkN5THRVUlJOYURzU2NhTnBwck1zQ2M2YllBd2g2ZXJLcTlJY2sy?=
 =?utf-8?B?eStpMERWK3FYSEtqQ3M0N2NoWDVuc2U5em8yMDBUWjJXOUFYWVBlcHJHc2k3?=
 =?utf-8?B?akFZQlZTdElUeXBRQjZPUDVRaGhhWVlHcFBlT3BlNXhTWU1RaUVvSm9wOUtu?=
 =?utf-8?B?L1ozZ2FBYjdKVmpldE5lZkJsbGh2ZW1xOEVQUEpLWk9mVG1pR3RSZGVLOW1B?=
 =?utf-8?Q?ADDd9PMuEzisDxvj0zuF41Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f51872a6-2c8d-4f60-69bb-08da01cd314d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 13:03:23.4676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CO2AgnRKmT2McacBnpCn/LGdPpYECAcYlL2rTucUjl1Yfrr0F6nasviO18qRI+l9rTU8+OPf7qQsCpVDSXDqzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2905

On 09.03.2022 13:39, Andrew Cooper wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -6,6 +6,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
>  ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>  
> +### Added
> + - __ro_after_init support on x86, for marking data as immutable after boot.

I'm not sure something like this (being an implementation detail) belongs
here.

> + - Support for Xen using x86 Control Flow Enforcement technology for its own
> +   protection.  Both Shadow Stacks (ROP protection) and Indirect Branch
> +   Tracking (COP/JOP protection).

This, of course, does.

Jan


