Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A8457E054
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 12:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373120.605197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEqIX-0007CV-Hb; Fri, 22 Jul 2022 10:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373120.605197; Fri, 22 Jul 2022 10:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEqIX-00079q-EY; Fri, 22 Jul 2022 10:54:21 +0000
Received: by outflank-mailman (input) for mailman id 373120;
 Fri, 22 Jul 2022 10:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DAbQ=X3=citrix.com=prvs=1958f3fd3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oEqIV-00079U-5y
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 10:54:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f564993-09ac-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 12:54:17 +0200 (CEST)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jul 2022 06:54:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5087.namprd03.prod.outlook.com (2603:10b6:208:1ad::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 10:54:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Fri, 22 Jul 2022
 10:54:04 +0000
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
X-Inumbo-ID: 9f564993-09ac-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658487257;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=u+w0/tVtW6tFrWYY1ZR9/pMCOsgMzQV5sFVeVE8gFyw=;
  b=J7n65L3OVUAuaiCmME6EIYCxHUsqdVZsOfR1zeGEOkHGWLI7S8N0CA6A
   QB2AePmAbRTuXgXfAckcmCI92Sh3bKTmIlmytbrRSGxd3hfFxHxkz4IkE
   66mdWld2llI2cuhKGEolBs/+Po3EDo5psdmN4ULaamsmzuNE8cT4vjsxl
   0=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 78971298
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FaZuYaMfDwEoOcHvrR1YlsFynXyQoLVcMsEvi/4bfWQNrUohhjMDx
 zEaCmuEP/2ON2Sjc4hzaty3/EsP75/TytBkGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMtPjZ8EoHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPw2NR2A2YZDLc/xeR0G0pj+
 MMkEys0O0Xra+KemNpXS8FKr+F6dYzHGd1avXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr3wCCgLFW0q3rMzUYzy0HVwBZ8z/7GN93Nd8bRbc5UglyZt
 iTN+GGR7hQya4zOlmPfoyLEaunnlwj7dr8bH5+CyNFoo1nP6V4PBDYTbA7uyRW+ogvkMz5FE
 GQI8y8ntoAu90imSNbsUhn+q3mB1jYAUt9ZCKs+5QeC26fQywefGmUACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcAbyIZSQoO4/H4vZo+yBnIS75LD6qdntDzXzbqz
 FiirjU4wbMajscJ1qCy1VHBnz+o4JPOS2Yd5QjJX2Tj8gJwYqakYZCl7R7Q6vMoEWqCZlyIv
 XxBl83A6ukLVMiJjHbUH7pLG6y17fGYNjGamURoA5Qq6zWq/TikYJxU5zZ9YkxuN67oZAPUX
 aMagisJjLc7AZdgRfYfj16ZYyjy8ZXdKA==
IronPort-HdrOrdr: A9a23:lKbVwKO4dxLqBcBcT5j255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKRyXcH2/hqAV7EZniohILIFvAu0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrjVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yfT9aw+cyDpAVr4RH4FqjwpF591HL2xa1u
 Ukli1QevibLUmhJ11d7yGdgzUImwxelkMKgWXo/UcL5/aJBQ7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZtNkIPkjgZJq3PoiFXluYd49NTO/7JpiHP
 hlDcna6voTeVSGb2rBtm0qxNC3RHw8EhqPX0BH46WuonJrtWE8y1FdyN0Un38G+p54Q55Y5/
 7cOqAtkL1VVMcZYa90Ge9ES8qqDW7GRw7KLQupUB/aPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CES19cvX5aQTOYNSRP5uw+zvngehTMYd228LAu23FQgMyOeJP7dSueVVspj8ys5/0CH8yzYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.93,185,1654574400"; 
   d="scan'208";a="78971298"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lr/Rfk3uVMzC/VUIHF2pWsMS8BK0FnzBXiH2zSftLw0QGEoLkt/znIi8cyzNunP5bRfMNmc1cUyOYp0mhICStA5xENfxAsVMnEaGeLbCMVgF5rFlvS3JK+sxLMhej/nRP4xnBeFTVcZbxdMtVpW0tBZHmhylthNBTp/4To256l+qMSX8MRgyJfEhAq2amthb78gUFpAJlj9XVTZ9WpFnMv+V78rK/88a7Gu6/RqTe89FU/SWdX2pIjSPfJNFG7lcwVSYfv75usbkJU0wpU76veM9WID3qmGNeTiGEFBrHU704AfnT6CSbU3cswkcePRf+1ycUtF3M+EQoPcUWpbSug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+w0/tVtW6tFrWYY1ZR9/pMCOsgMzQV5sFVeVE8gFyw=;
 b=n4L/7oQGjqgG4v8O7vK/KwImjoUK7Yhgv5AtO4v8pDE7ztTsY8Io2F+beYV+KGobiSmJmKXMVUgHXNahOKPgbsNoi65Yk2Xnx+OBhkHvF3xGBsVSvh5j1rkMbuEHkxJ5co5MniqPS1zUc7MfOeLfnG/W/478QLV4wo3J1Dj5nErxKzjyzr0zhmb60qm1+DfClMtq7aZHtexmrp8xyWMs8niZrCdqUwH2hgxmL3BHDGuITOJI1TTStAjojLgwoO/fqxRelS0urqlexYeMSIFGPx1IoCgiSECPfmTsXSJYhI2cVQtrHGDf8Guzn0Aj0NcftIi9G+0tYyBe4pqngpjCng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+w0/tVtW6tFrWYY1ZR9/pMCOsgMzQV5sFVeVE8gFyw=;
 b=q0FmXhgQWRnqogfN621MrTCd78DuVAoD94xBJ2cBVMT4st/hkUoFK1s200saauKFoV7KhIx5OXbRTA2Mvv8QEqV/QmQg/hvLrmA2CpO71Uyd1QYxwpdBbtaM6EZ26/kNVXwo1Zhgtfcjx//YCyEfhshWtGf7g1tju7w4OQuIXAY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
CC: Tamas K Lengyel <tamas.lengyel@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, George Dunlap <George.Dunlap@citrix.com>
Subject: VMCS perf, Was: [PATCH v2] x86/mem_sharing: support forks with active
 vPMU state
Thread-Topic: VMCS perf, Was: [PATCH v2] x86/mem_sharing: support forks with
 active vPMU state
Thread-Index: AQHYnGkyeHzLfYftlkqMXoeeKAYG062IuvCAgAAJBwCAAXXsgA==
Date: Fri, 22 Jul 2022 10:54:04 +0000
Message-ID: <27a2e492-3374-0f66-d571-d067f5c8f22f@citrix.com>
References:
 <a8a66208064c209e65c08380c59bc6aeff5f57f8.1658340502.git.tamas.lengyel@intel.com>
 <cb26974c-2eb1-d27b-9de2-cbd3b501cb62@citrix.com>
 <CABfawhktWg0T8RU_hxsE3MqWDovX1tP5P=d80rQsOS28AsYtSg@mail.gmail.com>
In-Reply-To:
 <CABfawhktWg0T8RU_hxsE3MqWDovX1tP5P=d80rQsOS28AsYtSg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eeaa2ee2-f350-4c9b-f277-08da6bd07e3d
x-ms-traffictypediagnostic: MN2PR03MB5087:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Xbyl6e3OI78lUSOmVHjtJtgOH8aP5BF6cKr4FXRzcFTXbKM2nsiuvv92hjInDo3aq7QYE2FzHyCbV8OpqnvMd/UqhLo/gQ094SwbNEBKvSUqihIC+HQpJe7MwLFrQw/K0NYXbId6LvujhX9mu2UgelmbznPFw5m6wQsy3xKtzust0lyjhA25Pcst4zVRfGNhxe0w6/q+mxFq6OUaTUqpaDJqb99ebZ5ri2ludSxk7cKRyvOcDGt7hojZnlEBrqkKEPS1jHu4Y8bOFP9AUslSdI2d3nwb2p1GnZI5fYyJozuokUDMqsdoQcNqvdzS1AcS+dPnRvQeCbgzYeIu/+pli3ErnQIcUq/0wF0R57B/ejLMX+kPYJr9S8uVNZ3T21cSmCMW375RKhyqMt7dM/EG+nkrg/WluWWXOf2pSWBuCg6ZtnTh3sAyc4bJ5y/mG4ahbLVWmJ2EIW0F2PyG3dukLfCUh4Yx/7UTX1pA+89lZ8NOM7W3ajv2dp3dJjI78yQluyReaX5KKGy6QBYOxt/X+NKQV0+ea6MtIoqk9f4xTUyHJUJeslOVhASBcNLltLcfM+Ix340Of9upGHbTUPbc+81E/Pmp339I8f6NaKv3PX1R8CtvgCQOh5YLdLjy+X4tTuX1xAw3+E70n4sMkZbXark6ryS3JSQL/NPHcXjcKhfyUsZvs3kAe8WdY2l3QTqdmUnKFYZBuWvQNbv1/+9GL4qg9w8NoF/prSeawVJ9JYR9DmsVc/qj9gJYhqLH2uf211A93f75tZ2H5MRsqolrHvvHbpS5mKbxyCnSxcfYmIAXpqV8XCBIalOECWKapd4BXvqqz/fQMj5aUDi7rslh7xrCb4hnl4duqNoloRO2154=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(4326008)(8676002)(64756008)(66446008)(66556008)(66476007)(71200400001)(66946007)(76116006)(91956017)(2906002)(6512007)(82960400001)(41300700001)(478600001)(8936002)(26005)(5660300002)(38070700005)(86362001)(6506007)(31696002)(38100700002)(53546011)(6486002)(122000001)(54906003)(186003)(36756003)(6916009)(316002)(31686004)(107886003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QmpVMTRoU0oxUG85NkFBVUJZRGd3YmIraHRONGhma1pLWkxtWnArMS90UnQ0?=
 =?utf-8?B?ZzArV3JOK3h2N1RLclRPUHdsczAxS3dzamZZUWZjcHp6dVRjUW1TaXIySExC?=
 =?utf-8?B?dnZXVEl5UEhVa2dtSk5ra0w1S3pNR3FQRkY3WCtQZ0dlQUd0eVJ1dGtiT2Vr?=
 =?utf-8?B?MlJsWTU4ZE1DUTEzM1N0QS9rcXVySlVDNjI4VXIvcjJhNTlma0tFZTArK1Ax?=
 =?utf-8?B?L1JaT0l0V3M3NVJaQ2ozK1hiK010NnhxRm9udkpEUFV0NXhMY3B0R1FYc3lY?=
 =?utf-8?B?TXFVNWhya1NJdHFhTk5pRGpRa1JRM2wydjU3VHM2WFdiSmVjbDVXcjVkWTVy?=
 =?utf-8?B?dGFQQTNRTHhxckQvMTlHbytuT2hyalZ0SWZ0U3p1Q0lFWElCYlVzUlpSMy9H?=
 =?utf-8?B?cENQTE5tUFQ0bVVGYTRsSWcrY3VDTHEweWJscXNKOVZRR2VBaFIzRXh3Mm9k?=
 =?utf-8?B?LzBZV2hpRTQ3UzFxamdPK1p6SHZQdGF0OTFIVEFTZzlsakE5SytvSUJ1d1o0?=
 =?utf-8?B?ZTF2WXVQRjBJN3BVQ0VQa0xHMkg2WUJzUCtCUmVnQ1pvT0Q4Q3RoSUxIeEpy?=
 =?utf-8?B?UjZzQnRWMGtWN3RUUXgyckRSdm9HTzRHTnUvMEhKWmtRRGg0VkNKWFd0OWFh?=
 =?utf-8?B?ajlkYStsTWJmeUJyRXBpR1Q4UmtKRzAwaURVMWYwOWVrQSthZENPTUp6Y2pv?=
 =?utf-8?B?c1BhOTlLUzIxUUNpYWVJN1NQY2RieSt4ZGRxMzNRL3BHSE0vbkFTeVRNUWYx?=
 =?utf-8?B?anVwMVVwcEU1RnNrdXdEa0Q3c0IxRk82Nmp2VCsxakhiNEhYblBmK0MxU3cr?=
 =?utf-8?B?MmVKWWxpWXYrREY2Q0ZtbHlJRjQ2eUVXU2U3cGhPZytkYUhlVEV6ZnhzYlhK?=
 =?utf-8?B?SzhKTGR3bFpUUkprSlVJZlZ2d3o3U3VobXRCdVBLWENqY05EYjFDYTB6VlhB?=
 =?utf-8?B?OU1pdUw1N2I5MUsvMlUwSUw4aDFtVE1CMnRSSVNjM0svNHpaOSt0UVdISVlW?=
 =?utf-8?B?NmVhUEc0aVRyekdHLzhneE9YZnF4dEY4aFY2NnY5MHJmU1pDWFlNS1dMWkU1?=
 =?utf-8?B?ZFVYTDZTMzFtclQrTzVhU0Z0NC9Zd25kYlROaUd0cnNycmE0d01nbUZ6Z1Ji?=
 =?utf-8?B?MEcwU3B1NXJnajNQdUh4d0k1Rm53MWs1VitHempWRGQzS3Vkd2ZhU2wzRlBx?=
 =?utf-8?B?WGZrY3BXbS83bEZhNHlISldlZyszb0REVUFvTjM0dloxRC81d0dpQ09FS09N?=
 =?utf-8?B?ZXVCTFhvUWJIbFZoVEZ3czllSzRpUHo4bXh3ZVF6c3E0TVdPS3pZekxOR3lq?=
 =?utf-8?B?L1JoUzRUNHNqc3hrbkhtdzRYZzFNWkR0aW1Ib0dpOElaMkh3MDlkZXVYRzJy?=
 =?utf-8?B?Q2JlVVZ4SGg5eC9lUDZod2FzTkVzSkZoSmJ1Zm1UNm5MUG5PUFFFdjVBcVRo?=
 =?utf-8?B?bURKNENrWU8rZi9rS280dkRYU3ZTd2VxTnFtUkpzMkMzeWxySGRNUUM5UmZG?=
 =?utf-8?B?QTJWWDl5RVRKTjBvK0kyN2dOZFBtcml2R3ZNMkVEVjRETzNmUE5KVUdDV1Fr?=
 =?utf-8?B?MWlabSs5TGg2MXp1dDRUQW9pQlB5UUJVRExTWDJXa2tXLzZORUxxbkVwMjVm?=
 =?utf-8?B?dUJxYUJSOW9CK2lwSXdsMjdPVHVKZkUrVVZoYTN3NjZWdUtNZEJVRmpUMUQ4?=
 =?utf-8?B?RHFpZUFkWjlyZkdUMlMrUmN4TkFlVnFMQ0sxeVo4ZFM2ZVM2eWUrNFI2SU1C?=
 =?utf-8?B?OHkzWjZPdE04OHduTElDYy96TExGeHp2YmMrZTV5Y09DTW5mZll4TGNqbU9X?=
 =?utf-8?B?TDJZSEhYVnNHaFFPb1NsS3g0ejMwYk1GZEVkNlFpTmF4VnJWL2Y0dFd5V0JS?=
 =?utf-8?B?cGxWa2VhWXIwSlJNWW8zaXVadkxlREMycWVNVCs3aVd1RFFoMzRRVWZoMDFP?=
 =?utf-8?B?bGFML2tDOVBONW5rbHpHSG8rMnZXMXM2Ums1QVZqUEROc1pUTWVRZEswVmJH?=
 =?utf-8?B?anB6Wmp4cnZqK1EyZXhHREQwcmpEWVhCaXRiekVZbVlvZmYrSEY0Szkwa1ZR?=
 =?utf-8?B?WkZoNEYxcVdMalNGSTdML01vN2F1eW1MUnAvTGZ3Y01XdXlHOWhTdTdRMXND?=
 =?utf-8?Q?lp6TB2eP8P0q8j3WwHLiU3J9t?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C62546923F49A49B291653060BFB95D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeaa2ee2-f350-4c9b-f277-08da6bd07e3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 10:54:04.1392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e5Jl8p2aGlGil89ifUBGFuCqx1owEWdmdhYVxsgJU4p2u0tWAmTn6DdLxzjuwnL8qC23lO0GfFK+ABPZmcA4GYgoypx5Nx4seS8mRYoe+sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5087

T24gMjEvMDcvMjAyMiAxMzozNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPiBPbiBUaHUsIEp1
bCAyMSwgMjAyMiBhdCA4OjAzIEFNIEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJp
eC5jb20+IHdyb3RlOg0KPj4gT24gMjAvMDcvMjAyMiAxOTo0NywgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOg0KPj4+ICsjZW5kaWYNCj4+PiAgfTsNCj4+Pg0KPj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0
IGFyY2hfdnBtdV9vcHMgKl9faW5pdCBjb21tb25faW5pdCh2b2lkKQ0KPj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfaW50ZWwuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9p
bnRlbC5jDQo+Pj4gaW5kZXggODYxMmY0Njk3My4uMDFkNDI5NjQ4NSAxMDA2NDQNCj4+PiAtLS0g
YS94ZW4vYXJjaC94ODYvY3B1L3ZwbXVfaW50ZWwuYw0KPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9j
cHUvdnBtdV9pbnRlbC5jDQo+Pj4gQEAgLTI4MiwxMCArMjgyLDE3IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBfX2NvcmUyX3ZwbXVfc2F2ZShzdHJ1Y3QgdmNwdSAqdikNCj4+PiAgICAgIGZvciAoIGkg
PSAwOyBpIDwgZml4ZWRfcG1jX2NudDsgaSsrICkNCj4+PiAgICAgICAgICByZG1zcmwoTVNSX0NP
UkVfUEVSRl9GSVhFRF9DVFIwICsgaSwgZml4ZWRfY291bnRlcnNbaV0pOw0KPj4+ICAgICAgZm9y
ICggaSA9IDA7IGkgPCBhcmNoX3BtY19jbnQ7IGkrKyApDQo+Pj4gKyAgICB7DQo+Pj4gICAgICAg
ICAgcmRtc3JsKE1TUl9JQTMyX1BFUkZDVFIwICsgaSwgeGVuX3BtdV9jbnRyX3BhaXJbaV0uY291
bnRlcik7DQo+Pj4gKyAgICAgICAgcmRtc3JsKE1TUl9QNl9FVk5UU0VMKGkpLCB4ZW5fcG11X2Nu
dHJfcGFpcltpXS5jb250cm9sKTsNCj4+PiArICAgIH0NCj4+Pg0KPj4+ICAgICAgaWYgKCAhaXNf
aHZtX3ZjcHUodikgKQ0KPj4+ICAgICAgICAgIHJkbXNybChNU1JfQ09SRV9QRVJGX0dMT0JBTF9T
VEFUVVMsIGNvcmUyX3ZwbXVfY3h0LT5nbG9iYWxfc3RhdHVzKTsNCj4+PiArICAgIC8qIFNhdmUg
TVNSIHRvIHByaXZhdGUgY29udGV4dCB0byBtYWtlIGl0IGZvcmstZnJpZW5kbHkgKi8NCj4+PiAr
ICAgIGVsc2UgaWYgKCBtZW1fc2hhcmluZ19lbmFibGVkKHYtPmRvbWFpbikgKQ0KPj4+ICsgICAg
ICAgIHZteF9yZWFkX2d1ZXN0X21zcih2LCBNU1JfQ09SRV9QRVJGX0dMT0JBTF9DVFJMLA0KPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAmY29yZTJfdnBtdV9jeHQtPmdsb2JhbF9jdHJs
KTsNCj4+IC9zaWdoLiAgU28gd2UncmUgYWxzbyBub3QgdXNpbmcgdGhlIFZNQ1MgcGVyZiBjb250
cm9scyBlaXRoZXIuDQo+Pg0KPj4gVGhhdCB3YW50cyBmaXhpbmcgdG9vLCBidXQgaXNuJ3QgYSB0
YXNrIGZvciBub3cuDQo+IEl0IGRvZXMgZ2V0IHNhdmVkIGFuZCBzd2FwcGVkIG9uIHZtZXhpdCBi
dXQgd2UgZG9uJ3Qgd2FudCB0byBkbyB0aGlzDQo+IHZteF9yZWFkL3ZteF93cml0ZSBpbiB0aGUg
bWVtX3NoYXJpbmcgY29kZWJhc2UuIEl0J3MgbXVjaCBjbGVhbmVyIGlmDQo+IHRoaXMgaXMgc2F2
ZWQgaW50byB0aGUgdnBtdSBjb250ZXh0IHN0cnVjdHVyZSBhbmQgcmVsb2FkZWQgZnJvbSB0aGVy
ZSwNCj4gc28gd2UgY2FuIGp1c3QgZG8gYSBtZW1jcHkgaW4gbWVtX3NoYXJpbmcgd2l0aG91dCBo
YXZpbmcgdG8ga25vdyB0aGUNCj4gZGV0YWlscy4NCg0KVGhpcyBpcyBzcGVjaWZpY2FsbHkgd2h5
IEkgaW50cm9kdWNlZCB0aGUge3B2LGh2bX1fe2dldCxzZXR9X3JlZygpDQppbnRlcmZhY2VzLg0K
DQpMb3RzIG9mIGNhbGxlcnMgd2FudCB0byBvcGVyYXRlIG9uIGEgc3BlY2lmaWMgcmVnaXN0ZXIs
IHdpdGhvdXQgd2FudGluZw0KdG8ga25vdyBpZiBpdCdzIGxpdmUgaW4gYW4gTVNSLCBvciBpbiB0
aGUgVk1DQiwgVk1DUywgTVNSIGxvYWQvc2F2ZQ0KbGlzdCwgb3IgaW4gYSByYW5kb20gc3RydWN0
dXJlIGluIG1lbW9yeS4NCg0KVGhpcyBpcyBhIHBlcmZlY3QgZXhhbXBsZSB0aGF0IHdhbnRzIGNv
bnZlcnRpbmcuwqAgT25lIHBhdGNoIHRvIG1vdmUNCk1TUl9DT1JFX1BFUkZfR0xPQkFMX0NUUkwg
aW50byB0aGUgZ2V0L3NldCByZWcgaW5mcmFzdHJ1Y3R1cmUgKG5vDQpwcmFjdGljYWwgY2hhbmdl
KSwgYW5kIHRoZW4gYSBzZWNvbmQgcGF0Y2ggdG8gbWFrZSB0aGUgVlQteA0KaW1wbGVtZW50YXRp
b24gY29uZGl0aW9uYWwgYmV0d2VlbiB0aGUgTVNSIGxvYWQvc2F2ZSBsaXN0cyBhbmQgdGhlIFZN
Q1MNCmhvc3QvZ3Vlc3QgY29udHJvbHMgZGVwZW5kaW5nIG9uIGhhcmR3YXJlIHN1cHBvcnQuDQoN
Cn5BbmRyZXcNCg==

