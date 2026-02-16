Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPNvIRTakmnKywEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:49:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED904141A9D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:49:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233763.1537115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruHb-0002aI-N6; Mon, 16 Feb 2026 08:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233763.1537115; Mon, 16 Feb 2026 08:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruHb-0002Xu-JZ; Mon, 16 Feb 2026 08:48:43 +0000
Received: by outflank-mailman (input) for mailman id 1233763;
 Mon, 16 Feb 2026 08:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vruHZ-0002Xl-TH
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 08:48:41 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a8197f7-0b14-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 09:48:40 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48069a48629so27563315e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 00:48:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5b4cdsm27762102f8f.8.2026.02.16.00.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 00:48:39 -0800 (PST)
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
X-Inumbo-ID: 4a8197f7-0b14-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771231720; x=1771836520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5RwUl7imZiFS3w8rjoXB0UOCuc8XFeeF77/jr1BWaPg=;
        b=AWmLJVyo/aXQ+slh4bZ/pNl3cn2xHRsT8xM8Egv+LOgluZpxnV+Yd0HgDNXWomRQM2
         s+QLSo7UZz5IZ0sRxzwtPU5KCcB+7cobr3GTNxsHJGNCy9BbaBveNSSd39oXaRB91Afh
         6LsqWa5cq/Y1qHcQ78opWpQMSt3bxB3qnFSOJZIbQmWgoQdXPn6UWIsKiI140pAS0A9x
         5LpEMtU+40WOdjy1i5NZNUcEEt8ILSzysR2WJGhCNGoRwLnPkuM7jTm8tDcBxHszmUA4
         NPKJdFN7tzxF3+NI1Gvg/LZ1dmvCnJUp7MKFPsGQDjegGpUMf5miNLTuJx5k6e69NUV4
         3/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231720; x=1771836520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RwUl7imZiFS3w8rjoXB0UOCuc8XFeeF77/jr1BWaPg=;
        b=AihZL5fg5ZZJsU/0bJmB/mBErcXVS7j9uRPKYZPcB5wjRqUJgcbJnhRvDHz+E3dHCc
         jPQ2Sb1aF67Zstg22fV1jge2GnrwzkMESjr7c2JEr4lrNENz2IBY4WZWHpxbH3r6TU56
         E3x/QUQTL9Q9Ki8MIFnfNF29vdXkvV/1CSbVBaTR1I+3TKkDQwotOSUuHmPcLy/W28vu
         nROAn8L4xjrKZEIsN+uKjGtxoz+aZTx2A/rXmUtk1iZc0eU+rZ7xUVlplAhScTfZUTXl
         g4m0AET/js4y6CgiI/7lDADl15OmilhQL7Hx5UzRm4Vx1o/AisGuTYYUPpcxpEvNKq5E
         nxcA==
X-Gm-Message-State: AOJu0YyvjECLHcUKEunz1fMXrnxucvpULzaYR0xvvWfX0vz0HbuKqIs7
	NrEqbTfBv+jIbCogP7rDSFpUG6p0AmTU4t2CPtVU6H7iXUG9VCQBg4ls02516QYHZg==
X-Gm-Gg: AZuq6aJKcywk5ujmRkgMK0Xvj4+5WAvEIX1SLJNp/j+ShXezuJfmmuaywzhYQpLj2sK
	q8uX5ZPvB7YKK9wxll4V0Ze/2GZKngyBGT+hzLmBSAwyxMryp9PJB+OG11LqlrX7kJd6LCeq/8G
	CednHe5Mg2aGO0/azJ2DR/DEcZY2+3TTqu2hD6Omac0NYPdTFbTQB9Q8fgACdZWyqY4v2aMtqNd
	rL0NpotmkCKs7SzfbBO8S9A+0djPg0ZEuCYWjJkXT0TujVbuofMQL24Gt2ahHMAwnIw3yaMo65q
	HgUXdSrNaT0OsWaDTjlkppkFKndYed6/krT/X9RBquwE70cgKXQp1Y90EMVN9f69kvQsAEB2Oxv
	+PVGkNsv9uZA/KYRuXu31AyImAECGRuJPNRtliVexV86NAemrYxGjAsSCT179k7QnvGxZcViUwZ
	QOk6Z9Ff0xSf/YX1VtCUdp0hVCNgsNigFZ7TOoRuZtULcwq3sw7vAz+WbwEujRXtJhdI7BFBjeh
	uht+f3knb9sMVA=
X-Received: by 2002:a05:600d:6443:10b0:483:8062:b43 with SMTP id 5b1f17b1804b1-48380620d3amr61729205e9.19.1771231719512;
        Mon, 16 Feb 2026 00:48:39 -0800 (PST)
Message-ID: <0ea96b84-52ed-4b8a-b108-223ff8f85105@suse.com>
Date: Mon, 16 Feb 2026 09:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cannot boot PVH dom0 with big initrd
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <aY6iVr990vWeO2p5@mail-itl>
 <440f94be-77c0-4b28-b107-6efc3623a92f@suse.com> <aY9Jt1-jCWhStcxB@Mac.lan>
 <42b32172-9e28-40c1-a83c-ba37e17f5480@suse.com> <aZLX5R_rO9EOUr_m@Mac.lan>
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
In-Reply-To: <aZLX5R_rO9EOUr_m@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ED904141A9D
X-Rspamd-Action: no action

On 16.02.2026 09:40, Roger Pau Monné wrote:
> On Mon, Feb 16, 2026 at 09:11:29AM +0100, Jan Beulich wrote:
>> On 13.02.2026 16:56, Roger Pau Monné wrote:
>>> On Fri, Feb 13, 2026 at 09:56:42AM +0100, Jan Beulich wrote:
>>>> On 13.02.2026 05:02, Marek Marczykowski-Górecki wrote:
>>>>> Hi,
>>>>>
>>>>> After fixing the xhci crash, I hit another issue - booting with 236MB
>>>>> initrd doesn't work, I get:
>>>>>
>>>>>     (XEN) [    3.151856] *** Building a PVH Dom0 ***
>>>>>     ...
>>>>>     (XEN) [    3.593940] Unable to allocate memory with order 0!
>>>>>     (XEN) [    3.597110] Failed to setup Dom0 physical memory map
>>>>>     (XEN) [    3.599884] 
>>>>>     (XEN) [    3.602482] ****************************************
>>>>>     (XEN) [    3.605272] Panic on CPU 0:
>>>>>     (XEN) [    3.607928] Could not construct d0
>>>>>     (XEN) [    3.610692] ****************************************
>>>>>     (XEN) [    3.613463] 
>>>>>     (XEN) [    3.616035] Reboot in five seconds...
>>>>>     (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_REG.
>>>>>
>>>>> Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f2899781755762f565
>>>>>
>>>>> If I skip initrd, then it boots just fine (but dom0 is not happy about
>>>>> that). 164MB initrd failed too, but 13MB started ok.
>>>>> Just in case, I tried skipping XHCI console, but it didn't change
>>>>> anything.
>>>>>
>>>>> Host has 16GB of memory, and there is no dom0_mem= parameter. Xen is
>>>>> started from GRUB, using MB2+EFI.
>>>>
>>>> Hmm, yes, there's an ordering issue: Of course we free initrd space (as used
>>>> for passing from the boot loader to Xen) only after copying to the designated
>>>> guest area. Yet dom0_compute_nr_pages(), intentionally, includes the space in
>>>> its calculation (adding initial_images_nrpages()'s return value). PV Dom0
>>>> isn't affected because to load huge initrd there, the kernel has to request
>>>> the initrd to not be mapped into the initial allocation.
>>>
>>> Right, on PV dom0 we do not copy the image to a new set of pages, we
>>> simply assign the pages where the initrd resides to the domain.  We
>>> can't populate those pages in the p2m as-is, otherwise we would
>>> shatter super pages.
>>>
>>> I think the fix below should do it, it's likely the best we can do.
>>
>> That's at best a workaround imo. We definitely can do better, and the bigger
>> the initrd, the more important it may be that we actually do.
> 
> See the second patch I gave to Marek.  That one is slightly better by
> accounting for the initial images space as part of the reserved space.

Will check; didn't make it there, yet.

>> One option may
>> be to similarly use the pages directly (i.e. by assigning rather than
>> copying), accepting that we may not be able to use large page mappings then
>> for the respective GFN range.
> 
> Hm, there's always going to be a trade-off.  I think I would prefer
> having 1G pages in the p2m, rather than a bit more memory due to
> direct adding the initrd into the p2m.

"A bit more" may not get it, when considering e.g. a 2Gb initrd on a 4Gb
system. And of course "use pages directly" is only the simplest of the
possible approaches. We could "shift" the initrd some, or we could make
sure to allocate a 2Mb or 1Gb aligned region to hold it right from the
beginning.

Jan

