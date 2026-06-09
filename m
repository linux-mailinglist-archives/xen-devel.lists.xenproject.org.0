Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vEuKAbrRJ2pl2wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:41:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2065DE3A
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:41:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dKWqWxHi;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1332494.1594938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWs1M-0004AW-PG; Tue, 09 Jun 2026 08:41:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332494.1594938; Tue, 09 Jun 2026 08:41:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWs1M-00048E-Me; Tue, 09 Jun 2026 08:41:16 +0000
Received: by outflank-mailman (input) for mailman id 1332494;
 Tue, 09 Jun 2026 08:41:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWs1L-00047l-CD
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 08:41:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWs1K-003YLs-P5
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:41:14 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a27d1a4-e002-0a2a0a5209dd-0a2a4502c35e-18
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:41:14 +0200
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a27d1aa-af86-0a2a45020019-d155da2ac14b-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:41:14 +0200
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-bec2ddee9bbso1050061366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:41:14 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf054e05199sm970849666b.29.2026.06.09.01.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 01:41:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780994474; x=1781599274; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ew4eVulhO/j24238LYh8mVrzuEz/VHSDAEbbA69DBeo=;
        b=dKWqWxHi8/LTeLuQl/LEKo7owdbUFNmYGBteOZK4ihzNCLAsCXGXXmodBEtU37nRly
         EsKW83fF/dxtKe22UO6f+VThzy5BTzH9lwrSVWGyWgWlvcgwczgJCMsJ0sF+vFjaBF1d
         gfEbElXhgDynWJR3aUhYJostYsUrrxUuRGV3PJUd1IhO43gCNQI9iuzrK+1enW3KWqZD
         y+SZMuwq20f/eol+sNCv0D+2M+vH7RIA+y2NmR9msj8Yv5jyTqX02cBRMjJ+S8VXsrHF
         +OEfhLdwh/8iLHmYb+1rK4gjQxCD+ZWjiHNoI5Gwa+uIk8Ls+XJN5NENQE+DJP/sy9Fd
         Xmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994474; x=1781599274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ew4eVulhO/j24238LYh8mVrzuEz/VHSDAEbbA69DBeo=;
        b=kVTyWGXEh11/qtuuK/Z0XZ3Nq1/S8YiYak0Sbfb8ikllNjlhPxCup/gDRKG5kfuD76
         YQT2ziBCmqkBQYMCjqkwnoFQubCfjcE9hMXOPaikPlFrls5QbletfkMkcQtenX5JaCka
         ZVNNYKIF/qsD4qeOkSewlAjTM3T9OxFQbpa1ljHygSNFtUSozPFNY6x+W5wZIfmQk77W
         zE3U95uvo6j8fng+BYyRaoRWGohO+ynjTcSrxIbNnCgcXJIdnBvFqHZbO69RTu36rSNV
         psMICz5ny4MDHJlpEKdRHNMbA5AezaAgi8IVFmfbvHppSU27fLBshJwCzvwStzcRY2Gz
         VbYg==
X-Gm-Message-State: AOJu0YwHyyF1Sy0A4dahvpKU2nUiFvGuRiBsymDz0nUhFboIzCDxqFs5
	yTyDKA1NjwjRmy5tTuF9LFhk9gLbQbSXr9DLWzO4GQEU7xxALjbohXdM
X-Gm-Gg: Acq92OEDlmVOkUPhUuvgJ5+oN+5ZJeAe/SUvD1fyCojWuHGBCTaLktczjNbLq6vPXWH
	SVJUAFRGYusYbLrSRteXiV/MbtmXuwZ0FtyrEpQPl4QozJP+G1mF4j0Lw0HCsskYjHd1JQlGoyc
	1W491EmNsS6AZKjIIQlngHLGINBdrzb3c+qdFUkNb+u5z20sKiIAzCG2W0WOocIdQ6JrndRc1f3
	OjPTqL35r8jSmU66OR7tqShQuJRagkXi9yYTWKy65XbujpFLPZ9sT4bVcLTjbhNepd20Qis3VjK
	uWNoz71jR8FnwQ8PaZchcdUH9iGhhbxVwyJMpfMHCFiSRDcWRsYMv+bK35y/zAdnmYmgn3lXtND
	HHMZ17ZGG8/PXU7JEnsSDtLvPjHwTj0Wg8Vgytzs9PaKmxmks1PSQKwDi5mu2UEXXEUW+R7olNI
	pHN7CZjIz2H6TFatzcIwUxfl1+YtXhLM0Y6qR2HPONCjwhXNCn+4qmzjQfWbQbPXbilbFEHQwOf
	f6QVPozzT9GXBa5
X-Received: by 2002:a17:907:75c2:b0:bec:db41:e4ae with SMTP id a640c23a62f3a-bf3737ebea2mr645485366b.43.1780994474066;
        Tue, 09 Jun 2026 01:41:14 -0700 (PDT)
Message-ID: <ea814415-40ce-4a53-8838-f660bf32aa4c@gmail.com>
Date: Tue, 9 Jun 2026 10:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22?] xen/sched: remove duplicate trace.h include
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Furkan Caliskan <frn1furkan10@gmail.com>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com, dfaggioli@suse.com,
 gwd@xenproject.org, stewart.hildebrand@amd.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com
References: <20260531140819.73467-1-frn1furkan10@gmail.com>
 <aia9KAdYMxbZsihD@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <aia9KAdYMxbZsihD@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780994474-AB563161-A3FCA67E/10/73395122804
X-purgate-type: spam
X-purgate-size: 523
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:frn1furkan10@gmail.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:stewart.hildebrand@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[citrix.com,gmail.com];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CA2065DE3A



On 6/8/26 3:01 PM, Roger Pau Monné wrote:
> On Sun, May 31, 2026 at 05:08:19PM +0300, Furkan Caliskan wrote:
> 
> Fixes: 8726c0557752 ("xen: add real time scheduler rtds")
> 
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> 
> Given this is non-functional change, and has a reviewed-by, what do
> you think Oleksii, should be commit it for 4.22?
> 
As it is non-functional we could consider it for 4.22:
  Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

