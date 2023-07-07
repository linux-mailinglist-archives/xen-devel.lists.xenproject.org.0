Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DFB74B1F8
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 15:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560507.876472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHlhj-0008Le-SP; Fri, 07 Jul 2023 13:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560507.876472; Fri, 07 Jul 2023 13:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHlhj-0008Io-PI; Fri, 07 Jul 2023 13:40:59 +0000
Received: by outflank-mailman (input) for mailman id 560507;
 Fri, 07 Jul 2023 13:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GM+b=CZ=citrix.com=prvs=545203e5e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qHlhi-0008IP-0u
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 13:40:58 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e50a52f3-1ccb-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 15:40:55 +0200 (CEST)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2023 09:40:52 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by SA1PR03MB7056.namprd03.prod.outlook.com (2603:10b6:806:325::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 7 Jul
 2023 13:40:49 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 13:40:49 +0000
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
X-Inumbo-ID: e50a52f3-1ccb-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688737255;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fi0xmYWFRve/QS7cMINJGq5J3kU0Bi/DzYoFjpwMOVA=;
  b=U5+NxTazkwQTS91a7gRdMYH9k3IeP+f1ScgmAPSDbGm5qA0VMcZh1KUB
   6H7kNlJEYZm9V5qsEmtWwRF/BXG0+5tpSA7DfvUDpgJB8rZHLbAPXYcae
   iqrHftNA7w1oEtoZqaXUMfPN9GDuxzYu5LbMCNMrkbT/DeNU/vbc2LpJJ
   s=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 115500002
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fLObt6v5FQNWXq+PQlPZWup+7efnVOZfMUV32f8akzHdYApBsoF/q
 tZmKWGGM/mDZDT2L4tzaY+1pBwDupDRxoQ2HQM9/y43Qi1H+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACGyCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdgFRQB+furyN7YmKQ89Xmpt6Cuq7BdZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4W9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAd9PTOXgrqQCbFu7x21JEQxNbwOCnMKHlGmbQvBmd
 FwWw397xUQ13AnxJjXnZDW6vXqFsxg0S9dWVeog52ml0bbZ/A+DGi4ETzpNZdY8vck6bTUv2
 hmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kblQnTR9xuFKq0iNzdGjzqx
 T2O6i8kiN07h8MRy7+y+1yBhju2v4XIVSY8/ACRVWWghitHY4qia52t+ELsx/9KJ4aETXGMp
 HEB3cOZ6YgmCpWAlzeERukXK624/PaOMDDagllHEoEo8nKm/HvLVYlK/Dx7E0J4Pc8FdCHBb
 VfavEVa45o7AZexRap+Yob0AcJ6y6HlTI7hTqqNMYUIZYVtfgia+i0ofVSXw23mjEkrl+c4J
 IufdsGvS30dDMyL0QaLegvU6pdzrghW+I8ZbcmTI8iPuVZGWEOodA==
IronPort-HdrOrdr: A9a23:c+e9tKNdp/6q58BcT8/255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8Ar4WBkb+exoS5PwOk80lKQFqbX5Uo3SODUO1FHHEGgm1/qa/9SCIVy0ygc+79
 YGT0EWMrSZYTdHZITBkW+F+r0bsbq6GdWT9ILjJgBWPGNXgs9bjjtRO0K+KAlbVQNGDZ02GN
 614ddGnSOpfTA6f9m2HX4MWsnEvpnumIj9aRALKhY74E3W5AnYpYLSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WW2wLRzGja6rVRgZ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF6t2H2RIPqp
 3hsh0gN8N85zf6ZWeuuybg3AHmzXIH92Li4UXwuwqtneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBL7mjjn7dSgbWAlqqP0mwtirQcgtQ0dbWIsUs4SkWXZxjIRLH40JlO71GngKp
 grMCiT3ocQTbrQVQGigoAm+q3QYp10JGbLfqFKgL3o7xFG2H9+1EcW38oZgzMJ8488UYBN46
 DePr1vj6wmdL5gUUtRPpZ1fSKMMB24fTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPJgF1oE7lp
 jNWE5R8TdaQTOmNeSemJlQthzdSmS0WjrgjslY+phio7X5AL7mKzeKRlwim9ap5/8fHsrYUf
 CuP48+OY6UEUL+XYJSmwHuUZhbLncTFMUTp9YgQlqL5tnGL4X739arAso75ICdYgrMdlmPc0
 frBgKDW/moxnrbJEPQkVzWR27nfFD58NZ5DLXaltJjuLQwCg==
X-Talos-CUID: =?us-ascii?q?9a23=3AYKHWjGuw1sDuC5tFvXkjDFts6It7QyHzw2vtfXS?=
 =?us-ascii?q?VMldgboaJFga22/Ndxp8=3D?=
X-Talos-MUID: 9a23:lCX2Dgv2lAo4aUoCyc2nhTA4LdYz2fyXNXszj7Ijouu9ajxyAmLI
X-IronPort-AV: E=Sophos;i="6.01,187,1684814400"; 
   d="scan'208";a="115500002"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmgAIoeOyoc71H9AlzPwN87V2yF/f4sHQ5DWDf6YkSFTlUy6zXt6Pc/53jpKBU8gzTE/TB0egBetGjaumdyo/De+TI3uqdHMadW3tS+0McZlPBll/6AmWkeH5zG/5Us3DbQ9YIrYt8U5fQcby+ZjX8jQ7olI8JU/zv/3PF4V/IVYDEdrIUiuAmDeESUPWZLwSi4AJ5JAgiljt8PTRAThTGScWzIM8Xupnw/bKRZMAt9+RjaiC0VTE0879ROFxrG4IgCzr2I6oW2IiqaH2scLieUYOC1b8iHewKEFOZFYIz5ZMl+7JM2+8YY9ZWNJnCQNe2aqaJmkAFfm7Ham04xuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKqHOiBRlhA6MKR5OwHg83eo+1ILFlGtOUD75klLS/g=;
 b=VkExaI0mD/vF74fu+mnByZGz4jymdkzE2p2uuXCyD4G2wbKQuXxxc9W5IoOr3zFS59GBmU7R+BiUucz7CYX84I3W5j/lkzSWR8aDWrwFtAzzVh7uAzq+DnGcK+YI4FZ1ZzRyE+/i+0VDdjeKyfD0C12jQkWWDSQ9QIDt+Q3aWw/ljBqJd7JECqkD3Ly+IXwsbn2cIaJjam0xYOChOEqqWqod0cVrPc2cf/ydm2WPCIiK+F5OepdXxaSg7JPeHk/7MmPCKlK3sZ4I0/T1vlRNo2ofslFKBYmDB4sp/ULJrTo+CQWrNp1fOm7DWw0PRq0o2QzfAraPZ50Y7+4UwIfXYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKqHOiBRlhA6MKR5OwHg83eo+1ILFlGtOUD75klLS/g=;
 b=MnBa2g+80zp5KFf6lVPhbu2USOG4XmizOylx129us5vG3ZGurMqV3gP9RsyAN+Mpxt9fOk6gGCVAWlLpMGPv5u61rJReyRbEwV8F4PsvmcRH2+yHWLJbPOApc4ChywI43M4YDYCZKhRfS7TOk5HDCHe2rNeqQ35qLP/dbANxG4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 7 Jul 2023 15:40:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2 3/3] [FUTURE] xen/arm: enable vPCI for domUs
Message-ID: <ZKgV2x3PqUJUHdic@MacBook-Air-de-Roger.local>
References: <20230707014754.51333-4-stewart.hildebrand@amd.com>
 <e5a0ed8a-d85b-fb60-609a-f46884433c60@xen.org>
 <ZKfjoXqb6Kgav-vL@MacBook-Air-de-Roger.local>
 <04c05db8-1e15-f2c1-ebc1-0563d442a808@xen.org>
 <ZKftKtkjgFLWaW_x@MacBook-Air-de-Roger.local>
 <7f89a925-6c4e-7840-041b-2e0816ed7b71@xen.org>
 <ZKf4PMkKF3x2VwXl@MacBook-Air-de-Roger.local>
 <9ca3724c-6ee7-9853-524e-6f55b3702dc4@xen.org>
 <ZKgPZGXY7dkDLnQR@MacBook-Air-de-Roger.local>
 <78c0f004-4bdb-6f86-e42c-ec3f64d25dd3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78c0f004-4bdb-6f86-e42c-ec3f64d25dd3@xen.org>
X-ClientProxiedBy: LO2P265CA0451.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::31) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|SA1PR03MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0a1486-4766-4a7b-aac0-08db7eefc65f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eqRX1hHMl0Xdz7FSNi8FEfnqNjK246gxBuy0HDV5k3DSrvUAjQW0lOSUWA2SdWnu49HMlDt4OCbcFkpI6RFqqEUgt696h/7VXta8ewqt7ZuEYcLqoglT2QVcFNDRaLHBEH4cgKBMNdCmo+o3FXqTWRW6kX/vMAvCGDrQ03br5aBJAsfwNA/SFbaH89NzHzfmVbIscyjndoMI3Ecgc5EkmkpMrhkimrhz07vUDeWcV62O4yaa1PJgrgt0Uj146rF4gcPKWfjW0vgSghnkPCazIYTC1HLDFa0VEtRORXg1t7N7vV8WAB4Z4mkGscEjgdtT3BTPaIufAJsjVHIU8sDdOMh3weijflqe/ZAIck4m2EK3lCSUxVtwmwGUSDMyyMjjiJ/CGjpgtidRDODPrrsYub3zJeFPJW4BImothk6WKJkpSSZXwHtBSwM51bpOHYyupFAg+EcDQ+X2bNpMQB8nupl/AGAkhT1JIPeB7+iNwV+iKDA9xgaMssYPrU2XMDw8Hp/JcdJfj46hkzerSoL9Ol03vei+E4/7u2FvawworUAp9F7ZGqC+2sjtirfMDy2L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(451199021)(5660300002)(8936002)(8676002)(6916009)(4326008)(66556008)(66946007)(66476007)(41300700001)(316002)(54906003)(478600001)(6666004)(6486002)(6506007)(53546011)(6512007)(26005)(9686003)(2906002)(186003)(66899021)(82960400001)(38100700002)(83380400001)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWxnVFhjMkdLdk42S1VodUFDRlk0L3JLd3Z0SWRpb1FXSGt3d2s0djV1V0p6?=
 =?utf-8?B?NUg5OGJienR2bzNWbzNkN3BlRjZDclFTS2RRZG43dXR6c3MzSWVoeDZsd3pF?=
 =?utf-8?B?WmtLQ2djcWJVRnRqelQ1L040T1p4VWJ6MVpUVDBJWnk0cTA0Qm95aGp3bTlY?=
 =?utf-8?B?NXhYd3VvYkZ6MTJRaDVEUExnOTR1d2xGNkpIbGJOSGdVS1MzQ2FQSTBENTFi?=
 =?utf-8?B?aHV0aENQWmdmK1pleUVrWFJDVVJ5a2tHeTMrRit3WkJXTXNoSDlFTENJRGhz?=
 =?utf-8?B?aFA2M25RS3BWd1M1aWdSMU1PYkNMakkrYVkvalc0V1NHbjM3VDBuTXFMU3Nn?=
 =?utf-8?B?bkFueTc1QUpOMU1zb0pUbUx6bVBsVlJTQmk2VVV4WDV2bmxNQ0xTRGlaV25E?=
 =?utf-8?B?N0R4aWNIN2NDY3pMU2VqWmlHTmpNcG1Kb1Rkemt6dW4zbi93c1AyLzZMalAv?=
 =?utf-8?B?Wm16N0RvbFArMU8zNlMveDhwakQ4aHArUXRwRUNvQjV1V3gxNnR0dEFsMEpK?=
 =?utf-8?B?cGtocHM5WE5oU0xGM3EyeUxESnJoNGgzTmF0bk9VcHdmQ3dxZWN5a29LQVNh?=
 =?utf-8?B?Z3ZOYWVWMEJjTWhsYzdBNTg2d2NlWXZPaXlDc1oyZWlSNjlEVWxlTlpBZHlE?=
 =?utf-8?B?UFpLcGhaV2JPVjQ0eElwVXJJYWhKeS9vcVBpZ1BQb3VHdmpUdzRSdkhoQkNi?=
 =?utf-8?B?NXJ3dEVNbVV5dnplQmZCSHJwRjJNcmJPTjBNNFVKR2IzeXI0a2J4RklHOWFQ?=
 =?utf-8?B?MXBwaFo4R25WSUJwNlNUMG16d3BhQ3MrS0QvOUhsczRWRkRWQkFzQmEvcisv?=
 =?utf-8?B?SkhwWkNzL0dyQVZCcGFrQVhMSWRRVDRTOEdnYnB5TVYyNFo5OHZJelRvaHBn?=
 =?utf-8?B?TTJ3WHpxSStDdTBQTE1McDh4enVCa3F6QTE1ZUtnSFR3RHNTdTJqeVZMNWk5?=
 =?utf-8?B?K1VNdHZtZG4wYzZraXJBZ2dmTERtVURzbFZ0MXdOYWc1amJ5ZnJNYXZWNHdU?=
 =?utf-8?B?NTVPem1FRytXVVF3SERYZXRPbDdFUFR1QVFqc3RWVUQ2NDNnQkFjNDQ4QjJB?=
 =?utf-8?B?aExKZlZyemNLd25hUE9QMnlMbjRscWlYRndzeHIyY3NCWVRZTzlPZlR6a1ZH?=
 =?utf-8?B?VWtjMHRZOE8vUk5HRHJQVEZydC8vYXg5WExKU2tlRjNON0V6bGNuZzJSdFlz?=
 =?utf-8?B?NTFwRzlnNnBQOWQ3cy9FTE4vODJxM1dNWmZxaVRxbUI4SjVsM1QwQk5ib29y?=
 =?utf-8?B?OU5lZkxUdkcwZW1HM1BFV0NmeTdkeFhHY0QzM2ZwWG9HdUQ3ZFN2WTdDOWFF?=
 =?utf-8?B?S20zb3NUTDNBK0M5YjFaTHBpMm8ySzZDZ2hoeDNBb2I4LzUrZkYzTTlaSG14?=
 =?utf-8?B?WS9lSVNjUG83QmxJR3gveUI3Ujdta3RFckFhVjByUHBGME1CcmFoV01oUCtZ?=
 =?utf-8?B?d3J0Z09OY1FYcHpFNkhNSDBqSnNxSUFsOHpvVDUxUnFNRk5CdEE3eFVaWlNM?=
 =?utf-8?B?RFJRYzNoMWtvS0M2YXp0c2VGMHBvL09XbVgxL0l0RzZyd1JLUWg2ZGQ3RFoy?=
 =?utf-8?B?aGZDSE5TOFptR1laZlJVVDFSOEk2TG5mWWNVclNlNUhpWCs0Y1ZIOVhjWHBx?=
 =?utf-8?B?NEFvdGNvTnJJaktjenRSRFNOSjA5Y09idTJBeCt2TmtmWExyMEpRdnZVRis4?=
 =?utf-8?B?d3NKb2FwQ2M4Z2ZXQ2NGZ25SdFl4Ky83Uzl4Z1BONkJ3REZsMVovRVlKSTFu?=
 =?utf-8?B?bk9kenNEY0cva0c4eTBDSG5nS2ZiL1BlNjNYMXI5OXp6cjE3VlhFNUFUT0Jt?=
 =?utf-8?B?MWhQaDdUcU5sTTJFU0VmUlpzZHJIL1ZXY3lxUkV3ckYvMjBlTHdtTCt4Qnds?=
 =?utf-8?B?VXBzdFhvRGlQZWxTTHNKT1BGRkszR2htSGYxelVoWXlLc2FiYy85OURQT0JH?=
 =?utf-8?B?RjIvanJiWlRyWWdObVo2NVkyWVFJQzdGMGVSVzNQZTk4RWNPVkNXbUE1THJU?=
 =?utf-8?B?V0VMZERqZnBHNXlRYzBad1BYUWYyWWhGUGxtNGlKQUhhUjU5RW1hamZFTElT?=
 =?utf-8?B?WUdzV1pYTmlTcm94NkppWGFONUY0TkJlaWlaWlVINWZzRW01cm9Td1VtdlFZ?=
 =?utf-8?B?NjBPVjBKUy9lclEyQmNNNzZNcVlrKzhnOVNuNzl4S01vaHZvNE1aU2Uyb1dv?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	luKy5I9ZkzhDzSEbBwlGODTBZBDQ3HbeN3V1/+z3At3YhMZs066bdxhY5cTjLN3eqhl6tcUTKQs1G+gwEuJyV2pfy61s/YvqjUVxwm5GzgsmvBdOntDjpwqTQ9KiJg8HrUCzV/PDQf+n08lBA/cMirgtI58SK9a1fn9objFEYchcHuaYe2sH3IXfSq2cKDoY9BlCJCWUhb/FgeqOccpeF0gGs+8Ys3VhKNaVo3EA76G5/WVG8v2/ILMo9N3bVOV1nb5uo12YhJcTpK764t7E4SgMkgRa3HPk2ywvdV3MEvonpc952I357aADfADRrblOZmrjmWKYUcAFA/sz14nrcbM7OXrVb2tJy/kPKdGYyDfnXO0gTk4Ud9eKxw4yZJnT9038813v8u5Vllra0Hho+QNnz3DZJrfgtCGKCLt3WR86gkLVao4kjh67yqAZvPkrjkw3T1/EFNbBb3vD7CgHXJcpnkIuZG2LxjG8MMj0gMBOKrE63rLxiGKVhkGyY4HRZSbmG5bdquY/a83Z8vLzD1tm9n04jXJu82S/2/s91j1OucaqnBuTVxc2hoIuO0K6ejTO54RKqdNEnVw5ctSOc60fUn78e1YvIQSiT/fpVFQaw7nOn27EgvE5oAC+O8Kk8jObDsu8+5P2BGs0QGtIOhCq5Fi+nClMBpCdXw/1fdYn/MJ75S2g3Jieh+gY2Fn9ZOSyR+uvZ+sqE/fiS3rxK4la+yV57VQEdelOZrVrFeJowQrdkPOmQmwfWx8pxA5u8Ta0l8k+/2nJK333KWpV3IFR4WG9zy9eBl6rfE5tytRuJIbOU4PHkukW4Dfm4BNaHkepr8j5RHndBrUW27i+UMydKjerj0kv6PJvwUyTMx/26uGLpSfAk/MiFwnJSIBJ4XNGn5uaEm9+eJTqjhhzWQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0a1486-4766-4a7b-aac0-08db7eefc65f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 13:40:49.5883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2UjKLxwx6n+ErT9SEQO4n6KfCPaLsVdoL6Pq6r4P/AjT/J2xMSowxC5WMC34nrHfs80KwWvtqSXedUc3jqCzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7056

On Fri, Jul 07, 2023 at 02:27:17PM +0100, Julien Grall wrote:
> Hi,
> 
> On 07/07/2023 14:13, Roger Pau Monné wrote:
> > On Fri, Jul 07, 2023 at 01:09:40PM +0100, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 07/07/2023 12:34, Roger Pau Monné wrote:
> > > > On Fri, Jul 07, 2023 at 12:16:46PM +0100, Julien Grall wrote:
> > > > > 
> > > > > 
> > > > > On 07/07/2023 11:47, Roger Pau Monné wrote:
> > > > > > On Fri, Jul 07, 2023 at 11:33:14AM +0100, Julien Grall wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On 07/07/2023 11:06, Roger Pau Monné wrote:
> > > > > > > > On Fri, Jul 07, 2023 at 10:00:51AM +0100, Julien Grall wrote:
> > > > > > > > > On 07/07/2023 02:47, Stewart Hildebrand wrote:
> > > > > > > > > > Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
> > > > > > > > > > code base. It will be used by the vPCI series [1]. This patch is intended to be
> > > > > > > > > > merged as part of the vPCI series.
> > > > > > > > > > 
> > > > > > > > > > v1->v2:
> > > > > > > > > > * new patch
> > > > > > > > > > ---
> > > > > > > > > >       xen/arch/arm/Kconfig              | 1 +
> > > > > > > > > >       xen/arch/arm/include/asm/domain.h | 2 +-
> > > > > > > > > >       2 files changed, 2 insertions(+), 1 deletion(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > > > > > > > index 4e0cc421ad48..75dfa2f5a82d 100644
> > > > > > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > > > > > @@ -195,6 +195,7 @@ config PCI_PASSTHROUGH
> > > > > > > > > >       	depends on ARM_64
> > > > > > > > > >       	select HAS_PCI
> > > > > > > > > >       	select HAS_VPCI
> > > > > > > > > > +	select HAS_VPCI_GUEST_SUPPORT
> > > > > > > > > >       	default n
> > > > > > > > > >       	help
> > > > > > > > > >       	  This option enables PCI device passthrough
> > > > > > > > > > diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> > > > > > > > > > index 1a13965a26b8..6e016b00bae1 100644
> > > > > > > > > > --- a/xen/arch/arm/include/asm/domain.h
> > > > > > > > > > +++ b/xen/arch/arm/include/asm/domain.h
> > > > > > > > > > @@ -298,7 +298,7 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
> > > > > > > > > >       #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
> > > > > > > > > > -#define has_vpci(d) ({ IS_ENABLED(CONFIG_HAS_VPCI) && is_hardware_domain(d); })
> > > > > > > > > > +#define has_vpci(d)    ({ (void)(d); IS_ENABLED(CONFIG_HAS_VPCI); })
> > > > > > > > > 
> > > > > > > > > As I mentioned in the previous patch, wouldn't this enable vPCI
> > > > > > > > > unconditionally for all the domain? Shouldn't this be instead an optional
> > > > > > > > > feature which would be selected by the toolstack?
> > > > > > > > 
> > > > > > > > I do think so, at least on x86 we signal whether vPCI should be
> > > > > > > > enabled for a domain using xen_arch_domainconfig at domain creation.
> > > > > > > > 
> > > > > > > > Ideally we would like to do this on a per-device basis for domUs, so
> > > > > > > > we should consider adding a new flag to xen_domctl_assign_device in
> > > > > > > > order to signal whether the assigned device should use vPCI.
> > > > > > > 
> > > > > > > I am a bit confused with this paragraph. If the device is not using vPCI,
> > > > > > > how will it be exposed to the domain? Are you planning to support both vPCI
> > > > > > > and PV PCI passthrough for a same domain?
> > > > > > 
> > > > > > You could have an external device model handling it using the ioreq
> > > > > > interface, like we currently do passthrough for HVM guests.
> > > > > 
> > > > > IMHO, if one decide to use QEMU for emulating the host bridge, then there is
> > > > > limited point to also ask Xen to emulate the hostbridge for some other
> > > > > device. So what would be the use case where you would want to be a
> > > > > per-device basis decision?
> > > > 
> > > > You could also emulate the bridge in Xen and then have QEMU and
> > > > vPCI handle accesses to the PCI config space for different devices.
> > > > The ioreq interface already allows registering for config space
> > > > accesses on a per SBDF basis.
> > > > 
> > > > XenServer currently has a use-case where generic PCI device
> > > > passthrough is handled by QEMU, while some GPUs are passed through
> > > > using a custom emulator.  So some domains effectively end with a QEMU
> > > > instance and a custom emulator, I don't see why you couldn't
> > > > technically replace QEMU with vPCI in this scenario.
> > > > 
> > > > The PCI root complex might be emulated by QEMU, or ideally by Xen.
> > > > That shouldn't prevent other device models from handling accesses for
> > > > devices, as long as accesses to the ECAM region(s) are trapped and
> > > > decoded by Xen.  IOW: if we want bridges to be emulated by ioreq
> > > > servers we need to introduce an hypercall to register ECAM regions
> > > > with Xen so that it can decode accesses and forward them
> > > > appropriately.
> > > 
> > > Thanks for the clarification. Going back to the original discussion. Even
> > > with this setup, I think we still need to tell at domain creation whether
> > > vPCI will be used (think PCI hotplug).
> > 
> > Well, for PCI hotplug you will still need to execute a
> > XEN_DOMCTL_assign_device hypercall in order to assign the device, at
> > which point you could pass the vPCI flag.
> 
> I am probably missing something here. If you don't pass the vPCI flag at
> domain creation, wouldn't it mean that hostbridge would not be created until
> later? Are you thinking to make it unconditionally or hotplug it (even
> that's even possible)?

I think at domain creation more than a vPCI flag you want an 'emulate a
PCI bridge' flag.  Such flag will also be needed if in the future you
want to support virtio-pci devices for example, and those have nothing
do to do with vPCI.

> > 
> > What you likely want at domain create is whether the IOMMU should be
> > enabled or not, as we no longer allow late enabling of the IOMMU once
> > the domain has been created.
> > 
> > One question I have is whether Arm plans to allow exposing fully
> > emulated devices on the PCI config space, or that would be limited to
> > PCI device passthrough?
> 
> In the longer term, I would expect to have a mix of physical and emulated
> device (e.g. virtio).

That's what I would expect.

> > 
> > IOW: should an emulated PCI root complex be unconditionally exposed to
> > guests so that random ioreq servers can register for SBDF slots?
> 
> I would say no. The vPCI should only be added when the configuration
> requested it. This is to avoid exposing unnecessary emulation to a domain
> (not everyone will want to use a PCI hostbridge).

Right, then as replied above you might want a domain create flag to
signal whether to emulate a PCI bridge for the domain.

> > 
> > > After that, the device assignment hypercall could have a way to say whether
> > > the device will be emulated by vPCI. But I don't think this is necessary to
> > > have from day one as the ABI will be not stable (this is a DOMCTL).
> > 
> > Indeed, it's not a stable interface, but we might as well get
> > something sane if we have to plumb it through the tools.  Either if
> > it's a domain create flag or a device attach flag you will need some
> > plumbing to do at the toolstack level, at which point we might as well
> > use an interface that doesn't have arbitrary limits.
> 
> I think we need both flags. In your approach you seem to want to either have
> the hostbridge created unconditionally or hotplug it (if that's even
> possible).

You could in theory have hotplug MCFG (ECAM) regions in ACPI, but I'm
unsure how many OSes support that, but no, I don't think we should try
to hotplug PCI bridges.

I was thinking that for x86 PVH we might want to unconditionally
expose a PCI bridge, but it might be better to signal that from the
domain configuration and not make it mandatory.

> However, I don't think we should have the vPCI unconditionally created and
> we should still allow the toolstack to say at domain creation that PCI will
> be used.

Indeed.  I think a domain create emulate a PCI bridge flag and a vPCI
flag for XEN_DOMCTL_assign_device are required.

Thanks, Roger.

