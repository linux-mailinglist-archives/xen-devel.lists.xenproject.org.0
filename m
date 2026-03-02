Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJT/Bvi/pWknFgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 17:51:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7011A1DD3E7
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 17:51:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244504.1543964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx6Td-0005NW-IU; Mon, 02 Mar 2026 16:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244504.1543964; Mon, 02 Mar 2026 16:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx6Td-0005Kn-EE; Mon, 02 Mar 2026 16:50:37 +0000
Received: by outflank-mailman (input) for mailman id 1244504;
 Mon, 02 Mar 2026 16:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx6Tc-0005Kh-51
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 16:50:36 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edf21837-1657-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 17:50:33 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-483a233819aso45432605e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 08:50:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c35910f1sm249159025e9.2.2026.03.02.08.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 08:50:19 -0800 (PST)
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
X-Inumbo-ID: edf21837-1657-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772470233; x=1773075033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Y8ZBfCQicOjA/MPxg4ajXuc0vJMzWClaVTSx+x8DqU=;
        b=Q+ZZcFHfJJQPvGcnOaGxW28XCyGol9KVdpOQPaBcGUDOW72ENRzQ2iO9BsyIzXyxCt
         rkF241tEIiQ0PlF+jMRw+uZzpknvT3M5VVC1fTQSINIAiqSs+WIh+t6k+ts3WmAAj9iu
         aa9v+JtfUWrNhfiH92mLGOJjYKgMRPdqMD4iOE/CwVlorPIF3odTBKv9iiY1aRGGXThG
         7Vdsd1fx8sMqyQBu3LdBSmI8KIT8jZgGlmxxI8l1PF7xxx0cxu0RuONTLoN7o+BGFZzq
         n4kkMhyoNY3WsqpsOufGUXBU1ZeNqe+/rQ1L5ulPpHC3K93WgYB2D03rtN8edKGtj87F
         BuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772470233; x=1773075033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Y8ZBfCQicOjA/MPxg4ajXuc0vJMzWClaVTSx+x8DqU=;
        b=CJKh9d6OvJ9i81yzt2Bx5QPQK8RoIMe0rMSdH2+CcXlpFY5Nx2r56paGiWrz9JLgJ/
         QCpdq/wzIw8ULURsule8YYrP/uPxaZhXUm2AJDuXvuBB3IOdkW89eoB8i6kimzd+pBQg
         U0CMAkI/Zl4gXsbJtudsM6Xj7qiBS64Fjtjz9nVgV1saUk8GEWP62PbT0n2ZHeQ7PU2z
         ET9FCckomxXei3AwjuQABnDrPk0qEsWSzr4VfCMALUqKh1Qbl+JvGBvWaexbOaWJsOG6
         RuutuuGFOHCD00LZTw5l/kyInGBe7Gs/OFmLUx8TrG8CyDyA05/EiuyWJEJm0+qGeOYU
         /mvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzpojJpMY/jRidFSLfZ3UwNdGqSKsiayQb/pOGy1LtFpsxuD6uhEJvJtBE8GB0q1WEemzcH8+K/78=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCc0cLwLPACFdhqhoLAyJNG3dmAo2arKA0WLSOcBd7fub222tK
	SO/PrzdiIWSYutWAi1y/8DqgKiHhj0EKCXDatYTzpMDU2KyYkXMEZZc1nVwgtUh4J184rxEa0N3
	2tso=
X-Gm-Gg: ATEYQzziX/X9JDIvnbcXbiktL7TLQCOblMMp+8ZOL8+aKM3u3v1vj0Pb/9b97a8mY+f
	VoQ+TN/mb7f7UA8RxJX3a+LTM2P31eyXhr5+CPRyFx3fTAWeO6O/ke8H8OhzKrL5Eb+MF3PNDs+
	nNAvd921SbudfFZUxJ6n/qmQOnLefRgmZOH0F0NFyy47BFZethtnoHNvHkRqFiVhM9Cv0z/lgiF
	JBpuDqsdkQ68xHtpHpwwgzv7+OfNRfJEsQGZIfjQW9aWwcIx0IQGxTT5mLLhoiUiA6zH7muZQpf
	RwZhVIexo7Lb4tSgEksNibT2ITgpwV1emYlOgL801p4OLqxtNO8vfizLSq+t5JCk3AHKrCh3hOn
	z3/gq1QFxtMqA+qwPgQWYmJ9JiODDNqhSxOX3ZjGE8724MG9FiMqhtE+NUiInsfwRQr6AVKWFVF
	Vxh0I71FFQrAkWceU3RLLGQkAyLG9AxSYzKZKnpzaoeNDl9Wgy1PJny820uV/R26RcD29IURzH2
	Ft/gaSPy0uo458=
X-Received: by 2002:a05:600c:8b53:b0:47e:e91d:73c0 with SMTP id 5b1f17b1804b1-483c9c0bce5mr231103595e9.19.1772470232978;
        Mon, 02 Mar 2026 08:50:32 -0800 (PST)
Message-ID: <7380cf63-e9ac-4df9-9633-c26f9de0027a@suse.com>
Date: Mon, 2 Mar 2026 17:50:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] xenpm: Add get-core-temp subcommand
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <ec92e54a493a16f5bc085738e943b3778c3a0231.1772211384.git.teddy.astie@vates.tech>
 <aadf2e78f91f442964cc4e93c028b6b31fceb9eb.1772211384.git.teddy.astie@vates.tech>
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
In-Reply-To: <aadf2e78f91f442964cc4e93c028b6b31fceb9eb.1772211384.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7011A1DD3E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,vates.tech,lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 27.02.2026 18:00, Teddy Astie wrote:
> @@ -1354,6 +1358,127 @@ void enable_turbo_mode(int argc, char *argv[])
>                  errno, strerror(errno));
>  }
>  
> +static int fetch_dts_temp(xc_interface *xch, uint32_t cpu, bool package, int *temp)
> +{
> +    xc_resource_entry_t entries[] = {
> +        { .idx = package ? MSR_PACKAGE_THERM_STATUS : MSR_IA32_THERM_STATUS },
> +        { .idx = MSR_TEMPERATURE_TARGET },
> +    };
> +    struct xc_resource_op ops = {
> +        .cpu = cpu,
> +        .entries = entries,
> +        .nr_entries = ARRAY_SIZE(entries),
> +    };
> +    int tjmax;
> +
> +    int ret = xc_resource_op(xch, 1, &ops);
> +
> +    switch ( ret )
> +    {
> +    case 0:
> +        /* This CPU isn't online or can't query this MSR */
> +        return -1;

Further down at the callers of this function you assume errno is set whenever
an error indication is returned. As xc_resource_op() didn't fail, you will
need to synthesize an errno value here.

> +static void get_core_temp(int argc, char *argv[])
> +{
> +    int temp = -1, cpu = -1;
> +    unsigned int socket;
> +    bool has_data = false;
> +
> +    if ( argc > 0 )
> +        parse_cpuid(argv[0], &cpu);
> +
> +    if ( cpu != -1 )
> +    {
> +        if ( !fetch_dts_temp(xc_handle, cpu, false, &temp) )
> +            printf("CPU%d: %d°C\n", cpu, temp);
> +        else
> +        {
> +            fprintf(stderr, "Unable to fetch temperature (%d - %s)\n",
> +                    errno, strerror(errno));
> +            printf("No data\n");
> +            exit(ENODATA);

In how far is using errno values as arguments to exit() a useful thing? (I
think you had it like this before, and I merely forgot to ask.) Yes, I can
see the tool using a number of exit(EINVAL), but I don't understand those
either. This way you can't even document easily what particular exit codes
mean, as the errno values may vary across OSes.

Jan

