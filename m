Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA3A283B6
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 06:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881953.1292121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfY4U-0007IH-24; Wed, 05 Feb 2025 05:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881953.1292121; Wed, 05 Feb 2025 05:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfY4T-0007Fj-V4; Wed, 05 Feb 2025 05:35:33 +0000
Received: by outflank-mailman (input) for mailman id 881953;
 Wed, 05 Feb 2025 05:35:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBCp=U4=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tfY4T-0007Fd-6L
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 05:35:33 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2412::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01ae8d9d-e383-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 06:35:30 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM6PR12MB4339.namprd12.prod.outlook.com (2603:10b6:5:2af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 05:35:25 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%5]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 05:35:25 +0000
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
X-Inumbo-ID: 01ae8d9d-e383-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRnZIEaMmAnZ2A9kDQivtpdhzcp/YhHHvQtIgH8ENhcA0S0tnWwZcDZAy3gjYdKcoIt7zqdKgwUMc8wzUAD+vEkRMzrEOJgnBgA+XVR5Xspqo/O0mBUl/WuxIc4TgcWS75coLA6msGFKW5SNQ4VdunoZyi5r3YRFYG3WlO5ynz9scpcBN7f1YA5NnMs+nagNRJywCB0HIzhhFgKfH6HXiGv+Dasj1g7i/ieXJq+ARD4lck0Dq2k/m/2CMYk1ja1K2bNhw4vR4Dkrqd2NTIc21xhsJ4X7SbT5Jp2OmB+GslBvdGV3GZ1iKM9Y3lyGSb7AZpwCZ4n8W1Ve1U8r9BrW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiMx4YLu/obHI/EARVurhxLi4At6t50H38WBTO4p1Y4=;
 b=AGuLdJGCjCgSEdPaACcMcIonh+UKrUNMToKCnGeIpXXGTXmwyQ9QKEH1CQAW02hIAcaq+f5SycdB04Uko7PtdWjobcH34lQPOUWKLGKxn5/tF4ONFF46KWQsNFqTt20IWzyOuoDqJPkGnecWAMQadk6wCSaUzn+eXgnnu1QlWcOQrm7Rusa5XGJqYKEaySG+SOS2Vav/ZUzUhheEkrlDUX8g99ybxMeDlf92yToMVDmN77fFAbhcYrtI24Nqc9TtD73HYOEPxtE+KBGcYcvceJEhSdk5DJzBOFzv7+xysRDd8K0KF0GZgCqKFyhlorcv3f2aIk17ZfJnLNbDTXXniQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GiMx4YLu/obHI/EARVurhxLi4At6t50H38WBTO4p1Y4=;
 b=weVYLH78iqC+JcdCPFNgvz8tJYtI/SStTLChCj3hu2l7rtGlw7+SwLIUWGS/NLc+BuLUCfe7JauUI97d6sgaNxS6PqtVnl/4jWa4Ha5mQpRZbfy1RG5Rf/++sFyeIkxQT2/bPOA1CVmia/MJJR2c4sKkctZZwqJ0pwJ+uTWqRK0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6] vpci: Add resizable bar support
Thread-Topic: [PATCH v6] vpci: Add resizable bar support
Thread-Index: AQHbbUoyUzXRgWLOOkOHv+F73OEjK7MqsrQAgAAFzwCAAAMXgIAODeKA
Date: Wed, 5 Feb 2025 05:35:25 +0000
Message-ID:
 <BL1PR12MB584994080925563BFCCDDB74E7F72@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250123035003.3797022-1-Jiqian.Chen@amd.com>
 <2f34ba33-070e-4c02-a7e5-71451553a23e@suse.com>
 <Z5ebGImjSz-55Nkj@macbook.local>
 <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
In-Reply-To: <9a4ed1f8-0cbf-4df5-804e-78cc3ee1d777@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8398.024)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM6PR12MB4339:EE_
x-ms-office365-filtering-correlation-id: 7a17e462-200c-4397-dbf0-08dd45a6e44c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MjNEd1ArY29BYit1WmpqeC9JZktuN3Q1Y1JVWGFib3VqKytnR1JtYUs5WGZK?=
 =?utf-8?B?M0lERXNIVWpyOE0xUi93WHhETWRONWR0Y3BqVFVodGhPR0hYcm5LSWFabFFE?=
 =?utf-8?B?bDZZZS9SQkMyRGxpMVdkTW5GOVZONjBlcXpVbnFnTWNmTTBoZW1ra0ExN3JJ?=
 =?utf-8?B?WHhXWFBJWllsWlk5T0pqM0lFVWEvNG84UkRTUkRJcHd0U2lkcW1IaWVIOThU?=
 =?utf-8?B?SkhubzJRNkJyZzYvYlRNVElCR3EwYU1DaEUvdWQwL0o5NnVuN0FYU0YvQUpH?=
 =?utf-8?B?VWR0UzJaSXZkQ1UwRXAwUk9BSXN5bE41d255dUl0UTlvckRkNUJ3T2M5LzlG?=
 =?utf-8?B?MDlxSHVqZTNrU3hVZVJLa3B6UGVyM2xyZDMwN1JUaWNhcjQrejBrTEZTblJ4?=
 =?utf-8?B?SE9tTWhLZUFlTFlwZVFrMGJ2dElhbjc1WENVOUUwZzlTZVJubDc5MytUUnhx?=
 =?utf-8?B?cUcxREZVL0FZTEZFektsNDNnMFM2Z0xzczJFRzNpdC9RczJYSmM5WERDTjUz?=
 =?utf-8?B?U0dYdDM1MEpCemNnNEJBdWJwQ2hLOVZ4eGE5eVJYVTlWOVA1M2FPV253djJq?=
 =?utf-8?B?NkhzRXhmbm5iVjQ4NmNFS0x5NmxsbzFqbHM5NnBJaVJ6MmhxNVRsc0JmZGZx?=
 =?utf-8?B?VnhiOUtyTXBHVmZqVnFnT1Z5eDlGS013ZFNLZHIrZUlSbjB4WDkzKzk5bklL?=
 =?utf-8?B?dUQ3Q3Y3WSthMUVUUWxCcUsyMjNRdFA4bUdkNWQ2YWJZSGR2TDZzbGZTTm9j?=
 =?utf-8?B?QndBalRmUU1jS1F0UU1SdkJ2N3FNM3Y1NmI5ZGxqV3EydnZzVkdlSEF3UWRU?=
 =?utf-8?B?SlBDTEhiMnplNXk0dWZkQkJvYjJ2b2dSdit2ejM0cmEzS21XUjRwS0duMGFI?=
 =?utf-8?B?YklUSC85dlJEbzlkNDJPN2ZnZnF6bDJSd2ZYYWJVeVMzZkxZR1BBV3ZaWmxm?=
 =?utf-8?B?QTNvZFZ4a3ZzZU00M2d1L1k5clFON3Y1NkREUzlCeDVwNUpoaWJJcDlVakJD?=
 =?utf-8?B?emhHMytTcWJsVFNoTGF0T0p1T0N1RzFIeWU4dyt0SjZSNUdqR3VmME1PMmp2?=
 =?utf-8?B?cVljUFRnUUpoM2s5d0FYN0FuKzJ1VVJYNHRtYTd4TFdZTXdFbnZ4VmxZWS9G?=
 =?utf-8?B?bGZscEFxSy9yVkpBQi9yZkYwNVFJeUlBTk0yTC9kb1RkZWJqZnpncTlmY1o3?=
 =?utf-8?B?am9VTisyWEkzcnQrMEh1eXVwNkUvdG1rOHZiR1QwMFR0clMrdG9LMlhESVpl?=
 =?utf-8?B?SUtwdFdXeldaaGJDTU5xR3BodnYxenhXUWVSZmpGY3BYd0xqMjg3c09Penk4?=
 =?utf-8?B?bHBBTzZsY0VOWWp1TkR5c0tZK09SSmNZQnVOUG1TTlJiS2pESjRseG5aOUhV?=
 =?utf-8?B?MURoL1ZNSDVETkJabmRrdFNJcm9nZlA0a1lwR3BPRHE4dzZEZ3NIc1JtQkZI?=
 =?utf-8?B?OGZwYkovNW5WaTE1NVRVdS9CN0o3cWRVZ3ZaSnpNSGtManZ0ZURDZjhNQWVp?=
 =?utf-8?B?anlFZFl4NmNnRXh3T292b1NJSHlOV3dvRC9JeWtndUYrUlo4eW9JcHp1WEdE?=
 =?utf-8?B?OEt0YnhqNXlNYkpXckxMUFBLc25VTFBLclQwazJxSHdVOWJpTEprM24yTGli?=
 =?utf-8?B?V0xvMk9ObmMyTDM4NU5wa1NpZE12Y0xCMVZlTTFMQUl4d0lkQWFzMmdXK3M0?=
 =?utf-8?B?NEErcnRaUWZ0b3RYNnEvdDEzcHNJeGx3QXBBN21mR21rVk5YS2V1azJ4VGlO?=
 =?utf-8?B?ZzlNQUtJY0E1aGF2R3F0Y3pyTGRqTVNHbHFteHJBbUNyZ1V1by9UeUJrNHFO?=
 =?utf-8?B?RFUxbnV3SThIRnhhNVFVSTdKKzBhamIxVE53K1VydG1ZNVliRjN1RW4rejNS?=
 =?utf-8?B?NWc5d1JVc3VtSU5La3FJdmhQMExPcTFBaGE5bVd4cW1OV1V4eG1GcFp0bnFS?=
 =?utf-8?Q?+J5ulsoLi7aJxFyCu67UisKO7n8Wg4tR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UTBDNWNBL3M5eXBzdEluQlphVEk2eG1MNnBzKzZZeldEUDQzZ0VmQTRBNWtj?=
 =?utf-8?B?SmRzU1VmWjNJTWgvWko3M0hySGp6V2hwN1YrL2tJaHRPSlhadzZEREpESUlp?=
 =?utf-8?B?ZDJ2QVgrS3FFOUpQYWpJSG11T0JrU3QyZFF6VUw0STdla1M0R0wrL0w1UDg5?=
 =?utf-8?B?VXhHYmkxbklsSnBNR0pIL0VIblJPTmxWcUxFaldhTDU4Z2lQUytEckJLUXdR?=
 =?utf-8?B?ejFNL2luWjBUc29JVVdkV1hhd0g5SHdGRGdjc2YvRVB6TTB4WWt5OVhDajFz?=
 =?utf-8?B?MFF2M0VzdEROWGtaS3JxOWVDTmNjQlQxbVZodnArL3NHSGhnL2hBUSs5c1gr?=
 =?utf-8?B?RGM2K1MzcGpGN2NWYytRWlcvOHcyTWpJcnR3QndzZ1hyR1dJQXo1NnZOY3Zn?=
 =?utf-8?B?cE9BZ3dQZWUvdXdjQnFCMkl2UjBYM3BRVGlmOFJ6Qjc0ayttRitzZVFsYkNp?=
 =?utf-8?B?QnVWYXErQjNYNWxmT2ZlUUQ0TUJ5d000NGx6V3NDUncyQ243RTdVZ2NjalFa?=
 =?utf-8?B?M3RtWWxXNCswVGxhbGE2NVZLOFlvS0ZaeFBUNThFNS9POGw5UVhFWi9ZRlM5?=
 =?utf-8?B?OERRUHNtTFFyQXlDaEVDYTNnNG9ibTdERkxIdCt3am1UdzdJbTJSemJMK1Y2?=
 =?utf-8?B?dkg1WDNCaGNxYmF4TjVIWDNaTDI2Q0FEeWJ5alZ6SFY0bFJPUzhDR28rWGNJ?=
 =?utf-8?B?MTQwM0JBZVQrSWJIOTVvcGRTUWFvZm83amJCWXoyM21NckxPM0xGVE0zamQx?=
 =?utf-8?B?N3pWME5TbGFlN2tSN2dGUm5hZC94djVpcUdhd3lMMDh1bmU2NEd0MGdnSWYr?=
 =?utf-8?B?TWdtYzIxZy9tQkh0eUZ5bDc0UmRYLzBvL2R5K0JReWpZS1Q2MWhwY21qclVJ?=
 =?utf-8?B?dzNDdnJVejFWczhsRlg4Z1VLaTVIMlI4RHB3aXduQmxHTm0rT3daNEVBSzVQ?=
 =?utf-8?B?ZzRwVk5EeGJTeVd0Y2M4YWhaZTNQeVg3Qm1jeHFzdUMxeHliZUNqRkE2d3Vr?=
 =?utf-8?B?c29FYlNuSVV0bUY1RmVNbDJ4ajU5ZFFPdW1WTHdxUTArYURTalBLUXhDZWpr?=
 =?utf-8?B?aFBOSFQrc0N3QnN4TUdqZDVGMG5CNk9nVUsyYXQ1NnZpaThpdElWVUJ2c1dF?=
 =?utf-8?B?ZFB3VndRRjlvM0pJWXEzZThPck5kb0ZVOU54bXUrVWd0eW1ydnRwWVVzR3Ba?=
 =?utf-8?B?dXFEZkxoV3ZYYWhUb1FyakNIdG8xcXozMktXUTQ4VkNpOWwwMXZZSzM5dGJT?=
 =?utf-8?B?WlR4N1FWK05LREhwaXpSR1dYbmxiTGhmbG95L3pFTjd5dGJDZU5IUjJ1Wlg0?=
 =?utf-8?B?MUY5dFdwRDRsOU1WQVpremE1dCsrTUxKR3RDNUwxblEvZk1BRjd5d2pDN2ZF?=
 =?utf-8?B?VnlZTVA4YWtscHVwWDJVeFVnbmtVNys5UGVjSVYxYjN1STA3bEw1YUNSKzds?=
 =?utf-8?B?ZHgzY2ZYK3UyWU9ETFRtbzBQb0ZjbWljZnA0YzhIUzByVklSQjdiOFlvNXZP?=
 =?utf-8?B?YS9nb24xZlhhRlVnR3d4RGlRekYrYytnRHFGNU5oZXovRE1EMTBnZVUydVFK?=
 =?utf-8?B?NmdRZmJnOUJ1RnhaQ2tMeURRSlR5TjdtZnhrOW94YkhpQ25qNTJoTjNQSTdw?=
 =?utf-8?B?Wi9QUU1kVTRSdXVlVGRsb0UxcjNDazBVeVZRV05zdXEzZk5lMGdsODZ5VUg3?=
 =?utf-8?B?d1MxRzk2WnliR2R0bVdCYVJ4L05sdzcrMlZSRGh5STNmWmd3ODBtQ1lGTENx?=
 =?utf-8?B?RERiZVBSKzFMUi9UTURXYTlQTk1Wcyt5Rlc3UW5RZk5BdVplQkVzNmxWdWJ6?=
 =?utf-8?B?UnQ5bS9zc0EvWUpnSklaeDMvVGdTZ2RudUwra0lqTmlFcXhrN2xab1hmcTg0?=
 =?utf-8?B?Y3pJRkRvRXJ2aVZqUmN0aVk5bHpWTllLRnRzb2d2aDJJb1N0UmJ5dVJ1alVy?=
 =?utf-8?B?L1Arc21yaTN5cDFoR2pBN2ZqcmpodDdtT1djdFZIQWhFUm03Zm41RmJ5dVZr?=
 =?utf-8?B?eG1Vc2hIaVhualpTU202U3dWWHk4ODlnSmlZWWxobllMZElRelNBaUtPOXVC?=
 =?utf-8?B?eVFkK2NqOFNrOXNkOEZTQXVmQUVTd0dCMFpZZlM2OU1senhoYURWV3Zjb05h?=
 =?utf-8?Q?Wtyk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B666ECFDA8DC4C4DB1878949D2CF5734@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a17e462-200c-4397-dbf0-08dd45a6e44c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 05:35:25.3475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9XSA4sfMZClXvIDTwYgU8jxCkXNtrvjq3iW0ewnE9NigWxwl9TpRDPHrjmHnmOabmDW920erjJdsIGfqiFsFlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4339

T24gMjAyNS8xLzI3IDIyOjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjcuMDEuMjAyNSAx
NTo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIE1vbiwgSmFuIDI3LCAyMDI1IGF0
IDAzOjIwOjQwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIzLjAxLjIwMjUg
MDQ6NTAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4+PiB2NS0+djYgY2hhbmdlczoNCj4+Pj4gKiBD
aGFuZ2VkICIxVUwiIHRvICIxVUxMIiBpbiBQQ0lfUkVCQVJfQ1RSTF9TSVpFIGlkZWZpbml0aW9u
IGZvciAzMiBiaXQgYXJjaGl0ZWN0dXJlLg0KPj4+PiAqIEluIHJlYmFyX2N0cmxfd3JpdGUgdXNl
ZCAiYmFyIC0gcGRldi0+dnBjaS0+aGVhZGVyLmJhcnMiIHRvIGdldCBpbmRleCBpbnN0ZWFkIG9m
IHJlYWRpbmcNCj4+Pj4gICBmcm9tIHJlZ2lzdGVyLg0KPj4+PiAqIEFkZGVkIHRoZSBpbmRleCBv
ZiBCQVIgdG8gZXJyb3IgbWVzc2FnZXMuDQo+Pj4+ICogQ2hhbmdlZCB0byAiY29udGludWUiIGlu
c3RlYWQgb2YgInJldHVybiBhbiBlcnJvciIgd2hlbiB2cGNpX2FkZF9yZWdpc3RlciBmYWlsZWQu
DQo+Pj4NCj4+PiBJJ20gbm90IGNvbnZpbmNlZCB0aGlzIHdhcyBhIGdvb2QgY2hhbmdlIHRvIG1h
a2UuIFdoaWxlIC4uLg0KPj4+DQo+Pj4+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGluaXRfcmViYXIo
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgdWludDMyX3QgY3RybDsN
Cj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgbmJhcnM7DQo+Pj4+ICsgICAgdW5zaWduZWQgaW50IHJl
YmFyX29mZnNldCA9IHBjaV9maW5kX2V4dF9jYXBhYmlsaXR5KHBkZXYtPnNiZGYsDQo+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBD
SV9FWFRfQ0FQX0lEX1JFQkFSKTsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICggIXJlYmFyX29mZnNl
dCApDQo+Pj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCAhaXNf
aGFyZHdhcmVfZG9tYWluKHBkZXYtPmRvbWFpbikgKQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAg
ICAgcHJpbnRrKFhFTkxPR19FUlIgIiVwcDogcmVzaXphYmxlIEJBUnMgdW5zdXBwb3J0ZWQgZm9y
IHVucHJpdiAlcGRcbiIsDQo+Pj4+ICsgICAgICAgICAgICAgICAmcGRldi0+c2JkZiwgcGRldi0+
ZG9tYWluKTsNCj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4+PiArICAgIH0N
Cj4+Pj4gKw0KPj4+PiArICAgIGN0cmwgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcmVi
YXJfb2Zmc2V0ICsgUENJX1JFQkFSX0NUUkwoMCkpOw0KPj4+PiArICAgIG5iYXJzID0gTUFTS19F
WFRSKGN0cmwsIFBDSV9SRUJBUl9DVFJMX05CQVJfTUFTSyk7DQo+Pj4+ICsgICAgZm9yICggdW5z
aWduZWQgaW50IGkgPSAwOyBpIDwgbmJhcnM7IGkrKyApDQo+Pj4+ICsgICAgew0KPj4+PiArICAg
ICAgICBpbnQgcmM7DQo+Pj4+ICsgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyOw0KPj4+PiAr
ICAgICAgICB1bnNpZ25lZCBpbnQgaW5kZXg7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgY3RybCA9
IHBjaV9jb25mX3JlYWQzMihwZGV2LT5zYmRmLCByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ1RS
TChpKSk7DQo+Pj4+ICsgICAgICAgIGluZGV4ID0gY3RybCAmIFBDSV9SRUJBUl9DVFJMX0JBUl9J
RFg7DQo+Pj4+ICsgICAgICAgIGlmICggaW5kZXggPj0gUENJX0hFQURFUl9OT1JNQUxfTlJfQkFS
UyApDQo+Pj4+ICsgICAgICAgIHsNCj4+Pj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJS
ICIlcGQgJXBwOiB0b28gYmlnIEJBUiBudW1iZXIgJXUgaW4gUkVCQVJfQ1RSTFxuIiwNCj4+Pj4g
KyAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRmLCBpbmRleCk7DQo+
Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4gKyAgICAgICAgfQ0KPj4+PiArDQo+Pj4+
ICsgICAgICAgIGJhciA9ICZwZGV2LT52cGNpLT5oZWFkZXIuYmFyc1tpbmRleF07DQo+Pj4+ICsg
ICAgICAgIGlmICggYmFyLT50eXBlICE9IFZQQ0lfQkFSX01FTTY0X0xPICYmIGJhci0+dHlwZSAh
PSBWUENJX0JBUl9NRU0zMiApDQo+Pj4+ICsgICAgICAgIHsNCj4+Pj4gKyAgICAgICAgICAgIHBy
aW50ayhYRU5MT0dfRVJSICIlcGQgJXBwOiBCQVIldSBpcyBub3QgaW4gbWVtb3J5IHNwYWNlXG4i
LA0KPj4+PiArICAgICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNiZGYsIGlu
ZGV4KTsNCj4+Pj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4+PiArICAgICAgICB9DQo+Pj4N
Cj4+PiAuLi4gZm9yIHRoZXNlIHR3byBjYXNlcyB3ZSBjYW4gcGVybWl0IERvbTAgZGlyZWN0IGFj
Y2VzcyBiZWNhdXNlIHRoZSBCQVINCj4+PiBpc24ndCBnb2luZyB0byB3b3JrIGFueXdheSAoYXMg
ZmFyIGFzIHdlIGNhbiB0ZWxsKSwgLi4uDQo+Pj4NCj4+Pj4gKyAgICAgICAgcmMgPSB2cGNpX2Fk
ZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQzMiwgdnBjaV9od193cml0ZTMyLA0K
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlYmFyX29mZnNldCArIFBDSV9S
RUJBUl9DQVAoaSksIDQsIE5VTEwpOw0KPj4+PiArICAgICAgICBpZiAoIHJjICkNCj4+Pj4gKyAg
ICAgICAgew0KPj4+PiArICAgICAgICAgICAgLyoNCj4+Pj4gKyAgICAgICAgICAgICAqIFRPRE86
IGZvciBmYWlsZWQgcGF0aGVzLCBuZWVkIHRvIGhpZGUgUmVCYXIgY2FwYWJpbGl0eQ0KPj4+PiAr
ICAgICAgICAgICAgICogZnJvbSBoYXJkd2FyZSBkb21haW4gaW5zdGVhZCBvZiByZXR1cm5pbmcg
YW4gZXJyb3IuDQo+Pj4+ICsgICAgICAgICAgICAgKi8NCj4+Pj4gKyAgICAgICAgICAgIHByaW50
ayhYRU5MT0dfRVJSICIlcGQgJXBwOiBCQVIldSBmYWlsIHRvIGFkZCByZWcgb2YgUkVCQVJfQ0FQ
IHJjPSVkXG4iLA0KPj4+PiArICAgICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYt
PnNiZGYsIGluZGV4LCByYyk7DQo+Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4gKyAg
ICAgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRl
di0+dnBjaSwgdnBjaV9od19yZWFkMzIsIHJlYmFyX2N0cmxfd3JpdGUsDQo+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmViYXJfb2Zmc2V0ICsgUENJX1JFQkFSX0NUUkwoaSks
IDQsIGJhcik7DQo+Pj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4+PiArICAgICAgICB7DQo+Pj4+
ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXBkICVwcDogQkFSJXUgZmFpbCB0byBh
ZGQgcmVnIG9mIFJFQkFSX0NUUkwgcmM9JWRcbiIsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
cGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgaW5kZXgsIHJjKTsNCj4+Pj4gKyAgICAgICAgICAg
IGNvbnRpbnVlOw0KPj4+PiArICAgICAgICB9DQo+Pj4NCj4+PiAuLi4gaW4gdGhlc2UgdHdvIGNh
c2VzIHdlIGhhZCBhbiBpc3N1ZSBpbnRlcm5hbGx5LCBhbmQgd291bGQgaGVuY2Ugd3JvbmdseQ0K
Pj4+IGFsbG93IERvbTAgZGlyZWN0IGFjY2VzcyAoYW5kIGluIGNhc2UgaXQncyB0aGUgMm5kIG9u
ZSB0aGF0IGZhaWxlZCwgaW4gZmFjdA0KPj4+IG9ubHkgcGFydGlhbGx5IGRpcmVjdCBhY2Nlc3Ms
IHdpdGggd2hvIGtub3dzIHdoYXQgcmVzdWx0aW5nIGluY29uc2lzdGVuY2llcykuDQo+Pj4NCj4+
PiBPbmx5IHdpdGggdGhpcyBwYXJ0aWN1bGFyIGNoYW5nZSB1bmRvbmU6DQo+PiBSPiBSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+DQo+Pj4gT3RoZXJ3aXNl
IHlvdSBhbmQgUm9nZXIgKHdobyBuZWVkcyB0byBhdCBsZWFzdCBhY2sgdGhlIGNoYW5nZSBhbnl3
YXkpIHdpbGwNCj4+PiBuZWVkIHRvIHNvcnQgdGhhdCBvdXQsIHdpdGggbWUgbWVyZWx5IHdhdGNo
aW5nLg0KPj4NCj4+IElkZWFsbHkgZXJyb3JzIGhlcmUgc2hvdWxkIGJlIGRlYWx0IHdpdGggYnkg
bWFza2luZyB0aGUgY2FwYWJpbGl0eS4NCj4+IEhvd2V2ZXIgWGVuIGRvZXNuJ3QgeWV0IGhhdmUg
dGhhdCBzdXBwb3J0LiAgVGhlIHVzYWdlIG9mIGNvbnRpbnVlIGlzDQo+PiB0byBtZXJlbHkgYXR0
ZW1wdCB0byBrZWVwIGFueSBwb3NzaWJsZSBzZXR1cCBob29rcyB3b3JraW5nIChoZWFkZXIsDQo+
PiBNU0ksIE1TSS1YKS4gUmV0dXJuaW5nIGZhaWx1cmUgZnJvbSBpbml0X3JlYmFyKCkgd2lsbCBj
YXVzZSBhbGwNCj4+IHZQQ0kgaG9va3MgdG8gYmUgcmVtb3ZlZCwgYW5kIHRodXMgdGhlIGhhcmR3
YXJlIGRvbWFpbiB0byBoYXZlDQo+PiB1bm1lZGlhdGVkIGFjY2VzcyB0byB0aGUgZGV2aWNlLCB3
aGljaCBpcyBsaWtlbHkgd29yc2UgdGhhbiBqdXN0DQo+PiBjb250aW51aW5nIGhlcmUuDQo+IA0K
PiBIbW0sIHRydWUuIE1heWJlIHdpdGggdGhlIGV4Y2VwdGlvbiBvZiB0aGUgY2FzZSB3aGVyZSB0
aGUgZmlyc3QgcmVnDQo+IHJlZ2lzdHJhdGlvbiB3b3JrcywgYnV0IHRoZSAybmQgZmFpbHMuIFNp
bmNlIENUUkwgaXMgd3JpdGFibGUgYnV0DQo+IENBUCBpcyByL28gKGFuZCBkYXRhIHRoZXJlIGlz
IHNpbXBseSBiZWluZyBoYW5kZWQgdGhyb3VnaCkgSSB3b25kZXINCj4gd2hldGhlciB3ZSBuZWVk
IHRvIGludGVyY2VwdCBDQVAgYXQgYWxsLCBhbmQgaWYgd2UgZG8sIHdoZXRoZXIgd2UNCj4gd291
bGRuJ3QgYmV0dGVyIHRyeSB0byByZWdpc3RlciBDVFJMIGZpcnN0Lg0KTWF5YmUgd2UgY2FuIHJl
bW92ZSB0aGUgImNvbnRpbnVlIiB3aGVuIGZhaWxpbmcgdG8gcmVnaXN0ZXIgQ0FQIGFuZCBrZWVw
IG1vdmluZyBmb3J3YXJkIHRvIHJlZ2lzdGVyIENUUkw/IHNpbmNlDQpkb20wIGNhbiBhY2Nlc3Mg
aGFyZHdhcmUgZGlyZWN0bHkgd2l0aG91dCBoYW5kbGVyIGFuZCBDQVAgaXMgUk8uDQoNCj4gDQo+
IEphbg0KPiANCj4+IFRoaXMgYWxyZWFkeSBoYXBwZW5zIGluIG90aGVyIGNhcGFiaWxpdHkgaW5p
dCBwYXRocywgdGhhdCBhcmUgbXVjaCBsZXNzDQo+PiBjYXJlZnVsIGFib3V0IHJldHVybmluZyBl
cnJvcnMsIHNvIEphbiBtaWdodCBiZSByaWdodCB0aGF0IGlmIG5vdGhpbmcNCj4+IGVsc2UgZm9y
IGNvbnNpc3RlbmN5IHdlIHJldHVybiBhbiBlcnJvci4gIFdpdGggdGhlIGhvcGUgdGhhdA0KPj4g
aW5pdGlhbGl6YXRpb24gZXJyb3Igb2YgY2FwYWJpbGl0aWVzIGluIHZQQ0kgd2lsbCBldmVudHVh
bGx5IGxlYWQgdG8NCj4+IHN1Y2ggY2FwYWJpbGl0aWVzIGJlaW5nIGhpZGRlbiBpbnN0ZWFkIG9m
IHJlbW92aW5nIGFsbCB2UENJIGhhbmRsZXJzDQo+PiBmcm9tIHRoZSBkZXZpY2UuDQo+Pg0KPj4g
VGhhbmtzLCBSb2dlci4NCj4gDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

