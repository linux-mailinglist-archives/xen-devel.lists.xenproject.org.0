Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1832827CB23
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154.327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEhz-0007CS-AN; Tue, 29 Sep 2020 12:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154.327; Tue, 29 Sep 2020 12:26:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEhz-0007C3-6m; Tue, 29 Sep 2020 12:26:15 +0000
Received: by outflank-mailman (input) for mailman id 154;
 Tue, 29 Sep 2020 12:26:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNEhx-0007Bv-N7
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:26:13 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f787838b-0b2a-4f5a-9f98-a2711b580964;
 Tue, 29 Sep 2020 12:26:12 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNEhu-0001a6-35; Tue, 29 Sep 2020 12:26:10 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNEht-0008HO-Mc; Tue, 29 Sep 2020 12:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNEhx-0007Bv-N7
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:26:13 +0000
X-Inumbo-ID: f787838b-0b2a-4f5a-9f98-a2711b580964
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f787838b-0b2a-4f5a-9f98-a2711b580964;
	Tue, 29 Sep 2020 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=MjY2FkcLYm3rEoKgWzSVIZrFgz2zfrd8eDrDAWM4p/M=; b=W8WQeOj0zC9HRSUNvAFm9JCNWL
	F0pEzz7Y1NlJdsXJoe3AAlaxadjRrS3M3p5z+vckCYSBUQtzJbd5c4IsSLr4QD8YgHZ52b0Bu0wpb
	0ppsuvF/22sLkIwCyIRd29kXfHSwEexKGH99Ix8XWGjD8RHK/t++hGfPYL8xA5IgolPs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNEhu-0001a6-35; Tue, 29 Sep 2020 12:26:10 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNEht-0008HO-Mc; Tue, 29 Sep 2020 12:26:09 +0000
Subject: Re: [PATCH 09/12] evtchn: move FIFO-private struct declarations
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <de54075d-2d2f-e4ca-8252-c6f333571027@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c96bc8b8-6399-596e-27bf-1b5f1d634dad@xen.org>
Date: Tue, 29 Sep 2020 13:26:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <de54075d-2d2f-e4ca-8252-c6f333571027@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/09/2020 12:00, Jan Beulich wrote:
> There's no need to expose them.

We are going to need them for LiveUpdate and Non-cooperative Live 
Migration as the save/restore is happening outside of event_fifo.c.

This is because we tried to keep all the save/restore code in a separate 
directory.

Although, I could also see pros for scatter save/restore across the code 
base.

Cheers,

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I wonder whether we shouldn't do away with event_fifo.h altogether.
> 
> --- a/xen/common/event_fifo.c
> +++ b/xen/common/event_fifo.c
> @@ -21,6 +21,27 @@
>   
>   #include <public/event_channel.h>
>   
> +struct evtchn_fifo_queue {
> +    uint32_t *head; /* points into control block */
> +    uint32_t tail;
> +    uint8_t priority;
> +    spinlock_t lock;
> +};
> +
> +struct evtchn_fifo_vcpu {
> +    struct evtchn_fifo_control_block *control_block;
> +    struct evtchn_fifo_queue queue[EVTCHN_FIFO_MAX_QUEUES];
> +};
> +
> +#define EVTCHN_FIFO_EVENT_WORDS_PER_PAGE (PAGE_SIZE / sizeof(event_word_t))
> +#define EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES \
> +    (EVTCHN_FIFO_NR_CHANNELS / EVTCHN_FIFO_EVENT_WORDS_PER_PAGE)
> +
> +struct evtchn_fifo_domain {
> +    event_word_t *event_array[EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES];
> +    unsigned int num_evtchns;
> +};
> +
>   static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
>                                                          unsigned int port)
>   {
> --- a/xen/include/xen/event_fifo.h
> +++ b/xen/include/xen/event_fifo.h
> @@ -9,27 +9,6 @@
>   #ifndef __XEN_EVENT_FIFO_H__
>   #define __XEN_EVENT_FIFO_H__
>   
> -struct evtchn_fifo_queue {
> -    uint32_t *head; /* points into control block */
> -    uint32_t tail;
> -    uint8_t priority;
> -    spinlock_t lock;
> -};
> -
> -struct evtchn_fifo_vcpu {
> -    struct evtchn_fifo_control_block *control_block;
> -    struct evtchn_fifo_queue queue[EVTCHN_FIFO_MAX_QUEUES];
> -};
> -
> -#define EVTCHN_FIFO_EVENT_WORDS_PER_PAGE (PAGE_SIZE / sizeof(event_word_t))
> -#define EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES \
> -    (EVTCHN_FIFO_NR_CHANNELS / EVTCHN_FIFO_EVENT_WORDS_PER_PAGE)
> -
> -struct evtchn_fifo_domain {
> -    event_word_t *event_array[EVTCHN_FIFO_MAX_EVENT_ARRAY_PAGES];
> -    unsigned int num_evtchns;
> -};
> -
>   int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
>   int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
>   void evtchn_fifo_destroy(struct domain *domain);
> 

-- 
Julien Grall

