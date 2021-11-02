Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1919544304B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 15:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220296.381497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuhM-0005li-9G; Tue, 02 Nov 2021 14:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220296.381497; Tue, 02 Nov 2021 14:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhuhM-0005ji-6C; Tue, 02 Nov 2021 14:23:36 +0000
Received: by outflank-mailman (input) for mailman id 220296;
 Tue, 02 Nov 2021 14:23:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhuhL-0005jc-8U
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 14:23:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa87ae4c-3120-4937-875d-6fab1aaf7989;
 Tue, 02 Nov 2021 14:23:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-5fAZmz_OMxuI7VGiwn9bUQ-1; Tue, 02 Nov 2021 15:23:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5742.eurprd04.prod.outlook.com (2603:10a6:803:e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 14:23:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 14:23:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR0301CA0014.eurprd03.prod.outlook.com (2603:10a6:20b:468::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 14:23:29 +0000
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
X-Inumbo-ID: aa87ae4c-3120-4937-875d-6fab1aaf7989
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635863013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJng58TG3BKvwIEUR8OViWD7UL6AEv0nwt8jLHHik0E=;
	b=GB+ru6gCnAPgm+IZx8av7kwEZH1PqsqzyGxTJ6dRahT46mPZpGKzF9YHly77fiNDHrltJV
	rre0J9Qsa1DbKJSZodAIfcpmyR++sBukvTjkp/i08WTOEJ8jZR3OowtEyf8PHPnaNqUg87
	CG7uOn6vaIAw7aPIvZ5NViYTsf5hvcU=
X-MC-Unique: 5fAZmz_OMxuI7VGiwn9bUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASgwDXxWSohfZRoscCcnY9AMrTuhVQex0FkTOckNao8J2ztDu12l1Dso1IA2D2kQtyU9d14mirDMQEuA0nnu0RIJiimlD+SAn0XaouvOH0re/XQU/u4/EAxNbkcYihbhA196jdU1dImo2E9sldwBnn410cR2BahVqR26pjzji9VmX0D2jV0r1347/RNSL6wmwcZ5qZZMibxOzbGDDuntybJSb8HezQy13kLyJ9L3l6BcFi/I2RCj+bNTiXEN3NgE122n2vkltG+FAnBOpDGsa3Mo97wEo08pqKJfscK1SqZEVcom2/MF0I9UdEzwkTCcOkI9qf2yMTL8Luxcduu+Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJng58TG3BKvwIEUR8OViWD7UL6AEv0nwt8jLHHik0E=;
 b=IlZqjRotabS7ilyzqv3WWfh+kh8gqLRxOjxgNlxPJ9r9643V7kyKXeVo3CTuqTw8D4Q/4ccA8jzPMB69YF4iw38WvU/InX/7V72pQmnXp/ts/MED9sPaBKAmC0GhtNeKqX2utw9SOZsQVE1fpX9Xbi9NAU96r2ebom5+0s7Lvspw8O3CHYXOcZq22gIJwsoTiejSAP/Z3TaGVoBExG+E55pI1lQ77CXxLilV1N/7Ov3c4Rnwc4Rb04IsdwRpxQFbcD68CTE9AYTitFKoxnJ8wdEioV1/E8U2sWdKoZC7y2bZcRsKCcw5Dczw/c1kBq91ce5bx9pDJraDvYMoFy5ruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f63b553-f825-a501-cf91-1f544d7cd0e8@suse.com>
Date: Tue, 2 Nov 2021 15:23:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/7] xen: implement byteswap.h
Content-Language: en-US
To: Lin Liu <lin.liu@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1634897942.git.lin.liu@citrix.com>
 <89afdafa9020ab77b9d662bd5c8f7b2d31e53c5c.1634897942.git.lin.liu@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <89afdafa9020ab77b9d662bd5c8f7b2d31e53c5c.1634897942.git.lin.liu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0014.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 497e743d-9a4f-4272-d2b9-08d99e0c581a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5742:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5742AF89BA9A2FE5BD90FFCDB38B9@VI1PR04MB5742.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aSv9ybFnRl9NXRPhN/35Y7iUq9bsTvXorZDdwy3/1iWaEg29Mj0afOjJR26phqD1nn58NXCkAv3cIDQfzt4uKmlUWM672mUq4cFiZjVTkMpX2ShEUK5W5ogC53cpiLLndXdyUU+RGMUl7SrP9+zTBaiwI+aDMF3UiWhzrL48usu4mX6KmAubts0FBkC9NPTY/gw54CSv8PHtvW0YlDj9o+vcyfD/NBre5Da0HbvYtVpYeGrE1lKR4RyF7q0X915MKKUb7IXtaikMLBNS8UPu1gTspFDzBrRHCkU1O0pMvThl/a7C9GEp4EdWK0xHvNhLb6yFonxcyyjFdJr8v7NP1aa34H73U+aVxczCXlxMbusGE8HbNIyNn4AyW1aRLZlC+xp4YUu70QD+Wgbn8wLvysHbZ5g36iQAgsk5eoJ/LsYspQfeQaLz0J09WCaLpwFTYGqAPyEnoJTJebwF1NdnSauuLbHOEutHW+NI+5iDI4iKDUYfbq5EyU5uREoMyVPOUDToI+HCt0hhxjbEQkD4p2hmRqIaX2KjsGvYkteoHrpQ342pYK6OHV6uIvzmntQwUvArT4HYfkxD9YvlN5Z4QSl2m2EgjbKeBbll9YrOCGHmG2pjYD9KiY1+FnJmkjmjy1oVp0d4oCv/FuXbSfXjWtdVAQWWauy1j3eFNkVe8E1Ae9kCFCrkfQ8xKz1ilAjU10j7NLoa4SB7l6NuLJOo6PNyi8aSPdtBDAS4M2veXeUfpt+lILjEFX46G3kfsSpY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(66556008)(66476007)(2616005)(956004)(31696002)(54906003)(53546011)(38100700002)(8676002)(6916009)(31686004)(66946007)(16576012)(26005)(5660300002)(86362001)(4326008)(2906002)(6486002)(508600001)(8936002)(36756003)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mmk1TU0zK2ZiQUoyMFlGWVRtckp0eURteUpLTFF5ZGNBNzgySEV0bFpqNVNY?=
 =?utf-8?B?Z2l2SGVtNnhsUnJHMGVEcC91SlFpOTFzaWNBc0ZmK2ZIdFhlZ09WS2kxeFhF?=
 =?utf-8?B?bTc4VE14UG9zNXpFcThWaDdUQTNSOGJET2NlMHloNG1iY2FqdkdpOFBFQXE3?=
 =?utf-8?B?L1JJZ3RJVURJNEwzWEpxV0twUGpwc0p1UzVlelNDa3ZOd0JtUFdwbEdXM1B4?=
 =?utf-8?B?SVNWeUQxcFRkMUQzUVRML09Mb1dmQitibjJXUVllL09zZzVjYWtLejltUjFV?=
 =?utf-8?B?Y3IvV0lqbXY0NUJrVzA2N2dHOGxjVUFYaU5GMVVJQk1FMUpocEJDdmJ6NUE3?=
 =?utf-8?B?YjA5MDA4ZGVCY3NwUTBOU21vM3ZKWUU5bWtFanRVbVk0NEJwSUFxenpkYXgy?=
 =?utf-8?B?THF2OEdRejd2U1U5cjlpZDRwZ3FFS0o1L0VBTTEzNDRpOW8xbkFkQ29SLzFm?=
 =?utf-8?B?akU0ZnJZM0psMzZGRFd6YWRRbnR4RE9nekhPMkZlUTZuRjZRVGw1cnZQMW1h?=
 =?utf-8?B?VEtqellUWkl3SCtOYkhoTzNhY3hWNDFBazRZQWVDTFgzNmhLMVBZV2ZEV0c5?=
 =?utf-8?B?d0tPQVNmWEoxL0tEQ0xPMVJJMC9CNG5LK3l4SjZvQVE2aHBUSWlBalArY3FM?=
 =?utf-8?B?ZDg2TGJLSXU3RytHUDZaODRwQVpqMmlwL1BIc1crMVdaVnh5QVE0S1pBRFlN?=
 =?utf-8?B?eG1MSGRwNmM4T213WWI1Mk9UWUIwQUNLTmM2OHFoVWI3eVJlY3c1VXY5Qjll?=
 =?utf-8?B?a3hEa3lQbWNYUnloQU91MU1SaWR2aDBsVk5hdytZa1VTL1lTbzFkWkl5Y1BI?=
 =?utf-8?B?a21ObHNEODZ3eHAwVkxuNEhTQXAxNi9HS0dwQktMK2hZNCtHMEJpcGdnYUc3?=
 =?utf-8?B?cjFyWE5sN3ZtQkpTdDVFUXJtVHROWUw2aEZDNExBTkZIOGMxZXF2N3EyNVFr?=
 =?utf-8?B?bEkyTXQwZjlKZXVQekJUUXNEN1g3VndXY0NEdXZlY3NnTUxsWFJPRFN1TWlR?=
 =?utf-8?B?MWR0MHJrdmtGcllzTmx0eUI0K1pxUE15QzJyV2JMSXdHNkRtY0NhamFRYlJP?=
 =?utf-8?B?UE5KNDBvYWxZVjJYYmU3M2RDRGZldDVNN1QvenV6cVN0ZzFyM1JFRnFaQUFK?=
 =?utf-8?B?Tm9xM3V4WnhLbklpbTY0cXViYlpGaW9KejI2ODJlcVBtZVBOb292Q0s0MlIz?=
 =?utf-8?B?Mm5WcmM4blU0SmtqbitRc21pSG5tUzMzM0s1UTFidE5sR25ySXpTRkFOOStW?=
 =?utf-8?B?ZkxlOUttSG9NdDUxempDbXM2Y1I3TlRNeEIyZi9kMVB4VmJQS25BSndqQmJy?=
 =?utf-8?B?dTlRUHlWMktVTnZkL1RUK0lRaGxZMzk0eU5oN1NyT0ZNQzFoOGh6bU9MVmUz?=
 =?utf-8?B?ODM3WGMwRHRCeGZkTUdOOVBuM1pEWlMxK3cyUjI0YzRzWkcxaTVTRmNRa0hQ?=
 =?utf-8?B?bkRvcEIrS3p0ZHBIMXVDS0YxRGFyQnJIdXV0RVNJdVpSMkk0ankrdzBaVWhv?=
 =?utf-8?B?UFE4eGhVc0hmQWRISkVLOXpEc2wzaDFVOWYyOWdDYzJFcndZb0Y5SHhtb3hR?=
 =?utf-8?B?WGFOdDdtZ25PQzlQc1M3V2ZTYlV0QS9RZGhRSW1nUWEyVlhEYkppdlcrd0o2?=
 =?utf-8?B?OHdoQ0VwSE14UmZJZ0U5OG9mazgvYU4wdVhNSkxmNWhsTFNyQk8xZ3hjTFVV?=
 =?utf-8?B?bEhzYXE1QTU5blpiODRwTUdaZEpYT0Y0MlYzcFdFQXBVclRnQlNpQjVSalJU?=
 =?utf-8?B?SGl2S0RkVGExbThnWG5Xa3RIT3A1cnFqNzcySTJYYjh5anVVT1UrSktlZDNC?=
 =?utf-8?B?SmYzb0JvUWN2VWtBQmJqMFRTR3g2VnZTaDgyRG5mVWI4cGRQaXFlWndJV3By?=
 =?utf-8?B?VmQrUTNjczNTWEVVcDJrc01LcHNTY3dhYXo1VE0xNE5RWkNPYUUrOWdXcGFo?=
 =?utf-8?B?YldDaWQ5ZENuNGsyNG4raEJ4RWtSUG5wQWU0R1ZOc3FzeG4rc3huUzZGMjZz?=
 =?utf-8?B?RTlTTWNkQjZuK2p0b3o1OGp1N3ZtcWZibWFYSHRpN2VNT3orVHFyQTBIWVRE?=
 =?utf-8?B?ZkxhcXQ1YjkzWjlUNXZRUExuRkVwQ2RUWkJrZDB1OUNWS2U5Z2FTK1BiOENE?=
 =?utf-8?B?ak9RdUp5RlFqdVZWaldlR3pNbEpDK2poSDBYRTdNQm5DVGE0ZFRRYXhFb0pv?=
 =?utf-8?Q?0mkmPizufaNCLFMdU2WKwU0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497e743d-9a4f-4272-d2b9-08d99e0c581a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 14:23:30.5494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VE6eWSQU5eLBvHMbD8bEkwFvfsXdEwRxuOLdUaOD2iyTVunqiaOFQscm7pxIxa/1+mlv+UJ7QQI5QNYTbZsZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5742

On 22.10.2021 12:47, Lin Liu wrote:
> --- /dev/null
> +++ b/xen/include/xen/byteswap.h
> @@ -0,0 +1,93 @@
> +#ifndef _BYTESWAP_H
> +#define _BYTESWAP_H
> +
> +#include <xen/types.h>
> +
> +#if !__has_builtin(__builtin_bswap16)
> +static always_inline uint16_t __builtin_bswap16(uint16_t val)
> +{
> +    return ((val & 0x00FF) << 8) | ((val & 0xFF00) >> 8);
> +}
> +#endif
> +
> +#if !__has_builtin(__builtin_bswap32)
> +static always_inline uint32_t __builtin_bswap32(uint32_t val)
> +{
> +    return ((val & 0x000000FF) << 24) |
> +           ((val & 0x0000FF00) <<  8) |
> +           ((val & 0x00FF0000) >>  8) |
> +           ((val & 0xFF000000) >> 24);
> +}
> +#endif
> +
> +#if !__has_builtin(__builtin_bswap64)
> +static always_inline uint64_t __builtin_bswap64(uint64_t val)
> +{
> +    return ((val & 0x00000000000000FF) << 56) |
> +           ((val & 0x000000000000FF00) << 40) |
> +           ((val & 0x0000000000FF0000) << 24) |
> +           ((val & 0x00000000FF000000) <<  8) |
> +           ((val & 0x000000FF00000000) >>  8) |
> +           ((val & 0x0000FF0000000000) >> 24) |
> +           ((val & 0x00FF000000000000) >> 40) |
> +           ((val & 0xFF00000000000000) >> 56);
> +}
> +#endif
> +
> +#define bswap16(x) __builtin_bswap16(x)
> +#define bswap32(x) __builtin_bswap32(x)
> +#define bswap64(x) __builtin_bswap64(x)
> +
> +#define bswap_ul(x) bswap##BITS_PER_LONG(x)

I don't see how this is supposed to work - the compiler isn't going to
expand BITS_PER_LONG before the token concatenation. You'll need helper
macros to achieve that. Linux has __PASTE(); we may want to "steal" that
(albeit preferably without any leading underscores).

> +#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__

While you've worked towards abstracting older vs newer compiler
versions, I'm afraid these constants aren't available in gcc 4.1 yet.
They look to have appeared in 4.6.

> +#  ifndef __LITTLE_ENDIAN
> +#    define __LITTLE_ENDIAN 1234
> +#  endif
> +
> +#  ifndef __LITTLE_ENDIAN_BITFIELD
> +#    define __LITTLE_ENDIAN_BITFIELD
> +#  endif

These are definitions which I don't think belong into a header of this
name. They're imo well placed in byteorder/*.h.

Jan


