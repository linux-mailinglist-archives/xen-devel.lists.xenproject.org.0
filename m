Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE162B0D247
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 09:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051970.1420450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue6y8-0005uD-KQ; Tue, 22 Jul 2025 06:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051970.1420450; Tue, 22 Jul 2025 06:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue6y8-0005sI-Gg; Tue, 22 Jul 2025 06:59:20 +0000
Received: by outflank-mailman (input) for mailman id 1051970;
 Tue, 22 Jul 2025 06:59:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uo4O=2D=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ue6y6-0005sC-HH
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 06:59:18 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20624.outbound.protection.outlook.com
 [2a01:111:f403:240a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6107bdd8-66c9-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 08:59:16 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY5PR12MB6453.namprd12.prod.outlook.com (2603:10b6:930:37::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.25; Tue, 22 Jul 2025 06:59:09 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 06:59:08 +0000
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
X-Inumbo-ID: 6107bdd8-66c9-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhO3eL8ynAJhq4jsLfRcnexL8kDV6FE4d01GrRX57HdnS5Y307DQDmR5BMlHrOInpzmXMWmD2AMiq7c/mp+UPtNWmkZj4PFh3Gc4FVdcZCtI0jfBQU+a65QUhEujWXuTMQO3ZHVcMPuUYnPpKVEvYA3JHQOKXZihffDpZm3b9AWYofwJDrcs2x2wYmn7Apu96cAGQWiiZPL1ZMcdzLXQhWTmQSiO4KWeObshGIgYlDVkWdItXRX+1AAuWbGxcYrQpdrIxW48Qw7/B+kMes3TgbitMaaHXZOUEJpxuvA8GRv9MiQ9jj0pCmOmeU072OE5NBHZ7xYjQtQlu8qqfZM8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDt7F1ETt2no1y8jRz29Kmiiozci3/nQ5elZ8GKad90=;
 b=Tapf69PqQvyi/Bl6ZTd4d85FW5NrsDfVmdO6EgNqy5D2UDJ5IHQHpaQX0bRdG5SvinOIRi3azrIvRurrZR2plCuccGaTkKznubWnbxFWtozqQ7sqPEUNw5//itsH8i04lo2KIr0h36ZsASLM5F31OvoAmonC34ldxREge65487mLVeLTPYyOkfAIO7io53Z8qOzns6GqYfNFDgLwMUDmHb4MQg0GyZ9gdvmdNDdjPirTznSDlG9Ks5EW2CkGVQVJdtc+nLxUlG0iYJSJExE2wHiTz/a/AKVGoHthDV/8NW2qhi/DJvaQLav8Fi+BmDmYn00aUEDnxLhQfkNeDb7obA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDt7F1ETt2no1y8jRz29Kmiiozci3/nQ5elZ8GKad90=;
 b=ozhvWXoCqrAip+pzjBX7K5m4lG2G7xLPZsegeyXgY24UXtfEpWLKS4SOOO+RIXAnlHggPagBrHScn+VCGdO4mEUHuTgfEK9TG4xDpcyTbB7cy639KriDGHqVtjM/3oXEjTlqfHciCTTdVIMQOB1HzK/N7zWg2MExwmnX1JSd36Y=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>
Subject: RE: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
Thread-Topic: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
Thread-Index: AQHb8hzZ4PaGCcXW4ESgBHjQZ1Y4rLQ2DLKAgAebZgCAAAf0AIAABthA
Date: Tue, 22 Jul 2025 06:59:08 +0000
Message-ID:
 <DM4PR12MB84512B6BEE55EF0CD281568BE15CA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
 <20250711043158.2566880-8-Penny.Zheng@amd.com>
 <5238ec09-2a00-4f80-aea6-95a3ab617b0d@suse.com>
 <DM4PR12MB8451571C1DEBBA2F5FA66A87E15CA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <a9443bf4-78ec-4731-8e05-dedd65547ed0@suse.com>
In-Reply-To: <a9443bf4-78ec-4731-8e05-dedd65547ed0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-22T06:58:18.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY5PR12MB6453:EE_
x-ms-office365-filtering-correlation-id: cd6d6882-46fd-4498-e203-08ddc8ed417f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?M0Mvbk1oOGtEa0xnZU5BWFlHUFg4bUJCK2FwU2U1a0Vtd2xXVmNMV1N6Vk5l?=
 =?utf-8?B?SUdMdzZHWjEwaWFGY3p2Yk5RdmlRSjBhUHVZOUpXS1BjaE1MRzNmdDZST2Nh?=
 =?utf-8?B?bEFqVkJ1NHIyOU9KQ0JTVC91QVNLMXpaNGtQMDZGaE9DaVNKTzZvUjAwQ24z?=
 =?utf-8?B?SmhTYXM0VFUrbDBCTDA4ZkVRRzJHdUVDR2NpQ3YwekJHdGtSdUEwQmhPSnNo?=
 =?utf-8?B?RUhtRXpQaWR3NjhrSG5HTUI2S2lZQURuMzAyUURReHZta2RPYW1aWHZrUEVK?=
 =?utf-8?B?ZXEzMkl1dFZoSThKSU42RGRUR0c5ekVuN2g4eERrTUhDNUNCZm9zR0tML2tD?=
 =?utf-8?B?ak16amVvLzhYbEh5NFhILzBmenFGalFGdm1QTCtrdnhHWHRJR1dHUTd1V1Vz?=
 =?utf-8?B?eStJYWZvRHY1SWlYTVZ3ZHBuYUJ1T0dtSy9mcVIxdzRsWGs2eTVCUE5mTmtq?=
 =?utf-8?B?NU5ZcGZteG1Ma3JpMUNlVWgwOWkwOTlxRjJWODVIWmFPbWQ0dDRNL0crWmIv?=
 =?utf-8?B?M0Q0TFNQRGY1cVMvNzh4TzF1bkw3dkd2RnR6bVdsZ3FkTTNXNFpNbXJmTlBO?=
 =?utf-8?B?eDZYMTZNNzBzb25CREpYN0hyRWU4TDd3UXBHcnIzaUs5aC9KRVFORyt3SUFz?=
 =?utf-8?B?aFF1Y0M0U0RWRHBpTUxuQlh0Y0F6RUxrUFhsaFFyWSt5cFRsa29TOXdZVk94?=
 =?utf-8?B?SGM3QlBnK2hlalZXYldudTJGem5BRWRZZ1JCUlhyK21wdG1BR0ZUdUpMWVIy?=
 =?utf-8?B?NnVuQnl0cDM5MS9GVHRXQS9meG1hY1owK0xFRG9hNVdvVE9sU2pLWHJMMDJj?=
 =?utf-8?B?NWZIaUhIbEpZbHNhK3RqQXBlTFozbzR3bUpBczYvcGFMSHpWT05rWFNLaWF0?=
 =?utf-8?B?eFp0M3NQTWk0U2FPZERSVTAzM0dHSzFpZWxzVFFKMEZRWmoyMVlsdmpoTSs3?=
 =?utf-8?B?RTVuRWxtaVVacDlMQkVlLytGOXczVFZBQ2pQbStvSkcyMXN3TXZLaHJIcVEy?=
 =?utf-8?B?YzB2WmJWUXNJOWFoaWl5TEhUTXZibVBtSTNSdk8zUVF3UzNnOVVvakoxNytk?=
 =?utf-8?B?MGVjQzZ2bklPK21OY3c1cElsWGRlTmZRWmp3Mm1TT1BjQkpJMk4yclprY3VT?=
 =?utf-8?B?a0pGdnlPNHFxc2VSQjRNRnkrTzhzQlU0bzRJM012MXgvYWY3bTR3Z29ETWJY?=
 =?utf-8?B?SG5DdTJydTByOVdJTXhSYkViYy8zaWVLSGs5Tkp6Z3VVS2VhMlZDN21sOVBO?=
 =?utf-8?B?cDdBblFYU2ZRRHMrUTJqYzJoNUhkSG9ZaVNUMldERVltbVJQc09xY213aUtK?=
 =?utf-8?B?YUZlRU5FQU4zeHN6NnErY0FSYWY3RnE5NHRhQU1ZYmlaZUY4OTFxOHBiVjNF?=
 =?utf-8?B?Ryt1NFhKRks4Yzg0MjJXakIvb09LWGdNNkVqWUJHTGVTaHhSZ203VmVBb1Va?=
 =?utf-8?B?ekJGL0tjT3FxOE50REtYZDNoQWl0ZzRaeGFsZ1VtS1hnK1JvdVdLNmlJdVNp?=
 =?utf-8?B?UjdUMzA2VWZsSHdrVmZVWi9NUWc4aVprQWFTaU1kS3pPN1l1bG5sOEtZL2VC?=
 =?utf-8?B?TW51eFVpRC9KeGpSWlNzK1pWck1Ta1phTUQrZ3RzZlNpTk9FZHd4VzU4NXJq?=
 =?utf-8?B?aTIzWEhKTVF5aS9TNjNxOGRqeVVpS2RvZUJTSTNwejRGalcrMUE0SXVlQWxR?=
 =?utf-8?B?cTNlUk1JbEhxS3hvdkZRZm1xcC9ZNGFQMlV1M2ErbENlSng1cG5YRXBkd1Fy?=
 =?utf-8?B?UExMVElPZThpVTJJYnN5bWJrM3dPUHk0UTh2Y3dnZ1lWQnY5Y3ZYbzR1Y3c0?=
 =?utf-8?B?d21PcksxTThzcjlCcEVHU0U5RDYrUzRxNlFXTXRxYXI1c2FCTXVQQU5qMGNW?=
 =?utf-8?B?cUw1eFJRT2graklGaTJyYjRyVitrZVIya0FOenR3V3VTeFR2V1FQN3gwZUc4?=
 =?utf-8?B?TEYzMTFVSTRTS25BUW1mYTk5Q3EvK0w2MFdITGxLSE9EYlVqbEpRdGdDWWQ0?=
 =?utf-8?Q?ReAXOyemUCCkF0VNmyTiPwb3jgML00=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a1cvN3pUeGhjUGN4bXRtblVWWFlCMHZwUjdqeHE2bUgzSWZxaEs5dyswZGRG?=
 =?utf-8?B?RldZR29CTUtMSkhGNVFKOVpTTXVidEZjbnZsRytidUZCYXlsOElRK3lPemRw?=
 =?utf-8?B?L3ZuTDhoQVozUWoxdHdkZnFLNjhhZ3pid1dtL0ZmcVI4NnZEK1dETXNnQi84?=
 =?utf-8?B?R0trR1FCVDBkUGxuZ1FSY0xuanJiYUtCTlRqd0hmbWx5WTJRRTY1ZElMS0Uy?=
 =?utf-8?B?dk5TMUQ5bmpWRzBodGJkS2dZV2pGZmtoRkZMVTM0cENBNTZVM2tRVjZIbk93?=
 =?utf-8?B?bVJKc0tBRFMrb0hOOGhXdnFRQlVTR256SHVMdDUwNWRTenowcnVZMm0yMDI1?=
 =?utf-8?B?c2NEdEVyRE9xWjcwVExhQTNPMnFFc3hlNWs4VzRTbDZnc3BiUXhRVEVHTkNi?=
 =?utf-8?B?WTVhNkxLbE5qTnNFZWVCcTEwUDFGa0N0aWhCMGgrSzFOV3JtYlhIVlFDTTVu?=
 =?utf-8?B?Y1FZSk5SNHFhZWlEZTVqbG9EV3RxYUVzcW9RYytEQlpPZlN0cGd0dkFWT0F0?=
 =?utf-8?B?VGN5eVRNTnNnVHhFZThUNW9hUkpBcUtwNjJGRkx4Zi9ydjhtSTNEclNRZEFH?=
 =?utf-8?B?MHBrYU83N2hEenM3bW9ueWxYQUVobitYQ0c5UTJjeTR3Qlg4b3RLTndqWG04?=
 =?utf-8?B?bEdEWGZGSjAwRWxmaGVFd3ZHUnEyeFZNaG5NUGVFZUZnRllINSsvNGx6Z01L?=
 =?utf-8?B?KytpbldXeXRLMEhpclVwOGJGRm9YdTRXeEYrZGhpRmplU2VCcjJvM1drQmp0?=
 =?utf-8?B?KzYzZlFOLyt6S2d4RUxzcHR2V1oyMjNPNHk1a014aG12OUJoU0ZHQXBJdmVG?=
 =?utf-8?B?bEpQR0NVSGNWcDJZU0ZjdW5VWTEyYlBFRlVTeWZyR1hPK3R4TTh1SWdTVWh5?=
 =?utf-8?B?Y1VpSk1CYnhuclMyYmoxMVNLM1BENWR0OFJCZ1dWWC9kRjBXTGxvd2hwMmxp?=
 =?utf-8?B?Q2ljQVJxNFIyOUVKRGtlZjRFQ3poYVVhSFdEdWpwUTA0YVB0ZFpWTWxTMGtv?=
 =?utf-8?B?OFkxWFVaYndIQi8xZWpNdXIrVWd0Q1R0SnR5WndwUTUvWXNrTXJ5NVJGQm1G?=
 =?utf-8?B?UzNLeTFkTWYvVWhWNmtpRFMrVTB2Q3ozWS8wUC8xT0cyUng1TmYxSUJzUkE1?=
 =?utf-8?B?NCtZOXhZK20wbXl3eEU1Wm9yLzFMdVpoRjZDVFMydE1RMVdYK0NMNm1LT1hE?=
 =?utf-8?B?Yk1DN0pCUGNvU1M4U2JZQUllYm1kMGNtVmxPcHQzbkoxdm1jZ2hHVG53SEt0?=
 =?utf-8?B?R0l2N1Z2QXhhUHZxd01la0F5M3BjNWtEOFJnNkJ3T2kvb2tFZE5HVWRxeVJn?=
 =?utf-8?B?aE1Ea0N0U054RXpyaitra1YwQjFDTmFTZGN0aHBNVHIxd2loTDQzRlpJWTY1?=
 =?utf-8?B?RGFRTGdmRmlTWWhUT3p3VmJ4N1VkbkZqM2ZObkJJdHNpM2FLQTlWcUtjUXlz?=
 =?utf-8?B?SCtwT3l0bFBXbFNpMjJuK3VCZ3pSRGJsajFJYkxCVzJOM0pYS1M5bklNOVZV?=
 =?utf-8?B?bUlSZis1NTJVSHZQS21GOXkxTGdlRUdsMld2c3ZwS2NkS0JWQ1JWQm8xRGx5?=
 =?utf-8?B?TEZMcEJBKzdJNGZFL0JQaDBPOW8xUXVndlQzSUUrQXk1emhkL203eGVYeDhn?=
 =?utf-8?B?eG90MTgwODB6ZGZabWpHV3pmMHJQLzNjNlFoU09NRnJmQmpJcEx5Q3RwODlO?=
 =?utf-8?B?NnUxZW51ZjF6cGppMTRYYjlYQ0RHa201eERPeURFTWdtMmc5eXh5WW1tK0F1?=
 =?utf-8?B?TUluQVhrRlJoLzdzOG13bVRQSWpQTVp6RVZMaW1MbUN6U1crdUxGT0ZMdE1X?=
 =?utf-8?B?eEcxVFpBY21qL3VqU0E0a3N1K2NJSFB2LzRLaUlCN25yWHdZb29NbjdmaE00?=
 =?utf-8?B?MWVhY1J5R2x2REI0cG5vak05NElnR0RmMUhhS2ZmdURFcXpMZnlMaElwQWdz?=
 =?utf-8?B?WFF6VC95dGZRTW52bU1UZk1HSzhtZ3VSZE1HclErYXVWS2tKNFdIRk1uYUVo?=
 =?utf-8?B?ZVJ4cjZ4RUpZVEx4aENnUi9laEpFbDdDbHkvM0JvZWlKKzFJTitCUEFNSTdW?=
 =?utf-8?B?QVdKb3VWZmdtTnFCK3dnSWk5RUtuVnJ1emY2Z2ZMUUdvZlZLeUFUVmFOUkFx?=
 =?utf-8?Q?7Zx4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6d6882-46fd-4498-e203-08ddc8ed417f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 06:59:08.8128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBjo7yTbE+D4g+kmecxIlOjWr8/xGHH8LSWC+UrGlgLkvdFH8PEibCWjbxahIcMUh25J+5UBF4AbCgpa64nJBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6453

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMjIsIDIwMjUg
MTozMyBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPjsgUm9nZXINCj4gUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBBbnRo
b255IFBFUkFSRA0KPiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNoYWwg
PE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47
IFNlcmdpeSBLaWJyaWsgPFNlcmdpeV9LaWJyaWtAZXBhbS5jb20+OyB4ZW4tDQo+IGRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnOyBTdGFiZWxsaW5pLCBTdGVmYW5vIDxzdGVmYW5vLnN0YWJlbGxp
bmlAYW1kLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCA3LzddIHhlbi9zeXNjdGw6IHdy
YXAgYXJvdW5kIHN5c2N0bCBoeXBlcmNhbGwNCj4NCj4gT24gMjIuMDcuMjAyNSAwNzowNSwgUGVu
bnksIFpoZW5nIHdyb3RlOg0KPiA+IFtQdWJsaWNdDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
PiA+PiBTZW50OiBUaHVyc2RheSwgSnVseSAxNywgMjAyNSA0OjU1IFBNDQo+ID4+IFRvOiBQZW5u
eSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+OyBTdGFiZWxsaW5pLCBTdGVmYW5vDQo+ID4+
IDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gPj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5I
dWFuZ0BhbWQuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+ID4+IDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47DQo+ID4+
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQN
Cj4gPj4gPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBPcnplbCwgTWljaGFsIDxNaWNoYWwu
T3J6ZWxAYW1kLmNvbT47DQo+ID4+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBTZXJn
aXkgS2licmlrDQo+ID4+IDxTZXJnaXlfS2licmlrQGVwYW0uY29tPjsgeGVuLSBkZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDcvN10geGVuL3N5
c2N0bDogd3JhcCBhcm91bmQgc3lzY3RsIGh5cGVyY2FsbA0KPiA+Pg0KPiA+PiBPbiAxMS4wNy4y
MDI1IDA2OjMxLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+IC0tLSBhL3hlbi9jb21tb24vTWFr
ZWZpbGUNCj4gPj4+ICsrKyBiL3hlbi9jb21tb24vTWFrZWZpbGUNCj4gPj4+IEBAIC00OSw2ICs0
OSw3IEBAIG9iai15ICs9IHNwaW5sb2NrLm8NCj4gPj4+ICBvYmotJChDT05GSUdfU1RBQ0tfUFJP
VEVDVE9SKSArPSBzdGFjay1wcm90ZWN0b3IubyAgb2JqLXkgKz0NCj4gPj4+IHN0b3BfbWFjaGlu
ZS5vICBvYmoteSArPSBzeW1ib2xzLm8NCj4gPj4+ICtvYmotJChDT05GSUdfU1lTQ1RMKSArPSBz
eXNjdGwubw0KPiA+Pj4gIG9iai15ICs9IHRhc2tsZXQubw0KPiA+Pj4gIG9iai15ICs9IHRpbWUu
bw0KPiA+Pj4gIG9iai15ICs9IHRpbWVyLm8NCj4gPj4+IEBAIC03MCw3ICs3MSw2IEBAIG9iai0k
KENPTkZJR19DT01QQVQpICs9ICQoYWRkcHJlZml4DQo+ID4+PiBjb21wYXQvLGRvbWFpbi5vIG1l
bW9yeS5vIG11bHRpY2FsbC5vIHhsYXQubyAgaWZuZXENCj4gPj4+ICgkKENPTkZJR19QVl9TSElN
X0VYQ0xVU0lWRSkseSkgb2JqLXkgKz0gZG9tY3RsLm8NCj4gPj4+ICBvYmotJChDT05GSUdfVk1f
RVZFTlQpICs9IG1vbml0b3IubyAtb2JqLXkgKz0gc3lzY3RsLm8gIGVuZGlmDQo+ID4+Pg0KPiA+
Pj4gIGV4dHJhLXkgOj0gc3ltYm9scy1kdW1teS5vDQo+ID4+DQo+ID4+IENJIGRlbW9uc3RyYXRl
cyB0aGF0IHRoaXMgY29tYmluYXRpb24gb2YgY2hhbmdlcyBpcyB3cm9uZy4gVGhlIGpvYg0KPiA+
PiB0aGF0IGZhaWxlZA0KPiA+PiAoZGViaWFuLTEyLXg4Nl82NC1nY2MtaWJ0KSBpcyBhIHJhbmRj
b25maWcgb25lLCBhbmQgZW5kZWQgdXAgcGlja2luZw0KPiA+PiBib3RoIFNZU0NUTD15IGFuZCBQ
Vl9TSElNX0VYQ0xVU0lWRT15LiBXaGljaCByZXN1bHRzIGluIHN5c2N0bC5jDQo+ID4+IGJlaW5n
IGJ1aWx0LCBidXQgZG9tY3RsLmMgbm90IGJlaW5nIGJ1aWx0LiBXaGljaCBsZWF2ZXMNCj4gPj4g
Z2V0ZG9tYWluaW5mbygpIHVuZGVmaW5lZCwgY2F1c2luZyBsaW5raW5nIHRvIGZhaWwuIEluIGNh
c2UgdGhlIG5leHQNCj4gPj4gcGlwZWxpbmUgYWxzbyBlbmRzIHVwIGZhaWxpbmcsIEknbGwgc2lt
cGx5IHJldmVydCB0aGF0IGNoYW5nZS4gSW4NCj4gPj4gY2FzZSBpdCBzdWNjZWVkcywgbm90IHJl
dmVydGluZyBtYXkgYmUgYW4gb3B0aW9uLCBhcyBsb25nIGFzIGEgcHJvcGVyIGZpeCBzaG93cw0K
PiB1cCBwcmV0dHkgcXVpY2tseS4NCj4gPg0KPiA+IEkndmUgcHVzaCBjb21taXQgb2YgIiB4ZW46
IG1vdmUgZ2V0ZG9tYWluaW5mbygpIHRvIGRvbWFpbi5jICIgdG8gdHJ5IHRvIGZpeCB0aGUNCj4g
ZXJyb3IuDQo+DQo+IEFuZCB5b3UncmUgcmVhc29uYWJseSBjZXJ0YWluIHRoYXQncyB0aGUgb25s
eSBpc3N1ZT8gSSBhc2sgYmVjYXVzZSBpdCBpcyB0aGUgbmF0dXJlIG9mDQo+IHJhbmRjb25maWcg
dG8gcGljayByYW5kb20gY29tYmluYXRpb25zIG9mIHNldHRpbmdzOyBvbiBhIGxhdGVyIHBpcGVs
aW5lIEkgaGFkIHNlZW4gYQ0KPiBkaWZmZXJlbnQgZmFpbHVyZS4gSSBkaWRuJ3QgbG9vayBhdCB0
aGF0IGluIGRldGFpbCAoaXQgbWF5IGhhdmUgaGFkIHRvIGRvIHdpdGggdGhlIGRvbWN0bA0KPiBs
b2NrIG9yIHNvbWV0aGluZyB2YWd1ZWx5IHNpbWlsYXIpLCB3aGljaCBwZXJoYXBzIHdhcyBhIG1p
c3Rha2UuDQo+DQoNCkkgdHVybmVkIG9uIEhWTSwgSFlQRVJWX0dVRVNULCBhbmQgVkdBIHdoZW4g
UFZfU0hJTV9FWENMVVNJVkUgaXMgb24gdG8gdHJhY2sgZG93biBtb3JlIGxpbmtpbmcgaXNzdWVz
DQpBbGwgdW5kZWZpbmVkIGxpbmsgZmFpbHVyZSBpcyBkdWUgdG8gcmVtb3ZpbmcgUFZfU0hJTV9F
WENMVVNJVkUgZGVwZW5kZW5jeSBmb3IgQ09ORklHX0hWTSwgbGlrZSBtb25pdG9yX3RyYXBzLCBk
b21jdGxfbG9ja19hY3F1aXJlL2RvbWN0bF9sb2NrX3JlbGVhc2UsIGV0Yw0KSSBzdWdnZXN0IHRv
IG1vdmUgZG9tY3RsX2xvY2tfYWNxdWlyZS9kb21jdGxfbG9ja19yZWxlYXNlIG91dCBvZiBkb21j
dGwuYyB0b28sIGFuZCBhbHNvICJvYmotJChDT05GSUdfVk1fRVZFTlQpICs9IG1vbml0b3IubyIg
b3V0IG9mIFBWX1NISU1fRVhDTFVTSVZFIGd1YXJkDQpBbmQgYWJvdmUgY2hhbmdlLCBmd2l0LCBp
cyB0byBmaXggY29tbWl0IG9mICIgeGVuL3g4NjogcmVtb3ZlICJkZXBlbmRzIG9uICFQVl9TSElN
X0VYQ0xVU0lWRSIgICINCg0KPiBKYW4NCg==

