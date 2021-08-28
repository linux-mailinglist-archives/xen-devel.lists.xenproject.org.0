Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DA3FA31B
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 04:20:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174149.317713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJnwg-0000PD-9o; Sat, 28 Aug 2021 02:19:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174149.317713; Sat, 28 Aug 2021 02:19:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJnwg-0000NK-53; Sat, 28 Aug 2021 02:19:46 +0000
Received: by outflank-mailman (input) for mailman id 174149;
 Sat, 28 Aug 2021 02:19:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJnwe-0000NE-J0
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 02:19:44 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a7a336c-f1ad-4195-8a91-57443f045606;
 Sat, 28 Aug 2021 02:19:41 +0000 (UTC)
Received: from AM5PR0101CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::31) by VI1PR08MB4016.eurprd08.prod.outlook.com
 (2603:10a6:803:ed::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Sat, 28 Aug
 2021 02:19:40 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::56) by AM5PR0101CA0018.outlook.office365.com
 (2603:10a6:206:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Sat, 28 Aug 2021 02:19:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 02:19:39 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Sat, 28 Aug 2021 02:19:39 +0000
Received: from 22c1da211903.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D7C319ED-DB79-43EB-B68B-0FFD247E4ED4.1; 
 Sat, 28 Aug 2021 02:19:32 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 22c1da211903.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 02:19:32 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB4490.eurprd08.prod.outlook.com (2603:10a6:10:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 02:19:31 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 02:19:31 +0000
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
X-Inumbo-ID: 6a7a336c-f1ad-4195-8a91-57443f045606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDuYTnNqCsg+g/n74jX6aio/GZIhaxW2Q2vwbImDZbY=;
 b=zadqo25c4KEvPXSZvgkTce+6Z/zHxLBCPNu/zfzjyDAAur956+EHG8zSu7hEPfgO4YCW7zkwD09ssIX8yxY6Acuhx+Iyhd9N7ot/3sKd3KCl7wn3RRDJ2iVkulPq2Ken/FYrW0h4Sijiz443UeoCbeyEMX/nP5/QC9vKdEWUUfg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYPEsTuPP18tetmzHPPkgDPElH9qXWm4hbsTcrx811Pvvfk6H29Us6j6vdYUd1s1DVy6EZ3SySMTnYCKZ1giJFm2rltMU8xVobpha63jUPa7wRyqCCwwUM6CtMdWtEqJV3JWGF9IlybfBmS3FStQNFSPdjcbCfc+ENWK3e8wyYGRQxQ5L1zpuiVpi8xuD7TbJfSIdKIi66mmpvG18BrhbM9dZ5yn1Cs15k2dR4/KLCEQfG62xMLXrpuuIIGJrRYF5V+1O8DCuAhh0WrvUYVj5cIvZtOaPIL7Ve4BR11l/kQtLio3HN8+tz0O9Go6EgNtiSqfGFlQsGK3iWpvEYFkSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDuYTnNqCsg+g/n74jX6aio/GZIhaxW2Q2vwbImDZbY=;
 b=VIn+AcQJMRZyuc8/Sne+xLXC+TdNOPtuEZX+hjmXdWfRXj1juw7VmpywhnH17EJi4P/x+ziafrLhSY7xhOOzRHhrGOnHX9W5HAanXv81+wfzi9ryYP+flEEQLcOAOyWUphAe4kKUi8mchFZCDXslpprv0gSvV21AUfzU6zZ8xESxOVSIon+yvsphEd/KVAR8fwyiWeKoRCaz4CJIcyFRnVw1+G6VAY6mQUn8r506cvvTHQAbisnRm4U+rV4x25doUmBZFGrMc46d2PrBV6kqBPK9qvKxL+a1Z8NbNn/6CwmSNBCOvolxteAU2FST9SvcQtmPEPDghUE7bdPnHLTt7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDuYTnNqCsg+g/n74jX6aio/GZIhaxW2Q2vwbImDZbY=;
 b=zadqo25c4KEvPXSZvgkTce+6Z/zHxLBCPNu/zfzjyDAAur956+EHG8zSu7hEPfgO4YCW7zkwD09ssIX8yxY6Acuhx+Iyhd9N7ot/3sKd3KCl7wn3RRDJ2iVkulPq2Ken/FYrW0h4Sijiz443UeoCbeyEMX/nP5/QC9vKdEWUUfg=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 36/40] xen/arm: keep guest still be NUMA unware
Thread-Topic: [XEN RFC PATCH 36/40] xen/arm: keep guest still be NUMA unware
Thread-Index: AQHXjptWK29McjsGWUaYeWCynju4ZauHgkiAgADFJ5A=
Date: Sat, 28 Aug 2021 02:19:31 +0000
Message-ID:
 <DB9PR08MB68576E9992224EFFE8E4022E9EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-37-wei.chen@arm.com>
 <7e801a6e-68db-c541-7386-04e981681ec4@xen.org>
In-Reply-To: <7e801a6e-68db-c541-7386-04e981681ec4@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DCCC38094021D240A67D7718E01ED012.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 41277c05-6372-400e-2716-08d969ca4a2e
x-ms-traffictypediagnostic: DBBPR08MB4490:|VI1PR08MB4016:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4016C9B97F5B233A91AE50659EC99@VI1PR08MB4016.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YMW4gfpYjDs3qsiBOoT1fZS8ClMNtvUd80DaHG+CVy+CZHlqbOBlqdhsqF/CkACHQ2xhdby2TpkQP1DP+gxMzZwEqMkmXQFwwmTrCWwktz7qxtKX4Jj3scKwLM8HzDj+dBgQOAjAFw1D4tYNNEDu1rB6Y6Bx6Hb07yquV0DMGNcvx2BB+oVY3Vv5M+uW0o/ICrylLl7tH05k3pPiKIa7n8mZl235bnYuASmcXu2zo7Aqiqc8ADpcVEzsXWxDyqsttcbqiVLDlvAb8utgURTeUdiWMv5q9TIiCHDcVjbICa2MsQgXsTcksh901mt0VzIfwAVV/diwZRK3X6CcPxXV9slllzNn7AGG64Xswjl4vfvz5TtvwLZFXmhBvlH49cre9zzJKJOS4gvwhK+v+XZ98RZCAcCujYUHW0lmPggjgdcUfUx7WTyPNUGCTsfNSmXyjpfpcDr6ZtpqkTYfFHFXjfioe6QHzrfXt0gBdEHXgWUnZzGhqQS4E/wn7xr4uZjKCBt5CPmgwQlsH1qhgZfacG7vwsy644IcXXoyIPVQIfpYqCUEnMgrz693xOwPvIZKg9SEwqn/KBXXcjqUvxJgpCAdi+ISfemaSHekIxfb3p4N0fxZ7CDpqtirSd1U3Uib5G7TdR2xFTimtPfwNdBaj0EvTW1iK5xXXFJw7lUHoZ2D6taRZ0GlyaemwDGUwW7LAthKowqcIpFmyrs11CUO0g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(316002)(38070700005)(52536014)(9686003)(4326008)(6506007)(2906002)(110136005)(86362001)(55016002)(7696005)(33656002)(8936002)(53546011)(66946007)(186003)(8676002)(38100700002)(122000001)(26005)(66476007)(83380400001)(5660300002)(71200400001)(66556008)(66446008)(64756008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1RzblUzamNZb2wweVJoSnRnMGVFTzVJODIzYzRUaktsZVFlUjlLYzJ3NVJ5?=
 =?utf-8?B?QlpPeDM5cEhmRzNxQVdLVzNScjF2bjJ5UlFjd3c4d293L3pibHNSK01rREQy?=
 =?utf-8?B?UWhCY2t6Wk5yQTdsbDRnUVFrU2pRUmpra0szNmRlWHJicjFlbGtLcU1RSGNO?=
 =?utf-8?B?amNnMlhlMHdPbmFKdTZKWm9EM24zK0lpT044bUppK3NmeDlhWmZ2L1QxZlAr?=
 =?utf-8?B?dkNjNytob1FYUXJRLzBPbmVETVhEOU5hVENFcVY5a3FGWjRqZi9HckttNUUz?=
 =?utf-8?B?NnlaVWV2ZzQyMXFDNkMyOG1valpSM0s0OTR5b0tJSkxvOUwybzdaS3kyTjZz?=
 =?utf-8?B?dU4yZlBwdS9NWTRiek9NNzhPaUw4SktrQk83blROaCtWUFVkaDNDbHZycXJi?=
 =?utf-8?B?YTdPVzlmT1Z2NUV5VmR2cXJ6ZTNuVERtZ3AyTktMMU1aQ294a3kzZWt2S0xH?=
 =?utf-8?B?M1NONmJ5R3ZiSTdsY2xnY3lxeVFEa1hsb2VtaDQ3VXlqRnJMZGw0SE4yQlRC?=
 =?utf-8?B?ZU5UQVYxOVVUallmV1REU2R1bzFXZENaQnhJUVVoY21YMHMwYnY1Z3BEZk12?=
 =?utf-8?B?T3ZabU1yd0lablNoRUtzaVJyQUdsb3VvYjI5Sk9obXFIU2NDYWpraWUxdyt2?=
 =?utf-8?B?V0FvTWZGNjhBL1lla2hsR2ZGOFU1c3BIU05zM21JUDFKbEdLZU5DQnNNTHov?=
 =?utf-8?B?TFkvNnFPanRlUXVnSDArQjhNL0FiUlg2SGZqaTNqa0VOdkdQZ3ViNUlWS3M3?=
 =?utf-8?B?a3lBWHlsa0E2MWc4eEdJcE5UbUZOcmdwRkNiN3hlK2tBQzM0VG14cVhHOVFN?=
 =?utf-8?B?bGNKQnB2VmhYdmljbmJWd0dnWUZYY013eUFmVGxWOTE5QXlCUkxKa0pyUEdM?=
 =?utf-8?B?OG5JVUVPMy9Ma0x5VGVhcCsvRndaSUVXWDZjbE52S3N3MEM0ZDgxNzNxK0FW?=
 =?utf-8?B?R1J3UVNDQUh2TzdyTlJPMFZYempXbmVHSEhDaXVlWGFRUTFJWlVWU0FWbXFT?=
 =?utf-8?B?TnoxdEVhR2ZzblQ1WFA0MVA2UTFibHV0Y3Bqcml5WG83THJ2Ymc0TUl3NGlG?=
 =?utf-8?B?aEpGQ2Z5M1V6ODVDU29GRi9mM3lCaU1JRjJXWTJTaDdvYU1DRlI1RHU1S3Mx?=
 =?utf-8?B?VnNZNTVOUStnbldGU3YwMDRXd3RpVzUvMjdXa29ZMjl3UjQvVDJJODdZSzBD?=
 =?utf-8?B?RDQ4Wnd0QytXZEZzRnNPZ1Eya295a2lXRE8za0JJNDNqeFRxVTBvcVZWU3Uv?=
 =?utf-8?B?bnRNUHFKRnoyQzdVakdROUp5ek1ZTTZkUVc3Njd3ckVqR0QrZW9ZSkJJTXFx?=
 =?utf-8?B?RGhFZEZDU2lGY3NtRHdmZWYzTTEzMlZ5RnhpOHRiUkxSWkdqamJGbE9BMTFW?=
 =?utf-8?B?bEZ0UmRRYkVvdFoxTnp1QU1RZlgvalVSam5xNUhoQkFpSmdYbFdxZU5NSXQ2?=
 =?utf-8?B?WlRxa2JhRUxIYjlKQ1ZUSnhyY2NiWDNiR0EzRWsyd3dseXc0TmxyOTd5RFl1?=
 =?utf-8?B?aUhsU1pXTDZDd3BsQmVqVll1WlF4WEFaYnlVWkdtSTVhQVZhNEJqTFJNN25j?=
 =?utf-8?B?VjNwL3cyU0I5U0xRdFRPUkhjYk9GdG5hK0hFR0tHTzlORjFVR0tCRGw0d243?=
 =?utf-8?B?aGloRzZmcGhsQlFWTlgzdDRUTXFkTGtEWTJ0d01ZYVEvaDZSNFlvb1RzME54?=
 =?utf-8?B?QXpzdko1K2ZVU1hnMFBFcXhKWlF6Y2l6bEZiUmRFbjVrWExpdXVoeHZieEly?=
 =?utf-8?Q?Pa52u/rgoVtLlTX/L5GPUcLclFMuFW+jA/GI7hs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4490
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	052aa74b-3fb4-4879-4304-08d969ca454c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	em+e90znvolwiwWzaaAMr4GvoJfZNi4ip+gdYWcJCtpT2rJUpoOkgxGwaIo2/1lN46OATLI0qrmC4hf82UarJx+zSc+i9YUmKJIOJ/dpBZcr8JuWZgHH3AE2q7h/G0Qjqkx2zVliVe4fpEpvVx7BmlO/tbiTgXCwBODrm+YFRHzaUv2lZTZU564/p3wxd7pNzxe0AsTfxgyu9x3ryUd2NI/7rDRQMjb/xz6psamK5RBXLM7nXQcYShv7zIKoe7X727R4Gb61kRxFZX6CgiIu2UfhOdDpEdRjPjRNFtdVkbBXUZyA+hTdcb2xnqC0yqc48bWQOAThECYEIAdiX1aiKFWdYsqdw9XOyegObkfBt15illiapsSuA6GIwDUE8ERNTBLDCRNEjKu0tOun72i/a3xW9MNvEmypiiZswLo4ZS9RT+F3gvW/DSxCYfe4iT3aaNwk/mSNn88xjwPj6M1AQ2uPdkZOH+fkwhhpXN/G0fjZxX/0+x9ptd+ugQ6naKtq6CydsyEGR57PFyuXgvyfY5XgnHGAT7fLu9P9cN+2f+W19UqjUbGJNsG0bYfwWapzUpioYJDyHKVFEOpnuM6HCGhxeEg6UX1FOmIljLcAVrVWgZGCygw+mMKSdN54UAjCBmjPa/SjX1ux4NDsscP45jrLebGwmgSW7H88Ce3XoVk2mvz8SH5kU5R5NIT9waNnYwraXJrQf1lsTcKY23GlIw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(46966006)(36840700001)(55016002)(83380400001)(47076005)(26005)(356005)(9686003)(36860700001)(33656002)(86362001)(336012)(52536014)(81166007)(53546011)(82310400003)(186003)(6506007)(82740400003)(110136005)(2906002)(70586007)(70206006)(7696005)(8936002)(5660300002)(316002)(478600001)(4326008)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 02:19:39.7910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41277c05-6372-400e-2716-08d969ca4a2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4016

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjfml6UgMjI6MjgN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzYvNDBdIHhlbi9hcm06IGtlZXAgZ3Vlc3Qgc3RpbGwg
YmUgTlVNQQ0KPiB1bndhcmUNCj4gDQo+IEhpIFdlaSwNCj4gDQo+IE9uIDExLzA4LzIwMjEgMTE6
MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFdlIGhhdmUgbm90IHdhbnRlZCB0byBtYWtlIFhlbiBn
dWVzdCBiZSBOVU1BIGF3YXJlIGluIHRoaXMgcGF0Y2gNCj4gPiBzZXJpZXMuDQo+IA0KPiBUaGUg
Y29uY2VwdCBvZiBwYXRjaCBzZXJpZXMgY2Vhc2VzIHRvIGV4aXN0IG9uY2Ugd2UgbWVyZ2UgdGhl
IGNvZGUuIFNvDQo+IGFib3V0IGhvdzoNCj4gDQo+ICJUaGUgTlVNQSBpbmZvcm1hdGlvbiBwcm92
aWRlZCBpbiB0aGUgaG9zdCBEZXZpY2UtVHJlZSBhcmUgb25seSBmb3IgWGVuLg0KPiBGb3IgZG9t
MCwgd2Ugd2FudCB0byBoaWRlIHRoZW0gYXMgdGhleSBtYXkgYmUgZGlmZmVyZW50IChmb3Igbm93
LCBkb20wDQo+IGlzIHN0aWxsIG5vdCBhd2FyZSBvZiBOVU1BIi4NCj4gDQoNClRoYW5rcywgSSB3
aWxsIGRvIGl0Lg0KDQo+ID4gU28gaW4gdGhpcyBwYXRjaCwgWGVuIHdpbGwgc2tpcCBOVU1BIGRp
c3RhbmNlIG1hdHJpeCBub2RlDQo+ID4gYW5kIHNraXAgdGhlIG51bWEtbm9kZS1pZCBwcm9wZXJ0
eSBpbiBDUFUgbm9kZSBhbmQgbWVtb3J5IG5vZGUsDQo+ID4gd2hlbiBYZW4gaXMgY3JlYXRpbmcg
Z3Vlc3QgZGV2aWNlIHRyZWUgYmluYXJ5Lg0KPiANCj4gVGhlIENQVSBhbmQgbWVtb3J5IG5vZGVz
IGFyZSByZWNyZWF0ZWQgZnJvbSBzY3JhdGNoIGZvciB0aGUgZG9tYWluLiBTbw0KPiB3ZSBhbHJl
YWR5IHNraXAgdGhlIHByb3BlcnR5IG51bWEtbm9kZS1pZC4gSG93ZXZlci4uLg0KPiANCj4gPiBT
aWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDYgKysrKysrDQo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+ID4gaW5kZXgg
Y2YzNDFmMzQ5Zi4uZTYyZmE3NjFiZCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gPiBA
QCAtNTg0LDYgKzU4NCwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9wcm9wZXJ0aWVzKHN0
cnVjdCBkb21haW4gKmQsDQo+IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+ID4gICAgICAg
ICAgICAgICAgICAgY29udGludWU7DQo+ID4gICAgICAgICAgIH0NCj4gPg0KPiA+ICsgICAgICAg
IC8qIEd1ZXN0IGlzIG51bWEgdW5hd2FyZSBpbiBjdXJyZW50IHN0YWdlICovDQo+ID4gKyAgICAg
ICAgaWYgKCBkdF9wcm9wZXJ0eV9uYW1lX2lzX2VxdWFsKHByb3AsICJudW1hLW5vZGUtaWQiKSAp
DQo+ID4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPiANCj4gLi4uIHlvdXIgY29kZSBpcyBkb2lu
ZyBtb3JlIHRoYW4gc2tpcHBpbmcgdGhlIHByb3BlcnR5IGZvciB0aGUgdHdvIG5vZGVzDQo+IHlv
dSBtZW50aW9ubmVkLiBDYW4gdGhlIHByb3BlcnR5IGV4aXN0cyBpbiBvdGhlciBub2Rlcz8NCg0K
U29tZSBkZXZpY2VzIGxpa2UgUENJZSBtYXkgaGF2ZSBudW1hLW5vZGUtaWQuIEluIHRoZSBmdXR1
cmUgbWF5YmUgbW9yZQ0KZGV2aWNlIGNhbiBoYXZlIE5VTUEgcHJvcGVydHkuDQoNCj4gDQo+ID4g
Kw0KPiA+ICAgICAgICAgICByZXMgPSBmZHRfcHJvcGVydHkoa2luZm8tPmZkdCwgcHJvcC0+bmFt
ZSwgcHJvcF9kYXRhLA0KPiBwcm9wX2xlbik7DQo+ID4NCj4gPiAgICAgICAgICAgaWYgKCByZXMg
KQ0KPiA+IEBAIC0xNDU0LDYgKzE0NTgsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfbm9k
ZShzdHJ1Y3QgZG9tYWluICpkLA0KPiBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPiA+ICAg
ICAgICAgICBEVF9NQVRDSF9UWVBFKCJtZW1vcnkiKSwNCj4gPiAgICAgICAgICAgLyogVGhlIG1l
bW9yeSBtYXBwZWQgdGltZXIgaXMgbm90IHN1cHBvcnRlZCBieSBYZW4uICovDQo+ID4gICAgICAg
ICAgIERUX01BVENIX0NPTVBBVElCTEUoImFybSxhcm12Ny10aW1lci1tZW0iKSwNCj4gPiArICAg
ICAgICAvKiBOdW1hIGluZm8gZG9lc24ndCBuZWVkIHRvIGJlIGV4cG9zZWQgdG8gRG9tYWluLTAg
Ki8NCj4gPiArICAgICAgICBEVF9NQVRDSF9DT01QQVRJQkxFKCJudW1hLWRpc3RhbmNlLW1hcC12
MSIpLA0KPiA+ICAgICAgICAgICB7IC8qIHNlbnRpbmVsICovIH0sDQo+ID4gICAgICAgfTsNCj4g
PiAgICAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCB0aW1lcl9tYXRjaGVz
W10gX19pbml0Y29uc3QgPQ0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4g
R3JhbGwNCg==

