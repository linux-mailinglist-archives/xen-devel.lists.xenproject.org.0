Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E023A6966
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 16:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141599.261498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsnzH-00075D-HV; Mon, 14 Jun 2021 14:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141599.261498; Mon, 14 Jun 2021 14:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsnzH-00073E-EJ; Mon, 14 Jun 2021 14:54:51 +0000
Received: by outflank-mailman (input) for mailman id 141599;
 Mon, 14 Jun 2021 14:54:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lsnzG-000738-5u
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 14:54:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05de688b-994c-4c87-9b9a-a91ea1c9b1a6;
 Mon, 14 Jun 2021 14:54:49 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-WsWonu0xNMCJ0hregxWC4w-1; Mon, 14 Jun 2021 16:54:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4381.eurprd04.prod.outlook.com (2603:10a6:803:6d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Mon, 14 Jun
 2021 14:54:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 14:54:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0027.eurprd09.prod.outlook.com (2603:10a6:102:b7::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 14:54:44 +0000
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
X-Inumbo-ID: 05de688b-994c-4c87-9b9a-a91ea1c9b1a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623682488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fAtRyQyrzSI2zQa+qFmddlOQ84F0wuvcIS6hczk4Yg0=;
	b=K6lPdxxMJmYlRehEnD72meZ8mChFZg3P9LXbhOq97mxzSTUjo5ckQO6kCW0zrz0tU+Pjkd
	QM/nHJMwhHUMMb+Ly1YOOFR2FYV2xWm+RpQOYGKVsGt4y6v8HIPrKrJ+Di7IxAA6X43cRE
	0eN60Ye5gMw5Jn631kxa17lGkWgGxs8=
X-MC-Unique: WsWonu0xNMCJ0hregxWC4w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVrxNmtf/Xcsmy7GU5ZLdtQHvQe6i4ZiTtyU96MHedO/HUd3FRkUy831dSDV7E8aBAZdknVEotj6RA8zL7Dk9Z4fMl5NkFDy9yuCnUF29gQ9ZzPFYPujudhWRQDMFvEQ1rXbOMHhT6mRj+2WrQKqyFoiFUidALxoqxv18SmPz9koD9CRPEOp4gN3B5CMcu3kvI+FUiSg+Nw3knmtddGLwSZXW1/j5FjYtxnNOmEJgu1aG1B2suWXbUmW/dYLhlZ04P++KSVv56nLsJr/ZoxLWdxlUKCT25AvyASToXcKocFzI+VlE6+EsvAwNpILCT3aymKakr4kiv2BXDgi9KAbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9msd66WVmd+Kgz8zkugch3nW8/svijeNQJblOIY1hK8=;
 b=Qgk5etmnhX4E5dQ3D7wpCZ3DZHqZHtypZVmcPS2XBUGCNXucWyZ0c6e3goNDJ306RQwgGM3ZW319NXXQYANa4QXndvvf/cuuDfWnuruCXcNvBLxLy0T+reNbaizqq/j4AOza5R2Kh/oc2X1++nyes05pKNMTjnqD/DWAmAKnDdw0ZKEuiRiBEAGEZWPxPFokUpBx12JhFXiKkSgUSTntKY8eniCxaP8mX6RIqIkfqvXwVmszg3PiLwSyVxlBiCFvpaSgU6sHGZLUPjcIkw5zJNxCy5840hYSPy3w52gkQVdotBBWH8fWfHY0NEFPL/w+LJoFo7yJzIRtEheU+FmQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/5] x86/msr: Expose MSR_ARCH_CAPS in the raw and host
 policies
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Edwin Torok <edvin.torok@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
 <20210611163627.4878-4-andrew.cooper3@citrix.com>
 <bcb7cacf-f18d-ed74-00b4-854b403bef2e@suse.com>
 <9105e14e-3a3e-4e25-e809-702f72207f11@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a7e671d-a44d-7734-92f5-0bde2e56fca0@suse.com>
Date: Mon, 14 Jun 2021 16:54:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <9105e14e-3a3e-4e25-e809-702f72207f11@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3PR09CA0027.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c84436fa-1fff-4a3c-29e0-08d92f4458ed
X-MS-TrafficTypeDiagnostic: VI1PR04MB4381:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4381875E3882EDFA5B6113D8B3319@VI1PR04MB4381.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xV4DrWajGu0lhL5XZNS/pZ8vCWebRTgTNyfIeb9qRy66qJs7oeyR2Zk5CVmviIFnSPY9njHDZ40vjoNzp6nxuPhWwTV6eixABT7xEXKGMxy9fk7PwOv+2SCEnnm7aHNqZ556cmXP3mdywD5AtcTZpYPqCGyy2lHS25HxfVmPvOflFihh4RZLMt+MAFQiFzLzTw3sMGTMTxwQEoD98Nr3oWxIcbSPSVG8K7bfswO3+nuP1tI0Bb9PSPcLJXgj+/w/zKlvKd/NjexbgUMPn8vkmEWX3oJMumkxnoV48cBFgBuS89xqxOcpQRxSF8v2yaIRRkc+Cf/2ZWfXCRi5T+2xI2A71AzLeApkanL6/r+ZFF3GW3U01Gq3QpBpT2PrsqhSwu+G5rW2OGlC0zWR6ETy4N26iWQW+GpNBAx9ZaclDPSR4qE3o/MLWDf8wvtQ5txG3HvId1F/cP4krw5VxbngCz8fzu2M6IiXT1/UmdtzjC7+FNie35vKoQx5fu1S0ijsOzld21H5J8iMVGJrkRNhw6v4m7Oo+L9MBz1LI7C81Eb08Ia6hfgLUsXitcFN4ztPEZooBgdp8GkYspUM99wzOYlCCCsoCyTpDgo8aPME+wx7nq8FFSzwhqAAj1FxCw8AXU2abiI1lVFb4ZaxOfgjiLK1GK+4DEMdYanDXO8c6xzmd4/AmyWFVMRKrLF/lT6o
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(376002)(346002)(366004)(136003)(53546011)(31696002)(66476007)(66556008)(478600001)(38100700002)(4326008)(31686004)(66946007)(6666004)(186003)(36756003)(16526019)(86362001)(6916009)(16576012)(2906002)(83380400001)(316002)(8936002)(5660300002)(26005)(6486002)(8676002)(2616005)(54906003)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fh2HcaeheAf5D443TRFPvIseXJ2flNgnxKtv8V0cL7r/GtPEtih09wJ8Qc8h?=
 =?us-ascii?Q?fVL7bifOgREg1fEa0hg0dcUjMzmY9Pfpk5dfiOpvRO8lNG61/cITYI5R3Hwf?=
 =?us-ascii?Q?km7u4EAz/ZPGzFm/2u4E/7ew9FmWkq0ebLK43g/WUvMgwmRiAM21n+k7HuRO?=
 =?us-ascii?Q?e2kKsW3DD5UKvGK47w8pbUek5txmezJwXMFZmx9OZQ5RUc3DcSj2iPLPHiEw?=
 =?us-ascii?Q?ul7j2fDyRJzvOhdSuKVbCFV19YPqN4Q6hAmRg7eyani6mBs1wStYWwLR6KTn?=
 =?us-ascii?Q?DZLZQWJSvAzCJ4uhXJJn+KHuO27JfDRGCLGROE4y4IXPcyFJG4npGE5K0MbJ?=
 =?us-ascii?Q?xa4TQGuyheloiu/Z+wRxCGjXWt+Bk34yGhniRp6pX5pQH1y5EmwyZTSxBMWx?=
 =?us-ascii?Q?LZmqR8NOEvdU2/Qn4X8uOisW/qq8p+id46iA18EciPJD/da6sc08qnM5jsis?=
 =?us-ascii?Q?b18QXWw/UCTON/aY5envipkRvoiihT7n4jJZyv9pcBhq+z4hPR62BKiyF+Uc?=
 =?us-ascii?Q?3doDfbG7sJQXlYMClo8mU5uih4E5akSr17a7zcmPgb38FhAyJYwzOEEHk+SS?=
 =?us-ascii?Q?xuUSEWL2vy97UughjoyhJxZAuuCADWKKxzMyaE9PZjLjYZVkzMLGBKST9Ex+?=
 =?us-ascii?Q?nFH14w8jXaUX5MTQAZ955jXBF3ccqeFPD0J1vF64r1PzZPAiLKjaxSmXJ+4k?=
 =?us-ascii?Q?a9mY35iEzJT2aiVLxoiggKzaNCV9VFaPR/jO46cTyV2DWQIXPr+Bm+89MKdr?=
 =?us-ascii?Q?7H8AIlbbxi/ewvBgUFbYi1wM6SMSLQp5pJkgVbldDU1zn0H3j+ngxnpdW7FQ?=
 =?us-ascii?Q?RFNY/lv9Cgd71XO2ZusTepynmNUNsgGzWRRG/OXKztvSt8BaTJrEZCrx1laD?=
 =?us-ascii?Q?0FVICsb+2/imdFE8czhRyVDnDx4BUiadaYIKw6AYPGmNNNh3gM9pEahzOPwY?=
 =?us-ascii?Q?+LjH9rQJT1hWwY+uF/UWqgdJ1rEqG0CZ+5koKZEMVcvjr4W4nBfh6qY8IyEq?=
 =?us-ascii?Q?Q0LMPEqCg+Vs6u1XhgZm+41Z5LwifoOa1gk/795FoLtyHgpELiPNYb3VFXRl?=
 =?us-ascii?Q?2XUZ3GpLFwenujb6YBh0LtM0qa5yhdcaufisZO4uoNXgqGPPQid4KB4tdLiH?=
 =?us-ascii?Q?sKAx+cAVXZ1HLohyeEA3iTRi/zsrdyqCzrSe69OsYpCk3eurWPhtD264svN1?=
 =?us-ascii?Q?wdoRVDmDcSdyLDlx4g5cuAGeCU5nCqEmKMlh6kcTOyLpsiBBFM84WfdLD3eE?=
 =?us-ascii?Q?rQXjU93eD9JlcRk4jPVQOxkqxK9tJlWmOt4WS8jZg7SZWyoU6PUO3pmKEKIj?=
 =?us-ascii?Q?KBgNWqC7b6rS14JGrpiNEu70?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84436fa-1fff-4a3c-29e0-08d92f4458ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:54:44.8473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qOi0+AgFPS1cWtiXMXGJLb6Hl8LQucvT7SXpSDxhSmixwgdH03DepKc34oCNu4DvlCSGObZZqf5PppYPP60Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4381

On 14.06.2021 16:10, Andrew Cooper wrote:
> On 14/06/2021 13:57, Jan Beulich wrote:
>> On 11.06.2021 18:36, Andrew Cooper wrote:
>>> @@ -60,6 +65,11 @@ static void __init calculate_host_policy(void)
>>>      /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
>>>      /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_=
ENABLES */
>>>      mp->platform_info.cpuid_faulting =3D cpu_has_cpuid_faulting;
>>> +
>>> +    mp->arch_caps.raw &=3D
>>> +        (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
>>> +         ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
>>> +         ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_=
TAA_NO);
>>>  }
>> Isn't this a little too simple? For CPUID we consider the host policy
>> to be what Xen is using. Taking ARCH_CAPS_SKIP_L1DFL as an example,
>> we're not using it unconditionally (depending on opt_md_clear_hvm and
>> opt_l1d_flush), i.e. there's command line control over its use just
>> like there is over the CPUID bits.
>=20
> But we don't go clearing CPUID bits for features we choose not to use.
>=20
> ARCH_CAPS_SKIP_L1DFL, despite its name, is a statement of how hardware
> (and/or out outer hypervisor) behaves.
>=20
> It means "you don't need to flush the L1D on VMEntry to mitigate L1TF",
> whether or not we employ fine tuning to change what Xen does.
>=20
>>  Or take ARCH_CAPS_RDCL_NO, which
>> we set unilaterally for AMD/Hygon.
>=20
> That is local to spec_ctrl.c, and a mistake in hindsight.=C2=A0 It was
> written at a point in time when it wasn't clear whether AMD were going
> to implement MSR_ARCH_CAPS or not.
>=20
> The logic in spec_ctrl.c will change substantially when we load
> microcode and collect the raw/host policies at the start of boot.
>=20
>> I don't mind it remaining this simple for the moment, but then at
>> least the commit message should state that this is currently over-
>> simplifying things. If you agree, then with suitable wording added:
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> This is "mask all features not known by the Xen".=C2=A0 For CPUID bits, i=
t's
> done by the masking against known_features[] (autogenerated by
> gen-cpuid.py), but we have no equivalent for MSRs yet.
>=20
> We're definitely going to have to invent something (VT-x is going to be
> a total nightmare without it), but I haven't got any clever ideas right n=
ow.
>=20
> I'm happy to insert a comment saying that this is a substitute for not
> having known_features[] for MSR bits yet.

Please do, and then I'm fine with it.

Thanks, Jan


