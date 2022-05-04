Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4496E5196E4
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 07:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320097.540982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7OB-0005hI-M4; Wed, 04 May 2022 05:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320097.540982; Wed, 04 May 2022 05:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm7OA-0005JO-JS; Wed, 04 May 2022 05:17:26 +0000
Received: by outflank-mailman (input) for mailman id 320097;
 Wed, 04 May 2022 03:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozbP=VM=kernel.org=gustavoars@srs-se1.protection.inumbo.net>)
 id 1nm5ac-0000p6-IW
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 03:22:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 615b0ec5-cb59-11ec-a406-831a346695d4;
 Wed, 04 May 2022 05:22:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 18892B8232A;
 Wed,  4 May 2022 03:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A314DC385A4;
 Wed,  4 May 2022 03:21:57 +0000 (UTC)
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
X-Inumbo-ID: 615b0ec5-cb59-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651634526;
	bh=CbH7e4NC57tInXkJXSsd/52EmX/XddNYerXxPthi51M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIwdXVh+VV/zYYIjKLXr4Szv2+RVCJso7Yrna+VEBVSMJIQebRGfEQocYWQ9qhBs9
	 dQhrwZuigtil9oBZ0XW5HelOufcdZFi1O1bEAbcRZ9J3x10G9yhO9l+C09ZtlmyZZw
	 GpucC3kt0l5cbMUvCa/VeS02litV5lRqA8iw3KlM+jhY2mY8KWgoCBOGbAq/+BTRhA
	 S5YyOElAtqNxHS/8Wxq/re4LfIWS6fv/NGLYVJZNcc3jPTL6Uv6dSAbPCH8oAPDBUW
	 0SnkgLUJaaLFnOfHJVoL8Ba5zNeTdXKoSb3ecp2gjmvxidB+mHtoYDlFTsxQh+zp9M
	 5qO0Pg46G3n2A==
Date: Tue, 3 May 2022 22:31:05 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Rich Felker <dalias@aerifal.cx>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>, alsa-devel@alsa-project.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Gross <agross@kernel.org>, Andy Lavr <andy.lavr@gmail.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Baowen Zheng <baowen.zheng@corigine.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bradley Grove <linuxdrivers@attotech.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	Christian Brauner <brauner@kernel.org>,
	Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Chris Zankel <chris@zankel.net>,
	Cong Wang <cong.wang@bytedance.com>, Daniel Axtens <dja@axtens.net>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	David Gow <davidgow@google.com>,
	David Howells <dhowells@redhat.com>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>, Eric Paris <eparis@parisplace.org>,
	Eugeniu Rosca <erosca@de.adit-jv.com>,
	Felipe Balbi <balbi@kernel.org>,
	Francis Laniel <laniel_francis@privacyrequired.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hulk Robot <hulkci@huawei.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	James Morris <jmorris@namei.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Keeping <john@metanate.com>, Juergen Gross <jgross@suse.com>,
	Kalle Valo <kvalo@kernel.org>, Keith Packard <keithp@keithp.com>,
	keyrings@vger.kernel.org, kunit-dev@googlegroups.com,
	Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee.jones@linaro.org>, Leon Romanovsky <leon@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-xtensa@linux-xtensa.org, llvm@lists.linux.dev,
	Loic Poulain <loic.poulain@linaro.org>,
	Louis Peens <louis.peens@corigine.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>,
	Muchun Song <songmuchun@bytedance.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>, Paul Moore <paul@paul-moore.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, selinux@vger.kernel.org,
	"Serge E. Hallyn" <serge@hallyn.com>,
	SHA-cyfmac-dev-list@infineon.com,
	Simon Horman <simon.horman@corigine.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org, Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH 01/32] netlink: Avoid memcpy() across flexible array
 boundary
Message-ID: <20220504033105.GA13667@embeddedor>
References: <20220504014440.3697851-1-keescook@chromium.org>
 <20220504014440.3697851-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504014440.3697851-2-keescook@chromium.org>

On Tue, May 03, 2022 at 06:44:10PM -0700, Kees Cook wrote:
> In preparation for run-time memcpy() bounds checking, split the nlmsg
> copying for error messages (which crosses a previous unspecified flexible
> array boundary) in half. Avoids the future run-time warning:
> 
> memcpy: detected field-spanning write (size 32) of single field "&errmsg->msg" (size 16)
> 
> Creates an explicit flexible array at the end of nlmsghdr for the payload,
> named "nlmsg_payload". There is no impact on UAPI; the sizeof(struct
> nlmsghdr) does not change, but now the compiler can better reason about
> where things are being copied.
> 
> Fixed-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Link: https://lore.kernel.org/lkml/d7251d92-150b-5346-6237-52afc154bb00@rasmusvillemoes.dk
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Rich Felker <dalias@aerifal.cx>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/uapi/linux/netlink.h | 1 +
>  net/netlink/af_netlink.c     | 5 ++++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/netlink.h b/include/uapi/linux/netlink.h
> index 855dffb4c1c3..47f9342d51bc 100644
> --- a/include/uapi/linux/netlink.h
> +++ b/include/uapi/linux/netlink.h
> @@ -47,6 +47,7 @@ struct nlmsghdr {
>  	__u16		nlmsg_flags;	/* Additional flags */
>  	__u32		nlmsg_seq;	/* Sequence number */
>  	__u32		nlmsg_pid;	/* Sending process port ID */
> +	__u8		nlmsg_payload[];/* Contents of message */
>  };
>  
>  /* Flags values */
> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index 1b5a9c2e1c29..09346aee1022 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -2445,7 +2445,10 @@ void netlink_ack(struct sk_buff *in_skb, struct nlmsghdr *nlh, int err,
>  			  NLMSG_ERROR, payload, flags);
>  	errmsg = nlmsg_data(rep);
>  	errmsg->error = err;
> -	memcpy(&errmsg->msg, nlh, payload > sizeof(*errmsg) ? nlh->nlmsg_len : sizeof(*nlh));
> +	errmsg->msg = *nlh;
> +	if (payload > sizeof(*errmsg))
> +		memcpy(errmsg->msg.nlmsg_payload, nlh->nlmsg_payload,
> +		       nlh->nlmsg_len - sizeof(*nlh));

They have nlmsg_len()[1] for the length of the payload without the header:

/**
 * nlmsg_len - length of message payload
 * @nlh: netlink message header
 */
static inline int nlmsg_len(const struct nlmsghdr *nlh)
{
	return nlh->nlmsg_len - NLMSG_HDRLEN;
}

(would that function use some sanitization, though? what if nlmsg_len is
somehow manipulated to be less than NLMSG_HDRLEN?...)

Also, it seems there is at least one more instance of this same issue:

diff --git a/net/netfilter/ipset/ip_set_core.c b/net/netfilter/ipset/ip_set_core.c
index 16ae92054baa..d06184b94af5 100644
--- a/net/netfilter/ipset/ip_set_core.c
+++ b/net/netfilter/ipset/ip_set_core.c
@@ -1723,7 +1723,8 @@ call_ad(struct net *net, struct sock *ctnl, struct sk_buff *skb,
                                  nlh->nlmsg_seq, NLMSG_ERROR, payload, 0);
                errmsg = nlmsg_data(rep);
                errmsg->error = ret;
-               memcpy(&errmsg->msg, nlh, nlh->nlmsg_len);
+               errmsg->msg = *nlh;
+               memcpy(errmsg->msg.nlmsg_payload, nlh->nlmsg_payload, nlmsg_len(nlh));
                cmdattr = (void *)&errmsg->msg + min_len;

                ret = nla_parse(cda, IPSET_ATTR_CMD_MAX, cmdattr,

--
Gustavo

[1] https://elixir.bootlin.com/linux/v5.18-rc5/source/include/net/netlink.h#L577

