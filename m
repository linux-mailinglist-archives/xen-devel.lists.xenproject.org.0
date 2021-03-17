Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274D533EF26
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:06:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98626.187134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMTzZ-0008SR-Bk; Wed, 17 Mar 2021 11:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98626.187134; Wed, 17 Mar 2021 11:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMTzZ-0008S2-7v; Wed, 17 Mar 2021 11:05:33 +0000
Received: by outflank-mailman (input) for mailman id 98626;
 Wed, 17 Mar 2021 11:05:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FSUP=IP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lMTzW-0008Rx-MR
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:05:30 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a161885d-e66b-4252-8d7d-b1cff585775a;
 Wed, 17 Mar 2021 11:05:29 +0000 (UTC)
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
X-Inumbo-ID: a161885d-e66b-4252-8d7d-b1cff585775a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615979129;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Dj3WEWtfLuyd0K8fjqjOFWZBygM37snkgOFZ1PuAd7s=;
  b=GGVGEuN815hiHpM/o1KQWY/fR+veuDiwnvjoLEFi5I1RLjvqRIUVnrjh
   k1ni9XkxriiUKGLwVM9O/h+PmnCJP7VLBl2159R22XWeQrn25rit2oszA
   71jSFpYjp6giT/nlwLEKnf9KAEnWgoGHA9CONi2I61axgFqQhRapHJDSm
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cEkfH64iLi94QlrgEQDnTmEqp9mnN89fAMmSKpnsRwZU5VZawiSRO5OqCPXNET415hgrIfacO6
 DN8h9ScFg/MOZOOrU9u+GgnE76l1zy+LB5jZ2ZQKSYRaHXVW/M246xb7HQnxLmlgSTfXofTKIF
 33x3mQpwH08+KR/QoDJvjhf/C/xcCdRe4OdRFQQYKHy2KnSpRJDorNIu5EVWm6+obqqwKmgvXN
 SGQeNtBGNHCVDCqORiSy/s6SjsIbLO1U3NYwgOCDJOfUztst9onCro+6SXxL88Tge5Y4umhnvG
 mc0=
X-SBRS: 5.2
X-MesageID: 39488637
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
 aSWgyKP5F/2lCgk1Dc
X-IronPort-AV: E=Sophos;i="5.81,256,1610427600"; 
   d="scan'208";a="39488637"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VG12hFFH2uopaIwkpXWtTX6wSn7bqfVG//lZy9sbnqJixv9bgqu/KBd3HNxyoX2HDbhU6s+xUf1/3gPXJrCG58qL8sHIkPLBoEAlIAv/4tq1Tq7PJmplS4yIFXp6oedh2UU7uDShel7Oh/cXGWt4YLuU7SApFpdIbu66VlTu7QM6DXakTSg4TR6p3Mu69qxb8RsC5kCYSgPnLzNeOQC1jWt0qntDiaeEV/evIBPILU55AbqowpBL94Gt02vKuy4L+qiJ0ORTjn6KD/EXyxkDBsSGJhsLmerd2iB2xLtckshKrPoKE4tUJ14VfkS3Tig9yIK5uO71AJkCCVX79TSqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAYosD/NdQQbVF91epopKWbQaq49dZ/bZFcLDV5M054=;
 b=FNm2Jg0Z7l/OUZGjh7MenDsXP14VJWkY4b46oPVTLV4D8wkGmiOoSh2qekelqQ/wNp7gfuqRC+GYmRUboCWM92eO87MgjliJz1uPLz3cRAj1ZAMcurVnCIc9wF/tkzz1MdBEm9c3oC6Zu2XDHc9Srrya+yt/Vp62wvSqknwzKQqzrEYmX+AE+UmvSu7knizyV8jqtpT2TGqc9jriYs+iF+Ua98AJ0ciZdAS2u0yt9If+w9ZeloTjoI/yTo2RDhGIFQvoSf5T5Q/Mmo2vtskHvvHUa8H2zruDNbtwk8bBx4X2ReWvFgNl1MOrhxvI3rn0aSm4Oj7Ay2e6z105w1/lpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAYosD/NdQQbVF91epopKWbQaq49dZ/bZFcLDV5M054=;
 b=Fh+bn77WJl22UpYmiH2mJB6lW2t5F88T7XbaMNZxB9YronCBB6NdYWZec3/TXcnuuEzIjE4Cc5v/VBGUjbu0dgmewbqWP7fIsKFr9e5njoYudh63/ayhMmC9vIig4OpeLXd4PF86YrZtNyY0kb5qHSPbVP9GgVH7yG5toWwbTuE=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH 0/2] xen/x86: alternative fix for XSA-369
Date: Wed, 17 Mar 2021 12:03:59 +0100
Message-ID: <20210317110401.46322-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0168.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3ca4c43-bfca-4fae-3c44-08d8e9349111
X-MS-TrafficTypeDiagnostic: DM6PR03MB4137:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4137045C3ACA5F2795731D738F6A9@DM6PR03MB4137.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SUAEzJh1WvLYv5aq90gF9un93IdwAJLBC4XhB0tpLshASB1aeHnT66WGxZK5gSLtfnWG/azgR5RgU/rcT6y83rA5yXUmyfFeLAvZf+VYRA0JlLR+h4M8rWmlEJQ+dtT4+gsRFw52HIs/B7WCVafQNmRCY+FsRG0Pew/cY2i6VsMQqAbxN+alSV1o/U0oGWCH680S8E58AZKLPeRc1JRpm4ImmTctU3dzf/qEKNQZLvObbRg6Izp7Zmph8quP56W2rn05v5R1a+qXo2dIXJseM6T75o44Pc4RNZ1t3jGqFnH5QeYquD2iPKt6pc8DKGyqz4HyX3fpTtxEDCJ/qishHYX9FAvKSuBf3qGuul1stJRv+CZYxpJpWFSS5eLrkz9v5IzX2JQ6naoUyVU+WdgwbSmiV04Qe0xuk+ToT1+5rqHFh0ZibDHqdNCqmBSGCa/CcvDCdFZraL/n8zq3VVUWYJqtQVgwyNNfUIaoQpQMZf+lAFrDZVHtSwKDeKxoxxGzWVGZC8edpKiQJ2fUMStOsETW0XVeELgpa2eHxsRAJDq5nXqlOPf0DLXQg3mGvnPy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(36756003)(4326008)(2616005)(956004)(83380400001)(8676002)(8936002)(86362001)(5660300002)(66946007)(6486002)(66476007)(6496006)(478600001)(26005)(16526019)(186003)(66556008)(1076003)(6916009)(2906002)(6666004)(54906003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2RYQSt6bFJjcUVncmlsdVJtRDBrTitXTzEvRWJzeGF2NlEzL2J0OS9OT0tu?=
 =?utf-8?B?cEZXblYxSDRJZ1ZjT0s4WkhUOEx0NkhTSWpnZnM0OTdISmFWVUNia3piQ0h2?=
 =?utf-8?B?TjRSUVBia1pKbkVOMHFMYW11RTZhRks3K2h5ZUJaVEpEUWNJSkJsanFqRkZM?=
 =?utf-8?B?Q3JXTXhvY29tTEM5MW9UWk4vU1RwVjNnY09tOGlmdmVSYklaZmpxZkp3QldJ?=
 =?utf-8?B?YS8rNDJzS3pjYytyRlRuM2U4T0d1M3hySkQvSnNLbWtUNi93MzdzK0hGNnZl?=
 =?utf-8?B?L3luSnBDaFBSM2VwUkFEZ0Y2VHV4YVlpR3JXMUlIeTA3cG52Zndod2lRNStV?=
 =?utf-8?B?NUttbkdPbjhGOGhGVy9rbnM1dU5Jb1AvU0N5Zld2RDlDMkJzMjN0SWoxRk0r?=
 =?utf-8?B?T3hBY3MrcnY3TVMzcnE2OWxpRG1mSEtudVdCN1pMaWJvQkpseEJzSXp0WW1q?=
 =?utf-8?B?WDUwNFpIQXdnZktxTUpWUHk4SEpINEQ0SXJLZmRWNUZHUjJuNDRnT2NVWnJX?=
 =?utf-8?B?Vk5acWxLMldZUWluWk1WK2QvYkV6V2ljWjVBTU1hcFpOajVsUmRGNDZ3UktU?=
 =?utf-8?B?M0ZkcnF6OVg0K3hSNFY3ODN2aXl1ZVJtWHVWTERWTHNmK3cwWXZHV3RiSjBO?=
 =?utf-8?B?LytTUHNPVVByeTVValNqaWk0aEdRNU9sWmlMUDgvUkdqbVNnM3pMTnphQ0Ni?=
 =?utf-8?B?NjFES1Z3UHk5R2Y1eU1vSjhrYnZVQ2svTHdJZktzamFURGsxaXcyY3pXRXFL?=
 =?utf-8?B?NjVhWXorSXdNVDBpWnRSdFlnSWw0RDBkSExLVlpkL1ltSktydzBGb1JKR3N2?=
 =?utf-8?B?amJieUZNKzJ4K3M4ZEdIVHFjUElEMnY1dU5jNnRMdUhhVS9QUEt2cUl1b1NY?=
 =?utf-8?B?bTZUREhqOHUwQUpoMzFQNHV0ckptQUJhMEg3WGZvSjZ1MHBEc29KUjZUV1JT?=
 =?utf-8?B?V1poQlhrUVVvSTJsVnN0bWdSeERnY2l0RUFzQ1NrbHNSdENQVGdVU3RNVVNU?=
 =?utf-8?B?d016Ump5d2Z2VVZFbHhGZUhGK0NPODc2LzVra0Judkc5QUtZNnJuZVdQbzdz?=
 =?utf-8?B?NUFqNWdxQTdVejl5MmZFWHpxWnFiMWJOS0NDa2VRTk9YVGFlcmxscVBlNEhK?=
 =?utf-8?B?QVZpOGlEc2pMek42ZVE3Q3VJRHQ5RWFZZ3h3R095RTZxbEZSekZBREVlcDRu?=
 =?utf-8?B?LzVyVkV4bHJkc1pKUkhMYXlKYm9pYTZGcTRLQ25xWmVmZHZ4MWpBeG0vZ1Fw?=
 =?utf-8?B?TjVnbGpnM1dabWNvUmNwSWpDaU41NUNiaGxuUldzZTRkQVFlcFp1RnJTMUpM?=
 =?utf-8?B?TkQ0cWI3TzRWNW5qd3ExRTF0djNZMlk1clFraVNidmhTN2gwUks0UGxNQ3Zm?=
 =?utf-8?B?YmxiamxNZXhEdjRGa0NUT2FpWE11ejhpMFpsWUVnS1NXSUdKS2NlSExxVGlv?=
 =?utf-8?B?WkNzTXdHUlMvV3NDRGdrS2pHZDJNYVRETXRkZ1Z2VTF4ZnFMSDZWVVdEME5R?=
 =?utf-8?B?SzNrZk00UVFwNHpUQWxiWWptdjFVWW5FZytrRzhSZXUvdFNQaHJPQTl3QnE1?=
 =?utf-8?B?NlpEUmo1WDZXWEU1UUsrZ2oyYmltTWdCZDQ5dndWaDVTSzUrdFlFUFVId0tD?=
 =?utf-8?B?b0ZSL2ptUCt5Y1J3N0NBZ09wQVJyMHRJWU5YRDJRdnprbUs1SldHRUhMQS9E?=
 =?utf-8?B?TUoweGJRZEcxTlV0ZkZ6dUdxNjVwdDZobTZLQzBHczRkb1VMdE9id013WFNH?=
 =?utf-8?Q?QDmDwVM1I5ZYUl/eacjm4FGiVUr8ERZCz4w4lg/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ca4c43-bfca-4fae-3c44-08d8e9349111
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 11:05:25.6492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nc3av+x7AojimneYJ2kgThdWBB14nBDW1n5zUCShw20IylZx1Bc+W5vwwUtHeHkcIXWEKFuJLLYqFlkcCCr4fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4137
X-OriginatorOrg: citrix.com

Hello,

This is a proposal for an alternative fix for XSA-369 that instead of
special casing XEN_UNPOPULATED_ALLOC to size the p2m relies on making
XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on the generic MEMORY_HOTPLUG
option rather than XEN_BALLOON_MEMORY_HOTPLUG.

I think this is safer, as we don't want to be special casing any option
that pulls in generic MEMORY_HOTPLUG without XEN_BALLOON_MEMORY_HOTPLUG.
Without this we would also need to at least special case ZONE_DEVICE
which also relies on MEMORY_HOTPLUG, and is what pulls the generic
MEMORY_HOTPLUG option even when XEN_BALLOON_MEMORY_HOTPLUG is disabled
with XEN_UNPOPULATED_ALLOC.

Thanks, Roger.

Roger Pau Monne (2):
  xen/x86: make XEN_BALLOON_MEMORY_HOTPLUG_LIMIT depend on
    MEMORY_HOTPLUG
  Revert "xen: fix p2m size in dom0 for disabled memory hotplug case"

 arch/x86/include/asm/xen/page.h | 12 ------------
 arch/x86/xen/p2m.c              |  7 ++-----
 arch/x86/xen/setup.c            | 25 ++++++++++++++++++++++---
 drivers/xen/Kconfig             |  4 ++--
 4 files changed, 26 insertions(+), 22 deletions(-)

-- 
2.30.1


