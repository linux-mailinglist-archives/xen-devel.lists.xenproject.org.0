Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51610C6CF35
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 07:34:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165439.1492207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLbkn-0001NG-47; Wed, 19 Nov 2025 06:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165439.1492207; Wed, 19 Nov 2025 06:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLbkm-0001KH-Tu; Wed, 19 Nov 2025 06:33:20 +0000
Received: by outflank-mailman (input) for mailman id 1165439;
 Wed, 19 Nov 2025 06:33:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2o4X=53=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vLbkk-0001KA-Tg
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 06:33:19 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ddf9b59-c511-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 07:33:11 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ2PR12MB7822.namprd12.prod.outlook.com (2603:10b6:a03:4ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:33:07 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:33:07 +0000
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
X-Inumbo-ID: 9ddf9b59-c511-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsMQtMkZlE/S18M+cCe8Eumz6f0NnmWhO9SAApTahnPwtMi7kLUY+CCavnqKngKNaymcQ9wqAAipfLseFZiv/jhTmCxo8L4D2TcpR6OoiuFLFXzi7537IxkOGFcdcjMHLiwmspmQgGgThEhoje3YVW/kxSL1d98iqfjeXVpvGylHOujxLrekVFbvgbnylnaKLq1Q+AARtB6xZH7fb0VkkQoTYq+MI8uvZL0rripL99o+02bGxy/cspO6UNeU6v3vTMbGiGr9L22a4fwTdRFUaFCYry2aHjc7Nq562Cxq0QialFlnXTJ2eP/gZ1M5HN8aUbGSebZmn1KnXUc++KNKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3D5I2cjDZkrfjxg83NW3W+Uotkierky2lVnqaC9+MwY=;
 b=B8UGc0OAwa8tZTh4Aw5GAQUnnrqVQ13GvO8sh5rdkqKo+j4YWiPhEV1TQOfMxU+wzufjUA+PsjVGSqUiOq4W+8hX5XoOZBxY0Oc9GanlDJ/Gh51IYyC2FGrXwNP9w9qqns6E0curFo+hv01ozbiRuWGBMyFTOPozfow5XwUJPzJhhbEc8FOY02gAbyYgxoYmgSZFqdKWaxrJ3dhks/xDG6yLZj+e7kblxCvtIloD7ODYXp7gZ6n5j0sPQb+fq1mXO/+zmj9qXNg9LkVJhDZWf5BAokiX9ImWWpXgK+ekAyZbWXhBvv/7fFCpXau25ejg+coPfNItYHQ7csU2tyj0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3D5I2cjDZkrfjxg83NW3W+Uotkierky2lVnqaC9+MwY=;
 b=z+SYMrT8M7llktpjPUXKqFSQ339UmgyztjedwqBnfXnt0LGeKlLpMwfRdrOLdD9se4cBcH95RwCTKNMM/ednBSHgNsQ0YCOnw2GMwwf3QPyvDbJZhjhUjAUI38zH6yE33cMdvrnICSuCZm4obU4ONObupzuLPuMTCpfREXmH8oI=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-devel@dornerworks.com" <xen-devel@dornerworks.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Nathan Studer <nathan.studer@dornerworks.com>, Stewart Hildebrand
	<stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <gwd@xenproject.org>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: RE: [PATCH v3 05/28] xen/sysctl: replace CONFIG_SYSCTL with
 CONFIG_MGMT_DOMCTL
Thread-Topic: [PATCH v3 05/28] xen/sysctl: replace CONFIG_SYSCTL with
 CONFIG_MGMT_DOMCTL
Thread-Index: AQHcPCp8W9F3cPi2vkONW8in9Aw31LTZvQMAgCAHPaA=
Date: Wed, 19 Nov 2025 06:33:06 +0000
Message-ID:
 <DM4PR12MB845114DC191DA5B7DBA29846E1D7A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-6-Penny.Zheng@amd.com>
 <fee691ec-6bb9-429e-aaed-4fd007cbc0b1@amd.com>
In-Reply-To: <fee691ec-6bb9-429e-aaed-4fd007cbc0b1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-19T06:32:58.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ2PR12MB7822:EE_
x-ms-office365-filtering-correlation-id: b2503c37-ea96-43a5-744b-08de27358022
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?cFZ4TUNQcGU5MGtFV09JaSsyalhWM1ZPbENzUDBWTlh0SmkzQ3lnZnBmRnh0?=
 =?utf-8?B?TVU4b2FaNHFqUk5INCszSGdRYWx5Qmx6RStsQWRLcGhwTUtsNjloWGlIcmxK?=
 =?utf-8?B?NVdDSm1nZUtoWSt0cDVqak1XTEY1SVNlb0hRenlUdEVDZ3l0WGNEakFOTEMy?=
 =?utf-8?B?dVdqc3ZLVEhLSWU5NHdIelB6bkR4UWJEUi95WlNpT0Ixb2pJUzFZcmRxNEhl?=
 =?utf-8?B?MXJnc0ZTN1FJLzJnYklQeEQ2NlJjemFneDhqUWlkL0F4dmpSUWJUSlJSZHRn?=
 =?utf-8?B?NmtEUFdRRDY3ZzVrcXgxTWNmZVQ3ZUxBbjdTNEJ4ZUptTE9nM3h0NG5hNExQ?=
 =?utf-8?B?b3dmOGpvRUdZbjZkOENZeS9kODFwUHlEOE5Ub29LbC90cFROTFVWU3puQVh5?=
 =?utf-8?B?REszWVRwb2FLUFRIL0hvMUlCSVE3ZTlteTNDUnFlLzBNUkR3MEQzSWpCQzUv?=
 =?utf-8?B?RHhYeXh2bWNhOTB2VEJVZXdiY09GblJadSs2VDU5elFVc00wbkVta3hVT2I5?=
 =?utf-8?B?ZlMwM3ZtQ254RzdoWU1HSzIrR1IvZzJYLy9XZGRXbE83MTBVQTJXaFJOZSth?=
 =?utf-8?B?YzBGaGJsajhZZFBNdXFLQ1owcHF6U0JsL0RWeXB1VjNuM0hGNzdZYVdzcjBF?=
 =?utf-8?B?YVQ4TWlRY0JDbXNPZDJLKzV3NEdrcjh3SEl3cllJRG1OMTJtWjBuWHNXV3V2?=
 =?utf-8?B?eHpPSlU0OHVJVXZ4VUs5V01JN0poVTR1RVRHSFBEbmhJRmRSa3N5Q0g1SWdG?=
 =?utf-8?B?dGFFWU9VVnlWMFpQVG5ieFh0ZWVpTDkxTEV4Q01KdldPblY3NjQvU2dBUi9D?=
 =?utf-8?B?SXBCM2dianNCS3dqYnpQd215L1JHUGRqZDZBTGsrc1hYS3dxU1VIZTVaMXhs?=
 =?utf-8?B?S2FpYks0aHVaYk96RjdzNVNsaUoyWC8xT0dIZzk1Q1JvNDRSemN5N0h6OGhn?=
 =?utf-8?B?VGtabDRsanJyRHlXWEVqTlYvUE5BNWFlbTE4YUtzdkp2RFNGK3NzTjRPcXhK?=
 =?utf-8?B?MWlyMzYrOHN0UTR3VGtFTnhSV2lIL3ZFNmoyNEY4S2RxTk1HaEd1T2tJem1G?=
 =?utf-8?B?VG02KzVId1dJR09FR2dncldXWWlDZVB6ZERNNjk0STdIK01FOVJWbUhSTmp3?=
 =?utf-8?B?Tml1TDcxTlFSLytMR2kvQWZaRzlvTFgrb3Z0R0RhNFdYOFRpZEdlODhaVlNK?=
 =?utf-8?B?Nkl1ODBPemVMK0lWTzJORG5VR3VXRlV1emNxSlBQZit6ZHdsN1k1ZkhmZzBi?=
 =?utf-8?B?L3grNDFSNXhuYUN3YlVaRVBZMlJlMGVhdmN2OVhnQml6MzA5MGkwODc0WTJV?=
 =?utf-8?B?dll4cFlPdksrTExFeXZMYmJOeGlkRXlnVVBFSHhhdjAzajA4dThnNmQxYWNE?=
 =?utf-8?B?ci9tM2I0TW04bHlXK1hqeGlZWmdVYXhNc2FESkhXMkZHanFCWXpRczMzZ2xE?=
 =?utf-8?B?WG9CRE9QU2s2ZUJtZGF0SmtyNXVhN0VZb3RLS3NpdzB3ZTJXWTRpMllBb055?=
 =?utf-8?B?S3BDbGlnNUk4OVh0R0U1OGwySi8vdXVtY1JiUWw2aWFibk5DaW5CTzRrWXd6?=
 =?utf-8?B?QWc2RldObDdaK21ZK2RkbmZFN01wY3VGa3o3UTVoalg0L21MdzcyR3NMMmZw?=
 =?utf-8?B?czlVY1RZaU4xUVIwTXpuL2d0c1hSay9lUEJiRVc3WFltYng0NFJkb2pXNW95?=
 =?utf-8?B?S3ZyZkMxNlRielFndG1RSVB2V3J2MFlmVm5wVjhRVTdqVXptUytZVVVlK0th?=
 =?utf-8?B?Q2FyWlpOeG5paHlzRWhsQnZ5d0sxcnppRVlCeUNnUkxNUDRXaitnbXZ6UFF1?=
 =?utf-8?B?UDZXVlVhcVA1RGdMQUt3dExPdUUyR1FHa1hhV0pBVHdKNWlOcmF0blhBa241?=
 =?utf-8?B?V2tlTmpEM25kNUxuY0x1TCtiQWdLMTd3WlRpL1VrdFBXSVdsZlhpYmJlN3ZN?=
 =?utf-8?B?MmxyTFBRQkVZRUpOSTJCRk5rR2Y4NnF0eXhoRmxVcXY4VUNkbnlNc2QyYzI3?=
 =?utf-8?B?d1N2cDNoK0FpbmdnTDVqenZ3cmJuUkdhRG9UbEhaY2VKZEFKVGNhSkUwSWJp?=
 =?utf-8?Q?uoK/ds?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cStIU1FINnVkSVlsN054ektOcjArSzhHTEpPdmZQcDFZRGtXYzNHRFBQN3dv?=
 =?utf-8?B?dXBzK3JDbmxEaWVzanMxSEdVM2RucXBjK2V6UGcrL3VRaEFrOGdXdDNlRU9o?=
 =?utf-8?B?akI0dmQ1dE43ZnQxSkVUbGxBUjUzcjAvdm5yeVRxQlhnS1lTdmN4blpIdDZq?=
 =?utf-8?B?NDZhOUFRMWlHR2tiZjVVVVBEWXcxUFdTLzZQM3Q0aEE0NWJZNE41MVBBZ1Z4?=
 =?utf-8?B?eEFKaU9ON09aN3pJazl3WXVWV1U4bnpJb2xWTUlWZzVtZTljNDQ4NHJoYjVa?=
 =?utf-8?B?ZWtqUUJFaU1xVzlOaG9MU3ZGVmIrT05lY1NFbjNVNWErL1RlQjk1cHB0b3E2?=
 =?utf-8?B?alpPNHRrVDE5NWRNdzlMMFJONld5OGYzdnVhRGZVdlRlY3dnM2lSN1VSMWlJ?=
 =?utf-8?B?NmdxUlY4bWN2cTZOQkIzYm1UeHFYR0NGRFpWc2NUbDcxejI3WU9GSXhyb0RE?=
 =?utf-8?B?cFM0N0k1ME9GcFBVMnA0L2VxMVVqWU80aU5VSFBReDB4NzlSQW1RbG12ZUhv?=
 =?utf-8?B?TW1VVi9BcXllSUdFZ3l3K1pFcytaNWVZSkt6YmpOV2NtQUtFRHJGaUpVQ0RK?=
 =?utf-8?B?MlpPR0RYUG9TdmZoMk5RU3dJd2k2bmxxdU5pMkZHOWdhZWJoY01hVE43dlY4?=
 =?utf-8?B?UTJXTnJmVG0vQk1jMjZBQlBKL3FIQTcxYTd3d0h0OXUvRFZsbTE0d2NYTXdG?=
 =?utf-8?B?djM4anpvS2NUUzRIK1FzNHJoalRXL0hVRndJM0FOVEZ1UmhCNE90eDVFYTU3?=
 =?utf-8?B?cS8rVTRkWEUrVlR5NXJHdjVYMGZUd1JlZlg2eVBmaGthdWZDVHhvSnJ6T252?=
 =?utf-8?B?K2g4dDRURmQ0alg2dWFsNjhabG1rL1FuUkZBandWUGNhOFFPOGxqZEk2N3Vs?=
 =?utf-8?B?ZUIrSGpPQzYyRElKUk9GK0Q4N1N6dTdtSVNlVmVNMzlyOUp4WWpSMURDeUZv?=
 =?utf-8?B?cVEvNzdLS1VJbERGWUxCRWhMNkdhMzQ3ejJCTW9SMDNsS2NBLzFvM3V5aDUv?=
 =?utf-8?B?clE0bU9MZ2g2NVVZcjZBSEpDUmlaeFFiRzRnVmh6RjFyaDVWbnl0S3hRTXBX?=
 =?utf-8?B?aXorR3F6N1EvTDhMUEMzL3FKcjFiZ21xc1lGNllvRWZzQ1hDMHJlNEZsOGNa?=
 =?utf-8?B?QUcrUitiNmRyQ3piYVFNNGFDeGhEOXZRNjAwYzdwZis1OER2MCt1Z1pQSS81?=
 =?utf-8?B?NEtYem81cm9uc0J4ai9VNEtjdEF6eDBQUzU5eHNjMWRoSktGQVEzbkJKaXR0?=
 =?utf-8?B?YlBlQnVaWHJRSHo1alVZWmNCSUFOSzVvU2NESWNvbnZKSzJOeVI2ZzBMNmNK?=
 =?utf-8?B?L1k4cERPYVI4UURaWVp0eWpvby9JTmJvZkg4dkRiTzQ5c0NORTFiOUN0RkRI?=
 =?utf-8?B?bFBUUCtGTzUzNlRsQjd2a3NqckdYSWxlb0QxWU9pT0hUMGxYZ3BnZTNXYnlM?=
 =?utf-8?B?RWNtdkNCT0Z4NjI4S0N1MWltQkl1TXJONTNCMkdRSmh1MUNUMjRZRnNKVTJ0?=
 =?utf-8?B?U1ZtL0E2OWtyNTgrMDVaQW9TTlkvQlZxbHlmMzNDb1AxTThRUkxJc3lZYk9V?=
 =?utf-8?B?L1VkUEUyZXJLNkZuR1JiaFIzYlNYR25MaDV6MWhlY3pzMi9tNE82dHVVQ1Q0?=
 =?utf-8?B?S1NsL2FzNDkvNE5WOTlWeTFNL0ZuN0RTYlBFcjE0d0xPNE9XQjJra3JFdlNa?=
 =?utf-8?B?d21OcTVCVmppbDFWU2tMTEU0bnNXaEFqb3VlaUdCd2ptT0xDbmcxdzEvOWJJ?=
 =?utf-8?B?Tkk0Tm80YUZuVVZsT1AyanEwTms1bjJ1dU9yMkdvL2ZQWTRlRG4zVFhNQjFY?=
 =?utf-8?B?MHRPQUJtSERCUERNZ2xkZW9MM2hvL09XdkNESnVaaFlNbmx3NmxrSXUya2Fw?=
 =?utf-8?B?aTlqaU01WHpwejZEZ2FDdHNMTFhNVWtLcnF6MGh5bUtxeFdoaVA1ZXEwQ01P?=
 =?utf-8?B?ZG02bDR6eG5xZk5xcUNscS91eTV1cnQyc3RseGVoRTZVbEZkSUY0ZW9wbFBk?=
 =?utf-8?B?b0p4LzROVExJWTRxcjArSVdiVjF5bmt4Wml6bjZIMzhvNFBxWFZZQ3dVT2ww?=
 =?utf-8?B?SWpUQkt1NTR2OTZWWkVHN3ltN0pCdElUNDJUb25xL2dUSS9mSFEwbXkxckNz?=
 =?utf-8?Q?cb08=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2503c37-ea96-43a5-744b-08de27358022
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 06:33:06.9087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /xlmdB1zPxv9O/obMHUn70IA5kDwFQZJXTDlKMLBhiHoTTjX9Xn/OeYRwyQB0YhE7wSZZx0UYZF3+BDbM62v4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7822

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGV3YXJ0
IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29tPg0KPiBTZW50OiBUaHVyc2Rh
eSwgT2N0b2JlciAzMCwgMjAyNSA1OjI2IEFNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55Lnpo
ZW5nQGFtZC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHhlbi0NCj4gZGV2
ZWxAZG9ybmVyd29ya3MuY29tDQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47
IG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tOyBBbmRyZXcNCj4gQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQNCj4gPGFudGhvbnkucGVyYXJkQHZhdGVz
LnRlY2g+OyBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEphbg0KPiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBS
b2dlciBQYXUgTW9ubsOpDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRyYW5kDQo+IE1hcnF1aXMgPGJlcnRy
YW5kLm1hcnF1aXNAYXJtLmNvbT47IFZvbG9keW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFi
Y2h1a0BlcGFtLmNvbT47IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNv
bT47DQo+IEJvYiBFc2hsZW1hbiA8Ym9iYnllc2hsZW1hbkBnbWFpbC5jb20+OyBDb25ub3IgRGF2
aXMNCj4gPGNvbm5vamRhdmlzQGdtYWlsLmNvbT47IE5hdGhhbiBTdHVkZXIgPG5hdGhhbi5zdHVk
ZXJAZG9ybmVyd29ya3MuY29tPjsNCj4gU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0QHN0ZXcu
ZGs+OyBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPjsNCj4gSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPjsgR2VvcmdlIER1bmxhcCA8Z3dkQHhlbnByb2plY3Qub3JnPjsg
RGFuaWVsDQo+IFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYzIDA1LzI4XSB4ZW4vc3lzY3RsOiByZXBsYWNlIENPTkZJR19TWVND
VEwgd2l0aA0KPiBDT05GSUdfTUdNVF9ET01DVEwNCj4NCj4gT24gMTAvMTMvMjUgMDY6MTUsIFBl
bm55IFpoZW5nIHdyb3RlOg0KPiA+IFJlbmFtZSBhbGwgdGhlIENPTkZJR19TWVNDVEwgaW50byBD
T05GSUdfTUdNVF9IWVBFUkNBTExTIHRvIGhlbHANCj4gPiBwcm92aWRlIGEgc2luZ2xlIG9wdGlv
biB0byBtYW5hZ2UgYWxsIHVubmVjZXNzYXJ5IGh5cGVyY2FsbHMsDQo+ID4gaW5jbHVkaW5nIHN5
c2N0bCwgZG9tY3RsLCBldGMsIGluIGRvbTBsZXNzIHN5c3RlbSBhbmQgUFYgc2hpbSBtb2RlLA0K
PiA+IHdoaWNoIGNvdWxkIGFsc28gbWFrZSBpdCBlYXNpZXIgdG8gc3VwcG9ydCByYW5kY29uZmln
cy4NCj4gPiBXaGlsZSBkb2luZyB0aGUgcmVwbGFjZW1lbnQsIHdlIGZpeCBzb21lIGJ1Z3Mgb24g
eHNtIHN5c3RlbToNCj4gPiAtIHdyYXAgdGhlIHdob2xlIHhzbSBmdW5jdGlvbiB0byBhdm9pZCBi
cmluZ2luZyB1bnJlYWNoYWJsZSBjb2RlcyB3aGVuDQo+ID4gTUdNVF9ET01DVEw9bg0KPiA+IC0g
YWRkIG1pc3Npbmcgd3JhcHBpbmcgaW4gaW5jbHVkZS94c20vZHVtbXkuaA0KPiA+DQo+ID4gU3Vn
Z2VzdGVkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5jb20+DQo+ID4g
UmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4N
Cj4gU2hvdWxkbid0IHRoZSB0aXRsZSBvZiB0aGUgcGF0Y2ggdXNlIENPTkZJR19NR01UX0hZUEVS
Q0FMTFMsIG5vdA0KPiBDT05GSUdfTUdNVF9ET01DVEw/DQo+DQoNCk9oLCB0eXBvLCBzbyBzb3Jy
eQ0KDQo+IFJlZ2FyZGxlc3MsIGZvciBBUklOQyA2NTM6DQo+DQo+IEFja2VkLWJ5OiBTdGV3YXJ0
IEhpbGRlYnJhbmQgPHN0ZXdhcnRAc3Rldy5kaz4NCg0KdGh4DQo=

