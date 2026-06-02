Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GrSQBcUAH2oTcwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:11:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B17363017A
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:11:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Itr5d8do;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325235.1590727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURi3-0002nk-HU; Tue, 02 Jun 2026 16:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325235.1590727; Tue, 02 Jun 2026 16:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURi3-0002lc-Er; Tue, 02 Jun 2026 16:11:19 +0000
Received: by outflank-mailman (input) for mailman id 1325235;
 Tue, 02 Jun 2026 16:11:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wURi1-0002lQ-ET
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:11:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wURi0-00CobM-CX
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 18:11:16 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1f007f-2eae-0a2a0a5409dd-0a2a45028210-42
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:11:16 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1f00a4-af86-0a2a45020019-d1558031b049-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:11:16 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490afc47455so8585665e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:11:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b5625d03sm535185e9.2.2026.06.02.09.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 09:11:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780416676; x=1781021476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZCWKpFU0Slsi/y/84Q91F1zdbL72w77c1tDe5aTnAk=;
        b=Itr5d8doOU1zlYZGh5rALEhEEcOpqurMueVeoXTT6BLfbY4MzC6OwDAX17Uee1Zg8P
         QVV27A9+F6A36kOYLrmsMhP7umrI9iJtx5BOGpV0GageGgyoVv01bMzKr6yDiUZX3uK0
         HxpeX7L22BVM0Lv54OGYD5mMQc3bGevpDZGVZPI+v2dYl2pG73+91FhZiktHK8fzQrmw
         QlJdVa4d5sr7FzVD0svQw32+UcXqaA71dmI1LL3tGT5OYnLkt/zqjDIBNz3BKaaA9whQ
         6ScDZokhbLSI9HcS977vWRKvmCpYZ8JPNj2V+TwZ5xrM7z/a3muQMDxD1kEaeTYbo+mJ
         OxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780416676; x=1781021476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZCWKpFU0Slsi/y/84Q91F1zdbL72w77c1tDe5aTnAk=;
        b=fPr5Qi5Wi8vbq9BlZzKvS7diVX3ln3J1nkw0F+jbgt2ZEv4iQnRjG3yEChbmiazf9C
         7bC5Z7BA3zwCx1GChx8thKAxJVHMUKUsDA7oI1IPngaWXXlXKJnQ36NwuqOc1bMIIABD
         GgSypDi3TntsKIkRFs2hJM5al2Yg8iv24xEr9GGDgoYmhLYNCW8/FHP0A5lVKpuJ2fKz
         leR2m2ctuwuSHPAaBjIAH108t9kW0YHPlhfMdVRy/tHNOjwiAx1PJ6hcNmo0oIOrNcYF
         IN34wuqV3iQ/zZJLd/WpA+qT12RIPgRMn6gTWKywUJl+ab3QoXM9JumF7+rRHct1bn9+
         3Igg==
X-Forwarded-Encrypted: i=1; AFNElJ8HSmp7FPq7pINxO4JAGAXysvfigO4nPwI4wF+31APq3s/qpZH8CvzbRHsOD2cZW8wIxql2Mi+fMqQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN0zO+oYHCKBOkmXA97BJ5Ckm5gv/3eg18sygHerkvkU7LgihT
	JXGWhfSBomC80d+gkkIY0vYfULxZzvkaooe/mDfd/ZQLkXOj3Zj2nRl8
X-Gm-Gg: Acq92OHakjVLL2jOlH0b3rkR4aasXY8OjmSezM1BgcFdI+UPjO45s+7LOxNAj1PZaRw
	InIj+QNkdZwAa/wzHHOxvfDZfx7Lycry+wHScV+yoxTLm2DuByiIOwZm6oavJvDIRjIlTLTa/sw
	vXQYcHYudb6nTKA8OKhldKhXaK7exvUGXrTT7Z1JcqXx1MYI5O0fSi0okGS27fpI9+Iid+VIE7v
	4hjRgYLps7jLoWN6rG1TFkNKT2i18dTbyyRcCmriSCeJo3xtOygGNRyRMuuK3ZW7WEhIxY+BILQ
	4jI347AzY8m0JGBcpS3ZtBM3/vFN+Py0DiVM6UgbZXufeF7oOcHo1bUmPnsQ4CS1JpqqtYgDMkx
	wyjuBlVDw439+LWWtkE6dp7VXu5ztfqHm2Pr5+pe1rY3zEq85gPKssEWLFr6fW4OeU+7mWYY51L
	Oa2FrAPkMHpJULgu1wBDuUWP5l5oOjLolkhUeiK6o/4tDV28QL9Ufj9HRo0mvaPzUEPBXYqDfDy
	qZeSGWtifK80rIWZTaMLPyy5iU=
X-Received: by 2002:a05:600c:3b14:b0:490:44eb:c1e0 with SMTP id 5b1f17b1804b1-490b50a3657mr6553975e9.21.1780416675411;
        Tue, 02 Jun 2026 09:11:15 -0700 (PDT)
Message-ID: <fb1b1194-5855-49d9-99fc-d35a3038833c@gmail.com>
Date: Tue, 2 Jun 2026 18:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/domain: fix UBSAN null pointer dereference of
 d->shared_info
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779712171.git.oleksii.kurochko@gmail.com>
 <04dd784b6b9a4dfca9a313ea8802d8d514d65021.1779712171.git.oleksii.kurochko@gmail.com>
 <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3aef7763-aea3-496a-8c18-d3659f590373@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780416676-B0979161-281B9044/10/73395122804
X-purgate-type: spam
X-purgate-size: 6292
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B17363017A



On 6/2/26 1:19 PM, Jan Beulich wrote:
> On 25.05.2026 15:20, Oleksii Kurochko wrote:
>> It is legal to have d->shared_info equal to NULL for architectures which
>> support only the FIFO ABI for event channel management.
>>
>> Having d->shared_info == NULL leads to a UBSAN issue on such architectures:
>>    UBSAN: Undefined behaviour in common/domain.c:325:10
>>           member access within null pointer of type 'struct shared_info_t'
>>
>> vcpu_info_reset() maps v->vcpu_info_area.map to the per-vcpu slot inside
>> the domain's shared_info page for vcpus with id < XEN_LEGACY_MAX_VCPUS,
>> and falls back to dummy_vcpu_info for vcpus beyond that limit.
>> Extend the existing fallback condition to also cover the case where no
>> shared_info page has been allocated, mapping the vcpu to dummy_vcpu_info
>> instead. This is the correct behaviour: dummy_vcpu_info already serves
>> as the safe stand-in for vcpus that have no usable shared_info slot.
>>
>> Additionally, if an architecture supports only the FIFO ABI, setup_ports()
>> should be updated to avoid a NULL pointer dereference of d->shared_info,
>> since in that case there will be no pending events in
>> shared_info->evtchn_pending and the pending flag of the FIFO event channel
>> does not need to be set to true.
>> update_domain_wallclock_time() accesses d->shared_info via shared_info()
>> macro. On architectures that do not allocate a shared_info page (currently
>> RISC-V, which runs guests in dom0less mode without the PV ABI), this causes
>> a NULL dereference. The early return is safe: if there is no shared_info
>> page, there is nothing to update. For all existing architectures (x86, ARM)
>> that do allocate it, the guard is never taken and behavior is unchanged.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v2:
>>   - Update commit message + subject.
>>   - Drop Fixes tag.
>>   - Handle migration of pending events from 2L and FIFO ABIs when arch
>>     support only FIFO ABI.
> 
> What does this item describe? On an arch supporting only FIFO, how could
> evtchn need migrating from 2L?

Agree this item is inaccurate.

evtchn_init() always calls evtchn_2l_init(d) first 
(event_channel.c:1627), so every domain starts with 2L regardless of 
arch (of course, it is just initialization of evtchn_port_ops which 
aren't really used when only FIFO is supported).

setup_ports() is called during the guest-initiated 2L→FIFO transition 
(event_fifo.c:637), not at arch init time. There is no arch that 
supports "only FIFO" as a starting state and that is why it is needed to 
guard setup_ports() against NULL d->shared_info when migrating 2L 
pending state to FIFO even 2L wasn't really used by an arch with only 
FIFO support.

I Will drop this item to not confuse.

> 
>>   - Update the commit message.
>>   - Protect some other places in common code from NULL pointer deref of
>>     d->shared_info.
> 
> What I'm still missing is the description clarifying why other uses don't
> need guarding (or that there simply are no other uses, which - however -
> I doubt).

I will add an explicit paragraph mentioning that the 2L ops in 
event_2l.c are unreachable for a domain with no shared_info.

The only place which isn't covered now is  domctl.c:108 
(virt_to_mfn(d->shared_info)) is only reached via the 
XEN_DOMCTL_getdomaininfo path and
as RISC-V doesn't use it now it could be left as it is what also could 
be added to commit message.

> 
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -320,7 +320,7 @@ void vcpu_info_reset(struct vcpu *v)
>>       struct domain *d = v->domain;
>>   
>>       v->vcpu_info_area.map =
>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>> +        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
>>            ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>            : &dummy_vcpu_info);
>>   }
> 
> At the example of this: The extra conditionals are dead code on x86 and
> Arm. While the status of the respective Misra rule is still uncertain
> for Xen, imo we'd be better off avoiding the introduction of new dead
> code. Which in turn means we may need some kind of abstraction to have
> these extra conditionals in place only for arch-es not supporting
> shared-info at all.

What about then add config HAS_SHARED_INFO to xen/common/Kconfig and then:

diff --git a/xen/common/domain.c b/xen/common/domain.c
index e64b7df9b704..58442ce1f952 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -319,10 +319,14 @@ void vcpu_info_reset(struct vcpu *v)
  {
      struct domain *d = v->domain;

+#ifdef CONFIG_HAS_SHARED_INFO
      v->vcpu_info_area.map =
-        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS && d->shared_info)
-         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
-         : &dummy_vcpu_info);
+        (v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
+        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
+        : &dummy_vcpu_info;
+#else
+    v->vcpu_info_area.map = &dummy_vcpu_info;
+#endif
  }

  static struct domain *alloc_domain_struct(void)
diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 59d9bf4c7ec0..3d7104100f0b 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -562,9 +562,10 @@ static void setup_ports(struct domain *d, unsigned 
int prev_evtchns)

          evtchn = evtchn_from_port(d, port);

-        if ( d->shared_info &&
-             guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
+#ifdef CONFIG_HAS_SHARED_INFO
+        if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
              evtchn->pending = true;
+#endif

          evtchn_fifo_set_priority(d, evtchn, EVTCHN_FIFO_PRIORITY_DEFAULT);
      }
diff --git a/xen/common/time.c b/xen/common/time.c
index 1ee49a8b0d13..da8403949102 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -94,8 +94,9 @@ void update_domain_wallclock_time(struct domain *d)
      uint32_t *wc_version;
      uint64_t sec;

-    if ( !d->shared_info )
-        return;
+#ifndef CONFIG_HAS_SHARED_INFO
+    return;
+#endif

      spin_lock(&wc_lock);

Thanks.

~ Oleksii


