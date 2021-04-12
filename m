Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3CE35C1A4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 11:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108851.207686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVsxz-0008Vh-G4; Mon, 12 Apr 2021 09:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108851.207686; Mon, 12 Apr 2021 09:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVsxz-0008VI-Ch; Mon, 12 Apr 2021 09:34:47 +0000
Received: by outflank-mailman (input) for mailman id 108851;
 Mon, 12 Apr 2021 09:34:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7uB=JJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lVsxx-0008VD-1d
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 09:34:45 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 396e3567-e121-4768-9874-8b14980d0d2f;
 Mon, 12 Apr 2021 09:34:43 +0000 (UTC)
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
X-Inumbo-ID: 396e3567-e121-4768-9874-8b14980d0d2f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618220083;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zQasOQ5WYhr/gSP7aD85d0cCvIIBBlPDkwuGk2RfrYs=;
  b=C4I8jjqPZk2Oi69TGPX6/+SzBLYDovK+ZX/7GVq0XG/H+b6qkyANtuzr
   hm4NwXSNiNGK4NNVJLFgleDMAdfyuE4kYeOwAvfe07J4OdNHN09drjcnT
   Dox1U27czddMqq0ARb5rWIaQGBCpfq/j8C/vWkbnSsZwqHt6jyUie3qBk
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: acSbpTBlzjf71CRwvitfCn8vhE7q1RDV/aOisLZvUqdSD1lZE7D9/YCzr2yVzXONaNL8lyd9TI
 E7RdUPCeQdB3EGUSgyv6QzASoq12Z6mBmSHuR/6uIFFXi5GwNdvInRIF6o3VoRBLtHP78Tu1nH
 aP8WSm9DJdeewN2Cmv9O1QP81T6bSGRsPXosII4jmtW8fG0vqXhyv94eJy6E8G2JDcitT8QevN
 lLlX/FjVi2ra0Bv27J5mbcN0TRxUHQOFRA/onfX/iuMCtLoqrjiAfBaX7vc4LpIhWBib0sgK8u
 tjs=
X-SBRS: 5.1
X-MesageID: 41503762
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:QW5UiKC1hrPPynTlHegctMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmBEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVsUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbiSw9BEYTj9J3PMe4X
 HI+jaJnZmLntOa7lvn12HV54lLg9eJ8LV+LeGFl8R9EESPti+Gf4JkMofy2QwdgObq01oylc
 mJnhFIBbUO11r0XkWY5STgwBPh1jFG0Q6T9Xa9jWH4qcL0ABIWYvAx/L5xSRfS50o+sNwU6s
 sitAj4xvknfy/opyjz68PFUBtnjCOP0AIfuNUekmBFVs8mYKJRxLZvjX99KosKHy7x9ekcYY
 9TJfzbjcwmFW+yXjTyu2lix8GURXIjHhuKaVhqgL3q7xFm2F9+1EcW38oZgzMp8488UYBN46
 D+Pr1vj6wmdL5bUYtNQMM6BeenAG3ERhzBdEqUPFTcDakCf1bAsYT+7rkZ7PyjEaZ4g6caqd
 Dkahd1pGQyc0XhBYmlx5tQ6C3AR227QHDE1txez4IRgMy9eJPbdQm4DHw+mcqppPsSRufBXe
 yoBZ5QC/j/aUPzBIdy2RHkUZU6EwhebOQl/vIAH36eqMPCLYPn8sbBduzIGbbrGTE4HkzlBH
 8uWyXyOdVg4kinVmSQummSZ1rdPmjEub5gGqnT+OYejKIXMJdXjwQTgVOlouGHQAcy95AeTQ
 9bGvfKg6m7rW658SLj9GNyICdQCU5T/fHFW3NOrgkaDlPsfd84ypGiUFEX+EHCCg50TsvQHg
 IajU9w47iLI5uZwj1nLN67LGSAjT82qGiRR5kR3o2PjP2VNK8QP9IDYuhcBA/LHxt6lUJBs2
 FYcjIJQUfZC3fJkqWqjJsdAcnFbNliiAKXIcpZwEiv9nm0lIUKfD82TjSuWcmYjUIFXDxPnG
 B89KcZnf69gzq1EHA+h+45KVVIT2ySDNt9fUO4TbQRvoquVBB7TG+MizDfrx0oYGLl+38fgX
 HbITSOdevGBUdcvX5kwr/nmWkEBVm1TgZVUDRXoId9HWPJtjJI3eiHarGa/kGRZlEBq9ttew
 3tUH83GEdD1tq33BmalHK+Dn0g3IwpJfGYJq8kaavv1nSkL5ComakKE+RPxotsMMnjv4YwIK
 SiUj7QCAm9J/Ii2gSTqHpgBTJ9r2M8l+j0nDLi92q10RcEcIzvCWUjY4teBd6S72LpHanVlL
 p4iM84puu2PCHabMWcxaTecj5ELVfyrAeNPpUVgKERmZh3kr15W6T/e3/v8lps2R0lNsf6lE
 8EWs1Akfj8E74qW/ZXQj5T+1oiqc+GI0QquDHnG+NWRyBZs1bre/eyp4fSobUhAke9tBL9FF
 mW/Spa5erEVUK4pMknIpN1BWRdc04n7nt+uMuEao3LEQ2vHtsztmaSAzuYcLVHTrKCFqhVhh
 Fm48uQl+vSUybjwgjfsX9aJa1JmlzXDP+aMUapGeRS9ca9NknJqqy24NSrhDOycACFUS0j9M
 R4XH1VSN9ChDkkhJA21Sb3apWfmDNbr3JupRd9llDs3YC65nz8Bk8uC3yBvqlr
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41503762"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8M1fbMutmMzftrc2oW/Nch8+IZ4+VdtxVko8lpONKu6y4GOrWCdN7NRciQnXgZJa45eVIz31xIeSH9lis/hTBByrR1HNFrTxko4Iwy09it1FDgRldS1bTPdNb5vNblQ5tphMjsBo/1CDGaC6DhLlqYcfk7gKDvV80V5FugAAaRpttU4vh4lSDZtmoVm/mHTwyku2QOUY2yQCilZEzRF3ypCuXjUObCmkLrEx3At9ZYJ9HAx6UV4ZyUwHmCtAvSSpzXoxp/JbQT3QScJ0ty51nYk2uqO3S1Wh3sa3PSiZwZVRIbRuv3gugOYdk5ned8toijA2WLinK0g/sZIVq6s/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spCQjae4mmuQKnFFW4X5FnTPZuvVMl2ST4dGncrUvek=;
 b=ka/lgDoYUkbYDIKADoCgAFMoNhuKM0ccBDl0vRHVFgalGU/sfRIyEqBAGqlIqdYyTWDEaok28MRrmbaWcDpxEVXdNrQ3qfNIDTec96roSFENU17XNR0VqH4xrA8Hwk9Ps8qkPIANJP0t+CF+nll6mpi5ZgkWYl7Mf8Q3TZLXhzFgPakyXPDfmjo1J/Pt6/hhR+KSI8EBasu3oRGiEt4izHvc9eAUb+iidrlPj7fBUDFV2UaO4ja9Zcse6UktNfye20Ov4lcAsJvMVjsa5SOrEhYuSsHkrKf/5SSO6ZdSoQEWuKqzIFpltNjEjm4cYqSuSpsTghopq2HRn2Q1pHz1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spCQjae4mmuQKnFFW4X5FnTPZuvVMl2ST4dGncrUvek=;
 b=d3+pRL/aWMp7v+8nsXhhOzT9AzeyrTgKpW9pDb9VmJhzxDEIBBEUBSBtjBBWd7YuEjFF49us43YRanT1qy6dGXjybjS6HxaNhHqy5RqH8zSi5iiPUgqw9xiniuyctNxke0zK1UPTUBOe0NM2PwEbNaJebkwTfUP2yE3vKzwFB64=
Date: Mon, 12 Apr 2021 11:34:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86: correct is_pv_domain() when !CONFIG_PV
Message-ID: <YHQUJw8H2tgNy5iY@Air-de-Roger>
References: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
 <54013074-1fc4-1047-0d00-2762fcbc9ade@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54013074-1fc4-1047-0d00-2762fcbc9ade@suse.com>
X-ClientProxiedBy: AM6PR0202CA0067.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::44) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9dd3803-65bc-4754-345e-08d8fd96311f
X-MS-TrafficTypeDiagnostic: DS7PR03MB5606:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5606F74F741D9E2CF041EEB98F709@DS7PR03MB5606.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rgE2ef8iI15kqOLq8dkU+ji4n+OeW5N7k4+rSOQ5GuS+3+kEMqVcMoLTKBA529F9hHSZjxeFfopEHrqb9ivHIwH5r/NJguEWRbQ0GzczVFGXbNjbLlK528MSOonBtw5UNXUaljh3u6YljJXUP/tEVospo12fhdZvS1lGwXgqq4r0+QBqsAu5a5ozYYlxo6CNuY57dvc76IRK4yY0mMc6x08mPyafg+rB1xAJ1gS/H6jlo1vr7tRWY1aaSxsjPDiNEJK9IAqjsk3vK/XL2mytn8Fq1l6kmLgUfUCHp6x/X0VUlSuxsYW9Vtq47QQj4g39LokF0RrbJvMwPsFRqTeQZhuqbO7KO5y6+Yi2DKf8EWaMB0MTW4oSdzIEztbPJ1VZg0TF/LLk3YDixCeWOm+o/elcpzQ8Ezy9lk/oSCR1vwUsuciLva+1tnr+WnOmr/eAaauMYFyXIDCQTIp101tqA1T7t5Jd32GRle5VLcAjGT6lWQRe25yEDehnUShsuBkb+TBc9K44Su3mlml+ketTQ85TPSnaf10nSRgNxJZlHCCfl5q/b6xloiJB4GDG/lDv1UlxRT3vr7PRSPxosAmCjd8pM7TwFiXLk/NA9oOxJH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(396003)(39850400004)(366004)(346002)(66556008)(6666004)(54906003)(5660300002)(66476007)(26005)(4326008)(66946007)(38100700002)(85182001)(186003)(6496006)(9686003)(8676002)(316002)(86362001)(956004)(6916009)(478600001)(8936002)(33716001)(83380400001)(16526019)(6486002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WW1SR21qYi9ETTFwYUpIRHo2MHFoWURzUjNieTJReldEYnJ4UkFRaStWTzVO?=
 =?utf-8?B?NkIzR1VpK3JPTk0wOUdISHVwZWZVNDRZUStIV1ZqRDRHVEV6dWJUM0c2Qmxy?=
 =?utf-8?B?bFkvRTBqb3M3UlNsRzJ0WmdjQlUzdzE5Z2YyL3E4S21FZWV4S0xtSndwdzMy?=
 =?utf-8?B?RUtTNmtoSDluTWZaeHdSZXFFVjFRblkvVjExcWp6anVUanNRaUNUWWU5QzZP?=
 =?utf-8?B?NlV2UUI4aC9adE5Jb2E3OEdleXhTWXdMVVBuZTgxU2orakxpRDFNVUR2RDZo?=
 =?utf-8?B?ZDBxS1ExUzgxSmpZVmdrdjhaTjdiOCtNMFdrdUN2YVhvUlR5Y2V4MGY0QnE0?=
 =?utf-8?B?R0xuN2FGMlVwR3hTVWF5T0xaMTdzSmVuY09QWlZVRk1UNHEwT1Q2akxtYXhu?=
 =?utf-8?B?RjdoRk02MGNod0FwRDB6aUp0MGgwdExYNTN5MkxYaktFeUhFeUd3NGtHYVpU?=
 =?utf-8?B?em9BV0dZeGlNSkxpSHRXaXIzeSt4NVpSZnpnbmN5VzV4TjhBQTNiSzJJM3lB?=
 =?utf-8?B?N1lhRVlSUTNWS0ZNdnZhRDRlSDZkcGZNenF5Rit4Y3B6VDRKNURpdXZld29L?=
 =?utf-8?B?Ym9jNy9PSFBSWE51N21BcjlaQ3J4UnIrTkltUFRJMTB5cm1CMERtbHM2ZG9D?=
 =?utf-8?B?dUt6a29PM2xtY2YyM1cvVzJrOEZuRWJ3b2NFS0lkcWk5Y0NJY20rbGhUVzli?=
 =?utf-8?B?R0hLTmlKOTJmMU9UUnlLRFVvVTVTN1J6eVAwL09LMjUyM0FQUG5NUlc5b21K?=
 =?utf-8?B?eitHbERsdW0yY1FSQmk1cUlyd2hOaUZXM1kzVUd0WDd1cGU0bzhjcWNqMHU0?=
 =?utf-8?B?UmFZa2NhazBJQzlhWXdnUzFXZmdYREYvL1plNXBpZFEvb2ZjRXhRdGRkQXdv?=
 =?utf-8?B?MmdVckFUQ3dkSXZMZlBoTXR3THFkWUd3N2xVWDNMekdEM0VpSEZuSldHYWV1?=
 =?utf-8?B?cURFbGFKc3JjNy8yTmh5WnBVQm9Bc0EyMkFFWktIc3EvRjhiR2xDbWQ5akRP?=
 =?utf-8?B?M1BDSG1oY0RmSm9LcHJBRUhwYXg3ODhvTnVxQjdJUmd6TTdhUEU3bjdKbWxa?=
 =?utf-8?B?N29pakVtUm9wRXhFandSTTVHdmxZb3BJVjdTbU9WNDBPZFlvVFl4a1lScklF?=
 =?utf-8?B?ZzdQdWdtcFBnaVZObDFxQ3Y4czN0OGZiaHcwT3lWR3BOU1NEM2F3VzBEN1BU?=
 =?utf-8?B?bFVKcEk1dWpLZUVyKzBJeG5DUmxzSmc5RExXSVZRc0IzSVgrU1dBRXNiNnE3?=
 =?utf-8?B?OWZSMlJIMmtlaTZ4eEV0SHhlbUF0RTFNUm9pTkoxcnE2b1JpcXN0VkN1R0tr?=
 =?utf-8?B?N2RJYkF3ME4vT2dyTFhQUEhPbnV4US9HQjlwa0VPdHprSHRjODFybS81VTB1?=
 =?utf-8?B?RTBoNVhub2hHN1NjTHVLRXRJdG55cUhCQ2tOQjdWaHlnN2JRNUJiZzI1S2I5?=
 =?utf-8?B?bVZGZ2FzMFdKZE43QUtiRkc3NktWbWJjaFNydXY5VzZGVnpaejZHYTZsTWd5?=
 =?utf-8?B?WWpQalRHbk4wMnM4bSt1R3dOMFlsWjI3QW9GNkpMRjYvOU1hb1B2TzhPYkZa?=
 =?utf-8?B?UXNlamcvblZoL2dwK2VrUHg3RFpVSFBvNE85b1lIWWFFOGliSlJRUGEvWldH?=
 =?utf-8?B?UExIeldQc3Q1QzdvN0h4aHdvdngrR2pDdTBHNkxWMGlseWFNbmRNTE00M3Z4?=
 =?utf-8?B?OTFMV093cXl4Q3VRdTFWcFRHQlhTVWx0U1RvOTJzd1drNDVSTmJTZ2cwUlBD?=
 =?utf-8?Q?cwmeeBrodEpqKKuyZ9HELR7NailZEq+4kG0RhAZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dd3803-65bc-4754-345e-08d8fd96311f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 09:34:38.5518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/HAleEIlrchA07T7FuQZvFiMfT7L2LUFXJptgZ7NJcBVXPG1/mzyhWGUzX13zscWrBCrzm4EFdZprk+JaWnjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606
X-OriginatorOrg: citrix.com

On Fri, Nov 27, 2020 at 05:54:57PM +0100, Jan Beulich wrote:
> On x86, idle and other system domains are implicitly PV. While I
> couldn't spot any cases where this is actively a problem, some cases
> required quite close inspection to be certain there couldn't e.g. be
> some ASSERT_UNREACHABLE() that would trigger in this case. Let's be on
> the safe side and make sure these always have is_pv_domain() returning
> true.
> 
> For the build to still work, this requires a few adjustments elsewhere.
> In particular is_pv_64bit_domain() now gains a CONFIG_PV dependency,
> which means that is_pv_32bit_domain() || is_pv_64bit_domain() is no
> longer guaranteed to be the same as is_pv_domain().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -568,7 +568,7 @@ int __init construct_dom0(struct domain
>  
>      if ( is_hvm_domain(d) )
>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
> -    else if ( is_pv_domain(d) )
> +    else if ( is_pv_64bit_domain(d) || is_pv_32bit_domain(d) )

Urg, that's very confusing IMO, as I'm sure I would ask someone to
just use is_pv_domain without realizing. It needs at least a comment,
but even then I'm not sure I like it.

So that I understand it, the point to use those expressions instead of
is_pv_domain is to avoid calling dom0_construct_pv when CONFIG_PV is
not enabled?

Maybe it wold be better to instead use:

if ( IS_ENABLED(CONFIG_PV) && is_pv_domain(d) )

In any case I wonder if we should maybe aim to introduce a new type
for system domains, that's neither PV or HVM, in order to avoid having
system domains qualified as PV even when PV is compiled out.

>          rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
>      else
>          panic("Cannot construct Dom0. No guest interface available\n");
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1544,6 +1544,7 @@ arch_do_vcpu_op(
>   */
>  static void load_segments(struct vcpu *n)
>  {
> +#ifdef CONFIG_PV
>      struct cpu_user_regs *uregs = &n->arch.user_regs;
>      unsigned long gsb = 0, gss = 0;
>      bool compat = is_pv_32bit_vcpu(n);
> @@ -1709,6 +1710,7 @@ static void load_segments(struct vcpu *n
>          regs->cs            = FLAT_KERNEL_CS;
>          regs->rip           = pv->failsafe_callback_eip;
>      }
> +#endif
>  }
>  
>  /*
> @@ -1723,6 +1725,7 @@ static void load_segments(struct vcpu *n
>   */
>  static void save_segments(struct vcpu *v)
>  {
> +#ifdef CONFIG_PV
>      struct cpu_user_regs *regs = &v->arch.user_regs;
>  
>      read_sregs(regs);
> @@ -1748,6 +1751,7 @@ static void save_segments(struct vcpu *v
>          else
>              v->arch.pv.gs_base_user = gs_base;
>      }
> +#endif
>  }

Could you move {load,save}_segments to pv/domain.c and rename to
pv_{load,save}_segments and provide a dummy handler for !CONFIG_PV in
pv/domain.h?

Sorry it's slightly more work, but I think it's cleaner overall.

>  
>  void paravirt_ctxt_switch_from(struct vcpu *v)
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -408,13 +408,13 @@ long arch_do_domctl(
>      case XEN_DOMCTL_set_address_size:
>          if ( is_hvm_domain(d) )
>              ret = -EOPNOTSUPP;
> +        else if ( is_pv_64bit_domain(d) && domctl->u.address_size.size == 32 )
> +            ret = switch_compat(d);
>          else if ( is_pv_domain(d) )
>          {
>              if ( ((domctl->u.address_size.size == 64) && !d->arch.pv.is_32bit) ||
>                   ((domctl->u.address_size.size == 32) &&  d->arch.pv.is_32bit) )
>                  ret = 0;
> -            else if ( domctl->u.address_size.size == 32 )
> -                ret = switch_compat(d);
>              else
>                  ret = -EINVAL;
>          }
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -985,7 +985,7 @@ static always_inline bool is_control_dom
>  
>  static always_inline bool is_pv_domain(const struct domain *d)
>  {
> -    return IS_ENABLED(CONFIG_PV) &&
> +    return IS_ENABLED(CONFIG_X86) &&
>          evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
>  }
>  
> @@ -1011,7 +1011,7 @@ static always_inline bool is_pv_32bit_vc
>  
>  static always_inline bool is_pv_64bit_domain(const struct domain *d)
>  {
> -    if ( !is_pv_domain(d) )
> +    if ( !IS_ENABLED(CONFIG_PV) || !is_pv_domain(d) )
>          return false;

I think overall is confusing to have a domain that returns true for
is_pv_domain but false for both is_pv_{64,32}bit_domain checks.

I know those are only the system domains, but it feels confusing and
could cause mistakes in the future IMO, as then we would have to
carefully think where to use ( is_pv_64bit_domain(d)
|| is_pv_32bit_domain(d) ) vs just using is_pv_domain(d), or
IS_ENABLED(CONFIG_PV) && is_pv_domain(d)

Thanks, Roger.

