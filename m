Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB5CB19D5F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 10:10:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068897.1432759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqGZ-0000nC-9p; Mon, 04 Aug 2025 08:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068897.1432759; Mon, 04 Aug 2025 08:09:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiqGZ-0000kK-6G; Mon, 04 Aug 2025 08:09:55 +0000
Received: by outflank-mailman (input) for mailman id 1068897;
 Mon, 04 Aug 2025 08:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owTc=2Q=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiqGX-0000kE-B0
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 08:09:53 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20604.outbound.protection.outlook.com
 [2a01:111:f403:2409::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6408394a-710a-11f0-a321-13f23c93f187;
 Mon, 04 Aug 2025 10:09:50 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 08:09:45 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 08:09:45 +0000
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
X-Inumbo-ID: 6408394a-710a-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwC05vCN1asvQ91pqabdpS4EU7i6nJhr6DWuDW0tW1hRBJleU4WClPsofxkWZeM43n53IcYV3nzvE4S81F8/7n/fky35xmy1Gd0YnV3Cq5Bab/xDS9LRAGXGWMtJn0bFsRGuCNXt1LvOuCDbwzqlXzhp5BwMgi6ufrFYuHxbfa6saphJ0iyUK90aAxJt4wHjr8angzh6XAPr/IVU1N5ljZJerefvPWGOqfa+TCPSQL6EYc/A6KZycepWlj7w2war8PMfCW5ps56ncptfIj1/qQgmVMwc2f/V5+AMXiHXUtl1Fo9QkgkImOs/exf8fC2SKPSf7G7ll2qnBd+Wfj+Pfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EONlCrXEu+vl1MizfSkbUN73vCDvFetjTYiRA8ZlA5w=;
 b=CCgG1CiTuGW2FZ+DWVnWnY/nRKGb5zL80+W+Q4IB6Ahz+48+cd9G3BHFBmQ08ofWhuBzfddEtSj5DXEZqbLi5BxPgZF1pG2iwdKBceQbBLq1QHIY4+dLnRWtVFfBajNdKpmMPsr3YdQvmQGMq6YPvPCDp/RAQMvd+BrHzI7UqNMzMP/NoGqpxL3yUkFwkoilTGFSplddnVytTs7Bt3mNAGn+y9XL0uj3FwlOgdgSO5oeRX6YHL9np2ygw3dsHTzXCgKIq0b9jJq9/G2hCghogimzCExNwVJKahldc1qnDVwJVcE0himOflEFt9M81zkrinsiRLN1czUCARc2zsQk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EONlCrXEu+vl1MizfSkbUN73vCDvFetjTYiRA8ZlA5w=;
 b=qnIsEC8/fRwNr3OLBW2IyeCMieo+yaIyY4yH6fJt2vdtqlpyF//dzMefgjQXYp6MVRVqpUP7fGg6xTr+YzCVK2/mCX95b/RMS/GanCZxLqVNooo909AvSW/PWHarQSlni+EAKYKz1REgH4F9Fyg3orqa61k00RpCtNQ5Q2kHQEk=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 11/19] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline and amd-cppc driver
Thread-Topic: [PATCH v6 11/19] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline and amd-cppc driver
Thread-Index: AQHb8hcjpcuBQZ3yA0mXIz4rkVtX0bQ08RmAgB1Oq3A=
Date: Mon, 4 Aug 2025 08:09:44 +0000
Message-ID:
 <DM4PR12MB8451FD535917A84B3054C93CE123A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-12-Penny.Zheng@amd.com>
 <a11aa19e-a151-469b-a58d-bc31fc4d7e01@suse.com>
In-Reply-To: <a11aa19e-a151-469b-a58d-bc31fc4d7e01@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-04T08:09:36.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB8825:EE_
x-ms-office365-filtering-correlation-id: f709049a-8db9-4b3a-8833-08ddd32e45da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y0l3ZGNGaVpyTVdxRDNwemg3dU1nZFp6VVNHWURNVzJPQjFzM0NrTVdFWGxF?=
 =?utf-8?B?dTF6TE53WkoyUU1udzFkVTFIQjJwU0FzUzBoZEtETy9VR1lZbFJ3ODZ3ZHNU?=
 =?utf-8?B?UDdCK2lVWG1hMXE5d1cvdkVYQXZvaFcxelRJOGs4SjY5NUZEMjBvOGJwZVBB?=
 =?utf-8?B?a0pQbElYNmNYck1wTXJBZlJ5SDRVdXV3MVhHbm10eFU4OUFZOVJ4dFVVREs3?=
 =?utf-8?B?MjRtWVg5d1FMZGZrbU0vTXExYWpPWFZMUVkrQmpDS1U5L0JjZzdWU2JTNEov?=
 =?utf-8?B?NVJqSFhNNzV2amxSSmJRaUNxayt3L3hxcTJzdVB2ZjNZbHdhalNHbHlRZHRG?=
 =?utf-8?B?YzdVQldrdUVvMVd1NE1Eb3RlckEzM2ZjbklEOHRoblgzOTMrQlRjTTFOY01S?=
 =?utf-8?B?bm5jWDJZenRCSnZvL2RMdVhnNzNHNytscFRDemdsd3NsWU5EdkVHaU5rTlpw?=
 =?utf-8?B?bElhM1JLclY0RFlzbXV5bEFzSUM1ZHBrc2NJNWVSQWNzTGQ3WW1LTmRMRGxT?=
 =?utf-8?B?aTYwNThkL05HY3VKd2VENFUxUG5SV2JjSGUvMlg4Qi9DTzVzTTF5N1JmalRm?=
 =?utf-8?B?MU8wQmxua2NLdzRYZ3ozUm5MWTh0dHl2L05Jc1dHUnFlTDJSRUN2cFNnSGt2?=
 =?utf-8?B?a09mKzRLME5EYUhZeUVNZUt2Wm5Dd3RJTnBvQWRkOEF0MEpWYjdvdFdnNTBU?=
 =?utf-8?B?Q0VpNGdqMEJtNkt1RDFrNUpsVjBtVWU2U3NMWWw4NmRrWWxmOHdZc2cvS25O?=
 =?utf-8?B?TnhhcDlyK3E1WEg3bXR0TVNXbVVXeTNQZjV0YUZicTNYS0ZKOUxFd2cveVdP?=
 =?utf-8?B?YzFpZFB6akFscDcwbm40Ym9hbWN1cGxXMFRqUU4wbTBqOVZQcTJGOFAzNXZ1?=
 =?utf-8?B?WklyTlVYVXRzSlZvTC90em9XUFl6bkNnTVVpemdVYTNSd0U5eVNTNG92ZnAr?=
 =?utf-8?B?bEJjdFVSdEUwSkFQUjhqeFJvdXhuWkpGS0VHL2FBVTVWUXVFTHIwcFg5ZE9v?=
 =?utf-8?B?Mnc2dUlQNTVJd0tmZ0Znek8ySktwMnByVDNKL0VBWDZLNHl4bHZLTlNIUjUr?=
 =?utf-8?B?UE5zRm5RSzZpTXFUOEpGb2FYYVJkeWlBRGZIKzlwQWNSNEpYMUozeGNlRzFI?=
 =?utf-8?B?alRsRi9KVTI3dXc2ZkVDYWVjcFZQRktDN2d0dWkvVTk5REl0L05jcmtIT0pN?=
 =?utf-8?B?TDByUFBVRXA0eGYrOHFWeDlBNW9XUzdxSjN1NU1sOEV6U3JjR2tkZjlEZHZK?=
 =?utf-8?B?enU0bHRCcEt4d2pwcVZDUWFWWGVVV3lleU9vT1daNHpnZ2ptNFJqMjVGK1VQ?=
 =?utf-8?B?eVdlcTg3RnpFSENpekdVc1FQQzU2SE03WXY1K2FpWnUrcm9lSWJWY081NHQr?=
 =?utf-8?B?VWZyU1VOT1U3dHp6Y0ZMY29JRkdES1QzaUxPS2cwODVLUFpiT00yOHljSVhy?=
 =?utf-8?B?bUpJU0Rqb3ZDeUVIck1KcnYzaVc4clFmYUdVSm1zRmlyem5PUnFQd0JsVDNW?=
 =?utf-8?B?eTFobVc0NzEveDZZVVk1MHNSSUFqQWZza252UU9pc3pialJBOVRacDJlV0My?=
 =?utf-8?B?VVhTVmtOT3lHc0g2RlU3L0xsYmJRNDN2UUdwNDZFWTBJMTV4bHoyMmY4SGZB?=
 =?utf-8?B?TFhTbktoeHZUNlJnRFRWdHQ3dnBRVytwL0p0ZTlNa0I3cDJzakdNMjZIRmVK?=
 =?utf-8?B?NjgxZjB1M2ZMWXR2SVNLdXR1U1Z0YmJpSVMzck5hTDBzMmF6a1FjWFdkUG51?=
 =?utf-8?B?dmpXYVFiTmFHTGtDTWRTUWpnem9qWEVGclVta1JUY2NVT1FUREVFcXJiK0VN?=
 =?utf-8?B?T29OSmxoampXaEhXRmZZcGtNOTJNT1phUkxMSmIxV1BCNElhWUIwV2dFUERZ?=
 =?utf-8?B?Uy8wQXRHakF3VCtBUFM4QTNvTzdDZEo4TnVNbDdwQW5HQldZUVkwRnVXWXU1?=
 =?utf-8?B?UGkwRVY4VjdFL052dUFndjZFZXVnVGpEanE0bGl3TW80dWZwVitLWWsrMUdh?=
 =?utf-8?Q?lbJroeALk4DI25PqqbGvcBkXS69UW4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?em5nVGZqckRSMFk3aXA5enlnN0gzRU1jWkxNNkdNejY4aGxhTWpQQXVBdmtw?=
 =?utf-8?B?eWUxUlRZRndxMWZXdTIvSXRMdU1qOTVSQ0RQR1pQNTQzbUxxWXV0Q3hSK0Nr?=
 =?utf-8?B?Qk9LMGZZM00zMnFqUE0xY2gvQjFXdVhSUXRNa2ZocG5waHN6OGFtZFBVVTlx?=
 =?utf-8?B?QzNJWDl1czQrZjc2R2hUMXMyUUdpNytDTjRhRStwZDB3L2lrNWpPYzN2cDl6?=
 =?utf-8?B?bzgvOUFMcFJsUE1xUmtZcnB3SnNoTU1Yc1BDbFFxbXQ5bGNPdjV0ZTFRdXFy?=
 =?utf-8?B?VzZVL2F1akR0UXlnN2liWitiSFpDSHFHM2RRK1ZsRjdoWDdmQ0FnZmcwVzVF?=
 =?utf-8?B?RVlMb1FDYmR0dzlOSTFYNHMxQ0dVZGFvamJGUWh5aHA0dHIxZG0rYWJtUUVX?=
 =?utf-8?B?eTFLR3NQNW91ci8va1dnYnBURm43aHJ1d25uZ2lPQUl0eWZMWVl5QnB1dENF?=
 =?utf-8?B?OGhpUXZMMEZodGRRc0ltdUMrM0poSnBwS2U1Rk5pdG10ME5aQmJ5MjFFSTQ4?=
 =?utf-8?B?VXJXZnpFZXJROU9pVmFEVHh6NzV3UEQvUzllQXhHeUhsdXp0QXNLWGd1MlIx?=
 =?utf-8?B?ZGJWMkZjeGQybzY0OVhZbHBZcGFoaFNDZzNGZ1VzSzBuYlRob1JScExpQWh3?=
 =?utf-8?B?bGlFbFA3Ymdvd2pZWWNBSkFrTE80T0tKL0J4cWYyajRPdk1PUkdhMy9FTGlM?=
 =?utf-8?B?RzM0VTFKc1ZiVGFzbWsrbmtTbVN5dTBlUTJFcmJoakdoWXVvUjJFM0RoZnJo?=
 =?utf-8?B?aFVPd2EzWmxaV1pxcjhmdTNZV2dBYXZFY1JUYW9Edlp6clc4WlZPNGx5NXE3?=
 =?utf-8?B?dmtjWXdnTTNnWUs1TTM1NjlKSzBhVUNtWTIrb1I1YnMwQXN5OGhFMmJTaU10?=
 =?utf-8?B?SkZlOUhNWnJxM3hteWowaXhIYzM1c05NU3NONTVPTVhkaWRVdlcwMGtBa2c4?=
 =?utf-8?B?akNVY2FSZXVRWmFMRG1qNzRZeitLenlTY05qSU0vZXloM1kreFFvSUxsV0tt?=
 =?utf-8?B?V2luVUgyd3V6UVp6c3BiUkxBZEkrY3lDalQ1RmNEMVBVVzErTS8xQjJ4Nmgx?=
 =?utf-8?B?K2d6ckUyWDBXcjN5UEVuTDJWdXZzTVNrSVNwTzYra0MwWDRLZXBaOWI2OVBR?=
 =?utf-8?B?TGZlZzg1cWNTS1VKMGtrem04a0F5Nk94d3ZPQTRCNHNVTGdyaG9Nd0ZGK2sv?=
 =?utf-8?B?MTB5R2xFbWpYRWVNc0NlREZ6d21BL0YxMDIyQzUzVGRjUHhrUlV6cWFVVWNL?=
 =?utf-8?B?MTFVb1MwNy9BWXQyOTlYd2wveHo4Qk1CaUh0Z2luZUJmVE85U1UycVRGcXYw?=
 =?utf-8?B?bzY1NDdWS2xFZ3o4TlIzemE5aS9wWXM3NGZyUVk5L3M0REZOYnNCWlNobDJM?=
 =?utf-8?B?Qjk3S0VXT0NIWGhpL2xZSjJQQldTWmxwVDhNU2ZGZ21vYnlpOHYvWGp6eXVx?=
 =?utf-8?B?M09ZejVmUUxVVVcrMTdRbzdPUmlub2k3cURhV2pSVkJZSFNaUm9NdjVvWHQ3?=
 =?utf-8?B?RC8zbERuVVRSbklVZXlROTBWaDZneEoyeXZITEthczBEeXlFQ21WSDZqaG1t?=
 =?utf-8?B?UGtXTm9FTXNlZzNCS1RCRW9WRDVOeS9ISFVwTjVzb0hybGhiSEVxRFdRQ29E?=
 =?utf-8?B?eUUyT3lFSDl0bi9FTUFsblVDcnJVOHFxTkdJVVZZRHFUM29NcEF0OWpNcGFp?=
 =?utf-8?B?aW94VWRMcFNYWlg5N2hSQWd3eS8zL1pDdTVNcHFwMHpWSU14T3ZaRW5MNnZu?=
 =?utf-8?B?OUNRWllZZWhEdFJkZDVLUE5PZjBzVUNWN0VBTUU4eGFyZkg4U0pLTWExQmc4?=
 =?utf-8?B?RzFZS3FJMWVWWDhWbEVzdWp5Skx5UXJtUVVwcjJCcUxUQ3VITGtHMHRFblJk?=
 =?utf-8?B?MEltWTE5SWF1NVFMRDNMNzk0ZTh6RHZPcDBETUdkakRCdk5JU2RsTVZXTXRH?=
 =?utf-8?B?QjZVT0ZIdXJZN0w4Sytnc2pQanF4bFdDNEI1VHJHcEV0WFdIWUNaN1NFUlR3?=
 =?utf-8?B?b28xajNBRTkyK3FmTXllaTRSUGVraE1uUEJ4dUZXM2lZRDBwSVlOYXNtN3Nh?=
 =?utf-8?B?T0VDQlViZDZFNVFUbFFUU0Exc1VuZUFuQzYwSjZ4LzFJL0puSUtMaThrYTdJ?=
 =?utf-8?Q?My48=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f709049a-8db9-4b3a-8833-08ddd32e45da
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 08:09:45.0159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mYrmTZmy2Gq9fjclZQu8HGVKq4o/syegOJ447R8fYi9J6HfRxh3Rj4X7YxVlQkv+S3qVOqa124DVuJ8fZWTLag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDE3LCAyMDI1
IDEyOjAwIEFNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+IENj
OiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0
ZXMudGVjaD47DQo+IE9yemVsLCBNaWNoYWwgPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
eGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY2IDExLzE5XSB4ZW4veDg2OiBpbnRyb2R1Y2UgImNwdWZyZXE9YW1kLWNwcGMiIHhlbiBjbWRs
aW5lDQo+IGFuZCBhbWQtY3BwYyBkcml2ZXINCj4NCj4gT24gMTEuMDcuMjAyNSAwNTo1MCwgUGVu
bnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvY3B1ZnJlcS9jcHVm
cmVxLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVmcmVxL2NwdWZyZXEuYw0KPiA+
IEBAIC0xMjgsMTIgKzEyOCwxNCBAQCBzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjaw0KPiA+IGNw
dWZyZXFfZHJpdmVyX2luaXQodm9pZCkNCj4gPg0KPiA+ICAgICAgaWYgKCBjcHVmcmVxX2NvbnRy
b2xsZXIgPT0gRlJFUUNUTF94ZW4gKQ0KPiA+ICAgICAgew0KPiA+ICsgICAgICAgIHVuc2lnbmVk
IGludCBpID0gMDsNCj4NCj4gUG9pbnRsZXNzIGluaXRpYWxpemVyOyBib3RoIGZvcigpIGxvb3Bz
IHNldCBpIHRvIDAuIEJ1dCBhbHNvIHNlZSBmdXJ0aGVyIGRvd24uDQo+DQo+ID4gQEAgLTE1Nyw5
ICsxNjQsNzAgQEAgc3RhdGljIGludCBfX2luaXQgY2ZfY2hlY2sNCj4gPiBjcHVmcmVxX2RyaXZl
cl9pbml0KHZvaWQpDQo+ID4NCj4gPiAgICAgICAgICBjYXNlIFg4Nl9WRU5ET1JfQU1EOg0KPiA+
ICAgICAgICAgIGNhc2UgWDg2X1ZFTkRPUl9IWUdPTjoNCj4gPiAtICAgICAgICAgICAgcmV0ID0g
SVNfRU5BQkxFRChDT05GSUdfQU1EKSA/IHBvd2Vybm93X3JlZ2lzdGVyX2RyaXZlcigpIDogLQ0K
PiBFTk9ERVY7DQo+ID4gKyAgICAgICAgICAgIGlmICggIUlTX0VOQUJMRUQoQ09ORklHX0FNRCkg
KQ0KPiA+ICsgICAgICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICByZXQgPSAtRU5PREVW
Ow0KPiA+ICsgICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gKyAgICAgICAgICAgIH0NCj4gPiAr
ICAgICAgICAgICAgcmV0ID0gLUVOT0VOVDsNCj4NCj4gVGhlIGNvZGUgc3RydWN0dXJlIGlzIHN1
ZmZpY2llbnRseSBkaWZmZXJlbnQgZnJvbSB0aGUgSW50ZWwgY291bnRlcnBhcnQgZm9yIHRoaXMg
dG8NCj4gcGVyaGFwcyBiZXR0ZXIgbW92ZSAuLi4NCj4NCj4gPiArICAgICAgICAgICAgZm9yICgg
aSA9IDA7IGkgPCBjcHVmcmVxX3hlbl9jbnQ7IGkrKyApDQo+ID4gKyAgICAgICAgICAgIHsNCj4g
PiArICAgICAgICAgICAgICAgIHN3aXRjaCAoIGNwdWZyZXFfeGVuX29wdHNbaV0gKQ0KPiA+ICsg
ICAgICAgICAgICAgICAgew0KPiA+ICsgICAgICAgICAgICAgICAgY2FzZSBDUFVGUkVRX3hlbjoN
Cj4gPiArICAgICAgICAgICAgICAgICAgICByZXQgPSBwb3dlcm5vd19yZWdpc3Rlcl9kcml2ZXIo
KTsNCj4gPiArICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiArDQo+ID4gKyAgICAgICAg
ICAgICAgICBjYXNlIENQVUZSRVFfYW1kX2NwcGM6DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
cmV0ID0gYW1kX2NwcGNfcmVnaXN0ZXJfZHJpdmVyKCk7DQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAgY2FzZSBDUFVGUkVRX25vbmU6
DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgcmV0ID0gMDsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICBicmVhazsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICBkZWZhdWx0Og0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORw0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiVW5zdXBwb3J0ZWQgY3B1ZnJlcSBkcml2ZXIgZm9yIHZlbmRvciBB
TUQgb3IgSHlnb25cbiIpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPg0KPiAu
Li4gaGVyZS4NCj4NCg0KQXJlIHdlIHN1Z2dlc3RpbmcgbW92aW5nDQoiDQogICAgICAgIGlmICgg
IUlTX0VOQUJMRUQoQ09ORklHX0FNRCkgKQ0KICAgICAgICB7DQogICAgICAgICAgICAgICAgcmV0
ID0gLUVOT0RFVjsNCiAgICAgICAgICAgICAgICBicmVhazsNCiAgICAgICAgfQ0KIiBoZXJlPyBJ
biB3aGljaCBjYXNlLCBXaGVuIENPTkZJR19BTUQ9biBhbmQgdXNlcnMgZG9lc24ndCBwcm92aWRl
ICJjcHVmcmVxPXh4eCIsIHdlIHdpbGwgaGF2ZSBjcHVmcmVxX3hlbl9jbnQgaW5pdGlhbGl6ZWQg
YXMgMSBhbmQgY3B1ZnJlcV94ZW5fb3B0c1swXSA9IENQVUZSRVFfeGVuLiBwb3dlcm5vd19yZWdp
c3Rlcl9kcml2ZXIoKSBoZW5jZSBnZXRzIGludm9rZWQuIFRoZSB0aGluZyBpcyB0aGF0IHdlIGRv
bid0IGhhdmUgc3R1YiBmb3IgaXQgYW5kIGl0IGlzIGNvbXBpbGVkIHVuZGVyIENPTkZJR19BTUQN
Ckkgc3VnZ2VzdCB0byBjaGFuZ2UgdG8gdXNlICNpZmRlZiBDT05GSUdfQU1EIGNvZGUgd3JhcHBp
bmcNCg0KPiA+ICsgICAgICAgICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAg
IGlmICggIXJldCB8fCByZXQgPT0gLUVCVVNZICkNCj4gPiArICAgICAgICAgICAgICAgICAgICBi
cmVhazsNCj4gPiArICAgICAgICAgICAgfQ0KPiA+ICsNCj4gPiAgICAgICAgICAgICAgYnJlYWs7
DQo+ID4gICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICAvKg0KPiA+ICsgICAgICAgICAq
IEFmdGVyIHN1Y2Nlc3NmdWwgY3B1ZnJlcSBkcml2ZXIgcmVnaXN0ZXJhdGlvbiwNCj4gWEVOX1BS
T0NFU1NPUl9QTV9DUFBDDQo+ID4gKyAgICAgICAgICogYW5kIFhFTl9QUk9DRVNTT1JfUE1fUFgg
c2hhbGwgYmVjb21lIGV4Y2x1c2l2ZSBmbGFncy4NCj4gPiArICAgICAgICAgKi8NCj4gPiArICAg
ICAgICBpZiAoICFyZXQgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgQVNTRVJU
KGkgPCBjcHVmcmVxX3hlbl9jbnQpOw0KPiA+ICsgICAgICAgICAgICBzd2l0Y2ggKCBjcHVmcmVx
X3hlbl9vcHRzW2ldICkNCj4NCj4gSG1tLCB0aGlzIGlzIHVzaW5nIHRoZSB0aGUgaW5pdGlhbGl6
ZXIgb2YgaSB0aGF0IEkgY29tbWVudGVkIG9uLiBJIHRoaW5rIHRoZXJlJ3MNCj4gYW5vdGhlciBk
ZWZhdWx0OiBjYXNlIG1pc3NpbmcsIHdoZXJlIHlvdSBzaW1wbHkgInJldHVybiAwIiAodG8gcmV0
YWluIHByaW9yIGJlaGF2aW9yKS4NCj4gQnV0IGFnYWluIHNlZSBhbHNvIHlldCBmdXJ0aGVyIGRv
d24uDQo+DQo+DQo+ID4gKyAgICAgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICAgICAqIE5vIGNw
dWZyZXEgZHJpdmVyIGdldHMgcmVnaXN0ZXJlZCwgY2xlYXIgYm90aA0KPiA+ICsgICAgICAgICAg
ICAgKiBYRU5fUFJPQ0VTU09SX1BNX0NQUEMgYW5kIFhFTl9QUk9DRVNTT1JfUE1fUFgNCj4gPiAr
ICAgICAgICAgICAgICovDQo+ID4gKyAgICAgICAgICAgICB4ZW5fcHJvY2Vzc29yX3BtYml0cyAm
PSB+KFhFTl9QUk9DRVNTT1JfUE1fQ1BQQyB8DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFhFTl9QUk9DRVNTT1JfUE1fUFgpOw0KPg0KPiBZZXQgbW9yZSBobW0g
LSB0aGlzIHBhdGggeW91IHdhbnQgdG8gZ2V0IHRocm91Z2ggZm9yIHRoZSBjYXNlIG1lbnRpb25l
ZCBhYm92ZS4NCj4gQnV0IG9ubHkgdGhpcyBjb2RlOyBzcGVjaWZpY2FsbHkgbm90IHRoZSAic3dp
dGNoICggY3B1ZnJlcV94ZW5fb3B0c1tpXSApIiwgd2hpY2ggcmVhbGx5DQo+IGlzICJzd2l0Y2gg
KCBjcHVmcmVxX3hlbl9vcHRzWzBdICkiIGluIHRoYXQgY2FzZSwgYW5kIHRoYXQncyBwcmV0dHkg
Y2xlYXJseSB3cm9uZyB0bw0KPiBldmFsdWF0ZSBpbiB0aGVuLg0KPg0KDQpDb3JyZWN0IG1lIGlm
IEkgdW5kZXJzdGFuZCB5b3Ugd3JvbmdseToNClRoZSBhYm92ZSAiY2FzZSBtaXNzaW5nIiAsIGFy
ZSB3ZSB0YWxraW5nIGFib3V0IGlzIGVudGVyaW5nICJjYXNlIENQVUZSRVFfbm9uZSIgPw0KSU1P
LCBpdCBtYXkgbmV2ZXIgYmUgZW50ZXJlZC4gSWYgdXNlcnMgZG9lc24ndCBwcm92aWRlICJjcHVm
cmVxPXh4eCIsIHdlIHdpbGwgaGF2ZSBjcHVmcmVxX3hlbl9jbnQgaW5pdGlhbGl6ZWQgYXMgMSBh
bmQgY3B1ZnJlcV94ZW5fb3B0c1swXSA9IENQVUZSRVFfeGVuLiBUaGF0IGlzLCB3ZSB3aWxsIGhh
dmUgcHggc3RhdGVzIGFzIGRlZmF1bHQgZHJpdmVyLiBFdmVuIGlmIHdlIGhhdmUgZmFpbGVkIHB4
LWRyaXZlciBpbml0aWFsaXphdGlvbiwgd2l0aCBjcHVmcmVxX3hlbl9jbnQgbGltaXRlZCB0byAx
LCB3ZSB3aWxsIG5vdCBlbnRlciBDUFVGUkVRX25vbmUuDQpDUFVGUkVRX25vbmUgb25seSBjb3Vs
ZCBiZSBzZXQgd2hlbiB1c2VycyBleHBsaWNpdGx5IHNldCAiY3B1ZnJlcT1kaXNhYmxlZC9ub25l
LzAiLCBidXQgaW4gd2hpY2ggY2FzZSwgY3B1ZnJlcV9jb250cm9sbGVyIHdpbGwgYmUgc2V0IHdp
dGggRlJFUUNUTF9ub25lLiBBbmQgdGhlIHdob2xlIGNwdWZyZXFfZHJpdmVyX2luaXQoKSBpcyB1
bmRlciAiIGNwdWZyZXFfY29udHJvbGxlciA9PSBGUkVRQ1RMX3hlbiAiIGNvbmRpdGlvbg0KT3Ig
ImNhc2UgbWlzc2luZyIgaXMgcmVmZXJyaW5nIGVudGVyaW5nIGRlZmF1bHQgY2FzZT8gSW4gd2hp
Y2ggY2FzZSwgd2Ugd2lsbCBoYXZlIC1FTk9FTlQgZXJybm8uIEFzIHdlIGhhdmUgcmV0PS1FTk9F
TlQgaW4gdGhlIHZlcnkgYmVnaW5uaW5nDQoNCj4gSmFuDQo=

