Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB5536FE15
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120609.228132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSz-0000s0-QI; Fri, 30 Apr 2021 15:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120609.228132; Fri, 30 Apr 2021 15:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSz-0000rE-M4; Fri, 30 Apr 2021 15:54:09 +0000
Received: by outflank-mailman (input) for mailman id 120609;
 Fri, 30 Apr 2021 15:54:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVSy-0000lG-1l
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:54:08 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8110f1c-f9fc-47bd-961a-05df22b7e5a6;
 Fri, 30 Apr 2021 15:54:07 +0000 (UTC)
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
X-Inumbo-ID: a8110f1c-f9fc-47bd-961a-05df22b7e5a6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=TQdtl7OR1654V6RadoMtlKC18LBsP9bJIIWv024exN8=;
  b=IZmi4eqfpG6mwFSPT9ZoWIQaanfuM4Ni6Kj7MAAxqt7+ksrKkkZS9+73
   usMpUequOFxsCJR4kMhWF38UEZ7Q5nnnZVx6+vofzHRifpYDPnVwviNgt
   bQuYF7SsVomsjl+A7X9qsaIqRrWK5FSapnH2oz4RO/GfqTQOyFRPgv3N9
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 18pnHwUAczDGT26EsQfJH/KotBR3rTuhXfzsOyzVhSXlY1jyinf3+fA0I24SRA7lLfcMIphpTf
 DjG8Y1WoUQ3BF9rL8TVeK1bEs/rYrzHH+cTFrJ/COY951CGcPK2rTD7k3sSMOa31JwJvR+fdab
 ZLXDbzdGUvsSJ7qP1qlAg9Nyha35px0kt18U2Bd1zCYXoSyHQiOyuVoYqT9zHTUP2JaZXT3NiT
 0hBQH+J+Xa3Cc2wkng9KG+hO6aG4Fs+I8w4I+iGaOqPqyKIkzPGnwDgiZP5IvlmWwZmefvBAPA
 lqY=
X-SBRS: 5.1
X-MesageID: 42930044
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:z/PZ865USRftBEWMlwPXwU+EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbTqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+Lpf+jvfMk4/rZgNDOg4/5GC1/E+VwZPZMzzd5BcRVDtT3awvmF
 KlryXV7riu2svLsyP0+HTU6/1t6b7c4/tFQPeBk80Ebgjr4zzYHrhJf52nkHQLrPq06FAs+e
 O80CsIG8ho8XveciWUjHLWqnHd+Q0j4XPj1lOU6EGLyaeSKUNYeqgx8L5xSRfX51Etu9txys
 twrh+knqFaEA/am2DF78XIPisa5nacm2YokuIYkhVkIO0jQYJWxLZvmH99IdMrGSL3750fC+
 9+DM3Qz+Y+SyLqU1np+kZo29CiRXI1A1OvRVUDoNWc13xskGl+1FZw/r1Rol4wsLYGD7VU7e
 XNNapl0JlIU88tdKp4QMMMW9G+BGDhSQ/FWVjib2jPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyU1iGM7zM4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHgzjsqbpekFCMGzYY
 fyBLtmR9vYaUf+E4dA2APzH7NIL2MFbcETstEnH32UpMbmLZDrq/z7fP7fKKGFK0dgZkrPRl
 84GBTjLsRJ6U6mHlXihgLKZn/rckvjubJ8eZKqu9Q7+cwoDMlhowIVgVO26oWgMjtZqJE7e0
 N4PffCmqO/rm+mwHbQ4wxSS11gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCARNjUcXMEk
 p6q05s8ay6a7ycrBpSSu6PAya/tT8+tXiKR5ATlumo/sH+YK41CZ4gRehWDgXEFxt8nC5ws2
 ddYAo4RkvSfwmey5mNvdgxPqXyZtN8iACkLYp/snTEr3iRoskpWz8mRTK0aNWWhgwvXjJQoV
 V0/8Yk8fy9sAfqDVF6rPUzMVVKZmjSJL5dFgyKaL9Zna3RdBhqQX2HgiGbjB8PanPnnn9i9F
 DJHGmxQ7XmE1BdsndX3uLR/FR4en60UmhwZnp52LcNX1juizJW66umd6Cz22yeZh8+2ekbKi
 jCeiZXCBhp3cqL2BmcnyuiGX0qyo41BPHUCK0uftjoqyqQAbzNsZtDM+5f/Z5jOtyrj/QCVv
 iHfRSJaBz/EOEk1mWu1z8YERgxjENht/zm2BfotjflmFE+BOffO1RgSfUwJcqG423tWvaP19
 FYgLsOzJyNG1S0TuTD76fdKwNnAFf0h0WdSukzs5Bava4ortJIbtLmeAqN8EsC5Qk0Kcf/qV
 gXT6t66o3QI4MHRb1nRwtpun4S0OmVJEQlsgbKEvYzUFEkgXjcJc6I6dPz2MwSK3zEgAPxPF
 WFmhcthMvtbm+m1bQADbg3LnkTQE8g6G569OfqTfycNCyaM8VC9kG9KHmzbft0T7WEA6wZql
 Jf78uTl+GaMwr+1wa4h0o2Hot+t0KmS9i1GgSCBKph9MG7I02Fhu+S2/GI5Q2HAQeTWgA/no
 1KdUsZc8RFhH0DteQMo1aPY52yhFkknVtY6SxgjXj31OGdkT/mIX0=
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="42930044"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9EKOUdCICyu4J85Frh4q+oWndFCFRm4/Jlx5A+gSBwbzF+sGZqNzeKwhx/tOOVszOVbk8pZtHq6+dthZ/bu2+v1dY/R1nEtD7AKM6PQsE5gOAprDNHbROD6Rr+35nbKvXEh/1iVspJ2bqKnXbxK07Nxkm8G5ACX88midt5Hxc4MgHTz/7it1lyEeKfHpy3ABgs2GmN9m2DItNZ77TWj79UR6qyoqyieQhmCspNb3sb2QAV+zogjc3Evie8c+QRmi4Jtt65+2r8fKggMveUj+ZvX57DxH3TQX+m8/ItYooT8W8KEy8/3YKF440zSsTzLrguEbme3ellJDYw3aKZzOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LhKndnVfulc+pPE8LZrgUCySKsih4Prcl9DAfyw9Zg=;
 b=Idra5N9U5bMRCe2p81Vp0EXtJ9dSRh4YIfNsGsgN+9oTN5NF1Ss/SEN0klvz9rq2Po3wHcevF0Z+U2g4cTSlF5N357EKQr3JVc68EXqTbpXvlyi+uK/k1xw1lhMPGvWmcfjud1WoLNTCk6xp+q/cooX+6WK4QfoRRGDszmJFGi1lqoqoj3S4YMLIEea8HjTSy9NnV8pPRKjN7pja0vbolmLF/XvaAKulW92X2X5+91+q67WTTUZN8blEf6AxlsXozLjE1ns3v8WnMnbYefc1izrPSujKCwD/gZccvDAKO+cjSP7od5BEvny5zxNfo7V2LlTNuZfX6UlOs6Xp5H40GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LhKndnVfulc+pPE8LZrgUCySKsih4Prcl9DAfyw9Zg=;
 b=HcGWS7t69i6xqBdruDRe2WbPB96yQWT/UwF8cWCt/GxlGCC5Ow9TDpD40IESIQBRwnVupRU3/svANhvfxIRSZtG0CD2E1VkxhEE7vNMOPJUzIuaQgYKGXTsWaBy7IX/T0aJkPjdJTW6zj1zEtqSzYahttNBtlyYWH9tHp2M+KXc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 05/13] libs/guest: allow updating a cpu policy MSR data
Date: Fri, 30 Apr 2021 17:52:03 +0200
Message-ID: <20210430155211.3709-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430155211.3709-1-roger.pau@citrix.com>
References: <20210430155211.3709-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::35) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e07b9057-25e3-409f-c606-08d90bf02dfc
X-MS-TrafficTypeDiagnostic: DM6PR03MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB42185369435A8B1D697BE3428F5E9@DM6PR03MB4218.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Luk8HRbr+JX7eyJZHqEZYqVy+wXNtC34+TN2WUO8uFaPBPGXFI3Y98hPzpWPgGvynIWpMyAaPtqAz2p2k6LTOWDT3R2cOL7Vgw6slX9bMmIYwjcO18oBbqio0YcBd8fz3mUCJKc4nsBXGKrIE/EXB/EFUQU+jE9c3SkjOSsjc8byHoSSS24oHrnat/TSNPBzMFLLwqiTY4m1AbvorHzqEhRoPeHbG/0TKps1hf2o1sO7JAYtr3FsKdCLPIkdrMb4ElsCIRAImAV4CR5owlpwsjeeYxO8WmfzI/emxdeDmpk1bZlKJr4jq+0suh6mVupebw3j4Bh9b9ZH2hVUtSVU7JKpQMsCb1/pJK1PRopOqYV7kL5CRNdPikWyGqdWQN5Buz0dqxut8+IIXcbV+KrRIAgJAoTxwad2Jv5aaazb9+XqAK9OJDqnHQoisBtUpIK3XQdAzgeSY9PUZC8G9rpHcXJIVk0Nu5HPF6xbOWtVzmJB8yg2zyAXO0Bj/nTDwpQs/IMZyVvtuBw3bfBIMhexbdY7OnYld/7s52D0KNBPq/ZUB2zWW9XuzKpKO7ELl2We4G8Cr2rS4Vmbo5PT7qKzUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(478600001)(54906003)(36756003)(316002)(186003)(26005)(66476007)(6496006)(4326008)(83380400001)(1076003)(2616005)(66556008)(2906002)(8936002)(66946007)(38100700002)(6916009)(6486002)(956004)(5660300002)(16526019)(8676002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGlvdTg4ZTZ0YXRnaVVHR0tZbStlT2VSVmZGOUJPZ1ZlYWMzaStLOHVXdmwr?=
 =?utf-8?B?Z0R2SmxJa0lZa0tveDl6Q3BidWprT2pUWk9IcTBEUmRpWmozclEwNmxYM21H?=
 =?utf-8?B?bGFqa0FDanFKRC90M2MxY1lQUE9BTTFTSDBLcnhDY0kzWVBDaDVIUFdVVmRP?=
 =?utf-8?B?QlRxcnRucE8vYkNNeFdhaWdySzlYUFIyMzluOGE5aWd4Uk5aQlFRT0dTV3E5?=
 =?utf-8?B?SzFGTUpONEZwQVhVL0VoNFJHTmd3SFExdGQrZVp5S2xOQXlXR3ZCM3lqNC96?=
 =?utf-8?B?ZllwVklKR3VKSDR2azlicG5HSDNyTWNqZGpDL3B1UEtnR2U2eldFZmFSTjVr?=
 =?utf-8?B?YXplTVNiWmF5d1hFMm8zYitiQm5tN1htU1pGV3h3RnA1UnNTdExFQ0dSbnhN?=
 =?utf-8?B?Y2JXVDN0OG92NW1YQmgwNFVobXRjeDJMblFvZzIwNnJod2twR0ZUL0pEcWtI?=
 =?utf-8?B?VlQxVkMrblc3Vy9WYUpZbnZHOHF0L05EZk1QZTZyZ282ZS8ydmZtcEFSNWhU?=
 =?utf-8?B?Y2M4SkZhczVxSSs5cFdJVDFuaFFPT20zSE4xYWVDb0V6UWFkUG5LdTVzVkNP?=
 =?utf-8?B?WlhMaksrQmV5NDFueUx0YmRsR0lUQVFkTzErb2RXN3ZPRHpWdmpkY2k2bGFp?=
 =?utf-8?B?b2FudGFQL2RTSFZ4dkdPUVhreFdzT1dEeXZubWViYXZtSDBqV0pXSmppRzhL?=
 =?utf-8?B?QzlDWm9xc21WS2RINnhCMng3T01ZdHdnMjI2dk5kM2lEZUNCN2xYK09MYmdL?=
 =?utf-8?B?S3l4MkFwZlY5SW1iRktrWERXakF6bmUzdHpBYlc4bnpNM3I0Z0EzVHUyRVpy?=
 =?utf-8?B?ZUdhYjlQVWxLaEg0aVJHaWhWalRZaDE3RmJHc1JpQ01vUW9ldEVlalNHYjBu?=
 =?utf-8?B?bTdsMit1bnpGREpyNjBNSHN2dTF0OTdwcUZ3b3FNaUI4YTNDb2hNV09xSFlW?=
 =?utf-8?B?OUJuUVNlYVhmaS91c0xWTzRjSFlLRmRkeUhpelYxcitvS3F1enR2dTYxeitZ?=
 =?utf-8?B?blNnSENPcUliVUExOTJ0QU1iYnRZUC8xK0EvV0VRTGhGRXI4alA0UzBYZEZv?=
 =?utf-8?B?V3JyQzY1S05TMVEvbTlkdXRCZEl2NWlTZm9LZDQ4UnhGRjhwWTlGTXhBcWpn?=
 =?utf-8?B?MU1FR0pXeXg4VFZIb1BBQ0QyNjFtSlZUMHlRS2V4cFZVN252cklldjZFQ3hs?=
 =?utf-8?B?MXRhMFNwVGhaenJaY3ZvN25wWWtvOU5yK0xOVytjU3U1TWFhMlRKTGlEL1l1?=
 =?utf-8?B?Tng2OVlZV1JEUThFR05CdllJUGtQaTdOaElxNXFMTUoyOEtRQ3VnM3JiQmF6?=
 =?utf-8?B?NWJQY3JoclZuUDNYVEpmb3dwaTVxQ3dwMFZoaXdUcERNVTVxWnpoTzBVY2N6?=
 =?utf-8?B?bDBSaXpyaWw4c0JNaWxwOEY2aEJjM2REQlgrUnVJR2twcnpHYTN1czlCelVP?=
 =?utf-8?B?dm5Rb0ZtZUk4amtwbmg5MVZKQ2puTGhRU20ySUFFK09rUUtobGcwdHMxOWtL?=
 =?utf-8?B?b0ZBQ1E3eGZyUDJwbityVlNRWWtkMGJydFBtN2MzSWt4djU0dzJjd1JlWWVD?=
 =?utf-8?B?cnYvZ2M2UlVocnJSQ0lrejl1cDdlR2NsZ3k0dHRNeEJrYmlIOWJWd0J1d2xz?=
 =?utf-8?B?SThyYmdZbUpPOUJ0Vk5MWXYwaVJFTktraldOczdIcHJ3WlBGVGVrejRzVVUw?=
 =?utf-8?B?ZDlxRERRTmozb3FIM3Rzb1pnQkp2T3FvVk9XMUdRb3hYQlFLemtUQXpQdnNP?=
 =?utf-8?Q?DQiiMKUoXaCD/fx39wR9OLLQYzyV/kZo1CtZBJ+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e07b9057-25e3-409f-c606-08d90bf02dfc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:54:04.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKvG0EtRl6nnrIPXeYoxuT50vBcRJNL2tUMGYDILDUUEf0p3YE8RVo7A8oNMmMgVz6Z2C9n3kxzDhy4XhipS6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4218
X-OriginatorOrg: citrix.com

Introduce a helper to update the MSR policy using an array of
xen_msr_entry_t entries. Note the MSRs present in the input
xen_msr_entry_t array will replace any existing entries on the
policy.

No user of the interface introduced on this patch.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Drop logic to update entries manually.
 - Only print failure message if err_msr != -1.
---
 tools/include/xenctrl.h         |  2 ++
 tools/libs/guest/xg_cpuid_x86.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 49f919f16a7..9a6d1b126d8 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2616,6 +2616,8 @@ int xc_cpu_policy_get_msr(xc_interface *xch, const xc_cpu_policy_t policy,
 int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
                                const xen_cpuid_leaf_t *leaves,
                                uint32_t nr);
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
+                              const xen_msr_entry_t *msrs, uint32_t nr);
 
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index a38e75f8fb1..37e55279ffe 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -912,3 +912,21 @@ int xc_cpu_policy_update_cpuid(xc_interface *xch, xc_cpu_policy_t policy,
 
     return rc;
 }
+
+int xc_cpu_policy_update_msrs(xc_interface *xch, xc_cpu_policy_t policy,
+                              const xen_msr_entry_t *msrs, uint32_t nr)
+{
+    unsigned int err_msr = -1;
+    int rc = x86_msr_copy_from_buffer(&policy->msr, msrs, nr, &err_msr);
+
+    if ( rc )
+    {
+        if ( err_msr != -1 )
+            ERROR("Failed to deserialise MSRS (err index %#x) (%d = %s)",
+                  err_msr, -rc, strerror(-rc));
+        errno = -rc;
+        rc = -1;
+    }
+
+    return rc;
+}
-- 
2.31.1


