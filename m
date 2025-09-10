Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F5B51288
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 11:33:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118022.1463957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHCC-0004Y7-Vq; Wed, 10 Sep 2025 09:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118022.1463957; Wed, 10 Sep 2025 09:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwHCC-0004VL-TA; Wed, 10 Sep 2025 09:32:56 +0000
Received: by outflank-mailman (input) for mailman id 1118022;
 Wed, 10 Sep 2025 09:32:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=golU=3V=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uwHCB-0004V1-PB
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 09:32:55 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20610.outbound.protection.outlook.com
 [2a01:111:f403:2408::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2084df31-8e29-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 11:32:54 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 09:32:51 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::53da:e77e:261e:5a29%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 09:32:51 +0000
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
X-Inumbo-ID: 2084df31-8e29-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPHCFuf/asx4+a4YnMVqwtXtP4BHfyMSjll2ypvPyUEoVD2wQ+ftftDRpImXvxylU+QbN3TGM7NzcZnbRML+YCIJ67hCkojhpRgEIhAZm2WOUOruiv/ozlkloLotak7fRxNdWs58J9688Dcc7euegZv+yiQUX/uXUx6CQ9QyF+TNZBz/mjM4j0fnJlxLaMWtGHKRt8vk1CrEfUQT2Jc0ea6igxcnmu3o6uZ3FoDpgwuxzx3Lwixcr7129aQ+yZUTD6CZ7cCwdYz0tbLVz9wnbTlPVo+YCUPo5rruseYZ/7rfeUnX5OZmhUeobrDvoufXUIYo6er0shvb8GfCVMmFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1o4j0Ytf2SjFcRqQYzprcFxqQ7OlSGMvjpcoWcHEJM=;
 b=CzkLToqXT8cN/CqQwqQXLUAgxCtHPxaXMq49Tfs9TEjaxpe1iCUbjjSx/eQx1JDgwHRYHo6ZxObilxCrO5rb0qCs+/gK/0zDosL8EANqN/ewmEgDU1nkRTv+T5crV7h9weK+TSgyL7iHk9H8B3NqL/GFBNbjOnlaOqeYKsKA9z4nKKGZQxZVBaI/zZOeNg7gd+7EIvi40zVkUdM4OCKUOcwkHjSLbmg2F/qxOzM4XAt7U46P/Pvqpbno3G9ooK9Vo1NjM4nXOrzSGaqMKlzskP2KaIJtW6i7AvYq2F09mUBzhwu07O6j8Jwh/bJ0iDWTkV9JTnU1hfkYemOQMc7VIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1o4j0Ytf2SjFcRqQYzprcFxqQ7OlSGMvjpcoWcHEJM=;
 b=EEnimU6odWiJhgRz2APYCvRjUqSdXut8hQlIOzUCjwmdowYT/8IpLE2S0ud4Zf9qSYV06SdUUBLF2LwwzRcqFipG2P//PM99SPsw2oYyOD/WmqoDvs63PIDp9L6q4lmKRkY4pOyw/+ORX1qM1O031zmTKM6PWzhJ3U5C0em3QFs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v11 3/5] vpci/rebar: Implement cleanup function for Rebar
Thread-Topic: [PATCH v11 3/5] vpci/rebar: Implement cleanup function for Rebar
Thread-Index: AQHcCDsA6l8/pQuZ6kGf8SCBPZt3IbR5jRyAgBNS/AA=
Date: Wed, 10 Sep 2025 09:32:51 +0000
Message-ID:
 <BL1PR12MB5849CC537DC9DFD2ED8F9A2AE70EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250808080337.28609-1-Jiqian.Chen@amd.com>
 <20250808080337.28609-4-Jiqian.Chen@amd.com> <aLF_VWs-njIzLk7e@Mac.lan>
In-Reply-To: <aLF_VWs-njIzLk7e@Mac.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.9094.017)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA3PR12MB7976:EE_
x-ms-office365-filtering-correlation-id: 8330883b-a51e-46b7-5582-08ddf04d0337
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SWYzSGY5akFsKzlNbGE1QmZocmExV2ZpS2k3WGtDVkZNbmYwY3MyRU0zc2FX?=
 =?utf-8?B?a01RNnNKNkh3a2JGaFFMVkNaQzlRanBlRnRXMExTSlFiWnZqUVkxZEJmcEsz?=
 =?utf-8?B?bXc0V21zaW4wb1FkbjRXUmJ5dENrSVVXUktESHNWRUtuTmRHRTgxTzFJclBh?=
 =?utf-8?B?NUpQRTR4WGZic1Njc1BHRTFZeEtYUkVHYUpwT040R0tVWDdFTDRPcGljY3Zh?=
 =?utf-8?B?dklMM1BVWEtOeHFjdUc1bUZIYkp3OGhKcy9vek56N2tPKzRzNXFXTUZtMmFW?=
 =?utf-8?B?MmE0T2F4M0QwQTdyUGh6Z1NGVi9Cb1k1Mmx5b0k4d3dXa2NjOWRnMXl5US8r?=
 =?utf-8?B?SnNDZHlHSUNRNVRybFdja2dCWktuNU1VRTBJS09PWTc3LzBIcGlIM3dDa3pz?=
 =?utf-8?B?SkY2bWd3RDdJRjU2RXNGdFNzQ2NVb095VkJxWitndW1Na1lSeEM0YmJEZzFr?=
 =?utf-8?B?MEJVaXorR0lpcWxFK1EvNU5GQ280Z05wS2s1alNPUDIra21VVEE1MXBUUGp4?=
 =?utf-8?B?eXVJS0hMSzAzeHFMRlVwcXZNUXJUbkFwNk5seGtNMWpOTlRFcHd5WE50aVZB?=
 =?utf-8?B?Q1RLM2N6NVhyUmp5NWlvNEF2MGlrWEg1MjFnT3hwcHBsY3l5eWl3SzA3cU9l?=
 =?utf-8?B?ZHJmak0zTTBpL2VPZ2ZRM1hOdWlwdzdKSXFTQ05oSGplaC9UZGlyblZPWktC?=
 =?utf-8?B?dFNCU0ppUGdYQmYwL05iTFMzUkxjQWsxancyaVNCMHJmejE0ZFlCVS9sQmdF?=
 =?utf-8?B?VEFuaC9aUGxKNjR2bjQ0WGRxZ0lNQWs1YWQrZnQrWWFmS0lIeFpscDZrRDRo?=
 =?utf-8?B?emxWa2xrOC9CZXo2MnVHakdISm1nNytkZThha0ppZ0FEYWNTMlI0Y2lYZ0FL?=
 =?utf-8?B?TndvRDNPMTJQOS9CbzhwUllPc1RJTG1Ici9xQVVQUlRsYWdBb3Rrci9QU3cz?=
 =?utf-8?B?N3M0Z3VmaDRqTW04MVI1T3JBb2RqU0NUa21ZemN2eVJsK2g4YW1ZRXJuV3c2?=
 =?utf-8?B?U0dheXd2alBUNHlCT0pueU9HamVwaGsrRHlBOVRLK0Zvd3daR21wY2JIWmFB?=
 =?utf-8?B?TjE3TUI3c1pJd3V3NGlVUHJjclVLTzRvRzd4aDk3bkNsY1hNM2t1enhCYitp?=
 =?utf-8?B?cUY5QmUxWU9PVDRycEVUSDVjTFNwT1dhS3hBeWJnWktsa0liVDFLeXI5b0lQ?=
 =?utf-8?B?bmZjRXdTWGVHUlhFTlkrZi9EZlBodEFhVGpwTlJzMzVnTHZvTVl4QzIvd1k0?=
 =?utf-8?B?ais5akdvK1JYRlRhTHpNRERsMERzcUJJVEttejdRa0YrTVA5cG5QRjBWMk1x?=
 =?utf-8?B?aDhFMG9yeXU1QlFwR3laNENmMlk0ak04WmU2c0J2RzI4UnNtbUIvMUhHdStV?=
 =?utf-8?B?Ymp5MFFPT1k0ZnlSQnBvQlVpSTZwL0I3OFAzekJRb2VDZGtGYk01WmtGUTNJ?=
 =?utf-8?B?OGUvNzhZUDA1U2t3enFXQUhYb29oSDgwWGZlSHpuODlQZ0NzNW1iUFBnTVkz?=
 =?utf-8?B?dVR5NVZrblBFbTM4cGRhbkUvS2hvOGNuS1N0amlSdWNCWmQyczRmaHFMUXVG?=
 =?utf-8?B?Zm9EN3lsK0Q5dkVkTzZMM01xOVdOMGczS21mcThlNEpqVjBQUE1RY3VuUjF0?=
 =?utf-8?B?VFVjR1cxVDhKMVBzSDRhNWlSRHFaK2NyNTFuaGxFTElrb0Z4cEJHQVRvWEVK?=
 =?utf-8?B?bkcrR0pERndhYTJ1TVI2SC9KMTk4ZVMvdGI3c1pXTmQ3NWJhZE81OWpqTEVs?=
 =?utf-8?B?eENvMGFsZDYzR1dVTGZXbDZ4TGhTQ3ZvRWhReHBGUFZtdmVQMnV0NVNyMldG?=
 =?utf-8?B?N2hDTVkvV2dMd3p3MVdxdlg0RUFEd1ZFVjFXT2lSQnF2VWhFNWkweDhoeXRP?=
 =?utf-8?B?bmxxTUlYV25FbUFZdGsvV0hQSDdXZ0VsZ2l3SFlXMC9NYzlqb1gvZkEvMmtv?=
 =?utf-8?B?Umc1MHJTRXNRbit1eVhDTkx4cFhodC9wTXlmTU8rd1dReFhwU1lwUnA5VnZy?=
 =?utf-8?B?elIzZjhWbGhnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWJWSmc2Qk1QL1A5UENGT2VCRko1KzVtREl3WnhkazZxWWZMQmZJaG1SWXZO?=
 =?utf-8?B?SWwyZjFQZGJ1NDMxSVJTMDBpU2FZcnRRRk45ZzN0SHYxelNUK3NpWEQyU28y?=
 =?utf-8?B?QjFOSnl5R0E3M0dSWnZtWUk3alVHbGM4L2VUc2hRYXM0VHY3WWs2eWd4elhJ?=
 =?utf-8?B?ZkNPMmtTejR1QTZPNXZUbnRCclF4SjNlcGJITjlLT3BrZitrOE15ZkJMRXpD?=
 =?utf-8?B?c29QVnVJd2JNdDY5MG1PT3hKSGFMVGdwZmRsdVRjYitrMHBOa1JQVFJST1Vz?=
 =?utf-8?B?WjRIRUVrTnpuSFhMbmRWdGpzSGVlczJ5ZWxoQXAxMnVnc3BYeEpQNDhIOWo0?=
 =?utf-8?B?WkhtUkRzZVRGLzcxZzZ5TkdlQnpzbTl1enZnOWszTFkycllwNEYwR0M4Y0JF?=
 =?utf-8?B?T293TloyL3FPOU1UVm5VLzNKdktaS3JyYU5uQy9UWGxtcGJTcnhBNXdGeXQz?=
 =?utf-8?B?T3U5Y0JOOWNGYXpVTW0rRVlqcE5UZzZ5RjlwYTczcmpaYllVbXU5Z25xTFJn?=
 =?utf-8?B?NFBvU0Y4Zld2ZzVPSHA5WTlDaFJMV0t0QmFvOTZXRHlQSzVHT0RnZ09PRFJs?=
 =?utf-8?B?bFQ4Zy8yaFhHR2lJL0pvRGRpTTRNYnlXTVhNcG9vNVJTNndDMWpWRzBsSHBx?=
 =?utf-8?B?c1J2azBGWE5XOSt6THUyRWxmcURwMTNGRWp2YnVTU2tyb0sydHlJMjRRRDlj?=
 =?utf-8?B?UkdwbmJyTWdsV1paUWRvMlp3KzlwczBFMEU2Z3Y4d2diUjg0UzNIZXprVVZN?=
 =?utf-8?B?Y1FtQ1pzT2xLU0hpME93NHJMNVpVUE9SU1FwWlFrNWRBaFZsb2lJbk43R1VH?=
 =?utf-8?B?b1RGc01MTlFaUXdBajlvdUZVTHJMT3pzTmkyQ2JPS2NydWJKSmhmdSttdlk2?=
 =?utf-8?B?NWlFMzlVemVpTzFUdWtZUTkzUTV3ZmU0RW1TOXFVRURqZmdaT0s2QWpqVjZW?=
 =?utf-8?B?MXVIcFBiVWFpUWJEU25BYkdIUlUxdk1JNVoya2dKcFhoVGh5eGg3TDc2L0lE?=
 =?utf-8?B?aTRCbDRZVUVXRzVQb0xRRDZITGpKR0ZvWm9JZENIOXZMZm9DOHNmYXErTTdl?=
 =?utf-8?B?R1QxdUkrRk1yQy9YV04xUUFnVXdPckxNMFl1ODBnSkNhaTRZbER3TXFTRUYy?=
 =?utf-8?B?QjFxL0V6eHlDK09xSzZaS0hiZ285WC9nQTFxRmxNTGx3ajdVSjBOREhoK1F6?=
 =?utf-8?B?R1V6bDB1R3hOK2JCL2ozcUt5RnFpS3k3eVZRUFd3d1BSMzNaOWw3SGt3ekJC?=
 =?utf-8?B?cy9nUGR0TUVWVi82ZXFnK29vLy9HSStjSVNEamF5RmlyWXJwTXpmcXBDRjRT?=
 =?utf-8?B?QmxBdXVRT05WNUZtV21rT3FsdytiZnlNazNKSlFVNEgvSnFENzNOSmw0ZU1L?=
 =?utf-8?B?Q1VYY1lkbWV3cExHelRKWVR6MDdkM213NkxTUlV6V2FqOGtyNmR3R2RTRWtn?=
 =?utf-8?B?SWFqSGRFSmJFeVVqMXEyc0RWQXBlT0hQaXJUbi9vSklGT1VXQXlBTmEveGx1?=
 =?utf-8?B?czFHU1p6WmNHVi9lVXlEVE1TNFR5cFZ6ZE1za2NTUm1pR25LQ0lUcEJqek9t?=
 =?utf-8?B?cSt0UmhtQ0pFUVZadHNZYVRqYjdHMG1lUGdjaHcvWGZzSmhVT295ZTRuWFY1?=
 =?utf-8?B?R1RkVjhmLzI4elJQcnk5MkxjWDEwRGY0czMySUlYK3JkazJhYlBWdWZERVVD?=
 =?utf-8?B?ajRXbytLcEZyaDlmbU0xOUV5QU9IVTZmMTVhWEFHRWF2RkR2QmNlOG1DeWp6?=
 =?utf-8?B?Y3BjOUV2dmw0OHkrTDUwc0JBUmRtaTlWUHhEcmEyTVFFQ21WYTIvWkR3NEZS?=
 =?utf-8?B?ZDlHd3QrY0E2RTluWngzN2ZPYmlVazhCVTJzMU0wb1pRaWFhcktBU3Q3dkM3?=
 =?utf-8?B?d0VKR0dwNzFLZVhUZUVTNC9ubkxvbEFIbUhsM3hjdnQyNEJYc1pGby9OQnJn?=
 =?utf-8?B?T0F5WXBVTHo4THRBU0pFb0tPRlJtRGNTMzRWU3ZTNjlETW00VjBTSyt1VUhD?=
 =?utf-8?B?ME12YkMybzFjQUpFSjNnbUJYeVpVTlBwYWozdTNkTjllWExXZUo2bk40U0lC?=
 =?utf-8?B?Mm5saWFZbFZVeEhkY0E1QVV1eXEvYzE5aVFRdnRrYlQ2ZGxVdnhLRnhUSXor?=
 =?utf-8?Q?HkrM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A99D22ADA17014448B1AFBAFC75CC46C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8330883b-a51e-46b7-5582-08ddf04d0337
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 09:32:51.3378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CwvBg4wAdSwc0aFl/79J6TooWCBz8hoobQFdKVpA/21HHxN23RjSetutD9JUevaH496RuxgcpQEphjk9nZOo/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976

T24gMjAyNS84LzI5IDE4OjIyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmksIEF1
ZyAwOCwgMjAyNSBhdCAwNDowMzozNVBNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFdo
ZW4gUmViYXIgaW5pdGlhbGl6YXRpb24gZmFpbHMsIHZQQ0kgaGlkZXMgdGhlIGNhcGFiaWxpdHks
IGJ1dA0KPj4gcmVtb3ZpbmcgaGFuZGxlcnMgYW5kIGRhdGFzIHdvbid0IGJlIHBlcmZvcm1lZCB1
bnRpbCB0aGUgZGV2aWNlIGlzDQo+PiBkZWFzc2lnbmVkLiBTbywgaW1wbGVtZW50IFJlYmFyIGNs
ZWFudXAgaG9vayB0aGF0IHdpbGwgYmUgY2FsbGVkIHRvDQo+PiBjbGVhbnVwIFJlYmFyIHJlbGF0
ZWQgaGFuZGxlcnMgYW5kIGZyZWUgaXQncyBhc3NvY2lhdGVkIGRhdGEgd2hlbg0KPj4gaW5pdGlh
bGl6YXRpb24gZmFpbHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlh
bi5DaGVuQGFtZC5jb20+DQo+PiAtLS0NCj4+IGNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPg0KPj4gLS0tDQo+PiB2MTAtPnYxMSBjaGFuZ2VzOg0KPj4gKiBBZGQg
QVNTRVJUX1VOUkVBQ0hBQkxFKCkgd2hlbiB2cGNpX3JlbW92ZV9yZWdpc3RlcnMoKSBmYWlscw0K
Pj4gKiBXaGVuIGhpZGUgPT0gdHJ1ZSwgYWRkIGhhbmRsZXJzIHRvIGxldCBSZWJhciBjdHJsIGJl
IFJPLg0KPj4gKiBSZW1vdmUgUm9nZXIncyBSZXZpZXdlZC1ieSBzaW5jZSBwYXRjaCBjaGFuZ2Uu
DQo+Pg0KPj4gdjktPnYxMCBjaGFuZ2VzOg0KPj4gdjgtPnY5IGNoYW5nZXM6DQo+PiBOby4NCj4+
DQo+PiB2Ny0+djggY2hhbmdlczoNCj4+ICogQWRkIFJvZ2VyJ3MgUmV2aWV3ZWQtYnkuDQo+Pg0K
Pj4gdjYtPnY3IGNoYW5nZXM6DQo+PiAqIENoYW5nZSB0aGUgcG9pbnRlciBwYXJhbWV0ZXIgb2Yg
Y2xlYW51cF9yZWJhcigpIHRvIGJlIGNvbnN0Lg0KPj4gKiBQcmludCBlcnJvciB3aGVuIHZwY2lf
cmVtb3ZlX3JlZ2lzdGVycygpIGZhaWwgaW4gY2xlYW51cF9yZWJhcigpLg0KPj4NCj4+IHY1LT52
NiBjaGFuZ2VzOg0KPj4gTm8uDQo+Pg0KPj4gdjQtPnY1IGNoYW5nZXM6DQo+PiAqIENoYW5nZSBk
ZWZpbml0aW9uICJzdGF0aWMgdm9pZCBjbGVhbnVwX3JlYmFyIiB0byAic3RhdGljIGludCBjZl9j
aGVjayBjbGVhbnVwX3JlYmFyIiBzaW5jZSBjbGVhbnVwIGhvb2sgaXMgY2hhbmdlZCB0byBiZSBp
bnQuDQo+Pg0KPj4gdjMtPnY0IGNoYW5nZXM6DQo+PiAqIENoYW5nZSBmdW5jdGlvbiBuYW1lIGZy
b20gZmluaV9yZWJhcigpIHRvIGNsZWFudXBfcmViYXIoKS4NCj4+ICogQ2hhbmdlIHRoZSBlcnJv
ciBudW1iZXIgdG8gYmUgRTJCSUcgYW5kIEVOWElPIGluIGluaXRfcmViYXIoKS4NCj4+DQo+PiB2
Mi0+djMgY2hhbmdlczoNCj4+ICogVXNlIGZpbmlfcmViYXIoKSB0byByZW1vdmUgYWxsIHJlZ2lz
dGVyIGluc3RlYWQgb2YgaW4gdGhlIGZhaWx1cmUgcGF0aCBvZiBpbml0X3JlYmFyKCk7DQo+Pg0K
Pj4gdjEtPnYyIGNoYW5nZXM6DQo+PiAqIENhbGxlZCB2cGNpX3JlbW92ZV9yZWdpc3RlcnMoKSB0
byByZW1vdmUgYWxsIHBvc3NpYmxlIHJlZ2lzdGVyZWQgcmVnaXN0ZXJzIGluc3RlYWQgb2YgdXNp
bmcgYSBhcnJheSB0byByZWNvcmQgYWxsIHJlZ2lzdGVyZWQgcmVnaXN0ZXIuDQo+Pg0KPj4gQmVz
dCByZWdhcmRzLA0KPj4gSmlxaWFuIENoZW4uDQo+PiAtLS0NCj4+ICB4ZW4vZHJpdmVycy92cGNp
L3JlYmFyLmMgfCA2NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+
PiAgMSBmaWxlIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3JlYmFyLmMgYi94ZW4vZHJpdmVycy92
cGNpL3JlYmFyLmMNCj4+IGluZGV4IDNjMTg3OTJkOWJjZC4uOTFkNTM2OWQ3NWUyIDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9yZWJhci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92
cGNpL3JlYmFyLmMNCj4+IEBAIC00OSw2ICs0OSw1NyBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBy
ZWJhcl9jdHJsX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gICAgICBiYXIt
Pmd1ZXN0X2FkZHIgPSBiYXItPmFkZHI7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyBpbnQgY2Zf
Y2hlY2sgY2xlYW51cF9yZWJhcihjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgYm9vbCBoaWRl
KQ0KPj4gK3sNCj4+ICsgICAgaW50IHJjOw0KPj4gKyAgICB1aW50MzJfdCBjdHJsOw0KPj4gKyAg
ICB1bnNpZ25lZCBpbnQgbmJhcnM7DQo+PiArICAgIHVuc2lnbmVkIGludCByZWJhcl9vZmZzZXQg
PSBwY2lfZmluZF9leHRfY2FwYWJpbGl0eShwZGV2LT5zYmRmLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0VYVF9DQVBfSURf
UkVCQVIpOw0KPj4gKw0KPj4gKyAgICBpZiAoICFyZWJhcl9vZmZzZXQgfHwgIWlzX2hhcmR3YXJl
X2RvbWFpbihwZGV2LT5kb21haW4pICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgQVNTRVJUX1VO
UkVBQ0hBQkxFKCk7DQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4g
KyAgICBjdHJsID0gcGNpX2NvbmZfcmVhZDMyKHBkZXYtPnNiZGYsIHJlYmFyX29mZnNldCArIFBD
SV9SRUJBUl9DVFJMKDApKTsNCj4+ICsgICAgbmJhcnMgPSBNQVNLX0VYVFIoY3RybCwgUENJX1JF
QkFSX0NUUkxfTkJBUl9NQVNLKTsNCj4+ICsNCj4+ICsgICAgcmMgPSB2cGNpX3JlbW92ZV9yZWdp
c3RlcnMocGRldi0+dnBjaSwgcmViYXJfb2Zmc2V0ICsgUENJX1JFQkFSX0NBUCgwKSwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX1JFQkFSX0NUUkwobmJhcnMgLSAxKSk7
DQo+PiArICAgIGlmICggcmMgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBwcmludGsoWEVOTE9H
X0VSUiAiJXBkICVwcDogZmFpbCB0byByZW1vdmUgUmViYXIgaGFuZGxlcnMgcmM9JWRcbiIsDQo+
PiArICAgICAgICAgICAgICAgcGRldi0+ZG9tYWluLCAmcGRldi0+c2JkZiwgcmMpOw0KPj4gKyAg
ICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7DQo+PiArICAgICAgICByZXR1cm4gcmM7DQo+PiAr
ICAgIH0NCj4+ICsNCj4+ICsgICAgaWYgKCAhaGlkZSApDQo+PiArICAgICAgICByZXR1cm4gMDsN
Cj4gDQo+IE5vdyB0aGF0IHRoZSBoYW5kbGVyIGNhbiBkaWZmZXJlbnRpYXRlIGJldHdlZW4gY2Fs
bHMgdG8gaGlkZSB0aGUNCj4gY2FwYWJpbGl0eSB2ZXJzdXMgY2FsbHMgZnJvbSBkZXZpY2UgZGVh
c3NpZ24sIGRvIHdlIG5lZWQgdG8gY2FsbA0KPiB2cGNpX3JlbW92ZV9yZWdpc3RlcnMoKSBmb3Ig
dGhlIG5vbi1oaWRpbmcgY2FzZT8NCj4gDQo+IFRoZSBub24taGlkaW5nIGNhc2UgaXMgb25seSB1
c2VkIGZyb20gdnBjaV9kZWFzc2lnbl9kZXZpY2UoKSwgYW5kIGp1c3QNCj4gYWZ0ZXIgaGF2aW5n
IGNhbGxlZCBhbGwgdGhlIGNsZWFudXAgaG9va3MgdGhhdCBmdW5jdGlvbiBwdXJnZXMgYW55DQo+
IHJlbWFpbmluZyByZWdpc3RlcmVkIGhhbmRsZXJzLiAgSXQgd291bGQgYmUgT0sgdG8gZG8gc29t
ZXRoaW5nIGxpa2U6DQo+IA0KPiBzdGF0aWMgaW50IGNmX2NoZWNrIGNsZWFudXBfcmViYXIoY29u
c3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIGJvb2wgaGlkZSkNCj4gew0KPiAgICAgaW50IHJjOw0K
PiAgICAgdWludDMyX3QgY3RybDsNCj4gICAgIHVuc2lnbmVkIGludCBuYmFyczsNCj4gICAgIHVu
c2lnbmVkIGludCByZWJhcl9vZmZzZXQgPSBwY2lfZmluZF9leHRfY2FwYWJpbGl0eShwZGV2LT5z
YmRmLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBDSV9FWFRfQ0FQX0lEX1JFQkFSKTsNCj4gDQo+ICAgICBpZiAoICFyZWJhcl9vZmZz
ZXQgfHwgIWlzX2hhcmR3YXJlX2RvbWFpbihwZGV2LT5kb21haW4pICkNCj4gICAgIHsNCj4gICAg
ICAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gICAgICAgICByZXR1cm4gMDsNCj4gICAgIH0N
Cj4gDQo+ICAgICBpZiAoICFoaWRlICkNCj4gICAgICAgICByZXR1cm4gMDsNCj4gDQo+ICAgICAu
Li4gcmVtb3ZlIGhhbmRsZXIgKyBtYXNrIHJlZ2lzdGVyIC4uLg0KPiANCj4gVGhvdWdodHM/DQpH
b3QgaXQuDQpCdXQgd2h5IG5vdCBtb3ZpbmcgaXQgYWJvdmUgdGhlIGZpcnN0IGNoZWNrICIgaWYg
KCAhcmViYXJfb2Zmc2V0IHx8ICFpc19oYXJkd2FyZV9kb21haW4ocGRldi0+ZG9tYWluKSApIiA/
DQoNCj4gDQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIFRoZSBkcml2ZXIgbWF5IG5vdCB0
cmF2ZXJzZSB0aGUgY2FwYWJpbGl0eSBsaXN0IGFuZCB0aGluayBkZXZpY2UNCj4+ICsgICAgICog
c3VwcG9ydHMgUmViYXIgYnkgZGVmYXVsdC4gU28gaGVyZSBsZXQgdGhlIGNvbnRyb2wgcmVnaXN0
ZXIgb2YgUmViYXINCj4+ICsgICAgICogYmUgUmVhZC1Pbmx5IGlzIHRvIGVuc3VyZSBSZWJhciBk
aXNhYmxlZC4NCj4+ICsgICAgICovDQo+PiArICAgIGZvciAoIHVuc2lnbmVkIGludCBpID0gMDsg
aSA8IG5iYXJzOyBpKysgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICByYyA9IHZwY2lfYWRkX3Jl
Z2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDMyLCBOVUxMLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZWJhcl9vZmZzZXQgKyBQQ0lfUkVCQVJfQ1RSTChpKSwgNCwg
TlVMTCk7DQo+PiArICAgICAgICBpZiAoIHJjICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAg
ICAgICBwcmludGsoWEVOTE9HX0VSUg0KPj4gKyAgICAgICAgICAgICAgICAgICAiJXBkICVwcDog
ZmFpbCB0byBhZGQgUmViYXIgY3RybCBoYW5kbGVyIHJjPSVkXG4iLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICBwZGV2LT5kb21haW4sICZwZGV2LT5zYmRmLCByYyk7DQo+PiArICAgICAgICAgICAg
cmV0dXJuIHJjOw0KPj4gKyAgICAgICAgfQ0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldHVy
biAwOw0KPj4gK30NCj4+ICsNCj4+ICBzdGF0aWMgaW50IGNmX2NoZWNrIGluaXRfcmViYXIoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgew0KPj4gICAgICB1aW50MzJfdCBjdHJsOw0KPj4gQEAg
LTgwLDcgKzEzMSw3IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9yZWJhcihzdHJ1Y3QgcGNp
X2RldiAqcGRldikNCj4+ICAgICAgICAgIHsNCj4+ICAgICAgICAgICAgICBwcmludGsoWEVOTE9H
X0VSUiAiJXBkICVwcDogdG9vIGJpZyBCQVIgbnVtYmVyICV1IGluIFJFQkFSX0NUUkxcbiIsDQo+
PiAgICAgICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNiZGYsIGluZGV4KTsN
Cj4+IC0gICAgICAgICAgICBjb250aW51ZTsNCj4+ICsgICAgICAgICAgICByZXR1cm4gLUUyQklH
Ow0KPj4gICAgICAgICAgfQ0KPj4gIA0KPj4gICAgICAgICAgYmFyID0gJnBkZXYtPnZwY2ktPmhl
YWRlci5iYXJzW2luZGV4XTsNCj4+IEBAIC04OCw3ICsxMzksNyBAQCBzdGF0aWMgaW50IGNmX2No
ZWNrIGluaXRfcmViYXIoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgICAgICAgICB7DQo+PiAg
ICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIiVwZCAlcHA6IEJBUiV1IGlzIG5vdCBpbiBt
ZW1vcnkgc3BhY2VcbiIsDQo+PiAgICAgICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBk
ZXYtPnNiZGYsIGluZGV4KTsNCj4+IC0gICAgICAgICAgICBjb250aW51ZTsNCj4+ICsgICAgICAg
ICAgICByZXR1cm4gLUVOWElPOw0KPiANCj4gSSdtIHVuc3VyZSB3ZSB3YW50IHRvIHJldHVybiBh
biBlcnJvciBoZXJlIGFuZCBpbiB0aGUgY2hlY2sgYWJvdmUsDQo+IGdpdmVuIHRoaXMgY2FwYWJp
bGl0eSBpcyBkb20wIG9ubHksIHdlIG1pZ2h0IHdhbnQgdG8ganVzdCBza2lwIHRoZSBCQVINCj4g
YW5kIGNvbnRpbnVlLCBhaW1pbmcgZm9yIHRoZSBvdGhlciByZXNpemFibGUgQkFScyB0byBiZSBm
dW5jdGlvbmFsPw0KV2h5IGhlcmUgbmVlZCB0byB1c2UgY29udGludWUsIGJ1dCBiZWxvdyB2cGNp
X2FkZF9yZWdpc3RlcigpIGZhaWwgcmV0dXJuIGVycm9yPw0KDQo+IA0KPiBUaGFua3MsIFJvZ2Vy
Lg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0KDQo=

