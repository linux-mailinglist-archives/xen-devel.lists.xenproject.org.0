Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ksuDHfdKmqIyQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 18:08:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D1E67351A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 18:08:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=GW+jDGc3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335877.1598036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhwx-0006KJ-20; Thu, 11 Jun 2026 16:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335877.1598036; Thu, 11 Jun 2026 16:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhww-0006Iw-Uk; Thu, 11 Jun 2026 16:08:10 +0000
Received: by outflank-mailman (input) for mailman id 1335877;
 Thu, 11 Jun 2026 16:08:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXhww-0006Io-B7
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:08:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhwv-00BIu2-O5
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 18:08:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2add55-2eae-0a2a0a5409dd-0a2a450bb894-34
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 18:08:09 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2add69-212f-0a2a450b0019-d155dd34f17a-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 18:08:09 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-45ef616daf6so7680087f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 09:08:09 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46028a6dce6sm74615829f8f.30.2026.06.11.09.08.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 09:08:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1781194089; x=1781798889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RKPJofKUVZZ9y/6MKBRftcl3j0GOM42L7DbfM+Eplo4=;
        b=GW+jDGc3mY/ajDKwlLzgbWksarUKHkCMHAghA0Mju5xZqw5EvSV9DLxtr2fB1K369I
         o6Ww4iDABq8tchx1ZX8l598LnPfIHdkD8BspVwE2OZuldNWpnUuHEj9F5AxNFy0tDape
         F6LXN0bN+B9Ebwh4DQLzzsvDLYdBbszWgUiHUauGfiCxyPRPMOWavwevzFFsfgKswNpt
         2KXm5YuOCDb5Nj26hfTITubsmWt2q7R9HdjUyK3VCPhP8FPpL9B8CLpeBdfjCEMB0Mbt
         pZpt9kuXybRlOKYUgZ0HaSWCFOno9wpr5TeA95hPhBjyhPqMsov3ZSMW8H9Z6J9TdoKl
         ldXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194089; x=1781798889;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKPJofKUVZZ9y/6MKBRftcl3j0GOM42L7DbfM+Eplo4=;
        b=FaD3wqRoeEnB79+jMJVx5RIkQBsFa6+3nli4mlmZxqVvvtDptEYcwtbETtwE+AUKhg
         IbAna4QMM6l/0AI2VisnEVc6gb9YkVEpGcy7huOc2b+CcZ/xXTxbE7GqZAWn6EWk3OUh
         ZJz0dMIXQpy0qkEMa/GTB0eclCrkznw6xYFxcqbX13+nxDCGDZMVvBunGTsf+CLyMxwK
         QppnYnQwbF4sJjAamOXnIrUUId2GDV5hQ6Lsljt7IitycffjMImflQwxbtL7dNy3dTvB
         B29DJnyh9UEd/qTZ2Gj9Kos2l6hV/x3R+k1ljCtpKE4HsJN0NPzQF3CjHfx+QbCS83GQ
         5AlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/V6EGMlxlRsdi7VYETy2LpZ4EaYob5/9sZUa4DTDo9qR9D3obu10P1fwBgm53jctMDdjPWCks26Cw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf5DObCCQukCFjICe+yl41kU4+D4IeZfwdZEQdMfUkvz0yyfkm
	mLDwOR82hYp4+VtD0X84pUSlGJIgdgv0ifwXexIjPdJCMcm0SyvdUpS47glH07O2eA==
X-Gm-Gg: Acq92OEnLd48Cx5nvoYsJw6kOB2znD3gQUcou7e5cAlstmleyVAbzUxAH6GsbTuV7/Z
	c7AvXb9l/FfikFsQ3kRQz+KZFZfzFM8XpdsGwPeQmByONE25gDrgN5GsAeJhdAsnguVjy1JAiiR
	9ScxZCb1j5jrXZ5WfxPOx2ckI8Zr5JKDrs/Fh5LZkuzvkWb32n5NsfXT4zfMSv59btxJseKRYD6
	CHD3WMGxoBFJq1Pl+2wAgqpfgik5vts5ji2q3w1mts9FVDfkRzhmKY+2PbB527XmXk+F3hLbmCk
	KG8zxfYKmkhPWIUxvlwP0UeUw38DkvH3cx5OgUgl27g9sFx1pLZ9epV7zzia1+E+/NOejcnAyaY
	lqVGKG1SrEWeCMb3GXszl0gMAJPPI4w32nvw4dAGEmmtKZCWq/XIolKW26tv3wy9aesi/+2gmOi
	ulT1Hr166UGE87HehVqkt+IZnEN15GggwBy/KTUC0lUYVpxBrkxckKahq+iR+6sqT6HULARp1K1
	SOpLKi11w8/FDzg/1ZxH9eeeGzzoEj/wqmNVH8F/7YKQ4TMQdzKHaKzEys3
X-Received: by 2002:a05:6000:41e3:b0:460:3234:293f with SMTP id ffacd0b85a97d-460677e92a0mr6004174f8f.42.1781194089048;
        Thu, 11 Jun 2026 09:08:09 -0700 (PDT)
Message-ID: <57b3b624-297b-4d31-9933-164cb46795eb@suse.com>
Date: Thu, 11 Jun 2026 18:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] Align some sections to 4KB
From: Jan Beulich <jbeulich@suse.com>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
 <20260611153257.650054-2-frediano.ziglio@cloud.com>
 <9d59cf76-f0e0-4e6e-9413-6c7d70a4594b@suse.com>
Content-Language: en-US
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
In-Reply-To: <9d59cf76-f0e0-4e6e-9413-6c7d70a4594b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1781194089-13374F3B-AAE57B92/0/0
X-purgate-type: clean
X-purgate-size: 762
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83D1E67351A

On 11.06.2026 18:07, Jan Beulich wrote:
> On 11.06.2026 17:32, Frediano Ziglio wrote:
>> Required by UEFI CA memory mitigation.
>>
>> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
>> in the pagetables.
>>
>> NX_COMPAT is a requirement from shim-review,
>> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>> --
>> Changes since v2:
>> - Change subject.
> 
> Did you? The description also doesn't look to have had any detail added.

Or wait - the subject tag also says v2. Did you (re-)post the wrong version?

Jan

