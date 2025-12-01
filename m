Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56876C95DB6
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 07:34:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175530.1500169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPxUA-0006AR-3F; Mon, 01 Dec 2025 06:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175530.1500169; Mon, 01 Dec 2025 06:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPxU9-00068I-W3; Mon, 01 Dec 2025 06:34:09 +0000
Received: by outflank-mailman (input) for mailman id 1175530;
 Mon, 01 Dec 2025 06:34:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isLO=6H=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vPxU7-00068C-TT
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 06:34:08 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb7a074a-ce7f-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 07:34:06 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB7875.namprd12.prod.outlook.com (2603:10b6:8:14d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 06:34:02 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:34:02 +0000
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
X-Inumbo-ID: bb7a074a-ce7f-11f0-9d19-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbKHfDLd8+DuE6Ty5JaLG9SWpQMhURF3UheC9tRyJuU762tb5kmmgYHHylG7biQELOjjkOR64lA2Ep60eDuipCJFqkH0YH+EaiNJCpr1zysuT/jlhQfgAW97Kxe+rjTXb0YK67X5lxr/ftL4LZAgptLkW/qeNH5i7Pv2TRX1u7YuAwdt7hfMz3F8M5OrKqG2SMgTNb+CUqwezms2piQDMD4t7jyNMYrwublcLjakEuCPD5HSDJmNHFB/0ViFhV/JfQoxnudzRLs9ayQ03GqIGbCrBbZ5QIIOlYbs57xcu/rn+5RUW7821q58giNg93UFEULDQNS22Mf2jt2qjEKOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIco463z03e4uitzfOUqQNtuIB11b1jc2qeI/q9jzpo=;
 b=SrtJ8nGdQHw0rqjmgq5hJrFw0wU8iV9cG6RwPbT5oUiX7srJNgpaiLF0ziYKkzyag7ohHKpzUYNr5E3I4/QWM760h6Q8j+KARXYrN3eJY8o5tnlLrhEa+nXC388CRNI3JO77NrN+QLrvUB+QQE02hFVTp3trHs9U8EFszQWJk2w9TMXy2dLeSLMnY0W4BU/lG3Zb3Xj7vdAFcv6riZYFJAkC+1OmB7f/A2wpYE7aAQwGUkJddJ8yGpuTZNxGUEHY2c2v3F8TexjhkcPsgflLu9FVAlG8Ji1LjZVPzCPv0UYUUv43ZhFSJ0K6xb5wWwrvx0cjD//kkAsU0lQhup1ckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIco463z03e4uitzfOUqQNtuIB11b1jc2qeI/q9jzpo=;
 b=FVXDMR9NDagMMXtBQ2FeaIRiyd4As4HsUJZWO22HuHFz02qGy21C5KLra+LvKAzqaBzLqJ0jZzngfVaevvg2NURwgvyIYsr5LGgj0R9RYJXElaYJFJHOaPsbuixOWGEUpgg6cDA+QDT4geJZO48G93cCbT701x2KL/N4b4zH8jA=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Juergen
 Gross <jgross@suse.com>
Subject: RE: [PATCH v4 02/24] xen: consolidate cpuid library
Thread-Topic: [PATCH v4 02/24] xen: consolidate cpuid library
Thread-Index: AQHcWtXJjf66LsUGrE2uxhJqk+lJcbUFhgcAgAbbbtA=
Date: Mon, 1 Dec 2025 06:34:02 +0000
Message-ID:
 <DM4PR12MB845173E05DF89C8D57974AF1E1DBA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-3-Penny.Zheng@amd.com>
 <64298088-489c-483c-97fa-62206f1a998c@epam.com>
In-Reply-To: <64298088-489c-483c-97fa-62206f1a998c@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-12-01T06:33:54.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB7875:EE_
x-ms-office365-filtering-correlation-id: e073d717-18a4-4aa9-babd-08de30a39df0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?S3NBbWRMK1VwT2trRlJkVDBQS0YvdDA5Tmp5emc0RElVZFhNWFZyUEI4dlZy?=
 =?utf-8?B?bnErVHcxTTliZjdINkJhWUV1STZ4SFVWWmE2aDNuUm4xRlMwMkdaQ3BhQ1BJ?=
 =?utf-8?B?bDZ0VHZ4eUZqbGFoUzJkb291TlYzbnZUd21HOUVGQ0tyS3RBNURxT3Zzb1kw?=
 =?utf-8?B?VUhEa2ZmalRycWVhWXZJWmh4ZnNIMmdEd09SV2dMTWdET2F5QWZxbEtLRTM0?=
 =?utf-8?B?b3dCcEZwQW5TWjVkRVMyYmd5a0dScDdzWVJHZGk5anF0VVJNbDBtdGJUNnJK?=
 =?utf-8?B?NVZ2OW5ORlY2QUJSV3JlSFczZ2VkVFZNMUgxSzljR0pCVG5WeEZhWVc3OE5U?=
 =?utf-8?B?UUE0ODlyd3hLaFV3QXoweVlXSDdGVStRTndMYVEvQ1RiR2hLSkFvUFhIWGx6?=
 =?utf-8?B?YWtRRm9oZlNYRll2ME5Sc1N3TTlJeUhmY2NITmNLSTFsZWFjWHZmQjdGR3dV?=
 =?utf-8?B?czRlTjUvcGI2Zngwd2llZjgxbENlSEhhUytzQ0NjRUJ0ekQzOHpSZndFNEVK?=
 =?utf-8?B?amFUUDdBSU4vdG91QS9MYk9nVFdzbDRFblVrako2N2N4WDk3em9STy9uakZW?=
 =?utf-8?B?THN2RzhUUGtzZmpudyt5bE9YSkROOU9QNVdrdE9jVGNQWS9hbFdhWTU3U3BW?=
 =?utf-8?B?STcrVFRQVzQ4Zy82TnRuZEd6NXBERytNYll6dWFuczRiMGY1QzQxOGtBSmR0?=
 =?utf-8?B?a2p3Y1Njekl6bWJyeW5JU0pNZlVvOFBCSnlZVDdTajVnTk43YnpodkIzdjBL?=
 =?utf-8?B?aEVyTFFUQkF2OEZKaDV0WFh5RE5FSGE5Y0pDV0VQNW1zKzNyNWdjL3JXM004?=
 =?utf-8?B?TXZpSFBaSDlEQ1VjTHB0cG0yK0VNNGNrNFhWRkEvcGJSSkdtbGVSR3dRODJa?=
 =?utf-8?B?dHBxcDlMaFdVRUlDbVN4VVFBbUlKRFJwTjJGKzlLY3VXRjFjOUM5TlhIdGQw?=
 =?utf-8?B?bzBiUUw0dWZzODlnL2VUMFN0bkpwd3RGc0lRVFZjZjA4R3IzUFRwTno3dXNS?=
 =?utf-8?B?czNTMXo0RzBYd3R2cWNuc2ZHd2lOT01yKzBjTWFSZXM4L0dyN1FrYXVzZmFB?=
 =?utf-8?B?U21EU1ZpREZMeVo5L0lkWWlkb0dzMVdpTmpzTEp3TmhNYk53YW81MU5MaTRW?=
 =?utf-8?B?LzgybFhRRDJ5b1NFclNRRm90T3pKZEIyTnd3U3pIaFVFSkNhUE1QUUIybVpL?=
 =?utf-8?B?YVQ1VHh3MnVWRWVwUEJUZzZHM2VSRlBhTDcwZFRZMUplK2RNdFpweDRXYWtu?=
 =?utf-8?B?ckJKMVBvb1pkNUVIV0RqenJPVjZFbi9UcUpMOTlmUWsvSXF4L0hFYWovNWM0?=
 =?utf-8?B?WThKQ0NMekpuV05tTFpsaFp3c1k1OCttVkZ6NTBBcHpvVFlGcTBwajFaRGhJ?=
 =?utf-8?B?T2xLbnpOMHJtQUFJaVZBbmtDaUJYbEg4NHNOQW1VUjJGVmtrZWQyd0JQcGRr?=
 =?utf-8?B?STkxdC9kQm0yU3Zzck1Lc1YzZ2JFeVBrTnhWeXBaNUxSVWx1ZHlSSDRHRFBM?=
 =?utf-8?B?cjJxYVE5ekF0SjNrTHVmdEp4Z1ZEMUR0YThHMHNTOGZyN1Rqb250Y3JZT2hD?=
 =?utf-8?B?VGlSWmIzNFFtcW9SVmlxcllBaThteWxJazZJWGVvem12YUNNcWtJbWRjenBV?=
 =?utf-8?B?VVlFb2p5VHVmZ3V0NEhXNm1hb0k2dDJGaWthbVNwWHpvR3Y0V1ZRbkRQNjZI?=
 =?utf-8?B?OGl4L20vVWE1M1NIOXEvdm1ybzVuQXVYODUrS202REkxY2Q5TWtKek02Rm10?=
 =?utf-8?B?SXhzdnArUTRtd0toR0JnaSs1d0VFdjlDb084VDBJVkx6L0w0UlV3UHpSWkpR?=
 =?utf-8?B?d0JIajdCeG1GOFJFZTFBN2RwSmhHcXh5WVRXKyt3NkIvOEFoR21PcVdkeXVF?=
 =?utf-8?B?eTVPRzRXSWpWamhXV01lY2dUdG1xZkk2VU43VnhISjQ4d00ySzdDTitMbW1E?=
 =?utf-8?B?N0Nnb05haUxSTGVIRnRYeUtNalJvdXYxT2lQSHpna3FTU3Y3cFVsZ016d0ZT?=
 =?utf-8?B?cFVqanZaRXZNelhhVDRmckJNL2RLN1I1ZjI3K3B6eHhUWFZueTVOSnJ0ZU1I?=
 =?utf-8?Q?HLuV5o?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YnJjVGx4MVJWcDJkVnIzbzhDdlVYMnYrTGd6dlhOZmZUK01DcExKd0VlSXo2?=
 =?utf-8?B?ZmNYN0R2WXRpRjdiWkxvNTJYQ0wwc2ZxSVUwbHhZaU1CRS9Yc2p6OFpWT1Iv?=
 =?utf-8?B?ZElyck9KL2VIUmUvWm1raHFQbktBMFF2ZFBQUExMQzhyS0NJMDUzejVWZUpx?=
 =?utf-8?B?U09XdlM1QkJMeFJQenltL2xhS1AxejlLeEhrUXF1aTI2Mk8rUmhiYlRvRHN0?=
 =?utf-8?B?NlQ1d0dxZDdIZE8rb2FtdVdCMjB1ZmUrT1FZTmtwU0g4OGpNNEVVSlFOcVhO?=
 =?utf-8?B?YjJjb1M5RHNXbzdDc1RFNzNxZkl6dHRHM1IyMG5RYXJNMStkUlhyczRoK3hQ?=
 =?utf-8?B?aFRNMVE5Mk95azJ1UUdHN05kbTFVNm51SkpQYXlUNWJ3V21rNWVpNldsQnIr?=
 =?utf-8?B?QzlBaEFDNnJFUTVqS2NheEZ4K1VUY0llQXpMaEE5R1dNcEhWaGlHVUkvNm1x?=
 =?utf-8?B?bDU0VFBJSnREZXE5REZ6NlB3OTU5b0tMZnhxNS9KUG1KY2E5S0xYQ1RvME9M?=
 =?utf-8?B?WVJHMUpvb2dHdzVKbmRRU255eWM1S3dhWEdwc3ZMR1NUeHh4NXhON1pYcnI4?=
 =?utf-8?B?eUlXdGxrTUhKUDVsOS9IdmFmMm03TW1hTGpLTExkNzgyWXB5VVBmZDNBRXJq?=
 =?utf-8?B?Snorcm5VR3g4TUVNZFpxNUxDU2JQYUxlcHA2dm4xZzAyL2pRN3V1OUovUEYz?=
 =?utf-8?B?SmJEOEs1RTQ4MURZMitLZkp0R0x5eitVUXVFQTBTdkM1WWt2TnZJRmRHSDB3?=
 =?utf-8?B?L1lTL1NwRjFiVVdDZVlmakUyQzYxUTZqTWNjbW9YeGEvNGlGN1JnZW9BL3VR?=
 =?utf-8?B?TlpNaEpxYWN5NDFheFdhOW5wbGpFNUdLRmtROUpXWVNmQnBzeXlPaURLU2FT?=
 =?utf-8?B?UkdIRDVqcVJsMHRHNC92UUltcW5BaGdFcVRZMUhTSWs5WWdNdG1sTTdESDQr?=
 =?utf-8?B?cG1HcTlDanZXUGlGa0hocW03MmdRZWNoY2E1NUdhdENJUU0wdndWUTVCNENt?=
 =?utf-8?B?YnJvd1U3L0V4aDcxdldTVUxCVk1WbHpieXZBWTFYamF0V3pjQjAvYXIySXFS?=
 =?utf-8?B?emdlei85azR5SktwT0ZOdGNIb2N5WGZadUMrVU5vMWNlL2Nua0xsU1hDZGpI?=
 =?utf-8?B?cFk5UUdNSTN3TVVyT1hUL3ZZbEkvUExFR2xqc2xaUkhBdUVKYlMyTWkySWhx?=
 =?utf-8?B?MXI4WVRuSzFFdmpkN1ZGbzFmaWlzQ3U0ZFNmeGV0SE5UUXZSeFUzVTdxdXlU?=
 =?utf-8?B?NHhvaFdnNnlEdENOS05KRnArVmQvVnpiWnVGUGR1Rys3NEY1c2FKMUhWZ1lR?=
 =?utf-8?B?YS9LaVVGVkNCa2xXeTVOS2NUN3lxajV6WUMya0tMbXlqRG1hWld5dEo5YXNR?=
 =?utf-8?B?Y3VTUEtSRjI4K0IraDFIV2RVQUlnelArampLdm5sU2JpMHMwWlRKVXVmbnNO?=
 =?utf-8?B?UzdrZEpOVjgwaFV0LzI5TjRaQXBmVmQvTTdTcS9GdEFSZHg2eVdIbC9Zejlv?=
 =?utf-8?B?NlduK3djeVdTSW9zUG5ncnNqUmFkVHNwZkdlR0srR0RsQ0I2aUpzb2d6YUlj?=
 =?utf-8?B?cWp3MzJiNXlYaldLU0k5NEtSc04rbEtwcDlmQjhIb1ZKZWlua1A2RFdaUUIx?=
 =?utf-8?B?YVJWc255Q0hndHZhNGF2OWJNamRzeUh3Q0p2OUd1UHB5NzlsdFRiMTJkQklT?=
 =?utf-8?B?ZWlleFlWM3FRVWdLL0R2ejZDYnVRbENGU2pSRkFFaW1qZEhPNE1nUWp1eTRj?=
 =?utf-8?B?UmpjSjNzeC9OYzN3NmNkOXJteEp3SnpYcnZqTkZyNWYxaFNGWmk4RmRqVzc2?=
 =?utf-8?B?QjJ1YWpqcE82Tm9TcTRaN2tCN05nZFRNbVlLSmJpcTV6TklsTy9heDhBUXJY?=
 =?utf-8?B?VjVkKzh5TUxmRTQ4elgwd2FHNDcyeStOOFRkMmNsNTNyZ1dkanQrYW4xbkp0?=
 =?utf-8?B?cDBrMjI1eC8wV1UwSzRyTUdJQjltTWx1MVdOQWJqbXUvTTZ4R0FPTmtjWVN4?=
 =?utf-8?B?QzJhSktOZi9idXJQWFNoVkJpWUtOUUJVNUN2UTk5Z3ZrZnFQMThEakpyVDZK?=
 =?utf-8?B?eTdUeVFoeU5MR0krWUJLZCtzdW1xTXlBeHpYVDd6NmVSYWxFVkF0S1daS0xv?=
 =?utf-8?Q?xiW8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e073d717-18a4-4aa9-babd-08de30a39df0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 06:34:02.0496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /psv3olKmResGePDNB6/mCqTzNBAfe6V2Z3KmLewYBGMJTXeDG8A8f6a5LGpf+0txb1/vPUjHhc6l7SG57Kt6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7875

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcnlnb3Jp
aSBTdHJhc2hrbyA8Z3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBOb3ZlbWJlciAyNywgMjAyNSA1OjQ1IEFNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55Lnpo
ZW5nQGFtZC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEh1YW5n
LCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PjsNCj4gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBh
dSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQHZhdGVzLnRlY2g+OyBKdWVyZ2VuDQo+IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDIvMjRdIHhlbjogY29uc29saWRhdGUgY3B1aWQg
bGlicmFyeQ0KPg0KPg0KPg0KPiBPbiAyMS4xMS4yNSAxMjo1NywgUGVubnkgWmhlbmcgd3JvdGU6
DQo+ID4gVGhlcmUgYXJlIHNvbWUgY3B1aWQgbGlicmFyeSBmdW5jdGlvbnMgb25seSByZWZlcmVu
Y2VkIGluDQo+ID4gWEVOX0RPTUNUTF9nZXR7LHNldH1fY3B1X3BvbGljeS1jYXNlLCBhbmQgc2hh
bGwgYmUgd3JhcHBlZCB3aXRoDQo+ID4gQ09ORklHX01HTVRfSFlQRVJDQUxMUyBsYXRlciwgb3Ro
ZXJ3aXNlIHRoZXkgd2lsbCBiZWNvbWUgdW5yZWFjaGFibGUNCj4gPiB3aGVuIE1HTVRfSFlQRVJD
QUxMUz1uLCBhbmQgaGVuY2UgdmlvbGF0ZSBNaXNyYSAyLjENCj4gPiAtIHg4Nl9jcHVfcG9saWN5
X2NsZWFyX291dF9vZl9yYW5nZV9sZWF2ZXMNCj4gPiAgICAtIHplcm9fbGVhdmVzDQo+ID4gLSB4
ODZfY3B1aWRfY29weV90b19idWZmZXINCj4gPiAgICAtIGNvcHlfbGVhZl90b19idWZmZXINCj4g
PiAtIHg4Nl9jcHVpZF9jb3B5X2Zyb21fYnVmZmVyDQo+ID4gV2Ugc2VwZXJhdGUgdGhlc2UgZnVu
Y3Rpb25zIGJ5IG1vdmluZyBvdGhlciBmdW5jdGlvbnMgdG8gYSBuZXcgZmlsZQ0KPiA+IG5hbWVk
IGNwdWlkLWdlbmVyaWMuYywgYW5kIG1vZGlmeSByZWxhdGVkIE1ha2VmaWxlLXMgdG8gcmV0YWlu
IHNhbWUgYmVoYXZpb3IuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8UGVu
bnkuWmhlbmdAYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiB2MyAtPiB2NDoNCj4gPiAtIG5ldyBjb21t
aXQNCj4gPiAtLS0NCj4gPiAgIHRvb2xzL2Z1enovY3B1LXBvbGljeS9NYWtlZmlsZSAgICAgICAg
ICAgICAgIHwgICAyICstDQo+ID4gICB0b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRv
ci9NYWtlZmlsZSB8ICAxMCArLQ0KPiA+ICAgdG9vbHMvbGlicy9ndWVzdC9NYWtlZmlsZS5jb21t
b24gICAgICAgICAgICAgfCAgIDIgKy0NCj4gPiAgIHRvb2xzL3Rlc3RzL2NwdS1wb2xpY3kvTWFr
ZWZpbGUgICAgICAgICAgICAgIHwgICAyICstDQo+ID4gICB0b29scy90ZXN0cy94ODZfZW11bGF0
b3IvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMiArLQ0KPiA+ICAgeGVuL2xpYi94ODYvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiA+ICAgeGVuL2xpYi94ODYvY3B1
aWQtZ2VuZXJpYy5jICAgICAgICAgICAgICAgICAgfCAyNzMgKysrKysrKysrKysrKysrKysrKw0K
PiA+ICAgeGVuL2xpYi94ODYvY3B1aWQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyNjAg
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICA4IGZpbGVzIGNoYW5nZWQsIDI4MyBpbnNlcnRpb25z
KCspLCAyNjkgZGVsZXRpb25zKC0pDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2xpYi94
ODYvY3B1aWQtZ2VuZXJpYy5jDQo+DQo+IEl0IHNlZW1zIHRoaXMgcGF0Y2ggaXMgbm90IHJlcXVp
cmVkIHByZXJlcXVpc2l0ZSwgYXQgbGVhc3QgZGVmaW5pdGVseSBub3QgZm9yIFBhdGNoIDMuDQo+
DQoNCkl0IGlzIHRoZSBwcmUtcmVxdWlzaXRlIGZvciBjb21taXQgIiB4ZW4veDg2OiB3cmFwIHg4
Ni1zcGVjaWZpYyBkb21jdGwtb3Agd2l0aCBDT05GSUdfTUdNVF9IWVBFUkNBTExTICIsIFdlIHdh
bnQgdG8gZ3VhcmQgbmV3IGNwdWlkLm8gd2l0aCBNR01UX0hZUEVSQ0FMTFMgdGhlcmUuIFdpdGhv
dXQgdGhlIHNwbGl0LCBmd2lzLCBJIGNvdWxkIG5vdCB0aGluayBhIGJldHRlciB3YXkgdG8gYXZv
aWQgZnVuY3Rpb25zIGxpa2UgeDg2X2NwdWlkX2NvcHlfdG97LGZyb219X2J1ZmZlciBiZWNvbWlu
ZyB1bnJlYWNoYWJsZSB3aGVuIE1HTVRfSFlQRVJDQUxMUz1uLg0KDQo+IEluIGdlbmVyYWwsIGkg
dGhpbmsgaXQgY2FuIGJlIHJlbW92ZWQgZnJvbSB0aGlzIHNlcmllcyBhbmQgc2VudCBhcyBmb2xs
b3cgdXAgcGF0Y2guDQo+DQo+IC0tDQo+IEJlc3QgcmVnYXJkcywNCj4gLWdyeWdvcmlpDQoNCg==

