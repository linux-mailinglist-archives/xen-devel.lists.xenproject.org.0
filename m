Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC286FBC2B
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 02:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531944.827924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwBZV-0008SF-KU; Tue, 09 May 2023 00:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531944.827924; Tue, 09 May 2023 00:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwBZV-0008QS-HO; Tue, 09 May 2023 00:51:17 +0000
Received: by outflank-mailman (input) for mailman id 531944;
 Tue, 09 May 2023 00:51:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lV9y=A6=huawei.com=linyunsheng@srs-se1.protection.inumbo.net>)
 id 1pwBZU-0008QM-Mt
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 00:51:16 +0000
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96be2e78-ee03-11ed-b226-6b7b168915f2;
 Tue, 09 May 2023 02:51:12 +0200 (CEST)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4QFfh404RszpWF8;
 Tue,  9 May 2023 08:49:56 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 9 May
 2023 08:51:07 +0800
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
X-Inumbo-ID: 96be2e78-ee03-11ed-b226-6b7b168915f2
Subject: Re: [PATCH RFC 2/2] net: remove __skb_frag_set_page()
To: Simon Horman <simon.horman@corigine.com>
CC: <netdev@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
	<virtualization@lists.linux-foundation.org>,
	<xen-devel@lists.xenproject.org>, <bpf@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <edumazet@google.com>, <davem@davemloft.net>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <alexanderduyck@fb.com>,
	<jbrouer@redhat.com>, <ilias.apalodimas@linaro.org>
References: <20230508123922.39284-1-linyunsheng@huawei.com>
 <20230508123922.39284-3-linyunsheng@huawei.com>
 <ZFkHulUs7d1xWKSa@corigine.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <ca5dabb4-d875-7845-553f-915b3ce85be1@huawei.com>
Date: Tue, 9 May 2023 08:51:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <ZFkHulUs7d1xWKSa@corigine.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected

On 2023/5/8 22:31, Simon Horman wrote:
> On Mon, May 08, 2023 at 08:39:22PM +0800, Yunsheng Lin wrote:
>> The remaining users calling __skb_frag_set_page() with
>> page being NULL seems to doing defensive programming, as
>> shinfo->nr_frags is already decremented, so remove them.
>>
>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> 
> ...
> 
>> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>> index efaff5018af8..f3f08660ec30 100644
>> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
>> @@ -1105,7 +1105,6 @@ static u32 __bnxt_rx_agg_pages(struct bnxt *bp,
>>  			unsigned int nr_frags;
>>  
>>  			nr_frags = --shinfo->nr_frags;
> 
> Hi Yunsheng,
> 
> nr_frags is now  unused, other than being set on the line above.
> Probably this local variable can be removed.

Yes, will remove that.
Thanks.

