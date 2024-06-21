Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD9911E5B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 10:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745105.1152262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKZR6-0001w0-Ca; Fri, 21 Jun 2024 08:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745105.1152262; Fri, 21 Jun 2024 08:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKZR6-0001u2-9n; Fri, 21 Jun 2024 08:15:56 +0000
Received: by outflank-mailman (input) for mailman id 745105;
 Fri, 21 Jun 2024 08:15:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YYc3=NX=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sKZR4-0001tv-Gs
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 08:15:54 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:2418::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78e7581d-2fa6-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 10:15:52 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CYYPR12MB8703.namprd12.prod.outlook.com (2603:10b6:930:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Fri, 21 Jun
 2024 08:15:46 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 08:15:46 +0000
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
X-Inumbo-ID: 78e7581d-2fa6-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X65pj05hocguX3QXqvtKSOY2z/FWL3R282AiqKpq/7rBVjmUdAIrSOEpjmy175kSqaR/nAeq2rthQpBUA2wQ6gCEeh8LT+VHSKLGKXfVGraR021DsMhGbDbzIgvR4a8eNDnoBrr3lNvuMoToOKClVUE6cJTSGaYIc/rO1IIIpu4nrnZE1c/gIf/cI42IKuPKifBGOaSgUcAEfMPMDRx9VJenWJgy0+HnauVp6+QSEKxlFMwZ9TqTwDdPP0YGf1TOmgIha2FMeFXIzg1xJtbekeH2vHvxtVMS6eiM+D2U4n/cXZ2Jf6lJfInjVMDOsm/p/FMT+oIfmeqyINJo7LRJxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9pA/4k1oDsOndFxwviSGAYlabNLEzeuyJzYt3aYE+Q=;
 b=CMSIXSj8obgaSAxx0TlgKLn7Nz8LBOX3LY+vuZTQt6t0N01ng0AHtf5AUbx7olqRJtJM4wL/68ELGg+0358G/pLcnYUT7sl0ixSeYUPXzKp02zjbvq1BBYrGHX1QwCJb2MMhXwTMfEhw6lCcK/t1z6Cy/Zs8fzyrfMOOMYJvpFue72xz1fDpqtLm4UTjmGDXjARbx/nyltyBR0ZotUplieKsb4uFAcsDgyXEQaTpDOuWb4dLmoFfB+SBzD2sgkGAdBxzClVawLS45euXnkYigvFzdQEefxsiF5UDvYS2XPQJr1Qe5hz0oiL4k6J6Tz7AvsoHEgYiW4E7i4LitP+zYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9pA/4k1oDsOndFxwviSGAYlabNLEzeuyJzYt3aYE+Q=;
 b=MEpXEeBqeHWz+LJEC1UNmgqMnrvrSqkqvXBW0aLrzyxvxIQb+ErrRmYFXWQ96+ul29dIjnxtiq9rk7u8WByn2V3fk96l/RsPzUMJowbScWNrf/28Wxg6L1dVldoeHiq7S6tEwibDJ5wdev7GI5DbxFL2T1toX1lqL63w8s+ma9A=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v10 4/5] tools: Add new function to get gsi from dev
Thread-Topic: [XEN PATCH v10 4/5] tools: Add new function to get gsi from dev
Thread-Index:
 AQHawJToSxHkdXzldkCDZE5kihITT7HMD9QAgAGTOgD//5t7AIADeOiA//+SewCAAKx5AP//hDUAAD2nHAA=
Date: Fri, 21 Jun 2024 08:15:46 +0000
Message-ID:
 <BL1PR12MB5849D6943FCB12613A844F33E7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-5-Jiqian.Chen@amd.com>
 <49563a31-d50e-4015-88ee-e0dab9193cd1@suse.com>
 <BL1PR12MB584910D242D9D8B4BA8B15C1E7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ab99b766-7bec-4046-beb2-f77a2591a911@suse.com>
 <BL1PR12MB5849ABD858B72505D83678F9E7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <099beaac-ed1f-459b-8c2b-42b325f8e4a4@suse.com>
 <BL1PR12MB5849366A442BE6C4C192ABB0E7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3352736b-e7bc-40d0-ac1f-e58de188c93c@suse.com>
In-Reply-To: <3352736b-e7bc-40d0-ac1f-e58de188c93c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7698.013)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CYYPR12MB8703:EE_
x-ms-office365-filtering-correlation-id: 8c54ca89-8df0-46e8-5ccf-08dc91ca5a1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|376011|366013|7416011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?utf-8?B?T2ZXanRidzlOTkhOdC9sU2dKZHVYOSttZkRMcUlrNU9QZ0VJQ25aT1RiOUxs?=
 =?utf-8?B?U3dPQmJ2dXNiWVgrc1B2V1E3THdYTktqakQ2UkZ0U0lDb1haYk9tRW56eXMx?=
 =?utf-8?B?MVNtMTRVMHNxaUdvN0hPa3hwcDhDS3NGcGtIc2ZPVDJzeVAweVZsRjhXSE9K?=
 =?utf-8?B?KzBRbXQ5OVIyTXM0bXFUbkN1VXpCR0hrTTcvZlBzQkFjMFdHbTdUSmlTSkVT?=
 =?utf-8?B?UVVDcXZRdFh5SGg2N0FuQjkyMC9mQ2Q2MDlrOHNhR1lDMkV5bXA2bGNuSEo4?=
 =?utf-8?B?cjZ4MFRVMHhaNGFlaHF5L0xEemlxSzQxamd1SzBGRzdoVzZReGpDdU5aRStl?=
 =?utf-8?B?YmxXcUVKZW12UXFvZDZPbVNrMmlqazZiTHVPVTZ2S282ZTJHSXkweFRHT0Vv?=
 =?utf-8?B?enpwWDhSbnRPUFQycTZMWGlvSjZ5bU9xN3ZHdWJwRG5Yc1dYQlZwdVpubzdk?=
 =?utf-8?B?bW02RUNwSXNLNXF1UWh4cjBFd1dqU2lURFgzSzcwa3J6S3dmL2ZWVVNwdVIv?=
 =?utf-8?B?RDV3aU5lYTIxL0V0NjVVWTRpS0NWUXlRaVhzenFyMlhxQ2pFRUtHT0xWNzVw?=
 =?utf-8?B?QmdGWDQ3Y3VabHFNWkFyOXdtc2UvOERrSGxUb0svN0FKMWdqSEUyN1hVSkV2?=
 =?utf-8?B?eHNOSzJtZUNCWWdOaGZKM3RLTEZYMmFLS3JwYiswM0hLWWtkOUhCaEo5eHcr?=
 =?utf-8?B?dGNXMUxpbGpNU000TDBOMEhLQnE3dlZvMzFpNThwQnB6bEd4UEMzemJIcmJy?=
 =?utf-8?B?ZkkxR0R6bzRuL01CNUN4NE5kR0xpZC9OR1FQSHNGZS8wZzdiSSthK0ZlbkJt?=
 =?utf-8?B?OHhiK2hCVkdKZDB3RmVoaER6THBmblRSOGk1ZEtvMkZ1bHpEOEF4Nk9kMW4z?=
 =?utf-8?B?anJOTThONUxrSFA5K3lGRkFVTitibE51Q3M3OUFaU2Q3RFFmVndOWmIxYUVt?=
 =?utf-8?B?Y1hjOWEwc3hEVFEydzJ5OXVXelo3VTQzbmZBMXA3RWMweXJpTXRnOVZiV1lH?=
 =?utf-8?B?bGpJOXF2YzdOQk02Z1FHNGF2T2pseHN6NFpYazYvSlFWRHJoeTJSZ1NKQTRH?=
 =?utf-8?B?djkrSFRMYnh2L2dXcGU2Vlh0NkxjNFRKWUk0cjYxS3lVd3JQL1pxUzZkU1FC?=
 =?utf-8?B?eC9hUDdlQTF6UG1HVHhQSjVGNGNrbFF5MjBUQ0cvcW01MmhENnduL0NvWUpH?=
 =?utf-8?B?dk9nVG11L0pCbHNkOGJlSnZPZEtycmNKTURZampkb3dvM0ZjYW1ZSjZJS2Fv?=
 =?utf-8?B?RTlvZ2JMejhoa1ZldE5IcXY0akZ0Rmd2dmJUUEh6ei82V1NjL2djQ2V1VWU0?=
 =?utf-8?B?dGlxZldOblFKbXVaSVErcFV0RVJSR2ZhNkRNRjRtWDJpd0lpNW9ia0xjalhY?=
 =?utf-8?B?SmdqYnhXOUZYeTRMRkRJcFdEbXdJU2Nwd2tQMkVPNHYzZXNnL2lkSFRwckFl?=
 =?utf-8?B?VDVsVkFQNm9NNmpDZzRIT1BBYVZpbUI3bFBCV1NDZGFzVnFaNWtnRHBqNU0w?=
 =?utf-8?B?TlBpdVdwbVBDUUlOUnduUUJvamwxY1hRWHY1NUlHU3M3R3hDc0kxQkVTN2dU?=
 =?utf-8?B?Q1lBbTZpd0o2MzFMcDc1RGwyREppTUZaeXAzRWtqaGFUYk83clgyM3VGN0N6?=
 =?utf-8?B?TVI3RkhtbDE5WTRrVzAwQzc1UHcrb3lodWkwVlhhdUh4VWJsV1VidHJaMTgx?=
 =?utf-8?B?Zm5SRHZ4d3pYai9Kd0tFRk0vQlJQcjRxeG8rN2psMXdtakFRcnNDazd1MHhp?=
 =?utf-8?B?NUs5YkQ5azBhZUtuL2pKN2hqc0tKNXMvMG43a3NSSnZhalVBYk9sYmhab1Q0?=
 =?utf-8?Q?7CfaxhfbzbHq9sLxg5iHVtM2wRnTg57SmIfGE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(7416011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDUveHN4R1V6UnU5bFJIWGwveG5ZUG5tMXNwQTNuOGpYbXpsOTA5akhCMHN3?=
 =?utf-8?B?RHU2SnZoTXZQWTd2eHlob1pBaW1FVWc0SnR3SHd5Z2MyalQ1NzV1d3JYcTVz?=
 =?utf-8?B?M05tTWJiOU1zQTJyanNkaU9XOVNtYjJTb3RoTmhzSi9ianhtaW9zT21rSzVW?=
 =?utf-8?B?OXRHZlJjNGRqYlZCTkxmMkRMczNVZTJnYjBIR1hoRVJ5a0UzTEYwNWprbU5N?=
 =?utf-8?B?bjQ0czhjR0dWQTF0eTRaWkd0ai93b2kvRXVRYXRwZnJHL1BuL2tyOGEvTFFN?=
 =?utf-8?B?MkZVOTY5L1ZRTHhsUzNEMG45ckYva1FVZUxJM3VYajhCRld4QmZ6SVQrdkg4?=
 =?utf-8?B?NmZKeUhyVDZJZ1RJMUxFRmltSnRuL21adHpWemVaYkExamVTdFJQS1Rxamxh?=
 =?utf-8?B?Ymxhc09pVnBhNlNKeHFsbEVvWmFNOFJEVEF4b21IS0k0ZldwdlpYcGtMcVQx?=
 =?utf-8?B?VFBxMjlQekNEbVdjTWw1NjIwTXlrTk5JdS9hVGgvVlhicmozeHhIdm8wb05z?=
 =?utf-8?B?bkVnMk95OUVVWlJ1WU9ieEM1UnJPWHFIRlJYVzNFWWJSZm96b2hWUStMUjF3?=
 =?utf-8?B?V2hQMHEySHhpalRHSCthZTJzbGV2ODhyTzNDcUo1RngxUWhoeFdMT1lBSHZY?=
 =?utf-8?B?UnlCb241WEhNOFRzYVZGWVBIenlRU1VwOXRkME4xMlEzU3J4SHhaaVRBT0I5?=
 =?utf-8?B?VlpMNHlKRG5FT0NJTG4rTGRZTVVKTU1wTDhaNG1Ia2NJT0VxU2tpNEhiSlNI?=
 =?utf-8?B?dTFGNVlDOXNOR3FlSS9Ic0ZpQm5kYS9Kb1g2VHNYRGR2S0dRWHczSURudHpB?=
 =?utf-8?B?RVFxVm9BOHdEWTBhZ0k0L2hKeDFqRDRXbDFxdGFicm05VkF1aXZqTG1qT1lh?=
 =?utf-8?B?cUdQdEluMEU4VDZiTk0rTHdnekhPd0l4V3RVL09YTkI0UnIrbDRKdHV3ZnVW?=
 =?utf-8?B?dGk5dGdZa0RBTkdMUEFDR2ptVngwZEV5d1BoMWowZVo0NkoyS0EzY3hMQzAy?=
 =?utf-8?B?OHU3VXNyQWRrNHd2dkVYMEFXUFd0Q2dTaVVrSmVobFFWdnlwenE2VzQrMTBG?=
 =?utf-8?B?K2dUWUlzTXpyR0VHbXZzcGVWVEQ0akx4WnU4Ym9EbU5Cb1ZmbzRTb3RlMXNP?=
 =?utf-8?B?ckZ1ZXBVVGRIbzRuTldSNXFGMFVlR2dUaXFIYkkzK1dDL0s5QVFXdzYvYXA5?=
 =?utf-8?B?UW9sRE5icUVLNXpRUFFBdWV5L2gwcFk5a2xHZEVKNncvK2ZRTkZKRU1XOVcv?=
 =?utf-8?B?c3g3Yzh1RkhPUzE1TVYrelFDcGhWZWRVYzR4VlM2NFlWNmhxTGFMODNpWUJu?=
 =?utf-8?B?eFdkVHk0a0MrcXU0dEtpR1FtcnJzVFV6a1VsUXNKV1lMdWV6OXdJUmtPek1v?=
 =?utf-8?B?UmNpRXY4cWo5amx3RHNxRzEvZEhCRmRyeHo4WXBENm5adEN2U011dGhBU0M3?=
 =?utf-8?B?OFVHN1J5NHVVV2FOY3ByZEtKRHVvdElEME9YNTRhdE9kRUl4Q1JFYjZwdVAv?=
 =?utf-8?B?bStwQkNOWHJhelZvdXV5bHZnUUEvS2d4MFQxbDJLbnJOQkV5aXlaN0t0MCs5?=
 =?utf-8?B?ZGc2YWYyREc5TWRwWEFMY3crMDZqcFEvbHV1Tmorb1RtT0xWbjNkUWduV0Vl?=
 =?utf-8?B?OGgyV1NRSEt6KzB2ZWl1cnkvZzA5RVdyaXdOd2E5eU4yb0RVY0Jhb1RDSW5H?=
 =?utf-8?B?Z3h5K3dvNXFRSk5wZG9UR3lPbjZ6LzV1R0RKKzRzZWZCYnBVWkRGNTZMa0tk?=
 =?utf-8?B?VEpQN2NydHRydXRGN3BLN1NRRFZ5eWxLZGRkV2VkSzlEQkhqeEl6eGRyWlZJ?=
 =?utf-8?B?MmJwRlZmY09rTnoyS1dWYW9RdmtkTTl4WlJJQktSUDFMVVF4UWpoY3NBL2dp?=
 =?utf-8?B?Q2g1Wk4xb3dFT01ldEttK2wxcEV5c280UzNwa240MGZYM3h1ZE40YTBxNlVF?=
 =?utf-8?B?MUVvZVoxdWdrd2REalZQYkwzb3dvV3pKSGlpdDRldjBRMXkwVHk5UmtQZTBu?=
 =?utf-8?B?VTIxcWk3VndRRDdzMFY3OEIySUtJM1VDTmpCZU9qMkhML210VzgzMHBlaktT?=
 =?utf-8?B?d0NkWGRLSWNBK1ByUGQydXpuWkJuWHVSQm84OTJhUzU4QWxQME1WQk1zKzRz?=
 =?utf-8?Q?BUDo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1959805BBD69334E88AF21A96832DE3B@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c54ca89-8df0-46e8-5ccf-08dc91ca5a1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 08:15:46.0721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VOCfZWWo6Xyx+dKP+NdKKc7gSdMsdVQzT0EtlCEqgNfUY2Es8khhggwFWlFcHifo6k7tYaUkqsk4SlZ6XvL4mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8703

T24gMjAyNC82LzIwIDE4OjM3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjAuMDYuMjAyNCAx
MjoyMywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzIwIDE1OjQzLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyMC4wNi4yMDI0IDA5OjAzLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjQvNi8xOCAxNzoxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
OC4wNi4yMDI0IDEwOjEwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNC82LzE3
IDIzOjEwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMTcuMDYuMjAyNCAxMTowMCwg
SmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+Pj4+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhs
X3BjaS5jDQo+Pj4+Pj4+PiArKysgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3BjaS5jDQo+Pj4+
Pj4+PiBAQCAtMTQwNiw2ICsxNDA2LDEyIEBAIHN0YXRpYyBib29sIHBjaV9zdXBwX2xlZ2FjeV9p
cnEodm9pZCkNCj4+Pj4+Pj4+ICAjZW5kaWYNCj4+Pj4+Pj4+ICB9DQo+Pj4+Pj4+PiAgDQo+Pj4+
Pj4+PiArI2RlZmluZSBQQ0lfREVWSUQoYnVzLCBkZXZmbilcDQo+Pj4+Pj4+PiArICAgICAgICAg
ICAgKCgoKHVpbnQxNl90KShidXMpKSA8PCA4KSB8ICgoZGV2Zm4pICYgMHhmZikpDQo+Pj4+Pj4+
PiArDQo+Pj4+Pj4+PiArI2RlZmluZSBQQ0lfU0JERihzZWcsIGJ1cywgZGV2Zm4pIFwNCj4+Pj4+
Pj4+ICsgICAgICAgICAgICAoKCgodWludDMyX3QpKHNlZykpIDw8IDE2KSB8IChQQ0lfREVWSUQo
YnVzLCBkZXZmbikpKQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBJJ20gbm90IGEgbWFpbnRhaW5lciBvZiB0
aGlzIGZpbGU7IGlmIEkgd2VyZSwgSSdkIGFzayB0aGF0IGZvciByZWFkYWJpbGl0eSdzDQo+Pj4+
Pj4+IHNha2UgYWxsIGV4Y2VzcyBwYXJlbnRoZXNlcyBiZSBkcm9wcGVkIGZyb20gdGhlc2UuDQo+
Pj4+Pj4gSXNuJ3QgaXQgYSBjb2RpbmcgcmVxdWlyZW1lbnQgdG8gZW5jbG9zZSBlYWNoIGVsZW1l
bnQgaW4gcGFyZW50aGVzZXMgaW4gdGhlIG1hY3JvIGRlZmluaXRpb24/DQo+Pj4+Pj4gSXQgc2Vl
bXMgb3RoZXIgZmlsZXMgYWxzbyBkbyB0aGlzLiBTZWUgdG9vbHMvbGlicy9saWdodC9saWJ4bF9p
bnRlcm5hbC5oDQo+Pj4+Pg0KPj4+Pj4gQXMgc2FpZCwgSSdtIG5vdCBhIG1haW50YWluZXIgb2Yg
dGhpcyBjb2RlLiBZZXQgd2hpbGUgSSdtIGF3YXJlIHRoYXQgbGlieGwNCj4+Pj4+IGhhcyBpdHMg
b3duIENPRElOR19TVFlMRSwgSSBjYW4ndCBzcG90IGFueXRoaW5nIHRvd2FyZHMgZXhjZXNzaXZl
IHVzZSBvZg0KPj4+Pj4gcGFyZW50aGVzZXMgdGhlcmUuDQo+Pj4+IFNvLCB3aGljaCBwYXJlbnRo
ZXNlcyBkbyB5b3UgdGhpbmsgYXJlIGV4Y2Vzc2l2ZSB1c2U/DQo+Pj4NCj4+PiAjZGVmaW5lIFBD
SV9ERVZJRChidXMsIGRldmZuKVwNCj4+PiAgICAgICAgICAgICAoKCh1aW50MTZfdCkoYnVzKSA8
PCA4KSB8ICgoZGV2Zm4pICYgMHhmZikpDQo+Pj4NCj4+PiAjZGVmaW5lIFBDSV9TQkRGKHNlZywg
YnVzLCBkZXZmbikgXA0KPj4+ICAgICAgICAgICAgICgoKHVpbnQzMl90KShzZWcpIDw8IDE2KSB8
IFBDSV9ERVZJRChidXMsIGRldmZuKSkNCj4+IFRoYW5rcywgd2lsbCBjaGFuZ2UgaW4gbmV4dCB2
ZXJzaW9uLg0KPj4NCj4+Pg0KPj4+Pj4+Pj4gQEAgLTE0ODYsNiArMTQ5NiwxOCBAQCBzdGF0aWMg
dm9pZCBwY2lfYWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0KPj4+Pj4+Pj4gICAgICAgICAg
Z290byBvdXRfbm9faXJxOw0KPj4+Pj4+Pj4gICAgICB9DQo+Pj4+Pj4+PiAgICAgIGlmICgoZnNj
YW5mKGYsICIldSIsICZpcnEpID09IDEpICYmIGlycSkgew0KPj4+Pj4+Pj4gKyNpZmRlZiBDT05G
SUdfWDg2DQo+Pj4+Pj4+PiArICAgICAgICBzYmRmID0gUENJX1NCREYocGNpLT5kb21haW4sIHBj
aS0+YnVzLA0KPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgIChQQ0lfREVWRk4ocGNp
LT5kZXYsIHBjaS0+ZnVuYykpKTsNCj4+Pj4+Pj4+ICsgICAgICAgIGdzaSA9IHhjX3BoeXNkZXZf
Z3NpX2Zyb21fZGV2KGN0eC0+eGNoLCBzYmRmKTsNCj4+Pj4+Pj4+ICsgICAgICAgIC8qDQo+Pj4+
Pj4+PiArICAgICAgICAgKiBPbGQga2VybmVsIHZlcnNpb24gbWF5IG5vdCBzdXBwb3J0IHRoaXMg
ZnVuY3Rpb24sDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEp1c3Qga2VybmVsPw0KPj4+Pj4+IFllcywgeGNf
cGh5c2Rldl9nc2lfZnJvbV9kZXYgZGVwZW5kcyBvbiB0aGUgZnVuY3Rpb24gaW1wbGVtZW50ZWQg
b24gbGludXgga2VybmVsIHNpZGUuDQo+Pj4+Pg0KPj4+Pj4gT2theSwgYW5kIHdoZW4gdGhlIGtl
cm5lbCBzdXBwb3J0cyBpdCBidXQgdGhlIHVuZGVybHlpbmcgaHlwZXJ2aXNvciBkb2Vzbid0DQo+
Pj4+PiBzdXBwb3J0IHdoYXQgdGhlIGtlcm5lbCB3YW50cyB0byB1c2UgaW4gb3JkZXIgdG8gZnVs
ZmlsbCB0aGUgcmVxdWVzdCwgYWxsDQo+Pj4+IEkgZG9uJ3Qga25vdyB3aGF0IHRoaW5ncyB5b3Ug
bWVudGlvbmVkIGh5cGVydmlzb3IgZG9lc24ndCBzdXBwb3J0IGFyZSwNCj4+Pj4gYmVjYXVzZSB4
Y19waHlzZGV2X2dzaV9mcm9tX2RldiBpcyB0byBnZXQgdGhlIGdzaSBvZiBwY2lkZXYgdGhyb3Vn
aCBzYmRmIGluZm9ybWF0aW9uLA0KPj4+PiB0aGF0IHJlbGF0aW9uc2hpcCBjYW4gYmUgZ290IG9u
bHkgaW4gZG9tMCBpbnN0ZWFkIG9mIFhlbiBoeXBlcnZpc29yLg0KPj4+Pg0KPj4+Pj4gaXMgZmlu
ZT8gKFNlZSBhbHNvIGJlbG93IGZvciB3aGF0IG1heSBiZSBuZWVkZWQgaW4gdGhlIGh5cGVydmlz
b3IsIGV2ZW4gaWYNCj4+Pj4gWW91IG1lYW4geGNfcGh5c2Rldl9tYXBfcGlycSBuZWVkcyBnc2k/
DQo+Pj4NCj4+PiBJJ2QgcHV0IGl0IHNsaWdodGx5IGRpZmZlcmVudGx5OiBZb3UgYXJyYW5nZSBm
b3IgdGhhdCBmdW5jdGlvbiB0byBub3cgdGFrZSBhDQo+Pj4gR1NJIHdoZW4gdGhlIGNhbGxlciBp
cyBQVkguIEJ1dCB5ZXMsIHRoZSBmdW5jdGlvbiwgd2hlbiB1c2VkIHdpdGgNCj4+PiBNQVBfUElS
UV9UWVBFX0dTSSwgY2xlYXJseSBleHBlY3RzIGEgR1NJIGFzIGlucHV0IChzZWUgYWxzbyBiZWxv
dykuDQo+Pj4NCj4+Pj4+IHRoaXMgSU9DVEwgd291bGQgYmUgc2F0aXNmaWVkIGJ5IHRoZSBrZXJu
ZWwgd2l0aG91dCBuZWVkaW5nIHRvIGludGVyYWN0IHdpdGgNCj4+Pj4+IHRoZSBoeXBlcnZpc29y
LikNCj4+Pj4+DQo+Pj4+Pj4+PiArICAgICAgICAgKiBzbyBpZiBmYWlsLCBrZWVwIHVzaW5nIGly
cTsgaWYgc3VjY2VzcywgdXNlIGdzaQ0KPj4+Pj4+Pj4gKyAgICAgICAgICovDQo+Pj4+Pj4+PiAr
ICAgICAgICBpZiAoZ3NpID4gMCkgew0KPj4+Pj4+Pj4gKyAgICAgICAgICAgIGlycSA9IGdzaTsN
Cj4+Pj4+Pj4NCj4+Pj4+Pj4gSSdtIHN0aWxsIHB1enpsZWQgYnkgdGhpcywgd2hlbiBieSBub3cg
SSB0aGluayB3ZSd2ZSBzdWZmaWNpZW50bHkgY2xhcmlmaWVkDQo+Pj4+Pj4+IHRoYXQgSVJRcyBh
bmQgR1NJcyB1c2UgdHdvIGRpc3RpbmN0IG51bWJlcmluZyBzcGFjZXMuDQo+Pj4+Pj4+DQo+Pj4+
Pj4+IEFsc28sIGFzIHByZXZpb3VzbHkgaW5kaWNhdGVkLCB5b3UgY2FsbCB0aGlzIGZvciBQViBE
b20wIGFzIHdlbGwuIEFpdWkgb24NCj4+Pj4+Pj4gdGhlIGFzc3VtcHRpb24gdGhhdCBpdCdsbCBm
YWlsLiBXaGF0IGlmIHdlIGRlY2lkZSB0byBtYWtlIHRoZSBmdW5jdGlvbmFsaXR5DQo+Pj4+Pj4+
IGF2YWlsYWJsZSB0aGVyZSwgdG9vIChpZiBvbmx5IGZvciBpbmZvcm1hdGlvbmFsIHB1cnBvc2Vz
LCBvciBmb3INCj4+Pj4+Pj4gY29uc2lzdGVuY3kpPyBTdWRkZW5seSB5b3UncmUgZmFsbGJhY2sg
bG9naWMgd291bGRuJ3Qgd29yayBhbnltb3JlLCBhbmQNCj4+Pj4+Pj4geW91J2QgY2FsbCAuLi4N
Cj4+Pj4+Pj4NCj4+Pj4+Pj4+ICsgICAgICAgIH0NCj4+Pj4+Pj4+ICsjZW5kaWYNCj4+Pj4+Pj4+
ICAgICAgICAgIHIgPSB4Y19waHlzZGV2X21hcF9waXJxKGN0eC0+eGNoLCBkb21pZCwgaXJxLCAm
aXJxKTsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gLi4uIHRoZSBmdW5jdGlvbiB3aXRoIGEgR1NJIHdoZW4g
YSBwSVJRIGlzIG1lYW50LiBJbW8sIGFzIHN1Z2dlc3RlZCBiZWZvcmUsDQo+Pj4+Pj4+IHlvdSBz
dHJpY3RseSB3YW50IHRvIGF2b2lkIHRoZSBjYWxsIG9uIFBWIERvbTAuDQo+Pj4+Pj4+DQo+Pj4+
Pj4+IEFsc28gZm9yIFBWSCBEb20wOiBJIGRvbid0IHRoaW5rIEkndmUgc2VlbiBjaGFuZ2VzIHRv
IHRoZSBoeXBlcmNhbGwNCj4+Pj4+Pj4gaGFuZGxpbmcsIHlldC4gSG93IGNhbiB0aGF0IGJlIHdo
ZW4gR1NJIGFuZCBJUlEgYXJlbid0IHRoZSBzYW1lLCBhbmQgaGVuY2UNCj4+Pj4+Pj4gaW5jb21p
bmcgR1NJIHdvdWxkIG5lZWQgdHJhbnNsYXRpbmcgdG8gSVJRIHNvbWV3aGVyZT8gSSBjYW4gb25j
ZSBhZ2FpbiBvbmx5DQo+Pj4+Pj4+IGFzc3VtZSBhbGwgeW91ciB0ZXN0aW5nIHdhcyBkb25lIHdp
dGggSVJRcyB3aG9zZSBudW1iZXJzIGhhcHBlbmVkIHRvIG1hdGNoDQo+Pj4+Pj4+IHRoZWlyIEdT
SSBudW1iZXJzLiAoVGhlIGRpZmZlcmVuY2UsIGltbywgd291bGQgYWxzbyBuZWVkIGNhbGxpbmcg
b3V0IGluIHRoZQ0KPj4+Pj4+PiBwdWJsaWMgaGVhZGVyLCB3aGVyZSB0aGUgcmVzcGVjdGl2ZSBp
bnRlcmZhY2Ugc3RydWN0KHMpIGlzL2FyZSBkZWZpbmVkLikNCj4+Pj4+PiBJIGZlZWwgbGlrZSB5
b3UgbWlzc2VkIG91dCBvbiBtYW55IG9mIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9ucy4NCj4+Pj4+
PiBXaXRob3V0IG15IGNoYW5nZXMsIHRoZSBvcmlnaW5hbCBjb2RlcyB1c2UgaXJxIChyZWFkIGZy
b20gZmlsZSAvc3lzL2J1cy9wY2kvZGV2aWNlcy88c2JkZj4vaXJxKSB0byBkbyB4Y19waHlzZGV2
X21hcF9waXJxLA0KPj4+Pj4+IGJ1dCB4Y19waHlzZGV2X21hcF9waXJxIHJlcXVpcmUgcGFzc2lu
ZyBpbnRvIGdzaSBpbnN0ZWFkIG9mIGlycSwgc28gd2UgbmVlZCB0byB1c2UgZ3NpIHdoZXRoZXIg
ZG9tMCBpcyBQViBvciBQVkgsIHNvIGZvciB0aGUgb3JpZ2luYWwgY29kZXMsIHRoZXkgYXJlIHdy
b25nLg0KPj4+Pj4+IEp1c3QgYmVjYXVzZSBieSBjaGFuY2UsIHRoZSBpcnEgdmFsdWUgaW4gdGhl
IExpbnV4IGtlcm5lbCBvZiBwdiBkb20wIGlzIGVxdWFsIHRvIHRoZSBnc2kgdmFsdWUsIHNvIHRo
ZXJlIHdhcyBubyBwcm9ibGVtIHdpdGggdGhlIG9yaWdpbmFsIHB2IHBhc3N0aHJvdWdoLg0KPj4+
Pj4+IEJ1dCBub3Qgd2hlbiB1c2luZyBQVkgsIHNvIHBhc3N0aHJvdWdoIGZhaWxlZC4NCj4+Pj4+
PiBXaXRoIG15IGNoYW5nZXMsIEkgZ290IGdzaSB0aHJvdWdoIGZ1bmN0aW9uIHhjX3BoeXNkZXZf
Z3NpX2Zyb21fZGV2IGZpcnN0bHksIGFuZCB0byBiZSBjb21wYXRpYmxlIHdpdGggb2xkIGtlcm5l
bCB2ZXJzaW9ucyhpZiB0aGUgaW9jdGwNCj4+Pj4+PiBJT0NUTF9QUklWQ01EX0dTSV9GUk9NX0RF
ViBpcyBub3QgaW1wbGVtZW50ZWQpLCBJIHN0aWxsIG5lZWQgdG8gdXNlIHRoZSBpcnEgbnVtYmVy
LCBzbyBJIG5lZWQgdG8gY2hlY2sgdGhlIHJlc3VsdA0KPj4+Pj4+IG9mIGdzaSwgaWYgZ3NpID4g
MCBtZWFucyBJT0NUTF9QUklWQ01EX0dTSV9GUk9NX0RFViBpcyBpbXBsZW1lbnRlZCBJIGNhbiB1
c2UgdGhlIHJpZ2h0IG9uZSBnc2ksIG90aGVyd2lzZSBrZWVwIHVzaW5nIHdyb25nIG9uZSBpcnEu
IA0KPj4+Pj4NCj4+Pj4+IEkgdW5kZXJzdGFuZCBhbGwgb2YgdGhpcywgdG8gYSAoSSB0aGluaykg
c3VmZmljaWVudCBkZWdyZWUgYXQgbGVhc3QuIFlldCB3aGF0DQo+Pj4+PiB5b3UncmUgZWZmZWN0
aXZlbHkgcHJvcG9zaW5nICh3aXRob3V0IGV4cGxpY2l0bHkgc2F5aW5nIHNvKSBpcyB0aGF0IGUu
Zy4NCj4+Pj4+IHN0cnVjdCBwaHlzZGV2X21hcF9waXJxJ3MgcGlycSBmaWVsZCBzdWRkZW5seSBt
YXkgbm8gbG9uZ2VyIGhvbGQgYSBwSVJRDQo+Pj4+PiBudW1iZXIsIGJ1dCAod2hlbiB0aGUgY2Fs
bGVyIGlzIFBWSCkgYSBHU0kuIFRoaXMgbWF5IGJlIGEgbmVjZXNzYXJ5IGFkanVzdG1lbnQNCj4+
Pj4+IHRvIG1ha2UgKHNpbXBseSBiZWNhdXNlIHRoZSBjYWxsZXIgbWF5IGhhdmUgbm8gd2F5IHRv
IGV4cHJlc3MgdGhpbmdzIGluIHBJUlENCj4+Pj4+IHRlcm1zKSwgYnV0IHRoZW4gc3VpdGFibGUg
YWRqdXN0bWVudHMgdG8gdGhlIGhhbmRsaW5nIG9mIFBIWVNERVZPUF9tYXBfcGlycQ0KPj4+Pj4g
d291bGQgYmUgbmVjZXNzYXJ5LiBJbiBmYWN0IHRoYXQgZmllbGQgaXMgcHJlc2VudGx5IG1hcmtl
ZCBhcyAiSU4gb3IgT1VUIjsNCj4+Pj4+IHdoZW4gcmUtcHVycG9zZWQgdG8gdGFrZSBhIEdTSSBv
biBpbnB1dCwgaXQgbWF5IGVuZCB1cCBiZWluZyBuZWNlc3NhcnkgdG8gcGFzcw0KPj4+Pj4gYmFj
ayB0aGUgcElSUSAoaW4gdGhlIHN1YmplY3QgZG9tYWluJ3MgbnVtYmVyaW5nIHNwYWNlKS4gT3Ig
YWx0ZXJuYXRpdmVseSBpdA0KPj4+Pj4gbWF5IGJlIG5lY2Vzc2FyeSB0byBhZGQgeWV0IGFub3Ro
ZXIgc3ViLWZ1bmN0aW9uIHNvIHRoZSBHU0kgY2FuIGJlIHRyYW5zbGF0ZWQNCj4+Pj4+IHRvIHRo
ZSBjb3JyZXNwb25kaW5nIHBJUlEgZm9yIHRoZSBkb21haW4gdGhhdCdzIGdvaW5nIHRvIHVzZSB0
aGUgSVJRLCBmb3IgdGhhdA0KPj4+Pj4gdGhlbiB0byBiZSBwYXNzZWQgaW50byBQSFlTREVWT1Bf
bWFwX3BpcnEuDQo+Pj4+IElmIEkgdW5kZXJzdG9vZCBjb3JyZWN0bHksIHlvdXIgY29uY2VybnMg
YWJvdXQgdGhpcyBwYXRjaCBhcmUgdHdvOg0KPj4+PiBGaXJzdCwgd2hlbiBkb20wIGlzIFBWLCBJ
IHNob3VsZCBub3QgdXNlIHhjX3BoeXNkZXZfZ3NpX2Zyb21fZGV2IHRvIGdldCBnc2kgdG8gZG8g
eGNfcGh5c2Rldl9tYXBfcGlycSwgSSBzaG91bGQga2VlcCB0aGUgb3JpZ2luYWwgY29kZSB0aGF0
IHVzZSBpcnEuDQo+Pj4NCj4+PiBZZXMuDQo+PiBPSywgSSBjYW4gY2hhbmdlIHRvIGRvIHRoaXMu
DQo+PiBCdXQgSSBzdGlsbCBoYXZlIGEgY29uY2VybjoNCj4+IEFsdGhvdWdoIHdpdGhvdXQgbXkg
Y2hhbmdlcywgcGFzc3Rocm91Z2ggY2FuIHdvcmsgbm93IHdoZW4gZG9tMCBpcyBQVi4NCj4+IEFu
ZCB5b3UgYWxzbyBhZ3JlZSB0aGF0OiBmb3IgeGNfcGh5c2Rldl9tYXBfcGlycSwgd2hlbiB1c2Ug
d2l0aCBNQVBfUElSUV9UWVBFX0dTSSwgaXQgZXhwZWN0cyBhIEdTSSBhcyBpbnB1dC4NCj4+IElz
bid0IGl0IGEgd3JvbmcgZm9yIFBWIGRvbTAgdG8gcGFzcyBpcnEgaW4/IFdoeSBkb24ndCB3ZSB1
c2UgZ3NpIGFzIGl0IHNob3VsZCBiZSB1c2VkLCBzaW5jZSB3ZSBoYXZlIGEgZnVuY3Rpb24gdG8g
Z2V0IGdzaSBub3c/DQo+IA0KPiBJbmRlZWQgdGhpcyBhbmQgLi4uDQo+IA0KPj4+PiBTZWNvbmQs
IHdoZW4gZG9tMCBpcyBQVkgsIEkgZ2V0IHRoZSBnc2ksIGJ1dCBJIHNob3VsZCBub3QgcGFzcyBn
c2kgYXMgdGhlIGZvdXJ0aCBwYXJhbWV0ZXIgb2YgeGNfcGh5c2Rldl9tYXBfcGlycSwgSSBzaG91
bGQgY3JlYXRlIGEgbmV3IGxvY2FsIHBhcmFtZXRlciBwaXJxPS0xLCBhbmQgcGFzcyBpdCBpbi4N
Cj4+Pg0KPj4+IEkgdGhpbmsgc28sIHllcy4gWW91IGFsc28gbWF5IG5lZWQgdG8gcmVjb3JkIHRo
ZSBvdXRwdXQgdmFsdWUsIHNvIHlvdSBjYW4gbGF0ZXINCj4+PiB1c2UgaXQgZm9yIHVubWFwLiB4
Y19waHlzZGV2X21hcF9waXJxKCkgbWF5IGFsc28gbmVlZCBhZGp1c3RpbmcsIGFzIHJpZ2h0IG5v
dw0KPj4+IGl0IHdvdWxkbid0IHB1dCBhIG5lZ2F0aXZlIGluY29taW5nICpwaXJxIGludG8gdGhl
IC5waXJxIGZpZWxkLiANCj4+IHhjX3BoeXNkZXZfbWFwX3BpcnEncyBsb2dpYyBpcyBpZiB3ZSBw
YXNzIGEgbmVnYXRpdmUgaW4sIGl0IHNldHMgKnBpcnEgdG8gaW5kZXgoZ3NpKS4NCj4+IElzIGl0
cyBsb2dpYyByaWdodD8gSWYgbm90IGhvdyBkbyB3ZSBjaGFuZ2UgaXQ/DQo+IA0KPiAuLi4gdGhp
cyBtYXRjaGVzIC4uLg0KPiANCj4+PiBJIGFjdHVhbGx5IHdvbmRlciBpZiB0aGF0J3MgZXZlbiBj
b3JyZWN0IHJpZ2h0IG5vdywgaS5lLiBpbmRlcGVuZGVudCBvZiB5b3VyIGNoYW5nZS4NCj4gDQo+
IC4uLiB0aGUgcmVtYXJrIGhlcmUuDQpTbywgd2hhdCBzaG91bGQgSSBkbyBuZXh0IHN0ZXA/DQpJ
ZiBhc3N1bWUgdGhlIGxvZ2ljIG9mIGZ1bmN0aW9uIHhjX3BoeXNkZXZfbWFwX3BpcnEgYW5kIFBI
WVNERVZPUF9tYXBfcGlycSBpcyByaWdodCwNCkkgdGhpbmsgd2hhdCBJIGRpZCBub3cgaXMgcmln
aHQsIGJvdGggUFYgYW5kIFBWSCBkb20wIHNob3VsZCBwYXNzIGdzaSBpbnRvIHhjX3BoeXNkZXZf
bWFwX3BpcnEuDQpCeSB0aGUgd2F5LCBJIGZvdW5kIHhjX3BoeXNkZXZfbWFwX3BpcnEgZGlkbid0
IHN1cHBvcnQgbmVnYXRpdmUgcGlycSBpcyBzaW5jZSB5b3VyIGNvbW1pdCA5MzRhNTI1M2Q5MzJi
NmY2N2ZlNDBmYzQ4OTc1YTJiMDExN2U0Y2NlLCBkbyB5b3UgcmVtZW1iZXIgd2h5Pw0KDQo+IA0K
Pj4gRXZlbiB3aXRob3V0IG15IGNoYW5nZXMsIHBhc3N0aHJvdWdoIGNhbiB3b3JrIGZvciBQViBk
b20wLCBub3QgZm9yIFBWSCBkb20wLg0KPiANCj4gSW4gdGhlIGNvbW1vbiBjYXNlLiBJIGZlYXIg
bm8tb25lIGV2ZXIgdHJpZWQgZm9yIGEgZGV2aWNlIHdpdGggYW4gSVJRIHRoYXQNCj4gaGFzIGEg
c291cmNlIG92ZXJyaWRlIHNwZWNpZmllZCBpbiBBQ1BJLg0KPiANCj4+IEFjY29yZGluZyB0byB0
aGUgbG9naWMgb2YgaHlwZXJjYWxsIFBIWVNERVZPUF9tYXBfcGlycSwNCj4+IGlmIHBpcnEgaXMg
LTEsIGl0IGNhbGxzIHBoeXNkZXZfbWFwX3BpcnEtPiBhbGxvY2F0ZV9hbmRfbWFwX2dzaV9waXJx
LT4gYWxsb2NhdGVfcGlycSAtPiBnZXRfZnJlZV9waXJxIHRvIGdldCBwaXJxLg0KPj4gSWYgcGly
cSBpcyBzZXQgdG8gcG9zaXRpdmUgYmVmb3JlIGNhbGxpbmcgaHlwZXJjYWxsLCBpdCBzZXQgcGly
cSB0byBpdHMgb3duIHZhbHVlIGluIGFsbG9jYXRlX3BpcnEuDQo+IA0KPiBXaGljaCBpcyB3aGF0
IGxvb2tzIHdyb25nIHRvIG1lLiBRdWVzdGlvbiBpcyB3aGF0IGl0IHdhcyBkb25lIHRoaXMgd2F5
IGluIHRoZQ0KPiBmaXJzdCBwbGFjZS4NCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywN
CkppcWlhbiBDaGVuLg0K

