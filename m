Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC26EBC5560
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 16:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139733.1474982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UjJ-0006SR-O0; Wed, 08 Oct 2025 14:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139733.1474982; Wed, 08 Oct 2025 14:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6UjJ-0006Px-Kh; Wed, 08 Oct 2025 14:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1139733;
 Wed, 08 Oct 2025 14:01:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bWZK=4R=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v6UjI-0006Pr-Qe
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:01:20 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43069139-a44f-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 16:01:18 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e6674caa5so5297285e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 07:01:18 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fa9d6fb41sm38449805e9.17.2025.10.08.07.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 07:01:16 -0700 (PDT)
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
X-Inumbo-ID: 43069139-a44f-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759932077; x=1760536877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=as7YynNUqYOKVsY68tcQnayHTPJ8Racq9v2i8OOoUrQ=;
        b=cWst1cKGs8r+OXL5sDvrgs8lOnmxhcAKaIM6hJKc/lUjNmRavCLkfyVGAwHfiup3Zq
         echkBGDofQHz2N1MpJr3qdOYmL50Lhmd6O04pt20cOmqZOaw1SNtVeVYL5oYdWeUDVIw
         JVxejcx9ZOPBiFW6qI79oypbTORmyXkdyDfKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759932077; x=1760536877;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as7YynNUqYOKVsY68tcQnayHTPJ8Racq9v2i8OOoUrQ=;
        b=ZrkEbbh/UgcTtHotAQw+ODPaya6ThFDCdclikUKiei1Rhubqhd3ts66rmxTr+y4jFv
         YNPvICLGvXDX+ncpYFI3o5iuClpcZmyuJwERreZlzgklDuRtTmO7W17zEasWw8qhz42h
         pt3Rnj9u2AL7cE8kmIVO8BC5QYFyZpFOivVs4JW+S72dKdhKj4owIAF9UtHeI7RlOOnl
         Di4sM58LkNiDwZ7szJokxitk/pqrjr87raHqXsgn3iAlDo2INj/zLTob2v1RS3O/HTcY
         YAZaBJ85U/zM0/Zq+4z6ilW4/52PvEZ/cAPX6tmINragCwmqj59YIvoiCGt6zeJGb1Yw
         d/eA==
X-Gm-Message-State: AOJu0Yw0B23ESZE3YPia9Epgdzxw/Z5ZJk17xjWZE0iRj616jUzyA0sb
	H6+Gy7E/yTfiTaeoLeY2GLvDMI4FWphb+QSNMVxLRDOlMvwyaK49rD5ZLUKprI0QfN6UKSjMo1M
	XAwvOW2H/3w==
X-Gm-Gg: ASbGnctty5E6aUeJUoN68z98fSHadw87+FVMPX7Z7vD5YWQ/1BxdcJAArOb5ajPmcQa
	EJC9oLAGxN9WPUa8sgTVx3sDANfDnId5B7ZKsorBH+nBPnW68a8IBTb0mA1Y0J+wt1lnzEdRnve
	JlTCqhm2TuTkiGySXUUdHQQ6Y3O4vHqNJtuBtLYUXSDW1Qtfm8DqCqFx2i06pDEhRDV/Zg00gBG
	3upx0HZ9dTc/cfjLqfHWF4vkC6itdWIRBiUGTXMWjU7y2gskQcz4QV0xYVdFj5VYk+hm7+P93SD
	YK5hvMTJnqfGRdlUt/Ihv+kMZO5t5eHQBFxj3a2DPiSF9Lya0+QFijXp2bmEmGMW8D20AKvjh8q
	WFmvfuoFj3ozCQH3ysG1rD40rbT0jeb8FDvjUxYNfYQY/B1xCOfdQGsBUUzsdo7mBUaTjbaHIZ3
	1xv0X9yR1LecrK
X-Google-Smtp-Source: AGHT+IFFfI3Fv2xNGRS9TOlZyEy4/dR0zNmF+2Av+v1J1ez045Ru1WnGrfpog4lMl1JPSfXW8eaG+Q==
X-Received: by 2002:a05:600c:b96:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-46fa9ebe245mr29483645e9.11.1759932077269;
        Wed, 08 Oct 2025 07:01:17 -0700 (PDT)
Message-ID: <402547a4-5a0c-4966-b7ec-4d5a6b2cd0cc@citrix.com>
Date: Wed, 8 Oct 2025 15:01:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: More configure [was: ./configure default for systemd]
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <d2974179-0d3b-4bc7-a034-dd6f865e4ea1@citrix.com>
Content-Language: en-GB
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
In-Reply-To: <d2974179-0d3b-4bc7-a034-dd6f865e4ea1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2025 2:51 pm, Andrew Cooper wrote:
> Hello,
>
> (Related to my "Linux xenfs vs privcmd" email, if anyone was wondering
> why I ended up playing with systemd manually)
>
> It turns out that when you build on a systemd-enabled system, you still
> need to explicitly --enable-systemd to get a working debball.
>
> This is contrary to most other behaviours which are active by default if
> the preconditions are met.  In this case there are no preconditions -
> it's just a bunch of text files being processed and written out into the
> proper directory structure.
>
> I think we want to do something better by default here.

Actually there's more wonky stuff here.

Despite using --prefix=/usr, I've ended up with the Ocaml and Python
content being put in /usr/local/lib rather than /usr/lib/.  I think this
means we've got a logical error deriving the other values.

We're still producing:

/usr/include/xenstore-compat
/usr/include/xenstore-compat/xs.h
/usr/include/xenstore-compat/xs_lib.h
/usr/include/xs.h
/usr/include/xs_lib.h

which are long overdue being deleted.  I'll trim them when 4.22 opens.

The contents of /etc/xen are dubious to say the least:

/etc/xen
/etc/xen/auto
/etc/xen/cpupool
/etc/xen/oxenstored.conf
/etc/xen/README
/etc/xen/scripts
/etc/xen/scripts/block
/etc/xen/scripts/block-common.sh
/etc/xen/scripts/block-drbd-probe
/etc/xen/scripts/block-dummy
/etc/xen/scripts/block-enbd
/etc/xen/scripts/block-iscsi
/etc/xen/scripts/block-nbd
/etc/xen/scripts/block-tap
/etc/xen/scripts/colo-proxy-setup
/etc/xen/scripts/external-device-migrate
/etc/xen/scripts/hotplugpath.sh
/etc/xen/scripts/launch-xenstore
/etc/xen/scripts/locking.sh
/etc/xen/scripts/logging.sh
/etc/xen/scripts/vif-bridge
/etc/xen/scripts/vif-common.sh
/etc/xen/scripts/vif-nat
/etc/xen/scripts/vif-openvswitch
/etc/xen/scripts/vif-route
/etc/xen/scripts/vif-setup
/etc/xen/scripts/vscsi
/etc/xen/scripts/xen-hotplug-common.sh
/etc/xen/scripts/xen-network-common.sh
/etc/xen/scripts/xen-script-common.sh
/etc/xen/xl.conf
/etc/xen/xlexample.hvm
/etc/xen/xlexample.pvhlinux
/etc/xen/xlexample.pvlinux

The mix of file extensions notwithstanding, they ought to be in
/usr/lib/xen/ not in /etc, I think?

~Andrew

