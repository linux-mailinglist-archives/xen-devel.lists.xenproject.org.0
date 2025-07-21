Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0B3B0BBF7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 07:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1050984.1419303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udij6-00085I-Sd; Mon, 21 Jul 2025 05:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1050984.1419303; Mon, 21 Jul 2025 05:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udij6-00083O-Md; Mon, 21 Jul 2025 05:06:12 +0000
Received: by outflank-mailman (input) for mailman id 1050984;
 Mon, 21 Jul 2025 05:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K2J1=2C=renesas.com=jahan.murudi.zg@srs-se1.protection.inumbo.net>)
 id 1udij5-00083I-B7
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 05:06:11 +0000
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c405::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 626aba1d-65f0-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 07:05:58 +0200 (CEST)
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com (2603:1096:604:2d7::7)
 by OS7PR01MB16755.jpnprd01.prod.outlook.com (2603:1096:604:423::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 05:05:52 +0000
Received: from OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1]) by OSOPR01MB12408.jpnprd01.prod.outlook.com
 ([fe80::7ff4:8a98:ccd4:daa1%3]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 05:05:47 +0000
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
X-Inumbo-ID: 626aba1d-65f0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYtcRUJlQ2ICquGBml+u5tivVOMuzYvBncsYn167owd0iv03Sd+FWIDobrp1wJJolAgJvO6xm9yz46JNswzN7GRpZGFJ9CyupebdPka3SU/xBNpyWvpPJiVFNiyRW0FNi4kz5SjtaehzCuee1QtTRHZuIE6/CZFVGwE4aAMzzOed9mKhWp7Vv+ssyZAET02ea1SyXcFZd0atP4zd87FozZ9NO52LWCazhVSoP1uv51CklXMDSKE96wA3c5C6Fe3uAbFxqb1F7e5fvQ8m4rxUfTBnEZ4GzAXeem7aooFXMn8ZWtB5oRZvYsWh/nkUQjSZ/t3n9F/aDXaxF8ZUnP1k3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1YpGNCHxPEuxC49Y7PqXjcUyC51Wzc1lI80RadsU1I=;
 b=qROuZVLfCpVedDbvKaCYw5caTqsi0KxzyHADVH2sZgZQoCwWWoXMpsTiyrmB53CwZBeRWhoBe0f9VC4CUTZ26x7RMR/fOHijndF9p8oJQejlv0/I4F7k3zoMoDht1Bq0AcMQ0xzEToCvZCTrgLbUqEXQnjj+3JvwnmWBjPA2UUuIitSGmuxsVPkYpROjUSdu+rAYCe3TrkV/Nh7/erh9QlFzkfW/8Y2GpuiBRz/2+nBrh/mp7GMhyoAk79+iqBkBZYh5PVxewKqJ8jErvujWAsbgHDDrgbxvAzBCbgDQCWJ41lzhmUM18o4tlCuSUW7RlwT9gcBDMDLxkOU07RG3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1YpGNCHxPEuxC49Y7PqXjcUyC51Wzc1lI80RadsU1I=;
 b=HxDe1YuQJ4SQzsboTgC0EOTINvXoQ/Y0i4uRb+MkTxgqoIK0UJP6EQp/2GTMxaGZMlgxJB9RBpIcskhkQ/UX22w7m00k9VJvtaufaKZKuCEwQ8RR8sAdgR4z5EICPRW1ClzafrZgWIioxQqsHZ7ze7AHLX3njjyyrrMiLhMbiKk=
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: Anthony PERARD <anthony.perard@vates.tech>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [RFC PATCH v2] tools/xentop: Add physical CPU statistics support
Thread-Topic: [RFC PATCH v2] tools/xentop: Add physical CPU statistics support
Thread-Index: AQHb8Ktx5QD+btxPIkqt3XEcNbe+8rQ8FicQ
Date: Mon, 21 Jul 2025 05:05:47 +0000
Message-ID:
 <OSOPR01MB12408C50DD5488EA66B0BEEA4AB5DA@OSOPR01MB12408.jpnprd01.prod.outlook.com>
References: <20250709082810.3052544-1-jahan.murudi.zg@renesas.com>
In-Reply-To: <20250709082810.3052544-1-jahan.murudi.zg@renesas.com>
Accept-Language: en-IN, kn-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOPR01MB12408:EE_|OS7PR01MB16755:EE_
x-ms-office365-filtering-correlation-id: de287c1e-a415-4a20-71e7-08ddc814410f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aFJ1VUttVC80ODNJRnBpd1VuNkJ4V3d0NE5uY1N2SFJ1TGFOUHZDelVWeVF4?=
 =?utf-8?B?Ym9sdlQ2UWZ5NFlJaUpFREZJa3JSN0o0Ymx1S1J1SnJ1VjZHa1N1Qmx5ZWtC?=
 =?utf-8?B?WSt5dDVzYWMwTW80UUcrVVpIZWtkWjlRUGRlYXlBUzZSZkpNT1NmaXMrVEZQ?=
 =?utf-8?B?Y1hSZjFvTlR4YmM1NVdrd1UwbTAwS2UzVWE5Vm1yL3NFZlgxR3VDUk5McERI?=
 =?utf-8?B?ZlJwNkdtQkJBQmxyNmlsR2U5RlpodjlUZVVuQ3VYZ1dOak1KRlphSWFWMGpz?=
 =?utf-8?B?bjV5aWdmMVRraEV5NDdQYjdqdmpjbWw1emJVNlltVC9idDRiQlN5YytZVDF2?=
 =?utf-8?B?TEdYVTVFeHJhWmpBNHlKVUNMdXZpZHhNQ21PaHhRYksrNUxlaVIwSmZJWW5U?=
 =?utf-8?B?TGNCMjNtR3JHQkRFdEpCUTJBZkpuMGEyeVVJaVdZS3ZPbGZIMGVIdlJkOEVS?=
 =?utf-8?B?dHVCYXU0T1VzNXVBVU5wRk0vdERHY3hidGZIWUVKVEJMQStub0g4WFBpL2U2?=
 =?utf-8?B?TWtiK3ZjRXBpeU1lSXdpanZxVkJRcFVlWW82SDRyN3lQWE5CdkViWGdKSU1B?=
 =?utf-8?B?M3BSRzYzdkF3UGtoVnVKbmRvbUErM0cyeTBwa3o5dHZwNFVQTnhRZ3dkU3Za?=
 =?utf-8?B?ZWhFc2RUNC9USWFqcVZDU21NWDV2QVRPd2pSU29ybGRQaTlNSzVBOTFyN3d2?=
 =?utf-8?B?Rm9kR0hDTDlya25xZ1IvOXVMYVlTdm1yWnA1Mjc4aWZaL1BNODhhdGtacjVl?=
 =?utf-8?B?MDdnZmFpNjROVG9teG5FRFh3dHl0OVB5bkdUWWhPRll0MUo0cG1LREtlVDh5?=
 =?utf-8?B?UWV2Ym5jajA3Zk5VODdPMFdpaHRKRGVOdEw3cHk0TUUzNzhyL2RON2syYlUy?=
 =?utf-8?B?aXdRTG9BOVBNUThCeHZLT3lKcXZ4bnpqR201QjRibFBrSHFybHFTNU1ETUo0?=
 =?utf-8?B?c1RyVW9CU3NaeFh0TjJ2YXJtU0l4UmEwa0ZXSjNRcnR0ZzIrR2lUa0NYRWJs?=
 =?utf-8?B?ZG84UndaanF1QllFNThJandQWUE1NDFyQURTRmI0NDV5U3pCdDJEVUFZaFVk?=
 =?utf-8?B?R0YwWjJUVjJrN1FRU0lkdWkyOWhHdk5PeXh3VTRKSUpYLzN0MW0rMUlnSitQ?=
 =?utf-8?B?ZERKY2hvdmp6K0htMlRWWlU2a0xyVnBQU3BHVVVYbXIwMlNYVmdRRGl2SGVN?=
 =?utf-8?B?NVlkaGUrSC8zN0JwNW00WU9Ec21YOUgvdkF3a2RDazRheGRSQjhZbzFiZ2VG?=
 =?utf-8?B?cHBScWJMQmxlVlFDYVdmb2cya0E4SFJpaThQVVVuYitmMk8wT0Z0eU02bXJB?=
 =?utf-8?B?dURrV2NWQnFSSGZKUk5wVU5mU2NWSjBKY3lTTHpMMnVGYytKS1o4Tzd2L0p6?=
 =?utf-8?B?R0Z1VjN2MEEzZzBaNVhJdFg5UHUvczI4L2JHaHNMU0VZSmh5bndMZmdVVnZi?=
 =?utf-8?B?NnY1eElJRlVWalNmSWRMWFNGU0NaN1NUT3YyZDBMZEZWbE1MdjBzSWd5K1Jx?=
 =?utf-8?B?OWJZaXk3c1p0eW9xRG8xNDI2Y3dNWHRGY21FQVd2YVp5YmhtSGxHM3R5OGZ0?=
 =?utf-8?B?Yk1Xcjd0Zml5Y3VKS3NYVXRMay83bEVBdERsdWh3VUlHWC92QngycFRWVmZI?=
 =?utf-8?B?aVdrNi9LNFRXcGI5N2JJQUU2YThmLzJWY2s0RmhXb1V4eVI1RWpCY2lXRVY0?=
 =?utf-8?B?Y0tId29uMU42dlFmei9leWpxT2ZrS2REdExBUG9RdzVkTTRpUmVNbU96a2Zh?=
 =?utf-8?B?VkJCU3I1cVFaa2VUSE9hVDZwSlQ5L0JZcytlc00rVVdUQVFISFh4NlRMc2JX?=
 =?utf-8?B?cERRT1VDYU1DazdtdzE5eXRtczFlRC9pemh5S3lVYzRkL0dQYkFsQlp1dGVH?=
 =?utf-8?B?TFRCeUZQbjV5RXBUK1I5c09zdkQzRWRnSkxaM1A2MlhUamRjMDV1QjBvWUo1?=
 =?utf-8?B?eTZJZGF0OGNieUVxcS9kS01WWFN5N0dXQ09PVzdRV01kTW9lNkVadnZtMWZF?=
 =?utf-8?B?cVgyeTFsTmZRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB12408.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTM4ZzJjQ1BRSGNHbmJGbGdqMkN6R0k2OGNJUmoxbnUxdmJQQ2QxN2Z2U3Ni?=
 =?utf-8?B?ckRwNTZpajVITHptcHhsUWNXRTFKdForSm5WOEV5SVRSK3I4dWNQYWJhSE9G?=
 =?utf-8?B?WVc4UUtkN241OGppWDYyVnlHZmF2TlVpNU5VdFhXME5VRXVURjFBUGR4OVJ4?=
 =?utf-8?B?TFRuWTIrWVBYZi9hSzQzTUtmN3FHQU4zcTZwTkd3MHo1REFuRFZ6Tk4vRFM3?=
 =?utf-8?B?ZXpNSTBpNVhLRE8xcTkyYzBUVXBYRm51UmZEL1pyNWJCcXpMRjdZSkk1cnlj?=
 =?utf-8?B?emNCQWdDWURHNXZ3WkdWMm5CTkNpQXBXUHlLRTZla1lSZW9vSkpObHNVK0k5?=
 =?utf-8?B?THI3dlFrYnExRkdCWlFJVmd6Q1ZGU2gyYmVIWGxPelFQZlc4Mi9VZ3pNWVdM?=
 =?utf-8?B?ait1dFhlNU5HUS9lbG9maExUbFgrT1lmUE9BQ0RWeFFCM1R6WlBURTl1VnJG?=
 =?utf-8?B?TCtYVlptSE5lSjkwVU0wS29RbGZWbUhiWnh1eCtvSDlZb3diS1AyY1BEREZ4?=
 =?utf-8?B?dlJYY0xkSkx5eEdZTnMxeHlkZ252K0hRV0ZDTkFUTWt5cWFSMGZyU1dsa0Np?=
 =?utf-8?B?SjQwSDBySWN6YXFqbmh1UVVEWCtVTHcvZEhkbDVnUGRTRFcxaHJ0ZzlhM0tX?=
 =?utf-8?B?Sk4wdTluWlNUbndka2I2cXJwZ0ZyeXozaDNCb20weGxVQVhqUllrdVJOY0Jt?=
 =?utf-8?B?b1o0eWJ4ajF0MG9CVnZSTWlQaS9taGZNcGhLSkRRbHRsWmhEQlNzc1hDUFFq?=
 =?utf-8?B?T2xUZjlrTDFOaXFaNEJMVFZGV0VXMFJOMEZlUnhtalRkeldwMGQzVWJaYm5x?=
 =?utf-8?B?eTF5dFIwM1RhTFhkblBwRnJzV1crUEl1bzNTaEJhL01OS1RzR2d3OVhtb0lq?=
 =?utf-8?B?Rmp5NHRkaVZveHJPN285ODhycFBydmJzbVVFM0drOE16MmhQNDNXMGwyVnBB?=
 =?utf-8?B?R0MweFNFVXRsWWhqcXRyQk42c0RUblk3bmxjbVR5cnM5N2dBY2FOM1hRT3dU?=
 =?utf-8?B?cE9GNlZiZWhJdmI2bGR3dVBmN2p0ZlV4RUorZXpqTjhUTk9qdTlvK0lYeUZx?=
 =?utf-8?B?RWFLc0d1d2pUbzZsMjlEemp1YlpDRjQ3ZDNSZTk1U2h2NUhXdE5RREMzYXJQ?=
 =?utf-8?B?bkc1ME1pV29yNjJGcFlXMDFIbzlkRUdOUEpSeHNtNmFrbGJtVGxVQW4wOTVy?=
 =?utf-8?B?MVp4bHVmM1B2bzdXMFpla2tuY2VOOWJ6RWt5djNjR0c4WkFxMEgxeVpnWWM2?=
 =?utf-8?B?d0k5cmNycWtuTUE0NVhEM3NuZEw5aFRZdUsvTW9DTjFkekd6Z2FmMzN1ekNB?=
 =?utf-8?B?VWYzRW9lTUNHblBhZ2FaandtWFpxd2wyQVFwNFZzNDU4eEtBZDRBNXdvSExz?=
 =?utf-8?B?S2ZpN0tCOTJPSWIwVXhNekxwcEhsVmVkZVZoRE1HT2ZacXVqZlR5aXJ4WnhX?=
 =?utf-8?B?UTBhQS8wMXZXL3lIMXpkd1NhelJsSWtzUVlqWWJnNUJ0OHNjZ2VBT05yS1k4?=
 =?utf-8?B?U1E2WnEzYkxSMEc5Qk43UDU0ZVpjcnFVKytPT0lZd2NPNC9LclhVNDNGRVlm?=
 =?utf-8?B?SStNNmJ2SE41Z2M4SGhxQlVyOTJCQXgvdUxzZkpJWmtwZUtsbDJwUkw3SytC?=
 =?utf-8?B?T1lYc2VYOFRlMEVoTGJnV1F2bTNiQWNRZ3lwVytWU0xRVk91N3l1TmhOdTlv?=
 =?utf-8?B?UjdWVTNycUp3Ulg2TEw4eGMyRjJRYnAyM0VFV0FQQmFhcmFNaDFqNGQwSi9S?=
 =?utf-8?B?bFhNNjFBdWw5ZW9LUEhBNGh2VUZMcU5BUmtObjhRWDNMTFdrb2UxT0lpVlF5?=
 =?utf-8?B?aXByOFk2d3ZFQmM4enpueDIzVk1XODJmOUZEd09lSE42THZidzlCUEtPTmdB?=
 =?utf-8?B?RFhOWnRLc1dCZDlDUWNsZFF3Nm4yWTgwVGFBZzkvaTZ4cUJRVEt6WXppcGgy?=
 =?utf-8?B?R0E1WkFjcU1odGRXaGpEckNmYjBibGF5VCt0Tk93T1Rab3paV0ZmbE1ITHVk?=
 =?utf-8?B?TU1qS0J2c3NhZ0VtNGs2emQvS0UydHJMT3JGZUZWN2lqSDNoV3g0WStEa3Ny?=
 =?utf-8?B?NVREUTh5NUNtNENWUUNDQm81dVRCU2pVNkp4QW5lSUYrekpMMyt5TGE2empy?=
 =?utf-8?B?UHlpTHJiNzJLWFVYUllTekl4bTlhMWJUVHd2dUs3bjBMMExaOFM1b1ZjT3lL?=
 =?utf-8?B?R3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB12408.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de287c1e-a415-4a20-71e7-08ddc814410f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2025 05:05:47.2380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GWtEUUOLbgT/ADUXi3kQ8aYONmew8k636X3FtMUn2mgoqGx1nS0ehZZaELPRSsneAuKMJilj+Ac8/LsWJ181XFS5UzSf4xBxA7q523Ksvc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16755

SGkgQW50aG9ueSwNCg0KSnVzdCBmb2xsb3dpbmcgdXAgb24gdGhlIHBhdGNoIEkgc2VudCBlYXJs
aWVyIHRoYXQgYWRkcyAtcC8tLXBjcHVzIHN1cHBvcnQgdG8geGVudG9wLg0KV291bGQgeW91IG1p
bmQgcmV2aWV3aW5nIChhbmQgbWVyZ2luZyBpZiBldmVyeXRoaW5nIGxvb2tzIGdvb2QpPyBQbGVh
c2UgbGV0IG1lIGtub3cgaWYgYW55IGNoYW5nZXMgYXJlIG5lZWRlZC4NClRoYW5rIHlvdSBmb3Ig
eW91ciB0aW1lLg0KDQpSZWdhcmRzLA0KSmFoYW4gTXVydWRpDQo=

