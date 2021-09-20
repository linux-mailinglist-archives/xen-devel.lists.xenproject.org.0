Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726714113BA
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 13:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190810.340605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSHji-0004yh-B4; Mon, 20 Sep 2021 11:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190810.340605; Mon, 20 Sep 2021 11:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSHji-0004vZ-7C; Mon, 20 Sep 2021 11:45:26 +0000
Received: by outflank-mailman (input) for mailman id 190810;
 Mon, 20 Sep 2021 11:45:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxQs=OK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSHjg-0004vT-R6
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 11:45:24 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d3a3a48-1a08-11ec-b86f-12813bfff9fa;
 Mon, 20 Sep 2021 11:45:23 +0000 (UTC)
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
X-Inumbo-ID: 3d3a3a48-1a08-11ec-b86f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632138323;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rLs+vo2xnfIZAr9Y4eBC8TltHw05a57daAB/3pHGxF0=;
  b=SrYwDoW6qixYAY8pRtVeeFZg08xzZcFK6rQ5v9iz50nvY5y222qX+rg0
   gWyoFMrjvnRPynnJv658jXyjMVQ8EuAVFbrFV/6oYOuaI52BwnYv1BhKK
   qmSb4Jtr5BNKW41z8/xCsyAqz0tJlZRFanVa5p6RL08HttPpOICkafJZB
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RKXA7ldO6ghHwCrdyVWkDTTIfEeHloXEYiZ716xwPakUfSjpm6D6rZkVMaHOk4UyqFr00ECvw6
 5/odAfEqxQ4O8D/Vt2UVax/9WfSfXSrO0SAr333foG6V3rRhAseG9QoA0XsCZKB/+EnbfmqBLI
 X0/UNhKVMoQEN4aEiJW027xW1C+P6Yej5pYP1EogkFQJH4Tcd+gO/Yc+w5FbKFt4mQGCv9LfF3
 iyZ2k+RXQbUkAqxO/qQNtW2oR6dSl5Ieysi7iANt0mfVU1A1fxziMvUDGZ1u6+SFBMGnEOwCWX
 85HEeof0UtPpL9IcCpuMHBR9
X-SBRS: 5.1
X-MesageID: 53526107
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:s1GGAqngoz1scXHWS//olEjo5gwtIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMX22CbP3ZZGD8KtxzOo62o0wBsJbdydFkSwtrrnxkFCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Qw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OkdjIDhEVcXApXVgPoWcBMCNAFOMoQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gpr25oQRK6BD
 yYfQQh3d0reSAFCA1oOFa0ew+zx2WXkbDIN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJWG8fptjEyW13YkIhQcXlumotG0kke7HdlYL
 iQ89iMwoIAo+UesT927WAe3yFaGoxodVtx4A+A8rgaXxcL84hmbLngJSCZbb94rv9NwQiYlv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty9vprZw3jxnPZs1+C6PzhdrwcRnvx
 xiaoS54gK8c5fPnzI3iowqB2Wj14MGUEEhlvW07Q15J8CtFNLe5NtT412Tj9O5eJ6WTFH6hj
 Hctzp32AP81MX2dqMCcaLxTR+j5vKfUaGe0bU1HRMZ6pm/0k5K3VcUJumgveh0xWioRUWKxO
 CfuVRVtCIi/1ZdARZR+ZZ64Q+8uxLLpfTgOfqGJNocSCnSdmQnuwc2PWaJy9zu2+KTPuftmU
 Xt+TSpLJSxBYZmLNBLsG48gPUYDn0jSP18/oKwXKDz8i9KjiIO9E+9ZYDNikMhgtP7sTPrpH
 yZ3aJLRlkQ3vBzWSSjL648DRW3m3lBiXsueliCjTcbaelAOMDh4U5f5mOp9E6Q4z/U9vrqZp
 RmVBx4HoGcTcFWacG1mnFg4M+ixNXu+xFpmVRER0aGAgSl7Pdn3s/dBKPPav9APrYRe8BK9d
 NFcE+2oCfVTUDXXvTMbaJj2tot5cxq3wwmJOkKYjPIXJfaMniTFpY3peBXB7i4LAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIU6eTbsivIXIt0XLUmRzDWty
 AvLUwwTovPAotFp/YCR17yEtYqgD8B3AlFeQzvA9b+zOCSDpjijzIZMXfymZzfYUG+oqqyua
 f8Ml6P3MeEdnUYMuI15Su45waU77trphrlb0gU7QymbMwX1UutteyDU09NOu6tBwq5ilTG3A
 k/fqMNHPbipOd/+FAJDLgQSceneh+ofnSPf7KppLRyitjN35reOTW5bIwKI1H5GNLJwPY4on
 bUhtcoR51DtgxYmKI/b3CVd9mDKJX0cSaQ38JodBdaz2AYsz1hDZ73aCzP3v87TO4kdbBFyL
 2/GnrfGipRd2lHGIig6GnX61OZAgYgD5UJRx1gYKlXVwtfIi5fbBvGKHejbmuiN8ih67g==
IronPort-HdrOrdr: A9a23:K4edt6oQIOPRPa/RzAMgCVgaV5oweYIsimQD101hICG9E/bo8f
 xG88536faZskd1ZJhCo6HmBED/ex/hHPdOiOF7V4tKNzOW3FdAQrsMg+qDsl6QeRHDyg==
X-IronPort-AV: E=Sophos;i="5.85,308,1624334400"; 
   d="scan'208";a="53526107"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4iKRU3MIGvuFiRBUs4ifhWTcNEUlrSq7EsfBurVybEEaNp0x4NNGbS6uleKJ47Jg3P5O/OyTBzDg2iS0IFTmylV/9OP9eiEJpp8HkAPyaF4bjETgI7JFmbIDC0dNbRW1KIlD4Be5Y/0jHNbZ8q+3DWfC2k3MLkPWpk6XrlbBBT3arp9jKHJu967VzhMUS806MOLjz0O9+aeQNdJrPdc56BBAym/SCtua+HoUCOCIrwmjeJQiL8CbBMZAOwnFf8+GB6xtuG/f429Fk0h0TuGTdntf1jLfEQmxYJ5fX6HUEqr1rLrWjbGdld688lTBZdt2p8Xi2gThyrRa2Vooa6YYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5Z/zlOkhAe34r08JIFK07u2iOSIf4wkWJ5+6+6nXOdo=;
 b=QKPuA2DBGzad3yKxXLoQprPJMFBJsIuMP253D+G4Sl2cfT23MkvLw9MGGFarh6pykyLZjxasTF1pCN7ABSSwNG1kRUIZCeP+oBuvIjXvq1/2R5qBnx+8DzQ5IK/frr6G6QCPuPcLZoX9ZnoGU1LN0pwn49DBv1E4uSkp5gO/S4PqJQ0GLfa/Y4bIvN6FfgADBN0MW5bqDCicSeXjNbOafAqlyqM5+CDL4xRlKIvW8ltrZCTlkrozcsexw5+OHQ6eC9KV7v24EKGxURoB5wMmu1z/LRIctdZB7aWBItJoZeWy/useCPrqNyj6ZfKvxwKFxJAv/UrkdEJ5W107hG+thg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Z/zlOkhAe34r08JIFK07u2iOSIf4wkWJ5+6+6nXOdo=;
 b=FAVGJS2Y+SD0MrJdLNoF3T/aHCfLxd9Gjfmx2cZ5qZW17WN9QbS2Y3TkvGcOve+UkOs4XTEITzrrM4tLyid3YycjBOyJGEn89g5yU5ShiV6/MLIaAI1PIM0vIfvUei0w/rl4FAZhpYdj4FYwEreQR5ycqKmSww1HQMAny4v1Pak=
Date: Mon, 20 Sep 2021 13:45:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/6] gnttab: allow per-domain control over transitive
 grants
Message-ID: <YUh0RtozVdav0iSQ@MacBook-Air-de-Roger.local>
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-3-roger.pau@citrix.com>
 <60295250-d6b2-1a0e-be30-d83b4f3c76bc@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60295250-d6b2-1a0e-be30-d83b4f3c76bc@citrix.com>
X-ClientProxiedBy: LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0e0140a-bc03-4da5-f2bd-08d97c2c1d37
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4059382C2A86E6A889615ABE8FA09@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eA4A1UhFV7U88lEwvW2RTo457U4SzVmM0GRMFeoaBrZ72mDdjx/BSAHHdwtWvZ+XVSrpEl0toqiNioU34V7+RRbOmBXYeBGIo+fIWIE/LSc8aa0O+ZOsrrKX20yrcCKOAdSfi4BdM+rFXkRnDjfPwZaRWlT2wAiXTbDvP15jNv7AD98SwWtMmopoKnDDm5BkC36UM3LTi5vHHasGkL3/QvJX613eogqGyfuZ2gjF0NIUif61TXI3hGO8E7Kh8rV+jMt5MXx1Wr6jKhyZ4Kn4setAHq2VMSFXW4fpz3Vqdm6IxsPAkMSDZn0Vv22wcKWudopSBbTJtAc6xYIH/sWcxc7vtKbEfekZZl3NJBlsvXR285Rsm3G5P8wMK8Tms0Bta2v1/wy8Q43mkdJzjAI4XpORE6DS/XZ4gBQw0AF1xPiKtrIMzco4vBfvDzRXXMRcwnDdKGsUid170bC1KX4wjQl5euHRFOeJs+ZB0J6nBRfDuMtB8OOQ6KjPJf4j5QvE43tYHti+CpbcHjk8AhhnXl35bvlN4MSR+dLLnFSAuOilGyjrA29FaiQq1kW8gsym038Sn5v/8j6CVeoF6beJhkOUNDY1BI4nEFdlZYUB/zuN32NUjmqc9yMFNCTJBZlDgdF0+pBLIvAg2mkgktnZ/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(478600001)(6636002)(54906003)(4326008)(6862004)(2906002)(66946007)(86362001)(8676002)(85182001)(5660300002)(316002)(6496006)(66476007)(66556008)(6666004)(6486002)(956004)(53546011)(83380400001)(9686003)(26005)(186003)(38100700002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXhTVnNHclJ5b2lQT09FSXpyanF2T0FPNGxvbXBQb2JUVU1zOHoxWDF5M3Bz?=
 =?utf-8?B?eXJVYWljbGFkQUoxWE1PU1ZFeDduQWQ0Zk9NMGVJMmJ0aUJQSFlkekdvcEdn?=
 =?utf-8?B?ZEZBamNBQ3BXd2E3bHQ1SDE1WUFaUGJoc2pFVTBockY5UUZHSmpLU0lPSnlX?=
 =?utf-8?B?TEdCbDhpVzBiNTVxSzVod2swcWEwOUF1VGF4djNDYXhGNUhvZThIYlZucGhE?=
 =?utf-8?B?ZHJ3U1hON0x1MlBTbTdyNXRVa0RKdmgyaUU3eTRranplSHF0Y1dUaVoxRlpL?=
 =?utf-8?B?L25IYVo2VWlVSm5OaloydGhWYUl5ak8rS09JeUQrZGVvNjBNcXNuWmlHUmNE?=
 =?utf-8?B?NTlVTXVCMTBOSjV0U1M4VmhLVW02bEZwNXJiVjlwbXozeWtpMFlCZDd5Wi9u?=
 =?utf-8?B?YUU3TExtcHBNUDJMNEt5eG85TTFsd3pFd0VmbEFFWE1mSFlZVnNqajBCdWVs?=
 =?utf-8?B?Vi9sdUZVdW9SV0hOcXV3N1FYaVBwTjRkdHlYV3FxM3E3TlJtd0c4dlpFaCtL?=
 =?utf-8?B?Z2VZNUY4Y0dkZGFpeVM2QW9ZK2ZZMmxYYm5KUEVJSzRUZC85ZXRSYS9SWWUy?=
 =?utf-8?B?dXlEU3VxREZWTWhDYUU3TUN0b2ttSjdRaHFXQWwyY3FUSHJxaFUzK1FkOFpS?=
 =?utf-8?B?L0haSFpUQzdpQnN5Uy8zWnJpdTE5NWVTMWM4TFF4bzhNZHdMdElCcjBaOVlB?=
 =?utf-8?B?YlhGc0RBRUMyUjRaOUtQZmJFa2p2V3hudHhBM1BBNDZjZUtiS2FQb0c2eGJu?=
 =?utf-8?B?aC9QTzF5MmFKYnBOQ1pubkNVeWpFV1AwdnhGQnBHbDZITnZENEZvaElOZ25D?=
 =?utf-8?B?N2hSMTk0STZPd3FnREZKbCtkSWpINGVpaFV2clBLTFc2STJVcEJMWklWVXRu?=
 =?utf-8?B?Z3hOaGFyd2hyR01pcStWTmZoVjJxcVhTbTliME1sWTZIS0h4MDlCaEl3bzhU?=
 =?utf-8?B?d2tBL1NjODA4RTlZSEVWTzUzc2JkcFF3MTU5KzBWYm1ManR6eGc0R2kwRElD?=
 =?utf-8?B?ZFZDZmNCNXM4Wmd4ZG0xMmpwTUgxbEEweVdMcmlRTmRUMnFjOGlySnNkMldK?=
 =?utf-8?B?ajl2NDFpZFBIR3NodFZTdjNQYTBML0xDMXBubVcxVjBnSnMvN2FNS3pTMGJM?=
 =?utf-8?B?R1l4QXVGek1Ja2FaOUJLeVhzcCs5NzFtMTNRUGpDNEJFbUdJMkV2NnBRVGIz?=
 =?utf-8?B?VzI5VmJ0QUQxRm55bm04R3YzRk8wRnJvNmRKMFNtSnpYaVpEenFrRzVpa0gx?=
 =?utf-8?B?OHc0VFc3VGpDd0ZmMXhvOUt2RDVBeXFONldnbm0xek56dWM0QlpKMzBiNlZk?=
 =?utf-8?B?TlVsTmZxR0lXdTh4Ym83S25WZ004SW5ZL1g0NVlJMkdBMWlDTGt5WkJiRGo2?=
 =?utf-8?B?NHhzSXZWYkVqRXB0YkxDSjZORmJZN1dhY2pGTUswdUdMVG9tTS9xc3VFa2M3?=
 =?utf-8?B?cTdIZzJhMytyM3lSWktGdHZCY0lDMm1QeWUwTWJ6YVlFTEpRVFVlSFBiZ3JH?=
 =?utf-8?B?bW5ERlVRMCtYTzJLYkF1OCtEOThvdWdBdzEvQzhaeHF2ZmtvOS9hNHBxMHpZ?=
 =?utf-8?B?OGVla2lZcnVnOTM3d3d1MVdzVGcyQ0R2TXV5WWJBVTBrMXozaUMvQ09NTGVp?=
 =?utf-8?B?TG1RZ1JZbW11cnNqMFB3Z0pZV0N4VnJENDZqSVV6YzlYS1RKWStZdE9OS1Ey?=
 =?utf-8?B?QjZiNzBRSGY5L3FhN3VhV2xVRVNJZmhlSGlFQzJYK0F4elFBRUVUZjREcVZh?=
 =?utf-8?Q?URvk5gA7M2/Vj2qndaXT0lajJLbj4Sqm7Ev49SG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e0140a-bc03-4da5-f2bd-08d97c2c1d37
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 11:45:16.1849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TO/WjPsRkmmxt/ZeBsSc7TMvG323J4EZfZHUnLiod0DLyXHV/1BH4GgH6Ltbr6wgC1c8221jb1PldPvPuuzXNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

On Mon, Sep 20, 2021 at 10:32:24AM +0100, Andrew Cooper wrote:
> On 17/09/2021 16:46, Roger Pau Monne wrote:
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index 7f8456c50e..fe2201fca1 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -96,6 +96,14 @@ struct xen_domctl_createdomain {
> >      int32_t max_maptrack_frames;
> >      int32_t max_grant_version;
> >  
> > +/* Allow transitive grants. */
> > +#define _XEN_DOMCTL_GRANT_transitive  0
> > +#define XEN_DOMCTL_GRANT_transitive   (1U << _XEN_DOMCTL_GRANT_transitive)
> 
> There's no need for bit position variables.
> 
> > +
> > +#define XEN_DOMCTL_GRANT_MAX XEN_DOMCTL_GRANT_transitive
> > +
> > +    uint32_t grant_opts;
> 
> So far, we've got 3 bits of information, v1, v2 and transitive, and
> we're tight on space in the structure with loads more to fit in.
> 
> I was thinking grant_flags or equiv to contain these 3 settings, and any
> further which might appear.

What about using something like the below?

We also need to consider selecting the default version (whatever is
set on the hypervisor) and no grant table at all.

/* Grant version, use low 4 bits. */
#define XEN_DOMCTL_GRANT_disable         0
#define XEN_DOMCTL_GRANT_version_v1      1
#define XEN_DOMCTL_GRANT_version_v2      2
#define XEN_DOMCTL_GRANT_version_default 0xf
/* Allow transitive grants. */
#define _XEN_DOMCTL_GRANT_transitive  4
#define XEN_DOMCTL_GRANT_transitive   (1U << _XEN_DOMCTL_GRANT_transitive)

#define XEN_DOMCTLGRANT_MAX XEN_DOMCTL_GRANT_transitive

    uint32_t grant_opts;

> 
> 
> One thing which is missing however is the enumeration of which settings
> are available, and rejection of bad settings.  If v2 is disabled
> globally, trying to create a VM with v2 needs to fail.

Right, I think this is already the case with the current
implementation. This doesn't happen however with the transitive
option, as I implemented it and'ing the hypervisor selection to the
tools provided one, partially due to the lack of a 'use hypervisor
default' option.

Thanks, Roger.

