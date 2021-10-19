Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D994334B9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 13:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213052.371156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnL6-0003RR-2e; Tue, 19 Oct 2021 11:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213052.371156; Tue, 19 Oct 2021 11:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnL5-0003OK-Vq; Tue, 19 Oct 2021 11:31:27 +0000
Received: by outflank-mailman (input) for mailman id 213052;
 Tue, 19 Oct 2021 11:31:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXNP=PH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mcnL3-0003OE-Df
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:31:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51491dcc-82f4-4e6d-b3ee-7809e4dfbe3e;
 Tue, 19 Oct 2021 11:31:24 +0000 (UTC)
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
X-Inumbo-ID: 51491dcc-82f4-4e6d-b3ee-7809e4dfbe3e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634643084;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=d9c4aloUsgma8HDm99ip8r6GYEiQI6ifTi1XGOPn8SY=;
  b=ZrJHBEtDy+EJo/x/fizWOcwOVidouPfBMFd0lejKoahn2FbSR9iSTd6B
   MyAl38X3ikbhUJUMTNz9S7llPVa/O2jeT3Lt+KDh4ojhIAs3l8B/0E91t
   jGZ2rEmUMFEP2WmfkGtvxFR2N1ZtPV3URUSNU2FUe8e9aHY8nM7lJhkzZ
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: H9n8eDAfajAdqufTUgJ1IcTgJDsgphXZYAYLRtAM9Aajr3d2j3SZN5TLwsG4DvTsESHT2s8Giw
 0Q3UxOjGz5XzM6JI4gwYlzn3RVzYl/PUyiZkGyGIjy5BtgvN0gmhPjrWtdfsqJsvc6no6dOgr4
 RmJt9vWe4TFH8GjJVsA+EJyuqMBCQeP+0x6fWvmg5PDOthEHkNpRNDl/fBi8oLGfDWUXy8qRpU
 vYQoaFE5CdHH6yOBjvYedhkwCB7C2UlQMqMXKn6jDXfMXZFFlXLJRIb/HEmhV9kBuRud0VfT9d
 lqIN/1HNX+ZXSZyOaGCY5dRa
X-SBRS: 5.1
X-MesageID: 55085484
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:x+bF9K1i69j+ggoPzfbD5Qt2kn2cJEfYwER7XKvMYLTBsI5bp2YAz
 mYWC2rVa6vbZTSged93a9nn9kkCv5bVmIJhTAVtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970Es7wr9h2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhpd5V9
 ucQus2LUSAwApP+t+oTfgcIKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIIAjGps1pwm8fD2b
 NUaNjEobC/6egwIYHw2N5M4lsGVvyyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWCrlq6jEMTCuFINPQG1jOixKT5/VagUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P8mvsYXl9wXsqIHZeF1NcsoaLTJQb10qXFr5e/LiJYsoZ8N0a6
 wuBqzQinP0thMoP2rTTEbvv0m/0+MahouLY4GzqsoOZAuFRONHNi2+AswGzARN8wGCxFAnpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4LvGwufhkxaJhdKVcFh
 XM/XysLtPe/21PxNcdKj3+ZUZx2ncAM6/y0PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0PCbygM3mJq9B7wJJjBSFTOK0aYvd/L4arCgFnBHsgG7nWx7YgcJZihKNbiqHD+
 XTVZ6OS4ACXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:ITuR465/kj/VKwsLKQPXwVmBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdhrNhQItKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkDNDSSNykKsS+Z2njALz9I+rDum8rJ9ISuv0uFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L52gkBrsA7ciYsV9MOOA42e7rANoX8e2O+DIusGyWTKEgmAQOHl3el2sR+2AmVEKZ4u6fa3q
 6xCW9liQ==
X-IronPort-AV: E=Sophos;i="5.85,384,1624334400"; 
   d="scan'208";a="55085484"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZlMssREYHiCE9ONUVCpewOdKki19Dj3Ay0TVRQJSUY+dVdsMQDsIXG5i3XtCo09TYQq5qORXkbjDrOimkHR9MB87DdBmxuc2N8aTilRWUWW6ERt9pW7pyt2+jfSUaio8/5pIPfAzebmmZtsLqRNnJ1LYCstOAIuekTrs0BQMepFMTKFWyvkxM7VgEKHArzk4OvZy467rU8yCr4KYuPaY1jSkkI25ZQW9GsbzxmIs5Pd/SI38I/Agq4RrekufOeSWxouEvvNnMZtV0u2zlvoP2P0V+Akx5dzk1DADpLQqnDAkzZNgEDsxVKjFCesStsBNNu32s9+1ZSY9N99j9SfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V74hYCJTI8XNv2qDJ17ZsmmKDEgzk14vxa4bRbPtGZc=;
 b=ApFjopDXFAiAEz731eodkPzcW6FAfOCjVCA2HpXbIiVHlP5l6oy9HGcjLrCM5s4XBrWXEPbZe0Go1I4rVe7oDbT8t6ow5Xoa7nDB7x3GdCGeFVfyhUxEX5CBMKRXGjZNCTeVmh5fd4qadyFIMboRt2d9Bom2oUJjP4k+QmGuF7+PCjnwpg3gvU8dQuoxLCtHRKV5wT9Vmt4Zn2vP8MRr+40JGls4dQRuCsAU/3sCGp4QuRoYesLbJZzsesJZ083LJ9FYMV3cg1SWYcn5USv8uaI4KzTrKo8FhcbgbVyjYxuW9fMA2zO82MO9Jffl7lgV5CDfIzx5s1f7E4N3smIyTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V74hYCJTI8XNv2qDJ17ZsmmKDEgzk14vxa4bRbPtGZc=;
 b=cKG1Oz7O5ShpHVgxl3ONDUUSv4LpPkZsvznnspa7XE1wOsbNQvB6O+EjvpNtZMOF6etxnaBlRZTplYyQ6wOY9cylL+F76Vj1a/at/0SRe9GPk8G1SRN9kuPb+H3wTEhf1gDcB8QL479tTPo7QZ6F79GgtytLvgGyFDRfbQyvZ6c=
Date: Tue, 19 Oct 2021 13:30:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/hpet: Use another crystalball to evaluate HPET
 usability
Message-ID: <YW6sSXMyC6t4fB62@MacBook-Air-de-Roger.local>
References: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
 <da80b8dd-177c-d27a-9a00-c9538a139d37@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da80b8dd-177c-d27a-9a00-c9538a139d37@suse.com>
X-ClientProxiedBy: LO4P123CA0180.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9271573d-932d-4ee8-76ca-08d992f3d704
X-MS-TrafficTypeDiagnostic: DM5PR03MB2491:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2491E18DEAFFC55148FA7AE68FBD9@DM5PR03MB2491.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qya34a3ZuGDd7a7G5kFAYL5Jq5vZ9hWf4UbnrmWOGXeIQxZRpwa7n365PFuD4BdxdBZ/F0hWPZS6QGl2TOPk1zZ/NoM2i7nF8UuvNwAOSFG9+CMy09EgHTJZ55iJO1hthlmnQ9/ZBn+DMeq4844AY5+CsJpzR5z+1ck38ixVj0aNzW8vqiooC8//974t6Pd7gmBWvgv+CTJP7FeLme5zIByGkYvCPcC4opnU0lpxJ5BOOFaeykjN3IgFk8Go+Z3mpUXM0GUsQ2K+snLU4lmMAsmgpTkwwsWSErvqwUEwYwmKE7qrHSjHAaIvrYuCtftaVindmcQTv1B/f/C4DoJLXOIZPc49Tme1IdoKsvTl9fhZY1jmWEo5s9QYF+IQdF+uZ66HXRP6mdr1vNe7bpCz27XOJQGETJrmn9tnwCzQTw4IjE8iiNnR8g6vbefEUNxn0Baqa0kSAwwimxhF0nDqYbFlEPlUlW20eBF5CgCoVuZIRaWsfATlhZrQb1bd25TdgoJpDX1oVJmJ2QzVVDM920KJNalpPL6UlMFyYCpGDeEVcwN2AX2fPuiAv43XZUDOyqby756+3y8J+rh6UWc1uAH1b0nqbZywKplLfqeTW52g+8z/Ilxk4ISKmZ4i1fjGdx3hH7RSNZtDiLjt6SKJIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(66476007)(8676002)(85182001)(66556008)(86362001)(508600001)(316002)(5660300002)(2906002)(66946007)(8936002)(6496006)(4326008)(9686003)(6916009)(6486002)(26005)(82960400001)(54906003)(83380400001)(186003)(956004)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUJrVnhVbHJRR1UwTTRRd3I5N1orWHpmWmVuYUpMT0h4NkdmWEFQSDJkSU8v?=
 =?utf-8?B?bkMvVW9XVFppbTk4V3hVa0U5RHlTT2tSUlpjT001RHZEQ2o4Sk1XVVphYjZ1?=
 =?utf-8?B?MlRVZWlSUkN5US9QNWtJRmRZUkkwdXZQSjNidUdLWmkwWm1aMStEVm9jaTJI?=
 =?utf-8?B?OE9adDgzZUk0bGhXbXNCeFkzSkJ0ay82OGZaWU9xdnV5RlpqVWRlZlkzenZr?=
 =?utf-8?B?a2Q3Q2hVS0Z2QVRPNUpNZzQ5SE0wN0htL2hrNDV4YTB2MFJQQkphSGhwaEps?=
 =?utf-8?B?MUpvRTYwSVpSa0tzQy9Ga2RXTW9tZk9CUjZwWnJCUHhlVm9ZYU96N29aUEJt?=
 =?utf-8?B?Vk51M2V5UGFSOW5xWjFmay9RUDY2U0RrRlNCS012ZlpXNTA1RWFwZHJ6eFI0?=
 =?utf-8?B?d1RjZHRyQjhXYmIzWVYwdkxUSlBzWHk4TjNDck90dGxDWDE5dTY5T1N4QXJT?=
 =?utf-8?B?cHdLdGQra09lME05RjVUaFFGZzRtWENNN2tLb2dlbHBNS1pIaTM2c0paMDJD?=
 =?utf-8?B?cHVxSVpVNWlGMHI0dUo4enkvK1VWVTVRNXBaSVFzKytFazczcFpEN2tGbFBw?=
 =?utf-8?B?VnhHaFFWV05HMUREdjZUbDJwcEluOGZNcGFpbTNaSWkraHhTQ20yOG5FUTR5?=
 =?utf-8?B?RjNKdndpN250bC9SUVNkVWovUDBOOXZ3T25yTzNYN0NZRWpYdFdnZGZmTUZR?=
 =?utf-8?B?czkydGFNRjhGNkZCV2lxZDN2aHRydEx4ODcrSmR2M0k3aGd0VjV1R0lESGpN?=
 =?utf-8?B?TTl1ZHBVczNzSU9xZ1I4K2MrK251MGJNL3c3eVlpdEg4dHZLai9jS2ppZEJK?=
 =?utf-8?B?bENub29acU1ra3h6a3hBK291Tk1PL2hKQ2k2UkJtWmVjNHRBS2t2MGZSa1dk?=
 =?utf-8?B?bkxjZnJ5RUJLTTBkS0ptK294d0ZITldqd3FJcW5oV21NbkRiZHdhR3ZITzVo?=
 =?utf-8?B?QkJsVi9lczU0L09yRnVqR1NqQVNZQTBiVW54RzFXa05yOE52MzFxQUFIaitV?=
 =?utf-8?B?OVRJVEtvWld5ZUFyWlJzYXNGbUIrU0Y0TjN2QWhwVUxSUnBUN0c2R3NKNmo5?=
 =?utf-8?B?R1QxWlFadkk3TDEyVlRFRFRYQ3NURGQxUWgwMlVmc3k5bncwdHVXZTU4U0oz?=
 =?utf-8?B?Q3A3SkFXWkF3NEQvK0Z5eDczRTVIMjNDaExvVjNNMjRJZldLckxEYTVXRUhF?=
 =?utf-8?B?dzRoZGN2RWdvVnFuRW02c3RpTnVXU0ZDUExLd25GZ3ZsYzhFb1crckdNSE9B?=
 =?utf-8?B?cndYanZFdm4wdk1CWlBlT3htZ0pIa09VVmZCNi9YRlQ2K3M1U2NKazlreXFu?=
 =?utf-8?B?QVdvY3d3KzhTUDliTzF1UUNqenlKUXQxNlRGeUY0T051NWViUVorQ0FXUVB0?=
 =?utf-8?B?NFhqdXdERGxzc3dPY2xuWjYxcXpKZzBuSlRHbWlzdHc2SS9wSUt5SEpoN0VC?=
 =?utf-8?B?dTZHWEZOV3NTdXNjcmRnSGszZmpzNjEwR2w5UEIzUnkvN1ByRFNGS1RTTHBS?=
 =?utf-8?B?Y2s1V01PejRKOElYbGhweU5GVzJ4ak9sNjFSRXVyVE0xVExnL3lhSGhBVkxh?=
 =?utf-8?B?bHBOVUcrREQ1Rjc3MGFUczFBSGJFMnpxUlYyODluZFRsUmhNSlMwYmx4dGRV?=
 =?utf-8?B?alpmaWRESWM0TlJBd3JXMDVMZ21tR0U1Wmh4TVZSbzJoKzlCa2NwWStoNXox?=
 =?utf-8?B?bFdVSHhLTVM4SzVtVlhtTzFkMXgyZzZVRGh5N1pCM2RuenBCck1vUGgzVmsv?=
 =?utf-8?Q?du9Krv2nsF2MZAZKeP2uwJ4nUyr7dH/iMihA45D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9271573d-932d-4ee8-76ca-08d992f3d704
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 11:30:23.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i76Dh1qrzwiKaBXMkcJ/Y47Cw/IgUNnsz+5ZbgRNhzajb7txnjgg7QRl22y0Qk7sfdUYyG4d2A8IMq5ErieFjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2491
X-OriginatorOrg: citrix.com

On Tue, Oct 19, 2021 at 09:07:39AM +0200, Jan Beulich wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> On recent Intel systems the HPET stops working when the system reaches PC10
> idle state.
> 
> The approach of adding PCI ids to the early quirks to disable HPET on
> these systems is a whack a mole game which makes no sense.
> 
> Check for PC10 instead and force disable HPET if supported. The check is
> overbroad as it does not take ACPI, mwait-idle enablement and command
> line parameters into account. That's fine as long as there is at least
> PMTIMER available to calibrate the TSC frequency. The decision can be
> overruled by adding "clocksource=hpet" on the Xen command line.
> 
> Remove the related PCI quirks for affected Coffee Lake systems as they
> are not longer required. That should also cover all other systems, i.e.
> Ice Lake, Tiger Lake, and newer generations, which are most likely
> affected by this as well.
> 
> Fixes: Yet another hardware trainwreck
> Reported-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> [Linux commit: 6e3cd95234dc1eda488f4f487c281bac8fef4d9b]
> 
> I have to admit that the purpose of checking CPUID5_ECX_INTERRUPT_BREAK
> is unclear to me, but I didn't want to diverge in technical aspects from
> the Linux commit.
> 
> In mwait_pc10_supported(), besides some cosmetic adjustments, avoid UB
> from shifting left a signed 4-bit constant by 28 bits.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Just one comment below.

> ---
> v2: Fully different replacement of "x86: avoid HPET use also on certain
>     Coffee Lake H".
> 
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -34,6 +34,7 @@
>  #include <asm/fixmap.h>
>  #include <asm/guest.h>
>  #include <asm/mc146818rtc.h>
> +#include <asm/mwait.h>
>  #include <asm/div64.h>
>  #include <asm/acpi.h>
>  #include <asm/hpet.h>
> @@ -395,14 +396,43 @@ static int64_t __init init_hpet(struct p
>              }
>  
>          /*
> -         * Some Coffee Lake platforms have a skewed HPET timer once the SoCs
> -         * entered PC10.
> +         * Some Coffee Lake and later platforms have a skewed HPET timer once
> +         * they entered PC10.
> +         *
> +         * Check whether the system supports PC10. If so force disable HPET as
> +         * that stops counting in PC10. This check is overbroad as it does not
> +         * take any of the following into account:
> +         *
> +         *	- ACPI tables
> +         *	- Enablement of mwait-idle
> +         *	- Command line arguments which limit mwait-idle C-state support
> +         *
> +         * That's perfectly fine. HPET is a piece of hardware designed by
> +         * committee and the only reasons why it is still in use on modern
> +         * systems is the fact that it is impossible to reliably query TSC and
> +         * CPU frequency via CPUID or firmware.
> +         *
> +         * If HPET is functional it is useful for calibrating TSC, but this can
> +         * be done via PMTIMER as well which seems to be the last remaining
> +         * timer on X86/INTEL platforms that has not been completely wreckaged
> +         * by feature creep.
> +         *
> +         * In theory HPET support should be removed altogether, but there are
> +         * older systems out there which depend on it because TSC and APIC timer
> +         * are dysfunctional in deeper C-states.
>           */
> -        if ( pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
> -                             PCI_VENDOR_ID) == PCI_VENDOR_ID_INTEL &&
> -             pci_conf_read16(PCI_SBDF(0, 0, 0, 0),
> -                             PCI_DEVICE_ID) == 0x3ec4 )
> -            hpet_address = 0;
> +        if ( mwait_pc10_supported() )
> +        {
> +            uint64_t pcfg;
> +
> +            rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, pcfg);
> +            if ( (pcfg & 0xf) < 8 )
> +                /* nothing */;
> +            else if ( !strcmp(opt_clocksource, pts->id) )
> +                printk("HPET use requested via command line, but dysfunctional in PC10\n");
> +            else
> +                hpet_address = 0;

Should we print a message that HPET is being disabled?

Thanks, Roger.

