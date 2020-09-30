Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA20227E329
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 09:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.462.1457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNX0L-00083a-1r; Wed, 30 Sep 2020 07:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462.1457; Wed, 30 Sep 2020 07:58:25 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNX0K-00083B-US; Wed, 30 Sep 2020 07:58:24 +0000
Received: by outflank-mailman (input) for mailman id 462;
 Wed, 30 Sep 2020 07:58:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kNX0I-000836-Us
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:58:23 +0000
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f512365-0318-4194-9af6-457002740be9;
 Wed, 30 Sep 2020 07:58:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id v12so654232wmh.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 00:58:21 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id u13sm1401497wrm.77.2020.09.30.00.58.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 00:58:20 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=T/h3=DH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kNX0I-000836-Us
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 07:58:23 +0000
X-Inumbo-ID: 4f512365-0318-4194-9af6-457002740be9
Received: from mail-wm1-x330.google.com (unknown [2a00:1450:4864:20::330])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4f512365-0318-4194-9af6-457002740be9;
	Wed, 30 Sep 2020 07:58:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id v12so654232wmh.3
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 00:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=jSch6ZDlTiUgEBsgRAFuaiY6uNH4AelmbpC7MBkS9Ss=;
        b=BtezLytuBM5ydBqaRRa3KfMavSqxv4Y4nZEYK75H0qh7VzrlXPKbYphcPC58gQaUPM
         6psyit4MgLI2WvBfIDw96+zsiCQfTRsLkVx5kvT7H+uOMwiqfnVZ4WcyQ/LZcQuXryO1
         YxKF7cv6AiRTTDnhmSG0FTqTTTuFJdFd/HkfcUuyobT7SnruIJhN/M6ITLBoAD6hnX3G
         cbzHsdlNimsTO3iarNXO9Y1S/FY9EC8/LcuyBLBNBdunZYdqPHrfVux2MrqfThtdhZxP
         BXsRg+lhWGc2q9fOZ/zmL9+qjsE5wx8ERyu3QK0FSMEmmpHiFvzkhn9A3deMoqW8D14K
         oF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=jSch6ZDlTiUgEBsgRAFuaiY6uNH4AelmbpC7MBkS9Ss=;
        b=sAFAltnrdnYtjqa1me/rKl0bcn2JvNp5Kx3Es3AMFltt3HrlpCfHf1dit4qhsIBVn9
         tb/2ILS/7gFfOWcLWDn7kM3J0+XyO7SM9pN0C6Uu6T05ppRQsI74Z2Gow7q0Rakjs7RU
         2ahoOUXTEhy+Ms9Pu4nE03T2lKIjAv9Zj+xmcqzCORoFiKotJBscmDC7dsg2c655IG9F
         dYWkDVVcRJfWp7a1fZfk2Xnip11qkk+VLhOtekg+0mHEoGHjK5EqYRKP68BE9aE8AwQz
         HWhmEXJoqtBolsASF1YZ4GUfabChIP7pgzmlJnf0ue3w6P08oMduQLlAaQEPR97TO9P0
         TP0g==
X-Gm-Message-State: AOAM532Z6q3akQ18/lAzzWqXEqLlif7kDs/lyc0fC2YymOeBhVqS4plu
	8ubNfBL2+ehCy39U8EB1kOs=
X-Google-Smtp-Source: ABdhPJwGQTDyPShFe1UXb8pJqJ9S5i3vL7xuETzslgay3NoQjGRGCWhhWuQGpdXJdjILEcIRTHcE0g==
X-Received: by 2002:a7b:c210:: with SMTP id x16mr1509238wmi.37.1601452700885;
        Wed, 30 Sep 2020 00:58:20 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id u13sm1401497wrm.77.2020.09.30.00.58.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Sep 2020 00:58:20 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <George.Dunlap@eu.citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Wei Liu'" <wl@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com> <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
In-Reply-To: <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
Subject: RE: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
Date: Wed, 30 Sep 2020 08:58:19 +0100
Message-ID: <004b01d696ff$76873e50$6395baf0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHyn6bUUfstxLK2yDInWW9SM20ChgJbMrw1qTTuaoA=

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan Beulich
> Sent: 28 September 2020 12:02
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Wei Liu <wl@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
> 
> There's no need to serialize all sending of vIRQ-s; all that's needed
> is serialization against the closing of the respective event channels
> (by means of a barrier). To facilitate the conversion, introduce a new
> rw_barrier().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -160,7 +160,7 @@ struct vcpu *vcpu_create(struct domain *
>      v->vcpu_id = vcpu_id;
>      v->dirty_cpu = VCPU_CPU_CLEAN;
> 
> -    spin_lock_init(&v->virq_lock);
> +    rwlock_init(&v->virq_lock);
> 
>      tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -640,7 +640,7 @@ int evtchn_close(struct domain *d1, int
>              if ( v->virq_to_evtchn[chn1->u.virq] != port1 )
>                  continue;
>              v->virq_to_evtchn[chn1->u.virq] = 0;
> -            spin_barrier(&v->virq_lock);
> +            rw_barrier(&v->virq_lock);
>          }
>          break;
> 
> @@ -794,7 +794,7 @@ void send_guest_vcpu_virq(struct vcpu *v
> 
>      ASSERT(!virq_is_global(virq));
> 
> -    spin_lock_irqsave(&v->virq_lock, flags);
> +    read_lock_irqsave(&v->virq_lock, flags);
> 
>      port = v->virq_to_evtchn[virq];
>      if ( unlikely(port == 0) )
> @@ -807,7 +807,7 @@ void send_guest_vcpu_virq(struct vcpu *v
>      spin_unlock(&chn->lock);
> 
>   out:
> -    spin_unlock_irqrestore(&v->virq_lock, flags);
> +    read_unlock_irqrestore(&v->virq_lock, flags);
>  }
> 
>  void send_guest_global_virq(struct domain *d, uint32_t virq)
> @@ -826,7 +826,7 @@ void send_guest_global_virq(struct domai
>      if ( unlikely(v == NULL) )
>          return;
> 
> -    spin_lock_irqsave(&v->virq_lock, flags);
> +    read_lock_irqsave(&v->virq_lock, flags);
> 
>      port = v->virq_to_evtchn[virq];
>      if ( unlikely(port == 0) )
> @@ -838,7 +838,7 @@ void send_guest_global_virq(struct domai
>      spin_unlock(&chn->lock);
> 
>   out:
> -    spin_unlock_irqrestore(&v->virq_lock, flags);
> +    read_unlock_irqrestore(&v->virq_lock, flags);
>  }
> 
>  void send_guest_pirq(struct domain *d, const struct pirq *pirq)
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -2,7 +2,7 @@
>  #include <xen/irq.h>
>  #include <xen/smp.h>
>  #include <xen/time.h>
> -#include <xen/spinlock.h>
> +#include <xen/rwlock.h>
>  #include <xen/guest_access.h>
>  #include <xen/preempt.h>
>  #include <public/sysctl.h>
> @@ -334,6 +334,12 @@ void _spin_unlock_recursive(spinlock_t *
>      }
>  }
> 
> +void _rw_barrier(rwlock_t *lock)
> +{
> +    check_barrier(&lock->lock.debug);
> +    do { smp_mb(); } while ( _rw_is_locked(lock) );
> +}

Should you not have a cpu_relax() somewhere in here?

TBH though, the fact this lock is never taken as a writer makes me wonder whether there needs to be a lock at all.

  Paul

> +
>  #ifdef CONFIG_DEBUG_LOCK_PROFILE
> 
>  struct lock_profile_anc {
> --- a/xen/include/xen/rwlock.h
> +++ b/xen/include/xen/rwlock.h
> @@ -237,6 +237,8 @@ static inline int _rw_is_write_locked(rw
>      return (atomic_read(&lock->cnts) & _QW_WMASK) == _QW_LOCKED;
>  }
> 
> +void _rw_barrier(rwlock_t *lock);
> +
>  #define read_lock(l)                  _read_lock(l)
>  #define read_lock_irq(l)              _read_lock_irq(l)
>  #define read_lock_irqsave(l, f)                                 \
> @@ -266,6 +268,7 @@ static inline int _rw_is_write_locked(rw
>  #define rw_is_locked(l)               _rw_is_locked(l)
>  #define rw_is_write_locked(l)         _rw_is_write_locked(l)
> 
> +#define rw_barrier(l)                 _rw_barrier(l)
> 
>  typedef struct percpu_rwlock percpu_rwlock_t;
> 
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -235,7 +235,7 @@ struct vcpu
> 
>      /* IRQ-safe virq_lock protects against delivering VIRQ to stale evtchn. */
>      evtchn_port_t    virq_to_evtchn[NR_VIRQS];
> -    spinlock_t       virq_lock;
> +    rwlock_t         virq_lock;
> 
>      /* Tasklet for continue_hypercall_on_cpu(). */
>      struct tasklet   continue_hypercall_tasklet;
> 



