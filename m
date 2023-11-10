Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBEA7E8547
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 22:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630815.983951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1ZVE-0007ZY-Tz; Fri, 10 Nov 2023 21:57:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630815.983951; Fri, 10 Nov 2023 21:57:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1ZVE-0007XH-Qv; Fri, 10 Nov 2023 21:57:24 +0000
Received: by outflank-mailman (input) for mailman id 630815;
 Fri, 10 Nov 2023 21:57:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YK6u=GX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r1ZVD-0007XB-4p
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 21:57:23 +0000
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f740cd3-8014-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 22:57:21 +0100 (CET)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-32fe1a29010so1381020f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 13:57:21 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a5d6548000000b0032da75af3easm196746wrv.80.2023.11.10.13.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 13:57:14 -0800 (PST)
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
X-Inumbo-ID: 1f740cd3-8014-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699653434; x=1700258234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tq+vVFzFQuNPFulMvijWhkTMgOJllrgAQLHZADDbn8=;
        b=a3UglbkVwl6DuANMstGl8ngOSPnYezYL6sIS0T5OYa2LHoveTE39MaP6glblrkiAbA
         NK3l11dp9U47QFPIhN0r+1mE871sPzCFCo51MzZWKavjkxjfb7KdWUoGHTfNjTg7SU4t
         n96mBwsv6ciUvCSSVCzGyDHditIwWa76gU1rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699653434; x=1700258234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tq+vVFzFQuNPFulMvijWhkTMgOJllrgAQLHZADDbn8=;
        b=s/ukw5bTXLtOuzN7CpOqAAbIQy/yNXYoweH/jHnUrfYNkXYbY0UbFjxtI7D1b7l3Ct
         0/01Mz1M1eexvfHVUnTKw6+K9oHAfcExVqtBVR5j1rMynwqmmjHFnEzx+elKtEsuJBNd
         kmwnqbyFlAOPkctZPagXK8DKgaVM5hfnTSW+zm0Su/Lvxuf2Wy1IgVyKPnUJuJs1aVbD
         voZL9v5D6cbX6rDUNLKfh/grElmOn49Y2tVfyWIj6sBaVlkoQnKQDvhFbFkhgbV2QmNw
         vuy641t07D3YM0hFUSeAOcmdTOrjumWBIQ5L3UyyhF/2SrqjKtYGEdhq2/H6LoiRj3xR
         dfbA==
X-Gm-Message-State: AOJu0Yw5gNfofNxoTo1XINP9FBnctCfdlcS/WTTY5kcjjxQW+pxm6Eac
	pya9nw2L470l+4lybbIAYumGDA==
X-Google-Smtp-Source: AGHT+IF6RgPCbKzN8I8kSLKa/jPUwsttZ5PE9pbgDJQVt6VpOvfV5RuubNVVRsDJIry7cuYVrgy90w==
X-Received: by 2002:a5d:6d06:0:b0:32d:857c:d51c with SMTP id e6-20020a5d6d06000000b0032d857cd51cmr383345wrq.43.1699653434534;
        Fri, 10 Nov 2023 13:57:14 -0800 (PST)
Message-ID: <0a168232-ea32-4aa1-b270-961782fec9dc@citrix.com>
Date: Fri, 10 Nov 2023 21:57:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18 3/3] docs/sphinx: Fix indexing
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com>
 <20231108152727.58764-4-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2311091601420.3478774@ubuntu-linux-20-04-desktop>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2311091601420.3478774@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/11/2023 12:07 am, Stefano Stabellini wrote:
> On Wed, 8 Nov 2023, Andrew Cooper wrote:
>> diff --git a/docs/index.rst b/docs/index.rst
>> index f3f779f89ce5..22fdde80590c 100644
>> --- a/docs/index.rst
>> +++ b/docs/index.rst
>> @@ -53,17 +53,18 @@ kind of development environment.
>>     hypervisor-guide/index
>>  
>>  
>> -MISRA C coding guidelines
>> --------------------------
>> +Unsorted documents
>> +------------------
>>  
>> -MISRA C rules and directive to be used as coding guidelines when writing
>> -Xen hypervisor code.
>> +Documents in need of some rearranging.
> I understand the need for an "Unsorted documents", but why taking away
> "MISRA C coding guidelines" from here?

You can't have it both here and in index.rst without breaking the indexing.

Also because in it's current position it breaks the navbar.  MISRA is
part of the developer guide, and what should be at the toplevel should
be a general section on safety certification, which cross-references the
developer guide amongst other things.  Nevertheless it will stay visible
for now at the top level because of how the toctree.

It's in unsorted because I have thrown the index together with the bare
minimum effort in order to fix Sphinx errors in time for 4.18.

This is also why I'm not changing any text.  There is 0 time between now
and this needing fixing for the release.

Someone else can find some time to polish it - which is far more work
than just in the index - and we can backport it when its done.

~Andrew

