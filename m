Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2CF75608D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 12:34:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564367.881840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLLXx-0004y5-4N; Mon, 17 Jul 2023 10:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564367.881840; Mon, 17 Jul 2023 10:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLLXx-0004vP-1W; Mon, 17 Jul 2023 10:33:41 +0000
Received: by outflank-mailman (input) for mailman id 564367;
 Mon, 17 Jul 2023 10:33:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdAb=DD=citrix.com=prvs=555bb5b00=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qLLXv-0004vJ-UA
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 10:33:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62ca9183-248d-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 12:33:37 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jul 2023 06:33:18 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6531.namprd03.prod.outlook.com (2603:10b6:806:1c6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Mon, 17 Jul
 2023 10:33:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 10:33:15 +0000
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
X-Inumbo-ID: 62ca9183-248d-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689590017;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XYpwQigsrHqEmtwtzfASfq63tkFy2k7KiZXZw2MfmRM=;
  b=AVSjXAZIi5ISu5qesQszIPoie//dx8z8vPI3jyPY7yDfgAahznjBm0jS
   ZEv5KxpF0C6hFUT0CPU4b9f4NNXW8I4+w4OYGsRtOyZRdGsAfKLgiyWcp
   7FlRB9SRrUH2ViFX4L71/kd5hq46YYo8JqItIdUz0KyAaWZuFT84cK9z7
   E=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 119028554
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nCrcA6hKR1uvKr93CkMkvi9OX161mBEKZh0ujC45NGQN5FlHY01je
 htvCmqFbKmJZzT9eIsgPomz8xlQ6MXcy4MwTwc9+CtnFHwb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4waBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQBMT4IRDHYwNnm6/WfR6pVttYFHdHkadZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTprqQ63QDProAVICE5aQe8gfnntn6/UugCe
 mwFqhI385FnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakcsVgoA5N/u5os6ihbGVNdlOKSogcb4Hz62y
 DePxAAxhrwVidMA3uO/4EjOmTOqp7DDUwEu6wPYGGmi62tRf5W5boal7Vza6/doL4uDSFSF+
 n8elKCjAPsmCJiMkGmHRrULFbTwvvKdamSC0BhoAoUr8Cmr9zi7Z4dM7TpiJUBvdMEZZTvuZ
 0yVsgRUjHNOAEaXgWZMS9rZI6wXIWLIT4qNuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:VPcTFa1rFz/5QPSoIyKPyAqjBa9xeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtj4fZquz+8T3WB3B8beYOCGghrTEGgG1+ffKlLbak7DH4JmpM
 Jdmu1FeabN5DtB/LjHCWuDc+rIqePvmM7IuQ6d9QYUcegDUdAe0+4TMHf+LqQZfnghOXN0Lu
 v/2iIRzADQBUj/I/7LTkXsGIP41q/2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbfyJTzawk+W
 3llRW8wqm4qfm0xjLVymeWtv1t6Zfc4+oGIPbJptkeKz3qhArtTIN9W4eatDRwjPCz5E0smN
 zspQ5lG8ho8Xvecky8vBOo8Qj91zQF7WPk1Daj8DbeiP28YAh/J9tKhIpffBecw008vOtk2K
 YO+26CrZJYAT7JgSy4vrHzJltXv3vxhUBnvf8YjnRZX4dbQLhNrbYH9EcQNJsbBir15K0uDe
 ErJsDB4/R9d0+cchnizyJS6e3pek52MgaNQ0AEtMDQ+z9KnEphx09d/8AblmdozuNLd7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWO7Oz3cZeE6EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCPeJwIZA/nn2MSSAtAzWu4NjDqVCy/jBrOKBC1zGdLluqbrvnxwnOLyZZx
 7pU6gmRMMKLgPVaPJ0NkPFKt9vwEIlIb4oU+YAKiOzS/3wW/3XX8zgAYDuzenWYH8Zc1K6JE
 c/dx7OA+gFxnyXexbD8W3ssjXWCwPCwa4=
X-Talos-CUID: 9a23:UEnGXG0u35ETn5shdGqIC7xfA9krd1f8lzDrc2T/LWsqcY2Hb26I9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AzlOzcwzCsgASQj5gkY5OOnSYyZGaqJiBNBwKsZV?=
 =?us-ascii?q?Yh/mFPBYtaheM3AyuHLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,211,1684814400"; 
   d="scan'208";a="119028554"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgDOnPvGdA7OU3Lz9meWGoSYAUVkp2fXd9DqIt/qYgwwsIDjAEE9d2GEqsH1r3IhTlA4+ub3xdtI+DfdUlW8X4s/1A29BkjFYP1mePBFIbof8jSz65JxgHY+m1UKkb/Em9TVtDyjb5THC1U/q0tO1pWBHvO/mdjQMq9ANb051olQhPez1jUvMkRcgqVr6Mq0S8k+dWxYIUKRyzXwFYX12LsQuWhOndtvCcCf0lvQmh1IHwhjZwSqxLFJya5SKXkeAwkM/k+5yZtFjv+vrs86nRcDWQoqJzu7hmi7s2Q/yVjgUBQOxo4ujMQEhDCLuc4/HGjLgwaJMif4QQFJCkF4vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMCAIWnR94lxNyTfBZ3Asp56scvrJYvkRyhDpqroCB0=;
 b=XEFNilYw7tacQgiYG0bAlbspT+sweD4kqGwBn1p66lS0dKwgGIrBSX2pOxg1R3B2uoxtmJOZvAHo8Vtri9cREqt9z7D2oRpoeFE4wDHBMHWhkGUYTJeZi0HhYpV331wtG2OlebG1fcYsHeriwhCW21xDRSRXlO4EBjAuWs59/GS0TzmbmH4b7S2fwWBi35iDNjQkZSt93PuW12T/VcS0ftiYKiqwA9mnNJETkbBjJM3ic8VxW0sPaQkgMIbI6b1RyFiU3TJEEI6L0Ytr42fPd0nt56xXO9PlKBLc2Nuu4VlXdBo1FsDGHQlyAoCRWzRdahojBgVQW+UJJlEeQNaOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMCAIWnR94lxNyTfBZ3Asp56scvrJYvkRyhDpqroCB0=;
 b=jaqjpl2kCrY3DAkx02HhhundQuTYbH35+BDXuQ3asQZM6Ma6/ey87IXLQCEptHUkCJr1IY9ZOwzMEOJIqcaqgzc4xi2DGJKUWXkRzmhFrRLZyMhf4xUjl87hRwDKAJpwy1jnApFxdEzuj0fbkYlpS1V7jTG4jQ1n1yc7UC2gMzg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <38707d09-92a3-2807-4bf0-167be5c3bb15@citrix.com>
Date: Mon, 17 Jul 2023 11:33:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: drop old (32-bit-only) MSR definitions
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Simone Ballarin <simone.ballarin@bugseng.com>,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <df2c3154-2e8b-194a-ec1e-472819bbf026@suse.com>
In-Reply-To: <df2c3154-2e8b-194a-ec1e-472819bbf026@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: e54d4c2b-21da-4f13-84a5-08db86b13aa7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H28aIJHypUgBxqAZYqejy4sjjk/Obk/N8qo6xPa8l21/Cx2PG9Fiy9uAD82WjdGOZ4A61FjKeZ8DCRYsmbm3JJsb4pZb0j7lB7C4u/Bh543fI0PXBVt391Isze/X0mfnRKVB2whck9k7V4a/joeeWJ8/4ouxC4CnerYJU6oEZwfB4XyjfVxyxK00qi8abiW9dtnQ9np1BYGqoh0dH2uRDaQSVTxth9fZivHDP5hso+PVibtzZYQJkkAxctvzkksTCXazFZiI9eIBzb24LIywayieqqtqyf6waXWICPnyX8q9E7/SSC8KiTM3A6astY+AyJPV9qxwEwHu+EGgOhNwYPSIOyAv6Yc32i1lHfvjxPBm0m7iE6fJLbrrhEG1TDkX1HsEcque8gIaP0g5z5rF43dnpDLBsdyMB9XnI2JkYww2pRqrb6yZmnjU+i+zUUintEDAA+ws2ZUQVCL2KjXgzZWHLqwl9OWm9XfC19KXZDtY0u0aFPrjK0P922VU3EqvAnbZTE768XUtIKDZ0wIQxATKzUNgrM55c0DMjCHKv32PLqi5L6GirSEYXj40x421A6sij+eK+OlW6HBU+Z3gW2ZoHD6zhrcp7JSTM0cKzpYyZyLxu4KWrciw6fPa2cgwVQx8LxOSeTC4UYumQAsrTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199021)(2906002)(38100700002)(6512007)(6486002)(82960400001)(2616005)(26005)(53546011)(186003)(6506007)(31696002)(5660300002)(86362001)(36756003)(8676002)(66946007)(6666004)(41300700001)(478600001)(110136005)(8936002)(66556008)(4326008)(66476007)(4744005)(316002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDAyQ1RxZDMwSm9KdSt6WVJyNlJKT3F3ODdVWWsvaEF5emV1MFhkYWY1Y253?=
 =?utf-8?B?dzBBMjBSdkxPR3J6SnV1Y1JzOWE5L0EvZDEvZUFWdlZwWHQ3L0dUWWlwbERy?=
 =?utf-8?B?MVJ3MXdnbHNGUC9QRUUweCs4bnlsN3lrVStlOXdsRVFMZFhJVHV4d1pNaGVG?=
 =?utf-8?B?SkxmR3pnSjIycGhyWll3T1hBYWZ0NlQ3VzFEVlpTaVJTa2lFRDdkOUE5SEUz?=
 =?utf-8?B?bDc1Sm1lTWRTcy9UdFVpSElocHVwSGF2T2Y1dEkxTXhFSXVNZ0g2S0RpVWY0?=
 =?utf-8?B?Ylg4Z2NmbTVWdW9SVXJUUUxWeTVpL21lSjVpMndJUnVSVXVMajUrekNqTUNj?=
 =?utf-8?B?dm93dkkrRFl2SExwbDk0Z0dJNk4yVm0rdzlVZ25QZVJJd05wS2JqWVduUnlH?=
 =?utf-8?B?Nk1aT1R3NE1Ec2l2emZjblkxV1RjUnNZMzdLdzBrZmhLbnRHUFUyNTc1Z0Yv?=
 =?utf-8?B?V2c5THFydnZBMkZNQkJVQ2lCOUZURXYyUnhwYzRzV2o1ZjlHTFpMSDRlZnEv?=
 =?utf-8?B?WVFYOGNpSDJTZ0hqNHlGclgxVTdKZk1kSlRZaW9hS0ZxL3NDS29BWVQwM3dJ?=
 =?utf-8?B?bnJFS1FxMnpWdTRFUzdLRkhoWFBXb0xKanMyTjN1dVo1T2NyZFRUaEpoaXF5?=
 =?utf-8?B?M3dpVEUwMWFpQWdhdFJicGpVeWxBVm9HR3hrTS94R1FEd1c4Q0lWdUtPQkxY?=
 =?utf-8?B?aFFTV3k1WUJRZTRROEZFWUVuY3diZEVubXlyR1JiZ0NHQ251alV0SUNoRlhD?=
 =?utf-8?B?aGZNaUtPTkRHOWIzZVNVaVJpQ2RqbmNhYmw2Y3l3cy9YVG40bUxJcGJHeXJV?=
 =?utf-8?B?WVlzM1hLaldDY3I1M2YzamFDN1RlbVU2ak9kYjB3TGRWSmc0dG9SNTl3S0Mz?=
 =?utf-8?B?NHZ0T0MxMldxNnZMdG1CZkw1cHF3SVFOb1hSOVRBeEREaHpCVmNodTRHaitH?=
 =?utf-8?B?N0FlOUJTZmwya0ZiRHBZd2ZKdjRQOThaUU5yUVZnYVJsdGQzeUFpUlh4Q1F5?=
 =?utf-8?B?V1JSUUVxL3A3dUt6TTIvQ3N5bk1PQ0szM1VXUzJsbUp0czVnSHlLWVNDNldw?=
 =?utf-8?B?ejMvVnpqOSt5WGQzVFB5ZXBxcjg1WE9zRmJ2MmYvVENMWW40TFpGL2hrMTRM?=
 =?utf-8?B?T3FiWEJDTFM0eGhwOVdGTzRxSmNKZUU0dXJaK3JjOGNUYWNDc1FKYnh1clhy?=
 =?utf-8?B?akNHVkpGaUxER20xMHpTSXdsMkQyMHFoakpUTjMwRGZHVVZKK3JkaHd4SE4w?=
 =?utf-8?B?TDBadTJvNGV1aHdpVE43US9vUUlEYmpyU1U5SFhUdnZkcFJvT2VTQ1hDQk9p?=
 =?utf-8?B?SnVRQzl5Q3VoWll2M2Q4aVNGVGgzeEZKWEtGZ2I3M1N2WWlJUUNYUGVqUjc5?=
 =?utf-8?B?S3dFY1NpaHZxckZISWFsem9YckllM0ZoYmthcFhPaTlsUjh6QjZrWkdQYVFv?=
 =?utf-8?B?eVhPVmNBU05zT3FlejErRkk1WldSdnQ0bzFlUmFIVmR3Ym1Jdlg1QkU3dnQ2?=
 =?utf-8?B?VVE3UW1NWnFFbjIxZUw3U0FURWNhNDhOQWoydDhSRExFRE1PSkFTNTZiS3dv?=
 =?utf-8?B?bW15T05tWTF6c1NCbm94NUQ4aFBUaUpDK25pakNuUWVIYkk5eUgrZ2dxWGx0?=
 =?utf-8?B?aWNPRVQ2emVlZ2xCamFDVDlTTjQzcURMSlU5UlFNaTlCeENYNlhwbzFGVXVH?=
 =?utf-8?B?Uzk4VUdIaE1SK2xqM0hGalhybkdqLzZobE51SzVqZ1FQeXUvbkJuNGNta0t0?=
 =?utf-8?B?VHRGSy9GdEVmSE5UeFFXTENXRXZERGNmdCsvalhUbzA0cTMwUVM4M29VT0JX?=
 =?utf-8?B?U1VYUWxjQmJrcGRLNTNWMzhKUklVaUpiQ0x0eER5Wkh1dmxMRk5WbThYRmNZ?=
 =?utf-8?B?SC9CMGFUTnFHOVBQSFlWbU5yZEwzRjVuc1E3MkRIKzlSU21XdXV0NEVmTklw?=
 =?utf-8?B?QlUzY1BvZytZWnBxVktJR1ZrZEVlTHl6RmVkWjlBdXdVM3IzOXljQkRIeGxw?=
 =?utf-8?B?MjNDUUNTR091RUdYY3daRGp3emgyZHQ5WnFzTDc0bzFJRTRYelYvaFNvU3ZH?=
 =?utf-8?B?ODdObEQxNFJqZ1cwRDY5YXpqNVdtV0s4OTJON0VtN2d5UHFoSS9zUmsxdnkw?=
 =?utf-8?B?YkJYKzNLbjlhWmlod2UrVjJHSE1ZMEc1emVRVm9lMTRsbkpIMWswQmI4bGpa?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GfJ/oRC5Bb+vqYv2PzrEdKgci4T3FQzAwYEEPZvmcde4fV2l5QezxWcj6LPuAXBbwQ7t/RkvMoRkdM9eQxNmE0dX2Y11oXXjACGiPP6C34DTC85p0WlKk55wtbgyxSzLTE29oM4o6QWOeYKTMp+b5R1F15SzFfftTjin7lFpX1gnmy0gveOOgDJVYxbf1XkkfdunIKzuqON02NrtWzGgVk06U7OYTHGXBEDRmwP/rc4BYgyiA/oYzzgreD60wNMcTsjErClwSXlcV2Hk7VIdJe0qs2YklkjbH6G1ehiiGUXcrZ3jki+9G1umLrhvL80scptotI498JkC+itOFKZ6Xh05O6LzgGXAOtLLYTpllLAWYdMz20j3bxqRKiqAlE9HJIdyzjtYz/bSHJPah2vG0p0r+ZBiTDCayVIkFsRhnG+ZIc7iq4o+7UCk55IPVJPXawpAT7tzfQukkdNKY5wWwhYiTdvLOTUzFdgAL9XDtRPzsrPeRfdtGJJYEYWGrEmeMkJlIVW57Q5GkmX7wTrs2zyxff8NiVaZcwCl5JZWZVNir6v10h+RKImcItODpvOwcP4wbXwd7T0u49VRcm7npwiscvrGx9SvnHuwAAfPm6IeIKNCgF6xRfJYy26NL15lGsVfOmg0cmO37A6MbNVUREN0ayErKqWUb/m0SJ2eHKUNGA31KZXsKR11wHqWlycnz3Q2tsKYUb0/PwOwAsCGe30NQ4/5e59u0egLkGZDU6dsA2f4N7ADtBhYw6FIlPVNotQiAJN5pTS7TMu6cGFOy2vvnzdLVuytp5OH6lADUuLBMjDVOjTORPW93JOpezQXMTlvhqUjhf0sHWYv5qzmy6wgQEmlEhhxxIjMTqRlRReURJ+al/0A3MwKw5E6sVvq
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e54d4c2b-21da-4f13-84a5-08db86b13aa7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 10:33:15.7919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngjNslrwyO0kGdNGCPr+tjCjDrsYLgozWb07Oh1HI+EXEtT9fysCHJJybrzbjLpNy54TuFh9J8qH8xS7Gxi1AEwSiqBSAmEMkVa+XT/MERg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6531

On 17/07/2023 10:17 am, Jan Beulich wrote:
>  /* Intel defined MSRs. */
> -#define MSR_IA32_P5_MC_ADDR		0x00000000
> -#define MSR_IA32_P5_MC_TYPE		0x00000001

These are architectural.  They still exist in all Intel and AMD CPUs.

I'd suggest keeping them, because I think we're required to expose them
when advertising MCA.

Otherwise, LGTM.

~Andrew

