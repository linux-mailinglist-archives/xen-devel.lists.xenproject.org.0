Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rYHkMN7ZLmru4gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2026 18:42:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D4E6818AB
	for <lists+xen-devel@lfdr.de>; Sun, 14 Jun 2026 18:42:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MbTuFpJh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z1YDgLSK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=qualcomm.com
Received: from list by lists.xenproject.org with outflank-mailman.1337827.1598992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYntF-0002KZ-F5; Sun, 14 Jun 2026 16:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337827.1598992; Sun, 14 Jun 2026 16:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYntF-0002Hp-8n; Sun, 14 Jun 2026 16:40:53 +0000
Received: by outflank-mailman (input) for mailman id 1337827;
 Sun, 14 Jun 2026 16:40:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <philmd@oss.qualcomm.com>) id 1wYntE-0002Hj-3o
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2026 16:40:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYntD-00FKlb-07
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2026 18:40:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2ed97e-5cb7-0a2a0a5109dd-0a2a4506c840-40
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2026 18:40:50 +0200
Received: from [205.220.168.131] (helo=mx0a-0031df01.pphosted.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <philmd@oss.qualcomm.com>)
 id 6a2ed990-7371-0a2a45060019-cddca8832c58-3
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2026 18:40:50 +0200
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65EGHStr1595459
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2026 16:40:48 GMT
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9fc3b8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2026 16:40:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-91598af506cso260369085a.0
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2026 09:40:47 -0700 (PDT)
Received: from [192.168.69.214] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f4f6sm28076640f8f.16.2026.06.14.09.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 09:40:45 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrsAEgadN0S0zN/zXy5uAvi55/YRwQF57zY8ovGr9xI=; b=MbTuFpJh6jb0MMKu
	PpNj/HfcZVOTTwpu/LZ/ATc3vaSEc1dou7maDfbbGLacr89U2cBQ2jA3tFTZiq//
	a/lDEnnRPWKgbpVc5YaqE8EIxoLXxufK/XyWnKHvySyK6REQVEc/XTJCw6U+45Ek
	Gk0s24gSpaCU3eJt2eD5S2vSVyXk5+Wbg2wXA6eIGLo8rAlUby5AVqdxNCj1KIcz
	HbZylIiHGLkKCr0caevfF+uMvcv2Y3BxTQ0t4DJmco4SWgTs0xK1Z4IQSBs3rFFQ
	j6N5/Ru2nquEsB5ZP7LKSW8to6u1bnKdWDuyU25Dm88gHpza0ippkNwGNUUlnt/5
	yEwUFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781455247; x=1782060047; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrsAEgadN0S0zN/zXy5uAvi55/YRwQF57zY8ovGr9xI=;
        b=Z1YDgLSKRh7MT7Z/8rhL8RbCSkVQxvHPBdaJuicoj5mnDjMZYVPsItM800Qchg3/EK
         UN2vLCp3mfxiJpEJi5sNAZGSFQafFAMaQhz2tZ1IVxPFojbqqFFohj4V0oaqPXk4N2hy
         f9jJcYg0Oq9blDDxZCCsioDHODLdgUg2Q4Pb3TIH/17CQm3fHDIiAAA9wPjZWAb6oPo+
         GwMheGd3zBdRrAzZM+Q37rfU1+NsGy5eTask89TFywRcz30calEP7/yq7O5WJ+AUPD6g
         viENLda2xKkeZSr5+V8GcbaoidAKl6saF8xJ7ZE5iqAi5rblFlW15sJUYyxxcrbULCO1
         FXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781455247; x=1782060047;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrsAEgadN0S0zN/zXy5uAvi55/YRwQF57zY8ovGr9xI=;
        b=Xes+mCpBSGmJhSMHmUN9dtpUDABNgkftoE3vd/nLvXnO/XiSkQVlXEK2KOcoZnGtcN
         XJLsNr4xwooIWUKyvJFLL1xUPVaCcLCOxG5k7yytwAqxAso37t4oGPtirviaKI+d23mR
         PHfNPv7to0coFZAd+TGMdKnhLUozt2UA98kCCpGoz4Tvp9HHyuNnIvFHMUwbJKILFp6O
         XLrDc/PvfM7Rv/DZHzk9HLL/tbFt1MWiGA4MkJRKhz9Mqi3ZWRE6RGFk/DHs2GBs6yfc
         wj0pjmTklYCpiSQAURiaEaLcK/rmRVrUUgSWiW/Po567C7Ro9libbREL4tFV8XQNO1Tx
         h1pQ==
X-Forwarded-Encrypted: i=1; AFNElJ9I1fIv0i5fbX8e3ZsE86yYLvfFJUtD5RPJ7F5q91Kjf0L9V8FSD4PLQJCby/Ue69NSV7mbRx26PP0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzduBaY9W1tKlk7W8z9s1I30yHOcwq7I6V4wx8Hjb6zpysM2xwd
	cVq5ZPtoKAf5vFxuQh1HXtjGd9ZmqXnXjV0Umje7WI6260TT/aHIY/6RfaN60TnEtkkL830iWzA
	9AGYLJoQUsJo9Ee+qhJc5hc4WGSF0YU0eyI1eH2LXaJh+rlOFmo5f2NYsiELjh2VLmcqP6Q==
X-Gm-Gg: Acq92OG4QicV2+hPpXCMYD5LkU0uXhgIMknjkZcpQf5ckZCetawfyL3k0GqXvWOWXNp
	cax1RpnKwKI8x/d4t/nmvQOG0hGFsC8n53HWIRVdqXzb4OfP0BHbSvI8l60iUJ+ljGM8zfR3X0G
	usISRykwgIq3tkJ5ghcjP6Epyx+wwfIkTt/nr5YeFac6fdQw6WSUiWereaptYhwzQQuSObvhCtn
	Q5WMr5DH7m2ZA8GXHZHD1zn394pBNqMtVhZ3tQ97CZc+lNuY3OA1g1iHjsQ0tGXfuc/U7t9YAFv
	kubPcEwLasASGHQvxwCEmftt+qAu1r14yXQddlk6kiaMh7vMvO7kJ2KpWzHaRH9Ri+Q3Q5Au3J0
	vvqwg1S+Vdg5iVJEB7adECDsvvW6F5zYh7e1ktrg6zyWN41/fMG+z/6Kx2EjVcUCdtRNO3MDG
X-Received: by 2002:a05:620a:bd3:b0:8f1:5e8f:fff3 with SMTP id af79cd13be357-9161bd220cfmr1647977085a.26.1781455246654;
        Sun, 14 Jun 2026 09:40:46 -0700 (PDT)
X-Received: by 2002:a05:620a:bd3:b0:8f1:5e8f:fff3 with SMTP id af79cd13be357-9161bd220cfmr1647973985a.26.1781455246035;
        Sun, 14 Jun 2026 09:40:46 -0700 (PDT)
Message-ID: <c15fb219-8769-4786-9749-d75ce686c4f8@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 18:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hw/xen/interface: Remove pre-C99 checks
To: Bastian Blank <bblank@thinkmo.de>, xen-devel@lists.xenproject.org,
        qemu-devel@nongnu.org
References: <20260613175151.1357-1-philmd@oss.qualcomm.com>
 <20260613175151.1357-2-philmd@oss.qualcomm.com>
 <xuuzvpxooyhkbqluaxszcizjxrqzjczejhdqiso6q2mc4cnhjl@kszikmaagunj>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <xuuzvpxooyhkbqluaxszcizjxrqzjczejhdqiso6q2mc4cnhjl@kszikmaagunj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDE3NCBTYWx0ZWRfX03QWEQp8+zBt
 5iYKUv6vjFRXUh/wcdRKCsQ9TqFmatlwxVOJFfgexix9Oeylfm9jRmMV51CH/Er63ew9xhMcI8w
 GtRCERMgT3eAkCgw2QEDn9pe19TDlT9kkmmxdRqPrknx5vs6kIrgJGtooyrlJ4apalwJ0I7ruSA
 Boc8nFkof5VFDZjHoGhgceHmKUHLmyiHcY+/LAJRSleDwYtIy8dCnDhWocKxFcUV4JZveuouHja
 8JrHtSYemJrtHgiIx+X8Pe/eR872lYrSAd/vPRosd71aGdrJcbg20xyFm4ESg4JN9kKRZ5kXuT1
 Hrs/zNkXTVcOHzxEy/U07lNYbHkDmGHMOlaGTaQgKkwrsrZlKtD5bjvaPa6BYzvThVDotln9RHT
 3jWLTm2j8Jpu+TZ0nEU5Njvr7BKl7xqZz95Nkr5o2v2LT8vtTH/UL49exeAPUw5H44F+lmoVN3J
 DtmttTKYsj2VMr9NA2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDE3NCBTYWx0ZWRfX78SHERpFOouC
 V7l+xDOgE8fNHXK07FwGkQZXbWzjXsxWwrGlH1zLtlYRm4IxsnsIndqph3OmloBfkn6J9wsoMey
 xNexBeck06H9YSQVSM/WEl2fm7BwxxM=
X-Proofpoint-GUID: Xemgmqhk3Pk7AHw874yURkFXG9OBJFYD
X-Proofpoint-ORIG-GUID: Xemgmqhk3Pk7AHw874yURkFXG9OBJFYD
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2ed98f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=mDV3o1hIAAAA:8 a=bxkv4MIWnuf4gb2VlVAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_03,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140174
X-purgate-ID: tlsNG-16d1c6/1781455250-8757ED75-994E635E/0/0
X-purgate-type: clean
X-purgate-size: 647
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bblank@thinkmo.de,m:xen-devel@lists.xenproject.org,m:qemu-devel@nongnu.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[philmd@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[philmd@oss.qualcomm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22D4E6818AB

On 13/6/26 20:13, Bastian Blank wrote:
> On Sat, Jun 13, 2026 at 07:51:50PM +0200, Philippe Mathieu-Daudé wrote:
>> We mandate a compiler supporting C99 since 2019-01-17 in
>> commit 7be41675f7c ("configure: Force the C standard to gnu99"),
>> thus supporting flexible array members. Remove what is now dead
>> code.
> 
>> +    uint32_t optarr[0];
> 
> This is no flexible array member. "optarr[]" would be.

Oops yes you are right... This is what we want here.

> 
> https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Flexible-Array-Fields.html
> 
> Or are you talking about something different?
> 
> Bastian
> 


