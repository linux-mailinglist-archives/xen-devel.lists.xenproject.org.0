Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EAA4B2496
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270415.464699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUHd-0006Ud-Py; Fri, 11 Feb 2022 11:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270415.464699; Fri, 11 Feb 2022 11:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUHd-0006SR-Mk; Fri, 11 Feb 2022 11:40:13 +0000
Received: by outflank-mailman (input) for mailman id 270415;
 Fri, 11 Feb 2022 11:40:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFbI=S2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nIUHb-0006SJ-TT
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:40:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cba7a2d-8b2f-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 12:40:09 +0100 (CET)
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
X-Inumbo-ID: 5cba7a2d-8b2f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644579609;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0m4hF9xQsEb/cBEDuVUNVhY5NgilRTh0c7SxCggoh30=;
  b=NWyUXd7gP/ZvBC9Z62UGzK5ybxTjHZwj46YiQtS0L9dYIOWVPgV5fy6w
   4Gfrx9eyHeZSM1iQ5dZ+w8E5CGy1FX0XfXWLMIwsoKr/b+oiDHkMxVssP
   4+0PaTi6JIbxNugzNVqdXE37L4Nrk11py1IY2woPMArKtFuf4aqiHtAEo
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: t9UxLRNYCtq6mURdsbkDvB4mWMrz6zVC7yt0T02Q480gnsUmJN0w4mX3/GONbDNMt1fFfHNBqB
 mU5hsrT54m0Qnu8mQczfblxx13A0w8DnaxI+/xN2Bwljl+Utzq2qzThB9TuDyJdazdN6fGVpfB
 WIf711MyMf08ZsHMr4nk56w50f6JrKL/lq38WbBkASior7yTHV3SK8/mn9ys+qf0mnvFkrHLS2
 3Fu36rl/RXMPKNNm+F/W4xLwI0DnfRb9yiWIRp+R/zyP9J55ByO5jqbyvODV6Z8V1zvRaBpdFu
 h+tLpWCnDO62/uXXkw8MNO70
X-SBRS: 5.1
X-MesageID: 63454880
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0m978K/40JXcILu0Y2VpDrUDkniTJUtcMsCJ2f8bNWPcYEJGY0x3x
 zMXUD2CM/qMM2bzKdAgbdy/oBhS7cLSztYwSQdkris8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhU+
 fxGjbi3cTskI/31iPswXgZZN3phaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGh2tt2pAeRZ4yY
 eITdyt9Qw/QeCZkN3QYBZg1vtW6nWHWJmgwRFW9+vNsvjm7IBZK+IbqNN3Za9mbX/J/l0yTp
 n/F12nhCxRcP9uaoRKi9n+vnebJkTnMZJMJFLa4+/hph3We3mUWThYRUDOTiOOlh0uJfsNQI
 k0Z5AIjtaE3skesS7HVRRS4vXrCpR8aVNp4Gvc/rgqKz8L86QuDGnINSDIHbdU8rdI3XhQjz
 FrPlNTsbRR/vbvQRX+D+7O8qTKpJTNTPWIEfTUDTwYO/5/kuo5bpjXLQ9V4Gai5lOrcHz3q3
 iuKpygzgbYUpcMT3qD99lfC6xqurJXUSg8+5i3MQ3moqAh+YeaNfJe04FLW6fJBKoexTVSbu
 nUA3c+E44gmD4yJlSGLaPUAGveu/fntDdHHqQcxRd97rW3roiP9O9ALiN1jGKt3GuM1UDTRR
 EjrhQ5MtKZDI1ancq5TOJ3kXqzG0pPcPdjiU/nVaP9HbZ5waBKL8UlSWKKA44z+uBNyyP9iY
 P93Ze7pVC9HUvo/kFJaUs9AiedD+8wo+Y/EqXkXJTyD2KHWWnOaQKxt3LCmPrFgt/PsTOk4H
 r9i2yq2J/d3DbWWjsr/q9d7wbU2wZ4TX8GeRyt/LLDrH+aeMDt9Y8I9OJt4E2Cfo4xbl/3T4
 la2UVJCxVz0iBXvcFvWNi05NeywB8sm9RrX2BDA237yihDPhq71ss8im2YfJ+F7pISPM9YoJ
 xX6RylwKqsWEWmWk9jsRZL8sJZjZHyWafGmZEKYjMwEV8c4HWTho4a8FiO2rXVmJnfn5KMW/
 uz7viuGEMVreuiXJJuPAB5Z5wjq5iZ1dSMbdxagH+S/j22yrNY0e3as0pfa4agkcH3++9dT7
 C7PaT8wrujRuY4ltt7PgKGPtYCyFOViWEFdGgHmAXyebEE2J0Kvnt1NVvimZzfYWD+m8amuf
 7wNnfr9LOcGjBBBtI8lS+Rnyqc35t3Oob5Gz1s7QCWXPgrzUr4wcGOb2cRvt7FWwuMLswWBR
 U/SqMJRPq+EOZ25HQdJdhYldOmKydodhiLWsaYuOEz/6SIupOiHXExeMgOikitYKLcpYoopz
 f144Jwd6hCliwpsOdGD13gG+2OJJ30GcqMmqpBFX9O71lt1kglPOMWOBDX37ZeDb8R3HnMre
 jLE1rDfg7l8x1bZdyZhH3b6wucA148FvwpHzQFeKg3RyMbFnPI+wDZY7S8zElZO1hxC3u9+Z
 jprOklyKfnc9jtknpEeDWWlGgUHDxyF4E3hjVAOkTSBHUWvU2XMKkw7OPqMox9Foz4NIGAD8
 eHK0nvhXBbrYNr1j3k7VkNSovD+ScB8q1/Zk8e9EsXZR5Q3bFIJWEN1ibbkf/c/Pf4MuQ==
IronPort-HdrOrdr: A9a23:MGJsSqyJmHb8zg8WeoxgKrPxiOskLtp133Aq2lEZdPULSKOlfp
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
X-IronPort-AV: E=Sophos;i="5.88,360,1635220800"; 
   d="scan'208";a="63454880"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzio09cVLTvCH1jQz7xFJiY0q5MvRnievUhL/HJYqUoQkvk5slpmi5raW1R5hDLIa1SOwB666lREPAmpniG2zxw0c0YeZljjmuiGIqy9C9lSu3YovODWS84fDAOyqMoxd/kxIkXbj7LrAVFOIrnwQrHuhCuv7UBtvJIZVPnXowrSHgMJFh8ZytA46ISY9TL5UTkJQY0zPbA/IaL2gUkvi8lDmQDVBF5n8mzngIOKPpoVQEXFFcsdVNMh4m7+vz1Ad2keVbn5I7vqmeH2qAyLZtu41Jgj6hmcMmi4si7saP8Hl3Jz85ypblvY0nqc8DPc1BTgGVfZftgFXkcY1K1Sbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhEqp8JLPp0ZrWvMW0UOYxMzPylgA9nxtDTn5hBjpZY=;
 b=ZuZYdJnuygGzYaw4t4BsrX+lYDFO0XeJLjFEAW/FAwVCNnWqHnDIO+2A2CyEa+6flIhkE/SM4fVmP+5LhamarGzVV/diln1sI4t+QBa1if7ifKYoGn4iCgerSn5xkGJURIIKSMsIgzQa1t6hJtBPn4i4rTAq7aksDwsIJgZ+8aPuFXF3tf96NgIt8v5HzkDvFW+F3ib0IU/qed3FX6P+uw4AjOSW7fOjn/APxOnVn8F18momdqmrvw+5TN+HG4MHPypJnZTywURiqETzTNrLLMbxOQhpzd/jP5VOf0y1kp9QL2SEUtZrkRU/IVTese0/ILDeLTPYvWaBV6PsI5Id+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GhEqp8JLPp0ZrWvMW0UOYxMzPylgA9nxtDTn5hBjpZY=;
 b=uqybv1MoDgixlKgd1RksagnWz1uWEtlYZypxsFYOxupjzEeW79o6g/7eYFodH9lru2yUAgy0DjeT/Axh5MkymobDiku1GPRjEreVKPdfDPU29qgMIMhsnDgf9MoPwpJkC7P+bk0MlNvlBMihp7un88TcazvwpFAbLC7RsV2zsa8=
Date: Fri, 11 Feb 2022 12:40:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Message-ID: <YgZLEMW9US9QjjYG@Air-de-Roger>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
X-ClientProxiedBy: LO2P265CA0491.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b035ff4f-ff0d-4e44-fa02-08d9ed533ed9
X-MS-TrafficTypeDiagnostic: DS7PR03MB5655:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB5655EF32D78836B3F618B2FD8F309@DS7PR03MB5655.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5EURhCTzzJWpY7BhYV+R++ig1bMxl0+QOOH/k/YRWshaP8HRm5ghcr2coXJUXvP7VUsX3HZdxBzAC4bx+O+oGnI5HDqUK0O4Za+wyWuxJ4Vwff+ECb1TVSSjMvqjIOqZsLMhaW/bh1WOeItFNsgTdl1g2fBZdqUBuSt04wf4qPeoIGI/uzmZG/gj/9o9ItKeS9Pb0YHzJzq0G91fhsq1QF3FkJE25DsdKehxFixU6A2cLK+Q3o0t9q5VZwkAJcy3aZ9umGgTM3356pCP5R/3WZLldfCLmyrcY3H6AdcwH2nq30xcGnE8R2x8qDDqDlDwl17ldIXmuLrEd4DiMw24auKBFUyHJRCmxgv3pv2G6JNbyOu6M9POkksgjioLwa0FnLY5g8bDuka2V2TBfTvI+2Fi9YApOyVcwQ3j+NIbPb3J8Kajr9ZOC09QeWbA6p2TJv5q3sITZpLQ0TzgLyPwzZDr9Nu31W4uFNXSy6cLDxJWK/qLSEfjqBp/hZPJ1WoJ3yqVTqk9a970xyEJO/hLEyZwa5zbeLdEEMe8/jgGTsv1BKLMM9QU64BnqBR9rmnkvYaJqJ614IWtwSVFp9f0T27YNqJwLJm4TmZB/8zY/6YXOJizgSAVpL4MYitFfj5EOnONy0Smt1cAVlifvr6h4dV80dLQGqafdZJj3hQ6CgwiIfxC38KbbHnvzzoMeSj4i7TbssQffknEzjwFRhewMxavUM8RMsOohz2ikJJZYk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(85182001)(6486002)(8936002)(966005)(53546011)(2906002)(508600001)(38100700002)(186003)(83380400001)(6512007)(26005)(5660300002)(7416002)(316002)(66476007)(86362001)(6506007)(6666004)(66946007)(66556008)(6916009)(8676002)(82960400001)(4326008)(9686003)(33716001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?citZVCtsVHQyM2RYelpZemxiSmxMVzVDSUxHSzFiV2hMZlJndk9HbkFGZ0hu?=
 =?utf-8?B?bCt0aktYMUpjaVE3dW02Y0JkUnRqSmFFT3o3SWtidGIwUjBscFBuSFI0NGdw?=
 =?utf-8?B?Y2grKzNZajBmeVR0bDJIME5mOUVQZ09pdlUycmNOUlgwam1KUzZ0Z2cvMWQ1?=
 =?utf-8?B?K0svTTdDdUNHWFZoNU96VGdSNXBqRzduNkFHaEwwUjViaGpKN2pQRkduMnpr?=
 =?utf-8?B?MVAxcXp6aU8rUHRZTGQ4bjZnaHE1eG52TUZqMmVVZDVMQlVuWlUzRmVnOTh5?=
 =?utf-8?B?ZFVTNzN6YW1nZFFla3AreHRLZTA1enVoQk94REV3RkdsQ1RqQm9vOXpaVDk3?=
 =?utf-8?B?RDU2UmhycUdoZGxCeFE2QkYrRXJOQVVYWmw4L0RaQWh5ZUlZUjZlSERQZlNL?=
 =?utf-8?B?TlN3cDdYdW1wZUxsUlg4OGtpSEVWM2N5S2N0a2hJQmROOTdrdjdTYmhVSXdL?=
 =?utf-8?B?VnR2SU4zNVdZTyt5M3Z3UmNUaE1vVlp0b1VwTkhPd0FySXBZT08vREtIWlQ5?=
 =?utf-8?B?UWxrMlUrV3o3ZXpwMHB6REJnVzgxQXhvbWh5S2dRY1plYzh2VmpCdmV0YVpz?=
 =?utf-8?B?bHFOaGhKaCtMb0RjZzdzV3grelpPU2dpZ01uWnhuS1Z5ODhkUTJiVEVaQ0Ra?=
 =?utf-8?B?a251VFpUU05kc1cvUlBtbXFNMWxmOE12Nkt5ckUyaGRiKzRyc2dzSXUrWm95?=
 =?utf-8?B?L1Z5M1Jsc0lzM29nQ0t2OS9uMmRIYjVLRGIzQkE4Y29QZmRVRmZnVUFPOExU?=
 =?utf-8?B?UG80cEY0dGR2b3ZrMWZYdEZuZXJGSWFGajdJNzkvMHQ1dndEenZPWFlqbmNi?=
 =?utf-8?B?OERDMmJBb1JtV0ZubVdEMHNBSSs3NkJqTlpHZmVaaDczd2pSK2ZFVjVmUVFX?=
 =?utf-8?B?VjJweXhNeUxBWW5aTXNMT05rYjQrYVBjQWxrSzd1TUtRdkducDlyaXZyTm9T?=
 =?utf-8?B?Znl6UFZIK0VDeDJvTXNGbzFyOHhFSVhYZzlkcC81YkdrRlhYSVNSc1RHUGlS?=
 =?utf-8?B?RU5TSC9RWGV0YnB2VjMyRHZQTEIrNjdvUmYyTXZCQW50aEovU0twTFhGdWpK?=
 =?utf-8?B?RTRPTjlJdjVRYTJlYXJHR3NCbWJPRUU5UEIzVS9OMC9CTEExdGZ1MHl3WkhQ?=
 =?utf-8?B?TTRWRkl6Wkk1dVA5QWUxbjRDVGsxRjg3aVBicWVlZ0hMMWcvc1JyeGtENTdT?=
 =?utf-8?B?TlpERzdscitJemVKU3JvaERRVld1SjZsVEhDU3J6UVR5Mk9YVXB2Z0oxQ1dU?=
 =?utf-8?B?c01ONkdCeGN3ZHJFYlVTWCtXRmhQZHQ5c2NFU3loRmdMMlJQdGg5SlhPdjlk?=
 =?utf-8?B?dG14TXdCL1l5aGRjTjM2TmV3L0thKy9ZUnAxY29pNGlXUG84KzEyejJWT2pM?=
 =?utf-8?B?c2M1U2k0YldWUXJlYU9jUXRMMlY3L2NwSEpUVWhwRUN0bHQxKytwM1pGTDcx?=
 =?utf-8?B?ZnpTVThPYVVZdEVlTGRsWElSQWVjSHZ3RHl5MlUyQ0RhSzNHN0NYTmdXbUxV?=
 =?utf-8?B?YjViUDBVandzcVFzTW50ZDVQOHMvYytXa2pMUGJkM2pOWnVrYyticEs1U2E2?=
 =?utf-8?B?dzUrelZ5WEJ3U3IzWmhqeHVjMUgwdVd5RHladlpGTXM2Z1ZHQmpOYnFzL2M0?=
 =?utf-8?B?YWE4WGJjM0VTMFpvREtQK0ZWdzhZbXhFWDZlSWg2d3g5S2JIbC84KzZ2Z2R4?=
 =?utf-8?B?dmNFNitVbGFneEFFeFZaZDdoNjFrK3dYTjRjdkxkQzVPVFhFSTcySHd3a0lk?=
 =?utf-8?B?OEpyc3pVUEhyNnp3WXJuRVRYYzRGZUZOZzZ3Mmpic3BNNHptckxibnppMmZL?=
 =?utf-8?B?Uy9iOWF4aXgrUjBKKzM2QXJzQjRQUHZMVFFLeFM5VWZwMVZJeTBGS01ZMXZ2?=
 =?utf-8?B?OXMwZ0U2YnVSOGlEWVNtMXptclJtaWhHTGl1bmRRUzlqdmRMdXAzaUp6aDlj?=
 =?utf-8?B?cmwwRVQ3ZDAwSGRuRE1lT1JEbjQvRm95Y3RzNCsrWjNVRnhpbFdaOENYbHJ0?=
 =?utf-8?B?bWV4UkZ2NXJJTHFVUjh4R2wva2xiQW95RnFoMFNxblhDQjU0dktvbFhlUjlw?=
 =?utf-8?B?bVdFMnhwd3NudkR5ODlnbm11empDR2taWTBmaGY1UG5lRm4wUmx0d3I1YU00?=
 =?utf-8?B?YnJXaXN0Nk12djFWdzVkazBxZFhKSGlrQjFIVG5VWTRuM0V2Q0RCQkt3ZHho?=
 =?utf-8?Q?1y08Hwo2Pxjco2/I7xPPUeE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b035ff4f-ff0d-4e44-fa02-08d9ed533ed9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 11:40:04.4520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXhue4oUtg7Zykj+Zjp051gqWhH6Kh+vmZ5+LMqwzUB0Zg0mzMUDeYH002oDD3dOqhmhpp11rAMVePMyrXCBVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5655
X-OriginatorOrg: citrix.com

On Fri, Feb 11, 2022 at 07:27:39AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 10.02.22 18:16, Roger Pau Monné wrote:
> > On Wed, Feb 09, 2022 at 03:36:27PM +0200, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> Introduce a per-domain read/write lock to check whether vpci is present,
> >> so we are sure there are no accesses to the contents of the vpci struct
> >> if not. This lock can be used (and in a few cases is used right away)
> >> so that vpci removal can be performed while holding the lock in write
> >> mode. Previously such removal could race with vpci_read for example.
> > Sadly there's still a race in the usage of pci_get_pdev_by_domain wrt
> > pci_remove_device, and likely when vPCI gets also used in
> > {de}assign_device I think.
> Yes, this is indeed an issue, but I was not trying to solve it in
> context of vPCI locking yet. I think we should discuss how do
> we approach pdev locking, so I can create a patch for that.
> that being said, I would like not to solve pdev in  this patch yet
> 
> ...I do understand we do want to avoid that, but at the moment
> a single reliable way for making sure pdev is alive seems to
> be pcidevs_lock....

I think we will need to make pcidevs_lock a rwlock and take it in read
mode for pci_get_pdev_by_domain.

We didn't have this scenario before where PCI emulation is done in the
hypervisor, and hence the locking around those data structures has not
been designed for those use-cases.

> >
> >> 1. Per-domain's vpci_rwlock is used to protect pdev->vpci structure
> >> from being removed.
> >>
> >> 2. Writing the command register and ROM BAR register may trigger
> >> modify_bars to run, which in turn may access multiple pdevs while
> >> checking for the existing BAR's overlap. The overlapping check, if done
> >> under the read lock, requires vpci->lock to be acquired on both devices
> >> being compared, which may produce a deadlock. It is not possible to
> >> upgrade read lock to write lock in such a case. So, in order to prevent
> >> the deadlock, check which registers are going to be written and acquire
> >> the lock in the appropriate mode from the beginning.
> >>
> >> All other code, which doesn't lead to pdev->vpci destruction and does not
> >> access multiple pdevs at the same time, can still use a combination of the
> >> read lock and pdev->vpci->lock.
> >>
> >> 3. Optimize if ROM BAR write lock required detection by caching offset
> >> of the ROM BAR register in vpci->header->rom_reg which depends on
> >> header's type.
> >>
> >> 4. Reduce locked region in vpci_remove_device as it is now possible
> >> to set pdev->vpci to NULL early right after the write lock is acquired.
> >>
> >> 5. Reduce locked region in vpci_add_handlers as it is possible to
> >> initialize many more fields of the struct vpci before assigning it to
> >> pdev->vpci.
> >>
> >> 6. vpci_{add|remove}_register are required to be called with the write lock
> >> held, but it is not feasible to add an assert there as it requires
> >> struct domain to be passed for that. So, add a comment about this requirement
> >> to these and other functions with the equivalent constraints.
> >>
> >> 7. Drop const qualifier where the new rwlock is used and this is appropriate.
> >>
> >> 8. This is based on the discussion at [1].
> >>
> >> [1] https://urldefense.com/v3/__https://lore.kernel.org/all/20220204063459.680961-4-andr2000@gmail.com/__;!!GF_29dbcQIUBPA!gObSySzN7s6zSKrcpSEi6vw18fRPls157cuRoqq4KDd7Ic_Nvh_cFlyVXPRpEWBkI38pgsvvfg$ [lore[.]kernel[.]org]
> >>
> >> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> >> Suggested-by: Jan Beulich <jbeulich@suse.com>
> >> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> ---
> >> This was checked on x86: with and without PVH Dom0.
> >> ---
> >>   xen/arch/x86/hvm/vmsi.c   |   2 +
> >>   xen/common/domain.c       |   3 +
> >>   xen/drivers/vpci/header.c |   8 +++
> >>   xen/drivers/vpci/msi.c    |   8 ++-
> >>   xen/drivers/vpci/msix.c   |  40 +++++++++++--
> >>   xen/drivers/vpci/vpci.c   | 114 ++++++++++++++++++++++++++++----------
> >>   xen/include/xen/sched.h   |   3 +
> >>   xen/include/xen/vpci.h    |   2 +
> >>   8 files changed, 146 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
> >> index 13e2a190b439..351cb968a423 100644
> >> --- a/xen/arch/x86/hvm/vmsi.c
> >> +++ b/xen/arch/x86/hvm/vmsi.c
> >> @@ -893,6 +893,8 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
> >>   {
> >>       unsigned int i;
> >>   
> >> +    ASSERT(!!rw_is_locked(&msix->pdev->domain->vpci_rwlock));
> >                ^ no need for the double negation.
> Ok, will update all asserts which use !!
> >
> > Also this asserts that the lock is taken, but could be by a different
> > pCPU.  I guess it's better than nothing.
> Fair enough. Do you still want the asserts or should I remove them?

Likely fine to leave them.

> >
> >> +
> >>       for ( i = 0; i < msix->max_entries; i++ )
> >>       {
> >>           const struct vpci_msix_entry *entry = &msix->entries[i];
> > Since this function is now called with the per-domain rwlock read
> > locked it's likely not appropriate to call process_pending_softirqs
> > while holding such lock (check below).
> You are right, as it is possible that:
> 
> process_pending_softirqs -> vpci_process_pending -> read_lock
> 
> Even more, vpci_process_pending may also
> 
> read_unlock -> vpci_remove_device -> write_lock
> 
> in its error path. So, any invocation of process_pending_softirqs
> must not hold d->vpci_rwlock at least.
> 
> And also we need to check that pdev->vpci was not removed
> in between or *re-created*
> >
> > We will likely need to re-iterate over the list of pdevs assigned to
> > the domain and assert that the pdev is still assigned to the same
> > domain.
> So, do you mean a pattern like the below should be used at all
> places where we need to call process_pending_softirqs?
> 
> read_unlock
> process_pending_softirqs
> read_lock
> pdev = pci_get_pdev_by_domain(d, sbdf.seg, sbdf.bus, sbdf.devfn);
> if ( pdev && pdev->vpci && is_the_same_vpci(pdev->vpci) )
> <continue processing>

Something along those lines. You likely need to continue iterate using
for_each_pdev.

> >> +{
> >> +    /*
> >> +     * Writing the command register and ROM BAR register may trigger
> >> +     * modify_bars to run which in turn may access multiple pdevs while
> >> +     * checking for the existing BAR's overlap. The overlapping check, if done
> >> +     * under the read lock, requires vpci->lock to be acquired on both devices
> >> +     * being compared, which may produce a deadlock. It is not possible to
> >> +     * upgrade read lock to write lock in such a case. So, in order to prevent
> >> +     * the deadlock, check which registers are going to be written and acquire
> >> +     * the lock in the appropriate mode from the beginning.
> >> +     */
> >> +    if ( !vpci_offset_cmp(start, size, PCI_COMMAND, 2) )
> >> +        return true;
> >> +
> >> +    if ( !vpci_offset_cmp(start, size, pdev->vpci->header.rom_reg, 4) )
> > No need for the comparison if rom_reg is unset. Also you can OR both
> > conditions into a single if.
> If we open code vpci_offset_cmp with a single if all this is going
> to be a bit clumsy:
> 
>      if ( r1_offset < r2_offset + r2_size &&
>           r2_offset < r1_offset + r1_size )
>          return 0;
> This is a single check.
> Now we need to check two registers with the code above and
> also check that pdev->vpci->header.rom_reg != 0
> 
> I think it would be more readable if we have a tiny helper function
> 
> static bool vpci_offset_cmp(unsigned int r1_offset, unsigned int r1_size,
>                             unsigned int r2_offset, unsigned int r2_size)
> {
>      /* Return 0 if registers overlap. */
>      if ( r1_offset < r2_offset + r2_size &&
>           r2_offset < r1_offset + r1_size )
>          return false;
>      return true;
> }
> 
> So, then we can have something like
> 
> static bool vpci_header_write_lock(const struct pci_dev *pdev,
>                                     unsigned int start, unsigned int size)
> {
>      if ( !vpci_offset_cmp(start, size, PCI_COMMAND, 2) ||
>           (pdev->vpci->header.rom_reg &&
>            !vpci_offset_cmp(start, size, pdev->vpci->header.rom_reg, 4)) )
>          return true;
> 
>      return false;
> }

Just create an 'overlaps' static function in header.c.

Thanks, Roger.
> 

