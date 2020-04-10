Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 644CD1A44CE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 11:56:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMqOQ-00064P-N5; Fri, 10 Apr 2020 09:56:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jpUU=52=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1jMqOP-00064K-4e
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 09:56:09 +0000
X-Inumbo-ID: 7fb44086-7b11-11ea-b58d-bc764e2007e4
Received: from aserp2120.oracle.com (unknown [141.146.126.78])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fb44086-7b11-11ea-b58d-bc764e2007e4;
 Fri, 10 Apr 2020 09:56:08 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03A9m0PQ019162;
 Fri, 10 Apr 2020 09:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=+j4nVnTBKtnC+KblRX66YHb6IlYtAvRa7OKedO6wFUY=;
 b=n8k8BwVyAZaoxrwteX4mhvLojvFE9ZUqvKNwt1zMTctsor5jugQOkAF/PAA7/PCslOxS
 tf6cRkWb6gaq2FV5AvZqP8gFwqJOReXtF2iU3KTj2fkXtUodavq9RkBpEJdgZfNVor6r
 JfY14be72Wg73Wd2wD7WzNdxINLOcPvCuRIjKQWGclWcqZHSn0OMzldzQLLeA7Mi59uz
 yh/6F+/Sly9WC3OleFcyHPoCP9Ov9+gOtVLHkGQPQ8ICh6NUaAzEDb/whgNlfxv4tZNO
 IMm4zfXsxfCXj+ige65H4YUBDBcP/0T35gmrjTjzOIJhfcu14/l0F9VWEdPQmouPx4SQ NQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 3091m15t4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Apr 2020 09:55:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03A9lUh6037240;
 Fri, 10 Apr 2020 09:55:52 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 3091m6y7tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Apr 2020 09:55:51 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03A9tmBN032589;
 Fri, 10 Apr 2020 09:55:48 GMT
Received: from [10.159.147.187] (/10.159.147.187)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 10 Apr 2020 02:55:47 -0700
Subject: Re: [RFC PATCH 00/26] Runtime paravirt patching
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 x86@kernel.org
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <87k12qawwl.fsf@nanos.tec.linutronix.de>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <c13ce409-790d-18dd-d941-673e9bb797c3@oracle.com>
Date: Fri, 10 Apr 2020 02:55:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87k12qawwl.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9586
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004100081
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9586
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004100081
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 peterz@infradead.org, hpa@zytor.com, virtualization@lists.linux-foundation.org,
 pbonzini@redhat.com, namit@vmware.com, mhiramat@kernel.org,
 jpoimboe@redhat.com, mihai.carabas@oracle.com, bp@alien8.de,
 vkuznets@redhat.com, boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-04-08 7:12 a.m., Thomas Gleixner wrote:
> Ankur Arora <ankur.a.arora@oracle.com> writes:
>> A KVM host (or another hypervisor) might advertise paravirtualized
>> features and optimization hints (ex KVM_HINTS_REALTIME) which might
>> become stale over the lifetime of the guest. For instance, the
>> host might go from being undersubscribed to being oversubscribed
>> (or the other way round) and it would make sense for the guest
>> switch pv-ops based on that.
> 
> If your host changes his advertised behaviour then you want to fix the
> host setup or find a competent admin.
> 
>> This lockorture splat that I saw on the guest while testing this is
>> indicative of the problem:
>>
>>    [ 1136.461522] watchdog: BUG: soft lockup - CPU#8 stuck for 22s! [lock_torture_wr:12865]
>>    [ 1136.461542] CPU: 8 PID: 12865 Comm: lock_torture_wr Tainted: G W L 5.4.0-rc7+ #77
>>    [ 1136.461546] RIP: 0010:native_queued_spin_lock_slowpath+0x15/0x220
>>
>> (Caused by an oversubscribed host but using mismatched native pv_lock_ops
>> on the gues.)
> 
> And this illustrates what? The fact that you used a misconfigured setup.
> 
>> This series addresses the problem by doing paravirt switching at
>> runtime.
> 
> You're not addressing the problem. Your fixing the symptom, which is
> wrong to begin with.
> 
>> The alternative use-case is a runtime version of apply_alternatives()
>> (not posted with this patch-set) that can be used for some safe subset
>> of X86_FEATUREs. This could be useful in conjunction with the ongoing
>> late microcode loading work that Mihai Carabas and others have been
>> working on.
> 
> This has been discussed to death before and there is no safe subset as
> long as this hasn't been resolved:
> 
>    https://lore.kernel.org/lkml/alpine.DEB.2.21.1909062237580.1902@nanos.tec.linutronix.de/
Thanks. I was thinking of fairly limited subset: ex re-evaluate
X86_FEATURE_ALWAYS to make sure static_cpu_has() reflects reality
but I guess that has second order effects here.

Ankur

> 
> Thanks,
> 
>          tglx
> 

