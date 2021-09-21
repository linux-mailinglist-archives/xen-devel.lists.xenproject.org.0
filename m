Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB04C4136E3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 18:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191805.341916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSiDU-00081B-Lt; Tue, 21 Sep 2021 16:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191805.341916; Tue, 21 Sep 2021 16:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSiDU-0007yI-Io; Tue, 21 Sep 2021 16:01:56 +0000
Received: by outflank-mailman (input) for mailman id 191805;
 Tue, 21 Sep 2021 16:01:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n1Hg=OL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSiDT-0007yC-Ck
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 16:01:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cd92b48-1af5-11ec-b900-12813bfff9fa;
 Tue, 21 Sep 2021 16:01:54 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-psT7f8bOPOWNxCAZvh2EpQ-2; Tue, 21 Sep 2021 18:01:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 16:01:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 16:01:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.6 via Frontend Transport; Tue, 21 Sep 2021 16:01:49 +0000
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
X-Inumbo-ID: 3cd92b48-1af5-11ec-b900-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632240113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g4DoNcY/J/VsXztfC2Nh0R7m1HKKgj/Pb4dk2bN2u8Y=;
	b=H4R2zOwRbggB3mu1c1vs+2XN2EZQd0O1X+hPB8/gNnccdH++qeVsplDvUDETsJRFbUavv9
	5t+t3Vil4xb57XuA1SSi8ST7VpuAzzxgz56J/srLj6cpzGjrR5sXSqzAtB0rK4Y5NHRLLG
	t+l9X/Xu3a8TUJc0YkKBRuMTvlSyRhk=
X-MC-Unique: psT7f8bOPOWNxCAZvh2EpQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVV/951G4GGdW0hPKF8Pw5rEXZx0zNxWlVR2EBFIpg178qhugCg3LEhuzbkNlmWxOHep6F4cp86WQ4rzVGbzW5G32oELeM++K81eb84qfntutFvsdTcXTBUbPB02/h41IpsSAL1agJDmsTW9QPrvloHbRz3Q+Q3MX536+wWt5YrOZ7o1eWpWrNnifMsq2z4aHySl3IMOd/U/ornBYF5LQw0+KV9TlcLkNAbv8Ld62iTPDoxCxqkvdjgOLECzelU0zvA9l/DlgukGl8XtUZM/NSvMwn4Zxgbp3g4hKEt7JVGxzoCcqIgmRE/hiJKr5cRB/EhMqZFJrt3wbSZD1Fn/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=g4DoNcY/J/VsXztfC2Nh0R7m1HKKgj/Pb4dk2bN2u8Y=;
 b=Y0YucGH6Q5B9w1ZeCeUzBjewZU7iI5Sbs9bkv4yZ6ETsylB40El0662VjNaH41XrN0D0Hjzf1FG9f2BKaFFnonLCmXD6RQSPAjwg13FHKqVJDiJugr1iROoaBh+KVuGGeSZW/tQEnfznwrOooE8P3154wplud3U7bEmUK4sFs1Cc92kMKUJEdm1zQ9qhQ88zgbQnnIhX1wesdXUvJuOuk38JVBQFYaK1J1oQPvLD9/PXrX2RuUoSPE48HAE0OcECaLse/rmvTQPMoeI13YhORpsuPdlcv6vTMBj0OdJ3XYY25DIK8LsPuhv1QfsbpIbIS7q3KJLp84UDTLAzL682pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 11/12] xen/arch: Drop asm-*/trace.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
 <20210920172529.24932-12-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa361622-b4dc-a8e3-f889-f3dcb65cdd4a@suse.com>
Date: Tue, 21 Sep 2021 18:01:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210920172529.24932-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e59bac9-c30e-4773-8822-08d97d191f59
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304E217A361924004506BA7B3A19@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PajH8ddQIuU9zcsm9eJJkxSkI+3btXiS97Dw1HFRoHrcmeEA543wsVW+3juLhV1Hb1IBzwm0JRpHLFatqZ2QVPrFbmvtk+oUDadngIqy5Bsf+FleWSJHgneEKoi5O1YBmrA1wgeu/OkajgYhKiODRodoC6Fc/81ZbngbHDNsqvnLlbMSBzyWSyeH0Cl7eGg3mdLv9ndJMOkYOswNQmtTYzHVoW8QzmxQYbmwIpjyf6LmK/sU6Gs2SsA4RdU0G250JQ31A1kBt499txjH7us52CBQiMgF72qRdDpdGTv9/0euGg6s6AYRwaIhlbvdyKclaDnJ5oZgrfjCB+qZMCI8V8B2sYb2Eq+9YU8Ns7pKMkcEaaFVvOOrcXYirZwFlwazeA24AeR1LWU8OmHOztJwhFgyHaRvTIkzHbVNaSdTfAdUucEwnYjBMg1b92GH4w2O9CAULmtIQ3hY9Y3gVtQRC2ObugrKfcsEplvwwhHOi1OM6QFLyNZGO+D9liRVxWO66siCRfolHG3YFWVLk0M4Lbkk03SUWfqfl88VD7MBph5LF1mM533g3xG6Uam+xQxceGaOljbJQCbGGX3ZuXWRUzwvJGSllNy5wgTL5acM55xAlrhmNCVuGTysBTE3o6WvNM2OUNQBMBLc1PcK1Pu1NhrZTqxBMB+l2bD+SK0nmjv0sif2H9iI/NMo66PsARVmSShjjvG0GyXszDhUF3vZ97f2viPHbE7HQnVe3XIDvVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(956004)(4744005)(5660300002)(316002)(86362001)(6916009)(186003)(31696002)(31686004)(66476007)(53546011)(508600001)(2906002)(4326008)(6486002)(66946007)(8936002)(26005)(36756003)(2616005)(38100700002)(16576012)(66556008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjZvbWJwTWhBYXhuZmJubHNVQ3Z0dG00VDNSVTNQbkRTaXM2T3J5QVJOVHBS?=
 =?utf-8?B?NnNCUXI1NE9GdEV4RnlHSXBZeFNWL2l0M1FuWHhWRWh2dXR2TS94RWRyMGhF?=
 =?utf-8?B?ajFTS1I4eDR2d0pRSXRVb0JJMFlEdyt2N1Y5aGtYSm5VNms0YlcyaXRra1kx?=
 =?utf-8?B?MlU3NjVLcHdmM0ROREFyZmMrNFVmMEYrRUg3dUJqdHArNUtuNGtDZWNiZVBC?=
 =?utf-8?B?RGdoTUNIM1lIWURYdzBqU0YzZ1p6Wm9VU1kxaGRZWWdkNkJPcUFjUUNYQUtv?=
 =?utf-8?B?MnpIN2k3aFczbDBCVEpuQ013RXdGM1lGd01kc2FTOXhPTnZoMHJhTzBSVnN0?=
 =?utf-8?B?VWtMV3A1V2xwa203M3l5QnJwRThmdEg4aHdhVXpjYXc0NWZNZ0ZjMk45WlBl?=
 =?utf-8?B?UkVrSU5QNTVtN1hIZUxwOVVZYWNnRDEwclQyL1NSb1dyMnQ0TG9LVlQvYXpP?=
 =?utf-8?B?NTlLUjMxN2VrU0FsRTY2SUtqY1RJZTErTnNsK29tdGpYczloZWNHWHNjeGVT?=
 =?utf-8?B?d2RFL1BQVTZNV1RxUU5sN2NVeWY5TzczZVV4YThiNWJydHVuc1c5bFhtWHla?=
 =?utf-8?B?ZHFhRDJsNThYempKK1JQOEJYOFJtRG53VkcxSEdIa0svTDUyTXU4cEVsTkdD?=
 =?utf-8?B?QVA5UUlWU1k2eHpJdFc4L1lsSkJ3YUpCdk0yV0lLNjZkWU4xV3pRRXBibUNB?=
 =?utf-8?B?K3JWSEY1Sys1N1JQd1liQkU5bW94UDA1RWJqYVdDQk9Pc3B6YmxsUXY4Qm1l?=
 =?utf-8?B?TCtlbStGMUYzYVMyREVackVkN0FaOUwrWjVmUFVQVFJIN2NIczZ3RDBPdUpx?=
 =?utf-8?B?S2NaaFRGSkR1N3NyYnNSWitXMnNkZ2psQlNick1VeG1LempiVlNoTm5Obm9U?=
 =?utf-8?B?SGFsL3ljTVFOMTkxYzZjaEtUZXp0QzJvVzBNcWQzSDFoZ0lDWXV5ODFGKzk0?=
 =?utf-8?B?Vi90aHhmbytxTS85OWYrWHA5a0FqR0Rkb2E5OEtURkJzRDBXNk9xRTk3NTJr?=
 =?utf-8?B?MUFvaVdaR3FDMnIyaW1WakVISUF1Q0tldEtiNk1LZlVUNlRmQmNTeW9uVi9T?=
 =?utf-8?B?MEorVWRpYmQvS1VUT2htenlZanBNQ2JGNk5rWU9hZTQ3NXFQeThUNkxyejRP?=
 =?utf-8?B?R0lmNXJJMXVScUhRYVc3a2IrZXN3M3BYMnZ6QlVOMlBOUjZVSWJNMTIraXY4?=
 =?utf-8?B?ZTVBMlYyZUNNMnNOZ1RaUE52OVpUYW82TFUyeGNNNDNXWVYwZjNJZWVwYlBu?=
 =?utf-8?B?aHprMTB1bmpvSTRmRUIvVzA0MFordVhCbENvRzFHaUtqMExkSk5zRjBpMFVz?=
 =?utf-8?B?emVHQnRTQ2l5T0g0ZUJPRllZcFIvN0VFVktTM3lqY2s5R2cvWEZhSFFTWjJi?=
 =?utf-8?B?MFlqU3RSSFhZenA2emM3Njl4Q3dlVEJEbHN3czVsSW9lRmFIZ3NXc3hBcFdw?=
 =?utf-8?B?bjlqbythMGJnb2NPblhZQjNOdDNiL3RsU3MrdmQ4SzFJbWx3cTlnMTZESS9I?=
 =?utf-8?B?eHdnL0crNWhGaHg3L09zSzAyTE5iUTR1ZXdXMHpIbFRjMC9URWVLZzVoVHls?=
 =?utf-8?B?R3M2czY2b1p5WVAraVViN0RwMFpOSHlVbUQxTFFKeTFCVGlxTG9STlp1bFUv?=
 =?utf-8?B?SDkySHgrTHkyK1BlbTNiRXA3aEZTWjM5M2d3ZGl5dWhPOTFhNzVQR0U5S2Yw?=
 =?utf-8?B?SmFRWmd4ZkFHQkY3SHFSWmdZOFJmSk5SQXByVE9FQVozSkpuS2dScG9QT054?=
 =?utf-8?Q?2Xpb6QouC1tPiiBR17JAtgV/7GvkMrDQ9xv8KIY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e59bac9-c30e-4773-8822-08d97d191f59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 16:01:50.3911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajeSaNg9IU+6jlXXKTxcpaqyucYTTn4G3T5LsJN0a7M8CIcyPR887I1d2pZwF9TBhYE0CXrpV+hXqZvb0JGb8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 20.09.2021 19:25, Andrew Cooper wrote:
> The feature is x86 and pv-dom0 specific, and each architecture's main trace.h
> files are empty.  Don't force all new architectures to create an empty file.

The first half sentence looks to be wrong according to Julien's
reply to patch 16. But the change here doesn't seem to depend on
that aspect in any way.

> While moving the declaration of tb_init_done, change from int to bool.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With a suitable adjustment to the text:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


