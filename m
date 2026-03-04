Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLq/KemDqGmgvQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:11:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AB9206F42
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:11:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245918.1545252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxrcG-00029I-Es; Wed, 04 Mar 2026 19:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245918.1545252; Wed, 04 Mar 2026 19:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxrcG-00026R-BB; Wed, 04 Mar 2026 19:10:40 +0000
Received: by outflank-mailman (input) for mailman id 1245918;
 Wed, 04 Mar 2026 19:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qNKU=BE=redhat.com=peterx@srs-se1.protection.inumbo.net>)
 id 1vxrcE-00026L-TH
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 19:10:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb3245de-17fd-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 20:10:24 +0100 (CET)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-2ohN0X8qP3CPSqcLgNxD4A-1; Wed, 04 Mar 2026 14:10:21 -0500
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-89a0013d87bso47755046d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 11:10:21 -0800 (PST)
Received: from x1.local ([174.91.117.149]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-899ff659b75sm73282246d6.34.2026.03.04.11.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 11:10:19 -0800 (PST)
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
X-Inumbo-ID: cb3245de-17fd-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772651422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D0fD55fcz8KZ4PtgIiEuNTP5Fw4Mwe9/ywY1K2zb/Kg=;
	b=Mcs7K6eSl8NqmMgN0kc4AFD8Xk9fogUDrFYoykk3bzwpIOTHV+HDC1OYCCFRNikQZd5FXV
	fzRdlw9YSQ/JAwncZXWrp9M1/+oPXC1gj767Qs1i0wyk8KU8c/Ujbo413qY+zRS99GIO3J
	LLgSvjEKikGhL5tgt0MiWKqS8eUtZ6A=
X-MC-Unique: 2ohN0X8qP3CPSqcLgNxD4A-1
X-Mimecast-MFC-AGG-ID: 2ohN0X8qP3CPSqcLgNxD4A_1772651421
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772651421; x=1773256221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0fD55fcz8KZ4PtgIiEuNTP5Fw4Mwe9/ywY1K2zb/Kg=;
        b=MVmYcF3JxpEiGGf/J2EKajOkiHh1+9SI8DTRVWrLkdVGzFHhnuKJeLO0MFKGhTGmrn
         iLYowj+PviHTPso0uj0haGbxK3Y1zjBAkIcDAmL2miMg5kSgEzZjiqKz5pMFYOhuvtg3
         avEuXX/iWVb3+Wi9iangQI8dnJXrP9NEe+3J6LrL6xNpF5kc2acydsC2kt/Twr5JzuCS
         pY4AKakcjQSKs9j0q5wf8IHPcc4lZmXczevrbt1tjD6RVIHZD5ivjdVVIt7peFzcCprk
         /9N3CObBnAWbS5SaPP4GgNjQHeHtnAYJHuobRT7xW9a8+H2Lplh/tqyNvwW2b0CtIHeM
         UH8g==
X-Forwarded-Encrypted: i=1; AJvYcCXcdCCXguHsUbrDcfTvn36AMOr0AZaCk6z3gbKxM9fUYlaWSp0WvsFC7eq96wr8LjaNF2UlcGbWYP4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHq1EW8LLHFJIB1JL4EG3A0+jiPzVCkl2lTgZLp13treCJlIld
	cYx0zgH4uWT5ku3dQgDo2Cv5Fo8h/qfuA/+nkbZrikAcouA+q/OI9RtB63mB2tLYSDDr1IW+RSe
	1dVXLhEWyGoFSa84rxhSzfA2yt0wFk6amICU20J71PUlrMwbmaNBfJo5LlRcHebtN7cOH
X-Gm-Gg: ATEYQzydTI0xZUfhf7dvNioUvyjmXTKZTchZrE810KflxDULfirqGg+PS6PuWYpu0J9
	7zDQMiicdGBHxhEWOl3uANdzsbj1C8hovrl0XbterQPPv4zbKl9D2sIEBFmGON8LZp4t3+kyiJc
	nQnL84w73vShDIP4j5I+o4vii9fwNtnS3DXPncX7t4zuDr3SMpqpWljiJ0lLfHYebHWn87Bg0nq
	uXhFGGedV+DXChVUl8fyqVC4oQpV7/pPzdtFQ0n+w30hv/PoIW3xmwLymBQRtbkH81ineilJh5T
	F5SjpeCla5yty2Q32vacD9Fge286tK8lHq5hei1eTzSHxq8Vhso0CukwRc+t83eBgOpcBPZQjtG
	Q++d8HtWmmnchFA==
X-Received: by 2002:a05:6214:dcb:b0:89a:1116:b55f with SMTP id 6a1803df08f44-89a1998b398mr41124746d6.7.1772651420624;
        Wed, 04 Mar 2026 11:10:20 -0800 (PST)
X-Received: by 2002:a05:6214:dcb:b0:89a:1116:b55f with SMTP id 6a1803df08f44-89a1998b398mr41124166d6.7.1772651419928;
        Wed, 04 Mar 2026 11:10:19 -0800 (PST)
Date: Wed, 4 Mar 2026 14:10:08 -0500
From: Peter Xu <peterx@redhat.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	sstabellini@kernel.org, anthony@xenproject.org,
	edgar.iglesias@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 3/5] physmem: xen: Conditionalize use of the mapcache
Message-ID: <aaiDkBwlttHoWRAR@x1.local>
References: <20260304015222.979224-1-edgar.iglesias@gmail.com>
 <20260304015222.979224-4-edgar.iglesias@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260304015222.979224-4-edgar.iglesias@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uMkzWZmE2PEkuc7Si-0yoeR3GHkKaIlXRP8-1G8CuKY_1772651421
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Rspamd-Queue-Id: 50AB9206F42
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,x1.local:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edgar.iglesias@gmail.com,m:qemu-devel@nongnu.org,m:pbonzini@redhat.com,m:philmd@linaro.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@amd.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[peterx@redhat.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[peterx@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:52:19AM +0100, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Conditionalize use of the mapcache. This is in preparation
> to optionally disable the mapcache at runtime.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


