Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F21F36E78E4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 13:46:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523371.813357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6GL-0007VT-Rj; Wed, 19 Apr 2023 11:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523371.813357; Wed, 19 Apr 2023 11:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6GL-0007Sv-Oo; Wed, 19 Apr 2023 11:46:13 +0000
Received: by outflank-mailman (input) for mailman id 523371;
 Wed, 19 Apr 2023 11:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp6GJ-0007Er-Vy
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 11:46:12 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c53d552d-dea7-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 13:46:08 +0200 (CEST)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 07:46:05 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BY5PR03MB5362.namprd03.prod.outlook.com (2603:10b6:a03:220::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 11:46:03 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 11:46:03 +0000
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
X-Inumbo-ID: c53d552d-dea7-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681904768;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Fxc8zK/6+cjf1tbj2ZNFP8PJ2Vjq2AjBT97baPYizP4=;
  b=WqToZ4apjaZq/zNJJOkhkO6m0wPOvr9qZLeljnXx6SrjZm1Gam3EHS/H
   PJyNiGzIvCA/6JESACBWCLA54I5FTPbtE8Wss94bP4fNs9LDiXlG5jcKi
   Hs530bPJnVFN1NjuLgcp53o0jABRByUVyBUw65GmX4J2zSnM/XBa9ihQh
   E=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 106497649
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:a3qdDKmjDrOlOLyBtOgpevfo5gwFJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbXT2FOPqKa2agf9sjPNy08EtSucKDztQ2QVA/q389FSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5Q6GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fsjMw5WSAjSu/j137Smcu1IvJo/LPC+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieC8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHulBNNNSuHpnhJsqGCL+WdJOU0mbGOUvNOnlhe/cP12B
 VNBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9YXma87KJqzKuKG4QJGkLaiIeZRsI5cH5p4M+hQ6JScxseIa3hNDoHTD7w
 xiRsTMzwb4UiKYj1bi//F3BqyKhoN7OVAFdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxZkaFl
 GgJnY6Z9u9mMH2WvCmEQeFIGa7z4f+AaWXYmQQ2R8hn8Cmx8Xm+e4wW+Ct5OEpiLscDf3nuf
 VPXvgRSopRUORNGcJNKXm54MOxypYCIKDgvfqq8ggZmCnSpSDK6wQ==
IronPort-HdrOrdr: A9a23:6+LZ4q8ZLQxG2ZRnrv9uk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:mW0wXm8jJ2Pm8hYeqyOVv0kvAf5+VGWM8G2TPEmlMWJNcuOJSWbFrQ==
X-Talos-MUID: 9a23:4GlaPQUHi4iEqfnq/AL0uzo4BZdY2pyBFWoTjcwHkOatGzMlbg==
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="106497649"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iY0UqmCi1XErs+058fENRile4pT1goR4tSoDwzHT2T5NzmuFDn/SfmyH8HP43OQPNEbpXb/+Y1QLJ9qKwbj6GSZ5sLo5c8RjNtq5X5vphqVBwZUaC5J9fOdp3J2Jl9eWP5jC4a94xkTWgukZUYVfkvHUxHK0gfkSoAbAQD2mYxhMVHbW9rWRsUDl8EXPE0Oe9N9yydBdsA5YX9ifvISTvl29w+PzeRjLAg3+7A3cYxlVAfGtpbrjrgx3CbSlfBAvUoig/y+CdaC+vBlVSPhlM9rP2gugRrssMggNIctqbUIziMPDtkEUw8kYpFpVlt+AH1yLxjFPm56sji3j6wIb3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZNmm6+aNePSyn3Qu4PBb3LZ/GwamRTwp7o8Waa//Vw=;
 b=fnj1T4e9CuD3q+7u+GudISZfi2BOTuUwNETw+eg3Lbqu6zyMslvJQXcdMCh+F8g7Bw3ypy/W+1NPb6l9kH9Wif6pVAi0sIOAr5YOVDhf4uFtHVeacYfvON6xTfGTFm/oUdVa13T7XjmKykshdAV3Jny2R5I8PoQx7KvQNsTkYNlGUJ56VBBciP030zXDiNJLDrjB+ttd2brmW5Ba+Y2o8YOSVFKLkLgG1WRWqbV3C5DlbonaiTIsBATXAp5qFoWkeCy0NN7tGVCQj/h8KyawyMY2GbVHNy4FVmSUAiL/N5hoRr8NtmUVT8A6trprtl/NcrXI7ZTGJOm3j9zMz4uBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZNmm6+aNePSyn3Qu4PBb3LZ/GwamRTwp7o8Waa//Vw=;
 b=MY2ir9ArsVQk3s3vWmmhssJbDLwGtjOCbAEHvFXPyiOF2+qg+k1bT814Y5qSixNTbQ9Y5tx5Ab+KNithsOzIgpGu+gGbOO7EiYtqSZ3cKQo2ulonxg4V51ltoP0S4wEyKThxIS7fl99429R/tHExzmpZjS0op963UeOFMJpagJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/vcpu: ignore VCPU_SSHOTTMR_future
Date: Wed, 19 Apr 2023 13:45:56 +0200
Message-Id: <20230419114556.34856-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BY5PR03MB5362:EE_
X-MS-Office365-Filtering-Correlation-Id: a5be0f05-b06b-4143-156f-08db40cba71e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xN8MjzGZ/Z0So/ArpVUFLVdhAqeeVS+tRH+q84mJUQm4T9LQyXCxQsGXJLWfKb7+O7ncshQkcj+lUg/Sw9FVGPZjGBgDymjYEYlXii7Pex0xWvE1V7sb9efG9gQ/0EtK2v+3Q2TVAqMcuafj8acHC+4UlmRV3JMasHAJ8YRa40HxYH5G6A29zTBR4QsH0rRyKhU6KTuoVWc9srLFRBSOlwmhDt5rMYWZUGYdRiqOqHb1zfK7EcERMBxdAbHyvjUn4EADrkI9eZm2w/079fXbvFdOhHGelzu8j9dn60jF3zK98Cf3/3Q1mLBV3AOReJJkp5VmAK2CEIiN2g+kxKi/RdCG7Bb0X8iC1nk9iu0E2RkWhDnZMRcVFKyYHIegAU4cjDmjapC4lduhTgVNEOsuOD1zIsqRLgGBnfCEw65NwROaaqgfh6q3prXfkJ+2/6xKv9/E8hgOcejrZHV3WROzOZuXhKupRBulZAP6uCfiPD3VfEey82lHTTALXX7mI1dQDLbcXUDzbhiezXhnfaSY0JFIWX822IxiU9oJZRBoqM4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(66946007)(66556008)(66476007)(6916009)(4326008)(478600001)(316002)(54906003)(8936002)(8676002)(5660300002)(7416002)(41300700001)(82960400001)(38100700002)(186003)(2616005)(83380400001)(6486002)(6666004)(6512007)(6506007)(1076003)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU5HbDIrWHljUjExS2x2OURpb2YySWpWRlc5NHc5bS9HL3U4MlB1b3B1OWpv?=
 =?utf-8?B?UEhGYmlVcjBGWjBybktsY05Gem8xcHptd0FXNHBBcUVvUU1TdlFJdUoxMHhv?=
 =?utf-8?B?SHN3M0NaRDlCK1BxWW1ZdXVPSkdia2ZqZUVUOUROeVBoT1RQeGFtMmF4V2Jj?=
 =?utf-8?B?NHpYd1JWQUVsSUFXL1FkRkJUSkFuRVVMek9mN3Q5RVRISzhYNG9ZY0E2VVRH?=
 =?utf-8?B?dkJIektxZ29aSmpWSGxvem0wMkI1ZEhDd2dVMkRva25nNUx0WnovUStidUl1?=
 =?utf-8?B?aWpHMU03dEJIS1JTSCs4K1pxYk0xcFhzaXJwMUhZRmk4cWtVd2pad0FacUEz?=
 =?utf-8?B?YjR1MTNsUVl5REV5SXpFeWdlVTNyUFBuM1FHeVQ0UmlKZlVFMjVhS3hsWVFw?=
 =?utf-8?B?ODN6WnJ5S2JIZTVpY1NpWHlaZzMxWGd1ejBkNkF1TGlqWTd5cUlYbkFlNDNW?=
 =?utf-8?B?aHkzb00xWXNlM2N4dEtpVnFVZE4vWnF3Mkx1RG9yUVRybkJtOGlxeEx3andP?=
 =?utf-8?B?U1BwNGZRN0d2R0F0aEJZR1NNSkhabnV4YjNXMENjOE1TVVVRUEl5WUhPMkJJ?=
 =?utf-8?B?SW53Ti96bzBWV1ZJRVJrUjZpV2ppVlg2VkUxalE2c1J0N3hNK3lEaVhBcUxY?=
 =?utf-8?B?cHpWZDlxRWJoQTYwUTlTMXR2cEg5YWpXZ3BIMzNHU2xTTGRtVXBhUWdNMlFu?=
 =?utf-8?B?dHNMQ3BlYmxhSzV1ZVAxSTRqUEtxTHVodkMzVFYybWdod2hJa1ZYeWIzZHZt?=
 =?utf-8?B?L1oxVUVyUjl1U29LL0xSWnEvTDV0ODFjeGdlQ1BJN1NpT0dqMEpmbG42WXZs?=
 =?utf-8?B?Mnp2S055cFY0TDBxSWxiUTNBTTg3aGx4Nm5NYlVDVkMzeC9vSEFTTzVtckc2?=
 =?utf-8?B?OE85Sk9XQk5Ha0JkbzRXajBnaGw4R3crNnh4c3F6WXBGT2ZUZHk3VjA1T1dM?=
 =?utf-8?B?M1Fua0E1ajlYMGdISmVXeTNWb2JYMkxHYWUyVTRkKys2MlM2WFh4SEZQL0ph?=
 =?utf-8?B?R2xSZ1YzR2lZbDRyTHNVQ3RjZmJIRE5BR0duVGh4NkpkMVZER2JBU25JbkdH?=
 =?utf-8?B?NFIwd0FCS2ZiU2tQT1JsQU1kQzk2MmlwNE9ESGptRHJKd3ppRE9RWTJlb3Nx?=
 =?utf-8?B?NkJrN3lWdDRrR0l1WWxuV2hZUW40cyttUUIvZDNhS3dkbGxiVlFFb3J3WVZO?=
 =?utf-8?B?NHBkNWtockZTMjF5UEdXVEdYQ2wyWDFKemxyclNxNVI4a1kzaWlOemlEcFd6?=
 =?utf-8?B?cFlyWFZDTWhTWlNzSTFLc1hRTi9FRTRobllnb2JLUDFPLzE1b3NIaTYvVG9J?=
 =?utf-8?B?bEk3d0R4Y2F1WVp6SGlwTFd3MFVNVFNEYndiQTlvM2RPYTZsRlh6QlptbGxs?=
 =?utf-8?B?cWNpNnA3VHc5aFlIWU9rUTE3UkV6OWhhajJoM2JNeTJPV3FvdnpvVHVpd3Zk?=
 =?utf-8?B?Y3pkSXAwTTRuUTZLOEdKNkJrZmh4aGtodXd4TDhKRnpFdmJraEVOVzQ3THZS?=
 =?utf-8?B?VDRUckRaU1p5clpUbkJNN01JaWg0QXFiT015Y2wycjlEUjhIZnRZN3h4Szds?=
 =?utf-8?B?U3hxbW9ZdFg4L3ZhWW9VM0NzTUgxeFhHazdWZW0yY2huVE1rUjJLVHNJK3hr?=
 =?utf-8?B?K3U5NEwvRkZnMG9oMThOenJUVkk1VThuYnNPbzhYMmlKN1hLdnlZcElIeTFF?=
 =?utf-8?B?bjllbmk2RlltVW9LN1Vua3dJN0RnSW56ZzR0aytpT3JRQ1FOM1lqRmd2UXVW?=
 =?utf-8?B?K3Nub25qUW9nem14MThxNVV0b0ROb3dzOHN2cWNQRG16MlMyWkF1ajg5cEFK?=
 =?utf-8?B?Z3B3N2lwL2tDV0lPV2RURGtHaEt2ejB1SGhHcTZlenEwTHBFMUVYbXhVOUIv?=
 =?utf-8?B?SDJzUzd0Y0dwbEpzT2NOMWYzVzFpU0pNZnVsdGhGUW1lZ1o1SnZrS1M3N1lX?=
 =?utf-8?B?eFZTb1NyWEJjcWxFMllVeUdHOTlTMk95MmQrK2FQVm9tc0JYbTZIeWxvVDlK?=
 =?utf-8?B?SU5leUd5M3pEM2t4djVYU2J3RjJ1MXFKY3R3QkcwSXMyU2xmcCtIK0tDci9W?=
 =?utf-8?B?T20yTnlabm5nNnBoSjZTU21Pc09sd3B0NVRaVlpiQ3IwOXd2N29MRkYrMjgr?=
 =?utf-8?B?NlppTURVMEUwSjBxQzFuRUVJZGIxUUpFaVZveE5iTFJVVVVQdW0ya29BMUZy?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pOiTBv1jG03S4u0BCMYEif0Aizu0devd31QyTTnGKtvu9BLUh4tSV8hOV6bq5LUfrLiSUVQQ1zEuarHoUQf8byaxOAPWOoIprOlHUEXcPDFsne6j6RH1FWff7raRXnj1X0PPaeOmacbqQeri7KWq3Ym6Kwptbh7ZmYtAeTC2kFQnb7EMK6HVYf5763YGi8gpGSXUVOPeBZcFMBfx7cPKQF4QJ5SKhnxIJoHIlKDfWMCKK6CFjbGxg2r6J7dqOHL652mR8vub1q/vmUtYvnFHIw4jQYVT6/LfuXxERZMPusPnhLel8FWeiXhKHcAEP1tMkD4/vfN9VHyqXPBomzhbqr7I5ZhGY7lXaO4L9ZItr9DBcFrEAlwwAAnRSmvpPmQ8TqX/6cRUc5H51invqILQRE5wTNc4+AhaYnR03HzZebAC4jMzeNO8ryQD5PH8paxqzPngC3v1LaGWX4nSQx0wrOg+VF/JsB88Zhs72wxinTz6QaZ/ZAk9VTUdHwT8fnstzdXKjmsxpmneTOEmFnzYOx+z0cw67l2Jr9GvpuDJVpGE30t0nCPfkYZQyFnuPvZ9GadmqhwKLuv7gb/8O/jpRWsPhHjo2mA1Pd2k1/KOgD8ozXPLI7kLxdyRWPAaPiXrztGpq2h9Z2qzFIo5dh7sSfGJ5Zwm02BbqXdZErUsZryIXnpJvPueV3k78kgoyg3J11Q6uKNgxWLNr+INJqfHkeWVqj8IwOn/2YBmIlt9hy3O97NNIfH4kcomywC30WO2zMjbKpilVRt3B+gJlPe7l/QaRUjicH9hpZAyDNiGlHliGU7MC4kV4LlJ3S1FyiSVNvi3+AvRt670+glth38prl0tXr4+q09hD3BGHpKFXKIQC7dplM8esOqncHN/fxjxFj8hNWD1uwKuRS+YgVJfp1De7pg7qWWr5zDfA+mrbmI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5be0f05-b06b-4143-156f-08db40cba71e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 11:46:03.1779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZ2pobRHl6tcBvJYjw/Qz9bbrZVXGl3uO1pTsQwLgXqpX/y+PKRRE9ujB3YSkV4F0AM8QQSLNax50rULKCZPjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5362

The usage of VCPU_SSHOTTMR_future in Linux prior to 4.7 is bogus.
When the hypervisor returns -ENOTIME (timeout in the past) Linux keeps
retrying to setup the timer with a higher timeout instead of
self-injecting a timer interrupt.

On boxes without any hardware assistance for logdirty we have seen HVM
Linux guests < 4.7 with 32vCPUs give up trying to setup the timer when
logdirty is enabled:

CE: Reprogramming failure. Giving up
CE: xen increased min_delta_ns to 1000000 nsec
CE: Reprogramming failure. Giving up
CE: Reprogramming failure. Giving up
CE: xen increased min_delta_ns to 506250 nsec
CE: xen increased min_delta_ns to 759375 nsec
CE: xen increased min_delta_ns to 1000000 nsec
CE: Reprogramming failure. Giving up
CE: Reprogramming failure. Giving up
CE: Reprogramming failure. Giving up
Freezing user space processes ...
INFO: rcu_sched detected stalls on CPUs/tasks: { 14} (detected by 10, t=60002 jiffies, g=4006, c=4005, q=14130)
Task dump for CPU 14:
swapper/14      R  running task        0     0      1 0x00000000
Call Trace:
 [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
 [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
 [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
 [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
 [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
 [<ffffffff900000d5>] ? start_cpu+0x5/0x14
INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=6922, c=6921, q=7013)
Task dump for CPU 26:
swapper/26      R  running task        0     0      1 0x00000000
Call Trace:
 [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
 [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
 [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
 [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
 [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
 [<ffffffff900000d5>] ? start_cpu+0x5/0x14
INFO: rcu_sched detected stalls on CPUs/tasks: { 26} (detected by 24, t=60002 jiffies, g=8499, c=8498, q=7664)
Task dump for CPU 26:
swapper/26      R  running task        0     0      1 0x00000000
Call Trace:
 [<ffffffff90160f5d>] ? rcu_eqs_enter_common.isra.30+0x3d/0xf0
 [<ffffffff907b9bde>] ? default_idle+0x1e/0xd0
 [<ffffffff90039570>] ? arch_cpu_idle+0x20/0xc0
 [<ffffffff9010820a>] ? cpu_startup_entry+0x14a/0x1e0
 [<ffffffff9005d3a7>] ? start_secondary+0x1f7/0x270
 [<ffffffff900000d5>] ? start_cpu+0x5/0x14

Thus leading to CPU stalls and a broken system as a result.

Workaround this bogus usage by ignoring the VCPU_SSHOTTMR_future in
the hypervisor.  Old Linux versions are the only ones known to have
(wrongly) attempted to use the flag, and ignoring it is compatible
with the behavior expected by any guests setting that flag.

Note the usage of the flag has been removed from Linux by commit:

c06b6d70feb3 xen/x86: don't lose event interrupts

Which landed in Linux 4.7.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Just ignore the flag, as there's no ABI breakage.
---
 CHANGELOG.md              |  2 ++
 xen/common/domain.c       | 13 ++++++++++---
 xen/include/public/vcpu.h |  2 +-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5dbf8b06d72c..ffe009af2dc8 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
  - Repurpose command line gnttab_max_{maptrack_,}frames options so they don't
    cap toolstack provided values.
+ - Ignore VCPU_SSHOTTMR_future VCPUOP_set_singleshot_timer flag. The only
+   known user doesn't use it properly, leading to in-guest breakage.
 
 ### Added
  - On x86, support for features new in Intel Sapphire Rapids CPUs:
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 626debbae095..6a440590fe2a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1762,9 +1762,16 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&set, arg, 1) )
             return -EFAULT;
 
-        if ( (set.flags & VCPU_SSHOTTMR_future) &&
-             (set.timeout_abs_ns < NOW()) )
-            return -ETIME;
+        if ( set.timeout_abs_ns < NOW() )
+        {
+            /*
+             * Simplify the logic if the timeout has already expired and just
+             * inject the event.
+             */
+            stop_timer(&v->singleshot_timer);
+            send_timer_event(v);
+            break;
+        }
 
         migrate_timer(&v->singleshot_timer, smp_processor_id());
         set_timer(&v->singleshot_timer, set.timeout_abs_ns);
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index 81a3b3a7438c..30b5291cd447 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -150,7 +150,7 @@ typedef struct vcpu_set_singleshot_timer vcpu_set_singleshot_timer_t;
 DEFINE_XEN_GUEST_HANDLE(vcpu_set_singleshot_timer_t);
 
 /* Flags to VCPUOP_set_singleshot_timer. */
- /* Require the timeout to be in the future (return -ETIME if it's passed). */
+ /* Ignored. */
 #define _VCPU_SSHOTTMR_future (0)
 #define VCPU_SSHOTTMR_future  (1U << _VCPU_SSHOTTMR_future)
 
-- 
2.40.0


