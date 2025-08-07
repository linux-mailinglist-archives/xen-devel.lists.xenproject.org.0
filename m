Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFECB1DA76
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 16:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073191.1436107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk25G-00029l-30; Thu, 07 Aug 2025 14:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073191.1436107; Thu, 07 Aug 2025 14:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk25F-00026w-Va; Thu, 07 Aug 2025 14:59:09 +0000
Received: by outflank-mailman (input) for mailman id 1073191;
 Thu, 07 Aug 2025 14:59:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=70fD=2T=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uk25E-00026q-CO
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 14:59:08 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ea88ede-739f-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 16:59:03 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB8668.eurprd03.prod.outlook.com (2603:10a6:20b:54e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 14:59:00 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 14:58:59 +0000
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
X-Inumbo-ID: 0ea88ede-739f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMjEMDA3nj9lfS3CtInxyLriqAHZcAi5GZ29N2tMyHkrVO4Ikj2aR0onaTHTJPWVRSFB5PNDaI66mqcsrVJ7SkEPxGsCHq0Ri5y1bKVwvnbNpZmo5gGlMrmyZFbTUAQmtVL9gdHMuP4/9enZjmxO4Fe4s3MetZ8JASO0xIBny1VEAzHq39JyHyf+ce/akgNERL8vwFtudZDLxuKk+b88MAY+lqA8oEAJQof/fFT0fKybut8IUPWr5CQsurnIFH0OcMdZB7y1eJVJCrum1WWKGPtptg1Z/SpFPNXajKhvwJSelX6ojCZfX8idTMXgP/KhxyaM2EyAT2FRSkVG+nOwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3SU5CPTAltdBkkfm+p76xkgQPRGikYDXGhCajOmHqY=;
 b=DdkpnW/gpxBLSDkVzVbgD2OQlbZy3fuKEnJjuRRlSlIXTwPFGpdAY5BFqPkr6+b4z7bZVEGPC3sDogCaHd1Nuo6xzE/MQfWUHlZ0HFyfEpQJleOvHZ+Dd/2zn5jVdstkr96118dSFQNDPEzJErn12sP0uYH1pxy9mfnmYh1lL+6GhYBeWE7SrCxuc13XHzUSBdljSi8CPTWRqWlKXSjnzPWf56r0VCxZiPnCaZIQeSulSWYO8zMdDqPA/1ApPOY6A+Vi0FfDxRsusSjG/CggUBuyrBhzHrfKNIqE2bYV6OHko8ALiDyxV221C2zPl3GxgWqQiE6wSP3MWpjxim9bWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3SU5CPTAltdBkkfm+p76xkgQPRGikYDXGhCajOmHqY=;
 b=erkpgxlWeAWqMtqGtmOlXnVb5qSCWC1rHlvvb2H/am/5jhRJMsKBDlQFo7oEpqGIgg0VlPoyje0MA00zkeiJ9OAXooohz7/kVaJJMmwTmDN8KEaoVsikON82LPvsCL6PtXBUu1uDYa9E9w5yexndsa2dkCIGSoNvxstCPhmHCxwT1sp907/ElSuWstVQDp/YxoQYHatSyXtul45YlkLuaTPm32mdT7YOQZ8UdKbHrVDXMLTcRpW5BsPSq4pAvElrrkBOTE9ppARydj5ldlUoj3org0xvOm8YAi3lY+yLIOfnBzUyJQyJ6otIVqb6Ru/MsZMXuQj6AcP/zPI5E8gZXA==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: ", Ayan Kumar Halder" <ayan.kumar.halder@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Juergen Gross <jgross@suse.com>, Teddy Astie
	<teddy.astie@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Luca
 Fancellu <luca.fancellu@arm.com>, "Jason Andryuk," <jason.andryuk@amd.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>, Sergii Dmytruk
	<sergii.dmytruk@3mdeb.com>, "Penny Zheng," <Penny.Zheng@amd.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpLA==?=
	<marmarek@invisiblethingslab.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, "dmkhn@proton.me"
	<dmkhn@proton.me>, Mykola Kvach <xakep.amatop@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Grygorii Strashko <gragst.linux@gmail.com>,
	Alejandro Vallejo <agarciav@amd.com>, "committers@xenproject.org"
	<committers@xenproject.org>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: Xen 4.21 Development Update [June-July]
Thread-Topic: Xen 4.21 Development Update [June-July]
Thread-Index: AQHcBjWKnvMog0osvESC+B1KCmpb8bRXSw+A
Date: Thu, 7 Aug 2025 14:58:59 +0000
Message-ID: <37b648ff-7c11-4505-aa27-ea44d84ba88e@epam.com>
References: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
In-Reply-To: <ae2c2e35-72df-40ed-bffe-391f3c11b826@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB8668:EE_
x-ms-office365-filtering-correlation-id: 23db6af2-1f83-4087-720c-08ddd5c2f0d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|13003099007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NkxMUWloUGxHZW92Sm0xak41VGRXQTRYNUI1NEUzRGNXZnc0NnZYclZ5ZkU3?=
 =?utf-8?B?NXhuUTc1b0FNdnNMMEl4dkZPTTBJUTZFaE9oSkd4MVdMd3dGWlhFWXZ5WmFK?=
 =?utf-8?B?NkI5cDR2d0ViMlEwWmJjUkxPU2ZlVm5hb2xtYTdqVURMZXlGakJvdnNwTmFT?=
 =?utf-8?B?UEFJYTNtLzdRcVcxY0JaRTc0UDRXanhUV2ZSMDlueCtyc28wSEQ2Y0xLaDJu?=
 =?utf-8?B?ZXB1MTY1NWdoL09DbzRjeDlzelJac2k2SGZVUUpRWGVVRTltN1FaOWNYZE1m?=
 =?utf-8?B?RXJoY0R5YlNhbHlwdVJ5cWcvdlN3dmpRY0d4S2NJQ3cxc1NnM1VtQWh2QlJy?=
 =?utf-8?B?Z0NXQkRRUHE0YXNYdkdrVm56S1Q4SlNUNDBxajN4QzZVdnRzajBlOEJwYXVR?=
 =?utf-8?B?TmkreG9JVE04SUZKZ1VIaXd0aXRRRlZ6SE5WYk1BNVBWcEtyUHhpNXl4MXF2?=
 =?utf-8?B?d0FGSmIzRmYzeHNoMFdjMEJsOXI3KzB2MUtzVTVPb3NPWFRQbVNjdVVrYWZW?=
 =?utf-8?B?TUhoWlc2Ykd4bisvSDFwMHo4em1jRXJtMEh1YTRuVW5EWURuLzdUNXFWc1B5?=
 =?utf-8?B?Tkpxcms5ZXdNbTcwb3NyUVhLeUtNOFJEL2NRVEU1cTdySy9XNU1HMlQ1L1c1?=
 =?utf-8?B?RCtOanpiWXNuOFpSNjBWQm10VDBCVnF4dHFzdk82blp2UVRjanRFMWloYVlq?=
 =?utf-8?B?WEloR0VCODVzRThkd2ZaRWNOZy8xci9Cc1ZCcjlUZCtWZFlSUCtpa3J5YVhO?=
 =?utf-8?B?MXZBOTExdHUzbUs2V2ZrcDFaYnpZRE9KY2hDNHVja3BKVkZKZzlsQ2g5bThJ?=
 =?utf-8?B?cmt2cnJVL0Iwd21YckwxYXNGY2RIa3U5YXhweWIxaGw4UjdTSlc2Wk5Eam9S?=
 =?utf-8?B?VnRkVDJXdVdDSFVwZC85WnVtYnloV21tbGlYVEFwRmFSZU4xR2R5QnBuTFFS?=
 =?utf-8?B?cHgzUzY2Y2FNUVc3L2xGcU5xdlIvTVNGWWNwclRwWW9BQkpjNm9OczhsVy9n?=
 =?utf-8?B?KzV0dHE2bUNYTGJQZ1ZaRkR5UEFDTUVRdXg0cFJJTTNoT0FKdWgyL3Vwak14?=
 =?utf-8?B?YVNiOXVyZDN6ZzBwQy91V3BYeDRYNUwzY21tUHQzOUpGT09RNWNJYStUaC93?=
 =?utf-8?B?Uk9nNFBaenJFOWhheTZJbC9VSVBLWktnRjVxMkt0RHhKNXdVSm1KK25oeERO?=
 =?utf-8?B?enY2QU41L2dHZU9qNFBVZVJLRWR5TGN3MTFQS1Q3KzUzSElTaDVzUlpva3Fn?=
 =?utf-8?B?VStFTmxQWmYwL3M4Z09KN2o1blU1VS9FNHNXa3VoQXR2YkhzUkJDQjR2ZjFO?=
 =?utf-8?B?YnBXczlXODJEcmNwa1U1V1FMSmh6MzNmNWNxWHYxc0VOK28yRnRQZDJnK0ZL?=
 =?utf-8?B?a3BuSHNzUHpmRXRUT0xsRDlYS3daZ3BzQmV4QmNkcThFWWwrWCtXZEs1bWd5?=
 =?utf-8?B?ZWRsamUzd2pNMGk0TGtoUTY0c1k4YUxiVFVBa2hUbVZncFFDby9GLzh3Y0tU?=
 =?utf-8?B?eXZKdmEvNjdhT1RGQ3hoK2dKbFYyQldiVHArZlNrR2xmY0owVzQvay9aWVJz?=
 =?utf-8?B?QW1adUIyNldrbzZjbGlOc2RRZXpxOXFieWJ5L0srSzlTbVJ1SlpFMmVibWE3?=
 =?utf-8?B?SU5aeUhzcElVZHgwa2tVWGFQb2dwR0Z5WUJac01DYjJ5UFArZ1pUNE5OM0Ri?=
 =?utf-8?B?R2xTRkx2ejNpM1ZMS0IrcmNDdzFzOFNWZFc1Wk5YZlJLVnhJRzV4Y3dJcDFY?=
 =?utf-8?B?NmdoeDZnU2ovTWt1eDNPZTI5ZmRaeWU2UDQydy91OEpxa0ZIRTBNV2dUUGhx?=
 =?utf-8?B?azFRY2lYNkxkY3FtVURaN0xIS2twdVlNdkJwUzdUeXl6V0doeW9pRlNWQWVa?=
 =?utf-8?B?dCtWS3VhenhxR2ZleDk5MjFkQzJTdmM5anNYVDF2TnJTY3kzQng3YWl0bnJ4?=
 =?utf-8?Q?62HgeFWU90Q=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWVaK0RzNGZucVA1eUFiTURBaGZ2aFhoSElpYUlrTTNld2dVWUFDbDFpSHdV?=
 =?utf-8?B?NWpPU0dUKzRIbDQ1SWsrUVZvWXVHUmQ1OHdnNnR3TEJXak43Ym5jQ0dMT3Rz?=
 =?utf-8?B?TFhCeGNESTNSWS9leVJzdVZPMWg2OWNrT1FKZG4zcFdobVZ3ZXJ1QnYyOE1Y?=
 =?utf-8?B?R2FKbjYyaEpYUFhmY2FQeVFiRC9mYURRWTEvZjg4TkNnckFyMzdTN1FNamtM?=
 =?utf-8?B?bGEyeEdEYWQzbWVlR2doUnJCK29PSzNKN1FvMkJVWG5ENU5MZTJRZnRsQ0tH?=
 =?utf-8?B?SUsxMnRjNVJYL2VJZ0xhTjhrSjZ6SVRFY0VhMVV1WHhubkR1S3dCUVNta090?=
 =?utf-8?B?Qmo0a0VHWkhmZjFNZlZZU2lwa3dDR2NCSFJzQnZLZlp4WDhESmduRUdORjdR?=
 =?utf-8?B?S25GUXBOSlJhQUg5OTZYWGNHNmpFOCtSUUJ1NHV1WmJjNmJGYUF0OW5mYUk3?=
 =?utf-8?B?M20vT0xhS1Nqc0YyZHNsbWJDUHVmN3p2eGpjZlZFeEZvUWdkaFVsQlZKQ2p3?=
 =?utf-8?B?ekNObHVyUFlSa21rMmFpMDY3YXVrZ3VNYTFDQkFHcE1kRW0zbjkzeDBaZmd4?=
 =?utf-8?B?b0luQUZ6U1NWdy9EU1E5VnBaMGlNOGZHekQ1c1c2QnlBYXFqbEhkZ3FURG55?=
 =?utf-8?B?UkhDY2RLYjc4Smp0YUQvNlVrNTdadmxLZzNjY1FxM3dIbXR5dVM2d01zcFd3?=
 =?utf-8?B?dWxJdWxUa1JKZmRabHA4WGZ4dTQ5TzF6MEtSQkZQUXdHOUpPbnVIRnlNYWxh?=
 =?utf-8?B?TlpKQ3g1MzFWa2ZTby9LYWdsK0lMZWk2dUd3TEFXd0pFVnhpQlRubmRTdXlG?=
 =?utf-8?B?NTUwbzQ3N2d3cVVJQnIyVS9YTDNUeGtWZ2QrYSt1RG1IK2FhV0hrNGZTNW9D?=
 =?utf-8?B?NU5mWjB1QlFmSUtDRXFFbUZWTnJDZHY2Sm55N2M0Y1M5eDRpNVg1YUYrR20x?=
 =?utf-8?B?Q1A5M2wveHVvSTFNUnA5bncxUjJET2hJS0lMNjEwRGxCRGpmRXJiK0pDTGlQ?=
 =?utf-8?B?c295YktyK0w0ZTdVRCtnN0xjM21TRU1sN2paRUIwN0h4RVU5QWdVVEY0RFVE?=
 =?utf-8?B?WmNtNEM5aVRUby9UWWdGM2Y3d3cyQnhCNkJpVXErcWtVdVRPdjUxTkVYbkJ5?=
 =?utf-8?B?eFNZcEJUNFZGRllWQWFjOUhNMFFxUzd5QU9tcTFGWWJLMkNQS0ZMd2crekpr?=
 =?utf-8?B?eE4yeGJqdGNQTnFSU290K2RpbmZsZTdYalNGOW51SDZsUUsrSVdodmxPWUlw?=
 =?utf-8?B?MDFwOUxoQWVDQmNwSm5FRCsrZVpwM3ZyU3BDeXAwbkcxbWhsOW85Zmx5dWRL?=
 =?utf-8?B?Z005OXg1dHRHMGJnbWo4MC9YcWphN0E3TkNLY0d3UUtiOFNNdWtwTU84Q05m?=
 =?utf-8?B?YTVDejFxamlTVEY3bXYzUlJ3aTRtZVFrNC9hN1NOU1M0SzRhNFRZSE5RMWNx?=
 =?utf-8?B?TjNtc0k2bGxHZUJtemlZcDBBUUFoa2FwdTBxWW9Vb3Q0WERqSmxUZEZSaFQ3?=
 =?utf-8?B?eUFiblNqbmZ1dzdubEk0VGNSNVk5YndFWld6a0swaEZ1UDFjM2dOUk11RmJn?=
 =?utf-8?B?UExVUnc5Rkt1bGFVdXRtRVpWSjdYSVNDNW01NnZLaVdQWml6ZUk3dUlBZC9K?=
 =?utf-8?B?UFdDUjdGSVdnU3BKU0VUZkZOejlvUUR1aDFRT1F3ODJoeGgrOWJNMUJmQWJq?=
 =?utf-8?B?STJYOWlJaVZIYktzT2FOM29hRC8zMFNxTUFnUURia1pMTHZ1cTF5Ukk4T1gw?=
 =?utf-8?B?WFhTMDNZK09IdWhvVUNRV013UFpJVllGNDFMdGRYT1c2R1VwMFZLQU53Mzho?=
 =?utf-8?B?M2ZTN2doT3JSUU5nWmNiT0p3cXYxYzY3RXN5N2pWWTg4QWo5bFRnU0xIZG80?=
 =?utf-8?B?a0E3c0ZmUGRFT3dUR1VESXVXM1hCNHA1NzBBYkk5bVNIVjk0MTBhZjR2U2hV?=
 =?utf-8?B?VnhIemRLV2FkVDk5Rk5PK1plNHltTXNWL3R3SXE3N2I5TVlOaXNqQ2Y5UTVO?=
 =?utf-8?B?VmVOdk9MY0FSTGZ0eDQ0WEczL05VRHlZbENyZVU0UXpweXNRaXJQNytNUkZP?=
 =?utf-8?B?UHRPWlNYSlRFU0lZVEVDNFNEOVpDMERweWpHOHVJWW9ZZlNRc0Z5ckFEOEZ2?=
 =?utf-8?B?YXBHK0xOUWRrNnhCcVAwZU1obXREQk5LWXFOM2dCRVhzSXRQRnp3eE1aeUM2?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A72A51F78EAAD648944B90CB9FBDBA42@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23db6af2-1f83-4087-720c-08ddd5c2f0d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 14:58:59.6620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ucg4uFGtgdi7Onc1DwOZBWBOgKS2ddek+TFuIgkhBTdfH7iDWVh5DtV25qEenGgoZwQJhaBfsYu2/I/KNluwtQFweIjH5WoXYM5i+c5j2G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8668

DQoNCk9uIDA1LzA4LzIwMjUgMjE6MTksIE9sZWtzaWkgS3Vyb2Noa28gd3JvdGU6DQo+IEhlbGxv
IGV2ZXJ5b25lLA0KPg0KPiBUaGlzIGVtYWlsIG9ubHkgdHJhY2tzIGJpZyBpdGVtcyBmb3IgeGVu
LmdpdCB0cmVlLiBQbGVhc2UgcmVwbHkgZm9yDQo+IGl0ZW1zIHlvdQ0KPiB3b3VsZCBsaWtlIHRv
IHNlZSBpbiA0LjIxIHNvIHRoYXQgcGVvcGxlIGhhdmUgYW4gaWRlYSB3aGF0IGlzIGdvaW5nIG9u
DQo+IGFuZA0KPiBwcmlvcml0aXNlIGFjY29yZGluZ2x5Lg0KPg0KPiBZb3UncmUgd2VsY29tZSB0
byBwcm92aWRlIGRlc2NyaXB0aW9uIGFuZCB1c2UgY2FzZXMgb2YgdGhlIGZlYXR1cmUgeW91J3Jl
DQo+IHdvcmtpbmcgb24uDQo+DQo+ID0gVGltZWxpbmUgPQ0KPg0KPiBUaGUgY3VycmVudCByZWxl
YXNlIHNjaGVkdWxlIGNvdWxkIGJlIGZvdW5kIGhlcmU6DQo+IGh0dHBzOi8vd2lraS54ZW5wcm9q
ZWN0Lm9yZy93aWtpL1hlbl9Qcm9qZWN0X1guWVlfUmVsZWFzZV9Ob3Rlcw0KPg0KPiBBbmQgYXMg
YSByZW1pbmRlciBJIHdvdWxkIGxpa2UgdG8gcmVtaW5kIGF0IHRoZSBvZiB0aGlzIHdlZWsgd2Ug
d2lsbCBoYXZlDQo+IExhc3QgcG9zdGluZyBkYXRlIChGcmkgQXVnIDA4LCAyMDI1KS4NCj4NCj4g
PSBVcGRhdGVzID0NCj4NCj4gVGhlIGZvbGxvd2luZyBpdGVtcyAoIHRoZSBsaW5rcyBmb3IgdGhl
bSBjb3VsZCBiZSBmb3VuZCBpbnQgdGhlIGxpc3QNCj4gYmVsb3cgKQ0KPiB3ZXJlIG1vdmVkIHRv
IGNvbXBsZXRlZDoNCj4gICBbc2luY2UgSnVuMiAtIEF1ZzVdOg0KPiAgICBBZGRlZCBzb21lIHRh
Z3M6IFs0LjIxXSwgW25leHQtcmVsKHMpXSB0byB0aGUgbGlzdCAiRnVsbCBsaXN0IG9mDQo+IGl0
ZW1zIg0KPiAgICBiZWxvdy4NCj4gICAgKiB4ODY6DQo+ICAgICAtIGtleGVjOiBhZGQga2V4ZWMg
c3VwcG9ydCB0byBNaW5pLU9TLg0KPiAgICAgLSB4ODY6IG1lbWNweSgpIC8gbWVtc2V0KCkgKG5v
bi0pRVJNUyBmbGF2b3JzIHBsdXMgZmFsbG91dA0KPiAgICAqIEFybToNCj4gICAgIC0gU01NVSBo
YW5kbGluZyBmb3IgUENJZSBQYXNzdGhyb3VnaCBvbiBBUk0uDQo+ICAgICAtIEFkZCBzdXBwb3J0
IGZvciBSLUNhciBHZW40IFBDSSBob3N0IGNvbnRyb2xsZXIuDQo+ICAgICAtIEZpcnN0IGNodW5r
IGZvciBBcm0gUjgyIGFuZCBNUFUgc3VwcG9ydC4NCj4gICAgIC0gRW5hYmxlIFI1MiBzdXBwb3J0
IGZvciB0aGUgZmlyc3QgY2h1bmsgb2YgTVBVIHN1cHBvcnQNCj4gICAgIC0gQVJNIHNwbGl0IGhh
cmR3YXJlIGFuZCBjb250cm9sIGRvbWFpbnMuDQo+ICAgICogUklTQy1WOg0KPiAgICAgLSBJbnRy
b2R1Y2UgYmFzaWMgVUFSVCBzdXBwb3J0IGFuZCBpbnRlcnJ1cHRzIGZvciBoeXBlcnZpc29yIG1v
ZGUuDQo+DQo+ICAgW3NpbmNlIE1heSA2IC0gSnVuMl06DQo+ICAgICAqIEh5cGVydmlzb3I6DQo+
ICAgICAgIC0gdG9vbHM6IHJlbW92ZSBxZW11LXRyYWRpdGlvbmFsDQo+ICAgICAqIEFybToNCj4g
ICAgICAgLSBQQ0kgZGV2aWNlcyBwYXNzdGhyb3VnaCBvbiBBcm0sIHBhcnQgMw0KPiAgICAgKiB4
ODY6DQo+ICAgICAgIC0geGVuOiBjYWNoZSBjb250cm9sIGltcHJvdmVtZW50cw0KPiAgIFtzaW5j
ZSA0LjIwIHJlbGVzZSAtIE1heSA2XToNCj4gICAgICogSHlwZXJ2aXNvcjoNCj4gICAgICAgLSBN
b3ZlIHBhcnRzIG9mIEFybSdzIERvbTBsZXNzIHRvIGNvbW1vbiBjb2RlDQo+ICAgICAgIC0gcmVt
b3ZlIGxpYnhlbmN0cmwgdXNhZ2UgZnJvbSB4ZW5zdG9yZWQNCj4gICAgICogQXJtOg0KPiAgICAg
ICAtIEVuYWJsZSBlYXJseSBib290dXAgb2YgQXJtdjgtUiBBQXJjaDMyIHN5c3RlbXMNCj4gICAg
ICogeDg2Og0KPiAgICAgICAtIHg4Ni9IVk06IGVtdWxhdGlvbiAoTU1JTykgaW1wcm92ZW1lbnRz
DQo+ICAgICAqIFJJU0MtVjoNCj4gICAgICAgLSBSSVNDLVYgc29tZSBwcmVpbml0IGNhbGxzLg0K
PiAgICAgICAtIEZpeGVzIGZvciBVQlNBTiAmIEdDT1Ygc3VwcG9ydCBmb3IgUklTQy1WLg0KPg0K
Pg0KW3NuaXBdDQo+ICogW25leHQtcmVsKHMpXSBWVC1kOiBTQVRDIGhhbmRsaW5nOyBBVFM6IHRp
ZHlpbmcgKHYyKQ0KPiAgIC0gIEphbiBCZXVsaWNoDQo+ICAgLQ0KPiBodHRwczovL3BhdGNoZXcu
b3JnL1hlbi82NGIwMjhiZS0yMTk3LTQ5NTEtYWU1Yi0zMmY5ZWFiZmE4NGFAc3VzZS5jb20vDQo+
DQo+ICogIFtuZXh0LXJlbChzKV0geDg2OiBwYXJhbGxlbGl6ZSBBUCBicmluZy11cCBkdXJpbmcg
Ym9vdCAodjEpDQo+ICAgLSAgS3J5c3RpYW4gSGViZWwNCj4gICAtDQo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3hlbi1kZXZlbC9jb3Zlci4xNjk5OTgyMTExLmdpdC5rcnlzdGlhbi5oZWJlbEAz
bWRlYi5jb20vDQo+DQo+ICogIFtuZXh0LXJlbChzKV0geDg2L3NwZWMtY3RybDogSUJQQiBpbXBy
b3ZlbWVudHMgKHY0KQ0KPiAgIC0gIEphbiBCZXVsaWNoDQo+ICAgLQ0KPiBodHRwczovL3BhdGNo
ZXcub3JnL1hlbi8wNjU5MWI2NC0yZjA1LWE0Y2MtYTJmMy1hNzRjM2M0YTc2ZDZAc3VzZS5jb20v
DQo+DQo+ICogIFtuZXh0LXJlbChzKV0gTW92ZSBzb21lIGJvb3QgY29kZSBmcm9tIGFzc2VtYmx5
IHRvIEMgKHYyKQ0KPiAgIC0gIEZyZWRpYW5vIFppZ2xpbw0KPiAgIC0NCj4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcveGVuLWRldmVsLzIwMjQxMTIyMDkzMzU4LjQ3ODc3NC0xLWZyZWRpYW5vLnpp
Z2xpb0BjbG91ZC5jb20vDQo+ICAgLQ0KPiBodHRwczovL3BhdGNoZXcub3JnL1hlbi8yMDI0MTEy
MjA5MzM1OC40Nzg3NzQtMS1mcmVkaWFuby56aWdsaW9AY2xvdWQuY29tLw0KPg0KPiAqICBbbmV4
dC1yZWwocyldYW1kLXBzdGF0ZSBDUFUgUGVyZm9ybWFuY2UgU2NhbGluZyBEcml2ZXIgKHYxKQ0K
PiAgIC0gIFBlbm55IFpoZW5nDQo+ICAgLQ0KPiBodHRwczovL3BhdGNoZXcub3JnL1hlbi8yMDI0
MTIwMzA4MTExMS40NjM0MDAtMS1QZW5ueS5aaGVuZ0BhbWQuY29tLw0KPiAgIC0NCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzU5M2JhZWUyLTliZjEtNGRiNC04NmU4LTAxNWNh
ZTQ4ZGMxYUBzdXNlLmNvbS8NCj4NCj4gKiBbbmV4dC1yZWwocyldIHg4NjogYWR2ZW50dXJlcyBp
biBBZGRyZXNzIFNwYWNlIElzb2xhdGlvbg0KPiAgIC0gUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCj4gICAtDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZl
bC8yMDI1MDEwODE0MjY1OS45OTQ5MC0xLXJvZ2VyLnBhdUBjaXRyaXguY29tLw0KPg0KPiA9PT0g
QVJNID09PQ0KPg0KPiAqIFs0LjIxP10gTVBVIG1tIHN1YnNpc3RlbSBza2VsZXRvbg0KPiAgIC0g
THVjYSBGYW5jZWxsdQ0KPiAgIC0NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVs
LzIwMjUwMzEyMTM1MjU4LjE4MTU3MDYtMS1sdWNhLmZhbmNlbGx1QGFybS5jb20vDQo+ICAgLQ0K
PiBodHRwczovL3BhdGNoZXcub3JnL1hlbi8yMDI1MDMxMjEzNTI1OC4xODE1NzA2LTEtbHVjYS5m
YW5jZWxsdUBhcm0uY29tLw0KPg0KPiAqIFs0LjIxP10gQWRkIGluaXRpYWwgWGVuIFN1c3BlbmQt
dG8tUkFNIHN1cHBvcnQgb24gQVJNNjQgKHY0KQ0KPiAgIC0gTXlrb2xhIEt2YWNoDQo+ICAgLQ0K
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvY292ZXIuMTc0ODg0ODQ4Mi5naXQu
bXlrb2xhX2t2YWNoQGVwYW0uY29tLw0KPg0KPiAqIFs0LjIxP10geGVuL2FybTogc2NtaTogaW50
cm9kdWNlIFNDSSBTQ01JIFNNQyBtdWx0aS1hZ2VudCBzdXBwb3J0DQo+ICgtPnY0KQ0KPiAgIC0g
T2xla3NpaSBNb2lzaWVpZXYNCj4gICAtDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1k
ZXZlbC9jb3Zlci4xNzUzMTg0NDg3LmdpdC5vbGVrc2lpX21vaXNpZWlldkBlcGFtLmNvbS8NCj4N
CkhlbGxvIE9sZWtzaWkuDQoNCk15IHN0YXR1cyB1cGRhdGUgb24gdGhlIFNDTUkgZmVhdHVyZSB1
cHN0cmVhbWluZzoNCg0KVGhlIHY1IHBhdGNoIHNlcmllcyBbMV0gaGFzIGJlZW4gcG9zdGVkIGFu
ZCBoYXMgYWxyZWFkeSByZWNlaXZlZCBzb21lDQpBQ0tzLiBJJ20gbm93IHdhaXRpbmcgZm9yIHRo
ZSByZW1haW5pbmcgbWFpbnRhaW5lcnMgdG8gY29tcGxldGUgdGhlaXINCnJldmlld3MuIEFmdGVy
IHRoYXQsIEkgcGxhbiB0byBkcm9wIHRoZSBSRkMgdGFnIGFuZCBwb3N0IHRoZSBmaW5hbCB2ZXJz
aW9uLg0KDQpbMV0NCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC9jb3Zlci4xNzUz
MTg0NDg3LmdpdC5vbGVrc2lpX21vaXNpZWlldkBlcGFtLmNvbS8NCj4gKiBbbmV4dC1yZWwocyld
IEZGLUEgVk0gdG8gVk0gc3VwcG9ydCAodjYpDQo+ICAgLSBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0
cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+ICAgLQ0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy94
ZW4tZGV2ZWwvY292ZXIuMTc0NzkyNTI4Ny5naXQuYmVydHJhbmQubWFycXVpc0Bhcm0uY29tLw0K
PiAgIC0NCj4gaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vY292ZXIuMTc0NzkyNTI4Ny5naXQuYmVy
dHJhbmQubWFycXVpc0Bhcm0uY29tLw0KPg0KW3NuaXBdDQo=

