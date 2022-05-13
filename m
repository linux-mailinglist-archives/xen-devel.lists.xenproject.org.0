Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA0525FB3
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 12:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328386.551392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npSe6-0002P0-Qt; Fri, 13 May 2022 10:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328386.551392; Fri, 13 May 2022 10:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npSe6-0002LZ-Nf; Fri, 13 May 2022 10:35:42 +0000
Received: by outflank-mailman (input) for mailman id 328386;
 Fri, 13 May 2022 10:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0acU=VV=citrix.com=prvs=12587a88a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1npSe4-00025y-Q2
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 10:35:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e77a825-d2a8-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 12:35:39 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 06:35:38 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB2819.namprd03.prod.outlook.com (2603:10b6:404:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Fri, 13 May
 2022 10:35:36 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 10:35:36 +0000
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
X-Inumbo-ID: 6e77a825-d2a8-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652438139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lJHeyJnjG7fXjFDIkW1UNutW9lvhGW/YvwFdrkmBUao=;
  b=AyY0GSbqK2hgA0KOuYl5BxzltAn7Zxk21zaPyea8+zDVsOxOW6mYSNSZ
   K7Ye1nsaFWYAxR2Wwm3MoZElydezxf74vJE5R418aAoZY8UE0S7tJQmOj
   3ATOyk5JYeDAsiVH1tT9gY+spiE/Ybhd9X0nA60RmRIiSH63he2I7JDv4
   c=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 71235114
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bGf5QaDb/2zPwxVW/y7iw5YqxClBgxIJ4kV8jS/XYbTApGhzgmYEm
 DMcWjqOP/mMZWfyLox2bYy//BsOuJbQx95jQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Ng2dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhB2
 dxdpZXrYjw5FbOWvssCbytFDiBHaPguFL/veRBTsOS15mifKT7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t3B8mcHs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLjx3CKiKmQEwL6TjZor5TX36hx964Xga4v1R92URN1vwm/N8
 woq+Ey8WHn2Lue32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXOkpdGph0j4XMhQQ
 2QW9TAptrMa71GwQ5/2WBjQiHyOswMYWtFQO/Yn8wzLwa3Rizt1HUABRz9FLdAj6sk/QGVw0
 kfTxoy0QztyrLeSVHSRsK+Oqi+/MjQUKmlEYjIYSQwC4J/op4RbYg/zc+uP2ZWd1rXdcQwcC
 RjWxMTir93/VfI26pg=
IronPort-HdrOrdr: A9a23:SpXkVqtrEpkJ4mCGFB4FvKF17skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBHhHPlOkPMs1NaZLXLbUQ6TQL2KgrGSpwEIdxefygcZ79
 YYT0EcMqyOMbEFt7ec3ODQKb9Jrri6GeKT9J/jJh9WPH1XgspbnmJE42igYy5LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUsEPpZmfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="71235114"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2rqloEC8xMjxoTXgJ3LItnZeDtyBBfOoJXFVIpmbG/CmoFCFIM5jj94PRMLATYnfBF/kmb4gGio3kT3giWUWv4CSCTQ+cAWEZnBMchFhAVsZOkjRDopGd8+BrDruqRmp2gERrM696OoIDk3oZYB/HVvlxAsaMEqdOWG1V2uPQJpz7ny61t8wIerQJQizBwsJXQgE7v8rv5PxzwjjBPRM2zNicaHpe7SeIsBoDU2ZrDR9VDQAB1F2hHbJ/dLxZ8Pli4Y8JpKMreglmW9Eusi6XoQ0ii4kRkw1/WKBjt25E1A3fi/TUs/iIqz1vpJ7I3nJ0kLc6XAgtwQ4gWeKXbj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uk9f0N1rH3Yo6aS6T6eBxtTMatId3THh2C6wf3pFK8g=;
 b=eKzlHTaxWyAP5ZOyibeRyhDapj0jl2bSZmF46Q8I8ER2HX2W1j7scT4Osp/YAHXvKw2dwWwrP3gT4xay3lfGjQA8N/F3UB0cgWI7MTvOKy5Y+8GNhygIbijFxpXwk+hu1zJjdZtga9Bb756e5oqmj9Yh/dIRrQMr/wVCV4XBqNhxosWmJIs3apzsbOvR39R0L/87klLwGg2zJF0cywhwHPRydCVWxzqp3dIvDwFMhZfALFOqYPOX/iXqdT/6GDB7IYoueM06omgiDTWhVY22feKK5P5o4tXncaech6CwjCpDrlQg1sFa1sgRPISX1ioXlL74vW/dGySad5sDNXiKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uk9f0N1rH3Yo6aS6T6eBxtTMatId3THh2C6wf3pFK8g=;
 b=wHwX09TbYlONBoMtTB3YKFbSnPeDmzC28bWRC6vtamuPaRPxZG/uPKeaHFppZa5hTgEMwGiqHIIimdp0l5/EJse0BHPQFI6w+CDi20r8W1h3QRx73MUIAnF3VAJyFbFx6au0tFO3JhpAWPcqmc2ykDJnvjb1/Uosz5uITLN8RE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/2] x86/cpuid: expose MCDT_NO to guests
Date: Fri, 13 May 2022 12:34:59 +0200
Message-Id: <20220513103500.3671-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220513103500.3671-1-roger.pau@citrix.com>
References: <20220513103500.3671-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eacc99a1-a451-4c66-bfb1-08da34cc50d9
X-MS-TrafficTypeDiagnostic: BN6PR03MB2819:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB28195A616EAFF308ADA570BE8FCA9@BN6PR03MB2819.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ShDtSAjVONfmVpeeMhO/56jnV0yv0iUA45z3eGAaVjiFP2AIH6ZRlgMi4KD7E33WfLVodx0hz0Wl+LGJFOB+FLT2jPk++/ioDdUsH1OGM6hd/woiMZ3W2yD+1MFUnWzQPQQr76IPeT18KC1tFWCoOp9pUsKvK8PF6lVmwUeS6F2jVGsTpexdBJlSLEZkO/RxbJ4+inYyfTxFfv6qJ56sp4TBU1YBMlHY1cl/Sdp7lnxwzXnFQmjeNYAN2mOb/48H6ofDZSyNkJTBgnPKBNN00FK9OytttNJ8yAzFsHIy3/quka565B1Y2gNrNju2iMcY447I+Camj5yzGoamPCeeFt+kF91xiOAsNDy/m20iP1GiLLVWhmauSM4VFMA774CqBbHLdu8PSIIyFmvcsXDS90I2fdemDGuFzmfCq/beLGcx7dZfECx6M9IAz/MYvtkUMCLQLsDZT43lpkNhb5G8c4DIiBxp1gpLFY2o/HTr38+Q7bB9EHUKXpFAbwlAOthWRAMrfuOqGvV+8kULGAEhd178IpAOHtvc/ILLeWUJpZvkngKD6g4eGQue6QfzyFFD41IhwUcZ+og7YL0oxGsCtIsa3Nnpu1dW7C+PTF6Unos0INW4HoBpb1IXJDLc9LOfjFXqJRvMg/RWIgLUiXZB8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(5660300002)(1076003)(186003)(107886003)(316002)(6512007)(66476007)(54906003)(82960400001)(2616005)(6506007)(38100700002)(86362001)(66946007)(66556008)(6486002)(4326008)(6666004)(8676002)(36756003)(8936002)(508600001)(2906002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHFjcjI1d2pMWG1WTGRQNEZTeVJSa3g1L0ZCTVdKN3o1czNiK3RXTUsxN2h2?=
 =?utf-8?B?elZsVTAwbDU3OW9yRk9zQVZGWTZJMUx6NVF3Rk1kZEN1cnJHQ09MazJXWmF0?=
 =?utf-8?B?MlNMbDlibldhbUh5Wlo2djBFOVo5eXJORGVnMnByZGx1M2E5aEtGOGxCZnNp?=
 =?utf-8?B?VHpsckp3aUpXanBnWFpxTThiR0twTkVhQ3Q0eDFCRy9xYm1sSHA1NXdkTzlL?=
 =?utf-8?B?aGF6TjJUTmE0UHdIS2RYT2ZJQTg3T1NUdWM1blJnUjd1L3JiUWZhWjE4cXFs?=
 =?utf-8?B?emRqV0NzRTlhMDF4TVdFaXh5Vi83N2FlS09aKyt2ZjgxM3ZINncweGp0Rkl5?=
 =?utf-8?B?VjllQ2ZWdDdpV1h3RWN2YmpRY2kwL0l5c0hwdVpSWklucDU2bnk0TGhob0Ft?=
 =?utf-8?B?clpqZEFPTTJrNEs5bi80b2JDcUREcmRwaEtBNGtsclQzaVRPKzdmTjVQbXZv?=
 =?utf-8?B?V2FmL2o1VmV4YkRqQWxpMnJHVlpQR1UyQ1VUSzE1VUxrY0pzZjlveXNnQ0JE?=
 =?utf-8?B?T3Q2MHNuWVRvRjBrdG9mZi9pdDZNOXhHRXV2cEhnT2pHWkc1d1RsT1F5cnRD?=
 =?utf-8?B?b3IwZGI2WitpZ2JESlA5TzFRa2pOTC90ZVdNTmJaSzdMOW1DQ0dTcGRiQ3Ix?=
 =?utf-8?B?MHhPekliL0c2bGUwRFd0a2lzeVF3OXEwZHJmR1kxejNEamhncFF3eDJnelpZ?=
 =?utf-8?B?Z1R4YXBEWVBhWWZBTTFBa2dNZHVQQ0Y4dG92Vk1GRUlCblBpTFJGdERnYW83?=
 =?utf-8?B?c2V1L24zY1Vadk5NUWxNdEI4TVdmNjd3bHBPaUVRRmVKZzBaTXVkNUp6aWlW?=
 =?utf-8?B?SUxZOFZuQTVja1I2a1hvejNpY0pNMFZ2OXVQSmZXUnpaNkRHaGZSa3BOd0lI?=
 =?utf-8?B?QUoyTi84R3JnUTk5blA2L1hGZDNpQVlHRExIUDVsVXZWK005NiszZWNRSmR0?=
 =?utf-8?B?UG0vdndsWjBEYlBoTXFEVVNMVVlzTkJOZzZYTlJpV1VnQVh0ZzhjamRhMXly?=
 =?utf-8?B?OWtGdlRnOGZXd3BXRDI2MDJYaFMyTExST0NWaEpROFFtSE9Zc3UvY2R1TGpV?=
 =?utf-8?B?Qkg1bmM4VlFuZm5PUDM4OVdma1JFQk9NeW5OYTA1cU8vK1ByTVlnTkhqYmtw?=
 =?utf-8?B?VCtOZzRXVjVXcFRualJxdzVwMk84VzZodVhyTW4xRUU5cCtkYXc5V3RVRWti?=
 =?utf-8?B?T0pGU0pwa1pTeStlcEwweTVTY3FMbitxUHNsT0NOOUhzdFI2dTFFRnF2L1Zr?=
 =?utf-8?B?cEpKb1B0VUQ1VnorUkRFT2toZUxkNk93YWdvalNFQ3AwcktDZ2tNcHRhS28y?=
 =?utf-8?B?L0lOTGM5UmtjVVhXYU5uYy82ajlESVg4SkVYVVROcGQwUDByQnZNRGlKa2U3?=
 =?utf-8?B?Y3dxMWN0M1hNdTU1SzZkai9Lb2c5NjdLZ0tSS3BIb2NYcnFZTlNwQmVTSGN2?=
 =?utf-8?B?cUZWbkdQZjI5b3B0MkpZLzkvWUdiQ1pBS2JVcEM2QUJyenRWVDZ4TFdXOCtQ?=
 =?utf-8?B?UFE3dmducE9lSjdTRFZ3ZTk5NkxMcmJvRjRJbzczMlZJY2dIWUJPd2MzSy9r?=
 =?utf-8?B?N1B1RnBHL1FndXZTSURoQzlOMGE0V09pdm5RdVpUNHRKRFlOUzdtY1RLSUVD?=
 =?utf-8?B?Y0Qrc2RMbFZmSFMxVVdVTkJMZ09CMVZnK2Jzd1ppTENUSlI1d3ZMY09FSmIy?=
 =?utf-8?B?TkM3VE51cDZwNE51SHl6U1BuUFF1RHI0MkJGbHlaRlJFdzQ3RHgrUlVacEwv?=
 =?utf-8?B?eWhHamc0MGFKQTI0UXpydnJhRlo3blZhUjJ2TlBNbkNXWHBvK0cycUNlSElO?=
 =?utf-8?B?UXdTZWIybFliUWFkckVmaG5lK0pzRWdrNE5UK0h1YWNjR08vY2VkTE9hZUZr?=
 =?utf-8?B?Ky8xV0FJS1RtWURDd3hhSVBSbXFnbkdDZmJKOVhlTys2cGl0SE5VL2J0R1RG?=
 =?utf-8?B?Y0c2UmlEemUvMThDMjdKcGNaVG8rdm5sOHdPVGhXRFNoNlJYN3pCWUI4VG45?=
 =?utf-8?B?Z2NPRmxxMTQ0ODRtNVluRFNXQURRdlRYSnl4dHZKcU9ZdW9XS0kyZWUvVjVM?=
 =?utf-8?B?UmVPV2hGb1I1cVNDYjBua1VIcFIra3hEeDFWdThURS9SYjM4aFEyOFcxN1hK?=
 =?utf-8?B?SkpETU1EWW5wdmhGSkdrcVN2Q1RsK3BuSDAwTkp0KzhMWnBIanAvYXk1VVhQ?=
 =?utf-8?B?ZlBqTVlzTENQRDNBQjRDckdtRjBRZlJaVWpjWEhoTU05OUtSU1plblY5L2J2?=
 =?utf-8?B?VHJqNk9wV1cvT0hoeGJRS1I3NWVMWWt4WXFaWThYYjdvUlpLNUtSRnFuMnJj?=
 =?utf-8?B?aXhjWDIvYTJBRW1RK2VGK0VENzVxM0tUV2tvRDYvQmpaRmVUc2Z2TzlJMjJu?=
 =?utf-8?Q?uADxPuKZpqeMqey0=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eacc99a1-a451-4c66-bfb1-08da34cc50d9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 10:35:36.2641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuvR7IBKilHOK7LSpsoWjE8DX9cxZjM/SYsm/RNj1ty3Sptpo6xU806bYz41/Td6PJEUuycwT8V4SPWQ1yiEug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2819

Expose the MCDT_NO CPUID flag to guests if available.  The bit signals
that the CPU does not exhibit MCDT behavior, and as such can be
exposed without requiring any additional work.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index d462f9e421..697ee38270 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -235,6 +235,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
 
         {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
+        {"mcdt_no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
 
         {"lahfsahf",     0x80000001, NA, CPUID_REG_ECX,  0,  1},
         {"cmplegacy",    0x80000001, NA, CPUID_REG_ECX,  1,  1},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 0b1b3333fe..bc40aa06ca 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -203,6 +203,7 @@ static const char *const str_7b1[32] =
 static const char *const str_7d2[32] =
 {
     [ 0] = "intel-psfd",
+    [ 5] = "mcdt_no",
 };
 
 static const struct {
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 5aa3c82fc6..aa12280f25 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -304,6 +304,7 @@ XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory
 
 /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
 XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
+XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
 
 #endif /* XEN_CPUFEATURE */
 
-- 
2.36.0


