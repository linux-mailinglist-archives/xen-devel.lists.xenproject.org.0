Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5576C4E8E9C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 09:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295320.502490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYjPi-0000sT-K5; Mon, 28 Mar 2022 07:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295320.502490; Mon, 28 Mar 2022 07:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYjPi-0000qb-Gd; Mon, 28 Mar 2022 07:03:42 +0000
Received: by outflank-mailman (input) for mailman id 295320;
 Mon, 28 Mar 2022 07:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ynyj=UH=citrix.com=prvs=079c560b7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nYjPg-0000qT-Q0
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 07:03:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31043ca9-ae65-11ec-8fbc-03012f2f19d4;
 Mon, 28 Mar 2022 09:03:39 +0200 (CEST)
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
X-Inumbo-ID: 31043ca9-ae65-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648451019;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ka17dohQT4BFRuHCxHmZxBUCSI0OpYzLrMPXIvJB86I=;
  b=C00DVA5pRXqwvreVtrxf5V0G0Ru6vKZEHtLiCBrH32nx3BduUh/yslxY
   IBAwys/AIWM+UzP95kIeO3fXWgjcHo1QEKhyQVsWv3gBmo9wZG8ufRltC
   znV0cFTwOU7BVooojLWIG214k9ubQa1p6QfjFyFX9qfGOZzmsbq1xrr06
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67300635
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:79jMR6tBALr6xNARZdQzr0FB0ufnVEJeMUV32f8akzHdYApBsoF/q
 tZmKW7VaPeDNzb0f4xwb9y09BgA7JHSnYdiHQs6qi5hRX4R+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jX5
 ouoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8kGrPgwaMyeiNhDjFsGIN616PlBSCG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 JFBMWQ0MXwsZTUQBFJLKIM1kdyqg1PiXQV+rWPPgJMotj27IAtZj+G2bYu9lsaxbdVYmAOUq
 3zL+0z9AwoGL5qPxDyd6HWui+TT2yThV+o6C7mQ5vNsxlqJyQQ7ChcbSF+6qvmRkVOlVpRUL
 El8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+Ae9i3UjYX92T+EFnohYAJudP4C7PZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sjA3Dt4ade51q2VtW
 lBewaByC8hUUfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs5bp5bI2W3O
 xGD0e+02HO1FCHwBUOQS9jsY/nGMIC6TYi1PhwqRoQmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnSOqddIdwFTdxDWx/ne8qRqSwJKGSI/cEkJAP7N27IxPYtjmqVejODT+
 X+hHERfzTLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:sAhjfK1yw6CtCBhVhii4JgqjBLYkLtp133Aq2lEZdPU1SL3+qy
 nKpp8mPHDP5Ar5NEtOpTniAsm9qBHnm6KdiLN5Vd3OYOCMggqVxe9ZnO7f6gylNyri9vNMkY
 dMGpIObOEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.90,216,1643691600"; 
   d="scan'208";a="67300635"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMMXsX86tD7GGFZkDJTA/ZziRb/cvlqDWhDLMDp25R2wWx7AzqUIRGltHoTuk6mN4ac0VkKv3pB2FxD4qHqyfJ5dyGcpN9EodEaqhvGeXbKEaUYbufvHLOOJT29+VV2jFjHGn5lOX3JjYWmjaKVUwaX4wVWbai7lnUAh9hDhH05f2kJS4uCBr38fGAB4kQWpiT9VoVyjJvDlhND8dK9v1gwEvXGE67nfTr8yymIK1Fajfok63zCeM5vTCC6XQvwpHDkicBuLD94XEfSRmkpSW2Yx0WUIh2Ho1jk4bCgta23Z48qMjDLM4+PUzMnRRb4mKmfFgGgrUkRF7SGGgeI46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFvd2LT4jFfFYEdYlNCSCmWKTXIj5hK2h58XsiXlaKs=;
 b=MNsKcyM+EiKoMjl/CQHlAZAOjjtTOSVT28OfpCt/rVPydtJEzKKIV5MxcJo/6gmDXimZFZdzAHtfF/u8YGiJIETvGcnzxgrhS3zAYffCH9rFrW87tmOKfp3ahnmIWofEKpIN190baj2eWbXdUFLzszr0cYClGdQsTbIxjrcEYdCqwv6N5dFLQh59sMrgCt5DtprnZSpDtC5/abMazoTccAJBWHZEqqlkvy3ydO+flV/G+MyFW50265gGTP8IQg2KCTq8XXZK8pLMbFjO3gTNniLiKlq53d/suhH3mngqcIlvWx3E+RrTk7821+fYDpCoCYhIV/3agjLXyWP37CR5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFvd2LT4jFfFYEdYlNCSCmWKTXIj5hK2h58XsiXlaKs=;
 b=Mt2lWwXBL/7a2PAUxq+4mTOrnrGo4TTWIeokswkFwh1XDmDFoXqUn3p0Evne/ruDsvZDCatwFueZvRbhWXV6SA+xYACd3JHhKeyDPjULJrRAjJAvKLL4MI4W7VTWeuRd+JsWzBboIrblbyZaN9dZXOaYENgF/hp5wLyXgqIRl5k=
Date: Mon, 28 Mar 2022 09:03:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Changelog: Add __ro_after_init and CET
Message-ID: <YkFdwupjQXdK8YYJ@Air-de-Roger>
References: <20220309123936.16991-1-andrew.cooper3@citrix.com>
 <20220309123936.16991-3-andrew.cooper3@citrix.com>
 <c5b13e54-8868-3d30-70ee-1d1daa082ec6@suse.com>
 <f2be5a63-837a-204e-ba5e-5ecb48c9caad@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2be5a63-837a-204e-ba5e-5ecb48c9caad@citrix.com>
X-ClientProxiedBy: MR2P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66b60323-f1af-4fd7-4b6b-08da1089130b
X-MS-TrafficTypeDiagnostic: CH0PR03MB6193:EE_
X-Microsoft-Antispam-PRVS: <CH0PR03MB6193AAA8007A9BE3351F85758F1D9@CH0PR03MB6193.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oxlYFVMhNh32I8PVNHDvgUKmE7WZRbLNR74vcezvvjkxeo87wYVGbjHQnwr59+eTm6IF5K59KjS7BRluxyfV1F6Nv5Oh5EYzq/6LVUNPT475zyHbwltzhFaNmFEBPaaEnRMrA3XEvBQOh5CdU+BkWLnf1nDB0wFvfA4vSDNY72DRhdWLlC7DAnryQzKLEG4b5Z8YEHj/DJ4VleK+1Ukjr67QBZmmBKdQ9ZeVdV31geTC2gE0FIWQM1Eo+TEGGiKNdqculQ94DF2CLJ8gBNdcPZh2nF5JkHjJfWFfBawjQ5LFbfZMI8srjctuEri+pdxjxOB6OKU3pQ73W7PNFOQcTZqE3H8UaFH8lOcQWtGYE+A2RdErYnSZXUZRO1SPc97uBeHsn83NK1iyLLJSZYcaGyB6uiPo1r6tujXp8RmV2bp1KVKAF/08PyvxgypcoBV9Fu0XY+HDb4wdCFp/tYJ4I8hZeO7oNLZH5g8kKY2LivXxg8CSbESEYA/ftl6WyxhJKhXZA6oRzGw/sKBtrO3tGG58RKEPZL19ZwhndbSQ2IXVIkXtssndITJyE4nSlgrgEE591sl6vSlkOqJfHC1jhdXnP6YNGrkxRF06d0ImCr1/Mjvbv+DN2nk2Q3EtUc0XiZ9y5AlP/E+gdBy5jfBlorJ1vQxuwOx2kgYa9nFH6IIzaX28BzdvpcANxDOm2ZXALRBLBE6g2vdQNHI2IO8P7ronlLcaTG4wyNTJOEcT5JaxYAYQkDA+Tg6tyL9BY8W+fYcfYarxd7N7w091nXAKTsoWLfBP+2aKxoofD8UKcDx8UGPqu5FIC8m0ZHIViRWfZaQFK0jN3sSNe0RfQjpkfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(83380400001)(8676002)(6486002)(4326008)(66556008)(66476007)(9686003)(85182001)(6512007)(6636002)(2906002)(4744005)(54906003)(6862004)(6666004)(33716001)(66946007)(26005)(86362001)(6506007)(316002)(38100700002)(8936002)(82960400001)(508600001)(186003)(53546011)(5660300002)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVFvZFU1WjFhajRuSG5nQ01XMDMxUTYybW41ZDkyYlVOdFlhcXFvc3Y1NzNt?=
 =?utf-8?B?ZGQ4aTFvVldwNW1vSnN0VzdDSjFLOEZnbmFWKzZCZHUwV2Jpdys2ZTVlMjd3?=
 =?utf-8?B?SVNxQnhSY0oxbDUxZlZabDg5Q1RJclJQTURqUUZ4djJRRGpScUw4VDkrRmtL?=
 =?utf-8?B?WFZPRjlDZjI2bmpwemkxVll5U1R6WGRiSWNncmVUVGhObkQ1UGxXVzl0V1h1?=
 =?utf-8?B?dDdwQzhiSUlBZWtMUE9Gdk8xaHFxa1FKd0UzTWE4cnZxUUpjWlhGaFZGVDkr?=
 =?utf-8?B?ZDFYbkRPSTJpZ25HL1U1TnhZVkNjc2M4Vm1JQjFiZGg3TXdVSXE2bGJOcGk1?=
 =?utf-8?B?SzdLZmVmRG5DWDEySkRWTzZNQlgwNWJjYjU1SmFqYmdVZVBzeFQvdEdEbGNB?=
 =?utf-8?B?eWQybVRCU3ZGNU1uemJtRzdFempkQTNPN2YwUnBYcWFkRFkvZ25KL3VnNjY3?=
 =?utf-8?B?NmU4eHRQTzJ2RUVNQlJnWmpIQms0bXpRYW9iditZS2FnTEJtbFlOKy8waElw?=
 =?utf-8?B?RTU4eDZxMStTQ2ppVWZCVFliV1hCcndwSWxodFE1Q2lycVJMcjVLQTJMYUJL?=
 =?utf-8?B?SGxEcUhEOERkZDk3ZWVRcG4yaTBSS3RmNkw2VzhCcEcyQ1o1VmFicXhtM1ZW?=
 =?utf-8?B?U1pkWmdyUEVPZjJVSnQ2MkVmSFBMc2JnL2F5d21ORis3RjVEbmtWOWtxdDky?=
 =?utf-8?B?TkYvSjdkbEdsa0pnL1lZWGhDRzBSUWNXZkdzL2xLaDZVbVFZVk1jbGtSa1c2?=
 =?utf-8?B?a25zYTJ4TUV4aFlSV2VBalA0Q2YyTnVvektidWtPWlBSRU1lT3cxcEFKQVE4?=
 =?utf-8?B?eFI4Zk9jTmIveTRKb25GQ0dWdTdzMU43TlFhQlpyMSthSjlHaTdxL3lWS041?=
 =?utf-8?B?ZWN1NVlsTkNlcEJkWjBOQ3FnbEp4aUZKRFB6K3ZVM3RwaWlDUVlXQ2U0bEhB?=
 =?utf-8?B?dXYyajhCOWtleGVwNzRrOFN0QWcwSzZUcEFnanltWDJ6Y1I3SG0zTXpvLzRl?=
 =?utf-8?B?Qmtadk9kM2NMbHNjR0grOFZyK1pScmdRUWRMTWU0bWRmSlRaRkpmd0xpNWVH?=
 =?utf-8?B?bFdzd1YrK3VJeHkxZk80KzNrWGkwZ0p2bU94ZkpUZFVnd09MeUJLNWcrRWM4?=
 =?utf-8?B?RE1JK1ZXYzJNSDZpNUh3RFhDOWhuVU83eFJ4VWlWWnRnc1pKdGU5TmVxRW9H?=
 =?utf-8?B?YS9YZ0p4UUFuSzA5K1VUdzVOOTlHeUhuNlJ0WjJVTko2b3RycCtlUHhFcnQw?=
 =?utf-8?B?dlkvS0ZiMUQ1RmwxLzBXTjV0eDY5Y3pLN3YxQ2J4VDNPZU9Ka3dzenArZDhQ?=
 =?utf-8?B?WlNTZHUzY0NTMkNxQjU2eS9UWjA5VE8yamZaY0g3aXJQM3lSM1hIVFpqYUpO?=
 =?utf-8?B?Wkw1ck15VGp6aTRqK1VMR3kvYmg2T0V2eEJUdFg0cW0wVWJvVlM5TDEycDND?=
 =?utf-8?B?Uzkxa0dQRDZSRmJYV1hiTmpDMTF1U1Bhd3pGRHJHZzdUdXJRODloOWZUT3F4?=
 =?utf-8?B?TVlZR0pYL2dyeS9sOVJaM2JjRXo1bmVhV0hlVU5La0VOT05kbjFJeGEwcExp?=
 =?utf-8?B?YnVobFdqbHdzcUZWNUo1K0pJR2EvS21zUk1iamNONm11bE5yQkI4T2U3Z3Fw?=
 =?utf-8?B?aWlBWnA1WWN3R3FDLzRDaGhrWGkvKzJ3aU9hM2dsbU5qZFNBb29CK3RaWjRC?=
 =?utf-8?B?L2VtQmFFTkJDZG9sNDlqWDd6U1d6T0NSYmEwUXJURStYN3lDZ0ZhMVBuK1F1?=
 =?utf-8?B?WFdLeU0vc3FQZXFjczRPdVJQQjVYQUk0RXNmOWRUb3hFenZlcjNiYjFZVXVS?=
 =?utf-8?B?SWtxb3g3Q21pelI3SnpScXd5TmVaRWs2N3UwZjN6SWdtSDdzVC80Y0RLQkVB?=
 =?utf-8?B?eStnQXd3d2h6WUdoaWN0ZzJacWl0WVUyc2F2S0pudXJGR0dFdFlBZy9xUzkx?=
 =?utf-8?B?OHpkK2pLTDhxQkhsTmh4Yk9pcjhpN3FueHp2dVc4ekJ2NU1WSUtMaVI3VzMw?=
 =?utf-8?B?bE1zYzdTOE5tRzJabXRuaXNKcnFpdndXQzBkQUJBVk10aUt2VGwxVFRBd041?=
 =?utf-8?B?bkJqeGFpcHJ0eFA4OTQ5RE45aTNTWDByQ1RneTNWRWZmekFFazNKT3d2ZC9R?=
 =?utf-8?B?ckw2dmtJYk42Q0FPbGtkVlVuSlFPVWc0KzFLZXZ4WG93OVA2ZmNaZ2h2YnF4?=
 =?utf-8?B?WjBCZGVpcnVUZk1IbFM5WlUyVWgwbE1PN0RYZWhkZHVQR3VuWk1GZndRVnpU?=
 =?utf-8?B?NVNYamExbFkwbzlTTWlSMHlnUjV0aDlHL0pKVi9vZkYzVGZsQXBpTTNTTEdE?=
 =?utf-8?B?Q1N0REpBaGdQVzJrRGxSUjlrbzFaZzFUT3JoT0o4VDI4QjYxOUZndHBjZTJm?=
 =?utf-8?Q?2FPd6Rl1uEpItK6U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b60323-f1af-4fd7-4b6b-08da1089130b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 07:03:34.3198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xX2N7tTvvLCwDnEVRCjb7Prjcx5cjl1bO0xvN4uzo0FZWFAXbXxCrL8sm3qeV49tiqnmGdShBgs5FTFYk+GwDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6193
X-OriginatorOrg: citrix.com

On Fri, Mar 25, 2022 at 04:39:30PM +0000, Andrew Cooper wrote:
> On 09/03/2022 13:03, Jan Beulich wrote:
> > On 09.03.2022 13:39, Andrew Cooper wrote:
> >> --- a/CHANGELOG.md
> >> +++ b/CHANGELOG.md
> >> @@ -6,6 +6,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >>  
> >>  ## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> >>  
> >> +### Added
> >> + - __ro_after_init support on x86, for marking data as immutable after boot.
> > I'm not sure something like this (being an implementation detail) belongs
> > here.
> 
> Having things immutable after boot is not an implementation detail.  It
> is an important security hardening property, and deserves to be here.

The release/couuminity manager will collate the changelog and pick
which entries it finds worth adding to the release notes. I think it's
fine having this here as it might also serve for developers to be
aware of the feature and use it.

Thanks, Roger.

