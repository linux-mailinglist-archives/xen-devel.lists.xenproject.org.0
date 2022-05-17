Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E508952A5DA
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 17:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331056.554507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyy9-0001Lf-Og; Tue, 17 May 2022 15:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331056.554507; Tue, 17 May 2022 15:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyy9-0001JP-Lq; Tue, 17 May 2022 15:18:41 +0000
Received: by outflank-mailman (input) for mailman id 331056;
 Tue, 17 May 2022 15:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Pio=VZ=citrix.com=prvs=129b517a1=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nqyy7-0001JJ-Vg
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 15:18:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e44fcc9-d5f4-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 17:18:36 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 May 2022 11:18:34 -0400
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com (2603:10b6:a03:286::9)
 by DM5PR03MB3162.namprd03.prod.outlook.com (2603:10b6:4:3c::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 15:18:31 +0000
Received: from SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0]) by SJ0PR03MB5405.namprd03.prod.outlook.com
 ([fe80::871:4ab8:9b74:1cf0%4]) with mapi id 15.20.5273.014; Tue, 17 May 2022
 15:18:31 +0000
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
X-Inumbo-ID: 9e44fcc9-d5f4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652800716;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5+b3cbkFIsX9pHHhrCj6++1b2O0LbYv5gutHvFyAAqc=;
  b=aNkp9vB4IRN/Lop7ZOD8SdBuQe57Dgk5VlZZVp6i8VABrUBGCOR+qrZ/
   ZHNdegcfibLvVsgswhnsKk9FDs/D9utRHb5F1s85JGyGwBKAh1/6cdYmR
   ig2SZc7t+mkxlf4T/iVhsO5GkxmtyM2ZaGWhvTTuOtGB9U3gN94tsq5FT
   4=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 71517865
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XMixZKIqhhZLiudxFE+R1JQlxSXFcZb7ZxGr2PjKsXjdYENS1TRTm
 mseUWCCb/eONGSmLtsgat/l9E1V7cSGzNIySwVlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39c32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ih2msaKGFkgBbHrn/YkSgtxCjgmA6ITrdcrIVDn2SCS52vvViK1ht5JVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM6FGvqTjTNb9G5YasRmGffYI
 c4YdBJkbQjaYg0JMVASYH47tLjx2yCgI2MFwL6TjZY42Gv93AV967fSbtDXd8SsX+pxwknN8
 woq+Ey8WHn2Lue3yzCI73atje/nhj7gVcQZE7jQ3uFuqE2ewCoUEhJ+fVm0u/6ikWalRslSb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbizt1HUABRz9FLdch7ck/QGVz0
 kfTxoywQztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjTxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:HtLokKgOQqDCmPRBJWk38PxR8nBQX3F13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICPoqTM2ftW7dySaVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj1Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnX4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlVFtyssHfpWG1SYczBgNkHmpDr1L/sqq
 iJn/4UBbUx15oWRBDznfKi4Xin7N9k0Q6e9bbRuwqenSW+fkN0NyMJv/MnTjLJr0Unp91yy6
 RNwiaQsIdWFwrJmGDn68HPTAwCrDv8nZMOq59ls5Vka/ppVFaRl/1twGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7gywlGl/NIwgF4vsul6RRq/n7WKfhNzGFRRQnj9agys9vcPHmZw
 ==
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71517865"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VK4oiddWrhTvzD59EFitlHwikF6wb2SlrlEKvB71PPNRKm5yNzF7hLih2R0uNfVag9UnNvKMUHeQLTYQ4dIRXvGSUmpaGPVrHZKcMg1q0I27wuEMNQWUVi/ixzsydV96ASGL5TTzwnOYK1+OPlp2rF0j+dYzrWufGwqZJCfeiiW0S+zo+PGk50ZXHcETyGJbJCUtRqrvoGm4UJGGk7IriPlwNcHCp/cam3AiJBFurYnDLtEJjIokayWtb6KHa1Di4v893KdIiy0vcmkDcBorDaP4t1m6wunSAUPqF6QfEVIV5V71gYWquE/sODWe2KaPs4MpM5U4145BQ39WHfp6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+b3cbkFIsX9pHHhrCj6++1b2O0LbYv5gutHvFyAAqc=;
 b=BHhhmCbounDXqVQEUuqWvaWXwa61JXvCFzTcYkDAcdGRt1azM/RAayGftsvQR4KELRDGkTDV0TFXK7wjOAUTKS89gvWfIK6D01e6cAne34yrgQHI0QPyjn9z6L+V5LyP70NGC9lEMdSuULcCKdqxUQwyV2rq6bjb/JFFsmmSpoE4ar1z+5Q47p5C/CJOO3caxWsWnXVoyF9cPUgw99nSYJguXQQsMVdYikZdbBc8F/YqcFYr/qq2DH9l2pD3fjmhuRYh6rvM1QFq+K685ItFDfJi6gobievnGmyWlRf3A0KQhYKTIPI4oL0/gfSaj1YTj1piwWgro8e2HwMOgJoAQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+b3cbkFIsX9pHHhrCj6++1b2O0LbYv5gutHvFyAAqc=;
 b=bA8e2aPyr80uyHXidJkWksgrzy1znfA+JHfqj5o8Hhq6QXlCWsJyQXZGXGaCbXMbk/Vsr02/ovlHyinFtdY08Fxey1eFT4xH4GUNMg4fptZTwSRrQENBAJ89xmvVg2/pp0PcLfEwMqVIAkdXer9HhVRpqKSHpNHhnHY3BG4ygqc=
From: =?utf-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjMgNi82XSB0b29sczogUmVtb3ZlIHVubmVjZXNz?=
 =?utf-8?Q?ary_header?=
Thread-Topic: [PATCH v3 6/6] tools: Remove unnecessary header
Thread-Index: AQHYZFbt2pFGuRmHsk6KyzsZcEmKTK0jNUAAgAACdjA=
Date: Tue, 17 May 2022 15:18:31 +0000
Message-ID:
 <SJ0PR03MB54059051B2088585E6822CE19DCE9@SJ0PR03MB5405.namprd03.prod.outlook.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <e6e161b23ad9860972a9af2e7dfa61ce1f0cacda.1652170719.git.lin.liu@citrix.com>
 <8430c91b-edd0-76b8-6a14-7268649103f3@suse.com>
In-Reply-To: <8430c91b-edd0-76b8-6a14-7268649103f3@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10551915-220b-4a76-69a3-08da38188082
x-ms-traffictypediagnostic: DM5PR03MB3162:EE_
x-microsoft-antispam-prvs:
 <DM5PR03MB316207AC010C3F2459D0FCBA9DCE9@DM5PR03MB3162.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +gXjm9UXQTRClpmHV1Ym3O3Wshvx7eV87dwnaxlC/N9Ciut4KfEglJhAq3EFlziXU/F+cpcvIN4ZZ7AQasnUBORxqGp1z2pPJoaw0Foc36ZXCDob2a0OJkMq/Y9qPdj4sL/txO9WQFH0RrDUWU0OPOP59aROM4/hHQAlPDCmOVXMWLS9AEXXAFp+xMc2+g2RZ+7/cFYwqbIXaNu+kjmtwM1tZm+18cTuOVyAEsuvWpG1u0IazUicVF5iEy54IT9yEkvrs7pfacODGhTDfjSk9lAAmeXJCBcMShYlKahPezGxMivYbyAJFbLjfyPE6rt4u+gKewSnnZChcXhV4/3Mgf7qK0551L0kaEbkDTXDDv8UzcP6ckCOlCLVOKpvXW+Sh4Yveg104GeRu2fghIGQQ9v2IOIZr1mXiXGCBtwMKivopIqyIh5xwz94hAm4Lq3BprSOpfubs+afDx1ZxvSVMJAVy0OfiBRfdfMOlAIYjma8RWe64psG94fgi3EJmRxPNJCT6kVZQqRgVTZ7xGee/HWPArc18t75MMe8I+Vsr3NuAet6vpGShX50pJXkzxBZBFPfOfI0+iZEIOWR3PJJnRPhsCX58/EekxngBnLjfpsXfQU7irxdDYq/5MaWW1JqWNvIXAx2GEAqJOv4T9NZWyGzUcuq1FVKT3f1OMNSM8h9jztz4NUIkMZmFNgioKRZ27shxxhLWFPx+O0zJ4cSMQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5405.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(2906002)(186003)(85182001)(508600001)(5660300002)(4744005)(224303003)(7696005)(8936002)(83380400001)(316002)(76116006)(6916009)(122000001)(26005)(6506007)(9686003)(54906003)(86362001)(4326008)(71200400001)(33656002)(66946007)(38100700002)(82960400001)(38070700005)(55016003)(53546011)(66556008)(66446008)(64756008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUtBWkFCeTRuN1hpdWdxcGc4R1cyQVBTcXBUOWU4NGduTUZ1aDFFV3BsTzNV?=
 =?utf-8?B?OEhiZUdMc0pDV1NDRDc2dHhrUWpQSGxKcjBSQlZMY2FuUW5QK1dNQ2VQT1lv?=
 =?utf-8?B?anBzOGorenI3TEVtMDY2eUVHRFBMN2RWOHFJMFBUR2xyTzBlNXBleE9kck9s?=
 =?utf-8?B?YzFCZkNVb3NRWXhtM0ZBRmZqWVUrdWdrbTBUam9FckcwYUpiK3luenkycG5H?=
 =?utf-8?B?S3V2eFFjLzk3cXJXdWpLM3B4MEMvRWQvQ3Z2NkdoUUo1dVU3UkRkRzZrR3ZN?=
 =?utf-8?B?SExEd2FqTFIxNzFkVGsrb2NWOUxWZjhYaDFTR1c3Vm1vYWoveHREd0U4T3Rt?=
 =?utf-8?B?ZTVyTmhuU1lLLzNrUXdrMVdNeEttT3BwSEI3aWRYT1V5OVBOeUI2YU40elp0?=
 =?utf-8?B?T0xYWWZpRUUyUW5UdEViamZGNHNib3pTRWYvU2ZrUjUwclpKbXdZWEJnQkYz?=
 =?utf-8?B?K2ZRUzUyRXNHQ0tacXNEQlZiZ3dTZStFS2hxTmZzUEZENzNIbzNtc2E3SSt3?=
 =?utf-8?B?UC95VzRvL2dRaVFZaUNBeVJFV0tacHpWNitrRXhkN0V3anBBczZCL1lhcGtX?=
 =?utf-8?B?em5iaDV2ZlNtdVYwclQyR3dlRk1xS1NYdzFzWlZGTzRFb3IzZXRnaEU2YjVq?=
 =?utf-8?B?SFFwV09XbXdydXN6b3pHMXdVS1M2YjJLV05wL2ZuYVYxc3ZvdG92MFM4VTI0?=
 =?utf-8?B?aXZJMzk4dk41WVN2NTYzMitwaENEYmZ0cG1vRU1ERGdXUUxlU3E0TVdQa21C?=
 =?utf-8?B?VFhTY2lkUTlJalZkV0VMNkJicWx4WU9CVFhNT1ZaTHpZd0hqdG9sd1BxaURq?=
 =?utf-8?B?c1BQS3lqazlSVm9SbkhhWUdrVldodWlXSW1SUzZldDRIOG1vUHVibUVhc2hV?=
 =?utf-8?B?dFMyRmtGYmt2UWpqbUMwTndhcW5BSGdBaG8xdzBueTBrZVd1VTlJVk9IK3hm?=
 =?utf-8?B?WCtRNnFUK095OU4vN2JGdXVXRk1nYm9ObFp0dmV5UVRQWk5DcHJmTWhNd2Zk?=
 =?utf-8?B?YThUdzZWODBBRVhqTXMyRitFZFVlckE1R0JQWEpGclhUT1hYeWsrQWZteFkw?=
 =?utf-8?B?ZUQ0cXdnc0pRL29aNzI3YUlKOU9IbEtEbmVxRVI0clNGQ0RsM3UydXJpRnZX?=
 =?utf-8?B?ZVZvS2xxOHUxOG56VXVST1Q0TDJIZGZhaEQ3amp6dTlNamcwZUdDcmQvT2Ni?=
 =?utf-8?B?SHdEUFNNOENUUlJWcWQyc0ZQWlFRNUV0eHo3ZGVqeHlMQjhnd1RRR25BbkdD?=
 =?utf-8?B?RGFiZXp3VWc1MjZBUmgvdEpHeHo5czJKOFpKT2dlQ2poYjFqSHFVWTdxdEtt?=
 =?utf-8?B?cU0zZitrODNMTnNsZmNVNkhZYXFrQVVXcFJVOGNEOHZ3RmFwWDUyR1FUZHR5?=
 =?utf-8?B?bE93c21NK3VjT1EwZFo3WCsyQWVwdzlyWjF4RDVnMkRZK1VxVzBSc0lxYkdw?=
 =?utf-8?B?ek0rWGFlRjFoWXJGblNjN3JsWUhLYURZTk5Qd3JFeklCN3FIOTVRTjBDSllE?=
 =?utf-8?B?RkZEbUo4UkFDNXdoSDVGS0NDSWxlV0NxbHdOaEVBdVJwWHFsenZvSVZWcFpw?=
 =?utf-8?B?b29xWmV0dnEzV3NDaXNHNE00SFliZ2dWazJJY3p4TmlFSis2VjlmcnhGR01K?=
 =?utf-8?B?bXEwUEVmOVJ5cCs2MFZNU0xMT01mdXA1M2dhV3Z0Qm9KaXJjL2dZTWRpM0o4?=
 =?utf-8?B?RG0vWTlKcHNtbVpDS1NjdW8rTVozTEFubXQ0bUlnUHRqV3o5cC9xNE9rZ1Qy?=
 =?utf-8?B?SzdHcmJpM3pDUkx6bEJHYkMxY2FBejl4MUpKL2l2dlBRZ1FQTkVmSkZkTm14?=
 =?utf-8?B?aTcxalFJVlUxczhsdXhaZzQ3bGlNcFovbUk5cnpDSmlncmJMWEZQTGlCeWdE?=
 =?utf-8?B?YTF3OEp4Ym9EQzlKVnVwS1YzbnZvUE9YZnJQclpMTEtWMTIyWUoxaHY1TXlM?=
 =?utf-8?B?emFmcWtyV2VadHlPQjQ5cnB4K0xLNHlHOWZwWlpTNVRpcDFaWktUZ0cyVmtZ?=
 =?utf-8?B?NGF1Slhtemd3V1FJN25PU2JLZmFGY0JvOE41UUtxNkdsNEVva1BsUTRaQkRl?=
 =?utf-8?B?ZmFhL1hhbk12UlZmZWd0aXlmVmQySHVQRW9nUmgyMC9LSXF6NUU2UjhHUzlr?=
 =?utf-8?B?RjBoamZObzdyZEhCRDJWNVhkRllOUUtiQmdDVkNjMkY4dllIVjhDVzU3QzlQ?=
 =?utf-8?B?cnMvR3kyUVdhVkI2MHd0bDBFaGpXS3ZFajJ0ekpRYzd1aUZwTnYydWkyRlpZ?=
 =?utf-8?B?LytyN0pVbkFJQ3ZYSXhycnhqd1QxNHI0ZDRYeEE3N3pBTWdWZTBDWDBxTk1X?=
 =?utf-8?B?dThQMzFvVEJzcERpS0hPSDlJS2tpb1JiYnZ1eGcweVhON1pDenZaQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5405.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10551915-220b-4a76-69a3-08da38188082
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2022 15:18:31.2122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VV66+oJhzHKl+qmOhuQwISkbMrWnCZU2gPpNvPi2H0O30YqTvie9cpI0XvotrzQWbUneFU/MD426R8xBkGfNHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3162

T24gMTAuMDUuMjAyMiAxMjoxNSwgTGluIExpdSB3cm90ZToNCj4+IC0tLSBhL3Rvb2xzL2xpYnMv
Z3Vlc3QveGdfZG9tX2RlY29tcHJlc3NfdW5zYWZlX3pzdGQuYw0KPj4gKysrIGIvdG9vbHMvbGli
cy9ndWVzdC94Z19kb21fZGVjb21wcmVzc191bnNhZmVfenN0ZC5jDQo+PiBAQCAtMzEsNyArMzEs
NiBAQCB0eXBlZGVmIHVpbnQ2NF90IF9fYmU2NDsNCj4+ICANCj4+ICNkZWZpbmUgX19CWVRFT1JE
RVJfSEFTX1U2NF9fDQo+PiAgI2RlZmluZSBfX1RZUEVTX0hfXyAvKiB4ZW4vdHlwZXMuaCBndWFy
ZCAqLyAtI2luY2x1ZGUgDQo+PiAiLi4vLi4veGVuL2luY2x1ZGUveGVuL2J5dGVvcmRlci9saXR0
bGVfZW5kaWFuLmgiDQo+PiAgI2RlZmluZSBfX0FTTV9VTkFMSUdORURfSF9fIC8qIGFzbS91bmFs
aWduZWQuaCBndWFyZCAqLyAgI2luY2x1ZGUgDQo+PiAiLi4vLi4veGVuL2luY2x1ZGUveGVuL3Vu
YWxpZ25lZC5oIg0KPj4gICNpbmNsdWRlICIuLi8uLi94ZW4vaW5jbHVkZS94ZW4veHhoYXNoLmgi
DQoNCj4gRG9lc24ndCB0aGlzIG5lZWQgdG8gY29tZSBhaGVhZCBvZiB3aGF0IGlzIG5vdyBwYXRj
aCA1Pw0KDQo+IEphbg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssDQpJIGFtIHByZXBhcmluZyBh
IG5ldyBwYXRjaCBzZXJpZXMgZm9yIHRoaXMuIA0K

