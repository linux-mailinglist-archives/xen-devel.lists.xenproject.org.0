Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D327C74FFEC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 09:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561969.878525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJU22-0004Sb-7E; Wed, 12 Jul 2023 07:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561969.878525; Wed, 12 Jul 2023 07:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJU22-0004Pa-4F; Wed, 12 Jul 2023 07:13:02 +0000
Received: by outflank-mailman (input) for mailman id 561969;
 Wed, 12 Jul 2023 07:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=65J3=C6=citrix.com=prvs=55084c2ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qJU20-0004PR-SZ
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 07:13:01 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86848a48-2083-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 09:12:57 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jul 2023 03:12:50 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5707.namprd03.prod.outlook.com (2603:10b6:806:11f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 07:12:43 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::fb95:b992:be69:7fa2%5]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 07:12:43 +0000
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
X-Inumbo-ID: 86848a48-2083-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689145978;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gDtEYOIVKkNM8DHlF4QgEvQxuEse3ErTQWeE7PHdo8Y=;
  b=McreOtAznpcX1P7rcD1/LqwAEW0dDUutz3ofa7Tj3sQRNrWchql5C/3h
   2BVpxu9aX0Bu96bi/kCGSaWGKG9BG8PlgwTKQimfrnCcg8I+7nWAnLGm+
   1OUxzA0oP/JcoCv4cpOGDiAJyXYNz3lBLuFmJF/eKtG0k4vv7kHugljrA
   k=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 118506904
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gOaWLKr7Cr4n2BYd6t8WEIiBLWJeBmKPZBIvgKrLsJaIsI4StFCzt
 garIBnTb6mJMDD9et50bIy0pEtU7JTcytRkQAA4qiswECIS9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBziNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAG9OTDK/ltKb+uKicbBXm9sxIZXpf6pK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIK9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAdJPTOPprqICbFu76FNKCUxGEn6Ap8LlzU+dd+9kc
 g9I0397xUQ13AnxJjXnZDWjvHObtwQAHdpRF+E34huEzKb86gOVQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseIa3k9n0FDfY0
 z2M6i8kiN07h8MRy7+y+1yBhju2v4XIVSY8/ACRVWWghitHY4qia52t+ELsx/9KJ4aETXGMp
 HEB3cOZ6YgmF5iNiSjLW+QLE7GB7uyAdjbbhDZS84IJ8j2s/zumYtpW6TQnfkNxaJ5YIXnuf
 VPZvh5X6NlLJny2YKRrYoW3TcM30aznEtejXffRBjZTXqVMmMa81HkGTSatM6rFySDATYlX1
 U+nTPuR
IronPort-HdrOrdr: A9a23:YyWOd62ZCUdlklEVNsS/MgqjBU1yeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5AEtQ6uxpOMG7MAjhHO1OkPss1NaZLX/bUQ6TRuBfBOTZskLd8kHFh5dgPO
 JbAthD4b7LfBFHZKTBkXeF+r8bqbHtncDY5pa7vhAdKz2Gc5sQijuRSDzrY3GeLzM2f6bRYa
 Dsmvav0ADQBEj/AP7LfkXta9Kz7+Ej2aiWISIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMY/W
 3Mg2XCl+qeW6XQ8G6/60bjq7Bt3PfxwNpKA8KBzuIPLC/3twqubIN9H5WfoTEcuoiUmQ8Xue
 iJhy1lE9V46nvXcG3wiwDqwRPc3DEn7GKn4UOEgEHkvdfySFsBeox8bLpiA0PkAncbzZVBOe
 NwriekXqNsfFH9dfHGlp/1vxIDrDv5nZNtq59Js5UVa/pqVFZrl/1TwKpkKuZKIMuz0vFSLA
 BQNrCX2B93SyLVU5mLhBgv/DXrZAVxIj62BnEYvMqbyj5Xm2084Xc56aUk7yo93aN4coJD4e
 vcNKRuifVpde85KYxAJMppe7rsNoXie2O6DF6v
X-Talos-CUID: =?us-ascii?q?9a23=3ANF+hf2nq39sRVkWzWMR9yYkGvSXXOSKe7lXsMn+?=
 =?us-ascii?q?VMzZwc+SuVECC9f9m0OM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AqGm/Rg0JtnoquG64Gih81zyj2DUjzZv3CRFd1rA?=
 =?us-ascii?q?9vfLYci1TFwqm1Xfra9py?=
X-IronPort-AV: E=Sophos;i="6.01,199,1684814400"; 
   d="scan'208";a="118506904"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsLsnH6LWQajf5iCXiSDyZvxfrQGNAGBZ3N02ejzqGcbqKkwmuW5qiYUVyRw2fPWrnkRv/PLffdXVt6JrxOJvhVHUH3N7jruYmELb28E2CulcbfeMhm1Eea2B+N7pgVVkjQrLaWvkTdr8w4YbBrzt0kat2vuFRZPEx10fIhJJiueeCyxNBPfyM8sFSYqrb3aQ34qFzH90xcCQtUNyazhY99UQegd8F/uy7CiA+yNKj4DB8gITckYT2/RdDcQjGW93KpEvP8MNLwZWs8zd4nMSswnDxwrevlClOp5YDqYCJY1XDXorhrQF3o2IMV+bM9lwPAvQRyHrAo0VyxgpWdG/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZDuUCeOei3et9f1Pwy3Ob68Ck5ILt6WMR/7aoeuyHo=;
 b=YpNvcyPVTwikOoRZIBe24xpZHfmKC1tcV5Us6koetV2wuLG4vvImVZxjrQdCYNwut/H5F3cfn4xXSt7yaYk9gD/An/jYfw6zH27eAIC+dy7Fv5guNiyJT+f9t51JYwjnlld+RILq3fhfOGr0vslT7WDY1wHg5w8p3hX7rMEkSegzBMkjV0PUb22wuJoLgvaw0IsF3wyMDDpDXhH0rln4sYGkLqV3G83ePqf8oBY+5r0UD84Vxc5gaNujvWp/9K4gKRs+uTjzR93Kd9c7Rhv5NOktURuInE3dZrXwPefE909XlZmDYLtV04aYb5SYu+Xe3yy9jUeQuM2aNtwMpi57eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZDuUCeOei3et9f1Pwy3Ob68Ck5ILt6WMR/7aoeuyHo=;
 b=xMucyxNMjGdn5XjcKq4K1l4eaPKy2qzitknvuE5GabuIeJ+OXXof4B3tVMaikxG2tCb5ZQf68Ye2cooNcNU/ipXxfu+05bwsXxQMrE9Octjq46YRw9NgG4trE1MVUbE8bINgXsX0SlLk4Q9mRTQ10GrWFoHVaIVBN+EpbOfQylI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 12 Jul 2023 09:12:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v2] xen/arm: pci: fix check in pci_check_bar()
Message-ID: <ZK5SZGLBDGWFvo9m@MacBook-Air-de-Roger.local>
References: <20230711192829.744077-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711192829.744077-1-stewart.hildebrand@amd.com>
X-ClientProxiedBy: LO4P123CA0238.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb414be-7f1f-4de2-628e-08db82a7628b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RnicJqbqKFbD7zHr7x0R9tCd1vHSE/lPDG2z5gi5WfpImT9RtPPDsfcgIoUbmcRSb7Lr9QPMDc979tpM08salEfM4HiXqGTgrWgwzU9b1HVBH1Q+4RMIz9jjYwwgmUDFjMSvbQtAzi/zNj9UWry4xJVQRdrSjJEo0m55L5Aog/xLXMLxJ6zmYrL10vrMu4lL+IkA/pk17WhVe4hYQQg5sneK0S+rVBMEmUIL9sbh9ioNgi8A5iWOljixO3tMoLd6hFuJ5slUKdir0WFPVnaFDe8e8jDuzhTnhPtxIdvhpRl1dOuYzdD87fuHFGYQlC11aLiIUfweKkJ6sk3U0aRqqNoAtR5YgFAhATI2EGMFcCXkwcEyZTlvT24D2A/bdum4BkQfjEKqBhdXNp+xXcqunnyayjDi37+l27ffl6R7b+ay3D5VnMpy4P7mF6HHv4x5arwAoFCpHpmjJzyDIp8rGVtZIJgL5Xevd4jFbqZJaQ47VqGJ4ptBzNDQphG/h9QglQ0iv91vFoX/LghU6FfKxMKXGD+NRvx7F5CpnTyXiT7/qR1tp7emAfBzNS7AET1S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(41300700001)(8676002)(8936002)(6512007)(316002)(478600001)(54906003)(4326008)(6486002)(6916009)(66556008)(66476007)(66946007)(83380400001)(6506007)(9686003)(6666004)(38100700002)(82960400001)(86362001)(85182001)(5660300002)(26005)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cC9peUJzT2JpOTFCUzhTeFdVSUNHc29Rell4YXJBZ1hlOFNKSnVxUlhFVTB0?=
 =?utf-8?B?bFNtOFVBOXIrdjJzd25tY0RDUlZvQ2k1SzhVYS9qaXlsT1RIYUxpR1dSRXdu?=
 =?utf-8?B?V3A2TGw2VGtvTnROVFZ3a0hQOVMxcWgvMmV5MTVzYjFaSFBjYndMQnlWdTM1?=
 =?utf-8?B?OEVnenYrVi8vYkxEdmNiNUNhS1ViVjlJbXg4R3NiY0RYZzhOdE1VNmRpc2R5?=
 =?utf-8?B?cHV2bnAyTXFPbVNjVHMvd3RzZU1jTUhGUS9FWVY2Yy9wVnpGTVVBbnNzYUFU?=
 =?utf-8?B?eTlqQllpOWtSUXdIRjk2ZXRiRjUxN2dnYWhtS1VXMGhMeURQS2pNN3Q0Rll0?=
 =?utf-8?B?eVhiYXN6Tyt2dWluTUwrMlpwVTJTYXQrYS81QmJDeDhVeDlBZjZoczhEQzZI?=
 =?utf-8?B?OUNRNmRFbGkvWVMwek0vaEhjUDlER1FDaXZaRXZvVzdoREx3Sk9vdXNEZ1Fi?=
 =?utf-8?B?c2VHakdabSsxdFJ0cmpFdHNuMk91cktlRnZsT1NKS0J1UWNvQmd5RXJQRUxs?=
 =?utf-8?B?aDZyekpjSmZZaU11d0RGVjdnUEZQVzVFT2hOTldHZlRqbm5rNmZiMk1adGRk?=
 =?utf-8?B?bXZIQVpTUjNyNHJubysvelNleVJzcFRuWUlRY3hWL0tGb1o4WldMOGFBOVNv?=
 =?utf-8?B?TEFjbDMvdWV3RnFtdTNhUWhGSFZwQkV4eE9OOVhmQUl0M25VK0tGaTlQOHNX?=
 =?utf-8?B?WTRsaTRRaDBTQ0V6WlpIWnU2ZVo5V3dFRmdzMGV2MWlEa3JBc1E2aDFIVnVv?=
 =?utf-8?B?TzUzSGltdUJYM3NsKzN5YTVvMDRFYjlsbFRUaXZVMUZ5eFdIbGxicmREaEpz?=
 =?utf-8?B?azFQMHh4RnNRcTE5M0d2ZnJsM2Z6dTNuWW8vaWdiQVhPdjJLcEVXSkRmT211?=
 =?utf-8?B?TDFGWXFLd1FKNXRLRzErUHRMRUd5WEF2d2c5NVJjZ3c2VHk1cEdoWjJJZWJQ?=
 =?utf-8?B?K0syR2ZUSWlvTDhmTk9PdHE0M1lPREM1STRsVU9EWWo3azl2UkRKNEpsdldH?=
 =?utf-8?B?K3dSWXlSMU9EQ2RrTnd6b0pFK1R6NWJ5MzBMckdzblo0cHQwZ0JlS2pFNTVP?=
 =?utf-8?B?QXdhZzBoZjI4QUNINitDY1ZQS3cvU2tCUFNzRlNyVnpMQWxsZjNtZ3IvcjJU?=
 =?utf-8?B?WkU2dVRYL0hhTkZzc0dxZkhWV1lCTHdaQ0V1OFpiVVZzZDNqbnRiNFhRS0p1?=
 =?utf-8?B?bUQxengzMlpNeFc3K24zdUJaN0lmck9MUk5EcGFYK1IvNGcwT093QTZHOVdx?=
 =?utf-8?B?dlV2bmtjSXczcUVqY1lhQnVUanoxWWJjSHZkaUVGNHdFaUpLNmc2a2lSbVRa?=
 =?utf-8?B?bUxUN0wvZi9WOWd3eFlUMlhOVm1CWllTMXNPNFBxNGZIS1RGWUREd1hPdHBC?=
 =?utf-8?B?S3FHTkZidENQRVBHa0lGNDN4cFVDQzg0UzJidkJlcU9yN3AvbUhkQjcyb2pT?=
 =?utf-8?B?M1hYZy9GNjVHWHlMMmhIYkdpemV4M1B1RDVUamhqVkZXSDh2SytvQVZyMHdQ?=
 =?utf-8?B?aWFFYzFNRUJKYi8xZnVka2hWQVo0dXZZRFEySy9xZUwvM0VQQUExWmZncDAx?=
 =?utf-8?B?dXZiV3dGQ1Rxb3lGMEhxaWhMdzN5WXZSSVlhUnhnYmdjQlNMVjliWWZuQ3RE?=
 =?utf-8?B?MG9uWUxySmNraTFVUjgwdjFDQm5UUFdYOERHS0Z3Y3Y4SmdXMDNaSzRxMFc4?=
 =?utf-8?B?Z0J3a05Wa2toTFN3eWR3amZnckluYnQrekcrYUpHekZHTGVyNDBKRzRRaG4z?=
 =?utf-8?B?QnpXZ2I5WlE3QnZlRHFVRmxZTWkrbWJQZXBwOXdCVFYveXhMaG1yOTJjb1Fz?=
 =?utf-8?B?cDNyYW5MRUx5RlFadGxvNUxGVnk2MlRHSzhSMDd4dlhRdCtWUXU2Mk1UYk9q?=
 =?utf-8?B?NS9QWS9QajlkdFRnUTZOSFFkcHhBWUZ1eDViTmppWm5QcHFtNE5GSXphUDlM?=
 =?utf-8?B?S3ZEbHhYTkpjdG1kZFUrb1lZOFhieFJqSFQ0WjkvaU5uVTRSamRON29VOFBB?=
 =?utf-8?B?cVhXdHlTZnk5bi9CdXcvTUFDT1FlZjA2MmNYOWNhdWNDL3B0ZUExRkxDN2lm?=
 =?utf-8?B?cFJLSGZkaTlIYncxN3hySnFqU3JHS1lOOHY4V3I1aEpHVTNOVEorYkJFamJP?=
 =?utf-8?B?Y3djMkFFT1lrMFlwR2ZRU1R0VHJPY3Z3ek9ISC9kUDRmZzVNb1hwaUlUZHJ5?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Az3di03d3l6pooRX/AurW1f7vnL+nX0ISvTy3u4/emLv0fIe/XocihG3MVc8JdpWM/I4dgXIxQ7KJpJ+gJ8PJ53KpANPrJO3rWFM11ZUzWXNeM3M2jxuvlMcL8RGokT2D2qSwX+hTpbqzwzdVHBzlIc+0lTnB63AfdC/MumGiYryVMMpbrwggR4w+0CqSGy3vE4o+5d+lDXeMyNKv0kvagk50tYUSZ2ullYntVjLllq6NC3HsOs393L4UDjTwcrcNkmfsHDvUahFAm49bQxrJiAXuPRMqcwv0u6Ib+zjfANM81lo2nWdRCd07WqQ3KzqoTd3BRvnNziEWK/9KqdR7zEBH40xaLU1nC60BJJvZiN1cg3OUkJCFOpHMuAQ4jylsjVf/XVnoDYLy3sdSY+BPDobviIb+6JqcYnXCkdxat84CYMO3r36U7/c3ZogMYHNplu8ZD2Jh9ttDCV+mQO4uN1nD4K4o3gps7qdc6zUbn6CoEd9S6dvoKkYw1yqu+CidoW+r8oF5UhlQeAWOviksQeNvBIQX2wvA2cFNa/xKmjuIoEXAp5qvMbNjJMcs0ME/MckF/HfFd6v1Mxhq3jYV9YyalQwt2vkfQWqU30RiZh7ac3R3hs0VT6M1/E48QUIjfDo5Rnz0SGjorYuTVnmxsPz/VcOtf048ELnnbL1UJ1Il0mQ2pYPrQkI717zmu5VfdY1mq6Y1fYyZ6a17Pu67LwXJ8QuN/V47EBSQUim4P4dcC3zEw14cxsv6Yj6eyA7r4A9UdQ8FIc8CPeycWyUGomy2/uTmGRZhvvDrNvlujLqrn1Q2aL4lWWF82A0fr/UsKq4oSc6nOJZk6BQmZXyX9oOhxHCDlEMQJYtYY7i2pL6m+GD6gy1gahTN62MYb9mG94UQ7zFIKMj4Rcrk9ykSg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb414be-7f1f-4de2-628e-08db82a7628b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 07:12:43.1240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UyoOy8cNoBB9UJ+9BFcSApnddFnUSV9vPTyWHX7NaMkL8JRjpCTLBqJNn2E9F14p93cujUEYbYFFWuvx4l4Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5707

On Tue, Jul 11, 2023 at 03:28:28PM -0400, Stewart Hildebrand wrote:
> When mapping BARs for vPCI, it's valid for a BAR start address to equal the BAR
> end address (i.e. s == e) since e is inclusive. However, pci_check_bar()
> currently returns false in this case, which results in Xen not mapping the BAR.
> In this example boot log, Linux has mapped the BARs, but since Xen did not map
> them, Linux encounters a data abort and panics:

I would maybe reword this a bit to clarify that Xen has not mapped the
BARs in the guest second stage page tables, 'Xen is not mapping the
BAR' is IMO too vague.

> 
> [    2.593300] pci 0000:00:00.0: BAR 0: assigned [mem 0x50008000-0x50008fff]
> [    2.593682] pci 0000:00:00.0: BAR 2: assigned [mem 0x50009000-0x50009fff]
> [    2.594066] pci 0000:00:00.0: BAR 4: assigned [mem 0x5000a000-0x5000afff]
> ...
> [    2.810502] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
> (XEN) 0000:00:00.0: not mapping BAR [50008, 50008] invalid position
> (XEN) 0000:00:00.0: not mapping BAR [50009, 50009] invalid position
> (XEN) 0000:00:00.0: not mapping BAR [5000a, 5000a] invalid position
> [    2.817502] virtio-pci 0000:00:00.0: virtio_pci: leaving for legacy driver
> [    2.817853] virtio-pci 0000:00:00.0: enabling bus mastering
> (XEN) arch/arm/traps.c:1992:d0v0 HSR=0x00000093010045 pc=0xffff8000089507d4 gva=0xffff80000c46d012 gpa=0x00000050008012
> [    2.818397] Unable to handle kernel ttbr address size fault at virtual address ffff80000c46d012
> ...
> 
> Since e is inclusive, drop the equality check.
> 
> Also, adjust e to include the whole page. This increases the accuracy of the
> subsequent is_bar_valid check.

I think you want to reorder those sentences, when e is adjusted to
account for the full page s == e is actually impossible, hence the =
part of the check can be dropped:

"Adjust the end physical address to account for the full page when
converting from mfn, at which point start and end cannot be equal, so
drop the equal check in the condition."

Or something similar.

The rest LGTM.

> 
> Fixes: cc80e2bab0d0 ("xen/pci: replace call to is_memory_hole to pci_check_bar")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

With the above adjusted:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

