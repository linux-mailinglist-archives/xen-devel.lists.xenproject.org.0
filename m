Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CEBA5BC87
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907585.1314795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trw8s-0004xr-Pe; Tue, 11 Mar 2025 09:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907585.1314795; Tue, 11 Mar 2025 09:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trw8s-0004vQ-Mg; Tue, 11 Mar 2025 09:43:18 +0000
Received: by outflank-mailman (input) for mailman id 907585;
 Tue, 11 Mar 2025 09:43:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1trw8r-0004vI-TA
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:43:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1trw8r-00EU7v-1m;
 Tue, 11 Mar 2025 09:43:17 +0000
Received: from [2a02:8012:3a1:0:d5e1:ab8b:3d02:5aa4]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1trw8r-003fno-0Q;
 Tue, 11 Mar 2025 09:43:17 +0000
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
	bh=uRkFwsIkJpRqp/tGMVml8fG0APWEeRFzwwMeHmBqz6o=; b=w4L9EvK3kHrW9UIOucx7NKNyH5
	rQrk6qZ/ksuVTIm05FeXqhiaKwiVyB6MDxwOvK1gBTtVNSM5kn92bXLBpZygcnywQvii/CYdWJyM3
	lrVctdjTcowCSSM/Yu5xZu5Jq0x3QP0VlO0iR25cbhc1sR7BrVwWXrEXxLMIG9FJGHCU=;
Message-ID: <526952a6-eb7a-4055-bd3f-eae1af203f80@xen.org>
Date: Tue, 11 Mar 2025 09:43:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] docs: update xenstore migration stream definition
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250204113407.16839-1-jgross@suse.com>
 <20250204113407.16839-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250204113407.16839-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 04/02/2025 11:34, Juergen Gross wrote:
> In order to close a race window for Xenstore live update when using
> the new unique_id of domains, the migration stream needs to contain
> this unique_id for each domain known by Xenstore.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V8:
> - new patch
> ---
>   docs/designs/xenstore-migration.md | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/designs/xenstore-migration.md b/docs/designs/xenstore-migration.md
> index 082314bf72..fba691ee0d 100644
> --- a/docs/designs/xenstore-migration.md
> +++ b/docs/designs/xenstore-migration.md
> @@ -156,7 +156,7 @@ the domain being migrated.
>   ```
>       0       1       2       3       4       5       6       7    octet
>   +-------+-------+-------+-------+-------+-------+-------+-------+
> -| conn-id                       | conn-type     |               |
> +| conn-id                       | conn-type     | uniq-id-off   |
>   +-------------------------------+---------------+---------------+
 >   | conn-spec>   ...
> @@ -165,6 +165,9 @@ the domain being migrated.
>   +---------------+---------------+-------------------------------+
>   | data
>   ...
> ++---------------------------------------------------------------+
> +| unique-id                                                     |
> ++---------------------------------------------------------------+
>   ```
>   
>   
> @@ -178,6 +181,12 @@ the domain being migrated.
>   |                | 0x0001: socket                               |
>   |                | 0x0002 - 0xFFFF: reserved for future use     |
>   |                |                                              |
> +| `uniq-id-off`  | The offset (in octets) of the `unique-id`    |
> +|                | field from the start of the record body.     |
> +|                | If 0, no `unique-id` field is present.       |
> +|                | Only needed for `shared ring` connection in  |
> +|                | live update streams.                         |
> +|                |                                              |

Looking at the rest of the record, the unique ID would be past the 
in-data (length is 2-byte) and the out-data (length is 4-byte). So 
technically the offset would need 5-bytes. But here you are using 
2-bytes. Can you explain why?

Cheers,

-- 
Julien Grall


