Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E6441C151
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 11:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198917.352660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVaT-000502-6k; Wed, 29 Sep 2021 09:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198917.352660; Wed, 29 Sep 2021 09:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVVaT-0004xo-3b; Wed, 29 Sep 2021 09:09:13 +0000
Received: by outflank-mailman (input) for mailman id 198917;
 Wed, 29 Sep 2021 09:09:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVVaS-0004xi-6B
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 09:09:12 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cb8d5ce-912e-4d9f-9513-04b76876399f;
 Wed, 29 Sep 2021 09:09:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-Up4EDLqoNSqxn5C8R3HwZw-1; Wed, 29 Sep 2021 11:09:08 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5597.eurprd04.prod.outlook.com (2603:10a6:803:dd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Wed, 29 Sep
 2021 09:09:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 09:09:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0009.eurprd03.prod.outlook.com (2603:10a6:206:14::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 09:09:05 +0000
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
X-Inumbo-ID: 7cb8d5ce-912e-4d9f-9513-04b76876399f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632906550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAo9xfYpnf8kmt+M2iJxEWkckj4VOOa8jqFTnO/RFFE=;
	b=EaVPFE/J+Wz+0Ci0uJgI45iwwEtN/W/xIrY+IZyZZAu1qwSA2T+LlVy89g9WoOM7Cr00vJ
	89hfqaRI+kL5VGrrv+PM4xrTuw+KdTo9VXPGo1lFVUwCKPnzmw+D2oaxrQuPW3lGnRSsxp
	OuDFNuMNMpx3r7fA1UQEhSVDTBIUZ1Y=
X-MC-Unique: Up4EDLqoNSqxn5C8R3HwZw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kF35Gv0J4Rd+qhATvE27RsNhKCBh7JmDiEnpkQcNyBhXy2QJpOwXzkEGSAT5LPnjmBHbflFZI/V1JMmOZRuz6TgJBQKlrBtsnXauMPWDM/KTPOeULa7I5DTgJDNDEFMlpBWOV57gORFhLL2BAteVQCUQ51uzGiFMsdFQvwujTVrNpqnTjchuYblV33jhRzkqbZllDERkTM/4ucvWRvyuWX+RMUjUP0U8w42AeeSTU9e0W735lVmn8BzPIiJv1Zi2M5Ef7C/QvTxA/TQPukYppRWfQPSicyT4fHdfqGhIJPBQvqRMORtf1OV/0yJ3Jsq7oSLCCXqhfRulVhwe5BvplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EAo9xfYpnf8kmt+M2iJxEWkckj4VOOa8jqFTnO/RFFE=;
 b=EsLn6ZDHf6MwimQJ9e+aLMm7R33ehnTws2YtVkO1nClQFhGGNx/WwYg6y4fxnw5Bxdp1LBzBVQtdRyiG0YuwNPkofyIcdAC969MxLirKj0v/8zl3v1oAuuR+V0u48+iGLTRwhd6AIsEDF1s73ef25vBu+JpZ3iSAClMDITTS2POUCHBEU8QrwfVce8FvDfeJeyrDp6vG+kq3M+Guq/2afL6E9hVWbzHySfWXdIjIFwor1OasR9ScQQMgWBC0QQMf5jxGYEaoseQ/nB9qQYXZl2qKyjugizABvJF4V0oek7iCye9/yVZZSt3adPFGlST8unLFzQs3st1gUcXKo1a8Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@arm.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
 <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
 <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
 <600cc603-5e6c-b430-def3-74a9b596daa0@epam.com>
 <8f5f9b93-2b13-30dc-372b-10326130b71d@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4bde7d37-6b11-675e-79c1-e6e413fc97f9@suse.com>
Date: Wed, 29 Sep 2021 11:09:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8f5f9b93-2b13-30dc-372b-10326130b71d@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0301CA0009.eurprd03.prod.outlook.com
 (2603:10a6:206:14::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8839526-1097-4b9d-b891-08d98328c9d0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5597:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB55972F2E4A1A381BFA38C575B3A99@VI1PR04MB5597.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yiEiGZMeT69ily8CaczSbyVZd5T/DD0Vx9XFgRMSq7z/PrjYsWQdRG/vV0BFa3qPe0Zyh+vw/QecRoGg7DUiAa64lptiXnWlnpr6pz+RbSQ3V5g58O7EsLwSjArRVZfYxad1XW1XdsBJe73Rk2vFDWc2fq+Ry7PIGFwlQA7cuj/tHWzDA7FYdp8Z+7Pv25Jea+8sFt+ePY8KNko6cF9mTZM0axUWom4C+EcBqilYSqVennO3/buYoCWS07UV6GMHQx41v0ZnA75dO5eLiVF5SlW1UwfKgkwGRp+73JXQud7yiA3lfx8VWUhQbpkPB/qiDzHP4epbTcp6xcD5B/xBw3ZN2q9JwSQDrElWE9+ITqyKyunkem54ZhGE6+UCHKioTNSuoM3TJF9c1EIlFfJiUAWb4miBS7hjzxGZQ9r5K2EmQTQz+8tNoiNEpIimueMUXIEgU7l50EihwKvMjAtOy4QmJNl92xpEwfhwefTn9l/ue0s9o8V5u+5h7XJj0KID0lAly3Zi0ONGKBfZwKdJs7BWNKxq3SJMHS7LvFhA9gDV4eF6NFSrcHmlkhgpsjupZptztMxMXBZINGiF+9vLTz+Tas4iEtkfgQLFNFlZw4Duunx/jDbH60MuQnmzdsn5mMRNlJY0Rdw/M1j3/kJF5IRmRkIjz9RgL9C926aDteBMAQcY9zdYkLrtSt4YlIbMOUXNI+dNI+2PRoMoSNjdWGmM8+5IKmIbB0z8vgJJnrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(7416002)(86362001)(316002)(186003)(38100700002)(956004)(4744005)(2616005)(2906002)(36756003)(5660300002)(8936002)(54906003)(66556008)(66476007)(66946007)(16576012)(31696002)(8676002)(26005)(53546011)(508600001)(6486002)(6916009)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkZVY0l0TFJuNUVRMFhPYjkvMjlhcFh6QlNLSEhZNGQxbG00dG50bXJSV2Q4?=
 =?utf-8?B?ZjF1b1NUa1JCdE1wcWNFT2tuNlRZSXlZS0c0UEo4Y2lQdkg3WVloVTFoRmMv?=
 =?utf-8?B?amRWQWJ3eGtGL3lSeGxEVTZvMThoUjBzOWhrSXhYdDBDWWhXY3NSTEUxMVY1?=
 =?utf-8?B?VERsQ3prOXUyOVdWVjBabi9rcU45c2VZNCtlTE55c1FTOWlrcms3b3AvenN4?=
 =?utf-8?B?VFpDN2ZPTW5oVG9qVVh0Q0J2MG9acGMvMGIrODJ2cjNTOUZ6Z0RDZTdDZWhC?=
 =?utf-8?B?eXovc3JDZDJ1NDREanhkZElqT0RseEJMcDBVYzBYN21XcG4welgvVlhoc2hh?=
 =?utf-8?B?SERTeER3WWlvb3RoOEF2NEdSYTBXQUl6YXhBci9VQlFqQ21uSzRQakRpaFVB?=
 =?utf-8?B?RzdHTWc0LzE5WWRINGNKYzRrZDhMN2lEdEFwbVpsQXFwYW16a0R6eGJhRGVY?=
 =?utf-8?B?VC9XdlBHRUQ3MFRCaytONEwzeTdOSnFlNWl0TUlMZ0dib3prNEkvSWllK1Az?=
 =?utf-8?B?Qk5PcXJIK1JPK29aVUY4TVNzZVFRS29xeVI4Z1hZQ0EyZllRaFF6Q2JwdFRo?=
 =?utf-8?B?OHVUV2dPa0hlenRYdW5hNE4vQWFyS1kzeGsrcUVFa0pjMEVXSVkzblk3RVo0?=
 =?utf-8?B?VENTK3V2d2c2SVNOS0xBRnljdlBmckJHeWppYlJOVDE1VFBOQStnRmFKVWw5?=
 =?utf-8?B?QUhjZW0wdjI1VFphUk4xN2hwL0ttQ21oSkNLdVliMVp1OFVZMlF2YTgzWFlJ?=
 =?utf-8?B?UVZkMXgzRHQvVm00akd6KzJjQ2N2L09XZkpybTJoYmNvVDBCUzFNTndTYXFG?=
 =?utf-8?B?RWQ2eHlTblpGV1ZadDJ4amdCNHIyYXNjKzFCeDhPbGU1Vmw0aWU5dDRzZkM4?=
 =?utf-8?B?SE03eUg3Q3Vld2R5K3V3c0w0UnhYOHVSRHpZZCsvMmNzS3NuS0NEMFliSVVr?=
 =?utf-8?B?V0hsZVZyMm9SRjZXTFRVUFREYkdjaGZlaGs3Q0t5SmVFbktWdWtXZjBncmxD?=
 =?utf-8?B?aDhLcFowWjNiWEZ6LzEraGZxWkJTbk13SzB1Unh4RCtkd0o1Q1hCYWRJUFdY?=
 =?utf-8?B?dWhSYXQ0WVdvYm9LZ0hvcmplR2hJSUhFNDN4K3N3c3ZTRU91NUYvUTEzTVpJ?=
 =?utf-8?B?czdNckhsaWs5U2tCSU1wcUlOUHBhb1dBTEMzRERXR3J1N2c5aHIwanZNbTBI?=
 =?utf-8?B?Q3liM3p0QnRlcS9WSE9BQ0JQd2srWUpQVzVhRDZ2MzRYYW45bk55U3BMRUNY?=
 =?utf-8?B?KzNCVHZsOVBaenB3N2FkT1NsQjYwdmRSbXRlajlRWkI5WEc0bjltcEpVaFkw?=
 =?utf-8?B?NlIwNmpGb1pjQll2eThkenZuTVlXRjRtUjFsVlVsVHlnaGluNS9yUU02VXl4?=
 =?utf-8?B?OFFEOXJRUWlIbi9CZGM0K2lPYTlNL05tRWZoSm5EOWRoc2YrMFZmN1lWV2Ey?=
 =?utf-8?B?YjNqMkdEZURGbW56L1FUWDB5ZTZmYTUzMXlzOS93UzNIVjBkTndFRGUxVDQ0?=
 =?utf-8?B?dEpwMFhtbzJ2TktLSFlnSWJtVElMbXpySW1hTjdKNmtsTkpqNDM2WlRRRWpP?=
 =?utf-8?B?Q0x4TXgyWlU5Wk0vODhaVTBqZjlRYjZ2ZHJpN1JhZHU0bE9SNnNUT2k4U2dB?=
 =?utf-8?B?QmZPb1J0L0gzQ3FqalNHR1llSzJoL3dlL0hDVEZiV2dXeWdrRjRzNmU5Q2pj?=
 =?utf-8?B?YUpFbmMzekdtY1RMbzJEQngzeUVVUms1cmlzMmJzU1hWYUVBQnR6OVJKZlhH?=
 =?utf-8?Q?gqPVIccQbt5fv5aHX12T2oozHvnr1joSeCbtKJs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8839526-1097-4b9d-b891-08d98328c9d0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 09:09:05.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yonnvQ7w5OtUREUZrPznNoyYtVtQ3LljdBOYz81KiA+KInLqZxZt0JEZDxUnqIGSP9lhtFVLzzozd+IR6CvCxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5597

On 29.09.2021 11:03, Oleksandr Andrushchenko wrote:
> Sorry for top posting, but this is a general question on this patch/functionality.
> 
> Do you see we need to gate all this with CONFIG_HAS_VPCI_GUEST_SUPPORT
> as this renders in somewhat dead code for x86 for now? I do think this still
> needs to be in the common code though.

I agree it wants to live in common code, but I'd still like the code to
not bloat x86 binaries. Hence yes, I think there want to be
"if ( !IS_ENABLED() )" early bailout paths or, whenever this isn't
possible without breaking the build, respective #ifdef-s.

Jan


