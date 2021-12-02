Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A6E465FA7
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 09:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236374.410029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mshby-0006xe-3q; Thu, 02 Dec 2021 08:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236374.410029; Thu, 02 Dec 2021 08:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mshby-0006vk-0K; Thu, 02 Dec 2021 08:38:38 +0000
Received: by outflank-mailman (input) for mailman id 236374;
 Thu, 02 Dec 2021 08:38:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mshbw-0006vW-Qq
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 08:38:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c149025-534b-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 09:38:34 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-lkeTBcpGPJeWzjZu-hT8Aw-1; Thu, 02 Dec 2021 09:38:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 08:38:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 08:38:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0110.eurprd04.prod.outlook.com (2603:10a6:20b:31e::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Thu, 2 Dec 2021 08:38:29 +0000
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
X-Inumbo-ID: 3c149025-534b-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638434313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JDfG7QnuXIozd6Uo8+SLmF7kT7+FgiM2wu7/+Yt1e1g=;
	b=NhGLtFkckFYriZuiR7mREFn1hh1cpdoEodIAosXGQfFVwaFtItSV4na82IFuY2EY+7DzrV
	caUHPZWXAsEcXK50xzoutVGVSYS1EXlpaR57xHQeWfst0LMydtPvnKXLdi62A1KnCM5dS2
	KyAysDBC5ziA4OP9XhmxEbpix9N3sS4=
X-MC-Unique: lkeTBcpGPJeWzjZu-hT8Aw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpDEiTgh05EYqW437imef3e4tVSdqCyDdybM/p8DT//a0o/ac8g+/H4a3GX4mzCLZv4K0SjG8+y6u1HikKRA07qxkb+Eb7OQGdGeoAMU4CtgDCY7wum+YprDLQ0rvaZs/u600pQcX3XIn9Z/7pv0aFGXy41sfLPmkdnUDaz3Wy5Vxu5atBXz48CVJ8uSyqvXxwEpaBFk/YnDvjdOac90VaYUKYrkYFAwU7KyaL8uiB2Fkxi33+KSnMnulVWEk/S/Qi/agSrdvqLGYAeDrKHhntTcWGIrOF54O4J+3ogRW9sg/oI+a/vBneCYguoTbBQ555Ec+EhJhkA4svCW+EDGDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA0byD2VopeIeBF0nRYVB2hkxqPKiY6G5+0OQWwieOY=;
 b=JM52xS2P+jDsAB1cn09piXnyuHjSA/a3osqjWK60Ov520Nlb8ccXf5+JcDK8ZSF8IaEmEza1894S02DssTMkj4t76E37yLjJQygQdOISXPIl1A5lcNBEItJbNV2LrlnR9X1UILFY8HMKaOzvAf6dgcorcK86HSJwEhMZvEuaj/9elqWwjFPCI4/WNAuiMJx3+WOaJtMc3PBMCLFaT64ntQadB9nWd97gBtFMiwCaB0AOgqPKwkoq0gEevO73p8dOCpvn7xf9oO8bxLnv8GDSVvYhe73Sp4+BG33SwDFbAhM4/xZGkH2LRYo9zLuEg/ZV9ImuyAHG0H+IefCj2/Lg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3fb1cfc4-39df-16d9-0af1-1b226f7413da@suse.com>
Date: Thu, 2 Dec 2021 09:38:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] x86/paging: tidy paging_mfn_is_dirty()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <69b75eb5-82fe-e075-146a-28a9758da433@suse.com>
 <e5070cbe-949a-4913-1f99-7b7a4e6c5536@suse.com>
 <39afb361-4047-68d1-acdd-e0838f52cb5f@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <39afb361-4047-68d1-acdd-e0838f52cb5f@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0110.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b78d6dd-b4f3-4fe7-b550-08d9b56f1e75
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71509995F6A1D039C17D66C8B3699@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BSICfY1xcW0Dw9Q79eyBRO9HJf9rHV/h91SgPbGej6dzKp3wDv9oZJrHdIGvyOaaYif7sKbIvfjmCqh9ujeZ2pbyAKtCrC8vUkMbSRX/R2uyU4tdOiEPal+/QLD/PW9lF+t5254O6TpfXxnL5ddT7tSWL77+B0XnMx1Mc6PuIENznc3zuQ2ow0yMe1vIUH5QvzxwuKxFk15KSWdoi54t4GRmuJ+8cgCAzLJohixw+0JVQxBZLiGjj1FA4W/pvnlhK75TYiNgXK2ko+JWbWwA8xBzryY78EBKAu9DRmgHRu97jYWmyuBdxMCVMCQUHG7KcXh9R4Vod0Zck3c7cs3ctKYEhMmq2PwGf4hIfX+dZf/dqC7CR0v0Y3EvMWvQ0Aefhj3HzTFW/viCq1MgYkkzCxZxdqJDv6o8sHDLq6i5HSIXByxvRbC6zwSEAOYrwxxIId/4eDcRgr28fJmYEWYe60uT0gtF9qmupzyH+ZBM/e20UQTTPprkYyqI6eXfa6xE8NAMailQ/vUMOIhpFmnxLSUJraUXfwV1yF1sd9SG5QNHoJ4OBwwweBEnazD0lh0qIvLSjYAxYuv76TFYWzEgIj34S78A7iOseOQHOPJIzRGH+dmpFnjv0dRXslOjktND5KHll60JHcOy9OJvpNMMzT4cm3aeax9PG65npCJKCSeFlhRF7B+mL7j1Dl9qAmWRmQiq8unhRsjlLFThXwijVINirBC58Zm0ZhVNWTHdRNLNaYtCWaj9F88K7piHuxhP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(2616005)(16576012)(66476007)(31686004)(8676002)(508600001)(956004)(6486002)(316002)(186003)(86362001)(66946007)(4326008)(5660300002)(83380400001)(38100700002)(2906002)(53546011)(54906003)(8936002)(26005)(36756003)(6916009)(31696002)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vMGxCWT5J8EoGwUSoFXr72JnS+FSYBcMs4VfLmciJKfRmhbWsxzOsMsxJyJ+?=
 =?us-ascii?Q?2GNg3kQc+rzDiw+S1i3HRlVVwdt1qXH47lY1gupvkGvr0Wg8k/7B59mIfWtJ?=
 =?us-ascii?Q?VGUj3tVBJn+eNfx7qL3LkNW29lWAnj8M+CNCiGxvfjfh5VHxa37DxSPsMqjG?=
 =?us-ascii?Q?YHSV3bq7i3x51z9YvnxzvyCp/YYlgBNWyRujHgsMhHpsp0yMRdSNc31gHKyE?=
 =?us-ascii?Q?nwdT8YdPbHLPeluXB9wUyprWIZTiyMdCtUUlATHEeSIPCKX9rXEk0GENgkZY?=
 =?us-ascii?Q?q+RIaAkGOdaCqlasvvGT04XrBh/QBWh/+ifKUpigizR6Cd7TQwF2eiMh943h?=
 =?us-ascii?Q?D2evFf5pE3P4hmUn/0wWStEs4Jat9khrUD/dyypEcQiIqMJo5pN+v8BEguYw?=
 =?us-ascii?Q?hiVuCAawLoFR0LwbpbMWDkLeuSie4uT5NWmaHYJ8xaVVkSIPmMjoBpH3hlP3?=
 =?us-ascii?Q?v3vpcZLEk4dB3TatTitg2U6npvcxjOlt11HnlzGZXP0wzVkEWAVMHFSOWzAN?=
 =?us-ascii?Q?qZVdklndxW0S3AC4eCmFOP36CyUK2bNsETi588Qlj57YUZwKzSU2wU4EtR6T?=
 =?us-ascii?Q?thHNqjWaaYF67z1dtw1u7Dh1Y+EWbZP4NMMJWYmf6RKJLJdmQgCaYEKTk2ui?=
 =?us-ascii?Q?3IuMqhzoX6uVeBJccHr7ISfAbXzDtlPw9TtzdTO3ePA+L7Op91bKGLen7kw7?=
 =?us-ascii?Q?2LbUS0EE9a+MAkHG/54anSZnzP7axPbwq7e7FjiHGwvYqf93rONd6+HYqT7m?=
 =?us-ascii?Q?T7ooFP28V96GwX9Y7aHgqL2quMAN2eo8PPlbYlvuZyJaw6zaXMMC9590lTOO?=
 =?us-ascii?Q?i0982HIGewbgwxfYo/agwhYKYpui3yHTKDf7QSdGv+LCzlXRORJqE049U/v7?=
 =?us-ascii?Q?q6TugrjYO9UeykWVpl2Bt46DwYBtWmsBzASyP32BwDN+SKbeJkFPp7pL9I3F?=
 =?us-ascii?Q?6EVPUSu9ebkF5OyaXfRDY2U/rzCSw94HZxYirBUZnOLY1jQld1GklUxs4LpN?=
 =?us-ascii?Q?YMCOC1szKEwgzSPUqLuRyG6QwNx1l9GEDVinIwCb0lZ26Zh/GxOdw/Pbv3YS?=
 =?us-ascii?Q?v5fYBenTHMW1PdBR6mRx64P/xfVjnd8uYyfbFdKopkxg4xLolpurp4ppEUa9?=
 =?us-ascii?Q?Vnu1sqIrLSXDlKCh5s2YwqYdtwgYxdGcAZ7t4yFuY08Dfw1516PmhgKn8DiT?=
 =?us-ascii?Q?fvTE+msLVk8/82jGKiq8cBkcRswc9H/Rrcl3M2vbI4KGDKsnfVdjIR0kcIVF?=
 =?us-ascii?Q?mBtapfOMBEfPpENOU/ckPTH73TAdaBGaxTNcO4iVxw4dQPuDZBrIAz2SBmh/?=
 =?us-ascii?Q?UbXxQA66mgtS/oYSEPGLKRMsV4aK4/aUum4t9fojs3UjV/wLu060KB/qMd77?=
 =?us-ascii?Q?OQ/CvAVUAok8VmbUPfg5n44SBXlOByqR8cO9/KEvB8hG1PIvqDJFrWXMY3m8?=
 =?us-ascii?Q?rcaWZnlNLN+2Vv3VBZHMxQYyPDp3Hey9EQSnqcDQzY1qL7fnsP7fAgOiEoV2?=
 =?us-ascii?Q?sm/xGQl3qLv7bTkFcOEGESBLpgOtzpfJsb/bfQ2+hnVT1lFiXLEKGdeJ7z15?=
 =?us-ascii?Q?LD1c6RAJ2CaIUik2gfXEFdYdvfwSRZIip5EhIOzwytyuPro+yd3RQFC+z5DF?=
 =?us-ascii?Q?AXwJx4EX7rNJ7RJbCuouCoM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b78d6dd-b4f3-4fe7-b550-08d9b56f1e75
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 08:38:30.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyySnokAm8pyyXAQMBo63KCcoQhtyGGS++d+XDQypzU+QYK2TwamaSMcNeeQbs3Y7X8c4kZE053Vlv5ToBRB/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

On 01.12.2021 17:06, Andrew Cooper wrote:
> On 01/12/2021 10:35, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm/mm-locks.h
>> +++ b/xen/arch/x86/mm/mm-locks.h
>> @@ -40,7 +40,7 @@ static inline void mm_lock_init(mm_lock_
>>      l->unlock_level =3D 0;
>>  }
>> =20
>> -static inline int mm_locked_by_me(mm_lock_t *l)
>> +static inline int mm_locked_by_me(const mm_lock_t *l)
>=20
> bool too?

Oh, indeed. Will do.

>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -351,14 +351,14 @@ void paging_mark_dirty(struct domain *d,
>>      paging_mark_pfn_dirty(d, pfn);
>>  }
>> =20
>> -
>> +#ifdef CONFIG_SHADOW_PAGING
>>  /* Is this guest page dirty? */
>> -int paging_mfn_is_dirty(struct domain *d, mfn_t gmfn)
>> +bool paging_mfn_is_dirty(const struct domain *d, mfn_t gmfn)
>>  {
>>      pfn_t pfn;
>>      mfn_t mfn, *l4, *l3, *l2;
>>      unsigned long *l1;
>> -    int rv;
>> +    bool dirty;
>> =20
>>      ASSERT(paging_locked_by_me(d));
>>      ASSERT(paging_mode_log_dirty(d));
>> @@ -367,36 +367,37 @@ int paging_mfn_is_dirty(struct domain *d
>>      pfn =3D _pfn(get_gpfn_from_mfn(mfn_x(gmfn)));
>=20
> There's nothing inherently paging.c related about this function.=C2=A0
> Thoughts on moving the implementation across, rather than #ifdef-ing it?

I wouldn't strictly object to a move, but doing so would disconnect this
function from paging_mark_dirty() and other log-dirty code. Please
clarify whether you've explicitly considered this aspect when making the
suggestion (I did when deciding to use #ifdef-s).

Also, to make the changes reasonable to spot, that would be a separate
patch then.

> If not, can we at least correct gmfn to mfn here and in the prototype?

Hmm, that would incur further changes, which I'd prefer to avoid at this
point: The function already has a local variable named "mfn" (as can be
seen in context above).

I also don't see how this request is related to the question of moving
the function.

> Alternatively, do we want to start putting things like this in a real
> library so we can have the toolchain figure this out automatically?

I wouldn't want to go this far with a function like this one. To me it
doesn't feel like code which is actually=20

>>      /* Invalid pages can't be dirty. */
>>      if ( unlikely(!VALID_M2P(pfn_x(pfn))) )
>> -        return 0;
>> +        return false;
>> =20
>>      mfn =3D d->arch.paging.log_dirty.top;
>>      if ( !mfn_valid(mfn) )
>=20
> These don't need to be mfn_valid().=C2=A0 They can be checks against
> MFN_INVALID instead, because the logdirty bitmap is a Xen internal
> structure.
>=20
> In response to your comment in the previous patch, this would
> substantially reduce the overhead of paging_mark_pfn_dirty() and
> paging_mfn_is_dirty().

May I suggest that the conversion from mfn_valid() be a separate
topic and (set of) change(s)? I'd be happy to add a further patch
here to at least deal with its unnecessary uses on log_dirty.top
and alike. Of course such a change won't alter the "moderately
expensive" comment in the earlier patch - it'll be less expensive
then, but still not cheap. Even less so as soon as
map_domain_page() loses its shortcut in release builds (when the
direct map has disappeared).

Jan


