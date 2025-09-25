Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3E5B9E74B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 11:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130284.1469835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1iTU-0004gD-T0; Thu, 25 Sep 2025 09:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130284.1469835; Thu, 25 Sep 2025 09:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1iTU-0004eX-Q1; Thu, 25 Sep 2025 09:41:16 +0000
Received: by outflank-mailman (input) for mailman id 1130284;
 Thu, 25 Sep 2025 09:41:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JIiA=4E=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v1iTT-0004eR-6q
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 09:41:15 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1405e63-99f3-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 11:41:05 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Thu, 25 Sep 2025 09:41:01 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 09:41:01 +0000
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
X-Inumbo-ID: c1405e63-99f3-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfLilHEFV+Kak1n+nCMGUVtFbHu2qh0E+c5ba7C/9wfGTLXtq+S9Wv/DwelVnmkw8vBaow1guFLsl+eivCFP0fjDkJ75K1jYo8skiokzTaKUigtVI6rHOjTzPJJwXSiP2qt8zXkZmjFEst8qS7vi+o6/wg7H8LSJjTD/HYwNmNDarB68oPqNOwcRkW5pg7u5CCLzCU09Ur/9e9MrfgruREY7MlseI0iMmeIbz3HJRQ91dQeAicQnKW5xE9i//RRyvoIlwOSLtbTmvJKr3e+glldkqo8cDcIfi9cPG6o45n6MYfakaojb+L04J4/lmsFrQU0RkNrt0HhPkDJHNklhSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ko3JZ8qdP4Qi1Vru36LVAxvI5i0fpqb8xxCJswln1N4=;
 b=C7TNXPe0dB05k87mUXPe4bezCzendomW9Fq13AmxiEBPNV5rNn1BZwx/wbxYH9VOBBo9l7Jo2ljxu0kn3X46Ffnq0GuVNGY5LmrdGnzauX2DEd2acWmRhF4RZeE3SFOlDKF07/Y03HPcqTVfhIWSSfrXx252AlDN2FPaWWnMa27uVQujlwADokMXS42KSI1zbwNpTL7Y0KZTk/X2X68LV/0unvsrG0sXNDHJlI3UDViy7P7WU6J2rty0jPzaatHvYVYzyNPLTZR/azPO01PvsuVAcbYabEm7oakJFd2wY6+cZwLBrk2D2MxHgHEN0AEEvrzwdCa1RoSW8sCwl397IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ko3JZ8qdP4Qi1Vru36LVAxvI5i0fpqb8xxCJswln1N4=;
 b=J0QYFSjkJybQsLYU0OxHbA7Ds7ftFwk09qeXapRrijZ1oBqV8LjIz6kTNYHOd8EpJYM9+uli1qScJNTRPfs7vwNaMW5g+zstadXJkoira4Ha2c7x0ZoZDDAtjnl3pq7Yc3N5ro3ORgfsjiJK/O/5/2aQ+TMw8Y/gNUAx89oRbMQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Andryuk, Jason" <Jason.Andryuk@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v2 18/26] xen/domctl: wrap xsm_getdomaininfo() with
 CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcIiYYEaVyPVCsmkah0K573htVM7SN/BaAgBWuJIA=
Date: Thu, 25 Sep 2025 09:41:01 +0000
Message-ID:
 <DM4PR12MB8451BE98219C343F8F62482AE11FA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-19-Penny.Zheng@amd.com>
 <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
In-Reply-To: <a8b93dcc-c003-49a6-8a78-5fb890cbaec0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Jason.Andryuk@amd.com,stefano.stabellini@amd.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-25T08:35:04.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB7938:EE_
x-ms-office365-filtering-correlation-id: c5021881-bca6-420f-3652-08ddfc17a368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?OFlyYmk5K0NhNDdiNHptNWZ3L1JpQzN0aUlpdDBvTzhaQnNrOUpLVXBGVGlo?=
 =?utf-8?B?aHg3UU9rdXZtTzNqSG1yTzNCc05nU3A0NGZqTkNtcEVkUlJuUkVRaE1qNmdC?=
 =?utf-8?B?c3ZJbFhCUWRueWZFQzlXZDIzeDZ0K0lWNGhxZGRaTExZcUsxd2s5Vi9Hbktx?=
 =?utf-8?B?eDBnNnVwWjVwUCtYYllLWG5WaURreG9ZMFVnOG5mNmlsUktnWTQzS1JZeUM1?=
 =?utf-8?B?SFZXK0h1ejhBUnIrNW9nS0RFRjNjL2UwcTdiNVA3NGhMOG1zRXhkMUxPcjRC?=
 =?utf-8?B?S2tlNWJ3clJPeFpEUDQxcjk0ZU1zZ0ltRGZTeGNENWFoREMwWjFPaDFha2JG?=
 =?utf-8?B?TjZBWFg4ZXR2b2M3ZkR5QlA4cmtudGZCeXE5SzNNOE4rMUpOdmp1bkNwZHFM?=
 =?utf-8?B?M0FGK0NKRVkvSUpqdHF2UXUwS0ZqaEw4Y1hFbmlmZ3F5aWl6SjNBVFpkcmFa?=
 =?utf-8?B?RlVtblk4d0pNeUsrWllQS3A2ZCtPYTNNQzJWQTJoeFQ4cENKS1NCdTVaL0p4?=
 =?utf-8?B?eXplVXNVV0ZzNVFCN0lrYlA0TEMwSm9pS3cvSDBiM21UNzJHb0s2SGdUODJt?=
 =?utf-8?B?ZlhQL056N3NBQ0Q0Qk5HZUs5UjkxU29QYmRMNTBma1NYS2VPV045cnRzKzFZ?=
 =?utf-8?B?M1p1UFZQUmlNVlpvWjZJc0UzeTlNNktROElUaER2WWRJYTdwS3NHYkJHSDlq?=
 =?utf-8?B?d3AyRzNwWTRNaEIwN1R3MldrMFBIZE5jaHlkYXUyNnlDWUNrVTJ2R2pYZ1Rs?=
 =?utf-8?B?dDhQelVwMGordEFORVhJQmpKR3ZjeS9Sb2pBek9iZkVKTHVmZUJtOW9HQWxn?=
 =?utf-8?B?a1hGbW9sclNpd0NPZDVwRlJDZ0NrSmJnOHhQWmVPcThKMk5adlVOWnNMWHZ2?=
 =?utf-8?B?bWVmdzdLOUVjT0ljM1JhdVdmd2hsN0hlcGFGYTdqOEpKblJYeW5IOGNJelVv?=
 =?utf-8?B?TFhvT1dDMldrNnVkQmRuQmlmSGxUdEtvVFo2RU5tMHNvSGtZYWdGcHRnRk1j?=
 =?utf-8?B?ZS9XalhZT0VlZUN0L3hIUkR5c1p3VGFHb3pqdHVEQStMTDM3SndYN1ZKd3lz?=
 =?utf-8?B?OCtacERzdEpML1lDaENrcURNRXMrNnYvSjdnS2I0bWRIaWlhVEJyT3hzY2Q4?=
 =?utf-8?B?NFJqaW96VjBKUjFkSjNveFB2bVhxQmEzTnhlNnJBOUJacjVoeUtSRkpDUmla?=
 =?utf-8?B?cGVBdWllcnphcmhYbHFLN0tiZDNnK2pjajNTOXhJMkZ2WFF6VEdGQjYrNytI?=
 =?utf-8?B?TUdqZ3VTd25RUzhlRTF0bkVBWVhCWnNtZGZCNkx6ZG9YeDc4TUxna280UmUz?=
 =?utf-8?B?UWVlSnArM3N3Z3QxZUE0S1pMalFNQStSd3E1eWcyV0w1TE1oeUVWUTBhZHlu?=
 =?utf-8?B?RTJ3TWx4c084dUhzL2ZyRnFMS2ovVUxiSkhYSkxCeGdyKy8wMUF5cjBSb05N?=
 =?utf-8?B?RHlxQmxEWURPR2d2eSt6Y0Y3V2xVWGdWTjVqUVRlNENNdjlrZDNndXhtQ29N?=
 =?utf-8?B?RTByOXhuRjRaREl3ZC9HWGNEZkF0bUZ2dUxVQnViV1F4ckFPdFBSQytBeFdw?=
 =?utf-8?B?cU1YcysyL1N3OEMxMlUzZlRud0ZuWmk1M0pYNzEveHhvUEVpbVFpYjAvMjFB?=
 =?utf-8?B?QUY5c1JhTlgyUThLRWxyRWU0OEcxR05ZUEtNK2NBSnA5L0lTRkhVWURDMmJB?=
 =?utf-8?B?MjRLQUZKakNkSDdXWCtCSXR5aFRKVHdneExOeUFMd2R2ZFFEemFqN3ExbWpD?=
 =?utf-8?B?VzlPOElZVVp2U0lQanp0b1MvTGtjdzIvbzlHejZ1a1RZZE1TTnRJd1EwU0Ny?=
 =?utf-8?B?bW02bSt2bEVBL1lvWEo5UmtqeGRobzA4MEVYcWpGTUdCTG14S2FKT0R1Qmdh?=
 =?utf-8?B?dDRkWnJzS0FacVZlaUhJblduelZoc0xIRHFQZWVHdDBUN2FhZmE5S3NQNmNm?=
 =?utf-8?B?OUhsREZ3MTEwOUN5YXgrc2lvdnlrVndVUzgzeVArMnFpTkhVK1ROK2FRTzdG?=
 =?utf-8?Q?LqTJCPRGRCNe2LZyo8gR6PMC3giGZU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bElQT3ZrNUVldzZGZEVwQVZxQWxkZnM3NTZGU3NlRUNTVmlxMFZKRGtPczJl?=
 =?utf-8?B?THhHL0gzeSt3ZllrcHJEYnNLT0VvdEk1Lzh2aUluMUNGK0owMFVEaFgya0Nl?=
 =?utf-8?B?OHZaWFN1UzhuUUdVcXZ5ZzlOZGxUREdJNUV4WHhlVGVEVUVJRHFRWlBHcWpL?=
 =?utf-8?B?UmZsQzJ4MG1CcmZqQm5URUhlQUlrL0s4aStMSktyMUVQbTB4K1pocVE5TXhU?=
 =?utf-8?B?ZllpQUcxZFBLazZCZFpxNkVVbm1NWGNqRHkrNmU0NWlwTFlDZG9zSDUvMlVH?=
 =?utf-8?B?eEUzYXV6bVI4R3BlRGRGeU1IVCt6UEpZMW5uMWQrOGVBVjFiWVNrS2VySmhu?=
 =?utf-8?B?NURGZUI4K3daYnpjbkJrZ2FpbC9HRGU3QVU0SjdKR3MzNWdOTm5FK2sxSlNj?=
 =?utf-8?B?dG9tc0NYTFR4VE1rN3FPSXFRaUdnbVhwU1pESmlUanZqdWZLWmdqRW5GVjI1?=
 =?utf-8?B?U1Q0NGhJR1ZMQ3pxNEVFcDlqbTU5VzB4SGhlY0pDa2JuY2JoWlFVQlpDQTBw?=
 =?utf-8?B?T3FwM1UvZWU5M1pDNTBOR2p2eFUrZXdqcDBHSGxTeVQzVUFzSUFDYmZaZVhR?=
 =?utf-8?B?Y1JySFFZYnkyK0dmMHRyUmtLNk9xVnRZOUpQT2lWOWZoRWlQd1gzZWhuQks3?=
 =?utf-8?B?S3VKb1U5VE5WUTl0Q2VyRVBkSzBqbkUvYjJlRjRoWkQzNHRpY096YmpWdmtU?=
 =?utf-8?B?R1FPL3ROZ3ZrRGlCd3JCZHprM1B6VG9hM3E0R3RQUkh5V1FkK09HOFMyOEky?=
 =?utf-8?B?aCsxeTd4c2QwaEFkMGFVTnBwdWFLNkNESWdlakg5dEZ3czRSY1FZd0trOXFM?=
 =?utf-8?B?ZmpkQVprcjJUSVlGRFMzV2syZkRjYU9oNnNvWDVmNzRwcGtoZzdJczFLb1lx?=
 =?utf-8?B?YjFmWmRQcnBaTVlKRDJKc2lwMFgwa0pxb2h2dkJuVlhrZjVPRllHVVI5ZkRx?=
 =?utf-8?B?NElPVG5CM0hXUzNpK2RPTEcwaXc1WU93VFozeDMvN3hlejlZaEsvMkZJbnps?=
 =?utf-8?B?R3VYUWtHdjUyN2xYNWZtQ3ExVE1CSUVZaXJBUld0NXpaK1VLT3BKYi9BaGwx?=
 =?utf-8?B?emFrWTdnT0dzaHgzeFMrTGMzTk5KWW8yYTdRYXBuOXE2bFJleUN5Vm45M3U2?=
 =?utf-8?B?VjRBZlZiSEpRYktmSWNMNlJ4aEwveUNTUk1TSGFBbDROY09QY1FwVTJqZmdq?=
 =?utf-8?B?UHNGcXFPY052ckxDRzZOV3FVaTd2cHZSWFhNYnhEUkEwcld4T2w4L0RTNStX?=
 =?utf-8?B?NG1sRGlzeVNYd0xHQ0JWTlNDTGhFcmttWGR5YnY4bXRudnIzYkFCaEJHaXE4?=
 =?utf-8?B?YytoYnVpUXlydVBSUmtkZkdyVi9hdlp4SUlBS0MzdWZrYmYxV29VNm9TdjMr?=
 =?utf-8?B?NkorMUI3UXY0RDdzN3VoOUpOQ09TYm5XNndYV01pQnhuREJXdzJQY0V0TTV6?=
 =?utf-8?B?MkFMQXZrQTRFWUlHaHMyQ2tUdnUreHluZXRKL1IwTkNqTzRRdXo0b1o0RkMy?=
 =?utf-8?B?bGoxNEh4WWJ6QkVRcnZNa0VZTW1aRUswZlNnSWx2cUY0Y3d0T2ZBd0kwMkpH?=
 =?utf-8?B?UThabk1pRXVLbWVJNmkyTUtQY0Rzb1lkWElIMkVjOXl1U2JCdFpmMEsvNW13?=
 =?utf-8?B?d1I3aVp4MHVHRVFrMFJDZUpaU09yWUREVGZkYWdJS05TdlNoV0I0ZDFRK1dK?=
 =?utf-8?B?VWw2TjExRVJ4L0xocm9PdWdYbTYyZnFudUExYmdaRXhsM0phd1VpM2JWSlhI?=
 =?utf-8?B?UGMyOXVhU1NTVzA3U1kvYVJ6amZaUURVV1pxT3hSWkVGa2swTjQ5TmFGMVVj?=
 =?utf-8?B?WXFGREdpQzg3ckhrblhCWU8wUU9vMXlRTExCVEtyb3luNWl1d24vT3RTaldi?=
 =?utf-8?B?T0EvT2NIT0N4OUUyZkhacHNiMlNkZ2NIajRrWlYvRFpVeEQraEozOXF1S2lD?=
 =?utf-8?B?MVBwcU5ldzlJNmhJYVV1WEUyQWo5TFJSTjhad0V0bHlEZjhWN3NPVkZ1bUk0?=
 =?utf-8?B?cHoxdHAvYTNrcmpRWjIrdllhMEdFZTlwVG01U0FrWlI2dUxlTnlKU01nN1hW?=
 =?utf-8?B?NlgzUzBzOFBKcEkyazBuUUlDazRNc2JrNkJyK29JdjNidHkxU3FTMEY4d3Az?=
 =?utf-8?Q?cQtg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5021881-bca6-420f-3652-08ddfc17a368
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 09:41:01.2161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frB0PNLLgoPYj8sQ+5myDbIfhDfoP5dn+Chry1eVK32vSBj5Slma3+DOYeUdi+bSn7NGmFBsdXkMaV2lG22YIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMTEs
IDIwMjUgOTozMCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBEYW5pZWwgUC4gU21pdGgNCj4g
PGRwc21pdGhAYXBlcnR1c3NvbHV0aW9ucy5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxOC8yNl0geGVuL2RvbWN0bDogd3JhcCB4
c21fZ2V0ZG9tYWluaW5mbygpIHdpdGgNCj4gQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KPg0KPiBP
biAxMC4wOS4yMDI1IDA5OjM4LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vaW5j
bHVkZS94c20veHNtLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94c20veHNtLmgNCj4gPiBAQCAt
NTUsOCArNTUsOCBAQCBzdHJ1Y3QgeHNtX29wcyB7DQo+ID4gICAgICB2b2lkICgqc2VjdXJpdHlf
ZG9tYWluaW5mbykoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9nZXRkb21haW5pbmZvICppbmZvKTsNCj4gPiAg
ICAgIGludCAoKmRvbWFpbl9jcmVhdGUpKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IHNzaWRy
ZWYpOw0KPiA+IC0gICAgaW50ICgqZ2V0ZG9tYWluaW5mbykoc3RydWN0IGRvbWFpbiAqZCk7DQo+
ID4gICNpZmRlZiBDT05GSUdfTUdNVF9IWVBFUkNBTExTDQo+ID4gKyAgICBpbnQgKCpnZXRkb21h
aW5pbmZvKShzdHJ1Y3QgZG9tYWluICpkKTsNCj4gPiAgICAgIGludCAoKmRvbWN0bF9zY2hlZHVs
ZXJfb3ApKHN0cnVjdCBkb21haW4gKmQsIGludCBvcCk7DQo+ID4gICAgICBpbnQgKCpzeXNjdGxf
c2NoZWR1bGVyX29wKShpbnQgb3ApOw0KPiA+ICAgICAgaW50ICgqc2V0X3RhcmdldCkoc3RydWN0
IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAqZSk7IEBAIC0yMzQsNw0KPiA+ICsyMzQsMTEgQEAg
c3RhdGljIGlubGluZSBpbnQgeHNtX2RvbWFpbl9jcmVhdGUoDQo+ID4NCj4gPiAgc3RhdGljIGlu
bGluZSBpbnQgeHNtX2dldGRvbWFpbmluZm8oeHNtX2RlZmF1bHRfdCBkZWYsIHN0cnVjdCBkb21h
aW4NCj4gPiAqZCkgIHsNCj4gPiArI2lmZGVmIENPTkZJR19NR01UX0hZUEVSQ0FMTFMNCj4gPiAg
ICAgIHJldHVybiBhbHRlcm5hdGl2ZV9jYWxsKHhzbV9vcHMuZ2V0ZG9tYWluaW5mbywgZCk7DQo+
ID4gKyNlbHNlDQo+ID4gKyAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4gKyNlbmRpZg0KPiA+
ICB9DQo+DQo+IFRoaXMgaXMgaW4gdXNlIGJ5IGEgWGVuc3RvcmUgc3lzY3RsIGFuZCBhIFhlbnN0
b3JlIGRvbWN0bC4gVGhlIHN5c2N0bCBpcyBoZW5jZQ0KPiBhbHJlYWR5IGJyb2tlbiB3aXRoIHRo
ZSBlYXJsaWVyIHNlcmllcy4gTm93IHRoZSBkb21jdGwgaXMgYWxzbyBiZWluZyBzY3Jld2VkIHVw
LiBJDQo+IGRvbid0IHRoaW5rIE1HTVRfSFlQRVJDQUxMUyByZWFsbHkgb3VnaHQgdG8gZXh0ZW5k
IHRvIGFueSBvcGVyYXRpb25zIGF2YWlsYWJsZQ0KPiB0byBvdGhlciB0aGFuIHRoZSBjb3JlIHRv
b2xzdGFjay4gVGhhdCdzIHRoZSBYZW5zdG9yZSBvbmVzIGhlcmUsIGJ1dCBhbHNvIHRoZSBvbmVz
DQo+IHVzZWQgYnkgcWVtdSAod2hldGhlciBydW4gaW4gRG9tMCBvciBhIHN0dWJkb20pLg0KDQpN
YXliZSBub3Qgb25seSBsaW1pdGVkIHRvIHRoZSBjb3JlIHRvb2xzdGFjay4gSW4gZG9tMGxlc3Mv
aHlwZXJsYXVuY2hlZCBzY2VuYXJpb3MsIGh5cGVyY2FsbHMgYXJlIHN0cmljdGx5IGxpbWl0ZWQu
IFFFTVUgaXMgYWxzbyBsaW1pdGVkIHRvIHB2aCBtYWNoaW5lIHR5cGUgYW5kIHdpdGggdmVyeSBy
ZXN0cmljdGVkIGZ1bmN0aW9uYWxpdHkoLCBvbmx5IGFjdGluZyBhcyBhIGZldyB2aXJ0aW8tcGNp
IGRldmljZXMgYmFja2VuZCkuIEBBbmRyeXVrLCBKYXNvbiBAU3RhYmVsbGluaSwgU3RlZmFubyBB
bSBJIHVuZGVyc3RhbmRpbmcgY29ycmVjdGx5IGFuZCB0aG9yb3VnaGx5IGFib3V0IG91ciBzY2Vu
YXJpbyBoZXJlIGZvciB1cHN0cmVhbT8NClRyYWNraW5nIHRoZSBjb2RlcywgaWYgWGVuc3RvcmUg
aXMgY3JlYXRlZCBhcyBhIHN0dWIgZG9tYWluLCBpdCByZXF1aXJlcyBnZXRkb21haW5pbmZvLWRv
bWN0bCB0byBhY3F1aXJlIHJlbGF0ZWQgaW5mby4gIFNvcnJ5LCBJIGhhdmVuJ3QgZm91bmQgaG93
IGl0IHdhcyBjYWxsZWQgaW4gUUVNVS4uLg0KDQo+IElPVyBJIHRoaW5rIHRoZXJlJ3MgYSBjb25j
ZXB0dWFsIGlzc3VlIHdpdGggdGhpcyB3b3JrIHdoaWNoIG5lZWRzIHJlc29sdmluZyBmaXJzdC4N
Cj4NCj4gSmFuDQo=

