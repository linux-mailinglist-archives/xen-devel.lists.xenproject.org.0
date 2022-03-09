Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF374D2DCE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 12:18:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287722.487862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuKV-0005kz-6T; Wed, 09 Mar 2022 11:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287722.487862; Wed, 09 Mar 2022 11:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuKV-0005j7-2t; Wed, 09 Mar 2022 11:18:07 +0000
Received: by outflank-mailman (input) for mailman id 287722;
 Wed, 09 Mar 2022 11:18:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNbA=TU=citrix.com=prvs=060736ad3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRuKS-0005j1-Qj
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 11:18:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9459ba34-9f9a-11ec-8eba-a37418f5ba1a;
 Wed, 09 Mar 2022 12:18:02 +0100 (CET)
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
X-Inumbo-ID: 9459ba34-9f9a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646824682;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WPUjYX9bugbRPq6ux/eRYhso4JsCF2T4Qrs3V2ye7dI=;
  b=W1LatPV+Ix5mCnQF0r118NiPqsfN4RJVlR3XhvuWus1/NhrC2tK6nOOv
   Lr5DPKBBZfZiIa5ppL2pAjny4WPLe3pqAkCYl+vNf/Ytt5h7GDRfJwsjP
   0iixHdvTvy//MTKH+T99H08NrsGxwcPfy7kmR6AyPVyPlEN3Jf6o+sPPS
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65801515
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:l/M6nq0PkV2BDTIIv/bD5S9xkn2cJEfYwER7XKvMYLTBsI5bpzAHy
 GFNC2GHP6rbNGfwLYpyYNmw/ElUu5XUyoVrHlBqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw0IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1qtr2WSDkvO5fwt+BaSDNIShNAZYNJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u25AWRKuHO
 qL1bxJRfDnNZixLOWxIN8MUvsmRjV38YwJx/Qf9Sa0fvDGIkV0ZPKLWGMHOZtWASMFRn0CZj
 mHL5WL0BlcdLtP34TiY9nOhgMffkCW9X5gdfJWg/+NuqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxLlINTiNFLucnssA2bTUw0
 xmCmNaBLSNrmK2YTzSa7Lj8hRm/IzQPJGkOIwoNVxIY4sLLqZs2yBnIS75e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT2lPmpTOSoJ3zciExoR79TjuX0FtXa9vwD2C30mTz4fFFJYefa1COu
 nkYhsSThNwz4YGxeD+lG7tUQuzwjxqRGHiF2AM0QcF9n9i40yP7JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtNiJNrKigbArLWdrGR2Cg2bKgQgBd2B2zckC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+bAOyDJE+dZbAfQBgzc0E9iiF+Fm
 zq4H5HWoyizrcWkOnWHmWLtBQtiwYcH6WDe9JUMK7/rzvtOE2A9Ef7BqY7NiKQ+95m5Ytzgp
 ynnMmcBkQKXrSSedW2iNyAyAJuyDM0XhS9qYkQR0aOAhiFLjXCHt/xEKfPavNAPqYRe8BKDZ
 6JcKpvaXagXFGivFvZ0RcCVkbGOvS+D3GqmFyGkfCI+b9hnQQnI8cXjZQzh6G8FCS/fiCf0i
 +f5vu8HafLvnzhfMfs=
IronPort-HdrOrdr: A9a23:rtjoBK1nGvvEiKgS7OqXdwqjBVByeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJk800aQFm7X5Wo3SITUO2VHYV72KiLGN/9SOIVydygcw79
 YET0E6MqyNMbEYt7eK3ODbKadY/DDvysnB7o2/vhRQpENRGtldBm9Ce3im+yZNNW977PQCZf
 6hDp0tnUveRZ1bVLXyOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mOryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idgrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT1vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amGazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCR2B9vSyLaU5nlhBgu/DT1NU5DXStuA3Jy9/B96gIm0kyQlCAjtY4idnRpzuNId3AL3Z
 WADk1SrsA8ciYnV9MMOA4/e7rENoXse2O7DIvAGyWvKEk4U0i93qIfpo9FoN2XRA==
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="65801515"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0GYg9NMBiC3VpSzni7hyFMiynsLV9JxYSfi7SHkFlotme9WOhTpN++3P/jUs0g9oaRBpBxlYGnZiOosh5Owx0hva1y7/5RBaQvapL3+qzdQcTqG6cWovImIkYMHRaIE0ixyZ39LwTKBD/037P5faTKIF72jlyX761rQKdaKDIvY1Dv0ubjSCCDNGtRNx8NbC2j42niU9MWJ3O/zgzDFBBdSeS+n84lT1rOJd51765LjLzckkzEt92/sy872W14z2GlecJM7FIvfKL+z+vXsRiReICSXV0j/X3lCxtTxjAKIfZsRiE3hh5gbiyhYGrBVHfqk8KtTtt4wBcsZSZppRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Nah9IVu+bsiNX23p3/K8fCHUk1qdH8r7XMO3YfzH5M=;
 b=Yhuq8qGZdDzjxJC9/BHeK+m/G+QB0JF4KnX/oykHOMeBXdgwx9UF41mR+amKPNagcHEntfeAhiEgoruXbxYw6g7yriPiAng/C4RLCFNJ3Nv6+FFeYdaUtjOpzPYmBuNe7Yo8zbtE3OHOL1irwy/0+xLCZXadngXZbpyYGbjHdHttVbJP5vjPxt7CH6L7+ils+L69XE3X6htODrEg9PolnbxlM4Gm/3jOIl0tXsIyUzX+H7YcXxhkJ5uTDLGr8h1sL/YV+jgQgk9rkIGVahy11HP53ZXBA+QhkKM5J1AtwzhqmJwrp02wrKDvXG1dmpFpClKcHLmcFqTaPi5/+kUv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Nah9IVu+bsiNX23p3/K8fCHUk1qdH8r7XMO3YfzH5M=;
 b=ub43VARB6y6edJDxUAoddDej9CAYKwHUC1vR/6SVfoIjiapW3VSYTETqXVVsGQLVOfV7HbjCpxbu+qm0U+p909wcovU6YTYf4HAKX/fnpdBxiusDA7468aHL3kjX3xQElgtM1kqDYkA19RsB9A7ex7w5qdqhHk9obK9samga+Tc=
Date: Wed, 9 Mar 2022 12:17:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Message-ID: <YiiM1vdbJ+51Lyvq@Air-de-Roger>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
 <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
 <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
 <Yih+ZjxKz0SMOXef@Air-de-Roger>
 <D73324F4-180F-472E-B2A4-14305D3D764B@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D73324F4-180F-472E-B2A4-14305D3D764B@arm.com>
X-ClientProxiedBy: LO2P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 998a9efb-6718-4f4e-bbb2-08da01be70d7
X-MS-TrafficTypeDiagnostic: BN6PR03MB3043:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB3043603F9FE8C8FDF674CDB38F0A9@BN6PR03MB3043.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nDl+lWaWrUmkCfcinbLxsgevW+m23CZn04X13QoQiyoA8U6RdCYTSBxmOkOcBrmAAwbH2kRVKIJ3i2dYCAh+qpUOC4pskOfhqcp+7GOECiaVR2GXN5D9ea4KPi5vLeSFIDOjIZbCBDfWLdyZvLjT0jRDBBktaZo1tulUoRpjRR/p9/K+CRhARi/IyQQIp5gGnm1RDsC/JRMyRyCq6mLUz2rZ+DkqfhdOubUe+cDckRq/f0U2eMR4ga/oik91M10NdRRejX6kHmTTkrg1TIBxaVlIOzFyWTelUW9HGiey36NlL7qkY4cEg/tdb+f9m0CwFmJoq4A1redC6HztFesqRkyxk4RmKGeZFkpBDwYio4aEl9QwTAA4Jeu9x5TDfogfZS9sZsIYna1LV/UqEaENqP0I+xVLBvaGEXSM4MVj5/++9qHxWsC1c6Ngcc9S4Av63jQuy0jWkwZG/lJTiUV973uLy0nszs5GtvP/tDR+CnQ+S57VJdtWydI+e4qW3MVE7bQ/Ws0kYlHrNFSyqmWWpZgQhSIK3cqtAVUg+PBm5tT4uWAoXfHq5TTrxwh37hYSttJ7YSWzVxE0kux5AQM7MIaEW7sAAGFFlmI8Y5BerOfahNOC9l4mPMvZxQWzHquXBT+Ez9UDt7GKlfMCFqfzepJcLwZsoGJsG9AxBgbuh3h/reMQQKYcZeGkZQ/s0k6eZoPm1yZufU+Zf2YGmOXrOY2HmRmrPYsens3EzmW5lLBCz/Ck5gOZiXh8S8fPu8lB/9JDs4uwC5rCtt512bOaTpTgFyV80Ooi6iEugUhO+L0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(53546011)(66946007)(6506007)(66556008)(9686003)(966005)(6486002)(6512007)(4326008)(54906003)(508600001)(8676002)(66476007)(316002)(86362001)(6666004)(82960400001)(83380400001)(186003)(26005)(38100700002)(6916009)(2906002)(8936002)(33716001)(85182001)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JIYW15RDg4RlZSaEd5LzV0UUhGSFVLWnJ3dGltRXJXVUMzZXgwQlZ6ZVll?=
 =?utf-8?B?cjZhdzRoT0FaSDZkRVBKZ1hLL2lmY2pqeWVXSlpWVXczTm5UbzNnTFlqdXlr?=
 =?utf-8?B?M2szT2lhZWJybk9nNllFSXUyUVpDejVCVEc1b1ZFTmhRTUNRQkVvNUt0R3gw?=
 =?utf-8?B?WVAxa2tvakpuZGxiSTh5V0xkT3NOM0VWcEtlbGgyRXhMdUhkT1V4c3hFMS9x?=
 =?utf-8?B?MlhEdG42M1BHK1N4SGhvbXZLK2VTZnFLbkFvdHdIME5idnh2cGt1RTV4TmM2?=
 =?utf-8?B?L0lmcEgyME5VUDZKdkd2NTd2bjVKZ3RvQndPbzV4UlBoVy9VaXU0eWkyK2Y3?=
 =?utf-8?B?dmJrZWlLQzQ5c1BHME5vZWlsdk8vM0phNHE2dDk0dDRpTTY4a1N2ZnFFcTMw?=
 =?utf-8?B?SEw0alBtOXFDR090K1BsblJ2NlRFQXZoZlB6TXRORnpiMzE1WmN4elV1ampH?=
 =?utf-8?B?U01zOEpOdzhZdWZRaWh4TE9KRnowbzN1V1hTZkNzVUJlUWw1bnE3aXRlSHgx?=
 =?utf-8?B?djVlVCs5UmNEQWRXZ0haSTBDaE1uWmIvME83WEVaU3RLclFlb29TeVFzV1Vp?=
 =?utf-8?B?cWd3ZE9iWGxKaUdsOUpUZmdReWthaGpLYW9CWEZxZE10cDY2OUR0T1I4WWlp?=
 =?utf-8?B?VFFBdVd6a3NKcDRNS3FpU2dBSStXYUF1K3R4YUlxajQvU1NtdGpuVXAyYXMr?=
 =?utf-8?B?eFFFcUZkN3VSdXJmMW9NaEZKRjdYNUdXaVl5WHFIR3A2dUc4V012WlJyRXBX?=
 =?utf-8?B?cm5VbDE2WTFxUmJNNG52emtHNmVpMFVvcWFMZ3IzSkt4Uk9oSCttUE1MSGZv?=
 =?utf-8?B?Sm5malpCTnNobkY5K0xtdkFBRXQ3a3ZNT0JFeFRTcE5OT0NJYlQrU2NEcEtu?=
 =?utf-8?B?ZzgzL0tjZXR1WUJFMVRlb3lEM0Z2UkFiV0ovQzJBOVZ6eElER25uKzY3cTBD?=
 =?utf-8?B?cnpESFRtcnhSWHdIMERrTjNHUHNGQThROWVraFFZSmt5Z3VaN2tyeUl6QXRF?=
 =?utf-8?B?ZW90WlJBUkNDM1dUSzgrekF5ZmNoQlVZOGszZjA2eG9qWHMrVTZqTUZyRzJY?=
 =?utf-8?B?Vmlha3FwTGlVZnVPTmp3R1gyUitRdVNHTmROd2FhVHB0UjZadFZKcFhVMXk0?=
 =?utf-8?B?aC9DRVpZY3NPNHdRUS9OK0luckxQdU5iNVNhbGJ1TGtaaCtreEFMNTVjbUxB?=
 =?utf-8?B?dXpldDlNSEdmZEVTUklVUVpmWXREK05ZbVhkMUFuQkZPQmU5L3dCREQrck42?=
 =?utf-8?B?ak44bTY5RUZiYlAvbDFGaUkrZEhzYno5OTAySmZHdUtCcDFvdFVpR0phWEl5?=
 =?utf-8?B?MGRvQmRPZHlXSFRTcWp4THp0Q0VjUXQ3SkVOcDFUVUtLSnpzenlYeXZjeGxS?=
 =?utf-8?B?VmR0M0dmZFRwWlJNMGZ6VGtrY09tMmNNMmNkYkJRQklSeGZsaG54R1J5Y1NS?=
 =?utf-8?B?THB2enV4MU5pMjNwT3BsVUVsRVJFL0JNK2tuaFBuU1EweWJVTEUwcnlIWEor?=
 =?utf-8?B?WlI4REpKQmZVc0I1TmtFdzArcnpBUEhQc2dycy9CV2dMaHBBekdPemJnaVBa?=
 =?utf-8?B?UENPbVF0R1haNkFmUDUxZnFjK3lyM1l4SkhUQm5FeDJLNy96Y2IxUGlTM1dR?=
 =?utf-8?B?RUZTT1hqUXVMYWhiVjdtVjljaTZOSm9oWUtyallnQ2pzTTBWNDFHSkxMMXdx?=
 =?utf-8?B?N3FDZ2ljMWZFbUVzbk4rYi8yamZXTXFraVpLa2FWQnVKRmE5ektuRmFLR2JK?=
 =?utf-8?B?cVB5TnJvN2ZYVEoyMUV4YzBGWFh0dHBUM1ZNL0N3QzNLNmhnQjY1aVJCeWts?=
 =?utf-8?B?bUNlRWhpekZObTJzb1BUY0ZYK3RxWTVjditHTlBucEZybHpPSm9WcnZtM2h0?=
 =?utf-8?B?R09kNVA3ZFh5d0puYjNOUVorVklGUnlpRFZ5bjZySUtPQWVpMzhnRjN6Y1Bz?=
 =?utf-8?B?VHNCRW1QS3RYWFZWZ1Zkb3lwTVVuRUNpUWpWR21GOUpGRkxkRWhabXhGd2Uz?=
 =?utf-8?B?eGhWNldiR2IzaWNOdGVrL1RWTnRlQzkySTd3VDJuZlZlbktTQjM5Qktud3Zh?=
 =?utf-8?B?dzAvRjdxQkZ1Sm9GRUM1eldHWXlIUTRrdWx3VEZiL29Sa1VFWm5XSENVMWJY?=
 =?utf-8?B?SmZjbE9GYklpdExFWjl1dXNBeVZHZmNYaDdjUlQ5bjVTeGgwWGRiOVRPWmtD?=
 =?utf-8?Q?iyEK7B1eaSblV7zg3uB+r5Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 998a9efb-6718-4f4e-bbb2-08da01be70d7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 11:17:47.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUx12nspI1kRGNEYrM2NKnoNxKYXUNpJ+6zTs+SuJiqT68rrbCkhYx9sgUjxAovubsITyFIWaIf2GmEtjV9HPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3043
X-OriginatorOrg: citrix.com

On Wed, Mar 09, 2022 at 10:47:06AM +0000, Rahul Singh wrote:
> Hi Roger,
> 
> > On 9 Mar 2022, at 10:16 am, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Wed, Mar 09, 2022 at 10:08:12AM +0000, Rahul Singh wrote:
> >> Hi Jan,
> >> 
> >>> On 4 Mar 2022, at 7:23 am, Jan Beulich <jbeulich@suse.com> wrote:
> >>> 
> >>> On 03.03.2022 17:31, Rahul Singh wrote:
> >>>>> On 1 Mar 2022, at 1:55 pm, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>> On 01.03.2022 14:34, Rahul Singh wrote:
> >>>>>>> On 24 Feb 2022, at 2:57 pm, Jan Beulich <jbeulich@suse.com> wrote:
> >>>>>>> On 15.02.2022 16:25, Rahul Singh wrote:
> >>>>>>>> --- a/xen/arch/x86/hvm/vmsi.c
> >>>>>>>> +++ b/xen/arch/x86/hvm/vmsi.c
> >>>>>>>> @@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
> >>>>>>>> 
> >>>>>>>>  return 0;
> >>>>>>>> }
> >>>>>>>> +
> >>>>>>>> +int vpci_make_msix_hole(const struct pci_dev *pdev)
> >>>>>>>> +{
> >>>>>>>> +    struct domain *d = pdev->domain;
> >>>>>>>> +    unsigned int i;
> >>>>>>>> +
> >>>>>>>> +    if ( !pdev->vpci->msix )
> >>>>>>>> +        return 0;
> >>>>>>>> +
> >>>>>>>> +    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
> >>>>>>>> +    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
> >>>>>>>> +    {
> >>>>>>>> +        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> >>>>>>>> +        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> >>>>>>>> +                                     vmsix_table_size(pdev->vpci, i) - 1);
> >>>>>>>> +
> >>>>>>>> +        for ( ; start <= end; start++ )
> >>>>>>>> +        {
> >>>>>>>> +            p2m_type_t t;
> >>>>>>>> +            mfn_t mfn = get_gfn_query(d, start, &t);
> >>>>>>>> +
> >>>>>>>> +            switch ( t )
> >>>>>>>> +            {
> >>>>>>>> +            case p2m_mmio_dm:
> >>>>>>>> +            case p2m_invalid:
> >>>>>>>> +                break;
> >>>>>>>> +            case p2m_mmio_direct:
> >>>>>>>> +                if ( mfn_x(mfn) == start )
> >>>>>>>> +                {
> >>>>>>>> +                    clear_identity_p2m_entry(d, start);
> >>>>>>>> +                    break;
> >>>>>>>> +                }
> >>>>>>>> +                /* fallthrough. */
> >>>>>>>> +            default:
> >>>>>>>> +                put_gfn(d, start);
> >>>>>>>> +                gprintk(XENLOG_WARNING,
> >>>>>>>> +                        "%pp: existing mapping (mfn: %" PRI_mfn
> >>>>>>>> +                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
> >>>>>>>> +                        &pdev->sbdf, mfn_x(mfn), t, start);
> >>>>>>>> +                return -EEXIST;
> >>>>>>>> +            }
> >>>>>>>> +            put_gfn(d, start);
> >>>>>>>> +        }
> >>>>>>>> +    }
> >>>>>>>> +
> >>>>>>>> +    return 0;
> >>>>>>>> +}
> >>>>>>> 
> >>>>>>> ... nothing in this function looks to be x86-specific, except maybe
> >>>>>>> functions like clear_identity_p2m_entry() may not currently be available
> >>>>>>> on Arm. But this doesn't make the code x86-specific.
> >>>>>> 
> >>>>>> I will maybe be wrong but what I understand from the code is that for x86 
> >>>>>> if there is no p2m entries setup for the region, accesses to them will be trapped 
> >>>>>> into the hypervisor and can be handled by specific MMIO handler.
> >>>>>> 
> >>>>>> But for ARM when we are registering the MMIO handler we have to provide 
> >>>>>> the GPA also for the MMIO handler. 
> > 
> > Right, but you still need those regions to not be mapped on the second
> > stage translation, or else no trap will be triggered and thus the
> > handlers won't run?
> > 
> > Regardless of whether the way to register the handlers is different on
> > Arm and x86, you still need to assure that the MSI-X related tables
> > are not mapped on the guest second stage translation, or else you are
> > just allowing guest access to the native ones.
> 
> What I understand from the VPCI code we are not mapping the MSI-X related tables/BAR
> to Stage-2 translation therefore no need to remove the mapping.
> 
> http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/drivers/vpci/header.c;h=a1c928a0d26f5cefd98727ee37f5dc43ceba80a6;hb=HEAD#l248

Right, sorry, was slightly confused. So this is indeed only needed if
Arm does some kind of pre-mapping of non-RAM regions. For example an
x86 PVH dom0 will add the regions marked as 'reserved' to the second
stage translation, and we need vpci_make_msix_hole in order to punch
holes there if those pre-mapped regions happen to overlap with any
MSI-X table.

If there aren't any non-RAM regions mapped on Arm for it's hardware
domain by default then I guess it's safe to make this arch-specific.

Thanks, Roger.

