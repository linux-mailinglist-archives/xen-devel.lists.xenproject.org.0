Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113E28794D1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691851.1078330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1tP-0004En-4v; Tue, 12 Mar 2024 13:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691851.1078330; Tue, 12 Mar 2024 13:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1tP-0004BJ-1V; Tue, 12 Mar 2024 13:10:07 +0000
Received: by outflank-mailman (input) for mailman id 691851;
 Tue, 12 Mar 2024 13:10:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MaOv=KS=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rk1tN-0003A9-8Y
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:10:05 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7631c8c-e071-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 14:10:04 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5135486cfccso5221192e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 06:10:04 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a05600c1d8800b004122b7a680dsm12630740wms.21.2024.03.12.06.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 06:10:03 -0700 (PDT)
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
X-Inumbo-ID: d7631c8c-e071-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710249004; x=1710853804; darn=lists.xenproject.org;
        h=in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5Jpe3Etc2AopDApY4Bu83ODPEnzKL7QHyJBGT/EWZY=;
        b=XV1WYGTZS4Ea07KCEBkeuTegfH6NysCFDcr5RBO27/Z/g853SI3oBd/DOBl2SMJSYd
         lUsHOdPEw58ogbPO4rXcy0CblFegDVL385Ilwx70YAfXLjQx7VlPsAC0gTPkKtwqyL0E
         NUIlPmCSM/+3WFQLQViaPaqPqtFq65StO7+/NzGla6VKS4i+7qjwojb4dPWgLry6LMx8
         NeLss50QvETI0tsnjoR2cegalTDc1tAnNfhsjlf/QIdjBWcK1HBy/mnJSGUlI55Da34N
         1fsjNmFyTt00kH/spY+67BWTWVK//3day6TsXp0yJ9IGRJDjlDy9Pc+9w9UI4kyggyI4
         ljQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710249004; x=1710853804;
        h=in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D5Jpe3Etc2AopDApY4Bu83ODPEnzKL7QHyJBGT/EWZY=;
        b=SwTtZElw5kBvJ4NKNHsVDf10mrZ9c/xR7JXgGCH2jm2ClgkLrnAO8Ji9fCYGMPLyfy
         zI7uH5GiCMvmTvZgB0PcXMnZtuAQrVa0RzDPj/GRP7buPao/25CJj3jUXWH+jymRO/4+
         44AobRHJ3VfCJ+6p4cp5UTg8t5MZm82HMVKgRcciIsw0HjGCyXBhxsWjcTRmddMafKP9
         4jVKarGLfKpSfNCoHsBxxf+pTBEHJcIC1Xs2Lbhnfa3qFD0LasV99awFQsultc6sKRPY
         bkqT2SR+3XQlbT3yidtXbfYDgo74z7/RKdEF3rnetVtNFrZHgL+vEcI5A6w9KQQK9d3Q
         U8iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUk8A0Ikzz5aNJtuIq62zrMH5jxyC+SCIK67XKbH2EMz+mop4MY7JH//EBAal8KG5qDhF+WS7zKznNcjh83qUpunB2WuI9wfKyb1oIz0E=
X-Gm-Message-State: AOJu0YyxHaUWh4eP36CK+Wx5Ki4B99LcAQRsVo+cthrbhzZMaOyNS6Vm
	tIGc3ojmuasBQEF8oMJG7TGDl7nsYcPazD3UU+RB4jqGTt4A8D7ZCuskmfzHEtLl4SG8qOTiHfl
	2
X-Google-Smtp-Source: AGHT+IH0xvVOOIMPgUmcmGCACV/mWPshDZr/SUpR/Y0Dom0W14EqeIodHlqwpDHvMjtzLo4kAdyiCg==
X-Received: by 2002:a19:f809:0:b0:512:a9b7:c637 with SMTP id a9-20020a19f809000000b00512a9b7c637mr6217839lff.29.1710249003828;
        Tue, 12 Mar 2024 06:10:03 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------K9LlK4neQ0MF6IEXhimBH0bQ"
Message-ID: <644eda4c-ca1b-4a1b-bd13-c847df2f4c8e@suse.com>
Date: Tue, 12 Mar 2024 14:10:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.7-rc1+: WARNING at drivers/xen/evtchn.c:167
 evtchn_interrupt
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <ZWf0sWey05VnpH7X@mail-itl>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <ZWf0sWey05VnpH7X@mail-itl>

This is a multi-part message in MIME format.
--------------K9LlK4neQ0MF6IEXhimBH0bQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.11.23 03:34, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> While testing 6.7-rc3 on Qubes OS I found several warning like in the
> subject in dom0 log. I see them when running 6.7-rc1 too. I'm not sure
> what exactly triggers the issue, but my guess would be unbinding an
> event channel from userspace (closing vchan connection).
> 
> Specific message:
> 
> [   83.973377] ------------[ cut here ]------------
> [   83.975523] Interrupt for port 77, but apparently not enabled; per-user 00000000a0e9f1d1

Finally I think I have a fix (thanks to Demi for finding the problematic patch
through bisecting).

Could you please try the attached patch? It is based on current upstream, but
I think it should apply to 6.7 or stable 6.6, too.


Juergen

--------------K9LlK4neQ0MF6IEXhimBH0bQ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-evtchn-avoid-WARN-when-unbinding-an-event-channe.patch"
Content-Disposition: attachment;
 filename*0="0001-xen-evtchn-avoid-WARN-when-unbinding-an-event-channe.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA5ZDY3M2MzN2IyZDBjOWFhMjc0YzUzZjYxOWM0ZTllNDNhNDE5ZjQxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
ClRvOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CkNjOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVu
a29AZXBhbS5jb20+CkNjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKRGF0ZTog
VHVlLCAxMiBNYXIgMjAyNCAxMzo1MjoyNCArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIHhlbi9l
dnRjaG46IGF2b2lkIFdBUk4oKSB3aGVuIHVuYmluZGluZyBhbiBldmVudCBjaGFubmVsCgpX
aGVuIHVuYmluZGluZyBhIHVzZXIgZXZlbnQgY2hhbm5lbCwgdGhlIHJlbGF0ZWQgaGFuZGxl
ciBtaWdodCBiZQpjYWxsZWQgYSBsYXN0IHRpbWUgaW4gY2FzZSB0aGUga2VybmVsIHdhcyBi
dWlsdCB3aXRoCkNPTkZJR19ERUJVR19TSElSUS4gVGhpcyBtaWdodCBjYXVzZSBhIFdBUk4o
KSBpbiB0aGUgaGFuZGxlci4KCkF2b2lkIHRoYXQgYnkgYWRkaW5nIGFuICJ1bmJpbmRpbmci
IGZsYWcgdG8gc3RydWN0IHVzZXJfZXZlbnQgd2hpY2gKd2lsbCBzaG9ydCBjaXJjdWl0IHRo
ZSBoYW5kbGVyLgoKRml4ZXM6IDllOTBlNThjMTFiNyAoInhlbjogZXZ0Y2huOiBBbGxvdyBz
aGFyZWQgcmVnaXN0cmF0aW9uIG9mIElSUSBoYW5kZXJzIikKU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMveGVuL2V2dGNobi5j
IHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3hlbi9ldnRjaG4uYyBiL2RyaXZlcnMveGVuL2V2dGNobi5jCmluZGV4
IDU5NzE3NjI4Y2E0Mi4uZjZhMjIxNmMyYzg3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9l
dnRjaG4uYworKysgYi9kcml2ZXJzL3hlbi9ldnRjaG4uYwpAQCAtODUsNiArODUsNyBAQCBz
dHJ1Y3QgdXNlcl9ldnRjaG4gewogCXN0cnVjdCBwZXJfdXNlcl9kYXRhICp1c2VyOwogCWV2
dGNobl9wb3J0X3QgcG9ydDsKIAlib29sIGVuYWJsZWQ7CisJYm9vbCB1bmJpbmRpbmc7CiB9
OwogCiBzdGF0aWMgdm9pZCBldnRjaG5fZnJlZV9yaW5nKGV2dGNobl9wb3J0X3QgKnJpbmcp
CkBAIC0xNjQsNiArMTY1LDEwIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBldnRjaG5faW50ZXJy
dXB0KGludCBpcnEsIHZvaWQgKmRhdGEpCiAJc3RydWN0IHBlcl91c2VyX2RhdGEgKnUgPSBl
dnRjaG4tPnVzZXI7CiAJdW5zaWduZWQgaW50IHByb2QsIGNvbnM7CiAKKwkvKiBIYW5kbGVy
IG1pZ2h0IGJlIGNhbGxlZCB3aGVuIHRlYXJpbmcgZG93biB0aGUgSVJRLiAqLworCWlmIChl
dnRjaG4tPnVuYmluZGluZykKKwkJcmV0dXJuIElSUV9IQU5ETEVEOworCiAJV0FSTighZXZ0
Y2huLT5lbmFibGVkLAogCSAgICAgIkludGVycnVwdCBmb3IgcG9ydCAldSwgYnV0IGFwcGFy
ZW50bHkgbm90IGVuYWJsZWQ7IHBlci11c2VyICVwXG4iLAogCSAgICAgZXZ0Y2huLT5wb3J0
LCB1KTsKQEAgLTQyMSw2ICs0MjYsNyBAQCBzdGF0aWMgdm9pZCBldnRjaG5fdW5iaW5kX2Zy
b21fdXNlcihzdHJ1Y3QgcGVyX3VzZXJfZGF0YSAqdSwKIAogCUJVR19PTihpcnEgPCAwKTsK
IAorCWV2dGNobi0+dW5iaW5kaW5nID0gdHJ1ZTsKIAl1bmJpbmRfZnJvbV9pcnFoYW5kbGVy
KGlycSwgZXZ0Y2huKTsKIAogCWRlbF9ldnRjaG4odSwgZXZ0Y2huKTsKLS0gCjIuMzUuMwoK


--------------K9LlK4neQ0MF6IEXhimBH0bQ--

