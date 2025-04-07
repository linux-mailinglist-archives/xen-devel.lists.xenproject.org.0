Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F3A7E62C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 18:22:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940566.1340297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pEf-0001cL-RQ; Mon, 07 Apr 2025 16:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940566.1340297; Mon, 07 Apr 2025 16:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1pEf-0001ZM-NH; Mon, 07 Apr 2025 16:22:09 +0000
Received: by outflank-mailman (input) for mailman id 940566;
 Mon, 07 Apr 2025 16:22:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxXC=WZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u1pEe-0001ZG-Ay
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 16:22:08 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7309c43f-13cc-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 18:22:07 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so3983038f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 09:22:07 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30096b9csm12592341f8f.13.2025.04.07.09.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 09:22:06 -0700 (PDT)
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
X-Inumbo-ID: 7309c43f-13cc-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744042927; x=1744647727; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y4DCdiXo5MWdVLP7PBUGlRhueoisa78PeAhavwphKo4=;
        b=dke7Je477E1rfkUoEuYEHG+DJ51DtsHtg1E5zJETLTsQH0IwTrjcg/7K/TRqBEISXy
         UEZXPYbCL3cMWS2lziUVhA5Ka/nBwlfyYXibsJGAPErEoJe0b9RUUQlynie1nt7MQwW+
         ZTUfG4Y8UgLlQ7qG5wSbonMQkHczWtY96v9QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042927; x=1744647727;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4DCdiXo5MWdVLP7PBUGlRhueoisa78PeAhavwphKo4=;
        b=Sfds1OsEezTs8Mf/cEuy6VRXDa9Ol1NTiwuaOcdNDJhv3+lZWo4IPZhrP4yuAi34M9
         d5k9ajpylA8zRJ4HYf2wo/fyFOTWdaWEBVZIhvpplLGoQ6/EFmuL6A6n8oKBSbZ1ampp
         6GyPYiznv5vT48YCCQHJWg8QKCCnUCcRkvx09AItdKve3dXfqU31EsiAWOwPmy+iatUW
         5Mn8ba+pC8FaZs8hrgYxCVEKMBmjKqLRMn771lR/xoXHp3EuCBJoKaAmtZYd/ImxpIux
         jC+DS8JNMMSYvlv3ILRrxgGdY737vDiHZ0+74CNtJXjaKU/B4SVOvz0bcaowJNC6tABS
         G1EA==
X-Forwarded-Encrypted: i=1; AJvYcCVJeFuh60kEsk45LY8apR9cVqPh79cdJzESLsbZYqHJPE7wnr+8K6kUx4bnXEEPTatmwouKuzDlC98=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzm+3KG0SUYzZ3kSG4shnssZ+bIPyCefgRn25edtqkOmOgbAn1R
	/0FZ3+z0IuJDvM1WX2lrpWF5brgA7QAo+/SdZPj7s59KTtKj4l2byxDBIucSLbc=
X-Gm-Gg: ASbGncvZKk3wK/524t/djMg4MyKNmc/ULrhGG/T+6HPfuiFUsEgAz0/YTIJluXOHcJr
	Pbw70ZitTDIERcjcjEAD+ShsN0WEQMXsnxTW5zHByNnmyCeP+TnVA0oB8lBk9IrSP2Qb1CbRm3q
	kLIA0XgrRQF8BeQOKaagEzgHbTycE+ubRolc3L8nKe9cUrTubbr4ID+FGGuwBpLSCnbnKDOu5GC
	NjaarhqdIVcecZlLyVan9l+ecl+u7N1XG/x1ahXwCMWMUcl8Z+c1DBBe9chTtNicmnAf2b6BC9U
	JsI2T6Vdj4HBfj5ja3ZA4XVrrbnml5GmAfVn65jFUsMxLp3SUQsmtJr7HN/ZFHo0BEW4BiWywMT
	CtF/4g1iDQQ==
X-Google-Smtp-Source: AGHT+IHzx4Sgx/5mUTUx4EiEFYDazU/aox8sDVSbKGgeFXBMl7FOxm8k7oX8+6kocozqYX3orVJ9ew==
X-Received: by 2002:a05:6000:4313:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-39d0de679d1mr11660112f8f.47.1744042926868;
        Mon, 07 Apr 2025 09:22:06 -0700 (PDT)
Message-ID: <04ae4edc-8ea6-489d-8485-6e45aa750607@citrix.com>
Date: Mon, 7 Apr 2025 17:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH test-artifacts v2 14/12] scripts: build initrd cpio
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.7da1777882774486a13e6f39ff4a2096f6b7901e.1744028549.git-series.marmarek@invisiblethingslab.com>
 <20250407123448.1520451-2-marmarek@invisiblethingslab.com>
 <a2b01279-4e67-4ce9-9752-21c16c33fe32@citrix.com>
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
In-Reply-To: <a2b01279-4e67-4ce9-9752-21c16c33fe32@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 5:17 pm, Andrew Cooper wrote:
> On 07/04/2025 1:31 pm, Marek Marczykowski-Górecki wrote:
>> Build initrd format directly digestable by the kernel. Additionally,
>> include it itself inside as boot/initrd-domU file, for domU booting in
>> tests.
>> This should avoid the need to repack tar -> cpio as part of the test
>> job.
>>
>> Keep generating initrd.tar.gz as that's still used by older branches.
>>
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
>> ---
>>  scripts/x86_64-rootfs-alpine.sh | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/scripts/x86_64-rootfs-alpine.sh b/scripts/x86_64-rootfs-alpine.sh
>> index b70b3a5..13e85fa 100755
>> --- a/scripts/x86_64-rootfs-alpine.sh
>> +++ b/scripts/x86_64-rootfs-alpine.sh
>> @@ -58,3 +58,8 @@ passwd -d "root" root
>>  cd /
>>  tar cvzf "${WORKDIR}/binaries/initrd.tar.gz" \
>>      bin dev etc home init lib mnt opt root sbin usr var
> What's required to drop the tar version?  Presumably merging the rest of
> your series?

NVM, I can't read.  I'm tempted to fold in:

#TODO, drop .tar.gz when Xen 4.20 drops out of testing

That said, I expect we'll be backporting these changes.

~Andrew

