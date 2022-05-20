Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99052ED48
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 15:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334158.558156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pc-0005Ow-NC; Fri, 20 May 2022 13:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334158.558156; Fri, 20 May 2022 13:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns2pc-0005Mr-Iz; Fri, 20 May 2022 13:38:16 +0000
Received: by outflank-mailman (input) for mailman id 334158;
 Fri, 20 May 2022 13:38:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns2pa-00056k-RB
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 13:38:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 162db06d-d842-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 15:38:12 +0200 (CEST)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 09:38:00 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA2PR03MB5755.namprd03.prod.outlook.com (2603:10b6:806:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 13:37:59 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 13:37:59 +0000
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
X-Inumbo-ID: 162db06d-d842-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653053892;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=VYJh6n90s2Z2f/hoLcEnXwqvv8sM0GrhXmOREGpZMZU=;
  b=IWhnK4FXXQwAldDPRSem5oWpjEGTh3iOv9zXbHgodpDt+fEguJgduwbp
   FrQtzCONK68aPFgIfKVBpgR7OqCU/4Kw6R5nV2/wC6Xo9/I5j1KW0yaRG
   cauOBirdoGHTySlhfE0NF/YpI56RtwhFRT0Zb4Thixzah2oCjEsIReyQy
   g=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 71798612
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vbAiuqnmbid3PJ4c44GMCEHo5gykJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMCmCEOv6Ja2SmeI0iOoqxp04G6JbRy99nGQJt+3o0QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWVvV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYWV0WP4yTkcAkWggBHiBGAYdg57/tLi3q2SCT5xWun3rE5dxLVRlzF6tHv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOVvZkBhGpYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8Q3E9fRuuQA/yiR32ZOuNeLqSuW1RJ1fsHeFu
 D/ozmDAV0Ry2Nu3jGDtHmiXrv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaWWdhSN
 kgV8SoGtrUp+QqgSdyVdwK8iG6JuFgbQdU4O+8n7keLw6nd4QecD0AFSCJMbJots8pebT8ny
 F6P2c/oDDpHsbuJRHbb/bCRxQ5eIgAQJG4GICUCEg0M5oC7pJlp10qSCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8O+RENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:NoRwcq0IlZ5RWydaffYQ2AqjBS9yeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8M3WBxB8baYOCCggeVxe5ZnO/fKlHbexEWldQtqJ
 uIDZIOb+EYZGIS5aia3ODRKadb/DDtytHMuQ6x9QYPcek8AJsQlDuRRzzrZHGfA2J9dOsEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 529lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ5o+a87bWzHAb0cYa
 hT5Jm23ocXTbraVQGSgoBX+q3iYpxpdS32AXTruaSuokprdT5CvgklLfck7wg9HaIGOuV5Dt
 v/Q9pVfcl1P6krhIJGdZM8qJiMexvwqSylChPjHX3XUIc6Blnql7nbpJ0I2cDCQu168HJ1ou
 WLbG9l
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71798612"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an+8CZ/RgZtkbOaReBB+a99Cr0AnHIDUqCSuFQ4J+OTAqGTBXYu97AVrPUOFFq3VuN2twMk9GZjFmSqbaDqGi4FWGI6AAZmBtoej4BiHrb6wAwLWMv6Mv7ej6Lrm/ErzC3Q3UWZagyzTqCrOH/Y/zMEJzj83CfVfIapBB45OM56DDfE0g5lvVSepWKMftOYlWhjf/uojNjyoki1gY2Wxv4eN5ssPsi1UJO02ROavQFPAhJsmtcuPr0T3RIupoF77j0tAloHMln02Hjzn1IhPvIvpELnQpJPQDnSkOsc1RfyGe92IkmusbZ9bWhv2H7ZLYqCY7LhA6AIzd7FhDsONgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KcoChvovYQDsK3p29jg9hzF+dhhtG/SSZ4U6GNOE7U=;
 b=bLxWTbpGMJo8j154yQXOt/afBZIslcdsqzCkehZeNGELWQU7gC0VdrEBm946lwAnH0TKM9uWUGYlVDsdWVqxQGoc07M2EhtC9Ts2O698kuMvtHiencOp/zdkzSaif/pctpNlyZuh99rsTB5NCdAylfMjadrYQn/oo4lU3mmlK4dNzME1DJUEHZm+ZcyVyh/5Qgy9C4onueVXiiUWx9MwXehUC5mC+Gwax4T94PxAUjT5+JurrWSSqpxUO/YxOyXJiSQcQfo7dGssYJ1Y+UhNzgQvmE8s2wbIl9wUU0NnUpH2+IN65QLY/suwVR3wPn8MEu+xS3ZJu/vUcQ5DRKEl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KcoChvovYQDsK3p29jg9hzF+dhhtG/SSZ4U6GNOE7U=;
 b=NUmDotmnMGRSf6qPad11gRPYba58hRX6HzjqWITzl5Pn3GgaOfQOkFmHsGAGaSIOdUHPMsaHOwsUNX4IXiAz9jsfJO3WL+wmJCQLPu3d9WEM1z94S+lfXoeBdK8kuhx7+BM43JWUBh+LRhk5muAXF2zIuQTktPvt4SO6ikHg8ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH 0/5] x86/lbr: handle lack of model-specific LBRs
Date: Fri, 20 May 2022 15:37:41 +0200
Message-Id: <20220520133746.66142-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0528.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12903cb0-6255-41e2-d171-08da3a65f424
X-MS-TrafficTypeDiagnostic: SA2PR03MB5755:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<SA2PR03MB575569DBD5C100684E7395788FD39@SA2PR03MB5755.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	60ImD7+KNxpWHcVoG3Bhv4IzSI+tfD5kaCTstihtXwsaXRZ7iRyNrt75UI+G0qgI/hYus80jxkP7F2dyCJzQaKWE99pQvlstJeHzCbm0XacPj1I5UfNnm5oF+ScJz0oj9MOyrpEmI+GdyPh/JIqUlAX26AzJVrlLn+aMGZfCDKfGo3fj6M4fMs5DrWS03KryH4iZXUBlIa8odWxCfMLUUSLmbw4ulJkmEMGZFTA0KlyutdIb8YSsmo4+xIOr845zy4Goz19gHgeMNZ3MoezCvxrSnOLJO8YxmDZScMm180+lAWMM2jnMl/CaOWxZKk6UzrieCzR0jXzOfE8mrBhW1FVavqAeRyEVQs/Zp7/2haVD76J5fRwaFakYXKBC5fGXY8X8ZbdsocHWRssZ5wbxdPKedweU/OvDQS865bo04KsTO3sOhPdFtzDjFMEp1dHDoZNW76nYS3VzPoUJWgtVkJt5K1amyu1u+vIB12X/T3jZ010c0SX/vDLhUy0lp3dhMGNErnnML9uzCtijjz7Awl9nVkkEYZbMNhXvyTPhPvHPL7TcBcAZb54VvTpq+LGIXNTakDCZcnQwJC2fUyeyyPlleJDRsHCpPfcFOV//Q+NDWnVgOFdJ2GzDTWfhqUUC8oLhA/q7/m4bN1YHbWmU2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(316002)(6916009)(86362001)(66556008)(66476007)(66946007)(8676002)(4326008)(6486002)(83380400001)(6512007)(26005)(2906002)(6506007)(508600001)(1076003)(38100700002)(2616005)(82960400001)(6666004)(36756003)(5660300002)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUFPWXhYdWhIakFYSTN4NitUNTV0Ry9YQnlwVXpuWTNDVFMydWRDQWFEa2hr?=
 =?utf-8?B?OERNYzM4MXNOMXl2Ulh4VFFHeVpmK2lUU1FMZGRaZ3JvSmFGUzM5VW42bkMy?=
 =?utf-8?B?cFhqMTJxR1U3L0RYWUFZS2ZuRHRMeTNnQlJMVmhSU1BsaUxydkcwOW9mSk5T?=
 =?utf-8?B?bGdaUGVGYTdMc0lMMlpmS0ZCaGFvZzUzWUI1MVlxcGRoQzhXeE1CN0g1YmFn?=
 =?utf-8?B?UFBPUzlkQmVrN21ZWExrSHZiaXg3WDNJbXpBUlgxK1g0TTR1RmcyemEzMExk?=
 =?utf-8?B?U041aFR3bUFidGNQT0tVd1p0SzVtb3A0WjdreVRMTGtuVmswSjNDL1ZWRmo2?=
 =?utf-8?B?R1RXbjJ2WURWYzI3QXVwcER5NkRRQWp6V2dHcnZLaHhaZ3RhME9aRzA1OU9Y?=
 =?utf-8?B?ajN1a28wNVBLRFBZYk45R2RoRG9WNnM3SDltamxwNjlvT0tMM1lqSkNqSGkr?=
 =?utf-8?B?RnJiSVJFZ1ZYbmRvQ3ZBdW93NHVzVC9FODBTQlRodnhZbVBKUzhJTDdGOGNG?=
 =?utf-8?B?YkJNaWMrYk1SeEhSZSt3TEEwb3RkcjFpVjF2S3hsRzhKWTJtdUlCMmlPL0ZI?=
 =?utf-8?B?YnJZM0JydWtPR2NmU0hMSnNScUZWSnpUQVN3ZXJTR3BjYzhteVF5ZmlvM0l4?=
 =?utf-8?B?TEdDa0FNdmc0SHZBdzBKN014aEFPa29PcENFaXZsT3RFbEx3TmVCSGJMOHd6?=
 =?utf-8?B?R3p0aXFhaGMvcEV5TmZXWGNGQTlaUElJY2h4NUJkWkg4ZkxvcGJrZTNrRnRy?=
 =?utf-8?B?Y0I2TkdCcm5Bb2dsbXhGclhYUWhMYm44VEtqdmJmR0ZkTnkwVGxIVEJUZlpF?=
 =?utf-8?B?VTM4TXBtMXk2eWdCcDVmMVdJNjI5VFBtUUxkK1JaSE81eUVBaVEvV3FCNlhQ?=
 =?utf-8?B?QkRHQ3FOOXJtcjROeXcxUmJFSjBLREZhdUZUcm9NMHJ4YWdrc0ExRTVuQXZW?=
 =?utf-8?B?ZGE5S25BZTdqNTE2dS9YVlQ2TVI3a3VVbE85dG41ZGhMNHVNYXkrZlJaRlhE?=
 =?utf-8?B?RENWdUdRRCtlZEtPMVpXSnRlMnd3UEwrUjk3RmR5K3R4OFYzb21qK1FWZXAw?=
 =?utf-8?B?T0ZoamUwWVg3RU9QdjIwUzB2Vy8vc2ZYbE4yY0ZucmdlUldGbXovRU1MV3c5?=
 =?utf-8?B?WFBJZDlCRW9nYyttNWJkdmVqcklLUC9rdzJOemxwd3NUTitrb3pPWCtGdUd6?=
 =?utf-8?B?eEZVSTJsMkpycEdFV20zd1h1TW1RZXRQN0RXZXFHdXExd1BKZVdYTVZOUzdz?=
 =?utf-8?B?Y1hnQ3N3aUdKL3l6QXBQU2ljYnVNZDNxMDlGcXY3K01XanRhb1R5VlVHWkEv?=
 =?utf-8?B?bDNpM3R5R1ZqZlVDS2NHWUxnT1ErK2FVcTVoNlhEM2tqYmozV0JHQUxlajZG?=
 =?utf-8?B?N3NiaWEyS2VWWFNGakFOUTB6WENpT3Ftb3o1Tk1hTzBvcWk5QzRwY1JBaS9U?=
 =?utf-8?B?OXRYbFpTdGF5WDdJTUoyUTZjYjFlNEovbTZNajNWSTQrUWppSkI0dmRIcnNH?=
 =?utf-8?B?elNUOUx3V2lJc0NkaUhuSEg4aWpld3l0azB0L3N2eHVaRk12TGJ2WnM4RWli?=
 =?utf-8?B?MG9kZlFYTTNiYW1KNVVNd1FGU0hySEkrSXcxcVJYcGdjSlE0bjJCdUh1RzM4?=
 =?utf-8?B?R3U1NGpWR3dQVEpmOFZrV09OM0pqcFdYMHNxQWEzS3lkR1dUcSsyZjBFZEdC?=
 =?utf-8?B?OHI1OVd5RnBRMEl1OFRKNXZ3blMwaVZMQXFxN2NGcnRLSGx1R1Z2R2poME05?=
 =?utf-8?B?cTBML0lsM0IyNG9Ta3pvblE2MjRRQ0p6ZUZYNDM3bDM5cFkvS1k2dVI0T0ZZ?=
 =?utf-8?B?WHRJbjE2am5BUzloeEM5SVlwTG5iS0lnenY0MnZVSmE1ekdJTWRuUUpuNDBR?=
 =?utf-8?B?UlJLUm1zRlkrZzdjRUlDY1ZzV2MzYjRSUG9CZmUxUlByL1Q4eVJjd2xzSE52?=
 =?utf-8?B?SjE0WWxydExLT1ZBVHRMQ3BFem9qRTh1aXdTWWhhbVAzMlBWdStMQWJQUmk0?=
 =?utf-8?B?ZGtEeDdySnU3ckJCNFhSeWY1RGV6cmpYbDQrdTVyT2R2R0Y1dk5nWjAwUDB6?=
 =?utf-8?B?d09zMld2QnY1ZE8zT3l4UktuTVM2WU5xSms0cUkwdlBGd0lVNCtUZlNqWDYy?=
 =?utf-8?B?dGpDQThOOEZpaFdSMUhuUzFTeEhrSnV3aE5rZnNic1p4NTRmTnE2VE9pZUNQ?=
 =?utf-8?B?NUdGZEZmVW1TdEtEcFZIVzdTWmxTazU0Vm81cFFGQXh6MU5VU2VkckQxZitJ?=
 =?utf-8?B?T3diNHQ0QldqVFlVS1RHaituOFFBc1BnZkhxN2FtOTZqZjBSczlDM0R6ZHI0?=
 =?utf-8?B?dEo0WXNleWRzczl3d3V6aCtwTnd1UmdFN1pjUW83L1Z5Qkhuc1BqOGE3cmVw?=
 =?utf-8?Q?JKUv8pQvBfxduQmk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12903cb0-6255-41e2-d171-08da3a65f424
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 13:37:59.0538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lccO8oTBS9mOEa+vCEijnWdJO/qaLyL/0/cZqrJwv7fToNXrKajZUdi+askh1C7kX+Xm0gWLbvX8N5MENruwPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5755

Hello,

Intel Sapphire Rapids CPUs doesn't have model-specific MSRs, and hence
only architectural LBRs are available.

Firstly implement some changes so Xen knows how to enable arch LBRs so
that the ler option can also work in such scenario (first two patches).

The lack of model-specific LBRs also affects guests, as setting
DEBUGCTLMSR.LBR is now ignored (value hardwired to 0, writes ignored) by
the hardware due to the lack of model-specific LBRs.  The LBR format
reported in PERF_CAPABILITIES also need to be exposed, as that's a way
for guests to detect lack of model-specific LBRs presence (patches 3
and 4).

Patch 5 is an indentation fix that can be merged into patch 4: done
separately to help readability of patch 4.

Thanks, Roger.

Roger Pau Monne (5):
  x86/ler: use feature flag to check if option is enabled
  x86/lbr: enable hypervisor LER with arch LBR
  x86/perf: expose LBR format in PERF_CAPABILITIES
  x86/vmx: handle no model-specific LBR presence
  x86/vmx: fix indentation of LBR

 xen/arch/x86/hvm/vmx/vmx.c                  | 59 ++++++++++++++-------
 xen/arch/x86/include/asm/msr-index.h        | 18 +++++++
 xen/arch/x86/msr.c                          |  9 ++++
 xen/arch/x86/traps.c                        | 29 ++++++++--
 xen/arch/x86/x86_64/traps.c                 |  2 +-
 xen/include/public/arch-x86/cpufeatureset.h |  3 +-
 6 files changed, 97 insertions(+), 23 deletions(-)

-- 
2.36.0


