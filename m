Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8DD4444A9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221014.382513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIDL-0008EA-Cl; Wed, 03 Nov 2021 15:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221014.382513; Wed, 03 Nov 2021 15:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIDL-0008CO-8N; Wed, 03 Nov 2021 15:30:11 +0000
Received: by outflank-mailman (input) for mailman id 221014;
 Wed, 03 Nov 2021 15:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miIDJ-0008Al-BO
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:30:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecf3e60f-3cba-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 16:30:08 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-G8IHW7TJMv-nN6Hw0mG7yg-1; Wed, 03 Nov 2021 16:30:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5471.eurprd04.prod.outlook.com (2603:10a6:803:d0::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 15:30:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 15:30:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0036.eurprd06.prod.outlook.com (2603:10a6:203:68::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 15:30:03 +0000
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
X-Inumbo-ID: ecf3e60f-3cba-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635953407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F4ZfUhdtDpr0sj6uO/VX+IeHqbpYEoP49u3WLmd3BLk=;
	b=hqIAxKUHX5iUNkNrRR3ncT6qZVmhps1L/TnEdtwEhNlhqIvMtt395bC4UbgQiJArcfYSuS
	kau2T99JzCKZmuiVrgyyRonerjEdHXYw2YHK1TWf09sdoS6zzADcXOY9pcHkHf2D4K2a0n
	LSyic4NXoL3yX5oGf11pwSjRV4FMpQE=
X-MC-Unique: G8IHW7TJMv-nN6Hw0mG7yg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXbiatfNUOWrHUtlC37XAMKjvLX9V35fzi4+P1PCZ0hNuMpN3ASUPASSG4o6PdORnewzW2h5pSqo0KowCw8j6+3N65Ml3pbQrm8zoqrH9hqrbIwqMMY/O8ngWWU2oRD0+C65BWjCulQEH7avSCJZbX9+5uvOV1JxOD2tTHQG824ypRxmFXJHtD/IWVVgCbhh1wruOxvoArFFKKA8xzwYCY+yi2zUqKL5VMTiV9cSaNpQjCYR76Q6CnIsIezRqXTtDu5c3/vnO20gGjFWV21e4yLva97hMln6KFJzNmEo+53WUVpRjEa4RQ/n6EukwNydUKs9I5Ubd9P20fy40pf90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbswW7RJvH0xHSuyfwZQNMEXG7BEnXpCyWNEzp9yC9s=;
 b=jvLUAvnq82IxCKY49STtcybveRBm1p3Q3ADD97BbruL94driJt5dhUwu2zTllmB5yPBhBwb2+rCoxtyf+nI8B0KxwJ9Ge5QoMN9Yl0ELXJkWv5iAEMohtuHS9J449oW55EBIgzbc2dsk2F4i1HH3cHZsExb8YlMOAyjzyvfXA1rUQ3h/VlMGjhjcjqlI49rR5tbSmoODzxKl6uNOdAkwUkygAmSZYCilnwxFdizt405z4ueEEHgeZl9QZiw9nEpWSW6luVlUILyB4RyK12uzItPNNwmLSf6F/ETayugT+avWS+cGr+Nmqj3Q6RUG6Lnn9ApzqKVGFn4cq3rBN6YAjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3d140fa-019e-a469-be16-47b6e42e124d@suse.com>
Date: Wed, 3 Nov 2021 16:30:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
 <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
 <6a8ecb5b-7ea4-7dd8-4acf-587b51862aed@suse.com>
 <845D8368-B9DA-4A5C-8F8D-6AAE55E326A0@arm.com>
 <16c6757d-1bb3-361f-a41f-26b9bc89a2b4@suse.com>
 <83E4F969-892C-4AA2-829D-67C02B4B5885@arm.com>
 <ad621757-afac-f36f-0b3c-7fe1ddb83a66@suse.com>
 <AB5E1F4C-36BC-413B-88DA-487BA573BFCC@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AB5E1F4C-36BC-413B-88DA-487BA573BFCC@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0036.eurprd06.prod.outlook.com
 (2603:10a6:203:68::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1e1a93f-f924-4714-b641-08d99edecf01
X-MS-TrafficTypeDiagnostic: VI1PR04MB5471:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5471BE76B3F3D6BD401278C9B38C9@VI1PR04MB5471.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ERE/vfqlCWcCV64IahhKgcd9u/qaxiNHGXFyLhKPfPJ2f2z9xoQYTETBeOA0ZeBHTGUlUwr69xqVWTEWC6JfwDgl9ldJaTDciJzPd5t8SM+sh5oHMc5kQtJpp9oMkuR6GmaW6Qib9FLPux0eaW0Fk1i+curZKqxiTk5Zw2KYUbv/CxG67NlsSTkTdNbeNgXjVovo9dCmuKtNzf1tbUzCIqKDh4kHlSlSF7p83ca58/MH7DQwTT1e4vxIYruWeLWXDunLeSQCMKYkhDSZgdHl6aM/5WmCGdQ/jXCspwt8Q1N5zNbJHS2EiAkkETZCCrvy10VOFl2YFwGMr1FRdOIns12Uye161BCIBe0oT2ys9Gxtb9fs6/RA3xyHa564O5fdDHwxKRYYMfB+I3K/PULNdngaosEdSN5czDrguODhh12PbbweAQ/L3kIyFKJXBcJRBrpUhIG0q+0pDYnqCOzk7FkfLGl6KASZV4afZz69jOF4z0al/opfIszEPsi56rp2JBL3iCfJ4dZgDLaCcJUp+gOkPQ0OwZ81L6clg3pjjqBXX2EpSyAXsLE1mHMkxWmv7NZaWU2SKIM1O3a1yUneGVnKZg3oxrSyyF0G7zYQ5PnAjSqMfhl7cVA90iIHYnI7Eo8c8qwNB9ULfgo/daYG+XUj3RW1FgeRo7HxtGQQZPlFmwrZgxlaV9Yo+I/O7eDtheeUL8EVA3x+kJ1LKLveS7lsDqvu0WDgPKKrt4nNvLMx845REwdJZAmdozpn1s2e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(6916009)(2906002)(66556008)(31686004)(54906003)(66946007)(2616005)(38100700002)(5660300002)(8936002)(53546011)(4326008)(36756003)(86362001)(31696002)(316002)(956004)(66476007)(16576012)(508600001)(8676002)(186003)(26005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzW9T7lQJ40nrDQiciXjl7JxfcuRa4F3zD03Wt1zRolzpg7GdURAHwHn26nM?=
 =?us-ascii?Q?X3TLpRfrW960z5bsr5XKOBQEU2ydtcvquPNyn9/sJmXMYv2ygNr8dFn0YTVO?=
 =?us-ascii?Q?bqcyz9hnSeqerbKGIATFMk/N/fIS9jNHeqdCD4xcZN8OmVFrUAHubwLUniqj?=
 =?us-ascii?Q?Vc5jGF0SxNJDj2lLUPWPnJeQY7pSivD7bNVEe9iiLX9V5vxklV9j0TRd24kc?=
 =?us-ascii?Q?pH6hxT7bJ66JiAmBXY4OGNOAFfTWu7cT5cY7W6kYXmNdEGYrcw7/MHwse0u1?=
 =?us-ascii?Q?jfpXJq/eHRVOeKpwXmU1c+4XdlJ6u0hZaBGMDiIj8QSRg7G3rt8z2lz37Thp?=
 =?us-ascii?Q?Nl52srbPfTa5tTsKQ30GhLNcFn+80tqSKoKVd4tHBixAK42Htva5eigokIKq?=
 =?us-ascii?Q?dXYJUmnR98ZuBJjFDy1vfYe1nNrkbJuWG13T4KK5UA37vtB2G85GprhZWXqx?=
 =?us-ascii?Q?Uslr3O4RhS31fc1t5WlVdJ4xxgvMAkYoezjsSeQyXIl0MkLk6sLmACilMM0c?=
 =?us-ascii?Q?Sno8msmfs4+gA7D5DvBd52ALn+bWrfKL/gU+0d2yRTpjphPGBBUtXsKAH+la?=
 =?us-ascii?Q?UVWfwDe08B4NZwTP3oRliSnkPxIU8Uo7K6WzX+8gDw4zRU/3MlS5+89olnw3?=
 =?us-ascii?Q?h0bQl5kHox4U6T84ry48fz7LjI7BJmg6MzxzJPEuyoMlmVntwmAY543345Eb?=
 =?us-ascii?Q?GdvTJou0PvEARib5y6ZB6QaHlhDIW1NLHGakwtBQZZt6yrSIDqR5W7vPjrDN?=
 =?us-ascii?Q?3etJ3xpsghL2vOh3Qhz5F/s6U9QXQjcCPUG7sOHU0wrCTc7RSYarK7qoff3v?=
 =?us-ascii?Q?kzojTR9D+dqbOFXjwx4TBKoGpsCos4KlxkBZzKQQuL7gxnmml/Z+Ghpix4F+?=
 =?us-ascii?Q?HbE2GmbEMth1peR7SyxzObG4BWsMWgEgn/1dmeHvjvNo0MJmbSXlYGTDmai7?=
 =?us-ascii?Q?hRNIeaMW78KFSavOHRZevkrglMCcUYzoX9jWpLkvkc6oBlgp58Lrc/wvtZ2d?=
 =?us-ascii?Q?e43qPsbDj2RInfsjVDA5qZlydLvXxbYCMn8Mq5LL6sDFPGizD3rp/mN1Beet?=
 =?us-ascii?Q?DXVuMzI0OTmZvDSMUJvis8b4vV0K4OhUMI/UgubyXqIeAy4feh7K/5upyId4?=
 =?us-ascii?Q?7tKwnLuAOQLgxcTY7Zwg8afuuuxd1Xy4kVYftWI3el39QJOVfi8D8BQ3gUwZ?=
 =?us-ascii?Q?ztCIzVWxkzPY8BC26Llen8JfM4R08/fYsGjHyIRL+tiJCsevjvQllFAnip26?=
 =?us-ascii?Q?sFqfK8ZnKFI34OBb2p0Dd0rG8H7l7ungYGYXsM0fFcJY+pi5vXdr28sZU/qZ?=
 =?us-ascii?Q?WxiniWVkCMz0HlbYIJ6rg+wi6d6BKATqoI/dxsFjS5g+9+ya3bJht4Pee9Z0?=
 =?us-ascii?Q?Y3lOZ2jxmTeQWGq8Ah3OfilW2Q1TD9lYvSexs2BX89+htYiDgfFirBZJCb+B?=
 =?us-ascii?Q?QrdvPCdu8ZXGDKceyfeEUXb/UyzLoHF2buOE/hx4UaA/vfgVloCyiI6/9V8I?=
 =?us-ascii?Q?vNr1rN2TSWYIjGiDgEDMX/h+S61Bz5FeX8CQdhpqAxWTOUPk3L/M4SnmcQwT?=
 =?us-ascii?Q?XTsKfuc8dtnWOfcOPUNOBY/hk3YIBnlTBtY2LLrX6qsTaJvFMZ5AK1FhoxHM?=
 =?us-ascii?Q?ht2Hn4eJcrU3B1Wid3pvAaA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e1a93f-f924-4714-b641-08d99edecf01
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:30:04.4019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0WspAYW5vWexLsij+y5Dxsg8ztq4b3P2WEGk4n+l+p4++jt79jk/XSCRV1pHCwpwxV3KTa/en1q101RP8eJew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5471

On 03.11.2021 16:16, Luca Fancellu wrote:
>=20
>=20
>> On 3 Nov 2021, at 14:30, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 03.11.2021 15:09, Luca Fancellu wrote:
>>>> On 3 Nov 2021, at 11:28, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 03.11.2021 11:20, Luca Fancellu wrote:
>>>>>> On 3 Nov 2021, at 08:20, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 02.11.2021 18:12, Luca Fancellu wrote:
>>>>>>>> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>> On 02.11.2021 15:05, Luca Fancellu wrote:
>>>>>>>>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd=
9b882
>>>>>>>>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>>>>>>>>> introducing a problem to boot Xen using Grub2 on ARM machine usin=
g EDK2.
>>>>>>>>>
>>>>>>>>> The problem comes from the function get_parent_handle(...) that i=
nside
>>>>>>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the la=
st
>>>>>>>>> is NULL, making Xen stop the UEFI boot.
>>>>>>>>
>>>>>>>> According to my reading the UEFI spec doesn't (explicitly) allow f=
or
>>>>>>>> this to be NULL. Could you clarify why this is the case? What othe=
r
>>>>>>>> information may end up being invalid / absent? Is e.g. read_sectio=
n()
>>>>>>>> safe to use?
>>>>>>>
>>>>>>> My test on an arm machine running Grub2 on top of EDK2 showed that
>>>>>>> when Xen is started, the get_parent_handle(=E2=80=A6) call was fail=
ing and stopping
>>>>>>> the boot because the efi_bs->HandleProtocol(=E2=80=A6) was called w=
ith the
>>>>>>> loaded_image->DeviceHandle argument NULL and the call was returning
>>>>>>> a EFI_INVALID_PARAMETER.
>>>>>>> So the parent handle can=E2=80=99t be requested and the filesystem =
can=E2=80=99t be used,
>>>>>>> but any other code that doesn=E2=80=99t use the handle provided by =
get_parent_handle(=E2=80=A6)
>>>>>>> can be used without problem like read_section(...).
>>>>>>
>>>>>> I understand this. My question was for the reason of ->DeviceHandle
>>>>>> being NULL. IOW I'm wondering whether we're actually talking about a
>>>>>> firmware or GrUB bug, in which case your change is a workaround for
>>>>>> that rather than (primarily) a fix for the earlier Xen change.
>>>>>
>>>>> The issue was found only when using EDK2+Grub2, no issue when booting
>>>>> directly from EDK2.
>>>>> This is a fix for the regression, because without the EFI changes, Gr=
ub2 was
>>>>> booting successfully Xen. Using grub2 to boot Xen on arm is a very co=
mmon
>>>>> solution so not supporting this anymore could lead to lots of people =
having
>>>>> issues if they update to Xen 4.16.
>>>>
>>>> I'm not objecting to addressing the issue. But the description needs
>>>> to make clear where the origin of the problem lies, and afaict that's
>>>> not the earlier Xen change. That one merely uncovered what, according
>>>> to your reply, might then be a GrUB bug. Unless, as said earlier, I
>>>> merely haven't been able to spot provisions in the spec for the field
>>>> in question to be NULL.
>>>
>>> Maybe I can rephrase to be more specific from:
>>>
>>> The problem comes from the function get_parent_handle(...) that inside
>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>>> is NULL, making Xen stop the UEFI boot.
>>>
>>> To:
>>>
>>> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandle=
,
>>> that is used by efi_bs->HandleProtocol(=E2=80=A6) inside get_parent_han=
dle(=E2=80=A6),
>>> causing Xen to stop the boot getting an EFI_INVALID_PARAMETER error.
>>>
>>> Do you think it can be ok like this?
>>
>> Much better, yes, but I wonder what "returning" refers to. You want to
>> describe the origin of the NULL handle as precisely as possible. And
>> considering this turns out as a workaround, in a suitable place you
>> will also want to add a code comment, such that a later reader won't
>> decide this is all dead code and can be done in a simpler way.
>=20
> Ok I can write the issue from the beginning to be sure:
>=20
> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandle
> inside the interface given by the LOADED_IMAGE_PROTOCOL service, this
> handle is used later by efi_bs->HandleProtocol(=E2=80=A6) inside get_pare=
nt_handle(=E2=80=A6)
> when requesting the SIMPLE_FILE_SYSTEM_PROTOCOL interface,
> causing Xen to stop the boot because of an EFI_INVALID_PARAMETER error.
>=20
> Regarding the comment, I can rephrase this comment:
> /*
>  * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PROTOCOL
>  * to have access to the filesystem.
>  */
>=20
> To be:
>=20
> /*
>  * If DeviceHandle is NULL, the firmware offering the UEFI services might=
 not be
>  * compliant to the standard and we can't use the SIMPLE_FILE_SYSTEM_PROT=
OCOL
>  * to have access to the filesystem. However the system can boot if and o=
nly if it doesn=E2=80=99t
>  * require access to the filesystem. (e.g. Xen image has everything built=
 in or the
>  * bootloader did previously load every needed binary in memory)
>  */
>=20
> What do you think?

Largely okay, albeit you don't mention GrUB at all (which isn't really part
of the firmware, but which looks to be the culprit) and it gets a little
too verbose. Provided the facts have been verified, how about

    /*
     * GrUB has been observed to supply a NULL DeviceHandle. We can't use
     * that to gain access to the filesystem. However the system can still
     * boot if it doesn=E2=80=99t require access to the filesystem.
     */

(and it's up to you whether you include your further "e.g. ..." then, but
if you do I think the parenthesized part belong before the final full
stop, and the last "in" would want to be "into")? It's still dubious to me
how they can get away with such a NULL handle (and why that happens only
on Arm), but I guess it would go too far to try to understand the
background.

Jan


