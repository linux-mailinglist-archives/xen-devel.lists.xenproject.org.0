Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1322F4BBA5A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 14:58:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275477.471373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3mV-0002PV-U4; Fri, 18 Feb 2022 13:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275477.471373; Fri, 18 Feb 2022 13:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3mV-0002Ne-QQ; Fri, 18 Feb 2022 13:58:43 +0000
Received: by outflank-mailman (input) for mailman id 275477;
 Fri, 18 Feb 2022 13:58:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Z2s=TB=citrix.com=prvs=041b9fbab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nL3mU-0002NY-CO
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 13:58:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id defde30e-90c2-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 14:58:41 +0100 (CET)
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
X-Inumbo-ID: defde30e-90c2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645192720;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Jwxj837jYM/s1nhFzcMdZIK5ZKiAfGjY1tKn+bil6io=;
  b=YspsmNtrWf9G750Y9jLXbWNamcrGL6BaUTG5M1TUA25q46/2dQUCVLti
   qC9mK8YxmZReXcM83AYRf5NsuhC+TTrriDBAcDYJPQIH2OvH+c/66YbdG
   WW8L7dMKisaC55ZSSQCogZ+7KkVwoq+N2/JI3k0SMW+gTLvtyq9oyO0jI
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66762665
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PCkb3qNsyPglBZ7vrR2fl8FynXyQoLVcMsEvi/4bfWQNrUol12QOn
 TYcCG6DOP7cZmP8fI0ib9uw9k8Av5/RxoVqHQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj294w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 PBMs7ybFggVO4aVgd0BTTZCFiJ+MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQ6mAP
 ZRHNFKDajyYUyFoMHoQCqh5hbn3wVLQfDAGqE+s8P9fD2/7k1UqjemF3MDuUt6XQcRYmG6Iq
 2SA+H72ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZ1hHWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWlbHOb1pzLog+3EnEMFHMcSjUBTgsKtoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNs1shDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGGN6bKMN8N4n9hIx5JFVdkBiN2ZDB00WvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMocXOMQpJVPZpXsGiausM4bFyRlEfUYXY
 8rzTCpRJSxCVfQPIMSeHI/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4Zv1CI9Qzp/YxIQqJt8E7FYc1N9zLmQp
 SjlAhcCoLc97FWeQTi3hrlYQOqHdb50rG4hPDxqOlCt2nM5Zp2o4rtZfJwyFYTLPsQ6pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:/NtpE6Bh/lAHhiPlHegIsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+UsssHFJo6HkBEEZKUmsu6KdkrNhQYtKOzOW+VdATbsSorcKpgePJ8SQzJ8l6U
 4NSdkcNDS0NykBsS+Y2nj5Lz9D+qj+zEnAv463pB0NLT2CKZsQlDuRYjzrSHGeLzM2YabRYa
 DsgPav0ADQHkj/AP7LZEUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8Dlyxwgoeeykn+8ZgzU
 H11yjCoomzufCyzRHRk0XJ6Y5NpdfnwtxfQOSRl8kuLCn2gArAXvUiZ1TChkFxnAic0idsrD
 D+mWZnAy210QKJQoiBm2qo5+An6kd315at8y7CvZKpm72HeNtzMbs+uWseSGqF16NohqAN7E
 oAtVjpxqZ/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh57D30XklWKvoJhiKo7zP0d
 MeeP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw9ArfZv0kso5dY4Ud1J9u
 7EOqNnmPVHSdIXd7t0AKMETdGsAmLATBrQOCaZIEjhFqsAJ3XRwqSHrYkd9aWvYtgF3ZEykJ
 POXBdRsnMzYVvnDYmU0JhC4nn2MSyAtPTWu7djDrRCy8/BrYvQQFq+oQoV4ridSt0kc7jmZ8
 o=
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="66762665"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBQK5MWhIDsyT+FdN8rdLYEIDPtUfiw8bdFu+MjclnDlDkeVIbcMn5auOeij7TnYSQPflNduJLEC3/GB39L7971ZEOFHZgnzlJMAEdVqZP4yXG/UyXoDALkOqVeGfcDNpvODZJLujC2F3PQWNgMAzrvlU7bEfszz+Jrgt9BB0/lk1ORxLGjn8mQWFQU0tledhlmZLoYnfDlxaUB4ZYJDCtqbvpqFZFhm4dwSu1goqafprnqY0pRaOQm/r93datFl/Kyclk5zi2QqvS5eP12miJ4SviviTrxEvC16oR7+NJFIYRAYC9P5H2zzCfykeTeU50DC6xiV7L4XpR3N9zCllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jwxj837jYM/s1nhFzcMdZIK5ZKiAfGjY1tKn+bil6io=;
 b=GKgplaZwGhBKwUA0LhWExnUGVIGpzwqT14AFhuaN1uDA6OU1Yp1FH33JcfqzCfHtFvcWUn1uj7QWbJm7imIqRbJdNoKWG8NTw9iiQJV/ULvEptUUSrX7tEf82r5vX84FU3iTmsf+Vpvvgl80sdzk5e3+rriNcapyc8Eby4z1WTB9henq6SaYxF8103t8ofagEEURmnLXXvIo/6mzi/y81+exyqAG0hL1DsniKow7KyLLAc1y2X2QsVrpemqV1W23gd98oFxveFqvGMoNXvqrWCUK751835JDI3xAlsuXgwbwstavwq3xU3217qeS4IPDNmQMCS8qA4Cx0KRXMxf4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jwxj837jYM/s1nhFzcMdZIK5ZKiAfGjY1tKn+bil6io=;
 b=PDt6++6Q770OQBkwk6Fb+KzaYtvQCsF8VL+/tJi7KdamJ0iWXTNpHK4ZdGpsbZcGGvYrN0c7MJkVRGHtwxw4nxgoskzaEH0hsFaJtma7NGs0vId4yfPbJPLCqQZxmdb+oQzfAkCrTjmHq8kFiv/zLuCWgtnhoV6QoKfEm4qOKf0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/3] retpoline: add clang support + Kconfig selectable
Thread-Topic: [PATCH v2 0/3] retpoline: add clang support + Kconfig selectable
Thread-Index: AQHYI1FM/431BUtYuEy2GtPXIcEIC6yZWJaA
Date: Fri, 18 Feb 2022 13:58:31 +0000
Message-ID: <cfa55fd4-1990-b1ac-e6f3-94ef364793a3@citrix.com>
References: <20220216162142.15384-1-roger.pau@citrix.com>
In-Reply-To: <20220216162142.15384-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50929868-ba86-490b-3fcf-08d9f2e6bf94
x-ms-traffictypediagnostic: MN2PR03MB4605:EE_
x-microsoft-antispam-prvs: <MN2PR03MB4605EE918ABCF552518510D1BA379@MN2PR03MB4605.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nCklak1YgCI8jtp3PhAag7VneE/JbV9/eRbupKdsBfn7PF3y8an+PEgHQuaf5g+PNzjRlVnDSz/suz7uaGIbWU3hg1Ee5VLEkRby6PO6/DLNOCl7g08SkFhJsqmtJUtQs6t5gyX/ybH3zkc8dAi38R7hiFydXlTLdysl4G+3vYn8Bj2SW1uq0JAUlOHL7oWXvf5+Y0p/8GNIAzt+H3YVbaFxDNS/g87s/+YuVi0iWOkMlV2UERF1t6NT6rfH7Ojj7ZjA+kVQY9zy1ZEcCal2x0mLTR8fRTsJFX/hMf45++hgxkIF72iYk++66D2G+z0JeA2xeh44rhyAl71QsQ7xsDViRAE+jkfaJqovqBfm0gri1AbrUmODs+nz+75sAWMn5+IHq8U2krpHTEeAMLXCQXsqNV+YxUu5XM1FZ1E6cmyFJOu++nz0Fxa0PbZDe2+lA9p5zPND5lrE/WxamcqmsZXUX6Lo5Rt13pc3BxJQye8XEwqkXvvtBXlZchDSoHfm+vDoJASWltkmU10Pp1xb8fYCIn5Yp8c9Uv8yaZN/3kuPorvSF+fOR+Oxn9Sc+cBcPBiD+mmsF8oQkXCCWrYCpDVHF+OTDc9/sZPvSaXhImCddRIP/05Ay3nynAYs6pm14kGJZmmffnxanU2XdSzq72X0GGjhT3BLIJ0dbHJRx33ljQW1vJg5jlYqP37IFPGATvNBonnjBOFuRfk3/UR9pZ6Zu0OnXVycgqelsz3LMlRx7uv5n4QA133/uYELmjASoj75vxVWdPm6ZWMgB/bj4w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(6506007)(31686004)(6486002)(186003)(83380400001)(508600001)(2906002)(6512007)(82960400001)(53546011)(38070700005)(8936002)(316002)(2616005)(86362001)(110136005)(54906003)(26005)(71200400001)(5660300002)(38100700002)(122000001)(91956017)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(36756003)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEZROG4xZEcxTEdraFRYcWtzK3hjeFREcTFheWUrM1V5UmJUZTEvUG1KQ2p6?=
 =?utf-8?B?VjdodjJoY0dtMXRLVkU0cTN4a2c5UGkvSkVndGtmTkZXanVDSnlHT3hmc3RT?=
 =?utf-8?B?NTF3NzlyemczdmFVSkhZVW05NmdUQVZBQkQ3WmZTaWFZcHdKV0JPcWdXb01q?=
 =?utf-8?B?OTg1UXArbzNlNHRRc0hFRGlsYkZMcmc1T253eUNSSk1VYVk2NzVpSW5kUGJ2?=
 =?utf-8?B?QVZjbnZ4MjZsNXZtVWVLSVRmY3UzQVRDbVREclpmakFOMlNVWWdoT011OUlk?=
 =?utf-8?B?ZHVCZVkzWDF5Szcvbk1TR0NPRzJwN2ZOR0RrZm1RL2RVTS9qZzZ1amtyUlRJ?=
 =?utf-8?B?RkFoRTNaRG90NjlNcm9vTnZKcEUvMWxla1ROWWtzVVNXQVdaNW9oY3k3VDB6?=
 =?utf-8?B?T0RKZ3JOVURCLzErVFFsWnRqYnAwODV5K1RGTDFrVlQrYzFkeXJnYmRSWC90?=
 =?utf-8?B?TEM2Z2ZiVFo1WnpmazZXM096N1JhMVVjWlpjOEhGVU4weTYwRDFjdVF2dVox?=
 =?utf-8?B?OFhVMXBscFBjQk1oTUhCZEZXRkRiTHhqYmVwaXpLNTN5aVBuU3VEZjNwK3Vv?=
 =?utf-8?B?TVoraW5qbkNTdEtuSmZFU2FlUkFURzBQV2hMS0twajdpeWRvMGgyMWdHemJZ?=
 =?utf-8?B?MU8wZklZOGVIampMb1czZUlrRHkzb1A2REFobk5iTUtnbWNCc2pTMlpyQ0pi?=
 =?utf-8?B?Wlh4ZGg4RUJqUjNodzI0YjB2ZXZCN3V0UTZlaWJHSEhQQUNjYzgxZUpLVlRU?=
 =?utf-8?B?WlI0bzJjazRpSldwYVZBckJSOFBFNVJ6bXY2N2tMaUlzRTk0aHd0YjM0R3p2?=
 =?utf-8?B?M2pLbUFINTIwV3V3U1dHcGZSTVZ1QUNsSnI1N3NOVyt3Q3RvNVZlWVZUNzR3?=
 =?utf-8?B?MTZsMVJRWSs1MWF2bHZCZkN3LzVUenlveW9rS05nV0VvR2FBQ21xYzhLQk9i?=
 =?utf-8?B?YUYvZVUxdzZhRWZLUmZTN1lSR01tM2ROZnZCRG9odmVzbFVZZFdkT2hFK3pZ?=
 =?utf-8?B?cGJFZWtlNEs2bEhGbEpkMWFhTkpzNmdkZFJVZG5ncFI2eFdSSHhNVWpEbDFW?=
 =?utf-8?B?ZENscW5wNXBSL0swdWhRTSs1S2RUWE9XM2J0OURQaHhSUUZONFlQakwyYVdo?=
 =?utf-8?B?ZlJoc2w0OENzZ084M2MrOTB3cjM3dGFya0p4M1FNYmxqbVJmZGYrbHZrN0N4?=
 =?utf-8?B?eENUaEF1UDhEYldOU3lzdVNhL0RRUDhyekZUblVTbGJISno0V0h5T2NNYWdw?=
 =?utf-8?B?VmdaS1VRMFdEY3YvYzRkdWxRdm9iQXVkMGlxWm5NZlUwNmhiMFRaa1kySksr?=
 =?utf-8?B?a3hKUWFlR1MyenRwb1dVcDExcDhMWk9rV2RxZ0Mra2d3ODMzckVyS3l1bHdM?=
 =?utf-8?B?ek52SWxWMloxWGUvcmJRYjVkTEcrL0l5UHQvQVhDVVJNcFZOM0o5R3hvRGN3?=
 =?utf-8?B?NEpZcjRXWXBua2cyNy9Kd3hhZ3htWC9jcHpraGJQQnlHM0R1eDhEcjlHRTJ2?=
 =?utf-8?B?cGw5WWVyeWJBRVJEQTV6N3g4VFpQcFFuSWFOWVlYUFMxb2sxRlVwVVpaSTdB?=
 =?utf-8?B?czhmeVNDSVhIbnRkckdLYmhxTWxoYThDR3E4cVpDTzdpS29ONjhaa2JYak5U?=
 =?utf-8?B?dFlqZEY4dUJpRzZ0b01VRVBpeElYRHZueE9Tc0xHbmlxKzd1VzJ2VjExaGJK?=
 =?utf-8?B?Mkd5SytGV2VVb1VtanBvc3hzdjJZSDNnMlBnS1hXckh2eEk5SHlQd1R4WFhZ?=
 =?utf-8?B?RzlCVmxkOXVjaWFOWVNETmhoVDZFbE9VcXRKbURBdGVBUlUyTGxwZ2k5TUNV?=
 =?utf-8?B?d0dkT1V5aTZRSXUrYThqOXJzVDBGNW8wbkh3Nm40MWwvaTBqN2lKd1c3bmoz?=
 =?utf-8?B?LzJmSURTZ1NNL2k2dEVZQysxNk4wb2wxTzROQkVhWG9IMUsyZCtINnV6OUIv?=
 =?utf-8?B?NTg0MDNFems2Z1JyRCtGQW9zN25GMWZzNkJPY1hjTEJVVW5mdHA0RE9XdWhV?=
 =?utf-8?B?OE11QkF3UFBXbVVxYXVtcFE4WmU0RXFoMHpaL0I0TFg0bDc3eXcxUncybXYx?=
 =?utf-8?B?anJJNHBxWE0wcjBJa0l3ZlhwbVNQeGhEV1BuVXdMR3NiZ2VNZi8wT1hrclor?=
 =?utf-8?B?RGZ4UndhV0ZwbTdyMjVLMGdJNVVLMCt3Y0xyUWZ6ZFpIUXVPN3c5cjEwSXU4?=
 =?utf-8?B?OVViWUFoWWJwRWZDdldIQUZIZXRVWURxOXFJbUNZUEZORXg3M0xDNW9qL0h1?=
 =?utf-8?B?Q0JkY0tkS0lwdnN5RG1XUXVCdFB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AC3F68AC68F674C9DFFE7FD70AB7118@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50929868-ba86-490b-3fcf-08d9f2e6bf94
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 13:58:31.8637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vv6y/VoPoQyYBe4/Jw1XM8/+vK7HjN6jQm2UBO/VUVrTEtwAetUwBNAHaX0KRjyuWT55QGZmrutbWjSZAc2Yk2AeoXbZb6kaDRjF+ROu+TE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4605
X-OriginatorOrg: citrix.com

T24gMTYvMDIvMjAyMiAxNjoyMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBIZWxsbywNCj4N
Cj4gVGhlIGZvbGxvd2luZyBzZXJpZXMgYWRkcyByZXRwb2xpbmUgc3VwcG9ydCBmb3IgY2xhbmcg
YnVpbGRzLCBhbmQgYWxzbw0KPiBhbGxvd3MgdGhlIHVzZXIgdG8gc2VsZWN0IHdoZXRoZXIgdG8g
ZW5hYmxlIHJldHBvbGluZSBzdXBwb3J0IGF0IGJ1aWxkDQo+IHRpbWUgdmlhIGEgbmV3IEtjb25m
aWcgb3B0aW9uLg0KPg0KPiBJJ3ZlIHRyaWVkIGFkZGluZyBhIHN1aXRhYmxlIGRlc2NyaXB0aW9u
IHRvIHRoZSBLY29uZmlnIG9wdGlvbiwgYnV0IEknbQ0KPiBzdXJlIHRoZXJlJ3Mgcm9vbSBmb3Ig
aW1wcm92ZW1lbnQuDQo+DQo+IFRoYW5rcywgUm9nZXIuDQo+DQo+IFJvZ2VyIFBhdSBNb25uZSAo
Myk6DQo+ICAgeDg2L3JldHBvbGluZTogcmVuYW1lIHJldHBvbGluZSBLY29uZmlnIGNoZWNrIHRv
IGluY2x1ZGUgR0NDIHByZWZpeA0KPiAgIHg4Ni9jbGFuZzogYWRkIHJldHBvbGluZSBzdXBwb3J0
DQo+ICAgeDg2L0tjb25maWc6IGludHJvZHVjZSBvcHRpb24gdG8gc2VsZWN0IHJldHBvbGluZSB1
c2FnZQ0KDQpJIGRvbid0IHBhcnRpY3VsYXJseSB3YW50IHRvIG5pdHBpY2ssIGJ1dCBJTU8gdGhp
cyB3b3VsZCBiZSBhIGxvdCBlYXNpZXINCnRvIGZvbGxvdyBpZiB3ZSBlbmRlZCB1cCB3aXRoDQoN
CmNvbmZpZyBDQ19IQVNfUkVUUE9MSU5FDQrCoMKgwqAgZGVmX2Jvb2wgJChjYy1vcHRpb24sLW1p
bmRpcmVjdC1icmFuY2gtcmVnaXN0ZXIpIHx8DQokKGNjLW9wdGlvbiwtbXJldHBvbGluZS1leHRl
cm5hbC10aHVuaykNCg0KY29uZmlnIElORElSRUNUX1RIVU5LDQrCoMKgwqAgZGVwZW5kcyBvbiBD
Q19IQVNfUkVUUE9MSU5FDQoNCmFuZA0KDQppZmVxICgkKENPTkZJR19JTkRJUkVDVF9USFVOSyks
eSkNCkNGTEFHUy0kKENPTkZJR19DQ19JU19HQ0MpICs9IC4uLg0KQ0ZMQUdTLSQoQ09ORklHX0ND
X0lTX0NMQU5HKSArPSAuLi4NCmVuZGlmDQoNCmJlY2F1c2UgdGhpcyByZWR1Y2VzIHRoZSBudW1i
ZXIgb2YgQ09ORklHXyogb3B0aW9ucyBpbnZvbHZlZC4NCg0KVGhvdWdodHM/DQoNCk9uIHN1YnN0
YW50aWFsbHkgbW9yZSBtaW5vciBwb2ludHMsIElORElSRUNUX1RIVU5LIHdhbnRzIHRvIGJlIGZp
cnN0IGluDQp0aGUgc3BlY3VsYXRpdmUgaGFyZGVuaW5nIGxpc3QsIHNlZWluZyBhcyBpdCBpcyBi
eSBmYXIgYW5kIGF3YXkgdGhlIG1vc3QNCmltcG9ydGFudCBvbmUsIGFuZCBJIHRoaW5rIHdlIHNo
b3VsZCBzdG9wIHdyaXRpbmcgdGhpbmdzIGxpa2UgIklmDQp1bnN1cmUsIC4uLiIgaW4gdGhlIGhl
bHAgYmVjYXVzZSBpdCdzIGp1c3QgcGFycm90aW5nIHRoZSBkZWZhdWx0IHdoaWNoDQppcyBhbHNv
IHJlbmRlcmVkIHRvIHBlb3BsZSByZWFkaW5nIHRoaXMgbWVzc2FnZS7CoCBPdXIgYXVkaWVuY2Ug
aGVyZSBhcmUNCmRldmVsb3BlcnMsIGFuZCBJIHRoaW5rIHdlIGNhbiBkZXBlbmQgb24gdGhlbSB0
byBpbnR1aXQgdGhlIHN0YXRlZCBkZWZhdWx0Lg0KDQp+QW5kcmV3DQo=

