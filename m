Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8633B916045
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:46:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747339.1154726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0sS-0003FC-RR; Tue, 25 Jun 2024 07:46:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747339.1154726; Tue, 25 Jun 2024 07:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM0sS-0003Cz-O7; Tue, 25 Jun 2024 07:46:08 +0000
Received: by outflank-mailman (input) for mailman id 747339;
 Tue, 25 Jun 2024 07:46:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LI8L=N3=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sM0sR-0003Ct-Uh
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:46:07 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:200a::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa60d8cd-32c6-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 09:46:07 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 07:46:03 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7698.020; Tue, 25 Jun 2024
 07:46:02 +0000
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
X-Inumbo-ID: fa60d8cd-32c6-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMDj7TH5z8mc3opBJA0OkH0lAPWGthhf62ttW7k4kmHiUrJJDFE50xCkmBF9qsnnyl2JzPTOzablr92bkhB9DKFkMIrT4XrJtgmVbq3Nq1j72BL2ZdOjr4OvodL8ZcYK02ptKXSZmCGpb8F6PSfdz6tWw4EXJV6WaL/FShvIljsL2VcF9G2QZVGHWW+CIc7ZpSWEzTRMrznswlVNxHVILM4AFT5Tto/BlXD3CDKoYBhwZLy1XiW+lnLrG86cUDD3iRZXCSBHj0OSuB1kX5fCC9Z0HVtbqkOb6wmbEWIEF2+eduWBHKomrBPhcl3iYwIZvIqnKWkYudhpourxwOlRMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/s2phCOFsIJhg/V8D4l+vBuLM71RAMOKB881PNaBLI=;
 b=FnIEWEAyAsf2alCafGV4EeI5UaajLiXtN7lAO8/6IdDTuc/u1Pp81WZqiFe7OjF613WLZg/BdvqBCaOMX0+nJuau7Mg4flzvsgYsghhPg2sDHvh1fhJWHUs93hMD6Qgt/KccoNnAPGEQnIxNMFvHuLhZcw2uMgxLO+a0rXfDlQ4P+/Y9OuHdBvKJfhfArtc1m7vUoAL1NiLZJiGYnXyvlIRITHqglPHssj4esFYJH4N4HYmaWvUPPRX337O11I5WMavWwKydkauqaEUmTY2liRwwMNNFnw2hpmX3ZOr43fPBLw4qu7ktrIaz93WZnkPqARUAvriOIOpifpT6Ey97Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/s2phCOFsIJhg/V8D4l+vBuLM71RAMOKB881PNaBLI=;
 b=CgfyBVqJ4FOJOVj/LotxjSiebF03sNzmm1rS0D1btIapzifh1w1iMF3lozD1k312TExWNC9K5TShayRSUbEPqxMtp3LaGB80GXujNok8sLtpJ6/he4GxCb9Ch7c3QPxH/QxnyoNBsmDIzr9ahohjp6FQNahqO3TK08PWCop1AII=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Anthony PERARD <anthony.perard@vates.tech>
CC: Jan Beulich <jbeulich@suse.com>, Keir Fraser <keir@xensource.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index:
 AQHawJTqXyg3PMEiVUiLHPQ86aZkYrHMFeyAgAGdTwD//43bAIADi4UA//+vaICAAe+IgIAEeJ2AgAHGqwA=
Date: Tue, 25 Jun 2024 07:46:02 +0000
Message-ID:
 <BL1PR12MB5849A8E3E11116F1BD663439E7D52@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-6-Jiqian.Chen@amd.com>
 <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
 <BL1PR12MB584916579E2C16C6C9F86D1FE7CE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <b6beb3f3-9c33-4d4c-a607-ca0eba76f049@suse.com>
 <BL1PR12MB58493479F9EF4E56E9CB814FE7C82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <96ba4e66-5d33-4c39-b733-790e7996332f@suse.com>
 <BL1PR12MB58493B55E074243D356B0CAAE7C92@BL1PR12MB5849.namprd12.prod.outlook.com>
 <Znlnf2CHxCFadcIX@l14>
In-Reply-To: <Znlnf2CHxCFadcIX@l14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7698.013)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM6PR12MB4172:EE_
x-ms-office365-filtering-correlation-id: c3acfff7-a33e-4b4b-9d9b-08dc94eadcea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|7416011|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?e831Qo9ThSfRXabNbpK2BX+fkO2H1chTs/0MGvecJYTEQicvMlquHB8BWb?=
 =?iso-8859-1?Q?S1a5Cvq32gSrFtFILw/ajMdWX9RHnb/idpFCqHLTDNkurPeTGGBTOfveZY?=
 =?iso-8859-1?Q?yJc+jXNQVxwqu6TrZ98nOyfu2mV9BgyJuV5j2LOl1t5iRvWD1kGumSBiaq?=
 =?iso-8859-1?Q?6UnQYA+OF1ot7glnTbFOLRIV1mC+p22oq+gyTNkCPP21QDCmjY132W2eLD?=
 =?iso-8859-1?Q?jcivY1yfOEtGXiVr8ipoUvjGEB21gXho4dAcM9OuNnmgqVrO8TidftWo0p?=
 =?iso-8859-1?Q?cwpGRu9WjQBIlx42Nk7VXoYe9Urxo+UHHk4mlPVB1WBkR8aoOi+oi11bRv?=
 =?iso-8859-1?Q?/e1raneeYH4TPRBMuMOO1sN9eLoddx3XpCLb4Q5CMduMcfbT70BTUD3xwH?=
 =?iso-8859-1?Q?47rN2g4SfNPiHsIMOlPZA6zGZn3HufYrJa7GE8BvRUp8qMf3I43/dj7ydl?=
 =?iso-8859-1?Q?Vg0j+lWbrbkLEoqwt+ExDhtJFTI3MFxUp/Tf3E3uUPwbOjuQl7tBxK+epe?=
 =?iso-8859-1?Q?rTQ81D51cavlNkMHRZj7YEe/3Vwdkjd1D5zSAwOwjU1TIuu8sd+mRISS6T?=
 =?iso-8859-1?Q?/zZ3fLh3P9EuYXFInl2ZdhV0jFnH/Uwh/5l7aph/FY9tbgS4UTNZZ1o6rr?=
 =?iso-8859-1?Q?062TJ84ED5m4Kv3Pe+FArDxsGTgvXd90bT33ph1ypD5WU2U57bl/0+RR6g?=
 =?iso-8859-1?Q?KnKOoYULJXq4Ik6ccVnwVv/6e/a0xQK7h243tjp1adi8y7Kt6h9VjfvcuX?=
 =?iso-8859-1?Q?A91Bb8XarCZHhtp3/flaVln3v8P8qNyM3SkiUca7uI6MhmR2sjxEt6ljBM?=
 =?iso-8859-1?Q?lGK2fC1TRMU9e7O37lMs7W0Jhyn2sd3s7do8WGyme3hoI2q96drrXHZl2P?=
 =?iso-8859-1?Q?3F3NoL8xVHuKx38Daje6UzO4GWj967KsgKmAzp/rJ9FdvVsbn3V0HmCMsn?=
 =?iso-8859-1?Q?XeUDNo55pPOcuQQH6SjwwdPX2Aj0iJh+eexBYiNaC8Ck6WZ3jBj1DrLaox?=
 =?iso-8859-1?Q?MeHs7LYsvMfDXJi1QYHzY076LxGGHKILI33O4uRPaV96qTGEEwcr0Jy/K5?=
 =?iso-8859-1?Q?BD9tfEEFD1g93xwAMBojQR7mb7s5vMgfMEsDBXHUupMkzoAHC/vrUCK0Rb?=
 =?iso-8859-1?Q?h3+BO3FcSp24NAFn4fzrBB7xOUlUjUbtQfM5nJ0I7I0sYOpkF9ld59AnfB?=
 =?iso-8859-1?Q?JUkvds5ptka1FGKlwrIe2GzF+7ud0dz5UzJ3Ioc0nPPd0dJ8sbZUd4v0MS?=
 =?iso-8859-1?Q?IOXOiVvZI2v9gnZIh1xicw7cgE7Nb3nRH0gfVbn1+3SRqyjai2wpc16xrY?=
 =?iso-8859-1?Q?0lEDsloLCpRt64TorvKlbgbxWGOa1BUfgnW9S/54+A1fJhsziDwEkSY4zm?=
 =?iso-8859-1?Q?szJ0R6HRVUMowZIxzI4kVQ+6X0jcHtCnDWGxwIWmF+mjm0HKs8ex8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yZ/Wjao4MXQJiM0K/3s95WBOkKrYRjdq9n3p4ZdqPBAV7kwxI25aueQT41?=
 =?iso-8859-1?Q?2Uwt9XBOKL8xDJLTRKDtk0WjE5L6zFE0+jluAolESgVRGl3cdqlCX1B9tT?=
 =?iso-8859-1?Q?V+KMXkbcoT4oZiKh5Ux09B7p9xJP4SVdypgGi4PmonbvhMFUkkawJxqJzZ?=
 =?iso-8859-1?Q?zCm2CJtXAXow4h4VYjUKdMw7v3ASMqIlTF2o89M5gWlrPpfe6WsWUMaR9o?=
 =?iso-8859-1?Q?uX0/HxnrItpr5Habpw74i3KToR1inVo9sSuMWMTsVPHD6k4N5RA4aTkoMI?=
 =?iso-8859-1?Q?tzec4RYsOJvtzD6w18QLv/azn/s2dPZkqH24hZqBTuwv8j/asEiEiTDjKK?=
 =?iso-8859-1?Q?NPjAxpmTzHgZv1U4UEMJk+5kjt9vGJABqniD9gCODoDASq3umd1BspPI2G?=
 =?iso-8859-1?Q?uiOkg9t7TYC00A+u34sklIBtQ0k27BmkA4f4vMZ/i6aHMkUOm5pObhn84P?=
 =?iso-8859-1?Q?DIyGssbCa/WncXKPu+qSXR//dFjSElqMiBoxHaQBqg7ya1Da+50DebuEHp?=
 =?iso-8859-1?Q?bboLz+OTfZoT2KAKkjxU+VScKjnsH/bTdqQY8VAHCV4ciBMPK+8+x/tk6k?=
 =?iso-8859-1?Q?291I1DQ8cTc65DZdbbyR9PopFhPsfXDWwwPe5Bi9TauSh/piGiuEAAm6jk?=
 =?iso-8859-1?Q?L5piJaU18/91vbTRHPkebhE180dZF/3z7qiN6O7bd2Fmgb2njXOiWubc3W?=
 =?iso-8859-1?Q?KzPk3amRnfj0xOFxNLO0Nj6nH8PO0rQNE8RcPdE8sJZ57s4zkliBxi3mnK?=
 =?iso-8859-1?Q?La9lCJ9gMWFsgVM8GzRFxUfY5sdBNjKRTpKoD0S6eW/hYCBkCxISP1oOdP?=
 =?iso-8859-1?Q?BeCMeFhjR61JugmPUfqjWXo2kB4hGPFYr+zN1cRJ6tgIUk1U1CG/v7r2fU?=
 =?iso-8859-1?Q?wrB5Yk000Z2yGkFIKI25B3kNKMKqkpvGXSIfZ99kjuJs2vyGu4dUQNAlfO?=
 =?iso-8859-1?Q?1vDhKPWTW7VZdKGeYz1tfIbEDdIDVJJyP8bXOy5QpGvPtAOI3jjLfoBwYy?=
 =?iso-8859-1?Q?EV/LGEJVL3vSrutmwnOIUZbjMLAipNRHx+00/coapn+mYRx2G2rJ7Lwh9B?=
 =?iso-8859-1?Q?hSF9nFTgqFQEr/fbecilikZFTZppQ4RpxrZg+D+o5aWuS0rqZB/kUv4Yp4?=
 =?iso-8859-1?Q?uKI+pCza2NLjf8NFLKVTdiLu9jhmzSX1QfPl6kcIVEIdOjH805Wo4if52O?=
 =?iso-8859-1?Q?cG/StKOD8joBLRwAllqDpLW3gsNklLPflTbxZYogNLDdooSaBKpgrmCLeB?=
 =?iso-8859-1?Q?q1o67vkVy8zS6bXd2+oGAStXjGeFm5iEyAqgazgg5q0Cgd7j+kOBBLbtpF?=
 =?iso-8859-1?Q?Nue6m1MCMFvHTmFcJ1y+tGN6XDBYvqwu7gl+EVsqWy86DB0Acvg8szlGkf?=
 =?iso-8859-1?Q?uCMb31X12gavJV9DKByizWTBpTvQiaWLlMbBb9s2qMtYNVosrQYE6AiQPE?=
 =?iso-8859-1?Q?A4eQV5cougFVXv9UpaDPtrne/j1LD6wjUYlU4JriLQys6ChlQ/aNwOblhZ?=
 =?iso-8859-1?Q?1Qchux3ya+A5UPKoSy3+HaEQ1JUNl0NLcSGKtUrQWAzjyB1ZfVkF9uCZEc?=
 =?iso-8859-1?Q?V+uxWD4EIUEonDQZ6J5GRdWDa3TguMXR85pbe5KPkncV7XcKQVWzgN9Yax?=
 =?iso-8859-1?Q?Qx9u7ERk6RCd4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0CADF8E3B97EE44E997D357AAEA26BC0@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3acfff7-a33e-4b4b-9d9b-08dc94eadcea
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 07:46:02.9140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8jR56Ii1VtmC9hTcQNXqVIeiv7STGbNgrVTjdGDPyChUu+1gB3E7od3F4F1BD7WKSM8TydC3S1XREpje/bY0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172

On 2024/6/24 20:33, Anthony PERARD wrote:
> On Fri, Jun 21, 2024 at 08:20:55AM +0000, Chen, Jiqian wrote:
>> On 2024/6/20 18:42, Jan Beulich wrote:
>>> On 20.06.2024 11:40, Chen, Jiqian wrote:
>>>> On 2024/6/18 17:23, Jan Beulich wrote:
>>>>> On 18.06.2024 10:23, Chen, Jiqian wrote:
>>>>>> On 2024/6/17 23:32, Jan Beulich wrote:
>>>>>>> On 17.06.2024 11:00, Jiqian Chen wrote:
>>>>>>>> @@ -1516,14 +1519,39 @@ static void pci_add_dm_done(libxl__egc *eg=
c,
>>>>>>>>              rc =3D ERROR_FAIL;
>>>>>>>>              goto out;
>>>>>>>>          }
>>>>>>>> -        r =3D xc_domain_irq_permission(ctx->xch, domid, irq, 1);
>>>>>>>> +#ifdef CONFIG_X86
>>>>>>>> +        /* If dom0 doesn't have PIRQs, need to use xc_domain_gsi_=
permission */
>>>>>>>> +        r =3D xc_domain_getinfo_single(ctx->xch, 0, &info);
>>>>>>>
>>>>>>> Hard-coded 0 is imposing limitations. Ideally you would use DOMID_S=
ELF, but
>>>>>>> I didn't check if that can be used with the underlying hypercall(s)=
. Otherwise
>>>> From the commit 10ef7a91b5a8cb8c58903c60e2dd16ed490b3bcf, DOMID_SELF i=
s not allowed for XEN_DOMCTL_getdomaininfo.
>>>> And now XEN_DOMCTL_getdomaininfo gets domain through rcu_lock_domain_b=
y_id.
>>>>
>>>>>>> you want to pass the actual domid of the local domain here.
>>>> What is the local domain here?
>>>
>>> The domain your code is running in.
>>>
>>>> What is method for me to get its domid?
>>>
>>> I hope there's an available function in one of the libraries to do that=
.
>> I didn't find relate function.
>> Hi Anthony, do you know?
>=20
> Yes, I managed to find:
> LIBXL_TOOLSTACK_DOMID
> That's the value you can use instead of "0" do designate dom0.
> (That was harder than necessary to find.)
Thank you very much! I will use LIBXL_TOOLSTACK_DOMID in next version.

>=20
> Cheers,
>=20

--=20
Best regards,
Jiqian Chen.

