Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045F66064D
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 19:23:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472864.733265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDrM0-0006hZ-Fp; Fri, 06 Jan 2023 18:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472864.733265; Fri, 06 Jan 2023 18:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDrM0-0006ed-C7; Fri, 06 Jan 2023 18:22:08 +0000
Received: by outflank-mailman (input) for mailman id 472864;
 Fri, 06 Jan 2023 18:22:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sfve=5D=citrix.com=prvs=363380921=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDrLy-0006eX-AK
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 18:22:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 030f4c88-8def-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 19:22:03 +0100 (CET)
Received: from mail-dm3nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jan 2023 13:21:52 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6019.namprd03.prod.outlook.com (2603:10b6:610:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 18:21:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 18:21:45 +0000
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
X-Inumbo-ID: 030f4c88-8def-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673029323;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=OkfaNdfhnQi+sNg+lseArwfD8y8L6hRJ8ngS8xkww8A=;
  b=ZQKeohnOsh4rhgfDcbjF3TE9bmwVYdAF0pbtCjiLpWV1sxttgSUY3lQ9
   tbJ1+EYpuz66YjrEBm6ALn/OWf+vNZ5/f/VwXh/T3ZM7kcR7xwqhO7P1I
   rrs4MvkW8Z6gmW8wTnshHJ11jSPQ4kH0F+r5G5jh1b7Gs2ey8xgdX0yNR
   U=;
X-IronPort-RemoteIP: 104.47.56.46
X-IronPort-MID: 90999364
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TiA9BaNdVfBXDwvvrR26lsFynXyQoLVcMsEvi/4bfWQNrUon1DYOm
 2AZW2yFbKuCYGX9L9x3YI7i9xhUscLVy95iGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo42tB5gJmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v95XjBR2
 PkTFBNOazuEnbiLz/HhT8A506zPLOGzVG8ekldJ6GmDSNoDGtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxvza7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6XzHKqA9xOfFG+3qJykEfK51chMU0bVFa+iMaiiXCBSt0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRSXKa9THuc8vKYqGi0MC1Nd2saP3dYE00C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdv207gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:tH2Eb6peOvEG5oUjPzT5SEIaV5oReYIsimQD101hICG9Ffb1qy
 nOppsmPHrP4wr5N0tPpTntAsi9qBHnhP1ICPgqXYtKNTOO0AHEEGgI1/qB/9SPIVyYysdtkY
 tmbqhiGJnRIDFB/KDHCdCDYrMdKQ+8gcSVuds=
X-IronPort-AV: E=Sophos;i="5.96,306,1665460800"; 
   d="scan'208";a="90999364"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbWwwx+e9dhWZLXk1fryigzUFjERC1fbNrlwnUY3Yqdf1I2ajDLwmbUHkWr8Roht9T3kgIzyoi3UsENbkYlE5BvzBcJHKjMbaE1o7sv5p0LpsrZTxLSyYyiN20GG3kXe0WySD2Vd7Mr7BWVvrwZmQL5+bGjKDasH12RqpWjUTgWl7B/EupuriVWi5wLIKly8IK3Y4vaPB3kOWL7lrAEmpmkEi0O+kAOY+PzEVyc2D9WBKp8J90zQmnRbMmquaT8OM88Xql+EKOEc94EzDgSkAhUYXPhTVcep1j5G8PPT4KckEmYebdO5QTRH1u1EEa/jbE+wH9vSNxhecfi3dsAivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkfaNdfhnQi+sNg+lseArwfD8y8L6hRJ8ngS8xkww8A=;
 b=SHLnlE6ijQEy4HEV8TPXTPF508EsFgj8+FZsow/QnChSXSOMvC8ozWyQmadhWtJbrPU1q58lM2/yNjYQeuQvyTZAokAKEqQ4aeu3pYqwe2UfUgOESDM6BPH9d/B2X7kmqo+833UJeN1iu0c6jr5Yo4eSJ56sP3BmaFeVEhCauz2k7TZFvXhYFxa5QyblXCKUvSXmTyv88I9lk6zLB1LjGNHzcJECba1o76ISMi8BNdTp8f975DO3lX8hSsdONNi3mugePLZ37sbcNvE8/+lynMYVbb1K1teb99hAbUlxTv7lpIkVAKIROn9FkrpMbceS9LWw+vY7254KL8yDpbdDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkfaNdfhnQi+sNg+lseArwfD8y8L6hRJ8ngS8xkww8A=;
 b=gW0pKr+JTNCBZGNSV9GtO8lCbKS5mwkTme6+KMayNm6FJviLWprm6VOgZsGJNVB966Qv5QD7S6kBPAAseIUd35fSIDlkmgsT1aRcUJ+EbA4WZ/JUeOTMx/W6mgfYmRJD/NKptI1pCOPX6Hmo7xUDlJEX7ZqSpmQrMoK2a+HjENs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: LBR and Sapphire Rapids
Thread-Topic: LBR and Sapphire Rapids
Thread-Index: AQHZIfu71M1ca5PaBU6iVuTRvRgdgw==
Date: Fri, 6 Jan 2023 18:21:45 +0000
Message-ID: <3a80b974-1ddd-2063-863f-8aff3453d545@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH0PR03MB6019:EE_
x-ms-office365-filtering-correlation-id: 87524891-defb-4ddb-ba05-08daf012de56
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 iXpDIV98Qe/JxHdEYt1IqqPPqKdSTmcn9/BVvzqfTWmo+o7i5BN8sD9hV32yu90fLTfw74fzcJDPd84jFCM1BWHWtutf5q/AzM5DxuvcPtK1PjpYaFE5llu8951PuexkhjA/LsE2hoAU6HNKm7Borw/NOcdIAQWsman1sHB8CPUamBwKeZzt1AYgteEiEcVJ3gDExkhsM0tMV360IARlgx/jasRIbrMkBPNSR6cn/Wk5iG/udN2DEU1JILMR1w8+7k6/HrBwOpBDCsIjUUHRYORQ2OflDHCwOMCIPb9xA6rukx6ZhCW1wvehA/BfUoL+hO3pyFwisMdi3LfQcO9smM6MRYI7ZIwxjgnWuZ/vY2c2LZTK5K+25tUFvMXamKthtVb0w6AUbYq6Rqsc9GdAUyuc7Z8MIitnbGvbTi9MzZEAko+5Zasokg+LiwUGiDOwjAx+Xc2FZ0KqtQwCj/p4DxiJUCAqrRs2QYnC7FBvpfDBXfeQup6xMPlm1xvH4lCO09GW+VQaJ2BYK1esyAWTSqw11yi5bg1+LguEHzAGm3ITUtNz/ItmMt8ENby8mN4o/29s767OhQ9iR8Zr6g0lY3A0h7agepfXmBtBqZWHkH1d5jaKHB2YI6ptf2I9fDCr110Mrg8G14cV5Gu2FvSde1NkpLHhrEHybqEX4O+a5KQalgFAHLSaOIX/OxIhSE6A3yM1BJr8JXlDZlpLzLdkG1uKRZxT3Wd58CUqIvSOsrNtk4PgyeZNjZpoFdN+I6I0dp6EKpIzPh6KTgLCCl+rfw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(66446008)(66556008)(76116006)(82960400001)(2616005)(66476007)(64756008)(8676002)(36756003)(41300700001)(38070700005)(91956017)(6636002)(66946007)(316002)(31696002)(2906002)(110136005)(3480700007)(38100700002)(86362001)(5660300002)(122000001)(83380400001)(6486002)(8936002)(6506007)(478600001)(26005)(186003)(6512007)(71200400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cUg0S2gwV1FhcDRaalJIbGxLZTYrWWFLSndnaklWWlN0cTA2bmd4b1gzK2FP?=
 =?utf-8?B?QkZpdHF1QkptY1lEZzlCcnI0WENMSW5WUHcwbkJGbURqZk9TN3pTcHN5WXcy?=
 =?utf-8?B?QU1YbGlHY2NFSkhwTVk5aWtvTG41cW45cUdWeG1sdit5VUs1ZFp5VmFxUS81?=
 =?utf-8?B?ZXFZQlRFcWx6cTd1TTRKRDVmMnRleEtGaThZR2RSN3pKTi92VDBqT0pFVHpi?=
 =?utf-8?B?ckNZb3VaOWVQVVdQNFgxamsvUEIyZHZ4NWg2ZW1NNkwzTmExS0NHT3Fvd3R1?=
 =?utf-8?B?QmQybHNDUGhuaENVbXI0Mm1RTGJlOCtUZUI3TDVITEl6aXJnTWhEZDM5Rjlt?=
 =?utf-8?B?cGkrZGdXd1pFK2hOTUw1bndWMkc0YnN3elNLRjF5Uy9qZFd0S0JmaHVqTG1q?=
 =?utf-8?B?SnRFQUlWM1Evcis0ak5iV044QjJOOUdCVlpnTlJLZTNFaFdtSWlXcDEwd2RQ?=
 =?utf-8?B?QzNaZHBLVjVIVnZGV1J3WkZGNTFpbThDdkFyUVRJVGZ2UXdZN1VVZk5HYUoy?=
 =?utf-8?B?c2RhVGYvRVVBVEoxUnAwTzhFeHAzQVNYNVR3OER6blpySmkwVjFwV2pMTVBs?=
 =?utf-8?B?MmdpaG04czg0eC80TkZMNUxhM21TUFVoei94S3gxZ2VvYjUxOVZxRDJBbVRR?=
 =?utf-8?B?ZTQwSzB1M0VtSXp5NFJuSlN4VGZoU0pFY3IxMm02eXV2RWovVHJkenVnQWRY?=
 =?utf-8?B?MUNPZE5VQjkzMXJoYVVsQTdwU0l6b3gxekdkT3RESE5nNjkxNUJnSUNwa05F?=
 =?utf-8?B?TzBBT1FHdTNtajgrTEpZakNOaTJGeEZMcGJ0ZUF0UFJKelJEbzZ0R0lucFRa?=
 =?utf-8?B?ZjA2MHlBYml5NmNYR3Zyb3NCZjVvR1JGaU9ZVXFZZ1o4U1N0U1pWZHozZXFB?=
 =?utf-8?B?UzhoM0tSb0ZubGM4T3Bnang5alFwRkNXV25JK0h2TlV4RytZdDNBbCs1M053?=
 =?utf-8?B?K2ErNEt5aGdMMHhJUkl4OTlIWHNNc0VYWldhQmN0MHRHS0M2cit0MkZJLzB6?=
 =?utf-8?B?a1ZnTzBFRkh2b2V1SjVNbHREeUYxZWNPblhTVS9hM0NMSTN2RlUxYUdNSXps?=
 =?utf-8?B?Sm5XaS9RcGVDNG12ZjBQbXhHYnh5QlJ4eXVIR2RFb2prRWY5NXEyUm5zQWdo?=
 =?utf-8?B?SXR0Wlc3WHNXVWhDTXF4UlJoOCt0SHVja0M0QldGcjF6OFZzbFZ4MDhLOHQr?=
 =?utf-8?B?TDVIZXN5YmJjZldyUzEwNVoyMW0xMGRHV1hMOUh5WElWb0ZBdmVWSE5lc0RX?=
 =?utf-8?B?dnE5S2xQWFZQNmdsczBUUElGcktUVzJDT3J2blp6QnhmTFdjZmJBaUNid0NY?=
 =?utf-8?B?d1lNeVptaDAxdU1uN0drdTJMUTM5UjA4MmlDVnFXellTL3FMc1NzalJkU1dS?=
 =?utf-8?B?RFBpRkkwY29FczFEaG96T0J1dTAzRkczZ1ZGaEVzY3RvOFhDNU1jeFFZUXBI?=
 =?utf-8?B?MmEzTTN0QlNBU2VuT3p4WDY2TlpRNFliYkJCcW4rUUd4QWpYdDFZTWY5UW8y?=
 =?utf-8?B?L3IzMTZYdWdhcFhUeEdYcnhvd0NvNllrWndKS0R3K1dlNm5lVmJKcGxOYlht?=
 =?utf-8?B?dEIvdzhQZVF0Q3NDRXNJS3RzVjVRMGVIRHNxVjN0RTJWZ0E3cytERGRGaDNi?=
 =?utf-8?B?Q05VY3lFdmtmSmhMQ3NMWkx2S1NKSkFTMEF6amVLakI2SXdZQUN3V00vdTVO?=
 =?utf-8?B?ZjVXVzNDNW9EU0o1elFrUWFTVVFiaFhRQndaRGVqbjB2UU8wd0N5akVtMFFy?=
 =?utf-8?B?K09vbHMxSWdoazFaTkZHTG4yWlJLZkxkditEdGtGOC9sUGpnSkFJY21HZUpV?=
 =?utf-8?B?YVR6OFpJYURLSGh6SkV0WTVDYW5TMEkzNWNiZXlPVk5UQUxWM1NpT09vY1h1?=
 =?utf-8?B?ZVl3eWY4N0tYbFBxN3pQRktWTW1LbGFWSnpKTTdFSm1OQ25XWi9hUDJ4ZTEw?=
 =?utf-8?B?NERmcm8rMXlkK1RDbWZldmNNbWo2RGZaTndEb2VGUm5PcWpubmxPVWFUODN4?=
 =?utf-8?B?aHFrUWRZajRpNkZsRm9PK2pmaE4vU0VaZm5SYzc2M3JVem5DMTRnWVJTVkpJ?=
 =?utf-8?B?S1pHckRXeVhJai9VQjBUWUNHRnJ0MEtXUStCbFFSRG9TNWxNdHkrTlM1UHRO?=
 =?utf-8?B?LzdpSWx0bFkzaXcwUXp2VVRNd3FqYnowUG1pUEFCN01oSlhORENWSE0yQ2M1?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77325048A88F7B40B66F7C5B729569B1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5tmGb9AEwnUtuSp9xSnthnDoNbIJMA/t0RIOaIk89Q2qhuHBWe7s6EohYMQEEhe87gQgo6hE3JkkuMzlfW0/v9/cCqzng0d0NcxqQxGBm+ch75dbyGMwzQd22Vd+oxSt5l+SEkvJJA+KgQ5uWGB4vTMjjWBBF//C+xREsoyvC1+R9n6ZDD5bmaPg8UF8rlO/Dngz1vALJuw4diE8MQEVXvzzdIZN8TXVYPOQ1rTFZK7LKKRVmjLY2Fiw1GOFjOmcLofxH2d2oopXFwJKxCcuGCCKF1sQZi2cEQ/XD4Ck8bkA2dM3tGmfkP5CjRpYQ4zDk0ekWTRtF/ceW5YbHiQWZcKBMMdUgOJjiOT/slt687EYWF+Gr0yrRzQkOQj552d6j4HMpTxWBCKQMdINXfOBaADIGJeqOrE3E3H/5C6UT6yF84CrPxO0Ewn+OiCT2MiZogvGshc31sSOKp4VmIAaHCtIYDjebOS4Mv5F4JYq+kmY8znJ04komLVDoDzyRU06vkXDYUXD7vra/tZJjdGUsqe1NYfX0AX7X0xFLFOckxAcOrnSBnPFZKd+Dlh6hq2apy3jEC65y+PjKJpUQlS/BtzbFpg53HO3R/Xg6Pj1IH9kT0/1vf632H5BYkqjtC8n3B01j3QaJYZVMTHTks3OBfMJIYsU5dwbSCdKoqVQ5VOwXKGDFxGaUJy/jVUg/mcK29+M1dQJAEHOztXF0dV7BUOfeGiRanXGDRzl0m1EH1a3YpS9j9hiNzD/FxvwSmU0qYq1Jv5BgZnj2ZrxzWR283TFYP+y+VRC7TscDakxn9g=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87524891-defb-4ddb-ba05-08daf012de56
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2023 18:21:45.6337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cg555sAKZk4jhGAPWoIAqlD607JNU5IsEuu81gpycHzK3W51975ioaonRSVD4L/xHATO0kJxIc9TvNexwX6iHhYRFdWjxz7ox1RzwbpNApU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6019

SGVsbG8sDQoNClRlc3RpbmcgaGFzIGlkZW50aWZpZWQgdGhhdCBWTXMgb24gU1BSIHN0aWxsIGNy
YXNoIHdoZW4gdHJ5aW5nIHRvIHR1cm4NCm9uIExCUiwgYW5kIHRoaXMgaXMgaW1taW5lbnRseSBn
b2luZyB0byBjZWFzZSBiZWluZyBhICJmdXR1cmUiIHByb2JsZW0uDQoNClRoZXJlIGlzIGEgc2Vy
aWVzIG91dCBhYm91dCB0aGlzLCBidXQgdGhlcmUgaXMgc29tZSBnZW5lcmFsIGNvbmZ1c2lvbg0K
Y3JlYXRpbmcgbWlzdGFrZXMsIHNvIEkgd2FudCB0byB0cnkgYW5kIGxheSB0aGluZ3Mgb3V0IGNv
aGVyZW50bHkgaGVyZQ0KaW4gb25lIGdvLg0KDQpSaWdodCBub3cgKGZvciBJbnRlbCksIHRoZSBQ
RENNIENQVUlEIGJpdCBpcyBoaWRkZW4sIEhWTSB3aWxsICNHUCBmb3INCnJlYWRzLCB3aGlsZSBQ
ViBibGluZGx5IHJldHVybnMgMC4NCg0KVGhlIGZpcnN0IHRpbWUgYSB2Q1BVIHRyaWVzIHRvIGVu
YWJsZSBNU1JfREJHX0NUUkwuTEJSLCB3ZSBlaXRoZXIgc2V0IHVwDQp0aGUgTVNSIGxvYWQvc2F2
ZSBsaXN0cyBmb3IgdGhlIExCUiBNU1JzLCBhbmQgZGUtaW50ZXJjZXB0IHRoZW0sIG9yIHdlDQpj
cmFzaCB0aGUgVk0gaWYgd2UgY2FuJ3QgZmlndXJlIG91dCB3aGF0IHRvIGRvLg0KDQpMQlIgTVNS
cyBhcmUgbmV2ZXIgcHJlc2VydmVkIG9uIG1pZ3JhdGUuwqAgQSBWTSB0aGF0IGlzIG1pZ3JhdGVk
IHdpbGwgKGF0DQpiZXN0KSBvbmx5IHNlZSBjb3JydXB0aW9uIG9mIGl0cyBkYXRhLsKgIElmIGl0
IG1pZ3JhdGVzIGJldHdlZW4gb3RoZXJ3aXNlDQppZGVudGljYWwgc3lzdGVtcyB0aGF0IGhhdmUg
ZGlmZmVyaW5nIGh5cGVydGhyZWFkIHNldHRpbmdzLCBpdCBtYXkgZmluZA0KdGhhdCB0aGUgTEJS
IHN0YWNrIGlzIGEgZGlmZmVyZW50IHNpemUuwqAgSWYgaXQgbWlncmF0ZXMgdG8gYSBzeXN0ZW0g
d2l0aA0KYSBkaWZmZXJlbnQgTEJSIGZvcm1hdCwgdGhlbiBwcmV0dHkgbXVjaCBldmVyeXRoaW5n
IHdpbGwgZXhwbG9kZS4NCg0KDQpMb25ndGVybSwgd2Ugd2FudCB0byBzdXBwb3J0IEFyY2ggTEJS
LCBidXQgd2UncmUgYSBsb25nIHdheSBvZmYgYmVpbmcNCmFibGUgdG8gZG8gdGhhdC7CoCBJbiB0
aGUgbWVhbnRpbWUsIHdlIG5lZWQgdG8gbWFrZSBWTXMgbm90IGNyYXNoLsKgDQpJY2VMYWtlIChz
ZXJ2ZXIgYXQgbGVhc3QsIG5vdCBzdXJlIGFib3V0IGNsaWVudCkgaGFzIGJvdGggQXJjaCBMQlIg
YW5kDQptb2RlbCBzcGVjaWZpYyBMQlIuwqAgU2FwcGhpcmUgUmFwaWRzIGRvZXMgbm90IGhhdmUg
bW9kZWwgc3BlY2lmaWMgTEJSLg0KDQpBbHNvLCB3ZSBjYW5ub3QgYWR2ZXJ0aXNlIHRoZSBQQ0RN
IGJpdCB1bnRpbCB3ZSd2ZSBnb3QgTVNScyBwcm9wZXJseQ0KYWNjb3VudGVkIGZvciBpbiB0aGUg
bWlncmF0aW9uIHNhZmV0eSBjaGVja3MgKHdoaWNoIGlzIHN0aWxsIGEgd29yayBpbg0KcHJvZ3Jl
c3MpLg0KDQpGcm9tIGEgIm5vdCBjcmFzaGluZyBvbiBtaWdyYXRlIiBwb2ludCBvZiB2aWV3LCBt
aWdyYXRpb24gbmVlZCB0byBiZQ0KYmxvY2tlZCBpbiBhbnkgY2FzZSB3aGVyZSB0aGUgTEJSIGZv
cm1hdCBjaGFuZ2VzIChhbmQgb3RoZXIgY2FzZXMgdG9vKS7CoA0KV2hpY2ggYWxzbyBtZWFucyB0
aGF0IGJ5IGRlZmF1bHQsIFZNcyB3YW50IHRvIGJlIHRvbGQgIm5vIG1vZGVsLXNwZWNpZmljDQpM
QlIiLsKgIEJ1dCBmb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2UgYWxzbyBuZWVkIGEgd2F5
IGZvciB0aGUgdXNlcg0KdG8gc2F5ICJwbGVhc2UgbGV0IGl0IHN0aWxsIHVzZSBtb2RlbCBzcGVj
aWZpYyBMQlIiLCBhbmQgdGhpcyBjYW4ndCBiZQ0KYW4gYXJjaGl0ZWN0dXJhbCBDUFVJRCBiaXTC
oCAoQnV0IEkgdGhpbmsgaXQgY2FuIGJlIGV4cHJlc3NlZCBhcyBhDQpjb21iaW5hdGlvbiBvZiBQ
RENNPTEsZm9ybWF0IT0weDNmLEFSQ0hfTEJSPTApDQoNCg0KQnV0IGl0IHN0aWxsIGRvZXNuJ3Qg
aGVscCB3aXRoIFNQUiB0b2RheS4NCg0KT24gU1BSLCBNU1JfREJHX0NUUkwuTEJSIGlzIGEgd3Jp
dGUtZGlzY2FyZCBiaXQuwqAgVGhlcmUgcmVhbGx5IGFyZSBubw0KbW9kZWwgc3BlY2lmaWMgTEJS
cywgc28gd2Ugc2hvdWxkIGVtdWxhdGUgaXQgYXMgd3JpdGUgZGlzY2FyZCB0b28uwqAgTW9yZQ0K
Z2VuZXJhbGx5LCBJIHRoaW5rIHdlIHNob3VsZCBhcHBseSB0aGF0IHRvIGFueSBzeXN0ZW0gd2Vy
ZSB3ZSBkb24ndCBrbm93DQp0aGUgbW9kZWwtc3BlY2lmaWMgaW5kaWNlcy4NCg0KSSB0aGluayB0
aGlzIHdpbGwgYmUgc3VmZmljaWVudCB0byBhdm9pZCBjcmFzaGluZyBndWVzdHMgb24gU1BSLsKg
IEFueQ0Kc29mdHdhcmUgYWN0dWFsbHkgZXhwZWN0aW5nIHRvIHVzZSBtb2RlbCBzcGVjaWZpYyBM
QlIgd291bGQgbmVlZCBhIG1vZGVsDQp0YWJsZSBhbnl3YXkganVzdCBsaWtlIFhlbiBoYXMsIGFu
ZCB3aWxsIG5vdCBnZXQgaXQgdXBkYXRlZCB3aXRoIFNQUidzDQptb2RlbCBudW1iZXIsIHNvIGZv
ciB0aGUgKG1vcmUpIGNvbW1vbiBjYXNlIG9mIG5vdCBoYXZpbmcgbWlncmF0ZWQsDQp0aGluZ3Mg
c2hvdWxkIHR1cm4gb2ZmIGNsZWFubHkuDQoNCn5BbmRyZXcNCg==

