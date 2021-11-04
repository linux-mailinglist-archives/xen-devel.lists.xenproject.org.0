Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B924451BC
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 11:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221425.383130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miaIg-0000jo-ST; Thu, 04 Nov 2021 10:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221425.383130; Thu, 04 Nov 2021 10:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miaIg-0000hS-Ob; Thu, 04 Nov 2021 10:48:54 +0000
Received: by outflank-mailman (input) for mailman id 221425;
 Thu, 04 Nov 2021 10:48:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F6ik=PX=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1miaIf-0000Bl-50
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 10:48:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id caee5a35-3d5c-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 11:48:51 +0100 (CET)
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
X-Inumbo-ID: caee5a35-3d5c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636022931;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ANgRQ6QT708gWZ7JGo8eaTBwKdtqOwXOgQh965egHYQ=;
  b=hOJf+a3duyAkvfl2NcP9WiA78/pUP81RXkeYv+AZmO7AaFtaDpZxmHPX
   1aoyeBv4Zw76mXO3utkkVVWMQ0ivnv5t7DjGbouFE8SVhctxGcq/mHt02
   tWGPuXIHNeJvtcZcmdn1VzO1R0lr4skYsLO71W7/wkMoEmbOyWL3fTX7R
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sDe2+mcW4zyrGJOn5xTrFmxyOEt0gxwlU7dE47d8AVqyI8rUKWGegaDRe6z4jtJFjPLGcYj3v0
 0LYozQjdy2z7nhFSL3AJfhK9T0wFBC4Mthp28fnAlcdTvwOFpVMwYAyy/EeaCnW5+aLtx2bbqt
 ZYK30RgbxOGhw8qXEw6rKtTm8dR7hQ/VKf/v78ewIQo7lV8QwZZ5WM3YuOPUQ40B/3uMvuxzC4
 zZGhFhKPXHJwVXz0qigE5vIPvf/k6q9Ni82UMmRPyrq9f9HCpuN0ZjA9w4pD3f4sfMjL9bS0GL
 hdrF347jJMHlIsaYZir1Imlf
X-SBRS: 5.1
X-MesageID: 57446271
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a0QrD6vs1QOgdlANvQ6YRkFCeefnVAZYMUV32f8akzHdYApBsoF/q
 tZmKTyPOvzYMzP2f9tyPI3j8x4Gv5eByt5nHFA9rXgzEigX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx2YThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplt4WweFYTIKb3hN9FbyR0MXpzDK8B0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY258SQaiEO
 JNxhTxHZU7lbj4SAEosCdE1tv75nUnabjxZpwfAzUYwyzeKl1EguFT3C/LZc8KHbd9YlUGZo
 iTB5WuRKhMVLtuE0hKe72mhwOTImEvTWZ0QPK218OZwh1+ezXBVDwcZPXOFpv2+hl+7SshoA
 UUe8SozroA/7EWuCNL6WnWQu2WYtxQRX95RFewS6wyXzKfQpQGDCQAsUTppeNEg8sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJSMH/t3irYcbnh/JCNF5H8adjNf4BDXxy
 DCitzUlivMYistj6kmg1QmZ2XT2/MGPF1NroFWMNo640u9nTIy8Z73500bQ1up7dLqkYnvas
 UkG3OHLuYjiEqqxvCCKRewMGpSg6PCELCDQjDZTInUxy9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Cc/rCsIvMcLVEZGe5ObdG5Y5y4C6aH7XeroWfnPBjalSsggLVTXlM2CiKP54owMrKTOuf1gU
 Xt4WZz1ZZr/NUiB5GDmLwv6+eV6rh3SPUuJGfjGI+2PiNJynkK9R7YfK0epZesk9q6Cqwi92
 48BbJbblUgHCb2kOni/HWsvwbYidyhT6Xfe8Z0/SwJ+ClA+RDFJ5wH5mOtJl3NZc1R9yb6To
 yDVtr5ww1vjn3zXQThmmVg4AI4Dqa1X9CphVQR1ZA7A8yF6Pe6HsfdOH7NqLOJP3LEykpZJo
 wwtJpzo7gJnEW+cpVzwrPDV8eRfSfhcrVjRY3r7O2VmIMMIqs6g0oaMQzYDPRImV0KfncA/v
 6ehxkXcR58CTB5lF8HYdLSkyFbZgJTXsLsas5LgLoYBdUPy3pJtLiCt3PY7L9tVcUfIxyeA1
 hbQChAd/LGfr4gw+djPpKaFs4b2TLcuQhsERzHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXl1w2HHjCY1mxJKlnJ32KgZtGuqFXn+cLsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRyjtiFt/beBXUFDBDW2iXRQfOlvLYco4
 eY9o8pKuQaxvQUnb4SdhSdO+mXScnFZC/c7tosXCZPAgxYwzg0QeoTVDyL77c3da9hINUV2c
 DaYiLCb2uZZz0vGNXEyCWLMzaxWgpFX4EJGy1oLJlKonNvZh6BogE0NoGpvFgkFnA9a1+9TO
 3RwMxwnLKqDyD5kmcxfUj3+AApGHhCYphT8xlZheLc1lKV0urgh9FEABNs=
IronPort-HdrOrdr: A9a23:jGKI9KglIA9M//UlvZWrFwAgMXBQXzR13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhR4tKPTOWw1dASbsN0WKM+UyHJ8STzJ8+6U
 4CSdkANDSTNykCsS+S2mDReLxBsbr3jpxA7d2us0uFJjsaDJ2IgT0JbzpyRSZNNXR77NcCZd
 Khz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlKl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFc9ccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiW7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri2knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYds99RrBmcEa+d
 RVfYHhDK48SyLYU5mZhBgj/DWUZAV8Iv/cKXJy+PB80FBt7QREJgUjtYkid0w7heIAoq9/lp
 H525RT5cBzp/AtHNFA7Z86MLOK40z2MGTx2TGpUB3a/J9uAQO+l3ew2sRw2N2X
X-IronPort-AV: E=Sophos;i="5.87,208,1631592000"; 
   d="scan'208";a="57446271"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPZ6POezdpEqejUzxpLVfi9RiVegx453dOK6z2Q1BU+bYWEZCHnxeB07juNX1dtQMQg+NF/Qm+yTtc0oh8wxTd6Khq4pz6HpEdw0qIOniPtC7RftXj86EBrmF/E3FLXkOfCO2UwyYVKEhXhip8hn8cwUxnhJYs/AeF6PWuKGk5NIl/bW7IYSZEtNR/w05Gk460O+LqLuO46n8e+KGk945T5PIOMjMVb3R/Jf3xqkS4j7WZTjSooL3zA42fh/06T1DzU3+4wi8wnBqvTzZebDufYvyb8PFvU3AB3SvKjXCySRJR9eh5LiK5Ee9BciKxgDCwSu2XB1PMuvMr9C5BfcBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlgGmC0r/Nbro1OyRdI/heY2zL/igj9t8z6NISauGXE=;
 b=f7gpxHpA09i2X2SFjAyU5titYUz0A8QxYMpM5yHsDUl8uS/7iEoBnP9sM0ALFxuSs9r6tvt/7XuCJlSExQ1INdgu8BGP2l2f1p+lSIW0uX+LhEFLeG0OeRWQKK2vrLYaBHs2dpOu0GK9haJ/D+6NMWi00jIYKzuwz4B+8eMgcqiOywME5/nsuqATNIFi/rWTUhe8aCAjF7zkopkYHRB4KYto8/9A6Ut7mins1OrGliujza0qO7IQ6P0qeSLd4Dph6vftAk2NCBfJ8le5PX6GOJrjz1OvoplzUN5EsInAUbetbDZ8W3NohMkZzn9itxScoSJ13l+dhj/hJuqMs0qJlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlgGmC0r/Nbro1OyRdI/heY2zL/igj9t8z6NISauGXE=;
 b=KdWbykkZY6GfI/tI2Zdl8dDtWAA37+qL10B7M2f27dRVqXiqlUt/F3VIWGhzHJ73fxHfGSE3ctSQGcKnQ6cTvdBWouerGSPNv73/TZ36U/X49LJag3Ym2XD7qvKfkqiZOz8P/77quKDZp5oJpiaA66sgFAeh+xPjm9VI4AL59bM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
Date: Thu,  4 Nov 2021 11:48:34 +0100
Message-ID: <20211104104834.10977-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8ed30aa-a8ad-4ce4-2524-08d99f80ac20
X-MS-TrafficTypeDiagnostic: DM6PR03MB5339:
X-Microsoft-Antispam-PRVS: <DM6PR03MB53391B6D55679F39DC0C885B8F8D9@DM6PR03MB5339.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFo/wHRyVKpJMD7OHMa/wM7wAXdh2qSWD8HoixlHhP3LT6rO3t4uaTVRVrnacjeysCSiQ7T85CKPBdj5H+r3YdqAl2/fHjAVHgmezx8tSL2s6t8sl71qxTmA4T+x1YsidXqOgcpqCpnRiYnhj8nrjM1OVWB6uPeBv4TuqLGAEde2SPWsfXrIDEUMTffrOI4Il4VjxMXk8WUyzOct0iVdyJy7fUa77N52sPK+v/lJz49r8MpRdwKkL11wI1DkYSgpnOv/TktFSjwTpYEvXwaawPXZ7dmlxbO2fqJKgblXLMblaeBeGXkHkKAX39e5qHZYXYp2OdMvURHILxpi6nNIueFG0WAJi94LP0HeZ0kd1/ZxNZ0JxGZfLzkRZLyf6cxa0UrjzZSaZ7Qh5vNGoH73aM59fEBbbvBh6GXfdhORpF7bbUstL9EnHG/cHmFF73htFAioQFw+p1HTkASlHQVn1A6cqbISvrLi/Ai/CYpRyGsuDzZXRqEE3WfAq8h8MRMXA1ESM4STi2C9gOm7OX6Pd9ErVEp2oNNDvOQfHuE43qqh2rTH4ZknKhtXMtptY2BWC8hLSunMOeO2b2OLUkirpqVzFikQmyWlaXt7zZcupFfvwF7Uk6CQfVki0CTLxuWThEyhUzS2KCoy6QgQPC8OPnHe8MUmkuaFTtYLZNDXr9g/AL6enLg4O5BB21J4xOZ+HhmyPi3X3GURCYYZcCVlJy4dZcyQcKYZa4PGTC/xMnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(36756003)(2616005)(6486002)(6916009)(8936002)(54906003)(5660300002)(316002)(186003)(66476007)(1076003)(30864003)(956004)(6666004)(38100700002)(66946007)(6496006)(82960400001)(508600001)(86362001)(8676002)(966005)(26005)(83380400001)(4326008)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHBqbjAzbEJOb3FqL1Z2YSt5RkVjZTZtYlE1RXlFWVBPT0gvbThhc3dlaDhk?=
 =?utf-8?B?N2s2a3ZzbDBjYkt5NXZ4OTlNUjNTUXZpZ1daWS9jSzBVVzhvOU9UWWgyOEVP?=
 =?utf-8?B?SDhDcm1Tei95dmhvTGtBOUR5cDdOd21MeHlkYW9NQS9ZZkUvRlJVU3o0c0k1?=
 =?utf-8?B?NDhUN1ZXOVhmdFY0ZUdKTjNhV3QzOUdvVWt5YVBCTTJaTXFObld3QVlzRU5h?=
 =?utf-8?B?VWY1YlFXZmE0WXJPK1FDajVDcDhKM0V3NlhJc3FQQ3gyd0ZqMXJYb0ROcnFG?=
 =?utf-8?B?VmNoRWJaL29mUmppN1Y3U0lCcXpxaTkwYXZTU3NXR0ZWSnlvT0piVXFncmwx?=
 =?utf-8?B?YndSSHNFTVFiM0M2c2pRWEtFTnpSY0dGS09tbE4xNDI3bUZEZWErRjJvbkU0?=
 =?utf-8?B?RFoxWkxFcnJUU3NDWUJLRDRNN3p5eW8zWjJOWi80bGJIL29VWkhGb0h5cFJ5?=
 =?utf-8?B?eVBLRk5rMEY0K2ZPMUtIRHFOMldFRlk3SDVVM0N5MFVHemlURkxKVlN5NnRH?=
 =?utf-8?B?bURUbzRva2xYU0p1UGxkNmNJK3pNYlFvaC9kS1R2a3RwTjBlNGptQ2NTSnJI?=
 =?utf-8?B?QmZSYXh6dG4zc0RHQXQ0eUlhalZ5M3FTQ0wzUXFUdUU3SnA1MWh4T3pWNFJQ?=
 =?utf-8?B?UkZLMW5RVlZabUs2Q3JITjdwaEIwbHkzQW1kaVhNS3gySXMweURsQUdKVVky?=
 =?utf-8?B?Ump3RVBlQTlyckdEcFFrNGZSYzVXNEk3cytvcnVlcFBHQXlmOHlDaUJBSlky?=
 =?utf-8?B?RDREaERZZDFtRTg0RUNNMDVMdjByMmpsVUpFYi9BTTVWTTZ4elkvNGlYc1Fw?=
 =?utf-8?B?MFdGc3BFb3VYRWtIZnlWZ00zUjVyV2Rrb0tIcjVFNWJHYTc1aE5QQmxCcmNm?=
 =?utf-8?B?UUxQSE5VekpkYXQ2RTR3WkQraGZKYTFkcGl2VDRJdkF5eW1BMVl1V2lqd2VP?=
 =?utf-8?B?QkdjV1JEdDRTSm5QZmE0WkRCMHlTWUkyN1BrQVVaM2dVY0gxTUY1TTFxZ29i?=
 =?utf-8?B?K3k3Qit1UmljWTA4TTV1U0F3c0NTM1VNQ2NRaCtFSVB1dEpHcWYwZEowV0Ja?=
 =?utf-8?B?VjdzSW1uL2tSN3FmZ3BuSVVsM1dZT1Uyam01Y0ZhdlFNZHhRTk5lY1BOaE5i?=
 =?utf-8?B?S0FkbzlyRCtFTjY3aW53d3hrL0VnNkxjMEZxandDVWt1Yk5CNGl2TmZBMjNH?=
 =?utf-8?B?WW9KWXdYQVV2RFBrZjlYcGlLcGZ1bVVSeUhIR2R5ZVFnc1A1bDJYczdvMTZV?=
 =?utf-8?B?cGNJSDl1cmdyZXRJdHVGSktLZjUxY29NSlRyM1FERHVsZkJCeGhYbE9YOGpz?=
 =?utf-8?B?dlFyM3U4R1RPNjJzQTFlZ0syRExTZGo4NHFNelNzV1V4WnZhUU5MNjFrck9w?=
 =?utf-8?B?OHo1eFBCRHphcHptdWdVMTk4cFlrRURZVG8yQTY3TWc5NGlOVkFSWkNuc21w?=
 =?utf-8?B?cXdsQm05WUlhQWswZ0ltYUZ2eEVlek0zSkF3K1lYU2dJNFAvbTY1YkhLZExV?=
 =?utf-8?B?Mkc4NzFTcDR4OW04N0xpNlBjYWlpeFJDanlaRkxLWDc3ZFVFNHQyNTBFUXJt?=
 =?utf-8?B?NG9wNVBsS0M1YlcxSnJSMWNndCsxWHM0QThZN21WNU9wZDJwSFZuclRBWVZX?=
 =?utf-8?B?ZWUwY0FFajdMR3psRUdXL1cyY0ZpRmJnbzFYa0VaMVRVZ3hjdXhmV1ZLNUY1?=
 =?utf-8?B?N005SE1VK1NaVkpaTGpqSFNHT3VzNlIrcUVEeVZGck04amY5TmRLbUZCOStZ?=
 =?utf-8?B?MGo5eVpLNnVNaWdVYlZJeStENG5IUXJHNkM3Wmo3MEVrdG8xUC9pQmVxTmN4?=
 =?utf-8?B?Kzk1ZnVlcFgwMGFvTXNXVmwrT3pOV05IaHpsTkRiOG1QWTdzV3RpNFBpMUR2?=
 =?utf-8?B?dys4bWlEanAvU3JzYlFTNzR2UFJMT3R5N21qR0FRK0dCQXVzUWVoakZyaE5Z?=
 =?utf-8?B?QWkvdzhRd0orRzNIYngrMzhncitVT01XREYwTEZoWDN3STNuaHMzVHNybUZG?=
 =?utf-8?B?NU1odGhPRTlLVkRlcDNLTmIrMGhzM2ZjT0NST1YxSTg0Zk5PWXRROFFUTmIz?=
 =?utf-8?B?eGpacEVTbTh1OUs1R0xXTVJ1cUlvTVBPQU9lMVJiWWM1ODZnV1VxaVJ5Y3NJ?=
 =?utf-8?B?K1p0TFI2NzhXTzIxbjZuc2ZYc29IaDQ4MVM5VjloRFpOUFA3TzkwOGkwSUZI?=
 =?utf-8?Q?/yCuKovyLdP6UirDPGoc6Ak=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ed30aa-a8ad-4ce4-2524-08d99f80ac20
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 10:48:44.4035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mAsJd/LjuTDKsOZtWwgGgg2PkX1nTaEMbeyfrlf6YvHZgmdbAkRBMAZ7R5cG+UCImZ8cFwOSr7tZSzGfku+aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5339
X-OriginatorOrg: citrix.com

Introduce a new domain create field so that toolstack can specify the
maximum grant table version usable by the domain. This is plumbed into
xl and settable by the user as max_grant_version.

Previously this was only settable on a per host basis using the
gnttab command line option.

Note the version is specified using 4 bits, which leaves room to
specify up to grant table version 15. Given that we only have 2 grant
table versions right now, and a new version is unlikely in the near
future using 4 bits seems more than enough.

xenstored stubdomains are limited to grant table v1 because the
current MiniOS code used to build them only has support for grants v1.
There are existing limits set for xenstored stubdomains at creation
time that already match the defaults in MiniOS.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
This needs to be applied on top of Andrew's:

xen: Report grant table v1/v2 capabilities to the toolstack
https://lore.kernel.org/xen-devel/20211029173813.23002-1-andrew.cooper3@citrix.com/

NB: the stubdom max grant version is cloned from the domain one. Not
sure whether long term we might want to use different options for the
stubdom and the domain. In any case the attack surface will always be
max(stubdom, domain), so maybe it's just pointless to allow more fine
grained settings.
---
Changes since v5:
 - Check reserved bits in grant_opts are 0.
 - Return failure if a grant table version is specified but grant
   table support has been compiled out.

Changes since v4:
 - Remove the check for 16TB: there's no check currently, and there's
   some discussion about how to implement it properly for all guest
   types.
 - Place the logic to pick the default version in the toolstack, so
   the create domain domctl will always specify a grant table version.
   Such version will also be part of the migration stream.

Changes since v3:
 - Expand commit message re xenstored stubdomains.

Changes since v2:
 - Drop XEN_DOMCTLGRANT_MAX - it's unused.
 - Rename max_grant_version field to max_version in the grant table
   struct.
 - Print domain on log messages.
 - Print a message if host has more than 16Tb of RAM and grant v2 is
   disabled.
 - Add a TB macro.

Changes since v1:
 - Introduce a grant_opts field and use the low 4 bits to specify the
   version. Remaining bits will be used for other purposes.
---
Cc: Ian Jackson <iwj@xenproject.org>
---
Posting this patch alone as I think allowing to control transient
grants on a per-domain basis will require a bit more of work.

Release rationale:

We have had a bunch of security issues involving grant table v2 (382,
379, 268, 255) which could have been avoided by limiting the grant
table version available to guests. This can be currently done using a
global host parameter, but it's certainly more helpful to be able to
do it on a per domain basis from the toolstack.

Changes to the hypervisor by this patch are fairly minimal, as there
are already checks for the max grant table version allowed, so the
main change there is moving the max grant table version limit inside
the domain struct and plumbing it through the toolstrack.

I think the risk here is quite low for libxl/xl, because it's
extensively tested by osstest, so the main risk would be breaking the
Ocaml stubs, which could go unnoticed as those are not actually tested
by osstest.
---
 docs/man/xl.cfg.5.pod.in             |  5 +++++
 docs/man/xl.conf.5.pod.in            |  6 ++++++
 tools/helpers/init-xenstore-domain.c |  2 ++
 tools/include/libxl.h                |  7 +++++++
 tools/libs/light/libxl_create.c      | 23 +++++++++++++++++++++++
 tools/libs/light/libxl_dm.c          |  1 +
 tools/libs/light/libxl_types.idl     |  1 +
 tools/ocaml/libs/xc/xenctrl.ml       |  1 +
 tools/ocaml/libs/xc/xenctrl.mli      |  1 +
 tools/ocaml/libs/xc/xenctrl_stubs.c  |  5 ++++-
 tools/xl/xl.c                        |  8 ++++++++
 tools/xl/xl.h                        |  1 +
 tools/xl/xl_parse.c                  |  9 +++++++++
 xen/arch/arm/domain_build.c          |  2 ++
 xen/arch/x86/setup.c                 |  1 +
 xen/common/domain.c                  |  9 ++++++++-
 xen/common/grant_table.c             | 21 +++++++++++++++++++--
 xen/include/public/domctl.h          |  5 +++++
 xen/include/xen/grant_table.h        |  8 ++++++--
 19 files changed, 110 insertions(+), 6 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 55c4881205..b98d161398 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -580,6 +580,11 @@ to have. This value controls how many pages of foreign domains can be accessed
 via the grant mechanism by this domain. The default value is settable via
 L<xl.conf(5)>.
 
+=item B<max_grant_version=NUMBER>
+
+Specify the maximum grant table version the domain is allowed to use. The
+default value is settable via L<xl.conf(5)>.
+
 =item B<nomigrate=BOOLEAN>
 
 Disable migration of this domain.  This enables certain other features
diff --git a/docs/man/xl.conf.5.pod.in b/docs/man/xl.conf.5.pod.in
index b48e99131a..df20c08137 100644
--- a/docs/man/xl.conf.5.pod.in
+++ b/docs/man/xl.conf.5.pod.in
@@ -101,6 +101,12 @@ Sets the default value for the C<max_maptrack_frames> domain config value.
 Default: value of Xen command line B<gnttab_max_maptrack_frames>
 parameter (or its default value if unspecified).
 
+=item B<max_grant_version=NUMBER>
+
+Sets the default value for the C<max_grant_version> domain config value.
+
+Default: maximum grant version supported by the hypervisor.
+
 =item B<vif.default.script="PATH">
 
 Configures the default hotplug script used by virtual network devices.
diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 6836002f0b..41a7c38ada 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -85,9 +85,11 @@ static int build(xc_interface *xch)
          * 1 grant frame is enough: we don't need many grants.
          * Mini-OS doesn't like less than 4, though, so use 4.
          * 128 maptrack frames: 256 entries per frame, enough for 32768 domains.
+         * Currently Mini-OS only supports grant v1.
          */
         .max_grant_frames = 4,
         .max_maptrack_frames = 128,
+        .grant_opts = 1,
     };
 
     xs_fd = open("/dev/xen/xenbus_backend", O_RDWR);
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 54c10f6efe..2bbbd21f0b 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -520,6 +520,13 @@
  */
 #define LIBXL_HAVE_PHYSINFO_CAP_GNTTAB 1
 
+/*
+ * LIBXL_HAVE_MAX_GRANT_VERSION indicates libxl_domain_build_info has a
+ * max_grant_version field for setting the max grant table version per
+ * domain.
+ */
+#define LIBXL_HAVE_MAX_GRANT_VERSION 1
+
 /*
  * libxl ABI compatibility
  *
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 5a61d01722..b6855c7b46 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -454,6 +454,28 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
         libxl_defbool_setdefault(&b_info->nested_hvm,               false);
     }
 
+    if (b_info->max_grant_version == LIBXL_MAX_GRANT_DEFAULT) {
+        libxl_physinfo info;
+
+        rc = libxl_get_physinfo(CTX, &info);
+        if (rc) {
+            LOG(ERROR, "failed to get hypervisor info");
+            return rc;
+        }
+
+        if (info.cap_gnttab_v2)
+            b_info->max_grant_version = 2;
+        else if (info.cap_gnttab_v1)
+            b_info->max_grant_version = 1;
+        else
+            /* No grant table support reported */
+            b_info->max_grant_version = 0;
+    } else if (b_info->max_grant_version & ~XEN_DOMCTL_GRANT_version_mask) {
+        LOG(ERROR, "max grant version %d out of range",
+            b_info->max_grant_version);
+        return -ERROR_INVAL;
+    }
+
     return 0;
 }
 
@@ -607,6 +629,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
             .max_evtchn_port = b_info->event_channels,
             .max_grant_frames = b_info->max_grant_frames,
             .max_maptrack_frames = b_info->max_maptrack_frames,
+            .grant_opts = b_info->max_grant_version,
             .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
         };
 
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 9d93056b5c..9a8ddbe188 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -2320,6 +2320,7 @@ void libxl__spawn_stub_dm(libxl__egc *egc, libxl__stub_dm_spawn_state *sdss)
 
     dm_config->b_info.max_grant_frames = guest_config->b_info.max_grant_frames;
     dm_config->b_info.max_maptrack_frames = guest_config->b_info.max_maptrack_frames;
+    dm_config->b_info.max_grant_version = guest_config->b_info.max_grant_version;
 
     dm_config->b_info.u.pv.features = "";
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 573bba68ee..2a42da2f7d 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -519,6 +519,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
 
     ("max_grant_frames",    uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     ("max_maptrack_frames", uint32, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
+    ("max_grant_version",   integer, {'init_val': 'LIBXL_MAX_GRANT_DEFAULT'}),
     
     ("device_model_version", libxl_device_model_version),
     ("device_model_stubdomain", libxl_defbool),
diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index ed2924a2b3..7503031d8f 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -84,6 +84,7 @@ type domctl_create_config =
 	max_evtchn_port: int;
 	max_grant_frames: int;
 	max_maptrack_frames: int;
+	max_grant_version: int;
 	arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
index d20dc0108d..d1d9c9247a 100644
--- a/tools/ocaml/libs/xc/xenctrl.mli
+++ b/tools/ocaml/libs/xc/xenctrl.mli
@@ -76,6 +76,7 @@ type domctl_create_config = {
   max_evtchn_port: int;
   max_grant_frames: int;
   max_maptrack_frames: int;
+  max_grant_version: int;
   arch: arch_domainconfig;
 }
 
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index ad953d36bd..eca0b8b334 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -188,7 +188,8 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 #define VAL_MAX_EVTCHN_PORT     Field(config, 5)
 #define VAL_MAX_GRANT_FRAMES    Field(config, 6)
 #define VAL_MAX_MAPTRACK_FRAMES Field(config, 7)
-#define VAL_ARCH                Field(config, 8)
+#define VAL_MAX_GRANT_VERSION   Field(config, 8)
+#define VAL_ARCH                Field(config, 9)
 
 	uint32_t domid = Int_val(wanted_domid);
 	int result;
@@ -198,6 +199,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 		.max_evtchn_port = Int_val(VAL_MAX_EVTCHN_PORT),
 		.max_grant_frames = Int_val(VAL_MAX_GRANT_FRAMES),
 		.max_maptrack_frames = Int_val(VAL_MAX_MAPTRACK_FRAMES),
+		.grant_opts = Int_val(VAL_MAX_GRANT_VERSION),
 	};
 
 	domain_handle_of_uuid_string(cfg.handle, String_val(VAL_HANDLE));
@@ -251,6 +253,7 @@ CAMLprim value stub_xc_domain_create(value xch, value wanted_domid, value config
 	}
 
 #undef VAL_ARCH
+#undef VAL_MAX_GRANT_VERSION
 #undef VAL_MAX_MAPTRACK_FRAMES
 #undef VAL_MAX_GRANT_FRAMES
 #undef VAL_MAX_EVTCHN_PORT
diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index f422f9fed5..2d1ec18ea3 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -55,6 +55,7 @@ bool progress_use_cr = 0;
 bool timestamps = 0;
 int max_grant_frames = -1;
 int max_maptrack_frames = -1;
+int max_grant_version = LIBXL_MAX_GRANT_DEFAULT;
 libxl_domid domid_policy = INVALID_DOMID;
 
 xentoollog_level minmsglevel = minmsglevel_default;
@@ -219,6 +220,13 @@ static void parse_global_config(const char *configfile,
     else if (e != ESRCH)
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (!e)
+        max_grant_version = l;
+    else if (e != ESRCH)
+        exit(1);
+
     libxl_cpu_bitmap_alloc(ctx, &global_vm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_hvm_affinity_mask, 0);
     libxl_cpu_bitmap_alloc(ctx, &global_pv_affinity_mask, 0);
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7e23f30192..cf12c79a9b 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -282,6 +282,7 @@ extern char *default_colo_proxy_script;
 extern char *blkdev_start;
 extern int max_grant_frames;
 extern int max_maptrack_frames;
+extern int max_grant_version;
 extern libxl_bitmap global_vm_affinity_mask;
 extern libxl_bitmap global_hvm_affinity_mask;
 extern libxl_bitmap global_pv_affinity_mask;
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index c503b9be00..117fcdcb2b 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1431,6 +1431,15 @@ void parse_config_data(const char *config_source,
     else
         exit(1);
 
+    e = xlu_cfg_get_bounded_long (config, "max_grant_version", 0,
+                                  INT_MAX, &l, 1);
+    if (e == ESRCH) /* not specified */
+        b_info->max_grant_version = max_grant_version;
+    else if (!e)
+        b_info->max_grant_version = l;
+    else
+        exit(1);
+
     libxl_defbool_set(&b_info->claim_mode, claim_mode);
 
     if (xlu_cfg_get_string (config, "on_poweroff", &buf, 0))
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0167731ab0..9e92b640cd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2967,6 +2967,7 @@ void __init create_domUs(void)
             .max_evtchn_port = -1,
             .max_grant_frames = -1,
             .max_maptrack_frames = -1,
+            .grant_opts = opt_gnttab_max_version,
         };
 
         if ( !dt_device_is_compatible(node, "xen,domain") )
@@ -3074,6 +3075,7 @@ void __init create_dom0(void)
         .max_evtchn_port = -1,
         .max_grant_frames = gnttab_dom0_frames(),
         .max_maptrack_frames = -1,
+        .grant_opts = opt_gnttab_max_version,
     };
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b101565f14..26fee5d9fb 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -750,6 +750,7 @@ static struct domain *__init create_dom0(const module_t *image,
         .max_evtchn_port = -1,
         .max_grant_frames = -1,
         .max_maptrack_frames = -1,
+        .grant_opts = opt_gnttab_max_version,
         .max_vcpus = dom0_max_vcpus(),
         .arch = {
             .misc_flags = opt_dom0_msr_relaxed ? XEN_X86_MSR_RELAXED : 0,
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8b53c49d1e..d80ccfe626 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -492,6 +492,12 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( config->grant_opts & ~XEN_DOMCTL_GRANT_version_mask )
+    {
+        dprintk(XENLOG_INFO, "Unknown grant options %#x\n", config->grant_opts);
+        return -EINVAL;
+    }
+
     if ( config->max_vcpus < 1 )
     {
         dprintk(XENLOG_INFO, "No vCPUS\n");
@@ -678,7 +684,8 @@ struct domain *domain_create(domid_t domid,
         init_status |= INIT_evtchn;
 
         if ( (err = grant_table_init(d, config->max_grant_frames,
-                                     config->max_maptrack_frames)) != 0 )
+                                     config->max_maptrack_frames,
+                                     config->grant_opts)) != 0 )
             goto fail;
         init_status |= INIT_gnttab;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index a20319b22a..8b322b51c0 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -53,6 +53,7 @@ struct grant_table {
     percpu_rwlock_t       lock;
     /* Lock protecting the maptrack limit */
     spinlock_t            maptrack_lock;
+    unsigned int          max_version;
     /*
      * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
      * values are invalid.
@@ -1917,11 +1918,26 @@ active_alloc_failed:
 }
 
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames)
+                     int max_maptrack_frames, unsigned int options)
 {
     struct grant_table *gt;
+    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
     int ret = -ENOMEM;
 
+    if ( !max_grant_version )
+    {
+        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
+                d);
+        return -EINVAL;
+    }
+    if ( max_grant_version > opt_gnttab_max_version )
+    {
+        dprintk(XENLOG_INFO,
+                "%pd: requested grant version (%u) greater than supported (%u)\n",
+                d, max_grant_version, opt_gnttab_max_version);
+        return -EINVAL;
+    }
+
     /* Default to maximum value if no value was specified */
     if ( max_grant_frames < 0 )
         max_grant_frames = opt_max_grant_frames;
@@ -1947,6 +1963,7 @@ int grant_table_init(struct domain *d, int max_grant_frames,
     gt->gt_version = 1;
     gt->max_grant_frames = max_grant_frames;
     gt->max_maptrack_frames = max_maptrack_frames;
+    gt->max_version = max_grant_version;
 
     /* Install the structure early to simplify the error path. */
     gt->domain = d;
@@ -3076,7 +3093,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARAM(gnttab_set_version_t) uop)
         goto out;
 
     res = -ENOSYS;
-    if ( op.version == 2 && opt_gnttab_max_version == 1 )
+    if ( op.version == 2 && gt->max_version == 1 )
         goto out; /* Behave as before set_version was introduced. */
 
     res = 0;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 51017b47bc..1c21d4dc75 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -97,6 +97,11 @@ struct xen_domctl_createdomain {
     int32_t max_grant_frames;
     int32_t max_maptrack_frames;
 
+/* Grant version, use low 4 bits. */
+#define XEN_DOMCTL_GRANT_version_mask    0xf
+
+    uint32_t grant_opts;
+
     /* Per-vCPU buffer size in bytes.  0 to disable. */
     uint32_t vmtrace_size;
 
diff --git a/xen/include/xen/grant_table.h b/xen/include/xen/grant_table.h
index 9ee830cfd0..85fe6b7b5e 100644
--- a/xen/include/xen/grant_table.h
+++ b/xen/include/xen/grant_table.h
@@ -37,7 +37,7 @@ extern unsigned int opt_max_grant_frames;
 
 /* Create/destroy per-domain grant table context. */
 int grant_table_init(struct domain *d, int max_grant_frames,
-                     int max_maptrack_frames);
+                     int max_maptrack_frames, unsigned int options);
 void grant_table_destroy(
     struct domain *d);
 void grant_table_init_vcpu(struct vcpu *v);
@@ -69,8 +69,12 @@ int gnttab_acquire_resource(
 
 static inline int grant_table_init(struct domain *d,
                                    int max_grant_frames,
-                                   int max_maptrack_frames)
+                                   int max_maptrack_frames,
+                                   unsigned int options)
 {
+    if ( options )
+        return -EINVAL;
+
     return 0;
 }
 
-- 
2.33.0


