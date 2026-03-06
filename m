Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OwcImrPqml4XQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 13:58:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17F02212F2
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 13:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247684.1546180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyUjn-0005Cg-Pu; Fri, 06 Mar 2026 12:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247684.1546180; Fri, 06 Mar 2026 12:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyUjn-00059g-Lt; Fri, 06 Mar 2026 12:57:03 +0000
Received: by outflank-mailman (input) for mailman id 1247684;
 Fri, 06 Mar 2026 12:57:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vyUjl-00059a-PA
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 12:57:01 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6eb36c7-195b-11f1-b164-2bf370ae4941;
 Fri, 06 Mar 2026 13:57:00 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so105879015e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 04:57:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276bc6bbsm32271435e9.15.2026.03.06.04.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 04:56:59 -0800 (PST)
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
X-Inumbo-ID: f6eb36c7-195b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772801820; x=1773406620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Cem6Ib2c8SgDHkY2mk+9rgqu9lS6u/qe58rl1Cpduk=;
        b=Ab0kMmuhluwc/TeFe1++pt1IJZZ8BDDveb+7N3Gbd2O0VCO4NAJ5e8MlqxF0cTfzZP
         /QjkqGp6YtCEB6lEAxKMFF3eZJRockk3DkTSRD8kD6rfV2WCBNWFf4Mmg9E9lsb1UUDR
         EO52m/pKmwELcK5HZRqUDNCbSKLIFqCD9KwLv8Od67vI/4bxP994K8Zz0D/FN9oNJfwh
         nurQ9UmAhaMIWDnAOTLYEElHmbE5tz76qWq22sD4jGXFLJQK4oCgrPB/nsumqlZMF8Cw
         eXbyIiNgBt1tHP63M7P6m1oNNvSQRigtSnQ3QodjNxg2oxawR++kRvde+K4BIWbLXDt1
         2b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772801820; x=1773406620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Cem6Ib2c8SgDHkY2mk+9rgqu9lS6u/qe58rl1Cpduk=;
        b=hXsFqqcMVZ2L127n5VVzVB3SUHkINzR9c9In6tI75s1lYCr5HkGkW/Qua8pP4I1wlR
         gOx/u+2sG2BgpaBXIoEMJPJbqT+sLwiogQ00/oZ2oRGo93SrBktE9BAqgMM8wof5zaah
         rUbn/afXqQu8f9F4a/lw6DxaptgdhPhCAH1F29ewuHYJRV6Yn9bNpgwCCAmERhod2UYs
         O8ubBLtbeMgFLx/6XxqmGQiO9+E11Bz/y2mnPjOlII/MANQfxiHW9RF7UKQawrLi7Cul
         08bYKQ7m7EZwGiDmoPDgMV7bUOGmVbh7wPFmX7IRkVfKWxeMPeRB1I3lyqa2eVvsNeSa
         2HJg==
X-Gm-Message-State: AOJu0YxqkqVYR+yjGUuvs9nsdlpzcm7/qgybD896gbzWWDCsoeJSA9Rk
	lOdM0TdKpZLdaucUdZpG4cc/9bxeNzu1PTocg8qIljWenQJoeU30x5nnR5ZkSTL1DQ==
X-Gm-Gg: ATEYQzygj3toMQlU9/wtcS8VvNKEbK3DNj2T/L1p4RtqPQRWrJ0f323PT1WVlQuLYYk
	i6UThycMpza/xK9tC7LO8dNDjOdgF+9rTPBkb1EhQdRSZrOGTs7cnMvsf0+ppOW2AbDxnJsU4oB
	8qEcrzMH+lDUrLB/pH/HrCkzEQPExrYQ98nNiTF9Kh8CXlVPLjIekFti+jvDP/VuyaVrLUf0STi
	FNrhS90JG97SnNW5BdEwgM+bbVTa/xIrnaQe6GBHnkDnHvtu9f31Oo9JtkniYLswy4FC592MFlI
	vI7siv+LpKtULCghi5RqM/+FbXnkZzkGC+T7cpl0CodO+BJmTTJ3PCFbn+r5Lpz018OqQEfFcFE
	TGaYWWCIzjUEojoSmTXJGIQe3rpfm0ITj7uUDlFkfPAF8/06gpWv0P6+jws27fsVrMOU9CH9cUy
	oDrtN3a+4s65WzfNELCoO4Z/l5e8vuqFmaCGyXjHjf+1hYS+8T3zq5UlmgkeRZ+NsdiKbdUOWas
	fWCkIKMlQPEAko=
X-Received: by 2002:a05:600c:64c7:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-485268bd694mr33118745e9.0.1772801819606;
        Fri, 06 Mar 2026 04:56:59 -0800 (PST)
Message-ID: <dddcc58d-1c78-4f90-ac2d-1f22c04808ec@suse.com>
Date: Fri, 6 Mar 2026 13:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] vPCI: re-init extended-capabilities when MMCFG
 availability changed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <689dae19-f83d-463f-95d9-c39c15a4e45c@suse.com>
 <aaqtz-fL3bl1wS8P@macbook.local>
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
In-Reply-To: <aaqtz-fL3bl1wS8P@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E17F02212F2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 06.03.2026 11:34, Roger Pau Monné wrote:
> On Thu, Mar 05, 2026 at 02:56:32PM +0100, Jan Beulich wrote:
>> When Dom0 informs us about MMCFG usability, this may change whether
>> extended capabilities are available (accessible) for devices. Zap what
>> might be on record, and re-initialize things.
>>
>> No synchronization is added for the case where devices may already be in
>> use. That'll need sorting when (a) DomU support was added and (b) DomU-s
>> may run already while Dom0 / hwdom still boots (dom0less, Hyperlaunch).
>>
>> vpci_cleanup_capabilities() also shouldn't have used
>> pci_find_ext_capability(), as already when the function was introduced
>> extended config space may not have been (properly) accessible anymore,
>> no matter whether it was during init. Extended capability cleanup hooks
>> need to cope with being called when the respective capability doesn't
>> exist (and hence the corresponding ->init() hook was never called).
>>
>> Fixes: 70e6dace747e ("vpci: Use cleanup to free capability resource during deassign")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> @@ -341,30 +344,40 @@ int vpci_init_capabilities(struct pci_de
>>              {
>>                  printk(XENLOG_ERR "%pd %pp: hide %s cap %u fail rc=%d\n",
>>                         pdev->domain, &pdev->sbdf, type, cap, rc);
>> -                return rc;
>> +
>> +                /* Best effort for the re-init case. */
>> +                if ( !ext_only )
>> +                    return rc;
>> +
>> +                if ( !accum_rc )
>> +                    accum_rc = rc;
> 
> I've been wondering about this, for the hardware domain case we might
> as well do best effort for the init case also.  The other option for
> the hardware domain is to allow unmediated access to the device, which
> is likely worse than allowing it to work in a possibly degraded
> mediated mode.  We already special-case the hardware domain for
> failures of capability->cleanup(), and we should likely do the same
> here.

When making the change, I was asking myself the same. I just didn't want to
mix re-init with a change to how we do init. The earlier of the two if()s
could be dropped in a subsequent change, or (less desirable from my pov, as
then I'll need yet another iteration for this change) make that adjustment
first.

Jan

