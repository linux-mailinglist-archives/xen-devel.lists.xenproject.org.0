Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E294336ED01
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 17:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120131.227160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8Fb-0004Y4-MO; Thu, 29 Apr 2021 15:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120131.227160; Thu, 29 Apr 2021 15:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc8Fb-0004Xf-J6; Thu, 29 Apr 2021 15:06:47 +0000
Received: by outflank-mailman (input) for mailman id 120131;
 Thu, 29 Apr 2021 15:06:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJyU=J2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lc8Fa-0004Xa-Ju
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 15:06:46 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9235659a-aa41-44d8-81ce-4a4c56d1524e;
 Thu, 29 Apr 2021 15:06:45 +0000 (UTC)
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
X-Inumbo-ID: 9235659a-aa41-44d8-81ce-4a4c56d1524e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619708805;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=t4THo9la8+oLv8Q0KTwPtDuBq1zsumXO5en4gS8KQRk=;
  b=XzzkpC727l+Yy08bGrHvK5ZEJbJ1vrszf+IzTWgvEB+srnbnCxjt6nPV
   YbalMA63MLrGeYQXiYNQZOZHXkVk/KL0dwVQ3iEyd6RLa/dDEr16IH1o9
   j2t/DwKoh7d6neFTAPOIEQAFlv8jEZ7FacZjXSK9yx1jmWepwlqlCTWSe
   U=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: gIPNEHYh1ImQe8UpVUOF7jTpR3YkMbGnst8+xFZmWKCAzBD0kxBdllUV3O8jyMK1o1P5PBMImj
 xx9TbJsFANAGv2CDm3/42Cg1VtWHsMNoAcfh+/ju5Hl9AVcrNX8O4XvYrh1aHywhEQIusH5+Ul
 tmR0jnlQk6lyMiDCUJs0MDweWWhFGKv3MikV2QEkg8uYQj8zm0ZAthvyonSx3x0aIXs7X6/j8i
 /ufQk3wePDbjXlgX3NBV4ZcFO4fqwH6HIbNcDEi9WRcQ5qAzbKUTCjBO3ODxXASosvNrMzALkP
 HIw=
X-SBRS: 5.1
X-MesageID: 42531525
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QvBgpqqiuoELcODvI6/r8OsaV5uWKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQZ3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIRg/I
 9aWexFBNX0ZGIQse/T6gO1Cstl5dGB/ryhi+u29QYXcShBQchbnmREIyycFVB7QxQDIJI/Go
 aV6MYvnUvbRV08aMOnCn4ZG9XSvtGjruOqXTcqJT4CrDOPgzSh9aLgH3Gjsis2fjtTzd4ZgA
 /4uiPj4KHLiZCG4z/ak1Te9pFH3Obmo+EzfPCkrugwBnHShh2zZIJnMofy8AwdhO208l4lnJ
 3tjn4bTqJOwkjcdG20vhfhsjOIuFlB11bYxVCVmnflq8DiLQhKcvZpv55TcRfS9iMbzbNB+Z
 9LxG6Qut52Ch7NjU3Glrz1fixqjUa9rD4el/cShRVkIO4jQYJWxLZ+wGplVLM7WA7q4oEuF+
 djSOvG4uxNTF+cZ3fF+kFy3d2FRB0Ib1m7a3lHnvbQ/yldnXh/wUdd7tcYhG08+JU0TIQBz/
 jYM55viKpFQqYtHONALdZEZfHyJn3GQBrKPm7XC0/gDrs7N3XErIOyx7kp+uewetgtwIEpkJ
 rMFHNU3FRCO37GOImr5tlm4xrNSGKyUXDG0cdF/aV0vbX6Wf7lKiuGRFcyk9axovkWD8HBMs
 zDeq5+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49RhaPr6vwW8jXn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3uXnf5hRPWSm78Y0CXx+M1LIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOE
 1kIL3mlau/rXKs/XnB6nhoPhY1NDcX3JzQF1dx4SMaOUL9drgO//+Ff3pJ4XeBLhhjC9/NHB
 VHvFRx86KvJ5mWzSQvYujXdV6yvj82njanXp0ckqqM6YPZYZs+FI8hQ7E0Px7MDQZJlQFjr3
 pjZAcISlTELC7njbyogfUvdafiXug5pD3uAMZP7VrDqE2XpKgUNwYmdg/rdfTSvCEDaH5/gE
 Zr/6oWnbya8AzfVVcXsaAfK11DaGOeHbRcKh+KDb8k1YzDcB1sTGuMmDyRgwwyfG2v7EkJmm
 n9N0SvCI72K0sYtXZC3qnw9lRoMm2bYkJrc3h/9ZZwDGLcpx9IoKS2T7v21mbUc0AFyO0GKj
 3JCAFiVj9G1pSy1BSPniyFGmhjzpIyPvbFBLBLScCb5lq9bImJn7oBBfla4dJsM83vqPYCVa
 aadxWOJD31T+Mv1Ar9nAdsBABk7H0lm+jvwhvr8Syx22M+G+PbJBB+XK4ASuvsmlTMVrKNyt
 F0nNg1tey/PiH4bcOH07jea3pGJgnIqWC7Quk0oflvzOgPnao2G4OeXSrD1XlB0hl7NsvymU
 8ESKlw4bzKOOZUDrovUjMc+kBsmMWELUMtvACzH/Q3eks1iWTHe9yO+LjFpNMUcz+8jRq1PU
 Pa9SJT//3IBXTekbEbDr89OmRQZgw37m948OaLao3XD0Greoh4jSqHG274dKUYTq6PXagUpF
 J95dqDmueMbSr22AzKp1JAU9Vz2nfiRdn3GR6GHO5D7sezNluNiLa7+cLbtkaHdRKrL0ADwZ
 BffUMebs5fmiAvgY0+3C+1ULH2qCse4ihjyCAikEXs1Iig6HraGk8DMRSxuOQpYQVu
X-IronPort-AV: E=Sophos;i="5.82,259,1613451600"; 
   d="scan'208";a="42531525"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3atVyNVLyqacKdamjeeLeAfF7kM6j7/bwCjFqa+jP6gl6W+mjE20rTmfQOmVPompOsEawaSxW5V2nmR5+rh6KyaQZnk90YKSzc2FD8Goxo8uBqKgvUJUkv9Tj7Ptx7Qg/crOFGC0qWVD3J7qH/f4XG64yqJLYavHhQbpKUoD272GMHCqiG9+47B2pQ+6VFrw1jBpShLqHcNBwtqZYUgte2FyZsMHy0yMFeCa8kh1gCFmy6Hgnisf24h10tMU1WDzLUh0vbS6xlWPSDSL3D1LZatgyQ+bC4PdH01ObdbmDrQJdXt29T9nH5TmKFnzsuoSGwwVi6W3AoBLGmh19fl2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYxT9YNRP9D0r9dmMFv3NEeRnQz1i+fp5X4gJx5oSkY=;
 b=HL800/m5j2S2zbPfIJcglnqC+SjkR5di18r4OPeLUdD+rNCnTdUyyEm30iK49LdiNvuLHQE/LC1JpofOTidslJTFPj0qa+WYITUkffDaGGCeWcOyN100vkE3O3xTEoNeD8P1ZE8JesDqgecf1taLZiWE6QR1lY3k+unJHCcsexYYvsLAHExTDhquDAW7OwErq3nyXTNaVtiW3OxU/c+a+U6zcR1vuR4mNi5dhMjw/3/BXIopeRi+sHzuPNG7FQfew9IjaRZB2TAvAxeb09Wowyn1oCop3gtNsx0Xv4HlW/Qa+lPMGd5pAr9ywUusK8/jK5roYdAfLTZCnFiuPBfuWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYxT9YNRP9D0r9dmMFv3NEeRnQz1i+fp5X4gJx5oSkY=;
 b=GkPU0rjN8F9zpU9oGR0lJhcjENh5sr8zVMKgfWHLH+3lnIzvPPlFkLxWZxZnbAZOiuLKkMWuFoYGDDDLQzkTPQMAIWzWjiXBguy9NY4hbxYLeQQqv5pGz7kWQABNB4NURGombJUVO1BJ/dTZiyPR4maTdmWygdCmXsONn1iTyFE=
Date: Thu, 29 Apr 2021 17:06:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v2 01/12] x86/p2m: set_{foreign,mmio}_p2m_entry() are
 HVM-only
Message-ID: <YIrLfRzQ2ADeF3/n@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <4b842581-e24d-6b74-eef5-7ac48f0ff0a4@suse.com>
 <YIqx3LahSx1bmgNo@Air-de-Roger>
 <9dc64292-d87c-77ba-1356-80cb14348973@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dc64292-d87c-77ba-1356-80cb14348973@suse.com>
X-ClientProxiedBy: MR2P264CA0118.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a29f5cf-3832-4266-545d-08d90b20655e
X-MS-TrafficTypeDiagnostic: DM6PR03MB4299:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42994DECD171911C1F551D658F5F9@DM6PR03MB4299.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rqGhXfIclNEDxnox1uMrxwIi3pjqxoQM2FdA4fc1UcPUyBGvBZGJDUkEmG1/bAIZluqYm5gJVIs3i91X6tLKdNwb2W57FTjk+PFAglTSQptRkLHEqyY7E7gHAJ7TieMa04aNq1+Oy1QD0rymn0YVt/L+W7aCF2K9RBUTsybqHcSpyYAe7ouJ2ZDoRiwKApJ9bPUcajF7wV6n4IA6wghuOE6ZKdGxdyJlj4mT5mtgdigDPsAp0g1kfLgJbS50ChEkNgqdWYjV2MDXyoWptOunVvfLBgiwNTvcfwc3CmcdB43XgaZi15i7oG+EI4lSaN7spTyFyqW+9E/Q8vDhvN9kocYbKcyo1NjvHElp5YZzxyOSh8u58X9JtovPEhT80mVTuMCpaiNyHs/AXS8UptDvSwd4G0KXnbkwmfA+Xp052uH9yK4UnWa/kJsn1fWgCEyflKullSsgjR5Co6dbSB6M6HRm3zYvowcWIc6GeU1d0HANqYAOrN1eZGRQ7kT4GSwwgBQQy5t6XtHYKMR/MRNuFQiZ3CiqIdm4o4m6iniL3Fpv9NGA/4A5GMzBAxKoDowOodp+H309O80tsHi9j3Lvb1u3Otm758l+gkJyKQGX4yCgWu2iI0tmut80ue/Vw3Rc8EJS05+3zKKwbhpyxTRg/NG7G3+xkON1XvtUcYUuzJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(66556008)(85182001)(54906003)(478600001)(9686003)(66946007)(956004)(2906002)(8936002)(6916009)(26005)(186003)(6666004)(316002)(16526019)(6486002)(53546011)(5660300002)(107886003)(33716001)(86362001)(6496006)(38100700002)(4326008)(8676002)(66476007)(70780200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bmp1VEhhVFBYNGFKY3p4SEJJNlp6ckdrQi9mVjQ4d1FuRllMMmphUzBOcG1m?=
 =?utf-8?B?Q0doaVFGSmx1VGVObk1JUmloNDRneHhPT0JkYkd3T3UzZTNVQU8rNGhLaGg1?=
 =?utf-8?B?TGdGaVltYnVBdkk0VTVjemVLYWl2c2hSc1lpMTI0MkFQdlROanFjVzk2aUpt?=
 =?utf-8?B?M2FMYWN1bkp3VGZIUmZPaEhjZ2ZHMjNMQ2xOZkxZbzRMSnlVWTlwdWtXQVJw?=
 =?utf-8?B?dGhudWJDMVdYMWlUUlZGSEE3RjdEY2Q2czlWeDNkR1VNUjNXMXFBc09nblA0?=
 =?utf-8?B?eTgzTzV5L3VlZVpaWWo0VFRicjd5aFRscTB4LzlqY3FGcFQ1TGZyNFY3TFQ5?=
 =?utf-8?B?WHFiSW1JN09LdFRkc09PSlg0ZDM0UEUrZUhQSmNHVGhHMmVsRnMvZm1vR3BI?=
 =?utf-8?B?TFZrWDc5NldNbUNJakRwanYwWXZ1NXlsaVBEb29nVzJhOTBSK003RHNmT2ZL?=
 =?utf-8?B?YlE2c2x0MXNqeUdnbjBmY1hhZHdUNkppSHM5Q0wxdityRDJaNTdjTFE0RElC?=
 =?utf-8?B?VzdVcG9pYXBRYkNpVFVoYXJaMlVpL3RSWEI4UlJraUFDbkFDRnFYWXZ2Q1Nl?=
 =?utf-8?B?U3VrNU10S2ZUcWNBdEJNZitNNWhuY2ZwTE9ubHhNdDk0bHd3Nzh5ODhmazNk?=
 =?utf-8?B?bVdMcHJ3TGFFMXNYRHJoZkFMMk9YVmgvMmc5aTBmN2ZBY3BiblFidkd6Rk5L?=
 =?utf-8?B?VDVBMGJGWjFtMUJiS2oxS2pLWmZKTU1zS2V5dW56WTZTRmhJUDZSRHQySnM3?=
 =?utf-8?B?L2o1RStEdEdUQmVneFY3cUErWXJKQlh1RzBpUGRybk1SczhaMEdBU0JZaHQ4?=
 =?utf-8?B?WlRmeUtDOHBPWDZYMmZCcFVNWUdxNVBtUk9TNFZSanVpbHNSSEMvMUhudmVi?=
 =?utf-8?B?SWsvMzhMblgzbFRkQkdqUGNXMThQY013UUdISlRhM3BPb3Z0YzA2dTRVN1kz?=
 =?utf-8?B?RHd5U2wzZUgzRnJ2dXBNT08wMjlNeTBXcVJzaWZXWjdQSzVDUTZrMGNwTFZR?=
 =?utf-8?B?ekJMRnBxL0dRT0pUNXpHbVpCTjhzZi9NRzZVSGwvREpQanMxM1cyYk9XV1Bm?=
 =?utf-8?B?azJVMWp0QlhmMDh5RCsxanJRT2dDR3BBZmJxQTMwVGpzUVZZOUhCSzcyemtC?=
 =?utf-8?B?NEtTRkRORExPUG1BSGxrUURqL1hTVVNqaTFrVjg2R0RGVVZBMnloOFJUdFE5?=
 =?utf-8?B?L28vMGNOWlJYd2t1RWtmdzVpSmQzdzc3QThjR2w1OHUvMEZVVjhpOFFKd3Zy?=
 =?utf-8?B?a2NKWnFwaUd2K0t5ZEZxNzZWS2N4eWtVaWphN2xTNklpdXltTUdYUFFBYjY3?=
 =?utf-8?B?R0hzZ2xGeEJSRnBwRFBSWW4zS2s0N3Q4VzdpWnZTUkZJbWR3Y2NHcWhYSkdF?=
 =?utf-8?B?Sm01NlBlS24wVE1heGo2RWxNbmNIVm5BUkJyNkhNMWRKZWxGN1laeU1od2xU?=
 =?utf-8?B?NWNFZ3dRYmltc2hldk5JaEpPdGhxUVlHdm9wa1NVOGhaZ2VkbjMzK2VIaUdX?=
 =?utf-8?B?VWpWNVZhNDd6L2FKa2IxeU10STNBcTdYOGVQdlh5NzZuWnl4ZVkxdUlIUU1I?=
 =?utf-8?B?RHhXZzdBdFZ4V1VMNUt0bVlia1VhNFJKVkFhM1ZrR0pEckhSMG9iQmpIalpn?=
 =?utf-8?B?SXVVOTV4dllXZzRNT0IydG42Z2ViVDA3WW9UMkVRWWpwcnovZnEveU1FdHpP?=
 =?utf-8?B?dHkxQ3FEaUFQcks0bDR5NGhiSlQ0cVQ4QmZHbjl3OHF3N3R6V2IxaDg1aWkr?=
 =?utf-8?Q?KSf8uE9jIwGWPHwwi8dEq3+H2+xKXU9bXFPP1Yn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a29f5cf-3832-4266-545d-08d90b20655e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 15:06:41.9475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3isXGEsDYsyuErrvTwDkn20P8P+AVOdEbZWgZS23Vc26Iv0OHll+WYypgkmAVsvMQAxN9m+83xUOyLTqdu9Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4299
X-OriginatorOrg: citrix.com

On Thu, Apr 29, 2021 at 04:09:30PM +0200, Jan Beulich wrote:
> On 29.04.2021 15:17, Roger Pau Monné wrote:
> > On Mon, Apr 12, 2021 at 04:05:41PM +0200, Jan Beulich wrote:
> >> Extend a respective #ifdef from inside set_typed_p2m_entry() to around
> >> all three functions. Add ASSERT_UNREACHABLE() to the latter one's safety
> >> check path.
> > 
> > Wouldn't it be better to also move the prototypes in p2m.h into a
> > CONFIG_HVM guarded region, so that it fails at compile time rather
> > than link time?
> 
> In the header I'm fearing this ending up as spaghetti more than in
> the .c file.

I would just move them all into a common CONFIG_HVM section rather
than adding CONFIG_HVM guards around each of them.

> I think where possible we may want to do so once we
> have a clear / clean set of APIs which are generic vs such which
> are HVM-specific (which I expect to be the case once p2m.c as a
> whole becomes HVM-only).

Oh, I would certainly like p2m.c to be HVM-only (see my comment about
introducing a p2m-hvm.c). Anyway, my only comment was about the
header, so:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

