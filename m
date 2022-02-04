Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6504A9843
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 12:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265401.458767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwXh-0002Pv-El; Fri, 04 Feb 2022 11:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265401.458767; Fri, 04 Feb 2022 11:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwXh-0002NZ-B2; Fri, 04 Feb 2022 11:14:17 +0000
Received: by outflank-mailman (input) for mailman id 265401;
 Fri, 04 Feb 2022 11:14:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=46ws=ST=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFwXf-0002NT-5R
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 11:14:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93080d86-85ab-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 12:14:11 +0100 (CET)
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
X-Inumbo-ID: 93080d86-85ab-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643973251;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZGCfVPt2AFz0LLCJClX+I7V5KzaAatWi/C7jDa91Gok=;
  b=MTdF1Si90Ql3dL+hH00LRnpDMg+Ge0a7NdaMbGgbBIKTxZftimcUs0MW
   B5GdPKFCPObTuxO80QfD0S+OkpXnmAfA5tS9DFVUFlOMLpYUGnBbM1sw9
   8j4e+eDfyjM4tVP4SnVPqHGZMbPoLLy+V3MzRGvSC9ay8Bujs+Lo4OKUl
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UyWjaO6sFXOeqdAduZltg+W+Brk5AEfeRDBSgD7mW6PCF/Po197fc/HIgFSUFWr5TDAbmbmPtU
 4A4LVOvhdyD8FwErgRhROFG5AkZmH2KYHU6u7aFAKYLJOJpqAlWkl0rzk9oDIAmT1OyXn7+c7G
 qT/Vpcav6RQA6HSVSSa7prU6xu0yV21Ja5pVYEQfJcdWpWiKxVFocDWkOTkrvHCQU8oNvH7CFU
 B6npd/Jo8pV2Lc2A4+Qc7voR+0hGclw1n8FYkQjUBzDpjxzkEb0lEn9Pkh9XpreG9r2ApwJYES
 7najkuVDGSoguvxyZ6X6+cKG
X-SBRS: 5.1
X-MesageID: 63493074
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AMsLhqBN+g0MIRVW/wvlw5YqxClBgxIJ4kV8jS/XYbTApD0qhjdTn
 TBOWD+POfmDYGbxe41ybI2w8UgE75SEn99rQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970U47wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/iCTUx897+
 Pp0kLu9RikvMKDKu+EBTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHf6WtIQAg2tYasZmGfzbY
 /QfdDRWTDvOXRhINQcpFpgcg7L97pX4W2IB8w/EzUYt2EDLxRF1+KjgNpzSYNPibexPgkudk
 UfX8G34Dw8yOcSWzHyO9XfEruXChz/hUYQeUrix7Od3gUa7z3YWThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYGUtpNF6sh6QeCyoLd+QPfDW8BJhZ/b9ghuN4zVCYd/
 FaDlNP0BhRiqLSQD3ma89+8ije/OjMcK2MYUgYCQREY+NnooIw1jRXnQ85qFei+ididMTP6z
 i2OrSM+r64OlsNN3KK+lXjFnjatq57hXgMzoALNUQqNyQd0Z5WsYYCy3mTK9vZLLIufTV6ps
 WANno6V6+VmJYqWiCWHTeEJHbeoz/WIKjvRhRhoBZZJyti20yf9J8YKumg4fRo3dJZfEdP0X
 KPNkQBAucdMNkuFVIpQbo2fDcony4vlCcuwA5g4ceFySpR2cQaG+gRnakiRw33hnSAQrE0vB
 XuIWZ3yVChHUMyL2BLzHr5AiuFzmkjS0EuOHciT8vix7VaJiJd5o58hOUDGUO025bjsTO79o
 4cGbJviJ/myvYTDjsjrHWw7cAhiwZsTX8meRylrmgireFEO9IYJUKe5/F/ZU9Y595m5b8+Rl
 p1HZmdWyUDkmVrMIhiQZ3ZoZdvHBMgj9iJgYHJxbA33gBDPhLpDCo9FLPPbmpF8rIReIQNcF
 aFZK61s/NwTItg4x9jtRcak99EzHPharQmPIzCkcFACk21IHGT0FivfVlK3rkEmV3Pv3eNn+
 uHI/l6LEPIrGlU5ZO6LOa3H8r9ElSVE8A6EdxCTeYc7lYSF2NUCFhEdeddscpxVdEWemmDHv
 +tUaD9BzdTwT0YO2IChrYiPrpuzEvs4GUxfHmLB6q2xOzWc9W2mqbKsms7RFdwEfG+rqqike
 8tPyPTwbK8OkFpQ6tIuGLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeZeeDNvT6HQNDPwEidOmCi60Zw2GA8fQvLUzmzyZr577bA15KNhyBhXUFfrt4OY8o2
 8k7v8sS51DtgxYmKI/e3CtV636NPjoLVKB+7sMWB4riiwwKzFBeYMODVn+qsc/XM9gVaxskO
 D6ZgqbGlo9w/EuafiphD2XJ0MpcmY8K5EJAwmgdKgnbgdHCnPI2gkFcqGxlUgRPwxxb+OtvI
 Ww3ZVZtLKCD8jo01shOW2egR1NICBGDoxGjzlIIkCvSTlWyV3yLJ2o4YL7f8Ecc+mNaXz5a4
 LDHlzq1DWe0JJn8jnkoREpoi/3/VtggpATNlfeuE9mBA5RnMyHuhbWjZDZQphbqaS/raJYre
 QW+ED5MVJDG
IronPort-HdrOrdr: A9a23:q0JI5KhF9u5klKg9OfaxHCqQE3BQXi8ji2hC6mlwRA09TyXBrb
 HIoB1p726TtN9xYgBbpTnuAtjifZqxz/FICMwqTNOftWrdyRaVxeNZnOnfKlTbckWUnIMw6U
 4jSdkaNDSaNykFsS+O2mmF+qEboeVvnprHuQ6U9QYVcegjUdAZ0y5JTj+BFEt4XQ9HAod8Oq
 a9y6N81kWdUEVSV9+8AHYdWejFupnsr7LJJTA7JzNP0njzsduPgISKYiRw8C1uKA9y/Q==
X-IronPort-AV: E=Sophos;i="5.88,342,1635220800"; 
   d="scan'208";a="63493074"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBxjofkC8OmiDahhuVp/OFYJDZVa0k6iGDmkgqJeMT1cKVhDCue1q8cDOo5d3BTVbyEzJZngXLuwAfrFJwj3PzFBwPwbIHHIHjhRCv55eATmRj2xWEVFc1LxT54iajHpMUNYvw9exCX4IyFoC/ZZ9OLDiNPdbnpI6JYU08EBcXflVN6e6wgnjiwtbQVKOWkByeX870WF+0Apu5qUMGjWnhIQgNL4ffeoiQGKsFguUenPxnKddQcSihjFQ31KAMyojReZKjZdIQN3HXauBURdmToVRWKTt9PJIMMqlMBHnL6QVCSABbii77AbX4tIHhCfSc6134yBxF5IDhpiS2jsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xdNYezEZ3ZYqc8knLkXt2lQHsUTsGpM53PxmvAtwck=;
 b=DsJGATfSJDUpUsishGfcGljMsoXkFVPLrwLVjvoD4EAF4OR30xPgIP7AB1AOcAq6uZT9Ad9DRWHklFy9SMTfsPd/xOQqz+pl/y61i9oa5KSOlvWy+640OGmkOKqXgoQuqhMMOVPacEp/pDpS2+/TDVQ2+r6KGT0LgbX1dozIw8uXnnTsaah5XHkxkGLBrWDvx3FKItEAwcSeRNWD/SrSVpBwMVgxS4Ik57QR/sVp8eqQG/4Pa3l1HaAlkIHKOb7A2FpY/ZifMqezOcysEDwgW8MHwTdKksx66/UN5dkTEPOYW0DgMtWwy8qn98bAQMEygNYs5s5pYgp5BoWrBN9gjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xdNYezEZ3ZYqc8knLkXt2lQHsUTsGpM53PxmvAtwck=;
 b=tq8nkRtP+pTv2j6TGPK5fmEP8TLqPjH7UY7qCSzuVfFz7ZQE3pjtXFQc6oz56SGva7+1FVA6SPxfSUtLt82xw2L3MNsnXxe1UTmhjXDUVmVO3xv0Ub3rwSy6GhwEIjDAbXixqPHVxudAF0S9N7h+K8eeExzCRHsZNvHVnF7bQGs=
Date: Fri, 4 Feb 2022 12:13:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"george.dunlap@citrix.com" <george.dunlap@citrix.com>, "paul@xen.org"
	<paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Message-ID: <Yf0KcVD8W05A4fbB@Air-de-Roger>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
X-ClientProxiedBy: LO2P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83861945-a761-4c30-ddd5-08d9e7cf7061
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6272:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB62724AF13ABC820F5A3E71368F299@SJ0PR03MB6272.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O97gpHZjvCkmdbAhUwXZBRB64uDhkCsiQfl+viAfIhDveSws/XRdHIG5V/jT3xiRGzl+3N+wJEJHgRkmgm2OHhewMi97mBBWq0iQl/NS624W6uqwabCxb0eK0AE4EA0nmfkcRYGAqUfu1INAlNqV86ER8pVOE3NzlPk/lYL87FK1+t7jdPUnI6UrukY/FZL3DnTxBJ/GOAlesqys1MgXAomCilVm49TbYyjEoVv+OJ2XB+nZJ4CG/6xq6FbwST6XtdQqNdlJoSnmBhV05vKLsSH2u+td52446PZCqh5NMDB2yom53IDWnd3jgnoS/QrEKJ+QG0B7l0GO/WLl4aCD7YJSrLC3AVHdsXG57IjNtF77xku5GmZ4Rdff3EfpWOhdIzm33yigTKCodvG9W4nf43tuwScQOW3vQ2D1eTRGUxrj4tQHw/5Pnr8V2fdXwWd4sS38BP7fDo2nH71BlxvAHScj+ZrFEmenUXhnxsXjX5Vmts8k9kwFvkG/7dOR06464WRelp1ZmsD/7Cn6/u1ri38PeH/OFBGsY1dsl1YdhDN/n9ZzxNt8z7SBNJetwSLf7Dz7oI1cHt3MjaxPbm9Ztf15Lyk0GFR4tLHIdQs2nX111YdTrMJS+LxTxL2jV6RRHUNhxQV/I3WMnq8veqD28A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(6486002)(83380400001)(26005)(54906003)(186003)(6916009)(6506007)(8676002)(8936002)(66476007)(4326008)(66556008)(66946007)(508600001)(6666004)(82960400001)(316002)(2906002)(6512007)(85182001)(9686003)(38100700002)(5660300002)(53546011)(7416002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2hDSkhSbEN6ZERiS2R0KzZBSnRQcnE4bTRtVzF6UWVzUFdnVnM4ZzdlbW1C?=
 =?utf-8?B?eW9DbFlwZTdRRE13RHBXeWpwbFduNDZEOWRLN0pnZEtoZXpTUnVEdThxZ1cy?=
 =?utf-8?B?Zk5NTWFxZUxBVmtqdTFyREtuanEzdmdXNU1DaEd3aVFWZTlGMWJjNGZIUTJz?=
 =?utf-8?B?NFA0ZXB0YWE0WGxDdERRTTFmRmM2UCt0YkRPNmpJcVJkTUYzMlR3c0tpWUxP?=
 =?utf-8?B?VXAwUG9BSEYzOFI5SThwVlRqSGhwdkZMdU9HM2lDV2tQQ1RHcU9seFlsSDBh?=
 =?utf-8?B?K0E2ekJId2NQZG52VWpuQmFuekFlZkhENmZaeXZVZHJsWUdWb1lUN3RwbXA3?=
 =?utf-8?B?NjVFeG1Ua3BSVUl6WVN0a2twQTg0UFdDVGh2Tm5SZHlwRkVMUm1BbklNTU5s?=
 =?utf-8?B?N0NFbkRYNGtJS2lwUzQwcXdGYzdxOGliRDBxZmlheU13SEN6L01nYVpiVFRm?=
 =?utf-8?B?NndoRnU4Vk44SkphQTdzanhIQjQ3SHhoWVRVTFJwcUlrbUVCY2JjRi9EL2tp?=
 =?utf-8?B?cWZwNXJpNmo1dXo1em9ZaXZoYXV4cm45bHd5R01SNEptVE9PRWNMaDArbjJY?=
 =?utf-8?B?cUtjbGRKd1BZcGlkTEwwRXFYYUxLaFVKbXNtckcvbXpiWlJSWWIvdERrTlZO?=
 =?utf-8?B?dE0rbnNrS1p0QjBFakpHeU00ZjhDQUpoeHhOWHFVUlplV21SM3FjVDVvcDRQ?=
 =?utf-8?B?bitCZWpuVEhhWXo3bXBkQStpbmRkaDFFVGIwYjhXU0FhM2FDQTMwQ2RmRXo0?=
 =?utf-8?B?UFN1ZVYzOE5NcHhpWllTNkwvTmptUXZwakczNFNSa0VMTDJhZmpoejc0anhs?=
 =?utf-8?B?MVZqdWFvU21UdUxwMWRxazBsT1FPaEZ2VmFycVRhK2tRVWZKZkxzMk5mVzFH?=
 =?utf-8?B?Z2hOMXh0eEU5T3NLeks3WXRFK01PSk9oU010SFBQeUdtemNiOGJCU2MvYkpP?=
 =?utf-8?B?QXBiN0RQMitueHg3bUtZR1VDWGtyTFhpZEZBVWN3azN2eGowMkZEN0prTy9T?=
 =?utf-8?B?RGE2S0Q2QWVuV1djb0pEZW00WkFMQmhTV2Q2Z0FwOTlQcUdGKzhMOS90NEp0?=
 =?utf-8?B?QU5lRktYT3UyK3NwRFpaVDhmaC9hMjlrTjBGU0E0ZFFBb0hxVjdiWTVqeFpz?=
 =?utf-8?B?Ym9JU2FFNnJNZ0VsMVpiamU5Y0t5LzFjbTZzZVZpNnZoTFQvQm1ITFJEaXRo?=
 =?utf-8?B?SHpVK0FDaExEWDF3QWpJZXMxemdrcllieEZrTUIzNWhESldlWnJ3SmZXY1Zz?=
 =?utf-8?B?dHZyRURDVkxqZWNyUlBIZGcrUlFhR21qSVVIY2QvcTJQQlc4V0d6bi9rZXhn?=
 =?utf-8?B?bUFMVXFFSVNFSDJGZTQwSkREUndUKzVzWlhkSFNyay9IdkI1U0RhTWVNZzFR?=
 =?utf-8?B?TFdVWkFnNmh0WWpUUCt1QlByd0tha1lPSHcvMEJoeWR3ZGFyL3lDN1VIT1Zr?=
 =?utf-8?B?WWp6SUtKSDJaT3ZLd0lWUlFpMmhUU0ZrM0RScTFFRHN3RWhpZmJLQnRlS2Yy?=
 =?utf-8?B?Yk5HRTJSTnduZVVjKzkyaUptYXhpS0xUTGFtajB4L0FBZjdVRWlVd3JveUYy?=
 =?utf-8?B?Y2xHRkQybDFYMTh4ZTFLUFVWdjVUREhLeW9GOEpBTlBXN0w1bkttMTdMWUtW?=
 =?utf-8?B?WWEycllWMk8yZ1grYTJaOStYOVhHbUgycjJhamJpcWVZaER4cUNyUHl0Wlh0?=
 =?utf-8?B?eURUMWF2T3ZwU1NHR1pDcHluUUk2cVA1emdUQXpyVnpwZWFSTVNKTWkvTUJy?=
 =?utf-8?B?Mjc0Znowd2lGTWROb2ROUmZtYlgrc3NKYjcxaHNseFNhRVFLMENYbUJpTnBm?=
 =?utf-8?B?dTloNEN4TWNGVitNL1RXQ2tsNkVCRGxibi9yd0g2S3RwcGJwdndrZ3JjMjU4?=
 =?utf-8?B?RHRCWUFOMVBOaGhpT2tSZTlzU0VFRU4zdDFSeTZSR0NiOGNVdS9xU2lha1Zs?=
 =?utf-8?B?cTRoRHduTlF5ZVp4TFpmM2VUK2YzdytFRnMxQVI4Z2Z3UTh1bUdObHQvenBS?=
 =?utf-8?B?R25CaHRtUHVkNGxrZXA1Yk41a01tYXJXbmxCZlBLL0xUZmNCL01XVjZ2R0hv?=
 =?utf-8?B?bVJWVVZCcE9GK0s1UU1mOFhGY1lqbTVVZTJTMWtNWGlvaWpkNVJWeWg1Vzky?=
 =?utf-8?B?YWtyQlFGekNRR2J2UGJyVkFLM0wycVhUSHFiTGk0TmJ2MTBkemtkQUluQWtp?=
 =?utf-8?Q?TNdffhrvQ94oSYwtfQcuFoE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83861945-a761-4c30-ddd5-08d9e7cf7061
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 11:13:58.0750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saTziUUQwgvqxZ22H4dLHB8RKopiNBFfWeXB6LV+r5hYAHQPSHwbiWtu0xxMi8OkZHKHUUPrOXWejVzzJ45nTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6272
X-OriginatorOrg: citrix.com

On Fri, Feb 04, 2022 at 11:49:18AM +0100, Jan Beulich wrote:
> On 04.02.2022 11:12, Oleksandr Andrushchenko wrote:
> > On 04.02.22 11:15, Jan Beulich wrote:
> >> On 04.02.2022 09:58, Oleksandr Andrushchenko wrote:
> >>> On 04.02.22 09:52, Jan Beulich wrote:
> >>>> On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> >>>>> @@ -285,6 +286,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>                    continue;
> >>>>>            }
> >>>>>    
> >>>>> +        spin_lock(&tmp->vpci_lock);
> >>>>> +        if ( !tmp->vpci )
> >>>>> +        {
> >>>>> +            spin_unlock(&tmp->vpci_lock);
> >>>>> +            continue;
> >>>>> +        }
> >>>>>            for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
> >>>>>            {
> >>>>>                const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> >>>>> @@ -303,12 +310,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> >>>>>                rc = rangeset_remove_range(mem, start, end);
> >>>>>                if ( rc )
> >>>>>                {
> >>>>> +                spin_unlock(&tmp->vpci_lock);
> >>>>>                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> >>>>>                           start, end, rc);
> >>>>>                    rangeset_destroy(mem);
> >>>>>                    return rc;
> >>>>>                }
> >>>>>            }
> >>>>> +        spin_unlock(&tmp->vpci_lock);
> >>>>>        }
> >>>> At the first glance this simply looks like another unjustified (in the
> >>>> description) change, as you're not converting anything here but you
> >>>> actually add locking (and I realize this was there before, so I'm sorry
> >>>> for not pointing this out earlier).
> >>> Well, I thought that the description already has "...the lock can be
> >>> used (and in a few cases is used right away) to check whether vpci
> >>> is present" and this is enough for such uses as here.
> >>>>    But then I wonder whether you
> >>>> actually tested this, since I can't help getting the impression that
> >>>> you're introducing a live-lock: The function is called from cmd_write()
> >>>> and rom_write(), which in turn are called out of vpci_write(). Yet that
> >>>> function already holds the lock, and the lock is not (currently)
> >>>> recursive. (For the 3rd caller of the function - init_bars() - otoh
> >>>> the locking looks to be entirely unnecessary.)
> >>> Well, you are correct: if tmp != pdev then it is correct to acquire
> >>> the lock. But if tmp == pdev and rom_only == true
> >>> then we'll deadlock.
> >>>
> >>> It seems we need to have the locking conditional, e.g. only lock
> >>> if tmp != pdev
> >> Which will address the live-lock, but introduce ABBA deadlock potential
> >> between the two locks.
> > I am not sure I can suggest a better solution here
> > @Roger, @Jan, could you please help here?
> 
> Well, first of all I'd like to mention that while it may have been okay to
> not hold pcidevs_lock here for Dom0, it surely needs acquiring when dealing
> with DomU-s' lists of PCI devices. The requirement really applies to the
> other use of for_each_pdev() as well (in vpci_dump_msi()), except that
> there it probably wants to be a try-lock.
> 
> Next I'd like to point out that here we have the still pending issue of
> how to deal with hidden devices, which Dom0 can access. See my RFC patch
> "vPCI: account for hidden devices in modify_bars()". Whatever the solution
> here, I think it wants to at least account for the extra need there.

Yes, sorry, I should take care of that.

> Now it is quite clear that pcidevs_lock isn't going to help with avoiding
> the deadlock, as it's imo not an option at all to acquire that lock
> everywhere else you access ->vpci (or else the vpci lock itself would be
> pointless). But a per-domain auxiliary r/w lock may help: Other paths
> would acquire it in read mode, and here you'd acquire it in write mode (in
> the former case around the vpci lock, while in the latter case there may
> then not be any need to acquire the individual vpci locks at all). FTAOD:
> I haven't fully thought through all implications (and hence whether this is
> viable in the first place); I expect you will, documenting what you've
> found in the resulting patch description. Of course the double lock
> acquire/release would then likely want hiding in helper functions.

I've been also thinking about this, and whether it's really worth to
have a per-device lock rather than a per-domain one that protects all
vpci regions of the devices assigned to the domain.

The OS is likely to serialize accesses to the PCI config space anyway,
and the only place I could see a benefit of having per-device locks is
in the handling of MSI-X tables, as the handling of the mask bit is
likely very performance sensitive, so adding a per-domain lock there
could be a bottleneck.

We could alternatively do a per-domain rwlock for vpci and special case
the MSI-X area to also have a per-device specific lock. At which point
it becomes fairly similar to what you propose.

Thanks, Roger.

