Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FBFD2571A
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 16:42:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205412.1519693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPUZ-0000ey-7j; Thu, 15 Jan 2026 15:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205412.1519693; Thu, 15 Jan 2026 15:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPUZ-0000cR-4p; Thu, 15 Jan 2026 15:42:35 +0000
Received: by outflank-mailman (input) for mailman id 1205412;
 Thu, 15 Jan 2026 15:42:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LSxU=7U=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vgPUW-0000cC-Uw
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 15:42:33 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdae2ab4-f228-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 16:42:31 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by GV1PR03MB8094.eurprd03.prod.outlook.com (2603:10a6:150:1d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 15:42:26 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 15:42:25 +0000
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
X-Inumbo-ID: cdae2ab4-f228-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPjENYKW+cbYfY3HCgb6RHtxGx5dex45nPSaDr9hGO7xqUbaS7QwwiLUJ0e3VuEvH8dlkhEqAuNrnjBNHh+XqdX/RuxiI3DTNn95dtT1OIjpZx2nSEMDN+tYxd+8QHbHTvoPbAqw+CISDyL8P7zFB/DyV/qx5ivl89oFwSQtbGVrB+ZiNJMc7YJgN7ORh1stAXZFPAxXIwhmqFAOzUNpGOf2xMh4dhAuJy7m3fsFoEyTRv0ro4n/Y22MhOHUpJiWIjbGvKzm09cZCKkMqdqbkc9gRcf0IFWJkG12j+qOa84DBGrnriW3qtAaYxaA8hzeiOO4bzOPcAplDyk7U23r5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBBnCnh2Fafd9vf3Iw4VPpFY5LszCz06xBd2Kkjfj5M=;
 b=dd/fle+8yY+gdUI13yJG1JUd0lmqUgjNal9HH5DLdbq3UZKXSLAoQXE4K5PRHdgOcAcVqDRPw/0lzzuhacrIlHpJ82i2hXAaMwnuEK3k7VGmhqudJdpd58ifHaL6VZBcpOzVphp0rKXmD8GycIG4VWHiHzK2VcwCW6Tewa53Y7+/e61u7WtMM/IpWQORhbTlpMw/WqJO7mwLYHs4Q40XRrTYElP255Qt2VuiN+Rkpx+z1+j21OEOWzk6/HaJvcfnyw+TLvF+VpjrCvjI41MKJxUvE1S9OxqRvBEtCgAGcQIawbvycqw2Ns+Kpo88Vqu9SCKSsU+3eKfUEvmYxssubA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBBnCnh2Fafd9vf3Iw4VPpFY5LszCz06xBd2Kkjfj5M=;
 b=SNzMMLkURIkJ4dbY1LKmh2MHRUfY2b566+tqkuSAMrKklZKZM9Oi7GrHSqL0eG70CCyo8rHKY7M7WcKqxlog4AeDZR2BqkBK5i9V/H9VlPzEa0y4sb6iK/rYd2VIvudzuXy/mg+JI0Ne13FNFXh6Ft2IYvAdPY8XnlvZYhTq0WyH14Rl/wNpCypTwc2C/4AFnj70Jr0i+A7y6U+2jMOkrpacxC5QrJGQ7oMvkkiqEpmBOGd6RqSyFoujOKPYVsulmzGMB9+0GICeSf6Z+JZ2ZEiO4OGWoAzSX2EOvHrQIax1ld8CSa/lIg3++8YpPxop/R9D8PslxzRDY021ouSH+Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 3/5] lib/arm: Add I/O memory copy helpers
Thread-Topic: [PATCH v7 3/5] lib/arm: Add I/O memory copy helpers
Thread-Index: AQHchYPD+fwQGyuKXEKqeHI8xFGbqLVS9u+AgAAq8ACAADvNAIAAAX0AgAAA5QA=
Date: Thu, 15 Jan 2026 15:42:25 +0000
Message-ID: <3ea6dda4-a9ab-42ff-9150-8cce7e7888b7@epam.com>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com>
 <d166348530b9229673e1a6e3b29ff4ee9123ab2f.1768415200.git.oleksii_moisieiev@epam.com>
 <bf3e38f1-d88a-445a-b55b-a13d401dba80@suse.com>
 <8539bed5-280f-4dcc-a63d-4c0ee3b7cff7@suse.com>
 <c1f9885a-3e0a-4964-acfc-95f4c86aef06@epam.com>
 <2703684c-4ad5-44e2-a8fc-4d5b40de2d3d@suse.com>
In-Reply-To: <2703684c-4ad5-44e2-a8fc-4d5b40de2d3d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|GV1PR03MB8094:EE_
x-ms-office365-filtering-correlation-id: 885ded57-81c9-4643-37f8-08de544caea7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|1800799024|366016|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QmNjTC8yd0c1VXdqT2E2bkRyem1BUUptZ2dVWVZWTktXclE5NlEwRC9MOENM?=
 =?utf-8?B?WFBHL1loM3dSNWhqeGZuMWpCMjJEK0FYY2Q1U3JjYUgyR3pkOTlpellVeTB4?=
 =?utf-8?B?SVdIdXFOVHo5bDFBbWVhK1ZpTWd4N2Z5cGk3TkoySW4xdlllVi9odWo3bHpn?=
 =?utf-8?B?NFRyMWRGZU1oakozTG5pTzZYSlI2N0daUlpLcnhtNjkvMG9VODlHQmRGVmQz?=
 =?utf-8?B?ajY5WHpjaWN4c3dDWGpleU1qUTR0bjhwbmN5ZDVrYW1tNGtUYnhQaC9Lc3VK?=
 =?utf-8?B?eGo2WnhFNEhHeVRPQlY1SzJMZStXK05hYUVvdFVuM2tSM0FQVmFSUVNKY3VH?=
 =?utf-8?B?QzZmcUEyRHA3WnlqOTRhTGZDZU5vSjh6YStBdFhIcEJLL1BKdFFab1FCQ3BY?=
 =?utf-8?B?ZE81ZEl0VWZDYVRWWjhRZksweWYzcXd4b0pTbXFFaDYrNlFFWk80Z2UwMjRz?=
 =?utf-8?B?WkVLckFTOEtyZWtZcjZ4d1lPZElRZmQ2UzVseVdwd3p0dEZmOWRydkZFZXEw?=
 =?utf-8?B?TnNwRUZoUkdxSUdqbEcwalVwRDRvc0lOTG5MbG9zRVJrWUlhQlZodzVrWEtp?=
 =?utf-8?B?aXNsK0N0OFpNalkzLzcrb0lBYkVMNjdvY28vODAxKzJ0cmVBWmVvcE5JZGVO?=
 =?utf-8?B?VVgrL0xqUUQvUFppNUtuZElXT3V1amllay83aCtjUnpWbFNXL3VLOW5OSlJo?=
 =?utf-8?B?MmdjcG12eXBRZnJoWXdpOTdOVHg3REo0MkI2Wlpab2dXMFk3VW1ZNjJMdWVT?=
 =?utf-8?B?dDIzVlN2MG53SllBbTAzVm1FbWZUbDRHQjdmVjVXQmw4R0ZHZFdndnpKM2VG?=
 =?utf-8?B?RkN1T2NhSENYM1NIdGh6eVVEbzdIK3IwOEp0WGFVNUVsVVk5U2x4VHhEbTdY?=
 =?utf-8?B?am1rSkQxdFpmajBaV1RlbDRyNHFnZVIyVkViMkVvRW9Ub0JGRTVMRGtjYWZZ?=
 =?utf-8?B?cE1iRE0xOFlFWU9PK1ZMSk1hSUhJa1B3cXF5TFk3UzZaN2gvSzMxTmhhMkRP?=
 =?utf-8?B?SVVmZVlsN2F2WmtIQXA2ZHg2OUdrV0VMeHhHeURpc2E2Qm1CZCtjd0swdFdk?=
 =?utf-8?B?bitHVzRhREhseTJXNEdmWDZ5b0ozdTNMYWdZQm9UaVJxTnNpa3M1b1pHbGdq?=
 =?utf-8?B?S0hlQ0lHVUhwTDdGOTNNMEU5enE2N0dGanBWQ212K2l4Uytra1JUSGc0K0Jx?=
 =?utf-8?B?UktjWTdTS2JuamQwTzJmWlkrMjNYdGVweDhhbSs4RlZ1M05aM0VhbHpvdmoy?=
 =?utf-8?B?dExjczV2N21pVlYzTzFJZ0x3OUhFaWRZa25NUzc3ODd0YXloV1huNStjczg2?=
 =?utf-8?B?OEJTUTFwaGNrVzRIQ25nQU91MDJOdXlEWHZlUjQ5SWxvbnMxUis2cnMrWi9K?=
 =?utf-8?B?eFVibzhGakpBd0Q3UFFSS1pvck0wdWNaR3ZMdHcveVF1N1JJTTdMUDRPZkhz?=
 =?utf-8?B?MDFUSVEydGFuVXZXcWJJRkZXMGhaVEgySzFhd2M3Tzc4b1RZZVJFOVdtVmFG?=
 =?utf-8?B?UE5aYmNwN05tMEhvMWpQUEhJR3dnM1lhaURGNFIvbUptSTQ5ZHQ1cVUrY2xU?=
 =?utf-8?B?OE5yU0RwanhrcGFWSmtiTE1wd3ZMNHJrZCtDVXRWRUZnY0dTRWVtRytwZVZt?=
 =?utf-8?B?UFBCKzVJT3IyK3JIcTJZRWEwSU55aGdUYjNhUy9iUXF1ZDRHSnFzd0E2OVNq?=
 =?utf-8?B?Qm9yUlAyb1k2aGJFOTBlT2FSMytoRXdNeTlOcjJiWTFLcHN4VWdLWnJHcllp?=
 =?utf-8?B?ZnBoMnlvUXIwelBwR045dTFFK3Nzc0JjSEpBTEpnVmE5bmlpWElGWmthUStM?=
 =?utf-8?B?OGk4VGZUSmJaYjdUaTRtUmlOdXJmZVpOTEJsbm5VdEVocVBKUkphNDFkU0lw?=
 =?utf-8?B?aDZnd2NqT3l6eWRMdDIzNVc2dmNrQTFOaHg2N2UzN2JPTlhHaEY0WFQ4MVli?=
 =?utf-8?B?cEpVNm1aQ254aXQ1aTA2bCttbUJzdUlWV2FYWXdDVFR1ZVVqS3o0NTBDaGpm?=
 =?utf-8?B?WDVVMXJjdEtMbnliTWhId09SLzJYQnlyS29GVHBYT1V2S01DcFpPWVlzWHdJ?=
 =?utf-8?B?K0RPbVM2cFY2cnNQMFJNZkd2Z0RvSHZ2VG9pNmpTbGxzZmJyYTIzR3NRRjRj?=
 =?utf-8?B?SEJyQjNhMUdqZHFwWjdkMVRoTVlqZ2NBQjhhNG1GQlRFNm5lODhlTjltb0FV?=
 =?utf-8?Q?quQ5yWZobpUn8TBuOgmad70=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(1800799024)(366016)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YVRoaU1uUFFYUXB6SWZNUFVZeFZxTnFid1c0MXB3ZzFyZk9pejN1aGJNMTNB?=
 =?utf-8?B?aGdQaFJuNC9HK21CS2NSNkc4QlBCS3JweGl5M0dUUm9yT1lrY3dVRytKUkZJ?=
 =?utf-8?B?NDFxV1QzVEFCUnhLdTRlRWZVbWx5Vng4azdFRmR4WERpZXAvVUxRRlBqYXpO?=
 =?utf-8?B?cExGTSs1NWNlQnBYeStjNG9mOGFTb3BTeVU4bXErZ3RFdFBNTDVxaGpTWUZG?=
 =?utf-8?B?YUhQekFwV1hIWWxIWWNpR1hvelNZZ0lrQVVGeW9jZlRZUWlKU2wrOGJqWTlR?=
 =?utf-8?B?aDFrRjRQNFRGVmtEQzZBWG9WNm9iZ0VTb3UzcHRmdEMzNjhmMURMUTB5QURn?=
 =?utf-8?B?aDRLV05sQVNpakt6QmZzZG5YRzRGUUU5TXNwRTRDYWVtTzFKNStXa2Y1VWxp?=
 =?utf-8?B?RS9XUk9neG84Q3dQVFdSYnl1NzhEdVJ2Yi9HK2dMeEVyTUlqQnB1Q2t0TldL?=
 =?utf-8?B?VEdiMHRDa21rMTVGRS9GckRVQ2FKVkdCeXFYd2xUQTYxOUpOclpEQkFFZnpw?=
 =?utf-8?B?UkVDSEZoTjNlWWtmOTBYRjJLeWh1Z2c0RHk2QWVnZHpCWHd6TUhNaHo1amta?=
 =?utf-8?B?WnBaVlltQU1QZXRlSWl3MFFueTBocnN2UlI5cndsN2F5TEJJL2traHh3c0o0?=
 =?utf-8?B?a0lZSFBHRWVyWldOcTRYanROaHFmK3JXQk5POENWRnY5VEJuMnFMYzQ1dEpS?=
 =?utf-8?B?aGRZbXFuN1kzRWpQamFMUWR0N3hjZ05jMUxzRHJPOVB0T2JkOFAxMnFkZUtJ?=
 =?utf-8?B?cXhpZ05UQTk5N1RHR09rK1RXWDkrRG1VaXg0bjFROXFhNzhVN2RoYmxpNDlJ?=
 =?utf-8?B?TlJrQllZTzZPQ25JOWkrNmJ2emdxbC9Cd2xUN0pqM1ZiZGN3cndNUkoxV1g0?=
 =?utf-8?B?QnRvQ000MVhQM2JHeHhLQnd1NGd1QTZhejlZb2dJL3VuWkJWa2RmUGd2ZXgz?=
 =?utf-8?B?TEJkTE12S3VMdUdydUhGWHdHVzBLQWNVOTJ0c2FoMlFMU3FpbXFKODM4WDk2?=
 =?utf-8?B?V0x1UkdFUVhMNWVIeE5Ld0p3MGJsZEI5d1gxeFlWYjF6RURwZ0l2ZU5abERY?=
 =?utf-8?B?bVJ2dk1IazdZeVROVHVGTlNtRjRmOHozb0tnbTRaTWtUc2NIYXhQSVNOZzZ6?=
 =?utf-8?B?YmdUU0FsZWN1QWNzMFlBY1JwMWEwL3FVTXdzMjBSK09iZWRWNDlQRDUrVUIr?=
 =?utf-8?B?eFJwMTRFZUlMZ2hCSFFQYUhkYm8zZzNBK25UNlhpWTBQRFJUZzNnUVVBa1BW?=
 =?utf-8?B?aUY4RXlaVHY5Q2ZlaWtmeVd2WFlTbURQWFp6cUxPamYvd1FJUHVsdVQrRmRU?=
 =?utf-8?B?SWtoYjNmaXhMa3ZuYklTcTZXK0N6dEd0MW1tN1dlOGFEK3BZQlhkWjd6MUZa?=
 =?utf-8?B?RHhyZGZLREJoQWZKbVVXM1k0VmdpdzBXMUU3TWJDNUhVUENXL0Y0NHhpejV6?=
 =?utf-8?B?QzVGeHIycjZvajNabWtrR0w4d09xc3RPY1Y5aHVFQzF6aHJGSE1Pem9HSFMx?=
 =?utf-8?B?dXhhMCtPKy91ejJkVmVRZEdUakhabER0L1FkMTd3QnBuNnFraFBZcUNmVm1j?=
 =?utf-8?B?OTNzZ05xandCWGwxTFFERldvOXp6MkxJamJiNHViUFB3NVRadkxUZ0J5NEdy?=
 =?utf-8?B?QmQxNCs3cWNQczFkOEF4VUk1bWdjTnJWWEhLMi9HYmcxN0lxQ0NtOXRmejYy?=
 =?utf-8?B?TTZsQlhpeVpWY3JNMG5lQ2h6MWowL01FUzBXaTliRGZmbjAxcFVSRHBxK0hC?=
 =?utf-8?B?R0p2bk9ja0J3dXc5RzFTdXJ3QWVKTndQQjZ6emVreE5sV2g5aDZHd1hHTy93?=
 =?utf-8?B?R3VoZUdzaWF4aVBIOEIvSG5GaUFxRHI2eDJLeUhOTlpwdDhJMXBTM0JTbzZ1?=
 =?utf-8?B?VGViSzRCaHdpZC9jaUEzMzRML2VsYnlESTFmZVRFUFNMZ3ozTE1MWjFESTlr?=
 =?utf-8?B?SXNIL2lxNXhaSWIrWXdvblQvTC9LNUUyL0taL1dUeDhhSnZWT3huLzlsSzVX?=
 =?utf-8?B?SUNSOVVTV0JDV1lrL0NjUVhFUWdGQVc4Y0FjcE9RdllDYlM5bExPY0NsWVlM?=
 =?utf-8?B?eUVaS05CVWdPeU9zTnFLZkVtZE9HQ0J1STBVbzNNcHlBZFdjNzNObVFuRkVE?=
 =?utf-8?B?cDEyMUlvallQZFNiY3NQT0NtNEQxOXpiTTBXbGoxNm83VGtTeHlFOHljQkpV?=
 =?utf-8?B?aXNRZDJPRmhkaDB0dnNUVHZWM0VuV250c0hXM2g4eHhKT0VoV2VIaC95Q1Vj?=
 =?utf-8?B?ZENwSk5zeU5zRGVYZ2xuR0d1aHB2VlVtY3pnWlA4ZENIbDRMYXdTNHF6dTVY?=
 =?utf-8?B?YlZicDVqSWNldGlHU2k0L2ZlUjJkM2QvNEFpc0IzNm9UNlcwbG83WTN4WjJM?=
 =?utf-8?Q?ajSmZ5q0IYxovMIA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0E1EA9B01205F40AB40F742F79857AC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885ded57-81c9-4643-37f8-08de544caea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 15:42:25.7598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9b1C4+YkeT3+gBr9xYf2R5EKJiAbCFaX4mTSER1DUXeR5DhT7lvjzSn029RwwnpjTU1lMUHP7tNqVUoa3V6pB1jF/9Uf6liX7Ka1kViRpBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8094

DQoNCk9uIDE1LzAxLzIwMjYgMTc6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNS4wMS4y
MDI2IDE2OjM0LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IE9uIDE1LzAxLzIwMjYgMTM6
NTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE1LjAxLjIwMjYgMTA6MjYsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+PiBPbiAxNC4wMS4yMDI2IDE5OjI5LCBPbGVrc2lpIE1vaXNpZWlldiB3
cm90ZToNCj4+Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4+ICsrKyBiL3hlbi9saWIvYXJtL21lbWNw
eV9mcm9taW8uYw0KPj4+Pj4gQEAgLTAsMCArMSw0OCBAQA0KPj4+Pj4gKy8qIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4+Pj4+ICsjaW5jbHVkZSA8YXNtL2lvLmg+
DQo+Pj4+PiArI2luY2x1ZGUgPHhlbi9saWIvaW8uaD4NCj4+Pj4+ICsNCj4+Pj4+ICsvKg0KPj4+
Pj4gKyAqIFVzZSAzMi1iaXQgcmF3IElPIG9wZXJhdGlvbnMgZm9yIHBvcnRhYmlsaXR5IGFjcm9z
cyBBUk0zMi9BUk02NCB3aGVyZQ0KPj4+Pj4gKyAqIDY0LWJpdCBhY2Nlc3NvcnMgbWF5IG5vdCBi
ZSBhdG9taWMgYW5kIHNvbWUgZGV2aWNlcyBvbmx5IHN1cHBvcnQgMzItYml0DQo+Pj4+PiArICog
YWxpZ25lZCBhY2Nlc3Nlcy4NCj4+Pj4+ICsgKi8NCj4+Pj4+ICsNCj4+Pj4+ICt2b2lkIG1lbWNw
eV9mcm9taW8odm9pZCAqdG8sIGNvbnN0IHZvbGF0aWxlIHZvaWQgX19pb21lbSAqZnJvbSwNCj4+
Pj4+ICsJCSAgIHNpemVfdCBjb3VudCkNCj4+Pj4+ICt7DQo+Pj4+PiArCXdoaWxlICggY291bnQg
JiYgKCFJU19BTElHTkVEKCh1bnNpZ25lZCBsb25nKWZyb20sIDQpIHx8DQo+Pj4+PiArCQkJICAh
SVNfQUxJR05FRCgodW5zaWduZWQgbG9uZyl0bywgNCkpICkNCj4+Pj4gTml0OiBYZW4gc3R5bGUg
aW5kZW50YXRpb24gKG5vIGhhcmQgdGFicykgcGxlYXNlIHRocm91Z2hvdXQuDQo+Pj4+DQo+Pj4+
PiArCXsNCj4+Pj4+ICsJCSoodWludDhfdCAqKXRvID0gX19yYXdfcmVhZGIoZnJvbSk7DQo+Pj4+
PiArCQlmcm9tKys7DQo+Pj4+PiArCQl0bysrOw0KPj4+Pj4gKwkJY291bnQtLTsNCj4+Pj4+ICsJ
fQ0KPj4+Pj4gKw0KPj4+Pj4gKwl3aGlsZSAoIGNvdW50ID49IDQgKQ0KPj4+Pj4gKwl7DQo+Pj4+
PiArCQkqKHVpbnQzMl90ICopdG8gPSBfX3Jhd19yZWFkbChmcm9tKTsNCj4+Pj4+ICsJCWZyb20g
Kz0gNDsNCj4+Pj4+ICsJCXRvICs9IDQ7DQo+Pj4+PiArCQljb3VudCAtPSA0Ow0KPj4+Pj4gKwl9
DQo+Pj4+PiArDQo+Pj4+PiArCXdoaWxlICggY291bnQgKQ0KPj4+Pj4gKwl7DQo+Pj4+PiArCQkq
KHVpbnQ4X3QgKil0byA9IF9fcmF3X3JlYWRiKGZyb20pOw0KPj4+Pj4gKwkJZnJvbSsrOw0KPj4+
Pj4gKwkJdG8rKzsNCj4+Pj4+ICsJCWNvdW50LS07DQo+Pj4+PiArCX0NCj4+Pj4+ICt9DQo+Pj4+
IEJhcnJpZXIgcmVxdWlyZW1lbnRzIG9uIEFybSBhcmVuJ3QgcXVpdGUgY2xlYXIgdG8gbWUgaGVy
ZTogSXMgaXQgcmVhbGx5IGNvcnJlY3QNCj4+Pj4gdG8gdXNlIF9fcmF3X3JlYWR7Yix3LGx9KCkg
aGVyZSwgcmF0aGVyIHRoYW4gcmVhZHtiLHcsbH0oKT8gSWYgaXQgd2FzLCB3b3VsZG4ndA0KPj4+
PiBhIGJhcnJpZXIgdGhlbiBiZSBuZWVkZWQgYXQgdGhlIGVuZCBvZiB0aGUgZnVuY3Rpb24/DQo+
Pj4gVGhpbmtpbmcgYWJvdXQgaXQsIGFzIHRoZSBvcmRlciBvZiBNTUlPIGFjY2Vzc2VzIG5lZWRz
IHRvIGJlIGd1YXJhbnRlZWQNCj4+PiAodW5sZXNzIHlvdSBoYXZlIGV4dHJhIGluZm9ybWF0aW9u
IGFib3V0IHRoZSBhcmVhJ3MgcHJvcGVydGllcywgbGlrZSBpdA0KPj4+IGJlaW5nIGEgdmlkZW8g
ZnJhbWUgYnVmZmVyKSwgSSdtIHByZXR0eSBzdXJlIG5vdyB0aGF0IHJlYWR7Yix3LGx9KCkgbmVl
ZHMNCj4+PiB1c2luZyBoZXJlLiBJbiBmYWN0IHRoZSBjb21tZW50IGluIHRoZSBoZWFkZXIgc2F5
cyB0aGF0IGl0IHdvdWxkIGhhbmRsZQ0KPj4+ICJNZW1vcnkgb3JkZXJpbmcgYW5kIGJhcnJpZXJz
IiB3aGVuIGl0IGRvZXNuJ3QgbG9vayBhcyBpZiBpdCBkaWQuDQo+Pj4NCj4+PiBOb3RlIGhvdyBM
aW51eCBsb29rcyB0byBoYXZlIGdyb3duIG11bHRpcGxlIGZsYXZvcnM6IEJlc2lkZXMNCj4+PiBt
ZW1jcHlfZnJvbWlvKCkgSSBjYW4gYWxzbyBzcG90IGF0IGxlYXN0IGZiX21lbWNweV9mcm9taW8o
KSBhbmQNCj4+PiBzZGlvX21lbWNweV9mcm9taW8oKS4NCj4+Pg0KPj4+PiBBbmQgdGhlbiwgaWYg
aXQgd2FzIHJlYWR7Yix3LGx9KCkgdGhhdCBpcyB0byBiZSB1c2VkIGhlcmUsIHdoYXQgYWJvdXQg
YWxsIG9mDQo+Pj4+IHRoaXMgd291bGQgdGhlbiBzdGlsbCBiZSBBcm0tc3BlY2lmaWM/IEhtbSwg
SSBndWVzcyB0aGUgSVNfQUxJR05FRCgpIG9uICJ0byIgaXMsDQo+Pj4+IGJ1dCB0aGF0J3MgQXJt
MzItc3BlY2lmaWMsIHdpdGggQXJtNjQgbm90IG5lZWRpbmcgaXQ/IFBsdXMgdGhlbiBpdCdzIGFn
YWluIG5vdA0KPj4+PiBleGFjdGx5IEFybS1zcGVjaWZpYywgYnV0IHNwZWNpZmljIHRvIGFsbCBh
cmNoaXRlY3R1cmVzIHdoZXJlIG1pc2FsaWduZWQNCj4+Pj4gYWNjZXNzZXMgbWF5IGZhdWx0Lg0K
Pj4+IFRoZXJlJ3MgYSBiaWdnZXIgaXNzdWUgaGVyZSwgd2l0aCBhY2Nlc3MgZ3JhbnVsYXJpdHkg
KGRlc3BpdGUgdGhlIGhlYWRlcg0KPj4+IGNsYWltaW5nICJJbXBsZW1lbnQgYWxpZ25tZW50IGhh
bmRsaW5nIGZvciBkZXZpY2VzIHJlcXVpcmluZyBzcGVjaWZpYw0KPj4+IGFjY2VzcyBzaXplcyIp
LiBNTUlPIGNhbiBiZWhhdmUgaW4gaW50ZXJlc3Rpbmcgd2F5cy4gVGhlIGhlYWRlciBjb21tZW50
DQo+Pj4gc2F5cyBub3RoaW5nIGFzIHRvIHJlc3RyaWN0aW9ucywgaS5lLiB3aGVuIHRoZXNlIGZ1
bmN0aW9ucyBtYXkgbm90IGJlDQo+Pj4gdXNlZC4gWWV0IGNvbnNpZGVyIGEgZGV2aWNlIHJlZ2lz
dGVycyBvZiB3aGljaCBtdXN0IGJlIGFjY2Vzc2VkIGluIDMyLWJpdA0KPj4+IGNodW5rcy4gQXMg
bG9uZyBhcyB0aGUgb3RoZXIgcG9pbnRlciBpcyBzdWl0YWJseSBhbGlnbmVkLCBhbGwgd291bGQg
YmUNCj4+PiBmaW5lLiBCdXQgeW91IGhhbmRsZSB0aGUgY2FzZSB3aGVyZSBpdCBpc24ndCwgYW5k
IGhlbmNlIHRoYXQgY2FzZSB0aGVuDQo+Pj4gYWxzbyBuZWVkcyB0byBmdW5jdGlvbiBjb3JyZWN0
bHkuIEF0IHRoZSBzYW1lIHRpbWUgYWNjZXNzZXMgdG8gYSBkZXZpY2VzDQo+Pj4gcmVxdWlyaW5n
IDE2LSBvciA2NGJpdCBncmFudWxhcml0eSB3b3VsZG4ndCB3b3JrIGF0IGFsbCwgd2hpY2ggZm9y
DQo+Pj4gcmVxdWlyZWQgOC1iaXQgZ3JhbnVsYXJpdHkgaXQgd291bGQgYWdhaW4gb25seSB3b3Jr
IHBhcnRseS4NCj4+Pg0KPj4+IEhvdyBtdWNoIG9mIHRoZSBhYm92ZSByZXF1aXJlcyBjb2RlIGFk
anVzdG1lbnRzIGFuZCBob3cgbXVjaCBzaG91bGQgYmUNCj4+PiBkZWFsdCB3aXRoIGJ5IHVwZGF0
aW5nIGNvbW1lbnRhcnkgSSBkb24ndCBrbm93LCBhcyBJIGtub3cgbm90aGluZyBhYm91dA0KPj4+
IHlvdXIgcGFydGljdWxhciB1c2UgY2FzZSwgbm9yIGFib3V0IHBvc3NpYmxlIGZ1dHVyZSBvbmVz
Lg0KPj4+DQo+Pj4gQWxzbyBub3RlIHRoYXQgdGhlIGhlYWRlciBjb21tZW50IHN0aWxsIHJlZmVy
ZW5jZXMgdGhlIC4uLl9yZWxheGVkKCkNCj4+PiBmdW5jdGlvbnMsIHdoZW4gdGhlbiBpbXBsZW1l
bnRhdGlvbiBkb2Vzbid0IHVzZSB0aG9zZSBhbnltb3JlLg0KPj4+DQo+Pj4gSmFuDQo+PiBIaSBK
YW4sDQo+Pg0KPj4gVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciB2YWx1YWJsZSBpbnB1dCBh
bmQgaW52b2x2ZW1lbnQuDQo+Pg0KPj4gQWZ0ZXIgZnVydGhlciByZXNlYXJjaCBhbmQgcmVjb25z
aWRlcmluZyBhbGwgdGhlIHBvaW50cyB5b3UgcmFpc2VkLCBJDQo+PiBoYXZlIGRlY2lkZWQNCj4+
IHRvIHN3aXRjaCB0byB1c2luZyB0aGUgb3JkZXJlZCBNTUlPIGFjY2Vzc29ycyAocmVhZGIvcmVh
ZGwgYW5kDQo+PiB3cml0ZWIvd3JpdGVsKS4NCj4+DQo+PiBIZXJlIGlzIG15IHJlYXNvbmluZzoN
Cj4+DQo+PiBUaGUgY29uY2VybiB5b3UgbWVudGlvbmVkIHdhcyB2YWxpZDogdGhlIHVzZSBvZiBf
X3Jhd19yZWFkKi9fX3Jhd193cml0ZSoNCj4+IGluIHRoZQ0KPj4gaGVscGVycyBkaWQgbm90IHBy
b3ZpZGUgdGhlIG9yZGVyaW5nIGd1YXJhbnRlZXMgZXhwZWN0ZWQgZm9yIE1NSU8NCj4+IGNvcGll
cywgYW5kIHRoZQ0KPj4gaGVhZGVyIHN0aWxsIHJlZmVyZW5jZWQgKl9yZWxheGVkLCBldmVuIHRo
b3VnaCB0aGUgaW1wbGVtZW50YXRpb24gbm8NCj4+IGxvbmdlciB1c2VkDQo+PiB0aGVtLiBUaGlz
IGNvdWxkIGFsbG93IHJlb3JkZXJpbmcgYXJvdW5kIHRoZSBjb3B5IGFuZCBtaXNyZXByZXNlbnQg
dGhlDQo+PiBpbnRlbmRlZA0KPj4gc2VtYW50aWNzLg0KPj4NCj4+IEEgZmV3IGFkZGl0aW9uYWwg
dGhvdWdodHMgcmVnYXJkaW5nIHlvdXIgb3RoZXIgcXVlc3Rpb25zOg0KPj4NCj4+IElzIGl0IHN0
aWxsIEFybS1zcGVjaWZpYz8NCj4+IEZ1bmN0aW9uYWxseSwgdGhlIGxvZ2ljIGNvdWxkIHdvcmsg
b24gYW55IGFyY2hpdGVjdHVyZSB0aGF0IHN1cHBvcnRzDQo+PiA4LzMyLWJpdCBNTUlPDQo+PiBh
Y2Nlc3NlcyBhbmQgdXNlcyB0aGUgc2FtZSBhY2Nlc3NvciBzZW1hbnRpY3MuIEhvd2V2ZXIsIHRo
aXMgaW1wbGVtZW50YXRpb24NCj4+IHJlbGllcyBvbiBBcm3igJlzIHJlYWQqL3dyaXRlKiBvcmRl
cmluZyBndWFyYW50ZWVzLCBhcyB3ZWxsIGFzIHRoZQ0KPj4gQXJtLXNwZWNpZmljDQo+PiBJU19B
TElHTkVEIGNoZWNrIHRvIGF2b2lkIG1pc2FsaWduZWQgZmF1bHRzLiBUaGVyZWZvcmUsIGl0IHJl
bWFpbnMNCj4+IEFybS1zcGVjaWZpYw0KPj4gYXMgd3JpdHRlbjsgb3RoZXIgYXJjaGl0ZWN0dXJl
cyB3b3VsZCBuZWVkIHRoZWlyIG93biBpbXBsZW1lbnRhdGlvbnMgaWYgdGhleQ0KPj4gaGF2ZSBk
aWZmZXJlbnQgYWxpZ25tZW50IG9yIGdyYW51bGFyaXR5IHJlcXVpcmVtZW50cy4NCj4+DQo+PiBP
cmRlcmVkIGFjY2Vzc29ycyB2cy4gcmF3IGFjY2Vzc29ycyArIHRyYWlsaW5nIGJhcnJpZXI6DQo+
PiBJIGNob3NlIHRvIHVzZSBvcmRlcmVkIGFjY2Vzc29ycyBpbnN0ZWFkIG9mIHJhdyBhY2Nlc3Nv
cnMgd2l0aCBhDQo+PiB0cmFpbGluZyBiYXJyaWVyDQo+PiBiZWNhdXNlIHJlYWRiL3JlYWRsIGFu
ZCB3cml0ZWIvd3JpdGVsIGFscmVhZHkgcHJvdmlkZSB0aGUgcmVxdWlyZWQNCj4+IGRldmljZSBv
cmRlcmluZw0KPj4gYW5kIGJhcnJpZXIgc2VtYW50aWNzLCBtYWtpbmcgYW4gYWRkaXRpb25hbCBi
YXJyaWVyIHVubmVjZXNzYXJ5IGFuZA0KPj4gc29sdmluZyBwb3RlbnRpYWwNCj4+IG9yZGVyaW5n
IGlzc3Vlcy4NCj4+DQo+PiBVc2UgZm9yIHJlZ2lzdGVyIGFjY2VzczoNCj4+IFRoZXNlIGhlbHBl
cnMgYXJlIHN1aXRhYmxlIGZvciBNTUlPIGJ1ZmZlcnMsIHNoYXJlZCBtZW1vcnksIGFuZA0KPj4g
cmVnaXN0ZXJzIHRoYXQNCj4+IHRvbGVyYXRlIDgtLzMyLWJpdCBhY2Nlc3Nlcy4gVGhleSBhcmUg
bm90IGFwcHJvcHJpYXRlIGZvciByZWdpc3RlcnMgdGhhdA0KPj4gcmVxdWlyZSAxNi0gb3IgNjQt
Yml0IGFjY2Vzc2VzLCBvciB3aGVyZSBzaWRlIGVmZmVjdHMgZGVwZW5kIG9uIHRoZSBleGFjdA0K
Pj4gYWNjZXNzIHdpZHRoLiBJJ2xsIHVwZGF0ZSB0aGUgaGVhZGVyIHRvIGRvY3VtZW50IHRoaXMg
bGltaXRhdGlvbjsNCj4+IGRyaXZlcnMgbmVlZGluZyBzdHJpY3QNCj4+IHJlZ2lzdGVyIHNlbWFu
dGljcyBzaG91bGQgY29udGludWUgdG8gdXNlIHJlYWRsL3dyaXRlbA0KPj4gKG9yIHJlYWR3L3dy
aXRldy9yZWFkcS93cml0ZXEpIGRpcmVjdGx5LCByYXRoZXIgdGhhbiBtZW1jcHlfKmlvKCkuDQo+
Pg0KPj4gU3VtbWFyeToNCj4+DQo+PiBJIGhhdmUgbWFkZSB0aGUgZm9sbG93aW5nIGNoYW5nZXMg
dG8gdGhlIGhlbHBlciBmdW5jdGlvbnM6DQo+Pg0KPj4gLSBzd2l0Y2hlZCB0byBvcmRlcmVkIGFj
Y2Vzc29ycyB0byBhZGRyZXNzIHRoZSBvcmRlcmluZyBhbmQgYmFycmllcg0KPj4gY29uY2VybnMu
DQo+PiAtIHVwZGF0ZWQgdGhlIGRvY3VtZW50YXRpb24gdG8gbWF0Y2ggdGhlIGltcGxlbWVudGF0
aW9uIGFuZCBleHBsaWNpdGx5IHN0YXRlDQo+PiB0aGUgc3VwcG9ydGVkIGFjY2VzcyBzaXplcyBh
bmQgZ3JhbnVsYXJpdHkuDQo+Pg0KPj4gSWYgdGhpcyBhcHByb2FjaCBzb3VuZHMgZ29vZCB0byB5
b3UsIEkgd2lsbCBwcm9jZWVkIHdpdGggdGhlIGZpeCBhbmQNCj4+IHN1Ym1pdCBhIG5ldyB2ZXJz
aW9uLg0KPiBBdCB0aGUgZmlyc3QgZ2xhbmNlIGl0IGxvb2tzIG9rYXksIGJ1dCBwbGVhc2UgYWxs
b3cgQXJtIGZvbGtzIHRvIGdpdmUgdGhlaXINCj4gb3Bpbmlvbi4gQW5kIG9mIGNvdXJzZSBteSBm
aW5hbCB0YWtlIHdpbGwgYmUgYXZhaWxhYmxlIG9ubHkgb25jZSBJIHNlZSB0aGUNCj4gbmV4dCB2
ZXJzaW9uLg0KPg0KPiBKYW4NClN1cmUuIEkgd2lsbCBwb3N0IHRoZSBuZXcgdmVyc2lvbiBvbmNl
IEkgc29ydCBvdXQgYWxsIGRvY3VtZW50YXRpb24gDQpxdWVzdGlvbi4NClRoYW5rIHlvdSBhZ2Fp
biBmb3IgZGVlcCByZXZpZXchDQoNCk9sZWtzaWku

