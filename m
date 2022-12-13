Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6AA64B308
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 11:15:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460435.718341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52JV-0003nG-7J; Tue, 13 Dec 2022 10:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460435.718341; Tue, 13 Dec 2022 10:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52JV-0003kq-4L; Tue, 13 Dec 2022 10:15:05 +0000
Received: by outflank-mailman (input) for mailman id 460435;
 Tue, 13 Dec 2022 10:15:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=scEP=4L=citrix.com=prvs=339c6d897=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p52JU-0003kd-8Z
 for xen-devel@lists.xen.org; Tue, 13 Dec 2022 10:15:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00376574-7acf-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 11:15:02 +0100 (CET)
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
X-Inumbo-ID: 00376574-7acf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670926502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2U1W/tBYnBYuvXKQ7BjW6QflCqBrrmwKgXU3wNrcxTc=;
  b=g939hzRGPJ0eyVDKhKCAuy7a5Bq+zFwBMoP60/nmbINT+eCsJMDbo3xO
   G0/25SqPyyOfJbUsB5de6mlY91uwE4ksUaPwAsyl5RyD9Gl/v1SykER08
   D+E8gS5gKwjLQZG2UFM+vLX/lOP9BOqQUDgJkTXoyX3CkRZvCuc/9Yoir
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88085696
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OI/EAalyKrHvyqSxGppiY/Ho5gzpIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWGHUbP6LMzCmfIogPt6//EMOsMTcm4JrHVdu/ik1FSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kR5QSGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fs+IhkhUCG9u92Z5aKnCdE2l+UpEMa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsfYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zhbA9
 j+YrjqR7hcyd/imyiTc/U6WrcTIuijkfY4TOu2Tz6s/6LGU7jNKU0BHPbehmtG8g1K+Wt9Cb
 VQT+zAvoLIa8E2tR8P6GRa/pRaspQIRVdNWFKsh9AiHx67Q4gCYLngFSj9HeJots8pebTUu2
 0/Pld7vAzFimLmUT3uH8fGTtzzaETcRBX8PY2kDVwRty97nrYIokgPUTv5sFae0ipv+HjSY6
 zWLryV4h7IXiMMQ/6G6+1ndhHSrvJehZgw6/ALMRUq+8xh0IoWiYuSA+VXdqPpNMoudZl2Ap
 2Qf3diT6qYJF57lvDKMWugWHPeq+vOMKhXYgFhmBZ5n8C6ik1a4YZpZ/DZlYUtkLO4DYXrtY
 VTPokVV5ZlaJnzsarV4C6qvCsIhwK78U9v4V+zIacZmZpl3fRWAuiZ0aia43X3pkUUqubEyP
 9Gca8nEMJoBIf05lnzsHb5biOJ1gHBlrY/OeXzl5xOB25OyWk+rdYgqFUuSLdhj/YKOnAqAp
 r6zKPC24xlYVeT/ZAze/ogSMU0GIBAHOHzmlyBEXrXde1Q7QQnNH9eUmOp8INI9w8y5g8+Sp
 hmAtllkJE0TbJEtASGDcThdZbzmRv6TRlprbHV3bT5EN5XOCLtDDZvzlbNtJdHLF8Q5l5aYq
 sXpnO3easmjshydp1wggWDV9eSOjiiDiwOUJDaCazMiZZNmTAGh0oa6IVO/q3FWVnTr6pdWT
 1icOuTzGMpreuifJJyONKLHI62Z4hDxZ96er2OXe4IOKS0AAaBhKjDrj+9fHi3/AUyr+9du7
 C7PWU1wjbCU8+cIHCzh2fjsQ3GBT7EvQSK33gDzsd6LCMUt1jH7kNUdCr/RLW+1uaGd0PzKW
 Ni5BsrUaJUv9GumeaIme1q35crSP+fSmoI=
IronPort-HdrOrdr: A9a23:qCui5qm8V9qH59mVCtugh8IIiZjpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-IronPort-AV: E=Sophos;i="5.96,241,1665460800"; 
   d="scan'208";a="88085696"
Date: Tue, 13 Dec 2022 10:14:55 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH V9 2/3] xl: Add support to parse generic virtio device
Message-ID: <Y5hQn0CB08wSeJJM@perard.uk.xensource.com>
References: <cover.1670925998.git.viresh.kumar@linaro.org>
 <9822fd35c2b072da0fcdc37fc029c67d5543c716.1670925998.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9822fd35c2b072da0fcdc37fc029c67d5543c716.1670925998.git.viresh.kumar@linaro.org>

On Tue, Dec 13, 2022 at 03:38:47PM +0530, Viresh Kumar wrote:
> This patch adds basic support for parsing generic Virtio backend.
> 
> An example of domain configuration for mmio based Virtio I2C device is:
> virtio = ["type=virtio,device22,transport=mmio"]
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

