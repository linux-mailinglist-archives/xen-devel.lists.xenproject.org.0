Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N4IKJkevGkvswIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:04:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2392CE4B7
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 17:04:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257347.1551758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3FrE-0004hl-T9; Thu, 19 Mar 2026 16:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257347.1551758; Thu, 19 Mar 2026 16:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3FrE-0004fb-Pf; Thu, 19 Mar 2026 16:04:24 +0000
Received: by outflank-mailman (input) for mailman id 1257347;
 Thu, 19 Mar 2026 16:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w3FrD-0004fQ-FK
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 16:04:23 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43626cc3-23ad-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 17:04:09 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43b4d734678so1135708f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 09:04:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51892290sm16430695f8f.20.2026.03.19.09.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 09:04:08 -0700 (PDT)
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
X-Inumbo-ID: 43626cc3-23ad-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773936249; x=1774541049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=14in53C+p0nIOi4WbUF/ZylxiyjAvSYMn6YK5z/k+PA=;
        b=GFxCIA/cMWb1vex5JxFOawOc1aFbSHvJNWfvBqVQrWJRObPJzO+5ovnXe7rdrVbc5M
         P5pyrUoJR3/9X7pe8ottY4VZw3bX2z3koi0PHIeA8bMAqrzvPCPEgW7NwYLfppIvxBJF
         KtNpXWeqo9icsdmMdfEYVonTS81FYDVEeUyqfngLNUbOngSK7S4sJIr7F8YF2mqJUVSu
         GdswN1M7kaKYHGYbbtHLACBmECc5upICV0GQPlrcJZdG59hIz/1W7KDFpQNvGCORNpqz
         KmywuqyfpMMcDNUoKYqkpKUFrhRsdjYBATBlb6/rzI2dJBfHLi0oR/akcNLlFdGMtTa+
         5TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936249; x=1774541049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14in53C+p0nIOi4WbUF/ZylxiyjAvSYMn6YK5z/k+PA=;
        b=Q8yefEZophrJU9WAOoueLBSpoGIlrzYzSB6Rc+pJe4WXaA7fzUidW6Gird9Sgtce8f
         P9qTda4Aw96thwUpx9QhNx71sIuemYshkMYIFiHO6EVY1dlNSBhDvfzQIqL/cR7pt2V4
         8hfvrIf39iAkQSjpPUe2jubMm58NdbM6adgI2YQs6ADxsKuHdiEmq7kkrv9lRvDtYufn
         BEzJfWacCTv3PKI2hTan74D1YoJS6mXl03Fdl+RdjL6PKrW2Rew3VVrgkS40Fl+rwP88
         df+q+rXSoDpPyv3afPRqgwh2sXxqVwt3bhqt/bWfjNdI5mJC3L7nbUG42Yfz+OAxo8yE
         KrjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyUZ206VUbQRCrH6Mic2Ea0BLHQLB42ECsyYxAPxAMNlywuud4DH896rgznjZ7GCmjcPzkisBDdPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLQMswfiUbEbQsUjCmXWmaN8JRb900kpZK5AqGfq9ZLbCujCQt
	fAzIuhzfuKiiZtNz7SWGwICw2uF83w8CU1uFaWwmDATT5OFCfEBnIp82Wf3m5HY5dQ==
X-Gm-Gg: ATEYQzzp+p074A9YsIniRh2EorAvhWngkg4xxV0PrZcyV7I0tSEtO9jTMJQg/3A0Rlu
	DDD9Zvb/efdlWiBMAiB7GlUsY8+T2DJWbZQH6UY3F6t3jfhPGXyRtAfMopUcITPJdpT6PJ6CB13
	15EyLWC0e+sVlel5KzKzR8p/rBpy6VbZO5tB/wUc1bBGBfc5LtzY4X0uUQ+/aC/mkf49PKQ3fwd
	tzk3F+XVLfVqXy8gnMC+xrJJLwKrM1Xl4dqUeBWlNgbpL0EVsdjVl4SCSF1eI10o5hKHHmnzglK
	3lY05z0DF7rSic9z/7OmrPDLUAkYpkFFJHI+JZ/yci1TLclmLBZd6oLzjvEHjLgB56fJsGywEh+
	9dfnq0Z9lhEeMaWR5W+JwzS+DCA6i/y4Sw4gtax4kXonTWNRxYsSVRqG1ztz6G827SPRH8Y+uoe
	Kqw8xCEXUDmessqaKMEpVifMynSVbPfNhCfUiWmd3g7x+eFY1F2UfIDDj9U8JnyaYvH1APaaBxz
	ATtB1BL5ymLpUk=
X-Received: by 2002:a05:6000:420f:b0:43b:45d1:f438 with SMTP id ffacd0b85a97d-43b527a3f0amr13690490f8f.3.1773936248504;
        Thu, 19 Mar 2026 09:04:08 -0700 (PDT)
Message-ID: <3e16b42e-26a4-4d70-95da-8a22ea401146@suse.com>
Date: Thu, 19 Mar 2026 17:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: handle domain_shutdown() return values
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <95dacecdce8f8417562548e16a4d3e11c41a3f27.1773923242.git.mykola_kvach@epam.com>
 <48841930-bb2f-48e7-963a-e823fec70442@suse.com>
 <CAGeoDV8abhMCR2+Pr_A-ZcKoLr_S=Rp_5a1mODrK9UPRzH+OSA@mail.gmail.com>
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
In-Reply-To: <CAGeoDV8abhMCR2+Pr_A-ZcKoLr_S=Rp_5a1mODrK9UPRzH+OSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0E2392CE4B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 15:35, Mykola Kvach wrote:
> On Thu, Mar 19, 2026 at 3:44 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 19.03.2026 13:42, Mykola Kvach wrote:
>>> From: Mykola Kvach <mykola_kvach@epam.com>
>>>
>>> Propagate domain_shutdown() return codes through the shutdown paths
>>> which can still report errors to their callers, and log explicit
>>> failures in fire-and-forget paths instead of silently discarding the
>>> result.
>>>
>>> This makes the shutdown contract explicit for callers which can report
>>> errors, while preserving observable diagnostics for the remaining
>>> fire-and-forget paths.
>>>
>>> It also fixes MISRA Dir 4.7 and Rule 17.7 violations by ensuring that
>>> the returned status is tested or otherwise used.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>
>> I don't agree with this. For what you want to do (as per the link below)
>> this is a prereq, but as an independent change I'm not convinced this is
>> needed. Once it is grouped with that other change, it's kind of natural,
>> and hence any Suggested-by: would feel odd.
> 
> I see your point, but I'd still prefer to keep this as a standalone change.
> 
> It is no longer tied to the suspend/resume work, as the changes adding new
> error cases there are gone. What remains is making the existing non-void
> domain_shutdown() contract explicit at its call sites.
> 
> So from my perspective this patch stands on its own for two reasons:
> - it fixes MISRA Dir 4.7 and Rule 17.7 issues by ensuring the returned status
>   is tested or propagated;
> - it avoids leaving latent bugs behind if domain_shutdown() gains additional
>   failure cases in the future, beyond the currently relevant ones.
> 
>>
>> I'm further unconvinced logging is the right course of action in all of
>> the cases. Some may want to be assertions instead?
> 
> That said, I agree the handling likely shouldn't be uniform across all
> callers. I can revisit the fire-and-forget paths and use assertions where
> a non-zero return should be impossible, instead of logging unconditionally.
> 
> If I understand you correctly, then without any additional
> suspend-related error case being introduced, you don't see enough
> value in this as a standalone patch. Is that the right reading?

Not entirely sure. Much would depend on what the description of the change
would say. Addressing Misra concerns, even if just latent ones, is a valid
reason to make such changes, for example.

Jan

