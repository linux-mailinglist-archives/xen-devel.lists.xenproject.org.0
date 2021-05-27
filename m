Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7013D393598
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 20:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133648.249036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmL3m-0004zC-8u; Thu, 27 May 2021 18:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133648.249036; Thu, 27 May 2021 18:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmL3m-0004wl-5v; Thu, 27 May 2021 18:48:46 +0000
Received: by outflank-mailman (input) for mailman id 133648;
 Thu, 27 May 2021 18:48:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lmL3l-0004wf-EP
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 18:48:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lmL3j-0006JL-RI; Thu, 27 May 2021 18:48:43 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lmL3j-0006MH-LB; Thu, 27 May 2021 18:48:43 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=gdFLE1hfABuvxFWtXsBOMA7TF9HSzyLSeS6Rr/mUTrU=; b=OnjK7VFthuonyzTUJ64fDUnz7g
	6hXEWrhzCjiUTMcuc+rYyjXEQz558Xh5ckN3KZ+Qbl2YNB3Ux7eUvyaHqXwUKuVCsmH5n2PQmNUH2
	gVwb0kGEah40y+OK/6hiKQ1dBLHKHeoL4OwfXzew3s6QTIBwT37WROPyspK06xj1fVtk=;
Subject: Re: [PATCH v6 1/3] evtchn: slightly defer lock acquire where possible
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
 <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <938eb888-ec15-feb1-19f7-b90dfee822ae@xen.org>
Date: Thu, 27 May 2021 19:48:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/05/2021 12:28, Jan Beulich wrote:
> port_is_valid() and evtchn_from_port() are fine to use without holding
> any locks. Accordingly acquire the per-domain lock slightly later in
> evtchn_close() and evtchn_bind_vcpu().

So I agree that port_is_valid() and evtchn_from_port() are fine to use 
without holding any locks in evtchn_bind_vcpu(). However, this is 
misleading to say there is no problem with evtchn_close().

evtchn_close() can be called with current != d and therefore, there is a 
risk that port_is_valid() may be valid and then invalid because 
d->valid_evtchns is decremented in evtchn_destroy().

Thankfully the memory is still there. So the current code is okayish and 
I could reluctantly accept this behavior to be spread. However, I don't 
think this should be left uncommented in both the code (maybe on top of 
port_is_valid()?) and the commit message.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v6: Re-base for re-ordering / shrinking of series.
> v4: New.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -606,17 +606,14 @@ int evtchn_close(struct domain *d1, int
>       int            port2;
>       long           rc = 0;
>   
> - again:
> -    spin_lock(&d1->event_lock);
> -
>       if ( !port_is_valid(d1, port1) )
> -    {
> -        rc = -EINVAL;
> -        goto out;
> -    }
> +        return -EINVAL;
>   
>       chn1 = evtchn_from_port(d1, port1);
>   
> + again:
> +    spin_lock(&d1->event_lock);
> +
>       /* Guest cannot close a Xen-attached event channel. */
>       if ( unlikely(consumer_is_xen(chn1)) && guest )
>       {
> @@ -1041,16 +1038,13 @@ long evtchn_bind_vcpu(unsigned int port,
>       if ( (v = domain_vcpu(d, vcpu_id)) == NULL )
>           return -ENOENT;
>   
> -    spin_lock(&d->event_lock);
> -
>       if ( !port_is_valid(d, port) )
> -    {
> -        rc = -EINVAL;
> -        goto out;
> -    }
> +        return -EINVAL;
>   
>       chn = evtchn_from_port(d, port);
>   
> +    spin_lock(&d->event_lock);
> +
>       /* Guest cannot re-bind a Xen-attached event channel. */
>       if ( unlikely(consumer_is_xen(chn)) )
>       {
> 

Cheers,

-- 
Julien Grall

