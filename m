Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F403816A5B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 10:58:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655709.1023481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAOS-00045K-OL; Mon, 18 Dec 2023 09:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655709.1023481; Mon, 18 Dec 2023 09:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAOS-00043f-KO; Mon, 18 Dec 2023 09:58:36 +0000
Received: by outflank-mailman (input) for mailman id 655709;
 Mon, 18 Dec 2023 08:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UGV7=H5=iogearbox.net=daniel@srs-se1.protection.inumbo.net>)
 id 1rF9Mq-0002OK-8G
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 08:52:52 +0000
Received: from www62.your-server.de (www62.your-server.de
 [2a01:4f8:d0a:276a::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1a2ec2f-9d82-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 09:52:48 +0100 (CET)
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <daniel@iogearbox.net>)
 id 1rF9M8-000GMZ-Kc; Mon, 18 Dec 2023 09:52:08 +0100
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1rF9M6-000DSm-B8; Mon, 18 Dec 2023 09:52:06 +0100
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
X-Inumbo-ID: d1a2ec2f-9d82-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=u9rU7FfAkS1Xg3KQP7X+Uy8VuWy1sh7xNAOO2EeOmow=; b=pVnxw0u3V2KMrtdVYsexwpdnA5
	XUz4IKQOBNxaBluhdNYzL8zwlyI8CjvzruSXco86xKeQ6QX9cV0XiRUgx1SayqkGcLFTuuCdNcreN
	IYv72Eo9aa2ezSpHM/sq6jV2R3+vIjjFyGjsK/x2Nl8dUJj/GySOniPAkjktHMBS0gwug9YlUSVKk
	E1ANshGn7IEXwUCrQ0edmmtKumnnePMpDfJ7tvxXWWIUvjf8OwTHC7AAiHt93l6j9w58BEch4hds3
	CFiaDf4S4lSKklzGWwvE7xj7zzlkiYN9B3rJVXyRh4lviegYdZLL2jkzTg8CtU/F3vHY7hgsqJnoi
	sJS6vhrQ==;
Subject: Re: [PATCH net-next 16/24] net: netkit, veth, tun, virt*: Use
 nested-BH locking for XDP redirect.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Boqun Feng
 <boqun.feng@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Hao Luo <haoluo@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Juergen Gross <jgross@suse.com>,
 KP Singh <kpsingh@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 Nikolay Aleksandrov <razor@blackwall.org>, Song Liu <song@kernel.org>,
 Stanislav Fomichev <sdf@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Yonghong Song <yonghong.song@linux.dev>, bpf@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
References: <20231215171020.687342-1-bigeasy@linutronix.de>
 <20231215171020.687342-17-bigeasy@linutronix.de>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <74feb818-7109-cb1e-8eec-a037c17a2871@iogearbox.net>
Date: Mon, 18 Dec 2023 09:52:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20231215171020.687342-17-bigeasy@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.10/27126/Sun Dec 17 10:37:59 2023)

Hi Sebastian,

On 12/15/23 6:07 PM, Sebastian Andrzej Siewior wrote:
> The per-CPU variables used during bpf_prog_run_xdp() invocation and
> later during xdp_do_redirect() rely on disabled BH for their protection.
> Without locking in local_bh_disable() on PREEMPT_RT these data structure
> require explicit locking.
> 
> This is a follow-up on the previous change which introduced
> bpf_run_lock.redirect_lock and uses it now within drivers.
> 
> The simple way is to acquire the lock before bpf_prog_run_xdp() is
> invoked and hold it until the end of function.
> This does not always work because some drivers (cpsw, atlantic) invoke
> xdp_do_flush() in the same context.
> Acquiring the lock in bpf_prog_run_xdp() and dropping in
> xdp_do_redirect() (without touching drivers) does not work because not
> all driver, which use bpf_prog_run_xdp(), do support XDP_REDIRECT (and
> invoke xdp_do_redirect()).
> 
> Ideally the minimal locking scope would be bpf_prog_run_xdp() +
> xdp_do_redirect() and everything else (error recovery, DMA unmapping,
> free/ alloc of memory, …) would happen outside of the locked section.
[...]

>   drivers/net/hyperv/netvsc_bpf.c |  1 +
>   drivers/net/netkit.c            | 13 +++++++----
>   drivers/net/tun.c               | 28 +++++++++++++----------
>   drivers/net/veth.c              | 40 ++++++++++++++++++++-------------
>   drivers/net/virtio_net.c        |  1 +
>   drivers/net/xen-netfront.c      |  1 +
>   6 files changed, 52 insertions(+), 32 deletions(-)
[...]

Please exclude netkit from this set given it does not support XDP, but
instead only accepts tc BPF typed programs.

Thanks,
Daniel

> diff --git a/drivers/net/netkit.c b/drivers/net/netkit.c
> index 39171380ccf29..fbcf78477bda8 100644
> --- a/drivers/net/netkit.c
> +++ b/drivers/net/netkit.c
> @@ -80,8 +80,15 @@ static netdev_tx_t netkit_xmit(struct sk_buff *skb, struct net_device *dev)
>   	netkit_prep_forward(skb, !net_eq(dev_net(dev), dev_net(peer)));
>   	skb->dev = peer;
>   	entry = rcu_dereference(nk->active);
> -	if (entry)
> -		ret = netkit_run(entry, skb, ret);
> +	if (entry) {
> +		scoped_guard(local_lock_nested_bh, &bpf_run_lock.redirect_lock) {
> +			ret = netkit_run(entry, skb, ret);
> +			if (ret == NETKIT_REDIRECT) {
> +				dev_sw_netstats_tx_add(dev, 1, len);
> +				skb_do_redirect(skb);
> +			}
> +		}
> +	}
>   	switch (ret) {
>   	case NETKIT_NEXT:
>   	case NETKIT_PASS:
> @@ -95,8 +102,6 @@ static netdev_tx_t netkit_xmit(struct sk_buff *skb, struct net_device *dev)
>   		}
>   		break;
>   	case NETKIT_REDIRECT:
> -		dev_sw_netstats_tx_add(dev, 1, len);
> -		skb_do_redirect(skb);
>   		break;
>   	case NETKIT_DROP:
>   	default:

