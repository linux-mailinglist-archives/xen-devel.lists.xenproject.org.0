Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F2712AFB
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 18:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540172.841742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2abI-0000ks-7c; Fri, 26 May 2023 16:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540172.841742; Fri, 26 May 2023 16:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2abI-0000i7-4F; Fri, 26 May 2023 16:47:36 +0000
Received: by outflank-mailman (input) for mailman id 540172;
 Fri, 26 May 2023 16:47:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDTS=BP=citrix.com=prvs=5031e17c9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2abF-0000i0-Q7
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 16:47:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 007e675c-fbe5-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 18:47:31 +0200 (CEST)
Received: from mail-bn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 May 2023 12:47:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7380.namprd03.prod.outlook.com (2603:10b6:a03:567::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Fri, 26 May
 2023 16:47:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 16:47:00 +0000
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
X-Inumbo-ID: 007e675c-fbe5-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685119651;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DLZyZJs4KbdlkzBKyvf6GyZdY1cwG41VPNi2ch6Zgms=;
  b=Mp37JY4uaqjvWnvfC3gLpPvwxz22WvltQuXvTOMoTR9UXMvFgChwPXdo
   3rzVaiw4rrn+LZ/ohEGQizsTyuBGxCsNpsC9QxlN8W25XI53AIYq5Ke58
   SJpHwdqe9q/Rh4c9f0ZOKX06XkkMBTVTw6Ba459D4HBJC00GGSqbOd+Di
   I=;
X-IronPort-RemoteIP: 104.47.51.47
X-IronPort-MID: 110585841
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FksOvq50F2FRZKGUuyxtTAxRtOjGchMFZxGqfqrLsTDasY5as4F+v
 jcbC2nSPPfYZzGmc9glO4u29E4A6pbUnIRhSFQ6+XwzHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa0R4geE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 LsZB28gZQK6hcmwmL+6ZuRtvOYoBZy+VG8fkikIITDxK98DGcqGaYOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OlUotj9ABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtKSe3lpqIz6LGV7lQxNhgZahywm/yopU6yWOl6J
 VVK3RN7+MDe82TuFLERRSaQqXqJvBcaV8BXVfMz7AWAyK386AKeG2RCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BXAGTT8JS00C+daLiIM8lBXUVf54DbW4yNbyHFnYw
 TqHsSw/jLU7ltMQ2uOw+lWvvt63jp3ATwpw7AOOWGugtll9fNT9O9Pu7kXH5/FdKorfVkOGo
 HUPh8mZ6qYJEI2JkyuOBu4KGdlF+sq4DdEVunY3d7FJythn0y/LkVx4iN2mGHpUDw==
IronPort-HdrOrdr: A9a23:Kp85tqkVWd4qKMtmKxCWwem6Qo3pDfMxiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msjKKdkrNhWotKOzOWxVdATbsSl7cKpgeNJ8SQzJ8/6U
 4NSdkaNDS0NykAsS+Y2njHLz9D+rm6GcmT7I+xrkuFDzsaE52Ihz0JdTpzeXcGIDWua6BJcq
 Z0qvA3xQZJLh8sH7iG7zQ+LqD+T5qhruOVXTc2QzocrCWehzKh77D3VzCewxclSjtKhZsy7G
 TflAT9x6O799W20AXV2WP/54lf3IKJ8KoOOOW8zuwubhn8gAehY4psH5WEoTAOuemqrHo6jd
 XWpB8kHsJrr1fcZHu8rxfB0xTplBwu93jh41mFhmaLm721eBsKT+56wa5JeBrQ7EQt+Pl6za
 Jwxmqc875aFwnJkijR78XBE0gCrDv/nVMS1cooy1BPW4oXb7Fc6aQZ4UNuCZ8FWAb38pouHu
 VCBNzVoNxWbVSZRXbEuXQH+q3mYl0DWjO9BmQSsM2c1DZb2Fh/0ksj3cQa2kwN8ZosIqM0kN
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOMl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wt9ihn3ek6hlTAfsuvDcXaI2pe1/dI4s9vTPEzYs
 zDe66/WJTYXCzT8YUg5XyLZ3AdEwhZbCQvgKdJZ7u/mLO7FmTUjJ2qTB/yHsuaLd92YBK3Pl
 IzGB7OGe5n0meHHlfFvTm5YQKZRqW4x+M+LJTn
X-Talos-CUID: 9a23:6VQ3tGyJ6gTekB1mMzilBgURXcEKLVDW3k7SCEngBGdFRbyva1S5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AJ7C8IgwzVxfMb2axEBaYBjtj83KaqJyMNkUCrtI?=
 =?us-ascii?q?NgcyVGix8OAy4gi3pZbZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,194,1681185600"; 
   d="scan'208";a="110585841"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1JIEWfiGq5PJT5guKHvoA8bvNrPAWmVgkbKuu2k21ooBJyJSFlHQyq4RL+mMKUy+Qq4ydG8mKiFTwMgxNgjSqDbeZQnEbQb7wji5uh3qb+tbhoM9VHb4ZA6SnC1v0MsKnnHF2ZkyVW/yQ9JMvDWF+T/yA2L7EOfhW7649XX9qHOKg5zwdQClvwyqFojje2HfunOg9w5JTL0B4ClpyhSjnXPRxnK2ARXqGo/bwbrg+OAEtsMsntHToyff1mdib5yBhleRvjTHrIkv7VxNoOaoERf8mynrAcEP89qPxKGaNay09YkfXLlkMuJmpc92Td+tZQSabXYUhfNrtW3Fo57zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEMqJE2mFYOW2UV5EWUK73CYF5A4qYWDRnHheCtco0c=;
 b=gdaJJJbC8OKFYN8M+S5G/J4d9bgrnYzATHrJjfpsgsEPQjiI1rP1dyx+LvO+FMj61Xc7XvPAiVtCvK4AsHlrzseU+DfUj2uZpZ2eCHI9EfpOFfHmpf8qcaBrpY4Z8fqs3kchjWFikjhyv3ZiQoHhj0o/0yDQ6WM+MSw5ZBhLgOXps8XD/v+Y8T5IzXlkTw0KC31cQPYLJlaLi/DMp/qpyX+2p6QmouQiW0wtvuU0/IGFNpWM8c1CiboKP+d8wlwHf7LvrPJo8EdWuTq84+qPajjzYDP69+Bk0VOZ8UEs3QoL4smQMkWj7rq/FhRm7bXHMErteVSiRTEgQDTTgbkp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEMqJE2mFYOW2UV5EWUK73CYF5A4qYWDRnHheCtco0c=;
 b=Wwi0lokETkm2Wb2KFuWAHK+17TXrPKbub1jVOfHb29qfw+BKSBtrWlDdxOYLBeIjg+wZ8H+jP9YejTxsePN3brBwLALUlzSEs1HKno5tzEaRZetKtAId1ZfXSd+OHEmjkRbZUT9WR8qSb5eK/tZ33jB2h9BgVsGO+Dsg30aI1zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d2d13e52-6dd7-6783-f9ba-337afa464f40@citrix.com>
Date: Fri, 26 May 2023 17:46:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86: Add bit definitions for Automatic IBRS
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
 <20230526150044.31553-2-alejandro.vallejo@cloud.com>
In-Reply-To: <20230526150044.31553-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0047.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 67417f1f-5706-4ebe-9520-08db5e08d1f3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4tEDxaf9Q+3y5S/6PMW0gy3yxzicBOnWE6kh8ZV0BVKxGqui+q3KvqLkFh1uiJlpD9TghZs5cCPwSlHzkKcE3II1XnrF/QZXaK+93IZnObdxhbEicd/cnzrklm4Po3eTgjbX6dvBMEvvJO9CF81VImxUVy50Fd+b5b7tB23fSke3fuK/OLMsycyPVVebciXa3afqaRWg15ak9HNlUIz2mVTWlPXxJL92wlx5Dc42BX7Z7BlWScwwoRwCDZFFaILXrp9gNLbS7f5JxCIUXcE3Dct8nUzRkPRAQXnBrsdXK0jipaeGV5hjHILJYMZ2Llk2vIkv6Qdn8OK/AANxcGHcPIE2CUB5xUQKNzZcnpjpntq+BArtRPUyUNj/fFBdA8o6kW+eTUkmgZxsKLpuqW677tGrIKegKLghyixwcKEdVRp1CRLYmy3yzNtbu0v65S71DIYPznQCy5oVaLGG4hJ+OLNN4rxnyeNflvxdiLRlh1VqfYl3y/X1yo04kfgV6/5o67TLuZrqVK9UOIyJcYqbq3EbQT2QLPJRA1jkXCuRaSNgvDXCB8FsIk7N822LMBjWwmVe4meKbNgsk7Z5Jtt83rwgsfmc9DJVJ5aoIAfSP2RVD7n2AWKycgqxc5jP2F3kHdphzpIPYvo3pVDdFn85Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199021)(31686004)(66556008)(66946007)(66476007)(478600001)(316002)(110136005)(4326008)(54906003)(86362001)(36756003)(31696002)(83380400001)(26005)(2616005)(6512007)(107886003)(186003)(53546011)(6506007)(41300700001)(8936002)(8676002)(2906002)(6666004)(6486002)(82960400001)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SG1jd3VudEtPVWMwYVhReFhGWkMxbkdSZlVLd0hjMFVsRkpSNkZwakRBSFRI?=
 =?utf-8?B?ZktqU1V4WVRGdWVUVDlkbzBBOEJCWWVHa0RaMWJUaHQvWmdtbTc0eXpuMUJW?=
 =?utf-8?B?NER5YzRWWGVUS2Z6eVd5UDJpTHRxUHZwbVMxN1I0UWtndTJlSXJVbGxBdFBy?=
 =?utf-8?B?OTZ2ZWxtSWhlV09BNFB0aC9nenROYU1hbDkxV05qdmVSWjJZTm1WZlBYdjlS?=
 =?utf-8?B?d3ptbTNTZDN6Wk5YRjF1WWdFd0RoTkluOFFGa0IwelFlMW1TbGE3clMyRFpa?=
 =?utf-8?B?SEhIR3lrMktqcXpqR2VUaEpqcTFTa1dXY2VCQnlNZUJWTHlPblJDOTNLVDdK?=
 =?utf-8?B?RGRaZkpHRm1aSVIveEQyOXJYU3FmNVllQTJCNEhHMXRZTHR5VzV5MWNOQ0JD?=
 =?utf-8?B?Zk1CelAzc1JmOUJJemwyNDQ3WmdPYmIxVS92VWtTVERNNzNpSlU1VHduSDla?=
 =?utf-8?B?R2c2akk0Q1BpN0ZLQWdZdjlIcjZwemliV3p3ME5OTkxiVURqb3lDS1BSMmhr?=
 =?utf-8?B?M3VJNDkzVmdXa0diNEhoWktCSHVjTXVLMjRNQ2Q0cC90Q2U3emV3MUZmZXdk?=
 =?utf-8?B?eXlpbWJaU3VYckFJQ01vaVdpdDVLM1J3c2Z0ZXJTdHNQSWR3WGExbW14WVlC?=
 =?utf-8?B?V2k1T0c4a0RSQ2UvcVVPYTBMREhHbytxYW1wSm9Yc3o4R0l0dE85TlpOT0g0?=
 =?utf-8?B?bTJib0hFZnNjdUNiS3hNSHhFRFI3N1ZZRHRwWkRuTU1pRkluRHY4RXNRekFY?=
 =?utf-8?B?NjB1OTNzVFdpenpwYlRsTHNSL2hKeVpBem5EcU9LaHBxTDJzVGVMV041OXVQ?=
 =?utf-8?B?bk8wSjN0R29WYlU4MmhqMDROL2JGYmN0c3lQWjY0QWF5SWFrbWJBbjVQTTdw?=
 =?utf-8?B?Slo0OGRWT01zTlpaMGxITmg0R2N0YjFFN1FmVkpHRXFKWS9BYVliSGtJdzlm?=
 =?utf-8?B?RWIrRFY3RlYrK0pGLzZiRGNwMzhqNndtZnlqRmxtT0Z1dXhXemhWMkEycW40?=
 =?utf-8?B?TmlwTi9FN3FlYVU5SDNYRVpZbk5RTjF3U2lWeFdUa1pLc3Ezck5qVnd2bnd5?=
 =?utf-8?B?T1d1ZGcwQnhkOVRDT0k2Z1QzODZ6MWFCTWhVQzJyOW50M1ZjL0I4ZTQ2bEh5?=
 =?utf-8?B?M05Ick4rRnBUNFh2UStPckplc2k4bDF1NFc5dWNQVFF4OEJOaGRwTm9GNTBJ?=
 =?utf-8?B?MHVTakZZSGx5VkkrWUR6dXdGVmpBZ0NjaHZ3SkIwNmwxSHZPVklNdS9NMitO?=
 =?utf-8?B?RjczU21WbGhSQ0VhT3lWYjM3b3NzMmY1Mmk5Rmc5d1ZBY2hsSmw3R0F3dFlK?=
 =?utf-8?B?UFdKRzdScjArK1ZTWjVuVFhkVGFHMy9BYWtwN2NlbXRIejdNbXJOZ2JCd0Jm?=
 =?utf-8?B?anVtYk1vbnVUN2laNmJhekYyaEVIWXo5dXM0Rkx0Vko0cFB6ZjVEcTNmQzBN?=
 =?utf-8?B?OGJGRnRnYXJpZWlsZVpaRjYrcXhSUTg4d2h1MU1SNTdBMiszWVQ1djVzYnk2?=
 =?utf-8?B?bEJJVjJUbFRLM1VyWTdsN0FTVU9iM3BFYWs4RUZnZzNqR3BhcEFHZEV6bThp?=
 =?utf-8?B?VWtsZEpsdXdDemRsQ2U0TEd1SkRaYnZRNXFZS0trak92OGx3VnVXQ3o4SS9O?=
 =?utf-8?B?YjJiS0VDbDB0eUhQcXVudWl5YVJiN3hYZ29uaHRxdWRCMlVKWFJ1UEhIcGVT?=
 =?utf-8?B?TFF2TkZOZGlvem1kRFFiWmxydndxci9oRS8vZ0RNMFdla0VzRnN0d1ZwbWZz?=
 =?utf-8?B?SDZQZXB1SGtFc0lBbjRCMWhqZ2M5Z3gxdnQ3L3ZMamtQZW1MRysrTGM3SlU4?=
 =?utf-8?B?Q0FzSlVKVUhiSFljalR0T01lVnFHSzZHTTQ3OGtlcmxRS0FKVXJVazd3Szlm?=
 =?utf-8?B?RW1ZMjFKanBQdnd5M3h4QUhVam00cTNlbkRWbFB3aXhSTjk5TDI4UzlHQ3ZT?=
 =?utf-8?B?OEtJRklrWHB6UDloOUJZRWUvNUo1eHo1V1V4NmpGSUx6Zk1CVnlxNVNFNkFw?=
 =?utf-8?B?RXlES3JmU2JjdVc3Rno0U2RnZjRUck1pNU4rT0loVUR3b05UaDlEM3NjUnBi?=
 =?utf-8?B?Qk9yeDFOSStpZEpIWkRjdWZ1VHNLbFRYRStvMEtPRjZveno4bzB3TGZ0Y0RB?=
 =?utf-8?B?Wk1yemo1Q0RNWmRVdVNhWWI0SVczam05eWwxWkN0a2N6VTNKM3gxaVc4V3RN?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AQfY/6FWtCbGZZVejQVcKWHfskvyMP0+4AT4mAulKA5Xdnqitz7sMdbDtkayHwQD11+uDUR3RvTz212byhnekClS+WWoiTuOJbIO6WYmy06S6ec1hoDV3nwdsMau+KcHqGFas0GrNVPRQnYwnfo7BChHM4we12eCJo3Io3YhdyEUVP+scuiOXAaf8twbivEr6wfwTewH4JqEOBzOE5wJSnnN9AppmyAPV1RFd+Dbajd4IXhEN2xD2mRnv49ysrwxvpuaZZusnnP7UfVcCLFXui29Qgi04VbLgIGpxLWLnSJLALI4yCM4ipiyUa+mZhUkgmhWcPEjZb4ApjnzYYDQ1NOBQhwLgrabEwL2HmuOPPN8bw22a30KvDqdzYTUcwA4m4T2LkQP071jgBiTMMIQCP0YmTp479N0ZvrcFgDrU38asw7yU0q+azsOS0xxRMV3/OBi96yeD1lKGyX8RKFWe76hkD5IzbkplZLRrd9kzY9aH2UrnJ0TrjGfri+3jm/s6pNATn+sq/gCrpi0a8iBGYACrQ+4t0L3RGOjGa8ghX+fodr9YvC18y20/YWjcbbIhs+HVe0XwoHQI+F3q+I87sHien2isypyimn4kcCya9is3sd95gSV7gukemV4oXDqcblTBCOU4t4zTVPKhotMntuTI8Imyu2X0sPY/SnTNo1w4KEG8UI6u/qwldOdeNFn0MM0DKQWoRxBFEofgfhJvmVo4pM/5dKZ+Dw54u4/XHC+Fk/5TAjv77poj1eL8AgvOB6DxFZoYucGFrLsAhorn+B+HN4eB56sGB+xg8UopyrQIW5Mb6chi62G2OpepGJVWJ3ETWlzyAiSCulM8Avq+r/55OsZCQqBEZqIT1ukPqQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67417f1f-5706-4ebe-9520-08db5e08d1f3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 16:47:00.3552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XynSf0Doy34s9tOMKsBoefH0MZg/Dmu0zWGNjNA5AEIneTrD7+r6Q5xMj8KrHF8++yip4lMGr2wUQCb6AXSHLKiWVsx7ofo7E+4vKDC+OUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7380

On 26/05/2023 4:00 pm, Alejandro Vallejo wrote:
> This is AMD's version of Intel's Enhanced IBRS. Exposed in CPUID
> and toggled in EFER.

AIBRS and EIBRS are very much not the same, and I argued hard to not
have Linux confuse the too, but alas.

Don't mention EIBRS at all.

Simply "Auto IBRS is a new feature in AMD Zen4 CPUs and late, intended
to reduce the overhead involved with operating IBRS", or something along
these lines.

> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 5d0c64a45f..e487885a5c 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -200,6 +200,8 @@ static const char *const str_e21a[32] =
>      [ 2] = "lfence+",
>      [ 6] = "nscb",
>  
> +    [ 8] = "auto-ibrs",
> +

This wants to be:

     [ 6] = "nscb",
+    [ 8] = "auto-ibrs",

as they are adjacent with names in two columns.  Gaps are only for
discontinuities in numbering.

> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> index 777041425e..e3952f62bc 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -287,6 +287,7 @@ XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
>  /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
>  XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
>  XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and limit too) */
> +XEN_CPUFEATURE(AUTOMATIC_IBRS,     11*32+ 8) /*   HW can handle IBRS on its own */

Were possible, we want to use the same names.  AUTO_IBRS is fine here,
and shorter to use throughout Xen.

Furthermore, it must match the cpu_has_* name, and that's already in the
better form.

~Andrew

