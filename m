Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B2A41AF20
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 14:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197989.351264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVCLu-0005XH-DN; Tue, 28 Sep 2021 12:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197989.351264; Tue, 28 Sep 2021 12:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVCLu-0005UL-A3; Tue, 28 Sep 2021 12:36:54 +0000
Received: by outflank-mailman (input) for mailman id 197989;
 Tue, 28 Sep 2021 12:36:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYy3=OS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mVCLt-0005UE-0E
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 12:36:53 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58a6c5fc-84ef-49d0-b521-ac498aea12a7;
 Tue, 28 Sep 2021 12:36:51 +0000 (UTC)
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
X-Inumbo-ID: 58a6c5fc-84ef-49d0-b521-ac498aea12a7
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632832611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dcl3xvtyIEjWZIgMG1eaMInfPCnZCg1zs5WFrkQAlGo=;
  b=cI6XsgUmyuzjJw2AMOdgNBReHO9tOtoPqJTNKp9zkIM5qP7oLZSmAMdI
   yfUqERcSUHsYP8qZq/fhl2R5ycP7L3z89nadkyEf+ZacPPnnNMo48TdMJ
   7GLhQoLVE5wlrSc0lhjCIh59P/cAC9TvuA17a5rkDZVTuhRnuSbukE6GT
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CNImGH9CT0ZjBr4wPVxUaBkR+ZDyBk1Co3nXelbXcP2kW691Fk6eaF6q1+NuEVW0dXKNV1zxMN
 kowoDTSszUG/FJRV9p5L6Fc0B0sZIsPk3pEANQEo+4yDTivM6OthsMd8U0P5K3Y/rCn0q5qZAg
 9wInSwKzY9+TCovSlb4LmDaMANGQ0zZZT9fT+k/SXRT9VkSuUBEwJLfEQezQLWSaWTVg3Vlqiq
 y30UIWRL8NmNmFaeOHFBpG5YIG5wXdZcWvMxLAUbBnJJawEtrgL9qx4JOfwrPtJM1PlkF67+H9
 /RUoHvhgd2eBxTLfaI0sPtK3
X-SBRS: 5.1
X-MesageID: 53819662
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Orbkx6nfsWdocTppWZOLq8zo5gxiIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeD2mFPK6LYzPwKthzOtuw9EgEu5PUmtE1GwRq+Hg1FSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdh09Q42YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 M1vto2BZTcTAoGPlPUDTD1kECJ4JaITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQK2OP
 ptHN2AHgBLoeQRSOmweDpMExOaupFSvYmFAhEDEnP9ii4TU5FMoi+W8WDbPQfSLWsd9jkuev
 njB/WnyHlcdLtP34SWB2mKhgKnIhyyTcIMJHby79/gvjFiS2nYCIAwfU1e2sb+jlyaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe9DW8ynUlPCSuVzAQDFZEHgRM7TKqfPaWxQy9
 FyYrv/ZPwBD87GEV225yrSXqyu9bH19wXA5WQcISg4M4t/GqY41jw7SQtsLLJNZnuEZChmqn
 WnV/XFWa6E7yJ5TjvrnrTgrlhr2/vD0ohgJChI7t45Pxi1+fpLtQ4W15VXB4f9EIe51pXHa5
 yNcyqByAA0UZKxhdRBhos1RQNlFBN7faVUwZGKD+bF6rFxBHFb5IehtDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/O6Soq1DKmOMoMVCnSUSONh1Ho1DaJ39zqx+HXAbIllY
 cvLGSpSJSxy5VtbIMqeGL5GjO5DKtEWzmLPX5HrpylLIpLEDEN5vYwtaQPUBshgtfvsiFyMr
 753apvboz0CAbaWSnSGruYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6el6JtM5z/gLzLegE
 7PUchYw9WcTTEbvcW2iAk2Popu0NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:PZV2Ea8U6qoMJZNhPoduk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.85,329,1624334400"; 
   d="scan'208";a="53819662"
Date: Tue, 28 Sep 2021 13:36:45 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v3] tools/xl: fix autoballoon regex
Message-ID: <YVMMXarcqweUD4sK@perard>
References: <dd3a1e1a7a3f8e7bca18dd4779efbc2af01decc7.1631793876.git.isaikin-dmitry@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dd3a1e1a7a3f8e7bca18dd4779efbc2af01decc7.1631793876.git.isaikin-dmitry@yandex.ru>

On Thu, Sep 16, 2021 at 03:15:21PM +0300, Dmitry Isaykin wrote:
> This regex is used for auto-balloon mode detection based on Xen command line.
> 
> The case of specifying a negative size was handled incorrectly.
> From misc/xen-command-line documentation:
> 
>     dom0_mem (x86)
>     = List of ( min:<sz> | max:<sz> | <sz> )
> 
>     If a size is positive, it represents an absolute value.
>     If a size is negative, it is subtracted from the total available memory.
> 
> Also add support for [tT] granularity suffix.
> Also add support for memory fractions (i.e. '50%' or '1G+25%').
> 
> Signed-off-by: Dmitry Isaykin <isaikin-dmitry@yandex.ru>
> ---
>      ret = regcomp(&regex,
> -                  "(^| )dom0_mem=((|min:|max:)[0-9]+[bBkKmMgG]?,?)+($| )",
> +                  "(^| )dom0_mem=((|min:|max:)(-?[0-9]+[bBkKmMgGtT]?)?(\+?[0-9]+%)?,?)+($| )",

It seems that by trying to match fractions, the new regex would match
too much. For example, if there is " dom0_mem= " on the command line, xl
would detect it as autoballoon=off, while it isn't the case without this
patch. I don't know if it is possible to have "dom0_mem=" on the command
line as I don't know what Xen would do in this case.

It might be better to make the regex more complicated and match
fraction like they are described in the doc, something like:
    ( <size> | (<size>\+)?<frac>% )

unless xen doesn't boot with bogus value for dom0_mem, but I haven't
checked. (we could use CPP macros to avoid duplicating the <size>
regex.)

Also, <frac> is supposed to be < 100, so [0-9]{1,2} would be better to
only match no more than 2 digit.

Thought?

Thanks,

-- 
Anthony PERARD

