Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI8AOTxEi2mfRwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 15:44:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5427511C066
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 15:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226447.1532959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpoy8-0007wz-LA; Tue, 10 Feb 2026 14:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226447.1532959; Tue, 10 Feb 2026 14:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpoy8-0007uD-HO; Tue, 10 Feb 2026 14:44:00 +0000
Received: by outflank-mailman (input) for mailman id 1226447;
 Tue, 10 Feb 2026 14:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpoy6-0007to-W7
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 14:43:58 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee0ad15e-068e-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 15:43:57 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so41760175e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 06:43:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2facsm35408334f8f.9.2026.02.10.06.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 06:43:56 -0800 (PST)
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
X-Inumbo-ID: ee0ad15e-068e-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770734637; x=1771339437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OewjieWvu9HOAKX1qhL+XX6XHvbLCQZU38/WcrnIoqk=;
        b=Mf+sLkFMEUpDzgzDM2YvkuqrOgC1Vsj7+AEYu+VAqGokT8btvxP63LFtidsiEfXL00
         hAvh/WquytyJRbv5B9DUMjgieGC2vdIfFboWipSuec40mdpy0Yo0d2QHH5ntAyEMw6FV
         NmYuDV3Kf6bovS5SMpejb3Ys7PzzSOBSrSG8xfw0NV73ZtGld2HR6LYTre1IcecT1kAb
         BZJJIhb5ZHLDe+vZAOPL5taJuLudW3K4xiAIRvJMgMqVfNdyG7bOfm2jRJIPRYaX/zxT
         Yzhw6HwsLkt3K4bq4d9xJ8QpxImXRIO0rtrX+27PecV0xFtig3gHXvDVt+W/zmlUd5Gi
         Fmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734637; x=1771339437;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OewjieWvu9HOAKX1qhL+XX6XHvbLCQZU38/WcrnIoqk=;
        b=SC3yf94pXM5TSP+mYMvZCZNRDutX8wgj5oacoKl7FdB7qYHnYvGMx0QkmjxtShbVJp
         kZLuojDZWGg4Qyn2mROTKkse1LbTxAsAF6vGwgdXmSD3E/QUcfrHHjE7DtHkCBi43H0p
         1YRnZWnO/yZKuDfy0tDdCggEalZ1e2P4Y9ZMmCBOJ0uXcygIguD5rRss/n856VkEVK5A
         0fNLwl0vnct43urgsNNEmrwT0a1YgzNxMWP6pXLnUmu1krZ1KTNRIulMKbshoGc6VRjf
         FFpsME8cZ2SSpo2RiSVXyu2alg/rU67/JYLRXZzGKX2SWuipvvW+aP6sQdXAt3XDnjcb
         AaWg==
X-Gm-Message-State: AOJu0YxkxvpjzCZN/JW6vfNcy8SLLJT7mMqfDK0o//f9QPYXR3U5GnTO
	iI7Cu5+q+9lg+16VSv9VOPa2c638yOZdkqVhdr9xElnl7IcaU+RM1r/fA6lo27SRNw==
X-Gm-Gg: AZuq6aKrXcpOZzsz4mSnEPltylAvsYE1BVAsmP1zx5uCEg8aHJLFn2FGtCvjcVqYruL
	HCTVkpYBDlQG9MVlhTeMA/WG5rzUjaPv1yQrAzVjTzXAagHwK7p4olnzTkam9xzzXUD16TK6VgI
	LDPQ61Npz8phqeTSfR3WiU1r6ouRRQgk/0An4O9UgYf+un7FnaRraLJeuat40K29k0aOrsqbtKl
	GsPktwFg7AED7JJwXnX+xonYx27UxQTcB7QT3uVteEbwF7rIL+YTIPcZBkklk7VwxitwkVC+l2F
	0tlV8sbR+0LgDeaS1/Nqanq1W62adVcQPO7/7CTJGp/D/1TIqXhWVIyFcENlfVAxw2joIzDU8qr
	RdG8iyiXaAAGxTG6emp34p1exZRftBoFlco5vSm10xq9mt78TB4b19M+dM2SneVNx/SsUQz2v3A
	GGqLW3hCPBlMyuMbawlxsRpBcwgWVqGPJiOhiAwd56qjW/dfvr701uax74rRMr9dbZFw4cT385s
	4EExDOHcaW1k98=
X-Received: by 2002:a05:600c:450f:b0:47e:e97e:11aa with SMTP id 5b1f17b1804b1-4834f6c154fmr39005795e9.4.1770734636928;
        Tue, 10 Feb 2026 06:43:56 -0800 (PST)
Message-ID: <350a6794-5117-49fd-8850-a34f83a2ab91@suse.com>
Date: Tue, 10 Feb 2026 15:43:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] non-x86/symbols: check table sizes don't change between
 linking passes 2 and 3
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b61b7054-b27f-47fc-b268-f1dae3f1980d@suse.com>
 <aYtCxOVsoLTd1fNc@Mac.lan>
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
In-Reply-To: <aYtCxOVsoLTd1fNc@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,xen.org,kernel.org,epam.com,arm.com,amd.com,raptorengineering.com,wdc.com,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5427511C066
X-Rspamd-Action: no action

On 10.02.2026 15:37, Roger Pau Monné wrote:
> On Mon, Feb 02, 2026 at 03:45:37PM +0100, Jan Beulich wrote:
>> Extend commit 1df11ccceb1a ("symbols: check table sizes don't change
>> between linking passes 2 and 3") to other ports as well.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Do you know whether the risc/ppc builds in the CI are OK after this?

Not yet, the pre-push testing will show. They are okay in my local builds.

Jan

