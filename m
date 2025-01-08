Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23076A05700
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 10:37:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867045.1278447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVSV3-0005lt-NJ; Wed, 08 Jan 2025 09:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867045.1278447; Wed, 08 Jan 2025 09:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVSV3-0005k4-JU; Wed, 08 Jan 2025 09:37:17 +0000
Received: by outflank-mailman (input) for mailman id 867045;
 Wed, 08 Jan 2025 09:37:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HByp=UA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tVSV1-0005jy-Kd
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 09:37:15 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20608.outbound.protection.outlook.com
 [2a01:111:f403:260c::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2490eabb-cda4-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 10:37:14 +0100 (CET)
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AM8PR08MB5860.eurprd08.prod.outlook.com (2603:10a6:20b:1de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 09:37:11 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 09:37:11 +0000
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
X-Inumbo-ID: 2490eabb-cda4-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KG/Etf0/KQZutg/lLkrzGj3a/17pwvu+JDdKr8XhlBREwyHsEyZOiu1jC2DLl98nsvEDPyrn0TdTzXbyafFUgFMnxUQRAPzm9gA/A7684lqTJPZHLvdzLkOnbbxesPRLpiKWXukt9Om7UHJbLNn/Il08HRsmUrJJGcWsSdNn95Hw1PqPHJUd5AMJvXmJu0qABnoKFdHx0LzTNSSR6bk+DynXggsR8SaeBB5MiHGLZ9+eIxEGgRMyBIveaPFnwDz3jG6RRgm1RFUTawmB5a728BbLF11daVR5dyciwIRWbtQ7nG64+OOf2uztusY8sUDwJLk1UskBjfB5zeaqDDPLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXv81ywe/bdshr4y01C9FshKxkgV76u/Rmo0oTUFoNk=;
 b=hdfrL5bS9t39ROn1mgBtLPplI82uODvSfugXSnnTxFHPQJb+PKFzIqC5dbMq8OqWzjoC6xH/+UwafK6MNQQe/s6j/xgEjUwZqc4Kj7sHXmw3AyJYhXBGFXEIZ8n70UC8uVaW4A2X5BU10wZi1VG6ILRqC9L8qn6TH12k4k1VltIF7FJAdt/hZGPMo6oNiSoJ3nfH2S5GjuRdyhZHQ+CXj12FLJvlWGD7T7g8puF0pYmtDQrPSSxnLkTQt6FNWDg3HTtYr+74T+LnxnDHas1zTMHsX6azdkLYI2XIaUylWOEIWvK+wNQf9nH/wNrxcAKZXUL0OChYLHktfc4+clf2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXv81ywe/bdshr4y01C9FshKxkgV76u/Rmo0oTUFoNk=;
 b=Rx/u2Wkikq3UrR5b7PK0wTJkzldodHGZXij3X/5H7lF9JrSzo0GvyX9bBYVro0affKTYwD3gFRPVKAqtx58UuoKpKNaI4gYRXErTVJyaozfQ4azem6te6SsKpXMdNvzy1jkZHTP4nA+WhNt4Hkd9/PZr8nMDhwd4OoYbt+FHxZw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>
Subject: Re: [for-4.20][PATCH] xen/arm64: Drop relocate_and_switch_ttbr() stub
Thread-Topic: [for-4.20][PATCH] xen/arm64: Drop relocate_and_switch_ttbr()
 stub
Thread-Index: AQHbYaL71xynnWB460ejnOn44lZOwbMMnQ8A
Date: Wed, 8 Jan 2025 09:37:11 +0000
Message-ID: <2A19935A-D2A2-4780-A2E2-668EB25E2D15@arm.com>
References: <20250108075719.84967-1-michal.orzel@amd.com>
In-Reply-To: <20250108075719.84967-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR08MB6588:EE_|AM8PR08MB5860:EE_
x-ms-office365-filtering-correlation-id: 2a5f99c6-4431-4e46-bbf2-08dd2fc80717
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1jk53Fva1UL+FbGhn9pxIPFOJPuQ6hGvrz+q1eUfZlDhXBzsDRIoXXYEgqq6?=
 =?us-ascii?Q?hHA/3zqacmgRfXz7XuLcXOiY9WQFqK3Wybr1RgCkX/RCC4Aboh/4KbnWeohN?=
 =?us-ascii?Q?/PXIsTSV+lnbjBf5xxBIcbj7RKZW1nuBg+pulPU5APyJLno9bk3F1b7Do++7?=
 =?us-ascii?Q?Grd9Kltp7kLBcjXGk0A9D8QMgn5rWwk/L5ds+TU//+we4XKUs4hrlG34VfeT?=
 =?us-ascii?Q?4mvw7eWALF04bj/26xhe40oJK+d42dNeHJsYm+FRqJyxLWB8bKgSka1rRBJY?=
 =?us-ascii?Q?adDqcnaiq5hRILZP5c8OJLFwH8Y5r+bW8jh+awlWRhLA01d/Pb8QNQaXP3VK?=
 =?us-ascii?Q?mNZDO5LaImlm4BSJcxR4XiYlsbz8z4Xv7UCgBOCXJFtXGdNr0l11lXw19lTM?=
 =?us-ascii?Q?u7mWIPgfSJZ5udQfEDwH6Cd5nUdvn4tb2FDytbakRfzgfhGsh9maZyd/R9Dc?=
 =?us-ascii?Q?vwbPX7g8i7LWcp8donjWxjsrYw7YRz9gy+fng4tNhJo3YuyQ296i78/l6ULz?=
 =?us-ascii?Q?+bB703yNLpQCf04EvrRIGny4doDigCDNkoiQyqoh3WuAYMHuNAAkBPLsIFN9?=
 =?us-ascii?Q?ZZ94hpjtq8XcCcj92m0TZUUcUORoiRAQl0fJVT4pLnumKhuZsavFGZflTOmL?=
 =?us-ascii?Q?3mMTjaK6fVUfxoQwun2neYkfPm/FzOzTR+nkAnaHavt4JAcpr6D+XgRoMvoh?=
 =?us-ascii?Q?B+uNBF743av1fPNT6GzCBM8c14WSoXkbPGcBCEQddbPBwRaFF1+0S0AJVWAd?=
 =?us-ascii?Q?Mthwf9x8QawKdIQZuPkjVxcJ3zcLZRLjwBbdHIV9ph4bZkUHOX/pBcV6P0pi?=
 =?us-ascii?Q?ysSwHwKaILMvTAQNFsLfYaQd5gebMiJ3QqSYbrLvmC91zTq8+HM7JyQN1HAT?=
 =?us-ascii?Q?GgzrASyOmNdF3FASbPVnmn/xz/OM+K143tNOvEoWaBnXy2rYoHrkV6N6tWgI?=
 =?us-ascii?Q?ZJ5c8vbuAuGqzZbJo4loyccvFIt+RVpvfBtTiTIBUs2XQK6yUxXr+0rM7i0M?=
 =?us-ascii?Q?pBagtInG6dGuXDx1a9mKTKwuD8FQmCxa/PekkGM1UDSngMOy9+BNtkb/5FBJ?=
 =?us-ascii?Q?fiPF+bu/V7MYbney1XgK501VmNDi7E/ITgkLZVpgjB0JjYVAtHKcMblKwF8v?=
 =?us-ascii?Q?fdfJy26xjrNXhZJlzku11Rwc2gJLLS3QHZWd77ZXvJP3C+TLFOMkkH6rb4If?=
 =?us-ascii?Q?2IrHxgbhyQbye6/Okz2vVpwmU7/VjqwRqvpp4Hzpf3oYKcq58f0Z3vIHTECR?=
 =?us-ascii?Q?o6dtb2M9ldTKwBuYt+nIFBWH9uGAIwEax1Jxa85Pxgbfd7m/aPPjg4P2t6GI?=
 =?us-ascii?Q?Kyro2Qg4Yv8oOE3+kof/RAGHAoQr35dSp6XDrrhoS7rpaS2ulazEs+6o64Gk?=
 =?us-ascii?Q?JP4t7mlQYdTPxfNZVQ3jiRegzeDkeAKAb+xpAM5qruOmQm0QrUc0cjo4UzMn?=
 =?us-ascii?Q?TCNpYj1fFgyI3Z1HiovMaMwCDcBZsjKX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JPvngvbsH1IwGB9wNjyT67GQUu3tGlqgp61HaHvr3LaCzqMO8/1FHItWPfUX?=
 =?us-ascii?Q?bJ57vkFmL+uAvfsnivAd3mv+BugXyigfGg8zuAua9tFnLgB3ENKuBHLiga+r?=
 =?us-ascii?Q?6l6yk3B3/wrrukmxRQndhjW5w1j78IUdDHg5x646Pm/5TdjOyts0jh2FJEvp?=
 =?us-ascii?Q?Ly2JNiq4bPzsRzVCIaOPVcBhuTOHhlh958WBTeC5uJPYVD9OL25AKzAUiXJC?=
 =?us-ascii?Q?NgFdweZK4Io1qiJj+/38d2BQg+GSBbPAlF6mHnd7YppxLM/WNW8DmiOhwtP/?=
 =?us-ascii?Q?TjCQWGMXJMvV6hBhRcOLJtUHaKI888G7j9hCRZHLA3RwMB2iAiXlvKByo1OQ?=
 =?us-ascii?Q?e67bhHLVpg33ZG5JLdnVsd5uT6q4+SPAOv1e0t0wgNerG3A7QhQ3+Auax7zP?=
 =?us-ascii?Q?h6kQsUxc0+F/3MdQOpVEIH7EoyL7vsNIyJBIjOVclE6wNPRmwGbsdcApS3iy?=
 =?us-ascii?Q?CvmuXGuzlL3zIaUxyGJ9YSfmzXqHBZwIjwREX4cixXzy3uuFE+9H4rlCZ4pR?=
 =?us-ascii?Q?sj2DX5wzsTw7c/0z3NpRxIkhPBUIypnIkx7G+FcCRI6MUyAvUjhI6J/qUf3O?=
 =?us-ascii?Q?V3IRkeVp3NsFFUBbZLWJ1eSR+QWasTPlN09dlrF+f9hhMZOWt7RvnX1eyU0d?=
 =?us-ascii?Q?bC9UCR0fob7YlVFTZiLKzlkxmq0lqkLtDNDNBpRvvBLKVVBojWrhd9X4+CTl?=
 =?us-ascii?Q?j2qzXpso3bYi/u8/ZXCaxI6Z2zeo8usgeHm22b6iNFo+7kB9pwsPEsGG33+f?=
 =?us-ascii?Q?bEBNjN7aREe/X7AEVoIcXCO8Gdu/J6q3xGaD8rTmmkuvZFc8vQDtYNuDdNmJ?=
 =?us-ascii?Q?eNXiYvXc6AEhT9uOuC8mA5eGkGt1HXa4dF5+5oJLAZk6WLWCTOzLfpreuhQW?=
 =?us-ascii?Q?V82kfgv9Z6XYq5B9SdR4OC1y4CvL6LhYKTzL81A/IZ37mnWnp8KZluvtH5fl?=
 =?us-ascii?Q?Vrh3wMwbYqpoQVpDhBpobfgggbv+wnB6sQ9snxkzuHzbc8lhIhfetopjwBzE?=
 =?us-ascii?Q?CzRFWy5ELw5zHvSjWqEXKqc+s4NscbqL2NTFzbd+CyBgEGH7vk4Lpbf/Prnp?=
 =?us-ascii?Q?MLEs9tJTwXJ71YqtvNYXGSc80zd3Eqc0Yut/ZUyjCbFofBdjbmCLhuQ6KZbA?=
 =?us-ascii?Q?iqD4qGCmCBmFP8TGuoU7RAwYDNAc7lofYgmwMxlTq6qq27NqQHY39HU4D91+?=
 =?us-ascii?Q?mqh01Ql/wP8uBo6tLIX9GmhRwi34/A98454mOWsQ1raGEt7VNR+QBPfVb3ug?=
 =?us-ascii?Q?dxZ0/74fkb0+Lq3fNLz0/IzOp1EheIAMrwRPU+ONC8lrPFQe67zlXqLP2NIx?=
 =?us-ascii?Q?bSsxuivIscMYGlg6WdEiJ2ukVY1zGvfd2t+217in8bs5WfG7TF8dNFsbOy1y?=
 =?us-ascii?Q?kKwJPMvrMhimanc6JfblQzOTCEYeQIltUlYH5838mykqWCYypeRKWD8JS57G?=
 =?us-ascii?Q?Y7XDvq9L1yvQUM8/0j9Hc3QizvLMWofTCktm6kREVMjMDi23PPfqM3MxxClh?=
 =?us-ascii?Q?62JCE4Jh4kJR+884OK3LQmKp12Z68z926ucrRH9N9xMa3IB/yDv2T5GKV/HD?=
 =?us-ascii?Q?6qHxvO4Yc/t6opOOmcOyVD+war3mW59uXK9WsYUnmfWEsramArbCCH+EZUTb?=
 =?us-ascii?Q?uA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <89BDB8EB78C93C4F8498F6E28FA18E0D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5f99c6-4431-4e46-bbf2-08dd2fc80717
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 09:37:11.5329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPuUd7wQ3espbe/tVWsyVL4eAtPxJMfRX8qg4usRkyy9kY7wl3bPZ2XZ6MLnVVs3zslSXDnfkPGHepCWr9auRsUHgOPcQRKZzY2ydHboUqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5860

Hi Michal

> On 8 Jan 2025, at 08:57, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> In the original patch e7a80636f16e ("xen/arm: add cache coloring support
> for Xen image"), the stub was added under wrong assumption that DCE
> won't remove the function call if it's not static. This assumption is
> incorrect as we already rely on DCE for cases like this one. Therefore
> drop the stub, that otherwise would be a place potentially prone to
> errors in the future.
>=20
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> As suggested by Julien, we should have it for 4.20. Leaving a stub like t=
hat
> without something like BUG_ON inside can potentially lead to problems in
> the future provided the function misuse slipped through the review proces=
s.
> ---
> xen/arch/arm/arm64/mmu/mm.c | 2 --
> 1 file changed, 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 26361c4fe4c0..c1efa1348aee 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -171,8 +171,6 @@ void __init relocate_and_switch_ttbr(uint64_t ttbr)
>      */
>     update_identity_mapping(false);
> }
> -#else
> -void __init relocate_and_switch_ttbr(uint64_t ttbr) {}
> #endif
>=20
> void __init switch_ttbr(uint64_t ttbr)
> --=20
> 2.25.1
>=20


