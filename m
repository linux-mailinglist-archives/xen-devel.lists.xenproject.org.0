Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FE1ACC81F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004483.1384210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRtr-0001rV-6a; Tue, 03 Jun 2025 13:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004483.1384210; Tue, 03 Jun 2025 13:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRtr-0001ok-3t; Tue, 03 Jun 2025 13:41:55 +0000
Received: by outflank-mailman (input) for mailman id 1004483;
 Tue, 03 Jun 2025 13:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMRtq-0001oe-1U
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:41:54 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81c99763-4080-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 15:41:52 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-450ccda1a6eso50874445e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 06:41:52 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe73eebsm18133379f8f.44.2025.06.03.06.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 06:41:51 -0700 (PDT)
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
X-Inumbo-ID: 81c99763-4080-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748958112; x=1749562912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F9wKU01RvMGS9wJB52Arrkx70kwBWx1MUCeZEtlJLvE=;
        b=ST6glmcqi9NKDwYt5lh6Jh8pMULZXa7AScQfpalrHIKdmubNofMgB8RzBFHzeWtdFW
         PMM/qkoYA3ZxEmaCkH8RwKitTZQIqm9JI5j196cYPbiT1hzo9icYj+KY0GEyUhcaRfhF
         thrDnwXiAQc6VLfUVZmEEwONNbRnZ+N1IckEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958112; x=1749562912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9wKU01RvMGS9wJB52Arrkx70kwBWx1MUCeZEtlJLvE=;
        b=Hg+stcXNbdGUElUZkJr+b5PpnUwNs4nvHkKoz7qNERB8yCXwlM9ogoyc730+PK4jRY
         5URfxDaLdu2nmLpci3QKrDblsU0Lj7mrdbjCO1abe5xtKlkZBod+EVXijy67iqngJtna
         YLX5G/xBfhjQu0HJnYMzd8AH6RnUvN7GZ8DwFnwvqvG0DxK9p8WiAfDrno771CCpFb7p
         28W2jLG3ZQs/bBV9CyJnaXZGoLyJPewvbBmDDCVUhVuBqZLkp8Np3GG8KaX2OfAQGB/U
         Pj9+4dMihth1b1pyTakaLU2oy3SSwSPRVMzz+MIX45f6SlzUeFxwHvY/38d3ijBwomGk
         BN9w==
X-Forwarded-Encrypted: i=1; AJvYcCXEDCf426+BfYpj3uodp8ONUxwVv5Oz45MNFMgOmz9pu094xs9mGUIKyUK2jWdAvRcFZcpr+lP6094=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyW+16xvIkYjq2lcUWegaSISPoYAZPqtwCGADpYzPd50Q2JBmdK
	IMDYUf11XQ/XuNKDg0shHuCzlRPAV/2h2ClJ3Gi1yovyUvhqIJ4Yqhaet0bOb7M/Iy0=
X-Gm-Gg: ASbGncsen/4c8kwoXaVblg/Dwd0KdPn6lXOvzXCgEQj4esy15f/WdRVqgcGCnjYdZ8g
	c3M3YNB1gGSYIdoGxGGHSVNOjJFsvHPkSQlckML4hCZ/ncr4VaS68UwRc6o2ynHYfjVSV70Zv+Z
	iBW/tmT7qQX8MJoa29Xi1LiOTz7Ed7GKN1+VamjTSIS+eZOa7LTj/4qI8D6w1cYiiP6WLqzCl/Y
	z6ZVt5HL5QGGHgULZK3a+XerMhlAKN9uuQ9wgfN7AHQbQorJ3RGpuZZiiIdfrcMrsbtHr6RTTLb
	o1VMQhTzyG7J/hxC46L+yugBT9AAWcjUEwyCPGLlzmn6UMJvCAd2aZbNEYXPJFzy3rvOBD4jY3w
	sNoXx4G0n42Fg54r6
X-Google-Smtp-Source: AGHT+IFRTF1e1H/d+mLUT9dzUyJ6hTDNRPvWL9Cm5tXOl5RcvGQ/lLHgxovWgvW3WdKi+7Gzy6d18g==
X-Received: by 2002:a05:600c:6207:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-450d885e38amr109908495e9.22.1748958111992;
        Tue, 03 Jun 2025 06:41:51 -0700 (PDT)
Message-ID: <ba57188a-77b9-4386-bd5a-073903062864@citrix.com>
Date: Tue, 3 Jun 2025 14:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/9] CI: Have the gitlab job fail on tools/tests
 failure
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-6-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250603124222.52057-6-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> We can't rely on an exit value from `run-tools-tests` since we only
> have the console output. `console.exp` only look for success or it
> times out. We could parse the console output, but the junit is more
> concise. Also check if we have it or fail as well.
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  automation/scripts/qubes-x86-64.sh | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 046137a4a6..7a4c5ae489 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -298,6 +298,13 @@ TEST_RESULT=$?
>  
>  if [ -n "$retrieve_xml" ]; then
>      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> +    # Findout if one of the test failed
> +    if ! grep -q '</testsuites>' tests-junit.xml; then
> +        echo "ERROR: tests-junit.xml is incomplete or missing."
> +        TEST_RESULT=1
> +    elif grep -q '</failure>' tests-junit.xml; then
> +        TEST_RESULT=1
> +    fi
>  fi
>  
>  exit "$TEST_RESULT"

A couple of things.

From my experimentation with junit,
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1849342222/test_report?job_name=kbl-xtf-x86-64-gcc-debug
we can also use </error> for classification.  I'm also very disappointed
in Gitlab classifying <warning> as success.

Not for this patch, but for XTF I need to be able to express "tolerable
failure".  (All branches of Xen will run the same tests, and we don't
have OSSTest to deem "fail never passed" as non-blocking.)

Even if the job passes overall, I want tolerable failures to show up in
the UI, so I have to use <failure> in junit.xml.  But that means needing
to be more selective, and I don't have a good idea of how to do this. 
(I have one terrible idea, which is </failure type=tolerable"> which
will escape that grep, but it feels like (ab)buse of XML.)

~Andrew

