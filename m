Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE4735599
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 13:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551015.860293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBCvi-0006r7-Da; Mon, 19 Jun 2023 11:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551015.860293; Mon, 19 Jun 2023 11:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBCvi-0006oa-9w; Mon, 19 Jun 2023 11:20:18 +0000
Received: by outflank-mailman (input) for mailman id 551015;
 Mon, 19 Jun 2023 11:20:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/FHF=CH=citrix.com=prvs=5274193ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBCvh-0006oR-4S
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 11:20:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 429c5419-0e93-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 13:20:14 +0200 (CEST)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2023 07:20:11 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5443.namprd03.prod.outlook.com (2603:10b6:208:297::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 11:20:09 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 11:20:09 +0000
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
X-Inumbo-ID: 429c5419-0e93-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687173614;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=woP4ezfLy9+JJTumWNA1WhRBfFVbGqm9vnf4z+S4/2s=;
  b=a7GdlyL7BqLM2EbYrApWiuKlU+1jtqgg3NrkjJc1jHSxAYBJceUGLZCt
   msDTEAFlTRdEzPpSZ7SodfnBshZt74j/N7H5NO8Cioib3UEQ18Ciom3eL
   Bg2kvM9ad5IPjwlfsZiS5t7fop61cJN9/B29day4TWVRXnehwxzTX7wdI
   8=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 112638887
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0MkSm6tQG0AjiSHhbxqZyBsASOfnVJZfMUV32f8akzHdYApBsoF/q
 tZmKW3VbK6KYGamLohzbYmx/E4F6pLXx9dlGlM9pS89Ri9A+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGHxiFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdxVTQlOo38uM5J26ddBGn/sELeL7FdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4W9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThrKAx0A3DmQT/DjVVElCno6SJu3WGBcBdE
 A9I2y1wtKMtoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQj0
 lKLltXlHzsprrSRTX+f8Z+fqTSvNW4eKmpqTT8JS04J7sfupKk3jwnTVZBzHaitlNr3FDrsh
 TeQo0ADa647iMcK0+Cw+gnBijf1/5zRFFdquUPQQ36v6R5/aMi9fYu05FPH7PFGaoGEUl2Gu
 3tCkM+bhAwTMayweOW2aL1lNNmUCzytalUwXXYH80EdygmQ
IronPort-HdrOrdr: A9a23:geah26omuX+k9pB7GBZZyKMaV5pIeYIsimQD101hICG9E/b5qy
 nKpp8mPHDP5Qr5NEtLpTniAsi9qA3nmqKdiLN5VYtKNzOLhILHFu9f0bc=
X-Talos-CUID: =?us-ascii?q?9a23=3AXOXzfGgcObheUjhqQ3Frin7FxjJuLViD4DT7e2a?=
 =?us-ascii?q?CLUlod4S/UGC3+Yh0up87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AfZZhsg+OL+greIqMiXddPJiQf4Qv6LisVXA8qq1?=
 =?us-ascii?q?Yqcu/dnBRPGmEhyviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,254,1681185600"; 
   d="scan'208";a="112638887"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTxJEtcMDOzw8w4pMSmzN/hkeeypJYVEHoecGiu3MrHj+QaY7CgVr2AVc9vGqRco8W0yN3xvuAFao7euu1E1J/TZNY8ubiCmxW/rEOaZjGD7g3WfzsCq93hU7+ehpsmEj1DMwsqub77klwSLpNMp46a075mH0uLkV8CXfjf9B1cLwzUvN1354oR8uC3c/jwpYiLsU81PRt0Bs8RFfp3dBWKhy3M3e8OSLq50ekRsCz6Qmpet8WfV10Fkp7mMf2p4cydl2QSsuxiXz5qykKwedBocZ5DYlnNOXfY3+V+DXb+Lchn23B/qgEtiE+E+b8Pyq491kaod0OaQi1+50fh9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBldFb2h85UZpSgEFUhgy2KcvqJfpmyjslBP/tMBoXg=;
 b=AOzuE2bZPAvWs+21OG1K3RqxNTqhWgdMn9iXSwqlIHoL6qs4o4wtu1XWCJxIl5TKzE1yZ+3K1q+o/syjiqBKlSFEw1SKpufAgP5NT4EdnzGIEra3enO2B4wDyrGq0ijEL1fvcHnswRYhJMt9jug3kP2viLhORbIW+Bf7CvPqUNZjcpM28AGKjnyym46PqJczkWR1xy8RLxSMxGiL2jK8cAUlvIhMO0bT/oyb/lsOoM3It5iGiC94ifXNlhrWYeSSNcZJALK/qWTPGSsNWMQt2nZaKlRpCctCqsNUyyhjCFSU2UqTd0t7yyIttwlQHcI6wg8vgrpOOilyeDzg/3XpWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBldFb2h85UZpSgEFUhgy2KcvqJfpmyjslBP/tMBoXg=;
 b=u4gjVgE3NeC38RRB/Z/+rfNNrS7KVyk3Uxr/FgDPGvZN2hletVwDlScCLRIlwWXMmAgBpt12pnjtQwuGKRzliDZiaRFOMB3vM+VppNUQy3ih1v/9hGfh45G5Z4POHvSEw9aqE0Sf5Oci0VN1ZUgKQpgCdGF3ta7vZeNdmTHsweU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <569941c3-a909-c4ab-aab2-c256caccdda9@citrix.com>
Date: Mon, 19 Jun 2023 12:20:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0.5/2] x86/boot: Clean up early error asm
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
 <20230616182303.3546262-1-andrew.cooper3@citrix.com>
 <1ea82266-8b61-f70c-c5e2-a2b4e131d222@suse.com>
In-Reply-To: <1ea82266-8b61-f70c-c5e2-a2b4e131d222@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5443:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f125b42-6953-42a3-c1dc-08db70b723dc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rluLhdd+2b5S4BlQpxY4V9zVK4/gG1TjGrehc8iSOn5t6ogDvnGg2oFdcWtqK1KpuCXFiDUNT3z2kg9N3/arI+b6hU4ROWffueq0FH9Wy6WRZjNo/EZCvAzWPpuzPVAR3FJE4Q6SbBv832hPLTowV3A2u1ppeXauCla8Sd6+U7enbf22RQxEJUt/zUetlqERh6BCtbiNEv/J67D9LMG+11q+STF8SNTZ2/2kV1Zw7/ZT9wzrj+N2lnLbNbaGfgFlfZjh9RWgSZYjEDFd0phHA1gUxYOBO2ZYT/aVb8h+2Pn8Xg9Dq2Fa9DNybvjehP1RcSN3j+YoXq0e7gjsw0C+jKEkFaQ5BurI9ZKWvY8EMoNCGDwU2m7zO+2udxWoyoKEeXLxHO8pMvmv/uGVhTA/l+7UR0hE4e1Q7YIKazntbZPZ7bC7OtkrFsQvI5R36ZQ4xEkIb8d5zg9EK+ky/l3XHKJLfyCipNs3ngbW7b00TyRNtKf6LMo27WStz461EjzmUvGZr5+UrVqZ96aGXFVNTEzBZqoyGwJAYHMH4eckcVxtvElaVpCUpgMZXO8lKDNGJ6MpfuDqmjWNs7Eq/GbcaGXRFj3CzmCdQV9XWBVAXE80RdgWYcnq5eQah8vjnJxeEkDepeig5xq/peizy51NvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(31696002)(83380400001)(31686004)(6486002)(54906003)(6666004)(38100700002)(316002)(8676002)(8936002)(2616005)(36756003)(6512007)(86362001)(26005)(4326008)(186003)(6506007)(41300700001)(5660300002)(6916009)(53546011)(66946007)(66476007)(66556008)(82960400001)(478600001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmFOL01hVzJQSVNpcFNxNmZIZkRtMytBY0dDUXozckhnY1Buczl3OUMyZjRQ?=
 =?utf-8?B?YUJqZ1ZzMEI2VTB1WmpuUG8yL2x4OEErVmhBM0FsLzlDOEs0bE9sMGJzNXc1?=
 =?utf-8?B?d2NHdEx1MkdHd0E2QUtIVTVIUkRMa05QRjd3Y284cGhTOUlEQ1hZVFVBVzhk?=
 =?utf-8?B?NUozb3dUWEppVVJWc2NUVXB2ZW1YUUNrZXJjem05Wk1Bdlc0UDZ6amhpRWNo?=
 =?utf-8?B?UXNOekFqcUdlcmt3bkQySjJHYjN0T3hab1lVcDZKc1diYVRZUHBpa091eXFZ?=
 =?utf-8?B?d0NZbm1seEFyVm1TeU94NUdQVThBaGQ1QXFUUkFLc243L0QrdW5XZDhsU3Nm?=
 =?utf-8?B?NW5NYXMrZm00cStqbHE4RHR6REk3dkxsL2hkTEFXVUNsM3dlUzBPRjJZQjl6?=
 =?utf-8?B?YnlxaENnNU5zYzZmVm9USFYwSkI1RTFxVHZNcFpxN3VLd3lvc0F4SlU3cWhK?=
 =?utf-8?B?S2ZlVkI3azc1NW5LU3pmVFNmTUQwNmJOa0FOcTRwRmF4S0JJNjM0K01oMFFP?=
 =?utf-8?B?U2NTVS8wUDFhcDk3M0pocE05OS9yd0Nwa1JqNkd0dUNjb1pDWTJ3Mm5qZ0Jj?=
 =?utf-8?B?alFzSXBZeXplbzl2ZTBoTnMxNlh4WStBVHEyN0E5R1l2U3dtOW5rcFRvN09k?=
 =?utf-8?B?TFc0eXF0ZlhXS2hBc2pBK1kzUHNGQ0RGNHJvWUdYczFFSHRyWnQ1VzZLaHVk?=
 =?utf-8?B?YUtkSjNKNDJMY0ZFejJ5MmFrT1NOa0IyUDVyWDI2Y01TQ0lmY3ExbmlPLyty?=
 =?utf-8?B?VGVGbnErUWJaMU05ekhoY1ZLbUs0TzduOW80VVJjVUxFNk1BSjBBWElWeXFH?=
 =?utf-8?B?NnNHOTBuZTBocFVxMEFKVHZLTCtpdG5rT0hLbVAzb1B5SlFlaTVMN2RlMXV2?=
 =?utf-8?B?anptUTRiUmRSWjc4QlB3QnF2eWdyOTFTU0pFYUV0N3NRaVJLMzFxSzJqS0kz?=
 =?utf-8?B?d3BCYUQ5eEUwdHRJSFdJaWh2TXpNMVdESWprMzREZk1QVGZxL3cxY0F0ekJu?=
 =?utf-8?B?WEdMYjdKekx3cWJTQURkb2hnaVpVaXFYYjlicnFWWWZuT3o2UmZna2ZjZ1Y2?=
 =?utf-8?B?UDJsbUtWVm9USFF6UEg3ME5WYnVoT0RQOFh3bnlRVzAxZ09KaWV6SGdabW5m?=
 =?utf-8?B?S0R5SDBVUFhUYTkzRGVZZHhHQzhvZTJtYUpweXI2V3hPRU4rdEFiOHNMNXVy?=
 =?utf-8?B?N0Rxd3Y5N3pVWnJBYUtKOGxSWTdEUUdQb2pZWnh6VGJ5dXNIRDJYOGpURlho?=
 =?utf-8?B?MlFuem5IUjVCWWIvNnlFRFEzSE9JeWQvaW5RT29uYXp6TGJMazA3ODB2K01q?=
 =?utf-8?B?MVRROWEwTElLaUltQWVsYVpBekFoQmNXY1ZBRGxzdzNQeEhHUDJ0NXBYbDBu?=
 =?utf-8?B?UnNMSXlUWU0veDBqS0xjNWtscmFqWkNpcDFwRk5IRzZmcld3eHRuWitHTUpr?=
 =?utf-8?B?S3FnbElWUnJJSHlmcjY1cnVhU0d0UTRHQ3VsQ09PUFZrUkhDV2E0MWZZU1Yy?=
 =?utf-8?B?NnBCYXhCdHhvTThpWldGeHR3cUZub1A0N2pRei85NitQQXNrdGZ2U1hqbTVZ?=
 =?utf-8?B?aC96SjlzZkY0U2tlSjlKL2FZcXY4MHVSWThvc0Vrak8zZG41R3NhNEVNSW8x?=
 =?utf-8?B?S2NUdnRnK1dHeUxaZStMYWhnb1daL0pFcXhOTFgweE1MUmtYaXg2cm03bDVm?=
 =?utf-8?B?WFF4THN2aUppVFVuYzVTUEhFdWpsNTlxYkJTRzdBR0ZaUXZlVUlUZmJWT0Rw?=
 =?utf-8?B?NzNST2pGMTNETHN4bTJKb0ZyTS83OVVCOGhHbDhKWWpJalRieElTekY1VXhC?=
 =?utf-8?B?UW9HYkVHODE1bHR3Z1BMaDdBRkN5SEhBODRTVm1pZDkrQjVPcGlYLzhhbzVP?=
 =?utf-8?B?d2tBYjRIZG1uN0ZaVCtGOStzRjBrekFnQWgyRDUzcmpMQjhjS0twVm9lUGlV?=
 =?utf-8?B?dUdnOElmbXlQUjNaNmxLQkdFcmU3MnQzNjF6TU5iYWl1Q1Z4bFo3TUZEak5w?=
 =?utf-8?B?cFV6UWM4ZUd0OElpQXB4bFVLN1FnWjEvYTBXZ3Y3RVNrYlg5cXRWVEhaZVFs?=
 =?utf-8?B?OGRoV21ITys1b21NdDl6OHJyVUxjaXF5WjAzVms2akM4NGwrUkUvRVBVMVVN?=
 =?utf-8?B?KzQ4cTB4Y2R6R3lqNFUyT0F5elJDMkJGRThZalRCYmFyc2VzaytJU1BrbFBj?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wwrn9edWq00WfCBZrfynHCiNgTjiHN1hFNI5LYXVP5e94Fvyt4kj5mgC9p+JnbvRiyK0s7k1Aokf4OotxFX5j3z8sdcAGSvmQSJVeP+tXjnHKs1egn6EEbckNmhS98VCsT3Bjl/056AMGzg75xe8s3mxOMqwINdOqxqRM3R+PqEsSOvbQjdo3M+5ilEP3xiPcsH+V7aZ9NSeQfBM/dp7/NfRTuAT+QOiaCuyYVz2ykQpJUeXpVcg5XmLLYAlmfGJZVVkGdagtlUl2JVEghv9N8BX1ULDauJ+pbzr0hCXwbazD/icL+sINk61LSXDdZv8dXEu5v+bGjZNDNO8VuxRATH9wX6Kme7odEzoMAH0kw8i5Ptfvojod0zdxPmCnZmRWCIq6T78TyTGfRN0u+x0/wcJYP2hPvo7K3ULDBu4A0xuvBA0ycfi3U9pa83+3EHHDaQi5RkgUCUnagixpe4Zo/6wZ8asscCKBpTuQhp8ly6pFm+bELaYldnMi5FguxWz5GJ9ti4eXAxzFie9+rr+iV5mKSQf4tJ8ARDN+qHl/Yu9dx0/fUisRTR+rp5xcLjF+lBArmqDHqwfY6OMUkRes26FtkoCJ9cg54hHSMmKfSxdNchNX82VEWqMI9dZzWOeTZhTudS2bHJdzmDDPo5AtTlUDvaHR9TBjEshGw/qPfemW3acmkHlUpHWyFHnzbd1sEA92RiP+ESyuW3q7TNSWTUgU1LXRXmAzE8C+RJ0aYeGIBb2jP27YJvaqMkNqshNlNNoFr8yFFRK22Ds+f73/Ro+aRZRdVeXSKtK8n97xy4POcMQ2l+MznCKekefTCRwlaIHccgkfh35asnDywAgHbdV1GAKmbEnmT0xyzoO++M=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f125b42-6953-42a3-c1dc-08db70b723dc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 11:20:08.8667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDA9/SEZVJECFC/WKPyus5g7jqThDuHEWDgtJUXg0ZF3yOOY0x/RdOtZOqaTz/MJWCuqjPXAO9Tj01TSfUeOpa35VSe8PQs6Rwu/F3j4h8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5443

On 19/06/2023 9:10 am, Jan Beulich wrote:
> On 16.06.2023 20:23, Andrew Cooper wrote:
>> The asm forming early error handling is a mix of local and non-local symbols,
>> and has some pointless comments.  Drop the "# Error message" comments,
>> tweaking the style on modified lines, and make the symbols local.
>>
>> However, leave behind one real symbol so this logic disassembles nicely
>> without merging in to acpi_boot_init(), which is the thing that happens to be
>> immediately prior in my build.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one request:
>
>> --- a/xen/arch/x86/boot/head.S
>> +++ b/xen/arch/x86/boot/head.S
>> @@ -142,25 +142,27 @@ efi_platform:
>>  
>>          .section .init.text, "ax", @progbits
>>  
>> -bad_cpu:
>> -        add     $sym_offs(.Lbad_cpu_msg),%esi   # Error message
>> +early_error:
> This symbol, which isn't really used except by .size/.type below,
> could do with a comment saying that it's intentionally here despite
> having no real reference.

Ok.  /* Here to make the disassembly better. */ ?

The .Lbad_cpu jmp will end up disassembling to early_error+0, so it is
technically referenced, but I see your point.

>> @@ -202,6 +204,9 @@ not_multiboot:
>>  .Lhalt: hlt
>>          jmp     .Lhalt
>>  
>> +        .size early_error, . - early_error
>> +        .type early_error, @function
> At the 1st and 2nd glance this looks unrelated to this patch. Which
> isn't to say I'm opposed, but of course once we have settled on an
> annotation model, it'll need touching again anyway.

I know it's going to need changing, but in the short term I'm at least
making sure the metadata is correct on new additions to asm code.

~Andrew

