Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0122A179D8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 10:11:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875189.1285569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taAHL-0007hC-6K; Tue, 21 Jan 2025 09:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875189.1285569; Tue, 21 Jan 2025 09:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taAHL-0007f4-3b; Tue, 21 Jan 2025 09:10:35 +0000
Received: by outflank-mailman (input) for mailman id 875189;
 Tue, 21 Jan 2025 09:10:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WcK4=UN=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1taAHJ-0007eR-Cu
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 09:10:33 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2418::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f919926-d7d7-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 10:10:31 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SJ1PR12MB6097.namprd12.prod.outlook.com (2603:10b6:a03:488::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 09:10:26 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 09:10:26 +0000
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
X-Inumbo-ID: 8f919926-d7d7-11ef-a0e4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCv+ticTYwbugWH9WgkivT5ixeZSOFXEPzuRD5YdUvNUuOmHiX0Dw1gKlxkP6v01s4guUtGAkacdxbGxFFey7pdRiq7iUR9PTbtsxdTCRXsffpUbyNomKRhKPDALTXNzI6BHN1s0H88yZeTr4lLLOiHyQC18FHOlIBsrN8R3XfCjdDD/PwOMhpA/8r2RZRdDD/AAREJ5RduVHEYzEVgiog6lDivg2fwbvx3iFew/HjW2b6eW1pDllPXmKCYLXYyM4LM66fId80IsSWR8RnZc1I+cT4+I/JLaGXMchDYOSLf5HSfHd3wPTA27DdAT+0uWyqn5BlJcWq117uqp/oSqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/uidy0zt/6oRCT8NcuWjDEM2TIENa4DTDV8uP9OQCA=;
 b=xwEtBXCeDOhBG54dlAl8deXs/DY9aavjn0vPN4p9PTZwiLD9A8ROp8oOxJYhUoIUFV53Qhiy9CMwIrsK6J5YdpmvG2P/bV1im9NmI+CzY8hzc+Lv/mG8xH7V8oLJ/GBsT/P6xSmEtqbJ5fo/53lqeIwZxWI0Zptild2rzrDCSvJz2N2oU8C9nlcuSBDJNPhburg5Wt43hALVxQeNVmxlhLMKEETk6dSDVuESNHgbc/tg7KyWoZilUT2NT8PqaairOTgGEleS8RzUE0RBsgJfv//7Ki6G3pyASmtOnDfWTh/gh8Iwm/vWdFBQjfjUYyFNnJkXTOVQdbxLAHFJD6XbkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/uidy0zt/6oRCT8NcuWjDEM2TIENa4DTDV8uP9OQCA=;
 b=ELse1WlP2PqJEgzKdcu7F5ez9JrBTJ+0TvrmqmR6/hCVjBlY/kMHkqsWymnjBbWCGEstt8hcjUbNZxed8N7xEFMnVXK0oxRW9eW34Z2R/CvqhzRu1ujA38X/Znd6KLP6QW/G3c5eZFJI5XgMV0sBeycDOkKCv+AM5ydriElTzjM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5] vpci: Add resizable bar support
Thread-Topic: [PATCH v5] vpci: Add resizable bar support
Thread-Index: AQHbZjRJ+4D0uojYEUmC9gRuRAux1rMg9ZEAgACK3YA=
Date: Tue, 21 Jan 2025 09:10:26 +0000
Message-ID:
 <BL1PR12MB58492016DDBB106A607F32CDE7E62@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250114032636.3698383-1-Jiqian.Chen@amd.com>
 <Z49e8NmROzke-tYc@macbook.local>
In-Reply-To: <Z49e8NmROzke-tYc@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8356.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SJ1PR12MB6097:EE_
x-ms-office365-filtering-correlation-id: 78f7ca5b-877f-4458-9294-08dd39fb71c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RGhJUmUxN1JmTVN5OU4xZU92Z1dtSURpbmdLUnlpekE1cmVKTk5Mak1seThF?=
 =?utf-8?B?OFBzZDhWYVpTS1Q1VFNaa1ppVDNNbFloTEJlTU5qNmk0cXFvSG45WU4vanRy?=
 =?utf-8?B?UG9WSmU4djRuV0FuSGZQeHk0NXlkOEJ3WjkrUlRzVGtaakZXb0lIRDNnMDI0?=
 =?utf-8?B?ZlJIVC80cnNqSXRRakNEQjd4QUJDTUFTaFFFSEVKV21LTU9wTlJjNjYzR2Zi?=
 =?utf-8?B?Wi9NY2FGYUlKRXdCVk8xdjJxZ0xNdmJ5VzhRZ2t4a2pLWHBlQTFubVBQYkVm?=
 =?utf-8?B?alU3enBzUDhyQy9CZk15SjZKSUtscjhPbG8wSVoyRStpbFZ1ZzNseWltekw4?=
 =?utf-8?B?ZWlsMG0wczRteHgyQzlyeVVqU01aYUhFR2VtbUY0UEd6SGJud3BkZzRFRC9S?=
 =?utf-8?B?OGNRRUFmMjZ4RVBNbjFaS3NjQmNIZ3hkSmorVWtBTGQzQXA3NEFKUEdkY01h?=
 =?utf-8?B?dTBGSHNBSThac1I4UlZueTEwaHprcnFsWVovQTFjdyt1cnVmMlp4VUVUc3ls?=
 =?utf-8?B?MzNtTE81VmtkR0RvZy9CYUU5ekpUZWxNVlBEa2pzeitVaDJZdVc0UnF6Sk80?=
 =?utf-8?B?N29oR1Ava1hqa2E1RlFRWmRKcEIxdDJPVFRwSS93eVZheWxjNW1EY3FUN0gw?=
 =?utf-8?B?N2M2OStXcDcwQXRzQkZ5bHc0MUZBOENzNnZJYmREbldGWllKc0I1VnpGZ3R2?=
 =?utf-8?B?WDZIUzh2dmRXQjlpUC9DWkVaYm9URHBtWE9VK2JNcnBVd1BrWGNqRXVnNEh1?=
 =?utf-8?B?SkJWL2hsR3cycVh3c29sV3BONkQxQk5FbXU5cW1WWU9yOHRtT1NvWG16UkVk?=
 =?utf-8?B?b3dMU2dVNEFJK1FEVEcxMVoyVFNoMUxDSzhhWDl1T1RRUkdsRnBUaDdZcjkr?=
 =?utf-8?B?RUtWOTBFdTlPSVdGb1BiOXZ6emEram44KzBHaVVUVnlreHZWbjJ6RjQ4UmQx?=
 =?utf-8?B?OHZFaFBWbjhMYWVCT1AxQU51QXh6NjVDTDY3Q1JTY1dpWFYrUTliK2RYVGtS?=
 =?utf-8?B?Wk5EUmJrRkVubit0SkpQbUNVcVd1aXI0UkpmRStLS3lJK3dDc2QwMjh1c0U5?=
 =?utf-8?B?Q1NTVTVVV3RBNkVlWlJCaEJlK1dhdmNxSEVKb25ueDVEd2JhYjFDQWVLL2hT?=
 =?utf-8?B?RFJmUkZmV1RlemdKZ1FTeXhnMTZhQ2pkelkrbHlEeDcrNEQyb3ZPei8vN0dQ?=
 =?utf-8?B?QzY0MlF2OUJOeG1rQTF1QVlXcXMxUjNSWlZjL0E1K3ZxTmRKd0pIWTRKM3BZ?=
 =?utf-8?B?V21BUlFwbzJPdEFaRTRyNExTUGRWVkdYMTROM1JaWkhpTEhieVRxVTg5cDlW?=
 =?utf-8?B?VSs2bC9NSHZhekdiOEdjU3YzNk55U21sYnNTZDl1VG1jU2tLaDJEL3pZeWFR?=
 =?utf-8?B?QlFDazF1UGJNWk9EY3VXOWVmdXFKSVRkNFJpVWg2QXNYdGlqSWNwYnlsQ0Ew?=
 =?utf-8?B?eEgza1N6RzNCWDVuUG95ME5YRFY5dW42WnM3UzBObVdvSC9kTlNvdnJTRzZC?=
 =?utf-8?B?dkdhSFIzR2daQ0d3YVJ1V3p5dFVML2N3dE9HYXd4elVZNHVxQzNRUkxLNURJ?=
 =?utf-8?B?Q3VaeEVkSGJ6MFoycURwQ0RBZDRUT3dyeFVHTzZ2WTZDWUtlR0ducU9XdDc5?=
 =?utf-8?B?TmtHdlRZUmpKNlVQa0F6NS9VSzlNbGwrTUU2OFE4U0pjL3BHdHRCMUhlRWZG?=
 =?utf-8?B?STFjUDU4RjQ3N1FxNWdkc3Y4N3lkbUppRmFHZlNaM1JwRVM0dlZzd05KVXJ0?=
 =?utf-8?B?QlBBNGtUSXcvUmcwbi9na1ZPQm90UU5aa2Y4RHdSRURSUWR2Nm9aM3h1c3Jv?=
 =?utf-8?B?MjNlWnRocVZkeFhUK2dRU25vRHV1WlFEdFZrNjdzbGlvNFgwKzFVRTF3RHhv?=
 =?utf-8?B?RXBVcy9hQTFDZkFRempBelJmQVNmQVVkM3RqQWpsTGVWbStqdUQzc2VTWlNi?=
 =?utf-8?Q?fsnJ5liu9VZOmhlr2mY/WhUF+YjP4oyL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjNXQjNhMEFFdXFVOWVMWlowQk8yWEZPa1YyKysyQ05QdFI4bHhmWkdqVVRF?=
 =?utf-8?B?ajc5ZS93eC9EcDBId0VEaTFlU1RCUDhSTFVCclRBVWxJaG5oWlJWVW13UlFv?=
 =?utf-8?B?aHJtSVVUWUdxWHAxZHZabmc1Z2lHMWpqbU9uRURodHlyci9DZVVBUmFVemR5?=
 =?utf-8?B?Umw0MERzM1pwVFRDUmsyOHRQSWtlUTBxeERMdHJFQWFYQjdpOEVWWnZCVzFE?=
 =?utf-8?B?YmJXUzZzdERzSnFFWUhBTXpDMWlHZ0U3bzFXeTExK0E1eGhaOThROWJkNlE4?=
 =?utf-8?B?WlJNYnVqZmhteWY4SGQ5TklHdEV5SndvZkRZZWhqWThUcmJoVmxTTkhyZXJ3?=
 =?utf-8?B?cHViU2JoTWV4VHhlMmZmazFwNEt5U2RKWHhaZEtXeGp6OFlBQWljZURMWTZX?=
 =?utf-8?B?Z3FVZ3Mwa1RxSG1EajRjdjYyKzZWWU15TmJUellBdFFJUWpLaEFUOGkyb0lL?=
 =?utf-8?B?cVRxNzdOTUNVMDZqUWZrOTdMUVdqaXZzNHdYNG8vQ0xqQVFKV3lkeVN3MWdR?=
 =?utf-8?B?dUgyYUpWY0IyelZpNVMycFQyQm9SWmpzT1FYTGt1NkRWeEdmZ3NwcEd3VWg1?=
 =?utf-8?B?dkNoWlg1NFpwd3dUbldvalBSNU5yMjN2UlVQTTNvaVlmSnFuRnNNRWM1L3du?=
 =?utf-8?B?dkJTbloySDNlTU5yUWhNSFJRWllBWDFuWmVQRkxoS25YUDRGdk8ybEhmczY1?=
 =?utf-8?B?SlU3UjROcmN4VndDcjdRWENVd09NWExEejdseUExMjVQSW9GYkFYK09aVksx?=
 =?utf-8?B?cnVVNnc1QlJLUy9ydGpDVVZ6NkFGbTRCcUlYVFQyQndxNzQ5eFFYWkQ3SERX?=
 =?utf-8?B?TW1tbDBwZEU2OXVCOVdkMjR0cHc5eWFiUnlZWWNhZmdPUkNnbWJtV1FxM1FK?=
 =?utf-8?B?OFJycEhZbll0VTIrcnZkVk54WWh5Zkl5TitLamFna1FlV0JXRUVxMEVuUU5L?=
 =?utf-8?B?cEtsaDFwQWdVRXVPampleVRkVjF4d2JVTVRFQWRtWFVtVnBqd2d2UWRXczhw?=
 =?utf-8?B?TVgxY2N5YjlhaW44K1RjT1lMQS81ZW82RWpqcG9PNS8xUHEyS0kwbGhCekpr?=
 =?utf-8?B?SElUNVFqZExHbEZYQWFkK3hsYXFUUnRMOTBkdnFUZDhpbitEQUYvcUxabEx0?=
 =?utf-8?B?WEpySnY3Rlp3K3k4RDhRQkVPdVJ4YXB3bHJXL0kwd2hkekZUaHRvKythaVIw?=
 =?utf-8?B?TTZsYXoxSXhTRXlzeFdtdmdNTzJtOFFtNCs4dC9jNG5jTzA5eTJ2b2FWZVJ4?=
 =?utf-8?B?eXpYTGJZcFJ4UkQvMHRRdU9LOEpNQ2VNaUZ2OUtHQWwrdmFKOGFQQTROeEtZ?=
 =?utf-8?B?RGNObFJqYmQ4a0FjQUVuU3pVYnpFa1QrK2JVU1JUZjdYM21RWDd6QkRMNUEw?=
 =?utf-8?B?eHV4YVpGQXFzQW44TC9rdU5MZTU2bGR0aHdCckF2NnpaaHlvTDM1dmpHc2F5?=
 =?utf-8?B?ZU9XdngwYTlFbmRRQ2REaE5uc2crVEFqZGRJYzh1d05QMWxiUURiMGRpcDZr?=
 =?utf-8?B?TWxXYWRLalQrUFZkdSt0UTZuRFpzYURaVHhIVHEreHgvQWlBcmx4UTA4aU1F?=
 =?utf-8?B?TU03WHhSUzZ1V0pEOUtZc1psMjdGVGxYUW1hemV1VVUxLzlXbklZK1dMc2Nq?=
 =?utf-8?B?eDlGNURDeUJKbUxCK0R3MFlmd0x1ZGlUK3N1ME5wMDRKTGl1bm1TZGpObGp6?=
 =?utf-8?B?bzh4R2luVTdRajZRTTc0MmJ2VC9tdDRvSFA0R2VGMU80WTh5N2JTUkkzTm9Q?=
 =?utf-8?B?eElUQUVhYTF3ZUxIMVUxeGdrOEhLQytyYUVLWFNiUS9zSU04cXNlWHJ4alQy?=
 =?utf-8?B?NkpaZm9pRWE5OEIvWG1ZWjU2dnpuVENvaWtTOEVNRTZIcnM2UjhMZ1NxUVBK?=
 =?utf-8?B?R0lHMnMxR0dXVnZUVjRVaWEvbVBNRHFWRmdnMUY1UzY4SEppbnZLa3dwOU90?=
 =?utf-8?B?MW1rUXc0THZ1MENEVlRjQW1xM0lPTXBsRmhBdFB3eS9vU01Jc3RmL1NFcVVO?=
 =?utf-8?B?dS9QMXVHbitHUXpUdUF3V3RrZlRTQnVVSGJxbllhNkFJYkIyZTlUUllFWC83?=
 =?utf-8?B?bFgxZElrYk5PSXc2Vis5eFVZZGtVeHAySGt0SXJlQTBXWU1uM1IzYUtyK3A0?=
 =?utf-8?Q?U9Ak=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7965CE5ECFE26E4A9D81B6E71A313FC7@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f7ca5b-877f-4458-9294-08dd39fb71c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 09:10:26.4243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NyYGwUS7Qgfw/k3Gfshx2kWH/3KQoOjw12LO7GyR4SSGS4I506Q8Y05ivNZVf0p98Cyxi7+7jcGA4vJRZmsIGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6097

T24gMjAyNS8xLzIxIDE2OjQ2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUsIEph
biAxNCwgMjAyNSBhdCAxMToyNjozNkFNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+ICsg
ICAgY3RybCA9IHBjaV9jb25mX3JlYWQzMihwZGV2LT5zYmRmLCByZWJhcl9vZmZzZXQgKyBQQ0lf
UkVCQVJfQ1RSTCgwKSk7DQo+PiArICAgIG5iYXJzID0gTUFTS19FWFRSKGN0cmwsIFBDSV9SRUJB
Ul9DVFJMX05CQVJfTUFTSyk7DQo+PiArICAgIGZvciAoIHVuc2lnbmVkIGludCBpID0gMDsgaSA8
IG5iYXJzOyBpKysgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBpbnQgcmM7DQo+PiArICAgICAg
ICBzdHJ1Y3QgdnBjaV9iYXIgKmJhcjsNCj4+ICsgICAgICAgIHVuc2lnbmVkIGludCBpbmRleDsN
Cj4+ICsNCj4+ICsgICAgICAgIGN0cmwgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcmVi
YXJfb2Zmc2V0ICsgUENJX1JFQkFSX0NUUkwoaSkpOw0KPj4gKyAgICAgICAgaW5kZXggPSBjdHJs
ICYgUENJX1JFQkFSX0NUUkxfQkFSX0lEWDsNCj4+ICsgICAgICAgIGlmICggaW5kZXggPj0gUENJ
X0hFQURFUl9OT1JNQUxfTlJfQkFSUyApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAg
cHJpbnRrKFhFTkxPR19FUlIgIiVwZCAlcHA6IHRvbyBiaWcgQkFSIG51bWJlciAldSBpbiBSRUJB
Ul9DVFJMXG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5z
YmRmLCBpbmRleCk7DQo+PiArICAgICAgICAgICAgY29udGludWU7DQo+PiArICAgICAgICB9DQo+
PiArDQo+PiArICAgICAgICBiYXIgPSAmcGRldi0+dnBjaS0+aGVhZGVyLmJhcnNbaW5kZXhdOw0K
Pj4gKyAgICAgICAgaWYgKCBiYXItPnR5cGUgIT0gVlBDSV9CQVJfTUVNNjRfTE8gJiYgYmFyLT50
eXBlICE9IFZQQ0lfQkFSX01FTTMyICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBw
cmludGsoWEVOTE9HX0VSUiAiJXBkICVwcDogQkFSJXUgaXMgbm90IGluIG1lbW9yeSBzcGFjZVxu
IiwNCj4+ICsgICAgICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgaW5k
ZXgpOw0KPj4gKyAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gKyAgICAgICAgfQ0KPj4gKw0KPj4g
KyAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQz
MiwgdnBjaV9od193cml0ZTMyLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ0FQKGkpLCA0LCBOVUxMKTsNCj4+ICsgICAgICAgIGlm
ICggcmMgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIC8qDQo+PiArICAgICAgICAg
ICAgICogVE9ETzogZm9yIGZhaWxlZCBwYXRoZXMsIG5lZWQgdG8gaGlkZSBSZUJhciBjYXBhYmls
aXR5DQo+PiArICAgICAgICAgICAgICogZnJvbSBoYXJkd2FyZSBkb21haW4gaW5zdGVhZCBvZiBy
ZXR1cm5pbmcgYW4gZXJyb3IuDQo+PiArICAgICAgICAgICAgICovDQo+PiArICAgICAgICAgICAg
cHJpbnRrKFhFTkxPR19FUlIgIiVwZCAlcHA6IGZhaWwgdG8gYWRkIHJlZyBvZiBSRUJBUl9DQVAg
cmM9JWRcbiIsDQo+PiArICAgICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNi
ZGYsIHJjKTsNCj4+ICsgICAgICAgICAgICByZXR1cm4gcmM7DQo+PiArICAgICAgICB9DQo+PiAr
DQo+PiArICAgICAgICByYyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdf
cmVhZDMyLCByZWJhcl9jdHJsX3dyaXRlLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ1RSTChpKSwgNCwgYmFyKTsNCj4+ICsgICAg
ICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHByaW50ayhYRU5M
T0dfRVJSICIlcGQgJXBwOiBmYWlsIHRvIGFkZCByZWcgb2YgUkVCQVJfQ1RSTCByYz0lZFxuIiwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgcmMpOw0K
Pj4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4gDQo+IEkgdGhpbmsgd2Ugc2FpZCB3ZSB3YW50
ZWQgdG8gYXR0ZW1wdCB0byBjb250aW51ZSBoZXJlLCByYXRoZXIgdGhhbg0KPiByZXR1cm5pbmcg
YW4gZXJyb3IgYW5kIHRodXMgcmVtb3ZpbmcgYWxsIHZQQ0kgaGFuZGxlcnMgZnJvbSB0aGUNCj4g
ZGV2aWNlPw0KSSB0aG91Z2h0IHRoZSByZXN1bHQgb2YgeW91ciBkaXNjdXNzaW9uIHdpdGggSmFu
IHdhcyB0aGF0IEkgb25seSBuZWVkZWQgdG8gY2hhbmdlIHRoZSBhYm92ZSB0d28gZXJyb3IgcGF0
aHMgdG8gYmUgImNvbnRpbnVlIi4NCklmIHRoZXNlIHR3byBhbHNvIG5lZWQgdG8gYmUgY2hhbmdl
ZCwgSSB3aWxsIG1vZGlmeSB0aGVtIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCg0KLS0gDQpCZXN0
IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

