Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5D3B48CC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 20:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147370.271602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwqam-0003Fb-N2; Fri, 25 Jun 2021 18:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147370.271602; Fri, 25 Jun 2021 18:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwqam-0003DW-Jh; Fri, 25 Jun 2021 18:30:16 +0000
Received: by outflank-mailman (input) for mailman id 147370;
 Fri, 25 Jun 2021 18:30:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwqal-0003DQ-BX
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 18:30:15 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0dd64d5-8267-400b-81c3-e568e684f3a4;
 Fri, 25 Jun 2021 18:30:14 +0000 (UTC)
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
X-Inumbo-ID: d0dd64d5-8267-400b-81c3-e568e684f3a4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624645814;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rnt3G4VwIadZCl10fkgvQNzuX23lGdCnsgQ1ox9CHuA=;
  b=hr1ppLj9vX7sWWJyxMHnroiSq1oy9rZuZBFmqG/shUm4eOjl2kgAdWfB
   0r5t2jwnIkyNcHb81N7kJFXvWgwjnCOB2JXY9Y0bsv+KbFE3RNCFSTehg
   XYwPHkSkKOGxFu0pRJfsXRcAfHhdAd368noA2gqU7ErQZP/cta8nbd0qt
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VcNld3m5D5MHLdoI4b6pvA+A92bvhDpVKdMMKk7yMDkq1r5NdigIFdQG2VyfEt34fUnOkeedfy
 +kDqTJt32v33b5l3Cop99A9a0lFTlhR61atKcDnIDJRf9110tw5aE/uBEWMboVxHCC3OyGUQ0c
 aMdEMGWIg/xo+1mpDL+OCp+99v314Gr5QmnWvMwHyseqJ7/Vf6BipSFHXXR/YF71+xG91jojm3
 WGclPMrOI1BX9pVpyjnOQv1HZuug5rekFA1zwwHX6bQfu3wuw31ER2rXsQ0s8PD9OvBVcO4K2Q
 8cM=
X-SBRS: 5.1
X-MesageID: 46987394
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jRW7g6z2l49B409VEounKrPxyOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjlfZquz+8K3WB3B8bcYOCGghrVEGgG1+rfKlLbalbDH4JmpM
 Fdmu1FeaDN5DtB/LTHCWuDYq4dKbC8mcjC74qurAYOPHVXguNbnmBE426gYz5LrWJ9dOME/f
 Snl696TnabCA4qhpPRPAh0YwGPnayEqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD69jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbUz11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA17kwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMkjgYdq3MsiFX5uYdE99HqQ0vF/LA
 AuNrCe2B9uSyLfU5iD1VMfmOBFNx8Ib2K7qktrgL3Z79EZpgEj86O0rPZv1kvoz6hNPaWs0d
 60eJiApIs+OfP+UpgNTdvpYfHHRlAlEii8f157HzzcZeo60iX22u/KCfMOlbuXRKA=
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="46987394"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWMElGv2eMI8J0CNeIuXc5AxAkitdAofU2WgaEgHGxYxRr0StW1whpiLja8rz8IT+iV0S1uc5b96mrKeiLcQW7/ofqjMUo4erZiSnjsdkctE2bUXUvmpOoaArAX/NHt0ZWlrfhTgN5zTuu1UvpuFBsfxenr5gUPt7/Naeb6NBBh5nkpsTHa4zRlQ8/Nrbx0AmzjCCQZkMq/nukfA5oD39jGNl2Ll66A9m8ufg8ANSvXnZK/K5V9gljepe71ylHGEzky/K1Usd/8ZrpIdX3rkurGpGNOUbWqYaDf+wiy4mDSP+v4irkyblNrZI2+LzN+9D/N007gOLj+vu1tvWYNmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nJvP+9uFsJIXLduVWEcB6WqwnucemD0Bt0vSwzrOb4=;
 b=hCCPhPuz6MyCaIYFLB7Vgg274P8eabXKO8dw7UIddn3KU/2DNn6iLV1mQCm+O0iC8AKwgqTdJWavNnOmm4pfSBJtzyRYcT/XuQNN6uwXAIM1kRWDZKzNjm05NKYKMXn6kDQTBriAEtCmvUtgnl3Ufoxcun/K6Z23B4eVzxPM9sB54qnPQqoLsbMn6RI3xBJfqgYDNuPje9qBf6GaCMw89NlftzSpBgHq2Tb5up3b2aIYc9B9qpdY+3921wC+HravTIvtB3NjGOuRbE2W+U6MXYN+9zZtknQWaJjXAP+ZR204dEZJsVY7lOmksn7IR8ELt+Dsigktxo9RDvjABx8l8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nJvP+9uFsJIXLduVWEcB6WqwnucemD0Bt0vSwzrOb4=;
 b=EVxozvna1xDl1e/jHooCxmMXEGUgofC1seL18HvzEWUxVdx1BoD0f502u8n9kk8pxhpMNwCqeEy2JW4xXZcgs5dhiu4lw5iqZ7DKYcz2jAVuDtdJ5NGO0hdtVVrvJj3V2JW3mYPrjkjrC3Znc4jS3Va2D5SIfiODVzKBlEdz/V4=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <0d824d4b-0696-baca-a3ef-95ee641e4d08@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 05/12] libxenguest: complete loops in
 xc_map_domain_meminfo()
Message-ID: <7cafca96-1d01-db96-8583-b8299aad41fe@citrix.com>
Date: Fri, 25 Jun 2021 19:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0d824d4b-0696-baca-a3ef-95ee641e4d08@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0078.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de6349da-ec28-4c4d-ef16-08d9380743a7
X-MS-TrafficTypeDiagnostic: BY5PR03MB5079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB50792A73A7420F611F2E0A1DBA069@BY5PR03MB5079.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J0QbDaOJoXi08q4xWjlaRGdU8vLPAlEO/TPma7gl/zu4WkvZYylFtTIlaSjQLedxohL2Exjv70WVSxg/VPoVLOo2g4sgr2/llk0tLAT/YXO9AP3wWSVYRSSMubvBpEzTZLwUcR6Mb1hYQmS2dKG2oQTbWaBc1rQYJ1ILJLmsiUHu0BkaU1CQ48mCSyU8uV68yx1bxopL2ldgQeBDvWTEhlXr+BMu4fQ2RNHSdjnbzKBO9FQO0/AZjXvKJMoYNwTTJzXaqCgadPn3oj9nAvcFc83b1+PTBP6INMYcmqHHR6UMh1rnN920AcEtOia+ib6j1HaRrJmHnLUOkjXVYbtVKDx97M175gwQA1SLKRjulFQAByNUhnpdko46Ec0T3KOrbLwycm/wpqS0SdXzPfFLnxhVWW47FGbWhntQv3JpJGr6n70S2cu4IsiBWUQ4WuKrOQFqRHE+gakBwsGVYOQBQA68trxhUCab8HDnp6PNoFmX/n6W+3TQY7cdcWUm5fTg5vsyzWIf/r5VoDddpEh3KWHK75GKMwQRGOYWFQV+lPCzLOc3eDjBxCai0M3268KrDkciHalYX5e7lz3ZcvA4o70OWkSthpbcbOd8LXsNt4Wh65Rl7kDnuGsP/0G+jLrsmnSVjRyxTXutImLGNm1fq10CblNjfjSdftxRjnw4aJSMowKknKLxdAbnL9mwYAH6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(31686004)(31696002)(38100700002)(53546011)(2906002)(110136005)(16526019)(6666004)(66556008)(66476007)(86362001)(26005)(5660300002)(83380400001)(16576012)(4326008)(8676002)(478600001)(66946007)(186003)(8936002)(2616005)(956004)(36756003)(54906003)(316002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpWWUFEb251YWc0VzlOaWwzZzZJdXd3WTdJWkludDlQdVVTTzBwcjJId3B3?=
 =?utf-8?B?MHlqSWdqRUM3YWd0NHAwOEc2NEFtOUl1ZVU5YXhrUEJocTkyTWR4V2s1RHhM?=
 =?utf-8?B?NW5RUFJFL1o0dGE5enR0dWQ3SDhDYzZnMXI5dVQrMW42L0hnMThYMnJjTktj?=
 =?utf-8?B?eGo3SDVCWVYrdkU4NFkxUW4zNktVNldwWWp2dU9ta0FtNGZqa0FqSFo4cmhx?=
 =?utf-8?B?cUM4cSt1bktha1ZVcVpXd2pZUjZpNDEwczRBTlpqWFQyYk9lenVDc0VLQkZn?=
 =?utf-8?B?TTBSTW42OEJiQ3NlUVM2ZWhXSGIxYzB5dWRpM0tWekFXZ05IWUFRQUgvSGNQ?=
 =?utf-8?B?dysweVkxUUVodUNZa3FBVEk4TjVDU3luQmhyYmxUbUI5VG5qbUpsNFhiaGVR?=
 =?utf-8?B?NDFWdWh3MkQ2SU1ESkFjQVdyRk5oekN3UXdLVXJqQzZtK0ttdmN1b0l3aXYr?=
 =?utf-8?B?bE9QL3l0STNWNFVpelVKd24vbnpzcTJidXRVSzMyaFZPQmxXZjZMZmR1SHB2?=
 =?utf-8?B?eFNnVVFSUlRWQzIwb2ZqSG54NFZRcEtNZi82bW9rT1kxQUZabVRnb0FZdXZl?=
 =?utf-8?B?ODV6UG12SnBRK1NaTlJIZHd2SllQWnZtMWJsUTRoWnFmd0tRWHAvd1lnTXpu?=
 =?utf-8?B?aTZOMm5ZVmF6T2daamNndmpON3YxaHlteFZKWm8vV0pDUXpOOE55dGdqUzAy?=
 =?utf-8?B?dStjVVdSZXhuY0xVNGZTZ3FiVmsxNXRib2RXUUk5eUZsV202TUM3alQvMGZ0?=
 =?utf-8?B?U1JTUnkzcWx2ZlhUcmc4ajZ0aW1CbFhzTEVlOFh3bWVZN0FSdEFKOUdYeW5O?=
 =?utf-8?B?Ui9ub2RQeTBMOHdjMUVEV3B1WEwrRXVYQlEzSVFPWEFCTzgyM1VZY1c5Zlha?=
 =?utf-8?B?d2IweEIzWThCb3phK0dKTkU4OG1WMSswVUtvWVpKTXFZWjd1ZG5NUmZTSHJK?=
 =?utf-8?B?SzUrNHh6S3F4NlpCZUtZek85MmtJWEl3QmJmanZTTCtxbHdlbTJrNkRqT0l4?=
 =?utf-8?B?M0NoSEszeGZ0L2RLKzF4TjRaVStEL1g2aHJ5NHhaK3FkOE1Tc29VOTRReEZ5?=
 =?utf-8?B?QWZwZTdMQkp2VTRISW1rQUZidUN5RXY0eFJteHlUQmRyRVZ5WGl4UCtKTUZF?=
 =?utf-8?B?VG9Wd1l6NnpLS3RmN1hPQjlFcW9HNllrSXNXTjR6MldzNnovclMzMjJud0t0?=
 =?utf-8?B?UHFON0c2OWtGR1pNaTdmNG9lVnhsOHJldmxSdjlvL2krdHVsNHZsR3dtMUU1?=
 =?utf-8?B?K2lFcHhHUFp4V0xPK1hDRk55S2NwVGVVbDJ3ZmJqa055UWJFZlJhYzMzZmxM?=
 =?utf-8?B?QTF6RDBKZlRRQlREaDBKTlNwckVkVUhKK3lIWkROTW84MFdDS3ZKTVRQWmt1?=
 =?utf-8?B?dDlsZmM3bm5XOG5XUHl2eUFMVC9GSEd4ZExKbmtNRVdJK1JSYVpsRWNHVzhI?=
 =?utf-8?B?NHQ2V0lXYUVBdGdYNVhHdVp3VWFvVUpLUnBTcUpwb0JyQmlkV0NLTmZRVE45?=
 =?utf-8?B?d3pOcUNrdThzQlVrT3NFQVFlbjF6d09yU2VJMUUwS0o5TUo4M2dGUzF1NGlD?=
 =?utf-8?B?OSs5ek8rWSsxOUk0Q3F1NWovTS8rREcreFErNTBDU2xXSklDRDVqS2orZ2JI?=
 =?utf-8?B?Ym0yNHpWT1U3QldZeUw4S0NyTE12QkdjWjB5VXJqaXlGbGpMSlhRQWJWUUFj?=
 =?utf-8?B?djZ6cmF0L1RxZElFbTV4M3FFcThFWllPY3pJUUFPUEtNL2loS20zUXZwZmda?=
 =?utf-8?Q?hjTo9QUoR7WwZOQ2fyxcsZCgEQKBrDiw3bmDLxA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de6349da-ec28-4c4d-ef16-08d9380743a7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 18:30:10.1960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A5eoj51ZCH3nxw5pL3dtDTIRvTCu8X/rpq9ciGJDhNd77ebIZl2YGGU0+bli6yB2sr7h8B2j16a4IuF6tB1vXYBHQXtmzefALiRSLHAKRtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5079
X-OriginatorOrg: citrix.com

On 25/06/2021 14:19, Jan Beulich wrote:
> minfo->p2m_size may have more than 31 significant bits. Change the
> induction variable to unsigned long, and (largely for signed-ness
> consistency) a helper variable to unsigned int.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/tools/libs/guest/xg_domain.c
> +++ b/tools/libs/guest/xg_domain.c
> @@ -40,7 +40,7 @@ int xc_map_domain_meminfo(xc_interface *
>      xc_dominfo_t info;
>      shared_info_any_t *live_shinfo;
>      xen_capabilities_info_t xen_caps =3D "";
> -    int i;
> +    unsigned long i;
> =20
>      /* Only be initialized once */
>      if ( minfo->pfn_type || minfo->p2m_table )
> @@ -116,12 +116,12 @@ int xc_map_domain_meminfo(xc_interface *
>      /* Retrieve PFN types in batches */
>      for ( i =3D 0; i < minfo->p2m_size ; i+=3D1024 )
>      {
> -        int count =3D ((minfo->p2m_size - i ) > 1024 ) ?
> -                        1024: (minfo->p2m_size - i);
> +        unsigned int count =3D ((minfo->p2m_size - i) > 1024) ?
> +                             1024 : (minfo->p2m_size - i);

min().

Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

This whole infrastructure is almost abandoned, and broken.=C2=A0 Its used b=
y
xen-mfndump (debugging only) and xen-hptool mem-offline.

The mem-offline functionally cannot possibly work usefully.=C2=A0 It is PV
only, despite not having an HVM check, and in particular reads the dead
page in an attempt to restore the contents elsewhere.=C2=A0 There is also n=
o
thought given to writes from outside sources, such as DMA from
passthrough or a different dom0 foreign mapping.

This is perhaps ok as an academic demonstration of "can I shuffle memory
behind an alive VM in ideal circumstances", but will be killed by the
dom0 kernel if you ever try running it to resolve a real memory error on
a VM, because there is no possibility of recovering the data.

The mem-offline functionality needs deleting.=C2=A0 It isn't production
ready, and can't credibly be made so.

~Andrew


