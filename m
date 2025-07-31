Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E51B16C11
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 08:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064847.1430181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhMoR-0004bq-Vj; Thu, 31 Jul 2025 06:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064847.1430181; Thu, 31 Jul 2025 06:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhMoR-0004Zi-SC; Thu, 31 Jul 2025 06:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1064847;
 Thu, 31 Jul 2025 06:30:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+CJ=2M=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uhMoQ-0004Zc-G7
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 06:30:46 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2415::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1efe048-6dd7-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 08:30:43 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Thu, 31 Jul
 2025 06:30:39 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 06:30:39 +0000
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
X-Inumbo-ID: e1efe048-6dd7-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbprJxE4BEkU117EVekRTX1Uwlh46gKE6n7NLScckrwvF7ubUq0qZOs/Y9rhr7ta2BkFIGMJDeXkhI+j1Ib0abp//laK8IkETUwlPe/v+Uc8oHfmkDAKvsA8OzzoFuUVnPlzbwOAGvs4alnjxANlHvqyAZ7Q32smdy3n89k9zJzZQRnWTiY9+SwwDHwuMb0Pf+afN5MTxgOpL5rfmCyGPT+hhX5gatoko9y+0lk7SECAqUtbZ+m2KcmOSOFwP4rSEHGGOl+F9gCmAa41fhquaEtK5PpDs2xtOgjBhPKl0/HCY6B3Q2OLaB1Yqs8pQVhtjtu6xrO6nJZWyLR/SPU+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/7Lagg1AZeOFDdMAnzrGCgfVt7CPO77img7Q1DbOh4=;
 b=wsybO21MiF/cOkjDN6dbqZ0V6QfhxFHz+XYQj9L54KiF0d2rdtsURtjPvzyJv1Wj01I6Us19IXxaJ448jhew4Ll9O7IAe2EquG96B/4DGsS1IyAd9HcqldChQyRnba8NMc11nfcXMKBM6E3YpO6M7YVgutqPTkeExs9sglV+eYI3ZEimQ537B9EIQXh1ZJkFDc4W8n8lksqSz6r/Qdkt3hhu1vpGRqg0L+RqCAPQOqOcpHsugkwtUa5uLEivKcsoZZPObHk4snbe0e/SVcRyXAfh3pW1qqOOHdV/H2swHliVIoEYAlowM86LKKGTOhN4ozFm+SFOjzWhzr7XvMahQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/7Lagg1AZeOFDdMAnzrGCgfVt7CPO77img7Q1DbOh4=;
 b=1buRpZ6Yx+vGv7AZQrzPbjlfGrpe6LFsY7Jd5RLazxh4QsH0Qnt9YxJ39W/YDossYl5lOi7EEuNB5eVtbxz+CI3qGr/i7aVhJXWbQQB58pABawxqjO/+MGPDVycJL/HNFlEhTljXDTNXAIxCfUsW2/KUOLiWJ8hs1qxq3oxrZUM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>
Subject: Re: [PATCH v9 4/8] vpci: Hide extended capability when it fails to
 initialize
Thread-Topic: [PATCH v9 4/8] vpci: Hide extended capability when it fails to
 initialize
Thread-Index: AQHb/30eZiKLAVednkGePt2TH9gIQ7RKb6eAgAAOrICAAAE3AIAB0IkA
Date: Thu, 31 Jul 2025 06:30:39 +0000
Message-ID:
 <BL1PR12MB5849CCA79D2236CAFCAD984FE727A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-5-Jiqian.Chen@amd.com>
 <8051d388-48f9-4878-8924-8e645f313238@suse.com>
 <562265e2a66b4eae06c4703a836e7d21@bugseng.com>
 <e14eaf58cc6da7f0a0e8d75f8b6a8733@bugseng.com>
In-Reply-To: <e14eaf58cc6da7f0a0e8d75f8b6a8733@bugseng.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8989.010)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB7874:EE_
x-ms-office365-filtering-correlation-id: 3727e9c7-6ccc-4b44-4841-08ddcffbc43b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TUxqcGl0UWN4cnluYy9KVWVvaFF2NlhIaE84OHFiYm0rbnJLMW15M05mU3Z1?=
 =?utf-8?B?emVFZzJtdnMwZC90VWQyMjJJS0gyRzhhdzQ3Qzc2Q0VGSzJtVzdqbkdtSktJ?=
 =?utf-8?B?K2tsVEk5VWNXTktCMStPV1EzUjR6cE5Ickw2RHQ0TWJBUDRPR2dSYjVROHNq?=
 =?utf-8?B?TWRldFVCOUp6M2ZuR2s0NTdwZFZncXhaN3AzdDVpeDVWN2l6dDAwVGtpMEpB?=
 =?utf-8?B?QjBUQkx2NDdMTHh5TG1TUFNTb25RRTZOaEIrZVpkK012YW0reHJqemtYUFdB?=
 =?utf-8?B?K2ZqdlEreEcvSVNxNEdpYWV0TUIxaDAzb2V1RVZWZ2c1a1pld1B5b1hrbUtq?=
 =?utf-8?B?Z1QxdzFUZ1NBbGs3Y0dERGFsYUtLUmJoUGwwUTIzbmMrVGdxa3NDcEFIRGEr?=
 =?utf-8?B?Uk9nU3RsYjY0ZjhZaFErMmZFTnk4S3ZQbzFVN0lSRFU1bVBTbzBzM21DVjAy?=
 =?utf-8?B?NnlIbHdJajBnYmdHNG9zc2VOV3lyZWpzVC9KNDFpQk5xR2NtZ2k2SlZlMDNK?=
 =?utf-8?B?WWRnaHYrQ1F3ai82d0hSOUZXTlBnamE1ZGRqQlJSeTlZZFNuNHdmdkw4V2M2?=
 =?utf-8?B?V2R6SDJwbDBVdnRBQXFqZHVhcitmV3N5OTl5WExUTE9uUThpcDF1RHo3VXpW?=
 =?utf-8?B?TTJmYUN5K0ZybE5oSWt6d2IwZmlybkhqOG43eXd3Mm5lRnhHNFJKWmd2dzNh?=
 =?utf-8?B?WUJvQW9DMWlxYVpNRElKbVlQdHd1V28yNmo5dkI2WGVsUjAyUWdvU0FQdmNl?=
 =?utf-8?B?QVdJcHpiMUJua0tMS2V0QUFoeDF5S1lhL2p6VTF3STRSSFhGQVplL0tiVEZ4?=
 =?utf-8?B?ektMZTFVQlZXR1hLMmY2L3lxQVFUNG9yOWlIQitGNjAwS1NGMHZ2QkUxamMr?=
 =?utf-8?B?MU1MZWk4dGRmN2V0RTNoMGIxcTkxd1JLbUpnN2tLRmZ0aXRMdE5iQStxTzd3?=
 =?utf-8?B?V2M2elVZRkVDVEg1WjExRmpqRXBSVFR6Yjg2NjRTeGhvS3A0RVJWU1VsTGRJ?=
 =?utf-8?B?S2hkRzQwSkR2L3k2TVdtVk1hUEo0WmpLeVRURXpFQS8zMHVyVWVjVkZnSUZK?=
 =?utf-8?B?UTRjTU96SHJIc3ZPcVNjcXV3Y29SanhCSUZIWTdEbDFxRWcrY1AveGhabGs2?=
 =?utf-8?B?akNMK1dTcGhXQTZXSnF3bTRjd01QTDZSY0NmcFZCVGMxYTBIYWFYVmJKTDVL?=
 =?utf-8?B?T05WQ2dkWnpnTHRKZE1COFRlK3g2dHBKK21ZZmZTdFl2RFBlODVPM0RhMWxr?=
 =?utf-8?B?bS90UklSY0FzMzNXdzBPQ3hBV3pJeEVrWDNUdUM2K2U4ampBYzhPVFQrVG9y?=
 =?utf-8?B?dlNzU2NEeGE2M2Q4MUlRVHYzdHY5a2JQYURxVzVlSGsrYTRrQ3NocnoxMVds?=
 =?utf-8?B?UWlocnpQLys4ZTJvbmhXR2kvaEZTN1hrRXZRZmZXNkhZRzJrK09yRENNR0ww?=
 =?utf-8?B?cXNxUTdhbEFkWGYxa1VnVWp6K1Q4d0RzR2dGemJnSWFvdFhQRFRrWXVyS1cx?=
 =?utf-8?B?Z2UzaCtJRjQ2Q1ZseGxHVXVTMmVQSjNSTUtLMVA2TXU1L1JkV28zUHdIckRD?=
 =?utf-8?B?cXIydGJTaEFnN2xQQ2FGZDNTSkFPQk1GTUVyTFZyNHd3QXl6cSt4OEFkUDdR?=
 =?utf-8?B?b2tnbXdzQ0twMFdSMW9jemlMUzljTHFTL0toWWtXbDBkb3I3ZTdieWkrM1By?=
 =?utf-8?B?Si9PbElmVnd3eStQNTJ0SWszb21RSTViZnMvRzdseXBhL3gzTmV2TWFLaVpm?=
 =?utf-8?B?RmZENGhqZzE3L3NnR2M1Y0trcmNpaW81MmNvajR5ZnY3UFJJcUM3N0g5QndD?=
 =?utf-8?B?RlNjdlBQb2t1QllmK25NRmcxMTBDZkJFUU42Rmc0anpveCtOazdVcXordVN1?=
 =?utf-8?B?YTI3QjZJUE1KQUthUkNOaEdOM0F1WFJKMWZiYUxCWndlTEpQditteURTdlB1?=
 =?utf-8?B?ckRJcVhzc3gwOFRueWFESm9zUVE4MmZqZ0g2QUh6VlNlM3VWaHNWSkZBY042?=
 =?utf-8?B?Z2VMd1dvQ3d3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkYwSzdRSnRGUGhQakIyWmFZSHk5cGhTRW8zdllxSHBJV1AzMExoSVVIODhR?=
 =?utf-8?B?Q3gzVjJraDUwRWt1WXN3ZWZPOHB4T0R3NlBGb0ZKbTNSOUUyeGErSTdiL1NF?=
 =?utf-8?B?aWtHY01xT256Y0hNWFpRak4rUklnamdzeHNrc3dWNzBpZlBFMVVkQzdSaUEy?=
 =?utf-8?B?dFVub2hRVGt5M1hhWHdLcEprc1E5YTN3Uk9VUWpVRDFWQ2JEWUVVV0NxNjJN?=
 =?utf-8?B?eFl4SW9udFE1MmJ0STdzcldlRlo3c0dTU0F4OHJSWS9lVHRQRXpIUzMzbDJL?=
 =?utf-8?B?MDBycThpclpyWncwME5lcVhlMGEycEhESkxNSjUzWVFMWHY5WTJodGcvRFBn?=
 =?utf-8?B?MHU4ZnZ0ejgxMWx2YVNFQUM3WloxM2huRlFJYzlyMUhoWFdMaUltWnFmUkRZ?=
 =?utf-8?B?eWlrUDBLQ3NVdjZVZXovTmh5eGZqR3B0SnBRVDVDaUVGUU9lTEtiNGZkQmVq?=
 =?utf-8?B?RC9XUWtXeVh1Q0JhSHFRNys0QU1NT2xRU0RTY2RVV3pUbnhZUmpuUDI1Y052?=
 =?utf-8?B?MUorQlUzbzVYZ3FvcEkzS1ZTbk1uOGE1REZTUDdzWEtsK2svWDF3WVRrM1BR?=
 =?utf-8?B?NkIyMW02STg3NFQ3MEtlSGN6WG5jR3ZqS2lLNmdGNlRmeVlTRHkxZTBRUjBa?=
 =?utf-8?B?OU1sYVdKT2RzQ1BRcm1ESW9pSmc5WXlGQ3FXNjVjdjE4UFFYV1hTRlZOM2No?=
 =?utf-8?B?N1FTR1FReEQ3b1FpaWVqcllnUEhIYkdhTERFN1JGbXBZMWlMRTAzN0t4bDdO?=
 =?utf-8?B?WmJTckpOVWk2Q25SNmpvTFZ0K3R3ckVVYmJRTXg3SXZlSTdFMW1ueDF4ZGQ2?=
 =?utf-8?B?dDJhNDA5OS9QM0Q1MWVGUmdNeTlsb3ZRUEUwOGtGS1p1dW8vYm9UVzRkaHZs?=
 =?utf-8?B?L3NzOFhoaHBVVFNQQ0xXZFJjT0JrZDdXR1Q2djdjbzdGWWQwczl3elMzTmM4?=
 =?utf-8?B?OVYzZGN0dVpjWi9BR1RCL3d1MloyYjhNNllXdU5TZ2VqallDYXk2Rk5IU3F1?=
 =?utf-8?B?QWRHWUU4eWdMWVJ4dUNvSkQyb1F3THpxcHpiZkwycHN1dGd3eUIrR1pJZ0cz?=
 =?utf-8?B?TzdiRUZYSG5iNmJ3SjNxZFpocHkzM3NyUGF1VHA5SnFKS1pTZFhYZlNvTk5E?=
 =?utf-8?B?cEpMVnprUFlrQUNNMHlKSUM0OGhaczZrdFNQa1Nva3g2VjRRSEIvNWh4dTlz?=
 =?utf-8?B?U1dRMldsa3E4QnBHa05pN2dMMFRIcTc0ODBkYUY0VlhYY2V0WE5HY1Q5ZUNH?=
 =?utf-8?B?b2hITjU3SStmai9naEVtcHRDM0o1eFA4V2pMUkk0MUhzYno3V3NIQUlva0dZ?=
 =?utf-8?B?OE9kQlZabXV4RXQ5SXRUSzRVTm1pSXVRWEhkejBsZzVYWi9ObloxblN0emFm?=
 =?utf-8?B?alpqdjJadG5jUmNNellUdzRrYVdRTUlxZjNLbTFLeE1ZKzJSMTltZFBHQVlp?=
 =?utf-8?B?WEZqU2ZlWktpekFyUHFsZUlFVDgxNVhLYVpwWkZ2R1VWL1NGRi9Uem9yVld6?=
 =?utf-8?B?RHl1MWlHR253MlMxQnNRQmxsQ3ZCeDg0dWhzT1ZxejZnRHFKZEZsLy9aK1o3?=
 =?utf-8?B?aEFucUh3TXN2cXRRUEJFS1RKOE1mOFRyaXV0VW5uQVdqOUEvWHNHMG9PSjB1?=
 =?utf-8?B?K3E4d2FRS1AvWmVSTEx6bG5pT2xDcU5obTJJcWhZSFh0TjB1d1E2b3FaZ1Zj?=
 =?utf-8?B?a3ByNzkyUHZHd2trUUpLNVBPaFRTMGQrMjZxTEtsbDVJMTB4UnNEeVFBaW00?=
 =?utf-8?B?SytUL2N1VVE3Q0RZcURCSm9qQzVNSDdNemttSGs0ZWZDZnNtdjF3YktFeG00?=
 =?utf-8?B?Z0JmVDBYRGNDUkM3OVpKeXFLRFdUWktHTWR2NmdZNFM5NWVMVlgrdXVYbWhi?=
 =?utf-8?B?eXNDWTJISEg4TnR5UHpLdXBqcTRCUHAzWVdKajVub1ErN1BNTUY3bDM0dEJO?=
 =?utf-8?B?L2N2V1l3TFFtZ3hxZzBsNE5kc1o5WDB4TStHV1lZWldYelNZZHBTejJMaTQ2?=
 =?utf-8?B?YmE4QzdRWmVEM3B4NWNzMm1saGUvR0orb08xTDI4NG9RSlQ5Q3IwaWErZjhm?=
 =?utf-8?B?dXdtTkN3eStDb29BOXJERDV3VUpobkljREpNTUNic0pvMlFsT2phTG1ybWZx?=
 =?utf-8?Q?VvFM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3249D7F86BF10241B1B1A533EB1129D7@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3727e9c7-6ccc-4b44-4841-08ddcffbc43b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 06:30:39.1862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUxFSdrR+yxErjWEdiLulhc9yec3SUnnO2/jGAoL1GZyhuRDk2+OqV7Yi8nASPYNWHz1EDsS5czhWjU2EHlgFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874

T24gMjAyNS83LzMwIDE4OjQ2LCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4gT24gMjAyNS0wNy0z
MCAxMjo0MiwgTmljb2xhIFZldHJpbmkgd3JvdGU6DQo+PiBPbiAyMDI1LTA3LTMwIDExOjUwLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAyOC4wNy4yMDI1IDA3OjAzLCBKaXFpYW4gQ2hlbiB3
cm90ZToNCj4+Pj4gK3N0YXRpYyBpbnQgdnBjaV9leHRfY2FwYWJpbGl0eV9oaWRlKA0KPj4+PiAr
wqDCoMKgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgY2FwKQ0KPj4+
PiArew0KPj4+PiArwqDCoMKgIGNvbnN0IHVuc2lnbmVkIGludCBvZmZzZXQgPSBwY2lfZmluZF9l
eHRfY2FwYWJpbGl0eShwZGV2LT5zYmRmLCBjYXApOw0KPj4+PiArwqDCoMKgIHN0cnVjdCB2cGNp
X3JlZ2lzdGVyICpyLCAqcHJldl9yOw0KPj4+PiArwqDCoMKgIHN0cnVjdCB2cGNpICp2cGNpID0g
cGRldi0+dnBjaTsNCj4+Pj4gK8KgwqDCoCB1aW50MzJfdCBoZWFkZXIsIHByZV9oZWFkZXI7DQo+
Pj4+ICsNCj4+Pj4gK8KgwqDCoCBpZiAoIG9mZnNldCA8IFBDSV9DRkdfU1BBQ0VfU0laRSApDQo+
Pj4+ICvCoMKgwqAgew0KPj4+PiArwqDCoMKgwqDCoMKgwqAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+Pj4gK8KgwqDCoCB9DQo+Pj4+ICsN
Cj4+Pj4gK8KgwqDCoCBzcGluX2xvY2soJnZwY2ktPmxvY2spOw0KPj4+PiArwqDCoMKgIHIgPSB2
cGNpX2dldF9yZWdpc3Rlcih2cGNpLCBvZmZzZXQsIDQpOw0KPj4+PiArwqDCoMKgIGlmICggIXIg
KQ0KPj4+PiArwqDCoMKgIHsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNwaW5fdW5sb2NrKCZ2cGNp
LT5sb2NrKTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOw0KPj4+PiArwqDC
oMKgIH0NCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGhlYWRlciA9ICh1aW50MzJfdCkodWludHB0cl90
KXItPnByaXZhdGU7DQo+Pj4+ICvCoMKgwqAgaWYgKCBvZmZzZXQgPT0gUENJX0NGR19TUEFDRV9T
SVpFICkNCj4+Pj4gK8KgwqDCoCB7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIFBDSV9FWFRf
Q0FQX05FWFQoaGVhZGVyKSA8PSBQQ0lfQ0ZHX1NQQUNFX1NJWkUgKQ0KPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByLT5wcml2YXRlID0gKHZvaWQgKikodWludHB0cl90KTA7DQo+Pj4NCj4+
PiBFY2xhaXIgcmVnYXJkcyB0aGlzIGEgTWlzcmEgcnVsZSAxMS45IHZpb2xhdGlvbi4gRWxzZXdo
ZXJlIHdlIHVzZSAodm9pZCAqKTAsDQo+Pj4gd2hpY2ggSSB0aGVuIHdvdWxkIGNvbmNsdWRlIGlz
ICJmaW5lIi4gQnV0IEkgY2FuJ3Qgc2F5IHdoeSB0aGF0IGlzLiBDYy1pbmcNCj4+PiBCdWdzZW5n
IGZvciBhIHBvc3NpYmxlIGV4cGxhbmF0aW9uLg0KPj4+DQo+Pg0KPj4gSGkgSmFuLA0KPj4NCj4+
IEkgb25seSBzZWUNCj4+DQo+PiAwfCQgZ2l0IGdyZXAgIih2b2lkXCopMCINCj4+IHhlbi9pbmNs
dWRlL3hlbi90eXBlcy5oOiNkZWZpbmUgTlVMTCAoKHZvaWQqKTApDQo+Pg0KPj4gd2hpY2ggaXMg
ZmluZSBmb3IgUjExLjkgb2YgY291cnNlLiBBcyBBbmRyZXcgbm90ZWQsIEkgZG9uJ3Qgc2VlIHRo
ZSBuZWVkIGZvciB0aGUgdXNlIG9mIHVpbnRwdHJfdCBlaXRoZXIuDQo+IA0KPiBPaCwgSSBtaXNz
ZWQgZm9ybXMgdXNpbmcgYSBzcGFjZSBiZWZvcmUgdGhlIHBvaW50ZXIuIEluIGFueSBjYXNlLCBm
cm9tIHRoZSBydWxlJ3MgQW1wbGlmaWNhdGlvbjogIk5vdGU6IGEgbnVsbCBwb2ludGVyIGNvbnN0
YW50IG9mIHRoZSBmb3JtICh2b2lkICopMCBpcyBwZXJtaXR0ZWQsIHdoZXRoZXIgb3Igbm90IGl0
IHdhcyBleHBhbmRlZCBmcm9tIE5VTEwuIg0KPiANCg0KVGhhbmsgeW91IGZvciBoZWxwaW5nIHRv
IHNvbHZlIHRoaXMgcHJvYmxlbS4NClRoYW5rIHlvdSBib3RoIHZlcnkgbXVjaCENCg0KLS0gDQpC
ZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

