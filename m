Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGHcIXX6gmm2fwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:51:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55A5E2D72
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 08:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220128.1528849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXex-0007Em-Mh; Wed, 04 Feb 2026 07:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220128.1528849; Wed, 04 Feb 2026 07:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXex-0007DA-Jr; Wed, 04 Feb 2026 07:50:47 +0000
Received: by outflank-mailman (input) for mailman id 1220128;
 Wed, 04 Feb 2026 07:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfmY=AI=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vnXew-0007Cx-2O
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 07:50:46 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 326e33ca-019e-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 08:50:39 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS7PR12MB9527.namprd12.prod.outlook.com (2603:10b6:8:251::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.12; Wed, 4 Feb 2026 07:50:35 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9564.007; Wed, 4 Feb 2026
 07:50:35 +0000
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
X-Inumbo-ID: 326e33ca-019e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xffjuuLZDBThTEhPjOirc9bOTQjsEH7/3jxBsdqRClhKpNaQyONbEFHTqxnhtYj6PIsiQyFfeMuwx6+o7D9dcppRv1jPZTibycmQd42zoHJwWs66e6QaZWu93j7OElUTVmoIK4j27hW0Qzn1Vlz1S0XNxH7P2paM96b77mb5EOKnZ65cq5x01obH2i1wfyS4sGYN0wJC4l5gv9WrVeNyYIZ+tVqlh4md8HXfl2lITTCvdO1FZtbAyw/9IQka3HDAfhWGR1hpIvNis+5W+oIPpcJ6lJLYaL4+NhFqfqRcGk1Rlq+3WJjG42Mj8NHfMo6CL+XylSpU7PLNXFrY7K8P9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/DaDuW9xn5BQkXZOqtpozaSlTtRhFTkrJ6t6ZCV/b0=;
 b=LbffrGlyoQUcxrL3knmV8cs/BeYwgKkrMJ2i1539rDk30ALt3G494yhKqoOA85e5Uxi+835aowBOGPHLylwYqlvAfJdO3oSXiXWflhCqy28rhfD8MRQrYrdhLxQisj/6cpUr0zMlYuVHcnSwKRaab82OL96jiNaCGm8aNQU0vqqPpVbk7a6eHCeC/K2mLWcBbrLT2GT/Jg3UWRqjpaR6J5LLXNZRVB0JZQk4Uc7thGHW8UCiXFyI3dxjXK0bJVoZwACBxfD3+VFl+RC57rEytabaBdyb4YE10najqI1HX/+5F3PZA/y3BPYhdVq6toXTjNfbVtcvpeCBwMh/ZWDKYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/DaDuW9xn5BQkXZOqtpozaSlTtRhFTkrJ6t6ZCV/b0=;
 b=VtWF/KouJYn0bgIux2mP542n5ddroELvPyp9tDMyzxlRc6JqvvKqXWlUqZ6Bzf/mom8eTW71M0O/IbgoACUfRVWPD5s9agBDWa3iayePAOmmRF3Cpvg5DcLfm6ZwTaI0NKwkUFteNLRW2wyLTpOJuKtI+kgOMDt2xSD1/FrxrJE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, "Garcia Vallejo, Alejandro"
	<Alejandro.GarciaVallejo@amd.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: RE: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related domctl
 op with CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related
 domctl op with CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcWtXdwWaFTRetvk29bNPbH/CVXLVylQnw
Date: Wed, 4 Feb 2026 07:50:35 +0000
Message-ID:
 <DM4PR12MB84517CB58BD82B676DD25AE9E198A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-15-Penny.Zheng@amd.com>
In-Reply-To: <20251121105801.1251262-15-Penny.Zheng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-02-04T07:50:25.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS7PR12MB9527:EE_
x-ms-office365-filtering-correlation-id: 8343c4b6-3a97-4f5f-3d48-08de63c214c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?M+1auZsn8ssxr8EhH0Agj02lSOmcF4m2lo9utggA/TUM2gwuQjzJQ2FI/r?=
 =?iso-8859-1?Q?2/V4pK/LUaHmYBZlBpOdOpA/mb/D+tWOBf0lwWbRr0/05tubtEz9ELAonB?=
 =?iso-8859-1?Q?aRbKRvuXV21vLH5DQYz74cfGKSUn3eAA8EMiQvxk92QCAYublfMSQmcUBk?=
 =?iso-8859-1?Q?JJadz2bbVOc9xY50WsoKcm7hxSeBdwtp72NhbHvNLTdJ58a/us7PLjrsLk?=
 =?iso-8859-1?Q?ynRfCAZFEMP5aqfYr4/T5w90L0kecWC6lSQnrQg4DlehsSckSdMjH++l/0?=
 =?iso-8859-1?Q?p/YKC8F97xGWLTme3wdJeVC/ehxUmrDbeQRF8M2lQSGbFOnaJsPNDfCOe3?=
 =?iso-8859-1?Q?gzNRP+ITG6/paNFEDc+/yWZt8XrH9ZjDg7uO3yHu6R/9/9tE5m9JZFqaEL?=
 =?iso-8859-1?Q?AouuKsEh9nbgBFpOC5BsgEnGl72f0nlJtYxGf1ULhIftKmlqWMgmqTzDus?=
 =?iso-8859-1?Q?OHlVGdT01hkbwTb/fXi4GvTW8y6tMlXOizG9reeck1L+R1AlcI3eDEglXS?=
 =?iso-8859-1?Q?vEsPIJXTPX3uqDXm1XN4cTYUW1QnjR4VU8AkHreSg5A/IPkChRfWjHCHv9?=
 =?iso-8859-1?Q?h8BXT6R5lTYM4tFZoxnJ5v5yUXqYTtbQmuvB90xiWGU0XrFfXDsoD7ICkt?=
 =?iso-8859-1?Q?IJbOk7if3YyGc2r96iaZUQTCq0PD/VQoxCsML2Au6dKpCbRO3zY6yfg+bv?=
 =?iso-8859-1?Q?Bn72E4SZJtgqekWkS8rD3KIqwxHWkU4PzjBqd5iqa5lRZXMFHxJZr4KPud?=
 =?iso-8859-1?Q?81SEGpVUiPMvPm9SWn39a3TcrIsPofs/BYj3QDPmSDfIdRp7lW/ww4/CuQ?=
 =?iso-8859-1?Q?QVYSRzURhWcPsrPzIMm4CUNEV8whMPwN568y8U21rhnzpFPGP/BVODP2+L?=
 =?iso-8859-1?Q?hr7RhjJF4YMLSTSrXCbXFA5GaBHW2dORtLBC9z/0u+P0OW+ShWYa9GV7o5?=
 =?iso-8859-1?Q?OC7aT0/4PwwnzauMNVHdmYZlnqJlAxoyrwc+8Yn5MPKGD+7wP/AlNMhUl/?=
 =?iso-8859-1?Q?/+gY84Fr/pifvkZCfkPjUNKjR8dV0Po5ycGwNHMvV4TnF7VGqv8gvKvRu1?=
 =?iso-8859-1?Q?6jIkZGmkeXBmDkGuKlhH7luiTiMYsvzR3EASV+4p+uaiOdD1erVjeqz/Bo?=
 =?iso-8859-1?Q?hMqtXHsYhJYEt7MU2giiOaNLc9z7qm+a0DaPCmDdiTWUeMJge7ZK3bLFwz?=
 =?iso-8859-1?Q?ZLxDmF7N3nyeyMvYRt2PrF9d1cdmcS4sfnhPbTiSvncZOzAE0LzIEIoAkw?=
 =?iso-8859-1?Q?J82S9Vs7URwLdtSachGqaJ2QTNFD3laknWBX35sULWGt+GFkNfCyTtNH9+?=
 =?iso-8859-1?Q?Thgx5Q8c5PkhDjVf3BRmRuUjim37OXC4vT0CcksES9CmZKnbuKedhnj9uP?=
 =?iso-8859-1?Q?zw21e/9iRtsRz9LWunWIJQbLeYuiarscYNbkGyigvuuTBu0v+tYDVD7dXt?=
 =?iso-8859-1?Q?tTcqSApJpGS1RwaowqkIM3jyXj6iwXocHYdPUSXnfxpcT9vhdhl4e4S+Km?=
 =?iso-8859-1?Q?95XXPfqVUXLftjEegilgorbU7srCHiq9OypYz41HHI3cn03xx/c6RxqgT3?=
 =?iso-8859-1?Q?sDMWxqeAqlp2524QmIRVxJux+N3eY50cvQPn8R9xRf+G4/su8byrbujuBF?=
 =?iso-8859-1?Q?6G6u443UAwrahQq4kI72CPOuuYB99Dp7/VhDpnVrmh5DYrFx6yhbj5/Q+y?=
 =?iso-8859-1?Q?ZhvChhGpxyKsuVpWmkk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZZcPGhuxhcg/1ZND0EuLQcjXOAYbvuGhOauVgi5ZFIM0ypHmsxaHZHrfad?=
 =?iso-8859-1?Q?Xudc1zTMNCbtiFELouVSl5IrZ4owErOSZNyQIknZr3rRMqk85KOI/Kn7vZ?=
 =?iso-8859-1?Q?IiEwIMOlFGgZ25f/z72ZiyO/GFi+O2nZK1z5i+2y0UeX52rye0uOgAZtwk?=
 =?iso-8859-1?Q?ekiXGF3Q3iMI71gko8/YJKhW3Q5Oo2Eei9DQ2H4FXeXnl9VyoD08ANsDCT?=
 =?iso-8859-1?Q?EgVkiDSJVm8XknxtEei4wlKD4QUKnEwILqkZ04mirbZfCCpVaBqwDfjPBT?=
 =?iso-8859-1?Q?FmWJRlY9MqNFfb8vst/42AGW36rqx8yAFc/SQXQW0H/zvCK2nGJYCLh6IW?=
 =?iso-8859-1?Q?N9QjxdSgxAyHxz+7lDz4xivgLNk2WMdofLMdRK9v75KbL0iBURDBtPiFTt?=
 =?iso-8859-1?Q?6kLUpCiLx2HIjK8e0O91BmC6ksYFkUYtCHzVGnhSvY7pQOf4KakrITkABR?=
 =?iso-8859-1?Q?IsTT8CemZOlNxfZ6mt4SIcrbxMEh7ltSNshaTQ0OOHZJ3XODlWQx6aP4MY?=
 =?iso-8859-1?Q?JPRvEQyc9gWpQeCNWx2blVg8VX61H5mHEQX6n15iZhYBqDmxQDYlgbnwI1?=
 =?iso-8859-1?Q?nKzLlf4b2WKjUhS7BxfOTRqLnKBqUl4OwZ7ePt6SEzBqBJRpaerZRE6aJm?=
 =?iso-8859-1?Q?Q1cU+5SBfOXlZOzlRWv9sNTR/dH7FWGdvfcfoexOySV4NGHUDLbsLSlVxu?=
 =?iso-8859-1?Q?bH3RnFAd3HsMncoNKNTK55ByIrD/FxBMv7zNpA1Jc+jXGGU1a3sqzH+inb?=
 =?iso-8859-1?Q?HdyFdw3wr2WaL1dk6f0kIyuBgUuMvUSjcHoAYnEXSrsXiIJ6hnumYNJ1UT?=
 =?iso-8859-1?Q?WWfH1L+ycdbAfYiZEqWJUVLwVi5w12SZdHUUBDUzdAg2x1MHJokhB3ot/e?=
 =?iso-8859-1?Q?iygUZ+TMiCQIMhuulrZgqrQ+SGXRmdxdm0A8Nj5fZ4ifeGEO9LbJOXDwE3?=
 =?iso-8859-1?Q?in0S2u+D2idlWCPagagPRxwLVt9sx20D8fxs3xd0mB7eZKMrJjIZeJ94af?=
 =?iso-8859-1?Q?Rb71pM6V200XrzBlGjLxaXQ8rSXOQcWGL3cONZYnosub03nwr4kaUgzJIb?=
 =?iso-8859-1?Q?r7L7YKxtwXwRHiCKdwth0fG0T4EP0fJ9Kgp4Ylbzea1aJeZVOFE8cE2dYc?=
 =?iso-8859-1?Q?QEAqjBrsGsRQJnLsORxUh+7TT7q1Byirq/EtsQJc0s3aZjJKN+8QmewEmN?=
 =?iso-8859-1?Q?otpfp4OviV4jxcHPtoW4+KJijLgIS4RPMCJsZbiBhjZ/Z5oxZ7VC6pSOYl?=
 =?iso-8859-1?Q?yn2HT01jTdo21M0qLR1/wN42yHcWb2V/9o3NmB/qLsD9iDu7LcNgcDmG1H?=
 =?iso-8859-1?Q?u9aXkT5n3y95GSS4rKreGu2rM42ymnRvBzRQ5MzGwxJUS4MY0ds4a6cNj6?=
 =?iso-8859-1?Q?X9wqeC578OtUvEv52jOvHJkv7PQDLinnDpu0IgRN/Hqc36ZlzFgEYB1NJ1?=
 =?iso-8859-1?Q?/I/GlQAtLp9zrR6eCA0p0KYSrjCtd7bXiFpYc+9Rt8h+eCroGmGHGVX2pi?=
 =?iso-8859-1?Q?oxNLBvvG/n+ERtT7dXlmLEkQXOwU9do6RZYQaZlRnvoAhGXDwD6ifspIJa?=
 =?iso-8859-1?Q?rLtA9TCFx/uFQYSCSngUpuiaRNm+fnh8wwAMkJs5WYAtO21vDd4gvaVTd7?=
 =?iso-8859-1?Q?YNdmY0h2oQptbU8ySMKyLei76X0YIkAwPpzM8V8YkBosk/Vx2nEdcN75MB?=
 =?iso-8859-1?Q?pCu/yHxtdTIpDedjEG9V30eWBlvv8hHnYsglJoHMCHnHhIzdW9+ikUJOje?=
 =?iso-8859-1?Q?5jLyiBJn+cRGeQj6SBUvQqkOgQaDRry1QvXUbRGOYLQoY0?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8343c4b6-3a97-4f5f-3d48-08de63c214c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 07:50:35.6218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WD8aoszFwMwmxZgIEmnJ4+fGuDe1vOkzf3proTNQAK0h/CtydLrMEaXrxG1j93w0Ga6LxfffQbnGVwGXpmQ6dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9527
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,DM4PR12MB8451.namprd12.prod.outlook.com:mid,apertussolutions.com:email,xenproject.org:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:Alejandro.GarciaVallejo@amd.com,m:stefano.stabellini@amd.com,m:Ray.Huang@amd.com,m:grygorii_strashko@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:Jason.Andryuk@amd.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C55A5E2D72
X-Rspamd-Action: no action

[Public]

> -----Original Message-----
> From: Penny, Zheng <penny.zheng@amd.com>
> Sent: Friday, November 21, 2025 6:58 PM
> To: xen-devel@lists.xenproject.org
> Cc: Huang, Ray <Ray.Huang@amd.com>; grygorii_strashko@epam.com; Penny,
> Zheng <penny.zheng@amd.com>; Jan Beulich <jbeulich@suse.com>; Andrew
> Cooper <andrew.cooper3@citrix.com>; Roger Pau Monn=E9 <roger.pau@citrix.c=
om>;
> Andryuk, Jason <Jason.Andryuk@amd.com>; Daniel P. Smith
> <dpsmith@apertussolutions.com>
> Subject: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related domct=
l op
> with CONFIG_MGMT_HYPERCALLS
>
> Function iommu_do_pci_domctl() is the main entry for pci-subset iommu-rel=
ated
> domctl-op, and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
> Tracking its calling chain, the following functions shall all be wrapped =
with
> CONFIG_MGMT_HYPERCALLS:
> - iommu_do_pci_domctl
>   - iommu_get_device_group
>     - xsm_get_device_group
>     - iommu_ops.get_device_group_id
>       - amd_iommu_group_id/intel_iommu_group_id
>   - device_assigned
>   - xsm_assign_device
>   - assign_device
>     - iommu_ops.assign_device
>       - intel_iommu_assign_device/amd_iommu_assign_device
>   - xsm_deassign_device
>   - deassign_device
>     - iommu_ops.reassign_device
>       - reassign_device_ownership/reassign_device
> Otherwise all the functions will become unreachable when
> MGMT_HYPERCALLS=3Dn, and hence violating Misra rule 2.1
>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
> - wrap XEN_DOMCTL_assign_device{test_assign_device,deassign_device,
>  get_device_group}-case transiently
> ---
> v2 -> v3:
> - make PCI_PASSTHROUGH(, then HAS_VPCI_GUEST_SUPPORT) depend on
> MGMT_HYPERCALLS
> - add wrapping for
> iommu_remove_dt_device/iommu_dt_device_is_assigned_locked/
> arm_smmu_detach_dev/arm_smmu_domain_remove_master
> - fold commit
> "xen/xsm: wrap xsm-iommu-related functions with
> CONFIG_MGMT_HYPERCALLS" in
> - fix overly long #ifdef
> - add missing wrapping in xsm/dummy.h
> - address "violating Misra rule 2.1" in commit message
> - remove transient wrapping of
> XEN_DOMCTL_assign_device{test_assign_device,deassign_device,get_device_gr
> oup}-case
> ---
> v3 -> v4:
> - move codes to wrap with a single #ifdef
> - split into PCI related subset and DT subset
> ---
>  xen/drivers/passthrough/amd/pci_amd_iommu.c | 20 ++++----
>  xen/drivers/passthrough/pci.c               | 52 +++++++++++----------
>  xen/drivers/passthrough/vtd/iommu.c         |  6 ++-
>  xen/include/xsm/dummy.h                     |  6 ++-
>  xen/include/xsm/xsm.h                       | 12 +++--
>  xen/xsm/dummy.c                             |  6 ++-
>  xen/xsm/flask/hooks.c                       | 12 +++--
>  7 files changed, 68 insertions(+), 46 deletions(-)
>
> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> index 3a14770855..576b36af92 100644
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -461,6 +461,7 @@ static void amd_iommu_disable_domain_device(const
> struct domain *domain,
>          spin_unlock_irqrestore(&iommu->lock, flags);  }
>
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  static int cf_check reassign_device(
>      struct domain *source, struct domain *target, u8 devfn,
>      struct pci_dev *pdev)
> @@ -551,6 +552,14 @@ static int cf_check amd_iommu_assign_device(
>      return rc;
>  }
>
> +static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn) {
> +    unsigned int bdf =3D PCI_BDF(bus, devfn);
> +
> +    return (bdf < ivrs_bdf_entries) ? get_dma_requestor_id(seg, bdf) :
> +bdf; } #endif /* CONFIG_MGMT_HYPERCALLS */
> +
>  static void cf_check amd_iommu_clear_root_pgtable(struct domain *d)  {
>      struct domain_iommu *hd =3D dom_iommu(d); @@ -698,13 +707,6 @@ stati=
c int
> cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
>      return 0;
>  }
>
> -static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn) -{
> -    unsigned int bdf =3D PCI_BDF(bus, devfn);
> -
> -    return (bdf < ivrs_bdf_entries) ? get_dma_requestor_id(seg, bdf) : b=
df;
> -}
> -
>  #include <asm/io_apic.h>
>
>  static void amd_dump_page_table_level(struct page_info *pg, int level, @=
@ -
> 772,14 +774,16 @@ static const struct iommu_ops __initconst_cf_clobber
> _iommu_ops =3D {
>      .quarantine_init =3D amd_iommu_quarantine_init,
>      .add_device =3D amd_iommu_add_device,
>      .remove_device =3D amd_iommu_remove_device,
> -    .assign_device  =3D amd_iommu_assign_device,
>      .teardown =3D amd_iommu_domain_destroy,
>      .clear_root_pgtable =3D amd_iommu_clear_root_pgtable,
>      .map_page =3D amd_iommu_map_page,
>      .unmap_page =3D amd_iommu_unmap_page,
>      .iotlb_flush =3D amd_iommu_flush_iotlb_pages,
> +#ifdef CONFIG_MGMT_HYPERCALLS
> +    .assign_device  =3D amd_iommu_assign_device,
>      .reassign_device =3D reassign_device,
>      .get_device_group_id =3D amd_iommu_group_id,
> +#endif

FWIS, Alejandro has come up a more clever way to DCE these kinds of op, sta=
ying conditionally as callback. Here, I just took this commit as example to=
 show the methodology:
```
         .assign_device  =3D IS_ENABLED(CONFIG_MGMT_HYPERCALLS)
                                        ? amd_iommu_assign_device
                                        : NULL,
```
The compiler has enough visibility to know that static(amd_iommu_assign_dev=
ice()) is used, and is droppable when MGMT_HYPERCALLS=3Dn. So there is no n=
eed to do ifdef-wrapping around these statics now. Later when jason's "--gc=
-section" patch serie in,  --gc-section will help linker identify them unus=
ed when MGMT_HYPERCALLS=3Dn, then remove them automatically.

If we all agreed to use above methodology to do DCE.
Alejandro also recommended that since we will do this assignments in enough=
 places in this patch serie, we probably want something like MAYBE_OP() som=
ewhere in xen/macros.h:

#define MAYBE_OP(c, fn) (IS_ENABLED(c) ? fn : NULL)

I'd like to listen from your opinions on whether I shall do such update for=
 v5, since it is quite a big update

> diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c index 9774bb3bdb..0026a096=
3b
> 100644
> --- a/xen/xsm/dummy.c
> +++ b/xen/xsm/dummy.c
> @@ -80,11 +80,13 @@ static const struct xsm_ops __initconst_cf_clobber
> dummy_ops =3D {
>      .pci_config_permission         =3D xsm_pci_config_permission,
>      .get_vnumainfo                 =3D xsm_get_vnumainfo,
>
> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
> +#if defined(CONFIG_HAS_PASSTHROUGH) &&
> defined(CONFIG_MGMT_HYPERCALLS)
> +#ifdef CONFIG_HAS_PCI
>      .get_device_group              =3D xsm_get_device_group,
>      .assign_device                 =3D xsm_assign_device,
>      .deassign_device               =3D xsm_deassign_device,
> -#endif

The same thing we shall do for XSM-changes too:
        .get_device_group              =3D IS_ENABLED(CONFIG_MGMT_HYPERCALL=
S)
                                                ? xsm_get_device_group
                                                : NULL,

Many thanks
Penny Zheng

