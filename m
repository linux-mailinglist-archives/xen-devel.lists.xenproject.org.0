Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB31B4B153B
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 19:28:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269960.464117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIEAN-0003xV-Go; Thu, 10 Feb 2022 18:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269960.464117; Thu, 10 Feb 2022 18:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIEAN-0003uS-DP; Thu, 10 Feb 2022 18:27:39 +0000
Received: by outflank-mailman (input) for mailman id 269960;
 Thu, 10 Feb 2022 18:27:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OlIW=SZ=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nIEAL-0003uK-G3
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 18:27:37 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c803517-8a9f-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 19:27:34 +0100 (CET)
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
X-Inumbo-ID: 1c803517-8a9f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644517654;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=WLQ6zFOpuCFiRHzGec/l2mWyFi+kYiC1GN7h3D2ppJo=;
  b=fWfbjfV2CjjuLdSr+CdigVNg0j8ldjSGcbVTfhhSoT/pBN3NL3WSnog9
   ALJJE0qpO7xIKHoB5g6jy8olKTSFIjMypexuv3rzNLca7Wa+XrD5HnCGp
   RcD7ceiD2GTtjLBuWE+KV2mTkbz8j4jzE53FCxNnyAgp3mTRqn3QOoJ2i
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lavaRb6hJsXdrEZ6spBfVVbtqOP+KVGIB06E4ecrA+klwzHaCjHavCgU5rr1vavIFsErIE6lLe
 w82Jk9nLSIni2a24xfTR1qdviyvFipzU6rDWF/ny+UJMouceS53fKH2wq9/McY1MJ0pge+eLTj
 DW9oPLHIbxzcA1duTpJzCOo0sdYI+BbsEJGRHgWhQrxtO6T6x4YLoml/+rzMtp89Puup2qQNbC
 qXSWyswSE4KhC1iE2UoAFg3Lz9LtAp6/8WsFQCzC9qVQfYAd5MElmWw38dZvYkOVeJINpfE27E
 20/bVn3QfR3hgI5i9crOgXdZ
X-SBRS: 5.1
X-MesageID: 63403588
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bmRQUaI+yKvLUCV9FE+RA5IlxSXFcZb7ZxGr2PjKsXjdYENS0DADy
 zcYDWmPPqmLYWP1LdBwaY3g8E9VuMSHx99mGwtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6w7Zj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB27mfpdi
 /sRnqCgVBZ3JvXdm7w5cwRHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Glr2pgVQKaOD
 yYfQQZlPSmdbjdVAFIKWYkVgLirmHD5UgQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfTnSLgHoMJUrTg8uVthnWcw2USDFsdUl7TnBWiohfgAZQFc
 RVSo3dw6/hpnKC2cjXjdy++ilLHkEI3Z8pNArMisBCOko70/hnMUwDoUQV9QNAhscY3Qxkj2
 VmIg87lCFRTjVGFdZ6O3uzK9G3vYED5OUdHPHZZFlVdv7EPtalu1kqnczp1LEKiYjQZ8xnUy
 ivCkiUxjq57YSUjh/TipgCvb95BS/H0ou8JCuf/AzrNAuBRPtfNi2mUBb7ztq8owGGxFAfpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpyL4J9gIu2EhdS+F1/ronxeyO
 Sc/XisLuvdu0IaCN/crM+pd9ex2pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ba5XUm08CDIUToED/qOYuELzDFlBibbjeoM1LbO+TZA1gHWAqEfjKxr09PYdimsxoei3go
 xlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:Y/YM66qljkS8GOVQ51tdW9IaV5uEL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6K290DHpewKTyXcH2/hsAV7EZnimhILIFvAs0WKG+Vzd8kLFh5dgPM
 tbAspD4ZjLfCJHZKXBkUmF+rQbsaG6GcmT7I+0pRoMPGJXguNbnnxE426gYxdLrWJ9dP4E/e
 +nl6x6Tk2bCBMqh6qAdxw4dtmGg+eOuIPtYBYACRJiwhKJlymU5LnzFAXd9gsCUhtUqI1Ssl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVEDPxkQylDb4RGYFq/QpF5d1H2mxa1+
 UkkC1QefibLEmhJ11dlCGdnzUIFgxes0MKh2Xo2kcL6vaJOw7SQ/Ax+76xNCGptnbI9esMoJ
 6ilQiixutqJAKFkyLn69fSURZ20kKyvHo5iOYWy2dSSI0EddZq3MYiFW5uYd899RjBmcsa+S
 hVfbXhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdnaUk7zs93YN4T4MB6/
 XPM6xumr0LRsgKbbhlDONERcesEGTCTR/FLWrXK1X6E6MMPW7LtvfMkfgIzfDvfIZNwIo5mZ
 zHXl8dvWkue1j2AcnLx5FP+gClehT1Yd0s8LAp23FUgMyPeFPbC1z1dLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.88,359,1635220800"; 
   d="scan'208";a="63403588"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9CA2YjMNGKSCWZGmAJK8DK7mdxzgA4/SvDj24/sUykWNcB0KP61IcA0dBG+uWvqG976ZquaB1FWjcwchQ+k1fKHHdJuUu1bE3J0oPoouyUc1xZgRvLRFOUFTGB1+SrMKFXlMM+/v4iCUjjmPlQJtkrW3UTvp5GVu75PmaCO8PhG1z0SFWNDTVA4sGdWCRnj28zXJLLonJeiHsWSNOUSBmgECwCc/DOq1GbcCs+zXdzA7vGhiz0HH2cJbBsk5ag65benq2yvSWR0Nuhem9EmjyvUisi19pf8QhopGO3ADa6AbB5IB+/UezSUps6hPDxYJ6l2MJ3oVbzphVxJOyHWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLQ6zFOpuCFiRHzGec/l2mWyFi+kYiC1GN7h3D2ppJo=;
 b=n4OtHhWxYX8QE/jNqooTpiAAGrustjxDxxObYGXeBrgT5MEyQedl5Vsw36bpBHcVMqBCZsX0hruiUsjWZTBUNKD7xdJj+KvxkQaouEkZqkmGbSubpdYYCLmQwZzqm3K8ufmk5VJWLhHjbtgjftZwGdAMmExx4pHu/PPRld6d7OjKpEYHw5rJizTdNrc30xFVXBQ3eScJbQIAgENdCAcyqCZ6cXv7q3NzGvCLPs5IagZ3DpRvZOjfp+jQL/ESKyzk+9kuLbJ/RU1P/tKOG6fNrD0CEDzQvAq5i7S98n3cko5RM1ewZoNZurSHk/8a37lk/wJ7vXC4k6kqRSSqHtrsLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLQ6zFOpuCFiRHzGec/l2mWyFi+kYiC1GN7h3D2ppJo=;
 b=ALepYvjxDRNCFEGssr/P80YUztFYNHbnnMCCk32ZwXZesJTB3SfVEwB+FlXTMbLNCumi/ZMJKPnW4BrahAnfYx1PTEMfVnJbvRgksrnnRBDikF9eDk68NDf8pxdOWOL9P4nEpaYqR9ZIMjdpjtHrovv/H4S9gv5+poNKCoXSFLE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Alex Olson <this.is.a0lson@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC] Avoid dom0/HVM performance penalty from MSR access
 tightening
Thread-Topic: [RFC] Avoid dom0/HVM performance penalty from MSR access
 tightening
Thread-Index: AQHYHqOPCVLXb6vjgEiHGtmfOQDTpayNGm6A
Date: Thu, 10 Feb 2022 18:27:27 +0000
Message-ID: <a1099ae9-9e0d-cf54-e786-835c13f2ba40@citrix.com>
References: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
In-Reply-To: <949b4776e23e4607776685a7e2705b9e77f5b717.camel@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 976c182b-0e72-4b9b-ea59-08d9ecc2fe10
x-ms-traffictypediagnostic: SA1PR03MB6530:EE_
x-microsoft-antispam-prvs: <SA1PR03MB65306ADB82F36C7C5B740A0DBA2F9@SA1PR03MB6530.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4oLVdvWZbvgm5F+++pmuPj92gLyMa5UnK3xK/OFNROz2dp+lVQoHdBOf8tuQwWZmNAb1c+RKlzZER8d3fotq4LqMVK1HJNylmRpx9gxHd1dLxMQO8gUV7ywhBOYM7kwNjmqIZxiIGYw8/uhPrVbOFC1UmPOEFlHVtXyrVlxWzOcaGOxUJmXe5j2ssRPxUlG1T8MU1a36m+Gvb9UBsNmCPRRuLCTKGvEvw3pNR1jzYl1BzZWxR8ctYiuSssJHyEEXDxGerat+9nFNnR+x/Z59a0QwIlYI7g1zgv5RRoDlGJO/z/BG07Ajgv+BGRnmOIskyjoJDMCDlvTiNHTEfXCP/mzzrC+/vYmBnZcN+dajI/3Zj0OsU1QdowSV6Zsuo1sMHwJiW6Q+pTpeqvx/ZKccz6BS1sYNWbyIhu/HRu3dp8P7wuIXDTRL2n1Oi/PF3X6GU8TmBBRbDTr/93Q6fgEp8ixBZQAnG+wU75ddx3q8OGh1eCmLjhnSaQMwkpAeGwwZCk0Pcn4S2CEt+F96hlexR2pgVdX2SWWkPcEHCzaqzisGpfynwIFaTQVXRY9edAciv9iJr04yF8ru8zcniZu6r/KYHEQG5cZDfXOJMbRR4vEnM9gy9U8RfnBegQIzaWwX1Qpen3R6hisBN6acTc0XymlTLGQeCeteaTKDwV1UNh5566JzAAMjtdigsKxYVWFgwONdqeTULZetOSI9vm3sBk/Bpa6Qbx4mWpfEeTejlPotDy72+boM3wnYKtSvYqSPFDBSBMXR0aQqZivRoxtkNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(2616005)(91956017)(6486002)(110136005)(86362001)(316002)(31686004)(36756003)(31696002)(508600001)(38100700002)(64756008)(122000001)(6512007)(66446008)(38070700005)(2906002)(76116006)(66946007)(6506007)(66476007)(66556008)(71200400001)(8936002)(83380400001)(8676002)(82960400001)(5660300002)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGkwdW1PTng1aTNTc0FUc0ZDdWtnMFJsRTdhejZuZytPelE1bTNyelllZm5O?=
 =?utf-8?B?OThBcGVBZU9WNGNNZS9lTUY5eHpPY1J3dFg1L2NUKytjd1BRV25Jak9wUGlq?=
 =?utf-8?B?b041R2psZ0dnS2tmK1N5dlAxRWFpTWdiTllnNEFCYlBCSXoveXZrL2YzanBz?=
 =?utf-8?B?MXlXbXhxbWg3UER4Y3V3aWtwdFgvNnRmRm9qMis1WTV2dmUvTFJDZExzUHZl?=
 =?utf-8?B?bS9PWFB2Nlppd2RkYm00a3BqQUZoMlFHSlpqSHBuZmludTVqMktLVkhMRHc5?=
 =?utf-8?B?N3N0dGtOU2NLNENVMjZrOVRoa3RZKzRvdnhrTnJmdC9zOHlQcExaVmtSMnA2?=
 =?utf-8?B?dHRBOW15ZndFb1R6Ri9mTGtTT2NXMGFMOTJnaEVpM1ozNEZzWklxMlJIQTdi?=
 =?utf-8?B?bjNPQ05FdTFUVnJGa1JSemZZU210VjR6MTJ0TDZpVTlrNHpzdVZ2dzA1dEFa?=
 =?utf-8?B?Y0xYRXM1K2ZvSnlCVnA1cjZYd2ZFMURnVVlmYXB5VVRBSGlRUTFob3h5RXlD?=
 =?utf-8?B?QkJLMVg0R0pMYzBtREtZMHpCSU45M243R3llVHFNZWVyU09tbjlVemdJdXJ0?=
 =?utf-8?B?RlY0N2gySVJJOHhJUWtyWmtydm8yNHFKcHdkb093Mmx4eWdOZEljaXJ1RXZK?=
 =?utf-8?B?S1M5Q1hUZG8yWms1VjJQbzZBWVIwVi8zUjVHTEt5UExsYjczOVY2WXErWHd1?=
 =?utf-8?B?K0FGYjNPV1FFSlprQ01HV0pGVU81L2dKNnFha2d3amJ5b0FKd09CT3Ryblhj?=
 =?utf-8?B?MjludDdGbStKTW52REdKZWhLMWowZFpYTHRrV3BMS1VJRmxBbS9vVUs4STA1?=
 =?utf-8?B?SDNhNEg0L0RNVlhRblduem44K0ZvOXZ5SUpSZjlNRGlBdDFjdVRrTStTd2hS?=
 =?utf-8?B?NHJHYlVIWWFzMmRXdDU4WnMwN3N1SFA1bTY4QTFmejZPQWhmZ2FxSU5hR2hu?=
 =?utf-8?B?WCs4bVAwSlZKZmFxKy90Q0U1ODFDYWNpQkFJa2pZUXBTeWVYZmxrRmZQc2Q3?=
 =?utf-8?B?c3MvVXFremRyYURSS3FCM21KSkRoVmhsVDlBUjFTK0tKZUZlWmhLUkpFbHJ2?=
 =?utf-8?B?byszN2lCek44c3ZKWUc1NGM2anZJQnZveCs3UzlkSUd0bWpEUXZDcUFBUFJH?=
 =?utf-8?B?RkZCMUNWaWxWN2FHdldVZ3lCbG8yTTRZclN6V3JCaDFhZmJrMVB4anRHUnFR?=
 =?utf-8?B?WlZCL09aNEJUOTRQVFkwVzVJNVZvTGVqNUtWY0QwVmhWbWZpYjFRYlJMU1h2?=
 =?utf-8?B?Rmd2MEdzZVJGS0syM0FSN2ZLT0JTSUVjM2k5d05lUThmN1QvWldFdDlzTktV?=
 =?utf-8?B?cHo3WWVjQUtHUTNrajVmWGdNNGhiWUJuVXNvRGEyejBNeEhIa0NJeEI1bGI1?=
 =?utf-8?B?c001UWhmOFhTcGlMaysyTy9pVjN3NytFdjBJZTJEVFdCZ003OE9ST2gxcGI4?=
 =?utf-8?B?WS8wTEZTTnJEL2RnR1d6ZW5GcXJxSXpjcGJNQnRTSjYyRitySjlTd3EwSnFr?=
 =?utf-8?B?a3B0VitTOTZkQkw4WjhDeS9EbnZSTXhLbjFCRDRzUmNpbDNhSXZ5d0s5cEgv?=
 =?utf-8?B?czgxTTh0RURvYTBSTXQ1eEpKL1RHTVpDZTB5TXpRUTF1NEwwTWhOc29PYVVa?=
 =?utf-8?B?THNGWDNIK3J6ZU4wSnd0c3FjMlE4a2xtdzZNTXVnSFFWd1R2MnY0K1JDd1lT?=
 =?utf-8?B?b01XckJwRk42OGxxY3d1SDVQZm5UdkpNSGs5RUk5RG1MYVpBdThRK2VsclV1?=
 =?utf-8?B?K1RPajA3aENPNzVmSW9DVUIvUjNMWEFhaUFiYS90cFFYdis2ZUVJQXYrWVFz?=
 =?utf-8?B?cFdOUk1KY3ViaFd5eUtacGc1Y1V0eUNkVHo4TjFXeUltZjdEeExBREtqTmp4?=
 =?utf-8?B?ek9JTEJQYWQ1Z0pyREFjUyt0Y3hwaGFSVTVJaXZpWHlPUkZuQVc0TGorUUxO?=
 =?utf-8?B?bElRVnoyOHVHQWY3SDhCemZzQ3UwbmYweHZqZDcxVjhLNHlTd1dleStkT2xP?=
 =?utf-8?B?VXAvUG0zYUZ1V0h5MExqZWhFa2NwcXZnU0RWeG56OVIvQUFjZFdtc2hVaWla?=
 =?utf-8?B?YWVPOUEvNGpjTE4yRWo5WTF5aHBkZlBSUkpFUG5xUE14QjJ6Y0xMUXNLVWtt?=
 =?utf-8?B?K1lESGNYRnhkMVh2bHZFWTc3RGZ6bVRQMFlLN2pSMzVUSkY0Zk1tOFlCL1hM?=
 =?utf-8?B?NFRkZmkxYk1kdHBxcCt0ekVGR1JpYUhJd2RBU1JNWnFIUUQwN1lkM1JYV2hQ?=
 =?utf-8?B?T0dqb3pWaUVwaW9HL0M1L0t1bEFBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C06ACA860687274E9AD20EC58815E10F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 976c182b-0e72-4b9b-ea59-08d9ecc2fe10
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 18:27:27.8874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KlCH25kwvJJvT5RC5w4OvBwW1FZe8qZrLzT0Nw6rSxoOfITolczYv3+VFWIUVTDxCs167vcI/i/Ovsqb24jNwLWVECvVZOpOHPoUkocvNn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6530
X-OriginatorOrg: citrix.com

T24gMTAvMDIvMjAyMiAxNzoyNywgQWxleCBPbHNvbiB3cm90ZToNCj4gSSdtIHNlZWluZyBzdHJh
bmdlIHBlcmZvcm1hbmNlIGlzc3VlcyB1bmRlciBYZW4gb24gYSBTdXBlcm1pY3JvIHNlcnZlciB3
aXRoIGEgWGVvbiBELTE1NDEgQ1BVIGNhdXNlZCBieSBhbiBNU1ItcmVsYXRlZCBjb21taXQuDQo+
DQo+IENvbW1pdCAzMjJlYzdjODlmNjY0MGVlMmE5OWQxMDQwYjZmNzg2Y2YwNDg3MmNmICd4ODYv
cHY6IGRpc2FsbG93IGFjY2VzcyB0byB1bmtub3duIE1TUnMnDQo+IHN1cnByaXNpbmdseSBpbnRy
b2R1Y2VzIGEgc2V2ZXJlIHBlcmZvcm1hbmNlIHBlbmFsaXR5IHdoZXJlIGRvbTAgaGFzIGFib3V0
IDEvOHRoDQo+IHRoZSBub3JtYWwgQ1BVIHBlcmZvcm1hbmNlLiBFdmVuIGV2ZW4gd2hlbiAneGVu
cG0nIGlzIHVzZWQgdG8gc2VsZWN0IHRoZQ0KPiBwZXJmb3JtYW5jZSBnb3Zlcm5vciBhbmQgb3Bl
cmF0ZSB0aGUgQ1BVIGF0IG1heGltdW0gZnJlcXVlbmN5LCBhY3R1YWwgQ1BVDQo+IHBlcmZvcm1h
bmNlIGlzIHN0aWxsIDEvMiBvZiBub3JtYWwgKGFzIHdlbGwgYXMgdXNpbmcgImNwdWZyZXE9eGVu
LHBlcmZvcm1hbmNlIikuDQo+DQo+IFRoZSBwYXRjaCBiZWxvdyBmaXhlcyBpdCBidXQgSSBkb24n
dCBmdWxseSB1bmRlcnN0YW5kIHdoeS4NCj4NCj4gQmFzaWNhbGx5LCB3aGVuICpyZWFkcyogb2Yg
TVNSX0lBMzJfVEhFUk1fQ09OVFJPTCBhcmUgYmxvY2tlZCwgZG9tMCBhbmQNCj4gZ3Vlc3RzIChw
aW5uZWQgdG8gb3RoZXIgQ1BVcykgc2VlIHRoZSBwZXJmb3JtYW5jZSBpc3N1ZXMuDQo+DQo+IEZv
ciBiZW5jaG1hcmtpbmcgcHVycG9zZXMsIEkgYnVpbHQgYSBzbWFsbCBDIHByb2dyYW0gdGhhdCBy
dW5zIGEgImZvcg0KPiBsb29wIiANCj4gNEJpbGxpb24gaXRlcmF0aW9ucyBhbmQgdGltZWQgaXRz
IGV4ZWN1dGlvbi4gSW4gZG9tMCwgdGhlDQo+IHBlcmZvcm1hbmNlIGlzc3Vlcw0KPiBhbHNvIGNh
dXNlIEhWTSBndWVzdCBzdGFydHVwIHRpbWUgdG8gZ28gZnJvbSA5LTEwDQo+IHNlY29uZHMgdG8g
YWxtb3N0IDgwIHNlY29uZHMuDQo+DQo+IEkgYXNzdW1lZCBYZW4gd2FzIG1hbmFnaW5nIENQVSBm
cmVxdWVuY3kgYW5kIHRodXMgYmxvY2tpbmcgcmVsYXRlZCBNU1INCj4gYWNjZXNzIGJ5IGRvbTAg
KG9yIGFueSBvdGhlciBkb21haW4pLiBIb3dldmVyLCAgY2xlYXJseSBzb21ldGhpbmcgZWxzZQ0K
PiBpcyBoYXBwZW5pbmcgYW5kIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkuDQo+DQo+IEkgaW5pdGlh
bGx5IGF0dGVtcHRlZCB0byBjb3B5IHRoZSBzYW1lIGxvZ2ljIGFzIHRoZSB3cml0ZSBNU1IgY2Fz
ZS4gVGhpcw0KPiB3YXMgZWZmZWN0aXZlIGF0IGZpeGluZyB0aGUgZG9tMCBwZXJmb3JtYW5jZSBp
c3N1ZSwgYnV0IHN0aWxsIGxlZnQgb3RoZXINCj4gZG9tYWlucyBydW5uaW5nIGF0IDEvMiBzcGVl
ZC4gSGVuY2UsIHRoZSBjaGFuZ2UgYmVsb3cgaGFzIG5vIGFjY2VzcyBjb250cm9sLg0KPg0KPg0K
PiBJZiBhbnlvbmUgaGFzIGFueSBpbnNpZ2h0IGFzIHRvIHdoYXQgaXMgcmVhbGx5IGhhcHBlbmlu
ZywgSSB3b3VsZCBiZSBhbGwgZWFycw0KPiBhcyBJIGFtIHVuc3VyZSBpZiB0aGUgY2hhbmdlIGJl
bG93IGlzIGEgcHJvcGVyIHNvbHV0aW9uLg0KDQpXZWxsIHRoYXQncyBlc3BlY2lhbGx5IGVudGVy
dGFpbmluZy4uLg0KDQpTbyB5b3VyIHBhdGNoIGVkaXRzIHB2L2VtdWwtcHJpdi1vcC5jI3JlYWRf
bXNyKCksIHNvIGlzIG9ubHkgY2hhbmdpbmcNCnRoZSBiZWhhdmlvdXIgZm9yIFBWIGRvbTAuDQoN
CldoYXQgZXhhY3RseSBpcyB5b3VyIHNtYWxsIEMgcHJvZ3JhbSBkb2luZz8NCg0KDQpUaGUgY2hh
bmdlIHRoYXQgdGhhdCBwYXRjaCBtYWRlIHdhcyB0byB0dXJuIGEgcmVhZCB3aGljaCBwcmV2aW91
c2x5DQpzdWNjZWVkZWQgaW50byBhICNHUCBmYXVsdC4NCg0KVGhlIHJlYWQgaGFzIGFscmVhZHkg
YmVlbiBib2d1cywgZXZlbiBpZiB0aGV5IGFwcGVhcmVkIHRvIHdvcmsgYmVmb3JlLsKgDQpXaGVu
IGRvbTAgaXMgc2NoZWR1bGVkIGFyb3VuZCwgaXQgbm8gbG9uZ2VyIGtub3dzIHdoaWNoIE1TUiBp
dCBpcw0KYWN0dWFsbHkgcmVhZGluZywgc28gYXQgdGhlIGJlc3QsIHRoZSBkYXRhIGJlaW5nIHJl
YWQgaXMgcmFjeSBhcyB0bw0Kd2hpY2ggQ1BVIHlvdSdyZSBpbnN0YW50YW5lb3VzbHkgc2NoZWR1
bGVkIG9uLg0KDQoNCkF0IGEgZ3Vlc3MsIHNvbWV0aGluZyBpbiBMaW51eCBpcyBkb2luZyBzb21l
dGhpbmcgZXNwZWNpYWxseSBkdW1iIHdoZW4NCmdpdmVuICNHUCBhbmQgaXMgZmFsbGluZyBpbnRv
IGEgdGlnaHQgbG9vcCBvZiB0cnlpbmcgdG8gcmVhZCB0aGUgTVNSLsKgDQpEbyB5b3UgaGFwcGVu
IHRvIGtub3cgd2hpY2ggb2YgdGhvc2UgdHdvIGlzIHRoZSBtb3JlIGRvbWluYXRpbmcgZmFjdG9y
Pw0KDQp+QW5kcmV3DQo=

