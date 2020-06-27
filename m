Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0FA20C036
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jun 2020 10:35:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jp6JA-0000XJ-FQ; Sat, 27 Jun 2020 08:35:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GVLV=AI=yubico.com=trevor@srs-us1.protection.inumbo.net>)
 id 1jp6J8-0000XE-7t
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2020 08:35:30 +0000
X-Inumbo-ID: 27cb9dc4-b851-11ea-b7bb-bc764e2007e4
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27cb9dc4-b851-11ea-b7bb-bc764e2007e4;
 Sat, 27 Jun 2020 08:35:29 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id t25so8125436lji.12
 for <xen-devel@lists.xenproject.org>; Sat, 27 Jun 2020 01:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yubico.com; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=q/D1jQVc/yvqJDcGR/5pp8VpYBedOlbFNiJGMXBwOUw=;
 b=hZaLJ8N/6npvDu7AySS9A/5x4VnPKS1PhWTFyGIG4i4ZWoneQIrqIz1dRHmj4lws14
 BZ/tFNrxnepdS3sx1wUCIsTyQlz5+DJA6vgqAccfAR1sDHEXmhD/fEA2Xu4WRcZvqKwz
 b4+HgIBLtkLHwlTdSAPwAHlK+iDKhxg7gmlMlcDzxfkMeFHRQUsGNQEiuBzgEule5Uit
 RdNhpSaenGjq8roPu3BlLXVA52jbGRcpdXBJFzEcO4vOqU03EmuESYpJtwuzD78DsusY
 sLF/6pYTS4O8od5wp1WflQPerVllz6IM00zioys8mTTRNi+Oxq/DaYcHnj3KkAwOrEu3
 st8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=q/D1jQVc/yvqJDcGR/5pp8VpYBedOlbFNiJGMXBwOUw=;
 b=AS9Zqiew2t4Vn1J8Tboz/hG3Yyj79DnQC3zHSso63nx5W8uIwy2lXudUtJFk13NUnl
 yRMqZuALlITBHf6xmTRpAAMHkhvQLfPjIatoHg7JKS9ZKxdMT4MeNOFQSaT7+6EKpr8b
 BFFb+SfJLgKS5w+CkGTqcJUev/B75wMsrIopAyoyqrJr4mYDm9rwbXkTJowJgUlbZDFb
 wJcW0OscWXdTB7ia7zENIfVvbZYJD0cXfe4PKr8OKT3F3bG5wlvKfN5J254yGPCaEbi8
 PbeCf5IVJNGTRkrEHjMdDey+vLgfLaaQiEo0UbJBk/drBNuNLiEAOzmC3NK6e+kc88ZA
 zt9A==
X-Gm-Message-State: AOAM531X7fYzJyMYO75bzYrywx2k8A5ETwbs8JJxsL3AEa6W/bY5Av6C
 r7qn8JRBLq5/Dlnt132ObRwsHMbWHNWEstZsLEFMkj/M2C5UBJYy+QJMFcgne4iUlnAUA8UGGyb
 Ns4lK2gD0tVdCX9eRN5p+EgG5TH1CqTkbxkiqAkjZjlm/exD/m77c9QUvtmWHH2C0gPe+7NeROw
 ==
X-Google-Smtp-Source: ABdhPJzlc03rNshWI1PMO0QrGHhuSnwqn0M5njsCoh/vlOcJpL+nr3ya+1aQXlhYqZFc2ysH6BLEuQ==
X-Received: by 2002:a2e:9618:: with SMTP id v24mr3709264ljh.303.1593246927799; 
 Sat, 27 Jun 2020 01:35:27 -0700 (PDT)
Received: from apple-IIe.local (c188-151-193-98.bredband.comhem.se.
 [188.151.193.98])
 by smtp.gmail.com with ESMTPSA id s62sm5577789lja.100.2020.06.27.01.35.27
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Jun 2020 01:35:27 -0700 (PDT)
To: xen-devel@lists.xenproject.org
From: Trevor Bentley <trevor@yubico.com>
Subject: Suspend/hibernate not working on Dell XPS 15 9500 laptop
Message-ID: <afe621ac-d446-7dbf-e368-e06ab0a95970@yubico.com>
Date: Sat, 27 Jun 2020 08:35:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:75.0)
 Gecko/20100101 Thunderbird/75.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I asked on #xen on Freenode and was requested to post here.

Summary: Under Xen, both suspend and hibernate operations put the laptop 
into some sort of unrecoverable low-power mode, and a force power-off is 
required.

Environment:
  - Dell XPS 15 9500, BIOS 1.0.1 (this is a new 2020 model)
  - Intel i7-10750H
  - Intel i915 + Nvidia GTX 1650 Ti Mobile
  - Arch linux (clean install)
  - Linux kernels 5.7.5, 5.7.6 tested
  - i915 driver loaded, no nvidia drivers loaded (nouveau blacklisted)
  - Xen 4.13.1, 4.14.0-rc3 tested
  - UEFI, GRUB2 bootloader, LUKS-encrypted /boot, /root, and swap 
(unencrypted /efi with GRUB stub loader)

My Xen was built from this Arch AUR: https://aur.archlinux.org/packages/xen/
With these small patches to bump to 4.13.1 using gcc 10: 
https://github.com/sl4mmy/docker-aur-xen
And the same patches manually applied to a git checkout to bump to 
4.14.0-rc3.

In non-Xen boots, both suspend and hibernate work (using 's2idle' for 
mem, unsure about 'deep').

In Xen, with no guests configured, both suspend and hibernate in Dom0 
power down the screen, fans, and keyboard backlight.  Once suspended, 
nothing awakens it.

I tried every combination of /sys/power/pm_test 
(freezer/devices/platform with s2idle and 
core/processors/platform/devices/freezer with deep), and all pm tests 
*succeed*.  It goes into whichever low power mode, waits 5 seconds, and 
fully recovers.

I'm unable to interpret the results when /sys/power/pm_trace is enabled. 
  "hash matches" is printed in the dmesg log, seemingly always in a 
different place/format.  /sys/power/pm_trace_dev_match just reported 
"acpi" the few times I checked it.

Please let me know if you have any suggestions to try, or if you need 
any extra information for debugging.

Thanks,

Trevor

