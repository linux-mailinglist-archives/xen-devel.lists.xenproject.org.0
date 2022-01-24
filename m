Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA754983DB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jan 2022 16:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259894.448645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1di-0004Y8-AE; Mon, 24 Jan 2022 15:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259894.448645; Mon, 24 Jan 2022 15:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nC1di-0004V4-6W; Mon, 24 Jan 2022 15:52:18 +0000
Received: by outflank-mailman (input) for mailman id 259894;
 Mon, 24 Jan 2022 15:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BDBv=SI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nC1dg-0004Uy-HB
 for xen-devel@lists.xenproject.org; Mon, 24 Jan 2022 15:52:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 977a82b7-7d2d-11ec-8fa7-f31e035a9116;
 Mon, 24 Jan 2022 16:52:13 +0100 (CET)
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
X-Inumbo-ID: 977a82b7-7d2d-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643039533;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=wctpGSAqI7Znq2QTTZzfk32D283kWtMwEhwylcvceuA=;
  b=UFtMHZdh2mHIq1nawQCbfG8VdHMnJLGrex3ZItjZzV+OZJmi2SYxTKyq
   z2/BC71NB23MQxTeKiHYbD07xqcXQcIfIFJxkZoVw+iWb8Tb4yF7sujm+
   YSjmkk26CGdLhnMbM6vaOHNtIIpd/2u9T9vw5OxX43IEBnK9gJC7WhiQv
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: dlIssqMoDR+btzLDzbQK6QqSLWMELW2IJNCAt2pks95YEJhPClRs3Zerx+xjblJuvWbMhAfbDm
 gStzMhunQHH8OPZaaAe167If/ENq4GVea5gQA12aMXa8CtdCtmdycd/DMnIZgZ80yuzYstvnBy
 NMpClWJ7/Skw57ya6XUxbSOWfHSU+htTes/ghqoI64kaPEIeGgQMSmVkCQozMsQGcQV7jDCLzh
 5OPAKVcga+o+DqDFv4f/ZHFqNJjafPXOj7+cM8KZHJDosvVWi+eTwyUe9z9DljhghL7/+JdKcF
 9uZyMTgycPiiLfJu5ifryAih
X-SBRS: 5.2
X-MesageID: 63043546
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YU52tq8GCkiZ84IqNONeDrUDUnmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 GoYX27Tbv6NN2ujed4gYdm18BgPuZTTzdJiTgU9rnw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj3tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh10
 OxR7ISuGD0WI5PKncg9cBpENxtHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGh29s3Z0SQ54yY
 eI5UCMwdzefSCdMEQgaL4oupsGUr0bgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSSq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHqchwJFQ8QBKdIn1geI5or34Bq9PFFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1kRiG2NPdXABb3nARFod97xc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9rWXzoCX+LNEOuVmSwXuF1e5fIVfUj
 LL741sNtPe/wlP0BUOIX25BI5tzlvWxfTgUfvvVcsBPcvBMmPyvp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJStEVcxPkWTnL89Age5D7n1vngv7GMGkpylLJJLDPhZ5v59fbgvXBg34hYvZyDjoH
 yF3bpvTlE4HAbSgO0E6M+c7dDg3EJTyPrivw+R/fe+fOAt2XmYnDv7a27Q6fIJ52a9Sk4/1E
 ruVAye0EXLz2i/KLxukcHdmZO+9VJpztytjbyctIUypyz4oZoP2tPUTcJ4+fL8G8u1/zKErE
 6lZKpvYWvkfGC7a/zk9bIXmqNAwfhqcmg/TbTGuZyIyfsA8SlWRqMPkZAbm6AIHEjGz6Zklu
 7Sl2w6CGcgDSg1uAdz4cvWqy1/t73ERlPgrBxnDI8VJeVWq+49vcnSjgvgyKsAKCBPC2jrFi
 FrGXUZG/bHA+tZn/sPIiKaIq5aSP9F/RkcKTXPG6buWNDXB+jbxy4F3T+vVLyvWU3n5+fv+a
 LwNne38KvAOgH1Dr5F4T+Rw1as76tbi++1awwBjECmZZlinEOo9cHyP3M0JvaxR3L5J/wCxX
 xvXqNVdPLyIPuLjEUIQe1V5PrjSi6lMl2mA9+kxLWX7+DRzreiOXkhlNhWRjDBQceluO4Q/z
 OZ94MMb5mRTUPbx3gpqWsyMy1mxEw==
IronPort-HdrOrdr: A9a23:XotTTayqeh/Q20BL9ateKrPxwOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjlfZq6z+8O3WBxB8bYYOCCggWVxe5ZnO3fKlHbak/DH41mpN
 hdmspFeaTN5DFB5K6QimnIcOrIqOP3jJxA7t2uqEuFIzsaDp2JuGxCe3um+wBNNUB7LKt8MK
 DZyttMpjKmd3hSRsOnBkMdV+yGg9HQjprpbTMPGhZisWC1/HiVwY+/NyLd8gYVUjtJz7tn2W
 /Zkzbh7qHml/2g0BfT20La8pwTstr8zdloAtCKl6EuW33RozftQL4kd6yJvTgzru3qwFE2kO
 PUqxNlBMh342O5RBDAnTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZ1B+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3MEiFXtuYdk99R/BmcEa+L
 EENrCd2B8WSyLRU5nhhBgh/DT2NU5DXStvQSA5y7moOnZt7TJEJnAjtb0id0E7heAAoql/lp
 r525tT5cFzp7ctHNpA7cc6MLyK4z/2MGTx2Fz7GyWVKEhAAQOJl6LK
X-IronPort-AV: E=Sophos;i="5.88,311,1635220800"; 
   d="scan'208";a="63043546"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBqP2hR56ROs32VcdFP9G0sUvCNkoIm4vVajyznSEngReobUQ1neBSPQvwDuABAl3Z9PLAJYf63qcD6TsLoyxAIEFO6wEQy2euIes8BaHvQU/MhzlfhSCdfQfwKRDAStUABE5cE5O1MyyxV2JStyWo+spY8Gb/sbWGk0/T1b6HaZu3JiE7x/o+wYiEryzyblyNheiIhY5QLD9wJESaHoa2Pl3GKVZaqb6uoh2auVJrdnwiN1xAu4+aBP+ibDvdSD3RIsrGOeqD2wL5vyHKjX25hx+lTTXwYcqw1baNYpDN2cQUpggryE6tvvzwYawq5KX/xJc8TBd7u2WZnPFPO+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WivgsLMvz4O78BXePpMJHcH32FjfjwpJqvql3OKi70I=;
 b=WEDwUJi8AIovPxEgg49AZoB3a0ebWy2SBtJnLJLQQgpRrlyas8Q2FwSEAb6ijeYonTrm4acxPBauGaptdBUVt0jFw30nGpcu9irlpLiN1QBYRXAH9v4no8J6yRjmXSkoE/SIm4/kCow0pG7BDom8iwQhWaO21Xj5Nw9yPeq1Kjwj+WOUn0qxvBWga+64SZZs018yQpX6NowLNJ6WdGuqv5VCutQuyT5CS8GfsEP7zcj+W2xG/fGx3AIzJcVH/FD+LrM82o51ZOEoWeBVlNGB5EcDvpllap5Yrsfc0DBhDopRMUG1+wJrqVaoGfwk+k+txI4r1sUV6am0dUHcih+o/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WivgsLMvz4O78BXePpMJHcH32FjfjwpJqvql3OKi70I=;
 b=Ai9yl2NmqLV/MwAUoYoHk+PgwwMGN2Shciu90hKXHQ2Tr+JXeYlA9nhk/tbVeNSXxTN2CvkEOmUDtOuEXQTowvo6PfEldS0Mu2DfE9wT0NMgJ8XYDnFflOdSsp/WjTk9Zxx7HV67xXewsS3JwZtvCKa55ZGO59a9LQwuuCsrQ/Q=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pvh: print dom0 memory map
Date: Mon, 24 Jan 2022 16:51:41 +0100
Message-ID: <20220124155141.37495-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0024.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31afc61f-f0bd-4416-b980-08d9df5170f2
X-MS-TrafficTypeDiagnostic: BYAPR03MB3896:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB3896B8FE52B590ED7B9A72348F5E9@BYAPR03MB3896.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKskrtpOtl4M9MLWM1HbmbehztyVdlgsVmZVgnwcBnObWlMjsi4g3IQ2lsAqonkloRGCiCLBtGQt6CRoXqHEXtVA9H/LLd4GrDMiw7W3qsk+sP+Nnl9b2qllqriKViF82A3hNL98O/2VLtzOEM0w9oBvEFyZB7vPfSTHlEf9BoZw1azzM3jjRQCON81nIwkf2XThRfoaWTfWArK2I76wFYoyNS3uWQEku+ZF3Sah16ECwwagRi3k8vn6SXiROoDtCERD493Al9S37NQix1wptYPawsE16O4Jn2mJp3VE03KQ30MKhUHZo+vSqR8DqWGzrGyRr3ndcI/aEr9MMvcl+qZdm90cJzBxLzjbT6O3wrjrDa2mWaRKrX5aIla2sZOC8/mIjoOByJQyB56OB1C4oQScuSfOi+0PeU5ibKgDLz5R9rYR3ouZxt+3hX+c68qgvCrc3sKJhathytL8ROz9nsDKlw4MvroTttHwas9ArmTvjJ33QqAftvoz6zVDOiiOedsNwS0VUti/eziHQvEnINGbOQXStoYaPSEQ/W64u1lf2MfgPdjXG+3X92BRKVudHxwFj0yHnbTdvHEaBjSC7UeEzk0rrajpDLMpPaE4oIt7cnvjp5fcvpZpKwNh2i85DX4wqpdb31TXSBxDn7xQzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(2616005)(6512007)(6486002)(83380400001)(66556008)(6666004)(66476007)(316002)(4326008)(8936002)(66946007)(36756003)(1076003)(38100700002)(82960400001)(54906003)(5660300002)(6916009)(26005)(8676002)(86362001)(186003)(2906002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OC91RTZsY0dHY2swbm5HVzM2NDU4RGwveVVTU1NSbjZlYmU0eEpVM0t3a0c4?=
 =?utf-8?B?VTQvZmFYdG5NRFB0dnNKbjIvSUxPM2h6c2dSOG1kbXVrK2l1VCs3Y3Rid0J2?=
 =?utf-8?B?VFJNZDNFczh3RE13NElLWjNUdzRYdDBackZLd3g3R1NJWFVGWkE1Skwyc2d1?=
 =?utf-8?B?RmpSaUMxTHljcE5iTTJ1TkJrWXlpcG9oNE9GOE5HeHZqV0tEb29OYnYzakJn?=
 =?utf-8?B?RzNwS25iWXpvZGgvRGhwUm1mM2hEZlVqZ0JuaVZiL1U2VzhUUWhLcVBPVWRS?=
 =?utf-8?B?TWhyNXhSSzhtR21tTHZoZFQwOTI4eGZmSzB1TVhOaXFqcXNrdTUweXRLRmZY?=
 =?utf-8?B?bWxvZzZETHV6SHkrMEY1aWtZbUdWcUhRanRSZWpkZWM2ZEs2Q2tweEVzRHNJ?=
 =?utf-8?B?V21LSkh0NlZqNFZkNE1Cd01sbWk0ZW1MbDVuejVUd3IveFlheDN5R1pid0Vu?=
 =?utf-8?B?eFNUL25zdVlGcGg5dGx4V21BWGt5KzVCVURqTXpNRWFDdVJjNHZxNi9Qb2du?=
 =?utf-8?B?aGFNWGN3eDFIYlN3UUZOMncrbGVkUnJuSlJrVlhFUTJKeVJ0VGhSbVFKZWx4?=
 =?utf-8?B?NkJCWHJyTEE0OU1XQWtkZ2dIcGFWbnY1N0F0U1kyUnZQdzZZNjJOYjRwUDB6?=
 =?utf-8?B?R1FySXBJMktROGRtSHFXMFRyM3pYTVkybmxlY05kT0J4UnNxa3QrNGc4anVN?=
 =?utf-8?B?ODhuM01YSldIWXZIV2xUWHpaNmE5andjREZsK3J6NFdzbXhsNnE3ODd2SW80?=
 =?utf-8?B?MXVzejVwVFdyY1BZclZoeXdKRFJZRDlOOSthNmx3WVlQaE1HMDZmSXEvY1JZ?=
 =?utf-8?B?Q3UvSCthV2szbWIxSno1QkIxRC9HdlNqWFZuMFg1ZGFzOUlDZU1xMlh6R2Fu?=
 =?utf-8?B?WndhNVRtby9DQjhsTFlqbENpc3NORWhNS3ZsOFJLaFoxUW5uMUhwcW9Ga2E2?=
 =?utf-8?B?eWs1V0Qwd1dMQXJ2NmJMVVdnWU43T2FmTlIrUE52dFRSSmUwbDJNZWJyWW83?=
 =?utf-8?B?b2x4ajlSRlJXZU1XcUdkUEVnc3NlZEVKUFhyNndPdFdtN09ZRngrYkw0Z3Ux?=
 =?utf-8?B?OGdYN2VvaUNJcDJVaXh1V0krOWFNUkdhZEVQN21WTUQyQVRlNnIzVlg2QjNv?=
 =?utf-8?B?QWJPWEJERERDVWloMnZUazlhdGFIM0oxbDFqS0xvOGU3Sy9hblAyL2NWTDh1?=
 =?utf-8?B?dGtlTjlhRk0xV1RGRytJdGtMK2V2VlVYYk9PRGhacUpsU2Zyc1E0RTNsMGxQ?=
 =?utf-8?B?cUI4bHh4S0VjWkpFRlNmeDVNNUNsVTZGL1FBYWdBYm5uaTdpQ29lbElTaVJa?=
 =?utf-8?B?NU1BOEZCcGRmVStEMExINFdNRVNGYW91Z2M2Q0RZdHZZZXJIdTk0L3hEeWxm?=
 =?utf-8?B?OFNpN2hjNlB2ck1HTHV1VW8zOThzVTc0TDEyV1RLNUozeTIzRkp4S0dleDlw?=
 =?utf-8?B?Y1NPWG9lWjFNT1d3WU83d1RmeFZHVEVScWx2WUVuUFN4eU45UnRFNnduYjNw?=
 =?utf-8?B?dml5NSswWlYzTWZ5MWtQZlUxbmdMMS8wZGVZZUQ3dnNCZTlJMzhoZFlaejdD?=
 =?utf-8?B?Mjk0TjNDSDJaWktpTVBHK2FSMWxFb1Zwb1E2RWVuRkt6UzBJN1U4ais1M2Ux?=
 =?utf-8?B?eHRtalhMZThac2cwUGh4VnV6SGhyaGpna0VDMExKaWQxN0JPanpKRUQxMmtk?=
 =?utf-8?B?Rkdic3JPbnlyY3RRMUVGeVJ5Ujk1Nk1raW9iT2hUSTdsRUNlT09JWGxnQlJu?=
 =?utf-8?B?NFkvZHk0d3hsSThyaytxYTZVYnhGNGVUNzVtNXc0ZnBvelJTenA1YnhET05h?=
 =?utf-8?B?YWZlK3ZYUWFqM09sRFRtbE8vL0VXM3BHdVJCanRGeENTS2xTaG5Bd2JROUFO?=
 =?utf-8?B?d0xucm9VQzIwajIyNXErbTE0SmY5RmYxc016MzJLdDVSN2JHZkhRTmVHVHN0?=
 =?utf-8?B?V201VjBzcUtLZXRyN082RjZZMGFJSmxNYTU5SlhTVExBTlBKRkVlbHNwYnBi?=
 =?utf-8?B?UERCR0xLYTdMUkRDbUFDc2o0eFgrL1VMenFwY3k0dDBmd1Q2UjJKbkVHMk1M?=
 =?utf-8?B?NGFvK01CSksvQlVzY1I1R3A4ZzE5dnErVTVNMDVFVkpROG5aeFhCUWh2RUxw?=
 =?utf-8?B?T0c2aHlvdDFTeGpTWnd6MHgzelc0Z05sa2Q3MDBRMXlYZStzbGdDSS9mYTA4?=
 =?utf-8?Q?Xh1TcV8jbX72JuZZtIS62Y4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31afc61f-f0bd-4416-b980-08d9df5170f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 15:51:53.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOx6bDOMUXCigY38JPBzrKZHzRdibC3KQqRTCTHKSdtG3YfW5ym7CBezMRqoS87wNKH97FuVnUAEKT2M2duKVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3896
X-OriginatorOrg: citrix.com

I find it useful for debugging certain issues to have the memory map
dom0 is using, so print it when using `dom0=verbose` on the command
line.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/e820.c             | 2 +-
 xen/arch/x86/hvm/dom0_build.c   | 6 ++++++
 xen/arch/x86/include/asm/e820.h | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index aa602773bb..82e9ac46a0 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -88,7 +88,7 @@ static void __init add_memory_region(unsigned long long start,
     e820.nr_map++;
 }
 
-static void __init print_e820_memory_map(struct e820entry *map, unsigned int entries)
+void __init print_e820_memory_map(struct e820entry *map, unsigned int entries)
 {
     unsigned int i;
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 739bb8adb6..93ebe4f404 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1271,6 +1271,12 @@ int __init dom0_construct_pvh(struct domain *d, const module_t *image,
         return rc;
     }
 
+    if ( opt_dom0_verbose )
+    {
+        printk("Dom%u memory map:\n", d->domain_id);
+        print_e820_memory_map(d->arch.e820, d->arch.nr_e820);
+    }
+
     printk("WARNING: PVH is an experimental mode with limited functionality\n");
     return 0;
 }
diff --git a/xen/arch/x86/include/asm/e820.h b/xen/arch/x86/include/asm/e820.h
index 9d8f1ba960..7fcfde3b66 100644
--- a/xen/arch/x86/include/asm/e820.h
+++ b/xen/arch/x86/include/asm/e820.h
@@ -32,6 +32,7 @@ extern int e820_change_range_type(
 extern int e820_add_range(
     struct e820map *, uint64_t s, uint64_t e, uint32_t type);
 extern unsigned long init_e820(const char *, struct e820map *);
+extern void print_e820_memory_map(struct e820entry *map, unsigned int entries);
 extern struct e820map e820;
 extern struct e820map e820_raw;
 
-- 
2.34.1


