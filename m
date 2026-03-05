Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCdhKdVQqWkj4wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 10:45:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0953E20ED4B
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 10:45:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246370.1545572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy5Gx-000301-GS; Thu, 05 Mar 2026 09:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246370.1545572; Thu, 05 Mar 2026 09:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy5Gx-0002xh-Cw; Thu, 05 Mar 2026 09:45:35 +0000
Received: by outflank-mailman (input) for mailman id 1246370;
 Thu, 05 Mar 2026 09:45:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy5Gv-0002xb-GN
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 09:45:33 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cce88f2-1878-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 10:45:31 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48371119eacso93340205e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 01:45:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fadeb5bsm43355515e9.5.2026.03.05.01.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 01:45:30 -0800 (PST)
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
X-Inumbo-ID: 0cce88f2-1878-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772703931; x=1773308731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u35ZfvqWtF9yNhv2mrL/KlcTzbQ+4dd3N9VGDV9JC/I=;
        b=c58tsw59UOIXpJE81mFE1n3muTGEhzd/zHZrsFfJiqTA9j5Zb8awomB01emgCSlMpE
         adC0Y6bkpEBVRW/HIvU8h1NoGcISXx0hH8MAG7bAahRaVM9zMyEiTGbQz0zCtWEX0mrv
         ZK0rIlbaYUNnBLh/T0OJhQaPH98Q8CoXW0K7xHiDQG5Xq+lHY/urOePWcW+CG6vFu+9V
         fSfiEQhCClA2lj2MazbvjRzgpxLgnmkIHMFa/V/RMWvSL2HYzqrE7utXKgHSfEjq/3UX
         ypNTcZPEmtkke+jJN+NAu97lpsF4mfKdkbNweoE4xAHmMPJQJiY1b5zQmyG5xRBgDtWO
         cwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703931; x=1773308731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u35ZfvqWtF9yNhv2mrL/KlcTzbQ+4dd3N9VGDV9JC/I=;
        b=dTycBCiqiICZ1h27o4KVi/8SMHz6HwkK+8C8DC7lTIw9EbicwwAr1Fy0+XzoJ6O2wB
         +RaIcEMt+l4SDXgQp58FQd8FQnTNqyZNX0KoEyeVJ5aCm1Jmi1cz/L9CwbBLKI1jQwAH
         AipVio2QmI3djtro4h+405MJaqBfPJF85Kqbwr4buRyvCTh4ROhU9W2fiMQzRCw8pTE8
         gxQJVvXlI8MjqSsafP0tE0Bq/HT2rOulC7mTIKkHeQ52OlhoGBG8H38GeUd1QrGaPcen
         35MC6J4DJRPZFKZqyAXKVwi7frhf+evJMx2THOkbfIw3EYh0bg34nep/3kygS54fWocQ
         b9gg==
X-Gm-Message-State: AOJu0YyX1XBUa2whv08AiWNpvy765ZhvoDbuwg+F/zI3BmF6Px8YglVv
	ZCtBm8/xMlRlDgROXHZ9NGPHAQQkV9+Mzcx9tHm/DWCxlGxAIjdDo5cPUt0DA6NnZg==
X-Gm-Gg: ATEYQzz2AYzjDKqTwUdoDZ8ffUSAYYJo+uYr6hb5/u6A6cc3XD09IIl50VeYBWSOd3E
	CxmdRBnEMQdFgGvX4xizayVAKczmAKDbTGAfVlqPnUwxNbEoaZnSAh+yYFKmSH0JMI+xqpMRUmW
	4Z4iBQVdfGl0s81Hl6AeDfytVSHUJ5/gXGgKZEwk3rL7nmvSqK4oIcP6SyX7eT7oqpk5htTmS26
	z+8IgdAm4zocC5FLxdBrYb4tCPnbz1FqxbKikdih6nlFqEsFvSUWD6C/qsZfM401uC5N9u871W4
	PpgbKDZ5E0Rqesl8zfdCl6X8HVb4r/RaerokfYOALRUFkzxjcA4a4/4sA11KF4D8KShO3IHiR71
	J6cOwB3z63DGAqIYL7YYMcLlk7Y22LZj+dCpWg6hAV803k4IP+gCcYIVaEDRczOwoKD+5Vb+LYg
	bBZC/aOHMc+MWP7JaH9WMwjQ0y8dhGk2A5N/Eezhu7y2UcKgyBvcgVM9FlclBcDreCZNPgt9Sjc
	PftIRMU9M77+aE=
X-Received: by 2002:a05:600c:4f4c:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-48519849bd4mr93711395e9.10.1772703930948;
        Thu, 05 Mar 2026 01:45:30 -0800 (PST)
Message-ID: <bb06fac8-43e7-4d9b-81b6-970066b8bb73@suse.com>
Date: Thu, 5 Mar 2026 10:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] vPCI: re-init extended-capabilities when MMCFG
 availability changed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <9f1fcbfc-e7b6-4ef3-8f58-c88f9667d606@suse.com>
 <aahKkV2csf28Y0YC@macbook.local>
 <2c3fdfb6-5788-4177-a264-56719e1ae804@suse.com>
 <aalLc4tN5ywM3c_W@macbook.local>
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
In-Reply-To: <aalLc4tN5ywM3c_W@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0953E20ED4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 05.03.2026 10:22, Roger Pau Monné wrote:
> On Thu, Mar 05, 2026 at 10:00:13AM +0100, Jan Beulich wrote:
>> On 04.03.2026 16:06, Roger Pau Monné wrote:
>>> On Wed, Feb 25, 2026 at 12:44:44PM +0100, Jan Beulich wrote:
>>>> When Dom0 informs us about MMCFG usability, this may change whether
>>>> extended capabilities are available (accessible) for devices. Zap what
>>>> might be on record, and re-initialize things.
>>>>
>>>> No synchronization is added for the case where devices may already be in
>>>> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
>>>> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
>>>>
>>>> vpci_cleanup_capabilities() also shouldn't have used
>>>> pci_find_ext_capability(), as already when the function was introduced
>>>> extended config space may not have been (properly) accessible anymore,
>>>> no matter whether it was during init. Extended capability cleanup hooks
>>>> need to cope with being called when the respective capability doesn't
>>>> exist (and hence the corresponding ->init() hook was never called).
>>>>
>>>> Fixes: 70e6dace747e ("vpci: Use cleanup to free capability resource during deassign")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> vpci_reinit_ext_capabilities()'es return value is checked only to log an
>>>> error; it doesn't feel quite right to fail the hypercall because of this.
>>>> Roger brought up the idea of de-assigning the device in such a case, but
>>>> if a driver doesn't use extended capabilities the device would likely
>>>> continue to work fine, for Dom0 this probably wouldn't be quite right
>>>> anyway, and it's also unclear whether calling deassign_device() could be
>>>> done from this context. Something like what pci_check_disable_device()
>>>> does may be an option, if we really think we need to "break" the device.
>>>
>>> We may want to add a note there, stating that we have considered all
>>> possible options, and hiding the capability and hoping the owner
>>> domain would continue to work as expected seems the less bad of all of
>>> them?
>>
>> While adding that note it occurred to me that in order to keep the device
>> as functioning as possible, in the re-init case vpci_init_capabilities()
>> might better not bail upon encountering a failure, but accumulate the
>> error while continuing its loop in a best-effort manner. Thoughts? (One
>> of the two return-s is already guarded by !is_hardware_domain(), so that
>> could be left alone for the immediate purpose.)
> 
> Right, yes, that would be preferable.  We already print a message for
> the failed to init capabilities, so there's no need to print another
> one in the caller.

Hmm, that's another aspect I didn't consider. Yes, the log message in the
caller is redundant with the present code structure. If we expect that to
remain like that, I can drop logging anything from
physdev_check_pci_extcfg(). Which then re-raises the question whether
vpci_reinit_ext_capabilities() might better return void. At which point
the comment I put in physdev_check_pci_extcfg() (upon your request) would
want to move there.

But my earlier question went in a different direction, and you didn't
comment on that at all.

Jan

