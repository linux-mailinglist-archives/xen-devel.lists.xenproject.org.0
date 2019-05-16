Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B46FD202B6
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 11:39:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRCof-0008Me-8N; Thu, 16 May 2019 09:36:45 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.169])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <daniel.kiper@oracle.com>) id 1hRCod-0008MZ-NW
 for xen-devel@lists.xensource.com; Thu, 16 May 2019 09:36:43 +0000
Received: from [46.226.53.52] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-c.eu-west-1.aws.symcld.net id FD/C4-25548-B2F2DDC5;
 Thu, 16 May 2019 09:36:43 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-6.tower-304.messagelabs.com: domain of oracle.com designates 
 141.146.126.79 as permitted sender) smtp.mailfrom=oracle.com; dkim=pass 
 (good signature) header.i=@oracle.com header.s=corp-2018-07-02; 
 dmarc=pass (p=none adkim=r aspf=r) header.from=oracle.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRWlGSWpSXmKPExsXSO6nOX1dL/26
 Mwf312hb3prxnd2D02N63iz2AMYo1My8pvyKBNeP5+xksBTdZKn7f3sbWwPiIuYuRi0NIYAWj
 xKpFbxlBHBaBmywSEx/ugsq8YpSYuqANoWxe9yZWCOc1o8S2rXOZIJyNjBJvvs1ng3B6GSWub
 1sD1MMJNE1V4vPNk+wgNpuAjsTFLw+BbA4OEQE1ia6VPiD1zALTmCQm9C0BqxEWcJXoPT4ZzO
 YVcJI4e/0oI4gtJFAp8fj0G0aIuKDEyZlPWEBsZgEtiRv/XjKBzGQWkJZY/o8DJMwJ1Hrx6R+
 wE0QFVCQ6l84BK5cQCJWYM3Ud2J0SAhOYJFp37GTDlLjKJHHn4jKWCYzis5Dsm4Vk3yyEfQsY
 mVcxWiQVZaZnlOQmZuboGhoY6BoaGukaGYCwgV5ilW6yXmqpbnlqcYmuoV5iebFecWVuck6KX
 l5qySZGYMylFJw6sYNxzor0Q4ySHExKoryxh+7ECPEl5adUZiQWZ8QXleakFh9i1ODgENi8dv
 UFRimWvPy8VCUJ3k69uzFCgkWp6akVaZk5wKQAUyrBwaMkwlsIkuYtLkjMLc5Mh0idYjTmmHH
 /2Vxmjoetn+cyC4FNkhLntQIpFQApzSjNgxsES1aXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMw
 KgnzPgCZwpOZVwK3D5h+gD4S4bXMvAVySkkiQkqqgfHi9elnWBIm7Ih9YBG1gtPkJmffnh+af
 /v9hQ77L2vMZN/durp3rrPXMvVEocCPOYrHmZ7qPm7f5XM/bZG+nLW5l+KEXQda10fxHQ/4EP
 I06lbksfU9v+cffOMn4bv2jWpHu93ciIb/zGUnba8dKXpYx53p0O8aWdUmtOTVPrffi2ylEg1
 zlyqxFGckGmoxFxUnAgDPeuxLUQMAAA==
X-Env-Sender: daniel.kiper@oracle.com
X-Msg-Ref: server-6.tower-304.messagelabs.com!1557999400!8975354!1
X-Originating-IP: [141.146.126.79]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: , UNPARSEABLE_RELAY
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23676 invoked from network); 16 May 2019 09:36:42 -0000
Received: from aserp2130.oracle.com (HELO aserp2130.oracle.com)
 (141.146.126.79)
 by server-6.tower-304.messagelabs.com with AES256-GCM-SHA384 encrypted SMTP;
 16 May 2019 09:36:42 -0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4G9Xw3h078133;
 Thu, 16 May 2019 09:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=O0kyMOL6XBnD+TZR6vjzPGJbAPbiB1dbXMNPAk61Jro=;
 b=IqA99SEr7whijI36sdHrb4Ln5QiKujAF22n6ubQZUDEwxaTA5EeSdg9aYiu/SI8YK21w
 sCT7NBI8UiOu1PJegx+xNbKjEUEPYsbK01hgxA1OaQaWV9t4K/NlCdtVI7YwceZM8Dbe
 rUVpdyoNTs77bOhhRo7AOe52dRKowCz3GR1G/1TtouvWyjlOlY3y0UbvmI93rorlXHZC
 E6r+8w6A5HHs3UVCgAII1nO7jytbM+S5pw0eBf+Xn80pmMZFSRjA2+JxZJAosUcmI7ed
 ekZ0Qv3TT04pxNX0DdEdLkfAvqDjS0OJAryl3IartmZ13GX2OGK/+fsI3pqqV3R6crsR sA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 2sdkwe2bw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 09:35:56 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4G9ZWbC083764;
 Thu, 16 May 2019 09:35:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2sggetk7xq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 09:35:55 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4G9ZrIr021526;
 Thu, 16 May 2019 09:35:53 GMT
Received: from tomti.i.net-space.pl (/10.175.201.166)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 16 May 2019 02:35:52 -0700
Date: Thu, 16 May 2019 11:35:48 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: M A Young <m.a.young@durham.ac.uk>
Message-ID: <20190516093548.ljxiqukdtbswsyuu@tomti.i.net-space.pl>
References: <20190515113600.m26n2abinki7reg7@tomti.i.net-space.pl>
 <alpine.LFD.2.21.1905151357260.3268@algedi.dur.ac.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1905151357260.3268@algedi.dur.ac.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9258
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=799
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905160065
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9258
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=830 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905160065
Subject: Re: [Xen-devel] Fedora - make BLS configs default - Xen Dom0 boot
 broken
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
Cc: adamwill@fedoraproject.org, xen-devel@lists.xensource.com,
 konrad.wilk@oracle.com, lars.kurth.xen@gmail.com, javierm@redhat.com,
 dfaggioli@suse.com, pjones@redhat.com, committers@xenproject.org,
 marmarek@invisiblethingslab.com, ian.jackson@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDI6MDI6NTdQTSArMDEwMCwgTSBBIFlvdW5nIHdyb3Rl
Ogo+IE9uIFdlZCwgMTUgTWF5IDIwMTksIERhbmllbCBLaXBlciB3cm90ZToKPgo+ID4gRllJLCBh
bm90aGVyIFhlbiBEb20wIGJvb3QgaXNzdWUgb24gRmVkb3JhLi4uCj4gPgo+ID4gUGxlYXNlIHRh
a2UgYSBsb29rIGF0IFsxXS4gVGhpcyB3aWxsIGJyZWFrIFhlbiBEb20wIGJvb3QgZHVlIHRvIGxh
Y2sgb2YKPiA+IHN1cHBvcnQgZm9yIG11bHRpYm9vdCwgbXVsdGlib290MiwgbW9kdWxlLCBhbmQg
bW9kdWxlMiBjb21tYW5kcy4gSWYgd2UKPiA+IGNhcmUgdGhlbiB0aGlzIGhhcyB0byBiZSBmaXhl
ZCBzb21laG93Li4uCj4KPiBUaGlzIGJpdCBpc24ndCBjdXJyZW50bHkgYSBwcm9ibGVtIGZvciBY
ZW4gRG9tMCBiZWNhdXNlIHRoZQo+IC9ldGMvZ3J1Yi5kLzIwX2xpbnV4X3hlbiBncnViIHNjcmlw
dCBzdGlsbCBnZW5lcmF0ZXMgbm9uLUJMUyBncnViCj4gY29uZmlndXJhdGlvbi4KCkdyZWF0ISBT
bywgdGhpcyBtYWtlcyB0aGUgaXNzdWUgbm90IHNvIG11Y2ggdXJnZW50IGJ1dCB3ZSBoYXZlIHRv
IGhhdmUKaXQgb24gb3VyIHJhZGFyLgoKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
