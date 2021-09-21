Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5E9413655
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 17:39:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191768.341872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mShqo-0002E0-MS; Tue, 21 Sep 2021 15:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191768.341872; Tue, 21 Sep 2021 15:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mShqo-0002C9-Iw; Tue, 21 Sep 2021 15:38:30 +0000
Received: by outflank-mailman (input) for mailman id 191768;
 Tue, 21 Sep 2021 15:38:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QjZ+=OL=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mShqm-0002C3-Hc
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 15:38:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d0d4a79-5ce6-406d-b78a-0ba23dc1cfc8;
 Tue, 21 Sep 2021 15:38:26 +0000 (UTC)
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
X-Inumbo-ID: 3d0d4a79-5ce6-406d-b78a-0ba23dc1cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632238706;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NteqrtrplbuAWatZPBQGbZaXrPDW2ncs3CSYvcFo8BE=;
  b=SjkbddrH4dF6DD/q06hpWHupyMW2lTBdlUxRvce+L+rLZbu04YN7u5Nz
   p/d9eaQudvP1iiHMWGSdVhuAInWSWYWvVnQmG38v65inkARZArg4f4HxQ
   2HsD+6xe4ukKEb5FPxrjmvGnZ52uM4ld0zrnfBYQiC7Q0fyGL5YtVfXrz
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: osL35eMDgcguAYM9jvE38O1LvAyYJVpwcH5l4yKuam+x5DsdW+gathWEJN07xZ/vJaoKMhZN1x
 bwRQqo+qiZ+1I+QPPCjLwEfUpCZLvHZAV1JgQZXjq3D8CodLtiP15s4vskU3RoK0Hhm/q7YgJd
 YwxiWQzKbLZVV4z0BdCIkKxYk9jecGrMaKIfhdLr/KwZ0qvEc2UVBI0b2fHjBKxxB7wpzd3GO8
 3C1D0cF3G3fxfA07JJlckSYAbvn8cEEkKNOEq8UPKP4hLi03ADQhsp/p/sPZczQE1pJCWv2FTJ
 sOsN9aWuSsVLLVy/BDT6IKLa
X-SBRS: 5.1
X-MesageID: 53252430
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:L/kXV62bublyV2q3dvbD5fZ2kn2cJEfYwER7XKvMYLTBsI5bp2FWm
 GAZC2GPP/rbamr2ed4lPt6w9UxTvMKHyddlTwZrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Eoywbdh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhr+570
 4VXt6SMSQItOLb9vt4bWTxFDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t3ZoTR6qFP
 6L1bxJ3bD3NbT9tAGwsK6Adscu2xWOvSzpX/Qf9Sa0fvDGIkV0ZPKLWGNjfd8GORM5Vtl2Fv
 W+A9GP8ajkFMPSPxDzD9Wij7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKali4iUcEACe8C1AGIzqzP0iCjAGIhUyEUPbTKq/QKqSwWO
 k6hxo2yX2U/7uHNEBpx5Z/P8mjjYnF9wXsqIHZeFFpbuYGLTJQb00qXJuuPBpJZmTEc9dvY+
 DmMsCF2rLEal8djO06TrA2f3m7ESnQkSGcICuTrsoCNtVgRiG2NPdXABb3nARFodt3xc7V5l
 CJY8/VyFchXZX13qMBofNjh4Znzv6rVWNEjvbKfN8Z4rGn8k5JSVatR/Ct/NC9UDyrwQhewO
 BW7kVoIvPd7ZSL2BYcqM9PZI5l7lsDISIW6Ps04m/ITO/Cdgifcp3owDaNRtkiw+HURfVYXY
 8bDLZn0UiZEVsyKDlOeHo8g7FPi/QhnrUv7TpHn1RW3l72YYX+eU7AeN1WSKOs+6cu5TM/9q
 b6z7uOGlEdSVvPQeC7S/dJBJFwGNyFjV5v3t9ZWZqiIJQ8/QDMtDPrYwLUAfY15nvsKyreUr
 y/lAkIImkDigXDnKBmRbiwxYr3YQpsi/2kwOjYhPAj01iF7M5qv9qoWa7A+YaIjqL541fdxQ
 vRcI5eAD/1DRy7p4TMYaZWh/oVueA7y3VCFPja/YSh5dJllHlSb9tjhdwrp1S8PEivo6pdu/
 +z+jlvWGMNRSR5jAcDabOOU42mw5XVNyvhvW0boI8VIfBm++oZdNCGs3OQ8JNsBKEufy2LCh
 RqWGxoRucLEv5QxrIvSnamBooqkT7l+E05dEzWJ5Lq6L3CHrG+qwIsGW+eUZzHNEmjz/fz6N
 +lSyvj9NtwBnUpL7NUgQ+o6k/pm6ou9vaJewyRlAG7PPgaiBb5XK3Wb2dVC6/9WzbhDtArqA
 k+C97G241lS1B8JxLLJGDcYUw==
IronPort-HdrOrdr: A9a23:Zm7gN60puGOrW6NbWYqT7QqjBSVyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5OEtApTiBUJPwJE80hqQFnrX5Wo3SIDUO2VHYUb2KiLGN/9SOIVyHygcw79
 YGT0E6MqyLMbEYt7eL3ODbKadY/DDvysnB7o2/vhQdPj2CKZsQizuRYjzrY3GeLzM2Y6bReq
 DshPav6wDQAkj+Oa+Adwc4tqX41pH2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbdz9U278t/U
 XMjgS8v8yYwr+G4y6Z81WWw4VdmdPnxNcGLMuQivINIjGprgqzfoxuV5CLoThwiuCy71QBls
 XKvn4bTotOwkKUWlvwjQrm2gHm3jprw3j+yWWAiX+mmsD9TCJSMbsLuatpNj/ir2YwttB116
 xGm0iDsYBMMB/GlCPho/DVShBDjCOP0DkfuN9Wq0YafZoVabdXo4Ba1lhSCo08ECXz751iOP
 VyDfvb+O1dfTqhHjDkV1FUsZmRt0kIb1O7qhBogL3T79EWpgE586Ig/r1cop9an6hNDaWt5I
 z/Q+xVff91P5YrhQ8UPpZ3fSKNMB25ffv7ChPaHb3WLtB0B5vzke+C3FwU3pDhRHVa9up+pH
 z+OGkow1LaPXieUfGz4A==
X-IronPort-AV: E=Sophos;i="5.85,311,1624334400"; 
   d="scan'208";a="53252430"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8DixBTsG/MOu3scJmyyGG8rkvOJ0xKOlbgonsrmqBGruICypbtv5xC/u1ISghX8aph53yPQXLeMQQL5UKNYlXnDWcVv1vBhmQK1X/rFFTUQ0DMEH+nyw/RAM8QlPp4h3oaLhMeOg5bq142ucT11VC8MSgExUB+4zT1Ns/CK4ZFOV1CdIr211Wyzy/WnAYfvQHuWEdaXF91phPR4FRG5dgZzIhy7rdAwr6W+qCgmwHi9LkdktmCl994k4RVxAO+OVazi63Hf98b1g1LBZ9cb3Z4o6FO+CwIfQ5rtpQ3Lms5HjNtNnaEJaJ4ye5DXN2wUB14D6F3LfeDCgfdlivpDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sML6edXhxYzBIQD6A7kp2iSgs2pWQoBFQae2K5EC6ww=;
 b=lwewnhwx08tGKjXI5PdK8+tO6EBsOmkMaXLYrZb479Hcyv02BZDK+Ot3fH9N5Ba/+ERktZ2ER5MqZrcXcctE8m3LF1rRS4Pn/LRRTQhrmwcvoPoBxfTTIORJEfg9oR0G0eakC+ii3i0tC+rYQXObgkQXIuer20mFeaxM7s9YUJS+VnsbsTwVNEpJMK0Iw9/+ZfN/FGT1YMmyGxw+Ri76CDjcxJw38QgHS9oljB20csRQYTSu/1CO8UYBzGJDAlBGdqpgp5RWKTYiregV0ozpBifUEEaYGvCF36gyBKEIdFAlHmx0RyI3BKT+SOgczzu9vJrU4QzLFzamg6afG1SYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sML6edXhxYzBIQD6A7kp2iSgs2pWQoBFQae2K5EC6ww=;
 b=Ks2OrZrKArarrRfEcpVDFBtJn4iX3RvUUd++BArG8Jvviv6si18IqrHemMXWUrZrR1n2VCLTcAgHIJwzBY05BPkfJckzSyqBMpwrPLRUEdgVZAWIPSNIq90hbcfXwcHjZ9ckIugFykdLncTN9ONNjHEKPc3RuBov4Yu3lpFDC88=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-5-andrew.cooper3@citrix.com>
 <1ec8d289-5c34-412c-c683-189cd5506600@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 04/12] x86/hvm: Reduce stack usage from HVMTRACE_ND()
Message-ID: <f85e82e9-b75f-5b49-b1a4-86fc90ebde84@citrix.com>
Date: Tue, 21 Sep 2021 16:38:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1ec8d289-5c34-412c-c683-189cd5506600@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0190.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37cc925a-1f06-4b59-2f2e-08d97d15d86f
X-MS-TrafficTypeDiagnostic: BYAPR03MB4615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4615A06A381C29F4F5615016BAA19@BYAPR03MB4615.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wrbz4m81TK1K8EoObr5FV6eOfSu/7+kero3sZKksehVlqs21ej9KUuW7dvsr0lzV8gVNXBqiGWxB9u0cJf00EtbswJARr+T61Au4+9mMfMQmYiCV3aDCleTqC/Ck+1iJ5oUky3av4+eIIJ0w7hjIcxWcydJxIskSLtgpht61YpV1F+SWQJJRMjgc31MDJKWVs156xvWrkBdcDeiqIQzk2ifu0Y/fkB4JG8GWyvxUPSYWsekTqaYxzVjgpEJl4rf0hmr2gcMzUkTIn7R5WilA4qDCPirrGzC77F7L1/pxqlCDCsnTpLrfFDHDRM2xW2N0lWs0qksm/bHZ1AqvgXOn7JxloeGbHDHzfTzvW4M+Qw7pA4wREXK32RRn4cYARxvRkwMFYomgzmgPIbpHqY0uah/chFFkf6PxYSlLRhaZbj54Smd9cBXGgyYVh5WspwEw5LZOEBJP9CbICl7deIXgtJIM1tFxssvVPL63sd4bvIIN9/NULX0je1hDEHlP3haiTMeeReWkCK3Zd7jXznphaU4i1II9zhdiSxJ0k5HooGgrH5yWPENAoAuTAPoCrNayuzKz0xdkpTq052bMOOfikygGWk8zOkvs09vGDMUFgwcRYyYyS7dISKbOeWofjl9BGmDeI34H/MqTXqTOBULXprhWlYOv9UfJjtw68Ao2s4yPLxGFFf9r8AInD4OsvoDkpENV34tV8xtCDDTBzixsKPQHQIsKlWR+CqzDw3+Mt4A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(6916009)(4326008)(54906003)(86362001)(16576012)(31686004)(66476007)(38100700002)(66556008)(5660300002)(26005)(66946007)(316002)(31696002)(2616005)(508600001)(186003)(83380400001)(956004)(8676002)(55236004)(8936002)(6666004)(6486002)(53546011)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWZwR2tqS0YxUUFBQ2ZBaTVhVHVLT3JsbURtdmkxbUU3MWQ1eUQvdHIvRnpI?=
 =?utf-8?B?OUx0YUk2SkZhZkFKemFrZVRsams3ZG80SWwyOWREN0pMSkZ1NXdPR3F3Rk1p?=
 =?utf-8?B?Z2FoV1NHVkVKelJFbnlCeWVkMnFoK09HRXdzZDNQbFFiU3RCcHlRWnE3M0t0?=
 =?utf-8?B?cGhZVzRSV1BhRVhwbzFxdXVkUkY0U0RkQTh1TGl5MHRWSzZiQy8vb0lhNVI2?=
 =?utf-8?B?QTRrY1kyNDJMbVZtTVlNTG5JdXd6aDd3OVJjd2xvdW9GVkRmeXdvc1F1TVdV?=
 =?utf-8?B?eGpqTlA2RG12NmFzMEpicG5nTXkzc3lFWU1KUUZ3ODF4OUdDcW9TblBBR3Nj?=
 =?utf-8?B?aU5DVkRFS2ZDYWRmU2RMOE43VTF3UUl5V0VjMTVwWHdkdVY0SURjOEVTRWNx?=
 =?utf-8?B?Syt1d0ZOYllUS28ybG9XN1dUZ0pnUUd1VjBBTVAzdDFJQStDM294U1NSTHJl?=
 =?utf-8?B?MCt2c3NWM3lOVVM4ZG9SejR3T21VSUF5WFZOcTRqRzlNQ0ZacUZqWTV2UjY2?=
 =?utf-8?B?S1B1bEtLVHhaaXFIK3k2REt5OTRMOE1qZXBpWXdpKzcvbXhaRFNoeGkzWGRo?=
 =?utf-8?B?Q0lpOEZsSkNYQ3R6bklzbU9naUJPZjVIQnJPUDQ2QkFncW9Gby8xdk1WNGtC?=
 =?utf-8?B?Z1VxbnRzZGN5enkyYzl3OXdHeE14bEVSQWRzS0VXdkt2ckVKWVN1U29hUm9J?=
 =?utf-8?B?UGxPR2hURHJIL3BGdThlUDFuRGhjWGU5dmUwWDNxS2dOWXZFclRISTBGUWY0?=
 =?utf-8?B?dExtNXZKcWFNRGJteTBqR1hZWGdYcHFoRjVYTU5ORXdabWRmbW96dFBHNXJj?=
 =?utf-8?B?YWd5d0RJTHpEZ2dTc3ZkckNMYSsxV1l4TWxsUXpudmFkSG5CZDQ0dC9xWjhW?=
 =?utf-8?B?bU1zQ3BKVUN4SUdmQmNLM2NhME05ZVY5YmxKeTd0dVJnU2UrM1dWcGpCRGdF?=
 =?utf-8?B?dXMzcm8rSU42MElLOHBuNEtZK3Z2bTlEZzhOKy8zTkw2REVQV3g5dWc0eEZO?=
 =?utf-8?B?Q2M3UjM3dTVWcWZ3cWdWVGl6Wm9PVDNtUU1WdVhCanY2M2YwN0t4aVdHMkt0?=
 =?utf-8?B?RkZIYzg0akh3VlAxSUhDY0dFbWREZXR1K2hWaXEvSGZZS3l4SkNUN05YdkFy?=
 =?utf-8?B?d0JnRDVXdDc4U3laYkVOUG9QWW1TNG1FMGdNRG1vZUVQaVFoNVJtVitQZEFj?=
 =?utf-8?B?YXZMZHA5ZERzcy9haC9MUkVQeno5cmxDcDdiTkJ2OHgvVS9ZTkg4Vys5MmpE?=
 =?utf-8?B?UGgyT2hGMlVBZ053SzVQaGpCNEU0RjA2bFQySFBNNTNFd1hvRkxYQ1dxY2tV?=
 =?utf-8?B?MlR4MGs2V2RIME1RR3ZkR2k4a1AwUVRLYWxlQ0tJc1ZhVEEyWG00aVBzeFo2?=
 =?utf-8?B?aitnR0IrVnMrQzdFMUowTzBaME44Ukh6VnFKVHowZkZOcXI2d0k0M1JGUXpN?=
 =?utf-8?B?cm1KNHhDQTJSR0Rxc3Y4dG8vVVdqeDFPSTFmdEc2L1hYWWFBREthY1JvcGc1?=
 =?utf-8?B?L3R0c0hKNnRVdk16MUtRVHZ5Zmg2L0tKb2RlOFBINllJRXp2Z0hZd3BMM3dN?=
 =?utf-8?B?V05BYTFEYWpLT0VmcS9ycGdOSEFnejYwdTNCNmRKVW9uditLb21QT3FBQzly?=
 =?utf-8?B?L1FPcStZdmd5dnA3V0VHUWxUM2JsSmtQNnRINjJIVGd3bDhJM2tXMUtpVVNQ?=
 =?utf-8?B?YjZxckpvNG8xK0VoQ05ZQWpsZGdhMVhLVFQ1SWNTK2VMTm8wK0xkRWp5NlV2?=
 =?utf-8?Q?bY8Xumd35G73+IgxXQpSv5poAOZ1HCmBIHSiUEM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cc925a-1f06-4b59-2f2e-08d97d15d86f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 15:38:23.0535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +j2NEFjog2M6d39Aje2hQTnRYc0k8RrqOHSQCFjSeMbSgvVW34OKWAl2T1GQABvQzZ7Ctv+1SygEJj0A9x7uwT9Awmwb95Gp+i8TnGfe+NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4615
X-OriginatorOrg: citrix.com

On 21/09/2021 12:00, Jan Beulich wrote:
> On 20.09.2021 19:25, Andrew Cooper wrote:
>> v2:
>>  * Adjust callers of HVMTRACE_ND() too
> What does this refer to? The sole difference to v1 that I can spot
> is ...

Oh - its me who was confused.

I thought I had failed to include the changes in vmx.c/svm.c in v1.=C2=A0 I=
n
which case, no change to that in v2.

>>  * Drop _d[] for the 0 case.
> ... the one corresponding to this line, i.e. ...
>
>> --- a/xen/include/asm-x86/hvm/trace.h
>> +++ b/xen/include/asm-x86/hvm/trace.h
>> @@ -67,38 +67,30 @@
>>  #define TRACE_2_LONG_4D(_e, d1, d2, d3, d4, ...) \
>>      TRACE_6D(_e, d1, d2, d3, d4)
>> =20
>> -#define HVMTRACE_ND(evt, modifier, cycles, count, d1, d2, d3, d4, d5, d=
6) \
>> +#define HVMTRACE_ND(evt, modifier, cycles, ...)                        =
   \
>>      do {                                                               =
   \
>>          if ( unlikely(tb_init_done) && DO_TRC_HVM_ ## evt )            =
   \
>>          {                                                              =
   \
>> -            struct {                                                   =
   \
>> -                u32 d[6];                                              =
   \
>> -            } _d;                                                      =
   \
>> -            _d.d[0]=3D(d1);                                            =
     \
>> -            _d.d[1]=3D(d2);                                            =
     \
>> -            _d.d[2]=3D(d3);                                            =
     \
>> -            _d.d[3]=3D(d4);                                            =
     \
>> -            _d.d[4]=3D(d5);                                            =
     \
>> -            _d.d[5]=3D(d6);                                            =
     \
>> +            uint32_t _d[] =3D { __VA_ARGS__ };                         =
     \
>>              __trace_var(TRC_HVM_ ## evt | (modifier), cycles,          =
   \
>> -                        sizeof(*_d.d) * count, &_d);                   =
   \
>> +                        sizeof(_d), sizeof(_d) ? _d : NULL);           =
   \
> ... the addition of a conditional operator here (which I assume was
> something a particular compiler didn't like in v1).

And was covered in the commit message:

> The 0 case needs a little help.  All object in C must have a unique addre=
ss
> and _d is passed by pointer.  Explicitly permit the optimiser to drop the
> array.



> FAOD - I'm fine
> with the change, but I fear I'm overlooking something (again).

Thanks,

~Andrew


