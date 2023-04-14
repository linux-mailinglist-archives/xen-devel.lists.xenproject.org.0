Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578016E26BF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 17:21:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521147.809495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnLDd-0006cD-I3; Fri, 14 Apr 2023 15:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521147.809495; Fri, 14 Apr 2023 15:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnLDd-0006a6-EZ; Fri, 14 Apr 2023 15:20:09 +0000
Received: by outflank-mailman (input) for mailman id 521147;
 Fri, 14 Apr 2023 15:20:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClDU=AF=citrix.com=prvs=4618bebc7=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pnLDb-0006Zp-Bf
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 15:20:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3691e90-dad7-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 17:20:03 +0200 (CEST)
Received: from mail-bn8nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2023 11:19:59 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7223.namprd03.prod.outlook.com (2603:10b6:510:243::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Fri, 14 Apr
 2023 15:19:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::bb8d:7344:7172:6ee%3]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 15:19:54 +0000
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
X-Inumbo-ID: d3691e90-dad7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681485603;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=KZASkSgfwqRxMeZvPhT1iszvELyMTNOOjVdR7aVlPNk=;
  b=gx/grlOM4nFEmctYR7eZkuK3/21fHsDwRkA7b/SnppcspBLA8Xnc6hGB
   tNcwAiDVOQJyfgDIed49uX1WNTle/LZVrxkdrI4UsgLLg+GOnKH5TNAuS
   B3EN5qtTzbc0V+VuPK0Fcszz0PyHUWGyf8V+8n/iARSRY+GrBCasWjVIU
   A=;
X-IronPort-RemoteIP: 104.47.74.43
X-IronPort-MID: 105442746
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PMUg7aD6EOmkpxVW/x3iw5YqxClBgxIJ4kV8jS/XYbTApD0h1zRUz
 2tKWWqAPP+LN2ajedt2a97g9UpS6MTdndYwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9B4gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+ttLX2Yf6
 sMjEwtWQDCyutu4zqCSRbw57igjBJGD0II3nFhFlW2cJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK+exruAA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPdry7w3LCTw0sXXqooEo/o0a86vWau7UkIUEMdDkGqpqm23xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xBHADTztLb9EOrsI6RTU2k
 FSOmrvBBjtpqrSZD22c8rS8qim7MiwYa2QFYEc5oRAt5tDipMQ5iELJR9M7TKqt1IWpQnf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodd7xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:MRFC2aDKzDKQcg7lHejHsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwOU80lKQFmLX5WI3PYOCIghrNEGgP1+vfKl7balDDH5BmpM
 BdmsFFYbWfbGSS5fyKmjVQeOxQpeVvnprY5ts3mBxWPHpXguxbnnBE4kHxKDwGeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8TTutHRk5riQBgeQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7hGhdf7zdNHJcqUzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iFnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjXuVm2Hqr8DVTC8zT5Mpv/MRTjLpr24b+P1s2q
 NC2GyU87JREBP7hSz4o/zFTQtjmEaYqWcr1cQTk3tce40Db6I5l/1owGplVLM7WA7q4oEuF+
 djSOna+fZtaFufK0vUu2F+qebcLEgbL1OjeAwvq8aV2z9ZkDRS1E0D3vESmX8G6dYUV4REz/
 6sCNUmqJh+CustKY5tDuYIRsW6TkbXRwjXDW6UKVP7UIkaJnP2rYLt6rld3pDnRHUx9upypH
 39aiIZiYZrEHieSvFmnac7vywleV/NEwgEkaplltpEUr6VfsuZDcTMciFqryKamYRgPiTqYY
 fOBHtoOY6dEYKXI/cu4+TfYegmFZBMarxghv8LH3Szn+nsFqrG8sTmTde7HsucLd9jYBK0Pk
 c+
X-Talos-CUID: 9a23:dKHvXG7k280+QGZHVNss9HMoRMd0bULm90yLDW+JNF9nRq+8RgrF
X-Talos-MUID: 9a23:1smJzAnYnR5Fggo7No9HdnpYMvU4xPX+NXswurAd45ePbjZhPGeS2WE=
X-IronPort-AV: E=Sophos;i="5.99,197,1677560400"; 
   d="scan'208";a="105442746"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYN+lxuu97RJHO2KlJdpI6kgwB6sLFE0RXADMxGi2OwqKy7f9forBs0JSw0nViXUe0r1ufJY9yFz7tbVIpZMIzGy+RNRdVz8LiaY8L+WuHkE6lZIITNwj9dDNg3CJ5VBf4++IzyFk4nXOMIVSC8OAqtIq9DyAYH8HbQDh/fi4s8nh9n5qbglLVfoisW13SmKZbt20+K9uYuLw2t9eGyQqqZAAG8jCdsVRaJR9Y9V11z2YI5NbKw0k4M77vgEBmNujuOeAzStj6wd4dXO3mHm9+RSmU2hw5MzFMRpOGoB5/DXhdeGPxqMUGqAE7y9OMJ6xyk7d13qIsCk033bd931EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p+jVcCxqzh6neMgNDhH9OkgSf5UEdomAAqkuunpqpE=;
 b=ZGEm+0IDixL5x2Rii4qzaksWrl1r3eH1HH+dMiYCvJgYOSypVIzYxXzcums3XA7tVufYQmklpUKm8HbviKAD1RzT/k+IyHZNekyzEYrS2bYukFt653pnkzt9Rj/Q6Ofy3qGNJqEzv6tem7wM9cW5h+wReOFn7JLtCHZbnNxJO8cuII74xqm/sSIhV4kPTiaSDZKwlvEUtOEkfl4dOpO3O2NOJ+knqX205wgaq+iG5iOmdudatw+PxT6lf+zTo4ud1hzf6XRxb5SoxGEA1LApd+rklGWzvPi28/4SvZyiHmzR0uJX3tVIlLGI3LEsYyhKWCqR/uOk151YYt+9pBNxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1p+jVcCxqzh6neMgNDhH9OkgSf5UEdomAAqkuunpqpE=;
 b=c0nl3uUaW82dStoUESvSzuPfx6dzPwB9RIcoXGkWCBX6rMrLAs7gj+8uyu9Dq6fY01Q58oovQcMdjMhBWooEzRGHoJYOrKGnX/59YOE/1gUEcmicV6iIjjGlkR/t9hwYZvDEGuxGYvD3j+VsG04FNj6dVTVjmRKFj55CDhYylAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Josh Poimboeuf <jpoimboe@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] create-diff-object: handle missing padding at end of special section
Date: Fri, 14 Apr 2023 17:19:33 +0200
Message-Id: <20230414151933.53851-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7223:EE_
X-MS-Office365-Filtering-Correlation-Id: d35c8331-6aaa-47cd-d3a5-08db3cfbb2eb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GPnMOhTNJGjqYRWEdqdljf5rBh2dDiFcQzR9osoM4QwKEUBCqxGCnOXgRQaOXFd7nazPTO+2YYKvn83gnSgLDEOyVc9+Bdpyo3g6bRvYC99sUOmut63FkX+5j89Bd9JPeUnanId3kaGS221nTH9UYmDSsILK2tSHt3h5pqC/lBhhBlxAKci4csHqppoWDwzpKmPTLhFss+r7zz3whzJKZ+QinJi05IeK2wEAzdQIpZ2V7kGtmo6Z+9nM3xLyE2E61xIM/bTdBFLQL8GS5n5E/qoo8bASi+aSGEBTY/kwTomrTVR4DkxADd+yKyAUDpAyl07dCuFblu9fQ4VOyIgtoQxRBVUp5PslHa21Qp06e/g1zWtvUYJoclhWD3rTHWOiABcW2lULHMW5fs15oagUi7wnyLjH7vFWc/0R4IlCx0Bmw6UJ7thOuDuBqfK73lqmAPTJfpyYDoxn6gEkSBmI3En1gPMg+Leq9tR9zvsg28JvwCLtdd4/N8xOqk6jrwc727O6E4ZYy6RPTOQZSgLLgfDaBr5GjvdpXlrUTaZUjF4Kn3GQBWerVPSuaFcCPVLg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(36756003)(6486002)(4326008)(41300700001)(6916009)(66946007)(54906003)(66556008)(478600001)(8676002)(66476007)(316002)(86362001)(2616005)(6506007)(1076003)(83380400001)(6666004)(6512007)(107886003)(26005)(2906002)(5660300002)(82960400001)(8936002)(38100700002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cW1GVHlkVGtkRVhkZHN4YjJnTjdsS3NXd29EMW5iNkw1UTFQOEpic01UZTla?=
 =?utf-8?B?a1FNc3h5ZzNtM0MvK0FGSGZFa0NwMDJKcThHbk5LdGxqRG1IRm1wY2UvZitY?=
 =?utf-8?B?WktwV3g3MmNiamtFQmxKSlRpblBIVEthS0swUzMrL0E4MWkvcnAwU0pVZE1J?=
 =?utf-8?B?WWdQK3pKK1FIamFPc0tjU3o0YzA4Y2hzMkJRaVM5MmFZRlVUTnZMYS84ajRY?=
 =?utf-8?B?QzNoZHJnaXdrbzdOYlc2R0k0bzYxQm4wR1VVdlgrYS9TVkYyeFhXTk42SDFr?=
 =?utf-8?B?Qnlldm9yN2l2SlJUQWxZNDlnTWxOWHExaU5xSnZlZXgyWUhxZG5ncXBkRXJw?=
 =?utf-8?B?UDRiN1ZPWVl4b0toOFZLbmYyWmtESitZYnowNy9Ec2Jxd2VhS3FrZGF3dUZK?=
 =?utf-8?B?NXdLelN6TmZXT2o5bDdqRXB2NGF1Y1ZxZ21pR3hCQ0hDZEdDMVhBaEFaOC96?=
 =?utf-8?B?MDUybmswYU1FQVhnTkUxQjhzVHlRQ0Z5b1hJNSszSW8zcDQ5VVZPYkpGRkhH?=
 =?utf-8?B?QjM1Y05hSmF5bHBobWYyaTJDMXdDOElzcE9TN2ppVUlma1VMVDVyVVN5NkFm?=
 =?utf-8?B?dE1sS1JrWnlxOFp2UU1yYWU5djNpMTc2MXgxWldoOFVFY0tMSzlqOHhEd1Vw?=
 =?utf-8?B?a2JYMm9LRjFaMHprR3FHSTFnaHJIOUxkekRXMTN6N3VSYUpzUGx1YWloblJR?=
 =?utf-8?B?QjRWNFFvWTViQjQwWkUwSkZuN2lVWHYrMlhNdm1GZmVrbk9JNXIyejZmejJB?=
 =?utf-8?B?SEZCUFA3b0MxUS9oSHkvbWwrSFN0Q1VsM1hJb1BQK21zempaMmNwSjcwSzVu?=
 =?utf-8?B?QnpiMzhTZUZEWmN5dXNCc2F0MlRwSUt6NkxxOEV6R2hFYURKZTBIUmVaU2pE?=
 =?utf-8?B?Z2hiUDhXbzJzbmYzNWhUdDlJWTZDb0IxaHNYbFpMbmFaSGE3VXpLdGJOSURm?=
 =?utf-8?B?ZzROV1hoVlVxb3hYNnB0RUtiTGF0RkJZQkorRU93cnVRQ0JHV0hXZ3lTS0pJ?=
 =?utf-8?B?Q0Jabk9PQzRZRTVTRnBVNm4xSm5oM2JLdGNCdHB3RmgrYzBXYTA0VXB0bXBk?=
 =?utf-8?B?WkxYMzhNWW8wbXJwdkwrZmVqK09mWVFnTzVqTHdiemxGTC8vcVoxcDNzUENR?=
 =?utf-8?B?dHl5ZHJqVkV0ck9Vd0RZZ0ZQcHh1YjBvQ0NNeXRSMjFVNkhuYkJlSGoxdm1k?=
 =?utf-8?B?RjVGM0tOT0pRZkozSFhpclI4SEhaamNUb2FsTmFYQ1NYVnFlSFZzZE54MUF0?=
 =?utf-8?B?cnNsZkh1alRST3BQTXl5NEhvOXlTZVQwQUZlbkNkVlZ2cTY3RzZTcnZwdzM0?=
 =?utf-8?B?U1VvY3ZZYTVmbzQvVkxzbnpvOTBvbDNKcWJuaTFacHhZdGprbmVseEE1VDNo?=
 =?utf-8?B?TWVlYW45SmFQSGcyWUhnekhJSjJ6WGwrYyswZ080WnVGbi9ZODBSellkbklq?=
 =?utf-8?B?cTd5YkVRY1J2VE1uTk1BVFNPVjcyZDdNbFBSWmxudVdIQ21XTDJhSmRsNUFH?=
 =?utf-8?B?VWlLMmROSWtraXUzZGNlL1I1L2RZdWZRUmREaXdFbzY5Z0RMNFEyK2lFOGNp?=
 =?utf-8?B?Mnk3V2tHK3ZXemdtbnFvejJ2TEZEWEpFV094dU1aTG9VZVBtd1lEK3A4dDhL?=
 =?utf-8?B?enZNTHlYNDJQY2NHTWtOa3JkbEZKV3gzYk9TREFUUER2dlB0MUJGREtEU2N4?=
 =?utf-8?B?TzlEUXdqRWozWHlVN3NmU2M4eWd0SHRIUThWU2Y3d0RyWlVVazhHbUVoejZW?=
 =?utf-8?B?bDJuemtXdWdVWGFNZ1dFc1c4RVlvUWkrVkxSOVgrTjU1TTVtQzhtUlhtMzN3?=
 =?utf-8?B?UWpLSCtwc2Z2NTdCWXkzMGtrZ3lzaWMwWjlRd2h2VC9wbzNRWWFmMy9xbXAx?=
 =?utf-8?B?WmFZTDUvSUxaS29WVmxJcEZ3SUhXQXVwa2FhSE15YXUzaE14M2RLMGsrSFJN?=
 =?utf-8?B?bFI5R21JckVERVJzdDR2TitEQXV4aXZJWXBmMHhTSTVBemk5WG1lMURxNEp5?=
 =?utf-8?B?MFFiUVlPcnRvVDNqcFVCenZpYi9NekRZSzNpSzBPa1FTc0ErREFLOWZZam5G?=
 =?utf-8?B?anBmcTF0ZTNLQURYZnQvZWZrYUc3TURkdExHaGJ1eTlFUURRb3VqN0VBVm8z?=
 =?utf-8?Q?GQhBrLD50crx13IvCAF7yRSU6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q4bpxfPap184UEiEOiz2EhoU/tjLAvsd7BdFjsvJylMQ8yzmErntINRQe4nUANE/HX6KHMMwAqNrtJ+ncw50kWya+n8MDoBAlCsGbyNfUxlOLx8r2r72XPaKPapjkyM2fKb+BgsheehDv3fGQfE0r6gpWMilbzTHBQi8S4I4flsSR712cJBs2eywjIEiTtNB7PbXkqjlAJm20ORNkoMFai236xTy9Jwua0m9uPwo92yWsc/B3QvoB9gGKNBhPnOBx/VUvNj2HQ8G30UGeT3zlLYm1U9wFWlG49YwMz9qaobiEjOt2uG+yzHBpi6zPBxoGVjyi+WA56TqPDkfbnfpPqdXVGDLtHvgQ4rZMb2qIKaVNlmX2bWg4tiPVZLDEX3zIQltdG148aPdeVuX7cTHyLxnaXE6gB46rcqqGNf47yUKbxdZB6Tt0sZMCHuLaWdLAvtP1tGWnufAlfHO64fb/AIQk5QD6FkCvOsh7xD3AEAyNgGe3JLs0cj83bUFzHyl53FS45sai3mJuIs8ESX8Gb1aK31fFSxSHZMlvbYOXLN2g4yL/CuGt21HI1c2QOLgUHhhphMbG2ZOH61HwLKuY/X9T/x7pugbSSnuav/Kzlv/+pVsQaVk6dpYBWBG1y+zDfLvCmHmOWSLo8ghLrNz0i3zw8spnk9r1D2YwFD93d+Q7g39ZNmoLEkx1j9m5rDhxDJxo5Zq9siFTxlHFkenG3/VAS62u8xb1nWVvrS1+79OXIJKKwobZ4gYghcltj0dVWu44yKTKfpdclbNcs0q+gbaZp5RS+pfXOCOjq17K8CGsRpMGDxvVVXN7bKXvfQ+Jqxr0zVQFlpGXCjJg6zBng==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35c8331-6aaa-47cd-d3a5-08db3cfbb2eb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 15:19:54.4118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GfrlnQDQuZLeQeIenbIie23AMmGLK34uptR1JDTZGp/D0uBbkwheuqr+s6wNI4FlqC58LH0LYC5bcEM0YU3KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7223

From: Josh Poimboeuf <jpoimboe@redhat.com>

The paravirt_patch_site struct has 12 bytes of data and 4 bytes of
padding, for a total of 16 bytes.  However, when laying out the structs
in the .parainstructions section, the vmlinux script only aligns before
each struct's data, not after.  So the last entry doesn't have the
4-byte padding, which breaks kpatch_regenerate_special_section()'s
assumption of a 16-byte struct, resulting in a memcpy past the end of
the section.

Fixes #747.

Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>

This is commit:

c2dc3836e862 create-diff-object: handle missing padding at end of special section

In kpatch repository.

I've seen the .fixup section get an alignment of 16 but a size of 81,
which makes the error removed in this patch trigger.  Overall I'm not
sure why the original alignment check was done against the size of the
section, the alignment applies to the address of the section, not its
size.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 create-diff-object.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/create-diff-object.c b/create-diff-object.c
index d8a003216096..67784642bcd7 100644
--- a/create-diff-object.c
+++ b/create-diff-object.c
@@ -1204,7 +1204,7 @@ static void kpatch_regenerate_special_section(struct kpatch_elf *kelf,
 {
 	struct rela *rela, *safe;
 	char *src, *dest;
-	int group_size, src_offset, dest_offset, include, align, aligned_size;
+	int group_size, src_offset, dest_offset, include;
 
 	LIST_HEAD(newrelas);
 
@@ -1234,6 +1234,18 @@ static void kpatch_regenerate_special_section(struct kpatch_elf *kelf,
 	for ( ; src_offset < sec->base->sh.sh_size; src_offset += group_size) {
 
 		group_size = special->group_size(kelf, src_offset);
+
+		/*
+		 * In some cases the struct has padding at the end to ensure
+		 * that all structs after it are properly aligned.  But the
+		 * last struct in the section may not be padded.  In that case,
+		 * shrink the group_size such that it still (hopefully)
+		 * contains the data but doesn't go past the end of the
+		 * section.
+		 */
+		if (src_offset + group_size > sec->base->sh.sh_size)
+			group_size = sec->base->sh.sh_size - src_offset;
+
 		include = should_keep_rela_group(sec, src_offset, group_size);
 
 		if (!include)
@@ -1269,12 +1281,6 @@ static void kpatch_regenerate_special_section(struct kpatch_elf *kelf,
 		dest_offset += group_size;
 	}
 
-	/* verify that group_size is a divisor of aligned section size */
-	align = sec->base->sh.sh_addralign;
-	aligned_size = ((sec->base->sh.sh_size + align - 1) / align) * align;
-	if (src_offset != aligned_size)
-		ERROR("group size mismatch for section %s\n", sec->base->name);
-
 	if (!dest_offset) {
 		/* no changed or global functions referenced */
 		sec->status = sec->base->status = SAME;
-- 
2.40.0


