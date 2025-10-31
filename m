Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBDFC24E8F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 13:04:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154232.1484317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEnrk-0002qq-Bf; Fri, 31 Oct 2025 12:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154232.1484317; Fri, 31 Oct 2025 12:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEnrk-0002oH-8p; Fri, 31 Oct 2025 12:04:24 +0000
Received: by outflank-mailman (input) for mailman id 1154232;
 Fri, 31 Oct 2025 12:04:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zurH=5I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1vEnri-0002oB-Ob
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 12:04:22 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc660c9e-b651-11f0-9d16-b5c5bf9af7f9;
 Fri, 31 Oct 2025 13:04:21 +0100 (CET)
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com (2603:10a6:5:34::10) by
 DB3PR0302MB9260.eurprd03.prod.outlook.com (2603:10a6:10:434::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 12:04:18 +0000
Received: from DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3]) by DB7PR03MB4140.eurprd03.prod.outlook.com
 ([fe80::e16e:b655:974f:43f3%6]) with mapi id 15.20.9275.011; Fri, 31 Oct 2025
 12:04:18 +0000
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
X-Inumbo-ID: bc660c9e-b651-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahUmKpIYlJOKck9iq5fMGfFckzvcDfOXSzB8cq9aaiHg9naSO0vd6eai4EoKBiyQO4Kh28rzvOaIJ3kfY2Nvv1VI3dr18pOHKUh+mlNnS2z3bNrTC9SqdB9atfd5kPVZIgleMQOdSmd6wuw9cToPIop0GUZXWaQs2Fg/6m69URMeuWArW6ai9OM6g7afa0UFaSj0AMtYgp3RFwf5Dm2pN/swgxg/0J28eyT5tmOg82j1mZm46Ge9cZELN3uFSTEFbhhJYpsmHx1hzmqXdEyCYdnUN1jMy8h/gya1orUxNaCLY1wofYW3TkAQ113XV89o06er0QrZap3cj5rYmTOrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1ws0XCJrVo2C6Slku35u4NK+hyY9C9/vymcCOHaMA0=;
 b=XWYdPdbDtkbNTrQcnxSUjIi79Ll1x+fpuAvuahbVnrdlt+fjG39aXZXpltlHt90KuU86Qg3Qzx3ui9iUtZcbxKBP+4LCmanoj9y9HkBmtTs+NjwcJEgLa8ueN+Cv+wLisdXsXLoFo2KMeXv6NHZckbdl6wnwrEhaphusbXF78DJ59SYatrG5mwXpC7WFxGqxYGZbAM7/fAyCmdE1r0EYKAKMqclIQ6CMT0vWxaT1LJGD6z1bD17TEYJk8NjoZkngN+iwk1We+VQZeasWyuN8Y2odEkU+NkQFmshupYnPV7yXE0xock/gIZGWicGNcdJ+3ypKCskZtirMd+DF2+LKsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1ws0XCJrVo2C6Slku35u4NK+hyY9C9/vymcCOHaMA0=;
 b=gsJb8Da3/DfZGu4cuJrMHBq4ZsD2zak692u6wjphxGecBRlDhlneW1MakVzujfpWtKGwk8xsXwiUa4+Ca4P6ME2nsxXSkFKZ40TQEURN2flbxresqk+DtLmMs4muE90hYNjpeuAAyvh5UnrC17xRSk5i0c4wf0U95aczeJ8h5jiw1atI/xlPlqlW58JblhROwn22ecFsJou+p8gyIipDNGQRhcIr/MxZn0Dh62g+iGus7cdeL2GGSeNQmNImcrxf6cDF2mYCrhEBUQEvqolxbOugLBKJFORD9uCTe9OGefusGoJRCbD3k2QlZiJcHtZ8yLoQLTmaDC8hP9ZgzpOH0w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] kconfig: remove references to
 docs/misc/kconfig{,-language}.txt files
Thread-Topic: [PATCH] kconfig: remove references to
 docs/misc/kconfig{,-language}.txt files
Thread-Index: AQHcSNlQlJpHEC5jN02048Fc+YbRObTZJjcAgAMFDIA=
Date: Fri, 31 Oct 2025 12:04:18 +0000
Message-ID: <98fc0e0c-f298-4252-8e7d-f49af56146b6@epam.com>
References:
 <6f72dcebf5dbb69e9496b7f0ef96198e9bb9f1e9.1761745058.git.dmytro_prokopchuk1@epam.com>
 <9f264a58-9ca2-4323-8f79-edabe70a07a0@suse.com>
In-Reply-To: <9f264a58-9ca2-4323-8f79-edabe70a07a0@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB4140:EE_|DB3PR0302MB9260:EE_
x-ms-office365-filtering-correlation-id: c91ef5fc-30cf-4053-02d1-08de18759e7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|42112799006|1800799024|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?utf-8?B?MHlMRDdiMmNiUWpIZzFUTEVpTlVQRkt1cXFIKzR5dnhWTHQ3d3E0OWtuUUdK?=
 =?utf-8?B?VGF4cmZnNXpSRFFOUXNLKzB3eGZ6TytrcitXN0dvRVZiZkk0SDBGWmhnaTVn?=
 =?utf-8?B?bys1VEJxWmhlb0xmM2RHNFd6ZHBvd0dDNDV2dUppdGtBbXE0dG5wc09tNTg1?=
 =?utf-8?B?WkZjMUVTWkhMSkVBNm9WelczSVh5Sy82VlJBYVpsTFZiVVlTckdrMlYwdkZo?=
 =?utf-8?B?M3pZWStoS2hkRkFDdE1MTnFoUzZldjFybnZlVlViM2thVmVFZWNxM3NqYXZ1?=
 =?utf-8?B?NDRYcGVkbXhtRlhGU1k4bER5QkZXVEpxcVh4eEYzWkJkWncxak1rRXN1QlRC?=
 =?utf-8?B?VGJFWFRiL3VOQ3c1SUk2MHlxVlQrU3I3dEJlcjFSYkkvZEY3ZzZKcU1QQnFZ?=
 =?utf-8?B?aEZJanBSdy9pVUlTK0NFZXA3SjdtbzFiaWp3TDVreGc4RVd3ekJVZmZ3bDBB?=
 =?utf-8?B?SDVCT2pxT3Z3R2lWU0lJM2RNaVBYdUFaeDF4eFcwVVFlaDNtRzRUanJjNnpv?=
 =?utf-8?B?OHEyeXpiZVgvYTVjekRwcGNMcndpb09jczJyNzFtaWM1T2M1UnN2WkRsWkJa?=
 =?utf-8?B?Y3pTZFVYdDQxbE9mRXB2N1o1Zk55eVNSUzRPNm9FQTR0TzJ1L1hCblE1bHRZ?=
 =?utf-8?B?TXYzQnc4YTNSQ0pLTEhhYmMvZFplMyt2VnVublVCRkI3dVdqT3RHbFhobjVp?=
 =?utf-8?B?ZkZRaDZ5bUtwK3l3UXhNeCtSSEdOdGR1NUxlK1ByUzQ0Y2pmNWxxYUR1T0Iz?=
 =?utf-8?B?Q0dPd0VSSnA3NkltK2hwRm5VdlBGdk5Oc2M5RjVmVUxzVHVJMXBzejUySU9o?=
 =?utf-8?B?Zm5pRDd1UHBzN2lRNitFR2tQSVJiS05sUGUvNnpTNlN4b2ZvSnVQRUZRQkhT?=
 =?utf-8?B?RzVzWVhySnpkZmk4MmVxYXI0SUxwWXNqU1daZ2p6WVlFWmN1OVlrWS9WVVZC?=
 =?utf-8?B?eC9ycFhSLzRmTkZTNFlUOHdyYkVHTUNGeEpuTGhsc3RKMnFSeURtQnN6elpj?=
 =?utf-8?B?amRZVldFb3hiYmU0bVlWdjVJMFdPT2VIalFMaTZCUCtUMU50V0lBRFNpSWdZ?=
 =?utf-8?B?TjZ2Mk01SVd2dU0rQlRFTzNScmRkUWR5RDZvaGs2aXRWejNUODdKS2s4aEwx?=
 =?utf-8?B?dHVySEd2VHpKSk10M0Fwa21JUUxLVFc2djdndG5LRkRobnk5a0pncDdVU3My?=
 =?utf-8?B?SUl2ZzVXTjFrWk9yNWdoYlFKUXdDc2wrQ2pKK2ZVNWVaaW9TNnExanhVSFJu?=
 =?utf-8?B?ZVI0NlZKUHMyVVMyZkhKRVlVZ2lKMWVzNjVIbW1tdkx5N0lQbmYwTklndSs4?=
 =?utf-8?B?UlpWZEVtKzQwRWorSmlpN0dEMTdJNU9kcE9WZ05MQnhrWFdTSysreVJ0eTFt?=
 =?utf-8?B?cksvOWxjRmMyRUo1Ym9xVDMzNTE2Y2hsR0d5WTBNSkxoU3FMNFh6a285bTU3?=
 =?utf-8?B?b3FVR0dFLzFpZFJoNS8veFdEdHVaTnRjUmxiRmVjeS95bElOMWFHZ1Fzei83?=
 =?utf-8?B?eEtwVUpkTFpOdWxzUXQ3TVhMc09UbGlIMzd1VVl6TlhzcnhXTEl3b20zNEZp?=
 =?utf-8?B?a3FBK01kVkVFNVlHb3lvbjc1eVFwZFRXQW1EZmM4cVJWc2xIOFN6V2lDYi9q?=
 =?utf-8?B?d0ovektUVWhMMENRVU9ST2hpMmpMSnY0aHZEcFRsS25pbUUyQUxqZXgrMEl6?=
 =?utf-8?B?WlE5eHdOeTVrNVpsVzh3V3UyU2VqWUlrRE54QnY5OTdsTzFqYlUyYkxXbXVX?=
 =?utf-8?B?UTliK3JsSjVrbndYS2g1aHNLK3lRbVJ6Uk1DT1M4Um1DbWpNcnlMbEJCRDJw?=
 =?utf-8?B?b0RReVgyZ1ZFUTB1WHQ1L2tEblIvV1BJL0NPbFp6YkhVTk1mTWFYQitkYTlj?=
 =?utf-8?B?NU1NWVQyblpaSWlZczdsU0FUS1R2Y1FTa29TczlKUmNPK2VsWVZMZkxWODZB?=
 =?utf-8?B?MDNhZDh3VWRLdDNUVFVsdklJREVyNEUxckZnR3Nia3FlN2R3b1pEZENHcWFt?=
 =?utf-8?B?S0Fac3BYSExUcFdXYW1nNzg2QTB4WkgzNlh4THE4WDZjWGljVHNJL01EVjFU?=
 =?utf-8?Q?uGerHS?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4140.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y1JuNGFBNHJhOERDMk9lcER6Z3V3Zk9xT2dEcGlUQjdhbk1reVhUS3hJL3Zi?=
 =?utf-8?B?TUxoTS85UmtvUzh1eXI5RHJsWXM1Mzk4SzA3SGxJMEcrL0NFY2FwWTd2NHdJ?=
 =?utf-8?B?RHA0dmZoUXlkN0pVWjhpRUF6VTN4cW4xcDhBcDFPWFB0OXFSOFVTT0s0bEty?=
 =?utf-8?B?cmh4NTVtZExnajZnSGZVSkN2TG5OVktYWVhiQ0xvM3NXUXR1OFJINlg4L0kw?=
 =?utf-8?B?cmFCYUtVWFZqZmh5eHhPWkhnc0M3ZG51aWpqbzNEcHhuSXFaUloycnE2VmRl?=
 =?utf-8?B?WndxemVNcWZwQkZNb0EzOWYxMjduTEZLZUxNQVRuUVZvWWNlNnFwUE9zWG5N?=
 =?utf-8?B?UHhqKzEzd3ZzQUt0Yzd6S0ZkTW13cVJST2RRaFdyem1PNVMwbE5GYkpSM3E5?=
 =?utf-8?B?WTU3Nm5HVmFSeGlVNTQyL3l4cFhXZytIR3phWWFVOEM0RUp4amtpdTFpS3JH?=
 =?utf-8?B?d0UzWk5kRnlJMmdvVUg3dHF2NEM4K1E0MnlLNkNmTUhyUTA5VnlZN2krSU5H?=
 =?utf-8?B?eXJRclp3Z2FLRTdNSjNOaFJwK0NaUThhTWtSTUV4MVQvWitES3EwZFlZankr?=
 =?utf-8?B?R25TeGxqbHVGQ3E2SkxUd2VUZU1yaWhIV3V2ckVBRFFhVitUZEVmK1BtZWoy?=
 =?utf-8?B?S1pZZ1ZMTkh2S3RVdk83c05tVWlZRWpxZVcxWFN2WUFUblNXQzE2alc5UHlu?=
 =?utf-8?B?NG9FNGJ0SXdhWGtnU0hZanBVMXR0L1F6bkJ6N3lvQTdqNkdTU2JtWXpoakdk?=
 =?utf-8?B?L1NEZnBlcStWL0dIYk1qMDB4a2swUlh3T3pqMU0vdmxackVNeE1raCtaalpq?=
 =?utf-8?B?K2RZdmRkT1c2Tm1nMlp1S2N6MGkvYU1JZGNYdjc3QnIrNmlSaXp1dXNKMGpS?=
 =?utf-8?B?Y1A1elIwTlI4SWFYdVRjUGlMb0dNWGhyVXVVRWxBV3RPNVNZcmRRNmdWY2pL?=
 =?utf-8?B?QkVjMFd3R2FpRndXWlg0cFo4TThzSzQyVUR3eWxHSEpHQXlwLzBjaFhkRmE3?=
 =?utf-8?B?bmRjNHltVDlMeUdMcVJobmtCSkNFV3VhcHFwZGhJRFZUZVpBWmFPM1pFRkhO?=
 =?utf-8?B?TEtid2dnejE1b2F3SkhtVG1NOVBBbmwwRzRQSXdZRm5ZM2Y2bGxBWkppTXFI?=
 =?utf-8?B?ZzZDM0dha0YrUUxBbWNJdTlLUnZ0UmxTNGxmWFp1RDQ5YWhYWlRJc0FWK3Bu?=
 =?utf-8?B?OWFWRTYvTWlwV1JNbHNjTjBVT05aejN2ZHlSanIzV3V0VUFrMWhkQ21CUEd6?=
 =?utf-8?B?Z2ZJTnE1aExmRmo0OGUxMlpWYTlvMXB0QjFxYnUyc0hxVjBETnJxUXJxWVoz?=
 =?utf-8?B?OHd6ZU8yWDA3QlRabS9XUEZJQ2JHUHlJWGxuYUFEYjNLNHVyNTN4cmVxdjdJ?=
 =?utf-8?B?RDFkYTFBYzZsbVoxMWtrOUZZOGhVc3ZOclZJS2hIaS96MXphUGxXT3dlMFdW?=
 =?utf-8?B?UE5QLytCdSszdDFmdUl1b2QxS0pBcGhpaEdQenNuMW10ZFp3SFZKckJDQ3Qx?=
 =?utf-8?B?a09XMEJwUXVUS2VGajVvaXJCVVFhTExYVmhMVnlCMm9qZVJzdzhQZmxwMGhz?=
 =?utf-8?B?a0tpdjQ1dVFSaTVJb2RpQjFxbW5pbTBhMmhiaUlyZUZTcUE1bFVLaEJWdmVi?=
 =?utf-8?B?ZVZuOGFpMGh5S2ppV0dta1YwbmE4bkNRVDVGYkM1bkEwaFBPTFJPVUF5ZFhC?=
 =?utf-8?B?VXNjUDR3ejlSNGRHbVJPSmFGV05sNk1nVHlwK3VCZ2Q4cHM2NHBvdmNLM1Bn?=
 =?utf-8?B?Uk5iOXpDeStBT2p2cXhLc1d5Yi9JdkNMUlhSYjdHclRtTmpXb1lJb0RZQlNz?=
 =?utf-8?B?RkJzSXNHcHhhUjY4UE5FaXlvS2hFSUZZMzFhZ0kwYzNET2pWTTE0Tnk3VzlL?=
 =?utf-8?B?OGR3cWdZaWFhaG52Q2EzVndPNTVtSHlSczExN29QZHJuSGJDT0N0NGp3dHVa?=
 =?utf-8?B?dk9oM1BXY1J4dXRpWWlpeENwelZKa0VYemovRUR0aDZBZW1EbzU1R2doTHlC?=
 =?utf-8?B?Qk1OMXZ2N3liQ292Y2RuNnJQdTlMT1VJSG85Q29oa013SGZSZEtQdWNKV3ha?=
 =?utf-8?B?T3IrQlJZYTVLTDRIaWwzbm9UOGdGdGNzRVYrVEpvWXlIdVJXZ2JaRDB3UE1B?=
 =?utf-8?B?MFJvZEJYYlpva0dQd2tKTzM4ZVZZYmt1YTdBSm4yMnhwa2ZzMjlmSDZPdkVE?=
 =?utf-8?B?UGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B47D66F2B23024429F534FDF31C6C676@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4140.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91ef5fc-30cf-4053-02d1-08de18759e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 12:04:18.2106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0C1aIV4K4G4MoE7AJLCjLSYb2zVqEINQr63guNPRLUivLILIMJxAdA1xmsyNCa4xYsoSD3ihYUoFc0z8QIr26PoCJVgHjDvxLS6cQF0/4Yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9260

DQoNCk9uIDEwLzI5LzI1IDE1OjU3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjkuMTAuMjAy
NSAxNDozOCwgRG15dHJvIFByb2tvcGNodWsxIHdyb3RlOg0KPj4gVGhlc2UgZmlsZXMgJ2RvY3Mv
bWlzYy9rY29uZmlneywtbGFuZ3VhZ2V9LnR4dCcgd2VyZSBkZWxldGVkLCBidXQNCj4+IHJlZmVy
ZW5jZXMgYXJlIHN0aWxsIHByZXNlbnQgaW4gWGVuLiBSZW1vdmUgdGhlbSB0byBjbGVhbi11cC4N
Cj4+DQo+PiBGaXhlczogZjgwZmUyYjM0ZjA4ICgieGVuOiBVcGRhdGUgS2NvbmZpZyB0byBMaW51
eCB2NS40IikNCj4NCj4gSG1tLCB0aGF0IGNvbW1pdCByZXBsYWNlZCB0aGUgLnR4dCBmaWxlcyB3
aXRoIC5yc3Qgb25lcywgc28gbWF5YmUgeW91IHdhbnQgYQ0KPiAybmQgdGFnIGhlcmUgcmVmZXJl
bmNpbmcgMDQ0NTAzZjYxYzk1ICgiZG9jczogRGVsZXRlIGtjb25maWcgZG9jcyB0byBmaXgNCj4g
bGljZW5zaW5nIHZpb2xhdGlvbiIpPw0KV2VsbCwgSSBzYXcgdGhhdCBjb21taXQsIGJ1dCBpbnRl
bnRpb25hbGx5IHNlbGVjdGVkIGZpcnN0IG9uZS4NCkxvb2tzIGxpa2UgY29tbWl0IDA0NDUwM2Y2
MWM5NSBpcyBtb3JlIGFwcHJvcHJpYXRlLg0KDQo+DQo+PiAtLS0gYS9JTlNUQUxMDQo+PiArKysg
Yi9JTlNUQUxMDQo+PiBAQCAtMjMsNyArMjMsNyBAQCBYZW4gSHlwZXJ2aXNvcg0KPj4gICA9PT09
PT09PT09PT09PQ0KPj4NCj4+ICAgWGVuIGl0c2VsZiBpcyBjb25maWd1cmVkIHZpYSBhIGBrY29u
ZmlnJyBzeXN0ZW0gYm9ycm93ZWQgZnJvbSBMaW51eC4NCj4+IC1TZWUgZG9jcy9taXNjL2tjb25m
aWcudHh0Lg0KPj4gK1NlZSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9r
YnVpbGQvLg0KPg0KPiBJcyBsaW5raW5nIHRvICJsYXRlc3QiIGRvYyByZWFsbHkgYXBwcm9wcmlh
dGUsIHdoZW4gd2UgZG9uJ3QgZXZlbiB0cnkgdG8gc3RheQ0KPiB1cC10by1kYXRlPyBUaGF0J3Mg
d2hhdCBBbmRyZXcncyBjb21taXQgc3VnZ2VzdHMsIGJ1dCBJIGRhcmUgdG8gcXVlc3Rpb24gdGhp
cy4NCklmIHRoZSBrY29uZmlnIGRpcmVjdG9yeSB3YXMgaW1wb3J0ZWQgZnJvbSB0aGUgTGludXgg
a2VybmVsIHY1LjQsIEkNCnRoaW5rIHRoZSBmb2xsb3dpbmcgbGluayBpcyBPSzoNCmh0dHBzOi8v
d3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjUuNC9rYnVpbGQvDQoNCj4NCj4+IC0tLSBhL3hlbi9L
Y29uZmlnDQo+PiArKysgYi94ZW4vS2NvbmZpZw0KPj4gQEAgLTEsNiArMSw2IEBADQo+PiAgICMN
Cj4+ICAgIyBGb3IgYSBkZXNjcmlwdGlvbiBvZiB0aGUgc3ludGF4IG9mIHRoaXMgY29uZmlndXJh
dGlvbiBmaWxlLA0KPj4gLSMgc2VlIGRvY3MvbWlzYy9rY29uZmlnLWxhbmd1YWdlLnR4dA0KPj4g
KyMgc2VlIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2tidWlsZC8NCj4N
Cj4gTWF5YmUgbW9yZSBzcGVjaWZpY2FsbHkgaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRt
bC9sYXRlc3Qva2J1aWxkL2tjb25maWctbGFuZ3VhZ2UuaHRtbA0KPiBhdCBsZWFzdCBoZXJlICh3
aXRoIGxhdGVzdCBwb3NzaWJseSByZXBsYWNlZCBhcyBwZXIgYWJvdmUpPw0KPg0KPiBKYW4NCg0K
YW5kIGhlcmU6DQpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjQva2J1aWxkL2tj
b25maWctbGFuZ3VhZ2UuaHRtbA0KDQpEbXl0cm8uDQo=

