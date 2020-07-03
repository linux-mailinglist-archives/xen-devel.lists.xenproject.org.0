Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54509213AE4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 15:24:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrLew-0002Yh-SI; Fri, 03 Jul 2020 13:23:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bw0N=AO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jrLew-0002Yc-2O
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 13:23:18 +0000
X-Inumbo-ID: 5ae0c430-bd30-11ea-8496-bc764e2007e4
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ae0c430-bd30-11ea-8496-bc764e2007e4;
 Fri, 03 Jul 2020 13:23:17 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r12so32602911wrj.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2020 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=R34phvw8FAUR+j0p3tZaKBuCtRVikcNPvGj4M9UukwY=;
 b=H2gCvH7IQfFnkWGMU8Ip4GsTCXDs2TWlJmoJBKNYLOyhRe0UWzGUyjbdKqnp2fIz1G
 AUDaRaVmBca+xn/g3RhTwft+XatzyRCb2FXULb8rPSiP7o0LFZzq6ptWQqFF6KxixIPJ
 Oj512l4H8RVZ80G+YVxrmYooNmeRwKi26XqftfgzBCxQUvUUzuvzKQGg/+2n5SDcuFO8
 5o8AQcI3+/du07Sm7VD57frVZNKopxqJozCwrZScVRvHRVIVguLRL7G4NB0B+0XpjPmh
 tKrnoqi7YARmnGz8aH0QFfB/p14u33AQfRMV6ZtZhg80753vlMWEkukaY8ZyqWokc/Es
 lFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=R34phvw8FAUR+j0p3tZaKBuCtRVikcNPvGj4M9UukwY=;
 b=QgHMbb+rtRa4+p4dTXeq+c/Dtkwrnmn6fV3kql+koc0u7Pd28Uk0BBdrcJ7aeHyJHf
 Hm7aXRwAox7vOO6cmOsZ2Tt6B/BvHfNc3qGDLa/odJzarE+IK1l19GrfFYZW1r4vl2PA
 JBygSEocXi0sQaPQEcD5XdyXH/VOpGYAWPTz0UIY6SMePZXXueprk5KpCcOstfmfHvgY
 MIq1UOljPJ/n48nu3GRWXiUuOjEl7xy+9dFpvGHIi0TvD4lVHqyBJUS2uGXOEHq42Ny8
 IYo195Ua4C8CmAcpuDy/AHxJ/K+r0xUfTmT0SiDko4LkZSOdaToHzhqWkKxfLjyEdtHe
 FdLw==
X-Gm-Message-State: AOAM531/F42JQhnX37ByM0QweEUJrgHr5N4XwZyqlz80bMeIKM/ABjZk
 AbLcaRIvB3ZyU6gYjpVmEYsILAqeGy0=
X-Google-Smtp-Source: ABdhPJxwi3bAGa7QuBXtqqnhRW0933s/w4ms1+YzZzc469QEya5qFktYTxqbH4mUC7C+vT0WTBRBQg==
X-Received: by 2002:a5d:5270:: with SMTP id l16mr36553841wrc.122.1593782596488; 
 Fri, 03 Jul 2020 06:23:16 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id o205sm14495680wme.24.2020.07.03.06.23.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Jul 2020 06:23:15 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Olaf Hering'" <olaf@aepfle.de>,
 "'Michael Young'" <m.a.young@durham.ac.uk>
References: <alpine.LFD.2.22.394.2006302259370.2894@austen3.home>
 <20200702183806.GA28738@aepfle.de>
In-Reply-To: <20200702183806.GA28738@aepfle.de>
Subject: RE: Build problems in kdd.c with xen-4.14.0-rc4
Date: Fri, 3 Jul 2020 14:23:14 +0100
Message-ID: <005701d6513d$1bea4080$53bec180$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJDTGpxOkTL6sslt6TCRsF6oIyh1gJDRGtIqAnGWyA=
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Tim Deegan' <tim@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Olaf Hering
> Sent: 02 July 2020 19:38
> To: Michael Young <m.a.young@durham.ac.uk>
> Cc: xen-devel@lists.xenproject.org; Tim Deegan <tim@xen.org>
> Subject: Re: Build problems in kdd.c with xen-4.14.0-rc4
> 
> On Tue, Jun 30, Michael Young wrote:
> 
> > I get the following errors when trying to build xen-4.14.0-rc4
> 
> This happens to work for me.
> 
> Olaf
> 
> ---
>  tools/debugger/kdd/kdd.c | 8 ++++----
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> --- a/tools/debugger/kdd/kdd.c
> +++ b/tools/debugger/kdd/kdd.c
> @@ -742,25 +742,25 @@ static void kdd_tx(kdd_state *s)
>      int i;
> 
>      /* Fix up the checksum before we send */
>      for (i = 0; i < s->txp.h.len; i++)
>          sum += s->txp.payload[i];
>      s->txp.h.sum = sum;
> 
>      kdd_log_pkt(s, "TX", &s->txp);
> 
>      len = s->txp.h.len + sizeof (kdd_hdr);
>      if (s->txp.h.dir == KDD_DIR_PKT)
>          /* Append the mysterious 0xaa byte to each packet */
> -        s->txb[len++] = 0xaa;
> +        s->txp.payload[len++] = 0xaa;

That doesn't look quite right. I think you need [len++ - sizeof(kdd_hdr)] there.

> 
>      (void) blocking_write(s->fd, s->txb, len);
>  }
> 
> 
>  /* Send an acknowledgement to the client */
>  static void kdd_send_ack(kdd_state *s, uint32_t id, uint16_t type)
>  {
>      s->txp.h.dir = KDD_DIR_ACK;
>      s->txp.h.type = type;
>      s->txp.h.len = 0;
>      s->txp.h.id = id;
> @@ -775,25 +775,25 @@ static void kdd_send_cmd(kdd_state *s, uint32_t subtype, size_t extra)
>      s->txp.h.type = KDD_PKT_CMD;
>      s->txp.h.len = sizeof (kdd_cmd) + extra;
>      s->txp.h.id = (s->next_id ^= 1);
>      s->txp.h.sum = 0;
>      s->txp.cmd.subtype = subtype;
>      kdd_tx(s);
>  }
> 
>  /* Cause the client to print a string */
>  static void kdd_send_string(kdd_state *s, char *fmt, ...)
>  {
>      uint32_t len = 0xffff - sizeof (kdd_msg);
> -    char *buf = (char *) s->txb + sizeof (kdd_hdr) + sizeof (kdd_msg);
> +    char *buf = (char *) &s->txp + sizeof (kdd_hdr) + sizeof (kdd_msg);
>      va_list ap;
> 
>      va_start(ap, fmt);
>      len = vsnprintf(buf, len, fmt, ap);
>      va_end(ap);
> 
>      s->txp.h.dir = KDD_DIR_PKT;
>      s->txp.h.type = KDD_PKT_MSG;
>      s->txp.h.len = sizeof (kdd_msg) + len;
>      s->txp.h.id = (s->next_id ^= 1);
>      s->txp.h.sum = 0;
>      s->txp.msg.subtype = KDD_MSG_PRINT;
> @@ -807,25 +807,25 @@ static void kdd_break(kdd_state *s)
>  {
>      uint16_t ilen;
>      KDD_LOG(s, "Break\n");
> 
>      if (s->running)
>          kdd_halt(s->guest);
>      s->running = 0;
> 
>      {
>          unsigned int i;
>          /* XXX debug pattern */
>          for (i = 0; i < 0x100 ; i++)
> -            s->txb[sizeof (kdd_hdr) + i] = i;
> +            s->txp.payload[sizeof (kdd_hdr) + i] = i;

Again, drop the sizeof(kdd_hdr) here I think.

  Paul

>      }
> 
>      /* Send a state-change message to the client so it knows we've stopped */
>      s->txp.h.dir = KDD_DIR_PKT;
>      s->txp.h.type = KDD_PKT_STC;
>      s->txp.h.len = sizeof (kdd_stc);
>      s->txp.h.id = (s->next_id ^= 1);
>      s->txp.stc.subtype = KDD_STC_STOP;
>      s->txp.stc.stop.cpu = s->cpuid;
>      s->txp.stc.stop.ncpus = kdd_count_cpus(s->guest);
>      s->txp.stc.stop.kthread = 0; /* Let the debugger figure it out */
>      s->txp.stc.stop.status = KDD_STC_STATUS_BREAKPOINT;


