Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0473CA3C7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 19:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156873.289444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44yQ-0007oj-P6; Thu, 15 Jul 2021 17:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156873.289444; Thu, 15 Jul 2021 17:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44yQ-0007lz-Ke; Thu, 15 Jul 2021 17:16:34 +0000
Received: by outflank-mailman (input) for mailman id 156873;
 Thu, 15 Jul 2021 17:16:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Mdo=MH=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1m44yO-0007lt-Tq
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 17:16:33 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6577a54c-e590-11eb-8913-12813bfff9fa;
 Thu, 15 Jul 2021 17:16:31 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1626369384586458.80523704808957;
 Thu, 15 Jul 2021 10:16:24 -0700 (PDT)
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
X-Inumbo-ID: 6577a54c-e590-11eb-8913-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1626369388; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kT1FUQbMAyjBrrRZKDq0VqRB7hidBIc7I5z3fWhzh/pxJPFDJTC8YoFD3gsNPOVj3Kki0FLI8AsJbXxA+TaMUOZ1dKutyMOfkwYpBLJLFKVZjczqpbPEOFrJ9dpDD1AwHjfWeaEUoR3mbDGNreRFeGk8Vc52FiOl3DxzzWsEG8Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1626369388; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+CjztJqjaNwdy9Jn/0TlZCNGinSY13yUWllKqGo2Prg=; 
	b=TjZWQgQ7BkEeaHgJDnszWKXAs1Wtj9vuj31FG1g3UhwMH82KQychEPh+uFSqdLijwmUe5zPUe/+HLE1tTvbfhtpQMzeP/RjE32maqTIF8/a6vga3dySv8kMby5g17Df4DhSGNQ4msAEhRQort0r3eda/b74s/WBTQx8B2aDa5PY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626369388;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=+CjztJqjaNwdy9Jn/0TlZCNGinSY13yUWllKqGo2Prg=;
	b=bg9RwRdRWGzhV3bGzrG3Ul0Qa3OS+MJFp6nBZE9yKcp8t3ikvXus1X2Xx4ueF/Pn
	BMvU25J/E/vohOLm62N7dclzqOiYpsid2CtiAtuB8iLvCcKutAzNnYM7d8KsBqgmQr4
	AiBMWOqY0uIA5Cc70499KmD8A5X+NtW/yirlxIs8=
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Jan Beulich <JBeulich@suse.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-3-dpsmith@apertussolutions.com>
 <1638ecbe-59a2-1ef1-f18e-dc63e1740168@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 02/10] xsm: refactor xsm_ops handling
Message-ID: <4a156596-40fb-1526-0d65-edb092057ad3@apertussolutions.com>
Date: Thu, 15 Jul 2021 13:16:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1638ecbe-59a2-1ef1-f18e-dc63e1740168@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/12/21 7:39 PM, Andrew Cooper wrote:
> On 12/07/2021 21:32, Daniel P. Smith wrote:
>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>> index ad3cddbf7d..a8805f514b 100644
>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -747,16 +747,14 @@ extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
>>  extern bool has_xsm_magic(paddr_t);
>>  #endif
>>  
>> -extern int register_xsm(struct xsm_operations *ops);
>> -
>> -extern struct xsm_operations dummy_xsm_ops;
>>  extern void xsm_fixup_ops(struct xsm_operations *ops);
>>  
>>  #ifdef CONFIG_XSM_FLASK
>> -extern void flask_init(const void *policy_buffer, size_t policy_size);
>> +extern struct xsm_operations *flask_init(const void *policy_buffer, size_t policy_size);
>>  #else
>> -static inline void flask_init(const void *policy_buffer, size_t policy_size)
>> +static inline struct xsm_operations *flask_init(const void *policy_buffer, size_t policy_size)
>>  {
>> +    return NULL;
>>  }
>>  #endif
> 
> As you touch almost every current user of xsm_operations and introduce
> quite a few more, can I recommend taking the opportunity to shorten the
> name to struct xsm_ops.

Looks like Jan also agreed, so I will add this to the mix.

>> diff --git a/xen/xsm/flask/flask_op.c b/xen/xsm/flask/flask_op.c
>> index 01e52138a1..32e079d676 100644
>> --- a/xen/xsm/flask/flask_op.c
>> +++ b/xen/xsm/flask/flask_op.c
>> @@ -226,6 +226,7 @@ static int flask_security_sid(struct xen_flask_sid_context *arg)
>>  static int flask_disable(void)
>>  {
>>      static int flask_disabled = 0;
>> +    struct xsm_operations default_ops;
>>  
>>      if ( ss_initialized )
>>      {
>> @@ -244,7 +245,8 @@ static int flask_disable(void)
>>      flask_disabled = 1;
>>  
>>      /* Reset xsm_ops to the original module. */
>> -    xsm_ops = &dummy_xsm_ops;
>> +    xsm_fixup_ops(&default_ops);
>> +    xsm_ops = default_ops;
>>  
>>      return 0;
>>  }
> 
> These two hunks will disappear when patch 3 is reordered with respect to
> this one.
> 
> ... which is good because you've just pointed xsm_ops at a
> soon-to-be-out-of-scope local variable on the stack.
> 

As Jan has pointed out it is not a ref issue, but it was very bad of me
to leave the stack var uninitialized. Regardless as you pointed out,
this will be irrelevant with moving patch 3 ahead of this.

>> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
>> index f1a1217c98..a3a88aa8ed 100644
>> --- a/xen/xsm/flask/hooks.c
>> +++ b/xen/xsm/flask/hooks.c
>> @@ -1883,7 +1883,8 @@ static struct xsm_operations flask_ops = {
>>  #endif
>>  };
> 
> flask and silo ops should become:
> 
> static const struct xsm_ops __initconst {flask,silo}_ops = {
> 
> as they're neither modified, nor needed after init, following this change.
> 

After this and seeing Jan's comments, I am going to walk through this
again and see if there is more adjustments/cleanups I can do/

>>  
>> -void __init flask_init(const void *policy_buffer, size_t policy_size)
>> +struct xsm_operations __init *flask_init(const void *policy_buffer,
>> +					 size_t policy_size)
> 
> struct xsm_ops *__init flask_init(...)
> 
> Otherwise you've got the __init in the middle of the return type, and
> some compilers are more picky than others.

Ack

>> @@ -1923,6 +1921,9 @@ void __init flask_init(const void *policy_buffer, size_t policy_size)
>>          printk(XENLOG_INFO "Flask:  Starting in enforcing mode.\n");
>>      else
>>          printk(XENLOG_INFO "Flask:  Starting in permissive mode.\n");
>> +
>> +    return &flask_ops;
>> +
> 
> Stray newline.

Ack

>>  }
>>  
>>  /*
>> diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
>> index fc2ca5cd2d..808350f122 100644
>> --- a/xen/xsm/silo.c
>> +++ b/xen/xsm/silo.c
>> @@ -112,12 +112,11 @@ static struct xsm_operations silo_xsm_ops = {
>>  #endif
>>  };
>>  
>> -void __init silo_init(void)
>> +struct xsm_operations __init *silo_init(void)
> 
> Same here as with flask.

Ack

>> diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
>> index 5eab21e1b1..7265f742e9 100644
>> --- a/xen/xsm/xsm_core.c
>> +++ b/xen/xsm/xsm_core.c
>> @@ -68,17 +76,10 @@ static int __init parse_xsm_param(const char *s)
>>  }
>>  custom_param("xsm", parse_xsm_param);
>>  
>> -static inline int verify(struct xsm_operations *ops)
>> -{
>> -    /* verify the security_operations structure exists */
>> -    if ( !ops )
>> -        return -EINVAL;
>> -    xsm_fixup_ops(ops);
>> -    return 0;
>> -}
>> -
>>  static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
>>  {
>> +	struct xsm_operations *mod_ops;
>> +
> 
> Hard tabs, and later in this function.  Also, how about just 'ops' for
> the local variable name?

Ack

>> @@ -113,6 +124,17 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
>>          break;
>>      }
>>  
>> +    /*
>> +     * This handles three cases,
>> +     *   - dummy policy module was selected
>> +     *   - a policy module  does not provide all handlers
> 
> Stray double space.

Ack

> ~Andrew
> 

v/r,
dps

