Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76F44B0BA7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 12:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269805.463921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI7CB-0003pR-OJ; Thu, 10 Feb 2022 11:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269805.463921; Thu, 10 Feb 2022 11:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI7CB-0003n8-Jn; Thu, 10 Feb 2022 11:01:03 +0000
Received: by outflank-mailman (input) for mailman id 269805;
 Thu, 10 Feb 2022 11:01:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYjf=SZ=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nI7CA-0003n2-1Y
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 11:01:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba168e9a-8a60-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 12:01:00 +0100 (CET)
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
X-Inumbo-ID: ba168e9a-8a60-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644490859;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=n4xeR7tAFcfdWbssu15YuhOldLDpjVTCyhfyOKvN0ts=;
  b=FzrgohJ7rcxPIjL2rMtV/5RF9Z4iawgPaAVYrrMkMVCcIiuoSoZ8Vwr3
   MSQcdja47HrjwHKXNgk3P6UGazbCJTThgpAU5Md1xeo/6ilMGTyOiLjud
   yZUK+cLxiJ2neK5vgW/fH3VmgNFpXNwyBiXjJtKwqIbFv4B+04g7c6NLd
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Q6sS9MAcxheU43qvdxrbNoUeUV03Ebj5pJZSwvq6i4WYrkRP1XrQBkvgGsdqatyv1QLKVCChLs
 J1QGRxZNGsPJ1jPp3uJsaFajB8AV9omWY2B6tVMC+zJedz2r/6mCgPWrjaQBIUb2Z8K7SdHyHx
 AIwB5cHEORXjBdD289lUHYWW9rzrpf0Zs50bs/zODJ5n2mS3zFOYPUlCdhLVTaN+BDOnoXzjb0
 9cpOEK9EtPpO6rVatdgXM5rsT25Tl1RNGHpimBBvyYG281hdqpo0fITuWq+RqKAVuPOsv/waQ6
 ppyS80k6dTA2PlT6/wZJWnAo
X-SBRS: 5.1
X-MesageID: 63917725
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Lybz/6ldkPnaYe7s0RL3aVLo5gzvIERdPkR7XQ2eYbSJt16W5oA//
 9YtKSrfbaHbJie3LscnK96GQXl2sZCGzdcyTAE5/i1nFHgToJPLCYXAJxqsNCicfsbJQB4/5
 c5PNojNd5k5Qy/X+0fzPum7pHNwiPvQG7StBrTNa0idKeMcpAIJ0HqPzMZl0t4AbaGFPj6wV
 fPOT+z3MQX0i2AtYmtJsPyO9E1i5qis6GJG5gYwbPlGsAGFzidEUJ5HKa+PdHapGYM88sxW5
 grgIBNV2kuDon/B3/v8yu6TnnXnxtc+BCDW4pZsc/HKbiNq+2pigs7XCNJGMR0N02/Qx4goo
 DlwncfYpTkBb/WkdNs1C3G0IwkmVUGR0OaaSZQXmZX7I3zuKxMA8d03ZK0FFdRwFtJMKXNP7
 ZQlxAUlNXhvsQ4ULIWTEYGAjux7RCXi0Rh2VntIlVk1Bt5+KXzPrjmjCXa1E17ci+gXdcsya
 fb1ZhJPQxXuTy9oYGsQI5c3s+Kkmkn2IzZx/Qf9SaofuwA/zSR02bnpdtHUZsaLVYNemUPwS
 mDupjqjREtAbZrGlGTDoinEauznxEsXXKo9Gbqi+fMsrECVwmULIBYXSUG6sb+yjUvWt9d3d
 RdFo3Vx9/VaGEqDZPjQUz+0kVe/5CEsAOsTGeAgySau8/+Bi+qeLjddFWMQADA8j+cmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTSQDSA4Y5dj/scc2hxTGQdt5OL64iMXvHjP9y
 CzMqzIx750QgM8X1+Ow+lTKhjuqjp6TVQMv+AjNRSSu6QYRWWK+T9X2sx6Bt68GddvHCAna1
 JQZpySAxMAhDL+hpgvXfOImGbiG4vqZADSMinc6SvHN6A+R03KkeIlR5hR3K0FoLtsIdFfVX
 aPDhe9CzMQNZSX3NMebd6r0Up13lva4SbwJQ9iJNoImX3RnSOOQEMiCj2a01nulrkUjmLpX1
 XyzIZf1ViZy5UiKIVOLqwYhPV0Dm3hWKYD7H8mTI/GbPVy2Pyf9pVAtagXmUwzBxPnYyDg5C
 v4GXydw9z1RUfflfg7c+pMJIFYBIBATXM6q95AMLLbbeVo5SQnN7sM9J5t6IuSJeIwPyI/1E
 oyVABcEmDITe1WbQel1VpyTQOy2BssuxZ7KFSctIUypyxAejXWHt88im28MVeB/roRLlKcsJ
 9FcIpnoKqkfG1zvpmVGBbGg/dMKSfherV/XV8ZTSGNkJMAIqs2g0oKMQzYDAwFQUnTp5ZFj/
 9VNFGrzGPI+euirN+6LANqHxFKtp3kN3uV0WkrDON5If0vwtoNtLkTMYjUfeKng8D3PmWmX0
 Ri4GxAdqbWfqoM56oCR16uFs52oA611GU8DRzvX6rO/NC/7+Gu/wNAfDLbULG6FDG6kqr+/Y
 eh1zu3nNKFVllh9rIchQa1gyrgz5oWzquYCnBhkBnjCc3+iFqhkfiudxcBKu6AUnu1ZtAK6V
 1ih4N5fPbnVasrpHERIfFgub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4adp3z
 /0gtcga7x2EpiAratvW3DpJ82msL2AbV/l1vJ8tH4K22BEgzUtPYMKAB3auso2PcdhFLmIjP
 iSQ2PjZn71Zy0fPLygzGHzK0bYPjJgCokkXnloLJlDPkdvZnP4nmhZW9G1vHAhSyxxG1cN1O
 3RqaBIpdfnfoW8wiZgRRX2oFiFAGAadqx74xFY+nWHES1WlCz7WJ2onNOfRpE0U/gqwpNSAE
 G10HIo9bQvXQQ==
IronPort-HdrOrdr: A9a23:b5khYqgSU1AHt19YJk4DSuQOknBQX3N13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3IwerwRJVpQRvnhPpICPoqTMiftWjdySWVxeRZjLcKrAeQYxEWmtQtt5
 uINpIOdeEYbmIKzPoSgjPIaOrIqePvmMvD6IeurEuFDzsaEZ2Ihz0JUTpzeXcGIzWucKBJba
 Z0kfA3wQZIF05nC/iTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIO/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfqWG0hYczBgNkGmpDq1L8Yqq
 iKn/7mBbU015rlRBDxnfIq4Xi47N9h0Q679bbSuwqcnSWwfkNKNyMGv/MCTvKR0TtSgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59fs5TOObFuGIO5gLZvt3+9Kq1wVh4SKbpXZ9
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFoi/A3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki956Lf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg1jwqaWGLH3QI+1llu1EU4zHNczW2He4OSITeuOb0oEiPvE=
X-IronPort-AV: E=Sophos;i="5.88,358,1635220800"; 
   d="asc'?scan'208";a="63917725"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwPDOq3qUu8EApSoOBwf/uAnon96dHZu3rtf7CToVg9L8ACbfbPMJqBtjZbRLgX4SadV+Ic4tWaZTyF/pp+bSxrWMDKVJa2A3hoz72EtwaAD2VLRz7YrPA/Crqdi6cuBM53TofniJdbndiTOOSOoNkMW2SDIGMl9xm1wmJGIsms1hpahhN2Ex9HaHjlnR/yR7/HOIfrnKlpCnBjtxOVIjMZBnZJLp/EK/WHpAhJRWS0Zs3F+sSGXLajoMpXyQFkj6WuTmCq8N4G4Oo2PrkkLRNw1pRm/5ewdEWTdLnwEkfQOfww7JuGJeWB4nRVZxdFdGmv3vDGR+hQobjVVY3tjVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0SZZuHVIs0mXRGlZzfg7rQMmwRldZDftMPSxOOHAP4=;
 b=FyuHikSMj8C1QLnp2x+VdSktf/aHpPRTMX6k39UCe0cM7Y/oZMlvRMiFFPufmRYFMgZYX4AfPhVFQ5s6I/WCuCnGlBmDwgj3y1kNYSTC1SsoHPP8Q9m8N3JpGv1i0xPkCnzVyVdSxTAjRw8BpESOdUv25asMmir4J8XXaQ09D1EO3G5oL+IMPJ/8ZT0N9dnj2KJujchW7/0BnYg987iJnCwwp7VlLsVodTiGNmkl2qmgOW5MacjHPzIVb1iqM9VACZvmZQUm81lttPgcs3ha4ltLUkl7goRjM3my0cBdboObjKmeV34ZkdAbwNvZ9FfODR8NZ+Wu721YotLKJM8mfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0SZZuHVIs0mXRGlZzfg7rQMmwRldZDftMPSxOOHAP4=;
 b=uiQo4tQql1LZR0LwwroHgTZnHMiGfwhTyhgrSTGovMjUUQqXtI5YJj2vyPAD0hV7mSipOM8KNkDu8PqN5cdwtXUphW0fuOENCquP+wrsG+wjxqs5wnvgbUEJvwJlCpOKJD863YAtVKEerBD+MMgDdC2YGMG2muQZK90dk2i9NFA=
From: George Dunlap <George.Dunlap@citrix.com>
To: Keith Coleman <keith.coleman@n2servers.com>
CC: communitymanager <community.manager@xenproject.org>, xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: Retirement of XenProject 3.4 Code Signing Key
Thread-Topic: Retirement of XenProject 3.4 Code Signing Key
Thread-Index: AQHYDepUQes3TC97DEaMLNp7jJQYl6yMvxsA
Date: Thu, 10 Feb 2022 11:00:53 +0000
Message-ID: <B282E34C-0897-4E7F-9E67-E36C3F45F807@citrix.com>
References: <F388AF1F-1E62-48F5-9CB6-A4197BD6F9D4@citrix.com>
In-Reply-To: <F388AF1F-1E62-48F5-9CB6-A4197BD6F9D4@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35549681-8984-4781-2e26-08d9ec849b23
x-ms-traffictypediagnostic: SA0PR03MB5594:EE_
x-microsoft-antispam-prvs: <SA0PR03MB55946C2C5B03428F79178EDA992F9@SA0PR03MB5594.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4sDVDnyxAyFf2XnxDfPHGuWWOm7QolhxdrqDir+E/MmKJzpucNpVlApODjHY7QUmFLNjd3CIJgtRpX1IfSgm6M4kcW5SZbAMxfpU4A4P3u2AYPRWqNLYM1XGq6NuKOEsG8O1pZeHkIh+Viw0+vSJOGzKgUkAuBcmGPmfkFckuehjR3MEYPh5cAIPoO1ioReogrgs1ttcSKIm8sIVNZjTjUc1bd4Ph6DTtvvDNpqMV2hwSKRNklJ7AsikahS3dR9uOGjMIAGpYr9vzWJFFjoD47j9FBOWEXRMojzsuOcNHYoU1+SIm0eqWFfw432KVWuLYKqCnFQ90tLeWan2WXEQkqzqnn11G7ZLFs7RS0C3n/H/9xahX+sbaC0gG/HJM0wsT2TY4mpgBTxzt3/EUBU391ZuIqsiWaOWvOTTRJh1eHNemBhm4l/UO/E3AM+LbLx5lkXtSI9S8BT3EGhqyeEYux9vntFyLbhPgV93x+hKIs81ntBp5TR6StFePv/NSL6dnoqf61+58VOpZ7rxKGOwvHCS6B8C6Ky7atJXDvFliW9xCcTJmnbrMONC5R+fLqJvDb8L5XIyx4GNEfOlB+qgRaIWTPikha5GWuaF6OL8WNciJSZBVfZm3h912AlN6qzIiY51yUMoCFw5R4Yh/lcuu6Kh0FUzcr/3bURHYUG+UCV3On/XZjvuvSiz9H7u8Gz66zt/jwdnMd1vfQ3rhp90X1Xu6uHsP5DgRXgXl/rlVaCIrachfKYT6oJjq7ULoYX2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6512007)(508600001)(2906002)(6506007)(53546011)(33656002)(86362001)(5660300002)(4744005)(71200400001)(8936002)(83380400001)(316002)(38070700005)(91956017)(76116006)(122000001)(82960400001)(186003)(26005)(99936003)(54906003)(6916009)(66946007)(36756003)(8676002)(2616005)(66556008)(64756008)(38100700002)(66476007)(66446008)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q21yTlVMYnpnalNkL284a1dqM2pVUldLRG9lbWMwc2h6RFROeUNHWnMrMGJr?=
 =?utf-8?B?aW5FanVFamd4djQxWEtHaS9Fc014bnNHR1ZVUlo0R3RYcHUzQkN5eTBIVUt5?=
 =?utf-8?B?TXR2TjFJZjlPZU5QU0tMMldURHFzR2FHazBLM0h3Y29kNENGTXBEM090V0Fx?=
 =?utf-8?B?WlhtTUpNT3FITmJGT0lvTDlxUVBwTWFkR1Zha3FEY0Y5Y1BuaGtEd0ZZYTJ6?=
 =?utf-8?B?TDM3ZTVGaldHSmZxS01EWCtEbWk5bXR0cVprOW84aWQyRk9hK0YrY0ZpbFBL?=
 =?utf-8?B?anpUMW5OeHFyaTF1WVVncURuSzc0SStWeTJ4RG15Sm5BMWdnYlhLRjVDVktv?=
 =?utf-8?B?OU5RSFBCV0RycGV0eXZocFYrdzdva2JTM0dpOWVCRnJQSXpTZzBDNEdJaVJk?=
 =?utf-8?B?OVY2NFpmb0J0cXU2Vm1mYVZpeElpanFkWjlmKzVCUlhTc21yQSt0SSs5alAx?=
 =?utf-8?B?aDIxZnJOZk1oY1VnNWJ0SHMxTi92alFHTUhrWlY5QU5zT2p6cHV1aXdyeXZG?=
 =?utf-8?B?bE81UEt1QkNDRFQ1V1daaUtmQ3FHT0FEMmI0S3hyWmxjL3VJNnJRYi9RTEZQ?=
 =?utf-8?B?NmVqak1ESUNQS1RQZlhTSkt1Wkgra0tTQ0RFSll4dkV2UXFLWW1lZ1lpK1p6?=
 =?utf-8?B?QVBtTURndTZhZUUyellFQnlwckF3MnUwcnpYb2ljMmtNUUI2aDZqNmVVODNE?=
 =?utf-8?B?U24vWjB2RlNzR3ZBeDkzb2NqekhydllEQldRQ0phUnNXaDFKRUoyU21kTmN1?=
 =?utf-8?B?dHhlMTl6bUtRTGdPN0pRbmRxYnNKM09JdDFSOXNqek04RWpOem0xTXNjbW9F?=
 =?utf-8?B?Mkd2ZHZmMGd2UytLdWJuTVlIOGt0dWV6ZFh1d3Q2b0V0K3NXU2lxRVNnWjls?=
 =?utf-8?B?dmtsYTBiaDZMTlQzNzcvNzVlaHBSUXE2SDRXMEh4NUVpMmFTbUtOdVBqOHJs?=
 =?utf-8?B?SnFxVXdacVI2VEt4Q2tDM2xyQk9YRUpzcitJeGpuMS8zdTJIR2ZacDhUQ25s?=
 =?utf-8?B?bkRYdURTYXNrcU43c2ZSenhrTVdPR3dKeVpWWjJNeWZ1dnErTWRSSCthTXBm?=
 =?utf-8?B?amF6Tk92dDNqaFMxdUtyNjhvd0xVOGpoNjNuRFpzNUV5bmdkZGJIT2Z6SHRo?=
 =?utf-8?B?SGZyY0RYdGJTT3VtU1hxV2xyTndZRUVpbnQvbWZFcUs1c2d4YWNqZ2RlSW5G?=
 =?utf-8?B?cjZoQW9WdE9kdm1qbUhaaXY4NDZWOTlEaFJsV3N5OFFyZUVoRGM2NHV4QklM?=
 =?utf-8?B?RXhKS29rSjlUdytZN3J0b2hoUlhkVkQrVUZ1ZWZ5ZTduYzhkSHZRNzFPQVhk?=
 =?utf-8?B?KzF0dVpLck44TkFTOTN5VUhGbjRNMWptVWVDTVRmQ21VMHpZaDZZTGtROVNp?=
 =?utf-8?B?NlJYdWIvbEcrQU9aZ0lJRHNkVVBVa3VneXVXcXdsbmQ3K0ZmdDErWCtZak9L?=
 =?utf-8?B?MUF4L01LQ2pva1ZEb042SW1waURaV29YSytHbldkblFlZzdocjkvNkNsMit2?=
 =?utf-8?B?SkRtaE54SWlNOHFaa3Z5bGhCOGlPRXdmOGZvd2NmME92dTY2T0c0WnBrRmpo?=
 =?utf-8?B?NVhJeis2THRPb2JDdEZGNHNvWm1KK0dpZVlXYlV4ZlptbXNSL25hMjhqanAv?=
 =?utf-8?B?R3kyNGo2cmhHbEZoVjFSbG5YK0F3b3BFVkxDQXIwNlBySkRTZVRLS3Z6ejVU?=
 =?utf-8?B?dFJkQktwNkVDZzJqZmdNQmZXOGpXYlJDWThEbjR2RkVadzJZSnFmeDVPN25V?=
 =?utf-8?B?SlJYZzdydVc4ZFhPaFMxdktxSWM3bWtUeXgyNGhFUkpNZUpYbkNZOEg2VWpa?=
 =?utf-8?B?V1AvSk15OFNtcmo1QXM3UWl5WlNMcmdHOGl0ekFUZFFjNkFmQXJpamdqVHNR?=
 =?utf-8?B?bUkwdHRDMDZJcDk1cnlzN0lvSzl1TDBzRFRncTJJejZkOGdxaDN2UVl6SHo0?=
 =?utf-8?B?alVuY0ZkVCtVSjZBeTRwV2c0SXFKbE5mS3dTOWRFNVZPQzVWeDV3eXV4Wkx6?=
 =?utf-8?B?TG5jNVlWayswQlRXaVd6a05UdlhyQjJ0WlJia1ZmT0Jyd2J5bzNwM2VSb0Ri?=
 =?utf-8?B?bGEwS09SQkVab1NudzhZVVlMaW4xeFJ4aUlCbEJ1aGVwY051bGJsaFJNT0gv?=
 =?utf-8?B?Z0VjdzFDNy82RG50bXJOSUJJa01jdG1LbUhIUllvK0NDV3V6MHk3TE8xaldr?=
 =?utf-8?B?aXEzNmxTclRQYmtiS3dmSGtoYUhkb2R0LzgwS1MwZ0J2eGh0dHNwSFJqalR4?=
 =?utf-8?Q?eJLXYw7oa097UG25yW2T3Z57BOTwPqLLMjZFO+VSRY=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FA717697-F817-4285-A14A-4231EF57D389";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35549681-8984-4781-2e26-08d9ec849b23
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 11:00:53.0998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwrpW5tYUnBIOuLvZdrn5PQjCBgdR9OWdvu1pKxDJyi/bIA4mIDe4YgWtmrVoa3UOUY6xXfhKgajuniUdwhh5xnwluVZrB/UiIUeOoVoJFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5594
X-OriginatorOrg: citrix.com

--Apple-Mail=_FA717697-F817-4285-A14A-4231EF57D389
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jan 20, 2022, at 10:41 AM, George Dunlap <george.dunlap@citrix.com> =
wrote:
>=20
> Hello Keith,
>=20
> I=E2=80=99m currently the community manager for the XenProject.  While =
going through the list of XenProject keys [1] I noted that we still list =
a code signing key for 3.4.  Since there appear to have been no commits =
on this branch since November 2012 [2], I plan to remove the public key =
from the web page unless I hear any objections by 10 February.

This has now been removed.

 -George Dunlap


--Apple-Mail=_FA717697-F817-4285-A14A-4231EF57D389
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIE8GQACgkQshXHp8eE
G+27hgf/aoD3IsvEfYy953TF/fDkx3abXgItSZw0gRU4t+Me2FsUcw9IwlQCuXZ7
n8N9BhoJOJnH6BX4ewGXMSxQYq6ReVYgKfCsB5GozAT5PoHXtm9y8wQ+ng1jeVpE
79bJ2J0N1UqpduWxHfCvK5vIrqICXgboifvgEkltiJPEI0NyH6AEZZLpfsxDsMFm
8IZdL6cByI1XZyuioGeC2jEze+KlidBXI9Prv33Hy9S4L6ebnZOFCqkaEuFq87co
L/iTVW1hyo2waAlTRjP6xXfSZMsIgiPRybGbX8/BVMeApBQw/8/dyspQDbxrPuE5
a7xGvLiWuMwiYsyWq76i3rwPzVvvWA==
=aRnG
-----END PGP SIGNATURE-----

--Apple-Mail=_FA717697-F817-4285-A14A-4231EF57D389--

