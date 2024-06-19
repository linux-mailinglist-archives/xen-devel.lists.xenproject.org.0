Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205890E4F1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 09:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743515.1150431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJq88-0002aj-L5; Wed, 19 Jun 2024 07:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743515.1150431; Wed, 19 Jun 2024 07:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJq88-0002Xi-IB; Wed, 19 Jun 2024 07:53:20 +0000
Received: by outflank-mailman (input) for mailman id 743515;
 Wed, 19 Jun 2024 07:53:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WeeD=NV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJq86-0002Xc-UB
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 07:53:19 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:2418::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbd6aef8-2e10-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 09:53:16 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH8PR12MB7279.namprd12.prod.outlook.com (2603:10b6:510:221::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Wed, 19 Jun
 2024 07:53:12 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 07:53:11 +0000
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
X-Inumbo-ID: fbd6aef8-2e10-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YK/rtaxXeOYC1FeOvH4zbTpezthSiXffkIdXc8r+lKQAcGxjMQouHEOUT24bAaXopgRXsCu4qcBs+HWJrGlwzLUqd2egnp18Ncw5SOcxVAN0nTLQWkCg7ER+LT1HVTCnpAJhANqoSSckgtiDl0yBh2U9fuqHlZ2hx1VmLMv+Tj3gz4mSx4LStqXqV2g5saaEo59cLRDAqSFNKCFGz6tAte7zsEm9/b5QG0yOTy3Yk8FqgWx25jH45K9LVhtcomaf5uXX/b+oNjnf154mo6lVghJxWc247PO/DFy2b0X/8NDw6rSiwwKyFsSFo7E5j4mtaL9ABKMMm/vFUE8QcieMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owIIR3BIiKRD4oy3Mex6AAapkXTJc9SwHKUdDHpBSRc=;
 b=A2fnynodjr9pgU0s0B2Rth+NuM8yv3zk4JEn2SiAL6/dkMRQyMFi9ThJsssL616PIgYpR1u3S0ubyy7LbN8sV8fOweGFksja175ZCxSksaTGMH7fvYgWdR2oT7C677B3AN1ykkdUsyvT1p8w4TK1KhyqVTeMf8n5c1C94vithCEQSnKrMesRX2x88jO9N940Qv6Rms+6dFFvG5rWONM/ZtYfbng6mb1yaWgmotN9eSRVw0zeuj1bxdc9MgODvGiE1zhLVEGDiB0u7+dMhGQhANYH9srXOih3yx/b7k9M+Hs527tLcYEDDXLoJcf7THP21E1zpxNYEmiwbGjeSN2Hig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owIIR3BIiKRD4oy3Mex6AAapkXTJc9SwHKUdDHpBSRc=;
 b=qmIp6YYG7Cgu9S3JomzfbHhm/75r/4CuJHfyArILUp+4/cxTFKE4Z4rwSeJresfDl46S43Tdt/ipJfYRheZDV3IM5pbK8sC43xb5HbM1QvY9GvcRso5CqcNdIBdo+byIlu1aBb4FZoPgywfo1qhZKuzF5VmDNJTjdsTH7auyrIM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v10 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Topic: [XEN PATCH v10 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Index: AQHawJTljFn+TFlFw0Cz/HTewbBwKbHMCqyAgAGSNQD//5yWgIAB+7GA
Date: Wed, 19 Jun 2024 07:53:11 +0000
Message-ID:
 <BL1PR12MB5849861E424724C6E9DE3859E7CF2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-4-Jiqian.Chen@amd.com>
 <ed36b376-a5f0-457b-8a1e-61104c26ffce@suse.com>
 <BL1PR12MB5849FE3A4897DF166159B906E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b923a32e-3c22-4e7a-8844-b33322ef8ad1@suse.com>
In-Reply-To: <b923a32e-3c22-4e7a-8844-b33322ef8ad1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7677.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH8PR12MB7279:EE_
x-ms-office365-filtering-correlation-id: a9900639-2623-4016-8f80-08dc9034dda5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|7416011|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?dnJrTlowMmdwT1c5eVVZTjBReFg2YlhzWlZJSVY1V3FQOE9obHpSMkJ5VHdq?=
 =?utf-8?B?NzRZaUNsMXNyUUpwOHZwV21DdTZIM3RoNlFxQzhZSENvYlZMa21VU09rTVdw?=
 =?utf-8?B?eGZ4UmhLWEZ3WTJKMFA4eUE5YTJrOHIzaXAvOVUrTXpQais1UVExc1Q1dkJi?=
 =?utf-8?B?cDNkamN1YWZMK3FlcVM2ZHhTNTExcm5mVTBwWHlKVEwwZXlBbGpjcGoyZlBt?=
 =?utf-8?B?eU53cjRhd2hyOUUrdFBta3o0OWd3M2NPcm5oRVJnRnFHRnhIaUFDWDR5Qk1P?=
 =?utf-8?B?OUUwaGFZcVk5NUV5NUNRQU4vZDB5ZTdSMmJFRllUQ2xPQ2NLMkJST0U0Ym9z?=
 =?utf-8?B?VmhjaGRWajRNZTFFWWE4NlhBT2cvZmhZUFUxKzdlb0ZXMzlTc24wc1pkYUgy?=
 =?utf-8?B?SXB1S0lLenF5WXZWVlA5VTZobXVENWRNTFE5SThGT1dpMVNCN0V0RG5OQWdx?=
 =?utf-8?B?aXUzellqc1EzT1ozWElROUZiK2huRm5jQUk1WE9iS1RmVHpDc3hFUHN4K3JC?=
 =?utf-8?B?NXlRcjE1cllpUUpYdHNSdlNtSWlTVjUyOGU3WWtXNDN4dGhnbEZHNzZMVDRM?=
 =?utf-8?B?anE5SHRuMG1GdVRpMmJuYy9MOTVTVWEvZjZOTmZ0OUtFdWpyQmgySG0xYWkr?=
 =?utf-8?B?Z1R0dDVtT3g4VzlNTmRUZnJSdUpWS2xTUk9QVURtOHdmNFVneEYwNnVFbXlq?=
 =?utf-8?B?THc5VWRFWkNBNWNDdks0VndocE1sdHlaVHRENmwwTjZML0IxeG9OOVdGZEFj?=
 =?utf-8?B?Qm41dkdwOXFVRXc3ZDNDWkZGL1IvMzFVdndUWkk5bkpwZUdwVFplcE55bVBQ?=
 =?utf-8?B?Kzh1ckhzczVkZGxPOW9Pa0R2RUsrbzljdVRXcGZiZ2M4cTdCQ1ZFZXRlMWJi?=
 =?utf-8?B?bEJNVWRPZDFMQmlCN2lzQ2NMOWVnVmJxRkFIQ2RTNFlOcUlRWmFmZ1Q4MkJv?=
 =?utf-8?B?eGh0d0o2aTg0ZWJieW15OW5EdFNHSFBKejMyNmtQenV5aEhIOC9HTDN3bFFM?=
 =?utf-8?B?R3hnVDVQNGJ5TExzUHJzWG9BZGh1dmlrbWhzZlRuOWI0enp0bUY5OGhZZFZR?=
 =?utf-8?B?dThOemRuemxzOWFtc2VtZVRDa1l2QXl2TVZDV2piRXJ4eGZrZWVHc05aRldy?=
 =?utf-8?B?U3NQZHQwcmFvR0l3WUw5MjRrb2VsTTIzdm04ZmVWOE5WUkZMclF6OEdCalpR?=
 =?utf-8?B?Y1NkdXlkWWQ0cDgzcml4c0RFYTdCWTNRRGRUUjBweG5YeHB0SHIvNVBUOUJD?=
 =?utf-8?B?ODNEWXduRThWY3kwd1lTWWxsbVFKRHl1a21veFBZU3FtL1BJaVQvaGtrZmh1?=
 =?utf-8?B?MWRMbVZDVllTOFQyYXg5VHZ6aHVGcmVGUmR5YitUU05RaUxwRW51WjZmQmtG?=
 =?utf-8?B?RFVJN01QMVBXejdGUUkvaVkrWVBhL2Q0VXgwanluQVZtdS91alA4RjhxRkVM?=
 =?utf-8?B?WmV0WEtpM1N5allucUNpbzkxYUlUbWluazdFSytqdlduN0lpbWpyeGpJcDVY?=
 =?utf-8?B?aVFOdXhXTjE0VzhIcDBUWVZOeHgxMmJrS0RWOFdRemgvb25yMEVwUUxmV0U0?=
 =?utf-8?B?Y1ptanB5ZUZQbWJkVGFWWldaQmFzbkVCNkI3T1FaNnhJQi9FOVFTbmloWm1r?=
 =?utf-8?B?bmZiclN2SXBlOEQrSFp3WWd3VUltUVBYMTl4eUdIMkFValZIaE9WTFhDeUpY?=
 =?utf-8?B?WCsxd2oxamV6SlRDb0d5WFhhajhQRVRULzI0eUYrVCtJR3doenVvWFEzRGFH?=
 =?utf-8?Q?InPAaUKj9nQoF7udz27xh9b2+6FSt1M6tohYGa4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bkJpcG1zeFp5LzQvb0NtL3pDeE93SGVjVFhpVmF1SnVZOGFWZlhIVFZpdTNE?=
 =?utf-8?B?UzhoK1RWbW1hNmYyYVQ3emluZ1daSUFrV0VPTlBDcFpHOVljVW43cHZCSEVG?=
 =?utf-8?B?U1hzRlA4akdBN2xJYlo5SURHMDlScUpUR3RvREhhRXFodDFrTEpNeG0rL0RQ?=
 =?utf-8?B?emwycmdadGVtZktpWlk2NCtHemNSUHA1Q0pSZHZPYlFvRnRHck4rbGZhRzZv?=
 =?utf-8?B?cy85QmtqZGg0cTc2MjFHZEIybWt3aDR2MG4xY3lRYnA0Qlp4NFNZQzdJOXY4?=
 =?utf-8?B?L3dORGJ0UE92eEcwRkdXcHJMQmkxazY0eXZ4c0hwdkFBTmNTZnFIbzVRMFBq?=
 =?utf-8?B?RlRyU2M1N3dXVlB4Q1l1cnBUaUdkbi9PL0dzQmFqRXN5NjdhYThPVnVTOUcw?=
 =?utf-8?B?MXRJWi9rb0ZaMjh4enRlS0xEVGFaTTFnQVJPTXFIRTZFODBzdnJ4MDBtWTNl?=
 =?utf-8?B?SVpyRGlUc08zVUdDT2E1M2IrUENKNkJneXkyL3g3VzI4N0lQWWlybTk4Rm56?=
 =?utf-8?B?YW12YVRxc0daVkU3K0dVU093Wi9QOW1kYk9lUGtUTUxJUmYxRTQyL1hyQmJq?=
 =?utf-8?B?ZUp1Q3J1V1F1U2trcUJ0OXhNZU9LcVJwQ1h6MjMwZldBYWlYUXorRzdna2hl?=
 =?utf-8?B?OFppNnh3cUNvTGFVYlVsZENrR0JLaHpMMjBNYzZqSDM1ZHVZR2c2WWpBWm9B?=
 =?utf-8?B?U1Nwa2pyZ2JZQUZCUDF1c2ZhTWJxRXE2d0pNSk5QRnYxUlZyRCtWZ1JBWjl0?=
 =?utf-8?B?dEIvOC9sWnpUUENlVCtHTTBSblk3ZmU5R21ENlNrdmEzVjdFYjRIVTJpS1NY?=
 =?utf-8?B?UEdQRUZ2Y1pWTXBMRzVZK3FqbU5mYnlkWHlnYjM2bWlqQ1M3R3ZHeVBzM3VP?=
 =?utf-8?B?WDZocnYrRGM2VEdtUlVyTVFxNURLV2RFQVR5d2wwZVBkRVYwdXNSbGpBN3FF?=
 =?utf-8?B?ZUxxWDZtd09UT2J4NUVXOHlaWFd4d1RLY2p4ZCtVL21sSVF5ZGNvbitIc1pS?=
 =?utf-8?B?ZGtITnNaWmoxa2JaMkZtOVNYQnNCZDNqeVJEbHlxTFdzbGM5Q1NxVEY1SUtJ?=
 =?utf-8?B?SEIzQzkyVzdGWEdNU0Z2Q0Vsb2VseGlESnBOY2VnYlE2RkZaUTdkZXVyWHdH?=
 =?utf-8?B?ZGVOZU02YmRyZExzT1lvZytOcEIrT0pNck1QeFZGQ0FaZXFENks3dUVmTXZI?=
 =?utf-8?B?dkxpZTZ5VU1rS3hjcS9yWGtXdVJQR1I5dVZuYWRpd2tETFhET2g4SWt6eWFx?=
 =?utf-8?B?QVVJTHBiWk1kTTZ4aFliWVlXdGM5RGVUTUF4UWY0YkVGVmtOU0ZhcjZ4cXY0?=
 =?utf-8?B?LzFUaTl2aHFCa1Y4OEF1Q25xUTBTUksvK1lmYUU1QmVQMXhDNlZXUmlzUkIz?=
 =?utf-8?B?ZTMxZ0tLdFpSMm50YjdaanRUSzNONndhWWhpaDUxMnVtSmJnL1lrWjlhNnZ6?=
 =?utf-8?B?SU5PZndVRVFpS2JFWkg4OHVtdFRXZG0rcFp0NVNrNUN6dUVLU05DcERFbG9h?=
 =?utf-8?B?c2xOYTJtcmNnWStZa2tXYi8zcFkza3RMOXJwUjFnSW9uZ1JFVC9PR2l2Tjgy?=
 =?utf-8?B?cE4vbEZrVjdLd1h4VVZWZUg3di8xSlF6WGd2dnFnSzNocERXQ2h4dnJ4dTQw?=
 =?utf-8?B?RDEyOGpGdjhnQkhkOWJlQklZVXMrY1BXaVRINXIxYWcrbUxBTFY1WGY5a3pa?=
 =?utf-8?B?UU5hV3ZEaGFOQUFMUzNmYUROSVBqaTNNWE1RU3MrbXBkeVFyNk9wQUs0LzYw?=
 =?utf-8?B?dytwMXdNUmk5UmdQNWxLRFdNY1E4TkN0dFo3VkJqNU5lcEVxeGUrR0ZhMEdh?=
 =?utf-8?B?QjRibEIveDQ3M1IvWEYwZldkM1dhQjhFZ25GT3FBSVJQZlUzSzBKWjVrTUZY?=
 =?utf-8?B?Z1lHRmtFQmh1VmFxZVR6eUs5ZC9WZ0syYWNpRElVeDlxd3hjYWx5bTlPU0hq?=
 =?utf-8?B?c0wvenp2ZlppTHdueW9mVlU2M29UN012RlJwV2NBYmFvQ1kyN3duU3RhTmhY?=
 =?utf-8?B?Z3RabytoSW13cTE1UVVrYTE1RU5vY1B3Qk5YR1ZXdzQreVY3cUFYK2wyd3dH?=
 =?utf-8?B?OUNzSUxwSi9FYkZ4RUhWc2o2VzNMdXAyVktaSDBuZ2VvSVF3a3dQNE1obnF3?=
 =?utf-8?Q?sNFI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <469B569D8493A8489EA98EB4B45D1676@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9900639-2623-4016-8f80-08dc9034dda5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 07:53:11.0989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NuIsTzYb8QD5fpzPjqGG5EnlZD6GaqLw4LqiJQAsQwW1OJKwEloYGZrcbApyIz6oayp9bYCM6VTtAx+PHeGrWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7279

T24gMjAyNC82LzE4IDE2OjU1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTguMDYuMjAyNCAw
ODo1NywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzE3IDIyOjUyLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNy4wNi4yMDI0IDExOjAwLCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gVGhlIGdzaSBvZiBhIHBhc3N0aHJvdWdoIGRldmljZSBtdXN0IGJlIGNvbmZpZ3VyZWQg
Zm9yIGl0IHRvIGJlDQo+Pj4+IGFibGUgdG8gYmUgbWFwcGVkIGludG8gYSBodm0gZG9tVS4NCj4+
Pj4gQnV0IFdoZW4gZG9tMCBpcyBQVkgsIHRoZSBnc2lzIGRvbid0IGdldCByZWdpc3RlcmVkLCBp
dCBjYXVzZXMNCj4+Pj4gdGhlIGluZm8gb2YgYXBpYywgcGluIGFuZCBpcnEgbm90IGJlIGFkZGVk
IGludG8gaXJxXzJfcGluIGxpc3QsDQo+Pj4+IGFuZCB0aGUgaGFuZGxlciBvZiBpcnFfZGVzYyBp
cyBub3Qgc2V0LCB0aGVuIHdoZW4gcGFzc3Rocm91Z2ggYQ0KPj4+PiBkZXZpY2UsIHNldHRpbmcg
aW9hcGljIGFmZmluaXR5IGFuZCB2ZWN0b3Igd2lsbCBmYWlsLg0KPj4+Pg0KPj4+PiBUbyBmaXgg
YWJvdmUgcHJvYmxlbSwgb24gTGludXgga2VybmVsIHNpZGUsIGEgbmV3IGNvZGUgd2lsbA0KPj4+
PiBuZWVkIHRvIGNhbGwgUEhZU0RFVk9QX3NldHVwX2dzaSBmb3IgcGFzc3Rocm91Z2ggZGV2aWNl
cyB0bw0KPj4+PiByZWdpc3RlciBnc2kgd2hlbiBkb20wIGlzIFBWSC4NCj4+Pj4NCj4+Pj4gU28s
IGFkZCBQSFlTREVWT1Bfc2V0dXBfZ3NpIGludG8gaHZtX3BoeXNkZXZfb3AgZm9yIGFib3ZlDQo+
Pj4+IHB1cnBvc2UuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFp
YW4uQ2hlbkBhbWQuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFu
Z0BhbWQuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5A
YW1kLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IFRoZSBjb2RlIGxpbmsgdGhhdCB3aWxsIGNhbGwgdGhp
cyBoeXBlcmNhbGwgb24gbGludXgga2VybmVsIHNpZGUgaXMgYXMgZm9sbG93czoNCj4+Pj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjQwNjA3MDc1MTA5LjEyNjI3Ny0zLUpp
cWlhbi5DaGVuQGFtZC5jb20vDQo+Pj4NCj4+PiBPbmUgb2YgbXkgdjkgY29tbWVudHMgd2FzIGFk
ZHJlc3NlZCwgdGhhbmtzLiBSZXBlYXRpbmcgdGhlIG90aGVyLCB1bmFkZHJlc3NlZA0KPj4+IG9u
ZSBoZXJlOg0KPj4+ICJBcyB0byBHU0lzIG5vdCBiZWluZyByZWdpc3RlcmVkOiBJZiB0aGF0J3Mg
bm90IGEgcHJvYmxlbSBmb3IgRG9tMCdzIG93bg0KPj4+ICBvcGVyYXRpb24sIEkgdGhpbmsgaXQn
bGwgYWxzbyB3YW50L25lZWQgZXhwbGFpbmluZyB3aHkgd2hhdCBpcyBzdWZmaWNpZW50IGZvcg0K
Pj4+ICBEb20wIGFsb25lIGlzbid0IHN1ZmZpY2llbnQgd2hlbiBwYXNzLXRocm91Z2ggY29tZXMg
aW50byBwbGF5LiINCj4+IEkgaGF2ZSBtb2RpZmllZCB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gZGVz
Y3JpYmUgd2h5IEdTSXMgYXJlIG5vdCByZWdpc3RlcmVkIGNhbiBjYXVzZSBwYXNzdGhyb3VnaCBu
b3Qgd29yaywgYWNjb3JkaW5nIHRvIHRoaXMgdjkgY29tbWVudC4NCj4+ICIgaXQgY2F1c2VzIHRo
ZSBpbmZvIG9mIGFwaWMsIHBpbiBhbmQgaXJxIG5vdCBiZSBhZGRlZCBpbnRvIGlycV8yX3BpbiBs
aXN0LCBhbmQgdGhlIGhhbmRsZXIgb2YgaXJxX2Rlc2MgaXMgbm90IHNldCwgdGhlbiB3aGVuIHBh
c3N0aHJvdWdoIGEgZGV2aWNlLCBzZXR0aW5nIGlvYXBpYyBhZmZpbml0eSBhbmQgdmVjdG9yIHdp
bGwgZmFpbC4iDQo+PiBXaGF0IGRlc2NyaXB0aW9uIGRvIHlvdSB3YW50IG1lIHRvIGFkZD8NCj4g
DQo+IFdoYXQgSSdkIGZpcnN0IGxpa2UgdG8gaGF2ZSBjbGFyaWZpY2F0aW9uIG9uIChpLmUuIGJl
Zm9yZSBwdXR0aW5nIGl0IGluDQo+IHRoZSBkZXNjcmlwdGlvbiBvbmUgd2F5IG9yIGFub3RoZXIp
OiBIb3cgY29tZSBEb20wIGFsb25lIGdldHMgYXdheSBmaW5lDQo+IHdpdGhvdXQgbWFraW5nIHRo
ZSBjYWxsLCB5ZXQgZm9yIHBhc3N0aHJvdWdoLXRvLURvbVUgaXQncyBuZWVkZWQ/IElzIGl0DQo+
IHBlcmhhcHMgdGhhdCBpdCBqdXN0IHNvIGhhcHBlbmVkIHRoYXQgZm9yIERvbTAgdGhpbmdzIGhh
dmUgYmVlbiB3b3JraW5nDQo+IG9uIHN5c3RlbXMgd2hlcmUgaXQgd2FzIHRlc3RlZCwgYnV0IHRo
ZSBjYWxsIHNob3VsZCBpbiBwcmluY2lwbGUgaGF2ZSBiZWVuDQo+IHRoZXJlIGluIHRoaXMgY2Fz
ZSwgdG9vIFsxXT8gVGhhdCAodG8gbWUgYXQgbGVhc3QpIHdvdWxkIG1ha2UgcXVpdGUgYQ0KPiBk
aWZmZXJlbmNlIGZvciBib3RoIHRoaXMgcGF0Y2gncyBkZXNjcmlwdGlvbiBhbmQgdXMgYWNjZXB0
aW5nIGl0Lg0KT2gsIEkgdGhpbmsgSSBrbm93IHdoYXQncyB5b3VyIGNvbmNlcm4gbm93LiBUaGFu
a3MuDQpGaXJzdCBxdWVzdGlvbiwgd2h5IGdzaSBvZiBkZXZpY2UgY2FuIHdvcmsgb24gUFZIIGRv
bTA6DQpCZWNhdXNlIHdoZW4gcHJvYmUgYSBkcml2ZXIgdG8gYSBub3JtYWwgZGV2aWNlLCBpdCB3
aWxsIGNhbGwgbGludXgga2VybmVsIHNpZGU6cGNpX2RldmljZV9wcm9iZS0+IHJlcXVlc3RfdGhy
ZWFkZWRfaXJxLT4gaXJxX3N0YXJ0dXAtPiBfX3VubWFza19pb2FwaWMtPiBpb19hcGljX3dyaXRl
LCB0aGVuIHRyYXAgaW50byB4ZW4gc2lkZSBodm1lbXVsX2RvX2lvLT4gaHZtX2lvX2ludGVyY2Vw
dC0+IGh2bV9wcm9jZXNzX2lvX2ludGVyY2VwdC0+IHZpb2FwaWNfd3JpdGVfaW5kaXJlY3QtPiB2
aW9hcGljX2h3ZG9tX21hcF9nc2ktPiBtcF9yZWdpc3Rlcl9nc2kuIFNvIHRoYXQgdGhlIGdzaSBj
YW4gYmUgcmVnaXN0ZXJlZC4NClNlY29uZCBxdWVzdGlvbiwgd2h5IGdzaSBvZiBwYXNzdGhyb3Vn
aCBjYW4ndCB3b3JrIG9uIFBWSCBkb20wOg0KQmVjYXVzZSB3aGVuIGFzc2lnbiBhIGRldmljZSB0
byBiZSBwYXNzdGhyb3VnaCwgaXQgdXNlcyBwY2liYWNrIHRvIHByb2JlIHRoZSBkZXZpY2UsIGFu
ZCBpdCBjYWxscyBwY2lzdHViX3Byb2JlLCBidXQgaW4gYWxsIGNhbGxzdGFjayBvZiBwY2lzdHVi
X3Byb2JlLCBpdCBkb2Vzbid0IHVubWFzayB0aGUgZ3NpLCBhbmQgd2UgY2FuIHNlZSBvbiBYZW4g
c2lkZSwgdGhlIGZ1bmN0aW9uIHZpb2FwaWNfaHdkb21fbWFwX2dzaS0+IG1wX3JlZ2lzdGVyX2dz
aSB3aWxsIGJlIGNhbGxlZCBvbmx5IHdoZW4gdGhlIGdzaSBpcyB1bm1hc2tlZCwgc28gdGhhdCB0
aGUgZ3NpIGNhbid0IHdvcmsgZm9yIHBhc3N0aHJvdWdoIGRldmljZS4NCg0KPiANCj4gSmFuDQo+
IA0KPiBbMV0gQWx0ZXJuYXRpdmUgZS5nLiBiZWluZyB0aGF0IGJlY2F1c2Ugb2Ygb3RoZXIgYWN0
aW9ucyBQVkggRG9tMCB0YWtlcywNCj4gbGlrZSB0aGUgSU8tQVBJQyBSVEUgcHJvZ3JhbW1pbmcg
aXQgZG9lcyBmb3IgSVJRcyBpdCB3YW50cyB0byB1c2UgZm9yDQo+IGl0c2VsZiwgdGhlIG5lY2Vz
c2FyeSBpbmZvcm1hdGlvbiBpcyBhbHJlYWR5IHN1aXRhYmx5IGNvbnZleWVkIHRvIFhlbiBpbg0K
PiB0aGF0IGNhc2UuIEluIHN1Y2ggYSBjYXNlIGltbyBpdCdzIHJlbGV2YW50IHRvIG1lbnRpb24g
aW4gdGhlIGRlc2NyaXB0aW9uLg0KPiBOb3QgdGhlIGxlYXN0IGJlY2F1c2UgaWlyYyB0aGUgcGNp
YmFjayBkcml2ZXIgc2V0cyB1cCBhIGZha2UgSVJRIGhhbmRsZXINCj4gaW4gc3VjaCBjYXNlcywg
d2hpY2ggb3VnaHQgdG8gbGVhZCB0byBzaW1pbGFyIElPLUFQSUMgUlRFIHByb2dyYW1taW5nLCBh
dA0KPiB3aGljaCBwb2ludCB0aGUgcXVlc3Rpb24gd291bGQgYWdhaW4gYXJpc2Ugd2h5IHRoZSBo
eXBlcmNhbGwgbmVlZHMNCj4gZXhwb3NpbmcuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFu
IENoZW4uDQo=

