Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AE9B16C0C
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 08:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064838.1430170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhMmA-00031I-GW; Thu, 31 Jul 2025 06:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064838.1430170; Thu, 31 Jul 2025 06:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhMmA-0002yr-DE; Thu, 31 Jul 2025 06:28:26 +0000
Received: by outflank-mailman (input) for mailman id 1064838;
 Thu, 31 Jul 2025 06:28:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+CJ=2M=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uhMm9-0002yl-50
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 06:28:25 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2412::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ba18527-6dd7-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 08:28:19 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 31 Jul
 2025 06:28:14 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 06:28:14 +0000
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
X-Inumbo-ID: 8ba18527-6dd7-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvV5d2ySdT6D0PSFz30GpG0RAs7nSdgZO8uH0A+aBRQg6TQ+S9qlbXOd0wtdbceP3/sd1suoJFUc2eerO27vysQM1ciQydAu1H7iGEUt5Quw8sepLrjpltUe6if3Fnw0EJTvspb4F159M9l9WlgEKH6SBOYSP2+NnnfVFZ+88hx/ILUXQCylz51fSfUR54j/0kO3dLK/cyqbvtNcf1PonejbA9ynm2THu/90TJX+Tfo1ESWSygraKubaq17WIFMoU/K7PxYL7/co2lLG8Cngfzo3YpaDmRac+VFcNsb4RN4QlhT6EjYmMkrON17t5vlesfGOU+2TF0B6GysgSVPTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3ayATdbMbePqSOR20UjMeY8g5n5cXyrFzdbrM6AV9A=;
 b=KzeE6DyBiFSWMcOkUlBawOdee2dvl+pl2jhJtc79pEwzfj3/blfD6+YFI0Zl34vHqvDKaSRHSgg9rrwmpL95O7nToNKcwCnbgwkiO00I3e/WWdddCUqM+9hyIkcDUddHOE0vbZbtaYpmINkEQdArl6JOuiaHZMLGFyLpnSDcgC3tqRgqlBCIPfpsgdLpTfgQBBnNZj+Rk8v5QWglc+eUX6XgINc42IP6gGtcgMNnwHcnefwPvWky/nF48nESIOPil+TcWogn6POhw9GVynd3IQ1/ImplMIZxm1jmeropAX0DmnbIin1/NLQ0tcRN8OJnrL1TspqI1MZOBRRwKA6nCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3ayATdbMbePqSOR20UjMeY8g5n5cXyrFzdbrM6AV9A=;
 b=dRJtt4z2gciY11N7ndoTiOQ14pWRBtzP6HOUR6u63iDtkzqlZ7CxU1LOvQRkFoyH6oL00I72HdBGjQ3HpoIT7UcqhrnDZ5Ed0NNxMc2191aMjpP0uFKFcztKi3XXyevnf0ZwoJMeyuZyD+gk+FTAyEJPxzC1jvyIvBwKa2meLi0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v9 5/8] vpci: Refactor vpci_remove_register to remove
 matched registers
Thread-Topic: [PATCH v9 5/8] vpci: Refactor vpci_remove_register to remove
 matched registers
Thread-Index: AQHb/30gIptlaEQcK0u9xBwFJcYIVrRKieMAgAHBDgA=
Date: Thu, 31 Jul 2025 06:28:14 +0000
Message-ID:
 <BL1PR12MB58499F7343CAC0206676E0BBE727A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-6-Jiqian.Chen@amd.com>
 <89058017-141e-4837-a547-10b41b5d041b@citrix.com>
In-Reply-To: <89058017-141e-4837-a547-10b41b5d041b@citrix.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH2PR12MB4247:EE_
x-ms-office365-filtering-correlation-id: bd086c90-f1c9-4319-af8a-08ddcffb6dec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aGRWT3d2U3YxODlsaXNhU20xczlyMkNrdzlaMW12ZUpTNWppeTl6bjM1bnB4?=
 =?utf-8?B?eVp6QVpUUEZUcnYvUE5iQXRXbFBTN09IOFVYT3Y0RkNYY2NmL2RKMGVlK0ho?=
 =?utf-8?B?ZE5hbW1ZcldQc0VXRHMwalQ1aVlpaDZvVlU4UEZWMFEySy9KZHpiTFh3VGhw?=
 =?utf-8?B?V0VSZzJJdzd5TGxtNWJXMWZqeFlIWFZMWkFCdmdhNmdzckEyUVJNWDNIbGov?=
 =?utf-8?B?VnV3UHBuTDFaSE1IUVY2K3hTaC9wMUVTV2k1N0tZKzlDeEtKWWVSaWoxSjZq?=
 =?utf-8?B?b0pwL2NSY2hlbDdFVWhHTUVoWUsyR0NqdDdybnlhSVAzNlF6a0pUQS9QTWRi?=
 =?utf-8?B?Z1lMa2xTVG5GUUZDdVdWYU4zb1FQMnRoWERtZGNLWWcrbEpXYlJwZHArRDFy?=
 =?utf-8?B?ZVY3b3BWTmZVOEwyamVlV2t5c1pXb2ZNRmZzVFI1Wk9BcWRyTkNyd2JiL3hL?=
 =?utf-8?B?SDlmVGZJMXZmejN2elVuY1paODN1d2dEM3VsT2RtOHQ0VUhEQzliQzZBdmJy?=
 =?utf-8?B?RVRINUxadndtME42Z1lvRko1NDIrb3VKSlVnY2VGVzBGNlNrR1pLbkVnWkdt?=
 =?utf-8?B?eXI4ZXVTdTJHbnp2VDcrQjFvaHozY0w3K0RnMEs0eUkweDlWYkd3c09kY0lC?=
 =?utf-8?B?RTI2aU5jNmkwWGRaMC9LUGhLWWFYem15cEwvV0swVnNJTXlraWpNdkdwNmF3?=
 =?utf-8?B?UnpxRFQ3SHFxNmhRcjFyRWFCeTJQSFFXMHEydGF0LzVUbEUwN0lLYkUzd0lS?=
 =?utf-8?B?ZnNqK3NsNWxxdGtSWjh2U094U0ZFa21xRXdDNjZWVjdGMFBZdEl5NzRDeHRF?=
 =?utf-8?B?U2JibVVWYllRSEVJMTl5bFlZbWhRTmVGZGhuZXc4SjFWSDF1Wlc3SmV2SlVy?=
 =?utf-8?B?cnZIbDUvb0MycTFzOFR0dTFSeWd3VFVaVDZNcU1HWkc2cm10US9NZ21VTTRQ?=
 =?utf-8?B?T2g1bU56V3R4ZGF1THR5UUpYTlBWY0RFRXYwcWFEOFJ1ZUd0aE1GWDFPa05N?=
 =?utf-8?B?RmJwNlRjeDc4KzlreG9wOTlvQjJ0MFlWUE1IbEZUZXBkaUxBc0VlVFJ2dStC?=
 =?utf-8?B?TFRaMjVaaG1IUUFxUm9XWnBlek91RjVZRktVNVEyQmppaWt6d1Q0YlVNMDBz?=
 =?utf-8?B?T09iQ21wSjY0RUs0Mkh5RExQbVFBckxNeVhaQkZqZGFIN1JVZmg1L3BzNmlk?=
 =?utf-8?B?Q1RYSnN5RGpYc0w2Wk5SeDNjOThMRXFQVkJJTmZQWmJLbWRlWWFYVGE1eisx?=
 =?utf-8?B?YzBvQUV4RkNpbjM4QlRZMGQ0aXJPU3JIOFdib1BYbDFyYjc1aFhPM3BRZ1Yw?=
 =?utf-8?B?dHYyWFQ3UHJNN0N4Zlc5TVlOaTVwYUd4YUgxQTVJTGRucVk5akk2VXBNM3NO?=
 =?utf-8?B?Y1hYMzJjOXdwVEZlSWhWbGRndjh6NUlocllDUDRjSlh4VkRBM2JMSzJWTkZS?=
 =?utf-8?B?b29yaVhxYkF2eWNhbDNRNElPeTdTT0FMQ3VvV0pwWnV5aVdybWt2amJzdVBm?=
 =?utf-8?B?akdYSWVlaEorNlU3dnZwTUlITThTL0FtVlhBcW1hTDZicDlseUo4UVVvdC9O?=
 =?utf-8?B?ZFUvL2N4Q1pIdUFBS0hFUE1JcHMwMzI2aHBjT1FyQSs2Y0hoQzZFdUM2WXBy?=
 =?utf-8?B?YXFHNmJITE9EWUovTHpWYUFJYkR4YlhHaUY1T3JGbytNckoybjg2U29iMzB3?=
 =?utf-8?B?a244OUpsZmJ0Uml6dW5ZTDErMklLa3diTmNMaTJDbXhxc2VUQXhwWUE4OGJ2?=
 =?utf-8?B?K3BEL2pTSWtyY2VuZzJ1WXdnZHRKSkpOZTlMKzFCcndZMmNlbmw5YnVReDZJ?=
 =?utf-8?B?UHY0RzZWV1h2ZkcvbDZHaTd5aEpFRzl4emNvL0RTdGY0aUxGd0xLZWNrT1dB?=
 =?utf-8?B?U2JjdjBmdkxmTUJzNk5GWFlKaGFwZmIzNjBqQkgrdk0vREJ4MlJBY2E3eENB?=
 =?utf-8?B?NWpBWVJMTm1WbGQ3WVYyZHlaVEoxM3BEclZmL2R6SHFBZXJvL1VlWitqYyt1?=
 =?utf-8?Q?d2yhUwyINhw/ity53qUW196yXRJfN8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUFBaDhtbi9RNUJHWUtrRE1TZGthKzdjNzNKb05hU25RcE5YY3lNdU5kenQx?=
 =?utf-8?B?eGFwalFvQ2VTOERHMWV1a2IxVEFURlIwK2xRR216VzNXK1pRb2YwbUNDQTR3?=
 =?utf-8?B?K2JWejRlTjFPM3pkSnhUSVcxWEcrVGwyTHNxTHVhMXJNTUZxT0NDZ2RpZmZX?=
 =?utf-8?B?OUpKWVNBZDdWNDBEZHZ6L0tIbVhpS0V2UFNZSit4aVZjalkzZ09tU0xxUGlq?=
 =?utf-8?B?Und4eU9nRXdIc0poMlcxbitIWndpOVBjOFFmaHl6QkFMbkduU1dSdVBOSDBY?=
 =?utf-8?B?eVl4OWFRSjhnWE9YeWJjaVR5V1BtTENWbjJza2pBdTY0ZEdNZWc4TjIrZjMz?=
 =?utf-8?B?OWhEQ2V6Zm9RWkFOU1dYVTUreHRhY0NzVUt3T1IyRkJOT0RaN1Z3cUhMQ3R3?=
 =?utf-8?B?VGtkWVhzMXRySHJ3MnMwcW1KK2FLVlFoODAwV3dJalF2YTU4Tm9LdS91MnV0?=
 =?utf-8?B?bjk3RXhwSWFYOFhwY0pYT3B2TllQdWl0ajZBZ1huS0ovcXJBWVRvZFNKQVQ1?=
 =?utf-8?B?VERDQnYzVXFOV3R5aHNlRmNZbE54UmM2c2pFWHVSVU92QlVNMzNVUE84MlFx?=
 =?utf-8?B?WUM0bE5zcGdyanFoUTNZYkJyUEs0dGFaV0hGck1YM0dQSkdIdTZXUXJsVmo4?=
 =?utf-8?B?RElrQmwxUml3bEJxTXNKcEF3TC9CZkxKdnh3RnhiUU5acU5sYjZpMWtFRXJC?=
 =?utf-8?B?Nzlsa0ZsdTBtNkNhRCs3Q0JvT1NMNFpWeS9Oc3NPRmNzbU1NVmp2NWRoWm5m?=
 =?utf-8?B?LzI4ZGVyUmwvYmlMSWlOV092cmJPTHVZbEFxZnE4aVZ1eFZNRHJVQ1h2b3J5?=
 =?utf-8?B?dkJtMWhjYVVYU214ay9VNDVOaGdoZ0R0cWxMSVRickdJbWNDR3VlMmY3U05Q?=
 =?utf-8?B?R1NjMXIwVmJCZUNUbGFNMmhNREE2UEo4TFJOTnBOeHJsRkZ1YjNzdVd1bkVn?=
 =?utf-8?B?NWVyZHNOejZWWEF1ZUFPNGVXM2VBVEtzanU5bGlUbEFteHVTUmw1ckhTQy96?=
 =?utf-8?B?bmZTVVNkeEt6VjRXek9wRSs4MnU5Q2JaeHEvV0VqY2FJVCs4TXRhZm4yQUR0?=
 =?utf-8?B?SlJ3TWY4S01oV0xEK3ZHU3RxalRyUHhQWU5YUlhhMFJadjR3SU5XZXhsVHM5?=
 =?utf-8?B?ZXpqdUgrVVNhOWt0ZVZrOXNwQlQ4b3JzOUhtOXdiMm84TVltK09BM2w4Vlpr?=
 =?utf-8?B?d3A0YnV3RTdNYTIwNi9UL0s4NnJTVW5VU2NJb3pqY0cvYTVnWFBMRHI4K0l3?=
 =?utf-8?B?ejVJMzZXZGcwV1dPNlYrMFZJMGZVaUc1VFBNRjhpUXVxS3IzVTJTaC9WS2tn?=
 =?utf-8?B?bnRKUVJ6TFo1VzZHUlpHZEdYNGdnVUhud0hwdzU3cDVraFJ4QitsKzBEenE0?=
 =?utf-8?B?a1gxOU1VUkNLVGNxU1Urci8zSEgzcVl0eHM4WUJocVV5NG1WeEhhT0lLV2F4?=
 =?utf-8?B?WDhCeWhra2ZYRmlZb0RrYVRkb0NyMmVLQkNRUmhITHJ6OU1NN05UelFWYWxD?=
 =?utf-8?B?aTYyS1NzT21VR0M5aGk0ZzhpVXlWVFhxQ3dqdGxUOGFKOVdMdzd3ZitUSTZD?=
 =?utf-8?B?Z2ZuaFV3OW9Ia1ZXSW5rdzR4NWFFK2JLM0pvdU1IdG1pWG43cHBRMHdOTDlH?=
 =?utf-8?B?NGRKZEhocUhQTUs5T0lyUjhDa2ZaNjdDUzVuM3NMYkRwbytuVlJtUVkzQk1I?=
 =?utf-8?B?dSswcUI4MjVJQThMbmdSMHQwYXpXRGR6empQTURoZHpCanFVY2xRYUhMeTl3?=
 =?utf-8?B?SVdhTnRhYjhmRVlrYjZqVFcwaGdvUmhOb3NvdHNGNFJqTm1aSGN4VC9WcWMv?=
 =?utf-8?B?MTZJd25SUEt6Qk9QdU5HZXU3UVlTMldkRUJzdW10QmtxWkpONW9UaEJzTkpu?=
 =?utf-8?B?S1lWR1FZNXZOdVZzeGZHVzUzbVF1WFpBSmI3aHpqVVo1eTJEZldoNkg0Z3VE?=
 =?utf-8?B?NUFxY0FmY2N3T2ZSYUJEaDBjeFB3N3Z4UG5RSXhNTlVxV015aTZOWHNyeWhL?=
 =?utf-8?B?ekFwYUJ0K29yVWJTNHN0b2d3UCtNRXVSaTdUeW1uendOYWVXTVFrNzhNR3lP?=
 =?utf-8?B?K2swcXRnNEdaM1BHckt4dVUyZ1FhT3ZFWkpFbzkzZXYrMFNpT3BqOW56VW5i?=
 =?utf-8?Q?o2/Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACBD504BC4524A4F9B1BF9940F2EE4FA@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd086c90-f1c9-4319-af8a-08ddcffb6dec
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 06:28:14.4028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agIvbyBEP8NYabBpjRVeFg+qSnP/BH5j2B6jUxtZeBvcWzd16uKgaULtxfTGPBk4DSx88Dsx+TZjrPGjNZ3bwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247

T24gMjAyNS83LzMwIDE5OjIzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiBPbiAyOC8wNy8yMDI1
IDY6MDMgYW0sIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gdnBjaV9yZW1vdmVfcmVnaXN0ZXIoKSBv
bmx5IHN1cHBvcnRzIHJlbW92aW5nIGEgcmVnaXN0ZXIgaW4gYSB0aW1lLA0KPj4gYnV0IHRoZSBm
b2xsb3ctb24gY2hhbmdlcyBuZWVkIHRvIHJlbW92ZSBhbGwgcmVnaXN0ZXJzIHdpdGhpbiBhIHJh
bmdlLg0KPj4gU28sIHJlZmFjdG9yIGl0IHRvIHN1cHBvcnQgcmVtb3ZpbmcgYWxsIHJlZ2lzdGVy
cyBpbiBhIGdpdmVuIHJlZ2lvbi4NCj4+DQo+PiBBbmQgaXQgaXMgbm8gaXNzdWUgdG8gcmVtb3Zl
IGEgbm9uIGV4aXN0IHJlZ2lzdGVyLCBzbyByZW1vdmUgdGhlDQo+PiBfX211c3RfY2hlY2sgcHJl
Zml4Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQu
Y29tPg0KPj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KPiANCj4gQmlzZWN0aW9uIHNheXMgdGhpcyBjYXVzZXMgYW4gYXNzZXJ0aW9uIGZhaWx1
cmUgaW4gdGhlIHVuaXQgdGVzdC4NCj4gDQo+IFJ1bm5pbmcgL3Vzci9saWIveGVuL3Rlc3RzL3Rl
c3RfdnBjaQ0KPiBBc3NlcnRpb24gZmFpbGVkOiB2cGNpX3JlbW92ZV9yZWdpc3RlcnModGVzdF9w
ZGV2LnZwY2ksIDE2LCAyKSAobWFpbi5jOg0KPiBtYWluOiA0MDcpDQo+IEZBSUxFRDogL3Vzci9s
aWIveGVuL3Rlc3RzL3Rlc3RfdnBjaQ0KVGhhbmtzIEFuZHJldy4NClRoaXMgaXMgYmVjYXVzZSBu
ZXcgZnVuY3Rpb24gdnBjaV9yZW1vdmVfcmVnaXN0ZXJzKCkgcmVtb3ZlcyBhbGwgcmVnaXN0ZXJz
IGluc2lkZSAob2Zmc2V0LCBvZmZzZXQgKyBzaXplKSBhbmQgcmV0dXJucyBmYWlsdXJlIHdoZW4g
b3ZlcmxhcCBoYXBwZW5zLg0KRm9yIHRvb2xzL3Rlc3RzL3ZwY2kvbWFpbi5jLCB0aGVyZSBhcmUg
bGF5b3V0Og0KICAgICAqDQogICAgICogMzIgICAgMjQgICAgMTYgICAgIDggICAgIDANCiAgICAg
KiAgKy0tLS0tLSstLS0tLS0rLS0tLS0tKy0tLS0tLSsNCiAgICAgKiAgfCAgICAgICAgICAgIHIw
ICAgICAgICAgICAgIHwgMA0KICAgICAqICArLS0tLS0tKy0tLS0tLSstLS0tLS0rLS0tLS0tKw0K
ICAgICAqICB8ICByNyAgfCAgcjYgIHwgIHI1ICB8Ly8vLy8vfCA0DQogICAgICogICstLS0tLS0r
LS0tLS0tKy0tLS0tLSstLS0tLS18DQogICAgICogIHwvLy8vLy8vLy8vLy8vLy8vLy8vLy8vLy8v
Ly98IDgNCiAgICAgKiAgKy0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLSsNCiAgICAgKiAgfC8v
Ly8vLy8vLy8vLy98ICAgIHIxMiAgICAgIHwgMTINCiAgICAgKiAgKy0tLS0tLSstLS0tLS0rLS0t
LS0tKy0tLS0tLSsNCiAgICAgKiAgfHIxNlszXXxyMTZbMl18cjE2WzFdfHIxNlswXXwgMTYNCiAg
ICAgKiAgKy0tLS0tLSstLS0tLS0rLS0tLS0tKy0tLS0tLSsNCiAgICAgKiAgfCAgICByMjBbMV0g
ICB8ICAgIHIyMFswXSAgIHwgMjANCiAgICAgKiAgKy0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0t
LXwNCiAgICAgKiAgfCAgICAgICAgICAgIHIyNCAgICAgICAgICAgIHwgMjQNCiAgICAgKiAgKy0t
LS0tLSstLS0tLS0rLS0tLS0tKy0tLS0tLSsNCiAgICAgKiAgfC8vLy8vL3wgIHIzMCB8Ly8vLy8v
fCAgcjI4IHwgMjgNCiAgICAgKiAgKy0tLS0tLSstLS0tLS0rLS0tLS0tKy0tLS0tLSsNCiAgICAg
KiAgfHJzdmR6IHxyc3ZkcCB8IHJ3MWMgfCAgcm8gIHwgMzINCiAgICAgKiAgKy0tLS0tLSstLS0t
LS0rLS0tLS0tKy0tLS0tLSsNCiAgICAgKg0KQXMgZm9yIHRoZSBsYXN0IHRocmVlIHRlc3QgY2Fz
ZXM6DQogICAgVlBDSV9SRU1PVkVfSU5WQUxJRF9SRUcoMjAsIDEpOw0KICAgIFRoaXMgY2FuIHN1
Y2Nlc3MgYXMgdGhpcyBvdmVybGFwIHdpdGggcjIwWzBdDQogICAgVlBDSV9SRU1PVkVfSU5WQUxJ
RF9SRUcoMTYsIDIpOw0KICAgIFZQQ0lfUkVNT1ZFX0lOVkFMSURfUkVHKDMwLCAyKTsNCiAgICBU
aGVzZSB0d28gZmFpbCBhcyB0aGVyZSBhcmUgcjE2WzBdLCByMTZbMV0gYW5kIHIzMCBpbnNpZGUg
dGhlbSwgc28gcmVtb3ZlIHN1Y2Nlc3MgYW5kIHRlc3QgY2FzZXMgZmFpbC4NClNvLCBJIHRoaW5r
IHdlIG5lZWQgdG8gY2hhbmdlIHRoZXNlIHR3byB0ZXN0IGNhc2VzIHRvIG1hdGNoIHRoZSBuZXcg
ZnVuY3Rpb24ncyBsb2dpYywgbGlrZToNClZQQ0lfUkVNT1ZFX0lOVkFMSURfUkVHKDAsIDIpOw0K
VlBDSV9SRU1PVkVfSU5WQUxJRF9SRUcoMiwgMik7DQpPciBkZWxldGUgdGhlbSBkaXJlY3RseS4N
Cg0KSGkgUm9nZXIsIHdoYXQncyB5b3VyIG9waW5pb24/DQoNCj4gDQo+IEZ1bGwgbG9ncywgbm90
IHRoYXQgdGhleSdyZSBvZiBhbnkgbW9yZSBoZWxwOg0KPiANCj4gaHR0cHM6Ly9naXRsYWIuY29t
L3hlbi1wcm9qZWN0L2hhcmR3YXJlL3hlbi1zdGFnaW5nLy0vcGlwZWxpbmVzLzE5NTY4MTc1ODcN
Cj4gDQo+IH5BbmRyZXcNCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

