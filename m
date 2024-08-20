Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896A8957E39
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 08:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780054.1189637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgIR2-0002tq-GV; Tue, 20 Aug 2024 06:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780054.1189637; Tue, 20 Aug 2024 06:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgIR2-0002ra-DV; Tue, 20 Aug 2024 06:33:40 +0000
Received: by outflank-mailman (input) for mailman id 780054;
 Tue, 20 Aug 2024 06:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ZGS=PT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sgIR1-0002rU-EI
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 06:33:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2416::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 214a907a-5ebe-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 08:33:38 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 06:33:33 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 06:33:33 +0000
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
X-Inumbo-ID: 214a907a-5ebe-11ef-a507-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKSnX0TzAgPXmjJ0Y9bcxUC9o92zvlQFW2Uqla5Hqq6Ij4JHygDgFt60t3KA1alIJaRbnCoGIL58VcGL40a//Gb45nXnoYP4wqvlTaaEctD9R+ssR9QJ4KOUMnUKb68bZGoUMBhFoHUx/NtiJxwcUYR8Qk3jizfmQ9P7NYjTx52rstp36cH+G2kjj80hkw1/6cyofIqkqwc3CR4fCBRV3IHQpVUal0veia30w+/GycIL7lxH7zq8H5tU/JkAQ7xQxHPd+Xb8Nq5MJ/b7wn9y30ZvZRkCy1PN2+HDix+nbsSklaYncm5FffyrsTM4mjrztqF3hGf71DdhU6NOzAwA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kh7cCiK6Ta3Gnc9+wwVgS8cbB8QkdG06mbiynabn1qo=;
 b=o/zVqNZTiCgPK8pYLDiLxlrlYg/bjCLaaT04YhoGjwA3FE24aXcqSjDEoialVcjqNn1n1QaenXqkIEi40hfQjcTlkR9EoxOqB+B17Dnp4olOUipqQ2OtdN16HJHfHIv59vz5l+YgaYx9a7QJh6T8lvubFqIA1zwP+CQ5BnQ+L6t77mItk7MVr+mkZNu6tvuz20NlZbhe7wqWfWavdPeQ/TwBaCbI9CXb9AS/p2wf9HTFzAIRLMDpfRkHpU/9nHSjxD+c5Qkkn1tAt72XXEhog10sllbVQTvYRqhUIbsB1yKmA/fDOBhbsLF0ZJfvnlc01Dy1EeNDwII9B/ZSBiyxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh7cCiK6Ta3Gnc9+wwVgS8cbB8QkdG06mbiynabn1qo=;
 b=V+oflCUA7/uT7f+o336aJcDjU5LTTO6fWPbihEtJUylpLD+vJM7ZTaGLI1xfnxR5X9JkQOprjjCNxsSmvguXYNjteC7yqyCk7xp0ZHORMVbOLA0uDjkWXJIG14Fx9b1VsfG+yNWXBKO7ALUGpGJoBlwXSOqBFo6w9nxc8JqnW3o=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <gwd@xenproject.org>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony@xenproject.org>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v13 3/6] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Topic: [XEN PATCH v13 3/6] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Index: AQHa78yvTwlhsUHkMUeYQ1q1oq6CvbIuUVKAgAHlWYA=
Date: Tue, 20 Aug 2024 06:33:33 +0000
Message-ID:
 <BL1PR12MB58496D2638998EC4DC2572C8E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-4-Jiqian.Chen@amd.com>
 <745cd8cc-59c2-44b8-b42b-1e5e0b3026ca@suse.com>
In-Reply-To: <745cd8cc-59c2-44b8-b42b-1e5e0b3026ca@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7875.019)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|LV8PR12MB9359:EE_
x-ms-office365-filtering-correlation-id: 827fa651-bd36-473c-7cbb-08dcc0e20388
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bUVwREFmYVZ2TyszZlBiUUxjYU56WEtLdmNpU01iNEZVTzdsbGZyVVpxZ2JF?=
 =?utf-8?B?WFE0R0JkOTNhREZQb0dEdS95ZzE3Y3BDZVEzb013Snlvc1pzNC9CZ0hINk9S?=
 =?utf-8?B?dEg0aWhCc1h3SGFhMzQ1RG9WN2pJK1crNU55MVpnUlIyeUU5M1dFcjNTSHFN?=
 =?utf-8?B?V1l3bmVGdE9lQ2xub0sveEh4RHNTZmZRL0llalNJV0lmeTJjNW95Nk5yaXI1?=
 =?utf-8?B?c3d2MjJSSjJOVEpicU5vRWlvK1BnU3ZpVkFxN3M1cGlmK3VUdXVQRzNPQVZq?=
 =?utf-8?B?M0hHY3JWb1lNNFkzQ2Q1aElTRTM2TXlIeC9BVlp6ZHdhMjFmeHFiRDN0STVX?=
 =?utf-8?B?SGpwQm5VMTcvSVZ1cVZ5dk9IdlFSWjJLcnBtbUwvTk1KOUdZbXJhTWpWT3BF?=
 =?utf-8?B?dk5NamRMdWxqaHh4eUUyQzVtWFZaL2piUWlGODRQcmo2MWkrVzludEFDTGw4?=
 =?utf-8?B?N2tURHFOdUozUFdpaGhFYjJpWmdtQXRhNTQ1OVFzUzZwOXBEQkhJclNIZ05j?=
 =?utf-8?B?cUZId3NKd2xqM3hiV2VQcjBOOEpndUc1cDM1cWErdWhZcHNuQTYwanpLeFov?=
 =?utf-8?B?dVN2aklENDR0b1ZPUnUyNjBnQWk2YXIzZDR3MkRSbjlnS0JIL0U3N2hjUzhq?=
 =?utf-8?B?NUIrZ2x6OTZLNmkwSkw2b3NUSmJSY3dYa3Yyb1EwTWQzblVNek5xVWVwOGR6?=
 =?utf-8?B?S21ueVo5dXhyd1JnaDNEb25QbTN0bXN2UnJPWTRMdm9GNnZnS3JSUC9tbDBF?=
 =?utf-8?B?MCszYTVtaGplcERiZ2dkcWJScHBUbU1DS0tudzcvYUU1Zi9oOEFsS1dVN0da?=
 =?utf-8?B?U1pOV1lweFFWbkJyckE4ZFBJOTdzR0dYMVRpSE1HZDRiWjNOb20rdHhTVkhL?=
 =?utf-8?B?RENsczY5bmMwUmJpeUx2MkZzNmJveGlYQXBGa1NxT2dSZGFsVjJxR1VxZDV0?=
 =?utf-8?B?ZlYybUkvMU1UTHVqamVSUGtvdEkwZ0FsbmxRazFuM2VtNVJFRC9HemxEY0g3?=
 =?utf-8?B?NlA1bHhGaFI0WENkYUwramN4YnBvc0xQMGJPT3dBdE5qZEZkaTdZL2VwUGw1?=
 =?utf-8?B?eXZwOGZ5TFdBTzN2U3ZZOERFRVdSUnlJS3dJVFFKaGlLRDRocDZNRlRBMzhU?=
 =?utf-8?B?ZHBOTG1LQWtnTENtZ05wM1lCVjdYK0o2NDhiSlBRT3pWNDZDemE3cUxXVzVI?=
 =?utf-8?B?UUhrTG16WDNhdDZQTmtWRlg1em9iVllrenBtWjJDa29VRFZXMVhaNEZKQ2dN?=
 =?utf-8?B?M3VLNVJSTDkySnoyTlV2NHJ1T2RwMlhvQXEwWlVRZkFXWWoxRHlWMGYwakZn?=
 =?utf-8?B?QThzMkJwQUNhTVRxMGFvcUFKMkNBeUNHUUh3V3RrVTd2eVduK3gzY1J0eWt3?=
 =?utf-8?B?QWREWXBNWVJrSUJWQTdZREFPb1ZDQ0ZXMys5VnpNOWIzdG96YmJOMWIrNUJk?=
 =?utf-8?B?Y2IxZkRNaWZKd2xkbUZXVGtQcy9oVTBVVkpHdjJ0eDM4MFVNUzE1QmkrdThL?=
 =?utf-8?B?d29ZV1BDNWNlSS9JMlNCSDZuNWd6L0RIZ1NQejJiK1QrUWlnVEUrMjdsY0NB?=
 =?utf-8?B?OUl2T0Mza0FZUEtleFFxQ3NpR2g1V0FibktpbzVoT0tReDBuSWg2Z1BlNjdK?=
 =?utf-8?B?NllVNTdJbmNlMFRBQUZINm1XamZyVy9Rd1hnMURkZDBaSWx1UVhKZWJYWjBF?=
 =?utf-8?B?VWR0T3NJZ2xmeGRMdS9jTDlEc0VzaWZYZFoyUWxRS2lWd3pJZjRtSmRHUGdY?=
 =?utf-8?B?WHFlVWNVTHpSSDdLU0NUS0w5eWowYU1UVXhWeGV6TXJHRUV4YlpVM0QzTVVD?=
 =?utf-8?B?SG9iQkN3c0Z5ZXpOSTNwNmRsUjVac2hEaGVVUTNnWklMdnVsdXdlazZpN2Vi?=
 =?utf-8?B?eVNnV1I0cGs1ZVI4ZW9QREVnZ3pOK2dSY2JicGlSY3VFMlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dDJZVVNjRGREbE1ad3BKNkZsaUUvOEFlaDVoSk1oQmIvdzZoRURleXZrbVBp?=
 =?utf-8?B?YXN3a1YwWnQ2STFsNURSUXlxbVpzcDFNdzdNM3kvaERNY0EvZVZ2OWhzWHd4?=
 =?utf-8?B?Yk5PWXJqK2E3T2p1b1dJeXlpUVowTW0yVXdIY1lCM3MwN255Q1RDNHd3QXZL?=
 =?utf-8?B?ODFTaU9qcHVlVk5OeUo0WVVUUmhRNFpwWjhQVStrQlQrbjVJMWticUN1RHpq?=
 =?utf-8?B?QmZuUUoybWVMY3hGWUtvQVlDd0RCTVVONjd3VHduajVCZkxVYm5MaEhoRFlG?=
 =?utf-8?B?bGc1ZjV0SGVFb3IvemI2Nmwvd2VKeng1bzN3cVA2MThpbFBQdlVSS2JoY3dL?=
 =?utf-8?B?RHVqR0FWSTdzeE0yUWNlWGl6TDNmYXBtemNyOE40Vk9PMTZWQ3NkdVB4ZWdG?=
 =?utf-8?B?b2EzeEt4TzNEZWIrVk5Cb01Ka0krR3V4WnpEN0NOaXpDbk1XbUtmV0xaOXpS?=
 =?utf-8?B?NzZpdFc0TEZMUHFWekVEWnhsWGRZN285VnVTZm9kdVB3NWI0RmRoTHkzYTBs?=
 =?utf-8?B?a0dYYmRDNDBoVUI2RCs4Yno2SFZyZDl5aW9MZU1tYk8rWEl5dEJkay91bzFU?=
 =?utf-8?B?Nzh4VzJ5aHg4b0JXQWdmMjdlSDBoVkpzMGRSSThjcVRSUno4YnFDWEgyY3Ay?=
 =?utf-8?B?ZExxUUdPNFFuVnlkTC92ZXZ5Y1p0bmpaVnVrQmZkK05BQkZ0eFlBcWk0WE5D?=
 =?utf-8?B?c2JTcG5KOFNXbk5PYnIwOFRCUVdwVDVacVJxc0V1ZFpMckt5SHhlcFJjc0Rh?=
 =?utf-8?B?RnZFSy80OE00UFhSaVlkUWhveUtwM1NlWnU4Nkt3c3FMV1JSQmtUVk41QkVq?=
 =?utf-8?B?WDE5Y3hkZ1BUd3JpaWZ2R3RpRXVBYytEN0lJN3NYdjFDdjRNY0pkZldZMXlj?=
 =?utf-8?B?WkhOWFBFNHFCR053UU5hQTBka1NpOGlNZUtJaGRsR2p0L2RmSk1NK0U0L2Jx?=
 =?utf-8?B?azRKOEtHZGlXb1d3NDdFYnovWllQK1pveVp5NU1LTFN5MEZHL21vMiszbFRo?=
 =?utf-8?B?dUR0bldtQnlHcS8vOEpEZDM4c245SEpoQUdJU1lNZEpJTTRaSHRGYi9ETUJ4?=
 =?utf-8?B?K00xTDRTTC9YNjl2NWNhRFJFVC9MbUh5SnRNc3ZYWU83YXFGWGhmd1FZWVRI?=
 =?utf-8?B?K1diSHlmRVpiZUVWV01DRG80RDV5NytZWEw5a2tOdmdIUzlvWFZjbEV6dWhu?=
 =?utf-8?B?dmtnckFLMDFDNmlnYnZSTW9Kbzd2VXdmSnFPNWhyeUFZUWlmYnI5bnMwdE9X?=
 =?utf-8?B?QXdoUmNzcW82WW9FQVpPMG9NWkNPeWpLbmZVeTNheDV4WmZZSjB5U3BWbjgy?=
 =?utf-8?B?TkQxVXo5Y0k4TE40M1J5dGJQandmdDhYam84bmR6VXNmRWt2M3lTQXhBK0Nt?=
 =?utf-8?B?REJqVGg3Q3BuSDdhZUR2RHIzL3V6SkNxZkJENExwRmN1eHVnekNwV0NXeVBT?=
 =?utf-8?B?MzZ0MnEzb241WHFnS291M3B5dUxqay9LOW5HL2RHRzVhSUw1QWRQNk42eElW?=
 =?utf-8?B?UkpUTE5jZWdiYjFXZDJuRU15d2NvNnhGbFFiRkhmUlovOHJUVGJNaVkvd3hV?=
 =?utf-8?B?UmxQckNtQXJOZ252eW5aNWFwRHh4UE5LOXpwV2pPZENTdGVUZ2NST00zdTc1?=
 =?utf-8?B?MWRVMWJBTHNDR2RUa3BhS3pkdThFQnRHQ2Q0OUd0YUg4SVN4b3EyUndTVmNE?=
 =?utf-8?B?QVJCbFd3UVVVQ2taTUpITk5OSi9TT3BuUWtVcU1RN1ROalRDSFcxdUdkcC9Y?=
 =?utf-8?B?M0RGa3huMm9FanhYdE9uOWZVaC9oS3picjB4eHkwMWZkNlBTdGdTYTlySGho?=
 =?utf-8?B?TjZyNmRJdnBmZTVKd3p1dVhlWlNnTkdiRXRqMThKd0l1bDBOSHBVZzltQ0Jq?=
 =?utf-8?B?dFNUTkZqSEJ4SzNLV1M2UzczMFdZWktDOHNLcmkxWHdBNkw2VG13WURSclFV?=
 =?utf-8?B?MnA1WEpMdjQzMHNFN3dCcWxTT0ZJV2FqOFEvRy9VVHVVM0JyQ0VZOEU3VERa?=
 =?utf-8?B?NStrcmVWNzZaNlMxWWptTjNTRGZCV3kyMERrNDI5ZDMwWGZFVklHdmpTTjFl?=
 =?utf-8?B?ZGhiKzdDVDFRNk1uN2RkQWozQzR0Qng1anJZbUZKRi85R2ZjcWxGVDJnODVG?=
 =?utf-8?Q?/N2w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9790E69F24ADD342941397D5866BC528@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827fa651-bd36-473c-7cbb-08dcc0e20388
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 06:33:33.4055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DV/3F3AVM/bOS/2ZN+i6L07yoxrroCfCJGOD8igDoh1PhndJAn6HCKRiGRSXUGJKDjQoV7xftzOUyor01Sa3Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359

T24gMjAyNC84LzE5IDE3OjE2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMDguMjAyNCAx
MzowOCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBUaGUgZ3NpIG9mIGEgcGFzc3Rocm91Z2ggZGV2
aWNlIG11c3QgYmUgY29uZmlndXJlZCBmb3IgaXQgdG8gYmUNCj4+IGFibGUgdG8gYmUgbWFwcGVk
IGludG8gYSBodm0gZG9tVS4NCj4+IEJ1dCBXaGVuIGRvbTAgaXMgUFZILCB0aGUgZ3NpcyBtYXkg
bm90IGdldCByZWdpc3RlcmVkKHNlZSBiZWxvdw0KPj4gY2xhcmlmaWNhdGlvbiksIGl0IGNhdXNl
cyB0aGUgaW5mbyBvZiBhcGljLCBwaW4gYW5kIGlycSBub3QgYmUNCj4+IGFkZGVkIGludG8gaXJx
XzJfcGluIGxpc3QsIGFuZCB0aGUgaGFuZGxlciBvZiBpcnFfZGVzYyBpcyBub3Qgc2V0LA0KPj4g
dGhlbiB3aGVuIHBhc3N0aHJvdWdoIGEgZGV2aWNlLCBzZXR0aW5nIGlvYXBpYyBhZmZpbml0eSBh
bmQgdmVjdG9yDQo+PiB3aWxsIGZhaWwuDQo+Pg0KPj4gVG8gZml4IGFib3ZlIHByb2JsZW0sIG9u
IExpbnV4IGtlcm5lbCBzaWRlLCBhIG5ldyBjb2RlIHdpbGwNCj4+IG5lZWQgdG8gY2FsbCBQSFlT
REVWT1Bfc2V0dXBfZ3NpIGZvciBwYXNzdGhyb3VnaCBkZXZpY2VzIHRvDQo+PiByZWdpc3RlciBn
c2kgd2hlbiBkb20wIGlzIFBWSC4NCj4+DQo+PiBTbywgYWRkIFBIWVNERVZPUF9zZXR1cF9nc2kg
aW50byBodm1fcGh5c2Rldl9vcCBmb3IgYWJvdmUNCj4+IHB1cnBvc2UuDQo+Pg0KPj4gQ2xhcmlm
eSB0d28gcXVlc3Rpb25zOg0KPj4gRmlyc3QsIHdoeSB0aGUgZ3NpIG9mIGRldmljZXMgYmVsb25n
IHRvIFBWSCBkb20wIGNhbiB3b3JrPw0KPj4gQmVjYXVzZSB3aGVuIHByb2JlIGEgZHJpdmVyIHRv
IGEgbm9ybWFsIGRldmljZSwgaXQgdXNlcyB0aGUgbm9ybWFsDQo+PiBwcm9iZSBmdW5jdGlvbiBv
ZiBwY2kgZGV2aWNlLCBpbiBpdHMgY2FsbHN0YWNrLCBpdCByZXF1ZXN0cyBpcnENCj4+IGFuZCB1
bm1hc2sgY29ycmVzcG9uZGluZyBpb2FwaWMgb2YgZ3NpLCB0aGVuIHRyYXAgaW50byB4ZW4gYW5k
DQo+PiByZWdpc3RlciBnc2kgZmluYWxseS4NCj4+IENhbGxzdGFjayBpcyhvbiBsaW51eCBrZXJu
ZWwgc2lkZSkgcGNpX2RldmljZV9wcm9iZS0+DQo+PiByZXF1ZXN0X3RocmVhZGVkX2lycS0+IGly
cV9zdGFydHVwLT4gX191bm1hc2tfaW9hcGljLT4NCj4+IGlvX2FwaWNfd3JpdGUsIHRoZW4gdHJh
cCBpbnRvIHhlbiBodm1lbXVsX2RvX2lvLT4NCj4+IGh2bV9pb19pbnRlcmNlcHQtPiBodm1fcHJv
Y2Vzc19pb19pbnRlcmNlcHQtPg0KPj4gdmlvYXBpY193cml0ZV9pbmRpcmVjdC0+IHZpb2FwaWNf
aHdkb21fbWFwX2dzaS0+IG1wX3JlZ2lzdGVyX2dzaS4NCj4+IFNvIHRoYXQgdGhlIGdzaSBjYW4g
YmUgcmVnaXN0ZXJlZC4NCj4+DQo+PiBTZWNvbmQsIHdoeSB0aGUgZ3NpIG9mIHBhc3N0aHJvdWdo
IGRldmljZSBjYW4ndCB3b3JrIHdoZW4gZG9tMA0KPj4gaXMgUFZIPw0KPj4gQmVjYXVzZSB3aGVu
IGFzc2lnbiBhIGRldmljZSB0byBwYXNzdGhyb3VnaCwgaXQgdXNlcyB0aGUgc3BlY2lmaWMNCj4+
IHByb2JlIGZ1bmN0aW9uIG9mIHBjaWJhY2ssIGluIGl0cyBjYWxsc3RhY2ssIGl0IGRvZXNuJ3Qg
aW5zdGFsbCBhDQo+PiBmYWtlIGlycSBoYW5kbGVyIGR1ZSB0byB0aGUgSVNSIGlzIG5vdCBydW5u
aW5nLiBTbyB0aGF0DQo+PiBtcF9yZWdpc3Rlcl9nc2kgb24gWGVuIHNpZGUgaXMgbmV2ZXIgY2Fs
bGVkLCB0aGVuIHRoZSBnc2kgaXMgbm90DQo+PiByZWdpc3RlcmVkLg0KPj4gQ2FsbHN0YWNrIGlz
KG9uIGxpbnV4IGtlcm5lbCBzaWRlKSBwY2lzdHViX3Byb2JlLT5wY2lzdHViX3NlaXplLT4NCj4+
IHBjaXN0dWJfaW5pdF9kZXZpY2UtPiB4ZW5fcGNpYmtfcmVzZXRfZGV2aWNlLT4NCj4+IHhlbl9w
Y2lia19jb250cm9sX2lzci0+aXNyX29uPT0wLg0KPiANCj4gU286IFVuZGVybHlpbmcgWFNBLTQ2
MSB3YXMgdGhlIG9ic2VydmF0aW9uIHRoYXQgdGhlIHZlcnkgbGltaXRlZCBzZXQgb2YNCj4gY2Fz
ZXMgd2hlcmUgdGhpcyBmYWtlIElSUSBoYW5kbGVyIGlzIGluc3RhbGxlZCBpcyBhbiBpc3N1ZS4g
VGhlIHByb2JsZW0NCj4gb2YgZGVhbGluZyB3aXRoICJmYWxzZSIgSVJRcyB3aGVuIGEgbGluZS1i
YXNlZCBpbnRlcnJ1cHQgaXMgc2hhcmVkDQo+IGJldHdlZW4gZGV2aWNlcyBhZmZlY3RzIGFsbCBw
YXJ0aWVzLCBub3QganVzdCBEb20wIGFuZCBub3QganVzdCBQVg0KPiBndWVzdHMuIFRoZXJlZm9y
ZSBhbiBhbHRlcm5hdGl2ZSB0byB0aGUgaW50cm9kdWN0aW9uIG9mIGEgbmV3IGh5cGVyY2FsbA0K
PiB3b3VsZCBiZSB0byBzaW1wbHkgbGV2ZXJhZ2UgdGhhdCB0aGUgaW5zdGFsbGF0aW9uIG9mIHN1
Y2ggYSBoYW5kbGVyDQo+IHdpbGwgbmVlZCB3aWRlbmluZyBhbnl3YXkuDQo+IA0KPiBIb3dldmVy
LCB0aGUgaW5zdGFsbGF0aW9uIG9mIHNhaWQgaGFuZGxlciBwcmVzZW50bHkgYWxzbyBvY2N1cnMg
aW4NCj4gY2FzZXMgd2hlcmUgaXQncyBub3QgcmVhbGx5IG5lZWRlZCAtIHdoZW4gdGhlIGxpbmUg
aXNuJ3Qgc2hhcmVkLiBUaHVzLA0KPiBpZiB0aGUgaGFuZGxlciByZWdpc3RyYXRpb24gd291bGQg
YWxzbyBiZSBlbGltaW5hdGVkIHdoZW4gaXQncyBub3QNCj4gcmVhbGx5IG5lZWRlZCwgd2UnZCBi
ZSBiYWNrIHRvIG5lZWRpbmcgYSBzZXBhcmF0ZSBoeXBlcmNhbGwuDQo+IA0KPiBTbyBJIHRoaW5r
IGZpcnN0IG9mIGFsbCBpdCBuZWVkcyBkZWNpZGluZyB3aGF0IGlzIGdvaW5nIHRvIGJlIGRvbmUg
aW4NCj4gTGludXgsIGF0IGxlYXN0IGluIHBjaWJhY2sgKGFzIGhlcmUgd2UgY2FyZSBhYm91dCB0
aGUgRG9tMCBjYXNlIG9ubHkpLg0KQWdyZWUsIHNvIHRoZSBjdXJyZW50IG9wdGlvbnMgYXJlIGVp
dGhlciB0byB1c2UgaHlwZXJjYWxsIChQSFlTREVWT1Bfc2V0dXBfZ3NpKSBvciB0byBpbnN0YWxs
IGZha2UgSVJRIGhhbmRsZXIgaW4gcGNpYmFjay4NClNvLCB3ZSBtYXkgbmVlZCB0aGUgaW5wdXRz
IGZyb20gdGhlIE1haW50YWluZXJzIG9uIExpbnV4IHNpZGUuDQpIaSBTdGVmYW5vIGFuZCBKdWVy
Z2VuLCB3aGF0IGFib3V0IHlvdXIgb3BpbmlvbnM/DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3Qg
cmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

