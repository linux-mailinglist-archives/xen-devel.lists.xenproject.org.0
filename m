Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41538ABEC99
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 09:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991540.1375374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdRX-0001TC-As; Wed, 21 May 2025 07:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991540.1375374; Wed, 21 May 2025 07:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdRX-0001RB-7f; Wed, 21 May 2025 07:00:47 +0000
Received: by outflank-mailman (input) for mailman id 991540;
 Wed, 21 May 2025 07:00:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RySz=YF=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uHdRV-0001R3-Rc
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 07:00:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2415::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e21b31d-3611-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 09:00:41 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.34; Wed, 21 May
 2025 07:00:37 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 07:00:37 +0000
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
X-Inumbo-ID: 4e21b31d-3611-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYfYMuENC0S4qeyVIijcDq99KQWOEMMZmbby+mMFFWzvoV5n1Hb2NLkDvUVZCpE6O9qLc8CTsuN0/3bybnDiJfuum2QwO+NHatJoVc+KizKTEX5gHiA0/CUYrNhfLX+f5j9vi5B7WoHs4a+QPhyPw/zrJPQ550sOUmu4qiAGBrRpc4SMjKOvDNBvghvxOMcsplNvp/eoMnx8fVvIJKtnpxEoBXEie0cqX0DYejPwm68JhGIVFqxaoCrXESxJmXerQIV4XEIjDOFXKWK22yhYtkgd1ForLqWaq/CBx+5xhRFT78dTXk4b1gzRaNOSAZ0G8p5KehSyV64coABxvr2+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KR6TXHco41bm2waWPB9DKT3Iq4ZAIK+Gekujl7B24A4=;
 b=J4zsAqe9mg8iZzSkDMeAz3g+ogwuV/YnVe1wvUxCluFH8hy/SyG6+ofPxLzja5z8Cx1txbEHWyz54JBp7XPZjBNGo0r8ZdUscyEU812iaWTzl2YU/efSQCbf88apSCQWMnH24itS75hVdype4o3BhY81OG1s+Yo9MT6LziXev/F/btEFofNIamVx1vdV8pvTV200nW1RGY1/+607szDkhBfOxTjvwkDh15mTR7TK/OusPc064jArXMFmOLGd/NWQCg7xhlNJ6V+AM45gQ07UGyhh5QJONc4Jm6gIqsUa9AZIokgYejURUj6TOKErsKq7fZYnJVkXbtJ2kYpkWVMTjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KR6TXHco41bm2waWPB9DKT3Iq4ZAIK+Gekujl7B24A4=;
 b=Acm5O5jdc7igiaGfaotE2pEnsWLfxk4bOOIGAmVatD5G5hirZhy+zWo0Cgr0wjKyLfeoKM+o/L3Z+MBL6tngpeuheOWspZ+h+e5vCmb9BObX7GMTFBDRBrQ0HDT9V4EN5agN9OOfLT4s4hbWNL0qvdFaR7B+pYn4HyyT7ug72K0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Topic: [PATCH v4 09/10] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index: AQHbwMGh3xGCtPOZ6EmRbIkDtAY42rPbIqIAgAApmYCAAAFtgIAACDMAgAHezgA=
Date: Wed, 21 May 2025 07:00:37 +0000
Message-ID:
 <BL1PR12MB5849E2CD05D70E7A475646F3E79EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-10-Jiqian.Chen@amd.com>
 <8d89f644-4ded-4490-ad23-518563d230d2@suse.com> <aCxGwSl_UuCWPf6B@Mac.lan>
 <e7ab7be1-e256-4f63-a835-cf1e13e0183f@suse.com> <aCxO1Gh_ehxpsznI@Mac.lan>
In-Reply-To: <aCxO1Gh_ehxpsznI@Mac.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB6158:EE_
x-ms-office365-filtering-correlation-id: a3502a5a-7973-40ea-2985-08dd98353084
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Z7RVsIgP9YfbcSHOT40iBMVKhfAL2oUkRKEmDY7ZrOTvUNlJhamRgASjIC?=
 =?iso-8859-1?Q?Tde57bj9Re9ExquO/f7ImWV6BTM9wR6GCrh4CikvH/jfLWs3udaNjtkvSA?=
 =?iso-8859-1?Q?ji8m8xs+8M80YJ0BfM27vghS/uX50RnKri+HfKP55oVZVUluAQazmnPY/g?=
 =?iso-8859-1?Q?a7qyGSkqMWNQOeNcfgqDbY+23AwYUsc51YiNNzDcKDCkt5iEj7fazHwYhW?=
 =?iso-8859-1?Q?MvqCZxAh3Llp6YgJ+k22viGoFc2nZBMx9AG/4UA7sS0t4hixxeS3LyeUlA?=
 =?iso-8859-1?Q?Xp0ykaSE7w0rj5fS3cYRta8mdkIe1uTuF+o5I+Ihdc+fWt8M40zDa8rtPu?=
 =?iso-8859-1?Q?5ObtlxuduLE7PHXlYDraCtsNQ1HM0AbbFFX1tCl6KTj40JpoEXARG8sRGG?=
 =?iso-8859-1?Q?P63NjW20OZzymjaRAnIahHHMBRWq3Sax8ykSoieIO6gzQA/4kidM8EI7BO?=
 =?iso-8859-1?Q?IBtkuOtormuzTUrVbQymOuYnzDOTusDoYvvwd89CCz/dkOTz5B7zr5c5/x?=
 =?iso-8859-1?Q?xWZ0z73RT3d5g72xy2SGb+UCBI6Cm6dLq0Bvmoprek3uvQv1niJ+W2lS0F?=
 =?iso-8859-1?Q?xHvtCIcX80KGyieN7ZcPkqj8Dt8YUHoPKNM08cYYANC1uGmnWnv7htj5LU?=
 =?iso-8859-1?Q?FOM6OwtIeZ1UcX22Ip+XFfpTh1LTDVWuKG1fJkgLspVT9THRjhtFCAjAYt?=
 =?iso-8859-1?Q?89jZAlqObKVB4RzuwriWWidDDJOgEEVhHuVOU2OxT/rRDVDlVPls/xUGda?=
 =?iso-8859-1?Q?6Ho0wDIRu/BK//9W+/1yQ51SlwvG5tgF/U5e/k3lp/3Vfe4+kMZefNo+KM?=
 =?iso-8859-1?Q?iQKzKneuMd1wrAAXPwyezpkPNcnan4pnwVh5NSUk+sL+WPTUkluLUB5J/j?=
 =?iso-8859-1?Q?TqRGRKeQqp2qwjOqw1VlxN+0ifPWRtKvqsqraeKT8wRDRCLcJ9EgtgFotl?=
 =?iso-8859-1?Q?820BeAfs9SBZ7mc9wJPRYnZxuoO99aVTrlqa/PV2PnC9E4lwwhyZS2Pf4W?=
 =?iso-8859-1?Q?ZUnsTCzKd1kOL8mRNcSjIYlFSmUGGZaA4tfFs0HiTp2YMXhQjiHsP3ihnM?=
 =?iso-8859-1?Q?kT/dCeGfE0+BPZEdAI7ysuFIDsjKXmmTMaDgeCp05U8z5h2Qc15PU7F/iX?=
 =?iso-8859-1?Q?EGaaiAYZPSHLGFfaAWWWWmphR3nd/OWdknKPeXgy2GuudM3965Bm2lJa/C?=
 =?iso-8859-1?Q?j49nWpvMgt+4ThQSZSgeYUQ1FHutLExz3jnlyXFBgLO2bwpQGt/lXQIwmu?=
 =?iso-8859-1?Q?q4DX5FdDD6vg4Kmuyk+bzqous0+cbZt5mLLEkjAybG6UlhluqAvjNIkVJv?=
 =?iso-8859-1?Q?KuUufDTza2NXjci88JrAzykdhXvovB9pA1krSnAtlUMEqXnnSxP2eNOFpR?=
 =?iso-8859-1?Q?YrWWJDj2XOXE9sybKOplFh8X0t8sftIIb3EGd2fn1D6GOpW5dTAex7f6eG?=
 =?iso-8859-1?Q?nOh/7pNEzd1QGBEZC6lbnL8F1pslMChkETEcEI2kdegUVKBt2WMTueRU02?=
 =?iso-8859-1?Q?mmf4LrP4ORYUJifEPAET+xrbR8h3ASK79vjkLymsHxiM68FZLE/xAWSrR8?=
 =?iso-8859-1?Q?+YsgINo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ub9hqoNK81/PL2LLk8RQ27L9AWzWjzcfdaZzkG4XP+dN1e4/g4roKxPofB?=
 =?iso-8859-1?Q?tO4/620QLLMmkHwnEzJOXCProZ7GH1wx/2uuf5SZGcT9tMBNWaL5hWzZXt?=
 =?iso-8859-1?Q?909vDDn6CX/wzBu7R9E2crUIgjhY9Sh5/BSEnqjHGgJX1ggiNobKkuqbHG?=
 =?iso-8859-1?Q?ncPRSFs5T1T4xBYggUDNI9nPIP+iogJ1hK31p6CKP2i2qrQhxafZQfYi01?=
 =?iso-8859-1?Q?6/XDDAUvh3Pcw7fiNczQ7PyicIfmxoQnvoOvSn1nDnMUsYcdSzTpHgEzKt?=
 =?iso-8859-1?Q?1U3pTPuN9V9YhLrd3B6fOh8oOmLyHjYLRAcRtr5BLO/5icNjs1YPcivRP5?=
 =?iso-8859-1?Q?/fLBjjHBn9zUsxmJFi7C5r0TKob+aUQNOzm5N9OoAJ5B8bCgwxlgatiX5T?=
 =?iso-8859-1?Q?eRTx62rR48NnAsaIU2748QuVzZ76TMO1gaBxQR52hT5bF/yHuF2LUnWZH1?=
 =?iso-8859-1?Q?1zMHWREqhwTsv0+uogveC2Oqlxm/KrNT16SoLReOPiRkezHOb6qXdJERzy?=
 =?iso-8859-1?Q?VIIRdgblAvp9Iefd09lXp48BKshKw5loir383aw4/D3JC17HzhV4cUJ/sp?=
 =?iso-8859-1?Q?F80sycL/AAAG8+5V2V6Yrm7mhTOzUxC+RXuztTFkg1e8Eu20Ylkz6f02H+?=
 =?iso-8859-1?Q?4mnT7qsg30iY+4akfd04oZ3KEX+263W1fdil24Z08FjRKMKfdhTKK+ZcBm?=
 =?iso-8859-1?Q?24/vSjsthEIBqoRYItZ9/en2RvMtFx+CbqnkNXdC4LD92PcgrbxrOOpR/3?=
 =?iso-8859-1?Q?o1WQhmNhRc9p/bga2mVgVWM2ke/X0I6dryxQYKeqyps3vfgjAoIyj4JhxC?=
 =?iso-8859-1?Q?M/KK30pOyc6XgqtQcj0js5B1xDuN2Ng0Ja8rt2QSHsybhVKrBHKhthMq4n?=
 =?iso-8859-1?Q?R/9KAgOEiFFRJHCdQ4mnzj96CcLFIdnvXKVC4hw2IvFO3NUDc6xl1dD04q?=
 =?iso-8859-1?Q?jqeyBV4FbiyIP4aJH+SJOFJSn3VnzYBlVRJQnPtgCL/riI/cVZPqFAJTOZ?=
 =?iso-8859-1?Q?5LfN/xmgAt7/DF2qOgEfDTfbkIioeekUaWtv2HBJPVVP0f9ELBxHPggyiK?=
 =?iso-8859-1?Q?kmpfj52nutxQi8MCPeHB3QlhDSPGscp5WsJNd+AmqYGPgzccejRIfKUlVY?=
 =?iso-8859-1?Q?fosTWjbdIeBT6yIgst8cpqhbG9WTBgNbKY3zyEQ6iYvfybw3JGTiG8bqSY?=
 =?iso-8859-1?Q?QsX9uZhoDYiubKqyJJAh4N/MtcENasUjRrN/Xcw3zswLSVDJyhdgAPJBIM?=
 =?iso-8859-1?Q?/GyopT0Yv33iEqpTmEIVy+PpKC9mBq2cBwxd74OSKfHtFHpwe2Otw8AXiD?=
 =?iso-8859-1?Q?uoLNqm8uhS0a7CPo4CIjYB8UAwnQ7fjIXsi3s1IgJ9jJ9cNGjyn6BCbA/X?=
 =?iso-8859-1?Q?fCmovlMq4wVae1boLqGwkqXP+388MwVZjxoFPifJr/s2qN7MyaUZ5Xqbh0?=
 =?iso-8859-1?Q?5FwcqGSg3eddhm6P+uldvr+8xctAbmqALjMd46rJ2ykCilJH5ZBKFZhCHD?=
 =?iso-8859-1?Q?4Lv9bWGS0M476MbGJYMWdbEjoxHiqJyve4mj50z+rJMl0UNIMLC/c8upN7?=
 =?iso-8859-1?Q?XLYhocMxZO1ZQiK3o9kp6x82bA6fP0GQ14AM5Z65NoF0+aAKorqImk+zjZ?=
 =?iso-8859-1?Q?v8Tt6KpPKL9Pg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BEDC05909F92F34CBE4E18BE0B70DA6B@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3502a5a-7973-40ea-2985-08dd98353084
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 07:00:37.0919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XAzKS8alfSmSfTo+qFoYLIIJnr8J2gsozjhp4qODC4pdXyL8AQ4xDJNL+3X6U86PpYCT5sjFmWCxZa3ms++clw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158

On 2025/5/20 17:43, Roger Pau Monn=E9 wrote:
> On Tue, May 20, 2025 at 11:14:27AM +0200, Jan Beulich wrote:
>> On 20.05.2025 11:09, Roger Pau Monn=E9 wrote:
>>> On Tue, May 20, 2025 at 08:40:28AM +0200, Jan Beulich wrote:
>>>> On 09.05.2025 11:05, Jiqian Chen wrote:
>>>>> When init_msi() fails, the previous new changes will hide MSI
>>>>> capability, it can't rely on vpci_deassign_device() to remove
>>>>> all MSI related resources anymore, those resources must be
>>>>> removed in cleanup function of MSI.
>>>>
>>>> That's because vpci_deassign_device() simply isn't called anymore?
>>>> Could do with wording along these lines then. But (also applicable
>>>> to the previous patch) - doesn't this need to come earlier? And is
>>>> it sufficient to simply remove the register intercepts? Don't you
>>>> need to put in place ones dropping all writes and making all reads
>>>> return either 0 or ~0 (covering in particular Dom0, while for DomU-s
>>>> this may already be the case by default behavior)?
>>>
>>> For domUs this is already the default behavior.
>>>
>>> For dom0 I think it should be enough to hide the capability from the
>>> linked list, but not hide all the capability related
>>> registers.  IMO a well behaved dom0 won't try to access capabilities
>>> disconnected from the linked list,
>>
>> Just that I've seen drivers knowing where their device has certain
>> capabilities, thus not bothering to look up the respective
>> capability.
>=20
> OK, so let's make the control register read-only in case of failure.
>=20
> If MSI(-X) is already enabled we should also make the entries
> read-only, and while that's not very complicated for MSI, it does get
> more convoluted for MSI-X.  I'm fine with just making the control
> register read-only for the time being.
If I understand correctly, I need to avoid control register being removed a=
nd set the write hook of control register to be vpci_ignored_write and avoi=
d freeing vpci->msi?

"
     if ( !msi_pos || !vpci->msi )
         return;

+    spin_lock(&vpci->lock);
+    control =3D vpci_get_register(vpci, msi_control_reg(msi_pos), 2);
+    if ( control )
+        control->write =3D vpci_ignored_write;
+    spin_unlock(&vpci->lock);
+
     if ( vpci->msi->masking )
         end =3D msi_pending_bits_reg(msi_pos, vpci->msi->address64);
     else
         end =3D msi_mask_bits_reg(msi_pos, vpci->msi->address64) - 2;

-    size =3D end - msi_control_reg(msi_pos);
+    start =3D msi_control_reg(msi_pos) + 2;
+    size =3D end - start;

-    vpci_remove_registers(vpci, msi_control_reg(msi_pos), size);
-    XFREE(vpci->msi);
+    vpci_remove_registers(vpci, start, size);
"

>=20
> Thanks, Roger.

--=20
Best regards,
Jiqian Chen.

