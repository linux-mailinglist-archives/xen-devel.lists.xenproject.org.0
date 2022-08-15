Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F0A5930B6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 16:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387528.623825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNb63-0004oT-EJ; Mon, 15 Aug 2022 14:29:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387528.623825; Mon, 15 Aug 2022 14:29:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNb63-0004mH-BV; Mon, 15 Aug 2022 14:29:39 +0000
Received: by outflank-mailman (input) for mailman id 387528;
 Mon, 15 Aug 2022 14:29:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNb61-0004lM-JX
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 14:29:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2057.outbound.protection.outlook.com [40.107.105.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b04353a5-1ca6-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 16:29:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5884.eurprd04.prod.outlook.com (2603:10a6:10:b0::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 14:29:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 14:29:34 +0000
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
X-Inumbo-ID: b04353a5-1ca6-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4nq/ZorM0s4NcGifkYeVtZk+zCTFslPIyJbZoJsWs35zKyay4NtQRyrQAkfN1XzPFRHoBMqpTQmSGkGYhUFRkMjmaktEtXNbo0i09Gncpwuw62O9TwyTnGLyte8VS/KI1VuJJ4WJgsnpnLUq0N/sqaO16RMiN5wjCJYyj6vXy8pw3g8dU30VO85MgprdW3xIJ+tMe0Z8WkeY3h2G+wS43oex/cnzJrtYyYqjtVw0OQpArcMvocJS7gEBrRP87hlAyNL750kRnwdRMXL/xQAzNuEFO/X+S5J5t6FZu7BX0EbLNvpP/BYZYMo5v4gcGuetxJEDI/Gp99xakoiVrUyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJUoXJ41Afn2/8h4zn4mXfQEV1+R1WAZ6DMSzZL2u+s=;
 b=Vbxz8IzMOPeoAwvS1i3/QdnCk2HYiPNBVEo152W8CWgXgnh4fiqgGeWoPWlBHrGGFKtdz208h8CozhK8Yux5Hf9wKbW3CW/Weu+BMdl0RXNZO+ldZ5fg5PyWv2tu0s5aVGWTm49pHXLqlxG9oXhQnao5Gk47+fP4oUv5hogys/fsJQDu9s9bKr/flgdX2V+VrFNgeHOS7zEzM4cYcc89Zw6XCh3vtgrZCFRfiGO5OE6ypH8CSOaAd+U/M5sLn1E2I4TGJr8ssa72vanKj6pE0WpVCyCygrfsaSuenA7Q7uohyMZUPqULuqiGA2h0SOdklBVc/bDmh3R4W2QcKaGY+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJUoXJ41Afn2/8h4zn4mXfQEV1+R1WAZ6DMSzZL2u+s=;
 b=1+5AhvDQrk0J7On7Qt3DPpVW0uKuifueG8zhCAOtP7HHOSOoSJNQdVkHOgrJH0nKpWkOJtnZIMW0Qk9ukttbqeZbDF4lPdSL1zfW9CL679BZ8X1Yu+qo8RdzIO8NdC6BRy8PMV01S3hj7Sc1bIpqdkKbDKrLFK+vTO3cSfE6brBaSYynquaIsruufNcda9fmyW0dm3Cbe+caMk0/3Do6JmXqD+fUQW8bAFePcXp+D1u8ocRfXOk6M32n8wUAFRpc+iC4fkLJ0RRXyYD2FCgr1Az1QeUqnRapWGIyj4d+gvKI62bB0v0UkNV29gf92RLa+8HUb/APlGtwh9kvy2zOjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b29167d4-cead-76ee-e8bf-fe30867d4d22@suse.com>
Date: Mon, 15 Aug 2022 16:29:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 02/13] cpufreq: Add perf_freq to cpuinfo
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220810192944.102135-1-jandryuk@gmail.com>
 <20220810192944.102135-3-jandryuk@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220810192944.102135-3-jandryuk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a9bc3a4-4f78-484b-168d-08da7eca92e9
X-MS-TrafficTypeDiagnostic: DB8PR04MB5884:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LUmfPntb1jZ4nnlG7WH/dqOzqROAT/PdqbwflqosHlLu/3ZN2zkGcDpMwOQf46q52f/MbcbIyutzvjC7Ph1lYAKcNgt7nrMFveqFaoHZt4o46fEc68Ek4Yislx4NOgnQD3/2ffyHQxo4LIqBRSzDtQsV40HjXHsUCKuf83F9xZ0X8VM3YWrrTwWemkAUHmrzx0IyCjVV3e0Vv0xRw82OL+Vo2/AmEd12wjv8uvki9FGgRalMg/BZsvMZUua63hkcXwq9MFby5ZRdA/OwITQ2VmnTNkcWxx/6Oc/Xyh+he0vMl83U2WiN1IBZYOi3sP331CZDNR7LHiXAtg4YlPZAk+HCi7emsDUnfZcipxtzBba2pdexrzk8JQgHnS9TFjlT9YBD2fWh+Mks4lbCm92pQT415txapWt5o1MaknrUAIlGm6UGhijZck2rHXLC/dnwEUViBMBlKaA4dzvzRIWPchBmTdDPfRmJVr7hA9ow5eI3zLZZELHQ5ndz9fUqDXH54hiAcEDBcha7zIM/1E6UUUSlzhheJhVYZddOEOlDN0+bF6Ib7E8QdnDjLeAqZ3y9VX6JqwPbObOB2iRm7XA6Kn1V8Utit+dYRsT+GrH/jCdVqvQp85lBGB1O4t2BRcPJorNd2ocHDyRVx3ekjSBnm2+u0dC54aYSNQflTeufGFlLXe8CwURkup7+hnRjCk9RwylhlS6Rq3Zpkv+bTrJUOZ0hlibMo/nx5gikFfV8pBShQci0tgOeqUEKOr+SkTZ63aMM/Eb7r/LGw7RUBxruEBh15f65mzcFEdTE8UarljWqAXOfyuvh7vWXc3Iv9sjKpIcnIBmuNqHiJeIBCUq+lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(39860400002)(376002)(346002)(41300700001)(6486002)(26005)(6512007)(478600001)(53546011)(5660300002)(6506007)(2906002)(186003)(316002)(2616005)(4744005)(54906003)(8676002)(4326008)(66556008)(31686004)(66476007)(31696002)(66946007)(86362001)(36756003)(38100700002)(8936002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkNBVHJBc3RPRFI2WDUwMkpaeGVIWm1BYTZhR1NreWhuQXFFMmZQeHFnY1lu?=
 =?utf-8?B?K3ZENWlneENMWiszNDV1Y210Tk1YSmcyN3IxUHdFaVRnTG5XaGV3LzNrL2FO?=
 =?utf-8?B?d01FODU4ZEZyMDJpaFJteXordGppYmVQQzRselRlRDFURFhWRGZDY2hVR3pL?=
 =?utf-8?B?UlU0TndVZG1OTnFTRUFyRDhhdXExaFpXOEJGOFlxQ1hzMHc4QmZ5a2NsMUZJ?=
 =?utf-8?B?WGxZOXZjNGZjUVd2ZmpKOGs5QklyU0JxVmIwbXFVelVOYkYrdmZQcmRhZ3Rh?=
 =?utf-8?B?Sm1HemlZVW4yRUljN3BLcmM1V3p0dDQvSythdW9rTE14a0kzRHRlb011dlIx?=
 =?utf-8?B?NWJtek5EbHl5VVNHVFl2djFBR0U1YUU1bFM3NjNSMHpSOGNRUzV5N0NWcVdB?=
 =?utf-8?B?ajY2R2w2VitjdHNuZ2pOaGg3Y0xSVEhTekhaTFFWQzg2UHE0UkR2QUhxcnUz?=
 =?utf-8?B?SE1mTEZEMS9QeWQxMy9KUTVlSlY3RlAwbVZoZzNubjYrQW9GZ0cyNkJnaXhr?=
 =?utf-8?B?OUVJeWJxUlhuWkNXMTFpZ3JYVnllemJObElIYnlPMktyaDdvNytFcXpkMjk1?=
 =?utf-8?B?QWFxbFRtN1NtVnNjWVJkclBsL0ZSRXZIWVJHRTJxaW9rb2Jnc3NWVG9kNEhP?=
 =?utf-8?B?bUVUS1JPSEZ2OUo2NnJodWNwdDdUVWQyVmZVS1puVFlQRFZQYkZkVmJSOWxp?=
 =?utf-8?B?Rzl0U2RiS01jallWZDVEakpKalVocTFEYUNwaEFzcklVR0k0OEQwSkR0N2Vy?=
 =?utf-8?B?ZjVpSGlrRS9SSnlWL05aS2hialRlNXhzTVZxMFY0SHRzSDVlVFdsb1dtWlZt?=
 =?utf-8?B?WTdZVTN3RDM0NU9ydG9jek01R255QkZzRGhrUnVEWmh5ZDFRUEdEZUd4N0Jt?=
 =?utf-8?B?d1pZZGloS1c3cnluMGN2c1J5K3Rqc09LUFZnSjY0T3NOc3FweFdaQVpMZnJO?=
 =?utf-8?B?dlpDMnRabURiMGRWT2pzTW5kTWRRQ3JYTHgwaEZQd0t5bS9lVW9WUFhwMy85?=
 =?utf-8?B?blY1VWxnZWJiZTNwSmpQNjV4VlBsOVE0azF5cTVLbm5aTkZrQjhieW53VTJr?=
 =?utf-8?B?d2FZUENPcUFkNytuaHA0VG9vZXdJSEJ3VFBiZ2MzcUNVZmxaWjRwTllnWWJB?=
 =?utf-8?B?UTI2eklSWVlhZDVBRHY4U2xOVG5MeWdjMjZJSnlWdGlLQnpqamRZYjZqQVhG?=
 =?utf-8?B?QVYyYWFudkJyOTJ6cTdOcXRuM2tCSk95UUVDdWJpY0RRUGYwL3dMazlxVWh6?=
 =?utf-8?B?N25yWmpSRUZFaXpTTHcwMktuN1gwandkeVRjeTEyQ1I4MnlRV1laNUxNVDFQ?=
 =?utf-8?B?SlEwN1Z4UHBBOWdLTW4rYlh3RmFlVHBQWWZkenNlZlNqTUc2Q1ZHRFBpN0ta?=
 =?utf-8?B?Y3dJeVVtSXR4bnpXbnNWWndlbUlMV0IrMVZvWTJYRFpYQzlZMFNiQ2JETmtC?=
 =?utf-8?B?eWNhT1lWU2lHU3VpMGIzTk5NMFJaWFpNY0ZVUW1VbVh1QUlCV2t5eXZITVA1?=
 =?utf-8?B?eHJzRWp5VzBsNmE4a0hqRjQyZ3hCMTQwbUJ6KzFmME1RdTd1U2ZQNldwR20x?=
 =?utf-8?B?dzBTNUdJalpMc0NzV1IrbERBWUd3K3N4ZVBwdGZwbnBpZWhYbUtxMU1jMjM4?=
 =?utf-8?B?dHI3aFJWbkRnWWYyYXBOcHltWVltQU42MkdQeHZiVzdQRTluN003R2t4Zi9t?=
 =?utf-8?B?OTlmL2Q5bWZwVXNjTExzVGlMWUdqV1dvUWpTYnplN3dISHA0eGRVV2l3SC9m?=
 =?utf-8?B?VlAyMUk0WG10eUVsajZkbWpCM2lEdjlSdTd3Z3lWaFA0NnJFcDJrdVRZZ0NC?=
 =?utf-8?B?WDFBdmgrV2lpbnZWLzNIY0liWi9sbWJGZWxndzlPdW5QajFWNjU0ekZ0bm13?=
 =?utf-8?B?SjBXZkVWaytDeEZRa1ZHQUp4YXV1bjZnQXlRT3dVdlRPcUtIUGNmekVSUkhq?=
 =?utf-8?B?dEE2WDc2Y3dxR3VLOHN4WElWbjYwTWF6OVB2NThRcFhPNTFJVk9adHNCYllz?=
 =?utf-8?B?Z1I4czU3MXlzMmVtZTE1cVI0Y1FQV1pzTmV3RlkwcjA4cVNqZUJWWWtNSVV3?=
 =?utf-8?B?SHM3RjNnQVBWRkk3REloUlpwVU80NS9JV3FpRmYwM28zZW55UU1MMk4rdXdw?=
 =?utf-8?Q?qpoR7a7m+rPxlc9UrvK35/DM5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9bc3a4-4f78-484b-168d-08da7eca92e9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 14:29:34.1464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQ1kwzN2UOsyoAFU71+nb0ZT4aTCMP2quO3MjdD6SwEjcAe0NA3aVD2En/0aGxq9btDJB5DKTrQlFCU3SaCxsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5884

On 10.08.2022 21:29, Jason Andryuk wrote:
> acpi-cpufreq scales the aperf/mperf measurements by max_freq, but HWP
> needs to scale by base frequency.  Settings max_freq to base_freq
> "works" but the code is not obvious, and returning values to userspace
> is tricky.  Add an additonal perf_freq member which is used for scaling
> aperf/mperf measurements.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> I don't like this, but it seems the best way to re-use the common
> aperf/mperf code.  The other option would be to add wrappers that then
> do the acpi vs. hwp scaling.

I think that's okay-ish, so
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

