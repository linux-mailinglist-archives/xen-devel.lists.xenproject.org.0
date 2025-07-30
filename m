Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81567B157A1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 04:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063311.1429045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugwvb-0005NL-2O; Wed, 30 Jul 2025 02:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063311.1429045; Wed, 30 Jul 2025 02:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugwva-0005Lq-T6; Wed, 30 Jul 2025 02:52:26 +0000
Received: by outflank-mailman (input) for mailman id 1063311;
 Wed, 30 Jul 2025 02:52:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TpWi=2L=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1ugwvZ-0005Lj-52
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 02:52:25 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:2418::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 362decb4-6cf0-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 04:52:22 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Wed, 30 Jul
 2025 02:52:18 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 02:52:17 +0000
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
X-Inumbo-ID: 362decb4-6cf0-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCv8V3uO7Ni+IWfpsztioPMcOg8pjrrMiXd1RCBYx9oMMMnEpKuxA9YfXJ5y8sc1h4f6u62Wji3HW87e66U4iGKqvC7y5gOJ2Dbeq0muz1FDP0D/OqirMWisFrOcExt4fYVjAwErYERdec/7ZRolCo+cKsuQ5A2cduxJbezcy8E7t2FREsgl7R/I6mkWwmK7QfKmyB1i/Jja4i/LLvpaeCVBDBYINkyzW/srcLh/mbM2hkOzTas4ZYivscyqAqqiEpCadATl5cjffGaQu9NQVw/tYj/lno/+8TmQO5AS6SS/GLDfk30qNWqIllafAJC/bNYczh6yRMUx42T23jowuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv9krI3OyTUkSux+qLkEi96O7+xVdNvoQ41Cx7SfF70=;
 b=wF1ZoKpfN+RrmYJWaiJecDnuE3wulP6VKWfhdbCY5qYtu5NlepmJpwS6yJdfPDuharNnGhsXpo299Oh9qXg5A1QRIdf5Qv1q0QZeNqS9sZMhK4vE0tqLQZuaLLOtOU2U/41ZKAbiAcPM4nCVZBj8L767xoPQe+5/x3mKpqcPE7lM+8tcGFknlIXHNnxwdKod+yq2sYpQ3rfkIbsQD5NQ8hBE8Noo9wqnZc44myvjOKfQON+7EPlsr7nv26/5oM6B4JpZg0HmWZJTEuenDKlHninrl+5R/ol5eWm0hM39GkYAe7MGjCJr8qZ6iOAiSslpMT4hjVW5crCMJ5bilVJd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv9krI3OyTUkSux+qLkEi96O7+xVdNvoQ41Cx7SfF70=;
 b=GUbGoeQUrOu3+6iU0uWZHemVJm1ltDXJNguzsfN8825NbR8+H8ez7bcRf3dGgrcB2zBzLO0yg9bOyvzfYXyrr0m/OErEf3ku8YBSc+G85Mt5A0FnheIfWqUoyvOcUpa2aJGIYyJN5wWlvmFLGMdDolz3ZvqiTeHr/nprGHDuGLA=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v9 8/8] vpci/msix: Free MSIX resources when init_msix()
 fails
Thread-Topic: [PATCH v9 8/8] vpci/msix: Free MSIX resources when init_msix()
 fails
Thread-Index: AQHb/30igYEmGROipE+ztoDHPTv4H7RJTtYAgAExLoA=
Date: Wed, 30 Jul 2025 02:52:17 +0000
Message-ID:
 <BL1PR12MB5849F7CB4306557D216DCCF7E724A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-9-Jiqian.Chen@amd.com>
 <aIj4ghW2dpnY1HhO@macbook.local>
In-Reply-To: <aIj4ghW2dpnY1HhO@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8989.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA1PR12MB6580:EE_
x-ms-office365-filtering-correlation-id: e497f259-f58a-4982-cdec-08ddcf1418cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?emp5Z2dsNUFLKzVkQnFNWEdseldkQ2Y5THV4U3dXSVYvNVp6bHdHSXVkTHBs?=
 =?utf-8?B?WHpzUXRnTjFKNWVvbVZ1QXpCNExuTk91bTcxcWI4b09hSElUZlcycFF6MXNi?=
 =?utf-8?B?OTkyOVpyVm5qRUhTZDFsK01QZXhRYmF4RzRJSi81Mzl0U1VZcEU2QlJHZUEr?=
 =?utf-8?B?cTFuM1JIbG9MSDlFc295SExkTWhYZU4wSDVIclBRUTNxdWllM1lBQmNHNFBv?=
 =?utf-8?B?SWpUTWZNMytQdVVvdDQ1c1hTMlpGcVlZd3FtVTA4ajdJb01sSnB6Ym5JdDJ6?=
 =?utf-8?B?Z1A4WEFVay85SnJKZkwvZnA0NG1Wek5lNTA1dWh5Q2ZuR2FhNEdrRWlYdFlE?=
 =?utf-8?B?UG55SitaRExaMnJLQUUwYmVrRHcvblNtR3YvbEdaMDZaTlM0bEFYVG5tYVJR?=
 =?utf-8?B?STVjL2N2dm9PZk16UVNQNTdwKzR3cStJQkcvQlZKb1Z1bnpWQ2YxZzNBUXIw?=
 =?utf-8?B?bC9lWVJBM3dPS1hBVVRhdU02Ym1uTG9DUDZOMjVMNytWN3BxcWtQWHFJVEx6?=
 =?utf-8?B?MUNGVHVVc2pHZFk3VDhlYUFlZnRua1pSeFNBZjRkUmdEVXdQekpDU3pJZGhx?=
 =?utf-8?B?TzY3Rm91SVptek1JOGVJWjArMEtrYTZtUGNDb2tlcVpyb1FzeHpvWnBrYXpB?=
 =?utf-8?B?eWdqRSsxUXUvam9USFlpb1Q5d01ONXo2WFZzNTRZTDViUmpvbGgzTTRkem9Q?=
 =?utf-8?B?dENtMnozOWNHYkY1MlBWNWdTbnVqODdlS1BUN0tpM2M1TlJaSVJScWNtMVJM?=
 =?utf-8?B?WitiaXRmOXJTRlNDc2h1OXM1MVZSNWw1bEZraTE1ZHE0dXVWdlJ6blExU0cz?=
 =?utf-8?B?MUI5aE83MnlwekdnUFl0NnloVkZBU1laZWd4dFZRR0hKekpHUm1GNWthZi9S?=
 =?utf-8?B?elo0RHBpdnN6MnBGOVpORXFsb3kwMFRTQWZJOEtTcmlqSXZUSVg5OHZkazFu?=
 =?utf-8?B?c054YjZublBwUnhMajArbjcwb3l4ZUZtL3JrK1JKSEhyR0FjMCtKVWhoaU1G?=
 =?utf-8?B?VWNPOUlyajUvUWdObjlENlVFR3VGRzhnS3RjVUFlS2o3bVd6Qy8yMldXV3hC?=
 =?utf-8?B?Y3RKMEVLM21VNmcxVzFvZEZiQzR3bzYwbis2NmplZHIyR3hkZElQb2ZmUDhl?=
 =?utf-8?B?c25zM0MzUTM2Z1NXcUlSSTRleG1hdHlZVUFWVitUTVpWTnptWkxzdlBBSFhS?=
 =?utf-8?B?bkxBcUJUYkxHQkNmMXoyRW9STmNTTnZaRm54MWF5QVczOVpxQnZ4ZnVOTzZm?=
 =?utf-8?B?dW14R0lOQmtkYktFa25xUzRMazVFRjVuM0lWSGJzeHo1Vm1iQU9wbXgvTDh3?=
 =?utf-8?B?b0Vxanhxa1VJVWFhMlNOMzBVSEhxUXN6dy9WQXFGZUxiM1lCb3dvdkhoSjY3?=
 =?utf-8?B?QTdNS2gwR0Y3RThGN1kxSzRnTzZtNHJ1OTY0Nk1qU3RQOHVkTWlzbi94M2VR?=
 =?utf-8?B?UmRic1prcnUrd0U5THcweHhWQ0tlaDV1WGZzQjhIY2xvamUyV21VQXExbnU3?=
 =?utf-8?B?cUJxdm9CQ3M2NU4ySmw0U0dmUkw2N1lPWkF5MXRQOFR6NDV4RUp0YXk1dkhS?=
 =?utf-8?B?UW1ZbEpkSGpUaVN2TzVSYXpqQ3ZocDdCdndKa2ZHYjYvTDhUU1RscEdnbCtJ?=
 =?utf-8?B?d0ROUUVXMlI2VXcxTWFGOTY3aG51Sm5zVGYzTE9BYlJ5NWgwYlo5aWRseXgv?=
 =?utf-8?B?Nm1yNGplYTdBcXNPUkpqNFlUNEtNektsWmVuL1RsRnYwMm93Z0JwYW1PZ2FN?=
 =?utf-8?B?eDNIaGlZTnRYTGFWR2l5WjNuM1hNd05CUHRKMWlJMTlKY1RnN3dwT29Vam1X?=
 =?utf-8?B?dkFXM25xMDc4bkRSa0c4NkhmMHJRSHhVOFl5NktJbW1XbEl0NmlUUzlpR21z?=
 =?utf-8?B?RFQ1d2JycmVzamVRYmZSK0RWTXgzZ2JQWlc2TStYbHZWSmFDQ3VDQy9PZGoy?=
 =?utf-8?B?YWg3UEFjYU85WXNCTnBiY0drVjNybC96bGh3REY2bUc2TDJiRDVtVGdCbHY0?=
 =?utf-8?B?RzA3ZElmTmNRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGUvVUZMd0tkZ1BKMXVOSk9uNDhVS2hOblVJQjVMRFJMdGVpNUlhZ0V3bG5D?=
 =?utf-8?B?Q2I1TXNaOExBV1h2cldldjV3YUczVWU4OWdIWEJROSt5Yy9hbWNxbjNGOFVE?=
 =?utf-8?B?RlE0RUdEZ01VZm8zUGxianJHaXhrWEJZSCtRR3pCZThXSnRGcEg2VllsLzBr?=
 =?utf-8?B?SXZub0hRMU9WRE0wRVFyWEpKTGs2elRJM0pOZm5MbjYrS1dVanQ2Q212V0Jl?=
 =?utf-8?B?TjV2UnVXRlRnbnZNT1ZMbkt5V0k3djZ5RlptTmIyVk9rLzZsUTFXbHR1Y1VR?=
 =?utf-8?B?N3ZRZTNZbnVDalFYZ0JnNFFrQ3E4NEdkRC9IT1NaVGtPQVpGTWpqdFU0d2lC?=
 =?utf-8?B?dzMybjZDbEpTWG5rL0l5RTJmRGNtQlA0K0dQVzg4cFVXV3FaU1hXeGx0cmxj?=
 =?utf-8?B?bFc4aStKNkw4a0RiNmZIcHl0TnFyYjRsUEpMM3hjRWZ6N3FqSjF1TXhZaHlR?=
 =?utf-8?B?bVJWMnZ6VTRyZ0t0RmszVVZjSDluR2pMVCsxYzN1OTRYV1UybmdCQUpLdHRZ?=
 =?utf-8?B?QllGMFZ4WmJCOXVDSXZhMXoxMm8zSDl0eW5ST3NjVm14M1IrQ3VIOG9WMngz?=
 =?utf-8?B?ckczZTFCRUVrakdkV2RBd1N5SEVWRVhKYkMzYXp6TGdFcjZTZ2o2aUdOSzFo?=
 =?utf-8?B?R3kxZlJ1aGZWcGFSeCtXUU5HSUc3MnpQczREaWVhOHVqY2hpUUtaRW5ISUQr?=
 =?utf-8?B?M3p3Zlh5Ymd3WFd3aGhzN3N2OEVoYTU2RytLaXMySmtCam9PckRtdnZoOHRB?=
 =?utf-8?B?YmxUVk94Mi8xQUNwZExzMVI3Vk5YTjZBTC9GeEtCL3h0UWIwOTNWMnRZMTZS?=
 =?utf-8?B?YmxPODFTcmNEZ3g2bmJKRHpZOFFrRnZiTHNxN3BTVllaVmxYemZ5RHV1UHpU?=
 =?utf-8?B?THJUa0NmYllvU0Y3WGx3YitTajIrckx3U3VoT1U2VVVuMjRJWVFTSGpCdVVK?=
 =?utf-8?B?blM3djF4dkd6OGhrSEoyR0ZWL3pvbXBvNXlRUTVXR1cwWU1ZR0ZUV0ZOT1lL?=
 =?utf-8?B?VmE1UFp1TW02WVRySGxFeUszT3BTa3YrU1B5MXZqc2tnZllaTlpoMzN6ZTg4?=
 =?utf-8?B?Q2pxU0hzUTdKTE5qRlVxVndqbjUzVCtYdzY1K2NoUVFKSkRhczFzWHBzSi9T?=
 =?utf-8?B?dHZ1Uk5nNHBpNWZEY1BYVmlwc0lad3JqeTV2eG1QR25WYkFVbUxuYmpYVElZ?=
 =?utf-8?B?MzJ2dnJwOWtVQUlrZ3Y5RGh0SHhMUk1pZFh5bldMSFhJRzd3anhyczhWd3V2?=
 =?utf-8?B?U0Z2RTI3RGJCOE5pbDlnbzhsamZ4YW8vV3g4SCt3WVI1Q3hWRFY0L1FZVTlm?=
 =?utf-8?B?aHdpWXcwTlZHckwxQVhQc2RIOVBUZ2Z5VGNZZkNKaHladUhlMjJHWkZMUytm?=
 =?utf-8?B?c2txZXJQanhPbTlWSkNaQ2tTak1GOVhzMnlCN2E3YmlrVDZlcWpvbVQ4UzJC?=
 =?utf-8?B?T05ySUNvVmdpeFhsd25IZjRiZTdzWWV0Tm00b05wT0d4T1JjMU9QOU5RU2Nq?=
 =?utf-8?B?Mys2ampHRmMzRGQ5cTlrRSthb25OSHZnM3FxSFpqTHppZGRVcDE1Rmc3YWdR?=
 =?utf-8?B?UThabWV0Sjc3WS9EUkxDM3p1eXJ4V0FiMDZYMSt3SkJGNmN3VzdWVGxONlhN?=
 =?utf-8?B?OVpoQXNnOEpXRi9RcEJOV0FET3FxTXlXUDhjeEhoVCszZXVJQkxmcTZFTXlI?=
 =?utf-8?B?WVJYbzcwOHFKT0g1L2ZwWUFpdFpFdGVuZ01ITlRBdmEwS1owZUplTlJSK3Uw?=
 =?utf-8?B?VUN1ZVVJWUFqb3IrMnV5d3ZrZVZGRERJdGs1SGpDeDZyRHFlUy93S0VJUVVq?=
 =?utf-8?B?MTQ3eHFzL3FRQVNOWUpnU2VucmJTTFN3NTFIcEx6ODcrZjZPSEU0Rktwbk5V?=
 =?utf-8?B?M2E2N2cyb1MrZWpVT3JORVIwb1V5SC9FWjVrL09JUW10L1d0eTBrWGptRTZ1?=
 =?utf-8?B?a2tHK09qUGxHT2ZmWCsrL0pIaGdMTklocGROVnNUNDRTaDBka2Q1WGpWZVZD?=
 =?utf-8?B?Mm80dkdsaGxXU054akt1ZXlkRmNUOHBkVG4zcWhDUVpPRU1ydWlpcW9RRnp3?=
 =?utf-8?B?R3p6Q05Tcy9ya2NxN1pFWUJvNHJkZUIwbW1iTUVpMVg3VXNGdEREKzYzNndT?=
 =?utf-8?Q?4Lww=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12EA572B2E5C384F8D49E25139BB5A07@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e497f259-f58a-4982-cdec-08ddcf1418cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 02:52:17.8879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jOlvmqJ7z85uSysqyUQ8xSGooESPTkiM9bQCQfuL2brU36yYOTYE54qitXdGgsOHGMPlPWglM1VMWoFE7MaCow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580

T24gMjAyNS83LzMwIDAwOjM2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24sIEp1
bCAyOCwgMjAyNSBhdCAwMTowNDowMVBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IGRp
ZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBj
aS5jDQo+PiBpbmRleCA0YjhlNmIyOGJkMDcuLjI1ODM1NjAxOTUzNSAxMDA2NDQNCj4+IC0tLSBh
L3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2ku
Yw0KPj4gQEAgLTMyMSw2ICszMjEsMTQgQEAgdm9pZCB2cGNpX2RlYXNzaWduX2RldmljZShzdHJ1
Y3QgcGNpX2RldiAqcGRldikNCj4+ICAgICAgICAgICAgICAgICAgICAgICZwZGV2LT5kb21haW4t
PnZwY2lfZGV2X2Fzc2lnbmVkX21hcCk7DQo+PiAgI2VuZGlmDQo+PiAgDQo+PiArICAgIGlmICgg
cGRldi0+dnBjaS0+bXNpeCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGludCByYyA9IGNsZWFu
dXBfbXNpeChwZGV2KTsNCj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgICAgIHBy
aW50ayhYRU5MT0dfRVJSICIlcGQgJXBwOiBmYWlsIHRvIGNsZWFudXAgTVNJWCBkYXRhcyByYz0l
ZFxuIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwg
cmMpOw0KPj4gKyAgICB9DQo+PiArDQo+PiAgICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaS0+bG9j
ayk7DQo+PiAgICAgIHdoaWxlICggIWxpc3RfZW1wdHkoJnBkZXYtPnZwY2ktPmhhbmRsZXJzKSAp
DQo+PiAgICAgIHsNCj4+IEBAIC0zMzIsMTggKzM0MCwxMCBAQCB2b2lkIHZwY2lfZGVhc3NpZ25f
ZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAgICAgeGZyZWUocik7DQo+PiAg
ICAgIH0NCj4+ICAgICAgc3Bpbl91bmxvY2soJnBkZXYtPnZwY2ktPmxvY2spOw0KPj4gLSAgICBp
ZiAoIHBkZXYtPnZwY2ktPm1zaXggKQ0KPj4gLSAgICB7DQo+PiAtICAgICAgICBsaXN0X2RlbCgm
cGRldi0+dnBjaS0+bXNpeC0+bmV4dCk7DQo+PiAtICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFS
UkFZX1NJWkUocGRldi0+dnBjaS0+bXNpeC0+dGFibGUpOyBpKysgKQ0KPj4gLSAgICAgICAgICAg
IGlmICggcGRldi0+dnBjaS0+bXNpeC0+dGFibGVbaV0gKQ0KPj4gLSAgICAgICAgICAgICAgICBp
b3VubWFwKHBkZXYtPnZwY2ktPm1zaXgtPnRhYmxlW2ldKTsNCj4+IC0gICAgfQ0KPj4gIA0KPj4g
ICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUocGRldi0+dnBjaS0+aGVhZGVyLmJhcnMp
OyBpKysgKQ0KPj4gICAgICAgICAgcmFuZ2VzZXRfZGVzdHJveShwZGV2LT52cGNpLT5oZWFkZXIu
YmFyc1tpXS5tZW0pOw0KPj4gIA0KPj4gLSAgICB4ZnJlZShwZGV2LT52cGNpLT5tc2l4KTsNCj4g
DQo+IE9oLCBJJ20gYWZyYWlkIHRoaXMgaXMgbm90IHdoYXQgSSB3YXMgZXhwZWN0aW5nLiAgWW91
IHNob3VsZCBjYWxsIGFsbA0KPiB0aGUgY2xlYW51cCBob29rcyBoZXJlLCBzbyB0aGF0IHlvdSBj
YW4gYWxzbyByZW1vdmUgdGhlIHZwY2ktPm1zaQ0KPiB4ZnJlZSgpIChhbmQgYW55IGZ1dHVyZSBv
bmVzKS4gIFlvdSB3YW50IGEgbG9vcCBvdmVyIHRoZSBhcnJheSBvZg0KPiByZWdpc3RlcmVkIHZw
Y2lfY2FwYWJpbGl0eV90IGFuZCBjYWxsIGFsbCB0aGUgZGVmaW5lZCBjbGVhbnVwKCkNCj4gbWV0
aG9kcyBhZ2FpbnN0IHRoZSBkZWFzc2lnbmVkIGRldmljZSBJTU8uDQpPaCwgc29ycnkgdG8gbWlz
dW5kZXJzdGFuZC4NCldpbGwgY2hhbmdlLg0KDQo+IA0KPiBUaGF0IGF2b2lkcyBoYXZpbmcgdG8g
cmVmZXJlbmNlIGFueSBzcGVjaWZpYyBjYXBhYmlsaXR5IGhlcmUsIGFuZCBuZXcNCj4gY2FwYWJp
bGl0aWVzIHdpbGwgb25seSBuZWVkIHRvIGltcGxlbWVudCBhIGNsZWFudXAgaGFuZGxlciB3aXRo
b3V0DQo+IGhhdmluZyB0byBtb2RpZnkgdnBjaV9kZWFzc2lnbl9kZXZpY2UoKS4gIFlvdSB3b24n
dCBuZWVkIHRvIGV4cG9ydA0KPiBjbGVhbnVwX21zaXgoKSBlaXRoZXIsIHdoaWNoIGlzIHVnbHku
DQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVu
Lg0K

