Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B7BB2F691
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 13:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088544.1446290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up3Si-0001dO-Iy; Thu, 21 Aug 2025 11:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088544.1446290; Thu, 21 Aug 2025 11:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up3Si-0001ad-Fs; Thu, 21 Aug 2025 11:28:08 +0000
Received: by outflank-mailman (input) for mailman id 1088544;
 Thu, 21 Aug 2025 11:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDER=3B=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1up3Sg-0001aX-4j
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 11:28:06 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6f6dddc-7e81-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 13:28:05 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DBBPR03MB10221.eurprd03.prod.outlook.com (2603:10a6:10:538::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 11:28:01 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 11:28:01 +0000
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
X-Inumbo-ID: e6f6dddc-7e81-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2M9i71huKqP5ifp1sGBo7sNH0/gfUaStFEG/g6euRIaKIyW82qkvp2W6Fu7810jqMPfBPnDoF2cVqqu/oqatkyT68ZscTu+ZrBbY+PF+S0ctmlh7i39Vzx0V2gFqC+3qLK8BbNvf7yG7A1ObCiSq/dEViZY96tzCPSXln9vCnV1ztOhaLJwES0q2Pqq2ZmwUkFxnGsHe1c9ByzfXbVO6Z9rjDkJ1b0V69oEzYAPSPxPvQYnCuHlj2ob0+Z2jkY9jXdrtae9bDTE1OvtbxcUsNEuZ7gY+WwTwsgC6ZuTDyYSKoD3dXpb/BqB57aqmwlPhV2sdNnlpnWpmElNrurIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXeqpTXoVD8k0/p9hnw2qRUC2Xg2Z5FgHlXBIsiADis=;
 b=aHHn1m96VKPVaEutV5KHaV+V9j0r0BWRwgNDrcW0iT5h5dz0utlyChXqdRb4fcCCoOF6CETYLCDljS7LofA7FfC94BypmIwya8wGpj+4jALkYqRmn6PVHY0u83hxM+Mpwb3fYSpK1RVLmeNG7ocurtSVEXy4vKf4fe7oJPlzE/RgotCsDLizKFEx0iTB/c1zD8b0PF0IRfSWl7ngxvr8qDwu/8mWfC8eWr0q70Oy4oh4nz6pk2Dc6HdV7/5sm7f6om8ofEzSxmmwwpnsFvIKi65gj0BkyvjH0jEmhhWBAw0le7Dpz9I4qdM3fboqu178dV9Weu2VwUnUppjQ7D0PCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXeqpTXoVD8k0/p9hnw2qRUC2Xg2Z5FgHlXBIsiADis=;
 b=tZxXD38VrJ8gkHlnmz8UIpAJayChCPy/icvUomkZL+Bx1ZHXdxlEdNiFQsWhbtgncmj8Qm9iT/KKSuqjq2S/B7fUF1YNMEMN/v9ghaFX7z6gj4ZlVQA0bQYsD75BqBCiilijF8GfFehdaXaU9gl1ir2jAQTM2zVdMqjgyTjjhA32we1hO+2P1pfXNXEgPU+xDOLfAZMjNUOitl9hVFG6o7Erf2rh6jsyFGX36+Tnb7QELVFQuxczK1PY1STT3V6qdDfyj+X4xCU0UAS3AuQ50SgotvzHf1kAxHRocQ6M2BYXD2wtTeQvM5jPD4wJox0KCzcLUmPEmUQUU7H5dAOKDQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] common/efi: deviate Rule 2.1 violation in read_file()
Thread-Topic: [PATCH] common/efi: deviate Rule 2.1 violation in read_file()
Thread-Index: AQHcEfz7XSs2OBYVOkGOyX+FE8ObGLRs6goAgAAPSAA=
Date: Thu, 21 Aug 2025 11:28:01 +0000
Message-ID: <61ba927d-876f-496d-966c-e29db3022a1d@epam.com>
References:
 <c20a58f24875806adfaf491f9c6eef2ca8682d18.1755711594.git.dmytro_prokopchuk1@epam.com>
 <98e8ca88-75cd-4d59-9e94-f758324fa46a@suse.com>
In-Reply-To: <98e8ca88-75cd-4d59-9e94-f758324fa46a@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DBBPR03MB10221:EE_
x-ms-office365-filtering-correlation-id: feee7e51-4922-4f1e-10a1-08dde0a5c995
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N0NUdVFCRVVpcDlWTHdLNFdOM0dJTTVuVVExTE0xdG11T0hLd2czR0pkM3RX?=
 =?utf-8?B?ekpHT1NtM0RqNXY5ZWc2NE5OMnFDeG8wRmFJRnIzZjRBRHNKSGhMK01qaWU5?=
 =?utf-8?B?Ui9jVFRGMytGN25xcGVjYjB2WlZqOXZvajBsNFZBWVJZWC9yeEhqMmNnWFBT?=
 =?utf-8?B?T0hEenZ4ZG9uWW1KL1RRSE02b0kzWnBPb1VwbGFEQkFnV3ZuYno5MWFTM1gy?=
 =?utf-8?B?ZmY4Y25GOFVpYUtIZmJTOXU5ZEFYSUhtSk82RGFGZ1Rjd2JxL0lXM3A4bWhP?=
 =?utf-8?B?bTlwbEFIeUZxcTBPQmNOM3kySEhxR0lFWWhtNyt2ckpvTzBBWnVib1Y4eUht?=
 =?utf-8?B?SVRQNkhFdTlEc1c0STZXOGFTbnl3b3F1VWlDMjRCTEIvMGNsbzhNMGNseith?=
 =?utf-8?B?WGJUdkpqako5R21GQnZnelMzOGZWeHRWVzZxbTB5Nm1zZGZhMncrN1IrUnFh?=
 =?utf-8?B?c1BobzBMRVJYNFhDZGVFK1VHOHdreC9tcWVEQmNJQ2trdkswYnRkLzdqQ0FJ?=
 =?utf-8?B?MG9jZy9Ia0dydUhzVVNoR1JKdWhiRTBhWm1vMTFmY0NrcjlkMkdEQmxuRG54?=
 =?utf-8?B?dTFrUkVIRFhmanl0OHUzUHNvVjZBUkc5MUZ2K1FDd0JTSnJTVUZLcFR3QWFx?=
 =?utf-8?B?Skd4dCtnanM5UzNPV0ozaVNFeGlrSTd0TlFuTWU0MTNjRGJqNDFKcWxYVEtQ?=
 =?utf-8?B?akRQQ0w0eGRCRThldVNpVXhiTlI3SGRGN0NTd3REdVlUUmp3VHM4OHphM1Ey?=
 =?utf-8?B?dDVGZERHb211L0dZSkN6aWs5SHpZalgxT1g5SGlkbHZadEVpUnljMW1PZTNX?=
 =?utf-8?B?ZEhZc1ppbmpJQW5YWjhFNEJzRjJiUUthWTZET1J0b3FtMnY2RVBZd291L2xu?=
 =?utf-8?B?cHV4OEJzSGd3TmhoT2ZJQUE2blN2dEF0Y3gyRFhmZHIwL3BQcG5uUjJiQVU1?=
 =?utf-8?B?eTdaazhrRWhXdmRXSitmd0pTOEF0RllCclRqRDBHdllNMXRKaXhQUHhEMnhI?=
 =?utf-8?B?WVJXZzFWYzUxeHdZMkkxeGEvUlgvOGxNTzBMV3l6MUtCbmQrcDFpNEtIRVZH?=
 =?utf-8?B?T28wckdLa2VMR3EzNlIxN0FLNE9ROTBFek1Hb1FGUlFoR1MyQ1pCWEU2Ukpw?=
 =?utf-8?B?S2oyZHN3WVhOYzdIemphUis5d0x1MEdNZDRWSkczdEg1T2QxczhlZkhIUkx0?=
 =?utf-8?B?VTR4SjVteWEvdThZSFFtVFFVUCtkcG92VE56SEpXMzR1dDFLeVVoZkE5enQ0?=
 =?utf-8?B?K2hxNVFTNnY3RCtBb2tCVHlwRkZrTUQxU01vWkRFeU1UdXR3ZzFpb2pTQUt3?=
 =?utf-8?B?TC9vTDY0MkpYKzhzeFAveUpRWjA3WXI3Z3BmSE1MMithSmN3K214b0REZGtY?=
 =?utf-8?B?aGpnQTVhTmZkQ2hrc3g5QmpYTHY2eGF6c0d5OFVFaWZEL3l1KzZPV1VjemN1?=
 =?utf-8?B?eUFGdDJLdlBBNHhjQXhYLzdWcGRvc0tEN2UzMVJjc1RhMi9UclphUmJpSmg5?=
 =?utf-8?B?R3RRVDJ4RDhRVkNYRExxeU42SmlERGZiaURVUkFoNitHb2YwTWgxQU1XWUhH?=
 =?utf-8?B?UW45WkloQnBHektHWVZHZFZvM2V1SGcwNkUxS0NZYkxTOUo1TGZxTjNVdzJv?=
 =?utf-8?B?TVhlZUdjOTdNZ2ZUZ0YxeHhqYlRxOE9RRmtZYmVnNGU0WERLaDUzOXNNMFZK?=
 =?utf-8?B?ZHUyVlJ4d1FvK2lseWwva3RMZUNXVTcwdnhlaHcrYnNBZ3RhZXZkTVl6ZVRn?=
 =?utf-8?B?eTVPeXVGdHd6SlpmQzZtY1FLdjE2UGlyTERndDhxdXBhRFg5UW0zTEZWMmN5?=
 =?utf-8?B?N2pTZkNoQmNzYm43eU1mUms0UDVYYkxHdkx1Yk5pcXdqMmJXMDkrWitVZWIx?=
 =?utf-8?B?T0xTTjQ5eHEyYnhnQmFHcXluV0RNdThHdVhmWUpyQ0dMcms2dm5JTFRZTXN4?=
 =?utf-8?B?QndiTUUwTFU1b3JQTmx3THVPNmVRU3pwVGFOTllvTnhPbURWeHRtbWc1bTRk?=
 =?utf-8?B?WEVyeFN5Q0R3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K0p4S09lNGJBaTlmeGtaNXorQ1VEeTE2c3NMcXBXVW5MS0kyMmUxZldrQk9i?=
 =?utf-8?B?eUsrd0o5ZG9tajEvYUZRZFVsOGRjMGQ1ckxibWt1N2N2Wnc2ekozVEkyejZV?=
 =?utf-8?B?TlJYQ0JBQWJ0RlFRclBtSTFPK2pTUjVMOUhkZlBkQlJ6WUZwMGdOWlJyaHkz?=
 =?utf-8?B?bU1sT3F6ZUExWW1nVEFmWVZaa0VCTkQ3dlRZQlpaSWNsQ0MwVzh5R1htMkht?=
 =?utf-8?B?WlBDQ1ZxTXY2akxWc3QvU2hqcEtMaUl0RXFZMEtoYjFhRWY0VGl4R0tWb1hU?=
 =?utf-8?B?Wm9VVHk3eUhObjd2bG04WWV1Ym1TdU13b0kweDk1T0o5czFmQ0dRbVlpSWJP?=
 =?utf-8?B?Ty9iOG51aXl0b0FFTEFlUmYwN25Edk5yWkRvMllVNlhNWEhVZytObkNnY1R3?=
 =?utf-8?B?S0daVGkwM2Y1Z2tsM1Q5N0dNTW5wTVQwdWpuM1MwYTYyNGxLUURKNEcvSTlr?=
 =?utf-8?B?aW84dHZPYnRhQW4xNjdmWXg0Lzh2OVV1L2dLRWdPWFk4a0p4NlNiMHZhRDRS?=
 =?utf-8?B?MFhaSTlsTERhakh0aUJtQy9iczZyQlhHM1cyY25ISDc1MFB1dWJUQmd0MWxX?=
 =?utf-8?B?dTlNcDVZYUJUVVVweDJuc0UyRnN5OTdhMHpzL2ExMmhQblFLTjlQN0JtL3dK?=
 =?utf-8?B?NitSdXhVYktmVmRmWGdzVFI1elNQQW4waWtQRlZjZVdTSDAyR3BjWEw1cGdp?=
 =?utf-8?B?UUVTQUtkVHF1OUhwVnMzM0FKU2ZIUG82WmRZN3JNSVZqUVNyNkNSNlFNUTRI?=
 =?utf-8?B?QkhUdDdSWCtrZEhGSS9NMlRHa3krTk5rQk5HKzVId3U5SXY2czl2TlRWS3lh?=
 =?utf-8?B?bkM4d2VQS2RLMlNkWmFBNVJWMU1DTXVLL1lwWnNrT2w2aEY0YWpGZ2lyemxw?=
 =?utf-8?B?d2NmTGhRZVR3ODkrWW5XQnlkTi9kalpva2FOdTlYSTJvZVcvZjAvRytlR21s?=
 =?utf-8?B?M055UDVsR3ZPcGdhZnA5cTRad1hjRnZvcmx6ZDJvbUQzb0lFVDlGeVFoSVZa?=
 =?utf-8?B?RmdzWHE4WnVyUG5VYlp1anZQd3EvOXRaeDRkT3ZpdFFZZmQrSHRvSGpqUHRp?=
 =?utf-8?B?ZThZMm1iMUpyZkNQbDdNd0drc1Y4Z3k2bEpCbFpEM21MUzJ0TTZqdHF5cXB6?=
 =?utf-8?B?V2w2SG80OE1mN0M0Ylh0bEdETEhISTJuRUhBdk5ucFg3S1pqMm91dVFLWWV2?=
 =?utf-8?B?SVN1UVJ3cEp2U2ZEcHQ0Y3plakdEc2lOQURobjFwQzVoampqRi9GSHN2RGR5?=
 =?utf-8?B?VVJpaUVKNFJBaGZITy8yM1N1UzdKTDR3VmZoYUtmcUNrRndyd3dXY2pNS1B3?=
 =?utf-8?B?aUcyckw3V2xmY3hJMVVEMGwzZFBLVlNpWmhFTmhCcDJvUHQ4Y2JxQmRNeUlL?=
 =?utf-8?B?cVNWYzN5dTg0QjBpQTFENHFUV1pPQlAzUEJWV2tuUStDS3lGbDBOZHZaakFr?=
 =?utf-8?B?cVNxcytlWHBJT3FycVB0bmRHZjVnZzRFZGFUUFIzd3p1UmNMVVQzRWU1eW9w?=
 =?utf-8?B?M21CMUxqQVBOQkEvc0NBUXgySFkwWDhoTTdEemk5WmZGZVRoTGkrNEVqMnpL?=
 =?utf-8?B?L3pLL1dYZVpyYmNYNjM4S3F6ajZ5NTY1Z0ZCUzZMZWQvM003ZllvSG9jekp4?=
 =?utf-8?B?SmQvL0srSzRVb2VXbWRwOXZBNzM5ZElVTFNYck43NEp2TlNuYWE4MjFvaVpI?=
 =?utf-8?B?N2lacG4yQlRMbjV1NXJsdlU5Rmc3NTFobDlnOVFUZjFaU3poQnJaZDBTbWpr?=
 =?utf-8?B?eFArVHpybGJVbmhXVnhscForK3hEMmJDUElxNzJzT3FLVHBGM1A5RmNZQUlr?=
 =?utf-8?B?eVA4aFFLdUQ4TkVhY2VxbE9WQzlHUm1rOTBWWDVWZTloYUZ4Mk9yUVJIS1pW?=
 =?utf-8?B?UkJ4NFdGZEhVMk9VZ0d3RHNRbDU2aHEyc2xEVU5SMWsvSDlhY0ZpTCtZVDQy?=
 =?utf-8?B?NTh6aEhFS0xlMHhWa2JHcmhWMU9jQXVuZWdORDZGdVdYVUlnVVpEVXZ5VmxM?=
 =?utf-8?B?UWhvaEIvSmRsa2ZWNTlPSUdyaXR5b3R0THJoYVZDT2FaT1BiWE95UXVWNmVF?=
 =?utf-8?B?ZmNJQlJ3NEQrbUdGdVF3THlieGFRT3lMS1FIc2U2VFVvbDEvOHVMMUVQMjNy?=
 =?utf-8?B?Qm1hSXRaanRqSlhDUytMNWVzSk9PRStoV3NuSVlVbFl6WENGSmx6NkZReWIr?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46C6CCBFB200AB4EB648A848A798EB76@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feee7e51-4922-4f1e-10a1-08dde0a5c995
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 11:28:01.2474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y5QOHPgRYrNLZHKgcEDyoAeU0cQtvNowiOKlDlWQ63Zn5MUn3JCPkujudNYfs7dxSC1aGgxvXJIzSpZ5AXUr6246MN/TGs/Xf4V0A9qaA2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10221

DQoNCk9uIDgvMjEvMjUgMTM6MzMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyMC4wOC4yMDI1
IDIwOjA1LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+PiAtLS0gYS94ZW4vY29tbW9uL2Vm
aS9ib290LmMNCj4+ICsrKyBiL3hlbi9jb21tb24vZWZpL2Jvb3QuYw0KPj4gQEAgLTg1Miw3ICs4
NTIsNyBAQCBzdGF0aWMgYm9vbCBfX2luaXQgcmVhZF9maWxlKEVGSV9GSUxFX0hBTkRMRSBkaXJf
aGFuZGxlLCBDSEFSMTYgKm5hbWUsDQo+PiAgICAgICBQcmludEVycihMIiBmYWlsZWQgZm9yICIp
Ow0KPj4gICAgICAgUHJpbnRFcnJNZXNnKG5hbWUsIHJldCk7DQo+PiAgIA0KPj4gLSAgICAvKiBu
b3QgcmVhY2hlZCAqLw0KPj4gKyAgICAvKiBTQUYtMTUtc2FmZSBkZWxpYmVyYXRlbHkgdW5yZWFj
aGFibGUgY29kZSAqLw0KPj4gICAgICAgcmV0dXJuIGZhbHNlOw0KPj4gICB9DQo+IA0KPiBNdWNo
IGJldHRlciAoZXZlbiBpZiBub3QgdGFnZ2VkIGFzIHYyKS4gWWV0IHRoZW4sIGRpZCB5b3UgY29u
c2lkZXINCj4gYWx0ZXJuYXRpdmVzPyBGb3IgZXhhbXBsZSwgd2l0aCBQcmludEVyck1lc2coKSBw
cm9wZXJseSBhbm5vdGF0ZWQgIm5vcmV0dXJuIiwNCj4gSSdkIGtpbmQgb2YgZXhwZWN0IGNvbXBp
bGVycyB0byBub3Qgb2JqZWN0IHRvIHRoZSBvbWlzc2lvbiBvZiB0aGUgInJldHVybiINCj4gc3Rh
dGVtZW50IGhlcmUuIFRoaXMgd291bGQgdGhlbiBsZXQgdXMgZ2V0IGF3YXkgd2l0aG91dCBhIG5l
dyBTQUYgY29tbWVudC4NCj4gV2hpbGUgeW91IGV4cGxhaW4gaW4gdGhlIFNBRiB0ZXh0IHdoeSB5
b3UgcmV0YWluIHRoZSBzdGF0ZW1lbnQsIEknbSBub3QNCj4gY29udmluY2VkIG9mIGNvZGUgY2xh
cml0eSBzdWZmZXJpbmcgaWYgaXQgd2FzIGRlbGV0ZWQsIGFzIGxvbmcgYXMgYSBzdWl0YWJsZQ0K
PiBjb21tZW50IGlzIHN0aWxsIHRoZXJlLiBJZiBQcmludEVyck1lc2coKSBsb3N0IGl0cyAibm9y
ZXR1cm4iLCBzdXJlbHkNCj4gY29tcGlsZXJzIHdvdWxkIHRoZW4gZGlhZ25vc2UgdGhlIGxhY2sg
b2YgInJldHVybiIuDQo+IA0KPiBKYW4NCg0KU3VyZSwgdGhlIG5leHQgdmVyc2lvbiB3aWxsIGJl
IHYzLg0KQWN0dWFsbHksIHRoZSBQcmludEVyck1lc2coKSBhbHJlYWR5IGhhcyBwcm9wZXJ0eSAn
bm9yZXR1cm4nLg0KQW5kIGl0IHJlYWxseSBnaXZlcyBhbiBhbHRlcm5hdGl2ZSB3YXk6IHJlbW92
ZSAncmV0dXJuIGZhbHNlOycgZnJvbSB0aGUgDQpmdW5jdGlvbiByZWFkX2ZpbGUoKSAobGVhdmlu
ZyBjb21tZW50IHRoZXJlKS4NCg0KV2l0aCB0aGF0IGNoYW5nZSBNaXNyYSBpcyAiaGFwcHkiLg0K
DQpJbiBjYXNlIG9mIHJlbW92aW5nICdub3JldHVybicgYXR0cmlidXRlIGZyb20gUHJpbnRFcnJN
ZXNnKCkgZnVuY3Rpb24gDQpjb21waWxlciB3aWxsIGRldGVjdCB0aGF0Og0KYXJjaC9hcm0vZWZp
L2Jvb3QuYzogSW4gZnVuY3Rpb24g4oCYcmVhZF9maWxl4oCZOg0KYXJjaC9hcm0vZWZpL2Jvb3Qu
Yzo4NTQ6MTogZXJyb3I6IGNvbnRyb2wgcmVhY2hlcyBlbmQgb2Ygbm9uLXZvaWQgDQpmdW5jdGlv
biBbLVdlcnJvcj1yZXR1cm4tdHlwZV0NCiAgfQ0KICBeDQoNCklzIGl0IE9LIHRvIHByZXBhcmUg
c3VjaCBeIHBhdGNoPw0KDQpEbXl0cm8uDQo=

