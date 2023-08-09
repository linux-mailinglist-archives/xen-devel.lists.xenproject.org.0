Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634ED775753
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 12:44:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580847.909291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgfv-0000sS-LG; Wed, 09 Aug 2023 10:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580847.909291; Wed, 09 Aug 2023 10:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgfv-0000pz-Gq; Wed, 09 Aug 2023 10:44:23 +0000
Received: by outflank-mailman (input) for mailman id 580847;
 Wed, 09 Aug 2023 10:44:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkWR=D2=citrix.com=prvs=578b5fa55=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qTgft-0000pt-IK
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 10:44:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afb77466-36a1-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 12:44:17 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Aug 2023 06:44:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5027.namprd03.prod.outlook.com (2603:10b6:408:db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 10:44:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 10:44:11 +0000
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
X-Inumbo-ID: afb77466-36a1-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691577857;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XkIoWwn3MaIHGEJIW6OGud/vIUMx5fHuhQewOctn+8E=;
  b=EsVi9boNbCGaBPENBp96stJgmMZEZvog93umWTlVwtrSrkMB1PxAZt02
   vlshItieR+Rb2vcdLgvyYkXcZLe7z3R3FMoxY/GdM8ieBGEBcR6J5xUZl
   d39wg6LG88HIDg5qhXEksdGCpparKQ6zvcvEcGdZmgIPr1TH+S/zZ+Riy
   M=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 118857517
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+e4jJaJ/w747KhD/FE+RxJUlxSXFcZb7ZxGr2PjKsXjdYENSgjADy
 WseXj+Cb67bMWeheNx3Pdiz9UxUupKDy9IwSAtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gRvPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4uC05U2
 PggBAwCdzCJv+vqnq6ccbBV05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMkmSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqrCN9NSeTnnhJsqHGU/2MJJDAsbEG6hvOlt2mPR8hAK
 XVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S2+Z97qShSO/P24SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMS706
 yCHqm45nbp7pcQGzbmh9FbLxTelvIHUTxUd7x/SGGmi62tRbomvbZ2l8ljf4PNJKq6WS1CAu
 D4PnM32xOkKDIqRnS2XBusXFbei5u2tLzHXx1VoGvEJ/DOr/XmhcYlO4SpWK0JgM8JCcjjsC
 GffoRhU5YNTFHKyYLVrfpmqDMA30annE8+jXffRBvJVa554bxOO5yBpTVSZx3zqikUqnqA5N
 JqBcMCjS30dDMxP0j2yQOsM1K4x8So3z2jTWJPTwgyu1PyVY3v9dFseGF6Hb+R85qXUpgzQq
 oxbL5HTlEsZV/DiaC7K94JVNUoNMXUwGZHxrYpQa/KHJQ1lXmomDpc93I8cRmCspIwN/s+gw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:n7aLdK1xF4PltBIio5AETAqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: =?us-ascii?q?9a23=3AJq5NuWtqW4yC7fhEWOFk5Vwu6It8eFLH4XPoD3O?=
 =?us-ascii?q?3EEZjcLTJF0O3w/pdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AjkXS6w/T+a5K/jdpFEKaVdeQf+tv2qu0JG03qI8?=
 =?us-ascii?q?HnMOYCAtBJy2Cjg3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,159,1684814400"; 
   d="scan'208";a="118857517"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLT+UIxaHvAnQMYtx8sI1OIKmb0jBfDI1TfG9rpkvH1NDHv3uAB42UyAvnFbqtn2M2Z1S8QI/xUd4tkaS/Ze5plyBMUGtQqfde38w0Je6m/vBoGRUrk2mvFBHelI8jyRE0QdTMSvkBy9rhHg2yL7JVOGvCZxY2uR2RgXquRP3XkDiu13cwFXqI4cLPuHsh5a741ZUDrlHJqTJEEWczG3BbuNJfeclkpO06SKOHt2CwISQR4tG+oHSV/+8irSxqon/cop9nYikSJoxL3xlYDA+yrwdyi4837JX+Q0/qD0lfWBHytORfnoqnUNuI1/Yk2AQeTHUU1TlXrbPt+V2IFR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkIoWwn3MaIHGEJIW6OGud/vIUMx5fHuhQewOctn+8E=;
 b=AAqsCtK7XDrJb7MFXjIkTcTqWt9+bnx7CMi1uG9n9C8CYtC2Ded+AQYxDUexfBLaLYZz+qcQal7lCdO7PKKqpeLZTngLfLvjA7YLX2I9VNxS7q4VKOLtmedfn2/4Ieg5xGmTnQKX+c6OxYa/vjwlbSLH6qz7qYJe2jwmMVzq6B/eb++T8nIUo2t7ofl5zbfMG7hdQjbNqb7P0KG87CqtBKG5pZN++wls642CjezrszfSaG/Y+e8dWTWjccNxV8mJ7uKjr27WI6oIpydAcNDRuSVSUFZTBmEAv80tEjrwgonlbs3PiLk6VJ5yRPNQoIJfJHvOGGwH+4y6Wp0MNx/71w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkIoWwn3MaIHGEJIW6OGud/vIUMx5fHuhQewOctn+8E=;
 b=p6ZX9pKuuQ2qGDKPKTKIG9mGpZXEd13A/Vkop3SKmJsxnrspZsLwBev9Q/W1NgYxaFGEEvnPHXEmeWiYyMw0pOTFZ7w5ghvVEQ6GGtE60gkS8Fyc5nHRk/WcCi1rhTggUgqhCBLku7uUtTnbAxRW+oICWrfxuN+/1kIDAjxojSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5c4ebc77-0a1f-0b66-7423-966e88091644@citrix.com>
Date: Wed, 9 Aug 2023 11:44:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] common: move Linux-inherited fixed width type
 decls to common header
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <652ef09f-3654-548a-37d7-bbc46cbda177@suse.com>
 <c641b981-54b8-d3ca-26a4-28331dc79ca5@suse.com>
In-Reply-To: <c641b981-54b8-d3ca-26a4-28331dc79ca5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: 7983e89a-d755-446f-45f8-08db98c590f0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LaSwZATaDHM1W2bOVvMKIX7SmnA6XjeS/5r/3cXIgr7B9b/GDbbUdekvO4KBtzejaRx6uqHP9yjJsyNG+IJNLch3gl/8xKdX28noQWlcDpXB0CmCvWFg1D0AILU41yI/rvx64zOdvpeLw2ItKDyrwDgFDNyroOMYSdtW93dU1s5PEYZEoI4SRJSc01cyM1MHHeRiAtrLjyZhrAhhCVSjjOPKLLRKO/d//SV9WVyYNuaLeXy9TKeqc8YlN3fXtOccwWOP0yqmxNSD5cJp/gLSRaGxGo8jwE+bwiV2b8llgqGxCkIh9dkRboNOvt6+EuKSO9Vbf4yYTmRkDX3oykODeEGBn7oxrgZnx99aOF6WCa8Dx86Mz5PV3ghFSQ8yhPlFMxMA8mI2oxZaj3y//u/dJ+NcdYwahZ7OLktwhUBx5DE97Ix4YgfTR9KxMJAlPZiljmEEYMR/O3aPqc0aiDtCcnY4YkF+v6un3f3PmXx28mE0pFeQI0ROhDtBLNZ9yiKAoNeiqKXstjvHF4RhcxiE+1oqN7jX27VFfbC67sIGETMZi5AuT1DM14TA5RaUw1DJW2wr1PCswUoEGEO9mOblgyv23Y/1Dv+zhRwkQHHFxHKt9pyd8fy+DfaK1AvVLnvuZTJkpjY9OzB/hFaYchfr/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(1800799006)(451199021)(186006)(8676002)(31686004)(478600001)(8936002)(66476007)(36756003)(4326008)(66556008)(86362001)(31696002)(66946007)(5660300002)(7416002)(41300700001)(110136005)(316002)(4744005)(54906003)(2906002)(82960400001)(6666004)(6486002)(6512007)(26005)(6506007)(53546011)(2616005)(38100700002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emt5bDEvVTNoNFZyNG9KeW9tbnp5YjF0R2xxN0RaUlhBdXNOcWNwT3pqQ1cz?=
 =?utf-8?B?VUVBektoYU1Ic0ZibnRzMjAyRHdMNUljY242RmUvWEZObTRuWWdzZldoUHBn?=
 =?utf-8?B?ZkdXb3NPOWU1blBNTjFCcGFSanFHbXNDVk1vb09VQ0hpN2hKcnZSYVpESGhr?=
 =?utf-8?B?cGRxeUJWY2ZZRjlucXRkczhiMWRiWGlWdFpNOWJ4SU9QK0Y0MW1PcEQzOTRD?=
 =?utf-8?B?RENoWkx3QUtBWjBXOU1MYTRlbzIvRlBsYmZCNkdkdENxWXlwYVdWOUVzNGxK?=
 =?utf-8?B?RW1qTHppL3NIUHMzQXMrVnhteXpJSXRQaTF2TWQvOGV1cnlBVlplTUtyOTdZ?=
 =?utf-8?B?NmQreHYwaER5a1NmamxZdHhwaDZsRlJRc2FxalB5SnAwMVpSbUVrQ2tHVkd3?=
 =?utf-8?B?RGY0QzRnWUVGWkVmTDVCY2FRTUUxR3ZhTk8zSndQTDBSS29VQXMxRmo4MVlI?=
 =?utf-8?B?Q2lOZWdQbDNhWFoxc0NBcXB2MnNXcnhOeW14Um9lRkdpMCszOUNMWndJVStR?=
 =?utf-8?B?RVNmZnBxTmMwL2d5ME1lZUJSdmxhc1lROVQvNytTd2RidEUrYTNwSE55blBw?=
 =?utf-8?B?SlJLMlltQW1ldVViOGlSRFp2bWdYRmhlRkhmRU9WQWxuUHQ5dlJFSkIvL3ND?=
 =?utf-8?B?RDFzM25XTmlXOHVVTDFFT1A2SjJnUnFkOVRRcWFYNUdaSHVPekkrVkhNRUFS?=
 =?utf-8?B?dkpzcmRYVktUeTVFTTZPTnRaaVJ0a1lBeW9maFgxVnVpK0Z5Z0YxNnNTdk1P?=
 =?utf-8?B?dEdwbDB5OGV1N1RvUVNnNE5USWdwZ1E2WlZoRzAydlpRUytWMzhRNzdjc2Fh?=
 =?utf-8?B?NEg5SzkwaExGQnl5NHI4ZmszUGRaRnZyWXo1QTdVV1UveEYwM01nb3FNQU5j?=
 =?utf-8?B?c0ozZDJ4LzEvTEtDOFVyNjBpZjlEL0lycHlBQ1dNUVRyUUZsT3dHU2ZEMFJo?=
 =?utf-8?B?WWdZcFpNN1FuYWY0ZEIzNnlGMTNDcVlMQVdwOXgzOUxuUWsvVEExOHp3WjBP?=
 =?utf-8?B?V1BuejRPQklnU25CWG5Hek4zYk1scUpCNWRxLy9MREdiQXQ4a1hrdnhDM0Nq?=
 =?utf-8?B?TFRRWGRwNDI1ellESUNqVHdmZit2TU1tR0ZGaE15eHFsMEZ6cWJmd0Vya212?=
 =?utf-8?B?bFhyM2FEd2gwWUtYNHpKaWdFV0gvU0UvcVNqOFFjWXJSK2NRRmNReStGYlRh?=
 =?utf-8?B?YmRxd2xiVmdXaGdRZHE3LzAyTms1SWs3SHl0elhHeVZoazRKU0hpbndmZjBi?=
 =?utf-8?B?b3BhUWZkQkpCTUhIRkpiYkZZeFVreUxtS1BWWFdKME5ySmxUR05kdkY0bXc1?=
 =?utf-8?B?R29OM1BVbzJzZlNlWFpsRktyRXhPN0ZOTFFsRmNPcjN3TFlZUkJrMGg0bzgx?=
 =?utf-8?B?TEJOZUcrV1cyRkdQTmFPa05SbS80MHExT2ZBM1ZtaXp3T09BUFF3Wm1ENTEv?=
 =?utf-8?B?VWE0azk0ZEZvWWcwNk9peTFWUm93RGU2VXd4aE5JUS9Pei93aGgvaXMyZU42?=
 =?utf-8?B?Y3hNcTIzRWVrYVJ3VEgwamZuU0NMQmZ1Zzl5cWk4VUVIbDRUWDE4ZVRwSzZQ?=
 =?utf-8?B?eTQvU3hmRjYrbk1yT2FVZ0JLaXR5aXFaMG9YMGp2eG1jT1NnWXUwOVBocTdh?=
 =?utf-8?B?Tzl4RTRDWGFqaVM4eWlZU3VZZlNzcGhLTXlDQytKSTl4TEU2S3VBSzIySlkr?=
 =?utf-8?B?bkRoMG9qK29VN3VxZm1zY2hDMjZaaDRrUHdkMFZWTi84bkpLL3hQeFNHdW9G?=
 =?utf-8?B?SkFOM0YwdE1qU3owWUtPSDhmVUdaZGRtOS9JejBQS0VrbEQ1MHc3NGFyMm5D?=
 =?utf-8?B?Y21pSGhFTU94TTQ5ZlkvNmE0S2NrQml0OGVJS2drSE80ZnIzSU9xUGJCazdP?=
 =?utf-8?B?bHdMc25EQ3VUYy8zRUQzM0ZCTmVKSVVMZVVWeHltZFYwa2x3b0wzU3VpV0lm?=
 =?utf-8?B?WnlobDZCSzJDOHdwalo3Mm1zR05NbytXVGh2NnBrSjNDTlJjOEtlSmx1Nm9v?=
 =?utf-8?B?NUVONFpWZmhDR0w3RTgrNUlBK3cvQk1QT085Y28rUXlKUjd3ZmZnbXhUM0VF?=
 =?utf-8?B?eE1uMWJpcWx6aEFVUU1mK3FUMkFNVkIvSGxOREc5R25aRmJUZFkzNHR3Nko1?=
 =?utf-8?B?RDdtYmR0U2xNbm5ta0E5VklxN1IxeEdYbHRmR2UyRjFFV1Z2N0VXVU01ZmU4?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?SFBNT0tnV1Y5R0RnWFdzaU04NzJ1Q2lpbno0aUlLVTAxRTNTbjFoQzI4WEtL?=
 =?utf-8?B?b3dKQkZKeXJmVWRRMEZicXM5ZFVRdEM5dXJ2QUNNQXV0Z2J0Wkp5V2tVNUt6?=
 =?utf-8?B?YTR6a3dWcjI5RkxNWVhBRnVUcll2ajkwbHJaMkpNY0dMMW1LMTZzVkZpZXNh?=
 =?utf-8?B?MTR1RVREWmNwbG1JN1ZRVzdkM0x6Tm5ZdDJUTExJUXVJOGJJWEFESmc1YW1k?=
 =?utf-8?B?aDZWRHJoTDVkUVNySlNYKzJLYjh2NkNNalhyZ0NLeE1pOGlqUm1ucGh1cHhm?=
 =?utf-8?B?OTRRWVdncmdlYTQ3WllqT0d5cFZMZmQzbm9iWUtwYkxDZSttODl4RHhIZ25R?=
 =?utf-8?B?aVcyMEFNbU4vK0pSbDhMVDgrUjdGMzAvSmtFNk9pNkxmbCs1RTF1eFNDR0l1?=
 =?utf-8?B?ZURqMCttT3F1VTVtUXpxOVJLWXBrRndKRG5JY3pTVThpN2VQeXBJUDJMaUR0?=
 =?utf-8?B?a0lyS2pRVGI5TStlamtSYitsZGxJOE0rdzZmdTBmY2pxNG5jdDhkUDVkNHRI?=
 =?utf-8?B?bStNZVZxN1BXWmQvZHoxa2s1cE1qN05JcFVZVG8zY3BBQ3ZMR0FZNDV3ZVNp?=
 =?utf-8?B?eHYxUzFlaXFJK1B5UlJaQ1FuT1hPZ3pWcGxoWFgvVnBLeWJQVDNtajNkSTE0?=
 =?utf-8?B?WVlyd3F2eXRuSDAzejZxS2dhbC85bVZERzEwTG5GSUxNZHJmTzVTSjU3a2Mr?=
 =?utf-8?B?OGduOU5laWhhd3RGaHA3aG9Qd1B2RTJsNVQrUThac1FWdzdpVnNubTdoRVht?=
 =?utf-8?B?WFhxQmJUQXZkMmZzc2ZGNmpoYnVqeTRsdHEyWWJ1d2tEdit0Nm5oeHNtQ3pv?=
 =?utf-8?B?dFk3dTVSdmwrSnA4OTR3czhFZUdqYllzWHZwNW53QVRHTXV6Y0pONnI3a00x?=
 =?utf-8?B?MmxlZkFYTWlhK2UzZGcyYmgzenFJQVVib1BmNnJLYTBYc25FUUZXSFFJeSt6?=
 =?utf-8?B?bnZ3ZVZxTzg1ZU4wV1J5TlNWd3ZtQmhWVExYWjY4NHF3S0taQkhFcG9UQWsx?=
 =?utf-8?B?Rk9DOFF3N3pUY2pmNXdJOXU4RGVhTEVaNElMWFJiOHE2K1d3aWRNSEhZTWVC?=
 =?utf-8?B?SGdhYmdrcTQya2VoVzU3bjA0YllUTzg3eU9ya1ZaUnhBZkRTOFZKV2Jod2pN?=
 =?utf-8?B?T2JWd0ZCMk5URUJWZFhvYWhPeWoxZVlPZnFiaVVVV3duRU4xZ3pVUnZISzlo?=
 =?utf-8?B?WVpjcjRmdFNBOGNtN2RiR3pUZ2hmMWxvTzZJSG10NE1jak1jTklpMlBvY2VF?=
 =?utf-8?B?bFUwc1I4NXh2ZWJOVjVyUTBVSHRBM1pnWWNHdThZR0NaakdrTVhHeDh2bmdl?=
 =?utf-8?B?MjVydXJQRjhxSnRMKzNjSmpEeWVyRFRvWjdwMTJGUFNySCtsUCtuVWIrTm5Y?=
 =?utf-8?B?NFRGWGFXN0xCRDZ0MjdNd3dhZkhTMDF4VndDeHduVmU5ZG4xWjhPWE0zTUZj?=
 =?utf-8?Q?E8QjB/k3?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7983e89a-d755-446f-45f8-08db98c590f0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 10:44:11.5819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPxF0dyqjIfu+mDmbfEmougRCiMsfz/wp0SqeLhpuUoOYvc7t4pK0vfgJA4ZQR+rgmK9iziyzyg0B6dmqaNOygF8B+2LKV8bftNHCLgk2+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5027

On 04/08/2023 7:08 am, Jan Beulich wrote:
> Have these in one place, for all architectures to use. Also use the C99
> types as the "original" ones, and derive the Linux compatible ones
> (which we're trying to phase out). For __s<N>, seeing that no uses exist
> anymore, move them to a new Linux compatibility header (as an act of
> precaution - as said, we don't have any uses of these types right now).
>
> In some Flask sources inclusion of asm/byteorder.h needs moving later.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

