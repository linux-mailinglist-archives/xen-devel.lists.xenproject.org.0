Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C6571C7A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 16:27:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365756.596080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBGrG-0000Ko-K6; Tue, 12 Jul 2022 14:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365756.596080; Tue, 12 Jul 2022 14:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBGrG-0000I8-HL; Tue, 12 Jul 2022 14:27:26 +0000
Received: by outflank-mailman (input) for mailman id 365756;
 Tue, 12 Jul 2022 14:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBGrF-0000Hr-38
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 14:27:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60065.outbound.protection.outlook.com [40.107.6.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd8e136e-01ee-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 16:27:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 14:27:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 14:27:22 +0000
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
X-Inumbo-ID: bd8e136e-01ee-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gs/bs227FQ14hfUtXrV8N8iNuGg75fTFRJsPiuGt9Atjz4P7aYGiFEuLMlu4c3RlIVYJa5MWFsjf3llL1m5V1YM4wrSfoyQWMgarj0itI7iqMXxS+G3ahLeCg9/BtXT4oq1UqAfPpxXyLxqfGvOQUUDdj8hU9+Ifv5OJ31+HzuOMtp6+DtI36hZ9WHQKS8GCqH3XajK5LYlqL6+a0lp8d5y1r3b69PP0PxARGVvNIwEOtDCkTMwntFYwtJ2ME7eJ+iVYx9SHOj+FaCq0Yrk1O7fGp8vKxsUe415ievgG5/jmqNzD3sOm1FHGzeCt2ZUFVl0ez+eIq+G06+e+0NwDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkNar+i0BpWC0Ww2/+zw8Zqy/THrhxdiPYwaY3yLI8w=;
 b=HlePwfV4bjKpy/iLbsk4WFjj0FT+5U3oeO6uXjj9UylGz9qcLQ+TGajpp0lZlALxq/o70uU+99AUaspQMXRFxez61CJHkYAo6gttujSc9BOEMQPDKjdh0YDUVHAWOTLw2G0f69xazAPMtIecaJbFYk5xSv+VKqZAYsSfTBXww+Nb38uRpgg8JuMG+ZI7PaDzop9RD64n5ROaNERgn10m4dCYBhDZQj3Xl3YWpaZ8fi29tJb78Q6ieIPWBiyEZB6akmXm+9r/5RE1uk9kBADAf4nVO7Sspa7Jy/JMvscFK5c3w/TZSvDDv3NDGWr/6g3dr2U8ahisETHpjCz7XyhuKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkNar+i0BpWC0Ww2/+zw8Zqy/THrhxdiPYwaY3yLI8w=;
 b=UneweFkQH5VImgVSsI1z3J+2TAIRtB3EszjWdfXj1cyCBBTm7883TyrKOhfDFpQh/4SKrmJQTgjTi4OZtmf/cx1m2QWoporhvVoYYR+baxUCHn3Cc73MIyBYeF8oISBvH7KOKcL99ORHmiA5htGSo4Um7TWI0lrTjGL8VKY+lm5Uk5KKfWnmrtHVV1AKriZ1KFk+VuLe8kSaC85odhoJNHI6+FTITJAJ3BAJNFTiXwc6GcxhDhTJ4qevKdJVQUNQOJBsIPVMnMyAw8icVIKTafv/BFSHeUhsxYeuOQaQGvuog56GPjxcA5xmQYrydlpO6vB/BHEUsLXVc/T8QgsM7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1796ff82-6c48-8eb5-9c68-1e84de51bb2a@suse.com>
Date: Tue, 12 Jul 2022 16:27:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 8/9] xen: rename acpi_scan_nodes to numa_scan_nodes
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220708145424.1848572-1-wei.chen@arm.com>
 <20220708145424.1848572-9-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220708145424.1848572-9-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e231da1-b2ba-4107-710f-08da6412a292
X-MS-TrafficTypeDiagnostic: AS8PR04MB8884:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cUp/lxhlH9qB9LnXtbQmwCb8mmjw/SErUkqyFrQnrGafJ9LjNV7Aju0nBCWsPZ7q7qTkdMuS9kjXwBK+rJtmI5XMrQkihngD5p3h6QHKHrUvaeW0GKH5EIn0zd/8Fe2d6dYqwHkVNn7W+empzNqYy3f/5gVBnf2jtKHQPFAGCVhbZc5ue8iguTHncAZ+w1fEjOWtcDFyLpod3gwSQ2mcq1yjYomtdIE5913HtE4Z5MknfE2WobQ7C3elG5Qesd+ldFS+rOtSJxjmDFrB6VqtBIVeewAi47f9dsCYGiF76Fmfz3fRW+TVMnOS6CXtcEb23jNfPHsAvausHn09b8nsDdqUHyGRI8wv/q+5Zu+AREZFXiefQWAMbyikvBcSiG40qifFg3fy8bJXgfO2iXk2d/3O09aiEsUilxpWBF//7tg5GgTmVzz12XLknLsjeGZOdLufQZhRax2tWzPyQnSeAZjFgr09SVQJ12sXmN4727rhZm6NgwFO18lBwu29dVhPM68SIfEe5zAzt1kmpQlqNOA4B7pu5KWiplcQkI+H733wKYbmEeL9PCRGLINAR6RE0CsCJGxOBaOWYh1jWEEy1J8uBEVoZBIa3EuDzF7+A90Kb1oRYn4h/L77Z/QZNTt3C3Wdot+yg27lw601ZK0uGvzaR/r51tp0GiIBkCklmB+2VMLn8pXGyTI5iYBRTiIHSY6LR0nzioZOcPkYIl2rFKOxz+U5ozsxjO3jOUTmmE/eK1IKjQqIrzCJ74hRnAS7j6pewkV4Q4GyKFW1qvC1EMwffSYfinQEXBuNyDT9/f/4HPOLXdYd6NacJArd9EG/nCCv/SrTFQks1JK/kPVMPfQAv8TRjD5j4s20p3yaxSM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(346002)(396003)(39860400002)(478600001)(83380400001)(54906003)(31696002)(86362001)(316002)(41300700001)(2616005)(6486002)(53546011)(6506007)(66556008)(6512007)(4326008)(26005)(6916009)(66946007)(4744005)(66476007)(31686004)(8936002)(5660300002)(8676002)(2906002)(38100700002)(36756003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFh2cUVYdHBzUkkwTUw2V3hZS2NOTXNSYWgzWThkbTYwaUlic3BITVJGb2pq?=
 =?utf-8?B?MmdNM3BJSVVoMFJ4KzkrRzNwWS9vVFZNS21peitBeGJsYkMrT3laWFFuYTBR?=
 =?utf-8?B?UUdvakg4UCtHeVU5enVZRWZwNGY1U0JVV2lwaytRMWluWFlPSzdnSTdqTE4z?=
 =?utf-8?B?ajdORklBMEtFVjNqRVREd2dGTFcxdVJZQnJGei81a0VxWno0eVRUMVZ5Z2RD?=
 =?utf-8?B?OVBWTmVNbm9ZTDRJcWFVRi9yTVk3cWJlY3JueE5CSTN5V3ZHcFNYZ0MyODhi?=
 =?utf-8?B?TWhSTTI2NC8rQ1BkVS9JaHVNekVGNVp5N2pyNEFFU2JZVThmQzRnSDNXVWh4?=
 =?utf-8?B?Vi9pSnNhcDZWb3k1bktibTQwU2l2djV1OWhRRlJydjF4TEVCcVZ4WEtBdjlz?=
 =?utf-8?B?Z0lVTWM0d2RjYzMvSmcvN1hYbEV3dDZTOGVZb2tpU1RQMVFOOHBjOTdHeUox?=
 =?utf-8?B?ZTNSRThjbTRldXYvc1liZFhqdlRxYzNHbkVQVEdoMU93OFpMa09ZVVM3Q3RW?=
 =?utf-8?B?dWt6QjQ2V28wZFRtYkszdUpHK0k1QjBOYm8rWTBVQjEzRThmTDl2ankwcUxj?=
 =?utf-8?B?bXVjdEo4R2poV1dJMXBmNnRuUUlSbzBZbWV5NlcvQ0ZUeGhsQmZtRStXTUJ6?=
 =?utf-8?B?M2YrYW9VeHIzODRqQjV1VWF1bEY1N3hEa1RsZnZCVWVDUjJWSUNWZHRkWTNP?=
 =?utf-8?B?M0pnOVJZaUNqUzFaeXhEdUw2a2o1S1BzZGdtOW5GdU43QnltMVVIQy81K0M0?=
 =?utf-8?B?SUZuRDcvZ1dtam5RQTljYXFzTFA3Y0NNOHBCdFZOekNEaGo5OS9IYXpxVnVL?=
 =?utf-8?B?cjFpRnhxVWgvaGZpZ2pHaDk5cG1haDVHNDY2c3diZmVkUzR3a0JsdGNzYXFw?=
 =?utf-8?B?SXdWbmtUdUxzenFHOEMzc2llNjVUS1RpaWJ4ajJPS0l2YTB4ck43UUZ4R3FW?=
 =?utf-8?B?c2JlM251eFlBM3R6WHFGaXl4OVJFLytyeGNhYkRjK3h3L1A0azlKeGNpOHhR?=
 =?utf-8?B?UUdRdFFuVDZCQmhsNFp6YWNISWFvbUlmVS84UDZoVWlxcENNQUlUYk5TY1BO?=
 =?utf-8?B?cE85d3BlejEzTlpndWR4UGd5ZWg4MDFOU1IvTmdWY05aTVcwc3ZtaTVidjMx?=
 =?utf-8?B?L3RZbktxTk1hUkExeDBmMHJHLzUyYWVBUk0rYTArZXBJMGxlWU1YRHJUbGFi?=
 =?utf-8?B?WGE3NDV5TDUxajBram81eDlLN3U3eW84ZEdEOW15YzNyY1d6YkhJT2VzL1g1?=
 =?utf-8?B?NVpDdG5pQjByelZNMTIwNWZhcFZWM2dKVVlIYjQyT0JEWHV0VXFQSzZGZ3J2?=
 =?utf-8?B?ZlFqV0dWdU03bit5N1N4LzNZMTlKd0dQV1RUN2hMQWJQSy9OcmtUTG50SkRG?=
 =?utf-8?B?M2FqalFKM0s5RThsM1grVjkyUFVpb2pjRU5TaDMrWlFOb2lPZlYyRE81MGxh?=
 =?utf-8?B?dVNvRWhUT25xcWdObndNdnNwYVFsMFVBWGhqRUoyQ2Fsc1Y4WSsvaWc2dVhI?=
 =?utf-8?B?Wk9sNGZnQmgvWFJab0hXT2hteWJCZmwzSzNpeUdDOVY3NnF0aGxYYm80M0Q3?=
 =?utf-8?B?d3A3Q00wSDhkdmFJbnY3NEF0WVBOcXdnL0lTMG5aWnRNNUhpbXMySTBUTno0?=
 =?utf-8?B?RTVsZFkyUVUwQ2lTV2xnR0MzMlBNaTlTRGNVMC9PcDdNUkVYR0N0MS9GRlBR?=
 =?utf-8?B?MEM2SThNKzVIeHE2UG53ZHJuVlVrWW1ScFd6ci9JTmdEZlI5ZFFucjRlUFZ2?=
 =?utf-8?B?aVlKNWljNUEwL0hSeUd0eFZsdFI5YjdoN0hxbWlCM3RWUXlCY2VlT0YxQ01k?=
 =?utf-8?B?TzFtQmRHUWhzTnJrK2pXaVV1MXBNYk5zK1VyMFBTYUQrc3k0RFgrMkh3R25W?=
 =?utf-8?B?a3hOS29LNXhWd2JJa21EaVg3Q0tFZkxwcldjbjN0QWFLaFczUExtWTRuejVK?=
 =?utf-8?B?bG1rcExCUEtrNkR1Q0xmK2xEN0VPd05zbTRQTFBGb0dsbVVFVFQ3bFBTRzB6?=
 =?utf-8?B?TWlJQUtFb2M2bVUvRzJqa0RucHhsM3k2ZE5yUmRNNEh6ZWJHS1NXQ3JBeDFa?=
 =?utf-8?B?RDlwNm8waldhcTN3cGplNU9RQTdzYzlnMWh5UkgrSmNrUmxPYTBpLzhxL2ZJ?=
 =?utf-8?Q?BfaPMCjqkMHKZMtnbDbGl/CUr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e231da1-b2ba-4107-710f-08da6412a292
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 14:27:22.7604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ulOC2J3oL6UnnQ7PKJBtPpWmIOlxYJvRlxqPSyoJTZyCO+jowjebkjPiTiWftPqiP5hIdms7R5YOxiJNQz6nbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884

On 08.07.2022 16:54, Wei Chen wrote:
> We have moved acpi_scan_nodes from x86 to common. Because of
> of our previous work, this function no longer has many ACPI
> characteristics, except some "SRAT" words in print messages.
> So we rename acpi_scan_nodes to a more generic name
> numa_scan_nodes, and replace "SRAT" words in print messages.

Once again I think the rename should happen before the moving to
common code.

Jan

