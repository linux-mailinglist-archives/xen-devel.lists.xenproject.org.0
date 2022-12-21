Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3258F6536BC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 20:00:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468057.727135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p84K1-0004jP-EC; Wed, 21 Dec 2022 19:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468057.727135; Wed, 21 Dec 2022 19:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p84K1-0004ha-A9; Wed, 21 Dec 2022 19:00:09 +0000
Received: by outflank-mailman (input) for mailman id 468057;
 Wed, 21 Dec 2022 19:00:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KbXi=4T=citrix.com=prvs=34759bb5a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p84Jz-0002pH-BU
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 19:00:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ade64202-8161-11ed-8fd4-01056ac49cbb;
 Wed, 21 Dec 2022 20:00:06 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:00:03 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5859.namprd03.prod.outlook.com (2603:10b6:303:98::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 19:00:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 19:00:01 +0000
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
X-Inumbo-ID: ade64202-8161-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671649206;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RbclncoVbgdXQF+YOzj9EEjLv2T1S1W8pU8G8qIRWWw=;
  b=QdlV2apoTiXWgBUAjHA8l4W10nnQdUUeQ8ENCVVFuXRYdXWU4qb25BrX
   fE7DvSwlmpMaMd08FWgzPijUsiMgSe4YYusSx3sm+NoD/Q/6t8lfmSCRE
   UjzFdPkf+NyZbgH7zVPHtRPMGY1DWQ5TRoizGjlqAvRRTWEGPjK/sdTC2
   E=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 89547064
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rr+W06wvXV3O8m+q+S16t+cGxyrEfRIJ4+MujC+fZmUNrF6WrkUPn
 WQYDz2HO/aCamCnLY9xbty3801Uv5Lcz4JiHQdq+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkP6kT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUpEz
 vsKNTIoVQvdhdiI5YK7W/tUutt2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIhuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAurCd9OS+XmqpaGhnWVnnwfVjAbeGeF+9TmskyyBfFYE
 UAbr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9BXMDYAcUQA1D5MPsyLzflTrKR9dnVaSz3tv8HGipx
 yjQ9XZuwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:UNIZ96D4SGbdcprlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.96,263,1665460800"; 
   d="scan'208";a="89547064"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AywTzAT0nHghSnQvAWHjdo4PjUudt4uLoV1AE4OMynGgkiG1TQxIFPojEXVSGXQ8pfdlgD0zOvI7qqj2Ui37wnd7CJBdNgnsZDZQNotxaLWybzR2rapfgl19LzIRPpFivRgUygcIuvRA4g6lhxt57DMisYkjtH0ZnuN31cGUO7vHx6+v/sKs4quYZZiOr7e0mPXeqpucCweKMWo8hgfy6XbS+ZI2imCes3uOutQz5XILH7lqv9rcnqIKI+LNj+Sb+I5vB35bf+8DTNSTIt1pbRX7J25EOtNkWlqvP/n1s4Rdt2bVE4FX9p18xVm3/8fN7FpKVe0cyp95gEYRUWnjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbclncoVbgdXQF+YOzj9EEjLv2T1S1W8pU8G8qIRWWw=;
 b=iUU55zbiZL4tC/EDILl1gmoqjDwUtk2b4pwE/OlP7BlP7NUehDnvcWZkI7sbovsDQaQxKOBC7rua6YRzP1arCg6g8bSpJzGd4fXRetBNTpSffcArDzqdlXu82Qk1e+74f74VBQSE7mKn7ZIUjGcqhQo1SOSaCjVbp+0QXQr68KrxwlsVqZLURSc+fJ9d9y+eUphrxnhRGGy73Y8bFK4TuMoDMbrvKG9i6vrwdnm5+2630CHWe2+QsMTLzuXYoUDVh2pH8sXZluxWO9SQMlFc5zYNOFAT+23G0CKF20Qcvi/LkEujaozfxnSxwQ9kIbi1ZqunVJ443tBwaeRq/uTXPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbclncoVbgdXQF+YOzj9EEjLv2T1S1W8pU8G8qIRWWw=;
 b=BPR8+KHuJXiqfjvLKt9W8ZZ85SAaWkEUrkgANz24r4+cCiGYjBBX664TAjY7ka9CNx3uMKkUb/Iiq4YsFqKDi+AnSAbDvF2T4HPp4+wo6vsHHtbx4dLxfdw6OKQHCW67CwaU7pbuzcN1YhNN+hNuG/QAp2Lue94LoKYqXEytWI0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 8/8] x86/shadow: drop zero initialization from
 shadow_domain_init()
Thread-Topic: [PATCH 8/8] x86/shadow: drop zero initialization from
 shadow_domain_init()
Thread-Index: AQHZFUAU/A5RQl7RQEe98/BvQBpuMa54slkA
Date: Wed, 21 Dec 2022 19:00:00 +0000
Message-ID: <76d74293-8763-c184-c798-05b2e1eb8335@citrix.com>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <3410c8cb-57d1-dcb8-ab58-dcd3ca6748c5@suse.com>
In-Reply-To: <3410c8cb-57d1-dcb8-ab58-dcd3ca6748c5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO1PR03MB5859:EE_
x-ms-office365-filtering-correlation-id: a1eb9f83-f9f6-48cc-e50d-08dae3858fe1
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +izQ9wYA23S3/v/gFENwH6CUCGW3IHlAXPwgFcOsMALFsoyAFbsO2i6IIHpt13ZK7GA10gkh1QbvZ2STC0z+DMeajSdmubn3OqmNDqo/qDTebXgZ1EJQcUuHMZjHxYAOFRLBsY5VNN5lUBdgaUlqiryuIp3lsAKV9RwA3LDINBuc2+snZ5jGZHDlLuKOfkPQi5ex0wFiS8bqtoaROM+Y9rFpPD18OHSBJUZIhu/KHNCNLkXU0DQS94P1OfK8DwDtGGJHaF+esTY6zQvlNdUrlSWf05IbLxy5gQ5qTfDMzEOQw9MQZOit75lW+rhxeg+kEir7V20u3EzyVj3IiPihhpV8YneHnK2zNMsBTtcY3hgPNt/zOH3wMD+wGVrE4mbowzwzXPOuTbQwmoF6/t9tXCMUFszhx48mWTVq36gVspn0olmj8FfivrItX5vB1CREGKsexA7ikp4rREGIKSFrIh1luFnhAT9SeB7++uajFTwrw9qKAPm6wqcoT2493DWdF6MUk7zU4PWDOjS7LR0DlcKnQxHxzAY9UEMsP5al2nauS4MwP9y7T0D5wZ/YXxiwYPG+aDrPmjPbDuTOqimhsXU68EaoE8YmWr/731yL1JR6sqJVrlSb0pii69CQ/m3gvy3bRa2MO5IEckH15k4Oy3kRiHrrx29YnGS2b2ctRcTv4ykjFZ1kaMilduG0XvAg60ZkWX0SddwbnrEwaV3afreRfwXvIWuHpJTBa3/pyaY/3YUbkrrq4PdFmXSvf/XSdrSdh0l/3e05gr8QsWS66Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199015)(36756003)(110136005)(54906003)(316002)(38100700002)(2906002)(2616005)(122000001)(26005)(71200400001)(31696002)(86362001)(478600001)(186003)(38070700005)(558084003)(82960400001)(6486002)(6512007)(53546011)(66446008)(64756008)(66476007)(8936002)(31686004)(66946007)(66556008)(8676002)(5660300002)(4326008)(6506007)(91956017)(41300700001)(76116006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGZRZjVBRThsblNTdXMwaVJQU0NsUWEyMkRSV2Z5WCtTRUlXMXptcnVJS2Yv?=
 =?utf-8?B?bWlQVStUNThMUXlwWmF2dzNGamFjUkh0bHVsSXJzRXl0MGtEbTA2Y1NJMS9s?=
 =?utf-8?B?Mkx6V1pFUGlHOVVsTlArQzNsSHluVTRWb0xuZ2o1RkNtRkZ4Ly8vZlE5ckRQ?=
 =?utf-8?B?UVRGZTFTNFZ5YWNHZHBDbnJucVFlMGgveklxem42T2RQUTcrOWQxZUZISkND?=
 =?utf-8?B?TVRaUW0vUVF4bzJ0RzZRSHMra1lJeG9MdXpHczl6L29LTnJueTMyTi82OHN5?=
 =?utf-8?B?UE1LMitQWjc2NU03Nk5xY3lTMVd1QnBUMkhXM1IvdnFNa2hYZUdPRWZZaXlv?=
 =?utf-8?B?b0txSDYrd2xpVW9tZ0xHZTBuSEpVbnBxSW5BRldzWGlEYXJuci9EM3dmcEp5?=
 =?utf-8?B?N2pkM25KOHA1YWxjZzdPTkp1RTZxbmlDanZDcXRqMlp4a0ZjejIyU2d4UTk4?=
 =?utf-8?B?SFl6cmo5cGdXVUt4VUhGK0VjRVp3aGZ2MlZoZEFXY2c1ZmlsUzRYNTFMbFNB?=
 =?utf-8?B?UUxPUnhxMjl2K2Q0OGJDRlhzTk9OKzBzb1p1VFRqMDRxSlFoOUF1WXZRSWZ4?=
 =?utf-8?B?dk9kL0ZkaU41MHdzcW0vT0xJU0w1eThmVWZiQncyZjVwREVYQlNUZ2hFOGVl?=
 =?utf-8?B?RmRLMzRhRnp6c3NHajkyTHNaL3Z0VXlkSGd1YzdNVWJtS2VnaWI2alJFM2NS?=
 =?utf-8?B?UFFTZDN3K3ZkdTNaMVBkOVFZUmM5VEVSNWhyV0Z2L3dHMlQ1Y0Z4WnBKNEtY?=
 =?utf-8?B?NDlFdGFicXl2Z3lKSzVXbTU1bUdFblN0WXpUczdXRnJ3L0xmMUlPbnNMTmI0?=
 =?utf-8?B?YXR3SzN2RUJ2NkRRY0NQTXVXNU5sWG1MdFpiSXFPNjMvMVdNVXlEakdJaVRn?=
 =?utf-8?B?clVDSi9sdnRhd0RZWUY4TmpaU0V6MCtuc0N3bDd4VmVtVkJCQ0l5SEg2cW9y?=
 =?utf-8?B?SnhsVVZ5Z29VZFcrVGF6eDlMaSs0U2hHNlBORnhWQmdMM3VmTTBQQjZ3SWpB?=
 =?utf-8?B?MTdRd1hxYWZIK0R5bm9wWTVSQ0N3RXBRZm5EQlEzVXZpRVdOaFMySHErdm5m?=
 =?utf-8?B?dVdYSU1pdTBMVk5qUU51NmZ6RVlqQjYrK3RHeWE5aDVYNk1FZlRTaG9jWWpq?=
 =?utf-8?B?WGZSWFN2N1N4N3dmVmpXRWJkNHR0Q1hBdjNpUmcrbm9oakN6Ny9rd0VnLzI2?=
 =?utf-8?B?ZHVJcG1ORlluMGloS3JpbGFzZVlVNnFPdTFJbGJXN3cyZTQ3S25pN01jZ0Vl?=
 =?utf-8?B?V2VUNDlDUTVqeEk0aGdkK0lFRFhrdVUxTWZ1b1NpejdtWFRnd3UvYmVYczg3?=
 =?utf-8?B?V2luVVJXQ2l5b3E2Yk9FN1AyZHhxSDN5MDF0VlppTGdrYStWekxleXAwTS9x?=
 =?utf-8?B?UjNLOWdDRlV6eVk3aVRHSDVCSU1qNVpidTV4R2VyUjZqWkJIalUwVkVuYTRW?=
 =?utf-8?B?eC9KMENFb3puSHJwR2hJaDdnYXF4UUxydGNhVUdaVFUzdzJoKzVQN1poNmxO?=
 =?utf-8?B?cGV5SWcrc0hpRWNCVWJxVC85bm1icjRGQVFJaE9yNUY4SkdSZVdXd0NGMVZn?=
 =?utf-8?B?b21TbVhrMzRKdmd4cWZyT092Um5WQXNzUTFtdm5CekowMWx5eFV3RHVmemRN?=
 =?utf-8?B?SjYrSWh2ZE1GS0hnaUw3Z2hLRGlwNzIxMUdIcy9LMnhCa25KZ1V2YXVFTmV1?=
 =?utf-8?B?MFRubWpwcksyZkNJc1EvUjBMMXBDc3hVNHZhVmpIUE9lZDhpWUVTY2ZGQXZr?=
 =?utf-8?B?VDJETDd5VUhkY2JDQXMwSXRUeFFrMEpUeitWaUNhcE81VGFoczlaSVhkMVZw?=
 =?utf-8?B?WnpQMUoxd0hyU0lXV1R0aE14U3pvckhLWjZ6bDNPSmMxdWpqQ3FPT2VyT1RR?=
 =?utf-8?B?cmg5cGhJZEdVN2FrMC96VFJVK2JCa2d0Q2RNRnBhNUtIbmo5V3MzcS9FdlR1?=
 =?utf-8?B?NVdFR21pZ09JblV1Tjh5NGxPNjg3UE1aUzFYQkp1SHFjSDVwUzhSOE96ZXp2?=
 =?utf-8?B?ZHNqeWNjVUZmVzYxMnlNU0dtVWFabmhHYWhhblNwUE8zK0U1aHhHV2sxTG5u?=
 =?utf-8?B?cjBzVXB5QVJ6U01kYlhnMVErQWNRaUpxRjFMd3NodXdTUUFjQVNmejBUcFlL?=
 =?utf-8?B?MFkwc3BNVWhaUmZFR05JcDg2K3dHSWh3ZHZCVnlzWklyS3RBTjUvWFd6aUJY?=
 =?utf-8?B?WWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C41784B398AC1469B3AF5DA28FB7060@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1eb9f83-f9f6-48cc-e50d-08dae3858fe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 19:00:00.9979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgba7YP8fLNCsulQ6oZGwFSAEoXWGFYDzKklSOg+iqVvlDF8Y1XblhBKqGfl2ToQ7ODulutvPYnG4/WlMzgbaR1bD75bLAxyumM+50kP+fY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5859

T24gMjEvMTIvMjAyMiAxOjI4IHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gVGhlcmUncyBubyBu
ZWVkIGZvciB0aGlzIGFzIHN0cnVjdCBkb21haW4gc3RhcnRzIG91dCB6ZXJvLWZpbGxlZC4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZp
ZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg==

