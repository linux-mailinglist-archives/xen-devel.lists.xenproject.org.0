Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8448249DC26
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261271.452172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzkB-00015r-Qk; Thu, 27 Jan 2022 08:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261271.452172; Thu, 27 Jan 2022 08:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzkB-00013y-Mq; Thu, 27 Jan 2022 08:02:59 +0000
Received: by outflank-mailman (input) for mailman id 261271;
 Thu, 27 Jan 2022 08:02:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCzkA-00013s-02
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:02:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 898b2a06-7f47-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 09:02:57 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2058.outbound.protection.outlook.com [104.47.1.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-cTbLLlDtPzKTabDBf-x45w-1; Thu, 27 Jan 2022 09:02:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4828.eurprd04.prod.outlook.com (2603:10a6:10:23::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:02:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 08:02:54 +0000
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
X-Inumbo-ID: 898b2a06-7f47-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643270576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKBc0hp/O/gCiopinaeq1+Ljj7nAvrdrFtuGvr5/vlw=;
	b=hxet2lgj+m0KtXiiqI6Kc5+rq9sSyIEOqLVpuetowt1N9VP6+QoZzSnyboKlTdgxC4YGo+
	WQi9SMoxsBEq6F+Qu/XypLFKMj91mJGJAwSYqK/MZywlBHLY+FDuU0nODMwzXUO1UEAzar
	lWZCujr/uf3Gzh/u0T84xw60IA9A+HM=
X-MC-Unique: cTbLLlDtPzKTabDBf-x45w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qy1NM/B3XXJmAyLu1uNbKGvCTnSq5LTeXlnIL78hjAi1hHoNa6i4cgNCGrkBHvqo67Qwaa6dBnKndSgZtbbBRUBI1KB1q1yh+vR+c8rcciHeFzrjbTEJl+GObuShMHFPF3GTRcJu7yNbmUVy3UqLRSk7+d3Iaq8Gzmd09r2FtIzDUEoaAV29VpYrDQdVmBCg3LjWksSbtWo/2qp78ZjAHNWYUqy/PWZIk6vPzsPOcqk6RZ9je17K6IP2B1YzZCWyiQzcirozSXjyRZSQB8i+VzzXu20M3zIYjDThO0OtbcuWTQ0TebMRo7UfoAr5tvieAVWgX9F02zxoGpbS80SkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKBc0hp/O/gCiopinaeq1+Ljj7nAvrdrFtuGvr5/vlw=;
 b=c+gCeowK5RmVLT4tRc55Zs2A2+IpVNgGSE3m+pwng8IGZn8u/1pinm23RkJjtbaEyonhrDsEjLvXWoZMgRmG3cvERfPPSQoMFxQbjcpbKgnoJmM9+8JFx9/NjXw0eUOoNuNiTRfHY8YQcWyedFOy/Yko94piAHZpc1SCsNqgvpr3kYMXlNH3LsBUtkPel4HKElryN8qEb61UhIYX3DRRsbros5X6bQokJfF2BxY+ABKmT+Dso74zmnnsq7FKRzcFeSF//MPskxu9j8M952ZkyLtDJ1tfxeBEm3A04jXxIxrxH5Wr/2N9AGr5OneZY9qSb7OEKUYohIac+F8i1pZeQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fef7e175-ea16-b2e7-37d2-67594e98b1b8@suse.com>
Date: Thu, 27 Jan 2022 09:02:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] public: add XEN_RING_NR_UNCONSUMED_*() macros to
 ring.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220127063004.7937-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220127063004.7937-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0052.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a84f3235-0b11-424f-b5a2-08d9e16b6c1d
X-MS-TrafficTypeDiagnostic: DB7PR04MB4828:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB482823CC61080CDE9AB5020FB3219@DB7PR04MB4828.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Voq9C9lPnuGhEVHYd1JFnRgLjs0U5nw2lGyBE2r7eIOQv32u1CbYj0Q4D6LX2A9+mCQzqHb41HTDQQSHyMjopyNxND/4tjsapb0TxVnYZs92jbqdNGxcfr2pSWQKOYJmIYvEi8WkGTfQkRQ575gpXnj8d+hao/Tjoku2YiTJLKIaQ8jdqQfpz/ehvdNbSMDfTzaDSefYwSTwSFN9XQoSE00VBaI+AHVsjVdK4sTZXGUb6TMvj+jzho+XJdwxzqk48srHiacRLIsNNzjVyk5qZU+NEc9DOxLmPjkMBZ9HVQM75PBOEVppwd+JDzx/y+nZ5SBdWtmdH0i9Kea8v/h0nGFJyz/wjUnkGgnEIyu5hWrGs9c6XQf/q9tkSk9hjyI1CZ/5h96e1V/xypMdSWFFbEFSNtQ5YGvBDhaWFv3HL2VsEMrCXRldBuxJEufXDmwompweIIOSCqO2n7MqBTQ1xtuI4pnbc9G/tLFaMWXEd18m9bpidcuNZn5OOsnxg2VcO6Ifr8n5kpUIPo+eDuebyFN2bCgCU5iA8TxNlmo5flcONYHmXvq0ww8+pr0bX9VVJlcz8IDYSqySfYPpVEgOnyz47SYMTO3EUr3dsXR0cYYVNHkiTHY6aIbbGod6LiQXsneNXhTuox/bsL5JvVjqFZXbBl9/HOM1r+H/NpxfBHvmDS43RCiKFRMFC7dsEpCAY8kCJl822u4sbN5+3Dsi6/inMRn1YXfvFk3tlhXsqN0zFJdHSl2vbjVhCCU2X+DY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(186003)(26005)(316002)(6506007)(4326008)(8676002)(2906002)(8936002)(66476007)(66946007)(2616005)(6862004)(66556008)(83380400001)(38100700002)(6486002)(31686004)(5660300002)(6636002)(6512007)(37006003)(54906003)(86362001)(508600001)(31696002)(36756003)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1A3UFZ0NFB4aG5DRmpYditMbzh3Q1NDcEcwSWhuL2tucDAraUFxL3cwbmtz?=
 =?utf-8?B?dk9vZmEyMU9aMnJiYjdPMTRqVmQ5ZEdnaUFvQU9udDdHNTduM3YvUmhBQk1i?=
 =?utf-8?B?Y1lZQ3Njb2FnTW5hUm5FVnVDYm1vcUM2U1RhczRFWS9uRXVQTGFvMFdWS3R0?=
 =?utf-8?B?ME9UTDBBdjJNb1JXazc1bko2Rk9sYjNpVzc0UFVGdURRVGxJU0FqUlZ1b2Zt?=
 =?utf-8?B?WGxSRVhwWG0zanhQRDBpRnVTc0x1Z2FGU1A3QnE3Z2R5eFk3TEdXTkI0NXZi?=
 =?utf-8?B?cWlPbDlYSG5NbC96bkxTUG9lbTRqZ3pHejlqSlRORzZ5UUdCOG1ybGNwM1N1?=
 =?utf-8?B?WEQxVDFuemo4YjBEdFJRZGg3ZUpKMjBmcFQ0UnhLQko2aHl0cWdMTzl6NGxu?=
 =?utf-8?B?RVJEdkxTWER3MUxCS0xjbURqUWUxVVV3SW1qQkJHbVhvaDdYR3p2bXJYcUM1?=
 =?utf-8?B?UjZRZktaanYxdmZhbDhiSWMydzJQTnhKYXd3Um5XZ2tPcTErSFk1ZTFSVmRw?=
 =?utf-8?B?MWhMdElwSVdzMWxmMnRLczd5QnNUNU95NFZ6R1lmaDFoTklua25nR2pxT1Z4?=
 =?utf-8?B?UXVtZmxXTEVlUkxmbVp3dGFXWlMxUnc4MDdBZUd0b2EzTDl1NG1Fb0trbzVv?=
 =?utf-8?B?dy9KNi9ZTUk5a21BTE1mRE1yeXB2M3o1emNsSmZWemkrTVg0QmpTUy9FbGZB?=
 =?utf-8?B?L0UwRGgwWEdHODZzN25FN0lDUytFNjJtV0h5Z3Y0NzVCNEVCd1N6U1AraHRO?=
 =?utf-8?B?djZoU2FtaENNSkJKbURjODMwYmVuVWFUWjRGL21WUERZUlhuYVRlek1mSW41?=
 =?utf-8?B?UU5VbjZ1Q1dGWkdXbzBIdXc1R1NrR3pKTzRwWE9xMWkwYkhpNFpkZEp4bkxt?=
 =?utf-8?B?aDdaMXlwdWthN3Y5c0FvTDlVSVhUazNBbnlqU21SN0ZrZE1DSStxRVRIemZs?=
 =?utf-8?B?dHpQVC96QjJ5WXB1cXcwUlJLSStxWTBVR3p6cXAvZUFmQkVaSzJicFVUdXgw?=
 =?utf-8?B?Z3puM3A5SVJkK1NLNGlLM1o4Qm5vbnN0cU8zVi9PbXFVSFR1Z2VCMGt1NXp0?=
 =?utf-8?B?OUhUdlhmWnpFQWJUeXFsYUMrMUdJU3AxOGlhMHdxYy9jNHhDNmxZcE5EemRS?=
 =?utf-8?B?ZlFCRHh4bVBSVTBrUFA5UjNPUWhpR09nOGtFQmpyZUZZWEk1Rzl2YWxIZTc3?=
 =?utf-8?B?U21sTW9aa0c0VTJlSzdocUIwSTh6QldHVnBUNFJFaVNsRkdFZUhvNGdGa3RM?=
 =?utf-8?B?SjFCTUtlRmYzUlRnL1BsTFBPL2pGQmNVSUlVZXlrRzA1bHpETENFWmJGdVJP?=
 =?utf-8?B?eEdpVm51ZzR4NHJ2NEZGQ3Q4Y1MxREFsc0Z0dk5tdEQ4MWJqNmplN1NrMXBs?=
 =?utf-8?B?RFh2dTNtNlYxOUxidG5KbWRUV1d0enpHVm9kUTc4ZHRwYWN3VlJ6bzRJR2gv?=
 =?utf-8?B?TkhlTDQ5bjI5a2FPTjFwbkQ3aEFtK0pOUEN5MFdhMjY2TGZ2K3NaZWxSRmZW?=
 =?utf-8?B?TjhOOThiQlpra2kxUG9jSmhQaVlCV3FlejNseDM0eHAyYjk4SGxwN3dSdSs3?=
 =?utf-8?B?WUFWWHZqVW5oeHl1UjZLanlNNThzMDRSNTFhRnpzYjU4V0dCN3NPZS9LeWpB?=
 =?utf-8?B?NFVvNHI1VzBZNUJEWnNrVDJ5Q0M3TkNPSDMySCtydEp2eUMzaWdYRVMyQ09O?=
 =?utf-8?B?NmQ0eG1XL2Zoa0tuYkhtRkxJME1pWXA5bWJHUXRrTk5sWGxaL2pacFZxLzRO?=
 =?utf-8?B?cGd3aFB4a1cxa3doaCtNRFZsaTRHbnhXRHlQWEhELzRySC9saGt6MHRpWGor?=
 =?utf-8?B?YzJTc2wwNkpweXZvR1o1eFQ2bFFEVXg4Y0JpazZJZ2p3S0p5bGdWL1ZxZWNV?=
 =?utf-8?B?bCtSNzhuTkRXamFYUStXNkN3QXBMNlAyb1NPQTJTNWVpamNTaEtvSTMraHdh?=
 =?utf-8?B?T3JOZlhrRTd5U2p4eHJCeExRS2RleXR5SXZpZDU3dHAyYmpDbmE3NnQrbzJF?=
 =?utf-8?B?Wk1RY1RML1BITFEzNVhzMnMxekdNMkNhb1poZWRxQURLTGd1S1djMGtobFpI?=
 =?utf-8?B?SW9uZ3RlN0tJZHhJbE9teE1tWkxqSVRzdFgyR0t3NUZ3UC9SYVZ3M1NFNURX?=
 =?utf-8?B?Y29XQmNFWk51MUdkYlJHNzRHTmR1ZXNMbmMwa2ZpUHdhSmRPU1JDL0N5RXEr?=
 =?utf-8?Q?pUcxnzsWbSF9T+gJ6bJZWi0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84f3235-0b11-424f-b5a2-08d9e16b6c1d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:02:54.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iw1eVoynWVX5iCM7jdWamH5LgaBs2SCyMcwBPp2TMLu1stcNo/reyiSR9KZqXN6FJybuImXpWD88YgwBXEisA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4828

On 27.01.2022 07:30, Juergen Gross wrote:
> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
> unconsumed requests or responses instead of a boolean as the name of
> the macros would imply.
> 
> As this "feature" is already being used, rename the macros to
> XEN_RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
> by using the new XEN_RING_NR_UNCONSUMED_*() macros. In order to avoid
> future misuse let RING_HAS_UNCONSUMED_*() optionally really return a
> boolean (can be activated by defining XEN_RING_HAS_UNCONSUMED_IS_BOOL).
> 
> Note that the known misuses need to be switched to the new
> XEN_RING_NR_UNCONSUMED_*() macros when using the RING_HAS_UNCONSUMED_*()
> variants returning a boolean value.
> 
> Cc: Roger Pau Monne <roger.pau@citrix.com>
> Cc: Manuel Bouyer <bouyer@antioche.eu.org>
> Cc: Simon Kuenzer <simon.kuenzer@neclab.eu>
> Cc: Paul Durrant <paul@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


