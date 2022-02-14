Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F34B5556
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 16:51:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272478.467339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJddE-0004ce-Fw; Mon, 14 Feb 2022 15:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272478.467339; Mon, 14 Feb 2022 15:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJddE-0004Zg-Bh; Mon, 14 Feb 2022 15:51:16 +0000
Received: by outflank-mailman (input) for mailman id 272478;
 Mon, 14 Feb 2022 15:51:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qPn=S5=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nJddD-0004Za-2T
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 15:51:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee93e8e9-8dad-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 16:51:13 +0100 (CET)
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
X-Inumbo-ID: ee93e8e9-8dad-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644853873;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=SutkJp7Qv/FDXpdgLjdOfRBoEWD3vzIg0+w7gNS0eCc=;
  b=CmXgbsBqjHjujRy9VOLudxhiNK6tlM/8/lXsARPvxXlTJBBUAhVnVtmB
   V/Spks1F62ChtswPm3TCRlOr6IXmcOUlUVw1E/sDtBEu+DuiWis1LOcRD
   9xg9R3p8T+T3RyyN/2CZmIDJq0+f7PeI9wt8J3GQS/W56qHNh1YHa/2pX
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fNdyoszFqYwiESmChKSeIYHQwwAw0WY75x0Nm0wgsEFsqVmiIqmm9HEBMVakEM7fb7lE5gmhr5
 N35uXbiopTAK7pEMHEl0vLAxUKlmIpId/C0qixxfsP0QAWRHUhlIm4qFrQ97kimITX8luxSK6Z
 8urIHWjxl/AAViv62ynzwWxbKc1h/rQ0Ejn7E0kY85QrzjkOxVob6q8JzvSOufkR6meUZxP3Xa
 Tm4lWJztQe1t380vu8spov2KGRz9Rv3SE2kHp5p9JKXo5hrlovytW9XnLaOWZNB08P/UhnRzpJ
 dnIqqGul9cVBcae/IUgd4t4t
X-SBRS: 5.1
X-MesageID: 64166197
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TsiRqa+R8wYioEUIcmlaDrUDyHiTJUtcMsCJ2f8bNWPdYAuX7wSz/
 BJcAD7Ya7vPIDfrKpolWDmFhUkE6sfTx95iGQJu/CAxHy8V8MGfD42VIkyrZHjOJJefQk5ts
 ZoVYNDOIJxoQiOB9xz1POm6piQljfDXGLStV7Ks1kydPeNBYH5JZUVLx75p6mIRveWEPu+th
 T/Ti8PTYQCsh2EoaGlE56zZ9Rk/tq2jsmxG4wcyPapH5w+PxiUZVJ4RG/q8fiDyKmV28k9WZ
 AphIJWRpD6xE8IFU4v9+lrDn8ljrof6ZWBisFIPM0SZqkUE9nxaPpoTbqJGMx8N0mnRxbid9
 f0W3XCOYVZxVkHzsLx1vylwS0mS6oUfpdcriVDm2SCi5xWun0nEmp2CP2lvVWEswc5lAHkmy
 BAtAGtlgiZvJQ6B6OnTpuFE3qzPJSRwVW8VkikIITrxVZ7KTX1fKkljCBAxMDoY36hz8fjii
 8UxUDxkURrQT0B2FnATDc8yoKSNln3jWmgNwL6VjfJfD2n7yQVw1P7mMcbPe8zMTsJQ9qqaj
 juYpSKjWEhcbYHBj2remp6vrrancSfTd48VDrK1sNJ3hlma3kQYCQEMVEv9qv684qK7c4wDc
 hJKo3txxUQ03ECFRYf4dhvmnFCv7zlHVNwOE/Ir8DjYn8I45C7GXzNZH1atcucOq8seVTEsk
 FiTkLvBHTVytJWFRHTb8a2bxRuQEyUIKW4JZQcfUBAIpdLkpekbnh/JC9puDqOxptn0Ai3rh
 SCHqjAkgLcehtJN0L+0lW0rmBr1+MKPFFRsoFyKACT1tWuVebJJeaSR71Pm4+Zscb+1aV2E4
 XQ42O2O6PwnWMTleDO2fM0BG7Sg5vCgOTLagEJyE5RJywlB60JPbqgLvmggeR4B3tIsPGawP
 RSN4V85CIp7YSPyBZKbdb5dHCjDIULIMd3+Hs7ZYdNVCnSaXF/WpXo+DaJ8Mo2EraTNrU3dE
 crBGSpPJSxDYUiC8NZRb71DuYLHPghkmQvuqWnTlnxLK4a2an+PUqsiO1CTdO0/567siFyLr
 4oAZ5vXlk0GC7eWjszrHWk7dw5iEJTGLcqu95w/mhCrfmKK513N+9eOmOh8KuSJboxel/vS/
 2HVZ6Or4AGXuJEzEi3TMioLQOq2Bf5X9CtnVQRxbQfA8yVyOu6HsfZAH6bbiJF6rYSPO9YvF
 KJbEyhBa9wSIgn6F8M1M8Wj8tw4KUjDaMDnF3PNXQXTtqVIGmTh0tTlYhHu5G8JCC+2vtE5u
 LquykXQRp9reuioJJy+hCuHwwzjsH4Dtvh1WkeUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxSu45za8369b1iaVdywBoQCfCY1ixU+syKXiax8hf8KZKw+YB6wexX
 0uO/PhcOKmIZ5y5QAJAelJ9Y73ah/8OmzTU4fAkG2nA5Xd6rOidTEFfHxiQkygBfrF7B5won
 LU6s8kM5g3h1hdzaoSajjpZ/ninJ2AbV/l1rYkTBYLmh1Z5ylxGZpCAWCb67IvWNodJO0guZ
 DSVmLDDl/JXwU+bKyg/En3E3Ox8g5USuU8VkA9edgrRwteV1OUq2BBx8CgsSlUHxxpK5Ot/J
 2x3OhAnPq6J5Tpp2JBOUm3E99ut3/FFFpgdE2c0qVA=
IronPort-HdrOrdr: A9a23:+pwM8aNgf+d7+8BcT3b155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjzjSWE9Qr4WBkb6LW90dq7MA/hHP9OkMYs1NKZMjUO11HYVb2KgbGSoAEIXheOjNK1tp
 0QPZSWaueAdWSS5PySiGLTcrYdKZu8gduVbI/lvi9QpGpRGsVdBnJCe2Cm+zpNNW577PQCZf
 ihz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYqYLSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzRPBky/JlaQkEuDzYIbiJaIfy+AzdZ9vfr2rCpe
 O84SvI+f4DrU85MFvF+CcFkDOQrwrGo0WSt2Nwx0GT+vARDQhKe/ZplMZXdADU5FEnu8w52K
 VX33iBv54SFh/Ymj/hjuK4HS2DBiKP0AsfeMMo/jRiuLElGfRsRE0kjTdoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4Co+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QS+vCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx96R6svM7z54HRmyGG+fIyNZ0Wb9igF3ekLhlTVfsufDRG+
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="asc'?scan'208";a="64166197"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hT77ElbcZt4pb34RSUmYpEogL6/NGtnyhR30LMDmR5pK/2VN48UuKAVkcrvTwny0S61qr5CEIAtDp46lBDuu0TnjxHEYC78LJN5URz5IG+OABs5A8QQJUKiDgflyDXvB+dVXj4RCmxZhhLio0si4NXjo1bZHN69EAXv0XuMGM0c0An9j60Yt7V3YvoJLk+nMjm4MDsob2UibfnOUiPwsdCRyQsWyoV5Z+RaTiZnzBCcA/PhmeUJBXjMPYtXz00pHQLRFv0bRHNzpQXScrzvSyGXJ1CrhBvYqOkqziAGXOAzPWLFp6ffz4ZXc2PJ3c3RQXP9+ubwNwC1i15a5hRUnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elGlQAlg7fDvn4dAf9FrCnXLqY4nvIZCa8gxQpkBw7o=;
 b=VBjhgJ5suRnqDbkfhGTl3XaskzUGJofSOZ7WtNC1cMoYwJVRS8PLyt1bPINPMR9g8ltUjSV1iC3GHJaGcCEKxzwg3vBbiBVuLT5tZzEVRIyh6/mdZasqgfMkh3rPNC8C55/b9NGM9vQUMjfIgezL/eyaqeqveIl7ejfksLXib1itWH9mY/mvhQRGNpAGykE2DPqauq6XXelApnZmhLJqWp7xFtMBfj2bSQ5MOGL1AsM1EfbbOIDO+eqfj+0GbleH1OK/RsCVBjc7isoyPuvKjt2nmONPAw9LKAmIa0klEJlyB+W5uVzG/Tjl+nEa6t/xutIXguPEABhmqEUrHQTmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elGlQAlg7fDvn4dAf9FrCnXLqY4nvIZCa8gxQpkBw7o=;
 b=vxz4zSgkA5kdLfYYDQd4gyO2KOwPwElvr3hHsAC0nk3sAGgkOfXNpLf308fLpFJLKxwLEiwqEVKDJ5pEbosQojwYbksk6Lpd9e+UMSVRVWqCpZ2RcSz8IQfaOTESNGQo08rj9h33hxsH74UTI/0oE3z1ozLm3ya8bWvsyphiNCU=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 16/16] x86/P2M: the majority for struct p2m_domain's
 fields are HVM-only
Thread-Topic: [PATCH 16/16] x86/P2M: the majority for struct p2m_domain's
 fields are HVM-only
Thread-Index: AQHXcbkF3MFLz+cgi0ab+9TF9ViU86yUkeSA
Date: Mon, 14 Feb 2022 15:51:03 +0000
Message-ID: <EFFE5241-CB1D-4173-87F9-16AC428902F7@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <e5362b33-0f5b-ba2b-d033-ca0a09e5fd54@suse.com>
In-Reply-To: <e5362b33-0f5b-ba2b-d033-ca0a09e5fd54@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9e6d844-2197-4666-c0ac-08d9efd1ce79
x-ms-traffictypediagnostic: SJ0PR03MB6674:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB6674D81A1EBA4129460ECCCD99339@SJ0PR03MB6674.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CQhLzy+VYu9CTSyysB9kBPZ2aFn48lF13KwSkJBCaVjJhVuu/Ttvve1FafebvDWJW/1vkPzPFdNIiaiKWBGNcYB0yZS6zomrXyOQRi/WBtjCVx6CtUmvnmainm6uax5U4Sb3YYeq4oY3UXygeuOv7g941tZJHvmpK4gTbO7348mqw8Yl4/k4pHETDhV0pynM9itPXAenUPb4coQU/mx61kzC/2H3DkGbXfrffIweOUwRGUNbYkqN4V8l2RftpQo5VW4MRZUazEb4iaaT9940KxOCw6MVteVvWKjHxQyzdkGZG7O8Jf0x3kehYRLxW5wiEyCLNF3N+vC34ii1eJ+UenJP9B/C1VaBGzE4Iq2E9Wbe9N0C+VunoaYofD42qo0L17dY0fKK10E9aLcDJFS/h6RBzgJP7VoLLvidn4XqsNS4k3uoNcFRFeanZwzaGF3kDxqCSRNUtGWVxbmRS5YkxDQmc9wBZslpIP4pyFpyJ1ZLQz7zsBGE/jb6SUnylHwjSUOVVqGUKC1m+erzutTD3HGByiSmyFV9/T10DPSfKdkwH7sW6U1X8ViVvtfsMl65bXKcb71yVKH0MmSXWSbLPc86TXr/mVI8ZX4L+GS1aqVcoldhvDUWUs3HcZv96QVjQQHZcsDpn/roeH50Wove2IRNkjJ1mwh6zcotfnqIuKNDHhfo+m9GfTyMMY6f4sMve/GUX+ei+LcoDE3rCITsxBit5mCuGg23W+tGWuuTtn2oOM9yOzGNa7nsKjnNPyaB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(99936003)(86362001)(38070700005)(66476007)(66946007)(8676002)(4326008)(66446008)(64756008)(76116006)(66556008)(82960400001)(54906003)(91956017)(6916009)(316002)(8936002)(5660300002)(2906002)(2616005)(186003)(26005)(83380400001)(508600001)(6486002)(53546011)(6512007)(6506007)(33656002)(71200400001)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGYyN0ZmWUIxODg3dG0ydlBiZzdhZU04bWozNjJqMlN5YmlMdEQ4VVhwN1Jz?=
 =?utf-8?B?SFMyT3E5UWdwVllkZzB0RGkyZkxUWkFtaEhDR1VRRzdaL1phck03VHpyYUVj?=
 =?utf-8?B?bGlGMU8yYlJ4UTRmcXFlWnF4V2N6VzlzWnFybXZUNGIvdkF0VGJxSk9NZHI4?=
 =?utf-8?B?b3pZRHA3c28wTGhNMXFaYndmRk1ZRElEUlViSVNYU1Z6dkRlZUJQZ0lZZ3BM?=
 =?utf-8?B?Y3dsZ1F1UGdZVldMT01PZW0vRFBGQnY4bzFVcEIrUXVSbzA4emI0SmxaRGEy?=
 =?utf-8?B?TnlGay9JRS9ockQ1YzQxRDRPNUd4MEduWWphak9oVE1vUHZRYmlRN3NTcFBr?=
 =?utf-8?B?Sm5WYnZzMEt2Q0toMTkzQ1I2Tk1XbmhFQ2c5RS9DVTM0VmIrekRtWlRCT3Fa?=
 =?utf-8?B?SmNyY2FIMlNQUHZkbXl6NnMxWlJiKy96czJsNXdOa0dndlZnZjg1YTk4bjQ2?=
 =?utf-8?B?M0ZMTTcvcVEvOFBPUHlKNUhOODQ2NDZsVGVSc21UZDcxYTNGSmV1ZC9LSERQ?=
 =?utf-8?B?NEhzYU85eVNVcjA4VjlEejlTRCtnUFZyT1NzeDlULytzUlVjamZkR1FZM0lj?=
 =?utf-8?B?VnhoNUZpSGpJWFpFQmltOGRibGlpVkFsSDhseE5nYkZxUlloSnl2NHNjcHZy?=
 =?utf-8?B?alBrR2dsTnNQQ1dRODhpYVYwejB0NlJBeEZDVzM4ZCtLQi9ZeHhMMDFzK3ZB?=
 =?utf-8?B?MTh2NzdPcWRCdnN5ditZU2tPSGFYeGxjMmVFNHBwak8vTUJRL1F5c01pSHND?=
 =?utf-8?B?bGt5Vmp1VnF0VUhwSlY3REtjakF0UDV3WjBtR0dZY0t2ZEt1TGFuM1NhY0Nn?=
 =?utf-8?B?cUtkLy9hNmcweGgzUndnZFMzYVN3MUkzOXRYZWlQRDUxV21DUmxxdE9HRk1v?=
 =?utf-8?B?RU9TYmltbDFtQ1l3UjRoTEJJaTVIUmUrdVcwSzB6MXhlT2VaREpON1Z2Ullx?=
 =?utf-8?B?YXQzVnI4aGRkMUo0OEQzTHE2YnBsclRqelUrdCszck5hdWY1QndPQVU1VGN1?=
 =?utf-8?B?R2d5cmErME8yN0VEOWpXbWs4SS9SdEpSZDBYOU9KRDlhdG5QYVc5cmlmVU1K?=
 =?utf-8?B?ZU5ib3pGYVpQT1dMQlByZjhyL3pzZmkzbUZXRmoxWHhRZThBTDdObTVZSFRX?=
 =?utf-8?B?Yk5zY2V5c1BTTGdVZU9TR2JWYndyMDBvMEpDalYwT0NTSDFHbHFtS1V2SHdj?=
 =?utf-8?B?OE53eU14eCsrVDUwUkJ3Nm10QzB1T051TEhVOGlnZEViMitPRFhuZFBWUGVU?=
 =?utf-8?B?d2QrMmdoK2YzY0owRTFRUG5mN1k2aTdIUWN5Sm9hRjV6aytOZ1g3TzdzeDZa?=
 =?utf-8?B?VThneFpmOVZCT3lzN3JWdEJWaUtsdnpmaVF6d3V6dXJZcTJBUnlHUUdFTVlP?=
 =?utf-8?B?TTUwY2RIczg2WThWNmo2YWFoZmZmOUVFcjJib2FOTUtabDRMNitFRU0zQXVY?=
 =?utf-8?B?SkQrLzRENDhORzIrRHk5M3VEbElEdGpWNFYvSnNGbGtrcW1NNFhibnd2dFAv?=
 =?utf-8?B?NmRZS0p5clJwd21icGdVMlBuZXdpVEcxdWd2QUd6TXhJYUZvSUd1L2FxUWlC?=
 =?utf-8?B?VXFlYUNETjVrbUpxWjdURWNsMnFTcjlnREZoaGt6dUpXVUZHMUt1c2NMTWl2?=
 =?utf-8?B?Q2VnMmJoTjhjb0hRcHRNTkVQL21OV1g0bnFEU1FkZ1I0MXpGQ1RRTys5QSty?=
 =?utf-8?B?SnU4bFVJVk1VVk9wWGxWM0l3d25TMmFBZUtmdW1LUHJ2NDhxMmgxWlh3OEFt?=
 =?utf-8?B?ZUxFQVZDUWFlaEdadGhnc2tpbG9KRVRWWDVnWkI1Q1ZzNk95R0dkN0pRK3lv?=
 =?utf-8?B?bVJXMEJHUDMvZ2N0Y010Rk1xOTJWeXhQOW5DM3pJUEo0WEVZenNkcjFsVzFL?=
 =?utf-8?B?T1BZdlM0eWNQUmh6SmNlT1hFd2hoM3FGN1hOZWZ6NFRsOVVJNXcwUEFJS2pV?=
 =?utf-8?B?cUVrQzVITVB2bjJOQTRTTit4cHdyQ0ZDaG4xQ0JadUsrYkdIbThRcW12MGF2?=
 =?utf-8?B?UGRTWU1TOGRNNk04U3lOb3VsczFlOUFPY3Y1ak84WGZQQm95Q0M1Y2ticmVo?=
 =?utf-8?B?SkdRVjN4a24wZkZCamdpckx2bVBSSEk0QllFZFBRT1ZKMzB2SzRsRms5TlRB?=
 =?utf-8?B?OGZnUkhRY3JXbDhmZ0dLSVpRUHdzbWhuL3FoRjZYNjF1dDlZdjJNTjg1blN2?=
 =?utf-8?B?WWptYVg5WWU2TFhMelhFOEViOWFsRXdtK2p0c1oxd29PRWJLTkwwTzdheWw2?=
 =?utf-8?Q?jB0pR6JyovR6QwVhulrDNCNMWZ2Yof/gvWER7CaWgM=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DA9CCC71-8509-495F-B26E-01E6C73B45DD";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e6d844-2197-4666-c0ac-08d9efd1ce79
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 15:51:03.9831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RzvRjmEV+/SSzvTWT/X7SKrs9NaFZ+B3kEavXJSDjPxG7j+b4LjZfhroDXhPsTua289Mzw3fCZH79kzxI2kBANeUqNBHldOslvwl6Uoreu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6674
X-OriginatorOrg: citrix.com

--Apple-Mail=_DA9CCC71-8509-495F-B26E-01E6C73B45DD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jul 5, 2021, at 5:15 PM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> ..., as are the majority of the locks involved. Conditionalize things
> accordingly.
>=20
> Also adjust the ioreq field's indentation at this occasion.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: George Dunlap <george.dunlap@citrix.com>

With one question=E2=80=A6

> @@ -905,10 +917,10 @@ int p2m_altp2m_propagate_change(struct d
> /* Set a specific p2m view visibility */
> int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int idx,
>                                    uint8_t visible);
> -#else
> +#else /* CONFIG_HVM */
> struct p2m_domain *p2m_get_altp2m(struct vcpu *v);
> static inline void p2m_altp2m_check(struct vcpu *v, uint16_t idx) {}
> -#endif
> +#endif /* CONFIG_HVM */

This is relatively minor, but what=E2=80=99s the normal for how to label =
#else macros here?  Wouldn=E2=80=99t you normally see =E2=80=9C#endif /* =
CONFIG_HVM */=E2=80=9C and think that the immediately preceding lines =
are compiled only if CONFIG_HVM is defined?  I.e., would this be more =
accurate to write =E2=80=9C!CONFIG_HVM=E2=80=9D here?

I realize in this case it=E2=80=99s not a big deal since the #else is =
just three lines above it, but since you took the time to add the =
comment in there, it seems like it=E2=80=99s worth the time to have a =
quick think about whether that=E2=80=99s the right thing to do.

 -George

--Apple-Mail=_DA9CCC71-8509-495F-B26E-01E6C73B45DD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIKemcACgkQshXHp8eE
G+0urwf9GViBDvq31ulAtAiWYI1CE7s9lNziWwfGSj84E1OaPvifdE4eNphozrqL
H2EQ/QaWfsZr00YhuJfN8RAw0CIBkFpIN7d/iusJXltugBS3A38khRSp9FRGiSFN
3uKf9nLjVK4p+JLwqnT9KxOC38lyOfvLXCgOT0RQ5mjAS+Oc35fUgG2y0EuiSzd4
Dx4MadPN/6ynmHLHU3Bw1oQntPTuaYl82/IKNZSYpOwObpbraDHUfkMzgAEGSSZI
aWnn6Aw7i1hXRDhjmkVIQlptA+4smM1/hKO67G8E1DO8wWna4YTdLpXYRN5S2pO5
3kEzbrI8qc/SPNKOgSJrUPgXr9MOiw==
=SXMk
-----END PGP SIGNATURE-----

--Apple-Mail=_DA9CCC71-8509-495F-B26E-01E6C73B45DD--

