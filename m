Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64FE4F2A85
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 13:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298726.509000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgyu-0004vc-LR; Tue, 05 Apr 2022 11:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298726.509000; Tue, 05 Apr 2022 11:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbgyu-0004sZ-Hu; Tue, 05 Apr 2022 11:04:16 +0000
Received: by outflank-mailman (input) for mailman id 298726;
 Tue, 05 Apr 2022 11:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbgys-0004rB-Uo
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 11:04:15 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20dac3af-b4d0-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 13:04:14 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-JC4I5QBYOIyCzGBSB1ATwA-1; Tue, 05 Apr 2022 13:04:11 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5520.eurprd04.prod.outlook.com (2603:10a6:803:cc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 11:04:09 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 11:04:09 +0000
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
X-Inumbo-ID: 20dac3af-b4d0-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649156653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IgWx14sa0Tbh0Df/oTMWJFoGWSZJGpY8vSNdv7/XMQ4=;
	b=YvT9cVL5hXw2UoJdUq79u7UGHExKkECYmo5pMgampJXoJSP6Tm/UjiIsB9J+fxF/mvTHQP
	ez7sFsvEswxcGFDqxsTdGzbp6Ce33Tfp3K/dWaGrMgQIT92N6ErSbU4JVZkz/v+fYNy5hq
	Y2PxlWF1U3K3anVyYQha9Aeu9k4XuP8=
X-MC-Unique: JC4I5QBYOIyCzGBSB1ATwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y97SfqWICasbae7XruQzC5aizdoMtrWhI9EHGpunVmSO88fm+UvhJgFjdnSvhyn9tBTtxGooicx/4//8hOBUQ0VkT0wZDVVxbmor+ZJx1AVORSdDlG6P5PdNN5s0jRwgrQXfg0wT6w2jVxNnmz0yI2WBfTd1b5/lOBVvmrzXmhGJBmgXoPo52LMgUH2f68RTomd++0yvkU4ybUvbbjuwL6woNuKGVFQ14eVqMGtSV/FlVsJ/4YwTYyZG/JgLfYZhWv6Aa6p05YYReI7fb698x9LaT5ZdfQVQPH7DPr8AgVBoPozQpdMOavxITwlZ4o9muTOditrOoaDtAMaKTwtMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJvghX+akbrjmhlUKpqO8xXlIRC1cc3Qbff6qaDoSYg=;
 b=L0rhGGOs/IaOQT2H4or5wKMLXBbu0QHrfhJLQmm2CMOllAE9cbg8HCnd13yt9+1o024bbmAZVMiZShEH8R+uWfP9A1xPt6V3U+v4DOFXcum7XJXTB78P4bxSZqIxuozde/d4uOGITwv2iXFy+gSgwgeE6/+wT88tnTOm39DZnsAF34yvtiJ1fOjTPfiR6w/c1dwBgVQfVoYeChodp6plrhp9qOnoWyDF7Mr87Y6Fm85rh78vw3TwE7cGR2OWxzNToY6K0L2GyqBc7UfOE1292zV0vMgYOBFvZ5ZM92DP4KhAX2MTLYviswXyumNlDDajcjcviJdVGpzEw8xkn131Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7e2f17b2-8e54-ea9d-0a20-b49fb5ddf98c@suse.com>
Date: Tue, 5 Apr 2022 13:04:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220401143720.23160-1-roger.pau@citrix.com>
 <20220401143720.23160-2-roger.pau@citrix.com>
 <e20b3d17-0c2a-b23f-d949-667072a54f58@citrix.com>
 <ed31e78b-087e-869b-8aa0-5d5d0f3183fd@citrix.com>
 <75bd55fa-d29b-d49e-c3db-1bb952e4578f@suse.com>
 <4a425427-275f-e116-66a9-78e0bfc1be36@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4a425427-275f-e116-66a9-78e0bfc1be36@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0201CA0006.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4633d91-6c30-4ac8-94ae-08da16f40286
X-MS-TrafficTypeDiagnostic: VI1PR04MB5520:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5520A3D36EA2CC3D4B8F2C6BB3E49@VI1PR04MB5520.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q/GPR5LnF+aaDiU4PuaAQkLy1T1zCiNalODidcP648GT+Jw0W6LaVHr3QHrfmempNIbjmZRIcbkkA//6xMdbaFQJxxyzGd10pSyXOj+8qM4NqxDWNaDpFsmUe9VVwQHO8VWu81UpYkes9O028UpsQwuBODkLrZWVIfU06Cr2WZEU02T6XPmT4gp7hLZ/+0ZXZgBM/dkcTp4N+AxKlSbh0zmG8pxkPOribeHVFyk3bFkP72emcpxMh8iredEy4bGkamd+mjNQDVan27xJw2XDbHJ5AF9PWvvQM7v+ToRN0raTyWYdUhOQoa3PxCZDJUwQXwgaj4kuapV2uKd/VFfNpTys2D/hXIFrotjqxu8civnVFIayHzK8eLVCKMd/HisFJcMD8syaknhlj+Nx374bz262eUX5hl2h1dRr/AgnaFoOLm9TECxZMcMb5KpPQzyymDyQ2mQBcZ6kg5jS3Sr0DZyuaa0l77ldtkhAKKpKE6IdJWKGDDHvACPvsQZaTFz+tGCKhnBB8NgquIav3F/5UlvUo9DLwv8nk6oHPNr0Hsn+JFp629qRoWdjPIyzYPiGpsY8L8QbG807x8wrK2EcherrJkrDenL/5LqZ6LiBbRyP+HKSDHUF8+fb4qUiA+1AQSOatXzzrlwJ2NAku5mu0/nI9IGWREdVUgRArQrphcBsrCXBWK13fcgCdgVgiGZ/wWUDxBrBdVd8xIzW1/41hd6nP0md7Kc55ZaUiag+ehIpkXGdG2yviTj6kvtLNPiw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(8936002)(31686004)(31696002)(36756003)(86362001)(5660300002)(66476007)(38100700002)(4326008)(2616005)(54906003)(53546011)(6506007)(6512007)(66556008)(316002)(6916009)(508600001)(26005)(186003)(6486002)(8676002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KX2GNcDFVZ92XtsnPr9cW9XemTvV4lO9Bxf8Ewhh3uCXJ+0wmzWIIrJGi5PF?=
 =?us-ascii?Q?5+zosFXOu+akkpWn7viSGTdLTReKE3UPs1aMM3lGY24Hs0sgw5Dme/a8v4PW?=
 =?us-ascii?Q?UlqlxJiqbQ0JFVlPHbRMucAciJV8Aae34QStHxERUnU/geMmSWrJEDeTVfn9?=
 =?us-ascii?Q?9aPGLQ6aQD9DfTAJTGa5wXelRf+LcZvLuP8T0WQky6vFrBGHfjGbq+YEcYRm?=
 =?us-ascii?Q?qCh+uqmVxfvLPgfVU+zwNhOhSVSmbfI73cu6SwDtBtIQmaZLhndZkdEnvF0+?=
 =?us-ascii?Q?H9AzHd1w6zOT3glYZgC27niFn/gGcv9Q+O0hIpQm6LH9cTr3pFSLScU18ZvR?=
 =?us-ascii?Q?1oxzI8jaebAVwVz7See0TwQfxaWFsbjSVtQ/5YZOLZfVcoXmquU/2/jcaXXw?=
 =?us-ascii?Q?KwjK411W6pPzcSwevoe7G0PXm0USwjPr4p9tbtVVWsJXzzaSk7VE1En71yZj?=
 =?us-ascii?Q?myvX6jY5p0P5TSWYbuFqjMDPjIqfVlKen+12H8Sb4GKFoi9oJGOmqosWmmCw?=
 =?us-ascii?Q?vGSC1B2ITkoaMXQrX0SNGEj1Kj5UgpaPl76RMT7coRNLK5FhOdaQD9pfUmbF?=
 =?us-ascii?Q?hZJJYOGv9O3CRl/cJgV2Q4thLQ8hEaz9mngdHqxFCaPnN6OLN/Y6gxWLP3Ss?=
 =?us-ascii?Q?pLdlv9qfURJN74JyL6we/OXwsEM6MWRXSCNG7u1KGWE1Gp4urPCZaVQLyyPQ?=
 =?us-ascii?Q?2Nq2J3MOad2t1rnzGU6KdM/XchTvFMtpxiCzv1kJRv4stiNDf1JywzQ9rjSB?=
 =?us-ascii?Q?WagSLNYXavsS0/KZ2uQghqjV06LwLkg6SGOyvppB+8lOqCofQeRREVwBvpCX?=
 =?us-ascii?Q?+SSp276hOgHxBQiLE0oRoym6gnGo8EY8i+lXRLvL/CfYMaXInZP/ZKl4W2X1?=
 =?us-ascii?Q?oqT6bZfloqkKbmWdCmEXTarO8Ap10phO+N+aon02C+Z9Dmi6SUJvLm8GQwDe?=
 =?us-ascii?Q?Hzdn8yuYaYFkBXXRdI4EQVaMfoSGduMhw/ZWuIHffBywhDpOl12e1ntzIwFS?=
 =?us-ascii?Q?85qEJwcft3zM9Ibk9nbAA2kDRPK2HgEP/e+g1UpanTICmLCSTh3gT3pYI7FS?=
 =?us-ascii?Q?O6DKOmgG7YD5ZcXqCBw8nsITBaZ6DL0r06BOaYzwo4BbtAlkuOEPItE91GRG?=
 =?us-ascii?Q?Wqd8vkeGMdLvOzIeWmOS/1CMe7h+DvF7ufrNujzNSa5lknHto/sNIymBYy5Y?=
 =?us-ascii?Q?1U6W5k4Dw7veXLeBGVJTcd8XcNWEjMQWNC37A+U4bIDcb+hVrnFAiMFpLaiA?=
 =?us-ascii?Q?3JDpkG0ZpRDJsoWIa4Dsc/fFVMbzVcbdWqyPkkqcH0XlAHebbF7yVLzfZfR2?=
 =?us-ascii?Q?XVqv09ZBNVG+SXo9W9Xif1T+NIpEsNIhao9wndNEMkt79pxSSPb/RiJcUFIa?=
 =?us-ascii?Q?TGAtUxVCgi4Rv8nEdQOHeE9n09emYBREDNl+J4s2GO8Lz2f85ADGg3PfD5Lu?=
 =?us-ascii?Q?dbYEAC02Da83pOkx6ghS3EhnPbs1RZaipNXs9MfUO1aTAdDe1NqfgdzZdyfK?=
 =?us-ascii?Q?ut543umG1mHGLRFXBJgI5Hj0CF4Ni1C2BL6DJWtqD17QGypLjYoCpmiD7WLP?=
 =?us-ascii?Q?PLMqPevD6u6ei3XNl3Fwuv9RQosdhwuaaYGkbjOBrHJipF5cXpujWkNqmE76?=
 =?us-ascii?Q?L0fUIhis5nbMwItqhHUB7mEyVQo8b0YCUNc47CPX/NP3F4lp6dROpmLTUGf4?=
 =?us-ascii?Q?R2dwBPsmjW3/aMC5cjDg2vkHXoGAGxQutmmYhOh05fvgTSCaalL/d9I1sBOv?=
 =?us-ascii?Q?e4vxQBP4/w=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4633d91-6c30-4ac8-94ae-08da16f40286
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 11:04:09.7801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 449ks5Mlt9cWQIdeNVYl2euzpaJYEHhjh6IMuWbzsajhlM+/H7lB1BTcYQfmosU9XFtKow4JoBx/rtu3r8a7tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5520

On 05.04.2022 12:58, Andrew Cooper wrote:
> On 05/04/2022 11:18, Jan Beulich wrote:
>> On 01.04.2022 17:05, Andrew Cooper wrote:
>>> On 01/04/2022 15:48, Andrew Cooper wrote:
>>>> On 01/04/2022 15:37, Roger Pau Monne wrote:
>>>>> Setting the fcf-protection=3Dnone option in EMBEDDED_EXTRA_CFLAGS in =
the
>>>>> Makefile doesn't get it propagated to the subdirectories, so instead
>>>>> set the flag in firmware/Rules.mk, like it's done for other compiler
>>>>> flags.
>>>>>
>>>>> Fixes: 3667f7f8f7 ('x86: Introduce support for CET-IBT')
>>>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> This also needs backporting with the XSA-398 CET-IBT fixes.
>> I don't think so - the backports of the original commit didn't include
>> what this patch fixes. I have queued patch 2 of this series though.
>=20
> In which case I screwed up the backport.=C2=A0 (I remember spotting this =
bug
> and thought I'd corrected it, but clearly not.)=C2=A0 tools/firmware real=
ly
> does need to be -fcf-protection=3Dnone to counteract the defaults in
> Ubuntu/etc.

Okay, I'll adjust title and description some then while doing the backport.

Jan


