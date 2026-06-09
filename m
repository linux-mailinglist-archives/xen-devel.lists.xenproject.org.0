Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uWV+D0XSJ2qW2wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:43:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D422B65DE91
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 10:43:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="EtUI/3HB";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1332500.1594947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWs3h-0004nU-5e; Tue, 09 Jun 2026 08:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332500.1594947; Tue, 09 Jun 2026 08:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWs3h-0004lt-2J; Tue, 09 Jun 2026 08:43:41 +0000
Received: by outflank-mailman (input) for mailman id 1332500;
 Tue, 09 Jun 2026 08:43:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWs3f-0004ln-Mj
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 08:43:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWs3f-005DuS-3I
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 10:43:39 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a27d239-e002-0a2a0a5209dd-0a2a4507b8de-8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:43:39 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a27d23a-229c-0a2a45070019-d155da29b594-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 10:43:38 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-bed2195323cso768607666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 01:43:38 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf054e03709sm996009566b.30.2026.06.09.01.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 01:43:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780994618; x=1781599418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+NrHy6kPx2ot8SQVTDP0rXaielNrr4Dtqq4NtloKhDg=;
        b=EtUI/3HBOmdNkv4ndZ0ibw62rYlJigtY7DJuWJ+87CMblBbTB8HQcAdGe7xNcNmQsX
         IMqE+1tLXjx1I/g1Vql4oI2C991uhQLLf+jyxjpxmgUSTK/veCgzb4ZKYhU/YQ5KKYx2
         qxDVb9UgYBEULI3YnZY6PULwQPuImACcM30gyvHuKF2Et+MB7f6+u62GbI7xPwnfh9s/
         Lr6MHVVxYoKF2oBvQdChNDGtxtVwyhsFqSyn3a7TRfITJHyDCxemgfHjv9R4flhIhqHT
         CadMBxsd+Qt/rv2W0dS7Mceu3Rc/NH9TZQlQyjIkX1eOKmV78tZbVHBQobNCMt8ajAoA
         1yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994618; x=1781599418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NrHy6kPx2ot8SQVTDP0rXaielNrr4Dtqq4NtloKhDg=;
        b=ALHy0EqL3wB2KMazZFsY5LGiVlsDFQwDkyOi7BkbNAgjil09X3Im3v8Ipx+SFP/O+h
         yfa0kFUd5e6aOEoucgXy9Jq7S+oFMikcO1/fsA/XoKEVuyFiyfpWChrvMh/fM8jo4e9C
         BpDwPm5xYphXpM8klYE07YicxnsRv8C5WkCv3ynsvSbJYDUhfsqT++SpWt7qt8Nl2Yna
         k/Wmw9gme9HiliiktGmoODsDfONsCpJg/sxl2Sa9L0D/WTPiAu7InDZvOJBFAIWVhYih
         KN0lxYo58ILYSwbKZDnpL9lb/wqAjtRW8Fkkbj5QNSYgpRpWgZtFyL7Uc5WK4KaLFMpq
         6ruA==
X-Forwarded-Encrypted: i=1; AFNElJ9cJVZGgb/GWkwXj5qZwRhVUG8VmuQ206/X8KgChSgZX50DbaCb0I/7Bz49r59VVOohAPICdG3IDTw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJaqLHcT0L29awjRImlpxPNjDw8dUBnvul4XZyxNYiJs2x02M5
	CDlA0iuqdrlj34hI907XyzgBOFmaDtO09a6GqKaDRYKW9yW6KgYwxh2a
X-Gm-Gg: Acq92OH8t81E6B/RsUrTJhElDyEoYcA76lABhgxqmHsShuNQ+KR4HPL6UzEcapAEkm5
	ymM2CudjC1EItk8Oig/3UIcnbpha9TI+D+wb14zMj9USSrlnx7TljtxG8tveJa9dAn90UeX7wWX
	5nl5wR5FQqZ/Y+pD5iD7ybxwgQ+mamgNCETVI9Nv8k1vDNdWalvWnx4/9TRtKj7Dba0lp86f1si
	MY1dk92PRtuYGB1UcZ+Z8/ctTDGDGhywWIyaevJ400Y93DjJSut6Q7Kl9XLAh+WhVtL5ydrBNg8
	79EsJLUFFEHCdDtmrTQXi5tHjwACQwsV/MPYSeiOAmkKRWY4HumvS03olnr2S9rrhocpOAAWZ2z
	voMrZ0ejmumHY9xEMyEFx7SugMdsDzg/Zl5X27NLra8+XQwZyIKZGQkiBJEzyxfomqIHHh8oFzC
	eYLxuck5UXq6zpKhlTjU1UwznJ0htg6qWY4XQ9zzVnV/akv1banL6MT4pqSRW18wD+SexlTxv/3
	8CV24PI6yDsjl7I
X-Received: by 2002:a17:907:78e:b0:bee:ec3b:6a8e with SMTP id a640c23a62f3a-bf36ff8da16mr885858466b.8.1780994617254;
        Tue, 09 Jun 2026 01:43:37 -0700 (PDT)
Message-ID: <0667e7c7-517a-49f2-a78d-b01b49332eff@gmail.com>
Date: Tue, 9 Jun 2026 10:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/decompress: resolve MISRA R5.5 identifier/macro
 name conflicts
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <f73e440f0ec5aeaa5f1bceaf1fd1403099df57bc.1780946676.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f73e440f0ec5aeaa5f1bceaf1fd1403099df57bc.1780946676.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1780994618-08B60C48-BD6C2F57/10/73395122804
X-purgate-type: spam
X-purgate-size: 1128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: D422B65DE91



On 6/8/26 9:35 PM, Dmytro Prokopchuk1 wrote:
> Convert 'free' macro in 'decompress.h' from object-like to function-like
> form.
> 
> The object-like macro '#define free xfree' performs unconditional text
> replacement, causing conflicts with identifiers named 'free', such as
> struct fields in 'page_info' unions defined in 'xen/arch/arm/include/asm/mm.h'.
> Function-like macros only match when followed by parentheses, allowing
> 'free' to be used both as a macro and as a struct field without conflicts.
> 
> Applying function-like form to 'malloc', 'large_malloc' and 'large_free'
> ensures consistent macro style.
> 
> Additionally moved 'large_{malloc,free}' past the #endif to reduce
> redundancy.
> 
> While function-like macros prevent uses where the underlying function
> identifier is needed directly, such as taking a function pointer, no
> such uses exist in the current Xen codebase.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

