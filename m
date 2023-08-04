Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DB770032
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 14:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577142.904042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRtte-00025q-1H; Fri, 04 Aug 2023 12:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577142.904042; Fri, 04 Aug 2023 12:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRttd-00023Q-U7; Fri, 04 Aug 2023 12:27:09 +0000
Received: by outflank-mailman (input) for mailman id 577142;
 Fri, 04 Aug 2023 12:27:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRttc-00023G-Bl
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 12:27:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRttb-0002nB-PP; Fri, 04 Aug 2023 12:27:07 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228] helo=[10.95.104.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRttb-0004nn-HM; Fri, 04 Aug 2023 12:27:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=XOlcaVRyMiJvAljp6aYw/EwvW+Rr9YJoKjiaaKp/Mec=; b=ER/7KbR7vw7ye/v/NCPSgTlLI4
	fI9ZS0eX9WXOfpqHDxh4y9PDATMq2XTuqjjMZALXrPtn2kOylpLoKVUY1A5LIm2qDi38A3xw07mcr
	KxfjuaYeBu22X2eDSEmNIru0yDSTr8RvSRNq+3fXltAZUk3IvJSiy+7rWA7ylXTm/XDc=;
Message-ID: <b8d23151-a159-441c-8e7e-5d4c199936f9@xen.org>
Date: Fri, 4 Aug 2023 13:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-24-jgross@suse.com>
 <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
 <99a76ceb-df27-3a37-296b-9fcf1671472e@suse.com>
 <e3b4e4c0-f188-4b7c-ad47-8c6d60532969@xen.org>
 <6193da26-c348-dcd2-b3ef-7b75ce4da376@suse.com>
 <8e7d18a0-0130-4ae5-adac-cfc122d6fb16@xen.org>
 <8f9a76fc-283a-e3f3-d19f-04401389a7de@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8f9a76fc-283a-e3f3-d19f-04401389a7de@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 04/08/2023 13:05, Juergen Gross wrote:
> On 04.08.23 12:33, Julien Grall wrote:
>>> const char *canonicalize(struct connection *conn, const void *ctx,
>>>                           const char *node, bool allow_special)
>>> {
>>>          const char *name;
>>>          int local_off = 0;
>>>          unsigned int domid;
>>>
>>>          /*
>>>           * Invalid if any of:
>>>           * - no node at all
>>>           * - illegal character in node
>>>           * - starts with '@' but no special node allowed
>>>           */
>>>          errno = EINVAL;
>>>          if (!node ||
>>>              strspn(node, 
>>> "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
>>>                           "0123456789-/_@") != strlen(node) ||
>>
>> ... I would rather keep calling valid_chars() here. The rest looks 
>> fine even though this is definitely not my preference.
> 
> I can do that, even if I don't see the real value with the comment above 
> the if.

How about writing Xenstored in a single function then? After all with 
comments it should be easy to read, right? :)

There are a few difficulty with the current approach. There are:
   * a large function call that needs to be split over two lines
   * multiple || which also need to split over multiple lines.
   * No parentheses over strspn(....) != strlen(node)

Maybe you can parse/understand this 'if' very quickly. But I can't and 
this is just slowing down review and increasing the risk of introducing 
bugs.

Cheers,

-- 
Julien Grall

