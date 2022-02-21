Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B89774BD8AA
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 10:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275948.471946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5Iu-0006DT-Ix; Mon, 21 Feb 2022 09:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275948.471946; Mon, 21 Feb 2022 09:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5Iu-0006AL-E1; Mon, 21 Feb 2022 09:48:24 +0000
Received: by outflank-mailman (input) for mailman id 275948;
 Mon, 21 Feb 2022 09:48:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vyL6=TE=citrix.com=prvs=04447c275=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nM5It-0006AF-7d
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 09:48:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66fa17f1-92fb-11ec-8723-dd0c611c5f35;
 Mon, 21 Feb 2022 10:48:21 +0100 (CET)
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
X-Inumbo-ID: 66fa17f1-92fb-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645436902;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=lHcl6MSrGpr0X6ergIoeaWIyzjrFUMqzqv2h69J9W3I=;
  b=DEIoIKuxnpSI3WI+YqZzYnvqkOWjK6ACi5gr9COfa0BIC5G52nRZhO+V
   0FhneYH5wLVK0QXI/GZJ5DIWEyx7sXUsoW/ioGngI8TE1AnN2MISGiMjn
   tzkDTk1yxUnv+chg7Wny4NgkdRHDIGNzqoxJckUiVj/Q1WPZdkaSqCYwq
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64635581
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:HHt6wKoQYhnCHFP5SeTdxdqwPipeBmJmZRIvgKrLsJaIsI4StFCzt
 garIBmBPffeMGrxKN53bIiz9kpU75XSyd9lGVA9/ik3EywU8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8ly75RbrJA24DjWVvX4
 4qq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBIp+TweZGXklhMx5+BpBH26/NGFThrpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZZHMmcyPE2ojxtnCFwRIrVgl8WRpHTeYSxXiUuLg7US2j2GpOB2+Oe0a4eEEjCQfu1UgUSwt
 m/A537+ABwRKJqY0zXt2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGEZlWWAowFb
 RZOo2x38PZ0pBfDosTBswOQvEzb5xxHVoppM9I60zyM6bre2irHGT1RJtJeU+AOuMgzTD0s8
 1aGmdL1GDBi2IGopWKhGqS89m3rZ3VMRYMWTWpdFFZevYG/yG0mpk+XFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vEr4tGuVh6b/PuREDGQ3Ct4ace6koqGp5
 iRspiRnxLlm4WuxvCKMWv4RO7qi+uyINjbR6XY2QcV8rGTxqiPyINoBiN2bGKuOGpxZEQIFn
 WeJ4V8BjHOtFCDCgVBLj3KZVJ1xkPmI+SXNXfHIdNteCqWdhyfclByCkXW4hji3+GB1yPlXE
 c7CLa6EUCZLYYw6nWHeb7pMjtcWKtUWmDq7qWbTlE/8j9JzpRe9FN84Dbd5RrpntPjd+F2Nq
 b6y9aKikn1ibQE3WQGOmaY7JlEWN3krQ5fwrs1cbOmYJQR6XmomDpfsLXkJIuSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:uLdQza78R0zBhFJfnAPXwAPXdLJyesId70hD6qkoc20yTiX5rb
 HToB1p726EtN9xYgBRpTnuAtjjfZqxz/FICMwqTNCftWrdyRaVxeNZnO7fKlTbckWUm4JgPO
 VbAsxD4bbLbGSS+PyKgzVQZOxB/DDoys6VbUq09R1QpEpRGthdBk9Ce36m+socfng5OXLsf6
 DsmfausVKbCA8qh+qAdwM4Y9Q=
X-IronPort-AV: E=Sophos;i="5.88,385,1635220800"; 
   d="scan'208";a="64635581"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zh/CYRByhUnjYSFdbIiiQI/2lmCyxyYJ3T23U0U+4pd/Px33TauQwG8GxD4NrrO7yK3lLhk08DFwZGH9kMieacPtsCQYjgei2IatcJzuh/SDpKrIjWwAGJePALs5bWFkikkghGqZm/2DJFXJKQBrKvacs0Rl6/0kMaH0HCn4ro4mMdQlkOGPlM/aYEKNHo1Rxt+C7QtmlbPyYfZ+ABHBotEonEKYyBSwkFkTOLqpKgXzwxcnAo7EGWZG6qXvJ1g2esMJjzLF2oMDAGzGURs6NazAyxN3B7uoKQpQnSRlr1e4WsEJD3ZiEhVdMB7mKM80iPxwEYdz+CKdxybxtNkCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbyOJGVqno9s0d2X3LZSO9x9Tj8UTr1uNemmnbyLu/M=;
 b=LFF/xjK5dGOaVKW7muWMj3svsjHHy16vIxh0IL/L/b3BnOreTSQhDVWYQpPgdPc585XxFb7oPQwh/lsDqF6YmzjWxSBuf3z1GGyTbZdqpEpRpTgbtUMvM1u0vSdpzr4zqKtgqyBj39dUK1f419oBg+8Nm+wrYBBIvcF9jfhYUgEaJa+jPmx/17fx4BqRojFiJr+aXFnAQHn2yHj9FQR+TV5KDXLXZWfoOz70Abc99Pz3SiUDm+K8Dz8yfcNg+jwMsylUYWCwNAFurItfS+n3in643BKS3XLvwgX8naEwc2e6LOxJOwHwIg+JFXy9UHEPd84+X51QJ02oS50cTNqn3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbyOJGVqno9s0d2X3LZSO9x9Tj8UTr1uNemmnbyLu/M=;
 b=QW5zR/C9hPgRyjNozDOuO9Y9Mimiah0emP24+qjIZthEuVu+W2JCIMyt4v6eqxGp64y32uwSiKwO/yHRfObn7LnBD5OI2taZGZsuoj3IEnmnVP5I4APilYalrsJDcS0l7D4rW1DyU9R3mmxXOffxlI0QFIw3l2s35aGJBGaFtWs=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] coverity: disable flight from crontab
Date: Mon, 21 Feb 2022 10:48:00 +0100
Message-ID: <20220221094800.54169-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0108.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c368af5d-535d-4bdf-34c0-08d9f51f4526
X-MS-TrafficTypeDiagnostic: BN3PR03MB2179:EE_
X-Microsoft-Antispam-PRVS: <BN3PR03MB21799F26FF72F0B98686F6158F3A9@BN3PR03MB2179.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MRRAQvXrKMnnnf52pKd8KB3Poja392UWJwKW3OOjk/7c3HG3ZK/2gOMEu+UTX1mOrLn+sA5a/536Or2G2Wk4mLXfHb1YJNqKEAnCUMiIb+lZ1sycXg/NGTBBh5P1MScWwPVNDrr63ngcFwBvqVIAi+DLxlma/BvLCi71DyJgp7rq9NPUuNAIdMVpZxW3VkXlSj2omd2V6F+PHDYb0q5Yz7UwIDSRpXDEkUT7mDkJtB9fHdoJhpMMJVVxSr2E6vL6+WivZs/8HUGxDuA99fexmbnirPYOaiV5+4ZHu1C0dOtaksOrAVT+Pi7rXJAKwT4bz0Qu5C7wJPo2V/7KEzDcwqiyH1F5IamI9Tmy/bQn7i8H15h+xS76sAN0DrDleyI3rqKRRCWGWuvwCc1JBc1FwEsP/zxG4kw4FFYA8ZgmQyvo1tbPVvHw/Nvp/S9cFCmvtG30AACJ0M3gWbyi9uppRGqxmH4hHsaUst/Rpr8XytQd+simPJS5sVi6Cg2XG9fYV13pKwdLLuA7C+1prGu4tGanbYHYBz1PI/P+GX1i+DpIW2F1A8WiKxfArzhBWU69vE5JU3V+mXFHv7EpHVaLpFIyWI9aCrmcEpxI7chPsV1cXV2fef6J/VY0VAvHyy2dLw9vnVT1tLI3vbTrLJk1XQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(66556008)(66476007)(6486002)(66946007)(6916009)(316002)(508600001)(83380400001)(1076003)(6512007)(8936002)(5660300002)(2616005)(2906002)(107886003)(82960400001)(6666004)(86362001)(186003)(26005)(6506007)(38100700002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1dZOC9UVm9KLy9nenZuY3hSRytKSjhNdUR0TnBpNGdKYis1TENnSVkvdjFF?=
 =?utf-8?B?NWV4QkFNVEZ0eEZCNFJRY3NydGJ5SjJYbWFPbzMzUjI3VmlJWlNybUIxalpO?=
 =?utf-8?B?YmpwdUVKWWRkdk5zb3piK20wVWo0eXBob0hzc0xTa1krNnFqdnF6bklaNzEw?=
 =?utf-8?B?M01oVzBKZlR0MXhHOUV1REhndHdCRVdETHY3eXlyOU1RY2xSTmVjb01UNUps?=
 =?utf-8?B?SjRIVHpZK0p5b3dOb3g3OExUckxsa054UkJYVGpRa08reWJSbEVMdjBHL01u?=
 =?utf-8?B?anA0Q1JDM2x6Z084YXFZa0l1bFV6UGxNZjU5TXl1TDJGemgrTVViZFkwOHYx?=
 =?utf-8?B?dElBcDh0R1FPVnRzcVB0SVRUZ2Z2dGJHQ284RnQySzM4OW1uaEpQajA0bnFs?=
 =?utf-8?B?bk42TzIzcHdrOWR3Q3N0V1BOd0VHcGxhVGhNWmVkTStwckRkNmx3R2hxN2xo?=
 =?utf-8?B?MHYvYldZdWt5Qkd6TCtPRlBSU0dQNitrUmZUcU5DNExWaC93THJkVFJlbXhK?=
 =?utf-8?B?ZGhIMytTRm9IRUVhWndrbDVaa3VvZ0YvMCt5cFlxbDBxcHBzUE9NWlg0UnJs?=
 =?utf-8?B?Zm9Ia2tPVE5IUGhnMnU5L2c5T3RZYlAzc0YrUFExYWVBaEN4OVZNN2JFMTd4?=
 =?utf-8?B?Y3lPQzUwdU1VTFNWZzFPWENadElpQThJN3plM2pwSXNDRWQ4Z2Nlbnp0S2JD?=
 =?utf-8?B?Z3JsL2piUVlFVzZGTzVLbzlvTHFzc1RERW1ZZmluM0VZYTlTY0VGNlBOc0tp?=
 =?utf-8?B?S2w3amtkbzkyeWJETE9Cb3JJZ05WVlFmN1RwaU5lOVhXdXZGVCtuQTArQ3d0?=
 =?utf-8?B?NXlPdzhQYTRnWUxqbTFyOENFUzR3VnRKVWZCdjZuU0hxWUNzQkFOYzNPVmNU?=
 =?utf-8?B?amxFNktqcndZb0dVbFpCK040QThsSUZFb00rNnIxZ1E3NnUrN0oxMTdUUlc0?=
 =?utf-8?B?M20vNDNnMkcyNmNnL1dIQ3ZOQWFXc1R3b2srT1VpREVIclZ0bjM5emxWd05q?=
 =?utf-8?B?eGJLOTlKajJMRmg3WmVpYVV3WGU2dVIxWkdUK3NPNFhmTTZyVTZuV0xmTWNS?=
 =?utf-8?B?dlhTUWFOSXhic0IvRjFidlB6TEczRXJ3K3FmRkFVam9BZ243OTJucUVCYzlr?=
 =?utf-8?B?azNLOExtU2ZtM3dPZ09lNElWR09ITjdDM2daUGpxWWROOVUveDBHdzFVcjd1?=
 =?utf-8?B?Rk1tV1ArUXNmZE9CaEdmL1V6V1RkMmhENjd1SU13cjRsT0UzazNORGRLQ3o5?=
 =?utf-8?B?SkgwQ2VuTzZLdE9GVW9DZkhDQitXcVFIbEdaQkRyNEJ4K1NMVEU0SUpjNUpU?=
 =?utf-8?B?ODBCNXhpZGlqeEFYZllKczZUTkszY2l2a05maUhrSkNUbEJoKzVOdFFpMnJh?=
 =?utf-8?B?QnY2NHlRN3UvNFk5cTEvUHZzY1RhNkRuRTRFSnAwSmlKd1I0aS9GOGlwbDFI?=
 =?utf-8?B?cGNjN29kTXBGNDhoLzlGY1kvMit4WUo4M2drT1V1YktOZlZpd0lpOThoR3NP?=
 =?utf-8?B?YlptYUtiWVhWZEJBWUVCVU4vQk5lU2Rjb2ZYZzZ3OFluM0VGRHZ5THBWWHRX?=
 =?utf-8?B?aWZIT1RtK1RST3U0SjdDQnNrWXh2eDQybUJTZm9lS0c4ZkpLTFFNUTdKSkV0?=
 =?utf-8?B?UFRFMUNVaFFFajJ1U2w0dWNYVTJzYmdaTTRxVjM4RHZXTkMxNHJPNzRhSkJu?=
 =?utf-8?B?QTByUFFPa1g5NXQzZjFzaytoN0tRK0xubXlDV1NkSEZzK0h4Yjg3MFFKVytJ?=
 =?utf-8?B?dVBkeHdzcmlHWEFsZWpQc1RqdE9vY01BekxOOG8xcjBJVjZCbVl1UE03K0t5?=
 =?utf-8?B?K1NzeHVlemg2Zm1Zb3ZucXdUbytaMmhyQlNYdnUxSmVoQnhoZ0RybS85djdI?=
 =?utf-8?B?czF3WmNGM2Y5NjQ4UHU5b3MyZkNmdTBRU1NMOVRCUnozR1ZxRmhNeG9HMllH?=
 =?utf-8?B?dHFNanlveGI2VVNYRng1N0V0dlFoelNyalZMU2huejhuNGpDSGlvdUNYc1hS?=
 =?utf-8?B?dHI4Vzk0Q1VnbThTcCtKRFV5anlnUHJSSUI5QjJVTXZoU09BU2hDQ0JNdXdn?=
 =?utf-8?B?ODM4NlhpQXJ1TmNqNFZ1Wll0VTJaaklkdTdBZlpTWEJQVHVCcGZvdndQZmk5?=
 =?utf-8?B?TGJleXhOVUlKdURmRDdlbU80cHl4VjJoRitkcGtXWXZKUEswcmJRMkNPRm5Z?=
 =?utf-8?Q?GAyI2JyODBBSq3T6/KEo0q8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c368af5d-535d-4bdf-34c0-08d9f51f4526
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 09:48:10.3496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrCNrr/w9UhM+gwcV/Q/evYdgdK6XqkoBmkGVM3jtQwnfUoqheeRa0kS2/yQnGPajOS5tS4FlIXuNFD7WVAvMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2179
X-OriginatorOrg: citrix.com

We are currently doing the Coverity Scans using a github workflow.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 crontab | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crontab b/crontab
index 8d9b31f1..f43e8bc5 100755
--- a/crontab
+++ b/crontab
@@ -12,7 +12,7 @@ MAILTO=osstest-admin@xenproject.org
 0		*	* * *		cd testing.git && BRANCHES=xen-unstable-smoke	./cr-for-branches branches -q "./cr-daily-branch --real"
 4-59/30		*	* * *		cd testing.git &&				./cr-for-branches branches -q "./cr-daily-branch --real"
 18		9	* * 1,3,5	cd testing.git && BRANCHES='linux-next freebsd-master' 	./cr-for-branches branches -w "./cr-daily-branch --real"
-18		9	* * 3,7		cd testing.git && BRANCHES=xen-unstable-coverity ./cr-for-branches branches -w "./cr-daily-branch --real"
+#18		9	* * 3,7		cd testing.git && BRANCHES=xen-unstable-coverity ./cr-for-branches branches -w "./cr-daily-branch --real"
 34		15	23 * *		cd testing.git && BRANCHES=examine		./cr-for-branches branches -w "./cr-daily-branch --real"
 18		4	* * *		cd testing.git && BRANCHES='linux-3.0 libvirt' ./cr-for-branches branches -w "./cr-daily-branch --real"
 6-59/15   	*	* * *		cd testing.git && EXTRA_BRANCHES='xen-unstable-smoke linux-3.0 libvirt freebsd-master' ./cr-for-branches bisects -w "./cr-try-bisect --real"
-- 
2.34.1


