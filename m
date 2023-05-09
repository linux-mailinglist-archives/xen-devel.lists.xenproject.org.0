Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51316FC47E
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 13:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532109.828134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwL8q-0003Nu-LN; Tue, 09 May 2023 11:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532109.828134; Tue, 09 May 2023 11:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwL8q-0003M7-Gq; Tue, 09 May 2023 11:04:24 +0000
Received: by outflank-mailman (input) for mailman id 532109;
 Tue, 09 May 2023 11:04:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7D+C=A6=citrix.com=prvs=486391a49=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pwL8p-0003Lz-AK
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 11:04:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f820814-ee59-11ed-b227-6b7b168915f2;
 Tue, 09 May 2023 13:04:21 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2023 07:04:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH2PR03MB5368.namprd03.prod.outlook.com (2603:10b6:610:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 11:04:16 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 11:04:16 +0000
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
X-Inumbo-ID: 3f820814-ee59-11ed-b227-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683630261;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=CdHTu5cLFhVVdekV7oETNew1x2H7T1z1YCZ4sBCK6tE=;
  b=Xoy+2JyAyyXwU91PkdX8tBc/UVG0DnIw2Jey2zKT6yFbcGfIcmQznLmB
   ntQdvS+Xz0djJhsbdevvLIBaaNrMW/MWphgcy1Lvy9z6YrzdFMljsORMg
   wUPnh39HFWDdGJU321fI8af5F8rBBw72k3DGTh4cbZcALJoY4u7NPLGZ+
   c=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 108776587
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:utWWbK0v67ioTzkJufbD5fNwkn2cJEfYwER7XKvMYLTBsI5bp2BRn
 GIcCm7VbvjYYjOmftAjaYS08BsBvZ6AnNVjSFE/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFmNKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfIEtsq
 dM/Gm00SAm6q9qGxOmWCe92mZF2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6Kk1UZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13r+Qwn2mCN16+LuQxvlgsFar2XApEQQvCkn4sPaWlxGOYocKQ
 6AT0m90xUQoz2S7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsZjxLZcEitcQ2bSc3z
 VLPlNTsbRR3uaCRYWKQ8PGTtzzaBMQOBWoLZCtBRw1V5dDm+ds3lkiWEY8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:Y/BNhKnc99t3ZEFori5IRw/2tULpDfL13DAbv31ZSRFFG/Fw9v
 re4cjzsCWetN9/YhAdcK+7Sc+9qB/nmaKdorNhRItKJTOWw1dAdbsSl7cKoAeQZxEWlNQ86U
 4IScEXYuEYa2IUsS+Q2mSF+rgbruVujciT9J/jJqNWPGNXg90J1XYfNu/iKDwUeOCwP+tcKH
 M03Lsjmwad
X-Talos-CUID: 9a23:B7emj2AkJ5JtbmH6EwhN1hI7PfJ4S1vE9VvoE0vjJCVvUqLAHA==
X-Talos-MUID: 9a23:lsnKNQShAFkf3HFnRXTcgztSP/93/563EXlSg9YXtOaZahxJbmI=
X-IronPort-AV: E=Sophos;i="5.99,261,1677560400"; 
   d="scan'208";a="108776587"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6399ZA2Lw2MTkbtY75Ek8PEkSQjCkgWKIo3OUkvDWAyZBiJywN+wRXidEdeY3EHarQBNLZkrPQrNvbXHxRWe366iLyTIXvmpyzu8N5KUJYQv8W7/75vkLbsDOZkb/KR966ocs+M+rbjTKY7C9+ez1M4q6Ql07+t8ZnEvYfmrU36/uGITR+f2rgrvqALOCli+K8x638eRjyr9u9LhbcT+DEEk3uNrPc18TNqX1Qlx/63vkOXb02QCs6KgvFCYnUdDgXhQUE/vr1kOuq56TFfCjmfgOKaCMsbaTc4rPrm+4fTVB2Uks48uCxGRzPdYKkRsRvLZQ6mGZajuZ7LKpoCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEVdwpNoDpCMI+qjQBMvK79jWyy35hxraOfYHbD9/PY=;
 b=O9+8EH3RpAZ0E5HHTlmp1MC3Du80FxScR3EmY7iA1PjdVCCkQEmIjue6xOxQOpky5gzffzr0IBop4lC2Mob5jCvAvf+k9FUQSoaoqy7e883YZVJhpmsCS2no7vnsfzh3pL/9FGz5RhtkLQ5iySZDKm8V9dtKSKb+ZU1hkD5PaWAUQBm8CQtq04By0JwHyfLwd41tY+tShKNNCWf3kQrgSK76Q+h2XK/iogWX8DEsiFDhZUjamO8YYJOQGFs+XUYEWdKgIjRySKyQaq79CQ+TXePmZ7PA1Ev5a5P4JGSwPe6AU058SRjG8CTDxLg0djdxAZRfOP9X2R0s6O1B3eKbCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEVdwpNoDpCMI+qjQBMvK79jWyy35hxraOfYHbD9/PY=;
 b=SQ8SaFduFzXJCyNRdcxffYddyCSBTyffjZyXhaSvRU3RavUUCvyl668UwjGbrZW7gT28vqoxVcvtHSlf8WzYWLws85lybgb9u9+UtvETS6fbKcNHXCxANoCbRHRxI3UMiwTZK3+QvuTluaBFzNIfUXMYfCpEbfguFk5NZOgPALQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] x86/iommu: fix wrong iterator type in arch_iommu_hwdom_init()
Date: Tue,  9 May 2023 13:03:25 +0200
Message-Id: <20230509110325.61750-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH2PR03MB5368:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1b70f1-3cd6-465e-e30f-08db507d2145
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gKSe0yby7K78C4izqXNDGU/VcGrIIG3htr74Wu7OVdPd4A4mweBnY2n4PUgda8rBEGPHs08mnS/dDT4/Z4/Ws3rAfPVVDgp8sps0KeckCIH+qdUrrPrWm8VWlLYsgaUnFzoc+ieAI2XH3CPmUF8wpRBceorZG6xl0s9gPAGfK5IGzvBW6j0GKvkERhaxjK2WxAHBcu5cZnE5nDRAthxNgLhfEZxWMFsr7xQhInIYGgwnEJCtmsHITYi6G5UBaOgySe8A2tW8ViE6YjMPB7X3ao7SfOFN6XLJMFE7yHbbvfnveZn1s9803gvi5lUVpBCXT4he96a4I4lNGLRDTEmtg+fAJ+GMwsh5qiQFAAh1iCuNksd7N3+dwtwiJsvqA9Mbbj/D8Bpon0qzEEQV6UsWMUVjfdR1OviZS/7NCyZ8jACNMfVZcLZ4R/tT3phvWK7IMvPg6cBRgOxzBcPZhzmGDru/nVkbS/AZD9VIsZ4wUx/KvdT2GJZMmv91fKZqB+EoMWXt3r9HfmM9L4qF3RJ2zg6DoJLNCewoc6i6HcIoooRhJ+hf4eR0dwav//K1ZFnV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(66946007)(478600001)(6916009)(4326008)(66556008)(66476007)(8936002)(8676002)(5660300002)(54906003)(26005)(316002)(6486002)(41300700001)(6506007)(6512007)(1076003)(6666004)(4744005)(2906002)(2616005)(83380400001)(186003)(82960400001)(86362001)(38100700002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG9CNXVNdEhWcmM5M0Qxd0RxQnN0SHNzK1cvMmo1UE5ZUlZhRGZRejhIT1By?=
 =?utf-8?B?cGs2a3ZsZ0VaemNFY3dVMWE5STNYd1I0M2tSWDRxZ1ZTUWsxR0ZwcE0vMHJy?=
 =?utf-8?B?N1FsT2ZMM1ZZNGxFMWJYQjJ0N1FleGtqNWNlRDB0Z2loYzFHd0F4bFIzeXQw?=
 =?utf-8?B?N3ZlOEYweUo0bzFaUTRpRjF0RGtPRnlaZDM2VnM1SEg1eWNiQXBFZHNjZWVm?=
 =?utf-8?B?UUk4UXpnZ2d6M0xKT2lQanQ5THRua01KOXk2dTJYVTV0d0xjTlRycnlxdS9y?=
 =?utf-8?B?TlJBeDJxZ0dGOFpUZVAvRHBEa2FRenVuQzN4UUdqbktra2prLzlSSFd1OWZ6?=
 =?utf-8?B?L1RJRURtMW96R3hxMVVPemdPZitjNEhuYzc4dGNHZ2wrU294U1hHZmlIQVRQ?=
 =?utf-8?B?OG9TL3lITFJOcXlLODIyS2NBODZYdDdRZzBGN1p3K3FEOUl4QUcvSGo1UTNV?=
 =?utf-8?B?aHlQc29xaEVlZXNzSXJhUXo2c2FMRnZtbDJMTWJrSThEZ1JKTmZ4SjJvWElk?=
 =?utf-8?B?dC9OOEkyQmEzRGNySGl1V21BWWxSd3Q3UGpLbDZGbVpwaHYxNjlqQ2RIeGdH?=
 =?utf-8?B?MlFTTkRPUmROT3FUOE10SG5LTEFXblJWeVA2YndwN0k4RTZ6cWdGb0lhMTFJ?=
 =?utf-8?B?aFowQXk5QTNyMS9qZ05Odlc3VkltZzI4UWdzRE03SG5OY21HY1FFN01aR2sy?=
 =?utf-8?B?TThxRjRhaXFpVVZobDArbGRNTUZqTUkrb0FDeWNqY2RCamhKeHpzTTAza281?=
 =?utf-8?B?U2tkajVoNmNYam13REtXbjJOTWdKNTFqbTFzKzNBQWRaSHRHZnRtVlVlWEZV?=
 =?utf-8?B?ZlYvU0NDVzM4NDRBSEZwT3F3SVA1UW03RmdXc3FwYTNWOXdkTCtnMmdjZjhN?=
 =?utf-8?B?elBDd0pRbld5WkJsN1hYSW4zSEloU3JQSWVKWHZockc3SEJOTFhqNjFHSHZQ?=
 =?utf-8?B?eGpmNkttcUxpTzRpcXRZSDdwKzdOKzlNOHRvalVxK2Y0ckRQSFFnTHlWUG1Y?=
 =?utf-8?B?aGNEUmcxSEQ2bTdYVmRpc0VFTENTZTlabUdKbW9jcU1NUmlVUHl6SW1HV2Rz?=
 =?utf-8?B?OSsxVFhwSTNrbC9PVE1uTzFIRVFQVjRiOXUrRG4wa3VrSWRDUFV3MkhIMzMz?=
 =?utf-8?B?ZXp0UjFha2xLREhCN1V6djF3NXg1UlR0MWZqa2g3QlN3MlJnM20xVGpFSjBF?=
 =?utf-8?B?WUdTcWIvYjBUVndrSkl6MFRnZ2wwTUpiSGhBdno0MnZGMm5XSFZ2VEdXdjA3?=
 =?utf-8?B?ckdMSmVxVjhKeFdHelZOM1FJYXQrRUFxcnlTMFBybzl3WDhydVk3b3Z6REE5?=
 =?utf-8?B?Uk1sbVFuN1ZhNHpTM0xWVVp0SWpEZXduanRLTFNydFYyck5vRmFUb1ZJVG02?=
 =?utf-8?B?ZWJza3FRVms2WVc1NDIrZFd1VERaSERBSU91MThoWC9kVzk5Yjl3MGdBQVBw?=
 =?utf-8?B?cjczWlYrMWpQMnR4OVdoVjZUSHBKSkl5T3lxQ1gvYzhlSWpnOUFvL1FuVXcv?=
 =?utf-8?B?VFZ0ZW5JN2hpY3JablpIaVhXUkZXQ2J4dGJaUFl3U2FiWGFaMjFiMFVXSHY4?=
 =?utf-8?B?WmFLTndJSFFDcnBpZVNJQk5KbDd2cXVoWHovSHl1TWh6dUhCZ2J2VUpBUmpI?=
 =?utf-8?B?ODZXT2JTSUhZcWNnTXoxQjhoaFczQnpZQWRyUldvQ0JvWnVZN2tPREFIYnN0?=
 =?utf-8?B?bHRmazRYUWcwQ2JBcXB0MTJjU0ZOUXkraUc4Q0FRb1llTmpEYU9EaDgrZG1R?=
 =?utf-8?B?RjNrN3NlSGtyVnloMmFURjJERjJQczNjSEZtUXIvNUdsQ0xSOFBzaDRjaXE3?=
 =?utf-8?B?emJXQm8xcEdRS2k0Wkx2NkFOaE9zVENNWEttSlU0UWpZMWJFSWU4THVuTXl6?=
 =?utf-8?B?eDVkM1N6ZHFlcUlNRU5jN2xUM2dldEhrOE5uRmtrajBNKzJvMmVHbUV0bjFU?=
 =?utf-8?B?RXhuUlBod2x3dVFTNHNQekRxcDY0THlZWjdFZkhQQ0VmNFU1ZmZBYnlZVGpj?=
 =?utf-8?B?VEwzSTJzOENhSk05bXRoUnJCekoySmNVN0oyTittZFpWWEg5RHNDNVJ3ZkRs?=
 =?utf-8?B?MkhHRUFGUzViVW5qOWVUZjJmaWxaSkNjbk1mcFBHWHdqY3lOUVJORC9xMjBW?=
 =?utf-8?Q?mcukKKpv3xgzu1gOLmhwrTBqO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AjUUiXcFRpdMeSKgSajmXsz4BmMVpckldXNwuYoGe75+IPSZFjD2WP03m0ZywQ8bQglWkICG0SDsv5VI2LwxKJsdlCsmjpedyB+rzirpg6sI+MYY8jPixhn65igQpQl1HjYuo85KZFh2F5omEVM0swZWpjUY2CowTNokDdsjG2qi6pCBr54HA0OaQp5DDM8NkHyd2n81VZUor2oiK2/fjLz6oBKYG+qrJ4r8wxUpTPhPvujRAoh7GGu9pGszJkKNhbcjU78Y3TFdvjlXa6uR1Cc+p8Ad+Q44eXe2RY0fYQJp77qbwexW5EHUr4e5NGdeO6qspE5UQ7BQdmbudlnPn1CjhDiphPjwAxl8L1tJIJ+rdZ8B/XYi1MJx3fHaD/dfuzOZZa3XhFby7taVgf4EuQEJou/M27EtIr3EcI0O27bUF3TsQzp2m5v9D8XJdjgeQsXrHNjTXDzMfkTpD/3s/VdZCz15SkPtAaTGbxH/7NSzLxUptJPZxsRpWCTS3hYxV47fQI7xjEK6KuPkLPMmEqwc1PMMr+FSqc8OBtBhgcjIt1qg/mbakiL8bA8WJsIC2KvqQR0wO6ChLE+MUzOkBSVqF/PX1NLR7gMHanPxYgt0Vr2l31Fx2C0CxJ1ZDnZazsBmaBQ+n+xM8Fs3czSe3wbaH9Q/W2HYtczD3B8uZ/PaEc1qalzkzH5ys3bznw+A2WwSslEXQr0GtXBVnzI24kZrzMySxaVlSZ6/PZwJdsGrZSvc0+vwNn63JEcx8xQfUrpFKe2TwgxUTBwbFA77aDxCy+GRF47nOlSq01kLFunBMo+//1ou92mP3x7DfY0F
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1b70f1-3cd6-465e-e30f-08db507d2145
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 11:04:16.3394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1V2cJUBiBeRF0Ge5aN1gl3E+MGKefI8owauUa9L2m5jQuCbtPcm9ulqp5Epgk44QtattS9tagztyyXAMfQ2C5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5368

The 'i' iterator index stores a pdx, not a pfn, and hence the initial
assignation of start (which stores a pfn) needs a conversion from pfn
to pdx.

Fixes: 6b4f6a31ace1 ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/x86/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index cb0788960a08..6bc79e7ec843 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -406,7 +406,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
      */
     start = paging_mode_translate(d) ? PFN_DOWN(MB(1)) : 0;
 
-    for ( i = start, count = 0; i < top; )
+    for ( i = pfn_to_pdx(start), count = 0; i < top; )
     {
         unsigned long pfn = pdx_to_pfn(i);
         unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
-- 
2.40.0


