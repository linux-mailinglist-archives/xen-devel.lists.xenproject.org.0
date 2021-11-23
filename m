Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C965D459D54
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 09:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229176.396615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpQjs-0007I8-8J; Tue, 23 Nov 2021 08:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229176.396615; Tue, 23 Nov 2021 08:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpQjs-0007Fg-5N; Tue, 23 Nov 2021 08:01:16 +0000
Received: by outflank-mailman (input) for mailman id 229176;
 Tue, 23 Nov 2021 08:01:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mpQjq-0007Fa-Tf
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 08:01:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86c202bd-4c33-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 09:01:13 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-tLTPMaQfM5Sf8m1eXpGpUg-1; Tue, 23 Nov 2021 09:01:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 08:01:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 08:01:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:20b:488::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24 via Frontend
 Transport; Tue, 23 Nov 2021 08:01:09 +0000
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
X-Inumbo-ID: 86c202bd-4c33-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637654472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVdz1ekQvTzDSvQElRSZRIm8nnj/hixX4fL6OVm7KYI=;
	b=GQFmIMjiykwm+2Bxfs4nmV/CCONTMj51+lo+Id2KRh3Q5usDMSgWnl+ZG+BzGU0pR/7R/t
	79q76a4QJER81uD5JvsA6s/FUd0l49SkR2NJSVzKu4z2qd6UXfW4Um24jH+oFZHnrIY3cy
	d6Yd+RLN8Pzj9ez4GISFOfJi3b8gZd8=
X-MC-Unique: tLTPMaQfM5Sf8m1eXpGpUg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmbu0M3MEEJad6KWQW55Obwimjh30tUNbF3AMHKtNMdl+l3DvXat77Cv1dIZ4/3udpFJ4xRLXTG/GoDvNcej0rSidnX+41Ax5JhENKR7Aj1YaDT8matBbRNYoZnzW2v8g9BxVjjlpZPGWa067uCzoDmnNv+Y1QG9gar3k2Y/n+0nrPVHi4/Dq6XhokDZ2DW+vpiwNlhFCVN6zFAt+8mWPkyEobgW3KO+ZUR9gm2lWKs1hTWJuxDUl/MUDK5Mm/xVs5RNFrABBE82jQILuMn4HlJ4qCtF1qeyigG7EJqrNEtdNaNszfeLMSe2/8VZ+Tn4zl4DVh/u/TxS7p2mqnObjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRwQ/ROP8pRe31KYLn9qVfE+jOFtGVV/Pp7Sku6bczM=;
 b=fKAUtSwShMQeNasPabOZXEawWwyZG03ra1D5gKLZw9nrzxoj0KOfjXmYBoPUBwxGfND2yDZz+ljgOceGc8f3Yu97OwCxE30tzkdwS0TLRZd63Fg1Uvm1Mb8UeoHtLxBk1JPhshAqIFP8f3c47q2R1r8qDnQ05+5er1F2A9Rcr2isQE/ZGpmCtevdqyjyuqa9Hod8i9/zpO08WmFnyxJ0ahOHWH5dY4QDdZNm4rfgYbDf14gZRKw0LuU6wz3CqEBmctXIu/0DdFRuDqBO2CTc10Xl+ZitSntri7x32KtT8mTpGRHK3qqksSNOUOh3xFN8f05zs1Sj2h+1TYODaZ6v6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <31816ff1-987d-f78d-036d-a35bfd9f807d@suse.com>
Date: Tue, 23 Nov 2021 09:01:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] rangeset: add RANGESETF_no_print flag
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <d6b298a2-bc04-8845-eaea-09502e32dcf1@suse.com>
 <b3a0d4c1-8b18-5d63-c70a-8b3db7fd6c84@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b3a0d4c1-8b18-5d63-c70a-8b3db7fd6c84@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0008.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 621c598a-3e40-49de-d5b5-08d9ae576930
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2446D065C11CB0675A59254CB3609@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AyN0pQDyk0jktQEzmexGTYa0nhS/jpmX8Ti8SbEPzMOYN53bi6fvX2pqQKjV/mgynKOHXC1jFoyOy8/ivlxuoTngwRY4GVUb7PVDCbu5uoa/EcbzP678qE4R9+XHA0zg3CJbhTqeuv8c4YxvJQBey066qX4Kteae9/x2p3THxp94ELaDi4xwDtfbUHu7ARZf0I3Hv7gUdUnSihl5MpObnnMU1kZTtM7h/Ln3qlREl/NW0R7Mi1J3+/RZocDrNXn/X0jjbI0dK7Z6baS+ngDRKH6yCrJ16NUmgsi06ODbQR3gphq1nMWZCv7b/7njULD0UUlOkHZP2gH7EdJzxAs5n30XupxXaLqPpmEcRONdIZYb0csJMj5+f0eJRX0CAKwZfWT2K+JPx9KqGm/+7JdxXb0HeMPFVL/2YmTiLeUj78j7icbYWCqAbnF9EhDFNJdZNTFbuwTxfahj/H1pt74P/xLiYttXvqb4DhOHpdHiO7Sloisp45vfh2XJaFVb3SucCHOpLo1KSsEQ9ghEAbrZZ//bqD+fJumWvcbzwXSfWkpLFWZrOE2pNJB3PsDXQNuzbyU95Uwi2A/hp07DcUvoE0YtGrx6vM9n38AkiYhuMQplzyGbuB767vl+nwpVdeenkZ2G/PouaOx7ulxkCh+KKlPunIitav742HZ7xpcHcXkFzohpaIp5MNHQScRrfDJEK5h1/kMQU0QiDppaeNrQ4GDX2JVkOc3aE3WVCQAs2mw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(66946007)(6666004)(8936002)(66476007)(53546011)(8676002)(66556008)(186003)(26005)(6916009)(956004)(16576012)(86362001)(4326008)(5660300002)(54906003)(38100700002)(508600001)(316002)(2906002)(31696002)(31686004)(36756003)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LlKI51idA7xla5Dz0nQibLhdFxYaww6yzSZhyFJuW0+ZE1pL96jhUhMvQbXB?=
 =?us-ascii?Q?g6opuFrTlEpJebQwRaPpUNmRp+wNPY7EFiiT3JUklsVqJtLM/16Lk45fKbpm?=
 =?us-ascii?Q?I9rzZIUEczXl3BhMe4PgfH80+DsFY8ybSFl9SQXi7tjk5+sN1IFKPhA3RT+D?=
 =?us-ascii?Q?bMkVmQsa9ygRrNbTwvs7SGMqQ0TDL5b+WxVE3eVMqviyq2UI0CmlqxK6Q201?=
 =?us-ascii?Q?/25AkSaHzl5zqu1Y+uvTMbCybEPdRkAvyXZkN+HZ2iLj1zLZUz8DpU/FOHcA?=
 =?us-ascii?Q?oE86h3jrXxJWvIswgW/enWDe5gHgm8Sm7YR8chOB1Iyyqp477Fvdk/F6qfHr?=
 =?us-ascii?Q?Tk9n7+E5EvvCUDYghKEXwWwmFIOIaTjSGJWvvjTRy1EewuwCg0QZ8qv6ojsL?=
 =?us-ascii?Q?ebndmgVqA+bP4Bw4jCUq9uz9CIPcxxZHGzKtl2cTZd8LJtHQoIUhlis6Q+Ca?=
 =?us-ascii?Q?Re5Z0AHAtAkDDb2F0txXHFhu4N3vnZA92A38kr4v9QkRhQC0BrgU0dxbSCar?=
 =?us-ascii?Q?AdvZw24Sb8IvNXgCsYSuQ+7F3IcmPOSY926nKKBGjoynXQM8rlRuZYi8CvTU?=
 =?us-ascii?Q?bpxmT+ev9YyyZpw5C4kEtJiiOcM1m5jupTsc7nki114ZMPZ/uHb3qC9ZW+3E?=
 =?us-ascii?Q?+dqRhOfxurTu0awLoeCKhskwhmZ8LoJBFtjvEVdyA+oJfcGX2oJrlGmjImay?=
 =?us-ascii?Q?RIEGCZg6jqxr4pFT74C72Vb5RyFwhs0SSBWFHK+qvdbEcFjGyrJBfhDwIjjy?=
 =?us-ascii?Q?zZMqaDOOdtCZ5ZUGvrD/TQDdmr9u7kB3gYYgWTqg9E9aedej89iW/k2C89GU?=
 =?us-ascii?Q?nsrw0MUga4MGX5gWqupKIirTRugYn8JRC1OaUP5lGvSMW/ygYqxcgmLuo0KO?=
 =?us-ascii?Q?6CxWDKLtcYChFOrbxLUwdz5oDKp+EYOx7TXTo2QGUu8U2bjlulgeHgI1LlS2?=
 =?us-ascii?Q?gYN9oWuKI0hByRwUPqGhKPHPXbV446QN6jqPJqCgeBLhAKwy5M47iqnPQQTl?=
 =?us-ascii?Q?Mnj45Nw0m8/mPqBPhy4U8R2Gv23ipFQXiVs40DhsuBVrNN2TzT37rLSZD5J+?=
 =?us-ascii?Q?auDgTi0xPQnXfCkzS+XItE6Sd14A/R16X0c2NM66FN1Fx4JunqMXiewTPcxM?=
 =?us-ascii?Q?YauyqcBGj4ujstduZiP+7b5OaaORG8IPDtDhtdhH7iZ3s64OQ0pIruEs7v3B?=
 =?us-ascii?Q?XifdfoHfKeVTJzIEEJlCNLvH43szNX+NFKGkoXqsCXhqBSXS/w8dmF7z52FF?=
 =?us-ascii?Q?6jyTI/Bn7DNra4EGzzMjm7lyLt2b8UC79eHSZdmJusiBa3QA0+lAFV1WiWvP?=
 =?us-ascii?Q?YlxKpi6L9yNRnkL/TcHavofvfi5tKV9YYZj57ebsD2W0/+qgzT4+8T7e97Jl?=
 =?us-ascii?Q?92GOhiDCeeQRiDDbDqeUV9sIyzBQ1wu+6iOn8k4RM61bmIs86ONyQpQDOofl?=
 =?us-ascii?Q?AXQq4JOCzbjy68h1A9cbset1cyeUci9ENtuTy4qWutzsE8FEwAl9Yjq0sAC6?=
 =?us-ascii?Q?LRQ5dmXzkO8qTLRlZf1850+kqpEJe77P3mUbIi9Thl02WQgnNo3k9LX0opaE?=
 =?us-ascii?Q?jWZU+dIJqDFexCEyHXaBBINTX8RP6y3LGX8+sWS+Qr2syeEgUxW21j24FPxV?=
 =?us-ascii?Q?uZn/G57kecFM7cMqumYcNnY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 621c598a-3e40-49de-d5b5-08d9ae576930
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 08:01:10.1330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWi5xzf1v+y8Ko5wJBr4bNQYttYWKApdwUFR5j2IZAzCK3uPCGWRcCLMEUKbtSfui4Eeg8yPCjqhRT8XYEDZBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

On 23.11.2021 08:49, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 23.11.21 09:38, Jan Beulich wrote:
>> On 22.11.2021 10:28, Oleksandr Andrushchenko wrote:
>>> --- a/xen/include/xen/rangeset.h
>>> +++ b/xen/include/xen/rangeset.h
>>> @@ -51,6 +51,9 @@ void rangeset_limit(
>>>    /* Pretty-print range limits in hexadecimal. */
>>>   #define _RANGESETF_prettyprint_hex 0
>>>   #define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
>>> +/* Do not print entries marked with this flag. */
>>> +#define _RANGESETF_no_print 1
>> There's no need for this, so I'd like to ask that you add ...
>>
>>> +#define RANGESETF_no_print  (1U << _RANGESETF_no_print)
>> ... just this. In due course we should do away with
>> _RANGESETF_prettyprint_hex as well (unless you want to do so right
>> at this occasion).
> Ok, I can remove "#define _RANGESETF_prettyprint_hex 0" as well
> and have both flags defined as
>  =C2=A0/* Pretty-print range limits in hexadecimal. */
> #define RANGESETF_prettyprint_hex=C2=A0 (1U << 0)
> /* Do not print entries marked with this flag. */
> #define RANGESETF_no_print=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (1U << 1)
>=20
> Or we can use BIT macro here:
>=20
> /* Pretty-print range limits in hexadecimal. */
> #define RANGESETF_prettyprint_hex=C2=A0 BIT(0, U)
> /* Do not print entries marked with this flag. */
> #define RANGESETF_no_print=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(1, U)
>=20
> What's your preference here?

Clearly the former. But this may not be everybody's view. I'm hesitant
towards further uses at least as long as its generalization, GENMASK(),
isn't ready for easy use. It was some time ago that we had a discussion
about that one, supporting my reservations voiced back at the time when
it was introduced into our code base. Iirc there was more than one
issue with it; the immediately obvious one is that it silently does the
wrong thing when the arguments get specified the wrong way round, when
it really would be relatively easy to support either ordering.

Jan


