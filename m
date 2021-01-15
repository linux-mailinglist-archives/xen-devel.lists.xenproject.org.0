Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B702F85D3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 20:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68593.122786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0VDh-0007Aa-SN; Fri, 15 Jan 2021 19:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68593.122786; Fri, 15 Jan 2021 19:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0VDh-0007AA-NZ; Fri, 15 Jan 2021 19:57:17 +0000
Received: by outflank-mailman (input) for mailman id 68593;
 Fri, 15 Jan 2021 19:57:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qc3b=GS=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1l0VDg-0007A5-NB
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 19:57:16 +0000
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79d2c35c-e484-49fa-9d8d-0312e6416c0f;
 Fri, 15 Jan 2021 19:57:15 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJe24k043750;
 Fri, 15 Jan 2021 19:57:09 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 360kd06hq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:57:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10FJetp7031368;
 Fri, 15 Jan 2021 19:57:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 360kfbghtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 19:57:08 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10FJv5Fw026282;
 Fri, 15 Jan 2021 19:57:05 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 15 Jan 2021 11:57:05 -0800
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id 08A1A6A00D6; Fri, 15 Jan 2021 14:57:11 -0500 (EST)
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
X-Inumbo-ID: 79d2c35c-e484-49fa-9d8d-0312e6416c0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to : content-transfer-encoding; s=corp-2020-01-29;
 bh=642y8cCXqUc1lKVmGkB7r+U2xJF+UWvBlxcj0D+XsOU=;
 b=tIsaxkB/4Umm1q5KlMt84fpzUJwNsTkQqNwzq1hBoSTn4oH26vYQ1m4dkTMcf5Yoo5s+
 2Sr89bACuODrV2Jou6TKnvRI9Prr/1TPXU+2E/ysGCxp9DlGKPjGSTiQsEooNVkagRzT
 TgMdVSixyMjufsRhUZ/bjZ4VSPWHsFvo8WR4e43gJ2rD6CP+IW6+TsBmf6AgaZVqfWg3
 EeTn8okFlh8hVy1X8IOjyVdk2OQL8zhKy0giiqPhR0zFiSQYoSklew3tA5VxVA9RePN/
 JfBHkx7TYs85sbwKtg4BVFzYrnIrQIl+C76R/cDBIVL0nsaxuFPAIhbmgh8t4N7AmYHJ qg== 
Date: Fri, 15 Jan 2021 14:57:11 -0500
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
        Julien Grall <jgrall@amazon.com>,
        Ross Lagerwall <ross.lagerwall@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: livepatch: Include xen/mm.h rather than asm/mm.h
Message-ID: <20210115195710.GB23704@char.us.oracle.com>
References: <20210115192947.6499-1-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210115192947.6499-1-julien@xen.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9865 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150119

On Fri, Jan 15, 2021 at 07:29:47PM +0000, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> Livepatch fails to build on Arm after commit ced9795c6cb4 "mm: split
> out mfn_t / gfn_t / pfn_t definitions and helpers":
>=20
> In file included from livepatch.c:13:0:
> /oss/xen/xen/include/asm/mm.h:32:28: error: field =E2=80=98list=E2=80=99=
 has incomplete type
>      struct page_list_entry list;
>                             ^~~~
> /oss/xen/xen/include/asm/mm.h:53:43: error: =E2=80=98MAX_ORDER=E2=80=99=
 undeclared here (not in a function); did you mean =E2=80=98PFN_ORDER=E2=80=
=99?
>                  unsigned long first_dirty:MAX_ORDER + 1;
>                                            ^~~~~~~~~
>                                            PFN_ORDER
> /oss/xen/xen/include/asm/mm.h:53:31: error: bit-field =E2=80=98first_di=
rty=E2=80=99 width not an integer constant
>                  unsigned long first_dirty:MAX_ORDER + 1;
>                                ^~~~~~~~~~~
>=20
> This is happening because asm/mm.h is included directly by livepatch.c.
> Yet it depends on xen/mm.h to be included first so MAX_ORDER is defined=
.
>=20
> Resolve the build failure by including xen/mm.h rather than asm/mm.h.
>=20
> Fixes: ced9795c6cb4 ("mm: split out mfn_t / gfn_t / pfn_t definitions a=
nd helpers")
Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Thank you!
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/livepatch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
> index 915e9d926a11..75e8adcfd6a1 100644
> --- a/xen/arch/arm/livepatch.c
> +++ b/xen/arch/arm/livepatch.c
> @@ -6,11 +6,11 @@
>  #include <xen/lib.h>
>  #include <xen/livepatch_elf.h>
>  #include <xen/livepatch.h>
> +#include <xen/mm.h>
>  #include <xen/vmap.h>
> =20
>  #include <asm/cpufeature.h>
>  #include <asm/livepatch.h>
> -#include <asm/mm.h>
> =20
>  /* Override macros from asm/page.h to make them work with mfn_t */
>  #undef virt_to_mfn
> --=20
> 2.17.1
>=20

