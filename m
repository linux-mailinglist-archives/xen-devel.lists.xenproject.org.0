Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SDh0CbR8S2rxSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 12:00:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D6870ED8F
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 12:00:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=d3UlhGgX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355291.1610057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgg7N-0004Eu-A3; Mon, 06 Jul 2026 10:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355291.1610057; Mon, 06 Jul 2026 10:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgg7N-0004C0-6Z; Mon, 06 Jul 2026 10:00:01 +0000
Received: by outflank-mailman (input) for mailman id 1355291;
 Mon, 06 Jul 2026 09:59:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgg7L-0004Bu-EU
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:59:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgg7K-008l2D-8Z
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:59:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4b7c9c-bab6-0a2a0a5309dd-0a2a4502d27e-10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:59:58 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4b7c9e-5a27-0a2a45020019-d155802ad8df-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:59:58 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493b786d6c0so14679115e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 02:59:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c637bc21sm646753725e9.7.2026.07.06.02.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 02:59:57 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783331998; x=1783936798; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRAhF4U1NYot2dtfZsaGtrwjxvypnClVIDgYlq1+2xQ=;
        b=d3UlhGgXmRIloM4hCCnSo2IU2lh3I+znEfZPDCZ+BuYOsCg243KvW8Y70O1a7wT2cN
         C0xkcYmEtYQBQPrCmr+zkJdzRFQBeFlGRXF99j8JASCN4trq0BVH87BxgaxvePpHHoOR
         3cE5eJW8sG/OU7i+z6HA//gXzaDI/yAMoLPQKhYkzmhH3voy41bS19Jg/vpnvVeiyDyq
         /7Lffvaw9Q318PS7sjAHEDWQ1gL3hJUH+ss84f81gjmB/btVajREfwS4Fcza+8nhXas9
         /+CEjIszFVlIL3TCoCHfNUJdN/pHXD85lNQim51rGnnYZVYRCBtO8J2QjuSjruDav5w3
         llmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331998; x=1783936798;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRAhF4U1NYot2dtfZsaGtrwjxvypnClVIDgYlq1+2xQ=;
        b=bX5X3EAtN/+tpVZtUCaKn7RzrB70pmw9FV77FKD5ywZt7X44VhEgHjUMIlM8YI+DZv
         H6Rn7rl5ca1ncyiA8KrgsKvvsmIfQgNrUoKsaoXYZaYuQLrgUpBhJ0jX4lIzM7hhZ6Uw
         p/abZK7hsi/DiUdC+kxiqjdhm5H9iMWa/jCv1/6VVEpvyALtyTdcZJzjzunMtp0rE5eF
         /2lhPYLul5dJxwVe6nqaD+R2Moe6VMy4/AuKWRbmjAQMq5DDVXnDhBSU0y3HtTcPa4Vb
         Oym/6TR7B/HLV7REdP0r1vKsIHMU7ynbQrcckMLWwhwdO2qRaQDM/y6xtTjgD5FAT2ow
         3I1A==
X-Forwarded-Encrypted: i=1; AHgh+RpRMpxc6BlZAaryrotViyGWz3PZ5i8xb9sBZrKl08Ps6LcTtbznWQgWKJwXZAjf2sdiqPdxkFBZHOU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+DNbg1R9kLMv/pgHaJ+EM0+U3MF5t80HH42w8RSKLXfMafoSN
	XMIgCH+J1dHzdiL6z/0mRp+r4IQ23rLkEIYrCnzC7lZaP5EGtnBlnNRn
X-Gm-Gg: AfdE7cl8r+sSjw1PQqRDxq2RRkuYegSa8aff6nEKv02SplaWTJstWD/w60yHzvWUWNk
	4O0KkSe46TsNATyqvIPAkahZKj/LqFqy1gAXiibFkXVHaTPxwSZMt+HwxDLoqw3vK511+oHnEhU
	hJ15sM7vVMvZ1RedqM1WVh0DBfnmei2OhBBkW0D/j+sM/WE0BzlMJJRp/+GRkyURGx8R7v+s3ls
	HN4NB7wpbebW4H20AUTUfJeMUhFXX7Jm+72Bli7WXr89KLIz6Nijw5Q46vq+KvBxMyuqH42uzRW
	BGfnzliXHTFuc0n/wo4ECe77mATXTVGkimlhBJySWQhkXnmUXzfuFnnf/+4GyTvDjiCsWX4G1zp
	g+pbshpIhvYRpJLXDljOvt4OlZTkskSDqD/W4IZSn/1ktyG76WS7eMMBrf6rDL0OSzIHxoZym9L
	PgB51YLaPBrPZhSA1I4jGxs/HL4L6DiGm+UDBXwenn35QHnAiTmy5lNQDbleIqqPd1lI0=
X-Received: by 2002:a05:600c:198d:b0:493:bb6b:5bb5 with SMTP id 5b1f17b1804b1-493d11db4c1mr112111635e9.13.1783331997497;
        Mon, 06 Jul 2026 02:59:57 -0700 (PDT)
Message-ID: <4cf90f7a-d45e-4b60-bc4e-1d7a7b0d715f@gmail.com>
Date: Mon, 6 Jul 2026 11:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] CHANGELOG: add entry for removed c-stubdom
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>
References: <20260706090521.1992123-1-jgross@suse.com>
 <20260706090521.1992123-3-jgross@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260706090521.1992123-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783331998-545187C5-C75D1FA6/10/73395122804
X-purgate-type: spam
X-purgate-size: 880
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,xenproject.org:url,suse.com:email,changelog.md:url];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3D6870ED8F



On 7/6/26 11:05 AM, Juergen Gross wrote:
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   CHANGELOG.md | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ef4e6ae9c4..fc9840c5d2 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -15,6 +15,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - The kexec "v1" interface, which was declared obsolete in Xen 4.4 (2013).
>        The only known user was the classic-xen fork of Linux.  This does not
>        affect Xen kexec support in the kexec-tools package.
> +   - The example stubdom "c-stubdom" has been removed.
>   
>   ## [4.22.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
>   

Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

