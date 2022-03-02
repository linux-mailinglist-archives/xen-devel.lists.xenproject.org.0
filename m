Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E57BD4CA9D5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 17:09:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282419.481124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRXS-0006nb-Sg; Wed, 02 Mar 2022 16:09:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282419.481124; Wed, 02 Mar 2022 16:09:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRXS-0006lE-PA; Wed, 02 Mar 2022 16:09:18 +0000
Received: by outflank-mailman (input) for mailman id 282419;
 Wed, 02 Mar 2022 16:09:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPRXR-0006l8-9W
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 16:09:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bbc13ee-9a43-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 17:09:16 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-bdrnTJ4eNVi5eUKVwytlsw-1; Wed, 02 Mar 2022 17:09:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB3227.eurprd04.prod.outlook.com (2603:10a6:7:1a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Wed, 2 Mar
 2022 16:09:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 16:09:13 +0000
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
X-Inumbo-ID: 1bbc13ee-9a43-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646237355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XZykFcKb3JJr/peGJH2wR36sZrRVU6Oip/yrt7jtnrY=;
	b=mIA1cfK9pydb06x9GP3jhtrMQXZKRGc7TN4odwywUvfXfAzyqI90nxkXprszkvHItFKL+h
	4ODN86zrchK4DNmmHR9vnar/8GR4eVIaHKTc7YdGyL8cdOpX6lN3HXriIjbOENbyAhUcpc
	tUc3QZyKpnXnW0rLXOcaJEkei5xjfpU=
X-MC-Unique: bdrnTJ4eNVi5eUKVwytlsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+M2QGEZNvDXOpaKo48VUMruwLMnbvjcsTeBGxME5jB6RtsMOaj2IQNwpDO5IPJd5kctnFNFGAYfcLBbvD5/cB0jabuVJ1JRP0dweGcMi+1CofFLPYY5Xl6EvYEEUi5wfKfArs4a4Nbg1SfuToNaA4lJpGmug0GAbs1KzvHeKyEVAYTXtRWzeiQKY5Islfx1RsYuq5APQrJglUIkpJNEEusH3ERDOv5eHMo6+brxbfOoGsP87rhk6TT4Ee5Apk3jPo9Ez8qDrGEbr8Za+wpV4SZcQr24CQ2YlJsxF5aPtoJK0Rpyy3ji50rD8/C9Ee91ySoUuInb7/DThNlKBFGcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQNCvubhZW4ZvndGWUbmmG7haHcJKGdcAU+Z1OTWR0Y=;
 b=JoMRap4r6vFzodH4aIj1WmkBAc4riS4mIjdt2idAFkC41u3uaJQ5WzjHwAPLyuYpujDKF0/g9ax65Gmh6wCSY+eNeBPpsFxhdvnEQiV26cD+E1hx5CaZVllFE2vnCgjaEkyZ/Cu7fdQbBWMuWATXCcgMpKmZbNfUM1enrhhy5EwlQ9PITIkU0a5Y2Ddm8TEybWGkMJsWqvm/t1cju7cC/rEM8UoU6F5UQKonNyEZRrr7+uFIOg2MxYsWz5Ummd9zq3/SUjq+mtba0xsmo49z/NKvTcLWf8gNWZk6XtO5n5vSVibD1f8aghKUeIXbqA5T2A5DB3mE3y9+G3a3/sOfSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4636a0d9-a96f-fa7b-3e08-595420b506e4@suse.com>
Date: Wed, 2 Mar 2022 17:09:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] livepatch: set -f{function,data}-sections compiler option
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220302134425.38465-1-roger.pau@citrix.com>
 <f67e599d-4dfc-c98e-75ee-8510237cd527@suse.com>
 <Yh+RcFLjrtLk/ixx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yh+RcFLjrtLk/ixx@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0324.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3099834e-dbbb-49ae-4125-08d9fc66fe1d
X-MS-TrafficTypeDiagnostic: HE1PR04MB3227:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB3227F854B5553DAEB0B18CC6B3039@HE1PR04MB3227.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pusCafFJWTh5nYsYkBXXgID2EVoOysTgWraRKTNusWqiA8GUtpoae1TMOEoA0o3eVG+pYQIHZ996yuYUa9fNKdgV4a66MnAMoEBmouzkiItc1mdQa8obI5p0ssNpUKQJJ4OnBwtoJm93REwfC0y79Poa//+zpJCR6ycPWpS5EVG6HNc/Ed8y5nCl0uvZy8aNSahTucm0Ire5EIcx/ZWfJnvHptP+ZrPBPm1vW3QsMlVyFyqwbpkBAPcGjSwW4pgYL8eqvbeTGsGBUklx6PhQ47PWTGx5BPNQus7XqdHyLc40wjnGHi5n19KvwxzOdM79WSFABhe1giM30XDv1Ky4D/ao3GYPMYOUiQlUGJbvQajnFw6177uIcBeloo16lG70ad1cF+uWlmJ78V8XDYtNiG6lgoX2PAZM37SWLyG6Mk5TWZkERtZWzM6nXqT2pwahuKOAXYFu2dHv2GTf14Oy9CXpyNfGfuX4J66rvHGFbMNGpQPfRO8OKqlNZhHHS+VKjBA0V2GX6anPA5ZQwQhQVml3jrHhNUiE4OiUoU/yx3f5yWRC/azKcOS0AZEhNYq3PBtUzn/JHLDQf71lKszOqVcml7yCGpD4xNtj+5kshjufLHDjmIE777a5/ZIDIeevIZQwlp+kjsijQZy87fW7lxA7T6HVRbXGB0fAN2Kh2bkX1bFZtkZetEn1NtkoZS3g7fBxtOsQ+7N9n4/75ZM5MTGb2UhBdbgX56gj1J5l6uLkAgqT6mL0mJrbbFn4B+21
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(316002)(38100700002)(6916009)(31696002)(66556008)(66946007)(8676002)(31686004)(508600001)(4326008)(6506007)(36756003)(66476007)(8936002)(5660300002)(54906003)(186003)(2906002)(26005)(6512007)(53546011)(86362001)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MdpqXoxW7KHBik7GEcyBA/mSnfbRK6lzJR564v5Cb0AlaMLUgV8Xetl1u0o5?=
 =?us-ascii?Q?ZSpKRxbwU1MYpCCt+v2Id+JA/ADIrLYGBEMDC9nfuTBNKhcG4v7bvxmzo9Cm?=
 =?us-ascii?Q?3A2eHgjtgWH7IhhBYu4rBScO/7OQTa6AzrAUEWCgszBBP00QfPwUHdD2j7S+?=
 =?us-ascii?Q?Uy3JjAZ5O8ZlwF4PPgrt+mCAcJP3ZuVXgZJ4yVs6GWh5gmotEEUcqKygkjtx?=
 =?us-ascii?Q?H9/kNbm2Ux14DN9+MtVCpdqpl30MnMwm8AsGxxqgCUp5vflkSSJ0roP8QOGF?=
 =?us-ascii?Q?/wH90UVRmkxJ+ISOnpHTehG8TO0Z+wb96JCknWErCdN8LCIl7Xlr+vyaS6+i?=
 =?us-ascii?Q?8R06OStv3ZCxTGjtGIH8L6eYNCcDc/R2hGCbV7obr8Oe8ODJsVewggTZqKy2?=
 =?us-ascii?Q?EYXAOyMAIAOSQrcq4Pyr9k5hbqNf0lNowgd37fVvN8AcPSk80WXx7okN+Qvn?=
 =?us-ascii?Q?EJ3j76/A7+LoBs4XISmLBUyri3Q0BCBD0LGRJ6L1hgXBEm8ZNMWLggZN8Ukc?=
 =?us-ascii?Q?rN27s6unKl0+cxjSreUeP6gKlbF4mJCHYxVcWwY3S9WFG8QOUHZ75g3oV0LR?=
 =?us-ascii?Q?8DmsHDtgqks9KQKtaYTZYCO5rQYGh7rLdMQyfpVo/wyWXJjqT5bx7Cb177O4?=
 =?us-ascii?Q?+kP+pmWhDivgaz+yViY/6SUCXtnPoLlgTvyrkDx/5P4UtB+iXVhvR8lHzQge?=
 =?us-ascii?Q?0qdkmaIAbAdhPxFB27+ZQ60mc4xWu0rTxag/Ji+5aqw1aNOrPDzbhMrSrYpu?=
 =?us-ascii?Q?M5Xaar9YpAI5D2NokEaFgqVrQ/2/PVtD/lQcvSTfUwjGuYiUr3uCjQR1zopb?=
 =?us-ascii?Q?kUu+xBHPLlRc2eV5dKjWIHIwRjr12+sypHWamq/EwLLoV3r3WNJE2S9IHlvD?=
 =?us-ascii?Q?kvfqowoI+FsHaQaXsAUROmooKV/DLina9Aw7G72X6b7HWytM8jrdebhOxKEt?=
 =?us-ascii?Q?7T2yksaH4u7OYLSlI/Hz/l8/dnVhUrI7X8BOeXJ3iAuIBCm43C7jABtX2roJ?=
 =?us-ascii?Q?mfhr1UKV+sPOvuijjJZy+sK62gB2sY9Jp7oqpbBTCnuGhcGH7scG1pnqGCkx?=
 =?us-ascii?Q?HYScL9rnl2I54QauUicd3w+hg7UBRH/QQLm+0gDSHPdj1NtHQVxPUHMLmtX3?=
 =?us-ascii?Q?VFav7UFKwwvdHcGYHCvhDzQPaUCkTam3ikm/mfqpM0laeYm5iQd+ecEDTwu9?=
 =?us-ascii?Q?lYfKgGtmPxJczbBp23mKCKWr5Mh55oIOiDunlgWghHflypV4yBYP0rNZUvVR?=
 =?us-ascii?Q?NurtRF/CueoX9kvQYleOcZ08iVfbhmqV6EpW3fBeqpB15CbMEryeYPXX7Kzu?=
 =?us-ascii?Q?EzEsViNfzeIEjLuJuIll7aoRqSIy3kiANtwoKKKy5eWIpYxNKYhLBYAOFw8G?=
 =?us-ascii?Q?o+smwJGJT2bh1Qz2Xa35D/GPkN+9vsgjcmV4lzl2b7GwRCpiAdoeuQfI1of8?=
 =?us-ascii?Q?jcoms6ekVg6upPaExYA17y57uzHjI12+SAoVmAE6IRLDRnZXZ5O7wtRyadpp?=
 =?us-ascii?Q?nIf2w/0OOTEXXLLaWOLrn6+yVw437ORf+lr9ZZ1ygEeLaYVFnwXtY+xAK7i4?=
 =?us-ascii?Q?syahhLHhf9MpSsVhIBc+CAmAjftsrZq9J2pI/VkUijtAHrqVeZRiDmWJ3Vfh?=
 =?us-ascii?Q?HtA+g4Uf16/5auVArBbxKXo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3099834e-dbbb-49ae-4125-08d9fc66fe1d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 16:09:13.1548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJo/4ihmM9itFufNunTi5YXq5YXgMhwqOjeVUk1QK4EQ6nmkHAw/2sldAeWWa4XjTYNki7em5BNe53ECZd3GyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3227

On 02.03.2022 16:46, Roger Pau Monn=C3=A9 wrote:
> On Wed, Mar 02, 2022 at 03:41:21PM +0100, Jan Beulich wrote:
>> On 02.03.2022 14:44, Roger Pau Monne wrote:
>>> @@ -292,6 +295,9 @@ SECTIONS
>>>         *(.data)
>>>         *(.data.rel)
>>>         *(.data.rel.*)
>>> +#ifdef CONFIG_LIVEPATCH
>>> +       *(.data.*)
>>> +#endif
>>>         CONSTRUCTORS
>>>    } PHDR(text)
>>> =20
>>> @@ -308,6 +314,9 @@ SECTIONS
>>>         . =3D ALIGN(SMP_CACHE_BYTES);
>>>         __per_cpu_data_end =3D .;
>>>         *(.bss)
>>> +#ifdef CONFIG_LIVEPATCH
>>> +       *(.bss.*)
>>> +#endif
>>
>> ... are these two really in need of being conditional?
>=20
> Will drop if you agree. I didn't want to risk introducing unwanted
> changes in the !CONFIG_LIVEPATCH case.

The only "unwanted" change I can imagine here would be that we place a
section which the linker would otherwise need to guess how to place,
for being "orphan".

>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -353,7 +353,9 @@ config CRYPTO
>>>  config LIVEPATCH
>>>  	bool "Live patching support"
>>>  	default X86
>>> -	depends on "$(XEN_HAS_BUILD_ID)" =3D "y"
>>> +	depends on "$(XEN_HAS_BUILD_ID)" =3D "y" && \
>>> +	           $(cc-option,-ffunction-sections) && \
>>> +	           $(cc-option,-fdata-sections)
>>
>> Is this for certain Clang versions? Gcc has been supporting this in
>> 4.1.x already (didn't check when it was introduced).
>=20
> I've checked clang and it seems to be prevent in at least Clang 5,
> which is likely enough?

Clang5 accepts the options fine here. But that wouldn't be enough,
./README says "Clang/LLVM 3.5 or later".

> I've added the check just to be on the safe side.

Well, yes, if you're unsure and the old version can't be checked,
then perhaps indeed better to probe.

Jan


