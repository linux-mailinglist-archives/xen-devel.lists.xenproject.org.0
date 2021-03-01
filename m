Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC9F327B50
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 10:57:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91399.172791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfIw-0002TT-Go; Mon, 01 Mar 2021 09:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91399.172791; Mon, 01 Mar 2021 09:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGfIw-0002T7-Di; Mon, 01 Mar 2021 09:57:30 +0000
Received: by outflank-mailman (input) for mailman id 91399;
 Mon, 01 Mar 2021 09:57:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGfIu-0002T2-S9
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 09:57:28 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3628850e-6187-4bac-a803-5e14ec134fc4;
 Mon, 01 Mar 2021 09:57:27 +0000 (UTC)
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
X-Inumbo-ID: 3628850e-6187-4bac-a803-5e14ec134fc4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614592647;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=461i7/kBtwoY05/rEnMeopCmAP2JXdWB8cJ7lyzKu8g=;
  b=g+d6TTmS/FzJgSIA/1pxARxAHNo2Tj0z4wSFs8as0ZsmBBicZ13UCHf7
   Fh3NRjed3yEgbExRaQLeku/H/0rgC9+a9U3MHa1avDPUNQ9pxTX2xZjAK
   eyfXPdGktgEFNvNHPD0aeuhjnI1IyJRV/oPh0UHvQeWS+aw50urXFU1HV
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Bbo9kRyiHSoJtM++yqRGYyUuGHmjW4LC7vXMRLXCeX1GL4256elhCpvcOz9BQajiaTKUN8hUhv
 DLzYH198gzkRZtw7Z0q22h7bBhC08x1VhVE66yLzO0s3aSErDZfE7n9+8MCLq53E6bKpSA3hoj
 8UPEfn257FVU54D3QLH1G+aSdmPw/XPTI9v1KDklj1GrTDzHz7I4OuDGrg5Z1YHppPoVluQdag
 Dh1ZplPtv26Ts6d0whtwxiPIXlZKQ+5A2RL08QvIpWPflur2uocgXr3qZN32/2qDb0vsvihjXo
 3jw=
X-SBRS: 5.2
X-MesageID: 38411180
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="38411180"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deStf3yh4mMNYcUalizCX3qAJYOBeqVZ85x/sqbLZln8hMNu5Q6JTSPUpy9+PFvU9dRXLJWepY/UvTRc4ER4b9PDt3+WWPWOYt9+NwRo8zmRDriMCtjdjmy/6IqVSmc/kuXR7yVawVyUnGiKOdxCaWyl2oHOeYFBJE6IKS/ATQBiVhLVxh1iDrzFzeESUevT/ZjoLJGX/3GJQdobXQCpb1ZQrdeoY5ibra4R6xaxScZS5MkgwZsut7KV2ad1dIiUpUVspZ/knsd3SkSwCM1Dpy0trWeoPu7z3Lt7f1dAPA0feHECPT8Tg0wscwWWUGNhlOkQuvCyy5umHiNf5EfsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4RoEXHGAbtddftviS5x58yhBnv9NpZ0rEaiIIfG260=;
 b=i1H44w0JBu9EcABKIJNfLIrhXS+n7Fbbq7o0q9Z12VJRBpI6Mj+ME5hkFwa55MFNHLHikAVUluOsHY5BWPxdgXyhP5jnFAhDNVgmewENBGNW9BRW3uwqukWHD0i/W0kFVqeaKLajZCXwBFFbFGVzBH/iLfsgaW/VRBTK/OqIHJG3xTRUD36U4YAYshi/Psapp8zRE/YMBIOLjc5fj6UlnDwPmQv4+haGub5/4sgmoqgAURfX/qFk+FUqCo9+K36l12YPUJle+vBOfiTWoJ+7Yu/I7au0/nTl8PMd616KhtpxlQOYeCi80l4JA2IIzk43kv2EFi9OoI4mF4IuwFBulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4RoEXHGAbtddftviS5x58yhBnv9NpZ0rEaiIIfG260=;
 b=uW87zMakjyNskJ2G7PupJWZjxSj+gnJsaT955kK8O65g2g73mGNh5PSVsxOrge16YUSSv4aFqJ5IyYXYEmhKUnIu70vRa4l6d4MN6OKjMVX+R5pycpO5OUcSN9j8K2wo7XsGSGf/KhxKlzH+YCt51ntS671rV+Am0ZInWNFpIaQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.15] automation/alpine: add g++ to the list of build depends
Date: Mon,  1 Mar 2021 10:57:14 +0100
Message-ID: <20210301095714.68335-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0046.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::34)
 To SA0PR03MB5610.namprd03.prod.outlook.com (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95232a16-30ab-401d-a288-08d8dc986871
X-MS-TrafficTypeDiagnostic: SN2PR03MB2416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB2416D93930EE0CDC780FA0788F9A9@SN2PR03MB2416.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: brJc7XQGugJ/z5FUas8Y0YVN5oLbUUAB5wuZLSNFVXere4LpGB2sXJ1wdzJT0plTbDPPVsC44H2ChJ7myWTjuKmcTd0X4Vb5ie+quOcV+CIk8T+1kWqQXmv8gThEPatPQk8DPBD4jkBYqES13xXaPqkAD/IOZcUV2hJylgDCDMaW25KN52QmT6+76Q63PIiywPAdbTCkqq3penwrizoXKTO1QccQ5xje+SquGf5w9WH1tFRa2b+Yecly345Rw2poeGT4I6WdGCN7jWLl7vGBuKs7dx4OBYCfmJtVL0eiVJjWRSnbKW9pRghLWqcGEfCx1bsDy7GwG2Uag/0QuooMzbwL4Jgj7HDbZfuJXIr3krA7jT49OdjNifo0CVUUPgdat1Pu1S8goK4890qBy91KYU5Cb/dQw0ZBrHwIC83EtNhwaLL2urWy/prLY2Zcm1QW98JkSxOqOvTz+Vmnq0NZivL3uk/4pO6YZeFag8jRikeQcT4XBNN3+09e8yZYY/85dxDK6WDy9oxVlQdNbw/ZmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39850400004)(366004)(6496006)(83380400001)(6486002)(2616005)(4326008)(6916009)(316002)(478600001)(54906003)(8936002)(66476007)(8676002)(36756003)(86362001)(66556008)(1076003)(956004)(6666004)(5660300002)(186003)(16526019)(66946007)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2doRWZ1bys2aXRZRjBmK1d0NnhXUU52MlcrRHRkeHZJMHVKZkptamlSWG11?=
 =?utf-8?B?UkhXRHFtSmZteStldmQxYW5mKzJRVUo1bkNPdk41ektWalBHaWtxRExhUklJ?=
 =?utf-8?B?aWduVFJZU0dIZ3FnaXF0RGdGWmdSbyt2dGM4ZkZsZ0JTUW1VTnBYcEFZZEVF?=
 =?utf-8?B?NFFtbG9LdVRCYlVqU1FOd1NMYVBsbzVQTU5Ibk9VY2NocElGbS9aSmRhNjZT?=
 =?utf-8?B?ZVY4R2JWWW1kcUhvSi85cTVVWlVLRUdYVjN1Um1VUzZrdzRReXZHZjcvOU5G?=
 =?utf-8?B?QklOZzh3MzAycVdGZmhwY1JBVU9weExRY1p2b3dYeHl1UU9rcHRYeTQzUEZ5?=
 =?utf-8?B?K014dU5QU1JCWE4vNWwrN1h0bzV2c3BDZzZPWTJxaHhEay85OVZRaEJvWGhV?=
 =?utf-8?B?YVhXQTdXZUh2T0pCSnZjTnF4TEY4YVMzS2R0WUtkQ2k5TVIxTnhwbjBZc3g0?=
 =?utf-8?B?ZFdtcGxKS1hpcTN5YUtrMlQvY0hoYXZIM2tnM1ZMMkxacG9hTFFaSk5uR1dK?=
 =?utf-8?B?NXh6NnpxY0lYQzVQYTFhWDdWOURYM2dLS3VPckNTRmpLS3k3NjNDNjI5aENn?=
 =?utf-8?B?TGdkUTY5OUdYM0FaT2ZXQm82TXNrWjU4SENGRGp4MWhQRnB4UEJ5bWhpZlpH?=
 =?utf-8?B?bDl4L2RJZVpVbmlxREhXVGpIRXVtWUFPSHUxOVg0RXFHbi9HV0pxSDZZMTEz?=
 =?utf-8?B?ZUtkVDdta0RlSDZ0Z3RlUlJ1ejlLTmYwVmVIWWhyK1Q0Z3d5RkRZMEFVZ2JJ?=
 =?utf-8?B?YTdhRkhsL3FUcU91SmxGclpKRDRuVU1DMjBiRHVFL2g0dXdxQXJyL1lVL3B3?=
 =?utf-8?B?QXV1WXUyd0hSZDczc1l1anA3Snd3N3RhalM5S0Y2WCtvSldaOHprUGtWQVN4?=
 =?utf-8?B?b0V2Wnl6c1RBN213Sy9kMngrUXloT3Y0dHJNelZJWW15VFI3dStyMk9iL3NF?=
 =?utf-8?B?b0RBOWhrOU1peTJydGlmZTJZSlVsWHFPUXp4NFA5MXlEK1VoNXRuNHVxRlh1?=
 =?utf-8?B?bGVPbTQyVng1RnhFZng2cjYvRCtUam5BUmdxdnNpM2c1YU90ODAvQTE0ZmVX?=
 =?utf-8?B?ZHpuZzEyOWxBcHhIUWY2bnpTUUd1MmxQZGczeHlRUGhLWVpOOFNxcWJlN1lY?=
 =?utf-8?B?Tm9Mb2VJQm9zNUJCWiszZlIyVmVaL3RvdHZvOUl4Tk5KWk5adzRTNG1RNzEy?=
 =?utf-8?B?UUVhNXJVNmVOVndoUXlmc3k1MDg5WFlxY2dyK0laSmc2UTFVMkhEVGhKc24y?=
 =?utf-8?B?N25sQmxGcUZVUnJLNGdseG9HNUR1SGRtU0lIbTZ5Ulo0YVhhQmIrV2FRYU5I?=
 =?utf-8?B?SzdhemVPc0JrV0JXVHgvOExpNjRzbDBsSHE3azdkVGM3azZzdlBOSGlzeWJO?=
 =?utf-8?B?T1ZDWWpzNnZ0MjI5NUFIQnI0QXA0U2RBQ01Ib1N2a21HTmdHQzVOSmFjR3F1?=
 =?utf-8?B?WWV5amVEYlR1UUtDbktXeDI0clNiTWhQSTBGNWVGZFNtUDI3Q1NGaW56R3RX?=
 =?utf-8?B?U2dOYzNaRG1BMTRvOWpMbE1qeWNHQUtyaUNNV2F6QmEzaEYydnRVR2VneEx3?=
 =?utf-8?B?U3RCRGpVVE10ZUF1UG9ITDNLVWsvcUhsSzJwZmF6QXVBdkdUR1Q5MmV2MEJp?=
 =?utf-8?B?Z0E3U3czYlZEdHFDT0RROWFQUnZXbFI3SERrWk1HNnNaT0hqampPbk5mNngz?=
 =?utf-8?B?NkUyT3NuSElIYjd2Ynh3dTRMQnhvUTU1NWJCZDJqOUpjZ0FTT1RBNnVpckUw?=
 =?utf-8?Q?HJR9ZnGtZs4lYtwYjpY4yQ0atbKXbjbLNyiV4/v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95232a16-30ab-401d-a288-08d8dc986871
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 09:57:22.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +14enx79RJf4sAuRsryRvBLLDrxakh3GglKn3I9R965QkDFEfvRvzGfxChrxtUDcv0foGVLyO5/K5AmOA7R/EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2416
X-OriginatorOrg: citrix.com

clang++ relies on the C++ headers installed by g++, or else a clang
build will hit the following error:

<built-in>:3:10: fatal error: 'cstring' file not found
#include "cstring"
         ^~~~~~~~~
1 error generated.
make[10]: *** [Makefile:120: headers++.chk] Error 1

Reported-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
No real risk here from a release PoV, it's just pulling a package
required for the Alpine clang build. Worse that cold happen is that
the Alpine clang build broke, but it's already broken.
---
 automation/build/alpine/3.12.dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/build/alpine/3.12.dockerfile b/automation/build/alpine/3.12.dockerfile
index 2c02417ee6..94557e239b 100644
--- a/automation/build/alpine/3.12.dockerfile
+++ b/automation/build/alpine/3.12.dockerfile
@@ -21,6 +21,7 @@ RUN \
   apk add curl-dev && \
   apk add dev86 && \
   apk add gcc  && \
+  apk add g++ && \
   apk add clang  && \
   apk add gettext && \
   apk add git && \
-- 
2.30.1


