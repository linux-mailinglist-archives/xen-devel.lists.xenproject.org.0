Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DBEACC8D9
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 16:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004525.1384251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSNY-0008Ms-4x; Tue, 03 Jun 2025 14:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004525.1384251; Tue, 03 Jun 2025 14:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMSNY-0008LO-27; Tue, 03 Jun 2025 14:12:36 +0000
Received: by outflank-mailman (input) for mailman id 1004525;
 Tue, 03 Jun 2025 14:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pD2F=YS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uMSNX-0008LI-Ev
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 14:12:35 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbc00204-4084-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 16:12:34 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso4449377f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Jun 2025 07:12:34 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009ff7asm18684433f8f.90.2025.06.03.07.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 07:12:33 -0700 (PDT)
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
X-Inumbo-ID: cbc00204-4084-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748959954; x=1749564754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xjmTYl8OxfXtbZBhYtLhFDJDlt08sG7sjuITSZQLHyk=;
        b=czGyjkSZxyeHiAmhCHHDolBAl/itHWGgrUdzAFqcr0VaqTB+YwZu0C83OVOW3Zvykn
         +Inm/60TXYBd/PT7EQO4HhfZDoGzcmm7yv+9193hY8HRIRO9glgwCCQLYOx1uVeQ8ZpS
         JuiWrVItkZYH4Xhxw6wsOHZ0VEQDFeB2HsHXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748959954; x=1749564754;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjmTYl8OxfXtbZBhYtLhFDJDlt08sG7sjuITSZQLHyk=;
        b=mZZJNcchvIvcb+/VTq1Oh3NxV6kBXZAXUJIehzMg0gb4GkLY8BWWCRDYewMq8UJDvK
         Dl/C3GhYqOAzLZ10Z/bDyWs7W8eepXuP/8/m2GkEZ5KSzxVNtt6+4osLkD5GCgSc6hn+
         13sipqA80fV8TMQJIlD3ZXm4PFGbS9ozHS2X6lhvAw7Zyx1BsmLibuK8syXYydXlBsbQ
         KAhYzuIQPNoIY0u7I2nLTIxorc2BZkpUNMngunpSmUhfZc3dyosqMzRzXx2jawnocSgL
         71DegwSbGqiPQZx9t449xKHPOFxQURAWxRaBLOI7Geela68mk2Z95p0LTA8AlTeioRJU
         RPMA==
X-Forwarded-Encrypted: i=1; AJvYcCUs49f20B0FlE1MbS1Psz5h0gxKGumQyQtU4aIDdME+hShLHhQGp0Z7IhTebPOj9TqAM1NJ5232QMw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxxe+G3Fp7hMehuh1VUaVBP//YCanbGG0D3GOopAxHMG9CgOeI+
	aCl267pH6BdQEsBqlNriCFpBMjCSY0jmpIjWugDm3Jft3iFynbbkXEHm4E9S91gqa+k=
X-Gm-Gg: ASbGncsy3uwsTsbztXBEUuLpDm8BY3sGNzlx42fha1RjUA3gnUe3ZHDFq/jdrJHCOKL
	uhYWkQnWBX/mPMRJo9ae3ZNXnsBkUJKY9lXPTZEjYapSbNzGDO55fW7PNBEtaXUIC4YVLXMbkW6
	Kii4CXlDDS2qdhExbkTqOv4/bkJt0ENwNoNVURJ4HKiLJJehsaKBzFPC4CD1KcLjVF2IFxlA6Mt
	NyQ6BT6ld35ETOXkVWyahOggZC+gWdNrWI+ohpx8uh5tWp1Q3bZxf3ywsDcV10+w/dPM87GV5ot
	PRnwiNP84GrmBL3PezZuL45DjAddnglkqusfsoiqQ7+bWugtjjXgBJpB9B7EnYGY50iocWsBGp0
	EK2m6ezRlADcKYHjt9StVAbOJtZY=
X-Google-Smtp-Source: AGHT+IGGgX+/jpAfumrhng1e13HR3ua6uvBQrBVvGc2j8KAcBVsvFdkwIqNjNYauOtcKxr5nE7STZw==
X-Received: by 2002:adf:eacb:0:b0:3a4:ef36:1f4d with SMTP id ffacd0b85a97d-3a4fe391bc4mr7803029f8f.38.1748959954137;
        Tue, 03 Jun 2025 07:12:34 -0700 (PDT)
Message-ID: <86d3655f-f541-441e-bb6c-1dda0b03540f@citrix.com>
Date: Tue, 3 Jun 2025 15:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 8/9] CI: Workaround extra content in junit
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250603124222.52057-1-anthony@xenproject.org>
 <20250603124222.52057-9-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250603124222.52057-9-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2025 1:42 pm, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
> ---
>  automation/scripts/qubes-x86-64.sh | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 7a4c5ae489..6ab8412f45 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -298,6 +298,12 @@ TEST_RESULT=$?
>  
>  if [ -n "$retrieve_xml" ]; then
>      nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> +    # Workaround duplicated data been received
> +    sed -i.old '/^<\/testsuites>/q' tests-junit.xml > /dev/null
> +    extra_line_in_junit=$(($(wc -l < tests-junit.xml.old) - $(wc -l < tests-junit.xml)))
> +    if [ $extra_line_in_junit -gt 0 ]; then
> +        echo "WARNING: Found $extra_line_in_junit too many lines in junit."
> +    fi

Is this the cause of
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1849342222/test_report
getting a row of 0's for ADL ?

Why are we getting duplicate data?  nc is running in TCP mode, not UDP,
so it's not that.

~Andrew

