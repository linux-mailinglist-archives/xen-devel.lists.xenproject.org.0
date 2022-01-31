Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D04A4A48EE
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 15:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263125.455718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEXIB-0001uo-0y; Mon, 31 Jan 2022 14:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263125.455718; Mon, 31 Jan 2022 14:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEXIA-0001sK-TN; Mon, 31 Jan 2022 14:04:26 +0000
Received: by outflank-mailman (input) for mailman id 263125;
 Mon, 31 Jan 2022 14:04:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KqZ=SP=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nEXI9-0001sE-Af
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 14:04:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afe451f8-829e-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 15:04:22 +0100 (CET)
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
X-Inumbo-ID: afe451f8-829e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643637863;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=0esSsSEfh9yotDbMv+1IsMVYrHAcB2rEdPmUrXAH8EA=;
  b=SPDq9+CMl3cOv+2bm6i0VEaW9g9geCuTgIxy2B5X9Ri665EXr7o5xbVW
   cVgcZBbfAbjWaWSH6tKuL3I5syMNx7ZGqilX+emjfnJLczAlms5LucGtA
   yr3z2CmiombvF8o9dM/MjKLYMRNZYXQDWycdugreEHCVrPxvXRlMqBQy6
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9XwUEBzb0qU+Yn+dJ5UwZ1LpFcYrXhTpFqq18n+whc0ybXle0Oa6VNF6Yj3X1Bj1jfxmw0MLfP
 lJupnv2Zyj+/KNEQRRgwylnHQ2U3cBZFI0HoGhjlQE2tcp10BkTvtfD55/gmvLBu/PdGb7LusQ
 I6iHDqczXKYIB7dyfqclQ1TeInpKI/uRuv2ZXDp2VWyrlWPDP63wzR51GLq5WeFliF+cq3AYsM
 2DqBR20/XJmMbvu6lYKofyB8DBt0kAI092p1grX/hzWuEGJ4jcrJTbK4uzgya6sKA7kfQJ1buZ
 Kt7uWYQ7Vs1W4Fonyi/wgHUX
X-SBRS: 5.2
X-MesageID: 63131739
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZzuwZ68awy5Lnk8c2MgXDrUDbXmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 WJMWz+HbKyIMDHyedhxbNuz8U0PuZaBmN9qG1Zq+Xo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7di29Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhY0
 uVSt5WzdDwgO4CcpvoEFEEJPnhhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4VRK2HO
 JFIAdZpRDrmehlQYmVMMp0/27vxhnTnXQNdul3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9QvkXKoCGbv+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0csBgDO8z6zy2w6/5sziHHy9cHxMYd4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PeRECnCBtJ6sybp1qHHb5
 hDofODFtIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0leRc2apZaKGO4C
 KM2he+3zMUJVJdNRfQvC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhTcyBjW8iq+pMGHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2PopuyNXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:Ku8U+KwNhwoqvWbfKuxbKrPxiOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMcs1MSZLXXbUQyTXcBfBOrZsnLd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgOVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVN77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10DDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/gzd4dvfrWrCou
 O85CvIDP4DrU85uVvF+CcF7jOQlArGLUWSkWNwz0GT+vARDwhKdPapzbgpDCcxrXBQ4e2UmZ
 g7r15w/fBsfGL9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQlo+bo7bWrHAbocYa
 JT5QDnlYJrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd4AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlayXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wl9iif3ekOhlTRfsuYDcSzciFYryL7mYRtPiTyYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.88,331,1635220800"; 
   d="scan'208";a="63131739"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLcSTD6y/Mxpmc8F5JqJSfwt7+EeCvLVUiQcd65sPLwwn/RNJZeDtm6Anmd/EvNYR9MIz7B7Go1+tdm+yqAgfeIQ/4mMCJ7UQTsHGZ8S/CqcZNkj/QSyNil961e4G+D2TeYkkjjmzBWqtw/EQE+ShpIC+hF9ufR09B/RgSUhxZgcVstaDvEkXSC58J5QnRsyccU29U4tIAGgCQ1DQWeCYuLOdREagbaEss0hqTJ7IqFbNYgXweJPnb1EF4KgFQ1MpktHkFlaKRfbWDtCKSsjLzBg1D8ElFWxpWIzzDybXLuJO3OroThdcYiQisYvwLIMnk8POwXvNAafzuoXgAYc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0esSsSEfh9yotDbMv+1IsMVYrHAcB2rEdPmUrXAH8EA=;
 b=AuRS7phI68ArPCkOOtPSVAtdEWLg6TemAkISVBOnCrzg9NjdV4JUWr8t1HEeGvUHYo/jXWNlUhUIwjfHocxO7dLUKMsxe/9SnRuM1W3eM95DfHgylscdop/g6qW7+ovmDFZiebXAm7TbZrf+1bRqRTLnFPA6pOQeKX8NAfYx4utho4JW2kRjfnFWTkqTzznV2E+HTeN8FDNvr6PSHLT0qgAFfWD2WpC+MQscBEilqLCSDj7yUXeqBoGZZh58Hsq4YV52pPRxZX9/5URAQUGB6Fx/+BVswfPHqe/eCJmQssW2D+FKvumPDg8jiV5UNwLOma7JW5bWAoHJejOHMOOXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0esSsSEfh9yotDbMv+1IsMVYrHAcB2rEdPmUrXAH8EA=;
 b=fVnRMePlZWh5oSIFkEtYP7T52hJD4Z8VT26O7Kih4OYJNeuCuGLeT1Eff4VqO5mbsjgW/7IbZeCY+VIstxOLQgMFznZlr429wLI/upX4Dj0aNnLXihUaqzcplqvivd5Dgv107c78y371JUHCyQZdstg8BbvoHrB6497MK+TvBVY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Thread-Topic: [PATCH v2 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Thread-Index: AQHYFEsgduRKpPrES0uMVuwf+i5+76x9GvYAgAATUQA=
Date: Mon, 31 Jan 2022 14:04:16 +0000
Message-ID: <d7c4de19-1a4a-8196-e5a9-b68ef64701ac@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-8-andrew.cooper3@citrix.com>
 <a1e8e059-b3d2-1af1-ab68-0b94dcd34711@suse.com>
In-Reply-To: <a1e8e059-b3d2-1af1-ab68-0b94dcd34711@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2215e76-0929-425e-d299-08d9e4c29187
x-ms-traffictypediagnostic: BL0PR03MB3987:EE_
x-microsoft-antispam-prvs: <BL0PR03MB3987D45D5C2EFD54E096F7BEBA259@BL0PR03MB3987.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CxZlmbfSDstwtDlSMv2dAavUOrcGPYIuZmQhUErdvnNdvap+uSPegqd4gX14TUnoue0qrxLc09RBRMLk7anY81OvzuSCqfOsu6ubqvgF/ZE68nSfjR6n6wh7/ws+K31mG5kTMv1yT7znFgarSbO/+GoaX5n7l8FaBbifVbGUofZT4MjJNjvUOL+XW1eCR8/5KnKbn9jVHP9KOIUBOFAFqsRczzT9i8K3XEljOVz/p32R4hRQfkFJUhhYy99T+NyroUJTH/P7DfmDEn0LsbyEMEcGqpD5CzD1KtDIgTsBSKZVq/iolM9RNdnoEI9kkVrHDNAMi0NbnEI4eOpvQL7lA/sz9jYwHC3PMM+7ABOKDvYd/6uLHwAhvwDajLfsHmB+lvTYYkplW5gkLCT5zbyc3xnp1fUBGI7Xe2ZQoOVJM94qMho7lDB9Aj1uWdTqVjIBLDeAIhIjLscj1C2uRFqK+sBgch0sR7z4hHb0nYfAAecsm4WadzV1xpifZaLnbvHLS/4sXfhgEReXln7s2/cnK9gFSkDSvfYHwDLZ5nlIuaIc6Im6tDRFCcLq970giBYZH7ahPDRE5takzGe4ivy2kErwuDVOblrKF6J3ceaIVRuG02pFKDbGLiqh2rFUbskt4xmvMVMIFSOYnzBB71feryhXsz9SgeYMZcDn8JcichhJo/2zC5RF3VAK2X27EbtqtS9l4un3TSYcqh98X4baIGo1SFxAPgVePObnkih/PkKtQRs0pzeJA1lxlx//URKoDJuabAlN/lI8JcqTol4lJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(316002)(86362001)(53546011)(36756003)(6506007)(71200400001)(76116006)(66946007)(38100700002)(5660300002)(508600001)(6486002)(6916009)(54906003)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(8936002)(6512007)(31686004)(91956017)(26005)(186003)(82960400001)(2906002)(2616005)(38070700005)(83380400001)(122000001)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ek9vUlBGZmN0cTJRUEF4UFZlNitvMjN6eXc2ODFtMkxZY21kc2NkcWlKdE5F?=
 =?utf-8?B?bk5OZHVXajZNS1JkQ0dkWkdBd1IzeHNiMjd2SERzTWtqQjJObmF1SmtGckpa?=
 =?utf-8?B?Rk84TzBlakpHYjNPeDJZZXNINnRUM0RwejA5TTQ1c1pOcUd2ZEZrV1JMM0hK?=
 =?utf-8?B?SlNPZmJ0WXpEY2tIaGt3S21kUkFMM0l2N1Y2bEZhbnJFZWRyVVc2ak9iZ2hD?=
 =?utf-8?B?YlVmcERWK2o2WXBJOXhRTGlvVkExQ2hGSkpMbjNYTnZWbTMyTjhtSzduU3hY?=
 =?utf-8?B?VzMvcFBLSDMvWVRvamZScVVBUTRsejY1VXJqcTdvNE9tTFRDUk9hcS9LWXc3?=
 =?utf-8?B?T3RrQVNNWmROMHZ0b2ZQeFVRbWxrM09EUVVsd2NMcUhXT3lqWDlQTWx6eWZ5?=
 =?utf-8?B?SDlDUGQ5eE5vYitNZzZTVFUwSDVTT2lReDViandieml4Z0RFNDRneEt5SzZG?=
 =?utf-8?B?N1FLU045TjRSYkVraGJUQjJkTU0zd3ZMYXcwRjVTWCtJTDVPQmtSYVZYTkFs?=
 =?utf-8?B?YjZmdUlIdUtncC9iNmt3UGRNbWZxK2hlckxKUVNKYTRYekxrQUtqT21leTRB?=
 =?utf-8?B?M3pnbnhIVk9EdUdUUkVlRFFqay9rTFlMOW9jcmNZTExUd1lzT3ZkUko1OEpx?=
 =?utf-8?B?b0V3MWF0aWVwREJIS2pmcHl3bDNFS3Mwb3hqekttOC9jWVRXR3lIU0RJSEhG?=
 =?utf-8?B?c0plVlhwOFdsL044QzNqZmE2TjhyZUh3ZmNXQnV3K1ZaOE4zUkNSU0VPSmpH?=
 =?utf-8?B?VzNxbVBwYlFLM1pTSjJONjZndkh0dFE5OHc2bjVXNXFQbTdHZGZIZDF6UGpY?=
 =?utf-8?B?SWFGek11UFNTMUVESzBTWEdsSjl0T0E5VmFBeTBNbmVtZEVZSkduWVd2b1dX?=
 =?utf-8?B?bnQ2emt6SGo3ZkYyYnQxNm9Nb2QzU1U2cXN5SVUrYmlTemo1cGJZWXB4L3I2?=
 =?utf-8?B?c3gzbkNGdDk0SUNCS2xieSthQjFUTGdXMHVmaTByVklxTVJTbWZwWkZ6bEk5?=
 =?utf-8?B?TUFIdkRQWHo2cE1sT3R4SHVMMjZUTXFIL2tTc05FWExFZTBNcWVwYnJzNDAr?=
 =?utf-8?B?RWdsTzZ0SWlZTVhVdTBVQU8vTFJjMm42ek9lTUttQzg4QVM0OFlxNTBmUElE?=
 =?utf-8?B?NW9kU2ZEVWZyOG1hR2RJb3lCZHQ0MjdaOFJmRDREeTRNcThWU0FzN3crSmJp?=
 =?utf-8?B?SS9wdm5pcmZkU2hxTWdHQjFCWnpJc0FWRzNJYnlyK1ZrN3dteTJuVFpGZ3pI?=
 =?utf-8?B?MDdrcXEzYWc3N05Pc0lmQzhES0ppbGpWd1FiTU1jbEdhejVNSi9UMVowb05j?=
 =?utf-8?B?RHROdlFtc3J2TmNEc2owSnhGa3Q1KzdCdVE4dTdqb0x5SUNBWVRyVjNTbFMr?=
 =?utf-8?B?VVRrcENkZjNGWUtiNDZZOGFydHAvL24waXhxVVVwLzlXTUNDRnFNenpRNnlD?=
 =?utf-8?B?TTluMUVkRnhCYS9YS0Y0clRvN2JHL09mTGtkeVcyODJJMGZjVWN6Z2E3V0dZ?=
 =?utf-8?B?RHl0MkgyUUtldWhoQU9odmwrUmNwbUsraTFOS2U1aEJncHl0QzdEQlE5dmxq?=
 =?utf-8?B?aC9vRU1OYm0yNmNIZGVyaVp1SllxanhGVXV1WmV0aW1DdysrbmZNSWFhd0Rk?=
 =?utf-8?B?NnZPRVkwcTBqWGhzV3FPWStQOHVYekZxblE3K3dvSmJpUFZadDlyZG9waXEv?=
 =?utf-8?B?eG1ybzN3REFGK1lkVk5PblEweDhRUVV6RnFYWm9jMFpUdVdMZHRJbHJzeHFL?=
 =?utf-8?B?KzNxbVQxK3ZWTDFpQ2FSSkV1cjhhMnFUWktWVnhVYUNmVTl6c0xxVHY1OXNW?=
 =?utf-8?B?ZGlJSlZRTWE3U3VoRkFjcTdqSmplam5DVmR5cEVZRzhHeDJaOXJ6M1hzUStS?=
 =?utf-8?B?V1hPdkFaOWpoUDM1RHdJaTgyNzJTVEFRY1dTV3ArdkNja0ZaZDg2cTNvNDA1?=
 =?utf-8?B?dmFkSHlFQ08vLy9LY2NJWVdQWG9tTzZ1cFJkRjhBKy9lZmxYL0lzaWdyOWdX?=
 =?utf-8?B?eTJSK29UZ2VCazhNN09ZZmwzYzBLVlAwUU8xMFYzaDQwdnFEc1M2a1RtdHE3?=
 =?utf-8?B?UUlKcndJNkZQVEZnblhzNG43T2tqang2dEdKNG95QzlCcFBPMDJEY2JCYnZR?=
 =?utf-8?B?czFlODE5Mlh5Zk5aN1Ftb05rRlVNSGtxbzNBMGJCbWZGVWF2TDNXWUdwMXN2?=
 =?utf-8?B?aEpVLy9PNkJEenBHUEx6bTdCcEY4SytadW5lN3hPbUlpZU02QlcvWkdsSThu?=
 =?utf-8?B?R2hjQlMzZ3dHUzhLak5ybkk2NUxBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <85CEA16FDE881C48B95FFDA74A92A2D1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2215e76-0929-425e-d299-08d9e4c29187
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 14:04:16.5240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: itZuCzvezSdM6cLf0SUTvzazMew6UtHmky/s5+nZjotxvfNLpaJTe34haNekKZLEeO443L+u+SDYvtyCIW1BR81HJBpXMXEjpQ1qK+zHbdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB3987
X-OriginatorOrg: citrix.com

T24gMzEvMDEvMjAyMiAxMjo1NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI4LjAxLjIwMjIg
MTQ6MjksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2
bS9lbnRyeS5TDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9lbnRyeS5TDQo+PiBAQCAt
NTUsMTEgKzU1LDEyIEBAIF9fVU5MSUtFTFlfRU5EKG5zdm1faGFwKQ0KPj4gICAgICAgICAgbW92
ICAlcnNwLCAlcmRpDQo+PiAgICAgICAgICBjYWxsIHN2bV92bWVudGVyX2hlbHBlcg0KPj4gIA0K
Pj4gLSAgICAgICAgbW92IFZDUFVfYXJjaF9tc3JzKCVyYngpLCAlcmF4DQo+PiAtICAgICAgICBt
b3YgVkNQVU1TUl9zcGVjX2N0cmxfcmF3KCVyYXgpLCAlZWF4DQo+PiArICAgICAgICBjbGdpDQo+
PiAgDQo+PiAgICAgICAgICAvKiBXQVJOSU5HISBgcmV0YCwgYGNhbGwgKmAsIGBqbXAgKmAgbm90
IHNhZmUgYmV5b25kIHRoaXMgcG9pbnQuICovDQo+PiAtICAgICAgICAvKiBTUEVDX0NUUkxfRVhJ
VF9UT19TVk0gICAobm90aGluZyBjdXJyZW50bHkpICovDQo+PiArICAgICAgICAvKiBTUEVDX0NU
UkxfRVhJVF9UT19TVk0gICAgICAgUmVxOiAgICAgICAgICAgICAgICAgICAgICAgICAgIENsb2I6
IEMgICAqLw0KPj4gKyAgICAgICAgQUxURVJOQVRJVkUgIiIsIFNUUihtb3YgJXJieCwgJXJkaTsg
bW92ICVyc3AsICVyc2kpLCBYODZfRkVBVFVSRV9TQ19NU1JfSFZNDQo+PiArICAgICAgICBBTFRF
Uk5BVElWRSAiIiwgU1RSKGNhbGwgdm1lbnRyeV9zcGVjX2N0cmwpLCBYODZfRkVBVFVSRV9TQ19N
U1JfSFZNDQo+IEJvdGggdGhpcyBhbmQgLi4uDQo+DQo+PiBAQCAtODYsOCArODYsMTAgQEAgX19V
TkxJS0VMWV9FTkQobnN2bV9oYXApDQo+PiAgDQo+PiAgICAgICAgICBHRVRfQ1VSUkVOVChieCkN
Cj4+ICANCj4+IC0gICAgICAgIC8qIFNQRUNfQ1RSTF9FTlRSWV9GUk9NX1NWTSAgICBSZXE6IGI9
Y3VyciAlcnNwPXJlZ3MvY3B1aW5mbywgQ2xvYjogYWMgICovDQo+PiArICAgICAgICAvKiBTUEVD
X0NUUkxfRU5UUllfRlJPTV9TVk0gICAgUmVxOiAgICAgICAgICAgICAgICAgICAgICAgICAgIENs
b2I6IEMgICAqLw0KPj4gICAgICAgICAgQUxURVJOQVRJVkUgIiIsIERPX09WRVJXUklURV9SU0Is
IFg4Nl9GRUFUVVJFX1NDX1JTQl9IVk0NCj4+ICsgICAgICAgIEFMVEVSTkFUSVZFICIiLCBTVFIo
bW92ICVyc3AsICVyZGkpLCBYODZfRkVBVFVSRV9TQ19NU1JfSFZNDQo+PiArICAgICAgICBBTFRF
Uk5BVElWRSAiIiwgU1RSKGNhbGwgdm1leGl0X3NwZWNfY3RybCksIFg4Nl9GRUFUVVJFX1NDX01T
Ul9IVk0NCj4+ICAgICAgICAgIC8qIFdBUk5JTkchIGByZXRgLCBgY2FsbCAqYCwgYGptcCAqYCBu
b3Qgc2FmZSBiZWZvcmUgdGhpcyBwb2ludC4gKi8NCj4gLi4uIHRoaXMgbm93IGVmZmVjdGl2ZWx5
IHZpb2xhdGUgd2hhdCB0aGUgd2FybmluZyBjb21tZW50IHNheXMsIGFzIHRoZXJlDQo+IGlzIGEg
UkVUIGludm9sdmVkIGluIHRoZSBDIGNhbGwuIElmIHRoaXMgaXMgbm90IGEgcHJvYmxlbSBmb3Ig
c29tZSByZWFzb24sDQo+IEknZCBsaWtlIHRvIGFzayB0aGF0IHRoZSBjb21tZW50cyBiZSB1cGRh
dGVkIGFjY29yZGluZ2x5Lg0KDQpUaGUgYHJldGAgbm90ZSBwZXJ0YWlucyB0byB0d28gdGhpbmdz
Og0KMSkgUlNCIHVuZGVyZmxvd3MgZmFsbGluZyBiYWNrIHRvIGluZGlyZWN0IHByZWRpY3Rpb25z
DQoyKSBTcGVjdHJlUlNCIGV4ZWN1dGluZyBtb3JlIHJldHMgdGhhbiBjYWxscw0KDQpBc3BlY3Qg
MiBpcyBsYXJnZWx5IHRoZW9yZXRpY2FsLCBidXQgY2FuIGhhcHBlbiB3aXRoIGFuIG91dCBvZiBi
b3VuZHMNCndyaXRlIHdoaWNoIGhpdHMgdGhlIHJldHVybiBhZGRyZXNzIG9uIHRoZSBzdGFjayBp
biBhbiBvdGhlcndpc2UgcmVndWxhcg0KY2FsbCB0cmVlLg0KDQpPbmNlIERPX09WRVJXUklURV9S
U0IgaXMgY29tcGxldGUsIHRoZXJlIGFyZSBubyB1c2VyIFJTQiBlbnRyaWVzIHRvDQpjb25zdW1l
LsKgIEkga25vdyB0aGlzIGdldHMgY29tcGxpY2F0ZWQgd2l0aCB0aGUgUkFTWzozMl0gZmx1c2hp
bmcgd2hpY2gNCmlzIHBhcnQgb2Ygd2h5IHRoZSBiZWhhdmlvdXIgaXMgdXAgZm9yIGNvbnNpZGVy
YXRpb24sIGJ1dCBldmVuIHRoZQ0KY3VycmVudCBjb2RlIGNvbXBsZXRlcyB0aGUgZnVsbCBmbHVz
aCBiZWZvcmUgYSByZXQgaXMgZXhlY3V0ZWQuDQoNCkFzcGVjdCAxIGlzIGEgZmVhdHVyZSBzZWVt
aW5nbHkgdW5pcXVlIHRvIEludGVsIENQVXMsIGFuZCB3ZSBoYXZlIHRvIHNldA0KTVNSX1NQRUNf
Q1RSTC5JQlJTIHRvIDEgYmVmb3JlIGluZGlyZWN0IHByZWRpY3Rpb25zIGFyZSAic2FmZSIuDQoN
Cg0KVGhhdCBzYWlkLCBJIHN0YW5kIGJ5IHRoZSBjb21tZW50cyBhcyB0aGV5IGFyZS7CoCBUaGV5
J3JlIHRoZXJlIGZvciBvdGhlcg0KY29kZSB0byByZW1lbWJlciB0byBiZSBjYXJlZnVsLsKgIEkg
dGhpbmsgaXQgaXMgZW50aXJlbHkgcmVhc29uYWJsZSB0bw0KZXhwZWN0IHRoZSBpbnRlcm5hbHMg
b2YgdGhlIHNwZWN1bGF0aXZlIHNhZmV0eSBsb2dpYyB0byBrbm93IGhvdyB0byBzdGF5DQpzYWZl
Lg0KDQpJJ2xsIHNlZSBob3cgaXQgbG9va3Mgd2l0aCB0aGUgaGVscGVycyBpbmxpbmVkLsKgIFRo
YXQncyB0aGUgZWFzaWVzdCB3YXkNCm9mIGZpeGluZyB0aGlzIGlzc3VlLg0KDQp+QW5kcmV3DQo=

