Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AC245B907
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 12:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230350.398218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqNv-00066J-3S; Wed, 24 Nov 2021 11:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230350.398218; Wed, 24 Nov 2021 11:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpqNu-00062s-Ve; Wed, 24 Nov 2021 11:24:18 +0000
Received: by outflank-mailman (input) for mailman id 230350;
 Wed, 24 Nov 2021 11:24:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qlkt=QL=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mpqNt-00062i-OX
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 11:24:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cdc36be-4d19-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 12:24:14 +0100 (CET)
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
X-Inumbo-ID: 0cdc36be-4d19-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637753054;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5kPmSLWR56HGtsoKyWZROgPOQloyG4CY6oWSCUzBQag=;
  b=B3fOeP8gR39qqekD33VoI///xal2k41f8jhV2cXHi3Kv0Qcsp+xfkLRa
   nFmMV+KiVJmwYMrO5dkRD+H57wMvazxBRWW2veD2kwyCN3QDe9UHQDKuD
   peul7y8noo+qOoOC4XNOedv7Er7aXL4YNrcDmEvR43SSbZMjPMe4BtHKO
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YiKvwbhncek1kh5gWQd5hD8+6jLBhvrP4rXp4H1Ie1o3qnOjlON/WUdCGZRcJKkcWbQGPYwTXX
 G++8hmF9woKfmO1UK6x0zL47GQlGVMvbbx9184kvEsRDvOsUm2KIc6c9nKDvauBfvEBSgumGkp
 S1sLWshdDrIFWEQXuZZdNd2Mi7IENA+BFJlMX69QrxoWMKHnzuStmzta4Trl5Oy38iSB+SmKsK
 DvLqIpsZTKs3GKgdx7P7PPerHI49h++9HEG36W7OmCb4TWw7eJ8kJ2BvIaeaPUz3lZT28d31Wh
 q4+6Bt6iY3RaZPd3ztmxOzto
X-SBRS: 5.1
X-MesageID: 60541160
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 IxM4Xb3JBWwnslkSOt7CiZXWgu7Kic2Hk41xH0=
IronPort-HdrOrdr: A9a23:RneVRqhgFx1J+Z7G3FAPVdTFm3BQXz913DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdhrNhR4tKPTOWw1dASbsN0WKM+UyHJ8STzJ8+6U
 4CSdkANDSTNykCsS+S2mDReLxBsbr3jpxA7d2us0uFJjsaDJ2IgT0JbzpyRSZNNXR77NcCZd
 GhDo0tnUvTRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W1Dk1frsA7ciYnV9MNOA4/e7rFNoW0e2O1DIuzGyWvKEhVAQOEl3bIiI9Fkd1CPqZ4i6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.87,260,1631592000"; 
   d="scan'208";a="60541160"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJ6/pKyYKLGm0rmsroeqHj+H/Ws7A8N6PKWOXkF/fe13Cpefl4uN6XPvENbeIVCgnABjZ+Qpk8rWi/IhLdz9HtMh5zdszO0cxsWPZE5aymSKBGx3VtGa9vCiU/88FnotHXXaj4HPyN+7XNwqDv7hjgSvkBvXbhiZhWgVqrMIPbTrblnMQEq2gAZUlLHuosOFv4QyuozPujGpSGrvFQ7XY1DGz/9THYBGoMLlGwEdm3klewzYFedHabQTiNnr/hSpglaQN48a/j5M/+QCWN8ur7lMIn332dv624A092bYeHCn9nPJPYZz13OubO6ASD787arVL+0LCmkF2VwPxzet2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBJE7aFrWt2tzUNOVWjxNqvzHdrUeFb52mg0ejYKFTU=;
 b=Mddg2SYM1DtSqIk5/bK/A7cRfg6+796l+9HNt1ETvvpdl2AKPIFwBCaRKxTRURhV92qDsdgH5Fw9ltdLL9N1i/sUivLdnvAhAQ2wUKg4bq4Czeeaun+Np+ozHTWiiz4jwbAD53LOkohzV+oM31hyFVyNM1fTeUXwwIeXHACeWo9zkUjKePb8R7zMnhoblDh5c4U9nAf7W54mhQIBlUaAac7U3AAieQ0eBN3PXTBC7j7853kAt4f42r1z4jQvaOdDU+ts4Zlol4RClxf9uleL3ycixGUmXj3qXP85MlAmtqRkwK9bgZKvcWrOpoaqq1KaKvuwDLHvPtDmwgVmcI2dsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBJE7aFrWt2tzUNOVWjxNqvzHdrUeFb52mg0ejYKFTU=;
 b=vAAdztDYW9Tx6NVu2VRMdATQUu/r2skQQayGwTt97lUbEgrRx70HK2ZoajwjFp/0DH4eFMSKnTMyXXREmNY5Wu8KvG1Dvqbb2ojVXiVhV4/O4KJGtiIfH4znU8vFo15duvYrQ45hQUwx354kHwe2g8iH9yyIr2nPwL665gBdeew=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Community Manager
	<community.manager@xenproject.org>, Ian Jackson <iwj@xenproject.org>,
	Alistair Francis <alistair.francis@wdc.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Dario Faggioli <dfaggioli@suse.com>, David Scott
	<dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Josh Whitehead <josh.whitehead@dornerworks.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>, Nick
 Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>, Quan Xu
	<quan.xu0@gmail.com>, Rahul Singh <rahul.singh@arm.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Shriram Rajagopalan <rshriram@cs.ubc.ca>, Stefano Stabellini
	<sstabellini@kernel.org>, Stewart Hildebrand
	<stewart.hildebrand@dornerworks.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei
 Liu <wl@xen.org>
Subject: [PATCH for-4.16 v4] CHANGELOG: add missing entries for work during the 4.16 release cycle
Date: Wed, 24 Nov 2021 12:24:03 +0100
Message-ID: <20211124112403.78674-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0121.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b78877e-b9d5-449a-76a8-08d9af3ceed2
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM5PR03MB277756F135AAE0CA073E39BC8F619@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HaE5PB4sI7vDrPGW0lach1vFbtQ6AzeqQoJtXLTJdlUaEy2WAchdo3cyUQ6IkFFjOiJFuh5q61VgOHXC9+4WlrpoMwMwT625FCKGVGf3zlippyXSk6of5vLOuvO1pQoOGcGLUwVS30VTF3C7SkmnOjWCUCMmp55W92GFGDY9+BUI+SExIEo30Pt9wx6/GR5SxdVaNHV/lac94wympXkKPE4Zbbc+2yO9TIabJB20R8GIhbmaZVmfWax9mPx2ijKjR/zXGcyjDu05659Sl1rLL5LAfSqCrdltKDZbCi73qJ4c0z6bJdTQHBx1Ush8CYsrSyYk6gNTPpa3JkfCIms6ADbj1qvigPIDGFhNpqPEe0WMT10cMneKxyOIzaCpPWF7SR8t+636Itj0ZUQUNv9bXiXw1x18XRsr9/B5NG/XJsdxwJTSmdhNt6cWKdwwWt86WJQ0qGnVukZ1H1AxHXJls3TG/J+Joczz0P5eneIEIerwVF4BOQv37GrdQPt3nw2iVH//WZo/cPwBOrrynZ8xCwoVvJaZzmLfiUcXxNv30Ckakc8kVO1WEp4a9mVdLoinjNurzGMsGFgUOQ2sn4nfzLI+ASZ5tKz0PYw2W9RGO9wNdz7dQzCOY8b/9LTjEeTHpkGySzwHmqmNk5s0YcSzkQkWfFTDXZPwWQxy5IBijV+Nq4ApHexVWs7Mnk+dTsD/wYq7q1v2h47aQQbHN3dDvIWJNseeaFX+Lh5uAKKAM9stKqnCAxoudOSZYU46h+MwIYXnpQTElQVQtwl0P3eS0cbH1IP03EMFdlfIeRlI2vOdbc/+S/S4Iin5J8yjgJnSlAYW0nd3y6g0xoYZSNMuR92WY9uPd11KIF7QWvgffrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(7416002)(66476007)(82960400001)(66556008)(8676002)(1076003)(38100700002)(7406005)(316002)(83380400001)(5660300002)(508600001)(6666004)(66946007)(956004)(36756003)(6496006)(86362001)(186003)(26005)(6486002)(8936002)(2616005)(66574015)(6916009)(54906003)(4326008)(207903002)(219803003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2Y4Wm9LdHhUM1cvWXUySHVHRTBGc2RtR1EzQU5BMzQvSWdnOEdLUWRnWVlO?=
 =?utf-8?B?NlFoSFBGaHFMNGFhbUhyV2llSk51WVlmNUp4bXZsRWJxOHJyS0NlOFZIa0FS?=
 =?utf-8?B?RkZNUThmZXZvSWo0SHhsS2p6akxybGhpaHU2NnN0bGNWMjJIR002YnFYd1Z0?=
 =?utf-8?B?UlRtNEc0OWU4Q0JTZHZiUWhUTHBZcGFVL1BCYnYvM3BHN3ZLNEJnbUNiaDdo?=
 =?utf-8?B?ZHlrcVYva3FyQkU4TVdoeTBhN2tOTlBCMTNwN2dvS2N0clhDU2R3bE1OZExm?=
 =?utf-8?B?T2RZQ1lPZU54UEx5cHdSeVpYWTlkUzE5MTUveXoxQ01obW50MTVRREJVKzd6?=
 =?utf-8?B?YThobHphVlFZWlVVZkpLak81NzJETXd1WE0wREJGcktVY0t4Nk9kd2grbE56?=
 =?utf-8?B?U0JtdkNoME1EQmNZbkJGbEcxK200WkV4UkkwcUNMclIwR3E1N1IwUGEwVzhk?=
 =?utf-8?B?Sy9mK2Z4VnZaMUNsWkxBeDlKQUZRNVllNUVZaGdIR0xaTE45UWtLcGFLcysr?=
 =?utf-8?B?M3ZjdmlaM2Y2aWIxVEdBNDQ0eHdoWFBLWnVyTE4yWUhNTjlkeHZFWjAyNWpx?=
 =?utf-8?B?VDhVQmVHRE9jd3IzUHE4K29UV0Rlb3pKajRGYzZDVURaNmc2NVc3bDR2Sjh2?=
 =?utf-8?B?S084VHpIemx6dThlYkhhSXUvUEt3VVlWV3cwSmJVakpNTXJPWm9NcjhhYXpQ?=
 =?utf-8?B?N3hhY1lEUnV0RWY5YXE0SDFpM1hNVjhmbTBQWjlxbS8yTjBXWkdnd0Q5S0Fm?=
 =?utf-8?B?SG1KZGJQcUhSNjlBcTg4QmNhcFdrcXJQdUtteWhhYmhYVktxZS90YzdSNUQ1?=
 =?utf-8?B?bVhoMWJsQ0tIV2RncWZUc3BjdXBMS1E3SVpFQUMvYU1ueDB4enh3RW1Kcm5P?=
 =?utf-8?B?cmtpbE55MnFXbWpJbUhXT2I5b01nRmZnT0p1a09MTThIRDgvVUhDQjQ1eG5Q?=
 =?utf-8?B?WXFaY3dPQ2lpVmM1Rk90d05KejVVZG5qbWtxV1lTcFBqTERXRUp2aGFobkxx?=
 =?utf-8?B?V2lDcGlNVFVIeTB4L2Vpb01CbFRWMXVYQWdYWklCbHNuR3dYZlVxWlRpcXB1?=
 =?utf-8?B?MStSYi90YjBuRzBwb0JpZnFyYUxibnloMWhnOEEydGhGc2dDSWJRM1hnaVFR?=
 =?utf-8?B?MkN3amRXdDFQTGFGTlJhRHNKU1FaeFdwQW5TdHN5VU1zUVUxOGVCNDRtRERh?=
 =?utf-8?B?MjUrRG5nbTdYZTJWUlhFY0ZDWjUwcnMzcndqWFhwVG0wVEhIdU1ESHN4NndI?=
 =?utf-8?B?QmFaditYNzdZdXJjSHgxM25sYzZMYWZLOGIzZnJ5ZFBTbFF0ZWlQaVBOZEFv?=
 =?utf-8?B?RWZqUlUwOFBycWtnUkRSQ2VvL3U0ejJNTDIrOXRzTWRyOVpkcG1RSTB2LzZX?=
 =?utf-8?B?R21mWDhQa3pEMzEyVUs3cDkyaGtUUTBNcXZlZ2hkeG54eFBlTTNFNHRmajNh?=
 =?utf-8?B?QW51UXd5ejRET28rNjBGNW1TZUZrekZXNDRIZTRMQnNoakZaMnJhWXBWV1ZN?=
 =?utf-8?B?RURoU2tiZ01QZElBS09GaXg3ZVNsRXlVSktzZUlVTDI2ZFFGYmY0aGtzVW9K?=
 =?utf-8?B?QlJUQi8vR2ZzUnJJcHkyWWg1SFJZN0kzaGZONWNSOWZSWHFZK1VnVDJtckNo?=
 =?utf-8?B?eDhLTWJYQjhtUEZlMVROMm4rRlNBc3JvSnd2eTNmcG5UQUxDMTBOL0tFVGYr?=
 =?utf-8?B?OG45TXZUc3hFaWpRV2hkNGR2bTNIU251d1ZwdnNMc2Z3V3lhNUxPa0RMZHpr?=
 =?utf-8?B?R1l4QzYwV0hsR29JVU1BZE9neFcreWVJNFJHeWVIbUpLdVV0UHFZOGF4bXNP?=
 =?utf-8?B?THFPcEh3WXpMb3BpaUFibTVxMFplZ2lkWVFCSDZiUExDTGtlN2VrSFlOYW1Y?=
 =?utf-8?B?S2pTSTd2bnZCaVNydlMxTmJBbkZsZTNaVmlBN3ZpQy9JYjZ3SkJmeFdHUHhl?=
 =?utf-8?B?YnlzU0o4Ny95QUxQRFdCREJtTElCUVcraUc2OHo5UUl6RnN4QjN0OEE0RktR?=
 =?utf-8?B?ZFVGWHNiSC9WcW54UjFPUTFrTjJzUW1XWU01NWZmd0E2ajRrNG41OG1rbzh5?=
 =?utf-8?B?VncvOXZyYnZDMCs4SU1VYTZhYkNua3hUbkZrbFJqRUpoOTRUdXdybzFSUzJt?=
 =?utf-8?B?TGNJUXlGWDlLRThvMmp2ZmtUS0Q2V2xBSngxbGh0azhnU09pcnczZ0FZRTFF?=
 =?utf-8?Q?YaIxzJN78IIwklu5e4oBQBo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b78877e-b9d5-449a-76a8-08d9af3ceed2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 11:24:09.0818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nxGNVVWEO4yLxGfe+z0umlbdhz4o7GEVn93wkANGMy3jd0NdAslKkzqSme/eW0nKJF8fYkSVrz2p7R941jjNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

Document some of the relevant changes during the 4.16 release cycle.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
Changes since v3:
 - Remove a duplicated line about not building qemu-trad and pv-grub.

Changes since v2:
 - Reword the x86 page table API change.

Changes since v1:
 - Add qemu-traditional and pvgrub notes.
 - Expand vPMU support to note it's limited.
 - xenstore library API changes.
 - xencall2L addition.
 - gitlab CI changes.
 - dom0less improvements.
 - vGIC fixes.
 - New Arm features.
 - OP-TEE fixes.
 - Arm64 heterogeneous CPU support.
---
Cc: Alistair Francis <alistair.francis@wdc.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: Christian Lindig <christian.lindig@citrix.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: Dario Faggioli <dfaggioli@suse.com>
Cc: David Scott <dave@recoil.org>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Josh Whitehead <josh.whitehead@dornerworks.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Cc: Meng Xu <mengxu@cis.upenn.edu>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Quan Xu <quan.xu0@gmail.com>
Cc: Rahul Singh <rahul.singh@arm.com>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Shriram Rajagopalan <rshriram@cs.ubc.ca>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Tim Deegan <tim@xen.org>
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Cc: Wei Liu <wl@xen.org>
---
 CHANGELOG.md | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ad1a8c2bc2..1fe52da7db 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,31 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
    no longer be built per default. In order to be able to use those, configure needs to
    be called with "--enable-qemu-traditional" as parameter.
+ - Fixes for credit2 scheduler stability in corner case conditions.
+ - Ongoing improvements in the hypervisor build system.
+ - vtpmmgr miscellaneous fixes in preparation for TPM 2.0 support.
+ - 32bit PV guests only supported in shim mode.
+ - Improved PVH dom0 debug key handling.
+ - Fix booting on some Intel systems without a PIT (i8254).
+ - Cleanup of the xenstore library interface.
+ - Fix truncation of return value from xencall2 by introducing a new helper
+   that returns a long instead.
+ - Fix system register accesses on Arm to use the proper 32/64bit access size.
+ - Various fixes for Arm OP-TEE mediator.
+ - Switch to domheap for Xen page tables.
+
+### Added
+ - 32bit Arm builds to the gitlab-ci automated tests.
+ - x86 full system tests to the gitlab-ci automated tests.
+ - Arm limited vPMU support for guests.
+ - Static physical memory allocation for dom0less on arm64.
+ - dom0less EFI support on arm64.
+ - GICD_ICPENDR register handling in vGIC emulation to support Zephyr OS.
+ - CPU feature leveling on arm64 platform with heterogeneous cores.
+ - Report unpopulated memory regions safe to use for external mappings, Arm and
+   device tree only.
+ - Support of generic DT IOMMU bindings for Arm SMMU v2.
+ - Limit grant table version on a per-domain basis.
 
 ## [4.15.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - 2021-04-08
 
-- 
2.33.0


