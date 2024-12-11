Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C618F9EC629
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854031.1267336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHbE-0008Fu-KY; Wed, 11 Dec 2024 07:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854031.1267336; Wed, 11 Dec 2024 07:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHbE-0008DP-H2; Wed, 11 Dec 2024 07:57:36 +0000
Received: by outflank-mailman (input) for mailman id 854031;
 Wed, 11 Dec 2024 07:57:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqCb=TE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tLHbD-0008DJ-IZ
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:57:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2009::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93c34ba3-b795-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 08:57:33 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB5638.namprd12.prod.outlook.com (2603:10b6:806:229::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 07:57:29 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 07:57:29 +0000
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
X-Inumbo-ID: 93c34ba3-b795-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0BvR4MdCjvNmqPvsSpBfrwpPpx61dwWUNvwwk0phDpgEYEGx+32Bq7eC/l04fRxCKzJe0wdRJbubh9IQFeKxyc4udeaQBYHO3FUFrTSvpmwUCjt3s5G8P9Knco01em5C6bBoOiQn+D0THeyqPLVu72rHWqOx0GGRv/0Zix/w0VP2hjmzxivD1VTlEwEZpen/2Yh2g5fkfu7RTED5skTUvxzAapaIxVPI8CfWQ2h6ukUPjLFuaU0QKI4YJ6P7B/wkiQywYxLDbMLTQvdUa+02pwu4xOhlnYg31URXIEQTQlVWLvsmD8fG3bqLYfAsoFVwqU6mhfd6tzNk42TQBmPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAH43cGBL4j2MZBBksdqGyVk+alJRkttCFpKKRpYgjI=;
 b=bGv18+DJvnFQBXBxoBm0KLgqhForZbhK0sx/GBPAknLKIFVWF1EJMgphJHuzJLBvJ603P9kKTuhCt22tq3oKIqtk0fP92pF8aGx8WKKk5l3KQB7njupgmQ3Gouf/KiKdCz1TGgK7Y6VP/ZXGjd5K3QPDxTLjnfj4Kq4I39nlv6BXJ70suH9tj3v0jlbW53qRJifTTseui1n/Vi8JNvozsp7CdxNVH2OZ2aWkqGpD6ui5e1sqfOdctqTrTrr1r86UcwBhxg3zdbOFLLCBwUIpC498UGVws1l4n3efzk+8LgDfNCwsg7/LvQbiyGDY6mBiYxRJ/QgEn6Uyp3vi4sEhwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAH43cGBL4j2MZBBksdqGyVk+alJRkttCFpKKRpYgjI=;
 b=h9tssph8V+JgrERjL3avXKKGR/LHjtsOK97PHJvvcGGfQCAuUn6kfkjE779mRuHRBxwtFwwWKu4XPQK2XlyGQyDQe/QLs+S7Gx8w8gfMpyuVw8kx7oJEnXY2e0T00E2Xy/HdVog5csg19Wkos/CswQ5hjpDQjoXdwReaWVkeJKg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Topic: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Index:
 AQHbRIDgGHZ3ofHO0UuqqXvn+EZCabLd/CGAgAGXh4D//4qBgIAAiieA//+hwICAABlHgIAB3TaA
Date: Wed, 11 Dec 2024 07:57:29 +0000
Message-ID:
 <BL1PR12MB58492072C5D445052FD056D5E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
 <BL1PR12MB58499BEB287C4F9711324F71E73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <1e0576d9-400e-4483-8dd1-061e215a00cd@suse.com>
 <BL1PR12MB584945F11C271CE137231F7BE73D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a07bca59-90d2-4a84-bb47-59157bf5207d@suse.com>
 <Z1glF5FJjnSzRqsB@macbook.local>
In-Reply-To: <Z1glF5FJjnSzRqsB@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8230.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB5638:EE_
x-ms-office365-filtering-correlation-id: be088f42-3038-401b-6694-08dd19b97627
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?a2tJb1A2MloxcnVlWjdQejQ3ZHpmcDNKWUdHMllUNlpxaFp2Z3BFZTFRSVB6?=
 =?utf-8?B?R01LVXdnZVRUNVpFZHl5K3ZIOUFvZElFV3BlNkk0RnczdUlBV0NadTg3aWN0?=
 =?utf-8?B?S2ljZ2VFMDFRQUZMSUppZHZHa0o4RVBFajNYOUdPRFdxeVJxSFJwL0s5RzVj?=
 =?utf-8?B?K2VIc2ZZSjdIYndaRUFqUEplQUFuVEFFaHJwdHNSV0svMUw4Q25vekdHeHdP?=
 =?utf-8?B?RjMxQXY5R0c3Y2lXWUx5aEZKaHFmV2YyTjhCelV3Nk1UZ1dvWklwYmJLbmJL?=
 =?utf-8?B?M1FhM1V1K0pkM0VJWnF5S3dHVFNNKzJxOWsvRVQxQUJsOTQxUTJIamVCL0pm?=
 =?utf-8?B?ZWE2eXMrZkZBL0JxelYvNFpZQ1VabERhNVkvNlBLY0xUOCtkS1RTR2lMSUs3?=
 =?utf-8?B?Y0RiRGovVmRFMXFvTWJKNVRWYUxqaWx6UlhXM1R3cGVjRmxpRm5RT0hlMDlv?=
 =?utf-8?B?MWlJdGlDeWFpOERFQmlkMmVVaHJHSVZCMDlRNExUZVE5OUZFU0IycEx4MXly?=
 =?utf-8?B?c0FwRFNmUFp3QWc1bUpTZWFtVUt5TjMrWEJidU5wYlNvUGU3eitSTjNocE9t?=
 =?utf-8?B?NnF6YzV2NG92NVlGUWljSEQ3VG5hV3FuN3NyeTlwOGI4cGFaZWFBUERQejk5?=
 =?utf-8?B?ZUEvb1UxVjV1c2g1WXNRZ2o2d1RNc0xyVW5xTXFqd21QeUFZaTF5VkszLzRU?=
 =?utf-8?B?V0lRSVMyY1VwaDZPZTdwSGVranhIenNKSmlHVVpNMng5M0RpMDJTRldhTGJt?=
 =?utf-8?B?TEpGTVNHdmFBM0FGR2UzWWt4MDhNbysraGplbE0vZGRBRG0yQmpHcThTMTZx?=
 =?utf-8?B?RzUvbHc1NnROU1lIQzBZQnFmV1BwcTJJTWEyOHREWC9reGE5Tks3bEg2UWhj?=
 =?utf-8?B?bW5wamFKMm5weHNGUkl2cm5TTDFVMTI0N0pFOXhOZ2pOMENzUDUvWEZheThK?=
 =?utf-8?B?RGVoMzZVNkwzTlJHb3FWSDNTQ3E0d21IdFdBbzNIbmZsWTd1VVRYM0tsL3Ew?=
 =?utf-8?B?WmVBa0gyVFBUNzlhSFBQbkNsdVFKdjliUk9KZmdZZENZYU40aGpST2FjQVdo?=
 =?utf-8?B?cWE5WGJrbklsaTRjZGZBVVlHV0Q2aE9ZQmR1WnRaMUI4bTRmUzMvelZoWFhk?=
 =?utf-8?B?amFBbWhpWkRFNEdSTlJSazBCaDNENlFXUHduZVdUTFp6aHRxbUVGN2crMjdN?=
 =?utf-8?B?dFMyVTdJRkZYb0NONEFpZEJMQWVTL3F3UUNmeDlYVHpUNUI5a2JKb2lpZ1Y3?=
 =?utf-8?B?Q2JSd2VCM2lsMHRlOGdlNWVna1ZBRkk2RHN4UW81MURNNXNJMm11K2lVWVRH?=
 =?utf-8?B?a2tGek1VbWpQUE5CUGhIMzZsY3VLK3RmV3IrdnptcmVXNmkzRU9WK3hYSkx3?=
 =?utf-8?B?NDliTXF5WENlQTAwTVpEdm02Skc2bDRrV0pRRlh3WFc4NFViRkI5bjhKdWtY?=
 =?utf-8?B?cVlUblN1ajliTWYyS2t4bFBLejh4dnIwNjZDREJNWDBBcmQ1Y0UzTXpRQjBo?=
 =?utf-8?B?WEtubzlJemlFRmVGemJXVC9UT01IS3FndWhtSXhzQTNWN3djVHR1TTR1b3NV?=
 =?utf-8?B?SVR2TEx0TGNMUXo2b0tTTy9xdnozMVlOYmE2dEJJKzdFM0I3WmhBRUozQWJZ?=
 =?utf-8?B?WnpRVng0ckIxTUFMMDV0ZExndk1WQ0QwMHhWb0lvZFd3cWVpMXJqRzNScUJ5?=
 =?utf-8?B?bzdSb2JuN1pzcHVaQVJGOHRXZW1maXIyaC8vZTNnN2dtV3FIeDVvRWJFUlJz?=
 =?utf-8?B?eDQzQVhCRTZicmJZcUpuaTZOY3VMUEtBb0t1MVlnRWhEMks3SkxUbzZ2WjRn?=
 =?utf-8?B?TG5neXV1bjhwSmtJRTZuQU9VWlluNzBuVXlyREZKdXRiZ0hWYmRYZzBZYlA3?=
 =?utf-8?B?ajIzRmlQRlNkQXJkcG5NeGh3VkorNmlSQ1hkR2Z1Y0ZMSmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXZQVUE0UmRwK0lGMlNjaHhLM2E0Y24vVEMxeGVxWWdDSmNpVUZZTjVoWitn?=
 =?utf-8?B?MzBnTExpQW9XMGszUW5ybTlxVGgyak1PK2h3OWt6UllRVitaOGdLS2JhU2M2?=
 =?utf-8?B?QWRPdHNLR3NUQ01YcUFVbDh1NjJqV1BCcnJNTVZBVVZPYy9weTQrbjFjcHhV?=
 =?utf-8?B?SmpDVmdEUTY2dUhiOGs2dmpveHYwL0ZHbEh0bk02dmlGcmlKT1ZQVkdSYUlH?=
 =?utf-8?B?WkV3SkRNL1N5WXZPbjF2eTE3SXJIVjRIV04yREhvbUR5ei96c2NFYlQ4RGtQ?=
 =?utf-8?B?MmFsbGpVVU9sZUhsSTNRZFJ3SWhkeGovcHFVL1UvdHFHOUpLVHhlYXNlOW5V?=
 =?utf-8?B?aURJRTg2SkZQOU8zbGFXTHVMY1BIRlE4ZUgxK3Nob0hZbUdUV2JFQ29wdytN?=
 =?utf-8?B?TldaRzR5RXVhREc4bGJndXNKZGZDYWRHYkUwYkFsN0JSNjkwd3ovNVhOY1NU?=
 =?utf-8?B?RGc5YzdrMzJWZXJIcGtoNGp2RDhxcHVKdUxLcElCbEJiTU5Sd1NBOFhFM2Mv?=
 =?utf-8?B?T1IwSGYzc3MwRG45N1FYTXV3TDJXUmtjRjlDOXZ0QWpnWndoVUhzZnFvbTUv?=
 =?utf-8?B?WHYxWGUzL2NtZEptNmM5bWd6NUlyRTRkUjk5Z2MwanNpL0lRSjhhU3F2Skpw?=
 =?utf-8?B?eWVQemtabzZSMUZsZVZUOWdRcTdzNUlqcmllVHh2bjVFWHhaL2VDbGtXM2Jh?=
 =?utf-8?B?RU1EYTl6SXo4MWh2RHVHQVJaU0o0Nk5pNmIvcWg1c1J3Y1BId1J4OUxwcWV2?=
 =?utf-8?B?WTFHUzdvSFY5aUJIaFllWjVGZjlkSmhiMXBoNTIxWmZSWnlXWG84UjNGUUQ5?=
 =?utf-8?B?RGdzTlJhZDZ6UC96anl0Vlltc1FseXZrS2E0VE9zbUM4T3J2ZTNveGh2dzhi?=
 =?utf-8?B?M0dpK1dEYkxBR3JIczh1U09nekhkZnpSRUxPc1BDMCtHUFVPKzVySldCU0pP?=
 =?utf-8?B?QWJhNkxxWmRqTkFuRU8yWjdhNG1uUUIwYVdHbjBhMHhCVTRmUjNpY1VkZGk5?=
 =?utf-8?B?cGI0cXJJaVpHMksvNmNEZk4vcmhjc3NWQnY0eSt6eDcvL1RQek90emx5NU5x?=
 =?utf-8?B?K1pUaUw3aS9sYk0wSnRKV2xLeERyejJjb09iTlYyemhVTXA2TTlyNUVxbFZS?=
 =?utf-8?B?ZnhPb015dXFJa1NUWnE0NjlWeWZYN01JYmpkTVhDNjdpd3hlWGhUYndKMkpY?=
 =?utf-8?B?aWpzQ0ZjYjFhWDNKMHhWMHd5ajZXQk10cXFuQUV5RWRxUEM1Q3dPbzJiL3dj?=
 =?utf-8?B?S2ljT3lGbm9uWG5NR3F2WnJWaWY3eUZUUWVLVGEzTTZ0akhHd2gzODZKN1Fs?=
 =?utf-8?B?TlBHaEp4emhWVlBZZWQwbXNBN3grYko4c2dtSzEyVjZvNzkxR0dKdE1DeUhy?=
 =?utf-8?B?KzlrNWRiLzB2UEV2ODRudmRLNDRvMmYydTJYOFlidzhjaEM4Vm44dHhJWG1a?=
 =?utf-8?B?ZHkzZTZSNkVra1ZCR2MwNURaVytYb3RzNzVNR2JnKy9MNzc5RXBWeFZHL2Fv?=
 =?utf-8?B?NFdOTksrSk1lc3V1RXljZndOTFdjY1VNNmI0K3hNUHRrVlpzaEo2NExtQkZD?=
 =?utf-8?B?L3pCTlRrVHdncWFNWFJLSlV5ZXVJQWpZa1cyUDkrOUdtQ0NTY1R2dnpLY0Z5?=
 =?utf-8?B?MjNoY08rSWpsSjV3alNud05ZUDI4cFdtbFVwcWpQYVh0bkJYZmxoNE00TWpW?=
 =?utf-8?B?OFprN0E0enltNEkrcVkrbEZQQTE3STNkMnpSRlJJQStCMlRTdExURUh1Mi9I?=
 =?utf-8?B?MTNMREpEdWsrQ0Y4NGxweWtGQ21MdU8wbkYyRGRMdDlrdUs4cnJ4MmIzVWp3?=
 =?utf-8?B?cnBDQm95R2thcWpUd0RNM09OUTErRXFMYWc3Z2tPQjQxREE0TXplSW9iOGtj?=
 =?utf-8?B?K3dFRndnN3poS2xGY2puZ2QyQ2xPdmR0VUVNN1hhdW9HMzFhSWFuNlV1S2c0?=
 =?utf-8?B?SDhjSGNWdzR6N25MSkplc2NCdU8yaG14THYzVmhHeDhlMmVSczY3NEVoa01C?=
 =?utf-8?B?YmhuamVFclMycWdlTXhkNHhqUFNVd1RWdXpCeXVFWWpZK3JKMjdmQXRlTFFz?=
 =?utf-8?B?TW9Ga3RlUFg0QTZpN0Z5TUkzT1RPbDBpa0QyZkxmRWFtN21VQWJFUDU2Kzll?=
 =?utf-8?Q?xTXY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA2C57DF9D37C845A0C5ECF20A3EEE3D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be088f42-3038-401b-6694-08dd19b97627
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 07:57:29.7837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tu2HLeTVCTGoTs6BYcTbHOt/Ut4y6eSrYwr0WkrUHNi9pbSAztUyA3KoT52IuOen35zfD15nFnzyojzVIxZHLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5638

T24gMjAyNC8xMi8xMCAxOToyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVHVlLCBE
ZWMgMTAsIDIwMjQgYXQgMTA6NTQ6NDNBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBP
biAxMC4xMi4yMDI0IDA4OjU3LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4gT24gMjAyNC8xMi8x
MCAxNToxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDEwLjEyLjIwMjQgMDg6MDcsIENo
ZW4sIEppcWlhbiB3cm90ZToNCj4+Pj4+IE9uIDIwMjQvMTIvOSAyMTo1OSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4gT24gMDIuMTIuMjAyNCAwNzowOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+
Pj4+Pj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4+Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4+ICsg
ICAgICAgICAgICBwcmludGsoIiVwcDogYWRkIHJlZ2lzdGVyIGZvciBQQ0lfUkVCQVJfQ0FQIGZh
aWxlZCAocmM9JWQpXG4iLA0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICZwZGV2LT5zYmRm
LCByYyk7DQo+Pj4+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4+Pj4gKyAgICAgICAgfQ0K
Pj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+
dnBjaSwgdnBjaV9od19yZWFkMzIsIHJlYmFyX2N0cmxfd3JpdGUsDQo+Pj4+Pj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmViYXJfb2Zmc2V0ICsgUENJX1JFQkFSX0NUUkwsIDQs
DQo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGRldi0+dnBjaS0+aGVh
ZGVyLmJhcnMpOw0KPj4+Pj4+PiArICAgICAgICBpZiAoIHJjICkNCj4+Pj4+Pj4gKyAgICAgICAg
ew0KPj4+Pj4+PiArICAgICAgICAgICAgcHJpbnRrKCIlcHA6IGFkZCByZWdpc3RlciBmb3IgUENJ
X1JFQkFSX0NUUkwgZmFpbGVkICVkXG4iLA0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICZw
ZGV2LT5zYmRmLCByYyk7DQo+Pj4+Pj4+ICsgICAgICAgICAgICBicmVhazsNCj4+Pj4+Pg0KPj4+
Pj4+IElzIGl0IGNvcnJlY3QgdG8ga2VlcCB0aGUgb3RoZXIgaGFuZGxlciBpbnN0YWxsZWQ/IEFm
dGVyIGFsbCAuLi4NCj4+Pj4+IFdpbGwgY2hhbmdlIHRvICJyZXR1cm4gcmM7IiBoZXJlIGFuZCBh
Ym92ZSBpbiBuZXh0IHZlcnNpb24uDQo+Pj4+DQo+Pj4+IEknbSBub3QgY29udmluY2VkIHRoaXMg
aXMgd2hhdCB3ZSB3YW50LCBhcyBwZXIgLi4uDQo+Pj4+DQo+Pj4+Pj4+ICsgICAgICAgIH0NCj4+
Pj4+Pj4gKyAgICB9DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICByZXR1cm4gMDsNCj4+Pj4+Pg0K
Pj4+Pj4+IC4uLiB5b3UgLSBpbW8gc2Vuc2libHkgLSBhcmVuJ3QgY29tbXVuaWNhdGluZyB0aGUg
ZXJyb3IgYmFjayB1cCAodG8gYWxsb3cNCj4+Pj4+PiB0aGUgZGV2aWNlIHRvIGJlIHVzZWQgd2l0
aG91dCBCQVIgcmVzaXppbmcuDQo+Pj4+DQo+Pj4+IC4uLiB3aGF0IEkgc2FpZCBoZXJlLg0KPj4+
IFNvcnJ5LCBJIGRpZG7igJl0IHVuZGVyc3RhbmQuDQo+Pj4gRG8geW91IG1lYW4gaXQgaXMgbm90
IGVub3VnaCB0byByZXR1cm4gZXJyb3IgY29kZSBvbmNlIGEgaGFuZGxlciBmYWlsZWQgdG8gYmUg
aW5zdGFsbGVkLCBJIG5lZWQgdG8gcmVtb3ZlIHRoZSBhbHJlYWR5IGluc3RhbGxlZCBoYW5kbGVy
cz8NCj4+DQo+PiBObywgaWYgeW91IHJldHVybiBhbiBlcnJvciBoZXJlLCBub3RoaW5nIGVsc2Ug
bmVlZHMgZG9pbmcuIEhvd2V2ZXIsIEkNCj4+IHF1ZXN0aW9uIHRoYXQgcmV0dXJuaW5nIGFuIGVy
cm9yIGhlcmUgaXMgZ29vZCBvciBldmVuIG5lY2Vzc2FyeS4gSW4NCj4+IHRoZSBldmVudCBvZiBh
biBlcnJvciwgdGhlIGRldmljZSBvdWdodCB0byBzdGlsbCBiZSB1c2FibGUsIGp1c3QNCj4+IHdp
dGhvdXQgdGhlIEJBUi1yZXNpemluZyBjYXBhYmlsaXR5Lg0KPiANCj4gU28geW91IHN1Z2dlc3Qg
dGhhdCB0aGUgY2FwYWJpbGl0eSBzaG91bGQgYmUgaGlkZGVuIGluIHRoYXQgY2FzZT8gIFdlDQo+
IGhhdmUgbG9naWMgdG8gaGlkZSBjYXBhYmlsaXRpZXMsIGp1c3Qgbm90IHVzZWQgZm9yIHRoZSBo
YXJkd2FyZQ0KPiBkb21haW4uICBJdCB3b3VsZCBuZWVkIHNvbWUgZXh0cmEgd2lyaW5nIHRvIGJl
IGNhcGFibGUgb2YgaGlkaW5nDQo+IGZhaWxlZCBjYXBhYmlsaXRpZXMuDQpDYW4geW91IGdpdmUg
bWUgYSBndWlkYW5jZSBvbiBob3cgdG8gaGlkZSBhIGZhaWxlZCBjYXBhYmlsaXR5Pw0KV2hhdCBj
b2RlcyBhcmUgY3VycmVudCBsb2dpYyB0byBoaWRlIGNhcGFiaWxpdGllcz8NClRoZW4gbWF5YmUg
SSBjYW4gYWRkIGEgcGF0Y2ggdG8gaW1wbGVtZW50IGl0Lg0KDQo+IA0KPiBSZWdhcmRzLCBSb2dl
ci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

