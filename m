Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAGwAWDNoWn3wQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 17:59:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C451BB1D5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 17:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242968.1543061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw1AC-0003b4-Jt; Fri, 27 Feb 2026 16:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242968.1543061; Fri, 27 Feb 2026 16:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vw1AC-0003Y6-Gw; Fri, 27 Feb 2026 16:58:04 +0000
Received: by outflank-mailman (input) for mailman id 1242968;
 Fri, 27 Feb 2026 16:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t/s7=A7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vw1AA-0003Y0-JB
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 16:58:02 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 796c37ef-13fd-11f1-b164-2bf370ae4941;
 Fri, 27 Feb 2026 17:58:01 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so2203762f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 08:58:01 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70e8e8sm7710937f8f.10.2026.02.27.08.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 08:57:58 -0800 (PST)
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
X-Inumbo-ID: 796c37ef-13fd-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772211480; x=1772816280; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrmgrbPcMJ4Di3/QQ9JT4CgZ0pcrVSrsfpDaAhlwMnQ=;
        b=XxgpqNM9myj8XWCIaCaC6kD1fvccN3UWdMEYVhAG5fbFkJZpt4ZSGex/IQuOtx4WfB
         lh9MyV8cm2OR8gdXXFaPm400+ev+zsWzW05XSNKiR8M8g7GcqDd3KvvfbnImRcZogjW3
         6w1kkUs6vcdFgmeHWak93W87kCYCXGwJuLtm/sIu+fAHdsLplMhMdmbZwfc+oW5xw/so
         bFjaq8JkqDnas8JYq7QFFaVS/D/v5TE/vCOgtm9E81BdQErbrLIMkM9z++9/m+qHahW3
         HYwg4DRoi0V8nwStHbG7gtBtdTbiWRN+vMmO5FOImUJc2ux1rl/ehqskxP6ucQVCV/Wy
         St7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772211480; x=1772816280;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WrmgrbPcMJ4Di3/QQ9JT4CgZ0pcrVSrsfpDaAhlwMnQ=;
        b=ip6iXyTm5FmqHnDzAPSPsldHhADtGXafPwj1n1Mx6TPok7gGxx2XgSM0EAitchgzOx
         2VUNr/ktBftW6xSt0quXXMtzAkJgXC1SkSX+Qe0lGstsLAsUw8ASfASP9CEbFRgsssBq
         sA2e5Qc8Yp9U/UZPyI4QVCp3cc3y/Yn1/ZFKf6RlEB4HcC+L3/2dikewvk3EwpeQ/Esk
         lOdONNZwGoeM24LTfxBkECSeFWJ0Qw16Xz+K9v/LqYDO+zLtpaj6GU00AYBHZKAm66PR
         eNGNthXpl78R64v/LABmcbEmMBeas1DwkPnFYmKcfHUXMmUzgxF83hFcwNIu6dC+2l44
         NlXQ==
X-Gm-Message-State: AOJu0YyzbykGbAUodPuc8sykG1Bk9458RT6ej7Fb/FrS+KXPDyREV7ce
	K4+n66dVHW0lwHffbMA/A2jzL/bOGAtX7QiICMwTzSP90/Zl9j+25XA4qPDdtQ==
X-Gm-Gg: ATEYQzwmIMFJC4lbirW09PJL2hW0lGvTFmyCKJW+pUoW6ZOGvEE+nNq+J6RyfrLsnzZ
	Urp2mPRScmgZCmLZnoRyDDZVu5yn3f63F717qEici9PAkl2vQQqSO3M0fgYvy2TENa38I9aPc5T
	51ZmvFqkQAH5H5TvlFD/eXFOzGwX+G4wNLLcZEmXhN7fo/HfAe7qtNGjWZ7ihAN2tksxHA3e0Kh
	FaEOKUSrYgYg4BGmBiuQveAzJ+1yZ/2Si7JGd5QFkz7ElfeZxxZvZSi6VfNcuLZLzHTWZojg9Vv
	MDjwR1sPU567Veqyhfrx62QYZekdn5Wz6PwsDjZ+qdAYkLn3bBf5AQAYgD1dCY45HcqYErKSjMQ
	SqVgqgpGyKA/K5d3GePYsshjs8gYI/ggaScW0I7JVcuG9InCnArzuwN++AGCKDWQdYmb/xlAQNp
	/9WkeS+wmWC6r10R2rBDYiRk3Q/+JwrgVwZE4i+iz//QCGnqnKW696pfwUqejFl+5+qGMAO4bSF
	hE=
X-Received: by 2002:a05:6000:220f:b0:430:2773:84d6 with SMTP id ffacd0b85a97d-4399d9bece3mr6447651f8f.24.1772211478967;
        Fri, 27 Feb 2026 08:57:58 -0800 (PST)
Message-ID: <19c77389-c22f-4501-8ac4-326d42129d2d@gmail.com>
Date: Fri, 27 Feb 2026 17:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Xen 4.22 release schedule proposal
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:committers@xenproject.org,m:community.manager@xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 95C451BB1D5
X-Rspamd-Action: no action

Hello everyone,

I missed that I've not sent 4.22 schedule proposal and it was all the time
in my Drafts folder. Sorry for that.

Following the 8-month release cycle, also taking into account that 4.21
has been released 19th of November 2025, the next "good" month for release
should be July according to:
   https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html

Here is suggested schedule:

** Proposed option: Wed Jul 15, 2026 **
   (~ +8 months from Xen 4.21 release)

- Last posting date          Fri Apr 17, 2026 (+7 weeks from now)

Patches adding new features are expected to be posted to the mailing
list by this date, although perhaps not in their final version.

- Feature freeze             Fri May 08, 2026 (+3 weeks from Last posting date)

Patches adding new features should be committed by this date.
Straightforward bugfixes may continue to be accepted by maintainers.

- Code freeze                Fri Jun 05, 2026 (+4 weeks from Feature freeze)

Bugfixes only.

- Hard code freeze           Fri Jun 26, 2026 (+3 weeks from Code freeze)

Bugfixes for serious bugs (including regressions), and low-risk fixes only.

- Final commits              Fri Jul 10, 2026 (+2 weeks from Hard code freeze)

Branch off staging-4.22.

- Release                    Wed Jul 15, 2026


Please don't hesitate to provide your feedback.

If there are no objections, I plan to update the Wiki page
Xen_Project_X.YY_Release_Notes to make it easier to find our final schedule
( especially for the people who aren't following xen-devel mailing list ).
As an additional benefit, it will also be accessible via SUPPORT.md (in the
wiki athttps://xenbits.xen.org/docs/unstable-staging/support-matrix.html).

Thanks and have a good weekend.

Best regards,
   Oleksii


