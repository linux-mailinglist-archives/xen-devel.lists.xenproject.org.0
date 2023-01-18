Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F350671763
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480250.744539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4dV-0001z4-8f; Wed, 18 Jan 2023 09:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480250.744539; Wed, 18 Jan 2023 09:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4dV-0001wZ-5Y; Wed, 18 Jan 2023 09:21:37 +0000
Received: by outflank-mailman (input) for mailman id 480250;
 Wed, 18 Jan 2023 09:21:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NCl5=5P=citrix.com=prvs=375d36a73=Per.Bilse@srs-se1.protection.inumbo.net>)
 id 1pI4dS-0001wO-NG
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:21:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e5dc3a2-9711-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 10:21:32 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2023 04:21:29 -0500
Received: from CY4PR03MB3381.namprd03.prod.outlook.com (2603:10b6:910:51::39)
 by MW4PR03MB6490.namprd03.prod.outlook.com (2603:10b6:303:121::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 09:21:27 +0000
Received: from CY4PR03MB3381.namprd03.prod.outlook.com
 ([fe80::2984:da99:36a:dd33]) by CY4PR03MB3381.namprd03.prod.outlook.com
 ([fe80::2984:da99:36a:dd33%6]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 09:21:27 +0000
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
X-Inumbo-ID: 7e5dc3a2-9711-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674033692;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QGn5Fh2H4uvuaIvyiTT6V7zqpf0iK0Zf15YYHMpsypk=;
  b=BWOGAKi4YlG/WO+PeBP/k0yZ8HS1yccPlWqgMnYnOmDdMpAmpjiSpYJo
   E5eMF0tsRWKMmV4PUgji5p45ov7Pe4nrXYJGsIv05NYlPVDJOZIG+vcMJ
   ZWu/hLXaZO0Q2vQ8QdV55UkYFlWUv2wTCiebGWKgIOxgo8GrO0oxxydG8
   s=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 93554548
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w4vJvKNp14LZUu/vrR2ClsFynXyQoLVcMsEvi/4bfWQNrUolgmBWx
 mdMD2uCbPnZYmCmKY90YYm+oE0AucWGndU1Gwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5wxmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0u90XCYUr
 P0DFAgUXi+S1+SmwLCLG+Y506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaCpOBy+OGF3N79QtGQA+9Uml2Vj
 mnH4374ElcRM9n3JT+toynx27OSwXOTtIQ6CZ6dqPdEo2Sv4EM6BTYdU3KCjcCjlRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4DOkS+AyLjK3O7G6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thu3MCkRaGUENSkNSFJc58G5+d9iyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:DA4cz6l+8M6lZt6FDYZ/mHPXwFfpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-IronPort-AV: E=Sophos;i="5.97,224,1669093200"; 
   d="scan'208";a="93554548"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjYsU2d7RiydAIDu0TvES6jaYNqFu2xzl2P6evGfEUaiUDOTZWR+E53QcT7IL5qsJxaHiWXBaamgaNIHb/QoeyppmCOGJwBcjvgTS7GKlzwqCsoQwgOjqVoDa/wPuPJL6RDI1kZDeORXfYBWe9GmiBrBah841f1JnRZCWkJfVUCo79bZxn1Ee0rFP76pKnDbqGPM+nOGoe/WdPBZj99F++sDCakitPDMwrddJrNP6GFns61wLmfQ2dbGTY5H2DsHhO8r6+bWHEEOmRtnXv4GuXrqhZqc8uYJ4vNcIaIib0Rb3JNwYw0wdpkzhlEnB1xg8L5OuqRkexqO1cK8/lYtiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGn5Fh2H4uvuaIvyiTT6V7zqpf0iK0Zf15YYHMpsypk=;
 b=objLRWar2GbTPwdvXR7r7gNPjgdbWQkHUi7dvSuypNuqufo6FAIXxiGXx5NKHXUuUr2c8jHRjWaaD5pPsGUNObFH6B81EdqHKAPQ1T37GF8HCK3QcFcVCzzI3PPO2vllP5lZMnv/P5TDQsPcCJsYfzBW1uSCYmgUezVl0NB2BykQ6WuVzlftt4QuYTjewBhbmxOV3Rry2+l7qaQUySDTN6N5A58ysrsua3TQBNfmRFPAlQf4A+f59sovvCDwwqI2fnsI2/yslJFA1BfY205IRCflo5lrK+n0Q6xWCz0sNsjLqtN26Qtbt2AWN3Qg7CXBLj1R3TbfQcNl50TwahkoUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGn5Fh2H4uvuaIvyiTT6V7zqpf0iK0Zf15YYHMpsypk=;
 b=wGpr3r+AkiHsdPPumyWmnEQBF1uDvQHRBzLEYczYrLipfe4cYAxtKVQ4brmJAvcJ+86Ow4pvRfjSznL3foIOUqNaNcs3BCVP2+6DJON6SLbilEuqFKjucd0ea/AmewIHEpiMRGHSPsFuQHQcM+2lZy17J6hDRYsHAg4Ky6J7PyM=
From: Per Bilse <Per.Bilse@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] Create a Kconfig option to set preferred reboot
 method
Thread-Topic: [XEN PATCH] Create a Kconfig option to set preferred reboot
 method
Thread-Index: AQHZKc71hMjfkRx58UW4fngDofFpla6ixK6AgAA7aACAAMWtgIAAIxkA
Date: Wed, 18 Jan 2023 09:21:27 +0000
Message-ID: <a808ca5a-d9e8-ac21-45ee-0a74a783cbf7@citrix.com>
References: <20230116172102.43469-1-per.bilse@citrix.com>
 <f7e7b6ea-5bc1-ba2b-5d21-eb431ecff53a@suse.com>
 <348dff00-5ae4-5dc2-64d4-d52409a22283@citrix.com>
 <fd408cf4-bb25-c8b0-b979-340668d4c5cd@suse.com>
In-Reply-To: <fd408cf4-bb25-c8b0-b979-340668d4c5cd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR03MB3381:EE_|MW4PR03MB6490:EE_
x-ms-office365-filtering-correlation-id: 2783026a-ebfb-433e-a1b0-08daf9356065
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uEyJRpidonz6PMZVh4NMAEnp77YM+Pbmz3o+BiG9jaErQ3st1UZIYpzJaW4E1WQosT4gZ72usnSY/P99GAzmNxW+NNwSCZPyEeR1OxuHjd+xhLW4LShvjrl1Jf92nxt13ZVhN0oWVWEFCBNzKM0csd9BCs8TjBEO64vAdAyXkLnTLY3AnGA0rMJWrLu8RGGKQSnzgdBWevOjA0uKDXg/sdXYRbTW3FxUZ5MztbuMb1eOS1OdfxlIYX70BtjgrXloAX1rdTyKtvRyIA30XCpoUDzbSDA17IbJMqQUTShhlhW7CIOZhlxx4UcDh9nSQtKN1oCRflp5qg/Ceu70rbFTgg+IVw+Ic/uPuKm1yqlfKFy1vDOW4StAH2xtJFuskOneVrzu295umk5eHnozXhiDL4hNCP3Fg+I8Z4ca8U4ApQRg78OSgkbJfLq1aJHqGzMVUNO78DNIbGCEfWXibIhK8WTNxhzcfOSWUWNUmZm+VB65RQK0ulZxG72eIRb8QQO+TNMqAm3j3pECTSLqsBC7s64Ns4pwNKcdN2Zy8hU1M9W/B0U69wxSjU63OE8n1lpjegAowKpy0ZCAeJJFPqiwmEH4oJvewEccXeQxTrrqVeTB0Oj1f/LTJlEXUCSnx+x+d9T4k4iSlS00D89WUmpa9sTZRZJXldO01NlBMhVh5MwZOY5POlOOO+d5TJ4rxq3bMbQ0dPMBUSkfTHrifPTL4ZPk+BTAyYfmDujqocYKVpE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR03MB3381.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(41300700001)(2906002)(4326008)(66446008)(91956017)(66946007)(36756003)(8676002)(66556008)(66476007)(26005)(76116006)(53546011)(64756008)(6916009)(186003)(6506007)(6512007)(2616005)(83380400001)(316002)(86362001)(38070700005)(31696002)(54906003)(71200400001)(122000001)(38100700002)(478600001)(6486002)(4744005)(5660300002)(8936002)(31686004)(82960400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MzBCUGJudS9KeDJjMXF1RXhrblpJa2lGcnBEV3FqUmhhQkt2UldmS3AxaStS?=
 =?utf-8?B?RFRDd0d2L0xlTUNnNWZ6V1NiU1FlZGxlaGg5aFZNRmpibHl1NUdTT2paUC9n?=
 =?utf-8?B?RXZBNXFnYjNTMmxCYnk2VFBEamtaS01DNFJRejBTcTVFTXd3Q0pzaDRjaFJJ?=
 =?utf-8?B?b0RFZzhlY1FnbW42REk2Y2orNkRjRThrVWNQWEV2MlNleENoUklDWnJoUHJI?=
 =?utf-8?B?MFhHazRCZjBGSFFnRzBnamVoR1FXaUh6OXpQaE5MMkhzakhjNVpwSllBeDY2?=
 =?utf-8?B?K04xaURRNmprZ3ZPL05Qd3pqK2dEMkdKZXFSdUlDa2ZJOU9wVEFjV3h6dCtK?=
 =?utf-8?B?em1LVEtWaWh6MHZYN3N6NkdRTzIyT0dYM0dybW9zazFRZnhIVFFSQis0VXNO?=
 =?utf-8?B?YmZuS1BhOURJWUhpdTFTL2xaNlllYU1vQkptUzEvR1FMd2RyenJOdm1WTUxw?=
 =?utf-8?B?K0l6V3BOOHBjOG5TSjdWZVhoSFhBR1EwVWtSZEdzekpYOHpuZTdBZ2VzWFlW?=
 =?utf-8?B?clVlS09EOUVuTWZta3ZoR20zcWFTMDNKWUtZRXdBb3pEUVhUSnNmYitYOW9T?=
 =?utf-8?B?OVJseHkwRHZlam1lOXpwb2NKNVdOWVcwb0U1RW55LzNkU1ZRSTlwMnVyTk5N?=
 =?utf-8?B?UXNFK015VGRnWEtvYlQ3eTFoeEdZTmdxTUl5S0FhSjBKWlhzeVpPZERrU0Ri?=
 =?utf-8?B?dmlrVkg5ZE41eGxPV0ZnemptcEZINHNNd05hZ0RnRUoxUjQxanZtNmVURC9v?=
 =?utf-8?B?V0tZclhseXRIdE1WQXBFWXV0a1RkV3lJUnZ5UGl3SHZZSnZseTNQNVRMR2Rq?=
 =?utf-8?B?UlA4Ui9SVmFmekZaeGpNRTg4YzNEWVloY2h5WDlPUWlqTGtqQ2ZpZG5XcTNE?=
 =?utf-8?B?amZmOU5BdFFUTnc1Y0RvL0lHNUZGZ09vNnhJTEpEYWpLQVNGdHFadnM1czJ1?=
 =?utf-8?B?bElNaUVkMnZybE5NcFpWY1QxVmpRVEErNDR1NXQrVEFlUTdDelBWVmxJQ2Rz?=
 =?utf-8?B?bENReklBRE9ZTUFRc1IzOWdjUklUTmt4dkU0Mld1Q3pBeVBzdFlJempGaXdm?=
 =?utf-8?B?eWswK0gxUUpFeDRaaEpGOTZWY2JjWFpXQ3pBT2hhK1l0ZlpicDR2YzFnUWlF?=
 =?utf-8?B?S2x4cHB2a05RY2JDQThFSTZnQ0htUXI2Y2JOLy9oSGV4SCt1bzE2ZXdVcWgy?=
 =?utf-8?B?N2RsS0dRNlhSeHZkMEpOU251SUg3MFlqTXRLRFg3NFBOMFA4N0doaTVYalk3?=
 =?utf-8?B?a0VkdWlmKyszUHhXU3V1ZXBScmQwd1hZMmRYc0Uybi9pRThhSlZ1WnhqMUJx?=
 =?utf-8?B?dXRSQWxWQVZ3N3J3MnRkOWx4TjhvdWpUT1ZpZXZsTFlIRkhQREd5dWpVZ1h1?=
 =?utf-8?B?K0JsVTYrcnc5Zk0zRW1vUWh6OHk4UURGTkZTak5XQ3dUUG92NWdpSWxCak5K?=
 =?utf-8?B?Z1FXaGV0UDRobWo2Ync0ZjlMMVlCeFZJTWQ0bWthS0ZPQVVLV01RT1RKL0V2?=
 =?utf-8?B?T2ZNazRLTDFZZFIyVW0vSDRESkJIUXQ5a2NoMHBBUnBjbzFwN2NoNzV1ZVdX?=
 =?utf-8?B?SjBtYUV4YVJmWFBzVlhWTHd3VFZrdU5VNWFWdDgzNit4V1dpVzNveFYycHNJ?=
 =?utf-8?B?YVRNU2ROU3oyWHlaL2c3eWluV3NUMkFJM3EzL0RVdThkZmY3elFIcHZsdjVX?=
 =?utf-8?B?VytTcXBDTmdCczZYeXNVdFRjcVk0emdha0xBUVZ3QXRLeDkzSVp3YUZoN0Fk?=
 =?utf-8?B?ZVI0YjlnWUZWKy81R3JCRUhURHF5a0xvYUlRRnFmSjdiVnhCNEMrS0tHQlZq?=
 =?utf-8?B?Vit5VVRQR3RWVnowTTBWTjF0Tms5RkxnVGNKSG5HNmJ4WTlpcFBDNFl2KytV?=
 =?utf-8?B?UTZTUDZ1NnZ0aWliTTE2T2JXSUIwcW1OV2dQZWhDWFdlRU9VYTV4SHovTGk0?=
 =?utf-8?B?NEhqeWlOK0VRU25PMEZPTzFXdDdlS05TZ2ZuaUpxTkU4Wkh4MkZ5Zlh2L0Mw?=
 =?utf-8?B?bnJ5MWtnVFpZamNLTVJuSjZFOEY4MytRdjQwdHZDK0RLQXp6dExTV2Q5dmRr?=
 =?utf-8?B?MnBYbUdxdUNWK004dzJSQjBuU2xwVytHUVpnOTMzRUE4NDRtQThsdE85cWlU?=
 =?utf-8?Q?EhzR0MkHZUYYM+tG3hR0o2sPg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B53550E0FDD98D49B32B5CD2D4F5A369@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4i5lEquaBZeLBNgToH0fimqesxAxTxiXgyoY/GW7LZAq5541eWAW5o6ofyhLQ7X9v1q0wSSEFjNWfn1FnGySdrVcDvb4vQeBC16CW2iKkx4G/gtNWvOvxtsl7+8blGzgllgqXSftrZL+OKG29hn9VIqfQvvVFkiw6mTF00NoCAhDGAUF1zGEVPLOcypbXUzbf2gMTWR8G8q6QLj50TqvKp0GppyMnjJiMpC7FBmxODB8CLHIbWhDlUhj1spGBcT6veqLoFm/CDbzWWrPPVvxJ2B6njmrG38PYeOFK9Sk8Rtlq/stDDzG9rx/9kv5IOh5+TWbYDh/bIMXS6r+6DOnC59nrO0H11/9WvVWNG732FQTDFdENZsthMBvtXMiD194BDUJlIBfExiVANTIMIV8j6Cwa/iAXhrsbGZgnuAAX8n/UJD3M0eEDmuuPd4/+PfspZB8ZgyOoWchnxXR129WtjiDNFttOTawwyWh3Fx6jKY9TeuygrJAnxcPMbDxzeKdEONSzrIxeQPLW/pV3CJxzrpIGzUTtOsULvDoZNPrDp2NhsA4vW6/oRwJErKSGUw9UDwTvfKTqA325yN3acXvHiW+AjcSpfgxThSe16e3kA2YoKGCFsyy1Ojli+UQZJ9rBOz58t/gBj+0DM7M7habEVgaeRMH02PV2WqG2pPzd/PJpQCUMLjooOWJJAeJ2NEMhf8S+b6sxbnn2Cx3QJFj1uKK0f9GvTD8ECYyLjPJC8AcneqCjVVmZq3yg8+fbYr/kkRF7bRsC5UYObuvi8bUYyApEz0KCUyK2OdTsEau4qwplS8j+iN7cWCF69KFcJeu
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR03MB3381.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2783026a-ebfb-433e-a1b0-08daf9356065
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 09:21:27.1733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 08itWtZY3KMEFs4XkQYw5AkcT6onNAzFsI57gxtQLWlBfHX88tqyfwXEUuct9NpvHKThvRfEzNYkqXB/qn4AQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6490

T24gMTgvMDEvMjAyMyAwNzoxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE3LjAxLjIwMjMg
MjA6MjgsIFBlciBCaWxzZSB3cm90ZToNCj4+IE9uIDE3LzAxLzIwMjMgMTU6NTUsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+IE9uIDE2LjAxLjIwMjMgMTg6MjEsIFBlciBCaWxzZSB3cm90ZToNCj4+
Pj4gKwljb25maWcgUkVCT09UX01FVEhPRF9YRU4NCj4+Pj4gKwkJYm9vbCAieGVuIg0KPj4+PiAr
CQloZWxwDQo+Pj4+ICsJCQlVc2UgWGVuIFNDSEVET1AgaHlwZXJjYWxsIChpZiBydW5uaW5nIHVu
ZGVyIFhlbiBhcyBhIGd1ZXN0KS4NCj4+Pg0KPj4+IFRoaXMgd2FudHMgdG8gZGVwZW5kIG9uIFhF
Tl9HVUVTVCwgZG9lc24ndCBpdD8NCj4+DQo+PiBZZXMsIGRlcGVuZGluZyBvbiBjb250ZXh0LiAg
SW4gcHJvdmlkaW5nIGEgY29tcGlsZWQtaW4gZXF1aXZhbGVudA0KPj4gb2YgdGhlIGNvbW1hbmQt
bGluZSBwYXJhbWV0ZXIsIGl0IHNob3VsZCBhcmd1YWJseSBwcm92aWRlIGFuZCBhY2NlcHQNCj4+
IHRoZSBzYW1lIHNldCBvZiBvcHRpb25zLCBidXQgSSdsbCBjaGFuZ2UgaXQuDQo+IA0KPiBJZiBj
b25zaXN0ZW5jeSBiZXR3ZWVuIHRoZSB0d28gY2FzZXMgaXMgdGhlIGdvYWwsIHRoZW4gd2h5IG5v
dCBhZGp1c3QNCj4gY29tbWFuZCBsaW5lIGhhbmRsaW5nIChpbiBhIHNlcGFyYXRlIHBhdGNoKSB0
byAibm90IGtub3ciIGFib3V0ICJ4Ig0KPiB3aGVuICFYRU5fR1VFU1Q/DQoNCkJlY2F1c2UgdGhh
dCB3b3VsZCBiZSBhIGRpZmZlcmVudCB0aWNrZXQsIGFuZCB3ZSBoYXZlIGVub3VnaA0KdGlja2V0
cy4gOi0pICBCdXQgbm8gd29ycmllcywgeW91ciBzdWdnZXN0aW9ucyBtYWtlIHBlcmZlY3QNCnNl
bnNlIGluIGEgd2lkZW5lZCBjb250ZXh0LCBJIGp1c3Qgd2VudCB3aXRoIGEgbWluaW1hbGlzdA0K
aW50ZXJwcmV0YXRpb24gaW4gb3JkZXIgdG8ga2VlcCBjaGFuZ2VzIG1pbmltYWwuDQoNCkJlc3Qs
DQoNCiAgIC0tIFBlcg0KDQo=

