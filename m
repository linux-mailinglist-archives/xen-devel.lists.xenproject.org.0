Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D928EB20497
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 11:56:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077211.1438292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPGt-000381-M9; Mon, 11 Aug 2025 09:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077211.1438292; Mon, 11 Aug 2025 09:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulPGt-00035K-Iy; Mon, 11 Aug 2025 09:56:51 +0000
Received: by outflank-mailman (input) for mailman id 1077211;
 Mon, 11 Aug 2025 09:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulPGs-0002bz-0K
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 09:56:50 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f1519b3-7699-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 11:56:48 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b7823559a5so1871389f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 02:56:48 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3b9c7dsm39789224f8f.26.2025.08.11.02.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 02:56:47 -0700 (PDT)
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
X-Inumbo-ID: 7f1519b3-7699-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754906208; x=1755511008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ux+FTk2Cd1CY17fcCBAF9+6lyRgRi7vQ0izw6onAcm4=;
        b=YEe/4wSKLmJH+AvXV3Clg1boiDZ6/P9u0QSrgUhtEjRXlLqCpjw+AWQn8nHLwEn9e3
         81EWnEsfXb50YgQOhdFCUClFCw7exhuytBVsPvkPrKj3qJhu0gnFOcVnQTzGWEXqk+xp
         P1tBu+Zn9gUR/ywhQG8bimWPrtw4PboMyIuEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754906208; x=1755511008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ux+FTk2Cd1CY17fcCBAF9+6lyRgRi7vQ0izw6onAcm4=;
        b=J4Ut+TsnA9+Qzh3ioZGYp5NAxQpedqKhb67CrZaPGWEcWn72naXRosR8VG8+fGRSsB
         VAosn1yT3U8rVRif+ok+/4OkbCM48xqPJzDFPYHL846Epb2gynB0tL2j/qW/K+nqItbV
         mSpvnXKhA4azWFp9smUJ124OLtxAcd6CqhZdo7a3CG8tddCBz+zDqeP7WqtdVoqfAh2u
         71HwY1WlxbJTnUgN51cTd05pd+HzlQ2btDpDtFar58EScgC+S045IVlv1AUHL2uqSN+W
         20RtvD2NjEf97Kbjx8TFJBtdJ9T7y6iaRwuethfZ56WFfGilk4whsuwV3QMbcaHoQSwe
         EjXw==
X-Forwarded-Encrypted: i=1; AJvYcCWykBf4BkkvVbh2U29xGJN9Kot4MwQixmi17TQIZHO8QrpC0ANKsWtBLEI7BSr7T5Zq+uIjB5LMsZI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzXehbMNmB2yuc/1Zlx2mn6Vs07owNtxAYsw2FejZAS4GL4weG
	95C7IedFUHD6LvUhFj0uRIVVkPcs/IMIuLcA8yHnwF7Bc7eL4J7YV05b4F363ngpj94=
X-Gm-Gg: ASbGncvqSycNSsFtLe2khjE8Pwu1aj9+jWVq9gdBOuYcRKx80oKKd2JKsjVMhw39tBN
	Kk2/uKsHRKbb1aIq7eUwujkZRnKGCPWih6YtOuEWa7Li945lAeu8o3SvAEQwbHJ3YXruKam6HPA
	j2Xchfd5A2V+9a/bVwhfg4DOg2sxZQD5LzPeutLFgTA2nPWLQq2YSJX8AfUuyyFOUXjHiBYS+GW
	mll4TTH3cVS1g93q1S+AJmugym3PHsn5LUUgs2b3TDanKsNASPct1SouMNvj8UfalRHOxUGq7B9
	CisA6XmkkMiftjw44Wen9EbeHTKgA0Lx3mZsVxmqHwnhxJubfwj6OKEAUUOqWgFsq9ynQ+xXa6F
	GRHffX1E+M7CfSWSaEA73+w2+CSTkVAlvzHHVeMOdEGFwyHFHIZvQUi6X9KOVTQnqcPnU
X-Google-Smtp-Source: AGHT+IFy0HDnIVP1kg2ixTdd23oCiCiaBBB6MEzUV5IttwAhY3cko+lVwDIf+G3En9TFaTxXouxA4w==
X-Received: by 2002:a05:6000:26c1:b0:3b7:8b5e:831d with SMTP id ffacd0b85a97d-3b900b2d7aemr3169570f8f.17.1754906207736;
        Mon, 11 Aug 2025 02:56:47 -0700 (PDT)
Message-ID: <19ae8104-9a87-4b44-a2fe-9d72a6d07fef@citrix.com>
Date: Mon, 11 Aug 2025 10:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] CI: Trixie containers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Victor Lira <victorm.lira@amd.com>
References: <20250809221206.1260861-1-andrew.cooper3@citrix.com>
 <20250809221206.1260861-2-andrew.cooper3@citrix.com>
 <37edbe9d-3c14-422b-b21b-49a5fa25a453@gmail.com>
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
In-Reply-To: <37edbe9d-3c14-422b-b21b-49a5fa25a453@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/08/2025 9:47 am, Oleksii Kurochko wrote:
>
>
> On 8/10/25 12:12 AM, Andrew Cooper wrote:
>> Debian Trixie has been released.  Provide new containers.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Anthony PERARD <anthony.perard@vates.tech>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Jan Beulich <jbeulich@suse.com>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> CC: Doug Goldstein <cardoe@cardoe.com>
>> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> CC: Victor Lira <victorm.lira@amd.com>
>>
>> I've deployed these containers already so people can play.
>>
>> No ARM yet.  There's an (old) outstanding series cleaning up the arm
>> infrastructure, blocked on unclear root requirements for the Xilinx runners.
>> That series really needs fixing.
>> ---
>>  automation/build/debian/13-ppc64le.dockerfile | 37 ++++++++++
>>  automation/build/debian/13-riscv64.dockerfile | 37 ++++++++++
> LKGTM: Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> #riscv
>
> Also, shouldn’t we update the |automation/scripts/containerize| script to
> add Debian 13 support?

Yes, and I should probably put something in Changelog too.

~Andrew

