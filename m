Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59356447EB9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 12:17:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223273.385929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2eB-0007K8-OK; Mon, 08 Nov 2021 11:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223273.385929; Mon, 08 Nov 2021 11:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk2eB-0007I5-JA; Mon, 08 Nov 2021 11:17:07 +0000
Received: by outflank-mailman (input) for mailman id 223273;
 Mon, 08 Nov 2021 11:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRYu=P3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mk2eA-0006xr-Gy
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 11:17:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67a2c381-4085-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 12:17:05 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-3-4SnSEA74OF2Vs3fZi1lktw-1;
 Mon, 08 Nov 2021 12:17:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Mon, 8 Nov
 2021 11:17:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 11:17:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR07CA0026.eurprd07.prod.outlook.com (2603:10a6:20b:46c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.8 via Frontend
 Transport; Mon, 8 Nov 2021 11:17:02 +0000
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
X-Inumbo-ID: 67a2c381-4085-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636370225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WCQWwcfI3UyhnfFMSmaQ0eK8fZzHwoMzPN5Us/jj3E=;
	b=LCk6LDyD8EbYUQ7r4uke1oKpPMP9j7SLTxOeM/v2iZgFQzVSTrXubwcSCt3k3+ebTKoxDE
	0kqWtVNT3EjQxy+Aya/Grh/CporDSJE5ks2oiryyeZ2Vr/uPb9IXzKktFpFZMJhGiSUctG
	uMNqzbIcpKT9JS/OfzGA1+pXfEZFzk0=
X-MC-Unique: 4SnSEA74OF2Vs3fZi1lktw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYm+ojqrLCvtbp3Q2jOvSxvsuWfoenh0hvSwu1JI/zsiW2ypSvPFoDjZiOo6jUvg3SeVdBluXPGxtJU+1VO1Xdx5pzTDL7nnDwe378foHmTacN6iWkc2pfvUIO+JsTEr0QBqlZ01jfcVNy6aUBLc1Zk3WWGIKxNALcQr2iQePg+gDosGE74Tf+qDAbF2UWKWwDU17fV/+1/GU6hvR4aJ5YPdzRGS17xSv/4AsXymPl1VYVlPkOHIr4ZIgYB5QIQsqlKaNMfCo/2llJ6D9YXJor5fpCUzY97rzzmrJGlp4cVAdLsocycHyQe1kJp1lYJWY6JuQCQFn3INlxss1NmsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnTsyXtqBrvvudnTvY4H3coqQxEjti55g3NbLHoyqbE=;
 b=K/49bagCLFSce/MfuLgfAGnrBMEqt20MDvUzTDWlwe2MKPRpc/QIfUZ5xElHGVQ68E/RffDYkYu1q3GiUOuIE0tb0qee9EblsZNLLfhZvtCmdySNBga2ASXnJEGrKGk/tK+CfJ3bB8ynirOrcjugmHLbeN8lQsdGj0Udlg0B/nZqZ0IEMrv8doOoTAr9MsjUD84G3yhJ+IUZBQWbU6pfet25H/3elY5TEJqXOe3L7M3IYHTnBL2JXS+Ew4Cw2NMVTaRu9u1s5jgY6JjI1AHkCvDp8cTVCpLdyZnTdZobNsrScjrcunl0jDk8x81kYHRevXcOdIc4EiyGcovJNtwATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <911b4e41-3c9e-cdd5-a5ba-2f86324a0727@suse.com>
Date: Mon, 8 Nov 2021 12:17:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/6] x86/APIC: drop clustered_apic_check() hook
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <d88cfda3-54e4-2323-f536-547879380815@suse.com>
 <7e2c8dd5-e20d-5678-1fad-1b79fd8e06e4@suse.com>
 <YYkD0J9xSno3aO0i@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYkD0J9xSno3aO0i@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR07CA0026.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e952cb6-1fd5-4704-0edd-08d9a2a94a72
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7375E1314884E14815415E4AB3919@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uIQekdyAXHF2VnDkksUYunGdiI8f2W8VQQhq0I33CVigxZPDoYjySH7T1jwrvdVzaEv/0vdPyuP4ovSiaHMlEcDOkEmxFRjOJdlX1Q/axsI48mJQKPf/iPRO/RZQmeBWExkE+wKNh1R8AAmWptLPjpBnDv2zXjC6d+TRXVrMYHcGCr0iO+/MdhskIngvZzblxyX/wP0uyqfp3IZH9H0R8n5ujq0tYzWhr/EMzidY274qWqIItIbue3/jyZF2Vo+eg0q0x4nD9keCfJVzhiUlE7PWmqgQVMrK2rv++PDmopm3tRRsvcOoHXmSOwwDvlu/U+OGyev50wYV7wIppQas859rLNyRdQj3HntxTm8/NXVXrzy76HIXJ2UkiHVt8WkxY7QwOhl8H5ihky9VP4KX09EKDDpXKKzglA+NsOQPETXuEfkz/pmrLu1eWe1ar4aBtw5NInW8Lgmb2fulO6HLf0/r70pvND+pdc4PhnWvXID73sIU0YZqcVxNQSXvSgwgcmfvnyZliYFVYzU0Jw8e9nX4aOr1YzyI2fPQKZ0CkEwr3EP42OPt8QD485nfFizru2Yi85WRHdumnreFqZ/GspQyN5YNfd454qMPoIxcB0y/lHK3ONsZOkqHPxOqmcn2of+/zS2kvwYsIii0aebDgIJ5naIJqZhbSuqmH+d3sZ9c1+dTHSltkLVCcLHe2SlEFFgIHI8nx+XY4KLjZqZ5kuEu2fyJRo/iwmGmuea1ePNONDiyGHTqTU0kUspk+1aj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(6916009)(186003)(26005)(38100700002)(5660300002)(4326008)(53546011)(66556008)(66946007)(36756003)(66476007)(86362001)(508600001)(2616005)(31686004)(8676002)(956004)(54906003)(2906002)(16576012)(31696002)(316002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nR12X85KMCX3DiejYpcBagd94MVZp3JtE22sA6sdayRI40fDDQXQxEZq44zK?=
 =?us-ascii?Q?sjdhZAoz5W0ZbXz3DG0e1ktFSWXJ83j1UG3Ph6gvo2kLiV8oBLQHhcbI2nac?=
 =?us-ascii?Q?FniNh15zWAy9Vx/W6zAkjWts9FDzqEO/ZwZvt9go5ZHoHscnaljTfj7bslAz?=
 =?us-ascii?Q?qqFYgOCXfDqhI2VtQVxmnEL+AbLzfqdikVLn1ViHqD47SMLFuTtJFTxQyega?=
 =?us-ascii?Q?dMLy9zK3+bi7YRV7X92clBQTzTFLx8fgssWaYb3+GKIB7v5vYSm1Ov7msjut?=
 =?us-ascii?Q?bpucnt2Sn/T0yDNk4TFwKWqk3BDzAatkZ/4QcqNHAD6thWJjXlmiT41C/jUA?=
 =?us-ascii?Q?JLQ9MMM6LEcn0gtUigJi1Pks74jr7gvKbxI/F3wAQz+KIP61x+z2MNbfIetl?=
 =?us-ascii?Q?6CT8KMTg5O7OC/8sMMP7fBTPSieAKe0k4lVkcckKEFVtH9HUzlBkMXpMomfR?=
 =?us-ascii?Q?qiNevUd6xF+OxbzDJ2v1QeShIUN6jcpXaMSDKKVs6ELp32S1dtYpg2KHdFad?=
 =?us-ascii?Q?TV+DM8GmOfgZFhK5TRFvJvEN8HvDmkqIufMU4Uu+ib+VhoAc7HqSRsEAp1bk?=
 =?us-ascii?Q?GefsLak7SPv62AcifR7H4X+m4P7/kGm3aLdTJgfEV+vr35JMPJTweUvNhemf?=
 =?us-ascii?Q?bkFRWv79D2eeP7OQSa680x28+L8yxNBrYoBznI49IueoUQkaTkVd5dG/OScD?=
 =?us-ascii?Q?gtv+E5YETDrcLZfl98LDMpjZMZwyX/s6OfRD8SkGwAg02OlDXt8olstZL3xz?=
 =?us-ascii?Q?c+/uCKO7RPWoqGfGMq1jyQEuYuXSsWS+GrVQ9PVw3oEdW4bfNH/HZTP5pdZ+?=
 =?us-ascii?Q?E3abTadWvX8uqs/aceTPEMKP9Q5tTJvUwcyxcYfLdCQ67Em9smz4fasVNKVY?=
 =?us-ascii?Q?XDQgUd8N/cyc8RnQoEMrIk1x9LWuB9MEgh3ChWtLV3qnYh0d5O/fK7uU8ez9?=
 =?us-ascii?Q?aHt/jYUSYFjl+6gVaPw/KC80Zx3e7BMRhqcNOT6a58AhJyjoDfyfN3uvl2cS?=
 =?us-ascii?Q?PuDK/GGOi7NcTyvKumaeUagqD16cy5AkjSdW/JijWlPggly8w6iTblICa2j6?=
 =?us-ascii?Q?L3PrS4QrIFmh+6+B6dkXkUYqcANXZn+GzgIMj0u/ZN9E5Wg1LbljDiXtVbVX?=
 =?us-ascii?Q?gi8c9eAUB//1A+AocMavSoIZW9gnRadQFzlc9b1/vLmzmYOiBN37vWIj0svV?=
 =?us-ascii?Q?L6bXZjV34aLNbLcqYByW+SzCCz0Va6B1w+62V/o3wsMBW1LTOSKv05UX+w8f?=
 =?us-ascii?Q?wr0Np4LJJgiWM7/7nkYMjWPB2VEYHWXCCTOpelFaPKRG0SRzqeRe876UV8sE?=
 =?us-ascii?Q?QO7GPIZhWTRqmv/q+BwEDn7PffVGwaBg/o5Ln4oUYUyXQ+EN0SlR4p5mw5jX?=
 =?us-ascii?Q?b4rstBggsYkibNKO3gOJUF1MAwK/mkRCRay9Wo+SQnzA9OKQ20Rs4n3RLQYT?=
 =?us-ascii?Q?HJPDzjvCmovMusmOu0CVvh8Apwu7ZJyAPpe65pqBYs6FoDzS3AdowVhWk2ga?=
 =?us-ascii?Q?CzZyMkAybI+hoA/XAjOa7nqfGjIyWxw+MQbPOvYjROvbpiDMhgQAgkmZ5Rsc?=
 =?us-ascii?Q?I6OM1v4vyaMg7Ys/Nh+AguJK/Lpvfex+ZLM9k5TyFywbhAH5DthfsG/DyA5s?=
 =?us-ascii?Q?AacL0MokO4VhreuXuG1TnQ4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e952cb6-1fd5-4704-0edd-08d9a2a94a72
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 11:17:03.2896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbQ/Z5FyZJBDNtum0NKzqpPWPKjSdKZ3O6j/WDzDDdKS8KA4t3pkjmU5LaH7YPO95Cf2s25T7si6zAICoeVTBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 08.11.2021 12:02, Roger Pau Monn=C3=A9 wrote:
> On Fri, Nov 05, 2021 at 01:34:12PM +0100, Jan Beulich wrote:
>> The hook functions have been empty forever (x2APIC) or issuing merely a
>> printk() for a long time (xAPIC). Since that printk() is (a) generally
>> useful (i.e. also in the x2APIC case) and (b) would better only be
>> issued once the final APIC driver to use was determined, move (and
>> generalize) it into connect_bsp_APIC().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/apic.c
>> +++ b/xen/arch/x86/apic.c
>> @@ -243,6 +243,12 @@ void __init connect_bsp_APIC(void)
>>          outb(0x70, 0x22);
>>          outb(0x01, 0x23);
>>      }
>> +
>> +    printk("Enabling APIC mode:  %s.  Using %d I/O APICs\n",
>=20
> I don't think it makes sense to prefix APIC with 'x' or 'x2' here, as
> we already print the APIC mode elsewhere?

I was indeed pondering that, and decided that the extra yet redundant
information wouldn't be worth the extra logic here (the more that
there's no good way to optionally print a single character, as sadly
%c does not print nothing when passed '\0', and I find single-char
string literals kind of ugly / wasteful). But I have no strong
opinion here, so if you think it would be better to add the extra
bits, I'll happily do so.

>> +           !INT_DEST_MODE ? "Physical"
>> +                          : init_apic_ldr =3D=3D init_apic_ldr_flat ? "=
Flat"
>> +                                                                : "Clus=
tered",
>> +           nr_ioapics);
>>      enable_apic_mode();
>=20
> This also seem to be completely unneeded? I guess it would be cleaned
> in a further patch.

I have to admit I didn't even check. There's so much more cleanup to
do here ...

Jan


