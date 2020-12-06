Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3962D041F
	for <lists+xen-devel@lfdr.de>; Sun,  6 Dec 2020 12:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45615.81057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klsZ8-0007k6-RA; Sun, 06 Dec 2020 11:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45615.81057; Sun, 06 Dec 2020 11:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klsZ8-0007jh-OD; Sun, 06 Dec 2020 11:50:58 +0000
Received: by outflank-mailman (input) for mailman id 45615;
 Sun, 06 Dec 2020 11:50:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PoKi=FK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1klsZ7-0007jc-1P
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 11:50:57 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c1b59f2b-76c4-45b2-9d98-fb1505625120;
 Sun, 06 Dec 2020 11:50:56 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-BMajkwIfPnmK6VH6JJ9Bew-1; Sun, 06 Dec 2020 06:50:52 -0500
Received: by mail-ed1-f71.google.com with SMTP id ca7so4521800edb.12
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 03:50:51 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id m7sm7840045ejr.119.2020.12.06.03.50.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 03:50:49 -0800 (PST)
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
X-Inumbo-ID: c1b59f2b-76c4-45b2-9d98-fb1505625120
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607255455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QXN11YjZ1vXjJBEYEKORWd+AxNil9vOhCUsNnGsnr90=;
	b=EBE+gLP1VnuZXkYYJXL5Tc1+GLAbpusfPwc0dNuTzw7ukVxINXFXPAqy+8ijESSE1m5UmA
	V6jE7nS8qPYnVABjwlIG5tvbXiVntISRAhVIdQ6BbnOMaHChg7qZoZo6EeSHlhnB4haDtQ
	Tb+BSyPxNxniUR9Lj2nUKOv1nvESOtI=
X-MC-Unique: BMajkwIfPnmK6VH6JJ9Bew-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QXN11YjZ1vXjJBEYEKORWd+AxNil9vOhCUsNnGsnr90=;
        b=KaDTtXdx90ZYAb44gMZ4Bg/C05a2PGnc/GKi6LrJbeLAFq+h08mLC1jB/Y+F/AvPBx
         b+M6E9t1si3xxJSgPqMUGQ5fPhi2+2MnVKvFCc9uiqiKc+uME4xELSHEMe69uBG32yaU
         RdlrayVoFyD2KeeibLUXds7lb3au3cUm87RHTwH3lkAP2ZAFPd8oyRJZWr4GRT9JBWzG
         TaX3N3tXQJ6ZjjxgtvJhRTHOnxffh3P61Kp9smftb9+/18ORxffzEj9jM+APt9wuN4cc
         /RFJYbUCov+ENXUemzrL1SZmoDlY/Ep6ibRPjdk2Fmb3eDihsEO/+EmFEMAhgTG3J9CN
         qlPA==
X-Gm-Message-State: AOAM531I8Ug8A2HNHN8jj579YTube+jM8K1dvRBwRp8mjwYqBEzzOYhw
	8nesKUDxHORTOhGIxecV3v6VV80SuPSBnh9Lpwqv6I3N0RTPN8RwRflc8N9V5J+StvONFsjRG5Z
	ktqXfgF8a7LCTKb1UmE6bXdTGqXs=
X-Received: by 2002:a17:907:3312:: with SMTP id ym18mr14924839ejb.437.1607255450929;
        Sun, 06 Dec 2020 03:50:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVzHdQ0gd9y0fPcxXvPsBOb9NLjGt7VCscZxHh6SgyV32IoDz5VTi23v/85YihGGm/4+5V7A==
X-Received: by 2002:a17:907:3312:: with SMTP id ym18mr14924825ejb.437.1607255450726;
        Sun, 06 Dec 2020 03:50:50 -0800 (PST)
Subject: Re: [PATCH 3/3] net: checksum: Introduce fine control over checksum
 type
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Joel Stanley <joel@jms.id.au>, Beniamino Galvani <b.galvani@gmail.com>,
 Zhang Chen <chen.zhang@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
References: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
 <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9f8cdb69-7b74-4034-223f-bfa62cb4e440@redhat.com>
Date: Sun, 6 Dec 2020 12:50:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607220847-24096-3-git-send-email-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ben,

On 12/6/20 3:14 AM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present net_checksum_calculate() blindly calculates all types of
> checksums (IP, TCP, UDP). Some NICs may have a per type setting in
> their BDs to control what checksum should be offloaded. To support
> such hardware behavior, introduce a 'csum_flag' parameter to the
> net_checksum_calculate() API to allow fine control over what type
> checksum is calculated.
> 
> Existing users of this API are updated accordingly.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
>  hw/net/allwinner-sun8i-emac.c |  2 +-
>  hw/net/cadence_gem.c          |  2 +-
>  hw/net/fsl_etsec/rings.c      |  8 +++-----
>  hw/net/ftgmac100.c            | 10 +++++++++-
>  hw/net/imx_fec.c              | 15 +++------------
>  hw/net/virtio-net.c           |  2 +-
>  hw/net/xen_nic.c              |  2 +-
>  include/net/checksum.h        |  7 ++++++-

When sending a such API refactor, patch is easier to
review if you setup the scripts/git.orderfile config.

>  net/checksum.c                | 18 ++++++++++++++----
>  net/filter-rewriter.c         |  4 ++--
>  10 files changed, 41 insertions(+), 29 deletions(-)
...
> diff --git a/include/net/checksum.h b/include/net/checksum.h
> index 05a0d27..7dec37e 100644
> --- a/include/net/checksum.h
> +++ b/include/net/checksum.h
> @@ -21,11 +21,16 @@
>  #include "qemu/bswap.h"
>  struct iovec;
>  
> +#define CSUM_IP     0x01

IMO this is IP_HEADER,

> +#define CSUM_TCP    0x02
> +#define CSUM_UDP    0x04

and these IP_PAYLOAD, regardless the payload protocol.

> +#define CSUM_ALL    (CSUM_IP | CSUM_TCP | CSUM_UDP)

Maybe CSUM_HEADER / CSUM_PAYLOAD / CSUM_FULL (aka RAW?).

> +
>  uint32_t net_checksum_add_cont(int len, uint8_t *buf, int seq);
>  uint16_t net_checksum_finish(uint32_t sum);
>  uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
>                               uint8_t *addrs, uint8_t *buf);
> -void net_checksum_calculate(uint8_t *data, int length);
> +void net_checksum_calculate(uint8_t *data, int length, int csum_flag);
>  
>  static inline uint32_t
>  net_checksum_add(int len, uint8_t *buf)
> diff --git a/net/checksum.c b/net/checksum.c
> index dabd290..70f4eae 100644
> --- a/net/checksum.c
> +++ b/net/checksum.c
> @@ -57,7 +57,7 @@ uint16_t net_checksum_tcpudp(uint16_t length, uint16_t proto,
>      return net_checksum_finish(sum);
>  }
>  
> -void net_checksum_calculate(uint8_t *data, int length)
> +void net_checksum_calculate(uint8_t *data, int length, int csum_flag)
>  {
>      int mac_hdr_len, ip_len;
>      struct ip_header *ip;
> @@ -108,9 +108,11 @@ void net_checksum_calculate(uint8_t *data, int length)
>      }
>  
>      /* Calculate IP checksum */
> -    stw_he_p(&ip->ip_sum, 0);
> -    csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
> -    stw_be_p(&ip->ip_sum, csum);
> +    if (csum_flag & CSUM_IP) {
> +        stw_he_p(&ip->ip_sum, 0);
> +        csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
> +        stw_be_p(&ip->ip_sum, csum);
> +    }
>  
>      if (IP4_IS_FRAGMENT(ip)) {
>          return; /* a fragmented IP packet */
> @@ -128,6 +130,10 @@ void net_checksum_calculate(uint8_t *data, int length)
>      switch (ip->ip_p) {
>      case IP_PROTO_TCP:
>      {
> +        if (!(csum_flag & CSUM_TCP)) {
> +            return;
> +        }
> +
>          tcp_header *tcp = (tcp_header *)(ip + 1);
>  
>          if (ip_len < sizeof(tcp_header)) {
> @@ -148,6 +154,10 @@ void net_checksum_calculate(uint8_t *data, int length)
>      }
>      case IP_PROTO_UDP:
>      {
> +        if (!(csum_flag & CSUM_UDP)) {
> +            return;
> +        }
> +
>          udp_header *udp = (udp_header *)(ip + 1);
>  
>          if (ip_len < sizeof(udp_header)) {
...


