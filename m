Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA58F490583
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:57:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258067.444007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ol2-0000Kg-1U; Mon, 17 Jan 2022 09:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258067.444007; Mon, 17 Jan 2022 09:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Ol1-0000DK-PS; Mon, 17 Jan 2022 09:56:59 +0000
Received: by outflank-mailman (input) for mailman id 258067;
 Mon, 17 Jan 2022 09:56:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAtW=SB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n9Oe7-0002gi-Eg
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:49:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf1df7a9-777a-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 10:49:50 +0100 (CET)
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
X-Inumbo-ID: cf1df7a9-777a-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642412990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=GlovccLDToYwCvRVLd9sQIK0IeyVPStg1EO7D40y/DI=;
  b=PYywJCgfU+mao9KXaBxse5Eznf6M20/9B0NCXZQDUZX+E4U76FsoR1bS
   cuNa3V3DXlVRhFLgv6AoUQ7xtmkOWaiPFF8Gdt6Qq2TgNsSImh5d5Yz0q
   fjolDAfgEGL8On/v+nIprordspOwgUSKK3zuJAoBoY2Z0GDm6fDzTKdnQ
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: qe64F4JRAwsG+7eT08XLyZDMYBBkZ3TBFwCMQwOoWQxnF+L1x+VtvTYnoOu0mqTGn5m6P7DgbA
 Wds4jgYFA32PZZ9PEatOAwgJkZ4nksnU2SpmWeZuLmmabUDYpyG0oIV2j2yT/V8ZTagMsFKi9U
 0DuHGej5QmedBi6x7puT/MUXfP4TQP/lPeWi7APtECwlHXfmpuGzk+z/uho+0tDuoYdxenSWCM
 kASlH1c2Ej7x6X02thYV2LWgPLXB/4p0lxBtwZvm8BUiiNvzvMQLofNlwYqCZxmYazGiqwjzAw
 ugEsxs2Csz9FP8H+13KVRoIi
X-SBRS: 5.2
X-MesageID: 62053317
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VvuFjK/tU2+o9UhPk1t6DrUDcHmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 2UfDTrTPPqCY2akeN8lb4vj8RwP6sSHyYRmGgs4/ns8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dg3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhJ8
 foX9rrsdT0UZPKPmvoAWjtqHCxxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhm9t3ZsXQp4yY
 eIHVDo2TQmZYicIK3oeBqM6gL72pV3gJmgwRFW9+vNsvjm7IBZK+LriKt3OYfSRWN5Y2E2fo
 wru/W70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3N
 Eg86ico668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT82z+2XCsiEgJ7VYZ5980oWDUI5
 FCEkIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHFm3+17sCId60msEbkraRqIr4OBcAM67x6/somNvlIgP97Ni2BFBDHmARd8wGSxEwPpU
 JsswZH2AAUy4XelznblrAIlRuDB2hp9GGeA6WOD5rF4n9hXx1atfJpL/BZ1L1pzP8APdFfBO
 RGP41gMtMQDYCf0Pcebhr5d7exwkMAM8vy/B5jpgidmOMAtJGdrAgkzDaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxaIMmeHI8gPUsQ7nlmnwv7HMmjpzz+iOb2TCPLFd8tbQXfBshkvPLsiFiEq
 L53aprVoyizpcWjOEE7B6ZJcwBTRZX6bLirw/FqmhmreVs5SDp/Wq6IkdvMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAghDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:GmKyZqMvxRC0b8BcT1n155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/exoX5PwPU80lKQFnLX5WI3NYOCIghrPEGgP1/qB/9SkIVyEygc/79
 YQT0EdMqyIMbESt6+Ti2PZYrUdKZu8gdqVbI/lvglQpGpRGsZdBmlCe2Om+hocfng4OXN1Lu
 vW2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnU4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUqZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpgoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPWi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZOIMvD0vFmLA
 BSNrCe2B4PGmnqLUwx/1MfjOBEZ05DXytvGSM5y4moOzs/pgEP86JX/r1aop46zuNPd3Bz3Z
 WxDk1ZrsA/ciYoV9MOOA54e7rONoXse2OEDIvAGyWuKEk4U0i93qIfpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.88,295,1635220800"; 
   d="scan'208";a="62053317"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dt+s23475bN6HFOOwEEMWv/89+WpGsQ68zzMa1TWjI5ztPhYcjWuYvj5hdLUrWHL1r7G/g7Uzh1dnhA3c6Fg0Mh0lpj5X2rIvk4JzNjYy0xet7ETHFZKdBAxTAaZxWz9J6R60qmx1chhPhsnXuRwvYDnRMOy2fw2IKeQpSgyBAFd9L+U6IGlflAutg36z5CCVkL8KJW10mI4+7IEaH/A57tHvAM41Y0cY8ZEkArwvqFhmx4zupBObxfxpHlUDVg3HvlFxWxNukFlI5F5UWfqnFU7qZ9yaxcGAXYnv3hXz4aVAMKHsqzquQfbQkjI4pXsMvnvOIaVkNpE6iP8iEkzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvVyJPcTpNqTGKTTNLfJR3VNJZ2GihJ2r9YUvS7z6lk=;
 b=fqmpdUxJZoXQw7SIC+51Y1OcaSWYDDOitrgtQWqFyGL1g6eNBb6R2zyMAIMIpe/pETRryX5CU5+1UK1z/lPo6c9KCQVeBFJEzupEZ4khMEnu3OY/1FNFIlIfh7pi9VRVc8rZfWev0zvBfm21HZZeXdJP0oHO1Qk2k6coei181iX7+QlaxRk5znFTWc1/pzuCwbKmIotPv+bad/gqLlNP0WViB4FZG+DRLKPFpn+avHs0VblIwzuwOGzNIn90YX0/0Q0LTbOhtZfNg2rwEBnzEYcZD0/y7DOKqQjCx/FZUfaD3Emda/8EamcP6zvfwWYkUsP8nKP5ppHso+wfLks/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvVyJPcTpNqTGKTTNLfJR3VNJZ2GihJ2r9YUvS7z6lk=;
 b=cvUHwlM3puKkR7++jtndfhuXDPkVTIUnS2k4pjRbARa5BtdkoZnacqo872ilq8GvK73++7IW1WE5NEbtzLMyqSuvctySP3To3qirURVi28FpXyw/F8MhHyKy47nLIrk4wUdnGtiE5E0RI+D45Cxl00iDZrXuP9rKdRzzr4+23oc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: [PATCH v6 09/12] libs/guest: apply a featureset into a cpu policy
Date: Mon, 17 Jan 2022 10:48:24 +0100
Message-ID: <20220117094827.16756-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117094827.16756-1-roger.pau@citrix.com>
References: <20220117094827.16756-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0159.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47315bec-4ad8-422c-bf4b-08d9d99eb1dc
X-MS-TrafficTypeDiagnostic: DM6PR03MB4059:EE_
X-Microsoft-Antispam-PRVS: <DM6PR03MB405936FF25FDFCAA9556F0E88F579@DM6PR03MB4059.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CXOEFki770rVzKQbVs9FRWgOMlmozhoAU/n/ugTw3QFXoj26kCI8cG1sx4cPQtK2y7s2/qUu4RDGsPJbKN3PcKFe5/33ehspgUYzxUiHGUWWL2jytWbJ1eGbNKK1IGjfHhwqdn/GKkAdgxZbDM3piYibtuZ/q1MpoZ5cIRGPu2uCvHEP/DHNjAeaGEV6ZV0aipQTMC7oDsOW1lBDE/Pb+cYQv1PEzuBKg9utAXkE+v4o31capd0I4ZeXdisLTnt/K5nUrHyG9H+MOPBgwvDKJcn8w47AGxMi5hNNfbiHTLVRqqeH1AGre1Gi+yQtfKW2DeLV7W0AxnnwtmrPG7PT8q3kT9BivW6d2dM8DRBoA9bAUVTDst6TI3h57BboUu49DG/KnOUxMWa2rPOcgmnk11JMUPZFhs7RXpGZ3RpGF/Em8GnQtdwMDN0Diq6yZj5Z8wQ8DsUpsoAHYIlMzEHzJGaBP4frwfijzDmAqq3ajpnYWIu3qs96bm6oGRUdTe/25Fa+sADAfjjoCq7Nzq+dqn7FZiP6Y1eJZz+HjaCnS4TucTgDV19u4xJZVZi32km3qwZmzXbCcUbRXEeVLQKm7I5dt96EgPAPdoa0ZFpTV+2IH3RJQ9lVla+g2pgRN5GoWuzfcP2XqFeyFC8/g+DV1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6512007)(8936002)(186003)(36756003)(6506007)(316002)(83380400001)(38100700002)(6486002)(26005)(6916009)(86362001)(6666004)(8676002)(54906003)(2616005)(82960400001)(2906002)(5660300002)(66946007)(66556008)(66476007)(1076003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjYxNStJbTE4UEdISTNjblA0TkJWN0pSZGZ5MURYbEkyOFhhck1pSnM4U2hF?=
 =?utf-8?B?aXBhMStmdEx4MDZrUmFFaTVGOUhlRjVHUkRSRkhrWHRrd3VWOEVzUWZaR2Fp?=
 =?utf-8?B?aW5LamU2V200dEhsSzVJT0FTVURybm9Ja0sxTWpaTDEzejhFVk9HOVB0VmVa?=
 =?utf-8?B?bGVKdDJlVThUcEVmUVN6a0p3SHUvSnRsNFdQQzBDdFI4U0VUNnlBYkRaTUlT?=
 =?utf-8?B?SXhMaWZOcEJWL0JFSjFhbHh2QnJFa2xDVnFmWC9NMTNaNVlPVTEwU0F2REpz?=
 =?utf-8?B?U2oycnNZb1ZJd1hZdjhzNHNZZEh0WXR2b3E5cSs4U0tLdUhCcVNJQk9uWWt3?=
 =?utf-8?B?TWdORkp2MEZnYmZJanNFcUZiTmtPcE00MUhCeGdSWngzKzZMU3pyVVpxZkx0?=
 =?utf-8?B?QWJGK2JycmttczBDeG1PbFI0VXNtRWIvdk1zdWRCMU1xd0QxMklwdjlwMEZk?=
 =?utf-8?B?Qmo4Y29jZitSaFJtZXhNdWJSTFhjclBMcHFwR3VLQUVsY2lOSXRMS0xFa2M3?=
 =?utf-8?B?YUsyVWdWSkhuZTI2Z3NxenJqTzlwS2V6VHJpR09tdGRWbTRRRHFpYWRHU2hq?=
 =?utf-8?B?OWRvK1hXSlVSZDRnWnpIWGNqdFg4aWZEcHdjdytKMW43TGxXTzMxYURvVnRZ?=
 =?utf-8?B?dldJaFBvejhoVVR3MktmVzF5Tnh0QWo4R1BkYW92TG5CeFNXZmFpK2VzN3hJ?=
 =?utf-8?B?TExteW5ycEJtelpFVDBKRVpkUWlEUnFCMUlQTmFiUWJBczl3aUlYUmd5ZmxT?=
 =?utf-8?B?MFlwaytJTktZQ1gwVThXa0t0NU1RWllOdDlWVnI0NE1XMHA5bUZhT1kyZWlu?=
 =?utf-8?B?cGdxY21uckdUdFNvcTVnL2hnOVpVNmlEWW5sZGNpYlJSWnBKZGp4R2hBOHpK?=
 =?utf-8?B?L1JBU3VYeUVuSjYwZDBxVWRwaVdsdWJFQzdoaXcyYlpoN2E5Mit4Zi9RZzMw?=
 =?utf-8?B?eVRhWkozbEdLSkk5YUtYcy9wRnFRUW9pZjhnSlo5SDFjNXZoK0FuMUtEYlRC?=
 =?utf-8?B?Z1phV3dJZE4vZTUvdG5YYk9WdnR5ZFFEdU52ZmR3REdMc01qZUJoRzY1WHlr?=
 =?utf-8?B?bEsxc1BOYkhHTnBFVVZYWEpQRDZDcUFIUHhmVWFzKzQ2YTNSN0F1NC80dUlR?=
 =?utf-8?B?WjFyRk9JdGV3b2JEN05hc293RUw4UXZGcGNweHQ2UXRHd1F6Q0NkZzdMVkdr?=
 =?utf-8?B?TTQ1cUFMZnZZeERMcmR6dnFJeGhxaTN4b0ZRK1RIYVZMcTRicHFqZEJEbmdk?=
 =?utf-8?B?NE1iUytNL2dUVFhGd2hpRkxFR25rSDFEb25xa3Z0ZS9oZkU4MFlwTXU2VTRj?=
 =?utf-8?B?MTJXbHhwTTdFTytyZWphaWJSZnFFdFlNU3FybDB3R2JwUXhOV2V1U3ZwNzh5?=
 =?utf-8?B?Ukx6WGptMVVKM3RBYUd5K1BxN3RUS1J2RjNQTnVHZmRLVTh5RnM3Z1VDMzU0?=
 =?utf-8?B?bTB5YXRpUU9XR0FIR3F3T0k5aWVEMXdaUjFQaWhGOEoydkU0RW1sZXFmaklI?=
 =?utf-8?B?b2JNdmYzSm1iSUFmT2h1bDNiM25rVjloY2h0SlA4WUxZYjFCTFZpNFdQTTdt?=
 =?utf-8?B?aXFyM1NuWm5LR09PanQ2K0tndGhoZ2FCdTc2d0pEb2g1cHFlOTVlV0ZrUjJn?=
 =?utf-8?B?WDV1RS9nQTVlTklZZFAzUXV3dk85N3BDRXMzYmUxRmRHWkdvRGNnS0tGdjFG?=
 =?utf-8?B?RWVCNGV0WVkzY1ZKdUVMQzRoeDhXNnlKbk43Q3U5aEdRSXk5YnZBbXgyK1dj?=
 =?utf-8?B?anlRejVWcGh5ekx3ZVFzYis3bHlrZ29JRXZyeW1rWlhRUkEvMkxRTTJlUngr?=
 =?utf-8?B?RitMZ0pld3F5bTBxOWFIVVEyQXZkbDZZY3VQQ0pXNUtzUis0ODJxWWxyZVAw?=
 =?utf-8?B?U3hxKy9DZ2Vuc2RmN0ZGMzNzeHQ0Y1lVOFhCeEI2OHVoemlZaUR3endOMjJ4?=
 =?utf-8?B?VkZXQUsvVVltNno5VUtnYjFHM0lEME9ESVNZN3EzMUNQdEVnMkErdTQwc0h0?=
 =?utf-8?B?bDNmWG16NGNBeVJ0cVIzQ2tVOGVDS2dPTVZraXFacXVmMGU5UEE1SnpGc2Er?=
 =?utf-8?B?bVRnY3NEQ0xzY0IrUlRCOVk3aENjQktGTTFHSGk1cDNhZFBhOFlmdnA3U2pw?=
 =?utf-8?B?SzhGUkk3NVJkOHBNTEdNemNvS2hCb1NQditqdUxMdEN0bVZvaDNVdllDVjhK?=
 =?utf-8?Q?IjHheRf8yXPFwGhMjqUaRyU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47315bec-4ad8-422c-bf4b-08d9d99eb1dc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:49:46.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gYmjf8TERdOjaKOred6IFIrHfDSp98QEjuM4ms7reLRGUaOcPi5kUyJUTPZIzr39Aq9Z92y/+dAK8q3b8Pn+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4059
X-OriginatorOrg: citrix.com

Pull out the code from xc_cpuid_apply_policy that applies a featureset
to a cpu policy and place it on it's own standalone function that's
part of the public interface.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 tools/include/xenguest.h        |  5 ++
 tools/libs/guest/xg_cpuid_x86.c | 95 ++++++++++++++++++++-------------
 2 files changed, 62 insertions(+), 38 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 9912116a51..8f05d8aa66 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -829,6 +829,11 @@ int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
                               const struct xc_xend_cpuid *cpuid, bool hvm);
 
+/* Apply a featureset to the policy. */
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 9060a2f763..cf202671ed 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -443,46 +443,15 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
 
     if ( featureset )
     {
-        uint32_t disabled_features[FEATURESET_NR_ENTRIES],
-            feat[FEATURESET_NR_ENTRIES] = {};
-        static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
-        unsigned int i, b;
-
-        /*
-         * The user supplied featureset may be shorter or longer than
-         * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
-         * Longer is fine, so long as it only padded with zeros.
-         */
-        unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
-
-        /* Check for truncated set bits. */
-        rc = -EOPNOTSUPP;
-        for ( i = user_len; i < nr_features; ++i )
-            if ( featureset[i] != 0 )
-                goto out;
-
-        memcpy(feat, featureset, sizeof(*featureset) * user_len);
-
-        /* Disable deep dependencies of disabled features. */
-        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            disabled_features[i] = ~feat[i] & deep_features[i];
-
-        for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+        policy.cpuid = *p;
+        rc = xc_cpu_policy_apply_featureset(xch, &policy, featureset,
+                                            nr_features);
+        if ( rc )
         {
-            const uint32_t *dfs;
-
-            if ( !test_bit(b, disabled_features) ||
-                 !(dfs = x86_cpuid_lookup_deep_deps(b)) )
-                continue;
-
-            for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
-            {
-                feat[i] &= ~dfs[i];
-                disabled_features[i] &= ~dfs[i];
-            }
+            ERROR("Failed to apply featureset to policy");
+            goto out;
         }
-
-        cpuid_featureset_to_policy(feat, p);
+        *p = policy.cpuid;
     }
     else
     {
@@ -916,3 +885,53 @@ int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
 
     return 0;
 }
+
+int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
+                                   const uint32_t *featureset,
+                                   unsigned int nr_features)
+{
+    uint32_t disabled_features[FEATURESET_NR_ENTRIES],
+        feat[FEATURESET_NR_ENTRIES] = {};
+    static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
+    unsigned int i, b;
+
+    /*
+     * The user supplied featureset may be shorter or longer than
+     * FEATURESET_NR_ENTRIES.  Shorter is fine, and we will zero-extend.
+     * Longer is fine, so long as it only padded with zeros.
+     */
+    unsigned int user_len = min(FEATURESET_NR_ENTRIES + 0u, nr_features);
+
+    /* Check for truncated set bits. */
+    for ( i = user_len; i < nr_features; ++i )
+        if ( featureset[i] != 0 )
+        {
+            errno = EOPNOTSUPP;
+            return -1;
+        }
+
+    memcpy(feat, featureset, sizeof(*featureset) * user_len);
+
+    /* Disable deep dependencies of disabled features. */
+    for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        disabled_features[i] = ~feat[i] & deep_features[i];
+
+    for ( b = 0; b < sizeof(disabled_features) * CHAR_BIT; ++b )
+    {
+        const uint32_t *dfs;
+
+        if ( !test_bit(b, disabled_features) ||
+             !(dfs = x86_cpuid_lookup_deep_deps(b)) )
+            continue;
+
+        for ( i = 0; i < ARRAY_SIZE(disabled_features); ++i )
+        {
+            feat[i] &= ~dfs[i];
+            disabled_features[i] &= ~dfs[i];
+        }
+    }
+
+    cpuid_featureset_to_policy(feat, &policy->cpuid);
+
+    return 0;
+}
-- 
2.34.1


