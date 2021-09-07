Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E024402C41
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 17:57:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181187.328225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNdTL-0005qR-NZ; Tue, 07 Sep 2021 15:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181187.328225; Tue, 07 Sep 2021 15:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNdTL-0005nk-KR; Tue, 07 Sep 2021 15:57:19 +0000
Received: by outflank-mailman (input) for mailman id 181187;
 Tue, 07 Sep 2021 15:57:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNdTK-0005nb-Bs
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 15:57:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45e2d060-0ff4-11ec-b10b-12813bfff9fa;
 Tue, 07 Sep 2021 15:57:16 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-a6zWnPUFMfahP0fn_KPTRQ-1; Tue, 07 Sep 2021 17:57:14 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3773.eurprd04.prod.outlook.com (2603:10a6:803:1c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 15:57:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 15:57:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22 via Frontend Transport; Tue, 7 Sep 2021 15:57:12 +0000
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
X-Inumbo-ID: 45e2d060-0ff4-11ec-b10b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631030235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3em18/5I60ro58fWzw7m4WZD8kA9dd11ewhblexpUAc=;
	b=W7JkEt7mqQxUofae3Gvi0oKNuAFHeAPAcEuLlTFjWb4f3C9mrUfC8fhX2x/ldJPN60UFMS
	7uHvVCZbtjBGwaNFMDq++Qzq8yNo3m27I7+DALfszTksKRYOl6FcLX4/y44+T35HsJHd4c
	lQGP7U6Owhq47rqrkeOOw6jz5gUt+n4=
X-MC-Unique: a6zWnPUFMfahP0fn_KPTRQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpoW4jOkG792Rsx+dZiz6nck9Pva6+FaiX24JBxU1GgOSIQ+oYipDalrXbT68eQPadgNVLnn1wpN/DD3aMJsy+r7wXbSU3unAwuLyBA/eZ+Gr/cc63I8noTm4kfb5jUzJHa6nAH9nT76KWESGwlE/kdboRCBJx7XaB+PqrAnAoYZ9SS7mPpz5emJRwUtTEzcLVgsQwmc5Lw7wtm6swmWFPgYjdMrk+DdVY6O/CXDoyOYRSgLq3P26cLk2T47mMz+UWKwUQc/6I+wO0gThWZeiMBLqiKH9swvW/Qb/xWXOs/WmaMFWT8FhMrxX6M4WpZ5j7vtjenJUzw1Q0tIH9yckg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3em18/5I60ro58fWzw7m4WZD8kA9dd11ewhblexpUAc=;
 b=if4/rzahEFo09d7dOQ7Io9ZebCIXM9vZmBMPeMIaoLCenDifVp+lo1CV3nD79TUbNQk/pTjVwaY0tX3LPmpodz0L+57PMwm2Gc3vWOba3RvJFZimvP10aB7LcA2bUa7AJ7q1CR5RvRAxQ60wPq2PZsviHKfe6Pu8FkI2mXMEXIznSpDqV6xQEYe5RWK7bpLwKN/JfidFE5np+3P+dvuivZoMboGqfV+auVaOUpWRidAwMsXhESk4LLHmTA6Wb5UWs0X0r5E8ICnZyhqA47z1qa3mTiqmyMQiEBDRlZhj/npqFbwFTWNLbNrtVbq6w0y8LEHnbsHeockrzK76c6COYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: HVM/PVH Balloon crash
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <YTVAT0CQD9cPyyDF@mattapan.m5p.com>
 <84d9137e-a268-c3d8-57d2-76fb596e00d3@suse.com>
 <YTZ+XsnoKNnV4IOz@mattapan.m5p.com>
 <1b3d4cb1-ba61-0f61-5097-9978462a2401@suse.com>
 <YTd/SFtvuzejeiik@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <935dc03f-74f5-4b49-3a45-71148364fb5a@suse.com>
Date: Tue, 7 Sep 2021 17:57:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTd/SFtvuzejeiik@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0028.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 846c4bf9-f7fc-474c-a1d5-08d972182823
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3773:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB37738A57BC3B9D40243D4FB9B3D39@VI1PR0402MB3773.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d0mRHbZmgAh5qW+PhDiGMMNv946vWuZ0u1m+5/CyUf9pAuHSvPe/VQcfPQhAcwrKLTgnpZ07Tpac015kwc0vb8lDBrGETZZyqFXPbxTEveAYlt67g1M7te55uxKrgjIwL09V5w0cLbCb851fWcxndHpxi42/+HptRwZNe8N40G0YCQqZrO5wOqg1MVuM5sz5V8iq5nPAcCRq6dmixmep4kmIPDeLdLZu6TLIY1x2qc0XetUSdS9exaE7o1bvwfXrlS+lkrmVVwRUgK9beg0tgDR9pQHf36YsoGYSu178xlJAneGQL3X+BWSWSdlc3zbpE8v8B89PQJRQRCT7iZOK33OSSvydCs2YHHrpfOw+1iWOE/c3TOKtyEvHxVf1K3o7B1hV3KCkep4kdFe5QXEdByk0CCwzyz0voPuC+J2rteFaWOdSWPqEyOL5dU6dM4D8SIXeFeyKRPv87oETPOJ2t60lzfHHKaowkfzx6ibXMEuGSd92rWv9vFqNGbdQgnJwUsbb+Yw73WtYBqAnmdVDa3DIk9XdWiBCcZHBA4yW56wmx62URA+bqmxrt6kHg6Uc30fpyusKiwTQE45EBAu5iqpWRU/CjFb1qY8Gmj0mL5MSd60eDjVLs2QaQiNj9Nm2516ozVg4lgfn665Pma0iIOorx78qyqdEpHQr7IRDIZM2DrrcQcPOMulU9vetwnBE8cC8uHlFfkSnI9X8ko5uUW4TEx46KcvmRONPzkwEhOcBjtjM02CLQMpslHpNwIMj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(2906002)(26005)(8676002)(508600001)(38100700002)(3480700007)(31696002)(86362001)(6486002)(4326008)(83380400001)(5660300002)(53546011)(8936002)(31686004)(36756003)(186003)(66476007)(316002)(16576012)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWFCNld3M1R1VUdObVc0ZVAwbkFXYUJxd21zd01YQ2xoUHNkWForUERUZkY5?=
 =?utf-8?B?ZFdvbUZpQXFiVGd2TEswTTdvSmFvME5PZFJRZWhBT2VWR0lLM2NMd0pWUTg3?=
 =?utf-8?B?QzdUMENjbXhPN05PN1NXUUVFUjRFWldqZU5QVEtiVW5LN1ZxVTc5MHRQSVY5?=
 =?utf-8?B?Z1N4amRoKzE0WjlKcEhheEUxQWc4VzU3Zm9DZjRRR24zRHA5c2JsdGtZbGF6?=
 =?utf-8?B?aWxTbEI4WllYbnJoTkZsQ3NMMUJ3Rm5mMWhGcEJETGhlN0ZJR2VxdHlkRFlH?=
 =?utf-8?B?MW8wS1ltS0VHWXVKK2F2QWhySThjbmxlaGZxVy91TjhzcmxMeUNRSUkwUy9T?=
 =?utf-8?B?NEQwaEwvOUlXMVY0V0VDR2MrNFJpWnh3TzJpZnpPUGlEdkZCZXd0SmQ3U3Rs?=
 =?utf-8?B?T213aUIveFVCU0EwWExSeEpIQ2dKRGthdFdOb1F5NEh1eTZwM1JLMDd6RkNw?=
 =?utf-8?B?Y0tta3JuY1FkOHFmcCtZbmFLVjZEMytFYlorZmRaSjdlSDQ0ckJJbUZWakRw?=
 =?utf-8?B?QWJ1SGtFUUIrUi95SklCVFg0bUNjSThYZWY3bXFwYjN2NjdvRXBqUmN4VTIx?=
 =?utf-8?B?ZzdjckFpY2E1SkowdWt2ZkpSRG9JeSt2S2thNzRhSUdpTGpJOGM1aThGajR5?=
 =?utf-8?B?RDM4bktKQmt6VjNxT2QzZ0xISjlxR2RuMHNCWUFJd2phQUY4amFiMmE2TGw3?=
 =?utf-8?B?Yit0b3ZlMVE4aGZZemxIQklVVzN1eGx4N09qMm9Rc1h2anpGcTFZNzllZjI5?=
 =?utf-8?B?NmViQno1L2h0T3VMQkUrZ0Q5ODVnSlNoUGdEc2ExdHBnWjVJaHRaN3ZNc2RV?=
 =?utf-8?B?QWdacEhFV2NaaWpvMzRyMGRIVm1FOXdOUmlpVEMwOGRKbXl1NGFsYnc1RUky?=
 =?utf-8?B?RnJXQ0xIOG83L2Q5K1M0RitZMEVtS3dsMExCbWNwQ05xZ1B5NHhaSko5cVA3?=
 =?utf-8?B?S21POG1kTXJoVnJNTksxR052MFdzdlRxTlEwbVFMWEg4QWV2eHJWeGQ2TmRE?=
 =?utf-8?B?bDdoU3pRYzNrRnBieTlLNkN1bFluYlUwazVlS1dtWndQUmlQNk9qcEhWNlJJ?=
 =?utf-8?B?a2ttV3Q0b1lzT0paQWdrczd3aWN4Q0JpdTIxcHJkZ3ZvVzlyRkR5aTBENENt?=
 =?utf-8?B?VzhmcFVHN2MvSmp1ZG5sVTZ2M0tGcTYxQ2dvaVNwZVdKMWo2Wm1hdm1jb24w?=
 =?utf-8?B?STJORXRmamlsbHdLZFJBdWZJUTR1Nm5OYW12ZnM1Zm1jenRtYjBFLzA2SmUw?=
 =?utf-8?B?Y1JKbWc2MHpkTXd1QS94eEk0R0djWUhGeVRpbjh3dW0rajczZ05TS1hIMXhF?=
 =?utf-8?B?b2hQOVdZbjJ5WFZobEJ2ekVQQjhnZUlGVEdlS1RCaGF0bzF6UmxRU0xFekdl?=
 =?utf-8?B?RG5BajE0V01JNThDYURMb1hmODA2aEVPUzN0Vi9Ib0JCSHdlc2xEdktOczNh?=
 =?utf-8?B?ZGVxR0FHTmw0S1pPM0s3ZVg3TlN5Rk1NM1ZkVjdKN1pGOU81bXFVb2dCbFIw?=
 =?utf-8?B?WXpTSGs2UzNoc05DR09ybTBWNmtBRFpCdGZNQW1ESW93N1lHaFJDWklFTDRt?=
 =?utf-8?B?N05HbmtIckoxa1RZUVZwQWpnWjRDcnhXZFVkK2hGWUhtYmhtM2MwZXBEN2ww?=
 =?utf-8?B?ME10dXZVYXVEM3lCM1pOM0lmOStuOWY1RVBDbWgwY29FN2xyNTZRZXMwV2x6?=
 =?utf-8?B?ZWdyNE5ERFdmNlpxS1JoU3VPZGFtNVI5K3pVQVJUV1NoRUNLd1Q2MHJPdE1m?=
 =?utf-8?Q?eATeJTxVDjgAQOx3Nm5p4wcSNIo7+K4XVT8xE4W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 846c4bf9-f7fc-474c-a1d5-08d972182823
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 15:57:13.0059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrwKDx90gigXjgsT5XnkrEZ1dzmNZNpHrJi2GedM66wGUuT6+m963HpPLdLY9p9zMzeYFGrnNC2ugznAiky7Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3773

On 07.09.2021 17:03, Elliott Mitchell wrote:
> On Tue, Sep 07, 2021 at 10:03:51AM +0200, Jan Beulich wrote:
>> On 06.09.2021 22:47, Elliott Mitchell wrote:
>>> On Mon, Sep 06, 2021 at 09:52:17AM +0200, Jan Beulich wrote:
>>>> On 06.09.2021 00:10, Elliott Mitchell wrote:
>>>>> I brought this up a while back, but it still appears to be present and
>>>>> the latest observations appear rather serious.
>>>>>
>>>>> I'm unsure of the entire set of conditions for reproduction.
>>>>>
>>>>> Domain 0 on this machine is PV (I think the BIOS enables the IOMMU, but
>>>>> this is an older AMD IOMMU).
>>>>>
>>>>> This has been confirmed with Xen 4.11 and Xen 4.14.  This includes
>>>>> Debian's patches, but those are mostly backports or environment
>>>>> adjustments.
>>>>>
>>>>> Domain 0 is presently using a 4.19 kernel.
>>>>>
>>>>> The trigger is creating a HVM or PVH domain where memory does not equal
>>>>> maxmem.
>>>>
>>>> I take it you refer to "[PATCH] x86/pod: Do not fragment PoD memory
>>>> allocations" submitted very early this year? There you said the issue
>>>> was with a guest's maxmem exceeding host memory size. Here you seem to
>>>> be talking of PoD in its normal form of use. Personally I uses this
>>>> all the time (unless enabling PCI pass-through for a guest, for being
>>>> incompatible). I've not observed any badness as severe as you've
>>>> described.
>>>
>>> I've got very little idea what is occurring as I'm expecting to be doing
>>> ARM debugging, not x86 debugging.
>>>
>>> I was starting to wonder whether this was widespread or not.  As such I
>>> was reporting the factors which might be different in my environment.
>>>
>>> The one which sticks out is the computer has an older AMD processor (you
>>> a 100% Intel shop?).
>>
>> No, AMD is as relevant to us as is Intel.
>>
>>>  The processor has the AMD NPT feature, but a very
>>> early/limited IOMMU (according to Linux "AMD IOMMUv2 functionality not
>>> available").
>>>
>>> Xen 4.14 refused to load the Domain 0 kernel as PVH (not enough of an
>>> IOMMU).
>>
>> That sounds odd at the first glance - PVH simply requires that there be
>> an (enabled) IOMMU. Hence the only thing I could imagine is that Xen
>> doesn't enable the IOMMU in the first place for some reason.
> 
> Doesn't seem that odd to me.  I don't know the differences between the
> first and second versions of the AMD IOMMU, but could well be v1 was
> judged not to have enough functionality to bother with.
> 
> What this does make me wonder is, how much testing was done on systems
> with functioning NPT, but disabled IOMMU?

No idea. During development is may happen (rarely) that one disables
the IOMMU on purpose. Beyond that - can't tell.

>  Could be this system is in an
> intergenerational hole, and some spot in the PVH/HVM code makes an
> assumption of the presence of NPT guarantees presence of an operational
> IOMMU.  Otherwise if there was some copy and paste while writing IOMMU
> code, some portion of the IOMMU code might be checking for presence of
> NPT instead of presence of IOMMU.

This is all very speculative; I consider what you suspect not very likely,
but also not entirely impossible. This is not the least because for a
long time we've been running without shared page tables on AMD.

I'm afraid without technical data and without knowing how to repro, I
don't see a way forward here.

Jan


