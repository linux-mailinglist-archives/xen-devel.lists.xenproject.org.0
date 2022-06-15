Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA4454CB96
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 16:42:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350210.576474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1UE1-0003Bg-3l; Wed, 15 Jun 2022 14:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350210.576474; Wed, 15 Jun 2022 14:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1UE1-00038o-0o; Wed, 15 Jun 2022 14:42:29 +0000
Received: by outflank-mailman (input) for mailman id 350210;
 Wed, 15 Jun 2022 14:42:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1UE0-00038i-33
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 14:42:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60154d30-ecb9-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 16:42:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9100.eurprd04.prod.outlook.com (2603:10a6:10:2f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 15 Jun
 2022 14:42:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 14:42:25 +0000
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
X-Inumbo-ID: 60154d30-ecb9-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iksRiiD7pqTtmZ/MeOMtBVEaRjDoWD9SIqUlT2TnY8eayJQoRl7Qupax6vTephdgrIE1kyXBOcioeoGRuHgFLUVSBnY7vsXoeHgdToW6Re0pb6yU4gVoAwsG8rMFWv3pwf/Py5qG6CKRng9SOGeromo9X+NeE8W49kejinUI3+TCD1G9ktmeyHRPjrS3gGTnR4+abL9A+LYQPAd4fKpJqDYgGO3gxvYlIpCvktpmEtLUfwJGCDVd1zSBr6t73llRKQFNHV9UJr7WSMqFbkRL1Y0TSXzVJn3fJwP4VpUHo0yyYFMrHv42tTRc3edQ0tCmoqQiMdkbRFvfRZ503ilhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQTfkArX5sRZ50VfTI+9jym17yc/bngL8yIUznBf0Ck=;
 b=EkrxEiuNxoBLIs1iRf1QoXp530/5/4tDxcVoaK2D53oB5ny0kJ+hFwNbTeFqKSL/chIQdmKtjb536ft9a9pxCC6ndoUjlwa6c5qn9P73qR/poknRPR93INyqzsNWX0YJk+UlgJ+vnGt4Yb8ITe/rN0x/3L7BHn8nq1N5WGaW/YNWZFXnD4FWxF8/AieDtUe7CXREycojnaFlmFmO91/WAzQPCZdOJg+JdtwLmeZG76Rh1kzU5T0u01vjstwb3rgjk/65EYar/aA6fxzppO61a19Mqpywrpy0jq+je5pwVniWzPulE0GJAfwtOSML54/QuOwZxXuMl5Qb5iw+yo0ATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQTfkArX5sRZ50VfTI+9jym17yc/bngL8yIUznBf0Ck=;
 b=2uA9K+LyTyDwZnV7jfSULWAozu8C/AwZI1GUZUSUU2zWe32+T84E2dUBGVAu2VqmvKWlzFTrYYW7HvlACYIKme0u5fA/lRwnJsxOwCkLDcsqjpDWeOANM7e7JTTakTP9ibwYsg685BOjYnMLsNNidQzg1GAzu8bUCaR9w7cCV8SC1UKQ9XwODm5Om275iZx2FOBs5oV9X817/HSwIKT8I44SuVB17EhAF+9AjjfRefl8waY6VlLanAp2snKpVNgaxJWPqjjp0bPFKZ7wzw/QkEE4RVqZJw5OBOAFOSK5PRtVzBiNJunn2GwPs6Zi+c07otduuaNgAzusooU5fnuV4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54267d0f-36b0-3ccf-f4a2-1c99efa2d66d@suse.com>
Date: Wed, 15 Jun 2022 16:42:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 04/10] ehci-dbgp: fix selecting n-th ehci controller
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.5d286dc6304969ed7155051e900236947c1b14dc.1654612169.git-series.marmarek@invisiblethingslab.com>
 <e7d63b72873de3791e26a6551fef7132fcc9f241.1654612169.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e7d63b72873de3791e26a6551fef7132fcc9f241.1654612169.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b0b7635-b418-40e3-963d-08da4edd432a
X-MS-TrafficTypeDiagnostic: DU2PR04MB9100:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB9100DA6903E86D211F172EE8B3AD9@DU2PR04MB9100.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NtFyFfiQiEdgZgL58x/z43p24Q5tRzIcmixhgG5DdyJanJHSXXbMrERAhTfbH3tc8/qKw0GKHFjHFbb3kpc4LSNYvBwW36manSk6zZzPYXZjRe0TfHqYqRUnckK9BLNVCTeqIwJDFXjxzLsz+qjE65uv1Y/3DnyADpNEsBh5UQzWp9gQSi95CWsqdfiyY1pjLG1j0SByoPbMKFnvXynMZvZ0VRjKMB7psUJy4O5X0cCNyr6MwomghsmbvvYn+YB0olhLDJzrS6WLRtwe24tXcOwYDqg85rLkxAZOPiBalFD1OHdcVkRoxUa1jX75jkORv3F3FIG59tfsH5SCDJ3XC6IyqaUayU4ABF5puoAB5b5tabxVAXpEaXdTOr/asvlnrVZZbxkME1jrULiaMSCeMVZksqEgEzl4Y2/eu1eH/ND+9kEVH54QbErg1SpI8uecipX5g7W+l8oBks1WxcNIJwsDAyHhqNsWcqvGmyPOYxPy1V+4i/5lr+Ox3YHWyBKX/Jdm43PyH3fwHCcRWyXx/dVd6OOmKNEcQp6YbpBf0BNeSLWLYhoXBKy6Uocxv+7rhocmRTS9H2saWRB6YcL6bKDiagQjZzjoygVNCvtjiZMVjjbvtPQaLfCvxoMp9pLlm+iJB9B3mUxCeuCBoe1NjZvz7zhd6ILhudQIRmcTEXxacj2RNtoPxANgwaEOylrz7vL1gAJcAS6y75XizvJnLY/vTOE7RUOTOrUy/8wiZtE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(4326008)(54906003)(6916009)(508600001)(6506007)(36756003)(6512007)(2906002)(8936002)(316002)(86362001)(26005)(31686004)(5660300002)(6486002)(66476007)(66556008)(66946007)(8676002)(31696002)(186003)(38100700002)(53546011)(2616005)(558084003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0QxRTZleE5GRHluanhtdUEyODdCeGVOOWxaeVBTaVJFMUVHSkN2WmJjYmlU?=
 =?utf-8?B?dDZVMkZ2bWd4Tnl5dGRLTVNJNWtwWHFyOG5kSVJlZmdvYUNQMCtuajM0U1N0?=
 =?utf-8?B?cVE1QVI3SlloWG1QQ2ljRDF0UlRmM01KRWVnYjErNjlJdWlaZFNHS1JKamZI?=
 =?utf-8?B?eE1oMW9OaXZnVkZZMzRseHFmbEJucEdQaHNlNlVma2ViV0FZT0ZHemcwWEZM?=
 =?utf-8?B?N0cwT0FyaWN2cjBKaEdLZFdBOXg5dkxmWGFuNXBxNzFUbU81aHEweGtKWHFu?=
 =?utf-8?B?OUJLREtzWFdTNFVzU1JjSVF0RzRBRnRmZzZ3WHpwSDh3bUxWNmpmRTRBbDE2?=
 =?utf-8?B?cG1LUGtjOVczY3NIOVErbjd2R2xrUFN2Z1VZbDhHWG43cU01NVJjWldYWlNV?=
 =?utf-8?B?QjVReUhzdk1KTDNhY1lTNnVNNk1SZ2M0b0ZwdWcyZnhobk96aU9sQmFwd3BT?=
 =?utf-8?B?VDFyUmtSWWFRNkZWZ2ZEMzFDdkZqaUVHOXd6NUI1aFhWY21vNlNhbFdUNndo?=
 =?utf-8?B?Z1dzMzFTNCtrcVVROFAwamRaNW5wQlkvcXExU2dqcGVnWXJDTGJ6MHM5YVU4?=
 =?utf-8?B?bnoyalExbEl2SlhnalArb3hDNElDVFY2NkpYYVlvWjdXdmV0WEFHTzNHU0Za?=
 =?utf-8?B?OVFwZE40eE1SbWUvc21Jd2dGWlk4ZFRuS3M4TzdDdnYrUTBpcWcyVUViYlZa?=
 =?utf-8?B?NWFzM2VBSDRvbFRZYVNOS2tTdG5rOXdUbWxxRUVoU21iaitkMkJFbG5LYUp4?=
 =?utf-8?B?ZmtnM3ovZ1JhL2ZTb2wzNWpEdGtvaWlIQnpvTUVKMEhreFdjOHRVVkd4ZWZn?=
 =?utf-8?B?a3lCNG04NGcrYzNMS3ptMkFYc2NxTUZTd0RuSE5uQ1pYaU5wOEE1MGZxanRi?=
 =?utf-8?B?NFBMd2xWVGpUVnlXbThjaG1VcEY3cUFObG14eTVlelU5Kzg5ZU00TndsL0Ev?=
 =?utf-8?B?VngzeEFHSzhpaDJNYXhMOHpqMitoYjFJd2ZYdlN1dGlzTjhlWWlSNHVGMDBR?=
 =?utf-8?B?MDYzR04ySUdzY0I5Uyt4ZHN3VXFSOVNLNnhYWWRPMDg3cm1PYVFJQ1dDT28v?=
 =?utf-8?B?S29YUUs3M2tqcXRtTEJvZmZ4SUVaSWdteEVrc1J1SitFRkszc1dUUHZjbExr?=
 =?utf-8?B?N2Z1c3FGalVqUHIyb01rNUN3cTZObmtUZnR4S2djMzJYdW1EdDcxcVZQaHVG?=
 =?utf-8?B?MllYSWRhTUZwQ3dzelpySzhYU1JvVWJUNlJuZHM2WG9VUkpaV0wvK3hGaUVM?=
 =?utf-8?B?TnlwbitSYXFsWjRXZ2RGN0dvVFhNSkp6SWpScjJYdS9pL3luT001VmR6OGp3?=
 =?utf-8?B?ODI1MHI1TzhicHRENDdiUVlWVUpvSklML1dDRkZVTC9QOUpwSVY0S2t2eW5C?=
 =?utf-8?B?STR5UlIvd2U5aHpTOCtxMEFXTVpEQUtCVnNkbnB3V2ZCRG90SkRNaGplamt2?=
 =?utf-8?B?bkNuYlNIMzFVL3lyNGhWMzRnblZsQVZMenVxU3p2VUZqNUdEQkFrdEdIL0pV?=
 =?utf-8?B?K1k4NzdSWlhRb1ZkTGRQc1Z3MitxTmRlN2crRFd0ODBWYlRCeWxkTnRzS3ZT?=
 =?utf-8?B?eWY5Z2dMcmJrUDU3eTQ1NFNmZUtFWC9uYy9aOUUyb1I3d0F5M2doSDROazdJ?=
 =?utf-8?B?a1B6dzFCenRyOE00Q2R0Y05NR2ZGVythNWg2TGFpcUJ5OXgzNE1BcU53U1VJ?=
 =?utf-8?B?VEFJd2JYV0U1T1pFSkhCS1BxM1lEd2dlRmo4OUd5V25ZYitXVWU2RFhYK29n?=
 =?utf-8?B?SW9VS0ZrcmlCM0ROTkUvR3RiY1RpY1dJMUZkS1c5Mk5zMFJzMXAxTEk5NGhi?=
 =?utf-8?B?OVgwTjI0SXgvbXFQaXFRaXd1OVQzdVAxM3BFc0hlQmtKeVZCK2tBa0t3QmlY?=
 =?utf-8?B?dFU0VVV0TjA0NXdJRWdPQ2JLeTFQb3ZZeUdkb1lmYitSbldzVnFKNm9uNjdO?=
 =?utf-8?B?RmxCTndCVXVLYzJhakI2VTlTTUNDd0tWRWNraVVkUEdveTNubDNJdlFERito?=
 =?utf-8?B?VlE4N0FLN0lwaVJwWGRsZWpGVHV1Q1FGeGZHVVR3aXlwUDdNRVhDd0Jrcm1L?=
 =?utf-8?B?RklxWVRFcGVIQVdlbWxPQ0tVdXRSdU5lMnVMbG03clFHbGJiMVpqOHZrS2ps?=
 =?utf-8?B?RjZ4Q1daQlMyVDBUbUpCckpXQ1B1UnE0ZEhQYkJpZ0NmaW1zeExNWlViRmZa?=
 =?utf-8?B?aFhBOE1vRUY5aWxVS0JBM3hIT3VoVFA5ZjRsOW9qZ2NKaWNDUGFhUkp1eGI4?=
 =?utf-8?B?TklEelE5WG14bk5zbEhwdlVkTmZLd2M0K2xIdUtqVlJzSlJtZ2xuWXRHYTM4?=
 =?utf-8?B?cDhaVDF5dlF3MHJpK0liNGI4d1lXdEduZ0ljT2RueU5tZ2liaDIxQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0b7635-b418-40e3-963d-08da4edd432a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 14:42:25.0137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCTyiFVDFgHmk8CYC3O7EbT5WOxhkf2ApaCK6QDZxSKYMYVS87dfWayOW3nXMACg/IMrlwK1ZKcoosNzVmvmRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9100

On 07.06.2022 16:30, Marek Marczykowski-Górecki wrote:
> The ehci<n> number was parsed but ignored.

Oops.

> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

This could do with a Fixes: tag. Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

