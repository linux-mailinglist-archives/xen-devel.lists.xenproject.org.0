Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC0E3ACEFF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:30:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144792.266461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGRC-0001Xm-EM; Fri, 18 Jun 2021 15:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144792.266461; Fri, 18 Jun 2021 15:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGRC-0001Uk-A1; Fri, 18 Jun 2021 15:29:42 +0000
Received: by outflank-mailman (input) for mailman id 144792;
 Fri, 18 Jun 2021 15:29:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lC6W=LM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1luGRA-0001Ue-Iy
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:29:40 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ddc487c-d55a-442e-876d-9b7f06ea8081;
 Fri, 18 Jun 2021 15:29:39 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-V6QZTT2vPZOu77i5XeSvmA-1; Fri, 18 Jun 2021 17:29:37 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7040.eurprd04.prod.outlook.com (2603:10a6:800:121::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Fri, 18 Jun
 2021 15:29:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 15:29:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:208:122::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend
 Transport; Fri, 18 Jun 2021 15:29:35 +0000
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
X-Inumbo-ID: 5ddc487c-d55a-442e-876d-9b7f06ea8081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624030178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9QpuST1dr2XN+EuIU+SxOFxKTmZn0TOs6GmPWUWB1Rw=;
	b=FzLk2L6ySa3vd6AeEXzroHqnZP9gtWGCYHSx52lBHbIRRCC0uVNmlmfa6PJW+UyYpsBSiu
	WlUpxl9eyal97OeuHepXoamqSSi4mJnX54Pg1DRrC3ObZ5+y95Lf2HX3Fuq8fMh6iV2oAc
	Js3EZdiHnrFbEfTNCeURTOZST9LuF84=
X-MC-Unique: V6QZTT2vPZOu77i5XeSvmA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArKB8pHRyKlwbk2stNTeZfU1QNfZdJIqY6/q1jgOPOPTWEO3CYIqYCgikjLilrOfgRWxifZAo9AG+f2loPCRnLRqjOqr3huO8p+MV9AqdKKWNYUb7HAdzY4yoZgQ8O4PRqm7oOqpEEKi/bj+OnwyLxCR+Q+ICxqMLRwldU2tA7tOGDxhtOn+stJegsFQuOTvjjBxFb3PmfzqKSUjcSYFFrVISTBHotq+veRUToMyxActuY+XESUi7IRV/QaceVlHSbELGEJFcw/aJHNpMszE4pGFEWkYuwAsEwP955KV3R8OJWEmHM/EhgFgTZuf6pGgIlE7Nac/0PjNvky1OpyWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St8899CI+T6lTL/COT4NIUP5AdLfRHQOiGe16Rhf3b8=;
 b=Zl4wj0cRSio0Rl2FcWCDIu1mnXG86Bn+cgE1MzDtpsr0ylN5N7FRWlJ8ja1R75Lp5iUHLLqlzimJANY7yhpNwM3YgV0pVMfgbCLjHvTxQ60fsYRxP7gINdHzd0/J7i4dpPx6nculb3djhjsn+ACccBYDWCg3ggaS4qpmmS8HYCC78hAHVtfp/lws6+nuK92hyZJ8KYZOBenMaMo/mHP3W0P8TOYKHCBac9O/CBe4kHi1UgBQmMHDOs4G842cWZo0OZ6kPtdAUr5kZGewvXD99uMDwOlhZLO83aFAf22TZwCmj8NQ3epg4nUg4q+t6O2UHo32bz8X0nxIdOkauDYS0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/5] libxc: use multicall for memory-op on Linux (and
 Solaris)
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <edaf04ec-335f-a156-34c4-5c0385cba08b@suse.com>
 <8a5284e3-a029-27c8-103c-cbc12642d24d@suse.com>
 <db8662c7-9641-6fb2-54e9-c0e64e03b990@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d10b9c0b-59f9-6527-897a-374ab7ab9162@suse.com>
Date: Fri, 18 Jun 2021 17:29:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <db8662c7-9641-6fb2-54e9-c0e64e03b990@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:208:122::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5f9b440-878b-4cdf-3fcc-08d9326de100
X-MS-TrafficTypeDiagnostic: VI1PR04MB7040:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7040F8BD56C6E366827A6C8EB30D9@VI1PR04MB7040.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:275;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZdpAbyLR7+ws+y2LfdUBx+CJ3V0PVzC4bzBn8e/it4/wGQgB4jcRCF9K2WgCkn9DNvKurSFNPBWEVnycTDTTANg4FulVpvGULQZnvy8ali4eJFLjlAjWyo7Q4crJHzdKugaQaY3A1wBZBtVM/1FhOzRVU52+CSdoAwU43RXYjnEsKrK/JSmSdZnni3P591UVd030K/EJ4J6MaMCcMNareiR0/a2f+6Ob1kJ+enI3cnONxp0mqC6d6L5btQpqnWFgoACcZLwyW0a9pdksd1fFF8d85KeXWKEIl5fWkgjSZ8EMuN01+P8/7jrCFaL8y06UlvzWme4Orn+SJmf0uzLEZxVKhhbDLcf2CF34aZWP/khUrFgzcDz6KKTN+Nl3/GgIkysQ5H2yaHDAECvSOMLSY3JadUkK4gMeNvN9tmP3ZbvAg0maHkNICsC5mJ+6pHfZqujObaV0N9JCiofmUA7YqEnhIHevYG5xGzboXwoEiKlhNkA3NwaRPJc1ZbqtltZQQiDSBT1mh0jmTTqaNm2LN8V3odwkqXEaDEqkB+pesDOli1hhwEUfKPe9CIOjRt/KB1fi84MlITFyA/BdNR+38wTiVzp4f5sAC/24MF2xNKIC6FAz/OJaaj0v8Mj/+fdftuo5r9ZVSXIc6OuwB/WJqtU/q/ipIULjcsFOubQTtqStvEOcVTnnHrfGFrh/KLTp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(396003)(376002)(39860400002)(26005)(8936002)(186003)(5660300002)(6486002)(36756003)(31696002)(316002)(86362001)(478600001)(2906002)(83380400001)(4326008)(16526019)(31686004)(956004)(16576012)(54906003)(66574015)(6916009)(66946007)(66476007)(53546011)(8676002)(38100700002)(2616005)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tod8OT/FMkx8UFsYuIkLqcLQFz6AyGx8dX7x0EbhD0gpKPiKv0mhix89wmDL?=
 =?us-ascii?Q?vJv3vesUHoXHMFdu9utXGsfrbuvD+f+cEgO0viix+ceJ79qFhfZI7aoRj3o1?=
 =?us-ascii?Q?CCW/zTwBmvzKjiUDJpyXJNBu7dBZmsC64qpUFZ0Puyt9sOwdRWj+BZevmuFj?=
 =?us-ascii?Q?2NLHA6xxnSFLGVcchuOitQPLT9+z7jFgBi6tlagGes724vRWFS5FjB/AdDUT?=
 =?us-ascii?Q?vVQHM0Ib38jQxbkOyU9vMc0ZSwvoF8UrtBBlJCsLgHnyz3KMI4uZIYYgxwxM?=
 =?us-ascii?Q?V8vRFy8S1Iwh2a7wJhiRSIhiZpbkJq+WNL1Fcm75bUw/l2V5myI2VBGwBdtz?=
 =?us-ascii?Q?ddZaXpj2ybtSdtqtsrWiFcFMfRhM+GysIdwmBxR/yYnrNg/qwZqVMr0mf4Ex?=
 =?us-ascii?Q?ZJqHQK0S94spc48unv9UdqLI1D4xDPE9p9H9CHhLkQYzI9lFbrHFXerrVZ3j?=
 =?us-ascii?Q?N9iC2u+o2TsV4qLyvgWj8N2+3SPsRyKgi4ic0e1U9F9WyC2frPSsrf43kF4t?=
 =?us-ascii?Q?elMPh/7HN8Yx4DurtyOGKhpammj6eA8fOvbtUih9GCZktDjll+SyvCI6KuAD?=
 =?us-ascii?Q?4MzPPt7YSpNNDzpnIEQLWcL4ZxOqmm9EVClB6veGqyKD9Bqf8WPRmBPQbx1M?=
 =?us-ascii?Q?D+vBITufhDnVIVLO45l0L1Z6td6RjGp9ra6m2UwCC+tlDUxovh19lUhI9AOf?=
 =?us-ascii?Q?iynxKOBqrn/JVKFrj8krE/IsMLukU34HVX3U5u3SDcdIGkvbPUaRamZ0Jv4n?=
 =?us-ascii?Q?HXpfRTvMvrMvDzgvHrfYmkrRJUxpsvw80U1oj91Uv4WXnLA6X4KzhzIcFqs3?=
 =?us-ascii?Q?Ra70TlKKQ+QdrwCXG9mG3c5nl6nF1rzkPN+oQLDtDgUTBTLQfHqa61fCniGd?=
 =?us-ascii?Q?/a2vweATrtonALFedwkMwsG1BOKa2r+V9eCGAPXjVYgGCckUrxGmBircU7IU?=
 =?us-ascii?Q?YWWj0kdqL6fxWENeOHWJw5mkU6sFR3b3wYOi0FsVXwEawUJUdJ8ueAVQ+OH/?=
 =?us-ascii?Q?Pn1S3D/mnw0kJCSLb+bfMzamBzP6I71oPyuAhsiNLa+YMBhxo0Vb1Lkrx/Tx?=
 =?us-ascii?Q?t0xs+nGGOqUx0ugxA0H94QCEUxNBGaYIg9cAMbbkl6HRFj53ZGXanDuIT8vA?=
 =?us-ascii?Q?JYnes+ETrYR5W5koJERrZ5EzKyp1545E5a7qq2hPWJ/ZNE5TWc+svIXal4IM?=
 =?us-ascii?Q?fAcvwCznBv0t3ybKCbbhIJ0zfYuMzg9baBVozvrBsgGmMR3r+veVxve7/ZEj?=
 =?us-ascii?Q?BkIsFRnpFlQ7jVOrCCfw3cFo9VNAan6J0ztNvaHBPSqV+dTNxdRLLiAZ2bUh?=
 =?us-ascii?Q?jTZLiSMbOypV51+LqmC2zRQ9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f9b440-878b-4cdf-3fcc-08d9326de100
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 15:29:35.8179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcRNdtcZoXLtdlbhDcUYLxwg6aTpc2cX1iQk2HurppmbSnyaw3BWS/R9+3kqysxHFXxClBipDu43+Tkaub3/QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7040

On 18.06.2021 17:05, Andrew Cooper wrote:
> On 18/06/2021 11:24, Jan Beulich wrote:
>> Some sub-functions, XENMEM_maximum_gpfn in particular, can return values
>> requiring more than 31 bits to represent. Hence we cannot issue the
>> hypercall directly when the return value of ioctl() is used to propagate
>> this value (note that this is not the case for the BSDs, and MiniOS
>> already wraps all hypercalls in a multicall).
>>
>> Suggested-by: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/tools/libs/ctrl/xc_private.c
>> +++ b/tools/libs/ctrl/xc_private.c
>> @@ -337,8 +337,47 @@ long do_memory_op(xc_interface *xch, int
>>          goto out1;
>>      }
>> =20
>> -    ret =3D xencall2(xch->xcall, __HYPERVISOR_memory_op,
>> -                   cmd, HYPERCALL_BUFFER_AS_ARG(arg));
>> +#if defined(__linux__) || defined(__sun__)
>> +    /*
>> +     * Some sub-ops return values which don't fit in "int". On platform=
s
>> +     * without a specific hypercall return value field in the privcmd
>> +     * interface structure, issue the request as a single-element multi=
call,
>> +     * to be able to capture the full return value.
>> +     */
>> +    if ( sizeof(long) > sizeof(int) )
>=20
> This is very fragile.=C2=A0 I spent a while coming up with
>=20
> =C2=A0=C2=A0=C2=A0 __builtin_types_compatible_p(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 typeof(ioctl) *,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long (*)(int, unsigned long, .=
..));
>=20
> (which does work if you change int for long), just to realise that this
> won't actually help.

Help with what exactly? I'm not sure I see the severe fragility that
you see. I'd call this a little fragile because new OSes would need
to explicitly be checked for which behavior they ought to get. But
if one failed to do so, all that would happen is that they'd start
out with the same issue we're now trying to address.

>=C2=A0 I'm suck on trying to see whether
> privcmd_hypercall_t has a result member.

I.e. you're imagining __builtin_has_field()?

>> +    {
>> +        multicall_entry_t multicall =3D {
>> +            .op =3D __HYPERVISOR_memory_op,
>> +            .args[0] =3D cmd,
>> +            .args[1] =3D HYPERCALL_BUFFER_AS_ARG(arg),
>> +        }, *call =3D &multicall;
>> +        DECLARE_HYPERCALL_BOUNCE(call, sizeof(*call),
>> +                                 XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
>> +
>> +        if ( xc_hypercall_bounce_pre(xch, call) )
>> +        {
>> +            PERROR("Could not bounce buffer for memory_op hypercall");
>> +            goto out1;
>> +        }
>> +
>> +        ret =3D do_multicall_op(xch, HYPERCALL_BUFFER(call), 1);
>> +
>> +        xc_hypercall_bounce_post(xch, call);
>> +
>> +        if ( !ret )
>> +        {
>> +            ret =3D multicall.result;
>> +            if ( multicall.result > ~0xfffUL )
>=20
> Wouldn't this be clearer as > -4095 ?

Not to me.

Jan


