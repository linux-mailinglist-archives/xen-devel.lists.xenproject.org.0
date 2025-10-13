Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5AABD21E9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 10:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141857.1476020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8E4r-0006Ww-7e; Mon, 13 Oct 2025 08:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141857.1476020; Mon, 13 Oct 2025 08:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8E4r-0006Uo-4Z; Mon, 13 Oct 2025 08:38:45 +0000
Received: by outflank-mailman (input) for mailman id 1141857;
 Mon, 13 Oct 2025 08:38:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2iX=4W=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1v8E4p-0006Ui-4E
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 08:38:43 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 057a47d0-a810-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 10:38:41 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH0PR12MB8776.namprd12.prod.outlook.com (2603:10b6:510:26f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 08:38:36 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 08:38:36 +0000
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
X-Inumbo-ID: 057a47d0-a810-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEl8S8vcXYx7Rb9XFqGvItU65kfyKyxGHx7xLq3M8zMg4lIbIcSZ6iPsNCpWFY/3W4O4+1E7RKzT0dt2ytL1rgAq2JsLie8nJFlE6xgdnXVogGHPVgba1WBY3TRB59r8ibL2EY16RbvDlpFTJqRRAlisHIAqA+WIBCe0UDipQ6+GQWP8pXNW/IinTVQheKaIq5iIlxzhatKC6Z8btXlEqv4/9aelH5tafmIN+KuDmrJGXnAUv6+nTEvP6Mu8dpjQhslVj50coK9i9yrU/aeabkTRseW0Iky47+oFvrUh2UG8FLoaYfaIrmjBOKr71CRkbhW2rFdL+hKqID7UaQR65A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdqZ4j4VE/VBCmRYWbniGMMaL3JBfIPnc7SmqXk/2x0=;
 b=OVx3nzx+DvTSY5IPiwigg4CUURfZRRbcf37epRfwtr2lAAjhUsheKQqAlsVawWr5DRDabIAfJCcglNP4MSQCDNQcN4APjGdgbEhNaR8EJXjOETFoNWAOVC8uIPncv5E4kAgXU0whnaEsekcADSZtY8nK/M92PRaCBtet1LA+Uckrl9zWfv9MgcXrGKEfyGJQoxlviCbGSmzCT1rY6Obkx2pELO2sFwx/t3X8Ql9NLIijDegveMS3lYGE4Atza29BzG/r3P03Itw0fuqCwZ7EkDzsljNCT7YfayGOhvMiZD2+cPV978GoqoUEhALaXpZdXWMaxspt0WnzC5k6r/avrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdqZ4j4VE/VBCmRYWbniGMMaL3JBfIPnc7SmqXk/2x0=;
 b=xzQHdAMyxTwDrU/+RacdromRqTnnnyLRV1soCHhDNXmwrhZR3dO4pQKfHKUCKdsTvx+xIndXqT+ZsrCNcxhxtHnNmUKn6m7krdhf4aqjRlNmsmBxfvzd0Yqofokn+l84yMgRL/yrn/EvBLz3gkIMtO6AO/TLvoMM66bkH4pmTJQ=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v2 1/1] tools/libs/light: fix BAR memory address
 truncation
Thread-Topic: [PATCH v2 1/1] tools/libs/light: fix BAR memory address
 truncation
Thread-Index: AQHcPBVojxVVZQBbcUyvi85wGyhb8bS/wFyAgACGnYA=
Date: Mon, 13 Oct 2025 08:38:36 +0000
Message-ID:
 <BL1PR12MB5849505741557C092A3FD1F6E7EAA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20251013074533.67478-1-Jiqian.Chen@amd.com>
 <51d86c7b-51bd-4001-8af1-a52c76a20669@suse.com>
In-Reply-To: <51d86c7b-51bd-4001-8af1-a52c76a20669@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.9203.007)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH0PR12MB8776:EE_
x-ms-office365-filtering-correlation-id: 02996eb9-ff44-498c-2081-08de0a33e6e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?T1N2UFRBVXJPMjRtaEpmMVQ3Ly9iZ2R5STFGbGIyaVh5b3ZvQlczQk00WGtT?=
 =?utf-8?B?Rmk0S3F1RDdMbjNNVnQ3RFRucGdPdk13QVJjSmJVUDhBTVJtSURKc2c2TjJG?=
 =?utf-8?B?VjFmWDlpMXA1WDNCMWsvdk12NFcycWp5WS9yZ2lhREhkNm12WHU4enVjRldv?=
 =?utf-8?B?eTJIczJDaS9RUFZGbFZTNVh6M2tpOEVJTzRmbjRZVFpXUVBHMERFeFVWRHFX?=
 =?utf-8?B?N2ZyS2IrRk5EM2MyelFNaG9Ma2hZYlJheW15ajhJUG8yeDFrSloyMGYrdjE4?=
 =?utf-8?B?TFM0TTJMVG5jdlEwcytpWHRROUdRNThrVGVTUEw1OG5EWnVidkRUYjkzZzFq?=
 =?utf-8?B?N0hHbnk5T3cra3d3c2g3NHRLTDBJSHNhSkQvWW9qcHFtdXRLYVBzeGNoL1ZO?=
 =?utf-8?B?R2hHMGdFMEVXMXp5SjBxRnVEeGxaOERKV0pSTEREN0FCTFM0aWZkOWZwU3BI?=
 =?utf-8?B?aFg5V3Q3MkplaUhuNTh6MEVRTVVJclo2czdwSTI4VEtpOVZsa2ZVcEV1akFE?=
 =?utf-8?B?WitqMmZjTmRkT09sdXFFVS9VdktmZi9yck4zUGVqc2cwaW12akU4WHF5K2po?=
 =?utf-8?B?N2tuRC94MjVNUUlYYUJVL1ZuRjBVdVNnT05ZWHV0OTgxM2xvUnJRdytyUDVX?=
 =?utf-8?B?SnNoWlJva01HYmRuWFEzajVHNjZhZ0xDT29SRjY0eVhRbVBXOHA3M0NZS21p?=
 =?utf-8?B?SWdkbW5YSnhySDZvVTZBMXRPZHNQaFpKMXhYSVI5T0k5NHJPcFh6WUE2clJO?=
 =?utf-8?B?QUdtUCs1TDRiSnUwSUx6N252d2VuZC9kazZKUnVSTVFMZHRhVnN3YjU1REEv?=
 =?utf-8?B?M0ZyWnB6OVd1eEVBT0JpZUQvbFhyalFGSGZESkdQUksvazl4enNCSnoya0FM?=
 =?utf-8?B?Vzh6enJSZXh5YmVFZzB4bUpRSjRnM3JSMUFMYXU3a3ovdm5yVWpxOGM4a0Zz?=
 =?utf-8?B?aHk3aUFPSDg3b3BHeEd3emtzdWQzTTN6VXcrZzRYYUtDODFrQ1dVTGFpVzRS?=
 =?utf-8?B?VUJWNitEN3hieWR4NjRTa1FadWdJYkkvNi83VTRTMzZpNE93a0YzSXRmRFR3?=
 =?utf-8?B?QXBzRFdoWnJ0dnk4ZlNpT1labGcvVk1aUSt5RzJKYVNjdGJLdE5RNnpuUTJN?=
 =?utf-8?B?cEIvTDRXODJGajBFc3FxeExMZzRsUFlNSjJiRXJvRENhdnE0alhHKzNjOVM4?=
 =?utf-8?B?M2hDYm5BdURwUkhOT0ZEN1JYOXlSNnpDQXFocDVyQy9SUURxaUg2UFlWZCtH?=
 =?utf-8?B?VkhCdWdLdmUyTmNOMGRyUnR1UmRmd3E1TFAyd044dnZoUFdJekdVanBDdzNB?=
 =?utf-8?B?VnF5WmtHN1loS0pWaG5NYXhCUkZYWDJEQ2IwYWM4R1lXWUhhQWQvanhWUmc3?=
 =?utf-8?B?dzlOZUxMVWpkeUpWYmgvV2ZaeERZMHJNWHVjNjc3MHYvOFlqUStRTm15YXNF?=
 =?utf-8?B?ZFExOVJVYVFDNmcrTWhHVXNhbDQwZFRuME5WMmdCcFJoVFdFdGFsZHVZMXdV?=
 =?utf-8?B?dEIzazlKeEhkU29DTERRN3ZTeWpkTFRZZUZERTMxZFovWTZiOXpXWEdWQ2J0?=
 =?utf-8?B?T2F5cnFReHBhS2JYSjlJdFdkdDAyMnRXUkFWRzg5Q2pIeE0vcGZoN2dZbDN2?=
 =?utf-8?B?VSt1VG1DVXFrMHZ2M1QwWGhXR3QvVVEyQWUxelNRd2h5UFN3VWN2cE5RbDl1?=
 =?utf-8?B?Q3BBaTFBdS80b3BiWHVMeVdYcFJ3Q2x5ZkRzTUFQN0VwQWJSb2tDbmYxVEJs?=
 =?utf-8?B?S0xnb3pCMllmTjIvVjlyNGhyN3VhYXoxK3VXdXhxUXlsSkU3eDZXUzJOaVJv?=
 =?utf-8?B?bnNxaU1QMGFSa0M3bVhDYVhzZ1prL2szdFFiSHE3a2xIWElNdDJEZ0FpY2M0?=
 =?utf-8?B?Z1JPZVkzM1RjQ0JQcCtXVnhHY0lLdzFlTW1pazZmdFpJOWloZ3I0VnJyL1Mw?=
 =?utf-8?B?dlhwV3pXKzNCdGdWV0R6aHBXbGZqZFVsMHVMZXNhZ2EyRHp5ZTZLdkxkcDB6?=
 =?utf-8?B?SmFiN2hUM245TDFEVW1uT3JHSGNaMHBIWHIzVTkyOS96SWc0dTc2ZncxM1A3?=
 =?utf-8?Q?EusFrH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YlB2UVNRa0RvazkzVUpNUERhOG1kVDU5R0xhWFAzRTVjdkVkS0U2dEIzRFNF?=
 =?utf-8?B?NjRZRHNXZXNnclB3SjdHemcrMU5ycXFibTYvMFNkZ1BZVFNCek9LUmkxUVJI?=
 =?utf-8?B?eUFZZWthSHRldmZZbDVhNHZib1NIY2xGK2UyV3d1elFBcTkvOXBJd2pDOGY4?=
 =?utf-8?B?RGpReGtWdHBGcVlPY2V3cXRQUjlnODNTalJnY0FGdmV1ZEo0TWtJTDFoQWQw?=
 =?utf-8?B?NHBVRlFhSVJJSFlNdThNS2taWG5lWWlzdyt0WW5rQXNxT2ZtWUN6NS9kdnFV?=
 =?utf-8?B?NzMwVVQ3VnUzK0lUMVVkYjVzNXQ2UDZlcUhLcUVhc2VQV05TVmVPaVVEVUVq?=
 =?utf-8?B?ZStUSVhPTE9Kb0NlOVY0UGM0YUU1TU9zRU83Mlc1MThCajJKSkI0RURqQ3c2?=
 =?utf-8?B?SEg5Mm1jdW83Q3ZRYXNUbDFMN3hRUVpNMlplSHFodmFBSkhMUG0xRWNCTVFX?=
 =?utf-8?B?aTdpMFNVRzNnLzd0dXI2VG5QclMvaGNMdzJGcDdHa2RSSVkrWWhaNUdsNGJ2?=
 =?utf-8?B?clFjVDI1Z2szVnVQc2tFTGdwZHBVcGhSRWR0azN5S2hvTURVcnFnZ0FtZXcv?=
 =?utf-8?B?QUVObjFzN2E2ZE9hMkV4aVFheVg2S3NNaDl3Ym9uMzhXMEsxK3NvNVFjcVFF?=
 =?utf-8?B?M0lBY3k5NUp6Qmt0RnJaQTJ5NzNPYWU2QjhHQ3dvTHlpdXYzUXFvaC96NW9T?=
 =?utf-8?B?Z2czWlN0dkg2anlNOWNITkJGU2FGLzgyUUEycXgzZUFVcjJ4eHVFNURHVlhK?=
 =?utf-8?B?ZWpyUmlNNlRyVHhCeU44UTJqRjgvamx6WUdWVGNHUzdidVFtb3RWeSsrcXBw?=
 =?utf-8?B?VjVsUTZpbVliSWxoNUNpbzNFZ1BERE0wTUdjUG1QZnF1T1hYODlpMllpdWxH?=
 =?utf-8?B?R09BUzM0K0d5bzdyMmJjRE41cHhrUWIxMkpVRzFFOTZQcUdsZS90dkZuSnYw?=
 =?utf-8?B?WlBXNit5WHFmR0VWbDgwMFVWRkp6cWNiNXFKWEJYU1RpdlE4WTJXaDc2dG0w?=
 =?utf-8?B?TWtrNnl6QlZSVG9ieXlrTjF4NGljNUFVZWFXRjI5dm1FWmVtN2VYSjU5eUVZ?=
 =?utf-8?B?WEdFWUc2eXQveStpYzRZRFc4NUhJcnp4Um1zby9VazM1bitldnRKcjZGTHVY?=
 =?utf-8?B?ZUtLR3pzbkJNNTJHUnVlM1VUZ3JEWG1ZMTRKQW1TV3NnejJoSWVCdzdpeWV0?=
 =?utf-8?B?dWllSEN5bHhNaC9wNjRtNzRVL1NPRkxyM1NteTNJbVhHM095Q3lVTHE5WnQy?=
 =?utf-8?B?MWVLSThhd0pWZEJyem16QzVQbTJaV2tQeGltSC82YTlWbzZmN0cyUTFsaXBv?=
 =?utf-8?B?SGNyTURFYTdDdktGdVF6UTduVExSR3duUmQrenpKTHZFQjRMSnV4RXlFOEg5?=
 =?utf-8?B?cWRlYU9kaUJRbmh0dkF1dnlDMktBeXVmZnl1cVBEWkJjN1FWYU9kVkVMODJm?=
 =?utf-8?B?YVR5Y2o3M2ZVNW14STN2Ti96Vy9YcENCMFU1dkdwVTR4MWgyazBlejVHYUNP?=
 =?utf-8?B?emoxb2IxT3B2QTA4Zm5SWGVmVldYQ0dsK3ZXVmNzRXFHZWNmWmNRbUJTeURj?=
 =?utf-8?B?bmxiZG5LbmMvd2FQdXFMREt2Nk1aS2JlUGhBMTYzaG5xQWpQUnkwRDNiZHhi?=
 =?utf-8?B?T1A0KzAwak45emtOa0IrZ2FSektwbklNSGFiRHNsT3F1ZEl1azJNT3dZdFE5?=
 =?utf-8?B?Y04wR0hXc2V6VXRxVit5MzlCNFZiamZxcEw5THIyS3JiUGpvWXdBOVN3QTBp?=
 =?utf-8?B?SmpTQjFrY1ppNzNxYllRa1NTUHRMWThOQ3V1Z3RtMjZlWldPb1FkYUxCdTky?=
 =?utf-8?B?ejNacHF1TjhSVjFFZ3YyWjcranBzRWdjMVFxWExnaENhM2l2bnA4RUFaSTRw?=
 =?utf-8?B?eENqRFlrTDFyM0pzeTAvcFg2SE5ZaDR3RlRJK1lBOTIwWG9iM1pnckJ4dWlw?=
 =?utf-8?B?V0xrWHpXTTRsL2tTbGtWaU5tVDh3UDNvbERya2RrVjg5MXFQOUw5dkFZWW01?=
 =?utf-8?B?eFpPOHBxWnRzalh1cmxJdFc2dlEzd21LZGN2T3krSW1LS0NINGcxQllZUDhS?=
 =?utf-8?B?TVdGa1ptMHZnQWhIT0toYU4yeWZzczNnczA0NnpOSFR2SHB2c3JCbW9pT1Ey?=
 =?utf-8?Q?JkCk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2FCEAAEC9CF824AB94749EB91C4627F@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02996eb9-ff44-498c-2081-08de0a33e6e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 08:38:36.6615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xv5DiPePZNizKs2T+4gfYD1DUXbD+gqYL/KzFP4ZKaZ/3u67rj3A7+gz1iaPqahVZy9p3/VwNM7/pmMT8kZytA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8776

T24gMjAyNS8xMC8xMyAxNjozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEzLjEwLjIwMjUg
MDk6NDUsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gQEAgLTIwMzEsNyArMjAzMiw3IEBAIHN0YXRp
YyB2b2lkIHBjaV9yZW1vdmVfZGV0YWNoZWQobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICB9DQo+
PiAgDQo+PiAgICAgIGZvciAoaSA9IDA7IGkgPCBQUk9DX1BDSV9OVU1fUkVTT1VSQ0VTOyBpKysp
IHsNCj4+IC0gICAgICAgIGlmIChmc2NhbmYoZiwgIjB4JXggMHgleCAweCV4XG4iLCAmc3RhcnQs
ICZlbmQsICZmbGFncykgIT0gMykNCj4+ICsgICAgICAgIGlmIChmc2NhbmYoZiwgIjB4JSJTQ054
NjQiIDB4JSJTQ054NjQiIDB4JSJTQ054NjQiXG4iLCAmc3RhcnQsICZlbmQsICZmbGFncykgIT0g
MykNCj4gDQo+IFRoaXMgbGluZSBoYXMgbm93IGdyb3duIHRvbyBsb25nLCB3aGVyZSBpdCBjYW4g
ZWFzaWx5IGJlIHdyYXBwZWQgKHVubGlrZSAuLi4NCj4gDQo+PiBAQCAtMjA0MCw3ICsyMDQxLDcg
QEAgc3RhdGljIHZvaWQgcGNpX3JlbW92ZV9kZXRhY2hlZChsaWJ4bF9fZWdjICplZ2MsDQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemUsIDAp
Ow0KPj4gICAgICAgICAgICAgICAgICBpZiAocmMgPCAwKQ0KPj4gICAgICAgICAgICAgICAgICAg
ICAgTE9HRUQoRVJST1IsIGRvbWlkLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgInhj
X2RvbWFpbl9pb3BvcnRfcGVybWlzc2lvbiBlcnJvciAweCV4LzB4JXgiLA0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgInhjX2RvbWFpbl9pb3BvcnRfcGVybWlzc2lvbiBlcnJvciAlIyJQ
Ukl4NjQiLyUjIlBSSXg2NCwNCj4gDQo+IC4uLiBoZXJlIGFuZCAuLi4NCj4gDQo+PiBAQCAtMjA1
MCw3ICsyMDUxLDcgQEAgc3RhdGljIHZvaWQgcGNpX3JlbW92ZV9kZXRhY2hlZChsaWJ4bF9fZWdj
ICplZ2MsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMCk7DQo+PiAgICAgICAgICAgICAgICAgIGlmIChyYyA8IDApDQo+PiAgICAgICAgICAgICAg
ICAgICAgICBMT0dFRChFUlJPUiwgZG9taWQsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAieGNfZG9tYWluX2lvbWVtX3Blcm1pc3Npb24gZXJyb3IgMHgleC8weCV4IiwNCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICJ4Y19kb21haW5faW9wb3J0X3Blcm1pc3Npb24gZXJyb3Ig
JSMiUFJJeDY0Ii8lIyJQUkl4NjQsDQo+IA0KPiAuLi4gaGVyZSwgd2hlcmUgd2UgcHJlZmVyIHRv
IGtlZXAgdGhlIGVudGlyZSBmb3JtYXQgc3RyaW5nIG9uIGEgc2luZ2xlIGxpbmUpLg0KPiBDYW4g
bGlrZWx5IGJlIGFkZHJlc3NlZCB3aGlsZSBjb21taXR0aW5nLg0KWWVzLCB0aGFua3MgZm9yIGhl
bHBpbmcgbWUgYWRkcmVzcyB0aGlzLg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMs
DQpKaXFpYW4gQ2hlbi4NCg0K

