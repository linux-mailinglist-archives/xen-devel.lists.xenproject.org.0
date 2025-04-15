Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6662AA89975
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 12:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952455.1347891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dCM-0000k7-8e; Tue, 15 Apr 2025 10:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952455.1347891; Tue, 15 Apr 2025 10:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4dCM-0000ib-4e; Tue, 15 Apr 2025 10:07:22 +0000
Received: by outflank-mailman (input) for mailman id 952455;
 Tue, 15 Apr 2025 10:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QN48=XB=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u4dCK-0000iT-1L
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 10:07:20 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2413::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6919900b-19e1-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 12:07:18 +0200 (CEST)
Received: from PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 by PH7PR12MB7283.namprd12.prod.outlook.com (2603:10b6:510:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Tue, 15 Apr
 2025 10:07:14 +0000
Received: from PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76]) by PH7PR12MB5854.namprd12.prod.outlook.com
 ([fe80::bd58:fa72:e622:dd76%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 10:07:14 +0000
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
X-Inumbo-ID: 6919900b-19e1-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DY20FHChHt3ULmhKmIvloLj05ewA+VvkaCABTZLFDgjZ/Tzs0LaMPJxr78PMB+fng33zb9g9mGub2KPS/Rv+UOsnft4E+KqNcE8W3jMkZoOKv5J5+HQFfZSp55JhpdfYDYOC8Ussc3apop0xvgMArEm/UA56z+VCLJPb9AFEEbJVrOJPIl9aOwDKWOK468JBH7jjwoQnaHz7PDRU7WpOlQrfB25lHiMbqUX3z86TmSVNn6EhLkTB8N3sD3lyzRXWRtEv7GKiU8WeSDwZRHsOoxvfUo9N8T5/mZMFjaXme4gRV4/cIl/QxsaCvkhymWiU20MpAMBodCDRGPPncYWLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYOjWiU60g2a07AsV7j0wwyduqrQKjoZR1glfNH/6NA=;
 b=xE1+QOLCfORtqHwEwopjVzmlXyuLQXPPsxb2Uz9CLAuXTggGAGRJBCQ/3Ui6GspmZjK5632iBcKbXW9dpgTj4xNDXjCMJURY496X/Qwt/xHQRF+BUpAPCE0FYDLvF0dHQOrrY7UiKCgnIrYuqrV4Q4rNIvs+x3W5UFKQ7BdNVSFiy6crgo/OksqKOaQ05MxbpBN1oPdcNew2PSdjg0UBzHsx5l8jte1D7kH3xaxsD/NbKbQ6DYOAyDoJoTu6hbOSe36fg+jhCQnS0beq+y0UYdDrU0LCeHxlVg7iv/AEoVc7eZglSv2uy5qf6d6sRFSuQU3UoGsR3TCOqoQiv0F+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYOjWiU60g2a07AsV7j0wwyduqrQKjoZR1glfNH/6NA=;
 b=CsLCGe1kUsHUfm5aefWFEFpbHv28tcEhos+x+YhWfFpWJ86TuM4aEgTHaFf75wbhaF1440af0DrczMCn+MpfjK9XfmdZ9CH71Tj6/GBrA8ZpTciSAC6mZW96Dzitwy0bhk7cbmAJur8kFrOURNYsZ64Nc2JCA00rs1Lk5CTff0U=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Thread-Topic: [PATCH v2 2/8] vpci/header: Emulate legacy capability list for
 host
Thread-Index: AQHbqRsaTINnyZcO4ESL6xMBZUfUtLOkfmYAgACPYIA=
Date: Tue, 15 Apr 2025 10:07:14 +0000
Message-ID:
 <PH7PR12MB58546CF210C99C8B835FFC4AE7B22@PH7PR12MB5854.namprd12.prod.outlook.com>
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-3-Jiqian.Chen@amd.com> <Z_4mAAm-gCmZTJub@macbook.lan>
In-Reply-To: <Z_4mAAm-gCmZTJub@macbook.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: PH7PR12MB5854.namprd12.prod.outlook.com
 (15.20.8632.030)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5854:EE_|PH7PR12MB7283:EE_
x-ms-office365-filtering-correlation-id: 3e7bce8b-d30b-41d8-8d5f-08dd7c054bf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QVp3R2trWGs0ZE90dVNVcVhWUnFGaGlhWWV3cXYvWm81c29vMXROUEVOazFH?=
 =?utf-8?B?L0tuOEpjOXp1ckxJZWtadTVjdHdFS09zVzk1YllnNnJ6Y2U2Z2VEQmhYbjcz?=
 =?utf-8?B?RFdxelF1YmRuVW84RlIyYXRyaENTd2xYbWpNOEtFRW9ueFpyQkQ0Mi9uMFpG?=
 =?utf-8?B?bVRFeVFFRFE4ek04cWYwMkhJTVprbFNWVkxjMGlXd2FFRUc5T3JwNTdKL1p6?=
 =?utf-8?B?OFJqQktzREdHVGQvVDQ0SXRFMHJmZWNJV2JEd2VQeGNuWHNJVWR3WjVlcFJj?=
 =?utf-8?B?WDVvS0l6VXFFeE1xb0xSdk4vVHZ3bTJ6ZmQ1WnVDQjcvV1pXa3lpYmMwbXlk?=
 =?utf-8?B?WjNqYjU3R1Y5MnErcTYrRkhLQmowanNNbDhydVF0ZXNId3BXY0w2dkNZM251?=
 =?utf-8?B?WTBPbkw2QUF3aUdHc1pZMlVXTHRQTlk5YkkvNCs0ckRrdzNNZGFHZ0FpRVZT?=
 =?utf-8?B?NXBlaGxHYUhON2NqNjJBVDYwMjJVazRDNlkyYkFTbGpCYnY4UVBJdW56MEZk?=
 =?utf-8?B?NmQ2NmlwNkFKNmdDK1FRQVo2YTdyUm9GSkpEZ2RyTExIb0todzd2c2VjVzEv?=
 =?utf-8?B?TUVRT3krTEtNVS9ZUWloYXhNZkFXUkhSSWU2Y3ZFenNzc0FOeU1MMjI2UVBi?=
 =?utf-8?B?RmV5TE1JVlhBVzBLWHo1dDBESldXK2FoU0RZa25pTGRYNnVSdjJwNGU4dTdl?=
 =?utf-8?B?bFlxRTl2SHdBalMrWnZzazE2aDlDSjJ4eEJPci9rQi9VVmJMcDZlcnpwSkpm?=
 =?utf-8?B?bjArd2ZQREpOTE9QYnhwWHlSN1QxTUZVdzl4amNuK0VpZzdkbmVvZ00xNXMz?=
 =?utf-8?B?VFlMTmtxSjFRM0lLVkQrbFRhUGJUdVN4WmxFM0FjVHJIQ2NRTE5oNURGYW1k?=
 =?utf-8?B?Um9Kb3duNWtBWTdVVEs5YVRBa0hJQ3BFYnNicVRhdmtoZndLNFFraDgyRHVz?=
 =?utf-8?B?RUdTNXVtaUNjZzNpQ1E0RXZFSG84dGJvaExCNnNCK0VJbTNPeVJpblJSMjJL?=
 =?utf-8?B?aTMvcjQ3dWRzdDFRMVhRclY4L2FDOFo0c0tDMk02MXhHQlA0dDF4ZFpLQ0JZ?=
 =?utf-8?B?RlB6NFlPcmdnNG1MN3hTWm1GSGx3dm1BN3lSUC9FTi8zQTg4NWZXQXpHd05F?=
 =?utf-8?B?TG8xRkVzVENOdC9aSEsyTnhEWnc1NkNRdDFEelY4amFzT0NNTVZJcWwvQlV1?=
 =?utf-8?B?Um9hc1c3SjB2U0dEcGI1RGlkYUcxdDdSaEg1Z3B6dnkvdDIwZ0Z0dXFNR2sr?=
 =?utf-8?B?bW1ublA3bHA5Z0dDUnUwYlBsWjZwNkt4TWtPbytEOXBOQjBHTEJkOHpDM1Iw?=
 =?utf-8?B?MS9EbWlzeUV6bDBjUld5NXFyYmNTbHdMblhBa3o1OS95S0FZRlJzQlcraHBB?=
 =?utf-8?B?WXpZRU0yWXpiNThZdS9JWGtGQmJZSTl3bVMwODRkVjNOWXFMb0RMRmlianZt?=
 =?utf-8?B?aGo2WjFIdzQrNGZrQ3k1SWNXcFY1Nm5hdnV3S3VLTUNhMmZ2WTZoRGdxcm10?=
 =?utf-8?B?RHpyL2tuVEpSSXFIRjRXdzY3Y1VjOVp2TDhXbHlxM3NUbjArQUNLOUNZcTNS?=
 =?utf-8?B?R1ZnREdTVjBBZWtiY29nQ0pyMTVTN3RDZ0pZMDQyN1lsdFBmSzdQSUFwejRq?=
 =?utf-8?B?cUE3bEg3WU95N1o5V1JMQmxlaUFYUS9oL0x3dGpoTW03V3YyNzkzWmsxcW4r?=
 =?utf-8?B?ZXo1M3BvLzZ5cDMwR1VHSU1YZjFqSDdnMWJUN0F5QWkzMkNBZmZQMnk1ODNH?=
 =?utf-8?B?WEY0clBUS0VId2lVZklOWXowNEdrbGtqRXZrVGlwSC9aR1hMNWVvVkdDUXU5?=
 =?utf-8?B?d3hLalhtcGV2QkM4Q1NJOS9scXV6UVpqTVNqamwvY1JtN1dFNVo5NmhYc2U2?=
 =?utf-8?B?Y0dmRkZqSzhaZXNEWmFoejJKNGlIRkd3Wmp4TEI1SlN6TGJ2WWJMa04xTWdM?=
 =?utf-8?B?TVNtS2ViNDkrR2Z6Kzl5bDN4RzlvNnU1TjUybjloUlE1RFV1SncrRHJmMldy?=
 =?utf-8?B?SDQwNVN5Wm1RPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5854.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1FYVjlHOCtNRWtJNkp1MlV5d0k3VlNibzRMbFV6VkRweG4zV3NhZ3ZST2NV?=
 =?utf-8?B?TUdyUVZ6c1V5bDJobmxwdVR4ZE13YjJtY2pkS2c4ZmJwSlpzVmttajl1UVNl?=
 =?utf-8?B?MkNiUXRJeEI5dHJzcWM0Q3FvZGhtbjErTjVVNzBRWTd0cWFKR0xmTW8wM1Ft?=
 =?utf-8?B?V1Z3c1NaelRjazJTVjNZOGthTjFqWUZPaFlyRlRRRFR5NytUUGtUanNPZWkr?=
 =?utf-8?B?TUlQdlJ2b2E1V2lwTSt6NDR0MXcrSkFZa3NRRFBtVndVMG1qeFd5aVFsb0lR?=
 =?utf-8?B?SDNkNkJFWmxHTmcrU2h4d1JuOGo0TGhheFo0Ylk0U0VoVStHVGp3R3EwZ08r?=
 =?utf-8?B?K0FGWVFxSXhxZnBIaitZWFZMZ0xpOUl1WFFrM0hJdVdBdVpNSThsMEtsVWpi?=
 =?utf-8?B?UXZ1SGVWZ3R1K2VTbldmNWlSRElyZTJZQlR3OUhYZXZLaWNhRXQrMG5OZTcr?=
 =?utf-8?B?L05qd0xlbnhXUVhnZWVOdXFqMTd6dHI1M3Y1ZXBnb25OWmhXa0VUc1lFNEdk?=
 =?utf-8?B?SVZpdVZKWUVkU0xPeE80dFRWbCt2OURiVDJKWjVaVjErd1ZFWEZkS0tzemVv?=
 =?utf-8?B?ZzlEZDUzVXZVbnlocE5qREhFZ2I3OEovdUVkNzVqcFR1RlZUQ1dZUWwzZVpP?=
 =?utf-8?B?aGNIKzFSaDZXVE0wMHZsZDZXWVJkNEJ6MEVjM1Yzd3E4cDlld0lYREJYNmVX?=
 =?utf-8?B?UTlxUy9oUC94bkc3WGc1M3IwQjRBdXVIUllNclYwUHRsbk1XWUtYelk0Mm5C?=
 =?utf-8?B?c09tbXVrWjFVVFgwRGx6V0NQSkY3alVqTXJCWldFbFNrS0R2WEVKUDUrVDNY?=
 =?utf-8?B?MGsvZm1qWVpsSGZHZHBLK2hmY2kxeWpGTERtRVNXSjQ0QWJWemRBMzkvSVVx?=
 =?utf-8?B?eEJYK3dWMkJJZ1Fkc3U0U2ozcEhnVmJLem5VWjdUUldIYkRST21mUWkrQitF?=
 =?utf-8?B?MlhrcUh3VFc1a3hsSm9vSzJSZDdJRHU1K29vSFVVSzhOUWFRL1BNT0I3M0pP?=
 =?utf-8?B?MFFHbWI3dlc1R1doWE5UMGJxN3BITDAzZWlYU0hWQUNmRDVQZk1iVFUxT2pN?=
 =?utf-8?B?dk02VWk3TU9iVTd1NjBSdmdMS2MvYVpSMldCblFZamVITE4wSW1sV2ttbkFV?=
 =?utf-8?B?STV2bnBxYVozOGxKQVVqWnUwOXZFRG84dDhlR0didDZLWjBQa0g3ZnYzamNF?=
 =?utf-8?B?V2xjeDZ0RGVGL1hjeWxtbEYyL0JDck9DeFZhSlVTYW85UVlkUUZ1bnN6a3VN?=
 =?utf-8?B?bXBVNTNpK0xKMnk3WEZZV3RQS3BOcHJ5NEVMdDF4bE90b3pLQzRQd0lPRUFu?=
 =?utf-8?B?ODdvdVhxeTJvbFpmR0ZreXF4cC9ZeTRTOUJPbVNJVEh6a3ZRUWtoTjZKOW5w?=
 =?utf-8?B?cFdEQXJ1bWZ0R3FYYW5wZXIzVk1GaW02ZVlzYnVLYUlCcEU1eVA3YUl3T0hp?=
 =?utf-8?B?NXJzODY5Nk8yM3h5aVB2RTJYUnpCTnhDOW5rOUxraWtTUU5mWkRmUUFMYS95?=
 =?utf-8?B?Ky9ndWRjbWJsR2tMaGQxbW02bDd1b3h6bSs3VXdnVlVqL2NYZ2NSc2tYQ0Rp?=
 =?utf-8?B?MDFjYmxlZWJUMTVMU0tDblBtcmRXWmZMZWxmVTBMOUc4cnFCQ1hTVTFmdW9H?=
 =?utf-8?B?WUxESUhYUDFIdnRXUEorOVJsQjFDMzYvdnlOTG1uNXdyZWJJaVRRVWVFc25T?=
 =?utf-8?B?aVZGbHBpVnlTS3N6SlllR2hnVDEzRTA5eCtzQ1d4ZUJwY0FCanRrKzVpWjFJ?=
 =?utf-8?B?dkh5NE8wZVFEZ1lyenp0d2ZUNE40V1cyQjFXK2kyZGZDNnRNdGN4TzVRZUtr?=
 =?utf-8?B?ZFNxRDYwRUxhSTd0b25RQWVKSkZlV1JVdEVEaGhYU0h1UWJaRXhEV3F3a2w4?=
 =?utf-8?B?SDVxRnRZQ05qZDIrNUhUTjlaN2IvV1Y3dHE1VnVISmc2OVQ3Q21DRkxvMXVa?=
 =?utf-8?B?YTMwdUhPWDdieUd6cHFPVC80R3F6U2VlaEFKd0ZNT0pWQ2NqaUpIdXNkSlcy?=
 =?utf-8?B?UXgwTnMydGhaWDNXTXRuYzlxTjNQVnF6NXQzMjc5TXo3YzdnWXdXNTduSEx6?=
 =?utf-8?B?bkRXb1FXMWxJRnpaaWVuZTlkN0llV0taVlZZOG9vN0xNQzNibExEVlphQ2Qz?=
 =?utf-8?Q?YCUI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD30199974ACEA43B8DA8DF7E0D3AC49@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5854.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7bce8b-d30b-41d8-8d5f-08dd7c054bf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 10:07:14.7097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ey9OF6WKBoGFF9OzXyHiwIiI/9BsK0tIcMo3Zo6lrDV2VZ+Vlhwu9bD1lKhkmv3DSFI3hEm/80XRxzWKqD+NeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7283

T24gMjAyNS80LzE1IDE3OjI1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBXZWQsIEFw
ciAwOSwgMjAyNSBhdCAwMjo0NToyMlBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IEN1
cnJlbnQgbG9naWMgb2YgaW5pdF9oZWFkZXIoKSBvbmx5IGVtdWxhdGVzIGxlZ2FjeSBjYXBhYmls
aXR5IGxpc3QNCj4+IGZvciBndWVzdCwgZXhwYW5kIGl0IHRvIGVtdWxhdGUgZm9yIGhvc3QgdG9v
LiBTbyB0aGF0IGl0IHdpbGwgYmUNCj4+IGVhc3kgdG8gaGlkZSBhIGNhcGFiaWxpdHkgd2hvc2Ug
aW5pdGlhbGl6YXRpb24gZmFpbHMgYW5kIG5vIG5lZWQNCj4+IHRvIGRpc3Rpbmd1aXNoIGhvc3Qg
b3IgZ3Vlc3QuDQo+IA0KPiBJdCBtaWdodCBiZSBiZXN0IGlmIHRoZSBpbml0aWFsIGNvZGUgbW92
ZW1lbnQgb2YgdGhlIGxvZ2ljIGluDQo+IGluaXRfaGVhZGVyKCkgaW50byBpdCdzIG93biBzZXBh
cmF0ZSBmdW5jdGlvbiB3YXMgZG9uZSBhcyBhDQo+IG5vbi1mdW5jdGlvbmFsIGNoYW5nZSwgYW5k
IGEgbGF0ZXIgcGF0Y2ggYWRkZWQgc3VwcG9ydCBmb3IgZG9tMC4NCj4gDQo+IEl0J3MgZWFzaWVy
IHRvIHRoZW4gc3BvdCB0aGUgZGlmZmVyZW5jZXMgdGhhdCB5b3UgYXJlIGFkZGluZyB0bw0KPiBz
dXBwb3J0IGRvbTAuDQpHb3QgaXQsIEkgd2lsbCByZS1hcnJhbmdlIG15IHBhdGNoIGluIG5leHQg
dmVyc2lvbi4NCg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hl
bkBhbWQuY29tPg0KPj4gLS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCj4+IC0tLQ0KPj4gdjEtPnYyIGNoYW5nZXM6DQo+PiBuZXcgcGF0Y2gNCj4+
DQo+PiBCZXN0IHJlZ2FyZHMsDQo+PiBKaXFpYW4gQ2hlbi4NCj4+IC0tLQ0KPj4gIHhlbi9kcml2
ZXJzL3ZwY2kvaGVhZGVyLmMgfCAxMzkgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgNjUgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4v
ZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiBpbmRleCBlZjZjOTY1YzA4MWMuLjA5MTBlYjk0MGUy
MyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+ICsrKyBiL3hl
bi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IEBAIC03NDUsNiArNzQ1LDc2IEBAIHN0YXRpYyBp
bnQgYmFyX2FkZF9yYW5nZXNldChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgc3RydWN0IHZw
Y2lfYmFyICpiYXIsDQo+PiAgICAgIHJldHVybiAhYmFyLT5tZW0gPyAtRU5PTUVNIDogMDsNCj4+
ICB9DQo+PiAgDQo+PiArLyogVGhlc2UgY2FwYWJpbGl0aWVzIGNhbiBiZSBleHBvc2VkIHRvIHRo
ZSBndWVzdCwgdGhhdCB2UENJIGNhbiBoYW5kbGUuICovDQo+PiArc3RhdGljIGNvbnN0IHVuc2ln
bmVkIGludCBndWVzdF9zdXBwb3J0ZWRfY2Fwc1tdID0gew0KPj4gKyAgICBQQ0lfQ0FQX0lEX01T
SSwNCj4+ICsgICAgUENJX0NBUF9JRF9NU0lYLA0KPj4gK307DQo+IA0KPiBJcyB0aGVyZSBhIHJl
YXNvbiB0aGlzIG5lZWRzIHRvIGJlIGRlZmluZWQgb3V0c2lkZSBvZiB0aGUgZnVuY3Rpb24NCj4g
c2NvcGU/ICBTbyBmYXIgaXQncyBvbmx5IHVzZWQgYnkgdnBjaV9pbml0X2NhcGFiaWxpdHlfbGlz
dCgpLg0KQmVjYXVzZSwgZm9yIGRvbTAgSSBkb24ndCBuZWVkIHRvIHBhc3MgdGhpcyBhcnJheSwg
c28gSSBuZWVkIHRvIHNldCBiZWxvdyBwYXJhbWV0ZXIgImNhcHMiIHRvIGJlIE5VTEwgb3IgZ3Vl
c3Rfc3VwcG9ydGVkX2NhcHMgYWNjb3JkaW5nIHRvIHRoZSB0eXBlIG9mIGRvbWFpbi4NCklmIGlu
c2lkZSB0aGUgZnVuY3Rpb24sIEkgY2FuJ3QgdG8gZG8gdGhhdCBzaW5jZSAiY2FwcyIgaXMgY29u
c3QsIEkgdGhpbmsuDQpEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnM/DQoNCj4gDQo+PiArDQo+
PiArc3RhdGljIGludCB2cGNpX2luaXRfY2FwYWJpbGl0eV9saXN0KHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQ0KPj4gK3sNCj4+ICsgICAgaW50IHJjOw0KPj4gKyAgICBib29sIG1hc2tfY2FwX2xpc3Qg
PSBmYWxzZTsNCj4+ICsgICAgYm9vbCBpc19od2RvbSA9IGlzX2hhcmR3YXJlX2RvbWFpbihwZGV2
LT5kb21haW4pOw0KPj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgKmNhcHMgPSBpc19od2RvbSA/
IE5VTEwgOiBndWVzdF9zdXBwb3J0ZWRfY2FwczsNCj4+ICsgICAgY29uc3QgdW5zaWduZWQgaW50
IG4gPSBpc19od2RvbSA/IDAgOiBBUlJBWV9TSVpFKGd1ZXN0X3N1cHBvcnRlZF9jYXBzKTsNCj4+
ICsNCj4+ICsgICAgaWYgKCBwY2lfY29uZl9yZWFkMTYocGRldi0+c2JkZiwgUENJX1NUQVRVUykg
JiBQQ0lfU1RBVFVTX0NBUF9MSVNUICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdW5zaWduZWQg
aW50IG5leHQsIHR0bCA9IDQ4Ow0KPj4gKw0KPj4gKyAgICAgICAgbmV4dCA9IHBjaV9maW5kX25l
eHRfY2FwX3R0bChwZGV2LT5zYmRmLCBQQ0lfQ0FQQUJJTElUWV9MSVNULA0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjYXBzLCBuLCAmdHRsKTsNCj4+ICsNCj4+ICsg
ICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9yZWFkX3ZhbCwg
TlVMTCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0NBUEFCSUxJVFlf
TElTVCwgMSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQgKikodWlu
dHB0cl90KW5leHQpOw0KPj4gKyAgICAgICAgaWYgKCByYyApDQo+PiArICAgICAgICAgICAgcmV0
dXJuIHJjOw0KPj4gKw0KPj4gKyAgICAgICAgbmV4dCAmPSB+MzsNCj4+ICsNCj4+ICsgICAgICAg
IGlmICggIW5leHQgJiYgIWlzX2h3ZG9tICkNCj4+ICsgICAgICAgICAgICAvKg0KPj4gKyAgICAg
ICAgICAgICAqIElmIHdlIGRvbid0IGhhdmUgYW55IHN1cHBvcnRlZCBjYXBhYmlsaXRpZXMgdG8g
ZXhwb3NlIHRvIHRoZQ0KPj4gKyAgICAgICAgICAgICAqIGd1ZXN0LCBtYXNrIHRoZSBQQ0lfU1RB
VFVTX0NBUF9MSVNUIGJpdCBpbiB0aGUgc3RhdHVzIHJlZ2lzdGVyLg0KPj4gKyAgICAgICAgICAg
ICAqLw0KPj4gKyAgICAgICAgICAgIG1hc2tfY2FwX2xpc3QgPSB0cnVlOw0KPj4gKw0KPj4gKyAg
ICAgICAgd2hpbGUgKCBuZXh0ICYmIHR0bCApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAg
ICAgdW5zaWduZWQgaW50IHBvcyA9IG5leHQ7DQo+PiArDQo+PiArICAgICAgICAgICAgbmV4dCA9
IHBjaV9maW5kX25leHRfY2FwX3R0bChwZGV2LT5zYmRmLCBwb3MgKyBQQ0lfQ0FQX0xJU1RfTkVY
VCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhcHMsIG4s
ICZ0dGwpOw0KPj4gKw0KPj4gKyAgICAgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRl
di0+dnBjaSwgdnBjaV9od19yZWFkOCwgTlVMTCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBvcyArIFBDSV9DQVBfTElTVF9JRCwgMSwgTlVMTCk7DQo+IA0KPiBUaGVy
ZSdzIG5vIG5lZWQgdG8gYWRkIHRoaXMgaGFuZGxlciBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiwg
dGhhdCdzDQo+IGFscmVhZHkgdGhlIGRlZmF1bHQgYmVoYXZpb3IgaW4gdGhhdCBjYXNlLg0KQnV0
IGlmIG5vdCwgSSBoYXZlIG5vIGhhbmRsZXIgdG8gcmVtb3ZlIGZyb20gY2FwYWJpbGl0eSBsaXN0
IGluIG5leHQgcGF0Y2gncyBoaWRpbmcgZnVuY3Rpb24gdnBjaV9jYXBhYmlsaXR5X21hc2soKSwN
CnRoZW4gSSBjYW4ndCBzdWNjZXNzIHRvIGhpZGUgaXQuDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIu
DQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

