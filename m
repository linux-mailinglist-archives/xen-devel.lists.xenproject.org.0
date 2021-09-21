Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34F941393F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 19:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191843.341960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSjvb-0004DI-Ky; Tue, 21 Sep 2021 17:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191843.341960; Tue, 21 Sep 2021 17:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSjvb-0004BV-Hk; Tue, 21 Sep 2021 17:51:35 +0000
Received: by outflank-mailman (input) for mailman id 191843;
 Tue, 21 Sep 2021 17:51:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QjZ+=OL=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSjva-0004BP-HY
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 17:51:34 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec0e93ad-c7f1-452d-b2c7-eefa4c88dc38;
 Tue, 21 Sep 2021 17:51:32 +0000 (UTC)
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
X-Inumbo-ID: ec0e93ad-c7f1-452d-b2c7-eefa4c88dc38
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632246692;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=flGLSCuWczAnpB2wymbe+X+ZNSzpuwgVrl9APoZYs+I=;
  b=WKJyV/kwB7+skz9hbDxosBF6w8cEPPOlflUzSgBLk357z8DOlbNHVKc8
   eSXWfxYeMGWqQQyXgPmXPHEKa8TZ3Z5/3H2eNRr8ptyv859accxvJYlVd
   DadxdGvd1aKfO3gnwYp1KBrSyhnP9sCKuhi94XKC2661fjp4tf48euAqK
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KqbLzqBhpEPFOZHmiscBjdJa5b3URDtanGTW7cWiXR4cNO4OiOHjKF8VL9isgpgOcrRAMJ2/y1
 bZU+izv0vSXyLy6pVVFy8rm7Zz1hQ6xT7jDYrZKmWsWj1tAPEhhp9Ga4jjJvz97yvQDg8B65aL
 YjpJz5vpUitof3D+vmb1a94uThnpbyEpoSIFjD/SO95w58UpdKEwXA1Dg4ktxqym2yHP8RkRoA
 SICFvhNhFXi+GMVnm3HJXnSHmmukDc18QY/1zU36hgHXSqp5G94m5zTTqxIhIJ2d8q5UIJuSPK
 kGCdw80wOl8nhmIad6k6ev9q
X-SBRS: 5.1
X-MesageID: 53241365
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uzKuOaLD9qFHvHvlFE+RUpIlxSXFcZb7ZxGr2PjKsXjdYENS32cGz
 jEYXzjSa/iNNzOgctp3O9vg8h8AuMTRz4BkSgtlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZ0ideSc+EH140UM5wrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Zhdk29
 OVE7aaTRB8gLofrxvsYbwRHRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpr3JwXRqiDD
 yYfQQtBbznQcjBlAW1JOqolruSZplijTxQN/Tp5ooJoujOOnWSdyoPFK8HJc9aHQcFUmEewp
 W/c+Wn9RBYAO7S31j6t4n+qwOjVkkvTWogfCbm5/f5Cm0CIyyoYDxh+fVqko9Gph0imQdVdJ
 kcIvC00osAa8UGtQcngdxa5uziZphMaXZxdH/BSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsqCRSH+b3qeZq3W1Iyd9BWMMbCALTAwB4vH4vZo+yBnIS75e/LWd14OvX2uqm
 nbT8XZ41+57YdM3O7uT7UrOxA6cr8DzbQMt7xX9eTy66z9ke9vwD2C30mQ3/cqsPa7AEALb5
 Shax5DHhAwdJcrSz33WGY3hCJnsvqzcYWOG2TaDCrF8r2zFxpK1QWxHDNiSzm9SO8AYcHfCZ
 EbJsGu9D7cCYSP3Mcebj2+3YvnGLJQM9/y+DZg4jfIUO/CdkTNrGwk0PiatM5jFyhRErE3GE
 c7znTyQ4ZMmNEia5GDuG7d1PUAXKtAWmjqIGMGTI+WP+ruCfn+FIYo43K+1Rrlhtsus+VyNm
 /4Gbpfi40gPAYXWP3iMmaZOfA9iEJTOLc2vwyChXrXYeVQO9aBII6K5/I7NjKQ/zvwJyb+Xr
 i/iMqKaoXKm7UD6xcyxQikLQJvkXIplrGJ9OiopPF2y3GMkb5rp56AaH6bbt5F+nAC65fIrH
 fQDZeuaBfFDFmbO9zgHNMGvp41+bhW7wwmJOnP9MjQ4epdhQS3P+8PlIVSzpHVfUHLvuJtsu
 aCk2yPaXYEHG1ZoAvHJZa/91Fi2p3Ucxr5/BhOaPtlJdUzw24F2MCit3OQvKsQBJEyblDuX3
 gqbGzkCouzJr9Nn+dXFn/nc/YyoD/F/DgxRGGyCteS6MizT/2yCx45cUbnXIWCBBT2soKj7P
 Ldb1fDxNvEDjW1miYskHuY517866vvuu6ReklZuEkLUYgn5EbhnOHSHg5VC7/Uf2r9DtAKqc
 UuT4d0Ga66RMcboHVNNdgooauOPiaMdljXItKlnJUz74Gl8/aadUFUUNB6J0XQPILxwOYIj4
 OEgpM9JtFDv1kt0ao6L3nJO6mCBDn0cSKF25JgVDbjihhcv1lwfM4fXDTX74c3XZthBWqXwz
 uR4WEYWa2xg+3f/
IronPort-HdrOrdr: A9a23:DCl5uq6zzzaENZYvzgPXwV+BI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXZVoMkmsiqKdhrNhQYtKPTOWxVdASbsN0WKM+UyZJ8STzJ876U
 4kSdkFNDSSNykLsS+Z2njALz9I+rDum8rJ9ISuvEuFDzsaD52Ihz0JezpzeXcGIjWua6BJdq
 Z0qvA33AZJLh8sH7qG7zQ+LqT+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+uemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lgdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNwN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wmJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABOnhkjizyxSKeGXLzAO9k/seDlEhiXV6UkWoJlB9Tpb+CRF9U1wsq7USPF/lq
 z52+pT5ehzpmJ/V9MLOA47e7rDNoX6e2OEDIujGyWUKEg5AQO4l3fW2sR+2Aj4Qu1E8HMN8K
 6xJm+w81RCI37TNQ==
X-IronPort-AV: E=Sophos;i="5.85,311,1624334400"; 
   d="scan'208";a="53241365"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxKD7uWNY87koeu5wl3r4yoqGJydEK7Ib9TD3sf2BLiYN2myqDA3f8TuJv359lsme4GEzyFVun1nATsYtp6ZOLzmcMq388XUjziuPHAVPs4PBT7QwrrSKMWvA5lHT6SNtWt+g5nEzS/fLgX8afRYTcbEcaosOTMSHo8ZOrF4QE4M7g+h5PvzzKpS9amtsWdKtP8YIn5lgZUlY803sBV+UBfPP0fb+l17BE6FzCO0e6sGZNPgbYLxovIqg0DjC+fAVEXvgUEoCgW4REFx/yN3dgMIkceeAoNz8CmjrkZQ7ZW/Wm1mOqjBWzpRLyODP4BQAGlbRCctOLmv1UNQy0NkOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=K96rXa87K4HaHxHM6TIZjQQ6d9h87yfh/rTKv1iNmJE=;
 b=n5N7j7Qfc/OIW8pLYNWEubmobmEJd8TsJ0efBFav9MS8OeNP3DtkMs0TVX9WOE8lNwQWX7joIFgOsiQVe4+KKp1qCk/FBIjQr5NHT/8jm2KfLyy3VsrnMrhIEeSuxBb6Rp6BNkDBouRUwPHRRuqRS4EFSvVocLCpvfRlxLtHOah9ggCczOi+gDsa8XXLWlkWH/nIUjgJAwExc6k+sqKME4zyKrPmoBeXJEdsHn/iRW0MNljoZHE+dWYX+f+qm/H39IrGBUy3qCzwTdSngR7D0Xhsm5irAU3rLwVjDfI+7Qkvxd65HPKydUQdh4PrpDIfLS2DDVxIu6c69gkp8kB7Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K96rXa87K4HaHxHM6TIZjQQ6d9h87yfh/rTKv1iNmJE=;
 b=NHr6CzNqlvgCKW8MYIJ4i3Ice49ylDoQgLwEieq47AeyWueoQNla8tYEmQvpgeWrLND0oldrb7bIQgrFwlqIxPzQZnbiS/H7izl6DTa0Uva3J/Txa/sFsAj1HCWNUn88DYPYVFitv4KfIeykPrJDI0wBQrfNbyl+RNb7d//CM9w=
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-2-andrew.cooper3@citrix.com>
 <731e3474-77bc-b11b-41ca-5dff57831264@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 01/12] xen/trace: Don't over-read trace objects
Message-ID: <171e6f01-63cc-e453-7268-1bf2ec6fe7cf@citrix.com>
Date: Tue, 21 Sep 2021 18:51:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <731e3474-77bc-b11b-41ca-5dff57831264@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0424.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae12b132-7b06-4256-0faf-08d97d286f94
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6271:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6271D7CB77C92D11C5674473BAA19@SJ0PR03MB6271.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqYag20tYqIPR2GgCTL49+uFsTZQ+f3vPPc8Seg/qpaX/51+yb6to4JeOb1gIw4Ota+A9gWRFo/Xn7/azApWBZ40IXJOSjArRUF2N9MB3kyjMw79T98TBRzsli2hH10jix4yDMG5JKMzNmZRgGjm+PM5rM6fl5E5CaCkL5arZF5L4U/A8CbenfY4FVzasSErp7QFImLw68xy3WIytZYXJf6vOpSpmxtmrcyYpEMf4+9vX3orbdT9M93p1FGBMDxRUvcU/5SU0lRCBQ9MtiyhXmXpHS//gqh6kmiHj83/MO1JBf58E6VcTsZ7ofoSL0+R4k9wrM2CmyJ6KggvXsxgsaPfEZZbAAS/HW4M02DQElkadEUPE2Kv6+MaQmZXuof9A1tKc9DC82DIy+N5EtdTaj9sQ+MJ5QzH07Nz04+zadWzapQv/EieM7u4pmtsiAzM5tGiN9zTK2MM0fAwIvvDCFNCX7pcLVyr3VFuVqZmOURsck9QQlGDUhRKWncWZgC89U6Uz8CKEaSR8JccjlUhAWOoVHcKJnqCFiVNkSDJLFqdsnAduOQe4rshchwhR9CNqjNGSp71LiytpPLsQ8Oatu5UiuXIoZIXNTgMXSjqDb6Nf/6+/iEix/fXE6ULRoobsJiM7xRg+GPSfhkChw6EjBGjcU+O6WlLV10QzTlZy7bCbZSv/D6C0cENqn9V/iA53dt1qdCQlO82MszUs8leS72hrH0VDVKUMSyNeCfS3As=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55236004)(508600001)(6486002)(54906003)(5660300002)(86362001)(6916009)(31686004)(6666004)(26005)(186003)(83380400001)(956004)(31696002)(2616005)(53546011)(66946007)(16576012)(66476007)(66556008)(2906002)(38100700002)(316002)(36756003)(8676002)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGFPeW9PaU56azljcWkzbzFkTmxRUCtIVnZYcVpaRm1IZkFKUkM0SExnZmlP?=
 =?utf-8?B?VU41SmNQU3dnNU1zVk8wTlluMlJYTnJGWXF6SkllcStISW5RYUE2aytHS0da?=
 =?utf-8?B?cFMwM2J2cGxsQ2JyTzNWWE0wems1d1NnRG81RWwrNHZ4QlRkWFhPS3pGeUds?=
 =?utf-8?B?UFBUK1BFNjZZbjhITENxTTM3SklObXFndTJXNE1LUmF0MXFQcWhGK25MVG9Q?=
 =?utf-8?B?VEw4cC9lTlVnNk8wRUVqRU02bUFiS2YyRkRQa3NEUGZ4SzdILzUzQnNUcEVh?=
 =?utf-8?B?QlhiOUhZUUpNdXFzUmtDVE9JYzFVOHBKZTNMRlpkYmJYcVJWdVhvYVpwTURU?=
 =?utf-8?B?Y1JvQml4RlBtMWYxaVJMRjJDRjlRYVE4d3A3QmpPaVB1b1V6OEVKTFUyakJK?=
 =?utf-8?B?WW1hZU5hMld1ZjdPNHVIRVBaWkRzc2xWT0ZlcHoxNVUyRXpqSlp5c0FzZkdF?=
 =?utf-8?B?M3MvTmNKaEZkRmYyNS9wRHI5K3ZucWVaUUlWTTdVZzhjZXJNUzRGUmxrdFdp?=
 =?utf-8?B?SUtuQkJJMTI2dTRna0RrVTVMWmNBb3JGdmllc1R5ZlJjTk5hZEF4Tk5rMStU?=
 =?utf-8?B?V2dMbzRNa0VZV3NnalpzamcybUpuRUFsaSs4UUNOb1p6Q3FxRDVTcml6WDNO?=
 =?utf-8?B?Qkc4ZEs1b3BHdzQ0UTVWejM0czNhUDFEZU4vRWxsMTM3cDkvdDB1UytNNkRP?=
 =?utf-8?B?QjBiYlNITWhVLythZTJUSGlsRFUyQVpLK0FFRWdyeGpvenVDRWF2TjFia0Z5?=
 =?utf-8?B?NStaeVZtc2tWbit1UXFQc1hnMi9MeGMvOGZEVzU3aGI4d3RDMkZlRE5SeGQ1?=
 =?utf-8?B?VmVFU1ZTeGtpR09Xb0p1LzBHL1JrbTR0Sm1rTWRleU1Bd1JDWUZPU3h5WnFZ?=
 =?utf-8?B?OUlBd2oyb3pPN21oNU1HMzJIL0VrMmJRMFYzdVgrQ2xKamNrNVk5U1lidXBn?=
 =?utf-8?B?aXVuSjhNQnEwNjI1RitJSUhTeGpST3Q0TmtNbnNmRzBVUitqaTgyOVVnUVI4?=
 =?utf-8?B?UHhhbkt0RU9RU0hQRlVTRHdsQ3pRTy9PRTFIQ1lFUE81S3hFQmY1WXpGUDZK?=
 =?utf-8?B?ajQ1cGtUUzdQdXNSZk5aQjNtZE15YjBhY29lQ0pjVWpTNzlpbTVMU1pnRUVO?=
 =?utf-8?B?SnhTQnN4cHNvbUxYWDJ2S0U1bU1pNkpiM3YzekR2aUgzcWN4dDNuSDVaMml2?=
 =?utf-8?B?blNyVmdJSjVCWGtMSzlJNnhnUVI3alhLcGl2enY3c0xiQU9aM1IrNytqL0JB?=
 =?utf-8?B?OVhtWm0xNFBBNm9hU1RyT0lsSzhiU1ZHNVNxTjNPT2kyc0RabGJWNlZIS21C?=
 =?utf-8?B?Tm1Mb2lvRERZVVQ3MEpUbEpYVmh4MkxjVEp6Zkw2R2xLVXVPaGt5QVlVamJ2?=
 =?utf-8?B?dUVqYlUzbytuU3MxU1lCL2J4QzcvNWFNM2xzUnBaK2xNWG1rZ1NDcGxNcWwx?=
 =?utf-8?B?REFCNlE0MlRST2N5UEpNMjBuNm5Mc0JKdGhXZURHNDl3T3RHdEtSV3o2NUVs?=
 =?utf-8?B?NlJvYUs3aDVkNW5YSFdKU01pQzFOWkpJSDNydEp1S2gyQUdGaXBzendUTEpK?=
 =?utf-8?B?NktwcmJpaDJGbU1uT1VobFM3c3NZTnVqNFJVL202OUd3OVE2SGczWGd0N0xI?=
 =?utf-8?B?K1F0U1FNeWJiekYxUEcrSy92T2Z1czJ0cWcrUXNDS1ArR3JxdjN2ekRBUDBV?=
 =?utf-8?B?VVdWZzcxRzllcVo1blgyUGF1MEZkcmpISE1jdEVWdE5LdHNHeG05dEQ4R011?=
 =?utf-8?Q?QHXsmtmMeVxegGT7Vy+9bEpMn6BpLquYByiHrR4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae12b132-7b06-4256-0faf-08d97d286f94
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 17:51:27.5602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kP7ehyJ6bq8JxhcIJTwFZidU1RAgUVS3AScNSDDOQq4VJBxEAKgyejck6RWkt8r8wfqdP03Gj30ikxpFwIr4RW1wn+umQdF3vVqZnF+XHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6271
X-OriginatorOrg: citrix.com

On 21/09/2021 07:53, Jan Beulich wrote:
> On 20.09.2021 19:25, Andrew Cooper wrote:
>> In the case that 'extra' isn't a multiple of uint32_t, the calculation r=
ounds
>> the number of bytes up, causing later logic to read unrelated bytes beyo=
nd the
>> end of the object.
>>
>> Also, asserting that the object is within TRACE_EXTRA_MAX, but truncatin=
g it
>> in release builds is rude.  Instead, reject any out-of-spec records, lea=
ving
>> enough of a message to identify the faulty caller.
>>
>> There is one buggy race record, TRC_RTDS_BUDGET_BURN.  As it must remain
> Nit: I guess s/race/trace/ ?

Oops yes.

>
>> __packed (as cur_budget is misaligned), change bool has_extratime to uin=
t32_t
>> to compensate.
>>
>> The new printk() can also be hit by HVMOP_xentrace, although no over-rea=
d is
>> possible.  This has no business being a hypercall in the first place, as=
 it
>> can't be used outside of custom local debugging, so extend the uint32_t
>> requirement to HVMOP_xentrace too.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> Two remarks (plus further not directly related ones), nevertheless:
>
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -5063,8 +5063,9 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_=
PARAM(void) arg)
>>          if ( copy_from_guest(&tr, arg, 1 ) )
>>              return -EFAULT;
>> =20
>> -        if ( tr.extra_bytes > sizeof(tr.extra)
>> -             || (tr.event & ~((1u<<TRC_SUBCLS_SHIFT)-1)) )
>> +        if ( tr.extra_bytes % sizeof(uint32_t) ||
>> +             tr.extra_bytes > sizeof(tr.extra) ||
>> +             tr.event >> TRC_SUBCLS_SHIFT )
>>              return -EINVAL;
> Despite this being a function that supposedly no-one is to really
> use, you're breaking the interface here when really there would be a
> way to be backwards compatible: Instead of failing, pad the data to
> a 32-bit boundary. As the interface struct is large enough, this
> would look to be as simple as a memset() plus aligning extra_bytes
> upwards. Otherwise the deliberate breaking of potential existing
> callers wants making explicit in the respective paragraph of the
> description.

It is discussed, along with a justification for why an ABI change is fine.

But I could do

tr.extra_bytes =3D ROUNDUP(tr.extra_bytes, sizeof(uint32_t));

if you'd really prefer.


> As an aside I think at the very least the case block wants enclosing
> in "#ifdef CONFIG_TRACEBUFFER", such that builds without the support
> would indicate so to callers (albeit that indication would then be
> accompanied by a bogus log message in debug builds).

That message really needs deleting.

As a better alternative,

if ( !IS_ENABLED(CONFIG_TRACEBUFFER) )
=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;

The call to __trace_var() is safe in !CONFIG_TRACEBUFFER builds.

>
> Seeing the adjacent HVMOP_get_time I also wonder who the intended
> users of that one are.

There is a very large amount of junk in hvm_op(), and to a first
approximation, I would include HVMOP_get_time in that category.

But c/s b91391491c58ac40a935e10cf0703b87d8733c38 explains why it is
necessary.=C2=A0 This just goes to demonstrate how broken our time handling
is.=C2=A0 I'll add this to the pile of things needing fixing in ABI-v2.

>
>> --- a/xen/common/sched/rt.c
>> +++ b/xen/common/sched/rt.c
>> @@ -968,18 +968,20 @@ burn_budget(const struct scheduler *ops, struct rt=
_unit *svc, s_time_t now)
>>      /* TRACE */
>>      {
>>          struct __packed {
>> -            unsigned unit:16, dom:16;
>> +            uint16_t unit, dom;
>>              uint64_t cur_budget;
>> -            int delta;
>> -            unsigned priority_level;
>> -            bool has_extratime;
>> -        } d;
>> -        d.dom =3D svc->unit->domain->domain_id;
>> -        d.unit =3D svc->unit->unit_id;
>> -        d.cur_budget =3D (uint64_t) svc->cur_budget;
>> -        d.delta =3D delta;
>> -        d.priority_level =3D svc->priority_level;
>> -        d.has_extratime =3D svc->flags & RTDS_extratime;
>> +            uint32_t delta;
> The original field was plain int, and aiui for a valid reason. I
> don't see why you couldn't use int32_t here.

delta can't be negative, because there is a check earlier in the function.

What is a problem is the 63=3D>32 bit truncation, and uint32_t here is
half as bad as int32_t.

~Andrew


