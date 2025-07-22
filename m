Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B1FB0D118
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 07:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051944.1420414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue5Ca-0000XD-9z; Tue, 22 Jul 2025 05:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051944.1420414; Tue, 22 Jul 2025 05:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue5Ca-0000VD-79; Tue, 22 Jul 2025 05:06:08 +0000
Received: by outflank-mailman (input) for mailman id 1051944;
 Tue, 22 Jul 2025 05:06:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uo4O=2D=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ue5CY-0000Uc-NM
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 05:06:06 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2408::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9141506d-66b9-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 07:06:05 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MW6PR12MB8757.namprd12.prod.outlook.com (2603:10b6:303:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 05:06:00 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 05:06:00 +0000
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
X-Inumbo-ID: 9141506d-66b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSk5/nV9Pxydhy86dCvAaaICMlBVZkJg6pE1iUWgy9thfdqRkcyC6KRDzaGnkpufEV6yM8TczHv5NtbRmDGI+1VBqurYTD4y6Ul3tqFDr/mItk6ekCePzX/2TZCSmEO7Fy1OvPsqdgGraoIqhOVhfXCpKcFA8YAGy/P6LlcixgRB+iFWMbiUJvbtye4H7Avmuq6Dq7nbO0KnzZXfedr5lwyFSGS7yt7CN3TZWUbWTcD8QC5ElgzqNchcv27V1woMB0TYiQXmhgy62peFXC9SbKi74qVcjyCXXeNdaq4+/YbuYurx9UxLx2H9JC6KM0Wkg1qOZZ623SGy/SyDXel+2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahH/iREqET1QswsYPyGgWN49lXPhu6Su9kZrW/lQBQY=;
 b=IZhyPWN9WExjJvizCiZAdOv0b5fCQkiarkCf6of6jarwJJE48n7Dam7IVpC0YiNWdMdoJ9aZw6Eg3u5jHQqmnih3DTlOMh2HiLGdPQMSqzBrKPF62NxbKufTfba/AH8jGN/8BkyC+4uq/jEYhKDSSH50SYUXwRxj8z6N1WVOOvFoHQkaUx/61e+mpP+YzuJYtxyN5aQqwd9GbZ15msHYyxTML8K9DoYZ/CtvhdZR+Orm/FP+m2dEkpx7wnU3V5nJ5I4w3QG4eZ0Wo4avnOtHeqTSql1HXbQJoboo9bwGaOW0m+ygOHacMsu43+puwSg01Fp3YBrcv12gdA6RxQt+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahH/iREqET1QswsYPyGgWN49lXPhu6Su9kZrW/lQBQY=;
 b=0UIKH/8F3uYL3ttjSw7Q1HBPncaIKtc67TCgHL/V5O8uxVtUpd6QwjAneMgTndVYlIcIIXaSL5cpYR8tGBELLnFLm7wkjGnQexasM5rreSlDm+D5Ah2DxsWzYzt74si/BfhrH598u4D+41Gsyly6gsUb3IU0FORDRqk4Q0Cecco=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
Thread-Topic: [PATCH v8 7/7] xen/sysctl: wrap around sysctl hypercall
Thread-Index: AQHb8hzZ4PaGCcXW4ESgBHjQZ1Y4rLQ2DLKAgAebZgA=
Date: Tue, 22 Jul 2025 05:05:59 +0000
Message-ID:
 <DM4PR12MB8451571C1DEBBA2F5FA66A87E15CA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711043158.2566880-1-Penny.Zheng@amd.com>
 <20250711043158.2566880-8-Penny.Zheng@amd.com>
 <5238ec09-2a00-4f80-aea6-95a3ab617b0d@suse.com>
In-Reply-To: <5238ec09-2a00-4f80-aea6-95a3ab617b0d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-22T05:05:48.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MW6PR12MB8757:EE_
x-ms-office365-filtering-correlation-id: fb55d074-d091-4ca7-0cc9-08ddc8dd72f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUw0M2hsTDRTSXB2SlZibk9VQVBIZ251MDNSbkUvTE82dkF6SHQ1Y0NLTkJI?=
 =?utf-8?B?YXN3bTd0RFUwcDlHRTRkelEvRzZJc1E1T0VSOFd6eUs4WENodzRaZ3FYNUo5?=
 =?utf-8?B?VGRLT1NzRnArN1lhTEhJQldrMUZjYlBUSmlNT1pXT1NLZ2dpa254QkN0b25z?=
 =?utf-8?B?UWk1VEwzYSszaVlVY01oSXhDNjV1MHlvWlFiU1NaSDFaN09LR05qNHRhNlIy?=
 =?utf-8?B?YytqSWZJNTlvaWc4TjdwL2JqWlFzTjRTOURVVTNQQjd3NC9qakF5cjdlUi9l?=
 =?utf-8?B?MGFDMHdDSlRkMEEyWHlheTVBYmZXcS9lOG5KbkpibUFZUXF3VWhzeTcwSmx1?=
 =?utf-8?B?MVJQa0tuT1dyRVNnSUlYWXJJZVhFMTJyYm50eXZJZjNlVUV2MTArU0dEUkZF?=
 =?utf-8?B?ZmZsMVd6bW0xdHdDRTRTcFgwaFVXb2lVL1c1RVVHdlN1WS9DeGxRb0Z0SjYx?=
 =?utf-8?B?MU5wWTIybU9CbVc3dElYL3p5NFRDZk0vWEF6MTJkbGVzTDgrRGhBOUpOSkZn?=
 =?utf-8?B?YWQyVFBvTkhlYlZNZGhYOTVmRW52VFVRd2ZDSWNPZytzaWRocW1vSlZSZzEz?=
 =?utf-8?B?WUtoWWFhWkFTVEhENkRTOWxkK0QvMDQzYlAyRWpldjNTVk9VVFExam1YYzBv?=
 =?utf-8?B?MEY1L1VVSW0rUUZmeEJDS0VUWmttbUg3elBFQnNBN0diclZxVzl1UXpQVnFj?=
 =?utf-8?B?NU5RL0tqOWx2TU5EQnkzVGJHSUNTTU1RNlRveC9oYVhZVGRCVzFYZXhmaXhH?=
 =?utf-8?B?bGlYbTZFNWJqRTFFVmlia09uVllVVDFneXBBaWNKY2tmemgrWXBFZ0E4b21G?=
 =?utf-8?B?czJyRWg5d2RJWjViUXByb3cwUzV5dVl6OU45aUt5VWRGRDA0aS9DWHZ2c2FM?=
 =?utf-8?B?TEh6MHJ5U3dZb2poejNGWUdhTWZRY2Y1QU9GSkc1MXlpTWQ4bG9BK2xON0t2?=
 =?utf-8?B?ZitNQUNnRTE2U0xKSjJtbTl6dXZRaStPemxGcjZBMEN2c0U0MGlEZ1FoRmRt?=
 =?utf-8?B?SUtadW5aTGE4LzdBdDhkbzRIY2RsSUNnaXB4MnQ3ZyszV1l2dktzN0VjdjhU?=
 =?utf-8?B?Q295cUUzOCtoRXVzdXIzMExHc0VsVEVWNFJVamxJT01mTTdVam9RZEkyeVRj?=
 =?utf-8?B?NVdYMkN0TXliYWNKYkcvNWFlQmk1bTVyZ0loUVpjakxIb0U4OXFrejZ3Qm1w?=
 =?utf-8?B?dVhSak1kT3ArUW1vZU55U3pKYjVyYzZvL3A0TUFoUzV5Z2lYV1RlQlpKZzZP?=
 =?utf-8?B?SFc4d3ptMk1DdkRNdGJSM1RwbngxVCtmTHVPZFVRK3V5RHJ6eGtnSDUyemd3?=
 =?utf-8?B?c0R6NGgrTDlTZWROT0NQVGhUSXhOS0swbjcxc0pYWmN1R1lGNXdVckZxNXBD?=
 =?utf-8?B?TEo5M1pKL29XT2trZllaM0JHWkZ5YjYwbWVsRGtacjAvWkpkV2lKaGRQWHJU?=
 =?utf-8?B?WFV4akFZSDRGQW9aVVlVdWFxNkR3WXl2RXRYakNtaks1WUc0ZjBzYkhTaXV3?=
 =?utf-8?B?UWdUei9qckZuYzBRTEk0elBXZUZjUFVBYi80a05ld1o1RVdJeWZ2RUd3a3Vn?=
 =?utf-8?B?d2QrME5EWnFXR3VscHRSa3NTa2pDNVBiWVpoejdVUDVYbFc2VldVK2lOT21w?=
 =?utf-8?B?LzBvQVBCWVVuazZ3Q3ZjV1I3M0JBZjhjbEx3bGhOYWsyKy8zaW1UVFd2dU43?=
 =?utf-8?B?TlhYUFozZERWVnlpNFFuMkQ3cnhpWW5GeCtnSVZaeDVReGduelZlbGZMbm9s?=
 =?utf-8?B?NyswQnlYeDlEZVlCY1lsV2pIWFR4N0tYb2xOZFdGRll1SThCaHRnZEozUkNJ?=
 =?utf-8?B?Y25YUllHdmh2QVVSMlZGb09WMDBIMEk4d2JJVmZPSmVKaVVYb1IzMjZEaS8y?=
 =?utf-8?B?eFMwTFlFMzl5YVZHTFhvMnRuaE1kYklTNWpCeE1GMkxrMjdMSGxqUmxWVVNW?=
 =?utf-8?B?UkVlZWk0UWFVS0duYk9oNFVtR0w2Z0UyVlVGc2VQSHlFdUcxVGtHdkk2eStB?=
 =?utf-8?Q?4d3p1q2BnZt01ds44uN9OSPNaIft44=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHU3UGNKWXVpNUQySkNpVEhoTkE3czczdHVHcldrbWJzSEpjQXNSSGhmbk1C?=
 =?utf-8?B?WUFyVjhqQ2V6bHR4WGhrQXpmUWJ2elhycUp5TW9Pbm5uK01mdkRQS01jdWkv?=
 =?utf-8?B?SmNYMHQyMXl6R1hub0lCSjF3SGVDMHU4R0pHZU56WVVsR2NXVjlXQjRYZjJB?=
 =?utf-8?B?ZzIzdElsRUxMZjZsM3VoZCtTaVdPa1FZcXpqcDdOU0Zwdkh3U2xoR1hFTThZ?=
 =?utf-8?B?MjM5bXNkblFkY2xiRnAzQVNobTk5UjhGcWVFRnFoYUNCVnIxdlpXVkZVNzRl?=
 =?utf-8?B?bkNRcnYvYmV4UHNqWXZQTWx6RGhIaldhUFJTQzM4WHIwOTJTQnd5c0tYaXZu?=
 =?utf-8?B?Mng2ZVlzbDd1cFFpaEt1dkxmWEkra3pQTXFxL216aVZoNHlYMVpXMnV5enZl?=
 =?utf-8?B?OHJIWlNobHQrV2dJQnIya3lYTDk1RENkQjBPbGlPSEJjM1MvM1M2TmZhRFVh?=
 =?utf-8?B?VU9kM01PR0dHZ1ZBVmM5ZTUzcmtsblppbDlDN2ZncDZzb0ZSR3NFNWFYamRv?=
 =?utf-8?B?Z3hYc2phdkYwV1hicUxFQ3FXQ1Ira1YvbXZjWXlFV0VXNXVMQTh4am1UUUc1?=
 =?utf-8?B?TjNCZnBKdWlRa3llZStKdFJtRm56bUdicWFDUkpucGQvbW5HWTRUUU1qRXZa?=
 =?utf-8?B?Mkc2REMxdlBjRTVnWW1aU0g4UEwwM29VY0pPenlDYW9BNkVwMzkxZEFVdEtH?=
 =?utf-8?B?Rk0rb01FS2ptOWpiK2srNHlWZjgrUHRySkVHWTlqSWJUQWxlZFp5a0Iyd3Fk?=
 =?utf-8?B?LzhHcytZL3duaVFOVlVpenlYN0xwbzRBS0svUG83aHJqcEhiZTNuWGllbEQz?=
 =?utf-8?B?SFhUdjRKSkU1N0RLQzhpc1gveFdFcDQvcUZhTTBldUtHZGxuNTcyb2xCbm5F?=
 =?utf-8?B?ZUdxbEc1VFQrS0IxcjBRbTBnK05kcXo1VDJNQ0lUYmU5YndMUHVZVloyYlY2?=
 =?utf-8?B?NDJtWVJuMDZsc3Q4TWhoaEtkU1RKcnVLMHlIRHRRVHJvUms0WDdMTGd6bEdj?=
 =?utf-8?B?UDhGWEczSWJpN0Q1S1JLdE1icUMzNXFnM0Z0UUpubTZ0NjZBSjVkSzNyTEJB?=
 =?utf-8?B?TDl4RUNJSTdycjB2SUg1aTkvSStURzh0SjNpWlpCQzhyM0txYjNrS2xyWnBl?=
 =?utf-8?B?N0ZleWxKUmV3cWh3SmpqZlNmV1RoRjZJelZoblEvZDgzRS94TXRaaHA2ZGVj?=
 =?utf-8?B?ZVQzeERROWcvUDgyN3JoQUJDSWh3aS9OYzBsdEVNazgzNFQ3bHV6V3k5NG9v?=
 =?utf-8?B?RnNITEUrN1IwZG95V2ZIb2xlWkJsZEtOaDR6dlhSNHBiZTFzVDc0MjVYUmNJ?=
 =?utf-8?B?YkJKaTZxTkxweFJmQVZDblJqSTJJeDlwV0ZlOTc5b2gxb3QyMmZKTHp2NkxC?=
 =?utf-8?B?dXlyQStjTVMyTU9yN1FLeHlsRlpIV0F0M2VBWmJveWNjcTVXQ0toZWQ3cTFC?=
 =?utf-8?B?Q21VdmdBd1RTMUhaWkl1QXYwcTl0NHBmOHN6WnRvVGJ1Z294N0tzUXU2RVJL?=
 =?utf-8?B?OTFUVllBdnBwajNMSVZCKzRxaFhrcEVxVkh5dmxwSWIwVy9pZG9HS3h1RGt3?=
 =?utf-8?B?VmExbXM3Uk5IbnRIS2c4b1dNQVE2YjY3a0k1QnVjZkRmRkFrZkVsaFgvUzhC?=
 =?utf-8?B?NmNZdkxrS0NyeG1oc1NwN3lOZUlTREtSTUVBWmtDNDRZSWtvY0pONUFPNWhC?=
 =?utf-8?B?WTQrcDNqMzAxVzA1ZERUMURqT0NSb2hjeEZ0SitqVmM2T2lGeFVYdkFhSy9k?=
 =?utf-8?B?c0JScHFjNXltbXBCRURUMW43cE1EOFdBbzlvMzg2TFdmWHozazFTOEM5TGxY?=
 =?utf-8?B?S1NzMzlTcXg4ODYrUEkybUd6WnNqUkFyWHQ2eFBVRDg5TUR1V2J5NUMyN0Rw?=
 =?utf-8?B?eTNCeS9TVnRPOGtHK0pxY2wwQ1VJclFsdkJDL1hWZlFseXRkRjdZbFU0YUF2?=
 =?utf-8?B?YkJFYXJCT2Nza05xY0lqUXZCV1dWUlZMemo4ZnJmNzcwUEhKU1paVk44a3Fm?=
 =?utf-8?B?UEVMQjgzTnRTTTNZQ0dJOGVISnh0N2kxWHg1bmo1RTJUSTNMS3BwN0xYMU9L?=
 =?utf-8?B?bXg5RGV6Q1dJRGlEUW9JaHJRbWt3Z210K3ZZVkhDNHFjTGM0T3V5L2FiUHlX?=
 =?utf-8?Q?4mRM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb55d074-d091-4ca7-0cc9-08ddc8dd72f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 05:05:59.7888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PqvdeyXUF4mbRjvrdjFwq2uvgOLeXUDugUAL89LAZXVFN+6VJJ+bSceRks1I9PD6jF8mwDORRQ6+StMTn5cuIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8757

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDE3LCAyMDI1
IDQ6NTUgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT47IFN0YWJl
bGxpbmksIFN0ZWZhbm8NCj4gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPg0KPiBDYzogSHVh
bmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsgUm9nZXINCj4gUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBBbnRob255
IFBFUkFSRA0KPiA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNoYWwgPE1p
Y2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuDQo+IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFNl
cmdpeSBLaWJyaWsgPFNlcmdpeV9LaWJyaWtAZXBhbS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggNy83XSB4ZW4vc3lzY3Rs
OiB3cmFwIGFyb3VuZCBzeXNjdGwgaHlwZXJjYWxsDQo+DQo+IE9uIDExLjA3LjIwMjUgMDY6MzEs
IFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9jb21tb24vTWFrZWZpbGUNCj4gPiAr
KysgYi94ZW4vY29tbW9uL01ha2VmaWxlDQo+ID4gQEAgLTQ5LDYgKzQ5LDcgQEAgb2JqLXkgKz0g
c3BpbmxvY2subw0KPiA+ICBvYmotJChDT05GSUdfU1RBQ0tfUFJPVEVDVE9SKSArPSBzdGFjay1w
cm90ZWN0b3IubyAgb2JqLXkgKz0NCj4gPiBzdG9wX21hY2hpbmUubyAgb2JqLXkgKz0gc3ltYm9s
cy5vDQo+ID4gK29iai0kKENPTkZJR19TWVNDVEwpICs9IHN5c2N0bC5vDQo+ID4gIG9iai15ICs9
IHRhc2tsZXQubw0KPiA+ICBvYmoteSArPSB0aW1lLm8NCj4gPiAgb2JqLXkgKz0gdGltZXIubw0K
PiA+IEBAIC03MCw3ICs3MSw2IEBAIG9iai0kKENPTkZJR19DT01QQVQpICs9ICQoYWRkcHJlZml4
IGNvbXBhdC8sZG9tYWluLm8NCj4gPiBtZW1vcnkubyBtdWx0aWNhbGwubyB4bGF0Lm8gIGlmbmVx
ICgkKENPTkZJR19QVl9TSElNX0VYQ0xVU0lWRSkseSkNCj4gPiBvYmoteSArPSBkb21jdGwubw0K
PiA+ICBvYmotJChDT05GSUdfVk1fRVZFTlQpICs9IG1vbml0b3Iubw0KPiA+IC1vYmoteSArPSBz
eXNjdGwubw0KPiA+ICBlbmRpZg0KPiA+DQo+ID4gIGV4dHJhLXkgOj0gc3ltYm9scy1kdW1teS5v
DQo+DQo+IENJIGRlbW9uc3RyYXRlcyB0aGF0IHRoaXMgY29tYmluYXRpb24gb2YgY2hhbmdlcyBp
cyB3cm9uZy4gVGhlIGpvYiB0aGF0IGZhaWxlZA0KPiAoZGViaWFuLTEyLXg4Nl82NC1nY2MtaWJ0
KSBpcyBhIHJhbmRjb25maWcgb25lLCBhbmQgZW5kZWQgdXAgcGlja2luZyBib3RoDQo+IFNZU0NU
TD15IGFuZCBQVl9TSElNX0VYQ0xVU0lWRT15LiBXaGljaCByZXN1bHRzIGluIHN5c2N0bC5jIGJl
aW5nIGJ1aWx0LA0KPiBidXQgZG9tY3RsLmMgbm90IGJlaW5nIGJ1aWx0LiBXaGljaCBsZWF2ZXMg
Z2V0ZG9tYWluaW5mbygpIHVuZGVmaW5lZCwgY2F1c2luZw0KPiBsaW5raW5nIHRvIGZhaWwuIElu
IGNhc2UgdGhlIG5leHQgcGlwZWxpbmUgYWxzbyBlbmRzIHVwIGZhaWxpbmcsIEknbGwgc2ltcGx5
IHJldmVydCB0aGF0DQo+IGNoYW5nZS4gSW4gY2FzZSBpdCBzdWNjZWVkcywgbm90IHJldmVydGlu
ZyBtYXkgYmUgYW4gb3B0aW9uLCBhcyBsb25nIGFzIGEgcHJvcGVyIGZpeA0KPiBzaG93cyB1cCBw
cmV0dHkgcXVpY2tseS4NCj4NCg0KSSd2ZSBwdXNoIGNvbW1pdCBvZiAiIHhlbjogbW92ZSBnZXRk
b21haW5pbmZvKCkgdG8gZG9tYWluLmMgIiB0byB0cnkgdG8gZml4IHRoZSBlcnJvci4NCg0KPiBK
YW4NCg==

