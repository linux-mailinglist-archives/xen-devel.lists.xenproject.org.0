Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE767A1773D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 07:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875102.1285420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta7XI-0007W2-TA; Tue, 21 Jan 2025 06:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875102.1285420; Tue, 21 Jan 2025 06:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ta7XI-0007Uc-Oa; Tue, 21 Jan 2025 06:14:52 +0000
Received: by outflank-mailman (input) for mailman id 875102;
 Tue, 21 Jan 2025 06:14:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1SE=UN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ta7XG-0007UB-Qo
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 06:14:51 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2406::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0321d29d-d7bf-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 07:14:47 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB9322.namprd12.prod.outlook.com (2603:10b6:8:1bd::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.21; Tue, 21 Jan 2025 06:14:35 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%4]) with mapi id 15.20.8356.017; Tue, 21 Jan 2025
 06:14:35 +0000
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
X-Inumbo-ID: 0321d29d-d7bf-11ef-a0e4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYnW2RliAK95Irhli0gwiMUGP3M4TMFWuU+8U5kAuK7FgcBuRE1Kh+3JjSc4vUWWSNU6pxUNomNWdw2VfIHkkt5ChIjwYtDhsYaSejMgsTfXABM6YfmfJyCK7de9mgUXJYzy1dSVp5MK3slXBzevdu3FJ1yfuKUKT9bzg1TeTqJX0TzPdFJZAWchTwLyM95LmQ5HC93jvrLs8w5ALlYQ+O5dmuFKRF35ao9okCOZKxWLe/x1LzSi5gNXmDUtPSIQO04MjloREfDasytwlzH3Fqp9vTto6KnGT6o7+CKIrw7JmUopS2HIozpJ6D1bcwdR27FIPlpCZSvHC5y7egiUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fG836oHwTdrPMz2amjx3nm1KdAkHqkh6gz3fUaNbtbw=;
 b=cdUkaMz3KvvntgENijOrCna06NwxEpnSyjb4tpMcMoARPvO7nZUxWzb0kL0rc7igALShEIRjN0rHLQB8vIZ+WTu2bD4MQl5KcNLYQjXb13UyNw9Pd+HWJm4HeZvPfzJ+NjqG4aDOQ2iNZxraTyYsFTjYoLgFU1dGPHJfQQlrI06ADn/aTh7jNNgZQmeGoJq0u+pNVMa1eH6CjHfD1AfFsGuQofu0pBq1IVSo5Z08tI9dV2F2VmCF+SrpzDrPwa7pFFjIIhbdwVTH9+7xa+RUewidwOEhj68JpitRAszI040kxBEYS2TTRdUiLNqF/UreaUpi9OaZ4B87gvPCPWdzAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG836oHwTdrPMz2amjx3nm1KdAkHqkh6gz3fUaNbtbw=;
 b=46aKrLorluoPBnctHo7D2DIotC5+S6dQtmzj4gP2SW4o2ajHuwlSk8KcKZbesOQJezVPW8Ms0ykdlyoH5/C5xhbaCQIuJ03zGiCIw+TFZJ4oJGUcwR8DJ/wRB+JzC4xRS6o1C0hFfRyXObm8OcU1xl2JYl71YJeyknoDNfaE24o=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Andryuk, Jason" <Jason.Andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 05/11] xen/x86: introduce a new amd pstate driver for
 cpufreq scaling
Thread-Topic: [PATCH v1 05/11] xen/x86: introduce a new amd pstate driver for
 cpufreq scaling
Thread-Index: AQHbRVybhl3TP2LETk2QrPDVcEclFLMOfzaAgBE8HHA=
Date: Tue, 21 Jan 2025 06:14:35 +0000
Message-ID:
 <DM4PR12MB8451942DEC644085A16F2391E1E62@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
 <20241203081111.463400-6-Penny.Zheng@amd.com>
 <f7f03617-e438-48c1-b5b0-1ca975cbc7e6@suse.com>
In-Reply-To: <f7f03617-e438-48c1-b5b0-1ca975cbc7e6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=78932ae9-7ceb-46b5-b1bd-5573345af994;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-20T10:06:50Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB9322:EE_
x-ms-office365-filtering-correlation-id: e45c6755-7a72-49ee-c468-08dd39e2e0c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QUR6Y09ZbFd4RFpiVjVBd3dXeU1Jb0hOMkRUTTE3RnFRSzZTZUg0Qzd3M1RI?=
 =?utf-8?B?clE5U0NmV0lQVDB2TlN6enFjenl4RC9MMm5EWEFRNVZWUFZnK2ptYVVUblIx?=
 =?utf-8?B?V1ZZSXZJZTgxZnlMSHBqbnZtNW9CbVp0M0NQT0ExNktGNW9yRkYzZzhndVB1?=
 =?utf-8?B?UlQ3R3drb0swQWtWUzRXVkxEQXViNDhRRllETjZtZDJoVFZSeWZmVUtmaHcz?=
 =?utf-8?B?eTRKeWNCOTB0REJ2NGZXUjhucEtEdXpDKzlya2h6VFBhUzAwR3FhRzg3ZlZa?=
 =?utf-8?B?Z0cvU2o4MWJXZ3UzWngwbStIMnY2bDNiTnY4QjVUb2dOdVQzdlUrd2E5VlZK?=
 =?utf-8?B?WE0zdDFaTXV4SG5ad3FrTU5OU3BMYVZJblAxQ3hUT2VLS09EMXVCNkJDWHBN?=
 =?utf-8?B?ZDU5TE9LM2ZzSlJkQWJTYUdvVE0yTDRKM3JpYnJzNHVYOURpQVMxRDRDTHln?=
 =?utf-8?B?OTRWQmtVVk5qdVNVZGNnWGl6aG1HMyt3RktrVHkyaXJiWWVTNnZLamZLLytj?=
 =?utf-8?B?dEVVc3M2cUlHM3E4RmhIWHpTWTV5VGZyOFZxSVJQU0xSSUNEakJ1SUF0aHM5?=
 =?utf-8?B?UGxrVEhMa1hPRVdyMkxIUWkyWG9MNU4yVVBHOERMUTE2eWN4U0NPK00yaGJR?=
 =?utf-8?B?QTNMSjk1QlU0SUpqaDZjS2dGcmcyME10a0hrQ1ExS2szOEMrMTk3amNVbGk4?=
 =?utf-8?B?Z3dlSzIwYXJ6dGpwLzNteWZzWENjd2lzaEZHajdLMVdTakhaekJtZlVRQnFC?=
 =?utf-8?B?MXBQTU1vSy91S1luMUx3K0VlS3dwZmY3eGhQaDR4L2RvYVowMmF2NlRQKzJJ?=
 =?utf-8?B?QnpKMUJ3WUlTMm9Xc2JDbjRadi9BQUFLNGVoSmk4RC9hWnVTclRoWWdRYlRj?=
 =?utf-8?B?R01rY0RTMFlicTRXdWZFbUFBaURBRFE4L1ZTNUdtT1kwTGdHbE1yeU42ejVV?=
 =?utf-8?B?dUdnTUdidDhZZXlHYzlqS2FBSk1pSkJhWVRSNGFvL1dqUnRUSG5aN0U5VzI3?=
 =?utf-8?B?RlltSTJyVXBBN3pyRE9wSC9kTE1hcndMZTdiVENlbkp3VTAvU3NnWnRJOUNs?=
 =?utf-8?B?ODdHQkVLZ1NmRzk4VkhsaUFxTk5yUlZmN0ZQZmQ5Nm1RTzZIc1FmZDc3WEdk?=
 =?utf-8?B?UUovU2k0TktDSjNQWUNYVStLUFkwamRJdVpWQ1RjSFljV1lnME1sWG02cHgy?=
 =?utf-8?B?WURsVXBjK29RODdnVzhvZDNZZmUwL2JsWTNaczB5azdnK0x3QUsyTWM3VG14?=
 =?utf-8?B?ZmxUc3I1RHAyUlV2NVAyRzVvdnpZK2g0ZUpNVTAxODluSmt1djdKS2RJSlN3?=
 =?utf-8?B?WkxVVk1ibVhucGdHZzVyOXlJUEwyTzZFdi9vMVN2a3VmNllBUjgwb1V3d3g0?=
 =?utf-8?B?Uk1RdWJTUEQzRStlY0k5bTArR1lreXE4TVZtT3FlMGZGR1ZJMkJNdHc3bWlx?=
 =?utf-8?B?WGQ4V0hkQUgrNkZYZ1F2K1FwOWFzTi8zTDR6cjJSdkJHRDZUZEZDRDhCQnRx?=
 =?utf-8?B?enRzd2VuTkdSWmtyQkVUaHFXTWR6SFZzR2RlSlhEWWxLT2RxS0ZHYndyck5M?=
 =?utf-8?B?R3NCN1A1VkYwdFJhNk8rZUorREhVMWduS3ZKQnp4VjVuWjg0S2tNQllaUjBt?=
 =?utf-8?B?RDl2Nk1QUWY3M292aXBvNFc4NXhoMWd3bldJNVNnVWRSRWJxY0YrQ3lERWFU?=
 =?utf-8?B?SmxGcTc3TWZIQVl5dVpPOWF5aGh0L1Z6alF6cThJQ0ljNjlvcFBWQTdrOWUz?=
 =?utf-8?B?Z0NzMkw1aWlFYkdOQStEbDZnKzFqbEd4V1JJMjI1bTFhMDNuVk1FMzA4a3Fj?=
 =?utf-8?B?cEwwUXVGclFJS1NLRVJRejl6emY3ME8vUWlBMVllWHNjTmhOSlZ1QnhPZ3ov?=
 =?utf-8?B?TjVCek5QZnc2a1JHWi9wbFRkbkFHZFdPYVpuNTJVTGNLVzdRZU5tdHE4L2Nr?=
 =?utf-8?Q?9G8vL1U5Y96q6HJEf0A/XZ4DBFCMfOCh?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aFZqU1k1RlQyUXc3aWVXWFlxc3FRMEJtVFA1ejhtQW1LMVJnelV0d3pOSm85?=
 =?utf-8?B?UFluT0dnYTZlejN6V0swelNCRUQxZkNhNkpodzVRcjlmekowTHMrbjN4RWw0?=
 =?utf-8?B?QUh0UWwwSDVBaERCU3FxTFRPV2Qrd1NBRTIzT0lzTTQ4ZVVCMTdaeCtFV2U3?=
 =?utf-8?B?eXRUOGZEU3BKL0pPSmhNdUVSa2s1WE8zeXFLalQ5U0J6Q21BY0FyN3ZLbFVz?=
 =?utf-8?B?Rkp4eXJrckdvNlNHNnpIUGV4MzFodjhPUndzN1FlT2w4d1lLYUVvR2hFRFZp?=
 =?utf-8?B?b3FJTVdSVFRmRzNNYm9lZDk3bThaOVJ4dDVmcWhoSnAwcGcvV3Z1VisyVVMr?=
 =?utf-8?B?VTBoWTFXckZzbGJhaDdhVHZOelh0RkhiYTQyYjVHZXBtZjdHakdVUi9QV2Vw?=
 =?utf-8?B?YmpkNjJxUUNxY3p0MWtBR3B2Q0g3cHMwY2t3RGJrNEF2Slgva2NSQXhmMlpk?=
 =?utf-8?B?ejRLajZ3Q2R1cC9CT01hcUU4NENNSGVpczd4cWdQN3czeWtGbjhnYmYzTDdQ?=
 =?utf-8?B?RENFMC9SdllyMVVLaXhra0dnaUI1M0VDNXpvb1FqV1F2dWg4RC9pRTJieUdV?=
 =?utf-8?B?M25aRnBLRFdpeTZuUjh1dVpLemRqWWpEMUxXaVVCTENLRVdQaWcveml3NWN4?=
 =?utf-8?B?bEd6K3hTTWt3dHI2RENmSjF1RnZhMlluYUNxWFRRcXJ4ZVdhQWNRaWJURU5n?=
 =?utf-8?B?czdmVDdkQnZOdElQZmJxbTErVlMxR2JvVEczN2MyRy9RcUxOcVZzQWVrOGF0?=
 =?utf-8?B?eEQzV0pnSWk0cTZJWVRRRkJ0NXlXRUsxeVk3clFadHVpdlBQclg0N1hiOStl?=
 =?utf-8?B?R3EyZDNSYmlaUExWRGh6NUtRMlRiTTVXT2ZzanJuTjl3czdDeDZQbk1EZjIr?=
 =?utf-8?B?Und0cVBhSGhqUWl0cmNtVU9Id3BCazF3VmoydTRNT0owR1NmNWM3R1h5ZUhy?=
 =?utf-8?B?SmJQdnJsTEd4b21HU0M3cWdvdzVvMHJsbU9WUVoyZlhzaFcrNGlwZUhhWjND?=
 =?utf-8?B?MGtkelRiN2VPcUdFNEE1amUvZFhveXNaUmlFSzVnRDlYTVJ2NGdLUDJnS1FD?=
 =?utf-8?B?NGJBWE55MFN4M1kzSFFhckVjN25IUW9GdlhLT216SksrVjFoMjNyWmh5emRi?=
 =?utf-8?B?U25ScG9lWWRmL3cveGd1M1pTaElqbzlJekpqS3dMNktXL2c4QzBJK1ltR0ZR?=
 =?utf-8?B?aDdpcTdTR3FjR3ZYV3h5ZnlCV0pndjVwMW9zWnFPUzRIVXhqS1VMSnZyQ1pD?=
 =?utf-8?B?aW1KUllHcGJrT3FnTzdJSVQ2bDMvc3h2N1BaMFllQ0ppR3J0OHI1eEFuR1BF?=
 =?utf-8?B?UXNIdkRWNWJCMlk2bEhDSjZqVVdndmNXcnNHekl2NzJZczlrQWFNcnE4VjB4?=
 =?utf-8?B?eUZ3YlVzclV2eTNER2N0M3BiS255dHhXQzB0SStIS3p3NFh0YTJLSlFWWStn?=
 =?utf-8?B?UnRvZ3o2NmJiOElUY01QMGZlWlZEeUhxWDZtUWFmeUMzMnJBbW9YWjFiTmJQ?=
 =?utf-8?B?a2xrYStSVDkyam5oV3liR1RlalRhdExNNUQ1WkRabVIxcys4YVF2YVZ2OW03?=
 =?utf-8?B?Uzcvb3lPcWNRZFpSYWc5MytKelFBS3BSNGlyZUtITmNqWjlwc1RiS0FDL0Ev?=
 =?utf-8?B?RkhSVldPZ1FuNkhLbjI1Q0xveUhNQS9BTFg1cndOdGd1Q1V0eEVkL3N0SHB5?=
 =?utf-8?B?T2FnM2ZldzZGYjUvLzE0aXRHcmZuaVlHUWZCTWlNSnpqeExXaWFsbkZnM1Uy?=
 =?utf-8?B?a25FNW5BaGM0dDdydmJKencrRHJieTVZdEZSZy9COTRpUjRrMzFXR2t1UmpW?=
 =?utf-8?B?VmY1M3NjVUVjUGRDZWhnWDZrYXJQV2REMDNPd3VUbUJaM28zWDZxM1NBMUhu?=
 =?utf-8?B?RHBMbzZ3S2I0bC9ORVN0MkRTTWdoZk5oTjNiQXRoNVhaNE16TzNtekpaanBU?=
 =?utf-8?B?OVFDWnhpMWppb0k0eHNBaWF2eHM5U0FGRHRYWVo3ZkEvdE1IcHp3ak5qUmVh?=
 =?utf-8?B?VThpa1JKVk9uUXB1eDZsYjlLTlQ3TjQ5RGJCY2V2dS8wUW04c1hHWlVQQjgr?=
 =?utf-8?B?dHJVRW5JTjJzZ3ZrR3lFSXJuM0l4azcxYzV3cUFOM2poOUd1SDdQSytVZHFV?=
 =?utf-8?Q?ezAM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e45c6755-7a72-49ee-c468-08dd39e2e0c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 06:14:35.2696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7qp7fnBMYtphhd+gdClBXjyoWCCYD1Wu9l21uIAAtJCAY2EuFdCGANtrus0L1ZYXCFPremt4FX6jZFVdul+5Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9322

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSA5LCAyMDI1
IDY6NTUgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IFN0YWJlbGxpbmksIFN0ZWZhbm8gPHN0ZWZhbm8uc3RhYmVsbGluaUBhbWQuY29tPjsgSHVhbmcs
IFJheQ0KPiA8UmF5Lkh1YW5nQGFtZC5jb20+OyBSYWdpYWRha291LCBYZW5pYSA8WGVuaWEuUmFn
aWFkYWtvdUBhbWQuY29tPjsNCj4gQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNv
bT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAwNS8xMV0geGVuL3g4NjogaW50
cm9kdWNlIGEgbmV3IGFtZCBwc3RhdGUgZHJpdmVyIGZvcg0KPiBjcHVmcmVxIHNjYWxpbmcNCj4N
Cj4gT24gMDMuMTIuMjAyNCAwOToxMSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEveGVu
L2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9hbWQtcHN0YXRlLmMNCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvYWNwaS9jcHVmcmVxL2FtZC1wc3RhdGUuYw0KPiA+IEBAIC0xNSw2ICsxNSw1MyBAQA0KPiA+
ICAjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9wYXJhbS5oPg0KPiA+
ICAjaW5jbHVkZSA8YWNwaS9jcHVmcmVxL2NwdWZyZXEuaD4NCj4gPiArI2luY2x1ZGUgPGFzbS9t
c3IuaD4NCj4gPiArDQo+ID4gKyNkZWZpbmUgYW1kX3BzdGF0ZV9lcnIoY3B1LCBmbXQsIGFyZ3Mu
Li4pIFwNCj4gPiArICAgIHByaW50ayhYRU5MT0dfRVJSICJBTURfUFNUQVRFOiBDUFUldSBlcnJv
cjogIiBmbXQsIGNwdSwgIyMgYXJncykNCj4gPiArI2RlZmluZSBhbWRfcHN0YXRlX3ZlcmJvc2Uo
Zm10LCBhcmdzLi4uKSAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ID4gKyh7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0K
PiA+ICsgICAgaWYgKCBjcHVmcmVxX3ZlcmJvc2UgKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX0RFQlVHICJBTURfUFNU
QVRFOiAiIGZtdCwgIyMgYXJncyk7ICAgICAgICBcDQo+ID4gK30pDQo+ID4gKyNkZWZpbmUgYW1k
X3BzdGF0ZV93YXJuKGZtdCwgYXJncy4uLikgXA0KPiA+ICsgICAgcHJpbnRrKFhFTkxPR19XQVJO
SU5HICJBTURfUFNUQVRFOiBDUFUldSB3YXJuaW5nOiAiIGZtdCwgY3B1LA0KPiAjIw0KPiA+ICth
cmdzKQ0KPiA+ICsNCj4gPiArc3RydWN0IGFtZF9wc3RhdGVfZHJ2X2RhdGENCj4gPiArew0KPiA+
ICsgICAgc3RydWN0IHhlbl9wcm9jZXNzb3JfY3BwYyAqY3BwY19kYXRhOw0KPiA+ICsgICAgdW5p
b24NCj4gPiArICAgIHsNCj4gPiArICAgICAgICB1aW50NjRfdCBhbWRfY2FwczsNCj4gPiArICAg
ICAgICBzdHJ1Y3QNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBsb3dlc3RfcGVyZjo4Ow0KPiA+ICsgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbG93ZXN0X25v
bmxpbmVhcl9wZXJmOjg7DQo+ID4gKyAgICAgICAgICAgIHVuc2lnbmVkIGludCBub21pbmFsX3Bl
cmY6ODsNCj4gPiArICAgICAgICAgICAgdW5zaWduZWQgaW50IGhpZ2hlc3RfcGVyZjo4Ow0KPiA+
ICsgICAgICAgICAgICB1bnNpZ25lZCBpbnQgOjMyOw0KPiA+ICsgICAgICAgIH0gaHc7DQo+DQo+
IFBsZWFzZSBjYW4gdGhpcyBiZQ0KPg0KPg0KPiAgICAgdW5pb24gew0KPiAgICAgICAgIHVpbnQ2
NF90IHJhdzsNCj4gICAgICAgICBzdHJ1Y3Qgew0KPiAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
bG93ZXN0X3BlcmY6ODsNCj4gICAgICAgICAgICAgdW5zaWduZWQgaW50IGxvd2VzdF9ub25saW5l
YXJfcGVyZjo4Ow0KPiAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbm9taW5hbF9wZXJmOjg7DQo+
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBoaWdoZXN0X3BlcmY6ODsNCj4gICAgICAgICAgICAg
dW5zaWduZWQgaW50IDozMjsNCj4gICAgICAgICB9Ow0KPiAgICAgfSBjYXBzOw0KPg0KPiBzdWNo
IHRoYXQgYXQgdXNlIHNpdGVzIChlLmcuIGFtZF9wc3RhdGVfd3JpdGVfcmVxdWVzdCgpKSBpdCBp
cyBwb3NzaWJsZSB0byBhY3R1YWxseQ0KPiBzcG90IHRoYXQgdGhlIHNhbWUgdGhpbmcgaXMgYmVp
bmcgYWNjZXNzZWQgdGhyb3VnaCB0aGUgdHdvIHBhcnRzIG9mIHRoZSB1bmlvbj8NCj4NCg0KVW5k
ZXJzdG9vZC4NCg0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIC8qIFJlYWQgUHJvY2Vzc29yIE1h
eCBTcGVlZChtaHopIGZyb20gRE1JIHRhYmxlIGFzIGFuY2hvciBwb2ludCAqLw0KPiA+ICsgICAg
ICAgIG11bCA9IGRtaV9tYXhfc3BlZWRfbWh6Ow0KPiA+ICsgICAgICAgIGRpdiA9IGRhdGEtPmh3
LmhpZ2hlc3RfcGVyZjsNCj4gPiArDQo+ID4gKyAgICAgICAgcmV0dXJuICh1bnNpZ25lZCBpbnQp
KG11bCAvIGRpdikgKiBkYXRhLT5ody5sb3dlc3RfcGVyZiAqDQo+ID4gKyAxMDAwOw0KPg0KPiBO
byByaXNrIG9mIHRoZSBjYXN0IGNob3BwaW5nIG9mZiBzZXQgYml0cz8NCg0KTXVsIHNoYWxsIGJl
IHVpbnQ2NF90LCBoaWdoZXN0X3BlcmYgYW5kIGxvd2VzdF9wZXJmIHNoYWxsIGJlIHVpbnQ4X3Qs
IGFuZCBub3JtYWxseQ0KdGhlIGVxdWF0aW9uIG91dHB1dCBzaGFsbCBub3QgYmUgYSB0b28gYmln
IHZhbHVlLi4uDQpJZiB5b3UgdGhpbmsgaXQncyBzYWZlciB0byBkbyBjYXN0IGFmdGVyIGNvbXBh
cmluZyB3aXRoIHRoZSBVSU5UMzJfTUFYLCBJIHdpbGwgYWRkIHRoZSBjaGVjaw0KDQo+DQo+ID4g
Kw0KPiA+ICtzdGF0aWMgaW50IGNmX2NoZWNrIGFtZF9wc3RhdGVfY3B1ZnJlcV92ZXJpZnkoc3Ry
dWN0IGNwdWZyZXFfcG9saWN5DQo+ID4gKypwb2xpY3kpIHsNCj4gPiArICAgIHN0cnVjdCBhbWRf
cHN0YXRlX2Rydl9kYXRhICpkYXRhID0gcGVyX2NwdShhbWRfcHN0YXRlX2Rydl9kYXRhLA0KPiA+
ICtwb2xpY3ktPmNwdSk7DQo+DQo+IENvbnN0PyAoSSB3b24ndCBmdXJ0aGVyIHJlcGVhdCB0aGlz
LiBQbGVhc2UgbWFrZSBwb2ludGVycyBwb2ludGVyLXRvLSBjb25zdA0KPiB3aGVyZXZlciBwb3Nz
aWJsZS4gV2UgYWltIGF0IGhhdmluZyBmdWxseSBjb25zdC1jb3JyZWN0IGNvZGUuKQ0KPg0KDQpT
dXJlLg0KDQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIGNmX2NoZWNrIGFtZF9wc3Rh
dGVfaW5pdF9tc3JzKHZvaWQgKmluZm8pIHsNCj4gPiArICAgIHN0cnVjdCBjcHVmcmVxX3BvbGlj
eSAqcG9saWN5ID0gaW5mbzsNCj4gPiArICAgIHN0cnVjdCBhbWRfcHN0YXRlX2Rydl9kYXRhICpk
YXRhID0gdGhpc19jcHUoYW1kX3BzdGF0ZV9kcnZfZGF0YSk7DQo+ID4gKyAgICB1aW50NjRfdCB2
YWw7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgbWluX2ZyZXEsIG5vbWluYWxfZnJlcSwgbWF4X2Zy
ZXE7DQo+ID4gKw0KPiA+ICsgICAgLyogUGFja2FnZSBsZXZlbCBNU1IgKi8NCj4gPiArICAgIGlm
ICggcmRtc3Jfc2FmZShNU1JfQU1EX0NQUENfRU5BQkxFLCB2YWwpICkNCj4NCj4gQmVmb3JlIHRy
eWluZyB0aGlzLCB3b3VsZG4ndCB5b3UgYmV0dGVyIGV4Y2x1ZGUgY2VydGFpbiB2ZXJ5IG9sZCBm
YW1pbGllcz8NCj4gRXZlbiBsb29raW5nIGF0IGEgcmFuZG9tIEZhbTE3IFBQUiBJIGNhbid0IHNw
b3QgZG9jdW1lbnRhdGlvbiBvZiB0aGlzIE1TUg0KPiAobm9yIHRoZSBvdGhlciB0d28pLCBkZXNw
aXRlIHlvdSBtZXJlbHkgc2F5aW5nIFplbiBlbHNld2hlcmUgKHdpdGhvdXQgYW55DQo+IHZlcnNp
b24gbnVtYmVyKS4NCj4NCg0KSSBzaGFsbCBjb21tZW50IG1vcmUgc3BlY2lmaWNhbGx5LCB0aGlz
IGZlYXR1cmUgaXMgZmlyc3RseSBpbnRyb2R1Y2VkIG9uIHNvbWUgWmVuMiBzZXJpZSwgbGlrZSBS
ZW5vaXINCkknbGwgZXhjbHVkZSB0aGUgZmFtaWxpZXMgYmVmb3JlIFplbihGYW0xN2gpDQoNCj4g
PiArICAgIHsNCj4gPiArICAgICAgICBhbWRfcHN0YXRlX2Vycihwb2xpY3ktPmNwdSwNCj4gInJk
bXNyX3NhZmUoTVNSX0FNRF9DUFBDX0VOQUJMRSlcbiIpOw0KPiA+ICsgICAgICAgIGRhdGEtPmVy
ciA9IC1FSU5WQUw7DQo+ID4gKyAgICAgICAgcmV0dXJuOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4g
PiArICAgIGlmICggISh2YWwgJiBBTURfQ1BQQ19FTkFCTEUpICkNCj4gPiArICAgIHsNCj4gPiAr
ICAgICAgICB2YWwgfD0gQU1EX0NQUENfRU5BQkxFOw0KPiA+ICsgICAgICAgIGlmICggd3Jtc3Jf
c2FmZShNU1JfQU1EX0NQUENfRU5BQkxFLCB2YWwpICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAg
ICAgICAgICAgIGFtZF9wc3RhdGVfZXJyKHBvbGljeS0+Y3B1LA0KPiAid3Jtc3Jfc2FmZShNU1Jf
QU1EX0NQUENfRU5BQkxFLCAlbHgpXG4iLCB2YWwpOw0KPiA+ICsgICAgICAgICAgICBkYXRhLT5l
cnIgPSAtRUlOVkFMOw0KPiA+ICsgICAgICAgICAgICByZXR1cm47DQo+ID4gKyAgICAgICAgfQ0K
PiA+ICsgICAgfQ0KPg0KPiBEbyB5b3UgcmVhbGx5IG5lZWQgdG8gZW5hYmxlIGJlZm9yIHJlYWRp
bmcgLi4uDQo+DQo+ID4gKyAgICBpZiAoIHJkbXNyX3NhZmUoTVNSX0FNRF9DUFBDX0NBUDEsIGRh
dGEtPmFtZF9jYXBzKSApDQo+DQo+IC4uLiBjYXBhYmlsaXRpZXMgYW5kIC4uLg0KPg0KDQpZZXMu
DQpPbmx5IHdoZW4gQ1BQQyBpcyBlbmFibGVkLCB0aGUgaGFyZHdhcmUgd2lsbCBjYWxjdWxhdGUg
dGhlIHByb2Nlc3NvcuKAmXMgcGVyZm9ybWFuY2UgY2FwYWJpbGl0aWVzIGFuZA0KaW5pdGlhbGl6
ZSB0aGUgcGVyZm9ybWFuY2UgbGV2ZWwgZmllbGRzIGluIHRoZSBDUFBDIGNhcGFiaWxpdHkgcmVn
aXN0ZXJzLg0KU2VlIDE3LjYuMyBodHRwczovL3d3dy5hbWQuY29tL2NvbnRlbnQvZGFtL2FtZC9l
bi9kb2N1bWVudHMvcHJvY2Vzc29yLXRlY2gtZG9jcy9wcm9ncmFtbWVyLXJlZmVyZW5jZXMvMjQ1
OTMucGRmDQoNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBhbWRfcHN0YXRlX2Vycihwb2xpY3kt
PmNwdSwgInJkbXNyX3NhZmUoTVNSX0FNRF9DUFBDX0NBUDEpXG4iKTsNCj4gPiArICAgICAgICBn
b3RvIGVycm9yOw0KPiA+ICsgICAgfQ0KPiA+ICsNCj4gPiArICAgIGlmICggZGF0YS0+aHcuaGln
aGVzdF9wZXJmID09IDAgfHwgZGF0YS0+aHcubG93ZXN0X3BlcmYgPT0gMCB8fA0KPiA+ICsgICAg
ICAgICBkYXRhLT5ody5ub21pbmFsX3BlcmYgPT0gMCB8fCBkYXRhLT5ody5sb3dlc3Rfbm9ubGlu
ZWFyX3BlcmYgPT0gMCApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgYW1kX3BzdGF0ZV9lcnIo
cG9saWN5LT5jcHUsICJQbGF0Zm9ybSBtYWxmdW5jdGlvbiwgcmVhZCBDUFBDDQo+IGhpZ2hlc3Rf
cGVyZjogJXUsIGxvd2VzdF9wZXJmOiAldSwgbm9taW5hbF9wZXJmOiAldSwgbG93ZXN0X25vbmxp
bmVhcl9wZXJmOiAldQ0KPiB6ZXJvIHZhbHVlXG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGRhdGEtPmh3LmhpZ2hlc3RfcGVyZiwgZGF0YS0+aHcubG93ZXN0X3BlcmYsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgZGF0YS0+aHcubm9taW5hbF9wZXJmLCBkYXRhLT5ody5sb3dl
c3Rfbm9ubGluZWFyX3BlcmYpOw0KPiA+ICsgICAgICAgIGdvdG8gZXJyb3I7DQo+ID4gKyAgICB9
DQo+ID4gKw0KPiA+ICsgICAgbWluX2ZyZXEgPSBhbWRfZ2V0X21pbl9mcmVxKGRhdGEpOw0KPiA+
ICsgICAgbm9taW5hbF9mcmVxID0gYW1kX2dldF9ub21pbmFsX2ZyZXEoZGF0YSk7DQo+ID4gKyAg
ICBtYXhfZnJlcSA9IGFtZF9nZXRfbWF4X2ZyZXEoZGF0YSk7DQo+ID4gKyAgICBpZiAoIG1pbl9m
cmVxID4gbWF4X2ZyZXEgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGFtZF9wc3RhdGVfZXJy
KHBvbGljeS0+Y3B1LCAibWluX2ZyZXEoJXUpIG9yIG1heF9mcmVxKCV1KSB2YWx1ZSBpcw0KPiBp
bmNvcnJlY3RcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgbWluX2ZyZXEsIG1heF9m
cmVxKTsNCj4gPiArICAgICAgICBnb3RvIGVycm9yOw0KPiA+ICsgICAgfQ0KPg0KPiAuLi4gY2hl
Y2tpbmcgdGhlbT8gRXJyb3IgaGFuZGxpbmcgd291bGQgYmUgZWFzaWVyIGlmIHlvdSBlbmFibGVk
IG9ubHkgYWZ0ZXJ3YXJkcy4NCj4NCj4gPiArICAgIGhpZ2hlc3RfcGVyZiA9IGRhdGEtPmh3Lmhp
Z2hlc3RfcGVyZjsNCj4gPiArICAgIG5vbWluYWxfcGVyZiA9IGRhdGEtPmh3Lm5vbWluYWxfcGVy
ZjsNCj4gPiArDQo+ID4gKyAgICBpZiAoIGhpZ2hlc3RfcGVyZiA8PSBub21pbmFsX3BlcmYgKQ0K
PiA+ICsgICAgICAgIHJldHVybjsNCj4gPiArDQo+ID4gKyAgICBwb2xpY3ktPnR1cmJvID0gQ1BV
RlJFUV9UVVJCT19FTkFCTEVEOyB9DQo+DQo+IEFuZCB3aHkgdGhlIGhlbHBlciB2YXJpYWJsZXMg
aW4gdGhlIGZpcnN0IHBsYWNlPw0KPg0KDQpTb3JyeSwgbWF5YmUgYSBiaXQgbW9yZSBzcGVjaWZp
YywgZ290IGNvbmZ1c2VkIGFib3V0IHRoZSBxdWVzdGlvbiA7Lw0KDQo+DQo+IEphbg0KDQpNYW55
IHRoYW5rcywNClBlbm55DQo=

