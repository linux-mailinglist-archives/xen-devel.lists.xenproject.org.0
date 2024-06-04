Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D47E8FA8A4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 05:06:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735095.1141240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEKTn-0000En-F5; Tue, 04 Jun 2024 03:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735095.1141240; Tue, 04 Jun 2024 03:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEKTn-0000Bo-CM; Tue, 04 Jun 2024 03:04:55 +0000
Received: by outflank-mailman (input) for mailman id 735095;
 Tue, 04 Jun 2024 03:04:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAXK=NG=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sEKTl-0000Bi-Af
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 03:04:53 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3415191d-221f-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 05:04:49 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 03:04:45 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 03:04:45 +0000
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
X-Inumbo-ID: 3415191d-221f-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPjA7XXM3abUb4JZsv7EVbwbt5JTIEC7xXV95MI5bVETc+0amrgyBRAbrf7coVl+gBCkzd001xaVxal7ploZM1goM+mkQocodgkzElbiH0LBHUS0mpnPH5oVBilK0JZlcS4SIVMSlwZb1UXOEVQVx/qBTFRBRxzVysu4TVhlLuIgW0KQFdSBJiiSbjElqMZnJwinn3gLHQFMjUptdnZo4o2iKivCJTmIc+xMAW2GWu1Idg77tFEPtBPOn9KhQvCFOo8GroHvLkz4G+w0CAROcoPsZNn20dz3ceDVv5pjacuz5ZCR25pTovuyNA406+TyAQAYznhp2mOx2OLJ3dSvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AO3g070u72H6qs28dyooBvgbonPvKK/u0YKvdal2ZEs=;
 b=DtoD2Nk6ejBTpYSOAWZoVODWFSJ2SA6Hfw9ti2pcXgFLt2Xdh6lql9l4g9o9iOPqviCw6DLkIgYzjbh/byOdk8cL19DsVqI28mcfITNqxQKuNYGzXRs9OmI98Ro55eAqhcjII0fP/YHdg7pgBdcD5NdZGXWEbHj8AfHjxlAA1BkcfvJRyGFhktF9zDU4hzleFVCzW3ARTQ72M43NJg+MuuDzBjOf9YbLRGlOS8D1CClKO5metKiT35pL/z2eYcJ6p2pc14DCRwu85yRo8tDx6EY19Beb74lCMyw+qNEWUWRdDd3H4sFYuRBjXdrODOzaI8VEEeSZiXUECdq/MTojoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AO3g070u72H6qs28dyooBvgbonPvKK/u0YKvdal2ZEs=;
 b=Mtxmm6gV+uTdaylVBtwJxZjRYsEjJMk3MUHKZkIW7dunaGk4sAYEr550NNMa7G03nptjZm76fCYU1LtRWGzk79JPiMVbp433Gh9PBIBAfu3iXA+sY1LnCqKJqP8w8PloxJRMPvQBtN8AX/j73G0/LcjzykouxTT5AQqzGOCh1lU=
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
 AQHap3bgiER4vYjwvk2+R5oTa8V63LGZ5EYAgAHVa4D//4e1AIAAis+A//+FmgCAEsTugP//viAAABEhvwD//4GYgIAAoyuA//+0FICAAgSCAP//yCWAgAeLLwA=
Date: Tue, 4 Jun 2024 03:04:45 +0000
Message-ID:
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-6-Jiqian.Chen@amd.com>
 <9652011f-3f24-43f8-b91e-88bd3982a4c4@suse.com>
 <BL1PR12MB5849EB5EE20B1A6C647F5717E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
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
In-Reply-To: <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CYXPR12MB9280:EE_
x-ms-office365-filtering-correlation-id: 08cc546e-14fe-46b1-5ef5-08dc84431666
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?cjFmRW85dUV0UXdPUVZ5U3lVZjBrK3BhZEhsbEVvYTVjUUJuRDRpTEtNOGZm?=
 =?utf-8?B?UnVYZmVSekx1VzBaNC84UW8vVVBWVDlsTzFWZkxHbHMwMFRCVHhYQ3h6R0VS?=
 =?utf-8?B?TzNER0xBd2w4QnIwald4cEorL2QyZGdRSGVjVTY0eGtFK1ZhWXlVeFBUWmFv?=
 =?utf-8?B?UE5RdGxQTUdWL1dzVEtnRTdmOE5QbTRrcW9OSU5XYzFvRThWVHlQMG5neWxv?=
 =?utf-8?B?cnBVWkVSSWRjcjJKbnhHY0xEY09ySFJpUHJRSjFCMlo4eVRnbkJUK1dmREVT?=
 =?utf-8?B?UnVEUjVzMS9YVk5JMEdSVzJzelN3NzJVOCtKVmk4MWlEeVFUMXl5dUl4aG5n?=
 =?utf-8?B?RHdGODhDbHRSZTNBRUZ5aERXNkF1MW53ZkNLa1RJdW9mL2ZoVjRGbVJQZ2Jj?=
 =?utf-8?B?V01JUmJBTG02OS9pVEZ6ZmIzbEY0a25XdGlxWkY5aGNnMitOTVpoVmcwSHJO?=
 =?utf-8?B?UG9WNmNiNW5uaGpZWWxXSkhXbDAvb1ExMlVxdmdhd0dGTlhsb3o3V3dOaThy?=
 =?utf-8?B?NUNYTXZtL0sxM1BiVlVyUVczZnB3Q1AvYy9XZnBnVFh4UFRXd1YxTXZlSm5N?=
 =?utf-8?B?T0w2bnlmV0ZWbXZGVWsxcVdjSjRXbHhwNitWaTZSK05LNFp3RjEvcWZFMFRN?=
 =?utf-8?B?ZmdSMms5UlBmKy9ZVk1jR2NuOGloNkk1czZKdkRtOU9nZjVjVzVUL3RzUExx?=
 =?utf-8?B?UCtiTzRsaEpYZFFURXJ6dktWK1QyeWlBK3FnMlFFbEZYbFpobzZuc2F1Szd0?=
 =?utf-8?B?QTZHcldQTDFyU1JpeWRyTHBWU3FXWVpkUkNQZmo3eXJwVHhRQndmMDNRWk1m?=
 =?utf-8?B?cENndThYTjByOThZSXM2QTZtb1BMNDk5ZytXdXFWemREb3lvUFc2QjUzRDRr?=
 =?utf-8?B?UEQ1OXJuSmRHK085N3M3RTZLeTRVZW56NzBieUhRRGVGTmhFaFZMZjd2TWlL?=
 =?utf-8?B?WU1xVDFOVDI1N1hNZHdYbW16OC84QTE1N2JTRG1pS1BYU3NPcU1CWDAybDha?=
 =?utf-8?B?Tk1hNVdJLzBtNFVlSTZRbGtMdTJycTBRbnRKaTlZditvYXQyTUtYVFpqQ1do?=
 =?utf-8?B?RmFuMXJjYXhtRFZuUWlxTlVaMUo2REVtS0JaR0tLcWpudVVGQ2FQZWcrMUZC?=
 =?utf-8?B?cC8yOW82S3RFL2lBdGQwRmZ2RjJRbk1aMkxXRU1mSndSSFNrQlRBbG5tWHVP?=
 =?utf-8?B?enlNMkxUakZlTzYxNG44ODkvd2F4bDdma01hTzhvTDhGMlREZmt3TGtHbkZs?=
 =?utf-8?B?b1djSjdGdG02QW5pYXdtS053SjlVSk1WMCtWenNsRi9NZnEzaUhDMG9oS1Y5?=
 =?utf-8?B?VUhBOU5sZnpLTWlyYWh4RHhFV2RiTm9SZDNyS09TL3I3bFZHV2pwRzR0NWQ0?=
 =?utf-8?B?b1l4Mzc1UVRYb3I3YXBsaXZZNEtNMlpWM3JDVnJGWGZENm40S0pIK2piUXpz?=
 =?utf-8?B?cUZad1NWbGpHOFVqV3Q4R0J5RkFadi8rbEIzTHQ2WThmbWx4bUhjM1lZOSts?=
 =?utf-8?B?cFhwZG1tODdlalFjT1hhNWhHdXFRbnNRQjloL0k1Sjg0MjdxNElldGRBNUhq?=
 =?utf-8?B?bjloNDBGcmd1dnJ2UCtmaE00Z01iWWwwMm1ZdnRsM0VxU3IwdWdoOTJqKy9r?=
 =?utf-8?B?aStGTmwxeDBlN1F0WFVyN2xCUkN4RWlQZ0VpVjllSDFjNTBOc1dxNGNHakRa?=
 =?utf-8?B?eEc4MGpGR01iSCtVSG9tTGhvaVVqM0FaOFZRd2tGa1hQM2ZXdnBINlhnclNN?=
 =?utf-8?Q?Ps2sheRzmHLL5Md3tS66dps89e5+34MtBq94iBN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MUhRTjU3ZDBuZStBZVJnNEhyd3B6Qll1YUVleEFBdjZucWNPUmpiYzBZbEFU?=
 =?utf-8?B?Uml3dDNPTEdvRnNrQmZLZXAwVXoyak5WQm02UTh3dDhQTUFxQk5kdTNYeUNj?=
 =?utf-8?B?MFlZYXM4VTVQT0FsVEJEbkxJS0x1VmlyVU1DV0xhZmVnUzgrZ1AyRTRkNXJl?=
 =?utf-8?B?RjQweWNFdlVJNkRkbHlzY0NLVUg2WmtqbUlyNEpWME02aUFVbVhQUVJWQjF5?=
 =?utf-8?B?UTNhSVZMTUJjVUNuKy8wclRKTVE1SFJXOVVVeFo1L29TaDQvNCtUNmlKcy82?=
 =?utf-8?B?MHNTQlUwWmtKYkRBS1hLYzVnWW90MStacHYyMml1ZENzcC9Gb0FZNnBhTlFV?=
 =?utf-8?B?bVFpZDBCUlRNU2hzemtLcWNvV25JVjRhRGhyT0R3SVBrcFptT0oyRUdjUnJ3?=
 =?utf-8?B?SG0zSjUrUG04aDZ3OW82N25YVXFoY2gxdk5OZGZZd1Azb0JtK0tOb0o3c1l2?=
 =?utf-8?B?TG1ieGhvSmxDRXZVd08zN0pvK2I5L0NGTVRPTDN4SGJRYnhxUitMQnpLSDFk?=
 =?utf-8?B?RHo3WkR1eWlMSWYxTE1QWlRyeDVXN1VQYUFUZmJ6eGFuYkdqRjdIcGwwa3dq?=
 =?utf-8?B?ZGtpUnFlZ2xXSlBLeThnaFh0ZkdCRnVpV3FJUU5oS1FUeTRCVWhlVXlaK3lj?=
 =?utf-8?B?SzMra3FmWUJNeHhlV1JVUXBWc2J0UVVzb0R2a3lwTzlWR0RYdjVVY25GWE95?=
 =?utf-8?B?SFFNNGswR2Z3YWd0NzNmdkFpUWg0TEZxZlVwc0ZuMkZ1TVZtSDAyWkJJQ3p5?=
 =?utf-8?B?SlNlcFZKNWJuajBZTzgrU2NDeHl0M3pmSys5blRBaUpZZFhDQzBMWDhjSE5H?=
 =?utf-8?B?d0NyQ2xrQUVKYWZPUW91dWV6OG9iVW5haHNlVUlsUDYwWk10dlhGcTRCcmVC?=
 =?utf-8?B?a04yaktWRnlhTm94YkpBOHhqNlZKZ0h3YXNaaVVvRnBNTUNSRVlUUkw4OEh4?=
 =?utf-8?B?eUIzcm1LVlliRStUdlhmaE5yZit3SlRJeDZZdUkrbko3SUcxV2hhRE5SUzNw?=
 =?utf-8?B?N2VpOExJR2VLYjdqYlBncmNLSTUzVGxyZDg1MDkwWkswOFRrK0tndEtFaDBU?=
 =?utf-8?B?djdINFZyUUd0NzlZZ1RmWUFWcW1yU2FCcmpIQ1RnajQrVjRvT3VDREpTMGpr?=
 =?utf-8?B?VTA0QTNQSEI0eVA2cTUrSzcweGpKYmZ6SHNtZzdFaUwyc29QODVpd2NQM3hY?=
 =?utf-8?B?eXBObHhPNTNmZXNINWQxcVNJK2VBTkFuZDBodm9OZFFxVkVFdFluVi9GNm52?=
 =?utf-8?B?RWNhREl5cEJ5TTFicGR1NDBUZEhDeUtOSXZXdGtyUk41dEpSZUZPeXVqTExE?=
 =?utf-8?B?U3dZNkZadDJFQWgrR1NPN3RrWWtEWGVDckdlSWJvTENVNVVYaG5FVVlldDA5?=
 =?utf-8?B?R1VnZm5WWHVZNkRyckZUMmNRclRpbWNvTWUyd3l0dlczUHE2OGtXTlhTaDdo?=
 =?utf-8?B?SUdQeEVRMHpRR1lqbkt6Z21SUjFJWEw1clczTklpcC9Jem56NGxQUDZ3cFl4?=
 =?utf-8?B?VUk2QWhScjE5Q0UrRmxCU2VFQ2NmWTRTYmFGSGdtZmI5VnpPZUlpMHdQZUtY?=
 =?utf-8?B?Z1lkT0pNcHFwcHpMeTlDaHJRM0pVSHljRG1tVC81dDBXcEJ4YXI3U3ZaY05L?=
 =?utf-8?B?ai93R2Rqa0VRNngyUGlqRE9CYjcvRDgzU0ZjL1BJaWdWR2pnR2tRTDNtMGRj?=
 =?utf-8?B?cVNzbXhXR2FhcEoxWTdjWUdaaUdlWVl3bm02UGpPSndCenRiMU9tY2tjS0s3?=
 =?utf-8?B?Q0NYcmFjS3VBdGdQSVJGUVUxM3Fvc2tjTmVqUkZnZjlUMmpQeTZnYzhtWkNy?=
 =?utf-8?B?STQ2aXErTHJzeVhVSkdZNzFheTJoeGx3Wm85S2l4NmNwem96SXJkOHJFTGNX?=
 =?utf-8?B?YWhpTGJoc3hKQzJ5b3RHdVVPbEpNQTZJR2pLMGU5cHczc0NjT01IdWtmSmNF?=
 =?utf-8?B?VWZia1l5TmRCZ3dFY3FXZVBITG05T2VMSUE0TUs1aCs3RU03UzRMelJHTTIx?=
 =?utf-8?B?R29oZmVSbEFZdzZ0bWZhZTFabjBXaFRJVjZsTDIxakpOdG91TnYrRTVYM2Vs?=
 =?utf-8?B?Qkp4aWZIdlk1WEJmNHdhTFo0cDc0SjdYSWhpNGgxNzMvQ2tSNnRqSVAzTWJV?=
 =?utf-8?Q?TSk4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A500CE4B85DA7342849AF3682BA13361@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08cc546e-14fe-46b1-5ef5-08dc84431666
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 03:04:45.3173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rr3xJuWVj6EJCw6XwLz28qEj70Gn567q5ivaREp0ZkdmhE6mppMt8iPsAUQUZUTzN8jSB/rdraQEanmWHh5EVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280

T24gMjAyNC81LzMwIDIzOjUxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzAuMDUuMjAyNCAx
MzoxOSwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC81LzI5IDIwOjIyLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyOS4wNS4yMDI0IDEzOjEzLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjQvNS8yOSAxNToxMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAy
OS4wNS4yMDI0IDA4OjU2LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNC81LzI5
IDE0OjMxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMjkuMDUuMjAyNCAwNDo0MSwg
Q2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4+Pj4+Pj4gQnV0IEkgZm91bmQgaW4gZnVuY3Rpb24gaW5p
dF9pcnFfZGF0YToNCj4+Pj4+Pj4+ICAgICBmb3IgKCBpcnEgPSAwOyBpcnEgPCBucl9pcnFzX2dz
aTsgaXJxKysgKQ0KPj4+Pj4+Pj4gICAgIHsNCj4+Pj4+Pj4+ICAgICAgICAgaW50IHJjOw0KPj4+
Pj4+Pj4NCj4+Pj4+Pj4+ICAgICAgICAgZGVzYyA9IGlycV90b19kZXNjKGlycSk7DQo+Pj4+Pj4+
PiAgICAgICAgIGRlc2MtPmlycSA9IGlycTsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiAgICAgICAgIHJj
ID0gaW5pdF9vbmVfaXJxX2Rlc2MoZGVzYyk7DQo+Pj4+Pj4+PiAgICAgICAgIGlmICggcmMgKQ0K
Pj4+Pj4+Pj4gICAgICAgICAgICAgcmV0dXJuIHJjOw0KPj4+Pj4+Pj4gICAgIH0NCj4+Pj4+Pj4+
IERvZXMgaXQgbWVhbiB0aGF0IHdoZW4gaXJxIDwgbnJfaXJxc19nc2ksIHRoZSBnc2kgYW5kIGly
cSBpcyBhIDE6MSBtYXBwaW5nPw0KPj4+Pj4+Pg0KPj4+Pj4+PiBObywgYXMgZXhwbGFpbmVkIGJl
Zm9yZS4gSSBhbHNvIGRvbid0IHNlZSBob3cgeW91IHdvdWxkIGRlcml2ZSB0aGF0IGZyb20gdGhl
IGNvZGUgYWJvdmUuDQo+Pj4+Pj4gQmVjYXVzZSBoZXJlIHNldCBkZXNjLT5pcnEgPSBpcnEsIGFu
ZCBpdCBzZWVtcyB0aGVyZSBpcyBubyBvdGhlciBwbGFjZSB0byBjaGFuZ2UgdGhpcyBkZXNjLT5p
cnEsIHNvLCBnc2kgMSBpcyBjb25zaWRlcmVkIHRvIGlycSAxLg0KPj4+Pj4NCj4+Pj4+IFdoYXQg
YXJlIHlvdSB0YWtpbmcgdGhpcyBmcm9tPyBUaGUgbG9vcCBib3VuZCBpc24ndCBucl9nc2lzLCBh
bmQgdGhlIGl0ZXJhdGlvbg0KPj4+Pj4gdmFyaWFibGUgaXNuJ3QgaW4gR1NJIHNwYWNlIGVpdGhl
cjsgaXQncyBpbiBJUlEgbnVtYmVyaW5nIHNwYWNlLiBJbiB0aGlzIGxvb3ANCj4+Pj4+IHdlJ3Jl
IG1lcmVseSBsZXZlcmFnaW5nIHRoYXQgZXZlcnkgR1NJIGhhcyBhIGNvcnJlc3BvbmRpbmcgSVJR
Ow0KPj4+Pj4gdGhlcmUgYXJlIG5vIGFzc3VtcHRpb25zIG1hZGUgYWJvdXQgdGhlIG1hcHBpbmcg
YmV0d2VlbiB0aGUgdHdvLiBBZmFpY3MgYXQgbGVhc3QuDQo+Pj4+Pg0KPj4+Pj4+PiAibnJfaXJx
c19nc2kiIGRlc2NyaWJlcyB3aGF0IGl0cyBuYW1lIHNheXM6IFRoZSBudW1iZXIgb2YNCj4+Pj4+
Pj4gSVJRcyBtYXBwaW5nIHRvIGEgKF9zb21lXykgR1NJLiBUaGF0J3MgdG8gdGVsbCB0aGVtIGZy
b20gdGhlIG5vbi1HU0kgKGkuZS4NCj4+Pj4+Pj4gbWFpbmx5IE1TSSkgb25lcy4gVGhlcmUncyBu
byBpbXBsaWNhdGlvbiB3aGF0c29ldmVyIG9uIHRoZSBJUlEgPC0+IEdTSQ0KPj4+Pj4+PiBtYXBw
aW5nLg0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gV2hhdCdzIG1vcmUsIHdoZW4gdXNpbmcgUEhZU0RFVk9Q
X3NldHVwX2dzaSwgaXQgY2FsbHMgbXBfcmVnaXN0ZXJfZ3NpLA0KPj4+Pj4+Pj4gYW5kIGluIG1w
X3JlZ2lzdGVyX2dzaSwgaXQgdXNlcyAiIGRlc2MgPSBpcnFfdG9fZGVzYyhnc2kpOyAiIHRvIGdl
dCBpcnFfZGVzYyBkaXJlY3RseS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gV2hpY2ggbWF5IGJlIHdyb25n
LCB3aGlsZSB0aGF0IHdyb25nLW5lc3MgbWF5IG5vdCBoYXZlIGhpdCBhbnlvbmUgaW4NCj4+Pj4+
Pj4gcHJhY3RpY2UgKGZvciByZWFzb25zIHRoYXQgd291bGQgbmVlZCB3b3JraW5nIG91dCkuDQo+
Pj4+Pj4+DQo+Pj4+Pj4+PiBDb21iaW5pbmcgYWJvdmUsIGNhbiB3ZSBjb25zaWRlciAiZ3NpID09
IGlycSIgd2hlbiBpcnEgPCBucl9pcnFzX2dzaSA/DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEFnYWluIC0g
bm8uDQo+Pj4+Pj4gU2luY2UgeW91IGFyZSBjZXJ0YWluIHRoYXQgdGhleSBhcmUgbm90IGVxdWFs
LCBjb3VsZCB5b3UgdGVsbCBtZSB3aGVyZSBzaG93IHRoZXkgYXJlIG5vdCBlcXVhbCBvciB3aGVy
ZSBidWlsZCB0aGVpciBtYXBwaW5ncywNCj4+Pj4+PiBzbyB0aGF0IEkgY2FuIGtub3cgaG93IHRv
IGRvIGEgY29udmVyc2lvbiBnc2kgZnJvbSBpcnEuDQo+Pj4+Pg0KPj4+Pj4gSSBkaWQgcG9pbnQg
eW91IGF0IHRoZSBBQ1BJIEludGVycnVwdCBTb3VyY2UgT3ZlcnJpZGUgc3RydWN0dXJlIGJlZm9y
ZS4NCj4+Pj4+IFdlJ3JlIHBhcnNpbmcgdGhvc2UgaW4gYWNwaV9wYXJzZV9pbnRfc3JjX292cigp
LCB0byBnaXZlIHlvdSBhIHBsYWNlIHRvDQo+Pj4+PiBzdGFydCBnb2luZyBmcm9tLg0KPj4+PiBP
aCEgSSB0aGluayBJIGtub3cuDQo+Pj4+IElmIEkgd2FudCB0byB0cmFuc2Zvcm0gZ3NpIHRvIGly
cSwgSSBuZWVkIHRvIGRvIGJlbG93Og0KPj4+PiAJaW50IGlycSwgZW50cnksIGlvYXBpYywgcGlu
Ow0KPj4+Pg0KPj4+PiAJaW9hcGljID0gbXBfZmluZF9pb2FwaWMoZ3NpKTsNCj4+Pj4gCXBpbiA9
IGdzaSAtIG1wX2lvYXBpY19yb3V0aW5nW2lvYXBpY10uZ3NpX2Jhc2U7DQo+Pj4+IAllbnRyeSA9
IGZpbmRfaXJxX2VudHJ5KGlvYXBpYywgcGluLCBtcF9JTlQpOw0KPj4+PiAJaXJxID0gcGluXzJf
aXJxKGVudHJ5LCBpb2FwaWMsIHBpbik7DQo+Pj4+DQo+Pj4+IEFtIEkgcmlnaHQ/DQo+Pj4NCj4+
PiBUaGlzIGxvb2tzIHBsYXVzaWJsZSwgeWVzLg0KPj4gSSBkdW1wIGFsbCBtcGNfY29uZmlnX2lu
dHNyYyBvZiBhcnJheSBtcF9pcnFzLCBpdCBzaG93czoNCj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5
IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAwIHNyY2J1c2lycSAwIGRzdGFwaWMg
MzMgZHN0aXJxIDINCj4+IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJx
ZmxhZyAxNSBzcmNidXMgMCBzcmNidXNpcnEgOSBkc3RhcGljIDMzIGRzdGlycSA5DQo+PiAoWEVO
KSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNi
dXNpcnEgMSBkc3RhcGljIDMzIGRzdGlycSAxDQo+PiAoWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBl
IDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgMyBkc3RhcGljIDMzIGRz
dGlycSAzDQo+PiAoWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcg
MCBzcmNidXMgMCBzcmNidXNpcnEgNCBkc3RhcGljIDMzIGRzdGlycSA0DQo+PiAoWEVOKSBmaW5k
X2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEg
NSBkc3RhcGljIDMzIGRzdGlycSA1DQo+PiAoWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJx
dHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgNiBkc3RhcGljIDMzIGRzdGlycSA2
DQo+PiAoWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNi
dXMgMCBzcmNidXNpcnEgNyBkc3RhcGljIDMzIGRzdGlycSA3DQo+PiAoWEVOKSBmaW5kX2lycV9l
bnRyeSB0eXBlIDMgaXJxdHlwZSAwIGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgOCBkc3Rh
cGljIDMzIGRzdGlycSA4DQo+PiAoWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAw
IGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgMTAgZHN0YXBpYyAzMyBkc3RpcnEgMTANCj4+
IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAw
IHNyY2J1c2lycSAxMSBkc3RhcGljIDMzIGRzdGlycSAxMQ0KPj4gKFhFTikgZmluZF9pcnFfZW50
cnkgdHlwZSAzIGlycXR5cGUgMCBpcnFmbGFnIDAgc3JjYnVzIDAgc3JjYnVzaXJxIDEyIGRzdGFw
aWMgMzMgZHN0aXJxIDEyDQo+PiAoWEVOKSBmaW5kX2lycV9lbnRyeSB0eXBlIDMgaXJxdHlwZSAw
IGlycWZsYWcgMCBzcmNidXMgMCBzcmNidXNpcnEgMTMgZHN0YXBpYyAzMyBkc3RpcnEgMTMNCj4+
IChYRU4pIGZpbmRfaXJxX2VudHJ5IHR5cGUgMyBpcnF0eXBlIDAgaXJxZmxhZyAwIHNyY2J1cyAw
IHNyY2J1c2lycSAxNCBkc3RhcGljIDMzIGRzdGlycSAxNA0KPj4gKFhFTikgZmluZF9pcnFfZW50
cnkgdHlwZSAzIGlycXR5cGUgMCBpcnFmbGFnIDAgc3JjYnVzIDAgc3JjYnVzaXJxIDE1IGRzdGFw
aWMgMzMgZHN0aXJxIDE1DQo+Pg0KPj4gSXQgc2VlbXMgb25seSBMZWdhY3kgaXJxIGFuZCBnc2lb
MDoxNV0gaGFzIGEgbWFwcGluZyBpbiBtcF9pcnFzLg0KPj4gT3RoZXIgZ3NpIGNhbiBiZSBjb25z
aWRlcmVkIDE6MSBtYXBwaW5nIHdpdGggaXJxPyBPciBhcmUgdGhlcmUgb3RoZXIgcGxhY2VzIHJl
ZmxlY3QgdGhlIG1hcHBpbmcgYmV0d2VlbiBpcnEgYW5kIGdzaT8NCj4gDQo+IEl0IG1heSBiZSB1
bmNvbW1vbiB0byBoYXZlIG92ZXJyaWRlcyBmb3IgaGlnaGVyIEdTSXMsIGJ1dCBJIGRvbid0IHRo
aW5rIEFDUEkNCj4gZGlzYWxsb3dzIHRoYXQuDQpEbyB5b3Ugc3VnZ2VzdCBtZSB0byBhZGQgb3Zl
cnJpZGVzIGZvciBoaWdoZXIgR1NJcyBpbnRvIGFycmF5IG1wX2lycXM/DQoNCj4gDQo+IEphbg0K
DQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

