Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNFCCY07sGmDhQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 16:41:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D75253C70
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 16:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250232.1547710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzzCS-0000PU-98; Tue, 10 Mar 2026 15:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250232.1547710; Tue, 10 Mar 2026 15:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzzCS-0000OE-6V; Tue, 10 Mar 2026 15:40:48 +0000
Received: by outflank-mailman (input) for mailman id 1250232;
 Tue, 10 Mar 2026 15:40:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzzCQ-0000O8-Vs
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 15:40:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 807a96ce-1c97-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 16:40:44 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso131175e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 08:40:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b8d4easm90405155e9.15.2026.03.10.08.40.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 08:40:43 -0700 (PDT)
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
X-Inumbo-ID: 807a96ce-1c97-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773157244; x=1773762044; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v6oDr0hNtfVv64oxcM72cctFqHNAOLFAB55PJOHsCkY=;
        b=EB4dcX3EaxT3/0SzGEkWlL68tT+p+58qhcrDxufITWCpFurn/9nwIHqBIWnlZHG7y2
         +HkbN4kd47mCoc+Sp3RSXdfJj8/K0kvp+jBi777P4lONfcCsx9SNXbAFnP1UZ+SSjVue
         23fnyR4xTeHc3L/vSMFG7jAyr+IPgLvbWfSS5DC6fbEi4xgg+X0wvZVQ+iod7rJzPeUe
         cNvRdwSsqYHey0AhYobfFA7jdK9JaSlEEBl/yBiDCyGRjdm0i2/+vaVsy1y1h7nRmuPj
         HrX/oKK1XKMhkJYPsPE1+13lc00NMWIGC611nVhcnZGiYaqZx4bh4konyvoqi7ziBU7U
         RyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157244; x=1773762044;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6oDr0hNtfVv64oxcM72cctFqHNAOLFAB55PJOHsCkY=;
        b=reFgq9ydrXgRNX4JII+KEr1P4X3fk9pEaag731JFL6haf8HfoExKwYpRxoTIsk5Y+o
         49meOxt3McPArpMB1PkVJyUVsF/YIm4VNIM48fB9askKEq+67oxNC8Qf2UCiVumDROI/
         TT6NteU8YepOsOLEfAcuE6Vn+oTUtT7icmOhg0jowWacGPY+yKfQhQW1l33bSmDFkmQk
         Mh4jKsz6HXd7O2Dk2hDs/xnaq8ji7PZCfag5DtvU6NmuOdKhw+J9eMsfUBkP5gz93Hrr
         FzAOIq4NnJuUUM0FvjNvV0osbhK1PDk/Yaz5EXIj3TU9+uQqe4H3wKxkwSpaO4KiB0Rs
         tgYw==
X-Forwarded-Encrypted: i=1; AJvYcCWl5MLN0pF56u0DFavSOqzCtPwfcEWky1sSkddlKaA1sU2Tm2eRSeyKUpqxXJmww4hpM8hW3KeXBEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywi9dGaoNz8HrpT2M2Lc/xPW9tcfwpw3rfQTtkv8CHygskcgUYX
	LEY14h53TNbpX92mzt1JIFxvHquQQulJsdwG6giBAbs7DpKiqrVYiPdcY5uffZxz1A==
X-Gm-Gg: ATEYQzy/mVz/JoaDnMcrHI7kyWcLTai2W+b3SE+JkiF6ta67TfLHOfVmC1ggOAxrFUx
	uV57cVEuVX6dXqJEr51bOje3+nYyt4IOY4HTOfddTYMBAuql/OCRrisVxvEcc4jmPFmy6XhkKjx
	ZFkUm3opLg6sXOlCw5dJWwD7ILiPhB+N/CtkoBwyu7rmabRMz/oKKAgBZLEH/cBU+uOnTtdyZnQ
	fHRrxJcdyOwB1DHv4egTURYPh1xW5GL4mtTfd5EXh04baXPlZVHI/dtpt/aZ2lbylFU+AfpxNaW
	idEri2JwJgeUy+jO+dwbSy8EyqaDDu6Ai6lB6ztL3I5Z2O4hyprpVptyONljASKow6k2jvGlxiK
	ikZkNctFOr1V0HWPFlwTgiydwgy/9H9YlEm9I/wGAvKcBvjwJcGVEo0NpwdZg9Fmb7E7BSWc+/I
	dIbXOV+4BT6d0J32/c7/J25xBYIKa6EF+9cFKU/cTA89Pb7sxXw88HvD8/P/18shLdnQD5zKohG
	YHzrjiZU/G2J+k=
X-Received: by 2002:a05:600c:1d04:b0:485:3428:774c with SMTP id 5b1f17b1804b1-485419a286cmr66050045e9.4.1773157244032;
        Tue, 10 Mar 2026 08:40:44 -0700 (PDT)
Message-ID: <fff40b9b-8148-4803-8886-ee1b39afb722@suse.com>
Date: Tue, 10 Mar 2026 16:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86: Remove x86 prefixed names from hvm code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: roger.pau@citrix.com, xen-devel@lists.xenproject.org,
 Kevin Lampis <kevin.lampis@citrix.com>
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
 <20260304195350.837593-4-kevin.lampis@citrix.com>
 <4a5018a2-9867-432b-9464-874532241316@suse.com>
 <9eed183c-4157-4432-94ec-a7b7a689fd4a@citrix.com>
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
In-Reply-To: <9eed183c-4157-4432-94ec-a7b7a689fd4a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 86D75253C70
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 10.03.2026 16:29, Andrew Cooper wrote:
> On 10/03/2026 10:26 am, Jan Beulich wrote:
>> On 04.03.2026 20:53, Kevin Lampis wrote:
>>> struct cpuinfo_x86
>>>   .x86        => .family
>>>   .x86_vendor => .vendor
>>>   .x86_model  => .model
>>>   .x86_mask   => .stepping
>>>
>>> No functional change.
>>>
>>> This work is part of making Xen safe for Intel family 18/19.
>>>
>>> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
>>> ---
>>> I couldn't find any information about these Intel family 6 processors:
>>>   model 0x5d: /* SoFIA 3G Granite/ES2.1 */
>>>   model 0x65: /* SoFIA LTE AOSP */
>>>   model 0x6e: /* Cougar Mountain */
>>> Should I add them to intel-family.h?
>> We should keep that in sync with Linux, I think, so "no" unless you mean to
>> first have respective entries added there.
>>
>> 0x5d is listed in the SDM, so I'd recommend keeping the entries (using IFM()
>> directly for the time being).
>>
>> 0x65 and 0x6e aren't listed in the SDM, so may never really have hit the
>> public. Respective cases can perhaps be dropped, but such dropping would
>> again likely better be done in a separate change.
> 
> These are the 5G basestations I mentioned during the x86 meeting.  Linux
> has declined to take take these models into intel-family.h because
> they're not general purpose.
> 
> I suggest we drop them, including 0x5d.  I can do a separate patch.

For 0x5d it's not quite clear what the justification would be. Looking at the
SDM, those X3-C3000 don't look any more or less general purpose as C2000 and
C1000. I guess I'll learn once you've sent the patch.

Jan

