Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB22D4677C1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 13:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237602.412102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt89K-0002Kt-Sa; Fri, 03 Dec 2021 12:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237602.412102; Fri, 03 Dec 2021 12:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt89K-0002Ia-PW; Fri, 03 Dec 2021 12:58:50 +0000
Received: by outflank-mailman (input) for mailman id 237602;
 Fri, 03 Dec 2021 12:58:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt89I-0002IO-M4
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 12:58:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c10a5160-5438-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 13:58:47 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-hUm8MLN-Nw2ULcVYE9fr2A-1; Fri, 03 Dec 2021 13:58:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 12:58:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 12:58:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P250CA0015.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 12:58:43 +0000
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
X-Inumbo-ID: c10a5160-5438-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638536327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDwMGSsNsGyKOrQJt5yo+oTfSCvjuXNawQ3MyaW6biE=;
	b=lqEU2r6fZHm9uKX2VF4tLBhtLT23bcoNfvwTBKn9d14z+fY7w6Ys4V8BL2TZ5gHel34MH5
	V9BvNtktVVWTsSBeLJ4Jq3pSPOIaSqCGYxQjG1IUDsExP5rnXYGoqo/kxTMii2Dbau29f5
	lAEGU3/Fpex/yBCNcSnRsrOgB2FrE2Q=
X-MC-Unique: hUm8MLN-Nw2ULcVYE9fr2A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sx8S/Quxi5Zq+ozFWW1x/CY9H/VCGPSDaIAbWiyu/8mjaFcNQ+4/KXWoYmnifdoM0lTrmGJ1JPTbtqrFca9f6SqrAaDr28AdC0FGCteFa6z3JgMonYO7GySGdTa1FIkqEbfcP70k7cWe8wyYFKHj6PJraS938y45gt8+v/eGfD5WqElfCvGeLL5MGMuv6Gzdp1tg0v1bWN5TcbrVX7R69f4ckZMfCRv4Fm9jyngQQZhpcc5TiXt+ajVU23GYedMHghUjOgw+/KL/R65y0Vl6wEms5Zu3IXqUASFh+tNSP8xE/xJdDzW0B3m+kNy2hl01CdLllCp0hEyTHH5/cUlfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDwMGSsNsGyKOrQJt5yo+oTfSCvjuXNawQ3MyaW6biE=;
 b=OTg5Vckh/yApyUKJPGcGsK15FW5llQTOQX87cWIMJZeYWwrZA8JNcNN3HIiEDna429QP8ETXjIU76vb6dotB/mAwHmrnhFMK8U3mizjMDSULkw15z/1TCn8S+CIdGFxWTQeu/yO+vjGuZhqTaMk+gsIgs6x9cpbtoIYIdeyQebj764ZWZj4l0wpZ0SHmMPdzGKzp9Us8L/K9fMaarAugk9jauKmUYNENbD61eeOJ3QSYqGIAwmQu8D5Bs+Yan5+2CELMNFomc4LnPM7OYn/qjPxJgzobglHJpOzf4Ke+e9F1JKrqK7w9O17dYN2k72jIl0sr99vcFT3dpOjqtFZogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8daff8dc-52b1-3575-abc0-85d6f757eb1a@suse.com>
Date: Fri, 3 Dec 2021 13:58:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 57/65] x86/setup: Read CR4 earlier in __start_xen()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-58-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-58-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c414639d-e987-462f-feea-08d9b65ca366
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039E5D07A8AC8C7C556289AB36A9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hMjCLgW3Ieqd3Vlpt2O7SkoKlYENKk2rwHl81/PAzmzWiZrXDofHnbmMYetGSuBy371a1Lid2OuYUrxB7KkuZGuSREsvWCScmHcRjAyAh3NxXdmRQdamniXiLlopugk9uIUA5VRA03A6GiI0yAv6F6D3zgh0vuyzNjqeLs0EA9wyhk4zd0z9+KehhD/5bvXXxtkaMnirNNH/jQOpn/0aC778bHFQJTIs5p+7wAHodUg7KrZHfpSn/CZLSPlGCWJAQZyATIy4V6UGSYrmr++quNxASwldhvV+Vev1TPYD5pwsAbiEd1WMGZ/lMVifL8PUd0y8RT499H9L4LBaQSS7Zk55cCCedatpVvp2ndwMr01F2v5LqJoHsVkrfppnfrWIn6ebkGFDeQlJR0bY1eQPXo1HpDQdhfZaQmaXo2Iz8JJCFgCLiW8KKxsd8BfOtwWiUIUzTg3OxE4zvsZgOx5PDUHZrkSeALUF5fYKtALCHdgZ1ywFIcLtNxXlN4u2of/Jw/SYe5Iq2ommtCumhFsqNFqrYhE7eea+faiHgjJCDc1FJQE2l7vmueIvMLgHcmYZVsKoar5iU6emX9Wt/lhryI9BaZM3b+OPwDOhe5H+u1PvmYKnT8HpQ6hlFVbsqDxYSi1WnTS9EOsLzDdNq2QbLkoi1Sa3T8cQoSXc+BgAy1S3cdN7OKvm0igAU8cY59ewzvmivPwDpWwnAaJ3jMpn5Hi9CjsCkxxeotN4tcDhlfo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(8676002)(86362001)(31686004)(2616005)(66556008)(186003)(66476007)(16576012)(316002)(26005)(956004)(54906003)(36756003)(31696002)(38100700002)(66946007)(6486002)(5660300002)(53546011)(4326008)(508600001)(558084003)(6916009)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enA1alltYUsyZkZ5eVYyTUQ5dVB1VlhvWEJsWnZIOThPeGxhR085b0k3akcy?=
 =?utf-8?B?YW5uTmMyWlVvZDZYcXNzaGVaUlJBc2d0SWpiUE5FMm5rOThTZ1k5RHFyY3pS?=
 =?utf-8?B?SURrNmY4bVZLcFFPTlp4MG1tVG1RYnlUMnJuSGxCUUkvTUZHNDhmTW5tNUhC?=
 =?utf-8?B?OG5xaHFyTEtKMFQwMGRmWXYvcUVOaWo5cTBlaVo4QnJXU0lCK281YUhoZXRO?=
 =?utf-8?B?MThpTGFrbXM4eUVYT08rSmdyNnF5QUZzSVpqM1R4enBnMC9CTmUveEZEWWZh?=
 =?utf-8?B?OUtobSs4Y0pqVmowaWZ2NWxRS005THZPSEhRK0pLNmhkSk9IdW9PRFJVS3Mr?=
 =?utf-8?B?RVBHMnhxZEp5Tml2TGtZRCtBejBvTWFWbVNwTEQ4RkRXbnZLVHdWTHk0RFhH?=
 =?utf-8?B?Y2xrTHR5ZEwvSjFjNER5K1JjRmVSeXhSMHM4bmtuTGtMRGU1RzIyN21tZnBY?=
 =?utf-8?B?MVluNW9XYTNyeGtIRllES0Ntb2QwVGtGdHJ2azhUSGNXS2xHU04rNXhJUXJP?=
 =?utf-8?B?MnVraHVLd2t3R2ZjZHNCcitIZFhnWUhoZllpdDBUWGd1T1MxdGpXZ0NwM2Nl?=
 =?utf-8?B?UnQ1aWhJMUVhZVcreGJqb2x2L0ErY1MwNDNrTHZlR3pERUNVZlVraHR2NWJY?=
 =?utf-8?B?dUJKN1RIK1lwWGpJZnIyMEhpTXpDSlhhbnhKRGVER2ZHWmpzUmhBN0Z1MjNy?=
 =?utf-8?B?YjBwQTQ1b0VlbDk1b1FHTkdPTmw2QVRIN0plNlNWVzJsYU11dEJucXl1VDUw?=
 =?utf-8?B?OXlPMXdWZHYwRVFCOXNFNFc5QlpVUFdsZjFPajJxTW5KaEo2NVN6aGhobmVk?=
 =?utf-8?B?QWY3cUJaeFpGSUlSakwyeXl3VVVJYzFJejZRSGI4b1dhWnNpZFdBM1E5Nzl0?=
 =?utf-8?B?STJEWXBwNStnU3VHTGpXbDB1a3RDMVB6eUdQOHlwNWpQTnFrRVllZXQxTXgw?=
 =?utf-8?B?bnVibWQ2MFBHU1d6TU54QXJBQWlYZ1pjWnREdGozeEQ5UlMvKzlVQVVoV3A2?=
 =?utf-8?B?eTZxd3JmVzVWYVJieGJOdmYwOUdvM1ZZK1NudTZjZDZETUVjZVpjcDZGN3FO?=
 =?utf-8?B?ay8wQ011bW5LbHNyUVI2RzNvL0MybjRzVjB4bWpIbSs2VXZUczBVWjBYZmV2?=
 =?utf-8?B?SFIzbTl3SlZIWnc3Wlp5QTlKbnN5TlA3R2xEdXozdXdlUDlGMTBBVTJsQ0Nu?=
 =?utf-8?B?YS9VY1ZwWURnejc1dGdsOHVpemVvZmJYNGJNaCs0OThvRUNDRzNST2RmaVRL?=
 =?utf-8?B?dnFISlB3QUYyd3lSRHFtWCtaa0VuZFFmenNjb0NXb0VxODdJQndDK3hiTVBF?=
 =?utf-8?B?aGpmR3pCNmlJVFpQd0FKa0d6VU04d2hKbHZ5WEpJS240QklOVG10ZUZGeGkz?=
 =?utf-8?B?TVRIaVBQTGlYZXRXREcxUUxlcWVJNVJ3SVhXNDdUbzN1Vk1taVlzOVY2Vnhu?=
 =?utf-8?B?UGNISTdiU0xWN2pWQm1zN1JIcXFlN1BmaElhQ0JOK3pBYXJLNWNJNlFnSnRG?=
 =?utf-8?B?TVF5Si9uTHVFWW5HOGtyQy8yVTc1bDJKa01jemtrNlNkcllEclcxbXcvRlpG?=
 =?utf-8?B?OGoxYVAxYzNEbHhEeTlqd3hhZjFXRkZEeDFwT1dGV1B2OWgyQ3psdzdGUzZS?=
 =?utf-8?B?L2hpcFVwUmRxRVRrUmpjazdHWEdiUHVsa2VRc2grZzl0bHNhS3NqUjlGU09C?=
 =?utf-8?B?bUMvakhSOFdVTWNxbzNkRGhwS24xUHFMRloyUXFUVU1OTjBiZERaRHNEZDgy?=
 =?utf-8?B?MEtHT092VVhQNVd3T0lXdHI1VzNFaTYyeFloYmVBRkRSaGVQd095QnFsU1ZV?=
 =?utf-8?B?OVBoZFFKYURwVDE1ZVZyY2h4WWQ2WWdpY3JqdXArWG1hVHhpVTZkdTZiVkFO?=
 =?utf-8?B?eVhTQzJGSUZCbEJDbDkrN0U0OW1iOTRNY3loNHlmanBZZU81aHhpbXlKazla?=
 =?utf-8?B?WlJ6UUF0aThOZS9iRFBCdk95UjRYemEvOWc3dkpNTGY0eGlVQ2h0NjNQNzVl?=
 =?utf-8?B?Tk9rT09FWTIySDhNUnBBV1V6UkU3V3Q1RWh0L0VOV0JGY0xwdmJOL2ZvS3pw?=
 =?utf-8?B?S3liMnZCUTFJY3Mxb2Y2VERpakNZbkRPZHg1K240bjlRdTVsQ2lTRTZESUJh?=
 =?utf-8?B?OEhyUEZPZ1hCT3lMUmtGbjBUN09HOFRRWHI2RUFnUWZNNjF2Z1dZSTMvVFRz?=
 =?utf-8?Q?MBSbUtkIOwlu0+80j+125Zk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c414639d-e987-462f-feea-08d9b65ca366
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:58:44.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUghak0CTWpMy4xHyXuc5Oi4CoYBsIxZPzqMedTcJt0TnoXhR7IMWqLDo1eyPk98eK5PGOdv/qR9iaSS9VC8hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 26.11.2021 13:34, Andrew Cooper wrote:
> This is necessary for read_cr4() to function correctly.  Move the EFER caching
> at the same time.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


