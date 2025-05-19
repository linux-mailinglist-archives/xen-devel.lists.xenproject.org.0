Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5261ABB56B
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 08:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989563.1373584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGuQd-0007PK-ON; Mon, 19 May 2025 06:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989563.1373584; Mon, 19 May 2025 06:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGuQd-0007Me-KY; Mon, 19 May 2025 06:56:51 +0000
Received: by outflank-mailman (input) for mailman id 989563;
 Mon, 19 May 2025 06:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vhbn=YD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uGuQb-0007MW-OB
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 06:56:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2416::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e1e6400-347e-11f0-9eb8-5ba50f476ded;
 Mon, 19 May 2025 08:56:48 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB8521.namprd12.prod.outlook.com (2603:10b6:8:17e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 06:56:43 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 06:56:43 +0000
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
X-Inumbo-ID: 6e1e6400-347e-11f0-9eb8-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z94nIBkFTZXUlyosrVAFp2DqYSPmijXAbTfmObcTkg8YAAccwGW1EKJcdfiGc8/BmF1OumqEpSP+n5x5oR7hxOg/06BMorWlXn8935P2UeuP3b5b2DGWtNo2xAUNmxXrsarFFCnXSs/S8av3uS12XWgorsWTsmcDZw3QbvCeUh8zEmrQCRpfBRq69/jacLTR+kI4H+KoRBi3bP9Rc1H1Af5jchzJQMIdG9Vmz7MSOAqAsRCebpWrSBMV27pA5jnuAey1vcSKAKx8+65Shz9g2wqsFq8vUwJkNol9V7CAfRzPGkAHNog4zx2gqkJH8oibmw0V0Lzi0F1QaF+p+zrfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9G62P8oHYyiUEUDnOfD0dm4XEvzJ84cb5JldgKZuIQ=;
 b=rjk74wjzRocWZcZcWJjvq3fzj5BVu0hsTkcTNQK29d1jcwAqbf39AJpFHgFPHu1tU1zE/qG7a4fvP/ouNJaWz5OtIYoG0NcFdeTJqqsEcs0z0sPHKnwikw5eSnhxDplM0vCf+cNBf4O3N+WlvrLgVUfEegFyCzLhWWZDrIU0W/P0FzCvuEvTmcJv2us7Hg5J99zVoCg8dMzA25kxe5DPwKN8MqzX04rH922rfbBL+sjmbOKSZYIgDPfZQk4Bk7SmZmDVo0SoBTwl4qoQtRYjIFntcU8YnHTlxHp8LJ5CLSx8yhZ1doY27l7b00j9iAcluLc0lWtDPI8JqegBeeSfMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9G62P8oHYyiUEUDnOfD0dm4XEvzJ84cb5JldgKZuIQ=;
 b=259ipl2PlCd1ja6fl2znJ3/Lb/xzHvZzO1aWDZsvHtJDxlpY/6JeLL2r2hO2OeXbaVRbGfc4Y0iRDaxBqsB38vdgOuwTNlvYHLkFBzlum1JIx+UwvLLZd+qEdOk0M5Ykh5oib9cVSZpYrb64/ig8eqDw3PiEkzsfNazKAtRF4nI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v4 04/10] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index: AQHbwMGgw07cR2qhKk29BPmLZ9E3lrPYgkkAgAGWNAA=
Date: Mon, 19 May 2025 06:56:43 +0000
Message-ID:
 <BL1PR12MB5849F798B49855278B1AB2B9E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-5-Jiqian.Chen@amd.com>
 <0a6f40a9-a0ea-4652-8692-acfcf873463a@suse.com>
In-Reply-To: <0a6f40a9-a0ea-4652-8692-acfcf873463a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB8521:EE_
x-ms-office365-filtering-correlation-id: c4bd096b-f74f-488a-fd3a-08dd96a2506b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K2l4YzVVS1ZDVkV5VElKanRtOGZuODNZL2hYQS9LbEtkZVlFa2FDaERsYS8r?=
 =?utf-8?B?SlROV2dJVjhZWU5kS3ZDV3B2a2J0YU1Sby9zR1RHUzRXak50M0lXMy9TOFBT?=
 =?utf-8?B?eTNWclVGVktBN3M0d2Z2cjRDNTZlWVNqNTFHUFgrelY3LzFGVHVPR25BR1JB?=
 =?utf-8?B?a005ckRJVThIVTlMN3dtVTlrVXczY0tPcGNQK0l5YXNKREo1U3JDL295OFlo?=
 =?utf-8?B?dEhobUJ0K0RvMk4zRlNFb2pqeTlwcnJ0TzloSm9ZRnhLNzNucmcvU2ZZcWFG?=
 =?utf-8?B?TjU3UkFac3VSdmlabHJ5UTR6NmZPR3FiaHRuYTdXdFBmNmtXNWg1NVc2am5s?=
 =?utf-8?B?VHFUZnY5NUxjKzFFM1g1MjVxSjVTVXUrQWpockNoZkpzbjA1QXprU3NtUTFC?=
 =?utf-8?B?ZkpFd0YvdXV4cnZPMXIrSHJydGRJd3F2aitnR3BnaXlIS3hucDlqSkVpVERM?=
 =?utf-8?B?M0pRZC9hRjVKOTJVeEJhN0RIbkM2RnpybWJPZDN2dGszdnZaMU9CVzdsUUFP?=
 =?utf-8?B?K3doUnprN09heGhBSFRVSUZKeXh0Z3p2ZDhybGhFTisrcWNCQWg1MGJWbEo5?=
 =?utf-8?B?WTM0bWdZTkpVQ29QM2pCWEhpUmNlT0NkZno2OUhTRXRLMHhjSFgxWkpOcVMw?=
 =?utf-8?B?QXIvT0l6M2duOHJKOGlOQnBvVDJ5SU82bGJZY2FqS2FIUXdrSGo2dUh0dXRq?=
 =?utf-8?B?ZkV2NmREcG9Ma1ByaXRaM0NSOGo5bVFyR2lpdWdDMnhXdTFoenJITk4zRnl2?=
 =?utf-8?B?TGtaSDJiRWRmN0xBRnpQL3ZrTy80Ryt1RUlGS21QRUpzR3hrcnhjdXdCRmtP?=
 =?utf-8?B?VTZScklFVWJ4WEFYWEhQZjBKRzUxUnFHYW8vS2NzZ3ZoUHhzajVvVmQ5dHVI?=
 =?utf-8?B?V2lhRVRMQWFnc2NpV2FiTU9JTENTd0lkMUlnY0ZVTUtGN0VXOVJPeUIwSkxw?=
 =?utf-8?B?QkdET0xPb3NsSVZHWjcrSXFHZGFtZWpva2JwOXdkTlJqbko3c090Q0hQM2JZ?=
 =?utf-8?B?S1JibFRjNWFlZmp3STZGWkZsT0g2ampUbjRzUzE5VVNQYTBQSFdydmozWkxF?=
 =?utf-8?B?M2tNTVFXaXZ0RzhPdldyTXlROUxFVTJ6VDI4M1ZZMnhhZkdEY0VKRk1yZ3FI?=
 =?utf-8?B?MWlERDVzS2pFNjkwUjNid2VLeG9oSkE3MDkvNmRqT2J5WW50ZVQrZWpndXlU?=
 =?utf-8?B?dVY4MnR0VkF5MzBUemF3ekdaTStQTmtNRmo0RmxoZkZvWXJUc1VvVEd6SmdK?=
 =?utf-8?B?KzVRdGFzWkZPd3NiYVRyNS8zNzhYTDA2Q0RBODdVWUtCcHUyWC9CbnhSUFk2?=
 =?utf-8?B?N1Nha2ZZYkJwbVg2RzRWdVJDUUphSXk0Unh2QWJlbHBmYXNvYWJkUHFrUHZR?=
 =?utf-8?B?bDFUd2VKaGdRbjZVSGFTZ3ROZ1lTQTlYUGtoUWNqdFg4SUZyUmF3cVJmM2Fi?=
 =?utf-8?B?S2p2S2pUTnUrdXdmTVNZKzAxZzRoNHl3TVNQMzVRY2o5Nk1vR2E4ZzJUVHNI?=
 =?utf-8?B?VU9UQU1jYjVhb2V5a1lydWFiTXNEZTdiM2VkTFJFeklqMHVLNHRYc254YlN2?=
 =?utf-8?B?SVFveG5yTVg3VGp1ays5TE1QTUxsSnIyblYvZkpjUVEzOE1QUVdUdDNLYnRP?=
 =?utf-8?B?Y2NkQXQyTktqeFEycGdFUlpBYlZsam5sMGo5dkRrVEE5MnA3aVp6RVUwUTN4?=
 =?utf-8?B?WlQ5MngwaTlET2J2MHV1eHFiWW5QYk9XWUZzRXV0WTQvaWtqNkF0Uk1GZXpF?=
 =?utf-8?B?VDlDQUhqODhuY3lqRFJZUFBsc0F2clREVDJVMWhnUkR2LzRJN3RyTUZ5OTRS?=
 =?utf-8?B?TUhobG9uMkVDWkl3WExLcVRXamhLWlNWVDNWRkdEanREOVIxVTd1Q2J5TGhl?=
 =?utf-8?B?TmUxL0NGRm94NzREb2RuU2tKNGxQSWRSczRKZTVlVDIwUk5iRUxtdDJDM0ht?=
 =?utf-8?B?SjVXcEhiY0l2V1pFb3JyOUZKZWdKVUxaWkxXa3Rud2l3cENyUHdXby9zeDVN?=
 =?utf-8?B?SWZVRVUrSHJBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHV2UzFCeFI5MDE5QXlqOThlWVZUUXp2T05KQ3ZML2d6N2tDV0lUMW5TTHNS?=
 =?utf-8?B?d0lIY2hobS9lc0txZ2hKeHdlSTdXRkNCbHlpOXBSV29JV3NNR2RqVG5SS09p?=
 =?utf-8?B?eVVxK2tPaTlvTHlyeXFSTDJXeE4xeTdUZTRRaXBOWlVndGNTb2IrS0ZORlQ5?=
 =?utf-8?B?Z2svaEg5T1U4b2ltYm1VYU1JTDB6VUkvdXAyc3czOWNyd1poN3VBYjJEcGJz?=
 =?utf-8?B?N1QrR0R2UUwzNnU4L0Myb09kbWxaNFJleEhEd01hOFZySGJVa0dTQWlVOUx2?=
 =?utf-8?B?NHg3VTh0YjRxS3U0azA4SmdzNFU0eGVtZTMzMnMwNEdIcFhXQzN0NTVSWnpX?=
 =?utf-8?B?OGFJbFhsOG1Dc0QyNU8rS1VHM3ZXTlFlN1V4K3dGUjhUdnZqTzB0b1ZNNG81?=
 =?utf-8?B?SENjRzM5NEE0ZVRrSnJjQnpUMWMzT2k0ZVNtbVJwd3EzMHFPc1V0VFludXZi?=
 =?utf-8?B?eGNtVW1jM3FiRWZudGRkRGNMRVcwL1BkMnRIdW56bWUyOGRFdk1SWDFwUGtW?=
 =?utf-8?B?NGVWanlaZTJJektydDk4Smo5VC9NVEE2SjNzVzVRTUhXNFhoQU5qSy9UT3JL?=
 =?utf-8?B?eDl4ZzBkTFRmTFJsemZYR3hVeFV1Z0V2ekNCVktMYldmVGFoUFJsYTJTMzhv?=
 =?utf-8?B?SGYveE0za0dya0syZVNWL3ZISHFmUjdqbVUvY1RqWExVUGNsYTJwV0VobnE3?=
 =?utf-8?B?VUwvcXpIZnhxaUx3KzhaUExONVpYcjZRcjRPUG9KUTFOMmp5d3hoMzN4WWZJ?=
 =?utf-8?B?SGM4NGtHUjE0ZjQ3YVhwczF2V09NcStnaEdNSU93SkNSbHVDZUNiTEViMmU1?=
 =?utf-8?B?SC8vbWFBSkVRUUNHUUlnZkNaUFEya1U1VXN1T1FCUGViYTFkaERMeUJPQ0FZ?=
 =?utf-8?B?OGVRdngwWnUvbVNuTDRHUFkwdUpjNU4xUGtmaDl4dDY4NlQ0c280V1l5ZjBW?=
 =?utf-8?B?RWkyM0U3dnkyVnpEemZnUDJtS04rWGN1S25OY2piWHhEYWY0SlF3ektrNlE2?=
 =?utf-8?B?Z011RkN0ZEErZG5ESnNZUHR1c1ZkZGdaTWhwOFlycnphb0dHK0RiVElaMXox?=
 =?utf-8?B?RGdzaHlEa09admp6RnpyR0FvdDZET01iekN1SFFzQXd1TGlyazB1MlZwaGg5?=
 =?utf-8?B?NDkyN3dUNjFwTGpGVkdOYXNrY0FQVUVNQkhobG1UeDF6VGRyL3RYTXFKMmtu?=
 =?utf-8?B?M002c2F5SzQwSzhjWjNXamRkNjUyTmIyaE15eGF6Z3pabmQxZ0NlVHhGeVR6?=
 =?utf-8?B?YVFoU2ZRbDVwVzFhT3hpNk9JbUdObzBnOGNCUWJad0FrcXhaR2NDUXJtcVB3?=
 =?utf-8?B?VmRNU0s2RXFLVGRSQnZBWmprOEVQZVdMejZFOFd5dmZXWkRoTTdYK2RwbFRO?=
 =?utf-8?B?ZnFOUjVEMUFLZ2x5aHhiSFhIWFZnWmNnZERlYktqbllSY1NTaGVSS3RpOU5H?=
 =?utf-8?B?QUVIZzl0bmo5M1VqS2NLSko5VDNQa1BQZ3YwNXM1K2FReGQ4aUdjSjlvTzJt?=
 =?utf-8?B?L1EyV2VkbkNVTktFY1p2WmhHZmt6Ri9yZkNUK21HZWJ0WkpHeXlUTWRRN2hM?=
 =?utf-8?B?RGRsWEp2ZkVSSmVMRWdXYTd1NDVseS9VOW05Tm9XU1FuVG4rT1R2eXBwL0dW?=
 =?utf-8?B?TTJoV1AzdVdvRXlqdkFXR3h1d2FEZThTemNJeUFMdDM1SDFuQU4vWmJOc293?=
 =?utf-8?B?YnNHVTZyYnpyWER5RnJYRE9ueDZRY3IzT3dFRXdieU9MaDRWZ2ZLTXhYb0VZ?=
 =?utf-8?B?dlBPTGI3aTRKdnY4RURvZ3BhMWRxQ2pENStLQVlmeS81andrV3ZPd0g0OWR5?=
 =?utf-8?B?RXpHMEpiM09Mc2JVYXdDek9WL3NtRWtwRmpYVTN6cU1mOHJRSDN0WG9BdlVL?=
 =?utf-8?B?VFZUb0F6bWZDMTkvTUZPOTdGbjdudjFWUWIzVUZibllnMkx0K2Rqdk5IM2FQ?=
 =?utf-8?B?RS9naU1kbW4vVFc5VlNDZzNZTEtvRFI3OUhSK0pkU1g0SkcrS3lXbDBJT0Ix?=
 =?utf-8?B?bDFWeVZCVDNMVTV1cTNpbVRHYVR0K1BDWGpsMURnWngyd0QwL3NxQWVaVnpR?=
 =?utf-8?B?bXJWa3JWUVI3NG1xcmx0cGdQS2tNbG53T1RrWUd6NkQ2b1huMmd3T2FtVTFX?=
 =?utf-8?Q?v350=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <393478FC4D19D147859D3E78B4B02BAC@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bd096b-f74f-488a-fd3a-08dd96a2506b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 06:56:43.4453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ld2Mi7KlIJFYnAKbkYpV3rVXe3qsl8OI7CGAFh7pd5wG8r9OKpEJm2jl7cM1zj8NSRMm1gOewskUqHPPp53t/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8521

T24gMjAyNS81LzE4IDIyOjM0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDUuMjAyNSAx
MTowNSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL21zaS5j
DQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL21zaS5jDQo+PiBAQCAtMjcwLDcgKzI3MCw3IEBA
IHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAg
DQo+PiAgICAgIHJldHVybiAwOw0KPj4gIH0NCj4+IC1SRUdJU1RFUl9WUENJX0lOSVQoaW5pdF9t
c2ksIFZQQ0lfUFJJT1JJVFlfTE9XKTsNCj4+ICtSRUdJU1RFUl9WUENJX0xFR0FDWV9DQVAoUENJ
X0NBUF9JRF9NU0ksIGluaXRfbXNpLCBOVUxMKTsNCj4gDQo+IFRvIGtlZXAgaWRlbnRpZmllciBs
ZW5ndGggYm91bmRlZCwgaG93IGFib3V0IFJFR0lTVEVSX1ZQQ0lfQ0FQKCkgaGVyZQ0KPiBhbmQg
Li4uDQo+IA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9yZWJhci5jDQo+PiArKysgYi94ZW4v
ZHJpdmVycy92cGNpL3JlYmFyLmMNCj4+IEBAIC0xMTgsNyArMTE4LDcgQEAgc3RhdGljIGludCBj
Zl9jaGVjayBpbml0X3JlYmFyKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gIA0KPj4gICAgICBy
ZXR1cm4gMDsNCj4+ICB9DQo+PiAtUkVHSVNURVJfVlBDSV9JTklUKGluaXRfcmViYXIsIFZQQ0lf
UFJJT1JJVFlfTE9XKTsNCj4+ICtSRUdJU1RFUl9WUENJX0VYVEVOREVEX0NBUChQQ0lfRVhUX0NB
UF9JRF9SRUJBUiwgaW5pdF9yZWJhciwgTlVMTCk7DQo+IA0KPiAuLi4gYW5kIFJFR0lTVEVSX1ZQ
Q0lfRVhUQ0FQKCkgaGVyZT8NCg0KSWYgc28sIEkgbmVlZCB0byBjaGFuZ2UgdGhlIG5hbWUgb2Yg
UkVHSVNURVJfVlBDSV9DQVAgdG8gYmUgX1JFR0lTVEVSX1ZQQ0lfQ0FQID8NCg0KI2RlZmluZSBS
RUdJU1RFUl9WUENJX0NBUChjYXAsIGZpbml0LCBmY2xlYW4sIGV4dCkgXA0KICBzdGF0aWMgdnBj
aV9jYXBhYmlsaXR5X3QgZmluaXQjI190ID0geyBcDQogICAgICAgIC5pZCA9IChjYXApLCBcDQog
ICAgICAgIC5pbml0ID0gKGZpbml0KSwgXA0KICAgICAgICAuY2xlYW51cCA9IChmY2xlYW4pLCBc
DQogICAgICAgIC5pc19leHQgPSAoZXh0KSwgXA0KICB9OyBcDQogIHN0YXRpYyB2cGNpX2NhcGFi
aWxpdHlfdCAqY29uc3QgZmluaXQjI19lbnRyeSAgXA0KICAgICAgICAgICAgICAgX191c2VkX3Nl
Y3Rpb24oIi5kYXRhLnZwY2kiKSA9ICZmaW5pdCMjX3QNCg0KPiANCj4+IEBAIC04Myw2ICs4Mywz
NSBAQCBzdGF0aWMgaW50IGFzc2lnbl92aXJ0dWFsX3NiZGYoc3RydWN0IHBjaV9kZXYgKnBkZXYp
DQo+PiAgDQo+PiAgI2VuZGlmIC8qIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUICovDQo+
PiAgDQo+PiArc3RhdGljIGludCB2cGNpX2luaXRfY2FwYWJpbGl0aWVzKHN0cnVjdCBwY2lfZGV2
ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAgZm9yICggdW5zaWduZWQgaW50IGkgPSAwOyBpIDwgTlVN
X1ZQQ0lfSU5JVDsgaSsrICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgY29uc3QgdnBjaV9jYXBh
YmlsaXR5X3QgKmNhcGFiaWxpdHkgPSBfX3N0YXJ0X3ZwY2lfYXJyYXlbaV07DQo+PiArICAgICAg
ICBjb25zdCB1bnNpZ25lZCBpbnQgY2FwID0gY2FwYWJpbGl0eS0+aWQ7DQo+PiArICAgICAgICBj
b25zdCBib29sIGlzX2V4dCA9IGNhcGFiaWxpdHktPmlzX2V4dDsNCj4+ICsgICAgICAgIHVuc2ln
bmVkIGludCBwb3M7DQo+PiArICAgICAgICBpbnQgcmM7DQo+PiArDQo+PiArICAgICAgICBpZiAo
ICFpc19oYXJkd2FyZV9kb21haW4ocGRldi0+ZG9tYWluKSAmJiBpc19leHQgKQ0KPj4gKyAgICAg
ICAgICAgIGNvbnRpbnVlOw0KPiANCj4gRm9sZCB0aGlzIGludG8gLi4uDQo+IA0KPj4gKyAgICAg
ICAgaWYgKCAhaXNfZXh0ICkNCj4+ICsgICAgICAgICAgICBwb3MgPSBwY2lfZmluZF9jYXBfb2Zm
c2V0KHBkZXYtPnNiZGYsIGNhcCk7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICAgICAg
cG9zID0gcGNpX2ZpbmRfZXh0X2NhcGFiaWxpdHkocGRldi0+c2JkZiwgY2FwKTsNCj4gDQo+IC4u
LiB0aGlzIGJ5IGFkZGluZyBhIG1pZGRsZSAiZWxzZSBpZigpIj8NCkl0IHNlZW1zIGJldHRlciwg
d2lsbCBkby4NClRoYW5rcy4NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlx
aWFuIENoZW4uDQo=

