Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DB59082D4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 06:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740336.1147393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHy86-000894-EM; Fri, 14 Jun 2024 04:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740336.1147393; Fri, 14 Jun 2024 04:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHy86-00087B-Bg; Fri, 14 Jun 2024 04:01:34 +0000
Received: by outflank-mailman (input) for mailman id 740336;
 Fri, 14 Jun 2024 04:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eLuH=NQ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sHy85-000875-En
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 04:01:33 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2414::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c78fa9e7-2a02-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 06:01:30 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB8546.namprd12.prod.outlook.com (2603:10b6:610:15f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 04:01:26 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 04:01:26 +0000
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
X-Inumbo-ID: c78fa9e7-2a02-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asEC24kCQp7g+PznBUZQQ39JzNW1c4ERXkxCHzSjEdxorS7KtAVUAvYlryDapFJj5mbZ7HRZwebEFTIyJjsUcdnuoqYW6R2te7+42tbI7fPKWN5JuKkly+oN7ySPyin3jI9ZEY0cVxEw5odLOgxk8l0+okpeG60MAEU7nFSLYFu500x7PNmXRJjsLdxlteaFoLD6yAE5Ka1E8sQDAJ8NjRKH66sY/OodjsfTAoFiBDa0p3XLlarFK1L/waIkehI/9neKOQxyruYMn1Ce0pVlrc4bZjpBfTkNY4vOXQ1olj117ufNTJAHTBCO+RhJxSrLaXV3ulaPzwCmmt2iu5l5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06MsgDEZiAwmFJ2UuVfXnsegMPTTzvj5G+vfGBEw5E0=;
 b=FaO7HoXxWP3Eo8T3OAfYP1Nv2fM/1dKg70YYq84q+csw2IOiMktECqWvyvi2yBm1V1lDHi6UJgvdGYKWKFxrnem1oHH1TRYAlUnI9q2PpbPY3o19fZ0WxECpnHN3j0i8I+QB3Wmg/u6R5+3nnBlDqkYoBNR6uY/WVXywoDBFxX+wM7eVSQkjnWwPlfpVBKSqFkrzYtL+It0tPrxb2hESRvqn2dJH0a+JMEFYWGSgJDrt81snOMPJPDN6xLCHHk+iwYAKPmA0VoI5OZ5HHcU79WlCeceRN51neuk5LSg89XTN5uPGNGNy3eJCRry837gXxkVWGVR40YCrywsdHDKsSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06MsgDEZiAwmFJ2UuVfXnsegMPTTzvj5G+vfGBEw5E0=;
 b=tFJ/B4SW/qHGVbnBZT2H8YpIvYSNXB8ApzvKgNcmBCbQlUp5XsN/Kea+1LgWKxhJTgcJUAcGlymgB+gWeDGWDDhVL2+7VJlehJGRHtsGSRXJZ5FH5hXMkjVIHzRWqKYuyw03uPC5qahqqIBUiHJ1qpR8RLcvUiOHYnhQtddJ2WU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Daniel P . Smith" <dpsmith@apertussolutions.com>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index: AQHauLJn3FT0TCW9KkmRq1iRWqwBt7HCqQ8AgASJ3oA=
Date: Fri, 14 Jun 2024 04:01:26 +0000
Message-ID:
 <BL1PR12MB584991A01727FD8C7BD430BDE7C22@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-6-Jiqian.Chen@amd.com>
 <987f5d21-bbb5-4cdb-975b-91949e802921@suse.com>
In-Reply-To: <987f5d21-bbb5-4cdb-975b-91949e802921@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7677.008)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB8546:EE_
x-ms-office365-filtering-correlation-id: 7d961c13-3b37-42fe-c171-08dc8c26a9aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230035|376009|366011|7416009|1800799019|38070700013;
x-microsoft-antispam-message-info:
 =?utf-8?B?QVhZbnN6VmZKdnplVUs1SDlzeEtvMXFINTJEWU5YVE84WVBpLzkzRWZsTmM1?=
 =?utf-8?B?SlkxVjRtL0lpc3FZbmlsaWpYdVZOMWpTM1Y1WnVRUVZUQ2llQ3JlZnZlSE0v?=
 =?utf-8?B?Y0Rud2RyQ0RsTGtlaHYyeWVNdHNINmFxYkNSL3ExS1UyMWtPOGhsc3dOMC9k?=
 =?utf-8?B?SlY3VXJFWGNQKzlWMzlSa25PV2ZhRnlpbmRJYmd5QlpoL0M5bmtZakRERmFz?=
 =?utf-8?B?Q1RYZ1p6YXE1eFRqMFRFajhZUHNkOW5XVk1vY1FRZS90eGNmMzRYbzZZK2d6?=
 =?utf-8?B?MHFMTzBFaFhuSUdGRFNyK3RUbllRdHJYSSt0SzRuTDdsQjRvOEtJcGwybUdk?=
 =?utf-8?B?TS9RVkZ3eXBWc2d0OUNBWEM2czlnT1k1V1hTcDllZ2tXQVVFeGNGV09VeGl2?=
 =?utf-8?B?eTJzZmcyUS9NZEc0eWtzc2cyc2R5NHprQVdxWk56RmhWaW5yWkRHL3FqOTBK?=
 =?utf-8?B?aHFmY0lrR0VXbkNnZ2pRSmlYRXRtT1pYOTdFTStUZHdQUzFTMytLMjV5Wlh3?=
 =?utf-8?B?UEw3ZEUzQVR1bWVRSUJZakZBb0lvcHpMdmQ2Zm5qTnprNzFkMS9JTkhWL3Ba?=
 =?utf-8?B?bmRkcTlON1JYSEgrZnV3STRwMFM5eER3NjJXTkpaQ3BvbmlmODY2YlIyM1N2?=
 =?utf-8?B?ZkdMMURmSkYxOUtGSWNLMXVONU0wd0RUZmROSnBwc0V1cC9Dcys3VEJtdzNw?=
 =?utf-8?B?ZXR1enFienB5bEJwTGRPMDZrSGxQK3NJR0Y4R1J6TCtMQjB4ZDhHTUR4WGdX?=
 =?utf-8?B?L3ZWRjUxRDdoQ2owODRBd0l2ckdrcmZZZ1hsTjRJU3FRYktkSEFPK1BvcFhI?=
 =?utf-8?B?RE5CaGhVNXIxZFNjVUFTUWZPaU9jUDcrWkNxV1RoUUhyd2JseGdyYUxpSmVr?=
 =?utf-8?B?K2YyWUNkQTk3UXNyV0tTeGhIdkJuQ1BmWmhQbDFSZldYOFc0WmZOSVVRTldI?=
 =?utf-8?B?MGhQTEZIWS8xOS9reHJkS3Jpdm51MDBzcWMrc2VzWm9SajJYMWdrdDFOL2Ns?=
 =?utf-8?B?VFEyOU9ZMUg4cWhjU3RLejdnaDFObTdML1BnRlBtTmtTRmJkTEJFZjZNNlpU?=
 =?utf-8?B?dmsrNUVoczhiWGUyTWdJT0FTaGFxTUt1L1NiYjFwRHV1bHNTMUR6VVNwbkRp?=
 =?utf-8?B?OC9sMDZrZGlKWEhiVE9Sb0t0cnpMUHdMdllUQzZJNWZuMHpEKzNkSk9lODQy?=
 =?utf-8?B?VVFPQmF1enJHZ1BmTXg3ZDJpYUlXenhUbzN2SjB2ZHpvVG84UmxqSGJyb1N5?=
 =?utf-8?B?NjVRNm5PeEl3bUpjZlp0ZFY1aldQMm9wUHpROHJVdjJWeDVhWlpqOUk4Z3Fm?=
 =?utf-8?B?dXFHQjIzbGI3Y3Niay9uUVVDb3MwUGhURmc3NytBTlNRMUJHVG15QjRlTGpv?=
 =?utf-8?B?NXBtTWxJemlEOVV3WStLWVRnQlRqdEY3YTdQM2o1SE1KMllpRUNHV2UzM3B0?=
 =?utf-8?B?R1ZlQ1BhdW0zWmtNM2ttenFIZmJaTWgrTFROWVlWVjRWUnpQQ2VjOWlvTHZU?=
 =?utf-8?B?WXQ0S2JYckZZQ0JwM20vUTdySVZWZUovbnhRdmRZVWJ0ekJ6Ukk5dGFWRkVI?=
 =?utf-8?B?d3dVc09kY054aDdlbVVUMmJIYmtGc0dZZVhMVUYreGFHQWdkd3k1N2pZM3Iw?=
 =?utf-8?B?NWt1OVI5Rnk0YjFTaSs2ZTZEc0g4VWZhZGNIRzJvdE1WU2ZaOFVFb2ZsdUFx?=
 =?utf-8?B?bjUyb3JxMXNaQmJabmZxb2dlSUVsaUZIdG9iTGhuSzV4Njd4a0p2NlBRZ09B?=
 =?utf-8?B?MFl0TXdjbERkd2ZxZnV4dDVLQlBZSStVVHZiVlp0eTZhbjNrMzhwY0V1L2Ux?=
 =?utf-8?Q?OE1AUH7e5olCBR4muqTYyf6U+WQgfl4CmrKA0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(366011)(7416009)(1800799019)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NVc2b3c4Q3JhSHFZd3JBUmdGQjdYS3ROY3k3MW8yYWNxZHd2d0NsdkJ5K0tO?=
 =?utf-8?B?UEJDMkhVOVdjRXJwNzkwZTlRZGVla2Z0T2FXMnVaNjRGeGlnd1hRaUNUNWdZ?=
 =?utf-8?B?RUEvb0FLc0pyT215alZ4dkRNeEJrbzRzRUtpdW9tTE93c21uN2dHUWdxOHB6?=
 =?utf-8?B?TVRWaDIzT2hXTHVBQWx5Z2lzQmVoUGRsTkNvQmUrS0JjZjBjVFJYZHRQUjda?=
 =?utf-8?B?dFBYMFc1R1h2V0F4SzdTYnBFMmJVKzZTdzU2dWtMRGpBa01mY25OTk45bU1V?=
 =?utf-8?B?T2gwVDZZRXNKek9hTm0xbkhDcmUxcVc4MHBaaWNuUG1iTUVldnpzMHhEV2gz?=
 =?utf-8?B?ODc4Sm9KYW1CODFSdzFROUtoVG45T2tBMlNNY3BjaGxvbHpGM0E3SzI3bkRn?=
 =?utf-8?B?azBGOVA5cWJkb0M1bVYzQ2Q0WStTb2NpSmlxQXJ6YStWQmF6bG9UZ2hHNmpq?=
 =?utf-8?B?YTUwcUlIaHBKQ1A3RFlJMjJ3R3BvWFdkbjNDWTdGU1VQdzMvOEhVeEpSOGJ1?=
 =?utf-8?B?WW91SGl3amY5a1hEcUxmempXRXpLR28xcHRuYWRaZ1U4WGtXVWFSVWpDQ0th?=
 =?utf-8?B?MWE5ZmlPZmdRRVh5OG5hcEtVL0xnbVN5L3ROTG94YUozV3RKdlBOUHJtRFM4?=
 =?utf-8?B?ODdFSkVFOXdsd2JVMDdaTncrb3BoQTRHWCtRcFJMWnFJWHpZanNlbjdKcFl3?=
 =?utf-8?B?VExoWEN4YWtpVUJSRlEvdkx3Ti9RK3ppTFlSb29FcmZicTFLMVBtZzVrVGFo?=
 =?utf-8?B?WkFNSzNWSWw1NU14ZHRzM1pPWDExMkd2QnJlOHBLNVQ0bUFqeXdWMWVCUDFR?=
 =?utf-8?B?bEdDNjZvZzV6OVhHTmQ3N3ptUGZYV3hlOGdyK2E0OGJQNkdscWpBdmVyQ1l3?=
 =?utf-8?B?bURDbzBCenNZdUZ4M0w3bE1CelhHUE5VYU5wM2NYOTk0YnRnSDFWOXVRUmR3?=
 =?utf-8?B?T3p4aWRNSUdtbms0ejR4SGZGMWwvRVc3M2hGRFB5dFJBOC9VVFliQ0g0WSt3?=
 =?utf-8?B?SzlBZHI5OXQzbnFhM01tb0RIeFV1MUtBRTZKamxaSDFJcWRRbEllZjN4Si8y?=
 =?utf-8?B?NDVKRjZSWTJleFdqU28yRk1iMXBiKy9xRVV4eXRuazVoc2h0YWZnakVXVUIr?=
 =?utf-8?B?WUN2ZnpBS0dLQXhpQ1ljRHY3UlN4OHk1WDR0THJBV0RBVnN5NlFYcjJlV2xE?=
 =?utf-8?B?MGhUNEdFMGFtRFBRd1B3OW10Uk9KWlVzSEFZVFlIR3ZuMCt1azlKUjQrTlRt?=
 =?utf-8?B?UTc4VWZZUFNhTGl4VG5kamxhcGk5MG13UnNoK2xKOTgvQ0krS1dKb0Z0WWI2?=
 =?utf-8?B?ZzhGVStKZzRLMFNVbTVlQVFYQUlxREI5Y0FiMVh6WDQ0c29NbVVuYVdZaERB?=
 =?utf-8?B?MkxzT2JrODJYYmJYK3QreDNyT1lXaGxHRWdiL3RDdzh4TnV6b1cxM01tenVq?=
 =?utf-8?B?SU1JS1JVWDdDV014aGNtbURTR3QybTNsZ2I3NXpHS1FweUZPNzFRTkVPZXZu?=
 =?utf-8?B?UHZjRXlaTlF3RXA3RmcrVUcwQ3kwcmNkNWN2T1Z6WlVQaW9kWEY1WUZSUFJY?=
 =?utf-8?B?cTB4ZHF5cmloaWZ2dTlCYXJmS0YzbkovcGg4eDIyU0tpVHozS0xXZ1F1bjI2?=
 =?utf-8?B?OWJDSGxhT0JNRzBaY212bWpoSitBUXdkTzBvZnB0eXdQdlhNSzlCNGJvdTU0?=
 =?utf-8?B?cCtEdklUMXRaekJOM1lYUVBYK1ozVDdncndabTFsQXJ6QWtSM0UvZTg5WmJi?=
 =?utf-8?B?dExRM3hmU2JVVGxrM0dOYnFRVkRIa01oVVowWU44bDFUeFdTa0JLaTliMXVF?=
 =?utf-8?B?MTZVLzQrU2ZlWlBvKzc3ME5pQWdtNmNmazF4bGs5cEtpeGdNVDhhQ0tzbEhF?=
 =?utf-8?B?aDRXOEJ2dVhsS0ljb0pQQ3REMFozT2d5M0tYYitjN2RUYVhzNy9mdnNydlFB?=
 =?utf-8?B?Sjk3Uk96dThQbDRZZEhraGIwdndCZXUvL2RGeFI2d2FuS3JSVHAveHN1dVdo?=
 =?utf-8?B?Y2FiNGljRTJ3N0RjWjB4djJ2cEVDMWVrNjhKMlFlQWhGb3ZBdnVVbk1HSkU0?=
 =?utf-8?B?TzNBOHdpV2Vna1VPZkxFMXhFZEg4OHRWV21USDRXWGcxM2cwM2s0SWJGbkZ6?=
 =?utf-8?Q?2Iz0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D8FBA5EC224284D88F0C9BA25F0EDF1@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d961c13-3b37-42fe-c171-08dc8c26a9aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 04:01:26.2539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EbmNz5aeJ0ZItYQv/aJJX+sAZzPkBkKJ7Ki+oVPFxOFgHRBIAGC0N22k0QByUJr7JhMubBycE4BJBfNsyKp1lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8546

SGkgRGFuaWVsLA0KDQpPbiAyMDI0LzYvMTEgMjI6MzksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBP
biAwNy4wNi4yMDI0IDEwOjExLCBKaXFpYW4gQ2hlbiB3cm90ZTogDQo+PiArICAgIGNhc2UgWEVO
X0RPTUNUTF9nc2lfcGVybWlzc2lvbjoNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdW5zaWduZWQg
aW50IGdzaSA9IGRvbWN0bC0+dS5nc2lfcGVybWlzc2lvbi5nc2k7DQo+PiArICAgICAgICBpbnQg
aXJxID0gZ3NpXzJfaXJxKGdzaSk7IA0KPj4gKyAgICAgICAgYm9vbCBhbGxvdyA9IGRvbWN0bC0+
dS5nc2lfcGVybWlzc2lvbi5hbGxvd19hY2Nlc3M7IA0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAg
ICAgICAqIElmIGN1cnJlbnQgZG9tYWluIGlzIFBWIG9yIGl0IGhhcyBQSVJRIGZsYWcsIGl0IGhh
cyBhIG1hcHBpbmcNCj4+ICsgICAgICAgICAqIG9mIGdzaSwgcGlycSBhbmQgaXJxLCBzbyBpdCBz
aG91bGQgdXNlIFhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24NCj4+ICsgICAgICAgICAqIHRvIGdy
YW50IGlycSBwZXJtaXNzaW9uLg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAgICBpZiAoIGlz
X3B2X2RvbWFpbihjdXJyZW50LT5kb21haW4pIHx8IGhhc19waXJxKGN1cnJlbnQtPmRvbWFpbikg
KSANCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsNCj4+
ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIGlm
ICggZ3NpID49IG5yX2lycXNfZ3NpIHx8IGlycSA8IDAgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAg
ICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArICAg
ICAgICB9DQo+PiArDQo+PiArICAgICAgICBpZiAoICFpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJy
ZW50LT5kb21haW4sIGlycSkgfHwNCj4+ICsgICAgICAgICAgICAgeHNtX2lycV9wZXJtaXNzaW9u
KFhTTV9IT09LLCBkLCBpcnEsIGFsbG93KSApDQo+IA0KPiBEYW5pZWwsIGlzIGl0IG9rYXkgdG8g
aXNzdWUgdGhlIFhTTSBjaGVjayB1c2luZyB0aGUgdHJhbnNsYXRlZCB2YWx1ZSwgbm90DQo+IHRo
ZSBvbmUgdGhhdCB3YXMgb3JpZ2luYWxseSBwYXNzZWQgaW50byB0aGUgaHlwZXJjYWxsPw0KSXMg
aXQgb2theT8NCg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4u
DQo=

