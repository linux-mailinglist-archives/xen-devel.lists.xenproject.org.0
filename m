Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A074B2458FF
	for <lists+xen-devel@lfdr.de>; Sun, 16 Aug 2020 20:39:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7NX5-0003zM-SI; Sun, 16 Aug 2020 18:37:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0ll=B2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1k7NX4-0003zH-Jv
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2020 18:37:26 +0000
X-Inumbo-ID: d4a32149-9953-4ca3-90a3-9e4c1d5fde5a
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4a32149-9953-4ca3-90a3-9e4c1d5fde5a;
 Sun, 16 Aug 2020 18:37:24 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07GIXSLr158492;
 Sun, 16 Aug 2020 18:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=jTisxmMW221i9uwzgGnNkEi3iqqT2NXxak80B/qENrA=;
 b=sEKdEuQJVgZ1jVNWmab0eVw8KyyZmSG7h+DvPJzU5xMAzTyi+iXYlRLEbrDE5TPRa+p3
 Fgvz+QUNcbrJsRJ5sL9+vR0bpFEqcBr1Pp62yYsufsHbOjyYZn4RSrOlNpBLwHpK4+o5
 VY0mV8C1DU6QiYGq5fAFxv7e7uF/YQBQrEKvFPCMwnRic9X8mO96doyEKqK94uUOU9K6
 wW2FC5j+aImUZw9sqCik2LO6H5nnDpQyV9wlDOkMwyjoq22vNZtyCeEzrf2QfCGejj34
 FO1mSbICEkbX1lM2VHJZo2oSZDnimnk4yo7ZdSBuTG5afXO1/3JD3T8uRh0yHgIfwozx Vg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 32x8bmudac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 16 Aug 2020 18:37:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07GIXweC152229;
 Sun, 16 Aug 2020 18:37:06 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 32xsfp6wdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 16 Aug 2020 18:37:06 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07GIb4C6020787;
 Sun, 16 Aug 2020 18:37:04 GMT
Received: from [10.74.109.130] (/10.74.109.130)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 16 Aug 2020 11:37:04 -0700
Subject: Re: [PATCH v4 1/6] x86/paravirt: remove 32-bit support from
 PARAVIRT_XXL
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20200815100641.26362-1-jgross@suse.com>
 <20200815100641.26362-2-jgross@suse.com>
From: boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <207102f2-7938-3d2c-fd05-ea4b157f9dfc@oracle.com>
Date: Sun, 16 Aug 2020 14:37:00 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815100641.26362-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9715
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008160153
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9715
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008160153
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


On 8/15/20 6:06 AM, Juergen Gross wrote:
> The last 32-bit user of stuff under CONFIG_PARAVIRT_XXL is gone.
>
> Remove 32-bit specific parts.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


Reviewed-by: Boris Ostrovsky <bortis.ostrovsky@oracle.com>


(There is another '#ifdef CONFIG_X86_64' in paravirt.h, at the bottom,
that can be removed as well)



