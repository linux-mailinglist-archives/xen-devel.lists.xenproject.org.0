Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC09532AA12
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 20:12:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92562.174527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHAQ8-0000LE-P4; Tue, 02 Mar 2021 19:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92562.174527; Tue, 02 Mar 2021 19:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHAQ8-0000Ks-M1; Tue, 02 Mar 2021 19:11:00 +0000
Received: by outflank-mailman (input) for mailman id 92562;
 Tue, 02 Mar 2021 19:10:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q6n1=IA=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1lHAQ7-0000Kn-98
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 19:10:59 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 521920c3-08f4-4348-a12a-5ccfe7f23bf4;
 Tue, 02 Mar 2021 19:10:57 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-VIkJaDvLNzODWURBvDbnGg-1; Tue, 02 Mar 2021 14:10:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E349819611A0;
 Tue,  2 Mar 2021 19:10:52 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 313B46F447;
 Tue,  2 Mar 2021 19:10:47 +0000 (UTC)
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
X-Inumbo-ID: 521920c3-08f4-4348-a12a-5ccfe7f23bf4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614712257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1rJjCS8SfMd6EiWy+oL4Wkvtu28oL1WJmN+YYr+9Ai4=;
	b=RdNtJ6/CYxenIux0XlbojS6q3sBapviqNSFwfm909t7SRm84xa6ydB1nV4JuLfk+GECMuh
	StLEvx9cSiTqEk4Z5vO1mY0KC0tQGKvPIuLzB9qRSBXu4NEMZFgD67Joq7NgVs2Bp7tSPk
	px7Nk/0XwfUAipWwZdXJaxfAFm2Gaos=
X-MC-Unique: VIkJaDvLNzODWURBvDbnGg-1
Subject: Re: [PATCH v6 1/5] qapi: net: Add query-netdev command
To: Alexey Kirillov <lekiravi@yandex-team.ru>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Luigi Rizzo <rizzo@iet.unipi.it>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Vincenzo Maffione <v.maffione@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, qemu-devel@nongnu.org, yc-core@yandex-team.ru
References: <20210302180205.5009-1-lekiravi@yandex-team.ru>
 <20210302180205.5009-2-lekiravi@yandex-team.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <79930db1-80fa-c810-7f72-131ec4671a71@redhat.com>
Date: Tue, 2 Mar 2021 13:10:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302180205.5009-2-lekiravi@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/2/21 12:02 PM, Alexey Kirillov wrote:
> The query-netdev command is used to get the configuration of the current
> network device backends (netdevs).
> This is the QMP analog of the HMP command "info network" but only for netdevs
> (i.e. excluding NIC and hubports).
> 
> The query-netdev command returns an array of objects of the NetdevInfo type,
> which are an extension of Netdev type. It means that response can be used for
> netdev-add after small modification. This can be useful for recreate the same
> netdev configuration.
> 
> Information about the network device is filled in when it is created or
> modified and is available through the NetClientState->stored_config.
> 
> Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> ---

> +++ b/net/net.c

>  
> +NetdevInfoList *qmp_query_netdev(Error **errp)
> +{
> +    NetdevInfoList *list = NULL;
> +    NetClientState *nc;
> +
> +    QTAILQ_FOREACH(nc, &net_clients, next) {
> +        /*
> +         * Only look at netdevs (backend network devices), not for each queue
> +         * or NIC / hubport
> +         */
> +        if (nc->stored_config) {
> +            NetdevInfoList *node = g_new0(NetdevInfoList, 1);

Please use QAPI_LIST_PREPEND instead of open-coding it.

> +
> +            node->value = QAPI_CLONE(NetdevInfo, nc->stored_config);
> +            g_free(node->value->id); /* Need to dealloc default empty id */
> +            node->value->id = g_strdup(nc->name);
> +
> +            node->value->has_peer_id = nc->peer != NULL;
> +            if (node->value->has_peer_id) {
> +                node->value->peer_id = g_strdup(nc->peer->name);
> +            }
> +
> +            node->next = list;
> +            list = node;
> +        }
> +    }
> +

> +++ b/net/slirp.c
> @@ -345,6 +345,14 @@ static SaveVMHandlers savevm_slirp_state = {
>      .load_state = net_slirp_state_load,
>  };
>  
> +#define APPEND_STRINGLIST(tail, new_val) \
> +    do { \
> +        *(tail) = g_new0(StringList, 1); \
> +        (*(tail))->value = g_new0(String, 1); \
> +        (*(tail))->value->str = g_strdup((new_val)); \
> +        (tail) = &((*(tail))->next); \
> +    } while (0)

Please use QAPI_LIST_APPEND instead of re-coding it.

> +++ b/qapi/net.json
> @@ -714,3 +714,83 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @NetBackend:
> +#
> +# Available netdev backend drivers.
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'NetBackend',
> +  'data': [ 'user', 'tap', 'l2tpv3', 'socket', 'vde', 'bridge', 'netmap',
> +            'vhost-user', 'vhost-vdpa' ] }

Is it worth alphabetizing this list?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


