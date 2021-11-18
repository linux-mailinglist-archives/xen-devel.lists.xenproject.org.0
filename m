Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C766E456301
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 19:57:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227577.393642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmas-0007LO-3t; Thu, 18 Nov 2021 18:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227577.393642; Thu, 18 Nov 2021 18:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmas-0007Hx-0k; Thu, 18 Nov 2021 18:57:10 +0000
Received: by outflank-mailman (input) for mailman id 227577;
 Thu, 18 Nov 2021 18:57:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezFO=QF=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mnmaq-0007Hr-QD
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 18:57:08 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53edd4ef-48a1-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 19:57:07 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id r8so13457488wra.7
 for <xen-devel@lists.xenproject.org>; Thu, 18 Nov 2021 10:57:07 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:70ff:9fb9:79eb:9599?
 ([2a00:23c5:5785:9a01:70ff:9fb9:79eb:9599])
 by smtp.gmail.com with ESMTPSA id r17sm665554wmq.11.2021.11.18.10.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 10:57:07 -0800 (PST)
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
X-Inumbo-ID: 53edd4ef-48a1-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BsC5cvFh7IO5Sl2VWqb/+dbMjhO/ygEzNF2OwN7ZWTw=;
        b=Zkk0LpPbLfN1BikqUXWAc8Pz5/MEinqphzQnhmc5jIjXUG2M8DjyXMU8rrPvSWu8uU
         ZbNDS/jlJUKa1/Ozz+y9HyyiLgnyZ4JDsH785xzRS0NZAFlUTs0gIXBkDjkWePB4uKbo
         YGxJCrrU7Ir0cFRkZ4+zxJUI1asMQXFtqchH+MYRnhbejxhtnP+V7cZ+vliiEpkRzmwA
         4fexHPGMlhe/VpRes5vbJZg9D9Pp7rwlejk5HBaSNEQ3OwWmMEDb2FWzRdfUpo3TG1ML
         6yRfL7Hk+stxz/MWLyAvokRqYoYSuxl67gxfm22BcQ2UjDB8JgRR6riCbwQ1ood5nJiy
         TDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BsC5cvFh7IO5Sl2VWqb/+dbMjhO/ygEzNF2OwN7ZWTw=;
        b=0nwgpcVi6Mmv7S/akF/lLSQpkG1tXLDhqQcXadxvHWECUTQjpmrxUsKVp1rv4tsHNx
         VrceJxEOFGRENnLLd7tlsHZ7ffN2ZltJe4XcydGSyQxKmDC0Rvp+1iuU8tCrruUnli6f
         adshYgq2vgV7p57AazIbcvU5VdUeSgs0eOnLdfNK2ax8H3k+4kB4dk6tXyNky+n+w0ys
         zkZiLPI76oUDMNxuQYKfuhHcu3NBRorWuMseuCZzEpYnIUsEgee0YmEwPUJF0Iw6OxtX
         FFMXkRU3eZkqzaZ3/ngT1PeekfC6z5dkom3k5Pkg7tZg1Jq9XegzVIqETzeY8ztWnN//
         8kdQ==
X-Gm-Message-State: AOAM533BldDUponzLHvZ/x7uFwFRMhhUazNlnuQ3j45x49tDGyfJ0Cco
	siDgQeXBGkZe2irDosGDlJ0=
X-Google-Smtp-Source: ABdhPJxv/sqDEArPI6T3nFk0lCmAMtZuNkYnzzAqC+PPTFhnkGAOFsQJ1qFy6U+TBBJz74XJ9fYevA==
X-Received: by 2002:a5d:6d86:: with SMTP id l6mr33531962wrs.304.1637261827516;
        Thu, 18 Nov 2021 10:57:07 -0800 (PST)
Message-ID: <efb4d89d-a9eb-3c34-cef8-2cafe7a87cdf@gmail.com>
Date: Thu, 18 Nov 2021 18:57:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2] x86/hvm: Remove callback from paging->flush_tlb() hook
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <20211117182603.20057-1-andrew.cooper3@citrix.com>
 <20211118184856.20229-1-andrew.cooper3@citrix.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20211118184856.20229-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2021 18:48, Andrew Cooper wrote:
> TLB flushing is a hotpath, and function pointer calls are
> expensive (especially under repoline) for what amounts to an identity
> transform on the data.  Just pass the vcpu_bitmap bitmap directly.
> 
> As we use NULL for all rather than none, introduce a flush_vcpu() helper to
> avoid the risk of logical errors from opencoding the expression.  This also
> means the viridian callers can avoid writing an all-ones bitmap for the
> flushing logic to consume.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

