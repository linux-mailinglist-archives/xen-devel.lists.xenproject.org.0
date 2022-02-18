Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9990E4BB475
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 09:42:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275232.471010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyq3-0000Hs-3q; Fri, 18 Feb 2022 08:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275232.471010; Fri, 18 Feb 2022 08:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyq3-0000Em-0W; Fri, 18 Feb 2022 08:42:03 +0000
Received: by outflank-mailman (input) for mailman id 275232;
 Fri, 18 Feb 2022 08:42:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v1rr=TB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKyq1-0000Ee-5V
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 08:42:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a309c796-9096-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 09:42:00 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-RbjlQSt8N5S-0RnGoYQbqw-1; Fri, 18 Feb 2022 09:41:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6086.eurprd04.prod.outlook.com (2603:10a6:20b:b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.22; Fri, 18 Feb
 2022 08:41:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 08:41:57 +0000
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
X-Inumbo-ID: a309c796-9096-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645173719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=naQPYhXYCMSrZhRPtdp7vixNsqEpmgJpGBZMysrS6Vw=;
	b=iXJeJI+pe+pgAi0txezSWTPWy5wwf4v+6wR3w+qHs2FRnHL9z/qiGplm01F3M0r8x32c2E
	mvdv/SeOT7+vYF/tcLAORZicedgjshAAmXSkiyxF2ppk32xTIglcdqxjkdUkXvtaHAwG6E
	MAx1U4IDCQOubh4kP9WZKO+jStQHAsM=
X-MC-Unique: RbjlQSt8N5S-0RnGoYQbqw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0HB6zp28XLnKTpLhRB1pyuU7tlYdQMucB05favtNbq6GnrJG+MTxMftAZ1FSPbIii9gbZWPBG5bm+lGjwUYe8RCbjYizSDLwZYl9Kltcy7Xc7fRmHvvlrGSV4apSJkoEOUQdjv2dJrFWsH6JcHSwgrT1BeaI4nJe1gJ+ewq+SyneJ2ODOspSlV0GsO3a26yBXK16zaRPP0Gvcg5ehou3WCmKnTWN8U48C0YCouaNf+rngkqIgxmtQt8KIuCN6LNClhZ42h8I1ZNkoroEpR28Gi5Ws1G/fFV+yJkcnOxIO5kCRKC8veIP5qijWPxAyLpOYC9V5i1xtfp3FRc/nGqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=naQPYhXYCMSrZhRPtdp7vixNsqEpmgJpGBZMysrS6Vw=;
 b=P8Bhy49Ui50x2FAI4IoiEazNgWJJ40wBc1J+9eyREOZXQfWrgTDNH4oBwlf+RkW92jcNvJj5no1UK9CRnP9h3SZ6lBDA9bhCTP65x9piy81oF65vzldcQQcz903ybYQdrfAWntcczHCKsCedal0rHr4hZIGdxK2gBXd1eEP81w5HKMCBA0yrW4CavGow2ZtuCthAOMhDc22bhLmYEMTBM5R0FC5+FgDBzYHB9deYjawdhIDxoc89YGkllsh89Hyl+ueCAUfQxsVfs6p6ELAFaxZ4Z4jqml5xVhaIuTCH1xubBnQnOMykwfqv2cQ0eTAhO0RsT5l6XIEzZIy4UyekTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <73cea081-5ad4-8a2c-96db-e9c45571bc12@suse.com>
Date: Fri, 18 Feb 2022 09:41:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Ping: [PATCH v2 0/3] x86/perfc: assorted adjustments
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
In-Reply-To: <ff461a77-93a0-5424-6565-2e947bec3912@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ba84994-8e28-42b8-9b11-08d9f2ba85a4
X-MS-TrafficTypeDiagnostic: AM6PR04MB6086:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6086E1CEFB0533CE3BA81860B3379@AM6PR04MB6086.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oCrPhJM9v65sk2L6pMkDxPUt2t48oIk085Ew4khXLsZ8qUL+frpswy0epHURYxjiGWp8/USSfCGlMjJ0HPfeP9cKmUHXqXz2vXr3VldGwhMyfRhHWPjjov90Ck2uXPDe6ePPkrfigGl3yI5zkKiGVlqn1bGqTHyEoOkKzq4bxHkZ3Li5uOUGnQmoXXesRBnv8ocwwQf2DYe0qigEtIKaZ6054szUVX3nDVM1TF1ztetuhNeJPvDPmQv2CWbWkU3W5pDCPWtiJUB7Lelfcn5xj8DYp+eOaURQIvRAGvNXF055SyS8c393I+YU0oqm8doJ1PWaAwvNEdMcRgJs5kJ1sc6C+iFaetWyOPI9RrHYbnlnfqRDqEOy5PZLECpboU8gxkqf86VgwxnWI2yyWDhNUhMtaRSbyLlOYz3iBdRekecHcwQVdwDmGJKMRpAXoZlIq7v0dHCH5seDQApgG1aSpreFe4IllpEZOMMVCWVujtiWrE4+oVOUM5iKepghOlXx7sDbR8Hgrcyp91FL+2qEMrHd/yyNTthVf1cug5ZjQNnVKaExCKQwKxxHCTqsAKkYMfze0EB7l9T0PB0/hj6Tys8oLbbrQk7brhSjvSB9584bDP+0GjCYab6WVDJ0Tdd0shwYlY5Q97IMEOrYfy2gRMpuCiZqhOs8WFtJ4qMDDqPtHF1PAnaK6Yo54sK+JtbFFlJwZloyIk/2yDfAB/EgnE3Y9S1Fx0dI5nRfzaLP2XgRkG0SIQTEoeJMqdlmjvSt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(2616005)(8936002)(38100700002)(66946007)(83380400001)(2906002)(8676002)(4326008)(26005)(66556008)(186003)(31696002)(31686004)(86362001)(6506007)(53546011)(66476007)(316002)(508600001)(36756003)(54906003)(110136005)(6486002)(4744005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU1NdHpGNGp6U1NKbHFVS1NYMkdjcTF1eXJwQXdPdkpsWUlIWG5yTSt0dXV4?=
 =?utf-8?B?dWtjQ2VYTzV0WXhyTGJVNnVQcldTVE1rc2EyRTRQMy9yY09FNndPc0Uvd3VE?=
 =?utf-8?B?OW1kd1N0T0txV25GSnJhY3hVa0swR25yNlc2K3dKNDN6UVVuWDVpcVA0QnJm?=
 =?utf-8?B?M2RNNW1BTXI1MVlydWluZUVINHB2d1BDeFgwa0dKVDR3NnAxRUtUcncxdlVa?=
 =?utf-8?B?WkliY1owNmpKQ1lqS1dZblNGUGVUWFM5SW5BZ3I1WVd4M0lGQ0dsVzFkaUlr?=
 =?utf-8?B?SWxiZXZoQXRIZWY2RlhIc2YyM3QvZzhCbFExQXhIRFpHclJHcHhiclR5OVd2?=
 =?utf-8?B?a3o2YkZqNTJjS2tuY2xQY3o3ZFh2RnQrdm5iZVlWTUYrQi9ubGh4SUEzakVz?=
 =?utf-8?B?TDZhWUpJTjJOeEpsL2VhSDNFcDZ5Skg2c0lyOWNabWRseEJzaWVLSXNWU1Ft?=
 =?utf-8?B?WnNZVDdkU3ZQNHRNSDdiUS9qMmVzNVlGMENJV0ZIdk8xNmxIM3pQY05VMUUv?=
 =?utf-8?B?TG9Ec1lJa2FXc1lvdFA1Yld5MHJBWGRrWDdNWnB1NENkaVdCSnNFc0ExZVpX?=
 =?utf-8?B?SG15K2M4dUpqVGZmNUEveHc1OXVFSWVrbGJRUHc5L0Fhb0IybGRVcmVpZVdj?=
 =?utf-8?B?TUxHSWwwTUQwMERNV1hXZG5qRm42TTRwUytBV3d6UVROcWczVXl6djZsNlEx?=
 =?utf-8?B?bzdTVnVnY3A3Mk0ya2tiK3MvamVtMEdHekVIY1BMZmV2eXpVdEw0dG9nODRh?=
 =?utf-8?B?K0E3N2QveExPTHlFQXBzcWdhcFo1cHFvQ3JaM3pyRVl0YTMrRWZmSndvTjdy?=
 =?utf-8?B?NVlaQzBieE5ZSmRYeW1SRmVUbGtiK1paSlFXUlM2TVNYSEU4RHJYN010R0lZ?=
 =?utf-8?B?K00zSWpQdXZKNlhaMFRIVXllSkNPeEFwOUh0ZkVrQTZ6Q0dtOU1qMlB6WTgy?=
 =?utf-8?B?Q1lMSlRVVlZ5ZnR2Y1FRck9TeHhqYXFtaTVwOGY4VG8xOW93ZnYwZzZHZHJP?=
 =?utf-8?B?dnRya2VWVTQ1Qzc5SXZNdDZiZFRxWThxTzBGWlc2RlNSTzEwN0NEeUhBdVJw?=
 =?utf-8?B?U1pzT3RuOXpYNHhENWJlNHNaaWtnUE9UMUhFYk1hTFFUNVM0WmQ3VUhJTlNj?=
 =?utf-8?B?V0VmcWJtV1BXZjVMb1luK3E3dGdGRWJ5NklzVHJtdzZ6dTlwZE5WYVd5bDNQ?=
 =?utf-8?B?MFd1L3BxWWNpdmxDMFpMMVI0M054ekUvTmRkL3J4c3lVamh2MHlncFk0UkpY?=
 =?utf-8?B?Rjljd05Xb0ZQSXhxM0w5ZnNlc010M2ZHcE1RdUVFb1VHZTBYMG4zbVFBbWgy?=
 =?utf-8?B?YSs1VjVXMllFZkphZzEwbzhUS1FSN0JjM3hablRzeW1Ia2UxakptOGJNNWlU?=
 =?utf-8?B?NGpDUnhPUVFkMjg4K0NrVXpkNHZuSUcwTGVDd3orWll6VUFRbjRldFZBYnZW?=
 =?utf-8?B?MTU2cG1rWU1nMllLSUxESE5SSnRNWjZHVDNiUW94WjBYa2tNNG9LZnVmNE5X?=
 =?utf-8?B?VWVoRG10MVJoUzVZS2pjcUZGZzZCd08vZGlOTDZ2SmlUdUlkQ2RqVFBaU0JG?=
 =?utf-8?B?dEJiRXpQR01FdUdwTDlUV1JSQ1p0NmFhTytoREloZENkbzNDeGI4eU5oUGM1?=
 =?utf-8?B?MGU2RkpsSEx6Sm1PMkE0TS9ncmhnMWI3TkhSZytoMmh0bytrM0Zybk1LaXVj?=
 =?utf-8?B?bGh1ZFR3Q3VMR3E5VHBqM1pwSHFWelNSdS9Yd1QxRHlJZEwxSVVHNzNUT0s2?=
 =?utf-8?B?WFZvMVlBbFkrWVhnODZHZnprTlY3djRJWXFLNUtTdnU0RGpMTTY3azNIOW5L?=
 =?utf-8?B?cS9ZSThjcUNFeU9hVWRxSGNIaVM3dit1NndaVkJLK1ZpbVlPR3ZxRURqamV2?=
 =?utf-8?B?ZjB1RVljcDgwVjZHaktrZTVra01lQkx4OHkrd1V4N1p0UVZwVHZ0Sjhzd3kr?=
 =?utf-8?B?SllEQk9YdzJMcUw3U3I3QVNyYjEzYjA5cUppOEZMWTNIWDFNSk4yYmZnL1pp?=
 =?utf-8?B?RFJxRnlZVU43dVRWejlIY0N1ZU5sWDJBUEFPL3FQQkloemppdkRLY2IyWHp5?=
 =?utf-8?B?N3JHejg1bHVqSEk4bUZLcTJ6blZmZTZRSFp3TFJ1K1BZdzYwMUU3a3FRemlF?=
 =?utf-8?B?VklnbFJJYmxuVm1EQmI4VHI3VFhuV3JWeHJqMUN5OUNoQzJIYklXajFSVU5Q?=
 =?utf-8?Q?az89UkejbqYWR2aown38tvs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba84994-8e28-42b8-9b11-08d9f2ba85a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 08:41:57.1819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6VBUmKgyINhVeM6EUVoHhiEXk9jJgkmAc1WeqB+p1lUOn6Em2WN375LtQHZru0YcVPsCZ/NwQl7H5H/tdvMjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6086

On 05.01.2022 14:56, Jan Beulich wrote:
> Addressing some observations made while reviewing other patches.
> 
> 1: VMX: sync VM-exit perf counters with known VM-exit reasons
> 2: SVM: sync VM-exit perf counters with known VM-exit reasons
> 3: x86/perfc: fold HVM's VM-exit counter arrays

Patch 1 has gone in a little while ago. Would be nice for the other
two to also be acked, or for adjustment requests to be voiced.

Thanks, Jan


