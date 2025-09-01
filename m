Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D36FB3E3D9
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 15:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104718.1455742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4C4-0004M4-Fb; Mon, 01 Sep 2025 13:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104718.1455742; Mon, 01 Sep 2025 13:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut4C4-0004Kb-Ct; Mon, 01 Sep 2025 13:03:32 +0000
Received: by outflank-mailman (input) for mailman id 1104718;
 Mon, 01 Sep 2025 13:03:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdOO=3M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ut4C2-0004KV-Rs
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 13:03:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e31af17-8734-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 15:03:29 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45b804ed966so11777305e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 06:03:29 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d64ba4ff83sm4876871f8f.4.2025.09.01.06.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 06:03:28 -0700 (PDT)
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
X-Inumbo-ID: 0e31af17-8734-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756731809; x=1757336609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QE3Qc9cg8PEzoK8zgrJVZfJw67jf3EWpZOGJxKNeCSE=;
        b=u26dZ+Q/PCwwKRCTBpp6Mrz46xQ5ZPzWUduKG33/gZWgyCl6DY+W/6sMZ/fx3BD6e9
         fLc+LSU0tfeH5KgLqmb/YWPQ/Mi+/plAgj5+oYNsxooq50YtoMVa2l6IUfdE8qKZif8m
         TFxvukxgsNxCK1SMgC3arV2MJEr23mZnX2eys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756731809; x=1757336609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QE3Qc9cg8PEzoK8zgrJVZfJw67jf3EWpZOGJxKNeCSE=;
        b=lxpJpd/Wkwp+VibJlFbNDkdiLvKMlan5c/wnBi+g8PXBkLzDKsoqSEDijUF6/zqhAz
         cjv5GHczPDtFzJKds7y+QiRMUcGB4IN3vIm3Dj8HGglt9208FvIF6vYUejRGUrsQVLcq
         k6wZ0D7JakUVF/YFzxUrTOgmEuE79EPakl1d79ByZkILBAdTy5bQJVIc6TuF7mkd09sz
         jHT2ynfYLcv2YY5rslVuCwpoRiMrwpfKAx41MK/yC8qGo4WeQcx0ScRkC9OhtcsX9hwS
         2+PAUY0OQwzLYlq0ZKi2MQbCMCwfQZ9EWmE0RDCQK56BbMcKgaTMhTqXBHKdhDcLovqp
         1UUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcQCnGGVf5CPrrLvI9qA3l5fdc4ekMcQS/RXUg0e6Ii4miJ9VvHZx3XG4BJuHB69epaAz76BYru6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVWWiSsVnobHmATPYWPL8/4Md2fuQK0wWdC0dN1pg8DJoVcjsG
	myUDH/4ZriFQHJCWwb4EwUMjN4aRtALoxlHEiK63tBiyy3GrHLeiTwsVMlpW28TEARo=
X-Gm-Gg: ASbGncu4fm9gWbGiA/P1X3ybHyBsgY5fRZ0y6/Aja0qH23N7qBYRaf5pwBOOvAmEyK2
	Xcr0BIMHz9ZlPZ40Ga0LgnU+bDRd5LqzGVy8PqoWMDrSzx+K2DRIBOiiQm3bLaEz+8WdQGQ+1N3
	O3faxqHtT69IiDaxSRlGoCklaILsTlHdcCxh1BWwLQqhdcsAzE5CYZDfah2CUqlAGSIhvWyzWwb
	wyEnktCoYgvhyWKXgoTolU6AJp5ZRI8quMxNqRwyJ0gA5ejyd3Ch/BV3NYNkseeMsujNDttFFlk
	SEN8t92BKEn6uGDTNKbA7xvhUEH/KcmnnRAERCiJvEULfy0yWq2v37qqLrQUF69FXW4Imjrku5a
	BkGRlYFgd/C685/lNk2V22pOfuAhRtQYDobXRHpM7ZwcTUkqleHMeuaAadkzVLYJGB9IO
X-Google-Smtp-Source: AGHT+IFBbLI8EKBAuFCpAu3TabfhlRlfwfA332aoovLqJNHIQ6B8KpvtdCS4v598kffBy8im/PEoKQ==
X-Received: by 2002:a05:600c:458b:b0:45b:88a2:d01f with SMTP id 5b1f17b1804b1-45b88a2d12cmr53876655e9.3.1756731808805;
        Mon, 01 Sep 2025 06:03:28 -0700 (PDT)
Message-ID: <10436acb-bf5c-4fde-950b-62cf54f07025@citrix.com>
Date: Mon, 1 Sep 2025 14:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] imagebuilder: Add a script to check the sanity of
 device tree
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 volodymyr_babchuk@epam.com, mark.brown@parrylabs.com,
 matthew.l.weber3@boeing.com, sookyung.ahn@boeing.com
References: <20250901123103.11418-1-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250901123103.11418-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/09/2025 1:31 pm, Ayan Kumar Halder wrote:
> diff --git a/scripts/dt_sanity.py b/scripts/dt_sanity.py
> new file mode 100644
> index 0000000..171947f
> --- /dev/null
> +++ b/scripts/dt_sanity.py
> @@ -0,0 +1,33 @@

Shebang

> +import argparse
> +from pydevicetree import Devicetree

pydevicetree isn't part of the standard library.  Readme should note the
external dependency.  Also it should be separate from stdlib imports.

>  sys
> +
> +def load_compatible_strings(config_path):
> +    with open(config_path, 'r') as file:
> +        return [line.strip() for line in file if line.strip()]

You should choose a different name from file as it shadows a keyword.

Also, you want something more like this

with open() as f:
    for l in f.readlines():
        l.strip()
        if l:
            yield l

but you really ought to also consider supporting comments in this config
file.

> +
> +def check_compatible_nodes(dts_path):
> +    # Parse the DTS file
> +    tree = Devicetree.parseFile(dts_path)
> +
> +    # Search nodes for compatible properties in the global array
> +    for compatible in compatible_strings:
> +        nodes = tree.match(compatible)
> +        if len(nodes) == 0:

if not nodes:

> +            print(f"Error: Node with compatible '{compatible}' not found.")

f-strings are not supported in our minimum version of python.  Use % or
.format().

~Andrew

