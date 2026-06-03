Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tmehJ77yH2pdtAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:24:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D7363620D
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 11:24:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CCWOTOLT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325954.1591326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhpU-0003H4-E1; Wed, 03 Jun 2026 09:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325954.1591326; Wed, 03 Jun 2026 09:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUhpU-0003Er-At; Wed, 03 Jun 2026 09:24:04 +0000
Received: by outflank-mailman (input) for mailman id 1325954;
 Wed, 03 Jun 2026 09:24:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUhpS-0003Ej-8K
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:24:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUhpR-006UGg-L3
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 11:24:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ff2b0-2eae-0a2a0a5409dd-0a2a4506a3e2-4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:24:01 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ff2b1-7371-0a2a45060019-d155dd2fe8c4-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 11:24:01 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-46013161068so1618254f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 02:24:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcb13sm5678111f8f.2.2026.06.03.02.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 02:24:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1780478641; x=1781083441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn1foyC/Gw419s153RlYY4YolHD6lrsjw7l2CpgEgkM=;
        b=CCWOTOLTYmHJEJKNVJtjOT0UCU4XJmAR177TUcHpaXKmZM0dofHANhYNSYGQk7k60d
         ey9JaUpPVmIfpU1ku9ZbMi7PLVhlgoroR1eGN5UjsKmt/TBsZxaOuU2mstKdnmf9gcFb
         EENcPuo5WCq5KEe3r/S3o4A2S3pFBeN4NrplbgxK0BpljK9Fvkdz6QpByGqTqvnA2taf
         qNHp4gzoiBwx0hX96wY2Eox2QNmpzA3rCqUVp/8mfP1mJqoR3vuozV0fGvdZC1FsGyL/
         ZmXX8JlO40WtHgqRSwEotcPA5Cp8yPUlWZr1xm1Ae4f811yel524YolfrISFvfLQfPg6
         DRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780478641; x=1781083441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nn1foyC/Gw419s153RlYY4YolHD6lrsjw7l2CpgEgkM=;
        b=A9v+yHw2PPVRzV/mqQVrXWCQgUAFOXHKEeG8N2uh2EmxU/G9QbyVplprGN6pPkyM5t
         3lePPc1152Z+quIBdZKF9F66XtqaW9Y8LmJd03tcOXYGyYpILXMBdyRLu/mjh+0527nR
         /+kBAb1vgGctnOHthtX4P3L/nF74Y4E18APx1DZu59qY9C3LPJbM0nkx8s6uLID6229F
         FbHr+b8xPGf22zbNrkYr+NNQVdkL3QGvDFmd3OfIImM3dyvzTiGzUACISMFVdeS2h0Gt
         1TyEr+b2vbT8ZvWzCIW0TUN0lbtIf9MgSI99BthoNjwFHXFAV9+zYjMy0+zAnqyrkvwO
         ubXg==
X-Forwarded-Encrypted: i=1; AFNElJ9HBH5lbMep+xz00EC2POZEB6tfdu/XbJI8PtxjSe7OHgwQlUneGuIPj2lmEENPrxneMd9VuCefsYc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwulIeASbUhegvkd9rbYViJiqQZTP4crmGXk8Qd1YgPQotHo+7h
	/KozqZN95gFGe9XFcA8ZIHl/bS4wuk+rNdUdUyG500ELeHHprWWfMoFeOb8NgeSwXA==
X-Gm-Gg: Acq92OGHz7xfcmVKv/HqrZp/xwp9VAHdtN5fX6ICNwhjtBbrz0GZaQ3K+sYxtid1HjO
	iErO6kzh3pW36wOMxGLfCNE21wGkypOMCyED39qBZxZiRXLR7IVXxckbsULSs65kgce5FIbZ0df
	2zjYljhqiJGZhuSibKUkO5CmB1GLXBHp3BgD3Vm4OEwDjRIV/Jf2tOrQzknQa5a4jR7/gNiDiOw
	H2eJsmvblUIexXS0/505s85jKcFK3oQ7hwygG/kLrlSS6Htk6klDv4yAfl76fvf3OfLYphIx4ZB
	wJEdf3F5sOETtefOkJznsPqb2rfrdiGj+/XxlZlu/14bb/+uS2PTncFVi280LGoUPR0ZjqR8NIO
	5qHLGjEc8J/ycXs4cFjsV9n+JY/w1PQi1hTU/G/VxBVVZPnjU5F37g3BNrbqjgBDHQ5wXXmydBx
	QBZ2PkUpl/xtAJQBHqBQqDa4WZmJe2+9Un0Jb6xmWC+HfFmo6r/M+OECkXEFAMuztli/f1H6Hva
	68Ee76jgEqgUUkKQfbyLntqjA==
X-Received: by 2002:a5d:5d0c:0:b0:45e:de42:6e90 with SMTP id ffacd0b85a97d-46021872eb8mr3604817f8f.37.1780478641013;
        Wed, 03 Jun 2026 02:24:01 -0700 (PDT)
Message-ID: <031c77d9-9ece-49e3-8d9d-8b7dbb209d6c@suse.com>
Date: Wed, 3 Jun 2026 11:24:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22(?) 0/2] tools: Use the system liblz4 package
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
 <4818e5b8-21e9-4f2b-9977-8fc4c9a4889b@suse.com>
 <3641d161-70fd-4807-a1f8-689f0295c579@citrix.com>
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
In-Reply-To: <3641d161-70fd-4807-a1f8-689f0295c579@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1780478641-8FD7AD75-A6C28913/0/0
X-purgate-type: clean
X-purgate-size: 1158
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08D7363620D

On 03.06.2026 11:21, Andrew Cooper wrote:
> On 03/06/2026 10:16 am, Jan Beulich wrote:
>> On 03.06.2026 10:53, Andrew Cooper wrote:
>>> Switch to using the system liblz4.
>>>
>>> This brings libxenguest's lz4 decompression in line all the others, rather
>>> than using the unsafe decompressor from Xen (itself a port of Linux's unsafe
>>> decompressor).
>> As stated in 84f04d8f0dbf ("libxc: add LZ4 decompression support"), there was
>> no shared library available at the time (and on the SLES versions I worked
>> with). Later a shared library appeared, but the -devel package still wasn't
>> there. On my main dev system (intentionally a relatively old SLES version) I
>> therefore wouldn't be able to build/test LZ4 anymore if we went this route.
>> (FTAOD this isn't an outright objection, as the goal of the series is
>> certainly good. It is mainly a data point to consider.)
> 
> That was 13 years ago.  Are you saying that there's still an in-support
> version of SLES which doesn't have liblz4 ?

If "in-support" includes LTSS, then yes as far as liblz4-devel goes. If you
mean only ordinary support, then (afaict) no.

Jan

