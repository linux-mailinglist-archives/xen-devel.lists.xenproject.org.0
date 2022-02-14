Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB6E4B5730
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 17:40:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272524.467404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJeO9-0003wE-HE; Mon, 14 Feb 2022 16:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272524.467404; Mon, 14 Feb 2022 16:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJeO9-0003tM-Dm; Mon, 14 Feb 2022 16:39:45 +0000
Received: by outflank-mailman (input) for mailman id 272524;
 Mon, 14 Feb 2022 16:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJeO7-0003tG-Dg
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 16:39:43 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3815c81-8db4-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 17:39:40 +0100 (CET)
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
X-Inumbo-ID: b3815c81-8db4-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644856780;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=TTsxX9IjVpKowN5pxW2wJvRpTcecF/0IS8QbS5eubNg=;
  b=a3NJ6E8ZRdDadm1Tao7S5fEbFxTBh93t9Z0+AEcDUBP/wT31IlFVNc1s
   HUSpPvcdNe5+TubNZbxq8gD3FoHN7JSNtRU1hsc2yiUEsyhlcFplBWMv1
   sNXjiOqoBNbvhBJRvmA2CumJNrqKJUG9N7RTTfNy/KHa47MnC5rf6mrQE
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ofsXPqblO46VrdGotSxv10KtYFzqIZJJxi2XD8ZDKELxFl/kLg5DiBmrmX4w0GeLsV11A6V6Hn
 P2JEWuFRDNmkLqG6zfCOIZkptajK/pwU2m5HrjboBmnbuydCw1ANH5UmOKElV7RMyIlkoWzb62
 IVK+kPfZXsZLipb/HAC537cctrrd0V3Acm0Gv1YHrEsTBI6E2PmnPvybr2uEmUzHgiWjvVNyFi
 nN06SKpU5vPGtQoHdytOLhcTpL4YKiP5+XLZsOrNufUmbmCZh+tRY4l/UGGktnVEiG93dvDVi1
 HiwZ5RCfQqE/pYZOHz5aziVK
X-SBRS: 5.1
X-MesageID: 66397890
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jPHy5qL2osV6lVYgFE+RBZIlxSXFcZb7ZxGr2PjKsXjdYENSgzxTm
 mUZW2rTaK2LNzT9c4xxa4zioEJX65PVmIVnGwJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6x7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Rvdop5
 /BSpKC7YgApF7DdnekdWTdHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glu3ZERTaeGD
 yYfQTNucjrtbS1dBlkWEIM6jL2Sn2DjeRQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfQmQvrVYRUE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCs5jwWA/V1DPwG4yqKyoPJ8gOUBmIqUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZos7SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCskPuZJhKTysDA3CMqsy67DEDG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qWjxpC7zIN0IuWokTKuMDirjUWW3C
 HI/RCsLvMMDVJdURfMfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPQ2pBLrFrx1+eJ6mUgDKZb7GMmTI+KPiuHFOhZ4iN4tbTOzUwzOxP3Y8VuFq
 44Fb6NnCXx3CYXDX8UeyqZKRXgiJnknH5Hm7ctRc++IOA19H289TfTWxNscl0ZNxsy5T8/Eo
 SOwXFF20l36iSGVIAmGcCk7OrjuQYx+vTQwOil1ZQSk3H0qYICO6qYDdsRoIel7pbI7lfMkH
 eMYf8igA+hUTmiV8ToqcpSg/pdpcw6mhFzSMnP9MiQ/ZZNpWyfA5sTgIln07CALAyfu7Zk+r
 rSs2xn1W50GQwg+Xs/aZOj2lwG6vGQHmfI0VEzNe4EBdELp+YlsCirwkv5ofJ1cdUSdnmOXj
 l/EDw0ZqO/Bp54O3OPI3a3U/Z20F+ZeH1ZBGzWJ57iBKiSHrHGoxpVNUbjUcGmFBn/04qire
 c5c0+r4bK8chF9PvodxT+RrwKY564e9rrNW1F05TnDCblDtAbJ8OHiWm8JIs/QVlLNevAK3X
 GOJ+8VbZurVaJ+0TgZJKVp3dPmH2NEVhiLWvKY8L0jN7SNq+KaKDBdJNB6WhS0BdLZ4PevJG
 wv6VBL6P+BnticXDw==
IronPort-HdrOrdr: A9a23:M/xzJaE7qbroUZvdpLqFTJHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdtZJkh8erwXZVp2RvnhNBICPoqTMuftW7dySqVxeBZnMTfKljbdREWmdQtrJ
 uIH5IOa+EYSGIK9/oSgzPIU+rIouP3iJxA7N22pxwGLGFXguNbnnxE426gYxdLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxs4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ssl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGYFq/QpF5d1H2mxa1+
 UkkC1QefibLEmhJ11dlCGdnzUIFgxes0MKh2Xo2kcL6vaJOw7SQ/Ax+76xNCGptnbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MYiFW5uYd899RjBmcsa+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zs93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfgIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT1Yd0s8LAp23FUgMyPeFPbC1z1dLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="scan'208";a="66397890"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFDt8Fmjzv7BMI5uFSOH+tMoIrYjh3lIRMUI/HslU0WdxD85shbkcc8nDOZFclGQrLVt958HZkfXRRF/wqJj/MhQo8PSUsPwJFgHo6/wzsfRJ7JIiFchVmstATqqadlHqSrME8GMzuU8mkVPZH8HK1gBnWI4wyeYtrksRmT2WWBKw8jfgSr7KxBim+M81UmzJfIOeet3oOZKajqz/tRBYAQW1EPOAeRm9SzM6j5DF+Hnd6sDjCKKiCEB9fAtMJC5uaoztCuTl6sZv1XuFk0mPPdi1o9bgqX0A/iCU4vD3ByKrKWQcAenJDvBBUvftSMV0tHToVwrkgf89rMPPNPzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTsxX9IjVpKowN5pxW2wJvRpTcecF/0IS8QbS5eubNg=;
 b=SNVdQkEvnEceukvmJ3D9/eMnbU+yGurt60cn17DE8v1qF6X9rxWSaXGaawYzZ3VTbzN5vqXP7Z4TD4e57SZ5jkAT8Fo3DuQQU99LXoso8n7T8wJuMXak/8Xyhas916w477AKsEjKDva8yrERT/l1rNCChsko1i1rxiCXJz49VTqz0814PjMdtD7JrCB7KWVQDZkQm0QF1O0YzPxjhrzMsowgKx3lvYa/2LRqohL9cVvctNDUfAYCdbRtwmxEakwiM4fLhsBn3ttNTo/zL6Ulp95Y/PW4QUTGUXxpRc9k9sIINh0Dkr71S/Bf+Y1xuX0uWN/Ltbum3Xn2fLON8gQpkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTsxX9IjVpKowN5pxW2wJvRpTcecF/0IS8QbS5eubNg=;
 b=dV+Th2gFtcLL+O10lXPYWjeZ6Nvv65ywgbiLpEnjaIAZkM3/+iRd0MtCObLq8Rm4bnmB5aUPrwNasPqEUnJHNxXKVvwJdCjsd8Z3jhzMHcnDBoZsthSgzqK+aarHOUmnQ2f3Gc/Gu2DOVca4HCnQq4ikZUwXNtiCFCecM3pJ1/I=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/7] x86/hvm: Use __initdata_cf_clobber for hvm_funcs
Thread-Topic: [PATCH v2 5/7] x86/hvm: Use __initdata_cf_clobber for hvm_funcs
Thread-Index: AQHYIaJjsOAx5ctsj06lom2YGua3HKyTBU+AgAAG24CAADN0gA==
Date: Mon, 14 Feb 2022 16:39:35 +0000
Message-ID: <73208a54-0271-9abe-9042-500d3d5d51b4@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-6-andrew.cooper3@citrix.com>
 <785653bd-db3a-df22-f2a0-c20b3f3bf8c1@suse.com>
 <2e28c474-6778-431a-9e40-8cc0668224c5@citrix.com>
In-Reply-To: <2e28c474-6778-431a-9e40-8cc0668224c5@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21e63810-276c-4216-8517-08d9efd895b2
x-ms-traffictypediagnostic: DM6PR03MB4554:EE_
x-microsoft-antispam-prvs: <DM6PR03MB45546F489EF573341CBCFCF7BA339@DM6PR03MB4554.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cUudV3tvscoXLU5Ay8ANS3qDc5AWAxD+mlMiuj63HrJwcmDSGpZsZ8Y/l+gAuQrtTfyxGUffmAqEh6Vmx69N25XaY5NE+7Pu8AhMGjuwTuRkx9mGFJ8iT/2J0jWa2qdM+tGmwvMDjM8F1DepOHwPJIvKC26TyGhSeYprU7ew0oKB5eRRa4FZl66JJvuqH6Kg5SLgh76cWw+dk1fzXecKalqkhZF81CiQul90yWJSgjA0rgYVrDzPuWPut4tL7wpNIhLm9GZ2SKoX8kCsIm7RbWhQUvg3VyGNz5V1Sk/wEGNKpwuXTyQYlixtV7rPf/cKoBPzHbpOqtvWrKfN2qqeRWkAgoHM9uBEvwF0ENGZeSRSvoCnP37eHgnukiHUAcrr3ioEQbF/Jq+AfFO2tBH692a0Ku/9/9c8EUQuqD8+ERwBJ0y2N7JXoJ0cZp8lNHj+2BcMSPNiYTUFh8lxKsNNzLAYJKBlqumQIw4MGYH8yhVTPQHvoK1C5FpwVimiPOc3v6XXmYIPv1ctn8H1Ee2mckyQcRE2GUSl/eLwPrzu2hMIa0SaKEyFWb3tzoRIcrafUoo1tG07QpFND5QCOwGUpzLeylgYINLm0qCpM4+WNhn0roG6TGWwAh6rYGa8S8YYSlvic7PAfNJzblo5YJ/GH1b7FkKXHifDnBUKVTwDeK9k2kYs8ujITJUgPPmUE4mm8XQ6kZMdHsZTuv6GGKWZAOKOh3mNZzwjWnFlfz7SaSLtdKAdb96aGsJAD/T7CYg+0XqCC0Ux2E0bHl2eWGzHKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(316002)(31696002)(86362001)(38100700002)(2616005)(6916009)(54906003)(26005)(82960400001)(53546011)(186003)(6506007)(36756003)(6512007)(83380400001)(6486002)(122000001)(76116006)(66946007)(8676002)(2906002)(66476007)(8936002)(5660300002)(66556008)(4326008)(66446008)(31686004)(64756008)(38070700005)(508600001)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sjd4UmR5c0s1MEdwQzZaUEp4T3JsdlV2YlhpYVQwK0d2NFNJeG4yV1pkc1Fi?=
 =?utf-8?B?dkcwNjR0enBuTXp0T04xWWFwVEh4bWxFWFE4ZkVLRFdOYnU1akdPMEFBSjJT?=
 =?utf-8?B?QzJGbklhMnB4Yy90RHpTcHorR0Q2eFdoU2h6MTBkYnZTVW1XSklZK25wSlRR?=
 =?utf-8?B?UmZHbHF1UnpNM3h5ejczSDZKMWFrelpyM0E2dzNZam13Z25uVFhBM3FpWU5z?=
 =?utf-8?B?VHFMNlF6Y1U1SU9ObU5sRzFRVFZrMzR1M2x5Q2NKNUNIeG51M1ZUY0o5VzZP?=
 =?utf-8?B?V3NQd1lYQXdlRXZEaVdwTUxQd29iUXlGUUdPY2o2QTVyb0pVRlgrSGxQbW8r?=
 =?utf-8?B?NlEzVnRRd2ZEdVpNcGZhbitzRS9FM2FOM0U4VTRDUEVaNFdNRGRoNVB0WmJX?=
 =?utf-8?B?T0U5UjJCVWJOWUl3MUJraXg0TVFqTHBqRHpnZ2xaS3BDNzRadnJ6UFV1RVhG?=
 =?utf-8?B?MTlnZ3hhaDRCb0FSS3RSaW1acWRPNyt4a2x3bG9pKzlrdUx1VTg3aFUyUWlH?=
 =?utf-8?B?cDlTeENvaWM5YzhodklhUmN6T1ZqekV3RU1iM3plSGorbjg0WC9FRGRrVUQ1?=
 =?utf-8?B?QWFUT1d4WHg5R2RPL1BvTFhzZGoyZERXSWFIQ0FtQXhMTlVFT0ZTMFN2dTc4?=
 =?utf-8?B?RTJjak9HR09sMnYxaEI2OVJzOUFzL01ZZjlKSC9NUGxONWpRMFhhNVR2b3Y5?=
 =?utf-8?B?Z3l3VVVaRHRBWkl1L1lFSGpZN25rZFV2Q21iQ0pzL1RRWlUrM1cyWFpDWWQz?=
 =?utf-8?B?VUsya25GTC9BNmJYZDg3Sm9ZVVF0Wk9pZENSUWIzancxdlZqbE9sUy9iWEtU?=
 =?utf-8?B?cHpkbkUyL2xaZHNWRmFRa0Z2Q1pINjBETW9yenUwWkZHTEF1M2dEcGtra042?=
 =?utf-8?B?V3FCK2cvL1NRV3dHUVZJL1l6VC9wdFBlblE5Y1daZlZxY1I0dGlpdWZvVUla?=
 =?utf-8?B?R2x4b0VRY3RuaXQzMmpOT2pHS0FBWWdCZGRYcE9HQVZpRmNlbXNuUkIxeVNU?=
 =?utf-8?B?WW5HdFV5ZkN0aS9nZHJVM1ptU3BXZ1BSTE5YSXFQaFNSQUZGMlUyMVNlSkF4?=
 =?utf-8?B?S25ZdlV6ZDdCbjdzOTM0YkNTbkJWMXVIY2djQ3pqWlhMbjdoTGtpbmNBaVRE?=
 =?utf-8?B?Z2JIb2ViWTk2RjY4ZkI3dEIydkYydXkyYVQ5SWxMMjAzMXVodXlSNEVERk1u?=
 =?utf-8?B?aG5JbXJaVnk1ZXdsWTFQSFNvNG43bUFWOXVQU3ZibEROUnhVUy9zOGxxMDFQ?=
 =?utf-8?B?YktXbEwwaXMvZmlPNzgwUFQzTUp2UFg3bG1MZUcyOS9GK3NZU2VuS3BhZ0g0?=
 =?utf-8?B?eW1YWnROQkNOd29VUjNJaWNVYnB2OUdQQmtjZUdpbTBsbDNneEFUY1JLSlpo?=
 =?utf-8?B?bzlXc2NuREhuZVpoMjRmOFFVTGJxRWx1MVFwdlVUb0hkTXBtUGRHOS9hbEpi?=
 =?utf-8?B?RFRYMjhpaXY5dDY5Z2Fkc25WNWhNLzhtVTB1Z0hSSUdzVG1OZUdtZjA4dURC?=
 =?utf-8?B?czZVT0JYNzZqNHQxbkttRXUyaWFhMmJyUjIrN09wd2Fia0ZqUHoydUxaRi9K?=
 =?utf-8?B?M2hUL2lJTkg1YjBMY013RVVnVWRzZHhMcTAzdWtUamFEOTVjQlNQS2RkYWJk?=
 =?utf-8?B?Tm1UQWJjNXZYNStIb0FvaWY5SlRPZ1lVMDR3VEhFWHhVSHNOcWRYbVE0cm9w?=
 =?utf-8?B?WHN3RjRSOG8raHhycTc4OEFhZGpaeko4WE12cXdHaWVWODVicEpMUEh6MjBK?=
 =?utf-8?B?RkYxYjA4UFJNUTZsYVAvTjkyc214dmFRdmxkK21JeXlaanQ4bWFNU0x6aWJx?=
 =?utf-8?B?d1FVTTZzQWJCRTBaYU5GeHdPTlg2ekJwSWpoanAvaER2cmo2Y3BrZW54bVhG?=
 =?utf-8?B?R3JJU3greDN4U1BYazB0RkdmaWI1QlA2a3BlOUpZVkdTaUtVSDZDandMdmtI?=
 =?utf-8?B?WHpqS1FQaWdxTnR1MlZMMjlmdGVwU293em40aFVmR1VPc3Y4SStOQ1ZsY3o3?=
 =?utf-8?B?Z0pUbkRKRndrejNaamJCMm9MNWNhWDNyYVhLL205WFFlRFhWbWJpbmRRTEJH?=
 =?utf-8?B?R2ZPR1hyRzBxUXZYazlVcVRDOTRPZENFU3NSeERJeGVFd3ZTT2FWTW9mZ1Zj?=
 =?utf-8?B?VmcwYkxKUUdHQ3dRd21nWHdxempGZEFUelQzM1lnd21YMHJxQnZjTXIwUjk1?=
 =?utf-8?B?S1hKaVdmSXhpc2tjT1pEK3luZEhqZjNtRU1mcXNwSWtjZ25XV0Y0VHdRU09K?=
 =?utf-8?B?ZFJlOUdFWTJsVFpEMDhlSjkyVHBRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FA0C60625C1C04484CC121B14D197E5@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e63810-276c-4216-8517-08d9efd895b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 16:39:35.1864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qnytz+WAA95ybeXF8YKbEv1QmXJO9CB8lqyiDufh00dD3G2WBbLfj28EkcxqDodCiYifhdvuB7WzDm0QYOOmwW4ttHfdMYFzDSTKqpmugwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4554
X-OriginatorOrg: citrix.com

T24gMTQvMDIvMjAyMiAxMzozNSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTQvMDIvMjAy
MiAxMzoxMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxNC4wMi4yMDIyIDEzOjU2LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMNCj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQo+Pj4gQEAgLTg4LDcgKzg4LDcgQEAgdW5zaWdu
ZWQgaW50IG9wdF9odm1fZGVidWdfbGV2ZWwgX19yZWFkX21vc3RseTsNCj4+PiAgaW50ZWdlcl9w
YXJhbSgiaHZtX2RlYnVnIiwgb3B0X2h2bV9kZWJ1Z19sZXZlbCk7DQo+Pj4gICNlbmRpZg0KPj4+
ICANCj4+PiAtc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSBodm1fZnVuY3MgX19yZWFkX21vc3Rs
eTsNCj4+PiArc3RydWN0IGh2bV9mdW5jdGlvbl90YWJsZSBfX3JvX2FmdGVyX2luaXQgaHZtX2Z1
bmNzOw0KPj4gU3RyaWN0bHkgc3BlYWtpbmcgdGhpcyBpcyBhbiB1bnJlbGF0ZWQgY2hhbmdlLiBJ
J20gZmluZSB3aXRoIGl0IGxpdmluZyBoZXJlLA0KPj4gYnV0IGhhbGYgYSBzZW50ZW5jZSB3b3Vs
ZCBiZSBuaWNlIGluIHRoZSBkZXNjcmlwdGlvbi4NCj4gSSBjb3VsZCBzcGxpdCBpdCBvdXQsIGJ1
dCB3ZSBjb3VsZCBwcm9iYWJseSBtYWtlIDIwMCBwYXRjaGVzIG9mDQo+ICJzcHJpbmtsZSBzb21l
IF9fcm9fYWZ0ZXJfaW5pdCBhcm91bmQsIG5vdyB0aGF0IGl0IGV4aXN0cyIuDQo+DQo+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMNCj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L3N2bS9zdm0uYw0KPj4+IEBAIC0yNTEzLDcgKzI1MTMsNyBAQCBzdGF0aWMgdm9pZCBjZl9jaGVj
ayBzdm1fc2V0X3JlZyhzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHJlZywgdWludDY0X3Qg
dmFsKQ0KPj4+ICAgICAgfQ0KPj4+ICB9DQo+Pj4gIA0KPj4+IC1zdGF0aWMgc3RydWN0IGh2bV9m
dW5jdGlvbl90YWJsZSBfX2luaXRkYXRhIHN2bV9mdW5jdGlvbl90YWJsZSA9IHsNCj4+PiArc3Rh
dGljIHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgX19pbml0ZGF0YV9jZl9jbG9iYmVyIHN2bV9m
dW5jdGlvbl90YWJsZSA9IHsNCj4+PiAgICAgIC5uYW1lICAgICAgICAgICAgICAgICA9ICJTVk0i
LA0KPj4+ICAgICAgLmNwdV91cF9wcmVwYXJlICAgICAgID0gc3ZtX2NwdV91cF9wcmVwYXJlLA0K
Pj4+ICAgICAgLmNwdV9kZWFkICAgICAgICAgICAgID0gc3ZtX2NwdV9kZWFkLA0KPj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14
L3ZteC5jDQo+Pj4gaW5kZXggNDFkYjUzOGE5ZTNkLi43NThkZjMzMjE4ODQgMTAwNjQ0DQo+Pj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4+PiArKysgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bXguYw0KPj4+IEBAIC0yNDczLDcgKzI0NzMsNyBAQCBzdGF0aWMgdm9pZCBjZl9j
aGVjayB2bXhfc2V0X3JlZyhzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50IHJlZywgdWludDY0
X3QgdmFsKQ0KPj4+ICAgICAgdm14X3ZtY3NfZXhpdCh2KTsNCj4+PiAgfQ0KPj4+ICANCj4+PiAt
c3RhdGljIHN0cnVjdCBodm1fZnVuY3Rpb25fdGFibGUgX19pbml0ZGF0YSB2bXhfZnVuY3Rpb25f
dGFibGUgPSB7DQo+Pj4gK3N0YXRpYyBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlIF9faW5pdGRh
dGFfY2ZfY2xvYmJlciB2bXhfZnVuY3Rpb25fdGFibGUgPSB7DQo+Pj4gICAgICAubmFtZSAgICAg
ICAgICAgICAgICAgPSAiVk1YIiwNCj4+PiAgICAgIC5jcHVfdXBfcHJlcGFyZSAgICAgICA9IHZt
eF9jcHVfdXBfcHJlcGFyZSwNCj4+PiAgICAgIC5jcHVfZGVhZCAgICAgICAgICAgICA9IHZteF9j
cHVfZGVhZCwNCj4+IFdoaWxlIEknZCBsaWtlIHRvIHJlLXJhaXNlIG15IGNvbmNlcm4gcmVnYXJk
aW5nIHRoZSBub24tcG9pbnRlciBmaWVsZHMNCj4+IGluIHRoZXNlIHN0cnVjdHVyZSBpbnN0YW5j
ZXMgKGp1c3QgY29uc2lkZXIgYSBzZXF1ZW5jZSBvZiBlbm91Z2ggYm9vbA0KPj4gYml0ZmllbGRz
LCB3aGljaCBlZmZlY3RpdmVseSBjYW4gZXhwcmVzcyBhbnkgdmFsdWUsIGluY2x1ZGluZyBvbmVz
DQo+PiB3aGljaCB3b3VsZCBhcHBlYXIgbGlrZSBwb2ludGVycyBpbnRvIC50ZXh0KSwgc2luY2Ug
Zm9yIG5vdyBhbGwgaXMgb2theQ0KPj4gYWZhaWN0Og0KPj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gSSBzaG91bGQgcHJvYmFibHkgcHV0IHNvbWV0aGlu
ZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdG9vLsKgIEl0IGlzIGENCj4gdGhlb3JldGljYWwgcmlz
aywgYnV0IG5vdCAoSU1PKSBhIHByYWN0aWNhbCBvbmUuDQoNClVwZGF0ZWQgY29tbWl0IG1lc3Nh
Z2U6DQoNCng4Ni9odm06IFVzZSBfX2luaXRkYXRhX2NmX2Nsb2JiZXIgZm9yIGh2bV9mdW5jcw0K
DQpOb3cgdGhhdCBhbGwgY2FsbHMgdGhyb3VnaCBodm1fZnVuY3MgYXJlIGZ1bGx5IGFsdGNhbGwn
ZCwgaGFyZGVuIGFsbCB0aGUgc3ZtDQphbmQgdm14IGZ1bmN0aW9uIHBvaW50ZXIgdGFyZ2V0cy7C
oCBUaGlzIGRyb3BzIDEwNiBlbmRicjY0IGluc3RydWN0aW9ucy4NCg0KQ2xvYmJlcmluZyBkb2Vz
IGNvbWUgd2l0aCBhIHRoZW9yZXRpY2FsIHJpc2suwqAgVGhlIG5vbi1wb2ludGVyIGZpZWxkcyBv
Zg0Ke3N2bSx2bXh9X2Z1bmN0aW9uX3RhYmxlIGNhbiBpbiB0aGVvcnkgaGFwcGVuIHRvIGZvcm0g
YSBiaXQgcGF0dGVybg0KbWF0Y2hpbmcgYQ0KcG9pbnRlciBpbnRvIC50ZXh0IGF0IGEgbGVnYWwg
ZW5kYnI2NCBpbnN0cnVjdGlvbiwgYnV0IHRoaXMgaXMgZXhwZWN0ZWQNCnRvIGJlDQppbXBsYXVz
aWJsZSBmb3IgYW55dGhpbmcgbGlhYmxlIHRvIHBhc3MgY29kZSByZXZpZXcuDQoNCldoaWxlIGF0
IGl0LCBtb3ZlIGh2bV9mdW5jcyBpbnRvIF9fcm9fYWZ0ZXJfaW5pdCBub3cgdGhhdCB0aGlzIGV4
aXN0cy4NCg0KfkFuZHJldw0K

