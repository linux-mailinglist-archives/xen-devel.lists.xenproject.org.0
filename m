Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442931EFAC
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 13:39:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQsDD-0003aX-HY; Wed, 15 May 2019 11:36:43 +0000
Received: from mail6.bemta26.messagelabs.com ([85.158.142.45])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <daniel.kiper@oracle.com>) id 1hQsDB-0003aN-8f
 for xen-devel@lists.xensource.com; Wed, 15 May 2019 11:36:41 +0000
Received: from [85.158.142.100] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-a.eu-central-1.aws.symcld.net id AA/5E-26874-7C9FBDC5;
 Wed, 15 May 2019 11:36:39 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-8.tower-225.messagelabs.com: domain of oracle.com designates 
 156.151.31.85 as permitted sender) smtp.mailfrom=oracle.com; dkim=pass 
 (good signature) header.i=@oracle.com header.s=corp-2018-07-02; 
 dmarc=pass (p=none adkim=r aspf=r) header.from=oracle.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRWlGSWpSXmKPExsUyZ7p8qO7xn7d
 jDNauV7S4N+U9uwOjx/a+XewBjFGsmXlJ+RUJrBlr52xgLVjNXHH8/SqWBsbHTF2MXBxCAisY
 JQ4u3swC4rAI7GWRmPz9KAtE5hWjxIy5h1jgyqYc+s0I4bxklOh48YEdwtnIKPHs32pmCKeXU
 eLO/SWsXYycQNNUJTY83s4MYrMJ6Ehc/PKQHcQWEbCVWDG/EaybWeALo8TkvbuZQBLCAo4S8z
 6vA7N5BZwknp/dwwZhC0qcnPmEBcRmFtCSuPHvJVANB5AtLbH8HwdIWFRARaJz6RywEgmBUIk
 N0w+DzZcQmMAk8WzyFiZMiatMEjc7e9knMIrOQrJjFpIdsxB2LGBkXsVomVSUmZ5RkpuYmaNr
 aGCga2horGuoa2huoZdYpZuol1qqm5yaV1KUCJTVSywv1iuuzE3OSdHLSy3ZxAiMo5RCxk07G
 KcsTz/EKMnBpCTK+/vQ7RghvqT8lMqMxOKM+KLSnNTiQ4waHBwCm9euvsAoxZKXn5eqJMH79j
 tQnWBRanpqRVpmDjDSYUolOHiURHhNfwCleYsLEnOLM9MhUqcYdTketn6eyywENkNKnFcEpEg
 ApCijNA9uBCzpXGKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzBsNMoUnM68EbhMwjQD9IsJr
 mXkL5IiSRISUVAOj6tEd9+I819reefHZ5I3xugxR9s8Xe09uWWbYpvJerkH1zctdyTrXcoM6T
 +6edDx2p4yWaL7rUQ9tAae3zY2ayWlpD/7JBdnIWOamnftldfbzjagu3zTX1CUbaydeSPo1QY
 4rPVTecr79wWtrZQQK1rra7/uwRWjBD4sKfrZ+GQNPwd67z28qsRRnJBpqMRcVJwIA0rfYPjU
 DAAA=
X-Env-Sender: daniel.kiper@oracle.com
X-Msg-Ref: server-8.tower-225.messagelabs.com!1557920197!3497918!1
X-Originating-IP: [156.151.31.85]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: , UNPARSEABLE_RELAY
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8604 invoked from network); 15 May 2019 11:36:39 -0000
Received: from userp2120.oracle.com (HELO userp2120.oracle.com) (156.151.31.85)
 by server-8.tower-225.messagelabs.com with AES256-GCM-SHA384 encrypted SMTP;
 15 May 2019 11:36:39 -0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4FBSq0q009616;
 Wed, 15 May 2019 11:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=e8I580h9DoxkHkAkiZ/rswuxm1//urkSCfrmUHcD6vo=;
 b=wUVXUIRLK8yLbZqqm8tt0s6qxM2T+ioXkCcuVhFY98rnBH5nRznVFkOtM3gwIMaINAmA
 1DGSys/1sSeAFa0tlCEMm2GWKHXWi1NIbLNOA9MlQGrnQhXSd+FE2ITOpXuTBM4JPOLV
 uKEyDb47ULFaZ9XNDe9ULz9edL+ykd/CKQq+7/vYwZiIcRUEDPtafVCWOAXBWaZWPkVg
 eTn9lY9YsK/8ACvysW9Rpitp1NmIYmQs6Wnn4weKOWivzOZMGZNvn9nVK4YhILZtKhmb
 bIbtu6qB59k3dvCqSmKj3JGdGQ+ldQoAHxwEKqDDjNaP5WK6/Lt6vwkX3dKn+QwjlsG7 gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2sdq1qm20n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 11:36:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4FBZLaF022769;
 Wed, 15 May 2019 11:36:10 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2sgget1aec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 11:36:10 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4FBa5iB021339;
 Wed, 15 May 2019 11:36:06 GMT
Received: from tomti.i.net-space.pl (/10.175.195.206)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 15 May 2019 04:36:05 -0700
Date: Wed, 15 May 2019 13:36:00 +0200
From: Daniel Kiper <daniel.kiper@oracle.com>
To: xen-devel@lists.xensource.com;, committers@xenproject.org
Message-ID: <20190515113600.m26n2abinki7reg7@tomti.i.net-space.pl>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=811
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905150075
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=860 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905150075
Subject: [Xen-devel] Fedora - make BLS configs default - Xen Dom0 boot broken
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
Cc: adamwill@fedoraproject.org, marmarek@invisiblethingslab.com,
 konrad.wilk@oracle.com, lars.kurth.xen@gmail.com, javierm@redhat.com,
 dfaggioli@suse.com, pjones@redhat.com, m.a.young@durham.ac.uk,
 ian.jackson@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGV5LAoKRllJLCBhbm90aGVyIFhlbiBEb20wIGJvb3QgaXNzdWUgb24gRmVkb3JhLi4uCgpQbGVh
c2UgdGFrZSBhIGxvb2sgYXQgWzFdLiBUaGlzIHdpbGwgYnJlYWsgWGVuIERvbTAgYm9vdCBkdWUg
dG8gbGFjayBvZgpzdXBwb3J0IGZvciBtdWx0aWJvb3QsIG11bHRpYm9vdDIsIG1vZHVsZSwgYW5k
IG1vZHVsZTIgY29tbWFuZHMuIElmIHdlCmNhcmUgdGhlbiB0aGlzIGhhcyB0byBiZSBmaXhlZCBz
b21laG93Li4uCgpBZ2FpbiwgSSBjYW4gY29vcmRpbmF0ZSB3b3JrIGFuZCByZXZpZXcgcGF0Y2hl
cyBidXQgSSBjYW5ub3QgdGFrZSBhIHN0dWIKYXQgdGhlIGlzc3VlIG15c2VsZi4gU29ycnkgYWJv
dXQgdGhhdC4KCkRhbmllbAoKWzFdIGh0dHBzOi8vZmVkb3JhcHJvamVjdC5vcmcvd2lraS9DaGFu
Z2VzL0Jvb3RMb2FkZXJTcGVjQnlEZWZhdWx0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
