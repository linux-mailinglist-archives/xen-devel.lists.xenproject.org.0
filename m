Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8C0A77411
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 07:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933439.1335389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzUQm-0000W6-Nw; Tue, 01 Apr 2025 05:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933439.1335389; Tue, 01 Apr 2025 05:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzUQm-0000Ue-Jw; Tue, 01 Apr 2025 05:45:00 +0000
Received: by outflank-mailman (input) for mailman id 933439;
 Tue, 01 Apr 2025 05:44:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaGF=WT=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tzUQk-0000UO-6b
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 05:44:58 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:200a::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd08b3b-0ebc-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 07:44:55 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 05:44:51 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 05:44:50 +0000
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
X-Inumbo-ID: 6fd08b3b-0ebc-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzZcgZwzVmInpqVGQSCuANdfzOdjWftqICybpD0mURxvsr8N9Lm0QWz0KPrDC1rjU8DSZLEQdv7ubVPtN2LGWufxSKIOGKagYJn15oTpwGmLvv1vZIHi60UJR7ZTSiTgSW0vwVq5gkJul/Ll+LCxgSt1K5u6v6S0EPtm7sKZZ+cexSqlK2eekAHuqtY34r/OdQ+p0X84jfv93BHiJbtgepQix4lqGXsmo+BmRsUKJCt14WtDD8IhqCxqT4syKcZRDc9eP/j6xtUi4qix4nS51/enA5uGGBIE22efSj166GzZBU3eGuigASeLr6nh/v2ncXj/wP2FuTF+NANWM0me9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6n4B6Jc20zwFIFzFziY1e68w/DqumTRMr2U5rS0iJ1I=;
 b=DGNFlAwUTNvN3K5mjjNtNt52Em0DntVeXl0ltiinmZLWaASpBxLbget8P5jR9y7UZBsNgzCOBkcuPlAqNTgQxzuQi5ZmhUSNyyu9hSw4NYfwvQnAxNdrtVo+qOcFpZiF6gU6+QVeKTjiegvCEEXKFLryp/sCda5h8VomTftlOScF6CdPM9eezEWKVKyKjiwpZqFcKA/u0Hzrk+sa7JDcT566q+IWp0JeQJoLrCgllpq1rKyKqFYb9aPHP4/Cljl3oej3pYRUqitZaz3WAhh6hXsHFifec9W2AqjHlAk69r5ISuH4ssVpPjPziC1U7ZSw4uWfqUJ8UeyxVXviq71F+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6n4B6Jc20zwFIFzFziY1e68w/DqumTRMr2U5rS0iJ1I=;
 b=pDtDPv+tuMWHCayMIZV92CYtLmZsLnpAsDTXxL22tIGpbaooX8ySosjmgfvWl0JtTezrhCDgDA08d0Awam94Qt7i6Xg20yfOmjbrrsPXaXjDSkjOc0/Lsrn6yfjciB2N8amm0OaDitn53IP/ThokLomP/o3l91lsrdAH62crcfs=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Topic: [PATCH v3 03/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Index: AQHbjnNpEkvZJyYnHka7avkYmH1MUrOCfisAgAKWJuCAAEZ9gIAJF6sQ
Date: Tue, 1 Apr 2025 05:44:50 +0000
Message-ID:
 <DM4PR12MB845172547933E0618DC27EEDE1AC2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-4-Penny.Zheng@amd.com>
 <80963bfa-a19e-49a7-8de2-0d8508af450f@suse.com>
 <DM4PR12MB8451F07287ABC9BB683D7BD3E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
 <94160460-357a-4852-b56d-3d89febd0e68@suse.com>
In-Reply-To: <94160460-357a-4852-b56d-3d89febd0e68@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=905956bd-b65c-468d-948a-897500a09bf4;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-01T05:44:12Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BL1PR12MB5778:EE_
x-ms-office365-filtering-correlation-id: 64d83e2b-31e4-4771-6e1d-08dd70e05217
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Nk92RnRlTEE4Wm5rcFJqUitkV1hMMGNRbWRDVzgra2hBZUx6NnBDd29oeW1I?=
 =?utf-8?B?cHZuQTJsYTNWZ0Z6RGhqTlU3d295ZFF2ZzdiS2hTekJqaWNkQXRyVzI4R3ZQ?=
 =?utf-8?B?S0FreDAyRFpWSU9BZEV6cEZmZzZueVgwQXVlaFFRQTFNSmlGOWVUVGpEK1B6?=
 =?utf-8?B?ODRCWlZDTVAva0RJY2l6eit1aENlSm1xeWw3cytUY0dtaDl3dmpBTW9Pam1P?=
 =?utf-8?B?c2xMZktXSFFYWFEzS0xrdEl5T3d4aWJvREdUbjNRSVdiNndtQ1Zac0U4cEpv?=
 =?utf-8?B?cEU4bXV2T0w4cU9RNnVHbElmRFd5ZGJDbHpJZVRkU25HR1RKY1ZNWGUreksz?=
 =?utf-8?B?U0xYRVVBYmlNK09YS3NmdTZVcDc1ZmJtRFRzanV5RFpReU9EMFVhekMwZlNC?=
 =?utf-8?B?QzFSdjJLK1JxVlRPcVRXZmhUMWYvaGZNQW1sQWxRREhvUGtreHpDdlI0eTNp?=
 =?utf-8?B?S1dPZmpkUGsvYjl1U3ppR1dKYzhJdEwzNld3eXZFaVd0R3dJS0IwVWNQWGN6?=
 =?utf-8?B?M0lRSmlzWXVNck5SZE9NeUx3RzI2ZGovYTFRMWx1YWt1ZC9vRmRKWXpONUt1?=
 =?utf-8?B?YzJmMzgxUHh4NE5rQkNHcHNtR0NXU0MzQ29VNXdzQ254WUZxdEZ4dHVyMDNn?=
 =?utf-8?B?cDJiVzA5ODVsT1FiSk1relJtbHFyay9NQ3hLUFg0QVc2RVRJMlorVFdWcnh2?=
 =?utf-8?B?SXJPY1ZTcElTekZHK01kamRhZXVzNzZYVXNGQXpUQmN0bm1rZkFGZU1TYUdZ?=
 =?utf-8?B?eEVlRnpnUmlLY0Q4cDhTNEg1aGJ3d0Uwek80R3oyOGFJa0d0SjQ4Y3M4K2FK?=
 =?utf-8?B?Y0NVY3p6YWFQbEViclFVRm5YaE1CSDQzMCttRUE2ejduc1V0M3pwUUpsRXFW?=
 =?utf-8?B?YkxmTTJvc3lsVjYzMFRMWTMxZmVPZXcreVVacWFzVnBjd1RtdExUMHRtT1BV?=
 =?utf-8?B?ZjN6UDYrZWpqSVEyUVVQcGYzQXhHbTJVclhaODdhTDA4Rm02RmptRFdkcnJH?=
 =?utf-8?B?WlNidUpidEp4SVN5ak1OeiszSW9xQVZoTElIS2lTWnJZWHBNeWRMRDhpdmV1?=
 =?utf-8?B?eUFBb3BudzZ5eUJNMzE1dnJ2Y2l1NE0zaGFpRDF1MHlINTVQci9sTjJmajEv?=
 =?utf-8?B?TENYZHhQakFXeHFZNmNtUzRyVUtGZVc5MGNuM1pjTFpvMHNHWFZjYklTejdh?=
 =?utf-8?B?MUtjdE1KQkgxZUpGaUtFM0JpOHlESVJDVFZJVi9SRThCT0NFcUpXUW1OMXZh?=
 =?utf-8?B?QitPYk1EOGt6dEhRUnovWnJiejJkazdOa1RLamFqYnpTWkxZang2TG1LeCtL?=
 =?utf-8?B?TVR4THlHWS9zakpQT0dXMXdrM1pidkFCdVc1L1ZxOSt0SjVQMGgrWll5TzdZ?=
 =?utf-8?B?aXljRzhQeHVhTERzNTd2SW5MMWxEWGtoeWUwemRnSStaS1VOanNPRlB1Ym9Z?=
 =?utf-8?B?aEJwMjkwQjhjTUpiQ2o2a1ArY2lwdElVOGFFZmJEUlVGSnIxSkhRZUFNM21R?=
 =?utf-8?B?Y1dsdWRnd0FTYnJFNFlqT3pLbmdGR3lBTitvK0dYRE9NZlBoTkY5Ti9FN3Fs?=
 =?utf-8?B?ODh1a2lqbDliRGwzdmxXT2YwYVRnRUVBVXhwNVFLVlJxWG5weWZEOGVnK1lZ?=
 =?utf-8?B?NHgxYkk1NFV6VStxVWxJbXlKcVdMWk8rblMrWW8zMWhqWG5xZlFSblZaTkJZ?=
 =?utf-8?B?eTh6ZGRiUU5ZWFA0dW9MSjlXTWU5SnJyaWtOYTRPV3BlY2x5Qjc2VndEcC8v?=
 =?utf-8?B?b1VmSWdJS1l2TnA5cDN6Ni83bVR1WUNDVTVQNTZJUnhGcDA0VDFXeGYvakxx?=
 =?utf-8?B?Vm5naUdsSE1Bblgvb3Z1ZmtpTlZhNUVSNy9QMnhsVDhoTmhsNlcyeXJUS1Ba?=
 =?utf-8?B?UXZMWTNVVlJ5N0lmcXVHT1poWFRvTnBJQ1JtN3hrL2VhcWhab3V6eTllRUlT?=
 =?utf-8?Q?MH198OggIsth16q0ALLrH+6fEvKhjrFz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2lpeFM1T2NWajdWWVEvcUpXMVI4RjZud2ZPUldJMkFOUE1BcVIvMjVEdlp3?=
 =?utf-8?B?NDhVKy9kaFZhREU4ZGttem1OWTJOMXUvaEpOSGQwZk1GMzNoNStXejJOa2Nw?=
 =?utf-8?B?N0hMdkN5dDEwOUl1OHExWnFnL2RDc2Y4eXpsM1FlelIwcFUxQkY3QVlqamY5?=
 =?utf-8?B?dkRBTjJtTk5INDE4MHBpOE44SjFXQWMxaHY1bVFIN3YwYWZvc056ZXZTT2R2?=
 =?utf-8?B?aUpWWGt5UnBWZ21MZVlkeXo3QmdPUjZKN2F4Z3JDZERmZ2Q0ZXdZNy93NUhC?=
 =?utf-8?B?T29SOVJzNHdpdld1ejlFckQxSWtKVHRrZzh4VnkyeXhma0ZaUEtBOHB1YlpS?=
 =?utf-8?B?Und4V2RKQmxPZjNrUm5DZ0NUbTVQR081eklNeVpjYmVrd1IvZVc2VEtscmhP?=
 =?utf-8?B?V2kyN3UybmFsZXpkdm45K25ra21UbjIrZHFYSmFaL0pjZmdjTUo5QWYyTy9V?=
 =?utf-8?B?eFJQYzVPRU0vQklPR1BKZlBCc2JmdW40ZXlkK2xIK01ib1ZUWHJHeFdWbDFy?=
 =?utf-8?B?bVR6YVJPMU9reUMySWVlZlFIMjFRRnJjMitwNkJUaFA3UmpzL3RRU1VOM1VP?=
 =?utf-8?B?amdnb1RUcnEwMjZpbDBDV2t4UVh1US9qTGZEZWxBT05HcVZYWlF2T3I5bGIx?=
 =?utf-8?B?TmVxSkZWQjdGZndTbHdybTN1NVhacXlpazYzQjRSNG9hSlBrbUpoTW5YWUZ5?=
 =?utf-8?B?TEg0NVRkNmRNK1BWQjl5dW1pVUpGMVBoVnU3U05EV0o5U2Z6T2JJK2xucFU2?=
 =?utf-8?B?YVpVTTg0RjZkTFRaVnlHVUlQVUFMWGVFL3lCSGR2ek12bVBQb0IwQkRDMjN2?=
 =?utf-8?B?Ni9URUhsSHVYeXZSajQ5aHp1Um1pVkNQUFhCakhPU3paYTYwWngwQVFWT0dz?=
 =?utf-8?B?K1JrVTFPT3o0L29sOXhXbDNDNjJBN0REeG54SXQzMEMrQWVBZWF6U0JEVlJK?=
 =?utf-8?B?OGRaQ0VDMmppTk9oQ0YyNVRuaEJ1ZFJjblk1ZmJRcy9TQ1FGSXMrb3lXS2tQ?=
 =?utf-8?B?MjNSblBLMmNrclNyQkExRmx6b0plQ0RUSEFlbmt0bDIxQnlnR0pDbEdSTnFp?=
 =?utf-8?B?NWs0N1dFMSsvRC9YVzN6ak1ONkhTaEJHQ3I2aERqTEZmbGRkcGl0WC9xRmFa?=
 =?utf-8?B?M0daNlpqWWRWY0RiaFd3aFU5WHpVcmx3K052cldBS2k2MEN1Z2hGRmpHc1Z2?=
 =?utf-8?B?eGpRY04rUis4SnBGWHI3K056ajB2RTYyajYxYm5JYXBPbWVNektldUNzZFRX?=
 =?utf-8?B?azBTNnpZTW1MVUlGajBlZlV0c1g2alhQTTNTN2NyUmlZS1hTa0lVdmluRUU4?=
 =?utf-8?B?bVRLLzRWSmNPWXJVcW8zUnlpN1ZVSGpqbk5NaWdvbG5kRUVOd1JzOWRObmY3?=
 =?utf-8?B?bEdqU2FFZ1NCcFJWZTc1Wmg3OFhHc2tnSTlTTURHRDk1OElvVVNSTXpuUUJt?=
 =?utf-8?B?YTUvd1dnWEc5UmZ1ZTNDUFIxUEdiTUEzNHZOZ2tUMEpNVk52dHJya2VpeFhv?=
 =?utf-8?B?WE1HenYxS0lFNk0rYmdMblBRSGVYbk04ZSs1anRZNjNUV0g0Qzd1RjZXSnBZ?=
 =?utf-8?B?MGx3Zkd3UDQ3eWk5NWlLQjhMZEVoT1lpUldMamJRNDM1QUV0NFFTSkx6L2Z1?=
 =?utf-8?B?SFJMNHh2ZnhvbDMvaS9xNmU5Mk9OZXZTeDZrTkpCNytYTnhmZldKQWtWdTF1?=
 =?utf-8?B?dVFianBOSk9NLzI3WTlsWWtPMTJ0em9MdjhyQWEzR3BiTzhoZlBoSHZzMUo4?=
 =?utf-8?B?MElZSGZIOUR3Q0N5Q1pvaTFJd2ZvQjJpNFBvMmNWNWNxODlrVnZTcW9XOXlM?=
 =?utf-8?B?dWhtMzh1Ykd5ZGVoTlhrTU5peEhtbFhVMXE1ajBBSnRacDdRc01icDFZRDdW?=
 =?utf-8?B?QXBFMFdoVU1UdFhTeWVyWmEzODBQQ1EvWHA4TzVvOE9QZlFNSG9UU1dRK0Jo?=
 =?utf-8?B?a0lLYkZxMFpDZllJdXFqZEN2SGVFYk5zZmFoZHdzY1VKSjdvMWc3dTBRSG9k?=
 =?utf-8?B?Uzg5WVhYTTlDVmtBYUtvQzMvQWVCT0xndExuMGlHSUhxYm94a2tLWSs3WFZT?=
 =?utf-8?B?dXZkaGdkdHFhUE05Q3ZEb29KZ0NBaGJNN0s3ZTVOM3JHYjJ6SGVSWGhtUnBj?=
 =?utf-8?Q?0YP8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d83e2b-31e4-4771-6e1d-08dd70e05217
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 05:44:50.8211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXgUltHhUh2ixWsGwi0a3sVt4mpSrv1s3JHH2I6k2rxXyP1tPaLComoQt+8c9unVyuS0yFYqKWzdM6VB27oxTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778

W1B1YmxpY10NCg0KSGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2gg
MjYsIDIwMjUgNjo0MyBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29t
Pg0KPiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQHZhdGVzLnRlY2g+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlcg0KPiBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz47DQo+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYzIDAzLzE1XSB4ZW4vY3B1ZnJlcTogcmVmYWN0b3IgY21kbGluZSAiY3B1ZnJlcT14
eHgiDQo+DQo+IE9uIDI2LjAzLjIwMjUgMDg6MjAsIFBlbm55LCBaaGVuZyB3cm90ZToNCj4gPj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBNb25kYXksIE1hcmNoIDI0LCAyMDI1IDExOjAxIFBN
DQo+ID4+DQo+ID4+IE9uIDA2LjAzLjIwMjUgMDk6MzksIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
IE1heWJlIEkgbWlzLXVuZGVyc3Rvb2QgdGhlIHByZXZpb3VzIGNvbW1lbnQgeW91IHNhaWQgYGBg
DQo+ID4gICAgICAgICA+ICAgICAgICAgIGVsc2UgaWYgKCBJU19FTkFCTEVEKENPTkZJR19JTlRF
TCkgJiYgY2hvaWNlIDwgMCAmJg0KPiA+ICAgICAgICAgPiBgYGANCj4gPg0KPiA+ICAgICAgICAg
Rm9yIHRoZSByZXN0IG9mIHRoaXMsIEkgZ3Vlc3MgSSdkIHByZWZlciB0byBzZWUgdGhpcyBpbiBj
b250ZXh0LiBBbHNvIHdpdGgNCj4gPiAgICAgICAgIHJlZ2FyZCB0byB0aGUgaGVscGVyIGZ1bmN0
aW9uJ3MgbmFtZS4NCj4gPiBgYGANCj4gPiBJIHRob3VnaHQgeW91IHN1Z2dlc3RlZCB0byBpbnRy
b2R1Y2UgaGVscGVyIGZ1bmN0aW9uIHRvIHdyYXAgdGhlIGNvbmRpdGlvbmFsDQo+IGNvZGVzLi4u
DQo+ID4gT3IgbWF5IHlvdSB3ZXJlIHN1Z2dlc3Rpbmcgc29tZXRoaW5nIGxpa2U6DQo+ID4gYGBg
DQo+ID4gI2lmZGVmIENPTkZJR19JTlRFTA0KPiA+IGVsc2UgaWYgKCBjaG9pY2UgPCAwICYmICFj
bWRsaW5lX3N0cmNtcChzdHIsICJod3AiKSApIHsNCj4gPiAgICAgeGVuX3Byb2Nlc3Nvcl9wbWJp
dHMgfD0gWEVOX1BST0NFUw0KPiA+ICAgICAuLi4NCj4gPiB9DQo+ID4gI2VuZGlmDQo+ID4gYGBg
DQo+DQo+IFdhcyB0aGlzIHJlcGx5IG9mIHlvdXJzIG1pc3BsYWNlZD8gSXQgZG9lc24ndCBmaXQg
d2l0aCB0aGUgcGFydCBvZiBteSByZXBseSBpbiBjb250ZXh0DQo+IGFib3ZlLiBPciBtYXliZSBJ
J20gbm90IHVuZGVyc3RhbmRpbmcgd2hhdCB5b3UgbWVhbiB0byBzYXkuDQo+DQo+ID4+IEluIHRo
ZSBlbmQgSSdtIGFsc28gbm90IGVudGlyZWx5IGNvbnZpbmNlZCB0aGF0IHdlIG5lZWQgdGhlc2Ug
dHdvDQo+ID4+IGFsbW9zdCBpZGVudGljYWwgaGVscGVycyAod2l0aCBhIDNyZCBsaWtlbHkgYXBw
ZWFyaW5nIGluIGEgbGF0ZXIgcGF0Y2gpLg0KPg0KPiBJbnN0ZWFkIGl0IGZlZWxzIGFzIGlmIHRo
aXMgcmVzcG9uc2Ugb2YgeW91cnMgd2FzIHRvIHRoaXMgcGFydCBvZiBteSBjb21tZW50Lg0KPiBJ
bmRlZWQgaWlyYyBJIHdhcyBzdWdnZXN0aW5nIHRvIGludHJvZHVjZSBhIGhlbHBlciBmdW5jdGlv
bi4gTm90ZSwgaG93ZXZlciwgdGhlDQo+IHNpbmd1bGFyIGhlcmUgYXMgd2VsbCBhcyBpbiB5b3Vy
IHJlc3BvbnNlIGFib3ZlLg0KPg0KDQpDb3JyZWN0IGlmIEkgdW5kZXJzdG9vZCB3cm9uZ2x5LCB5
b3UgYXJlIHN1Z2dlc3RpbmcgdGhhdCB3ZSBzaGFsbCB1c2Ugb25lIHNpbmdsZSBoZWxwZXINCmZ1
bmN0aW9uIGhlcmUgdG8gY292ZXIgYWxsIHNjZW5hcmlvcywgbWF5YmUgYXMgZm9sbG93czoNCmBg
YA0KK3N0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9jcHVmcmVxX2NtZGxpbmUoY29uc3QgY2hhciAq
YXJnLCBjb25zdCBjaGFyICplbmQsDQorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBlbnVtIGNwdWZyZXFfeGVuX29wdCBvcHRpb24pDQorew0KKyAgICBpbnQgcmV0Ow0K
Kw0KKyAgICBpZiAoIGNwdWZyZXFfb3B0c19jb250YWluKG9wdGlvbikgKQ0KKyAgICB7DQorICAg
ICAgICBjb25zdCBjaGFyICpjcHVmcmVxX29wdHNfc3RyW10gPSB7ICJDUFVGUkVRX3hlbiIsICJD
UFVGUkVRX2h3cCIgfTsNCisNCisgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KKyAgICAg
ICAgICAgICAgICJEdXBsaWNhdGUgY3B1ZnJlcSBkcml2ZXIgb3B0aW9uOiAlcyIsDQorICAgICAg
ICAgICAgICAgY3B1ZnJlcV9vcHRzX3N0cltvcHRpb24gLSAxXSk7DQorICAgICAgICByZXR1cm4g
MDsNCisgICAgfQ0KKw0KKyAgICB4ZW5fcHJvY2Vzc29yX3BtYml0cyB8PSBYRU5fUFJPQ0VTU09S
X1BNX1BYOw0KKyAgICBjcHVmcmVxX2NvbnRyb2xsZXIgPSBGUkVRQ1RMX3hlbjsNCisgICAgY3B1
ZnJlcV94ZW5fb3B0c1tjcHVmcmVxX3hlbl9jbnQrK10gPSBvcHRpb247DQorICAgIHN3aXRjaCAo
IG9wdGlvbiApDQorICAgIHsNCisgICAgY2FzZSBDUFVGUkVRX2h3cDoNCisgICAgICAgIGlmICgg
YXJnWzBdICYmIGFyZ1sxXSApDQorICAgICAgICAgICAgcmV0ID0gaHdwX2NtZGxpbmVfcGFyc2Uo
YXJnICsgMSwgZW5kKTsNCisgICAgY2FzZSBDUFVGUkVRX3hlbjoNCisgICAgICAgIGlmICggYXJn
WzBdICYmIGFyZ1sxXSApDQorICAgICAgICAgICAgcmV0ID0gY3B1ZnJlcV9jbWRsaW5lX3BhcnNl
KGFyZyArIDEsIGVuZCk7DQorICAgIGRlZmF1bHQ6DQorICAgICAgICByZXQgPSAtRUlOVkFMOw0K
KyAgICB9DQorDQorICAgIHJldHVybiByZXQ7DQorfQ0KYGBgDQoNCj4gSmFuDQo=

