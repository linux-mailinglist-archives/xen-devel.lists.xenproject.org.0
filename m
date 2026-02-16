Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Z7VyOknRkmk1ygEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:11:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51020141716
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 09:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233742.1537094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrthb-0006P1-RZ; Mon, 16 Feb 2026 08:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233742.1537094; Mon, 16 Feb 2026 08:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrthb-0006MS-Ou; Mon, 16 Feb 2026 08:11:31 +0000
Received: by outflank-mailman (input) for mailman id 1233742;
 Mon, 16 Feb 2026 08:11:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrtha-0006ML-Eu
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 08:11:30 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17f01b8c-0b0f-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 09:11:28 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4834826e555so29613975e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 00:11:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a337dfsm81163425e9.19.2026.02.16.00.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 00:11:27 -0800 (PST)
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
X-Inumbo-ID: 17f01b8c-0b0f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771229487; x=1771834287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=diQbNHcEpL4P3pIMbO5nLzUWhJwz0cl2ELoymmlrwzo=;
        b=T14nOiLrOtbm2WkBkxvdUoWiEqccD9FzIcJwAg3glneIuCYLNLJ+Ltvoo700o66DMW
         fpuW5Ll+Gl5yKtIaeIErA7kunpLGpZXhXFHwwieHAOOiEF2ekzXVNCK6Un12gMujlcbE
         qKs8cRIZCXEGEmhMiDMc/8DPimRPJRHNTYampC/rcA7aaL3mCq5rlJ0kLnvJHnkJNlpm
         peRa/Xltyo6kedJEG/2s51Ul/otng4fPN1YBkNFg89vaxuLZNzxIc4vX3xg4FGfXimpm
         9wq4UD4sdg1O3jxYLTKvCbzngvu6mLoBn9XnPyNNeyAY40mH7hzfL87s/5f15hOud1zY
         FExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771229487; x=1771834287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=diQbNHcEpL4P3pIMbO5nLzUWhJwz0cl2ELoymmlrwzo=;
        b=Q0w56VBhQ3FioSOouRI6K74wDAijPpVkh4KQ5yBTwiGYmzg3NFLrD5ys5zpvW7/a2Y
         rcyNn/3u59fhYghJED+fKx6fQTy0D59HnOP4VMuySKdGSdSdEK/P9cRf6Xav4YMLoFWZ
         j5MwQihPIAm8TEJF6Mxo2J8nXFpHUXsdoHwm29weBPKJ0xJoCkDGLNrt6fsCRCDfvdPd
         F/9a1PDqollzzZCmWcdTm9Apswd9TU83AyetK7rvEuLNTaQ3S4liVNO61wI4W5yI51yr
         IjSkLhxSm/Uo4NbmXNctSCQT1C0BxU3TkH7qTesn6C1YiB/LPABeoMMu/TxME72nPdWB
         dEmA==
X-Gm-Message-State: AOJu0Yxeam0R9KlU9me7DasD+coZpWDA6EUZZ5ghwTw/p7HxN/7Frodv
	rWTQtCKvwE22G5HDzGO6Er2QYY/4n8CVZyVgtT+/q4QJS/2gm0hG9x8NqEHqoZ/yTQ==
X-Gm-Gg: AZuq6aIq/enTkKcCAT3evAyzHvuOCmrGaibWm2dM0qOQGWEpVLwqGmO8YVSNFUvP/gz
	AvKI+gn/pwio27hLItm0D2ldrWwNpS1EcugJMFYieoyDBatfotmor8LoLMwDeaqUZZIs+3ZNDLX
	u98IJYxyaQgeHQmVj+RFQXcNsFR2sulXsZtWp6Yp36x2gAQuomjUr8LdBoCkiolnWFaYr+38wyb
	phznygnbdoY7NX/W+EIy+KEXqg6uQDOgV5gvZt+F3JBK98Yjj9uTb5NEgzWKwHa/LYoEcAbhCtK
	nbU7HCX2iB/N6C+hKC/FtTBV8+r6oqu5bLar6u/2oT2c5CcbgsZlinwxMC0j31mHitxbidiZN/4
	TGHT0Bv5fX2ozZqVQ+oWRgrOepf/6TH5BcBCdIE/mKey5BoESCo4tAtt5avmJA6R8ee975uqQR8
	fxfdXRTAyAJVbTHRQpAhzTZDomODWNrN0+fBe/xO1tf6HUSnmwJTHKN89VIkYSbHhMY24hyq1vh
	48v41n5VTouQms=
X-Received: by 2002:a05:600c:37cc:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-48379b93370mr117547095e9.5.1771229487396;
        Mon, 16 Feb 2026 00:11:27 -0800 (PST)
Message-ID: <42b32172-9e28-40c1-a83c-ba37e17f5480@suse.com>
Date: Mon, 16 Feb 2026 09:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cannot boot PVH dom0 with big initrd
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <aY6iVr990vWeO2p5@mail-itl>
 <440f94be-77c0-4b28-b107-6efc3623a92f@suse.com> <aY9Jt1-jCWhStcxB@Mac.lan>
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
In-Reply-To: <aY9Jt1-jCWhStcxB@Mac.lan>
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
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 51020141716
X-Rspamd-Action: no action

On 13.02.2026 16:56, Roger Pau Monné wrote:
> On Fri, Feb 13, 2026 at 09:56:42AM +0100, Jan Beulich wrote:
>> On 13.02.2026 05:02, Marek Marczykowski-Górecki wrote:
>>> Hi,
>>>
>>> After fixing the xhci crash, I hit another issue - booting with 236MB
>>> initrd doesn't work, I get:
>>>
>>>     (XEN) [    3.151856] *** Building a PVH Dom0 ***
>>>     ...
>>>     (XEN) [    3.593940] Unable to allocate memory with order 0!
>>>     (XEN) [    3.597110] Failed to setup Dom0 physical memory map
>>>     (XEN) [    3.599884] 
>>>     (XEN) [    3.602482] ****************************************
>>>     (XEN) [    3.605272] Panic on CPU 0:
>>>     (XEN) [    3.607928] Could not construct d0
>>>     (XEN) [    3.610692] ****************************************
>>>     (XEN) [    3.613463] 
>>>     (XEN) [    3.616035] Reboot in five seconds...
>>>     (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_REG.
>>>
>>> Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f2899781755762f565
>>>
>>> If I skip initrd, then it boots just fine (but dom0 is not happy about
>>> that). 164MB initrd failed too, but 13MB started ok.
>>> Just in case, I tried skipping XHCI console, but it didn't change
>>> anything.
>>>
>>> Host has 16GB of memory, and there is no dom0_mem= parameter. Xen is
>>> started from GRUB, using MB2+EFI.
>>
>> Hmm, yes, there's an ordering issue: Of course we free initrd space (as used
>> for passing from the boot loader to Xen) only after copying to the designated
>> guest area. Yet dom0_compute_nr_pages(), intentionally, includes the space in
>> its calculation (adding initial_images_nrpages()'s return value). PV Dom0
>> isn't affected because to load huge initrd there, the kernel has to request
>> the initrd to not be mapped into the initial allocation.
> 
> Right, on PV dom0 we do not copy the image to a new set of pages, we
> simply assign the pages where the initrd resides to the domain.  We
> can't populate those pages in the p2m as-is, otherwise we would
> shatter super pages.
> 
> I think the fix below should do it, it's likely the best we can do.

That's at best a workaround imo. We definitely can do better, and the bigger
the initrd, the more important it may be that we actually do. One option may
be to similarly use the pages directly (i.e. by assigning rather than
copying), accepting that we may not be able to use large page mappings then
for the respective GFN range.

Jan

> Can you please give it a try Marek?
> 
> Thanks, Roger.
> ---
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 0b467fd4a4fc..8e3cb5d0db76 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -343,7 +343,7 @@ unsigned long __init dom0_compute_nr_pages(
>  
>      for_each_node_mask ( node, dom0_nodes )
>          avail += avail_domheap_pages_region(node, 0, 0) +
> -                 initial_images_nrpages(node);
> +                 is_pv_domain(d) ? initial_images_nrpages(node) : 0;
>  
>      /* Reserve memory for further dom0 vcpu-struct allocations... */
>      avail -= (d->max_vcpus - 1UL)
> 


