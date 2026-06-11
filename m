Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZYUCHjHSKmojxgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:20:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD4673047
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 17:20:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=NGTPmaUR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335766.1597946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhCR-00030z-Iw; Thu, 11 Jun 2026 15:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335766.1597946; Thu, 11 Jun 2026 15:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhCR-0002yU-FB; Thu, 11 Jun 2026 15:20:07 +0000
Received: by outflank-mailman (input) for mailman id 1335766;
 Thu, 11 Jun 2026 15:20:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXhCQ-0002tv-Ha
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:20:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhCP-006zB0-UX
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 17:20:05 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ad221-bab6-0a2a0a5309dd-0a2a4509d4ba-24
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:20:05 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ad225-2497-0a2a45090019-d1558033e123-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 17:20:05 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso62910045e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 08:20:05 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c0d360sm84891655e9.0.2026.06.11.08.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 08:20:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1781191205; x=1781796005; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/T7wH6mUdWM65pZqVWCXuGqv60ER+I6nLJC5QoS87q8=;
        b=NGTPmaURVDtS7USEFsPZzksaj4WXuxnu2ZatXrVs56K5FCcTX5Nafb6uWanVAVrpzo
         W0fXOGMMHpTYBfhb2DBN/4KD4GcFQ/Qa0GHPkMnQr953QzRyh/PR2iQGkF1oRmTM1KZR
         vmbDYX9rOf4DydBMuPBZw4VZO1ToIqZ9mmD+vsV4GeN5dvhsquIAKo9noep1K9Zge+8n
         zUzktfuXProJEqn4HrT1qAjuJsmxYQhIE+952TDoRH4IDbl4B1edBih/pXeFxYqSIVnB
         Zr24dcUymc5Zxk0eDH9e/PA3SzO9oDSaz34OS80B3BGXjh1OqWfg5th3HPQwZzlbij73
         gy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781191205; x=1781796005;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/T7wH6mUdWM65pZqVWCXuGqv60ER+I6nLJC5QoS87q8=;
        b=cr+7xXDgo4/xgClqYQbDSnmZz2vMyjluFwQm3rut8oxSmWX4w/FzGirRKR9GDpCbsf
         zqhAD1TBKbth4E9qcU3SVdtqkwIydOfbXsjYsSKXDG0rCYfGuc1hqL2qnGNykQrljNpO
         EApfWjqokB3Htn6UiAt4pgIbmF74S4r+FK1hBI8R6VIztrTOqSaW2iZLYjC9jkhhieKL
         Cn71GeKozByyp1Z68DMiMGdBkwwm2XC0j6FnViAnT9C3G2NPL+bMjzGkMWwLKpFiHnTw
         HD7M4PJOrMZPXFyfszm27uDValf7alIA4cHYLmWn4W3OgKx/R1PyeEGz+ySLr9k93p7y
         S/aQ==
X-Gm-Message-State: AOJu0Ywlwl6xqh8lKxmX2fAZ0lalhEYo/94Uv3JM8fy72Xz/aIhAeC2k
	6snB6VMo/d0AOjtJpUqyOvTGdDLzvKhBC63NYykp3Axz5GDWNLLYcgEVI8P1eJwooA==
X-Gm-Gg: Acq92OF78I9hDM+J/14/eBFebbAqedmZuOUzDVkV4d9zZk3yB9Me19zRzY46TGx2Z82
	+n/dX7oO82QwcCKaGB6Cni3Wt9iUxhrX+sN4hkPWGXql2Rgnt4GLE6avADc8UYJo/4mbxzz3qCF
	cLmgVYIvCdMdEoea+73THJW3OSJaStHzjapgjuYRgGWNWtEykaEhBghYVvEe3FThlCK1xTDofpz
	W7MHYA8UZa2QM/Cs6lSnonmNd/1j4ffhNT8NN5xTkAWEEq9wHVgPIuOQoio92jTR0LTBtE2sfl7
	B9YVLmnofgbWX0dt9SaXHpPkrCcSOuZ1xu3Au9XOgz1XPZMB5zXTYvyDxNq1Xk3JKogjHOp5R6g
	02widMphIAxPHBjBcML00ojijaHJvOUOp5JIKZQdBuLwDr0B9SEMJ+Sp7oY5SloKyiWmk3bIhki
	0RY3GinMs2vD1vThuo03O+QwMuIaTO7aTUicYPB9Sre0BZOvjsjixp4QtDwJTMSKw/1Nveo3ZSC
	JYvWlBdmd9BDAyx0O82w2bFttC1Igr0xYtRoFalFJvjM4x+iqgFlDfl77oy9hahkOOZoj0=
X-Received: by 2002:a05:600c:6286:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-490e974e1d1mr8892865e9.29.1781191205244;
        Thu, 11 Jun 2026 08:20:05 -0700 (PDT)
Message-ID: <426c266c-a2f8-4895-b0e6-3205c1c188fa@suse.com>
Date: Thu, 11 Jun 2026 17:20:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] automation: enable Argo debugging in CI
To: dmukhin@ford.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, christopher.w.clark@gmail.com
References: <20260526215823.1452619-1-dmukhin@ford.com>
 <20260526215823.1452619-7-dmukhin@ford.com>
 <e087af10-4fee-4fea-92fa-5a647524af80@apertussolutions.com>
 <aidqm4wKkSxNPr3O@kraken>
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
In-Reply-To: <aidqm4wKkSxNPr3O@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1781191205-41969A53-14DA52E3/0/0
X-purgate-type: clean
X-purgate-size: 1388
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,xen.org,amd.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopher.w.clark@gmail.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7CD4673047

On 09.06.2026 03:21, dmukhin@ford.com wrote:
> On Mon, Jun 08, 2026 at 04:18:49PM -0400, Daniel P. Smith wrote:
>>
>>
>> On 5/26/26 5:58 PM, dmukhin@ford.com wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Enable extra Argo traces in CI to help analyze any potential Argo issues.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>> ---
>>> Changes since v2:
>>> - new patch
>>> - example verbose log: https://gitlab.com/xen-project/people/dmukhin/xen/-/jobs/14552079442
>>> ---
>>>   automation/gitlab-ci/build.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>>> index 7f5b5938e851..5f9192e53d63 100644
>>> --- a/automation/gitlab-ci/build.yaml
>>> +++ b/automation/gitlab-ci/build.yaml
>>> @@ -319,6 +319,7 @@ alpine-3.18-gcc-debug:
>>>         CONFIG_EXPERT=y
>>>         CONFIG_UNSUPPORTED=y
>>>         CONFIG_ARGO=y
>>> +      CONFIG_ARGO_DEBUG=y
>>>         CONFIG_UBSAN=y
>>>         CONFIG_UBSAN_FATAL=y
>>>         CONFIG_MICROCODE_SCAN_DEFAULT=y
>>
>> Why not just set up a job with the variable ARGO_DEBUG=1 and not have to
>> introduce the first and only Kconfig option turning on a debug logging flag?
> 
> My impression is that Kconfig is a preferred way for parametrizing the
> hypervisor build and upstream Xen CI jobs.

+1

Jan

