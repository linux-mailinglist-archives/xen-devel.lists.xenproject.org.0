Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UkqoGatrImrWWwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 08:24:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C1645794
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 08:24:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=W8ZJfIeT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1328966.1593176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVNxi-0004UQ-Mq; Fri, 05 Jun 2026 06:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328966.1593176; Fri, 05 Jun 2026 06:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVNxi-0004Rj-JB; Fri, 05 Jun 2026 06:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1328966;
 Fri, 05 Jun 2026 06:23:21 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVNxg-0004Rd-Va
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 06:23:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVNxf-00Ce26-Tu
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:23:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a226b47-2eae-0a2a0a5409dd-0a2a4508d2e4-48
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 08:23:19 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a226b56-63b5-0a2a45080019-d155802cbccb-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 08:23:18 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490b4e1ade7so15952005e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:23:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3cc140sm154524065e9.9.2026.06.04.23.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 23:23:17 -0700 (PDT)
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
        d=suse.com; s=google; t=1780640598; x=1781245398; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nf9yLnrBFeNuKKQQGzkZUzGc6CQEd4uHWzs2/C+fjgQ=;
        b=W8ZJfIeTNrN2Tl5E0o5xJv1BAKAQNMD4lou322tZHpoNT/O23Xs6Lf0K3L2K67zkgR
         mMuPloi2icz36uRzbkBypGsiHtJbCXSGd8/4PiSqVgRLa9asIn+H6K9amHXqfatcDa0Y
         G9HgiuhiPTUPoQRMAZe3WVX4iOijSscLgkHoIvsSn85FUQxMSJ8Awe302PSY71Y2fUdW
         AUUB9b3kX8seUUREekw2aBswl3sTAaXpQ/WTf6P4rJCeiGEa33Qt10WU4miMfLqh6XLh
         tivKF5HqdFYJ16mJB+oSgrwwIOBpQrkpwI/uJ8IHNLt1JIcZVtfarlrrlZAJAC/LiUrm
         1Ntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640598; x=1781245398;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf9yLnrBFeNuKKQQGzkZUzGc6CQEd4uHWzs2/C+fjgQ=;
        b=pKty+kaKYGX2d5fW2Aa6dt5jDoCQhZeg6wFRVQvpi1Tjc0erDNrDsKMOGP6OLIDqx2
         Tk94G7Rr0V5h/Hj7f6mRoz+cbl5nZBzNk4lrlLY1XIDAZQggaJ0STpf+gtugDh1dAvgM
         HzDYxLwsvpfdhUAaESWI8zs70lVxJ1eCuEmoCvIlg9uyaF1RdbjGpIh+klu2gucF0DSJ
         K0GfTxEsGQOglsvSQY2IkVqx06fOMjj72Z/mS8rUbbQCmyyQJX37MxoujNvUOoGsHznQ
         fGIP/7lDdqlGFfxtwUArouackuE6dl7wbCBWk240aUi5tLo2Vq/iXqGWowsKY0LQcPoF
         WOIw==
X-Forwarded-Encrypted: i=1; AFNElJ9STkBnGHIhhpcIiOwPNgtlshXBPT8iZg1KEUXaajiA94RIvMuEEvKAJkNIQ9gMonsvuNhV8/N1LBU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxsm9ljSr7Hqn6y9+tfXlymelbnVU/XxJg6+ijNTiiNw7n8fwuv
	kDsovcT0TSSQiczXPRSYGXvLcl/C7eqwAH9OZsMKyfTr6zL0zkSnP+jPTeuvIwKNKg==
X-Gm-Gg: Acq92OEDrEuHu7T89Rn4h70Pt4NqZqeyoVq2I75TPPEIe2hJPxbYQRZahm7qbVNw89M
	iU0ugYgmPAELnH9VNM8GXdOzQCl5A/xJu4P6uRhoEDidG9Ew7a+XBCfw8sFtWY04+ZraSIjwL0E
	hs08vdCZvq9xiQHT5kRK/swOv0B/PsVTQtPe6iaYVy+a0g+HVsAW9yJN5v24NBt1gYPpxAqW+/S
	gF5eQENa2REEOmVxTzyLRz1kdkUJHYDKahEbobDlmBgSr2+RFB8KaKkF3GVuvPJyIX3hY+Quizb
	Vqd0y0Vmw+M05gV2ZRjQeyHCkT1Xc27G0YaYgQXT2lcPRkjNCOPhxDitVQyk1Htd/gSUwOiyTUP
	N59+Up/qU34ozmwW+S+hQVHAY0J76ffFyhbLBTTtsUQ3YaKYTIyp6UeIvTeVQokjO13hJiXsD4l
	RUAOK2H/Zl/qKXMLbNKE0bL4rZPaDzbSdR/KuXYMewd8OWjncwUiMyZPUzMwwJnhreXLPXKInZS
	GyOdxpVMAlAdt++H2wQ5zJfAA==
X-Received: by 2002:a05:600c:c491:b0:490:bb44:3f8b with SMTP id 5b1f17b1804b1-490c2605385mr26470945e9.17.1780640598087;
        Thu, 04 Jun 2026 23:23:18 -0700 (PDT)
Message-ID: <029a2474-775b-4846-90b5-26509c2bb655@suse.com>
Date: Fri, 5 Jun 2026 08:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/6] argo: few log fixes
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260604214926.1735194-1-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260604214926.1735194-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1780640598-BEB74DB1-53344103/0/0
X-purgate-type: clean
X-purgate-size: 1332
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B76C1645794

On 04.06.2026 23:49, dmukhin@ford.com wrote:
> This series corrects Argo module tracing.
> 
> Patch 1 lowers the verbosity of a spammy log message.
> Patch 2 corrects the debug logline.
> Patch 3 cleans up existing loglines by dropping duplicate prefixes.
> Patch 4 re-wires argo_dprintk() to gprintk() to include mode debugging
>         context.
> Patch 5 adds new Kconfig for short-circuiting extra verbose Argo traces.
> Patch 6 enables extra verbose Argo traces in CI for ease of catching
>         potential issues.
> 
> CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2577682899
> Link to v5: https://lore.kernel.org/xen-devel/20260603194131.1468654-1-dmukhin@ford.com/
> 
> Denis Mukhin (6):
>   argo: lower level of noisy connection-refused log
>   argo: correct logline in ring_unmap()
>   argo: drop argo prefix from argo_dprintk() calls
>   argo: fixup argo_dprintk()
>   argo: introduce CONFIG_ARGO_DEBUG
>   automation: enable Argo debugging in CI

I understand you want to be helpful with sending these updates in rapid succession.
Yet as (attempted to) hint(ed) at before, please either do it properly or leave it
at "committer can do minor adjustments", when that was offered. This time round you
lost Oleksii's R-a-b. But no, please _do not_ send a v7 for that.

Jan

