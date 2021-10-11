Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589824293D1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 17:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206262.361788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxa3-0005v9-EW; Mon, 11 Oct 2021 15:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206262.361788; Mon, 11 Oct 2021 15:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxa3-0005sG-Ay; Mon, 11 Oct 2021 15:51:11 +0000
Received: by outflank-mailman (input) for mailman id 206262;
 Mon, 11 Oct 2021 15:51:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZxa1-0005rw-W6
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 15:51:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ca6cd70-2aab-11ec-80e8-12813bfff9fa;
 Mon, 11 Oct 2021 15:51:08 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2056.outbound.protection.outlook.com [104.47.5.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-rlXCGxUJM_iH1GPNbzeAMQ-1; Mon, 11 Oct 2021 17:51:06 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 15:51:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:51:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR01CA0059.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Mon, 11 Oct 2021 15:51:04 +0000
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
X-Inumbo-ID: 0ca6cd70-2aab-11ec-80e8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633967468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6pY2P/nrLuMTsZOtDYHqZmV+d11uy+BDQ5PaYZ2xwlg=;
	b=KEnYXDaDBLInzMygpA8h6bzswMzSau0gcI+9ZegPIu/sGK4Rsn2+or6vpuU0NvJLzE3arp
	cMbUXnvb4G6dK9lY26pmFB+c896gmsTiYpqtZeeuthSVVKBevHfwI0OJXFCbVh2QEKfNYj
	YVhmQ4HeWBtjtfi3+kRFqxmb+rf7HU4=
X-MC-Unique: rlXCGxUJM_iH1GPNbzeAMQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSq/WzIb0w92IsRicVqnxIigdXNgRaWhbV5tHdvmd0vqQ9l9icvZDF3DrS8UjMxBCurAuGNNJX+Owy2e9+37zqnVXsw5hhFuMqAGNkJb1bMd6g5gcPqwtf/5Ar/RAs547ITUHLT7XarsC8yaaiuPaaXnHJO1NQ//0Do8HxTXYL0g6uUeKN6vks2WfngxhUuwgvJek3AsfW/yqBQbbakwH3DOPlMHEM+xn17qWIXJCCYZi0YTmSkEhhiIkeLVFRp1lboQAsz2+uKsLcv41/EXDxh2WhF6YbNLLXYdJJzIZU26J11SbDkrJh/CWSu0eSXCMbcCD8r7cWjRIeDBswWg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pY2P/nrLuMTsZOtDYHqZmV+d11uy+BDQ5PaYZ2xwlg=;
 b=OuI6LOrG23RFEqiYeO5epkQdrWWS5/WTaq+8WkXq2JyhmHfZfH3Ea28309D5aUneGN57J4e0AWcfdUh8mL1XsqlcBXOpSTYoaswh/Mgs7kN1n+KwE3/bgb8qJYDYfoXkZptXKnS3WeT7vgpmWlByXDgbKLQtEgn6rOStXVvuFInaVhBRenEJyhGzwKohMwi69ODtSB/5NIb8sQv8wM8iUpe5ktFIY56CMz/VFhLqJW5GMhavCAGjYrWQHLQ51hmv1twJRRO1AI6dXHsIOWik2KKy2Ckpk/5uWFp/pL/S2oa1RTiRJpERVS14/yMABnBEuTjXPgwIYEQlbxF40eNHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 35/51] build: Add headers path to CFLAGS once for
 all archs
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-36-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7504f352-1bd9-9912-4d62-923fbd161bf2@suse.com>
Date: Mon, 11 Oct 2021 17:51:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210824105038.1257926-36-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1db797b-3301-4b89-f837-08d98cceeee8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606AC111E0D9FA130556B10B3B59@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QvIk7bYJ44kThCFTQYDwJpGCSK9fmS424a1/w3MfFhLGQEdbsqq5OFZKcrGH3tkEBnzFW4rnP2bSdY5CO3fLUoE7GQYL+S6Ths0cowBJj8i+ZVjd/2Mcsll8JsG7IktkZ/naFieS80+VUenaAtaqsgnE4zAUxr7Xo0uI4ilGYqih0dGXQERC3zksYnwJRQCFllt/Q2BX6nb53EUbrMwLUl6J1+BVaUsS3HdAt5Lx6Nwi3EW3u3piZL1B5zXPFfhuWavgluRznZin7uAZNw8P6I3X42JPcgVxPShUsMAbfIMXsAOkLIqbZkH2AheukTtO7fmViTSV/exZ3UiS3yfSsiDzMIcpoMkuSO4U82LFT95P47XNC8oqXMUdjUlXb77EXEI0ARGYIwNb97Yu2nPcVlHYwdaIdHAaXGnDRBv4LBna7gvXTwzqPIvF1Q446p1T3BnmBVS0q9hPYMnLu8fs6EGrKOqE6wzzkNi/MeuYWPdZ5fsigYevH9O+I05oLLxRtqJ/uky425WLKa83L4I5qFy7xLt1X03/oSb61jkfiIejLy5H2IINw8TEh1bpOBOl+mBJKicC2rSQHvC6K3GPsWOtGo2FrE4NBFYViW/FuNFMLAXtpWoi07j7/VJkwsAvIoJvl6WPZZ3FLKJ8o5VAivPwNPh/w9DN2yq0pY3j5DMga/59TxxqmccZ4klaFM7cIIBfVg3Kz2qBVjcfyXkQOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(7416002)(558084003)(31696002)(86362001)(186003)(53546011)(4326008)(36756003)(316002)(16576012)(8936002)(5660300002)(508600001)(26005)(956004)(2616005)(6916009)(54906003)(31686004)(66556008)(66476007)(38100700002)(8676002)(66946007)(2906002)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkxuVmxqblFhaU9GRmdRZHJsVG40ZzdET25uT3Ixa2EyQVNzVkdsVi8rRXhm?=
 =?utf-8?B?K2lsKzNtbXZ3SUNvOU1LQitlRXBMMkY3WWY0SXE0akNuc2U3SDlMOE1vWHc2?=
 =?utf-8?B?OUJDME5IMTEwY0E3QzQ2MS9sWnhWOVNFUzFrREYwbUVYbDdyTkFlUU9KN2t2?=
 =?utf-8?B?Z2trRExtSHk1R2xQU0s0VERXb2JEOWdSdVd4NHM3TnhzL2RCSXhFUk1CczZL?=
 =?utf-8?B?aEpYZmVldDhZT2kxSk4wWlZEdnlISEVoV2FrbUhrem1PWjFwWTgvZEVFTFZw?=
 =?utf-8?B?OVVyeURlL3hSZmVHbm9Ha29LTTZ1cmdsMnlZV0J3Z0xrdjErcVVrTFZlQ25h?=
 =?utf-8?B?TFRkaTJQT1ErTVdMUHFSSXh2Tm8xcFRZUVEya0JIVlB0aWY3YnJDU0ZZWmVB?=
 =?utf-8?B?enJBT1VWQjlLMFgzVHJXY1VUNURZSEtqMFhxTXpLeW9jQ3htTWZOREJ3YWVC?=
 =?utf-8?B?QmNXcEJvMlFlTnpVV1dQb3lpaXFkaEd0dVpNY3RkVGhkZFBRQkFYWVViVTEz?=
 =?utf-8?B?VTA2bzlTeWZuMmdwZFc4dmRnei9xYVlXUVZVMnlIMG4xbHJnQXRCRU8rclpH?=
 =?utf-8?B?WU9YZldPOGMwUjVnV2p4Wm54YW1WZkdwZUNxZUw5dnovUExZcVJEQ2RoR1I3?=
 =?utf-8?B?NEQ5S2JiZmkyaTlqcFZHTUhtL0s1TUVvbXV3T3NUMktiZ01iRVBlQlhmMDFX?=
 =?utf-8?B?aWlvNGdUeTVYUE5weVVCZ011TnBWWDV1d2RkcmhzYUUyeksxNW9hOVpRdklj?=
 =?utf-8?B?a2NobjNVL0tKZ0puMVdkdXBMaVpFTHg1ekJwV2xydGY0SWh5aWpJbFUxTFdp?=
 =?utf-8?B?WE5SNThJWjhyZGtZZjdIcTRhR0NQblpPVEcvREwzT29BUlBXYUJRY05xSU5K?=
 =?utf-8?B?b1JuR25KOVJqVDNpeUNicWc3RkkzM1MwNFZLT1M4STZwRkthcWZWbms3dkZt?=
 =?utf-8?B?RXlsT2NaOFU5N2hmbTNLSVlVUEw4UVRIcjZ0N3lhWWpGdzZ6RFpOMlpra3o1?=
 =?utf-8?B?T283WkFNR0JxRXJsUzIyOVJtK1Flczc1cXdFSExaZncwMDFlQ003dVBWMTdC?=
 =?utf-8?B?Z3Z2dGhwV3NTbWt2b1VmS3UydWgzck5pRGF2VFVPNXIyelM3ei9SMEw4em93?=
 =?utf-8?B?YUd1MTdjZ2UwTUduTUNlT3JYeWcvcTA2SGdqS1JOalN4MmpYRW5tU1dqMUdy?=
 =?utf-8?B?T0JmcE1rQkNJc1dJUDUvUlVhK2FkQTArUHdpYzVTbTdOUDlSanU1L3RwRGhn?=
 =?utf-8?B?NUZSTGxqdlVBQVVWc2o4dGdob1lyeUJwaE5FWXlmN3J0QnhmSlBYdzNxOUFz?=
 =?utf-8?B?UXNOTkdTNWhQb0dFdUphNkJZVzRQT2lZYk43VitrSUtNRVJhZm9KNStVZGFP?=
 =?utf-8?B?UVlwZ0NDTldmNllZYm93Y2FLN2YxVE1SbmkrNXlOdEJIQ2pzOStiREJ6SkNE?=
 =?utf-8?B?VUtGbDhMamlqUVYvRVl3KzlWY2NyOGVhVkJaSjJpWE10bHNNQ2J0Zzl0K0Zr?=
 =?utf-8?B?cTIraWlkTEx5N2hTK3FUWEdyYkwwNk1zR0JqSzNiNGMwelg4ZUhZMXRHWnY5?=
 =?utf-8?B?Q2ZESlR1YThpMGx4S1lRcVJhSEZ3Um05aGFwejNqV25pbGhzdDUwWWs1ODJx?=
 =?utf-8?B?VzBlNEJxZ1ovbmFScWNIWTVSQTNNSzVIZlpRTXZlQlRPeTdtdUlvR1FRcktU?=
 =?utf-8?B?blh5TjlkVlJhN1dHbmY5NW1sakpnZzhpVDFpY3c0Yi94MUcyS1lOSmVGOHB4?=
 =?utf-8?Q?1rl+waiBK4tFQqCixwN/cR7q69SX5rRrlYVGpxR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1db797b-3301-4b89-f837-08d98cceeee8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:51:05.0092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GA7f9r34HuCKvUkfaCxoAkcLQeOANdilf5qUXLNT3beYhFCW9GSCVYKGaWeh3LM5VS+l6OEPN8Uf/E0cHAbsyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 24.08.2021 12:50, Anthony PERARD wrote:
> This just remove duplication.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Ah, here we go.

Reviewed-by: Jan Beulich <jbeulich@suse.com>


