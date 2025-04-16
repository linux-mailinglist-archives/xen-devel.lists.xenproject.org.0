Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6481AA8B400
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 10:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955329.1349127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4yGn-0004Af-Ai; Wed, 16 Apr 2025 08:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955329.1349127; Wed, 16 Apr 2025 08:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4yGn-00047W-7G; Wed, 16 Apr 2025 08:37:21 +0000
Received: by outflank-mailman (input) for mailman id 955329;
 Wed, 16 Apr 2025 08:37:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lrH/=XC=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u4yGl-00047Q-6o
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 08:37:19 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20607.outbound.protection.outlook.com
 [2a01:111:f403:260c::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 012bc3a8-1a9e-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 10:37:18 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB10254.eurprd03.prod.outlook.com
 (2603:10a6:150:165::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 16 Apr
 2025 08:37:14 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8632.035; Wed, 16 Apr 2025
 08:37:14 +0000
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
X-Inumbo-ID: 012bc3a8-1a9e-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJrEHd5OqhSsyUzLSdKfCRAp2mq2r45BjFUbYTesozcRGtN1a6uuIdBeSl+m/CIOtbSgFogk8RbWcHSkZcL4lSp+WgSxxmEIsMfiXIjpgUqAGynXJIp6f5dH/t1VgS8DVpt4nyVDXxuhoCWJ4C2DfxEjV0K8syyoptsV7kFGmSWIuacqmfYzOzHPLntU2f2AhorUAYhuttIg+qVsDsMk41ijK29OSWvEWlF6K9nKWak6z6fm7E3CAqnJNjB8o6IoV64eJRDHDaZ+sQOWkBxrH7wlNY1BOLdUf3Cl8A3DhvZ3q9OKENVg2txGsgw8LjJ3w9Q7C5WKQNu7cf7f0uOq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKCddAureLY+7uhEowl5Ypt7amtZOqCBhpsTe6r4MlE=;
 b=QuvaxLFMZJ0B5ZhNwRXYYy0ySlzmxLabKQbFMt0YiYRZYrK+LjtZYVHDSSzLNQoRgM6prBdgTp/j1pLXEgxW54DzuRgBKDPnoffS1M5r65d/KhvUAA4y4Udxjjrcm4i2PqfLIIiu144EqVMHktLv/67Z0TlQEJfPy/CIer1pEY7BCMUkhV5RiJIG7jMKnBwR1mqex+RD7BCPsBd6m9id/r8q671Pt2weRLRTvyVcyySbpaY2eehKp32vZA+4Zp1F9ntsl3PptDbm9iOVb2PQgFUgFsJ0/gjdcv0KC40hrj8YeLk3qkuZ10IayXlk4ye8AZP7o8c9lc/NWnP7UVeZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKCddAureLY+7uhEowl5Ypt7amtZOqCBhpsTe6r4MlE=;
 b=lA3Yavsn/wzkA9dcl+KZO2rHukKDdfUzayV356aMv/m5mXpY0fZpbZxweCbAGD8mmRfpAEfGaI2EycNWXvq6XKvHSOTlQ83LmQEXv2h/HDjfuuE8zkF8vY3bos/eKUS4ExkHN+8xMg7X2WC8jqSask9o5RVLpriGpO7/gWaCnIhiWKhPK3kEqPQo50fvC6gx/BoYqbzWwoRzOhD1zDIWf006+Otd990sLIiHezDG4fCaFw7Em+YYC538PQcCuBLubcfb3bQif55/8z+YL6MBAQDlLOJDxKcmSB3xYGz8YJLDVCDuUOPsTc6qC3PUF3m/6IBvbPx8jzWOoA0G5POfzg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 0/2] Add support for MSI injection on Arm
Thread-Topic: [PATCH v2 0/2] Add support for MSI injection on Arm
Thread-Index: AQHbrSLDj7RBwKKgz0m9mJin+yPd5rOi+rAAgAJZvwCAAKbLgA==
Date: Wed, 16 Apr 2025 08:37:14 +0000
Message-ID: <15938705-ae5e-43c9-826f-d7a8c7425baa@epam.com>
References: <cover.1744621166.git.mykyta_poturai@epam.com>
 <98feb427-7da5-47ff-831c-2b4bcb26c4b9@xen.org>
 <alpine.DEB.2.22.394.2504151536240.8008@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2504151536240.8008@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB10254:EE_
x-ms-office365-filtering-correlation-id: e116af3b-d2ab-4fcf-14f9-08dd7cc1e38d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RU5ZR3Fmdm4vcDVzV0M2L0N1Y3RHWTF4SnZkWHpxYlB2czNna0FCRWVEYjZG?=
 =?utf-8?B?VGladU0wNC9FWS9uNm1HWTBhMWZjcUtiVGdlbUJUVHJpbW1nMm1va0JCOHF1?=
 =?utf-8?B?S0tJaW9YbjE3eXM2bU9UZ3YyblNVYU10MW80WEY2ZDk0SlQzWE5QbExkSnA1?=
 =?utf-8?B?TitFa3U4ZlNtSXdkMXl4ekt0UVNacWVWSW56UEsxVktYWDZyZFpHVDJlUVc0?=
 =?utf-8?B?ZUJINkplbzJ2SzczdjVGTDRwcmJqc25Pdkh5ZVJYRmpRWE1LdUJmdGF2QXM4?=
 =?utf-8?B?STNKak5VOEFlV2FUTUlJMGg2UDNrK0xxaTYvWjlMeUZ4RWRwQUcyV0JManBV?=
 =?utf-8?B?bGNOOUhmREs2N1Z0RW9QZGl6ZW5BTTZzZXV4UGRZSitTZlZVOW5hL3pnZXJG?=
 =?utf-8?B?RW4zaGE0MGNmeFh0UDRwN0JZekp0a3ZVK0NXMDRSOGdiUGVqRzkyRE1ZSHo1?=
 =?utf-8?B?dTlDNU1kdFNaY0Z4Y3dKU1p3M2JsS0xkZ1I1RzQzS3l4T3pWVHVGS0h6OGhY?=
 =?utf-8?B?emd0L3hOS25waG1odWdkMDFrUmZhTG8vYjJsQlNlTzVXTVFQWmlNUWVjcGdQ?=
 =?utf-8?B?NmEvSkp3TlN5ZjZYN0lCZ2cvK1BNdGkvNDM0NVBJd2RYWGM3aDFxQXpXcUdW?=
 =?utf-8?B?S2w5cUtIclF0dERZRy9Va3VzZWxHWXhTdG81blNJVDZOcVR5bE5kUVhZSW5n?=
 =?utf-8?B?eWtuKzlHYUhIczN1SXVjaEJmK0xMcWwzRXJhQW1wSVl1dE1Ia281UUVNazY0?=
 =?utf-8?B?NFJ6dFNRcG14ekR5V0RwMVN1RUQvaGVEcWtibkZrOGtuQ2psVFU0Visrc1VB?=
 =?utf-8?B?NjU1bWw5YUtJTmN1MC9IREVVcENIWlRFckU3RUI5eVY2SktQRjFwVk9mTHB1?=
 =?utf-8?B?aXA1WWJQRVdFT2RET0doWjB3aVZURy9xaXRMVndaN0VJRWxHRTJtWWYvclg5?=
 =?utf-8?B?cXQzZ0lWSFkvU0dZOGFqZTVHNmwvc2tqTHY1bmVXSzlEeXJ5cGsxejRvbEth?=
 =?utf-8?B?Y05MamhyS2wyaDZuWTdEUkxqV004bHZLSW85bVk1K3lnOG9STDJWWFVVQllE?=
 =?utf-8?B?U2dPeDRrRmh2Vi9PYjRCcUVteW83UER0K0Z4TGVBd3NneXNBUHk3S3RMbFcx?=
 =?utf-8?B?WXZsOEw4Z1NqeUEyUDhqUndSaml4eTl2MmlkMERkY2YzWE1OM1ZVVGpFU1R4?=
 =?utf-8?B?TFFDRW00UEV6SzJjOG85djNWcmZWZ2hjVXhWSlhlS015aDhkb1BNcDFWODRn?=
 =?utf-8?B?Z1hXRXVRRlZVcXh0cCtFcGRDeWthc0ZZbndoeEpZRUg3dUVGUGFzd1ZXMmJx?=
 =?utf-8?B?MC9YUE03ZzRJditxdUZtR3RyZ01WWUh4UndVQXFBOC84THIrTVJzUlhZZjdL?=
 =?utf-8?B?cVVmQ2hpQ3BlN21DdjNRVjZPVjdTbEJaVlFaQjJXeXJwQS9PRld0bFFUcU10?=
 =?utf-8?B?UnhqcUV3MGs5UDlOZmtnRVQveGpJR3FWRGxwK2swcUwrOE4ybVhlZU04eFIy?=
 =?utf-8?B?cUg1d1QwZ2RYdTBWN2RNNDBDZzV6NGhsR1lWVHZCckRSU3dhUWpFazVMYSt2?=
 =?utf-8?B?TllPTWVnNEVtZ21oQmV6dmVGOUhzdzRXaUIveFdDTDlVNS9wYUhBTDhyRnps?=
 =?utf-8?B?Nlg1U1d1djMwTFp5WS94KzBZWlk3RlZhWUk3VGlZc2ZMNThia2ZwTVFpMjg1?=
 =?utf-8?B?ZklkY3I2ZVpjMGlqQVlUaE9lN0tHeWxYaWxuVFNaK2lkVXkrUjk0YzhhZEtN?=
 =?utf-8?B?cHF4Q05nNFhOMWltSER5eXRtRVdBZVRraE1kZS95WDMySDQ4ZGlFYm9scCtp?=
 =?utf-8?B?eFdkVXdYTDBvb2VFUGdhOVFvcGJqWTRPc1NRNzBEV0UzMUV2enVMQWQrYlFP?=
 =?utf-8?B?SllEb3dCeDRwRk9Tekt1UkhsaGc5YUIvNC9sdEdYcFNKa1pKdmFqaVBGdWZI?=
 =?utf-8?Q?JyT0f5r1oH4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUswRW5rNE4wUzhmQkNCY0NIZEZYKzFyaVdDb3M0dWFVb0xjNFdpN1V2TDdl?=
 =?utf-8?B?YWFHQTkzZW5XS0JJQnZNRE1aR0pFQ0Vtc24rTVpFUWV5N3F3Z0h5MEZJQkVl?=
 =?utf-8?B?ejBVMkhYY3Nwa3poMW1Xbjg3ZkJZUVE4aEc1US9aNHUybmEwYllyWEQwSGRa?=
 =?utf-8?B?SHdYZHJNeC9VNWNyQ2xaSStWbUp4V205SU50SURNek96c0dWQThScEVwT3FY?=
 =?utf-8?B?Ny9xdDQwN3V4VS9oaDgxdW93eUlMNTRSMG1Od3NpQzZJbjVRb0dvbXd6cHMx?=
 =?utf-8?B?RGpZdzl3cEp0b2dtY1Z6N3dYVjR3blVGaVNLL1Q0b2hFQnRzZVFVU0lOdmhZ?=
 =?utf-8?B?TXVFTlVvTHNxZ3FXaVdZd1RobStEOXIxN05rL0ZuUVRNek5FZEpwMmZxUGU5?=
 =?utf-8?B?NEoybHZzUTB5Qzlza0ZNRitYVUNLQkhCVEFrcVZiZHV0cDhRendNdmlSd2dn?=
 =?utf-8?B?VVVNRmc4Wk1jd3E3b1R3cDMwekMzL0owUVVWYVdtbkYrOVo3MTFOWUQxYUQx?=
 =?utf-8?B?cHlvMTFjTTlNUVAzS2l4WWdmNnBzQVVZbXZwR0NlVG1kODZLdzRvYkhzNFVx?=
 =?utf-8?B?bVZhcFdYM3RMamRvTVBGSUZGWU1aRzVTb05JKzV4ak5uSzAwMWM4aTl1WjRr?=
 =?utf-8?B?MjNwSWtaNlhRUTgrNkdpUGZ1ZDRZZ2tGMXd0aFYrOEg4cXBQUzhnQjkwd0tI?=
 =?utf-8?B?SG9VWmVXZ0lvY01YanVTQWxncjEzS0VUSFFoNDBkUGMvdXZMeHVTcVdoaVFa?=
 =?utf-8?B?MFQzSTh6RWxxbEozemNSVjArbm1qQmdqMWg0eVNtaUJLOWlGY2RPb1lPaCtj?=
 =?utf-8?B?MEM2NlcrM1lOdkVuK0tiT2x2Smw4ZkJTSFAxUE1TbFF2cEtLSjFjaXRjMHg2?=
 =?utf-8?B?ZWsxTE8reHB3MUJLRjlzR01QWjVnN1lFTUxaYkNpNE9YSkw2dE1EZXlYS3hK?=
 =?utf-8?B?dDVoTlN1bXA3bkVBa2oxZ1hIeGhGVVo3dzhuOVdwdFVTd2Z5MFQ5NVp6dlFQ?=
 =?utf-8?B?NU5DWmk2eXlrcnBXRXN1K1FJQ01LUUtDSVBOTmFoQ0kxMU52bm1SZWNIR21i?=
 =?utf-8?B?V3pDS1pQcHI0bEF1Qm51RTJhc0lPVnIxYXVvaFpZZnBlYndraU1zYmJBWjJJ?=
 =?utf-8?B?ZzYzVW1YeGEzVWM5MnV6YTJhODdmQ0hpYkN1K2ZRU1VENit4bnRUc1dqTGxC?=
 =?utf-8?B?bzY4d0VibXEySGRVNHpVUHFUWTdkaDZpRzlxakJlMEQvNDZLNFFVUmd6RXB5?=
 =?utf-8?B?ZWQwa2Z0MTZ6YlV6NG9lNlNxK1FpVVNBOFZ0RVlhMWdHc1Y4bTRROGJTUzM0?=
 =?utf-8?B?YSttTjlCQmJSUTdQZy9BQVpBaTlnQ2lVbGxKT0xmWkZOTHMwQmhPR3NoZ05F?=
 =?utf-8?B?ditDK0ZXM1RDb29zYmkzTzdzWGVaYjhmeFF4ZWplRmFYNXIxcWo3VC9ndC8y?=
 =?utf-8?B?SXJRS3gxaEJmSEVNNTlaWVpVNTdtS09waGVMM1lybmpxQU1CRVFaSFNURkVy?=
 =?utf-8?B?alJXL3B0bnp4czFuOFRLelcwTDEwa2pNemYvclZLQXpwT3lxdWFJdHdQQy93?=
 =?utf-8?B?dVhIUSt1U0sySUM1TytJZEdxbERYVlZmV3VtU2RFa1AzVEFwKzhaOFRqMUZs?=
 =?utf-8?B?M1gvbTV1SXJOVmIvSEQ5dWJQVFZ2VlpoNTUwUXdtYWhoMFRXSlMxVk16UDBj?=
 =?utf-8?B?ZnE4OXlhQ3JqZFBIYnlrV2llbnJzWnBYOGpIcFdwdTVmSVlxYXNJazdJaG9Z?=
 =?utf-8?B?cUlHODZqeTU1V3RGRFI5TE5ZakdwUDV6ZlFvZ3hMYUpRMlVOSlh5Yi9HY3lw?=
 =?utf-8?B?cGhjNjNsbWVKdUJmRGNEWk5LSW81OXp4MXV0ZWVoSG1abzFnN1J1WWFZc2Ny?=
 =?utf-8?B?bUVMY0REakJlYkRDQ1JyMGYwWFFjLzI1OURxYTA4WkJWU3UxTFRVQTY5WVJM?=
 =?utf-8?B?V29odTBMT1IrNldjRXBMR1c5TzZKb0NRTFc1N0ZOQ05yUTVTZzU3cE1sbmhy?=
 =?utf-8?B?dUQrRXRvUlVEdkpXVHd6VjI5MkNFdEwwR0graExwUCtwd2ZKcFFkWG5KVThE?=
 =?utf-8?B?dlpOUCtXZi9EUVppNUJzdEgyc1VBeW0rK0pmT09wYXNhYm5MbVg2YkR2QVE2?=
 =?utf-8?B?dU0reVJFWnRCTkMyK2VlZkQwdmE2VHlXT0VjWGc0QWtiNmRUNENSOFQ2NW8r?=
 =?utf-8?B?YVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F60B8159DFDB3A4DA62402184BA9E92D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e116af3b-d2ab-4fcf-14f9-08dd7cc1e38d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 08:37:14.4001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EkZkSdNWNlWSgo8eOgP5FY03wC6WZUIh9UOz+/1ha4UyXVv3UkkNL5GRej3/WMH+p8XVSgMLQicrUD/2fQw8rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10254

T24gMTYuMDQuMjUgMDE6NDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gTW9uLCAx
NCBBcHIgMjAyNSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4gSGkgTXlreXRhLA0KPj4NCj4+IE9u
IDE0LzA0LzIwMjUgMTg6NTEsIE15a3l0YSBQb3R1cmFpIHdyb3RlOg0KPj4+IFRoaXMgc2VyaWVz
IGFkZHMgdGhlIGJhc2Ugc3VwcG9ydCBmb3IgTVNJIGluamVjdGlvbiBvbiBBcm0uIFRoaXMgaXMN
Cj4+PiBuZWVkZWQgdG8gc3RyZWFtbGluZSB2aXJ0aW8tcGNpIGludGVycnVwdCB0cmlnZ2VyaW5n
Lg0KPj4+DQo+Pj4gV2l0aCB0aGlzIHBhdGNoZXMsIE1TSXMgY2FuIGJlIHRyaWdnZXJlZCBpbiBn
dWVzdHMgYnkgaXNzdWluZyB0aGUgbmV3DQo+Pj4gRE0gb3AsIGluamVjdF9tc2kyLiBUaGlzIG9w
IGlzIHNpbWlsYXIgdG8gaW5qZWN0X21zaSwgYnV0IGl0IGFsbG93cw0KPj4+IHRvIHNwZWNpZnkg
dGhlIHNvdXJjZSBpZCBvZiB0aGUgTVNJLg0KPj4+DQo+Pj4gV2UgY2hvc2UgdGhlIGFwcHJvYWNo
IG9mIGFkZGluZyBhIG5ldyBETSBvcCBpbnN0ZWFkIG9mIHVzaW5nIHRoZSBwYWQNCj4+PiBmaWVs
ZCBvZiBpbmplY3RfbXNpIGJlY2F1c2Ugd2UgaGF2ZSBubyBjbGVhciB3YXkgb2YgZGlzdGluZ3Vp
c2hpbmcNCj4+PiBiZXR3ZWVuIHNldCBhbmQgdW5zZXQgcGFkIGZpZWxkcy4gTmV3IGltcGxlbWVu
dGF0aW9ucyBhbHNvIGFkZHMgZmxhZ3MNCj4+PiBmaWVsZCB0byBjbGVhcmx5IHNwZWNpZnkgaWYg
dGhlIFNCREYgaXMgc2V0Lg0KPj4+DQo+Pj4gUGF0Y2hlcyB3ZXJlIHRlc3RlZCBvbiBRRU1VIHdp
dGgNCj4+DQo+PiBbLi4uXQ0KPj4NCj4+PiBwYXRjaGVzIGZvciBJVFMgc3VwcG9ydCBmb3IgRG9t
VXMgYXBwbGllZC4NCj4+DQo+PiBUaGlzIG1lYW5zIHRoaXMgc2VyaWVzIGlzIHVudXNhYmxlIHdp
dGhvdXQgZXh0ZXJuYWwgcGF0Y2hlcy4gR2l2ZW4gdGhpcyBpcw0KPj4gYWRkaW5nIGEgbmV3IERN
IG9wZXJhdGlvbnMsIEkgdGhpbmsgaXQgd291bGQgYmUgbW9yZSBzZW5zaWJsZSB0byBoYXZlIHRo
ZSB2SVRTDQo+PiBzdXBwb3J0IG1lcmdlZCBmaXJzdC4gVGhlbiB3ZSBjYW4gbG9vayBhdCBtZXJn
aW5nIHRoaXMgc2VyaWVzLg0KPiANCj4gSGkgTXlreXRhLCBqdXN0IGNoZWNraW5nIGV4cGxpY2l0
bHkgd2l0aCB5b3Ugd2hldGhlciB0aGlzIHNlcmllcw0KPiByZXF1aXJlcyB2Z2ljLXYzLWl0cy5j
IGZvciBEb21Vcz8NCj4gDQo+IElmIHllcywgaG93IGZhciBhcmUgeW91IGZyb20gc2VuZGluZyB0
aGUgcmVsZXZhbnQgcGF0Y2hlcyB0byB4ZW4tZGV2ZWw/DQo+IEhvdyBtYW55IGFyZSB0aGV5Pw0K
DQpIaSBTdGVmYW5vLA0KWWVzLCBJIGFtIHBsYW5uaW5nIHRvIHNlbmQgdGhlbSB0b2dldGhlciB3
aXRoIFZQQ0kgTVNJIHN1cHBvcnQgYWZ0ZXIgDQpTTU1VIHBhdGNoZXMgYXJlIG1lcmdlZC4NCg0K
QWx0aG91Z2ggdGhlIERvbVUgdml0cyBpdHNlbGYgaXMgb25seSB0d28gcGF0Y2hlcy4NCjEuIA0K
aHR0cHM6Ly9naXRodWIuY29tL0RlZWRvbmUveGVuL2NvbW1pdC9jN2ZlNTRlNzc2ZTQyMDVmYmI5
OTNlNDdhNmI4MjZmNTE1NGZhZDc2DQoyLiANCmh0dHBzOi8vZ2l0aHViLmNvbS9EZWVkb25lL3hl
bi9jb21taXQvYjZiNGZmYWRiMzY4ZjU0MGEwYWU4ZWY2YjQ1NzJmMGNmZDJlY2NhYQ0KDQotLQ0K
TXlreXRh

