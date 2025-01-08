Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F73A061EA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 17:35:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867673.1279243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVZ1J-00055X-E5; Wed, 08 Jan 2025 16:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867673.1279243; Wed, 08 Jan 2025 16:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVZ1J-00052p-Ax; Wed, 08 Jan 2025 16:35:01 +0000
Received: by outflank-mailman (input) for mailman id 867673;
 Wed, 08 Jan 2025 16:34:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HByp=UA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tVZ1H-00052j-He
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 16:34:59 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20615.outbound.protection.outlook.com
 [2a01:111:f403:260c::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fc2d7e8-cdde-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 17:34:58 +0100 (CET)
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PR3PR08MB5595.eurprd08.prod.outlook.com (2603:10a6:102:83::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Wed, 8 Jan
 2025 16:34:56 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 16:34:55 +0000
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
X-Inumbo-ID: 7fc2d7e8-cdde-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkjjBpBC1G7HsqJqT5kndxojGhEz7YlRCHr2RUtpazN+r22VknYYpZXoWxwbn+We4f4zmkeuCyJ7BTdeQldM3dS+43kw/VlDkwORgg8QprChIF42iTAepL9805d6Y9gQ62dJrmtq+cyL98puxZMo7Cu0aakicFrjGbAg+WnMr8OVRiTAEb7a8CA+X8qmBe26POkMmwvely9MpwqxUqGRnXShU9GegdPzZO5XUTstQiOnCFP98+HZ0a1lh3kvxhw99UJUYKhE6FL9g0AZ0CG+vlXKHBv8ZX4L3nDgHQcpQBV3xV5ERNInc+gqjfCssbHSad25B8rxFnP7w3gqUbiEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPQ2RQYmDu4k3droeRPIAf4d8pcxOB0ub7sA/cfNF0c=;
 b=CeMxEnaSJGpBvHXZ2KOiOGRpwxcvXOsA5aEwBocf4+2Lop3rpUhKs2gwL5tMzq8oPLxWdSeKf6lKuaybLuPB3DC8Glsp2PSkXlcUOEeWR4/jYqxcOyZsktHHfkdW6z+am46KMj8jysqj1lmZx+y/NZQJx2/Yu/qgNLZDm7vh2QzBfErJr1P16r9adbd2mZrADIWY+9hwmaoZ5gQXw2w9ZcJwd+UvJ3bI9AVnXt3TY34e/TO6mZCJLFl8EEYEWDBmn37yXdAyWwVgPZExM9FOyBCsXH4y/jLmU1Z4ckeQcxkj3i2cdHQeM7RSshNvx2r+IOGp4QzK1eF57H0yDfigHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPQ2RQYmDu4k3droeRPIAf4d8pcxOB0ub7sA/cfNF0c=;
 b=kW2hHGr4fxouxHT2rKspXIiDVsJEYwTxzRyUvSF+LxhNu4MD1bTQtG+YPA9AiFxLF48GKqIx2hRnk9MylNyxgWlNh/FC3ryqxkJkw+39Jb9nKVK5r1XWm6sGxJco490f9qhg9MxNevXwi0cYyw/jvNqiTCMK7HIxbR9LNT4Sx6g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xen/arm: ffa: fix build with clang
Thread-Topic: [PATCH] xen/arm: ffa: fix build with clang
Thread-Index: AQHbYeFGu37kkF0Uuk6Sa5TIC8NMALMNBOYAgAANyoA=
Date: Wed, 8 Jan 2025 16:34:55 +0000
Message-ID: <8F541FF5-C4E7-4BFA-A0F5-86D2E9FCC736@arm.com>
References: <20250108152317.335441-1-stewart.hildebrand@amd.com>
 <D6WT3QSKXNG4.162UPSGMQ1ZIS@cloud.com>
In-Reply-To: <D6WT3QSKXNG4.162UPSGMQ1ZIS@cloud.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR08MB6588:EE_|PR3PR08MB5595:EE_
x-ms-office365-filtering-correlation-id: 887d6d98-b094-499d-8cb6-08dd30026298
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NMOwV/8Z4ZkYe1qXZi4OeZaUytaa7h0z5DyuU7KcQlvav8IyCQA+2tVLRW9n?=
 =?us-ascii?Q?wnxKgPtjamlsq5tHtaZU1EyfEJTK/lo5eZKGWYcpaYlXejy1cBPlVAw4pCl7?=
 =?us-ascii?Q?Kp5CUAjCeE2Z+g9pG1Mqi4cVr6ogfBFpIYGkku5Ig9V5HcDhE1y0t4OjGHtY?=
 =?us-ascii?Q?vCpBESEOJFCJfd2h1YxxlnkrdlUk/ll8Pby9bPoCAlpIdqFHZyt5GbV8hzte?=
 =?us-ascii?Q?wSgxDWUb2z1LCZHjlwgCDxnlOcWMQomh8JRR7e0BC0J931VEpyMSFeF4DFct?=
 =?us-ascii?Q?wMSbtgOxxATVt2aJP7pfuZghVHwKlumPze1Kr3QGdbVaIZmO35pyc5KPDriC?=
 =?us-ascii?Q?Uxfm+GV1PnXhqfqR63cemF3h4m3dzR6wemD4/eytyxmp4pHergeVnTlUEr6K?=
 =?us-ascii?Q?hi7St9H7A/aZV2951jTwM9oCevu5/DG9q008nBZ0jaE8wapSCeCYb4rWXpsR?=
 =?us-ascii?Q?H/eeorXQCvdMea5b1A4KhtAuX8/gMeBEa5TlHooLqC74960p9qhJe5pjAtWj?=
 =?us-ascii?Q?bNE41Q75/+4yITM1t+JiHLytE4L6x4TVZirTvsgnALBFsKiLP1lvxQzalkkk?=
 =?us-ascii?Q?/SJjRRdYUtOiKv3S3rcbjvmpO/T0VfCt41kC+kz8qT7Xbzb3Gf2p/9clG2Mw?=
 =?us-ascii?Q?q7HYqRklA/YV9DERGAcjGZd/LtXfHlT/LsrIfBs14ljelFu+gmvGs3VVI7LN?=
 =?us-ascii?Q?WmJaPYDPofkXBl30oKHe1BEIzWcjtRd0cZsK51j9TC2E8qNTy82dYgP1t1B9?=
 =?us-ascii?Q?paIVGRyUDPZILkz1rjf6jSalzpEU2uNnlM/I7kM3Klbxq6pk+C1ORWAJSBKM?=
 =?us-ascii?Q?lgpOf1lo1/GUjDk9Tod4ESg06a/gL5ZHxprMC4+YghKYIUDlrHXcPFyHsWBd?=
 =?us-ascii?Q?+N+GxG2BUbglgBCCg1E6vekpEhwD4aq5i8iZJOHtzKKcdHSPqp3w5oa6hwVh?=
 =?us-ascii?Q?YIPNaN0SEakawDRQjBVws3J4KPH0E1Z7g40IqttjU9Qk6IhaoN3Sb5ALdMWf?=
 =?us-ascii?Q?MI9oNuGVavdLFGGfptt+Ko1A45xYii8BM/tSIx/0hlJ/ppUL2P4xpDCkRpPo?=
 =?us-ascii?Q?3XzLcfTtL35z6EydSRnpTueV1bTPFfe+LzD2M6kMINYIAyImS36UJkYWB3pl?=
 =?us-ascii?Q?ZZr988rkZ2OPbbeJZYJownajdeINWbkDZrY8+D+PQszJVXqbtExmH3qWmvbI?=
 =?us-ascii?Q?DtUsxDCyYNf4SRRjASQ0zePdK21viBfwNy9xDSlb/SLul0D34ifVVmre+s5g?=
 =?us-ascii?Q?dqbX5xiCunHf4xgEpq6OdmZCIl7SmjF/rLkMLGfwjsb5a5mpOG93+kClsENF?=
 =?us-ascii?Q?WadPrzbpMUBrmYGnrC88QJj7B0/7BsNFHqBpgdoT4MapioIqwOsXQNbAJoSt?=
 =?us-ascii?Q?xwVg097ZmnZsAkin5WxQMOlRLkP1h6Rhb67aAw+FDGfo7mGxxJxIPAeMYxih?=
 =?us-ascii?Q?3kScCmMN3Z+Rbnws79jhsAmMJATqTGk1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5m/IgXYRUkLluDLWQX62+PFfdpaZtQkenRlrGBGAygR335YBh6A5Ey5rDoXQ?=
 =?us-ascii?Q?Q905iaGAVNaJxEOKykVGg9I+uosLsCRo4J5tf5/OCIPBno5Gc/YBJwv4DyII?=
 =?us-ascii?Q?2mZLo5LkpKGAOSSSJeB4POvhisTAeKnLP0Gd96VavwE80VG6UpwcI0KHwugH?=
 =?us-ascii?Q?U0g0ILX3JN/ePu/58Rc3OxiTFQnQRZNIAmlTsEJ3W67O3PtEHUl6WlzKlHEN?=
 =?us-ascii?Q?ff9cPQGykHK2HXYOi2bGr1fuuss+147ibHCAov5+6RvYfOKG6S7ZCMmVngM3?=
 =?us-ascii?Q?LrWhbmEteyXj5oJiVxUBv6w7APUhDIo8kZelwy/cEbzaShD1McLeUo6nt2YE?=
 =?us-ascii?Q?0ovI6GRtECOHR3Ihvr2OcVrMgX3v7CVmFJ9kEnt7KEX/UUFghhJxCm/sDhql?=
 =?us-ascii?Q?vnkae8JL9OP4AQXwjkFnvM8G16vq40OHntQ+y9gDABzDTz7V8GlDxyBiLq6X?=
 =?us-ascii?Q?MPZ9o/UmG2aDNV533QQu/2fTOSxx4Qpwd+L47wl2Af0PvcSR2y3Fhr1uspYv?=
 =?us-ascii?Q?OJGxIiAibtV8R5UafcgeI8XgPba8vBdj1ZuB8hN9L4lgMqDRQIyDu5U2oD7P?=
 =?us-ascii?Q?kM4HcLfX+d94Gmct4PzZL9AwO7yURZQRR21NRPNRhraKu48NGTyue9MtJ9fb?=
 =?us-ascii?Q?Ge4yCqIKE57oR2aNV+EEKEhkc8B5rArXTvACXQ0g+7nXjmMmANgNe9ZGExKR?=
 =?us-ascii?Q?DcbNRffyI7HY4uG7HZnKdp55df7gbTH5lcoAFvrs7dyVUvQAfInYuGB2RFYx?=
 =?us-ascii?Q?e/WdRbIDE4Pb4n7qapVKdY7+CcLmqiFfkQqLSQEF3T+Pw/mn4mz4h2Mhod3M?=
 =?us-ascii?Q?MWU5hDUhsnpaIIRycvL5zCi23ULtd8AZt073bJIhwWdIynrANabp192XaknP?=
 =?us-ascii?Q?AYGiaezKnbVGWlVyjEmkeYQ6kG8kPduvyfOoHxtexl8xEOojlv+6wdIQJsxT?=
 =?us-ascii?Q?aWGMTmwx97qJegQFV3vdBsKrS9G15bxSai4i0Dl919o5V/WkcatZFMbBfeqa?=
 =?us-ascii?Q?AtHbHzLeL//x6gc3x05BVUitNTH09A55c9mSZtRiSZkqdNqJQIqCanEzljAE?=
 =?us-ascii?Q?+IMDU5RPVZh+2H4Y4lrRbNMJGYNVm9nQkp3EdEKeuI4E6bjZQW8uPE+WyoUL?=
 =?us-ascii?Q?pYBHGQLdNNs5AnR0O4IYfb7fmHGu/X+AvPM3vtOm2+mnbYZR+6SRMZI9uxTJ?=
 =?us-ascii?Q?KIbWl0/FOfjPcrBwWViM8rxbFJLNvlTwhKttAqqP9K2jU5clB5QGd56q/Ern?=
 =?us-ascii?Q?Vk+Jz9mDPwvVoCa1H17u0SfwB2bMSoL5/ZPwfocxDKRoLxOiFNKSr4ADtkKF?=
 =?us-ascii?Q?7ZLOt4vB+qU6UDmjgdjhCELWC4rEC0ZHV45Sz0W4CcsT9CynelKJsWFBxpg0?=
 =?us-ascii?Q?ZJKczzwmC68zSRKkurxvQsH9ieQE4PmpY+O98p7XRhxO9GgZ+1cr4iAp/DjU?=
 =?us-ascii?Q?uGoETQlmXVhwfCuL8p5QDofT5DP5ss2AHLcQ9i4X9ThKpiiurhYgqcX+ej1Y?=
 =?us-ascii?Q?b4OpcoWIRLIKSv81QN9uJp/qsWHo8yHB6xJeV7BoF2/ucgD0hTRdPkDtozpO?=
 =?us-ascii?Q?jyBROifAGlpHVqbtDBXLdpP/Xd9h0n91m1Vgrl7YDdE6H7NaiLnTs7Rl27zm?=
 =?us-ascii?Q?oq1ukeWnmdXIqog1ifR1sZJstnql0xSQWQrEJ/p93+ZR5Tn7MKeSEileHOeH?=
 =?us-ascii?Q?Loxuww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DD7A3A6CB897EB4485D05440BF91B8BD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887d6d98-b094-499d-8cb6-08dd30026298
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 16:34:55.8535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYYZ0Higms88CdTSrjkaeciuZYMRrWGDCWfcDVeqUSwUWnGS6615Dd9ky2WVat40hgVFGwB6j6wUPSTz9DmbFM2vmWvHd4Z2Cp82UcnF5as=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5595

Hi,

> On 8 Jan 2025, at 16:45, Alejandro Vallejo <alejandro.vallejo@cloud.com> =
wrote:
>=20
> Hi,
>=20
> On Wed Jan 8, 2025 at 3:23 PM GMT, Stewart Hildebrand wrote:
>> Clang 16 reports:
>>=20
>> In file included from arch/arm/tee/ffa.c:72:
>> arch/arm/tee/ffa_private.h:329:17: error: 'used' attribute ignored on a =
non-definition declaration [-Werror,-Wignored-attributes]
>> extern uint32_t __ro_after_init ffa_fw_version;
>>                ^
>>=20
>> Remove the attribute from the header to resolve this. The attribute in
>> ffa.c is the one the matters anyway.
>>=20
>> Fixes: 2f9f240a5e87 ("xen/arm: ffa: Fine granular call support")
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> It appears the variable ffa_fw_version is only used in ffa.c. Was there
>> any rationale for exporting the symbol in 2f9f240a5e87 ("xen/arm: ffa:
>> Fine granular call support")? If not, perhaps we ought to make it static
>> again and remove the declaration in the header.
>=20
> The only reason I can think of is wanting to have it in the symbol table =
of the
> ELF file for some reason (livepatching?). But that's far fetched at best.
>=20
>> ---
>> xen/arch/arm/tee/ffa_private.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_priva=
te.h
>> index d441c0ca5598..05368d5a88d3 100644
>> --- a/xen/arch/arm/tee/ffa_private.h
>> +++ b/xen/arch/arm/tee/ffa_private.h
>> @@ -326,7 +326,7 @@ extern void *ffa_rx;
>> extern void *ffa_tx;
>> extern spinlock_t ffa_rx_buffer_lock;
>> extern spinlock_t ffa_tx_buffer_lock;
>> -extern uint32_t __ro_after_init ffa_fw_version;
>> +extern uint32_t ffa_fw_version;
>> extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>>=20
>> bool ffa_shm_domain_destroy(struct domain *d);
>>=20
>> base-commit: 70f5a875becc9444a959830b10a361982c31a366
>=20
> IMO, it makes sense to make it static and remove this line altogether as =
you
> suggest. If it needs to be exported later on it can be adjusted as needed=
.
>=20

Yes in fact it was made global as there was a use case at some point but th=
is is not
the case anymore so in fact we can completely remove this from the header a=
nd make
it static for now.

@stewart: are you happy to push a patch doing this instead ?

Cheers
Bertrand

> Cheers,
> Alejandro



