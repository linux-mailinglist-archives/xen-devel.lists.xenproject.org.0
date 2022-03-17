Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED9C4DC7E4
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 14:51:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291576.494950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqWn-0006cc-On; Thu, 17 Mar 2022 13:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291576.494950; Thu, 17 Mar 2022 13:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqWn-0006ZU-Kt; Thu, 17 Mar 2022 13:50:57 +0000
Received: by outflank-mailman (input) for mailman id 291576;
 Thu, 17 Mar 2022 13:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JNAg=T4=citrix.com=prvs=0684b021b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nUqWl-0006ZO-Lp
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 13:50:55 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41f91ce2-a5f9-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 14:50:53 +0100 (CET)
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
X-Inumbo-ID: 41f91ce2-a5f9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647525053;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=T9InDsiSQ9z3IQJlJgji4+IBR3+pTDJ6bgWJBfja+AU=;
  b=PAEX0ZFtu9rYaDTMaLI3CYXg2xgajLQnDqdai6r+mJft+qYQD3+d1+OG
   NVqxLbmq6Bzqmpkvw5I1UHJ1MOnHrdaZ/fpvqfF3DMBVvYDXNCQ4RogTj
   T+JoLfeth27vDW5HtnsgVvpO+Ty5NtGY9obChoUflWdk7C/YiAMZV6oAZ
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66903922
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gzW/G6hKwKEOvcjhw8NJ2g+RX1617RAKZh0ujC45NGQN5FlHY01je
 htvUG6GaPnbazH8e912aIjl8k8F6sPRz9I2TgY+rHgxQSIb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFrS4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YS12OaDhhs8DaiF3IRt3L6Bv1JiaJ2fq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiAN
 pJCOGA1BPjGSxduBFobC7caprq5pEHHKmxYiWCer4NitgA/yyQuieOwYbI5YOeie8JRmUqJo
 3PcyE7wCBoaKd+3xCKM9zSngeqntSn2Qp4IHbu0sPtjmkSOx3c7AQcTE1C8pJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JPF8Uq5QfLzbDbiy6aAW4eRzIHd90it+cxXzUh0
 lLPlNTsbRRturCITXOW9p+PsCi/fyMSKAcqZzIATAYDy8nupsc0lB2nZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj6kmg1QmZ2XT2/MGPF1NroFWMNo640u9nTKT6YIGF93PF1M5vHryQXFSok
 F9ZndfLuYjiEqqxvCCKRewMGpSg6PCELCDQjDZTInUxy9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Cc/rCsLvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBcmBxycnT2
 r/BKK5A6Er274w9kFJaoM9HjdcWKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 YoAa5bVkk8BCLKjCsUyzWL1BQpWRZTcLcqqw/G7i8bZelY2cI3fI6K5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3RAk2PnIjHBM4lxVpiZHREFQ/xhxALPNb+hI9CJsBfVeR2q4ReIQtcE
 qBtlzOoWa8UFFwqOl01MPHAkWCVXE/y1FzUYHb9PmRXklwJb1Whx+IItzDHrUEmJiG2qdE/s
 /un0AbaSoAEXANsEIDdb/fH8r97lSV1dD5aN6cQHuRuRQ==
IronPort-HdrOrdr: A9a23:fa9PxqDgNRB/Dr/lHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="66903922"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIdcF+KyNPdN67JgM0MWB0snIF+JrqAyLaAX4P0W9HvsgcfQ1Ah0/3c6xU6l4HUqEi6JiCt2vuNF+ytEny1y2M8oDzDcTeHcBVLkd6ZrBUKKruLRu+yCQXq8bQI45e0SkljlY+cKa0oPvPx9IZuinRvVnIepV/VjoNa3q4Y7/up/txIxF7GUtg7Hkc2tG+tD5PfocwWoVYF1Yf0U0Nazm0VTWDSeLfMF0IpEK5xMsMZTT96Rig8WC2aEZfuwq7uPmzckiPMJdVMbOJcSEg50BCitL0XPlB6JVIZpOIC8Qa+l/bN2Pn+v2ZLNeob0EoX6rs4shzYaxsTlDo+Y5xj+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11N184gdWqI70BzXhll4qv5NlwfSnl6B6Q2N3sIaClw=;
 b=bas0xBmJAkQtN6H7xXvpJaDwwvvZMLSFPCUa9V7KNWqTeCCEdCYCsSUZZaFrzVJOUnm6HGxnm3UMoKKs557IfhULzR7tDBQ/tmDIMbPHZy8qpQOk6E5MC/OEja+obOg3A//jQU1K/sc1dZsCpyZrVVtuNpPTvIJIu83AinDPtgXfFEwBBw7gVhbFO8fSXvcKRuv4JQs9apryRfy/PhGDvFzJePE/ohdAsVG48O4SxWyTGfwh8YsotBai5GWSk7Xbia5qOrpkEqzTzYRY3s4+7ZkG6jSFmy5Hcmvc8ZHHGXRgnac2tV7WyYYEl18zur1RR6X4O7vxvhzMMg9FBMMImg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11N184gdWqI70BzXhll4qv5NlwfSnl6B6Q2N3sIaClw=;
 b=dUTBlNbXHvtmwLP5iRpZzu/bSaWUkfBNA3I6H31bhUDk7c57TLIfRopa4Mexn18UObjj1vidnzhuW+lWCDXUfryUhRMJ+HtG7r6qccsXxdv8Xa0qLkagj6GZbAClbh0jRYOgFkTptr6NvqdOR+1AdhDbV32RpT0+h6OKw3mm48I=
Date: Thu, 17 Mar 2022 14:50:41 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] livepatch: avoid relocations referencing ignored
 section symbols
Message-ID: <YjM8sReJHEwEa4h1@Air-de-Roger>
References: <20220317110854.39050-1-roger.pau@citrix.com>
 <20220317110854.39050-3-roger.pau@citrix.com>
 <e6a90957-2b74-58c5-28b0-f926d95a8329@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6a90957-2b74-58c5-28b0-f926d95a8329@suse.com>
X-ClientProxiedBy: LO4P265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a382f01-07e3-4942-198f-08da081d22f2
X-MS-TrafficTypeDiagnostic: BY5PR03MB4967:EE_
X-Microsoft-Antispam-PRVS: <BY5PR03MB4967D07A8D2E80D44248A0238F129@BY5PR03MB4967.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T3wlmziU5DU0N6rx2rjKruskSH6wP9+IeQ72snM7JOEpo3pjXyGXGL5UAM9eMFuYl4mcY0kroiT1nPIbc9l6JmIw7rE5R43mxM8JsR3JAcSqCCNh1LiFE+q6UK8Q5inIbuLQW0lN1r/Xzi1DwPeoMPvowanuCsqydlKVoxDE4eK2eZ+Zw9QdG+xddqFr59XOQ7b5yj7m8QpMP0VAmG/k8DIdeooxa40CF/FPEoSq5T6wIquM+lteWWjXW/e9Vc8VmlQoFBzdcQas0RFZ03+77s+bXvvsHGy6TKiSWngWFvZwhVtY4JqSX0Vpk3vF1PMSFCn87cn/Whyqv6M418qsU7J1wGnJpGqR/I/FOBKvWZHXq8KbE4MJhvxERmjxzKE0KMPxQyHBhTLCroNQDC2PiIJBXxn+pBgO2UqnnfrnH0y1wtDDQdGspfUhBzAtWrXgN3gTx7z90G304HtBotF0wsQB+/A2JWF1k60kFO2i1HFSuyyzPlFqkXJiMiWCIOUMTJBLLA5c3rsbO8gbNuDVrz7MSz+OLdnBSNjqtVLasIL17mf8YY+rdGmHh8zzwTlQA3KD2S0rKSOiJ2bkbpr8ruy6m0FmLRUUggF6KwMi31tckILGi46os7KawexdSgvOM9qcb+iTQaVoiosWthlcow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(2906002)(83380400001)(85182001)(33716001)(9686003)(6512007)(5660300002)(82960400001)(8936002)(6666004)(8676002)(66476007)(66556008)(66946007)(186003)(26005)(38100700002)(53546011)(4326008)(86362001)(6506007)(508600001)(316002)(54906003)(6486002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkorVUdmNjNvSGQ1VmZ4a3dScjJOUHBYQU9GcXgxa2N1Z25OQTNBMUJSeEFj?=
 =?utf-8?B?QjQ4aS82bThuTDhHK1FHN01JV3BpOVpxK2svWFJ4UnZsdU45Q0MvT29tWjZX?=
 =?utf-8?B?VG5HYy9HMldzTUx1MlZBT2JMTTlOR3JWU1FNdWFOc0szU3dOOWNCWXpQejV2?=
 =?utf-8?B?ZUVNYTJoenhjeGo4c3RSY3dnTFdnRFZpTmh6OHZ4cUZnUnZVelQxS2FpTzJt?=
 =?utf-8?B?aXVyREhHSytlK253UmR4cUtlTGlNbGVYOE5JR25CbXBTeXZiek4vK3JXZWJm?=
 =?utf-8?B?RGNVNUpoNWxJZXFURjVsR1VBY1dOakUyMXpJNkthb3dldElCcHh3Yk9FTEJZ?=
 =?utf-8?B?RG1SbVNyZWRRSnl6bkZRdEhuc2R1aU5lNS9PRmJKL21MK3JYSVFjSHJPdW5j?=
 =?utf-8?B?R000U0YwN1BnNW9PdzBCeWtaTTZZY3B1WEJONmlHb1Q3L1l6OVpldGcyL05p?=
 =?utf-8?B?KzZlUGY5UFhnR0hicVVhdTEwa3lobUUxVEJmczh6QUtnSklISjY4L3BSdWU2?=
 =?utf-8?B?U0RGMzZvL1JjYUUvQjJmVU84MS9xMzd5R2lLZTZIREg3MDNoVHlGR2l4eHly?=
 =?utf-8?B?UzlnVnM5amR3Z1VubE5nU2NqaE9rZHhPL1o4R2ZkaW81NU9CTjZXYVhaQUpi?=
 =?utf-8?B?b1liUjZnUlp1L0pJdi9GTjZMWHlwNk0rS3Q1LytBWXcvbTV4bWxUajlubEJV?=
 =?utf-8?B?SGNBWndzR1pUbzA5Wm94Z2lHNitIejdJMmI5cUM5MFFqL3hhM3g0aFN5c0R2?=
 =?utf-8?B?MS9iNGZKbC9lai9NR0xjb01xU0doZ0tlVC9LMUttOGVPcjhIajU2QUJrZTRZ?=
 =?utf-8?B?NUl1dU96VUJ0ZDU1YmNkSU5ZSWovZW10blNvVDZVbTc2NkI3NzEydkZPOTFo?=
 =?utf-8?B?UUtCN2dZZWRoMSthaHNrVlNJTHFCR0RXTERmR1dxOFJ1M29pMkRGMVhQTndm?=
 =?utf-8?B?c1luUFRkUWlBWk83SzhTUWhxS091MU9oeU13M1BqcmRoQ082bWFyUmhqRFUx?=
 =?utf-8?B?RlQrUEpzZ1BDbENGUHJNemtwUWlPMmp0em1ZMTZ5UUtYdjVKWGFwVEhxaWJX?=
 =?utf-8?B?Y2tQL0I3UDhJOXRhSzFzL2RpWWZQcFFId1h0ZlJNcS9iRldubVFXdFVNek1O?=
 =?utf-8?B?bGVNdTlENEhwam9Jd1VCb0ltUG9WRzNTbHNsbXpzQTJvNTdQVVJCNWVPckJa?=
 =?utf-8?B?TUw1OVZIZzZGU01ZQmxocURuMUtPRFVaQUFFWG1BbHFUVXM3MXVsK3ZwMlFW?=
 =?utf-8?B?dldsc0N1eGNNZkNlSG9Md0RDa3dYcDhydjUvbmFiRFMvbzBwaDdRTklMT3hC?=
 =?utf-8?B?SFl3VFFIOFFMV0VPcXNBb3I2Y1pMKzNzcUI3MzdtM2V0dW5ub3NNb3VnOWZZ?=
 =?utf-8?B?RWNvNkFGRjFReXNBVlQySGQva0xrYUd5RHJTVmNHdmdXdUw1RDdxUlVLck9l?=
 =?utf-8?B?ZEpMUllFTnNsTlNzOVJBVjV2L2dDTTRsWW56U2Q5eXRUcFNwS1pvc3lKanJR?=
 =?utf-8?B?QXErTG9YZ09mOUQ5SUFTYnZoaXhpcjk1UFBZUGMrQ0FIU0Q2dkVxTXZ6SklY?=
 =?utf-8?B?dCtyWVlyUHh0S2VWaUo4MlV0YmwwWHNJT2NrelIzY2hVbEpYZ1ltaXVvdGJr?=
 =?utf-8?B?RTZFMDVsSG5QcGViOG1vNEZ3YzBtN2t6cFBCQ3J0T3hFYTRmeVZLYXhkTGp5?=
 =?utf-8?B?bkhPLzVwNExUenc2VmcrMElkeWNSWXg2ZTBmWEpDWlR0MHNDTEVYanp1d0Iv?=
 =?utf-8?B?ZjlSNHZXa0Ntd0F6NlovMlNKZEEzRFMxcFNDNmNyTEZvNSt1eVhWajd3SHVt?=
 =?utf-8?B?TVo4NXdVTzQ4bDFUOHgzS25KOFRoNmM3UU00L0hCNFRqOER6MzdzVkJSeWd4?=
 =?utf-8?B?UkRxQTRONUEyVkpkTnZEMHpyemdIY2tXU1JjaTZGQjNKd1JlRzVsanM4ckQx?=
 =?utf-8?B?ek00djFueFhobEE4OGF0K2Z4QW9OVllLMVpGNXpieUNPaVo3M0dVMDloK216?=
 =?utf-8?B?MjdJQTBQaVRnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a382f01-07e3-4942-198f-08da081d22f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 13:50:46.1898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6vYb9YPdLYPVWXBWgkPqS/jxf1fTWWyfNyA57bGjvfxdB/0sfe8Nf1ZT8GikV19KgE004gf07c0O4v0BuOUGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4967
X-OriginatorOrg: citrix.com

On Thu, Mar 17, 2022 at 02:26:50PM +0100, Jan Beulich wrote:
> On 17.03.2022 12:08, Roger Pau Monne wrote:
> > Track whether symbols belong to ignored sections in order to avoid
> > applying relocations referencing those symbols. The address of such
> > symbols won't be resolved and thus the relocation will likely fail or
> > write garbage to the destination.
> > 
> > Return an error in that case, as leaving unresolved relocations would
> > lead to malfunctioning payload code.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one nit (which can likely be addressed while committing):
> 
> > --- a/xen/arch/arm/arm32/livepatch.c
> > +++ b/xen/arch/arm/arm32/livepatch.c
> > @@ -272,6 +272,13 @@ int arch_livepatch_perform(struct livepatch_elf *elf,
> >                     elf->name, symndx);
> >              return -EINVAL;
> >          }
> > +        else if ( elf->sym[symndx].ignored )
> > +        {
> > +            printk(XENLOG_ERR LIVEPATCH
> > +                    "%s: Relocation against ignored symbol %s cannot be resolved\n",
> > +                    elf->name, elf->sym[symndx].name);
> 
> Indentation here (and in the other two instances mirroring this)
> is off by one.

Oh, thanks, sorry for not noticing.

Roger.

