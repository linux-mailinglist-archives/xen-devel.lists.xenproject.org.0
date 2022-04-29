Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0F851490C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 14:19:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317262.536514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkPao-00021D-L4; Fri, 29 Apr 2022 12:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317262.536514; Fri, 29 Apr 2022 12:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkPao-0001yF-HE; Fri, 29 Apr 2022 12:19:26 +0000
Received: by outflank-mailman (input) for mailman id 317262;
 Fri, 29 Apr 2022 12:19:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkPan-0001y7-0j
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 12:19:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ae26ff5-c7b6-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 14:19:24 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-3-QtCnAODaNzyERZOU-Cw8sQ-1; Fri, 29 Apr 2022 14:19:15 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VE1PR04MB7408.eurprd04.prod.outlook.com (2603:10a6:800:1b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 29 Apr
 2022 12:19:14 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 12:19:14 +0000
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
X-Inumbo-ID: 9ae26ff5-c7b6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651234763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tGRg8avUf/UV8NaH7tx6SmJT/3Uy0XEx4P6G94YfJI=;
	b=gWNLZVHI48KYwZwxHHvJRC/8f3HeX/3qrCaw9aNFEPyt7HB7PRJx6H7+1F7E/VmSygkibT
	8wevD9zxgj+skHoWEIDg9xyUHUuLStvmbSDpxq6xKvUEvqfk5ugVewN+b+MSZkVOHQWMbo
	ISgOo+aFQzoErPCb9u9D8CVClfqNvdU=
X-MC-Unique: QtCnAODaNzyERZOU-Cw8sQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHfZ+Kpsbx7sVs0Hs0GWsOPMe18TNmbQf7jI5n42hMHVrzc18KQvoluQ0kbrmixjwx5glC43o78LTzx5OyN9vw9TSZg1rzoH4+u0F9i+fPnz66LAYwhDlFAOTNmZ6mudHLVHwZOGFBiMFJzWgXU1+xmI1/+meZ4lXO5rZ9gwqe9CxTOhDPxCm4yGPUhSKi+6Ygm7KmZWaNdIEMjTUVPJ/0RlBo4m4/417eY+0hDCVDmknmEAmHdp2zv4VexhuyPzlivY4lgtkQD7d/5UBZOHXl/NkrMbRbJafgKDFd1Iw7U24brUGGqYScN5LQ+1YFT9wHmDdWg97maT+SrxIJFJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMJl31QMUmWvI3ZVEWFpCoZWm8sYiGkGGdC+ZWzrNog=;
 b=YJpveBf6UHkLhgJbwSa/DV/ve4B1AFlAx82ghcldKKTi+cXJjaIiGlllDinPCRG5bP46CcQdoG2gyRFODjc8BqYZZ7bF6oe69JovNH43BXaArHZESyEQuh3droL1iW3qM7WG3dvGYKCRmv4CcYWQdWEKZEseOVMHugKCAUObQZ4a7lllrBbcPLqaXLt1A4t6X9dcGaNppN72zbNythnV6ImIS0sklJ/2D/FvN64GaUqAWRtuIuJp8I+8ReE+x/+GPiDShjb6X/1WuzZHkh3rikpaj8i2+GxPY++7DjMUJkQXhRpu2vunZ4e3Jxh80pcLNrBjvRBih6z3XBtmz7Jhow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d42cb692-a749-5d6b-4a37-fb03898c499f@suse.com>
Date: Fri, 29 Apr 2022 14:19:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] x86/cet: Support cet=<bool> on the command line
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220428085209.15327-1-andrew.cooper3@citrix.com>
 <d23258dc-3837-ebe4-26b1-75b0f32477e9@suse.com>
 <26f1d8e3-597d-31a7-00bc-f17efeeb3e55@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <26f1d8e3-597d-31a7-00bc-f17efeeb3e55@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe09d26a-1b95-425b-4f67-08da29da794e
X-MS-TrafficTypeDiagnostic: VE1PR04MB7408:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7408FD60CCC737EAE6A7181BB3FC9@VE1PR04MB7408.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6UG0xg7BBX/49Apv7BLsJJMpa+zogfRwfMqsECIGIfVkPUx0hdTPnSl1lb0XxYrzjxv9zKoh9fbHi8VcKS1Q0hVaNyZZRrCOKuAx1/ELyX+Wv9vozr96WPDIfWP2fTJkilLmqibe4fsofb5W6Cc/FoTIYQlbENmZQ5+woCCMScO/geFqhJcuJ8FIrJcs2hCP1hKMDBumTS0AOOvO0ZRq7l3p0anOg/fJLoDq/sccCFmThrxNdA5LR9JitsaS+FR2u3yLDH7HAvWsnbmDfbL/x90gql2Wz1kE82LUgdSpQaFimlFtdCbw4q2Mbbkvmi4HKoDsgT5RXja1Q8Wwxu4NMJVHTjXbsHB3FOGuigmodoeFNDlCqY+VkKzKRgGdJB/hsVu42kT9C2ILBBrR6XhBIQKCRZaB8mzNh3QgRkhSq03Zj9A1dAKmd/tbWuJR3P3MKgc4zjmzMs0qyI06IpOS7rK7q+18iPcXxWmGmd2zkDzFTpIIQxn60ptP9Qm+3ruUfDRunDgzWYn63TIZ7Z3EhlpFtjEb3EsS56DSmh4G4y4lsTfYUtpJBWBKp5n8EyNVoBBPTx5wU0y/AX2ZUgwnEGGN9slylwzYdCHYJhtPLBT05MpGb9eeQvs6sZIt2X9eD5h9jGgw1jx0/Q4azexWzuAF3Vd3ERR7fFi2En3BcxqnENij0kTfgFgHe3LSJ+zQOBH8ARhBxB3pnWXNqnsT4Akm3Qj49WZJ7sUAQHrjJOZj0cSVQ+x2r3gf4NKPXgKY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(26005)(316002)(31686004)(6512007)(2616005)(6486002)(5660300002)(508600001)(4326008)(54906003)(6916009)(38100700002)(8936002)(6506007)(36756003)(53546011)(186003)(31696002)(83380400001)(66476007)(8676002)(66946007)(66556008)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GWCYG1LRknJ5dmWIwdU9mA4jxW9bSJkzqVLdKNiy5dfhe62IWX9HkX1KxZo7?=
 =?us-ascii?Q?bbDUNlJ/4AkpZVfSzMkclVcOzkVCrStv0kPH+IcavfHEsGHD6GanBnICZvzf?=
 =?us-ascii?Q?EPUFxvJiQgMj5LToo/YjA8bdqNKM4xZusdFKc33pmfE2FUGCVDo4HnL1vtaM?=
 =?us-ascii?Q?dFKk0Acv4sTnZTJ773r8grm66dZ3cnfwELwrY/BRIt0kLP88pOC4VXpJ16S0?=
 =?us-ascii?Q?J8Mln0EL/g4JI3fzD68BCS6Wwc+aZWkGl/r8ykkzEWGYZhsnObtNFI3x53Fx?=
 =?us-ascii?Q?0Ebl0TYyi3FkU3CqI/l89HVRNulXzELBYBFO/TXxcz+1smuO9jGqzLIIIYRn?=
 =?us-ascii?Q?yFhCAtsE6DOEqFYo5u9JHz05pKVStjoI2B3Yvr7KzRt5Alxvq8QfINOqHDDx?=
 =?us-ascii?Q?8fLWrZShAX30CRQK+UQyh7TkYl0chaoQIQ46W0VfPUB3tqMst/mqdMGnUabD?=
 =?us-ascii?Q?LQUKluILFdtj4/02ef04LjqDNPYk2u5S5Tjf1Cm29ID6pDqcvDPt4w+9dATN?=
 =?us-ascii?Q?WJixKyiyqJxVfMSWRlJ+J6TcBE3QMrycA4oiGZa5D9ERl1HsbENDBXW2mLy6?=
 =?us-ascii?Q?jw14JUwlFC6W3PSKo0OLjZJDiqM57XIVshl8ZQeGnW5tC+6Yin8vOb3qWzlg?=
 =?us-ascii?Q?x9Pv4a8hy/LIZWzpA72MhyIhpwba5btl1qOoJo60xDrc+gQjCT9z8im8qXKu?=
 =?us-ascii?Q?+aOWvYnzLaD1sdUt6kWA9+ggSxTeUyr7i00kUjZSCxjxsrKmGAg+b6WehAp1?=
 =?us-ascii?Q?4jzlNB1p+qIKj0ujO43FYlS8RpObIJJ8OQD6KUfFfCyO+Fqn7OsRGI93HZtA?=
 =?us-ascii?Q?EpBvmyX08T2oxYURMKLf0wc+MDSQ+7w23NQtMQUzHsGWkGL2ROXPnYkYOVAN?=
 =?us-ascii?Q?5EH86k9sfFfdu/YYblf+cPmrPT8O/n5gaYtncsj2mLqP3HcuxjxU7pZ6xMt6?=
 =?us-ascii?Q?VTIVK3LibPVTwLN0a3BWgYR9VPIPda1C4rcmurwctLKyDiFDrquoPX5ub0eM?=
 =?us-ascii?Q?ExPHH08nD1rrKBFTpu7/XU0BNqseHKgU+PVdxP1Ap50dG/EnsrtAj+gbtvIB?=
 =?us-ascii?Q?RhrJTTOG8s/RpaI0cwD0+icba5ySsZL706faPay+NxnpzK4rf19LpTKl7RzF?=
 =?us-ascii?Q?0PdjFPezTUXnV2+1s7yjVYUKew82+iCRNCeS6iEKDPZbSO+FK+4M9GOs15io?=
 =?us-ascii?Q?SlSOQtYEXAdubNE4oqK9+198jsEBgyj2cFyPdYMUFmC3K+Tn+LUzV7OV8L4l?=
 =?us-ascii?Q?hPWdLiOOCS9CUlGnno88aUwuJAdWKl4qr4iVbFi1gmPTTYA2Ty7y+6KOtXyM?=
 =?us-ascii?Q?ykzyjVs79OFYjbEKTCl7DAHyklZlK83Tm7EwBwPXbLcBLVEc5j2JIIR5GHaF?=
 =?us-ascii?Q?xaCjnrI9RxIvpDPfCTJ6bo90oFQasIPPOVbRFeC1wEMmj79Zj6iRemcZJ2wX?=
 =?us-ascii?Q?T9K6hqDB2xp25jLcGMcQIXBB9JclUwVbUxYosG7dlkimbT54YqcFvrfVbkwu?=
 =?us-ascii?Q?XFYML5Cu6oUJkCd4ReqSI3SVtEz7oH9eycuH7eV6K4JoQeLvo7UKsm8v7ufQ?=
 =?us-ascii?Q?qhXmW8ARv/bSFJpUg9qF5jkh2pKhY4u7NupR9vH3VSUsvb9JdE8n3ZlcjrZY?=
 =?us-ascii?Q?po7/1fbJoEvpF0aUWNnYJT8VT3abHmWC3vBoOoC8aSl5jDHprVQVKaI35owj?=
 =?us-ascii?Q?huINtuTnUl9HPyT4h6FyFcCo5RJXqaEHKNaYVW+eD/0+X6LSrCcMFrg8+0W9?=
 =?us-ascii?Q?bE34ebEhAQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe09d26a-1b95-425b-4f67-08da29da794e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 12:19:14.1912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJwm34636XlCYgoDkXArQ9RgtG9FtBBNH9N+xLDEhGt3RV5qH1WGsLjf6QyGF607B3gjalkuITBWyIWGrbSquQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7408

On 29.04.2022 12:13, Andrew Cooper wrote:
> On 28/04/2022 11:13, Jan Beulich wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -117,7 +117,20 @@ static int __init cf_check parse_cet(const char *s=
)
>>>          if ( !ss )
>>>              ss =3D strchr(s, '\0');
>>> =20
>>> -        if ( (val =3D parse_boolean("shstk", s, ss)) >=3D 0 )
>>> +        if ( (val =3D parse_bool(s, ss)) >=3D 0 )
>>> +        {
>>> +#ifdef CONFIG_XEN_SHSTK
>>> +            opt_xen_shstk =3D val;
>>> +#else
>>> +            no_config_param("XEN_SHSTK", "cet", s, ss);
>>> +#endif
>>> +#ifdef CONFIG_XEN_IBT
>>> +            opt_xen_ibt =3D val;
>>> +#else
>>> +            no_config_param("XEN_IBT", "cet", s, ss);
>>> +#endif
>> There shouldn't be two invocations of no_config_param() here; imo if
>> either CONFIG_* is defined, use of the option shouldn't produce any
>> warning at all.
>=20
> It's this, or:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( (val =3D parse_bool(s, ss=
)) >=3D 0 )
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> #if !defined(CONFIG_XEN_SHSTK) && !defined(CONFIG_XEN_IBT)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 no_con=
fig_param("XEN_{SHSTK,IBT}", "cet", s, ss);
> #endif
> #ifdef CONFIG_XEN_SHSTK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opt_xe=
n_shstk =3D val;
> #endif
> #ifdef CONFIG_XEN_IBT
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 opt_xe=
n_ibt =3D val;
> #endif
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> I'm not terribly fussed.

I'd prefer the alternative variant; hopefully Roger doesn't strongly
prefer the other one. And then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


