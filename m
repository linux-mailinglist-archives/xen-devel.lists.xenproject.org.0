Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PxMOnndDmoVCwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 12:24:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C75A33E6
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 12:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315006.1584899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ0ZQ-0001EH-Bq; Thu, 21 May 2026 10:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315006.1584899; Thu, 21 May 2026 10:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ0ZQ-0001CX-98; Thu, 21 May 2026 10:24:04 +0000
Received: by outflank-mailman (input) for mailman id 1315006;
 Thu, 21 May 2026 10:24:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ0ZO-0001CR-Gu
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 10:24:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ0ZN-002aBg-QL
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 12:24:01 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0edd3a-bab6-0a2a0a5309dd-0a2a4501d40c-30
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 12:24:01 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0edd41-c1f2-0a2a45010019-d155dd29c9a0-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 12:24:01 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-44c350a5b87so3648357f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 03:24:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa7cd815sm2549438f8f.6.2026.05.21.03.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 03:24:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1779359041; x=1779963841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W7F78VVVB2LZkM+BbiHjkRKKbRJh9c96LH9MOwlb4/A=;
        b=HkUR+6MPkQxLAGeoSXnGMQ6i5kGprZIO0tnbglidIOp0zObElmwG1QwPrnHiOTHkAf
         +rJKKI87O1skM9bvSciSRqAfDn9D7BVKiq5oEEfVQTdlYpRUdCYUg7D/8d6Lyh0n+bWi
         YCLkGgs3RvrtmAAPoKc6/VOEc2nwwUSz8kObXKZX4WOumo9B+v+6XQ+F8jZnMSDRgaeC
         PxKV+PNNw3yU9Bo3JITHZTcQRvFGQjhIaabtdgXG1af0+AU5d+KkUQs8nBGYdGMH6PY0
         DiFPeFS/O46AQLBvH8MrxI/BPTj8kcRhDA3eFEk4WUGIsUrUpYWO3FfQN9oEc1yXvgUB
         p+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779359041; x=1779963841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7F78VVVB2LZkM+BbiHjkRKKbRJh9c96LH9MOwlb4/A=;
        b=j1800YH1zyVzCjgZS+V2JFCX8IAAuM9w0o38mhj2xpcuaz+jow+jiQwxQD7E9iEmIw
         ZXI8u9ufT9f5fNKmXOhuu30ZORPX61vV0EbO+zHYO406FOw20tRsNkQ/pGSOPHMmaILF
         FK1KCVRN/AqzMQayjmSOrQoa7dRmtVJDEqFtSN0iM8FPe2sg2kfjZoDN5p0BauwiQ6by
         oEw5LgcNtGMvrUmcD6IplfLCX6TOeO8fp94KIwiy4h6EKtfIFxeDRTaFbirznYzWkqZk
         O9qWmuRanf275WQWvHDW95AJNOmIjOL/FbIcHh9K9Q1FRe7dkDLzdh4QXSONQ39Z7Z5s
         xrug==
X-Forwarded-Encrypted: i=1; AFNElJ9I9E9BQgt93rPpBbLa8pnLUWJPhoVq86OuHfxpYTEt8UKhHXoq/F9+zwq8BbnaTbi9ux+HXSRvPLU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvDd5w9coKZXzBZ3AtYtBwFxRRxyT6URCWigNQV72UKXkwTeR+
	KBR28Eqe+zDuH1L7hSbhXc6ZeViKJ/VZrPGDFStsQpzVjAiNjawmsxuzf0zbxppIIg==
X-Gm-Gg: Acq92OEI9FEhTB1w/Brx2FsU8uLh65lGyRknnHohmEzbkVIFwN1Trx43dxzRQNA057p
	DIg4CVZ8gZfX01vMhSv9UAM70xf8O/SzNukVwJGvVyZZ18A0q23qyqIcn8DqyaumppE7Vb48IJm
	h8qMLU9eRDtFWEv032/W7v1EMgIIKmTjz6/0sDAmd6fwv2GLcYpKFdoMXMgny0FYX3CSqsdJUlN
	NObFJqDf1PKDC/zAnCYXSjsuYPChSZ4N+VvfHmrsrTo8pZRLfk+BwAF2L5Jdhu1L/IwfkLEMpzc
	q5ABJhE5TB2En7KbOaVP7O5jv6jtN5ihrbpE3GlF5XvN58iaDiyB7QiASsyA0ZU/Mo3iBa43LcK
	UxOhNVJmajexXvnCEpYcJN12uv04Aw3/MZBJZCvPaEjBNgpY9SpfzJyjsbpiKzAj8j0gy+WcKSh
	gTSP4wEjmSN4baDj9REVn5OGKlHZelXtKzNy5Kn1lVA4k3o0rX9sZ9dCXosY3QMChEro86FtA2w
	9hs7aFvgR68TTAoqNz4sWXI8A==
X-Received: by 2002:a05:6000:607:b0:45e:73b3:4515 with SMTP id ffacd0b85a97d-45ea413b984mr3818540f8f.35.1779359041000;
        Thu, 21 May 2026 03:24:01 -0700 (PDT)
Message-ID: <f2d7b907-53b7-457a-a80b-49c393238957@suse.com>
Date: Thu, 21 May 2026 12:23:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: strip debug info for intermediate linking steps
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7a2fb6cc-fc9b-43c1-9f4f-d5a573d52dbc@suse.com>
 <2d995d54-40fd-48e1-90c9-fbf6a9933415@citrix.com>
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
In-Reply-To: <2d995d54-40fd-48e1-90c9-fbf6a9933415@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779359041-B534AFF4-8E93963D/0/0
X-purgate-type: clean
X-purgate-size: 1778
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,gitlab.com:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5B6C75A33E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 14:51, Andrew Cooper wrote:
> On 20/05/2026 1:11 pm, Jan Beulich wrote:
>> Linking debug info takes time, especially for xen.efi. At the same time
>> symbol table contents aren't affected by presence / absence of debug info
>> in the linked binaries (the ELF and COFF symbol tables would have extra
>> section symbols, but tools/symbols omits those anyway).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The main speed gain is from xen.efi linking. Therefore I'm not even sure
>> if this wants mirroring to the other targets, where only xen-syms is
>> produced. It would mainly be some transient space saving there. (It would
>> perhaps want retaining when the linking steps are moved to common code.)
>> Thoughts?
>>
>> On the system I measured this on, "real" time went down from 4.9s to 3.9s,
>> while "user" time went from 7.8s to 6.8s (all approximate values of
>> course, as there naturally is a bit of variance, and all for full
>> incremental builds with no other changes, i.e. mainly the final linking
>> steps getting carried out for the common/version.o change).
> 
> If it saves time, then good; this will make an improvement to my dev
> cycle.  How does it fair on Ubuntu 16.04, where we've other known issues
> about the debug symbols appearing to be corrupt?

All builds are green in
https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14480259043.

> It would be nice to be consistent across the board.  If we're going to
> make linking common soon, then it's probably fine, but this does risk
> becoming yet another mysterious difference.

Well, I can add --strip-debug everywhere, but it feels somewhat unjustified.
Except if we take the disk space / I/O reduction into account.

Jan

