Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPRlFBRccmlUjAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:19:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5BA6B0F1
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211637.1523139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyKg-0000vg-TW; Thu, 22 Jan 2026 17:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211637.1523139; Thu, 22 Jan 2026 17:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyKg-0000uA-Qd; Thu, 22 Jan 2026 17:18:58 +0000
Received: by outflank-mailman (input) for mailman id 1211637;
 Thu, 22 Jan 2026 17:18:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viyKe-0000u4-Vz
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:18:56 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cfd13ef-f7b6-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 18:18:54 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW5PR03MB6905.namprd03.prod.outlook.com (2603:10b6:303:1aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 17:18:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 17:18:50 +0000
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
X-Inumbo-ID: 6cfd13ef-f7b6-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=on1x4OYXdZeOfQrii8spj2vTE58rY39g1iIUC3f543Rt97xocYCyhfUtzRA94alUmBqtoJK770KDOzWpBPtqsHzk+fZiCAbwSoT+tQmcJjm1iMojK4wM0PqpfHgAT9sW4PwZ+jYXCxxiujWijq2Hsx/1OTvAzoCZupEucF1kvngRUu7oYagus5FC3FUkOz97BPG9j96yJfuBdprERzuN04yVv+naFGTxVsP5xuU0aQ0woDM6biJ1s7cNAovNlmnWqPgOI3/ivnOD3TO3718KoRhJADA4eP4EaG/e8jALQ8U50XKC0B4MiSJYorC4PzvBHLoB2wTOzBInhltyK0ADtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7E7COv+Wh1EVe34eonap1ehBQJL4ChnMDwNg1wlY5Do=;
 b=Gtj4VAW3jlSlrWO2Rb/M5Ms1XzSbHdjU34qqJswv9A/L2lCnqOM3ZmdRU3f+JCSS+f0eMKY/D5ORJf6XUNy71ZdJfX/9M15O31I3NCD1xXa3hsj1xd4Mu9znsQt/UuQBFz+LgBEsMO2WgMu6ExX9CdCgbNj8Mzq8smVR9pcO/Vjp+1g9sJWvHU6ZW1I5cOiSipU/OWYSJmJYpP2vjJBuvdY4JWjp/Zs3dAe1jyjE6dzci9+TYiDcyEhXNUylk84D1uAV+yyVClLINwM0u1pDBHPycDK3xpiBu0KjW753Z7/Xert/jxJ1TW7v2WiLgQpXQHvhovB0oQvGxJvWuf3Rzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E7COv+Wh1EVe34eonap1ehBQJL4ChnMDwNg1wlY5Do=;
 b=kKBxqjQXjcfBo6SSczPRdYhnYet9Xk6jjs/HszjgPwWRO0oIjYraDJE7s//HUNC4DFUZtza4LBmNmbh07q8OU3RsUq3AFdIwdWotI1M6GaPiR0loe6g/37e+Op1l6nf6agyRRgq0NdLD3H1tS5kd7M8G44g73owiladRCe6jtvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 18:18:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: MTRR init sequence in Xen
Message-ID: <aXJb9V34fTLR1Fd3@Mac.lan>
References: <145af46c-eab5-4d0f-ba35-4ae646c0e4cd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <145af46c-eab5-4d0f-ba35-4ae646c0e4cd@suse.com>
X-ClientProxiedBy: PR3P189CA0070.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW5PR03MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: 36be5ecd-92f2-460a-c426-08de59da4f6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHJrNXoxTFFFOUt0dDlnUkpta2lsaWQ5cmVIRDFNaXlDc3JsaGdBNk1FOFNa?=
 =?utf-8?B?REswcDQ5cmVyb1VHcUdGemNxdkhPRGUyRHhQYlE2T0pKa21GbElhMHNLdmpG?=
 =?utf-8?B?QUlmaHVEUEw0YkwyRWhSZVhOcGpqSDN5dDNHVEpVcWFwaDUvOHBzdGtJRWd0?=
 =?utf-8?B?dVdhVzE3UkcwU1RYMEQvOHViK1VqYllaeitzdzhRWGVieWxYV2x3d0Y1UU1M?=
 =?utf-8?B?UEhpYkE4cCtDclJKWjNNZVNHcW9LSjA1ZVRSK0p0UWFDTmMwRGEzY0pvQ0VM?=
 =?utf-8?B?STVwbUN6Ynh3ckhvdkQ4S2pZZU1yK1RiQ0U0c3p5anVyWk5CTTQ0WHB4eEhs?=
 =?utf-8?B?R0FVZ0dQS1N5OERaVlBNOWhUSndoTTNaU3FSRG1rVWt1bVE0eWRWb0RBYVhs?=
 =?utf-8?B?bkdKdDVZbUo5ZjhvRnBNblc5dDRaRXU0eVBPSG51LzA4dmJXZlVkZnVxVFhT?=
 =?utf-8?B?cHppQmo4cFNKTStyMnJPcFdReFVSMjdicGEzU003Zld4S2lMUWprSDNzMlNW?=
 =?utf-8?B?dllaSWxCekhqNGpOSlRsblE5a1RxczNjb2hhUlI0c3hJVytpS3FYdUdKVThy?=
 =?utf-8?B?N3FsaURPeno2UGlHT3JXN2NvMWE3U1RBOTViTzBQZWtLdzRtSTdXYzg4R0pl?=
 =?utf-8?B?QnRpcUFVbUI1dTlXS3R5RWhGb1I0QTdDdEd1REJBdUx6cjJBYk5UN0xmbE1H?=
 =?utf-8?B?ams5UWl6c25LY0dpYmVqZlVQa0ZEVFJXekZDa3VheGxzTHdENWd6cGZuQWMx?=
 =?utf-8?B?YU1mR3E3aHN3MWtWVldXUXlyWWpab01YeC9yblhObFo1bG9tWEUxY0lzRXE2?=
 =?utf-8?B?dVZ5TEY3clNwT3I1Uy9EZkVMM3U1WTViR0NsRFZGMTFSemhid3dWZXptT2lj?=
 =?utf-8?B?OGwwdFRTTFhlUzlDcWZUc0wyeThtSmNTQ1hFczJxd3hPTk0xYUc1ay9NZGtR?=
 =?utf-8?B?djE0TUdFOWUzNy9jREhIZG95MlZHUzVPdUl0Q0FUS1dNam96aGlIK0F2YmVm?=
 =?utf-8?B?YlcyTkR0UFB0MWNIMVQyeUNQOE95QnpCY2pJMHY5OTdWcmRrYjZ3U3dYNWtJ?=
 =?utf-8?B?SnFoWCs2Wlc1cEhEdzVEUnRqajFBdlFiY1lDVm9Wdk1oRjRhbzFGdy9QMUFU?=
 =?utf-8?B?MEdFQ3piSWdMK2E2RHJ5RUxWSklOVldyQ05uU0lDUnYvcWNsaWpFY2hxcXBs?=
 =?utf-8?B?UHI5ZmNpcDJSbnpWZDd0WkkraU9MOGlsdnROb2lTU09GSW4zOHRuVzdJWHdw?=
 =?utf-8?B?YSt6T1lUdFZNMlVHYVNSWXpOcHJsZUhEcTgzYm5nZWdzLzFvQW5RbUdZMzBB?=
 =?utf-8?B?T2RiaXZVdGFJSjVqRnpLU0xKbFcxWGg1N0tQRWgxODN2K1AzMTQ5dnVBOFNF?=
 =?utf-8?B?TCswRlV2NWNOTVI3SWZHZTZ0SkYva3lkbGo3T1BFT3g0c0R2Uk1wQWIyV2lG?=
 =?utf-8?B?WGlqclMwNkcxeDlPNTczNkRrMGtjL3d3YWNadUl3TUhCTlVNcXZqNnRLL29P?=
 =?utf-8?B?cE1jL3Uxd1B4Y3htUExheXpVTzliT3FXRjNYMlFURmtLbWhUWTFrS0JNRy9x?=
 =?utf-8?B?ZDQvMjZVM3ZpTk4xQzJVNFRLUDFBQjdReFRUSkFac05RemFhSzZHL3JZVjBk?=
 =?utf-8?B?NGNxa01ZT3BGYkE1OHZPWUIxUFlZSTgwVEdUWGRnSnZvRnNiSjArbVJUczNr?=
 =?utf-8?B?SkY0VmFvcXcvSURWZkNpMEtmWjB5cEE1Nkp5MzcvdnQxZGFEeFhGRlkwbHJr?=
 =?utf-8?B?dVpCRXFLOW5uRERHL0FZTHh5Tko0VXZDOHBpNDc5QWxHODYxQTFML2NNb3Rp?=
 =?utf-8?B?Ym1LZmV5ZWNhTHlFdWdBUWJpdnlVRkdNdzg5TnloV0pPdjYyQmFZM0ltL1A4?=
 =?utf-8?B?dUx5d052U2JuY0Q2WkhERGE5b1NkazRoYmpWZGt5OEZMWUZZYUMrNXk1cDhM?=
 =?utf-8?B?NGszUUpFYVdCT1lYaHhtdVA4VnZwL1A1bzVNOXBmV0MzblhsbThqODEyN21W?=
 =?utf-8?B?cFBadUtWaStJWU9abm9TS1JBZXhveFRSeEkwcEFaWkxvMUhuZjM5ekFheWVV?=
 =?utf-8?B?bVlaM2NrL0tHYmg2YVRXSHVDczhPRUZ0WEVmVlV3alFnSENoMVA3d2pOTVJH?=
 =?utf-8?Q?IxZo+nvhp7UOh4Ke4CQcbIGdL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEpvS0lrZ3Baejh4WGFyMTAzaXNPRWxCWDFMUGt5VWM3VVdaenNKVWlLWHFs?=
 =?utf-8?B?emYxZTM2djhKWGJLTUNJZkFqWk14aWlaNWJSU3JwUjIwa2QrdnpvRmpkNkI0?=
 =?utf-8?B?OXpkVndDc25GN1MvSlhzOTZ5Sm0yeFE2MmlsOGdtREh5dWJhYklCOUxQcDdI?=
 =?utf-8?B?dEtVdUdkL0tNRjMremZrdWpXcm81K045ZlA0cHJZdjZ2NUEweDN2YUx1emEw?=
 =?utf-8?B?WW9teGlubG9VUlVuTXlHQU5JeWtBZk5rcXJ1b0owNElNUHdVQWgySWtaMUVS?=
 =?utf-8?B?aVI0Yy9tOXN6V08yNzVVOUlpOVNhbldTQm9Ca2E3bDZrZFI1NVFnaTRlbGdU?=
 =?utf-8?B?U2R0KzlZRmJ1ekh6dVA2NURpbDNsdmNhYXpIS1VxWG9IQzJHMFV3aXl4UGdj?=
 =?utf-8?B?Wk9UTDNGY0F5bTBoZm5Uazl2N09qVGhDL0dXZXE5SVp5Nml0eUN1MVpiTVgw?=
 =?utf-8?B?NGRXMmRvRUFYR3lvb0V2dld2WURrZm1wK01VSTlxL0JUeUxoVy9Bd1lCdVRr?=
 =?utf-8?B?Ty9GYUQ2VDIvaGtJT0Z3UnlmS2tUYWorVjB6a3dicTVSZngyTEkrdU1yY2FK?=
 =?utf-8?B?SWIxSGxJU1liOXdVazRZNytqVjhsS3pLcTJjWHNwQnhLT1k5QWc4WmpDNzRZ?=
 =?utf-8?B?RTdvdFNJNHU0c2JReU53d204OGt2eHhxVCtYUFczZURtNGJGR2hKK0JKTXIv?=
 =?utf-8?B?OTdzVzF1WEVwUWNZQUM1R2NKbnpKZDQ3cy91NTE3UWE3Q1d6SEdaVHBydVVx?=
 =?utf-8?B?MjI0QUJrZE1qc3pKRjVnMUV2b05mNGwvVjhjbHVLWlBSdUYxeVNwR3dIM3ZI?=
 =?utf-8?B?bWVSRURkZ210cThnZ1lOVk80SzYwYkxVSGExTGcxUXZtcUxEM1BVQUVQM2Rt?=
 =?utf-8?B?Tkt3M2hXbWVPUjdwV2ljZ0V0bVkyMGRsQTFWZXdJY0NrV2JkQnRMWktLS3p5?=
 =?utf-8?B?Umx4MUV1VlBpOFpWb1FYanlsdWthQTh5SDdzd01hczBFVlRORkZlckJ0Qzgz?=
 =?utf-8?B?VFNLd1pBTlMwUXZTVzhyRzBsZXN4azZ3NE84b1ZqbGdiOVBaV3hqZW5EYWVq?=
 =?utf-8?B?aCswUzZUc0tWeFA3Uzd6U0s4RzkyK3RJL25Mdyt2bkRnSnNNOG9HVkpjNWk2?=
 =?utf-8?B?OEJ6ZVpmOUdEeldWUFYyeTE0ZmxJWGh6d2tvSVhURWxQcVpXeDAwVUp5N2RT?=
 =?utf-8?B?cE91dmttNnRaMm9yMzFVd2F1REVpaWV3czVjRStFOUtpNWdsVTBNdG1IN2ov?=
 =?utf-8?B?clhGMkJaNGE1MVlpemF5eWplWkpzYXBUUVJzN2dNY1Zja2RwRFVIc01jQk05?=
 =?utf-8?B?NlRFYm9pVitUamR0UytxUnQrdkUyY2d5cVgyRjlRUERtOWRnYnhwa2NFNEls?=
 =?utf-8?B?ZTYzNnNxcTgrSDFQVHVXMmNHTFdmM0RmcmduZnZtMHZwMk8rSldkVjBqOEND?=
 =?utf-8?B?M3pEMjNuMDdZRkhraFh5WkRDTWl5SXFnU3JpSk0yekJzKzRJYm1OZ29WMytE?=
 =?utf-8?B?NGszbURRVVlBaEpQNG02ZlUrRndocmxvVkxGUkFJZVZkYmZLN0FHRlpsL1Vw?=
 =?utf-8?B?VnF4aUdSWkEzYUszSE43S29uekRYUmVpc2wxZWhRVE1oMTNxNjA3SzhEQlha?=
 =?utf-8?B?UzY4U2Q2YjBWWjhrL3NDN0RPZDY0ay9mSklJRjZJRzhsMjRiOEZzeHZVQlVm?=
 =?utf-8?B?WUFjdTREdlRWc0xsZXhHQnozNEJNeVFIdytlbmYrVnMrYlh3MVhqZHdIbGR0?=
 =?utf-8?B?NklBbnR1VGpya0dFdlR1T2xyeW5qejBSa3Bhc01RdmQvVm81SU1iZkMxRXE2?=
 =?utf-8?B?eWF0RTNEWFhBaU1iSmJqQXY0RzQybVU3LzBJY1FEeDlvZS9YSXZnTTFLSkNq?=
 =?utf-8?B?cWU2R2VYRDY5cXREQXh1YzlGREJBWXlyOGMyZEx0RjIzT1hDL2VwY1oxaEh3?=
 =?utf-8?B?T1Q5Q3lnZW9nZjIzSTVTazRmVXNreWZtMkpWTTRWVUsvcHhzdmcyaVphajF5?=
 =?utf-8?B?bGdKMGtlSllIQTVyd1hIS0lQbGdWWnFuMXNldlRHUkRSMXhTTHdQWFh5OXRW?=
 =?utf-8?B?THM1M1hRT2J3UkkxZGpQWFJrdGs4a1JTbUlUSCtHWVZKY3FVaDd6YnBweFRG?=
 =?utf-8?B?UnJDZG1UREtmZHQ2UFR2SDBBblplV0NDVnFCOWI1MTNCQkpNaURMc0xmVUZw?=
 =?utf-8?B?UWdybG5FSzV6MWhLcTZBZ2hidVA5N0ppQ05tS2h2V3phWVkzb0tyeTlVVHVP?=
 =?utf-8?B?SW9BN3lmOG9nMUp4NHp1YW42OVpoNGtaamQ2ZkVla0NzeFh0ajlOb2xGTVlJ?=
 =?utf-8?B?TS9oRXhnQmI5OEhzRWNPakxZdnZRa0Z5cVVaeTg5akdFT0c0K3J2UT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36be5ecd-92f2-460a-c426-08de59da4f6d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:18:50.4595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvdUv/yzGhqjBhdTXOnXfN2INOSWC75xl8EneMbUtRzLy148s3WITQRxJ3Rs/JBpij8RrSlYfpv9qeKJ3P6KWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6905
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.541];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AB5BA6B0F1
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 04:56:24PM +0100, Jürgen Groß wrote:
> Just as a heads up: a hardware partner of SUSE has seen hard lockups
> of the Linux kernel during boot on a new machine. This machine has
> 8 NUMA nodes and 960 CPUs. The hang occurs in roughly 1.5% of the boot
> attempts in MTRR initialization of the APs.

Do you know why you get hard lockups?  Is some watchdog triggering on
Linux?  Otherwise I think it should just be slow, but ultimately
succeed?

> I have sent a small patch series to LKML which seems to fix the problem:
> https://lore.kernel.org/lkml/20260121141106.755458-1-jgross@suse.com/
> 
> As Xen MTRR handling is taken from the Linux kernel, I guess the same
> problem could happen in Xen, too.
> 
> As the hang always occurred while waiting for the lock, which is
> serializing the single CPUs doing MTRR initialization, my solution was
> to eliminate the lock, allowing all APs to init MTRRs in parallel.
> 
> Maybe we want to do the same in Xen.

Hm, yes, I think Xen would be equally affected with regards to being
contented on a lock while updating MTRRs.  The MTRR initialization is
deferred until all APs are up, and serialized on the
set_atomicity_lock lock.

Regards, Roger.

