Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F074B50D6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271613.466151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJaux-0005hx-Gh; Mon, 14 Feb 2022 12:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271613.466151; Mon, 14 Feb 2022 12:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJaux-0005f4-CD; Mon, 14 Feb 2022 12:57:23 +0000
Received: by outflank-mailman (input) for mailman id 271613;
 Mon, 14 Feb 2022 12:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJauv-0004Ma-EA
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:57:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4f4b743-8d95-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 13:57:20 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-YXPeW93cNOGkLQFBmqLdxg-1; Mon, 14 Feb 2022 13:57:18 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8183.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 12:57:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 12:57:16 +0000
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
X-Inumbo-ID: a4f4b743-8d95-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644843439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=croPqHmKXJWdBJGLCGtqbEztezFkGS/M7os30l5spW0=;
	b=FjA+UZHp2F1untA78c1Hvz5VHN0v2lpIDc5k/TBGOpjJtaRv8uhsvItvxfcl34FEvSBWvz
	LjXtAONcJxJAGhaucM01Q701/aM5/p2RLcBcaCaVSRbGlmbo5EZ+WVpY72ahM1teHE3Ez4
	5zsCAc8s3vvZS+1lR+4UQBMIUdot8Fs=
X-MC-Unique: YXPeW93cNOGkLQFBmqLdxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCzn+Mvln+ELbUwR400W/fGkwfyJjziEWdTikok9J6SBH+ctjJLurXhnDFxLrAv6ZWAgaUY5wJRWkYRU3+x+cKgpxATrP26hpskluWozaIL87k9mzaG710fgWAr5FIy+f2aLMYzmiBNtdCISvuQCxV2LjZ+HQtwiFifWiOdXYG6mjGsi3JOGJvg/0rFq3QC9rtJ+Kg52Hrdjrrm32d/f49HJVzXAduUDLnoWJYOBMgAwghZLSnGA9EzhWRqGWYHoDTcBTJXp6U2bTeE++sapUm1C11mka8RRaIxSE8YGJ8t5yp6+dVLJJ058ch2bZal+AiIJMZCP+6uWF+PEvzEH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yPHLHgmeOQcF1O/ZYWrADpmncFcloF/qTgxcvIwOCM=;
 b=MXjCfKYTNWyxXqB2jtOtpEZ2VEZ9HCiVYdWb76sJzT50s9hQsqV4SgCqoR2xGmLxN+Kne+sj3yVw+hOLbbDPR2tkSUkM/FrE9ZS+tzBI2jjXXedeDDwn30wwfZ2SUzOfh9WDjkPPjoq/5zcLfKJ0wchkM5btXTSKVq3MLUUxeoapfyqO98QUPXYl/UvPXaZ//C20eyvRvQYte+Dfwt5W6wQh4F3gisAaJphVxd3lzX7YRT9piqqphSlGKTSTOML4OV3OdS3WPra07+7EtfrzTr6bClN50/PP5tT09XM0N3VAAUaufaKrm3ia7dW0zQpfB++JfzQX15x79z6wBoFtbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06baf0c8-d7d2-50b8-ea8f-1d422ceac728@suse.com>
Date: Mon, 14 Feb 2022 13:57:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
 <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
 <Ygo40L4dMPJjZKRF@Air-de-Roger>
 <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
 <Ygo8M3Y6BLzljn15@Air-de-Roger>
 <114b8578-ee13-b67d-e282-d060187ef509@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <114b8578-ee13-b67d-e282-d060187ef509@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0131.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82237423-8b43-41af-7945-08d9efb986cb
X-MS-TrafficTypeDiagnostic: AS8PR04MB8183:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8183CC71CA56D4AD68BC0A06B3339@AS8PR04MB8183.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Or3ANhP0D4E4oj+e3j+KW+BfG5asaVJpSbb1FcyEOQ6drfJ7vOqliX0oYnSEphgtxlU4D0hba1g/NDZ23AOvMLTklL9RgwKpNFc8dRwmjV7P5HtWj26rn+EBWC7Z+L7Isjp7SAFgvnbdhzMaWnZkBWPj+6QqtMVJ8JIM4xCuur/+xNbmOdH6IVVdY6edz5rkk629p9MpJ0xHt9Ljhq969f8R/cOzvPg2xgovKMd7Xq/XWYM0z+bHzaX5qeQBvoPEVF7ymLHWuMgvjdzShsVqTkA7opHC7HuDh8lLz8PsfPeltrzokmtsq1Eulyf4/J5L35VD9DdR48qTx/INJhyedN4lx5X9rNCbvlnSjvA7nNHk3z6+qzQeAWGeTJRm1MK5n3KPZ3DvSkxyViTGTVa1RQTQgcqDvmmTo2Ou1troNy1opgTjRSRnGPkYHUlt/mRIcknEp1JhIe4Com5FHdkFm8hUwqMBpqbTyWzchIUUi9tUp9WP4snNpeTGVFsoQ0zApqbDl/SsWjhNCDhboZIILRz26odFhZgsL5m5puW5A8DXIvwbijrAvxDe8eC3f4Pondpx1ADRSYqS/T0ZMYWEVTVl0OmQEoAskWFZ7UXxf+flKmYPh598cbYKzT24jiPHDBgBNRowHSvXm71gUsKzhP1Beh1RmPOWeDj39kc3T0Dq+ERu+fMfNd9cHsrhxs3sefx3CuFqX7/HvdsUGK7L76h1/eM0R/fYMufs0XIIbaR0Ziw+EnK3BktCpaj+ay/Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(186003)(54906003)(6916009)(26005)(316002)(6506007)(6666004)(2616005)(53546011)(6486002)(83380400001)(86362001)(31696002)(2906002)(7416002)(5660300002)(8936002)(31686004)(508600001)(38100700002)(66556008)(66946007)(66476007)(8676002)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7gZusnAPAUt0tTHsfi0Fgg6OKWOjGIuMQ9NnsTRr4YmRF96LUU/UteSfzf9O?=
 =?us-ascii?Q?j9YGVmGPOz2QoM9GnJZSx/EtWvGDAvFmt0azVJfVbs6O0qInCywuX6VciZuk?=
 =?us-ascii?Q?x5ZMpkucoYEm2W+tLaSSq2i7xBJrRbfAov0P2jes3sb+vNw9kO2V0fg2f48m?=
 =?us-ascii?Q?5YGLjGT+h6p9GCW20MJBRkSwe86Uncdn3TaFJ6/HwhNHrqZIuc5ENGmhpmc3?=
 =?us-ascii?Q?RRqLfuI+co6KDK+Za0aGTh9YZdK1wTpsuS6dnrUASGxAAwVHk319lukMZ0fO?=
 =?us-ascii?Q?6EPm3dOhR257xe0S83CgVT0vzEPDW6uikZutjWMRLMpWxH+PzWD6OPc6PSju?=
 =?us-ascii?Q?DZYJqfYcrbzsomMBf/EhCcxf6cCb4KVDy+b0p3qxlVux1v3XnNcDGHrWwHKd?=
 =?us-ascii?Q?wFRugPGmcbB6ICJBmtnpnLmjHT3FuogUuWMJlRGcErmZMC/7Sqlc2CBtAFrG?=
 =?us-ascii?Q?3yWPSbwkoTcMzKDZ9r5LlD0lY4x69DRqjT/IUED7nvIaOvgC4wqBjFdE90HO?=
 =?us-ascii?Q?c7g2XTMuk2gwF/26YqiIhT74ivyYifoSJOnxws3Ty1civWLt7fe1wPog5JxG?=
 =?us-ascii?Q?PWfmHevOiK8Jg6ZnmaVKrML4VyJhBikbQZQ8y9CzRtxBS1PYZ7xld4F/dr86?=
 =?us-ascii?Q?jQ9omm7R5KtCBWKCahkF8Uo73HtHwSCzMMPnvzWdIUO2b0agyrsEOhnfq5jK?=
 =?us-ascii?Q?IyyDVeBKYgX8SWr9lArClEQFOukhMO0KcjmLq5oU+dR8q7tnIh8QLRvaFotm?=
 =?us-ascii?Q?yiPHjqs2ZpnPa790wXzEiqtS3mqnoenSakrJFt01I5NIBMfC/Aw3XClJEDZ2?=
 =?us-ascii?Q?1UjFqSlwjnx6MSkr5z8OaiCa+NVylxBM6xoYG2RC/wJXRofPIGQsTmFXCJhB?=
 =?us-ascii?Q?Fuck13HSrNjMpD1B5BoUoOPyWezz6Ly8N1CdToKFSy5al4p3jgOUtMz5+x3N?=
 =?us-ascii?Q?X8RP8wxelnGGhHEtz/zx7AfRVmL8u2rr2kvpx9MyABfhP23AQRKx4xyGgWUx?=
 =?us-ascii?Q?XEaTXhdWY7z0ureYZL38gvtq98HlNQVunjfq7SWbJxUfVY82V2ieFFisgOcg?=
 =?us-ascii?Q?F1POaXHyEhsSqiwOrgrmSLpMsBrnEkNI+Csjmedpp/OqYBHXl3aMVs8GI+Ii?=
 =?us-ascii?Q?4arzqLTECugMLZ0lZrQc1JbyeXZwRDuE7UcejuWnfHFMzLZdCTB5Z59D/a7c?=
 =?us-ascii?Q?EhKM9apVdRIvP0ByhqBEXxRUcNR0uYASUCw6AEcOQr7hCcSR5uLyebKcDAKt?=
 =?us-ascii?Q?kzbBeIJ7aLPL5XYnkYpPtX8pzhUogHybl3yQn6f1ag88m2u/xAViuJlet8ja?=
 =?us-ascii?Q?dXTu9AzLGpoxAIINrNPGpBkT8eq3eAu+vZwB0860mIwZONwMYZnnpYZG1Lj8?=
 =?us-ascii?Q?xvkxiDnuCgYfhq3dXPFq1FB11c0e8HxVOG7sghUuDR06NbWbvTY8flqqH/U5?=
 =?us-ascii?Q?dUL7Ctt+p0wJXKf9o3kNVgWFcb6nVAWxSmxBw/H49DBpCFQRScSYmTNchW3t?=
 =?us-ascii?Q?duetJGWrt6lFDB+Gyxp9SrQWjW7XonXVYMvf4aOZfaQVsrC6kfq65NEchAAQ?=
 =?us-ascii?Q?unzeBZsH+6q91g4tMsbOFXOhB+1zHML5BiZmRFxuopfl8sydruVsYl+ru7Ix?=
 =?us-ascii?Q?tbTwKSX224sYxhFv46xWTmM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82237423-8b43-41af-7945-08d9efb986cb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 12:57:16.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8lA6UntAG0fy3qsM/na8imahqxtTXCutq0lFO1/k9OskK8bnU/R4lOdQprEr+NQSBNBJGWOHpxHZzX8FdhZhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8183

On 14.02.2022 12:37, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 14.02.22 13:25, Roger Pau Monn=C3=A9 wrote:
>> On Mon, Feb 14, 2022 at 11:15:27AM +0000, Oleksandr Andrushchenko wrote:
>>>
>>> On 14.02.22 13:11, Roger Pau Monn=C3=A9 wrote:
>>>> On Mon, Feb 14, 2022 at 10:53:43AM +0000, Oleksandr Andrushchenko wrot=
e:
>>>>> On 14.02.22 12:34, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Mon, Feb 14, 2022 at 09:36:39AM +0000, Oleksandr Andrushchenko wr=
ote:
>>>>>>> On 11.02.22 13:40, Roger Pau Monn=C3=A9 wrote:
>>>>>>>> +
>>>>>>>>>>>           for ( i =3D 0; i < msix->max_entries; i++ )
>>>>>>>>>>>           {
>>>>>>>>>>>               const struct vpci_msix_entry *entry =3D &msix->en=
tries[i];
>>>>>>>>>> Since this function is now called with the per-domain rwlock rea=
d
>>>>>>>>>> locked it's likely not appropriate to call process_pending_softi=
rqs
>>>>>>>>>> while holding such lock (check below).
>>>>>>>>> You are right, as it is possible that:
>>>>>>>>>
>>>>>>>>> process_pending_softirqs -> vpci_process_pending -> read_lock
>>>>>>>>>
>>>>>>>>> Even more, vpci_process_pending may also
>>>>>>>>>
>>>>>>>>> read_unlock -> vpci_remove_device -> write_lock
>>>>>>>>>
>>>>>>>>> in its error path. So, any invocation of process_pending_softirqs
>>>>>>>>> must not hold d->vpci_rwlock at least.
>>>>>>>>>
>>>>>>>>> And also we need to check that pdev->vpci was not removed
>>>>>>>>> in between or *re-created*
>>>>>>>>>> We will likely need to re-iterate over the list of pdevs assigne=
d to
>>>>>>>>>> the domain and assert that the pdev is still assigned to the sam=
e
>>>>>>>>>> domain.
>>>>>>>>> So, do you mean a pattern like the below should be used at all
>>>>>>>>> places where we need to call process_pending_softirqs?
>>>>>>>>>
>>>>>>>>> read_unlock
>>>>>>>>> process_pending_softirqs
>>>>>>>>> read_lock
>>>>>>>>> pdev =3D pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn=
);
>>>>>>>>> if ( pdev && pdev->vpci && is_the_same_vpci(pdev->vpci) )
>>>>>>>>> <continue processing>
>>>>>>>> Something along those lines. You likely need to continue iterate u=
sing
>>>>>>>> for_each_pdev.
>>>>>>> How do we tell if pdev->vpci is the same? Jan has already brought
>>>>>>> this question before [1] and I was about to use some ID for that pu=
rpose:
>>>>>>> pdev->vpci->id =3D d->vpci_id++ and then we use pdev->vpci->id=C2=
=A0 for checks
>>>>>> Given this is a debug message I would be OK with just doing the
>>>>>> minimal checks to prevent Xen from crashing (ie: pdev->vpci exists)
>>>>>> and that the resume MSI entry is not past the current limit. Otherwi=
se
>>>>>> just print a message and move on to the next device.
>>>>> Agree, I see no big issue (probably) if we are not able to print
>>>>>
>>>>> How about this one:
>>>>>
>>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>>>> index 809a6b4773e1..50373f04da82 100644
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -171,10 +171,31 @@ static int __init apply_map(struct domain *d, c=
onst struct pci_dev *pdev,
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rangeset *mem, uint16_t cmd)
>>>>>    =C2=A0{
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 struct map_data data =3D { .d =3D d, .map=
 =3D true };
>>>>> +=C2=A0=C2=A0=C2=A0 pci_sbdf_t sbdf =3D pdev->sbdf;
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 int rc;
>>>>>
>>>>> + ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
>>>>> +
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 while ( (rc =3D rangeset_consume_ranges(m=
em, map_range, &data)) =3D=3D -ERESTART )
>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * process_pending_s=
oftirqs may trigger vpci_process_pending which
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * may need to acqui=
re pdev->domain->vpci_rwlock in read mode.
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock(&pdev->domai=
n->vpci_rwlock);
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_pending_s=
oftirqs();
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_lock(&pdev->domain-=
>vpci_rwlock);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Check if pdev still ex=
ists and vPCI was not removed or re-created. */
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pci_get_pdev_by_domai=
n(d, sbdf.seg, sbdf.bus, sbdf.devfn) !=3D pdev)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f ( vpci is NOT the same )
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D 0;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 rangeset_destroy(mem);
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 if ( !rc )
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 modify_decoding(p=
dev, cmd, false);
>>>>>
>>>>> This one also wants process_pending_softirqs to run so it *might*
>>>>> want pdev and vpci checks. But at the same time apply_map runs
>>>>> at ( system_state < SYS_STATE_active ), so defer_map won't be
>>>>> running yet, thus no vpci_process_pending is possible yet (in terms
>>>>> it has something to do yet). So, I think we just need:
>>>>>
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock(&pdev->dom=
ain->vpci_rwlock);
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_pending_softirq=
s();
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_lock(&pdev->domai=
n->vpci_rwlock);
>>>>>
>>>>> and this should be enough
>>>> Given the context apply_map is called from (dom0 specific init code),
>>>> there's no need to check for the pdev to still exits, or whether vpci
>>>> has been recreated, as it's not possible. Just add a comment to
>>>> explicitly note that the context of the function is special, and thus
>>>> there's no possibility of either the device or vpci going away.
>>> Does it really need write_unlock/write_lock given the context?...
>> I think it's bad practice to call process_pending_softirqs while
>> holding any locks. This is a very specific context so it's likely fine
>> to not drop the lock, but would still seem incorrect to me.
> Ok
>>
>>> I think it doesn't as there is no chance defer_map is called, thus
>>> process_pending_softirqs -> vpci_process_pending -> read_lock
>> Indeed, there's no chance of that because process_pending_softirqs
>> will never try to do a scheduling operation that would result in our
>> context being scheduled out.
>=20
>  =C2=A0=C2=A0=C2=A0 while ( (rc =3D rangeset_consume_ranges(mem, map_rang=
e, &data)) =3D=3D -ERESTART )
>  =C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * FIXME: Given the cont=
ext apply_map is called from (dom0 specific
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * init code at system_s=
tate < SYS_STATE_active) it is not strictly
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * required that pdev->d=
omain->vpci_rwlock is unlocked before calling
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * process_pending_softi=
rqs as there is no contention possible between
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * this code and vpci_pr=
ocess_pending trying to acquire the lock in
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * read mode. But runnin=
g process_pending_softirqs with any lock held
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * doesn't seem to be a =
good practice, so drop the lock and re-acquire
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * it right again.
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock(&pdev->domain->v=
pci_rwlock);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_pending_softirqs();
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_lock(&pdev->domain->vpc=
i_rwlock);
>  =C2=A0=C2=A0=C2=A0 }

I'm afraid that's misleading at best. apply_map() is merely a specific
example where you know the lock is going to be taken. But really any
softirq handler could be acquiring any lock, so requesting to process
softirqs cannot ever be done with any lock held.

What you instead want to explain is why, after re-acquiring the lock,
no further checking is needed for potentially changed state.

Jan


