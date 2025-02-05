Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED055A2880C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 11:31:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882099.1292276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcgY-0000Ff-UM; Wed, 05 Feb 2025 10:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882099.1292276; Wed, 05 Feb 2025 10:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfcgY-0000Df-RX; Wed, 05 Feb 2025 10:31:10 +0000
Received: by outflank-mailman (input) for mailman id 882099;
 Wed, 05 Feb 2025 10:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBCp=U4=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tfcgX-0007sf-AJ
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 10:31:09 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2009::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4df59eeb-e3ac-11ef-a0e7-8be0dac302b0;
 Wed, 05 Feb 2025 11:31:06 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Wed, 5 Feb
 2025 10:31:01 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.8422.011; Wed, 5 Feb 2025
 10:31:01 +0000
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
X-Inumbo-ID: 4df59eeb-e3ac-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYWQCKysK+CtIQMovEeU3yBhT67JU/ri/8RBBwf0boVTke3wRj/OVpdXlyleDCbDwwiuS5x/mqk5bedoqMAd/x3gFixtYmc2nfBXHhof0Fm81bXvKltAzHmojbKmCgMBcsRvf08xvn4NImqB1wPxof6W4ZYjClYAySl1i6YRaz8WDlSnHV0NU0OabYN66hZeGQzI0rjJVqwd+j+CkBEFrsqh3wiqQRD5R3fqA5+wk7KYjw4BL7UQZAwohZp0bQlzbP7NeJdS9XONLlKozkFOrbCXdDsc3Ryx2vZwbROq3uu4JYoVciZZ6oo+vos2AQ7xR1r++J2WKJCGOpSh7sB/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkU/QJrNosDcxdsxC8CO8sdHDLyjQ60Vh4aIExXU9Co=;
 b=uCb9zo8y3sXlfarch/V9zkG+dfjYlMG9CLEyLgxykKcEvyScd+MgDLIiosjpv3n1rqGqv3w7XFqWxpGEoQUpdUGDLykS3rOEyvxiuR1fWgD+L+9K1HgJXZgX3chaOfUFRuKNLDa/A4oErBX4E0P6oLgQeDpLVhTkNg5spWxzEC6aqWIeBBa3Qh5u+RN/WO/LhtLLw4mv7LAXrIfktgF9gNJnnQsCyBAstGzZQBuI+PjgTLU6tpgIeQjHsHuh3UQCJh3RRyAk7fv7bqC5Grvvwi8c1GqKsy0bLvEKakZl5kI3pkWwP5/++WMvqz2L30c8ciTldFMZ9k+iOCWcWoT1ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkU/QJrNosDcxdsxC8CO8sdHDLyjQ60Vh4aIExXU9Co=;
 b=iXuGLxdMOlMad37KlvYJCXe0Fggy9Vaa0CJauWzdVzI64C8/0s/qDaLKWdpeEejgeCxmXXk29ADUuymzgPYAGXwfTDzXHTnpwhKHpvC56aDx4VO05qpvAc/XI7IH0O80zJZKBFFenPzPl4w1S+l0iO0Qk+1RWeieWvGTtEbsnuE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6] vpci: Add resizable bar support
Thread-Topic: [PATCH v6] vpci: Add resizable bar support
Thread-Index:
 AQHbbUoyUzXRgWLOOkOHv+F73OEjK7MqsrQAgAAFzwCAAAMXgIAABJWAgA3j+oD//9kVAIAAiKwA//+IlACAAIkoAA==
Date: Wed, 5 Feb 2025 10:31:01 +0000
Message-ID:
 <BL1PR12MB5849C558A2F667D2F09E6BAAE7F72@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
 <Z5ebGImjSz-55Nkj@macbook.local>
 <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
 <Z5ehh9IK3W8fLXIl@macbook.local>
 <PH7PR12MB5854E7408E3028689450E68DE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
 <Z6Mn2pWdp6aquAmY@macbook.local>
 <PH7PR12MB585419F320DC4EA364EC79ECE7F72@PH7PR12MB5854.namprd12.prod.outlook.com>
 <bce9e718-36bd-4bb6-9a9c-97115f453c1a@suse.com>
In-Reply-To: <bce9e718-36bd-4bb6-9a9c-97115f453c1a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.8398.018)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7220:EE_
x-ms-office365-filtering-correlation-id: 9998d047-34db-4892-9f29-08dd45d02fd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z3FFSFlwaTNXaUlUeFZ1Z1l2MWhCL2oyeVordWxtcmk4d2JhSTFCbU1OaDZl?=
 =?utf-8?B?a3hlOXdLL0lqam94UE5ndjZrNnFvNDJ5cHVXeHVRM0VDUEhQejFRcno0OG1X?=
 =?utf-8?B?VExIWG9XUDlSRVAxTjQvVm1mSnh3WTd4eEszd1U1WjFaMVByMEI3OWFwQzlV?=
 =?utf-8?B?Y2NsZXUvYjMxd0thbEtBcGdJN2JwY0lna3dIM00rU3lZM2FBVjJDblN6YUdH?=
 =?utf-8?B?dW5LNVBDd3hoTjk3TGtPWDdaQTlYaHd2dEQxVDJvdncyM014MVZVZ1VhajZN?=
 =?utf-8?B?a1pOY1VKTC9IYkRIUXlhZXNFallPam04OWtsUDdPM3ZRckhnTkJnUjcvbkdj?=
 =?utf-8?B?YTRlakluZHdhZTBTZkpjV3Q3cUsvaXhrUWNiSEkvL0gwalN4SEN5VXVyanRn?=
 =?utf-8?B?ZHJBUE92VTBvQUh5SFFubS9GR25NTk1zZkhVazVXSTlVMTNxN1BxbVBLa1VX?=
 =?utf-8?B?ZHZTRDVNVStiWGFLZ1BabnpDWGZ0TnNZNE1rTXdsRGQ4M2NlaFRhVXNWMFZS?=
 =?utf-8?B?a1pzdzN4UGtoSE9yQklXMS9paThZWnoxcUNmNVcxc1k1djllaGlyaTFjTVJK?=
 =?utf-8?B?aHVKZlpMUUJzdFBHU1lZQ053QndXR3p0L3dMQlc1d0k0dnM3NGppRC92NEo0?=
 =?utf-8?B?clVvWWlDSWtDRjREcXhpeHZWbWxnY2JJUm16VG5QOEx5TE1ET3laNEFaV0hW?=
 =?utf-8?B?SllMaW1hbGRxQWdHMGdZdGVnSDhUUHE2bG9CbklRSnFXd1FLejZKVVRtUWc4?=
 =?utf-8?B?alJadXp5Ylo3M1dFeUNqeHZ0N0pWSzFMejl1a2VvRXhYVFFVT3V2R1FEM0lh?=
 =?utf-8?B?aHhOWFRVaGdqSmJORjRCeGRqTm1iZSt0eDNFVCszTGtQLzNWK1VSbFBDU0FR?=
 =?utf-8?B?aG0xWmNKb0dRNkpSSG5NQmUwdGlmQi9JK0hzeW1IQzNBaTFOTmxHYTE0SWhI?=
 =?utf-8?B?TitYV1ZLNzE0Zk9TeThiTVJNWWhVeS9TVUYzdDhnVTN4YWtqcUFPckc3ajNU?=
 =?utf-8?B?LzJSMGM4YktpYnJueTYrQWRFMkNJZmhiaTRhdm9BOTJ0SUJya0hmRWh2aVNW?=
 =?utf-8?B?K29UYW0wYjhGc3FvaWIxVW90bGp0cUhwNnhNS2I2OFQyRVJhUlhVREFMRi9N?=
 =?utf-8?B?bHBldDJZbGVTeXZGbXRXRXdIa1RxVnZZUW1lckdzVXNpaXBqb3MvWXpaSWRx?=
 =?utf-8?B?S1lHT1F0ZkZqQzZQajBQWGVhbXcxUjB3WFF1TlRGZVNTamVGSTNhYTRBR1RI?=
 =?utf-8?B?bCtHMThCcTlJbzlzbGdRd21pOW9ZZHE0WjJpb2xHOE9HU0pyT3ROVENGMGJo?=
 =?utf-8?B?ZXdOb0RFWkdSRGcyVmJoSTYwVlFNL2pSZzVCdUJMa3RZbHVwYllQMGVLOGR6?=
 =?utf-8?B?N1pWQ0x3ZHVGZzVyRGxYcTAwR2pQZ2l0UGVyeWlwZnZpaWM0L3JMS21QOWd4?=
 =?utf-8?B?ZHJITGpCS3V1UFkyS0ZFUEpIRm1ST1RtUHhueFBvWUY1bkMrWnhaSWRxTEhn?=
 =?utf-8?B?T1JuNFN0KzB0YnRxSVd1UU12bmRPTElsejM3UzNqaDhRQ0ZTRGliSmZJZzcr?=
 =?utf-8?B?c3lCeTVFSS8zZ0t6b0NoUC9VczBibkFwVHpObDg4dmZIRmc0Y2N5WVoyYUlI?=
 =?utf-8?B?TGl5OGZWZWhHZkVOOUpQSVFOdGgrNWNHd3AxUWJ2dVo0aldaTkRpWmJuWUtq?=
 =?utf-8?B?UmFCYndES1BRbnhqelZpTWZUTFA2OGp6NkZ0RjlqS1pQdzUvdHVsOWhjTFNs?=
 =?utf-8?B?WEoxNG80NGNDcXdVdEg1UDdIcW1sYXM4bURaZUZxU0xwYnlUTUViQUt2aXNk?=
 =?utf-8?B?bThBWDVucDhoV29yQU5LY082L1Nxb3pFWXhoUUI3MWVXK1dXV2NocnU4SUpk?=
 =?utf-8?B?OFVlM0dsMzlnY1U0OFBxRUVHQ21rNysrMC85QjBCQ21zem1xUm1rS29UaCtG?=
 =?utf-8?Q?2oiHzGvSMg0QqLHlEDZso1trLybXE7oZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmZwVkU4VjZWMjROK1hjSlFPWFNJZmVnYU00cUJlWlhRZnc0bE9BV3lZUXlm?=
 =?utf-8?B?Q2VWWjBOUGJnS0RuR3dpK1ZvTCtOS0FUTWwrWW1hQTJRckx5b2R4ZmpLZThh?=
 =?utf-8?B?N1N3U2ZPenhrMlFIQ0Q0SWVGR3RHVG9xZUh0K0FmdmZrUGJBYnNZT1E3UVA2?=
 =?utf-8?B?R0tGVXp3NnhLRjBJa0VGc3VkQTB4TWFzSzVvZ1RtUWlKYjgweUlyMUJ2dy9v?=
 =?utf-8?B?c1NacDVFYWRVZjFibHM2VmNkTkZrTGlWVVFtVklVY2hCUUUwZHE5bERVcGh3?=
 =?utf-8?B?QVZKdnNMYlc3b0poZE1SZi9meUVSclUzaUJ2NUg4eEJYb0I3LzhUM1BqOGVi?=
 =?utf-8?B?cmJFeDFCazFvYkE2azZRRTFsODFTbnN2dTBPYlg0N2ZQbWhMdml0NVdRNnNr?=
 =?utf-8?B?UWhwWjNMQ0ExSkN5L2hkL2FxdlZyaXZhRFRjR2d1elR2RFFySUN4ellkbVRl?=
 =?utf-8?B?RmpiQW1rTnFsd1ZCcUxSK2ZYQXMzbVl3VTZrTHdxVHNTdHJFVmtTTEFucjBK?=
 =?utf-8?B?NGNWejY4NS9LbUd0VDVPd3l1dWl1REZuZkN4U1p0U2dsbWQyengzYmpmNWJP?=
 =?utf-8?B?R3FVTnlLclh6TmhFcmZqRXhESXBSZSt4Y1hZTy9ZWUVBUVZhQ3hWc3paREpX?=
 =?utf-8?B?WmxEZHRFNmxRS1RPazVMbFVYdEVFZm84aUowVUxwNFMwREZBZzNqdXpndnZ2?=
 =?utf-8?B?WEg3Wk4rNCs4SFFOR2l5QWthNHFPUUdGWTd5bDRDY3hjUmIxUWNVSFdiWDU4?=
 =?utf-8?B?dFVFbnNUOUx3bG1TbVhlUkYweVVCK3pEMEpaTDdPbzRqQm5MU1ZMNW9WZStX?=
 =?utf-8?B?RmhYcWxzRzV1Z205dkRqZDNkMFBTTVN6a0Jia29WdmZTY29FYmRoRC9aamNR?=
 =?utf-8?B?NFVKT0pXVFZhclhCbldUbDVuWmFxM1lXVlNLY2VIMm0wSXN3YXVPK3cyUmV4?=
 =?utf-8?B?VCt4OTB1NEp1RkFTY2RHS3VNWTlkTFk0RjlSaFpnWkQrWUYvSy9vVmpHMDFJ?=
 =?utf-8?B?T1A1b01nekl4dVNBTndwb2QyNmphd2N6NFdXUlh0aFFsWW9kYXR4Ri9sUHRF?=
 =?utf-8?B?dHFCd2RWK3ZoZThJT0xhUFNiSUY2dVE5OEZOSVRjdkNpaFpKdkdVa1RaSmNJ?=
 =?utf-8?B?ZWhWdUJFT2VOVzFpWGVXbmlxbFJiUkVzVkNuVUNRdmhaSVFPckdsYnVubUF5?=
 =?utf-8?B?ZGUrN2hjRm9sTCtnWVNLQU9mV0lyUUNhaDk5Z3R3UUlLdzVCUnl5ZzR3QUtn?=
 =?utf-8?B?aEpVSGR0ZXZPWWN4bVV3VFc4eUZxRUZsU0pTdkFtNE11T0dCMmlCeG9zZzRs?=
 =?utf-8?B?RmlxNzI2R29ndTBnaytuUFlqZWpuQWFyaWVLT013NG1qbVdRdlVHckU5UjdT?=
 =?utf-8?B?RXVxNnUwZFQzcTMrejlzbjJjbldSL1BRSTFLWWRyaGpQdC90bmNDdW9TT0dF?=
 =?utf-8?B?NmxleGxCUzVZZFhwcGdlM2hFcnV0eWV6NmxyUFN6QzhlRG90NnpMUHhpczJT?=
 =?utf-8?B?bzUwbUh6RXgwMUpES2NFcENYVnB2ZUswNFNYRHZxQlduNFpDMDNaWXZNZ1Er?=
 =?utf-8?B?WWw0b0VLVlhCTzhNM0lpZ1BsQ3ArcjJtbG8yWU9zQkF1eTFGajVRdUF6eDdZ?=
 =?utf-8?B?VWhjSm5YODVvQXhUUWxSMlRpdHpTYUwrUmd5T2VCK091Rmx3VmJ2WXRmWllm?=
 =?utf-8?B?U0NySnp5UzgrMGxXMnJzT3BnR2F0NzhpbUNnbUQxRUdibG82cTBuSEdadlcv?=
 =?utf-8?B?S2l6ME1pRnhqSVk4OTJLN0RDcXpaTjZCd0ZQam1yeDB1aEpKcElsTEREby9L?=
 =?utf-8?B?eDluTkJxSHJiOVduRXBEYmFnbDZkUGFkMXY4Q0tPUWQzTDZhcS9jaS9haCtP?=
 =?utf-8?B?T09mVjZDYWJPUFlVMHBUSU5JRXJyWUMxcVBUSGt0bi96c0IzRGEzdk5sRVVn?=
 =?utf-8?B?c0J1TEVuSVZMVFhkWXZsZVltYjZaaDRRclNyL21iRi9ic0dvZVcwZGhNMkNm?=
 =?utf-8?B?Qmcvc3JtVHc2S0xJV1hvays5dHhsYlVUd1QvR0FsbUwrT0pCeURmYklzT3Yz?=
 =?utf-8?B?eFh3cFFPN0pzbFdnM0x6eTZ4OWJaWkYzSnNGcmRxN3UwQXBTRDZmcDFmczVl?=
 =?utf-8?Q?FqYk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF5ADAD6C9B1054E9F668D372646E329@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9998d047-34db-4892-9f29-08dd45d02fd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 10:31:01.3888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uNVFDqv0A870GfcmvxS5Nx/QLWr29oMNTAnD2yFIRC31kBgv5iyWV/NE2b4zJ0AtyM08loz/i/IoQ+nK6Z8/0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220

T24gMjAyNS8yLzUgMTc6NTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNS4wMi4yMDI1IDEw
OjEyLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI1LzIvNSAxNjo1NiwgUm9nZXIgUGF1
IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBXZWQsIEZlYiAwNSwgMjAyNSBhdCAwMzo0MjozMEFNICsw
MDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+IE9uIDIwMjUvMS8yNyAyMzowOCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIE1vbiwgSmFuIDI3LCAyMDI1IGF0IDAzOjUyOjMx
UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDI3LjAxLjIwMjUgMTU6NDEs
IFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+IElkZWFsbHkgZXJyb3JzIGhlcmUgc2hv
dWxkIGJlIGRlYWx0IHdpdGggYnkgbWFza2luZyB0aGUgY2FwYWJpbGl0eS4NCj4+Pj4+Pj4gSG93
ZXZlciBYZW4gZG9lc24ndCB5ZXQgaGF2ZSB0aGF0IHN1cHBvcnQuICBUaGUgdXNhZ2Ugb2YgY29u
dGludWUgaXMNCj4+Pj4+Pj4gdG8gbWVyZWx5IGF0dGVtcHQgdG8ga2VlcCBhbnkgcG9zc2libGUg
c2V0dXAgaG9va3Mgd29ya2luZyAoaGVhZGVyLA0KPj4+Pj4+PiBNU0ksIE1TSS1YKS4gUmV0dXJu
aW5nIGZhaWx1cmUgZnJvbSBpbml0X3JlYmFyKCkgd2lsbCBjYXVzZSBhbGwNCj4+Pj4+Pj4gdlBD
SSBob29rcyB0byBiZSByZW1vdmVkLCBhbmQgdGh1cyB0aGUgaGFyZHdhcmUgZG9tYWluIHRvIGhh
dmUNCj4+Pj4+Pj4gdW5tZWRpYXRlZCBhY2Nlc3MgdG8gdGhlIGRldmljZSwgd2hpY2ggaXMgbGlr
ZWx5IHdvcnNlIHRoYW4ganVzdA0KPj4+Pj4+PiBjb250aW51aW5nIGhlcmUuDQo+Pj4+Pj4NCj4+
Pj4+PiBIbW0sIHRydWUuIE1heWJlIHdpdGggdGhlIGV4Y2VwdGlvbiBvZiB0aGUgY2FzZSB3aGVy
ZSB0aGUgZmlyc3QgcmVnDQo+Pj4+Pj4gcmVnaXN0cmF0aW9uIHdvcmtzLCBidXQgdGhlIDJuZCBm
YWlscy4gU2luY2UgQ1RSTCBpcyB3cml0YWJsZSBidXQNCj4+Pj4+PiBDQVAgaXMgci9vIChhbmQg
ZGF0YSB0aGVyZSBpcyBzaW1wbHkgYmVpbmcgaGFuZGVkIHRocm91Z2gpIEkgd29uZGVyDQo+Pj4+
Pj4gd2hldGhlciB3ZSBuZWVkIHRvIGludGVyY2VwdCBDQVAgYXQgYWxsLCBhbmQgaWYgd2UgZG8s
IHdoZXRoZXIgd2UNCj4+Pj4+PiB3b3VsZG4ndCBiZXR0ZXIgdHJ5IHRvIHJlZ2lzdGVyIENUUkwg
Zmlyc3QuDQo+Pj4+Pg0KPj4+Pj4gSW5kZWVkLCBKaXFpYW4gaXMgdGhhdCBhIGxlZnRvdmVyIGZy
b20gYSBwcmV2aW91cyB2ZXJzaW9uIHdoZW4gd3JpdGVzDQo+Pj4+PiB0byBDQVAgd2hlcmUgaWdu
b3JlZCBmb3IgYmVpbmcgYSByZWFkLW9ubHkgcmVnaXN0ZXI/DQo+Pj4+IFNvcnJ5IHRvIHJlcGx5
IGxhdGUsIEkganVzdCBjYW1lIGJhY2sgZnJvbSBhbiBhbm51YWwgbGVhdmUuDQo+Pj4+IERpZCB5
b3UgbWVhbjogd2h5IEkgYWRkZWQgaGFuZGxlciB2cGNpX2h3X3dyaXRlMzIgZm9yIENBUD8NCj4+
Pj4gSWYgc28sIHRoaXMgaXMgYSBjaGFuZ2Ugc2luY2UgVjIsIHRoYXQgeW91IHN1Z2dlc3RlZCB0
byBhZGQgaXQgYmVjYXVzZSB0aGVyZSBpcyBubyB3cml0ZSBsaW1pdGF0aW9uIGZvciBkb20wLg0K
Pj4+DQo+Pj4gSW5kZWVkLCBpZiB0aGVyZSdzIG5vIHdyaXRlIGxpbWl0YXRpb24sIHlvdSBjYW4g
anVzdCBkcm9wIHRoZSBhZGRpdGlvbg0KPj4+IG9mIHRoZSB0cmFwcywgYXMgdGhlIGhhcmR3YXJl
IGRvbWFpbiBieSBkZWZhdWx0IGdldHMgcmVhZCBhbmQgd3JpdGUNCj4+PiBhY2Nlc3MgdG8gYWxs
IFBDSSBjb25maWcgc3BhY2UuICBJT1c6IHRoZXJlJ3Mgbm8gbmVlZCBmb3IgYQ0KPj4+IHZwY2lf
YWRkX3JlZ2lzdGVyKCkgY2FsbCBmb3IgUENJX1JFQkFSX0NBUCBpZiB0aGUgaGFuZGxlcnMgYXJl
IGp1c3QNCj4+PiB2cGNpX2h3X3tyZWFkLHdyaXRlfTMyKCkuDQo+PiBPSywgSSB0aGluayBzby4N
Cj4+DQo+PiBIaSBKYW4sIGNhbiB0aGlzIGNoYW5nZSBtZWV0IHlvdXIgb3Bpbmlvbj8NCj4+IE5v
dCB0byBhZGQgcmVnaXN0ZXIgZm9yIENBUCwgYW5kIGlmIGZhaWwgdG8gYWRkIHJlZ2lzdGVyIGZv
ciBDVFJMLCB0aGVuICJjb250aW51ZSINCj4gDQo+IFdlbGwsIFJvZ2VyIGFzIHRoZSBtYWludGFp
bmVyIGhhcyBpbmRpY2F0ZWQgdG8gZ28gdGhhdCByb3V0ZS4gVGhhdCdzIG9rYXkNCj4gd2l0aCBt
ZS4gTXkgb25seSByZXF1ZXN0IHRoZW4gaXMgdG8gYWRkIGEgY29tbWVudCB0aGVyZSwgc3VtbWFy
aXppbmcgd2hhdA0KPiBoZSBzYWlkIGVhcmxpZXIgb24uDQpUaGFua3MuDQpIb3cgYWJvdXQgYWRk
aW5nIGJlbG93IGNvbW1lbnRzIG5lYXIgYWRkaW5nIHJlZ2lzdGVyIGZvciBDVFJMPw0KDQogICAg
ICAgIC8qDQogICAgICAgICAqIEhlcmUgbm90IHRvIGFkZCByZWdpc3RlciBmb3IgUENJX1JFQkFS
X0NBUCBzaW5jZSBpdCBpcyByZWFkLW9ubHkNCiAgICAgICAgICogcmVnaXN0ZXIgd2l0aG91dCBv
dGhlciBzcGVjaWZpYyBvcGVyYXRpb25zLCBhbmQgaGFyZHdhcmUgZG9tYWluDQogICAgICAgICAq
IGhhcyBubyBsaW1pdGF0aW9uIG9mIHJlYWQvd3JpdGUgYWNjZXNzIHRvIGFsbCBQQ0kgY29uZmln
IHNwYWNlLg0KICAgICAgICAgKi8NCiAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2
LT52cGNpLCB2cGNpX2h3X3JlYWQzMiwgcmViYXJfY3RybF93cml0ZSwNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ1RSTChpKSwgNCwgYmFy
KTsNCiAgICAgICAgaWYgKCByYyApDQogICAgICAgIHsNCiAgICAgICAgICAgIHByaW50ayhYRU5M
T0dfRVJSICIlcGQgJXBwOiBCQVIldSBmYWlsIHRvIGFkZCByZWcgb2YgUkVCQVJfQ1RSTCByYz0l
ZFxuIiwNCiAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRmLCBpbmRl
eCwgcmMpOw0KICAgICAgICAgICAgLyoNCiAgICAgICAgICAgICAqIFRoZSByZWFzb24gb2YgdXNp
bmcgY29udGludWUgaGVyZSBpcyB0aGF0IGlkZWFsbHkgZmFpbGluZyBoZXJlDQogICAgICAgICAg
ICAgKiBzaG91bGQgaGlkZSBSZUJhciBjYXBhYmlsaXR5LCBidXQgWGVuIGRvZXNuJ3QgeWV0IHN1
cHBvcnQgdGhhdCwNCiAgICAgICAgICAgICAqIGFuZCB1c2luZyBjb250aW51ZSBjYW4ga2VlcCBh
bnkgcG9zc2libGUgaG9va3Mgd29ya2luZywgaW5zdGVhZCwNCiAgICAgICAgICAgICAqIHJldHVy
bmluZyBmYWlsdXJlIHdpbGwgY2F1c2UgYWxsIHZQQ0kgaG9va3MgZG93biBhbmQgaGFyZHdhcmUN
CiAgICAgICAgICAgICAqIGRvbWFpbiBoYXMgdW5tZWRpYXRlZCBhY2Nlc3MgdG8gZGV2aWNlcywg
d2hpY2ggaXMgd29yc2UuDQogICAgICAgICAgICAgKi8NCiAgICAgICAgICAgIGNvbnRpbnVlOw0K
ICAgICAgICB9DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVu
Lg0K

