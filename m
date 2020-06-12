Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6391F7703
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 13:01:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjhQW-0005Jm-Gk; Fri, 12 Jun 2020 11:00:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4JN/=7Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjhQV-0005Jh-GL
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:00:47 +0000
X-Inumbo-ID: f778eae8-ac9b-11ea-b5ba-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f778eae8-ac9b-11ea-b5ba-12813bfff9fa;
 Fri, 12 Jun 2020 11:00:46 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: vR9NiALn/RFNcbxQ7REIJJ82GE238rLWs2R/k1YrGceQnb7KWLosRPitTpd+2lEC483fq04PAS
 XxXyX9838Be2vllZq9TLC+IGzULzUQRPBuI+7I8JP6J/qFnPVENSDO56HcU5FEXxhxvQZEVnUC
 znYRKR8U41k98YlKMfDaHW6QEXN8jWl3+wqZPXPEaj3MlUw3H7OBs2kyFRVs3+eUS69a3eSzsx
 opMJWlTRbuOrYJH17LI4ALGlOR9kRuVBGAjck7KwcZuS1MCn8CYvaAovQwMIFsTxETp/Ld5vpb
 c/s=
X-SBRS: 2.7
X-MesageID: 20239235
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20239235"
To: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
 <george.dunlap@citrix.com>, <rosbrookn@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: golang bindings dirty in tree after libxl build
Message-ID: <ab679f8c-a09f-cbc6-c0fc-6285550ba3af@citrix.com>
Date: Fri, 12 Jun 2020 12:00:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

Hello,

I've just done a libxl build and got things such as:

--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -431,14 +431,14 @@ x.Evtch = int(xc.evtch)
 x.Rref = int(xc.rref)
 x.Connection = ChannelConnection(xc.connection)
 switch x.Connection{
-case ChannelConnectionUnknown:
-x.ConnectionUnion = nil
 case ChannelConnectionPty:
 var connectionPty ChannelinfoConnectionUnionPty
 if err := connectionPty.fromC(xc);err != nil {
  return fmt.Errorf("converting field connectionPty: %v", err)
 }
 x.ConnectionUnion = connectionPty
+case ChannelConnectionUnknown:
+x.ConnectionUnion = nil
 case ChannelConnectionSocket:
 x.ConnectionUnion = nil
 default:

dirty in tree.  They are all case labels, and only their order in the
switch has changed.

Does the current binding generation rely on the order of entries in a
python dictionary by any chance?

~Andrew

