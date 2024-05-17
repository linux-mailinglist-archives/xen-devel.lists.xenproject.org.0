Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A908C8269
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 10:08:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723904.1129056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7sdl-0005ab-Ej; Fri, 17 May 2024 08:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723904.1129056; Fri, 17 May 2024 08:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7sdl-0005Z5-Ab; Fri, 17 May 2024 08:08:33 +0000
Received: by outflank-mailman (input) for mailman id 723904;
 Fri, 17 May 2024 08:08:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPUr=MU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7sdj-0005Yj-G3
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 08:08:31 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20615.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3f8068a-1424-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 10:08:28 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MN2PR12MB4238.namprd12.prod.outlook.com (2603:10b6:208:199::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 08:08:25 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 08:08:25 +0000
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
X-Inumbo-ID: a3f8068a-1424-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTrJCF2pK2OBc4xZ5QacGEujfP5KgTOsHjkA3GX2IhV9mz3g/2FDQo6lac2nsyO+0U487gNiShG/3E8VNXiULYs9cA8TrVrZFhVDJNOobWC6f9SKXXDpX3IYBbr2D6faN4G2wOqTCmQ27lvfg3WyG0aaPEv3GbQYDts+bj++h23dfiL8OW1cEZV/U1pjwTUNrabYR6lDqUmmFIOqob6PQuDOC4mLgAinjIvpBoj3SW4VaDvk2m27U26QY9K0ysaBiY1e1cX+90grhEjt8jIYpCgsTpMk2mFYpmvIUnK0OPZQQ+W6/J0FL3DytoPMQCh/f7JqO5CUk2vnCMBw4O3Y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWW2coKYW1UsbNI5qTwHy6PHBT9XL55xGzNsMUsF/0o=;
 b=IpuG+DcMce/u6jhVNi00PGZVweO6p5wc9MOrdllBkEjV50i0JsskL2QaBaxG+Ifml9IZIKIB75yDd3+4H3ErLeXijnMR4s/ijCCOD/T8L56HAC7Ok5r4RCI5qQjPtLyGuT2N4kBnkWkjZFxVlMEAUGgGo/HYEr0JMMc3ZX+QChBeO6CrJOU2t9WJIvJdV2UNZMWMJbj5ywDsNpT86/FewXnqx6IWwo2iK/o1oef28keYLtWicNc+pbaxVCJB8VNj1xFBZ/IgUp35oHHDB8HljTSiZJvZS40EaStIfswXtTvmVBo3tv7gBJ5TZCTq7VpViHXDqmqhy5n7/MOgw/Cuqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWW2coKYW1UsbNI5qTwHy6PHBT9XL55xGzNsMUsF/0o=;
 b=WsfXrfUSN36hhUQ9WWBsyjwQZw32L/AvTJtndfE1MUuDTHnAtjW74gQAMxt4DpdKrNh4O0sr7QS6xUNJmp5JuUk8CuD+QCF/rxv0FybSBvFL4i6igWx52nI/KcNxr0BVAEHg8HaoSJrWdOM10n4HOQpDR/ARgrr+iG+k3iTSMxs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Thread-Topic: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Thread-Index: AQHap3bYcGtlWtrcpEyRLTK5fjq5SLGZ1UMAgAFwSAA=
Date: Fri, 17 May 2024 08:08:25 +0000
Message-ID:
 <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
 <fb708441-b302-4727-8131-62435a54d99c@suse.com>
In-Reply-To: <fb708441-b302-4727-8131-62435a54d99c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7587.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MN2PR12MB4238:EE_
x-ms-office365-filtering-correlation-id: aa255509-d0ae-48d2-474b-08dc764886cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|376005|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?WmZUTzBhdjRuejI3b2l4Ty8wWUFLekhYMVlMNTZnT2doejJGYzQxdGJsMm1E?=
 =?utf-8?B?WmZaZDdNM29WRmdYekswbTEyS0xSL1U5Z2hlYTBJd1VnNkRpMDlpUlNkdlZW?=
 =?utf-8?B?TTJyK1lvbzVoQkFhYWpNZzNQSWZXZ1hHOG9ScTZTempMMVBHS2IycDBDTTE3?=
 =?utf-8?B?Q0U5enhjT3dRaHVqUGx5ank2VHMydzZGdy9ocnN2MW9ERnpNdVAvZlNINTJi?=
 =?utf-8?B?MU10UDQzS1NWNWNkNjRJN3BwamV3U216bGY0WFE0TzhkUGhHQlJHRzVNNUVo?=
 =?utf-8?B?THY0K0xNUzYzNndheXM5Vnd6QVNubTNJeUozUDJ5Qmt4Z01jVitZcUg4eVBC?=
 =?utf-8?B?RU9TOUZoRFJzTkxWUy9xY1dxNjc0V1BvR2Q0K21Ha0gzak5lN3g1cnhiZDNQ?=
 =?utf-8?B?eTJyMDFETGRKcjhUYlFtdGIzYmhRYmFMdFpKUWdlUldCd0ZidWtwekl0Tnhh?=
 =?utf-8?B?M0lQT01Ib09Ga1pBeFdDalYya3o0TDhTcm80c2NYRHFnR3BkaUwxMjg1a3lH?=
 =?utf-8?B?L28yQkxMaDR0aXplNjVmR0plVEtTUHY0Y25zVTBvVGVmUTVUelRQeW4xQTE3?=
 =?utf-8?B?SEpRZFYyVHhPSnQ3aVFpNDRZTmFQK1E3d055SEt5ZmJzSkVINzZ2dlFLZE9y?=
 =?utf-8?B?dTBNLzhsS1I1Z1l0WXV6OW9tZ0tHUlg4aDNnWUs2UkFPZUVIOXJGUkNaeGJY?=
 =?utf-8?B?WHArRG9aQTRldUl0Q1pucU51U1g2bytmbDdLeURMaWJoZGUzK0J1WEpQbFFr?=
 =?utf-8?B?blI3ZEZuS0RheHdlaFNvaW96T0RjZUhoQTQ0OERKTFhBVW9tT3VlN2ZhWEJP?=
 =?utf-8?B?OCtnaFFGQlJaNGdXVG9CSVFRazY4dDk3TTl1Nm1hR0F5M1ppOXVNZlRCaUUr?=
 =?utf-8?B?Y3VOY1dPcHpWdkN6c2pvME5NUFZZajFHM0x6dzJUTmU4TDBJczJDWFJ1ei90?=
 =?utf-8?B?S1RrMk9DUSthcjJyTkswejZ6T0xpU2tPVFJsTWQwdGlkVytEcWcrTXBqWFpE?=
 =?utf-8?B?aFZtVmxtaGNmUE1CS1FjOVBQdUd0Y01DS3NIQUgzUDg1QnY1cW4rT2JCS0Qy?=
 =?utf-8?B?K2RrQ3hFVDgwMkl4OUp2c0d0azc3RTRpY25SNEpDdy9CQWkvY1RwNzg3azc5?=
 =?utf-8?B?aHNnbG85UWRCdEpHc2ZXY3RybDdaYXdobGwxanhqblN1N1U3VFFOTjl1cFEz?=
 =?utf-8?B?eUJqbUhVVjNNVlRBRUpwQmZTQjlZU2RyUVpMZ1ltRzNwMmEwOEdjdk1nUHdx?=
 =?utf-8?B?ak5OR0ZXWDRTTkhmNU1kQnhYRi9RQ1FiOVptZGx1Z0dlczhha2d3ZmxDS0or?=
 =?utf-8?B?aUg0a3lVaGpRWU5sekFWZlFkN2xISHRVTk5IcFBoVTFTYlhwRFljM2ZGNG1O?=
 =?utf-8?B?T0p2RXgrU1Q1Z25tUmsxZ3p2WDd4bHNNUjZTNUM0UVFmRXE1MzdEcVRyTFJ0?=
 =?utf-8?B?ajVERkRMdUwweHZuY0Z3YkFKdUUxeWJmSWl6Z2RiUmlJOGNqNFJiQlRUemxn?=
 =?utf-8?B?TmFzWVdQYmxZR0grVG15WWNqaDRKaWVaVGFyZkpYWDQ3cWFUaGZkeWJZeTc1?=
 =?utf-8?B?UkQrZ2prQzVkRW9NUHl0ZjNCZU9uVWVndXU3QW9ZckR6YVBDWVB4MzQ3NEJo?=
 =?utf-8?B?TXZhdzVkbFkxMzk1QkdJNmVvTVp6NURlVTJ5bGZDYTNaRVBBR0YyRm1vdjNO?=
 =?utf-8?B?SFh1cG55L3UrdHNlTDMwV3pHb1MzYmZnK0FqUUxMNzZMVnUrZ01Cci9CajJj?=
 =?utf-8?B?a3JWTEJFc1FOT1FEcDhCVSthcUNIR2hVMm8vN1I2aHNpNlFweXBicjQ5ckhX?=
 =?utf-8?B?REpoYTZyOVFTQUVRbEhrQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWRjRnRTMC85aDF2K2ZCbTZkZTM2V1o1eWIwR2hPdkUxUlZGdVUzTzg4YmND?=
 =?utf-8?B?OFhRVG1qTnNqellrNnZHOEdZaytvSnBYbHpkZVAxZWJLQXNPeHU4UVBVVlFw?=
 =?utf-8?B?S21nbTluNytBbkk4VzBOdnpKQnp2Vlc4V0hWVFR2dTRQWVJhTHFpQnZnVTIy?=
 =?utf-8?B?WjlEb0ZLZ3ZpNHcxVGh5UHRkaUppajg5OThkS20vaTUwYkpRaWFSSkVhU0tC?=
 =?utf-8?B?bG1MN3pyWCtBdGxPQVB2MkttVkdLQkttNWFDdTlycWo2ZWg4RVJLRnZ2TE4v?=
 =?utf-8?B?OFM2NW1QZmV6TVlvTlJBc01JV2ozYms5Sm9VdVlCRXNLOFB5Mm1SNjBXTTNs?=
 =?utf-8?B?QXIrd3lyNUNickFpSE5NSkNxSTIvNDlVT3BUVUYyUDNMb1NmNlFoRVlTTjZK?=
 =?utf-8?B?ai9CanZtbmZCYURDRnRNRVBoM2NYdTcwMS9ZeE5nQjRIbnZwVmNCcTRvcjlY?=
 =?utf-8?B?QjlSbUxyeUVhUXJKa1JqUmwwVjVpQnVmZ2o2cmNNanBXUTJ3MXRrMXV2QVlt?=
 =?utf-8?B?RUg1Y1liWTIxOEY2YnZNRlRBVWduR0VHSWRTbFdXeVpMRmQzdElsQ2N5R253?=
 =?utf-8?B?SVd2NmppOGFpVjVIMUhXdkZGdllIQ09SRFoyVmlXbGIxYjlIaU41bDlzdXRJ?=
 =?utf-8?B?SlBFRUpBQ09xcFhTWmI5WkRtQVBEbWF1N0NseSt4ZUJIa0p4Q0dBMWc0TXp1?=
 =?utf-8?B?Z2JmeDhLMEoyb3dIL0IzTVZSK2N5TDNZL0M0aVFIb0JNZllHS3phVExDZnFv?=
 =?utf-8?B?S1hmN1ZLZ1NkNmJ5Y0xVbnp5YjBNR21GRU1vdTZtVVNJc01YSmNMd1lWa2c0?=
 =?utf-8?B?UHJDNjJpMWpUQnZEcWQvWGVCK05IWm1GRE1YdTZPem5uQjdocHVzcWVvZFE5?=
 =?utf-8?B?OEtKelJPc256NG5IdlFDejdHMFhueTBZVlpWb0RhZm94OVJ2ZG9rUVlsU1Vv?=
 =?utf-8?B?enZsUDlJa1hIakNDa0krUjBCT29peWtJLzNDSDZEWXRzeGJka1ExT29pemM5?=
 =?utf-8?B?TFRmUVVqd0c1UCtld0F5RHh6Q3R4aVl1NU1kQzZodkZVbjBSY2lzcTRwL1Zu?=
 =?utf-8?B?ZHZERFZRdzZNWW93UldTR2lGN0swSkdBcm40azV2OVJhRlI2aURDSStvMFV4?=
 =?utf-8?B?R2VySjFta1dFdE5HK2g4V3VvRVNlcEFxdzJYSHBrckZOaVEzcmNodUEvV0V3?=
 =?utf-8?B?QjhNR00wU0graTlhbkNnQUNyZWhCaUhCT3hYVzc5OEJTZmhxYkgzai9BVzdM?=
 =?utf-8?B?REEzbnF2b2ZFbFZneW52b3lqemltZ3hBeVlrSGhOdjNIcFlXLzZXdnUzbHNT?=
 =?utf-8?B?Z0hrS0MxYzJ2K2g0UjJDUDZQVUUyZ2tSVWtFcGVMRnFvYzdLSDE4Z0QxZWRy?=
 =?utf-8?B?cFlwWU1zQkprMVphS2hRcGdGajY0WmdhckxtcDh0Yk9ETTY5TkdNL1U5U2Zq?=
 =?utf-8?B?V0ZQaUhpcmUyQ3JCeW1pQWZaTktLNVA0ZlMvczBBcjJUUytyWXpNRGNjc2c3?=
 =?utf-8?B?K2VPUGRiMkUyVHJjdUlwY0NIb1VtY1MzSUxoQWFUTnBPT3ZwTUZhWHR2SnZm?=
 =?utf-8?B?eEhYSGxmbnlyejlhcTFjSDN0SlJzaFZnRFZzTkFmNlhpdGk0ZHRJYUF0OFZm?=
 =?utf-8?B?YTcxN2h5UTd1RUtZeXN6MmlMOGFHeHdaYTNpYVBXenFoem1JVVg3eU5QOUtS?=
 =?utf-8?B?NXlFSXlSbnR3N3kyNXEvVWRGWStXL2l6VnU4SEhkdi9RbktabUhLQ3I3OWlR?=
 =?utf-8?B?M3NBZ2hpV0dweW1WK1NlNlpYSFRRMWNRUTI3VTNyY0h6ZE9LVSthZ0xtcWcz?=
 =?utf-8?B?ZjR1NXJnbDJET3hoM3FSV20wa2wxVWZtVVFGYzMxYzdyc1BROEpONno5WWdX?=
 =?utf-8?B?Z2VGL1ZxeWFWRVlIRDBscEdxc2xOOEM5NTlja3JZYm1OMFhKWXBQWDBDeVBR?=
 =?utf-8?B?UWZzYk5lblZHbEVWUHJyYXdBN0VrK0FLZWo1Sm1veFNZeVVoSTdjOHdocmFa?=
 =?utf-8?B?Yk9MVjZxb3prdk5Mck9GbFFqZWpiSUVsTGxZMUlpYWRyaEJISi9MQlhoUGtG?=
 =?utf-8?B?RlpXVXU0emFyWlZQTnovUWZiTTZxNEFzUjdIUUl1RkRvd2NYaXhBTXRkQ054?=
 =?utf-8?Q?lsSY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB7E314F8568AE4F9793F8E8C2CB5755@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa255509-d0ae-48d2-474b-08dc764886cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 08:08:25.0862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wQzqzCHhehHjZaX+KaR8TvkPcf3Fm0lROg3VRiSG6miu41OKd3/ztpN+39gY4oln0O+ieN0473KnPbgOMLIOtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4238

T24gMjAyNC81LzE2IDIxOjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMDUuMjAyNCAx
MTo1MiwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBAQCAtNjcsNiArNjgsNDEgQEAgcmV0X3QgcGNp
X3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+
PiAgICAgICAgICBicmVhazsNCj4+ICAgICAgfQ0KPj4gIA0KPj4gKyAgICBjYXNlIFBIWVNERVZP
UF9wY2lfZGV2aWNlX3N0YXRlX3Jlc2V0OiB7DQo+PiArICAgICAgICBzdHJ1Y3QgcGh5c2Rldl9w
Y2lfZGV2aWNlIGRldjsNCj4+ICsgICAgICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPj4gKyAg
ICAgICAgcGNpX3NiZGZfdCBzYmRmOw0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCAhaXNfcGNpX3Bh
c3N0aHJvdWdoX2VuYWJsZWQoKSApDQo+PiArICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQ
Ow0KPj4gKw0KPj4gKyAgICAgICAgcmV0ID0gLUVGQVVMVDsNCj4+ICsgICAgICAgIGlmICggY29w
eV9mcm9tX2d1ZXN0KCZkZXYsIGFyZywgMSkgIT0gMCApDQo+PiArICAgICAgICAgICAgYnJlYWs7
DQo+PiArICAgICAgICBzYmRmID0gUENJX1NCREYoZGV2LnNlZywgZGV2LmJ1cywgZGV2LmRldmZu
KTsNCj4+ICsNCj4+ICsgICAgICAgIHJldCA9IHhzbV9yZXNvdXJjZV9zZXR1cF9wY2koWFNNX1BS
SVYsIHNiZGYuc2JkZik7DQo+PiArICAgICAgICBpZiAoIHJldCApDQo+PiArICAgICAgICAgICAg
YnJlYWs7DQo+IA0KPiBEYW5pZWwsIGlzIHJlLXVzZSBvZiB0aGlzIGhvb2sgYXBwcm9wcmlhdGUg
aGVyZT8NCkluIHRoZSB2MiBvZiB0aGlzIHNlcmllcywgRGFuaWVsIGFuZCBSb2dlciBoYXZlIGFn
cmVlZCB0aGF0IHJldXNpbmcgeHNtX3Jlc291cmNlX3NldHVwX3BjaSBpcyBlbm91Z2guDQoNCj4g
DQo+PiArICAgICAgICBwY2lkZXZzX2xvY2soKTsNCj4+ICsgICAgICAgIHBkZXYgPSBwY2lfZ2V0
X3BkZXYoTlVMTCwgc2JkZik7DQo+PiArICAgICAgICBpZiAoICFwZGV2ICkNCj4+ICsgICAgICAg
IHsNCj4+ICsgICAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOw0KPj4gKyAgICAgICAgICAgIHJl
dCA9IC1FTk9ERVY7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArICAgICAgICB9DQo+PiAr
DQo+PiArICAgICAgICB3cml0ZV9sb2NrKCZwZGV2LT5kb21haW4tPnBjaV9sb2NrKTsNCj4+ICsg
ICAgICAgIHJldCA9IHZwY2lfcmVzZXRfZGV2aWNlX3N0YXRlKHBkZXYpOw0KPj4gKyAgICAgICAg
d3JpdGVfdW5sb2NrKCZwZGV2LT5kb21haW4tPnBjaV9sb2NrKTsNCj4+ICsgICAgICAgIHBjaWRl
dnNfdW5sb2NrKCk7DQo+IA0KPiBDYW4ndCB0aGlzIGJlIGRvbmUgcmlnaHQgYWZ0ZXIgdGhlIHdy
aXRlX2xvY2soKT8NCllvdSBhcmUgcmlnaHQsIEkgd2lsbCBtb3ZlIGl0IGluIG5leHQgdmVyc2lv
bi4NCg0KPiANCj4+ICsgICAgICAgIGlmICggcmV0ICkNCj4+ICsgICAgICAgICAgICBwcmludGso
WEVOTE9HX0VSUiAiJXBwOiBmYWlsZWQgdG8gcmVzZXQgUENJIGRldmljZSBzdGF0ZVxuIiwgJnNi
ZGYpOw0KPiANCj4gcy9QQ0kvdlBDSS8gKGF0IGxlYXN0IGFzIGxvbmcgYXMgbm90aGluZyBlbHNl
IGlzIGRvbmUgaGVyZSkNCk9LLCB3aWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+
PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMNCj4+IEBAIC0xMTUsNiArMTE1LDE2IEBAIGludCB2cGNpX2Fzc2lnbl9kZXZpY2Uo
c3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgDQo+PiAgICAgIHJldHVybiByYzsNCj4+ICB9DQo+
PiArDQo+PiAraW50IHZwY2lfcmVzZXRfZGV2aWNlX3N0YXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQ0KPj4gK3sNCj4+ICsgICAgQVNTRVJUKHBjaWRldnNfbG9ja2VkKCkpOw0KPiANCj4gSXMgdGhp
cyBuZWNlc3NhcnkgZm9yIC4uLg0KPiANCj4+ICsgICAgQVNTRVJUKHJ3X2lzX3dyaXRlX2xvY2tl
ZCgmcGRldi0+ZG9tYWluLT5wY2lfbG9jaykpOw0KPj4gKw0KPj4gKyAgICB2cGNpX2RlYXNzaWdu
X2RldmljZShwZGV2KTsNCj4+ICsgICAgcmV0dXJuIHZwY2lfYXNzaWduX2RldmljZShwZGV2KTsN
Cj4gDQo+IC4uLiBlaXRoZXIgb2YgdGhlc2UgY2FsbHM/IEJvdGggZnVuY3Rpb25zIGRvIHRoZW1z
ZWx2ZXMgb25seSBoYXZlIHRoZQ0KPiAybmQgb2YgdGhlIGFzc2VydHMgeW91IGFkZC4NCkkgY2hl
Y2tlZCBjb2RlcyBhZ2FpbjsgSSB3aWxsIHJlbW92ZSB0aGUgdHdvIGFzc2VydHMgaGVyZSBpbiBu
ZXh0IHZlcnNpb24uDQoNCj4gDQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvcGh5c2Rldi5o
DQo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvcGh5c2Rldi5oDQo+PiBAQCAtMjk2LDYgKzI5
NiwxMyBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRShwaHlzZGV2X3BjaV9kZXZpY2VfYWRkX3Qp
Ow0KPj4gICAqLw0KPj4gICNkZWZpbmUgUEhZU0RFVk9QX3ByZXBhcmVfbXNpeCAgICAgICAgICAz
MA0KPj4gICNkZWZpbmUgUEhZU0RFVk9QX3JlbGVhc2VfbXNpeCAgICAgICAgICAzMQ0KPj4gKy8q
DQo+PiArICogTm90aWZ5IHRoZSBoeXBlcnZpc29yIHRoYXQgYSBQQ0kgZGV2aWNlIGhhcyBiZWVu
IHJlc2V0LCBzbyB0aGF0IGFueQ0KPj4gKyAqIGludGVybmFsbHkgY2FjaGVkIHN0YXRlIGlzIHJl
Z2VuZXJhdGVkLiAgU2hvdWxkIGJlIGNhbGxlZCBhZnRlciBhbnkNCj4+ICsgKiBkZXZpY2UgcmVz
ZXQgcGVyZm9ybWVkIGJ5IHRoZSBoYXJkd2FyZSBkb21haW4uDQo+PiArICovDQo+PiArI2RlZmlu
ZSBQSFlTREVWT1BfcGNpX2RldmljZV9zdGF0ZV9yZXNldCAgICAgMzINCj4gDQo+IE5pdDogSnVz
dCBhIHNpbmdsZSBibGFuayBhcyBhIHNlcGFyYXRvciB3aWxsIGRvIGhlcmUsIGZvciBnb2luZyBw
YXN0IHRoZQ0KPiBjb2x1bW5hciBhcnJhbmdlbWVudCBvZiBvdGhlciAjZGVmaW5lLXMgYW55d2F5
Lg0KT0suDQo+IA0KPj4gIHN0cnVjdCBwaHlzZGV2X3BjaV9kZXZpY2Ugew0KPj4gICAgICAvKiBJ
TiAqLw0KPj4gICAgICB1aW50MTZfdCBzZWc7DQo+IA0KPiBJcyByZS11c2luZyB0aGlzIHN0cnVj
dCBmb3IgdGhpcyBuZXcgc3ViLW9wIHN1ZmZpY2llbnQ/IElPVyBhcmUgYWxsDQo+IHBvc3NpYmxl
IHJlc2V0cyBlcXVhbCwgYW5kIGhlbmNlIGl0IGRvZXNuJ3QgbmVlZCBzcGVjaWZ5aW5nIHdoYXQg
a2luZCBvZg0KPiByZXNldCB3YXMgZG9uZT8gRm9yIGV4YW1wbGUsIG90aGVyIHRoYW4gRkxSIG1v
c3QgcmVzZXQgdmFyaWFudHMgcmVzZXQgYWxsDQo+IGZ1bmN0aW9ucyBpbiBvbmUgZ28gYWl1aS4g
SW1vIHRoYXQgd291bGQgYmV0dGVyIHJlcXVpcmUgb25seSBhIHNpbmdsZQ0KPiBoeXBlcmNhbGws
IGp1c3QgdG8gYXZvaWQgcG9zc2libGUgY29uZnVzaW9uLiBJdCBhbHNvIHJlYWRzIGFzIGlmIEZM
UiB3b3VsZA0KPiBub3QgcmVzZXQgYXMgbWFueSByZWdpc3RlcnMgYXMgb3RoZXIgcmVzZXQgdmFy
aWFudHMgd291bGQuDQpJZiBJIHVuZGVyc3Rvb2QgY29ycmVjdGx5IHRoYXQgeW91IG1lYW4gaW4g
dGhpcyBoeXBlcmNhbGwgaXQgbmVlZHMgdG8gc3VwcG9ydCByZXNldHRpbmcgYm90aCBvbmUgZnVu
Y3Rpb24gYW5kIGFsbCBmdW5jdGlvbnMgb2YgYSBzbG90KGRldik/DQpCdXQgaXQgY2FuIGJlIGRv
bmUgZm9yIGNhbGxlciB0byB1c2UgYSBjeWNsZSB0byBjYWxsIHRoaXMgcmVzZXQgaHlwZXJjYWxs
IGZvciBlYWNoIHNsb3QgZnVuY3Rpb24uDQoNCj4gDQo+IFRoaXMgbWF5IHNlZW0gdG8gbm90IG1h
dHRlciByaWdodCBub3csIGJ1dCB0aGlzIGlzIGEgc3RhYmxlIGludGVyZmFjZSB5b3UNCj4gYWRk
LCBhbmQgaGVuY2UgbW9kaWZ5aW5nIGl0IGxhdGVyIHdpbGwgYmUgY3VtYmVyc29tZSwgaWYgcG9z
c2libGUgYXQgYWxsLg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENo
ZW4uDQo=

