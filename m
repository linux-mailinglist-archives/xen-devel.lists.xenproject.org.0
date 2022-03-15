Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E445D4D9D39
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 15:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290822.493350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU80N-0001vt-43; Tue, 15 Mar 2022 14:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290822.493350; Tue, 15 Mar 2022 14:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU80M-0001tz-Vv; Tue, 15 Mar 2022 14:18:30 +0000
Received: by outflank-mailman (input) for mailman id 290822;
 Tue, 15 Mar 2022 14:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAQZ=T2=citrix.com=prvs=0668da279=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nU80L-0001tV-Ec
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 14:18:29 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c72c5938-a46a-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 15:18:27 +0100 (CET)
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
X-Inumbo-ID: c72c5938-a46a-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647353907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=9MPsHR97DoIpOGZHfzNhOigQex5YmJVhFOV5plhigM4=;
  b=F07RrxHSIF/oR9DK7cT3Hx1pXnnC1ruAu7erSU215+ZFgWi9ZnlFsyiC
   D46AAXr6uHR5uRHZzEkbaxsYSVAzbQdZ3Exzr1eIP+1sT5nEHuPHcCX1d
   CTkrPAaEya9vNfDgJCZAyMu/phiOQERvm4UZ6Gn/mVXRekco1AMfB4dEI
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65756320
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:u63cnqvbJttPEqhSkBTWcoaMEefnVEFeMUV32f8akzHdYApBsoF/q
 tZmKTqOM/+DYGqgftwnO9mzphwFuJDcmtQ1TFM6pCs2HiMX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jU5
 IupyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8IJ4PhldYAdiNkKAc9OZB0yY7ecEKW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pVEN2E1NHwsZTVNH0tJKNE+ptv4pV2hUWIJmXaXi/QOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMQOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO8wjxiyA+Lfx2TqiICsAcwxwWcV3juZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WvQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sTA3Dt4ade51q2VtW
 lBfw6ByC8hUUfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehs2aJdeIGW5O
 RWJ0e+02HO1FCDzBUOQS9jtY/nGMIC6TYi1PhwqRocmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnKOoNBJcgxScyRT6FKfg5U/S9Nv6zFOQQkJI/TQ3akga8pimaFUnf3P5
 XazRglTz1+XuJENAV/ihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:8E5XY6Ng8SCf5cBcTqKjsMiBIKoaSvp037BL7SBMoHluGfBw+P
 rCoB1273XJYVUqOU3I5+ruBEDoexq1yXcf2+Us1NmZMjXbhA==
X-IronPort-AV: E=Sophos;i="5.90,183,1643691600"; 
   d="scan'208";a="65756320"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTg1HWzoNOCs30EYOPA6EBRQ3tk2N9qel7QFV1yiN5AWQ5TZ4HF2F4Q/IgFV5bdiQXM/if6/+7QUNajiLjEQSPNrWFoF/YORUrtW1DxUcAKFYlPlg2AVutAUrnk4t3e0fU9bpNWKXGifF+q6gEk6xyQMBTt5504JQSSGKa+M/8DWsv4/3nxWx73qvG4cD18PuCxW3bUI3ohgeu07xNQT82/lT5Vg9c+F8uocHjL2F7YAAoKrpESCQtvUJAvzomrolMu+F48hsAFkH1Bn9ljuiBFj2dgdscgWkF4ilKSySbhN8nSoM/aN5cNk5Cfaja3gYWka2VNsQ7fFwieFw/NErw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydoKvzijOpuejbc717jjBMoXN5ikPR5XfqS80f3JJYA=;
 b=nu5CQuiLTxOxZ2fhSPEEgmZzpvpiq+0hfPbI3ehlWWG7vQtAYhoy41NCUZ+8jX7WrXsI9Lgy1fcpkBNCsoEMzLxau+Pu35L+k5WVR93+9vgvixPjn7l2o7HKN/n3JjsuRAbmB6rSiF0Clh/BSHIHdYrKg+zLJ0NJ4XaT+nJszzmgQB/F7E8iOrdK4z3NxeJvnCDSuaZ4XAex7UJ8uSJCSxXccU+ilys4trQiD5fSk4Ga9a5/P2scAX7yB3A+EiXTHlAKavoRlxO1pFoB02vZrz7f/OvRbHzpJlCVzWVZICXBdyNtvSVvxWAvYoXOq/MQPEbTFYIheWxMQVJUGpl3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydoKvzijOpuejbc717jjBMoXN5ikPR5XfqS80f3JJYA=;
 b=exBqVDW0VW0oPMHxDYTnMH5yivyC2sN14ZgK51x0b0WeOeD9B1hK4ZaArWNLhQKqhXGIN03v5QXeYAByLzHtWMJGHd3VbimB1wGeDmTqOeXINCxGMU3xkDzETKjRZDv7wHN4REdy5bW5JRCAWSXfuyqpstTn6QpKHSbDADjqy/Y=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/3] amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
Date: Tue, 15 Mar 2022 15:18:05 +0100
Message-ID: <20220315141807.22770-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315141807.22770-1-roger.pau@citrix.com>
References: <20220315141807.22770-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0449.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d667fb2-6e6c-4f79-bb7f-08da068ea949
X-MS-TrafficTypeDiagnostic: DM4PR03MB6860:EE_
X-Microsoft-Antispam-PRVS: <DM4PR03MB6860C22C7280F3CD0DCB89768F109@DM4PR03MB6860.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ml35Up2Ol1gAbdQuHZvY1C+Gx1i8Ae5l2AvFaj9qJuPnuCjjK7uZdLQ2SRmpe57UdescDwBXgK6w12BT2XJcK120NOmVh2ZproJQZrm93aMrqRWk0KDHMow0YT1ADgxFA5EcCbCn8o/8n7kCOtLmmABVgnjtHjhXMBWhy58IADRdeML64v/Zm9QkyITdR9kQ4PGb9xBNQ8PEuX4rD4lonpXayWN5wCizO8tKK2JygvmCgHiKjhbT3j1Vlmhlvuxbvh3u6uBO+dzrzF0W0a9itgblEkXha8e42VsFKe9mF/0TRxp0Rfvy9xYlngCpIllXDfANizru7mDqmkpUkFSuc7FRf8C9M2QxXQlUrREMH0qhu4I2+Xh3pwbTy+Do87eCHZbDXpHc0Q73Kr8OOjZb1dBNpzUQwpVg+qYzb4ZxnUy66LCgHBc+P2bq5ls1r0Gpgk3Hb9um6m2v1+sD9/HizL8kp+feYJhF4BywFy5WTZHkOPMZWXqNPU+GQ0CrhSqs4MgUyBb5baB5fcaNe4OqGG+SWehN55+rQ5brZfCa30gN8IHJgWT8r3E9oSPfrwRqnC+KMctyy/QbL67vHRD9Ck8ioKQhnX6CC7QYLA37UeZ3UGjUyQ8u9XJtgdCQc20q0qSa/rdZUBie6SpN+o51w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(6666004)(6506007)(6512007)(54906003)(316002)(6916009)(8676002)(66476007)(66556008)(6486002)(66946007)(4326008)(38100700002)(508600001)(2906002)(8936002)(1076003)(2616005)(36756003)(186003)(26005)(5660300002)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWVSTDhCVEp5UUlQTWhteExhb3grU0ZDTnluYmFHWDNoR2tQNlBSaWVyanQz?=
 =?utf-8?B?b3lyR0Jyb0JZbmVKRTJGcGlKL2hYSDdtRW1TS3UzY0hib2R4VmRBWndxeVdJ?=
 =?utf-8?B?RkVFS2FyUk13cUxBaVZFTW9oY1NIVi8yRHNTWkduYlQrVG15REhpUHNYNGda?=
 =?utf-8?B?MlBvUWU0Unc0LzI3TU1tUjIzU3pXZTladmFKc0R0TjlIM2lZckhGUlZzR1RN?=
 =?utf-8?B?Zy8wVWxUR0cxcmR3c2c0NG5HMjJQRExCSXMyc0RRYmNPK1o0dHF4M2VnU1p6?=
 =?utf-8?B?R2MvVE1UVXhpVE0ybVExNWdIZUNwSEs3Ny95SkZDNERiZE5zQWp1VHVUV2ph?=
 =?utf-8?B?ZFE4dzZQZjZtbkEranM3V1ltaWl0ZHhiZVViVC94SVAxVUg0MTdVZ2N6dkQr?=
 =?utf-8?B?NHc0MWF5aEtEMmhYamZ4K0EvZXkyOWFTdVA5YnBoTmI3Q1BCd0xPTGorUDhD?=
 =?utf-8?B?eC9NM2J0Ulcyb1hRc0M0V0F2bitNWlJxQ0ppbVljQm1TR09mRFp2bEwrTUMz?=
 =?utf-8?B?YWtqUnJ4RUpVbnN1dE5EY3psbnVNb2ZZWmZYd1d3Vk81WlBYYzVOcC9Ud3Vm?=
 =?utf-8?B?azdOVFJxbXRvVlU1UHNnNlViZWpoN0JyNm8rVkxyVlJIL1RHTzFtVFN4WFJV?=
 =?utf-8?B?c0p2RXY1QjkzMVFZRXdoanhhWWlZSWk1VFV5ZU1uenA2NzlJVkp1SEpoM0U4?=
 =?utf-8?B?RE8wWldDQTQwQzYyekd0NnpEbytVL1o5MVQvdVh6VW84VDFKbEZ1bXRWZENP?=
 =?utf-8?B?WDBQRXRWSlk3R0xSR0VIbHptSitFM3VXNk1USlFLVXFON1YwUmgyZ2IvM0hZ?=
 =?utf-8?B?RnBQanpsVmp2bFBoNXV3M0xRbTJINHhCZm80cWZOUUs1bTB2cW92dUhFSEQv?=
 =?utf-8?B?NFU5VzZEOVF6MlNoSE93Y2cvKzFZUldERlIrZURwWmxvcG1qSEFobmJuRDhG?=
 =?utf-8?B?TWloOXJpWEhEZEwvcjZYeG1FeTdHcVVad1Q5bnpuZ3pyUnZuN1hsSGhzbUNk?=
 =?utf-8?B?Uyt3dkpUR01UZUdHbnFEamdQR2t3K0Vqd1RCbkUwU3VLRnU2M2IwOGRxSGZI?=
 =?utf-8?B?VklXeHBvRTg3NmNWdnk2V2cwckhvSHFvWGprMEt4NjRJNFY4Zjg2Y2FBOU1x?=
 =?utf-8?B?UHhFYy81eVVtWHNnR0ZDTkhJTUROdjRQWXlxMHB2VS8zZGxTQzlBeXdEbmN1?=
 =?utf-8?B?K0hzRmp6MGlXbDdBbS9IbWxkUitZNWxQQjVuN2ZoU3NDOEFXMUtRYWhTTkY3?=
 =?utf-8?B?cmlUc2ZRNUJlTEN3cE96NzRTQlZKU3dhYXduNmM1amVEVjBXY2dOZkh1eGQ2?=
 =?utf-8?B?Qnd5ZjZmODRoM0I2RGVsdDlEcDFHYnc5OGt1N0FMV3J3akdOZWtaRG14U1ZI?=
 =?utf-8?B?bUJJMXM4am16Wk41S2cxNU1JUmM0RG5MUC96Rnk4WVNRZ3pyeWRSV05MT3pV?=
 =?utf-8?B?ZHJaVWx0RU5oMVdvQ3NXSGdQeGtTajBsZHFBVUJ0TDdUWU5QT2VRb0RYYXgv?=
 =?utf-8?B?RG5ZYnRlbHBhWlN2amJZMExSczk1ck9RS2xPZkxNS1BheEhFdkN0cml1ZlA5?=
 =?utf-8?B?ejduZlRhbld3ZENsR2pMUGtyckhPcjdhU3JHYW9MaklFYk8yK1U4Z255L29S?=
 =?utf-8?B?OWNLK2JHNkcvSE95eDBDaTFLNFJwL01jN2hZa1p1L0k2LzRrOFdLSWNmZllD?=
 =?utf-8?B?M0pvalgwK2dFaERHbVorL0o3VkhzQUNPVmxBSGJxOG94MXIvU3hpeVQySFVa?=
 =?utf-8?B?UlNSQktDVFNRa0R0TEtkSFI3MjdKVTdra1ZFNGFuQ1lReVdDL2FGV2FwNzVk?=
 =?utf-8?B?aE1zWEFyRUJ4Wjg5c1ZYcVp0dFNCVVJxTWJBSWtRU0lDY2wxNzZYdWN2V2Y4?=
 =?utf-8?B?ZS95cWIyN21vN2s1N29JaWlvQ0p6anBQZnNOS3NtVEJtbkVabmx3WGxHRjYz?=
 =?utf-8?B?QUFwSi9rNklObm8zUExjWUFaa0MySGVtOW51K3RvRGxqRkFJTURHVVRYVDdL?=
 =?utf-8?B?djFiaHJ5VTBnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d667fb2-6e6c-4f79-bb7f-08da068ea949
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 14:18:22.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2QFGp8HIxJUHTfnvt4Yw52SS5jNzyKt74vk6BVFzqWoTut5ff5QtE4vXVYmfmuxVuOV0a7+ssyGB42O6I/8Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6860
X-OriginatorOrg: citrix.com

Use the logic to set shadow SPEC_CTRL values in order to implement
support for VIRT_SPEC_CTRL (signaled by VIRT_SSBD CPUID flag) for HVM
guests. This includes using the spec_ctrl vCPU MSR variable to store
the guest set value of VIRT_SPEC_CTRL.SSBD, which will be OR'ed with
any SPEC_CTRL values being set by the guest.

On hardware having SPEC_CTRL VIRT_SPEC_CTRL will not be offered by
default to guests. VIRT_SPEC_CTRL will only be part of the max CPUID
policy so it can be enabled for compatibility purposes.

Note that '!' is used in order to tag the VIRT_SSBD feature as
specially handled. It's possible for the feature to be available to
guests on hardware that doesn't support it natively, for example when
implemented as done by this patch on top of SPEC_CTRL.SSBD (AMD_SSBD).

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Only expose VIRT_SSBD if AMD_SSBD is available on the host.
 - Revert change to msr-sc= command line option documentation.
 - Only set or clear the SSBD bit of spec_ctrl.
---
 xen/arch/x86/cpuid.c                        |  7 +++++++
 xen/arch/x86/hvm/hvm.c                      |  1 +
 xen/arch/x86/include/asm/msr.h              |  4 ++++
 xen/arch/x86/msr.c                          | 21 +++++++++++++++++++++
 xen/arch/x86/spec_ctrl.c                    |  3 ++-
 xen/include/public/arch-x86/cpufeatureset.h |  2 +-
 6 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index bb554b06a7..4ca77ea870 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -543,6 +543,13 @@ static void __init calculate_hvm_max_policy(void)
         __clear_bit(X86_FEATURE_IBRSB, hvm_featureset);
         __clear_bit(X86_FEATURE_IBRS, hvm_featureset);
     }
+    else if ( boot_cpu_has(X86_FEATURE_AMD_SSBD) )
+        /*
+         * If SPEC_CTRL.SSBD is available VIRT_SPEC_CTRL.SSBD can be exposed
+         * and implemented using the former. Expose in the max policy only as
+         * the preference is for guests to use SPEC_CTRL.SSBD if available.
+         */
+        __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
      * With VT-x, some features are only supported by Xen if dedicated
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 709a4191ef..595858f2a7 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1334,6 +1334,7 @@ static const uint32_t msrs_to_send[] = {
     MSR_INTEL_MISC_FEATURES_ENABLES,
     MSR_IA32_BNDCFGS,
     MSR_IA32_XSS,
+    MSR_VIRT_SPEC_CTRL,
     MSR_AMD64_DR0_ADDRESS_MASK,
     MSR_AMD64_DR1_ADDRESS_MASK,
     MSR_AMD64_DR2_ADDRESS_MASK,
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index ce4fe51afe..ab6fbb5051 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -291,6 +291,7 @@ struct vcpu_msrs
 {
     /*
      * 0x00000048 - MSR_SPEC_CTRL
+     * 0xc001011f - MSR_VIRT_SPEC_CTRL (if X86_FEATURE_AMD_SSBD)
      *
      * For PV guests, this holds the guest kernel value.  It is accessed on
      * every entry/exit path.
@@ -306,6 +307,9 @@ struct vcpu_msrs
      * We must clear/restore Xen's value before/after VMRUN to avoid unduly
      * influencing the guest.  In order to support "behind the guest's back"
      * protections, we load this value (commonly 0) before VMRUN.
+     *
+     * Once of such "behind the guest's back" usages is setting SPEC_CTRL.SSBD
+     * if the guest sets VIRT_SPEC_CTRL.SSBD.
      */
     struct {
         uint32_t raw;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 01a15857b7..b212acf29d 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -381,6 +381,13 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
                ? K8_HWCR_TSC_FREQ_SEL : 0;
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        *val = msrs->spec_ctrl.raw & SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
@@ -666,6 +673,20 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
             wrmsr_tsc_aux(val);
         break;
 
+    case MSR_VIRT_SPEC_CTRL:
+        if ( !cp->extd.virt_ssbd )
+            goto gp_fault;
+
+        /*
+         * Only supports SSBD bit, the rest are ignored. Only modify the SSBD
+         * bit in case other bits are set.
+         */
+        if ( val & SPEC_CTRL_SSBD )
+            msrs->spec_ctrl.raw |= SPEC_CTRL_SSBD;
+        else
+            msrs->spec_ctrl.raw &= ~SPEC_CTRL_SSBD;
+        break;
+
     case MSR_AMD64_DE_CFG:
         /*
          * OpenBSD 6.7 will panic if writing to DE_CFG triggers a #GP:
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 1408e4c7ab..f338bfe292 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -402,12 +402,13 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
      * mitigation support for guests.
      */
 #ifdef CONFIG_HVM
-    printk("  Support for HVM VMs:%s%s%s%s%s\n",
+    printk("  Support for HVM VMs:%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_MD_CLEAR)   ||
             opt_eager_fpu)                           ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
+           boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_VIRT_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            boot_cpu_has(X86_FEATURE_MD_CLEAR)        ? " MD_CLEAR"      : "");
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 9cee4b439e..b797c6bea1 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -265,7 +265,7 @@ XEN_CPUFEATURE(IBRS_SAME_MODE, 8*32+19) /*S  IBRS provides same-mode protection
 XEN_CPUFEATURE(NO_LMSL,       8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 XEN_CPUFEATURE(AMD_SSBD,      8*32+24) /*S  MSR_SPEC_CTRL.SSBD available */
-XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*   MSR_VIRT_SPEC_CTRL.SSBD */
+XEN_CPUFEATURE(VIRT_SSBD,     8*32+25) /*!s MSR_VIRT_SPEC_CTRL.SSBD */
 XEN_CPUFEATURE(SSB_NO,        8*32+26) /*A  Hardware not vulnerable to SSB */
 XEN_CPUFEATURE(PSFD,          8*32+28) /*S  MSR_SPEC_CTRL.PSFD */
 
-- 
2.34.1


