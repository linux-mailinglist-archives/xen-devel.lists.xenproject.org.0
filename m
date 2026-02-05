Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VRmxHjxEhGkI2QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 08:18:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D3DEF5E6
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 08:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221502.1529711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vntc4-0005m0-LR; Thu, 05 Feb 2026 07:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221502.1529711; Thu, 05 Feb 2026 07:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vntc4-0005j1-Ig; Thu, 05 Feb 2026 07:17:16 +0000
Received: by outflank-mailman (input) for mailman id 1221502;
 Thu, 05 Feb 2026 07:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vntc3-0005iq-2R
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 07:17:15 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1438502-0262-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 08:17:13 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso5048565e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 23:17:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830fe53c23sm56909425e9.3.2026.02.04.23.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 23:17:12 -0800 (PST)
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
X-Inumbo-ID: b1438502-0262-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770275832; x=1770880632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tFn0979k4UELp91ZT2YrW/dcYK0iU/fgMpjIjnylqTw=;
        b=EUySlwqmnRLL+ifPfUEUmA7p+ZHR/UogpbI/TlY68YM/rSDv7ygyF3csKGA8YGxk4E
         0bu86qFuHdGL6TusFN9nx40lAnvLN/xdMBBhPFGU8zjLR04AS5VuUE97pcxuXhe7X9Dk
         eqE7jwKrjbku2I5PaiN7rNQ1qzGZDWmfb+mmCmYfq8+GXs1I/837YpF4Ry0e+xAd3LAI
         w2/AtStAq+N9pOgbnh/eNdgIL5WgYTnm2r33OHvPQJxn/pjukZcWMW++zPeG0V4CgyOx
         dh2W+R3w/7AZL56iBcH54zSIIFMmz2t5p5Z9RLpbsFiulHUeqfcTgilq45DfDr1PYd7q
         go+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770275832; x=1770880632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFn0979k4UELp91ZT2YrW/dcYK0iU/fgMpjIjnylqTw=;
        b=jE1jAzmH4PfigfcTwIbaiDLTw9f33ZfV8G277JyhJrIb7Y1wlN3bqYfEtfMlMEbDA4
         1Cy60WXgLKlbWM2X/PJIfyjDZNvId1no6j338cUVkWSn+K2lexlDq4xeZPX5fUFJm4qn
         raJhjMGidT/fRZbtIJXWtKAuHgrQigC2vq8J8hDHcvlYeal/Ev8Q3of3BG+0leJ6tmAL
         7z4a/sLH13in8LBaT3u/tl4zK6d5cPdVrWEk/09lJIaDfFe0U6g8CqqP5c33mvCWbqG4
         IViCeAo4RL2mQ68JcRptWuMRrYdJ4B9HN7wYDwjkjL6sZLwqiBzcDooGufVdR0SSriO7
         8FXw==
X-Forwarded-Encrypted: i=1; AJvYcCVEa1dQtEx/3IEA/EQEcpQb4TLCcDuE0itFITPj+dwBby0MRzOD61qmLntZgszskEXcZdQIneNokt0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw34vBZk5+iw7h2AI27Vf+4cqD09GD0+itF4mRdxW311rY+iKJX
	SCQKqomLS4Oj+I8uMPPWw1EeQOJ24CvMmPnG/WgdWmjfuY1F5KX8HYIqrFjd/XuIjA==
X-Gm-Gg: AZuq6aJ0SROiuaXZUojmRbPeiLTN8wvMftuXNg0UkOHqGYDbH8l/hFQBCtqG6u+/4gM
	PUShCuGpiuyyGpJQ5J+8GKq7EfZqgKvEvM4lyuEW6BS3tn2NULURaOtDJn+wKDqCmo864OuHiAd
	Oy9GP6kWfj47ajEBexd7KsbuCmpMQTIRemO1DJWGQIpdvTkUbpcqam8JkV538IzaGgx48YfuPc4
	KtD5UsCrNsXdcKj/H/CK5XAc7A4TKa/zmwFsUCfzFzHI85BJg538dlV0qefXf0xsdpykTbxnW/j
	7TJKsHLaPuLHHlHb52jUC4zTgZqrPKh6OXmHeqnwNKk4uXYIyFJHONyN7ndxSPDQgY/YIAov8YX
	WEt33xJ/bWQ5ePBgRGFdgccK2Gkf6uz7tdttWMxKqYbQEsufQ473+fB+M8RgnhPRtROnCp5ZSKJ
	iffzItLP7s0ntN9TsWeFBXCZavUNnQll2UNxy4r3BWAWYEgfmiiFWnNt5FdmmWlH2ou+GQu0z4n
	hpY+rg9k2s43A==
X-Received: by 2002:a05:600c:628b:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-4830e931e2amr74097195e9.15.1770275832545;
        Wed, 04 Feb 2026 23:17:12 -0800 (PST)
Message-ID: <0a6d9ae8-ac1b-4287-9a42-1d91ad5d35a0@suse.com>
Date: Thu, 5 Feb 2026 08:17:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] xen/console: handle multiple domains using
 console_io hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 grygorii_strashko@epam.com, anthony.perard@vates.tech, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, jason.andryuk@amd.com,
 victorm.lira@amd.com, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601291404410.2238666@ubuntu-linux-20-04-desktop>
 <20260129220858.2371938-1-stefano.stabellini@amd.com>
 <0fc9a80a-8621-4ce4-b2f9-c102e975b05b@suse.com>
 <alpine.DEB.2.22.394.2602031502000.3175371@ubuntu-linux-20-04-desktop>
 <0a437580-a373-4aeb-a153-b3dca0cf2bb7@suse.com>
 <alpine.DEB.2.22.394.2602041524120.3175371@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2602041524120.3175371@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C2D3DEF5E6
X-Rspamd-Action: no action

On 05.02.2026 00:30, Stefano Stabellini wrote:
> On Wed, 4 Feb 2026, Jan Beulich wrote:
>> 2) As all of this is for dom0less only (for now at least), did you consider
>>    to make all of these changes dependent upon a new Kconfig option, so to
>>    avoid impacting other environments in case issues remain when this has
>>    gone in?
> 
> Effectively it is already the case because:
> 
> #define max_console_rx (max_init_domid + 1)
> 
> I could easily add an #ifdef around is_focus_domain() so that in case
> CONFIG_DOM0LESS_BOOT is disabled it defaults to is_hardware_domain() but
> that wouldn't really help because thanks to the definition of
> max_console_rx, effectively it works the same way when
> CONFIG_DOM0LESS_BOOT is disabled.
> 
> I think what you are asking would be more about the locking changes in
> guest_console_write, but for those I cannot really use #ifdef to retain
> the current position of the locks. The resulting code would not be good.

Yes, the request was (primarily) about the locking changes (additions!),
as these can affect non-dom0less as well. I may try to make suggestions
when looking at the next version.

Jan

