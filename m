Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB85AB40BFA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 19:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107177.1457700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUmD-0008ID-7U; Tue, 02 Sep 2025 17:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107177.1457700; Tue, 02 Sep 2025 17:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utUmD-0008Fj-3f; Tue, 02 Sep 2025 17:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1107177;
 Tue, 02 Sep 2025 17:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V/Ey=3N=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utUmA-0008FY-RI
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 17:26:34 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f80bf676-8821-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 19:26:32 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DBAPR03MB6645.eurprd03.prod.outlook.com (2603:10a6:10:17f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 17:26:30 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 17:26:30 +0000
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
X-Inumbo-ID: f80bf676-8821-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxRgNP2rDRrJ79wBtAf910JNU7vxy9Rob452QgiJd3PZBXwKLIYcNsLc3E+LYGmpcdWZgaBLKJmTNoaNfZiafY+2l0kK4KmPDOieixm2AaVd1PUkmYxdGqIvAwPQ7luOdRvRz+A44jmuegl1vTl+cKj+V44d93jlviNg6iyKYVncUicMCnQdxWswpGllgXQfTqaroAuBys4wmuEl5JdCSDnrdZXvw3YwMYQVm1IdhWhTfTc4yzs9YbtFKkbKGMiBtPUPTzIi7zQjlTGYS+vdllZQQGAAWC/MZB7jp2YFjzGRTrK69zGMjTZoWIkAvQBpCDbajqNSq3s0JZUBIJdDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qsO6yvl8kP8Lnb/IhB+86EVh+gzG8bLFyt+V2oF6zw=;
 b=V3Fin9RFnmS6HXtqoQ78CZzTkbFb/cR6qBuFrjLp+I3zUvRt4c5EeEWKIprlXw4PwCRxmAItztzaO8QBui2oXaC0e4Ivhmq8l5XaMne0o3tHc6B/LSgYYGp28rbciqUB90F/vy50CAjWeSevvcEEjrQ1XLM9fMU1B6WW9JGcFdZ1fO3ikrf3J8rTWyQkk3bZLqJUGohIeptUiUVGQR7k9BdCbi+6k5Ph6srNozEKUdo/QYpmTJn14Nz8F/O19mB4yCrWxYRsynIk+QdN9SPyw7jlFdWszYK03h0GkMC1amY1jDJo748u05WI7PhhKn6KB6di/Ls3pDvWSWpdTA62Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qsO6yvl8kP8Lnb/IhB+86EVh+gzG8bLFyt+V2oF6zw=;
 b=uhZasLP0Zlyjzu3tMfTe8yRRhwCUnLGfFIjojwh+SFfFntu3TamODZBahdWZx6iJtcvcC+vZkGsf8/yrhAFELoGL8l4TQ8UeUdOi2f6i/NqhMlC/I7GQ4R1VLAibSzkBVQtd5HHqGg1j8rbAiNQ6XOL2JKThfvfP3XO2kvPY97Z5m422o582vhHmFjqfNtX210q9YxrJyE2w4EHOYXVcb87U4xtGuMXmeg7J1LEXjWRyKx3TI2SOS5v0FUvl0aKRXRoOXTSODPvS7Jmm7x0WVFbgzrBoWj9m+dMADJHetWelQ9JfyRdq7si9uSXorhUZQex6LCwD5DPRJQG8A5qhXg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcGP7lSnKp01vKiUyg8GCh+goOA7SAIt4AgAAIk4A=
Date: Tue, 2 Sep 2025 17:26:30 +0000
Message-ID: <a10ae626-126d-4afc-acce-1e699a9d68e2@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <6fda233a1a2f0362062ff9a6e80ee223d33815cf.1756481577.git.leonid_komarianskyi@epam.com>
 <06ff285f-39d5-4ffd-b842-6d776bb793ac@xen.org>
In-Reply-To: <06ff285f-39d5-4ffd-b842-6d776bb793ac@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DBAPR03MB6645:EE_
x-ms-office365-filtering-correlation-id: f0cfb65c-3b1c-4120-f015-08ddea45daf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RjJiSFFwVUVyV04rN29JOVJ2eFB1am9tYmNUU0JlcDV0UndMQlNXVTFWeXor?=
 =?utf-8?B?UXA1b0Z6TUFWYmNIb1hTZlVnQUprdkVEUFhJQlNzQjNWcW5mN3duaG4xbm9U?=
 =?utf-8?B?Q21wYnY2N0M2VjhRZWo2T1N1RXBFMFV3QW1vcTk1bnhWZGV6UTg1b1gzT0F1?=
 =?utf-8?B?K0x4S0hNUVQxelVMUCtGRWJzcW00d0k4em12cDIybDJoV3kzNm9Ec1dQa09K?=
 =?utf-8?B?V1NvNUROMEpjc2tRVVhFQnBlaEF2NytHaUZOQ1ZSSGhXNjdZMk5XSjM3Y3FF?=
 =?utf-8?B?YUx3Rk9Qci9lbTMyeCs1d3hQK3BlREEySStvRjlQaWR3aTNEek9vZFQ2aWlu?=
 =?utf-8?B?cEFNRFhlSXhQaHc1aE1OMmtiYk40Vmw1M3dGTlRqNWwxdVpxbGxIYS9PQm81?=
 =?utf-8?B?SFJ4c2phZkZ1YXZGU1lyVUtqRUlxYVRqSS9LR2RGRTY2dndCdk5tNFovVWdI?=
 =?utf-8?B?Yk5tQk4rKzhHVGFCRmN6MHNmMmlkZkg2M094VjJvc081eDQxb29nSlp5MUZJ?=
 =?utf-8?B?a1U2Q3pUOGJRQ3JRK09wN1ZMbC95ZnptdFY0S3poVEpFblluRnQzWHZTUG1J?=
 =?utf-8?B?RTFXaXZjaDdob25sWXBRMTI2cE5PejcrWUJXcmxyK2htWDhGOSszVlc2Mjhs?=
 =?utf-8?B?SGFYdmIvZ3g3UG1RK1RjU1E2RjVOZG1UNWpGWHhzWVpLVzhPeE4rdjRRQjhl?=
 =?utf-8?B?aEhkVWl4SVpQdjZpRnQ5YnNxSEpuR3gvN2t2RDZ3eFljejVUR3BrRVBtMzNQ?=
 =?utf-8?B?U3BxamRxcW9lVElIeTBJaXNLLy8rbnZDendjS3pqUzEydlg0ZmdjdTNtVUJq?=
 =?utf-8?B?VkJ1UDZ3QWowcFRVZmd2V0YyUkV3cUt1bVkwUnZiRGxCWjVGb3o1VVlyOC84?=
 =?utf-8?B?RWpuRng4eWNjd2RKZmxOQTYxQjdQdU5LZGwxREwyYUhUVklVK2ZibkxpMlli?=
 =?utf-8?B?UjloakNlUllUOVY5N21QQ2VOeFhFT1FsNGxFNVVWendWTGd5RkhyaXhyRmdU?=
 =?utf-8?B?RHBZR3BTcXo3S1RvWUFJbmZkcFBlMTZ4NjVUOGx0Y0JscnUyai8rN3VuUU4z?=
 =?utf-8?B?anZoc0N6WWZzRXZLdlV0MEN0K3NQNkZLTDJybXR4NkpTQXIzZ0pjenFRc1F4?=
 =?utf-8?B?NUxpeU96SkRsMlRWc3BKbEhNSm9LZndiMDgxQ0Jic2VIbG83WXNPL0ZyTGtJ?=
 =?utf-8?B?SmdRYnI3T0pndEUzN1lVVzZrUENmUXY3blRTSnovYzVCYnNQVVBWaTgvdWNt?=
 =?utf-8?B?Q21yWDRwU0RrK1A5bllQczNGZUhaZTd5MEFGSFJISEhRVlZhYWdxTG54cUZM?=
 =?utf-8?B?ZlpITksvd3NDOGt3Sko5VzZaU2k5dEhhVXlRVmM3OHZta0ZxQ01oZzVCQ3I1?=
 =?utf-8?B?TGcwSWpDN0RhRlJNK0twNDI4SEFLZlN5L3hqK1hGVGFkc1o2aXg5REF4dEF2?=
 =?utf-8?B?cU5SUGc2YkUxWVdZNmlydWhvYS9xVjlSZU9qRmE1WXB5K3Z3SHFBWFRhNG55?=
 =?utf-8?B?Q1dCN0NUcXFWVDMwcXVVK2Nlai81TmtjVy95amJ0eUo5OVNacWNUeTdYNFk4?=
 =?utf-8?B?TkMwSi9MSUtZL1hweWZIRnZuZmJFNGZxTy9USmEvSUFIWTB0QWhmNVA4a1ZB?=
 =?utf-8?B?WmFEV2pzRzNTeHNaWnlUSit5WlRqamprNWhvZTJ5YUJKUXFzeExORFhPQng1?=
 =?utf-8?B?dEYxM2VhV2p0WVhmSXRMdHV5Y09wSWo4VTBoN1FlVHhESnBsV3dVZWE5ZnBY?=
 =?utf-8?B?NUU5SkpiZDAvUVFMRDg4NTFJNElrZld6cUNJYm5XMmRNejBTbUVTQzh5b1Yv?=
 =?utf-8?B?Y05pNk9hb0pWU1kwSGR4QTczNXFQZmFLUU1OTGpaVFVvS1hqWHFNVnZLdjZM?=
 =?utf-8?B?aVk5SVdNUXdyRjc3Z2JScmEvR1Y3MWk1c0xDQnRJNFVhUWN1TzdJdXhoMzEw?=
 =?utf-8?B?TWpDcFNZWG5icXIyajNVRGFPNWhzRGF5bVRlTHM1Mi9sdEUxSlg3VnREbHFO?=
 =?utf-8?B?MzJQK0dVVURnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SU5PSjVyTW8xYU80TzRsamo2U0gxMVpPUmRjaklUUjlkeWc4UUxxOTZTS1JO?=
 =?utf-8?B?M092YzZHMWI0U1ZuM1NieC9kR0tjK1JTTjVaZ0U1aHU5UWVCVnlkcEllVE1w?=
 =?utf-8?B?M2RNMWFKN2RtVlVoNHZ1RHlQSjVSOGd4YXBrYjBRZVBnYm9ZRm0yVTlqY0xw?=
 =?utf-8?B?bWNuMVhWdXBWaDdWV0s2VXJyYVpvNnJDcVlXaTdBb2F2dnRidzFKWFhadU1u?=
 =?utf-8?B?SkVHNGpsV1pPTTQzZ2ptb2dPOG9QQUVBMUkxWSs4cFpWdGlQenEvSnA1Nlo3?=
 =?utf-8?B?T1VxTzR2QXk3d1Iya3Jka3V2RlJsdkpPMmZVeWp5eFNYR1Vvek9GNUdWZFcw?=
 =?utf-8?B?NGUyZktLcHFQdEQ5VE81cWlIUXVaZlZCaWFCNUVxZURIQjNuYXpoR0s0cjJx?=
 =?utf-8?B?SWM2V2xpNXQ0Qms3dUZoMWdyeTdnRi9TSkEvREhadjFlRERwczNkcUtpL3NT?=
 =?utf-8?B?VVhGTmswSUZKNHkwR3d1VGZtZ0dXT3lCb0xWc3lIM3Z2bnhnYk5nUURNUDYz?=
 =?utf-8?B?THNiU2Y2UGtMU2hwdDJHNXd3ZjZsV25uVE1INXpsSGNQdndocUdwZm4vMnNa?=
 =?utf-8?B?NHIvK0x3UXl4SnZSNlJWV0dxZEkzclNRcUdZNW5NWmlYaVcxMTZYRXJkNVdH?=
 =?utf-8?B?U0swZ1ZwRWpackRWZURGaVBKTFZ6ZHk2dVN4L1Q5V1FPc05LeVRGbUZIdnFQ?=
 =?utf-8?B?QW5xUE9jREIxUFZDY04zOUxzT1ZaOCtPaGpVbjl4UjhqOTJDR0lQU0dxSFVi?=
 =?utf-8?B?QnpRWW1OYXhvM0VkWEg1WXcrRWNmZEtTZXVWMkU3ZzF6Q1dLVERuVHlULzlk?=
 =?utf-8?B?UG5GQlBYTlYzekZ3QVRYWjJpQjQ5ajEvNHJSOFJUTXhGbHJsZVEvZVh5MVll?=
 =?utf-8?B?a2srLzFET3JTNFdaeHk5UlptRUN4U1BIZDJaalZtV3p3c1VtY3o0bS9rZGJV?=
 =?utf-8?B?dE5xcmNGV0dwRkFFZllUdEorWm1yR0NHRlovOTBxTzFLTTErV1ZMelArMm9o?=
 =?utf-8?B?MUZGOWxGaThXcUx5c3lLbWdMMERram9WUVJhUWZYUnV3NW8zSE9sajYzb0JD?=
 =?utf-8?B?M3R5bjB5ZlRwaFVhYTBVZk5SQkJRcmdJKzRKQ0tYb1IxS0I4RWx0bFZ1MVZp?=
 =?utf-8?B?bXRyaUt3QXlyaXhjK0hoTVkweXp0ZHNXd0xMaGNhd0FnYlZVaEhCZG12SzFu?=
 =?utf-8?B?dFdCQ3BZcUltYXVNNTJySDNPWUF1MXVRYWxqUlhUNllXRjNwRFpSTzVrcm01?=
 =?utf-8?B?NTRPRytMOHNwQ0VQRE5qRkkvNE1ZTmVkLzVCb0taQWF3c2RQaW5UTGp0bHVF?=
 =?utf-8?B?NkhaWldRMjVmNjE1a2Z1cDVzM2UyT0pndnV2S2RoSWE2bkVqWEpwOTdjRnZx?=
 =?utf-8?B?VjMwZXhvU1hmMHJ1eEF4TDdHakppSWtDaWk1M0NUMFJxTWJVWkJOVnFZcmFj?=
 =?utf-8?B?cER1STBrRWlmdjByR1N1ckFOUHJvVE4waFJnQjZQbmNvMVRhbGJpcmtXeWFs?=
 =?utf-8?B?TE42WFpvQlp4ZWc3TWpJOGVaVmpWMXoxaFgySVExeWRYZHd3ejNWRTJKMWxG?=
 =?utf-8?B?L050QnI2Z2g1ZVVIZmZaUGhHL2JoOU5uM2UyaXVmWm9memhHeEx6cWtONzYv?=
 =?utf-8?B?aWdRVXZQZmxCdnZsb05WRVV0TDYxYUIrUWJkbGdsQmI5NG1ZWEFWSVp6ODdI?=
 =?utf-8?B?cHl6OWZ3bTc2cDlmWWhhOWllbVFMakE1RlA3cVZTV21IVDZnVmkwNnZLK2tQ?=
 =?utf-8?B?ZlJYSCt2NXZkcy82cmFLWnp5a2ZZZWM4a3ZKdmdnd3cxT3dJWWRUYU0rOTRJ?=
 =?utf-8?B?b1FKUiszYjdZYSt1QTd0dDByRFN2ZnVpK3oxUFFHYzdxQkF0bUFRazNreldI?=
 =?utf-8?B?ZkhLT1dmOEpHSXNkS0dmNDhUdlJ5R1FpSGE5blJ5UFpRaUlOV0JHRlBtMTNR?=
 =?utf-8?B?bkwzdTJIOHRKMmhOSit5Y09vTS9hMTRBZXQwaWZuTzFHMWx1c1owQks3LzF6?=
 =?utf-8?B?OWl4aXI2R3VmVGw4MW1ST0IwUG5CaFhKczFpdDVVYlFqbTNxZnJoVEovNDRo?=
 =?utf-8?B?ejFkVHNEMDh3c082eFhXaGFCMEZmVHNlTlVrYUx1M1BSYWgyOFNRN1hHWFdS?=
 =?utf-8?B?bjJiVkU5QUUrcDJhNnJ5U1QvNzY0bEF3bGNHN0NtY2MyOHNRUnJCam5LbkYr?=
 =?utf-8?Q?cIcvReWahJL4vbV5ooGZIno=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D0EC90B7A90E84F9B2B15011B58ADD5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cfb65c-3b1c-4120-f015-08ddea45daf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 17:26:30.3406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxcxpHW+XBW6BQ9EGuSAaq8iwfouNQORRMD4C2DzGsV491XJHfr7vwEP0x+mCjsV+VuGcf4FPPXjtuo0WgPWbLAqbDQZ3dqsBl43Idvnsnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6645

SGkgSnVsaWVuLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IGFuZCBzdWdnZXN0aW9ucy4N
Cg0KT24gMDIuMDkuMjUgMTk6NTUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgTGVvbmlkLA0K
PiANCj4gT24gMjkvMDgvMjAyNSAxNzowNiwgTGVvbmlkIEtvbWFyaWFuc2t5aSB3cm90ZToNCj4+
IEBAIC03ODIsNDYgKzgwNCw4MSBAQCBzdGF0aWMgaW50IA0KPj4gX192Z2ljX3YzX2Rpc3RyX2Nv
bW1vbl9tbWlvX3dyaXRlKGNvbnN0IGNoYXIgKm5hbWUsIHN0cnVjdCB2Y3B1ICp2LA0KPj4gwqDC
oMKgwqDCoCB7DQo+PiDCoMKgwqDCoMKgIGNhc2UgVlJBTkdFMzIoR0lDRF9JR1JPVVBSLCBHSUNE
X0lHUk9VUFJOKToNCj4+IMKgwqDCoMKgwqAgY2FzZSBWUkFOR0UzMihHSUNEX0lHUlBNT0RSLCBH
SUNEX0lHUlBNT0RSTik6DQo+PiArwqDCoMKgIGNhc2UgVlJBTkdFMzIoR0lDRF9JR1JPVVBSbkUs
IEdJQ0RfSUdST1VQUm5FTik6DQo+PiArwqDCoMKgIGNhc2UgVlJBTkdFMzIoR0lDRF9JR1JQTU9E
Um5FLCBHSUNEX0lHUlBNT0RSbkVOKToNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBXZSBkbyBu
b3QgaW1wbGVtZW50IHNlY3VyaXR5IGV4dGVuc2lvbnMgZm9yIGd1ZXN0cywgd3JpdGUgDQo+PiBp
Z25vcmUgKi8NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHdyaXRlX2lnbm9yZV8zMjsNCj4+
IMKgwqDCoMKgwqAgY2FzZSBWUkFOR0UzMihHSUNEX0lTRU5BQkxFUiwgR0lDRF9JU0VOQUJMRVJO
KToNCj4+ICvCoMKgwqAgY2FzZSBWUkFOR0UzMihHSUNEX0lTRU5BQkxFUm5FLCBHSUNEX0lTRU5B
QkxFUm5FTik6DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCBkYWJ0LnNpemUgIT0gREFCVF9X
T1JEICkgZ290byBiYWRfd2lkdGg7DQo+PiAtwqDCoMKgwqDCoMKgwqAgcmFuayA9IHZnaWNfcmFu
a19vZmZzZXQodiwgMSwgcmVnIC0gR0lDRF9JU0VOQUJMRVIsIERBQlRfV09SRCk7DQo+PiArwqDC
oMKgwqDCoMKgwqAgaWYgKCByZWcgPj0gR0lDRF9JU0VOQUJMRVJuRSApDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByYW5rID0gdmdpY19leHRfcmFua19vZmZzZXQodiwgMSwgcmVnIC0gR0lD
RF9JU0VOQUJMRVJuRSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgREFCVF9XT1JEKTsNCj4+
ICvCoMKgwqDCoMKgwqDCoCBlbHNlDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYW5rID0g
dmdpY19yYW5rX29mZnNldCh2LCAxLCByZWcgLSBHSUNEX0lTRU5BQkxFUiwgDQo+PiBEQUJUX1dP
UkQpOw0KPiANCj4gV2hpbGUgSSB1bmRlcnN0YW5kIHRoZSBkZXNpcmUgdG8gdHJ5IHRvIGF2b2lk
IGNvZGUgZHVwbGljYXRpb24uIEkgZmVlbCANCj4gdGhpcyBpcyBtYWtpbmcgdGhlIGNvZGUgYSBs
b3QgbW9yZSBjb21wbGljYXRpbmcgYW5kIGluIGZhY3Qgcmlza2llciANCj4gYmVjYXVzZS4uLg0K
PiANCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIHJhbmsgPT0gTlVMTCApIGdvdG8gd3JpdGVf
aWdub3JlOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHZnaWNfbG9ja19yYW5rKHYsIHJhbmssIGZs
YWdzKTsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0ciA9IHJhbmstPmllbmFibGU7DQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgdnJlZ19yZWczMl9zZXRiaXRzKCZyYW5rLT5pZW5hYmxlLCByLCBpbmZv
KTsNCj4+IC3CoMKgwqDCoMKgwqDCoCB2Z2ljX2VuYWJsZV9pcnFzKHYsIChyYW5rLT5pZW5hYmxl
KSAmICh+dHIpLCByYW5rLT5pbmRleCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCByZWcgPj0g
R0lDRF9JU0VOQUJMRVJuRSApDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2Z2ljX2VuYWJs
ZV9pcnFzKHYsIChyYW5rLT5pZW5hYmxlKSAmICh+dHIpLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVYVF9SQU5LX0lEWDJOVU0o
cmFuay0+aW5kZXgpKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlDQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB2Z2ljX2VuYWJsZV9pcnFzKHYsIChyYW5rLT5pZW5hYmxlKSAmICh+dHIpLCBy
YW5rLT5pbmRleCk7DQo+IA0KPiAuLi4geW91IG5vdyBoYXZlIHRvIGtlZXAgYm90aCAiaWYiIHRo
ZSBzYW1lLiBVbmxlc3Mgd2UgY2FuIGhhdmUgYSANCj4gdmVyc2lvbiB0byBhdm9pZCAiaWZzIiBl
dmVyeXdoZXJlIChtYXliZSB1c2luZyBtYWNyb3MpLCBJIHdvdWxkIHJhdGhlciANCj4gY3JlYXRl
IGEgc2VwYXJhdGUgZnVuY2l0b24gdG8gaGFuZGxlIGVTUElzLg0KPiANCj4gQ2hlZXJzLA0KPiAN
Cg0KVGhlIG1haW4gaWRlYSBvZiBWNSBvZiB0aGlzIHBhdGNoIGlzIHRvIGNvbnNvbGlkYXRlIHNp
bWlsYXIgY29kZSBhbmQgDQprZWVwIHRoZSBwYWlycyBvZiByZWd1bGFyIFNQSXMgYW5kIHRoZWly
IGVTUEkgY291bnRlcnBhcnRzIGluIHRoZSBzYW1lIA0KcGxhY2UgdG8gc2ltcGxpZnkgYW55IGZ1
dHVyZSBtb2RpZmljYXRpb25zIG9mIHRoZXNlIHBhaXJzLiBJZiANCmVTUEktc3BlY2lmaWMgcmVn
aXN0ZXJzIGFyZSBtb3ZlZCB0byBhIHNlcGFyYXRlIGZ1bmN0aW9uLCBpdCB3b3VsZCANCnJlc3Vs
dCBpbiBjb2RlIGR1cGxpY2F0aW9uLiBBZGRpdGlvbmFsbHksIEkgdGhpbmsgaXQgd291bGQgYmUg
ZWFzaWVyIHRvIA0KbWlzcyB1cGRhdGluZyB0aGUgY29kZSBmb3Igb25lIHJlZ2lzdGVyIG9mIHRo
ZSBTUEkvZVNQSSBwYWlyIHdoaWxlIA0KbW9kaWZ5aW5nIHRoZSBjb2RlIGZvciB0aGUgb3RoZXIu
Lg0KDQpTbywgSSB3aWxsIHJldmlzZSB0aGUgY29kZSBhbmQgdHJ5IHRvIGF2b2lkIGlmcyB3aGVy
ZSBwb3NzaWJsZS4NCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlkDQo=

