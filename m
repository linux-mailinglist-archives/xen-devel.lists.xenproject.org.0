Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94ED365D1F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 18:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113922.217037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYt4B-0006uO-Kx; Tue, 20 Apr 2021 16:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113922.217037; Tue, 20 Apr 2021 16:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYt4B-0006tz-H6; Tue, 20 Apr 2021 16:17:35 +0000
Received: by outflank-mailman (input) for mailman id 113922;
 Tue, 20 Apr 2021 16:17:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yi73=JR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lYt49-0006tu-Gf
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 16:17:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b89e9ec4-a107-41dd-8778-dfb6512d3953;
 Tue, 20 Apr 2021 16:17:32 +0000 (UTC)
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
X-Inumbo-ID: b89e9ec4-a107-41dd-8778-dfb6512d3953
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618935452;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sUvaWzqC+eKvttObpKr4fjmU+deypsudVxElxh5H1L4=;
  b=c17elq66osKms8CSvntwUKGIDy8jNmIf/lIJ9Qj7mC6XVGVba1ngEyDq
   IS90UPgnw4q5SmnzttxDGlI7tL+ibCoSSReENLxUr1MOhanjXkL2vvLl4
   T74VeliUtOEy5AYxJuB4ZcRXYtCZpoA3HdVjZ4oly+Nmfew0B9NAmy15c
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ABVWH3Pkx+mzR5lU0sB74xJgDUhTvltp4rYfE7/UMGF5DIFzGujFQ+YfsmkHDruCIhwhA0pXBG
 Ij+t6Bm9Dc+7D9TPRnlmxrsdBrfa6Y5aP5o/yFKoKGfUg3+0QJCUgNHs2nVieeYvDa7d+LUNQp
 UBE6nzCrGMrBzv1NIs1sFSsPcxSt9KlkbacwNu+rrdYD6S8Nj7UIUtRKK7itOJrBJFufiX6dfx
 dku4YYMaVzRRoKwqakuo7nHberlWgiUsOiLKdbwgFCk9cDysPeZP5cOC7hs2Jz0fsh/QFVRm/A
 yqk=
X-SBRS: 5.2
X-MesageID: 41997553
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qEPZx6qVoMH22ZVNdsIN0McaV5uNKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQa3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIFg/I
 9aWexFBNX0ZGIXse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsB0y5SIG+gYytLbSNBAoc0E4
 fZy8pcvjy7eWkWaMPTPAh5Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLw9n67Ek7G
 TDjkjF9ryu2svLsCP0+k3yy9BtmNXnwsZeH8DksKkoAxjllwrAXvUFZ5SspzYwydvfjGoCsN
 6JmBs4OtQ21nW5RBDLnTLI+y3NlAkj8GXjz1jwuwqRneXcSCghA8RMwaJ1GyGpk3YIh9133K
 JV02/xjfM+Znms7UeNham8azhQmkW5unYkm+II5kYvKrc2U7NNsZcZuHpcDZZoJlOL1KkcDO
 JsAMvAjcwmCG+yUnaxhBgJ/PWcGl43HhuAX3EYvN2U3zV8jBlCvjol7f1asXEa+J0nTZ5Yo8
 zCL6RzjblLCvQbdKRnGY46MIWKI12IZD+JCXmVK1j8Dq0LUki94qLf0fEQ3qWHaZYIxJw9lN
 DoV05Zj3c7fwbLBdeV1JNG3xjRSAyGLHXQ4/Abw6I8lqz3RbLtPyHGYkspidGcr/IWBdCec+
 qvObpNasWTb1fGKMJs5UnTSpNSIX4RXIk+odAgQW+DpcrNN8nDqvHbSvDOP7DgeAxUGV/XMz
 8mZnzeNc9A5kekVjvTmx7KQU7gfUT54NZeC67f0+8PyJUcF4FFvwQP4G7Jov2jGHlniOgbbU
 F+KLTonueQvm+t51vF6G1vJ158Ay9ukfLdekIPgTVPH1L/cL4FtdnaU3tVxmG7Khh2SN6TNA
 Zeol9w6J+mNpD4/1FlN/uXdkahy1cDrnODSJkR3oeZ493+R58+BpE6HIt8CBvMDB4wvQpxsm
 9MZEslSybkZ3PToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqYGAaUT6oWcu+mh0vWDJQu1
 10/8Yk8f+9sAfqDVF6rPUzMVVKZmjSKqlBFh65aIJdna2uRBt9Vl6QhTuRiwg6f03j80l6vB
 25EQSkPdXwRnZNsHFR1ajntHd5bH+UcU5LZndmioFlDmjdtnFv0eiEW7qr3wKqGyk/69BYFA
 uATSoZIwtoydzy7hKTlTqYPVgNx5klPIXmffkeWoCW/knoBJyDlKkAEfMRwY1sM8r2tPQXFc
 iFfRWOET/+A+Q1+gCcq3o/IhNooH08nf6A4my80EGImFoERdbCKlVvQL8WZ+yG52//XvCSzd
 FXi8k2sebYCBS4Vve2jYXsKxhNJRPYrTToE6UGqZVIsbkzs7U2NZ/BSjfM3GxG2hJ7DMqcrj
 JofI1LpJT6fqlodIguXggc2HwDvtGGNlEqvQz7GfVWRyBms1bre/eyp4PVor8uCHCbrAT+OV
 Oj4zRQls21Kxer5Po/MeYMOmxYZ0g31WR68M6Df4PWDh+2d+srxivNDlaNNJtcQrOCA7Mes1
 JT5MyJhfaec0PDqUztlAo+BqJF6GC8R8yuRCqKBO5T6tS/fXCBmLGj7sL2rDD5T1KAGgslrL
 wAUUwbdcJYjDY+yKUxzyipU6Ty5nsfrGE220Atqnfdnq684GnaGklaMQrWxrVuNAMjTESgvI
 Di6uiX1HP0/T5f/4LMfX0gJe1zJw==
X-IronPort-AV: E=Sophos;i="5.82,237,1613451600"; 
   d="scan'208";a="41997553"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUE9l0aCSLAK1YiNIC2ThYozD9zpFZPhuGJseNJ3s1B4pgyBjnYSCwIhovzGt+yRMOB3hgW/Vab4GWLjY6+JZyI4wPdg+91DYxS+tcPl3koUy8IIl8pOAimwjyiLSsEwt0oXu+beq8KbWOBEvRyR9XyEi+/Jg0C2SwzAUuuRY0zLVHX8l3AFKOHmPb170lwc1+Fbe6Lee9o858dxZ9+3PZE/9bmiJb5XC8LdKV1KJzeokO3i6IJBKASPRCNBGZ1fhizuRZPqhCn1V7khOLFaYIqFGNaN0PYiAFQI2Fq1vMnelKKwkQBp0swI9pzSd7H+HJtzUrn2ZKYWXhiOJsRCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTS6hH/45NmzXfaUvkoqMgEaNze7Gg4cK6PcbYYj9wQ=;
 b=oPvEaLLtz66QQphEkyqI2h1fM3Nui7MdPY6IUF9qipobWaNXrasJoYKEiw0JVcaK8qGyC339Ov6NiWWSgtaojm5VrNStqqukYG7VxapBfw6JDAkNpL2w8HneAoaptKhnY5pC41LpZCjVJQQlSNRFy8krCYVinHqtLFbsQZXkgC/L/fziIinIy/Ccr7dgm+AoQKCGxQI0K6L0WjzFtWSSOgg7IsitnoV5RB2D3BiYNwCWqkSvSI4/hUMtU5ICpXgZyouas29UWo9yxr7pvZY8fljl2BpDWtkQFEk0mudLI5+33IjkPkjIKghiIY1+p2qMgAkuyBkB5NMxp9fawVPQ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTS6hH/45NmzXfaUvkoqMgEaNze7Gg4cK6PcbYYj9wQ=;
 b=OI5/rdOI65X7ElmUH3LiVVjsemMCY121kRLEHwkTMVRltl/9eEy5sz6xJggqiOOXeON9aYClIS4iuxaQnsOz8v1RAiYJ88X0MYkGmR+le0rHNepdqDmtctu2xkOfrjEdbRrqt12Ol2AqplF5iOxFMg4R1PI1a5P7SRgiSSjf7sg=
Date: Tue, 20 Apr 2021 18:17:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>, Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
Message-ID: <YH7+i/JVnmZGTHOF@Air-de-Roger>
References: <20200401200606.48752-1-chao.gao@intel.com>
 <YH7uX7RqqIS4zdBt@Air-de-Roger>
 <3afbdba8-b25c-985c-6c5f-20077cb37d3f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3afbdba8-b25c-985c-6c5f-20077cb37d3f@suse.com>
X-ClientProxiedBy: MRXP264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bc0dbd1-34e0-42cf-7d0d-08d90417c6b4
X-MS-TrafficTypeDiagnostic: DS7PR03MB5607:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB56079535E5762C55D251BC488F489@DS7PR03MB5607.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i294B0H2rWq5qziVC343DGbgIqNwnAG6VnpbbFL4NcqENDjlc7dVy3rdMGr0NKjq90P9+OfC6Km2380oKXwny8sWYBRA3g8MX38Rb9wRYEKat6K7koNm6JHUwEE9h/k/bJ5BcmM7v4eJW3jnigvl8Am+sgkROJZtUd6VjTGokKNc3o7iYY37D22D5riKzVNwaWGFbws6f6pMhQ2s4lRo8XKtb7SIIzOvq6J47A5ZYtKfInt/DcCL95OJ4HH97E4XN5QNW6PdSVilpD+IbxPZo0gUKiQsyQ9Bsl7h06Cx2O4oDcJFON40mYc6t3u/VK/GqCxyaK0t7W2ZSuKVsxMzMUKh2vbEJXFWfAI73ttM0vBr9wgp3Rg1GqA2ae/UhLA/m6uRJN+zxLToh90xwvV0pw5ryNG+kYcsly+EeIqTUQRjAauuMbmPy09x+ujNyRqqM9rCFIZPxJh/iqqeCGSzPOibOpvDtPFsT09JURU1s5edsnDqPEU2pZAHLbNuYHpaNi+apDMeP+IO/2CjriOekSXrTxfZcVIySRtcugnBaQW4zn75foPokgULJ2vsm8qPk9uf3I1O9/ggNBdgSwLpHxtR6wZcfBe/dh0mfGiQ6mY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(5660300002)(38100700002)(6486002)(6666004)(33716001)(16526019)(6496006)(85182001)(9686003)(66476007)(86362001)(2906002)(956004)(8936002)(26005)(6916009)(66556008)(54906003)(66946007)(316002)(83380400001)(186003)(8676002)(478600001)(53546011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y1IycWFJVGJtanFKOEZMWjRzRStNZFRyYWFkeml2anp6Y25xRDBxWXVOamcr?=
 =?utf-8?B?L0VCSU9VTmhkYmRwalNaRlBhZHRiT0R5dnkrNkFwWXhDdS9KQjlZK1RTNGov?=
 =?utf-8?B?Y0NPR3YzVEd1alc5MnRtTnBZOUVjL0ltM3kxalQyWFprQU05aXBGOXVMNU5U?=
 =?utf-8?B?c0Q2OEhKOHhsbUVlWVFZb3FPZm8yTWw3Ti9rNEx1YUsvUk9CSkVBZ0dkRy9z?=
 =?utf-8?B?Qnc5R0NZV2FTZVdpcDloTlBKc3RKRzM2b0Ixc0RsSmd6c1I2bHFaRTRONGlY?=
 =?utf-8?B?VWxJRXBvRzVkaXd1enNOb1J0S0F5WWgvcDRUOGhDNEVEd0w0WkloQ2xtSGVO?=
 =?utf-8?B?VFJvWDZXckh2aVU4Tlp2MEpkQWl6UmE1bk5RUVp3U2V1TFc0VFFBaXd1QXp4?=
 =?utf-8?B?aGtqWE5sU0s5MXUrZW10U1RPQ0tqZ2R4UnNNc3dKSUFXUjlmR0UvelJnUWdS?=
 =?utf-8?B?T1cwbnZGU1hPY09FRGVvVlhhcEhuY0lieHU5ZUxBN0R6Mk1yTTRJbjRmd0tE?=
 =?utf-8?B?eEI2dUxraENRenRQTU5kV3E2MzNBMFBhRW5YZFV1MEVaS3VWaFZHSlQzSWVl?=
 =?utf-8?B?LzgrYTJnOExoNDRSNzV6a0pXY05tSS8xZ0wvbzI0cTRhUHhQK1g2UUdpYkFT?=
 =?utf-8?B?djh2MUNGeEFuUHNTZVFRM3l3RldkYXJiVExjQlgrakNZWkU0RFk4bDRNeFpJ?=
 =?utf-8?B?SStxUmdqN2tDWjR0dWFHcGJHR1BCRk1WZVlRZkRqQk1JQXpDSHdCQTBrblAr?=
 =?utf-8?B?R2FyRE1ZeXFvVTN0ZVNrZ3owZHNvZmVlSmJsNy9XRW02RHBzajJVem9oc1pu?=
 =?utf-8?B?RVlDSEVYMVlKWVAwTVFDMmY1aEVaVDBWREVQbngxTFJrSlB2T3FpOS9ZTC9U?=
 =?utf-8?B?bUlZZHdrY2t2RFJjMFRkOVY0Q0J6SGErZk9INUNkLys5VUFEMEFudnVSWm1Y?=
 =?utf-8?B?ZDJDR1AwTTNoVU9uQk9YZjYrTU1VMEszSlJDU2lWNlFlbFJLK3ZmS21qQktX?=
 =?utf-8?B?bjlHWGU3c3QraVYxVk85Z0tZS1FYenZYd0UxTkp6T0JncEdNTDdDdzVJc2Fw?=
 =?utf-8?B?V29xLzhFbW9JSUFUQjBjUkJKQlZtRG16R1d4OXgzeXN0VVVieG95SHVHMzlG?=
 =?utf-8?B?VFFsU0phOFVmRjNkcFpVcC9lVUdscjlscUNQNVNLVVNMNEd1VmxoWmlDYjJx?=
 =?utf-8?B?dXBYWk53OGtJeUJhNkxrYkFKajRiL2s2Q1IreEdtSnQ4akQzL25GTnErOXJy?=
 =?utf-8?B?YVhtbVlua3pwdnI2Vy9Mc2R3ckdJc29rTVNra2tEM2huR1piRFFyeTA3R2lt?=
 =?utf-8?B?YnBXUXpDV2h5NlNOYll1dkFWQ3p6a3E2QWFxdVlzb3BTb08wVU5JVW4wU0s4?=
 =?utf-8?B?OW5UN3dySmphQnVNTFlUY3pHWElKWTVhYldYQnJ1WW80cmFYQ05GLzNmK2gx?=
 =?utf-8?B?cWw1WTRBU2NMeTlMdGNYZk1CeDRpbkFJb2VrZ2E1bEVXL3dvaHBoUW5JeGJR?=
 =?utf-8?B?eThoMVR2RjB3ZjZGcElWUFRGM3hpckdCbmU1dXU0VW92Z2JoS3p2MTBRSkdt?=
 =?utf-8?B?bzN0QklNRzUwckkvenE2aFREVkg0eEhoRXcraytqR0prQTdsMDVRUHVBZ1dE?=
 =?utf-8?B?RHplVC9ONUk0eGNXRzhrd0paQXpuODZPSnBkYVVHQjdBd0wxS3F0dncyeDh0?=
 =?utf-8?B?ZisrdlhBelVURWgzTGxRT0Nwd29CSTVORFhWUnY5RVFVNnU1SThldlVtRkFY?=
 =?utf-8?Q?gkYuWZXAKwkddkB0Jo3BegTLoXHLDdnSq/zadW+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc0dbd1-34e0-42cf-7d0d-08d90417c6b4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 16:17:21.6083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVSISyzHZxF1QdPfq4C5zu4QWmbrZo79p9/Gxpfk305hk/iD8iKzPKXSRy8vsF7jCkREwKqnDmUvEA9Ix7YXHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607
X-OriginatorOrg: citrix.com

On Tue, Apr 20, 2021 at 05:38:51PM +0200, Jan Beulich wrote:
> On 20.04.2021 17:08, Roger Pau Monné wrote:
> > On Thu, Apr 02, 2020 at 04:06:06AM +0800, Chao Gao wrote:
> >> --- a/xen/drivers/passthrough/vtd/qinval.c
> >> +++ b/xen/drivers/passthrough/vtd/qinval.c
> >> @@ -442,6 +442,23 @@ int enable_qinval(struct vtd_iommu *iommu)
> >>      return 0;
> >>  }
> >>  
> >> +static int vtd_flush_context_noop(struct vtd_iommu *iommu, uint16_t did,
> >> +                                  uint16_t source_id, uint8_t function_mask,
> >> +                                  uint64_t type, bool flush_non_present_entry)
> >> +{
> >> +    dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: Cannot flush CONTEXT.\n");
> >> +    return -EIO;
> >> +}
> >> +
> >> +static int vtd_flush_iotlb_noop(struct vtd_iommu *iommu, uint16_t did,
> >> +                                uint64_t addr, unsigned int size_order,
> >> +                                uint64_t type, bool flush_non_present_entry,
> >> +                                bool flush_dev_iotlb)
> >> +{
> >> +    dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: Cannot flush IOTLB.\n");
> >> +    return -EIO;
> >> +}
> > 
> > I think I would add an ASSERT_UNREACHABLE() to both noop handlers
> > above, as I would expect trying to use them without the proper mode
> > being configured would point to an error elsewhere?
> 
> If such an assertion triggered e.g. during S3 suspend/resume, it may
> lead to the box simply not doing anything useful, without there being
> any way to know what went wrong. If instead the system at least
> managed to resume, the log message could be observed.

Oh, OK then. I'm simply worried that people might ignore such one line
messages, maybe add a WARN?

Would it make sense to mark as tainted which could help identify the
issue on production builds? Maybe that's too much.

Thanks, Roger.

