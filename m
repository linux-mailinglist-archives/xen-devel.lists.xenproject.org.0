Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPxUC6yoHWp+cwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:43:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FA9621F26
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323930.1589592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4nD-0005WY-8A; Mon, 01 Jun 2026 15:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323930.1589592; Mon, 01 Jun 2026 15:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4nD-0005UK-5S; Mon, 01 Jun 2026 15:43:07 +0000
Received: by outflank-mailman (input) for mailman id 1323930;
 Mon, 01 Jun 2026 15:43:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wU4nB-0005UE-Ub
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:43:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4nA-0007Xy-SD
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:43:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1da872-bab6-0a2a0a5309dd-0a2a4509c6a0-30
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:43:04 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1da888-2497-0a2a45090019-d155da2dd1a7-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:43:04 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-bd8f9725b30so1926620266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 08:43:04 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bee94d11126sm44062766b.27.2026.06.01.08.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 08:43:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780328584; x=1780933384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAyvQtV53kogeTynDhXEvfhSBP8dxmy+KuhL2EGcK54=;
        b=X0cjCm+mUU74woIfkqKGSPLkk/SS8WKgnHBVlpkXTEDz2woOgA8UKnvjvlUc6SbNRx
         cKETgB5OzDHbge7R5TYyg+0E7oSwRoK/cgLRWGv12zvm+2se9nUU1t86DQCXSvAASvt2
         RGVJCUr7ShoY9asfW9A9AYKq5+vOBeC7VPynhj3JKkKYGlCJsRSKZpj6Sf1RgCP7Rdkf
         pm9oxV7D8ikeRmisZoWYPnrKDDYrU4EATLUkAOGs1ygU/ieAu4qt3kBvXzLAYZfikV9q
         mLfJTJReS1rarH+rsBsCJv588doXCK/rrF6pAjN5UOaKuE0UcRndUbV+fqNzV/mwopQm
         Oo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780328584; x=1780933384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAyvQtV53kogeTynDhXEvfhSBP8dxmy+KuhL2EGcK54=;
        b=VPv9OFpWBmZA1NTBlKh5tj1gnRFBJOE0OQX+w2vnvrvQssg1yxXs0r16yjHpY6HayH
         +FSgVbYFNzjhMSgdQBjBHskGx/pKAKwVF5/6CtcW3tE7GZRF2eEtPzoBMQFow+QL/N4D
         2DqaaHs+QCy6XyfkQ77E7yHm4CVG+BOw9cOF0uo34pVBlFWixvdl8qViRRF/GRqeJmcH
         cim/w6cIqktdYnarWqoVDxptwJUwtAbsczXOdM8mn7SmXC+UKHW3kk6UyrED0qrXsfqR
         RESqSgKDsaijM88WS+Wax09v6B4DS+Go8VafPASaobW7HZoGXNbCPn35Vby3ggdtpwkr
         aq2w==
X-Forwarded-Encrypted: i=1; AFNElJ/O5CdTuXsX95K3qv+jMya/drtCIkvHewkOBNXtA0biXVXUP4pTExiKL7Y5Mz4ymhAhFcultN7AWkQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK1DGLYmOVmrASGK2kSJCJ8GxPrZ0jZ4J4NTa8HAmX3JhbO6H0
	4W+Z8+Jz7f6/o4/3nQ/JIHYj0Nu/4ZdoRPVNzwTjMVwvLg3EVlDOBI1V
X-Gm-Gg: Acq92OEy5O4bD77pv0RJEAbtD/eztZoRAyOaaSzAvYuOngVjeY2WH74e3lnJnOPCS63
	KyIgEcqMzc7bjMhIwSzuPfJuyqVwFg57nOHTZwq34ns0N+AFxFcl137wPYfjd2NPEtvDKbs/yKM
	UAbuWjLj4nNxWZ86xHe2wTjPToKjTWhEA5VzGic0w5QgOXIuioPQR3CuG+gdlhcIbO1zKaT+yZB
	IVzzulAEMy5sgHqaf761F2HGR8aOJdPCqM44e4F3bbJ9cggDLVUjDvDqC4aPxuk2PyWslMadn7G
	YadHLk3UDklShU8R+rltOyF1CY3XCG9Xkw/8EA3u5aGpK8WdiQpe+4cR494lVbSRgPvk6IXPnzW
	ryFjIQiqOmI/Za7lsAmBiShCGPzxYnT6zD55jXzAgnAUuEdE9AIyjMxRiFUQre3ioJ6qpOgAiwd
	jYGb1UmuotdB29NamrawvBk55dS2lz+/onIweWTHyYWRR55zSd2sEbifCfr1qmPqber6cDTGNxR
	DBWkQMS/7O1SRTMB5efrM2G7Ak=
X-Received: by 2002:a17:907:d405:b0:bd5:2ed4:4ef6 with SMTP id a640c23a62f3a-beab01dd693mr602695666b.19.1780328584061;
        Mon, 01 Jun 2026 08:43:04 -0700 (PDT)
Message-ID: <1667afb5-855c-416f-986d-26ad3854928c@gmail.com>
Date: Mon, 1 Jun 2026 17:43:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Config.mk: Pin QEMU_UPSTREAM_REVISION
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260601152709.2588210-1-andrew.cooper3@citrix.com>
 <20260601152709.2588210-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260601152709.2588210-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780328584-4216DA53-12D8FC00/10/73395122804
X-purgate-type: spam
X-purgate-size: 1226
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:email,vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C1FA9621F26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 6/1/26 5:27 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   Config.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.mk b/Config.mk
> index b3d48e49c70a..86a4999246d1 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -214,7 +214,7 @@ OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
>   OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
>   
>   QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
> -QEMU_UPSTREAM_REVISION ?= master
> +QEMU_UPSTREAM_REVISION ?= e064f42c80be6f6ff8c12dcb2a663bdf70f965f6
>   
>   MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
>   MINIOS_UPSTREAM_REVISION ?= b6f79f5f44cf69044079c042b88fe9d75367642e

LGTM:
  Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


