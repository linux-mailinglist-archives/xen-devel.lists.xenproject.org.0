Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9A4746F3B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 12:58:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558255.872176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGdjP-0007Rr-EE; Tue, 04 Jul 2023 10:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558255.872176; Tue, 04 Jul 2023 10:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGdjP-0007PH-BC; Tue, 04 Jul 2023 10:58:03 +0000
Received: by outflank-mailman (input) for mailman id 558255;
 Tue, 04 Jul 2023 10:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bK4X=CW=citrix.com=prvs=5424eaebb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qGdjN-0007Oy-Ef
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 10:58:01 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a271461a-1a59-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 12:57:59 +0200 (CEST)
Received: from mail-dm6nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 06:57:56 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB7056.namprd03.prod.outlook.com (2603:10b6:806:325::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 4 Jul
 2023 10:57:53 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 10:57:53 +0000
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
X-Inumbo-ID: a271461a-1a59-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688468279;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=S0/E6lgGJI26RaFbNiuUvRUXMJ1nPFFf8EETafKROBo=;
  b=cfs7ndo3Xq/+ss8ifs+A8gjX6pCSBXqzCl2MuVYjeM3b3WZ+WcBFuwlc
   rTJbbGMCYKmEEniudZpncle1+iqGgXkPl8j6qQqhpJ/YWRXfHBqkY3ZdT
   0lpMETXDOtPWsU4LiyNuQIhAUgVywEhbPb6BLJyg+Ktvh90LWzzm84l5G
   I=;
X-IronPort-RemoteIP: 104.47.58.105
X-IronPort-MID: 115118969
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iMvzO6p/gvhneDEfjriSJk03CIJeBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBmFbKqPajCjKNBzaoq2oU4F6J/TnYJhGwRpq3o1F3tH9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weBzyVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADMzPx2RmMTx+5uycdBPoeg6cOrsLKpK7xmMzRmBZRonabbqZvySoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYKIEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdtPTeTop6A76LGV7jQ4L0MmVHSXmPK0p2WTBIhgJ
 2tO/AN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsSAIE55zvpd81hxeWFtJ7Svft05vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzsZ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:4vwpk64rJf72rU9s9wPXwamCI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcV2/hpAV7GZmXbUQSTTL2KgbGSoAEIXheOjdK1tp
 0QD5SWaueAamSS5PySiGfYLz9j+qjgzEnBv5ai854Hd3APV0gP1XYaNu7NeXcGPjWuSKBJYq
 Z1oaF81kqdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpixBiSgSiu4LvaFQHd+hsFSTtAzZor7G
 CAymXCl++emsD+7iWZ+37Y7pxQltek4txfBPaUgsxQBiTwhh2ubIFBXaTHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FDQ8jil9Axrx27pyFeej3emicvlRAgiA84EoY5CaBPW52cpodk5ic
 twriqknqsSKSmFsDX25tDOWR0vvk2ooUA6mepWq3BES4MRZJJYsIRa1kJIF5UrGj789ekcYa
 BTJfCZwMwTXUKRbnjfsGUq6NuwXk4rFhPDeUQGstz96UkioFlJi28jgOAPlHYJ85wwD7Ne4f
 7fD6hunLZSCucLcKNUHo46MIWKI12IZSiJHHOZIFzhGq1CEWnKsYTL7LI84/zvUIAUzaE1hI
 /KXDpjxCEPknrVeI2zNaBwg1PwqD3XZ0Wu9ige3ek0hlTEfsurDcXZI2pe1vdJoJ0kc7/msr
 iISdZr6sTYXBrT8LZyrnLDsqZpWAcjue0uy6IGsgG107X2A7yvkNDnW9DuA5eoOQoYewrEcw
 g+tX7IVYh90nw=
X-Talos-CUID: =?us-ascii?q?9a23=3AVHGQVWsgsphaf9dX7bcrpLRN6IsmTCzQ3mj2ZHS?=
 =?us-ascii?q?RAF1Qa5q5UAOz/7NNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1hl4uA0eRV/U6xhod3tmvTfL0zUju4+JVnAMvrk?=
 =?us-ascii?q?/sMSpHgEvYQiRq26xa9py?=
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="115118969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcnqmzJti7XUz5H2g53I/yQSung+rI5GgfEghGw28MKX6iLYW/R04MAvazLDnkpL4fJDhGGrExH2qi3dXYDquz3j3Ni1/QBrM5eoN/IOcjQRC7md4JF0u4TZxndgKKlzf/pGLhNHW57NgqdQYw4qoCDAJqi6uGTAwmxC5ESbeeQn6VdrdN0iVChU2Nrn65n75sZ4fHqPl77pkj4YtGXErBKGjcEuOSrTsAoYo4/baN1x9DVt2AjTJsfnE0tOZL7sGIR/4uSGn3DdqxqIfKiMMo7CMtcCwBH8QegUuef12cRJ1/Z2e8H3epyUaDOBoEOP+KzGuP58pl6X2/UKucY27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iq6Px3XuOK7jou86nQAx7Hx9wTtRpzX0xayRfgmwls=;
 b=P/NlHWJ4wdpPFNQGSDF81HNzgDwztxG+1OuqFzG+PI1H3gkZSMq1twfKT2vpkB7kt1wGE08XGtizvhJWmhplI7DBeJ1lVOEQw1Mm644HFLLmx6D70wACEh2pcRlfebdWYXcH5heMIkj/ZyVSseN07WPyQR/FJly1l34QOI4+gBFYNLYtEBDy1n2qMys2P2z+eK/qs/TiLC6bny5GgJKNyh5eSzk5jVubTFj7WoAG65xiS/qJaRbx4tOjNwQmr4/l+EIvDMmQHpT9Ymulxk8wO33o8QDj/fgjvgLemrAWl4txDMwR7eg0VUF8mh5ExrsB/c6SFJqCO2v4+XY/5Uk4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iq6Px3XuOK7jou86nQAx7Hx9wTtRpzX0xayRfgmwls=;
 b=UyOAtMBln/HP+Ub8xyr2lmTkFoLO8bCCJcC7IgiR7A7QmJf6BYfp5yxt9FRqa4cdOxVLuhBRGQW0L9HNLxEEUGNi135BWfc8HeGPagRi9KxsRfvowFWCtMLje3qJFn6q5IY3f7K0yL3+pigUq+qzrppzVVNjMAhuv6Qi/qyP7WY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Jul 2023 12:57:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/3] multiboot2: parse vga= option when setting GOP
 mode
Message-ID: <ZKP7KlyWkpB5gVD-@MacBook-Air-de-Roger.local>
References: <20230601130518.48874-1-roger.pau@citrix.com>
 <20230601130518.48874-2-roger.pau@citrix.com>
 <7453fd92-0dcc-c278-df57-f119240bae65@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7453fd92-0dcc-c278-df57-f119240bae65@suse.com>
X-ClientProxiedBy: LO2P265CA0288.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::36) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d25573-1963-4338-1d0b-08db7c7d83da
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dHlLMd9alJwyD1hLxb+Sr0YQ8uy5VGtnbJWZUTe7l6UPvl077ppX/2fLquTSwiqsed/ErhbmISB8NmVznzbTYknxNsInjeRQPFHUbIGWTTS2k6W8hbbZLgjpq1zUsqR9eQBFUaaZuGVhp58zD89CYSe6Tt+EqKeXK0Y0gMtGr4o0kL6Cs3HoqtQPKMhANSuDDnCqqJc+41VUcbj8zEGeiytcWm32VjF8A3KY71nVQlNAVkAss0wh2tmtEZVPdsAwABz6gX9iQ4DRvM22M8CpIVuQE2SLJZFoB1QE9HH+XRT/P9e7hs10ke+BZZLPdWMb+vWZiOwbysLNY2bngTaYqzp+lsjn1vyaVk/jM6dDXym5LgU/6mn+RDaW0A2bqZtbS6uEHzWiCwnhT6FxgC003cDTimnTFwfRk52wbUUENrsynBAo3P2pxF3EqE9W2oOI6UsDjIjjJcfQnFlX1irT8l7YENvvzoaRgcUxMxjMtUBqiTs6feB3heC5lBGq+U6eDXeDyLqXzUyvoEKGoRV3uEFbOyQDfRfOU/KgmmywnDQUYE87emi+OwYpksiymEZX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(26005)(6512007)(9686003)(2906002)(86362001)(6666004)(53546011)(38100700002)(186003)(6486002)(82960400001)(54906003)(41300700001)(478600001)(4326008)(85182001)(66556008)(66946007)(316002)(66476007)(6916009)(5660300002)(8936002)(8676002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTV1K2lmT3JkeFZSS25QeEtZeVBMSUl6d2lad2M0YjBtQ05LQ2xGYnA0TFZo?=
 =?utf-8?B?eG9OV1RvcE41TTY1L1JMUHA2cHpONlFvaldCYmRXbDhkUTdScE9GR1VYQkVN?=
 =?utf-8?B?K3FWZWtPNm16S0hWakZkeGo0a3FSWXpHcEdneUtaL2RGaW43M0ZBb2FFVGtk?=
 =?utf-8?B?MU01TEFzRGZoS3hTVXhXRlQzMVVDRFk0V2ZtUnFrdThpS1ZIRXlFNUdHUUZE?=
 =?utf-8?B?Vm5TMzQ1U0dVeElEWjkrdmdoYWFvVE1jb0JTaG9uNzBIVGlOWTh3aVVWQ0dm?=
 =?utf-8?B?aVBnYkk2MWVockxIclIvMTJpc015Rk01VnIyOW50SE8vYmdwUWUvdCtUYkNC?=
 =?utf-8?B?eGR4ZlZRcVJoYXdNRTlaN0R6clY1aUY4VkxkUHA4MVExamU0NWUrV0gzcW5U?=
 =?utf-8?B?ZmFZVWNQcEt6cWc0Sis4Y0NjVTBZN3RHUkxvd2ZFU2RwVW9aRUVHQklJVjNi?=
 =?utf-8?B?ODVjRWhyN1E3OWg0MzR3amhBT2ZPb0ZvbHpPVnZ5SlBUcHd5ZzVsV3o4cjNM?=
 =?utf-8?B?ekF4TWs1MUxPelZreUZscFRkdENZVklNeStCc05rdHF3djkrQW5qa0RBQ2hR?=
 =?utf-8?B?ZEFyZVJDbXJwNTArWXZzT3J0VVdMZEFsZzlIaHF3aElVOGxvdkg1S0NWMTRm?=
 =?utf-8?B?NitYaElqNmlOc2lQbGxqVFJCNWZmdkNEV2xxWkdHd0pVc2VIeWNOTDJQeXA2?=
 =?utf-8?B?c3BNNmVaSndUZWgwTnRFOTFzUFN0clZOcmovSlVyd09FMWFxZFlPWTU1TFlN?=
 =?utf-8?B?T0VNR1p0R0ZUTGhzOHpucHVsaGZ3ekpqVXZKL1RpTDg3ZXdXd3AwKzVpVHJI?=
 =?utf-8?B?MjZxK0dvZ0tucmZhcklGd2E0VnJYWUFyb3hiU1htVWhmMGF2K1Y5TW0zYTEv?=
 =?utf-8?B?MTBUVkhMbHJ2VHBqWkp5eUNKRzdCeW5vMVRJb2VlOE9IMWZYd0MxZmF6Rm5T?=
 =?utf-8?B?RHhqUnEwMklDTkRsN1FLMWtUOW02RmdvMWZMcjB4Ykh5aTk4SkMvamh4UDlp?=
 =?utf-8?B?VHhFZnBia3VOOE1VNzJqTW5jRy9SMkVkcEtLcDRCWVBzN28rUU9tNzk5RWZh?=
 =?utf-8?B?OTlMTWNEbWpMUFYreDN0NzgzUldBSGtKbzNTeU05VFRFVk84MTcxL1dWUExQ?=
 =?utf-8?B?b0JheDRFLy9pTlo0M3h4VXI3SWpTRVZyQUNIS2dZMXh6YVpwZ0Z4WjkwUXBT?=
 =?utf-8?B?SVFPWDdZQVRqTmFsVXZ5VDZVNytUU3dkTzlYTWNwL090QmkxYUZFcDVneGxV?=
 =?utf-8?B?ZUxhMy9kK1dSZHBPcjFWRzRxQVNXUThnWDJNQzhPYUpnRHFuVTdlZW5CdklT?=
 =?utf-8?B?TjRrVjVlSXhrZUw0b3grR0JyS0ZyVkZwMkZwVlFYaStJV2ZFK0pWMFJpU1Fo?=
 =?utf-8?B?aEExcHNndWhxNU90TGJkc0xoVUpEME40bkZxYXp2d2h0UjFzWXB4aXIrYnNq?=
 =?utf-8?B?UGNTczRUblp4ZDBGYUYyZ0NQSHVhd3NONzRzZi9SdnpqV3FaQll4STNaMzB3?=
 =?utf-8?B?Q1dLdUQzNW9TSXN3TTNWVXVoZ29xWm91aTlib0JmaWsvTGtqYW9idGlVRGVU?=
 =?utf-8?B?R3FIUmJjMERxRUlQM1ZaaTZOYUNILzd6RjZOL21tRkQrNHlmdzlxeWRtdW5Z?=
 =?utf-8?B?RW5yL1hCS21pbEVSY05sckNTNmhEdGlSd2NINE92MGp4bzVndEhvSUZUckow?=
 =?utf-8?B?RUxOYzJMOTlubXRscTdNeWdxNEp1VHlCR0ladEt0T2FjbWtyVXFrd2NyUHpm?=
 =?utf-8?B?a3VTYXZ3L1NLbnFlZzU3d1JGSnBlVHFjOTBHa1FJYlQwWHkvODJsMG15QVEv?=
 =?utf-8?B?STFoWlkrSHFUVkdpK1B2S2xIYTk1NzZ1VlBxOHR6OXI1WjhZS0t5Rit6d21m?=
 =?utf-8?B?TW1nWENrVFlTRVNUb2kwdmNaTXlFNVJ3bWtEaWRJWVdjM1d0SWVhQjZ0MmVu?=
 =?utf-8?B?bm42anVVai9pdlhiZkwvR1B3UjAvaE0rRVE1aE8wRmxFL0hUZU9YN3l0cnRv?=
 =?utf-8?B?SFA1eHFFUW01ZFBMTGdvT0pickR3Z3hXOGJVS2VwaGJZcTc5RFZ0NGtsYW5E?=
 =?utf-8?B?cUlyenZtdVkvMHUvdndlNU10NzJDKzU2YWRmOXQrVkYvS1ZhakxmK1FERzQ1?=
 =?utf-8?B?VWhzd2FJeUhSaVM3aG5DMGhiWnFNa2svckdLWlZVNnFOeEorQy9pZGdIWmhx?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uXIRyCe28mEVom+drVtGA2t7WaMBRxunBskRPWDKSfkJZQ3fx7BpTRnSNOh9S22VqyLYc9YG/flWARd+4gSNsANpnmejRZJVxZITwwzFNur77dNsANczC7YNmBSovKpEGKD3oLDGlCq8J9OPXk5IFNx6rEJGZi1ZvphOTQY5O2RwixMkq9nveBrqHmuFYJTUEHeWUEM+tV/iq/bKh/gtpfnxX+rZS7l0dp0VRIztfgLaf0FWRnNOHZZcK5yJ/c9m7nyQQsgUZUIagNcSo/quRoFx1/VOTMpc7K3iBMfwsg/PvZ5glq4ttkq1yO0/D2lKYZosrZb/xNeXDcdjuxZX27NV4xyFNsIfI6fap5WaL2SR8AniHPNAlMbKAALrt8PJc1upow5B1dfjijxSJsUHhD5l0XsW65lETWLKiw6qdwx4PxCoiLEXeKDH6BiBif0hiCJkG584Xw1KewjjurbsBZl/CYa12PbnSQiGLR1rC/wpxXevkkKTimfLlhWmyIMAeei/4SncRspwgi31b0j2uKo/THuke5HcpyxzdoWFEFyFZN1DI8kh89RjcW4SLIZAludc5XHbT7ToAvqJ3/Z+cNmD7SkKd8NuBBFAJ3k4K6zcqwIDV2npzII4lPFT0Cpbdb5Xqf41PLi4jLaTljINqwYfqWdfahdfQr2MoxMBvD29yilHzFhH0fQFiD9K0AmhrNT+vX4DzvlyQyeqBdqWLGAYmPG6rgZovv+WEa9p8MLd+S2uYD0V6CSusW5W8uX/vo7pjZqw72cZ5JGutdcKH11YOGu1Dyku7c9OxYHj3f0W3NdbBOFKcBks5qh8+OAK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d25573-1963-4338-1d0b-08db7c7d83da
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 10:57:53.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sE3Wrmgs4axKLzDy1lnVCp9Sakx9paxdTdUECrUdRi2Iq0TvSdjD6zBYwmvsn7u1f6gkNpStrwIUg9guXt1A7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7056

On Wed, Jun 07, 2023 at 12:10:28PM +0200, Jan Beulich wrote:
> On 01.06.2023 15:05, Roger Pau Monne wrote:
> > @@ -807,7 +830,41 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
> >  
> >      if ( gop )
> >      {
> > -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
> > +        const char *last = cmdline;
> > +        unsigned int width = 0, height = 0, depth = 0;
> > +        bool keep_current = false;
> > +
> > +        while ( (last = get_option(last, "vga=")) != NULL )
> > +        {
> > +            if ( !strncmp(last, "gfx-", 4) )
> > +            {
> > +                width = simple_strtoul(last + 4, &last, 10);
> > +                if ( *last == 'x' )
> > +                    height = simple_strtoul(last + 1, &last, 10);
> > +                if ( *last == 'x' )
> > +                    depth = simple_strtoul(last + 1, &last, 10);
> > +                if ( *last != ' ' && *last != '\t' && *last != '\0' &&
> > +                     *last != ',' )
> 
> You check for an appropriate terminator here.
> 
> > +                    width = height = depth = 0;
> > +                keep_current = false;
> > +            }
> > +            else if ( !strncmp(last, "current", 7) )
> 
> Don't you also need to do so here, and maybe even ...
> 
> > +                keep_current = true;
> > +            else if ( !strncmp(last, "keep", 4) )
> > +            {
> > +                /* Ignore. */
> 
> ... here?

Hm, quite possibly for correctness.  I felt it was relevant in gfx- as
to avoid things like: gfx-1024x786x32x64 being handled, but the same
could apply to passing on option like current-bar.

Will try to generalize the terminator parsing so it applies to all
options.

Thanks, Roger.

