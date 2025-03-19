Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9ABA68C60
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:06:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920452.1324619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusBL-0008UV-4Z; Wed, 19 Mar 2025 12:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920452.1324619; Wed, 19 Mar 2025 12:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tusBL-0008T1-0G; Wed, 19 Mar 2025 12:05:59 +0000
Received: by outflank-mailman (input) for mailman id 920452;
 Wed, 19 Mar 2025 12:05:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9jgP=WG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tusBI-0008RR-K6
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:05:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2612::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 805c8e49-04ba-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:05:53 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB9625.eurprd03.prod.outlook.com
 (2603:10a6:20b:5ef::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 12:05:47 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 12:05:47 +0000
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
X-Inumbo-ID: 805c8e49-04ba-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l8WBDxuX50x8zoQ0SxDE7RBvOaif0zg/wtVDTyOWZJyLn2+jwt63REYvu1Sc/0WOC2POgVok88SDGs3Dk3W8pqILsrZIBB1wdywk8R3/PD9LJqApxFNV4js6a9gJ/Nruh1JOf5ZAFTpTfJM6OLuiv48/nChoi3X2CU6MjAcmIJu12yX8SWDSlU1Brl1dPUFNj6lWSPuVBx4O8ZYs6W2vceTNTh9c6r8DmkLiiW7nyL+rwm9Ido8rhH2D7Yi8dXs7MSmC0A48xrk3JpxJWaPNlLDufzIfMkUzzsrajz2OUrJ7USOnJ5I9IEwoJYzDVkSnBNvafZGZU7SFr4aBhbCxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8huW5gfE0V5JDPHDA/R47hO7EKofd8rQnK3l4TpP+A=;
 b=JqsJfzHmMCg0VmGNIx5pNaM1dNU0yApoXZgBKjwU1LgwE7JwX4m5+F2jfV3AwbtV+P4IsR9tlbNAocuY44+TAXF3LnS3lr0fK6XYSUvdj/pzbRyJ1tW3eHBpzevMhnxw9gqBCUWaIalyBacjCPYH8p2ilYM+UiyV0CuX+4ib97Cb0HE7tQLe+VOnlB0Dai6v+vjIIhzWEysP8GW9KygvvJPDe6tXK6qvC+4Hda1uPlCaaCN27QwsFA6DftogRlCQrJ5aCYvJNdaxbQ/RT6GQ4O0goFWzujdbgrm1qdMn2fG2f0t04uhT1fka0l9k8wJ1EAaU/spO4Q8/R2WEFmT4ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8huW5gfE0V5JDPHDA/R47hO7EKofd8rQnK3l4TpP+A=;
 b=BZDCW3hV+wOeTL2uAU+8wseBIb8sy12CAHfpO3tfOrKtZf8V7JaZuihePCB1PLejgZYCWazhnUauw1IQlI/Ayg2OdmVqlY3FxdcZCIJUdgM5sGujHbe0M2AD2DB2INmx4krg8WzhEqD3zlwM8xZbYZw369NWU4pz2pUqqCTLvfiDpg91MiCv9sDspjAF2DLiSxItzmn9WLqlEuczTrijkm3egHLYTTx2OYiHq/RexmHnOjyV1uWguLN09Vq5rkZwTPNeMp0w2yl7SGXpNLQF2b12AhFKnCTQbMm4t2uU/+l8rwFaEW72NwuCvGvNwh0pYlr1ojH7SyQHBAU3Pzk6UA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Topic: [PATCH 2/2] xen/dm: arm: Introduce inject_msi2 DM op
Thread-Index:
 AQHaRWELmXttIq3ydUeKyfZPAZRMh7DaobyAgqCezQCAABD4AIAAN9aAgAAPTYCAAWsXAA==
Date: Wed, 19 Mar 2025 12:05:47 +0000
Message-ID: <19d8224a-04e0-45bb-9471-abeb684e9cad@epam.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <6c551b03796fbf091b22fcde96d894cd5308ff91.1705066642.git.mykyta_poturai@epam.com>
 <1793f158-ed83-46f9-be12-68c5ce86e4c4@suse.com>
 <495906c3-9937-4b54-ae3a-8e8ad2b9814f@epam.com>
 <a738e3d9-bfd3-46be-8f66-cbbe4353f93a@suse.com>
 <7b3a5232-c17e-49d8-8719-a42745144338@epam.com>
 <65f0072f-33c0-4436-8e34-3544d25c9568@suse.com>
In-Reply-To: <65f0072f-33c0-4436-8e34-3544d25c9568@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB9625:EE_
x-ms-office365-filtering-correlation-id: b3313911-bd46-4daa-0385-08dd66de6221
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L2xqVzdYM1RyUTlGeUlvT2xRZWkvajk2RE50ZlFMc2o3bVNUYnJWRDJkNzN2?=
 =?utf-8?B?TU4yNWFwMFo0YWUwdU9Bd0I0SDIwMktZcWZxS1lFYnduQjNOdVJJSzRqZDZ4?=
 =?utf-8?B?OVB3L253dlYyWlFZL0UxSTk0elllRFp6bEhObDhQZDNQWitZbE1xc3BoZ2M4?=
 =?utf-8?B?M3ZpM1VRMHJNYXUrNjV1Y1B4MDgvSmg5aTQ0ZG9OOHVERHMxdTlTK2pOTy9X?=
 =?utf-8?B?T2lTSXhBYkRENGpIYnRKSGp6VHNSQ3J3RWJ0aFIwY0s2SDNKVWRoaStWd0lk?=
 =?utf-8?B?U2tIOU5QYTY1K1VzMmZFT2lGa2FBOVFEZHUzM1Y1aHJQVDVoUTgxREZqR2Ja?=
 =?utf-8?B?MVlXenA0UFhWSGdDdkt6S2IrZTIxWXNkNjJUYXNzWnNEVXgzbGVaQ1ZzSmFJ?=
 =?utf-8?B?YUZOS3hZNjVhNDRZZ1cvMWxDYmhUM1IyTFk2dFRnamtQbFYrS1gvZlJFbElz?=
 =?utf-8?B?VDhIdXJEcWc4bitFNjRUZ0pFcnkrd1gxUmhYTkhYMndSYTdzNVVsdmVMdVVr?=
 =?utf-8?B?R1ZQcHNpTHRQd0xibHpEUDArek5UV0lFK2ZZbThjczRZclc0NFNQUHh4Zyt5?=
 =?utf-8?B?VjNLMCtER3I2YnJ0WTRrQ0VRR3Vma3prYllzYjVUcXZUZDJLU0xKaEJFREFO?=
 =?utf-8?B?ZEVMM2lwWklqQVJib0lDdlB2U0JqYlkxaWp2NXc4SXA0MHBrSEllUmIyRXUz?=
 =?utf-8?B?NEMramVxaldzU1UvY2Z5NzVnelhhbmtkQ1JVdC9yelNUSWROYTc4dGJZZE5R?=
 =?utf-8?B?dE5td0dCdGUySU9oR09wc0gvMjNGaFJIY1BQMHgvenI3V0Q3OFIwN1dFYzd3?=
 =?utf-8?B?dnFYZk9SOEFPcW9JV1Q3RWFwTkhhQ1hrbTJpZXpjZmtjUzY1b2NHcG94cEZZ?=
 =?utf-8?B?Tng1eTYyZUZxSjZLdXovN1dtUlZiYThHMVQ5VEdWdnRLWldUNVlSSmJYaVlo?=
 =?utf-8?B?bUl3SUpMWlJleXlqbWtpN1ZIRDBvYW84Vk9xUWxTb3dXYnE3eExCbkJXM0Jk?=
 =?utf-8?B?ZDhHVlJ2VjFidlFvVERreHBockY3bjVlQ3JNN3ZLOXdGL3pFRzJ5ZFRqWkFp?=
 =?utf-8?B?T3BUaVJQSml2UlNpeS91OEdwamwzdVEwbHlVZFBxa0hiVGpuSWJFR1g2QXdS?=
 =?utf-8?B?MERXdENwcDJ1UXgySjZpcTFzUlBnZFBsbVNubVk4Mlo1dXdHSTgzTmFuMllM?=
 =?utf-8?B?ZHA1OW1YWXNWZmY2NE9LbjdKa0t3dnhNNWxsWHFzMVZDRkJRL1p1MFptbVMx?=
 =?utf-8?B?dlFFVEI0Rlh3czY1cGw1OTVCWUI2ODFueW9kZjRXNktUM0NMbUlNWnR4aE8r?=
 =?utf-8?B?Q2REUzJYWEV6ek1vbU15eXBoRUNwS1JQekJoR25ncU1BdTJtVW5xbUdVZUxo?=
 =?utf-8?B?emkxbTZ2dDArWSt1bktXalIzeFZFdjI3YnZxUURJTkV1cTlrM1B5Yml4SFVi?=
 =?utf-8?B?YkpWamRuQXFuZ0JhekRGODBNZmpHdWhxdXA0ZDd3KzVSVEs2Sm04NHZqalZM?=
 =?utf-8?B?WW5wRkl4Y2lOdmFyU3EyR3gySXhabEdYcWhMSHlhQ2c1eW1QNFRuMGs0L1lq?=
 =?utf-8?B?Y3RMeG41MXdBcy9mTkx5S1lWcVBoYVMvNUVWU2hGZWtRaHFucSsxNEFTRGJP?=
 =?utf-8?B?UmVZb0FWTWszNnNQVHRpSFo5SnFmOVFMTG05STJ0NlBhSXBRajBvTVZGL0RM?=
 =?utf-8?B?UjJWR0kzekhTdWl4MFRsL0JLL2QwK1ZxYUFvbk1RaEVPbFVNVXd6YVgyKzZP?=
 =?utf-8?B?a1puRE9reFIzeG1tbDIwVUJLaEk3Sy9ZR05PWi96RmpER3p0Q3l1MDhDWi9G?=
 =?utf-8?B?SDIxUnlsb2hVZFE1NmpKRk4zNjcyeEFNWEdwNzQ1NFRvd2plNDA2TlRCQ1ZG?=
 =?utf-8?B?VXcvbTd0dlFjdUxqRGFscVJQOVlDNUNsdHFCMUhMMVhwaGc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3oxZ21iSEhJczVXNGU0UFF5YjFiTFRJSWlkMy85dTVVSE1RTmQ3Qjk0bjRX?=
 =?utf-8?B?aWFmSlVOVXFJaUNic2ZMdHR6VkdkMFlKTUszNHhWWW1tcmN5Sy9GWVJOenpO?=
 =?utf-8?B?amlXS0poNHI3NHFNOWdxN091SzI5WHFCT1g3Ym9yN09GM29FUDVpbE9FZDNV?=
 =?utf-8?B?dlo4U3NEWXNVc3N5cGJ3Z3NmVWtuYTdMRjNUOWFTOXZHS2FSdjBjU2Nqb2JU?=
 =?utf-8?B?V0o5V2tETVkvVmJkZmlKandzNG1SYmtYRHp3VjVKR3VOeXc0KzA4Z09GeWRM?=
 =?utf-8?B?Ukp6Q2lUeUxKRE9pSFp1c1JvR0p6bmV2dTBFMkc4dVd6T09oc2loelBjZUFJ?=
 =?utf-8?B?S0xQYVJIdXFScWtja3BxMTU5N1NtTk1zOWo4R054eFZ6OGVMYVJVZEx6Unc0?=
 =?utf-8?B?ZkliTnZtdlQxSUMramEwd0lDZTBtaC9CbmtpeG5TTDdaNHp2bG5Xb1JMdlJ5?=
 =?utf-8?B?TWsyNUpCcTNqRVRXVU9ndmlMZ3BWYzdBeFJ2ZW1oYmVkOFR6VXdpWU4ySXpD?=
 =?utf-8?B?M3ZXTnBZbGM2anpkMWJuajk1eDJwYk42UG1BdXppZ2llL3FKbWxoTTFhTmQ4?=
 =?utf-8?B?UlMvOXJVS0c3Nlh0M3Y0bFo1b01SVENuUmdJT1c0bUh3ZXkwaGNiQzZsNEt5?=
 =?utf-8?B?TTlvSHcwckZnUVZTUVVMRWoxczdYWjF0NUszRnQ5WnU5ZlBEc2hmeEdoNGls?=
 =?utf-8?B?eG90clhYekRZblJ0Tys1OUQxLzE5STRhNXI4ODRDSkZ4UFRtUHZIaU1SZHpH?=
 =?utf-8?B?bzdIVUJBNER0dXZFNjhueHZRSjVEaUFQclFYbnRZN3A4TERnQkFSOW0yeWdQ?=
 =?utf-8?B?RDFuUitwTFk0ZUMrblBycE1aaFJOaEJHa1AwZXJOMmFId214ZU9HUEp3RkNF?=
 =?utf-8?B?UWQ2V3g5aUtkV0VpcjZEWVUzMFNuNHlvTG13cC9uYXIvdmpaTE5HLzZqNnZm?=
 =?utf-8?B?SmgrVDRvdHZuT1Vyc05KN0duUjlLRzRWT05GcHI5WjJnWjNjUERlak5CZW1n?=
 =?utf-8?B?WDVkQk1MQUkxYnhpOTFraFNsM1NDOUV5dXJqOWxIOEVXamc2Q3JIajh3MzB3?=
 =?utf-8?B?QW5wQ1l1TTlXQjk1QlA2aUlIZDVNT3lQQkV6Uy9kR0ZYS0hxSHJlTEFpNnJ1?=
 =?utf-8?B?WFExdXdBL0JoN09zK0FkNEt5UXVNaUNFV1dITVlUUWwzalFtYWVLd0xYYVNj?=
 =?utf-8?B?WlhmK2FhYkM5SkIzbzlGanpvUzVTYXFpZk94NTBhbGxvUHhGSEFvem5ZUzBS?=
 =?utf-8?B?dCtkc2FEaGZpYUt5clFQd3VQUEN3OU9XWExGSVZvN0pHeWppeHpBZ092RTVq?=
 =?utf-8?B?WG9TVW1ESWl4Q3hXUTlqM3pKYVVvR2xxVm1xODBQdlQ5UjVSUnJtSGhqU2w5?=
 =?utf-8?B?UnNUNEordjdOL0hQL05yTzRlVlRHSXhiTWx5R0tMV2F2alhWRTBvb21pK2hD?=
 =?utf-8?B?aEM2ZUczbXVyTEhWMjZPcHM0OEVhdXptdFRwTUVGc2dYN1pDcmczaVBsMTRY?=
 =?utf-8?B?VTZsZGk2aHdkT1dac0Q5Tk1VQjZ0c2R4NDlnWWJXWWNVVlJQTkc3OU1RL09Q?=
 =?utf-8?B?SFloa1B6SlFwazNMYW9YVVdUS0diak9hdm56bGlFcEhVdCtRYnJSYllrRFE3?=
 =?utf-8?B?Nm9HcHlWMzJMemRMZWd1RWdKOG1IQVo3bTgwNnhMMVo2Wklxbkw0Q3BTclFV?=
 =?utf-8?B?aytlekJKK3dVcGR6WWpIeUVJQ3Y0ZjdnZmMwQzZsNVhLQTgxRm91SmUvc2Vq?=
 =?utf-8?B?UmxoZlZzaVpmRW44LzRncEd1MTMrYXk1QVVHVEkzZW9BY2x5cDI2cUdYRTNQ?=
 =?utf-8?B?OVFsMFFjZWl1cEw2MGwvend1cnlDazZOY0tidDd3blZKVm0zU1F4NVNENHk1?=
 =?utf-8?B?NHF4Wk5sTGJsK1FYQ0QzQ0EzZlh6Rms4ckloRVEzUDJCbUd1RjBBUyszamd5?=
 =?utf-8?B?eCsyeDlIK1FzTlFjOTVWaVN4RHFFY0x5eFgwTGpCMWhzcWVRYWRXNDYvODY3?=
 =?utf-8?B?U3ozaWpCclYzczlZVDdmM0ZHQzBLZmpnc1VUY3VVQjlsNjVyVnd5SFVFTlN1?=
 =?utf-8?B?Lzg1L3M4V2NybXBSTW5PbmJZeGtJVDlhZFd6dEFQSUZ5eWQ0S1FZSDNyWUFP?=
 =?utf-8?B?ZGtWb0RxOHVsQlo2SitMQ0dXSUtDOCsxSkoyOWFaRGRiYVB3RTFNYktvRjMx?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B210943355EC4C4586D6E89864D42CCB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3313911-bd46-4daa-0385-08dd66de6221
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 12:05:47.1005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hGsW1RtgXKEHubVPNAsOZqVTpY2WXPbFWeprdLV/ZkJzaapvp4N+9FQEOv8GBq9BLbkiMjTG65zRju7SFdZwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9625

T24gMTguMDMuMjUgMTY6MjYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOC4wMy4yMDI1IDE0
OjMxLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IE9uIDE4LjAzLjI1IDEyOjExLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxOC4wMy4yMDI1IDEwOjEwLCBNeWt5dGEgUG90dXJhaSB3cm90
ZToNCj4+Pj4gT24gMTUuMDEuMjQgMTE6MzUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24g
MTQuMDEuMjAyNCAxMTowMSwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+Pj4+Pj4gLS0tIGEveGVu
L2luY2x1ZGUvcHVibGljL2h2bS9kbV9vcC5oDQo+Pj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVi
bGljL2h2bS9kbV9vcC5oDQo+Pj4+Pj4gQEAgLTQ0NCw2ICs0NDQsMTcgQEAgc3RydWN0IHhlbl9k
bV9vcF9ucl92Y3B1cyB7DQo+Pj4+Pj4gICAgIH07DQo+Pj4+Pj4gICAgIHR5cGVkZWYgc3RydWN0
IHhlbl9kbV9vcF9ucl92Y3B1cyB4ZW5fZG1fb3BfbnJfdmNwdXNfdDsNCj4+Pj4+Pg0KPj4+Pj4+
ICsjZGVmaW5lIFhFTl9ETU9QX2luamVjdF9tc2kyIDIxDQo+Pj4+Pj4gKyNkZWZpbmUgWEVOX0RN
T1BfTVNJX1NPVVJDRV9JRF9WQUxJRCAoMXUgPDwgMCkNCj4+Pj4+PiArDQo+Pj4+Pj4gK3N0cnVj
dCB4ZW5fZG1fb3BfaW5qZWN0X21zaTIgew0KPj4+Pj4+ICsgICAgdWludDY0X2FsaWduZWRfdCBh
ZGRyOw0KPj4+Pj4+ICsgICAgdWludDMyX3QgZGF0YTsNCj4+Pj4+PiArICAgIHVpbnQzMl90IHNv
dXJjZV9pZDsgLyogUENJIFNCREYgKi8NCj4+Pj4+DQo+Pj4+PiBTaW5jZSB0aGUgY29tbWVudCBz
YXlzIFNCREYgKG5vdCBCREYpLCBob3cgYXJlIG11bHRpcGxlIHNlZ21lbnRzIGhhbmRsZWQNCj4+
Pj4+IGhlcmU/IEF0IGxlYXN0IG9uIHg4NiAoVlQtZCBhbmQgVi1pKSBzb3VyY2UgSURzIGFyZSBv
bmx5IDE2IGJpdHMgaWlyYywNCj4+Pj4+IGFuZCBhcmUgbG9jYWwgdG8gdGhlIHJlc3BlY3RpdmUg
c2VnbWVudC4gSXQgd291bGQgZmVlbCB3cm9uZyB0byB1c2UgYQ0KPj4+Pj4gMzItYml0IHF1YW50
aXR5IHRoZXJlOyBJT1cgSSdkIHJhdGhlciBzZWUgdGhpcyBhcyBiZWluZyB0d28gMTYtYml0IGZp
ZWxkcw0KPj4+Pj4gKHNlZ21lbnQgYW5kIHNvdXJjZV9pZCkuDQo+Pj4+DQo+Pj4+IEknbSBwbGFu
bmluZyBvbiByZXN1bWluZyB0aGlzIHNlcmllcyBpbiB0aGUgbmVhciBmdXR1cmUgYW5kIHdhbnQg
dG8NCj4+Pj4gY2xhcmlmeSB0aGUgRE0gb3AgaW50ZXJmYWNlLg0KPj4+Pg0KPj4+PiBXb3VsZG4n
dCBpdCBiZSBiZXR0ZXIgdG8ga2VlcCB0aGluZ3MgY29uc2lzdGVudCBhbmQgdXNlDQo+Pj4+IFhF
Tl9ETU9QX1BDSV9TQkRGIGFzIGl0J3MgZG9uZSBpbiB4ZW5fZG1fb3BfaW9yZXFfc2VydmVyX3Jh
bmdlPyBBbHNvDQo+Pj4+IHdpdGggdGhpcywgdGhlIHZhbHVlIGNhbiBiZSBlYXNpbHkgY2FzdGVk
IHRvIHBjaV9zYmRmX3QgbGF0ZXIgYW5kIHNwbGl0DQo+Pj4+IHRvIHNlZ21lbnQgYW5kIEJERiBp
ZiBuZWVkZWQuDQo+Pj4NCj4+PiBUaGUgZXNzZW5jZSBvZiBteSBlYXJsaWVyIGNvbW1lbnQgaXM6
IE5hbWluZywgY29udGVudHMsIGFuZCBjb21tZW50cyBuZWVkDQo+Pj4gdG8gYmUgaW4gc3luYy4N
Cj4+Pg0KPj4+IEkgcXVlc3Rpb24gdGhvdWdoIHRoYXQgImNhc3RpbmcgdG8gcGNpX3NiZGZfdCIg
aXMgdGVjaG5pY2FsbHkgcG9zc2libGUuDQo+Pj4gTm9yIGFtIEkgY29udmluY2VkIHRoYXQgaXQg
d291bGQgYmUgZGVzaXJhYmxlIHRvIGRvIHNvIGlmIGl0IHdhcyBwb3NzaWJsZQ0KPj4+IChvciBp
ZiAiY2FzdGluZyIgd2FzIGludGVuZGVkIHRvIG1lYW4gc29tZXRoaW5nIGVsc2UgdGhhbiB3aGF0
IHRoaXMgaXMgaW4NCj4+PiBDKS4gU2VlIG15IHJlY2VudCBjb21tZW50cyBvbiBzb21lIG9mIEFu
ZHJpaSdzIHBhdGNoZXMgWzFdWzJdLg0KPj4+DQo+Pj4gSmFuDQo+Pj4NCj4+PiBbMV0gaHR0cHM6
Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjUtMDMvbXNnMDEyOTQu
aHRtbA0KPj4+IFsyXSBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2
ZWwvMjAyNS0wMy9tc2cwMTMwMS5odG1sDQo+Pg0KPj4gV291bGQgc29tZXRoaW5nIGxpa2UgdGhp
cyBiZSBva2F5IHRoZW4/DQo+Pg0KPj4gc3RydWN0IHhlbl9kbV9vcF9pbmplY3RfbXNpMiB7DQo+
PiAgICAgICAvKiBJTiAtIE1TSSBkYXRhIChsb3dlciAzMiBiaXRzKSAqLw0KPj4gICAgICAgdWlu
dDMyX3QgZGF0YTsNCj4+ICAgICAgIC8qIElOIC0gSVRTIGRldmlkIG9mIHRoZSBkZXZpY2UgdHJp
Z2dlcmluZyB0aGUgaW50ZXJydXB0ICovDQo+PiAgICAgICB1aW50MzJfdCBzb3VyY2VfaWQ7DQo+
PiAgICAgICB1aW50MzJfdCBmbGFnczsNCj4+ICAgICAgIHVpbnQzMl90IHBhZDsNCj4+ICAgICAg
IC8qIElOIC0gTVNJIGFkZHJlc3MgKi8NCj4+ICAgICAgIHVpbnQ2NF9hbGlnbmVkX3QgYWRkcjsN
Cj4+IH07DQo+Pg0KPj4gQWRkZWQgcGFkZGluZyBhbmQgZXhwbGFpbmVkIHNvdXJjZV9pZCBwdXJw
b3NlIGJldHRlci4NCj4NCj4gSSBmZWFyIHRoZSBjb21tZW50IGlzIGZhciBmcm9tIG1ha2luZyBj
bGVhciB3aGF0IGxheW91dCBzb3VyY2VfaWQgaXMgdG8NCj4gaGF2ZSwgaGVuY2UgYWxzbyBsZWF2
aW5nIG9wZW4gd2hldGhlciBhIHNlZ21lbnQgbnVtYmVyIGlzIGluY2x1ZGVkIHRoZXJlLg0KPiBP
ZiBjb3Vyc2UgdGhlIGlzc3VlIGhlcmUgbWF5IGJlIHRoYXQgSSBoYXZlIG5vIGNsdWUgd2hhdCAi
SVRTIGRldmlkIg0KPiBtZWFucyBvciBpbXBsaWVzLiBXaGF0IGlzIGNsZWFyIGlzIHRoYXQgIklU
UyBkZXZpZCIgaXMgbWVhbmluZ2xlc3Mgb24NCj4geDg2LCBmb3IgZXhhbXBsZS4NCg0KSVRTIGRl
dmlkIGlzIGltcGxlbWVudGF0aW9uIGRlZmluZWQuIEl0cyBzaXplIGlzIGFsc28gaW1wbGVtZW50
YXRpb24NCmRlZmluZWQgYnV0IHVwIHRvIDMyIGJpdHMuDQoNClF1b3RlcyBmcm9tIEFybSBCYXNl
IFN5c3RlbSBBcmNoaXRlY3R1cmVbMV06DQogPiBUaGUgc3lzdGVtIGRlc2lnbmVyIGFzc2lnbnMg
YSByZXF1ZXN0ZXIgYSB1bmlxdWUgU3RyZWFtSUQgdG8gZGV2aWNlDQp0cmFmZmljIGlucHV0IHRv
IHRoZSBTTU1VLg0KID4gSWYgYSByZXF1ZXN0ZXIgaXMgYSBicmlkZ2UgZnJvbSBhIGRpZmZlcmVu
dCBpbnRlcmNvbm5lY3Qgd2l0aCBhbg0Kb3JpZ2luYXRvciBJRCwgbGlrZSBhIFBDSWUgUmVxdWVz
dGVySUQsIGFuZCBkZXZpY2VzIG9uIHRoYXQgaW50ZXJjb25uZWN0DQptaWdodCBuZWVkIHRvIHNl
bmQgTVNJcywgdGhlIG9yaWdpbmF0b3IgSUQgaXMgdXNlZCB0byBnZW5lcmF0ZSBhDQpEZXZpY2VJ
RC4gVGhlIGZ1bmN0aW9uIHRvIGdlbmVyYXRlIHRoZSBEZXZpY2VJRCBzaG91bGQgYmUgYW4gaWRl
bnRpdHkgb3INCmEgc2ltcGxlIG9mZnNldC4NCg0KT24gdGhlIFhlbidzIHNpZGUgaXQgaXMgdXNl
ZCBhcyBhbiBvZmZzZXQgaW50byB0aGUgSVRTIHRyYW5zbGF0aW9uDQp0YWJsZXMgYW5kIGlzIHNv
dXJjZWQgZnJvbSBtc2ktbWFwIG5vZGVzIGluIHRoZSBkZXZpY2UgdHJlZS4NCg0KUHJhY3RpY2Fs
bHkgZm9yIFBDSSB0aGUgcmVxdWVzdGVyIElEIGlzIHVzdWFsbHkgdGhlIFNCREYuIFdoZXJlIHRo
ZQ0Kc2VnbWVudCBpcyB1c2VkIHRvIGZpbmQgdGhlIGhvc3QgYnJpZGdlIG5vZGUgdGhhdCBjb250
YWlucyB0aGUgbXNpLW1hcA0Kbm9kZSB3aXRoIGRlZmluZWQgb2Zmc2V0cyBidXQgaXQgaXMgYWxz
byBpbmNsdWRlZCBhcyBwYXJ0IG9mIGFuIGlkLg0KVGhhdCdzIHdoeSBpdCB3YXMgb3JpZ2luYWxs
eSBjYWxsZWQgU0JERiBpbiB0aGUgY29tbWVudC4gSSBkb24ndCBrbm93IGlmDQp0aGVyZSBpcyBh
IGJldHRlciB3YXkgdG8gZGVzY3JpYmUgd2hhdCBpdCBpcyBjb25jaXNlbHkgaW4gdGhlIGNvbW1l
bnRzLg0KDQo+IEknbSBmdXJ0aGVyIHB1enpsZWQgYnkgIihsb3dlciAzMiBiaXRzKSIgLSBpc24n
dCB0aGUgZGF0YSB3cml0dGVuIHRvDQo+IHRyaWdnZXIgYW4gTVNJIGFsd2F5cyBhIDMyLWJpdCBx
dWFudGl0eT8NCj4NCj4gSmFuDQoNCkhtbSwgaXQgYWN0dWFsbHkgaXMsIEkgY29waWVkIHRoaXMg
bGluZSBmcm9tIHhlbl9kbV9vcF9pbmplY3RfbXNpLCBub3QNCnN1cmUgd2h5IGl0IGlzIHNwZWNp
ZmllZCBsaWtlIHRoYXQgdGhlcmUuIEJ1dCBJJ2xsIHJlbW92ZSB0aGlzIHBhcnQuDQoNClsxXTog
aHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0aW9uL2RlbjAwOTQvbGF0ZXN0Lw0K
DQotLQ0KTXlreXRhDQo=

