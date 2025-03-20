Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C36A6A40A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 11:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921764.1325517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDR2-0007bY-OC; Thu, 20 Mar 2025 10:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921764.1325517; Thu, 20 Mar 2025 10:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvDR2-0007a1-L9; Thu, 20 Mar 2025 10:47:36 +0000
Received: by outflank-mailman (input) for mailman id 921764;
 Thu, 20 Mar 2025 10:47:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTqZ=WH=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tvDR0-0007Zv-Dc
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 10:47:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2614::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba6285f8-0578-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 11:47:33 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DB3PR0302MB9063.eurprd03.prod.outlook.com
 (2603:10a6:10:43d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 10:47:30 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8534.031; Thu, 20 Mar 2025
 10:47:30 +0000
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
X-Inumbo-ID: ba6285f8-0578-11f0-9ea0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rI3yHBWqkmJ0f4V4Y7zqDuO4DSCwc2MXtXW8tSoAkgXHJ/TkWM7atxMng2kJiR6hu9iwVdg50/Ywu65PrRcezCbKQoYuW5RWGEgaL7fVdvu6OrCQlQTj0fkjAeURjZzhGSKyYal7BIs8Cqda3HXPjpAFzWmm1pl2grM9JOnijGFQ58G+IMTPJ4yTkxU5YYvqTK4YycJUa4eFKjmT7z6xiaR204zhyeCH1LH3J13FugQEZhbYhl0Kw9OHoMkD6Zj62ivZQXf9MnHZPkTJK13y28TrFmxWKPQrUBh5ivD2elg2SYG2kNq0QaJY4/e7nmkm4Lk4zRlyLkJ84kQr6FvRSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAX8z2eRJ5ZqbStb8Fjl7veWegKVY0OH+onZypfuF9I=;
 b=o80TtHEkq5k6ayerVJk0k0CKLar90qZSdFz4w7z14lBlrwFpE2NhGPZy5xYyOPfQkcA013wJejqYUJcN96SsVx6NwDHQBg31FbAPtgc6LtCxC6t4iJ0hoEkCfKbxS4OdgEOKUYWEcg3Dp2ZsLVSbMn0TwOPfEbepJ3h4cc+rQ8rUMHtFUrimLVEAkjOiVbWCgxvMDPvT5QncBcNokLe2Y4kUyagvcdHFZW70CH7kHYbunXETfg3ebd5Jzv5oM6LAls6Ptbo4wy05zeW2GGGKwFPbdP67tk42N4Hl6GTRD2IR+d79vI/Fz+yE9UJTAQAabkai+oJFQBzJdMf2ezWGZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAX8z2eRJ5ZqbStb8Fjl7veWegKVY0OH+onZypfuF9I=;
 b=V8z4BbSdazJNwj5y/uFrdHOgfqG556Usgnk5fk0YU0HYu2dL7qysXtT32sekyEuktsQkO3dgjTolsHJm1YyfDINE8QMGDKnfbc9OzkLiIRV9IYDzsyWLvZcxrFSUeBm0MtwE50jL8YtoZ0JdyBK3NT1mev0ajHs0p1QE2C5iGSoDL1WO/59qp5tOYe8/dTzajONO9eRyKkCn1xyVdRgHZLK8xY6nudTagu4pqpk3gq08NWlDq91CrJF15zRb6V4GJr73XuV+n6cBnShk2Vw1p93IfMAZIIb4WTRqxgo4LyP0CV0OjNqhv3prUad7xNjQRGqRi6rvZeqiHv8E7DYJPA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9 2/8] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Thread-Topic: [PATCH v9 2/8] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
Thread-Index: AQHblOXcI08sNdwZJ0ah+pJJkNPOtLN3b9CAgAMregCAAAIvgIABQ66A
Date: Thu, 20 Mar 2025 10:47:30 +0000
Message-ID: <8df846ba-2ec7-467a-a097-0b9c2e4f51dc@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
 <95d779f00127defa37f3c5056c762ea0da47fc53.1741958647.git.mykyta_poturai@epam.com>
 <d646b0b9-bae8-4f97-908a-f2e52cac708d@suse.com>
 <710bfddb-6ce3-4b11-bcd8-91f17d4f5be2@epam.com>
 <9a0ac3c1-e448-4acd-a471-d8d8e14fbc44@suse.com>
In-Reply-To: <9a0ac3c1-e448-4acd-a471-d8d8e14fbc44@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DB3PR0302MB9063:EE_
x-ms-office365-filtering-correlation-id: 7b85f0f2-934d-4486-351a-08dd679c9d0e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cmxDWWQ1WnJXZm53RFJZczB5ekoyVU5ScjgvaG9sa3BjZGp5ZVBRdlIyNldC?=
 =?utf-8?B?MmQvSk5OQWV2L3NPRko3OHJuNnNlOTVhckhpTEhoMmN2OU93ZVZXR0JYYWx6?=
 =?utf-8?B?UkRnYzZIdm9VdXZnQ1k1S0hiUDFEQWZhQ1RGblNLcnJEV3Rxc3FwZmFkeFlp?=
 =?utf-8?B?RnJNUHhURURsaEptOWx3eDFsNys1YjM2N3lsOTlKN1BvVkVIWkFHaWt5UlZn?=
 =?utf-8?B?a1NtbUhYbXloRjV0VXpocGorUFZHRm9hek5OTm5ZUWtkSlFhR2pEK2N0bkdN?=
 =?utf-8?B?NFF1M2hVeWVBK3dSYkZVelphVGRiU3Q4QmQ5bTNKcjFQU25zc1dva0w0OFV5?=
 =?utf-8?B?M0xwdkNBYjdUNFp2N0htdVdocGt4bnRqWDNjQ2pwMnRodGdJTEdGOEI3REVs?=
 =?utf-8?B?TVZvYWJTOUlMc0o1cVFGVnpwRElIcmc1am5mSmpKN1Fxb01uY3A2ZnBuYVpH?=
 =?utf-8?B?QTFManlNcE1YY2luaGtucGcvSDIzMkxsM1BmbDFWSUNrSk9ySWtFc3laSzJ2?=
 =?utf-8?B?cHgwWnpiTzJJRnYrN0dMMGpyVGNTVWZEaHN4YnNHL3lrV2lOV2Z1OGVYRUww?=
 =?utf-8?B?cFN1UkthbktCbkpMQldzVVJiZ09TVVdySEt6SFFuUVoxZWI1akNwd0F5ZzYy?=
 =?utf-8?B?Qk1DWEk5eFVOUndsNW5zcjJaY0lFdEMvNjUzUHhDaWRFbGVkTmxwUnRCMHpI?=
 =?utf-8?B?My9kYXJaVVp4VnNxUStIYWU4NFNzd3ppNm1pZDE5Z1ZoOWJhQ21MbndkZStF?=
 =?utf-8?B?RFY5ZlRPNkpnQVZIZkRuUFJmLytPL0hZdzJKbGU1TEJzTFVyS0xSdkpESHpP?=
 =?utf-8?B?MVd6UCtqRGZ0QWhCZ3lxZDV5aVd0TVk4Vkpxa0srUDJ2ZXVyOG4vVjgwQzQ5?=
 =?utf-8?B?OXRUL0IwTVJMMjMvWEVxL3V1am0wU0ZVZkhDdnB3aC9VY211LzFtc3VNNkZx?=
 =?utf-8?B?V0luS0h6anR2Y1o0YTJCb0dKZWlFSkRLZ2xaWTZVMmJVSVpUbGo4cHBqYzg0?=
 =?utf-8?B?RzBTaThHaEVsRFVWbkU3MUs2aUVTeU9IUXhyZUxWQTYwb0I4dGwzV3JvakxV?=
 =?utf-8?B?ZzhYYWVBU1NZYzFYV3R6Q0hrUkh4WWZaNkhac0pMdGxNRGlITjJJMFVuUDVH?=
 =?utf-8?B?MTR6UWNmc0l5RVk5MnZEY21nUDRQUEdpOW9NOVEzbVZoZ0JCeDNFVDFrdVNE?=
 =?utf-8?B?dHdnaktaS1p2N0EyY01Bb2I5SVFGN2RSaDhWVFEwSlBBdXp3cFMycjNTQkF2?=
 =?utf-8?B?YjJOS04vMFJnVFg2SmdLSGlNNUVnZktodmhEclFFOE9JVmVsU00zUWdQcHpW?=
 =?utf-8?B?VDlaZk4zZjlBYkM3NFRWMWxLYm9jdEJWRG1YeVdDcjBYY2Fpb1BzdVFIc2tv?=
 =?utf-8?B?SDJQNHVRRnE1Qlo1WnlRWkVSZnAzMEJSdTZOYlJrSk02VnNlYmFJTUpsdGRY?=
 =?utf-8?B?ZHlVdUdYTEh0NENidWhQcm1ER0tVLzJ5V0lhbWQzVjRZb3pLNTZ6cmFLOW5P?=
 =?utf-8?B?WDN3L0toN1lvYzVJS1J5RktEdE5mUlg1THNaY2o5TVQ2QXhjUWFobE5TckZl?=
 =?utf-8?B?MUdTbHFtNTJKTEZpdE5jUXBFdlVMUVNWZmhWRnhaOGZGRjUvMjFLUkpORHJo?=
 =?utf-8?B?ZzU2SGlkNkJFdXl0aEpLVDdMYWRYc0xJeDQwUm5CY0QxVkRFQ2V4Y29QM0ty?=
 =?utf-8?B?WkpSZ1U1TExhRzVCSUQ0NEtza3RiMUVjSVMrdi82anljdTdsUHpOQkppeUJQ?=
 =?utf-8?B?QjVTS3lvK29xYitYSkdwSWhaQUt0Y01xaUN5b0lzVVZOZmdhdWxzOUpVR056?=
 =?utf-8?B?K0JCSmhWTlV0QXNONFJxKzVpMDlPSEtNaHJVL2pHWDJvcEtmQ0FqcXQreXBT?=
 =?utf-8?B?WER4NWYrY0dFc1NRU1BzcTVMMlBSWVorVmxneXVnSHlleWJkbE5oMVlScyt4?=
 =?utf-8?Q?s8l92YvL01wArrcq63r+kakVMP+utsvn?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVl2UFR1Y0xUUHdVd1RRZEVuUENnZEdxamo3bWVGTy9PU1VrVEh0ZjF6V0RG?=
 =?utf-8?B?SGQwVGxVOGJ0OVZFTlBrYTRhdFdDa0hIQkUxejhtamE1bmdnVHQySFFQUVJu?=
 =?utf-8?B?NFUxV3Q2RVdCU25aT0IvZk9DekZ3czFEUFFXYnVDdFVzWVdOeVB5SHR3S01x?=
 =?utf-8?B?SlZjeXF1aVRFQ2hCK1ZzQ0JCUHZTRDNBYUd2NDVxZmV5ZTVtZVJEVDc4UlRa?=
 =?utf-8?B?Z2dTL1RFY1EzTFRhZHZYSXRMOHpBaUVXdTVPRXR3V0x4bVpmaFlIeHRqaWtS?=
 =?utf-8?B?cnI0L3kyTUNLY0dTZWlIclpFdmIrUWF0aFNvTUFvamlZUWh1NGRFMlBsKzlI?=
 =?utf-8?B?eDVhdmxzbTd2dDlNbmVuUnV4Tk83NVd2UTRmVG1hVWh2dGoyalFUTERXREd2?=
 =?utf-8?B?QnFpOTNvdUpjdUYvYWJCY2JWSTYrVVEyYm81c1hibFBJdWhIVms2N0RjeEE2?=
 =?utf-8?B?OXdkbExWZUhLTzNVLytLSzE0cHNSWVpJRi9udWxTbHd4TzQwWXpXb2pjNVQr?=
 =?utf-8?B?R2RzaURmbWJUTXlqYkVxdkdOUG10dHBIUm80QnNmNEM1R05mTURURUlJZG5C?=
 =?utf-8?B?YUJ5azRvdzdyVG5TTzdra3RIY3RmQVBOYWxRcGJrMDRTQmM2WUZTSFZRZ3Zm?=
 =?utf-8?B?QXJQblo2QTUyYnpwcEs0M1hSdXlwdnNvRGNMamJXNkxUYjRtMDNmVWQyVzZH?=
 =?utf-8?B?emlydk5wT0FQOWdPUHpPN3E2dHZSTlphTFVNbU9rWHRDSVdzMms2dDFUSDBt?=
 =?utf-8?B?YWpTWTdlSnRYb0lFd2lXeEQzZDBGd3NYRFlKb3E5cTUyNlFNdEdxbzhQelFW?=
 =?utf-8?B?NU5mcmczNTNOYkpOdXRJdytWb2cwMEZPTFFNaWJTVS9kaEczdmJaVENoeG9Q?=
 =?utf-8?B?eXhFQUJOejRqQnZSRndZMGFCMitIdGVrZDFuV21yNE5qYnBRS3l1L1Foc1N0?=
 =?utf-8?B?NnYraDRoUGdYbi9WazZXa0VKVWxxWEcwS3Z5a1hXQ3NmVGh0ZDN6WGIzQnY2?=
 =?utf-8?B?aTY5KzV3akNvcndKRVVYeWlOMVpSR3loVEZoYnowQ1BmOGwvVjBlZmFPd09X?=
 =?utf-8?B?cDFES3Q4Y2t2VnVnWW16aXdHaXNmVTVKSnNhRDZYK0VwOGJsYTcrRjA3V1Q2?=
 =?utf-8?B?NFdxQUFEbjFQeXZ4U3dML3dtYnRDSjV3SGRCbVBuSkFpRGRiak5HMU0xZjl6?=
 =?utf-8?B?Q2x6REYxcENBMWlGNjI1YTNTaCsxY1d2cjdQbHpHak54KzZqaCsya3M5QUZZ?=
 =?utf-8?B?QVR2YWNqck1EMW9hbTN5VnRualRtaDR5czFMWDhOcWtxbTgrMjlZMWdtVkVC?=
 =?utf-8?B?QmRySHdXOFZhUDVOb3ZqYmJEVHNLVldGcEx6N1JnUjJXWnlFMjlCajZrZ01s?=
 =?utf-8?B?M0U4djN2OVRyTG5aQnQrdjlHNVJFNEljbmRmdWtiRytwSjlWUUtCcDJvZjFa?=
 =?utf-8?B?TUJ1UktGd1pDWHpTLzVDcUpWeTBQYjJEYTdJR1ZTa2ZrMk53ZWxHbnZXWFdu?=
 =?utf-8?B?TWdKUldadnJIcUJwQlEvVXlaWWtxb1ErckFmMmtrL2VXMVQrSXFaWkpUOS93?=
 =?utf-8?B?enEzZmtiUnB4V1NUSC9OUHVoQTlVVlFYTUJuN0J4aEM5Ky9aaXNPeDgySVBJ?=
 =?utf-8?B?cFhqVXQxUVdTeXBqWDhJYTRudDREWGh4UlRxNUMrQUFmSTVxU2NuR09SRmxr?=
 =?utf-8?B?NnczZllKMyszZ29zSEN1V2VqM053ZU01YUdaZ0xFMTBvZG5yeEw2bTlqQ2l3?=
 =?utf-8?B?Rm1OL01CbEs4RXA3Y3pIbTQ0MVJ3clVlcUJrR0daSlJhY3VBaFBhb0NkZ0Jp?=
 =?utf-8?B?NlladjNuK2s0Ni9CM2lWY0RoVllnSTd0em1QWkZvR0lIRnNKU2VwSjR4NUFm?=
 =?utf-8?B?SEJUU0pyb2RwUHEwNjB6QXRvaXNLdlZGUXFxUlcrRFJQZzFXMks5dDQxYW8z?=
 =?utf-8?B?dCtZNTVGaG9HOGgrczh2d3dsUWtPV0hsbzRpaFVhc0hWNkhucC9tSkwvR2ZC?=
 =?utf-8?B?NVNvaUNWWjB6bHk2Z2J0VkJqZll0RGFuR08yN0d2Z3ZGdmYrM1dXQUhPdFA5?=
 =?utf-8?B?RW5mMWoyMXBiOFVrTW9BUjgvQ0RjMTRIKzE0TFZPR1N6bWJYZk1KVnE2bkpQ?=
 =?utf-8?B?dnlFY0tqMXBqbzVnRkV2MlR0ZG8waFpxYnZCMEVweWhINGsxb2NIYUZucEpF?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <090E3AD2CA8E5C49990895A35F8F1462@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b85f0f2-934d-4486-351a-08dd679c9d0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 10:47:30.3775
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pLUrJuvQjSAy6PXLrw2OMeRoQJFOcweTytbEqyHL8Y5DMmpHVo8Mjlc4TxwgKneXYNb0g8HiF9EK+8RJXfrbrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9063

T24gMTkuMDMuMjUgMTc6MjgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4wMy4yMDI1IDE2
OjIxLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE9uIDE3LjAzLjI1IDE2OjU2LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNC4wMy4yMDI1IDE0OjM0LCBNeWt5dGEgUG90dXJhaSB3cm90
ZToNCj4+Pj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPg0KPj4+Pg0KPj4+PiBUaGUgbWFpbiBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggaXMg
dG8gYWRkIGEgd2F5IHRvIHJlZ2lzdGVyIFBDSSBkZXZpY2UNCj4+Pj4gKHdoaWNoIGlzIGJlaGlu
ZCB0aGUgSU9NTVUpIHVzaW5nIHRoZSBnZW5lcmljIFBDSS1JT01NVSBEVCBiaW5kaW5ncyBbMV0N
Cj4+Pj4gYmVmb3JlIGFzc2lnbmluZyB0aGF0IGRldmljZSB0byBhIGRvbWFpbi4NCj4+Pj4NCj4+
Pj4gVGhpcyBiZWhhdmVzIHNpbWlsYXJseSB0byB0aGUgZXhpc3RpbmcgaW9tbXVfYWRkX2R0X2Rl
dmljZSBBUEksIGV4Y2VwdCBpdA0KPj4+PiBoYW5kbGVzIFBDSSBkZXZpY2VzLCBhbmQgaXQgaXMg
dG8gYmUgaW52b2tlZCBmcm9tIHRoZSBhZGRfZGV2aWNlIGhvb2sgaW4gdGhlDQo+Pj4+IFNNTVUg
ZHJpdmVyLg0KPj4+Pg0KPj4+PiBUaGUgZnVuY3Rpb24gZHRfbWFwX2lkIHRvIHRyYW5zbGF0ZSBh
biBJRCB0aHJvdWdoIGEgZG93bnN0cmVhbSBtYXBwaW5nDQo+Pj4+ICh3aGljaCBpcyBhbHNvIHN1
aXRhYmxlIGZvciBtYXBwaW5nIFJlcXVlc3RlciBJRCkgd2FzIGJvcnJvd2VkIGZyb20gTGludXgN
Cj4+Pj4gKHY1LjEwLXJjNikgYW5kIHVwZGF0ZWQgYWNjb3JkaW5nIHRvIHRoZSBYZW4gY29kZSBi
YXNlLg0KPj4+Pg0KPj4+PiBbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9wY2ktaW9tbXUudHh0DQo+Pj4+DQo+Pj4+IFNp
Z25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0Bl
cGFtLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0
LmhpbGRlYnJhbmRAYW1kLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogTXlreXRhIFBvdHVyYWkg
PG15a3l0YV9wb3R1cmFpQGVwYW0uY29tPg0KPj4+PiAtLS0NCj4+Pj4gUmVnYXJkaW5nIHBjaV9m
b3JfZWFjaF9kbWFfYWxpYXMgcXVlc3Rpb246IGdldHRpbmcgaG9zdCBicmlkZ2Ugbm9kZQ0KPj4+
PiBkaXJlY3RseSBzZWVtcyBsaWtlIGEgc2ltcGxlciBzb2x1dGlvbiB3aXRoIHRoZSBzYW1lIHJl
c3VsdC4gQUZBSVUNCj4+Pj4gd2l0aCBwY2lfZm9yX2VhY2hfZG1hX2FsaWFzIGluIGxpbnV4IHdl
IHdvdWxkIGFycml2ZSB0byB0aGUgaG9zdCBicmlnZQ0KPj4+PiBub2RlIGFueXdheSwgYnV0IGFs
c28gdHJ5IHRvIGNhbGwgZHRfbWFwX2lkIGZvciBlYWNoIGRldmljZSBhbG9uZyB0aGUNCj4+Pj4g
d2F5LiBJIGFtIG5vdCBzdXJlIHdoeSBleGFjdGx5IGl0IGlzIGRvbmUgdGhpcyB3YXkgaW4gbGlu
dXgsIGFzDQo+Pj4+IGFjY29yZGluZyB0byB0aGUgcGNpLWlvbW11LnR4dCwgaW9tbXUtbWFwIG5v
ZGUgY2FuIG9ubHkgYmUgcHJlc2VudCBpbg0KPj4+PiB0aGUgUENJIHJvb3QuDQo+Pj4+DQo+Pj4+
IHY4LT52OToNCj4+Pj4gKiByZXBsYWNlIERUX05PX0lPTU1VIHdpdGggMQ0KPj4+PiAqIGd1YXJk
IGlvbW11X2FkZF9wY2lfc2lkZWJhbmRfaWRzIHdpdGggQ09ORklHX0FSTQ0KPj4+DQo+Pj4gSSBm
ZWFyIEknbSBjb25mdXNlZDogSXNuJ3QgdGhpcyBjb250cmFkaWN0aW5nIC4uLg0KPj4+DQo+Pj4+
IHY3LT52ODoNCj4+Pj4gKiBFTk9TWVMtPkVPUE5PVFNVUFANCj4+Pj4gKiBtb3ZlIGlvbW11X2Fk
ZF9wY2lfc2lkZWJhbmRfaWRzIHRvIGlvbW11LmMgdG8gZml4IHg4NiBidWlsZA0KPj4+DQo+Pj4g
Li4uIHRoaXMgZWFybGllciBjaGFuZ2U/IFJlYWxseSwgd2l0aCB0aGVyZSBiZWluZyBubyBjYWxs
ZXIsIEkgY2FuJ3Qgc2VlDQo+Pj4gd2h5IHRoZXJlIGNvdWxkIGJlIGFueSBidWlsZCBpc3N1ZSBo
ZXJlIGFmZmVjdGluZyBvbmx5IHg4Ni4gRXhjZXB0IGZvcg0KPj4+IE1pc3JhIGNvbXBsYWluaW5n
IGFib3V0IHVucmVhY2hhYmxlIGNvZGUgYmVpbmcgaW50cm9kdWNlZCwgd2hpY2ggSSdtIHN1cmUN
Cj4+PiBJIHNhaWQgYmVmb3JlIHNob3VsZCBiZSBhdm9pZGVkLg0KPj4NCj4+IFRoZSBvcmlnaW5h
bCByZWFzb24gZm9yIG1vdmluZyB0aGlzIGZ1bmN0aW9uIHdhcyB0aGUgY29uZmxpY3RpbmcgQUNQ
SQ0KPj4gYW5kIEVGSSBoZWFkZXJzLCBJIGRlc2NyaWJlZCBpdCBpbiBWOCBjb21tZW50cyBoZXJl
WzFdLg0KPj4NCj4+Pg0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5j
DQo+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4+Pj4gQEAgLTIw
LDYgKzIwLDcgQEANCj4+Pj4gICAgI2luY2x1ZGUgPHhlbi9wYXJhbS5oPg0KPj4+PiAgICAjaW5j
bHVkZSA8eGVuL3NvZnRpcnEuaD4NCj4+Pj4gICAgI2luY2x1ZGUgPHhlbi9rZXloYW5kbGVyLmg+
DQo+Pj4+ICsjaW5jbHVkZSA8eGVuL2FjcGkuaD4NCj4+Pj4gICAgI2luY2x1ZGUgPHhzbS94c20u
aD4NCj4+Pj4NCj4+Pj4gICAgI2lmZGVmIENPTkZJR19YODYNCj4+Pj4gQEAgLTc0NCw2ICs3NDUs
MjAgQEAgaW50IF9faW5pdCBpb21tdV9nZXRfZXh0cmFfcmVzZXJ2ZWRfZGV2aWNlX21lbW9yeShp
b21tdV9ncmRtX3QgKmZ1bmMsDQo+Pj4+ICAgICAgICByZXR1cm4gMDsNCj4+Pj4gICAgfQ0KPj4+
Pg0KPj4+PiArI2lmZGVmIENPTkZJR19BUk0NCj4+Pg0KPj4+IEkgcmVhbGl6ZSB3ZSBoYXZlIENP
TkZJR19YODYgaGVyZSBhcyB3ZWxsICh2aXNpYmxlIGV2ZW4gaW4gY29udGV4dCBvZiB0aGUNCj4+
PiBlYXJsaWVyIGh1bmsuIFlldCB0aGVuIHRoZSBnb2FsIG91Z2h0IHRvIGJlIHRvIHJlZHVjZSB0
aGVzZSBhbm9tYWxpZXMsIG5vdA0KPj4+IGFkZCBuZXcgb25lcy4gU2luY2UgSSBkb24ndCBoYXZl
IGEgY2xlYXIgcGljdHVyZSBvZiB3aGF0J3Mgd2FudGVkLCBJJ20gYWxzbw0KPj4+IGluIHRyb3Vi
bGUgc3VnZ2VzdGluZyBhbnkgYWx0ZXJuYXRpdmUsIEknbSBhZnJhaWQuDQo+Pg0KPj4gSGVyZSBp
cyBhIHNob3J0IHN1bW1hcnk6DQo+Pg0KPj4gVGhlIG1haW4gcHJvYmxlbSBpcyB0aGF0IHdlIG5l
ZWQgdGhpcyBmdW5jdGlvbiBzb21ld2hlcmUsIGJ1dCB0aGVyZSBpcw0KPj4gbm8gZ29vZCBwbGFj
ZSBmb3IgaXQuIEl0IGlzIG9ubHkgY2FsbGVkIG9uIEFSTSBmb3Igbm93IGJ1dCBpdCdzIG5vdA0K
Pj4gQVJNLXNwZWNpZmljIGJ5IG5hdHVyZSBhbmQgY2FuIGJlIGV2ZW50dWFsbHkgdXNlZCBvbiBv
dGhlciBwbGF0Zm9ybXMgYXMNCj4+IHdlbGwuIEl0IGNhbid0IGJlIGp1c3QgZHJvcHBlZCBiZWNh
dXNlIG9mIHRoZSBlZmZvcnQgdG8gc3VwcG9ydCB0aGUNCj4+IGNvLWV4aXN0ZW5jZSBvZiBEVCBh
bmQgQUNQSS4gSXQgYWxzbyBjYW4ndCBiZSBkZWNsYXJlZCBhcyBhIHN0YXRpYw0KPj4gZnVuY3Rp
b24gYmVjYXVzZSBpdCByZXF1aXJlcyB0aGUgaW5jbHVzaW9uIG9mIDx4ZW4vYWNwaS5oPiBmb3IN
Cj4+IGFjcGlfZGlzYWJsZWQgZGVmaW5lLCB3aGljaCBsZWFkcyB0byBidWlsZCBlcnJvcnNbMV0u
IEFuZCB3aXRob3V0IGlmZGVmDQo+PiBndWFyZHMgaXQgd291bGQgYmUgYSBNSVNSQSB2aW9sYXRp
b24uDQo+IA0KPiBBbiBhYnJpZGdlZCB2ZXJzaW9uIG9mIHRoaXMgb3VnaHQgdG8gZ28gaW4gdGhl
IHBhdGNoIGRlc2NyaXB0aW9uLCBJIHRoaW5rLg0KPiBUaGlzIGlzIHNwZWNpYWwsIHNvIGl0IG5l
ZWRzIGNhbGxpbmcgb3V0Lg0KPiANCj4gQXMgdG8gdGhlIHBsYWNlbWVudCAtIHdvdWxkIG1ha2lu
ZyBhbiBlbnRpcmVseSBuZXcgLmMgZmlsZSBwb3NzaWJseSBoZWxwPw0KPiAoVGhlbiwgaW5zdGVh
ZCBvZiBpbiB0aGUgcGF0Y2ggZGVzY3JpcHRpb24sIG1heWJlIHRoZSBzcGVjaWFsIGFzcGVjdCBj
b3VsZA0KPiBiZSBwdXQgaW4gYSBjb2RlIGNvbW1lbnQgYXQgdGhlIHRvcCBvZiB0aGUgZmlsZS4p
DQo+IA0KPiBKYW4NCg0KSXQgc2VlbXMgdG8gbWUgY3JlYXRpbmcgYSBuZXcgZmlsZSB3b3VsZCBi
ZSBvdmVya2lsbCBmb3Igb25lIHNtYWxsIA0KZnVuY3Rpb24uIEkgY29uc2lkZXJlZCBtb3Zpbmcg
aXQgdG8geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lvbW11LmMgDQp0byByZWR1Y2UgaWZk
ZWZzIGJ1dCBJIGZlYXJlZCBpdCB3b3VsZCBzdWdnZXN0IHRoYXQgaXQgaXMgYXJjaC1zcGVjaWZp
YyANCmEgYml0IHRvbyBzdHJvbmdseS4gU28gbWF5YmUgbW92ZSBpdCB0aGVyZSBhZnRlciBhbGwg
aWYgeW91IHRoaW5rIGl0IA0Kd291bGQgYmUgYmV0dGVyPw0KDQotLSANCk15a3l0YQ==

