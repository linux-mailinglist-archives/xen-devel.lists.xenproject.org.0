Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBnSN7nxvGls4wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 08:05:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC902D66A8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 08:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257810.1552082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Tut-00054t-1h; Fri, 20 Mar 2026 07:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257810.1552082; Fri, 20 Mar 2026 07:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Tus-000520-Un; Fri, 20 Mar 2026 07:05:06 +0000
Received: by outflank-mailman (input) for mailman id 1257810;
 Fri, 20 Mar 2026 07:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w3Tuq-00051r-Po
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 07:05:04 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e206364-242b-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 08:05:03 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso1631931f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 00:05:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b6470b1f7sm4473882f8f.25.2026.03.20.00.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2026 00:05:02 -0700 (PDT)
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
X-Inumbo-ID: 1e206364-242b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773990303; x=1774595103; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SMWOGgQ7ipyX7UhLb9ROJML2m6OW1MCvnD/K9ZvJDAQ=;
        b=ERRQN+9aSxuDRIPZB+UbHxyOYSdNfcPvIVc0b0rFjeLohZ28yUdZDlulpykQCv8c/i
         XRqeQQxfVaBqGZtkOTbvHvaCW/P+nM/knh26y1VPALYsIZz5R9qTOur0ZD/mNYLppP3t
         Pob1VTA0Q3jL0MgvwE+yU+iZm2xWLmBUSDKwxXt19S+p0ryOcKwdrZtLwzmvyTcjrwnQ
         NCiOUgbFyIKY1lXqVD1WMMrLoNK7Hj2Sv+lgUhDD4DaIEmvKnvTYZy3Ts/ue0PXdc2LJ
         rx6s5/Y0hltVQzP3Q+Yv4R/EqlXmNgjvy9O//BEuRfyzQjelWfV/kCmDz1gercZ7yLdD
         NlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773990303; x=1774595103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMWOGgQ7ipyX7UhLb9ROJML2m6OW1MCvnD/K9ZvJDAQ=;
        b=bDDxYD4eyKRYhKzMmOfGEtHCaD0uUxIfpviVkfDmb9MWfe6MtOjwW3dPkyKTanjmzM
         8wWKdtDS/d3iY/RmPZTAp1+3VUcvDcUD6URxv3y8z1HTPnViOGNiBmbhjOKVyLKbI2DB
         szrDf9JmACVAiVZhyktxL86AlvdWeeR2W3qGWXNHUFAtucSpgeTEzpriWH+R2ZEPk3KD
         wfMpCNYI7emuVTZLLTI+LcpIGyFE+czxs9THVez59J7lRkOFD+UVdcfm9NJQR+vwAwrm
         bEU2H43P1Lezxm4PuHdO5sVfjbOfzbupHXPvQFHwameTHA0ImMeLmOihL6ZGIx4xCPh2
         meLA==
X-Forwarded-Encrypted: i=1; AJvYcCXU+ppHAVZ9rs0s6tEQ2URHu+09csUrzW5QHPP6BdjWzxxDF6FaIspghMzy3ZsZeFCiBbZBHfc2Pbo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+Nh/bAifgCU6+sVw8VmZHMz7JnbdQfSXJC3klXgTcnHUnP9b0
	n+Ts8Qiu8dK+wq+Z8DfXAo7j1hQbTVnEdSSzKnKFXFGpRZVsbCGvY/j5YIYrdDDtEg==
X-Gm-Gg: ATEYQzzLSSXw3MrBmf5uUyv21A52oYXxGCPeTgOX42o4V9ZZsVwifaTJb9D5v7ZEwRP
	Hpm8xrmFnCK0+5oPfI9Ot2pLDKsTmZVod2TM2N5OfhmRKjN8tq76irZFnpD4oYAIPtvpXdbcttq
	VAokgLh+82tliEa1gEOOScOPT/6N9L3n4Td2XBI51yURjqiSYW3y1JthggGx3McVtg7AlRRdVvx
	mf3imPQhChUKJQFWzP+3nXaJecP7ejtMFshFpYwtBPYx8HTMKDbDx7CD1jmzLGLdExRw3PoqCoE
	msla4j5DwQVohOxiZg4aaUdDT16I9KzUyJO+64jIHE4KjKKXc1HI2xZ0yMHffl99VS0k7Hvx2b3
	Qs0EkXN4Wcb80U/EpRx8APpbomb2pHNhtusLAhZSqU/EtjvQmnKbdwWhxlZwjP31pP9wx60cp/N
	lbcccK2u4WPpcGDgskOS6917TR0qmrCLySm8u4PaZLW25egruoCyPQUDRBHs4HCdd83scDYfo9g
	teoECpxfS4trFH9+b2E8OZPFQ==
X-Received: by 2002:a05:6000:290b:b0:43b:4468:b112 with SMTP id ffacd0b85a97d-43b6426b65fmr3331186f8f.25.1773990302715;
        Fri, 20 Mar 2026 00:05:02 -0700 (PDT)
Message-ID: <3e7d7fbb-55cc-4536-abfd-998cc10b01cc@suse.com>
Date: Fri, 20 Mar 2026 08:05:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/cache-col: address MISRA C Rule 5.3
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ded7e2aeecd18109bf2fde5cff0d356932f08e28.1773952245.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <ded7e2aeecd18109bf2fde5cff0d356932f08e28.1773952245.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4CC902D66A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 21:31, Dmytro Prokopchuk1 wrote:
> MISRA C:2012 Rule 5.3 states as following: An identifier declared in an
> inner scope shall not hide an identifier declared in an outer scope.
> 
> Inside the 'if' block, the inner 'i' shadows the outer 'i'.
> Reuse the outer variable and remove the inner declaration to fix that.
> 
> No functional change.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


