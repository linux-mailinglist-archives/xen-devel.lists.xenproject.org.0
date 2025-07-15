Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A221B05DF2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044388.1414490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubg1J-0001wM-C3; Tue, 15 Jul 2025 13:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044388.1414490; Tue, 15 Jul 2025 13:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubg1J-0001uK-9L; Tue, 15 Jul 2025 13:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1044388;
 Tue, 15 Jul 2025 13:48:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H7gz=Z4=huawei.com=jonathan.cameron@srs-se1.protection.inumbo.net>)
 id 1ubg1H-0001uE-K3
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:48:31 +0000
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63539663-6182-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:48:29 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bhL8c12BFz6M4Z3;
 Tue, 15 Jul 2025 21:47:12 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 2579A1402EB;
 Tue, 15 Jul 2025 21:48:26 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 15 Jul
 2025 15:48:23 +0200
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
X-Inumbo-ID: 63539663-6182-11f0-a319-13f23c93f187
Date: Tue, 15 Jul 2025 14:48:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: WangYuli <wangyuli@uniontech.com>
CC: <airlied@gmail.com>, <akpm@linux-foundation.org>,
	<alison.schofield@intel.com>, <andrew+netdev@lunn.ch>,
	<andriy.shevchenko@linux.intel.com>, <arend.vanspriel@broadcom.com>,
	<bp@alien8.de>, <brcm80211-dev-list.pdl@broadcom.com>,
	<brcm80211@lists.linux.dev>, <colin.i.king@gmail.com>, <cvam0000@gmail.com>,
	<dan.j.williams@intel.com>, <dave.hansen@linux.intel.com>,
	<dave.jiang@intel.com>, <dave@stgolabs.net>, <davem@davemloft.net>,
	<dri-devel@lists.freedesktop.org>, <edumazet@google.com>,
	<gregkh@linuxfoundation.org>, <guanwentao@uniontech.com>, <hpa@zytor.com>,
	<ilpo.jarvinen@linux.intel.com>, <intel-xe@lists.freedesktop.org>,
	<ira.weiny@intel.com>, <j@jannau.net>, <jeff.johnson@oss.qualcomm.com>,
	<jgross@suse.com>, <jirislaby@kernel.org>, <johannes.berg@intel.com>,
	<kuba@kernel.org>, <kvalo@kernel.org>, <kvm@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux@treblig.org>, <lucas.demarchi@intel.com>, <marcin.s.wojtas@gmail.com>,
	<ming.li@zohomail.com>, <mingo@kernel.org>, <mingo@redhat.com>,
	<netdev@vger.kernel.org>, <niecheng1@uniontech.com>,
	<oleksandr_tyshchenko@epam.com>, <pabeni@redhat.com>, <pbonzini@redhat.com>,
	<quic_ramess@quicinc.com>, <ragazenta@gmail.com>, <rodrigo.vivi@intel.com>,
	<seanjc@google.com>, <shenlichuan@vivo.com>, <simona@ffwll.ch>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>,
	<thomas.hellstrom@linux.intel.com>, <vishal.l.verma@intel.com>,
	<x86@kernel.org>, <xen-devel@lists.xenproject.org>, <yujiaoliang@vivo.com>,
	<zhanjun@uniontech.com>
Subject: Re: [PATCH v2 2/8] cxl: mce: Fix typo "notifer"
Message-ID: <20250715144822.000006b9@huawei.com>
In-Reply-To: <65FC7B96ECBDB052+20250715134407.540483-2-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
	<65FC7B96ECBDB052+20250715134407.540483-2-wangyuli@uniontech.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue, 15 Jul 2025 21:44:01 +0800
WangYuli <wangyuli@uniontech.com> wrote:

> According to the context, "mce_notifer" should be "mce_notifier".
> 
> Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
> Fixes: 516e5bd0b6bf ("cxl: Add mce notifier to emit aliased address for extended linear cache")
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/cxl/core/mce.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cxl/core/mce.h b/drivers/cxl/core/mce.h
> index ace73424eeb6..ca272e8db6c7 100644
> --- a/drivers/cxl/core/mce.h
> +++ b/drivers/cxl/core/mce.h
> @@ -7,7 +7,7 @@
>  
>  #ifdef CONFIG_CXL_MCE
>  int devm_cxl_register_mce_notifier(struct device *dev,
> -				   struct notifier_block *mce_notifer);
> +				   struct notifier_block *mce_notifier);
>  #else
>  static inline int
>  devm_cxl_register_mce_notifier(struct device *dev,


