Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCNoNBYFq2nDZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18360225525
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1248115.1546447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyYKC-0003tC-Hn; Fri, 06 Mar 2026 16:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1248115.1546447; Fri, 06 Mar 2026 16:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyYKC-0003qd-Ej; Fri, 06 Mar 2026 16:46:52 +0000
Received: by outflank-mailman (input) for mailman id 1248115;
 Fri, 06 Mar 2026 16:46:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/aL=BG=citrix.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1vyYKA-0003qX-Cq
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:46:50 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eaf7dda-197c-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 17:46:45 +0100 (CET)
Received: from SA3PR03MB7419.namprd03.prod.outlook.com (2603:10b6:806:39c::6)
 by LV4PR03MB8235.namprd03.prod.outlook.com (2603:10b6:408:2d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 16:46:41 +0000
Received: from SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc]) by SA3PR03MB7419.namprd03.prod.outlook.com
 ([fe80::8254:2aeb:5a33:a6dc%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 16:46:40 +0000
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
X-Inumbo-ID: 0eaf7dda-197c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgIedQq2bEtIBoExFb+XjPZIZQHpnkLwJymO+D1SMJjzpqOpTb6XrtDTl4TQtfbg0rJMZFadCEF7uMHvqj2khucQc5E8p9UGHaimbxk7NeASqbuqcAwlGSaMYsjqAlZgC8JWTRr1agWsXG7Flu+/t/9QVg+nN5B/anI7iA3kpWSngA9ekAbBPULbvN1s2nDCXIskCgLEzBr08cAauMjl84i9KvAKZuM22j7jT7Ag7Nk2x+o7oGFIoTzU/SG7QayuAsIFZiJlNgrrJ9JnulKTZufWAEDplBhdGOj6BGz6doRCFqGqv8ehFOsZeK010sm2Ni18FuE/aBgDgTe5j/qB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwr/MMETSzLgWbupWT5oQkxt+MZIlNWPAb1MSClhT14=;
 b=nU8VBkdhM25XRpHh+vENB/2C7oxg4akfwrhYiCVHc+0jTu/hra4gWjh4/np/P63/iPwZ0QZ4BqeAE0Tth9ifttFg8tzSI+utbaoC7/lHKygESS4tYNsR44I33wOBnmfqPDdWYI/7gOu4KhAtBiO9e8pFGxac9Uz5gKyjJ5otlhy62F2bXoe/PGGraYjaeTzvRbKxJHYiI5QS7eQKJR02qEz4JIAINSOUBpp5oCS2WONNbQnWhzR5QjQ/MBXwfBOzsFo3HlmzWVCf39F9IVRs9v9iz43LAW4sNGkN83H+P5cOCZNW9JtISI6ruCpG4MPNtzgk6l2RyqH213uuIxhTGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwr/MMETSzLgWbupWT5oQkxt+MZIlNWPAb1MSClhT14=;
 b=q9TT3W3fEI5rO7ADepXMnd7ECUU0e4bBcQa0WDNeT5Qaft+lFm3FcMIQBnAydGDn9EIu2n4ngE44v17s+2or2OWe/rOTWWwnWfbzCDKuBUzxpdb7K3EJm7WK5Yy7Xn4IqT3IyPheyTOIew7iaXfFVj0y+SL//3CQjAU9Gkaskvc=
From: Edwin Torok <edwin.torok@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/4] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang
Thread-Topic: [PATCH v2 1/4] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang
Thread-Index:
 AQHcp9gBGAcR9pePk0GnYyu6dQzUZLWc3C6AgAATegCAAAfEgIAABTyAgAANVwCABLepgA==
Date: Fri, 6 Mar 2026 16:46:40 +0000
Message-ID: <63CC9001-B239-4806-B188-7C8A6BF63DF5@citrix.com>
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <358a87d89d50475a57f2a5d6ebea01d95a1df6d7.1772189234.git.edwin.torok@citrix.com>
 <766824c8-2ec5-45bd-9aed-1e84ad3ff779@suse.com>
 <B5EFCE28-79BA-403B-8F44-C4E7606BACE7@citrix.com>
 <d5c0e218-bfc4-4f37-901c-b622f90b7bd2@suse.com>
 <004F02CE-B8C8-40B5-8453-C754EBE92022@citrix.com>
 <0210cf5c-6dc3-4db5-aa2a-0e14e634b463@suse.com>
In-Reply-To: <0210cf5c-6dc3-4db5-aa2a-0e14e634b463@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR03MB7419:EE_|LV4PR03MB8235:EE_
x-ms-office365-filtering-correlation-id: c89b6180-dd50-48ba-aa6c-08de7b9ff113
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 AVpM49B1jD3JMgc3CSHcwySaI/BIsIiZUemO7jv3Fp46zqPLooH1lEAILu7rBYoi4OAJdJeXXm+6F5QSVBBtHPX8eNXgPJ/fuPClABDu+Y37DVYYd1viQzhsuJ08+9At9Jdon9IRE8YlU/UNTiqBfUFBLjZRJk6KUkz8EGoNMjymyShheadudAXiKaoyT3PEsNIS7ODh6+YKDo3wLmI2sGeUjQrDZubkWE+CeztllxY3O6ol0JKmWDiKO96ntMJ4B6dOnDrxDuqgzYu73Pyx7kntAVc1APNZzGtDq4fIZX4Je1fGN7xHruav8kVZFnRwPz8xU+UuU+LZYaKAw9kKjBlDvttUUG5WNB4BlY3PDC/mjLs08kzYKFHag/tUqCaUHiHCag9l+09T3fUFfJWqr1MzhujRUSMPCnGTHdT3Ht4q4DHU3ZVbr/QSaBDOwVUEeueds/f0zqdPhc9dBC6eVx6LKizPEBPB36voBjZeVE7bl5RzoenW8JSMwCp3rcfuN7eqE3q3Jc35eYvDQGQj/wTlnCqBEcT3jZQCV1K1l2xBgbjzsMMrgp5uen7CYvS+aaRp0DxpZ/9ccAGX0Ob299fU7GKhTFKoNWzE546QjnAk3jXdde49KLyiulqlIB6L6aGQ6p7fLYtv6lhe4HJvK0a3ROfwQxoLlI6t/o1JdhCEssgRMD2LgGsOK/ly+l9eCA+HdfNP3np3KUooPV0EzYRRmN4g/bkGkJil7ANYgXd0rQ37KpZ+RqU4p9BSm0EXUrNlG1JfVm76Al+0C0ssWk/WypwyVsY5Tc6U/YsHrkU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR03MB7419.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wmo2VFo4aU1jVGFxaTVqeGVNem8wdFo4YjQ1UG5lTHcyTFM1SXF4eVNwdXhm?=
 =?utf-8?B?RWphRFluMmt0bm9lS3VXUXk5U1ZDVkxrcThXN2h1KzNvM0w4TjRnUTlHR3Zx?=
 =?utf-8?B?em9sLytJTjZycGpDcTVKNUhFMndOZXpZeG5NWkN0bmdFUmVLSnZKVWhuRGE0?=
 =?utf-8?B?cEFyVVdpWDdyaDRVcStLVlovaThqS29SVEVTeWRWWVJtWkxhN3RndHBkb0VI?=
 =?utf-8?B?ZWtJbFdPWGtPZGtyRE5BbDJKNnhZOWFvUnRRQjJkbGIvN3JtRDdBZElLMERz?=
 =?utf-8?B?T2VoSDkwQTJQbTAwdmFVT2tob0ZZY0RodHVTd0VsVUFFVzRaRTA5Z1pZQWhw?=
 =?utf-8?B?SXdJY296WktzWnc4MmtmQUZ1V0x4VVp5dU4wR2M4T2FJS3VhZUQzVW9ZRWhV?=
 =?utf-8?B?azZ2ZHFCZVg4Qkc3cE05eVQ5QU1Eemx3MUNKTTk1K3p2ZnU4dDQ2OWJxZDlL?=
 =?utf-8?B?MHZka001RklONnlJaDRid1IvVXovWlhXOUVyenI2cS9QWmNObFdMY0cyY0FW?=
 =?utf-8?B?alQwc3pqamp0K0VPQmJNbDJSZktsR2VuV21WS2FmcjBycC9DRVRJMG5SNmpQ?=
 =?utf-8?B?Y2t2UytVcG9aSnM0eWNlMDVlNFV0Y1g4b1ZJNEoxZEZ1SlduVDNIL2FmMFJW?=
 =?utf-8?B?QzRmWFUyMFJNSGhJNURzZDltUGZ6NFQ5TkZhWjcxMzRZWnh1Mi9qZ2ZwZXBu?=
 =?utf-8?B?M3crWHBiL0dLTVp2UFBBM1BSNmFpY3Byb1ZYazJENFZiVGRuSDgxeEtYZ0Zj?=
 =?utf-8?B?VGZzbnB5cGI2bG5FK2QwS3l4SDVkeGhicmxnRm54Y3REb3p5ZVZPc0E4end3?=
 =?utf-8?B?eVp2N2p6SWlwd2N1SEgzdTZJbU9OVkVYMWFTbWpLb21XMHozU3ZDSVdxZXlL?=
 =?utf-8?B?ZjhBRTVMVWpSMjZDNWtOU0kwY2FyalZ6OE5KSmovVWJuVXl2OEVaR3BHMDhJ?=
 =?utf-8?B?ZlF4VlNlS1NXaTRSb2ZidGYrQlR1enl2WElmTXdXNG00ZEhsaVdPTzBsaGZ0?=
 =?utf-8?B?MmgrTWdCeDBqUmhIZ094K2ZCNE5nQlMyeER2dC8xTWozQzYxbldMRGJWRmxh?=
 =?utf-8?B?Mldub2ltTzZKLzNKczBMbzBmV3pMT21vZHdCTkVUTjhOUXBZaW1KVVFmZkwv?=
 =?utf-8?B?S1BkOThvS1lNVnJaNEl1dVQrR2MxY0FOdWlBMkNNSTVSMDNGamMwY3ZPWkhB?=
 =?utf-8?B?TjAxejJhR2dRSTZrM3JMczIvR0dPVUZselVBb2VuZUFkUTNTTktpS2YzQTlT?=
 =?utf-8?B?bi9lRzExZ21hcGVVQVdyem14Y1R1alg2YWRuOXJYaWU4SVBGMUs4RThZOHcx?=
 =?utf-8?B?a0RjWGlsTVUvTUYyVDRiZEdNNFRvWGdyeVEyaVNhT3RwMlNYVU5wUHAwaW13?=
 =?utf-8?B?YTlmVEJvaE1PalkzMDJ3b05NMHUyK0RZWGhkQjhNTFkraVk3QVVsTzVrc2NE?=
 =?utf-8?B?ZE5iZHdlNisyeDZCZnRMNWV3TC9hWlo3azR0SWJpTTl3Z0o3c1RXNGJpaFBD?=
 =?utf-8?B?OFd5emdWMGMzWGpMUjlKQVMvTkxFaktDYlk5c1dOSVpLamh4MWdhQ3pFQ1dT?=
 =?utf-8?B?b2hCTWFWaDg3ekcra3kybzk4UEdiNk1JbnRRT1NDREJsVERJMXhnekFTSmQ5?=
 =?utf-8?B?Nk9jc3JlYVBYUzhDUUo0cFljd1FUWnQ2VTV6Y0hHZjFrU08zSzFvVi9MUXJj?=
 =?utf-8?B?bHMzNUtLZzZWcitmRE5kNUNXZlduaGx3Z3owWWVlZmVoZVhBRDMvUTVCd0Fy?=
 =?utf-8?B?c3NESnJNVUdWR3RSdVFSTzZjdktON3U5QVZ6TGFwZU5nVG9Rbk9uTUc4eUpk?=
 =?utf-8?B?R0NabWdFdlRhNUVRa2dVZ0lDbkp6Y29JTGtyeHd0alNXejdvRE1tKzRzTFVD?=
 =?utf-8?B?NFEzU2owRmlNeCtvcmsxTGZmb3FPNXltMDhtdXhvQlIxUXgxRzlSZzFtM3pn?=
 =?utf-8?B?YzlIaktYRmJlNUV3Mk45NFVUQ1RsNVQ5MnoxTFdBUU9FeTY1eUNwODJBVzU1?=
 =?utf-8?B?VDBoWDlWczdFclRwUDJSNnVwdnE4QitHSkltT1pFUFBHMkxPWTdxNnVkWEYv?=
 =?utf-8?B?aUx3ck12OXI5c2hwbWF5Zks0MEhFeExkN3o4OWFvWWVKZnNUMm9NU3E3S3FI?=
 =?utf-8?B?STMyQ29iV0JRRG1lWlZDdzhQeE4vRm1mdVF3OEJwRThzdlZsb0lpQlhhSmg5?=
 =?utf-8?B?V3BybmFZS2F3dUk3Ri9jVmMrdG1ZYjdDNG5QUTlDS3RrVVI1T1F5cnJrbnUr?=
 =?utf-8?B?SEl4anJDaTZWR0JzenJRYU1yV0lHQ3EvVTdQUUpWekUxRTU0bWdQdHdaNVpk?=
 =?utf-8?B?RFZTaW8wMzZzWUU1R0dFWGU0SFNYcUkveTFTOUxNVFBlc0hSYnFkamQ2Q0VI?=
 =?utf-8?Q?WA/5C44w6pxMNt9A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4CFCF684022434AB21F288AE65010F0@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR03MB7419.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89b6180-dd50-48ba-aa6c-08de7b9ff113
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2026 16:46:40.7585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AcjJVABH6L/9gy5HSGnbdOGdZxsLAQ+Ebct/RLUIrWpHFoZZcba7xNTqgjlroruIS1fei/7YPzoK08UakDItEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8235
X-Rspamd-Queue-Id: 18360225525
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	APPLE_MAILER(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwin.torok@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

DQoNCj4gT24gMyBNYXIgMjAyNiwgYXQgMTY6NDMsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMy4wMy4yMDI2IDE2OjU1LCBFZHdpbiBUb3JvayB3cm90
ZToNCj4+PiBPbiAzIE1hciAyMDI2LCBhdCAxNTozNiwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToNCj4+PiBPbiAwMy4wMy4yMDI2IDE2OjA5LCBFZHdpbiBUb3JvayB3cm90
ZToNCj4+Pj4+IE9uIDMgTWFyIDIwMjYsIGF0IDEzOjU5LCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4gT24gMjcuMDIuMjAyNiAxMTo1OCwgRWR3aW4gVMO2csO2
ayB3cm90ZToNCj4+Pj4+PiAtLS0gYS90b29scy90ZXN0cy94ODZfZW11bGF0b3IvdGVzdF94ODZf
ZW11bGF0b3IuYw0KPj4+Pj4+ICsrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci90ZXN0X3g4
Nl9lbXVsYXRvci5jDQo+Pj4+Pj4gQEAgLTE4ODIsOCArMTg4MiwxMyBAQCBpbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqKmFyZ3YpDQo+Pj4+Pj4gI2RlZmluZSBkZWNsX2luc24od2hpY2gpIGV4dGVy
biBjb25zdCB1bnNpZ25lZCBjaGFyIHdoaWNoW10sIFwNCj4+Pj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgIHdoaWNoIyNfZW5kW10gYXNtICggIi5MIiAjd2hpY2ggIl9lbmQiICkNCj4+Pj4+PiAj
ZGVmaW5lIHB1dF9pbnNuKHdoaWNoLCBpbnNuKSAiLnB1c2hzZWN0aW9uIC50ZXN0XG4iIFwNCj4+
Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI3doaWNoICI6ICIgaW5zbiAiXG4i
ICBcDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIuaWZuZGVmICIjd2hp
Y2giXG4iIFwNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI3doaWNoICI6
IFxuIiBcDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIuZW5kaWZcbiIg
XA0KPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnNuICJcbiIgIFwNCj4+
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIi5pZm5kZWYgLkwiI3doaWNoIl9l
bmRcbiIgXA0KPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLkwiICN3aGljaCAi
X2VuZDpcbiIgIFwNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIi5lbmRp
ZlxuIiBcDQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICIucG9wc2VjdGlvbiIN
Cj4+Pj4+IA0KPj4+Pj4gTmljZSBpZGVhLCBidXQgd2h5IG11bHRpcGxlIC5pZm5kZWYsIGFuZCB3
aHkgZW1pdHRpbmcgdGhlIGluc24gZXZlbiBpZiB0aGUNCj4+Pj4+IGxhYmVscyBhcmUgYWxyZWFk
eSB0aGVyZSAoYW5kIGhlbmNlIHdvbid0IGJlIGVtaXR0ZWQgYSAybmQgdGltZSk/DQo+Pj4+IA0K
Pj4+PiBJIHRoaW5rIHdlIHN0aWxsIG5lZWQgdG8gZXhlY3V0ZSB0aGUgaW5zdHJ1Y3Rpb25zLCBz
byB0aGV5IGNhbiBiZSBjb21wYXJlZCBhZ2FpbnN0IHRoZSBlbXVsYXRvci4NCj4+PiANCj4+PiBP
ZiBjb3Vyc2UsIGJ1dCB0aGV5IGNhbm5vdCBiZSBleGVjdXRlZCB3aXRob3V0IGhhdmluZyBhIGxh
YmVsLiBXZSB1c2UgdGhlDQo+Pj4gbGFiZWwgdG8gcG9pbnQgdGhlIGVtdWxhdGVkIElQIHRoZXJl
LCBhbmQgdGhlbiB3ZSB1c2UgdGhlIGVuZCBsYWJlbCB0bw0KPj4+IGNoZWNrIHRoYXQgYWZ0ZXIg
ZW11bGF0aW9uIHRoZSBlbXVsYXRlZCBJUCBoYXMgYWR2YW5jZWQgYXMgZXhwZWN0ZWQuDQo+PiAN
Cj4+IE9oIHRoYXQgbWVhbnMgdGhhdCB3ZSB3b27igJl0IGFjdHVhbGx5IGJlIHRlc3RpbmcgYW55
dGhpbmcgdXNlZnVsIGluIGl0ZXJhdGlvbnM+PTENCj4+ICh0aGUgdGVzdCBwYXNzZXMsIGJ1dCBp
dCBydW5zIHRoZSBzYW1lIHRlc3QgYXMgaXQgZGlkIG9uIGl0ZXJhdGlvbiAwKS4NCj4gDQo+IE1h
eSBJIGFzayBmb3IgYSBsaXR0bGUgbGVzcyBib2xkIHN0YXRlbWVudHM/DQoNCg0KRmFpciBlbm91
Z2gsIEkgcHJvYmFibHkgc3RpbGwgZG9u4oCZdCBmdWxseSB1bmRlcnN0YW5kIGhvdyB0aGlzIHdv
cmtzLCBhbmQgSSB0ZW5kIHRvIGp1bXAgdG8gY29uY2x1c2lvbnMgdG9vIHNvb24uDQoNCj4gT2Yg
Y291cnNlIHRoZSAybmQgaXRlcmF0aW9uIGlzbid0DQo+IGlkZW50aWNhbCB0byB0aGUgMXN0LiBU
aGUgaW5zbiBlbmNvZGluZyBpcyB0aGUgc2FtZSwgYnV0IHRoZSBvcGVyYW5kcyAodGhlIG1hc2sN
Cj4gaW4gcGFydGljdWxhciwgaS5lLiB0aGUgdmFsdWUgJWszIGhvbGRzKSBhcmVuJ3QuDQo+IA0K
DQoNCklmIHdl4oCZcmUgdmVyeSBjYXJlZnVsIHdpdGggaG93IHdlIHVzZSBwdXRfaW5zbigpIHRo
ZW4gaXQgbWlnaHQgd29yayAoZS5nLiB3aXRoIG1vcmUgY29tbWVudHMgYXMgeW91IHN1Z2dlc3Rl
ZCkuIA0KDQpJIHRoaW5rIGl0IGNvdWxkIGdvIHdyb25nIGlmIHRoZSBjb21waWxlciB3b3VsZCBl
bWl0IGEgY29uc3RhbnQgdGhhdCBpcyBkaWZmZXJlbnQgaW4gZWFjaCBsb29wIGl0ZXJhdGlvbjoN
CnRoZSBlbXVsYXRvciB3b3VsZCBiZSBnaXZlbiB0aGUgc2FtZSBiaW5hcnkgc2VxdWVuY2UgdG8g
ZW11bGF0ZSwgYmVjYXVzZSBpdCBhbHdheXMgcmVmZXJzIHRvIHRoZSBsYWJlbCBmcm9tIHRoZSAx
c3QgaXRlcmF0aW9uDQoodGhlIG9ubHkgbGFiZWwgdGhhdCBleGlzdHMgd2l0aCBteSBwYXRjaCks
IGFuZCB0aGVyZWZvcmUgdGhlIHZhbHVlIGlzIHRoZSBjb25zdGFudCBpcyB0aGUgb25lIGZyb20g
dGhlIGZpcnN0IGl0ZXJhdGlvbi4NCldoZXJlYXMgdGhlIGFjdHVhbCBleGVjdXRpb24gd291bGQg
dXNlIHRoZSBhY3R1YWwgdmFsdWVzIG9mIHRob3NlIGNvbnN0YW50cywgd2hpY2ggYXJlIGRpZmZl
cmVudCBpbiBlYWNoIGxvb3AgaXRlcmF0aW9uLg0KVGhpcyBtYXkgcmVzdWx0IGluIGEgZGV0ZWN0
YWJsZSBjaGFuZ2UgaW4gdGhlIHJlc3VsdCBiZXR3ZWVuIHRoZSBlbXVsYXRvciBhbmQgYWN0dWFs
IGV4ZWN1dGlvbnMuDQpJZiBpbnN0ZWFkIG9mIGEgY29uc3RhbnQsIGl0IGVtaXRzIGEgcmVmZXJl
bmNlIHRvIGEgcmVnaXN0ZXIgdGhlbiB0aGUgcHJvYmxlbSB3b3VsZG7igJl0IGV4aXN0LCBiZWNh
dXNlIHRoZSByZWdpc3RlciB3b3VsZCBjb250YWluIHRoZSBjb3JyZWN0IHZhbHVlIG9uIGVhY2gg
aXRlcmF0aW9uLg0KDQpJZiB3ZeKAmXJlIGNhcmVmdWwgdG8gdXNlIHRoZSBhcHByb3ByaWF0ZSBj
b25zdHJhaW50cyB0aGVuIHRoZSBwcm9ibGVtIGNhbiBiZSBhdm9pZGVkIChlLmcuIEkgYXNzdW1l
IGEgcmVnaXN0ZXIgY29uc3RyYWludCBtZWFucyB0aGF0IHRoZSBjb21waWxlciBtdXN0IGFsd2F5
cyBwdXQgdGhlIHZhbHVlIGludG8gYSByZWdpc3RlciBmaXJzdCBhbmQgdXNlIHRoYXQsIGV2ZW4g
d2hlbiB0aGUgdmFsdWUgd291bGQgYmUgYSBjb21waWxlLXRpbWUgY29uc3RhbnQpLiBCdXQgdGhl
IG1hY3JvIGl0c2VsZiBjYW7igJl0IGNvbnRyb2wgd2hhdCBjb25zdHJhaW50cyBhcmUgdXNlZC4N
Cg0KQWx0aG91Z2ggaXQgbWlnaHQgd29yaywgdGhpcyBhcHByb2FjaCBpcyBxdWl0ZSBicml0dGxl
LiBGb3Igbm93IEkgc2VudCBhIFYzIHdoaWNoIHVzZXMgLU8wIGZvciB0ZXN0X3g4Nl9lbXVsYXRv
ci5vLCB3aGljaCBpcyBtdWNoIHNpbXBsZXIuDQotT3Mgd291bGQgd29yayB0b28sIGlmIEkgcHV0
IGl0IGludG8gdGhlIGNvcnJlY3QgcGxhY2UgKGhhcyB0byBnbyBpbnRvIEhPU1RDRkxBR1MsIG5v
dCBDRkxBR1MpLCBidXQgdGhlbiB3ZSByZWx5IG9uIHRoZSBvcHRpbWlzZXIgdG8gYWx3YXlzIGNv
cnJlY3RseSBlc3RpbWF0ZSB0aGUgc2l6ZSBhbmQgYXZvaWQgZHVwbGljYXRpbmcgdGhlIGFzc2Vt
Ymx5IGJsb2NrLiBTaW5jZSB0aGlzIGlzbuKAmXQgcGVyZm9ybWFuY2UgY3JpdGljYWwgSSBzdWdn
ZXN0IHVzaW5nIC1PMC4NCg0KSWYgYSBiZXR0ZXIgc29sdXRpb24gaXMgZm91bmQgdGhlbiB0aGlz
IGNhbiBiZSByZXZpc2l0ZWQgYWdhaW4gKGUuZy4gb25lIGJhc2VkIG9uIC5pZm5kZWYgYXMgZGlz
Y3Vzc2VkIGhlcmUpDQoNCg0KQmVzdCByZWdhcmRzLA0K4oCURWR3aW4NCg0KDQo=

