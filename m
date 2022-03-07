Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6968F4D026B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 16:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286166.485562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREw7-00030D-Jr; Mon, 07 Mar 2022 15:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286166.485562; Mon, 07 Mar 2022 15:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nREw7-0002xJ-Fq; Mon, 07 Mar 2022 15:06:11 +0000
Received: by outflank-mailman (input) for mailman id 286166;
 Mon, 07 Mar 2022 15:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nREw6-0002xD-0D
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 15:06:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d79e3ad-9e28-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 16:06:08 +0100 (CET)
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
X-Inumbo-ID: 1d79e3ad-9e28-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646665568;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=by72GStshEPk1Q8XMK8Ic6u1fjNBPB29NDe0lYQKRYI=;
  b=MmZySA2G66ErbOq4ZWyoOBJpC7O6vMwb284hsdGeiKr8kIFGKriM66BF
   Cchq961KJ1Z3PblRJME2H8HA0Fe2Spk0BNAOsZmgZ36eipaTJABsOi9cC
   vp7LPw5Us+6zJR4vUN1y/20R6rwE0Tvc+3zfeBeHhqKsPKlVRGGPJinC4
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65096633
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lKenT6s9X9MOoI1SYeOp5KluvufnVFReMUV32f8akzHdYApBsoF/q
 tZmKWqFaPrfZGP9e48jb9zg8RkEvZPUzN82TAVvqnpmRCpB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV5
 ouoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi9qEJTO288fAyUfDjhRO7AZ6JnYK3aG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pJIN2Q0N3wsZTVBHg8vMM8Qvdy1oWXUTDRDqVOxqo0Otj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO64U0QPO4aiE30GEH0cCU2FRTsMsuvZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAKzARVodt/xory9U
 J8swZT20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mvmwveh82aZZUJVcFh
 XM/XisLuPdu0IaCN/crM+pd9exwpUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Eb5rak0gECbamCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnmMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:ecjmSa7KUEndSp7N8QPXwX6BI+orL9Y04lQ7vn2ZFiY1TiXIra
 6TdaoguiMc0AxhJ03Jmbi7Sc69qADnhOBICOgqTPiftWzd2FdAQ7sSlrcKrweQfhEWs9QtqZ
 uIEJIORuEYb2IK9/oSiTPQe71LrbX3k9HLuQ6d9QYRcegAUdAH0+4NMHfiLqQAfng+OXNWLu
 v52uN34x6bPVgHZMWyAXcIG8LZocfQqZ7gaRkaQzY69Qinl1qTmf/HOind+i1bfyJEwL8k/2
 SAuRf+/L+fv/ayzQKZ/3PP7q5RhMDqxrJ4dYyxY4kuW3bRYzSTFcFcso65zXQISSaUmREXee
 z30lUd1gJImjXsly+O0ELQMkLboUcTAjfZuC+laD3Y0JTErPZQMbsauWqfGSGpsHbI9esMo5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvG7f2RYUh5bD3xnklW6vo3RiKn7wPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJg3cw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3dk7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rdR2G9D2MROAtBjWu7RjDsJCy8/BrZLQQFm+dGw=
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65096633"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iy2rKMU2fuVAAvzt7oh7wdO0ycBTI/X1gNzQL1qo6DAJsZ2Qi+4lKWyw1Ev+9nrXgTSgIu4ITWgpERn3BztTI6y81ZwGdmJxI68i+lgZJf3N1PwlmZASemfVsWcKUjBTEAroy93GwkbjSJ+nyqmNhfIgRubNEODS/La6AXtSgwtB/G9BLt/ewF/7bSCE2PrePIaqU0aQxcdCdYixKJyw/MISu2uWGzsZM8P36ns3F5I4cpi1AaRd2xSqZnxETIJWwqeaFN3cbq0Bgud83iWTGiZYAr9HOt/lQZInkyUT4UMznx/BPjDZw19tLE10fS3/83oFRZg3k1YoaAgfqp+rOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46aEkjbHFZN+nf3qZnqMYfC5PjuOEPNVjec/auPrBiY=;
 b=luV42oISNlU5EYvbPFeqCJWy0CSYBjClUapFlfz+k0AM6iVhog2lJ3Khio71hrFtW/dSp+srraSkhyNRGDBW7qp5GvDGtDd8g6A1T5db4rMETlFHNDndU4+XgapFEMnGtVzGBUYDx42K3Mg0LkgKFGGhLHjOPfd2fdXt3KKhV3G9v9n3KQBtrnGlas6B4yoWvA1XhsNhoGrzJUwO0GA1yuf/DT277rSdiBopojCvVF2x//XZh+Fozo14oDQBw/EK80LcG9JmIFKwjrzZRjaO1W+x2KSxQFN9AybZdKI92mrw2AGBEWW4S7bSFQFILgC0ysgdOZBr48uSy3mhdBmZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46aEkjbHFZN+nf3qZnqMYfC5PjuOEPNVjec/auPrBiY=;
 b=qkMUwe7qy0iDHNWkNeGf60OdFzklpK/F0T40FQ/qCnziVJCKWQbfomL5XlE2E/d8sP8CvWG7FoRNuyg4kzrHYjIJ1P33XSp3kpxdWTeNAikCZGQ2t9PM30VP0Bos3ODxUgmlr3Fc4u0GvZB+i/oJFdwsz84iHG4K/IZy2bvQpO4=
Date: Mon, 7 Mar 2022 16:05:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Message-ID: <YiYfVmW3iQ4wA5k/@Air-de-Roger>
References: <8b982bab-9b16-61e7-620f-5a5b2be39588@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b982bab-9b16-61e7-620f-5a5b2be39588@suse.com>
X-ClientProxiedBy: LO2P265CA0456.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd0d985b-10c9-4cf5-7244-08da004bfe94
X-MS-TrafficTypeDiagnostic: BN8PR03MB5042:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB5042DF5C822DB2EC9672072F8F089@BN8PR03MB5042.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4wJ920t2NCfjO2fqUrdKfItvCofGanMMCsoWrOFU6R4QrTvXJrvenm73YbIOvpVbI1Lh1Jet4ET5tyfsOWRjdDAJEL6LrqJs87UPUxuqCJXTrRMrwqIP28P/0X1GHGgMQcTksKwDpdUK7aIRRBaJwDUl1oUerzIqNzXRgaoFvdyo70WZU64YOIsN16vEZc+ChId6jTw4+qjQ93z/CaLm1O2e7B/EeSqtXQJ2E+4jmY24lR/sodq1+yyrbzTToyw2J8/0m2uNWWjRwMb5xHAJnXmF2zTOBgMW8NQ62gl7r4ZKR0B9V4m+UZsXmQhLDJce5QG5UOwebcL89lPv16cS8WaUvd+3dwCu/DTKua912hSRknuHbqZUOpA1St5MxuYGTcY6JD/kRf1Y8rEvPUz/YNBxaoXRsUFg9DMaPWmVriSVKl46ZseZURv6+7A4AMO+4zHd3HmblkOrZWtCtq7ZMnyk+7s4gpbofivrDI5WgoCCWvMJ0xx0o4UzBCVTrEBTEcRdUIb2YWKt6soR+8BKpgRns/XeFGCS719Pj4U8coIn3zGOEDZ3/mxad9OvSoxq1KV9Pb9eVT+qsoVr3qP0AMnCyAcZZqVdxqe47dMmuTT+SgtLxtWgZcC2GXc5vnct1FilNUJp9KVHlEdEXSDJ8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(6666004)(9686003)(6512007)(6486002)(508600001)(186003)(26005)(85182001)(6916009)(33716001)(54906003)(66946007)(38100700002)(8676002)(66476007)(4326008)(66556008)(316002)(82960400001)(8936002)(2906002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1RPb2JXYnJwcVhzMkIwcHNXK1ZxZ0I0UjZJOWlZNXdTWVNrcEhWMjgwR1By?=
 =?utf-8?B?MDh2dzRZRVZNK0duS0k0R2Y4MnhjSzRiZ1JQWGdoS1ZjNnZPNmZRSlpySHZO?=
 =?utf-8?B?N0VMSGRxcm5RTlhqWk5obzd5ZHh6WHN6MVc1MUVzYUhVVTNRNjZSUTZhTGtm?=
 =?utf-8?B?SGJ5NE9Ienp2aSs3U3hnblV5Qk91OUdQdnkxMWtRQnFuSDFQcHNHeVZlNG5m?=
 =?utf-8?B?eTlhZ2FoaExsakJrdEFkcGFUSkJlTy8yamM2SG8yQUlBczRRaFRZQW9ZYWlM?=
 =?utf-8?B?cXByL3oveVhzTFV4TS9CUEJ1L3V5WmMyVXlhZGRFQm9NZUl5cTd3dWNjNU9i?=
 =?utf-8?B?UEFHbDJiODRaYjMwUm9MWmY1clp4b1pqS3lOTUduRVZBVzBXVmxkVlZCRzkw?=
 =?utf-8?B?eWg0Sk9VYStLWHJnd01icGhxcWVqSFdhR2prellONHVNVVluL2Q3bVpCRUY4?=
 =?utf-8?B?SjRyL2thOG9IWndiaU1raUQyVGlubEZlSlJubUI1UWp1V1hva1U4RHBzd1NC?=
 =?utf-8?B?TjFMMTAwN0VpS0tPOWd4Z0U4ZE94QkUyQVR4cUVZeWZiODVobk1qVXpxVmJZ?=
 =?utf-8?B?L0F2L3QzRk5OOHI1SVJDQ2VZSmVmQTJXaGFUOFgycElvS25QVFcyeDA2Tjdy?=
 =?utf-8?B?WU81RTZld054cGRBN1I0djZhbzFKR2paaFIxbGtNQXM0ayswYTIrVklFT2pa?=
 =?utf-8?B?VVN4NkJZTGJYSEJST0RIblhYckNFaFNhN3lSM2RLVnVJL2w5NmttalozNVU2?=
 =?utf-8?B?WXlEMkdiYUkzU1cvaEVxcERWMnVjV1UzaE40TjZFRVNuMVlCTVlwRnpMTllH?=
 =?utf-8?B?andnWjBtTmd5OGUyUUVzcTFqL0c2d0RFNWRjd2tKTEg4Tlhma2tYZkVvNm5i?=
 =?utf-8?B?dXJlVC9BdHlSeE1ZWW5Mbi9wMm00SGc2Qjg0b0xVaVBkWFY1MTNSUEJxdnQ3?=
 =?utf-8?B?a1lBRVhmdDV6M09GUXpXUjFWcUo4MmVsZ3V5R3BPUmxzZm4waVVWNThZNThs?=
 =?utf-8?B?dElGUnlrWHJjdWFBc2Jwb2dmODR5N1l5SE1reWpzMTBkOWRNT0xKZ0Uwd21C?=
 =?utf-8?B?SUZoeXBvbGRBQ0Y5QUdzbFNQMngrQUROMDBQcnp6Wko4VzJoT2FjTDJtQVhR?=
 =?utf-8?B?dDkra3VwTUhZS2tPQ1c3U3l1UmYvOUFyc2UycGplNGQzZDFCOTkvS3dURENJ?=
 =?utf-8?B?bnlRdVQyTGxZeTIzRDBJVlRsTjJ0T202UlNZcjFaMXhHazJkVndFSFpDSlln?=
 =?utf-8?B?cGJDZ1hBUVgwV0hidEFpc0VwN3VWWXp3Q2pGc2pFdjVWR2RBYmt3a1ZtVGt4?=
 =?utf-8?B?bnMydXhVWDlIYSs3cnJJNlhxazcycm5JVS84WkQrQnJSUHkrZFFpT1hKSEU1?=
 =?utf-8?B?bUpkMXFuYjZoY3c2N2ZFMldOVTd0ZHhtbFl1WEpEYWlKRVhIU0dPNUcyL1h4?=
 =?utf-8?B?WGJoK0V6M285SHJrVTNyMk9FOTgxTExBbnJlM2FoODFHMzBVZmRvaGdta0g3?=
 =?utf-8?B?bmNzc2ZDNUROSUtCc1V4K0VmUi8yc3BWUXRldXpOZE5iOG85NjgwQ0pBV3Vx?=
 =?utf-8?B?SkFSbXI5TDNKWnA4WlpPY2tyTEdNT1NDMnRZeW9Pakk1bkZXNnNPVlRjTzE0?=
 =?utf-8?B?bnM5TmV5dno2TG1wbDBrbnpSdHgrV3M3UVN3QzUxZlhsa1NwRmJ4YzNFS3Va?=
 =?utf-8?B?QmhHODY5eWpqUnF2dUFWYWlKSGdtSU1wSnhKQVo3eU8zVlg2SSt0dDFCS0la?=
 =?utf-8?B?QU5KakFMcHVDV1gvRnk1Nk0vQUorZ0ZVMVY4UzloUTE4Q3h1S1hNQzRuUmY1?=
 =?utf-8?B?VythLzl6cURRRDhkY2NZQ2dOa09RZVdFNkN6dTFocjRkMG50QTIvREI0S0NF?=
 =?utf-8?B?UHJTK09ya3pxVmFTODNEdHdlWkpyRlo3OWhiam1PRGFSdXBhTXdsS2tWYXd1?=
 =?utf-8?B?VkQxWnYybW9WMW56OUN0UTRlYXpzazlSMUlpa3B1d3l0V0IvcXdmbC9Kd3ha?=
 =?utf-8?B?MmxPU1Q2ekpqNlY0VEVGOXppeGtXV1V3c1VZYlpVOHNqWWV6T3pXUHBhWkdE?=
 =?utf-8?B?SHRFRmFGNnRMd3FKVTc0SFpSdzhtd1p6TUtobWVzTTRvUFJMMzhlSUpiSTJv?=
 =?utf-8?B?SGU1VEVBQURKbkY5aDZsNERhMVVDR2RZKzRXMHYvNVFURjFBemozc29abzJ4?=
 =?utf-8?Q?87eWhJ5cvnAUjr2GobPrif8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0d985b-10c9-4cf5-7244-08da004bfe94
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 15:06:02.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x07M3UTQPXlIe8MhyXjjR6YVZSiO49WZn+IcOzZT15Ai7X+6vXGFBalKwElfD5zk9NlV0iRGdWuoP+LYQ6+sjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5042
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 02:49:32PM +0100, Jan Beulich wrote:
> Support for this construct was added in 2.22 only. Avoid the need to
> introduce logic to probe for linker script capabilities by (ab)using the
> probe for a command line option having appeared at about the same time.
> 
> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Obviously this doesn't take care of old LLVM ld yet, if any care is
> needed there in the first place.
> 
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -70,6 +70,11 @@ ifeq ($(CONFIG_UBSAN),y)
>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=alignment)
>  endif
>  
> +# While not much better than going by raw GNU ld version, utilize that the
> +# feature we're after has appeared in the same release as the
> +# --print-output-format command line option.
> +AFLAGS-$(call ld-option,--print-output-format) += -DHAVE_LD_SORT_BY_INIT_PRIORITY

LLVM ld doesn't have --print-output-format:

% ld --print-output-format
ld: error: unknown argument '--print-output-format'

So it would be always defaulting to SORT. I'm not sure what to
recommend.

Regards, Roger.

