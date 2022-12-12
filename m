Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D22649DA4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 12:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459512.717264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4h2J-0005d3-2X; Mon, 12 Dec 2022 11:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459512.717264; Mon, 12 Dec 2022 11:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4h2I-0005aQ-Vj; Mon, 12 Dec 2022 11:31:54 +0000
Received: by outflank-mailman (input) for mailman id 459512;
 Mon, 12 Dec 2022 11:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4To3=4K=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1p4h2G-0005a2-Nf
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 11:31:52 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91289942-7a10-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 12:31:51 +0100 (CET)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1670844702896989.5630630718198;
 Mon, 12 Dec 2022 03:31:42 -0800 (PST)
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
X-Inumbo-ID: 91289942-7a10-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; t=1670844705; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RRo4IxUK5qftydASyZjADfjaO9qHe486UWix+GlHL/4T465GTLKvIcbzrG5poEZdsYFAlrYvFzfiBCETNhfoiF80hEz1qkMKnJNiPBvOZy/v27MUQ9PwQ08nB/mQtJeza7C40g0m1bI5J9HyLg3VVZDcEU0twpViZ16h4EF+mUg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670844705; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=A1lN9Op5XdwBekxwxyKSk7QHsWn0d6DzrHYzjjeX2go=; 
	b=TMtE8ApPl9Bx1/gnbTWdi7FwGWVLuvPbwHYfmQaDCaYJf0HiY9R5vA1Gju+z/BDYUvKPgnR4AG8/oVJzCjAjKNJ8p708+bdl6JcSaqz+b8rB54u1pe6vpPxs92TZAuwhqJbeRK4jio14oGjDpE6OLAP6GR9R0QxEM+YN9a3WZcg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670844705;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=A1lN9Op5XdwBekxwxyKSk7QHsWn0d6DzrHYzjjeX2go=;
	b=le///l0k8+zy+vadfAZ6LD2SJpbVXBBXC9Kna7HabPfwKQbcgoG1EsQtgUEEji3b
	s+81XEQaPkx3fcBxnDvD3mTRU7vNA1Je+fk15v7r1pD76n6wczXKiLbDxoY4TxBYT3N
	YcaGum9bECBwzWqi/ZSQlp773L8oMYm2GVb+uU78=
Message-ID: <0171da79-2c42-071b-e7cb-ca162e04654b@apertussolutions.com>
Date: Mon, 12 Dec 2022 06:31:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] xsm/flask: mkflash.sh: Use const when generating
 initial_sid_to_string[]
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>
References: <20221212093631.38018-1-julien@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20221212093631.38018-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/12/22 04:36, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The array initial_sid_to_string is storing pointer to literal strings
> and is not meant to be modified. So change the type of the variable
> to "const char * const ...[]".
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   xen/xsm/flask/policy/mkflask.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/xsm/flask/policy/mkflask.sh b/xen/xsm/flask/policy/mkflask.sh
> index 591ce832a1d1..611689768167 100755
> --- a/xen/xsm/flask/policy/mkflask.sh
> +++ b/xen/xsm/flask/policy/mkflask.sh
> @@ -34,7 +34,7 @@ BEGIN	{
>   		printf("/*\n * Security object class definitions\n */\n") > debugfile;
>   		printf("    S_(\"null\")\n") > debugfile;
>   		printf("/* This file is automatically generated.  Do not edit. */\n") > debugfile2;
> -		printf("static char *initial_sid_to_string[] =\n{\n") > debugfile2;
> +		printf("static const char * const initial_sid_to_string[] =\n{\n") > debugfile2;
>   		printf("    \"null\",\n") > debugfile2;
>   	}
>   /^[ \t]*#/	{

Ack-by: Daniel P. Smith <dpsmith@apertussolutions.com>

