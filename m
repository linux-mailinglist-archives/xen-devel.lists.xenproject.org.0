Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4725544439F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 15:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220924.382377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHI7-00045K-Dz; Wed, 03 Nov 2021 14:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220924.382377; Wed, 03 Nov 2021 14:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHI7-00042A-AF; Wed, 03 Nov 2021 14:31:03 +0000
Received: by outflank-mailman (input) for mailman id 220924;
 Wed, 03 Nov 2021 14:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miHI5-000424-RA
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 14:31:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9e03ec5-3cb2-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 15:31:00 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9--cIWHkvVP7auKjP1HyU7OQ-1; Wed, 03 Nov 2021 15:30:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Wed, 3 Nov
 2021 14:30:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 14:30:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0052.eurprd06.prod.outlook.com (2603:10a6:206::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 3 Nov 2021 14:30:56 +0000
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
X-Inumbo-ID: a9e03ec5-3cb2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635949859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ua1B2TjkfvFq+R7cU2ES3Dgx5MCJisipvkEx9aIifTQ=;
	b=LyDSOYVaf2P4AVaIZgIuYsOjBuadg1/EKVEO9GdoiuJWhGrPwqVQsZmMQnJJ+/Q6RoF7uT
	SWWHMcv1lT/509KkK/b4YQ1sq+B3f2Se9lugEYcdLxbM1zl6Kwf5FAI4QiAlaFz7qe8dEW
	R8Sg+cnRW+SZWLXRxFLGwpSFP4zn/Ak=
X-MC-Unique: -cIWHkvVP7auKjP1HyU7OQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G44UKIEVVWjmzBtiTp0Ps1xYGqGvQXLYgN0T/dipWtjzsOIBTgQsMG8yT7qdYlk8NMHdxvpt/L/4adzQFzVylnQIagMfThyDc+B2HQnHZBkTJlN5fD9SinTio9iCsbc3VsbOFol/VDbLZSad9fQ6Qz1IEhMhlqd+Wmj2gd99FnkHyI1EQ1dQE1kpHwLFhD5F74HCy4LDhI950j2e+dUZC97fGOQjGiG9P/LpURapdf0gKMg1cbaLdE3qzP+j4oo0sxblNtzD3teL/cyaUgjfPJma44SRSH7wX3c081L0k+BHrNfR/4Xjw/exyeii1PJws2OKyY29+K8FTehBiJlTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2bCgZKw74qRBIffBVsOd683kk+9C9ymmf5co5aKIGQ=;
 b=KobYbpGZeO891s5IZ85/YLSnDLMS+W0mpt50w8Em0zT5amutA6pMc6OGD7YKzBZQOSQGS53fUfdr/rN/uRT2qIN+21h9iYfkobafSDly1GF1Aer9DZHI/gloDRLbO2F6M5+TyBsWT3s+5hWl3gTuCo81ZGKkyN5K/va37aCVvdva4dQt8UuzQPnVzir9k8uVbsNRxeB+b2SEGcj6yArpbMZS2gUxNP42zJsh3vfpdPf0mchW304FJAu+W3DoYvrai5/oU2j444ZsZ6OEFyyyXRxbRSAHNB3GNZcOiqb43XjMxYaiQZOrMCUick/BOPbXlyPsTAbf6qewV9pZqovZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad621757-afac-f36f-0b3c-7fe1ddb83a66@suse.com>
Date: Wed, 3 Nov 2021 15:30:54 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <83E4F969-892C-4AA2-829D-67C02B4B5885@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0052.eurprd06.prod.outlook.com
 (2603:10a6:206::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ab58e24-a1ea-4169-b57b-08d99ed68c78
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB494209B9A723345220506ED6B38C9@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hb88SuC4A1+NpUKEg/DLBhP3Bt732yiL7rqOdOaToedt2s+AQeuFmjNo4rtXrvsmrBivLPaD76T8iEgBfQjhKzsADyAIN5IuylNJ85IA67KvTgIHHTYxddHXMjcFjgS9/npqvTJEMGOJ0p9NfZI/isazn0TtKx8WB3dbt6Xu9sVmeToAn2MmZ4YqGxDLBDPs5p0v+cDm6VlamIk/6RCsjJ2sKqQjISQjI5kZaA+SZtZ637BErrA8ml66mjN14cTvM1yEQ/i8HLIXyKh4Y3BhlK0gAcJjYlmIveokHzRGsBQuJQBJi3sJPJmXK9c0hba2jQXck0FYj3iF0pLQRJUzxRLIBVg5xC9HORh1EOeI9hxppUSjC5FP8w5ePV9cj2qd3VohxSwVCtleskOzAWh/gnBd4t2EVXfDXqTuqyte4fxYfiHVf24DN4EaHFe6qzP9GoXzYOIpHTG0bSouJH+VhxlVS6Ixz7A9YgcpExeNkc/iD88SmM8B++nzk4IQasf0QI1z/6DYqswTtUI2xZB68kZ/aa1ck96QUMKq/5Nd7WpyY+5Zvbs49OG+cBRzLzhWQhTOoF7zdtkOf+DkbwNv6wHWcSF6dX4wl1e+S/zd4emj/7z3tQ8MCb0ky39P6gtciFKOzb94iaHP2pE7HgjM0XhJjsGFVLfV1FVH3Oq3vmQUd1veIdY7UmqO8RzZwyF7jT6a9RTD2EKReRXMPjTMKDSrfc7UeifeDe9PeWbW4EU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(38100700002)(4326008)(31686004)(956004)(66476007)(508600001)(186003)(26005)(83380400001)(66946007)(66556008)(86362001)(5660300002)(8936002)(53546011)(2616005)(31696002)(6486002)(16576012)(54906003)(2906002)(36756003)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cGXU2ovINCcSllekVNi2bA8D1SlhtnxNRoCzDKeaomiNlPzNDldGNtDiTfzR?=
 =?us-ascii?Q?1bqiR95ByTIeC1oSyrUiZmTdJVu2U8dClQb6ft/I/hoU0sNDCABb3Cvol56a?=
 =?us-ascii?Q?pibKilv9rITHh4VZagaYmh2dUoxPOTIm4ZN3ORotZPmrIewS5T+iTUyXRGXs?=
 =?us-ascii?Q?P0yToaN/WspljJvEoPkK4mdBmzLlT7Z5WgznQEHji6RJZSRCNorKDbwAMYfd?=
 =?us-ascii?Q?PZH29etw1rzVJu54iRjlBxEsw/e07fmZ3eWCgsqbMEtP7M3CD4Dju6p1aStu?=
 =?us-ascii?Q?tQVmSKVCdBTLw0QX5z4eg1CML62X/5PxPyzyvRjENvNm5oGTLHQdRuRQsX5a?=
 =?us-ascii?Q?keabNmpALrjfpk/8dNVto9L5EpLCbN3/boeR90iAVftH052Ban/+WHkMvmLV?=
 =?us-ascii?Q?ucVxVPF1xfPOxWpbJ5umRYRvuuegpouZdZvadgBrT13xaBQKxXWkEU/9hcBw?=
 =?us-ascii?Q?/Rqn2g3eh9nM8M6WkMvVjewnk8zq0cLp1kuHlvqLPd1Yu5mMP2Zzm2Fj6O0u?=
 =?us-ascii?Q?wc7SCSOyD41rTx64OMTYnRkfrBuTy1Wg46uFqXfGjagdZ9027aTTAmG2Ldas?=
 =?us-ascii?Q?Nrn6xG3K6gZPpobMLmaiKwX0Lh1+/sRJIxUoxu2MHwJ6tjU7CPkZtq7nvyZk?=
 =?us-ascii?Q?LKTaE68YXP9oBXsVyx5BxVAzzBVYbDLIy2xXLtofNiyDB0bPVyzdoYAI8gAi?=
 =?us-ascii?Q?kLznzWJfUC95AeN/au1vmv0BLR00lF8Vdcq47Ls43QeTGXrsOXlY0WlQKf51?=
 =?us-ascii?Q?SMKGekqM+unpg5KdGFgkr5t7H2gmZc2H0JPKyB3d0S2xBN8QHz88pZhrFGdc?=
 =?us-ascii?Q?/7xLSH5wVMe5KUxse/jS4v2b6iAIq1utspEEdyGDBPLv0UnlbtfN/z+OjAPl?=
 =?us-ascii?Q?GGFnkgqDuJ0RMH97nQY/jrVAK5yomLcJTB1intxnEPpTuCa5kDEzy8aOQd+k?=
 =?us-ascii?Q?qNnO5NCiz5qrY5zeM3cG+s4SWeqT9S30/yv63pI5yqPyGIMkKp5YVQSdWwx2?=
 =?us-ascii?Q?Q/WFNNXBrx+/mpVVjdbHw+MBZLr/Xdz77yt6eUprj6hUK0jNkzAZ43pyW5K5?=
 =?us-ascii?Q?Jh83SWFhXCqYWoB1ykO15Vnh65++hdr0LzA1iOleumOkFukDavceDvhKmNaa?=
 =?us-ascii?Q?xqmWMZZ8rTVGShCvyoGD7FLaWrvra0aSLl5ncBvysqkU+a9bv0lqmWw4mE2T?=
 =?us-ascii?Q?G4WjhymFCHXcYkIsVDOA7p75fDlm7vt4iPwr9nDqQcTMPAdJU14IeqAg8Jec?=
 =?us-ascii?Q?S91+OL7c5ITFIAkHiomgG8XuXO6DPMW0mZ2hKrfZx7/nsqa3615YiYYLD6h1?=
 =?us-ascii?Q?Mftc/VODUYwI7lUU/7t7VdfyDk7xBUaeWdC14+BPh7RRo1IUAk3J7cDbtqgG?=
 =?us-ascii?Q?VMVuCFP8Kv9LpjX0HnLbM6yYp/8UbP3So5sQYnv8aLdRbaCrVAc/fQVGC7VH?=
 =?us-ascii?Q?npaasam70WPPD7a72G0Up/Wa3z/OhB9cqEFGE0ER4EdGZbMurWH/oy5vgOuC?=
 =?us-ascii?Q?zad9uI8AbriWSnhjIdkD2AcZVbnv87TWKCwlnT4JvFOH3Hv7X7ZdFYsEtU7+?=
 =?us-ascii?Q?T3Y/XHE080O0CLnCZs6wSOrF54GyljHaU/YctedH59MdUXnQlLs+ZD7fL8at?=
 =?us-ascii?Q?RWuj9BUvQAESgXbQF4TlBgA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab58e24-a1ea-4169-b57b-08d99ed68c78
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 14:30:56.7906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /WKUe5g2L4l6dIhSqxWWVEwiAad9E7huIQF8DN+u4YYodW8fmiNiZfigtacm4hOpRbkox1ZTessaCAYvT+vKKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

On 03.11.2021 15:09, Luca Fancellu wrote:
>> On 3 Nov 2021, at 11:28, Jan Beulich <jbeulich@suse.com> wrote:
>> On 03.11.2021 11:20, Luca Fancellu wrote:
>>>> On 3 Nov 2021, at 08:20, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 02.11.2021 18:12, Luca Fancellu wrote:
>>>>>> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 02.11.2021 15:05, Luca Fancellu wrote:
>>>>>>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b=
882
>>>>>>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>>>>>>> introducing a problem to boot Xen using Grub2 on ARM machine using =
EDK2.
>>>>>>>
>>>>>>> The problem comes from the function get_parent_handle(...) that ins=
ide
>>>>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>>>>>>> is NULL, making Xen stop the UEFI boot.
>>>>>>
>>>>>> According to my reading the UEFI spec doesn't (explicitly) allow for
>>>>>> this to be NULL. Could you clarify why this is the case? What other
>>>>>> information may end up being invalid / absent? Is e.g. read_section(=
)
>>>>>> safe to use?
>>>>>
>>>>> My test on an arm machine running Grub2 on top of EDK2 showed that
>>>>> when Xen is started, the get_parent_handle(=E2=80=A6) call was failin=
g and stopping
>>>>> the boot because the efi_bs->HandleProtocol(=E2=80=A6) was called wit=
h the
>>>>> loaded_image->DeviceHandle argument NULL and the call was returning
>>>>> a EFI_INVALID_PARAMETER.
>>>>> So the parent handle can=E2=80=99t be requested and the filesystem ca=
n=E2=80=99t be used,
>>>>> but any other code that doesn=E2=80=99t use the handle provided by ge=
t_parent_handle(=E2=80=A6)
>>>>> can be used without problem like read_section(...).
>>>>
>>>> I understand this. My question was for the reason of ->DeviceHandle
>>>> being NULL. IOW I'm wondering whether we're actually talking about a
>>>> firmware or GrUB bug, in which case your change is a workaround for
>>>> that rather than (primarily) a fix for the earlier Xen change.
>>>
>>> The issue was found only when using EDK2+Grub2, no issue when booting
>>> directly from EDK2.
>>> This is a fix for the regression, because without the EFI changes, Grub=
2 was
>>> booting successfully Xen. Using grub2 to boot Xen on arm is a very comm=
on
>>> solution so not supporting this anymore could lead to lots of people ha=
ving
>>> issues if they update to Xen 4.16.
>>
>> I'm not objecting to addressing the issue. But the description needs
>> to make clear where the origin of the problem lies, and afaict that's
>> not the earlier Xen change. That one merely uncovered what, according
>> to your reply, might then be a GrUB bug. Unless, as said earlier, I
>> merely haven't been able to spot provisions in the spec for the field
>> in question to be NULL.
>=20
> Maybe I can rephrase to be more specific from:
>=20
> The problem comes from the function get_parent_handle(...) that inside
> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
> is NULL, making Xen stop the UEFI boot.
>=20
> To:
>=20
> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandle,
> that is used by efi_bs->HandleProtocol(=E2=80=A6) inside get_parent_handl=
e(=E2=80=A6),
> causing Xen to stop the boot getting an EFI_INVALID_PARAMETER error.
>=20
> Do you think it can be ok like this?

Much better, yes, but I wonder what "returning" refers to. You want to
describe the origin of the NULL handle as precisely as possible. And
considering this turns out as a workaround, in a suitable place you
will also want to add a code comment, such that a later reader won't
decide this is all dead code and can be done in a simpler way.

Jan


