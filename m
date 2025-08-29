Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BAEB3B33A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 08:18:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100580.1453939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ursRL-0004oH-M1; Fri, 29 Aug 2025 06:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100580.1453939; Fri, 29 Aug 2025 06:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ursRL-0004m1-JM; Fri, 29 Aug 2025 06:18:23 +0000
Received: by outflank-mailman (input) for mailman id 1100580;
 Fri, 29 Aug 2025 06:18:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psBU=3J=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ursRJ-0004lt-8b
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 06:18:21 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4ef1031-849f-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 08:18:19 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PA4PR03MB6733.eurprd03.prod.outlook.com (2603:10a6:102:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 06:18:16 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Fri, 29 Aug 2025
 06:18:16 +0000
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
X-Inumbo-ID: f4ef1031-849f-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAbbupIZnzM7SsLFHiqquIHkJJYAhq4GZLNLfMM9TsJO7vhJuLps3SR2EgqpwYvsc94wNdLJzdCFnge3uOMwYN05lB8xwJAiUlfnZyoijx9G4HIrIBogZg2mqSZuE27jAH8Id8Gp6JBhzs0KD5UiZJiYvAcsy5PyFba7ZQDirOzLlg1U7rRUP27le8i0S56PH3hhCukYKWFBJ58a3ajGJIaJdwvR5Vs5urrgsuKXE55/ge7/TPtkU1cSYCwBZ4WaCaIo3/xemyRde5DDx6bJ+OmBAZsoQj+SWYFFdT1kKjrCeNFUQQ5kGU+NQmrK3z1eq8D61/d44qg+dK/C2HiBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvAAQieeTnBYz2+lYycL7ANgGUaAnx6N6TaTbtEdqcE=;
 b=c2aHAQi8oY4VkJW7sHrhYPy5Pi7pULhZ0IJxmqhItQ3evTcHpIJUfd95UiMOWFXSDt067Au9bRCXG+YlBgCb82Qoc8YEkeNhXWVKy8+r9eFdDMAbNwdC1ts9iYtFSOZPpx5oPFQvdnKWJSB1OzL6zij401k3JcKOVi71ZCsJaej2s9LXllRRgJvQbpfypSNvKpUZ1WWASBho4/IeYTkZtBhXPMJIthTGhMAN26QekdIg1L2uSdU9pbN8ocBU1Iq3Sa+0BwUYOf4fCHRIoyLB71qoacO09419Hi/QZtXWjhd65oygkOqCGzxpyh3B6Qx4wGrkonppzVlU/zR9N7zCQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvAAQieeTnBYz2+lYycL7ANgGUaAnx6N6TaTbtEdqcE=;
 b=sfBBlHC2LDnmnn9yl4ep37khHZsoD56Ro48mAgleNzSbhanQCFS9zhd6QwSrQR6fbqt87Xu46JPN5RdOItJZ+v3q6pCUbzig/ppIBnLsl44xftshalnebFAYqZimKX1hiFN0cB8GdFJPH5N5NQ2fQShBid/fF8w+MN5M3w4xmnjEP1ffHORTtTHEZmrfjBmrssw8TDp9pwJnHmSug5IuxLTnVZXTn5BphD8xdwkmy9zzHZI9KsbtbwWj3AUPsRGJaU/zSUaxlHYVlwHj5H7K+qJTQSwi9vpT4lDR8C3Q3qiVHZFxbHoA/f8jW10g0NGZT3lktb/VHDUPTU4KWsVV0w==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: Re: [PATCH v6 1/4] xen/arm: add generic SCI subsystem
Thread-Topic: [PATCH v6 1/4] xen/arm: add generic SCI subsystem
Thread-Index: AQHcGDp0HddMWoIUiESW9wlppK7VcrR4ldUAgACTHQA=
Date: Fri, 29 Aug 2025 06:18:16 +0000
Message-ID: <7e9fac13-6c77-4180-9ca1-934746c616de@epam.com>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
 <ffe5a45efd34d92c9f2c7307ecd0e9efc5b0d57c.1756399156.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2508281431180.8757@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2508281431180.8757@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PA4PR03MB6733:EE_
x-ms-office365-filtering-correlation-id: bc2fb2e5-771d-4e94-bb86-08dde6c3d79e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U1VKem1zWGMrL0p2TWM3VmJ5OWpKRURpV0VLR0t1TFhzSmZ5TnVDRkUvYVBM?=
 =?utf-8?B?aGN0UzZDdG5tVThNMlk0aUx4UWlBdWdoV2F2SzN5Z0xrUmU1MEhNVXRvbVFy?=
 =?utf-8?B?aE1BRVBiYkg5dU5aZlJIUkxGSDV4MW1JdjdRTDQvNUlEZFZ4TFJ3ZzRlR3VG?=
 =?utf-8?B?dVRjS3lUdUFjVGZ6WHVBZ08vUy90VUpkVGJUYTBRN1o1ZkpWWHV1WEZHVTFs?=
 =?utf-8?B?UDBSL1IzcXQrdStRK29lMzNpTFhmZVFuZ1hWR3Q0cjhXeXNkWmQ5ang1bFFY?=
 =?utf-8?B?andkc0NJWHNsYytzN25xaHpxenk0cXpLY1RTcGNmRWt5QkJRTHJNY3ZzbjVX?=
 =?utf-8?B?eTkvT0pKdHoxZVkvM1VaNXI3amYzZklOQXRKcDZyb1cyb05yVHJIQ2NwdFhS?=
 =?utf-8?B?eE9BVXNxU0ZvSW03bE1HczIvR0hvM010ckNXZTEyZEZuZHBXRlVIQzJnU3Rv?=
 =?utf-8?B?cmIvT004d0xXOGxsSm50UWQxVFNNclY0TlVmOGtJd1VocjdGNllRaTVlN21s?=
 =?utf-8?B?WGZTSEZZMTFneCs3M2FYZmIyUWJMUUQ5L3V0TTI5enlFMzVOZURhM3JESFNJ?=
 =?utf-8?B?UEdHNWJFYk5sMXdnODNHU2V0QlE3dXhFQ1hsMFpGVzZRZ1RhM3Q2L3VPeTkw?=
 =?utf-8?B?OVZiTjZnTXBXYXdLMVFMakpWcGl6bzliaFRST1BTbDY1T0NES2pZc0xraU1D?=
 =?utf-8?B?TlM1RnUrNnVvVE9salVVcDZrdG96YTdEdzAyKzBHTTIzQzduSmVLZzF4VEhs?=
 =?utf-8?B?cXpSZUZlanFOeHNBV2VEc3JleTRYdUxyMFJ4OERFalljc3JmVUZTOVZ2QVlM?=
 =?utf-8?B?dVQ2bGdSdjlaVEorZ1I1RkVJbldOczB0S1lLOVMweXFpWTAzZ3oxQnZJakdm?=
 =?utf-8?B?UnpwalZEQ0JVS2Z2bFpqaDNXVFp4elRHaks5cGFCMUJLVUhITjUyT3VMa2th?=
 =?utf-8?B?dStnejBOaFRqY0lCN3IrSUp4ZGNxcUJlNXhDMzh4ZjE5aDFvUXZCblBTdktm?=
 =?utf-8?B?b1pTd096VWdBdkF5MVhrWE1Ba0pDMzNWcWtwSEhaSGpDNEpObUxCRWZaK2lu?=
 =?utf-8?B?WDV3RWV4Tzdqd242bTN1dm55bUYyRlZrT0g3K25RWnpaRkJhcHdIQWVEemJP?=
 =?utf-8?B?ZUp6Y0ZORExHQ3BhbkEzd2k0NUhKZVhHallwYmpXWm5EZFhMano1N2pHcHV0?=
 =?utf-8?B?VmVDV0U5UlJ4ZjZudjJGSGx0dmRSZnVHdjUrOElHS0NuMmcramttdXhrelo1?=
 =?utf-8?B?TlRDNDJMTktyWU01L2tjYzFMUHArQys4NEg1Z1Y1LzkxN2N3b3pmckxySXpv?=
 =?utf-8?B?eHVZb2drbWJEZTFlWkRSeEVhREZEdkVISmc0Z0ZqYXM2WXF0eFFQTHRBaS95?=
 =?utf-8?B?ZTVWZjFmUS9ZWlNoTy9UdlE1aERNK1puZlRjTERrRDFDSW9MZEU5M2NFQkI2?=
 =?utf-8?B?Zklkb1JPTzIwS2dxa3JQb21TSXAzV00zNWRtQ1JkUEwxVXFqMlFVTkQyalhZ?=
 =?utf-8?B?UlRua2tob2xsaVRBM0N3eWZSNGU3M3hlenhUU3hMdDVlM2NLS3BCaFJ4Z1c4?=
 =?utf-8?B?eWxxRWM4TkxqcHlYWGw5R2dJZFphZ1dBeFdlZ3JKL2hZRUdqOUFDTnZQSWhL?=
 =?utf-8?B?aENiM2NKeDdtMFhab3RnelZXMTFRM1BhYnNPVGw3cU8vSHNrdlBIVXFScEMv?=
 =?utf-8?B?WGZoS0hFVHhrenZtbFJqemtEdnNpMGI5MUNUV1VGMlVQWHdSOWw1TU9qOEdV?=
 =?utf-8?B?eGphVE91S0VOWVF6VG05eGtxWURuRDcrTWU2citSS2U2T3BBeDN0OTZLVVFG?=
 =?utf-8?B?all4UkNJL21rdTg0ZmsyY2JteG5vTjIwd2lDeVFvcnBZY1FMMVVFZGcxM2Vu?=
 =?utf-8?B?UXZGaFd6Q1JQWmVyckoxdXU4ZzFNWnNIdHVwc24xbFlKYzY0U284UnZ1K3J2?=
 =?utf-8?B?RXBIZ2FPaUs0ZnNkM080RFdDTC9LeVpUOFBET0FnVi8zcUcvTzA0NE5oVDFS?=
 =?utf-8?B?K0JvZWY0QWlBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzZjRG1ieDY3aDIyVTd0Vnpqd2NtdmNsY1NteUkyUHhzRDNJMmJmek1Pc1do?=
 =?utf-8?B?RFc3a1piQUdjNUNzTElNeVlNUW1DdjhQaWkxZS9MSldCcXY3YmtRaFEwVU45?=
 =?utf-8?B?VTFXME1HZmpVeEZhSHVXQ3dpaEhBMUFGN2hrK0ZGaFBVdnliQkFVaERnSUE0?=
 =?utf-8?B?Tkg1dFptTmJjV1FzbE4zYlA1MWIvTEt1N2JIWkhrTmUzYlk4Y09RSU1KOWZL?=
 =?utf-8?B?cjF4VmgwaWJFb21SOFBDZGZHUkx6b2V6TTdvRmIrSUF0MWxJdjZsTWcxbVpR?=
 =?utf-8?B?cFlwZm8rUVFrVUlQMlE4eVJPdVVHbDVtSUV4NlRaUFJLVnRVYzUxK2NsVGFa?=
 =?utf-8?B?ZE4xWUprcTFPZ0VDb0RJYXl2bnpORkxWSFVhQ05JdHY1Z04xVitzTkU2ZEpm?=
 =?utf-8?B?ZG02YWZxaTVYRWhkV2FSQm9nODJxbktkSlN5Y1JNa3Z1L2x6ZHZTSHFOMnZ3?=
 =?utf-8?B?QmR4TnZFbXY1K3VxazY4WHRBRGE5OGRjMmh0NnhlSTlJU0hTajRZVHFNNlBq?=
 =?utf-8?B?UUlJTW1xdTB3OEZHSzY0eEo4ZHZKSDNxMUJ6bnNQRmgvVHpqT0RXMk9WNjJz?=
 =?utf-8?B?Rk92T200NFVnc3dWTmVxU2RtNTBmYmxjZXF1K3JlQWVGWG1iQjVmUnh4a1Er?=
 =?utf-8?B?aWFaRHdVWVZLQ1IvZVBwd2cwL3A3M1BqbVVrRTZsM2txZlZaNzZSbGRYOVhz?=
 =?utf-8?B?dDF1eFZrSkVYRitvbStmK0RaTTF5ZFdmMVRxZWRwNksrbVc2NXRLNDlyNlBo?=
 =?utf-8?B?eVhqOXF5OFJaMHZHSzdUUGxwN0pZajBjZy9SZEZ0NmVzalpTS3hoaCtQNnV5?=
 =?utf-8?B?eUFLblZoSE1rZWJjUWtEQSt5Q2lXYytrdnhjN0RubHJlMWxZeDg0Qk1OckZN?=
 =?utf-8?B?NTdOK3RaQlhtenhaOTMyVVVNZGU5VkVqbHJKKys3bUdFMWc1d2xwTnpWSmUy?=
 =?utf-8?B?Uk85NnhrOVFtYmxQSXQrUUYxYll3SGxjaG1oRkhTNmhzTHdVdWo1N1owb3VZ?=
 =?utf-8?B?UUpXenlBRjgxOGZIS3Y2TkpBWlB5ZnhkOCtST3VlbkJEc2VmL254THd0Uk1Y?=
 =?utf-8?B?WnVtZkR1TWsvUmtVRXpsMGE2STVPcGY4Tk42aGJWQ0p2WkNvdUIwaGZ3L0Yr?=
 =?utf-8?B?aUxsOU15RnIxOHFzeVd2TkthcEt1dUcrU1NlL0F5YnhGOXRqRURLdEZ6M1M0?=
 =?utf-8?B?NUlTeWMzTDY5WG05Z2pCcmlqNm5zUGFWUStSSzQybit2cDNJekhCZmVuTkZJ?=
 =?utf-8?B?TFc3dG56UTBlbjI3eXYxNjBOYVV2MDRvRGdzV2h2Q0RKU1c0aTZRaG9oMmk0?=
 =?utf-8?B?eWE1K0xuSVh6bEoyWjRYaXdQbHhocDB6T3pCUGVIMHJrL2ExRTRwVVg3UzJK?=
 =?utf-8?B?SHRNemtBWkkzQmdsc1ZMZzhRWlJhVTRhNGNZMFRlRTI3a0haaC9MNjlhcld3?=
 =?utf-8?B?Y1d6djRWZUF6aEdtNXA1S0s4M1RYZXRXTGlORnVjd1I5bFVaekF4Vy9rSUpN?=
 =?utf-8?B?amVWb1dzemI1OUdrOFRzQTBMQ2I2YnplNGxxaGE1MzRiWHlZc2ZRbEhCSyto?=
 =?utf-8?B?VWM1ZEVESHRTckxpV015OUVnTmRwT3dCbkU4ZVRJREw4YklEd3RJNGtMWXVn?=
 =?utf-8?B?dWxxOUI0S0ZndllhZkc4Y1Nqek41bythOGh1QmVySE0yVEtJOXRpYUZaV3Fv?=
 =?utf-8?B?ODBNOVZRVktrcE5YR2JqY3lJb2FKcXF4QUtwN0wvNkpsSGxlZzR5SVcvSnNZ?=
 =?utf-8?B?VUh1YitnQk5lTUN5WUVQZjJzL3V6T21xaVJiaWt0ejczSFFJNGMrSE1GQWs4?=
 =?utf-8?B?MVpPZlRUMWwyc3VYZ2lCWmtDQUJ3K1NXYlJKMFd2dFRzcFNRempVYWpVdCtJ?=
 =?utf-8?B?b1dlaFQwOUxhN2NIREFpUHJndWlZS2JVQzlqRHF6SnFwK0lxUTJUa2hMRC9h?=
 =?utf-8?B?Y0NYVmV5NG9Td0Y0ODVuUXdOSW1JdVQ2UVlabnAzaHhqOHZyOXJ4bG9YVGE1?=
 =?utf-8?B?azdtWXZBcThPVkFQQ0FjTmk1R0g5WmxnS212blJxNWhVTU9MdzZ6cTdKak5H?=
 =?utf-8?B?c0MyemViNkdYbWJWcUJ0Nk1zSDc4NWoyUlY2ZEFndmpsa2pvWHQ2MGxiVUVB?=
 =?utf-8?B?T2RkTFAvcGd1N09ha0NkRTRxekZBcWlTSmxWMzh4WWRWRXRENGFNL01sOFhE?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <73F629295E534547A0F8F2E97BA2763B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2fb2e5-771d-4e94-bb86-08dde6c3d79e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 06:18:16.6463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o6B4CxsBgNPqD1DhcPlZ1a2Ah7Hgh9w88qmhKpI1+JiZ4Q7pQHhYpfaru6Bf3SKkM3BVbPS/VYujCTiORf75B/rpl3VT7VbcDmkhT53EgGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6733

DQoNCk9uIDI5LzA4LzIwMjUgMDA6MzEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
VGh1LCAyOCBBdWcgMjAyNSwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBUaGlzIHBhdGNo
IGFkZHMgdGhlIGJhc2ljIGZyYW1ld29yayBmb3IgQVJNIFNDSSBtZWRpYXRvci4gU0NJIGlzIFN5
c3RlbQ0KPj4gQ29udHJvbCBJbnRlcmZhY2UsIHdoaWNoIGlzIGRlc2lnbmVkIHRvIHJlZGlyZWN0
IHJlcXVlc3RzIGZyb20gdGhlIERvbWFpbnMNCj4+IHRvIEFSTSBzcGVjaWZpYyBGaXJtd2FyZSAo
Zm9yIGV4YW1wbGUgU0NNSSkuIFRoaXMgd2lsbCBhbGxvdyB0aGUgZGV2aWNlcywNCj4+IHBhc3Nl
ZC10aHJvdWdoIHRvIHRoZSBkaWZmZXJlbnQgRG9tYWlucywgdG8gYWNjZXNzIHRvIHRoZSBTeXN0
ZW0gcmVzb3VyY2VzDQo+PiAoc3VjaCBhcyBjbG9ja3MvcmVzZXRzIGV0YykgYnkgc2VuZGluZyBy
ZXF1ZXN0cyB0byB0aGUgZmlybXdhcmUuDQo+Pg0KPj4gQVJNIFNDSSBzdWJzeXN0ZW0gYWxsb3dz
IHRvIGltcGxlbWVudCBkaWZmZXJlbnQgU0NJIGRyaXZlcnMgdG8gaGFuZGxlDQo+PiBzcGVjaWZp
YyBBUk0gZmlybXdhcmUgaW50ZXJmYWNlcyAobGlrZSBBUk0gU0NNSSkgYW5kIG1lZGlhdGUgcmVx
dWVzdHMNCj4+IC1iZXR3ZWVuIHRoZSBEb21haW5zIGFuZCB0aGUgRmlybXdhcmUuIEFsc28gaXQg
YWxsb3dzIFNDSSBkcml2ZXJzIHRvIHBlcmZvcm0NCj4+IHByb3BlciBhY3Rpb24gZHVyaW5nIERv
bWFpbiBjcmVhdGlvbi9kZXN0cnVjdGlvbiB3aGljaCBpcyB2aXRhbCBmb3INCj4+IGhhbmRsaW5n
IHVzZSBjYXNlcyBsaWtlIERvbWFpbiByZWJvb3QuDQo+Pg0KPj4gVGhpcyBwYXRjaCBpbnRyb2R1
Y2VzIG5ldyBERVZJQ0VfRklSTVdBUkUgZGV2aWNlIHN1YmNsYXNzIGZvciBwcm9iaW5nIFNDSQ0K
Pj4gZHJpdmVycyBiYXNpbmcgb24gZGV2aWNlIHRyZWUsIFNDSSBkcml2ZXJzIHJlZ2lzdGVyIGl0
c2VsZiB3aXRoDQo+PiBEVF9ERVZJQ0VfU1RBUlQvRU5EIG1hY3JvLiBPbiBpbml0IC0gdGhlIFND
SSBkcml2ZXJzIHNob3VsZCByZWdpc3RlciBpdHMNCj4+IFNDSSBvcHMgd2l0aCBzY2lfcmVnaXN0
ZXIoKS4gT25seSBvbmUgU0NJIGRyaXZlciBjYW4gYmUgc3VwcG9ydGVkLg0KPj4NCj4+IEF0IHJ1
bi10aW1lLCB0aGUgZm9sbG93aW5nIFNDSSBBUEkgY2FsbHMgYXJlIGludHJvZHVjZWQ6DQo+Pg0K
Pj4gLSBzY2lfZG9tYWluX3Nhbml0aXNlX2NvbmZpZygpIGNhbGxlZCBmcm9tIGFyY2hfc2FuaXRp
c2VfZG9tYWluX2NvbmZpZygpDQo+PiAtIHNjaV9kb21haW5faW5pdCgpIGNhbGxlZCBmcm9tIGFy
Y2hfZG9tYWluX2NyZWF0ZSgpDQo+PiAtIHNjaV9yZWxpbnF1aXNoX3Jlc291cmNlcygpIGNhbGxl
ZCBmcm9tIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpDQo+PiAtIHNjaV9kb21haW5fZGVz
dHJveSgpIGNhbGxlZCBmcm9tIGFyY2hfZG9tYWluX2Rlc3Ryb3koKQ0KPj4gLSBzY2lfaGFuZGxl
X2NhbGwoKSBjYWxsZWQgZnJvbSB2c21jY2NfaGFuZGxlX2NhbGwoKQ0KPj4gLSBzY2lfZHRfaGFu
ZGxlX25vZGUoKQ0KPj4gLSBzY2lfZHRfZmluYWxpemUoKSBjYWxsZWQgZnJvbSBoYW5kbGVfbm9k
ZSgpIChEb20wIERUKQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgTW9pc2llaWV2IDxv
bGVrc2lpX21vaXNpZWlldkBlcGFtLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEdyeWdvcmlpIFN0
cmFzaGtvIDxncnlnb3JpaV9zdHJhc2hrb0BlcGFtLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IEkganVzdCB3YW50IHRv
IHNheSB0aGF0IFItYiBmcm9tIG1lIGlzIE9LDQpPaCBzb3JyeS4gTXkgYmFkLg==

