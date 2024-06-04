Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E048FAAE9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735172.1141350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENjm-0005Th-2c; Tue, 04 Jun 2024 06:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735172.1141350; Tue, 04 Jun 2024 06:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENjl-0005R0-VD; Tue, 04 Jun 2024 06:33:37 +0000
Received: by outflank-mailman (input) for mailman id 735172;
 Tue, 04 Jun 2024 06:33:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAXK=NG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sENjk-0004zt-Bp
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:33:36 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2414::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d4ec3dd-223c-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 08:33:34 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH0PR12MB7906.namprd12.prod.outlook.com (2603:10b6:510:26c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Tue, 4 Jun
 2024 06:33:27 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 06:33:27 +0000
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
X-Inumbo-ID: 5d4ec3dd-223c-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqKPJv0RdXPpRDq6Ll38BB13ZKR3hTm52dpJICZhnfYTpCT1yek+FAeRMgHjwkl+kfyHzYGFDut8dvh9vtW8LNEx/7TK/8ocTtBwMv8fJzK2d3jnBNpu8DYcfNiKTKOlAgfaawViaiFpIChR0BqSin1yt+C4Mz7PZ5BlrSu7z8kYAsY5w1bYaGOrCSJko/tnWPUv4UVmEo0p5eStvDsJ8MmAedp3cVYsdNkW830ZqjOUeFH1rVHyHBpcPOjLJuZ0CqdQn/xGF+4FpUEvJX0UGjb5thts0TYLx4/DnZ7KTCccmHhNWktkVu3pLSXQay6j0LXl7SHqFKL7kUSJhgSlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SH7CTEWc4mMzUAt0EfdEJB13zi2D3Z4Mets+ryceVJY=;
 b=Q1VTvNkRidErkYG1dEm+sSyWjWsxwy28UFyf9MAqjHp/TjzY6g/b/280sMQtpfNOf4aEOyPmWRwHd3wQoWenDblIU2abx4M9sS//90iPx28uKN/LrFlL3FuaJcgXioqPJCSVZ5fgQnOHM5W/85ph4BC+Awr4Hr///b1LWUnmIMJMEmvzttuQEPqh7j+O+btbao28jppz+3eA50LzpAHxKV0oghiLRt1boyuZzgsX17fC/xfj/03+Miri+8lF6uaTGoPRLItQafdQnE+hg1Vfr2yJab8q8BodN4OJ8l9KqbFE1UvY2ml4FtixpblTA5CsxS32/eIzIy7sKIuzjFuQpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SH7CTEWc4mMzUAt0EfdEJB13zi2D3Z4Mets+ryceVJY=;
 b=GroaUCWgzsYDN2q18hJO5t/CF8htHNMBjcI4fBBrXQ5KEovi+2cqHYjFFUXJEEingoYK2d3zyoTj0wB7dvL/P263o8/7+lCnNwCmWnYqrU0zBYhlPqAEl82zhRZxk3OzbOghoS28XZxdikM1XOB5TrOo2AIHjlYO7cdYLFbgNW8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A//+FmgCAEsTugP//viAAABEhvwD//4GYgIAAoyuA//+0FICAAgSCAP//yCWAgAeLLwD//6n2gAAQ1XyAABA5GQAADz4pgA==
Date: Tue, 4 Jun 2024 06:33:26 +0000
Message-ID:
 <BL1PR12MB58494B2DD0CD75CCDF1F5CA1E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
 <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f125e2e3-b579-410f-b6ab-93d008bf9a9e@suse.com>
In-Reply-To: <f125e2e3-b579-410f-b6ab-93d008bf9a9e@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH0PR12MB7906:EE_
x-ms-office365-filtering-correlation-id: 0fb03118-5c56-4051-703b-08dc84603de9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|1800799015|7416005|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?OGp1VUZ6cXIzcC9naTdiN0FLcmFlSk8vTEdiRklwSE5aR25Nc3dKTTB4MVc5?=
 =?utf-8?B?cWdjSDhiaWJnclBQc3d0cHV6NWFqK3VvQ2FsMzRMemRXMStqMy9sRjJ2dkxF?=
 =?utf-8?B?UE44K2NqSDdiNFVZeW5qSnpvTHUzdGY2YTFvZE9yOUJHVkkzS3B6ZWpjYW5n?=
 =?utf-8?B?anpaQWdPVmF0a0htUUdCejBvNjBqcHFFL2s2UWswRkVJKzFTRGdMNGRhQzI5?=
 =?utf-8?B?V256MDl6VTBFbzhmYTI2NnJ2a2x2cFh1ZjhNZldXOHRldEtNWmNaMFM2Q3Zh?=
 =?utf-8?B?NmhPZ2Rrb2FyRXozUVl2OGMzREoxVURaRmVxRm9xRVNFZFdReG5HNzI4TkVm?=
 =?utf-8?B?dFlMS2VuSlJpR3VuajIzZHUwc2lsMmJGb2RSK0F2VERGejBvN2JyelBLZkhz?=
 =?utf-8?B?T1lZMFcyQytmbWIrYXBOSTRUNk00Tm50TGFhZ2svUVRmdXkrMlFXUW9tQXpo?=
 =?utf-8?B?TFlJZUhGaVNUMTE5R1VoRjh2VlRrWC83OGJSUmh1M2tva3dHbG1Vd3NpVTBs?=
 =?utf-8?B?VUJHRXFneS9JbENzUFNGZHNkQUM4dm9KeHc0ZWhFMmtqckN1RjdxZVk2OUxx?=
 =?utf-8?B?Q3dRY3hnVlZ3bzlOVkdVNlJ2bzFxdWRIZld2cEJWbWVHRDFyd3l0TlkrQVdp?=
 =?utf-8?B?a2NLVzdKTHVQc0RHNVFuWUQycm5TcWlNWEJuVE03bnhoN0t6N1pOYThKcXJq?=
 =?utf-8?B?S3VNM1l5UkpuaVpZVWg4OUQzZm14OVlmY1dzdW9McXZMckdyOEE4S0RUOVBm?=
 =?utf-8?B?QnNRTUZzWHoxVHkvMkhWQS9JbVMzRmNGeG5kNUprSzBvZmxwaHNLTm0rb1dD?=
 =?utf-8?B?V2hiTnB6TzFDSzhXMU5oUXE5V1hibm53US9YTENGNzFMUTFXSy83OVBlWjEr?=
 =?utf-8?B?REFqRDV3Y3pkZW8vek1MWXlZRFFoclFsYWJId0ZkbXVDK21qQnVYTXVkTE5l?=
 =?utf-8?B?ZWk1ZFFieGI4akZDMDN1OU5ONzlNaHkvSHpmbUZpaFpkbG95cmtFcElya3V3?=
 =?utf-8?B?WjZjSHZRclY0Qk9PRnRVWTZTZkdlTGRwYUNsZkVsODZJUkpkZ21URGpKSWNN?=
 =?utf-8?B?THAxanhRcjBxNzlwZWd0ZWxaTXJBakJTU3Znb2dNeWpzSWJ4aVQ5dklZREdn?=
 =?utf-8?B?bm12cFhNbEJqYWIwb0FZUDd3R3dnOWtNbG1GMTQ3STExS1pXU2Q3L3JIcW15?=
 =?utf-8?B?MXVrZitMUG1oYVNUdVBEMnN1T05pUlQrWWlkdm9RMmV5WXZkWklHR0NPa2RJ?=
 =?utf-8?B?cWFXbkVuWnNOZzl0Zk0xbU1GZXJNeHJnODNCM1Y4TlpObTdHSGk0V2E1c2la?=
 =?utf-8?B?ZUM3N2VFNU16UzUzUXZSUFZjNU1GMjNHQTBXaExXT3F4SkZOTzZQNE9ZTytw?=
 =?utf-8?B?dkZKbXl5c3hGNVlsMTZQWitPVVdVTXdCNjd1K1hsOWRnR1F0OWZ1dmdoQkVV?=
 =?utf-8?B?VU5ocEhOSndPclBiRTBOSS90RUNJSHkwSm8vYTVOQlNXRW1Eb0k2QXdzUGwy?=
 =?utf-8?B?SGJQbFNvaG1RYU5NaGd3dTNyWE9MRnhtRUNiSDNMWDF6a0RpMTh5RGM2a241?=
 =?utf-8?B?a293aWhtWmNqQ29UM1Q5NGg3K3Aveml4czRINnM3RS9SSE81bTN1WTRuMmZ2?=
 =?utf-8?B?SXZpQ0xVek1NaEUwRmR2NzAva0RXN3ppWjhVUE5aSFMzYjgrK29RVE54c25G?=
 =?utf-8?B?aFk0WmREdndkNDJJVGZtT3pnWXVaaVYyVjh4L2tFeVZFNWgwSUg1bjdLQmhV?=
 =?utf-8?B?ZXMycmpiYVZFcVNjaC9BODM0ZitnVW9RL3N2ZzhjN21wWEZoQklmV0t1V3Rs?=
 =?utf-8?B?dndIWUR0TVgrVDEzdytkZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzdyZ0tpdDhGTUJxVFlaeVJUbjFEdjV0cmZDb1RnU09ZeVVoUlhZKzNqaktj?=
 =?utf-8?B?RnJ0V1p3TzRlbUhtdjRpc0NIUGxGcHJOVG9QSWZ4cjRiTWNSVTJYakR0V0ZR?=
 =?utf-8?B?RWlhVmNTNWw3Y1NTTDJndy9iNzU2Nm9Lbm80Tmd4VFZQSytUaVJseGRsK3hh?=
 =?utf-8?B?MmhZK1I2eG5ObVB4cDNnM3NkcThQaDhoSjJ3WWRQR3c1WitxdnpVSFZkWW9D?=
 =?utf-8?B?N3F3WW1samhxck0xT2NMeWRmMjhRRW9KTnc0bEM1K054ZUVnRDlaYjRtSk9k?=
 =?utf-8?B?amtSU09iOGZvL3M1L0FaeitOa245UXV1K1JiSFpjNTNEYm8ydDBpUWNpdENX?=
 =?utf-8?B?c3draGRWeHhMWjBMYTVHZjZDbVVzUDU4VHhtT2dVWXI4M0NmY3JycnpkTnJ2?=
 =?utf-8?B?eWhNUnlPZGhvci9SZVJLNGlOUUpOTE5Qb0lON0dWNUJjcWxqSUt6c0ViZDlr?=
 =?utf-8?B?MjF5c1ExbGxwVmk4b2hmdFhDVC96TTgySW5pb0dETEY4WFN1N0xvc2lJZzVB?=
 =?utf-8?B?ZnRJcTJOdk1wcW5jRTM3NVNZM0NZUHBLSVhpTXZEWHo4aDAyRnR4aVQwb1kz?=
 =?utf-8?B?WEc5NzF6Z01sMW5KNUVrRFVidDYyWVNhK0VTOEFocDcyR1g5bU5WV2N3NUlL?=
 =?utf-8?B?THVQN1VsMk8yVFpOWkY2MDNVRHZvQjZJNVpGb0VIUUJ6d2lCVC9hYll6NGk5?=
 =?utf-8?B?MWxsZ0RrV29aaG5PRDFFUDg2Ym5jZzg4cmUzSHIvbUVvQ0FDSXF5eFJibU5M?=
 =?utf-8?B?UmtaUXo5amFQYjBqZEs2ZFlPNnY5ZFQxZjhvczMxaTRlQW1sOVFnNngweHd0?=
 =?utf-8?B?N2dac0t4UXpraGZqMkVsOWRPeEVaaEk1SDNIdmM4TlVWNUxGd0hOS0xMR1pN?=
 =?utf-8?B?b3MrYnNsR2MzWVJBbGhZK3ZGeWZLV3hpbGlLbGtDNmRMamZGZ1FPMTdHSnFp?=
 =?utf-8?B?QTVDTk1VMFh6cXZnVWpPVzlPTEg0RkZJVVFmalpuV3U4M3Y3OHEydFU2VXRl?=
 =?utf-8?B?QUFSZ1RTWkdnWk5LbXRiaDBYaG1SRkYwV2xCeHFBbmd6RVBOeXd2VUQzaUd4?=
 =?utf-8?B?dUNqYnVlaHZBeHkzS1Y1T0w1SFNkZTQ3U3lMZGxaMWRHSTcvbFoxZDZSSWpv?=
 =?utf-8?B?bjdtMlBxT1pTS2ZaVDRnNGZacURzRi9GQ2xUMk83cEJZQ1gyeXpwY0JFYUtR?=
 =?utf-8?B?NTBSR3M0ZnB2L2J4MklOTGc2Myt0U0JBNWk1U1BVVlV6N1gvVW9JaEpYTTAw?=
 =?utf-8?B?am5BZFdveHkyYVlBQ1RVcFRoeC9zQUU4RHNvVmVyTVlrNUR4RG9YNlRDaEJY?=
 =?utf-8?B?c2ZXa25IUDdEN0xXWWd3NWtHcllUaVgzK0hhejlpS01INHZkQmhqcnd1L0Vp?=
 =?utf-8?B?N2V1azFJS2I4QmY3MlkvK3Uzb3hGaVhXV3FqLzdiSVFUNHNqbHJzU3hvaDgr?=
 =?utf-8?B?d2tZenUvUURSaU1UeU92WFNNWHE1LzFTQVZXNHcwUXkrdXBpaVhPSFZYdlZ3?=
 =?utf-8?B?bDZJb3pKN1hKNHpZMTBoRkxnUkR1TDN2M1lNbys5VkhRRkJsd2Q5UXNSKy9Y?=
 =?utf-8?B?Uml2U21rS3FyQXNxT1JZRERIR3pMa1J2anZjcVZJbmN4RG5LVUpyYitoaFJJ?=
 =?utf-8?B?elRnRm9RTWl4VU1yV1EzMVpTSEsvOHNmanF5NzdIR0MrUWV1aExEUGd1cVZY?=
 =?utf-8?B?RjN1MEhwc3BYTHZIZWFwS2hkNjlBMkM3L29vUmFKckhDVk5sQXF4a1JaVHVG?=
 =?utf-8?B?SzBTcEF6bDVJbUt6L0NyRGVqalhxV0JsTmRORVB5RjZKVFNNZWRQbFYvaWpO?=
 =?utf-8?B?cUxTd29DYUwydEJya2NxNWc1eEo1N3Jwd0NjeWREU2w0NWo3VEFuaTNiVUZH?=
 =?utf-8?B?ZEZuVUVvS1E3U1VYT0hrTGpBUDBUQkVkam1QQkJ5Y0RLNDNOM2NBUWdFQW5D?=
 =?utf-8?B?SHovRjgzL25VTDVoaHV1M3g1NlBsNkdXcGlqYjhzYW50ZnBuNEN2bVdITFJ5?=
 =?utf-8?B?ZWJ6d0E4dHh2dEYyVDNqcFM0RW1CdlpPRmZnckNOcUhqTTdxZEd2Y0U3aWp0?=
 =?utf-8?B?dzB0RWZmSWdvbEdkRnhCYnRCblhiVENVREU3ZW9tQ3NSUkphaUpzcm1ZK21H?=
 =?utf-8?Q?FAxE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <553859B258E7A443BF6F41D71A53D22A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb03118-5c56-4051-703b-08dc84603de9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 06:33:27.0018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mC/aNAM86X3H/WE2gQZ/wLg4J5qkepsMZYqmSKZgEByRihaYd6ZWPcck280rkzqIY5ptYEJ7o7S4EDWH5LGdNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7906

T24gMjAyNC82LzQgMTQ6MTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNC4wNi4yMDI0IDA4
OjAxLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI0LzYvNCAxMzo1NSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4gT24gMDQuMDYuMjAyNCAwNTowNCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0K
Pj4+PiBPbiAyMDI0LzUvMzAgMjM6NTEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMzAu
MDUuMjAyNCAxMzoxOSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+IEkgZHVtcCBhbGwgbXBj
X2NvbmZpZ19pbnRzcmMgb2YgYXJyYXkgbXBfaXJxcywgaXQgc2hvd3M6DQo+Pj4+Pj4gKFhFTikg
ZmluZF9pcnFfZW50cnkgdHlwZSAzIGlycXR5cGUgMCBpcnFmbGFnIDAgc3JjYnVzIDAgc3JjYnVz
aXJxIDAgZHN0YXBpYyAzMyBkc3RpcnEgMg0KPj4+Pj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5
cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAxNSBzcmNidXMgMCBzcmNidXNpcnEgOSBkc3RhcGljIDMz
IGRzdGlycSA5DQo+Pj4+Pj4gKFhFTikgZmluZF9pcnFfZW50cnkgdHlwZSAzIGlycXR5cGUgMCBp
cnFmbGFnIDAgc3JjYnVzIDAgc3JjYnVzaXJxIDEgZHN0YXBpYyAzMyBkc3RpcnEgMQ0KPj4+Pj4+
IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAw
IHNyY2J1c2lycSAzIGRzdGFwaWMgMzMgZHN0aXJxIDMNCj4+Pj4+PiAoWEVOKSBmaW5kX2lycV9l
bnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgNCBkc3Rh
cGljIDMzIGRzdGlycSA0DQo+Pj4+Pj4gKFhFTikgZmluZF9pcnFfZW50cnkgdHlwZSAzIGlycXR5
cGUgMCBpcnFmbGFnIDAgc3JjYnVzIDAgc3JjYnVzaXJxIDUgZHN0YXBpYyAzMyBkc3RpcnEgNQ0K
Pj4+Pj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNy
Y2J1cyAwIHNyY2J1c2lycSA2IGRzdGFwaWMgMzMgZHN0aXJxIDYNCj4+Pj4+PiAoWEVOKSBmaW5k
X2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEg
NyBkc3RhcGljIDMzIGRzdGlycSA3DQo+Pj4+Pj4gKFhFTikgZmluZF9pcnFfZW50cnkgdHlwZSAz
IGlycXR5cGUgMCBpcnFmbGFnIDAgc3JjYnVzIDAgc3JjYnVzaXJxIDggZHN0YXBpYyAzMyBkc3Rp
cnEgOA0KPj4+Pj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxh
ZyAwIHNyY2J1cyAwIHNyY2J1c2lycSAxMCBkc3RhcGljIDMzIGRzdGlycSAxMA0KPj4+Pj4+IChY
RU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNy
Y2J1c2lycSAxMSBkc3RhcGljIDMzIGRzdGlycSAxMQ0KPj4+Pj4+IChYRU4pIGZpbmRfaXJxX2Vu
dHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNyY2J1c2lycSAxMiBkc3Rh
cGljIDMzIGRzdGlycSAxMg0KPj4+Pj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0
eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNyY2J1c2lycSAxMyBkc3RhcGljIDMzIGRzdGlycSAx
Mw0KPj4+Pj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAw
IHNyY2J1cyAwIHNyY2J1c2lycSAxNCBkc3RhcGljIDMzIGRzdGlycSAxNA0KPj4+Pj4+IChYRU4p
IGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNyY2J1
c2lycSAxNSBkc3RhcGljIDMzIGRzdGlycSAxNQ0KPj4+Pj4+DQo+Pj4+Pj4gSXQgc2VlbXMgb25s
eSBMZWdhY3kgaXJxIGFuZCBnc2lbMDoxNV0gaGFzIGEgbWFwcGluZyBpbiBtcF9pcnFzLg0KPj4+
Pj4+IE90aGVyIGdzaSBjYW4gYmUgY29uc2lkZXJlZCAxOjEgbWFwcGluZyB3aXRoIGlycT8gT3Ig
YXJlIHRoZXJlIG90aGVyIHBsYWNlcyByZWZsZWN0IHRoZSBtYXBwaW5nIGJldHdlZW4gaXJxIGFu
ZCBnc2k/DQo+Pj4+Pg0KPj4+Pj4gSXQgbWF5IGJlIHVuY29tbW9uIHRvIGhhdmUgb3ZlcnJpZGVz
IGZvciBoaWdoZXIgR1NJcywgYnV0IEkgZG9uJ3QgdGhpbmsgQUNQSQ0KPj4+Pj4gZGlzYWxsb3dz
IHRoYXQuDQo+Pj4+IERvIHlvdSBzdWdnZXN0IG1lIHRvIGFkZCBvdmVycmlkZXMgZm9yIGhpZ2hl
ciBHU0lzIGludG8gYXJyYXkgbXBfaXJxcz8NCj4+Pg0KPj4+IFdoeSAiYWRkIj8gVGhhdCdzIHdo
YXQgbXBfb3ZlcnJpZGVfbGVnYWN5X2lycSgpIGFscmVhZHkgZG9lcywgaXNuJ3QgaXQ/DQo+PiBO
by4gbXBfb3ZlcnJpZGVfbGVnYWN5X2lycSBvbmx5IG92ZXJyaWRlcyBmb3IgZ3NpIDwgMTYsIGJ1
dCBub3QgZm9yIGdzaSA+PSAxNihJIGR1bXAgYWxsIG1hcHBpbmdzIGZyb20gYXJyYXkgbXBfaXJx
cykuDQo+IA0KPiBJIGFzc3VtZSB5b3UgbWVhbiB5b3Ugb2JzZXJ2ZSBzbyAuLi4NCk5vLCBhZnRl
ciBzdGFydGluZyB4ZW4gcHZoIGRvbTAsIEkgZHVtcCBhbGwgZW50cmllcyBmcm9tIG1wX2lycXMu
DQoNCj4gDQo+PiBJbiBteSBlbnZpcm9ubWVudCwgZ3NpIG9mIG15IGRHUFUgaXMgMjQuDQo+IA0K
PiAuLi4gb24gb25lIHNwZWNpZmljIHN5c3RlbT8gVGhlIGZ1bmN0aW9uIGlzIGludm9rZWQgZnJv
bQ0KPiBhY3BpX3BhcnNlX2ludF9zcmNfb3ZyKCksIGFuZCBJIGNhbid0IHNwb3QgYW55IHJlc3Ry
aWN0aW9uIHRvDQo+IElSUXMgbGVzcyB0aGFuIDE2IHRoZXJlLg0KSSBkaWRuJ3Qgc2VlIGFueSBy
ZXN0cmljdGlvbiB0b28sIGJ1dCBmcm9tIHRoZSBkdW1wIHJlc3VsdHMsIHRoZXJlIGFyZSBvbmx5
IDE2IGVudHJpZXMsIHNlZSBwcmV2aW91cyBlbWFpbC4gDQoNCj4gDQo+IEphbg0KDQotLSANCkJl
c3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

