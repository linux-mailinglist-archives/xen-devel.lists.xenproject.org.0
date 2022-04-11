Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1014FB9E7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302941.516836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrW4-0006fp-9Z; Mon, 11 Apr 2022 10:43:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302941.516836; Mon, 11 Apr 2022 10:43:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrW4-0006dy-6T; Mon, 11 Apr 2022 10:43:28 +0000
Received: by outflank-mailman (input) for mailman id 302941;
 Mon, 11 Apr 2022 10:43:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndrW2-0006dq-69
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:43:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36783c60-b984-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 12:43:24 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-OE5xciMROK6ADsM-jihbIg-1; Mon, 11 Apr 2022 12:43:21 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8855.eurprd04.prod.outlook.com (2603:10a6:10:2e2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:43:19 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 10:43:19 +0000
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
X-Inumbo-ID: 36783c60-b984-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649673804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XpMN5faIBDdoTZ+N2AnDDAxfrqiZT2hxFN/QcKjovtk=;
	b=CFpG5jQH0bSMcuW3oj5GsycYjtrFnaQ/N31uhOwiLufut9Y6QRjpojqY/SplMhzRjfn+0i
	d9bt/egp08/6NrHdiwyIVQNnUTpA62AsUvH/4RJvgjhtE0ksOsaPtbA+XWvIW2qXm4BMB0
	JWAzpzOhzSSKOzmtqQnQA+1H/HXS8bU=
X-MC-Unique: OE5xciMROK6ADsM-jihbIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odE8mcuVeF11tO7m6VXv2CSf8tKSXwzLFSxNiUJIDDV7GZdvZ6qliJbvqRN7oCpM7+zZ64oT1AvstA/FN4MDWgJ6WJ7RTSqWGKB6vkbemv5XGCwnxwDw1jIZ3Dj+Cpgf0KE+88Hhg5awItdsvHXkDkzO0xrO5XZ74HEIEwSv7A1dD4pZ2qQLSizUPzbXVhiwtvQaJ4Fxk5+V1mvT1x2KOiJDpD2QCXoUMTCFoGaVLXljlYG+lV+CdGy1GvN7tB8HkrmKrbwR5f4hVK8czQi8uqNTA/U2vmV+ANayLlAbEXlgS21S9yvVMu52vAe4ULg3mEUdCnUQSx/FUMbRoYJTlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAxyiVj8LVywmrEPgCwuwNZvY6So3i6UhSSuXp9jBKU=;
 b=Y5/SmrSMMyk1E7rrIsBqvLbnBi1yQTEwTXa/fEnyrgDnsxTa6n/ZRwsdg/4aWTW0RIGG1wtITp5RLCTtOAzW9DtN92zyeIN3SZ7QIhd5Wr6HU9ZsjKKY6l1Zvn0m0IWdVNs710r4iLbHiKs3t0XE7An9HSEcfXvFhuWCannR0pKGbehyPQ1oEP6uscG3u73gqzZKkJ/XCOvBrOk8SiprtJS8XLuzPymVtKKDgyUv+qi1NZdu9ZZtxr/LpN3Pn2fVBya5VdUT0wGsCzz5wQZ4JwXlys/iFUMrUlq6SWikw1bAflWvYvGySrh50A2UtFuGU39uCH8t/3ePF4jLw5olGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <538ae31a-85d8-6a3f-6d4d-d11e92b3ce70@suse.com>
Date: Mon, 11 Apr 2022 12:43:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] IOMMU/x86: disallow device assignment to PoD guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <db695753-718d-7bc9-3b1a-efd75b0166f9@suse.com>
 <YlQDHONozx9KYnFo@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlQDHONozx9KYnFo@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0568.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::30) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1cd5cf1-6f1e-47b1-9a23-08da1ba817b8
X-MS-TrafficTypeDiagnostic: DU2PR04MB8855:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8855C3619304AF16D910778DB3EA9@DU2PR04MB8855.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZcPkhzei8YgbAC0SaVtOfCB4RFDOPPLk7S/LMWYrrOV16OgIw7hoZpANEAk8E1sPvYhBAUDTFcUHvT7nCEaw18HMRftkhbLq7HXma5FCVILrlQ8JJzx5ufRAyc1brt8sJ9U2e6IDZVu0xpFU0xySAjHN+FQBjzmxVcKmDUA+dRLXeQaI0BUEVyPeq9Gt3zR+26n0VtHVM+gd3sIHrUphXmMJ6gbEsS8qHB3Ch5Xk5ru3JIbqU4IItbsGfzXkuVRmYvbnGRhlpEmxLRdjDdTDha+EEJMThODctDFkPekpw6kX6Ipqmecab4gqtLCum+VX0ejLuHE7TewNcGpYd4i2fNiP04/CdGX9iA8Y+9w7qoHx7VsHMWh5h7mqtniDlrSXuduExNiuVMDKZNgWVOxAu4vhb8z70usn2JZT41Z4hcJtQy/NrLQ8WQ9p8kMi5t7IB+SjNBQdnDnEhZCqJzoRWdHfmczcI633ox2XRaBnjBHpwTTU96hk7jPahuocvq7Ul/uAKzN+G0UAGSsuq0GO17dxy1cBXhAccoHtHVgeuGPQbcGuhjmKP1euYxX4V/NILTcbNF3ye3cs0BxB1jCi8me3i+7QV0HcRz55Rrl/I0HOEiRMEhjZaOqlLOjW1kXmpBeemL0Blg3f0DkEgJfEc9s+kseB/9nh1/77KTJSfOgYV9qzXM6i0z1tnPYILUuPFkdJmCI5+cw86mlEU5E6Q8e5zNaj4aJk6yMhD9xu8Tc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(86362001)(83380400001)(6916009)(54906003)(38100700002)(316002)(2616005)(66556008)(66946007)(31696002)(8676002)(4326008)(186003)(508600001)(66476007)(6486002)(6512007)(53546011)(6506007)(8936002)(5660300002)(2906002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3d3j9p9L5Bq4cLJ2AYs8xBnEodqgHFTqbdP750CTceOwyZIGVusESsyGnY2Q?=
 =?us-ascii?Q?7va3Rl0lrhw/AElwh1n18mvueqBY1W6Ye8+pVlR+q57Zpao+/pQh1AvUi+qT?=
 =?us-ascii?Q?fDCXupYGYxlKUqSizQgI/U5Q9uObxrE8ZN5eGq9Oixbrpo+kOjK+acpxei+7?=
 =?us-ascii?Q?drs+n07/QoH7bVT3XlZuPcvOcFupqbkGSqLVdROWd0kUtwJuwg0iyc/RzWlZ?=
 =?us-ascii?Q?BQDATl8ve6fn0SqnJJqQ/mHNCvjMXbwC5clVRpAPRrZue6E9Mqt7AxY1Gq0Q?=
 =?us-ascii?Q?1h6zp6BZ9IE/r5nSpfN1zK2+h05O2wTsxSeh4y7veQuF/FE82r01x7+z4JgF?=
 =?us-ascii?Q?XT9Sx6h2xPYvLFDp8IaDieA8sbKcNetJLG380NTgEvSeur93AkRn1FJGPy9T?=
 =?us-ascii?Q?5egsUwRelAOrUVepibEujJu5tm/brvxlS2UTEtm3IxB+WHizjpj9bKq+IWCd?=
 =?us-ascii?Q?JSYFCQx4ZB8q0nYSh3AtZ0i7bblUGdlRIaY5uLWnM/1krWggGMFEejhoZUzM?=
 =?us-ascii?Q?7IrNdSaMjmGDS/6IcB2dBTp3ufni7nA4VAywmz7xN6luvs0bcGgF44Pqi0BZ?=
 =?us-ascii?Q?ndETWDzEclGwyDYHp6/crpb1XqpbI63NphGVnyiWbY9ejEYgyJufrhMZOUw1?=
 =?us-ascii?Q?A3r4U/g62YhCP7vzup2jIJwxt309dfgD9WzRcv1MzdxinKkZczY8kClyCsPu?=
 =?us-ascii?Q?8M32K5s/nCTJnfcZUmMBOOtg9UhAxFwFNlKC+ygLe3JZeLF+P+yvhRQaiZC1?=
 =?us-ascii?Q?Og74DW5KC5jPMXEttRFCtaWIdBI9Ao8CyGAm8zSDPjMfqKPTrKlKAdfj1tw7?=
 =?us-ascii?Q?k+I2mB9k6JNHl/nvnRTo1YNME+HdRfvSmUiN7576ELcLo/iSGb4MELBVOka+?=
 =?us-ascii?Q?tOJKive4enJ8VAqPzNEwbdG1wRXbGcE2S9jodS2OBjfvVp8CyV4N6DhC2E4B?=
 =?us-ascii?Q?57vQmEalZIV6VvScIDQ0pzhEjCChH9finioCX5TT7ICwy6wOw+b23kRRHJFK?=
 =?us-ascii?Q?TwZnIBWvDJkDKnDGN1Fik31Ktp8PyTPc5sgd1G/kmDvCL6tyP1wTdlC4JP7Y?=
 =?us-ascii?Q?eyju3QSijZrpU0EBdbkWENWOkUGjjWSW+mzfWucuNmIjWpRve0yzL3iwY+Rl?=
 =?us-ascii?Q?FPXMhGb2qwx6eVYGGDCBQNVQ5nG4CaeBMtOkHdB2ItCq+eRivR2mwkRhLqCT?=
 =?us-ascii?Q?WNqAn4sTo0aBZLNUzKBgdBqJfiGwbbbtYF4yf8W2NH9lHm4Eom9Y91baK6vb?=
 =?us-ascii?Q?T9czmKBQkB+6sMoHcUkKNFZc1kJGHQbE3uE/l2B7tRMNqzYhELXTQT1o028H?=
 =?us-ascii?Q?Ke/xdQbvE0A4mqmD0qYg9FjIvPlfv1TxBZ8YJEpdnCx1HuHgPgnlJi+qbTl/?=
 =?us-ascii?Q?dpWVyVMod1pueqCzu5gEUCH+wUWx67+AQNWRuD9gvIcvpkRIV8ycIv1Qvx2J?=
 =?us-ascii?Q?E4jXD+D/c6tPJgvj/quwvI0hpx5SGsyi7BXSis8W25nNZDdG96rYO29Jw4nC?=
 =?us-ascii?Q?nic1FlIZ2g6RECbEN8DOpU1PtBTSa5eyXcXF9E0uEoDFwSlctKHMVSdsq0Qh?=
 =?us-ascii?Q?cZtrillYaJKPKlzPdx2COlpZO5Yt3q2hhUTwf8tbnRMtvJH31M7H3PvbDN1q?=
 =?us-ascii?Q?QUEfd0tHxaoGDkC3FWwBHVUq4WcWKyt1uIJzA+P6/GgY6jZrPvDsB7tD+n3B?=
 =?us-ascii?Q?vhpcldvz/W7ryBpjKC9aaiNdKJV3+6vOA3sj8elUlgKTI/kOnH5PQaeVi2lg?=
 =?us-ascii?Q?xk49MBb/Ig=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cd5cf1-6f1e-47b1-9a23-08da1ba817b8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 10:43:19.3713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8yXh37KvJ2YtihYq9tWCpPMLwp+o7H8CDEKk1TOGQZNLnUHqPYOUA8Ro5mUCZpS++i2Gi33qyLeFxACFmgFUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8855

On 11.04.2022 12:29, Roger Pau Monn=C3=A9 wrote:
> On Mon, Apr 11, 2022 at 11:47:46AM +0200, Jan Beulich wrote:
>> While it is okay for IOMMU page tables to be set up for guests starting
>> in PoD mode, actual device assignment may only occur once all PoD
>> entries have been removed from the P2M. So far this was enforced only
>> for boot-time assignment, and only in the tool stack.
>>
>> Also use the new function to replace p2m_pod_entry_count(): Its unlocked
>> access to p2m->pod.entry_count wasn't really okay (irrespective of the
>> result being stale by the time the caller gets to see it). Nor was the
>> use of that function in line with the immediately preceding comment: A
>> PoD guest isn't just one with a non-zero entry count, but also one with
>> a non-empty cache (e.g. prior to actually launching the guest).
>>
>> To allow the tool stack to see a consistent snapshot of PoD state, move
>> the tail of XENMEM_{get,set}_pod_target handling into a function, adding
>> proper locking there.
>>
>> In libxl take the liberty to use the new local variable r also for a
>> pre-existing call into libxc.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/mm/p2m-pod.c
>> +++ b/xen/arch/x86/mm/p2m-pod.c
>> @@ -20,6 +20,7 @@
>>   */
>> =20
>>  #include <xen/event.h>
>> +#include <xen/iocap.h>
>>  #include <xen/ioreq.h>
>>  #include <xen/mm.h>
>>  #include <xen/sched.h>
>> @@ -360,7 +361,10 @@ p2m_pod_set_mem_target(struct domain *d,
>> =20
>>      ASSERT( pod_target >=3D p2m->pod.count );
>> =20
>> -    ret =3D p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/)=
;
>> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
>> +        ret =3D -ENOTEMPTY;
>=20
> ENOTEMPTY seems weird here.  I think the reasoning is that the set of
> passthrough devices is not empty?

Yes.

> IMO it's confusing as the function
> itself is related to buffer management, so returning ENOTEMPTY could
> be confused with some other condition.
>=20
> Might be less ambiguous to use EXDEV.

I don't think there's any particularly good error code to use here.
Hence I've tried to pick one that makes some sense, and which isn't
widely used (this latter aspect would be EXDEV slightly less desirable).

Jan


