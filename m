Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382DA3B5D16
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 13:20:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147791.272782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpJJ-0007gY-5r; Mon, 28 Jun 2021 11:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147791.272782; Mon, 28 Jun 2021 11:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpJJ-0007eR-2V; Mon, 28 Jun 2021 11:20:17 +0000
Received: by outflank-mailman (input) for mailman id 147791;
 Mon, 28 Jun 2021 11:20:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxpJH-0007eL-6Q
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 11:20:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a5bb0ed-e08c-41ee-acc1-ac486eb10220;
 Mon, 28 Jun 2021 11:20:14 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-3_uySbk-OuaSXxdwmbJyGQ-2;
 Mon, 28 Jun 2021 13:20:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3119.eurprd04.prod.outlook.com (2603:10a6:802:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.22; Mon, 28 Jun
 2021 11:20:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 11:20:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 11:20:07 +0000
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
X-Inumbo-ID: 9a5bb0ed-e08c-41ee-acc1-ac486eb10220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624879213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycMBJMYx+bo33iul5PhArutVOlVjHEdt6VKnSuDkl/Q=;
	b=W4u+YljTJBvIcCSgH6mOd4BlP5lyy5jjUGcOfJaslTBKOVtVDFuU7Z3AaBcShNIEzXdIUp
	6Vs3QJ0mqgQ225UMFKT2FyzHEyTabtrvHAoeyjc3BgxRywTeIztgUK8ZJinOaVEgcau84Q
	8JHum1HE/kC7ruYGM/jNQaON8O+UIu8=
X-MC-Unique: 3_uySbk-OuaSXxdwmbJyGQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7OZkDApT+9k+16nByHbEvPy6jAvh7ZJjR2FzwbBENjhG5hQucH+0mK0VVtlS/AI8KQZEvwMP8Ch9fT5xKqWBt+WFJRlgzqVnds/8OpG8Bx/2/j5vSC0/oogejIaGGQtM5qZYN6jKFnZnBr29PEkVPPDb/2iu4toomYYD2e7cyWmDjo363ZvIsT7QMRppg4esdbjhArfvvDzi5282w2CsRKrQCrMueony1DalQsAI8PsDLeXo+TetCjQMV8rReDMRtVl325FnrNBftYNQUKUNptkKP3fgc2wCebz5nB6UWtLAmr9YcpFdQNpjkSKNontLZ27GH2o1/pxxL/acW0+dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycMBJMYx+bo33iul5PhArutVOlVjHEdt6VKnSuDkl/Q=;
 b=Vrmy6jbi1wJe1EB6cBfjlro30mmZzehttaG7LE6gfsnUxYF1BgldgJYmdqM1IOEugAD2mgU99rLzmlhgFnosZy98pYnA733L/nO13zj7wODc1qDImfXPb6pj4gTfFaK8N/VceOdzk11jIv7763LLtwlz6Rl8+kpcSKbagJ1l+hIw8MOHhVOLeXqDk5arXOTn98WoQ03gQBH4Z3MiuAtBJR9PPBm2jzRcadg6Io9+uOrcSELN9kw7mNY2PpTQy+EbTpLEpzpSGWUfF0eTyCua0v08NLlM5FhQTmkAYqVMYYcpvszLYqLat1KOiLD6wU1mYsWED57lhXDYVrWsoH2BMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 02/12] libxenguest: deal with log-dirty op stats overflow
To: Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <46831816-a5f2-2eb4-bb91-aba345448feb@suse.com>
 <5e725a42-953a-c96f-3e72-f0c741b0ce16@citrix.com>
 <4e3afc8e-1ed8-2e27-b583-476d35352efd@suse.com>
 <20210628131022.3f2f2c4b.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e90f06d-9410-4778-bf93-61940bd95456@suse.com>
Date: Mon, 28 Jun 2021 13:20:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210628131022.3f2f2c4b.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P189CA0010.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28a17943-a217-40e8-7b8f-08d93a26afa8
X-MS-TrafficTypeDiagnostic: VI1PR04MB3119:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB31197353B3B2CBEB740FC1D0B3039@VI1PR04MB3119.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o8eyuVM5XuvGMs5VcrhjW3WCPu2RdtcfsBUoymp8a1uVPlkjqDLIr2bpvB+0NKk2srQjM1Ru69Zrh+DmRhjqWYxZvkvGCGanYPkL0ys/qwxjJFmq1QUDNAS2XV4UraFK4/eymoPDgiZ3bu3hIobT0pWIscL+yU6QMGQFL+HZu9/TsXkF1BgP5Bth/8mGk1JnxDsdv7kT5swSu7rB5tCgvsvfObp/3e4yGqz2W2z1iHhGP6m0vuQleD+kixzb6JPd5V4Z5g8MBDQHprqUp8mQc3p2ZhPOklTLCqIY5AGfRRQpJJwGocBhZ3+fsq4pAL1CSPMr0BECWB0Py1qTqM+PuH6/V/Ck7ypdgEaZ+6+pdpMVLKD1Rxps6nDozs7ruejjjaF662HSwgaaCa5DqzVd0o+DomtvSULdJQYMZkqDgv/Z1ETRIZ8Du13e/jMfsU3pOndis0EyUsiKMg+22RGa5iJNzAY2SGSxyGH6zKw/J3PCnaRIw0rV5QJKaEb70REK+vTRGaiMYpv47wSd3J2dIxKIGOxHTlRczkYQYuQfuYMRaf2ATdTBPwcm6iXvO7tNt5LhiBF/Ge0uswWpn//ssw+7MMuI4di+VHV/zPyv/o0GFXqw9lHAjIN4E4AVpZrzSX4vVWAa0SEEgqfQvtfFcmZFT1/yT4uj53nctHpgjRpuHkyIN5t3ypcuSlbx6IJrQ2a/I0Dp6LhLWsq6b0jYjCHdhfblmiOGRsCa5cNLh9rBQhhQ9YN84hmgzYvkDPxnybgTl2Wvr/y0x/i0wYhgRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(346002)(136003)(376002)(396003)(38100700002)(2616005)(86362001)(186003)(4326008)(956004)(8676002)(6916009)(8936002)(54906003)(31686004)(16526019)(53546011)(66556008)(66476007)(2906002)(316002)(16576012)(36756003)(6486002)(66946007)(31696002)(478600001)(5660300002)(26005)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?KS9Qfd8QV2DWKIzvB3at3mm7o44jM3jKD8geG3DXIZg9WIix1NyRakfv?=
 =?Windows-1252?Q?IP6LNgvaxIOFb2aGiAWuJqjvSzwKngalGAUOLwWMRWbsHFwTZorPCymJ?=
 =?Windows-1252?Q?I0hVFofH65J8OOlDYPLuNmIH7OZVKSyaJbWwcrQR4ddv7SIFXJyPZQGd?=
 =?Windows-1252?Q?nTpIAm5hNwWqcMqFhetmxzEPl7C9nSVqs1jHumMZedvdvLx29vqMN+91?=
 =?Windows-1252?Q?fhNPkPxOt0vJbzGJWQW9Y2OxkP7C6VHuWcyeZ29F9t+HF/NX0WzUbK4t?=
 =?Windows-1252?Q?hbK+Wv9/ngfCs4XUvOQpIdreBeZOiwM63foPLfBehIxY3QfLbfOSnknb?=
 =?Windows-1252?Q?DWWyhaGeKmz7KSglGHkGv54TZ6hrODk7NOQ2gO35iNNcIZplWyks6F1A?=
 =?Windows-1252?Q?QfaDH0FDHq99A2/mk5xnhYC2PRg0nVmWpSBiZvCJ2yF7YL7b6zCH5wQz?=
 =?Windows-1252?Q?yU5j4vkx6Z4Mw1V0ttnPadB1h4RFFdqcqYVE+LS3un1vHBFJHE3Boze4?=
 =?Windows-1252?Q?GeJpxbrgwMpNbH3w7x8YjIKXsx6YOP937XWquc2Zm/x2vMgQonjyUxub?=
 =?Windows-1252?Q?P2TI8gLaacc7+5sC975bfEIrfj/B2M/tsvHbzsO2yNPcAjoqbbDmcYyf?=
 =?Windows-1252?Q?Qh1UMjIUJT3PTLOrHdk2BAAVHjOGvdBLkgBdXH+BKXzddZSzB3sNuEtI?=
 =?Windows-1252?Q?G74opBg38MjcCRil9gz9bdP6rYsHJh0VZIXvDQ8taIjV62GAFEE+UneV?=
 =?Windows-1252?Q?G/Zp2SSDEDcqY/eXY/U/IG+8ArHqYkXpDI/rgIQrGisul4k1kJFZAp1o?=
 =?Windows-1252?Q?NuB8F7AG+Ny5oJgk4p8PaOCXyoODahDo1xpPMi1zbdeaqIszi/sTNVMp?=
 =?Windows-1252?Q?ixLe2IA00Q18rA2lD7PWcC2BxSX7YIsfhZqq/kUUTvm+EOhYXP4l0Kcm?=
 =?Windows-1252?Q?68SHpG0qfAJtKd4Gahi7YWTxcVVsoFzNB21QS3UA2eTO2O16DfktKP7a?=
 =?Windows-1252?Q?GPNeJ7YpAEP1MeyBnV2JLYyAM3JCGvVUyo/YWpNC69t04f+kTijBBFaX?=
 =?Windows-1252?Q?8Z9jdruPRlEtVnm0Go49S1ni0Iv3hVPlTuVd4RH+eV9maCmTkyuqJB/u?=
 =?Windows-1252?Q?wQaBqV3ftIgSNUshvTmMkDQEsk7e+L6KddC2SYXbAMXCFAm13SExKSHO?=
 =?Windows-1252?Q?52vjv9xiMZDKIzZgKCKD5ckQMPg/VhxxgtuH5y6Msg8F+w9D00AXp7TQ?=
 =?Windows-1252?Q?eHgAmffEW0kiWUCCcD7ppWy85LbD0rxJhRHeEhkWAUFEeK8ccGZKW4Bv?=
 =?Windows-1252?Q?DFkpUWbgFfVVPP4V2EzkmnbIKMRmi+mxM7oKbFxyn98wouiPextw21BL?=
 =?Windows-1252?Q?PqPxhCL6fJgSfGi5ihQg8TGjbERk+VhZkozMaZK7+0sd1TswBAmaxi+S?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a17943-a217-40e8-7b8f-08d93a26afa8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:20:08.1747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Tv0t3JUuK4vRZRqZ6S/r+3gooJax3X6N9li7WpwwSikkVEYqwc7/W29gzOrs6Qwsqap+dlJ0DnkAMsXBiSWaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3119

On 28.06.2021 13:10, Olaf Hering wrote:
> Am Mon, 28 Jun 2021 09:48:26 +0200
> schrieb Jan Beulich <jbeulich@suse.com>:
> 
>> On 25.06.2021 18:36, Andrew Cooper wrote:
>>> This is an external interface, and I'm not sure it will tolerate finding
>>> more than p2m_size allegedly dirty.  
>> But you do realize that a few lines down from here there already was
>>         policy_stats->dirty_count   = -1;
>> ? Or are you trying to tell me that -1 (documented as indicating
>> "unknown") is okay on subsequent iterations, but not on the first one?
> 
> precopy_policy() gets called twice during each iteration.
> Last time I tried to use this API it was difficult to work with.
> It is required to look at dirty_count and iteration to see the actual state.
> Maybe it was just me who initially failed to fully understand the intent.
> 
> I think as it is right now, the first run with iteration being zero is
> the only way to know the actual p2m_size, in case the consumer really
> wants to know this detail.

But if a field named dirty_count was intended to convey the P2M size
(and then only on the first iteration), this very certainly would
have needed writing down somewhere.

Jan


