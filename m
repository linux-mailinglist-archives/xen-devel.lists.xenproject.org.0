Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 327974B5D40
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 22:51:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272636.467537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJjF1-0005zj-UB; Mon, 14 Feb 2022 21:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272636.467537; Mon, 14 Feb 2022 21:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJjF1-0005xX-QL; Mon, 14 Feb 2022 21:50:39 +0000
Received: by outflank-mailman (input) for mailman id 272636;
 Mon, 14 Feb 2022 21:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qPn=S5=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nJjEz-0005xR-Tx
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 21:50:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2280418e-8de0-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 22:50:34 +0100 (CET)
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
X-Inumbo-ID: 2280418e-8de0-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644875434;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=lg0hbfwraGfcpQbbOpX7DUPkWiXRlmd+67pZbGWWy+Q=;
  b=GC3s/vxGywh4mQRwZZQqzZISF4B0S/G2o6GBVPu7hKskCcaRJDU6eEUq
   Y2hRqO5ncVRAfQDszgBKw6NsAiTeamPV1VUKoKyHxeBxyni8Hc1hr9OZc
   Effrc95lvHJF9vhnuy/NWX6+9QLb2GjXgN2ipe1bLeKFsTdpz/iwAmta4
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /ZIE1ghS0LgyVTFRSmLzh47HLayE30b3HDfQalyiK9Ydj4keoncyoOxH6GCIgB0A8zJFlB8NAQ
 3ML5DdQwthxQmP+m2OQxmLu68KEsTWPXoOLrzcCy5VU1gNbJDC7gZUQcI1XxVImvGOHflMq/fN
 mgin/KKfGXRovYGP0js4VxcIRXDwuSxH8LLldVhO0HcH7sZJ9YeJuFGu1kB+kjbjxnsPHBXPF0
 JewaweRR8qP156x7Rin3Pm0WxVy+k7IoAWAbtgQW0rikMgtJWUYvGvDrqalQT43o89ihHH5Xre
 9Mhdf92gbhBgoVGNg72GgxJ1
X-SBRS: 5.1
X-MesageID: 63637255
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:RLgyYqPwp5XQenTvrR23kcFynXyQoLVcMsEvi/8bNLWB5Y4Qp3Zem
 TxOHSzEb+HbITHFz+oGPom0/B8Pvp7Wx9cxTwJtpC0xFS0W8pHJXYTEJUqqMijOf5SdHRg85
 J1DNYiQcJs5ESLX/U71POPv8nVx2a3TTdIQZAK81gVZHGeIHw992UILd5cFv7NVbfiF7yKls
 4+or8SBYgT10GN5OT8Z5//e8x00sq/7tm8Sslc3Pa0a4FOGm3crV59OfqvZw1kU42V38kxWY
 86ZkdlVK0uAp09F5utIFt8XS2VSKlLoFVHmZkF+Bu7y0nCumgRoivxhbKBFNR8N49m0t4sZJ
 Otl5MTYpTgBZsUgqMxFO/WPO3gjVUHu0OavzUmX6aR//WWfG5ff66wG4HUNFZ8Z4o5K7VRmr
 pT0Htyvgier3IpayJrjIgVla19KwMPDZOvzsVk4pd3V4GpPrTkujMwm6PcBtArciPyiEt6EP
 cMlMSReKy3pRCFqBXQQKopnofqn0yyXnz1w8Dp5pIIy6mnXigdwzKLsIJzefdniqcd9xxjC4
 DicpiKgX09cZIf3JTmtqxpAgsfgkCThV49UOKC+8vdyqFaS2nYSGFsdUl7TTfyR1BXgAI0Fd
 hF8FiwGnJJp1h2tDdDHexj7p0O5rkEzd8gBHLhvgO2K4vWNuFvIboQedRZDddgnuckeVTEsk
 FiTkLvBHidzubeYTXac8La8rj6oPyURa2gYakcsUg8t89Tl5oYpgXrnXttlVaK4kNDxMTXx2
 CyR6jgzga0JiswG3Ln9+krI6xqOjJXUSg8+5i3MQ3moqAh+YeaNZpOqwUjW6+5aK4SURUXHu
 2IL8+CV6+ULDI2RmTaWaPUAGqmz4PSIOyGahkRgd6TN7Bz0pSTlJ9oJpmgjegE5aa7oZAMFf
 meJ4wptvIFie0KDSpNSXKG2Kdxz8LXvQIGNuu/vUvJCZZ14dQmi9S5oZFKN022FrHXAgZ3TK
 r/AL5/yUC9y5bBPiWPvGrxDieNDKjUWmDuLLa0X2ShLxlZ3iJS9bb4eeGWDYekihE9viFWEq
 o0PXydmJvg2bQEfXsU12dNJRbzpBSJibXwTlyCwXrTdSjeK4El7V5fsLUoJIuSJZZh9mObS5
 W2aUURF0lf5jnCvAVzUNiw8OOOyAM4m9ihT0ckQ0bGAgSZLXGpSxP1HK8tfkUcPqISPMsKYv
 9FaIp7dU5yjuxzM+igHbImVkWCRXE/DuO56BAL8OGJXV8c5H2Tho4a4FiOypHhmJnfm7qMW/
 uz/vj43tLJeHmyO+u6NM6nxp75w1FBA8N9Ps7zgfIUCJhW0qNIyQ8Ez59duS/wxxdz47mby/
 y6dAAsCpPmLpIkw8dLTgruDoZvvGOx7dne21UGBhVpvHSWFrGel36FaV+OEIWLUWG/uof3wb
 uRJ1fDsdvYAmQ8S4YZ7Fr9qy4M45sfu+OAGnlg1Qi2TYgT5EK5kL1mHwdJL6v9HyIhGtFbkQ
 UmI4NRbZ+mEYZu3DF4LKQM5Re2fzvVIyCLK5PE4LRyiti969baKS2tIOByIhHAPJbd5Ktp9k
 +wgpNQX+0q0jR9zaoSKiSVd9mKtKH0cUvp46sFGUdGz0gdykwNMe53RDCPy8aqjUdQUPxl4O
 CKQiYrDm69YmhjIfU0sGCWfxuFan5kP5kxHlQdQO1STl9PZrfYrxxkNoy8vRwFYwxgbgeJ+P
 m9nax98KamUpmo6gcFCWyanGh1bBQ3f8Uv0kgNbmGrcRkiud2rMMGxiZrrdoBFHqzpRLmpB4
 bWV6Gf5SjK7Lsj+0xw7VVNht/G+H8d68RfPmZz/EsmId3XgjeEJXkN6ibI0liba
IronPort-HdrOrdr: A9a23:sG4e3KqtoFBGC8Jcm4uMaAMaV5uCL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6Ky90KnpewK5yXcH2/hvAV7CZniphILMFuBfBOTZskXd8kHFh4xgPO
 JbAtVD4b7LfBlHZKTBkXKF+r8bqbHtms3J9ITjJjVWPHtXgslbnlxE422gYypLrXx9dOME/e
 2nl6x6TlSbCBEqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cyTpAJb4RGYFqjgpF5N1H22xa1+
 UkZC1Qefib3kmhO11dZyGdgjUIngxes0MKgmXo/0cL6faJNQ7STfAx376xOyGpmHYIrZVy1r
 lG0HmesIcSBRTcnD7l79yNTB1ykFGoyEBS3NL6HxRkIPsjgZJq3MciFXluYd099ePBmfcaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATxRlCvgQl7d1amm1F+IM2SpFC6e
 iBOqN0lKtWRstTaa5mHu8OTca+F2SISxPRN2CZJ0jhCcg8Sj7wgo+y5K9w6PCheZQOwpd3kJ
 PdUElAvWp3YE7qAd3m5uwCzvkMehT1Yd3A8LAq23FJgMyLeFOwC1zwdLkHqbrVn8ki
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="asc'?scan'208";a="63637255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GR9VWVX0/eaLY8GqMsljOODl/oKn+ZPf8S8O9mRvXg/cRV6ymEtW8aiPC6NGJd+4MKDeSZlI24GNZYkzh1UsmlI2zZeQ69RZ664ksDMaZrw+sIsiYICA1tr/UXC1pundIVzgYlCOOdvdP9a3U6IY3SO04W4e4WUEv6ofXXSFwcVrRrnuJtyY+dzyxB/cgo+fDEfqK4lL/XGwP0HRiPOqQqaopg5pBfVbX5Y1dIF1Sk6ZpGdeGGra0wNUy2FAzuKcLMGk15/zAs0gWrC4kb1xiWJX0VFvFXn+BG5JsQqjb4lmr7Lm6+sBbt+cmY9ccW6MQcfFJqVRGE6K8VbCoFdB7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyKRvuY235g2ngjiayH53KjXiBat3qTohVyvFKiEqmo=;
 b=PTYjFqoYRwXFQA5gJAFfBPd2RSemgFFJiWA+1wJBeSvHVZhgDgb4ACQ2Vn/vF70dMUnq97EZ1+kPS5Q9d3wXRWPqOxelyuPzPoJoJ1IfggOBWP2mhPloZITu2D18c9kn7/IxaJZoo3bx1sO3BnU3dVRpF5XUPCDsofEhdIMk1Q5cDT1n8LJsGeSo7u9LRdXJWEVyQu9x+K1jjGzoem5Y7kgWjFrYnx0UCrU2M0k87bpsXPcHAwkAHnWx+WJeenbkgh5IKVj0oBQDj6dNJilU87weWIa6wGv4Hh9drrkB+uAmUTGQ/ycj5xyzyXoCxcYHOyFJZlxSmzfzK7thoFJJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vyKRvuY235g2ngjiayH53KjXiBat3qTohVyvFKiEqmo=;
 b=ebl+atBiPcpTp9H2zUjzfbD1XqMioybdp4vUOgNzalJ1ywKjvZvTUhrEuHMLXEl2GADrgI82P7we+C4/Vuvt9fCdGbbsjr0tRviwkJbDm3ovc/0YDSgTZqw4GLDcM+vY2uA+tKdzN4yiAUwiero1XQzzEnHRGufq9riMD9zRrAk=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Committers <committers@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] RFC: Version support policy
Thread-Topic: [PATCH] RFC: Version support policy
Thread-Index: AQHXkDev9/QrG+8IgUOEs2JU9EeShqt6ldOAgRojewA=
Date: Mon, 14 Feb 2022 21:50:25 +0000
Message-ID: <C6A7B444-4CFB-43A7-8FA8-AD1049F83912@citrix.com>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
In-Reply-To: <de32c6c4-5ad5-862e-3988-0e7310ec3ecb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f13f1b4b-b39b-4b93-5671-08d9f004026d
x-ms-traffictypediagnostic: SJ0PR03MB6732:EE_
x-microsoft-antispam-prvs: <SJ0PR03MB67327622B268EABBE30A0B4999339@SJ0PR03MB6732.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zlKZNqizPoyfvaEsD6OQTqZvm3GU5AWS+zCRXfA+0D7ktcp0MM6w0YGGEf4GrCJlYisdGrtOGguKTgT5uy5ns449aNCYZM9gW4zZOJCxuscTHN5Q6GFXqpIgl3MVJY25t/Sm7aS6YuXcPb0Dm7/7ICnYh1cNIAUxozZdWFEyFVezl6k9RmPw7vJ7CbPbGtb70JPiWq56qQeBdbkIRpVgwtr0tFPV5Na1o9iVzPEFcsAS/06eSox+17ofLJL9eIKQMupNb/2gwZyDdcbrsMIEhbxVnZfHUt6EY7jm7EEZuFhTZO9km6x/riwFtVPCzOWqnUDbRd/KgPdtXQfv4negvgHNaJaPdccZJMBIh3o3I9O6eVjX8voZltT1DwZFxkSInNU6b01lUIbJn+4I7x4Jd8I/eupq3+Uu1AE5GvQ11zqPTInF+SWraOzTGZkvweqi5rp1iFAhxPokQkyvB7cdtMAojZL4OX1wpr+0DNqqjXSsUiuU19KkA0++trE2wiSTaw55kcnSC8YtnS5rZTGPc1nAtUs1Ln+lL7O0HMjk8csp1n4YuIKUegySUxHvLZvROpyzd+OvS+mvQW38oX7zMhJHSQNSW8LD8SAzxrU6INkBtonyMLnzrfRJ44bGPwfX1eemhZGzj6qOxp+IbqV+V+9Ct/WcJLlU47X6c54NARFgwzUNDNQIC5c5X75Mpaf1OgrWVysQ1ZAi30/LImfSn05vwHAzJAiZEuu2/ZUGZNBjop3v/11xJSpFayH+k2aP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8936002)(8676002)(5660300002)(6486002)(71200400001)(54906003)(6512007)(508600001)(6506007)(53546011)(2616005)(91956017)(26005)(186003)(38070700005)(316002)(6916009)(2906002)(82960400001)(83380400001)(64756008)(33656002)(86362001)(122000001)(99936003)(36756003)(38100700002)(76116006)(66446008)(66946007)(66556008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWRnbW12TnRWRjlrcVplRlVJS0EzaitYbnMrVVp1aXhVTTNQWDZvb01LQU1j?=
 =?utf-8?B?V3BLVFJ1dWxyK3VsSzdxeENwTE9TUFArM3BBWXpNSGVQUEMzUm1ZakZYdzFO?=
 =?utf-8?B?NFUwYnRwSmUwazBNUzZaOW5pUVBmV0o0aTE1dGhMWTV5bm1xL2NKV0JDemIr?=
 =?utf-8?B?ZTVVZ2NZOFNSS3gwd1hXNmNsZk5yN2lIYnczek8wUC92WWtFWjhjaVZTbzQ1?=
 =?utf-8?B?UnhrQitsRTc2c3BhNDEwQjVqNE5FSldQYXFXWEgvNm4yVkFrWWRNdUZsYXBI?=
 =?utf-8?B?NEhsbmVZUWlFV0ZTRHBVV1VzcVNHRHRVTHEyWTJSalpjdmpQLzRETEJMV29R?=
 =?utf-8?B?citBWUQ1UkYzRlI4RTJPV2lYOWRvYlhhaEcreDBURnJZMi84eStpS09UbkZO?=
 =?utf-8?B?NEg4ZEZEeSt1NjNnMnJYb0xUbHlQZDNuVjhaYXRpTXl4RGF0Y1BTU3F0MURF?=
 =?utf-8?B?YStiSWxoR05UVy9HTW1uTjVodHltM2FYdWNnRCtrZ1F6WWhzdVhvc0xuU2Uv?=
 =?utf-8?B?a0tJNm9JWlNnZDkxb1ZlZGhNdlc2Sjl1ek5CVmwxTkk3aGYrTitvbllLUXNU?=
 =?utf-8?B?dmE2WnN2eTRYaTFXdUttNVRzTmFJMjA5UG44dDNraVZhWHBrZm1sdkt4RC9E?=
 =?utf-8?B?NGNKbWdQVkE1TTlPUzFWb01nSE9DQ2xueDhIRnl1UnN6akZPWXZXaGgzcVVV?=
 =?utf-8?B?dGNhNkEzRmlqV2F1dVo4Q2ZqVmNxeWN0V2xWVjB2bnJVMFRZQ1A5Rk05enYz?=
 =?utf-8?B?am1QZnF5R1d4bWhXR0E2dDVsajdBV2dCa0VDVG5UU2t4OHBiYndYWnUrTEYv?=
 =?utf-8?B?NTlmTDNUK0FMVjlOTXN3Q0svUVR1N0Y1NDA1M0JGZFZMV0ZGK015L3drMU01?=
 =?utf-8?B?MURsWlNwbXZHZnFCekRhYjFhS0dQeVFlUmlIYlBwdEMvUnBVUk5rSW1WV0sv?=
 =?utf-8?B?dE9pUWtVcjVOYTRJaXRsNW5ZcVZMNWJXVWM5aGZqS3ZxN1FpNjNEL2lZVDBP?=
 =?utf-8?B?Q3JITDVqVW1xcEhKK0VBTkk1bGpaaWJWRXNadFZaQ3pRd1Rtdm9iY2w5ZmJx?=
 =?utf-8?B?Sm1EanhFaVEvL1VHZlpSQWxRcWRaNkZEbGt6RzVLMERjN21sV0tJdDFEMzZ2?=
 =?utf-8?B?ZzdRQWl0ZGtZVEJsUDVyd3lyVGxER3Irb09SVW9xbFZUMzRNQzBUYlAyOENz?=
 =?utf-8?B?YVYycFRJQ0VaaHZyaUFDcHFIM0kwdUxWSktRbnlqMGxIaTJBZDlWMTZBc29a?=
 =?utf-8?B?MllhWjBCRlVJNkxaTjlmSUc5ZWJ6azQ5dFFUdWxnekZZV0V2TXU1QVBjMmRV?=
 =?utf-8?B?YUk1S3drdTFoTWsvM0xNOWpYaFNSMlZVcnFZdWxVcFFnQUJKaW9sT0lLMk45?=
 =?utf-8?B?eUJsdWZoZGNxV1lyZEhqcklkR01ha1o5Z3grVTdlU0RNeVlselMzdFcyN3hU?=
 =?utf-8?B?M3gxTGJtUjlBbkxDV2NqbTRxdjVNb1ZpblUvSS94UXlDZW85L09HMFp0UFFJ?=
 =?utf-8?B?N1hVbWMySzhxVE1ac3VIZk5ndlZBcmltQXQ2ZVNOQTJJRno2cXFqTXN0S3VD?=
 =?utf-8?B?YnpjUWpDd1lhMkdZdlJYbTROTllMcDVoaTJyZWgvRlpHZUJMZ2RFZURRRGlr?=
 =?utf-8?B?VkhxOWhDcTN2N2FRc0FMSmI4VXJJKzJUcUtlRG5FZldnOFB2c2ZMV3BKSUx6?=
 =?utf-8?B?Y0pjQXV4NFN1dTU2T0hCY09NN0loTDJKUnZOS0lMcDZHOEx0eGo5VldVQ1Fm?=
 =?utf-8?B?N0Z1QWVkRjRYODFUUnBYTjU1MmsrdFM3RnN6S1ZLdkpoVXFiT3lnQzM2c3BV?=
 =?utf-8?B?QS82elphZXIrWjNFQlZSZnYrZWo1YUtCQStuM1N3R3UyL3BtTUtxM1NkSXBW?=
 =?utf-8?B?QnlkQW9IalB3TkpHVjZ0S2lIc1hDVW9JcytVVEtxcEhmZGNHV2pMeUwwQzcr?=
 =?utf-8?B?cVdEVEExTWNXdjB3NnFPS1hpclRGSmpxWVpJVVlQb1RMNDJ3eWxoY1RKVmxq?=
 =?utf-8?B?b2VXdGV6TWQwdU5oRUdrQlFhQk1wbFlxQ3lBMVNmRXZmNzZSNFFJb0Nyb29u?=
 =?utf-8?B?NmkvY2crVGp2RjR1bEFUVmFsWGlmYkZpd1BZZnQ0VlFRRFhIUGsxVnNrQkFu?=
 =?utf-8?B?ckhRRU0yYStiKy9xV2M4Ynd3ZE1YT3dlcUk2dE5rK1V3d0gzU01QMG9UZ1Z5?=
 =?utf-8?B?Q0twc1VySnc1UVBkV0NsVzNsbisrZ2t0bFh6Vk4zVUpLRVlGVGt4SGV0a011?=
 =?utf-8?Q?tPKY8YFSm0uLEo+fLJ81SZ15Nt7vej6JfRugeJWUo8=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3163DCB9-49A2-4603-B0F8-6E908A92B805";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13f1b4b-b39b-4b93-5671-08d9f004026d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 21:50:26.0109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AhuKgO6ZIiQvMDoJrQAB6pL2SuNUqhgKNLeqdWnKx19is+wiIN6VwIgzMy6WOTZd9f1HutBglorOe2f3BxxXfYLHpzgheyfYhlvoikzstNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6732
X-OriginatorOrg: citrix.com

--Apple-Mail=_3163DCB9-49A2-4603-B0F8-6E908A92B805
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 19, 2021, at 10:18 AM, Jan Beulich <JBeulich@suse.com> wrote:
>=20
> On 13.08.2021 13:37, Ian Jackson wrote:
>> The current policy for minimum supported versions of tools, =
compilers,
>> etc. is unsatisfactory: For many dependencies no minimum version is
>> specified.  For those where a version is stated, updating it is a
>> decision that has to be explicitly taken for that tool.
>=20
> Considering your submission of this having been close to a glibc
> version issue you and I have been discussing, I wonder whether
> "etc" above includes library dependencies as well.
>=20
> In any event the precise scope of what is meant to be covered is
> quite important to me: There are affected entities that I'm happy
> to replace on older distros (binutils, gcc). There are potentially
> affected entities that I'm less happy to replace, but at the time
> I did work my way through it for example for Python (to still be
> able to build qemu, the community of which doesn't appear to care
> at all to have their stuff buildable in older environments). The
> point where I'd be really in trouble would be when base platform
> libraries like glibc are required to be a certain minimum version:
> I'd then be (potentially severely) restricted in what systems I
> can actually test stuff on.

The question here is, why would someone running a 10-year-old distro =
that=E2=80=99s been out of support for 6 years want to run a bleeding =
edge version of Xen?  I understand wanting to run Xen 4.16 on (say) =
Ubuntu 18.04, but who on earth would want to run Xen 4.16 on Ubuntu =
14.04, and why?  If such people exist, is it really worth the effort to =
try to support them?

> In addition I see a difference between actively breaking e.g.
> building with older tool chains vs (like you have it in your
> README adjustment) merely a statement about what we believe
> things may work with, leaving room for people to fix issues with
> their (older) environments, and such changes then not getting
> rejected simply because of policy.

Yes; I think the principle should be that we *promise* to keep it =
working on the currently-supported releases of a specific set of distros =
(e.g., Debian, Ubuntu, Fedora, SUSE, RHEL).  Working on older versions =
can be best-effort; if simple changes make it compatible with older =
versions, and aren=E2=80=99t too burdensome from a code complexity point =
of view, they can be accepted.

One of the issues however is build-time checks.  If we have a build-time =
check for version X, but only test it on X+10 or later, then the build =
may break in strange ways when someone tries it on something in between.

I think it=E2=80=99s too much effort to ask developers to try to find =
the actual minimum version of each individual dependency as things =
evolve.

> While generally I find Marek's proposal better to tie the baseline
> to distros of interest, in a way it only shifts the issue, I'm
> afraid.

What do you mean =E2=80=9Cshifts the issue=E2=80=9D?  You mean shifts it =
from versions of individual components to versions of distros?

That=E2=80=99s why I think we should support only currently-supported =
distros.  If the distro=E2=80=99s maintainers don=E2=80=99t consider the =
distro worth supporting any more, I don=E2=80=99t see why we should make =
the effort to do so.

 -George

--Apple-Mail=_3163DCB9-49A2-4603-B0F8-6E908A92B805
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIKzqAACgkQshXHp8eE
G+3phgf/QFEPoxuZHLUAVXSjo/zAeqgQoVNXc5qZsSyiiGcT/Hom1x4sNlsonSnh
4BR4ePvkw4J1wDzyNeeQgeeDg3sgpwhHy+YtBLbNWfwgy+efbIezd9yDJxo+C0Wf
62IVo1Tnmup5WmDXT4s3ogxKMOZ1jDkyAvcTYHhoSW67TtMuHLW1r5HiWQMfRddW
uyb9FdEqK6XN5S+8jY1eKIkeC2XUeSkPfr023L0wq70F5rpE3XufngxWDD6yekIy
HI/L09aMRlS/QqwWV52HzBpDHZBDjBGUe4dyssDHaTE++f/Kr+yIRSabyGM32XWx
0htxmhCKYXho4dsHaenf/YXnFZbUSw==
=6suW
-----END PGP SIGNATURE-----

--Apple-Mail=_3163DCB9-49A2-4603-B0F8-6E908A92B805--

