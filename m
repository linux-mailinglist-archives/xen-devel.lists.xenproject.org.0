Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B3C1E7CDA
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:11:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedra-0000T9-Fo; Fri, 29 May 2020 12:11:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mKAR=7L=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jedrZ-0000T4-Gj
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:11:49 +0000
X-Inumbo-ID: 926fd7ac-a1a5-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 926fd7ac-a1a5-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 12:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7f6iMEW7aL+H2CjHWwwFv2l9d/8JKx/1kSI5nX+HJ9M=; b=HtPS6PPBsrHIA8psAmyvaxyeMx
 dJQuvDuz6xBeA4Q+HxcnWHiDNRVeb1H8O4oTkI9rjN3+RBB9tOc1XVOWir0P8BAapX/m2jJU9qsBf
 s/ED2gVRYkzXpdeiFo+TxgxnrHh7PJYO27uHI3UdA/noBrYozBpPzALIxHmEkYeo5QqY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1jedrY-0003d5-Jw
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:11:48 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1jedrY-0002Gm-9Z
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 12:11:48 +0000
Subject: Re: [PATCH v3] docs: update xenstore-migration.md
To: xen-devel@lists.xenproject.org
References: <20200529113709.17489-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e91c0686-d6d4-aef0-1f60-7a53eead7358@xen.org>
Date: Fri, 29 May 2020 13:11:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200529113709.17489-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 29/05/2020 12:37, Juergen Gross wrote:
> Update connection record details:
> 
> - make flags common for sockets and domains (makes it easier to have a
>    C union for conn-spec)
> - add pending incoming data (needed for handling partially read
>    requests when doing live update)
> - add partial response length (needed for proper split to individual
>    responses after live update)
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> V2:
> - added out-resp-len to connection record
> 
> V3:
> - better commit message (Julien Grall)
> - same sequence for fields and detailed descriptions (Julien Grall)
> - some wording corrected (Paul Durrant)
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   docs/designs/xenstore-migration.md | 72 +++++++++++++++++-------------
>   1 file changed, 41 insertions(+), 31 deletions(-)
> 
> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> index 34a2afd17e..2ce2c836f5 100644
> --- a/docs/designs/xenstore-migration.md
> +++ b/docs/designs/xenstore-migration.md
> @@ -147,43 +147,60 @@ the domain being migrated.
>   ```
>       0       1       2       3       4       5       6       7    octet
>   +-------+-------+-------+-------+-------+-------+-------+-------+
> -| conn-id                       | conn-type     | conn-spec
> +| conn-id                       | conn-type     | flags         |
> ++-------------------------------+---------------+---------------+
> +| conn-spec
>   ...
> -+-------------------------------+-------------------------------+
> -| data-len                      | data
> -+-------------------------------+
> ++---------------+---------------+-------------------------------+
> +| in-data-len   | out-resp-len  | out-data-len                  |
> ++---------------+---------------+-------------------------------+
> +| data
>   ...
>   ```
>   
>   
> -| Field       | Description                                     |
> -|-------------|-------------------------------------------------|
> -| `conn-id`   | A non-zero number used to identify this         |
> -|             | connection in subsequent connection-specific    |
> -|             | records                                         |
> -|             |                                                 |
> -| `conn-type` | 0x0000: shared ring                             |
> -|             | 0x0001: socket                                  |
> -|             | 0x0002 - 0xFFFF: reserved for future use        |
> -|             |                                                 |
> -| `conn-spec` | See below                                       |
> -|             |                                                 |
> -| `data-len`  | The length (in octets) of any pending data not  |
> -|             | yet written to the connection                   |
> -|             |                                                 |
> -| `data`      | Pending data (may be empty)                     |
> +| Field          | Description                                  |
> +|----------------|----------------------------------------------|
> +| `conn-id`      | A non-zero number used to identify this      |
> +|                | connection in subsequent connection-specific |
> +|                | records                                      |
> +|                |                                              |
> +| `conn-type`    | 0x0000: shared ring                          |
> +|                | 0x0001: socket                               |
> +|                | 0x0002 - 0xFFFF: reserved for future use     |
> +|                |                                              |
> +| `flags`        | A bit-wise OR of:                            |
> +|                | 0001: read-only                              |
> +|                |                                              |
> +| `conn-spec`    | See below                                    |
> +|                |                                              |
> +| `in-data-len`  | The length (in octets) of any data read      |
> +|                | from the connection not yet processed        |
> +|                |                                              |
> +| `out-resp-len` | The length (in octets) of a partial response |
> +|                | not yet written to the connection            |
> +|                |                                              |
> +| `out-data-len` | The length (in octets) of any pending data   |
> +|                | not yet written to the connection, including |
> +|                | a partial response (see `out-resp-len`)      |
> +|                |                                              |
> +| `data`         | Pending data: first in-data-len octets of    |
> +|                | read data, then out-data-len octets of       |
> +|                | written data (any of both may be empty)      |
>   
> -The format of `conn-spec` is dependent upon `conn-type`.
> +In case of live update the connection record for the connection via which
> +the live update command was issued will contain the response for the live
> +update command in the pending not yet written data.
>   
>   \pagebreak
>   
> +The format of `conn-spec` is dependent upon `conn-type`.
> +
>   For `shared ring` connections it is as follows:
>   
>   
>   ```
>       0       1       2       3       4       5       6       7    octet
> -                                                +-------+-------+
> -                                                | flags         |
>   +---------------+---------------+---------------+---------------+
>   | domid         | tdomid        | evtchn                        |
>   +-------------------------------+-------------------------------+
> @@ -198,8 +215,6 @@ For `shared ring` connections it is as follows:
>   |           | it has been subject to an SET_TARGET              |
>   |           | operation [2] or DOMID_INVALID [3] otherwise      |
>   |           |                                                   |
> -| `flags`   | Must be zero                                      |
> -|           |                                                   |
>   | `evtchn`  | The port number of the interdomain channel used   |
>   |           | by `domid` to communicate with xenstored          |
>   |           |                                                   |
> @@ -211,8 +226,6 @@ For `socket` connections it is as follows:
>   
>   
>   ```
> -                                                +-------+-------+
> -                                                | flags         |
>   +---------------+---------------+---------------+---------------+
>   | socket-fd                     | pad                           |
>   +-------------------------------+-------------------------------+
> @@ -221,9 +234,6 @@ For `socket` connections it is as follows:
>   
>   | Field       | Description                                     |
>   |-------------|-------------------------------------------------|
> -| `flags`     | A bit-wise OR of:                               |
> -|             | 0001: read-only                                 |
> -|             |                                                 |
>   | `socket-fd` | The file descriptor of the connected socket     |
>   
>   This type of connection is only relevant for live update, where the xenstored
> @@ -398,4 +408,4 @@ explanation of node permissions.
>   
>   [3] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/xen.h;hb=HEAD#l612
>   
> -[4] https://wiki.xen.org/wiki/XenBus
> \ No newline at end of file
> +[4] https://wiki.xen.org/wiki/XenBus
> 

-- 
Julien Grall

