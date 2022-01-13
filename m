Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE9648D6BD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 12:36:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257104.441637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yOd-0007Qz-J8; Thu, 13 Jan 2022 11:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257104.441637; Thu, 13 Jan 2022 11:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7yOd-0007Ne-DJ; Thu, 13 Jan 2022 11:35:59 +0000
Received: by outflank-mailman (input) for mailman id 257104;
 Thu, 13 Jan 2022 11:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=64pG=R5=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n7yOa-0007NK-Vb
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 11:35:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6c1a9f8-7464-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 12:35:54 +0100 (CET)
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
X-Inumbo-ID: f6c1a9f8-7464-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642073754;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=lMzAsvI6SgmBvQiHzqtwiyAJsvU8BY8M3uvCQgWQzcE=;
  b=X5OG8PRA1E7e4nz0IBSwN52iLjtMOSFZOq8EO6xxxZPBsq+6Fq5YPAb4
   04chIiIXPVji0FDA0MQG+CYCoIkfQDSFTezlu8ohWxQx0maOZv22sxWiF
   gi/sQo8qfYT+Lmrt57VVzhun0Bw473D8MdBXNUqt6zQZZZbZ6uMHsMgug
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Hq+BAdRuB6fkMmxGZGnQU0JzUEACrv04UeANnMCNeGB2MYALu+mZ/DzRYMXdHA77dGCJHWuN2d
 keng7Bd14bC00c30epL6UXLrhWCBw2IsVMT3fbvX8gKUO1mGm17K9wspq2a7a1hSL+DZkEtbsL
 XxwTd5nSZ4mhMQKq0DvX5EIWx+5Q+cNSCUQ1p8B1MOcB7X5z+Aot40ZMnmFH+15cM4LQKcbvtK
 WVLnf6lOqnPKM3lznYBwrg9LUkSN3PB6o27CkY/g9QtRcGU7rmFETr3ErCeqS4tASTNpPeX/YB
 66p3HiOaqk/oF9/qkWwtliBu
X-SBRS: 5.2
X-MesageID: 62315187
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Unz7I6wIwmyPuj0+Wa96t+f3wCrEfRIJ4+MujC+fZmUNrF6WrkUFy
 GBJD2+PPfqJN2D1c9h+bo6//RgAuZ7Xy9NhHlRk+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrdi2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9Zo8
 M4Oh7utdRYkJKjziuUAcklgCAgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVort4kI8TxepsWp1lrzC3DDOZgSpfGK0nPzYECh25t35ARdRrYT
 9oSZSBCMhSaWT9wNW9KGJ1nht6mq1CqJlW0r3rK/PFqsgA/1jdZyLHwNPLFd9rMQt9a9m6ar
 G/b+2XyAjkBKceSjzGC9xqEr/XTkCbMfZMdHby16NZnmFSWgGcUDXU+Ul+2ouKwjEKkbNtZJ
 1YJ4SolraU090uDQ8H0Wluzp3vslgQVW8dUVfY77g6N4qPO5kCSAW1sZjRMcsA8vck6Azkjz
 EaUnsjBDCZq9raSTBq19KqQrD60ETgYKykFfyBsZRsI5ZzvrZ8+ijrLT81/C+ilg9vtAzbyz
 juW6i8kiN07hMgHzf/jpQjvjDelp5yPRQkwji3JWWai4hJ8dZSSbYWi4ljG7t5NNI+cCFKGu
 RAsnMyT7/sHC52XozCcW+UGHLyv5PGtPSXVhBhkGJxJ3y+253epcIRU4Td/DERkKMAJfXnue
 kC7hO9KzMYNZj3wN/YxOt/vTZRxpUT9KTj7fvbNVsENUL9sSB6K5iRRd0+N/jDVi2F5xMnTJ
 qynWcqrCH8bD4Fuwzy3W/oR3NcX+8wu+Y/Abcullkr6iNJycFbQEO5YawXWMojV+YvZ+F29z
 jpJCyedJ/yzusXaazKfz4McJEtiwZMTVcGv8Jw/mgJuz2Nb9IAd5x35neJJl29Nxf09egL0E
 peVAB8wJL3X3yyvFOlyQio/AI4DpL4mxZ7BAQQiPEyzx18oapu14aEUevMfJOd7rrQ6lqYqE
 6leIa1s58ijrBydq1zxirGn/eRfmOmD31rSb0JJnhBiF3Kfe+A50oC9JVa+nMX/JiG2qdE/s
 9WdOvDzGvI+q/BZJJ+OMpqHlgrp1VBEwb4adxaWfrF7JRu9mKA3e32ZpqJmeKkkdEScrgZ2I
 i7LW3/0U8GX/d9smDQI7IjZx7qU/xxWRRsFTzKFvOfvZUE3PAOLmOd9bQpBRhiEPEvc86S+f
 +RFifb6NfwMhlFRtIRgVb1syMoDCxHH+Ne2FyxoQyfGaUqFELRlLiXU1MVDrPQVlLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRkANRe7lyEAfqB+N5kow
 Ll9tZdOuRC/kBcjLv2PkjtQqzaXNnUFXqh+7sMaDYbnhxAF0FZHZZCAWCb67IvWM4dHM1UwI
 y/Sj63H3uwOyk3Hens1NH7MwesC2she5EEUlAcPfg3blMDEi/k72Axq3Q42FgkFnA9a1+9TO
 3RwMxEnL6u54Do11tNIWHqhGl8dCUTBqFDx0VYAiEbQU1KsCj7WNGQ4NOuAoBIZ/mZbcmQJ9
 b2U0j+4AzPjfcW31SouQ0917ffkSIUppAHFncmmGeWDHoU7PmW50vP/OzJQpku1G941iW3Gu
 fJurbR5ZqDMPCINp7E2VtuB3rMKRRHYfGFPTJmNJk/S8b0wrN1q5QWzFg==
IronPort-HdrOrdr: A9a23:8cAeva+BZeWzkYfHIbduk+E8db1zdoMgy1knxilNoENuHPBwxv
 rAoB1E73PJYVYqOE3Jmbi7Sc+9qFfnhONICOgqTM2ftWzd2VdAQ7sSiLcKrweQfxEWs9QtqZ
 uIEJIOeeEYb2IK9foSiTPQe71LrajlgcKVbKXlvgxQpGlRGt9dBmxCe3+m+yNNNW577c1TLu
 vi2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoXse2OEDIvAGyWuKEk4U0i93qIfpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.88,284,1635220800"; 
   d="scan'208";a="62315187"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTGzW8+IRhA7Xa1sTA0hqkNiJTJjvFSnLArWuf4gxngcOKM+BNJi9JUvtiEgpNwfHLQNnYqq+x5F7f16RfRuM9aMZVIovpl9cD1u1cWGUkp8EBv1huy6lvqHOvU5mtgGb7mo3G3OYCIEW/o6rNsquwSGGA65t8J6cRHi08GUrj0o9fHXqR2W7175X3MK2J22UMEGybQBjwtWpPgEBu4DMQaaDLi320XvgzWg59Ba1FL32n7dk6aEs4pp7nppToafeoaLZHTytl2M9qAhi9v7TZ76nL/X6KMrINRs3f+udg9QZyY133hV/2iRUOiwRT03ay7cyrpXgVmfeJHRqPZl4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KMvU8XdiVKuVXBKPWPYetNs0Q+6GRrLYoAXAy5/bqA=;
 b=OMvCEI2PltDVyvtcKYFz/siwjPLneuQyN6o9v10BSPSqLy+p/r0OOUyK7qmEZ6sUBFEocfy5OwbIxQoxC8t0kB5xArcgfcV18hE+Qf3Fmfv5RDC+kdUnJuvD04ieVHnVm53LYNyxKhcbOwoEjTLUwmMf+9obetLxqtntXxpIhzNudTIRy+folveRXnkIkZTQuEBRNWjv22fIt+ulavfEf/kRsGZYfy9nlndJliVyfGktXiBpn5AuILX+MRct5eQ87nApSK0fYOmBCRAgfGsPSanKIMP7yamdPO4aKlpiE6hRz+h+8ML1SX3uyFkYfupR7t7ccAUxWd+vKFgFWfMUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KMvU8XdiVKuVXBKPWPYetNs0Q+6GRrLYoAXAy5/bqA=;
 b=th8BZa7Sb86ovoZbYrqlvhhKtNWRpzAGMDjwFf3KThIVdl7eKM1LjWiyhQ/0pbfNvzMFMfs+AfO4DlBIUfPYZliSGzBtEdP9JAJr0R48cN35GsjbtFMwpmkTIZMbSVk/jgtShtLAF/hsMMQVAIoEA21FdLamy7S9ETqDZiyRjmQ=
Date: Thu, 13 Jan 2022 12:35:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <julien@xen.org>,
	<sstabellini@kernel.org>, <oleksandr_tyshchenko@epam.com>,
	<volodymyr_babchuk@epam.com>, <Artem_Mygaiev@epam.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <paul@xen.org>,
	<bertrand.marquis@arm.com>, <rahul.singh@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v5 11/14] vpci: add initial support for virtual PCI bus
 topology
Message-ID: <YeAOhksC1rRuYl4x@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-12-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211125110251.2877218-12-andr2000@gmail.com>
X-ClientProxiedBy: MR2P264CA0148.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6623a1ee-ccee-43bf-d1ec-08d9d688d33c
X-MS-TrafficTypeDiagnostic: SN6PR03MB3997:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB399784CF008A5912BEF181808F539@SN6PR03MB3997.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G8C1pa9JwC4TmpiqhGXYAgeQXP0n44s2VaSfk3PuQEpI0cKsqjtZQxwhAY31ip1j6yjyhBbJ4vCwWM7aSLMrcun7OKBvyjlm8yUISobuuZ5glRvkYruM7VUPGWEDoHgayCDW0CaKKd7eop5weI5NUqzWMr7QCJDo8bszYwW0XtFzigDE4mxhdiQ9mq39LagmNHMMc0XqyFqCMdLdbIKOo0QfgJrduL+RAgOZDqiXDhSybx05lkKe8SN+OrNkUbc0ygcUnU5mhSqUIC8/A9pXbnMbN9yk5krTYMxouSYqr6Z41xn8/DIp2s9UEJDOQYlTOjnydZBOJwQHB7vA78q8ZNiCJvZE0g1M6oTeNS3bXPNp48qqUXVsMrDmiJzL9GXHY6zO6r8rVbt+hXoozHbfvjuyvKwLmn7kG7QpmUO73FlvvdGbdeERRrVaJvynOOf/bxAISHJTdOF2ZA+PSoWUMHBxDYhK2wMlKWhaHUQHyxSHAG6NHC1+Qg39CVX7AYUr2hxGnGgmfSu9Gaw0ZKpKZptYUy1DIAJ7yCklmERD1j8am4eQmfeUFim6BbkNZIym1im7pqPkBxtkCg0hPxu6q3T6yNKwqyFJwDq5Lg3zy6RQ9l+MEFWfjacNsEEQ8zSW4ue1VQfwaSrKgE7bXY+y+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66476007)(66556008)(186003)(2906002)(26005)(6506007)(38100700002)(6916009)(316002)(83380400001)(7416002)(6666004)(6512007)(85182001)(33716001)(8936002)(86362001)(4326008)(6486002)(5660300002)(508600001)(9686003)(8676002)(82960400001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzU2Wng5WXptWW40dE5PS2laSktCS0lQRTAvK0k1L1d1eVZudVI5MUhzbmtE?=
 =?utf-8?B?UzBmbUNmenRpMXZqOW5LaHJhc2RzWjlxS2NoaDNBaVNmMkNhdENGYm1ZaXNY?=
 =?utf-8?B?UG5NWkZBWkxzc0tXWElmUkNMYkpPUFdCajI1S0IzLzU5QXpBOWhsOUFCemlY?=
 =?utf-8?B?WEJmTGFiT3F4aXdaK1BSM0Q0OXhzZk1SL0lCaHpZOTU5RFpTdE9ZZUpFMmxE?=
 =?utf-8?B?S05yNkFwdlM1dFZUTWNncGx6bnVQVnIvWFpsd0x4YS9YekZvM1RkNHkzNVFF?=
 =?utf-8?B?ZlY3blpmSjkvQ3VwbDRyamtSR2N3WEpRV2E0ME5vMVJoNDJxRnN3aXRHTGlo?=
 =?utf-8?B?UExMRzJRMitaVHBUdlRCL3VIT2NRUnZnWmxiSkJsUHhXeFFSejE4VlR4MXRq?=
 =?utf-8?B?L3FXenUrZm5ZY3lxaGJkTzhIYmkyNGRLTk92RitDbm1sdTFzUi9SRnB6SWJT?=
 =?utf-8?B?MWhaRGdXWkhOS2tZdVBrczdSOEJ5RVgvSVhxcE1OZzVNbTlzN2R6aHdsNE5W?=
 =?utf-8?B?NmdxRjMzM1lId09Zbjg3bEFxamxoYzdIMUpxZkZSN2EvdjlvczNZRzNkU3Uz?=
 =?utf-8?B?amlJVVhGRnpmR3lLSlpvc2pWSGRLVmhIcWtmY0E4UnRESkJja01pSkxaRXZQ?=
 =?utf-8?B?dkFycFR1N1RXWEk3VEVUZm5YR0hzOFIvTDdLTVhXUHBvSmcwV0VZbG05Rk82?=
 =?utf-8?B?RFVwS0xFNkhSbmV1MXl6K2J3clIyRW9WMXc2WFFqdHZTTkVUY1pFeHMxd1d2?=
 =?utf-8?B?aFVuK3RJd09xWXprbllleVBNSFJrREN5a0FKUzRoU2QwZjdjS0Y4UUcxaHFv?=
 =?utf-8?B?MW40bFBIc0FibzZoaGxhUW91RWFBRkdMcTRnUVl4QiszZVJuWU8rODFzdGw3?=
 =?utf-8?B?SWJLWjErdXloaTNTbGZpWlZsUk5mWlhDOGxYaEhERzdvblFETEtDMUVXMFJK?=
 =?utf-8?B?K1dMTyt1NEJHOWphOFd5YXVkT3dxa2FidjJaWTVGZ3ExeFg3aW9nVUtLUHJC?=
 =?utf-8?B?ZU05Q3JOZnhmVXJiUHlkMXVqZ3dkL1ZMWEozUTc5RUY4R1JqcEtkTUR1eXhm?=
 =?utf-8?B?TlJ0dFFUZzcwK3ZmVk9BYTBFcEwxdzIrclJoUjBCVTdiWFBCMjM4ZWFBWkpN?=
 =?utf-8?B?djhSS3RDWU9vUTJwS0xubWJWMXJVUnN0YTg0clhCUmtSNkErUXExY1BuQXB6?=
 =?utf-8?B?M0ozYlc1Z0RNVyt0Y2ZoTU55eFRsUjI3RjdITnYrQ0JPT1hQV1ZzTWZWUFda?=
 =?utf-8?B?VHZQYkZicFR2WDNTMXg2ekczdHFzU3RXendLc0xwdzBOVnEyTDNrTzMvaWdL?=
 =?utf-8?B?TGZCbXFidjA1VDhLN0ZpZjREVnliVVBGOGE0ZUNTV2FCWDBoNS80MVdWWjZV?=
 =?utf-8?B?YVNzNi9QN2prTVJ6Uit1Yjc4clJoeXRwV3lUQzdGVG40UDNUUitRdmRxK2JD?=
 =?utf-8?B?NHliYWlaaHdZWEx4aXdGWTRESzZYRmlnR0Q1QXh2Sm0vdEhkL3FlN0pxSDRY?=
 =?utf-8?B?SXc1dm1nMWs0dUtXNWRhK3VycndUdE1MckpKN2k4R21VRldMSHZRVFEyeFhX?=
 =?utf-8?B?SHhCYzBiZWxTcE1PRmNGbnoycEJHenVGWmhVMjdFYnJLKzhyMFgzVkNDQUJS?=
 =?utf-8?B?dU5HeXZNcktIVTVjQXdSS1VPYklXTUpnNUJLQlUweXhnYzlqVjBFODNHa05U?=
 =?utf-8?B?cUtGdy9pTjFWTVVWZEUzaEpCNWQ0NjkrNnVNYWhSRllaWWdkRXBnM05kRVBm?=
 =?utf-8?B?NnVNVXpuelp0aW9qTmN5c2M0dVd2akpUZUFEazFYTzVqUVRiL29hL04vWTBm?=
 =?utf-8?B?QStYYi9pRXRKRTFOeG02eWEzRXFrSmtPTlNjamE0eXZKSDFkQUttSm9hdkti?=
 =?utf-8?B?UHNqdzR4T3NtMkdpWlRVT2NRa1ZvM0NWTnFTSWx6QnQzVCsvdjl5cXFrbjBS?=
 =?utf-8?B?MTU4YXczb2YxbDdLaEtyYWc5czFqRVZTMFRMZ2YySVdESEl4UEdUcFQ3Wi80?=
 =?utf-8?B?dHNWSW9tRm5wRVI5NjdnUzhqMlQ4YXBQaHM1bkJMVjFyVWxHVWk3SXNha3Nu?=
 =?utf-8?B?VTJSSElDYnFxdC83RlJPZlV1UC9EU0MwT0cwdUJIQ2tSYmc2a2NsTFk4bGNQ?=
 =?utf-8?B?STV3blNKcVBMTWtqakdKMWpRTXRob0c4VkJ3ZzVnd3NVUDVDSko5Rzk5Unc0?=
 =?utf-8?Q?qMebn96mYicKC1qJmtbf/JI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6623a1ee-ccee-43bf-d1ec-08d9d688d33c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 11:35:39.9697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7pWb+ptBD4C6Cl/rvOnmAiJ2eopbcwe9yaoTOWELJ534LHZwiILYOa02ZtUXHJh6R85rUS469UYFrfI38d76A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3997
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 01:02:48PM +0200, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Assign SBDF to the PCI devices being passed through with bus 0.
> The resulting topology is where PCIe devices reside on the bus 0 of the
> root complex itself (embedded endpoints).
> This implementation is limited to 32 devices which are allowed on
> a single PCI bus.
> 
> Please note, that at the moment only function 0 of a multifunction
> device can be passed through.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v4:
> - moved and re-worked guest sbdf initializers
> - s/set_bit/__set_bit
> - s/clear_bit/__clear_bit
> - minor comment fix s/Virtual/Guest/
> - added VPCI_MAX_VIRT_DEV constant (PCI_SLOT(~0) + 1) which will be used
>   later for counting the number of MMIO handlers required for a guest
>   (Julien)
> Since v3:
>  - make use of VPCI_INIT
>  - moved all new code to vpci.c which belongs to it
>  - changed open-coded 31 to PCI_SLOT(~0)
>  - added comments and code to reject multifunction devices with
>    functions other than 0
>  - updated comment about vpci_dev_next and made it unsigned int
>  - implement roll back in case of error while assigning/deassigning devices
>  - s/dom%pd/%pd
> Since v2:
>  - remove casts that are (a) malformed and (b) unnecessary
>  - add new line for better readability
>  - remove CONFIG_HAS_VPCI_GUEST_SUPPORT ifdef's as the relevant vPCI
>     functions are now completely gated with this config
>  - gate common code with CONFIG_HAS_VPCI_GUEST_SUPPORT
> New in v2
> ---
>  xen/drivers/vpci/vpci.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  xen/include/xen/sched.h |  8 +++++++
>  xen/include/xen/vpci.h  | 11 +++++++++
>  3 files changed, 70 insertions(+)
> 
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 98b12a61be6f..c2fb4d4db233 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -114,6 +114,9 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      spin_lock(&pdev->vpci_lock);
>      pdev->vpci = vpci;
>      INIT_LIST_HEAD(&pdev->vpci->handlers);
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    pdev->vpci->guest_sbdf.sbdf = ~0;
> +#endif
>  
>      header = &pdev->vpci->header;
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
> @@ -145,6 +148,53 @@ int vpci_add_handlers(struct pci_dev *pdev)
>  }
>  
>  #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +int vpci_add_virtual_device(struct pci_dev *pdev)
> +{
> +    struct domain *d = pdev->domain;
> +    pci_sbdf_t sbdf = { 0 };
> +    unsigned long new_dev_number;

I think this needs to be limited to non-hardware domains?

Or else you will report failures for the hardware domain even if it's
not using the virtual topology at all.

> +    /*
> +     * Each PCI bus supports 32 devices/slots at max or up to 256 when
> +     * there are multi-function ones which are not yet supported.
> +     */
> +    if ( pdev->info.is_extfn )
> +    {
> +        gdprintk(XENLOG_ERR, "%pp: only function 0 passthrough supported\n",
> +                 &pdev->sbdf);
> +        return -EOPNOTSUPP;
> +    }
> +
> +    new_dev_number = find_first_zero_bit(&d->vpci_dev_assigned_map,
> +                                         VPCI_MAX_VIRT_DEV);
> +    if ( new_dev_number >= VPCI_MAX_VIRT_DEV )
> +        return -ENOSPC;
> +
> +    __set_bit(new_dev_number, &d->vpci_dev_assigned_map);

How is vpci_dev_assigned_map protected from concurrent accesses? Does
it rely on the pcidevs lock being held while accessing it?

If so it needs spelling out (and likely an assert added).

> +    /*
> +     * Both segment and bus number are 0:
> +     *  - we emulate a single host bridge for the guest, e.g. segment 0
> +     *  - with bus 0 the virtual devices are seen as embedded
> +     *    endpoints behind the root complex
> +     *
> +     * TODO: add support for multi-function devices.
> +     */
> +    sbdf.devfn = PCI_DEVFN(new_dev_number, 0);
> +    pdev->vpci->guest_sbdf = sbdf;
> +
> +    return 0;
> +
> +}
> +REGISTER_VPCI_INIT(vpci_add_virtual_device, VPCI_PRIORITY_MIDDLE);

I'm unsure this is the right place to do virtual SBDF assignment, my
plan was to use REGISTER_VPCI_INIT exclusively with PCI capabilities.

I think it would be better to do the virtual SBDF assignment from
vpci_assign_device.

> +
> +static void vpci_remove_virtual_device(struct domain *d,
> +                                       const struct pci_dev *pdev)
> +{
> +    __clear_bit(pdev->vpci->guest_sbdf.dev, &d->vpci_dev_assigned_map);
> +    pdev->vpci->guest_sbdf.sbdf = ~0;
> +}
> +
>  /* Notify vPCI that device is assigned to guest. */
>  int vpci_assign_device(struct domain *d, struct pci_dev *pdev)
>  {
> @@ -171,6 +221,7 @@ int vpci_deassign_device(struct domain *d, struct pci_dev *pdev)
>          return 0;
>  
>      spin_lock(&pdev->vpci_lock);
> +    vpci_remove_virtual_device(d, pdev);
>      vpci_remove_device_handlers_locked(pdev);
>      spin_unlock(&pdev->vpci_lock);
>  
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 28146ee404e6..10bff103317c 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -444,6 +444,14 @@ struct domain
>  
>  #ifdef CONFIG_HAS_PCI
>      struct list_head pdev_list;
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /*
> +     * The bitmap which shows which device numbers are already used by the
> +     * virtual PCI bus topology and is used to assign a unique SBDF to the
> +     * next passed through virtual PCI device.
> +     */
> +    unsigned long vpci_dev_assigned_map;

Please use DECLARE_BITMAP with the maximum number of supported
devices as parameter.

> +#endif
>  #endif
>  
>  #ifdef CONFIG_HAS_PASSTHROUGH
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 18319fc329f9..e5258bd7ce90 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -21,6 +21,13 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
>  
>  #define VPCI_ECAM_BDF(addr)     (((addr) & 0x0ffff000) >> 12)
>  
> +/*
> + * Maximum number of devices supported by the virtual bus topology:
> + * each PCI bus supports 32 devices/slots at max or up to 256 when
> + * there are multi-function ones which are not yet supported.
> + */
> +#define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
> +
>  #define REGISTER_VPCI_INIT(x, p)                \
>    static vpci_register_init_t *const x##_entry  \
>                 __used_section(".data.vpci." p) = x
> @@ -143,6 +150,10 @@ struct vpci {
>              struct vpci_arch_msix_entry arch;
>          } entries[];
>      } *msix;
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +    /* Guest SBDF of the device. */
> +    pci_sbdf_t guest_sbdf;
> +#endif
>  #endif
>  };
>  
> -- 
> 2.25.1
> 

