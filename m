Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PxqAkRjwmmecAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:11:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F77B306463
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 11:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260261.1553623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yit-0004OY-Hl; Tue, 24 Mar 2026 10:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260261.1553623; Tue, 24 Mar 2026 10:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4yit-0004Md-Dx; Tue, 24 Mar 2026 10:10:55 +0000
Received: by outflank-mailman (input) for mailman id 1260261;
 Tue, 24 Mar 2026 10:10:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4yis-0004MP-29
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:10:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4yip-008MHv-SZ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:10:53 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2631c-e002-0a2a0a5209dd-0a2a4509c0f2-38
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:10:53 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2632d-e484-0a2a45090019-d155802ec9d7-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:10:53 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48558d6ef83so35928225e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 03:10:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b85082842sm2055179f8f.20.2026.03.24.03.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 03:10:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774347053; x=1774951853; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3JRejXtCeGd/OoEoIMJMbl9UfJCaBXMdq+WBbJKtwzw=;
        b=AH11+W896aWlny14cH6iVCRXIpji0/OophOrnQSR+SPt3zbtaYAFUVcPGHpbDCvLHM
         IBiW4eJOqx44R7K4xCv/F//TFrW4pebAwYcsOZ/bWlDlllE32m2BcKnuQqI/u1CmWxow
         /OfpkTiAI+ESqsMF5Zlq7NGOgC654rnd5DOoRivlOdT/xZvaT389QQ7PEkQSrYyzPI2N
         w6V5QaQe1q3kdSknh8MGsCcFotFM3oQDEGaRfxNmrlBnTPL8M5tzzej42fWPAtMLezIf
         k76q6ZBQ8lxdpyvp298T7FqZWmbSIGJEFTU3O0F1kgMVQTv3qE3pFgRF4duAF7JTtjNN
         VSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774347053; x=1774951853;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JRejXtCeGd/OoEoIMJMbl9UfJCaBXMdq+WBbJKtwzw=;
        b=Aw4wD8n5XM13LBlhgw7AVwH8iMzoqehXMpQLoSs2CQc/Fv4gtQBTgQ/ZdIziHPSRQK
         dCVkM5TOEL6TVIm3WBcO3qWREjF6I2Bz/LUgo16HQV+S8JGg4kf8ralMvr2mKDzo+HbS
         Go79F31vBeSV6e8U8QirxxF5tvKxhIlJNAAHvmxmEvHr5+sGpnpzAAZOs6kS0gUJy2fJ
         VHQ4TzAoDyvf13TXRc78uarvxFqm9L8puMGRWjWhGMHZ7PQTHk6Xikp4pcly4XJ4nPbg
         WoMiN5tAy0tUKaO/5wh2H48FytZ/AQvZixSW0qrVhBmirQvqwynGQwM1BWj+0AtrjL+J
         6iFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTdC+v2doVMJXPn7TvXhUj7dnI08q1oHl0LFnHVQRY1IlBzJezswcvpWsvghzhm6jCpyPWI6zgmMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH/MFWE+Esk7BPukQcGY7W7q/TuGQNyhlO5KC/Yma1q2Li1N2Q
	D2qLjohvHW9V07bLqiA4RvbEw/8VURclD4f8SKq2uSLkp59upAqozvJW9QzPXzEyIA==
X-Gm-Gg: ATEYQzy0XjbXGjC0sAeOZIrulU1A4gaOV7XLyEVPdDnvcHXcKE4tSsJsYWv17MlLofn
	vCHiymVTByF2EmlOxiuz0E2NIRkGcnu/obpK9O6Ei2LX+kd1kmz0zQdrPTIuQUJgev+4DhJI1Dw
	5ugTi/NJqQ9DsFMfVJrzRonAYUy9WnxG+zXfc/vBDfBH11L8c9UKmyEnUPHC3PLI4vbFpkykyxJ
	tnYN6c9geidY6ku+Yl9hua7RwYVmxXy2Cptscv8Adcd39WFlUuBw0wp/p5F2JkS8ViLvwmfHxT8
	0AGLquqO1acnuURQ+c9ZgGFYKDukzo8Vai9yVtqlm7xa+h3v2iB7zFoDQwkgentGuD1iA4dMXlz
	WVujoTp7B4GCO+V0Gtt2RHYDld9u3PY+tesNTO+UiKJestFV/IlMEx3XCyu1/Js3XSIXYLYlkRY
	EsWrL2z8c91lkJvR8M5H+h9RAhbbuPxhcyP739t/ztH38ZJZ2hBQP1rxdaMosLXtZ+U3Bc+FyCJ
	1T7fR/HRM6Ss1E=
X-Received: by 2002:a05:600c:c16e:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-486fedb9497mr197120685e9.8.1774347052562;
        Tue, 24 Mar 2026 03:10:52 -0700 (PDT)
Message-ID: <07305e5e-0487-45b2-8518-932dbcd92a13@suse.com>
Date: Tue, 24 Mar 2026 11:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: make shutdown state explicit
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <2004584dbbe393c9de4b3231bf91a24f6e5de5de.1773875416.git.mykola_kvach@epam.com>
 <c37859f7-bac6-4394-ae12-83e054a1743e@suse.com>
 <CAGeoDV8v3=b46qrmzmBjH8BN7rs3CRcSAkrOCgHGgr=8+PcuEg@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8v3=b46qrmzmBjH8BN7rs3CRcSAkrOCgHGgr=8+PcuEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1774347053-63AA4A73-B2450B3F/0/0
X-purgate-type: clean
X-purgate-size: 434
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5F77B306463
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 11:00, Mykola Kvach wrote:
> If you think naming is part of the confusion, I could switch to
> something along these lines instead:
> 
>   - domain_shutting_down()      for the in-progress state
>   - domain_shutdown_completed() for the finalized state
>   - domain_in_shutdown_state()  for the union of both
> 
> Would that look better to you?

Yes, but please give others a chance to voice opinions.

Jan

