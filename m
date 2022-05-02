Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D81516AC0
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 08:09:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318619.538450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlPE1-0000tv-H8; Mon, 02 May 2022 06:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318619.538450; Mon, 02 May 2022 06:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlPE1-0000s8-CM; Mon, 02 May 2022 06:08:01 +0000
Received: by outflank-mailman (input) for mailman id 318619;
 Mon, 02 May 2022 06:08:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlPE0-0000s2-3c
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 06:08:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 369bae7b-c9de-11ec-a405-831a346695d4;
 Mon, 02 May 2022 08:07:58 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-DNr0AprUOCibTbRQaWCGWQ-1; Mon, 02 May 2022 08:07:56 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB7PR04MB4395.eurprd04.prod.outlook.com (2603:10a6:5:34::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Mon, 2 May
 2022 06:07:53 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 06:07:53 +0000
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
X-Inumbo-ID: 369bae7b-c9de-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651471677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29oexf/4m45wjLX7A00JPx9MYlSaonvAEc1YIIAQ98o=;
	b=EThdSTLZvjV2XqIi1tKZbhcCMxkp5G4bb0FXMbYPOB0LW7zR5KNJ3MEy/hRLBMoII5otcJ
	a2qvQGc/+TJEwELun954VEgastlkDno79MdsBl/vNppKJi4m8outNNF0MN5v7lVoUnulaC
	vx1M65uo8s6x+pje0RZrL5UW589cGEk=
X-MC-Unique: DNr0AprUOCibTbRQaWCGWQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX4sfJ6t6jbQ2zReHi+4FNDWSEciRXDhLoywMe2bnUVctFWrx7GrJ8Y9Z7n2RAIlfk0sbnYa68k0kjfGjUWC0AoXZkjf7MlIwcY8J6in+ODLKRPyWgtrMkoM2XHE8S69+DqAWFJAL4DGwj/iCspVPp/y+9T+EGLYqAvUqGdz5+V8/sKH8QFdDAW6Atb3XItRDTjVrCgS5V24zhsWoJ8AtPjec5GW0UTJ5oAyu2umdSfYdAfkU/SA2lQWq6Hg1eGgPvZPPKnoAjm343fzeb2/L5f5TBIOuuRo79TheZDZdrtLPdRZWK4HUnKXzM1tz9DRpMtSX8f0x/GnQt3ecVdtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29oexf/4m45wjLX7A00JPx9MYlSaonvAEc1YIIAQ98o=;
 b=HnEFJ//Kw4dhvWW3ZWCyUUZQW1zLzNyaFJ60Vq8VjuJhjPw/wvUotR1VGO9Tnnh7Lhpd4k78V6R5tBKJPL3aHaR2QvjWg0GO1NsPtZSMhkwxbfu5rSBc2s1wAM+6WBJm38E+7jv2U+IiYganlGyfZ74iv6OmyBnYDIYsrDlPajjYjNM3lb/1+jitauUkCRqqhRqjl5QwVTGTAmtOBQolb/XM25KOtsznuHwrn9dBIZ4QQblYi7tYu62PWNgDI493B5DsBXSHcl2+kW+AI04N3bk/dagMmAbazsqvw+HA3/vuNPnv+Jn7hIT1K87N/EaSZRAu73boX8kpw669YprCBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1aa8cc2d-2c7b-1265-296c-c8387e505c54@suse.com>
Date: Mon, 2 May 2022 08:07:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "ohering@suse.de" <ohering@suse.de>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
 <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
 <35599105-b441-96cf-7537-ccf9dfac0934@suse.com>
 <fd07c28fad352a476544258f2ac4d652062b2701.camel@suse.com>
 <85c55676-b21f-1eb4-0471-19ca9b6de39f@suse.com>
 <a8ce120ee64165ac7b08de90e6786bb871541af3.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a8ce120ee64165ac7b08de90e6786bb871541af3.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR08CA0006.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a738ebe-c802-4d5d-854b-08da2c0217d4
X-MS-TrafficTypeDiagnostic: DB7PR04MB4395:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB43953414784D190496534AC2B3C19@DB7PR04MB4395.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MbX1bKbTu/hwscDttcoT7wRWO9Mr8c3zVuvgHMXf8CzhqsyQLVCMbkyo0hedi0TVm/f1TgawxvQX6pvYGCEaFNQHwzq739fQHe20PC2tf2Ufs3O8Smzk7cWHaIAYdHZDvbEBLQo2GaT4yMIYAfriGNqGmitVhjcySZSouGSTBjHbrfaBs2TByZjcXttDnRXa1v6EJWrMQIPD1/lCvo3XnSQXMCdou2VVdSc7GMHUqBzYdmUAggtsnTcQ2ip2tIxS8cupDYILYmZ2zZW8Wyn5RcjYoCejCFb22Ze0rZLa+TzGvpHefkbQxdUK+NeHS1AarpGCWxUzL2ENvV4mTur+B7NFM9UiSW9Km+8huKu2XMDzvG+5LeUuTQ0TlxPOmCM40NJohMgaOKmPd6DZyi5SchmkUeTNVmlf5x8ReXTVsOWTh2XRPWNy2RjglttNb4MSJzdRaJ1sxhn6XQ6fX3OEzyo0JaRxI4xCfVaLGu/y8uhdsK3+dweRAIZxmpVif7ybY+godNuw0mM8M30ZVEEWKoiny/vhqj+UKqE2O3QGzUwJbZ/qc6OwgZuaoHxpbPwl4NG784RcBPuspM9wXu5y/6qIR6RUFlEdOrnnh+QgLXuVWnfNhVh4lxgfdCBaK81FGQ290AkIoDyEUq2QARchOdFLFT8etFQHebPDyqvKcFkK7UJhz8wWdRY9LxJTbBuKRHN5T1WppZfJpZfP0L+BrVFrVaMH7Tb/caqm+BVj52g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(186003)(36756003)(6862004)(4326008)(53546011)(37006003)(316002)(54906003)(2616005)(31696002)(6636002)(66476007)(86362001)(8676002)(66556008)(66946007)(508600001)(2906002)(6486002)(4744005)(26005)(38100700002)(8936002)(31686004)(6506007)(6512007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkxBMXNHZ2RuY0t2blNuTUk4b3NMN3U1SXJHQjlqZE1vc3ozSXFxdnJRbDhN?=
 =?utf-8?B?WnpPdWUxZ0J0K2lENTNJYWV6UTFJbVBGbGF2ak9xODJDN0p6VThjNGs0OW1S?=
 =?utf-8?B?SCt6QkxiaThmbDB3NUhSQjVEZzJuRStNVWlsQkZRTHZ3cUFXN2haRFZuejdY?=
 =?utf-8?B?Q0RhUFJVM2x1cmxMM1ZrRjFFaGVZTlZ2MFkwK3YwZzJHOFRQRHhHZXF3dmZv?=
 =?utf-8?B?cVRuSnRBV0cyZ3UvTFJWM01Sa0lBUS9DMklhc29KNzFRSGZFNG1FNUFvcmtW?=
 =?utf-8?B?Q1VCbEJ3M1FHRUFyWHpaWWxoczZINDY5SVpCbWlhaGdtK1dpNWhOWmRlbmht?=
 =?utf-8?B?SDh5VTRuRWIzK3daWmdRUEtZRzF4U2IzN1FTQ1RTVGc2WE9uanU2cEUwOFQz?=
 =?utf-8?B?Sm5QZFp5cDYxR0NpeG8zWHg4MndCUFlFdUNtVUIyOTZnVUU3WDY0aHFqeGhs?=
 =?utf-8?B?c3JjOFJCK3o4Tk5ZRVZEVWRqMTNld2Z0TlJNTUhuNzBLcGZmbFFkYTJwR1dy?=
 =?utf-8?B?R2VlZ1VUN1FQbi8rSzA2bzFXVmF5T2lvV2l3L3diNDQyNnBMblAyV0tINGFr?=
 =?utf-8?B?TkZtMjlqODNXcXFnaExrcXQvSFdZdHNOUUo4QXlmNUNYR2E0V3hhZGlLR3Na?=
 =?utf-8?B?UVZ4UnZrUVFxVWdzdEJQLzZRVVpxckEvTTBQQk5iTUxxM3FLdXBuZ2prd0M2?=
 =?utf-8?B?RElIZXBoS0daK3ROWmdUYk92OHlITjJZMVFaRzdlUGIwTThNdTdZUzFzMXlw?=
 =?utf-8?B?V0NEVzR3eWJ3SEpNaS9rOXhVMm9QcktDSk12N2RTOWQvYVlVWkVuTE1ZVmNi?=
 =?utf-8?B?elFBaGtuTlE0dFp5VUJHYW1uWDdHYzh1a2lUallZVXRSL0N3VjREV0FOZlZs?=
 =?utf-8?B?RlhhZVRjV1Y1UFNFYlN5b1h1aFU4OWR5RUVjU3ZVVlorT0JQQk04L0tORGVH?=
 =?utf-8?B?N2d0Kzl4QkZla0ZWcVI4N3lwSFA1Q0F6a0NDWVZ3Z25sNExlcWZjN1IyRTJ6?=
 =?utf-8?B?UWRBUS8xVDlFL0JncmtJSFdyM3lQR1VTQWJTYXY2dWlMTzRYTHB4Y2UwZE9j?=
 =?utf-8?B?LzRKM1kyVjZ0ZHoyZU01WlNFMFhRSld3bXBjaVduQ0owZTZMdG9rSDNieTl6?=
 =?utf-8?B?K1hHeStSN1QvYXlKMm5CUWlJdUNFOHpLTC9UTFJubDZQV1BFdTA2MG11djMv?=
 =?utf-8?B?aE1uY0w4WThMN1lQZEI1bEl6UmozclNJYW9xd0FpNmlybTZTUG9WSVVKYUNq?=
 =?utf-8?B?NVFTSUh6Zk1LUUF3dVV5bE5WdlJXZG9rakFYdi8xblA5VGw0L3ZBdERjTlBY?=
 =?utf-8?B?UTdiMFJkTkVWcGRKaE4vL0NTYytBcytmdmw0UjVuTnNIU3Vlck5NTkJMdmFT?=
 =?utf-8?B?bjV2dFZLTVVzUVhMRVhxbSthNHRFZVJtL3pkQmNpdkdoQlpVc2xrTDBteDRJ?=
 =?utf-8?B?TnhPTHBVYzViL25vRFBsTUFDZkd5R1hpODFoRWJnaDdKem5vN3NyejMxOTFu?=
 =?utf-8?B?Si9kd29KcFJnZ244cEhMZkYzVHhabXFYSXI1Q2pJRmtZOUh4TGlkRVR3MVBQ?=
 =?utf-8?B?aVQ4eTNCN1VWS2RnU2JNWDRsMFVZU0c0RXR0S1RRNTY5Y2d3ODhLWTNwcWhF?=
 =?utf-8?B?R2lCd1dHanJuZ3Jod2xBMDFSN3NuelhUeDVPQTMxdWtIRDZBakRkS082OTc2?=
 =?utf-8?B?ZzgzbFRhcGhGcm90b00vYzNocU1iSHZqN0xDdUtRUlZXTDlEMmZTTURnZFA5?=
 =?utf-8?B?Y0dSamRIS1J5UFYwVnRHcE83eVl5OFFGMUJxYUZLeWNTN0pXazR4VDZhQk5V?=
 =?utf-8?B?Q01zb2pLQTl5aXFrNHNhSmxGdCtpUWJybFp5ZmRhUHVLOUJWRGlrUXZHanhX?=
 =?utf-8?B?ck9sK3AyTWpqSGF3L1JSRlJyRVdqMUVab2kwQ3J1RjlybHl5VDc3N3ZVS2l2?=
 =?utf-8?B?bXMwMGpKbEJ4ZVJDbGlONGFzbEl5S25zcU8zRHlpa3dmNzA1dGRiMXE3a1o2?=
 =?utf-8?B?MjVBNkgrNXhVWHpTUnBvcWxPRzRvalNEVklPQU9WMkFqUkJQTElYZWVQZ2li?=
 =?utf-8?B?WURGTTBIRTMreld6OHB2d0JxTmM2WDl6Z1hSemtxcWp6WVFqWlM3V0tnQjFM?=
 =?utf-8?B?a0c0Y2hQeW00Sk1XWHlxajczSndTbUVCSjdkTW04bzY2Q25uTDlNVlM5K005?=
 =?utf-8?B?WWZPS3FKY3F2UmwyY2tieVNWMU1CVnQzR0hPaGJoZU1jb01qTnlEUkNTN2R4?=
 =?utf-8?B?d3VIY2JXMHJEUkNPdHBLK1FEOUw1S08wNTAvT0QzOW1ReEI3dmxERWJ2Sitp?=
 =?utf-8?B?UEdOSzFRQWNuMTNqLzY3TncvMzd1WWFSc3QvQ2RwQ2UxdGNUVnJKdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a738ebe-c802-4d5d-854b-08da2c0217d4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 06:07:52.8945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLJt+B6GNjJl+3K2d7n/q62a0Mt4rYz9V3pqQSFEXPAjIRAmeXYHIeA5KZfpqMCbLAHtmyHtbhNyvXasKstUPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4395

On 29.04.2022 16:09, Dario Faggioli wrote:
> Do you think some of this exchange we had should end somewhere
> (comments? changelogs?), to make it clearer to both future us and new
> contributors why things are done this way?

It might be helpful, but beyond parts immediately relevant for the
patch here (where in can go in the commit message) I'm not sure
where to best put it. Of course if you'd be willing to make a patch
just to add/extend a (few) comment(s) ...

Jan


