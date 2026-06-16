Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TD5DO1QgMWokcAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:07:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F54E68DE15
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:07:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=L3TVO85U;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339015.1600129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQhF-0000ck-HJ; Tue, 16 Jun 2026 10:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339015.1600129; Tue, 16 Jun 2026 10:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQhF-0000a4-E1; Tue, 16 Jun 2026 10:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1339015;
 Tue, 16 Jun 2026 10:07:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZQhE-0000Zp-NI
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:07:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQhE-00EtSe-3s
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:07:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a312043-2eae-0a2a0a5409dd-0a2a4509e9dc-18
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:07:03 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a312047-2497-0a2a45090019-d155dd35bdd8-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:07:03 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso2401902f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:07:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f450sm47068849f8f.10.2026.06.16.03.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 03:07:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1781604423; x=1782209223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=STC1wLT6iauUao/RujPafviZDOjWN7Bb/d+sT+qirAc=;
        b=L3TVO85UiQbt3RWZQcRA6jC9+CzNW44ELQwqaH2w1YRQyqXcsoIslfrXIRSaKrfNG6
         oXsyn2u5BmYOyduZ5gJz84HrfpIM2tmgOXn5GKKJprPsVj508uV80tc7FjD6hbLT4AZ4
         ETyBVJUhLCiheT6GnvfMxuKc51YD4y3QGNAF6WbQRTFaIUGVGc6Rq+rzWyYpETHVWgD8
         Z9tEOfvSD/Yp3w5Xfe0YCaSRqWkr2a0gxglmEIDf/nEN3eLUdUnwCcUAt20cxtOYOSFU
         2Sf8YZHDzDabrwwRwTYOmGIXNZ2+ndaGg1PsXesKgWnB1FkpBB/ayvnvbnscWwFzfZ4R
         bgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604423; x=1782209223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STC1wLT6iauUao/RujPafviZDOjWN7Bb/d+sT+qirAc=;
        b=o0mlwB2ZXf42alhCSHpK5IIiCLpEaaze2AAde8mo6bMvOBgpq054uDMYUzMUgk/brp
         vyo97e32m1VqZEqmWboNB+s3lyTkeC13PwpreUpjOran5Bh89hXQBJd5nSOSlD45MNMV
         7FlNvJSTzyTRy7dbQUS5enQmt3Dp6q5c8KSK2u4aswLr3GduGMeJs1PS6DWtvbp3knxV
         AL7qw6VfBr160UKvNeSZQ9ClMzZ8Ar4q54Jf3DaVZ3x2auWRwBJYtsULNcpMfCQMKEWc
         RCew2RJ2dX+ZqDej2ZpuoZfIu9yubQERfdx+Gebpfb+/6tLKTKzvcftcy//QVMlBNgIS
         GRug==
X-Gm-Message-State: AOJu0Ywj0LmEPwA2ovmhaGFlRKbUMFhdZj/QYioRtlvVMkPywnrptQNn
	EooUItGLvT6AQAEkjsQIj+Vbw9HGPDPC6b/Ljsd9+rPlGTpa1nqmp9/QtdZIGY+66g==
X-Gm-Gg: Acq92OHWE8BVOBOd8C2WdJAw5byObpM82iuinhVXS+24AAuRzM40UN4Uc04/8HSMaNo
	zYq4wtBHMem7LW1FAGdjHs4/PmYUBSlKw9o6c2lRlXp4j3iQlZ6hFOSF69kUlZpD5qEPvc957AJ
	jJufX/uP935Kdgq7o+bM90CcGbBmH0LbXb+wxw0GTDbhuKhXRfHSeAfoDr7d7PxQK7AYg0BzWsK
	kAlNzhN1k+E1hIuhvMPqn3kaMAvJCO/3/d0UElt4hgj4o2Kzpcoyxej2ISNh+DtWlOCK5paoogQ
	TtBN7dQfmLKBBuOvX3tCviGGnJhZmBnNGmu5f0NHN8leG97oBHxzbcaBMm7w5tOUD/v659ZBgBw
	L8lXT58qx53RGDuMAsDas2gbeTk2+QVo2XkJlFrhfKs+SqxTplyQwBbv/2uWmtVTiG/TkDfjSlE
	n9XK3P6keKL2rLdgz4E9vkd9yc+enCY76LZC7MQRu2342/0RPI27bwCLhuuiBGuU6hKhNmCPUJu
	siw7pthmJ2ngnQ=
X-Received: by 2002:a05:6000:1887:b0:460:e0f:8d19 with SMTP id ffacd0b85a97d-4606da5a613mr26472116f8f.9.1781604423063;
        Tue, 16 Jun 2026 03:07:03 -0700 (PDT)
Message-ID: <8a9c1f3a-6958-4562-9e4d-15cc5dd3907b@suse.com>
Date: Tue, 16 Jun 2026 12:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 9/9] x86/HVM: more checking for
 XEN_DOMCTL_ioport_mapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <b0a50973-7a84-4e69-8241-d761e9b887dc@suse.com>
 <ajEfD57XLXUEppCo@macbook.local>
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
In-Reply-To: <ajEfD57XLXUEppCo@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781604423-89B7BA53-D1223A30/0/0
X-purgate-type: clean
X-purgate-size: 1118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F54E68DE15

On 16.06.2026 12:01, Roger Pau Monné wrote:
> On Mon, Jun 15, 2026 at 04:16:41PM +0200, Jan Beulich wrote:
>> When adding ranges, only alter existing ones when there is an exact match.
>> Don't accept ranges overlapping existing ones.
>>
>> When removing ranges, only remove a range if there's an exact match.
>> Return an error when the range isn't found, and also don't call
>> ioports_deny_access() in that case.
> 
> Isn't the ioports_deny_access() part stale now?  As you remove the
> permission adjustments in patch 8/9.

Oh, indeed. Dropped that last half sentence.

>> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> Should "exact match" perhaps also include the guest port number? I'm
>> uncertain here as that kind of conflicts with "add" being treated as
>> "change" when the host port (and now count) match.
> 
> I think we want to keep the existing behavior and allow using an add
> operation to change the guest port.

Okay.

Jan

