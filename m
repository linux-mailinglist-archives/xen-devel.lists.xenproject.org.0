Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A79BB9A34
	for <lists+xen-devel@lfdr.de>; Sun, 05 Oct 2025 19:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137696.1473643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5Shb-0005Id-1q; Sun, 05 Oct 2025 17:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137696.1473643; Sun, 05 Oct 2025 17:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5Sha-0005GN-V4; Sun, 05 Oct 2025 17:39:18 +0000
Received: by outflank-mailman (input) for mailman id 1137696;
 Sun, 05 Oct 2025 17:39:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AseM=4O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1v5ShZ-0005GH-GG
 for xen-devel@lists.xenproject.org; Sun, 05 Oct 2025 17:39:17 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36196d94-a212-11f0-9d15-b5c5bf9af7f9;
 Sun, 05 Oct 2025 19:39:15 +0200 (CEST)
Received: from AM0PR03CA0033.eurprd03.prod.outlook.com (2603:10a6:208:14::46)
 by PAWPR08MB10994.eurprd08.prod.outlook.com (2603:10a6:102:469::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 17:39:07 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:208:14:cafe::45) by AM0PR03CA0033.outlook.office365.com
 (2603:10a6:208:14::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Sun,
 5 Oct 2025 17:39:09 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Sun, 5 Oct 2025 17:39:06 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM8PR08MB6546.eurprd08.prod.outlook.com (2603:10a6:20b:355::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.18; Sun, 5 Oct
 2025 17:38:28 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 17:38:28 +0000
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
X-Inumbo-ID: 36196d94-a212-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aliOr0Pc9zsKfINPdm7WKpBTjB+6KoIlHmo0lRr3uuKWIu4nLXOGv+NVpyducDU5d5qNQyAC+JGeoPYpu58wUNX44ZBfo1xySnwX2X950V24fNWg4o2nV0j9dkeu81KfRX1PIr20z5rceG+AgUGiN/O81CxdErO98T8RrNp1ta67WFHZ710SXR3NEi/B/5/8HqnVDPI+UvdV09wburhO5XvRNJgxtnraET2KGFL+loX44GQcqITm1a+2qmKFbXXjgpzNLE7/I3BXVjw9ut/4pUUziNLbai0I6Q/CtBHsNJ+sEE5AEsFekBcWc+DSOcGy4+slTNcDqX5x/tRSzwCAcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yXcvQrDmEbzbteC/XtariP88OVnZu0UZSMXpAcc0CQ=;
 b=NxbKM3mTb02vcB2+leLgBdpKjLT4Zn127HI87G9RyoS2oJmnnzIba57Tjbn1UV2br2ZDx7maG10jUNha6pkImL6HxYs0AL/RqEjGGKbuJfzifPE0lSLw+FbgDKQzKtHlHh+Xt9LVXgtlZPUJxI8DVPNVutgMroxoc1JingGsD4nRt/VKxbRv8OqYEZnRDaDSdcnNdtcU4pz+H+T3j114my6nZlJoNUbLl4exKLo7SuadQzbyFUFSL+8GWz78/A6ucm35ED8ZStp3DO201jSNAqRayk24FPLhfxwztrEkJV6HJkez13jFKjT0rvrtjk+/0tWTWIXgFYXt/z4quF9SGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yXcvQrDmEbzbteC/XtariP88OVnZu0UZSMXpAcc0CQ=;
 b=WTanWgMj+0vT0Z+OOB2EDFshWZD1XUHl6+aPlGi94lxyZGEpDpLxgaIRzMTClgNAQ4iXnb8kcboVAHyb2tf+EiN0eo76QJdGNeMysDl0z9YqspjX/FtClFIebD+Dx4ifrpQM59lsmcyfzZV/6MCNaTbwdLouP0NfIWA4ZAhRVew=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcy7WfcjCSgSHjz4zfTBYOnfwD8s3k0f9t5a24er04UtMob0bczCsyZkyS2oWWwtMY5dO1E9mxta3oQ8g/OACkwf35bJq6TBYPu7Dab6UFS3XC/khQtc8xyhKy02627hlQPYBG+yYGbIzBRWafiqUcBzB3NJ5Y0glOqykrLFWZtdHeImHyCKm3Yo281muPX/vFX3eMKPJV9qyJV4UuCeGlWpzuFeG57qE36GZdVkc7A1bL4Eh1rPd9zrBZLzuIfoXcR9MWcA6GMLW9LEmcDI5QSppMHC6FdPOEv4occSP3JETJUiHqd2OQCoJ/+I4EDUEfIdfyvJNIiiw45538NcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yXcvQrDmEbzbteC/XtariP88OVnZu0UZSMXpAcc0CQ=;
 b=SRT+WSrz/qLlfi9/vP2NzLMGWDKtkbQKZwBgx0UIjBNP4NUk0gJwwTIB3FCf2MMCnpP5zkMuhqKL0ZTUq6vcwyfyowtL3y26W05X2Wy1ZONwwtM0XAfYw/a0fhcrkWZgqhqyxp6UMAa2c296jPke3UqOPkiuiKQ/RYsxdMnr4HW1LTS0ywfC9Yc58q+IttoD9w56DS29Mz7uZo41E27JuiGfcyRIjn0THx4PXX4zsbOCdLT25M38l+L7SDgJRrxZYpLKsUYWgKpz4wsi2V5v5dBIu7K/xQQpeDAd+A61pyjNOQJh6v1B0FbP2XoGiFgP8mm8JyCpKRf8jjlu6Xec7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yXcvQrDmEbzbteC/XtariP88OVnZu0UZSMXpAcc0CQ=;
 b=WTanWgMj+0vT0Z+OOB2EDFshWZD1XUHl6+aPlGi94lxyZGEpDpLxgaIRzMTClgNAQ4iXnb8kcboVAHyb2tf+EiN0eo76QJdGNeMysDl0z9YqspjX/FtClFIebD+Dx4ifrpQM59lsmcyfzZV/6MCNaTbwdLouP0NfIWA4ZAhRVew=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 PERARD <anthony.perard@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] libs/guest: don't use unsigned long as type for PFNs
Thread-Topic: [PATCH] libs/guest: don't use unsigned long as type for PFNs
Thread-Index: AQHcNdkTMbnaztptskylYrL8jhUvD7Sz0eCA
Date: Sun, 5 Oct 2025 17:38:28 +0000
Message-ID: <5331F776-FA04-47C6-BEE6-0BF04306A605@arm.com>
References: <20251005091845.3725-1-jgross@suse.com>
In-Reply-To: <20251005091845.3725-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM8PR08MB6546:EE_|AMS0EPF000001A9:EE_|PAWPR08MB10994:EE_
X-MS-Office365-Filtering-Correlation-Id: a4264fc3-87af-4e5e-f4c2-08de04361519
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?c1YvNUYxT01yMnlhbi9venpUS200L3FhOHZJZm5BU1lXWGNtUEJYdktEZFZL?=
 =?utf-8?B?T1ppQlJaMFAvZW5QZy9YZ0hIRzQzdlRvRjNESXg1dUl2cS9LVlhkUlh2eVcz?=
 =?utf-8?B?U1VzSFFQa0MxWlhjc2tsbGNGZ1Fub21pVGJCKzR5by9zdW8zcUxzVzFlOUM2?=
 =?utf-8?B?dXQ5dUxjbUdQNFl3cmd2d3d5OFd1cGZaUEcvSDhCVUhPSHBlS1pPZEVWbzNx?=
 =?utf-8?B?QUkrbXFSYm00SVFHTVhFVlphK2crbVVNdTluQVB2SHZ6SDg2M3VsWisrdENt?=
 =?utf-8?B?U1l6SVVXNWFoSURjTkZhSDc4NzR5U1VhbmN5TnllM3Q2NTdVZW14WTNHTGZx?=
 =?utf-8?B?YnR0NThhQVVUV2hHaWxaNU95WDN5ajhWNGdEMzlwN0thaXJRY3BGQTJJNEtZ?=
 =?utf-8?B?TXk3ZHIrcFpTVE82OVBSSWRPdFFHRTh5MzA1aDRkbk5MQjBBeVd2ajJLQ0hP?=
 =?utf-8?B?TzhQUW9idjFwV0cxZzYxR29aMVY2dlhMYXorRjRWaVF3YlV5M0g1OWlieHBJ?=
 =?utf-8?B?TDFRdXovWlUzVXBPKyt2VjlNQXh2bU96cTFwL0k2NDJtcEFLcFhnM2ZpNFBn?=
 =?utf-8?B?Yy9uNEZwYWk0MDlQYWdtMGVMQlU3SXJOdWVpeE9ST1hTa0lUWWh0Wkk5RmRT?=
 =?utf-8?B?UHNYak5aMnRrdmFaYzBMMXdLd0gzcGYzL2tCa2M1b2JwZytsSlE2NkdZVUlw?=
 =?utf-8?B?NG05OTBkZW9mVnlLTk9KV05sWHlmbURjREpkdWV2SlZGdm8zUHRqNDZMdzhX?=
 =?utf-8?B?OWhnejVvRUNOaVgrNkFiL3FVZmYxOUIyMERHTjNjTDRlUm13T1VKR3V2NE1I?=
 =?utf-8?B?Q2xKUXFXbnZCblZOaitwUmZBdnZzWm5kbmFFTEJuS0NWMVlYQ2I0aUl2Vlk0?=
 =?utf-8?B?YTFkdkRjbWZ2Y3JBYmdUaUpEM1dtb0xZNUNjWXRSaHZCRmdxcm5ONUpMbENt?=
 =?utf-8?B?cG83bWhBcGhnUXRYa2IvdG9WQTRkTjhMc2x5UjFrT01ab0xoQldmaDRMMSt5?=
 =?utf-8?B?RVc4MkhLcm9OZVdUMDdtMnpib0d4NnBieC9hNm1XWUNxakF0cUhFLzBjbjQr?=
 =?utf-8?B?TFA3bjZkUEV4czFwRENzSDJaV1JUU21rbVY5QnozKzlFMVorWFVwMHE2N0c5?=
 =?utf-8?B?a0lKR1ZRY01mV3ZLL21MMjRPS0VleGFHdENaL2NIVE0wcUFGSElOcko3ZEsv?=
 =?utf-8?B?ckcwOVlOTEdTWTEzQVUyK1c0b2ZkNFJLUUxUOU1lbUNZeGE4Vk9UYVkxOGhE?=
 =?utf-8?B?UTdYQ25GTkJrUUFXR05jaE83cGhUOFRWNk9EbEJRQ1VnTm1QdmlFcmVRTitv?=
 =?utf-8?B?YmJ5VitnTHdjcjZzMGluRGpVOTZkWEhVYm43eThRaVdvMzNkN05MNzZYSlpr?=
 =?utf-8?B?TzdTYTFwZkVFdEcvaUFnL3VIVnBOekhYSXM4NG5KeVdqWWtvUWtjNXhQUTl1?=
 =?utf-8?B?dm10QW05SVBIOGdGeGhOYVo4d3YyeTkwckozUUNIRGsxRzZ2eitvZ1lkdm52?=
 =?utf-8?B?UUFEVUx4VmtxTm5GRUErWHBKNG1qbWduNnhiK2JhZlRZaFVJdWtWeTZWdTJy?=
 =?utf-8?B?c1dqeThNcGNOQmM3VWpYeXhLMkVnVGt0NDJZalRULzQwSjViWUNyV1E4c3R3?=
 =?utf-8?B?Z2RaQU5Hc3hXamdNcGVZdEhuVENHNDJYUDZCU0d1Z29kaFBJZDBhNXQ3YWNk?=
 =?utf-8?B?dTJvbjBnYm9CeE0xNFp1bmtzVHFFR3lVWmJ6ZXQzaHRLQnh4bkdtVXlKV2Zo?=
 =?utf-8?B?VWNGUUh1UnRGcjRyNlFWZ0FyU3hUZnNodGpFMmhkc251T2I1VEtzMkVVM3FP?=
 =?utf-8?B?V0g3OWdoTEhMRmRsUGVJdTdjVlh4dUhONTFCN3drUTJlS2pjendUOXZtNExJ?=
 =?utf-8?B?RTcrSm5pWGRkYUxKWFBmeHQzOXRtRnQ1UmR3QWg4ZGpzdzBaY09zeDFFcDEw?=
 =?utf-8?B?Q3hYaUJTOUd1QjE4ZjgzS01OS2lWSnhMV1l3YllIc1BGKzgrR2pSdVQxR3JS?=
 =?utf-8?B?bDdGeUtnVy9BNm9VU2FaQ040WWlEaE5renhLZ1RiU2VFSk1RQ0IwUkpBVEVq?=
 =?utf-8?Q?9bfLBz?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <59BF651612C91D46908055BDEE0F56B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6546
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ecc79cf-88cc-497e-683b-08de0435fe6d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|36860700013|35042699022|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkcvZy90OEQrYTBScmJUOENYcUNBMFdWZHU2VG9vdXBZdUQ5SjFjWVBrUHBS?=
 =?utf-8?B?YmJ3YUR6UTlGK1pmOWdtVzgwcDlNWFdBQTVmL3NNclJlSjhFYVVGNDlUUFJO?=
 =?utf-8?B?T0dtd3A1TitCUG1FWitGOVR5YmQyeE5uQndVbkNneCtXM2pFZjJwS2FKVTJx?=
 =?utf-8?B?Wmw5VzRidTVoenE3bTJBWDcyN1psMVpqYU1SZklKUVpKT0NEYnJjSFRMOXB0?=
 =?utf-8?B?ekR0RmVRY2k4bDhreGpuYkZWYUk1eXJncnBOdzVsRXorYmtJTDVmSGJPbmVV?=
 =?utf-8?B?MlFHVUxrWlBlSzlsL1R2OXBVdUM2ZzIyY2VVaUtCbkVaSStxNTdrL0NWRDhY?=
 =?utf-8?B?S0NYTDI5VGpPWDJVTXlnNzZPYkVCRGk3SHJCRS9La1pKQWg2bWlOUVozaXdX?=
 =?utf-8?B?RkwvV0FYRkRNWGZ0TFg5QWtjeUVqaDFRL2dINmdsbGM1VE81SS9nWnNrZWlt?=
 =?utf-8?B?ZFh0bUMrMzZiemtQelg2T2FONWlVMXBMUi9aSTRXVENZbTg4SWRHb2ZRNlZ4?=
 =?utf-8?B?RWMrbUlqZHVXRkh2eFlLQ0ZiSlk3b3dwKzBOaXA1NHQvKzJXWXBYdHJRSTl6?=
 =?utf-8?B?cGJWUjA5b1V6cldsc1pDZXVueUcyT2hKazNZcEtmc2FoWm5NNzlFRkljWXFI?=
 =?utf-8?B?VWkydzk1ZlNPUnhCcnhydnIySElBNkoxVVVvQXBDTEpOSytaOHJqYURvazBK?=
 =?utf-8?B?MlB0dnB6Rzd0VGNEbVhUTGVYV3AvcmpYMTJXN1lIa1pVdGZjV05HOTVVOU9s?=
 =?utf-8?B?NmZ3S01PV2l4OXV0RWZ5d2JVOG1wMStUdkk0ZEVqd3QzLzRIR2U1SjhBb2F3?=
 =?utf-8?B?MjhxcDF3cmwxSnNkMFJrakx3c1ZaRkwrN1k2YkVPWGJUdTF2MHZRWis1REtI?=
 =?utf-8?B?QkhPaURvVUEwNHphK1h3M2UycEpKRGtzQlBXaDJzL0Q2K3d3Q3hxSG92VWtS?=
 =?utf-8?B?L1VZbzdUaUxjeHMzSnpDeW1lclZUdENybVBCdkNybm1xSmF4Q3VlaGQ1Vk8z?=
 =?utf-8?B?N2dtaFBhRCtVRFVITFg3dFNwc2x5dXBtSHRWWnY3QmtNME0zZDZzQU5TOVBx?=
 =?utf-8?B?MWdLUkpiM1V6SFFvd0QyT3hjdVBmM2pWalVSZjc1dnRjMXVweGtTWUJJSWtN?=
 =?utf-8?B?aDUvUWhobnZyRHQ4MGNrQUxKZkwzTUdHVDZ0NExETnk1eVhZYk11c0dLeXVR?=
 =?utf-8?B?ZjVuS1BjVmpUeC90TFJQR0oxelBZUVVWb2NHbTUxN3QrTE5yRnEraFg2ai9I?=
 =?utf-8?B?YkhSaUltc3JXb0M0SzhBM3Z2SlZaVGlZLzZSNFBEUVVtS2d2OTBZb2FZNmJn?=
 =?utf-8?B?aE1hbUhERjZwZ0FQdUNHZlFJSXdVam81TUNvVFk5QlpTV1RJcGlWRWpuQ0U3?=
 =?utf-8?B?enk1eXBzaFBzQlByQVgyMXJncXk1UUxkWko2eWUvSnZwU1gxUndLWGs3K2dY?=
 =?utf-8?B?SGExaDVxTnJJSlAxZVV0cVBoZWN2Ym5NY050TDZja3NoU0tzNTFsUmlwV2lW?=
 =?utf-8?B?K3liamZPY2xhbEtyMFBiYVpIbnNDQ2lpYzhQVE5jZE1aMW5nRmJDdGlWVjFY?=
 =?utf-8?B?czVHaTh6RkdYMG9ScnhHdFQ5ekJGY2pNNzV6L3lROUo2Uk50L3U1bnltYlRW?=
 =?utf-8?B?OWYrV0FOb095bzZ3TGk1OTNWL0pFdzlDVWRBKzZsNFl3STRwc1kyc0p6dkxS?=
 =?utf-8?B?Y3lNWEpTak9zWGdCZHJsWkZNTDVSWTFSRWVLUE1YRDAzb0N2QTQwUnNEaDNt?=
 =?utf-8?B?dUhueXhkcWVBVTZvYUhmWEwxV2JJL1BrMlI0bnJSa0hFdGVsQ1E0MGhZQTRW?=
 =?utf-8?B?TmVUNzUwWHh1T2w1WmRydzh5Z2x0NzRNbkRGTXpLeXA3ZXNxUmlwQkwzdGdX?=
 =?utf-8?B?aldMUDg4NE1ubVVhTkl6TENDZ1ZCQUZRQ1g2YzlJRTFIbEtVTys1cUczU0xy?=
 =?utf-8?B?NUJza0VOZ004TG9xaXFRNUYzNVI0WjMxUE5VRk5ld2pNUWhoaG13b29CVW8r?=
 =?utf-8?B?cWo4RGhkelg5UTFFZGtVOGtsVUFtVWcrRjI4M0dScElOenZ4bWs3QU5KRWxB?=
 =?utf-8?B?bHBIZXB1UEQvbzdPb1BkWno3WnZ3bU5KUktkajJreVZvYmdFa3BTNHA3SXg3?=
 =?utf-8?Q?hENg=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700013)(35042699022)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 17:39:06.0995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4264fc3-87af-4e5e-f4c2-08de04361519
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10994

SGkgSnVyZ2VuLA0KDQo+IE9uIDUgT2N0IDIwMjUsIGF0IDEwOjE4LCBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gRGVjbGFyYXRpb25zIG9mIHhjX2RvbV9jb25z
b2xlX2luaXQoKSBhbmQNCj4geGNfZG9tX2NvbnNvbGVfc2V0X2Rpc2Nvbm5lY3RlZCgpIGluIGxp
Ynhlbmd1ZXN0LmggZG9uJ3QgbWF0Y2ggdGhlaXINCj4gaW1wbGVtZW50YXRpb24gaW4gdGhlIGxp
YnJhcnkuDQo+IA0KPiBVc2UgeGVuX3Bmbl90IGZvciBQRk5zIGluIHRoZSBsaWJyYXJ5IHRvIGZp
eCB0aGF0Lg0KPiANCj4gRml4ZXM6IGI2ZmMzMDdiMGIwMCAoImxpYnMvZ3Vlc3Q6IFNldCBjb25z
b2xlIGFzIGRpc2Nvbm5lY3RlZCBvbiByZXN1bWUiKQ0KPiBGaXhlczogOTcxYjdkNWVjYmNkICgi
bGlicy9ndWVzdDogU2V0IGNvbnNvbGUgcGFnZSB0byBkaXNjb25uZWN0ZWQiKQ0KPiBSZXBvcnRl
ZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNClRoYW5rcyBmb3IgdGhlIHF1
aWNrIHBhdGNoLCBJ4oCZdmUgYnVpbHQgdGhlIGFybTMyIGNvbmZpZ3VyYXRpb24gYW5kIHRoaXMg
c29sdmVzIHRoZSBjb21waWxhdGlvbiBpc3N1ZS4NCg0KVGVzdGVkLWJ5OiBMdWNhIEZhbmNlbGx1
IDxsdWNhLmZhbmNlbGx1QGFybS5jb20gPG1haWx0bzpsdWNhLmZhbmNlbGx1QGFybS5jb20+Pg0K
DQpDaGVlcnMsDQpMdWNhDQoNCg0K

