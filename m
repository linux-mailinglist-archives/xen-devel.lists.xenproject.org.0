Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCFD72E013
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548094.855879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Zm-0004C4-VJ; Tue, 13 Jun 2023 10:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548094.855879; Tue, 13 Jun 2023 10:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91Zm-00049l-Rv; Tue, 13 Jun 2023 10:48:38 +0000
Received: by outflank-mailman (input) for mailman id 548094;
 Tue, 13 Jun 2023 10:48:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ia/t=CB=citrix.com=prvs=5214cf225=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q91Zl-00049f-Gw
 for xen-devel@lists.xen.org; Tue, 13 Jun 2023 10:48:37 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7c7dfb6-09d7-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 12:48:35 +0200 (CEST)
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
X-Inumbo-ID: d7c7dfb6-09d7-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686653315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N1pCnkBOjRcSOfashEDIH6C2FXieQW6qKKMz1KiRC9A=;
  b=UN4dnO71Uy1pww6oZngeTNzSDRzPBf79l024g1BshAea5Z1d3L4GDkrU
   voEVQKdqFbMyJ7rnA3oAubALpO2JLN2Lyqx/5hHG9WJV2TDUS1TEtin+N
   Qlt312aP59IXzdX9zFWEReSUE3iUoJtzGsazEDjfqN1wJKU3UY4sasGZP
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111915156
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:tFMhs6Llo0roVqR+FE+RmZIlxSXFcZb7ZxGr2PjKsXjdYENShmNWm
 GYaD26EPvbcNjb8f99wa9uzpx5TusPVmIBmSwBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AVlPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4uOW9Kq
 d05dQkwYz+oituT6ojldulF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJwExxvB+
 zyuE2LRXC48asWzzz6/1nuN3MmIjwSlf709G+jtnhJtqALKnTFCYPEMbnOloOO0kU74WM9aI
 lY8/isopLI1skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzOzT+QnxLmoLVDlac/Q9qdQ7Azct0
 zehnc7tBDFpmK2YTzSa7Lj8hS2zPyMYK3NEajIFURcC//HnoYc6lBWJScxseIauksf8BTbrh
 jyHsgA5n/AXjNUXzOO//FbOmTXqoYLGJiY84gjHGGio6AV0aaahZoqh81+d6uxPRK6cR0WBv
 XUZ3dCZ7foPAIulkC2LSf8KWrqu4p6tNznRgkVzDoIh3zuo8n+nO4tX5VlWKV1oMYAfcj/oZ
 EvSvwx54J5VNWGtK6htbOqZAtwn16H6Gfz5V/rfaZxFZZ0ZSeOc1HgwPwjKhTmryRVy1/hlY
 v93bPpAE15DMapjkBuXGt4g3JAAyxkb71mNeZDSmkHPPaWlWJKFdVsUGALQPr5ntv/c/1m9H
 8V3bJXTlUgGOAHqSmyOqNNIcwhXRZQuLcquw/G7YNJvNeaP9IsJL/bKiY0sdIV+90i+vreZp
 yrtMqO0JbeWuJEmFelpQio5AF8XdcwjxU/XxAR1VbpS51AtYJy08IAUfIYtcL8s+YRLlKAkE
 aRUJ5rbU6gfE1wrHgjxi7Gn9OSOkzzx3Gqz09eNOmBjL/aMuSSUkjMbQucf3HZXVXfm3SfPi
 7ahyhnaUfI+q/dKVa7rhAaU5wrp5xA1wbsiN3Yk1/EPIC0ABqA2cX2u5hL2SulQQSj+Ksyyj
 lnPW0tG+LOU/ufYMrDh3Mi5kmtgKMMmdmIyIoURxeje2fXyloZ7/bJ9bQ==
IronPort-HdrOrdr: A9a23:7WK/+q6A6TSrVfkmdwPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3AND//82oyRnelVNk73eXgzjvmUZkdfHmB7VaNGnK?=
 =?us-ascii?q?1Jk1kcZi/cwGs+Ioxxg=3D=3D?=
X-Talos-MUID: 9a23:d+hpwAR69T7HBSj9RXSyuxc8Letu556KAWFXt9IUnJejCgN/bmI=
X-IronPort-AV: E=Sophos;i="6.00,239,1681185600"; 
   d="scan'208";a="111915156"
Date: Tue, 13 Jun 2023 11:48:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>
Subject: Re: [PATCH V3.1] libxl: arm: Add grant_usage parameter for virtio
 devices
Message-ID: <ecf753b0-3ccd-461a-925a-f3bac49dd269@perard>
References: <0e347b2f4817cc578a5f8e41bf70503ae8cf69e3.1685684586.git.viresh.kumar@linaro.org>
 <7a0afe5aebba4c0b5be43a517dedf41d4e4ddd57.1686636036.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7a0afe5aebba4c0b5be43a517dedf41d4e4ddd57.1686636036.git.viresh.kumar@linaro.org>

On Tue, Jun 13, 2023 at 11:32:16AM +0530, Viresh Kumar wrote:
> Currently, the grant mapping related device tree properties are added if
> the backend domain is not Dom0. While Dom0 is privileged and can do
> foreign mapping for the entire guest memory, it is still desired for
> Dom0 to access guest's memory via grant mappings and hence map only what
> is required.
> 
> This commit adds the "grant_usage" parameter for virtio devices, which
> provides better control over the functionality.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V3->V3.1:
> - Print "0" or "1" in xenstore instead of "True" or "False" for grant_usage.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

