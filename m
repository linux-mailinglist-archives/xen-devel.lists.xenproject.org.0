Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C76C378CCE
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 15:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125260.235762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg61r-0002I4-05; Mon, 10 May 2021 13:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125260.235762; Mon, 10 May 2021 13:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg61q-0002Fd-SK; Mon, 10 May 2021 13:32:58 +0000
Received: by outflank-mailman (input) for mailman id 125260;
 Mon, 10 May 2021 13:32:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Mbt=KF=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lg61o-0002FX-OO
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 13:32:56 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c234b0d-bd38-49f7-b015-c781d6497137;
 Mon, 10 May 2021 13:32:55 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1620653568355506.90985128944874;
 Mon, 10 May 2021 06:32:48 -0700 (PDT)
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
X-Inumbo-ID: 1c234b0d-bd38-49f7-b015-c781d6497137
ARC-Seal: i=1; a=rsa-sha256; t=1620653571; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CoY3RmdDdwfHi5Ak7OI9JEemzwHn8NUQf5lXRCIKO/B4IXgqSutKyu0bRAKFfvNKQSgOMy/Rp/uHS8+ixCHcKaExQnxtXmeKu3mgmKkibR14JnSnknKxBwOotNuS3oN5FmjC51qRrEr7M84ll7eZjfHdvE/i/XbrCmzhxuPJfjk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1620653571; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9xMWfM5tlvBr2xlDpLPODs0gNfrcWEF781IuUBw4OM0=; 
	b=m//DXoZqJKMC7uJ8oztbUM9l1Vo03wvNaOksXZ+7rBFgzw7VsTjuskU3IYnAB9bRMWY1ZzINLluBoiRnm4YRhcrcvnw/R9Xt+9nlhV3ddOKJIcZiUtZRIgslLgYvsReb/GFNKp7ODO77KWqcr/WWRoO9xHbPJwJxfyn8soyYyZ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1620653571;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=9xMWfM5tlvBr2xlDpLPODs0gNfrcWEF781IuUBw4OM0=;
	b=gyJMjEAfM3p3Bqwl4tmKNlpQQnzcdhnTIOM13QlT0g1KkMAVO4RpOkB8Luvq5miW
	mJokH5Te+lZOJiELoRRBwkGuzRNqJTP3rOjkDvl172T0nFbW6khNllzyg0vsrsxO5Ad
	rE+eJ+GDOEO+hX3oOIqmH4VIBRfdQH4Ghi3EkQdo=
Subject: Re: [PATCH v2 12/13] vtpmmgr: Check req_len before unpacking command
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-13-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <409ecf34-8f6b-4d12-4455-ef7fc1af4f75@apertussolutions.com>
Date: Mon, 10 May 2021 09:32:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506135923.161427-13-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/6/21 9:59 AM, Jason Andryuk wrote:
> vtpm_handle_cmd doesn't ensure there is enough space before unpacking
> the req buffer.  Add a minimum size check.  Called functions will have
> to do their own checking if they need more data from the request.
> 
> The error case is tricky since abort_egress wants to rely with a
> corresponding tag.  Just hardcode TPM_TAG_RQU_COMMAND since the vtpm is
> sending in malformed commands in the first place.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>  stubdom/vtpmmgr/vtpm_cmd_handler.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/stubdom/vtpmmgr/vtpm_cmd_handler.c b/stubdom/vtpmmgr/vtpm_cmd_handler.c
> index c879b24c13..5586be6997 100644
> --- a/stubdom/vtpmmgr/vtpm_cmd_handler.c
> +++ b/stubdom/vtpmmgr/vtpm_cmd_handler.c
> @@ -840,6 +840,12 @@ TPM_RESULT vtpmmgr_handle_cmd(
>  	UINT32 size;
>  	TPM_COMMAND_CODE ord;
>  
> +	if (tpmcmd->req_len < sizeof_TPM_RQU_HEADER(tpmcmd->req)) {
> +		status = TPM_BAD_PARAMETER;
> +		tag = TPM_TAG_RQU_COMMAND;
> +		goto abort_egress;
> +	}
> +
>  	unpack_TPM_RQU_HEADER(tpmcmd->req,
>  			&tag, &size, &ord);
>  
> 


