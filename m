Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04922C4C952
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 10:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158884.1487266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIkT4-0003rk-7e; Tue, 11 Nov 2025 09:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158884.1487266; Tue, 11 Nov 2025 09:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIkT4-0003qJ-54; Tue, 11 Nov 2025 09:15:14 +0000
Received: by outflank-mailman (input) for mailman id 1158884;
 Tue, 11 Nov 2025 09:15:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJlB=5T=citrix.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1vIkT2-0003qD-Nd
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 09:15:12 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebe50c4f-bede-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 10:15:11 +0100 (CET)
Received: from DM6PR03MB3482.namprd03.prod.outlook.com (2603:10b6:5:ae::22) by
 LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:15:07 +0000
Received: from DM6PR03MB3482.namprd03.prod.outlook.com
 ([fe80::4cad:bfaa:fd27:3555]) by DM6PR03MB3482.namprd03.prod.outlook.com
 ([fe80::4cad:bfaa:fd27:3555%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 09:15:06 +0000
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
X-Inumbo-ID: ebe50c4f-bede-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQ5TXGbvfXYw8estEBoiM94+Y+UdwbkWroEmpRCakvwBrAPatGrdH4lU6ilDBnc2yU/KlDjZEkovQHW9bHrtxJwhyAJTyiD0yPh//jbeFblRyyU4GjdwAh4ZpoDIxLsdGKaJOOiX8Z9MI4edWga6yaWXuuj+dLwog9kT6hvG3OpM2o2VbrYDle9pHAk9yFRNQhA+0M0KLQtPeus06ysRrNrP2H11+AKKjocTI/VXlNHBzRVQn27dnwo2LHe6crYulEA/6dpwxiQrAfSPpiMqAItjeZ5i8Dd+NvPqZtnUx/sEUJS9sUyF/C7wfA9hiq/XOyBeBaRFYSnbQi9IpO5CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1y076mZFuH72wSJE7nvwv5TrF2pMr7d0M/3voJLUbmQ=;
 b=Y3T3fEmTxAGUYpAySeLtCCvaI8d22qttj4Q+Fv9hV54EAX9FFLzz3r136PgMqyL1daThB3TKEYelu7vMv0dCDUfKINoeUUmCy526+3aF+Z+Sc1JuN7r7kWJMYygEMnJ9p8rnRT6RCAnOS4GiVjGliw02SW+MKarCrLNJ8cDG4dHX/J6Ds6vP9GAZvb9rBsEXIVbEt8frZSvOO7UXXoVh5z6XQSws4wsO0+c4Bd2cM7RJ3Uo3disgMy0f1DQWl2deAViYQnjCLcslDmz3cuL2hd3YpBCuZCM5plOYfzlV9pO8kk3p19mlKTINcLyvsRC5YFbofNSKIy7mU/YTJeAS1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1y076mZFuH72wSJE7nvwv5TrF2pMr7d0M/3voJLUbmQ=;
 b=ApM1TUGGOUDVuK+DzFCBFew3QwDLrKm4TSOw9DgNtHh/k1QZ99ABzZR/NeFazXHedgw9uNB5geb6o9n7RETWL+qrXY4yKZAtEa8cJGPDnSIanhp8i3atR36eMFQdOvaW99g1UzhObGhgtz+d5C0eZ6S0rQu/f9KUW1ZZzyS46QI=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <andrew.cooper@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, David
 Scott <dave@recoil.org>, =?iso-8859-1?Q?Edwin_T=F6r=F6k?=
	<edwin.torok@cloud.com>, Rob Hoes <rob.hoes@citrix.com>, Pau Ruiz Safont
	<pau.safont@vates.tech>, Andrii Sultanov <andriy.sultanov@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] CHANGELOG: Note about oxenstored being deprecated
Thread-Topic: [PATCH] CHANGELOG: Note about oxenstored being deprecated
Thread-Index: AQHcUmFLeTNSyd5DFkCJtNk09fxZ7bTtMogA
Date: Tue, 11 Nov 2025 09:15:06 +0000
Message-ID: <95BD615C-BA0A-4694-AB92-66F9D7285AD2@citrix.com>
References: <20251110164427.54299-1-andrew.cooper3@citrix.com>
In-Reply-To: <20251110164427.54299-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.100.1.1.5)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB3482:EE_|LV8PR03MB7398:EE_
x-ms-office365-filtering-correlation-id: 9377688d-f08b-48ef-fce9-08de2102ce45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4K+tkXTF4zkCAb131nNiM4XEYN7Z/L4d8aVRPa6SRjU7lbstDgrHd1e6cN?=
 =?iso-8859-1?Q?vYL5uu7kFe2+enKSdxROsmy/W75sRmRTGQWydkHoU4cIqxRj3g8GA5v704?=
 =?iso-8859-1?Q?T9l1J0S30hIkSo232S/38/jJAaHiHpTP0u79/Lt5IYo+o/TF+v/0yEKy75?=
 =?iso-8859-1?Q?ag7RcI2h/ePCQAQYC3PM+MisNkDHdL5u8wDr+jVjjloUUJLi1z0xhonxPH?=
 =?iso-8859-1?Q?R4cGzRn6pMQUXtZw2AZOT6q1pmdDDHeUQCE+BmQOU4sye+c0T1Je7s9mw+?=
 =?iso-8859-1?Q?2AjOxal++yj0y3KGRawuYXbwlIR8P6jWyh67WpqqRgLDcvsiJCjZMvUoZ6?=
 =?iso-8859-1?Q?r0Z7UlFkN7A836kAyZEIWZAZ7Tukqna1cjncVpaBC6CjABX3RS3xnt6Tro?=
 =?iso-8859-1?Q?+mmBua84oPTlW1CwNVRixKAyWR2LtXjv6pL6aIMsiWlgW5thS+3AqfHNSp?=
 =?iso-8859-1?Q?GvyyA6f//ja5KiPgNfWMyPOs2s+GtD7kjUNAVPF35JJhNWXT6zU0A8Co/H?=
 =?iso-8859-1?Q?sy19hrKLstHwttWrpTCGKJVMCZExaIuiIGfLapwbFSNfTphZ+o+trPPR2v?=
 =?iso-8859-1?Q?GPyR84wdZOkPUFFlk6dey9cQzO5umHhdOKzeoYUXybwCHbEyjNIoOS8cM/?=
 =?iso-8859-1?Q?O+sQC9TeMoKuLS9khDiGshSeQhOSF6On4j75rAf8FPE4Ny1SK1Z8RAkLHi?=
 =?iso-8859-1?Q?PN/UZUmTJu8y225pBs/TcwNfXN44rE5zAoChB/gMGCllyzmjsWjx8p5zat?=
 =?iso-8859-1?Q?7PmTqPOeMl889G03jbFnEDksOfh8O5k3ZRu4V51M71ZrOG7PPyvHB5txeh?=
 =?iso-8859-1?Q?du5BJQJgqFv8xxnuM/ZQkjSjT7b/AYhhtnmM5p6tYCHwLcOH2cDuHgXfov?=
 =?iso-8859-1?Q?2je9LDzvaJNvlVEkBxzkP2Vro0n7a/mkQcQpy1ltHok26+TogUo7EFMgQp?=
 =?iso-8859-1?Q?0LsHSpH3HVEpK5pyF9iDST2NsclAo7LSb122pDjm22EfKqgoBMLJ/nUYbK?=
 =?iso-8859-1?Q?vixFszee+KEKlIt1koYY+W5d4uq5rxoOAZH4mDDBBK74gquxVKtenYFvKe?=
 =?iso-8859-1?Q?touoJ6+ZCaOtWN0lVpHJk5EKfmDs/tlOiyfHRKe2XF4XJ1UNoKs3GyitAp?=
 =?iso-8859-1?Q?3bwJYyVhgEUks5OHXZzznHUrzomAVEETmqUYDO/AEjWOT53JvNQPDVQItS?=
 =?iso-8859-1?Q?VwykAC5YcP3cdm7T0f4VbMH9W61BSQFhwoOKtnB+/8S9SnPCsozriYnjUv?=
 =?iso-8859-1?Q?3Cx6hKC273LEhMq2rfwLGTvuAuCZxLomZShl6yUrsAlG/J79FJUwSCuzoP?=
 =?iso-8859-1?Q?rOZ4DQ85ZOLXEeMZkmZWxq0O5GAaUd+BcNeEHSniz/ZRZ/rQyAy1ArFMQh?=
 =?iso-8859-1?Q?rtD38nk5OA2DxfBzH5CXbbkv4T2IRI9aNZp2W/8rBFcZihRb7Pycqvr+Vz?=
 =?iso-8859-1?Q?MxBEOYl83fnKA754ypHDzGtmkTGvGgTcBdHCqss2XTXaIzDwcAowk1DOWx?=
 =?iso-8859-1?Q?GkwrWJCJBnsxgumrVSjzt7mwLPX5psEBnUQABzW8D3f+OXMsXU984I638M?=
 =?iso-8859-1?Q?fW7rc877kt+QVo/4maEdqJoGT/BQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB3482.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c5hNFaMaM3OBhjPrr8ccL4+lOo8gd+sQwj7XYUPwvsjCcjDMvBK8AEhxs3?=
 =?iso-8859-1?Q?XkUxfr7XkGmwMPnCjgzQ7jFZA6mCJD63g9c539BX4IKfNXGfFnRnCzyB2K?=
 =?iso-8859-1?Q?irZWJpBlr5AhjPi4425G6MMJmpecplPggVSQdb9zzLw9TaSaV/k/zPLgJr?=
 =?iso-8859-1?Q?TpMbZGMrh8XdOqVOrucfa2+q+ACwCCc3VragQtFUeIdiuxhSAps+OdHWw/?=
 =?iso-8859-1?Q?9RAT9gre42AZ31v7Q561zuk55H5Q15q1Qiq7OlxXI2gEtf3KOCt7+sBhZl?=
 =?iso-8859-1?Q?9VEfcWVRKcgXVA6L0lPK727XH0eFbD8qqWJYdIPFQ5I+G8+VrHuP/N04Ie?=
 =?iso-8859-1?Q?ZxxFaiKWq9mCZeJXL6DEYsWVY+TOG59y7uc2TwxfiULfmFwP5NPrSoLhr4?=
 =?iso-8859-1?Q?gqReFWaS9NjPtdd3foiAL5fxm31Bme+sGNx/UxiOvmRY4yuE99iSRidfr9?=
 =?iso-8859-1?Q?8YspgjWO96GEQs2nu+3zr01iFQ+2IVpu3Fwgc1bN4cXNzj8aTloXa9dfAI?=
 =?iso-8859-1?Q?bNpsNZmOgxM4OXkYMB6UvkfRrEYOYDJzv2UiUp3uiGVlJ895xtcb8JSMHE?=
 =?iso-8859-1?Q?72eRxTOvGtXeGMBHB9/BX8S/yl6DEVuVUDJ5e4EWNlg+Sw+lpdgYqcfFF2?=
 =?iso-8859-1?Q?J6DcxCzyBFo3Z6VYITODWN/TVf0cWLo5V13wMk/GikMi9l91ug6oF4ITis?=
 =?iso-8859-1?Q?u1UzCvYOAch4R/+pVCM8k4MHt5/hqXpT1JE7UV1FkzlLtozoyiuH4eBj5S?=
 =?iso-8859-1?Q?EsQ5cMgp3nmXDH4dr4u58Ys2//OejAuxSCIm8qz3pFU97Xc1UfR/cE9JOe?=
 =?iso-8859-1?Q?TfGjv5TVMw9kUA6O4msZqvzwpKA6IbWSvmU2fD3hVPKZbgBF0Rbls47FKY?=
 =?iso-8859-1?Q?JfM5kPe5w7WyCfsaLd1L9qyk+YQyb2Ocz9NaSdq1rseSVoG8FJZ6q0knd6?=
 =?iso-8859-1?Q?uac38K86/Pxn0p3UhSWchpiKW/xiw3Dg3ShfcsRPt4DeKhdWzsjom+fO19?=
 =?iso-8859-1?Q?kp38XwiI5HqF4bg1EeKIqQLrxlzYj2mCh64UTBchIjxTPJqrLiRXHdXbO2?=
 =?iso-8859-1?Q?xKE9H5t+A+TgkDvp/Ov+IEfgibdN0cc0D5GQQpiygcw5Oco3vw2cnWXa7r?=
 =?iso-8859-1?Q?lqlH/xf3A9PJDAjqD5HTurGXp6v1nqnxtfSAunxFOpNMckvo/uhjeUR2lW?=
 =?iso-8859-1?Q?Z+iTelozULVDQKtaPYvyyZ2vhKeQqHQRhZlhGP1j6MHMfGkMFG/e3f692a?=
 =?iso-8859-1?Q?Bd35elqa2iqBTrsmMIXbxbgMaLsNkHcwr7aKzeiS2e+0rJd+cdYDB32eUp?=
 =?iso-8859-1?Q?iujxe6+IUQrW4t12pSdbvAss9wfHa3bp7CkBY2WBx13gF1yXd1fLW4mOKf?=
 =?iso-8859-1?Q?rmi6OeD8f6knm1VuSdDBx5qiHu0pakqRW098cS4OYZkyBSIYj7AXAUQNTn?=
 =?iso-8859-1?Q?CtR/rmWXG8xe4wuJXcXCpoj9nrhTZcTS6VoenWnvdZd7xS5hkJp/unFUi1?=
 =?iso-8859-1?Q?GRlaEZ/jP+thIF41SGZHwSUhbQ6K9NdJCUuk2uPKpL8wHfB7gZeRuFBffm?=
 =?iso-8859-1?Q?RgkbIuZV7e2LLPqjP6cphVj7ny/FpTwOsC+UPkAznRyVtyU4hE7d/GSKGo?=
 =?iso-8859-1?Q?4ETVRGfM452uYbSo/TJy0tYQAjvx2hpfSGJ3Eg0YeuGC8nfyeabQPnRA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <592564521841E641B3FAB89B3A2C4FDB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3482.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9377688d-f08b-48ef-fce9-08de2102ce45
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 09:15:06.6990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5j0csFDTWFOxCbXb0qFzgCkrbgOT5OObC8nizx3Gulfpc00e0av5xc2zu63OLw2RCp2TExZ75kting7OaWxpudeLWVmSv+Oq36tXGW922k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7398



> On 10 Nov 2025, at 16:44, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
>=20
> + - The in-tree oxenstored is deprecated and will be removed in a future
> +   version of Xen.  It is moving into the Xapi project
> +   https://github.com/xapi-project/oxenstored so it can be maintained in=
 line
> +   with the other Ocaml projects in the Xen ecosystem.
> +

Acked-by: Christian Lindig <christian.lindig@cloud.com>


