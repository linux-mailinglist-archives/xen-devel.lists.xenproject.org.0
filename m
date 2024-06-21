Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE7B9117C2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 02:44:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744950.1152072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKSNq-0000D7-0h; Fri, 21 Jun 2024 00:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744950.1152072; Fri, 21 Jun 2024 00:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKSNp-0000Aq-U5; Fri, 21 Jun 2024 00:44:05 +0000
Received: by outflank-mailman (input) for mailman id 744950;
 Fri, 21 Jun 2024 00:44:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKSNo-0000Ak-4v
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 00:44:04 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59109a24-2f67-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 02:44:02 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4218314a6c7so13524195e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 17:43:59 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d21243esm44433695e9.43.2024.06.20.17.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 17:43:58 -0700 (PDT)
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
X-Inumbo-ID: 59109a24-2f67-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718930639; x=1719535439; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bo947nRLDAF2ABDm4JTcNha5gtcpqq+bEoananWC350=;
        b=ZU3TN1WKTm1RH+NdJVSieSx1uwQAzBzz04darhnsJZonZgOZG1f2OHTHatrMoNFwfH
         I/R++WBnWSa8ndQgX+DS4EUg5weV9pOR+RilDxhVVvFPBcnICXgHfxpdCMjUgezsJ91Y
         kLqqYmHAeRO5a33aR5JQeRyS9jE8RacLbIP4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718930639; x=1719535439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bo947nRLDAF2ABDm4JTcNha5gtcpqq+bEoananWC350=;
        b=sTkvEpj2UN6oTjPdvNC3WdvBUGJaN2mA628Cd7Ntmko1qW/oJ3IuGeefbyHHyv2U/g
         Tx/6Wr0kCHSwf/XKENyXwf9ToM3vOiT0uXW0iYs4rindj6/GVuVyF7JdDFmWG6sDMKFg
         14cLE0wfZignZCEnaKB1Yu41M5U0Q5sE6+7qjXX4ya6QzIP8POgIHOFrrTAsYGZN6nFC
         VNAZMZJzQNdPDvdRafYmYm3Xj7fIgvQONU0ALhvRju5kCJXed+h0zyf4sjinqdTQz/z1
         OXtpBad4rI6firB8Jz72rB9SmziMTaaF7pA1G5NVQC15fPu+lZLjduvzPlVW4ZDhupAw
         w+6w==
X-Forwarded-Encrypted: i=1; AJvYcCUq8bb2S3Se2QEly9svQm6H22EjcSkLr/0gVDl3pH5dijwKI9ij5iMnzmJ9vnNDHzT9qj7Ndy7wES4d5m2619ldFJWh/NG6S9Zon7qw/vA=
X-Gm-Message-State: AOJu0Yxcu/+kr3z1BkcoEnFsSJ5tQfIpEqugEBjVPQHqunQfjRP3fQI1
	6TcQMwFo1X0YP6hzQZurpgFv2s8XZaQ9dDeNFBiGr/V12jLH9FzqsbH6dMNYwyo=
X-Google-Smtp-Source: AGHT+IEr871tadqB2g5Ut8b+tm1UxSt+2073Qc/diNSmEXiVoE6pG9OBLhOsasViDoWcAxww7aykVg==
X-Received: by 2002:a7b:cd07:0:b0:422:370a:ca57 with SMTP id 5b1f17b1804b1-4247529bd22mr50689465e9.36.1718930638977;
        Thu, 20 Jun 2024 17:43:58 -0700 (PDT)
Message-ID: <120a749d-a62a-4eb1-be2b-2c2299f849d6@citrix.com>
Date: Fri, 21 Jun 2024 01:43:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] common/sched: address a violation of MISRA C Rule 8.8
To: victorm.lira@amd.com, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Stewart Hildebrand <stewart.hildebrand@amd.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
References: <5b6dfc7571bd76b5546d3881bd660a4e7a745409.1718928467.git.victorm.lira@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5b6dfc7571bd76b5546d3881bd660a4e7a745409.1718928467.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/06/2024 1:20 am, victorm.lira@amd.com wrote:
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index 685929c290..10a32bd160 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -1476,7 +1476,7 @@ static inline void runq_remove(struct csched2_unit *svc)
>      list_del_init(&svc->runq_elem);
>  }
>  
> -void burn_credits(struct csched2_runqueue_data *rqd, struct csched2_unit *svc,
> +static void burn_credits(struct csched2_runqueue_data *rqd, struct csched2_unit *svc,
>                    s_time_t now);
>  
>  static inline void
> @@ -1855,7 +1855,7 @@ static void reset_credit(int cpu, s_time_t now, struct csched2_unit *snext)
>      /* No need to resort runqueue, as everyone's order should be the same. */
>  }
>  
> -void burn_credits(struct csched2_runqueue_data *rqd,
> +static void burn_credits(struct csched2_runqueue_data *rqd,
>                    struct csched2_unit *svc, s_time_t now)

Thankyou for the patch.  By and large it's fine, but for both of these
examples, please re-indent the following line too, so the parameter list
remains aligned in the eventual code.

~Andrew

