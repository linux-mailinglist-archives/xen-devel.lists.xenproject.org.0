Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288F1BBE586
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 16:29:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138287.1474045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5mDM-0004Ip-TQ; Mon, 06 Oct 2025 14:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138287.1474045; Mon, 06 Oct 2025 14:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5mDM-0004GV-Qo; Mon, 06 Oct 2025 14:29:24 +0000
Received: by outflank-mailman (input) for mailman id 1138287;
 Mon, 06 Oct 2025 14:29:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v5mDL-0004GP-Ql
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 14:29:23 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4827d1a-a2c0-11f0-9809-7dc792cee155;
 Mon, 06 Oct 2025 16:29:13 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso3702596f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Oct 2025 07:29:13 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6c54sm21470709f8f.11.2025.10.06.07.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 07:29:12 -0700 (PDT)
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
X-Inumbo-ID: d4827d1a-a2c0-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759760953; x=1760365753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5BuG5qr3Dy9LA2982vFPtLM0vF9QheugXOd7noRIJM=;
        b=BAWNv4kwQCLUcwccm7BHutHgEy9orgxmCLIM1CFsrWWrBSQb39+Xoj+Fp/+htuGB78
         r4q/PFBbwIjs27wr+nsPwNy+Z7ReAl9HyTyD7FpQtseay59SE75nHfMypjs+bt0pGU7M
         EWh7HPV8yzsbjh//bCUCYwq3Mwvfb4SPgB7xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759760953; x=1760365753;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5BuG5qr3Dy9LA2982vFPtLM0vF9QheugXOd7noRIJM=;
        b=DH0hfidxew10TOP91Fr8ew+5UHem2VewHwCJM/RUpRFgmnejJMbvw8vY3zHfYC9JtP
         KTYUplMo7mtgkvnCgwYVE7SvqWgbmuphrelqNrFMJa9fQQSx90cM6aoy9iJBpLTHskOz
         92/AxqTSRrIaScx53ZuPA0M8HWzgHmhl8DEh66X1P90aNWrUUDhkJh8GSkH285J+GVGM
         Ca9ZS8JwCdDpU7f5+a3ipiu/Ckaved+NUHcrFboB2vzVU32g2wqmIV2fDdzF38nqq3vz
         Pdby6RBy//UN7GnhUr8gpg8PXs4wUXf2RUmfpTCwwHNdUXIXRg8Tm0FOPcsTrboEBBoP
         Fl9A==
X-Gm-Message-State: AOJu0YwPlsW2KCakq0rgxaxSGvaK+b5jNuweU3vsstB4+C9nAk4f1IF9
	OTkV5n2maVbyGKnQsVnzkSTbC3Sx2YCvybiYq36nsfobNRuMR/VsIAy9ZgXnvckVMt4=
X-Gm-Gg: ASbGncuRIppfFBPnqytON/aSNHLhnOzY1spj5kaGgq6SFaUAFBoIFQqJFVx/Wb9zdju
	R5XuenrM+VLgrVvyFPpNgIRs5qr+bcphERrXSBcym2M2BnPxgW065oZAAWPBFLSvJJ8gVJscrCt
	9LQBMxnmuxEMxJhjtWbvoONp+h8NiukGgHn9Z6O70cV1KoWfUx09aj2xdjx44V2elu3prWnLtyD
	lulTXOZBDUM79kT9EfTzMy8uoA6pEQSUVSutmFNeW7ECWQApuhhA3RVnqeCBVEa+9gB2o5STbUu
	cb1h7KurxrpmVz/csfDlpx6z3tJnTttzFpCyVXwbGamZ7g9gwRHvyX1Fi6pXxzZjZ41YnjzKJpy
	QbAamDxROTBP6ePAHAKXyQP9fnxUaZDxoYcpLeWmp6cS6cKh06sR7h+fycZ1T3IZICv04ByAi5S
	ovl4UEPWiI/p8zZZgG8txCze4=
X-Google-Smtp-Source: AGHT+IHjwIsP7DzQUFHlmSXHh7eKGUcE6mP19X3fAWyjrnmGAM6pGQT7OLc9lak0bDhyhFm5v13+Aw==
X-Received: by 2002:a05:6000:2dc9:b0:3ec:dbcc:8104 with SMTP id ffacd0b85a97d-425671aa874mr8900433f8f.36.1759760952572;
        Mon, 06 Oct 2025 07:29:12 -0700 (PDT)
Message-ID: <7bb14669-f8c2-47d5-a3ba-048c0e45458e@citrix.com>
Date: Mon, 6 Oct 2025 15:29:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] vpci/msix: improve handling of bogus MSI-X
 capabilities
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <20250929084149.70560-1-roger.pau@citrix.com>
 <DD60R7HDKJ23.1BYEORZH67NOS@amd.com> <aNvTwrcHsja65ndP@Mac.lan>
 <DDBAHJDFXN5L.2U4TFNVR6NLZ@amd.com>
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
In-Reply-To: <DDBAHJDFXN5L.2U4TFNVR6NLZ@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2025 2:55 pm, Alejandro Vallejo wrote:
> On Tue Sep 30, 2025 at 2:57 PM CEST, Roger Pau Monné wrote:
>> On Tue, Sep 30, 2025 at 11:15:01AM +0200, Alejandro Vallejo wrote:
>>> On Mon Sep 29, 2025 at 10:41 AM CEST, Roger Pau Monne wrote:
>>>> I've had the luck to come across a PCI card that exposes a MSI-X capability
>>>> where the BIR of the vector and PBA tables points at a BAR that has 0 size.
>>>>
>>>> This doesn't play nice with the code in vpci_make_msix_hole(), as it would
>>>> still use the address of such empty BAR (0) and attempt to crave a hole in
>>>> the p2m.  This leads to errors like the one below being reported by Xen:
>>>>
>>>> d0v0 0000:22:00.0: existing mapping (mfn: 181c4300 type: 0) at 0 clobbers MSIX MMIO area
>>>>
>>>> And the device left unable to enable memory decoding due to the failure
>>>> reported by vpci_make_msix_hole().
>>>>
>>>> Introduce checking in init_msix() to ensure the BARs containing the MSI-X
>>>> tables are usable.  This requires checking that the BIR points to a
>>>> non-empty BAR, and the offset and size of the MSI-X tables can fit in the
>>>> target BAR.
>>>>
>>>> This fixes booting PVH dom0 on Supermicro AS -2126HS-TN severs with AMD
>>>> EPYC 9965 processors.  The broken device is:
>>>>
>>>> 22:00.0 SATA controller: Advanced Micro Devices, Inc. [AMD] FCH SATA Controller [AHCI mode] (rev 93)
>>>>
>>>> There are multiple of those integrated controllers in the system, all
>>>> broken in the same way.
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>> Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>> Cc: Jan Beulich <jbeulich@suse.com>
>>>> Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>
>>>> While not strictly a bugfix, I consider this a worthy improvement so that
>>>> PVH dom0 has a chance to boot on hardware that exposes such broken MSI-X
>>>> capabilities.  Hence I think this change should be considered for inclusion
>>>> into 4.21.  There a risk of regressing on hardware that was already working
>>>> with PVH, but given enough testing that should be minimal.
>>>> ---
>>>>  xen/drivers/vpci/msix.c | 50 ++++++++++++++++++++++++++++++++++++-----
>>>>  1 file changed, 45 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
>>>> index 54a5070733aa..8458955d5bbb 100644
>>>> --- a/xen/drivers/vpci/msix.c
>>>> +++ b/xen/drivers/vpci/msix.c
>>>> @@ -675,6 +675,51 @@ static int cf_check init_msix(struct pci_dev *pdev)
>>>>      if ( !msix )
>>>>          return -ENOMEM;
>>>>  
>>>> +    msix->tables[VPCI_MSIX_TABLE] =
>>>> +        pci_conf_read32(pdev->sbdf, msix_table_offset_reg(msix_offset));
>>>> +    msix->tables[VPCI_MSIX_PBA] =
>>>> +        pci_conf_read32(pdev->sbdf, msix_pba_offset_reg(msix_offset));
>>>> +
>>>> +    /* Check that the provided BAR is valid. */
>>>> +    for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
>>>> +    {
>>>> +        const char *name = (i == VPCI_MSIX_TABLE) ? "vector" : "PBA";
>>>> +        const struct vpci_bar *bars = pdev->vpci->header.bars;
>>>> +        unsigned int bir = msix->tables[i] & PCI_MSIX_BIRMASK;
>>>> +        unsigned int type;
>>>> +        unsigned int offset = msix->tables[i] & ~PCI_MSIX_BIRMASK;
>>>> +        unsigned int size =
>>>> +            (i == VPCI_MSIX_TABLE) ? max_entries * PCI_MSIX_ENTRY_SIZE
>>>> +                                   : ROUNDUP(DIV_ROUND_UP(max_entries, 8), 8);
>>>> +
>>>> +        if ( bir >= ARRAY_SIZE(pdev->vpci->header.bars) )
>>>> +        {
>>>> +            printk(XENLOG_ERR "%pp: MSI-X %s table with out of range BIR %u\n",
>>>> +                   &pdev->sbdf, name, bir);
>>> Would it be worth adding something here such that a device vendor testing their
>>> hardware under Xen can trivially grep for device bugs?
>>>
>>> Something akin to "[Firmware bug]" on Linux, like "[Device bug]" or some such.
>>>
>>> It would also let anyone not very knowledgeable about PCI know that a device
>>> they own is being unreasonable. Same below in the other XENLOG_ERR messages.
>> We could add indeed.  I don't think we haven't done so in the past.
>> If we go that route I would suggest that I add a:
>>
>> #define DEVICE_BUG_PREFIX "[Device bug] "
>>
>> in lib.h or similar, to make sure we use the same prefix uniformly.
>> TBH

We have several FIRMWARE BUG's in Xen already, and several more that
ought to move to this pattern.

Given that Linux has definitely been booted on this hardware, we should
match whichever prefix they use for messages about this.

What's unclear is whether AMD can even fix this with a firmware update. 
I would have expected that the PCIe hardblock would have prevented
making this mistake, but clearly not...

~Andrew

