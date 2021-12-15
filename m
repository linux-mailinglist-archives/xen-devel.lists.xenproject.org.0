Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5DF475B10
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 15:52:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247417.426631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxVct-00089F-0g; Wed, 15 Dec 2021 14:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247417.426631; Wed, 15 Dec 2021 14:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxVcs-00086f-TF; Wed, 15 Dec 2021 14:51:26 +0000
Received: by outflank-mailman (input) for mailman id 247417;
 Wed, 15 Dec 2021 14:51:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iD5n=RA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mxVcq-00086Z-Tj
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 14:51:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76585d96-5db6-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 15:51:21 +0100 (CET)
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
X-Inumbo-ID: 76585d96-5db6-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639579881;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5SyX/wlj8b+5lplAD2ca4LRgi1p42NtNL4OxTuHNdkA=;
  b=ZWe/QHtT3H2aMDzsPb3RaAEw998Q/KZyFM5l1Op+BlCrqmdcvymO3/l4
   IsdHtnMcgG9AFm75pk+IhWiDsKNz4DaYPyhkS+ufQvwUuDMleVd6E/3LV
   qjobdL8wCtsrglBfHLHxpMji+eK0d9Jdh6wzsBWSetr2Xnypo33Ibom4a
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: R+VEUmi5itQMvGNR7Nt09vyQPqXS/5sCv4B7E/fLYGHVo5U1JPQqw54r2QX1pQEEHeWsXb1DQt
 FW/ltY1V4US/6TEopZDhL5TALbcGJCox0/cl+zqVLpPJavEBGXpU2vodH/x1qt+ozp7uKfZtrm
 Kvx+9C1lVZ1CTXeK2rINijWwu/fl6qK/i1FYIGKeXcE+8mzEf8W3nKfj2xhUHF9gYL3bOho9kt
 wz+WhX2iDHKOAK56voFpgwh8AWdbLh704HJe06VwxbV01rRDECbLgY7DQ/J3+AU2PHO2z7LL/l
 CVjJ6Gu2hnyG9i+osF+Wmi9Z
X-SBRS: 5.1
X-MesageID: 60481605
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OJXdbaBwoSQbfxVW/xjlw5YqxClBgxIJ4kV8jS/XYbTApDwi32RVz
 WZJDD+EbK7bM2Kne9wibYi08hsDvp/TydY2QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+EX570E87wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/tjaXksF+8
 /Rxt9/uTD0WJvCVxsZaTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf2WtYYGhGpYasZmM6zMX
 vpBRQJTaz/qRQJSAEUIEqskpbL97pX4W2IB8w/EzUYt2EDDwQo03LXzPd79ft2RWd4Tjkuev
 njB/WnyHlcdLtP34SCM8m+owPTOmyz7cIsIEfuz8fsCqFee3HAJARsaE16yu+Cki1WWUshab
 UcT/0IGsqwa5EGtCN7nUHWQu2WYtxQRX95RFewS6wyXzKfQpQGDCQAsTCNFadEgnN87Q3otz
 FDht/TtCD90ubuZU0Wh56yUpjO/PysSBWIabCpCRgwAi/HhqowuihPETv54DbW4yNbyHFnY5
 DSHrzM3gbkJuucN27+m5lDMgz+qpZ/hQxY840PcWWfNxhtweYqNd4Gur1/B4p5oBZyFQ1y2m
 WkLksmT8sgDFZiI0ieKRY0lIrat4PqUNSzGtnRmFZIh6jeF9maqeMZb5zQWGatyGp9aI3mzO
 haV4F4Pos8IVJe3UUNpS7+yFck7wpPBKdamCPXuUcITO8ZTMxDSqUmCenWs92zqlUEtl4Q2N
 pGabdugAB4mNEh38Nalb7xDiOF2n0jS0UuWHMmmlEr/jdJycVbMEe9dWGZieNzV+09tTO/91
 99Ef/WHxBxEOAEVSnmGqNVDRbzmwJVSOHwXlyC1XrLTSuaFMDt4YxM0/V/HU9U090iyvr2Xl
 kxRomcClDLCaYTvcG1mkExLZrL1RopYpnkmJyEqNlvA8yF9OtfytPlBJ8ZnI+NPGAlfIRhcF
 adtlyKoWKsnd9g6025FMcmVQHJKKnxHej5izwL6OWNiLvaMtiTC+8P+fxuHycX9JnHfiCfKm
 JX5jlmzacNaH2xKVZ+KANryngvZlSVMw4paAhqXSuS/jW2xqeCG3QSq1aRpSyzNQD2erganO
 /G+XU1F+LKT+tBtq7EkR8ms9u+ULge3JWIDd0Hz5reqLyjKuG2lxI5LSuGTej7BEmjz/c2fi
 S99lpkQ6dULwwRHtZRSCbFuwf5s7tfjveYCnA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arjR3/8jhTSPv+8+J1/35XEr8ePfA1lSJRSFlAdUMKBxbNE+2
 e4ktcNPs16/hxMmP8yolCdR82jQfHUMX79+7sMRAZPxixptwVZHOMSOBijz6ZCJStNNLkh1f
 WPE2Puc3+xRnxOQfWAyGH7B2ftmqa4P4B0ankUfI1mpm8begqNl1hNm7jlqHB9eyQ9K0rwvN
 zEzZVF1P6iH4xxhmNNHAzK3AwhECRCUph7xxl8OmDGLRkWkTDWQfmg0OOLL90EF6WNMODNc+
 ejAmmriVD/reuD33zczBhE5+6CyE4Qp+12Qgt2jEuSEA4I+MGjsjaKZbGYVrwfqXJEqj0rdq
 Og2pOt9ZMUX78LLT3HX32VC6YktdQ==
IronPort-HdrOrdr: A9a23:bT+Xwaz3zvXcJPDEo5zUKrPxyOskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WBxB8bZYOCCggqVxe5ZnO7fKlHbaknDH6tmpN
 tdmstFeazN5DpB/L7HCWCDer5KqrT3k9HLuQ6d9QYXcegDUdAf0+4TMHfjLqQZfnggOXJvf6
 Dsmfav6gDQMkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jIsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCmlqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6UvouqhND6Ws3N
 60QZiAoos+OvP+XZgNdNvpfvHHeFAlYSi8eV56cm6XXJ3uBRr22uvKCfMOlaaXRKA=
X-IronPort-AV: E=Sophos;i="5.88,207,1635220800"; 
   d="scan'208";a="60481605"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Po5giEmZwxuyFMI9w1j8ou1Hv0cyuglG7V3/VV4XG1Y8Y0uSfMsbB1wi4Qi843mb1Qq+ysahBeS1ibXFtXL+f8tJImwMloysqrQfO1XEvJSDRarv+Zsnx2NXbhjteZsOeao8wnXWu47ERNF4zveuL00DAOlhzUSF9D1K3ZmNVr6sQ+mltZaU8R2NWYjKY6Zau5Pqybb0CKDmRVHZWsbuy0+jt2H9yZaUdUiQRhXw1YAOBusKOSST5g6y21X6bNpvEmriYU4NXp+xlmH6Kpx/NKKArZQ3dXdIb/VQ0m79Hqv2yyE+cVoqOwi9DHDt36U9KL9zWw94/Aa+psQZoA5Eqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o02XVI8qcv9II66wpAcTgX+8H9fTt9VW2JktbX3kT4Y=;
 b=hICRglBenf/Ohjm4AVDG7j9qqYg7673B/Ek6lAoJWVy+8tI07B3KMuEinxjbdtyZv+iZ5+v1oVK0ze+VqukCqkSvv7g/UgGloPvnnyoOVMssjG1IjHmjn5Esnaopl/PqvHW7TVGqMTKUOOpm2mNPQN7tSaE7ZdG/JpXInzA84cCIhrd0I0ZDTLCGoTtu0y3+b/YqlwlWmt5vdwa3FFds78OpSTDAHQ4UZjSzZh6E4JifzaqXwsmCDNTD+Bf06ufTqUg7EhRlTOOi3Ncl/DaefgOM66+CBpHDdU5EoySe/RC1tnMMymjzJofOK/hSVM9PzctP+LDC7auOGnHMoijHhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o02XVI8qcv9II66wpAcTgX+8H9fTt9VW2JktbX3kT4Y=;
 b=Wi8XNAo9FQSOtROtmQ5D8wTqBmdOi2jxJ0DcMRdDJp8QqNijYqF8jYcjjHZ6KBnEXPgQxgas4QwzZpRUc4+PuEIOHroakHpqu9NEJ5X8O//dKo89CMpqNgw9JTW4JtLXNJA2Z4Pm7OV+AhrZ7wGwmt++GpcQCko85RNy9DPtpT8=
Date: Wed, 15 Dec 2021 15:51:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Jan Beulich <jbeulich@suse.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 00/14] PCI devices passthrough on Arm, part 3
Message-ID: <YboA3j4GDLMxKP0A@Air-de-Roger>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <3a9f16d5-f076-92e2-f1b9-33a3c1a3371b@epam.com>
 <79466492-fd58-1be0-c47e-13fc1e17479d@suse.com>
 <1103f95b-3345-f28f-1eed-7f26328d67fa@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1103f95b-3345-f28f-1eed-7f26328d67fa@epam.com>
X-ClientProxiedBy: MR1P264CA0016.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::21) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 152432e3-2bb0-4e23-46fb-08d9bfda57a3
X-MS-TrafficTypeDiagnostic: SN6PR03MB3646:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB36466274D6FC29595B893D3C8F769@SN6PR03MB3646.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rmCIR3T1VflYF27LPXauPxmQkMz06I39uq4HE1KnCPwZ4SozXAaqizh8ZDqQGPnPDM0e+arCqnz7WaO9+s9cM5xwnfKYw5UC3VRi7mwwcukn4VPkeRnslycS2myzV0SeDlrHp8K/udwKVT1vM/slzTrouCMxpn4sbuzoDtIBPC1kd4TGSCPzEXxC0vO4gIbagFIKbW/phBwGq9I4FHk2M8H5A8gMiw9OY/mN4Te9lWWXHvHxzw7GXWyj9GXl4/0drP9w17eKSJBZKOyngIjmXf1Ueu6AbCtbKAz7adt76/0V6DgJmFQ7GX5TELtUlh1agnmVlYI0968zUAzWOMUBU6MQGuRTsqKAvFg0S5OIZNaow1zRqcExtyu8zkq9mr7siC9LTdZjEGXR0D6qqimMmtG8W93/7ZOeeKFdAVhh+AVj9/Ny6M/BX2l+o90ABWPyPPlfyj4SWGs3iRKwEKVtlvtDmmTuY66Ey32H1NnS4IzzEl097ex8WY4tA0M6Xd2+4halcbXK73GPka7RWFGHk2cKJCZT4EntPvhVMCepzg3floJMYHAzhr0H9TB5+N8eOYRdBR9j33sSQ/t6XYMn2V9KpJptckzjHG8ZE/mrsubofVObJ2AQ1C2DMDVhf/Q36JU8Q8I6J5OmEYiLpFHiUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6506007)(6486002)(53546011)(66946007)(9686003)(5660300002)(8676002)(83380400001)(2906002)(8936002)(6512007)(4326008)(26005)(508600001)(82960400001)(66556008)(85182001)(33716001)(6916009)(86362001)(66476007)(38100700002)(6666004)(54906003)(186003)(316002)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWZ1Q2syZVFPaWQ5SGFzMW9DNHQrZWpvdTc1ZUl1aTZYVUZrY1ZZRkwxMlZB?=
 =?utf-8?B?dEk4Q2JuTlZnUHN4UCtBV3BBR1JuS2QraUtEOURMTHUrRWVhRldJUFpZRWJ3?=
 =?utf-8?B?Wk4rdFVPSGJXSEVtTGtzLzNibFhTVWdkazBicmNvc2YzUkI0SDNuRE9XZUJF?=
 =?utf-8?B?ZXVVWnJXeXpkVmRXTkR6THVvek1wQWJldjF5dW80NHZZWGs1NlExdUVueFNo?=
 =?utf-8?B?dGhHdytucU9iOFFzdmV0N2hPQUFKclBkajJ5S2VpQWZBeWVqNGt5QjZCeng0?=
 =?utf-8?B?NDU1aEFsQlpYYWsyTzQvQ3ZBVFdEVW5iNUh1Yks3NldBZlpmQ0F1Rm5DYzNM?=
 =?utf-8?B?U0dIWlpFS1JrTkt4cHlXeHM2dDh3Ri9udjJoVmNGd09wSUlkR0RHSnJWSSs4?=
 =?utf-8?B?eVluZ1M2bllIMnBYZm9kbzFlVkszNXVNTVVSVjRYUTFoVVlyb0NaeW01RnFa?=
 =?utf-8?B?cFhnRmJGQzlnNDNqQzBPRTVYYVNuTGVPOStCR0tDZ1M4aGxlMEdrZmw2cGlW?=
 =?utf-8?B?dS9kZTBNdXBLcm9iVEtpL1BuT0JFdllvZVJyRkkyemUrL1lRVm5jTlBmYnlL?=
 =?utf-8?B?MmMrMVdpM1hxZXhKTk95RkxsM1V0cFVrOFRZSTVSU3VnWXQyVTRobkRTRElJ?=
 =?utf-8?B?WVV6eHJkczgxTGdMa3Vpelh4SnpKUWdXYlJxWk1kK2ZXbkdqRm9qdWIxUVds?=
 =?utf-8?B?SUhrWUxBL1RtZzZrVXVrQ1lwSDEyVzc5V1lMZkVDbzVjV3ZEYlRHU25lR3px?=
 =?utf-8?B?UElLVmVzZzNyakQ5MmJBbW9QeFBnSHN0ZWZuUWNsYXdWTEtVT3ROdFI3V3Ir?=
 =?utf-8?B?Q0tPTHlkYWI5SWw2bGowbTFwM3RyS1NoTEVPZWdWZkJzcG1qT05wUCtUMk1s?=
 =?utf-8?B?ZmhkVThKbzFTaG9LcnFYRFNxdU1pR0doUnQyM25TVXhNUmtPNFhCUHpma2Z2?=
 =?utf-8?B?NGJ3MDJRWTV6Wk9NaXBzS0JmVEY4Y1Y1T3BzOFgzM1Z2eDAvanhMdHZSa1Rr?=
 =?utf-8?B?cGJCc25tVUFRTVRLL1Bxam9oRjI5clNjM3lUd3haeXJuVExKVVg1ZnJrd2t3?=
 =?utf-8?B?TjcxcTBaaG9LdUgvczlXMFBwcHBtUXpvRTd0b1VwMDlpTHBFWndZUDhVbWZH?=
 =?utf-8?B?UytaYmxCR0ZQZENJN0MxTUU1UHMrQW9aQXRUWHlESjZRNFB6bEJFemdVVGJo?=
 =?utf-8?B?YUpmS3MyU01wbHhrNHR1Yjh5VUFYaUdId2crOFpGRGFlY1pZdDQ1Um5VL0gy?=
 =?utf-8?B?Y3ZkdjdEL2JKYmM0cTFBc3FScHUxSndzTHlkSC83UGp5dVNoWXpXSm5sSGVo?=
 =?utf-8?B?c01DWlhTYSswYjI2L04vWnFyUU9yemlnZnFSYzBoeHNuSy81bTEzVngvQ3Zt?=
 =?utf-8?B?MFByL05sV21UNm5RelJqbUxoZkl1ZDYzaGVVT3dPWjY2M1QwSCs5Q1IwSjlp?=
 =?utf-8?B?d29LODlTaFpzMnNWUVZvK2JteCswYWFtWmlPcjE2VlIxREtUYng1VklaZ2pQ?=
 =?utf-8?B?VC9UR3FxZTk0bXhLMHQ1UC9EczRDWXRPNUxvN1JqaGNYclkzZHh1M3BXS3h6?=
 =?utf-8?B?WVdJNzBqRVQyTityZ3g0YmNjaitHSFlBbHdTTXlJaGlOSUFIWnc2MzFUWVJt?=
 =?utf-8?B?RVVaa2krV0c2K3ZmNkNJaFZ0TkszQXYwVks5WG1JaGgwY3N4SStkNDkraTVp?=
 =?utf-8?B?NDRPRWtOVjJVZGFBaVMyRlgrWHFSM0xadHZFSGVITER3MzhtMCtyQ0JaMXZY?=
 =?utf-8?B?Z05kNndHUzdoTXdjY1FTa25FM2I5QWU0Z09XNDRtbWhWWmE2aVJ2L1YzT25U?=
 =?utf-8?B?Zk1QWEJKaHlYUk5LdmR1NHBLSHdmNDVsQ09SWDNaVUkvQzBMWGVWc1FHUW9u?=
 =?utf-8?B?dXFrVnVOMXZMRXZ2WVhkSU5ZWGdUOFlhRzVhNGJtdmsvYzNFdldlUG41am4x?=
 =?utf-8?B?bWw4L2JIT3JpQzlzdkpzVG1VbDRGbzFNQ1pxbWVTYm9sd0tFV25BazVCNnRr?=
 =?utf-8?B?NU4xa1BveXgwSm1peVBERjVqa2plNzBZVm8zeVludHJsUk5jSUNWYnlBcTlp?=
 =?utf-8?B?Vmx6UW54RFI0RkpneDNZa1pMRVBaN1l6Wk9QN2cwN1lwZytzNEZhQUs4Zm9v?=
 =?utf-8?B?QW0wNzFTUXdreS9ySWVIS1VmeHk4WWpaNklxUFRPekxxcXFGRC9STzRNdmVS?=
 =?utf-8?Q?y4Cm5pYNo8JMPcvN7Q7InZM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 152432e3-2bb0-4e23-46fb-08d9bfda57a3
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 14:51:14.6089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y95rsqWfrVx/Yts25TqQYnBnvDF4MC6czPeSWJ5I6/8wML2nrgIG54rZ+kzJFOnfsJO1xXs7pVUd4TEURU3Vwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3646
X-OriginatorOrg: citrix.com

On Wed, Dec 15, 2021 at 12:22:32PM +0000, Oleksandr Andrushchenko wrote:
> Hi, Jan!
> 
> On 15.12.21 14:07, Jan Beulich wrote:
> > On 15.12.2021 12:56, Oleksandr Andrushchenko wrote:
> >> Dear rest maintainers!
> >>
> >> Could you please review this series which seems to get stuck?
> > I don't seem to have any record of you having pinged Roger as the vPCI
> > maintainer.
> No, I didn't. Roger is on CC, so he might shed some light on when it might
> happen, so we, those who work on PCI passthrough on Arm,
> can also plan the relevant upcoming (re)work: we still miss MSI/MSI-X and
> IOMMU series which do depend on this one

Hello,

I'm quite overloaded with patch review and other stuff, since I've
taken over the Community Manager role while George is away.

There are series on the mailing list that have been pending for way
longer, and while I understand that this is of no help or relief for
you it wouldn't be fair for me to review this piece for work before
other series that have been pending for longer, as other submitters
also deserve review.

Sorry, but I think it's unlikely I will get to it until after new
year.

Thanks, Roger.

