Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77341345B8A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 11:01:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100569.191726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdqS-0008Fq-4a; Tue, 23 Mar 2021 10:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100569.191726; Tue, 23 Mar 2021 10:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOdqS-0008FN-0a; Tue, 23 Mar 2021 10:01:04 +0000
Received: by outflank-mailman (input) for mailman id 100569;
 Tue, 23 Mar 2021 10:01:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMG=IV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lOdqQ-0008Eu-VT
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 10:01:03 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fdba55b-bf6a-4b6c-b003-c71aaa53e824;
 Tue, 23 Mar 2021 10:01:01 +0000 (UTC)
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
X-Inumbo-ID: 8fdba55b-bf6a-4b6c-b003-c71aaa53e824
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616493661;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7KO7gTVsvFjrD8UnwpRq3qnvKwX9RIxUIWr7RkzivD8=;
  b=A62HGMb2GRBWkBvEyv/2MRk1qpB4YGPbKFwCqau7WG+ru2pBlVVvJeXS
   4j3JFHsx2TG3FVBbX4qBL8xUvSW2S9+0B6qXVZW9zZHF5k45V5DBYdi6c
   AUDrI+JfS7QsAybxfgQPeRjv2v+5Evz24VgmY6KhSYWPwki54FNT5MUC6
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: v8Ha3slj7l1Z9rADSGg3Cw482nNlTGw+xfgmtp2iIoRGwqqG3OKJavETxjgxQTn4JX1I8fEDo+
 YpuBBBs7MmBfYu7khPStmOa4G9yFSKHHoytEgYTnZ7INKBAu5M/MwzMSAQ4hNPn+fzMQbr4biZ
 sVFGpGK0DmnJhwVlX7adOnBM63ndHN4eu6ch2BbgYxqLAwkUypyqrBRhLTXA/9zyRMXLvxpLLq
 TbLveF989wPst8h+TUEqyYgsRRslEt968TGKC7vSs9stwGsbTHeZ0xvTfzjhkjpQ3gGAMTJstu
 xlk=
X-SBRS: 5.2
X-MesageID: 40261280
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:PfEHMqGCEqtD0lZupLqFDpTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLT1CQYsI1XYfNi+wFEpqSA5aQacjHJ
 2H6cZd4xamc3IbbsO0b0N1ItTrjdvNiZ7gfFo6FwcqgTP+9w+AxZzbN1yj3hkYWy5S2rtKyw
 n4uiHw+6nLiYDD9jbyzGnWhq4m/efJ7vtmKIiyhtMOKjPq4zzYFbhJf7GZpjg6rKWOxT8R4a
 HxiiwtNchy9H/dF1vdyXCGtniCoVRemEPK8lOEnWDl5fXwWTNSMbs+uatibhDb50A81esMtp
 5j4mTxjesyMTrw2A7559TOSihwkFu1rXcIgYco/gNieLpbR7lLoYMF+kRJVL8GASLh8YgiVN
 JjFcfG+Z9tAB6nRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTuHxi1UMXyOEWg39ozuNwd7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWO7Oz3cZeA6EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCPeJwIZA/nn2MSuAdAWo7vsby4lyu7X6SrauGzaEUkoSn8yppOhaLdbcX9
 q1JZJKE97uJWbjAu9yrk7DcqgXDUNbfNweu949VV7LiNnMMJfWuuvSd+uWBLeFK0dnZkrPRl
 84GBTjLsRJ6U6mHlXihgLKZn/rckvjubZ5EK3Q+fkv2JEAX7c89zQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLu43h2PAFeSmJY+q/pXX8PhQJiCTK6TZ8z//GkPUxC1nqOIRFyC+nMFh
 REmlhx8aWra7qKxS4jDNqjGnmAj2QaoU+LS5t0oNzC2e7VPrcDSro2Uq14EgvGUzZvnxxxlW
 tFYAgYAnPEGijWkqWjhpwMDOT5f91x6T3bZfJ8mDb6jwGxtMsvTnwUU3qLXdSMiQgjfTZSm2
 Z86rQSmraGhDapJ1YumehQCiw9VE2nRJZ9SCiVboRdnb7mPDt9SmqHnhS2oRA+cGiCzTRbuk
 XRaQmvPd3bCFtUvX5Vlpvw+FRvb2OHYgZbcXZhq7BwEmzAp1d+2eKGfbCIzmOUc1cOq9ttdw
 3tUH83GEdD1tq33BmalHK+Dn0g3IwpJfGYI7I5cb3fs0ndX7GgpOUjJbtz85lkPty17bNOfu
 KbZgOPLDT3T8kuwBeYo345OC9y7Fko+MmYrSHN3Syd5joYB/GXHXFNA5c8CPuY53L/R/mJ3I
 5i5OhF9NeYAyHUUJq+1arTbzR/MRvdrm69cvEwpflvzNAPnYo2O6OebCDB235G1igvNcvYlE
 sRR6Jg/bDKU7UfC/A6SmZ89lotmM/nFjpRjiXGRss/d0oqlXnVIpeg5KfJs6MmBiS61UDNEG
 ja1y1W5PHeWSSfkZYcFqIrOGxTLGwx8m5r8u/HV4reDmyRBqt+1Wv/Fn+2a7lGTqeZXZ0Wsx
 Zh+tmN29atSBCQ4nGngRJLZoRU82imRsuuAAWDXc5wmubKRWiks++N+868jDD+VD2hTV8X7L
 c1M3AtUg==
X-IronPort-AV: E=Sophos;i="5.81,271,1610427600"; 
   d="scan'208";a="40261280"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksIQ7JeM1Hfh/GKl3D4Wu7VUEA48MYckKlPo6DM/ERI8BUhrHIPI0nHQOLOYdB6H7oigssEcA9AbKlkbzw2pTFemFHDPdglYGdR+U2+rLJm76HcokgJQLXq2m0sIIVLfB7aMLBofWvba4vV33CX0XhO9hx6g0Krji9K6aHimZbuVtB4AR8+nFz1v5WBxqA7L+y7jHR2gOonpv7igJwaMTzPcIK9IJWdb7u1r13TcEy5uRor1AOBGGAS7qgYC4Vy6HH8vt6El5jKxuVoyRnfW7pQUrngJrGliBtT3BmcV2uWDnfmacguGzFqVBJ98XBCTAAlXFwDv5pNiNDbHKyWltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI7Y7A0OHymM1N3AAaa+CIA8yVMw6gOJwUG3C50vFTg=;
 b=ho+xaKbrYGwgFkICAp6aMq4ole1Y53uMJgaxSn6R6/ahLZviov6o1Ey3wZ4gO7vQmnfjJX3JHIKqTNu20K+u1lFXRKmzG6ska0lWRlhqScsWdrCByTF05Inelc9Slp7U0sSnnwq8S4dHtIADqTu4360imm2WWa2F/AxMWrFr0rSii/JF+ONVAS79s4MT/mGl0GnDCxWgmv/7w2AKEOR0cJ+L5qKvE0kRb2K1gjKmHzXW6zX7nsm8mP9ipnxCGs7lR3ghIiTHexVUTIHUIiS3iC3xqgahS2K8ZalOJoJDFX7wrgNTXPhkfzr5rkxTxLWlfTxcHzY6R6kxJ1p1PIw9Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI7Y7A0OHymM1N3AAaa+CIA8yVMw6gOJwUG3C50vFTg=;
 b=A0LRBjVX3ybEyWYylLw+NFrGBGLQrIaitPigxBh1AWyQdjKvWkJOXlz47+B6iNQ5g6+gX50Xt+rMILbHu5q4TMd90csnMocC0aIXUHSzwIPKgmBO2QGizjQchbr4Z9KyxfvaKjV1IdG5ODh52aPdaWKHWl0son55/bnkrU1qMB8=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 14/21] libs/guest: introduce helper to check cpu policy compatibility
Date: Tue, 23 Mar 2021 10:58:42 +0100
Message-ID: <20210323095849.37858-15-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323095849.37858-1-roger.pau@citrix.com>
References: <20210323095849.37858-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0094.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 445ddd65-bf74-4793-de8b-08d8ede28e03
X-MS-TrafficTypeDiagnostic: DM6PR03MB4969:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB496997952D017E1A172A78C38F649@DM6PR03MB4969.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IEryU2nKESj207JzbEOhiqGz23Gfct2ZWjBPAD0Fu4nJC/DAOw0ebr5RhvfoVYFGJl3IDOiloSNQMbtVxdFYbZCRHx5ys11YR4PmTXLXYe+2Ai25tgGrRpDypn4GSqxEx20ohYuSIOqqsbLoowW/VBQ1jXXHSkMEoS+U7/HZISra3QWT4GE7g+NOIPFPySCOotYoLYJfeCwBxmnk+UnyA76gsxs7hKb0J5vLb936CXMoaSTYPswrI+ylAL9hLErxXmFQ+wqDLGke0pPoMgLdKJFwV9r6P5up+hpLARh8LWOfkXCwHMbQ474Rv++5v3x6I50GJZFaoBHsNqWBzw3/1rftlsMwFKe1h8vAn5NIMPP5LXiMSNObNIhXGkPNo8hDFS3sfmy2fvRLBY7+8vRAxtWSZAURDQDKZJMwGjlichcWrPw4Ph7pncQOix6Vx4YIOj7Vd8MbVUSOelT6huhVwHpYMoPStPeJU7CdFWakDGPDYupCGvVi7ypC9NteYYvpaAKurJIDluq2U4OIZyAXu6dIe4sgIVDEWVQWXAOoXRZLNIvRHa3j8aVEphD00a0FemEIvnwUiFypORB1iZ3Vo18I3OotNErORnlbc8ZOnYulaTETK40ZPCvtJyKplwcG8ZOKQbS4MjpqvtNOBb31JA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(54906003)(36756003)(2616005)(316002)(26005)(6486002)(956004)(16526019)(186003)(2906002)(86362001)(66556008)(6916009)(478600001)(5660300002)(8936002)(6496006)(38100700001)(83380400001)(6666004)(66476007)(8676002)(66946007)(1076003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QTJSRnR1b0pOVzdTL01iRVAva0FPb1R3K1Q1bGNneGF3ZE5sMlJHMWJTSzFR?=
 =?utf-8?B?TFF5MXU4QmVqY3NOOVVkcTU2cHZETmVIakZ0azVmOUY2bUhrTUxNek9YemUz?=
 =?utf-8?B?Q3RScVNIYkp3Vi9XdXNNeU9ESDhPRFNPbjFaSlhBL3JJTmhOSUVEUE01TWpU?=
 =?utf-8?B?UEkrQ0h2OXB6UVRJVzl2Zk14ek9KWjRXWml2S0V4b1hRdTl5aUhjZTU2NGo1?=
 =?utf-8?B?bWdsby90NzRvRHQzVVE5K2JPSHN4VFpKTUM1VVFwZVBwbjU0QlFheDlpMlp5?=
 =?utf-8?B?UTBtc2tRbUJZMG9ucVhxa0dObVYzenl5eWwwZjkrbmpJL2pHKzMySG1TTEt0?=
 =?utf-8?B?VmZTMk9zKzZadC9MNE5sZGlYWlZISUdGM2I1cmJOVmJuOGdHc09sUCthNSs1?=
 =?utf-8?B?dzBkU2p3Z2NBNFkvMXczaFV5WHJ1Mm0rVVpNUnlFcXphMjQ0Y2JId01RNHh2?=
 =?utf-8?B?Y2tRaEJJSUFWUU5NSnhXUmw3WUN0VE96bDJiLzB2S0hsVjZHTyt3a2V5NXM1?=
 =?utf-8?B?aWtBcytYaUEra29laEJpNFJ4bE4yVno1MFR2MW9oMElXY3hHOEl1UnJPc3Ew?=
 =?utf-8?B?L0YwQzRybTlVdjQ4OHhNNHpVTjFibHlnS1JTLzRWOTlHNzNVRUtxY3EwbW1w?=
 =?utf-8?B?UEdvMkdSNTdwcklLZ3ZJNFpPWHVjMkExSnBOUzZYL0hoL0JFaVdZWWVXem1Z?=
 =?utf-8?B?NnlOT2cwdDFpNFdncWJUMUNtdlZJUEdURjlZVlNCeE9UamdYRmczaTUybGkv?=
 =?utf-8?B?bnNqZUZ6cmNOb0x1cmdGVkh4T3NQTVRSZWVnRFdVaHRmOXlxOHh2cmdDZk9k?=
 =?utf-8?B?ZFBBTjBwVFNFa1BlSm0rTzJKYlg1OUgvT1lqZWYvY3JkbnFIZnlqU0Z6V1pa?=
 =?utf-8?B?Z1IzaXA0T1FQUjNTUTFtMzQwTWRNYVhkTUZaYk42N0wxcmJyOHJaVGRRWWU1?=
 =?utf-8?B?aVltckdaUGpWSmUrcWZGQUVnWDF5K24rdk9iK2FFZlpvZFBqREE3dEhGNkNE?=
 =?utf-8?B?bjhqZ3dCUzNIazVkMFBKVjdUSkN0Q2RPczVZQml4TGYxczJ4YUFlZGwrdmZD?=
 =?utf-8?B?VUFFRlBkK3BMamRqMDlsbFZoSHZkWDY5ZzBHR0g0MTZmN3dPdUlIem5XNGJJ?=
 =?utf-8?B?YSthQlRPWjFKS2k4UmlvRXBpUzFaOUdicEM3ZE54elY0cjJLU0h1cXFyaDJx?=
 =?utf-8?B?MmxkdnE1K2VvcjUxSGppeHd5NzU5VTRhaUpNVTRFaVM2TVJqNUhzcStQNHZi?=
 =?utf-8?B?cHlXMVlnd005Y040a1VEdVpyZlV4bmNFWkNNTTBkbUwzd3pOYlFJcy80YjJk?=
 =?utf-8?B?eXJueUs1VEVhakZvckFJM2c3WG1pOTNwaFp1OGFLc0hjOGp5ZjNZTmwwM2xN?=
 =?utf-8?B?dHFSWTVzMGRQOTErbjdUSFp4R2lhbXEyMmcvQWJZRTUzbjM3d3R3dytaMmlZ?=
 =?utf-8?B?TUNmVHpWbWJSRWhrUU9jRlNuckZ6K1c0eUc1c0RzVVhvRFlHVTI1aU9UUmpy?=
 =?utf-8?B?QjJEem5vbU1WRi95WEhycDVQaCtvbmY4dFFoWDJ0a1dBMzRqNUtGeDNlQ016?=
 =?utf-8?B?eVpKV1hUTXpMUXRPWVVjMFJRS09IY2VRU0Z6QnNveU94RW5qYU9URXhvdXhS?=
 =?utf-8?B?akNQcmdxTGc0amxHQllpRDBHbjEyMW0wNklQcEFRbVdqeEV2ZmJ6TWkwRmJX?=
 =?utf-8?B?SWNvRkJmZXp0Yk1RMHZyZStHMHVDSC82SE8rd09UZDNUcmlEUlpTd3lhOWxi?=
 =?utf-8?Q?JixO7cI7QuTRS4PKEc9W/ErPxLsUKEJRXQhg5Ko?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 445ddd65-bf74-4793-de8b-08d8ede28e03
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 10:00:57.5149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkCLT83fMmUG3tUHZ8eJG42fY6MbZPwGUsVsRi/rX2iiq7xtq5G2E0dJ9oEWZVzSIsGLNhjusTYg5wMw2envNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4969
X-OriginatorOrg: citrix.com

Such helpers is just a wrapper to the existing
x86_cpu_policies_are_compatible function. This requires building
policy.c from libx86 on user land also.

No user of the interface introduced.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xenctrl.h         |  4 ++++
 tools/libs/guest/Makefile       |  2 +-
 tools/libs/guest/xg_cpuid_x86.c | 17 +++++++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 164a287b367..165beff330f 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2619,6 +2619,10 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
 int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
                               const xen_msr_entry_t *msrs, uint32_t nr);
 
+/* Compatibility calculations. */
+bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t p1,
+                                 const xc_cpu_policy_t p2);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 604e1695d6a..6d2a1d5bbc0 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -40,7 +40,7 @@ $(patsubst %.c,%.opic,$(ELF_SRCS-y)): CFLAGS += -Wno-pointer-sign
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
 vpath %.c ../../../xen/lib/x86
 
-SRCS-y                 += cpuid.c msr.c
+SRCS-y                 += cpuid.c msr.c policy.c
 endif
 
 # new domain builder
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index f7b662f31aa..30ea02a0f31 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -1098,3 +1098,20 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
     return rc;
 
 }
+
+bool xc_cpu_policy_is_compatible(xc_interface *xch, const xc_cpu_policy_t p1,
+                                 const xc_cpu_policy_t p2)
+{
+    struct cpu_policy_errors err;
+    int rc = x86_cpu_policies_are_compatible(p1, p2, &err);
+
+    if ( !rc )
+        return true;
+
+    if ( err.leaf != -1 )
+        ERROR("Leaf %#x subleaf %#x is not compatible", err.leaf, err.subleaf);
+    if ( err.msr != -1 )
+        ERROR("MSR index %#x is not compatible", err.msr);
+
+    return false;
+}
-- 
2.30.1


