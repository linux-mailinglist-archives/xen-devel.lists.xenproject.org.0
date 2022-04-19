Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2809E5067A4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307931.523338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngk5t-0005qE-TI; Tue, 19 Apr 2022 09:24:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307931.523338; Tue, 19 Apr 2022 09:24:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngk5t-0005oF-PH; Tue, 19 Apr 2022 09:24:21 +0000
Received: by outflank-mailman (input) for mailman id 307931;
 Tue, 19 Apr 2022 09:24:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ngk5s-0005o9-AI
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:24:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d6d4142-bfc2-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 11:24:19 +0200 (CEST)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-11-qsDK-B2oODO0X1tJYHm-xQ-1; Tue, 19 Apr 2022 11:24:17 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by GV1PR04MB9088.eurprd04.prod.outlook.com (2603:10a6:150:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:24:15 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 09:24:15 +0000
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
X-Inumbo-ID: 7d6d4142-bfc2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650360259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AXDhlTyJD652SwmNSxvKUIOuVlIov+Elq5BJ7hIWKpw=;
	b=P8v1GX+UdNhcrJ4uzkXOVFkM/ErmRtRrXhZAy514fRFX2l46LurdlhpLiKBM3+JQ7Dpxhw
	M6ZuAkoG+Qg7dEgJ712LdjwlNue4Ye7rXvW3WZM0y09+eWxtJc9YepaPnWQxMd3wqf5Fvz
	Ydd3x8qN23nYOiwYXFda2tcn1HZ6dlo=
X-MC-Unique: qsDK-B2oODO0X1tJYHm-xQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HL53cwLVKZMhASBsLNuli6ICqz/Yi11GxdpAlQepDAKtpcB6sUahB/doaNOBpaTX6KNNJzsz2qNJVZNat3tqzawqB+xkm2rRPy7NnU56oUGEk9vfr4HFtG33YVqxAbv4C6mF3s53nPqR4S/cRKw2WVH6duwsrYYb3NV4Q/jCtK0ZI4/tET0B775VlHGlr3HK78MF4WIrmiwzgkBqh1tJASevUFP+THFsy//N4kh1aKzeSo9Zq3gZ1KExT18GCBR5l9hLLo5lZ7+6c+wgit9QQb1gnMEq3pXF+lYbRTcsYKNweW13RNM9f0QxKLMFp4y5rxbTRV/XktSnEFi13U9O1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXDhlTyJD652SwmNSxvKUIOuVlIov+Elq5BJ7hIWKpw=;
 b=kyQ50AgDwKM/+QkCvrTiB6gpYP7bXArKzYAsWOwuW/HmzbRIFlOaXelhBA1jwtxcUB3Hv1MA+Z6oyu6uSb2/4HvBRjl1Q8SCPAtUmkxro8xwSRJpzYxjaPDffUANDZvq2E6Stvky73RrT8qMeAnIyBAAPpqGHi9mq9r8DGJSDVxxw5UqNU6E1QZZxxRTOkFtKeQOwl2Gdw0mhU5kQDurT3WOwKnmHaRlCPJqeEP9Tu9uzMvSCUzvsCkI37At5//D7/VaUo94jVXg7m2W/Ffj/RjfwqsnJx0sY70RsW6N2YYKUeIwSsSLdVdF+Rmcf73CXTeCj28N44W8sVxLTYhsXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac74e26d-7274-3d7a-1143-6d9329214b41@suse.com>
Date: Tue, 19 Apr 2022 11:24:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] include/public: add command result definitions to
 vscsiif.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
References: <20220323085831.27057-1-jgross@suse.com>
 <73498b4a-2175-32e1-13d3-2aa0a4ed197c@suse.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <73498b4a-2175-32e1-13d3-2aa0a4ed197c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 265644a9-066c-46cf-8bc4-08da21e65f81
X-MS-TrafficTypeDiagnostic: GV1PR04MB9088:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<GV1PR04MB9088CFFE85936E0ABD5533EDB3F29@GV1PR04MB9088.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g2kYUJNX37GR1piLt5a9r5zpyWw5+6gAetr8bDn95IN+tLeC7/5+R1T/XlcnNiR7xf13o8Z08JiJ+fXQx5y3KmkOpJfR+kESB2o/nHDT8IrhZjN7cLj6p8IJHGvLEX11TPsJf7lmfhDi6oPPw8KpDRXzoBEH8H1kGOMo6yTAnx9fklBjPQWeeltrNN60gffmHw+zRn+VTFOsubuWxbpD5XQ0b/uZmAK9Y0t++AgEHpChH3lE5WB6EF19ksjjZsEF5Be8cK4bzTH7qyT02k6TRZJ5ZUjo6vnhRzAD98tZ1DymYGh7LNJ4XAR4CG8utUshRSGlf/+mGn912n7XfEhi8cs3kBmOFvvV98N9lanabT0afkkvU6+yD/LphpuIxN0nGPbEM9KCy+m9LWptr8gpONqrCIqicw9MCV8ZB0ISVnW6uUgODdhMwew87usCX2ljIiUN72hXIlH1RsdmGljlG8btTrTZP/IbPWn5UaMQSYaeojOWqdtdLxNXhV4Rn3o41ONdgnEf20pRs18hWYHxbyLJiznGYABLa5CRNRTN5DbCnm9zHFlqOhEj9a02BDiqFGoOmQE7W1bYLxf4JD+iV2Mm6iNyXTchFwjt1/JRPhSmY1hsoiuUjtgJhLXU0vnn70u74Ae/ek4cagIow4o8WebP9/mzZrOug5T1wxmTrrKdZLruRl4X0FmFTiRV47Wyh10waXpRyodFsbsEuNoygmCH58CCRmegAaoj2SnICPE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(37006003)(558084003)(508600001)(6512007)(5660300002)(6636002)(66556008)(2906002)(26005)(6486002)(83380400001)(53546011)(186003)(36756003)(66476007)(8676002)(6862004)(4326008)(38100700002)(6506007)(2616005)(66946007)(8936002)(31686004)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVdzOXd2cUNtVlo1cWY4bFdrRlN6SHI4a2FTVlF6UHZNOEhCbnpOOFhYd0tR?=
 =?utf-8?B?a0dabjV6K3gySEs1c1Y2V2M3UFVwNk84aXFiUDBydE1oZFdlZHRBZGxPbWcy?=
 =?utf-8?B?SFVGNWs2YnZmOVR6SkdtdVplRDlKTWx2MXptN0VQRVE4TWtNcFZhWUp6eWtO?=
 =?utf-8?B?b2lSYkgvSHdJMy8wUWZZRzVHT0xWaHRRelVtbzNyZmFoTmpHck1zSW1DRTRN?=
 =?utf-8?B?RThNTGlQUU1wTlJyM0gxZ2F5ckkzZExIT1RDRlk5VWpoSWZ5bmJQUUN4UTlX?=
 =?utf-8?B?MHFzOWdjWGdLcFpvcWNDRjlWODh2RmkveDZsSVZjdEpUMEl6cFg4TFZRbGJD?=
 =?utf-8?B?eWQ5aWFRd0VLM1VxMlUwcXJlcmFYa1RLdzRCaTJKNWliT3pMbldTeENzOGtL?=
 =?utf-8?B?UUIxL21ZbnM5S0lUamJlVUozTVR3Ry9pRnB3SGVrejhjUmpENm9mWUsxc2RU?=
 =?utf-8?B?YnZsK1BIV2hMSS9rVGRaV29Ld3I0UUpMVGo4aTdHeXZ4R2ZwOFc3VXFUbkg1?=
 =?utf-8?B?bE1hUVIvSG5EWmZ6VkZmVGo1dEwrTGk3d2xHTlgwYk0va1RoYTY0bUIyMU9t?=
 =?utf-8?B?YkxQQXcydmN4UjgrdU1pem1RL0Ivcnl4ZnY2dUQ5L3FrSk9UUnY3Vm4xQXJY?=
 =?utf-8?B?RlBFRHNZS3d5Qmlwb0ozWHkzM3BPL2dUN3NwOFlKdENtS0NsNWRkUGgzQ25a?=
 =?utf-8?B?Mkt6QXdnMTJkeUVqREhJUDYxWDBZY2dHNjU3TFBKci9YYTBFSFVaWUdIK3Z0?=
 =?utf-8?B?d0ZIcjBSNmhEZ2R1dTBvUHB5RGM2OVIrT2Uzc0g0dXpFbWZXZEo0UFBzM3Bv?=
 =?utf-8?B?Y0psanRKb0ViTEZEWjlxRzA1dTdDWnNQTTNmRndFUEJ0ZTE4aHBnaDd3WHpB?=
 =?utf-8?B?NWNmb3hpTmxTUy9RRFNvOE42RTkxUGp4L0VQQzk2aEhtOUJrSFNkNmhySDBW?=
 =?utf-8?B?UjNYVCt3VFRvbVNadElwNEF6Ti9mRlZza0hkMWNzRlF0ZnQ0SU1rWnBHZVZO?=
 =?utf-8?B?L0Q5U3hBUGIzbnp0Ui9HNWVRUDVIbGFGQUs1WGQ3Y0FGNGFDNzNzRlEzV1lD?=
 =?utf-8?B?TkVJNThEaXpMQnh4eDlEemwxMWRVc1pNWkJQUTBjMzdQdWM4ZjYyb1VKM0ta?=
 =?utf-8?B?dkxQc29WWklDNldWdlhGbWdVbmkrMEEzR3NZaVVGVEhNcjkyNmRBZXBzNlJU?=
 =?utf-8?B?UFNrM2s5Q2U2VWNPOU84ZTBlNDhpa2lNN2FxSTVHeVNyM0xTZ2Y1anAzUW5y?=
 =?utf-8?B?Y1RjUHhReFd0OXF5NU9Jb1pndmpwQlV1aEtzZy82V3dpaTF4UHhBZTMvQ1Uy?=
 =?utf-8?B?dGM5SGoxWk5mVTZWYnJab1N3WUZXUUNGVTRPdHJNOVFxcXRpM3JkS29yY2JW?=
 =?utf-8?B?WC9OcG1BQ2RxRTdjamdBMEczdVVwSk1lbzVhVzg4L3Rhai8wNllTWFh0MFZQ?=
 =?utf-8?B?ZUtLUEZwQVRmNmVzbjkyR3NuRkIzZXNRdTNsclh0dWVQelR3cEwrRXordUlC?=
 =?utf-8?B?ZGlDT3A1dElqQmdMSGIzLzc5N0N5bzNCOWZ5eDdXSEVuQ3dHalllT0E5R0pE?=
 =?utf-8?B?VXcwV3c1eVY0SVNZT3A4eEVDRTNuZnRTTlpxR2tpVCtIcXNUcGtFRUdRTnE2?=
 =?utf-8?B?a2grUVNxYWxocUN4UmxwcWw3ZWY1QVpIT0NpVWloSUx3VGJuQUhhdnRESGIw?=
 =?utf-8?B?UTlZcDlIVVovZ25xYWRJQThOZTNjN2dhcmkvOGV1aVRHSnRiYWlhcDM0VS8y?=
 =?utf-8?B?VTJTN3c1L2hJNkt2a3l2Zm5jVkR1SzZNVXduekU4WkhicHJodk93WnZLVGdJ?=
 =?utf-8?B?S0dQelJMZHc2cGVxMW40TitjNStTVG5FNHNnbGoyaGNKNmRQMytYc0VQSm9B?=
 =?utf-8?B?Ly80UjBnbC9tL1dDYmtZVE9FZTNWUWdFaWRSNXo3SGNPeFJUMDJzYmZUaFNC?=
 =?utf-8?B?cWxlb09HdklSOU9rc2p0MXkvaU1ubytIRUxmOHlBSzN6dDRyS1hGRG16d3dz?=
 =?utf-8?B?RG10Q2NLZXFWNW8zb3hTYStza1ZjZDExYzJLTDkwaEJMbU9haUF1ditZT3RZ?=
 =?utf-8?B?T042VmtQakMxN2FiK0NhbENyUjF6ZWQ4VWxTUkozMDMyNzIvYmRMT1FPc3BV?=
 =?utf-8?B?eGdFdHM0UHA2RG9yN1pESUlNb3RTWlRVNkhpM2tta0RBZDZ1c2EzMjRoOEJy?=
 =?utf-8?B?THozb0hFVlJwT1RZdnN2VVVZMWRBL2FDUk9sL2R3eHRzTlFVL1g5eUMzVmZh?=
 =?utf-8?B?MFh0ckVJZjYva2dCZGE4cTB1R3BXQ0kwekxBekNiSC9LRFpZN1ptN2ovQnNP?=
 =?utf-8?B?NTRmNk1MdW9kSDlGMzJnd1RhY3NwK0cvNzVKK3BNMUxmZWU5L2pPZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265644a9-066c-46cf-8bc4-08da21e65f81
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:24:15.7209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqFpPbq+8q+rg64syNKTuqQsD6hFldM2UU5g15zOtUCCJKwflLJy6WcMojDtsIEhnJWRhqvUZtQC3+LbqBUkIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9088

On 19.04.2022 10:34, Juergen Gross wrote:
> Ping?

Actually this patch is ready for committing - you have got an R-b already.
I merely failed to tag it as such in my respective folder, and hence I've
overlooked it during earlier commit swipes. Will include it next time
round.

Jan


