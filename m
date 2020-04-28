Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D31BB975
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 11:06:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTMBa-0007OR-Fl; Tue, 28 Apr 2020 09:05:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c5nG=6M=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jTMBZ-0007OM-Eb
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 09:05:49 +0000
X-Inumbo-ID: 73ac1288-892f-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73ac1288-892f-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 09:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Ex4oGeyJtMHGteGUUOu2sfpGBhX9fsCbpakoUC4KV4=; b=fsZ4eaJRUAfJq/t66c3nZc3KnW
 eatKSV/D7Vos2beo/FYJE+oKL368WrNDGsPhg78pI6Bofulj5Z/W4ym5+rPIhBc0M1YBjbTWfWKu4
 ZCCFuQ2guTv84DWazTRQoDdVL8SZ7Ejvcggqq1hMqwago8SEkd/8cmjeSoYtrtiiEeQc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jTMBV-0007DN-3O; Tue, 28 Apr 2020 09:05:45 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jTMBU-0000W3-Nl; Tue, 28 Apr 2020 09:05:45 +0000
Subject: Re: [PATCH v4] docs/designs: re-work the xenstore migration
 document...
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200427155035.668-1-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <7ab25832-66e6-020f-b343-059f21771054@xen.org>
Date: Tue, 28 Apr 2020 10:05:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427155035.668-1-paul@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 27/04/2020 16:50, Paul Durrant wrote:
> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> index 6ab351e8fe..51d8b85171 100644
> --- a/docs/designs/xenstore-migration.md
> +++ b/docs/designs/xenstore-migration.md
> @@ -3,254 +3,400 @@
>   ## Background
>   
>   The design for *Non-Cooperative Migration of Guests*[1] explains that extra
> -save records are required in the migrations stream to allow a guest running
> -PV drivers to be migrated without its co-operation. Moreover the save
> -records must include details of registered xenstore watches as well as
> -content; information that cannot currently be recovered from `xenstored`,
> -and hence some extension to the xenstore protocol[2] will also be required.
> -
> -The *libxenlight Domain Image Format* specification[3] already defines a
> -record type `EMULATOR_XENSTORE_DATA` but this is not suitable for
> -transferring xenstore data pertaining to the domain directly as it is
> -specified such that keys are relative to the path
> -`/local/domain/$dm_domid/device-model/$domid`. Thus it is necessary to
> -define at least one new save record type.
> +save records are required in the migrations stream to allow a guest running PV
> +drivers to be migrated without its co-operation. Moreover the save records must
> +include details of registered xenstore watches as well ascontent; information

s/ascontent/as content/

[...]

> +### END
> +
> +The end record marks the end of the image, and is the final record
> +in the stream.
>   
>   ```
> -    0       1       2       3     octet
> -+-------+-------+-------+-------+
> -| NODE_DATA                     |
> -+-------------------------------+
> -| path length                   |
> -+-------------------------------+
> -| path data                     |
> -...
> -| pad (0 to 3 octets)           |
> -+-------------------------------+
> -| perm count (N)                |
> -+-------------------------------+
> -| perm0                         |
> -+-------------------------------+
> -...
> -+-------------------------------+
> -| permN                         |
> -+-------------------------------+
> -| value length                  |
> -+-------------------------------+
> -| value data                    |
> -...
> -| pad (0 to 3 octets)           |
> -+-------------------------------+
> +    0       1       2       3       4       5       6       7    octet
> ++-------+-------+-------+-------+-------+-------+-------+-------+
>   ```
>   
> -where perm0..N are formatted as follows:
>   
> +The end record contains no fields; its body length is 0.
> +
> +\pagebreak
> +
> +### GLOBAL_DATA
> +
> +This record is only relevant for live update. It contains details of global
> +xenstored state that needs to be restored.

Reading this paragraph, it sounds like GLOBAL_DATA should always be 
present in the liveupdate stream. However ...

[...]

> -path length and value length are specified in octets (excluding the NUL
> -terminator of the path). perm should be one of the ASCII values `w`, `r`,
> -`b` or `n` as described in [2]. All pad values should be 0.
> -All paths should be absolute (i.e. start with `/`) and as described in
> -[2].
> +| Field          | Description                                  |
> +|----------------|----------------------------------------------|
> +| `rw-socket-fd` | The file descriptor of the socket accepting  |
> +|                | read-write connections                       |
> +|                |                                              |
> +| `ro-socket-fd` | The file descriptor of the socket accepting  |
> +|                | read-only connections                        |
>   
> +xenstored will resume in the original process context. Hence `rw-socket-fd` and
> +`ro-socket-fd` simply specify the file descriptors of the sockets.

... sockets may not always be available in XenStored. So should we 
reserve a value for "not in-use socket"?

[...]

> -wpath length and token length are specified in octets (excluding the NUL
> -terminator). The wpath should be as described for the `WATCH` operation in
> -[2]. The token is an arbitrary string of octets not containing any NUL
> -values.
>   
> +| Field       | Description                                     |
> +|-------------|-------------------------------------------------|
> +| `conn-id`   | A non-zero number used to identify this         |
> +|             | connection in subsequent connection-specific    |
> +|             | records                                         |
> +|             |                                                 |
> +| `conn-type` | 0x0000: shared ring                             |
> +|             | 0x0001: socket                                  |

I would write "0x0002 - 0xFFFF: reserved for future use" to match the 
rest of the specification.

[...]

> -where tx_id is the non-zero identifier values of an open transaction.
>   
> +| Field     | Description                                       |
> +|-----------|---------------------------------------------------|
> +| `domid`   | The domain-id that owns the shared page           |
> +|           |                                                   |
> +| `tdomid`  | The domain-id that `domid` acts on behalf of if   |
> +|           | it has been subject to an SET_TARGET              |
> +|           | operation [2] or DOMID_INVALID [3] otherwise      |
> +|           |                                                   |
> +| `flags`   | Must be zero                                      |
> +|           |                                                   |
> +| `evtchn`  | The port number of the interdomain channel used   |
> +|           | by `domid` to communicate with xenstored          |
> +|           |                                                   |
> +| `mfn`     | The MFN of the shared page for a live update or   |
> +|           | ~0 (i.e. all bits set) otherwise                  |
>   
> -### Protocol Extension
> +Since the ABI guarantees that entry 1 in `domid`'s grant table will always
> +contain the GFN of the shared page, so for a live update `mfn` can be used to
> +give confidence that `domid` has not been re-cycled during the update.

I am confused, there is no way a XenStored running in an Arm domain can 
map the MFN of the shared page. So how is this going to work out?

[...]

> -START_DOMAIN_TRANSACTION    <domid>|<transid>|
> +    0       1       2       3    octet
> ++-------+-------+-------+-------+
> +| conn-id                       |
> ++-------------------------------+
> +| tx-id                         |
> ++---------------+---------------+
> +| path-len      | value-len     |
> ++---------------+---------------+
> +| access        | perm-count    |
> ++---------------+---------------+
> +| perm1                         |
> ++-------------------------------+
> +...
> ++-------------------------------+
> +| permN                         |
> ++---------------+---------------+
> +| path
> +...
> +| value
> +...
> +```
> +
> +
> +| Field        | Description                                    |
> +|--------------|------------------------------------------------|
> +| `conn-id`    | If this value is non-zero then this record     |
> +|              | related to a pending transaction               |

If conn-id is 0, how do you know the owner of the node?

> +|              |                                                |
> +| `tx-id`      | This value should be ignored if `conn-id` is   |
> +|              | zero. Otherwise it specifies the id of the     |
> +|              | pending transaction                            |
> +|              |                                                |
> +| `path-len`   | The length (in octets) of `path` including the |
> +|              | NUL terminator                                 |
> +|              |                                                |
> +| `value-len`  | The length (in octets) of `value` (which will  |
> +|              | be zero for a deleted node)                    |
> +|              |                                                |
> +| `access`     | This value should be ignored if this record    |
> +|              | does not relate to a pending transaction,      |
> +|              | otherwise it specifies the accesses made to    |
> +|              | the node and hence is a bitwise OR of:         |
> +|              |                                                |
> +|              | 0x0001: read                                   |
> +|              | 0x0002: written                                |
> +|              |                                                |
> +|              | The value will be zero for a deleted node      |
> +|              |                                                |
> +| `perm-count` | The number (N) of node permission specifiers   |
> +|              | (which will be 0 for a node deleted in a       |
> +|              | pending transaction)                           |
> +|              |                                                |
> +| `perm1..N`   | A list of zero or more node permission         |
> +|              | specifiers (see below)                         |

This is a bit odd to start at one. Does it mean perm0 exists and not 
preserved?

> +|              |                                                |
> +| `path`       | The absolute path of the node                  |
> +|              |                                                |
> +| `value`      | The node value (which may be empty or contain  |
> +|              | NUL octets)                                    |

Cheers,

-- 
Julien Grall

