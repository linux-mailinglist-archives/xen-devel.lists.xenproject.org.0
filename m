Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 074E536D5E5
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 12:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119205.225613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbhfK-0000Ie-3r; Wed, 28 Apr 2021 10:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119205.225613; Wed, 28 Apr 2021 10:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbhfK-0000IE-0L; Wed, 28 Apr 2021 10:43:34 +0000
Received: by outflank-mailman (input) for mailman id 119205;
 Wed, 28 Apr 2021 10:43:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SCdR=JZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lbhfI-0000I8-7l
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 10:43:32 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ff66579-feeb-4488-b705-ff53d0f6cfb2;
 Wed, 28 Apr 2021 10:43:30 +0000 (UTC)
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
X-Inumbo-ID: 5ff66579-feeb-4488-b705-ff53d0f6cfb2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619606610;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UBmz4u4fOl2UUfadjVwCn/w4it6gdDIl4Rcbwj6o7QQ=;
  b=ZwNLW84Vy0LeK2BSm7lDW25PnYE6vuRVyvBCeaQRR/TuVzGzqvOUmfRA
   QWg6iBDoLRi1ewbW3maPGunDRpKYaaMxc8Y9KdilWraFe4m1JYTWApLmN
   5TjaaBo+u4IrPGEOwKEsI9O2VHnGV0jFtAu6ytqohJWukIT5okfy56CBA
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 54J8XzvzCPfO975986IYAtVV1cxuv/jQ7BySMuq5fc6daN+AXvR4ehU1/Gqv70U83/wYwY/oh4
 +naVp/A0vPQkpsiyve59l0fMbP5lg6vLY19IbrEDgCZP92m9O8YGoOYCdsaJPIPrbzGPfga97A
 mlBst6dNc/XCfD4wAz396jiDebnY13uTbgNQHr1QhKMv9FB516ZBJy1D061rWvSq9Z3q0s9oxC
 vzSXTgxDNNDobK9OAPW6mueAIAOGXMGKCFtfoCiHMDATZbI10AzE7Vy8AfcZV7kM3hXr5aUFyq
 0QM=
X-SBRS: 5.1
X-MesageID: 42710876
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cydaya98u6VeTOQdMwRuk+FLcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmzybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIULD38Zn/+
 Nbf6B6YeedMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsLV4hLxW5Ce2CmO2dxQxRLAod8OZ
 qH/8xcpyehf3N/VLXHOlAuWe/fq9rX0K/3eBJuPW9c1CCirxONrIT7HR+RwwsEX1p0oIsK3G
 DZn2XCl8Cemt6hzBu07R620713n5/bxsJHFIiwjKEuW0nRoyKJQKgkZLGYpjAyp4iUmSYXuf
 3BuQ0pMcg2y165RBDMnTLX1wPt0Ckj5hbZoDfy6xaTwr2aNUAHIvFMio5DfhzS51BIhqAG7I
 tx03+ErJ0SNBvcnU3Glqn1fit3nUm5q2dKq59rs1VjV+IlGdhshL1a1kZUHJAcJTn9+YAqHc
 J/Zfusmsp+QBe0aWvUsXJox8HpdnMvHg2eSkxHgcCN1SNK9UoJg3cw9Yg6pDMt5Zg9Q55L66
 DtNblprqhHSoszYbhmDOkMbMOrAgX2MF3xGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUXtD3FRCO37GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7CLTCDclYziMGtys9vQ/Hzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk7odA+d1WSot/aC4Hju+DBGcyjZobFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfMdyXEjNdNOZmf29JW5JkGN4VKvARQo0++/Nu3JTpLtbFzWE
 N/Jbjgg56qvGXexxeN00xZfj5mSmpF6rTpVH1H4SUQNVnvTLoFs9KDPUdfwWWAPR06a8/NCg
 ZQqxBW9MuMXtKt7BFnL+jiHnORjnMVqn7PZYwbgLe/6cDsfY59KI0nVqx3HQDiDAd0hg5ulW
 dGZGY/NwziPwKrrZ/goI0fBenZedU5qhysO9RopXXWsljZmdsiXUIBXzmlUdeehCEnQzY8vC
 w3z4YvxJ673Rq/I2o2h+o1dHlBcn6eDr59AAOZX4lMgbzwdAZsTWCFuCyCh3gICxnX3nRXol
 akATyfePnNDFYYgHxe36rw2H5fd2mWfStLGztHmLw4MV6Dlmd40OeNaKb27nCYbUEaxPoBdB
 vfZyEJHw9oz9er9RKclTqYD086zpE2MuG1NsVkT5jjnleWbKGYn6APGPFZuKt/PNf1q+kRTK
 axfRSWID6QMZJe5yWl4lIefA96p3kvnam2hFnL7G2k0GU+BvSXClJ8XL0fK8yd6W+hZ/vg6u
 QMsfsF+c+LdkP2YZq67IuSSRhpABbau3S3QOElsoo8h9N7iJJDW73gFQLV33RG1igkJMj6lE
 kiUL12iYqxT7NHTog3QWZl5VInm9SEEVszviH3CuE4e0sxj3WzBaL/35P47Z4uCFaGvg3+JB
 229DBc5e7MW0K4pPQnIpN1BWRdc04n7nt+uMuEao3LEQ2vM8VO5kCzPHP4ULhTTsG+aPgthy
 c/x9GDhOmMcSXknCjWoDtgO6pLt1+dfvnaOnPEJcd4t/qgOVqNhaO24Mm8yBfPIAHLFHgwtM
 libkwfbsNKlz84qpY4uxLCE5DKng==
X-IronPort-AV: E=Sophos;i="5.82,258,1613451600"; 
   d="scan'208";a="42710876"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyeEydjzsMBD7cVFLGHXwvjKmCEbb5jvqjpWYBJQ1mUANH+Wk7+WwFb6lQrvrS3sYJ1ANtVkCc4Pzcn0fOBZzRAtU6YnAwALr3tL4P9rn7xo7eKA/qUAyZiIPLAaqbw3V5LRrN1bqdhOwp2I7INdV1kpwjupoK+c9FwhEAQqJ5BqPnbWHAar3pxi2FUuRQ9nBzUJwS96T1x5012EePGnMclytmVym/bKDwcBQRLtzZtr6ON8Duu8U+vuzfcld2/0qWFX6ISn8PcRugNx2ZFlZhDxiqzModrExiGxfT1Cu6luk3QEXUfWG8ULOGyO67pClIuNkC0EYnoNUIlULk1P0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9ROJ9R4WO/Bh42xfzQP22PffVLgW5SbjUWF/ZSO8JE=;
 b=Wp+ux6z/Lfy0BzwtrJZEihp4PvL6FZtwNP2gcECbvGxlzoDRUSvnReCJbUonbMm94iG2aRj5bBgRhHbJEnP7ZCsR17N+xYMFu2FycqdHgQEdF3UAT6BpaBJiHtskDv+2DTLnXcKC4CHp9ykDkpioOhOXcvyDfjTo3+yD2iIFBsCcTh62l5XpI2MglDngdbHbV/CnK8ho30ghwdT8LJjljlzIUXS0V+0rOrGyJRGFXcdFO/ctgQdXLQcZAk4r71u7D/cpLQ5m+eZiVodkTQskkoccTZNZUrkYbWxd2bCnf6KbJRWGzzspwt+6sPevejKcf2NRSEAheuiRkrOS6QHwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9ROJ9R4WO/Bh42xfzQP22PffVLgW5SbjUWF/ZSO8JE=;
 b=oNiYjrAMVxCBhPkkJvQNbGpG2ryhR4wY9+8WIUX1vfslRbO5gAYZqQS3ZijScScpkjoykLqDT0r2JgWWp5CZqEzGkGwuxzfWoaus9hME/fMzVIdbYdvOy8Ga77kA2BPrD1xIn0Tp9iKktdk1zVYF8JYj35XhC53Ef+WquvvLtRA=
Date: Wed, 28 Apr 2021 12:42:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v3 2/3] xen/pci: Refactor PCI MSI intercept related code
Message-ID: <YIk8MYCeKi0eKkrg@Air-de-Roger>
References: <cover.1619453100.git.rahul.singh@arm.com>
 <480947d549c46270fccc4c6d83ae8beca3c0fce6.1619453100.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <480947d549c46270fccc4c6d83ae8beca3c0fce6.1619453100.git.rahul.singh@arm.com>
X-ClientProxiedBy: MR2P264CA0139.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0af2960a-e1f8-4bae-241d-08d90a326693
X-MS-TrafficTypeDiagnostic: DM6PR03MB4217:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42179FD3E5EA14D5F832CCF38F409@DM6PR03MB4217.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PdC4lHE77vBjJezpeI7TmavTed4OB09Bm33Z6nKEe4GW/i37GvggnIoiZ/RcMoYnhnMKBtYOaxmDPCn4VFY754k5ZPfODTbWcN/c00aMSssQ/HQzpjoC8ol9nG+84emOr1ofpSfFcldOQ+voUriDCngvG21eRKO9WweolBFYammMAcNb/9m+VkedSEUcAKVRsHK+5nc2Vu7S+v2pmPM3T47c+SmYs673dmBnTXEZ+lOdaQOT8FGMGtMXT2qoHjYY0aYGBGWWB67WlWFZNubYJCzriyuPwEy11on0QaPbwKFWFM6hBYysp0WcH/cJZ3w1Xx6JL7R+/O5+FPpmuTl5DYdC8ZdwMI/8QKC/v+133zc01+ajte0Ij8LwmxuR030c9N27ftF22hUsuilk36UXQ2bxn4BTIlrW0Ih11Krd2KI4S1TPVuoZklWzHzAt3/TuECwBxO0B0YDQVsLB0bWX96XY+e0gs65bo6qBsrg8o2zhPlSnt7oeLl3Z3habU8dL2fA+ps6u9PePRzh5LH7aFxmENKZqSfs+IvDHTPFqVhH+2crGndkg4EdqVB2rujyD9/i+g0GA/5lI8Bv9RYHuA2YHYW6Irzyz55m5ws/ko/Dm1imkJ5KBdTar6OuiOYIVEB4nxr+xWNNPsDug9lPYW6j0qo/bO4ygTfExrVWnomc9OCkH8dVtj7/Me4PyiRnS6cAnZZAtl1++2mectQAkRN25ZBNrQzqtf4WHqu14iJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(6496006)(6916009)(86362001)(316002)(2906002)(6486002)(33716001)(66946007)(85182001)(9686003)(7416002)(8936002)(66556008)(66476007)(8676002)(5660300002)(6666004)(26005)(16526019)(478600001)(83380400001)(4326008)(38100700002)(186003)(956004)(54906003)(30864003)(2004002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ME5pSmJ2ODgyd1hkc0ZUWDlnRzhxZW8zWWR4RDhxMzZvTGJVY1JVL2tIOW80?=
 =?utf-8?B?OXdvUW0vMXFIRE9lTWVRbEpqS0hQRWNGUVg5eHo4ZWRrOGhkNVE4YVcvK2tT?=
 =?utf-8?B?WThJS3FPQng1dnJ2cXE2R3dRaFBiZjdNVEJ6eXNybXRMNGhtSFdWZlBKV3pH?=
 =?utf-8?B?aUZOQ08wREFNQU5mbVZoMmhTUmVNYWwzM0VKaEJWRFRES2NVWHJIWGwrZkI0?=
 =?utf-8?B?T2J4d0lGcTIyWTZBTGxjMG1HTHlMTWR4RnU3VjkxVkNOQzZOYkZ3ZzJMS0dv?=
 =?utf-8?B?MjJlRmZMZ3NWNUsvdzRsSGhPMVJubzVlMDFIdTNaQ0tYRkxTallUcHc4UUdG?=
 =?utf-8?B?NFdndjVSbCtKL3BvSjBQNnhJdVV3VVdtUkQzdWUwRzFWU09jWUUwdk1ISkU1?=
 =?utf-8?B?Z3Z5ckNUTXl4eENTWkdYS2VOMHVndUlHdGNJdGl0RmczMEhRalpEZklSc01L?=
 =?utf-8?B?ZW4zWENkVndLZk1kYWNDckkzenphTEFnRU9tR0RONGljT0p0TDF3QzNheXBI?=
 =?utf-8?B?OStXQTc0cTR2Q3RMR3ZKUXR6M3RPNnZKanlMV0lzVFd1NjUyNXRyK1BZbURF?=
 =?utf-8?B?OXR1dFBFV09vUlBLNzZ6VzF4M0JSZlFjYkJ2c0xRUDh1ZGExeTAxV2VxNUlt?=
 =?utf-8?B?eXdkRm4yVkNtemZlQnVpOFdnV1VUcVNBMWxzU3V3TUhaK0hJTThKSmR4YmRt?=
 =?utf-8?B?YnJHUjVGMUJ0ejNOeE9tb0EvU0tZTzRubmFRYll1cFc5TXBVd09kbHZvdzVR?=
 =?utf-8?B?emsvZWx4a05WWTFMZDJZMmFmN2tNRmpIWldhWmVWTzlCVHFPb3lhenlUM0hp?=
 =?utf-8?B?eHFVblY0OEs0ODhMcE44RU9uSzkxMmR4TXVGbHg1dEFMSytHNnVOTzJ4Nmdr?=
 =?utf-8?B?TXBsSlZGbWhoV0NXdTZMU2JWVmliUldHNFhUdVhWZGs5a1pJZU9DTkl4Wnlx?=
 =?utf-8?B?OUZxZXkyajNEc29wK3VQZnhFdS94bDhiSUdoS1NvT1FWa3ZIWHBsdUwrM0hj?=
 =?utf-8?B?clNQeHlac0RVa2wzVjZQcnFYbkJHYWltMzlVTkxaYTFTR3dCd1dIVTBPUkFS?=
 =?utf-8?B?bWh3c2tzYjNCZU9RNWVmMzJNQzIwSWFuN3hkZmFxTTY4NGh5R3MvMGRaZjF0?=
 =?utf-8?B?enMyS1RmQjR5MTJDZWxsYk92a05YNm44eURzSHVMK0J2RXNRWS9IVmd5UE1p?=
 =?utf-8?B?a01sZ3Z4UW41a3ljUFh6am1QRWxNTFpYVFJoNitoMThLM0FxNUx4V2h2ZHdH?=
 =?utf-8?B?MHMzTStMVEdVTkpydWR2TThWSE15em8xZVBwNm11VzFZc0g2VUY4QjEzbnlR?=
 =?utf-8?B?TEhBTFd2OXp2bVdYRzRYWXFPeWhsRUJFdmQzQ1ROWG1TM1ZLNEZrZGtOcmlW?=
 =?utf-8?B?dmVtWWFqUVhPcTl3T2dPcmpMbVdFZW45U2tSdnltNGJ4WjZMNXdESWxVdkxi?=
 =?utf-8?B?blArWWVIQnZxNlcxU1hqeWRjVUlSNzlyS2tzekVhRlRkOGhCc0ZEbVFNKzRi?=
 =?utf-8?B?T1IxQ2dJRGJaaFJ4SDJEN0hBbmY0OGx2NEVBbGRYeEZjN3pjZWVJdGVXejVU?=
 =?utf-8?B?SDU1ZVFmek0yTDE1dkN2d1NSWFAzbittekhGRjc1dElTTXQvTktRaEUwYWRQ?=
 =?utf-8?B?c2RQZHNoN2REeDlwdGlsN1A0MlhxODE0Z0pLOFFJZzF1NDhOVFlRenpnaGE5?=
 =?utf-8?B?VVBFUnFxc0FZbndBRjJ6dmRXdm16MWZDNldieno0MVdMcU5TNk9JSGd6TDJF?=
 =?utf-8?Q?QhgE0lswzXp/CE2ZbN/fizYVhdKP4ib53+/gB4C?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af2960a-e1f8-4bae-241d-08d90a326693
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 10:43:03.6760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23kaQFb3IqLSGdgsetjVJHYpC7pfywBueVkI+hkrucdSCLBmnk2BPJ33+tmgALjbAblNWls7uzxNwbh2Hg4Z8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4217
X-OriginatorOrg: citrix.com

On Mon, Apr 26, 2021 at 05:21:26PM +0100, Rahul Singh wrote:
> MSI intercept related code is not useful for ARM when MSI interrupts are
> injected via GICv3 ITS.
> 
> Therefore introducing the new flag CONFIG_PCI_MSI_INTERCEPT to gate the
> MSI code for ARM in common code and also implemented the stub version
> for the unused code for ARM to avoid compilation error when HAS_PCI
> is enabled for ARM.
> 
> No functional change intended.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes since v1:
>  - Rename CONFIG_HAS_PCI_MSI to CONFIG_PCI_MSI_INTERCEPT
>  - Implement stub version of the unused function for ARM.
>  - Move unneeded function to x86 file.
> 
> Changes since v2:
>  - Rename function name as per the comments.
>  - Created a separate non-arch specific file msi-intercept.c.
> ---
>  xen/arch/x86/Kconfig                    |  1 +
>  xen/drivers/passthrough/Makefile        |  1 +
>  xen/drivers/passthrough/msi-intercept.c | 52 +++++++++++++++++++++++++
>  xen/drivers/passthrough/pci.c           | 16 +++-----
>  xen/drivers/pci/Kconfig                 |  4 ++
>  xen/drivers/vpci/Makefile               |  3 +-
>  xen/drivers/vpci/header.c               | 19 ++-------
>  xen/drivers/vpci/msix.c                 | 25 ++++++++++++
>  xen/drivers/vpci/vpci.c                 |  3 +-
>  xen/include/xen/msi-intercept.h         | 48 +++++++++++++++++++++++
>  xen/include/xen/vpci.h                  | 23 +++++++++++
>  xen/xsm/flask/hooks.c                   |  8 ++--
>  12 files changed, 170 insertions(+), 33 deletions(-)
>  create mode 100644 xen/drivers/passthrough/msi-intercept.c
>  create mode 100644 xen/include/xen/msi-intercept.h
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 32b9f23a20..4d72798f00 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -20,6 +20,7 @@ config X86
>  	select HAS_NS16550
>  	select HAS_PASSTHROUGH
>  	select HAS_PCI
> +	select PCI_MSI_INTERCEPT
>  	select HAS_PDX
>  	select HAS_SCHED_GRANULARITY
>  	select HAS_UBSAN

This list is sorted alphabetically AFAICT, and new additions should
respect that.

> diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
> index 445690e3e5..3c707706b0 100644
> --- a/xen/drivers/passthrough/Makefile
> +++ b/xen/drivers/passthrough/Makefile
> @@ -7,3 +7,4 @@ obj-y += iommu.o
>  obj-$(CONFIG_HAS_PCI) += pci.o
>  obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
>  obj-$(CONFIG_HAS_PCI) += ats.o
> +obj-$(CONFIG_PCI_MSI_INTERCEPT) += msi-intercept.o
> diff --git a/xen/drivers/passthrough/msi-intercept.c b/xen/drivers/passthrough/msi-intercept.c
> new file mode 100644
> index 0000000000..1edae6d4e8
> --- /dev/null
> +++ b/xen/drivers/passthrough/msi-intercept.c
> @@ -0,0 +1,52 @@
> +/*
> + * Copyright (C) 2021 Arm Ltd.

Since this is code movement, I think it should keep the copyright of
the file they are moved from.

> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/init.h>
> +#include <xen/pci.h>
> +#include <asm/msi.h>
> +#include <asm/hvm/io.h>
> +
> +int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    if ( pdev->msix )
> +    {
> +        rc = pci_reset_msix_state(pdev);
> +        if ( rc )
> +            return rc;
> +        msixtbl_init(d);
> +    }
> +
> +    return 0;
> +}
> +
> +void pdev_dump_msi(const struct pci_dev *pdev)
> +{
> +    const struct msi_desc *msi;
> +
> +    list_for_each_entry ( msi, &pdev->msi_list, list )
> +        printk("%d ", msi->irq);
> +}
> +/*

Missing newline.

> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 199ce08612..298be21b5b 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -32,8 +32,8 @@
>  #include <xen/softirq.h>
>  #include <xen/tasklet.h>
>  #include <xen/vpci.h>
> +#include <xen/msi-intercept.h>
>  #include <xsm/xsm.h>
> -#include <asm/msi.h>
>  #include "ats.h"
>  
>  struct pci_seg {
> @@ -1271,7 +1271,6 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
>  static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
>  {
>      struct pci_dev *pdev;
> -    struct msi_desc *msi;
>  
>      printk("==== segment %04x ====\n", pseg->nr);
>  
> @@ -1280,8 +1279,7 @@ static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
>          printk("%pp - %pd - node %-3d - MSIs < ",
>                 &pdev->sbdf, pdev->domain,
>                 (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
> -        list_for_each_entry ( msi, &pdev->msi_list, list )
> -               printk("%d ", msi->irq);
> +        pdev_dump_msi(pdev);
>          printk(">\n");

Maybe the whole '- MSIs < ... >' should be removed, instead of
printing an empty list of MSIs when MSI interception is not supported?

Or else you give the impression that no MSIs are in use, when instead
Xen is not tracking them.

>      }
>  
> @@ -1422,13 +1420,9 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      ASSERT(pdev && (pdev->domain == hardware_domain ||
>                      pdev->domain == dom_io));
>  
> -    if ( pdev->msix )
> -    {
> -        rc = pci_reset_msix_state(pdev);
> -        if ( rc )
> -            goto done;
> -        msixtbl_init(d);
> -    }
> +    rc = pdev_msix_assign(d, pdev);
> +    if ( rc )
> +        goto done;
>  
>      pdev->fault.count = 0;
>  
> diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
> index 7da03fa13b..e6bf0b7441 100644
> --- a/xen/drivers/pci/Kconfig
> +++ b/xen/drivers/pci/Kconfig
> @@ -1,3 +1,7 @@
>  
>  config HAS_PCI
>  	bool
> +
> +config PCI_MSI_INTERCEPT
> +	bool
> +	depends on HAS_PCI
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 55d1bdfda0..f91fa71a40 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1 +1,2 @@
> -obj-y += vpci.o header.o msi.o msix.o
> +obj-y += vpci.o header.o
> +obj-$(CONFIG_PCI_MSI_INTERCEPT) += msi.o msix.o
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index ba9a036202..ec735c5b4b 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -206,7 +206,6 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
> -    const struct vpci_msix *msix = pdev->vpci->msix;
>      unsigned int i;
>      int rc;
>  
> @@ -244,21 +243,11 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>      }
>  
>      /* Remove any MSIX regions if present. */
> -    for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
> +    rc = vpci_remove_msix_regions(pdev, mem);
> +    if ( rc )
>      {
> -        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> -        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> -                                     vmsix_table_size(pdev->vpci, i) - 1);
> -
> -        rc = rangeset_remove_range(mem, start, end);
> -        if ( rc )
> -        {
> -            printk(XENLOG_G_WARNING
> -                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
> -                   start, end, rc);
> -            rangeset_destroy(mem);
> -            return rc;
> -        }
> +        rangeset_destroy(mem);
> +        return rc;
>      }
>  
>      /*
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 846f1b8d70..3efbaebc92 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -428,6 +428,31 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>      return 0;
>  }
>  
> +int vpci_remove_msix_regions(const struct pci_dev *pdev, struct rangeset *mem)

You could pass struct vpci here, since there's no need to pass the
pdev, but I don't really have a strong opinion.

> +{
> +    const struct vpci_msix *msix = pdev->vpci->msix;
> +    unsigned int i;
> +    int rc;

Nit: you can define rc inside the loop, like it's done for start and
end.

> +
> +    for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
> +    {
> +        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> +        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> +                vmsix_table_size(pdev->vpci, i) - 1);

You can now also move vmsix_table_{base,addr,size} to be local static
inlines to msix.c instead of being defined in the header AFAICT.

> +
> +        rc = rangeset_remove_range(mem, start, end);
> +        if ( rc )
> +        {
> +            printk(XENLOG_G_WARNING
> +                    "Failed to remove MSIX table [%lx, %lx]: %d\n",
> +                    start, end, rc);
> +            return rc;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static int init_msix(struct pci_dev *pdev)
>  {
>      struct domain *d = pdev->domain;
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index cbd1bac7fc..85084dd924 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -48,8 +48,7 @@ void vpci_remove_device(struct pci_dev *pdev)
>          xfree(r);
>      }
>      spin_unlock(&pdev->vpci->lock);
> -    xfree(pdev->vpci->msix);
> -    xfree(pdev->vpci->msi);
> +    vpci_msi_free(pdev->vpci);
>      xfree(pdev->vpci);
>      pdev->vpci = NULL;
>  }
> diff --git a/xen/include/xen/msi-intercept.h b/xen/include/xen/msi-intercept.h
> new file mode 100644
> index 0000000000..77c105e286
> --- /dev/null
> +++ b/xen/include/xen/msi-intercept.h
> @@ -0,0 +1,48 @@
> +/*
> + * Copyright (C) 2021 Arm Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __XEN_MSI_INTERCEPT_H_
> +#define __XEN_MSI_INTERCEPT_H_
> +
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
> +
> +#include <asm/msi.h>
> +
> +int pdev_msix_assign(struct domain *d, struct pci_dev *pdev);
> +void pdev_dump_msi(const struct pci_dev *pdev);
> +
> +#else /* !CONFIG_PCI_MSI_INTERCEPT */
> +
> +static inline int pdev_msix_assign(struct domain *d, struct pci_dev *pdev)
> +{
> +    return 0;
> +}
> +
> +static inline void pdev_dump_msi(const struct pci_dev *pdev) {}
> +static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
> +
> +#endif /* CONFIG_PCI_MSI_INTERCEPT */
> +
> +#endif /* __XEN_MSI_INTERCEPT_H */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 9f5b5d52e1..2cd3647305 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -91,6 +91,7 @@ struct vpci {
>          /* FIXME: currently there's no support for SR-IOV. */
>      } header;
>  
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>      /* MSI data. */
>      struct vpci_msi {
>        /* Address. */
> @@ -136,6 +137,7 @@ struct vpci {
>              struct vpci_arch_msix_entry arch;
>          } entries[];
>      } *msix;
> +#endif /* CONFIG_PCI_MSI_INTERCEPT */
>  #endif
>  };
>  
> @@ -148,6 +150,7 @@ struct vpci_vcpu {
>  };
>  
>  #ifdef __XEN__
> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>  void vpci_dump_msi(void);
>  
>  /* Make sure there's a hole in the p2m for the MSIX mmio areas. */
> @@ -174,6 +177,7 @@ int __must_check vpci_msix_arch_disable_entry(struct vpci_msix_entry *entry,
>                                                const struct pci_dev *pdev);
>  void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry);
>  int vpci_msix_arch_print(const struct vpci_msix *msix);
> +int vpci_remove_msix_regions(const struct pci_dev *pdev, struct rangeset *mem);
>  
>  /*
>   * Helper functions to fetch MSIX related data. They are used by both the
> @@ -208,6 +212,25 @@ static inline unsigned int vmsix_entry_nr(const struct vpci_msix *msix,
>  {
>      return entry - msix->entries;
>  }
> +
> +static inline void vpci_msi_free(struct vpci *vpci)
> +{
> +    XFREE(vpci->msix);
> +    XFREE(vpci->msi);
> +}
> +#else /* !CONFIG_PCI_MSI_INTERCEPT */
> +static inline int vpci_make_msix_hole(const struct pci_dev *pdev)
> +{
> +    return 0;
> +}
> +
> +static inline int vpci_remove_msix_regions(const struct pci_dev *pdev,
> +                                      struct rangeset *mem)

Nit: line seems to not be properly aligned.

Thanks, Roger.

