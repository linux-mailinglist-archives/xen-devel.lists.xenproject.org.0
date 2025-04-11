Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3146AA85630
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 10:08:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946812.1344582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39Qy-0000T1-UD; Fri, 11 Apr 2025 08:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946812.1344582; Fri, 11 Apr 2025 08:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u39Qy-0000Qg-Qe; Fri, 11 Apr 2025 08:08:20 +0000
Received: by outflank-mailman (input) for mailman id 946812;
 Fri, 11 Apr 2025 08:08:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AtDH=W5=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u39Qx-00008a-9U
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 08:08:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2415::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f4dabc6-16ac-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 10:08:18 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Fri, 11 Apr
 2025 08:08:13 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8606.035; Fri, 11 Apr 2025
 08:08:12 +0000
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
X-Inumbo-ID: 1f4dabc6-16ac-11f0-9ead-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivK8t0cJOkKkiX3MSjEOB/OfqJTNaCyjf9h77ETJEEH2+In8kTP9nDpXeNXCyWeHPtjQAUBiR4MIpNahy8C4pvdoA9wY28zbTVEAA2JibscUSotv2fPTCv1mTRER/PA0NSoVyt4bkxa6rQXJCj+5rS5k2dVGEPKzkHXFfQS3fjlwSqvW3iMvP1hNpmJKdBVe/A74tTQWL8a7PT8Tflxr7Bt4RdXekM89Jw/3kWx63REIfgkTzcr51F6i7Rr3vLCUEp/KJN/G0t14LNe3alXTNGqO7rvcl+fga0AX40Uit+6OmL55BwGe2wVksr7FXwi21CD8I94Ur05YOm7chY9+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMNZK5Ll+mK1erBU7KB7MfUdYtKmClDeJ4wjXHmzxDE=;
 b=Hq9CURPFdbEOrNTo/J2GvYpPWpEE1MeUK7eUrjalZCq3h9RzC6RkEcGY/vujpHoP1kR7AdWQLUCZTHqX4ZU35ZdROC27KsBaV355RBCjV72OJfTYB5XaZRC/KrULdzQd45uxVi7AfiKxc+asnNF/HjPSG1wDvWoA7fUay6kI82Bh761/j3PIMy6Ho24FHXDXJDBc1BlJVdFjV5yhn9I45gNQBdHGpyVggYnPWiYYlAu2FLo7inSubL3IpCUdicVEt8m6qF0YozS3j9+azdZHq5sGfIwytLcEaID+b6GKeK1TWoDHEqy1/dDN5ikloRC7yhjhASdmkdDYzFNqtaX0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMNZK5Ll+mK1erBU7KB7MfUdYtKmClDeJ4wjXHmzxDE=;
 b=pmmRPhwbyg67c0vXF28T0emKkisCFCju5W7x1rtNVK17XtdNuwN4QuLvmcsSZ6bg5caY2xpt7SGQzIHBdGEIg7wqKHoNNjfsTBv0KhDgKFbbBNMINcoK0RFkbaBXPux5fSijMJWgV8L6GKVhnbt5NACrTbj1DlODRSDHtZ8d7Kw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/8] driver/pci: Get next capability without passing
 caps
Thread-Topic: [PATCH v2 1/8] driver/pci: Get next capability without passing
 caps
Thread-Index: AQHbqRsYW9r+TjshqU+vmdXYCVrO/7Oc16GAgAFv6YD//9W+AIAAh8GA
Date: Fri, 11 Apr 2025 08:08:12 +0000
Message-ID:
 <BL1PR12MB58494C7D7C6D026EFF687F63E7B62@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-2-Jiqian.Chen@amd.com>
 <5a18ae61-3ffa-41d1-aa1d-dce4d3ca0381@suse.com>
 <BL1PR12MB5849F5E86496802914619F5EE7B62@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4c1ec39e-5043-49bc-b7bf-0f193331c146@suse.com>
In-Reply-To: <4c1ec39e-5043-49bc-b7bf-0f193331c146@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8606.035)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB9174:EE_
x-ms-office365-filtering-correlation-id: 64cfd830-4576-4fd6-b4b2-08dd78d00111
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dlZaNXNWTTd6aGJCSUJEMXEyM0p5dEE2blloRUVLZTdWamk0aXNhTkZPcFVo?=
 =?utf-8?B?aDlpeHBtdnFrekZ6Qm5SbXBUZVNhYXZkNTNqL0MzZEg1ZzdkKzlaV09NaG54?=
 =?utf-8?B?UUZ2YkowSWV3ZVVFYktSK3FhWGFvbXp2cmE0MkdrbENUMWtKckJiTGZHQWlu?=
 =?utf-8?B?OUdKV0FPMGN6bFBRZ2dZOVVGMFgwUDFINGxoNEZ5WGxLNGxCVlRmeG9wRmZ3?=
 =?utf-8?B?N0tKaWF5RDdTZlFZUVJWWm5VUE10TEFoYWhZaWVzRVB1SW5oNE5DUTZOVjkz?=
 =?utf-8?B?YUNOVUJoWmJhajEzRG5aWFZYUVFZRHVXbTczd1dUNU5pWm5rTmtCSmhtNkcv?=
 =?utf-8?B?Wis1UE9DY3Y4RDRuZDFoUUJGWFcwR3FNVXhOck5FYnRrTW4xSUhVeG1yaDNG?=
 =?utf-8?B?NGMrUnZDdSttSEhSWUNxd3IvR0ZpRVRuUW52cE8zYVgwcWJDMXBnU091R2lx?=
 =?utf-8?B?MzM1TnBjWHpPZEFGeGFQNTRZckxSN1NpY09lYmlCRnNjSUJDZkFQSkJvczkr?=
 =?utf-8?B?UCtpWGdWVitMdk1EVnE3cXRhRS9Jd2ZGcGl3TDlacGYrYWVXMzNJd3JEeTRm?=
 =?utf-8?B?QnRwY0s4ZHAzelpBT1NFSFFHb2UxVjA1dkZHTXdhYWFxVHBhWWxvbTM0QXp6?=
 =?utf-8?B?SU5lREc5aWtYb0p4aXBEaXJmR1FlVG5tTVc4Z1hFTlFDSy8rN0p1VklkNEZX?=
 =?utf-8?B?TGFxcUtxeG1aZjVsK0IwMlN3czI2Y3h4bVNuQ3BGVGlVM052WlAwVTJmblZH?=
 =?utf-8?B?Y0FUVk9Md3c4TGdpTDBqM2hOb05qRUlVV2MwK1NTV09vTXAzYnU0WnlFVnNJ?=
 =?utf-8?B?dGFRdk42WnZ4R3Q3WlZ4eFFtUzdSRHk4RHdQamcyMzBIRDFHQ2J2Zk13Y2Q1?=
 =?utf-8?B?SVZjdkJ6a3RjeHRQZDYrRHhmQ2FjVzlGa1psdUlESXBucXVTOENCVjR2L01X?=
 =?utf-8?B?WXdVdEQwWHJ3NEQydUI5eVJ6aTVqTlZiRitPZldQTkNzalZ4WWhsK0FzNDQr?=
 =?utf-8?B?NW0wQTJUTjJsZ0d1L3ZPNURoZXprTjBUM0VHcVNyVjVKNDE3TFFDalprK3My?=
 =?utf-8?B?QUFVaURwNFFCUlhaU0pvWVJLQ1ZUUUoxQVZrNWV6bHYxSkxOdkxXdFI1L2tn?=
 =?utf-8?B?UXhsejJCdGh3YXVCdnU1ZXVZTFAwUG1VQU51TkRKbWd5U0Y5eHlwNVZldHFO?=
 =?utf-8?B?VGpmWTBLNVh1MWJzdnU4Q0p5ZlNFUnZqS3hxaHRETXVhMHBONW9QWWpnK2FL?=
 =?utf-8?B?ZmxTL1FURjVLbWxSZStpNVlJL3dJVm1hemhBUXU3RHMrV0t0K2lQOHNvMXhk?=
 =?utf-8?B?dkpzWVRzNCtQR3lZUTJaSUpMNlNUcVl0Rm5MaFVQWEY0RHpRYmZkamRYUk5O?=
 =?utf-8?B?a2VkbzY5bm1NNGxha0N6d3Q5aVNHL0UxbGFTV09SQmo0d3djRjlQUkdRbjNL?=
 =?utf-8?B?Qy9TM01ReTVpbTF6bUV3cVh5TlNyK3ZvTGtkWE52ZG4yKzJIQ0tPdTBBSXRh?=
 =?utf-8?B?N3dCcGpiQXJPQUVzKzBMcjV3VUp2RDRRLzVIUHBoVnE3eE1NdzgySEcwcGxy?=
 =?utf-8?B?WGhSa1FNeTU5QXpab3FBMVRkSEJENHQxQnJVMDdJVm9KMG8rZ0hEeWVzaW84?=
 =?utf-8?B?bUE2Rjl1YXoxVEtJNm96cDRVM1ViUmpndURVc1J4KzNCb0tIWHJZeGxuR1dW?=
 =?utf-8?B?SENKYkZYQlR2USt2K1ozTitpSk14UmNneGJ4TzZOdDJFMmxiQXE0Nm15dEVW?=
 =?utf-8?B?bEgvTTlJTXNZTUxhQjNRc2draWV6bjkxMXUvdnNIWVl4d2tQSXJSY1BYbWJX?=
 =?utf-8?B?TUFab3lXZC93YlA5RXFaMEs1SnJTRVVKd3JlYUFPV1BTYlNTcUw1NjJibnA3?=
 =?utf-8?B?ckZnYnB1dnB5ZVZvMWZGeXdUSnkwZE9QVXYxcC85WXJLYnJqMjlJemhoMGY1?=
 =?utf-8?B?VmgwaU5DMitlL20zay9Lc3E1b0QzUjB0VHNYcHF4NlRmVHdDOERUZW9QNTM5?=
 =?utf-8?Q?2xeEE9g0g/e5EM1CpNK291Tzb8I1Pw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bnA1YmxwamVRaHUzdHFsbXpOaEFhRzBObXRNL0FBc1lhTzhwYkFiaW9wUysv?=
 =?utf-8?B?eEJScmJib0FNaS8vdmRvUGhaYSs5b3JnU25CbHNKRG1ON0FHSjdEM2JXRUtO?=
 =?utf-8?B?c2tOaThxTVVXamEyTW00enAwbmtMYjBnOHIram9HTzlDZUF0RzBBMVNPeTNr?=
 =?utf-8?B?ZmNkRHlqbi9XNGhEMENXcnkxR2FPR0FmTjBBRmx3UmxzNENYcTUzVFVxNjFy?=
 =?utf-8?B?VCsvYXVEcXVjb3FKQXFlNU5IMjllaUNZN2UxRHFyS0l6S0FhbXlmNlRtdWdz?=
 =?utf-8?B?QVJqVFhxRlo1emNPM2JlNFc5WS9yNUhzelVCL1BhcEFCSTZOZjN1VVJNbmQw?=
 =?utf-8?B?RW9wSVljWXlOcWtIaVJHWXVybEJkSmJ1YTFTWEFaR3cxUTVlZ0JuVjUzQkRh?=
 =?utf-8?B?VmNEdXJEeFg4blhvM1IwaGtyelBPWVRPTi9qcis4THNPVXc0UmM1UXhQcnpE?=
 =?utf-8?B?Y3pTeFhoc0lnY1hGOWIvUHFVakZSZ3Vtc05zWWEwMUYrL0RnM1pSdFp1QTJD?=
 =?utf-8?B?OHJBNXF0L01GU3B1R2JBd0hua053d3RXUU5xQy9rb0N1eUVRQVpDUHFWQTU4?=
 =?utf-8?B?aHNwWnFONllod01JTmp5Y2gvYStoL1ptQTlDSXN1TmlGQWQ2TWlCKzV5TUs0?=
 =?utf-8?B?d1FFU3FDVG1uZzlueVMrc1FmcjUzQkljRC9yZTNZUGN2cXJteUZLcGIzRUUy?=
 =?utf-8?B?NkZ0T3QvSUduSk9GU3FHVldFN0orZnpiNDIxbG1JdUxVam1PSjZVRkgyU1Bw?=
 =?utf-8?B?eFBaRzdnM2Z0eE1ZeUVHckhvcnhSL29TSXdvVkdVVUoxL091TUYwbCtWTHhF?=
 =?utf-8?B?akYzd0Y4V0ViaHhvR0lucG5CT01zRUNyaFZBTUlvZFRLREJJZllwWEJqVFdL?=
 =?utf-8?B?dElnL1FRT0NLTitZaW42K2g5Q2x4WURmYWNoaXpzOE9NNUNTWEtzSnVwdGhR?=
 =?utf-8?B?OTQzT1VPeFdIUWV2SE9mRHBJTmNnejJheXdWdnIzTmxhN2xzR3ZDYm5Pc2ts?=
 =?utf-8?B?NkxSNldiOG5wWUJ5OGw3UVJ5a3JLYjF5NFlhYlZSTmd2RGFURjZDKzZ3LzZv?=
 =?utf-8?B?czE2R0ljejhnYThFRTBpaE9HdHBJbHAyTU82R1dwYWg4ZkpGVTMvZUJ2MVBp?=
 =?utf-8?B?Z2dPdkkzdHc5Wnl4N0o3ck90YXphaTBma3YwVTNza0FmUGZRS0JMM0xmOGZL?=
 =?utf-8?B?NVFUdnltV0VBdUxUYUNXTGRodWNUdk1hdHpIL0JBMkdtSXhLQ2lGZ3JHZmsw?=
 =?utf-8?B?OWI5dVJTSlcwelpFY0hZK3lPeDBUVlNIVTEvUkZQUFBSR0lTNmUwUzYyb29k?=
 =?utf-8?B?a1lyZ1FUV09kMnhTV0p5Qkx6cVdyYU1EZTd6MUVzUms3QlBZenNVbmlWbG55?=
 =?utf-8?B?d1FZNFdJVXJ4ZWpiME5LSFJReXhMWFdWakN0YTMxMTNtSGc2Sy91MThneUFp?=
 =?utf-8?B?L21pZG04ZXFGVlBQS3BPb2N1ZHJJcDJKOGZwcnZZWWNMSXUyVTJzNytldGhI?=
 =?utf-8?B?YU95OTZEanU2eWtKdy9NSnlYclZ5Mno5WkdZZzcxN2VienIrTFB0dk1mVXN5?=
 =?utf-8?B?akt3ZjNkSmxhWGljL29YaDliZXFxUmhEaWpOd3EwdGJiWDBzYlBlOFc1VjI0?=
 =?utf-8?B?RWxLS2ZoT0dSYlpKSWVPcGtFVzFHVDNMb05WK2I1WlY0SXdCK0RhcENEUTNq?=
 =?utf-8?B?eTFrendVek9FTERueEhQTkhKU2FhdXRYczlkU0Fac1hxL2kxOHIzNTZvVjIy?=
 =?utf-8?B?aGszNHRCVmMxVGZCR2lnMy91ZUtqQlhWSkViTlh3UURtQXNCVUl0bnZIaUt6?=
 =?utf-8?B?NS9CZU5KNExmRkh4c2tqdlNEQUVNMHRNTTVPN2NRaTNKakFXLzdVVTQyQVFZ?=
 =?utf-8?B?V1ErclZ3cXpGeWVkQk5CUEZGek9zWDYrc2U5alpiNlRWZ1VDUWxPZ3pUbVdy?=
 =?utf-8?B?RjhJNER3YkVpT0VwdFJQcEltRzhjb3phajVxZkVLUFBuTzJZQ2hlZ2RKLzBJ?=
 =?utf-8?B?Qk5wbWdEb3BXTG1jUDNqbnlOUVlrYnJBSVArdE42MEVYODhrazh4WlpHVVFT?=
 =?utf-8?B?bUdoQSs3UXJscFF0Wi9KNjg5alhuWlpsaFl5TkdDM3dhc1VMR2hGRmI2S1la?=
 =?utf-8?Q?yz+Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47C1EB38599043438D16FF2C9C2FA02D@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cfd830-4576-4fd6-b4b2-08dd78d00111
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 08:08:12.2548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /UaS+0z9UINSNQcFNAvsH36xk8RCs+VtjEL+ZUMha/PU24sL+6t6pgPkwX/OJKZFJSI9SCp0UxJ/MioCyQonpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9174

T24gMjAyNS80LzExIDE2OjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTEuMDQuMjAyNSAw
NDo1MSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS80LzEwIDIwOjM0LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAwOS4wNC4yMDI1IDA4OjQ1LCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGNpL3BjaS5jDQo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJz
L3BjaS9wY2kuYw0KPj4+PiBAQCAtNDAsNyArNDAsNyBAQCB1bnNpZ25lZCBpbnQgcGNpX2ZpbmRf
Y2FwX29mZnNldChwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCBjYXApDQo+Pj4+ICB9DQo+
Pj4+ICANCj4+Pj4gIHVuc2lnbmVkIGludCBwY2lfZmluZF9uZXh0X2NhcF90dGwocGNpX3NiZGZf
dCBzYmRmLCB1bnNpZ25lZCBpbnQgcG9zLA0KPj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgY2Fwc1tdLCB1bnNpZ25lZCBpbnQgbiwNCj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgdW5zaWduZWQgaW50
ICpjYXBzLCB1bnNpZ25lZCBpbnQgbiwNCj4+Pg0KPj4+IEkgZG9uJ3QgZm9sbG93IHRoZSBuZWVk
IGZvciB0aGlzIGNoYW5nZS4NCj4+IFRoaXMgY2hhbmdlZCBpcyBmb3IgbXkgbmV4dCBwYXRjaCAi
dnBjaS9oZWFkZXI6IEVtdWxhdGUgbGVnYWN5IGNhcGFiaWxpdHkgbGlzdCBmb3IgaG9zdCIuDQo+
PiBDdXJyZW50bHksIHZwY2kgb25seSBlbXVsYXRlcyBjYXBhYmlsaXR5IGxpc3QgZm9yIGRvbVUs
IG5vdCBmb3IgZG9tMC4NCj4+IEZvciBkb21VLCB2cGNpIGV4cG9zZXMgYSBmaXhlZCBjYXBhYmls
aXR5IGFycmF5IHdoaWNoIGNhbGxzICJzdXBwb3J0ZWRfY2FwcyIuDQo+PiBNeSBjaGFuZ2VzIHdh
bnQgdG8gZW11bGF0ZSBjYXBhYmlsaXR5IGxpc3QgZm9yIGRvbTAuDQo+PiBJIHRoaW5rIHZwY2kg
c2hvdWxkIGV4cG9zZSBhbGwgZGV2aWNlcyBjYXBhYmlsaXRpZXMgdG8gZG9tMC4NCj4+IFdoZW4g
SSBlbXVsYXRlIGl0LCBJIG5lZWQgdG8gaXRlcmF0ZSBvdmVyIGFsbCBjYXBhYmlsaXRpZXMgd2l0
aG91dCBhbm90aGVyIGZpeGVkIGFycmF5LA0KPj4gc28gSSBuZWVkIHRoaXMgZnVuY3Rpb24gdG8g
cmV0dXJuIHRoZSBwb3NpdGlvbiBvZiBuZXh0IGNhcGFiaWxpdHkgZGlyZWN0bHkgd2hlbiBwYXNz
aW5nIGEgemVybyBsZW5ndGggYXJyYXkgdG8gdGhpcyBmdW5jdGlvbi4NCj4gDQo+IFRoaXMgZG9l
c24ndCBhbnN3ZXIgbXkgcXVlc3Rpb24uIFRoZSBjaGFuZ2UgeW91IG5lZWQgZm9yIHRoZSBuZXh0
IHBhdGNoIGlzDQo+IHRoZSBodW5rIGJlbG93LCBub3QgdGhlIG9uZSBhYm92ZS4gQWl1aSBhdCBs
ZWFzdC4NCkFoLCB5ZXMuDQpJIHdpbGwgYWJhbmRvbiBjaGFuZ2luZyB0aGlzIGZ1bmN0aW9uIGRl
ZmluaXRpb24gaW4gbmV4dCB2ZXJzaW9uIHNpbmNlIGl0IGp1c3QgbmVlZHMgdG8gY2hlY2sgIm4g
PT0gMCIuDQoNCj4gDQo+Pj4+IEBAIC01NSw2ICs1NSwxMCBAQCB1bnNpZ25lZCBpbnQgcGNpX2Zp
bmRfbmV4dF9jYXBfdHRsKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHBvcywNCj4+Pj4g
IA0KPj4+PiAgICAgICAgICBpZiAoIGlkID09IDB4ZmYgKQ0KPj4+PiAgICAgICAgICAgICAgYnJl
YWs7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgaWYgKCAhY2FwcyB8fCBuID09IDAgKQ0KPj4+PiAr
ICAgICAgICAgICAgcmV0dXJuIHBvczsNCj4+Pg0KPj4+IENoZWNraW5nIG4gdG8gYmUgemVybyBv
dWdodCB0byBzdWZmaWNlIGhlcmU/IEluIHRoYXQgY2FzZSBpdCBkb2Vzbid0IG1hdHRlcg0KPj4+
IHdoYXQgY2FwcyBpcy4gUGx1cyBpZiBuIGlzIG5vbi16ZXJvLCBpdCBjbGVhcmx5IGlzIGFuIGVy
cm9yIGlmIGNhcHMgd2FzIE5VTEwuDQo+PiBUd28gY2hlY2tpbmcgaXMgdG8gcHJldmVudCBudWxs
IHBvaW50ZXIgZXJyb3JzLg0KPj4gQnV0IGFzIHlvdSBzYWlkLCBpZiBjaGVja2luZyBuIHRvIGJl
IHplcm8gaXMgZW5vdWdoLCB0aGVuIEkgZG9uJ3QgbmVlZCB0byBjaGFuZ2UgdGhlIGRlZmluaXRp
b24gb2YgdGhpcyBmdW5jdGlvbi4NCj4+IEkgd2lsbCBjaGFuZ2UgaW4gbmV4dCB2ZXJzaW9uLg0K
PiANCj4gSWYgeW91IHJlYWxseSB3YW50ZWQgdG8sIHlvdSBjb3VsZCBhZGQgZS5nLiBBU1NFUlQo
Y2FwcykgYWZ0ZXIgdGhpcyBpZigpLg0KT0ssIHdpbGwgYWRkIGluIG5leHQgdmVyc2lvbiwgdG9v
Lg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

