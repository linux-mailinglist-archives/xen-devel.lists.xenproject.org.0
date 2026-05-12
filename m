Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPOiDb8EA2r1zgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 12:45:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6C351ECE0
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 12:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306700.1578529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMkbc-00062o-T4; Tue, 12 May 2026 10:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306700.1578529; Tue, 12 May 2026 10:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMkbc-00061P-QR; Tue, 12 May 2026 10:44:52 +0000
Received: by outflank-mailman (input) for mailman id 1306700;
 Tue, 12 May 2026 10:44:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMkba-00061F-Ul
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 10:44:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMkba-00GGxj-BX
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 12:44:50 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a030496-5cb7-0a2a0a5109dd-0a2a450595e0-46
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 12:44:50 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0304a2-aaa8-0a2a45050019-d155802cc51f-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 12:44:50 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so30816965e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 03:44:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f41b0b1sm26931135e9.8.2026.05.12.03.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 03:44:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1778582690; x=1779187490; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=twFKg2Ud7k2lpx5wr391RNoyJOpRt564IQf7R4nh7eg=;
        b=PP9b7jlzIBwc2Aem3Gcu80/FsDtgBb+nodDOaqLP5Nb+gMrEW3ub7G7PCxDidrQDUs
         WnUuDjZY9XLwzos9nCwngdC/rQ3Dkhc+xFgYVGR45XSu7SDyllViX/gE2jj8irB8IGPF
         VEgJFKdkWfL9SaUVA7PeJ3ydVvio8tPtdX44FJ+jLO8EG8d0HBmcbCNythEwKvz3ki/t
         aay5IMdb6xMcnHnu8WobrS9vUbxh51NfJ7msjzSqulkgbznfCE6mAKmmoytOLopbV72a
         xIKcMrckIMtaBVcwKAp2IUGkllpd8ti2de8HjJHvKQm5GAyD8qbDSg7oKcQ472iueSjb
         e8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778582690; x=1779187490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twFKg2Ud7k2lpx5wr391RNoyJOpRt564IQf7R4nh7eg=;
        b=ha8/lP4LtGicIIDnMKZ++vBkFfbj+mEDnz1R+SdCnUuYPVZ/gvWISF91BU9QxFxEWP
         cXpw28G8BFWktYpYNDA5Xysg7IHNyNtua+XMrxYGxqgU90Y4TMUSZGqW80398ahlNY5x
         2kf70XLpymo+WqD1r+rCyb07h3jL9H6KZ/y0PQaFQR7jQijskMInVYd913QiH929xFfL
         93K+rJs6KkXspTos9bvstWmmvvUUlpEfQ09YsFckb2VFQx9Uy1I1SX0szkmzF3D2lsKP
         eUWpMacij8G+1S0EbLJ5pOSk9pdumkuWbYsUF7s+Qr/NG7DLmDgM4ABiGS1hGScC3epU
         yGtA==
X-Forwarded-Encrypted: i=1; AFNElJ9q8/JXLLxoOChy2MqjwlK5EnequjcuzObFHnUjdnS8qxJD+882V8rfmwjQenNtv9kMk7kuwJUsqPM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJwaqEZBxN4k3M4yG2Nb6BYNkVYY5CmMni9MM3VClFdAzFGFGb
	rI4fpKcg3MX6c4fX9tTEna70DMKGSh6igW3Fo5sjHfLCyFJassQAOxF0TB/0gpXmyA==
X-Gm-Gg: Acq92OE+YY4c4ajX1x+/mlKczaZFSkIA9JU+oq8Yexu8psa1dbTIfZLrFrRa+aB9Vgp
	VfBKxfD7QXdBIr2TRhMRfb4yRIVYj4FNTQjA72vZQSbCE/ndNrG4Udvho1ET8OC9deNze0wevSv
	sfFpZ8TkiE4EyaGRm2SxQWaL6pE4jbSzv2Mtf923n0qbZqQIklkcsWucQd1Athul9LFWmviuiIJ
	R8Q7iCcR9sRKa5TCQrD7K+v1TXWVY4gKnkeLPjrbFjXEFl9dopKbhXftAez7NQDI/6zTVoocc/4
	kHSSYnm0NajcLKpIkiHL3eHf9OFtfj1toSC0aXJXkjvZWCPbhv04Rd8Jtqmm1dmSR0YvQjVaBkq
	cJObwo8q46SzbPTgT3fRd/WwTIL25tcsCb8qcEycuOxuNyP2W2K6e4Inz5fJWrFJ4uhjVsNrf1r
	vNWeqp4ndtUgRAW9HGAFvjQAe/3gyGw79sJSNLCNKLVmaAVfeBcAFeWlUfRNu23PY4GqkiIbncK
	qu6WOtMcCqWfs9nq8xc4xSr0Q==
X-Received: by 2002:a05:600c:c058:b0:48a:599a:3716 with SMTP id 5b1f17b1804b1-48e8fe7fa6fmr25803155e9.23.1778582689569;
        Tue, 12 May 2026 03:44:49 -0700 (PDT)
Message-ID: <37888ed4-b800-4a8a-b9c2-f69ce3526de6@suse.com>
Date: Tue, 12 May 2026 12:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
 <5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
 <efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
 <d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
 <e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com> <878q9vt0lg.fsf@epam.com>
 <e9610f70-85b8-44d9-8e13-da26d506d5b7@suse.com> <877bparq9t.fsf@epam.com>
 <1d591ff7-599d-4dfa-b521-bfaded430a76@suse.com>
 <925f2076-f98b-4102-ba45-a85a83861c9f@epam.com>
 <agLruvURfBUb-VgF@macbook.local>
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
In-Reply-To: <agLruvURfBUb-VgF@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1778582690-D3563443-EE73FDAD/0/0
X-purgate-type: clean
X-purgate-size: 3091
X-Rspamd-Queue-Id: 9A6C351ECE0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:Mykyta_Poturai@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 12.05.2026 10:58, Roger Pau Monné wrote:
> On Tue, May 12, 2026 at 07:32:20AM +0000, Mykyta Poturai wrote:
>> On 5/12/26 09:20, Jan Beulich wrote:
>>> On 11.05.2026 16:10, Volodymyr Babchuk wrote:
>>>> Okay, so let's clear this. If I remember correct, you discussed this
>>>> with Mykyta in the previous version and suggested to put the vCPU to
>>>> sleep for 100ms.
>>>
>>> I don't think I did (except perhaps from a very abstract perspective),
>>> precisely because of ...
>>>
>>>> I don't think that this is a good idea, because guest
>>>> kernel will not be happy about that.
>>>
>>> ... this. Instead iirc I suggested to refuse (short-circuit) handling
>>> VF register accesses for the next 100ms.
>>
>> Do you have any suggestions on how to ensure that we accurately catch 
>> the window where 100ms have already passed, but guests haven’t tried to 
>> read anything yet, to flip this back? As I mentioned in the previous 
>> version, Linux, for example, doesn’t attempt to re-read anything if the 
>> first read failed after 100ms. So it appears to me that this approach 
>> would be prone to racing with the guest for getting to the VF first.

When we do the write to the control register in Xen, our timer will start
ticking before the guest's. Hence our 100ms will be over (slightly)
earlier, and a well-behaved guest (having waited for the full 100ms
according to its own tracking) will be handled fine.

>> One 
>> approach I can think of is to somehow swap the register handlers back 
>> in-flight during the first read by the guest if 100ms have already 
>> passed. However, this would still depend on Dom0 for registering VFs, 
>> but in a more convoluted way. We also can’t add the VFs before 100ms 
>> have passed and add timing checks to all register handlers, because 
>> pci_add_device and everything below it expects the device to be 
>> functional at the moment of addition.

I fear I'm not following this.

> We could maybe do some middle ground here, kind of similar to what
> Linux does.  The overall idea would be to put on hold any accesses to
> the device(s) PCI config space for 100ms, that would include the PF
> and any VFs.

For the PF, at most parts of the SR-IOV capability should be thus
constrained, I think.

>  At the point when VF enable is set Xen already knows the
> position of the VFs in the PCI config space.
> 
> Any PCI config space access attempts to the PF or VFs during that
> 100ms window would cause the guest vCPU to be put on hold, and the
> access would only be retried once the 100ms window has passed and Xen
> has registered the VFs with vPCI.  This approach needs extra logic to
> put vPCI accesses on hold, similar to what Xen does when mapping a BAR
> into the p2m, and a timer to defer the adding of the Vfs and the
> unlocking of the affected PCI config space region.

I was meaning to have this done in even simpler a way: Simply record
when the VFs were configured, and within the next 100ms terminate all
accesses (read all ones, discard writes).

Jan

