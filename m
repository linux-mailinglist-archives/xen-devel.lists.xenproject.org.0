Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5337DA6773E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919254.1323757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYWs-0001OB-Vz; Tue, 18 Mar 2025 15:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919254.1323757; Tue, 18 Mar 2025 15:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYWs-0001Me-Qm; Tue, 18 Mar 2025 15:06:54 +0000
Received: by outflank-mailman (input) for mailman id 919254;
 Tue, 18 Mar 2025 15:06:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/Yt=WF=dornerworks.com=Nathan.Studer@srs-se1.protection.inumbo.net>)
 id 1tuYWr-0001IB-AY
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:06:53 +0000
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on060c.outbound.protection.office365.us
 [2001:489a:2202:c::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ac282b2-040a-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 16:06:50 +0100 (CET)
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:195::20)
 by BN2P110MB1107.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:168::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.31; Tue, 18 Mar
 2025 15:06:40 +0000
Received: from SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea]) by SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
 ([fe80::4c02:35de:2909:2bea%4]) with mapi id 15.20.8511.031; Tue, 18 Mar 2025
 15:06:39 +0000
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
X-Inumbo-ID: 9ac282b2-040a-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=nxeEDiP5YfZUVcht/WfB7AdVqnCR2gsboopwnzFUOVIUk3RxThb76kC+IwQSl+/3VX6/CWWYmFFXhs9DiPL0HOcxT+u3P2dw66ADLC4Zm5hl2F2ny3eJJxqAdKe8KRlUOsWxVmU5sJyJSGtv35QpiaEKt0kWgdOik0dQhXb8Zg5Q/yRovul4EUXgEqM+Bk0p2HjHxrml4nJfDwfKUewCVineqp2uKhZdN9EFI9NTMZE/zOzBuQhPFhuu07+iO6ZemFc0xCyAZJnB1a/j6lI2B6boTJZkxhP4DIBp43uoACA0A5UgNjliQYXbndkS2e4GUihMMd1cVQxtngYxZiEnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSZ5siWqBEmVcR2JIJqm3FBxpeOJGMh1g6NXp/6BBM8=;
 b=tKXo4ShjxgiqXPxHCVPwjWk5lXfcss6RczyPwPwvYD84ZNjTJnQJ++JHHi0kE4InaeTOILKBkAULqV7fy5YK8NBZmkFbB7oDy8aXL6VUbbgIjY1xihbLTuQoVud5V/Cv2CyOrC0wVALjHFid+DJG1FuqqV+NK149i+eWYSR5A8Yjoql+EL3l7+M0RQlRzexsxPaa6XVHSUk1ZTWGSrZ/gfiPwcp7eAXM2kn/lZeQ0myRmPO2pW7bJCpISj61MRDK0V5V4rvfjNPTfoZ6wN6BoqKLjSg17nGnJEGkTp8RWP3uEEw7QKWhOruBTpWmU7UNxS/x7F63kCwKN15G3fEW6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSZ5siWqBEmVcR2JIJqm3FBxpeOJGMh1g6NXp/6BBM8=;
 b=cT4SJxP1eUlxvzNchr65aXG5IChipP+BFHGDQpAvwtj+QDbDTOJ4r0cFuyc+XvG49fzGlSsE6Ws8ruD/YjwpE2va2Qd1k31x/dO5B2oLzCbXu4aJ4RlOIcHi4jHkV3I7hU5uyj3QvwrC5pPE1DaG6xFPAFjpst91eziX/hqywVD1G8ZLlAgRSwlARyY21NeQfWenc3LzbG0jfTHMaLPJ96WJYnYc7vVBrSfXOwgYPzsCLAKh+QVFzTIKEh2VgZ3s6z7ODbdX+JJ7NR8ml/08PZEivu1w9KV5ceION/2njta49i0E70oRChfWp1wNJIqitTCTSUuEv19H+gOMPZHLqw==
From: Nathan Studer <Nathan.Studer@dornerworks.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Anderson Choi
	<anderson.choi@boeing.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "stewart@stew.dk" <stewart@stew.dk>, "matthew.l.weber3@boeing.com"
	<matthew.l.weber3@boeing.com>, "joshua.c.whitehead@boeing.com"
	<joshua.c.whitehead@boeing.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>
Subject: RE: [PATCH v2] xen/arinc653: call xfree() with local IRQ enabled
Thread-Topic: [PATCH v2] xen/arinc653: call xfree() with local IRQ enabled
Thread-Index: AQHbl9hEHxF9vhDK30ipwzG0NwoWCbN4gt+AgAB8IlA=
Date: Tue, 18 Mar 2025 15:06:39 +0000
Message-ID:
 <SA1P110MB1629BC07E584787DE8B259EDF4DEA@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
References: <20250318073415.6652-1-anderson.choi@boeing.com>
 <735dd1b8-80e3-4748-b96d-e30cfe6943ac@suse.com>
In-Reply-To: <735dd1b8-80e3-4748-b96d-e30cfe6943ac@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dornerworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1P110MB1629:EE_|BN2P110MB1107:EE_
x-ms-office365-filtering-correlation-id: b14fb519-818c-41b9-6542-08dd662e7c73
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?elVoUjZsMGNMSklzNDRlb0s4eVFvRWhnbE11M1lFVEUwbDJzcWYzU1BDbm0v?=
 =?utf-8?B?ejZjTEQ5N1NYQXpVbGtkNXh5di8zNkZSczFTWEU1bDM4QVFhNnd4amtkSkdI?=
 =?utf-8?B?UWFFc3dGRGljYVdlTWdEMmdMUHE5MTAwL0lRNDRhSmVaVi9SOURXa1RBZ3V1?=
 =?utf-8?B?NXRvNUxwQzJFQ0NEMnlta1BhOXVDVXd6VnpUbS9XL282eTd1dFVYS3pvb3FX?=
 =?utf-8?B?MHNpampCaExZLytXWVJrUkhNa0Uwenh1aUphbUxSMDdYaXdOU1ErZ0dOTUZ3?=
 =?utf-8?B?bVZ2dnRSUGEyWWJsdW1hWVhpMVN6WGFSOVpNekRnMU9TczdsYWY4VjhiRks1?=
 =?utf-8?B?bkpjM2srcUh1N0s3UjdsQ08vNml2UzZpUzY0L2ZUTDQ0aXFqSXJKRUd3U1lw?=
 =?utf-8?B?L3I0YzNVSUpXT0dmSUVCUFRGMExoeUpkczlvalM4aHV2RURpS0tiSzZvQURr?=
 =?utf-8?B?WE9WTVd4bThlWllBa05ZWksvWFQzU2RrQi95TmxMbzdzdmcvQVhCNlg3VXFi?=
 =?utf-8?B?eXFmcUoraktUY2Z1RWszYTkweWpzZncvMjVvNEx4OTIreHN5UjhOSFVwN2E2?=
 =?utf-8?B?cWlwbzIwZzQ2c2pxa3E5eWhYVkViZ0VSK2h5SVlLL1ArK0ZyUmhnZTdsS3Qy?=
 =?utf-8?B?cmNDUm1uNEhlUWxSSzF4UFNINTd1Vnh0TmRXSm01ckFmMHFhVlF3TE5CYVJ1?=
 =?utf-8?B?TE1uSUhobVhHRzVNRjZnQklPSy9SMmc2SWJybVI3QWtRUXhucDlEaERTVEg1?=
 =?utf-8?B?cmFvNU1VVXhmYVpnNW1iMHFmT29LWHRRZ0pVQ3JFWHRjTGpEYjJqdURENGt4?=
 =?utf-8?B?NVhVRzVtRVJqSDArQm05N1pRbUlhSVRkeFB6bk1DVDFRKzBFVmVrYlVYeVZH?=
 =?utf-8?B?MVp2ZjE2c2NyenFCWFBKNTZ6aUdGSS9RTThKVUMvRzRsN0Fqa3JiQUEvOGp6?=
 =?utf-8?B?bEt2OHZGRzB2a0lpMWJxTm5ZaXU1amVWeEw4MGk3VktUM1NVamduYnYvNjhD?=
 =?utf-8?B?T1Bnc2c3cEVDckVqTUpncVpNcW1jYncwYzdwaWcyUXE1Zk9vU09Dc3dET3BB?=
 =?utf-8?B?enh3UEQvSk0wS1Y5a3ZZbU13NDBabXVCWGdzb3ZaODhaSmI3Nyt3N2N4Vjcr?=
 =?utf-8?B?UHFiNGxTck1YV2pNa3REd3EzWXlUUUNzaUxjcjZJWkhhaUlpN3cvNDc5dGJ5?=
 =?utf-8?B?OEZQZWNzWS9rRms2NmU4cUErN2pJVHBDK2NjTkk3aXRtV0xmSU9UZGNBRG5o?=
 =?utf-8?B?MGowbVVCNHlqY0lhSzFSTEdPeVRTV1BvZzJacTMrYnRDc1pxUVgyQXUyQWpy?=
 =?utf-8?B?TkxwV0pmb0kveStCSkN4RFdkaXYwc0lOcGVLeGdrN21aSExqb2xrZ2habnd4?=
 =?utf-8?B?dEpoVGRBZWJETE5TRkRtdnllVXd1emhxa3JMYXdJSERnUDdEM29TSkJFTGIy?=
 =?utf-8?B?c2dDRm1sWkkxbm8xZDVKM2c0SGpWVVNlNExMSFF0WktwQjNuYVEvMVJEZFlP?=
 =?utf-8?B?NVpiODdGSWIyaVBjME1wRFdtRmVvR0lOUVFQdkFmWnR0THBqOUtFbmk4VHEz?=
 =?utf-8?B?M2FrTWU3Rk1wQW1uT0wyaVVFajNlL1ZwMERTbmduQWtZaFV0ZE9xaGpvclJ3?=
 =?utf-8?B?YlV1R2gxbnFvaUtTMjBPSG1vTDBxcUw2dXI5UDZRMk4vMU5QbGU2cVJrTzlK?=
 =?utf-8?B?SHZiQnI0eDZsN3pRUXQzL0dYcVBCZ0h4enJBN2kvcU1weXFKMWFkRFJxNDVr?=
 =?utf-8?B?WjFaOVhUcGNvck5GL2hWalY4OXRZOG55elBaQXVmMVZzaUJsQS9hSDhvUkU2?=
 =?utf-8?B?UjV4aUhjdlhRb0h4WW1hUWxaS3pXNnlaYUwvYjYxRUZjSjNqVC90VXN0a2oy?=
 =?utf-8?B?WldoOFNxNXpHbzVmVHhnK2VtOHVqL0FDK2NmTjNpSTVOVmdqUjJ0c0NDMUFo?=
 =?utf-8?Q?7IaSs4o3cvCD0JIZwveBtFzlWWUUeUWw?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjU1MVVYVTlzRWd0TXJ1WXN0OGxDNURrdGJzbkZVV2o1M3hVTkdrVHJOMW5F?=
 =?utf-8?B?Vm9LNWJWcC9mcFluL3B0d0NJME5LSXRMc2R6ZG1iQ1lyVVMrK0VpQ3hQMlN4?=
 =?utf-8?B?SEpHT0h2V3NEMjhyYzg5dmZIYnM2ck40THMyek44QUF1czJ5VXVLSjVMVStI?=
 =?utf-8?B?QWxjTHppditzYm1DRi80WE1RK2pvSXF3R0dzcnQydnJEcmJpSE9qOTkydDRt?=
 =?utf-8?B?blRSbzhCNDlveGhoei9wMHhkWHVVUFNnM0VhaDNrYTB2cmpQd0lPMXFKOVhj?=
 =?utf-8?B?YUIweXBEcGpMZ21WVDFjMkFKVk1Gd2k5cHpMMTlCU1FOZmliSVZwSVdjL0RJ?=
 =?utf-8?B?RFI2MS9wNEtBdTI4dWxLNHlVWlhCTEl1NWErNWVtVVBqamQ1ZkdxU2F4anp3?=
 =?utf-8?B?NWNmS2R2eW00bjFuNGJ2WUovMU5lWGpqUjNnVWNBTDZNbTNBNEtveVNIdmFZ?=
 =?utf-8?B?SCtCbFdCRWsyeGhaTFp2MVFpV0VNcklVUXhkVHVCanRySUlscW11RkNLbzNO?=
 =?utf-8?B?TGlDM2ZQcDZvMVdDczNzeCtwWDZHSXJXeElCb3d2OVBWVDZRd1ZzZUNabCt6?=
 =?utf-8?B?MDU1d21kTW9pRnpXbG5POXZpZkpJQm1yQ1dIdU9Zbm5KTWxYeHV0OU13QXpD?=
 =?utf-8?B?MGdqenFsQk5kMENkQTVlVE1LUUJsdU9VK2x5QWpmaTA5S1lRRlBoLzZPZS9i?=
 =?utf-8?B?QlR4YXpPalhZOVpHR2d5bjRKVldwUlB5THVwdE9MMnFzb1RhTURWRXl2ekhU?=
 =?utf-8?B?cjZKbkFMeWtiVE50NEZNOGtSQk1jZHd1VzY4SVdxazRXZi9OVStsd0pLN1JN?=
 =?utf-8?B?TksybzB1Z0h1aUdNUGZwUUVoY3RLZ044bC9mZTRiUzJSZnI2NVpOL0xlNGJM?=
 =?utf-8?B?Q09yVUt2LzQ3eHc5RVhGaEtnbzhPMjZqUFFiMlNIVzJnYjIvQnJPSXRmQ3hp?=
 =?utf-8?B?bE9Kb2ZndVB5ZmZGS2JqZWs5Ym45Q0hpZ1IrV2puU1pGZlVsbFpvSnpwOFZI?=
 =?utf-8?B?NHZpRHBVelZrbGpRV1BtTXIzeTZ2Tk1hRTJDcDlxOXIwc3kxbUFpdklxSE1C?=
 =?utf-8?B?MXMzZDgyTThwcFd2S0FtSWZ3Y3o5SWc5bFhjQXovWlMwS0N5dG53QzFmMnox?=
 =?utf-8?B?aGd6eDcxb3M0NVo4dFN6aXh6bW9laVJhZ3lNRFh1am5VeFpFdDVjbHNSQ3Jn?=
 =?utf-8?B?UVBTVGsrS0M2TS9HMVVuakRteUVSK3ZnV0pWUUVwdzBkcHJNQUxEVHZ6R0ZC?=
 =?utf-8?B?VURsOUJYUk9KZnloZ09qOHRzUGdsWmNPUkNLbTFna2xNdHhjZU5iWEc0Ukx0?=
 =?utf-8?B?bVhWSDUranBaUWN5enNLdDZDL0RJVTlqWHY3UWdqWTdRUXkrQmtSNG9GR2Ji?=
 =?utf-8?B?aWlkMlQyeXNwdUZadzlBMWg3RVErcFliaU1zbzBHM3BYVy8vei9UeitPdGt3?=
 =?utf-8?B?dmFNdHhPWW9ueElMKy9tUmFVR0k4aHd4UVlET0RtL0dYS0FXTStXSUZqT0xX?=
 =?utf-8?B?WDFWazI0UTdzd2FvaE5pTDVKc29ybTRSUVYreGpCRXVJeUlIcDlTZGtmYm9P?=
 =?utf-8?B?TGVKZGFra21UY3V3SC9MNGVjSkJsbkg3c0l4RUV3WTE1NXBGN0doUFdZa2hl?=
 =?utf-8?B?NkViM2gvNVExTTczTjZwK1RKeGZXcTBUS2ZWSENWbjlmTVVrSmcwV084R2Q0?=
 =?utf-8?B?QUphSWt6QTVielpzM3RvMDNxZkRISm1DVWJxOFc0S2dTczl6cjQ3V05uVEpv?=
 =?utf-8?B?b2lhL09TUy9JQmhDN25VcWNvaUNXdkVaSTFhQ2lId0dvUTVsd3k5bHRCWWhT?=
 =?utf-8?B?c2xpY3lVTktTK05GTzdCK1VsYWJISmpKeHNTdmFCd3JkWTQzaFFLQUZ1NHBO?=
 =?utf-8?B?VUVOQjA2Z3pnWC9mTEZOTWwrdjF3OHlsUk5XM3B3VWpCcjUzcmt4c1ZDQnR3?=
 =?utf-8?B?cjFwdnZaNk0yVjlLVXhYdGZlTDFTV3ZkZGxabEhXbnJzQ2RiZTRFbk5ML25K?=
 =?utf-8?B?Zjl1U2lpSTV5MFcvMlFFTlBqY2syM1VRVVpvVTlNdzdpUGozVWhhN3F1aVo1?=
 =?utf-8?Q?CXQNBm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b14fb519-818c-41b9-6542-08dd662e7c73
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 15:06:39.8524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1107

T24gMTgvMDMvMjUgMDM6NDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDE4LjAzLjI1IDA4
OjM0LCBBbmRlcnNvbiBDaG9pIHdyb3RlOg0KPiA+IHhlbiBwYW5pYyBpcyBvYnNlcnZlZCB3aXRo
IHRoZSBmb2xsb3dpbmcgY29uZmlndXJhdGlvbi4NCj4gPg0KPiA+IDEuIERlYnVnIHhlbiBidWls
ZCAoQ09ORklHX0RFQlVHPXkpDQo+ID4gMi4gZG9tMSBvZiBhbiBBUklOQzY1MyBkb21haW4NCj4g
PiAzLiBzaHV0ZG93biBkb20xIHdpdGggeGwgY29tbWFuZA0KPiA+DQo+ID4gJCB4bCBzaHV0ZG93
biA8ZG9tYWluX25hbWU+DQo+ID4NCj4gPiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqDQo+ID4gKFhFTikgUGFuaWMgb24gQ1BVIDI6DQo+ID4gKFhFTikgQXNz
ZXJ0aW9uICchaW5faXJxKCkgJiYgKGxvY2FsX2lycV9pc19lbmFibGVkKCkgfHwNCj4gPiBudW1f
b25saW5lX2NwdXMoKSA8PSAxKScgZmFpbGVkIGF0IGNvbW1vbi94bWFsbG9jX3Rsc2YuYzo3MTQN
Cj4gPiAoWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ID4N
Cj4gPiBwYW5pYyB3YXMgdHJpZ2dlcmVkIHNpbmNlIHhmcmVlKCkgd2FzIGNhbGxlZCB3aXRoIGxv
Y2FsIElSUSBkaXNhYmxlZA0KPiA+IGFuZCB0aGVyZWZvcmUgYXNzZXJ0aW9uIGZhaWxlZC4NCj4g
Pg0KPiA+IEZpeCB0aGlzIGJ5IGNhbGxpbmcgeGZyZWUoKSBhZnRlciBsb2NhbCBJUlEgaXMgZW5h
YmxlZC4NCj4gPg0KPiA+IEZpeGVzOiAxOTA0OWY4ZDc5NmEgc2NoZWQ6IGZpeCBsb2NraW5nIGlu
IGE2NTNzY2hlZF9mcmVlX3ZkYXRhKCkNCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRlcnNvbiBDaG9p
IDxhbmRlcnNvbi5jaG9pQGJvZWluZy5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPg0KDQpBY2tlZC1ieTogTmF0aGFuIFN0dWRlciA8bmF0aGFu
LnN0dWRlckBkb3JuZXJ3b3Jrcy5jb20+DQo=

