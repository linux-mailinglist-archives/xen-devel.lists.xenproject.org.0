Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1F944409A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 12:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220812.382223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miERI-00054k-H6; Wed, 03 Nov 2021 11:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220812.382223; Wed, 03 Nov 2021 11:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miERI-00051q-Dq; Wed, 03 Nov 2021 11:28:20 +0000
Received: by outflank-mailman (input) for mailman id 220812;
 Wed, 03 Nov 2021 11:28:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1miERH-00051g-3k
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 11:28:19 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0699b40c-a401-4521-8586-38b8ca66ad97;
 Wed, 03 Nov 2021 11:28:18 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-guq2a9yGOrmcpeaoynr92w-1; Wed, 03 Nov 2021 12:28:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 11:28:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 11:28:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0098.eurprd06.prod.outlook.com (2603:10a6:20b:465::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 11:28:13 +0000
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
X-Inumbo-ID: 0699b40c-a401-4521-8586-38b8ca66ad97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635938897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2n2svHNxNDLE63Uar8d1iVm6EzFT9eo+GUhM05xxA3I=;
	b=DESVe6QKbX4DfkbAuEr2x4L7cPNmQYs782+Fd0AtuYWJ5ywM1AM+FHEHf8HAg65wruMIGR
	W4kUXjrYlBljzoLEjcTuoqETmleQWHB2nj5SX9WTh1xCsc2F7E9DeSdEJaEuAzgVlcbfsu
	P0NKXE/+1HdkGigaKqNrrSRWbrF4eAI=
X-MC-Unique: guq2a9yGOrmcpeaoynr92w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuwVs+GW+ZfJQhoJsjzVEDapq+d8s479Oam4vmBIiPnGrgZqSaH5M/R4vvHORrJdfvf53+dt1eep3031XAFGoCEjhNpIKFX0WlloQUVv92XMhTpxT8tr6cvuDRic/IB9ufWyMn/qqw4BbF+K1i8ZYHbRztYeIY1awo0dEn8XjU5FnyzMafd7SnwF7zI9PksutT3V9+LMa6FBmfa/uClL+GLkiDrk91hYaROhBi5pEiDKNhcy/uvT1SPjIdD510Bobp7Itj8GSA2oY6hwz+Na6kc1rg3q3g0rdS1G3tr0a7V1aeNa1BQG27VDXZD4jHzLkNxiIObul07SXbQsp4RXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBxnABk5/5EXAAR1dzC6HeqRbPLljn2VRahWR608SN0=;
 b=kGzvx5p99yLMqXV5WDdDnwVoCZXEB/MWLw8Il4F+K/z+tEUvZ9USnnYP8gp8eJy7AMHazmGOHYm1SRqCOBTNOmw9iYGbnuX1+y/D/cwGe/XBqz27SgHX8z8NhqwGFJrRCqPD6yDlNRY8pdq07oF/fJawy/KgHgFmcqN8G8QFSF/gwFv0C7INiu5y/plP5JXubCDHWXVGJzSVp7f4GfEmOCqF57PK2mKIIUbE17DEpAx18An46dbvvisd8MDjmWZHj4KMqfRoIZcL1GH2/mKObmQk0Q0C9nxN0uTLI09xA44QWmnOKfhQGe6L9onwGzTAi8MuqA0QueOJ4cYOQ6Pyjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16c6757d-1bb3-361f-a41f-26b9bc89a2b4@suse.com>
Date: Wed, 3 Nov 2021 12:28:12 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <845D8368-B9DA-4A5C-8F8D-6AAE55E326A0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0098.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 655322b8-011c-47ec-8ceb-08d99ebd0682
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB43842BEFE92364A947F53C53B38C9@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XKj1UzxNewFYqhEkWsCqCfkqJQMPxOMrRl0y77/XvE2UoSy1ELbXkVQ1cL35Bs8Yyu/9dLBC39s1MgbfC+BugFPfGwcYxDulAjiCY23Tl1f5i//gE6Ec4cYWHlpc7ddOzUzyOrN70bpQE+S3kvxTexz1j+RAgfqXND9z9NZPM3vx7LukgmjTAQf8NlOdCaRLDimCzcJU01WXCvNwEGw5I3qOp86VT66PH4h/myz0wxCSODKWGemIQvQYj5Lyj92V7x8uhp9BV3Jgf4hqxWNe0kAkkw88EIfUL7UxvVe+QSPNtdxvXNWmHHkLV2eGrR2+8/N4VKScErrpFdZiIrcznDm1k5yq/RJW+5qvscJIxgPs5K/aFzOqkaeVCq1Ub7k9r3Zl1x8Eq5p2DmqZ8yA2mFgBKGg85Dv0HWad41ZMpuTV6VAGf3HratafZPkEZIh3yr80tz5TipPh8d2eQ6gzOoN3y+HxWU1aA+mpf10V7GmULOPcNjLL4+tp5A/HiJy4NdDQcrakBrquh2xSoPuKCHbB3z8sCq4SjRNNOUYm90xKFmF2GI3UHMvbilZAyWFfYrtkVYlLZHrabMMeRora2ndPm2MTgwi5nicX2iHgshePSFpquZ+jV4PifoKD6dC+33rU2zXZzmqiV6fSkCBsUl9PPxthuYX8bEXaym6TkTK7jJ9PXWNVYp58mP5VBM8Q5HZQvb2vSOXRNsTyVeFiatnSKtEZxM+RB+ST3RK7xFKTLBPpGSc2C4q9sGFMFaus
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(4326008)(83380400001)(5660300002)(38100700002)(186003)(26005)(53546011)(2906002)(8936002)(6916009)(956004)(16576012)(31686004)(66556008)(8676002)(508600001)(36756003)(54906003)(66476007)(66946007)(316002)(6486002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?riFtoSqVWwlYpoIAfM5IUBOfnN0NEuObys6IE2prujZNmui0Lv0SkhOhHBti?=
 =?us-ascii?Q?0q0aMPlWmTqfevZbL0XbLQylBjg5GB6U23ULUmGtGbjIkLfD5MIaBr8c6KaB?=
 =?us-ascii?Q?16B1cir+s6kcvmPFaVMnBWyS5K5JDLTFE1yy/euBS0ez7GQsvA66wEjRmR1A?=
 =?us-ascii?Q?ZD4qbo6U/5W/XAbqNjGizELv/89S+HFWGwR44Sm7dbPOZyPqiB7X6HT15OXg?=
 =?us-ascii?Q?GLyPFEFyHhy8WLLUTMYeXcFZJ1hGtAE3ralVplz47pM+AdA+sZTdBZgCezk4?=
 =?us-ascii?Q?YtUweCu4bpZdGm3yB0VoWGFhzMEkNafM9XvhS8aRdWpMggOtIoMGH476E33B?=
 =?us-ascii?Q?O/L/ww7COJRYwKIpHrFhFT7LVM3GTOmCGu6NE9GBl0pm7SFM42wfVxHxfDm8?=
 =?us-ascii?Q?01zemGq7WMA+UlRY9Mtx6UU0DOrFjS7aON1Jhr6/eEaqPYJPzs+G8LCQ6Aih?=
 =?us-ascii?Q?dX21eQiOj24w+OrDx5vf3J9aysYrI/NH+n20C4gMypziyBf9N1ScVveiMh2V?=
 =?us-ascii?Q?yKusRJnTpN4w74gJ1f/+lvVtChp4OgR/AzSIaXweJTTH/9eVyVi/uPfMDgVW?=
 =?us-ascii?Q?eQdC7ITkd7AQwLzE7GvcQGcnqZlvOvCT2mJtQIjgJ0qQVXaa4Hjqd9P7XS+v?=
 =?us-ascii?Q?pURtwYAIBO71eZxSStXgBbFbwAgpy5pXIUGabiPzxJu0V/056FmA3sAKUsVr?=
 =?us-ascii?Q?Ko9/wiZkD0Ax0ZWMoc62/f8Pcmn693lXTcd8Z3nKlAmAiLU64F643x3jWhme?=
 =?us-ascii?Q?G+z7SYKpcwlw0kaSmYFnTz5mA4pVjoPD8eQNSZovMQ6uyeBqC2NP/PA8cpl7?=
 =?us-ascii?Q?JN0AP5WhTnacQf4QabsVW96+1SkcHx2lasoNurl0P+tf7JTLub6Ap10PLgeQ?=
 =?us-ascii?Q?yslqdUBgv0BskUHN1OJ3njPk2nqjl2Xmp/1n6TPdPeY4FbkSoeA0HNKaVmgm?=
 =?us-ascii?Q?gLtaTlx5S2IcMx8nbTjqVtLh7MvzKIT3JLwxBRczNWgWoJDACFEmxGdV+FIH?=
 =?us-ascii?Q?EFHS7adsaRumxTwwPY+YPkJhfRlLVpyPD2lp2MzTpVRVLfoNVCQGrtXq2opl?=
 =?us-ascii?Q?DA3ItzHzYXfKTeBz3dxAcrAi8pcJ34PYRgjYlP3zA/0sEvtqOJI9mLjrUGeh?=
 =?us-ascii?Q?oySGcnfDUC0UZ0UoPuwwoY3dPvn1I5+yGkrWt/cclaAonzKm2plnMyYS3WgL?=
 =?us-ascii?Q?3B1QWsk12rkErYYCDS7rWGR8rLpMocVXPFgRk7scbFnevKcxbyOdtDdHPybS?=
 =?us-ascii?Q?hNGpwKAu83aj1O1GxFg76UryFMOwW/yg8Iyo4kVzwzfE9U8HXgiVuiZtJxhQ?=
 =?us-ascii?Q?wtFbU56DCemB2MkR4D9LCOjziN+cQjMjUjb+Vm7g5HoyUDHfW+JNv04aBMAy?=
 =?us-ascii?Q?6mJAd0aF9ept4pap+pfk2m1+X0jzWQStjuxzFiJ/w0cL+zXBlyQIumh5AkWi?=
 =?us-ascii?Q?Mt3o4pGztx/pRGTJqSrzUuhnER35SZ/COuClqoCbbzyucoEcMR3u8eWUodlc?=
 =?us-ascii?Q?XdWAGWzepWwfzqQujRARUXjrfaJofij04OY7i6RU0hvQnZDot59Zpd12T5px?=
 =?us-ascii?Q?cRAufWha92wgbo0abX0KSEfx1df3ka/kbcNeGlwLHl82IP4HIyJHdvyTuW2H?=
 =?us-ascii?Q?WVAo5Z896hGh2HjM/u8G/Cw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655322b8-011c-47ec-8ceb-08d99ebd0682
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 11:28:14.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJ6QQw2HMR7sPVEbfx1Ubnpa9vW3q9UUeaSOf50meM09pIuJGlCaEDX5d0cjCuxJ2IFQ4ZaqAzeR+TYqvS3auQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 03.11.2021 11:20, Luca Fancellu wrote:
>=20
>=20
>> On 3 Nov 2021, at 08:20, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 02.11.2021 18:12, Luca Fancellu wrote:
>>>> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 02.11.2021 15:05, Luca Fancellu wrote:
>>>>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b88=
2
>>>>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>>>>> introducing a problem to boot Xen using Grub2 on ARM machine using ED=
K2.
>>>>>
>>>>> The problem comes from the function get_parent_handle(...) that insid=
e
>>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>>>>> is NULL, making Xen stop the UEFI boot.
>>>>
>>>> According to my reading the UEFI spec doesn't (explicitly) allow for
>>>> this to be NULL. Could you clarify why this is the case? What other
>>>> information may end up being invalid / absent? Is e.g. read_section()
>>>> safe to use?
>>>
>>> My test on an arm machine running Grub2 on top of EDK2 showed that
>>> when Xen is started, the get_parent_handle(=E2=80=A6) call was failing =
and stopping
>>> the boot because the efi_bs->HandleProtocol(=E2=80=A6) was called with =
the
>>> loaded_image->DeviceHandle argument NULL and the call was returning
>>> a EFI_INVALID_PARAMETER.
>>> So the parent handle can=E2=80=99t be requested and the filesystem can=
=E2=80=99t be used,
>>> but any other code that doesn=E2=80=99t use the handle provided by get_=
parent_handle(=E2=80=A6)
>>> can be used without problem like read_section(...).
>>
>> I understand this. My question was for the reason of ->DeviceHandle
>> being NULL. IOW I'm wondering whether we're actually talking about a
>> firmware or GrUB bug, in which case your change is a workaround for
>> that rather than (primarily) a fix for the earlier Xen change.
>=20
> The issue was found only when using EDK2+Grub2, no issue when booting
> directly from EDK2.
> This is a fix for the regression, because without the EFI changes, Grub2 =
was
> booting successfully Xen. Using grub2 to boot Xen on arm is a very common
> solution so not supporting this anymore could lead to lots of people havi=
ng
> issues if they update to Xen 4.16.

I'm not objecting to addressing the issue. But the description needs
to make clear where the origin of the problem lies, and afaict that's
not the earlier Xen change. That one merely uncovered what, according
to your reply, might then be a GrUB bug. Unless, as said earlier, I
merely haven't been able to spot provisions in the spec for the field
in question to be NULL.

Jan


