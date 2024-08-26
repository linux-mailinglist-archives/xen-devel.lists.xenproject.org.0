Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FCF95E83C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 08:06:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783281.1192598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siSrX-0001Si-Kn; Mon, 26 Aug 2024 06:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783281.1192598; Mon, 26 Aug 2024 06:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siSrX-0001PX-H5; Mon, 26 Aug 2024 06:05:59 +0000
Received: by outflank-mailman (input) for mailman id 783281;
 Mon, 26 Aug 2024 06:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dc7R=PZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1siSrV-0001PR-TQ
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 06:05:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2415::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40a0c0b2-6371-11ef-8776-851b0ebba9a2;
 Mon, 26 Aug 2024 08:05:55 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH7PR12MB7259.namprd12.prod.outlook.com (2603:10b6:510:207::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 06:05:51 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 06:05:51 +0000
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
X-Inumbo-ID: 40a0c0b2-6371-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/q5mYRTls9Wf7gScdYueFrDGGioOe1xk1atMi9TJCPmugqwu/OtCh1u+M2PrDzVfJPJMNUAMy938W96IjtYKZI6T780VEqnwBBXeM+THCZblziStH208FqNtuhEGBhDkxsEplAOramIFjHporaHI8piS2jF+iWSmx430o9Dwk8B8WZbndv+vSQtsT2S4sKt6Zei7oAmec3XVDT7FwCgDOfUj3AZOqmHSNqwYMUmG1lIlprOmHI7j2uHFgxfLH9TQCCieedTPoN9n2QN1yjduwp4URvqjTOTgnThB2mqNVFGh6qZZfuT6d0vBjowkkaKeNyL0ddmDv0fT0h/DHJiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaORtK8PWKvBrHG5Epxn6hf3igeKJA2hFCchxO95M1w=;
 b=s069CI2UJJuXED4jd20qE0lMnVRiCL4mkfuzHoGyqhDLYY33JPqlbjXMnHWpZ0Gir3ZyZwiDjjgA4rP1dUbcWsBwo9ggGcO8PdVwFiGXLsd9iDuzlykcs4KXqXr1rKZevKo2T1XsY3ihvaSBHka6KxAkyOMuAWbOntUlFjeqQ9wYoZBSRjqKy/qy5xeiLtldg3wZg8+e3JJ3FY8SBsTrtICBit8wEb7qShIjPuOZskgSJuNs7vff+Te0ZpCUSu/uA+WrFhjgCu4pBhTLrTeIHth7UmvjBsZI7dtAlIfMDA6XF1Nll82teXyaiOJKTvJ9QoCnzpX2g5RSHJ4GsM+2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaORtK8PWKvBrHG5Epxn6hf3igeKJA2hFCchxO95M1w=;
 b=cRz2fsLFM6+KCOrAf7xCVeDqLdBr4spW//moHjKlwuDK1q+fATp53POqLdR0GU+bT8qfEOT4+wvn+j6dofvrDBZd5g3sMQK6LkbRKLETKYXMNf+QWqQMdBNSAFinSyf2ElzoRkBJpB6u7iVJXXsr+9q4oll9Yr4lM+E4scb+IxU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony@xenproject.org>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v13 3/6] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Thread-Topic: [XEN PATCH v13 3/6] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Index: AQHa78yvTwlhsUHkMUeYQ1q1oq6CvbIuUVKAgAHlWYCAAKhsgIAIwXQA
Date: Mon, 26 Aug 2024 06:05:51 +0000
Message-ID:
 <BL1PR12MB584910473DADE9A5C563E6C4E78B2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-4-Jiqian.Chen@amd.com>
 <745cd8cc-59c2-44b8-b42b-1e5e0b3026ca@suse.com>
 <BL1PR12MB58496D2638998EC4DC2572C8E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2408201713420.298534@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2408201713420.298534@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7897.019)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH7PR12MB7259:EE_
x-ms-office365-filtering-correlation-id: 45579ba5-a353-4ca8-a729-08dcc5952353
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TC9QQ3dkQWl6VXdrVzY3UCtYUS9BQVpuVTZwL2ZKNjdNTW1UUEdUS3ZmMmdH?=
 =?utf-8?B?RUxTRXZFYStDU3Q4ZGxBL05IWkdzdkRYWHN1Mi9HaU9vQUluYVRjc2RwTE9t?=
 =?utf-8?B?ditmdG40YkpsaHN2cWs3R21nWGJsN1FjaGZMTTNHRjdLU2ExRGFVYVBtV3Rx?=
 =?utf-8?B?SGRMc3lHcFlKTWgxWnVLend4eU9FeG0vbDE1RTRxZythY3ZxY1loTm1XQi84?=
 =?utf-8?B?YXNNdUE1d2tiSC9tVEwxQUJGbGVOQmowa2FkdEltOTJkQUdqSlg0NllFVkg2?=
 =?utf-8?B?YzdtTWZHRUhOeFRYVHQ5MnZCMW1XelMya2NxNXJLZnBidXAyOVdzcjY5MkZR?=
 =?utf-8?B?a0NpaE5ESmZUNkFYMnNlUk5lSkVkVmlLSVIzL0lLU0NpcmxFQlpzcTlaeGww?=
 =?utf-8?B?VzFzampTdVVPMlZwMFMyWGFpdE16aGdFMmdHa1ZJNlhHM3pZendkazBDeTZu?=
 =?utf-8?B?U3hEdCtiNGpsM3NLeGJVSytSdmp2YXV5SmdvcFRlN1hrTGRKK3JLM25LdVY3?=
 =?utf-8?B?MUxUSmtzNm03Qk9RQW5sQTVUWlJiZzJNc1ljUThaSzVEdVZqWG1xUTdicitm?=
 =?utf-8?B?eU9IbVV0YWpDRy9lRDdETHVaRnVSeVZPOEhUVmZvTmRFSkwybnNxOTlQaC9X?=
 =?utf-8?B?R1pPbTVZYnAvd3VKczRnUmw3VjdOakcvWjhhTDYyVDZvbGJoN2daQVRpamE0?=
 =?utf-8?B?dGIrNzllaEFETUNOOGFKUTM5Y1ZiOHg1bTFtdG9qd2FNVXM5eHpxTTN2YVdm?=
 =?utf-8?B?TGl1NjdFNFRXcndZQUh4NmVseXk3R2lVTnA1aFRkdWNJRzhsbTkyNlk5NWZC?=
 =?utf-8?B?RExQcDBVN2REUFdUZXFHZVdJT1BsWThkSlpUTGgxa3pzMkE1UHZUdElDK0xC?=
 =?utf-8?B?V0oxdk56RUYwTEY1N1RiYnZPMDZpVGN0RGFRblZTOXprbm9ONXozTE1tekds?=
 =?utf-8?B?YmFNRlRMR1VOaVdteC9KNDJKYXNlTXNrNWI5YjdtOFAwYmo2emNIdDRHajhl?=
 =?utf-8?B?U3ZEZjcxNXRSRkVTUC9oVDdqR2FWenBIYTRpSVl0OURuSUx5cmwzMmVhUFM0?=
 =?utf-8?B?TWp1TStoaC9YSmRETmV3TlFsL3JNVWdhT0lNblUvb05TYXFiNHI5dmRsTy90?=
 =?utf-8?B?R3MvYjRyZ0w2bmFldFZQNW9WMjFnYjFaVGhuQjZySVhUWklEV0s1cDBkclRK?=
 =?utf-8?B?a2V1ZTVBYUJSYjJLM3Z2NDBmeVZWemRTTjMvK3BMT1I3OEd2blg3MmFaRzlR?=
 =?utf-8?B?OStZeFgrVWs1N0U5SGNFWXhWblpaV2hRd2Nkc0ttc2hYbXdONVA2cnVNZENx?=
 =?utf-8?B?OGNvZmJKYUgxTGMrSUg4VnRKMVJXWFVFRk83TFk0akc5MHYrbUFSRlMwMWR4?=
 =?utf-8?B?SWFHYXArUlh0V05UUXlsOENnNTJQT3JLeXc1VXB2NWNFWDJnQ2E1NlhHeDFI?=
 =?utf-8?B?WjIwTGZqd1lhSjhNaFZUZGpNOTdYU1lVRHFWSCtuanVHQ1JGcEhKamJINTRq?=
 =?utf-8?B?d0RHSG1Xb0tmZFhyZEJuSng2VTlXbmJMOU1UZzB4eCtMNHpzQkRuYXVZZEVm?=
 =?utf-8?B?Sk1hazA2SmhYaG9RUlorSXlCSzNtQXM0WGlDQ2tIdTdoWTlyYkFIVXczZk5q?=
 =?utf-8?B?NlZUamxidTREVGM4cmkwNnFvOHFtNHhHblByM3BqVlF5cUk3Q2szaGIzUGZK?=
 =?utf-8?B?eXQ1Q0hmSkMzVER1aVlLSFhDMGl5MFpyYUFzSEFIdXllWi93TFZseDByZXAz?=
 =?utf-8?B?RXVTWlpTcWlxem5ZMmRURTZsS0NKNkJva1pTV1J0MndWVTd2ZERSOE0yMzFR?=
 =?utf-8?B?VVI0VmQ4TVY5YkJpUlg3UUgxTVZxMWdmSVVhMVpvdUdHN3NwaHQzYTd0Ky9G?=
 =?utf-8?B?WVhHZUQ3QkdpazFmWkVwY3g0Y1VIckRoTXVvdE1QUERLcUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUlJU1pRcW91U0tiQ2JwK0QxamI2bUNEQWVtckg1RHVFYitUc05EdGIzRkJ4?=
 =?utf-8?B?SXN4bHNNeHgwdVppU3EraVhrWXMxd3FLK2RIT2JPb2l4RGYxaDEyTWlIdlhO?=
 =?utf-8?B?aHVUeWJaY2htRDNsU0l3amo1eGUwbld6VFVUbUdPUEl4WER5MHZxcU5UUEpu?=
 =?utf-8?B?T1gwbVhMUWVHSjBDMFpybElnN2JVVEtUbmJYT2xxUlpucy9jNzlkNFRZVXA4?=
 =?utf-8?B?YlpHeWlUbDljWm80cFFaNytJaUJqWjd0c25xYjNWTS91UGIycUNsYmR2Ly9M?=
 =?utf-8?B?VUQvL1BmUjE5cmwzMlc1MUh1aE5IckI1YWw3b3ovWFY2VlVFQTAwQVZZQTRY?=
 =?utf-8?B?QXVsaFB2ZnNFYm54WThpVm5lNnozNVhzUW5yL29nNzVaeUZCbVlpd1RuOW1x?=
 =?utf-8?B?ZUxFR3UvdVM2OENYZmZJK2UrSG5ocHJOL3lhYytWYTVBNC9SUTBndWR2U0hw?=
 =?utf-8?B?SVBiWTluWWVWdUMwMWVjbUJjb2ZjbGI3RmZlc0dNZWszdkZ5ckd4WWlMcXBM?=
 =?utf-8?B?U2ozeEI2UjM0S09GVmk4VW5IU2tVVVRMZlBpclJBMjNEWmZsZ0I4TmJJaUVI?=
 =?utf-8?B?NElLWmxPTEJCaitQSUc4RU5KcTRkc2RSMDNMbDk0TWRZMWI2WTliVXVITGFo?=
 =?utf-8?B?TlBrWFJiaE1wVnc3L1ZtbkhVSUJRNkhxWHRsNXEzWXpwYmdJZWVxRlZwYUxh?=
 =?utf-8?B?K3kxc3BkcUlxdjdEeUg2ZDQ2ZnBVZ0RBNjZ2ZSszejQxUVhEMUdMeXYxUVBm?=
 =?utf-8?B?Z1F0eVQxYXRWcEtacGJwd3BtUm5ESWRhYndKcHJTVGYxRkdQN3dlVmJNOE9k?=
 =?utf-8?B?UTlyMWtHaGV2Zng5aXRGN2NRMzZoamNjVWZuRjNkcU9nWWxjRVB0clhYSEg4?=
 =?utf-8?B?VERpSmR4Tk1KalhRMkFrMEVMam12TVl3aGZVTDdtV1lWcFRGVG52WjRBSVha?=
 =?utf-8?B?cW5DNkE3Z3Z2MWxQWTRqMVFqc0VFNnhtTFR2bTRqZzVNbXoybksvaHpKbWxi?=
 =?utf-8?B?YWlZdEY0MjVscldrQ1JMRFRCWWlkNms4VVdZNUhLWUxoL1VjTytPQXlNRHl3?=
 =?utf-8?B?aStaSDlHS2lIcStoc0w4Qnh4ZW1wTWlveXZVckZremI2OTgxaytEMGt4RlNM?=
 =?utf-8?B?NnhLZ1Boem1yakNnUW9QMzg1RkZ4a3UxcVEvRzN3a3BIUzZ5QkhOLzB4ZDBp?=
 =?utf-8?B?eXQ5WFNFbEcwcFV2akxwZVF5TDhCem9oZW52WWdCVE9WOTVPUWhNTnJBNFUx?=
 =?utf-8?B?OE9OVEVxSnFsNlZSNW5MZEkyUG5WOHlqSEV5ajVrNEtXak9ZeHNuU2RRam1P?=
 =?utf-8?B?YlNpNWlMYUh4WWtwSDBmYmFlRnRkOGZtU3ZuZTB5OWRubGQxN0JNQVB6QWVu?=
 =?utf-8?B?TkNESEt1SUIwV2N5OXprL1lNZG1NS3lkdUJBc0tJaG45UURZTy9WSXFNOHZu?=
 =?utf-8?B?SUZmSmpMVzBOUnY5TzJ6cTZocVNDWVkxa0ZMMVVESVQyVjRJUzAxQkNTRzg2?=
 =?utf-8?B?VjFUc2owaVR5RW5QTDRtVlRjU3FPSkUwRFN3V1U0Ry9IWk1ib3VYUWFWOUdO?=
 =?utf-8?B?dlVyZmY4S0dHejZWY3QvSkNCVkVrcWgrWlpFQkZvbVdJR0Z4WTdYT0N2MzhY?=
 =?utf-8?B?OVVhWEZSSnRRK3RqM1ZFRk9CK3dZVzRQWG9mZndHNnBzbDE4YTNnbCttazhk?=
 =?utf-8?B?MVUvNDREOVJGd2NFS2hSbDc0YnNvT2VtcjNVcEdqRGRnSnhGZHRuU3JFd0E3?=
 =?utf-8?B?UUNyVjR1cHNSNXh6ajJCNEVBS084NlpyWnJ2a0JNM0FPeTFtc0ZWMGRNNXpQ?=
 =?utf-8?B?NnB3dEtqNFFBWEl1ei85Nzl6aDUvQklPVTJnMXBucUt0WVVjNVZPNm1NMjJi?=
 =?utf-8?B?VlRQK09DeUw3SGFNN1dJcmJUMEpUaEV6aUJZR3d1cU9lYUJXb1RDeFdqT3BX?=
 =?utf-8?B?T0dXRGttc25GZnRKdWJmbVE3akkxVUxmNE5rc3ZIR2lSck1qQjRTZ2puSldi?=
 =?utf-8?B?OVRTOC9GczZ6STFpbU04Yk93aC9PczFrSUlndHZXcVlqcC9hTnloVkxYbGIz?=
 =?utf-8?B?dTNXR1hjYTJ0RFZlU2cxcU8wbjFEcEcydDdQaWc3SVFEcTJvdU9SZ2NGdkF2?=
 =?utf-8?Q?X7uY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <62250B21F1210F4891B1F51ED04F2A17@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45579ba5-a353-4ca8-a729-08dcc5952353
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 06:05:51.3004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8YRFlS3OU5lmw6tJeWEjD4wKlfjVkcmo731BMFeoCCAEjWtN29n3kYzKudhlPfVu8qMLBVqXGLXbEpy/YfhVdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7259

T24gMjAyNC84LzIxIDA4OjE2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFR1ZSwg
MjAgQXVnIDIwMjQsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjQvOC8xOSAxNzoxNiwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTYuMDguMjAyNCAxMzowOCwgSmlxaWFuIENoZW4g
d3JvdGU6DQo+Pj4+IFRoZSBnc2kgb2YgYSBwYXNzdGhyb3VnaCBkZXZpY2UgbXVzdCBiZSBjb25m
aWd1cmVkIGZvciBpdCB0byBiZQ0KPj4+PiBhYmxlIHRvIGJlIG1hcHBlZCBpbnRvIGEgaHZtIGRv
bVUuDQo+Pj4+IEJ1dCBXaGVuIGRvbTAgaXMgUFZILCB0aGUgZ3NpcyBtYXkgbm90IGdldCByZWdp
c3RlcmVkKHNlZSBiZWxvdw0KPj4+PiBjbGFyaWZpY2F0aW9uKSwgaXQgY2F1c2VzIHRoZSBpbmZv
IG9mIGFwaWMsIHBpbiBhbmQgaXJxIG5vdCBiZQ0KPj4+PiBhZGRlZCBpbnRvIGlycV8yX3BpbiBs
aXN0LCBhbmQgdGhlIGhhbmRsZXIgb2YgaXJxX2Rlc2MgaXMgbm90IHNldCwNCj4+Pj4gdGhlbiB3
aGVuIHBhc3N0aHJvdWdoIGEgZGV2aWNlLCBzZXR0aW5nIGlvYXBpYyBhZmZpbml0eSBhbmQgdmVj
dG9yDQo+Pj4+IHdpbGwgZmFpbC4NCj4+Pj4NCj4+Pj4gVG8gZml4IGFib3ZlIHByb2JsZW0sIG9u
IExpbnV4IGtlcm5lbCBzaWRlLCBhIG5ldyBjb2RlIHdpbGwNCj4+Pj4gbmVlZCB0byBjYWxsIFBI
WVNERVZPUF9zZXR1cF9nc2kgZm9yIHBhc3N0aHJvdWdoIGRldmljZXMgdG8NCj4+Pj4gcmVnaXN0
ZXIgZ3NpIHdoZW4gZG9tMCBpcyBQVkguDQo+Pj4+DQo+Pj4+IFNvLCBhZGQgUEhZU0RFVk9QX3Nl
dHVwX2dzaSBpbnRvIGh2bV9waHlzZGV2X29wIGZvciBhYm92ZQ0KPj4+PiBwdXJwb3NlLg0KPj4+
Pg0KPj4+PiBDbGFyaWZ5IHR3byBxdWVzdGlvbnM6DQo+Pj4+IEZpcnN0LCB3aHkgdGhlIGdzaSBv
ZiBkZXZpY2VzIGJlbG9uZyB0byBQVkggZG9tMCBjYW4gd29yaz8NCj4+Pj4gQmVjYXVzZSB3aGVu
IHByb2JlIGEgZHJpdmVyIHRvIGEgbm9ybWFsIGRldmljZSwgaXQgdXNlcyB0aGUgbm9ybWFsDQo+
Pj4+IHByb2JlIGZ1bmN0aW9uIG9mIHBjaSBkZXZpY2UsIGluIGl0cyBjYWxsc3RhY2ssIGl0IHJl
cXVlc3RzIGlycQ0KPj4+PiBhbmQgdW5tYXNrIGNvcnJlc3BvbmRpbmcgaW9hcGljIG9mIGdzaSwg
dGhlbiB0cmFwIGludG8geGVuIGFuZA0KPj4+PiByZWdpc3RlciBnc2kgZmluYWxseS4NCj4+Pj4g
Q2FsbHN0YWNrIGlzKG9uIGxpbnV4IGtlcm5lbCBzaWRlKSBwY2lfZGV2aWNlX3Byb2JlLT4NCj4+
Pj4gcmVxdWVzdF90aHJlYWRlZF9pcnEtPiBpcnFfc3RhcnR1cC0+IF9fdW5tYXNrX2lvYXBpYy0+
DQo+Pj4+IGlvX2FwaWNfd3JpdGUsIHRoZW4gdHJhcCBpbnRvIHhlbiBodm1lbXVsX2RvX2lvLT4N
Cj4+Pj4gaHZtX2lvX2ludGVyY2VwdC0+IGh2bV9wcm9jZXNzX2lvX2ludGVyY2VwdC0+DQo+Pj4+
IHZpb2FwaWNfd3JpdGVfaW5kaXJlY3QtPiB2aW9hcGljX2h3ZG9tX21hcF9nc2ktPiBtcF9yZWdp
c3Rlcl9nc2kuDQo+Pj4+IFNvIHRoYXQgdGhlIGdzaSBjYW4gYmUgcmVnaXN0ZXJlZC4NCj4+Pj4N
Cj4+Pj4gU2Vjb25kLCB3aHkgdGhlIGdzaSBvZiBwYXNzdGhyb3VnaCBkZXZpY2UgY2FuJ3Qgd29y
ayB3aGVuIGRvbTANCj4+Pj4gaXMgUFZIPw0KPj4+PiBCZWNhdXNlIHdoZW4gYXNzaWduIGEgZGV2
aWNlIHRvIHBhc3N0aHJvdWdoLCBpdCB1c2VzIHRoZSBzcGVjaWZpYw0KPj4+PiBwcm9iZSBmdW5j
dGlvbiBvZiBwY2liYWNrLCBpbiBpdHMgY2FsbHN0YWNrLCBpdCBkb2Vzbid0IGluc3RhbGwgYQ0K
Pj4+PiBmYWtlIGlycSBoYW5kbGVyIGR1ZSB0byB0aGUgSVNSIGlzIG5vdCBydW5uaW5nLiBTbyB0
aGF0DQo+Pj4+IG1wX3JlZ2lzdGVyX2dzaSBvbiBYZW4gc2lkZSBpcyBuZXZlciBjYWxsZWQsIHRo
ZW4gdGhlIGdzaSBpcyBub3QNCj4+Pj4gcmVnaXN0ZXJlZC4NCj4+Pj4gQ2FsbHN0YWNrIGlzKG9u
IGxpbnV4IGtlcm5lbCBzaWRlKSBwY2lzdHViX3Byb2JlLT5wY2lzdHViX3NlaXplLT4NCj4+Pj4g
cGNpc3R1Yl9pbml0X2RldmljZS0+IHhlbl9wY2lia19yZXNldF9kZXZpY2UtPg0KPj4+PiB4ZW5f
cGNpYmtfY29udHJvbF9pc3ItPmlzcl9vbj09MC4NCj4+Pg0KPj4+IFNvOiBVbmRlcmx5aW5nIFhT
QS00NjEgd2FzIHRoZSBvYnNlcnZhdGlvbiB0aGF0IHRoZSB2ZXJ5IGxpbWl0ZWQgc2V0IG9mDQo+
Pj4gY2FzZXMgd2hlcmUgdGhpcyBmYWtlIElSUSBoYW5kbGVyIGlzIGluc3RhbGxlZCBpcyBhbiBp
c3N1ZS4gVGhlIHByb2JsZW0NCj4+PiBvZiBkZWFsaW5nIHdpdGggImZhbHNlIiBJUlFzIHdoZW4g
YSBsaW5lLWJhc2VkIGludGVycnVwdCBpcyBzaGFyZWQNCj4+PiBiZXR3ZWVuIGRldmljZXMgYWZm
ZWN0cyBhbGwgcGFydGllcywgbm90IGp1c3QgRG9tMCBhbmQgbm90IGp1c3QgUFYNCj4+PiBndWVz
dHMuIFRoZXJlZm9yZSBhbiBhbHRlcm5hdGl2ZSB0byB0aGUgaW50cm9kdWN0aW9uIG9mIGEgbmV3
IGh5cGVyY2FsbA0KPj4+IHdvdWxkIGJlIHRvIHNpbXBseSBsZXZlcmFnZSB0aGF0IHRoZSBpbnN0
YWxsYXRpb24gb2Ygc3VjaCBhIGhhbmRsZXINCj4+PiB3aWxsIG5lZWQgd2lkZW5pbmcgYW55d2F5
Lg0KPj4+DQo+Pj4gSG93ZXZlciwgdGhlIGluc3RhbGxhdGlvbiBvZiBzYWlkIGhhbmRsZXIgcHJl
c2VudGx5IGFsc28gb2NjdXJzIGluDQo+Pj4gY2FzZXMgd2hlcmUgaXQncyBub3QgcmVhbGx5IG5l
ZWRlZCAtIHdoZW4gdGhlIGxpbmUgaXNuJ3Qgc2hhcmVkLiBUaHVzLA0KPj4+IGlmIHRoZSBoYW5k
bGVyIHJlZ2lzdHJhdGlvbiB3b3VsZCBhbHNvIGJlIGVsaW1pbmF0ZWQgd2hlbiBpdCdzIG5vdA0K
Pj4+IHJlYWxseSBuZWVkZWQsIHdlJ2QgYmUgYmFjayB0byBuZWVkaW5nIGEgc2VwYXJhdGUgaHlw
ZXJjYWxsLg0KPj4+DQo+Pj4gU28gSSB0aGluayBmaXJzdCBvZiBhbGwgaXQgbmVlZHMgZGVjaWRp
bmcgd2hhdCBpcyBnb2luZyB0byBiZSBkb25lIGluDQo+Pj4gTGludXgsIGF0IGxlYXN0IGluIHBj
aWJhY2sgKGFzIGhlcmUgd2UgY2FyZSBhYm91dCB0aGUgRG9tMCBjYXNlIG9ubHkpLg0KPj4gQWdy
ZWUsIHNvIHRoZSBjdXJyZW50IG9wdGlvbnMgYXJlIGVpdGhlciB0byB1c2UgaHlwZXJjYWxsIChQ
SFlTREVWT1Bfc2V0dXBfZ3NpKSBvciB0byBpbnN0YWxsIGZha2UgSVJRIGhhbmRsZXIgaW4gcGNp
YmFjay4NCj4+IFNvLCB3ZSBtYXkgbmVlZCB0aGUgaW5wdXRzIGZyb20gdGhlIE1haW50YWluZXJz
IG9uIExpbnV4IHNpZGUuDQo+PiBIaSBTdGVmYW5vIGFuZCBKdWVyZ2VuLCB3aGF0IGFib3V0IHlv
dXIgb3BpbmlvbnM/DQo+IA0KPiBJIHdvdWxkIGdvIHdpdGggdGhlIFBIWVNERVZPUF9zZXR1cF9n
c2kgc29sdXRpb24NCg0KVGhhbmtzIFN0YWZhbm8uDQoNCklmIHVzZSBQSFlTREVWT1Bfc2V0dXBf
Z3NpIHNvbHV0aW9uLCBpdCByZXF1aXJlcyB0aGUgYWR2aWNlIG9mIHRoZSBNYWludGFpbmVycyBv
ZiB0aGlzIGZpbGUuDQpIaSBKYW4sIEFuZHJldyBhbmQgUm9nZXIsIGlzIGl0IG9rYXkgZm9yIHlv
dT8NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

