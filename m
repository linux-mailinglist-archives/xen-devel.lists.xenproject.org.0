Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA9150A0A5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310183.526919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWlJ-0007yB-F2; Thu, 21 Apr 2022 13:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310183.526919; Thu, 21 Apr 2022 13:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWlJ-0007vH-9S; Thu, 21 Apr 2022 13:22:21 +0000
Received: by outflank-mailman (input) for mailman id 310183;
 Thu, 21 Apr 2022 13:22:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1dP=U7=citrix.com=prvs=1038dedf8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhWlH-0005Gk-Dy
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:22:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f2121c8-c176-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 15:22:16 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 09:22:15 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB3771.namprd03.prod.outlook.com (2603:10b6:5:4e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 13:22:14 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:22:14 +0000
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
X-Inumbo-ID: 0f2121c8-c176-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650547337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=t8julXlOoNYBqtFkpFb4nXUExQj90ge4lQC5Ly84gfg=;
  b=iXyEyQpdNrYDBFd5bP+PqsHVIvCoO3V2lWChOmOpZ8fAy3SdcBq7HUJk
   GmlVtWQE/LsVo1SUclYWnagLwXCtnzMCmDxeQ8+iU1ycGffgwuXl4WW9I
   e7FTiSGJrdYqNKLIePmKsLa7tA8Pl6vZYFeE7CcU5VqdZjQZ89x7+1Uvg
   E=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 69007273
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QYDs6qsTWUENs+y4/n18U5bdb+fnVCJfMUV32f8akzHdYApBsoF/q
 tZmKT/Saf2LZmPzeY1yboS2/E0Av8Tcztc1TwVrr3wzEC4V+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/X4
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8lFPDlt99FECBeGh5gbaJ3pYb7C1ug5Jn7I03uKxMAwt1IJWRvZMg037gyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IHmm5v36iiHt6HD
 yYdQSBoYxnaJQVGJ38cCY4knffujX76G9FdgAzE/fJouTeIpOB3+In/MNHKKsy0fMFQlFSpo
 X7Ap27lLjhPYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQv3qsrhMaHd1KHIUHBBqlz6PV50OVAzYCRzsYMdg+7pZpHHoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd1LUZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:acri96vzyyHP2ORWQFueMeMb7skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPMs1NaZLXLbUQ6TQL2KgrGSpwEIdxefygcZ79
 YYT0EcMqyOMbEFt7ec3ODQKb9Jrri6GeKT9J/jJh9WPH1XgspbnmJE42igYy5LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUsEPpZmfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="scan'208";a="69007273"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lX2SthwrUQ/YIADe5wZ0yXXTWPCtgLF1RH2dAeo+TITMiwhQPE7y0Obm/vp5otIPpfVvrEnr7Fq2A/S3tHYav6f6s9j7kWkq2S/wTvhP1PSXvD5o2o1vbQW3TCrRux+Mol4i0d6IUhp7Nn+/3UAgvHEdpUmoX94xzFm1/EPIOqHMZwzIQ87sFaymIslg7CFo8PF8PqvuYKOp+0/zvhDFos7yDaY9KctbKMeJ8yisJLQ94rB25S4P8joGCN6ZLjjMP+vtJwgkv/kNnToI1qfe553GBcri6ILZmIN/Xj0nwTO14FvAZLvU8QrsaeSkQo6Jz5ZLJsqmTcyGfHotbo1T5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=726ON294pXNt7c/3gsJ1Z+Ba/nN1vU6Da+G2qEPvwDg=;
 b=InHwxIemJPfVUmwg1QUudFLEgbO9AyoQoBY3PX21CtPT6J+KU9jvl+cYovnfIY4o8raD6Xwc0MRgma/+rJNPuzQrwwGBhDHPSilY8wbci+LN73/FUWGUimLaYdA5EDDjblBiHNbjA5N2SlRdRJI1r1jA1ayuqpN3ZCHfK8EuSvy0yIuORkZRbb6U+6P8mgJiN4gw1im2Q4gjMP0I0StEBQNCh3TXooi3r9q6vR+TMqliXaW51poqlmHuHL51tGBeTkfLX/pbbQJzJDP+KE6gBoEwBimAYFHcu/5Bozcz081wFMl8hGHF1dIAjrRtaNUInHdlK872LXGRfLm8ITxwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=726ON294pXNt7c/3gsJ1Z+Ba/nN1vU6Da+G2qEPvwDg=;
 b=ep2ptWBSGhvmUNG5k//D2107BLtD80ac7BUM+4w97PyJfz3aW+QDL07vPJhqCvgGpZa4eyp1fURp4gd5VJkHi//jo7UTHP6kVUVDD0uMoY0NyUuW6aQPOxJKHHhRhO8val9F+zYpqcXhT/CKk+7ZSnngWlesaStgCIfmGRmoGao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 6/6] x86/ioapic: mask entry while updating
Date: Thu, 21 Apr 2022 15:21:14 +0200
Message-Id: <20220421132114.35118-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421132114.35118-1-roger.pau@citrix.com>
References: <20220421132114.35118-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3b82e05-6ed6-4f41-b84f-08da2399f2fc
X-MS-TrafficTypeDiagnostic: DM6PR03MB3771:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB37718EC3C9F5DE47049411908FF49@DM6PR03MB3771.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hReYVgCXeBfLRRYWkepBFYpuFUQA0kEkR8OeIulKXfFr8KAxEeZDe84BDIa2xFck/FjPS2JcF6oGhJTvSDIqoILtZaTOeyMu4uW8l9TDCbOR7Vk+d4lyPlKyBN1utjWsSkktIj/LNxnxBKwbj83rTZ22qIrg2yr8OKTL1PNOOWensgvM5CmWP/+jnYKRtDt/YlMFEvuYbvsN2Gpn1LqZOV4o+FEV0v3+9T8sLbMqyXsqDWnfJKcKxC86A97ubZv/sre85ma40PKZNrW9bIgEajnBS1KMZ9OgiWAyS6EQs7ylGW7Vi3XfE5ZuDFFwH27aqPOV+iuz2mm2ITm71ryVZx5jRW3mFHhSv/470pY17TAO3+/0qjPca1bjI4yK5XbgQFZRVje8/lTbPNcYX0WRvyWwUbyXNRRy8+HqceAJy4NxP+BBf/1YG2R+CZX9NRIm6855MZR/yGAgGi8k9FzPinbOjPmqR/PKhyxaZ2FDeoQNCvLhG2y24JKXDxGIzvFj45qPihRlTIXLSRHQTvQfpb59zu5gBgPVqnNzKQUvA3KpaHR+8WFXREVYX5t8Pod26kz1PJJ6YCqUFuDuNaPMwoTz1Bkvq1gUlnCTaWyHaG+WQx1VDeit4o8ODSDNuxsZl7+2V4iQuURWEFroULXKRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(316002)(186003)(2616005)(26005)(5660300002)(83380400001)(2906002)(6512007)(4326008)(8936002)(66556008)(6506007)(86362001)(66476007)(38100700002)(1076003)(8676002)(508600001)(54906003)(6486002)(66946007)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3hBUUZLcHR3VkdJdVkrd1dtd1VqZERXU3RxVGpodWY2VndoWkFYSXp4WEJQ?=
 =?utf-8?B?MmJCQk1lY0JWdkJnWklBMXBrNXB3cTB1dHBUUlVnQWtRZ1NNYlkxcnNzblFM?=
 =?utf-8?B?VmVpM2I5Ukpyc1NOVkhkQTFWdzlQU2hWdGZYejNDNWJpdEJHTGVvWlE4RnEr?=
 =?utf-8?B?RGZHYUtnbE5GWU5WYWg0bXdzSStlaEFnT2tPMTFVSWdDb29QRkp0VFc0TjJ0?=
 =?utf-8?B?Q1ladVMwcG43ZU8zeXkzU0h2TFE1T0podWx5ajdwbGNuTHhlc1l6MEZXSzZy?=
 =?utf-8?B?TFFXdU9temN4TUlZWWlEQnhlSVVWTDFLTWtXbEF2b2JUK3ozSTZRUmRhSnI2?=
 =?utf-8?B?UXlDOGlKY1lMaEkxeHl2REZvazhHODNzU2lwTFk1SmFTK0FpdmhHQ0xIRnQ4?=
 =?utf-8?B?MVZvdGlrWlhrU0NWOXh5VGh5NVc0RTl2c1J3OHhZb2JnRDZkUjBCcDJTY3BY?=
 =?utf-8?B?bjBUZnpVRisxaXpyS2ZITTRLdFdpZUtEdEpZVzg4ZVBzM3dPQ3EvaG1JWDFG?=
 =?utf-8?B?RDlHVmN3cFlzWE1jMy9oRUU0RnZadW5RNmhTSkp3NTNDVTd2bjB4Z203VHFt?=
 =?utf-8?B?bCtqMHZpS2sxTmN5WHpKMVZDWExsQTA2aDhVYUpoNk44bFN3N0ppSDllMDYx?=
 =?utf-8?B?aGZvZWM2ODEvSGlscWNMbzNROFlVWnpYYWhmSmIrbWw2QnpDVUNTbFhScUFj?=
 =?utf-8?B?K05PVGtJaWh4NjEzNm9zeEgvcW1UUzYvWHZPa3RaMUJRN0NBN0JjQzRyYjlw?=
 =?utf-8?B?b0tpS0ltSXlSWTUwK25ESEZ1SkJjb1ZwZnB1VzBnRHFDZjhRMFZ3cHN5T21u?=
 =?utf-8?B?a1dBdVJNYmdXL3lreVpVaE9qNEg4bnNDNEIvVXdOaWJuMTk2d0Q5bG9neFA1?=
 =?utf-8?B?RzZ3ZEpDaU1xM01HclJOaE54K2oyTnVZemFpb0FrekJEVFo2Y1psbGZva0V2?=
 =?utf-8?B?OWR4Wm5zM1hhVG1SNWUwN0R0QXk3T1lxa0xlUnBURXMxeVAwUng5MHp0VGFK?=
 =?utf-8?B?blN6YWx6eEsyYVJJSEFsS1JoQzJSeURRcmo0MUp1Y0xSL0s0enZIQnAvTlpm?=
 =?utf-8?B?NTdGQ3JZMW1sUzFNOTFuc3hKZ3oxaGlJK1VmZ2dSbnEvdjBWMGF5V3ZlYzZ1?=
 =?utf-8?B?dnpxV1hiWno4ZHhueWh1VHBVVXNRTHpzUnRIQ2VYM2oweHljVmUvZ2d3NFI4?=
 =?utf-8?B?VEwwOUhCaWQwN2pGbDhpSlArYlhudDI1dlkwWnJ4MG9QNDE5MU96MlFqVUU1?=
 =?utf-8?B?N1c4TjQ1NC9YaGZnZjVFa0lZdzFWSEprTFRRWmJFTUJQbXZNNGt4TElCY3NJ?=
 =?utf-8?B?amRjWVN5eXkwTEQ4MnpMYm12NTVXN0w0TmxEQW9ub1J2Nk1PWmdjVGxUaHpG?=
 =?utf-8?B?SldvVHFibTl5Tzd4eTY4NVk3cmlCRWN1czVaRWVROXNxUUwxWWRJRnJNcjBo?=
 =?utf-8?B?RFVacXMySWRFN2psUTVySG9tQTREV0RFWGQ1K2JnaFRYcHJZeHpHWCtNWDdj?=
 =?utf-8?B?T3FOQ1JXa3U2K29sZGdLa0Jhc0FFL1B6bHpsNW44NVl6NnEvQ2dGYXhrRFdR?=
 =?utf-8?B?THJNc0Fya2FPODErZmNtS2J4dW13RHB4aXk1UWhESWtETEsydnloMG5laXBa?=
 =?utf-8?B?NnpWRjhLVDhyUXhhejI0UWxoMmhSZW1McWRpRWNranhidnF5clFkdHFWejli?=
 =?utf-8?B?TTVveUM4WmsxM2RUSmRzSTlLUW90dHVwQVNTUVZwSmNTQ05IZ0w3aWY3K0Rv?=
 =?utf-8?B?TTNadUhuVUoxbTJ5U01PakFRbGs0eUQrL25NdWlwR1VyNU1WZnNNaUNHMi9I?=
 =?utf-8?B?ODlYOWpYTzV4NXJVb1NBa3l6c1R3OFlPNG84ak50U0w4UElzcXhGUmtWZkpJ?=
 =?utf-8?B?ZGFjWDhTcUlUN2xKNTlrZHdPU09YTVl4QlVNUmZUKy93VFBBNXdvNWNlVVNq?=
 =?utf-8?B?UG9yT1NsdWdmUk1RUVZDeVhGVzBOVjFjUlY2Vk1OcS9BaldzTW0rU0F0dVRT?=
 =?utf-8?B?VUk3bThLamtRbm9KelJxUENNWVdSbzRPK2JMK3hnK3dFMGwraWRTY0RNQk9T?=
 =?utf-8?B?RTdreHlKNGJtVDRjQkVEc0pDU2JZai9EQkJkRXU2Vkgwc2ZPMkxwbFZrbjF1?=
 =?utf-8?B?U3BMYkhlTFk0T25nUSt1MFI2OEJsNGp0ZXBnaE5oMjVIZGoyTUdOZ3FBbEth?=
 =?utf-8?B?Z2pnMG9RdFlMRkx0L3NMSFJGUWtBaWp5eGVSck1JbXh4TzJGTGFaU2xTWjls?=
 =?utf-8?B?YVlxK2hsNGZEb2dVQkRKdFV6dFp2QjJYRWxGREt3WnkwQWYyWU9hNlJxaFF1?=
 =?utf-8?B?MGlKcmJYbSs5eVczdGhHWEhFOVd6MG1NTVJJa3VEeUc0K1IxdGJiOFN3Rlhx?=
 =?utf-8?Q?1qKGap5XWuJLf5l8=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b82e05-6ed6-4f41-b84f-08da2399f2fc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:22:14.2150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQ5bns9muO1JXf/NhXYQKgslld6veYOsM7kUW+GBE2FqKgDAsjBzyxt+hP523r7+JL8rqd9RCJxOVo87hOxvGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3771

When writing an IO-APIC RTE entry make sure incoming interrupts never
see a partially updated entry, by masking the pin while doing the
update when necessary.  Add some logic to attempt to limit the number
of writes.

With the masking now handled by __ioapic_write_entry itself when
necessary, we can drop the setting of the disable hook for IO-APIC
edge triggered interrupts.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note this includes a revert of the first patch in the series.
---
 xen/arch/x86/io_apic.c | 45 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index f61e56f3d1..1860af7353 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -267,12 +267,47 @@ void __ioapic_write_entry(
     unsigned int apic, unsigned int pin, bool raw,
     struct IO_APIC_route_entry e)
 {
-    union entry_union eu = { .entry = e };
-
     if ( raw || !iommu_intremap )
     {
-        __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
-        __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+        union entry_union eu = { .entry = e };
+        union entry_union curr = {
+            .entry = __ioapic_read_entry(apic, pin, true),
+        };
+        bool masked = true;
+
+        if ( curr.entry.mask )
+        {
+            /*
+             * If pin is currently masked we can update the high part first
+             * without worrying about the RTE being in an inconsistent state.
+             */
+            if ( curr.w2 != eu.w2 )
+                __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
+            if ( curr.w1 != eu.w1 )
+                __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+            return;
+        }
+
+        if ( curr.w1 != eu.w1 && curr.w2 != eu.w2 && !eu.entry.mask )
+        {
+            /*
+             * If updating both halves mask the entry while updating so
+             * interrupts are not injected with an inconsistent RTE.
+             */
+            eu.entry.mask = 1;
+            masked = false;
+        }
+
+        if ( curr.w1 != eu.w1 )
+            __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+        if ( curr.w2 != eu.w2 )
+            __io_apic_write(apic, 0x11 + 2 * pin, eu.w2);
+
+        if ( !masked )
+        {
+            eu.entry.mask = 0;
+            __io_apic_write(apic, 0x10 + 2 * pin, eu.w1);
+        }
     }
     else
         iommu_update_ire_from_apic(apic, pin, e.raw);
@@ -1780,7 +1815,7 @@ static hw_irq_controller ioapic_edge_type = {
     .startup 	= startup_edge_ioapic_irq,
     .shutdown 	= irq_shutdown_none,
     .enable 	= unmask_IO_APIC_irq,
-    .disable 	= mask_IO_APIC_irq,
+    .disable 	= irq_disable_none,
     .ack 		= ack_edge_ioapic_irq,
     .set_affinity 	= set_ioapic_affinity_irq,
 };
-- 
2.35.1


