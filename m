Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4794E1A447C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2020 11:33:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMq1q-0004Mn-LH; Fri, 10 Apr 2020 09:32:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jpUU=52=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1jMq1o-0004Mi-MZ
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2020 09:32:48 +0000
X-Inumbo-ID: 3d14a1ba-7b0e-11ea-83d0-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d14a1ba-7b0e-11ea-83d0-12813bfff9fa;
 Fri, 10 Apr 2020 09:32:47 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03A9JBhs020013;
 Fri, 10 Apr 2020 09:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Ums9rtORUoERTp+Sz6iCrEwniL6ascuI/F+Lp1A7/ic=;
 b=CZPq7nfVZcUVlHkIyoJG8scMCIvrBwYLJGNHvjq7v7oPL6CeT692fSrNnI3a4cf/2e2/
 nkiSWISFGfNfUKL1jJCEDin+hLjlnDcSskNlcamFKBCl3E3EJGlVIKWIEhv/4qsgwDtL
 j0SkHd0SRWkTW2Xr8PzQay6ZKoNzIOe/DhrEgcQSSlN4Ri9e0Ywr7iez/9bs1ZJ9yuWV
 jKMAq3d4a8bRDkcHjJYenh75w9qAjdW6WNPuABHlRvA4vmkyyopbQ6HjFngr6TmWNIT5
 F3HZC1+Rwh+W6OyNrHVRY97Gk7P+WeUmZenQutNR7hRUy4/u/W/+hZoa5pDcDvJCtHDn IA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 309gw4hmbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Apr 2020 09:32:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03A9HUTx162777;
 Fri, 10 Apr 2020 09:32:39 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 3091m6wc8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Apr 2020 09:32:39 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03A9WbL9024236;
 Fri, 10 Apr 2020 09:32:37 GMT
Received: from [10.159.147.187] (/10.159.147.187)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 10 Apr 2020 02:32:37 -0700
Subject: Re: [RFC PATCH 00/26] Runtime paravirt patching
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <d7f8bff3-526a-6a84-2e81-677cfbac0111@suse.com>
From: Ankur Arora <ankur.a.arora@oracle.com>
Message-ID: <37d755a7-8fc9-8cc8-5627-027a8479b6c7@oracle.com>
Date: Fri, 10 Apr 2020 02:32:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d7f8bff3-526a-6a84-2e81-677cfbac0111@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9586
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004100078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9586
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004100078
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
Cc: xen-devel@lists.xenproject.org, kvm@vger.kernel.org, peterz@infradead.org,
 hpa@zytor.com, virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 bp@alien8.de, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, namit@vmware.com, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-04-08 5:28 a.m., Jürgen Groß wrote:
> On 08.04.20 07:02, Ankur Arora wrote:
[ snip ]
> 
> Quite a lot of code churn and hacks for a problem which should not
> occur on a well administrated machine.
Yeah, I agree the patch set is pretty large and clearly the NMI or
the stop_machine() are completely out. That said, as I wrote in my
other mail I think the problem is still worth solving.

> Especially the NMI dependencies make me not wanting to Ack this series.
The NMI solution did turn out to be pretty ugly.

I was using it to solve two problems: avoid a deadlock where an NMI handler
could use a lock while the stop_machine() thread is trying to rewrite the
corresponding call-sites. And, needed to ensure that we don't lock
and unlock using mismatched primitives.


Thanks
Ankur

> 
> 
> Juergen

