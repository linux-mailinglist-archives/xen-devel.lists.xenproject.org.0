Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A4AA25C94
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 15:32:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880659.1290740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1texUM-0000p0-Hw; Mon, 03 Feb 2025 14:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880659.1290740; Mon, 03 Feb 2025 14:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1texUM-0000mt-FH; Mon, 03 Feb 2025 14:31:50 +0000
Received: by outflank-mailman (input) for mailman id 880659;
 Mon, 03 Feb 2025 14:31:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1texUL-0000mn-Ed
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 14:31:49 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99ac1e77-e23b-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 15:31:48 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso30593455e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 06:31:48 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c0ec7e6sm13110181f8f.19.2025.02.03.06.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 06:31:46 -0800 (PST)
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
X-Inumbo-ID: 99ac1e77-e23b-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738593108; x=1739197908; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7t3BSSjcrxejb2puSOiWGTMZiXldn1JUwo60pdwC2k=;
        b=nC9HDfJ+ZzptMlMZ7LwEN8fuZXifu9WSD/bfiQqtEdRwNsTZ1YQ9Sb7TbhgK8jOvZJ
         iDd/X2r6ZMMGrXcL2khFePG49FYKnkTyf6LcWcw+KCBG1UH65OzZJBtCszFNbHPXPeRI
         CO0dOPytjmgwsuLovkt7iVXRQRLCAJtDLATtWjWzlISwHUReaO1Zl1fY+pw1bMwynhNW
         DFWWFgO2ruKhOcbBBt0jPwBeD6koWg30V25t6UWFM5TffQsvBaoJTT6RS9JQBZSRVSQK
         5a/x+4PoWtj96k2YZ+VIbvDLyJAVQbcrtwN/TH/E9HBwDPDBGMPmnBVoICGbJJCnXu//
         NHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593108; x=1739197908;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k7t3BSSjcrxejb2puSOiWGTMZiXldn1JUwo60pdwC2k=;
        b=lt7QgHOzwqiWfz6Kehgb7qNAdn60Om4LyxHDnKCGb1g0XRRUoo5mPb4sFtEBDYoJnK
         sL06G9fJYQbtzjVrG6DER2w0N3+lK8VwuVi0QvGyYd/xORdHZnE6dmOdjXYDW8axEj91
         fGJPlPgiIeDI7MTuJJYiasTBmwsuww/h1gPD2/8X8yfrXMwi7R98XUOmUzxZlycDXnBT
         vD+aBbKotWg2JLyumP8trHClMG59H/28vbxB+Cwh++yh0B5IwLUOFGBtfftcBMyT99zD
         MQ8d9kAeEGrUTPn4mgqonA9zf5zF1wc0jueOOQwNPgKJjE4zRgqXKrtTOnd6j+/Thw0Y
         Pukw==
X-Forwarded-Encrypted: i=1; AJvYcCXA+z7WyUFSqOMp7XYlDUtHxqjDRh8BLKnMRNg4BpWRqSsVuI7TcZ8u4/HynSzBTCIoC5IDRBAy9Xk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwqZkKg9TreBBt15+GpLHoG3MzOX7i43wcextGqDIDZDJ3CSq2E
	5n9kwyETaQYyzGTsTElkhIp0lbz88bX9T1OehU50zIGEWCkndbt0
X-Gm-Gg: ASbGncvyV+fil1YyaRcgPB4Ykw1u+EdoD2CpWNT/3bHuSaoPfJ/VyM2kWZDo4S0hGw3
	cFSSh5ZVfmEjF6C4dl9mBw9m/vWq5lIF/ftCR1ZgmUDm3MYfh2sUzErqenWdPsRm7ouop0KwrqB
	M28TxWhpFvHYBEi7JM4DJtx0hNI30cbEXhJAwgRJJGKm21ino2vrSQYs+JXPT1+YlXkag5ZHhSd
	dlSsHWOsy42u8qyvV34uB2g0jVlfAX6Q+4jOcvQ8x4bAizQSYqafPtGBEeSvZ2ocWijFB8fgwQ7
	dS3gcxF+aOaoBH3lnzqH/zp1o1aaTEMjHgwsMMkHE6stQT8n2DTjx3bPubSNlAZ+T32KONWTt86
	mvgs=
X-Google-Smtp-Source: AGHT+IFp0oH5+6tMoz60Mj/fnyQfMkvPuk7hF7UfclkPQVtlpM//Q1B6gRkJoaADEIgN5CUqpH2D0A==
X-Received: by 2002:a05:600c:1d07:b0:434:f219:6b28 with SMTP id 5b1f17b1804b1-438dc40ff6fmr173782485e9.24.1738593107087;
        Mon, 03 Feb 2025 06:31:47 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------P5TN0BHlsPahZbI0XV4qJ94N"
Message-ID: <027c2603-1a2a-4a76-975f-b227a3adef5a@gmail.com>
Date: Mon, 3 Feb 2025 15:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when
 virtualised
To: "Katz, Jonathan" <jonathan.katz@aptar.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250121142510.358996-1-andrew.cooper3@citrix.com>
 <eb58ed74-1156-4de5-8392-a546d9afddc3@gmail.com>
 <76b3b208-a576-48f2-820b-e213722fe229@citrix.com>
 <SJ0PR04MB83435FE711BB6747C6EA9F90F0EC2@SJ0PR04MB8343.namprd04.prod.outlook.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <SJ0PR04MB83435FE711BB6747C6EA9F90F0EC2@SJ0PR04MB8343.namprd04.prod.outlook.com>

This is a multi-part message in MIME format.
--------------P5TN0BHlsPahZbI0XV4qJ94N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/27/25 7:56 PM, Katz, Jonathan wrote:
> Tested on xcp-ng vm on esx 8 that previously failed to boot when 
> performance counters were not enabled.
>
> - patched host
> - rebooted host
> - host still came up normally
> - shut host down
> - turned off performance counters on vm
> - booted host
> - host still came up normally and no issues running vms
>
> Thanks!
> jonathan
>
> Jonathan​​​​
>
> 	
>
> 	
>
> Katz
>
> 	
>
> 	
>
> IS Senior Specialist, Infrastructure Operations Engineer
>
> AptarGroup
>
> 265 Exchange Drive, Suite 100
>
> 	
>
> ,
>
> 	
>
> Crystal Lake
>
> 	
>
> ,
>
> 	
>
> Illinois
>
> 	
>
> 	
>
> 60014
>
> 	
>
> ,
>
> 	
>
> United States
>
> (phone) +1 779 220 4484 <tel:+1%20779%20220%204484>
>
> 	
>
> |
>
> 	
>
> (mobile) +1 847 525 8441 <tel:+1%20847%20525%208441>
>
> jonathan.katz@aptar.com <mailto:jonathan.katz@aptar.com>
>
> 	
>
> |
>
> 	
>
> www.aptar.com <http://www.aptar.com/>
>
> AptarOnlineSignature
>
> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: Monday, January 27, 2025 6:42 AM
> To: Oleksii Kurochko <oleksii.kurochko@gmail.com>; Xen-devel 
> <xen-devel@lists.xenproject.org>
> Cc: Katz, Jonathan <jonathan.katz@aptar.com>; Jan Beulich 
> <JBeulich@suse.com>; Roger Pau Monné <roger.pau@citrix.com>
> Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when 
> virtualised
>
>
> EXTERNAL MAIL: Do not click any links or open any attachments unless 
> you trust the sender and know the content is safe.
>
>
> On 21/01/2025 4:57 pm, Oleksii Kurochko wrote:
> >
> > On 1/21/25 3:25 PM, Andrew Cooper wrote:
> >> Logic using performance counters needs to look at
> >> MSR_MISC_ENABLE.PERF_AVAILABLE before touching any other resources.
> >>
> >> When virtualised under ESX, Xen dies with a #GP fault trying to read
> >> MSR_CORE_PERF_GLOBAL_CTRL.
> >>
> >> Factor this logic out into a separate function (it's already too
> >> squashed to the RHS), and insert a check of
> >> MSR_MISC_ENABLE.PERF_AVAILABLE.
> >>
> >> This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofile
> >> (the only consumer of this flag) cross-checks too.
> >>
> >> Reported-by: Jonathan Katz <jonathan.katz@aptar.com>
> >> Link:
> >> https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fxcp
> >> -ng.org%2Fforum%2Ftopic%2F10286%2Fnesting-xcp-ng-on-esx-8&data=05%7C0
> >> 2%7Cjonathan.katz%40aptar.com%7Cc036df18462d402eda5608dd3ed01147%7C5f
> >> d74a3ed57a410e8d7c02c4df062234%7C0%7C0%7C638735785584484308%7CUnknown
> >> %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW
> >> 4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=jG5dfAjyXvB
> >> JRrtNklKp8MjGOUoYGntpD14eRP5GCcI%3D&reserved=0
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >>
> >> Untested, but this is the same pattern used by oprofile and watchdog
> >> setup.
> >
> > Probably it will make sense to wait for a response on the forum (you
> > mentioned in the Link:) that the current one patch works?
>
> It's been a week. At this point it needs to go in for the release. As 
> I said, this is exactly the same pattern as used elsewhere in Xen, so 
> I'm confident it's a good fix, and Roger agrees too.

Based on the test results, it seems everything is okay, so:
R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


>
> ~Andrew
> This e-mail may contain confidential information. If you are not the 
> intended recipient, please notify the sender immediately and destroy 
> this e-mail. Any unauthorized copying, disclosure or distribution of 
> the material in this e-mail is strictly forbidden.
>
> /Aptar’s//Privacy Policy 
> <https://www.aptar.com/en-us/general-terms-and-conditions-use.html> 
> //explains how Aptar may use your personal information or data and any 
> personal information or data provided or made available to us./
>
--------------P5TN0BHlsPahZbI0XV4qJ94N
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/27/25 7:56 PM, Katz, Jonathan
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:SJ0PR04MB83435FE711BB6747C6EA9F90F0EC2@SJ0PR04MB8343.namprd04.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div>Tested on xcp-ng vm on esx 8 that previously failed to boot
        when performance counters were not enabled.<br>
        <br>
        - patched host<br>
        - rebooted host<br>
        - host still came up normally<br>
        - shut host down<br>
        - turned off performance counters on vm<br>
        - booted host<br>
        - host still came up normally and no issues running vms<br>
        <br>
        Thanks!<br>
        jonathan<br>
        <br>
        <div dir="ltr"
style="mso-line-height-rule:exactly;-webkit-text-size-adjust:100%;font-size:1px;direction:ltr;">
          <table dir="ltr" cellpadding="0" cellspacing="0" border="0"
style="width:100%;direction:ltr;border-collapse:collapse;font-size:1px;">
            <tbody>
              <tr style="font-size:0;">
                <td align="left" style="vertical-align:top;">
                  <table cellpadding="0" cellspacing="0" border="0"
                    style="border-collapse:collapse;font-size:0;">
                    <tbody>
                      <tr style="font-size:0;">
                        <td align="left"
                          style="padding:13px 0;vertical-align:top;">
                          <table cellpadding="0" cellspacing="0"
                            border="0"
style="width:0;border-collapse:collapse;font-size:0;color:#FFFFFF;font-style:normal;font-weight:400;white-space:nowrap;">
                            <tbody>
                              <tr style="font-size:0;">
                                <td align="left"
                                  style="padding:0;vertical-align:top;">
                                  <table cellpadding="0" cellspacing="0"
                                    border="0"
style="border-collapse:collapse;font-size:0;">
                                    <tbody>
                                      <tr style="font-size:0;">
                                        <td align="left"
style="padding:0;vertical-align:middle;">
                                          <table cellpadding="0"
                                            cellspacing="0" border="0"
style="border-collapse:collapse;font-size:0;">
                                            <tbody>
                                              <tr style="font-size:0;">
                                                <td align="left"
style="padding:0;vertical-align:top;">
                                                  <table cellpadding="0"
                                                    cellspacing="0"
                                                    border="0"
style="border-collapse:collapse;font-size:0;color:#5F5F5F;font-style:normal;font-weight:400;white-space:nowrap;">
                                                    <tbody>
                                                      <tr
style="font-size:14.67px;">
                                                        <td align="left"
style="vertical-align:top;font-size:17.33px;color:#37605E;font-family:Arial;font-weight:700;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">Jonathan<span
style="font-family:remialcxesans;font-size:1px;color:#FFFFFF;line-height:1px;">​<span
style="font-family:'template-KDWbeBsYEeiAwgANOhMCUQ';">​</span><span
style="font-family:'zone-1';">​</span><span
style="font-family:'zones-AQ';">​</span></span></p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:top;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;"> </p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:top;font-size:17.33px;color:#37605E;font-family:Arial;font-weight:700;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">Katz</p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:top;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">  </p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:middle;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">IS Senior Specialist, Infrastructure Operations Engineer</p>
                                                        </td>
                                                      </tr>
                                                    </tbody>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr
style="font-size:17.33px;color:#37605E;font-style:normal;font-weight:700;white-space:nowrap;">
                                                <td align="left"
style="padding:0;vertical-align:top;font-family:Arial;">
                                                  <p
style="margin-top:0px;margin-bottom:0px;">AptarGroup</p>
                                                </td>
                                              </tr>
                                              <tr style="font-size:0;">
                                                <td align="left"
style="padding:0;vertical-align:bottom;">
                                                  <table cellpadding="0"
                                                    cellspacing="0"
                                                    border="0"
style="border-collapse:collapse;font-size:0;color:#5F5F5F;font-style:normal;font-weight:400;white-space:nowrap;">
                                                    <tbody>
                                                      <tr
style="font-size:14.67px;">
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">265 Exchange Drive, Suite 100</p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">, </p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">Crystal Lake</p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">, </p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">Illinois</p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;"> </p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">60014</p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">, </p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">United States</p>
                                                        </td>
                                                      </tr>
                                                    </tbody>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr style="font-size:0;">
                                                <td align="left"
style="padding:0;vertical-align:bottom;">
                                                  <table cellpadding="0"
                                                    cellspacing="0"
                                                    border="0"
style="border-collapse:collapse;font-size:0;color:#000001;font-style:normal;font-weight:400;white-space:nowrap;">
                                                    <tbody>
                                                      <tr
style="font-size:14.67px;">
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">(phone) <a
href="tel:+1%20779%20220%204484" target="_blank" id="LPlnk689713"
style="text-decoration:none;color:#000001;" moz-do-not-send="true">+1 779 220 4484</a></p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:middle;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;"> <span
style="color:#37605E;font-size:17.33px;font-weight:700;">| </span></p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;">(mobile) <a
href="tel:+1%20847%20525%208441" target="_blank" id="LPlnk689713"
style="text-decoration:none;color:#000001;" moz-do-not-send="true">+1 847 525 8441</a></p>
                                                        </td>
                                                      </tr>
                                                    </tbody>
                                                  </table>
                                                </td>
                                              </tr>
                                              <tr style="font-size:0;">
                                                <td align="left"
style="padding:0;vertical-align:top;">
                                                  <table cellpadding="0"
                                                    cellspacing="0"
                                                    border="0"
style="border-collapse:collapse;font-size:0;color:#000001;font-style:normal;font-weight:700;white-space:nowrap;">
                                                    <tbody>
                                                      <tr
style="font-size:14.67px;">
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;"><a
href="mailto:jonathan.katz@aptar.com" target="_blank" id="LPlnk689713"
style="text-decoration:none;color:#37605E;" moz-do-not-send="true"><span
style="text-decoration:underline;">jonathan.katz@aptar.com</span></a></p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:middle;font-family:Arial;font-weight:400;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;"> <span
style="font-weight:700;color:#37605E;font-size:17.33px;">| </span></p>
                                                        </td>
                                                        <td align="left"
style="vertical-align:bottom;font-family:Arial;">
                                                          <p
style="margin-top:0px;margin-bottom:0px;"><a
href="http://www.aptar.com/" target="_blank" id="LPlnk689713"
title="www.aptar.com" style="text-decoration:none;color:#37605E;"
moz-do-not-send="true"><span style="text-decoration:underline;">www.aptar.com</span></a></p>
                                                        </td>
                                                      </tr>
                                                    </tbody>
                                                  </table>
                                                </td>
                                              </tr>
                                            </tbody>
                                          </table>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </td>
                              </tr>
                              <tr style="font-size:1.33px;">
                                <td align="left"
style="padding:13px 0 0;vertical-align:top;font-family:Arial;">
                                  <p
style="margin-top:0px;margin-bottom:0px;">AptarOnlineSignature</p>
                                </td>
                              </tr>
                            </tbody>
                          </table>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        -----Original Message-----<br>
        From: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a> <br>
        Sent: Monday, January 27, 2025 6:42 AM<br>
        To: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>;
        Xen-devel <a class="moz-txt-link-rfc2396E" href="mailto:xen-devel@lists.xenproject.org">&lt;xen-devel@lists.xenproject.org&gt;</a><br>
        Cc: Katz, Jonathan <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.katz@aptar.com">&lt;jonathan.katz@aptar.com&gt;</a>; Jan Beulich
        <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>; Roger Pau Monné
        <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a><br>
        Subject: Re: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup
        when virtualised<br>
        <br>
        <br>
        EXTERNAL MAIL: Do not click any links or open any attachments
        unless you trust the sender and know the content is safe.<br>
        <br>
        <br>
        On 21/01/2025 4:57 pm, Oleksii Kurochko wrote:<br>
        &gt;<br>
        &gt; On 1/21/25 3:25 PM, Andrew Cooper wrote:<br>
        &gt;&gt; Logic using performance counters needs to look at <br>
        &gt;&gt; MSR_MISC_ENABLE.PERF_AVAILABLE before touching any
        other resources.<br>
        &gt;&gt;<br>
        &gt;&gt; When virtualised under ESX, Xen dies with a #GP fault
        trying to read <br>
        &gt;&gt; MSR_CORE_PERF_GLOBAL_CTRL.<br>
        &gt;&gt;<br>
        &gt;&gt; Factor this logic out into a separate function (it's
        already too <br>
        &gt;&gt; squashed to the RHS), and insert a check of <br>
        &gt;&gt; MSR_MISC_ENABLE.PERF_AVAILABLE.<br>
        &gt;&gt;<br>
        &gt;&gt; This also limits setting X86_FEATURE_ARCH_PERFMON,
        although oprofile <br>
        &gt;&gt; (the only consumer of this flag) cross-checks too.<br>
        &gt;&gt;<br>
        &gt;&gt; Reported-by: Jonathan Katz
        <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.katz@aptar.com">&lt;jonathan.katz@aptar.com&gt;</a><br>
        &gt;&gt; Link: <br>
        &gt;&gt;
        <a class="moz-txt-link-freetext" href="https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fxcp">https://nam02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fxcp</a><br>
        &gt;&gt;
-ng.org%2Fforum%2Ftopic%2F10286%2Fnesting-xcp-ng-on-esx-8&amp;data=05%7C0<br>
        &gt;&gt;
        2%7Cjonathan.katz%40aptar.com%7Cc036df18462d402eda5608dd3ed01147%7C5f<br>
        &gt;&gt;
        d74a3ed57a410e8d7c02c4df062234%7C0%7C0%7C638735785584484308%7CUnknown<br>
        &gt;&gt;
        %7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW<br>
        &gt;&gt;
4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=jG5dfAjyXvB<br>
        &gt;&gt; JRrtNklKp8MjGOUoYGntpD14eRP5GCcI%3D&amp;reserved=0<br>
        &gt;&gt; Signed-off-by: Andrew Cooper
        <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a><br>
        &gt;&gt; ---<br>
        &gt;&gt; CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a><br>
        &gt;&gt; CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a><br>
        &gt;&gt; CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a><br>
        &gt;&gt;<br>
        &gt;&gt; Untested, but this is the same pattern used by oprofile
        and watchdog <br>
        &gt;&gt; setup.<br>
        &gt;<br>
        &gt; Probably it will make sense to wait for a response on the
        forum (you <br>
        &gt; mentioned in the Link:) that the current one patch works?<br>
        <br>
        It's been a week. At this point it needs to go in for the
        release. As I said, this is exactly the same pattern as used
        elsewhere in Xen, so I'm confident it's a good fix, and Roger
        agrees too.<br>
      </div>
    </blockquote>
    <pre>Based on the test results, it seems everything is okay, so:
R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
    <pre>Thanks.

~ Oleksii
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:SJ0PR04MB83435FE711BB6747C6EA9F90F0EC2@SJ0PR04MB8343.namprd04.prod.outlook.com">
      <div>
        <br>
        ~Andrew<br>
      </div>
      This e-mail may contain confidential information. If you are not
      the intended recipient, please notify the sender immediately and
      destroy this e-mail. Any unauthorized copying, disclosure or
      distribution of the material in this e-mail is strictly forbidden.
      <p><span style="font-size: xx-small;"><span class="SpellE"><em><span
                lang="EN-US">Aptar’s</span></em></span><em><span
              lang="EN-US"> <a
href="https://www.aptar.com/en-us/general-terms-and-conditions-use.html"
                moz-do-not-send="true">Privacy Policy</a> </span></em><em><span
              lang="EN-US">explains how Aptar may use your personal
              information or data and any personal information or data
              provided or made available to us.</span></em></span></p>
    </blockquote>
  </body>
</html>

--------------P5TN0BHlsPahZbI0XV4qJ94N--

