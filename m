Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D4AB52D09
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 11:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119830.1465040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwdUA-0002o0-0S; Thu, 11 Sep 2025 09:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119830.1465040; Thu, 11 Sep 2025 09:20:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwdU9-0002mA-TR; Thu, 11 Sep 2025 09:20:57 +0000
Received: by outflank-mailman (input) for mailman id 1119830;
 Thu, 11 Sep 2025 09:20:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVGj=3W=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwdU8-0002m4-Q5
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 09:20:57 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2406::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d6402ad-8ef0-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 11:20:54 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Thu, 11 Sep 2025 09:20:49 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 09:20:49 +0000
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
X-Inumbo-ID: 9d6402ad-8ef0-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXBmDHkyhpG2/D11sf4H0IFpUsyomglLFxp4pUrP76QCjgn7bhShIKd+mdjmNsURpiWbCYwy8uL5kd2epubte6EuFYy6ZZkWg0Ebl6/jLoAg2700z4png5LtjpAKFDAx5Hyi/fFV2fkmWHhPSasJxX71173+xeVyAzOVIihm7mSLR1CIMYaWZb6p6E38Uu8jQ6YnCkTbtLRZhZOASG9QmUYYUDCFOKRF3bo7vTpp+IRWGCdmFwsXEizR1Td8+E3OGRggIWlqnt5XDbuoP1KUvSi2s4lvHaAO/7gCBq+1ZCESSvxydSdjQjUtli+Y4N9hcCEGhRbm0CSrWg+bbH4SsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sa6DXcd7FYmvoF0+8vlTtfuH1T4DMtYcPTZioNW9epk=;
 b=PMRS34/msLyk3nfw4/XE2qWA81Qu6fxjG1UlFP12YegZl8Mm6xVUPnPKy+6qj25dxmkVCEPOb0AS49kAF8rYaWCmH9ETcZ6fh9RmWu8sbCzDyItinqkRAhIw4a3UXtWRfq0hR0HgkI1OLDKcW4Mivr/AqnoYMLiYM/qiEtz89UBHBNIp2ALsRIh7EZdSFm2RiBaMZ+ddsPoHBTw9HKjfpvE6hoBvwMrcoDVHQfHLCi9g81S8EheTSQbRatVJURhpYfXCf6MNMmXXybWDxJyR1+2aT/Czc4q8SE5D0b91KG7nFWFfHmeZz+R47c7QFd2NOe/52lG4Thc1qXLUO2pvlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa6DXcd7FYmvoF0+8vlTtfuH1T4DMtYcPTZioNW9epk=;
 b=a4fRa93AVP8f4HI17G4Lk0dVssleUGmCxWkAn2czM6niEH8lBVw2aEK1nqP57o75Al68mIuNOhPI1kcWrKkDZO6FtsW57vqJG8y1WWC3vtMuLCWEUmU9vDOoHD1lyTpssRpLftSSYkdpHZ/2JyheAiqXXpRgUtW/fRSDJiaFHWQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
Thread-Topic: [PATCH v2 04/26] xen: consolidate CONFIG_VM_EVENT
Thread-Index: AQHcIiYDHxl9uXccpkex+vWb0p4h67SMggMAgAEx1KA=
Date: Thu, 11 Sep 2025 09:20:49 +0000
Message-ID:
 <DM4PR12MB84517E150D46E26EF2708B44E109A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-5-Penny.Zheng@amd.com>
 <b8430631-f857-426a-a144-c6b8fbf94ee9@suse.com>
In-Reply-To: <b8430631-f857-426a-a144-c6b8fbf94ee9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-11T09:20:43.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB7728:EE_
x-ms-office365-filtering-correlation-id: 22af94b7-f467-4b11-8a5d-08ddf1147f28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cmtkY29CWVREMXlIQzB3WWVBRmVVY1lTKzBJcVQwQ3Q2bUhWVDdMcCtqSGVn?=
 =?utf-8?B?dVRLc293YWlUdTN1WXRnS0NZWnZDeFdMRnNmd0ZhbVpVVmdZdzZWKzdlZkhu?=
 =?utf-8?B?QXBuWW1UNU5QaXlaYWRTVnV3UjE3MDc3dlBuempTNVhtblV6ZHRrZTZYVElD?=
 =?utf-8?B?UGxnMDZaZTBxMXltVGt6aTZQV29WSVJzMHJ3NjFJTmsrYWlxYldLeDJMakJm?=
 =?utf-8?B?OUJjRkp0dlNLeDZXMHdGcE1pR05uQ2MydTNodkErRXhSS0hTa1gyVGFKNzZU?=
 =?utf-8?B?cHQ1TVlqYi9CT0hTOWRiK2FVS3hYQU50eUx6bFZIRlY1WUtEMk5jOFJENGJo?=
 =?utf-8?B?ZC9QVm1ZVnBua0R6OXJoNTNva1FJVGQ2YW9FQXBSNDlpc2VSeWhqZ1JqY2hZ?=
 =?utf-8?B?Ui8rbVBOaWhIWmZGdWdGVHBvZ3I1ZGxMRlpORXVWZzU5eExNSG1XRXV0TEVR?=
 =?utf-8?B?N3lVek9Zc2dPdnhsMXZPY2JwaElCQ1pIeTl0Wm5ueURRWHRJeG42MzJYaksz?=
 =?utf-8?B?QkpOeTRhbW5iVG9ZTWlPQ1FIZWcyazg5cEJScVpqcnZ0WFZENWpVb0dNWXdm?=
 =?utf-8?B?d0FoeWNuM3huRVRQYll2U2JhZzVjNVhsV2VNeXFtcUY1dFpwMFlIT3BUYmFt?=
 =?utf-8?B?TXJUaUJQdk1wYkRsUk1kTzVqdGdISlNpTndVKzVzZUdFVFBGaGoyUUtSeVdi?=
 =?utf-8?B?cDh4QS9zVndpem5ybmJEekFGNVEzWElhWk15TDdEeGJ4bWdvQW1QQjkrcGxC?=
 =?utf-8?B?U1IwUHV2dW83NnplU0w3SlhXWkFESmk5eE4vb0ZWcmtCTFF3R0VuZ003Zkcx?=
 =?utf-8?B?V1B1aVNVN1lGZjl1UWZIQ0hoa21ScFRzSnArRmo3SjU2SU5jVWNuWDBUOUEy?=
 =?utf-8?B?ZUpuVmNXWXg4R1B1RmR2ZGxOYVA2WWF5bVFtOE5CT2UzS2hLWFlVK0d6dGRR?=
 =?utf-8?B?dUIxU2M5MnBJa1ZYOG45Z1lUWkQ1U1Y1Z3ViVis3UlN0QnI1VlpKSnc3RlJ6?=
 =?utf-8?B?TVE5eSt5dk1CcjBkTE93U2Y2OC9rbHBSQm9XTXJBRzV5dnp5bnZtN0Q1dzVM?=
 =?utf-8?B?NVlBdEVra0tLbmtscGR1N3VQaVJjdjVQM2pWUXlySUlyK2J3ejQ1QktpN0Vp?=
 =?utf-8?B?Qk8yekJKRFFvWnJFK1NJWmJ6Sk9odkJGbFBMaUFYYWxkQTkwSWVYcEFOMkNI?=
 =?utf-8?B?ci9qNWxLVmc0cE1oaWYyK2FUMTZCMWJPVlpmT2FHSzI1dTJnZnErSERIQk8z?=
 =?utf-8?B?NkJhRnRoZ0d3eFBTd2VHMDBnVmlIWTdhNDRod0Y4TURFNWFWc2VyZDVKUHdq?=
 =?utf-8?B?dHFlYlMrVnBIV3B1VWFOOHNYbXVBOERCZ0pRN2tlMDlnVzBDWDVjL3JBMEZY?=
 =?utf-8?B?M0MxdzJuZ3BlUWlYemkrdzcwZHE0VVJ2eXJSZW5BNlJWV3VEKzZkbEtFd3My?=
 =?utf-8?B?Q0FNc1A2VWhkOUR5Z2lyVnhWV3VDbmplUkg5d2VIK1o0VXZSSFoybndtZ0da?=
 =?utf-8?B?eGhXWUIzTy82NW90dHNFdmIraG5iS1l6eGJJRUxMM2NqNUVxRFdOdnpVd290?=
 =?utf-8?B?dVJUWHhzL2dUSDA5SzdGYkpJRDFHYW9NOGJuZTk2bEw5MHBHWEpsRFZiUDFn?=
 =?utf-8?B?MFBBQ0ljNm9jL2xnZ3B0QjRDN3RGbll1NEgwM2cycUhxVStlOVlYNG9ld2lI?=
 =?utf-8?B?Smg1aFdWQ1hqV3NwYlVaZ1pPSkRkWm9lQUU0Q0lKTGp1c0p1VTBTSER5WFNl?=
 =?utf-8?B?ajBZZjdrdytHUVVYZTBtU2dLbzh0dDIzMGdmOE05TGpiamE2TWRqQ1Q1Q1Fo?=
 =?utf-8?B?TjEzZ0Z6dGZsS3lpbDB1Y0lCRjd6aVp1SEpNMzJmVk9sMTZlMERPem9NL3Er?=
 =?utf-8?B?VWhRSlh2aU9NOEh0T1A0NlE2WmdYN24ycXJlVnVMNlZTT1RuQnhacmtlNHVz?=
 =?utf-8?B?ZHlaNmhONjlwdmJqVXdKWXVGbnZNT2Y5cERUamNCdU9uTTdid3E2a1JTYjlH?=
 =?utf-8?B?bmVhaXcyOFp3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d281SVJIV2FIcFM0NStRTHFGMUdZVG55OHdtQnQyTEhXcnJCWUk3NmVrb1g5?=
 =?utf-8?B?WmpNdTVUWHlHcnpmZ3lja213MU4wMDZhbkx3a0haYWlEQ2dnQmRXb0hxUmgx?=
 =?utf-8?B?ckZnVllObzFCOGhxTUpaMW0zTGdiZVpKemVCZmxVV3I4NW5reGYra0Q4ZnUx?=
 =?utf-8?B?Mmx6TjNaVUgrdWRVK2wwaEM1OVhCR0x0TWNEeWltenBoTjV5elYrbCt1cmYr?=
 =?utf-8?B?S1dackFZM0dsbndNU3RsNlF1R2NOdTh2ZEcvVTNpeW9KQUxLSG1NeWJyYjE1?=
 =?utf-8?B?dHFzcDNuYUtUUnZibktJbmlrVzkyQjAvYk93Y3M1MndjR0J4Qmd3NnVLL1NL?=
 =?utf-8?B?WldoTXYzWjUvVlRYWFQ4UHdiajNEOEE5dnl2VDdmUTMrMUtxNnVFdjZmWjhQ?=
 =?utf-8?B?aFZURGNKd1VLMk1lNjVMdEZmYmZXK29QLzVpYXJZUWdLWk9yRUgraWVkYzNm?=
 =?utf-8?B?M0J0Mm8zc2FHRlIrUXJ2ZEFOY3h2d3ZzeU12aWkyV2k4RTAzNmRGcjZHWVNn?=
 =?utf-8?B?MERtN2VySEtndXV4UkZvbmgxendGL1dlMEJpYk5vS0V0Y2NwNzZVem5ObitW?=
 =?utf-8?B?dXRaTzZVTWFacXVKOEJiM3BVaEZILzZRd1F4NEwzYUNyZU9BWEVqS3kxOFhU?=
 =?utf-8?B?cWFFUk9ndUFiRjhZQTJyQ25CcGdibEdTdFBxeDNpVDRKbzN3aW9BelZVMWNl?=
 =?utf-8?B?RkZBS2lrb3hZZkpTWnBjTHpidWtFWDdERmxaTHo3WFRBWVBiRGdkaFZ3TW1l?=
 =?utf-8?B?NVhwWnZrVWh6VU1qQW5JM290Zjl6M0svSjAxNDdpY29CWGovaGdpcWlTK2Ex?=
 =?utf-8?B?N2grbnJXRk5xeCtOUlI2T1Nld2Q1cnJGZmVLNmRzbEVIaU40TDlreDVIUWhT?=
 =?utf-8?B?MTliOWVjWmJnOWpycUVrM2ZaK0xkdmh3WWY3aWxZaUlNZUEvd0ZicVprdDZB?=
 =?utf-8?B?WEhLMDRzUUhPZms1TGdOMEJIempvV1VHUHhhdlloSzVFVEpNMk5lMU1iejlr?=
 =?utf-8?B?ZmNqbmFUbHZWaHVrWTNXazc0bitVZnNOUksvTnRSZDV5TGFsTUsyRU5Xa0tF?=
 =?utf-8?B?SzRRNmdnQXAwbUlOUzJoQVRZOGp0Y0dpUFhkckhDNW1SR3JWTFg3KzBEUjRH?=
 =?utf-8?B?d01YckNGSnRNVjUzRnQzT2h2MmZpZ0k2bWRuOHFFS0gwVGJoWFhTdnY5dzBH?=
 =?utf-8?B?ZlFvTTFpOVRQRDdTTWhrdWhjV3VGQjVhc1RGeDc0OFhVdmhlK09JRWpFRHZm?=
 =?utf-8?B?aXM2UXh1RkxjU3Y0UGkrMHB3WW5NVDk1UURzTE03MHIrTVlkNGkzSytSZ2Mw?=
 =?utf-8?B?VHNSc2p1SEM4ZFVUemJOY1o2QmRlZ0VKQ1pYYXlIazFZbm9HVFJVV0J0Qngz?=
 =?utf-8?B?UjVValNwTkxaY1pTb3JOcGIySDRFVFVaLzV1Y3ZTSUN6VTVCaFkrR0xYcWRR?=
 =?utf-8?B?VFgrbEVNb2VJMXZzZ2VXV2NHR1gxWGRRTWVrbDB3SGVVWGlyem9jdkw5dVhB?=
 =?utf-8?B?RDJ1Tlh5dkhaMlRIUDhWbCswWVp1VTlyZTB1c0dBbnYzd2xacWZ4ZFE4cFhj?=
 =?utf-8?B?b0dyU2NPVkpFc1A2ZENRMXJqTTVYZ0FFSWh1MmsrUmNjdVBWRUk2WnNYbGh1?=
 =?utf-8?B?M01pQ0tIVWxpNks2U0dDNi9uMUNYZWRyY05GcWhBNlhwdy81NTBuNDB6eGRT?=
 =?utf-8?B?cU9pNUN0azdPTDIvbTBlQ05EVzVvVGx0a0pmRmxEMGY2SUdZdGU4ZkJxUHZ5?=
 =?utf-8?B?M2V4V3NuVTRYRlVGRHRiWVJ5SjkxMVBOT0JFRllmQXRnenVSakp3bHB6QmRl?=
 =?utf-8?B?eHRSQ1Zrd091c2pQMlUwcUpHYUNCR3FMNFdEdUVlOGRIT21YUTh2dTFmQS9U?=
 =?utf-8?B?Yi8vSUIwSDVhY014d0IxaE5IT05CU3R5ZFlYbGJjM09sR201SHNUOUFkY044?=
 =?utf-8?B?SGcvVlQxK0lIODJPWDd5Nm1SaDhPbi9BOTJFMVY0ejBnTVovT2U2RHhkKzBv?=
 =?utf-8?B?bGhkQTh5eDlqSnNqWkd3bzVWSlNXVVBIMDNBZ1hJVFlVOHNoQ0FVa002eVpt?=
 =?utf-8?B?elNpbG83Q1NVNkRVK1UxTC9BZEJqM0dJWm14L0c2anRmelpIK3J2cnN1SGlE?=
 =?utf-8?Q?uVtg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22af94b7-f467-4b11-8a5d-08ddf1147f28
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 09:20:49.0726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ntTXM7jTGMFcC5L5vem1xT6vC/jz0H1vmEeQ7a4P5nW8zoxXRnVepPIGE/bq5izGbyMgmnJQaOyXzdq+MP6NIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDEw
LCAyMDI1IDEwOjU3IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
OyBUYW1hcyBLIExlbmd5ZWwNCj4gPHRhbWFzQHRrbGVuZ3llbC5jb20+DQo+IENjOiBIdWFuZywg
UmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47DQo+
IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPjsgUGV0cmUgUGlyY2Fs
YWJ1DQo+IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT47IERhbmllbCBQLiBTbWl0aCA8ZHBz
bWl0aEBhcGVydHVzc29sdXRpb25zLmNvbT47DQo+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDA0LzI2XSB4ZW46IGNvbnNvbGlkYXRlIENP
TkZJR19WTV9FVkVOVA0KPg0KPiBPbiAxMC4wOS4yMDI1IDA5OjM4LCBQZW5ueSBaaGVuZyB3cm90
ZToNCj4NCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vdm1fZXZlbnQuaA0KPiA+ICsrKyBiL3hl
bi9pbmNsdWRlL3hlbi92bV9ldmVudC5oDQo+ID4gQEAgLTUwLDYgKzUwLDcgQEAgc3RydWN0IHZt
X2V2ZW50X2RvbWFpbg0KPiA+ICAgICAgdW5zaWduZWQgaW50IGxhc3RfdmNwdV93YWtlX3VwOw0K
PiA+ICB9Ow0KPiA+DQo+ID4gKyNpZmRlZiBDT05GSUdfVk1fRVZFTlQNCj4gPiAgLyogUmV0dXJu
cyB3aGV0aGVyIGEgcmluZyBoYXMgYmVlbiBzZXQgdXAgKi8gIGJvb2wNCj4gPiB2bV9ldmVudF9j
aGVja19yaW5nKHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCk7DQo+ID4NCj4gPiBAQCAtNjgs
NiArNjksMjAgQEAgYm9vbCB2bV9ldmVudF9jaGVja19yaW5nKHN0cnVjdCB2bV9ldmVudF9kb21h
aW4NCj4gKnZlZCk7DQo+ID4gICAqLw0KPiA+ICBpbnQgX192bV9ldmVudF9jbGFpbV9zbG90KHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCwNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBib29sIGFsbG93X3NsZWVwKTsNCj4gPiArI2Vsc2UNCj4gPiAr
c3RhdGljIGlubGluZSBib29sIHZtX2V2ZW50X2NoZWNrX3Jpbmcoc3RydWN0IHZtX2V2ZW50X2Rv
bWFpbiAqdmVkKSB7DQo+ID4gKyAgICByZXR1cm4gZmFsc2U7DQo+ID4gK30NCj4NCj4gV2hpY2gg
Y2FsbCBzaXRlIGlzIGluIG5lZWQgb2YgdGhpcyBzdHViPyBJIHdhcyBmaXJzdCBjb25zaWRlcmlu
Zw0KPiBtZW1fcGFnaW5nX2VuYWJsZWQoKSwgYnV0IE1FTV9QQUdJTkcgYWxyZWFkeSBub3cgZGVw
ZW5kcyBvbiBWTV9FVkVOVC4NCj4NCg0KSXQgaXMgdXNlZCBpbiBodm0uYyB0byBjaGVjayB3aGV0
aGVyIHZtX2V2ZW50X3NoYXJlIHJpbmcgaXMgZW1wdHkuIEFuZCBpdCBoYXMgdGhlIHNhbWUgcHJv
YmxlbSBhcyB0aGUgYmVsb3c6IHdoZXRoZXIgd2Ugc3VwcG9ydCB0aGUgY29uZmlndXJhdGlvbjog
Vk1fRVZFTlQ9biBhbmQgTUVNX1NIQVJJTkc9eS4gSSdtIG5vdCB2ZXJ5IGZhbWlsaWFyIHdpdGgg
aXQgYW5kIG1heSBuZWVkIGhlbHAgb24gaXQuDQpJZiB0aGUgY29tYmluYXRpb24gaXMgbm90IHN1
cHBvcnRlZCwgSSBzdWdnZXN0IHRvIG1ha2UgTUVNX1NIQVJJTkcgZGVwZW5kIG9uIFZNX0VWRU5U
LCBtb3N0IG9mIHRoZSBiZWxvdyBzdHVicyBjb3VsZCBiZSByZW1vdmVkLg0KDQo+ID4gK3N0YXRp
YyBpbmxpbmUgaW50IF9fdm1fZXZlbnRfY2xhaW1fc2xvdChzdHJ1Y3QgZG9tYWluICpkLA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZtX2V2ZW50
X2RvbWFpbiAqdmVkLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYm9vbCBhbGxvd19zbGVlcCkgew0KPiA+ICsgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+
ICt9DQo+DQo+IFNhZGx5IHRoaXMgbG9va3MgdG8gYmUgbmVlZGVkIHdoZW4gTUVNX1NIQVJJTkc9
eSBhbmQgVk1fRVZFTlQ9bi4NCj4NCj4gPiBAQCAtODIsMjMgKzk3LDI4IEBAIHN0YXRpYyBpbmxp
bmUgaW50DQo+ID4gdm1fZXZlbnRfY2xhaW1fc2xvdF9ub3NsZWVwKHN0cnVjdCBkb21haW4gKmQs
DQo+ID4NCj4gPiAgdm9pZCB2bV9ldmVudF9jYW5jZWxfc2xvdChzdHJ1Y3QgZG9tYWluICpkLCBz
dHJ1Y3Qgdm1fZXZlbnRfZG9tYWluDQo+ID4gKnZlZCk7DQo+ID4NCj4gPiArI2lmZGVmIENPTkZJ
R19WTV9FVkVOVA0KPiA+ICB2b2lkIHZtX2V2ZW50X3B1dF9yZXF1ZXN0KHN0cnVjdCBkb21haW4g
KmQsIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCwNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB2bV9ldmVudF9yZXF1ZXN0X3QgKnJlcSk7DQo+ID4NCj4gPiAtI2lmZGVmIENPTkZJ
R19WTV9FVkVOVA0KPiA+ICAvKiBDbGVhbiB1cCBvbiBkb21haW4gZGVzdHJ1Y3Rpb24gKi8NCj4g
PiAgdm9pZCB2bV9ldmVudF9jbGVhbnVwKHN0cnVjdCBkb21haW4gKmQpOyAgaW50IHZtX2V2ZW50
X2RvbWN0bChzdHJ1Y3QNCj4gPiBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9tY3RsX3ZtX2V2ZW50
X29wICp2ZWMpOw0KPiA+ICsNCj4gPiArdm9pZCB2bV9ldmVudF92Y3B1X3BhdXNlKHN0cnVjdCB2
Y3B1ICp2KTsNCj4gPiAgI2Vsc2UgLyogIUNPTkZJR19WTV9FVkVOVCAqLw0KPiA+ICtzdGF0aWMg
aW5saW5lIHZvaWQgdm1fZXZlbnRfcHV0X3JlcXVlc3Qoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9ldmVudF9k
b21haW4gKnZlZCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHZtX2V2ZW50X3JlcXVlc3RfdCAqcmVxKSB7fQ0KPg0KPiBTYW1lIGhlcmUgYW5kIC4uLg0KPg0K
PiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgdm1fZXZlbnRfY2xlYW51cChzdHJ1Y3QgZG9tYWluICpk
KSB7fSAgc3RhdGljDQo+ID4gaW5saW5lIGludCB2bV9ldmVudF9kb21jdGwoc3RydWN0IGRvbWFp
biAqZCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5f
ZG9tY3RsX3ZtX2V2ZW50X29wICp2ZWMpDQo+ID4gew0KPiA+ICAgICAgcmV0dXJuIC1FT1BOT1RT
VVBQOw0KPiA+ICB9DQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCB2bV9ldmVudF92Y3B1X3BhdXNl
KHN0cnVjdCB2Y3B1ICp2KSB7fTsNCj4NCj4gLi4uIGhlcmUuDQo+DQo+ID4gICNlbmRpZiAvKiAh
Q09ORklHX1ZNX0VWRU5UICovDQo+ID4NCj4gSmFuDQo=

