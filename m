Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8C7B2FC0F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 16:14:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088707.1446443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up62q-0007oo-44; Thu, 21 Aug 2025 14:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088707.1446443; Thu, 21 Aug 2025 14:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up62q-0007mg-1D; Thu, 21 Aug 2025 14:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1088707;
 Thu, 21 Aug 2025 14:13:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDER=3B=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1up62o-0007mU-39
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 14:13:34 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0190350c-7e99-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 16:13:27 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by GV2PR03MB9499.eurprd03.prod.outlook.com (2603:10a6:150:d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.27; Thu, 21 Aug
 2025 14:13:22 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 14:13:22 +0000
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
X-Inumbo-ID: 0190350c-7e99-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nt+Op2T0WpFY+afbPt0MFhSCVw88YmP+6F2qXTF1V1eZMc0A7na1qlxSzSjwXwTnd75h0mgcHYLirAH0EehDj4Y11wNQCgFN7mzTPRodNkfLmHLT1E8+GIRG+FCUx9bBDRJ3Bi9DK0RCbyNkFd66hwAMgafvXWucnzSuQ1Vx7foqYSg4slsx7vlBShY7zGh2D8733cNYNrJjeRTfE+PLoDAVmpCjzNjuJXAwcQaon5kLxHmYD5zB+1/NJE44OonAfqi5u7AwiOviroKGvuh9v2f8SY4IFnb68XMhvUIItucJfpupfgYIc59TqcCnkKrhO8qvogZrqnJt7SNvSej5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByHWbCQw1qr64D0awe/3ylho5kDseUdek9FFzu9zLuY=;
 b=TPKraM2uiC1pXlQ6Jt17jfePqEQLXKmUetJt6ngpxjgJ2egWTJXEL6lxi14gGtCURzCAqnDflo4D9VgalqrMMmuWPqWu7opz1prFq6myakwGThp5n0Vr0NLzrWuHg+h/84YxD5cZuAXHNXgtrDHbDOWvEbncXoMKJY5D894W7gtKuUWwkBiFMv49DsmfsGOsmGqKUWD15zO7q7P2RTKK6KJYTo9GaXIVL/N/LVudD+z3dIftzsSRjJmkKEvjripFKMPmnlcmIQAt1m6MnaC/kLIRGSfXyPpTizdJgez26FQRVKuqJvyKwPv9hc/U2BTUjz6vuLjleqyU8kzCm0FanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByHWbCQw1qr64D0awe/3ylho5kDseUdek9FFzu9zLuY=;
 b=F37Cpy8pU5TT0A2wkqbPdHlnRjJQm/1pEeocVeiFXeBiC7dhJQJ9d5puxjkOxHVVjBaH9lB6/AvzsWwB28bDPMyKSiudGHVLjqeJSzKxyOeLovtZbjbUPFprtQ7YFhCcbXZ/Bpi1DRCxwaUsgvLyTYAlQG2nu4Qj9z2gbml1ohOg91R1o4obPGX8MPEiR+u9pdLNQnkLs5nPWmO0D+xdRP5eUZ3QSGuIhQJHNzxMnPKlkTljSsH1EsXuyEgmWOlbNbTn883n6oeZqMPm/oqUdLG96KeUTyOMTi1B2/8uBinAB2MRA4er9n+EUVldmHIFr6SSmnqdSILb6fIfrsLA/A==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule 11.3
Thread-Topic: [PATCH] misra: add deviation for MISRA C Rule 11.3
Thread-Index: AQHcEaKMMDydbZiTjE+UNGKddouDNbRs1fAAgABSSoA=
Date: Thu, 21 Aug 2025 14:13:22 +0000
Message-ID: <159de776-d0bf-4f77-a6b6-670246eca85e@epam.com>
References:
 <d6a8682c98880d66ea99f882520b3defda0e3fe0.1755672275.git.dmytro_prokopchuk1@epam.com>
 <5199396a-685c-4839-b7cb-d32e3f4a0b48@suse.com>
In-Reply-To: <5199396a-685c-4839-b7cb-d32e3f4a0b48@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|GV2PR03MB9499:EE_
x-ms-office365-filtering-correlation-id: 6cd6bee6-4b10-4fea-5261-08dde0bce2fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RE10QWx3QSs1R21qUFZoczVCV0REeEh5d0JNSHlCMEJkMmVkbW8rVGFxZEht?=
 =?utf-8?B?dmpxcDltV24wK3NySldNKzBjL0ZYTHN6ZGxWM3Rid1phcno4UzN4K0JTb3ow?=
 =?utf-8?B?TWdiaEpIZkZ2a0ttaGp2UlF4dm8vSUtrVDZIMjd4ZzhQRXJQUnZYbExjRWVo?=
 =?utf-8?B?SFdyTitXQkd2SFFPdVZiMktCTUw1Qkg5TDVyT2RWTUFBN2dlRVRYOWdDdFE2?=
 =?utf-8?B?dHZ1RjcyRlZoV0tSZmtiSkdLSWJIMDRtMXF2alkrQTd0Tm9DU2ZrT0htZWtK?=
 =?utf-8?B?aW9qRHpOSk93VytMQlNxeC9pUkgzZm9YWThETVVXaEw5QzB6WXd1L0NPQjVO?=
 =?utf-8?B?K0pkT3BDSlNwZmcrU2hNOEFWdHJxRDJTeUlidmFiOVN6ZHdTQlV6M2Rua3Fr?=
 =?utf-8?B?dkxqSSthSUxNbmY4WEtZSVVtOXpJT1RCUTlSeS9hdzFNRyt6RTVjZkk4VEdz?=
 =?utf-8?B?WE16YS9NM3lvbjRzWkM4UTJ4ZDdOWWNxSkdNektpZnErUDU5QlVTTU5zemw5?=
 =?utf-8?B?UFVNVDZMS1lEVUdPQ0paRkhMb1hPQlk3b3o1K0NqcWtlMks0bEhVWFJ1TjVq?=
 =?utf-8?B?VGQ5bnhoU2Fza0JjMk9NQ00xdDdHcnBab1QzdmxsWU40MUxRaTZPNEQ1NE0v?=
 =?utf-8?B?dU9LRUFCSHNBN25EL05vRTFEZ1BXcDQxVldrTThBRGYzMkhyN2JydytkTXBH?=
 =?utf-8?B?SXlIV0hSOUk2ZGlSdkpaM1NPTkNkYUVwckZGYnAwTUpBNkZnQ0ZvYTFpdk5L?=
 =?utf-8?B?Z0dZWkRZYUV2L1g3TU5mOUE1M0gzYkJVcTJneGZscmZMb1pZSXI3N3V0ZERs?=
 =?utf-8?B?V0RIN3hFWHo0OVA3dGFPREkrd3pCWVRoZmQ2K09EaUc2T2RmbEZxc2xMV2FU?=
 =?utf-8?B?Um8wWk9PcmhkWnlINjFISm12ZUVxR3oxNGlkemtGcW9XMW9lSmRkVHR4UnZh?=
 =?utf-8?B?T0ZaS3Q0QWhXOThEVmorb3c0bXZqZDJ3SC9oQ1B2aFh5NTN4RnJDM21rVjBV?=
 =?utf-8?B?VTJxall0UlUyVlYrZFJBRnBvUVJyNHhTOXpIMkwwY2JZTFIvZWVDK3pCU2Fj?=
 =?utf-8?B?NG82eEpWdTNvNGhkZGszbUdvSnNKRW40aktVdGNjb2tWTDBGTVZoQU5GcFBH?=
 =?utf-8?B?VlhRNDVOSUFNL0pzeEE1L3E0Ti9ZNHJWcldNck5Gdkg5MGZUd09LdFRXUTJi?=
 =?utf-8?B?Qi9JVHYwdTRNS2ZpdnhIOFhDSmRXU0lhcm5FOEFxSTAxbmpra3RzRldONDZl?=
 =?utf-8?B?eWxwRForVUVoNkNSclFLSjY2YWRkeEJCSmRIWmI1QWNUTDFCYlBhTnpabUxW?=
 =?utf-8?B?MyttVFVFVkZETDIyakVVTStFajA1Vkw3T0ttbjRxRzc0Q0NhRGhlZDI0U0M1?=
 =?utf-8?B?OXlUK25Cb0pqSjR0RU03QjNGV1lva1hRSlRxQkMvVkJKNTJqaGs3a1pZNTR5?=
 =?utf-8?B?NXE1dUhrVi9ubnZidHdZMjlDS3hRcUhRdmNxbWNkTm1jUE9xY3ZTUmIwMXRx?=
 =?utf-8?B?NGxSMytRclRYL2R1U2VSOHRQMnJvenRKQWFhRlNVQURvakpLQ0EyLzJRYk9L?=
 =?utf-8?B?a1hIb045RkZVZnNjd1hUUHZ1UGVLWlRkeHZ1cTFvR01NR0tBTnpjRU5NcDJ4?=
 =?utf-8?B?eEcrSTA4YzVkNm9jdEx0cXNhM0N6MjNsS2Q0cm9iTnErWlE4SWYyMW1DaGJP?=
 =?utf-8?B?K0dXdW52U1JuVWhiZ1U3b00wbFRiR29MMUtFOUZDeUtqZk9McjZrUXhCKzR4?=
 =?utf-8?B?NldZSzc3NnJtTGUxakVrQWdQL2JVejJSL2dtQzBSQ2crM1d0dlRjN2dXeGdS?=
 =?utf-8?B?a1pWT1ZsUkRMZmxBWTNydTRuZ3ExUDdiUnBtV1ZhVSsyaG9kU3RaNThZMHlu?=
 =?utf-8?B?REZpTk1TZkFHZlZDWFJlWVRROWxQZlFSRUoxLzJJMlIwOUhyeEVMSHB5bDgy?=
 =?utf-8?B?RTJZdFpLMlFxeS9tS3JLYU5JeFhKOVJqRk9LVzBTSzhmYStYVkg5Q2dqNmZl?=
 =?utf-8?B?TEo0SGhUY1VnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UmN4TytTK1Eyc2dGckxEU1NtNVZTbTFBR0lxSmNRYTVDMTVaYVpXV1hCQzFr?=
 =?utf-8?B?RFo1THB1MVBuUjdlaldEdjY0VCtPdW96cmMxUlpmdm1TZ3VqM1pVZU9MZTha?=
 =?utf-8?B?WlJhSUYzc3lNR1pFYXNBVm9LeEpPLzJUNHdzVWJvMHRDcmZYbzdyOU1uSzVs?=
 =?utf-8?B?NnRuVjZwQmNCeHZwUVpBM1N4cnhta0tCVDhPNGt0UFdxaE5oL2x3MkFMLzJP?=
 =?utf-8?B?RUpjWFN6VWM4K3FDelZvcjZvcHhieDhjMWhpdExtUHR1cFZWKzF5c0RMSENk?=
 =?utf-8?B?YVNoQUhIZ09EUVNRNGl2NnFFQTI0NDh0TWlxS1MveTZ4VFcyYktGU1RZMDVI?=
 =?utf-8?B?eHpESHFuNFRMSHNaUHN1cXVmcnpVaVNsc0t3RjFmYVlETjJ3eWQwL0h3VTI2?=
 =?utf-8?B?amw0WjY0SllUUEV6TVcxUUZlYVFOU3pNU0ZOWW15eVBXUllIVXpHYWxLTUVM?=
 =?utf-8?B?MTcrcmlFc0g2ZitnWTl2RWZWb3hJQlduNFVwam1rbUp1b09pTHZuTXIzMEhS?=
 =?utf-8?B?NVRRMHVCR2Q3dnByRXpKcjRHSlpUWmlvTEpTUkxtK0pSbWhWT2lwcVltblNG?=
 =?utf-8?B?aVRBT1VkZDlKUVVneHBwUnR6Y0ptUExqelk1M2ZKQWJhcU5raG9hVjRWWTE3?=
 =?utf-8?B?L3FxUGRUVWhoUW5TUlVnOW1UL090VmR0OGNUaEl4Q2JSalA1dzN1VTBaQVdv?=
 =?utf-8?B?di80NlI4UU5tdmV2QTBiM2lQZHFVRmNlalA1YTNtRHBjL1BjVi92OVE0Q0Jm?=
 =?utf-8?B?cEdqQzN5L1JsV0ltaCsyVC9nUEJpbXFmY0lqdWx5Q05DUk9XbWZZRTZPdU84?=
 =?utf-8?B?UVozTENyM0pQTDlMZTlwWTlLWDI5RTFzdEpYWWJGYkhHb1o2bnIzR3ZtSWRF?=
 =?utf-8?B?MGVOUG1USS9sUExESFFORVNYTlEzekNOM2trMGZsUHkvaWR1SUtlVXFQTjJx?=
 =?utf-8?B?YU1XcXFYU05ndXptSTlUT1phSjBzbHFxa3V4KytFQ2djVUdEbWU2MThsdXd1?=
 =?utf-8?B?T3A0Ynp2cnprVTV3eEsyWHd3VWhqYVoyem5OemRQOXNYbjRSZWZNaWU1OW82?=
 =?utf-8?B?ZnhkMUwzRUtQeEI5RXpSYXhld1hubS8yakpGNXRkWWtmNWFWaUY5YkRNVjdH?=
 =?utf-8?B?ZytxejNWNXJWb0I2dHoyQmwwU0dtSVdsUG1oajRQbnJORFdFOEJaTGhORFFX?=
 =?utf-8?B?QzZubWd4UnB0MXZkTkZVY3dxUGNMZnMvTVVJRG5kbDlORkpZZ2J3b0NwTXh5?=
 =?utf-8?B?WVcyYm1JZE5UcFlXZGtuait6bWt1ZDBJczYyMGxaWURaWUxKeDBMME1Yek02?=
 =?utf-8?B?b3V3Nko2cUtpOWR5VDRzSUd1QXYrakxkYVJTUkx1VkhiVzF1OGF5K0NsQU9t?=
 =?utf-8?B?dU1XQWZ5a25TNldNbFQwQ2hOckxFWWRVZFJoWE9BU0NBM0dub1hEZkRIQXpG?=
 =?utf-8?B?QzZKTWsrVXIxNDVjMHkycFQyNDdXR1R1anFiaVlQTStYcVluRnF3ckJOOVhn?=
 =?utf-8?B?QWdDQ2NuR0NMMm9PV25CaitpQlZzcGxEMDNEVlN1Q3psdkVvUG1wMzNnT2My?=
 =?utf-8?B?MUFvRmIyQlVMb1pIQ2djSjV5UU1FR2VxY2UzNmliQ0VFVWN2RFhTSjF2eUJV?=
 =?utf-8?B?VTVoelFPOFZjR0U1YWlJZDBMaWVVR1J5aXVweHBxNElmbFpNbU9mSnBEbmhN?=
 =?utf-8?B?ZGtoRStOVk5qT1ZZdHdqMnhBdHdXdkhVaDh2RkRRTU9uK3hhOU1OT0FFVkhY?=
 =?utf-8?B?RHkzZXJxb2RpczBGTms2Z1N5MkppSUsvTWREUUlpTzRHVHI4aVRTRnppKzRW?=
 =?utf-8?B?KytzUnlSS2tsTVFDcHlIdXdFSlZyUVRNOEZIYk5xOW5kNUhmSGV4VUd1dTYz?=
 =?utf-8?B?M09sRFhLZE4zYXl5a2xpa1FNK2c3N2FrejYzNUlFSzNhdm1BYU02Q2dIZFh1?=
 =?utf-8?B?NCtQeEF6dEg5V3h2SGNYSTY2REV4d0VsNE90UXZOdVNkLytTV1JpdVozaXBJ?=
 =?utf-8?B?alFMekpKZU1JMm5sc1YyUHBwajZncEJ3OWd1R093bHZWbDl3MVV6SEpxTk0r?=
 =?utf-8?B?WXdtR3l2Znlydm5LK3B6cUNqaEt5b3Q3WWsrckpIUW5ZNWw1VWRYdUdUTW5F?=
 =?utf-8?B?QkREejA1NUp2UlBUdnR5TEVIZ3JTV3l4Q2Z3eGQ3eUZFVHFheG9wNW5xZzND?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50BD92532C083547854ADC2BEE8F815E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd6bee6-4b10-4fea-5261-08dde0bce2fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 14:13:22.2830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJq/p7Pi+mBF7P34Bmg0viEEjHdtAOBSDzqFqcdkDay1hIvjBtqDLANoTciWdwyWAlBOBhTyb2zAMJWyOGTXttYJq6RnmAKS+w5t6UUvkJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB9499

DQoNCk9uIDgvMjEvMjUgMTI6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOC4yMDI1
IDA5OjE3LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiBNSVNSQSBDIFJ1bGUgMTEuMyBz
dGF0ZXM6ICJBIGNhc3Qgc2hhbGwgbm90IGJlIHBlcmZvcm1lZCBiZXR3ZWVuIGEgcG9pbnRlcg0K
Pj4gdG8gb2JqZWN0IHR5cGUgYW5kIGEgcG9pbnRlciB0byBhIGRpZmZlcmVudCBvYmplY3QgdHlw
ZS4iDQo+Pg0KPj4gVmlvbGF0aW9ucyBvZiB0aGlzIHJ1bGUgYXJpc2UgZHVlIHRvIHRoZSAnY29u
dGFpbmVyX29mJyBtYWNybywgd2hpY2ggY2FzdHMNCj4+IGEgbWVtYmVyIG9mIGEgc3RydWN0dXJl
IHRvIGl0cyBjb250YWluaW5nIHN0cnVjdHVyZToNCj4+ICAgICAgY29udGFpbmVyX29mKHB0ciwg
dHlwZSwgbWVtYmVyKSAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4gICAgICAg
ICAgICAgdHlwZW9mX2ZpZWxkKHR5cGUsIG1lbWJlcikgKl9fbXB0ciA9IChwdHIpOyAgICAgICAg
ICAgICBcDQo+PiAgICAgICAgICAgICAodHlwZSAqKSggKGNoYXIgKilfX21wdHIgLSBvZmZzZXRv
Zih0eXBlLG1lbWJlcikgKTt9KQ0KPj4NCj4+IFRoZSAnY29udGFpbmVyX29mJyBtYWNybyBpcyBz
YWZlIGJlY2F1c2UgaXQgcmVsaWVzIG9uIHRoZSBzdGFuZGFyZGl6ZWQgYW5kDQo+PiB3ZWxsLWRl
ZmluZWQgJ29mZnNldG9mJyBtYWNybyB0byBjYWxjdWxhdGUgdGhlIG1lbW9yeSBhZGRyZXNzIG9m
IHRoZQ0KPj4gY29udGFpbmluZyBzdHJ1Y3R1cmUsIHdoaWxlIGFzc3VtaW5nIHByb3BlciBhbGln
bm1lbnQgYW5kIGVuc3VyaW5nIG5vDQo+PiB1bmRlZmluZWQgYmVoYXZpb3IsIHByb3ZpZGVkIHRo
YXQgdGhlIGlucHV0IHBvaW50ZXIgaXMgdmFsaWQgYW5kIHBvaW50cyB0bw0KPj4gdGhlIHNwZWNp
ZmllZCBtZW1iZXIuDQo+Pg0KPj4gQ29uZmlndXJlIEVjbGFpciB0byBzdXBwcmVzcyB2aW9sYXRp
b24gcmVwb3J0cyByZWxhdGVkIHRvICdjb250YWluZXJfb2YNCj4+IG1hY3JvLiBVcGRhdGUgJ2Rl
dmlhdGlvbnMucnN0JyBmaWxlIGFjY29yZGluZ2x5LiBBZGQgUnVsZSAxMS4zIHRvIHRoZQ0KPj4g
bW9uaXRvcmVkIGxpc3QuDQo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogRG15dHJvIFByb2tvcGNodWsgPGRteXRyb19wcm9rb3BjaHVrMUBlcGFtLmNvbT4N
Cj4gDQo+IExvb2tzIGxhcmdlbHkgb2theTsganVzdCBvbmUgbml0IGFuZCBhIHF1ZXN0aW9uOg0K
PiANCj4+IC0tLSBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25z
LmVjbA0KPj4gKysrIGIvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2RldmlhdGlv
bnMuZWNsDQo+PiBAQCAtNDAzLDYgKzQwMywxNCBAQCBiZWNhdXNlIHRoZSBzZW1hbnRpY3Mgb2Yg
dGhlICdub3JldHVybicgYXR0cmlidXRlIGRvIG5vdCBhbHRlciB0aGUgY2FsbGluZyBjb252ZQ0K
Pj4gICB9DQo+PiAgIC1kb2NfZW5kDQo+PiAgIA0KPj4gKy1kb2NfYmVnaW49IkNvbnZlc2lvbnMg
aW4gdGhlICdjb250YWluZXJfb2YnIG1hY3JvIGFyZSBzYWZlIGJlY2F1c2UgaXQgcmVsaWVzIG9u
DQo+IA0KPiAiQ29udmVyc2lvbnMiIChhbHNvIGluIGRldmlhdGlvbnMucnN0KQ0KPiANCj4+IC0t
LSBhL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9tb25pdG9yZWQuZWNsDQo+PiAr
KysgYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNpcy9FQ0xBSVIvbW9uaXRvcmVkLmVjbA0KPj4g
QEAgLTQ1LDYgKzQ1LDcgQEANCj4+ICAgLWVuYWJsZT1NQzNBMi5SMTAuMg0KPj4gICAtZW5hYmxl
PU1DM0EyLlIxMS4xDQo+PiAgIC1lbmFibGU9TUMzQTIuUjExLjINCj4+ICstZW5hYmxlPU1DM0Ey
LlIxMS4zDQo+IA0KPiBXaGlsZSB0aGUgZGVzY3JpcHRpb24gbWVudGlvbnMgdGhpcyBjaGFuZ2Us
IGl0IGRvZXNuJ3Qgc2F5IHdoeSAoZS5nLiAibm8NCj4gdmlvbGF0aW9ucyBsZWZ0IiBvciAib25s
eSB0aGlzIGFuZCB0aGF0IHZpb2xhdGlvbiBsZWZ0IiBvciBzb21lIHN1Y2gpLg0KQVJNOiAgODEz
ViAtPiAgIDE2Vg0KWDg2OiAxNDIyViAtPiAxMDM1Vg0KDQpMb29rcyBPSyBmb3IgQVJNICh0byBi
ZSBhZGRlZCBpbiB0aGUgbW9uaXRvcmluZyBsaXN0KSwgYnV0IFg4Ni4uLg0KQW55d2F5IHRoZSBu
dW1iZXIgb2YgcmVwb3J0ZWQgZXJyb3JzIGhhcyBubyBzaWRlIGVmZmVjdC4NCg0KSmFuLCBkZWNp
c2lvbiB1cCB0byB5b3UgKGluY2x1ZGUgaW50byBtb25pdG9yZWQuZWNsIG9yIG5vdCkuDQoNCkRt
eXRyby4NCj4gDQo+PiAtLS0gYS9kb2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiArKysgYi9k
b2NzL21pc3JhL2RldmlhdGlvbnMucnN0DQo+PiBAQCAtMzkzLDYgKzM5MywxNCBAQCBEZXZpYXRp
b25zIHJlbGF0ZWQgdG8gTUlTUkEgQzoyMDEyIFJ1bGVzOg0KPj4gICAgICAgICAgKGkuZS4sIGxl
c3Mgc3RyaWN0KSBhbGlnbm1lbnQgcmVxdWlyZW1lbnQgYXJlIHNhZmUuDQo+PiAgICAgICAgLSBU
YWdnZWQgYXMgYHNhZmVgIGZvciBFQ0xBSVIuDQo+PiAgIA0KPj4gKyAgICogLSBSMTEuMw0KPj4g
KyAgICAgLSBDb252ZXNpb25zIGluIHRoZSAnY29udGFpbmVyX29mJyBtYWNybyBhcmUgc2FmZSBi
ZWNhdXNlIGl0IHJlbGllcyBvbg0KPj4gKyAgICAgICB0aGUgc3RhbmRhcmRpemVkIGFuZCB3ZWxs
LWRlZmluZWQgJ29mZnNldG9mJyBtYWNybyB0byBjYWxjdWxhdGUgdGhlIG1lbW9yeQ0KPiANCj4g
QWN0dWFsbHkgYW5vdGhlciBuaXQ6IEhlcmUgYXMgd2VsbCBhcyBpbiB0aGUgZGVzY3JpcHRpb24s
IGl0IHdvdWxkIGJlIG5pY2UNCj4gdG8gYWRkIHBhcmVudGhlc2VzLCBzbyBpbmRpY2F0ZSB0aGUg
ZnVuY3Rpb24tbmVzcyBvZiBib3RoIG1hY3JvcyAoaS5lLg0KPiBjb250YWluZXJfb2YoKSBhbmQg
b2Zmc2V0b2YoKSkuDQo+IA0KPiBKYW4NCg==

