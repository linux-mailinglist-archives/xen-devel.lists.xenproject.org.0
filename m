Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A6541B93F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 23:26:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198500.352035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKbm-0000gJ-EM; Tue, 28 Sep 2021 21:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198500.352035; Tue, 28 Sep 2021 21:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVKbm-0000da-B5; Tue, 28 Sep 2021 21:25:50 +0000
Received: by outflank-mailman (input) for mailman id 198500;
 Tue, 28 Sep 2021 21:25:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEZ0=OS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mVKbl-0000dR-Cj
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 21:25:49 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 246451a2-4a84-4326-8df4-f31d0b11b926;
 Tue, 28 Sep 2021 21:25:48 +0000 (UTC)
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
X-Inumbo-ID: 246451a2-4a84-4326-8df4-f31d0b11b926
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632864348;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r36IDjkSiVvGqD4nOqlPWvK6xFaUyhejF+Z45ussmkI=;
  b=ID6Xi9AQJomxVpS/upURu2kEv6YznzFPr4EBpOXkWYe4t//LrdvWIQw/
   O9X97RpeN0cqSYUTtlvPWe9Iszr5xboSyLy6VFuMkfN+9kO5932ZSA+cN
   TX9JKe6KbB5OY6igtNBvY82S+B5R+cvtnhdHpZqrrrD0e2khy9elKwVBh
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VVAZle1NcVjyPDZhe5BqVFoVG6kz8g+6PD2H3UycCgEFGeNe2/oYioVwu/oAqSxzQPOt9HAI2u
 yd7uQgxd5E/k23wxXwQlt60c2pvB0C03Z1i2AyxbrcBKUNshLTHVc9ZScQqrRJdHGqPQXRTOio
 +9qEyU+qN2Ea30ry97+w1i0xFvtlEJfD5F3QK7Lzc5FThoX2mn9Jsjty5N1YKS0EAu4qw3Dq6z
 RINOsCYPWgZ/6QOBq3fPpIRYUlwoBL8hqZ06/pxL3v1S1j92dcsFWjcyiJV1QvhF1fd3AeKxSJ
 3wW7NVDxGh3pYQ8oZq1mLa1V
X-SBRS: 5.1
X-MesageID: 53844264
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XYRm0qNVd21QDsnvrR3QkcFynXyQoLVcMsEvi/4bfWQNrUpw1WZTn
 DccDD2POquJNDP2KYtyO9ux/U4P7JeGyIA2SAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En552Egzw7VRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxHZtvkqw
 YVWiZahbiR5JJPPgcpCbBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWxg2pwUQ6q2i
 8wxZ2o3STHSbzZ2Hlo6FJ4fkraXqWfCSmgNwL6SjfVuuDWCpOBr65D2K8bccNGOQcRTn26bq
 3jA8mC/BQsVXPSd1D6E/3SEluLJ2yThV+o6Hrqy/O8sjUaTwmEWARs+Wl6yoP3/gUm7M/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwD+Kzq3Y8gOIHF8uRzRKaMElnMIuTDls3
 ViM9/vkATFpufuIR3OY6qyZszqaPjIcJmsPIyQDSGMt4sbhiJE+iArVSdRuG7Lzicf6cRnyy
 T2XqCk1h50IkNUGka68+DjvnDaEtpXPCAkv6W3qsnmNt10jItT/PsrxtAadva0owJulokepm
 CgtspOXvPsyB4Cqt3yXfuYUMu6W6KPQWNHDumJHE54k/jWr3nese4FM/T1zTHtU3tY4lSzBO
 hGK5lIIjHNHFD76NfYoP9LZ59ECl/CIKDjzahzDgjOiiLBfcxWbtAVneEKdxWzklEVEfUoXY
 szAKZfE4Zr3E81aINuKqwU1jeNDKsMWnzq7qXXHI/KPiuH2iJm9E+ttDbd2RrplhJ5oWS2Mm
 zqlC+OEyg9ETMr1aTTN/IgYIDgidCZgX8Cr95EILbLcfWKK/V3N7deKmtvNnKQ/w8xoehrgp
 CnhCie0NnKl7ZE4Fel6Qi86M+6+NXqOhXk6ITYtLT6VN4sLOu6SAFMkX8JvJ9EPrbU7pdYtF
 qVtU5jQU5xnF2WckxxAPMaVkWCXXEny7e54F3H+O2ZXkl8Jb1Ghx+IIiSO1r3RRUnrr65Fuy
 1BivyuCKac+q81ZJJ++QNqkzk+rvGhbn+R3XkDSJcJUdlmq+49vQxEdRNdtSy3VARmclDacy
 SiMBhIU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTOm4rima
 MVU0+r4bK8NkmFVvtcuCL1s168/uYfi/ucI0gR+EXzXRF23Ebc8cGKe1MxCu/QVlL9UsAe7Q
 GyV/dxeNenbMc/pCgdJdgEkcv6CxbcfnTyLtaY5J0Dz5SlW+rubUBoNY0nQ2XIFdLYsadEr2
 +YsvsIS+jeTsBtyP4bUlD1Q+kSNMmcED/ctuKYFDdK5kQEs0FxDP8DRU3ek/JGVZtxQGUA2O
 TvI1rHajrFRy0eeIXo+EX/BgbhUiZgU4U0YyVYDIxKCm8bfh+9x1xpUqGxlQgNQxxRB8uRyJ
 mk0aBElefTQp29l1JpZQmShOwBdHxnIqEX+xmwAmHDdU0T1BHfGK3cwOLrV8U0Um46GkuO3I
 F1MJL7ZbAvX
IronPort-HdrOrdr: A9a23:/gyrVqEjkZ5/D+g0pLqFYZHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HlBEDyewKjyXcT2/hvAV7CZnibhILMFuBfBOTZskbd8kHFh4hgPO
 JbAtVD4b7LfCtHZKTBkXGF+r8bqbHtms3Y5pa9vgVQpENRGsZdBm9Ce3am+yZNNXB77PQCZf
 +hD4Z81kCdkSN9VLXLOpBJZZmNm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZvA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQfZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv3nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLYU5nghBgq/DWQZAV1Iv/fKXJy/PB9kgIm3EyR9nFogfD2xRw7hcsAo5ot3Z
 WODk0nrsAXcie6BZgNctvpevHHflAldyi8eF56EW6XYZ3vBEi93KIfwI9Fqd1CK6Z4gKfbpv
 z6IRplXCgJChnTNfE=
X-IronPort-AV: E=Sophos;i="5.85,330,1624334400"; 
   d="scan'208";a="53844264"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqrsB+p+vWAVd1ITKTTmP/ehRe6aJFHcG8zg5LPqom6yIvubE0ePtk4Uhp/2KKtsycTSz5EXaYDpI3FFSOWEr1htj5s8rZZUJHJuK116VO63CZcVlATBM+qJ81q7puGEFoYnrBABH32LaD4rz4J2WUW5QDRkiMOU46WKZp4ueACWUFxK9PqQHWYF65o09g8MSRsU7VNlENnuLOkWviqsEETLn68nb4vH8XKL1jQBBX6+IEpZdOMs4Wskz5DpEPE6TGIapBF/PIX3J7lTVh5CyZ4R1uy09uxMYUptYaW0Tt+eh3+kk1AVpajz2ShSLmAh2/ZKJukw6MwfYuhS8LAhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=FfVQOJQU/3cOO6NgzgvvzaHk93JVCT/jCrFjKqyGcbI=;
 b=kGOPXSmfZlDY9aoAqxybah/6HEpD0CQXR5zfdAr60xwSLi2iSES2V6wqub+G6xk7cM+m8EHUp42mDCo+FbvuSWVRXP8ygpB7LYk8F3cBauR8yN+R9T/wROP5J4iCectn1mtXGvMwSW82A+RNmZydVyRx+ODxyyR1SmAl7GNt95dw/5FJ3vDQAyqE9lorQwS4seWid4v5ph03ovfLd+0KWT+IGeJ5gqZi8Qydn+txVqV+sKwyzR4iJSw3eI29rUuo+GcQgB87x2/usQc4aOBAG41x8ATcc23tMea4DwORrL5gI5Y7oqZFqgSAZPSk/EOe/hqe2G9P0ogLkK+8fH545Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfVQOJQU/3cOO6NgzgvvzaHk93JVCT/jCrFjKqyGcbI=;
 b=C1JnPUjzgGzDjf9OhSm0JVVw0FvTrwCtXdSNJgQDWqOq8PYJq54gIwm8XbeT0lDPz5PqfOVwiqexUZzSSpthCaZ/ToKtUXvdjDf6ERiezYb96CP4lN4RDj9QbAQz+C5Cg0eyBR9vZPLjNNkdkxU23uEvZFGVtSAQ5l6JiRA2HS4=
To: Bobby Eshleman <bobby.eshleman@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <cover.1632860589.git.bobby.eshleman@gmail.com>
 <8c340b24b41af349069ad55e1f0421e17fad1d6f.1632860589.git.bobby.eshleman@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 6/6] x86: change asm/debugger.h to xen/debugger.h
Message-ID: <01339331-1607-dcbe-7d6c-2033d5ae3874@citrix.com>
Date: Tue, 28 Sep 2021 22:25:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8c340b24b41af349069ad55e1f0421e17fad1d6f.1632860589.git.bobby.eshleman@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0382.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a00f317-2cbe-43bf-872c-08d982c68246
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB6342EBEC2DC1D086904FCDB9BAA89@SJ0PR03MB6342.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36oikk8XTPQEfO3UiG1hFe+jntmWNLSNiA/OYkzdKycdUISX3plEKzEb35iMKg+Jy4gPEEJf+iPH6KMpYaHRScgK9w3LvgTMV+jB8ErIxil48iv5uW+leKVLcA4ecsdALWt1vXi5XjRfm/M89XMicftq4IM4kaNnilCAUAbqUd37BgeYBVf8mLQgKjVt55esXwlad3HNzd/9ozGxTlMXxT/SFi/OrJy/KACV/HyRM0GX6h895XiOpkJiB3MdJjU+yNBAKVKM8VYzYREaUd/xpJuKVE0T3MbKenGmzIvqfJW5dCiQvRooWUYrkO4h+HC14LgZHevoOW8v7buqw0oUAomJqIXPxkLfZtlsmoCmeBVEuoWnKO7nbtBW8XDkqluHuauLIXucHdYzvbwjm1nrz1CG998MYohZX+Es7ZmQNewwvrguqf79ZWJmf4YBtY69UyjZdZ01bcs+vU0kpczPN5y1AvEdhDVA+/0e+1j1AqQhnb0H0TitH4HN6AUA7jdFkbS2X40dn2W7a/cMExG51j+TUGy54ekfT6IlE2e+8/vFuZgE4XeSIabPmpNEU475RxCV/D2N6BuFXem+RpuQSLC/cIkh+R15ARa6sGkP53pqKotHSx7NKmZxozY6O1t7v8py6yqUfrNg1k0AXyHOVgorGhEdgQbthUHtGeEy3nnr7dL7VISgHdvY2lhMCLz9hFnGXszY/T6JU1nOK0UdT72dQkTFCRn9kGw0cIxKdpFemqOeRkYeQlhWktgQYaKoWTwhOMQ+zkCcEJVALUhMT57O+ou2U1DU7WZ0YT9N2QfUkdV/DyqNSTFaihowqRAgTFqsyf4Zd8vmzJ8EB0JfMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(36756003)(2906002)(86362001)(31696002)(54906003)(508600001)(26005)(2616005)(53546011)(956004)(8676002)(8936002)(316002)(16576012)(5660300002)(66946007)(38100700002)(66556008)(55236004)(66476007)(186003)(6486002)(6666004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGVSL1hwdmNtNDF4MVhtZ3BNMVI3R3hkT25JMTJvNzA2T1JJemZDTGp3SWl1?=
 =?utf-8?B?dTU1M3NNbGtsMWFmVE04b3dTMHM4cjZZU1NvTUloS0dtRnc3L1VXS0RmUXho?=
 =?utf-8?B?SHFOdmpQcE44cHpLeDA1WXpuZXFrN0xzZHpwcFhvZFRham5RelJLbVRwUnlM?=
 =?utf-8?B?elYybW5oTFR0VmdGa0pmeUhiNGl3NEZqM01oa01zK1IvUnR4WGQ0Wm5LdVRq?=
 =?utf-8?B?M3BWWktRWmxpM3BXWHgzYUNtcGdtWXdDZmUyVEc3YVhLTnRsQkkvVkIwVmQv?=
 =?utf-8?B?MTdEL2FFU1pLSnFmcys3V0NJckEwZkN2em12OGIxckZMR1dHeVJoTk83VDdy?=
 =?utf-8?B?cHNnamJWZWlOUTBtOXYyZ3hnZjZjVEkrUFl1QjZkd1dLR1JmTmVxem1YUnpP?=
 =?utf-8?B?WE1wR0c4RUw4U2VMSjkrSHkwck9yRi81Sm41NHhQdktkemgxN0FvRWN5QTVv?=
 =?utf-8?B?V2o0MXc2bEE0elpsODc3cHIvMTZ4TWc5YUtrWXgwYmxreVhic2FRUnczb1VR?=
 =?utf-8?B?dnUxR3pEZS9NYUtiY202UVBlK3RoVGxQOWlCOWd4SkRPcUFSV0FwN0p5Ui9V?=
 =?utf-8?B?Z0EzVlRBUHk1K2dIN2ZHY3hiYjlxUXM5bW1MeFRvRm5pWkxySFFXNE5vNk9H?=
 =?utf-8?B?a3pZMFZCek1UMWd4ZU0wSDJYenNjTml0TUowemplUlV3aGxQRFhWbDYwS1Nt?=
 =?utf-8?B?QlA1RjkydVVaQmx4dUlOM0xRMkxQd0hwRS8ya0FQY2x6WUZXR3B5TlBSZjFs?=
 =?utf-8?B?ZE03ejRyTE1VUHlRYjYyYkxMQ3FzYlpib3ZOaE85VEdvckF6VlVkYkNDMDdE?=
 =?utf-8?B?YXlsUEJyc1hIU0FRQ3FYaDJ1enJIdkZMeTVFckZCTHYxYThHUUovWmMxTzhM?=
 =?utf-8?B?S1VFc2p0bjJaUWt6TUpENXcxTHpmRi9yMnBzaFQ3SzRWaWhnL0QwZkdDNGdh?=
 =?utf-8?B?MGhWcUJ5VUFXa2RzaVllLzJpM2NSbEt1bElWWUxEVGROMjdRUW5RbndGeVlj?=
 =?utf-8?B?Zzh4Snkzd2N6QjJrQ0VTNnlMWWJuQ20wVkQva25NenBYODJGb1pCd3RoMXdo?=
 =?utf-8?B?djdLOGZrMnVyTzVnNVJvZm5GL1JZK1VrZ01EeXgzNitSZ0VwY2pzVVIzNUpa?=
 =?utf-8?B?OG03SzMrQXRXbklJM05xWTJnc3RTWC9OTHFkVFJreXdtNXZ1T3F3QVpxamo3?=
 =?utf-8?B?aWNUUEJMWVhVNnlac0xCdW9yanI3djAxWkRRQWowM0lOc09BWDhYR2l3Snh5?=
 =?utf-8?B?SHE1bC9xbFI2dU9FY1BMblgzSEs4ZE9VUUpBdTFJKy8zY1doMTNkcldpa2Z0?=
 =?utf-8?B?R3Bib0xKMEJOeGxHeDZEYThPQ0tIaC9RZU5wbElNWmt2WEF1OWxMb210WGxP?=
 =?utf-8?B?MmtzamtvQWVVQkV2Ty9WTFdOVm5hRGRiZnpYZWk3SDRGNCtxOUlaZVpNSjJr?=
 =?utf-8?B?OHVvWkdLTlpLVVZnYmp6clE5SHdqOTMyYkFmMnFlM2NMUGFINGNkbTNBQ25a?=
 =?utf-8?B?ZjhXV3hhb1YrdjdoaE55eGFiT2hOOGVBb1RUbW9pUWMyZnloNTRMR0VaWkFK?=
 =?utf-8?B?Yi94dHFzUU9KYnZ2TU54UlJEYUw1N3N3RXp6OEc1R2hJZkdlM3U4aGJNaEs2?=
 =?utf-8?B?WFg1WEN3aDdUdHQzbGw5VHNkSU5YZTEwSzBRbk5JOWJZNGhBSnFoeDgwQUpq?=
 =?utf-8?B?YUtFSEsxQ0pPdmpkeVo2S1dJNUM3dmJFbU5SSFV2YmlZUm1ySkxYd1F5RFVl?=
 =?utf-8?Q?WEYovQzmZCmh1fb8tjXEZuJRetDl2dIpiV+FpGJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a00f317-2cbe-43bf-872c-08d982c68246
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 21:25:35.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TFNOqD1j7q2zPhKX3dOnKqpv5/1x7O5HPSumnTXCblTPQmspn/5XeLQsxZIesh55/YDKVZ4jtcjSe1bi6nTaON0SiZq+D7hTCvMRwjraMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6342
X-OriginatorOrg: citrix.com

On 28/09/2021 21:30, Bobby Eshleman wrote:
> This commit allows non-x86 architecture to omit the file asm/debugger.h
> if they do not require it.  It changes debugger.h to be a general
> xen/debugger.h which, if CONFIG_CRASH_DEBUG, resolves to include
> asm/debugger.h.
>
> It also changes all asm/debugger.h includes to xen/debugger.h.
>
> Because it is no longer required, arm/debugger.h is removed.
>
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>

Julien also acked this patch.

> diff --git a/xen/include/xen/debugger.h b/xen/include/xen/debugger.h
> new file mode 100644
> index 0000000000..ddaa4a938b
> --- /dev/null
> +++ b/xen/include/xen/debugger.h
> @@ -0,0 +1,51 @@
> +/***********************************************************************=
*******
> + * Generic hooks into arch-dependent Xen.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + *
> + * Each debugger should define two functions here:
> + *
> + * 1. debugger_trap_fatal():
> + *  Called when Xen is about to give up and crash. Typically you will us=
e this
> + *  hook to drop into a debug session. It can also be used to hook off
> + *  deliberately caused traps (which you then handle and return non-zero=
).
> + *
> + * 2. debugger_trap_immediate():
> + *  Called if we want to drop into a debugger now.  This is essentially =
the
> + *  same as debugger_trap_fatal, except that we use the current register=
 state
> + *  rather than the state which was in effect when we took the trap.
> + *  For example: if we're dying because of an unhandled exception, we ca=
ll
> + *  debugger_trap_fatal; if we're dying because of a panic() we call
> + *  debugger_trap_immediate().

This comment is now duplicated in x86's asm/debugger.h.=C2=A0 The x86 copy
wants deleting as part of this move.

> + */
> +
> +#ifndef __XEN_DEBUGGER_H__
> +#define __XEN_DEBUGGER_H__
> +
> +#ifdef CONFIG_CRASH_DEBUG
> +
> +#include <asm/debugger.h>
> +
> +#else

#include <xen/types.h> because you need bool and false to make this compile=
.

~Andrew

> +
> +struct cpu_user_regs;
> +
> +static inline bool debugger_trap_fatal(
> +    unsigned int vector, const struct cpu_user_regs *regs)
> +{
> +    return false;
> +}
> +
> +static inline void debugger_trap_immediate(void)
> +{
> +}
> +
> +#endif /* CONFIG_CRASH_DEBUG */
> +
> +#endif /* __XEN_DEBUGGER_H__ */



