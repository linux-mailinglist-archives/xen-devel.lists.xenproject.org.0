Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nFZdNmLTHmogVgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:58:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1F762E382
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:58:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Vi3rpIp7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324975.1590485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOh0-0001wz-Tf; Tue, 02 Jun 2026 12:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324975.1590485; Tue, 02 Jun 2026 12:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUOh0-0001uA-QC; Tue, 02 Jun 2026 12:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1324975;
 Tue, 02 Jun 2026 12:58:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUOgy-0001tO-JU
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:58:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUOgy-003Kgt-0G
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:58:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed352-e002-0a2a0a5209dd-0a2a450bb6c8-6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:57:59 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ed357-212f-0a2a450b0019-d155802feca3-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:57:59 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490b43e2b95so1344205e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:57:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c11555csm101447485e9.26.2026.06.02.05.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:57:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1780405079; x=1781009879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/4Sh/S3iRRNscvG4+twE0pbGJLIle7DXRCUOishQSqM=;
        b=Vi3rpIp7pVNzvl++sXd56KvRcpsJmjyNuy5soXfGgfTS0r82TRT6buk4hwHLLZLLG9
         k1u1iGhRgQ4sqIzmwvrPHA4EbBJzh4za7J3Qa3gi7pYXDnjA6zmSPJ4s+Oe/cMeTY5io
         G3XYoI+TuPTmxO9oTUFHtpnVTkChDLrMCgErCefu+F+B55k39hI3dcxw1qvFymdY8UJO
         /MbYgBmgEmgoXCkabwOj4kfXrEbFqJKbh3yWWqtLF12X8f9KVPyK015berbxiLdxTEJv
         zdiKgSgzXYJEe5K/qMdUQtJF34YKozMSdAlwveI7jPOXp+jTLFse2AhPD8eJdXUhLuJk
         paYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405079; x=1781009879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4Sh/S3iRRNscvG4+twE0pbGJLIle7DXRCUOishQSqM=;
        b=KsMduy7ueZoRZ149wFABLBO0e2tDNgcFlja7Tq0L79hKOD83h7nl5zJCpKSH4P1E6h
         wZ2FNzJtpq3w4mmoFqFGz+sMAbuMQKz9W5dWs7gBp2GrjsbTnQZb+cOObZ8gdLgNEerE
         BN14rJmpYx1s/A/nrcyE5A60AojPZPM0zEOCTPi6zZKeRAtlsAXRYwLE/FjaSFXnHCiI
         W1vGHT/zGRKtpawrHoLwRDY8GM/swWUU9BySe326Il9p1+4Xxt+b1/72YcUTF7EefCfn
         sSEqHQhDk2Rk7DTwksdKnBntwbP1NZOcp/bmiw2D/A5tYG7AlC1oKgj+dtMWd4okBtI3
         NmzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3aBJ6762xMhk5D7tTGeqODOD3Ba+i0N2Dqz6GsCqksteKx6sKkfrIytgCytK8BdOzGsJnT+GYggY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxB1iKpTkmbTN82r1HYNBEt5a+X7qblERuVZxmYEJD2RY7FBfdO
	KwEjWfEgCRClJsAjV6iOY+gEP8kx5ZIKKXyxtRpH6tEjRozH8dCIBYcL3hlBwbuzxw==
X-Gm-Gg: Acq92OEx3ghXO7AYirAiVotaUwIB4u2HBU+wforXHstcALU3JZa23ZdahGnkNPDBbrX
	lp8KzMESALk3GEiZGnRVu2Mgr1dHnfRckKqi2APpGp3R+jm5co5j/lPT1+TJQKvGJhxeXSIbloe
	7g/GXZ3bNK1uoqy9HFnGCxdFYfw4tFVyGTA+o8NcwE3dXbDyZktVS64ovcGnekd1EJi3Gw9mkQC
	qDZEXRrCRst0a16OCquGjz7LI97jKWWhBQBOY1vrNOO+ohuBv4zyvW4MVYGlLUBdy5RPNeTgOKz
	CLvQ6EnN3J4Dfoa9lY91mo4CtwRpW7Jz1MEedJISPloh1kKCB1kMFzdIc0kUdboVEnPkc11QZJe
	1L15xWew2p2RBur/7eR82vLHuPxYYsEijWr80gClykv64U/lZwQex+JckcuueO6UGaLbiOShysQ
	xuEgUgT5T4S2J7k5aefCqWCzJYlqkwydJkYg9OsOfKL7Ps0XEx8V1jbHMTw/PcaU1kIgdPamLre
	UnLBBKHzdP524NDANhtPukiAW7Q7PrsUgCF
X-Received: by 2002:a05:600c:1d29:b0:490:a646:9d77 with SMTP id 5b1f17b1804b1-490a6469e5dmr84117165e9.6.1780405079383;
        Tue, 02 Jun 2026 05:57:59 -0700 (PDT)
Message-ID: <7e0a37b0-570e-46fe-864e-f29be43e6fe7@suse.com>
Date: Tue, 2 Jun 2026 14:58:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] Add SBAT section to the PE binary
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org,
 Frediano Ziglio <freddy77@gmail.com>
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-2-frediano.ziglio@cloud.com>
 <e6cd8fdd-97d9-4f07-b952-079c67598f32@suse.com>
 <1090e22f-f1bd-43cc-9e8b-cbb6060d805f@citrix.com>
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
In-Reply-To: <1090e22f-f1bd-43cc-9e8b-cbb6060d805f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780405079-1AD77F3B-A6A6EA77/0/0
X-purgate-type: clean
X-purgate-size: 929
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[cloud.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,invisiblethingslab.com,lists.xenproject.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:gerald.elder-vass@cloud.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@cloud.com,m:xen-devel@lists.xenproject.org,m:freddy77@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
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
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D1F762E382

On 02.06.2026 14:54, Andrew Cooper wrote:
> On 02/06/2026 1:06 pm, Jan Beulich wrote:
>> On 29.05.2026 17:35, Frediano Ziglio wrote:
>>> @@ -275,6 +276,9 @@ $(obj)/efi.lds: AFLAGS-y += -DEFI
>>>  $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
>>>  	$(call if_changed_dep,cpp_lds_S)
>>>  
>>> +$(obj)/sbat_data.o: $(src)/sbat.csv
>>> +	$(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=.sbat,readonly,data,contents --add-section .note.GNU-stack=/dev/null $(srcdir)/sbat.csv $@
>> That'll be an SHT_PROGBITS .note.GNU-stack, won't it? When it really wants to
>> be SHT_NOTE at least for bleeding edge GNU binutils (see relatively recent
>> changes there).
> 
> That was my addition to prevent there being a warning about RWX stacks
> cascade all the way up the build.
> 
> Maybe a better option is to have sbat.S with an .incbin sbat.csv ?

Yes, that'll avoid all the custom objcopy-ing.

Jan

