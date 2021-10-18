Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10438431126
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 09:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211702.369340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMlh-00055b-So; Mon, 18 Oct 2021 07:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211702.369340; Mon, 18 Oct 2021 07:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcMlh-00052X-O9; Mon, 18 Oct 2021 07:09:09 +0000
Received: by outflank-mailman (input) for mailman id 211702;
 Mon, 18 Oct 2021 07:09:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcMlf-00052R-RJ
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 07:09:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47e86394-2fe2-11ec-82cb-12813bfff9fa;
 Mon, 18 Oct 2021 07:09:06 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-N5nlzpjSPwuZ03p1X_xHjg-1; Mon, 18 Oct 2021 09:09:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 18 Oct
 2021 07:09:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 07:09:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0222.eurprd06.prod.outlook.com (2603:10a6:20b:45e::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Mon, 18 Oct 2021 07:09:01 +0000
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
X-Inumbo-ID: 47e86394-2fe2-11ec-82cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634540945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slF/gu56ubJDSJkfAmnSkNeWbqJG6AhZQ+FwjS7uTYQ=;
	b=OxGuy/rJV4Cfn71OgDz+/QzxZn7PmQH2X/CAEjROubxSUuKVY7QZmLwFt/iAWAEtKUWILJ
	aWrHm0dyKQ1bvs6eqjnDabZobSxnhSEeNJ5i8Nb8ks4oGH0Cqqs3QHMaHqjxFBevQgKXMO
	/Iccr2qPy59gzUEeAaDLtebvJuUndnI=
X-MC-Unique: N5nlzpjSPwuZ03p1X_xHjg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eefUJm8nSfl+vlR+OQP53HPKQmgcKrLXuC0XG6CZOR+yc2sheg3u38n5tlSyrQh2l18pFWC8P5ZO9zmnsjyctVdKzbEgBXlahCFSEDyCi/Z9cd2h/KvMU4/G1mpJBUSBPLwduv2RNDbpGVIqLuz/YLuzOiUukU8BOHOTQoXh3JPjdq2t/1ZT1B2Hc1dblRZgJ1TG/Tv5D6DBuktFc5Z8qyrgxBEB7UhvwT77fcuXL9kOs+TJWhQFxFf4Mb37aYvzBoTKA/03rQ2oxIsj1VMOOVaECmJNzDt5vvpvnEU9KdvWAh/LUnnAxNy5IuFgesBw3DrR39Q9/YrPGQI4gaPIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5aJvPuZVuPFahGlRe0PSxEc8cTBs8HVKC2LptStzS0=;
 b=nF08b5JyTP8P5E6y2qA+MZHpnRpT58FWmtmRrcwsqbK/aFFc5J3j5nGiXugxTGGU3lG38HjH7iaimY9Gab59TZBB3RILxGGAcu3G/aGy5rVnizBI56HCU7tImHSQDAOD1GPhjemFN/ibrSrp4AznflimiNSMC2fbhv0rJAndaNlKic9BRCconyzfJgalhl0xEjzGJQDi6Ujhp1+m4z5KnMUOsONHc/DaeK2jsuo6kvzBh4yq61dwtb8++5+V08VLIaEp9xStZPKNav594+CuRYO/oa9xfosKOPUXskOJuBIfJngKcQh8dapuh2u8ZJ7VZiVHh1VBJNcQ4uwh/KgXUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <iwj@xenproject.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>, Rahul Singh
 <Rahul.Singh@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
 <F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
 <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
 <alpine.DEB.2.21.2110151235100.31303@sstabellini-ThinkPad-T480s>
 <YWqpQyKvNzE8GYda@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b6c80de-f71a-b32e-340f-130f62d9dfd5@suse.com>
Date: Mon, 18 Oct 2021 09:09:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWqpQyKvNzE8GYda@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0222.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac669c05-d64e-4aa8-cee9-08d9920629d5
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4605BC3AFC421899E483BC62B3BC9@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F4XWSAHaKWLsecOvXDA99/cjJTYD5lO7iLqvWhels0k0neYfZBiBmK/15vB9PVSaV3n3OUAIx4YyApSYX5PKW7s1KuFJPWWlcnINcS8/u0IZhD3epfn8sZQy/+JJ3NB/1iforVJkJE0RKXmVLDDWv1e1e0Uy4Dwrr0FBmd5aIoH82zBJh6KbECAEHA2w46rbVhJH3xFJW1ywP7mPJ1sCX7M/AKwO/YzQaweOZNqQUebZRQ5JT45oNCwlCuhPNksGiZolzv/tXKcXgYty41Mn6bZEcRAVcHI/I4ku6G4GXLfjBxMOkER0VXdNk59uSnFxsZ5dVuUCZ1qXbcyKxozv4lzVXmbjm/5j42LJM2uDndjZC+qZ4CAcMSfh+lDMPcYwbNGwtyUUFSeG293yxzr7Av9vA3CJjv9+CDwyE2TGD6thIeiwljVpJDOVbuvqIuiM6/xb5sSpGHnvPhTe6neZ3mmUBYeCZDakTbzMpv2nX4lttNJVg2wH+JMzWP2VdlbIxfyR/TlMJZar8LwwCjOTxe3MEVXcPQC5fBJ++5TR+IP1OAvlioZpdjAn70Mn5PBnwsDbZrZQSVqv2yrvp+XX/EYCDiP3Mclkra/Pd2WVq56JXgE6q+96uGXEB1KO9/p4ljg+2am3kVi6q7BQABaMP/9k721cO4C7zcQnJ2g2eKNtWwrj4SvVlXlZPRLw8o6Z8X4o5vYb+TjvBG12EutrR0/Gqz8Az8OqcLPRFZntj302KXMc8FHjL8v/nMmrJSMN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(316002)(16576012)(66946007)(86362001)(7416002)(66556008)(66476007)(38100700002)(26005)(53546011)(2906002)(110136005)(36756003)(83380400001)(54906003)(31686004)(6486002)(5660300002)(8936002)(4326008)(508600001)(186003)(8676002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?miedexEOL9+5JL7aisswumYNL+8s0URsG+NId4fDJ1RtNHlCX80frtnZz7S7?=
 =?us-ascii?Q?D0R0jxW9GyoE4+fsi9sg5kM1+c+g6TBJsr4gOIIiIR0aHC+4wNAMaJxwyf2v?=
 =?us-ascii?Q?RdCa60R71wQrztAZKdHPj/d6c0TQrGq7R+KRGvTr7ua9gSQjfi59sh3x6qxY?=
 =?us-ascii?Q?6GBdALd2VZ5giQ6TTQSCqoF5JZbvbbfEE6Y4QtjM8dVM9nffd8mLZUFigs3A?=
 =?us-ascii?Q?cJptOHN9OQ3rtGyXk86FU5bAcQqb/ifVfeIENSffRSWG8Ts+7cM/faMTAtoh?=
 =?us-ascii?Q?W5Jp15S5JfNzLIV+Vns0cNZda1k2Hu8RMywitCmfT0zeCHaaZgvVntqnLjv+?=
 =?us-ascii?Q?8zN4Z2hcAOCg07ZckmXFI8xA6+Bcq5Eu3twxFydKaLnGE+knG1ZTRGaFvgo6?=
 =?us-ascii?Q?z3PJXNGeUxPtfoEgrfQHmeQId58Wa881z4NavJmgG3atPv12KWGg0hpplqt/?=
 =?us-ascii?Q?yYUdcP1xQArwT92bwrRjS5u7XtlCTBHfiAlhnyWyXTaBmFLFlnEavGpISqWb?=
 =?us-ascii?Q?BQP/JlM+CaiHL0wIy4uxJjnRr43c/Gz/5O4TbuSf7sXs8cX5f0chYYmEpMnn?=
 =?us-ascii?Q?MyHGZogymCcWVhd+XrhjyOPjOcwGGPqgBpPwu6OdPm24cbICYTn0aWBfCo0M?=
 =?us-ascii?Q?JRsw23mBZSCll/mO3ezVNcP5EY7nYClXT8VAmgbJCowP319cmGnYlN9aWR/P?=
 =?us-ascii?Q?C+cW7TqfSn7uiiNJlMuHzzS0gAZyIsW//0MOrtFNRXlhknDu04jNVJftCFs0?=
 =?us-ascii?Q?zhXMWGKtIlHAhSECBjbf7+qG16DCPVwzf35d42OgMhxiuLeECWOvHTUVqSeS?=
 =?us-ascii?Q?+rEJG/sKqivruHKH50VwrhJahEkYCN92NoXhTckXdv3ff9nX73ve4oZSrRb/?=
 =?us-ascii?Q?NGS3fnIPB5UZ/1UnXKDITnDMV3/dX1Zta+rhAZ9sXS3edz3cvihXBSxaDp8S?=
 =?us-ascii?Q?ZkXI4+yK42YYrgcF02DwsNvG5zIG8eOz+3+Q8B4QCuNeN36VL1mYBRQ7aPnN?=
 =?us-ascii?Q?wl7ytKfegX44BC0WWl5yO5IzdDi72+a4wYpX3TGQAcKrdHT6KnVtbdLog2YI?=
 =?us-ascii?Q?wiX92vAgnX8E9XFgkolBFFjrlYP7tzZz+qzVgjFVKT0eWwmi2EBh5Q25UDU1?=
 =?us-ascii?Q?EJ0WZgccIM995eBK0XC18RbfsoGhOEyJ14gPDzcSsVgmonVmThT5jdxP/KBc?=
 =?us-ascii?Q?HC3YSSgFZ++M8ZASSDxTj4AtSRBrRDZQLPDiiEY3yzGqkHBKCGUKiW1XsO+3?=
 =?us-ascii?Q?m/Dw6kJuIpURWlZc9id7Y367/KpXYlYpfD9BbqpQovoxtM9/D1W8Xff36JwQ?=
 =?us-ascii?Q?QRiaBZ4GnsRg/HX2+2sXnx8S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac669c05-d64e-4aa8-cee9-08d9920629d5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 07:09:01.9812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klp6oXhuIwjcXUt/VlzkYL1WbTIFXCSKqXRrm5xaCjxnEIPy/2Ith/gwPTk/nwrxVfZqFTCxif0fLlf6QrcBhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 16.10.2021 12:28, Roger Pau Monn=C3=A9 wrote:
> On Fri, Oct 15, 2021 at 12:47:17PM -0700, Stefano Stabellini wrote:
>> On Fri, 15 Oct 2021, Julien Grall wrote:
>>> On 15/10/2021 18:33, Bertrand Marquis wrote:
>>>>> On 15 Oct 2021, at 18:25, Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi Bertrand,
>>>>>
>>>>> On 15/10/2021 17:51, Bertrand Marquis wrote:
>>>>>> diff --git a/xen/drivers/passthrough/pci.c
>>>>>> b/xen/drivers/passthrough/pci.c
>>>>>> index 3aa8c3175f..35e0190796 100644
>>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>>> @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>>>       if ( !pdev->domain )
>>>>>>       {
>>>>>>           pdev->domain =3D hardware_domain;
>>>>>> +#ifdef CONFIG_ARM
>>>>>> +        /*
>>>>>> +         * On ARM PCI devices discovery will be done by Dom0. Add v=
pci
>>>>>> handler
>>>>>> +         * when Dom0 inform XEN to add the PCI devices in XEN.
>>>>>> +         */
>>>>>> +        ret =3D vpci_add_handlers(pdev);
>>>>>
>>>>> I don't seem to find the code to remove __init_hwdom in this series. =
Are
>>>>> you intending to fix it separately?
>>>>
>>>> Yes I think it is better to fix that in a new patch as it will require=
 some
>>>> discussion as it will impact the x86 code if I just remove the flag no=
w.
>>> For the future patch series, may I ask to keep track of outstanding iss=
ues in
>>> the commit message (if you don't plan to address them before commiting)=
 or
>>> after --- (if they are meant to be addressed before commiting)?
>>>
>>> In this case, the impact on Arm is this would result to an hypervisor c=
rash if
>>> called. If we drop __init_hwdom, the impact on x86 is Xen text will sli=
ghtly
>>> be bigger after the boot time.
>>>
>>> AFAICT, the code is not reachable on Arm (?). Therefore, one could argu=
e we
>>> this can wait after the week-end as this is a latent bug. Yet, I am not=
 really
>>> comfortable to see knowningly buggy code merged.
>>>
>>> Stefano, would you be willing to remove __init_hwdom while committing i=
t? If
>>> not, can you update the commit message and mention this patch doesn't w=
ork as
>>> intended?
>>
>> I prefer not to do a change like this on commit as it affects x86.
>>
>> I added a note in the commit message about it. I also added Roger's ack
>> that was given to the previous version. FYI this is the only outstanding
>> TODO as far as I am aware (there are other pending patch series of
>> course).
>>
>> After reviewing the whole series again, checking it against all the
>> reviewers comments, and making it go through gitlab-ci, I committed the
>> series.
>=20
> Hello,
>=20
> Maybe I'm being pedantic, or there was some communication outside the
> mailing list, but I think strictly speaking you are missing an Ack
> from either Jan or Paul for the xen/drivers/passthrough/pci.c change.
>=20
> IMHO seeing how that chunk moved from 3 different places in just one
> afternoon also doesn't give me a lot of confidence. It's Arm only code
> at the end, so it's not going to effect the existing x86 support and
> I'm not specially worried, but I would like to avoid having to move it
> again.

+1

I'll be replying to the patch itself for the technical aspects. As per
context still visible above this code path is supposedly unreachable
right now, which makes me wonder even more: Why the rush? Depending on
the answer plus considering the __hwdom_init issue, Ian, I'm inclined
to suggest a revert.

Jan


