Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F37A2055
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 18:06:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3MuL-0002WT-A7; Thu, 29 Aug 2019 16:04:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9sCI=WZ=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1i3MuJ-0002WJ-NT
 for xen-devel@lists.xen.org; Thu, 29 Aug 2019 16:04:19 +0000
X-Inumbo-ID: a7da93d6-ca76-11e9-ae6e-12813bfff9fa
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7da93d6-ca76-11e9-ae6e-12813bfff9fa;
 Thu, 29 Aug 2019 16:04:18 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TFwwrW035849;
 Thu, 29 Aug 2019 16:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
 bh=JjWFUzFMNRq1LrMbSVe0YZLOg0ibIwjerR3Y7TfmxvE=;
 b=pflNktACPgwxOW286lXHQptvZWuqQgOnRcrj8lTyKyOXQbQU5281CPUI7bUswicwbbjy
 eN1d//gWFtfweYVGVkdbUxOPtFHYtPrFuLRwPTm3Nj7W1R/stWaDw3BYi3SJ1SBSc3Vt
 hRtWpdYKp1Tp/8E3p7KnTOJdXesOuYQNbH/PctpE0VVUQl7ql+U8fO4Ld/YV37QVABqa
 4QAS9VQpk6mGWRpgl4fBuxtrUomu/SVzS5Tksm257vwjsifKC7/Pxo8s3Lvc86SXgcpU
 jZ8zTwrDr+mRGaV86AEUDuN4NFiICU0jvc3yYRldXsUwYPoE92TCuXtl8bOoKPeBGgG1 Yw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2uphsq82ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 16:04:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7TFibuN049188;
 Thu, 29 Aug 2019 15:59:08 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2untev8g5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 15:59:08 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7TFx53s009914;
 Thu, 29 Aug 2019 15:59:06 GMT
Received: from konrads-mbp.lan (/209.6.36.129)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Aug 2019 08:59:05 -0700
Date: Thu, 29 Aug 2019 11:58:59 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
Message-ID: <20190829155851.GA44799@konrads-mbp.lan>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
 <20190827084624.116917-9-wipawel@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827084624.116917-9-wipawel@amazon.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9364
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=770
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908290168
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9364
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=832 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908290169
Subject: Re: [Xen-devel] [PATCH v2 08/12] livepatch: Add support for inline
 asm hotpatching expectations
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
Cc: Tim Deegan <tim@xen.org>, wipawel@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 xen-devel@lists.xen.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiArQ09ERV9HRVRfRVhQRUNUPSQoc2hlbGwgb2JqZHVtcCAtZCAtLWluc24td2lkdGg9MSAkKDEp
IHwgZ3JlcCAtQTYgLUUgJzwnJCgyKSc+OicgfCB0YWlsIC1uICsyIHwgYXdrICdCRUdJTiB7cHJp
bnRmICJ7In0ge3ByaW50ZiAiMHglcywiLCAkJDJ9JyB8IHNlZCAncy8sJCQvfS9nJykKCk9ueSBt
eSBIaWtleSA5NjAgd2hlbiBJIGNvbXBpbGUgdXNpbmcgYW4gbmF0aXZlIGNvbXBpbGVyIEkgZ2V0
OgoKZ2NjICAtREJVSUxEX0lEIC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1zdGQ9Z251OTkgLVdhbGwg
LVdzdHJpY3QtcHJvdG90eXBlcyAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtV25vLXVu
dXNlZC1idXQtc2V0LXZhcmlhYmxlIC1Xbm8tdW51c2VkLWxvY2FsLXR5cGVkZWZzICAgLU8xIC1m
bm8tb21pdC1mcmFtZS1wb2ludGVyIC1ub3N0ZGluYyAtZm5vLWJ1aWx0aW4gLWZuby1jb21tb24g
LVdlcnJvciAtV3JlZHVuZGFudC1kZWNscyAtV25vLXBvaW50ZXItYXJpdGggLVd2bGEgLXBpcGUg
LURfX1hFTl9fIC1pbmNsdWRlIC9ob21lL3hlbi5naXQveGVuL2luY2x1ZGUveGVuL2NvbmZpZy5o
ICctRF9fT0JKRUNUX0ZJTEVfXz0ieGVuX2V4cGVjdGF0aW9ucy5vIicgLVdhLC0tc3RyaXAtbG9j
YWwtYWJzb2x1dGUgLWcgLU1NRCAtTUYgLi8ueGVuX2V4cGVjdGF0aW9ucy5vLmQgLW1jcHU9Z2Vu
ZXJpYyAtbWdlbmVyYWwtcmVncy1vbmx5ICAgLUkvaG9tZS94ZW4uZ2l0L3hlbi9pbmNsdWRlIC1m
bm8tc3RhY2stcHJvdGVjdG9yIC1mbm8tZXhjZXB0aW9ucyAtV25lc3RlZC1leHRlcm5zIC1ER0ND
X0hBU19WSVNJQklMSVRZX0FUVFJJQlVURSAgLURCVUlMRF9JRCAtZm5vLXN0cmljdC1hbGlhc2lu
ZyAtc3RkPWdudTk5IC1XYWxsIC1Xc3RyaWN0LXByb3RvdHlwZXMgLVdkZWNsYXJhdGlvbi1hZnRl
ci1zdGF0ZW1lbnQgLVduby11bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV25vLXVudXNlZC1sb2Nh
bC10eXBlZGVmcyAgIC1jIHhlbl9leHBlY3RhdGlvbnMuYyAtbyB4ZW5fZXhwZWN0YXRpb25zLm8K
L2hvbWUveGVuLmdpdC94ZW4vUnVsZXMubWs6MjAyOiByZWNpcGUgZm9yIHRhcmdldCAneGVuX2V4
cGVjdGF0aW9ucy5vJyBmYWlsZWQKbWFrZVszXTogQ2lyY3VsYXIgZXhwZWN0X2NvbmZpZy5oIDwt
IHhlbl9leHBlY3RhdGlvbnMubyBkZXBlbmRlbmN5IGRyb3BwZWQuCkluIGZpbGUgaW5jbHVkZWQg
ZnJvbSB4ZW5fZXhwZWN0YXRpb25zLmM6NjowOgpleHBlY3RfY29uZmlnLmg6MToyMzogZXJyb3I6
IGxhcmdlIGludGVnZXIgaW1wbGljaXRseSB0cnVuY2F0ZWQgdG8gdW5zaWduZWQgdHlwZQogWy1X
ZXJyb3I9b3ZlcmZsb3ddCiAjZGVmaW5lIEVYUEVDVF9CWVRFUyB7MHhmMDAwMDI2MCwweDAwZjAw
MDAyLDB4ZTAwMGYwMDAsMHgxMmUwMDBmMCwweDkxMTJlMDAwLDB4CmMwOTExMmUwfQogICAgICAg
ICAgICAgICAgICAgICAgIF4KeGVuX2V4cGVjdGF0aW9ucy5jOjI4OjE3OiBub3RlOiBpbiBleHBh
bnNpb24gb2YgbWFjcm8g4oCYRVhQRUNUX0JZVEVT4oCZCiAgICAgICAgIC5kYXRhID0gRVhQRUNU
X0JZVEVTCiAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+CmV4cGVjdF9jb25maWcuaDoxOjM0
OiBlcnJvcjogbGFyZ2UgaW50ZWdlciBpbXBsaWNpdGx5IHRydW5jYXRlZCB0byB1bnNpZ25lZCB0
eXBlCiBbLVdlcnJvcj1vdmVyZmxvd10KICNkZWZpbmUgRVhQRUNUX0JZVEVTIHsweGYwMDAwMjYw
LDB4MDBmMDAwMDIsMHhlMDAwZjAwMCwweDEyZTAwMGYwLDB4OTExMmUwMDAsMHgKYzA5MTEyZTB9
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCnhlbl9leHBlY3RhdGlvbnMuYzoy
ODoxNzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEVYUEVDVF9CWVRFU+KAmQogICAg
ICAgICAuZGF0YSA9IEVYUEVDVF9CWVRFUwogICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgpl
eHBlY3RfY29uZmlnLmg6MTo0NTogZXJyb3I6IGxhcmdlIGludGVnZXIgaW1wbGljaXRseSB0cnVu
Y2F0ZWQgdG8gdW5zaWduZWQgdHlwZQogWy1XZXJyb3I9b3ZlcmZsb3ddCiAjZGVmaW5lIEVYUEVD
VF9CWVRFUyB7MHhmMDAwMDI2MCwweDAwZjAwMDAyLDB4ZTAwMGYwMDAsMHgxMmUwMDBmMCwweDkx
MTJlMDAwLDB4CmMwOTExMmUwfQrigKYKCm1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9t
ZS94ZW4uZ2l0L3hlbi90ZXN0L2xpdmVwYXRjaCcKTWFrZWZpbGU6MTE6IHJlY2lwZSBmb3IgdGFy
Z2V0ICdidWlsZCcgZmFpbGVkCm1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS94ZW4u
Z2l0L3hlbi90ZXN0JwpNYWtlZmlsZTo4NTogcmVjaXBlIGZvciB0YXJnZXQgJ190ZXN0cycgZmFp
bGVkCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS94ZW4uZ2l0L3hlbicKTWFrZWZp
bGU6NDU6IHJlY2lwZSBmb3IgdGFyZ2V0ICd0ZXN0cycgZmFpbGVkCnJvb3RAaGlrZXk5NjA6L2hv
bWUveGVuLmdpdC94ZW4jIGNhdCB0ZXN0L2xpdmVwYXRjaC9leHBlY3RfY29uZmlnLmggCiNkZWZp
bmUgRVhQRUNUX0JZVEVTIHsweGYwMDAwMjYwLDB4MDBmMDAwMDIsMHhlMDAwZjAwMCwweDEyZTAw
MGYwLDB4OTExMmUwMDAsMHhjMDkxMTJlMH0KI2RlZmluZSBFWFBFQ1RfQllURVNfQ09VTlQgNgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
