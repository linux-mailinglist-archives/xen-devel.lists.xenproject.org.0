Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20004F5DE7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 14:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299846.511086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc4y5-0002EV-Ce; Wed, 06 Apr 2022 12:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299846.511086; Wed, 06 Apr 2022 12:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc4y5-0002Cb-93; Wed, 06 Apr 2022 12:41:01 +0000
Received: by outflank-mailman (input) for mailman id 299846;
 Wed, 06 Apr 2022 12:41:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nc4y4-0002CV-62
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 12:41:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf12782c-b5a6-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 14:40:58 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2058.outbound.protection.outlook.com [104.47.0.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-o38sTySJO3q9nN48xkWhvA-1; Wed, 06 Apr 2022 14:40:56 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 12:40:53 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 12:40:53 +0000
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
X-Inumbo-ID: cf12782c-b5a6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649248858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EFJzJVPs8Ijlo09XzUn8PVH4pRfF8PYsLrSlY6Oe5IU=;
	b=ZmYKIttEAI/8Q+gPcftdB9JK9HMUHPjgv7iqoNNkVGeWNqSSrE8/rgelnwmKseGhDPRR1W
	39xuY0TMwI1tAS0uBOuo2Hw25W87F2I2h4AAVRMRp1BuFyzaQ7brj7TP0YJ3HZ3zYx8Rb8
	BAZWjbgACoPx5thtMGHVKxxDh6l4It4=
X-MC-Unique: o38sTySJO3q9nN48xkWhvA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ez/F1CYqt7ugyUYmlpZohsQ3K3Rb80rbVkAOprtQ4ZEnEnd+G4LexEOJEUSLrzDS2wBOgz/ybMuZVhrMswzvVpAuhwEJ7kSLiiCYOGmXZy5N6cX3+Xr9tk7dj+1e4jpRQMNzkiieWuCNK/CulLyda5kL/DgWGn/a/Z9I3Fnkj3plFiFr6F9ldtnJ8ZgCNcAWEr0D2IMslcBYhY27/ItGck1tJTpdoOc3gVK+NquKUs6GGR3tPlg4E3JDkcJpY7DBpvBj9HjqsFwP9+xVhpik2rNBBGI6gRTfIViiw/vthCmESnaQXmsF+/wZx+Meg1SNdUd+Xq9yvaKGz66K0mUyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y24sSMu6ZhudrtCdXDzRBAAbN9tYwKDDrju8+HNyFs0=;
 b=JpJH+699DFpJNYuqX1huJT36tMoEFTmtGdPsywuwPquYnaCIOGoa91l26W/H6TIvOtFZox30heTARmy726at173ILkxtP6dbqgoOiRthty3y6ASixb6kfpLJIr/pwLBhx4jsrk9cJQttcJKnJhJZ5eMHAETGZRgQw8Tp8Qq6hfsI2jjBXMZaReplzmFFkz0HQo3eM/BPBBCx5oBrGjaVRLZLeexSQh0ZTx8+ohZ+3UjyYq8eJ66UezQ3fUs+IPiBKNEHGwvOY+MZQmPATLvjFK0y+VQNrKAiT1+F56MzDs74RbBCdabyn+hoU/mfRF5xZ3TGzHHI2MBscQ0v6pfCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9186f2c-25a1-6d97-cac6-126bb32bd22b@suse.com>
Date: Wed, 6 Apr 2022 14:40:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 3/8] x86/EFI: retrieve EDID
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <c11d267f-f6b7-558f-18ce-2b081ae12427@suse.com>
 <YkwZnBIOQ/jwzq9Y@Air-de-Roger>
 <39640fec-de8d-0c5a-c9aa-daf83fb785b0@suse.com>
 <YkxkfbNpR7yfLP7W@Air-de-Roger>
 <17163e1a-6598-5949-47cc-eb9734bc69ac@suse.com>
 <Yk1erGso3rC68m/e@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yk1erGso3rC68m/e@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0054.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94166212-2db1-4cad-d210-08da17cab007
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB460587ACB00B86B0674F9539B3E79@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mqR6+Ac0PzCbVVJybRzYQBC6aI/B1yaQ8VolgUXq07wl4UZYmOfAqIP/C9WSEWabelWsZ2SnFZ13p6rMCf0AgpVLsEtKl2rFmXNxMqQLgKnGTeQOKtZffcGZJQ8E6N1t2TJrdkFQnUubfHoP/j33i2N1UduLExIGkX9OXVgYmDa6iBfdi13DG1msOAgURtStcmJltuLQKJOlNndVXTVTIOKUL81suDkZ6VLW0tnbKzC1Dyia9Tp2sarBBzewbHm/0SIPT7rEjQP2js7wBx/A6aI4s9AwuYvvv8eVhkXSWfA2TVkPHUW5JwPishECewUQCmmULL7pP0Q9CmLdv88foGU3EngBXKhcKccj8sUaRFjUaERik0NUYXxmH9MNAe7tnaX2EXYppiCrUyCOmrYW+YjCB9df0GG/Urpy12jikpbRJzHzA8VIMHYTvAHikcFmT8t2CD7aapiWyTtqbjEUJYtrZlHqWPxNtVLObq06JZwImvuBP7Zlqe8UMTBM7NpHIMO3FNQlRRppHqCmBpWu6+cbVosDB+8cbEGQdYzgCsK13lNYspiGLV2I4tEA8EYzgBTdmVkMLB/7vS9jMrd9ae0gVvrm/eCPJ8m20qPBu2f4WjvTiF7Le2DuhobHAWnNOF2mOpK/HcQ8TvCxnfZ/SEC5FBtqRj6fqDBChyloW1yCEkb2xZTOZhZpnXBLVv7H6VTnjsNdiSUOVck29II8ebo3upORb2uiyvIPHsD6TsE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(2616005)(6486002)(53546011)(86362001)(2906002)(508600001)(38100700002)(31696002)(5660300002)(6506007)(6512007)(36756003)(186003)(83380400001)(26005)(6916009)(8676002)(316002)(66946007)(66476007)(4326008)(66556008)(31686004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?czKZ5XKmI3sfMwGOsFdP9Xz9koxYAWD+yKE7TcX6ajv+WdcJiYWXjA5XgNXM?=
 =?us-ascii?Q?GwktiH6+bWo0XKWSegiUR/VOAydxyPbVH8KEE6okRrZ8JDXR38t8FGMNNECa?=
 =?us-ascii?Q?5s9Cr78pu/nLHAkPcbj+kxUe96RGR5JipygCmPCzO46G09CuRoDPgFXRgSSh?=
 =?us-ascii?Q?UjxxWnCxeU29LmCQ3p7Qr694vpL9GC0g8XfD3GMGyAp+fgkeJ/4jKQABYdAn?=
 =?us-ascii?Q?eH+NSKofGop78om3aIf+h/X8jBqhFYW8TzK9+ZYaavPL/+Oi1RxK1Q+y66oT?=
 =?us-ascii?Q?1cY5eUbdfuR5LRdTATcqRBbabPySUzPcMYAjfOvkV9HMWFZ5c7U4RTuePAv4?=
 =?us-ascii?Q?87W0IMRC9zDMH8jegGLadYf1qY4dBfuyBph6fyIuS+0sd1LJiHs+8tIfntmw?=
 =?us-ascii?Q?77eFmDubGVRkOQe60Zu1R5Yo7pRUXAsyFTY1NFA4qDmk98zEYlcPz7paDM0E?=
 =?us-ascii?Q?f/G1WHMSa5SNa6dFQHRh2bUq1HiKv9ByCJromObTsoZoyHQ8ZM6HA50ZfDKp?=
 =?us-ascii?Q?mmxV6++Sfk0QFEb3Gnabg25/P5kKDzyUmJZA72TWne4HVW3ukG6NgdG8GHxF?=
 =?us-ascii?Q?ARACvA6rnjdquyK6iaGPW/2+1hMPqqrUeUOq93mPbB5UovgQDbgAuoPHl5my?=
 =?us-ascii?Q?+PVrqr5qCKJSrZOqkMTLakGhSWjC3rKvORJMDrZrBFcJhPe2dQBBrxr/lf6Q?=
 =?us-ascii?Q?aSmtr6SISClzrYT6RGhPbTxS5mWu9IT0/KNffPXTNWI25ywt/5jtFu+8VtzZ?=
 =?us-ascii?Q?3i2kEi1Mk1gceohUX8q2XxIxAUtHuOF5g3OBWY1zSKVbLWIgzVU/yycL+VVH?=
 =?us-ascii?Q?0kLlacdoy07rEcmv+czw4Oy/DpnOe1SdLZUfLBQpH2XdXt5wt9wvRNAL6yO/?=
 =?us-ascii?Q?AieNfqGQtAJUMTY+j5nWjxorgUcdG+deoN/ZC4fHVVwYJiM/u+x0VFMoHRuJ?=
 =?us-ascii?Q?AOXKLfWUZGR1KCs/HbA+UZijig1P1WGKjN3g6z79vuMdcqMtn5aJzKdgLQVG?=
 =?us-ascii?Q?iWpbSKCiemba3Q9QHGSnb0OfbnpUroRmW8jhc0Hjd4RPqRZLdbjEULsSOYxW?=
 =?us-ascii?Q?pl16iwN9SXAz9LroIIyttduwZncs/E9ljQvnOta3wM0QJA+hJS64F90DOxF9?=
 =?us-ascii?Q?sZShuftBKy5wJfSuPErbIYNQHhe9pH/xbrgDz82DYjW6Syp11eTTfTSi5jcZ?=
 =?us-ascii?Q?nT2zeNGjCxKwh1C08Ls3V+O50ONtVvRxOp8JhnyHy67XFEIYQYnp7LqmXDdC?=
 =?us-ascii?Q?9LzfNJjrO/3zJOTkUCNA2lCEPRQZVOJKK18uN0pdLqaSHfg7L2NHRUyZKhDq?=
 =?us-ascii?Q?RgflSd2opwdmi8aR09tCqPu4L7OSIsLxqYU1Hfi4yclpWKe+McdYI/ru7HL1?=
 =?us-ascii?Q?cdNeuk0Zj+8obaqkcZZ51etiMV7Ocr8ORGUO0fnFMlWFJpbieLsSAL/NyGVr?=
 =?us-ascii?Q?Cu4wE2AmL/Xb58H5NBJFWFSeAWRhXyHGfWcw/22IO+cYiPDyRLih8s2KNSF8?=
 =?us-ascii?Q?lyzRflrC9cCateV/HwdKlHLqiVGvOQtN4ktg36AEkcnmSkerg8SBPHeG19ek?=
 =?us-ascii?Q?ysj429xuKdQcmDMERTYZcA5WXOjoElDJDlXW6rSbJK2rSlhaRn8KBnI4LAZZ?=
 =?us-ascii?Q?/Por+4I2dc21TOdi9J8wlaHvPV7CN3eDXD4zQmrkcL2W43JoqWn4SgsoBBXi?=
 =?us-ascii?Q?p+mOT8E8XVtRvdHqmV5/9soIISE2pQsscAyk3cjKSjR6FSbfEBxxWySQxgVq?=
 =?us-ascii?Q?Fd3TXo6+fQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94166212-2db1-4cad-d210-08da17cab007
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 12:40:53.3449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXqqoPsrfNDGo4b1gy2YKDdBNwXkeNEv3KZPNATdlKzFaFtogGOkWrsy7dNlF6Q5b92yHEbJ4a7DyZlE/93fBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 06.04.2022 11:34, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 06, 2022 at 10:44:12AM +0200, Jan Beulich wrote:
>> On 05.04.2022 17:47, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Apr 05, 2022 at 04:36:53PM +0200, Jan Beulich wrote:
>>>> On 05.04.2022 12:27, Roger Pau Monn=C3=A9 wrote:
>>>>> On Thu, Mar 31, 2022 at 11:45:36AM +0200, Jan Beulich wrote:
>>>>>> +    EFI_EDID_ACTIVE_PROTOCOL *active_edid;
>>>>>> +    EFI_EDID_DISCOVERED_PROTOCOL *discovered_edid;
>>>>>> +    EFI_STATUS status;
>>>>>> +
>>>>>> +    status =3D efi_bs->OpenProtocol(gop_handle, &active_guid,
>>>>>> +                                  (void **)&active_edid, efi_ih, NU=
LL,
>>>>>> +                                  EFI_OPEN_PROTOCOL_GET_PROTOCOL);
>>>>>> +    if ( status =3D=3D EFI_SUCCESS &&
>>>>>> +         copy_edid(active_edid->Edid, active_edid->SizeOfEdid) )
>>>>>> +        return;
>>>>>
>>>>> Isn't it enough to just call EFI_EDID_ACTIVE_PROTOCOL_GUID?
>>>>>
>>>>> From my reading of the UEFI spec this will either return
>>>>> EFI_EDID_OVERRIDE_PROTOCOL_GUID or EFI_EDID_DISCOVERED_PROTOCOL_GUID.
>>>>> If EFI_EDID_OVERRIDE_PROTOCOL is set it must be used, and hence
>>>>> falling back to EFI_EDID_DISCOVERED_PROTOCOL_GUID if
>>>>> EFI_EDID_ACTIVE_PROTOCOL_GUID cannot be parsed would likely mean
>>>>> ignoring EFI_EDID_OVERRIDE_PROTOCOL?
>>>>
>>>> That's the theory. As per one of the post-commit-message remarks I had
>>>> looked at what GrUB does, and I decided to follow its behavior in this
>>>> regard, assuming they do what they do to work around quirks. As said
>>>> in the remark, I didn't want to go as far as also cloning their use of
>>>> the undocumented (afaik) "agp-internal-edid" variable.
>>
>> Actually it's a little different, as I realized while re-checking in
>> order to reply to your request below. While GrUB looks to use this
>> only "just in case", our use is actually to also cope with failure
>> in copy_edid(): In case the overridden EDID doesn't match the size
>> constraint (which is more strict than GrUB's), we would retry with
>> the "discovered" one in the hope that its size is okay.
>=20
> Hm, the specification states in EFI_EDID_OVERRIDE_PROTOCOL.GetEdid that:
>=20
> "Returns EDID values and attributes that the Video BIOS must use"

I'm tempted to say "We're not the Video BIOS." ;-)

> And since EFI_EDID_ACTIVE_PROTOCOL will return
> EFI_EDID_OVERRIDE_PROTOCOL if present it makes me wonder whether it's
> fine to resort to EFI_EDID_DISCOVERED_PROTOCOL if the problem is not
> the call itself failing, but Xen failing to parse the result (because
> of the usage of must in the sentence).
>=20
> I think it's fine to resort to EFI_EDID_DISCOVERED_PROTOCOL if
> EFI_EDID_ACTIVE_PROTOCOL fails, but it's likely not if the call
> succeeds but it's Xen the one failing to parse the result.
>=20
>>> Could you add this as a comment here? So it's not lost on commit as
>>> being just a post-commit log remark.
>>
>> As a result I'm unsure of the value of a comment here going beyond
>> what the comment in copy_edid() already says. For now I've added
>>
>>     /*
>>      * In case an override is in place which doesn't fit copy_edid(), al=
so try
>>      * obtaining the discovered EDID in the hope that it's better than n=
othing.
>>      */
>=20
> I think the comment is fine, but as mentioned above I wonder whether
> by failing to parse the EDID from EFI_EDID_ACTIVE_PROTOCOL and
> resorting to EFI_EDID_DISCOVERED_PROTOCOL we could be screwing the
> system more than by simply failing to get video output, hence I
> think a more conservative approach might be to just use
> EFI_EDID_DISCOVERED_PROTOCOL if EFI_EDID_ACTIVE_PROTOCOL fails.
>=20
> As with firmware, this should mostly mimic what others do in order to
> be on the safe side, so if GrUB does so we should likely follow suit.

But they're careless in other ways; I don't want to mimic that. I would
assume (or at least hope) that a discovered EDID still fits the system,
perhaps not as optimally as a subsequently installed override. But then
I also lack sufficient knowledge on all aspects which EDID may be
relevant for, so it's all guesswork anyway afaic.

Jan


