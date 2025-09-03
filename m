Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F09B4271C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 18:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108784.1458810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utqXL-00059R-EJ; Wed, 03 Sep 2025 16:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108784.1458810; Wed, 03 Sep 2025 16:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utqXL-00057x-BU; Wed, 03 Sep 2025 16:40:43 +0000
Received: by outflank-mailman (input) for mailman id 1108784;
 Wed, 03 Sep 2025 16:40:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Q+D=3O=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1utqXK-00057h-8a
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 16:40:42 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba6ee8bd-88e4-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 18:40:41 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b7d87b90fso629105e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 09:40:41 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b945332adsm99257745e9.4.2025.09.03.09.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 09:40:40 -0700 (PDT)
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
X-Inumbo-ID: ba6ee8bd-88e4-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756917640; x=1757522440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xipl4Nx72wtXbNptURyvN8Bu7gPb+9II1FnRgokKKuo=;
        b=BAVEdutVJRulNWbmfCFeGVXt8Nq30VaLirQkYEx3L0JWBk1UEGlZAMaEFSESc0FDp9
         KPTROMUTnKLxVxLzUxghQU0nzYjjalqQNtxcgTYY4wQcIJhtNNVthnVUf4LkPj5o2W7I
         0VzcOjfiZ05FAyj3izUC8w27bCQ1Xr67iOv0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756917640; x=1757522440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xipl4Nx72wtXbNptURyvN8Bu7gPb+9II1FnRgokKKuo=;
        b=UNSVpNXMMOgbFOqA1oy0YujDjca8P5aAiWSh9TwARGE/CE/kOLO+r37ikL3XHMxFgU
         HpA7Iz6IBVul6nh1J5+yYyswdDIi875ySwKoZdgmremAyRGFfutq0K+cHX2DSvZINZNC
         gdZoNNgMhLQqp5ldUbTkeIw6n4dBebmzlpJ3TW01pUlUjCJ9AzdlrrojsJXkDAlkalX6
         yzIVyjetrGqzQGjD+Wi3aJyeFPhtCeqOS0qYzmPsMO0t9/lYlN9fm8taulwomvz80bUP
         JEHQX6NUh9n69D2wUTKGjWDahCwZI4KDM0HeJ0dODSFjRF9DwUlepqhHE3CdA98fB8JE
         aAkA==
X-Forwarded-Encrypted: i=1; AJvYcCUBmCsyK/VU7x+h41AgGGPKlydZ5NoLgkaHnS64QAVxu5diBHvhjg0VHELdnDgyiyYc9JoQSU0BKAM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywbb5sCq/B82FZJbUdTA0aCSXz6ymbi0oen6FNd5Ym1i21DzMZJ
	wgWFVUtJsbCICEiE39zD9JnivMDLYlQQVKhHHLK3tJefoO4RslQBldLilrI4TJiqeWs=
X-Gm-Gg: ASbGncu94qR348eDDMtVVFlSvusq9ccagTci56N8apjPNHdDdSeKWfbxe+h6XuhvzQJ
	Y0mxWl3zhq7G25imHr8RSaDqiidFVuL8TU8o8kFyIltBBv3I612fVe/qvkDdDdEpFR03sQ3/Bek
	GjhPZrj+bdVNwLAKHJfWMJE665e7ijDJH7fCmwhBcVxlm8GUdhBsaZj5lAiWiYUmC4ZCGBYZew2
	iTsG4u91MMxx6oDAoWOs4gXgSBxBpoQn1zDtjd6VRZoC1z0rpHZb9BhGuZKn1yaX19Ypzff/t2U
	mK536+6kGQrH1wnSin10p20ci2MlTBzBvLPmXiws+xU21TRi/Mc2eBsuOPPUBDyQn5w6ilv70ij
	7FxwoNv8F+lo4hRwtdba4JJ2n9toKaeojr3oZQTCJ/wkNWcm59HnFKHF8DoOvpaA8qqHgTS4QI6
	BwQpk=
X-Google-Smtp-Source: AGHT+IGOXKgQc4XJzlsPghZlERMc0676mTnGZbRUvoySHNCKvo8Q7Ux5L85BV+L7kMGCHtz9Ne+CCA==
X-Received: by 2002:a05:600c:c4a1:b0:459:443e:b18a with SMTP id 5b1f17b1804b1-45b8559aff8mr148984485e9.14.1756917640500;
        Wed, 03 Sep 2025 09:40:40 -0700 (PDT)
Message-ID: <dc8047f3-215f-42af-ad42-76f206e4d557@citrix.com>
Date: Wed, 3 Sep 2025 17:40:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build: avoid absolute paths in executables
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <1071997f-efe6-4088-b753-b74d3a045a09@suse.com>
 <795b069f-12ea-4d05-bdc4-877a6a93fe7c@citrix.com>
 <6f310470-60f3-4c8e-a1fd-1216fd44e4ea@suse.com>
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
In-Reply-To: <6f310470-60f3-4c8e-a1fd-1216fd44e4ea@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/09/2025 5:12 pm, Jan Beulich wrote:
> On 03.09.2025 17:26, Andrew Cooper wrote:
>> On 03/09/2025 4:13 pm, Jan Beulich wrote:
>>> For in-tree builds relative paths are used, whereas for out-of-tree builds
>>> in various situations absolute ones come into play. The extra paths can be
>>> long, wasting space and e.g. serial line bandwidth. They would also get in
>>> the way of location-independent reproducible builds. Leverage newer gcc's
>>> (and Clang's) ability to "remap" file names. For older gcc fall back to
>>> using the option affecting debug info only.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Of course we may want to consider putting this in the top-level Config.mk,
>>> to also affect other sub-trees (presently mainly/only affecting debug
>>> info, for which even gcc5 already supports -fdebug-prefix-remap=).
>>>
>>> As to a Fixes: tag, I wasn't quite sure whether to "blame" the
>>> introduction of out-of-tree builds.
>>>
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -448,6 +448,8 @@ LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin
>>>  endif
>>>  
>>>  ifdef building_out_of_srctree
>>> +    CFLAGS += $(call cc-option,$(CC),-ffile-prefix-map=$(srctree)/=, \
>>> +                                     -fdebug-prefix-map=$(srctree)/=)
>>>      CFLAGS += -I$(objtree)/include
>>>      CFLAGS += -I$(objtree)/arch/$(SRCARCH)/include
>>>  endif
>> We do want to be taking a change like this, but it's also definitely not
>> limited to out-of-tree builds.  I have full paths embedded even for
>> in-tree builds.
> In xen-syms I see only two full paths - in debug info, supplying the base
> path to the tree. That's okay to stay imo.

Not for reducible builds it's not.

>
> In xen.efi I see a few hundred, but they're all the same as above. As I
> learned earlier today, SHF_MERGE processing isn't invoked when linking
> ELF objects into a PE binary.
>
>> To be useful, it wants to apply to everything, not just the hypervisor,
>> so does want to be in the top level Config.mk.
> As per my first remark then. But no, I meanwhile realized that this can't
> go in Config.mk: For the hypervisor we want to use $(srctree), i.e.
> including the leaf /xen referencing the xen/ subtree. I expect that for
> e.g. tools/libs/ we'd want something similar - eliminate the entire path
> up to the base of the component's source dir. So it will need to be
> piecemeal.

Relative to the root of xen.git (or the source tarball) is the only
sensible option.  Anything else is intentionally misleading.

In fact, Marek had a more-correct form of this patch in
https://lore.kernel.org/xen-devel/0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com/T/#u
which seems to be waiting on you to reply.

Please, along with Marek and Anthony, figure out what a v2 should look
like, which applies to the whole tree and does not trim the xen/ part of
the path from the hypervisor.

Oleksii, please track this for 4.21.  Build reproducibility is not an
optional exercise these days, and given multiple downstreams depending
on it, it needs fixing for once and for all in upstream.

~Andrew

