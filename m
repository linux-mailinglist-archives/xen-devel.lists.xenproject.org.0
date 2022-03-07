Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A481A4D0440
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286316.485803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGN0-0000ay-MK; Mon, 07 Mar 2022 16:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286316.485803; Mon, 07 Mar 2022 16:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRGN0-0000Yr-IZ; Mon, 07 Mar 2022 16:38:02 +0000
Received: by outflank-mailman (input) for mailman id 286316;
 Mon, 07 Mar 2022 16:38:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gfv=TS=citrix.com=prvs=0582ef7ee=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRGMy-0000Yf-BL
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:38:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1537e11-9e34-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 17:37:58 +0100 (CET)
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
X-Inumbo-ID: f1537e11-9e34-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646671078;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Ablg7d6y+ZeMIfab2ud+fkaw258NmbzhOzrFF28HJZ8=;
  b=N29XEt7VdTL6YJoqSXnO7/Ik+2u2sJR4b4C1SZwkcbzjVCKijlXablee
   /ef1/nU33WM62T/ClQripjS9lRRs3raHAhcJb1GHf1Eag+Ybq6LrEOUDs
   8VvsfqxCBsaAHpdtzLVK7BWthTowZb3s642+aqL7HBUNiy0/tUSDV5+Af
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65637023
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Mw7Z4qiqhmOUYhjDtIKOxv9RX161fxAKZh0ujC45NGQN5FlHY01je
 htvWG7UbPuOZGb0ctsnbou/8EsDsZHQmt8xSlNvrSBjRSgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvS4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YQkDBb+dgfUYakcGLTolNrRi2Y3rD2fq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDO
 ZFGMWA0BPjGSwB1IQhUT6wCoMaDi2nWTgx4s2qPg6VitgA/yyQuieOwYbI5YOeiWcVUhQCZv
 STPp2DiBRcyO9mWyD7D+XWp7sfNly7mXIMZFJWj6+VnxlaUwwQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEAKZAVTOcU3sfZoGwIxj
 VSQu/LbKRJw5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEI89TffdYsndXGipn
 mvU9HRWa6A70JZTv5hX62wrlN5FSnLhagcurjvaUWu+hu+STN70Ptf4gbQ3ABspEWp4crVjl
 CVe8yR9xLpXZX1oqMBqaL9RdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 BGO6F0Ju8QDbCfCgUpLj2WZUZhC8EQdPY69CqC8giRmOPCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbiilkTP+efONRa9FOZeWHPTP79R0U9xiFiMm
 zqpH5DRkEs3vSyXSnS/zLP/2nhRdSlrXc2t8pcPHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu2NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:hxPhXqv7iqT2oeptwZVIOAil7skCgIMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK5yXcT2/hqAV7CZnichILMFu9fBOTZslvd8kHFh4xgPM
 RbAtdD4b/LfCFHZK/BiWHSebZQo+VvmJrY+ds2pE0dKj2CBZsQijuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 929lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQlo+a87bW3HAb0cYa
 dT5Jm23ocWTbraVQGTgoBX+q3hYpxpdS32AnTruaSuokprdT5CvgglLfck7wY9HaIGOud5Dt
 v/Q9RVfcl1P7crhIJGdZM8qJiMexvwqSylChPgHb2gLtBEB07w
X-IronPort-AV: E=Sophos;i="5.90,162,1643691600"; 
   d="scan'208";a="65637023"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1BGgqEe2aXiHe8GN/qRS4Fx0spIQdgZxun5gqoCNip9FG3j9BkWzOXm/SiBASGnRV9k1QJXCrMAx4S2RpL7kp5bfZwzdnIzn41nfpKD4YzkFCWymZTxHM6l7AAOdmJ25MUFd3wrliYS7gguo9kJNG48Zga9FScvvOz49kMHHwSWNWgExW0cJIAcdkOXJNfY+2pUNU2hFUzr8n9DzP+bXUNPiYTcHmrgjjZdvz951uooMbYtlleJBiRgr+S0c9s9Lz50MBKEO73YbMG2xnyNYdImf1Q0ydiKm5kMQdvOPH+B7rZtf5Q+2u1TLx2Bymnv126bT01xskSBt5Wp36QeEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awF+pMLl+Var2LckzL1CExaM5qE8ESGC675Kwer2Mw0=;
 b=auyZPEryupSYxB02t7ROjXcezMsLN8jnYmiDROQwSr17hMx+n5Y/QW0XoJzjLVomohGK3HdUOnGoLfMwpshc054MiGvVLxDwOwMNire/Txy0CxftteqNSLahx6fxhXcyvRG2Sq8XsjEgoXX9FoYoKKRI99/zhHn/cLOCykhyhfcj3rCx39fhdC7JrLkWf2ZWpQibXCaGfxgZOdL7y6eP1tAbefzsCy4lLe2tMVuujBOZvJy5MxE53WTbsL5WOCdNJZEYRi6i3o8yu9GQsHmmp2ze7nnFi/9WaailKl2Igzg1S87xdxqvybq4Mk51N39RVgK6GtKSowyO96p59Y8gng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awF+pMLl+Var2LckzL1CExaM5qE8ESGC675Kwer2Mw0=;
 b=mDQ1lN22wDi7kZtzVkEEu0okhfzUaDq9C86UkU5v/n9Wrdz3twM7hRNpIqM5Gq7gH37MWvqCvamwdoUPt4S+LUGOMisITHUZE1xV9FK9NNPqmWEFCLeEJNBL4uGW2O6QHKx2EN+af/q4ModsWZaquRaFMRHqSrrV1QoUtSBFSJw=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Alex Olson <this.is.a0lson@gmail.com>
Subject: [PATCH v4] vpci/msix: fix PBA accesses
Date: Mon,  7 Mar 2022 17:37:44 +0100
Message-ID: <20220307163744.74030-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0106.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aca318fd-56ec-4be8-e932-08da0058d1c9
X-MS-TrafficTypeDiagnostic: BYAPR03MB3573:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB3573CA05CEA5DE3C46C27ABE8F089@BYAPR03MB3573.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r7w313JaE7uf/wj2Z3C/6PCCrGYAOTBjwguzja0PzZEudR5RTnIqXXbim6CluC13gks/xS1IxuTP0j0coerTdVfsbBdONRHA0bevBXrjbyiZ37qA1KBCjUpd50/i4rR2Jp6y12mXXY10yNia3/3kU4hfzbpoBWhj3CAairNhhD1yvRZOFj3upadqG9qRJIZokby8WA78i2Nd1Vpo8hy69IcRlmtfhfUv5m/5IFs2nlQPYaU+A7pjke656bsJpfqhiPzTYd7RLM4vWNsAhIy510wWDUKUvzhJmVYer+NwjLs31e94E0gpiuhR/ry+Xfyk2/sxKuj63vvvuRCvhi9lr4WP7faG3teakNC+W2s0X8Rk2OBE/EXh1pGdBaTQ+deLU7OCo9VrTLoP0a3CPow0pFI+/moDHlt3kELTzaPL+YgfGU3pkQHxsa3j/Kx7BDnhL2vfYzC7qFecTBV8lBPCMuN6g9cs3AMfoT4BCe3VZuNUQDcV7L/dseY/c/+N7EYVnC/s2QFPY0zAC1LDGf+D8X7PwP7rmnD6vgH6lC0OCfxlRMCuYqaOLsmmNej+cyDGQlLmJanX9/s+5k7JQ4ycOiOQEhRIjWi+8nO1LpKm8m+kMLT2cTzkRsPXeTih8IKwUK7tF8i2KiICxI1RKTglnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(316002)(54906003)(6916009)(66946007)(66556008)(66476007)(4326008)(86362001)(5660300002)(8676002)(8936002)(38100700002)(6512007)(6506007)(186003)(2616005)(6486002)(1076003)(83380400001)(26005)(6666004)(508600001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2M0RkpCWWNTNFJJNWVEcEUrbXRiN0xsNEUyMUlxV1E3ak81TGEzZWhvbHhN?=
 =?utf-8?B?bFJsVHFqNVJVMmZ3YVN1RENqVWxOMHBqakZaNUI3cVZhZ3NWQzdwWGx3ZFZk?=
 =?utf-8?B?Y3J5eE42QWFXK1JPWVdjSWEzbTduWDRjZEUwSmN0RHNEbUdWbW5jQ1Z0SUlC?=
 =?utf-8?B?YUU2eCtyV2FyTWhmYVBvQW9yaGoyMVd0ckpwWlpCSFVuZi84WnVWSGJlZ09p?=
 =?utf-8?B?U244Z0lsUlNiVHVMV21wSEo2OVVXM3gxSy96SU5YOHRpOVVKTHR2NTNwVk9U?=
 =?utf-8?B?b3lVNlRobGZPTTJwc01wOFk5MEtZVytsVVI1V2VIek9scFRqamJGRHBpZFpp?=
 =?utf-8?B?cForUTVtYlhvYzV0UitCMTUxcnVSUDNGa2ZTd1ltYW8wckNmbHZ1MnRvQUMw?=
 =?utf-8?B?cGY2RTY1RjRyS3lHZjFmU3JBUUdkV3ZveHRFdFU4YmIxU0Uzb2RSYzVCNW1C?=
 =?utf-8?B?RnE1NmdhaFVrekR6cmYxbGdiZzdRV0lnWkJyNVdrWnFuRU8yZzZ3ZUYrY3Mv?=
 =?utf-8?B?eUM2NkgvWGhXOTZYMmFzaHZuaitBRnc1SVJVVERsSWJEcm04TktrR0hoVUlZ?=
 =?utf-8?B?aWtXcTRZNGl5eWpPcVNtOGYzSitWRlFCL0FIVTcxMXY2OGtnV2V0ODB6bFhC?=
 =?utf-8?B?T0FWbndMN2Z2NUtycnhDQ0tXWWcxdC9KMXdUWWFFSjVpNkNrM1Q1UXJHMFh4?=
 =?utf-8?B?Y1hFT0JBUG4rYUhRRzFLVzVwaHZJYWtrRXplVjlkaHZMNE9QellZWktwTUdy?=
 =?utf-8?B?aFdwU2g5M2E1K2ltVWFSd1dMUXJJYlNiczJTOHF0Tjh6U3JIMW4wTDhReEhn?=
 =?utf-8?B?U0ZYNVpvdmN4RDJ4c1BGbUhyM0NGSVJaL0h1V001VDNXWXFpMDI5aWdDdVBB?=
 =?utf-8?B?RHUzRHQ2eUpWSVB5ZEhzdE43NjRycXJ0T0dCaWhxeWhDdWdjcXNINllObWNG?=
 =?utf-8?B?aWFwTWgzZ01xejVlK1VmNXhmajRra3ovS0pPWTZoR1ViWkcrSWtWQU5GK0N6?=
 =?utf-8?B?R084TzRDSnhwbXhmcnN6bFlsWmt1RS9FdUgxSE5aZEptZTMvVzRZcXNFYUVQ?=
 =?utf-8?B?SGhLalgyS2Q2eHUycS9OMEZBS2o2REtrTTE4a3ZrSlBFaG9ZMmZ2UWY2TG1a?=
 =?utf-8?B?SE1kVWtjRjlaUWJBY0ZZVUF0R1hDdUJHNE1lUFJqcWxLci81SGdnNFdXTVBO?=
 =?utf-8?B?eWVlM0RBT1BTcXVnUHpFaXgvV0JWeHYvb2h1N21xbDJ3Q1J6RWF2cFNIUGRu?=
 =?utf-8?B?UnI3MGtsSWlPTlNHRFdtSFhCNEJXTkVlY20rZXc0KzRkeFlkYXNpcms1TTJ3?=
 =?utf-8?B?dExPMDg5UUxJbUlQUHZmcDBRVXQrWVdoVU9KNElveEZhajM1ck9qZGRDM1hH?=
 =?utf-8?B?dnZldk5EbmQ5ZWprK1FZeWQzQlhlY2wrRGlTKzdyN1ZUWXN5YWZmMGE2UXp0?=
 =?utf-8?B?YjZZWWdSM08zMmZBRVhUd09xbUNKOUxjdXhqSDY4ZmhRL1hFTjBPVFhqOGov?=
 =?utf-8?B?azc2RWRpaUh2QnBzN21SNkcwUU41amE0WTJ2eTBXSFhRbWdBUUszQTlXNWQ1?=
 =?utf-8?B?RDJpNGhkOG1ueFRFOGk3d01OWDlLaHlsOC9HN0hFU2VZTHovYmZ6eWZwQnhq?=
 =?utf-8?B?UkU4Z3BPdDc3WnRPMCtocmpsUGwwd2xzbVJoUDBpVW5YdzIrNVgyZEF5ZC9F?=
 =?utf-8?B?NkIrWVFxUlBwZDVhS01Dc3F5UWtJNDZzVFZEak1OVGIvUEc0WFBzNjdFeXJW?=
 =?utf-8?B?aTAxVGtTM0hrOUdiTmNBdnNsUVlnYnJjOGx4TFY4R1VBSlc1RlU0YTQ5bVdj?=
 =?utf-8?B?aTcxMW9ZanBCeTdadnNFRFpqQzVNRit1dXkweWNHaEUxTjAwOEc0S2hQQlNm?=
 =?utf-8?B?bWVjMUlhLzdQZnJRZ3VjMXpuTC9UclU1ckdZUWtGeUt3LzB2MXNtWDhVQWQ4?=
 =?utf-8?B?TkI2THZzNm1qcHZTSm5OdUlmUTVvMWxiVVpqeUtaeUQvTVd2TzVKb25XUXF2?=
 =?utf-8?B?MEhHbm00VWZFcG1Lb0tmSlpiZ3JMVWo5MjhRWk03eS9RMmZEM01iV3pRYjcr?=
 =?utf-8?B?ekZ1L0x1SWNMR2lEMm9SaFBGZGVBRjhuRE4xT29mZUJEajZta3ZFQnVjZ0Fz?=
 =?utf-8?B?ZTF5SFZyL2lwTDczc0hrMkp1ZzRXUHdTNDdMQ1FHM3JrU1lMdWF3Q1dpSy9D?=
 =?utf-8?Q?imUVzMxhzSNC/fx6VDVN2kc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aca318fd-56ec-4be8-e932-08da0058d1c9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:37:50.6107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPKhbbjFNFI+1INUMxa/mJWm5hRN1gDTdoDFagZvSYDqPgwyeSZFKwoW7cULcKbi4SmofgRiPRmCRJQdvCyJ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3573
X-OriginatorOrg: citrix.com

Map the PBA in order to access it from the MSI-X read and write
handlers. Note that previously the handlers would pass the physical
host address into the {read,write}{l,q} handlers, which is wrong as
those expect a linear address.

Map the PBA using ioremap when the first access is performed. Note
that 32bit arches might want to abstract the call to ioremap into a
vPCI arch handler, so they can use a fixmap range to map the PBA.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Alex Olson <this.is.a0lson@gmail.com>
---
Changes since v3:
 - Use {read,write}_atomic for accessing msix pba field.
 - Shrink locked section.
 - Constify pba.

Changes since v2:
 - Use helper function to map PBA.
 - Mark memory as iomem.

Changes since v1:
 - Also handle writes.

I don't seem to have a box with a driver that will try to access the
PBA, so I would consider this specific code path only build tested. At
least it doesn't seem to regress the current state of vPCI.
---
 xen/drivers/vpci/msix.c | 64 ++++++++++++++++++++++++++++++++++++++---
 xen/drivers/vpci/vpci.c |  2 ++
 xen/include/xen/vpci.h  |  2 ++
 3 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index a1fa7a5f13..63f162cf5a 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -182,6 +182,38 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
     return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
 }
 
+static void __iomem *get_pba(struct vpci *vpci)
+{
+    struct vpci_msix *msix = vpci->msix;
+    /*
+     * PBA will only be unmapped when the device is deassigned, so access it
+     * without holding the vpci lock.
+     */
+    void __iomem *pba = read_atomic(&msix->pba);
+
+    if ( likely(pba) )
+        return pba;
+
+    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
+                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
+    if ( !pba )
+        return read_atomic(&msix->pba);
+
+    spin_lock(&vpci->lock);
+    if ( !msix->pba )
+    {
+        write_atomic(&msix->pba, pba);
+        spin_unlock(&vpci->lock);
+    }
+    else
+    {
+        spin_unlock(&vpci->lock);
+        iounmap(pba);
+    }
+
+    return read_atomic(&msix->pba);
+}
+
 static int cf_check msix_read(
     struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
 {
@@ -200,6 +232,10 @@ static int cf_check msix_read(
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
+        struct vpci *vpci = msix->pdev->vpci;
+        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        const void __iomem *pba = get_pba(vpci);
+
         /*
          * Access to PBA.
          *
@@ -207,14 +243,22 @@ static int cf_check msix_read(
          * guest address space. If this changes the address will need to be
          * translated.
          */
+        if ( !pba )
+        {
+            gprintk(XENLOG_WARNING,
+                    "%pp: unable to map MSI-X PBA, report all pending\n",
+                    msix->pdev);
+            return X86EMUL_OKAY;
+        }
+
         switch ( len )
         {
         case 4:
-            *data = readl(addr);
+            *data = readl(pba + idx);
             break;
 
         case 8:
-            *data = readq(addr);
+            *data = readq(pba + idx);
             break;
 
         default:
@@ -275,19 +319,31 @@ static int cf_check msix_write(
 
     if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
     {
+        struct vpci *vpci = msix->pdev->vpci;
+        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
+        const void __iomem *pba = get_pba(vpci);
 
         if ( !is_hardware_domain(d) )
             /* Ignore writes to PBA for DomUs, it's behavior is undefined. */
             return X86EMUL_OKAY;
 
+        if ( !pba )
+        {
+            /* Unable to map the PBA, ignore write. */
+            gprintk(XENLOG_WARNING,
+                    "%pp: unable to map MSI-X PBA, write ignored\n",
+                    msix->pdev);
+            return X86EMUL_OKAY;
+        }
+
         switch ( len )
         {
         case 4:
-            writel(data, addr);
+            writel(data, pba + idx);
             break;
 
         case 8:
-            writeq(data, addr);
+            writeq(data, pba + idx);
             break;
 
         default:
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index f3b32d66cb..9fb3c05b2b 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -51,6 +51,8 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+    if ( pdev->vpci->msix && pdev->vpci->msix->pba )
+        iounmap(pdev->vpci->msix->pba);
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index bcad1516ae..67c9a0c631 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -127,6 +127,8 @@ struct vpci {
         bool enabled         : 1;
         /* Masked? */
         bool masked          : 1;
+        /* PBA map */
+        void __iomem *pba;
         /* Entries. */
         struct vpci_msix_entry {
             uint64_t addr;
-- 
2.34.1


