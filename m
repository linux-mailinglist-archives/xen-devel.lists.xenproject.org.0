Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F5D7D8120
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 12:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623695.971783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxuk-0003ZU-GK; Thu, 26 Oct 2023 10:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623695.971783; Thu, 26 Oct 2023 10:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxuk-0003Wq-CJ; Thu, 26 Oct 2023 10:48:34 +0000
Received: by outflank-mailman (input) for mailman id 623695;
 Thu, 26 Oct 2023 10:48:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvxui-0003Wk-Rj
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 10:48:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 321fad77-73ed-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 12:48:29 +0200 (CEST)
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 06:48:23 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5663.namprd03.prod.outlook.com (2603:10b6:a03:27b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Thu, 26 Oct
 2023 10:48:18 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 10:48:18 +0000
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
X-Inumbo-ID: 321fad77-73ed-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698317309;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FBIQTbMJiTVsZb7rJGxE8tP5uLPmoo9dNiWBbpdjLHo=;
  b=XnwCjZBrbr7jcb9TwzQjZCFQ/5sfwjDzCLg6Yqs7F5PUt5Vik5z1MBiD
   m3g5ZtTSaqCfK8rT/EVj9DqnjTEYypF67wEi5m0rwycNGX0PHsCVdRYAO
   +Q8H7jj/H68VLsefCBR8N0ua+BC/lHdXDZmvHREVbyUFMGSsOzc0v7iHd
   4=;
X-CSE-ConnectionGUID: QQKxxjcmTguVi+Kgb7sAgw==
X-CSE-MsgGUID: 1QFpmEDBSbKIhOW0W2kZzQ==
X-IronPort-RemoteIP: 104.47.55.100
X-IronPort-MID: 125948549
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:JtnGEqkxIG5yyKonhhL+Hs/o5gynJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYUDuGaPmNYGT9fYp0b4ix8UMD78SAm4c3Sws9rn9hFiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5gGGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cUhCyAdbBuGu+2r/rP4aeZm2d8KI9a+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieC1WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmmCd5CSeHpnhJsqASq6HQWJTE8blGYgPmetRaBAdFtO
 XVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4A/IPlqYRq1hbXFI87SOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:vom30KgGbVbo9wReozpjkzW0e3BQX7123DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/hSQRI+Lpv+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd8gYCXyhJybIC93
 GAtwDi/K2sv9yy1xeZjgbontlrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHkCEprPqp4FMKls
 CJhxs7Jcx8517YY2nwixrw3AvL1ioo9hbZuBWlqEqmhfa8aCMxCsJHi44cWhzF63A4tNU59K
 5QxWqWu7deEBuFxU3GlpP1fiAvsnDxjWspkOYVgXAaeYwCaIVJpYha2E9OCp8PEA/z9YhiOu
 hzC8P34upQbDqhHjjkl1gq5ObpcmU4Hx+ATERHksuJ0wJOlHQ89EcczNx3pAZ1yLsND71/o8
 jUOKVhk79DCuUMa7hmOesHScyrTkTQXBPlKgupUBXaPZBCH0iIh4/84b0z6u3vUocP1oEOlJ
 PIV04dnXIuenjpFdaF0PRwg17wqV2GLHfQI/xlltpEUuWWfsuvDcTDciFgryKYmYRePiWBMM
 zDfK6/AJfYXB7T8MhyrkrDsqJpWAkjuf0uy6gGsm2107P2w63Rx5vmmaXoVczQOAdhfF/DKV
 0+exW2DPl8zymQKw3FaV7qKj/QRnA=
X-Talos-CUID: =?us-ascii?q?9a23=3AQuoUEWp+styalAeh2WwrRQnmUfkcUW3NznzVH0C?=
 =?us-ascii?q?lN2cqa7KfFkS597wxxg=3D=3D?=
X-Talos-MUID: 9a23:D5DxjglBYS/JoBsVwNfadno7Delw5omCInsHsrQGnPbcCnZzCSWk2WE=
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="125948549"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A93V5OcWpSHcd7xma0/T4uzcYttPppohFfjnn4A08OZKWEbP6cwNhzg34em3FVysxIqXZW7GWuaWH/3LLZX7PObYjF9TsOusOlyx1XLMHkRsQA97vWwxhOBCWlSODqBhugFn2JiMEqA/+oHRz2VVMW4MHTQPDk7hEQFVclDp+otf/0v7IwrvLl4yK5kbhmmXNvjKZzn5mqXwiti1sChX1MXSDAS2+GZ2003jSeHZF3v5bHrenTuCdZw9sdb1lU9/RGwnAfvAnwmK9Ig/rp+f+uoMNLjRJlmln6gPejvdALX+w3nnEllfwTIx3muz3xxKiHdSepE3HEegsSK/r0FyJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJ9MrFxpLi0rarvr8vqPhkrCuy0WR1S2kP4oihlnK08=;
 b=gDbi+pjRisnUrnYhNLCILGwf5LkHNzsDB6aRXMlrV+arNfRuHZ6b2bzAJvY+k06SEDn2nPV6G7C6KGKpxxKajAfLX27BkGWUwuInHO8TpEishzsfTlo0Jj5NJexqdj2aYJ4kFhl+yhBhM/rT4RaA40yvtRcNvgOUsGbYY4bUOshVx9pQa+omLhreX+fSNFk2WVwIZOScNCs8iui/YZdfC2XyLh8XoIUyxL4OO9kmxTJi5diTC+N9bEBNemFBr1vJ8vagNTZh7lE1rEvEXbVGLPaerkjP88TtZfvBmV6vTU6bHcze0YtxjWKFcu3XXxgBuOIoTTJb3W+D9BAqnUQL2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJ9MrFxpLi0rarvr8vqPhkrCuy0WR1S2kP4oihlnK08=;
 b=aVJ2xHeWKv8fIyw+bJmh6rRDUSG5j9nNW0wZ5aZv3OzDkmuhwu8l7AzzY7FRTL9NsRW2ha10lFP6n7MT1HfXWTUcGd2oD0bbhLkU/BBPKGfrwR9SOz1VgcEbcCENMqKJVIZF599NmhDr/tn5olNR2JZpCsKYB7U8RzR3qRrDx28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 12:48:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 6/7] x86: don't allow Dom0 (direct) access to port F0
Message-ID: <ZTpD791YQsOY1d38@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <a8be0096-42af-6d7d-ff7b-b6128d996ccc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8be0096-42af-6d7d-ff7b-b6128d996ccc@suse.com>
X-ClientProxiedBy: LO4P123CA0150.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::11) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 683212db-8892-43ed-1287-08dbd61110aa
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r53SQ6WludCrmmzwdTY9vbbaC3B1XN7AdSC1F77rx0Ifs08kzEm3e4/iz/s4bVXlWwcWwK44ldt6mBzjIbvMNB0VFYbSnGQsNlQIgoy4VqqGcOSNV40nWHJCjGzwVadliuZLgaQ3AQP5DCSnzXDhYGmwnnt8inhaTQi9NV2vwcQd42f7AU3tkHMF24MCfG4t8m4mdrZXpbYtkzDnfpt6SYn/tuWi/aFY7vsTXk+X5E6xBzBnTaKnS/R4xE1dXnLCR5ywgEqQ6H6hsnzcY8i5bJdftG5pqdbT4sb6mVIO7qC1ePdXUtrshJCPcGuPeBOysWdNqSRiIrw6JOmkZUrEA96Kwiz/F1N+63IcDdHeg8po08NZv7LDpRYWIW5we4jc28HE/s5dOB8BYD2iCsIm+QSZwqaDUEwQ4A8GH1onjQwhHWCHGJBTuxW0ytWmn3n6V8oMQUoiW4NQIA88VY1y20qAqK/soLK7LMfXCDHzq6EBZu1NsLHlJu8RgzUu+g6N5fy7F8pv99p80yfqTrCcRPXYqP9U6xCdDu8AeMzIHeVkOAWC136bW8zzj/IKJCjb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(136003)(376002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2906002)(6486002)(4326008)(5660300002)(478600001)(41300700001)(8936002)(8676002)(6916009)(66946007)(66556008)(316002)(54906003)(66476007)(33716001)(83380400001)(86362001)(85182001)(82960400001)(38100700002)(6512007)(26005)(6506007)(6666004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXhpYVBMNTN2WEZrcllhT084S1MxbTFXMnYya3JNLzl1K2ZIS3RxRi8vYTJM?=
 =?utf-8?B?Z2tGZ3ZqNXBjWXRkcWxoL0lxTUxLalIrU1FJb0EvS2cxUDlnZVUzOFhCU2JE?=
 =?utf-8?B?aksyZFJSc1JlczNJRG5wR0RLb2Z3MnNsRzJWTE1rU1VvMVVDTVBvZWd0cFZh?=
 =?utf-8?B?ZVk2V2QyanYzTzhsa1NJTDNzMHdlZzk1SVFvRXZTTkZrY0N2eHJWNTZVTDZl?=
 =?utf-8?B?MGk1M2xhWGZHZ1dpQVBOYXN2MUMrbVhoRHZmZGlNMHVsbkNMQ3VHc1ZqN213?=
 =?utf-8?B?b0hDYWNTUG1tOXJwcGhOUWlWQVVHbnpTMFhSNzZYTXFaOGRVZUdHM01rbzM0?=
 =?utf-8?B?N0pOc0xFeXNrN0hQYWFrYlRHWFlGaTZjRFV2bTRONHpraWxMeHE2SUlqclo2?=
 =?utf-8?B?aTNqMGp2L0g2blFhY2RNRXN6V3ppb0s3S0hhemZxRGhIaDZXS3BhSDdRRjg3?=
 =?utf-8?B?bHpNUlRvQVd4YWRsc0ozVVNzaXFQYUYxb2tOaHh3YU85ZzU4SGtmK3Qwb1BI?=
 =?utf-8?B?TkY1ZUJyY1V4MWpTelR5NUhINThIdWZNVjZGalNuR3VQMkRwRjA2dkFpeFdJ?=
 =?utf-8?B?eHBxVkM4NWNScUVjZzA5bWtkZk5rSVNZWU5meHVzZFRqY2xDQ1BHNFFjaE9O?=
 =?utf-8?B?V2wrcFF6L0diWTFoS3F4N1FLN0tkMExDeHNZLzlGQTI2bFd0czhzMmdweUFM?=
 =?utf-8?B?SEFaRTVrQlQ4ck9ZVHN4WkZSNnAreHhPeStURXZtdDBXMDYwcEZzN3U4TEJt?=
 =?utf-8?B?R2tSUkI1SWswTFVsdVEwTTg3aTRzZVRUK2R3RU51QVZDUTZ0UURXT05iL2FN?=
 =?utf-8?B?N0tHNHdRb0VVL2VWdEtFd0pJdW9YTUdjT2M5d3J1QVRxQldCa0VEZ0JXaVd4?=
 =?utf-8?B?U0pHTzZvMWc3bTJTSXBxUmRmTVppN25IRkRvK0t1TExIM08rMTd5aC8wZ0JF?=
 =?utf-8?B?UG5rTmxkL3YwWW1GN2U1Y0txQkJZREhIcGpNNlliaW5BTTFZNDB1aDJFb3ow?=
 =?utf-8?B?SnVUUDN0WlBWV09VdkpSNUl6UWh1YzdzVDNXa3g4WGpZY1A3NzFLYm8rVUMv?=
 =?utf-8?B?aW1sZFlaeWwxVEVDam5oTHFUUVVXa3ByZitBendvbTJsUGRqSHZlOVBBVThE?=
 =?utf-8?B?SXRzYWhyYW9nWTZBYmNMbFppTFUyOEdEUldLREovaWZnS1BUdXI5NkMvYVpF?=
 =?utf-8?B?dUdBMkd5RFRMUHhVSU9VRlJ2aUdOQlIyNVpkaHI5MU1FVjdQWW1tc1U1VnU3?=
 =?utf-8?B?MHV0RFpWbXBMRXFSUzc4ZUtoa0hJcW5Qa2VDTEt4Ukd6WGJXZFhWRFIrZS9s?=
 =?utf-8?B?SGIvQmlXbUZlNnlkbk1qcXNkT3RPTGt4cnpob3FXNGZJZ1Y2d055QWRycVVY?=
 =?utf-8?B?UGtMRmx3VWUwMkNZZ2tzMkhDZ2JIa1FMUFhZN2Q1WXA0U3lpdGtMYVhRVEgz?=
 =?utf-8?B?bDZha3RJOHl3QmRmT3JpMUNOTS9QNGlXbTQ1clRuRGI1c2ZyaC9BSkZIeDJx?=
 =?utf-8?B?SjZodkcvSW54eE82alhLTnVjSHk4Z0lwaUJMK2syRDBiOEFPUVd6M0RabzBp?=
 =?utf-8?B?emc3UGZKeUxxcVdZN0xXblY4aVQ5aWZiZDVXbDdvUnZLbnhEK2NIMzE5UHZj?=
 =?utf-8?B?eERmcVY0cWlSUWlXUTNqR3BjZTVOa1BBNXRNWmZQWHZJTWYyQ2pZemZvTTFs?=
 =?utf-8?B?SFFSWjFJNXkzVEtlaGdTdVEvam9PY3I5ZjYvcmFkOUNZdE96RS9pRlZIUC84?=
 =?utf-8?B?SXFRclgwQjRpT0pQV2FYUkpadm1DWXRnaEErMkdmK2J6TE10RUlwZ3JtenpQ?=
 =?utf-8?B?S08vMTFPYUJHaHhDR0NMSkZDbHZWZWxJU1NzbnJlOTJaL0JNNFROcml4TFc1?=
 =?utf-8?B?aldIeWJpR1FtT2tmUEtLWjRhM25oZ1RBbk55cnF4a2pkV2xPKzQxaDBZZlZN?=
 =?utf-8?B?R0JwOFBFL0lKYVRVSzdpcFZiVXhxSHpoREFSUnRtWkJCNTFveENCKzhXdDdl?=
 =?utf-8?B?Ui9HZ2JlU3A4Qm1OR28yS0J1R0F2WVIrMU9DTzVYNyttNXdBU2thcUI1OVNS?=
 =?utf-8?B?ZVlQYnovcXJIV2IwTWFaeFBXTE9hdnh1R05LK2R6U0Z3bTgza2RMT2RLeGxH?=
 =?utf-8?B?N3k2cXJKZkExYzVyeHFOTXZka2xkb05xYlUya1d3MCsra3ZTMVdFQ2JuSnJk?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rE8FBjQxk2qGCUHJKEa6ueLYI3wrbQ157LVgKTUIS9W+1bAuSz8fadriRI4W3XsMKALgUuiaYMsf8sLBy3XHaneP0UGZsrjoWg7I2t/Nu/xMdvFa8vo7qIbsoRIBeS2hN4CJAe4tVuzVI0Xs95D/x66hE1s0SKDY2WDlwhzbVD4DHttNnIZf0AcqEPbbl2HR+uPcSsyxcjZGL3+f9NccX9k0xsx3LBdjKVDzp/quaVfsT43aUBz9iI42qv/w0JnX2mSR2sQrsQaC3kfuWxtL9LFPj1GHCenucVSj7DgeYVu7okzwk6htsmepOUZDDOf8Kgc1l1o5+KprnonTUkGeNlChlLdR0AdBInTdg/0u35YWzyGOUAYZb1M/UJota7r6yycjgDW1Wmr9b/c2IYQ4bExnxqKjEJQDXK9gpTInM1k+0L4uOMjk4ztHVR8nOkzHr+hMuOWr4+HYOb3PKH68qX3yIQctEEFsyqZniMMnBnBDDVZyYrpCcDQwArEKGHReigGVOghQu+PQ6Clb6BriobnYTHhp7Lsn9ZLQvw1tTs31hdXpLf+KaCHfCegrDatZxRcch173bxpChwKE7IwM+FSKHejw2Ex5+qyXgYrx8KMNMMrKi06Ik05/AQKtLgObsIO4EjJCPTWFKIZJ3D6yquCwNBrBuSzIY9E+8jOK7EhLTmrPRKMADK3ywOMP/WyXVrDSup+7q6o7MyLDHIht8y4Tf5Sq2hFyLeaJx1DaBvQQG8gBa6uJ7B+ua0JdKSJgpampBZq5BFcbWOTEuiKPQtcD6kKl1bp5cRio2D8UZMBsrOd9c6F3yuTTQt7EAc9T8h6n3ZHYaofy17fInzYlog==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683212db-8892-43ed-1287-08dbd61110aa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 10:48:18.7274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcpFnR/DIgdmN/OWzo1VGsc3RqFN7f3N5J47O//rDvHE8lrDmV9FWoqxbNKQBjMeZ48bMcPMX5t/+oOrYXGYsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5663

On Thu, May 11, 2023 at 02:07:40PM +0200, Jan Beulich wrote:
> This controls the driving of IGNNE# (if such emulation is enabled in
> hardware), and hence would need proper handling in the hypervisor to be
> safe to use by Dom0 (and fully emulating for PVH/HVM DomU-s).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> RFC: Really this disabling of access would want to be conditional upon
>      the functionality actually being enabled. For AMD this looks to be
>      uniformly HWCR[8], but for Intel this is chipset-specific.

I'm afraid I'm not able to find much information about this, I've
found something in the Intel PCH datasheets, but I don't have a clear
picture of whether this port could be used by other functionality.

From my reading of the spec, the initial value in 0xF0 (COPROC_ERR)
will inhibit the generation of an IRQ13, and hence if the behavior
that most modern OSes rely on?

Mostly wanted to check which kind of logic and OS would use to figure
out whether 0xF0 exists and control IGNNE#

Thanks, Roger.

