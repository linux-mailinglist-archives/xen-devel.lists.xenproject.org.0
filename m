Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B99E496218
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 16:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259404.447743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvs3-0007Eg-Po; Fri, 21 Jan 2022 15:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259404.447743; Fri, 21 Jan 2022 15:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAvs3-0007CC-MT; Fri, 21 Jan 2022 15:30:35 +0000
Received: by outflank-mailman (input) for mailman id 259404;
 Fri, 21 Jan 2022 15:30:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QdbK=SF=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nAvs2-0007C6-7G
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 15:30:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 115717c9-7acf-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 16:30:32 +0100 (CET)
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
X-Inumbo-ID: 115717c9-7acf-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642779032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DFEdzuIykRo/FuVlwWAJuAPc7ITViwAvWWrQyz9GBJE=;
  b=Ozg//BHwZONA+OiVIjiOAoK8i0Tlu45tNERqVUyGKJibjp0lnGyT+HyA
   9MdRCUNpK3ZuSvTzcAj3D6bxh883puFgOXdJ3Mq6DsDCo/MTIcgEEZx2f
   M1VbBYJs3G/zl3pxDLc1MupzBlwdqm/7x5BwxVKhFONdidXz47LS4MuMN
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: T3lzKEa/hGUZLdEHrWuXuMeeb0LN3U636iFIJdqLpjJqX1BetxlvI5nMF+WNHdSULCLMkmL9Hf
 7xYgWvJ4PnR4bGbMYFWBvRqOyRk8JWbitVxXses7LehLuicHloXPNmQRsIKZmWPMPVlQJth1A/
 J7iLeDeicHyBWiBVXbJwfMr1fpKc+1fCM5ChJ7OM8JZtUa27y1iJnko+DJTcok9nF8rWWKfoV6
 kq1I1qj2o+jFM0Jqg9B1mgQHe+VDM5lGzdqArsSJBnuyYwNnLNm5FmNrqc172vZtI+fyVJ3liq
 DW8txPHr8CDMNKm7jFU7Sr2T
X-SBRS: 5.2
X-MesageID: 62500725
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:t5j25axjgNkY3/tpl696t+fSwSrEfRIJ4+MujC+fZmUNrF6WrkUOn
 2UZWWzVaf2La2T3L9p3YN7noxhT7JfdnNVkHgRkryAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRg2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt/Nvl
 Il/6bCwcipzAZ/AtNgiCSNkNBgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY2JoTRa6BP
 ZdxhTxHYizAbUN+MXouBLUxl7+khlvUWBdJtwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krE4mD4DxcyJNGZjz2f/RqEhODVmjjgcJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyyWHWjQ2EhJBU/F8i/06aQAVj
 GW1uOq8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBn3+1L5fPnwZlX6rwub9iEgpHSBjA46QzMNo5OxlMoPdX1D2BEBLWy0BqhEGp7ZgTZ1
 JTns5LHhAzrMX1rvHbcKAnqNOv4j8tpyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5VkOvMQCbSL2M/cfj2eN5yIClvCI+TPNDai8UzazSsIpKF/vEN9GOCZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8dZFb7x17FPf/QhnnTm7bcmil3yPiOPCDFbIF+ttGAbQP4gRsfPVyC2Io
 o03H5bblH1ivBjWP3O/HXg7dw5adBDWxPne9qRqSwJ0ClM2QT56U66In+pJlk4Mt/09q9okN
 0qVAidwoGcTT1WdQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:OaTiX69u3ubLk5lez+5uk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="62500725"
Date: Fri, 21 Jan 2022 15:30:21 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH v2 3/3] tools/xenstore: drop DEFINE_HASHTABLE_* macros
 and usage intro
Message-ID: <YerRjUhTaXmGZilJ@perard>
References: <20220121152120.23160-1-jgross@suse.com>
 <20220121152120.23160-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220121152120.23160-4-jgross@suse.com>

On Fri, Jan 21, 2022 at 04:21:20PM +0100, Juergen Gross wrote:
> The DEFINE_HASHTABLE_* macros are used nowhere, so drop them.
> The usage intro isn't really needed either.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

