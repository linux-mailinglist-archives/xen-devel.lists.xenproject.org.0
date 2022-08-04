Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAA458A13F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 21:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380656.614977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJgWA-0002qR-U5; Thu, 04 Aug 2022 19:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380656.614977; Thu, 04 Aug 2022 19:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJgWA-0002o3-RT; Thu, 04 Aug 2022 19:28:26 +0000
Received: by outflank-mailman (input) for mailman id 380656;
 Thu, 04 Aug 2022 19:28:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJgW9-0002nx-Nt
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 19:28:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJgW8-0003o3-V0; Thu, 04 Aug 2022 19:28:24 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.117.14])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJgW8-00054b-Np; Thu, 04 Aug 2022 19:28:24 +0000
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
	bh=Li4/eMc31UxGmsqRj6UlUoiKEw4mJgvC6gGqSnOaQmY=; b=o0va5gEr3qSIoaWbuEu0MSMc8Q
	rxNOB1kGJW78ZmallWdK9+MpQIpDYQKXJhEOWHqbXEh4obhSMvPU3rvz2KPuCYJiLkWb2Px2is0nL
	P0Rx81e3Uy8XOjsHneLIKyIMRXJeiNslm4Ie7BY/LBU5LPVbUzHaJPJC5LYkIlQHOkNE=;
Message-ID: <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>
Date: Thu, 4 Aug 2022 20:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v3 5/5] tools/xenstore: add migration stream extensions
 for new features
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-6-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220803115950.10904-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/08/2022 12:59, Juergen Gross wrote:
> Extend the definition of the Xenstore migration stream to cover new
> features:
> 
> - per domain features
> - extended watches (watch depth)
> - per domain quota
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - new patch
> ---
>   docs/designs/xenstore-migration.md | 85 ++++++++++++++++++++++++++++--
>   1 file changed, 82 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> index efa526f420..b2b1d3d5c7 100644
> --- a/docs/designs/xenstore-migration.md
> +++ b/docs/designs/xenstore-migration.md
> @@ -43,7 +43,13 @@ the setting of the endianness bit.
>   |-----------|---------------------------------------------------|
>   | `ident`   | 0x78656e73746f7265 ('xenstore' in ASCII)          |
>   |           |                                                   |
> -| `version` | 0x00000001 (the version of the specification)     |
> +| `version` | The version of the specification, defined values: |
> +|           | 0x00000001: all fields without any explicitly     |
> +|           |             mentioned version dependency are      |
> +|           |             valid.                                |
> +|           | 0x00000002: all fields valid for version 1 plus   |
> +|           |             fields explicitly stated to be        |
> +|           |             supported in version 2 are valid.     |

I am a bit concerned with the bump of the versions. It means, it will be 
necessary for Xenstored to know whether the new Xenstored speaks v1 or 
v2. This is less an issue when Live-Migration (although there is a fleet 
management problem) but it will be one for Live-Update if we need to 
rollback.

So I am wondering if we can avoid to bump the version and use other 
means to detect the difference.

>   |           |                                                   |
>   | `flags`   | 0 (LSB): Endianness: 0 = little, 1 = big          |
>   |           |                                                   |
> @@ -117,7 +123,17 @@ xenstored state that needs to be restored.
>   | rw-socket-fd                  |
>   +-------------------------------+
>   | evtchn-fd                     |
> ++---------------+---------------+
> +| n-dom-quota   | n-glob-quota  |
> ++---------------+---------------+
> +| quota-val 1                   |
> ++-------------------------------+
> +...
>   +-------------------------------+
> +| quota-val N                   |
> ++-------------------------------+
> +| quota-names
> +...
>   ```
>   
>   
> @@ -128,6 +144,22 @@ xenstored state that needs to be restored.
>   |                |                                              |
>   | `evtchn-fd`    | The file descriptor used to communicate with |
>   |                | the event channel driver                     |
> +|                |                                              |
> +| `n-dom-quota`  | Number of quota values which apply per       |
> +|                | domain. Valid only for version 2 and later.  |
> +|                |                                              |

I think we can avoid extending the structure here by creating a separate 
record for the quota.

With that, the new Xenstored don't need specific code to deal with 
rollback because, as AFAICT, unimplemented records are ignored by 
existing Xenstored.

> +| `n-glob-quota` | Number of quota values which apply globally  |
> +|                | only. Valid only for version 2 and later.    |
> +|                |                                              |
> +| `quota-val`    | Quota values, first the ones applying per    |
> +|                | domain, then the ones applying globally. A   |
> +|                | value of 0 has the semantics of "unlimited". |
> +|                | Valid only for version 2 and later.          |
> +|                |                                              |
> +| `quota-names`  | 0 delimited strings of the quota names in    |
> +|                | the same sequence as the `quota-val` values. | > +|                | Valid only for version 2 and later.          |

 From my understanding, both version of Xenstored needs to agree on the 
quota names. So it means the name have to be defined as part of the 
spec. At which point, I think it would be better to use ID.

Also, can you clarify what would happen if the stream contains a quota 
not supported by the new Xenstored?

> +
>   
>   xenstored will resume in the original process context. Hence `rw-socket-fd`
>   simply specifies the file descriptor of the socket. Sockets are not always
> @@ -145,7 +177,7 @@ the domain being migrated.
>   ```
>       0       1       2       3       4       5       6       7    octet
>   +-------+-------+-------+-------+-------+-------+-------+-------+
> -| conn-id                       | conn-type     |               |
> +| conn-id                       | conn-type     | n-quota       |
>   +-------------------------------+---------------+---------------+
>   | conn-spec
>   ...
> @@ -154,6 +186,17 @@ the domain being migrated.
>   +---------------+---------------+-------------------------------+
>   | data
>   ...
> ++-------------------------------+
> +| features                      |
> ++-------------------------------+
> +| quota-val 1                   |
> ++-------------------------------+
> +...
> ++-------------------------------+
> +| quota-val N                   |
> ++-------------------------------+
> +| quota-names
> +...
>   ```
>   
>   
> @@ -167,6 +210,10 @@ the domain being migrated.
>   |                | 0x0001: socket                               |
>   |                | 0x0002 - 0xFFFF: reserved for future use     |
>   |                |                                              |
> +| `n-quota`      | Number of quota values.                      |
> +|                | Only for `conn-type` 0 (shared ring).        |
> +|                | Only valid for version 2 and later.          |
> +|                |                                              |
>   | `conn-spec`    | See below                                    |
>   |                |                                              |
>   | `in-data-len`  | The length (in octets) of any data read      |
> @@ -182,6 +229,22 @@ the domain being migrated.
>   | `data`         | Pending data: first in-data-len octets of    |
>   |                | read data, then out-data-len octets of       |
>   |                | written data (any of both may be empty)      |
> +|                |                                              |
> +| `features`     | Value of the feature field visible by the    |
> +|                | guest at offset 2064 of the ring page.       |
> +|                | Aligned to the next 4 octet boundary.        |
> +|                | Only for `conn-type` 0 (shared ring).        |

For the purpose of the stream, I would consider to make it available for 
the socket connection. This could potentially be used in the future to 
allow each application to have a different behavior when socket is used.

I can't make my mind yet if we can avoid bumping the version for this 
field. What would happen if we need to rollback?

> +|                | Only valid for version 2 and later.          | > +|                |                                              |
> +| `quota-val`    | Quota values, a value of 0 has the semantics |
> +|                | "unlimited".                                 |
> +|                | Only for `conn-type` 0 (shared ring).        |
> +|                | Only valid for version 2 and later.          |

I would suggest to be very obvious and say the value will override the 
value (if any)

> +|                |                                              |
> +| `quota-names`  | 0 delimited strings of the quota names in    |
> +|                | the same sequence as the `quota-val` values. |
> +|                | Only for `conn-type` 0 (shared ring).        |
> +|                | Only valid for version 2 and later.          |

As for the "global" quotas, I would move the quotas in a separate 
record. In this case, this would also be useful to avoid having may 
dynamic length field within the same record.

>   
>   In case of live update the connection record for the connection via which
>   the live update command was issued will contain the response for the live
> @@ -247,7 +310,7 @@ by a connection for which there is `CONNECTION_DATA` record previously present.
>   
>   ```
>       0       1       2       3    octet
> -+-------+-------+-------+-------+
> ++---------------+---------------+
>   | conn-id                       |
>   +---------------+---------------+
>   | wpath-len     | token-len     |
> @@ -256,6 +319,9 @@ by a connection for which there is `CONNECTION_DATA` record previously present.
>   ...
>   | token
>   ...
> ++---------------+---------------+
> +| depth         |               |
> ++---------------+---------------+
>   ```
>   
>   
> @@ -275,6 +341,13 @@ by a connection for which there is `CONNECTION_DATA` record previously present.
>   |             |                                                 |
>   | `token`     | The watch identifier token, as specified in the |
>   |             | `WATCH` operation                               |
> +|             |                                                 |
> +| `depth`     | The number of directory levels below the        |
> +|             | watched path to consider for a match. This      |
> +|             | field is aligned to the next 4 octet boundary.  |
> +|             | A value of 0xffff is used for unlimited depth.  |
> +|             | This field is valid only for version 2 and      |
> +|             | higher.                                         |

If we are going to bump the stream version, then I think we should move 
the field before token/path.

>   
>   \pagebreak
>   
> @@ -406,6 +479,12 @@ A node permission specifier has the following format:
>   Note that perm1 defines the domain owning the node. See [4] for more
>   explanation of node permissions.
>   
> +\pagebreak
> +
> +### DOMAIN_DATA
> +
> +
> +

What this section is for?

Cheers,

>   * * *
>   
>   [1] See https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/designs/non-cooperative-migration.md

-- 
Julien Grall

