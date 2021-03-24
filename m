Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0983347A41
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 15:10:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101022.192851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP4Cp-0000Dw-12; Wed, 24 Mar 2021 14:09:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101022.192851; Wed, 24 Mar 2021 14:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP4Co-0000DX-U2; Wed, 24 Mar 2021 14:09:54 +0000
Received: by outflank-mailman (input) for mailman id 101022;
 Wed, 24 Mar 2021 14:09:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lP4Cn-0000DS-Gh
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 14:09:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lP4Cm-0002S0-2W; Wed, 24 Mar 2021 14:09:52 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lP4Cl-0000mz-So; Wed, 24 Mar 2021 14:09:52 +0000
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
	bh=Vihx1o6sfVYFq29apSCGABYusFxApavcEm7NpdHdVOM=; b=yKp0BD1wKvOwQcHhH412d0Tvus
	rw5xgvebldDGRaeCQCtlKMIXgW5/edQ5eVIq8MJVyrH8D9p9LMqddn7COyWkKjRS8iQNdAPTVq1fK
	/92+ElC0rokjO+wlTMZE7KC6iBZx1t4jzq1O+4A3m2r9tVEgqIX55TQCi3EHNwuPQDBk=;
Subject: Re: [PATCH-for-4.15 V2] tools/libs/store: tidy up libxenstore
 interface
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210324113035.32691-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <043461f3-9b5e-7d29-bc52-275d663579c9@xen.org>
Date: Wed, 24 Mar 2021 14:09:36 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324113035.32691-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/03/2021 11:30, Juergen Gross wrote:
> xenstore_lib.h is in need to be tidied up a little bit:
> 
> - the definition of struct xs_tdb_record_hdr shouldn't be here
> - some symbols are not namespaced correctly
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2: minimal variant (Ian Jackson)
> ---
>   tools/include/xenstore_lib.h     | 17 ++++-------------
>   tools/libs/store/libxenstore.map |  6 +++---
>   tools/libs/store/xs.c            | 12 ++++++------
>   tools/xenstore/utils.h           | 11 +++++++++++
>   tools/xenstore/xenstore_client.c | 12 ++++++------
>   5 files changed, 30 insertions(+), 28 deletions(-)
> 
> diff --git a/tools/include/xenstore_lib.h b/tools/include/xenstore_lib.h
> index 4c9b6d1685..f74ad7024b 100644
> --- a/tools/include/xenstore_lib.h
> +++ b/tools/include/xenstore_lib.h
> @@ -43,15 +43,6 @@ struct xs_permissions
>   	enum xs_perm_type perms;
>   };
>   
> -/* Header of the node record in tdb. */
> -struct xs_tdb_record_hdr {
> -	uint64_t generation;
> -	uint32_t num_perms;
> -	uint32_t datalen;
> -	uint32_t childlen;
> -	struct xs_permissions perms[0];
> -};
> -
>   /* Each 10 bits takes ~ 3 digits, plus one, plus one for nul terminator. */
>   #define MAX_STRLEN(x) ((sizeof(x) * CHAR_BIT + CHAR_BIT-1) / 10 * 3 + 2)
>   
> @@ -78,18 +69,18 @@ bool xs_perm_to_string(const struct xs_permissions *perm,
>   unsigned int xs_count_strings(const char *strings, unsigned int len);
>   
>   /* Sanitising (quoting) possibly-binary strings. */
> -struct expanding_buffer {
> +struct xs_expanding_buffer {
>   	char *buf;
>   	int avail;
>   };
>   
>   /* Ensure that given expanding buffer has at least min_avail characters. */
> -char *expanding_buffer_ensure(struct expanding_buffer *, int min_avail);
> +char *xs_expanding_buffer_ensure(struct xs_expanding_buffer *, int min_avail);
>   
>   /* sanitise_value() may return NULL if malloc fails. */
> -char *sanitise_value(struct expanding_buffer *, const char *val, unsigned len);
> +char *xs_sanitise_value(struct xs_expanding_buffer *, const char *val, unsigned len);
>   
>   /* *out_len_r on entry is ignored; out must be at least strlen(in)+1 bytes. */
> -void unsanitise_value(char *out, unsigned *out_len_r, const char *in);
> +void xs_unsanitise_value(char *out, unsigned *out_len_r, const char *in);
>   
>   #endif /* XENSTORE_LIB_H */
> diff --git a/tools/libs/store/libxenstore.map b/tools/libs/store/libxenstore.map
> index 9854305a2c..fc1c213f13 100644
> --- a/tools/libs/store/libxenstore.map
> +++ b/tools/libs/store/libxenstore.map
> @@ -42,8 +42,8 @@ VERS_3.0.3 {
>   		xs_strings_to_perms;
>   		xs_perm_to_string;
>   		xs_count_strings;
> -		expanding_buffer_ensure;
> -		sanitise_value;
> -		unsanitise_value;
> +		xs_expanding_buffer_ensure;
> +		xs_sanitise_value;
> +		xs_unsanitise_value;

Isn't libxenstore considered stable? If so, shouldn't we bump the 
version to avoid any breakage for existing app?

Cheers,

-- 
Julien Grall

