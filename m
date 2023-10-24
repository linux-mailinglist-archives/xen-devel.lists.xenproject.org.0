Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375747D5357
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622006.969051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHsR-0008HJ-Gg; Tue, 24 Oct 2023 13:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622006.969051; Tue, 24 Oct 2023 13:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHsR-0008EP-D8; Tue, 24 Oct 2023 13:55:23 +0000
Received: by outflank-mailman (input) for mailman id 622006;
 Tue, 24 Oct 2023 13:55:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtWs=GG=citrix.com=prvs=654e64a5b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvHsP-0008EJ-IB
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:55:21 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f63d67c3-7274-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 15:55:19 +0200 (CEST)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2023 09:55:15 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB4983.namprd03.prod.outlook.com (2603:10b6:a03:1e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Tue, 24 Oct
 2023 13:55:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 13:55:12 +0000
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
X-Inumbo-ID: f63d67c3-7274-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698155719;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=502XBgEwxn9TErS7zbWrM4f0tWE7agvNq20pg7imh/0=;
  b=W6HZ7ds77CKIFYIa8BP0NjC3CGWI4bsjvhzjsC5Xpvl0goUqoiE3tVzo
   y3w7httLshYiOxdo/LimX48TGO0/1w2ETEgKuqCeJVWtPkhgYjFMF+xif
   aDeaTcQE9XC/z4fvuNKU9ZXHSSCYkZELCPV1fZ2nQ3gPasVHKnKiKRv+p
   o=;
X-CSE-ConnectionGUID: 1aF1dPr/Q6iy5lDrZiG82w==
X-CSE-MsgGUID: Qop0uy/sSZCvFfZ9KeL4dg==
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 126927750
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:i+m58K/qLnSKPoVYPHcDDrUDTn+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zcZCjzVOfmMamv2KtF+btjg9UhSvJfTndQxSwZuqyw8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPaoX5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkX/
 NJBJAgXKSndhvPrxJ6heOhD1p48eZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUvgdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVw3KhB91PTNVU8NZTh0XL231UEyYkfkWVr8voqUOaB95Qf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmL+ITXOQ8J+EoDX0PjIaRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vXqHRngz
 jbMqzIx74j/luYO3qS/uFvA2jSlo8GQShZvv1uGGGW48gl+eYipIZSy7kTW5upBK4DfSUSdu
 H8DmI6V6+Vm4YyxqRFhid4lRNmBj8tp+hWG6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:TwCYD67r6fd9bl0DUQPXwPLXdLJyesId70hD6qkRc203TiX8ra
 uTdZsguSMc5Ax/ZJhCo7C90cu7L080nKQdieN9AV7IZmjbUQWTXeZfxLqn7zr8GzDvss5xvJ
 0QFZSW0eeAaGSSW/yKhDVQuOxQouW6zA==
X-Talos-CUID: 9a23:L9nLp2Oo5AWzBO5DASBJrUIsAIccLHzMkXP8OX25JjYzV+jA
X-Talos-MUID: 9a23:+7CAAQm6hnAE5RNNQhb8dnpbM98w/rXpE3s/uosotfvVFiFUZzuS2WE=
X-IronPort-AV: E=Sophos;i="6.03,247,1694750400"; 
   d="scan'208";a="126927750"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNxMNOir04CEOVKCM1Mo7jo0y2N+qJuPZIiDuZf45Y03fp/UJVonRix+Oi/WBsP2aeAwB3ioxfJ3FRSuCvi9T1fFdlCGQhTx9cQF7zljYbEZw/WPKtd8W1h+wRsSEgDujw+h8RzpXIb6jIYlczMdpxTWWIT9PJkZb9t47wOmHotltXbbRCESLH1P+XxpWpBwzbsMSbWmbBqlQKE47VwWCF1582ANXbTSvfDQKjGp5R1WFLR2JSwWh+2bzcQHgwCiMEiUFlXBiaB5KpJi6j9jruqFOLbgIdoPzCFg8U5Gz6Iipbw9v1250Jkm4sWzKSpe3a9FBUuWajSWg1qN7+Zadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNkMhdC+rCaRlp+Tt4F04Pgskhxq/sWocxlpcspEf1I=;
 b=WqEDc8VyjqKZwpbgAw0CvZbMGCMh4JV0EA7xZWvmjsBP7ebM8jHCDho4QlOBYdV9ICuGnjkIuj61RDokTdfCE3duyrKq55L43L82GbHsh7gviroXllP8/L6GFuVcB0x8JDhZ8sZWvZ+ihXBiAJYD/Z6XT0zDMAwPA7K+E2dMIFp4nVe5fjGpNGEWK4JgJh6qqceo119mSlspRh5B67oiLp1saKKmIReZJQrOuvD2uyki4cgYI1VShsyLb+RuKgAQyyWa9ECru4/rTpSf+FLuzEwjgikfMr8c4pLS7gxMrwUS9VemBm0L9JwQI0+B4YDZRaXJaBwJcH7q1FSIr6C7KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNkMhdC+rCaRlp+Tt4F04Pgskhxq/sWocxlpcspEf1I=;
 b=NANA+rlvdo647uidbGHMPAuammBIs7od4v4OIfunNic0o8cim+pQ+WXxqEo4JRAGuX55EwUWjYF6O97dROgxyWkJpzGg8JDst9ZFmK8O5UNlyNpGQegnaePC6cG7BSKGSrhKIqyQizIj4YAs6kkNQfy93rcTeIKusU9lD+V9seg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Date: Tue, 24 Oct 2023 15:51:50 +0200
Message-ID: <20231024135150.49232-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0382.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: c61ccb99-dc60-4ac0-fa42-08dbd498d729
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VEffyVUemcElPj0aUo4VReqVMM3YTmFmJGT1IO6kdZmEcjkdjjAUuEWj/6OWc+H6FYxRbdBU109SnKSASWnjAW+yFW19UE3QUYdraTUdKbz+pbgdiWIwoPeJ6DyIRN/Hd/iDiE8daoKHVqIWNBvXYv0LoyO6rG/cfXHqHfsShMhg+d0i5xTdn4Yozg9uRRWV3Wq+g9d3kQ7uCTCOgsPWAjgNbADZW8aHlzXnDYscQSxCIw40Me1dSwWNy+uLE3KBtyhoi/AsTv8qSPHu/X3WL721LJOcdQcDUpjLSOU+TJsnzh0aRcNsiN+6OMGw4gNDb8cp1TjjtZvF5YZjA75AtpuRrB31o2UvkW33/L1WH1vcuHDTyuz+h/07qIBV02511z5xPwyCsp+GkTK144w94OTgY+I/nakVqZ7Wu+J+FYbqGIaXBWZb/HMh2CIKzJwkdBsw0cSTU/vy3vwHaLgqCOHNMZ42lzR9H5yjWz48yzFxc5b1oLV0OO2RCZWXooo6W6854+kxb3SvnCl1Nl9t+uCNO9Tuhfkq6OTu/1eCgi6PeiHepn1CwH9HvA9WR7yz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(366004)(39860400002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(83380400001)(6506007)(6666004)(2616005)(6486002)(8676002)(41300700001)(38100700002)(66556008)(4326008)(54906003)(8936002)(66946007)(316002)(6916009)(66476007)(26005)(478600001)(82960400001)(1076003)(6512007)(5660300002)(36756003)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUFQbGVmeUhBZC85eXpJV1Jsbm81OG4wejRxaEJDbWhGNWFpYlZJMU9DUTY4?=
 =?utf-8?B?UVh2UmVKcit5VXNQcUpwV3J5dVVkbVlzaWtkQXNXaEU3ZzNlK1hFdTZLZkxM?=
 =?utf-8?B?dVhjbS9rekVLODhucXptbnFQaVNzYjBwc0pLWERkYU5BZnlPRXhoNVkySGtu?=
 =?utf-8?B?QXUwc3luR044NFhxSGFuNmM1VE9sdWlMWHJtSkI0OUg1WVZpTnJkTDVWUmpz?=
 =?utf-8?B?ZVZTYUtjUURKN1NmZ3ltbEdwWWllVm1XQWtXTkI1OCtUa0Q1bXB6aXdVLzNE?=
 =?utf-8?B?WDR6WEx5akg2ZnJYc2E3NEFROUd5cVkxRXBmYkp4R3RlWVo1SFJ6M1FRcEZI?=
 =?utf-8?B?TG9YWjV1cHV1RkU4bFhyTkZBSjJrOGRDZmMvMUZibU9sOWhkL1huVktnU2Fx?=
 =?utf-8?B?b0MxWnFNNnByN2x2QVcxNkhwaUdGKy9EVEd5YkkrSzJ0VDVCTmVNVVdheFRV?=
 =?utf-8?B?dHRLZzdyYWZjSGs0YUxkMXZyamt5ZHpXZjJ4cVNFNXNHVUZLQnFaRWFJUy9J?=
 =?utf-8?B?L3FYVXJPMjJURDhaZ2dMWjNFdml0NHdmWG5GSVkrR1YrTE1OMkdxeHQ1bnhj?=
 =?utf-8?B?YlFielBzL1BydCtoU1ViSWxIZE5YWFc1Wmd0SEFwZWlUZ3BUa0N3TVJkR1Jh?=
 =?utf-8?B?L0xLcG9ZenNZOXlOZTVaWExaajNtL0VCeGlCV2FLYktibGVWdUVvWXluRDh0?=
 =?utf-8?B?UlN6MkR3eXRPKzR6dmJXZnJYTkNwSlZTM3dyNjRnbmZVZFRWU2NuWjJ2TDlC?=
 =?utf-8?B?L0RzemZyblc4K0lKR0N6cmNRblhENFJ2OXBTeFNNZkQ2YUV4UGZmcU5ReS81?=
 =?utf-8?B?N2dKV0xWUnE3Zkl3azQ2ekZvRDBJOWtYRVQxTXVQelE5WHUzb1MvZmtnTmky?=
 =?utf-8?B?VlYvcytqUzhjTzRGYVdKTk1UckNIQmxYRjIxNTg0cG1MemtzN3pWQXB0SXRu?=
 =?utf-8?B?NldvdktyNEdWdC9XSDFKZFlIUmRQQzFDNnMyNk1zc25oRTlMSTFxczZ3Vk53?=
 =?utf-8?B?anZVUDQyczdxSzRrbE42VWI0dE4zWCsxeEo0M3dTWDZPVk9MNFZuRWc3eUps?=
 =?utf-8?B?TWRhOFR2SXNtUVBXVUtYMnRoUGRrQVpQS1FXMXNvTmlPNU5UY2dVWHB6U0Rq?=
 =?utf-8?B?Yi81ZjNtQ2lqK0JlVDVwNTVnLyttUlVObEtkRFNkeUtQeFE2NWdxcWpzQk8r?=
 =?utf-8?B?R29RdHQyTlI1VUhIYTdIZlNwamRPMmhJc1V0cEdqQTNwQ3Iyc2ZNRXdGdHp6?=
 =?utf-8?B?ampGamVqNHBXSTYrUUtDZ1BidlA2M0h2bVkwRjRRWGdMTUJkTERzQzFHSXlT?=
 =?utf-8?B?UVkrbzZqREk3T3RRYkpGTmJwdmwyM1orb0l3UHU0ck9rZy9wblZOZUt4a3R4?=
 =?utf-8?B?a0FFbTY0amd6WmpKTDkrYTYrWTdFNHZudTdGdzFSQ2t1cXVkUGFqYjNkSEJL?=
 =?utf-8?B?bUs0bThpZW9CeTVwaHFneGk3cEFzNzYvQXV3L1pqNmpZWENqQVZvVnhvNnNp?=
 =?utf-8?B?RGxaS3ltcXRKQTZsZ1hXSXh2L0tVVkF6aGJ5OXBJNnZGd2hvdnM3MFJqbFJD?=
 =?utf-8?B?czhRYnN6b203R2hvOHNoSko3R3NpUWhlV3hiN2M3YnE4Zmd3WHJqUmZjcHVV?=
 =?utf-8?B?eWhwZnpXS0Y2S3RHaHFmcDF4OExGdk5JSHRRT2lJZjRzYmdhTU5ydTJnV0Fo?=
 =?utf-8?B?Q3FNdXBLVlkxYnJ6NzFlNmFndXhmSm15RHQvbUM2R3RBcjdNdnZSN01zVjdr?=
 =?utf-8?B?UFh5QmxFV29CK2NuNmR0ZlZvUDdhcytpcTdFMGo4eThwZzBBakJpVThDNUxk?=
 =?utf-8?B?cVNwRU5KQis1UnZZbVVvWG9SSDZvcTZvaFVGc2QreDY1UzQ0YmNlNXRmMUh0?=
 =?utf-8?B?c3pqWXJuNEdnRHlMbzRNUVl4SllialUzdG5kYnBCdWJkNlRjUzFoVUdHN3Rq?=
 =?utf-8?B?NHNlVjI3MjRXK1M0dVhTTW5IS3VBWDF1ZjRtSTFkeC9YZkx0V25SWXQzQnph?=
 =?utf-8?B?UnBKMUt2UG9zTlYzb0xTc2JQRjhWQklLeEgzMFpSMkhoSk0ydlQ2QitlUXdF?=
 =?utf-8?B?OW1UR0Nvc3psVlcvSlgyRWx4bGo3WTRZSXJFU0R3QVpDVkIvWllJS3NyWkRt?=
 =?utf-8?Q?BTF5XjxMctidUfULjXKaBXgIR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TJ4J7K8c5RjaFHa4hrc3dt7kDTyyTRsrLlte49mh+DVuvQr7PTDJIKeb7nXcdwOAsablPScQtNb+QmzfT3K3RItG1nFOO42Cms+AxEtSCCglsAQ42ALi1zCYqFXIcYbG2rVByQCjHvpjZRFMJr16LncHcnR4m4l2rtO2IN8bQQ3fXNSqekwSL8TvEXqQ+E3LWyuv4BQTfdZy4m0GiJ8Bb8MGoKCitv8gnhgMCrG9lPYvBVKdU2Kui8P8U+DSpAfKpe8Oz4zHtNATCtnTGNZo/Tegve/U4Qps1fUYTI6Kth8gwNs+Liuc6kYgbJymnSgrUzSUPUmKzwsOuoKzwke59DUhfkIjSnVo3Bhr//sziZT9xSyl+VbeWXHgd8zCRh8Rl+A70dBi/4GNZFr15Jw3JBhQe6s5DclXyNxIfHRA4tExeTOoEnRbHhApaz7+J/dkLcJYjooyUmc6XJiLcWyJHxwD4yNJlx6ri0oTP3MSPn/xFSQ9N/IogiJb5O27L9En+IG5rfYGii6arCxTS5KUmZS4r7AND8N3gDz8Nn2ykF6342EQRSldEhMWwmMopeNKPo/TxmCXVC3hwGV9T1it5PYW+JZh1vsEvHd2dio/HIsS30RK5WdBdI83/FG3ZiIosOJndGzbIgaA84D8pmMyDBH/QXVMJXUFS7MKQ1sDtgGWup4GTQsJQ+P1X7pabu5mHqFaBmlK9w3E3R5AlkjGVfKgThdvF1VpTcjpmRb/mePGgPoxOXoPQCDM+gTJ/xK+UtLNOGImH9JGIYyPQT11SZAt+E5JkTbFuwr8g/q+DHhXSLOqQA2hfZ2mKD802GHMQlnKshdv99zvIJ0kwyOK+ola7IaJ1jYI2mQEnjirJrQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61ccb99-dc60-4ac0-fa42-08dbd498d729
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 13:55:11.9897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BufEUXMxK+Bp9lB92GnNovJCfzE2e20RtaiOpFTDExy/pN25PkXHZpyTqPiC2q5bdu2aAfK9WfaZHp85mEipOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4983

The current implementation of x2APIC requires to either use Cluster Logical or
Physical mode for all interrupts.  However the selection of Physical vs Logical
is not done at APIC setup, an APIC can be addressed both in Physical or Logical
destination modes concurrently.

Introduce a new x2APIC mode called mixed, which uses Logical Cluster mode for
IPIs, and Physical mode for external interrupts, thus attempting to use the
best method for each interrupt type.

Using Physical mode for external interrupts allows more vectors to be used, and
interrupt balancing to be more accurate.

Using Logical Cluster mode for IPIs allows less accesses to the ICR register
when sending those, as multiple CPUs can be targeted with a single ICR register
write.

A simple test calling flush_tlb_all() 10000 times in a tight loop on a 96 CPU
box gives the following average figures:

Physical mode: 26617931ns
Mixed mode:    23865337ns

So ~10% improvement versus plain Physical mode.  Note that Xen uses Cluster
mode by default, and hence is already using the fastest way for IPI delivery at
the cost of reducing the amount of vectors available system-wide.

Make the newly introduced mode the default one.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Do we want to keep a full Logical Cluster mode available?  I don't see a reason
to target external interrupts in Logical Cluster mode, but maybe there's
something I'm missing.

It's not clear to me whether the ACPI FADT flags are meant to apply only to
external interrupt delivery mode, or also to IPI delivery.  If
ACPI_FADT_APIC_PHYSICAL is only meant to apply to external interrupts and not
IPIs then we could possibly get rid of physical mode IPI delivery.

Still need to put this under XenServer extensive testing, but wanted to get
some feedback before in case approach greatly changes.

Based on top of 'x86/x2apic: remove usage of ACPI_FADT_APIC_CLUSTER'
---
 docs/misc/xen-command-line.pandoc | 11 ++++
 xen/arch/x86/Kconfig              | 37 ++++++++++---
 xen/arch/x86/genapic/x2apic.c     | 87 ++++++++++++++++++++++---------
 3 files changed, 104 insertions(+), 31 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 6b07d0f3a17f..09c6f17b4b02 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2802,6 +2802,14 @@ the watchdog.
 
 Permit use of x2apic setup for SMP environments.
 
+### x2apic-mode (x86)
+> `= physical | cluster | mixed`
+
+> Default: `physical` if **FADT** mandates physical mode, `mixed` otherwise.
+
+In the case that x2apic is in use, this option switches between modes to
+address APICs in the system as interrupt destinations.
+
 ### x2apic_phys (x86)
 > `= <boolean>`
 
@@ -2812,6 +2820,9 @@ In the case that x2apic is in use, this option switches between physical and
 clustered mode.  The default, given no hint from the **FADT**, is cluster
 mode.
 
+**WARNING: `x2apic_phys` is deprecated and superseded by `x2apic-mode`.
+The later takes precedence if both are set.**
+
 ### xenheap_megabytes (arm32)
 > `= <size>`
 
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index eac77573bd75..a44d63b5c8dc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -228,11 +228,18 @@ config XEN_ALIGN_2M
 
 endchoice
 
-config X2APIC_PHYSICAL
-	bool "x2APIC Physical Destination mode"
-	help
-	  Use x2APIC Physical Destination mode by default when available.
+choice
+	prompt "x2APIC Destination mode"
+	default X2APIC_MIXED
+	---help---
+	  Select APIC addressing when x2APIC is enabled.
 
+	  The default mode is mixed which should provide the best aspects
+	  of both physical and cluster modes.
+
+config X2APIC_PHYSICAL
+       tristate "Physical Destination mode"
+	---help---
 	  When using this mode APICs are addressed using the Physical
 	  Destination mode, which allows using all dynamic vectors on each
 	  CPU independently.
@@ -242,9 +249,27 @@ config X2APIC_PHYSICAL
 	  destination inter processor interrupts (IPIs) slightly slower than
 	  Logical Destination mode.
 
-	  The mode when this option is not selected is Logical Destination.
+config X2APIC_CLUSTER
+	tristate "Cluster Destination mode"
+	---help---
+	  When using this mode APICs are addressed using the Cluster Logical
+	  Destination mode.
 
-	  If unsure, say N.
+	  Cluster Destination has the benefit of sending IPIs faster since
+	  multiple APICs can be targeted as destinations of a single IPI.
+	  However the vector space is shared between all CPUs on the cluster,
+	  and hence using this mode reduces the number of available vectors
+	  when compared to Physical mode.
+
+config X2APIC_MIXED
+	tristate "Mixed Destination mode"
+	---help---
+	  When using this mode APICs are addressed using the Cluster Logical
+	  Destination mode for IPIs and Physical mode for external interrupts.
+
+	  Should provide the best of both modes.
+
+endchoice
 
 config GUEST
 	bool
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 707deef98c27..15632cc7332e 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -180,6 +180,25 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
     .send_IPI_self = send_IPI_self_x2apic
 };
 
+/*
+ * Mixed x2APIC mode: use physical for external (device) interrupts, and
+ * cluster for inter processor interrupt.  Such mode has the benefits of not
+ * sharing the vector space with all CPUs on the cluster, while still allows
+ * IPIs to be more efficiently delivered by not having to perform an ICR
+ * write for each target CPU.
+ */
+static const struct genapic __initconstrel apic_x2apic_mixed = {
+    APIC_INIT("x2apic_mixed", NULL),
+    /* NB: int_{delivery,dest}_mode are only used by non-IPI callers. */
+    .int_delivery_mode = dest_Fixed,
+    .int_dest_mode = 0 /* physical delivery */,
+    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
+    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
+    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
+    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
+    .send_IPI_self = send_IPI_self_x2apic
+};
+
 static int cf_check update_clusterinfo(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
@@ -220,38 +239,56 @@ static struct notifier_block x2apic_cpu_nfb = {
 static int8_t __initdata x2apic_phys = -1;
 boolean_param("x2apic_phys", x2apic_phys);
 
+enum {
+   unset, physical, cluster, mixed
+} static __initdata x2apic_mode = unset;
+
+static int __init parse_x2apic_mode(const char *s)
+{
+    if ( !cmdline_strcmp(s, "physical") )
+        x2apic_mode = physical;
+    else if ( !cmdline_strcmp(s, "cluster") )
+        x2apic_mode = cluster;
+    else if ( !cmdline_strcmp(s, "mixed") )
+        x2apic_mode = mixed;
+    else
+        return EINVAL;
+
+    return 0;
+}
+custom_param("x2apic-mode", parse_x2apic_mode);
+
 const struct genapic *__init apic_x2apic_probe(void)
 {
-    if ( x2apic_phys < 0 )
+    /* x2apic-mode option has preference over x2apic_phys. */
+    if ( x2apic_phys >= 0 && x2apic_mode == unset )
+        x2apic_mode = x2apic_phys ? physical : cluster;
+
+    if ( x2apic_mode == unset )
     {
-        /*
-         * Force physical mode if there's no (full) interrupt remapping support:
-         * The ID in clustered mode requires a 32 bit destination field due to
-         * the usage of the high 16 bits to hold the cluster ID.
-         */
-        x2apic_phys = iommu_intremap != iommu_intremap_full ||
-                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
-                      IS_ENABLED(CONFIG_X2APIC_PHYSICAL);
-    }
-    else if ( !x2apic_phys )
-        switch ( iommu_intremap )
+        if ( acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL )
         {
-        case iommu_intremap_off:
-        case iommu_intremap_restricted:
-            printk("WARNING: x2APIC cluster mode is not supported %s interrupt remapping -"
-                   " forcing phys mode\n",
-                   iommu_intremap == iommu_intremap_off ? "without"
-                                                        : "with restricted");
-            x2apic_phys = true;
-            break;
-
-        case iommu_intremap_full:
-            break;
+            printk(XENLOG_INFO "ACPI FADT forcing x2APIC physical mode\n");
+            x2apic_mode = physical;
         }
+        else
+            x2apic_mode = IS_ENABLED(CONFIG_X2APIC_MIXED) ? mixed
+                          : (IS_ENABLED(CONFIG_X2APIC_PHYSICAL) ? physical
+                                                                : cluster);
+    }
 
-    if ( x2apic_phys )
+    if ( x2apic_mode == physical )
         return &apic_x2apic_phys;
 
+    if ( x2apic_mode == cluster && iommu_intremap != iommu_intremap_full )
+    {
+        printk("WARNING: x2APIC cluster mode is not supported %s interrupt remapping -"
+               " forcing mixed mode\n",
+               iommu_intremap == iommu_intremap_off ? "without"
+                                                    : "with restricted");
+        x2apic_mode = mixed;
+    }
+
     if ( !this_cpu(cluster_cpus) )
     {
         update_clusterinfo(NULL, CPU_UP_PREPARE,
@@ -260,7 +297,7 @@ const struct genapic *__init apic_x2apic_probe(void)
         register_cpu_notifier(&x2apic_cpu_nfb);
     }
 
-    return &apic_x2apic_cluster;
+    return x2apic_mode == cluster ? &apic_x2apic_cluster : &apic_x2apic_mixed;
 }
 
 void __init check_x2apic_preenabled(void)
-- 
2.42.0


