Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA00A5605A2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 18:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357955.586857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6aPZ-0003em-UW; Wed, 29 Jun 2022 16:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357955.586857; Wed, 29 Jun 2022 16:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6aPZ-0003cx-QZ; Wed, 29 Jun 2022 16:19:29 +0000
Received: by outflank-mailman (input) for mailman id 357955;
 Wed, 29 Jun 2022 16:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JXcD=XE=citrix.com=prvs=172c93792=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6aPY-0003cr-AS
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 16:19:28 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c90db3b-f7c7-11ec-b725-ed86ccbb4733;
 Wed, 29 Jun 2022 18:19:24 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2022 12:19:23 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB5243.namprd03.prod.outlook.com (2603:10b6:5:248::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 16:19:21 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 16:19:21 +0000
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
X-Inumbo-ID: 3c90db3b-f7c7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656519566;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8UTvpINnetV7/J7s9p+/dx3Nh/oHZ7aO/tTTeL8kqbI=;
  b=V1LfajI34P4lrQ/2xBGN03MnGj3M6K7SDA3gDj3yDJUGmC5l7+VTnkS5
   /tBXvhqyq/YmF0m9sIv31ycRvkrvEb4rw9GydSMl4SyfCOlmZNsMK1owj
   kfQOPSCcd9IP17dvGtCiNCL/AFC+kudR7wi8cX8BLGgNbipceHyvBlsKz
   E=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 74038969
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wJeLJa0DHUQlu8Yl9PbD5c5wkn2cJEfYwER7XKvMYLTBsI5bp2cHz
 DcdUWjQM/6NMGv8Kd8jPIzn90gEvseGyYBnTwY/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tAy0IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Kr7PuQgB5LpGSv7gMDBcFFSJRMKNvreqvzXiX6aR/zmXgWl61mbBLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B86dBfmSjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SWnKG0J9gP9Sawf+WPx9jx37b3UaIDfesC6G/Vsox+Kq
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSpU938UhuQsHOC+BkGVLJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceWjgCx
 lKP2dTzClRSXKa9THuc8vKRsmm0MC1Md2saP3dYFU0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdv207gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:NyL/z6mjw63wKviH1qhs3/TUe2jpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 D4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR8Xue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqXneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3GlpT1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYzhDc5tAB2nhk3izyhSKITGZAVyIv7GeDlJhiWt6UkYoJgjpHFoh/D2nR87heAAotd/lq
 b5259T5cBzp/8tHNxA7dg6MLuK40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.92,231,1650945600"; 
   d="scan'208";a="74038969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqOO3A7HqKCwUpa4OzIeWfj5qeJ4Ge+rqeBfKpU+uK5HyYZ1j3n04awlD7spKqb2hYB4L+DFSJVI+La1kLxsq30jnws3nKmVO1cSS1E5sxZNt4mG0iP+Do2G6hCEwVvXKzEpL4mm2ve+4bxOgzqOYDxJ5OXSFpJ4kNbMO+y3VAU7narMa/MI9bCvQuu4HF5jNZk03+2aqo0c1OupO1ppM6CQlE/X8OZfXOKo/6sVuA6bANCTtmge+pmRzgKEhLOUNg8kAfPMOOSvUGLhMkiEe8jWz9tCeJyk4C2Kec1wlDEr3nyLHdHexKddcfw+1JdjRokpor1f1E6Yk4jFep/9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fe8V4skNM6KXg8WzbrTc3HISkT1jaNp0Yxoqt5N04eg=;
 b=IjVSOik/077ve8JJl1EeeG8yf2zL41I5IVk4bNwO+TfwS7ZOzkc9fVCSGoQYvw8R4UITg0s/52ap+7PioYEJfmXe24+pyLr1Ba40c/F2RB4n0e1+TlLBbiX8pC0Yv/4dSwdvAFGYvbDkCkpRzX1RPnrmV9K0EXKZfpq/LiCpfNshFjNd/KhbaWl7XRwTLGngFFGxsfY6j9fUcxOaTosqVRbKnTTwSQ8z1y1bpgEQ7DxnenwzbNUkHQe5Sl2nYyVU6SP1kBMF8rvwB17cG/XcfYJc04kBnLDLcwIfg4PFAO1nOUeBL9oHjq0Oc/0UWeETwachMvCmj1A9/BzmYDt6Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fe8V4skNM6KXg8WzbrTc3HISkT1jaNp0Yxoqt5N04eg=;
 b=PCICZ08SUigeAU6glir7QITu5cOuZt87Sp9P+uP8v7ttTwKhtQOq/6QSXhKGNNPvovnHlJRNsZOiH0k38e5bK5A+CC5wmCPMCJaMPTBOCaD954WVscDaNvV4KtblIeadfE7l81EFequzUc+RuT6uoVTjw6234nRaViuuA+bK1u4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Jun 2022 18:19:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] console/serial: bump buffer from 16K to 32K
Message-ID: <Yrx7hDevqMgvtMRR@Air-de-Roger>
References: <20220623090852.29622-1-roger.pau@citrix.com>
 <20220623090852.29622-3-roger.pau@citrix.com>
 <e45d8dcf-fd0a-6875-a887-5c0dafcc4543@suse.com>
 <YrxuVPMb990xYKi9@Air-de-Roger>
 <b4740e9b-3586-04c3-454a-5d60bae2cc55@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4740e9b-3586-04c3-454a-5d60bae2cc55@suse.com>
X-ClientProxiedBy: LO4P123CA0150.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd828633-3b92-487e-9811-08da59eb1fcc
X-MS-TrafficTypeDiagnostic: DM6PR03MB5243:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k0m57FpUbIvxsJIUR+IDYyjkEzGHTI9A4z46UgZ75IX8sUkX5yMv3f2/vIBeGpZRBkZyrByc3c8F1Qm2qVD+7XUT+2KpOJC1Dp2q1BJhfzMKG1xA7uYEEDB4ndB88qS2MFQ7/OieJArhoeVlalukARIwD7VilimMPdzGRv9fckRCMiwKD4yKUfbOg9p9e9ux8K8uLLGeuS1w36cQtogGZPIqO+L//Mv4Xzvxb7Elh+i7oJoaQndk5CdjD5nrb4rUmPziq/Lgn/ZYjWFZ/G+vEAohBPaEFnUMkWcndfneO0yaSJ1KEhX748O7mnI07KqclyHzakUSOdSPNsj3tk0j98z6kq3dGP4ZESNpv0F7fAchFkY6RAuybB0MmbdE9dznqgyJgm5BRlLzh4I49fAATrYia40V20TM29J/TynOeeMZCK+vH77YSxOWuviNAbae9CXWGoWk5hvdqDUHQ/PV1VoN06UVoUb+OUWu41t6aJs8enFKzD2TVXH/Mohu416yVQ7Y8Z7NXTHxssnS/ITS13cc1GWO/JVDW/LKnERPnnhMlNVDtdXPum7TDGoAuJjLFUUYWwta2e6sO6XKXniBUrq7k0FKBInC3hTVGsbz11NcseXp9STOG4OIexJHawSuHzh8VXO8JgBFxJPqNc9VyS0Ujrmca5I6Sc3p1j4UthQDNgQ2NCm6LeqyWnKKezjEKSmLRoqFbgWjNH32ajcdjiiMzCKNoUSanjswkJLofv7MgwbQncvemiCqsHXjsGBq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(26005)(83380400001)(2906002)(6486002)(41300700001)(6506007)(66476007)(66556008)(6512007)(9686003)(66946007)(186003)(5660300002)(86362001)(8936002)(478600001)(8676002)(6666004)(4326008)(6916009)(54906003)(316002)(33716001)(82960400001)(53546011)(38100700002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVBvd1V0bVJOTCtlMWpiYXdiOFRaU3F0dnF3R3lTTy9aMlRXakxtaXZZaW5W?=
 =?utf-8?B?TE51NjlCRWJsSEZlVlU0TzZxNVFMMTJudlFjM2txL1N1aVBsUWJmT25OVXNK?=
 =?utf-8?B?Wk82L2djK3RqekV1ZG00NjY3SnFlU1d0L0wzaTVzN2FJVjU2Z0JOMU5WWC9O?=
 =?utf-8?B?b3FGOWk4cFEvYVR2SFJHZHh4U2dLQXNoeWxzZ1N3L3Z5d294aDQvL1ZPU09Y?=
 =?utf-8?B?MUhuRzBrQUd6VjEwMTlIWUpzblFndVVLQndrc005enNIaWpNYmVZUkJ6RGRV?=
 =?utf-8?B?OUYyMkUxVERwWGx5Q2tGcmgyVHB2OG9HUjhlVUpLQnV0M3BTWmhXNlBPVVJk?=
 =?utf-8?B?b1ZmMXZtNGZyR1o1ckJpTjJvZ0liUnRrV3hSUjJTdW41bVlaMG1zSTUzQk9n?=
 =?utf-8?B?N1VXS3BXUkJ5MC9LNVV1d2p0TElVVlRQS3N2M0FtYjIwZGN5c3dyTXIvckNR?=
 =?utf-8?B?bHExeGxCYkY1UlZHc0ZNVkZDY2o0TlZvZGM3YjJkLzk5VEQrT2dZS3g1WXZV?=
 =?utf-8?B?ZUdHUWdiMEo4REthK0YrZENhNWVXanN5UDdHMzE3VXZUVkxXODl2SmdoTDIz?=
 =?utf-8?B?UlVyQWNVdEUrS29NWDE4RW1vV3dDa2JnQWRVRC9aTGtjQ3FRNnZkbGhWblpU?=
 =?utf-8?B?RjBwemVNY01uclZmYXJPU2liM3pWc3g2RFNLbUQyZEwwTVRBSDEvV2RqZkhs?=
 =?utf-8?B?RTFxQzRvOFAxN3UwTC9kcFJaaWhoUkpzZjR0Nnd6czZzZ3UzZU5tbHF3WnVk?=
 =?utf-8?B?Rno4bkJtb3RkQVFPbzZoamcyQVl0ZkF6bDV0ZVM4ejljSDEyakpOUXp0MU1u?=
 =?utf-8?B?em85aXlzUS85R1JPNWRPWUVBWU9uQUk4VkZ6NzVqYTBYVHNpZFlxL28wNGNv?=
 =?utf-8?B?MTYxbGppeUhieWRwRUNqczVSL202QnJ0U09FVnRhOUw5OTZtVWxyTEs1R2dR?=
 =?utf-8?B?em9YQjRJRDJ4Z1NhR1NlZUNJNzRZNnEvT3Y3YitxTy9qdUMzc2pWVlVKSzJQ?=
 =?utf-8?B?UlJVaC95YWI1VU5GMi9Gengxdkx1Sm1SdDQyYmhsNWNBT2xubFFUQkd2WjZ0?=
 =?utf-8?B?Uk5jZ0w4K1hpZWJIS3Rab2wwSi83SFBUNXpkMVZVUXhSbUVwU2hHdFg4bGJ2?=
 =?utf-8?B?ZUM4akdtVVdsNW5PYUp0dVJ6ZTNueE5SQ0dQbjZOenZjaktrNDFlOE5EZEMy?=
 =?utf-8?B?aFZUVXFwSEJJUVMyUVFPTFFkRUVMeDdZY2hiVFF3b0wwTGgyZWlFRzdqU2Qz?=
 =?utf-8?B?ODFoQmw1VXp1KzJzT3dtckEyeW5zMXRSOGRsWUtHQW1TUld5Uk1EeFdRWGhM?=
 =?utf-8?B?MVVVcnpQbmtVTnZ1SVZrRnI2cFFubWMydHU5NWRnN1RLcFdvSjRjWXpRb1o3?=
 =?utf-8?B?VDYzZmNXd3FUR0JkUUdXeUVVQlFHSWZFZ0JNUUpoYzlsUzY2YXpLcS9KRnpq?=
 =?utf-8?B?blVzcXFpMXZ4Z0VOYWgyOVFUV0laOXhyTU43RWhKWnhmbzZtZUFGcXQxVGRO?=
 =?utf-8?B?UHp1ODc2REpWQ2VwNGNVVEo4dWdhTE80QUVNRWU3b3JTYUlJKzFXbWQ4VG80?=
 =?utf-8?B?L05rSVg1Vm1xQlNzZi9pbDFoS0dZM05JdEt0SW5VSC85c2t3S0F6UVBxWjVq?=
 =?utf-8?B?NDVXSGlBNTZaMVVUREUzMTc2aXFCcDdheWNROHRMMGcyZndUR3ByMVpxY3hm?=
 =?utf-8?B?aTlhUmYyMkRwUEdFMmM4aFFVdVczK3dteUEzRUl0cFV0cllJYVhJbG5zcGoy?=
 =?utf-8?B?d2FHQUM5QklCY3krMG9oNVFGNVhMbmVmdE1YZGdMVkppaHVRMW1kWkNpMStK?=
 =?utf-8?B?ekZhbVB2cTQvTmhPdUgydzdzS3V3dzQzc1E1V0JWMnl3WXFCQVgyOTBRbmNx?=
 =?utf-8?B?VWJ1bjE2bXhRa1NsUmFLajIyM08rT3pUdHJOeVRXbVk2dmVqaDZ6VjZ5UHNL?=
 =?utf-8?B?ejlLdW5paWRGOHc5bWlNdjFidlpaMC91emtZVEo2N2t5TWk0VGpISVJUSmlV?=
 =?utf-8?B?UG8zcDl2eWQ4U2FqbWc5bUFPc0NFeTB0NE9QSjcvSElDZmhBc1FRckdETE9l?=
 =?utf-8?B?dHM1YXVuR1Z0QTY4U3NWWWZXZFVNT29OdGYwcERlNlRvc0tpVFdVcUtzNzc3?=
 =?utf-8?B?RlpzNFpQQW91ZDg4OE03YUwyQVllU3NqbW5nUGY0TGlxbW1JQnBjWEsxQWty?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd828633-3b92-487e-9811-08da59eb1fcc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 16:19:21.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIpTDnlWaMBeQ2efxpd3gfC1y+mJdo41TEkkDV7sVt19XY1eCa2WGUnSaf0ozWU2MeVcWu7z96p/HSkQcI0+HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5243

On Wed, Jun 29, 2022 at 06:03:34PM +0200, Jan Beulich wrote:
> On 29.06.2022 17:23, Roger Pau Monné wrote:
> > On Thu, Jun 23, 2022 at 03:32:30PM +0200, Jan Beulich wrote:
> >> On 23.06.2022 11:08, Roger Pau Monne wrote:
> >>> Testing on a Kaby Lake box with 8 CPUs leads to the serial buffer
> >>> being filled halfway during dom0 boot, and thus a non-trivial chunk of
> >>> Linux boot messages are dropped.
> >>>
> >>> Increasing the buffer to 32K does fix the issue and Linux boot
> >>> messages are no longer dropped.  There's no justification either on
> >>> why 16K was chosen, and hence bumping to 32K in order to cope with
> >>> current systems generating output faster does seem appropriate to have
> >>> a better user experience with the provided defaults.
> >>
> >> Just to record what was part of an earlier discussion: I'm not going
> >> to nak such a change, but I think the justification is insufficient:
> >> On this same basis someone else could come a few days later and bump
> >> to 64k, then 128k, etc.
> > 
> > Indeed, and that would be fine IMO.  We should aim to provide defaults
> > that work fine for most situations, and here I don't see what drawback
> > it has to increase the default buffer size from 16kiB to 32kiB, and
> > I would be fine with increasing to 128kiB if that's required for some
> > use case, albeit I have a hard time seeing how we could fill that
> > buffer.
> > 
> > If I can ask, what kind of justification you would see fit for
> > granting an increase to the default buffer size?
> 
> Making plausible that for a majority of contemporary systems the buffer
> is not large enough would be one aspect. But then there's imo always
> going to be an issue: What if non-Linux Dom0 would be far more chatty?
> What if Linux, down the road, was made less verbose (by default)? What
> if people expect large enough a buffer to also suffice when Linux runs
> in e.g. ignore_loglevel mode? We simply can't fit all use cases and at
> the same time also not go overboard with the default size. That's why
> there's a way to control this via command line option.

Maybe I should clarify that the current buffer size is not enough on
this system with the default Linux log level. I think we can expect
someone that changes the default Linux log level to also consider
changing the Xen buffer size.  OTOH when using the default Linux log
level the default Xen serial buffer should be enough.

I haven't tested with FreeBSD on that system, other systems I have
seem to be fine when booting FreeBSD with the default Xen serial
buffer size.

I think we should exercise caution if someone proposed to increase to
1M for example, but I don't see why so much controversy for going from
16K to 32K, it's IMO a reasonable value and has proven to prevent
serial log loss when using the default Linux log level.

Thanks, Roger.

