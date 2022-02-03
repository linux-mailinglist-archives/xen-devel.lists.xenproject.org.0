Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB544A823F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 11:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264594.457736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFZE1-0004NC-N5; Thu, 03 Feb 2022 10:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264594.457736; Thu, 03 Feb 2022 10:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFZE1-0004LD-JD; Thu, 03 Feb 2022 10:20:25 +0000
Received: by outflank-mailman (input) for mailman id 264594;
 Thu, 03 Feb 2022 10:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfZ=SS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFZE0-0004L7-Dh
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 10:20:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5481721-84da-11ec-8f75-fffcc8bd4f1a;
 Thu, 03 Feb 2022 11:20:22 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-JQsTC6oMPqeJrqtITfAGdA-1; Thu, 03 Feb 2022 11:20:21 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB6314.eurprd04.prod.outlook.com (2603:10a6:10:c3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 10:20:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 10:20:19 +0000
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
X-Inumbo-ID: e5481721-84da-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643883622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l9YYpd3DEdqXW/HSUagkh2HwS10lejt3JIfsjk9tLEQ=;
	b=ZNsrz4mD8ppsEYX4nNkoZ8ObOGZhiz//RziD7tFA+2iWmRk52GSWZbUCZKapGWWZGVGluS
	9kcBTXJ5U2T5f1+B7hqNAJkkizXOwXz7pg6nwZlMftByh/o2Ve71r5itZWIESw3Dvquk6o
	peJkPJxDrryIyOMJg52vqNXTI+Zzs0I=
X-MC-Unique: JQsTC6oMPqeJrqtITfAGdA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrnpmzOx5R27XyX1viaR4NyqVv4O7BbJV9ThH2gPRa0vpSJtIXYS7Gm+nv6Vg/M9Z4yx3J9OXlFMkHTOWvrmDK38ujkOhoQoOfPR6AZVin8fKlTXaORFUoReOnCx7yNInRbOnGCH6uEwl2gJuGoboHqkmHg5MpCmcuwALsNTOAUEaV+PSaWG/yjndbBHUZwsQyMZqB6WfeSk0R7/3ynIiwCsRb+BgN4OQ/XCZ+iIM00/Q/QJ9oGQYW82qWaFdBbhD/nU2vM4TtbSNlTAb+BwyyaKMFqDeASCZ77nlriq4i8Rdi/ZRdmT6WOhToSUhrnoqy+2XC1lAhmy6PLmbLupEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KryuYmF3kKXLUrAMriz9WqzzwxBTtYVk+FxcG7V2/Eg=;
 b=RAT2Jr6NLoctkO6KODAMlgNrShH6bs5zj1usKvBvxavVk9GZMU4h/1u1qxuQRCUgDXiv38FOcNF3NGETQOgcP/+lhaQs2uiVCAPGxZ3U/XvPq5e+cpdY2ry0kUvtr5L8JvucZdyDIEj8GgnNFSA3/VVhZEtTFBQ5nnG95+FSpmMy/Yy/yGxv4qfsjc9y8A7IoRT3oY7S3AerYJ6xRvZb7ZKkOTb14NlTnLxfp4Ip+nv+Glreyxoyb//Yt8KdDaKyFarcDSIvxeb/0ldfc7dE9SuQ5nGPH+qg8jLBgMrS1Fx/mdt+qb+DB6PJdAL080B1Z/XQ1JgGtRv1yglNj6o+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e835c3a-c22a-dd6b-b6f8-e6c22404b814@suse.com>
Date: Thu, 3 Feb 2022 11:20:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] IOMMU/x86: disallow device assignment to PoD
 guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
 <YfqtlZMAKd/HXsgf@Air-de-Roger>
 <2cd051c8-dac0-998c-cced-401c504ad439@suse.com>
 <Yfuahx0ntHJ2BQ6x@Air-de-Roger>
 <7c315902-e618-bba6-054d-86b0aa685370@suse.com>
 <Yful4oPqwzw3lsjp@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yful4oPqwzw3lsjp@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR03CA0030.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37f7aa05-61b8-4b5e-c034-08d9e6fec79d
X-MS-TrafficTypeDiagnostic: DBBPR04MB6314:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB6314CE39556EE29F4CBC6DC8B3289@DBBPR04MB6314.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4mQj80ThclEku/OxRbg7f3wuRoOnztca7/zEU4Z351wBS4LBaWULJy9yz8Qa/0Ip3gi0fQjxKK4CCbPzMkAkrXOTi9wbGbWLbZkPSd2qTaEGLKfOIxRwfKV/Ov91JWnQw7ZasLberTtOxeWzB8qATOAaO50Xhti+fJPrIf7zQvfpbBOXQv/zw0XfoEdOnmOj3EtyTAHpcrSrumxUT3YXIzd8tOwuFraxIsMLg3YDgojcOrcIqTQ3BGIABiVRcxKTjkGydBzspFnL66PWJZr7XBCgS6CC8pqzm4QkAsJ6fplKkHrNLPYE+UC1GRfN6ChgH0MPXKpfHsrFCTJkYbvOUWD0VvksNLwSbz7QjOi9d2Z3z7eLfEpGS7LC2BJ4GIVvY0ocXTA6vLMhYNFJjTJwQCTnemz0JTeEX4M9dXgMKyhIOksj7tlOXZQwgX8snVbOyXm0Iwi0D1vJtPFD/k8/0y7NEt363RwjRpWLntm+BJVX1nL04InrmodKdbtpjukQaw6UGEu7vjS7NUC3+XPrzfJ5pCXXn26LADEJBNffwe+2KoEWDx/EkMroD58mvZd2hw6Mu7xcpL1XwosFliJTwsMSmEVoAz1QWUaix0YYLUQp8ClRQKQSwO+JfAkiRNZl8MvxGKbe/RGjjruslz83bp3v/XvAwCCLBTzzdcMPy25Cj/pz1adP/QxWdafcFP9s+reQscwAkVVALcccV8emsYT3uBEzrl41xx61ObFTeUYMNc9qxM1MMG/onwBNeR4OTSXZL9lzx6VqsGLFeRNiGE4gwFmdSn0EHFvqXjIltGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(316002)(2906002)(6666004)(8676002)(6916009)(8936002)(66556008)(86362001)(53546011)(4326008)(66476007)(2616005)(26005)(186003)(6506007)(6512007)(31696002)(36756003)(508600001)(6486002)(54906003)(38100700002)(83380400001)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3bkbmLZwxNhJXToBeJRUfcAn0DOoqItRjC+GtgGpMuD69Tf+ohavi8UtypDW?=
 =?us-ascii?Q?O5Qsu4dfHUnHIpBedxiA9Rp25OxBkAP8AW8G2hV7sSEsqQWEKmqd3RLdN2hR?=
 =?us-ascii?Q?rr2mtWyG3snA++oNOyn1ti+esvvBeXdNvNpurRx6NU9nUONfrKYVDheAxfT6?=
 =?us-ascii?Q?4W59eBJ7iJQ2hHl6HMDrK1XATYZ8dvvpUWJVmeylD23xQyIbA0SIzTpCU0Om?=
 =?us-ascii?Q?gINMMREmbfXugObGGeaImXyve43zEaFqkSBsY5jtYScvm7OXNNJTFqY1vUyy?=
 =?us-ascii?Q?p4SaHmJGBJek48jfYWgyg1neyaZ3voPz8CjLmceeHWRJ6bwob6DBff8hrdEW?=
 =?us-ascii?Q?jKTkqbUQRIlWSTsGVlTYEzdvj4bdYl9vkkhuPCRRNQkOOyFlr4t2mU0q0COQ?=
 =?us-ascii?Q?qWMNysrwWyK1++bmVyWpM74/RF57VmCwHBxlz+z1t5xIses6XzcraDC1itn5?=
 =?us-ascii?Q?rWo+si0Qw/aFCmZrIEYEYf+znQSasA0CVc4LzvJhxUGZ2yLiWsvZpTsJIWfi?=
 =?us-ascii?Q?7i/SaOd/l7kz7yqeR3lvptoylJnYGiP9W4ikVlDrn2DzU6MwPhaWDFAdOHAh?=
 =?us-ascii?Q?SL0r+JomsKdEFEFh7kOw7xIMXL2hUELMP08QpcR2jCW/3QirCmaOzImz21Ai?=
 =?us-ascii?Q?dZGoH+X3AnImpZn+fO7TrcCL1S/TQzB7r+mU+UnYWDIRERb/kDCZLiJohYEa?=
 =?us-ascii?Q?5DCmGkgsIH9R2woaPx9qNHkcw6TUAJeH27FaAhmwWOZJeEPOT6+9b1iWjX/3?=
 =?us-ascii?Q?KNx90nJHe4MGXWil4kLOGJvZHfvnfA+NemBu8KpSD9CQNOP1rCxoe/HxpUnV?=
 =?us-ascii?Q?/vJrLZb+jLUgptEUGPlp0pTx9tTOGFrxOGC6SGiJH0joRD0pb14YKdfqWP1i?=
 =?us-ascii?Q?2YTKyKdnm104Osk2Ohli5qeKC/DR1ZCM18fNap1zPpAKo7HCervntrM6NEQH?=
 =?us-ascii?Q?t5aRFKRFxJ4fuGBg/9ZIDTWcjrriGvtROHrV1E0qh9GyHj3waClAmfZ0hxLv?=
 =?us-ascii?Q?L5c0AXwsJw1MhShtBBa3zCa2TyxwR05iBtfTtb2Nbmg6Sy/SK4l1wzTfTbNu?=
 =?us-ascii?Q?KPptR/aDhD0Nh0gSeqmci5d6j6PunkkrQMAdZNDaSsXTfx0aeyokl9ue+5yK?=
 =?us-ascii?Q?RPM89im9rt1oz6pxNdo6sb9gUaLH5rlI5wIkbs+BGDRhDbQVrRGbt/KlRl/W?=
 =?us-ascii?Q?TGf8zakGwINurchCsb3iLo/NVtqX7hfiaBDOYYutJhxdCX0UlEtguBZQ7dRR?=
 =?us-ascii?Q?EWoiGRl3/UVOwk0sLn7gaXBAgq18dHQHv214Dxb5E5/mL07X68vetfh7LeTG?=
 =?us-ascii?Q?iOWUj6DgDsoGqzs6WLw5blDB27hpLIsIDmvwHcusnPUO6LF3/gd/UBns1xz3?=
 =?us-ascii?Q?8Lgn54nbVBAKYPwZ2pb0IDYXlJ02tAbTmfdSguco6fZQsqUxM7sJu7B6FwJT?=
 =?us-ascii?Q?89ZXKzEHZJhonn+CHKfsHelTOVRpVS2Iu1UM7MjhLNj+4H1nDbnfptA/uURN?=
 =?us-ascii?Q?/aFWt9J/yim3asm53aAhQkfls9aBz314VbKAJd+JJVb7DavrBOPX0LFnKhr4?=
 =?us-ascii?Q?3MdOMtUKAgBEAQ9z0n9lfUe22+Wn6/r/XOoomRculPKdzhjBYM+j1u3dlrQ5?=
 =?us-ascii?Q?76VplVwwe1YhNKYc6CaBaPM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f7aa05-61b8-4b5e-c034-08d9e6fec79d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 10:20:19.6128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2sPpWFGHI+LV25v1z61udcDkL3nXHbUTHPg2YO3EFXCgCkYAd0IWeymHz8f3YaGD0zKVNeHjGuV7QpiH6x0LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6314

On 03.02.2022 10:52, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 03, 2022 at 10:21:54AM +0100, Jan Beulich wrote:
>> On 03.02.2022 10:04, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Feb 03, 2022 at 09:31:03AM +0100, Jan Beulich wrote:
>>>> On 02.02.2022 17:13, Roger Pau Monn=C3=A9 wrote:
>>>>> On Tue, Jan 04, 2022 at 10:41:32AM +0100, Jan Beulich wrote:
>>>>>> @@ -359,7 +360,10 @@ p2m_pod_set_mem_target(struct domain *d,
>>>>>> =20
>>>>>>      ASSERT( pod_target >=3D p2m->pod.count );
>>>>>> =20
>>>>>> -    ret =3D p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptibl=
e*/);
>>>>>> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
>>>>>
>>>>> Is it possible to have cache flush allowed without any PCI device
>>>>> assigned? AFAICT the iomem/ioport_caps would only get setup when ther=
e
>>>>> are device passed through?
>>>>
>>>> One can assign MMIO or ports to a guest the raw way. That's not
>>>> secure, but functionally explicitly permitted.
>>>>
>>>>> TBH I would be fine if we just say that PoD cannot be used in
>>>>> conjunction with an IOMMU, and just check for is_iommu_enable(d) here=
.
>>>>>
>>>>> I understand it's technically possible for PoD to be used together
>>>>> with a domain that will later get a device passed through once PoD is
>>>>> no longer in use, but I doubt there's much value in supporting that
>>>>> use case, and I fear we might be introducing corner cases that could
>>>>> create issues in the future. Overall I think it would be safer to jus=
t
>>>>> disable PoD in conjunction with an IOMMU.
>>>>
>>>> I consider it wrong to put in place such a restriction, but I could
>>>> perhaps accept you and Andrew thinking this way if this was the only
>>>> aspect playing into here. However, this would then want an equivalent
>>>> tools side check, and while hunting down where to make the change as
>>>> done here, I wasn't able to figure out where that alternative
>>>> adjustment would need doing. Hence I would possibly(!) buy into this
>>>> only if someone else took care of doing so properly in the tool stack
>>>> (including the emission of a sensible error message).
>>>
>>> What about the (completely untested) chunk below:
>>>
>>> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_c=
reate.c
>>> index d7a40d7550..e585ef4c5c 100644
>>> --- a/tools/libs/light/libxl_create.c
>>> +++ b/tools/libs/light/libxl_create.c
>>> @@ -1160,17 +1160,16 @@ int libxl__domain_config_setdefault(libxl__gc *=
gc,
>>>      pod_enabled =3D (d_config->c_info.type !=3D LIBXL_DOMAIN_TYPE_PV) =
&&
>>>          (d_config->b_info.target_memkb < d_config->b_info.max_memkb);
>>> =20
>>> -    /* We cannot have PoD and PCI device assignment at the same time
>>> +    /* We cannot have PoD and an active IOMMU at the same time
>>>       * for HVM guest. It was reported that IOMMU cannot work with PoD
>>>       * enabled because it needs to populated entire page table for
>>> -     * guest. To stay on the safe side, we disable PCI device
>>> -     * assignment when PoD is enabled.
>>> +     * guest.
>>>       */
>>>      if (d_config->c_info.type !=3D LIBXL_DOMAIN_TYPE_PV &&
>>> -        d_config->num_pcidevs && pod_enabled) {
>>> +        d_config->c_info.passthrough !=3D LIBXL_PASSTHROUGH_DISABLED &=
&
>>> +        pod_enabled) {
>>>          ret =3D ERROR_INVAL;
>>> -        LOGD(ERROR, domid,
>>> -             "PCI device assignment for HVM guest failed due to PoD en=
abled");
>>> +        LOGD(ERROR, domid, "IOMMU cannot be enabled together with PoD"=
);
>>>          goto error_out;
>>>      }
>>
>> Perhaps. Seeing this I actually recall coming across this check during
>> my investigation. Not changing it along the lines of what you do was
>> then really more because of me not being convinced of the extra
>> restriction; I clearly misremembered when writing the earlier reply.
>> If we were to do what you suggest, I'd like to ask that the comment be
>> changed differently, though: "We cannot ..." then isn't really true
>> anymore. We choose not to permit this mode; "cannot" only applies to
>> actual device assignment (and of course only as long as there aren't
>> restartable IOMMU faults).
>=20
> I'm fine with an adjusted wording here. This was mostly a placement
> suggestion, but I didn't gave much thought to the error message.

FTAOD: Are you going to transform this into a proper patch then? While
I wouldn't object to such a behavioral change, I also wouldn't want to
put my name under it. But if it went in, I think I might be able to
then drop the libxl adjustment from my patch.

Jan


