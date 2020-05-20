Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3B1DA87C
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 05:15:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbFBp-0003hi-CK; Wed, 20 May 2020 03:14:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k561=7C=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1jbFBn-0003hc-Fv
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 03:14:39 +0000
X-Inumbo-ID: 07d4c6ac-9a48-11ea-a9b6-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07d4c6ac-9a48-11ea-a9b6-12813bfff9fa;
 Wed, 20 May 2020 03:14:35 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04K3DONp184721;
 Wed, 20 May 2020 03:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=r0Mj3h35rNep7HrpBAQkR3yFk/3ng5I0ex9Pj563aPc=;
 b=Qqwma8C4tLu6y0+lmh5bUDQkQF9E48NhYPAJMmEHRAqpHNZ2xB97ycom3YCKL8Zw7EBZ
 RopgSunRe4C8y9CGfSjBiuMwDUae6H5bUwoPudOUDR7e2vl4pncelXFVcXq7RAj67Uye
 Gy1NQHEZhPmGn14QnwurAlvYqKAqAHe5nl/JjdLCEowSO4Y/ROp2X9LHi82T25f2l1+K
 BcVh/LlQetznVn+4FKa4iNdzakQ5a6SKxMCKjJypEuAAnWtqokY9j8kDQs4HWfS8Xmw+
 l3OdMpjuFYRLAuHoKsMSZmOo8jzvr/gVX6lXfuwSQFcJP/XpGoFATP8zZPTYl0uOtzWO 9A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 3128tngn71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 May 2020 03:14:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04K3DC3M082443;
 Wed, 20 May 2020 03:14:31 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 312sxtwucb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 03:14:31 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04K3ERfG008669;
 Wed, 20 May 2020 03:14:27 GMT
Received: from [10.39.224.138] (/10.39.224.138)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 19 May 2020 20:14:27 -0700
Subject: Re: grant table issues mapping a ring order 10
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com
References: <alpine.DEB.2.21.2005191252040.27502@sstabellini-ThinkPad-T480s>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Autocrypt: addr=boris.ostrovsky@oracle.com; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <6f4c33ad-235b-a7be-b5fd-1a80d339e449@oracle.com>
Date: Tue, 19 May 2020 23:14:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005191252040.27502@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005200026
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 spamscore=0
 clxscore=1015 cotscore=-2147483648 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005200026
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
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/19/20 5:21 PM, Stefano Stabellini wrote:
> Hi Juergen, Boris,
>
> I am trying to increase the size of the rings used for Xen 9pfs
> connections for performance reasons and also to reduce the likehood of
> the backend having to wait on the frontend to free up space from the
> ring.
>
> FYI I realized that we cannot choose order 11 or greater in Linux
> because then we incur into the hard limit CONFIG_FORCE_MAX_ZONEORDER=3D=
11.
> But that is not the reason why I am writing to you :-)
>
>
> The reason why I am writing is that even order 10 fails for some
> grant-table related reason I cannot explain. There are two rings, each
> of them order 10. Mapping the first ring results into an error. (Order =
9
> works fine, resulting in both rings being mapped correctly.)
>
> QEMU tries to map the refs but gets an error:
>
>   gnttab: error: mmap failed: Invalid argument
>   xen be: 9pfs-0: xen be: 9pfs-0: xengnttab_map_domain_grant_refs faile=
d: Invalid argument
>   xengnttab_map_domain_grant_refs failed: Invalid argument
>
> The error comes from Xen. The hypervisor returns GNTST_bad_gntref to
> Linux (drivers/xen/grant-table.c:gnttab_map_refs). Then:
>
>     	if (map->map_ops[i].status) {
> 			err =3D -EINVAL;
> 			continue;
> 		}
>
> So Linux returns -EINVAL to QEMU. The ref seem to be garbage. The
> following printks are in Xen in the implemenation of map_grant_ref:
>
> (XEN) DEBUG map_grant_ref 1017 ref=3D998 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D999 nr=3D2560
> (XEN) DEBUG map_grant_ref 1013 ref=3D2050669706 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0x7a3abc8a for d1
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D19 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1013 ref=3D56423797 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0x35cf575 for d1
> (XEN) DEBUG map_grant_ref 1013 ref=3D348793 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0x55279 for d1
> (XEN) DEBUG map_grant_ref 1013 ref=3D1589921828 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0x5ec44824 for d1
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1013 ref=3D2070386184 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0x7b679608 for d1
> (XEN) DEBUG map_grant_ref 1013 ref=3D3421871 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0x3436af for d1
> (XEN) DEBUG map_grant_ref 1013 ref=3D1589921828 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0x5ec44824 for d1
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1013 ref=3D875999099 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0x3436af7b for d1
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1013 ref=3D2705045486 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0xa13bb7ee for d1
> (XEN) DEBUG map_grant_ref 1013 ref=3D4294967295 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0xffffffff for d1
> (XEN) DEBUG map_grant_ref 1013 ref=3D213291910 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0xcb69386 for d1
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1013 ref=3D4912 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0x1330 for d1
> (XEN) DEBUG map_grant_ref 1013 ref=3D167788925 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0xa00417d for d1
> (XEN) DEBUG map_grant_ref 1017 ref=3D24 nr=3D2560
> (XEN) DEBUG map_grant_ref 1013 ref=3D167788925 nr=3D2560
> (XEN) grant_table.c:1015:d0v0 Bad ref 0xa00417d for d1
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
> (XEN) DEBUG map_grant_ref 1017 ref=3D0 nr=3D2560
>
>
> Full logs https://pastebin.com/QLTUaUGJ
> It is worth mentioning that no limits are being reached: we are below
> 2500 entries per domain and below the 64 pages of grant refs per domain=
=2E
>
> What it seems to happen is that after ref 999, the next refs are garbag=
e.
> Do you have any ideas why?


Y1K? ;-)


Have you tried verifying that entry #1000 is properly initialized?


-boris


>
>
> I tracked the gnttab_expand calls in Dom0 and they seemed to be done
> correctly. We need 5 grant table pages:
>
> - order 10 -> 1024 refs
> - 2 rings -> 2048 refs
> - 512 refs per grant table page -> 4 pages
> - plus few others refs by default -> 5 pages
>
> [    3.896558] DEBUG gnttab_expand 1287 cur=3D1 extra=3D1 max=3D64 rc=3D=
0
> [    5.115189] DEBUG gnttab_expand 1287 cur=3D2 extra=3D1 max=3D64 rc=3D=
0
> [    6.334027] DEBUG gnttab_expand 1287 cur=3D3 extra=3D1 max=3D64 rc=3D=
0
> [    7.350523] DEBUG gnttab_expand 1287 cur=3D4 extra=3D1 max=3D64 rc=3D=
0
>
> As expected gnttab_expand gets called 4 times to add 4 more pages to th=
e
> initial page.
>
>
> Thanks,
>
> Stefano




