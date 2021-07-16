Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C03CB7A4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 15:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157176.290111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4NSZ-0007IZ-97; Fri, 16 Jul 2021 13:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157176.290111; Fri, 16 Jul 2021 13:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4NSZ-0007GO-5f; Fri, 16 Jul 2021 13:00:55 +0000
Received: by outflank-mailman (input) for mailman id 157176;
 Fri, 16 Jul 2021 13:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3zi8=MI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m4NSX-0007Fx-JL
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 13:00:53 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9428618-e635-11eb-8970-12813bfff9fa;
 Fri, 16 Jul 2021 13:00:52 +0000 (UTC)
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
X-Inumbo-ID: d9428618-e635-11eb-8970-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626440452;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ROFaK+/NT3lPoinXoNrQPpO3JwD1OpCd4uSjriz1gHA=;
  b=NrgoonFUygWHHluMz6dznuhoQzfP6eja3LqgRTmvX0zCpV5+0t482jH9
   mwuvnKiBGEp+7I4HyfGorCkYPHsmKDxv8/sjidjCV7y/8MDd/Jqbher7j
   /iGhAPcp4bB6fOo42YEYQPXLEoWxQbkK4adUJ4srFJai0n6QWxDyOAzby
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lIRwpBe0jU1A4FvOprSSbQKekzoDmCAP8K3z7j5d2rW/npb1dMr4xPb06+ypTgaNiyDweyAzYC
 Qq8FhUTkAo1lkP6LXp1ea9XnsekqjM4gdrEp+f2pDnOOTaqzxYVH58dbwQEZcS5wOv3nuTliIJ
 GxEWjFoZJdFp1TlFDhoTbkNyZZpDGy6yG8FPcN1vM+1gARNhVoA7NPJPM0lHcSE3Vp69nFZ8MK
 I2dwGENq4zIZflAlgC+DRK2zcyrhj/slGJFjAABDx+DumOTmdmijoS5qgqj3ULLsmUzOe5B+Ux
 Xqc=
X-SBRS: 5.1
X-MesageID: 48815107
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NB2CY6HXbTv1/VbepLqFZpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HkBEDyewKiyXcT2/hsAV7CZniahILMFu9fBOTZskXd8kHFh4lgPO
 JbAtJD4b7LfChHZKTBkXCF+r8bqbHtmsDY5pat854ud3APV0gJ1XYJNu/xKDwReOApP+taKH
 PR3Ls9m9L2Ek5nEPhTS0N1ENTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJp5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXgHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMm9yV0qp+lWH/ebcGUjaRny9Mw4/U42uonhrdUlCvg4lLJd1pAZYyHpVIKM0lN
 gtMcxT5fpzp4EtHPpA7Epoe7rANoX3e2O5DIulGyWuKEg2AQO5l3fJ2sRD2AiLQu1E8HJgou
 WMbLtn3VRCMn4GT/f+h6F2zg==
X-IronPort-AV: E=Sophos;i="5.84,244,1620705600"; 
   d="scan'208";a="48815107"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlJHUnfG+QPx0TEktSIA2EkkEOt0Tz6AenFtXT8e2MzGs3p498siw2WvdKtzXis0Ud0X9lF896KCjUqY/gRpp1rizjKQFZo2KufT3VhQFMynf57Q6DvUuhLHhpt/7e/N4vU6TFthuE0u/jlhk94antOkLhT4CVmrxkdj/1tCbUQlKcOGDeezyVc2I0OA0EPVUN69900v/I+l4S96zJ9N9UKDymG2Gb01KwngXHi5sUWo7qxEyO3cJ8TXZ/r5XUk/q9scU+p0pPTEut0xOsBgzikxj0ECKy/SXHLouiGBvX5ho//bHVSJLx8oTok+eG4xFhNC59mD6GyadUfHAXeQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROFaK+/NT3lPoinXoNrQPpO3JwD1OpCd4uSjriz1gHA=;
 b=QgXOwrwuk36M1uMkfEQz2VjTTJ8DsbGBkn3j6OdeIms4LDeB16RQkdZO7K2dnceC62R6V9VruqSoPksacpRFYZoCuKhSGr+gyNeVi+D0VdrF8hf5ySwrGc+9sw8Oo+8UhpPWyTxpT3touFvwWl3X/Hc6TOKxL8HlYqJBI5PuUP1zIU5qzqs2X9e6VmRR4cWB5yIdVXU73WkS2lNih2C5j3JQNT8nDdrxBgnwdDqyQDWyVw8cfmv5YHCN5vTUDemNeo0QV5RruYHbcs9Y0GFxU1iaCI2+YBA6nXXv2T7LFGs6ECX4Ra2PXAPXqK4QQ4BYC5Y9kBGv/jcVeCW6+s/qlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROFaK+/NT3lPoinXoNrQPpO3JwD1OpCd4uSjriz1gHA=;
 b=Kr2MEa8ePo3tOzZwEQe9BT+hint1X8lnkVUSrn8IXUgBV/N+vDpluYmWltMSzjvW4rpmhP6FhskTLMhpi3EZOfkaOGPnqobdBXsUyqoYHtHgUnXTl7GkQrZn4lts4BvXJZwpbeLTVpAxV1LOttnuCskMc2niNrTlOXfVIWt85lQ=
To: Anthony PERARD <anthony.perard@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
References: <20210714161734.256246-1-anthony.perard@citrix.com>
 <20210716123812.494081-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2] xen: allow XSM_FLASK_POLICY only if checkpolicy
 binary is available
Message-ID: <7863f794-13cd-e973-a16b-4e2cda3a2144@citrix.com>
Date: Fri, 16 Jul 2021 14:00:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210716123812.494081-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0268.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f26f7805-8331-4237-4da9-08d94859b909
X-MS-TrafficTypeDiagnostic: BY5PR03MB4967:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB49673C2EE6E5A26207A61E1FBA119@BY5PR03MB4967.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gjym8mytLWkmRFBepkf9UloVsEwc8oLqUoFtP+ypvp0YamQkeE8cRIMuUASkj7QVCpiigX2DtPnPw61viT5x+zXoYxTF3eyMXANtt5daWDOIORv62YR5t2nbTdVF4TMM+MFKkJe2SVgWgcNdJy5JcvyrzkO/g2OGh2ZA/RasBZbJ+PofWihNJpFRkUQ8uHtMTKlsv6PmET5yf0MzSXSzHGvtaICusqiHmzMTGKFq3xT+f349u2qdEgBFGs3PymjRiwCuD46sXDgu4VsdbubelrAw4eUrY1qQANGB5TTa/V6xDH81en2xSdtzCIeB22aEuUmvWHaICcpqR+4l8SQg6b5WlFVGU5XPVV7MG3BYfs+Pt5WsW+LlRRFM2+FqUv5hCo4Jxub24vwSUmTHGBshTMitTO36VOA2ao2LHin2LXuNo4Xqb7nWve6DWQNzWlD9jRt1SGxgO/00b1KzKRYdXdedroLIcw6evP7jg+KXCx9oLuCG4iFyk0H3CsA2sdcjCsmZpgLT61UPVB21s4pE2NpNFAntTmlTPQ+D16rtyvUCU5DUculp9wP6rLIpVsU8//pRzKeuaz8U7XCThFutVcgcwBqezOSdQYfQO0qd/kBF4ZHe4JYNlDxAqXw4WGkoYC9dSyH2ugcJ93darxAKFVXLgpN8ipJ2mN18KlZcRSs0bP7HLb7YMkyu156lww4nDwZEaWkiDH5xjs23l1o0zZUYneQZ+wynpGUUR6YM4H4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(31686004)(4326008)(2906002)(86362001)(316002)(83380400001)(478600001)(8676002)(16576012)(2616005)(31696002)(66556008)(66946007)(66476007)(53546011)(54906003)(36756003)(8936002)(186003)(6486002)(5660300002)(956004)(4744005)(6666004)(26005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a29ZRHVPS1BnZGhBVGFydjQ0NWVuQUxkMDgwVUg1R3pyZnRnLzRlRUdqYVhL?=
 =?utf-8?B?SVdnYnBsUVNIb2tQREZpSG9wdXBYSjgwamFVYjJhSGFubWQrcm8yaDlPbis2?=
 =?utf-8?B?RHRBei8vUmlnMWIwaTM5dGo3bGYzYUhQRWNDcDcrZDV6Y1N4cGRXVE9hWnlQ?=
 =?utf-8?B?RnE4aHB6V3pRa0xIeFFLeHhaVEsvRzZLM29UQ0xZWmNXVDJBNVBMSzJNdlk1?=
 =?utf-8?B?Qk82V3ZtajhUZlp1Rm41ZlU0TVl1S3dTQzJlZVpNMjhLT091dHAzQi9UNE0r?=
 =?utf-8?B?VU1ON2wxdzQ0UWwyRDdkR0FyWGJFZVRnWDlTLzFXbFRsa0xjR1EwcmZxSmlU?=
 =?utf-8?B?bzc4WVJRS29sdjRJa0V1ZGJMMk1ydGcyVzZiUk5WdEc2Yk00ZjJaL2RDU0Zz?=
 =?utf-8?B?YnNJSStyaFc0RFJLR2I4NzQ0NytRamlDcjRPekdOeXM3WmVhQkIweExnc1Zq?=
 =?utf-8?B?VU9CWEc4ODFEMS90bDFLVXhIZGp0eDA2MVdCbVNaWStJRjZMSXBpTFM0c1Bh?=
 =?utf-8?B?ZjBlaVJsamhHNVU2RkhIOGtld1lyazJJdVQ5S3g3eFF3bWxzRnZTOHJMeG5i?=
 =?utf-8?B?ZU5qMGlIKzdVdkdneWN2akg1SU8zbnJEZkk4WFJtQ2x5US8rbDB4MkFWUUda?=
 =?utf-8?B?MnMvNzZ3K2ZpdFZtK1RPMjRVSmVldDB5eFlEK0FkOE1rdTkwM3pGMnpWQjRQ?=
 =?utf-8?B?b284SWNBMW9ibStVbnYvU09WZzQ0VzdHKytmTitaTUQzSzN0eHd4ZWt4bmhP?=
 =?utf-8?B?K1c4dlgrRGxjTnJrY3BlQmhJcm41SnNNU3gxWDkxTkRiTmNnR3FVOThEMDVN?=
 =?utf-8?B?d2NSV2h5czEzbTZtK3ZkcU5XazJsSDFOaVRpcHNDN0RIYVRRNm5rRXluaXVt?=
 =?utf-8?B?cmVoUkpncTBvRzgwY05Ud2NNODBldFVKMWFTTnduYmVsMHczbDdhQ1k5Nkh1?=
 =?utf-8?B?Q2czOUdTZytJSlJuNHNaa0pwM2Qra2Ftang4OXJnMStQTi9rLzFoWVVheERv?=
 =?utf-8?B?cEIyQUJBaUFBSnU4bXFCNWo3alg5UVFSbDMvQmd6cnc2L3NrcWVKSG9oaUVN?=
 =?utf-8?B?R3dET2VCL24zVG43UkwxV1NDdnJJMHphZUFxM1oxRTl1djZrbHpWVkRUczFB?=
 =?utf-8?B?L1YrMXp1QVVKTWYxcEtBS0JIRHg3bGQ2YTJhR2p6NUN3WERmdFRLcHFnWGc2?=
 =?utf-8?B?d2tHRlF3MkIwWDdqUHM1dENRS1J2OU13bXVZdHYxdXFxY05qbVcxdUFra2pJ?=
 =?utf-8?B?cm9HZC82ZVdxbmpzSmp1SldlMU85Qm9ib2g3UXNSWmJPR3ZBWFVleTdVY09I?=
 =?utf-8?B?bm1xUVB5QnQ4WUxWRXQ1aW03MGRaQVpNY2hhS1VZdlhmaWRpbDZ4bWxGSFhj?=
 =?utf-8?B?NWhGakFJNkx1VTdzbDhxRlNObTdrbzBJQkxJNXMzb2JIa3N3OStqNkRxeVA2?=
 =?utf-8?B?Q25Wd3NPTy81T2pWblRsWnNZenRJQ3JaNmxndkFUWjFwbFpuYXRJaUhiSEZr?=
 =?utf-8?B?c1Y2OVpLUjUwU0RQNC9vZnZNZmcxRkI3NXQ5Zy9MZktmRTlaNS9CTytMMWho?=
 =?utf-8?B?RVBZVTg2c1N6OE54TFVrdGF2V1QxN1lZdEFFbTY4U0R4SGJ6TDFiQlBMZ0Rx?=
 =?utf-8?B?U2ZJa3NTYlFGdlhhdG5TYVphcktPTnFvZ0E4VmZTWkZYRWoxZnlLZE9uMEJC?=
 =?utf-8?B?ZmdqMjJGUzB5NDgraEVBWHh1ZVpINE12RkQ0L0J6WnNFaFd5aVQrTjlPOFdm?=
 =?utf-8?Q?VpCjfO/pN2gmDp5TSgrEyn1+Z9bejLPiLv7udkl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f26f7805-8331-4237-4da9-08d94859b909
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 13:00:44.5758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SXjBDJDoJJnLC/k6F+b17/GysXW/w/1hZTjMA44MUA2v+WIriScJh6nBnzFNF9gZd5zjyEZ22MmmZl9R3PP8zfl0bYU14SaumAXFU6gI4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4967
X-OriginatorOrg: citrix.com

On 16/07/2021 13:38, Anthony PERARD wrote:
> This will help prevent the CI loop from having build failures when
> `checkpolicy` isn't available, when doing "randconfig" jobs.
>
> Also, move the check out of Config.mk and into xen/ build system.
> Nothing in tools/ is using that information as it's done by
> ./configure.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> We might want to have a new Makefile for this kind of check that
> Kconfig is going to use, just to keep the main Makefile a bit cleaner.
> But maybe another time, if more are comming.

I won't nack this patch, but I'm a very firm -2 against it.

v1 is the correct way to go.

~Andrew


