Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rJG9CEGdJmpNZwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:45:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA1F655489
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 12:45:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UCyIA4gQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1331550.1594109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXTR-000373-2O; Mon, 08 Jun 2026 10:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331550.1594109; Mon, 08 Jun 2026 10:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWXTQ-00034q-Vh; Mon, 08 Jun 2026 10:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1331550;
 Mon, 08 Jun 2026 10:44:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWXTP-00034k-Tg
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 10:44:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWXTP-000QdW-6e
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 12:44:51 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a269d1e-bab6-0a2a0a5309dd-0a2a4504b0cc-16
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:44:51 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a269d22-1dec-0a2a45040019-d155dd2bacf3-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 12:44:51 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45ef6565cfdso1873268f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 03:44:51 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dc412sm53294874f8f.4.2026.06.08.03.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 03:44:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780915490; x=1781520290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKDQ2wv/rgCHv6dV+M56u6EmX6fs+Ff7nO8dvPP8YO0=;
        b=UCyIA4gQ83q8Mzb7fMJSqjebNtFEG47U6Mlj5/GzaIwrCKAhSHxmemQJoMBmx7xmnP
         3MA7GAICUJ42PY2M+178AjPQTxV6KRPwtpZrOtRGHYtTYbJBSCgt2PuWP3W/ES2AX239
         1k2pKYeHnP+QmvrMJEGx1CU0e7PyivKmyWQmZHM4pFBlFiXaXfsv26sGJ0DFH0nfHSzV
         G4EFUYIw7ZCDuJrXH+R4b1fr8AK/rdj6OZ/rS0ieKt/rd5ibzWYjokw+Sql0n8KNU4yL
         IH4mN7ESqgtdjrUNXeUJYeJgC7jQMdouWGuwBxXjzPojX0kbWUuLtgAJnE1UNR0PGayn
         Cp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915490; x=1781520290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKDQ2wv/rgCHv6dV+M56u6EmX6fs+Ff7nO8dvPP8YO0=;
        b=poKmC30dfwMaE/JJSOzs1o6eaWrEbxT73XviyjhU4nQ6nGbU/K0rkP33af5rl6Fd+G
         OWCwMq9sfOcKG6kpChsB8pfZwNgZld51VQIOKhx1y5szmd291H1Q2au6auLgy+6JQGWU
         BdEY90uHq0BRBMYGQNx2pc7sMCxsVEmd9YYeYSOk9/Vq2ZBQT/ItBanIeTVi3deJyMcB
         RUasAhb9+RfhJqIf37Bkn4g17S+tNy7BiQWZWqUAr+3opld3BGlSNuTT24a+Dx8gYRuo
         bRVtbqjGkP6gCke0da77CTQWsFrL/g4zZxq7+HVwgtEPGcSZeaw2WEswQGVKRoOwX4xI
         3UDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7OnzoShugyzSc9ZT6dPdPY+90HUHQ2Dh2dVU7wnm/R507FjbVAvRmLEvzSkChnbxpkNxR1TV7eek=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGRpgFN5+yGFxJ8laM201KpL6tAdf+KHYpvn3UAipFMShzoRxx
	RI/JQ/B7NGWOfU+i8rk6onYaBEJ0f2NlZO526gEhS81pKDVgZkxtbhpR
X-Gm-Gg: Acq92OEDmmv0+norMWWPpZbMYhUDItLte0AEVVAl+UJn1KOvnX/9bydRFG4XIfj+9NT
	cL+blTG7GTa8GPehU/9Olb3AQpMYl5I67pFwd1/5VfAsudrJzanI8k+RKfq38b/AxMVtoP/R4K6
	clCwC/cQcFGOkwjbibEmhpWn+1Bq9A2OT1lz3hLX9yJ/PrvQj93Yf9hWovQj5I6BdQHDS8+yyiW
	s4+vOk9bPa0ujAtDc9AvZxNzIaCqSZcryUozrVU/7e0cr5LYFUUTmcCoJkraHEM29xLi6JWOO6l
	rYeKVEpwzzb2yz5TspIIGGi6sewa6cuecIK9F2DL6LYI72+nq1WyYJjMHf4xLvLmJS07WDNu1cf
	02JuXPHtWoACpBfq9VutXNPFvInMkSkplVdtAkTNmIZUqRvdmAtRs0SZRHER9N7aN/rEyXXWZwT
	KvSyma9HMOQgrRysolRZ9iA5zc3cPzHY+18aMBDqj8n6yWbGB4n2zibAsUvDNAZVHS4+L4W8HhY
	3ej/vYECsbM4nwB
X-Received: by 2002:a05:6000:299c:20b0:441:2aee:d561 with SMTP id ffacd0b85a97d-460306578aemr16093022f8f.28.1780915490349;
        Mon, 08 Jun 2026 03:44:50 -0700 (PDT)
Message-ID: <62df450f-9b1b-4075-8e4d-5a43786d4709@gmail.com>
Date: Mon, 8 Jun 2026 12:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 0/6] CI: Update distros for build tests
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260605144213.2749656-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780915491-431663FF-A05297BF/10/73395122804
X-purgate-type: spam
X-purgate-size: 1742
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gitlab.com:url];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EA1F655489



On 6/5/26 4:42 PM, Andrew Cooper wrote:
> Refresh which distros we do build testing with
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2579549654
> 
> Andrew Cooper (6):
>    CI: Drop test-artefacts/Makefile
>    CI: Swap ocaml-nox for ocaml in newer Debian/Ubuntu
>    CI: Drop Ubuntu 16.04
>    CI: Add Ubuntu 26.04
>    CI: Update Fedora to 43
>    CI: Update Opensuse 15.6 to 16.0
> 
>   automation/build/debian/12-arm64v8.dockerfile |  2 +-
>   automation/build/debian/12-x86_32.dockerfile  |  2 +-
>   automation/build/debian/12-x86_64.dockerfile  |  2 +-
>   automation/build/debian/13-arm64v8.dockerfile |  2 +-
>   automation/build/debian/13-x86_32.dockerfile  |  2 +-
>   automation/build/debian/13-x86_64.dockerfile  |  2 +-
>   ...x86_64.dockerfile => 43-x86_64.dockerfile} |  4 +-
>   ...dockerfile => leap-16.0-x86_64.dockerfile} | 16 ++----
>   .../build/ubuntu/22.04-x86_64.dockerfile      |  2 +-
>   .../build/ubuntu/24.04-x86_64.dockerfile      |  2 +-
>   ..._64.dockerfile => 26.04-x86_64.dockerfile} | 15 ++++-
>   automation/gitlab-ci/build.yaml               | 57 ++++++++++---------
>   automation/tests-artifacts/Makefile           | 19 -------
>   13 files changed, 59 insertions(+), 68 deletions(-)
>   rename automation/build/fedora/{41-x86_64.dockerfile => 43-x86_64.dockerfile} (95%)
>   rename automation/build/opensuse/{leap-15.6-x86_64.dockerfile => leap-16.0-x86_64.dockerfile} (84%)
>   rename automation/build/ubuntu/{16.04-x86_64.dockerfile => 26.04-x86_64.dockerfile} (81%)
>   delete mode 100644 automation/tests-artifacts/Makefile

For the entire patch series:

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

