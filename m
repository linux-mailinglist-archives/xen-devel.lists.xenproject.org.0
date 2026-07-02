Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ps+aIH4cRmqZKAsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 10:08:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F26A6F4958
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 10:08:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=uhfpK7UQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1351350.1608542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCSI-0005Jc-JU; Thu, 02 Jul 2026 08:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351350.1608542; Thu, 02 Jul 2026 08:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCSI-0005HJ-G2; Thu, 02 Jul 2026 08:07:30 +0000
Received: by outflank-mailman (input) for mailman id 1351350;
 Thu, 02 Jul 2026 08:07:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wfCSF-0005Gx-0z
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 08:07:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfCSD-00Ctpl-IC
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:07:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a461c3d-bab6-0a2a0a5309dd-0a2a4502db44-0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 10:07:25 +0200
Received: from [40.107.74.104]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a461c36-5a27-0a2a45020019-286b4a682f06-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 10:07:20 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OSOP286MB4065.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 08:07:15 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 08:07:14 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUkYh5Y+D4G98NAg0UpiOP8AVDzft/twQmPLC2YhKR+ssLXIYyXh1a7LHafNPoAgzVzCdpFlC/0HZp+HfBTMMP6taiusMZHhAz8Tir5FT/k20c4+pPqQByeGDPUjxL5vKl5mn2SsXKFpJN8Rgg62IUAL0LCE7/5B4dSaHzhSZW4n7FsNg63gT/4HpovhKsNIUj6+gyesgGLY0Uuw/IiAm0KcjZ7GwtkPm97/tEJkJbXDoHRSQmfS8gXAcdxEBjpcfUxbQ30ZzWYKL6iRlXzWsWcsDFcQu8uzoD+VV57IuL6kSqHlAZ9mGoy7Nk57BJVtuZ0CRi72sOvCXVQQ6hVkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lm2Xs0vJxEQMJv1GsMyDFtYzEB3g9T9GExU9KeoBEME=;
 b=TTfMWqQbf7ExHLGwmLHGXASOue6glenvR24HxYdWJAaa7Y1wjum7rJvrofhVuqhBQv3WTFFhuIC+nQ8wwgH/vBTwVRC5Jne99eYCnqoQQameSnTiCZwlLXFGT02U3d3v3UZ65JYa1jdmSm/j619lOnjQwYpZ+pRmzYjdeBEtyUJe+8DI8cZACGV2xQgXB/OhXvSqpOHC0WvfZYE2+fqDDO0Du+vZCdu0P+PJTRpVAaFdHePtuldT7eedFxL297dnS3AUCTZ7WrPZmVw8GIVj4SVwFFgwvfL3ABKrSDah9fpU4QxnNZE0zrg7EhY4p8g2jg86HRpKwZ4RTeoSR8kMyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lm2Xs0vJxEQMJv1GsMyDFtYzEB3g9T9GExU9KeoBEME=;
 b=uhfpK7UQJRnfZ4PE66it2mfE+IwSXsRo73cFEF1vVmJYgQ2zzPNlhFP0beZirxtd6ROur7wBKMKS1ISu649VLXKwiCRxfAGg8sMcu03h9ccxOZ+M0eCQLKHzdyTOiFbprRryyFYufPtS5d4yUyc+JjgB/0yyus5FRMbxsnH0DRY=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v3 1/3] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index:
 AQHdCBJguMZzJpb/JEe22XtErI4LcbZWqjWAgAHISeCAABufgIAAi7BQgAClhICAACFHIA==
Date: Thu, 2 Jul 2026 08:07:14 +0000
Message-ID:
 <OS9P286MB72221B73D41A41B205D437D982F52@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260629215806.11610-1-taka@valinux.co.jp>
 <20260629215806.11610-2-taka@valinux.co.jp>
 <97dd9fd5-c0de-4125-a40a-b7f6e1aed27d@suse.com>
 <OS9P286MB722293D7D09513349055BA4B82F62@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <a69129b1-f16b-4ce4-bf88-971f37eec418@suse.com>
 <TY7P286MB72346237AC47028E012D145382F62@TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM>
 <52d1d0b4-6b90-4eb8-a299-7adcc7634f33@suse.com>
In-Reply-To: <52d1d0b4-6b90-4eb8-a299-7adcc7634f33@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OSOP286MB4065:EE_
x-ms-office365-filtering-correlation-id: 69e0d0d9-58d4-48c4-a492-08ded810ed79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|22082099003|18002099003|38070700021|6133799003|4143699003|56012099006;
x-microsoft-antispam-message-info:
 n0/7h4MQ4qZMOroI22vBzlBi40tmSTgQQRg7ZbDdzKoZnLVIegGae8CpB+UZlFCSC1eFuqK8KjcnKUMDtcJomDZJGdEZW0P6mWG0wn6Ds3f7QxTjWCZRY2OavH5iJSvkuCrHHJ6lY7FhMgh9nG3U/zjerHPeUY2w7u3sebn+fPp5u+A1sg4MZZFV52X0UKp88SAvUwe7Eq+8b0Q6YAyEnLWASEm7PI9AYs+KqIQNLxDkFpj8Agt8AsXW2PKlNGQnJTDtYIBL3RfOE5pVxjtchBLkvEIvI8UYymP/w4KWIyQzLnhLSZ7QUJLFT9QQvN1W8Skquhk3Y1tuaRK70Tqa+OiZc/+k6m4Mx6pOyhexyH9WWa1kJ5ZQC4RuwIscWIGv2GhK2obUo4lYMf0ZVuJkBRR5uDnxxtnvheI0+ctJcEZsKRVo8z32ecBQVUI7m85cFc3hUlFYJpGt6Q34fWSgFwe5IFB3rVxJwbx7Q3vpawXjLiddwNHHR80tDYPC4/+LnvKzJdI3yHVJfkyHp/ArPumW+uCCMVoE6vCG3uhIhQ0178PrvFTaskeTRbwFR46YORMF2iGIXei/d9zK28VstFE3UUjyLLnKGhuSeI62MZdTAcCDRq+KLy0X1zROXYOGEq/mf4Alwhtx+Zh5TGhIZw6TwbSc/+VHfsNaAv23gASAd1rCbLCmiJE/mJzCBily6xwgkKtRUs4oaOr1MobiVGXefTpDn3Rfrb/9cCuJcW8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(38070700021)(6133799003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjBQYnN5a2xOOHlzWnNlWW9adWVoOUMwaTNsUFlLM2hLZm1iN3JHdVRvVWRx?=
 =?utf-8?B?OWluemhhSDBPWVpRVHVTZkx4elZkUXUrVys5QXIxOXIxYndKYWp5czRmSEVr?=
 =?utf-8?B?ZHFzdStJNVk4T2JTbjRvVDZCYjEyMWQvajlOMFlzSWRmb0w4SnY3OFc0T2Ux?=
 =?utf-8?B?dzRwNkE1YlE3QXB0UjVIbUV5UjE3eWM4Z0hoUDV2ZXlCVnZBUkUwYUFLUEpa?=
 =?utf-8?B?OEhrSmdLZFJSZHlDclhJVWl3TWI5YitaRFdqNSs0SUM4ZGZpUXZINXNxaXhF?=
 =?utf-8?B?NmFUdExsTURvT0dISEVqLzZ4SzFvalVsVksyNWwybUZhaXBsdUx3ZXVMQjFv?=
 =?utf-8?B?Qm1URHBvM2I3RXBlc01qemROUkZHcmZaZi9WUU9JYnZKbUV6MkEzVE0zMHpP?=
 =?utf-8?B?SlRCQmQycEE4SVpCU1QxZGhtb25NU2l2K1hjRDJUS0VJRnZyeEswZHkxWUVX?=
 =?utf-8?B?Q1Z2S1BQeDZ6SnB3S01hNjZiK0tJNHlQMXAzUGVKUzA0LzlTVTFVblRjV3Nh?=
 =?utf-8?B?cWF5V0lLZjB0alA3RmtJNkc5ejYwN05jYXd3R21OZ0pCOEVEV2ptYnYxRlFG?=
 =?utf-8?B?YnVHQlU3MDZRUE0yM2p3amNWL2xNUEw4dkNFMVBIcXJBM2c1YnBCaVMzK2xI?=
 =?utf-8?B?RHNyazFYdjNzUVlBSFUwb2lhSVM2Rm93UVBKZkF4SE5ZTFBMekR5SXl3d0ox?=
 =?utf-8?B?Ylc3SjlrYzRKODhudXpjc2dPNCtXYStMN2ZHZ1ljcXQ4WG0zc29DaUxqczV1?=
 =?utf-8?B?ZXlDSkhCTUJxSmhLNEgzK00vMjdYUVdIdjE4NmdTenBrOVlCU2xHZytOKzds?=
 =?utf-8?B?WGZJZVprdXdTMUFQMklUUTJwZS92NUk0enE2ZnQybTRXaHk1UjBualVZZlNy?=
 =?utf-8?B?ZlRTZ2Y1L2tPWlk2QlpDNVdwYkFBYkM4OW9RbXpVZXBJakl3R0NBN2ZDOUxJ?=
 =?utf-8?B?bEpEMHVwKzhwRHNUUVQ4RmxVMjgvZ1pkUk1WSHJlUzROSVhCQXcyN2hhSHRp?=
 =?utf-8?B?RndMMUJZMkVWSjRZY0gzWFNGT05GSEZjdGtJcS9QSjNqWVpXSHRlUzBLNStR?=
 =?utf-8?B?dUdCMksxRkRvRGZQRzlpUkhxbzRmL0M2RjNmVHRROXNtS3hXNS9LZU40Nzdi?=
 =?utf-8?B?QVFnYzVtMlpoYnBGNVlhWnVSemhSajV2dEw3OEZwRUV1a0hjYWdnSktjZlVG?=
 =?utf-8?B?dVlRTnNpTldWVzNvOGVTTW1FTEVDeTNHZUFsQlIwMGQxcWtRMnc0U2g1UmZL?=
 =?utf-8?B?dU1LaU5VeEJDSGFwZzMyWTNOeUtWalNqd1dibkliMVJWTmpmcTA0Y2tMbGpZ?=
 =?utf-8?B?OXFiMmpoSEZJV3pQY3B4T2dkM2Y0eGFnZFRpNU5PMlEwaTRTcEV6MWx3UUFD?=
 =?utf-8?B?NXV5YlFzNTMxRFUwS1A4MnRxdWNvK0NYN0xqNC9oOHZWMHBDOGh1YmNia3M5?=
 =?utf-8?B?MUNYWmdTeWgrRm9lcFJncUc2L0QrSURCSGk3RGxQMU52NWFLdmppWUQ0MGRu?=
 =?utf-8?B?Ri9oRkdYRE1maTYrZ3JkeVI3S1VZUjgzbnlERFFYak5SZTFIcUY4TXA4aTZQ?=
 =?utf-8?B?SXlzQUNScVJFajZQRXR0RHlVQWpDL2tyTGIvSGFZa2NnbU9LTVVEWDVZRG1t?=
 =?utf-8?B?cC9waHgwNUFhVHd3cnEvVXFSb1F6UVVwM21Rd0NsWWhzemQvZmFJKzlVb05x?=
 =?utf-8?B?MHdDd1B6M2V4WWM5SGtCU1dnelRsbUNVRHhaL0srdEcvK3N6V1dSTzVScDg5?=
 =?utf-8?B?VGlEcVphUGxkbG5ZOEIwTjRMeEtZRW4yUThKbjJ4ZW1HcDVqeWRpNWpIRUIr?=
 =?utf-8?B?V2FUcUVxTFM1UExSdE5PWGVZS0RDaVU3MGJ5VFNMQUV1Yyt4eVNkUXNGWnJX?=
 =?utf-8?B?ZURiT29UajQzTFdsZ2FBYngrZ3NlN3BDOS9KVmk4eTVMUXpoRUpyV2dzVnFK?=
 =?utf-8?B?QXhOWG42czY5YWZWQ3R6TWtuYkRybGRWR1lvSGJWSE8vdlpsQkxJTmp6QUhK?=
 =?utf-8?B?OG01VSt3Z2FtRVFLTEt3cG43a0I3dHBlemVHdzZ2R21mTzlpdm5nMXM0VEhX?=
 =?utf-8?B?RWRFcStha1NtRXVrdVhETVBFSU80N0ltZExGa3lBY1ZST0czV0RxK3M1OFNN?=
 =?utf-8?B?Qm9sSE1mTGZqR1dQZURnSkJ0dFViOWliTndFRUg1eUp1NC9ORWdlbHpaMnNi?=
 =?utf-8?B?Vkhxb1VmeUlwR29uMDZFbWtlbkttcVZpandXc3JXTDcxajJlRnc2SS9wTFNr?=
 =?utf-8?B?eTNYNGxIVkxaaVZtY3U1elNlV05tU1RQVzg0R1F0Mkl5RE9Va1hmQVprZ0JJ?=
 =?utf-8?Q?ulGNjzAO/a9YTnJvDb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e0d0d9-58d4-48c4-a492-08ded810ed79
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 08:07:14.4600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrbEhs0iaRbForExSyX8lC1a6BhQVSbzcFRi3U5CNR9QQEV+5W7du7YmOAagCCjfR/5l+bl30r4MyOi02KkELw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP286MB4065
X-purgate-ID: tlsNG-720697/1782979645-4C13A7C5-BED15EBC/0/0
X-purgate-type: clean
X-purgate-size: 2366
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F26A6F4958

SGVsbG8sDQoNCj4gPj4+Pj4gKyNlbHNlIC8qIENPTkZJR19DUFVfVE9QT0xPR1kgKi8NCj4gPj4+
Pj4gKw0KPiA+Pj4+PiArI2RlZmluZSBjcHVfdG9wb2xvZ3kgKChzdHJ1Y3QgY3B1X3RvcG9sb2d5
ICopTlVMTCkNCj4gPj4+Pg0KPiA+Pj4+IFdoeSBleGFjdGx5IGlzIHRoaXMgbmVlZGVkPyBJdCB2
ZXJ5IG11Y2ggbG9va3MgYXMgaWYgaXRzIHByZXNlbmNlIG1heSBoaWRlDQo+ID4+IGJ1Z3MuDQo+
ID4+Pg0KPiA+Pj4gSW4gdGhlIGN1cnJlbnQgY29kZSwgdGhlIGNvbmRpdGlvbiBpZiAoIGNwdV90
b3BvbG9neSApIGlzIHVzZWQgdG8gY292ZXIgYm90aA0KPiA+PiBjYXNlczoNCj4gPj4+IHdoZW4g
Q09ORklHX0NQVV9UT1BPTE9HWSBpcyBkaXNhYmxlZCwgYW5kIHdoZW4gbWVtb3J5IGFsbG9jYXRp
b24gZm9yDQo+ID4+PiB0b3BvbG9neSB0YWJsZSBmYWlscy4NCj4gPj4+DQo+ID4+PiBUaGUgbmV4
dCBwYXRjaCB1c2VzIGlmICggY3B1X3RvcG9sb2d5ICkuDQo+ID4+Pg0KPiA+Pj4gc3RhdGljIGlu
dCBzZXR1cF9jcHVfc2libGluZ19tYXAoaW50IGNwdSkNCj4gPj4+IHsNCj4gPj4+ICAgICBpZiAo
ICF6YWxsb2NfY3B1bWFza192YXIoJnBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSkgfHwN
Cj4gPj4+ICAgICAgICAgICF6YWxsb2NfY3B1bWFza192YXIoJnBlcl9jcHUoY3B1X2NvcmVfbWFz
aywgY3B1KSkgKQ0KPiA+Pj4gICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPj4+DQo+ID4+PiAg
ICAgaWYgKCBjcHVfdG9wb2xvZ3kgKQ0KPiA+Pg0KPiA+PiAgICAgaWYgKCBJU19FTkFCTEVEKENP
TkZJR19HRU5FUklDX0NQVV9UT1BPTE9HWSkgKQ0KPiA+DQo+ID4gVGhpcyBsaW5lIHNob3VsZCBi
ZSBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0dFTkVSSUNfQ1BVX1RPUE9MT0dZKSAmJiBjcHVfdG9w
b2xvZ3kgKQ0KPiA+IGJlY2F1c2UgJ2NwdV90b3BvbG9neScgY2FuIGJlIE5VTEwgZXZlbiBpZiBD
T05GSUdfR0VORVJJQ19DUFVfVE9QT0xPR1kgaXMgb24uDQo+ID4NCj4gPiB2b2lkIF9faW5pdCBp
bml0X2NwdV90b3BvbG9neSh2b2lkKQ0KPiA+IHsNCj4gPiAgICAgdW5zaWduZWQgaW50IGNwdTsN
Cj4gPg0KPiA+ICAgICBjcHVfdG9wb2xvZ3kgPSB4emFsbG9jX2FycmF5KHN0cnVjdCBjcHVfdG9w
b2xvZ3ksIG5yX2NwdV9pZHMpOw0KPiA+ICAgICBpZiAoICFjcHVfdG9wb2xvZ3kgKQ0KPiA+ICAg
ICB7DQo+ID4gICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAiRmFpbGVkIHRvIGFsbG9jYXRlIG1l
bW9yeSBmb3IgY3B1X3RvcG9sb2d5IHRhYmxlXG4iKTsNCj4gPiAgICAgICAgIHJldHVybjsNCj4g
PiAgICAgfQ0KPiANCj4gQWggeWVzLiBUaGUgb2RkICNkZWZpbmUgY2FuIG5ldmVydGhlbGVzcyBn
byBhd2F5LCB3aGljaCBpcyB0aGUgaW1wb3J0YW50IHBhcnQuDQoNCkhlcmUgaXMgbXkgY3VycmVu
dCBwbGFuOg0KSW4gdGhlIGBjcHUtdG9wb2xvZ3kuaGAgaGVhZGVyLCBJIHdpbGwgcHJvdmlkZSBh
biBpbml0aWFsaXphdGlvbiBmdW5jdGlvbiBmb3IgYGNwdV9zaWJsaW5nX21hc2tgDQphbmQgYGNw
dV9jb3JlX21hc2tgIHdoZW4gYENPTkZJR19HRU5FUklDX0NQVV9UT1BPTE9HWWAgaXMgb24sIGFs
b25nIHdpdGggYW5vdGhlcg0KZGVmaW5pdGlvbiB3aGVuIGl0IGlzIG9mZiwgYW5kIHRoZW4gY2Fs
bCB0aGVtIGZyb20gYHNldHVwX2NwdV9zaWJsaW5nX21hcCgpYC4NCg0KVGhhbmsgeW91LA0KSGly
b2thenUgVGFrYWhhc2hpLg0K

