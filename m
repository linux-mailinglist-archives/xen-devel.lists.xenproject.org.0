Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE91362390
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 17:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111853.213881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQ8b-0003lp-T4; Fri, 16 Apr 2021 15:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111853.213881; Fri, 16 Apr 2021 15:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQ8b-0003lT-Pg; Fri, 16 Apr 2021 15:12:05 +0000
Received: by outflank-mailman (input) for mailman id 111853;
 Fri, 16 Apr 2021 15:12:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kml=JN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lXQ8Z-0003lO-NM
 for xen-devel@lists.xen.org; Fri, 16 Apr 2021 15:12:04 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1fea41d-7179-4b55-b4f6-f59219e7fdd0;
 Fri, 16 Apr 2021 15:12:02 +0000 (UTC)
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
X-Inumbo-ID: a1fea41d-7179-4b55-b4f6-f59219e7fdd0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618585922;
  h=subject:to:references:from:message-id:date:in-reply-to:
   mime-version;
  bh=kSNEGdVM3ieUEZml9qQNX9aIqxX6E4vvHZoyPh0hJ/c=;
  b=ZbaPG1FtOm2cVPkeUcAw1BU53gD6P6cxG+Hv92LLMMx9iVnSkcVlq6ny
   Ysl8G9TSsFZeiQgyMkXeqTu798tVk2g1SeudsxBG+gm8f1DJQaRHR1308
   4RsSwtHyZNFNnYqawt9mRZpbBOGqIwHBDTgIej33xvRE7Ee86fmJ4MoDz
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5+ac5G0MjFHFuc+soWDQmrr9avdV9LvjyMGnz/vDi7LS9GRma1UUL+lLdA2P7TlwydRXh1fnUM
 InmORrNl1eTa+vIfRTGl+TP5OQGlv70XznWB0uHmkRvAGmVpiFU5dwEGneTXODErrp4Lcfvtq4
 s46mTdE/FQeHuNy3vaA3Q8gY+EOgVmN/POyjU95m9VoOa6SV6BFjiWs/uv9w8kPeWRI9Tc2J9R
 egRbVo2rLEkE16LHhG905ryRp3w7W0fzATaIuuVlmw4psEBN9I5jipVxTokqNqzapGypnah+Kz
 K60=
X-SBRS: 5.2
X-MesageID: 41771429
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:h3+NdaxFXabKVmFFnURsKrPx9uskLtp033Aq2lEZdDV8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPsfVr385lp7Y4NeYqzRQWOghrMEKhOz6vHhwfhFSr36/JH2c
 5bGZRWJdXsATFB4vrSzxK/F78bruWv1ICNqaPgw2x2TQdsApsQjTtRLgqACEV5SE1nKPMCdK
 a03cZMqzq+dXl/VK3SakUtZOTfu8bN0KvvfB9uPXUawTOThjCl4qOSKWn64j4iVVp0oIsKwC
 z+vCHSoo6itPy6zRG07R6o071m3OHP5/EGKMiFis0+IijhhACydO1aKsC/lQFwms6DwhIHl8
 TNvgcBMq1Img/sV1DwmzTB8U3B1ysj8HDrw1PwuwqdneXJAAgUJuAEoKAxSGq812MQ+OtS/Y
 gO4kei871QNh/ElDSV3amxazha0nCajFBnrfQelBVkIOwjQY4Ul6Mz1mVPHqwNGSrrgbpXa9
 VGPYXn6PFafUjyVQG+gkBfhNilXnEEFhybWEQ1usuMzzhMnHxipnFovfAiog==
X-IronPort-AV: E=Sophos;i="5.82,226,1613451600"; 
   d="scan'208,217";a="41771429"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RR85N4wQfMz5b05TdS8i+ymT8heTaiZtlTtUzFMPWSH+C/84B/iDfrsH2DWJTOz4jyA3C6S5ERFe5/Cgzht5g7+238kl24QCtgBwV3siIGF6/g+J+d6E+b+cwK4Axd7zRpsnQ7t1+lcK8h3M5IrxtZtQZ/sbRbz2Uw+jm/KuxI4KVTGciMqqiTcQcWg5V+uBRGzPskwAXEzbbLigeJpZRlOVJfbtZaoOwdVff3OEMTOtvUkKmTy9gtsAMMTSqiz91VAUDakqDWkB2iV+n3m7+5TbO96KpbZMp3NbeMt8ydeh/zqtXpruM++FBuSgqhGCN8+YDGnf82142KZibVVN+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWWL7CR8EoXv923pllvuDqD9L8dNPnts1UxMNYePXE0=;
 b=CGzyA+85s9dpgao6a7d3Ia+WC5cimiEzejCFsZ3h8hYcYrigtvLXGCTX7/khjqy7PeUWNyty4xvDKC0K47Gn3gUeXMVQo+tKRRYI0zIpmupnUJm1WTYZN1oyywjMr3RKPPThXxf8o7ik67gZUwDKrmm2VLPaCOY96ejofHuG1O+iTW3nsWgDYS+N4MxjDEHFLwnLiSTZjDPFFQ7zH3S7XTgAfDPmUGw/yLQqJ0wOFI97QAuzK4j9ZCc0sPGcrMWHNO14nQ/ftVHa0Lnta731rVl1grmPI8MzTun6YRjulhEMqZMdD+cG1u7CCOkkB2ObJFHkr0coaNvFDoLjRNtjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWWL7CR8EoXv923pllvuDqD9L8dNPnts1UxMNYePXE0=;
 b=saD4LoeLtl/xP1qpoXMdBzQIB3qjfBzvQieqS4BxmmSHe7lMOryUh64Uc9EFGGrGv5rW3mc4uGpKJLL+uuMkUCJ8UZxqwl/lnKeRQJqGLafSjKJpaHrXYP0OzjWlz2lyNITijbYzEMGUpZPSLYfk4OEUr4kCv2M6rIPYTPUZ/ss=
Subject: Re: Memory Layout on Dom0 in PV
To: =?UTF-8?Q?Charles_Gon=c3=a7alves?= <charles.fg@gmail.com>,
	<xen-devel@lists.xen.org>
References: <CAAQRGoBV4noq8n=k0a-h8T0ZFnKUnAQQr-=VywCaXzbWxPsgZg@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <472aeb46-ded9-e5d2-edd8-b680d95d47ae@citrix.com>
Date: Fri, 16 Apr 2021 16:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAAQRGoBV4noq8n=k0a-h8T0ZFnKUnAQQr-=VywCaXzbWxPsgZg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------5E1E09620F961E6385EADD59"
Content-Language: en-GB
X-ClientProxiedBy: LO3P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d22eec6-3ef2-4b24-d50b-08d900e9fade
X-MS-TrafficTypeDiagnostic: BYAPR03MB3672:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3672D146FA7F92B5C3953BB9BA4C9@BYAPR03MB3672.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vaM+dSwjpcnrQzIH1qIQZRslRlW3XAkufoRmAfCDEdbXgwZ8zHO2fCfePmJukvjxwplBKS5/pT4M1hEOAKcR925McVwVbHELgim0HXpHu6yNfhvvHx2aBkSYPaTh7dwpu4XtvGOXAyuVkdvdWqJbOXyLLrYNTpzZ41EXeQD/oz8eT8Sh6VrhHR/2Ab7U70qTsATR9ylVvlgIz5r7C+sJv0iyPrWyCfMyaNntxTr7y108bQRgC0tbvSCVKS1OSqmfZOEiHx8khPdsQqZa8TIZlUK3+1k5S+kPr9c0eWCsaVnkjB83zyA9DRHWR0cPoqqsjZCSUz8+vaqnlO7C6HBsNPk9deQaZYxw6f4hyqbU+hYjp353xMjwMuz2lE5kvyc8rzXYvBbx8S8fJa72Dzja31ZUfcUY2ioFvXujndpy6S6+Ylfyx5cPU2DEMm2dxeBft4DBKjm7zGxEqn2ox7wpMRGesO+1ogslch/cG+4lXIqkzlp1Gm/Jz7r2p4ZdE9bGAZ1PfRp9KaOov2ASfGYNcOvaaevXK2AORegMneoXDG+buOdx6weKH6TPDy/QHCTCrMf94Y9HprAilPK/upazwk+ghQqjgLmpQdjIJqXTjw2NP593F6bMo9+hMVrVYWHgBW/kIpLG465D65wcBB4irVz5/dFH8m9OMo3n0+LfkSVXBcniHMGnUj/+wKymFGV4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(31696002)(83380400001)(956004)(16576012)(6666004)(66946007)(316002)(86362001)(66476007)(2616005)(66574015)(5660300002)(2906002)(186003)(26005)(16526019)(31686004)(478600001)(66556008)(38100700002)(36756003)(8676002)(8936002)(33964004)(53546011)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YVhRMTVFMXRJRC85S3hXd2J6SmtZNHpxU1QyNElRNWd6MUlTT2VOMnJxMEVu?=
 =?utf-8?B?NGRDWVN2Y2EvendWYXdaMHJGa0puOGZ3b2ZWUTlHRTVodWtEbzN4VlBtSFpu?=
 =?utf-8?B?YVJMaEcxa2FhQ0h5WFFoR2NSZDFDWEd1S3dpZXQ1cjZ1OGxxUGVYY0Y4em8w?=
 =?utf-8?B?LzdxZ2pvQ3RLdGZMYnNqRDhLd0MwZmp6ejZta21uOThiaGFuT0NteURlSkxw?=
 =?utf-8?B?TGlSZU44RjZhV08wNC81a0U1U0FHYUhZTFpPWkpZaHJUaGU5QlpMUFlLQi9s?=
 =?utf-8?B?aktpT2tqWVhBdDQ3RkdIdUlvbzJDYVdSdUpDM1JaODQ2NTE4Skc0VGo2ejIv?=
 =?utf-8?B?MUtlckpOSFByNDZaR0JwalpKVkRzZFNaVVZPQUk2RlJaL0pYZXk0dXQ0MGg3?=
 =?utf-8?B?aFdSOCsrWitvMmxkN3ppQmZiWUswanhiMmlaaHZ1dnFtUHNTVlB1MW5nR21y?=
 =?utf-8?B?emtTVnY1dVI2cVVpWnR3bXQzY3h0SHc1dm8xRkpQTmVEZ0ZENDJuUUZ6SUNy?=
 =?utf-8?B?TzlMWWEwOENkbk1lZ3dIMUx3TVZqaUxsOTZtNFdkMithOSsyMnMvR1R5UHc4?=
 =?utf-8?B?Q2M0RkJsTGptNE5PUXovbThkMFNmVXU0ZDNZYmZWSm5tU0xiWmlvUnUwaDVp?=
 =?utf-8?B?WHBxZ0I1NExYREp4TTdsREk3eG5VVlZXZkthUlpqNFBreWZBMVBTZDlZWlVw?=
 =?utf-8?B?TUhZMDF6cmhvdEY2QjhXTitWcVdIY282YmVZTDZWTzRMeXNDazFsN2VsVmw2?=
 =?utf-8?B?YUppQmRYUkhGazBwcXNRQmEyQy8wQzhPZVYyWmJqS3lpR0dkdkxlSGdJWW4v?=
 =?utf-8?B?L1RDZ3lqVTRrZGdmdjVqeFN4QVFxWHdEU0hxMjRncHEyR09PdG1PZjlLOTY1?=
 =?utf-8?B?UUx5dmZnb0Q4TEI0SlpxNDVvK1hlZEI0NWc0b3BndnoxaThDR0pzYURPZ01j?=
 =?utf-8?B?ZkRYRllkVy9MQ2tybU1xS0t4SHdnM2ZDZ0E4SHRRdUUyTDZ3elVXaWFDMnh2?=
 =?utf-8?B?ZE52OWM5QzBMYUtpSGdGcnlvR1ZrNEdnejd4L3o4RFFXSDY2UG1kMnlwaDR6?=
 =?utf-8?B?UU1PaGhFVFBjZURJUGU5aGlIZGFNS2svMWtUcFNKK2Uxd0hMT2ZmeTBwZWlR?=
 =?utf-8?B?TzRHdHU4amRiNTFVSHlaZEdJbFF0dkU1Y3ppTUhvY0hrVmpVZEhnbUVSTFUv?=
 =?utf-8?B?eVJLUS95MUZ1TFRiWHByY3JIa1dVZTFKcHBxc2tQTU5kRmZLclE0Mm1EYkRT?=
 =?utf-8?B?SG1MVDA2cjJ1RFF6cmhzd0M0K0JkaXNCeEpxRUdlWFczcjIwOStGVTAyZHZY?=
 =?utf-8?B?N0VISE9uNFF0dnlIM0gySE0vS0pkMk9sQ3JJbmJOenlRc01vTnozM0ppeEZK?=
 =?utf-8?B?NlN5Z3ZYZTRzWDRCa3lGQkppYjg3U0lhY2lFaWpKVm1CNlNOdzlxdWhJZEUy?=
 =?utf-8?B?M1lIYWNuNndvbzdwdFdDVmNzbHRrZGZJVU0zQUJrWDBYS1lMZ3RMU0VBZmp3?=
 =?utf-8?B?a3BUZVZ1azlNL3p6cDRvYmVEY1NDWW40K1BlZUtCR3Qwam5TUlVvTm5lUDlC?=
 =?utf-8?B?cUlUWmhrQmFZNzhoeXRHYWY2MUdJczYwQm5Nc2xOdFJaM0RIMkpKa2t1c2Z6?=
 =?utf-8?B?cXJjSTFuQ2lCbG1LQ1N6YVhOdVRyUHlMaWQwSzBKT0VLdGxVV2pRT01qSkI1?=
 =?utf-8?B?ejgxYkpiMldabHMvQ1hLaDFTMkppTFJ3dUI2TDlMUGxGQmVEdjJsRktJVXJW?=
 =?utf-8?Q?Mt6uJ4fmHATHq/FsfoOP0P481+7Q+4YL7rj48aE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d22eec6-3ef2-4b24-d50b-08d900e9fade
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:11:58.8571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/mAOo3MYuYra4iYm+D4g28NdMqZrT12QK9XuOTuRVGkwJh/k2rvMvNh/5jZlWKY1Sdq00Y82FJ4N0poT2ahf+HpwRljWRGIwYmO9p0cq4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3672
X-OriginatorOrg: citrix.com

--------------5E1E09620F961E6385EADD59
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 16/04/2021 15:58, Charles Gonçalves wrote:
>
> Hello Guys,
>
> Does memory on Dom0 also mapped to gpfn or it is mapped directly to mfn? 
>
>  If mapped to gpfn, how can I access its p2m mapping?
>
> I'm trying to use the xen-mfndump but it is not working with dom0
>
> |./xen-mfndump dump-p2m 0 xc: error: Could not map the shared info
> frame (MFN 0xddfe9) (3 = No such process): Internal error xc: error:
> Could not map domain 0 memory information: Internal error |
>
> The problem that I'm wanting to solve is:
>
> Given a va in a process on dom0, I can get its physical representation
> (mfn or gpfn depending on how this works on PV) using
> |/proc/pid/pagemap| and with this I can access its real mfn.
>
> This works perfectly with domU but not with dom0, why?
>

There are a lot of operations you're not permitted to perform on
yourself, to prevent problems.

I think in this case, Xen is rejecting dom0's attempt to foreign map
itself (although -EINVAL would be better than -ESRCH to fail with, IMO),
because otherwise we get into reference counting issues IIRC.

You'll probably have an easier time asking the dom0 kernel to dump the
p2m.  After all, its a kernel-owned datastructure, not a Xen-owned
structure.

~Andrew

--------------5E1E09620F961E6385EADD59
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 16/04/2021 15:58, Charles Gonçalves
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAAQRGoBV4noq8n=k0a-h8T0ZFnKUnAQQr-=VywCaXzbWxPsgZg@mail.gmail.com">
      
      <div dir="ltr">
        <p>Hello Guys,</p>
        <p>Does memory on Dom0 also mapped to gpfn or it is mapped
          directly to mfn?&nbsp;</p>
        <p>&nbsp;If mapped to gpfn, how can I access its&nbsp;p2m mapping?</p>
        <p>I'm trying to use the xen-mfndump but it is not working with
          dom0</p>
        <pre><code class="gmail-language-c">./xen-mfndump dump-p2m 0                                                                          
xc: error: Could not map the shared info frame (MFN 0xddfe9) (3 = No such process): Internal error
xc: error: Could not map domain 0 memory information: Internal error
</code></pre>
        <p>The problem that I'm wanting to solve is:</p>
        <p>Given a va in a process on dom0, I can get its physical
          representation (mfn or gpfn depending on how this works on PV)
          using <code>/proc/pid/pagemap</code> and with this I can
          access its real mfn.</p>
        <p>This works perfectly with domU but not with dom0, why?</p>
      </div>
    </blockquote>
    <br>
    There are a lot of operations you're not permitted to perform on
    yourself, to prevent problems.<br>
    <br>
    I think in this case, Xen is rejecting dom0's attempt to foreign map
    itself (although -EINVAL would be better than -ESRCH to fail with,
    IMO), because otherwise we get into reference counting issues IIRC.<br>
    <br>
    You'll probably have an easier time asking the dom0 kernel to dump
    the p2m.&nbsp; After all, its a kernel-owned datastructure, not a
    Xen-owned structure.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------5E1E09620F961E6385EADD59--

