Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B773B5AE0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 11:05:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147757.272673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxnCa-0006yf-18; Mon, 28 Jun 2021 09:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147757.272673; Mon, 28 Jun 2021 09:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxnCZ-0006vO-UI; Mon, 28 Jun 2021 09:05:11 +0000
Received: by outflank-mailman (input) for mailman id 147757;
 Mon, 28 Jun 2021 09:05:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxnCY-0006vI-EC
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 09:05:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3c456b2-960a-4244-8385-2a4d23a3f331;
 Mon, 28 Jun 2021 09:05:09 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-SrglopH4OxSU0M5SG6nbsQ-1; Mon, 28 Jun 2021 11:05:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 09:05:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 09:05:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Mon, 28 Jun 2021 09:05:03 +0000
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
X-Inumbo-ID: f3c456b2-960a-4244-8385-2a4d23a3f331
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624871108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XYk0OhTCDAfLE2dJ9YJDwAft3+yZP+9/0b2noT/03ys=;
	b=EB+PD4ofycqjLj6iuXHnQjOHAFQvEYNbCueANlnVcM7lKWgr38HZpzJJ9WgObLiq0zC2nJ
	Zdf4e2jHYwJoSda/SOdOOdjWip7DsU4yho4fnslOPXbavUZdcnxL08oT7qF/gAROoJCv8F
	JNnYvmNVWUZQO1i5gIfhZly03e5PN/s=
X-MC-Unique: SrglopH4OxSU0M5SG6nbsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tq3wUTQdaze0lNUrVO+S44IWV2OuL2ijOA2F7vlir7XYNknjy+z+2n1WgjKDGTDkkKm56RNU+oZvDa0FVEtNvCLlncn0/ohUcIGzzPr/PsYjwZoLoukoxgUqkYhLnPtL9Nl/4vEx6uaO8fQ0BhtGjRxgWQGoSAh6nebGYrK0VIcBWTwbhRqHAGcRB9QYGkvkDosz9hSCUyq9N8RcV6gCHRKdcbEAn2fQBgHtHsU5UOA8M6+F1fNy0raUTluPJlyna/xULkvkfZgHcHXG+TyLiUksoGspJYSWsrcZxBsxLxKFBapdhcBsuiNQ/09qOFkNycIf5Q4lK3fqNgLwa9h0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW3/zbzhhdKD9/F2tCmrbV8jKBAkovc87nDqkTjAzcQ=;
 b=mQWMJ93PsxP+KUwcN0m7Oe3aC56ZjEgq4IvQk23RSK0PenP1LJ5alN5JNUNnYTbfEDSE21lc8EMfn4eiXYb/CGm757hJFy+OyC9K5rtiB8GYgPqCuAL1k7FzhvRCwzQwwcvvS5VMoYryfq5X4PuJUYkvwOCqDc6ZpCShXZIlclCGZKGN2D290mWU5U684Aj1aRxpLxgVOSDmOfkVisC2gzOvxd70ZEeW/SDerQoOXcCPx1rWZiaqzKLR4xMj7F8+n88KU4i5HwSitD9gqMuf72YBmzIxAYQRWwDauyAlFx7UaK1yrbmwROHChAk3P7BoMmMVuEyyoMkE9VXabY50Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 06/12] libxenguest: guard against overflow from too large
 p2m when checkpointing
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <09e81b91-84de-6e49-9a62-eb3a6f392954@suse.com>
 <8248ed3f-0437-4ba4-fc26-884e8d70cf92@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <990e4e8e-52e8-2f78-bce1-46045de798fb@suse.com>
Date: Mon, 28 Jun 2021 11:05:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <8248ed3f-0437-4ba4-fc26-884e8d70cf92@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7607f183-7b3f-4cf6-d32d-08d93a13d171
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5600842803AB2A0623F69C30B3039@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	otFflH6fd8bWB2DjWjxxR2rKoCrZZhb9UNwqiUHhD4qZgHw/5M7f9+KevcQkDTC20aBAEZ/yw0Ioitrnmp+RVcH0NVZA9bvs2WM7krcU8C4VY5asV2nG10KI6ROKFcJrI8TFPEabrO+RnVF65I1DrQBufDQaqcLL6rH6rd5Y9e2J2HB0GRcBwL353AdMBcbF+y3jVBf9iUXrchRm8CXDpV146dDh+YJEQvByuPMvJvY6P3aGQCtmHb0oKJHVedv3a0PtVmPwsJ5TcqvCplI9wtf3j7vQ6LL4+mUF/yyuLcDsrId64HwQA8eSiudGCQb/p9HXYDHqd/45YA4l57RvOMCXw8nkrIO9/baIr0In9RS0uMs8Y+CIzw2rYGTM5ry7X0mRoQehSRIEVGZBj1jducRmUhdT9Qtpus2kuFBdj82xaQ3/6dxQ8yQBtWD2/wQgh/gZpev9Am0lDnOzq55PJjaGkXWsLXldAuWl7bjPX4eWvlez+7IhPrQS9p1N/WudfzwYYXfj3sJdx2LMvJ4ZPiDPA7SsUI1m55zq7dP9J07GMDVYayxJE50eDJ1tho49Yiy0DdW0WNirvWCQKDVdZkn8PBkZVhwTWrkclQM2IDpzSVfFO4XEqNWGNa/lbOBR6mAEireNRvTiPvcV5Q/dtDtgGjNIbeg3u/G4zszEN/Zvqv7tmuzntmrbjasIgwVJNU1+EkkSMTYkYH4UZBSukOkE9Z36t4aFCvVMWOIOf4c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(376002)(136003)(39860400002)(5660300002)(6916009)(66946007)(66476007)(8676002)(66556008)(83380400001)(8936002)(186003)(36756003)(31696002)(16576012)(316002)(86362001)(2616005)(54906003)(478600001)(4326008)(956004)(16526019)(38100700002)(53546011)(2906002)(6486002)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XEBljNMgc4iWZvdxxzOOsAs1f1KhBZI/nGdyF+ouXsxA0xvj6nr/t0skXKOj?=
 =?us-ascii?Q?P53GLeLVv/uMAldb7KUNk4p9hP/lBo1pPxm74oRloew81Cy7jTikbF7BPYCq?=
 =?us-ascii?Q?IfJkW3jqo0kf2PDCTn8o9/hlledirQIRktR1cwx+wQLsKkYT6IZaL1HNn2H2?=
 =?us-ascii?Q?mesqrQuCB4QCgSvEfVy2UMb7nWkVx011UeK5b9ZjTOo2oggqIWDEgthG48FI?=
 =?us-ascii?Q?eX8u/DpjmPozIwZxZyvQ2BaSQbyIn2EbgUqB2V3u5dK/2anRud4A2rERxohJ?=
 =?us-ascii?Q?5AnryJsZkx8Pyj3fy4WLwa7Jrr56BsvVDW3bFdQRAYpK6KTtsbuS28XJ0wvY?=
 =?us-ascii?Q?R/h3jO+9EkJtffTX8p1G/N9wJg7ZcDynP3DjBFbn4+XprohG27xzuBSq1ywC?=
 =?us-ascii?Q?tGme9nDyGtYgWjEe57XPCZr34IFcthSPJHHu1ZnRzgNauwh1iZduO8rLuMrC?=
 =?us-ascii?Q?MmFzHRY2ONEB5Sb/2pezXUEqr13kopUrmhmdbWCh+ap+hpx1nQHhuVcMzZm4?=
 =?us-ascii?Q?Z261cUmilxLYPg0JpRgsziyne6/jYWMpxWTYZ+jJ0S5b6+od+FVP4h4udD3Q?=
 =?us-ascii?Q?EHqydjLaCrzq9qXcBHk+TRqsDrjikJFLu9kLPP731puW/GRDFNXlsTdSHx2/?=
 =?us-ascii?Q?G8jT5SFpEN+UZfSTzw1GIOQdTjWsALqlvikH7wiqEHPVVwhTw+LNSxKn5qHh?=
 =?us-ascii?Q?W/CsChK/L2PfNqcR03saZuaBkPH+r5jdk3T3x+bg42F4flf6irnpTX+Z1m5E?=
 =?us-ascii?Q?C2hefnmdfg10t9bmF0Or4tHNkSS2kI8TfxUXyQBPBEL3iDc4w9bsVFFPnmiz?=
 =?us-ascii?Q?W33YBbyWD0yxLWzdFCk6sPdmsBFmQ2viRuID5pDcY5Rh9J/k+Cz8zpqrHIxA?=
 =?us-ascii?Q?dL5z0Kd2OfhMjJyv+Zi79t9Z8gc1kxlr6Cb/wCDhlV7fQDDiIYSurwhFQt0C?=
 =?us-ascii?Q?jjYvGSwmENfmtgcRussV6AhCeNwBminyegVb8C3acFYsKPdmawoZQnxx+Br/?=
 =?us-ascii?Q?w7Tv0PeHIXk+9X5ulb+Wc7m4rXrhThR1tkNlm48QRZao8WTQQc7E1r6WpmAX?=
 =?us-ascii?Q?ePsolb34zUEFM5ed15EuM2h2SP9gWkHwDoMm6DHG4BEUf/voADGUYdThczfJ?=
 =?us-ascii?Q?eINByu7ZUXWBxzAGn/IFBujtDt37e8a/DTht8F93kpvWQINu8Nc+WqNsmDtq?=
 =?us-ascii?Q?PHs03ee/qCDCDPeaYJZL7AVHY9VR+X5DHlrYCKyMJ2f0zuNz2G3O+XxvWVg9?=
 =?us-ascii?Q?JG2zZqD03JdUhYrRUA7+NbMHBO8naIMENPsm+ydYPl527uYt0dC7reBIdGDc?=
 =?us-ascii?Q?QvBtC95wimvmmnVQfrVfk4DD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7607f183-7b3f-4cf6-d32d-08d93a13d171
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 09:05:04.3232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBn26ZhzFWNBN+FjHlhsdtb9sgVIyB6Wl0R+eDuZP+sv4Ev+NsY5IG92xZl9Dk5URjhjL2LnQglL9aNbKSN5Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

On 25.06.2021 21:00, Andrew Cooper wrote:
> On 25/06/2021 14:20, Jan Beulich wrote:
>> struct xc_sr_record's length field has just 32 bits.
>=20
> The stream max record length is
>=20
> /* Somewhat arbitrary - 128MB */
> #define REC_LENGTH_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (128U << 20)
>=20
> and is checked in the low level helpers, making the upper bound on the
> number of PFNs 0xFFFFFF once the record header is taken into account.
>=20
> There doesn't appear to have been any consideration made to what happens
> if this number gets too large.=C2=A0 That said, the replication will tota=
lly
> fall apart if it ever gets to a fraction of this, because this is the
> list of pages the source side needs to send again in addition to
> whatever *it* dirtied, as it is the state we've lost on the destination
> side by permitting the VM to run live.
>=20
> The common case is that, when execution diverges, the dirtied pages on
> source and destination will be almost the same, so merging this on the
> source side shouldn't lead to many superfluous pages needing to be sent.

While I follow what you say, what I can't conclude is whether with this
you mean me to make any change to this first sentence of the description
(or even the patch itself).

>> --- a/tools/libs/guest/xg_sr_restore.c
>> +++ b/tools/libs/guest/xg_sr_restore.c
>> @@ -450,7 +450,8 @@ static int send_checkpoint_dirty_pfn_lis
>>      xc_interface *xch =3D ctx->xch;
>>      int rc =3D -1;
>>      unsigned int count, written;
>> -    uint64_t i, *pfns =3D NULL;
>> +    unsigned long i;
>> +    uint64_t *pfns =3D NULL;
>>      struct iovec *iov =3D NULL;
>>      struct xc_sr_record rec =3D {
>>          .type =3D REC_TYPE_CHECKPOINT_DIRTY_PFN_LIST,
>> @@ -469,16 +470,28 @@ static int send_checkpoint_dirty_pfn_lis
>> =20
>>      for ( i =3D 0, count =3D 0; i < ctx->restore.p2m_size; i++ )
>>      {
>> -        if ( test_bit(i, dirty_bitmap) )
>> -            count++;
>> +        if ( test_bit(i, dirty_bitmap) && !++count )
>=20
> This is far too opaque logic.

This is an observation, without hint towards possible improvement.
I can attach a comment, but it's far from clear whether that's all
you're after.

> Its also entirely unnecessary...=C2=A0 All this loop is doing is calculat=
ing
> the size for the memory allocation below, and that can be done by using
> the stats output from xc_logdirty_control(), which means it doesn't want
> deleting in the earlier patch.

Only if there is a guarantee that the stats.dirty_count value hasn't
itself been truncated (or, as per the later patch, saturated) in the
hypervisor. Otherwise there may be more set bits in the bitmap, and
counting locally is still necessary. I generally think that anything
called "stats" may be used as guiding information, but not as precise
data. Yet the latter would be needed if you want to make memory
allocation depend on it.

Jan


