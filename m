Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E384B9D3F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 11:35:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274606.470140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKe7i-0008RN-39; Thu, 17 Feb 2022 10:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274606.470140; Thu, 17 Feb 2022 10:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKe7h-0008Np-To; Thu, 17 Feb 2022 10:34:53 +0000
Received: by outflank-mailman (input) for mailman id 274606;
 Thu, 17 Feb 2022 10:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/h9=TA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKe7g-0007y8-5G
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 10:34:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a6ea88b-8fdd-11ec-b215-9bbe72dcb22c;
 Thu, 17 Feb 2022 11:34:48 +0100 (CET)
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
X-Inumbo-ID: 3a6ea88b-8fdd-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645094090;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=laCNSC1BYAO2UJbiV9bbtsxcWaNk70Ym0/2POxIQx0E=;
  b=ePcM8H8lpSRhFR31mfZqMgHR0JRugG29ipjkHFj3496AeGZj2sDo5XYm
   kbIdLEvtDliDjMiW97i8cDbB79Oa8BKy/41Bt2ulpfFvnFu5xvPA6D4MZ
   xCS6rz5NWoXKwOBPhvt9kFE8RqbQlaQLnxL8kzk+clAyJB5LfrB74W0Xf
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jhgwknE7O09vuosLOJewtHlZK1wuY3wm77WxhywGgei7PCvUjl3NxS7MNRSdBafw+Aus0oJRCa
 UM4XT6vNU9Dcy71oIC9gIN4+sY88zl0UUNMLyRPvlkPUErtQDCz1hKDSGWrnyHHoZ07i5BcGpJ
 f5fcbiLrffs3KrKpu28rjJ8osiVU/89OP8P6L8XpPOG4Y6SHvnMEtn27pbq3lQEQe9d4yim1lC
 /Q+clqc0xjMbifDMGb/7vYaAgJY921SlB8vx8mH7cUVPhhF0Aea5wZnXQtEfgvtbn0mSo22NJl
 Nin27tLDhIm2Qo1ES+D+7lQC
X-SBRS: 5.1
X-MesageID: 63860118
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OXDSmqLMNSD9kfcXFE+RT5IlxSXFcZb7ZxGr2PjKsXjdYENS0GQBz
 DEXWGzXP//eYGX8Ltp2PYnk9BtS6JaDnd9lG1RlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6xLZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB22rcJ0z
 9IX7aaKVFcSP43Vxf05aBpXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Uvo8GhG5p1qiiG97cV
 ck2S2FFPS3xOTFiK1hUOaMlzei30yyXnzpw9wvO+PtfD3Lo5AZ8yqT3OdzZPNmDX9xIn12wr
 3jDuW/+B3kyK9i32TeDtHW2iYfnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQomOAvxMac8pdFas98g7l4rHP/w+TC2wATzhAQN8rrsk7QXotz
 FDhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTRA2Xw4C5IO7mrsu3inObs8+CYqOjdKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7EFgHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4vGAWyKRBaJ9sldrVj
 Kn741w5CHh7ZibCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj6xzRB3zv9jZ
 MzELK5A6Er274w9k1JaoM9HjNcWKt0WnzuPFfgXMTz8uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikH1ivBnFSnCPq+Y7dAlSRVBiXMyeg5EHJ4arf1s9cEl8WqC5/F/UU9E890ijvryTp
 S/Vt44x4AeXuEAr3i3ROyo8Nu2+BsckxZ/5VAR1VWuVN7EYSd/HxI8UdoctfKlh8+pmzPVuS
 OICddnGCfNKIgkrMRxEBXUkhIA9JhmtmyyUOC+pPGo2c5J6HlSb8d74ZAr/siIJC3Pv58c5p
 rSh0CLdQIYCGFs+XJqHNqr3wgPjp2UZlcJzQ1DMfotZdnLz/dU4MCf2lPI2fZ0BcE2R2juA2
 g+KKh4Evu2R8ZQt+dzEiPnc/YekGudzBGRAGGzf4erkPCXW5DP7k4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9nvonhvb5XyAhgDU7nVVXzB+MyOGSC0OlOqrZJmu1TtzypV
 x/d4dJdI7iIZp/oSQZDOAo/Y+2f/vgIgT2Ov+8tKUD36SIrrrqKVUJeY0uFhCBHdeYnNYokx
 aEqudIM6hz5gR0va47UgidR/mWKD3oBT6R46c1KXN610lImmgNYfJjRKi7q+5XeOdxDP34jL
 iKQmKef1a9XwVDPciZrGHXAtQaHaU/iZPyeIIc+Gmm0
IronPort-HdrOrdr: A9a23:fJAqoapb2mWdhtg5sEeWHBkaV5uxL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGNXguNbnnxE426gYzxLrWJ9dOME/f
 Snl616T23KQwVoUi33PAhOY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX202oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iAnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDQ4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAqqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocZTbqjVQGbgoBT+q3vYpxqdS32B3Tq+/blnAS+pUoJj3fxn6ck7zM9HJFUcegz2w
 2LCNUuqFh0dL5lUUtKPpZ3fSKGMB2/ffvyChPmHb3GLtBOB5ufke+93F0KjNvaDKDgiqFC3q
 j8bA==
X-IronPort-AV: E=Sophos;i="5.88,375,1635220800"; 
   d="scan'208";a="63860118"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lxgis4sOxLOq/CLc/1A4V65Rz1ivzTY+OxbEApIJfxOXwwqNlmzchh1/hIte+S9NK8cpRPcA8gi6XdJPS5qvWjsyjBAQ6RzpgJaTbN8G/zTLTmvKcu7g4ScDdPq8BLmihWHif5R+fMNdF4E7iIpD8xixjb2bqILG6h298O7YdS1cHxKhR7z+yWPR4OI10REoiZL+JsZUdRxgIsI+JN5wd07Bi5aPcWqSv622N9bsReLRWzUDOn8JjRXSx3j4Yfqxx8Dx51iuGRnNdV0psthxUK2cqD+rDfIpNt0TDebPvjdZQMniBbS1a27dGZhCCduqZ32sY96hPe+MNtWw+IuiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5oYhkmLmM+trtw5ccrjv11z5sGlM9gOJ4043XAXVxs=;
 b=gfIA6ICeSCsc/5Fw1EHLF2t9VfsUMYDBn+rf/4oBgoufMuCh4MinnSqfxqSmBoO2hQ/bZ9T/NGaMDnmaxjXO88McONJDXGc7MVOXwDbjct/ch3uD4LLJKo+M+qiWPw7lDJaiLR49JMcViSq1e1HmewFCcdR/UEUQAzVfqJ+XI0tXqzmkYO0DedhodRJu6CgCjXT6KGtqqyWGjo4RmppxiQGfQp6S4rtP3hxF37MXIHpSIStIFbPexvyBprO53NBvhNJ6wvuGeVKhoCmxvcwdTm27N6RiqCPPJM692GetO2mlkCbLTiWze0yjiBrP2jHRWQxynF5aLHgAFnFOB4+kCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5oYhkmLmM+trtw5ccrjv11z5sGlM9gOJ4043XAXVxs=;
 b=HfT4BgUu0+j5+xYEitM4GJjPNk/9+i9Dfvlei+2K0H+91ZsPW+goNFMP2pB6sEIGCL+M4R5VLN2/83gK8jss8AfpNZrI4yOaPv9348RWWhNX//5ICNrL7EfOP99iakKXRSQkokw9EW6ifDFsaIX4AkfbpHLK2hAregHjBuys6k4=
Date: Thu, 17 Feb 2022 11:34:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George
 Dunlap <george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/3] x86/Kconfig: introduce option to select retpoline
 usage
Message-ID: <Yg4kwK7XJJPNXUD7@Air-de-Roger>
References: <20220216162142.15384-1-roger.pau@citrix.com>
 <20220216162142.15384-4-roger.pau@citrix.com>
 <b6dc1214-4f1d-f7df-50c4-d357a2380b30@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6dc1214-4f1d-f7df-50c4-d357a2380b30@suse.com>
X-ClientProxiedBy: LO4P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 872ad875-2f19-4de9-a75c-08d9f2011ce4
X-MS-TrafficTypeDiagnostic: SN6PR03MB3856:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB3856544605D79924FADB5C2C8F369@SN6PR03MB3856.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RyRnWxvVZjiSbDaNsq8199Cru00ILnAvdXLi+alL2qjcMkg7p0AOOfkjK8uYPu6/zlgZ7faYrZvWJcDUEIFVqPkQhsUnROLUGukkiERAhmHov4Qf/SaMGlXEXU8BggLkp6PtXQpsKvqcRzKoN4oteNYQyt5oNkIyjsYu1dliQBqjxwEx5q/jvvI4OJiReOHVWWbU2MeWXZ/CePtfHol0mVHgEwAZxgf873vWBhLKUlPlrZJxKUCMXwZzKePhf/myblxW7jJgbN+Jbd5GVW0yZJvSzcqmsGDRLR1eqTEvdSgjC+zDJiYd2O1k5aU3h8W24fLaGTp7rs+Yi019BiBlUFrXiSZblwcwBKQKBzrgEc9t8rfMvVXfQ66fdKwMMOfbXxP8Sd9FJisVP2axrfsuKASuvP6Xre0TVGCASS/W5/E/icyytOCOdPWe50GsqcuM5JdmgA129xb4WHLm5SOu5eyIfsfOWp7oKjXojATlgkeNY4AmaSvpX0gN1NjAJg4e0sWTdBiGs2kOV4N25kexuLKPriyX9d40m82URhrFeLENcmni28NRw4GoKMchw+EumU7y9wdLMeZeSTom3Hp1UkRDLdX0TlokCLVTGMDdgwXFoObzEiPX97ac3qqqAHUUvKnXmfJrexlbjSh99cD2vQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(6666004)(8936002)(83380400001)(66476007)(66946007)(66556008)(4326008)(6512007)(53546011)(82960400001)(38100700002)(6506007)(33716001)(186003)(26005)(8676002)(2906002)(6916009)(85182001)(54906003)(5660300002)(6486002)(86362001)(508600001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S01uUHc0dUJjUWx5OTZVeTVJRlhqbGFka3pNK0R6MndhaWpPOHBFVXBPMzNE?=
 =?utf-8?B?L0dzQ0VoSkF2WE54NEp1SmRSQk1pWEhTNExGSmh3MXpoVm1yZ0Q3MXNBaEwz?=
 =?utf-8?B?VFlGdUwxWDdGYXRVaHBuMktuZGRVTDNRZWxWQmFFTVNKQTRUZ3pHSys1R3VZ?=
 =?utf-8?B?aUgvZzE5RmZDSzloZXRPWEU2bkIxRFBWQlp5dXFvcm9hYlhNdTF2RmYwdStN?=
 =?utf-8?B?NjNrUzVBOVRjdDBwWDBtRlk5NzFuQWtwMEIwamNOazdKblVrTzRWdStvYWx2?=
 =?utf-8?B?eWRDOVhydmF5NERyYm9CSERsSzBqdno5dGlNTlJjQmZlS3FKT0ZUeHBGTG9S?=
 =?utf-8?B?a0hLd2R6V2FUTERXeE1uZHRsdEFVY3hDaUVaUWtyWVhicTFoWDZldGdqWWpP?=
 =?utf-8?B?cHVTTHdPME96elB0Q2xiU3hoelFaeWx2Qm9IWm8raXRoMHRVN3htZE12VzVj?=
 =?utf-8?B?UndMTDZNWjFGVThDWkwvYkJBeXJoTGlaZGtjVTA0UGdjaXE1T3FEUXNXS2FK?=
 =?utf-8?B?N2lqTnVNNGZjUk1SZXhQTks2MUZmNytpRWJSUWRtRXY4a2lNZXRnUklEL2l1?=
 =?utf-8?B?QXVlV3dGdWpwbDdUQ2VtNm9JY2dDZ09DbERYWXA4dVhwNWFiK3RqR0RmZ3h6?=
 =?utf-8?B?VGdsWGpQNWg3WC9JRDBkaE9tcDBXaERUY1pVc1hvTlhuWXRuOVYyOS9seVA3?=
 =?utf-8?B?VTBCZ1VNVWJzV2dGbXBjeU9ZMzBrdFFnZm00Vmd2K1pxZksyeW1rdlRKaWxB?=
 =?utf-8?B?QzlpZEdyZk82Q3ljZUJUQi9ZWHgvYm9Fc1ZtN3pjT25JcHVhZU5sVnA5YzZQ?=
 =?utf-8?B?QzZieEZHcE1mVU10Z1Y5Z2tuUDRJdlNpNkNTd0w4bGhTMVlLVk4vQzBhZnBL?=
 =?utf-8?B?Z3orY1NhcUNEUlZxSlNybjY3R21BR2NrcmJ1SmM3Mi91VTJ3SHJMeHNzeTVl?=
 =?utf-8?B?ZVBjclhEL3IzVHpjSVQzT25iNFBJVGVOc3lWcmRBQ1A0QWszcUxNSzZxeHpX?=
 =?utf-8?B?MEpVUzVJMTJuMXdOYTBXMkdjb0l2MW56RkNuSit2Z2FNRnZ5bWcwdytCUDho?=
 =?utf-8?B?WGRneFRIZWYveDRwUGh1dEpvZzRMZzBwWHlibUdPNjZiWVdOZmFDK2ZhV3lo?=
 =?utf-8?B?djlkc3BXcWJON0JZYmJMZG1HSys5UXhvYVo5S3Y1OUM3Wi9Kb0VSVGxGd2pT?=
 =?utf-8?B?WHFTT0RJUEMyMHhzWlNFZDRrSzEyUVcwbmkxY2pHQjFncTdtWWtTN3AxVGo0?=
 =?utf-8?B?UkVsMW5OWEgycDR2bnI0MjVVSEZOTkZud2ptajMxOW9FMlJmY2dMVEQxekJa?=
 =?utf-8?B?ZFhJc1ZjWE1JN0htOWtCU2xHTHFWK0lFZVV0WlRtYTdrM0FKQ1NxQnZSRzgz?=
 =?utf-8?B?TXBCTkNjYnhtQkNYc0JtaGptVWxtTFUrNisvL1ZLd1drcS9QSVFQM3I2Y1N1?=
 =?utf-8?B?dmpYWm1UdG1iSFVaeFlhcFJqK1AzL2Z3SkVqWk9LcFg4T2h1L0daNjJnRUFL?=
 =?utf-8?B?a29jdTQreXRpTHBDdXFwK3NHdEdGNXkrZkdQUjNRTDRTdHIzWjRkRC9IVXRP?=
 =?utf-8?B?aXFmYTg4QW9iRk5DMWE4RUpKMGw4RWJrQjdwNkVZSWtuZHIrK0dHNXZ3K3Nx?=
 =?utf-8?B?WUEydnV6RG5sM3VqOEQ3bWRJSnZqTmRhNmFPai9OY2dpbWNzY1pybG9iU1lE?=
 =?utf-8?B?K09vNlNjdStJcWV3b2VVVnJjVmFCbnhYbTZnTDBZZi9hdnlkV0ZXUDdTQUdh?=
 =?utf-8?B?R0ZwUDhlajNUTnpCOUNyajdRSTFrY1dmRVJhOVdEYWtCRE56ZkF2NktGZ1Qz?=
 =?utf-8?B?c1B4QkxjY1NGemd1UVoxKzNTRzlTVFBNUmFlVzdTMFBFUGg2MG0vdTBoNy9J?=
 =?utf-8?B?a1Z2S2xScE9jajNENVI5Q1lnQWswL01BWEtPRk5tcUQxejFaUEhrRU9ScDdX?=
 =?utf-8?B?SC9vdXVvMDd0Zi9ha3JQZytIU0d0TEdqcldzSjFSc01tUDhHSlg2MDB5UkYy?=
 =?utf-8?B?L1BRMFF1Z1JtYm9FbWltRUhmcmNSSXlFL0xxaTFyb1puTEhRa013bWFZMDRi?=
 =?utf-8?B?cVdlT2wyNW9FUFJFZU1TV0tKbjVVcEd5bUJneno5eUNVb0xVbzhacm9abWYw?=
 =?utf-8?B?eVJodlNCVmIxU0txNFpmbG5pZS9la3hzcE56TDhJZGN3UnB0ZFFCNFhLME1u?=
 =?utf-8?Q?Gvu6D35JAvsxvffKJexXFPY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 872ad875-2f19-4de9-a75c-08d9f2011ce4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 10:34:44.4991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/NyHulpKtC7jNr8n9CKj2sNH3wrGUnVwADhmEE4lvAQpmTYswXN11kDXcPZxhVSzAFrbYqKi1iRQlN3+pU2EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3856
X-OriginatorOrg: citrix.com

On Thu, Feb 17, 2022 at 10:07:32AM +0100, Jan Beulich wrote:
> On 16.02.2022 17:21, Roger Pau Monne wrote:
> > Add a new Kconfig option under the "Speculative hardening" section
> > that allows selecting whether to enable retpoline. This depends on the
> > underlying compiler having retpoline support.
> > 
> > Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> There's one aspect though which I would like to see Arm maintainer
> input on:
> 
> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -38,10 +38,6 @@ config GCC_INDIRECT_THUNK
> >  config CLANG_INDIRECT_THUNK
> >  	def_bool $(cc-option,-mretpoline-external-thunk)
> >  
> > -config INDIRECT_THUNK
> > -	def_bool y
> > -	depends on GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK
> 
> Moving this ...
> 
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -146,6 +146,22 @@ config SPECULATIVE_HARDEN_GUEST_ACCESS
> >  
> >  	  If unsure, say Y.
> >  
> > +config INDIRECT_THUNK
> > +	bool "Speculative Branch Target Injection Protection"
> > +	depends on X86 && (GCC_INDIRECT_THUNK || CLANG_INDIRECT_THUNK)
> 
> ... here despite being explicitly marked x86-specific looks a
> little odd. Since the dependencies are x86-specific, dropping
> X86 from here would make my slight concern go away.

Right - I've added the X86 because I was concerned about GCC or CLANG
also exposing the repoline options on Arm, but that's not an issue
because the compiler tests are only done for x86 anyway.

Feel free to drop the 'X86 &&' and the parentheses if you wish.
Otherwise I can resend if you prefer.

Thanks, Roger.

