Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C6444478
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220989.382476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHzd-0004hw-BO; Wed, 03 Nov 2021 15:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220989.382476; Wed, 03 Nov 2021 15:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHzd-0004fQ-7m; Wed, 03 Nov 2021 15:16:01 +0000
Received: by outflank-mailman (input) for mailman id 220989;
 Wed, 03 Nov 2021 15:16:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miHzb-0004f1-W0
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:16:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2380f3e-3cb8-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 16:15:57 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2059.outbound.protection.outlook.com [104.47.10.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-6-GsRArUnqPcKlPANKfkPolw-1;
 Wed, 03 Nov 2021 16:15:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 3 Nov
 2021 15:15:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 15:15:54 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0083.eurprd06.prod.outlook.com (2603:10a6:206::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 15:15:53 +0000
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
X-Inumbo-ID: f2380f3e-3cb8-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635952557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tbFV5VcEZ7yiZgrCxBjjgmu6atK9oeWV5KuA7tgKiIQ=;
	b=l4tvYiS6tU5SWPCSc+R/MAnMrYKYu7hYdmspOvM0osZt3b1RkbUun90E/E2m1wUJQBTmC4
	xXGov5fgYqPb2bEK3GUfM33LUI9pP/6AJq3ZD9N+rOCRUnlHKUxhFWjQwGbyLNe4KuMpSX
	Ja/FtXYVKX19ZSuy751PxktW/3FiC/A=
X-MC-Unique: GsRArUnqPcKlPANKfkPolw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/BfXyMEnc42pn74n6WpW6kfQsh5sc3hYV88Ri65ZqsQfUYBn0wUR0DvN8ZZdGGHbN0KMSyuLn3ZPyZyrQRRspC/XyS9finAvjY8vGvD8zQMzYTVnEEh9YdTXee788GFquMawnDbW9CyKV0MnJ1CKbdblDsO6wTmjBdYgxLTkLV9Rc1rgEzc2hG3085YooBGo0yhv4ZcfLr9Cz9Akp66AMZRx8TnMzaz3tb/gf5/FMCIBq47bxkYZhGBhGnh6Ub9UjV42D+fY/u41XwiaF9ownsmXI7f59TBfkCNU9Z3km5QwjDYgkkE96o9h82DuJA+c/pqGYapKGQTLofVmqTMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm8onhya5KdltAdEOLZM1NDX0Yr+uFyMZqsCG2PXgps=;
 b=Aln02pGr2dZ7Lv+Y4RlljZgZ6yFdVCTzu4mS0sZTTfODFFxSk7F3T9dwSu46tD8QbLZXdnXD2Na2fN4PXAnI4NvJkbHI5JcB57mt8ehanwbxd7t+e86IMmjL2tUTL060o1cWWNBqqa3JEW8hZMFneCK8suPAF2PbscHTVQBC+XeImhSLm9ScY076SH5tPtjPlcTTRGJR/zALchkQyO5gEEHQpbb9e4HA8rllY7aX9xMjM49LtKa1nhM8+2mrQRMOp8oIbRH3s3Rp601MIyTRDk9pYX8tEOJ8WEgSXabOoGLk6iyj96NrUAJi+3gjNbHQ1vJTwsMwFEpEtEcj3DxXOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ebe6b551-2302-830d-72ea-8d4fae1c411d@suse.com>
Date: Wed, 3 Nov 2021 16:15:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 3/3] AMD/IOMMU: iommu_enable vs iommu_intremap
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
 <YXaGxX3J1aB39mSG@MacBook-Air-de-Roger.local>
 <dd2929fc-dc1a-1c16-5954-6894766d9dda@suse.com>
 <YYEa6HQGR1cHJBw/@Air-de-Roger>
 <bcaf1547-98ae-923f-5be8-50156e318bf4@suse.com>
 <YYKldeiym0fLWTsa@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YYKldeiym0fLWTsa@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0083.eurprd06.prod.outlook.com
 (2603:10a6:206::48) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ceb90409-3896-4e75-6e22-08d99edcd44f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4605AB90A339931129E2B7E3B38C9@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zdh20qz9r2cc6N3htpE6hAxZwjaQ9aHpDZhkOni0kULjzNkBmu6Tas/hsUFoLYgpBa8JPJWxQz2snIL1w7kZwn/oiK8ekXdrMoSqoJS6rtuLm3lXZX6ROOf3oJhgPxwkwZR8tHGsUhX5+rQiIZJLeJhzd7VQOoZFXJ0msvtHLmSetNkIJK6zk+wRWSBP7F6JRKcVvf2mi83doRIzMar6HV/Keyx1WZtxXjnUL6Wr5BGN5KtsvMpFLSksuLWI48D6Ypm6xLJbCe36NyPi+uFVrj6gd1h7mrmQs5mj7MScXYMxeueSEqL++3b4rowLdX7Z2gK0+ptDIqvERSEm2YdfWN8otUUV4UnpU0qbrwnYDyy4NRLahglAsOFUQvv+k3XJy+oO9pd8M9jQ5UX0XnXsErUopjD5Y053ravIm9M7VkcYeupq1FTQg+3Qybo7Z73NZqbeeF/SdjAQqHueoZCiCP2i4H/+Perww1DvbQMQ7KtY1XtZ3MVnHl/YRyUcDv91jcEHJC+Og8zt+6Chb/ATXe0bPG21uDfXO8fw2GXKLG6W8wJssFQMwi7tXi4JlFsDOAeGT4qlGwy2JwEN1bZvxQpDKzAJwpyLvb2KNmAucg8kPL8mnqFvzhb7LeU6pO5oAjt7kPRkLYyW8D2gbRzQos3Bvk9CT3we16V7nZQg7PSFybaPHZQcoOK9NmKgPEppgrAe6W+PcwkaB95X6fAPs/YBwfsRtCkSCheMp8gh4rRpoVdLF6kTPAibQZTSp7Rz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(110136005)(8936002)(956004)(2616005)(5660300002)(186003)(53546011)(4326008)(38100700002)(508600001)(83380400001)(66476007)(31686004)(31696002)(2906002)(16576012)(86362001)(316002)(26005)(54906003)(6486002)(66556008)(36756003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PDjxr5GDggwxaIsAaszILs6dVC0seIMpd+H1rh6Pkg0DQ+c9Vu/kCpvITYVs?=
 =?us-ascii?Q?jIPvO83IMv0BxEONzgAppQ91D5880RM7ZZEJPdOJMAX//t8zV9CebDBZCdtY?=
 =?us-ascii?Q?x9pUJ9xm3PPBkauCyr4wcuYoGXr8lXbuSTEBlC33/CQdZSC58R5u1YtgVXF3?=
 =?us-ascii?Q?GI3Ws3v7htI6CuCGQUxYrANHdcEQ/po9qVnjs6at5rirAN5DvceC1KGPHlp2?=
 =?us-ascii?Q?bRnZyfdzR06MzW8c5fB+enmkUNxEQCYUSUOfIx01X8bglLajmi2tC67b422n?=
 =?us-ascii?Q?wH8CvTHv0itOeD/9sxRzavDZoeFajkWBHvpEsbcnkTPXcVfH90kT3ZSNxzmy?=
 =?us-ascii?Q?fm9a2XJrCKNcmNHnzXT/TYUOVBUbu2+ZW0EekArwNxle2Uk5ZB1TgT3XZfuA?=
 =?us-ascii?Q?rwVQYIluHh7EmUgFwSIArTiOr8zs+f87KcItoW6ViBKVWKxRI4u2ZrMGawN8?=
 =?us-ascii?Q?AVp49kqd372+vuUq/nHdVa2L8ALJlUKmtwXdkw1uCMwH+PzTQaoagIXk58PE?=
 =?us-ascii?Q?6VAiFYN4HhlJEHShh64+tvrZ5nOl60aFpPUCFmuVJUiKEFaXs0ZzcnMONWOW?=
 =?us-ascii?Q?4ZboZgemWn2LIVOS09EkuPSRVMe3qM/siRGaR8K3WzH6ASLdOVZA3zbBuZHC?=
 =?us-ascii?Q?4HvQM9WqFp4dGJ1UbQ5yfPwC5nyBy3f9h2olmnqUlAB1guGliZ5Ehj0mwnmX?=
 =?us-ascii?Q?yccaZtiI4MS6tCIMt45nCls2aH6Fsqc7pCnY4xkSadQfDkJ7J6qU62IVYAV+?=
 =?us-ascii?Q?B4suvZNRdg5VaFQnaLJwYq/QOJkOEGgWV28tgNo4AI4jchvPtttjSDztogWa?=
 =?us-ascii?Q?zy2Xi5AUZzVUfD4TA4zYzYVCSowzi6cIHDEJ8THSPyAeHNT8ctVE1/nuLPDX?=
 =?us-ascii?Q?LnPQ5QF7Cp4U9KXcaUYOCgxX4M1haSXMmpu2UiaU8OBTUqZt1cg/mRGbV8lX?=
 =?us-ascii?Q?0+rxc19cqylh7flhEfsFchD9GFY1FJ9p3WUstZBCsA2P96GIBnTLyLIbTWbx?=
 =?us-ascii?Q?rvd60PdZ9V/UzgnRjeLYwDVJzwFVAd4HqvPkqeuv8hp9YtrEgQ2VlFMBRDr3?=
 =?us-ascii?Q?FWzUngwNQoAHw9nTefNh1f9w60RY9thH9lPfE1F2nEkNihGT1+R7wvvrzKcf?=
 =?us-ascii?Q?CZXf7qNMThxDxeZgJky4RK6Ca5v2UKVgE032LYweBHrdv+tcTqrqI6DC23Wx?=
 =?us-ascii?Q?FFPJcTtI0a3+xKaqfYPQ3ZNDfCyhshf+QPfawUzoHsyLTXwPJzjiuGZBAFCl?=
 =?us-ascii?Q?Esn6zXV4E9EWdCmyTZehWl+uGE5CvFkOxvHLxE/gbN3CC7GnD0x/eNEU5vh7?=
 =?us-ascii?Q?EHA7ROQC/aqTTuqrKPwoFCzkrkRkQ8mML1DM0YJck7h9xliiSzc0IxJY8nar?=
 =?us-ascii?Q?5Xvo739ryR8Xbmi4Ca5yrySoz+wgdMA2SJ2xUp7Bo+lt/Cbgzpct/bWr4Krd?=
 =?us-ascii?Q?qSnDQ+DBG+vuQNlVk2+5prGWyQWWuSAAWlpUvsiIoLvtMy6xm3VexHU3Jr0v?=
 =?us-ascii?Q?rbPhldjTH5HtiD1O3yc+MpQbJsFzQlWB+10wPQXFWGSeXEwWyuANQjZrRCiI?=
 =?us-ascii?Q?w0UuaGQC2iCusGhyIdaT+Io1brt4Zsu4AQUgokclLw/s55vdXViP2GqHGz1X?=
 =?us-ascii?Q?qfBkOa2WXZLFldDXtyKH4Ek=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb90409-3896-4e75-6e22-08d99edcd44f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:15:54.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rDv5bFrlfih6elkzdulXAoKiE3AJnGZV+ld8Oiqq53ZpuqY7agWfGmjY3pRN3HjBryElXw/Ly13adYrLgqb9CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 03.11.2021 16:06, Roger Pau Monn=C3=A9 wrote:
> On Wed, Nov 03, 2021 at 10:46:40AM +0100, Jan Beulich wrote:
>> On 02.11.2021 12:03, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Nov 02, 2021 at 11:13:08AM +0100, Jan Beulich wrote:
>>>> On 25.10.2021 12:28, Roger Pau Monn=C3=A9 wrote:
>>>>> On Thu, Oct 21, 2021 at 11:59:02AM +0200, Jan Beulich wrote:
>>>>>> The two are really meant to be independent settings; iov_supports_xt=
()
>>>>>> using || instead of && was simply wrong. The corrected check is,
>>>>>> however, redundant, just like the (correct) one in iov_detect(): The=
se
>>>>>> hook functions are unreachable without acpi_ivrs_init() installing t=
he
>>>>>> iommu_init_ops pointer, which it does only upon success. (Unlike for
>>>>>> VT-d there is no late clearing of iommu_enable due to quirks, and an=
y
>>>>>> possible clearing of iommu_intremap happens only after iov_supports_=
xt()
>>>>>> has run.)
>>>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> In fact in iov_detect() it could be iommu_enable alone which gets
>>>>>> checked, but this felt overly aggressive to me. Instead I'm getting =
the
>>>>>> impression that the function may wrongly not get called when "iommu=
=3Doff"
>>>>>> but interrupt remapping is in use: We'd not get the interrupt handle=
r
>>>>>> installed, and hence interrupt remapping related events would never =
get
>>>>>> reported. (Same on VT-d, FTAOD.)
>>>>>
>>>>> I've spend a non-trivial amount of time looking into this before
>>>>> reading this note. AFAICT you could set iommu=3Doff and still get x2A=
PIC
>>>>> enabled and relying on interrupt remapping.
>>>>
>>>> Right, contrary to ...
>>>>
>>>>>> For iov_supports_xt() the question is whether, like VT-d's
>>>>>> intel_iommu_supports_eim(), it shouldn't rather check iommu_intremap
>>>>>> alone (in which case it would need to remain a check rather than get=
ting
>>>>>> converted to ASSERT()).
>>>>>
>>>>> Hm, no, I don't think so. I think iommu_enable should take precedence
>>>>> over iommu_intremap, and having iommu_enable =3D=3D false should forc=
e
>>>>> interrupt remapping to be reported as disabled. Note that disabling i=
t
>>>>> in iommu_setup is too late, as the APIC initialization will have
>>>>> already taken place.
>>>>>
>>>>> It's my reading of the command line parameter documentation that
>>>>> setting iommu=3Doff should disable all usage of the IOMMU, and that
>>>>> includes the interrupt remapping support (ie: a user should not need
>>>>> to set iommu=3Doff,no-intremap)
>>>>
>>>> ... that documentation. But I think it's the documentation that
>>>> wants fixing, such that iommu=3Doff really only control DMA remap.
>>>
>>> IMO I think it's confusing to have sub-options that could be enabled
>>> when you set the global one to off. I would expect `iommu=3Doff` to
>>> disable all the iommu related options, and I think it's fair for
>>> people to expect that behavior.
>>
>> It occurs to me that this reply of yours here contradicts your R-b
>> on patch 1, in particular with its revision log saying:
>>
>> v2: Treat iommu_enable and iommu_intremap as separate options.
>=20
> Right, I see. patch 1 uses
>=20
> if ( !iommu_enable && !iommu_intremap )
>     return;
>=20
> Which I think should be:
>=20
> if ( !iommu_enable )
>     return;
>=20
> Sorry I didn't realize in that context. I think we need to decide
> whether we want to fix the documentation to match the code, or whether
> we should fix the code to match the documentation.

Except that adjusting the conditional(s) in patch 1 would then
be a functional change that's not really the purpose of that
patch - it really only folds acpi_ivrs_init()'s and
acpi_parse_dmar()'s into a vendor-independent instance in
acpi_iommu_init(). Alternatively we could adjust the conditional
here (in patch 3), but that would feel unrelated once again, as
this change is supposed to be AMD-specific.

> My preference would be for the latter, because I think the resulting
> interface would be clearer. That will require introducing a new
> dmaremap iommu suboption, but again I think this will result in a
> better interface overall.

I guess we could do with a 3rd opinion: Paul, any chance?

In any event I hope that we can agree that patches 1 and 2 are
okay for 4.16 in their present shape, and patch 3 (plus whichever
further ones) would better wait for post-4.16?

Jan


