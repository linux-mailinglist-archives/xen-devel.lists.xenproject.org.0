Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FF84B5217
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:48:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272270.467042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbiJ-0001mk-1t; Mon, 14 Feb 2022 13:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272270.467042; Mon, 14 Feb 2022 13:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbiI-0001kc-UM; Mon, 14 Feb 2022 13:48:22 +0000
Received: by outflank-mailman (input) for mailman id 272270;
 Mon, 14 Feb 2022 13:48:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJbiI-0001kW-1Q
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:48:22 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c534d657-8d9c-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:48:20 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-oqUv4supMeKZBijkJ5DqSg-1; Mon, 14 Feb 2022 14:48:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 13:48:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:48:17 +0000
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
X-Inumbo-ID: c534d657-8d9c-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644846500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F6JqSrWHMZvMDTzPmP/hOjpW6NL1qzExNrtnIz5p0gw=;
	b=lQzUzHrJTDKI2MqGQpvasycnTEnjDiaH2Gt8IgOzvXUoj1C0N57wJ0u3KePMcULRBxLV/Z
	yXuUO9EgBvYhjMXMz/B8gDaNPo/1LSGIPJhZHox1h4dqvMiFeP9VcZC8SWg9w0jo7qfUTw
	fNsPLjxA+6kc5aAtJ2GFxBsOU/gafGo=
X-MC-Unique: oqUv4supMeKZBijkJ5DqSg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWWLu25iB15bE2sdGy1YpSyvsUfuOqx3OKr4QuZIvtbYQwc5+oAxWtwBYgGuxIcsSGFqlmulmqm15DQ6SNW3AR7gCyIbE9yoJwcBTsTwE0XvUxTOuc9nIjRoBAJwtDSE0Y4GAuAhLKo2nEwnOqYzA7K6BRzqNSr/BEX8uG/CXo2fmi4S3pKB8kqjKLw72rTHVKvEgiJMusEPwmsgPqkW4gcuJ7mfNQ/D1F9TheXIKouhvw9/VY3CU2aYAk5ezgOlCqOG6be6duhzlKw6RsSLpL10UtJPyRCO2vBHJ9ILZFshdSYGZmIBh7uPP8pYjgTkzNmfLoqmx5DU99MaUyEiaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQELOwE604JH34St9WSsVguW3L6k1ASB43q/zFgHawo=;
 b=GBLywyztdPMQrGzSBy8//xZ3poJ+8EVgebP645/VTRi59BHX06UZ7zrkr6a2a0pv5ryWkGSjC/WuSFTrnaRZLc6274DXmLBM1OX8BKzGoDMZbbTVDI/O457GcsgdKdyVFuA5Tq68NHAn0Gs0fL3erxPTpb67Ve8lto0I0sVGyKGsO+usml5LH/RJajXGjXohLzTzmarhBvxyvHOuoW/0k5HMOq2NgiBuwxyXwL05sSOMr0I/k4q6QOhUl7SSN/majymmL9K92NVAfqIr+Ib9/T3csedR8Lfat8ePy3ywpOC/C1AG6HecKd91oqvqpGbsT8Lq7p3VSKYUs2QHTWEiJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3538350c-0a63-59fb-7bba-fe460c0f1607@suse.com>
Date: Mon, 14 Feb 2022 14:48:15 +0100
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
 <06baf0c8-d7d2-50b8-ea8f-1d422ceac728@suse.com>
 <6ccc7add-c13e-555f-b341-ce37118746e5@epam.com>
 <f0e202dd-1f6e-4aac-1381-a64a7fd12270@suse.com>
 <ba901778-ce63-12f2-0a54-d56998090200@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ba901778-ce63-12f2-0a54-d56998090200@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0502CA0006.eurprd05.prod.outlook.com
 (2603:10a6:203:91::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5c66667-11c0-4b68-dc7c-08d9efc0a7c1
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8459876604080F3CF95BB0EDB3339@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dAtBs1dxVH52VchkUW+ZogAYLyBpWsVoaWYYUPiy/R1BqkIYhx27rVPRIpzH9NdJJNwbdE79gUTigZemfoXZRzsJvyj2PRGQZfrfKhqeQim6/ucQEBB6IecZWhYANH90drfeLjW70oLaQpgxtb63e8umKh1XftFi6w2i4pvdvBNrh+snuyKd8AJwRc7oVtHUq7Ga1VJPKlTC+0Dv7LuoInyMs/8aLTtRSflnIQKUf1CkbwGDGJvO32MQ42avZsZyBTMzCB8J3Y+0Zn9faw+d2UWG2FRJ5cihtrXhFXqQOnGN3bqkln7E5Q/c55O5hGhF7G/FQluSHAPXWkb3UMlJrH+ab9Qm8TAS2eXXfPpHF/5+ROU6STAL2kGliit/Mfda/9cdnf+PwU/KE5klwzLXXzkXDvx+R1P0+mRI6PJOFmQgK+yqO/2V3uoz3Zn92ePl+D7VZF5aVDRdq9yuBV4QAHffVCt8AKBcK3RJ1Fux1dk1igaxVrJiAtYLN4XKKp88T5RIy5UrO8+Dz6+gj/5mKPgLodL3pzH0oie2mmC7IlgeGh9hEsH+726bYwMaaCZcTUeoAHGIW97Rb6XvwCnCH2P5yIPsozSR3Ro+Fqiu8p54vh4ETT0Xq6DwddSWlvmtLG63K+gFEXTzQksb8IHvdzTGMlRtI6vbaBRRHr4hZYQydiSyl/3nyay+bO1/21+ixojR2DUB3q6xDcxBKi8KqLcJzqy0+utAZKvFA1vl9L0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(6486002)(38100700002)(7416002)(83380400001)(5660300002)(508600001)(26005)(186003)(2616005)(8936002)(6512007)(2906002)(6506007)(54906003)(316002)(86362001)(31686004)(66946007)(36756003)(6916009)(4326008)(53546011)(66556008)(66476007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1rs8740IjyWQ/0ZS1vKqqyIJg16DlFYwekML7mmaz9u2euBYCkMNh37BZFWq?=
 =?us-ascii?Q?QNwPs2l9bkzLFhGvkIN6rrNE62w6jNAFrLg0xMV293oT9UhgnHOqwAOpCRvK?=
 =?us-ascii?Q?JhrnQUhYrFkLyiOiTByG4zILEjwjJDy0yY33pAUuIjN1EWn0mCBtPVXjLYVG?=
 =?us-ascii?Q?10xuUMG4Bd11jvIuXrC2sAaBv+Gp4ZPKjH+F4ogppHvfQx8umnAUcNcWfk80?=
 =?us-ascii?Q?IhTnivbDhofwttQW4cKz4Q6lSAUet3K/D1qSTsEBzSdoD20i8Uji7MU/8FLE?=
 =?us-ascii?Q?wPUiih7BCGLa8ID0VQ1Qo5vhLwzBxJr01JXn4YceLrPtDCGCdsr82e+MPC9s?=
 =?us-ascii?Q?YDJmqoudsW6inTi6m7QTM4YJp2INWl2GbXEw+Mq2GWBQ1JBx1hDx2erKFd8+?=
 =?us-ascii?Q?6VBouCO7i1StYoz6tF3aFAkVB7t5BFbWb3wpXnIwMS9oatjZReb6+BzdRij0?=
 =?us-ascii?Q?L+O4drjaRL9kOlWDmap98R3afJr+2A3DDUuW70/lv37j1qtYYaVjVTiIglTu?=
 =?us-ascii?Q?lzEXoAOQF0Aym+1F2SGq5k6kk3NDoaN1BadIcmvz5Z3WP6oZ9w8P4vRRElGc?=
 =?us-ascii?Q?/VWVPPqbNkMJzEf+5TymmjMafpN002K/IU1vCVmDBdkGwHh9rUKBplpZLLg/?=
 =?us-ascii?Q?C30HbI3y7IzUv4rUdC7Z/rm7SNTdSDaYv6MwUi+XZWV3cl/dq9n1MOAVY9QQ?=
 =?us-ascii?Q?GZtAnoOfjTCDst4p612bsKewJ8QJxWkvD9x7Ek2TbJCyVgfb8FiYM3gWtYVT?=
 =?us-ascii?Q?WGobXhLGtXjw+eL1gMOcnPtUeiXnscSZKluCd8vmOcxFs6TGm6Q5eQ+H/AOI?=
 =?us-ascii?Q?R3FtAk0ojQvSdM/YGgSnfNg10tUGXoz34g2OF3Ea+20ZiEHsszZybtNoSHKJ?=
 =?us-ascii?Q?gMbhhHXkjBhSJV918/C4XEXUZnscjx5oeO6LCS5+fV5KxLMX6aGQ9d/KQpu4?=
 =?us-ascii?Q?VdmgbzFqeChr/lhKpY270XxaOZn86OzXQvrjiQzR2HRyXK0g5GoPFz3mZspk?=
 =?us-ascii?Q?65cETHol+w6yPDpflmvRGa4+KalqfLtiXQ9qvWfwFMxWeMV6ftucDp7PAmgN?=
 =?us-ascii?Q?MWnVWxv7GaQcfAIky9cW9QOChaoxmJu3Pi0PT5z8sykad04zZoF9gdf78S7k?=
 =?us-ascii?Q?HsOk/XWam4LhOnTqyDHs5zKbQnDiGUR0Eg3riLUZxV8bQC3BKTOU938OSQGy?=
 =?us-ascii?Q?vfKRF/jI6SjtzH8U+ABX51Qy2IigTzUnUHphqq5HKQKpbnmgbh+ycx6kIcpr?=
 =?us-ascii?Q?8eZ/KF9nBhT37WPa6QNyocRU/NqgyFWgcrH7i40KvnJzF0LM+kk6RR2me4ch?=
 =?us-ascii?Q?4jG+o2HG3xuMu+91/pI+FEkXPNWPQzWij/J1AubCIs/1GM8hYZWLeCgkX7tJ?=
 =?us-ascii?Q?EPWDHd4rUebQezWWGFEC+DPF6V1Q5qvVjt48DczXpdUKeuNhmDqEQLtcxrUv?=
 =?us-ascii?Q?dZ9MfqZz6wqKmC/jPatIdgVAkYBsPuWsxwSCrXHY3I5BeX46TNEllDPhErFg?=
 =?us-ascii?Q?tqv8yoDw1RankGMfwGCHeOMu8Uvvvb50qRtZt1nHwncHW9zNyxvybkhgH10C?=
 =?us-ascii?Q?smfOapEabfV27lfaPtzHZRv2ifM/rFANBV9XINXVE1V7Z4JjegK4dF5mwrPN?=
 =?us-ascii?Q?m/aSuKy3tVD+7T/AvHu/Dt0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c66667-11c0-4b68-dc7c-08d9efc0a7c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:48:17.8301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZMHcb/UxL7YIiDxz4z5/9R4X72EDvPUIgJh1+/R0oHFbT5nJfQKuS6I+3V2+6as4DcnxCm3xm445WrUfenyCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459

On 14.02.2022 14:27, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 14.02.22 15:22, Jan Beulich wrote:
>> On 14.02.2022 14:13, Oleksandr Andrushchenko wrote:
>>>
>>> On 14.02.22 14:57, Jan Beulich wrote:
>>>> On 14.02.2022 12:37, Oleksandr Andrushchenko wrote:
>>>>> On 14.02.22 13:25, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Mon, Feb 14, 2022 at 11:15:27AM +0000, Oleksandr Andrushchenko wr=
ote:
>>>>>>> On 14.02.22 13:11, Roger Pau Monn=C3=A9 wrote:
>>>>>>>> On Mon, Feb 14, 2022 at 10:53:43AM +0000, Oleksandr Andrushchenko =
wrote:
>>>>>>>>> On 14.02.22 12:34, Roger Pau Monn=C3=A9 wrote:
>>>>>>>>>> On Mon, Feb 14, 2022 at 09:36:39AM +0000, Oleksandr Andrushchenk=
o wrote:
>>>>>>>>>>> On 11.02.22 13:40, Roger Pau Monn=C3=A9 wrote:
>>>>>>>>>>>> +
>>>>>>>>>>>>>>>             for ( i =3D 0; i < msix->max_entries; i++ )
>>>>>>>>>>>>>>>             {
>>>>>>>>>>>>>>>                 const struct vpci_msix_entry *entry =3D &ms=
ix->entries[i];
>>>>>>>>>>>>>> Since this function is now called with the per-domain rwlock=
 read
>>>>>>>>>>>>>> locked it's likely not appropriate to call process_pending_s=
oftirqs
>>>>>>>>>>>>>> while holding such lock (check below).
>>>>>>>>>>>>> You are right, as it is possible that:
>>>>>>>>>>>>>
>>>>>>>>>>>>> process_pending_softirqs -> vpci_process_pending -> read_lock
>>>>>>>>>>>>>
>>>>>>>>>>>>> Even more, vpci_process_pending may also
>>>>>>>>>>>>>
>>>>>>>>>>>>> read_unlock -> vpci_remove_device -> write_lock
>>>>>>>>>>>>>
>>>>>>>>>>>>> in its error path. So, any invocation of process_pending_soft=
irqs
>>>>>>>>>>>>> must not hold d->vpci_rwlock at least.
>>>>>>>>>>>>>
>>>>>>>>>>>>> And also we need to check that pdev->vpci was not removed
>>>>>>>>>>>>> in between or *re-created*
>>>>>>>>>>>>>> We will likely need to re-iterate over the list of pdevs ass=
igned to
>>>>>>>>>>>>>> the domain and assert that the pdev is still assigned to the=
 same
>>>>>>>>>>>>>> domain.
>>>>>>>>>>>>> So, do you mean a pattern like the below should be used at al=
l
>>>>>>>>>>>>> places where we need to call process_pending_softirqs?
>>>>>>>>>>>>>
>>>>>>>>>>>>> read_unlock
>>>>>>>>>>>>> process_pending_softirqs
>>>>>>>>>>>>> read_lock
>>>>>>>>>>>>> pdev =3D pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.d=
evfn);
>>>>>>>>>>>>> if ( pdev && pdev->vpci && is_the_same_vpci(pdev->vpci) )
>>>>>>>>>>>>> <continue processing>
>>>>>>>>>>>> Something along those lines. You likely need to continue itera=
te using
>>>>>>>>>>>> for_each_pdev.
>>>>>>>>>>> How do we tell if pdev->vpci is the same? Jan has already broug=
ht
>>>>>>>>>>> this question before [1] and I was about to use some ID for tha=
t purpose:
>>>>>>>>>>> pdev->vpci->id =3D d->vpci_id++ and then we use pdev->vpci->id=
=C2=A0 for checks
>>>>>>>>>> Given this is a debug message I would be OK with just doing the
>>>>>>>>>> minimal checks to prevent Xen from crashing (ie: pdev->vpci exis=
ts)
>>>>>>>>>> and that the resume MSI entry is not past the current limit. Oth=
erwise
>>>>>>>>>> just print a message and move on to the next device.
>>>>>>>>> Agree, I see no big issue (probably) if we are not able to print
>>>>>>>>>
>>>>>>>>> How about this one:
>>>>>>>>>
>>>>>>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.=
c
>>>>>>>>> index 809a6b4773e1..50373f04da82 100644
>>>>>>>>> --- a/xen/drivers/vpci/header.c
>>>>>>>>> +++ b/xen/drivers/vpci/header.c
>>>>>>>>> @@ -171,10 +171,31 @@ static int __init apply_map(struct domain *=
d, const struct pci_dev *pdev,
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct rangeset *mem, uint16_t cmd)
>>>>>>>>>      =C2=A0{
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0 struct map_data data =3D { .d =3D d=
, .map =3D true };
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 pci_sbdf_t sbdf =3D pdev->sbdf;
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0 int rc;
>>>>>>>>>
>>>>>>>>> + ASSERT(rw_is_write_locked(&pdev->domain->vpci_rwlock));
>>>>>>>>> +
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0 while ( (rc =3D rangeset_consume_ra=
nges(mem, map_range, &data)) =3D=3D -ERESTART )
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * process_pendi=
ng_softirqs may trigger vpci_process_pending which
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * may need to a=
cquire pdev->domain->vpci_rwlock in read mode.
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock(&pdev->d=
omain->vpci_rwlock);
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_pen=
ding_softirqs();
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_lock(&pdev->dom=
ain->vpci_rwlock);
>>>>>>>>> +
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Check if pdev stil=
l exists and vPCI was not removed or re-created. */
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pci_get_pdev_by_d=
omain(d, sbdf.seg, sbdf.bus, sbdf.devfn) !=3D pdev)
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if ( vpci is NOT the same )
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 {
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D 0;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>>>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>>>>> +
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0 rangeset_destroy(mem);
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0 if ( !rc )
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 modify_deco=
ding(pdev, cmd, false);
>>>>>>>>>
>>>>>>>>> This one also wants process_pending_softirqs to run so it *might*
>>>>>>>>> want pdev and vpci checks. But at the same time apply_map runs
>>>>>>>>> at ( system_state < SYS_STATE_active ), so defer_map won't be
>>>>>>>>> running yet, thus no vpci_process_pending is possible yet (in ter=
ms
>>>>>>>>> it has something to do yet). So, I think we just need:
>>>>>>>>>
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock(&pde=
v->domain->vpci_rwlock);
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_pending_s=
oftirqs();
>>>>>>>>>      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_lock(&pdev-=
>domain->vpci_rwlock);
>>>>>>>>>
>>>>>>>>> and this should be enough
>>>>>>>> Given the context apply_map is called from (dom0 specific init cod=
e),
>>>>>>>> there's no need to check for the pdev to still exits, or whether v=
pci
>>>>>>>> has been recreated, as it's not possible. Just add a comment to
>>>>>>>> explicitly note that the context of the function is special, and t=
hus
>>>>>>>> there's no possibility of either the device or vpci going away.
>>>>>>> Does it really need write_unlock/write_lock given the context?...
>>>>>> I think it's bad practice to call process_pending_softirqs while
>>>>>> holding any locks. This is a very specific context so it's likely fi=
ne
>>>>>> to not drop the lock, but would still seem incorrect to me.
>>>>> Ok
>>>>>>> I think it doesn't as there is no chance defer_map is called, thus
>>>>>>> process_pending_softirqs -> vpci_process_pending -> read_lock
>>>>>> Indeed, there's no chance of that because process_pending_softirqs
>>>>>> will never try to do a scheduling operation that would result in our
>>>>>> context being scheduled out.
>>>>>    =C2=A0=C2=A0=C2=A0 while ( (rc =3D rangeset_consume_ranges(mem, ma=
p_range, &data)) =3D=3D -ERESTART )
>>>>>    =C2=A0=C2=A0=C2=A0 {
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * FIXME: Given th=
e context apply_map is called from (dom0 specific
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * init code at sy=
stem_state < SYS_STATE_active) it is not strictly
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * required that p=
dev->domain->vpci_rwlock is unlocked before calling
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * process_pending=
_softirqs as there is no contention possible between
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * this code and v=
pci_process_pending trying to acquire the lock in
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * read mode. But =
running process_pending_softirqs with any lock held
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * doesn't seem to=
 be a good practice, so drop the lock and re-acquire
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * it right again.
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_unlock(&pdev->dom=
ain->vpci_rwlock);
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_pending_softirq=
s();
>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_lock(&pdev->domai=
n->vpci_rwlock);
>>>>>    =C2=A0=C2=A0=C2=A0 }
>>>> I'm afraid that's misleading at best. apply_map() is merely a specific
>>>> example where you know the lock is going to be taken. But really any
>>>> softirq handler could be acquiring any lock, so requesting to process
>>>> softirqs cannot ever be done with any lock held.
>>>>
>>>> What you instead want to explain is why, after re-acquiring the lock,
>>>> no further checking is needed for potentially changed state.
>>> How about:
>>>
>>> /*
>>>   =C2=A0* FIXME: Given the context apply_map is called from (dom0 speci=
fic
>>>   =C2=A0* init code at system_state < SYS_STATE_active) there is no con=
tention
>>>   =C2=A0* possible between this code and vpci_process_pending trying to=
 acquire
>>>   =C2=A0* the lock in read mode and destroy pdev->vpci in its error pat=
h.
>>>   =C2=A0* Neither pdev may be disposed yet, so it is not required to ch=
eck if the
>>>   =C2=A0* relevant pdev still exists after re-acquiring the lock.
>>>   =C2=A0*/
>> I'm not sure I follow the first sentence; I guess a comma or two may hel=
p,
>> and or using "as well as" in place of one of the two "and". I also don't
>> think you mean contention, but rather a race between the named entities?
>  =C2=A0/*
>  =C2=A0 * FIXME: Given the context from which apply_map is called (dom0 s=
pecific
>  =C2=A0 * init code at system_state < SYS_STATE_active) there is no race =
condition
>  =C2=A0 * possible between this code and vpci_process_pending which may t=
ry to acquire
>  =C2=A0 * the lock in read mode and also try to destroy pdev->vpci in its=
 error path.
>  =C2=A0 * Neither pdev may be disposed yet, so it is not required to chec=
k if the
>  =C2=A0 * relevant pdev still exists after re-acquiring the lock.
>  =C2=A0 */

I'm still struggling with the language, sorry. You look to only have replac=
ed
"contention"? Reading it again I'd also like to mention that to me (not a
native speaker) "Neither pdev may be ..." expresses "None of the pdev-s may
be ...", when I think you mean "Nor may pdev be ..."

Jan


