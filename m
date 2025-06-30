Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F458AED9EF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 12:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029004.1402761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWBqq-0000Fm-Oy; Mon, 30 Jun 2025 10:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029004.1402761; Mon, 30 Jun 2025 10:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWBqq-0000DK-LZ; Mon, 30 Jun 2025 10:35:04 +0000
Received: by outflank-mailman (input) for mailman id 1029004;
 Mon, 30 Jun 2025 10:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QzNl=ZN=bounce.vates.tech=bounce-md_30504962.68626854.v1-22c1748b0ecc401fbe2d41b116762df6@srs-se1.protection.inumbo.net>)
 id 1uWBqp-0000DE-9b
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 10:35:03 +0000
Received: from mail187-29.suw11.mandrillapp.com
 (mail187-29.suw11.mandrillapp.com [198.2.187.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0739d19-559d-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 12:35:02 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-29.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4bW2bm5NN7z7lmDFF
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 10:35:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 22c1748b0ecc401fbe2d41b116762df6; Mon, 30 Jun 2025 10:35:00 +0000
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
X-Inumbo-ID: e0739d19-559d-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1751279700; x=1751549700;
	bh=3W5WXPPkdn52aUe9Wy9HcVhwmubgY5+gcpH4c7xElaU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tOEVEjgCJtlYZUjOgPiJb9tEkfGufchSqhTbIWCt84ZeXmVSu8Uo6hkm6txbUJQkT
	 TVdDEBO8CXOwL09waoiTIJrTlsqzIlx/yzTvg6V00Xpunj03iVKmA0J0PJ42VGlO3V
	 Ls0Ei57H/y2p45KDMTAUneOlLMablXAd4FZ/Uh77N0CZhYKwE3IOWGAkPzBZTZSZfF
	 Kbxu+dEuGx2PlyspDcOqDf80p/af+kpJrkcKE6LK0o1YVGHphSmMMQzI6/pGoN6G46
	 NA1PtiQDEne8iLt5P5P78N0pSs+8QVuUhoZJyX06rhfumFoEF4h/dSWO2sI9J8kOmx
	 TR8egOtfF4HQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1751279700; x=1751540200; i=ngoc-tu.dinh@vates.tech;
	bh=3W5WXPPkdn52aUe9Wy9HcVhwmubgY5+gcpH4c7xElaU=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wXGlQIOIhIbfW6kLf/ynzX85XjL0d232aZ48D+2wdo+9jZM0YQ2FOahZIrSzmxMld
	 rhGTSHw//mQg+1luzlKOacrwRclk4XCMrGLzITGjlVwMpMje/cIcU5/uFdBPwYcpIL
	 GUzAb231FOaNhMarxeaAG1JpASfFgJ9W2SMN+kJtMx8UPoj1uEYTwGU1pmbou358/q
	 Hpvb5UtedRyx/sHxVBLV/c2k/RDlMqbMLi1WznzBEQWJHKectHCM5CVNUMrKEbQf43
	 AebppOwChVJrkyKPvzLLKBCrQJSgVC+5738yVJzI00LJZnZIUMkOZ1FArnh27oWplc
	 qIydqFk5pubkg==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20xen/gntdev:=20reduce=20stack=20usage=20by=20dynamically=20allocating=20gntdev=5Fcopy=5Fbatch?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1751279699533
Message-Id: <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
To: "Abinash Singh" <abinashlalotra@gmail.com>, jgross@suse.com, sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, "Abinash Singh" <abinashsinghlalotra@gmail.com>
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
In-Reply-To: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.22c1748b0ecc401fbe2d41b116762df6?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250630:md
Date: Mon, 30 Jun 2025 10:35:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

On 30/06/2025 06:54, Abinash Singh wrote:
> While building the kernel with LLVM, a warning was reported due to
> excessive stack usage in `gntdev_ioctl`:
> 
> 	drivers/xen/gntdev.c:991: warning: stack frame size (1160) exceeds limit (1024) in function 'gntdev_ioctl'
> 
> Further analysis revealed that the large stack frame was caused by
> `struct gntdev_copy_batch`, which was declared on the stack inside
> `gntdev_ioctl_grant_copy()`. Since this function was inlined into
> `gntdev_ioctl`, the stack usage was attributed to the latter.
> 
> This patch fixes the issue by dynamically allocating `gntdev_copy_batch`
> using `kmalloc()`, which significantly reduces the stack footprint and
> eliminates the warning.
> 
> This approach is consistent with similar fixes upstream, such as:
> 
> commit fa26198d30f3 ("iommu/io-pgtable-arm: dynamically allocate selftest device struct")
> 
> Fixes: a4cdb556cae0 ("xen/gntdev: add ioctl for grant copy")
> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> ---
> The stack usage was confirmed using the `-fstack-usage`  flag and mannual analysis, which showed:
> 
>    drivers/xen/gntdev.c:953: gntdev_ioctl_grant_copy.isra   1048 bytes
>    drivers/xen/gntdev.c:826: gntdev_copy                     56 bytes
> 
> Since `gntdev_ioctl` was calling the inlined `gntdev_ioctl_grant_copy`, the total
> frame size exceeded 1024 bytes, triggering the warning.
> 
> This patch addresses the warning and keeps stack usage within acceptable limits.
> Is this patch fine or kmalloc may affect performance ?
> ---

Have you measured the performance impact? gntdev_ioctl_grant_copy is 
called quite often especially by the backend. I'm afraid calling the 
allocator here may cause even more slowdown than there already is, 
especially when memory is tight.

>   drivers/xen/gntdev.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> index 61faea1f0663..9811f3d7c87c 100644
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@ -953,15 +953,19 @@ static int gntdev_grant_copy_seg(struct gntdev_copy_batch *batch,
>   static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void __user *u)
>   {
>   	struct ioctl_gntdev_grant_copy copy;
> -	struct gntdev_copy_batch batch;
> +	struct gntdev_copy_batch *batch;
>   	unsigned int i;
>   	int ret = 0;
>   
>   	if (copy_from_user(&copy, u, sizeof(copy)))
>   		return -EFAULT;
> -
> -	batch.nr_ops = 0;
> -	batch.nr_pages = 0;
> +
> +	batch = kmalloc(sizeof(*batch), GFP_KERNEL);
> +	if (!batch)
> +		return -ENOMEM;
> +
> +	batch->nr_ops = 0;
> +	batch->nr_pages = 0;
>   
>   	for (i = 0; i < copy.count; i++) {
>   		struct gntdev_grant_copy_segment seg;
> @@ -971,18 +975,20 @@ static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void __user *u)
>   			goto out;
>   		}
>   
> -		ret = gntdev_grant_copy_seg(&batch, &seg, &copy.segments[i].status);
> +		ret = gntdev_grant_copy_seg(batch, &seg, &copy.segments[i].status);
>   		if (ret < 0)
>   			goto out;
>   
>   		cond_resched();
>   	}
> -	if (batch.nr_ops)
> -		ret = gntdev_copy(&batch);
> -	return ret;
> +	if (batch->nr_ops)
> +		ret = gntdev_copy(batch);
> +	goto free_batch;
>   
>     out:
> -	gntdev_put_pages(&batch);
> +	gntdev_put_pages(batch);
> +  free_batch:
> +	kfree(batch);
>   	return ret;
>   }
>   



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


