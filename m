Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF62710BAB
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 14:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539545.840531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29hQ-0003zN-HI; Thu, 25 May 2023 12:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539545.840531; Thu, 25 May 2023 12:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q29hQ-0003xV-EZ; Thu, 25 May 2023 12:04:08 +0000
Received: by outflank-mailman (input) for mailman id 539545;
 Thu, 25 May 2023 12:04:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q29hP-0003xO-7m
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 12:04:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0629.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ea811a8-faf4-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 14:04:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8520.eurprd04.prod.outlook.com (2603:10a6:10:2d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 12:04:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 12:04:02 +0000
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
X-Inumbo-ID: 3ea811a8-faf4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ez36WMowM3z4pb39px9vodN1uefUCLSbZd+1KQycbvyQAo3zPc3LEvKPRxRoe+Y/yH2sKHK5R+O4I4n4zMrwdLJCU5Lik1tfg+355+NErdAZAG82C4RHOp2hOvAql3GdMoVM7sUexY8VYCCJibP5Rbrc41LhnhT79IxXQBlYcR2XaY042P8FoxDFfFDwYLV6q6Z2b5q8uawvjRj9Y8dyplWC33AFzxuJeJJNcRawRAbEgZBIROiEgQqynX0a9cimQ8Y88j6rd0XLrVROBbg8L7jn7XmkngTlA2r61dFYNEIwxsSW3f7FIYi0QTlU+RmQZWfr5ZRBGD113I9oaNrdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dwp7XA7BkKPFTSzfgcedWNSXYZUcivQb56k+3yfThZA=;
 b=jFOyQzmuOxDZ/E9w7FVQdfb2tvlOthmHRJn20KTk88U7l+VLZ1zYsl/FBmVqBW1azSiuU47YKpelHrZ4V8GSSbkPFonQeWVWwCWvxhJpBDQ5YpTtC6oNQh/PDhaB48hCsI+Z0UOF/45h2ZZC+9ukGAEGcCuULShvFzFvzsB+pb2RKF3a6zVkWUo06LELYye6NXuCv9tmGTqoYfXFLV9mwDN1k+iKivmAQx9NLayQYTA8ilRrQBH51+e56wKVWIBz8VbuaRbAcd8HfwtkT5Tsqt8eJ8mR31T66SE9ZH+dAzj5gsYdMiUqBibKyaS8svarWRbWWSjeZiKCJbf0nX1UOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwp7XA7BkKPFTSzfgcedWNSXYZUcivQb56k+3yfThZA=;
 b=iFh57fqHJX5pc9keMEsYzoKa8qCbwPflhqTObPXrMlXoRns8wqeS6G5C357npMmpLq7sTgix1uo+cBVzKiwNPuqOKmwUmA5VJjl7atZGE3RD9koYI7ftkoFYEqqoelmVi9q/FIKiyK5da6eg2YwqBu6JFF/VhFTTIhCuowjGXh0Mt6wAVa2E8OFdQbsR9AeHJgu0JOuLwolAYgtaGoD4RMnhMvZ++Ql8pz3pAXK2S9innT7c7ToBTQJhg4X+4IyCJ3Es3SjlQrAMnE6Ac/86jY8UxYYNNqppw0MNmcpQj1NhzkU7pfHhLRQK1Yz7K1wjd1E+2zJtOupZaDeFejmFrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b04a433a-0606-e473-cb1e-41b45bd1079f@suse.com>
Date: Thu, 25 May 2023 14:04:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 08/15] build: use $(filechk, ) for all
 compat/.xlat/%.lst
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-9-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523163811.30792-9-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6f7874-f670-45a7-a22d-08db5d182138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aF5Gyvkdh/opCqON6w0BgH0+nJ2fwgVzAUOQ8SyN9j8uC6kPm7iVrq9TqeycmwjYOQX+GQ/5qcmth1sVnqq8Sezz1N7pwDiXRy7vsb25tClJwrftUk5hvgAO61r90ZdPYiA3A72PbxO88Lju+C60SQykXhB8CJDjY5W8gXBnPhdi7es9yagmxtX75xLK9p+Eo7dMtmFq0Ba7LQMhzqDjbr65aOEbfTv6MP7soq/9AXaC0QLFKHKQFS1FbT7nwkusw78VWV0wKGA8RBUKuIS7xv5v9pNDoev/vgcO7F0l88jTSNdwSgk+x+OBE8aDusIoFJKBsDXwZuM3bpoC3dY5Q0Zwd1vQwsydZmQpDR4QRVUC8MZWlKBh+Gs/4BlC/xacbTXgIWkCkMIWZlrobGFk1yrjO/3Vi0WMMDiRRmr/Y13prhvMe9sxglRZAeE/YNDHoOgmXf5YbO38tuECMW0EbRiuUdM60+1GQ8fDTapbRAvJjTyaiA8GHZsYj88XpRetpUWgIi3kOfmpxeVXInqHiowUoQdhwDylTdavdlTItNFkXcMRTjxpcTkInXY0FVyjf3w5j/tkdQHBi9O2N+hPL2BsdPG9LEeNI8xmMB3bdR09bwAw0k0ZHVH2k1+UDi7KyH1W6CrkCHXrK3WgFiCYfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(54906003)(8676002)(6512007)(6506007)(186003)(8936002)(36756003)(478600001)(4326008)(316002)(66946007)(66476007)(6916009)(66556008)(26005)(41300700001)(53546011)(6486002)(38100700002)(4744005)(2906002)(5660300002)(31696002)(31686004)(2616005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWp1ZGJWMDRKVWlIb1lrR2JGZUI1Y0lSZGc5ZkxFMlFLREx3aWxoQURVRGht?=
 =?utf-8?B?aXZ2N1RiYnB1cDVnNDlBcE9oQ0NQYlNaK2ovZWZlc3FLc1VQWlliVDdhUUl1?=
 =?utf-8?B?dzdrR3FLUXdSS2NhcERNaWxQWnQ5UDA3MFVCYy8zWExsYlp1VzVYODY3Qmpu?=
 =?utf-8?B?MGFwWDdtbUFtMWZod1M5VENONjN2QjJRb2NabmhwQ3R4d3dKZHpQSlZ4M2Ru?=
 =?utf-8?B?dm1XNkxOVllsK2RxMXptR1puZC82UVVOYy9Wb2k1RThXYzBLcFpFL0NFVWtx?=
 =?utf-8?B?MmFRZDFLS0kzNVMxYkY3M0xERHFjdjFkWFQ4SFMrL0FJQWVXeXRMbW4rVUdT?=
 =?utf-8?B?VnlQajhlTnU0dXJIR3RreTBwNUNLZnlSbHFwUllUS3F0a2dpTUlSM21sMGcw?=
 =?utf-8?B?L09VeG12ak9WcTRPUERSN3NFR1p0ckdZcnlsQUlMcXNDRTQwendSeFl6bkkv?=
 =?utf-8?B?Z0grdkloS3RNTjlOVWdiM3ZLbTdDYXlOWDVuVkFFRDB0ZnQ5RTZaQjBRb092?=
 =?utf-8?B?aUlNaEZIL3NIc3psdGJzVGFKeUtGSGwydXFza2lRcVV1QW44ZlBvTkwraHFV?=
 =?utf-8?B?d3p4VDk4K0FsVTV5RGM4NmxDRDFLMzkwb1M0MS9hNmdEbE9wYnpWMW9tSmxh?=
 =?utf-8?B?WmFJUVdpOHU4Nll0T1RBNTRHY0ZHSUNvUzVJUXdOMUw2dFZ3K2xsZk9DUldp?=
 =?utf-8?B?a291NGJzM0pDRFJPRHhyQkZFTlIvUnNDaElkb2pTaE05MjNpMXdFTHYzbnR0?=
 =?utf-8?B?WHpMdmh6VUx3OFA0ZUdNclZJelN0ZWgwYnlpMGFVbTFwaGZvUFdlVWFRZFMx?=
 =?utf-8?B?TmhoQVJ5QXBGWlFONWNqM2xYaUY3dUVNQkdtZjRFNVZaV0FaOFRMTGJObGtu?=
 =?utf-8?B?MXpQM0FraEIyRXBYRGtSbnFsVzlkQ2dnMmtSMUJBYXpPOU50Z2xpcDhIQ1dh?=
 =?utf-8?B?d2FYUHlxOEJxbG1oREliUkdpaFZIcTNlU3g0cVBJeE9lR2lpOGllKzYrMFVN?=
 =?utf-8?B?aXRmNTNIWVFSRzdaR2JlMFVvZENkTlg4aUhSaTFSTksrM0JyWTl5K0lGK0dQ?=
 =?utf-8?B?ckx3NWluNVF6T21qZ2ptZUhEc3JaekQrT1pIbk5zMGZXaE9RMEJyaEsxZkZq?=
 =?utf-8?B?RjN3NDZERlYxWWt2dFlmb280VUV0NGdoZ0crSG9UR2NJSTVIR3o0dWlKcnor?=
 =?utf-8?B?MldCU1laZzNzMm5laEVqWGlaWEdVbzgzWGxpcUdHQk9NVEhHZVNHMjByZjdo?=
 =?utf-8?B?MkNVN3pwSHdrdzZKVlh5ZWl2dU1BMDBITHEvMnZYVm9SWDZaVmFQNzRERDRG?=
 =?utf-8?B?OVdvOFc0OHhUMmJOeFlFVWdXREp0T2NkOWplUVMzWHFOeVpBSjVHY3F0MmFu?=
 =?utf-8?B?MTk1Q0N0T081R21Mc3NGVXFjNTlwM3pwYmdHaE80WUtHeUd4UldTTk1EVXBB?=
 =?utf-8?B?YThpcndtUmE2UGM4QmNnRFlsQXJQZ2x6NVpNejFDR01JaVVsLzVmWGN6UW4w?=
 =?utf-8?B?MFltajkyS25LVE9GSDI2YjlTK2x2dTl3cHlnQ0s0YkFoUkFCd3FTYTk0YVA5?=
 =?utf-8?B?L3FaWFBJa0R1a2ZWZ2hqcXhQNFNNeTB2Y3ZNWDBMY0t3bDdYTkFXd2xZT0pm?=
 =?utf-8?B?N1ZPVWNoV3pDM0RlL0laVTFzUXBVcVozdlJQeWxxcjk3dmowejBJNXZFckVh?=
 =?utf-8?B?bnVWaEw2aGxIQncvOFN6L2FKcWNDdjIxZGR0d0d4dllhbHBiOHB5b3p0RFBN?=
 =?utf-8?B?dkVXVHZiaE5yOFE4eUtURjlmV2xZdWN4WXVyUDNvS3dKcU5UWVB1Q1hsbVFj?=
 =?utf-8?B?T1ZiLzVteHZEdXlUNGU5am1Xazd3dTN1VjQ1UVM0NEtUVHFWdU5QZjdsYkww?=
 =?utf-8?B?R0dHRG1teEN2NnVmcXBHcnlWblBwaGJWUllzbjlwaS9MV0FpUUxJK0Z6NVNy?=
 =?utf-8?B?VVNwVVFjWlNXWEVvT09MTTlpVTVnZ1JINjBaWDVyNFZsSE10b29DRGh2MW82?=
 =?utf-8?B?UGV2M0ZhTFdPaWR6cVZGM3FhS21pVUt5aDJDR1k1ay91a2FoVkd2SklyS0Jp?=
 =?utf-8?B?QTBiSzlVT3dSclZYS0hnT216S1o3K0xTUmlDRDN6RGNGVndoWjVNOGozL1VV?=
 =?utf-8?Q?KHmFTKvl5ptKZNvzTZlo0sOWo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6f7874-f670-45a7-a22d-08db5d182138
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:04:02.2635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AgBj0EuXSEJowiQnbtoMesOy+NjjjlRt/P79jz2MmwS5cgJ0RYn4S/Y4jCQ3BK0E6+/99zGh5NAb762zLz2YGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8520

On 23.05.2023 18:38, Anthony PERARD wrote:
> Make use of filechk mean that we don't have to use

I think you mean "Making use of filechk means ...", or else it reads as
if you're changing how filechk behaves. (I'd again be happy to adjust
while committing, provided you agree; here it looks pretty clear that
there is no dependency on earlier patches, and there's also no need to
wait for further acks.)

> $(move-if-changed,). It also mean that will have sometime "UPD .." in
> the build output when the target changed, rather than having "GEN ..."
> all the time when "xlat.lst" happen to have a more recent modification
> timestamp.
> 
> While there, replace `grep -v` by `sed '//d'` to avoid an extra
> fork and pipe when building.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

