Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28DE63EF55
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:21:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450535.707864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hcp-0001qh-7q; Thu, 01 Dec 2022 11:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450535.707864; Thu, 01 Dec 2022 11:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hcp-0001oC-4w; Thu, 01 Dec 2022 11:21:07 +0000
Received: by outflank-mailman (input) for mailman id 450535;
 Thu, 01 Dec 2022 11:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/wf=37=citrix.com=prvs=32775c42f=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p0hcn-0001EY-MC
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:21:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d1797e5-716a-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:21:04 +0100 (CET)
Received: from mail-dm6nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 06:21:01 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 BY5PR03MB5063.namprd03.prod.outlook.com (2603:10b6:a03:1e4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.8; Thu, 1 Dec 2022 11:20:59 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 11:20:59 +0000
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
X-Inumbo-ID: 3d1797e5-716a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669893663;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=txA+m2MepZuyf0K3WmYbOOAhEQ4K7r69qQhi/nI/Mo8=;
  b=aaG//rEDXz3GlwNXCEO6+pAUU14QYxryaxyDibLUuT3eMJyBfAy7vMgd
   r+7wCwdPM7jNXcV40RxE1Ksf/CS1somZ1uGiUBySq0RwmA59LosxLrRkA
   W1wHxNeiW9rHBhpICDhErLRJFldi79JZimzoomRKKVJvZ2rXEwsMCnO5+
   c=;
X-IronPort-RemoteIP: 104.47.73.42
X-IronPort-MID: 86032890
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SK8x+Kq+v+a4Np79mhlqu5FIDOteBmIHZBIvgKrLsJaIsI4StFCzt
 garIBmAa/6DYzf1e9F/PYy/9koCuJfRyoM3SARtpHswHyIU+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaEzyBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAgtKU6cnOix+e+AZbB8i+QsceS3BbpK7xmMzRmBZRonabbqZv2WoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+OrbIC9lt+iHK25mm6Tp
 njH5Hj4CxdcMN2ZxTuK2nmtmvXOjWXwX4d6+LiQpqAy2wfDlzR75Bs+cF6Vs9mDjXeEd/kYA
 RcV2gZp8JMr+xn+JjX6d1jiyJKehTYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 lOAgd7BHzFkt7yRD3WH+d+pQSiaPCEUKSoOYHECRA5dv937+tlv1FTIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPeZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:OotdFKvzJAlAhZhJkKff11JW7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86032890"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5goLJqthuwoqkG0WeRFwgMdHmWFju8X4CHHSScn/LcKnAEy+LQn8GcRmKknv9zG6IK2HZspuAdanqiXeeN3v9dDrnR62/0TmUeoEDQ1lnnL+B5RY16v5LZjZIQv2CrbLt6akUVoZXzzXbbUeQzKPRW4CgudHk8p6TrDu+57+lhSvRn7Osv1IOHlbZQIKYgtxfzQB+9DZ6OBtG4T12kULonU7d+63zML9sRV4iWEHVPxFiYkxnlX0D0JgjNduEfSln1/pb2oLH7n+Kcyst7Gsj9mUBtmWEdi7HrokEjnsOD9U08Z66iFzEVPt8M9e6+Iw6zr6CPvYQCiZCQo4S8bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txA+m2MepZuyf0K3WmYbOOAhEQ4K7r69qQhi/nI/Mo8=;
 b=hBPzONfhUljsAvYqdoBZYuPUFBylE602F4gn9jp3NDN7ISYJNN1BqljP3pvXtSunjS/PlSkgQoFMqTiscJg1sJWoOh9COO7ZLAlY7wOuXEpOhyYadwwfUcX8BktLAYMvejqLbj035+DRhlzgxH8sfJayhSGcpTllSTHLZATtwPuJkFnh2FCBLQLl+nWw0/a6fSVxPJUkViDFXj5mhy7WPeUG5RwdU1uLsicPXLqosASDDyDUP/MwpCYNuDUX0CDWx7zp7dRZcMx0bPeplY3sM5aMA3Bb+Ij4xtfp8nuixIhXKarFkHW/IINa314KTUbL/SO3AQFRLIf/xsUz8DrOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txA+m2MepZuyf0K3WmYbOOAhEQ4K7r69qQhi/nI/Mo8=;
 b=cOcghOy9Ft8mZS56ycn30oPGVW+yJbl3AQ6T9YkVc5rNPv3T6R6sdzC2PeMu+SvXz4eAl7ATzQE7smJRj/I5E7hpfGfFZb2HPnX8SW/D9i9TIM5w8dr8Q9ZKfNfWFJcUDjjK3g025SDxZWXp7/qcR05mQEv8AsQ4thlwmGdz2k8=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Thread-Topic: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Thread-Index: AQHZBNyCM7ZphV/4jEuRLBRtweaKfa5Y5D8A
Date: Thu, 1 Dec 2022 11:20:58 +0000
Message-ID: <27ED9DA5-D63E-4F49-824A-74AD7149DA5C@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-5-andrew.cooper3@citrix.com>
In-Reply-To: <20221130165455.31125-5-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|BY5PR03MB5063:EE_
x-ms-office365-filtering-correlation-id: 2805ec9e-9cd4-4f4d-e976-08dad38e1f3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vc7TLHlMvxLfwItxAE3w9VFAB1Bm5oM3feRtT3q/y7ZI0cJRcxhc8Jin1VS5N11SNkvSZdVY+rZwX2TsJ7NJOhhEQZgiE24nFHcd9eeia7/HrGtaO0hX50w5k1m1VJEujiVRcad4FX8rPw9SN9zTpR6nUn5izF3ayn4l4V7K3Skfn8zVltxqMiX44zNs5Vv0VOZb6hg/0Wj/RGAhxL7mueSWIOLjK95cUrwszanVPYDWTLeiwJ8zr6wXxqPcFRb4BCrXwrhemFJRmQ8L24iRoaoI7boOl9EGL8Ka+OYBXRjYESb9lf0+DBt/e08iPONeP39UgMFP0DT+Xiava2x7JMn+96paf4ej9UPx7QADjKuf3DguX6XNMbvtdLA+bGRpOOgVBZUYWDSlciB4Jk3zvSqH08ko/XGGVpBa9KHlp7+SpMlrEeGxao+guZojX7NUHPqGYFsasnRNPiZdgOYc9V20yVMvdWNhLv1+0TdQVEWwMXrnefmqJEWYMMK8tzkW13YsMGDEIqAvZYYBVMV8pKXNjvQZ4xgOJpM3uxdcmJ8Tvvkg13J6+TxlVA0Ewxr23rHctgZ7FTMazrLMHVi8giZlPasTeu8n7BG4vfk2RY0VK5J9/JYD0ZCakHpHAyc+cJ6eYWJPL0KPDw3DtyaISJAZun9334cUcEJHN7MQ2fDgt/0ZI8WzsR2xBBbmluDPD2aohy3ob3fcGZJjFOuDqmZfhCI9VRfiRUTs0sFuVVk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(122000001)(38100700002)(83380400001)(86362001)(82960400001)(38070700005)(44832011)(2906002)(5660300002)(64756008)(76116006)(8676002)(4326008)(66946007)(66476007)(66446008)(41300700001)(66556008)(8936002)(6862004)(53546011)(6506007)(6512007)(26005)(71200400001)(107886003)(186003)(2616005)(37006003)(6636002)(54906003)(316002)(91956017)(478600001)(33656002)(6486002)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlZhU0JYRm13TEU3MTFveDFZbXpDSUh6d3J6Rjlla3pVbU4xRHU1TFpWeXU2?=
 =?utf-8?B?Zm55dFRmb3hlcU9kU1V5WlUyb1JQbndUc0dFVVBLUStEa0xFS3VMMzNqZ1No?=
 =?utf-8?B?MmFFcTllTHNnQTdqYTRMcStaa3JnUzJ0YkwrUU1ybzkzY3NtVXFCRlZ2dnhT?=
 =?utf-8?B?S3FGTGVDUDQ5NDYrUEw5MUFOOTAwMHV5MnF6VEFSc0ZSMUp3RHBQVyt1K3Fh?=
 =?utf-8?B?N0dJQ1NYaGVhZmNEL1hHbEM4OHQwMUpZa2hYSUpuTWVmRlc2YkdKbWZlY0Y2?=
 =?utf-8?B?K2hQTjRLRTkvNHB6UTdMbWZCemdZajJXb3dXb3dGZWN2eXlJYUxGRWJVZmFC?=
 =?utf-8?B?aExYR2hOK2lCaTV0RFN5N2JzbXgxd0FrZ2hVMWNsdFJaazgzZFcrQ2tRRDBM?=
 =?utf-8?B?QmNJTWJaR2Z3OCtKNmNhL2M1eWVLalZZTmZncXYwL2F3b1ExWnF5WEVQVkhj?=
 =?utf-8?B?eGtRdnFlb1lJQmFGYTdBa1JRSXVFWUxUV1JYMkluWStuOUtiSzN3OXdES2h3?=
 =?utf-8?B?YTNMelM4SmVFeEJGdTRIT0tYNkNpaDVqbDlnOHJJSmM0SVRzODRQVm5lTlBl?=
 =?utf-8?B?WFpuSDJ4Q0tFWDV4VzNBeEVKUjRJUzBjVjRvN0Z0cEp0Q1lSSm5Kc1k3SVRC?=
 =?utf-8?B?cjBaeC9xQ3c1Q1RmY2ExSFhlODh4VGlUWTk2UWFCYW5yc3ZBbHdqeGhNdXZk?=
 =?utf-8?B?TVk0RVNjUzY4OUlFbW1SNFFFWGZJNG56VUZQWURjOFR0QmdySURHWk8vaHpo?=
 =?utf-8?B?ejRRY2VyU29SU2xTb1daVnl6NHp1UkR6eitGb1o2VnZaUE82bDdSbFlOMlU2?=
 =?utf-8?B?cEN1TDlNR2p4WmNrcndZYjVWVTVVK2wxVjM0K3lOZFFWNmFnckdIVEg2ajBh?=
 =?utf-8?B?UlpSemNwbzV6UFlCUzBYTlk0a1NuQ2tjNG53SWFqU3UyS2xValNxMlpPTzRN?=
 =?utf-8?B?M0FocXZ6U3dCTHdxY1hXWkxzaUZDNFQxQjJyWHRHcUdTVjFnL2tiM0JacC84?=
 =?utf-8?B?cDArVjI5alQwM0JSRnZjM1pPd3FBR2kzMVczQzZTOHd5WVZOcHU5a0hHTi9B?=
 =?utf-8?B?ZFRiOFZ0b0RUOTdUZ0F3Wm9WYnkxSm5iZ0MrQWtjUFVha0VCZXJhNlJrdjAy?=
 =?utf-8?B?T3puMkZjMkdiKzc1TlhqVm1TSlBaNThFME85MFdzSis2djJnOVUrQkxmV3U2?=
 =?utf-8?B?YldhUUR5UGMxMnlYbXJUaUFsZXk4bG9JUFVDSTNNeGRaR2pYNTZGMTR1cllx?=
 =?utf-8?B?b1pRZ3hxdVoydGVieXV0VTZzS2h4ZkZFVkdIVi80K0pQOHdVclBTbVlhYkth?=
 =?utf-8?B?UXo4L3Z3UTUyVGhUb3lmTW8yTmttelJndVZHblpYREYwWERpRFI1R29ER0d1?=
 =?utf-8?B?RisvRG9lNmsyV2lNZThmazlYWEErb3BjSmJJQ1M1L1QxLzZJZXpkNi9mK1RY?=
 =?utf-8?B?ajNReXA3VGZpR1FDUjdiS2FhMkRhNUQxRS9Nc2FySWl5SHpHTDB0SjN5VFFw?=
 =?utf-8?B?WlNMbUNOOVB5cmc1WDd4WmdSYVgyemxHd0xrU1J5QkpXN1c4dnFHRVp3WkVM?=
 =?utf-8?B?ak44TjBIbmE3blBheFA0elhWNldQRlFrRDJBai9mSVduVmN0SU8wWGxSYkl0?=
 =?utf-8?B?bHNYRzNUVDZJcTc5SWtQVU9VVkhyS0o5RktEcFdHbVJsSVIreUZoSHZtK0NP?=
 =?utf-8?B?M09MV2cwL2h0eWkyRkU0Tzd0QmdGQW81N21jempjV2k4cWpkV3BDQkd4bkxG?=
 =?utf-8?B?MndMbGRYaTYzeEZJV0crQmVvbXNOQlVpQSttVXdyaU5zT2x1ZlNsWFUrMm8r?=
 =?utf-8?B?a3pVUGQ0OG1RYmplK2JESDUwOVMyYlZwN2daSGFudkcvKzFtQUo3amh4U0Za?=
 =?utf-8?B?WFNIN0gvQTk5d2xVODhMVVhWVFFHOEIxT01VakpjN0ppeWJETVVBVGlOQm9v?=
 =?utf-8?B?RUFSOXJrNUVkQUZNOEcvWTBBVFlFSDU5V05XbmNaSVFDZXplMnRvRXpLZlNr?=
 =?utf-8?B?ak9NQ1Y1VWdreGN4Z1ZwRTZieVpIVS9LVklIdExkY1k2WlJYYkloSCtodncv?=
 =?utf-8?B?aFMyK0pzemovdlZOQVlHbUF4U0QvU3FBQllWUnJyekNmaVhJdE5QaEVBYmFS?=
 =?utf-8?B?S2hoU3dacjZBRTVMMU1QTjhXMXhaOU4zcEtxK3QyZ2NuS1lQekJpMU95MnJn?=
 =?utf-8?Q?sA/qp4mC3ALxar0xk8K81Vg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CED22C8348211D4E98E7A61856EF0CE2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GYHEhPFFG/+zxQBxnbjmVsTgGNcuW5t7tvNk8p8OE3qq/BCve0U0tyCNjEn7TiPcZH/BTQ0IPPh9nDyJNyYgzWzmx5d375bTOh0RTwQG6MP+vnuwRBijX/In8Hehh/BsDW5cBa1pAFJHeojmpThpaTHFipp/RePrnYfwOL3xTNfReJrT09mDiDiKYLPpoA2A5ei/WdmTepe8/oT0K7qtQDiJsCU0x5xxHVZZztMbKIRddVvv8ynQikLU1ieOCR7EXge3d0fRXJDibz0pdidjjxAqyZwlKlSPcEeD1Ta7PfwNnwh64G7j7EdNnlfu4H9YUKuFswb7L/d9+aB0F3/a12+2PJ32RQvBtT/NIy6+5HarxNzi0a+TR/hLGF+VpUvOIl2+Kr/J2/dtZKMF1wpZr/LKxC7QSJkhgUt9dJmOfRE5GrzPPvm5K3p5NeC5+Rn57YvIWzDWxknRkJDgqGFhEnFDea6K38HIzvv1JDIeB99npvhhRAdtcVLU0fk0rkE5PWVvAezOpmaS2xXoCfbRTFC6HklZ0uUR1fv13GdxGheSTV3zCyEe0ftP2cgKCxuUsWrNl5v3ePSvk5KdiiFt+CM/rC039r9lC4pVLqdKbquwTSDT4U9oP8KkrIJDYWi2NXKnUx9dGZqEn1Q5XCQxTjJj2hmqdsa8kC1IK7mKX26nRtlBsOVfATRRfFDHl2+PczA0IYzy/9cynvU3o2IhCFneHuRZ2l6n/WVlG3V/VV43oHGrbbeYLVlOjlmRv6lfX3js3JVfFTsMGr2WI8r9Hm6+mITWWcofN6k0apGW0a434pSrlyqpKme2iaJ+1wzx
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2805ec9e-9cd4-4f4d-e976-08dad38e1f3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 11:20:58.9289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TrMv5moI8EFme73olMWh4Nw3TKUh14PZk1R+9iHrglRZQACrT8UOVlwfJlHCVgNgzHuWxfMS4nTw/mx6Cq3nYDK3gVEHUUIgqwp4A0paffM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063

DQoNCj4gT24gMzAgTm92IDIwMjIsIGF0IDE2OjU0LCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEdlbmVyYWxseSBzcGVha2luZywgdGhlIGV2
ZW50IGNoYW5uZWwgbG9jYWwvcmVtb3RlIHBvcnQgaXMgZml4ZWQgZm9yIHRoZQ0KPiBsaWZldGlt
ZSBvZiB0aGUgYXNzb2NpYXRlZCBkb21haW4gb2JqZWN0LiAgVGhlIGV4Y2VwdGlvbiB0byB0aGlz
IGlzIGENCj4gc2Vjb25kYXJ5IFhTX0lOVFJPRFVDRSAoZGVmaW5lZCB0byByZS1iaW5kIHRvIGEg
bmV3IGV2ZW50IGNoYW5uZWwpIHdoaWNoIHBva2VzDQo+IGFyb3VuZCBhdCB0aGUgZG9tYWluIG9i
amVjdCdzIGludGVybmFsIHN0YXRlLg0KPiANCj4gV2UgbmVlZCB0byByZWZhY3RvciB0aGUgZXZ0
Y2huIGhhbmRsaW5nIHRvIHN1cHBvcnQgbGl2ZSB1cGRhdGUsIHNvIHN0YXJ0IGJ5DQo+IG1vdmlu
ZyB0aGUgcmVsZXZhbnQgbWFuaXB1bGF0aW9uIGludG8gRG9tYWluLg0KPiANCj4gTm8gcHJhY3Rp
Y2FsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDQzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0
aWFuLmxpbmRpZ0BjaXRyaXguY29tPg0KPiBDQzogRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9y
Zz4NCj4gQ0M6IEVkd2luIFRvcm9rIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPg0KPiBDQzogUm9i
IEhvZXMgPFJvYi5Ib2VzQGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBDaHJpc3RpYW4gTGluZGln
IDxjaHJpc3RpYW4ubGluZGlnQGNpdHJpeC5jb20+DQoNClRoZSBjb2RlIG1ha2VzIGNoYW5nZXMg
YXJvdW5kIGlmLWV4cHJlc3Npb25zIGFuZCBpdCBpcyBlYXN5IHRvIGdldCBtaXNsZWFkIGJ5IGlu
ZGVudGF0aW9uIHdoaWNoIHBhcnRzIGFyZSBjb3ZlcmVkIGJ5IGFuIGlmIGFuZCB3aGljaCBhcmUg
bm90IGluIHRoZSBwcmVzZW5jZSBvZiBzZXF1ZW50aWFsIGNvZGUuIEkgd291bGQgYmUgbW9yZSBj
b25maWRlbnQgYWJvdXQgdGhpcyB3aXRoIGF1dG9tYXRpYyBmb3JtYXR0aW5nIChidXQgYWxzbyBi
ZWxpZXZlIHRoaXMgaXMgY29ycmVjdCkuDQoNCuKAlCBDDQoNCg0KDQoNCj4gTm90ZTogVGhpcyBj
aGFuZ2UgZGVsaWJlcmF0ZWx5IGRvZXNuJ3QgcmV1c2UgRG9tYWluLmJpbmRfaW50ZXJkb21haW4s
IHdoaWNoIGlzDQo+IHJlbW92ZWQgYnkgdGhlIGVuZCBvZiB0aGUgcmVmYWN0b3JpbmcuDQo+IA0K
PiB2MjoNCj4gKiBOZXcuDQo+IC0tLQ0KPiB0b29scy9vY2FtbC94ZW5zdG9yZWQvZG9tYWluLm1s
ICB8IDEyICsrKysrKysrKysrKw0KPiB0b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbCB8
ICA2ICsrLS0tLQ0KPiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL2RvbWFpbi5t
bCBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9kb21haW4ubWwNCj4gaW5kZXggYWIwOGRjZjM3ZjYy
Li5kNTlhOTQwMWUyMTEgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9kb21h
aW4ubWwNCj4gKysrIGIvdG9vbHMvb2NhbWwveGVuc3RvcmVkL2RvbWFpbi5tbA0KPiBAQCAtNjMs
NiArNjMsMTggQEAgbGV0IHN0cmluZ19vZl9wb3J0ID0gZnVuY3Rpb24NCj4gbGV0IGR1bXAgZCBj
aGFuID0NCj4gCWZwcmludGYgY2hhbiAiZG9tLCVkLCVuZCwlZFxuIiBkLmlkIGQubWZuIGQucmVt
b3RlX3BvcnQNCj4gDQo+ICtsZXQgcmViaW5kX2V2dGNobiBkIHJlbW90ZV9wb3J0ID0NCj4gKwli
ZWdpbiBtYXRjaCBkLnBvcnQgd2l0aA0KPiArCXwgTm9uZSAtPiAoKQ0KPiArCXwgU29tZSBwIC0+
IEV2ZW50LnVuYmluZCBkLmV2ZW50Y2huIHANCj4gKwllbmQ7DQo+ICsJbGV0IGxvY2FsID0gRXZl
bnQuYmluZF9pbnRlcmRvbWFpbiBkLmV2ZW50Y2huIGQuaWQgcmVtb3RlX3BvcnQgaW4NCj4gKwlk
ZWJ1ZyAiZG9tYWluICVkIHJlYmluZCAobCAlcywgciAlZCkgPT4gKGwgJWQsIHIgJWQpIg0KPiAr
CSAgICAgIGQuaWQgKHN0cmluZ19vZl9wb3J0IGQucG9ydCkgZC5yZW1vdGVfcG9ydA0KPiArCSAg
ICAgIChYZW5ldmVudGNobi50b19pbnQgbG9jYWwpIHJlbW90ZV9wb3J0Ow0KPiArCWQucmVtb3Rl
X3BvcnQgPC0gcmVtb3RlX3BvcnQ7DQo+ICsJZC5wb3J0IDwtIFNvbWUgKGxvY2FsKQ0KPiArDQo+
IGxldCBub3RpZnkgZG9tID0NCj4gCW1hdGNoIGRvbS5wb3J0IHdpdGgNCj4gCXwgTm9uZSAtPiB3
YXJuICJkb21haW4gJWQ6IGF0dGVtcHQgdG8gbm90aWZ5IG9uIHVua25vd24gcG9ydCIgZG9tLmlk
DQo+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbCBiL3Rvb2xz
L29jYW1sL3hlbnN0b3JlZC9wcm9jZXNzLm1sDQo+IGluZGV4IGIyOTczYWNhMmE4Mi4uMmVhOTQw
ZDdlMmQ1IDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbA0K
PiArKysgYi90b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbA0KPiBAQCAtNTY3LDExICs1
NjcsOSBAQCBsZXQgZG9faW50cm9kdWNlIGNvbiB0IGRvbWFpbnMgY29ucyBkYXRhID0NCj4gCWxl
dCBkb20gPQ0KPiAJCWlmIERvbWFpbnMuZXhpc3QgZG9tYWlucyBkb21pZCB0aGVuDQo+IAkJCWxl
dCBlZG9tID0gRG9tYWlucy5maW5kIGRvbWFpbnMgZG9taWQgaW4NCj4gLQkJCWlmIChEb21haW4u
Z2V0X21mbiBlZG9tKSA9IG1mbiAmJiAoQ29ubmVjdGlvbnMuZmluZF9kb21haW4gY29ucyBkb21p
ZCkgIT0gY29uIHRoZW4gYmVnaW4NCj4gKwkJCWlmIChEb21haW4uZ2V0X21mbiBlZG9tKSA9IG1m
biAmJiAoQ29ubmVjdGlvbnMuZmluZF9kb21haW4gY29ucyBkb21pZCkgIT0gY29uIHRoZW4NCj4g
CQkJCSgqIFVzZSBYU19JTlRST0RVQ0UgZm9yIHJlY3JlYXRpbmcgdGhlIHhlbmJ1cyBldmVudC1j
aGFubmVsLiAqKQ0KPiAtCQkJCWVkb20ucmVtb3RlX3BvcnQgPC0gcmVtb3RlX3BvcnQ7DQo+IC0J
CQkJRG9tYWluLmJpbmRfaW50ZXJkb21haW4gZWRvbTsNCj4gLQkJCWVuZDsNCj4gKwkJCQlEb21h
aW4ucmViaW5kX2V2dGNobiBlZG9tIHJlbW90ZV9wb3J0Ow0KPiAJCQllZG9tDQo+IAkJZWxzZSB0
cnkNCj4gCQkJbGV0IG5kb20gPSBEb21haW5zLmNyZWF0ZSBkb21haW5zIGRvbWlkIG1mbiByZW1v
dGVfcG9ydCBpbg0KPiAtLSANCj4gMi4xMS4wDQo+IA0KDQo=

