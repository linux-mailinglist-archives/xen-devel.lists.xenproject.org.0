Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21E89EC4E3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 07:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853815.1267165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLGLs-0001F1-SC; Wed, 11 Dec 2024 06:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853815.1267165; Wed, 11 Dec 2024 06:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLGLs-0001DW-P6; Wed, 11 Dec 2024 06:37:40 +0000
Received: by outflank-mailman (input) for mailman id 853815;
 Wed, 11 Dec 2024 06:37:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqCb=TE=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tLGLr-0001DQ-C5
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 06:37:39 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:200a::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 689efd9a-b78a-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 07:37:37 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB7987.namprd12.prod.outlook.com (2603:10b6:510:27c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Wed, 11 Dec
 2024 06:37:31 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 06:37:31 +0000
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
X-Inumbo-ID: 689efd9a-b78a-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvsSrLexAzEiFpstDdjzqRPTkd4n+PKrcSHcBr6X8Vyp3XfG6XkHTAoS8iWwiVNRjwsMFxxU5e1ZxMVOh56n873Mx2GtwBRfSR2cHx1zNqUVuTeg09hV1p9NSv5STtBJs48CFlegN6yLCN6Duq/sDKsQu2GkNg90XvH3GiyP/PcsPi1O3R1Nu5CU7e30J5XLMJnoX8UWSEjPYfd8sl3qqOHmUYPrPv0Oc7U8M4bbAjKnvRAY59PvAt0bLTqfddRSrN6Y4+GfcEcMUNvznDip/0cSv13zTN7hm3L4Ky0GmzQjpaEJB7VIa11pMyTHJI827kKIsqZ9fa8ZcwdwNXpU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6H1DN4Vl2+itDT8nAUxwUcdyfzbprc+cQRbD0aMLq8=;
 b=YqKgdF+TSisZ7aEAwV4M9/cPkJ5Xo2/5ACd+bUifyar/gHBP227GANZTJ3BaoRgcIq519cMXXfZGgxP2V0t+QV/bJSNyY7Hr/7ou+wKlzlV447Kv7Yx/J+oE3y1BDUjRALUW/bhkQuLhsJqw3E9iq3gIZ1OufnQ4PYS5IiFklI5a22FVQCe68btB2QmA528T815FhiuzL904sQpzOtWnoFDmPhbe/u47Oc0XQy+udMDjv/ydMBP0KGLgvEbtWfFfJWOl4LfYhbQt1I470HYGjDf6CHgC0uCvYygb3yENeBzSImPGRwdWs5TJlsStea5tnUTQMGmcfRfo4PumGL7b0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6H1DN4Vl2+itDT8nAUxwUcdyfzbprc+cQRbD0aMLq8=;
 b=TrtI24T0iwuucy52fqhZoCf+oQYk58GHKcYfWi0YMySp68muy++d0pZvdB8smiFNG/nNxiiXg7UeZcvl/EjZGxOUFv4eLMjcLTJmFg9/4AGWsMoesyLrvCJF5McwpxAXG/T958KhlcOdwhkfAEGKvV7Z/UG++ZNrv5X4d8AKrzA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Topic: [PATCH v2 1/1] vpci: Add resizable bar support
Thread-Index:
 AQHbRIDgGHZ3ofHO0UuqqXvn+EZCabLd/CGAgAGXh4D//4qBgIAAiieA//+hwICAABlHgIABx3CA
Date: Wed, 11 Dec 2024 06:37:30 +0000
Message-ID:
 <BL1PR12MB58494BFB7FBB042450189684E73E2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB7987:EE_
x-ms-office365-filtering-correlation-id: 3df5ebf4-e0bd-4807-c22a-08dd19ae49d1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RjQvbll6V1JBcnZSMHppNDVYRWlGd0Nwa1kxQ2RLNHBUQnhBRjhwRCttcHlj?=
 =?utf-8?B?Nkp0emllcWVkTTFFRmRlNHdoNGwyN3dRTm9CaW1OSTc3U3c0cGxadTZlalJX?=
 =?utf-8?B?MHlDaHEydk54dXZySWRxRDdoNCt5aHdtMURYYWpXT00rOXBEMkMvYlJQbjhw?=
 =?utf-8?B?VTdEV20yb01IbWRqSmFyY2JPNktZQkQ4Vk0zbVVRMllQM3RNdFE2K0ZRaCtr?=
 =?utf-8?B?N2J1b3BnenQvR3pwZUNxbVFTQXZsdnJUSWI4WXJlQXpINDB0NTMxVjRjUTBB?=
 =?utf-8?B?aHV2WnpCeUpJeWFRMEVxVHdaME1XNC9veGtobXRKNEJuSWNrbWNMaGN4QVph?=
 =?utf-8?B?ZzVTUCtQeGdXcGJrU2ZLN2VsSGVjbUVXbHltWVU5d1B6VDVLaHBtL1Z6ZDRi?=
 =?utf-8?B?OTljMkVSVTZ1M0ttL0dKTllJZGkyQVA1WjdEQkRjRnE5QW1zdldVdGEzQXNW?=
 =?utf-8?B?Q01TMWJYU3ZRVzVCQzR0VTNsVGFpSVNJOWFCWU1wTkZLTWlnRWlKMXV3cWdx?=
 =?utf-8?B?ak5DNzZxV2pQZ1Jhd3cwNkczWVNVOGpsSFZyNVRJNE9xQ2xQeWlaeTVzTDF2?=
 =?utf-8?B?Q2tVSzIzMHVQZ09YUXIvbXJqd1hYSEhmeUVORm5kYSt6Z0VTd1J1WUtZb1RI?=
 =?utf-8?B?RjYrV004S1F4ZFlNazFmSEJxZWR2eWd6SUZ4OVQrRHoyYkF1Y1F3M3dFbE5F?=
 =?utf-8?B?aUdWb3gvUTJpYklMZXZCNWtVWkZYMFhxNHU3R3ppaFZQcllFdUU2aERHNzE3?=
 =?utf-8?B?VXU4bTZsd0R5MzdGRWhyTndYSVZWbWxKaTA2Y2ZxUTQrU1llWEhYYnRQTGJ2?=
 =?utf-8?B?T0ZFb1hIV1hRRXdmYTZuSDE3UWVCTnZqM2dTMC9jaDkzejcxRXpzSWxQVThF?=
 =?utf-8?B?QUdaaVJiTWgvUXBFSjh3WUREWkJZMjJQek5VSm1ERHUwNWpUaWtmdXJkWWRy?=
 =?utf-8?B?YnlRNWpOemNuVU43Z052NHJDWHVGWnF6L09ETHN3Ukt6U1dlRFZ2SzdRT2Ez?=
 =?utf-8?B?UXNIVHlQbWFscEFQZmx4N1RFN2hWdXk5UWxXZkpJb3g5NjIxTFBoVks5U0Zz?=
 =?utf-8?B?b2p4K1lnRXowMFJsV2RxRTQ1cVFqbU9CemptN0VlQytMcXkyQ2h2cm5HK2px?=
 =?utf-8?B?UHFyQlBaTEQvT1pxbGpkSjcrdUt1cE42NXQ5YjF0TmJwU1QrY3NJSVZFUXor?=
 =?utf-8?B?Q2hRMHZvV2FkL09oeVVGSWxGZ2lJZ2RrS0FNSlJRQzBWc3V1SVh6dFJrR3pj?=
 =?utf-8?B?M3F3SUk4WGFzcjduMzNpN0pYcndWa2JFeGVQV2kvWlJreXpDaEVuSzhCNXQx?=
 =?utf-8?B?OTM1anQwRzlGZHdvaEt4OU5lQVRVRjZuUmhoZG1ia1A1U3BkUTI3clQrVlN5?=
 =?utf-8?B?RXZDR1BJR1pmZlhrUDBvV2tydVpPeElCN2xUb0s5VUxKRUdrN045SGxod2JZ?=
 =?utf-8?B?eWczVFdIcTdiYjBwa1NnRDFaVjRPQm9zYzRlL0k5NjVORXpITkgzRU1MMkF0?=
 =?utf-8?B?cXQ1aWVCV2I4LzVXR2pPeld4UTI1R09EUzRnWW9CbmVTSkkwQktTZTFiWEJQ?=
 =?utf-8?B?bHc2MG9wa2YzVllRSmZUL0xoRzZRZnV5cFhsbC96ZVBOTjlNL3ZBRitycC9T?=
 =?utf-8?B?cjF0c0tXQXNOMjRIdUNkUVJneG9ndjl5Y0lwOEpxR3BBZGRzUENhY2toUUt3?=
 =?utf-8?B?ZkY1WWVGcFdyb2tWNW9wOUhZY0hqeXdqTzAzZmlBU3BkRFg1K0ExK3p1M0pp?=
 =?utf-8?B?ZkhPbUk2c2MwcHVIZzBNbkJYVFVvejMxdElYM0xySTNvcEJaWVhlanBxZDd6?=
 =?utf-8?B?K1hDbHVGMlI2VmJCS1ZYVE1KNnpTUldRbUJxOGdQNjBTMXNvU0NaYUdmWkha?=
 =?utf-8?B?dm1xK2dRNzZuSEZpY1BPeVJFbituSG1LNW1GeSttcEZxV1E9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U09iSFJDWEQxWGFmQkdZaGlYU1FzVEhzZW0ySk5NcFZBSnVGcDd1UzZ6UldU?=
 =?utf-8?B?VUhPTURrOTdla2c0Wk93K01UMzl1NDlCK0xhVnQvcjJxVjF5bE9NSnNxVGcw?=
 =?utf-8?B?dWtVSCszTTNUdmx6bmYzRXpYODRFd1Byc0JFTjRUcnJ3dGw3ejZSem5abWxO?=
 =?utf-8?B?ZnBzd1QyTjRDVDZJY1BGcmVzZk1WODhKUmg5Ni8zRDZYQ0EwRlZrSG9KelJQ?=
 =?utf-8?B?cTVCc1FNRkcyeTdYM1RaaThQSWliNFlMUGtxWE9JV3VZaldFaU45MFhoQUY2?=
 =?utf-8?B?L05FRXpkSjlYaDdBM3FLakVVaSt0eldzcU1qS0dLUk1yS1ROcC9wY1ErSVpj?=
 =?utf-8?B?aU91VFczOG12bkRObTFBUWVqWjBpUmNEOHU2K1JjTGh5c2VrM1BsTlg5RU02?=
 =?utf-8?B?VlRoQ011aWFJQkJGSEthY1lnNTdBU0hpL2RyNkxRV1IwNnA2Rm5IUTZpRWRX?=
 =?utf-8?B?dFhRdE9KYWJETzh6a0xiaStEclRCQkN1c1ZUeTVWYW9EeXJhYWNteHF0Y0s1?=
 =?utf-8?B?ZnlSdVY1cmhvcEFWSGtrb1ZnSXBVc1RDNU5DcU1JVTk2bDhuTWhOQXFON0dt?=
 =?utf-8?B?U3hGdnNHYzQ1SjB6OGhDNVlsWGlEMkwzY1ZYdlkrOW55N0pkb013TjFvdXhS?=
 =?utf-8?B?ZVhhb3ZUMFJXUFZvMTFpUysvWk5HS2pORFdMLytBTVdHaGhHNmtUS004ZGNv?=
 =?utf-8?B?VGtlaGYzYzZvOUJHbWxKaCtNcS9SeW92WktZMDlxTEFWQkMyQTIvZzluYmlO?=
 =?utf-8?B?Y3dOeDZMemh1cDhwVjlXYTBSdGcrVWlwT1BEL3pXS3lIdWVwU0lQNUQxamF1?=
 =?utf-8?B?KzhMYkJPYmxqaElrNVUvSVpFZE5ja2UzOG9JcVJHVXNaMEZKYU0vdlR6ek9K?=
 =?utf-8?B?bFJ4TFBRN2FLclYzT1Z2NlpaeXJpT3Mvb2d6SSsrNEhmZDFhSGphOHRzUDRM?=
 =?utf-8?B?NFE1by8wdXFMU21EWXpiWW8relQvSUlyVEVDMk4xcGQwZURoTEFQTm9KSTIx?=
 =?utf-8?B?WnBkUkd2Y0FUZnZFQjBvTXM4dnNRLzlYbW1iaCs0cnlVTW4ybVZlYU1rWFp4?=
 =?utf-8?B?QmxlcFlHMHd6aDlmVWtYYmY4SUhiUklpMThmWWtmMUdVY0tCcWdiQ1lPUS9X?=
 =?utf-8?B?RXpia0tjQkFCQkh4NTdWR1IvV3JqWUVnbEtxM0xFcnRxS0FLSUplRGdrWU0v?=
 =?utf-8?B?Qy9LZ0Y3VnFCYU1RV3JCY1hSRHFTdnpSVXBhZkpoZlFMbWczYTVPK0IwNjNY?=
 =?utf-8?B?TTBFRWs3SGljQ0ttUXBXRHJNL21xU21wcVVsYWE2b2syWFBUcXhxb0RjTnFw?=
 =?utf-8?B?VXZRa1d3a1dxSVllaDlMYjhLVmpPWTFXc1dSVkJmaTlmTWRCUmdZZWNZWTN6?=
 =?utf-8?B?bzNUQ0U0TEhiSldmb3RrSXlKNE1RcXlCRW9HdXBlVWI0UUdCTS9hNjFhRGJu?=
 =?utf-8?B?bzc2WFozTkxBcU5wRTMvUHN3cCtEeHJ0ZFFzUlFwVUtQMmlYUXh5cTMvYVp4?=
 =?utf-8?B?RVoreDFRSlJod1lIMXFQTSt0WnlnT05aVHI2Mi9zMWVqRjdNUGYzVHBtbXVG?=
 =?utf-8?B?Qk1DcWRYOEpRVUFJRENqMmhTTWZxK2hJQVl5M3dBQUtxVmpNOHJpbzB4RE9q?=
 =?utf-8?B?ZmtkeWF2NmhjNDNITlBCRGdpWUlHdmNnRXlDeGRaUGNNUmI0RW41UndBOEdE?=
 =?utf-8?B?ZGFmRnppSld1aFhDQ0s3OE9UemFKOTRUTWRORnlKeUZrY1loTVY5L3VwZU9t?=
 =?utf-8?B?WnNWN1hteUJPei8vL1ZxMSttdHBXY1d3L0JpZDJlT0d2dXhRcmZlWWZBV1hG?=
 =?utf-8?B?Zm11TFc2YnhqYXZaWk1ZTzlxbXJvc1pMd0dPU1RON2RoRDlGTjNzT3l5a2ts?=
 =?utf-8?B?SUlLcG8vMHRONGlabTJZaVlGVHZxVk1LVlBhb09wanh5c0FVMGxmemRQOWdS?=
 =?utf-8?B?bmpBdkI5YmdybXU5VFNnWHNIWVdUMDlqUkEvK0xwWXhZMWFzamhjM0RhRVNS?=
 =?utf-8?B?K3JWUlh6MUpsaS85anM3OWxRU1RoOEx3RVd1anZKNkdpUHRrK2hxNW1lMk96?=
 =?utf-8?B?QThmb2lzd1pKRlVYdlR1dE1aNXZPaU5razNxeFB6emU0K3RqQmtCblNEUktj?=
 =?utf-8?Q?h7UI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93CD2AB74CF2EB49AD12E09410402B17@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df5ebf4-e0bd-4807-c22a-08dd19ae49d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 06:37:30.9932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 93FiICccmjuGnyfkp5ZbkV2qeHjYoe9osXeLKC1sPXkuTYLDqem/7FwEah061tWjxVLMYHbANb2S9SZIuJlEFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7987

T24gMjAyNC8xMi8xMCAxOToyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVHVlLCBE
ZWMgMTAsIDIwMjQgYXQgMTA6NTQ6NDNBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBP
biAxMC4xMi4yMDI0IDA4OjU3LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4gT24gMjAyNC8xMi8x
MCAxNToxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9uIDEwLjEyLjIwMjQgMDg6MDcsIENo
ZW4sIEppcWlhbiB3cm90ZToNCj4+Pj4+IE9uIDIwMjQvMTIvOSAyMTo1OSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+Pj4gT24gMDIuMTIuMjAyNCAwNzowOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+
Pj4+Pj4+ICtzdGF0aWMgdm9pZCBjZl9jaGVjayByZWJhcl9jdHJsX3dyaXRlKGNvbnN0IHN0cnVj
dCBwY2lfZGV2ICpwZGV2LA0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWwsDQo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpDQo+Pj4+Pj4+ICt7DQo+Pj4+Pj4+ICsg
ICAgdWludDY0X3Qgc2l6ZTsNCj4+Pj4+Pj4gKyAgICB1bnNpZ25lZCBpbnQgaW5kZXg7DQo+Pj4+
Pj4+ICsgICAgc3RydWN0IHZwY2lfYmFyICpiYXJzID0gZGF0YTsNCj4+Pj4+Pj4gKw0KPj4+Pj4+
PiArICAgIGlmICggcGNpX2NvbmZfcmVhZDE2KHBkZXYtPnNiZGYsIFBDSV9DT01NQU5EKSAmIFBD
SV9DT01NQU5EX01FTU9SWSApDQo+Pj4+Pj4+ICsgICAgICAgIHJldHVybjsNCj4+Pj4+Pg0KPj4+
Pj4+IEkgZG9uJ3QgdGhpbmsgc29tZXRoaW5nIGxpa2UgdGhpcyBjYW4gZ28gdW5jb21tZW50ZWQu
IEkgZG9uJ3QgdGhpbmsgdGhlDQo+Pj4+Pj4gc3BlYyBtYW5kYXRlcyB0byBkcm9wIHdyaXRlcyBp
biB0aGlzIHNpdHVhdGlvbj8NCj4+Pj4+IFNwZWMgc2F5czogU29mdHdhcmUgbXVzdCBjbGVhciB0
aGUgTWVtb3J5IFNwYWNlIEVuYWJsZSBiaXQgaW4gdGhlIENvbW1hbmQgcmVnaXN0ZXIgYmVmb3Jl
IHdyaXRpbmcgdGhlIEJBUiBTaXplIGZpZWxkLg0KPj4+Pj4gVGhpcyBjaGVjayBpcyBzdWdnZXN0
ZWQgYnkgUm9nZXIgYW5kIGl0IHJlYWxseSBoZWxwcyB0byBwcmV2ZW50IGVycm9uZW91cyB3cml0
ZXMgaW4gdGhpcyBjYXNlLA0KPj4+Pj4gc3VjaCBhcyB0aGUgcmVzdWx0IG9mIGRlYnVnZ2luZyB3
aXRoIFJvZ2VyIGluIHRoZSBwcmV2aW91cyB2ZXJzaW9uLg0KPj4+Pj4gSSB3aWxsIGFkZCB0aGUg
c3BlYydzIHNlbnRlbmNlcyBhcyBjb21tZW50cyBoZXJlIGluIG5leHQgdmVyc2lvbi4NCj4+Pj4N
Cj4+Pj4gV2hhdCB5b3UgcXVvdGUgZnJvbSB0aGUgc3BlYyBtYXkgbm90IGJlIGVub3VnaCBhcyBh
IGNvbW1lbnQgaGVyZS4gVGhlcmUncw0KPj4+PiBubyBkaXJlY3QgaW1wbGljYXRpb24gdGhhdCB0
aGUgd3JpdGUgd291bGQgc2ltcGx5IGJlIGRyb3BwZWQgb24gdGhlIGZsb29yDQo+Pj4+IGlmIHRo
ZSBiaXQgaXMgc3RpbGwgc2V0LiBTbyBJIHRoaW5rIHlvdSB3YW50IHRvIGdvIGEgbGl0dGxlIGJl
eW9uZCBqdXN0DQo+Pj4+IHF1b3RpbmcgZnJvbSB0aGUgc3BlYy4NCj4+PiBIb3cgYWJvdXQgcXVv
dGluZyBSb2dlcidzIHByZXZpb3VzIHdvcmRzOiAiIFRoZSBtZW1vcnkgZGVjb2RpbmcgbXVzdCBi
ZSBkaXNhYmxlZCBiZWZvcmUgd3JpdGluZyB0aGUgQkFSIHNpemUgZmllbGQuDQo+Pj4gT3RoZXJ3
aXNlIGNoYW5naW5nIHRoZSBCQVIgc2l6ZSB3aWxsIGxlYWQgdG8gdGhlIGFjdGl2ZSBwMm0gbWFw
cGluZ3MgZ2V0dGluZyBvdXQgb2Ygc3luYyB3LnIudC4gdGhlIG5ldyBCQVIgc2l6ZS4iID8NCj4+
DQo+PiBUaGF0J2xsIGJlIGJldHRlciwgYnV0IGltbyBzdGlsbCBub3QgZW5vdWdoIHRvIGV4cGxh
aW4gdGhlIG91dHJpZ2h0IGlnbm9yaW5nDQo+PiBvZiB0aGUgd3JpdGUuDQo+IA0KPiBJIHRoaW5r
IHdlIG1pZ2h0IHdhbnQgdG8gZG8gc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZjoNCj4gDQo+
IHVpbnQ2NF90IHNpemUgPSBQQ0lfUkVCQVJfQ1RSTF9TSVpFKHZhbCk7DQo+IHN0cnVjdCB2cGNp
X2JhciAqYmFyID0gZGF0YTsNCj4gDQo+IGlmICggYmFyLT5lbmFibGVkICkNCj4gew0KPiAgICAg
aWYgKCBzaXplID09IGJhci0+c2l6ZSApDQo+ICAgICAgICAgcmV0dXJuOw0KPiANCj4gICAgIC8q
DQo+ICAgICAgKiBSZWZ1c2UgdG8gcmVzaXplIGEgQkFSIHdoaWxlIG1lbW9yeSBkZWNvZGluZyBp
cyBlbmFibGVkLCBhcw0KPiAgICAgICogb3RoZXJ3aXNlIHRoZSBzaXplIG9mIHRoZSBtYXBwZWQg
cmVnaW9uIGluIHRoZSBwMm0gd291bGQgYmVjb21lDQo+ICAgICAgKiBzdGFsZSB3aXRoIHRoZSBu
ZXdseSBzZXQgQkFSIHNpemUsIGFuZCB0aGUgcG9zaXRpb24gb2YgdGhlIEJBUg0KPiAgICAgICog
d291bGQgYmUgcmVzZXQgdG8gdW5kZWZpbmVkLiAgTm90ZSB0aGUgUENJZSBzcGVjaWZpY2F0aW9u
IGFsc28NCj4gICAgICAqIGZvcmJpZHMgcmVzaXppbmcgYSBCQVIgd2l0aCBtZW1vcnkgZGVjb2Rp
bmcgZW5hYmxlZC4NCj4gICAgICAqLw0KPiAgICAgZ3ByaW50ayhYRU5MT0dfRVJSLA0KPiAgICAg
ICAgICAgICAiJXBwOiByZWZ1c2UgdG8gcmVzaXplIEJBUiB3aXRoIG1lbW9yeSBkZWNvZGluZyBl
bmFibGVkXG4iLA0KPiAJICAgICZwY2ktPnNiZGYpOw0KPiAgICAgcmV0dXJuOw0KPiB9DQpUaGFu
ayB5b3UgdmVyeSBtdWNoIQ0KDQo+IA0KPiBOb3RlIHRoaXMgcmVxdWlyZXMgdGhhdCB0aGUgZGF0
YSBwYXJhbWV0ZXIgcG9pbnRzIHRvIHRoZSBCQVIgdGhhdA0KPiBtYXRjaGVzIHRoZSBSZUJBUiBj
b250cm9sIHJlZ2lzdGVyLCB0aGlzIG5lZWRzIGFkanVzdGluZyBpbg0KPiBpbml0X3JlYmFyKCku
DQpJIHRoaW5rIEkgY2FuIGtlZXAgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBpbml0X3JlYmFy
KCkgYW5kIHVzZSBiYXJzW2luZGV4XSB0byBnZXQgdGhlIGNvcnJlc3BvbmRpbmcgQkFSLg0KDQot
LSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

