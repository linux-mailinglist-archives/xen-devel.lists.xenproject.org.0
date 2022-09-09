Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEA75B38C0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 15:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404341.646783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWduq-0003sn-8x; Fri, 09 Sep 2022 13:19:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404341.646783; Fri, 09 Sep 2022 13:19:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWduq-0003qc-5N; Fri, 09 Sep 2022 13:19:28 +0000
Received: by outflank-mailman (input) for mailman id 404341;
 Fri, 09 Sep 2022 13:19:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuYE=ZM=citrix.com=prvs=244871dc4=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oWduo-0003qW-D4
 for xen-devel@lists.xen.org; Fri, 09 Sep 2022 13:19:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04fda185-3042-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 15:19:25 +0200 (CEST)
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
X-Inumbo-ID: 04fda185-3042-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662729565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BXETze1Aig/wA4PnDydwt5TswadsZLtvoXpQrK9I1Uc=;
  b=M6zcIx9ZG9anOuTL21QwIWaMPM3yXeoZID3atSTWo25f8KLE4RQmNuEj
   dO0iyCfdZ5Md7QVt+hrR62ISbBN8REiisBS3mLTHJ1ZIbhFQnE+VRDMwW
   LBNPzySL2bQJJSkLJJACvT7ZFwyq29zts5X45DhquJL3YZeRlHJDy5+Df
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79842249
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3RYdV64fvPIVKkaoL/BGEQxRtHbAchMFZxGqfqrLsTDasY5as4F+v
 mJNUWnQP6zYMWH9L95+a9m18kpSu5LQxoNnHAplpHoyHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yM6jclkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimUc3l48sfrZ8ks+5KWq4lv0g3RlDRx1lA6G/5UqJMp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VSKlLgFVHmZkl+AsBOtiNqtC0qupvXAdJHAathZ5dlqPgqo
 DlFncTYpQ7EpcQgksxFO/VTO3kW0aGrZNYriJVw2CCe5xSuTpfi/xlhJHwXMZICq8hXOl9D9
 M4nNzlcZUqcmtvjldpXSsE07igiBMziPYdZsXB81zDJS/0hRPgvQY2Tu4Uehm1pwJkTQ7COP
 KL1ahI2BPjESxRJJlcQDoN4hOqyj2PzWzZZtEiUtew85G27IAlZj+m9bICPJo3iqcN9sluZm
 U/fpCfFRT4FH9ee+QLG1Xyvibqa9c/8cN1LT+DpnhJwu3WMwkQDBRtQUkG0ydG+jkO9QM5OM
 Ew89S8nrKx0/0uuJvH4VgG4oXOZ+AYbWsBRHvcS7ACLw7DTpQ2eAwAsSTpMa8cvssMsciA7z
 V+Cn97vBjtHvaWcTDSW8bL8hTGvPSkYK0cSaClCShEKi/Hhr5s0lQnnVct4Hei+ididMS/xx
 TuHqjR4iKgSkdIMy42//FbOmTXqoYLGJiYl6wOSUm+74wdRYI++e5fu+VXdq/FaI+6xUFibs
 WME3cuD6ekUJZWMkiWXR6MKBr7Bz+2ZPTPVh1kpBIUo/Tmp/3+lfKhA4TV/IlcvOcEBERfgZ
 ELD/wlc4pleMVOubKl+eYX3DN4lpYD7Cc7sSvfPK9ZDfLB2bEqD/TpyfgiU3mbkik9qlrswU
 ap3au71UyxcU/4+imPrGaFNitfH2xzS20vuZJzk1UWJ8YGgaX+ndqgMYVDUcf0AufbsTBruz
 zpPCyeb40wBDregOXCMrdF7wUMidiZiW82vwyBDXqvae1c9Rjl8YxPE6el5E7GJiZi5gQshE
 puVfkZDgGTyinTcQelhQiAyMei/NXqTQJ9SAMDNAbpL8yJ5CWpXxP1DH6bbhJF+nACZ8dZ6T
 uMeZ+KLCelVRzLM9lw1NMej9tI8Lk3031vTYEJJhQTTmLY5H2T0FiLMJFOzpEHi8ALs3SfBn
 1FQ/lyCGsdSL+iTJM3XdOiu3zuMgJTpo8orBhOgHzWmUB+zmGScA3Cu06RfzgBlAUmr+wZ2I
 C7NWU5E+bGU+dZvmDQL7Ijdx7qU/yJFNhIyNwHmAXyeb0E2IkLLLVd8bdu1
IronPort-HdrOrdr: A9a23:risCf673RSyXFAIp+APXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.93,303,1654574400"; 
   d="scan'208";a="79842249"
Date: Fri, 9 Sep 2022 14:19:08 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V6 1/3] libxl: arm: Create alloc_virtio_mmio_params()
Message-ID: <Yxs9TMiTy25wGx7t@perard.uk.xensource.com>
References: <cover.1662626550.git.viresh.kumar@linaro.org>
 <fa118965422d6954f9cbf95ffd8e442fcd6702a7.1662626550.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fa118965422d6954f9cbf95ffd8e442fcd6702a7.1662626550.git.viresh.kumar@linaro.org>

On Thu, Sep 08, 2022 at 02:22:59PM +0530, Viresh Kumar wrote:
> In order to prepare for adding support for more device types, create a
> separate routine to allocate base and irq for a device as the same code
> will be required for other device types too.
> 
> Also move updates to virtio_irq and virtio_enabled out of the disk
> device specific block, as they will depend on other device types too.
> 
> Suggested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

