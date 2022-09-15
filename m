Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B85B95B2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 09:49:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407253.649689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYjbu-0006bm-D2; Thu, 15 Sep 2022 07:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407253.649689; Thu, 15 Sep 2022 07:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYjbu-0006ZF-AI; Thu, 15 Sep 2022 07:48:34 +0000
Received: by outflank-mailman (input) for mailman id 407253;
 Thu, 15 Sep 2022 07:48:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EMZS=ZS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oYjbs-0006Z9-NP
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 07:48:32 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00049.outbound.protection.outlook.com [40.107.0.49])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca94ca15-34ca-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 09:48:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7707.eurprd04.prod.outlook.com (2603:10a6:10:1f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 07:48:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 07:48:20 +0000
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
X-Inumbo-ID: ca94ca15-34ca-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkqPUfa7tYXH6ca374tGRJPocE+WZifoxtT8E21XyHouVX4waYy9DQc1XyF6sVb2o9+DGGqiDK6XGudOLJTfIcIwhHOxZNxAcLTYeNQX9MyD6TKqe25/L9NzkuQy63YtH1bJhsjHvcFr1B2AzT1vbiPLaCQnWiPB6QGqkhD+2L+rSDj/ZUooiFq8NNyfLTM0F/RN1si2vrfVcYpxF7gpsUyc8hR22JZHsq9pYt7GRDUWZ8sksbM+YCD/qM1PuosTI+KB8Jr98I2IECvNRFM0Cl6nQjfw+vzAeFDypRYI+NAj6mA7MPfcpG8dftnHXD8y06R04MaxxJRzYEXtwQUfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCcOU/8pjM8fzUnYoWDwMgknAeFVxFT+TvEvWJ7qya8=;
 b=VvznKBxyD9Anqvy0BQUhLUvIp/89ZFFbaAbpJnfY+qKnhgCy188FxPuEPOBIj3TATwHqYK7+ADMlxK1VEm3z/4Ea97Q7e06Yy2Yd7RXKGfHrkFsQ+BwM0/U0PaJuj5ECg7myY8+Sq6jjsYqrJuLTCRquLn2x7m56JW/IuoKqCuRGF3JFCGsFzb7qaHY+hQRuWRykij6uxzWWr0eS945c2Nd2iv3MP4CSbCOnxiHur0WgWTWZwxCe24GN8PWxET5lVyXZrVcL4jGUM017Niyb86vMAVXkpJQFqbSiu2zcHiqQ0JmXr0ihlx7Fb4M5nxNcnL2zj8PQHUzRjJivoNCdOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCcOU/8pjM8fzUnYoWDwMgknAeFVxFT+TvEvWJ7qya8=;
 b=HfJ59U0OneivDCycIfquYEuBnhxCGrARKyVwEHWS2YuyNcS7pCjcm3k9nQ+0iWqW5x+ZMitBLIH0gqePj/tCdYX1kMV/VJdUe6MYp9AFSXGfRfc8RGd1YC1YXa6PZ1xM+aOxfPMcV39WUAS533nQrSc7f76inRxctwh/885S2p4Gky/6siqYxS+btJQ0ZEyEt5CpcySX3ZcfzUTXVJNYdS0HQWjVyB31ogCUBJlkZ/Uc4uNzo1mEmPlReS/6F6YZF/7P87N5p0LF3kmwo8cKO4+vTdedUJAGJGZHcCY8Ffdi1tGuQ3qyeZ6XEDO+fj07NoPnfSBYHlAi5B9HD4iDgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d30961ce-1e97-1457-ddb4-d1a1dae8a52f@suse.com>
Date: Thu, 15 Sep 2022 09:48:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Linux pin_user_pages_fast fails on Xen
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: "NK, JESHWANTHKUMAR (JESHWANTH KUMAR)" <JESHWANTHKUMAR.NK@amd.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>,
 "Pandeshwara krishna, Mythri" <Mythri.Pandeshwarakrishna@amd.com>,
 "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>,
 "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>,
 "jgross@suse.com" <jgross@suse.com>
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop>
 <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
 <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
 <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop>
 <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <DM6PR12MB4564E946E0E08F71B1CC125CE6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2209131629370.157835@ubuntu-linux-20-04-desktop>
 <3c1eccfe-3ca5-32d8-ee5a-cf8e7b23d587@suse.com>
 <alpine.DEB.2.22.394.2209141749460.157835@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2209141749460.157835@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7707:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b598d12-eb7c-4a65-74ff-08da96eea8ec
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QkEG2+5h7AGNM8ogYGcawK0LnlJFsof4jQ6XukKb96mZGbsQb6pU9v9ZBEu5OLo4EMmeHMD+D8nTWdGKk12fAQ3YkTnpMAsyEbGnmA7dmHtuQuw/papk2VTIBoIqJea4b8XXh+75ZCGi7b/uDZ1dgjk1gujJmRBkoIhlxM0klDVjz/B7EkwUsSzKK+Lg6hZ5XSVnff6lmGEoF7OBvFf4yz4+dfpP/XYLanw0vdiXnnIqDEfwiLoby5chtgDkqo0J4ZZs35pH1ucn4K/B1E+rrr/gBwFbKEjCof1ZDVQe/mwbDSYfA4sMN2uEijrFkb9MOrD9CxCjjFhrYC1ZcEtIOZHa6UpY8+LKulZesrUtbjJ3XBJTtpu6aOa1fkjSJCEvEGU+hC5VpaldGL18FvqcGCm9sWXdnn796Ynn7jYCWDbhYx3baRiGNkmeWvCLIGxrZ2LI5RqMBhV1GRGDQyXDEpSGeiNeidK926hxTNRDyzmieGQN42og65fwXM9ySlkT/Bs6RghWUta9ZBteemubP5Xo1O+H5J228uYOWEXFhNxCsEBWM/dG5s5A2d2ealqf9Lk6mX+ZV95xjh2IrhfZL2DAMuEmUvwS9lwo8VvHwwSKPfl3r8QVniNH+tiDKqP3+Hu957VDAiIIyO72nyEgNYrljqd8rKv4FkWCURlNlRFhvXDNexu0Ii1FZ9xVN1Xp79DUx7QOUfc4K1uriikQsPnJ3Fm06nDVc2vHFntlEv0KZhT3Mwt/Vj9mZEdvcLRA6QmyoHyU3eT8kag9syhhzbHOnfycYPFUG9/tnxTOblc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(26005)(6666004)(107886003)(6512007)(6506007)(53546011)(41300700001)(31686004)(36756003)(38100700002)(8676002)(6916009)(66476007)(54906003)(4326008)(66556008)(66946007)(86362001)(31696002)(2616005)(478600001)(186003)(6486002)(316002)(8936002)(5660300002)(2906002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmdTL1NJd1I0bWJBb2h5ZUorSXJYSkNSN0Y3OFlWckZ5amRnT09YdUhTV0VR?=
 =?utf-8?B?SzVoaVN2cUpJb1RtTG5QcXdhcUtmc2xnMnk0aGdpMktzWkg5blFaTTN1YkZv?=
 =?utf-8?B?SnJ4M2pnK0I0K2czWURwSUZydE53a0J5Nnd2V0ZYTUZybi9yRkRVdFNhb29C?=
 =?utf-8?B?a1pEL0VVVDh4R2pmNVY0bU1qUUJPd3BtZVhMZXBNbUkrcnhJVnlNKzlNL3RS?=
 =?utf-8?B?L2hRbUk2SDJxdldHUW9yUGh0L1RvMmRLWWp1d3cwOGNuTzQ2N1JRci9sT3BE?=
 =?utf-8?B?Y3ZuK0pySk1rUXdla3l1N09nS3pPZ0U0NDV2SmUwNkFBRHV1eDg2QitqQjhm?=
 =?utf-8?B?TW1YcjVINjMvK25UUHlLa2piQktKRitVaXNtSS9NL1RDckJtMVRETjgzWGhU?=
 =?utf-8?B?STdVbFpYUTFiSXdweWxSRE1DYm15clNxNGlyVG03czlZbkd0blN5WlU5RXRZ?=
 =?utf-8?B?c0c5NUh4UTh4S3pJSnlxa2QrTW5UVmdpUVh6enZ5L0Z1di9wbnYrUVVtUXVq?=
 =?utf-8?B?N1lWOXBhRys4V0w5MSt4Y3NrQlVRRUNjNTZWMEc3UTNDWFhrYStKZ3Z1OGlo?=
 =?utf-8?B?YTFWeFRmWTZPOXJvWmIvYnh5MHlKa0ZiSk1ZWC9WVHZwM3JpMUYrbmVrWGtu?=
 =?utf-8?B?M28wcVZ3ZmtwZXI3czYxNTk5VU5yaytnRHNRVS9IV1ZnVTZvRUczS0dCQURH?=
 =?utf-8?B?YUZkcU5HMWVnaWNyTnpkY1M3TitLQ1ZSS0plSW9iMHY5Y2JITDV2aG9EUjdz?=
 =?utf-8?B?Y1FuUGs0ZHc1SERIaHR3VC85L3EreE55Wk03UnlZNnlIdmtsM2lNbzlyQWUy?=
 =?utf-8?B?SUhiWUJlUmV1dlJsa2dzTWo3VHg1V3BRUUtzMmxPVGJVVW1uaWltYTR1NmYy?=
 =?utf-8?B?Qy81Uk81VHhWUE1MRmp0aVBVMi9IV21RK0Uwa2NSMytkaWtUeUN2WFgxQTFN?=
 =?utf-8?B?dHJocVJ4aXBBM09vUzM0WVp1ZkIwWEM5Qi85eW9mNFdPR21TNDdVVDE3Y2hZ?=
 =?utf-8?B?WjgvZ3JXYUk2aVpPb1ZLVnQySEZ0V1h6QkxQTG1CWTFTa3pZVllJZHBZTVRE?=
 =?utf-8?B?OGwzU2lQOVR6NGpMWGJCem15WDVKYWlQZ2NDZmk3K3Y2MmpabE1xQVhLcGUx?=
 =?utf-8?B?OTdXRFlhczU3aWZ3WG5scVVVa2NSZWpxSmtxSlZKVExDVVd2WmdqbGZaVTNm?=
 =?utf-8?B?Um1KckJQNVVZTWU1RW8ycTY1eEZDLy9CTFBpNUpPZzZWRCtJTVMxUWpjd2Vw?=
 =?utf-8?B?ZXVza29CUTBnUFFJSTZpY0RIMTEwRkdJdGlFdHoyNm1rTmpaa2ZGVyt1ODFh?=
 =?utf-8?B?Z3BnT1NUd0hlNDlvNmNNRXRUanF1U0hBSndkUVlVaDFTU2JXZkFTb3IwaCtO?=
 =?utf-8?B?N2hCOVRLeTdyOXh6R1U5UHlwWlFiMG1lWUREb2RMRTZUYUd2dWFpcitWd1pD?=
 =?utf-8?B?Q1NIcjNYS1o5aWZ1cTAwWVRCQUU2YjFtZzVwZkg3b2tjaEJXT2MzU0VBeFVH?=
 =?utf-8?B?QXRkemdOZk9vLy9LVVJlK0hnTDJxTFVoZGt1ZlBBYm9uS0ZJdUJoelhDUGI5?=
 =?utf-8?B?aTNndXJXT29hVEhReWlvVXNGcmN4TWEwUGhpbDVvOXZaR2lZR1I2NXhBSGhM?=
 =?utf-8?B?TXB5aENqZWFpWHBCUDVpMGt6a1dROUpPb0QxT1dIeXQ5V1ZCbUw4S241L0Qr?=
 =?utf-8?B?clN6ZTdYMnpWMXdLUjJBZ3BINmN6ZzRsS0hKQUQ2K3prd1VZbkIxcXNPN1dB?=
 =?utf-8?B?U1M5aHJoSGM1M1NKMzhmWkp6dXNrUXA2VCtTY0t4OGlvT1pZckhmb2lWSDhi?=
 =?utf-8?B?NWhyWXNsOXQ1UHc4ZFJ2Rkl3U0ExWGQzU3VZZXV6WDNOLy9jMEM1Rkx3Y0Ny?=
 =?utf-8?B?YXFRL09ocnp0bk1SVWVxeHlwQ1Nhc3Z6T1JGZ2laQkVqT0dwNTB3bk9RRVBT?=
 =?utf-8?B?S3pMVjdYN2pKQ2JQL1d0dStSQVpRNzdwUkhCLzBub0FiMGRuZGJyWDFRWU9m?=
 =?utf-8?B?NnFla1JKRkErZW1va2UyOGxMTHVnYlhxV2FwcjZ1QlBoSm1jOVlPRmY3TjEy?=
 =?utf-8?B?amErbWxOa3Q3dzF1aXA3cUkwcGx4aG1YOUdrS3N3RytieTlPdFFoYzU4Tjcy?=
 =?utf-8?Q?UDLAgOKSURE0elMfxbD7yPRZt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b598d12-eb7c-4a65-74ff-08da96eea8ec
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 07:48:20.8360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOt16lNTMTyQxMLpM9DPIp1etsVHlgWMQiuE/pqx9KdJifLI6VwN0NbWmL5VCl1oFN227Y9kp7M4tz24+F0wng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7707

On 15.09.2022 03:18, Stefano Stabellini wrote:
> On Wed, 14 Sep 2022, Jan Beulich wrote:
>> I did look some at the specific use by the TEE subsystem, and it looks
>> to me as if their "shared memory" machinery simply isn't meant to be
>> used with non-local memory.
> 
> Any more info?

I guess that's not a question to me, but to the subsystem maintainer(s)?

For everything else in your response I think Jürgen has addressed things
sufficiently.

Jan

