Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHZMLowL6GkgEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 01:43:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943FC440A5A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 01:43:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1289702.1569502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFKj4-0000XW-Pj; Tue, 21 Apr 2026 23:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289702.1569502; Tue, 21 Apr 2026 23:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFKj4-0000W3-MZ; Tue, 21 Apr 2026 23:41:54 +0000
Received: by outflank-mailman (input) for mailman id 1289702;
 Tue, 21 Apr 2026 23:41:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <joan.bae@boeing.com>) id 1wFKj2-0000Vw-MB
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 23:41:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFKj1-008xB6-5m
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 01:41:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <joan.bae@boeing.com>)
 id 69e80aea-bab6-0a2a0a5309dd-0a2a4505b9b0-40
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 01:41:50 +0200
Received: from [130.76.144.163] (helo=clt-mbsout-02.mbs.boeing.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <joan.bae@boeing.com>)
 id 69e80b3c-aaa8-0a2a45050019-824c90a3eddb-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 01:41:49 +0200
Received: from localhost (localhost [127.0.0.1])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 63LNfkaU022457; Tue, 21 Apr 2026 19:41:47 -0400
Received: from XCH16-09-08.nos.boeing.com (xch16-09-08.nos.boeing.com
 [144.115.66.156])
 by clt-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 63LNfddd022411
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 21 Apr 2026 19:41:40 -0400
Received: from XCH19-03-07.nos.boeing.com (144.115.66.115) by
 XCH16-09-08.nos.boeing.com (144.115.66.156) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.58; Tue, 21 Apr 2026 16:41:39 -0700
Received: from XCH19-EDGE-C01.nos.boeing.com (130.76.144.197) by
 XCH19-03-07.nos.boeing.com (144.115.66.115) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 16:41:39 -0700
Received: from USG02-BN3-obe.outbound.protection.office365.us (23.103.199.146)
 by boeing.com (130.76.144.197) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 21 Apr
 2026 16:41:37 -0700
Received: from SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:196::15)
 by BN0P110MB1530.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.55; Tue, 21 Apr
 2026 23:41:37 +0000
Received: from SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM
 ([fe80::452a:f17:6196:8976]) by SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM
 ([fe80::452a:f17:6196:8976%4]) with mapi id 15.20.9769.053; Tue, 21 Apr 2026
 23:41:37 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=boeing-s1912 header.d=boeing.com header.i="@boeing.com" header.h="From:To:CC:Subject:Date:References:In-Reply-To"; dkim=pass header.s=selector1-boeing-onmicrosoft-com header.d=boeing.onmicrosoft.com header.i="@boeing.onmicrosoft.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1776814907;
	bh=RaE2bzzx7I0+KXwrYhGKyMgM6Gd7tv85z6P9lL1CL9E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NVrgwd79wYYwNZnCuzr9VPvuaHyKQlL7oq8FWCMIKN33tWQAgLVeua+w92Zmw9cr5
	 hlPX3HAtYnSR35Cyot6IXVv038drSVkAbXFLekwd/F9JNvHNBERQyPfiAedixAvQ5e
	 w4r9iJbjfiLntn1cNobcgCbKS0wj/2po8OKyJuh8vvNZe3KHbNQVeiJAHlrJcjG0Wn
	 RcDN0hn7p83bFXEtgn/N43XrXpaj6Ppb87aWGOS+t2HmyHaiQyWbgYxfds1MGmr/yA
	 1ztHUs4OQ5RqYF3+Wv8J1knWOkkxu8y9Fp0uv3AR8bCnq0oT+7lmD6XVCEGA8NBQFP
	 gcuicCMeC7FRw==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=itBK2dSQd70qmbTY9Qb+ulVLRFOtxaWIEH3lwAKorZ2fjFuFX0aU4dZ0YVWBDw/Sdez89uFzuQMQF9y5WvZwWGHwt6RfqzXV1sPEsZFXy75+53WJCNBIDJniWCn0KL7HJ+HaWClKjxXvhcd3XYrF1EHOzsqm9kRJW8AZdfo4DewQj3OmNv9fxjJQmMom0FZ+GEgkYdcgpklUkrhmyBW9a3FUKj2aJb+Zu8ZrNqVOzgxZBc81qnKxB3gt1N5EQLW7YDROAMUcfcH2Zr/hTEMt0juwH2EnTWpf/rgzUrfog2VBLhI8dl/ac21dHynpptNfoMS34L0AFQ4cOjz3wxXdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaE2bzzx7I0+KXwrYhGKyMgM6Gd7tv85z6P9lL1CL9E=;
 b=KfL5opRJHcHVPJ+F4UPgoA1ZvsyOHKJgD5kxSFTu/mTGD+4S+P5q5QRYYPEd72DBJUJ+KQTPbHuM1AAMeCFrf6nh8M3q/OOQepDqonzMtdE2RlJ7ExwKrOH1MJSdIRLIaV3fcPZXZhCgIx/rGdlihfi0lX93K+O+9UJCowCjoOt6Prehvy6laDTDRORMgf5+7Mo5M81iupNN0j/U5moXW4S3F6BGeCPwId7ji778ylvOwholxqq+xoyL6l49CtSvfGRAlC3Cfm1LB0ne7ywHz7+Zvk2y0TXt1KIkElICLJqMpjdxuotmzuGfRTGtEzdD+3QUC4eAub3SlX9Dnd8vRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=boeing.com; dmarc=pass action=none header.from=boeing.com;
 dkim=pass header.d=boeing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boeing.onmicrosoft.com; s=selector1-boeing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaE2bzzx7I0+KXwrYhGKyMgM6Gd7tv85z6P9lL1CL9E=;
 b=WVJ6kpRh3lxHBdnJn1pO8yjyb3e8crCkNLWc3V5cTp9NdBY7/gYizmX/tCy5cP2DhdjfB/T9NQ4kkijR7f+uH29ry96xECIUv9WugR0zKzB+ZLAOPB3/HqtXzU3CFxLPmBOvQ8NE9PhgiWIuik6R9FVH2wL9qqsFRN5rsrhs/Mo=
From: "Bae, Joan" <joan.bae@boeing.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: RE: [EXTERNAL] Re: [XEN PATCH] xen/common: validate shared memory
 guest address overlap with guest RAM
Thread-Topic: [EXTERNAL] Re: [XEN PATCH] xen/common: validate shared memory
 guest address overlap with guest RAM
Thread-Index: AQHcy6n8SUKFV8ls/kGsGA5q0Nlt0bXdycCAgAGZ18CACtTL4A==
Date: Tue, 21 Apr 2026 23:41:37 +0000
Message-ID: <SA1P110MB1614959CBF6F54BFB37ECD1AFF2CA@SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM>
References: <59dcd094173791926fff212f3f2b86df50b0dc12.1776060772.git.joan.bae@boeing.com>
 <cfe8b6ae-2f52-47c4-862d-52d648d41895@xen.org>
 <SA1P110MB16142073986E51B11EF98CD9FF22A@SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <SA1P110MB16142073986E51B11EF98CD9FF22A@SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=boeing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1614:EE_|BN0P110MB1530:EE_
x-ms-office365-filtering-correlation-id: 11a18b7a-4628-4642-9237-08de9fff8784
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info: wqs4fRCoG1U/+ydBqI82P9mVuPrSUdTMQhlPKD5QqgmC2ceNwtyTcqaSFCTz6Ch9Xg7yjIGYebQmnAP22AZJVFy4SEDdZEksFyFYUuWquql2VBg9cxjhz+OZY+HqDvesI12vF6+Ubsc8H7F/OCfVyAWIK1cUorBmPeV5TC+TjRlXiR9KiwTkfJi6O+4bFR5tGleaU006maXq23waD4FLTKJM5+cEKFgDeo09073SDtk7v6y/SsUloEmLUY1xPbKflwj5Nji/AjjGlAF/3YZtHlkeNTKnRg4bYgGnuExz4bZcqmx0KVdCM9iEW2iPtPHQ2YSJTp6lbTVOOIck5N9zkK1bQ5FIVZgt8b0pwkB+Q6S/NtkYJo/OoGUNvoGBBjOWLDy539cOiynGYgppaSMp/MBQFbzWGKqhKDMDcpmtm8HRdilEinfLJTP3jZUThiEki9m7z95Y7NC+CKL1ueRIPvnl7KyA9XCs5EtIG1VTi4Fry27TbT61A3KyRgMIpT79vI++BbbIdYHWYgXuyiJUyohb8gB0C3wF+MOSV233DXaq7HGIf2VmazpnbVBBE0Ao1eecv5CIJIhZCadTUqPO/rJi6AyKM25RFWzLW73AMn7elArD3V7cZWHwKGvQgthq8sjpUcggkaPF9DTuTnE9vSmJdlkatte1POq5za9mZ00P9PyqSFCazhDa7FSsnn1+0813KMDMV0bdQfXp2kIa4xow/lqYmhAYepTxMtFykPCDJ6PI87VvriHTJRMC8+W4DBJcDDbsyA6Ek+Gs5EyQlp+yvOnKDkuJM4gQNlYpYpY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVRjL2Jwdk1iMW5Vbkp2RzJOYVdoWHlJZ1dQMHRxUUFEK1lsaU9uQjR6Q3JG?=
 =?utf-8?B?eUhKM09rUnRXaEMzOW94eldSWUk4YnEycmFNamU4b3FYaGpjZS83UEF3L3k4?=
 =?utf-8?B?ZnJ3UlZHZG1qdmV0N3NYSElJTGVjYzRBUTF6R0d5WmFuY1dHMjBrdXJZRGtH?=
 =?utf-8?B?UmdNMHJnN1ppamlQNW1VR0Q0R2M1ZGU1SVNhMk4zeHorSThmWERsUFVZOUR5?=
 =?utf-8?B?VWJpTkplc3V3a3VnTHpFWjFXUlZQVm1JSWxIRmpWb0dIRGcwQVN1S0I0STJ4?=
 =?utf-8?B?dy9HUmhqNEF3L3grUEp0OHJNSUw5amdGZlhDN1BvQlIycE1CRncyUnVnNmZl?=
 =?utf-8?B?ZDk2cDFCN2t1VFQzcldwTXRKOVBjOElSbkp2MVV5b2tUdExCNDBPZGo1RU9O?=
 =?utf-8?B?WjQwQnRaY0VQQ2h6cnVKYnEvUjdlSEoza2pLYWQrc1ZjUlhYVGI0emxkVExt?=
 =?utf-8?B?blk4d2lRM0V3UlhNQmZtRGZkK09uT0pHc2ZmYW9BbjQyYkM2NWYyelNKSmFJ?=
 =?utf-8?B?OW05cStIeWVreEROWnBoY1Izc3JLa2l6MDVZMTgycEVVZDlSbTd2WUN5TXdh?=
 =?utf-8?B?WG5KNmhNa1JIa3ZWKzBUKzJ3d0R4WUxncTMxSU52NXNsbnlqdkJBbGlKdWZ0?=
 =?utf-8?B?YVdZMHNiYUVlM1FXd3l0WXFReHNwaGYyLzB6dmduVlJNTnBudTNMMUZ1RGEw?=
 =?utf-8?B?bDdtWGJwUmVvMUJqa092dG9JUTRpMUxYa1FLZk11dE9aeFNBVzVFTE1xdTRq?=
 =?utf-8?B?b1NLYXhQdUlXTUVOdWZGcFo4Y2c3cy9Xbmg1aW9MVXh5NjFGVHBWdDZXUUdH?=
 =?utf-8?B?YzVFOUJOb2ppK0NjL0U0bGR4QW9rQVhsQ3N1QmRnZm5QUXlpN2dTSEZnTDE0?=
 =?utf-8?B?QVJtNEZjZWZvQk5aSTYzQlRIT1lHRk5IUSsyWkw4MXRLSDNVSjlqTzI2TWNl?=
 =?utf-8?B?Tm5oNDNScUxWT1hjQUJOTDlPZUJxWlJURWNkdlp2dUFpNU5kNnBrYkxIUlgy?=
 =?utf-8?B?QmxPQmhibzhqdDVzSGpzU04zaUlqWDNCSmJ3dk81ZmxHa2laSUZHT0krcGtD?=
 =?utf-8?B?MWJkR25ZeGpYNUszOERiazFsY2pqelVHYU5DYTI1c0MvRFBTNlhnaGhkMHl3?=
 =?utf-8?B?Nkh2ZEtRVVEzR2d1VXQ5MEVhNWcwSzlVNmpLc2MvbTJ3TVRRSFRzamQ4SllW?=
 =?utf-8?B?QjBmNnFkNGxPZC9ITHdmS0lWT0VTWi9RUXFZanNTQkI1Und2NUNCVnc0SEZK?=
 =?utf-8?B?Q1VxNHJ3UVVldTIzNTVSZHJBVVh1NVF5SXpLN2lhekUrNXpMakRDMzEzVjQ4?=
 =?utf-8?B?di9sT3dnTmtHb3NFTEtFNmo5SUU3RXhodlpnOFdFMVMzR3M0TFVnVHozRXpZ?=
 =?utf-8?B?dGlSWWs1SVJEL0NTNHVIM213NHNwdHRUNXB0Zm42WWtlUmNRMTlxaWtMVnZX?=
 =?utf-8?B?WkhtMXN6ZHkvNG8rTzU1cXRBTnA4dURnYk9BTVdzbkZLNUNuT1hEVWlObXdv?=
 =?utf-8?B?eURWWkFvRE9hRkZ5aENXY0xaL0VNSUVwNFpQVG5BaCtYcmFYRGQ0SmcrSFF0?=
 =?utf-8?B?R29sdDVQdXlFKzhSZENCYWVsazVoZWdqV0d6Rzg2dTZleUFKd1BZOUJOd2w0?=
 =?utf-8?B?MFluaWRCSkVSdDBUT2VJMENna3hLR1VUNEd0M1ppUllxWHdkcFR1QURmK1c5?=
 =?utf-8?B?M3RQRTBwKzJ1UDJ3bHliaDdZcnhRcnc2V1RuNUxqSEdXYlZTa3plWUlrYTNT?=
 =?utf-8?B?SUtoZTNtd2dJeC9seHNhSXFKc3R1c0VmUEdiVkNSOXVzUmhNZVE1KzQ5NThY?=
 =?utf-8?B?bm9vVEkvZzZGbkFVQktmblI0Q2pRL3hQa2NCcCs1eGpSdG5IVzY5TWlyS3Vz?=
 =?utf-8?B?N2o2RnBoWFZtSDhmWXY2eVdENDI2Uyt2UU5zVEd1di9IdWRSMkNKcTdySGNM?=
 =?utf-8?B?NEZiL2taSlVveXQ0djExRzltVm1zWDl4MXkrNVR1eFVJbWdVSmxKWUNhN0F3?=
 =?utf-8?B?MmowZWhzQ0c2WXUwTlFQT2JJbTFVY0JFVU5BbnJpbnJubUd3b2hzSmNxb3Nr?=
 =?utf-8?B?N0NXd003SHpnTk02Z0N6NURMc2pVRys2ZkYxQTRIR0lLTy9jNTFZb3JGQWV1?=
 =?utf-8?B?R2tTOWVEWUNLNEY5M0ttTHgzR0NtcmFIOENBcENKTVFWVlk2a2ZQMkFYQUo0?=
 =?utf-8?Q?9VajpzShim/FSS305BILUG6wIvfosUVV6b2bSuG7NRD9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1614.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a18b7a-4628-4642-9237-08de9fff8784
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 23:41:37.1844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bcf48bba-4d6f-4dee-a0d2-7df59cc36629
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0P110MB1530
X-OriginatorOrg: boeing.com
X-TM-AS-GCONF: 00
X-purgate-ID: tlsNG-c201ff/1776814910-2AF6E443-58E5D11F/0/0
X-purgate-type: clean
X-purgate-size: 4028
X-Spamd-Result: default: False [-1.09 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector5401:i=1];
	DMARC_POLICY_ALLOW(-0.50)[boeing.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[boeing.com:s=boeing-s1912,boeing.onmicrosoft.com:s=selector1-boeing-onmicrosoft-com];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[joan.bae@boeing.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[15];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joan.bae@boeing.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[boeing.com:+,boeing.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.669];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 943FC440A5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSnVsaWVuLA0KDQo+IEhpIEp1bGllbiwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHJldmll
dy4gSSBhZ3JlZSB0aGF0IHRoZSBvdmVybGFwIGlzc3VlIGlzIG5vdCBsaW1pdGVkIHRvIHNoYXJl
ZA0KPiBtZW1vcnkgb3ZlcmxhcHBpbmcgd2l0aCBSQU0uIEl0IGNvdWxkIGhhcHBlbiB3aXRoIGFu
eSBQMk0gbWFwcGluZw0KPiBkdXJpbmcgZG9tYWluIGNvbnN0cnVjdGlvbi4NCj4gDQo+IEkgcmVz
ZWFyY2hlZCB0aGUgY2FsbGVycyBvZiBwMm1fc2V0X2VudHJ5KCkuIEF0IGEgaGlnaGVyIGxldmVs
LA0KPiBwMm1faW5zZXJ0X21hcHBpbmcoKSBjYWxsZXJzIGNhbiBiZSBjYXRlZ29yaXplZCBpbnRv
IHR3byBncm91cHM6IHJ1bnRpbWUNCj4gaHlwZXJjYWxscyBhbmQgZG9tYWluIGNvbnN0cnVjdGlv
bi4NCj4gDQo+IFJ1bnRpbWUgaHlwZXJjYWxscyBzdWNoIGFzIFhFTk1FTV9wb3B1bGF0ZV9waHlz
bWFwIHJlbHkgb24gb3ZlcndyaXRpbmcNCj4gZXhpc3RpbmcgbWFwcGluZ3MsIHNvIHRoZXkgbXVz
dCBhbGxvdyBpdC4gT24gdGhlIG90aGVyIGhhbmQsIGRvbWFpbg0KPiBjb25zdHJ1Y3Rpb24gY2Fs
bGVycyBzdWNoIGFzIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2VzKCkgc2hvdWxkIG5vdCBhbGxvdw0K
PiBvdmVyd3JpdGluZyBleGlzdGluZyBtYXBwaW5ncy4NCj4gDQo+IFNpbmNlIGJvdGggY2F0ZWdv
cmllcyBkZXBlbmQgb24gcDJtX3NldF9lbnRyeSgpLCBhZGRpbmcgYSBibGFua2V0IGNoZWNrDQo+
IHRoZXJlIHdvdWxkIGJyZWFrIHRoZSBydW50aW1lIGh5cGVyY2FsbCBwYXRocy4NCj4gDQo+IE15
IHBsYW4gZm9yIHYyIGlzIHRvIGFkZCBhIGNoZWNrZWQgdmFyaWFudCBvZiBwMm1faW5zZXJ0X21h
cHBpbmcoKSAobmFtZWQNCj4gYXMgcDJtX2luc2VydF9tYXBwaW5nX2NoZWNrZWQpIHRoYXQgdmVy
aWZpZXMgbm8gZXhpc3RpbmcgbWFwcGluZyBpcyBwcmVzZW50DQo+IGJlZm9yZSBpbnNlcnRpbmcu
IERvbWFpbiBidWlsZCBwYXRocyB3b3VsZCB1c2UgdGhlIGNoZWNrZWQgdmVyc2lvbiwgd2hpbGUN
Cj4gcnVudGltZSBoeXBlcmNhbGwgcGF0aHMgcmVtYWluIHVuY2hhbmdlZC4NCj4gDQo+IEkgYWxz
byBub3RpY2VkIGEgcmVsYXRlZCBUT0RPIGluIHAybS5oOg0KPiAvKiBUT0RPOiBBZGQgYSBjaGVj
ayBpbiBfX3AybV9zZXRfZW50cnkoKSB0byBhdm9pZCBjcmVhdGluZyBhIG1hcHBpbmcgaW4NCj4g
KiBhcmNoX2RvbWFpbl9jcmVhdGUoKSB0aGF0IHJlcXVpcmVzIHAybV9wdXRfbDNfcGFnZSgpIHRv
IGJlIGNhbGxlZC4gLw0KPiANCj4gVGhpcyBzZWVtcyB0byBiZSBhZGRyZXNzaW5nIGEgc2ltaWxh
ciBjb25jZXJuLiBXb3VsZCB0aGUgYXBwcm9hY2ggb2YgYQ0KPiBjaGVja2VkIHdyYXBwZXIgYXQg
dGhlIHAybV9pbnNlcnRfbWFwcGluZygpIGxldmVsIGJlIGFjY2VwdGFibGUsIG9yIHdvdWxkDQo+
IHlvdSBwcmVmZXIgdGhlIGNoZWNrIGF0IGEgZGlmZmVyZW50IGxldmVsPw0KPiANCj4gVGhhbmsg
eW91LA0KPiBKb2FuDQo+IA0KPj4gRVhUIGVtYWlsOiBiZSBtaW5kZnVsIG9mIGxpbmtzL2F0dGFj
aG1lbnRzLg0KPj4gDQo+PiBIaSBKb2FuLA0KPj4gDQo+PiBUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aC4NCj4+IA0KPj4gT24gMTQvMDQvMjAyNiAwOTo1OSwgSm9hbiBCYWUgd3JvdGU6DQo+Pj4gQ3Vy
cmVudGx5LCBwcm9jZXNzX3NobSgpIGRvZXMgbm90IGNoZWNrIHdoZXRoZXIgdGhlIGd1ZXN0IHBo
eXNpY2FsDQo+Pj4gYWRkcmVzcyBvZiBhIHNoYXJlZCBtZW1vcnkgcmVnaW9uIG92ZXJsYXBzIHdp
dGggdGhlIGRvbWFpbidzDQo+Pj4gYWxsb2NhdGVkIFJBTSBiYW5rcy4gTmVpdGhlciBwcm9jZXNz
X3NobSgpIG5vciBwMm1fc2V0X2VudHJ5KCkgY2hlY2tzDQo+Pj4gZm9yIGV4aXN0aW5nIG1hcHBp
bmdzLCBzbyB0aGUgUkFNIG1hcHBpbmcgaXMgc2lsZW50bHkgb3ZlcndyaXR0ZW4gaWYNCj4+PiBh
IHVzZXIgc3BlY2lmaWVzIGEgZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyB0aGF0IGZhbGxzIHdpdGhp
biB0aGUgZ3Vlc3QNCj4+PiBSQU0gcmFuZ2UuIFNpbmNlIGNvbnN0cnVjdF9kb21haW4oKSBsb2Fk
cyB0aGUga2VybmVsIGFmdGVyDQo+Pj4gcHJvY2Vzc19zaG0oKSwgdGhlIGtlcm5lbCBjYW4gZW5k
IHVwIGluIHNoYXJlZCBtZW1vcnkgcGFnZXMuIFRoaXMgY2FuDQo+Pj4gY2F1c2U6IC0gQW5vdGhl
ciBkb21haW4gY29ycnVwdGluZyB0aGUga2VybmVsIHZpYSBzaGFyZWQgbWVtb3J5IHdyaXRlDQo+
Pj4gLSBTaWxlbnQgZ3Vlc3QgY3Jhc2ggd2l0aCBubyBlcnJvciBtZXNzYWdlIGZyb20gWGVuDQo+
PiANCj4+IFRoaXMgc2VlbXMgdG8gYmUgc29sdmluZyBvbmUgc3BlY2lmaWMgaXNzdWUgKFJBTSBj
bGFzaGluZyB3aXRoIHNoYXJlZA0KPj4gbWVtb3J5KSBidXQgSSBiZWxpZXZlIHRoaXMgY291bGQg
YWxzbyBoYXBwZW4gd2l0aCBvdGhlciBraW5kIG9mDQo+PiBtYXBwaW5ncyBiZWNhdXNlLCBhcyB5
b3Ugc2FpZCwgcDJtX3NldF9lbnRyeSgpIGRvZXNuJ3QgY2hlY2sgYW55IG92ZXJsYXAuDQo+PiAN
Cj4+IFNvIEkgd291bGQgcmF0aGVyIHByZWZlciBpZiB3ZSBzb2x2ZSB0aGUgcHJvYmxlbSBvbmNl
IGFuZCBmb3IgYWxsLg0KPj4gVGhpcyB3b3VsZCBtZWFuIG1vZGlmeWluZyBwMm1fc2V0X2VudHJ5
KCkgKG9yIG9uZSBvZiBpdHMgdG9wIGNhbGxlcikuDQo+PiBBbHRob3VnaCwgd2Ugd291bGQgbmVl
ZCB0byBiZSBjYXJlZnVsIHRvIG5vdCBicmVhayBtZW1vcnkgaHlwZXJjYWxscw0KPj4gd2hpY2gg
bWF5IHJlbHkgb24gb3ZlcndyaXRpbmcgZXhpc3RpbmcgbWFwcGluZ3MuDQo+PiANCj4+IENoZWVy
cywNCj4+IA0KPiANCj4gVGhhbmtzLA0KPiBKb2FuIEJhZQ0KPg0KDQpHZW50bGUgcGluZyBvbiB0
aGlzIG9uZS4gUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZSBwcm9wb3NlZCBkaXJlY3Rpb24gbG9v
a3MgcmlnaHQuDQoNClRoYW5rcywNCkpvYW4gQmFlDQoNCg0K

