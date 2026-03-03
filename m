Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMwTFQURp2k0cwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 17:49:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F31F41B7
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 17:49:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244964.1544315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxSvd-0000Z8-AD; Tue, 03 Mar 2026 16:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244964.1544315; Tue, 03 Mar 2026 16:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxSvd-0000WN-7D; Tue, 03 Mar 2026 16:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1244964;
 Tue, 03 Mar 2026 16:49:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxSvc-0000AK-2j
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 16:49:00 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df6fbd7b-1720-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 17:48:58 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48374014a77so71472395e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 08:48:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483c3b89c99sm359127545e9.15.2026.03.03.08.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 08:48:57 -0800 (PST)
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
X-Inumbo-ID: df6fbd7b-1720-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772556537; x=1773161337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g0mLQdApzNBJwno5estL6Zp2Cn3YSUdJlxvg63cs+l4=;
        b=R8LHNYbYbYeRARcn/HkFKmO1sHw607nma4eSm/43ashi7DTRo4+lcQU+mJljhjivrj
         oPKBpcF3xJxcTXfiJKcbzp8xgOfskYu0HpcMzIzoWqJKU4T27j2RhyEEANCuY+hb9QBW
         4R1IUN5ZUvA142m+0o4iwHNubi/lnDzhxWosS6GZmtj53KZwcaiIQ7wwFNnXPeFzQ3UV
         jM5TGyqbDSBupkUJObBCLS+x7WBCFjGvT0c+cRFdGqxZEiaopn580Gz+fb0GFDYZeCwH
         wpPMVAjtNq+IRNdt+F14vfNGkVbCO0+YBJKyfOl/UsWdRxNPJZ4nlbGCtaYRMm5dd63v
         Bg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772556537; x=1773161337;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0mLQdApzNBJwno5estL6Zp2Cn3YSUdJlxvg63cs+l4=;
        b=eudSrqgL0ltrJqhfgudQCYy/ZaBQxgslUBpvBPGy1+PwBZjzrJEH7TfGWIvF9jmwia
         jZ+D/rKFCrx70ITuy2Bna7URiwZS9uOS4eSu7qMFIKUNNkm2n3K2FaxdZ5d+xONm2+//
         whHfJSN/+c5dtSJhmweTm80b88+roODG9qdaUzNaMgKNmPde8ZoDPryMljoqZnihLFMX
         sOPEGwsw6P7UeH8OLdN99j+o5UhcXKtwulFF0I6mizfi+TWJ+Kv0hplWyGH2wicU/sCc
         6ZEqSxdhPH8++tjN8BU2gcfkUxhREBklnZyguf6iTHEjFh52MVJ3aa5MYnclNPdrNr8+
         g8QA==
X-Gm-Message-State: AOJu0YxLaK8/CtPt8A8mPvZzSRKYwHsKDAKVT7VurjnxYad8r/NJB4KS
	T4dsAJBjOF7cRemDW5HZOfBg5rNrt7QbOqwCGwlgyqYG9/xQclL0rhE/8yVn9+sxnw==
X-Gm-Gg: ATEYQzweH+jwvCBVK9L3vCVecI36++hNzvgJ6VgdJYNcXhbZHhtKEVZaxZgRhDDwAnG
	b/bAQO+Mv6UNuxuYUmjtOlQ8D4M1hztuvagomliC0v5XQSPCMgWLML9EThUSg5AmjauUFCVBdDQ
	4B3765+nUvCHGc1hc4SzHhmaj8bB1B+WBln0KwPqSNtixym79PghVZWbK2PRkIqRalfXj37MwJ1
	L6C7e9d9xMSmsFUv7hYYh0IdlCjtnxxXrH/7hhtT5hleHUrI9urlyCs+V8tE2XkAufQFhRMb7jJ
	ycqIsm+ys0RMu+dMZLfmQOTMh42ndoWOUZKHRF++N66w1bfYw6OSeQh5vckalum6n+W5JKBkJ0+
	6tltj9anEFPnw/HUPBgcv2Kg9W9EgDS93VlEN2KnMMtUeL/B1ZZ/dPFK3P8s/UuYmsbwrsI5P9+
	C5KifJ+blnSJRPvw31xB9FpfMy2khMFdogiueoGpVDRrokBCK1HVJQPUXN0Twk0DeYXyli59W0D
	WXsUnAmFAxnius=
X-Received: by 2002:a05:600c:6994:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-483c9c0b88amr284908735e9.22.1772556537487;
        Tue, 03 Mar 2026 08:48:57 -0800 (PST)
Message-ID: <ad143dd5-08fd-4b28-8ee2-fc6c3181332e@suse.com>
Date: Tue, 3 Mar 2026 17:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] vPCI: introduce private header
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <6202d2d4-ad80-4e37-b1f6-cd9d19add72f@suse.com>
 <f3673515-5922-4748-a964-d4c391e937f5@suse.com>
 <aacP_Dk6lTALXvhJ@macbook.local>
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
In-Reply-To: <aacP_Dk6lTALXvhJ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AE4F31F41B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 03.03.2026 17:44, Roger Pau Monné wrote:
> On Wed, Feb 25, 2026 at 12:43:01PM +0100, Jan Beulich wrote:
>> Before adding more private stuff to xen/vpci.h, split it up. In order to
>> be able to include the private header first in a CU, the per-arch struct
>> decls also need to move (to new asm/vpci.h files).
>>
>> While adjusting the test harness'es Makefile, also switch the pre-existing
>> header symlink-ing rule to a pattern one.
>>
>> Apart from in the test harness code, things only move; no functional
>> change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/tools/tests/vpci/Makefile
>> +++ b/tools/tests/vpci/Makefile
>> @@ -14,12 +14,12 @@ else
>>  	$(warning HOSTCC != CC, will not run test)
>>  endif
>>  
>> -$(TARGET): vpci.c vpci.h list.h main.c emul.h
>> -	$(CC) $(CFLAGS_xeninclude) -g -o $@ vpci.c main.c
>> +$(TARGET): vpci.c vpci.h list.h private.h main.c emul.h
>> +	$(CC) $(CFLAGS_xeninclude) -include emul.h -g -o $@ vpci.c main.c
>>  
>>  .PHONY: clean
>>  clean:
>> -	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h
>> +	rm -rf $(TARGET) *.o *~ vpci.h vpci.c list.h private.h
>>  
>>  .PHONY: distclean
>>  distclean: clean
>> @@ -34,10 +34,10 @@ uninstall:
>>  	$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$(TARGET)
>>  
>>  vpci.c: $(XEN_ROOT)/xen/drivers/vpci/vpci.c
>> -	# Remove includes and add the test harness header
>> -	sed -e '/#include/d' -e '1s/^/#include "emul.h"/' <$< >$@
>> +	sed -e '/#include/d' <$< >$@
>> +
>> +private.h: %.h: $(XEN_ROOT)/xen/drivers/vpci/%.h
>> +	sed -e '/#include/d' <$< >$@
> 
> Nit: if you are changing/adding those we might as well do
> /^#[[:space:]]*include/d, as sometimes we add spaces if the header
> inclusion is conditional.

Editing these two like you say would leave an inconsistency with what's
further down (and what isn't being touched). I think I'd hence prefer
that to be a separate change. Nevertheless, I agree with the intention.

Jan

