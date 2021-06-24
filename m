Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B13B3298
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 17:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146881.270428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRIV-00047W-AU; Thu, 24 Jun 2021 15:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146881.270428; Thu, 24 Jun 2021 15:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwRIV-00045T-7G; Thu, 24 Jun 2021 15:29:43 +0000
Received: by outflank-mailman (input) for mailman id 146881;
 Thu, 24 Jun 2021 15:29:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QFrQ=LS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwRIU-00045N-80
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 15:29:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a05a8c57-5122-435a-8dc7-bf2ba6d5a43b;
 Thu, 24 Jun 2021 15:29:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-py8U6TBlP4a2O1Y_px8Cxg-1; Thu, 24 Jun 2021 17:29:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6302.eurprd04.prod.outlook.com (2603:10a6:803:102::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Thu, 24 Jun
 2021 15:29:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 15:29:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR03CA0058.eurprd03.prod.outlook.com (2603:10a6:207:5::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 15:29:31 +0000
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
X-Inumbo-ID: a05a8c57-5122-435a-8dc7-bf2ba6d5a43b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624548576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ydpdtYAmNnZpW8BgADft4BICYmMHsWJM1xz1idecOsw=;
	b=JLQUFwXYyxTqbwsLYru9/CJCiHRl2cLnIs1RK+I3qFtoBRVBWww043UEUZWnQvKMuLCC2S
	n3ajA9Nam+yoxgnIDhc7IlQp4Q0F24595ndKFtnf21J2juClsfPoELSUkpDC5VtNjfS9Zw
	A0d2RyFCrEzJut6H3U/lnPXmqBn7kKM=
X-MC-Unique: py8U6TBlP4a2O1Y_px8Cxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORtczgkNdFqbQYvrgRqi2A8SC4JoS+o508bdCuz9stFsQXBN/yDkvSTBJcuXehhnBxt+3J7IXEsLxlXSuzqc/Ifkw7ZT9t0QXL22fhtbCH1xY8iIzWWqqk+a3yt24AKRPzENlrB38ZYbxkwCNJ+cSUfUKfzrueXd3Tso1H7SwMnu+jvW2i/HwCp9lbJ7iC5kqUuPCIaZ/t0Ia0DVyba+UXpYXXDWAGfeiPBvUFugUDhho0VV90P96Y9/6e3vsq2fBrrQewXprRNsTySe1I8QHGdKlPTQesiKrJH9bFw1e18jhDCns+P38mGTVVa51CyDm5TFU6ixgX7y+Wf+pizmzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydpdtYAmNnZpW8BgADft4BICYmMHsWJM1xz1idecOsw=;
 b=RWR2ln+fkO2wf+fnM6uZFRkUs9IbbBrY8mm3sAQ8ypPVYTk1Gl4nmFkTynXfF+wWulAjDEOxT82Pf7EtPvdU5qUjHKuH6PQRjgxFC4ReE64uu2KIdGpNZ4/6yAnUuxDIte53A9JyzEp/s4NmNgCc2qqo2aXfV2MCh/Vx42fP9qehBGttdTN6EQ5AXMD3Pmv4Ac9D5yjV+0734nuTkYRuXmiGcg4hCfR2fwQ/RQxygyRyyKC+muNFFpawWiVosrzLNk0HYX3Wph0hH531OCE8CGH3gaTlCZb0m+9pjHcGPmeeOCmVkE21tEhITjXXorEOhVxxkcZv47uVlROnGNidPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Ping: [PATCH v2 0/2] x86/AMD: MSR handling adjustments
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ebc58213-f68a-e060-83f5-c9c89a87f074@suse.com>
Message-ID: <cf132aaf-96cb-b79e-f5a2-7e0f0f2d28f1@suse.com>
Date: Thu, 24 Jun 2021 17:29:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ebc58213-f68a-e060-83f5-c9c89a87f074@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM3PR03CA0058.eurprd03.prod.outlook.com
 (2603:10a6:207:5::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90e4c31b-2066-4478-312c-08d93724dd15
X-MS-TrafficTypeDiagnostic: VI1PR04MB6302:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63020761AF730CAF374A6B1FB3079@VI1PR04MB6302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YvymRl+811ozXAKEcUqu3mX3JCvll/9qin1/wREUB3H6flXK/tI+ijdgvBATAGX/6VDneqA14BGyYLBKeS80SHuHUIUyVCAluhfFpxOc8UJ2Q6h7n7hm8t4S5+ZswMFD0oUVJ5X9wzNTapKXN3I2T/SSphkjZ8lS6AaU1rI4Z/PGVo32qwE+TXTB2kyOGZGDWPIyKRDMt02hZpALjzZJ5O7levIpssV5RqyPf1MhCU2F0TlkulsGi0oJr2zZZMQNnlQDOlf1YZUKSBmSFsZEq8CtUk7HOqWi2gk9h6THCJA+tVJDGP58RSzZ4JtaESZeM2chkCTocbJoecLCQy0u07Ybl6qpkAJ5jVtLMVv5Q08Dug9m9FEQsGpPvVmqYJHSHLwhyPusQABirq0Yi6wOEOp+TFGvZB67qNRaDWWjIZyYSHBvVtWPzwYE2aFwuNdu/QhGI32e9BqAMTyU8hPKYWLUitJYGbdM3tylksxXMygntwTnX/xCbLC2s6vBsr0tgZfcKRMdrXuJdEfomYokYHRsqVJhV54DnR8RoPDktObkVe1LRP/kXXcpclUKKyunn3JEgb/XRtvTtk/wTUh/YGNdUK0Kv/r4SnBBJCWmnjKdRJ8qUyK/nOTe44N5QFNf2SRcXSiy5QQBpCR16b6l+itw48Tx/qoiHngUmyhpVm05Z4vGR3sUQF0d/Fq93dQ0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(39850400004)(136003)(396003)(16526019)(31686004)(186003)(8676002)(8936002)(6916009)(478600001)(54906003)(26005)(36756003)(2906002)(66476007)(316002)(558084003)(2616005)(86362001)(38100700002)(31696002)(53546011)(5660300002)(6486002)(956004)(16576012)(4326008)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SW8yYVdhVlRrcDh4ei9zVDB3bGMweEVnTVNrd1lHTFF6dTlrcG5MWWVnZ3Vy?=
 =?utf-8?B?N2hVT201NGp6MUtnWUp2Y1RTMFdGUWlhc3F1cjFmSitrTExqREZ1WjhrSUpx?=
 =?utf-8?B?MWoyS2FvTlc2elY4MjR4R0I4cjc0MzgzaW1TY0FGc25qUzJVaG5XakVBWVZI?=
 =?utf-8?B?QlhobHIybzJxdWNUR0hFTnN6azR3U3cweFlDR1R6OTRqS3Y3V0Y3cWNwSnlz?=
 =?utf-8?B?bVhaNWRUV3RYR2VpeVdyUVRQY1FqOU9VOU5LazVRZlJ0SmR2TWJOcTRCOWZv?=
 =?utf-8?B?azI4MkI5NVNldENNSWFTd3k5WUYyZ1YxeVdhNXQveE1vdUxHSlRRUStaTVNP?=
 =?utf-8?B?cXorU2pMVXZYRzlJYmRYT3J2TkVHSkxrZHJXd2tZdUZtRmMvZmhWZG5KMjNF?=
 =?utf-8?B?eGJRSVVObUdZQlBhQnVCVkg2NHhyWU1zZkdlNWIrVEw3TFgrSEVFZ0xMMEF5?=
 =?utf-8?B?VHdSSGVZWUlzOHFlNTBrZG5ERGhBdzlOcm1La0JyaG12d2hGd2hpdmdyL1N6?=
 =?utf-8?B?WVcvUE5mS080QXZIRWRsZS9sdVRTakFUbnZ6MFpWQ0pKQ1dxaFc2cE5kV2Rv?=
 =?utf-8?B?Y245emh3TENudWRZcUhvdmtwTUJkdXdBRWl5WmE3cFg3cGFKYUNPWDJRMVVi?=
 =?utf-8?B?Wm1QZGxDcnJKb3cxNVdMYXFqTFBaeDIxQTBpeUtMakN4MXdVWGxQdnFIU1Jm?=
 =?utf-8?B?MXRrcG9mbTI4WkFIWHhPYy9QN2oxM3FrZDdqUVRCVzlzWWlpUWtxZEJncmRa?=
 =?utf-8?B?ckhIL2YyOTAvZkVPa3pmWHVvTkVCVDBmOVNRdjM5YnkyeEFWbHJpYzBDTC9Q?=
 =?utf-8?B?RTdVdDRYVXRuc1lVcmhsdldqQnZiTElmNU1abEk1WDlWSDgxU3QyZXlsK3hu?=
 =?utf-8?B?ak1WQWVvd1F5ZjB4ZmV2Q0NzdlNhUi9HQ1ViWE1Pby9mVHlhck5KTWFpcWtB?=
 =?utf-8?B?K09xUk5JZFo1ZXpkajk3RHBSVFRXa2tUY1FMbCtSUUhpQ0xHUGtxTmVtWURo?=
 =?utf-8?B?bUNsalpkM2hsMTU1bXlzMXNsejlKajJvRVQ2SXhNSWFpV2plZERZL3VxMU1G?=
 =?utf-8?B?V2xDVUNCVVdJYWkyZkJkcEZFbmdmVlVpdlZEaUZLeUNXYUJCbVZQb3c2SDhJ?=
 =?utf-8?B?ZjBvaWxHN3pYMFVMVGE0eDNHMmxsb2drdDMzQnZIMmZ0NE5ZSlgxZ1JjVXRH?=
 =?utf-8?B?Z3M4UFltMUNKZW1ZbTAzdGtlNUZTbWtWdmdYY3dNRXM5dnZFcGVOUE4zYi9X?=
 =?utf-8?B?QUJ2K2tXM3FBeUk4S2Q2TmRlZ2wwY09HcnFkc3MyUmR0eVNCZGp5blNOK2ZX?=
 =?utf-8?B?VFkyT0xna2I4TG4yRy9OTkxYeENTUWRKanl3YnVWakdhU3JCaEJqTUFscGh4?=
 =?utf-8?B?NnZjMThHUXhYcGhNWUxEZXVDL0s2elo2Rk5ocElxOEhIaUxsOXhhQldvbHlL?=
 =?utf-8?B?VklwMlo4dFVISU0wK01XWHIyck9SOUV5MThkcnZKSTFmSW5MUXVyN2dRbkpL?=
 =?utf-8?B?eTFWWURWb1VCelZMSWd4OTJidjlCcFZvQ2grUlJ0aXFma2M5YmRIZWFnNDNq?=
 =?utf-8?B?UG14VFRsYm0wODk4RzBQbHZpckMxSEZoT1FPME1FTUVjVEI0YUFpQ1Ewdko0?=
 =?utf-8?B?aXB5cjlyeVZWaUtwb0ZMSEFOMk5hbHVlSGhIanZMcjJjTzJFRmVvNHBXUC92?=
 =?utf-8?B?Ny8wSC9BbGJScDZrMHdldnRwSkdTMU1hc0x0WEtGM1ZEamNXVjkrR0ZKYTAw?=
 =?utf-8?Q?Y3MH8fDJX3Vj7y4eS1vl76aCnfAbEb+OTbBi+oK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e4c31b-2066-4478-312c-08d93724dd15
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 15:29:32.0028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7w4OEDc7dOve8AAuWqj7XE0b4XT4Ri/3pturK6fM870WMLM3ShusxnawsTdR9AIt7gdjSinETKBT3zSYbCyAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6302

On 28.05.2021 08:56, Jan Beulich wrote:
> 1: expose SYSCFG, TOM, TOM2, and IORRs to Dom0
> 2: drop MSR_K7_HWCR

Any thoughts here?

Thanks, Jan


