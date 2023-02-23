Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7A36A0736
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 12:19:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500238.771522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9dU-00005i-P8; Thu, 23 Feb 2023 11:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500238.771522; Thu, 23 Feb 2023 11:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9dU-0008V6-M0; Thu, 23 Feb 2023 11:19:40 +0000
Received: by outflank-mailman (input) for mailman id 500238;
 Thu, 23 Feb 2023 11:19:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV9dT-0008Uy-61
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 11:19:39 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f59b91e8-b36b-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 12:19:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7761.eurprd04.prod.outlook.com (2603:10a6:20b:248::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 11:19:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 11:19:36 +0000
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
X-Inumbo-ID: f59b91e8-b36b-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4X+fpRZPFMD2h8M38LiX5aquf70Li9Jl5Fhaw0CmTl1pZWSNBvOCOxVszdkBOwO/1CQ89dqyHOBqS84Fu11dn/o95cOn+v2RzkQhq+j50XyJio0/MrojOubh8d5myJQ8/ig/MBey81Y/iErYVDxJoQf+fgs9+2SEviBsKrRZ8bKQxBa59sahZSzdwNUwpd1Ho1/jN8WsomorWQE0FHQcXIgdWwbuTpEw9NoL7OJI8oWReJ6QHskjLOLOpYx+q6Y4DsW047k9zJ2tlg0nSzjpCec6ykOZ/gBUGYyV0VrdSDjw3mWXzUgO5KwXxHujZaDQkVj+4JfRQCLluXiPRZiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONuayUx/gnKnpcRbFJN9uL1XN4lSXlSWQXdC2IIvs24=;
 b=QGPQtc6q5womKvWROiuYkC7yJDvBoMrrwitwBtLHBel3eW+26gt4b3IqENS0ojQQCrM6GNo/Ig0VgHuu6ypVeN2MHgArmkOwRIT4LE+8cyhPx9V1t6ipUCxa4lZKrd208qfRlw7N8rlBFIv+wi+p+YI077t44b18ag/U5c/h+gLDmsAx7MAMx275JXQ7MbMXS0pYxyK5HYSn4BfVFNZzcCjMBXUIcuHvonSoGsdIf3IJZw5cRMFjvWIgm5z/ENOuaICReez2UWar+mZ8wzIDLNS9LKWa4HtHavDxlPOc8dhPqBffJLwpsAFx5wLeQZ+3XSQ203kjIhOT5QdlJtNXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONuayUx/gnKnpcRbFJN9uL1XN4lSXlSWQXdC2IIvs24=;
 b=OcWP+u6E/Km7cevM5ILAS0giw88scVUaY39vJ3dotfTaAAMa4jR9pkOA2P21rnjrG71JS+gePU6iAWO5cen4+CA81nPaYLck6qM/TscToi9W3Jss1cpxpjaGB2w5nX1ve8RKeVuCNcIgSBjqgwEUg0e9JeaIJFHmNPToi596dNH/2Rm4Tmr3GTy4vCRb1Gy8zylanDDqg0gXks+R2kuq7YzkXAg+TCwldJySwR8m9nyNjFbHHjC0cYy9BZc+pQlfuN4nScWjXHR8qdV7/ZX6a4/v9VWuO70x/3icOPIPWLmtMaiOsQHF3yOgx72AY/cFHZ1QogrFt370V390uBnCmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f26968d-c24c-b790-8eb1-aa559cbfb427@suse.com>
Date: Thu, 23 Feb 2023 12:19:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 8/9] x86/vmx: declare nvmx_enqueue_n2_exceptions()
 static
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-9-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230222120023.3004624-9-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: 539e5562-0c0b-430e-0c4a-08db158fd8e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rebDXJqrhJ1L3rPa4BLXpYpIySE7TtVJF98s9wHPmvO2NyyqvhH+HsTVOq7pnjLUGLZmlHChpVoMPdG1d/AdRDYDD8Jk9VMjpCyXmVkFSDKgGbB3uA/y2/IqyZFq11vWeebocHkMwv404p85cBn8/ulo6oC9Ebyk73+WlpegwGqJNaIYZYSq0PmXUrZWkm3q8g3EXLUj9OMbBhKFRIOY6xgfzM7zwTu+Y3i5JCD3b7WQoDHPvrHkc6xnVm0WgcdDwfjP5vDpmUSWy0GPgh0R0N6KtMyQNwmDIbqRLG0AT0e9sqoq2wOTIzqiLxtsSe3tpCSVDs8OvClPTq7qpvTtnrOvoRk4KLExUP7NaL5o3FullDc3l7OIsl9xZOqYlnkLsIA2uU+wlRtIT0PimglAOe5rzQMemAkZHK5HYU5fGr1w2lWJH3gW53qoLjF1E8RsJ3fzte1pNYkK4/qGnxgHZduJR62r/0NgrGvizQiGvVNiP4E5hzj1W+7dYO4rCWr+r57xlvpuHarlCvkeAnV06q/SWVs5aPNds2vZnpy0GVqfQmGb3bmIqDdvkTQ8RVVpsIF94WdLm4ZDJXrk2ZwxhVn16dkT5e9hvz6e5AR0gr4j51rVPd8I9Ey5KMuUPPL7YuayXoX9ACEzzcrKevRVgi7uQiihnOcHgruIPn5Kp5JeZ6CSz2Kh5YgMqN6bZMfSg0Fw4d4kl4eHXTw+UW/EXLtYFIgR4aU36tnIjGtx9o0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199018)(26005)(6506007)(6512007)(31686004)(6486002)(2616005)(186003)(316002)(54906003)(4744005)(53546011)(478600001)(83380400001)(66556008)(66476007)(66946007)(6916009)(38100700002)(4326008)(8676002)(41300700001)(5660300002)(8936002)(2906002)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE1sSHFFUGtUY0ZKNlpBbnBJMTIxUElXcmVLVmVyQUVLcXp4d0VXLzUrR1JK?=
 =?utf-8?B?RFVpbkR0MEVtVjBacExPZHF2anA2Y0tkcEtEVTVhSGFSTHg2aE0ySVZuRkVt?=
 =?utf-8?B?cjVNOWtub2tVYm5EWC9sdXZQNWxYT21Lek91V1ZybzcrSlNpTmQxVjI1YmQy?=
 =?utf-8?B?WWc1bEY3dHJSRHpKVk5FdXNrdVZzWUh0bjhWc1lSNDFvOG5XZ0FybFNueWQv?=
 =?utf-8?B?MHV2VmNXN2U2Mk1aN0JRaXYrVTVOQzhXcDdQRzN0bUxlWFV0WEpxR0tXT2pK?=
 =?utf-8?B?UDlqeDdpUFV3SC9XMy9YQVNGS3JJZi9UaElscVdZMWFBcmExM0FtUExKbTBu?=
 =?utf-8?B?bXBqam5zM0ZEN2VDa1RIMHpSNzNDUGdsK280NEl3OEZQejliSTZVWk11MzJO?=
 =?utf-8?B?ZHpMTFozQ2JKWEtVR3FVY1hJS1ppbk1kN2txMTdXanU4NHJtZkFxS3NLT09F?=
 =?utf-8?B?QUJLbUVQSkNNMTJjazN6bjllYndMdWN2TDFkQmNhY3R3b0thdVFWSzVjeHE1?=
 =?utf-8?B?b1IzdllFR1NYYlU0UWV3c1RCY2x2Mjh4dVRuK1BQQ0xjbEF3b2wrbG1ZVHFx?=
 =?utf-8?B?NkFnTFdRYW1zSlFZTGZta2VIcnY0U2Rkbk1tbGVxdVl5LzVFSVp2L2t0MTBJ?=
 =?utf-8?B?R2JyODFTTnRkc3ZGbkhSYnI3bHIyR25ONGtQM044cHc4S2UvV3hTYkszaTZ5?=
 =?utf-8?B?YnlCVVVCWjI5Zk52cXdLVU11aWVoZE9mU2lqaEhxdU4wdWFVNmd2bXB5cCs2?=
 =?utf-8?B?UGNkWHJVTWpaVkd6emNSU2F4bjVkVmdWcGZPdXExVTFsL2VHQW9jN2NxNmtv?=
 =?utf-8?B?MytOYkRPTTg5d1k1bkE2WWVEZkFXTUh2SGgzd2FadlJIV0s1clpoeGVjSy82?=
 =?utf-8?B?eU1nMjNMMkVGc0FUSy9xbGtYcHhWTFVVY2F5RnBJbkZGb3YrRXgrVjJpSnFW?=
 =?utf-8?B?T1g2RTdVcDIyZ3c4VVlnRGtUTXllU1U4aFhoMkNoL1k0SUZrQm81WDhweEIw?=
 =?utf-8?B?M0N6eVdtS0hVVnVRV0xiU1ZUQi82VVA4MHVLUmhreExwbnlNRlRSa3Z5Um9I?=
 =?utf-8?B?ZURlQ3ZXbEJBcTV0L2g4Q3BzRldpTmFuYnRkRW5OMXo2Rm1MQk1jT08vZHJl?=
 =?utf-8?B?M0Njb0hneHFiMjhoRGFYbElSdG93RjVRVXdmRDFqblFaQ09iRWpvNVRUekVN?=
 =?utf-8?B?TTEwWjZ5OExtSlo3SkdpN1FDSUNIeitNQjBuSFpkOUlLWWpERkFEYnFQVjZ4?=
 =?utf-8?B?Q2UyWk9WaDJXN2w2bmREeHZlYWsyN2oxeWJKS0ZHalVZS0cxUjRLM2d0Q3JR?=
 =?utf-8?B?ZzAybUNYTXZWMm5pM005ZFQzem8vWHFJempFWkgvYmtLd0VEODhsaWFSbGJM?=
 =?utf-8?B?WDlQZDFGZ05rOUFyVi9UNjYrQ3N0VDVUcjZSb2hINGxvdzV0NzZBb0NFMms5?=
 =?utf-8?B?U3BuM1dsZnBMOEhKT2hkbzFkY0wyYjJ5TDFtWE01NzJyaUFiNjZ2QWdkR1g2?=
 =?utf-8?B?M3pJU25zNHd6a3doc2tPT1cyWUt1VGJIVk1UMXFXZHFvQmk1QjcxMGVrUk9j?=
 =?utf-8?B?OHJBVHdyZjJMZzk2QzhLdklhWi9BcVRMZVA1ZkhNa05Zc1Q0anNRRmJBa0xF?=
 =?utf-8?B?cXByTndUczcyVFpQRnBua1RTOC9WdmNnYVFMa0VxOS95SnNWdFQ0UHhIbm9P?=
 =?utf-8?B?NlptdGhmSXdrQVJPbDdqb0xXOHBUaDJBYWwwRkw3K3NJcHVJM1RHclh1ZEZO?=
 =?utf-8?B?eTc5OVdtNVNEa0FpNFpzREFFV1BobU03czlVejhPRWs1cndyd0NpdHVNYjh1?=
 =?utf-8?B?RjNaV2wxWHZIUE4xZUdIVkY0OXVBUkt3S2tnKzlTaEJ3SzlEcWZyZ2ZpcjZl?=
 =?utf-8?B?b1JWMXdyenhMOTA1ekVleEgySnZRR3Zkb3VTbzIwR3VRblp0NzNJSXM3QzlW?=
 =?utf-8?B?QmtyVnFHSE5OcTJzeGxmUkR2NHFJNkJ1RG1ZOS9UM3d0bkd5TFY2S01abyt2?=
 =?utf-8?B?TXNtWXI2VHhWTDNRY3FZc0dvdWVWOHk4dDRRVElqWklxclQ5ZG5EcXNiYVZi?=
 =?utf-8?B?T2pmTzd1cmJhd1BVVDZNMFUzZWNPUE5DY1Y3bkFBaTBuZlpyTld5REJWeVda?=
 =?utf-8?Q?v1tBoePgYOUg121xliIR5beUK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539e5562-0c0b-430e-0c4a-08db158fd8e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 11:19:36.8887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQsPT+a4TblLaTrnWo7MTv+FLWCleNMixNEdOcTUppBIA58LNV+2Phge9nEPKkL63s/R83jPadZs+6VKyV/g4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7761

On 22.02.2023 13:00, Xenia Ragiadakou wrote:
> Reduce the scope of nvmx_enqueue_n2_exceptions() to static because it is used
> only in this file.
> 
> Take the opportunity to remove a trailing space.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



