Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F15A26041
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 17:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880879.1290971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezQe-0003wr-VG; Mon, 03 Feb 2025 16:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880879.1290971; Mon, 03 Feb 2025 16:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tezQe-0003tq-Rs; Mon, 03 Feb 2025 16:36:08 +0000
Received: by outflank-mailman (input) for mailman id 880879;
 Mon, 03 Feb 2025 16:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wUg=U2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tezQd-0003tk-Il
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 16:36:07 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f720bbd5-e24c-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 17:36:06 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso2656561f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 08:36:06 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc1317fsm199323615e9.8.2025.02.03.08.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 08:36:05 -0800 (PST)
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
X-Inumbo-ID: f720bbd5-e24c-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738600566; x=1739205366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iwWzlORftMN1+DpR5ggdku3twD6dEAYrwxgAIgUzN3E=;
        b=H6JLbpcWG7eMGlIti7qTskNOCYM3MO8knmee6eX/BDldXzSuQ9t9+Lz1pmfqZmq6wa
         LnDt1qZS5lV6Wvoldt8psE2WQjDyiBZoUa9IJamiZUZn2fwj2JGWJvDt6hgRLgY03+rz
         wvDB+cmUHAlHtc9Jp90YyDyV2SX3CLhovCFxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600566; x=1739205366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwWzlORftMN1+DpR5ggdku3twD6dEAYrwxgAIgUzN3E=;
        b=cZTsSXRjl5239Mfh6XYX5kMMSyy5bWk+tulqWYVRNv5wCaksuuugrdb50PY9A3fcQZ
         3elppmqOXLxaa5pvs+F07rqlGSOGGm6LgefQMPxybaq1HGQzN148F86ZEFrb/vp0hb8w
         7kaDvO+IMDzWW9CTQnId6ekHdgDJkbLS/gQIv3wJTAikGfY4netIAJHMG6lZw8rBj7sl
         lWqk3csGuC9gxynmHHLb8Erd76UMj9H7brRRZGwCyBsPhUg+1KIfxw54Z+pdWdmQcikx
         XumGvIu/aprClBsFh+k2+Zp6S9h3J4vmugA8OmS7G1o8CNVWm2Bt+toObcsoAx0SvhJk
         LTQw==
X-Forwarded-Encrypted: i=1; AJvYcCVyZsVU6CIXHmeW7vtBXVmWsiHu2x2r5hWIp1/umyftCBzy4sfxzviXUkXb4PfhnXCMqYOee8PakWI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxw3dy28ynBd7C+sDasa8eMHrWbrQ3W8H8FgpGzjKGTBgFBkFSC
	eT+RXfkRNW6FIOCfvfJtU7OGynZdVxwrYEUd4F/q9R9eCC6Cr3QwsTCsPRhJte4=
X-Gm-Gg: ASbGncuBjYLEQYOXgwwam3z8GmlBO+yfCtZ2otsQ7/MVEYbgrMgkWohJ8YTWUEoEZhu
	9JSziEE1NCDyYYxF1vfpSVmiTSxay3iYqIq8KjAAzi6AGVJO6Fv9jPJDDhn1Wd7XpdYf/vL7rCr
	25xAQUj8TaCgEJwjMI+8cKbq2ZM2EypMVces1YCrYz1ibkEjGAPGphFIKnZ/1r+jptEZ8dTnRUM
	uCV49H+XSbEmO/cYf+uuPEYmbYHAJj+KjS47UxQ3l1Der/heNSNlLl5dU9xW0v4SgzgmKCFUFm3
	dUE3pbP41OEjdRusVXnnqopzkzSwHaoCXqcr9j1P/udWan3iBdf1Q9g=
X-Google-Smtp-Source: AGHT+IF760gonRhpkN3rZK18Jjn5RjcnddIDDLwewXaXsCZjk0f7dpGXT2KeJyQxzNfsI0GHOXlCew==
X-Received: by 2002:a05:6000:1fa4:b0:38c:5c1d:2875 with SMTP id ffacd0b85a97d-38c5c1d2cbfmr14524110f8f.9.1738600565886;
        Mon, 03 Feb 2025 08:36:05 -0800 (PST)
Message-ID: <bacdbeff-462d-435a-9914-faf61fd3c0aa@citrix.com>
Date: Mon, 3 Feb 2025 16:36:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.20 3/6] radix-tree: purge node allocation
 override hooks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <30f29dde-15e1-4af9-b86f-0040658c381a@suse.com>
 <3c571436-b678-49bc-938d-892913e0e96e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <3c571436-b678-49bc-938d-892913e0e96e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2025 4:25 pm, Jan Beulich wrote:
> These were needed by TMEM only, which is long gone. The Linux original
> doesn't have such either. This effectively reverts one of the "Other
> changes" from 8dc6738dbb3c ("Update radix-tree.[ch] from upstream Linux
> to gain RCU awareness").
>
> Positive side effect: Two cf_check go away.

Not only that, they can now be inlined, although you've merged them
directly.

>
> While there also convert xmalloc()+memset() to xzalloc(). (Don't convert
> to xvzalloc(), as that would require touching the freeing side, too.)
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

One formatting point.

> --- a/xen/common/radix-tree.c
> +++ b/xen/common/radix-tree.c
> @@ -66,26 +60,19 @@ static void cf_check _rcu_node_free(stru
>  	xfree(rcu_node);
>  }
>  
> -static void cf_check rcu_node_free(struct radix_tree_node *node, void *arg)
> -{
> -	struct rcu_node *rcu_node = container_of(node, struct rcu_node, node);
> -	call_rcu(&rcu_node->rcu_head, _rcu_node_free);
> -}
> -
>  static struct radix_tree_node *radix_tree_node_alloc(
>  	struct radix_tree_root *root)
>  {
> -	struct radix_tree_node *ret;
> -	ret = root->node_alloc(root->node_alloc_free_arg);
> -	if (ret)
> -		memset(ret, 0, sizeof(*ret));
> -	return ret;
> +	struct rcu_node *rcu_node = xzalloc(struct rcu_node);
> +
> +	return rcu_node ? &rcu_node->node : NULL;
>  }
>  
>  static void radix_tree_node_free(
>  	struct radix_tree_root *root, struct radix_tree_node *node)
>  {
> -	root->node_free(node, root->node_alloc_free_arg);
> +	struct rcu_node *rcu_node = container_of(node, struct rcu_node, node);

Newline here.

~Andrew

> +	call_rcu(&rcu_node->rcu_head, _rcu_node_free);
>  }
>  
>  /*
>

