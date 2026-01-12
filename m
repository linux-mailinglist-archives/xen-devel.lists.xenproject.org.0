Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF84D13D3A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200630.1516507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKFQ-0006ca-1a; Mon, 12 Jan 2026 15:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200630.1516507; Mon, 12 Jan 2026 15:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfKFP-0006a4-TV; Mon, 12 Jan 2026 15:54:27 +0000
Received: by outflank-mailman (input) for mailman id 1200630;
 Mon, 12 Jan 2026 15:54:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Amy=7R=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1vfKFN-0006IZ-Ju
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:54:25 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f06d8582-efce-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 16:54:12 +0100 (CET)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by PAWPR03MB10072.eurprd03.prod.outlook.com (2603:10a6:102:360::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Mon, 12 Jan
 2026 15:54:09 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 15:54:08 +0000
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
X-Inumbo-ID: f06d8582-efce-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJdeRu7uBldq23dVPVVkKtCXCEkJ+lSloucfQnx+lZAZf70FhLelg4PkUSB68IlUtG6iY+1LytdLzORHNU6zkCK/KeFt/vasqt2sY4r/peuBKOQzZY7ccO2arzAq5cZGn2xeMojzDcNHevkdbhGQCD5AQetuLk/QWMTKT9+w9czK/qxhcWttxbTw+gJW/Z25awbv8YygC9tV74Rg2DfrHIk+/oN3+SazDMl6wrFi8+l+Gf/sNuHepob3e3q5TjqYGqOUUuB9QfPYkOP4Wnkb0kvbt8JQrCG1VP5aZtQeH+Xp8E+iAKNl+wp5TNBSxtyQOodZuu6/Bb7SllqjbceGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ql83DLzwt2KYkFDfneGGmEtBaBuXc+nDX+/yAANOHI=;
 b=vOEM3Z4LxgdVVAQYosCINrt/0otIDp9fhmuqKQjKpwN74NDmmGzDrl7BRjiuNSA5OSlHIt8YTsz+0anajCFZk+2+hhcJVBccGsgUTuo9Uf6CbFzTFxrn56EzcElaPWfeY+/pOFhggF14t9d+sDHgLJfouMIuifHHKhrynhZEuj3dHr94VABJ1xmSqZ8UVq55b5swjJ5e1OW/0+za3d0ju9T0ssL/zoEqwKidGXuN5XzVnZmCcvVJq9j2w64nU9dMTWXLpc60DycK86dHp9Kw0EWNdiXBLUNFu6lEnVjLg8L7DMxg2/pKcCmcYCm+XWuQDlVcYr4TAAIDa/KAO7ehxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ql83DLzwt2KYkFDfneGGmEtBaBuXc+nDX+/yAANOHI=;
 b=V6g2vEtAXfhLt+IZyliV3NXXbudFhjac2WHKrhEIY06YryUCAjXOxy5wViQL2HrDZaBjUAfKnLTQy/0y7ZguLHeZhUGXE1tJhQBsEbDq+5pFaB45w4jVUN+35xALSwvKFR9bp8iC1jO1+Rrh8APCy0snjiBHkzOaS5MvLEiN+SsQcyRILFAOzLgNmFXAq99NW1DkeG/KVNCLHLu/iBwt7ZJESDl8E77+LBqL9wpE8/dxkXlzeKoFXON6i7KDQkfI6/Yzfz7ZD6PtyHj1nJhxXEdWx6putxmOsWuMGkXhqMAIyRoW+BZ847syo0U7sAjOIof7moxj1hoVvT0DfhGsYQ==
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
Subject: Re: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Topic: [PATCH v6 1/5] xen/domctl: extend XEN_DOMCTL_assign_device to
 handle not only iommu
Thread-Index: AQHcSyafS16SOr0Uk0OkeRdy8jd8CrVPHVoAgAADtoA=
Date: Mon, 12 Jan 2026 15:54:08 +0000
Message-ID: <99586f5c-d76b-4cbe-9fbd-c87e86bb236a@epam.com>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com>
 <b0a72660d58608c80e7408eb8df32ec369d4e45b.1761998077.git.oleksii_moisieiev@epam.com>
 <9598b2e2-7df8-40c5-82cb-c097121af763@suse.com>
 <5d8f55a6-7182-4e9d-a139-96fddb9450f8@epam.com>
 <98f5e8f0-070c-4be5-9baf-46278de8093d@suse.com>
In-Reply-To: <98f5e8f0-070c-4be5-9baf-46278de8093d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|PAWPR03MB10072:EE_
x-ms-office365-filtering-correlation-id: 430ff6ab-e178-40de-3315-08de51f2d253
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YnlIZHhMdzFhRkUrVDRtdVVzUUtUcEdCMUVKZGlyZVJZeDhXdnlPWmd4NHRu?=
 =?utf-8?B?aXNJSU1FYXJwRFQ3OEtoYmFpU1RXTEZqZXpCT3lpV2ZhWjZ2aHVLL1BoUHhZ?=
 =?utf-8?B?MHRxWWszVjN3YkZVSXpXT2FoZEZXR000UWZPd2ptUXRKUG5jQmh3UlJSTURW?=
 =?utf-8?B?RlJYcTFBalp6anBTVWJRWmp3Y3VZTlBpZEE3djFsRkE3NFRxdEYrWG11Z0RZ?=
 =?utf-8?B?TU1YNWpKTHVqQ1dsT0MwMUh3MVg0aDFVekZ6VE14KzA0bFRKdVpaMy9GQ1pG?=
 =?utf-8?B?RVpjbUZBTzR1S0dSRlFiM0paYXR6K0sxVGRkM1BjNGZNd1BkOWRoTGlTNHJr?=
 =?utf-8?B?ODA0djk2bUpZemd2eUxPOElybGZhcGZUcW5YUGVRaHpNZVByeE8vT1BudFlu?=
 =?utf-8?B?cFFTdS9mN2hVWGRuZVI1ekk0M0tqa3pleVI5TENuWGlzcUR0RXcyZEM2NDhL?=
 =?utf-8?B?VWRNUHFVZDlmeUN2S3RSSjZSelR0R2Z2ZDhwd1hHOGMyMldFQS8yeUlGZzlM?=
 =?utf-8?B?V2k5QSs1cWdQcnVpVHRPRU1CU2dwRjdvbzZGcHhJWkFEN2dHazlHb2pKL2xz?=
 =?utf-8?B?dTlnNWhrOEhkeUY2ajlkREZ0cFdRVGxoTzVXOFd4VFI0OElqbHBBbWlCcVhG?=
 =?utf-8?B?dkozaFJtaWc1cDY5VEJ0RTh4KzE2WTFiOEx6Ykt0N2FMeTlRMmJPRTRKWGFN?=
 =?utf-8?B?WWp6RDhHdHowTS92MlJzME1kalN3bWRpTHoxUDVUUGFkTDlka3d3K2Q0Skxp?=
 =?utf-8?B?QTl6N29WQkV0OFlCRXp3Q1l6SVhGc0ZTb0pSMlVsQlhyVlFVWjZ3dllJVHNZ?=
 =?utf-8?B?eWRMYjhwWnZGSnMzM2tPSVBENmxXQWVpY09EdUw5L2pNeXdURjRqV3YwTXBE?=
 =?utf-8?B?RzJPa1Zld0VXNVVNbGFFWXFsUmUxL05PbEZ0UUxFN285VUIzWGUrNTdROStM?=
 =?utf-8?B?K3h4UVZkL3kxV1I1ZjNwMGs2RWdCVFNwalMwSllhejJiS0Roc2VQdVRWVGFE?=
 =?utf-8?B?akVselNkdktPRys0M1dWM2trYVVGeDhMQTJ1T1AyUytpaGFlQWkxUVBNT3o2?=
 =?utf-8?B?RE5ER2ZyS09udmFoR0c1L083ODYvLzUyWGpPbGdXa1RaeVl4RU5TLzhkUUJ5?=
 =?utf-8?B?YVZIS1k3dkdMNFhSempwVkhJcjdHVDhMenp1TkxjS1Z2TW1zVVhJZUdlY2ND?=
 =?utf-8?B?MlIwbzFlU1dPTCtZcTVZWGJDalRWV25qQlE1WWFUZ3hzNmxPVjI5SWVVdS93?=
 =?utf-8?B?VU9LMGVSL0NKRmhRNE9xS042R0V1N2x5bXRtZjQ4U2RjQ1N6MUtiQ0VmS1pX?=
 =?utf-8?B?ZlBuSTJJeUp3VnRxWDZlZGtjcWpxTVB3SWpCRDgrcGVleERsemxHY2JtbnNm?=
 =?utf-8?B?VVNaS2c1Kzd5WTVuamp6N2Z2UHZGajhsUERrcEg4cEpjT0lyaWt6VkR6VGdK?=
 =?utf-8?B?YkkzV0dtZnhIa2hhekpyRlJHbnVEZWpXak5mZVNPNjczcjJ3cmd5MEV1aGgw?=
 =?utf-8?B?Y0Q2cm5EZkNYc1VWNXBPUVh2RlMwN1FYU092ajVteUVNeTlNd0M0OFkwbjJK?=
 =?utf-8?B?WUFrRmhib1NiUVg2NHAreUQxMWtXSUpVWjJLbG11M3BoL2tiZ3dEQ2g1V3o2?=
 =?utf-8?B?RWJzOWhUZzV0Q0R5T3pNTGdURWxndG5ubUg3TjI0TVNqMkpwTWk2NUtCSWZY?=
 =?utf-8?B?OHdLY2hTcC9ZR2FmLzhFV29oWHowL3VXaExsNVhTOEhCQXovUkx1cXJwVVFW?=
 =?utf-8?B?UXV6amtHRVRsS0VQZzBIR1pYZytpMTh2YUI5cjFzWHdCZHJsZFh4OUx6VUp4?=
 =?utf-8?B?OVlTdjVyQVluZVgza3BtOXYzS1YzS2todUplM2RmUlBxM0pISEQvMERnT1lo?=
 =?utf-8?B?RVh1WUczUjdwN3hTZUIwZ1U2bW5pVHJoRWVaSUJiOFd4eXNiYTNXVUtZUnpX?=
 =?utf-8?B?eEVZbHpiWnN3bFQzTVVEckdFd0Y1YXlUeEVKaWJvQmx5eGwwbE5vU3J2c21Z?=
 =?utf-8?B?L3JoRmIwZG0wMmI2L2NmWjNHSGV2SGRYMVhVQkdlT1poc1ZtYnZIUkNiRGdM?=
 =?utf-8?Q?DQi1vQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MkdlYXJrUjFNdzhKNmRaVC9OOVVpWXBnd3dXdDFhQldudFNsRkFvK1lFYnVx?=
 =?utf-8?B?V1cwZG5vOTJmbVM3NXhCMll4RmZsNFIxZ3h6Nk9qNlF3dis0NG1KM0pCS1RK?=
 =?utf-8?B?NGZQUHcxVVlzM2diTUl1eWVqaFRJZU9YM1dWeUVCcjVEeG02bjJHaFZpdWps?=
 =?utf-8?B?UWVnNEdCOThYazhLY0h2elBEdGZVL29icnVOZWVCU29kNXlGZ2xGWW1ZR3ZW?=
 =?utf-8?B?QzlDcS9HQkY5Y0xrUTQ3Ym1NajJheUxkM0N2ZUpwMHpodzEzUSs1K2c1ZjI5?=
 =?utf-8?B?TEQxMjZ3ZEhGdnFTQUMyUU1hQVRZa1JKcFNTcEJseHgxeURGdDRKdjBBcWFK?=
 =?utf-8?B?MzZ4cjVoeUw4Qno0WG5uTG1xd3Z2Y2I3d3BwRnhjMW12VGNEYUdkTzZEOERq?=
 =?utf-8?B?eFB2eHRVT3NLN1NQZnpRVVlvd1ZLUHRSVFRQYnBnMDZMU0VDRTh5Mm5VUDdG?=
 =?utf-8?B?NnNqOGtzRXYrK1NPQ3RrWHpORDdvT0U2ek5uekIyYWdOUlBCcmM3c1hhc283?=
 =?utf-8?B?Vnd5MWFoTjBSbTZXMXhXcVZKVGNNeU5GRnVzakgrM2xiREtjbFIwUWQySmZY?=
 =?utf-8?B?Rk4rZ2lLZTA3NGE1RTJPQ2YybmxUV21sOVltVSs4UmJrOEZyOUIzUzRvRTl5?=
 =?utf-8?B?UHI1SHZMK2Z6Qkt1ZGtSK3pOaFNJL0kxK05UT2lOOGJ0SElOclFWTUxGRXdq?=
 =?utf-8?B?MGh6MnQxRzNtRkJtUWpyK1c4LzlHbTdUUGtrWTlOUzVzNnBzOUNWZXFrSjNZ?=
 =?utf-8?B?ODRqckVZaFVrTlBaWVBpMmxWM2JOcHJMc0VmZHFTT0hNeFExK0E0QW03Z1hn?=
 =?utf-8?B?ek9YcDFnK0RJTXNFQ3VTUWFEUDdHekRPVGZlaGdGT3JWdGZYcjltbzJSYjJB?=
 =?utf-8?B?b1pBRVlha0RnNDdPTzFvbk5hYWxGVGJDYlZkUUlUazQ1dytTQWFnQzFlWWhT?=
 =?utf-8?B?Szd3MUR3MTV3bUorcEN3dGNyalZOMCtzdGdiVHRPeE9acFpLcjVITy9QWkta?=
 =?utf-8?B?SFZDL0htYU9rK1I2dVovRlpGUG90VktvNXBwblIwbEduTTJoSnYwMUovcTNZ?=
 =?utf-8?B?YVhleDRGdmpDN3g0L3NIQkgvUDZ6b2g1T3gvSlIySm9yYUZoU1dlaFhmZnhN?=
 =?utf-8?B?dGh5dUFCelRkSzhyZzZIWi9adzZoMGVtYW84Y2dKdGpUTGRkNUVxWE5WOS9Z?=
 =?utf-8?B?ZjUyVUN2SzRlbFZNUlZ3QjhHRUhPM1dSTE9nVGpKVnZKbkcybUY3UHl0c1la?=
 =?utf-8?B?YXhSbWdSemR1eTJ4bUQrZmVZTnJPekp1SGF6S25pRHRxdFZhQ21jQnA1ZTla?=
 =?utf-8?B?Z3Y0a0drVHE1eHV6RDljSm8xTXpkL0I4cGtydVVsYlVvSExpbnNGY3Bvd3lr?=
 =?utf-8?B?SWhXQ3lZc0NIaFNqYmlOakUzd0JoUm5BWmQwaXRRVmtnMFVwOTRxazZMQkl5?=
 =?utf-8?B?OXdvVHh1UmVFL0dMK08xNTdSMUtRZ0Y2SHM2SXRRNU0rZGVERHNnak5kWUsw?=
 =?utf-8?B?aVkxRDI4WktGQmhGWjdPRVFMMG03anMyNVo0NCtscnNSTENOQmxqL05yWmwx?=
 =?utf-8?B?dFNxKzFxcFB6VGh0cG82OXEzMkNLY3VVVklpeFRKYTE3NVdPcUwyMVk0eEw0?=
 =?utf-8?B?c1hxLzNpUVRIUXU5d0NtQjRWYTZsczdxbVBqOG9ESjV2RFJmTzd6TVJPaEs0?=
 =?utf-8?B?RHJHMmJoVVYzdXJkZlZDeTV5Q3RYTUxHUXJDVG9DaUMzcTNvdVFteUI3UVlm?=
 =?utf-8?B?dHlVaE8wTWVscTdkMjNKc0d5WnExNHVNSlpUQUxuV1lkUG00YWlPSkEvTUd3?=
 =?utf-8?B?c0poRGFnMzVkb3dzdEN3RXduRDQ3U0lOMDZTZjNpanFTK0dJTTdVRzl6VHNR?=
 =?utf-8?B?YW9DY29BSDZNay9kZVlGMFVtdHJ4eHNDdWVPWjc1KzE2eWFRdVFlN2Z0dldx?=
 =?utf-8?B?a2c1bkFMMzZuanZ1czJoWHZFbjNBWTJYTmNucmNzRkl5US8wMXpsYmhueUMr?=
 =?utf-8?B?TVlkQytheGtEbDZ3Q3B0NVNLQ3hZN0h2ZDdsVUR2L3lBQ0tVWEE4NkxRcGQ4?=
 =?utf-8?B?a2RwUFRFMDJYb2NpaG1aY21lODgxcnpOdzNnSG56K2Q0MHc4Tm92VmlGdWZq?=
 =?utf-8?B?RFJlVE5hQXpEbFk3Y01iWU1OeWw2MVZ4VWNZSlVteUhvdFVRM3FnMlZkbDNu?=
 =?utf-8?B?S01EZ2ZtTlVlMzVxZTFxT1grenFDeXBzdGpzcGNpSkNHaVZ2YTMrOGJoblJq?=
 =?utf-8?B?MkVmY2dBb3dQODNlZHhXZjMrNTVDc2dLWXprODNjdHVQbkUzL0tKOC9KR1hD?=
 =?utf-8?B?ZWlOQ3g4SktydDhueG83L3dOL2wwb0RxOGtpU1JwUmFicFpGTUgwZVhFUmpm?=
 =?utf-8?Q?rv40Lo039gjR9xHw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB03FBCE515EB94999F5C1426DB08BD0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 430ff6ab-e178-40de-3315-08de51f2d253
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 15:54:08.5259
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QmsUwlG1XFFFU4gvc4fBYw2rMbC0sS3i/o56udTrsGVggGcSa+eDmGtY6uVz++tUi2gnr6jimY+TPGpZ9S67X5BpJ9Ov4LKmjnY0uEagd2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB10072

DQoNCk9uIDEyLzAxLzIwMjYgMTc6NDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMi4wMS4y
MDI2IDE2OjE2LCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IE9uIDA2LzExLzIwMjUgMTI6
MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAxLjExLjIwMjUgMTI6NTYsIE9sZWtzaWkg
TW9pc2llaWV2IHdyb3RlOg0KPj4+PiBAQCAtODI3LDcgKzgyOCwzMiBAQCBsb25nIGRvX2RvbWN0
bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpDQo+Pj4+ICAg
ICAgICBjYXNlIFhFTl9ET01DVExfdGVzdF9hc3NpZ25fZGV2aWNlOg0KPj4+PiAgICAgICAgY2Fz
ZSBYRU5fRE9NQ1RMX2RlYXNzaWduX2RldmljZToNCj4+Pj4gICAgICAgIGNhc2UgWEVOX0RPTUNU
TF9nZXRfZGV2aWNlX2dyb3VwOg0KPj4+PiArICAgICAgICBpbnQgcmV0MTsNCj4+Pj4gKw0KPj4+
PiArICAgICAgICAvKg0KPj4+PiArICAgICAgICAgKiBBZGQgY2hhaW5lZCBoYW5kbGluZyBvZiBh
c3NpZ25lZCBEVCBkZXZpY2VzIHRvIHN1cHBvcnQNCj4+Pj4gKyAgICAgICAgICogYWNjZXNzLWNv
bnRyb2xsZXIgZnVuY3Rpb25hbGl0eSB0aHJvdWdoIFNDSSBmcmFtZXdvcmssIHNvDQo+Pj4+ICsg
ICAgICAgICAqIERUIGRldmljZSBhc3NpZ24gcmVxdWVzdCBjYW4gYmUgcGFzc2VkIHRvIEZXIGZv
ciBwcm9jZXNzaW5nIGFuZA0KPj4+PiArICAgICAgICAgKiBlbmFibGluZyBWTSBhY2Nlc3MgdG8g
cmVxdWVzdGVkIGRldmljZS4NCj4+Pj4gKyAgICAgICAgICogVGhlIGFjY2Vzcy1jb250cm9sbGVy
IERUIGRldmljZSBwcm9jZXNzaW5nIGlzIGNoYWluZWQgYmVmb3JlIElPTU1VDQo+Pj4+ICsgICAg
ICAgICAqIHByb2Nlc3NpbmcgcHJlc2VydmluZyByZXR1cm4gY29kZSBhbmQgZXhwZWN0ZWQgdG8g
YmUgZXhlY3V0ZWQgZm9yDQo+Pj4+ICsgICAgICAgICAqIGFueSBEVCBkZXZpY2UgcmVnYXJkbGVz
cyBpZiBEVCBkZXZpY2UgaXMgcHJvdGVjdGVkIGJ5IElPTU1VIG9yDQo+Pj4+ICsgICAgICAgICAq
IG5vdCAob3IgSU9NTVUgaXMgZGlzYWJsZWQpLg0KPj4+PiArICAgICAgICAgKi8NCj4+Pj4gKyAg
ICAgICAgcmV0MSA9IHNjaV9kb19kb21jdGwob3AsIGQsIHVfZG9tY3RsKTsNCj4+PiBXaHkgd291
bGQgdGhpcyBub3QgYmUgdGhlIGluaXRpYWxpemVyIG9mIHRoZSBuZXcgdmFyaWFibGU/IChJIGFs
c28gZG9uJ3QgdGhpbmsNCj4+PiB0aGF0IHdlJ3ZlIGRlY2lkZWQgdG8gcGVybWl0IHZhcmlhYmxl
IGRlY2xhcmF0aW9ucyBhdCBvdGhlciB0aGFuIHRoZSB0b3Agb2YNCj4+PiBzY29wZXMgb3Igd2l0
aGluIGUuZy4gYSBmb3IoKSBsb29wIGNvbnRyb2wgY29uc3RydWN0LikNCj4+Pg0KPj4gKw0KPj4+
PiAgICAgICAgICAgIHJldCA9IGlvbW11X2RvX2RvbWN0bChvcCwgZCwgdV9kb21jdGwpOw0KPj4+
PiArICAgICAgICBpZiAoIHJldCA8IDAgKQ0KPj4+PiArICAgICAgICAgICAgcmV0dXJuIHJldDsN
Cj4+PiBXaHkgd291bGQgeW91IGludm9rZSBib3RoIGluIGFsbCBjYXNlcz8gSWYgc2NpX2RvX2Rv
bWN0bCgpIGhhbmRsZWQgdGhlIHJlcXVlc3QsDQo+Pj4gdGhlcmUgaXNuJ3QgYW55IHBvaW50IGlu
IGFsc28gaW52b2tpbmcgaW9tbXVfZG9fZG9tY3RsKCksIGlzIHRoZXJlPyBPciBlbHNlIGlzDQo+
Pj4gdGhlcmUgbWF5YmUgc29tZSBjcnVjaWFsIGFzcGVjdCBtaXNzaW5nIGZyb20gdGhlIGRlc2Ny
aXB0aW9uIChvciBub3QgZXhwbGljaXQNCj4+PiBlbm91Z2ggdGhlcmUgZm9yIGEgbm9uLVNDSSBw
ZXJzb24gbGlrZSBtZSk/DQo+Pj4NCj4+PiBBbHNvIHRoaXMgZG9lc24ndCBsb29rIHRvIGZpdCB0
aGUgZGVzY3JpcHRpb24gc2F5aW5nICJUaGUgU0NJIGFjY2Vzcy1jb250cm9sbGVyDQo+Pj4gRFQg
ZGV2aWNlIHByb2Nlc3NpbmcgaXMgY2hhaW5lZCBhZnRlciBJT01NVSBwcm9jZXNzaW5nIC4uLiIN
Cj4+Pg0KPj4gV2UgY2FsbCBib3RoIGJlY2F1c2UgU0NJIGFuZCBJT01NVSBjb3ZlciBkaWZmZXJl
bnQgY29uY2VybnMgYW5kIGEgRFQNCj4+IGRldmljZSBtYXkgbmVlZA0KPj4gYm90aDogU0NJIGZv
ciBGVy1tZWRpYXRlZCBhY2Nlc3MgY29udHJvbCAocG93ZXIvY2xvY2tzL3Jlc2V0KSBhbmQgSU9N
TVUNCj4+IGZvciBETUEgaXNvbGF0aW9uLg0KPj4gU0NJIHJldHVybmluZyBzdWNjZXNzIGRvZXMg
bm90IG1lYW4gdGhlIElPTU1VIHdvcmsgaXMgcmVkdW5kYW50Lg0KPiBDYW4gdGhlIGNvbW1lbnQg
dGhlbiBwbGVhc2UgYmUgdXBkYXRlZCB0byBwcm9wZXJseSBjYWxsIG91dCB0aGlzIGR1YWwNCj4g
cmVxdWlyZW1lbnQ/DQpZZXMsIGZvciBzdXJlLg0KPj4gLSBzY2lfZG9fZG9tY3RsKCkgcmV0dXJu
cyAtRU5YSU8gd2hlbiBpdCBoYXMgbm90aGluZyB0byBkbyAobm9uLURULCBubw0KPj4gbWVkaWF0
b3IsIG1lZGlhdG9yIGxhY2tzIGFzc2lnbiBob29rKS4NCj4+IFRoYXQgaXMgdGhlIOKAnG5vdCBo
YW5kbGVkIGJ5IFNDSeKAnSBzZW50aW5lbDsgaW4gdGhhdCBjYXNlIHRoZSBjb2RlDQo+PiBwcm9j
ZWVkcyB0byBJT01NVSBub3JtYWxseS4NCj4+IC3CoCBXaGVuIHNjaV9kb19kb21jdGwoKSBzdWNj
ZWVkcyAoMCksIHRoZSBkZXZpY2UgbWF5IHN0aWxsIHJlcXVpcmUgSU9NTVUNCj4+IHByb2dyYW1t
aW5nDQo+PiAoZS5nLiwgRFQgZGV2aWNlIGhhcyBhbiBpb21tdXMgcHJvcGVydHkpLiBTa2lwcGlu
ZyBpb21tdV9kb19kb21jdGwoKQ0KPj4gd291bGQgbGVhdmUgRE1BIGlzb2xhdGlvbiB1bnByb2dy
YW1tZWQuDQo+Pg0KPj4gVGhlIGZpbmFsIGlmIChyZXQxICE9IC1FTlhJTykgcmV0ID0gcmV0MTsg
ZW5zdXJlcyB0aGF0IGlmIGJvdGggcGF0aHMgcmFuDQo+PiBhbmQgSU9NTVUgc3VjY2VlZGVkLA0K
Pj4gYW4gU0NJIGZhaWx1cmUgaXMgc3RpbGwgcmVwb3J0ZWQgdG8gdGhlIGNhbGxlci4NCj4+DQo+
PiBEZXZpY2UtdHJlZSBleGFtcGxlcyB0byBpbGx1c3RyYXRlIHRoZSBkdWFsIHJvbGVzOg0KPj4g
MS4gQWNjZXNzLWNvbnRyb2xsZWQgRFQgZGV2aWNlIChub3QgbmVjZXNzYXJpbHkgSU9NTVUtcHJv
dGVjdGVkKToNCj4+DQo+PiBpMmMzOiBpMmNAZTY1MDgwMDAgew0KPj4gICDCoMKgwqAgY29tcGF0
aWJsZSA9ICJyZW5lc2FzLHJjYXItZ2VuMy1pMmMiOw0KPj4gICDCoMKgwqAgcmVnID0gPDAgMHhl
NjUwODAwMCAwIDB4NDA+Ow0KPj4gICDCoMKgwqAgcG93ZXItZG9tYWlucyA9IDwmc2NtaV9wZCA1
PjvCoMKgwqDCoMKgIC8vIEZXLW1hbmFnZWQgcG93ZXIgZG9tYWluDQo+PiAgIMKgwqDCoCBjbG9j
a3MgPSA8JnNjbWlfY2xrIDEyPjsNCj4+ICAgwqDCoMKgIGNsb2NrLW5hbWVzID0gImZjayI7DQo+
PiAgIMKgwqDCoCBhY2Nlc3MtY29udHJvbGxlcnMgPSA8JnNjbWlfeGVuIDA+Ow0KPj4gICDCoMKg
wqAgLy8gbm8gaW9tbXVzIHByb3BlcnR5OiBTQ0kgbWF5IG5lZWQgdG8gYXV0aG9yaXplL3Bvd2Vy
IHRoaXMgZGV2aWNlOw0KPj4gSU9NTVUgaGFzIG5vdGhpbmcgdG8gZG8NCj4+IH07DQo+Pg0KPj4g
Mi4gSU9NTVUtcHJvdGVjdGVkIERUIGRldmljZSB0aGF0IHN0aWxsIG1heSBuZWVkIFNDSSBtZWRp
YXRpb246DQo+PiB2cHU6IHZpZGVvQGU2ZWYwMDAwIHsNCj4+ICAgwqDCoMKgIGNvbXBhdGlibGUg
PSAicmVuZXNhcyxyY2FyLXZwdSI7DQo+PiAgIMKgwqDCoCByZWcgPSA8MCAweGU2ZWYwMDAwIDAg
MHgxMDAwMD47DQo+PiAgIMKgwqDCoCBpb21tdXMgPSA8JmlwbW11IDAgMD47wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC8vIG5lZWRzIElPTU1VIG1hcHBpbmcgZm9yIERNQQ0KPj4gaXNvbGF0aW9u
DQo+PiAgIMKgwqDCoCBwb3dlci1kb21haW5zID0gPCZzY21pX3BkIDc+O8KgwqDCoMKgwqAgLy8g
RlctbWFuYWdlZCBwb3dlci9jbG9jay9yZXNldA0KPj4gICDCoMKgwqAgY2xvY2tzID0gPCZzY21p
X2NsayAzND47DQo+PiAgIMKgIMKgIGFjY2Vzcy1jb250cm9sbGVycyA9IDwmc2NtaV94ZW4gMD47
DQo+PiAgIMKgwqDCoCBjbG9jay1uYW1lcyA9ICJ2cHUiOw0KPj4gfTsNCj4+Pj4gLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYw0KPj4+PiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jDQo+Pj4+IEBAIC0zNzksNiArMzc5LDEyIEBAIGlu
dCBpb21tdV9kb19kdF9kb21jdGwoc3RydWN0IHhlbl9kb21jdGwgKmRvbWN0bCwgc3RydWN0IGRv
bWFpbiAqZCwNCj4+Pj4gICAgICAgICAgICAgICAgYnJlYWs7DQo+Pj4+ICAgICAgICAgICAgfQ0K
Pj4+PiAgICANCj4+Pj4gKyAgICAgICAgaWYgKCAhZHRfZGV2aWNlX2lzX3Byb3RlY3RlZChkZXYp
ICkNCj4+Pj4gKyAgICAgICAgew0KPj4+PiArICAgICAgICAgICAgcmV0ID0gMDsNCj4+Pj4gKyAg
ICAgICAgICAgIGJyZWFrOw0KPj4+PiArICAgICAgICB9DQo+Pj4+ICsNCj4+Pj4gICAgICAgICAg
ICByZXQgPSBpb21tdV9hc3NpZ25fZHRfZGV2aWNlKGQsIGRldik7DQo+Pj4+ICAgIA0KPj4+PiAg
ICAgICAgICAgIGlmICggcmV0ICkNCj4+PiBIb3cgYXJlIERUIGFuZCBQQ0kgZGlmZmVyZW50IGlu
IHRoaXMgcmVnYXJkPw0KPj4gUGxlYXNlIGZpbmQgZXhhbXBsZXMgYWJvdmUuDQo+IFNvcnJ5LCBi
dXQgSSBjYW4ndCBzcG90IGFueXRoaW5nIFBDSS1pc2ggaW4gdGhlIGV4YW1wbGVzIGFib3ZlLiBU
aGVuIGFnYWluIEkNCj4gYWxzbyBubyBsb25nZXIgcmVjYWxsIHdoeSBJIGNvbXBhcmVkIHdpdGgg
UENJIGhlcmUuIE9oLCBwZXJoYXBzIGJlY2F1c2UgdGhlDQo+IFBDSSBzaWRlIGlzbid0IGJlaW5n
IG1vZGlmaWVkIGF0IGFsbC4NCj4NCj4gSmFuDQpDb3JyZWN0LCBwY2kgY29kZSB3YXNuJ3QgdG91
Y2hlZCBieSB0aGVzZSBjaGFuZ2VzLg0KDQpCUiwNCk9sZWtzaWk=

