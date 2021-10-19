Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C03FC43353A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 13:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213081.371196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnlW-0007Dh-Vc; Tue, 19 Oct 2021 11:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213081.371196; Tue, 19 Oct 2021 11:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcnlW-0007Bu-Sa; Tue, 19 Oct 2021 11:58:46 +0000
Received: by outflank-mailman (input) for mailman id 213081;
 Tue, 19 Oct 2021 11:58:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcnlV-0007Bo-Im
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:58:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8440162-30d3-11ec-8310-12813bfff9fa;
 Tue, 19 Oct 2021 11:58:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-JWtOaqJwMuOJ__xEu6-qAg-1; Tue, 19 Oct 2021 13:58:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6477.eurprd04.prod.outlook.com (2603:10a6:803:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 11:58:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 11:58:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR05CA0036.eurprd05.prod.outlook.com (2603:10a6:20b:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Tue, 19 Oct 2021 11:58:39 +0000
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
X-Inumbo-ID: e8440162-30d3-11ec-8310-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634644723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e3t5qAKT9NWcAOGqvmaO/tEUOVCc1dM24pv3gFcBevs=;
	b=jjjSb0yS3bnqoELdHMp/+x3ua8MFJrkgVR9n0J5TDDC+CZkBM8smZ87kAAYiPtBuLHI6eJ
	MUPJ0alOgjrDIhb7sZBDKwveZUCz4Gr5Bcjnqbj36AdrIWJrY5hsXbCwbaIdhHmLP7Jkmp
	AazSG7WYZ3IsTPl38u4PYnEgFRhhNm4=
X-MC-Unique: JWtOaqJwMuOJ__xEu6-qAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j85tR9HGhBnQWOeBcNcMSMW2y3WSoWhl/pYtpu+J/2tYSMusjitli+zf0uI8hFmf5JE8t+Vitb5Mcs/A6/NHzTwqAs+hf91ty7IHu3Hthpc+F9Cxi7Lvvvc6awvbzR2QUrj1xqo5m9XSnC+VsQ0by0XjFnL/NOseeXKorXhVYN8Li7nS28ghm5xyE0MdNPsw5PPxSzHmppiVetTRHQ1QFslLTlbb4sWEPsqOw1kRsZu68ey7lLMenrpvHAHL5ndwsVyIZaC1Oci0m1xqr1OhcX5aatIsrDEVdccAqsAw1IzPFd0CDRybEBkyAThVIAOaGFIA3DfrSxCJQ8wpQBHKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgyosl3QygnUlkHnRHQyRCmYyM6G4bogLBtPNqF/C+c=;
 b=GOsfBdvQNetY/1IMeGM67240mCYsatjuMpLqPCJDQKJufCi0treUlo4/2HqL/f67RtmpG3/feP0InRtkYX3riyG3McX9H3BRgQiYBilnqvWBIPSmbZ3inv7vdo4/gO9fQm5qAdRzqJdrytpk2fPWKsPIaLa8BLQQjB4Gu6acGC5HRBshMFjSnYOyG38gdO4YnLQUT9FQTr0g2zyMCt1OEtyzToylrrVdfjtuMlKkE3Qvf6KKLAxLFJ3W9Q3PIrXORubBCv3WjefocYWNB0YR/U6sW5uXFptELoYC9tvHuxYaL4jiPGTZzrRBSbfcnaDeF3ANoVqWEYUj/9KcoKHp7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] x86/PoD: defer nested P2M flushes
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e47d51c6-1b4b-2f72-6e12-070df66c30e2@suse.com>
 <YW6g9w9XeWKsxYMV@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e444a8b-58e9-ea37-0e22-474e430be5e5@suse.com>
Date: Tue, 19 Oct 2021 13:58:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW6g9w9XeWKsxYMV@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0036.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ce63965-45d0-4545-c1ad-08d992f7ca88
X-MS-TrafficTypeDiagnostic: VE1PR04MB6477:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64770B72B4DCECB5AC1E93A9B3BD9@VE1PR04MB6477.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wWjD8Hf8g8Ck5gMMj2lwkOV1KmpiMGDudPW96BkAXHSwoqO92gf+b0Xr3lzkHTKmekVYEG1igKqBGWOGKo7o0F352wa2qG/IRMCox1FP+Ue9JmkLFYPUWhn1ttfyNQ5sCgKNsOBc6IGN/VU6g1oniqu8KwQyV7KIJq61YGKpjssPuXbDyPGOcaAlcN5EO2ZKQWC6duWjn6p5S7PDGkwD1QW3MkEBENXeFLNJ+II9rijsCDg60DM25q7FStP8wxX8R0Fk/kY4bfO//RUe9t/LyZRS0m3VG+Nw/5ANJCvj2xc4RUeWSnHQAwvZPmgHGsKkzO1aWHY3zpIivgIbWHMOHZID+XKaXKNHqQMR2lUGNJZeRB2bWHi8KxLca0FZpKIh2U7gMVFCLPYu/IKIGPKDEr05efB/VYRNsyjscRPH1R8XO5Rb/tyChpWklif+JEe2/tKST8r8ohQQ1kzMOcvQzMkYlYP8FvEVVbHPCyYCGAWF2MlyCPy/3AzmLt0Eal4eyZHkicX7UMRAYh21PUyOBm7qYici3wqFq3lzQgSAua+W4MRAR++i5bk8vQc2Tkp4C2myCA+dt81Yy7u9trFU9oGgNu9/m43fFAo9WEqjvleWrHnYEDWUwUjBqLBEulbG5oC6E2m0yt2xSmf2oPxCSadmYAeDkAQdR2bUNFBxUPn9zNS1++EYuXErUUpLv+zW7X/Bax5EWiJRWJoTP5gXgwKcMLcZNfXW9wOX2yNL2Pw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(8676002)(66946007)(66556008)(66476007)(86362001)(508600001)(956004)(31686004)(53546011)(5660300002)(6916009)(26005)(8936002)(83380400001)(186003)(38100700002)(31696002)(6486002)(36756003)(2906002)(316002)(4326008)(16576012)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?929CfyPDD9i1gJVwtKaKG3nK0fhgEqmvbGXnA5tnbIfzvLxlpDZGVfwSj6KT?=
 =?us-ascii?Q?fS6lQzMpAxmj8HoU3r9HtEsJY9Lv3VA1wleeCR8nPzsdzBqKKcFz5dvegb86?=
 =?us-ascii?Q?D4Q/4eSB6INekZdzq4SJonei81cInl8u/7V3xBs6dUr2cp2ijivIepyBX1rl?=
 =?us-ascii?Q?u6UYbKSnMSKBUnYd1wewml929PKlwCMwL7HK9Bbyjoi1YZi1asriCPr8idlv?=
 =?us-ascii?Q?TaUchsHQkccljLtaGf+ZZXXYvY779aTTVD4+6vvAzI5WPNG0AquspU4SIRfn?=
 =?us-ascii?Q?oVPlabh1y8HzUMkb/bG9DizE8pzZ+lmN7QHp6Pq3VNkX+Ug8DRSQXX3SzN1E?=
 =?us-ascii?Q?tdl824P0vNees9jKhn3MHtAwrBfeiNKXimh4l/ocGGht82soIDzwSnErFi1r?=
 =?us-ascii?Q?gIYyV/Mg6UevcbdSvRRy7LWfFIHi57oiyGeX0mUxMcNrr/gz3OYEwasSj6I6?=
 =?us-ascii?Q?deGyr+FZcXzH/foVjbYacoDia2xULhJg9VGZ7XqCJtEKkrU7A/o+2N+3Ex7u?=
 =?us-ascii?Q?xT042f8+JDFbWk7sX1fjXRidre31oDlnNwPoJesaVE8J76cxqLh92CRGbmH9?=
 =?us-ascii?Q?Vy2WWELBQNelqfXDz3sfmfYJM7hu4rPgaBmljzOcvbOceC+BxMjRaWn38njG?=
 =?us-ascii?Q?lXDrjpkcIHhpH/vVQ+IBMAZ6/pM9ZMIc38c6GDghp7+GDkOJOZyIzTAf33n6?=
 =?us-ascii?Q?TyNnlYWZ01o52ZDM2TCeHZseNcgJZFfT6WWdykmiQLMY8U/qptW7c2XGOdeh?=
 =?us-ascii?Q?LvrEe/k+o7sxu6xhFVYy5ZJOEw9xUBtzlT1/k9ael2AjHyUKX0ghsFqRbVSE?=
 =?us-ascii?Q?e90XGKRJs+78bqvOElCb3KP2g3oO82ZkiVKg/LB1Qf3acZ4EPneUxSsukrnd?=
 =?us-ascii?Q?AQjmKVjSXQfMMtUY9nJxKY89GAiEpTBvvixVxs2mxyNfIELgzXmDOUw5FjrJ?=
 =?us-ascii?Q?F7NU/H3CCTd1r/hjs9hXYulB9TVlH4dqFJ7KgEwMCHDYWZYI0jaQb1k9T/0o?=
 =?us-ascii?Q?/T5haOVzLQvbTxWwWp1VW9H5LAwQbEH5X/A0a+gIFislCP8b94715DMf7YOI?=
 =?us-ascii?Q?bMiwbyF6XxBvOsqC4zStbo23dPoC5RvkWOqshugfAVcitszCiteJxGG8i+HG?=
 =?us-ascii?Q?3Wk+l5qqoC9JYGM0RHJ8O0LbEVh6RtMklguj4bhA98YwKuMM8x2YTKiTzqWO?=
 =?us-ascii?Q?iZL4LI88WKzoOTJfp8T3BRNz+GekP5e7pOYvTym+cLHb3FYwb0s0h4KN2U7y?=
 =?us-ascii?Q?MvdHVXfOkEaTR8XPdiy8DbF1liACdrwQ/OYPnq1IqlfXRZT5OGrrPpigv2K9?=
 =?us-ascii?Q?1ZkABwJ67oo+1ZuWdTXF/J5m?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce63965-45d0-4545-c1ad-08d992f7ca88
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 11:58:40.3612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PR1T47Eq6w+ehXkifTeziQMs/xgmvZBiqGWrz5K9AyTUgaJ+stAj/WObk3wFX2OKBgZp94HRspKqI/WHvqm37g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6477

On 19.10.2021 12:41, Roger Pau Monn=C3=A9 wrote:
> On Mon, Oct 11, 2021 at 10:17:08AM +0200, Jan Beulich wrote:
>> With NPT or shadow in use, the p2m_set_entry() -> p2m_pt_set_entry() ->
>> write_p2m_entry() -> p2m_flush_nestedp2m() call sequence triggers a lock
>> order violation when the PoD lock is held around it. Hence such flushing
>> needs to be deferred. Steal the approach from p2m_change_type_range().
>>
>> Similarly for EPT I think ept_set_entry() -> ept_sync_domain() ->
>> ept_sync_domain_prepare() -> p2m_flush_nestedp2m() is affected.
>=20
> I'm slightly worried by this path because it doesn't seem to
> acknowledge defer_nested_flush.

Oh, yes. Iirc I did look at that logic, write down the remark, and
then forgot to add the conditional to ept_sync_domain_prepare().
The interactions with the real (host) flush are kind of ugly there,
though - we then further depend on the ->defer_flush / ->need_flush
logic, which is EPT-only. But I think I've convinced myself that
this ought to work out.

> Maybe the flag should be checked by
> p2m_flush_nestedp2m instead of leaving it to the callers?

I'm not sure this would be a good idea, as there are more callers.

Jan


