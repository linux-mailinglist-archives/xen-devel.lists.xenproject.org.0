Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670965B38D2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 15:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404349.646794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdxE-0005Ff-L8; Fri, 09 Sep 2022 13:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404349.646794; Fri, 09 Sep 2022 13:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWdxE-0005Cw-HP; Fri, 09 Sep 2022 13:21:56 +0000
Received: by outflank-mailman (input) for mailman id 404349;
 Fri, 09 Sep 2022 13:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuYE=ZM=citrix.com=prvs=244871dc4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWdxC-0005Cq-Iq
 for xen-devel@lists.xen.org; Fri, 09 Sep 2022 13:21:54 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d83cb59-3042-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 15:21:52 +0200 (CEST)
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
X-Inumbo-ID: 5d83cb59-3042-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662729712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ao+kd5oka2knhf2iFLv7l73WLdS4oW6a+Szmj9ib9Y8=;
  b=TvJeJmj3d46+eNi7/270StSIKKg1XWu9AJ342GMhsM4va9BkEJXxwBVb
   KGK4TuOM9f/nEEXNEwQAS46eVagiP1XkpIUz6zkYUWgSw438bcG5OpBIF
   knfWxT/+mFwKzjdrpl//4QSyEPLREYItuOzOa80oZVJJoP+wGa4cUVvWR
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80153804
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Api6E7asYN9BahYckD7vaLTb87+fnOphVZqsSw?=
 =?us-ascii?q?8ifNqXej3nw3RfK1alSQtWbac0UGAeHrecKLn+i4Uvy1o48rIpWocDp8Ue6W?=
 =?us-ascii?q?VUpWcbailInEKWSxbGL/OrgUKEv7Uc6+s9snz47Yz4fGBX80uLaeLhIsetBX?=
 =?us-ascii?q?LtPHrm2D86YuuJAEFFHeW2NMkYqGVUBkqvftDn0X0FY2MrGcHCMedRUj9bSO?=
 =?us-ascii?q?xLDq+H6HvomigIFRv6h91vTphcvgAVUnZQiB6KgaZyS5vphjKdBrpF6fd5/w?=
 =?us-ascii?q?9zZLNUgES2a1kq/bnfLOy1FaZfbrTCKASdhZxyG/JF6SDVuimEyUPbWtUzN8?=
 =?us-ascii?q?iFn9Ipjqa1jW4zkhD5vuNYLqjg7FmKMwGlWOnL/d9Fhf4p3YnsAMWqydxLEu?=
 =?us-ascii?q?gGulhbZdDhCQEjHrdD0f34YKcrewN2HiWlmKCUb8nv+9QvWT0IxUtuG3u8C0?=
 =?us-ascii?q?FIUK88hR6YQj7FlAu3kQh2kHtE4rbTJKyDkQYKYSY0MP/PFy6373ioptPQQD?=
 =?us-ascii?q?2ot9IijvIazwEjVaH+xqfsEXNqzy7IEY3ZgnQ7EvIGNx5NjKTLLl8CwYAjw3?=
 =?us-ascii?q?h2RJcwQaPyJ8dq1UStCUAWPOj0OGDuSmDLje62qwd+65vAUvKA5uWCdcvb7q?=
 =?us-ascii?q?JRxgekp8d/OA+dn774yz7AdxHGqpKIZQwF+lOp30WsR7Ne9sXl22gawrmkOi?=
 =?us-ascii?q?0GmxeGFnOs4+P3cJbViMfmTyhtwbF++bxbW+VTo+OSBsYZUwHIsZnInnwTpY?=
 =?us-ascii?q?F+lhFCCu5RyM9ANAWqxRgAOOaF0IVvLLxcrwf/lHGgR+Jp2pWqecy1tygsmt?=
 =?us-ascii?q?43m8JYdFOKg0ummLdNlE+e2MphECgpEd7FcJbiz236uPF+U1exJ/JPkW04em?=
 =?us-ascii?q?zVcHKeApRcuX5M0fskMOrbF/CI9Cu59oN0wroteVHq287jdpNlOvRQjzZoNI?=
 =?us-ascii?q?NG4TaaLoGrW/hJo+4sW89DYeosI05o+9FHD6JGNRTz7sra3hHPoiCHM7BM/y?=
 =?us-ascii?q?vWcnydCWkoBGACEkul0V4Oiw5gv995cgQM7TSFVO6JMn1S+MtVZUDumKB/Gs?=
 =?us-ascii?q?dtE+EeaEYTB/AECwXh3bLrMpkhpY84AZDoCqBfX9sM2NTpHZi4UEDTUmF7dF?=
 =?us-ascii?q?5QRr/KeaoKbiZF2CEEZhr/2xQCOlBzbElsl+LZ3DTn6Z+jsUQ9VLUjbuV7v3?=
 =?us-ascii?q?Y030HiOkXwTjh/t3G0FHv2SFTL/tHNNBeh9b6+kn2F55pr1ov2gKB26o5vID?=
 =?us-ascii?q?fNqW90LFs9L+vfjNZwb9oZ/JXU4F0uQ5IbcI5nN31PnLeH8ax0DUNpEw2ab9?=
 =?us-ascii?q?JO4HaMyQfJYm5XozE8iEns56D+7sXMEnE2G2GbAi9Z00h8mVkMNQ3aBEKlfx?=
 =?us-ascii?q?W6DlvNnA39UJFdNPzxz0wzvPggDPpGsZfXNotR3Da7fj0rOvvoRVFZBBqBaG?=
 =?us-ascii?q?PJLMDx6WbIlHBmuSPibOGE7PzPxaoSomZ24S6I5Wge9pN00671MYwRSZv7G6?=
 =?us-ascii?q?zILPP8m8BkjTE+cymURdo6Zv03+LzCh8iABrW2cKUvsRfJtXZjEYOfjjTNqV?=
 =?us-ascii?q?EbwXBt8B3LWm3irDaC8K6OIFG+qS9DHBy51Mm1RkZZlBJnlK+Cig7Lurf110?=
 =?us-ascii?q?ebJgEW8ovF7cA9xW4nlLj0TnpnLd2e469LtZMRJu3eDHcNfDY2JLg1C8Jh0n?=
 =?us-ascii?q?X8nybEqlTvyj/fIp0v2re2EuEq1HIwPibtkZE7Z8YZKVL3MSVs5bTPjjgOec?=
 =?us-ascii?q?XNl6I4Skw51kMC7Q05XtxmDFVhWiA1873t7qO/m/hd5/X11HnkqiMsw1ia67?=
 =?us-ascii?q?2zl16W4PULFy3Cd9Lqssz2a7g1nU3ZALWuNYqDxZzfmotOWV837onVHJT/VU?=
 =?us-ascii?q?+L51wdQUuWr7fD0f/TwH+z18YvV1aEWIC8iWcfvciVf7vj7u7+M1Vr3a1heq?=
 =?us-ascii?q?SCOt6NArHjYgaujZVpb5YtnFtJlxl6kNvu4s6LRq4ESuueaEASdCSjeE3zM3?=
 =?us-ascii?q?U/S6ACckrVVDzB/NAX8RnXnZjdRGzdiF0tRBy9atOT+YMA0XeZzFTbD+fLsK?=
 =?us-ascii?q?7bdtRMOPakHMih8SioDHUZYm+HHJf11s/6/dk0/digcE3+wkgsJb5OkwflSg?=
 =?us-ascii?q?mr0J/fGFBEDgVwvXI8P31CezW/eSHV7LC/45kv4t2xJJmqCbI9SLB/+utCIu?=
 =?us-ascii?q?EsVEp91GOj+KRZfOzyhpHSuLwoJmxxctclRjflQyrUtw2twSPoRnvr4A3SEU?=
 =?us-ascii?q?lcjxiuMb0/VoVk9IV83+fDIqhm23EY2Xoio8sHp/fMtm4kpGMzjlS8wdx+al?=
 =?us-ascii?q?4Cr9zTYqXgEKllRvlue7dBfsVJRmokTPMGxiwX57efnc6I0CHy5FgXXsKpoh?=
 =?us-ascii?q?lRh7FsMnL4tOH8/3Mi0RaB3DQ4LXobCNS7QAZVur6WcOK3icT23gg8JKwCpk?=
 =?us-ascii?q?G/EDvt5daY7B9QwSCWCFG//RcVvgxsxy92SHibmCzSllFuMXd+9U6vaSH/Hv?=
 =?us-ascii?q?om3VHNVQ/MoZ2/Sq9+nSTONTorIromdaAMrINOrpQg9/d+quOQ5+7+zyLlgO?=
 =?us-ascii?q?SW1KYCmYg+1gcYEcRs7Evg+ZvrVAfvV7FIc+QG1ufHJWKt85g/xTsg8HU0uS?=
 =?us-ascii?q?dam6J7zMJ2CiKN9qL3+8+a7pxmp7j36lJsSfm+PzzgekraYXf/2MKI+lnqGH?=
 =?us-ascii?q?K0C5k2ldE0h/mQGtjQPp3yiWmsTeul5nA0QZvpz5bIcil0LXpk0VJTkFnYML?=
 =?us-ascii?q?mRnmDLZpGsoiZscYm+U0RysZ4EMd/ZWrRh/w3L3qDkG3WWNkIKk9Lwx5YYFi?=
 =?us-ascii?q?x2fQl9XxGH3XdG7I9iBbn85H6LJ4eiwVRhc3cOWLhyrJcWPg/v6N1OiJN56N?=
 =?us-ascii?q?RDLW0lZHidU8K0Gt6rlb1dZufm8fJIgegLuiJ4/FDyzlIXi/U/YmbC1kYdqu?=
 =?us-ascii?q?xXAfUCMk5NUK0EVUIRFIM+tONstoaYwTaEZidszBQujmeKeJB23sc0++nbex?=
 =?us-ascii?q?DrCHcOGMEUq9w1TMsPJwDGQmv/SbsdgSfvT34d1t5zyPn6ZLeOVrig9hqjvo?=
 =?us-ascii?q?WyiFt92QcQjBPwFNLbTHDgtcl6ELYDWIy8+tlK0UzC6xdw0ckGZZhxi5Gx/e?=
 =?us-ascii?q?yKe7nmWqNGFMNyPv5zkhFnvTRJhAb5hTKlry4Pq9A1H1htwPnH94Av+jr/DE?=
 =?us-ascii?q?AGsOQQgwIpDW3paVaJ6ZHwQcKLLO8C2EVZHWi1zFeTsDPtUbD6+T2969YwKR?=
 =?us-ascii?q?gH+MaOJI2OMpTQlTe8hxiyoqwGrUHtO6ev8ArIT1y8nybbdp06zl6l1P53ld?=
 =?us-ascii?q?k5Ipkt/0B7eFVCJxEgAXXfcvkWa3GaVxlm1bTh6mEpQsQy0Z12BZPE=3D?=
X-IronPort-AV: E=Sophos;i="5.93,303,1654574400"; 
   d="scan'208";a="80153804"
Date: Fri, 9 Sep 2022 14:21:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V6 2/3] libxl: arm: Split make_virtio_mmio_node()
Message-ID: <Yxs95ZCURyHcBpNj@perard.uk.xensource.com>
References: <cover.1662626550.git.viresh.kumar@linaro.org>
 <0edb5dc1ea3308cf9202e6476ff2797aad953966.1662626550.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0edb5dc1ea3308cf9202e6476ff2797aad953966.1662626550.git.viresh.kumar@linaro.org>

On Thu, Sep 08, 2022 at 02:23:00PM +0530, Viresh Kumar wrote:
> make_virtio_mmio_node() creates the DT node for simple MMIO devices
> currently, i.e. the ones that don't require any additional properties.
> 
> In order to allow using it for other complex device types, split the
> functionality into two, one where the fdt node isn't closed and the
> other one to create a simple DT node.
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

