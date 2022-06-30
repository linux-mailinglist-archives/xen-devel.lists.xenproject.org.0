Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7AA561641
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 11:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358400.587595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6qPf-0007IE-JA; Thu, 30 Jun 2022 09:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358400.587595; Thu, 30 Jun 2022 09:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6qPf-0007G8-FV; Thu, 30 Jun 2022 09:24:39 +0000
Received: by outflank-mailman (input) for mailman id 358400;
 Thu, 30 Jun 2022 09:24:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6qPd-0007G0-ST
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 09:24:37 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 728becfc-f856-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 11:24:33 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 05:24:32 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CH2PR03MB5367.namprd03.prod.outlook.com (2603:10b6:610:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 30 Jun
 2022 09:24:30 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 09:24:30 +0000
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
X-Inumbo-ID: 728becfc-f856-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656581076;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0Bls/tYCdxwkuazXrMU28N6vQGXNDC9LIy8Re5WjAs4=;
  b=aDK3dcPVdcTPwiuRQ2J3pIlFmwSfvBx2Ttd4hDmor+wGGqHNqkEA+gt8
   u9Giv7TuGGiRVSE7MRyFWNwQ4QK3QPL8+7dR4GKYLCZCl2MftpBRzJ7JD
   vk0zESIel1F087nZUTeDX2EBQYWkoSVi3V8U2gO+q3g7gOPan3lm9hRDs
   Q=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 75197129
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2NmS0ag48lP2E24C/R1A0dzTX161RBAKZh0ujC45NGQN5FlHY01je
 htvWWvTO6yKN2ajKYwlYIzko0MFsZ/cyoNqTANr+C09Fy4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M58wIFqtQw24LhXVjV4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YRh0PJPwkvwFaChFOAs9JPVg6Jn/PUHq5KR/z2WeG5ft69NHKRhueKE9pKNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuI8ehW9h7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9w/M9PVuuTm7IApZiqO9EfHHa82zWOJS3QWRr
 UPsoXvjK0RPXDCY4X/fmp62vcfDhTj+WZ4SPLSg++R2nUaIwWgOFBwRU0D9qv684mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O9M97AaB26/F+TGzD2IPTiNCQNE+vcpwTjsvv
 neWm/v5CDopt6eaIVqG/bCIsXW+MDYUNkcZeSYeSQIPpdjkyKkxhxTDVMd+E4a6i9T0HXf7x
 DXihCM+nbQIkckT16ihu1vDiiivjoPVRxQx7w+RX2XNxgdkb4fjaYWu4lXf6etoJZycCFKGu
 RAsmceE5eQKJZiInT6KRqMGG7TBz+yMMCDYx0VuGZYh3z23/jioeoU4yCplOE5jP8IAeDnoS
 EzeowVc4NlUJnTCRa1qZ4O8Dew6wK6mEs7qPtjeY8BSeJF3eEmC9Tt3eE+L92n3lQ4nlqRXE
 ZWRfNuoDH0aIb961zfwTOAYuZcnyCkxymLUQZHT1Am83PyVY3v9YbsKPFaBdOkR8LKPoAKT9
 c1WccSN1X1ivPbWZyDW9csfKA4MJH1iXZTu8ZUPJ6iEPxZsH3wnB7nJ27Q9dod5nqNT0ODV4
 nW6XUwew1367ZHaFTi3hrlYQOuHdf5CQbgTZETA4X7AN6AfXLuS
IronPort-HdrOrdr: A9a23:ISQf/q8HXXsBi+ZlW3Juk+FDdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 X525RT5c9zp/AtHNJA7cc6ML+K4z/2MGXxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="75197129"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLhNguCvSlg4xYLP4nd7kJxirzUf6qFhPFm6ktvmRWCq65yx6vR0d0ZWffZHDpP7CegLeAklP5wc+0tEsw8N3RQhpLd5wWAOhaU535QqB0PifZZjua+ZNiRLmV5Q+vqQ14yVuKW+qGXt5IYOYy2SOUOwHUIMnSfTSOnUAC0dVDp1VP4YlmhvckxxSThHPfhJfKoa2b/lNNOLLW0ton/0V834mgjsbzIfGnjNYCnE+CaaDlZ+zExo1w5M/pz5Si63k4xpUqjiVWlAgJzrxtPhqHQN8twwJ0SeM4XAmxSvRuNqbeN+ExYMEuGhOHFXr8nwvgBph/Mm3wB+4PJOmyqMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbJ8Qf4Cz0NR+IFV7ooSMyOSpWKGmIw2FnsULdrGdfY=;
 b=i42+m2FJ9kFrRJCEwo5nLDtZ7E11RPFahejk+IpomR0tPChUa5baO1mpglcKQlpCnmqhqnR956h9yKlYx5CoHEtghuG5RAGgvW/3BRLnzmJxTBWCTMTb1bO71lHOrnLwAwlxuvSvv1zqaiVnB9ukmRmdjCUxyJPc9RFQXhfnUoYh32FUHBZW4ZfcWSg/dtMgab5mJn0C9OHpkD/NrbufIINNawwpsvNnpnMBG+K2okVP8ddb1Gh78fQ8cG5PVkPdY6PhhZXOfQJ3mXABe1wJJjsSp5/HEdQ/3QuglAR5Lnxk5phZ23JPGUevkc9Ikd2eW5kHc1NSD1jLsY+dnrMNqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbJ8Qf4Cz0NR+IFV7ooSMyOSpWKGmIw2FnsULdrGdfY=;
 b=YSY7DcczzEKwMcGFpOr9clx3M7gX+gAR3GyxYjX/Vv69h4hna4Hnzh8TyU7Jij78tFXHmOy71P130B/W3jY6Hqjz5XpIKunAAebS6hAjVB5gffDlyC8a8yJWNtsnvshX8PGmlvd/i65cct5pKAaGO5jpOcLS+XNzhnHFI8zDY8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 30 Jun 2022 11:24:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, scott.davis@starlab.io, jandryuk@gmail.com,
	christopher.clark@starlab.io, Luca Fancellu <luca.fancellu@arm.com>,
	Julien Grall <jgrall@amazon.com>, Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v9 1/3] xsm: create idle domain privileged and demote
 after setup
Message-ID: <Yr1ryXy/mMi6tJzY@Air-de-Roger>
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
 <20220630022110.31555-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630022110.31555-2-dpsmith@apertussolutions.com>
X-ClientProxiedBy: LO4P123CA0152.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b79d0b1-ec70-451c-7f65-08da5a7a562b
X-MS-TrafficTypeDiagnostic: CH2PR03MB5367:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oTKT7/ueMNraWJ1qD+1VwsOqe5FKxqJbqejaPZ6/8FDQWzNt0yfRd5MBUYK4wdYyz32WDQmlmM4tm7OX7ZbflKUUrwX6imGljByAlpFqzpkV3F7eJCuEYHGjp7U1QOR09TaP2mq/E9QDiDMjAmHyjM3irAfE9E1c9B2t+utIp9Zfl1w+3H+LH1vlqo2KWji6COuqdrDLIN4LwrLHFeA7MeygoHyp1oUVkpmVGphF2D6ACX+tiffwTYwdLQwyqsgAifpT3qvR21uIVf5UPS2jzbE2DpSYERXfqaP0uq9tpYeCXY3UYeXFIFJBOCkk3yX0ITKyYXB1y9lHvqSqCJ8gfJSsXWm+UmIR1Px5NpEg4m4wUl/7A6w1zgHYakNfFPLnv7Rh8x7Zcxvyz9bnNK1OgHAnHZ/T4nxGZggGHwm6g135eb0DAxm6eu78pZuQ2khnX01JUC1cBV/oTSeCjbqqPbXhP9yfu+yC3P9bXa5Kt3K7uTGCV2awNP8dTxnrhB0v5pvNgmNnZrO4PyJtm23Ug+DZtiEIGV5Y/9UY8Ip/BRTHl65kVkhJ1a5hOZ8/AUHsGAwEsuuewo03aPCl1bxOUGZFNlaJbzH328uGdZy6C4uCpx+J31TmriPmZOfLa0cvABGVmoX8YbnoC1h0S4TQUkdx4kUq+HnXOavxWhTWyQ9+2YD8PXlq/n6uHGZVQ9QzE5LFPscghPlTeFHB4CkKkRHIdGLeE5qnFG5P+Gx1V3TmlgHh/ErrE+3yBT+V0/O0za1Ldrgs/VT+xQNAR8hr5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(376002)(136003)(39860400002)(366004)(346002)(396003)(66556008)(85182001)(6916009)(54906003)(83380400001)(66476007)(316002)(26005)(8676002)(478600001)(7416002)(41300700001)(38100700002)(5660300002)(4326008)(33716001)(6666004)(6512007)(66946007)(2906002)(9686003)(6486002)(86362001)(8936002)(186003)(82960400001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0xNNXJZU0dwOWNTV0Z4Y3M4eHZFUVQybmtkZmFqZ3E5RzdsZ1lTQ3BlY0Ez?=
 =?utf-8?B?RC95V0ZRK0p0T3NyMWlhMDdJbExsMEkrUSs3M1YvUktNWUh3ejVrRkhBMHVj?=
 =?utf-8?B?VEZOWm9sV2hJQzlYbi9NMDhBTTMwVFQ2S29hVW9RWDR2TmJoL1A4MDQwOUE1?=
 =?utf-8?B?WW13K2IxK0hlU3ZBVFJEMUNzeCtUbi9qNnBFTll6eWlrRVhZbURtZ1k4d2tD?=
 =?utf-8?B?Z0YwaElLTEVDOHJVWUVWNFRvUDFKYXozL1RiZmRJYjQvcTUyYmtHMXFOQXgz?=
 =?utf-8?B?YUp2T3ByRlpUUkRCYnJoYW9McEVJQ29OOFpzeFlEd2lpRld0dWgxSkh1bExB?=
 =?utf-8?B?NnBhNDNZYTVIbWRZc3ZpNXlibWlFMm0wek1MN2k5WUVBbUV0TW5KSEQwOXR1?=
 =?utf-8?B?d3lmdE1IMmJib3dXa04za1FHcU9IVUVvWkd4Wms0bkVBdTQwbzBGOXREcm5N?=
 =?utf-8?B?NDdNV01HTjJYVmgxekFFaHJyTVNod0JSd0xnVjJlRCtuWlhlZ0FNVVZCSURt?=
 =?utf-8?B?T1NTN2NHVk42VHErWWtyVGV4UHpaSEh3OVY5VjFzRFRibGNGWi9keDlVaWRF?=
 =?utf-8?B?MGhwOW5ocEpEWER5UGc2Ym5zaVp3YU50ZG1VdjNWUTJTSW84RkRISEtyZFds?=
 =?utf-8?B?S2UxNTVhclBEYkFVRG9PZ2IxM0JvcHlJNzQwR0E0TWdNOEYvb1hkSUV4cTVX?=
 =?utf-8?B?WHZVVmRSWGxPQ3pleGpYbjNNVjluZ1k5UlJvSHJ3MU5zbnh2anVvZHZBaEx3?=
 =?utf-8?B?SWFTWTZUV2tBc0ZlVXBTR25zNjAwWFdid2x5UkRBNW80YVoxaXVIc3pOWkx1?=
 =?utf-8?B?Mk5wL3BrdTZ1eFRJdHcvZlVKVUFTcUdPdEx2a252MUgyVzAwc3pMNHg4czgz?=
 =?utf-8?B?S1VrdVNSU2xJWDRGVVkrUlZ2NEtRdStuMHNiNjd0TUdaOUdaZkg2clJSUkE2?=
 =?utf-8?B?UEJtMUhNaG54R3psdVdTbmJPZW1iVnlSZVdUVGoyWExqNjJzRVZXMG5QT3pO?=
 =?utf-8?B?blhKV3J5cllNVDErZjNnMkRBODRRL2FIa0pBUk1uVVY5dnZ3Q3p3ZVRZczBl?=
 =?utf-8?B?TDN1Rk44TDk4SURpZlZlb01WbHNxb0JkeU15TjEwRGFIK2pmNjlQZGxvSmFO?=
 =?utf-8?B?czZQdzl1Yk1HYUcxbXRtVFZYYjRBZ0p0ZHp1M1l3TzVJYS9ndWR2aXVaRUta?=
 =?utf-8?B?YXpaWm5US0xyU3BIWWVIOXlkNVM3cy9XaEpoSVB4VTFmbm9TekZ3L2tXbjg5?=
 =?utf-8?B?b1VQdjFQUEh0bmYwWklQdGdKcGlYUitPSjFNZ1hLTEZrejhmS2pZVlc4VzZq?=
 =?utf-8?B?ZjhsV3BpQlR3b09Ub0doakxsLzJnY0FveVhwQXphbDhMNy9uQTYzSGxOR0o5?=
 =?utf-8?B?UHNraVg1QjNyTkFON3pseG12RmxPRmJFSnVleUdRYmlxbUZ1ZGhzMTRTT1Rr?=
 =?utf-8?B?cGJyU0JmUEQzMUtDa25jRDQzL2RvQi96cGwxY25XMURvTkRpcW1UT3Vjb2o0?=
 =?utf-8?B?MWdYWm1XTHlSRVRJRnpad1kwbTFiQStlZng3TmJCSnE0VGNZMzgyYk1HZTRC?=
 =?utf-8?B?TEIyZ2F3L2EvSThYaGloamRVZGJoSy8yUWkwNVhDR0dYTVpJMFl3emNETmhV?=
 =?utf-8?B?aElNZTI2WHhGMllPQjJaQmk1M0NqWDU2S050TXovS3FwYm5Remx0b3JDY3Fq?=
 =?utf-8?B?d1lkSFpja0lPTGJmQ2N6KzArak5JWDd0UnFtNnRxT1JHZDlKOWUzNDlGM09E?=
 =?utf-8?B?WUQzY2xBYkdPcXpzM3BGeEJkYW96d0krZGFhTmlSZjVNMk5iWGloSjJqSFlk?=
 =?utf-8?B?RWsrTklzaVlOb09KaGlxYmtPanNPUVBPTkQvcG9iTzZrVFNoQkR6NmRDNHkx?=
 =?utf-8?B?cmw4S2xMVmI1N2k3K1B1dUFRdjJBc1NWQkxHVkNic09oZ3FnalRja2xaMWFM?=
 =?utf-8?B?bUVpWDdxSGNYOVRBUVFmaG1zeURwREpZdE5VdnVzNkhiN0J4Q1lMWDQxNUxm?=
 =?utf-8?B?dHJHWG9ZcG82Mzg4U3BXMTdqZ1FBZE9WKzgyZDFHTWI0d3V0SWM2dUZXRnFw?=
 =?utf-8?B?TFJUQUVKODdGRGhhaFFUQWN6WElQWjc4a0swWUU1NE5VVE5tdFFaOTlZdGxG?=
 =?utf-8?B?SVdpa092QkRLTGcrdS93SWNrc3Q1ZHkwZ0xzOVFrY0RudHVmZGZ3N3RLa2Ri?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b79d0b1-ec70-451c-7f65-08da5a7a562b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 09:24:30.6578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlIdRmDOGbp3QiKdGDEhk9SX3/0F02s8bZRH27pRRoO6AmviMjv97gbp8qCDvqyTV14TxfH93+cHlI8HunmtNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5367

On Wed, Jun 29, 2022 at 10:21:08PM -0400, Daniel P. Smith wrote:
> There are new capabilities, dom0less and hyperlaunch, that introduce internal
> hypervisor logic, which needs to make resource allocation calls that are
> protected by XSM access checks. The need for these resource allocations are
> necessary for dom0less and hyperlaunch when they are constructing the initial
> domain(s).  This creates an issue as a subset of the hypervisor code is
> executed under a system domain, the idle domain, that is represented by a
> per-CPU non-privileged struct domain. To enable these new capabilities to
> function correctly but in a controlled manner, this commit changes the idle
> system domain to be created as a privileged domain under the default policy and
> demoted before transitioning to running. A new XSM hook,
> xsm_set_system_active(), is introduced to allow each XSM policy type to demote
> the idle domain appropriately for that policy type. In the case of SILO, it
> inherits the default policy's hook for xsm_set_system_active().
> 
> For flask, a stub is added to ensure that flask policy system will function
> correctly with this patch until flask is extended with support for starting the
> idle domain privileged and properly demoting it on the call to
> xsm_set_system_active().
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Julien Grall <jgrall@amazon.com> # arm
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> Tested-by: Rahul Singh <rahul.singh@arm.com>

LGTM:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

